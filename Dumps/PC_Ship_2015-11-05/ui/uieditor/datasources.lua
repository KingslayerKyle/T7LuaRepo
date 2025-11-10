require( "ui.T6.CoDBase" )
require( "ui.uieditor.modifyFunctions" )

local f0_local0 = {}
DataSourceHelpers = f0_local0
f0_local0 = function ( f1_arg0, f1_arg1 )
	for f1_local3, f1_local4 in pairs( f1_arg1 ) do
		if type( f1_local4 ) == "table" then
			f0_local0( Engine.CreateModel( f1_arg0, f1_local3 ), f1_local4 )
		else
			Engine.SetModelValue( Engine.CreateModel( f1_arg0, f1_local3 ), f1_local4 )
		end
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg1 then
		return Engine.CreateModel( Engine.GetModelForController( f2_arg0.dataSourceController ), f2_arg0.customDataSourceHelper )
	else
		return Engine.GetModel( Engine.GetModelForController( f2_arg0.dataSourceController ), f2_arg0.customDataSourceHelper )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4, f3_arg5 )
	f3_arg0[f3_arg2] = {}
	f3_arg0.customDataSourceHelper = f3_arg2
	f3_arg0.dataSourceController = f3_arg1
	local f3_local0 = f0_local1( f3_arg0, true )
	for f3_local5, f3_local6 in ipairs( f3_arg3( f3_arg1, f3_arg0 ) ) do
		local f3_local4 = Engine.GetModel( f3_local0, f3_local5 )
		if f3_local4 then
			Engine.UnsubscribeAndFreeModel( f3_local4 )
		end
		f3_local4 = Engine.CreateModel( f3_local0, f3_local5 )
		if f3_local6.models then
			f0_local0( f3_local4, f3_local6.models )
		end
		if f3_local6.properties and f3_local6.properties.loopEdges ~= nil then
			f3_arg0.loopEdges = f3_local6.properties.loopEdges
		end
		if not f3_arg4 or f3_arg4( f3_local4 ) then
			table.insert( f3_arg0[f3_arg2], {
				model = f3_local4,
				properties = f3_local6.properties
			} )
		end
	end
	if f3_arg5 then
		f3_arg5( f3_arg1, f3_arg0, f3_local0 )
	end
end

local f0_local3 = function ( f4_arg0 )
	if f4_arg0.customDataSourceHelper and f4_arg0[f4_arg0.customDataSourceHelper] then
		return #f4_arg0[f4_arg0.customDataSourceHelper]
	else
		return 0
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg1.customDataSourceHelper and f5_arg1[f5_arg1.customDataSourceHelper] then
		return f5_arg1[f5_arg1.customDataSourceHelper][f5_arg2].model
	else
		return nil
	end
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	if f6_arg0.customDataSourceHelper and f6_arg0[f6_arg0.customDataSourceHelper] then
		return f6_arg0[f6_arg0.customDataSourceHelper][f6_arg1].properties
	else
		return nil
	end
end

local f0_local6 = function ( f7_arg0 )
	local f7_local0 = f0_local1( f7_arg0, false )
	if f7_local0 then
		Engine.UnsubscribeAndFreeModel( f7_local0 )
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5 )
	local f8_local0 = {
		getCount = f0_local3,
		getItem = f0_local4,
		getCustomPropertiesForItem = f0_local5,
		getSpacerAfterRow = f8_arg5
	}
	if f8_arg2 then
		f8_local0.cleanup = f0_local6
	end
	if f8_arg3 then
		for f8_local4, f8_local5 in pairs( f8_arg3 ) do
			f8_local0[f8_local4] = f8_local5
		end
	end
	f8_local0.prepare = function ( f9_arg0, f9_arg1, f9_arg2 )
		f0_local2( f9_arg1, f9_arg0, f8_arg0, f8_arg1, f9_arg2, f8_arg4 )
	end
	
	return f8_local0
end

DataSourceHelpers.ListSetup = f0_local7
local f0_local8 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = {
		getCount = f0_local3,
		getItem = f0_local4,
		getCustomPropertiesForItem = f0_local5
	}
	if f10_arg2 then
		f10_local0.cleanup = f0_local6
	end
	if f10_arg3 then
		for f10_local4, f10_local5 in pairs( f10_arg3 ) do
			f10_local0[f10_local4] = f10_local5
		end
	end
	f10_local0.prepare = function ( f11_arg0, f11_arg1, f11_arg2 )
		f11_arg1[f10_arg0] = {}
		f10_arg1( f11_arg0, Engine.CreateModel( Engine.GetModelForController( f11_arg0 ), f10_arg0 ), f11_arg1[f10_arg0], f11_arg2 )
	end
	
	return f10_local0
end

local f0_local9 = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = CoD.mapsTable[f12_arg1]
	local f12_local1 = 0
	local f12_local2 = 0
	if f12_local0.accoladelist then
		local f12_local3 = Engine.GetAssetList( f12_local0.accoladelist )
		if f12_local3 ~= nil then
			f12_local2 = #f12_local3
			local f12_local4 = Engine.GetPlayerStats( f12_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
			if f12_arg2 or CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true then
				f12_local4 = Engine.StorageGetBuffer( f12_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
			end
			for f12_local5 = 0, 18, 1 do
				if f12_local4.PlayerStatsByMap[f12_local0.rootMapName].accolades[f12_local5].state:get() ~= 0 then
					f12_local1 = f12_local1 + 1
				end
			end
		end
	end
	return f12_local1, f12_local2
end

local f0_local10 = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	if f13_arg3 or CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true then
		local f13_local0 = Engine.StorageGetBuffer( f13_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
		return f13_local0.PlayerStatsByMap[f13_arg1].collectibles[f13_arg2]:get() == 1
	else
		return Engine.ClientHasCollectible( f13_arg0, f13_arg1, f13_arg2, Enum.eModes.MODE_CAMPAIGN )
	end
end

local f0_local11 = function ( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = CoD.mapsTable[f14_arg1]
	local f14_local1 = 0
	local f14_local2 = 0
	if f14_local0.collectibles then
		local f14_local3 = Engine.GetAssetList( f14_local0.collectibles )
		if f14_local3 ~= nil then
			f14_local1 = #f14_local3
			for f14_local4 = 0, f14_local1 - 1, 1 do
				if f0_local10( f14_arg0, f14_arg1, f14_local4, f14_arg2 ) then
					f14_local2 = f14_local2 + 1
				end
			end
		end
	end
	return f14_local2, f14_local1
end

CoD.XPBar = {}
CoD.XPBar.RankIdCol = 0
CoD.XPBar.RankTableColMinXP = 2
CoD.XPBar.RankTableColMaxXP = 7
CoD.XPBar.RankDisplayLevelCol = 14
CoD.ButtonMappings = {}
DataSourceHelpers.CustomListSetup = f0_local8
local f0_local12 = function ( f15_arg0, f15_arg1 )
	if f15_arg1 == nil then
		return 
	end
	local f15_local0 = nil
	if f15_arg1.activeWidget ~= nil then
		local f15_local1 = f15_arg1.activeWidget:getModel( f15_arg0, "xuid" )
		if f15_local1 ~= nil then
			f15_local0 = Engine.GetModelValue( f15_local1 )
		end
	end
	f15_arg1:updateDataSource( false, false )
	if f15_local0 ~= nil and not f15_arg1:findItem( {
		xuid = f15_local0
	}, nil, true ) then
		f15_arg1:processEvent( {
			name = "gain_focus",
			controller = f15_arg0
		} )
	end
end

DataSources = {
	GlobalSources = {
		getModel = function ( f16_arg0 )
			return DataSources.GlobalSources.Model
		end
	},
	Controller = {
		getModel = function ()
			return DataSources.Controller.Model
		end
	},
	VehicleController = {
		getModel = function ()
			return DataSources.VehicleController.Model
		end
	},
	PerController = {
		getModel = function ( f19_arg0 )
			local f19_local0 = Engine.GetModelForController( f19_arg0 )
			Engine.SetModelValue( Engine.CreateModel( f19_local0, "xuid" ), Engine.GetXUID64( f19_arg0 ) )
			Engine.SetModelValue( Engine.CreateModel( f19_local0, "gamertag" ), Engine.GetSelfGamertag( f19_arg0 ) )
			Engine.SetModelValue( Engine.CreateModel( f19_local0, "clanTag" ), Engine.GetClanName( f19_arg0 ) )
			Engine.CreateModel( f19_local0, "forceUpdateVehicleBindings" )
			return f19_local0
		end,
		setHintText = function ( f20_arg0, f20_arg1 )
			local f20_local0 = Engine.GetModel( Engine.GetModelForController( f20_arg0 ), "hintText" )
			if not f20_arg1 then
				f20_arg1 = ""
			end
			if f20_local0 then
				Engine.SetModelValue( f20_local0, f20_arg1 )
			end
		end,
		clearHintText = function ( f21_arg0, f21_arg1 )
			DataSources.PerController.setHintText( f21_arg0, "" )
		end,
		hasHintText = function ( f22_arg0 )
			local f22_local0 = Engine.GetModel( Engine.GetModelForController( f22_arg0 ), "hintText" )
			if f22_local0 and Engine.GetModelValue( f22_local0 ) ~= "" then
				return true
			else
				return false
			end
		end
	},
	WorldSpaceIndicators = {
		getModel = function ( f23_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f23_arg0 ), "WorldSpaceIndicators" )
		end
	},
	MessageDialog = {
		getModel = function ( f24_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		end
	},
	AccountLinkLogin = {
		getModel = function ( f25_arg0 )
			local f25_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
			Engine.SetModelValue( Engine.CreateModel( f25_local0, "email" ), Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
			Engine.SetModelValue( Engine.CreateModel( f25_local0, "password" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
			Engine.SetModelValue( Engine.CreateModel( f25_local0, "stars" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
			return f25_local0
		end
	},
	AccountLinkRegister = {
		getModel = function ( f26_arg0 )
			local f26_local0 = Engine.CreateModel( Engine.GetModelForController( f26_arg0 ), "AccountLinkRegister" )
			Engine.CreateModel( f26_local0, "firstName" )
			Engine.CreateModel( f26_local0, "lastName" )
			Engine.CreateModel( f26_local0, "zipCode" )
			Engine.CreateModel( f26_local0, "region" )
			Engine.CreateModel( f26_local0, "username" )
			Engine.CreateModel( f26_local0, "email" )
			Engine.CreateModel( f26_local0, "password" )
			Engine.CreateModel( f26_local0, "stars" )
			Engine.CreateModel( f26_local0, "confirmPass" )
			Engine.CreateModel( f26_local0, "confirmStars" )
			Engine.CreateModel( f26_local0, "gender" )
			Engine.CreateModel( f26_local0, "month" )
			Engine.CreateModel( f26_local0, "monthIndex" )
			Engine.CreateModel( f26_local0, "day" )
			Engine.CreateModel( f26_local0, "year" )
			return f26_local0
		end
	},
	TermsOfService = {
		getModel = function ( f27_arg0 )
			local f27_local0 = Engine.CreateModel( Engine.GetModelForController( f27_arg0 ), "TermsOfService" )
			Engine.SetModelValue( Engine.CreateModel( f27_local0, "message" ), Engine.GetTermsOfService( f27_arg0 ) )
			return f27_local0
		end
	},
	Gender = {
		prepare = function ( f28_arg0, f28_arg1, f28_arg2 )
			local f28_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GenderModel" )
			local f28_local1 = Engine.CreateModel( f28_local0, "Male" )
			Engine.SetModelValue( Engine.CreateModel( f28_local1, "gender" ), Engine.Localize( "EM_MALE" ) )
			local f28_local2 = Engine.CreateModel( f28_local0, "Female" )
			Engine.SetModelValue( Engine.CreateModel( f28_local2, "gender" ), Engine.Localize( "EM_FEMALE" ) )
			f28_arg1.genders = {
				f28_local1,
				f28_local2
			}
		end,
		getCount = function ( f29_arg0 )
			return #f29_arg0.genders
		end,
		getItem = function ( f30_arg0, f30_arg1, f30_arg2 )
			return f30_arg1.genders[f30_arg2]
		end
	},
	Month = {
		prepare = function ( f31_arg0, f31_arg1, f31_arg2 )
			local f31_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "monthModel" )
			local f31_local1 = Engine.CreateModel( f31_local0, "january" )
			Engine.SetModelValue( Engine.CreateModel( f31_local1, "month" ), Engine.Localize( "MENU_MONTHS_JAN" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local1, "monthIndex" ), 1 )
			local f31_local2 = Engine.CreateModel( f31_local0, "february" )
			Engine.SetModelValue( Engine.CreateModel( f31_local2, "month" ), Engine.Localize( "MENU_MONTHS_FEB" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local2, "monthIndex" ), 2 )
			local f31_local3 = Engine.CreateModel( f31_local0, "march" )
			Engine.SetModelValue( Engine.CreateModel( f31_local3, "month" ), Engine.Localize( "MENU_MONTHS_MAR" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local3, "monthIndex" ), 3 )
			local f31_local4 = Engine.CreateModel( f31_local0, "april" )
			Engine.SetModelValue( Engine.CreateModel( f31_local4, "month" ), Engine.Localize( "MENU_MONTHS_APR" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local4, "monthIndex" ), 4 )
			local f31_local5 = Engine.CreateModel( f31_local0, "may" )
			Engine.SetModelValue( Engine.CreateModel( f31_local5, "month" ), Engine.Localize( "MENU_MONTHS_MAY" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local5, "monthIndex" ), 5 )
			local f31_local6 = Engine.CreateModel( f31_local0, "june" )
			Engine.SetModelValue( Engine.CreateModel( f31_local6, "month" ), Engine.Localize( "MENU_MONTHS_JUN" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local6, "monthIndex" ), 6 )
			local f31_local7 = Engine.CreateModel( f31_local0, "july" )
			Engine.SetModelValue( Engine.CreateModel( f31_local7, "month" ), Engine.Localize( "MENU_MONTHS_JUL" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local7, "monthIndex" ), 7 )
			local f31_local8 = Engine.CreateModel( f31_local0, "august" )
			Engine.SetModelValue( Engine.CreateModel( f31_local8, "month" ), Engine.Localize( "MENU_MONTHS_AUG" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local8, "monthIndex" ), 8 )
			local f31_local9 = Engine.CreateModel( f31_local0, "september" )
			Engine.SetModelValue( Engine.CreateModel( f31_local9, "month" ), Engine.Localize( "MENU_MONTHS_SEP" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local9, "monthIndex" ), 9 )
			local f31_local10 = Engine.CreateModel( f31_local0, "october" )
			Engine.SetModelValue( Engine.CreateModel( f31_local10, "month" ), Engine.Localize( "MENU_MONTHS_OCT" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local10, "monthIndex" ), 10 )
			local f31_local11 = Engine.CreateModel( f31_local0, "november" )
			Engine.SetModelValue( Engine.CreateModel( f31_local11, "month" ), Engine.Localize( "MENU_MONTHS_NOV" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local11, "monthIndex" ), 11 )
			local f31_local12 = Engine.CreateModel( f31_local0, "december" )
			Engine.SetModelValue( Engine.CreateModel( f31_local12, "month" ), Engine.Localize( "MENU_MONTHS_DEC" ) )
			Engine.SetModelValue( Engine.CreateModel( f31_local12, "monthIndex" ), 12 )
			f31_arg1.months = {
				f31_local1,
				f31_local2,
				f31_local3,
				f31_local4,
				f31_local5,
				f31_local6,
				f31_local7,
				f31_local8,
				f31_local9,
				f31_local10,
				f31_local11,
				f31_local12
			}
		end,
		getCount = function ( f32_arg0 )
			return #f32_arg0.months
		end,
		getItem = function ( f33_arg0, f33_arg1, f33_arg2 )
			return f33_arg1.months[f33_arg2]
		end
	},
	Day = {
		prepare = function ( f34_arg0, f34_arg1, f34_arg2 )
			f34_arg1.days = {}
			local f34_local0 = 31
			local f34_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "dayModel" )
			for f34_local2 = 1, f34_local0, 1 do
				local f34_local5 = Engine.CreateModel( f34_local1, "Day " .. f34_local2 )
				Engine.SetModelValue( Engine.CreateModel( f34_local5, "day" ), f34_local2 )
				f34_arg1.days[#f34_arg1.days + 1] = f34_local5
			end
		end,
		getCount = function ( f35_arg0 )
			return #f35_arg0.days
		end,
		getItem = function ( f36_arg0, f36_arg1, f36_arg2 )
			return f36_arg1.days[f36_arg2]
		end
	},
	Year = {
		prepare = function ( f37_arg0, f37_arg1, f37_arg2 )
			f37_arg1.years = {}
			local f37_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "yearModel" )
			for f37_local1 = 2015, 1900, -1 do
				local f37_local4 = Engine.CreateModel( f37_local0, "Year " .. f37_local1 )
				Engine.SetModelValue( Engine.CreateModel( f37_local4, "year" ), f37_local1 )
				f37_arg1.years[#f37_arg1.years + 1] = f37_local4
			end
		end,
		getCount = function ( f38_arg0 )
			return #f38_arg0.years
		end,
		getItem = function ( f39_arg0, f39_arg1, f39_arg2 )
			return f39_arg1.years[f39_arg2]
		end
	},
	TabbedView = {
		prepare = function ( f40_arg0, f40_arg1, f40_arg2 )
			f40_arg1.tabs = {}
			local f40_local0 = {}
			if CoD.isCampaign == true then
				f40_local0 = {
					{
						displayName = Engine.Localize( "MENU_TAB_MISSIONS" ),
						viewWidget = "CoD.MissionTab",
						tabIcon = ""
					},
					{
						displayName = Engine.Localize( "MENU_TAB_OPTIONS" ),
						viewWidget = "CoD.OptionsTab",
						tabIcon = ""
					}
				}
			else
				f40_local0 = {
					{
						displayName = Engine.Localize( "MENU_TAB_MISSIONS" ),
						viewWidget = "CoD.MissionTab",
						tabIcon = ""
					},
					{
						displayName = Engine.Localize( "MENU_TAB_OPTIONS" ),
						viewWidget = "CoD.OptionsTab",
						tabIcon = ""
					}
				}
			end
			if #f40_local0 == 0 then
				return 
			end
			table.insert( f40_local0, 1, {
				displayName = "",
				viewWidget = "",
				tabIcon = CoD.buttonStrings.shoulderl
			} )
			table.insert( f40_local0, {
				displayName = "",
				viewWidget = "",
				tabIcon = CoD.buttonStrings.shoulderr
			} )
			local f40_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "TabViewModel" )
			for f40_local5, f40_local6 in ipairs( f40_local0 ) do
				local f40_local7 = Engine.CreateModel( f40_local1, "tabModel_" .. f40_local5 )
				Engine.SetModelValue( Engine.CreateModel( f40_local7, "tabName" ), f40_local6.displayName )
				Engine.SetModelValue( Engine.CreateModel( f40_local7, "tabWidget" ), f40_local6.viewWidget )
				Engine.SetModelValue( Engine.CreateModel( f40_local7, "tabIcon" ), f40_local6.tabIcon )
				f40_arg1.tabs[#f40_arg1.tabs + 1] = f40_local7
			end
		end,
		getCount = function ( f41_arg0 )
			return #f41_arg0.tabs
		end,
		getItem = function ( f42_arg0, f42_arg1, f42_arg2 )
			return f42_arg1.tabs[f42_arg2]
		end
	},
	StartMenuTabs = f0_local7( "StartMenuTabs", function ( f43_arg0 )
		local f43_local0 = {}
		table.insert( f43_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if Engine.IsDemoPlaying() then
			local f43_local1 = "CoD.StartMenu_GameOptions"
			if Engine.IsZombiesGame() then
				f43_local1 = "CoD.StartMenu_GameOptions_ZM"
			end
			table.insert( f43_local0, {
				models = {
					tabName = Engine.Localize( "MENU_THEATER_CAPS" ),
					tabWidget = f43_local1,
					tabIcon = ""
				},
				properties = {
					tabId = "gameOptions"
				}
			} )
		elseif Engine.IsInGame() then
			if IsGameTypeDOA() then
				table.insert( f43_local0, {
					models = {
						tabName = "DOA",
						tabWidget = "CoD.StartMenu_GameOptions_DOA",
						tabIcon = ""
					},
					properties = {
						tabId = "gameOptions"
					}
				} )
			elseif CoD.isCampaign then
				table.insert( f43_local0, {
					models = {
						tabName = SessionModeToUnlocalizedSessionModeCaps( Engine.CurrentSessionMode() ),
						tabWidget = "CoD.StartMenu_GameOptions_CP",
						tabIcon = ""
					},
					properties = {
						tabId = "gameOptions"
					}
				} )
				if not Engine.IsCampaignModeZombies() then
					if CoD.isSafehouse and CoD.isOnlineGame() and not IsInTrainingSim( f43_arg0 ) and Dvar.ui_safehousebarracks:get() then
						table.insert( f43_local0, {
							models = {
								tabName = "CPUI_BARRACKS_CAPS",
								tabWidget = "CoD.CombatRecordCP_Contents",
								tabIcon = ""
							},
							properties = {
								tabId = "combatRecord"
							}
						} )
					end
					if HighestMapReachedGreaterThan( f43_arg0, 1 ) or LUI.DEV ~= nil then
						table.insert( f43_local0, {
							models = {
								tabName = "CPUI_TACTICAL_MODE_CAPS",
								tabWidget = "CoD.StartMenu_TacticalMode",
								tabIcon = ""
							},
							properties = {
								tabId = "tacticalMode"
							}
						} )
					end
					if not CoD.isSafehouse then
						table.insert( f43_local0, {
							models = {
								tabName = "CPUI_ACCOLADES",
								tabWidget = "CoD.MissionRecordVault_Challenges",
								tabIcon = ""
							},
							properties = {
								tabId = "accolades"
							}
						} )
					end
				end
			elseif Engine.IsZombiesGame() then
				table.insert( f43_local0, {
					models = {
						tabName = SessionModeToUnlocalizedSessionModeCaps( Engine.CurrentSessionMode() ),
						tabWidget = "CoD.StartMenu_GameOptions_ZM",
						tabIcon = ""
					},
					properties = {
						tabId = "gameOptions"
					}
				} )
			else
				table.insert( f43_local0, {
					models = {
						tabName = SessionModeToUnlocalizedSessionModeCaps( Engine.CurrentSessionMode() ),
						tabWidget = "CoD.StartMenu_GameOptions",
						tabIcon = ""
					},
					properties = {
						tabId = "gameOptions"
					}
				} )
			end
		else
			table.insert( f43_local0, {
				models = {
					tabName = "MENU_TAB_IDENTITY_CAPS",
					tabWidget = "CoD.StartMenu_Identity",
					tabIcon = ""
				},
				properties = {
					tabId = "identity",
					disabled = Dvar.ui_execdemo_gamescom:get()
				}
			} )
			if not IsLobbyNetworkModeLAN() and not Dvar.ui_execdemo:get() then
				table.insert( f43_local0, {
					models = {
						tabName = "MENU_TAB_CHALLENGES_CAPS",
						tabWidget = "CoD.StartMenu_Challenges",
						tabIcon = ""
					},
					properties = {
						tabId = "challenges"
					}
				} )
				table.insert( f43_local0, {
					models = {
						tabName = "MENU_TAB_BARRACKS_CAPS",
						tabWidget = "CoD.StartMenu_Barracks",
						tabIcon = ""
					},
					properties = {
						tabId = "barracks"
					}
				} )
				if CommunityOptionsEnabled() then
					table.insert( f43_local0, {
						models = {
							tabName = "MENU_TAB_MEDIA_CAPS",
							tabWidget = "CoD.StartMenu_Media",
							tabIcon = ""
						},
						properties = {
							tabId = "media"
						}
					} )
				end
			end
		end
		if IsGameTypeDOA() then
			local f43_local1 = table.insert
			local f43_local2 = f43_local0
			local f43_local3 = {
				models = {
					tabName = "MENU_TAB_OPTIONS_CAPS",
					tabWidget = "CoD.StartMenu_Options_DOA",
					tabIcon = ""
				}
			}
			local f43_local4 = {
				tabId = "options"
			}
			local f43_local5 = Dvar.ui_execdemo:get()
			if f43_local5 then
				f43_local5 = not Engine.IsInGame()
			end
			f43_local4.selectIndex = f43_local5
			f43_local3.properties = f43_local4
			f43_local1( f43_local2, f43_local3 )
		else
			local f43_local1 = table.insert
			local f43_local2 = f43_local0
			local f43_local3 = {
				models = {
					tabName = "MENU_TAB_OPTIONS_CAPS",
					tabWidget = "CoD.StartMenu_Options",
					tabIcon = ""
				}
			}
			local f43_local4 = {
				tabId = "options"
			}
			local f43_local5 = Dvar.ui_execdemo_gamescom:get()
			if f43_local5 then
				f43_local5 = not Engine.IsInGame()
			end
			f43_local4.selectIndex = f43_local5
			f43_local3.properties = f43_local4
			f43_local1( f43_local2, f43_local3 )
		end
		table.insert( f43_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f43_local0
	end
	 ),
	GameSettingsTabs = f0_local7( "GameSettingsTabs", function ( f44_arg0 )
		local f44_local0 = {}
		local f44_local1 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" )
		table.insert( f44_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f44_local0, {
			models = {
				tabName = f44_local1,
				tabWidget = "CoD.GameSettings_GameModeRules",
				tabIcon = ""
			},
			properties = {
				tabId = "game_mode_rules"
			}
		} )
		table.insert( f44_local0, {
			models = {
				tabName = "MENU_GLOBAL_SETTINGS",
				tabWidget = "CoD.GameSettings_GlobalSettings",
				tabIcon = ""
			},
			properties = {
				tabId = "global_settings"
			}
		} )
		table.insert( f44_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f44_local0
	end
	, true ),
	GameSettingsCompetitiveTabs = f0_local7( "GameSettingsCompetitiveTabs", function ( f45_arg0 )
		local f45_local0 = {}
		table.insert( f45_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f45_local0, {
			models = {
				tabName = "MENU_SETTINGS_CAPS",
				tabWidget = "CoD.GameSettings_CompetitiveSettings",
				tabIcon = ""
			},
			properties = {
				tabId = "game_mode_rules"
			}
		} )
		table.insert( f45_local0, {
			models = {
				tabName = "MENU_ADVANCED_CAPS",
				tabWidget = "CoD.GameSettings_CompetitiveAdvancedSettings",
				tabIcon = ""
			},
			properties = {
				tabId = "global_settings"
			}
		} )
		table.insert( f45_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f45_local0
	end
	, true ),
	CallingCardsTabs = f0_local7( "CallingCardsTabs", function ( f46_arg0 )
		local f46_local0 = {}
		table.insert( f46_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		local f46_local1 = function ( f47_arg0 )
			return function ( f48_arg0 )
				local f48_local0
				if f48_arg0.challengeRow == nil or f48_arg0.isLocked or f48_arg0.isMastery == f47_arg0 then
					f48_local0 = false
				else
					f48_local0 = true
				end
				return f48_local0
			end
			
		end
		
		local f46_local2 = function ( f49_arg0, f49_arg1 )
			local f49_local0 = 0
			for f49_local4, f49_local5 in ipairs( f49_arg0 ) do
				if (not f49_arg1 or f49_arg1( f49_local5 )) and Engine.IsEmblemBackgroundNew( f46_arg0, f49_local5.imageID ) then
					f49_local0 = f49_local0 + 1
				end
			end
			return f49_local0
		end
		
		local f46_local3 = function ()
			local f50_local0 = 0
			for f50_local4, f50_local5 in ipairs( Engine.GetBackgroundsForCategoryName( f46_arg0, "default" ) ) do
				if Engine.IsEmblemBackgroundNew( f46_arg0, f50_local5.id ) then
					f50_local0 = f50_local0 + 1
				end
			end
			return f50_local0
		end
		
		local f46_local4 = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3, f51_arg4 )
			table.insert( f46_local0, {
				models = {
					tabName = f51_arg0,
					tabWidget = f51_arg1,
					tabCategory = f51_arg2,
					breadcrumbCount = f51_arg4,
					tabIcon = ""
				},
				properties = {
					tabId = f51_arg3
				}
			} )
		end
		
		local f46_local5 = Engine.GetChallengeInfoForImages( f46_arg0, nil, Enum.eModes.MODE_CAMPAIGN )
		f46_local4( "MENU_DEFAULT_CAPS", "CoD.CallingCards_Stickerbook_Default", "default", "callingcards_default", f46_local3() )
		f46_local4( "MENU_CAMPAIGN_CAPS", "CoD.CallingCards_Stickerbook", "cp", "callingcards_cp", f46_local2( f46_local5, f46_local1( true ) ) )
		if not IsLobbyNetworkModeLAN() then
			local f46_local6 = Engine.GetChallengeInfoForImages( f46_arg0, nil, Enum.eModes.MODE_MULTIPLAYER )
			local f46_local7 = Engine.GetChallengeInfoForImages( f46_arg0, nil, Enum.eModes.MODE_ZOMBIES )
			f46_local4( "MENU_MULTIPLAYER_CAPS", "CoD.CallingCards_Stickerbook", "mp", "callingcards_mp", f46_local2( f46_local6, f46_local1( true ) ) )
			f46_local4( "MENU_ZOMBIES_CAPS", "CoD.CallingCards_Stickerbook", "zm", "callingcards_zm", f46_local2( f46_local7, f46_local1( true ) ) )
			if not Engine.IsInGame() or not CoD.isCampaign then
				f46_local4( "MENU_MASTERS_CAPS", "CoD.CallingCards_Stickerbook_Master", "master", "callingcards_master", f46_local2( f46_local5, f46_local1( false ) ) + f46_local2( f46_local6, f46_local1( false ) ) + f46_local2( f46_local7, f46_local1( false ) ) )
			end
		end
		if IsLive() and (not Engine.IsInGame() or not CoD.isCampaign) then
			local f46_local6 = CoD.BlackMarketUtility.GetCallingCardRows()
			local f46_local7 = 0
			for f46_local12, f46_local13 in ipairs( f46_local6 ) do
				local f46_local14 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f46_local13, 0 )
				if not CoD.BlackMarketUtility.IsItemLocked( f46_arg0, f46_local14 ) then
					local f46_local11 = Engine.TableLookup( f46_arg0, CoD.BlackMarketUtility.backgroundsTable, 3, f46_local14, 1 )
					if f46_local11 and Engine.IsEmblemBackgroundNew( f46_arg0, f46_local11 ) then
						f46_local7 = f46_local7 + 1
					end
				end
			end
			f46_local4( "MENU_BLACK_MARKET", "CoD.CallingCards_Set_BlackMarket", "loot", "callingcards_bm", f46_local7 )
		end
		table.insert( f46_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f46_local0
	end
	 ),
	CPChallengesTabs = f0_local7( "CPChallengesTabs", function ( f52_arg0 )
		local f52_local0 = {}
		local f52_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
		local f52_local2 = "missions"
		if f52_local1 ~= nil then
			f52_local2 = Engine.GetModelValue( f52_local1 )
		end
		table.insert( f52_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f52_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_MISSIONS_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "missions"
			},
			properties = {
				tabId = "missions",
				disabled = Challenges_IsCategoryLocked( nil, f52_arg0, "missions" ),
				selectIndex = false
			}
		} )
		table.insert( f52_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_TOOLSOFTHETRADE_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "tott"
			},
			properties = {
				tabId = "tott",
				disabled = Challenges_IsCategoryLocked( nil, f52_arg0, "tott" ),
				selectIndex = false
			}
		} )
		table.insert( f52_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_CAREER_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "career"
			},
			properties = {
				tabId = "career",
				disabled = Challenges_IsCategoryLocked( nil, f52_arg0, "career" ),
				selectIndex = false
			}
		} )
		table.insert( f52_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f52_local3 = 1, #f52_local0, 1 do
			if f52_local0[f52_local3].properties ~= nil then
				if f52_local0[f52_local3].models.tabCategory == f52_local2 then
					f52_local0[f52_local3].properties.selectIndex = true
				else
					f52_local0[f52_local3].properties.selectIndex = false
				end
			end
		end
		return f52_local0
	end
	 ),
	ZMChallengesTabs = f0_local7( "ZMChallengesTabs", function ( f53_arg0 )
		local f53_local0 = {}
		local f53_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
		local f53_local2 = "missions"
		if f53_local1 ~= nil then
			f53_local2 = Engine.GetModelValue( f53_local1 )
		end
		table.insert( f53_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f53_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_ZOMBIEHUNTER_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "zombiehunter"
			},
			properties = {
				tabId = "zombiehunter",
				disabled = Challenges_IsCategoryLocked( nil, f53_arg0, "zombiehunter" ),
				selectIndex = false
			}
		} )
		table.insert( f53_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_SURVIVALIST_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "survivalist"
			},
			properties = {
				tabId = "survivalist",
				disabled = Challenges_IsCategoryLocked( nil, f53_arg0, "survivalist" ),
				selectIndex = false
			}
		} )
		table.insert( f53_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_GUMGOBBLER_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "gumgobbler"
			},
			properties = {
				tabId = "gumgobbler",
				disabled = Challenges_IsCategoryLocked( nil, f53_arg0, "gumgobbler" ),
				selectIndex = false
			}
		} )
		table.insert( f53_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_DARKOPS_CAPS",
				tabWidget = "CoD.Challenges_ZM_Stickerbook_DarkOps",
				tabIcon = "",
				tabCategory = "darkops"
			},
			properties = {
				tabId = "darkops",
				selectIndex = false
			}
		} )
		table.insert( f53_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f53_local3 = 1, #f53_local0, 1 do
			if f53_local0[f53_local3].properties ~= nil then
				if f53_local0[f53_local3].models.tabCategory == f53_local2 then
					f53_local0[f53_local3].properties.selectIndex = true
				else
					f53_local0[f53_local3].properties.selectIndex = false
				end
			end
		end
		return f53_local0
	end
	 ),
	ChallengesTabs = f0_local7( "ChallengesTabs", function ( f54_arg0 )
		local f54_local0 = {}
		table.insert( f54_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f54_local0, {
			models = {
				tabName = "MPUI_SUMMARY_CAPS",
				tabWidget = "CoD.Challenges_MP_Summary",
				tabIcon = ""
			},
			properties = {
				tabId = "challenges_mp_summary"
			}
		} )
		table.insert( f54_local0, {
			models = {
				tabName = "MENU_OPERATIONS_CAPS",
				tabWidget = "CoD.Challenges_FrameWidget_Operations",
				tabIcon = ""
			},
			properties = {
				tabId = "challenges_frameWidget_operations"
			}
		} )
		table.insert( f54_local0, {
			models = {
				tabName = "HEROES_SPECIALISTS_CAPS",
				tabWidget = "CoD.Challenges_FrameWidget_Specialists",
				tabIcon = ""
			},
			properties = {
				tabId = "challenges_framewidget_specialists"
			}
		} )
		table.insert( f54_local0, {
			models = {
				tabName = "MENU_SCORESTREAKS_CAPS",
				tabWidget = "CoD.Challenges_FrameWidget_Scorestreaks",
				tabIcon = ""
			},
			properties = {
				tabId = "challenges_framewidget_scorestreaks"
			}
		} )
		table.insert( f54_local0, {
			models = {
				tabName = "MENU_EMBLEM_BACKGROUND_PRESTIGETAB",
				tabWidget = "CoD.Challenges_FrameWidget_Prestige",
				tabIcon = ""
			},
			properties = {
				tabId = "challenges_framewidget_prestige"
			}
		} )
		table.insert( f54_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f54_local0
	end
	 ),
	OperationsTabs = f0_local7( "OperationsTabs", function ( f55_arg0 )
		local f55_local0 = {}
		local f55_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
		local f55_local2 = "bootcamp"
		if f55_local1 ~= nil then
			f55_local2 = Engine.GetModelValue( f55_local1 )
		end
		table.insert( f55_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f55_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_BOOTCAMP_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "bootcamp"
			},
			properties = {
				tabId = "bootcamp",
				disabled = Challenges_IsCategoryLocked( nil, f55_arg0, "bootcamp" ),
				selectIndex = false
			}
		} )
		table.insert( f55_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_KILLER_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "killer"
			},
			properties = {
				tabId = "killer",
				disabled = Challenges_IsCategoryLocked( nil, f55_arg0, "killer" ),
				selectIndex = false
			}
		} )
		table.insert( f55_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_HUMILIATION_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "humiliation"
			},
			properties = {
				tabId = "humiliation",
				disabled = Challenges_IsCategoryLocked( nil, f55_arg0, "humiliation" ),
				selectIndex = false
			}
		} )
		table.insert( f55_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_CAREER_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "career"
			},
			properties = {
				tabId = "career",
				disabled = Challenges_IsCategoryLocked( nil, f55_arg0, "career" ),
				selectIndex = false
			}
		} )
		table.insert( f55_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_GAMEVICTORIES_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "gamevictories"
			},
			properties = {
				tabId = "gamevictories",
				disabled = Challenges_IsCategoryLocked( nil, f55_arg0, "gamevictories" ),
				selectIndex = false
			}
		} )
		table.insert( f55_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_GAMEHEROICS_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "gameheroics"
			},
			properties = {
				tabId = "gameheroics",
				disabled = Challenges_IsCategoryLocked( nil, f55_arg0, "gameheroics" ),
				selectIndex = false
			}
		} )
		table.insert( f55_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_DARKOPS_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook_DarkOps",
				tabIcon = "",
				tabCategory = "darkops"
			},
			properties = {
				tabId = "darkops",
				selectIndex = false
			}
		} )
		table.insert( f55_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f55_local3 = 1, #f55_local0, 1 do
			if f55_local0[f55_local3].properties ~= nil then
				if f55_local0[f55_local3].models.tabCategory == f55_local2 then
					f55_local0[f55_local3].properties.selectIndex = true
				else
					f55_local0[f55_local3].properties.selectIndex = false
				end
			end
		end
		return f55_local0
	end
	 ),
	SpecialistsTabs = f0_local7( "SpecialistsTabs", function ( f56_arg0 )
		local f56_local0 = {}
		local f56_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
		local f56_local2 = "weapons"
		if f56_local1 ~= nil then
			f56_local2 = Engine.GetModelValue( f56_local1 )
		end
		table.insert( f56_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f56_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTWEAPONS_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "weapons"
			},
			properties = {
				tabId = "weapons",
				disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "weapons" ),
				selectIndex = false
			}
		} )
		table.insert( f56_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTABILITIES_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "abilities"
			},
			properties = {
				tabId = "abilities",
				disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "abilities" ),
				selectIndex = false
			}
		} )
		table.insert( f56_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTKILLJOYS_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "killjoys"
			},
			properties = {
				tabId = "killjoys",
				disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "killjoys" ),
				selectIndex = false
			}
		} )
		table.insert( f56_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f56_local3 = 1, #f56_local0, 1 do
			if f56_local0[f56_local3].properties ~= nil then
				if f56_local0[f56_local3].models.tabCategory == f56_local2 then
					f56_local0[f56_local3].properties.selectIndex = true
				else
					f56_local0[f56_local3].properties.selectIndex = false
				end
			end
		end
		return f56_local0
	end
	 ),
	ScorestreaksTabs = f0_local7( "ScorestreaksTabs", function ( f57_arg0 )
		local f57_local0 = {}
		local f57_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
		local f57_local2 = "airassault"
		if f57_local1 ~= nil then
			f57_local2 = Engine.GetModelValue( f57_local1 )
		end
		table.insert( f57_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f57_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_AIR_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "airassault"
			},
			properties = {
				tabId = "airassault",
				disabled = Challenges_IsCategoryLocked( nil, f57_arg0, "airassault" ),
				selectIndex = false
			}
		} )
		table.insert( f57_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_GROUND_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "groundassault"
			},
			properties = {
				tabId = "groundassault",
				disabled = Challenges_IsCategoryLocked( nil, f57_arg0, "groundassault" ),
				selectIndex = false
			}
		} )
		table.insert( f57_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_SUPPORT_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "support"
			},
			properties = {
				tabId = "support",
				disabled = Challenges_IsCategoryLocked( nil, f57_arg0, "support" ),
				selectIndex = false
			}
		} )
		table.insert( f57_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_RETURNFIRE_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "returnfire"
			},
			properties = {
				tabId = "returnfire",
				disabled = Challenges_IsCategoryLocked( nil, f57_arg0, "returnfire" ),
				selectIndex = false
			}
		} )
		table.insert( f57_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f57_local3 = 1, #f57_local0, 1 do
			if f57_local0[f57_local3].properties ~= nil then
				if f57_local0[f57_local3].models.tabCategory == f57_local2 then
					f57_local0[f57_local3].properties.selectIndex = true
				else
					f57_local0[f57_local3].properties.selectIndex = false
				end
			end
		end
		return f57_local0
	end
	 ),
	PrestigeTabs = f0_local7( "PrestigeTabs", function ( f58_arg0 )
		local f58_local0 = {}
		local f58_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
		local f58_local2 = "combathandling"
		if f58_local1 ~= nil then
			f58_local2 = Engine.GetModelValue( f58_local1 )
		end
		table.insert( f58_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_COMBATHANDLING_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "combathandling"
			},
			properties = {
				tabId = "combathandling",
				disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "combathandling" ),
				selectIndex = false
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_COMBATEFFICIENCY_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "combatefficiency"
			},
			properties = {
				tabId = "combatefficiency",
				disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "combatefficiency" ),
				selectIndex = false
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_PERKS1_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "perks1"
			},
			properties = {
				tabId = "perks1",
				disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "perks1" ),
				selectIndex = false
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_PERKS2_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "perks2"
			},
			properties = {
				tabId = "perks2",
				disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "perks2" ),
				selectIndex = false
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_PERKS3_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "perks3"
			},
			properties = {
				tabId = "perks3",
				disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "perks3" ),
				selectIndex = false
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_LETHALS_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "lethals"
			},
			properties = {
				tabId = "lethals",
				disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "lethals" ),
				selectIndex = false
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_TACTICALS_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "tacticals"
			},
			properties = {
				tabId = "tacticals",
				disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "tacticals" ),
				selectIndex = false
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabName = "MENU_CHALLENGE_CATEGORY_WILDCARDS_CAPS",
				tabWidget = "CoD.Challenges_MP_Stickerbook",
				tabIcon = "",
				tabCategory = "wildcards"
			},
			properties = {
				tabId = "wildcards",
				disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "wildcards" ),
				selectIndex = false
			}
		} )
		table.insert( f58_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f58_local3 = 1, #f58_local0, 1 do
			if f58_local0[f58_local3].properties ~= nil then
				if f58_local0[f58_local3].models.tabCategory == f58_local2 then
					f58_local0[f58_local3].properties.selectIndex = true
				else
					f58_local0[f58_local3].properties.selectIndex = false
				end
			end
		end
		return f58_local0
	end
	 ),
	GameSettingsOptions = f0_local7( "GameSettingsOptions", function ( f59_arg0 )
		local f59_local0 = {}
		if IsLive() then
			table.insert( f59_local0, {
				models = {
					displayText = "MENU_SAVE",
					description = "MENU_SAVE_DESCRIPTION",
					action = nil,
					icon = "t7_icon_menu_simple_save",
					disabled = true
				}
			} )
		end
		table.insert( f59_local0, {
			models = {
				displayText = "MENU_REVERT_CHANGES",
				description = "MENU_REVERT_CHANGES_DESCRIPTION",
				action = ResetGameSettings,
				icon = "t7_icon_menu_simple_revertchanges",
				disabled = false
			}
		} )
		local f59_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.selectedSetting" ) )
		local f59_local2 = CoD.perController[f59_arg0].selectedGameSettingElement
		if f59_local2 and f59_local2.revert then
			table.insert( f59_local0, {
				models = {
					displayText = "MENU_REVERT_SETTING",
					description = "MENU_REVERT_SETTINGS_DESCRIPTION",
					action = ResetSelectedGameSetting,
					icon = "t7_icon_menu_simple_revertsetting",
					disabled = false
				}
			} )
		end
		return f59_local0
	end
	, true ),
	CodCasterSideBarTabs = f0_local7( "CodCasterSideBarTabs", function ( f60_arg0 )
		local f60_local0 = {}
		table.insert( f60_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f60_local0, {
			models = {
				tabName = "CODCASTER_SETTINGS",
				tabWidget = "CoD.CodCasterSettingsSideBarDisplaySettings",
				tabIcon = ""
			},
			properties = {
				tabId = "players"
			}
		} )
		table.insert( f60_local0, {
			models = {
				tabName = "CODCASTER_LOADOUT",
				tabWidget = "CoD.CodCasterSettingsSideBarLoadoutSettings",
				tabIcon = ""
			},
			properties = {
				tabId = "options"
			}
		} )
		table.insert( f60_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f60_local0
	end
	 ),
	EditCodCasterSettingsButtonList = f0_local7( "EditCodCasterSettingsButtonList", function ( f61_arg0 )
		local f61_local0 = {}
		local f61_local1 = function ( f62_arg0, f62_arg1 )
			Engine.SetModelValue( Engine.CreateModel( DataSources.TeamIdentity.getModel( f62_arg0 ), "team" ), f62_arg1 )
		end
		
		local f61_local2 = "shoutcaster_fe_team_identity"
		local f61_local3 = CoD.ShoutcasterProfileVarBool( f61_arg0, f61_local2 ) == false
		local f61_local4 = {}
		table.insert( f61_local4, {
			name = Engine.ToUpper( Engine.Localize( "CODCASTER_TEAM_IDENTITY_FACTIONS" ) ),
			value = Enum.ShoutcasterSettingTeamIdentityMode.SHOUTCASTER_SETTING_TEAM_IDENTITY_MODE_FACTION
		} )
		table.insert( f61_local4, {
			name = Engine.ToUpper( Engine.Localize( "CODCASTER_TEAM_IDENTITY_CUSTOM" ) ),
			value = Enum.ShoutcasterSettingTeamIdentityMode.SHOUTCASTER_SETTING_TEAM_IDENTITY_MODE_CUSTOM
		} )
		for f61_local8, f61_local9 in ipairs( {
			{
				btnType = "btnSettings",
				displayText = "CODCASTER_QUICK_SETTINGS",
				hintText = "CODCASTER_QUICK_SETTINGS_DESC",
				buttonOnly = true,
				disabled = false,
				showTeam1Info = false,
				showTeam2Info = false,
				actionFn = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4 )
					NavigateToMenu( f64_arg4, "EditCodCasterQuickSettings", true, f64_arg2 )
				end
			},
			{
				btnType = "btnSettings",
				displayText = "CODCASTER_DISPLAY_SETTINGS",
				hintText = "CODCASTER_DISPLAY_SETTINGS_DESC",
				buttonOnly = true,
				disabled = false,
				showTeam1Info = false,
				showTeam2Info = false,
				actionFn = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4 )
					NavigateToMenu( f65_arg4, "EditCodCasterDisplaySettings", true, f65_arg2 )
				end
			},
			{
				btnType = "btnSettings",
				displayText = "CODCASTER_LOADOUT_SETTINGS",
				hintText = "CODCASTER_LOADOUT_SETTINGS_DESC",
				buttonOnly = true,
				disabled = false,
				showTeam1Info = false,
				showTeam2Info = false,
				actionFn = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
					NavigateToMenu( f66_arg4, "EditCodCasterLoadoutSettings", true, f66_arg2 )
				end
			},
			{
				btnType = "btnSettings",
				displayText = "CODCASTER_PLAYER_ORDER",
				hintText = "CODCASTER_PLAYER_ORDER_DESC",
				buttonOnly = true,
				disabled = true,
				showTeam1Info = false,
				showTeam2Info = false,
				actionFn = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
					
				end,
				spacing = 40
			},
			{
				btnType = "btnTeamIdentitySettings",
				displayText = "CODCASTER_TEAM_IDENTITY",
				hintText = "CODCASTER_TEAM_IDENTITY_DESC",
				buttonOnly = false,
				sliderOnly = true,
				disabled = false,
				showTeam1Info = true,
				showTeam2Info = true,
				optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f61_arg0, "CoDCasterSettings_TeamIdentity", f61_local4, f61_local2, function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3 )
					for f63_local0 = 1, #f63_arg0.ButtonList.EditCodCasterSettingsButtonList, 1 do
						local f63_local3 = f63_arg0.ButtonList.EditCodCasterSettingsButtonList[f63_local0]
						if f63_local3.properties and f63_local3.properties.btnType == "btnTeamIdentitySubSettings" then
							local f63_local4 = Engine.GetModel( f63_local3.model, "disabled" )
							local f63_local5 = f63_arg3 == 0
							Engine.SetModelValue( f63_local4, f63_local5 )
							f63_local3.properties.disabled = f63_local5
							CoD.SetupTeamIdentityInformation( f63_arg0, f63_arg1, "team1" )
							CoD.SetupTeamIdentityInformation( f63_arg0, f63_arg1, "team2" )
						end
					end
				end
				, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
				currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f61_arg0, f61_local4, f61_local2 )
			},
			{
				btnType = "btnTeamIdentitySubSettings",
				displayText = "CODCASTER_TEAM1_SETTINGS",
				hintText = "CODCASTER_TEAM1_SETTINGS_DESC",
				buttonOnly = true,
				disabled = f61_local3,
				showTeam1Info = true,
				showTeam2Info = false,
				actionFn = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
					f61_local1( f68_arg2, "team1" )
					NavigateToMenu( f68_arg4, "EditTeamIdentity", true, f68_arg2 )
				end
			},
			{
				btnType = "btnTeamIdentitySubSettings",
				displayText = "CODCASTER_TEAM2_SETTINGS",
				hintText = "CODCASTER_TEAM2_SETTINGS_DESC",
				buttonOnly = true,
				disabled = f61_local3,
				showTeam1Info = false,
				showTeam2Info = true,
				actionFn = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4 )
					f61_local1( f69_arg2, "team2" )
					NavigateToMenu( f69_arg4, "EditTeamIdentity", true, f69_arg2 )
				end
			}
		} ) do
			table.insert( f61_local0, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( f61_local9.displayText ) ),
					hintText = f61_local9.hintText,
					buttonOnly = f61_local9.buttonOnly,
					sliderOnly = f61_local9.sliderOnly,
					disabled = f61_local9.disabled,
					showTeam1Info = f61_local9.showTeam1Info,
					showTeam2Info = f61_local9.showTeam2Info,
					optionsDatasource = f61_local9.optionsDatasource,
					currentSelection = f61_local9.currentSelection,
					selected = false
				},
				properties = {
					btnType = f61_local9.btnType,
					hideArrows = f61_local9.buttonOnly == true,
					disabled = f61_local9.disabled,
					action = f61_local9.actionFn,
					spacing = f61_local9.spacing
				}
			} )
		end
		return f61_local0
	end
	, false, nil, nil, function ( f70_arg0, f70_arg1, f70_arg2 )
		if f70_arg0.EditCodCasterSettingsButtonList[f70_arg1].properties.spacing then
			return f70_arg0.EditCodCasterSettingsButtonList[f70_arg1].properties.spacing
		else
			return f70_arg0.spacing
		end
	end
	 ),
	CodCasterQuickSettingsButtonList = f0_local7( "CodCasterQuickSettingsButtonList", function ( f71_arg0 )
		local f71_local0 = {}
		for f71_local4, f71_local5 in ipairs( {
			{
				displayText = "CODCASTER_QS_XRAY",
				hintText = "CODCASTER_QS_XRAY_HINT",
				profileVar = "shoutcaster_qs_xray"
			},
			{
				displayText = "CODCASTER_QS_THIRD_PERSON",
				hintText = "CODCASTER_QS_THIRD_PERSON_HINT",
				profileVar = "shoutcaster_qs_thirdperson"
			},
			{
				displayText = "CODCASTER_QS_LISTEN_IN",
				hintText = "CODCASTER_QS_LISTEN_IN_HINT",
				profileVar = "shoutcaster_qs_listen_in"
			},
			{
				displayText = "CODCASTER_QS_PLAYER_LIST",
				hintText = "CODCASTER_QS_PLAYER_LIST_HINT",
				profileVar = "shoutcaster_qs_playerlist"
			},
			{
				displayText = "CODCASTER_QS_SCORE_PANEL",
				hintText = "CODCASTER_QS_SCORE_PANEL_HINT",
				profileVar = "shoutcaster_qs_scorepanel"
			},
			{
				displayText = "CODCASTER_QS_PLAYER_CARD",
				hintText = "CODCASTER_QS_PLAYER_CARD_HINT",
				profileVar = "shoutcaster_qs_playercard"
			},
			{
				displayText = "CODCASTER_QS_PLAYER_HUD",
				hintText = "CODCASTER_QS_PLAYER_HUD_HINT",
				profileVar = "shoutcaster_qs_playerhud"
			}
		} ) do
			table.insert( f71_local0, {
				models = {
					displayText = Engine.Localize( f71_local5.displayText ),
					hintText = Engine.Localize( f71_local5.hintText ),
					profileVarValue = CoD.ShoutcasterProfileVarBool( f71_arg0, f71_local5.profileVar )
				},
				properties = {
					profileVar = f71_local5.profileVar
				}
			} )
		end
		return f71_local0
	end
	 ),
	CodCasterDisplaySettingsButtonList = f0_local7( "CodCasterDisplaySettingsButtonList", function ( f72_arg0 )
		local f72_local0 = {}
		local f72_local1 = function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3 )
			if not Engine.IsInGame() then
				return 
			else
				ToggleControllerModelValueNumber( f73_arg1, "CodCaster.profileSettingsUpdated" )
			end
		end
		
		local f72_local2 = {}
		table.insert( f72_local2, {
			name = "MENU_OFF",
			value = 0
		} )
		table.insert( f72_local2, {
			name = "MENU_ON",
			value = 1
		} )
		local f72_local3 = {}
		table.insert( f72_local3, {
			name = "CODCASTER_XRAY_NONE",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_OFF
		} )
		table.insert( f72_local3, {
			name = "CODCASTER_XRAY_ENEMY",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_ENEMY
		} )
		table.insert( f72_local3, {
			name = "CODCASTER_XRAY_BOTH",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_ALL
		} )
		local f72_local4 = {}
		table.insert( f72_local4, {
			name = "MENU_ON_SPAWN",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ON
		} )
		table.insert( f72_local4, {
			name = "MPUI_ALWAYS_ON",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ALWAYS
		} )
		table.insert( f72_local4, {
			name = "CODCASTER_MINIMAP_STANDARD",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_STANDARD
		} )
		table.insert( f72_local4, {
			name = "MENU_OFF",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_OFF
		} )
		local f72_local5 = {}
		table.insert( f72_local5, {
			name = "MENU_OFF",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_OFF
		} )
		table.insert( f72_local5, {
			name = "CODCASTER_MINIMAP_STANDARD",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_STANDARD
		} )
		table.insert( f72_local5, {
			name = "CODCASTER_MINIMAP_FULL_VIEW",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_FULL
		} )
		for f72_local9, f72_local10 in ipairs( {
			{
				name = "Xray",
				displayText = "CODCASTER_DS_XRAY",
				hintText = "CODCASTER_DS_XRAY_DESC",
				profileVar = "shoutcaster_xray",
				options = f72_local3
			},
			{
				name = "TeamIdentity",
				displayText = "CODCASTER_DS_TEAM_IDENTITY",
				hintText = "CODCASTER_DS_TEAM_IDENTITY_DESC",
				profileVar = "shoutcaster_team_identity",
				options = f72_local2
			},
			{
				name = "Toolbar",
				displayText = "CODCASTER_DS_TOOLBAR",
				hintText = "CODCASTER_DS_TOOLBAR_DESC",
				profileVar = "shoutcaster_toolbar",
				options = f72_local2
			},
			{
				name = "Perks",
				displayText = "CODCASTER_DS_PERKS",
				hintText = "CODCASTER_DS_PERKS_DESC",
				profileVar = "shoutcaster_perks",
				options = f72_local4
			},
			{
				name = "Minimap",
				displayText = "CODCASTER_DS_MINIMAP",
				hintText = "CODCASTER_DS_MINIMAP_DESC",
				profileVar = "shoutcaster_minimap",
				options = f72_local5
			},
			{
				name = "TeamScore",
				displayText = "CODCASTER_DS_TEAM_SCORE",
				hintText = "CODCASTER_DS_TEAM_SCORE_DESC",
				profileVar = "shoutcaster_teamscore",
				options = f72_local2
			},
			{
				name = "Inventory",
				displayText = "CODCASTER_DS_INVENTORY",
				hintText = "CODCASTER_DS_INVENTORY_DESC",
				profileVar = "shoutcaster_inventory",
				options = f72_local2
			},
			{
				name = "Scorestreaks",
				displayText = "CODCASTER_DS_SCORESTREAKS",
				hintText = "CODCASTER_DS_SCORESTREAKS_DESC",
				profileVar = "shoutcaster_scorestreaks",
				options = f72_local2
			},
			{
				name = "ScorestreakNotifications",
				displayText = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS",
				hintText = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_scorestreaks_notification",
				options = f72_local2
			},
			{
				name = "SpecialistNotifications",
				displayText = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS",
				hintText = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_specialist_notification",
				options = f72_local2
			},
			{
				name = "ObjectiveStatus",
				displayText = "CODCASTER_DS_OBJECTIVE_STATUS",
				hintText = "CODCASTER_DS_OBJECTIVE_STATUS_DESC",
				profileVar = "shoutcaster_objective_status",
				options = f72_local2
			},
			{
				name = "WaypointMarkers",
				displayText = "CODCASTER_DS_WAYPOINT_MARKERS",
				hintText = "CODCASTER_DS_WAYPOINT_MARKERS_DESC",
				profileVar = "shoutcaster_waypoint_markers",
				options = f72_local2
			},
			{
				name = "KillFeed",
				displayText = "CODCASTER_DS_KILLFEED",
				hintText = "CODCASTER_DS_KILLFEED_DESC",
				profileVar = "shoutcaster_killfeed",
				options = f72_local2
			},
			{
				name = "CalloutCards",
				displayText = "CODCASTER_DS_CALLOUT_CARDS",
				hintText = "CODCASTER_DS_CALLOUT_CARDS_DESC",
				profileVar = "shoutcaster_calloutcards",
				options = f72_local2
			},
			{
				name = "PlayerNotifications",
				displayText = "CODCASTER_DS_PLAYER_NOTIFICATIONS",
				hintText = "CODCASTER_DS_PLAYER_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_playernotifications",
				options = f72_local2
			},
			{
				name = "VoipDock",
				displayText = "CODCASTER_DS_VOIP_DOCK",
				hintText = "CODCASTER_DS_VOIP_DOCK_DESC",
				profileVar = "shoutcaster_voipdock",
				options = f72_local2
			}
		} ) do
			table.insert( f72_local0, {
				models = {
					displayText = f72_local10.displayText,
					hintText = f72_local10.hintText,
					buttonOnly = false,
					disabled = false,
					optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f72_arg0, "CoDCasterDisplaySettings_" .. f72_local10.name, f72_local10.options, f72_local10.profileVar, f72_local1, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
					currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f72_arg0, f72_local10.options, f72_local10.profileVar ),
					selected = false
				},
				properties = {
					hideArrows = false,
					disabled = false
				}
			} )
		end
		return f72_local0
	end
	 ),
	CodCasterLoadoutSettingsButtonList = f0_local7( "CodCasterLoadoutSettingsButtonList", function ( f74_arg0 )
		local f74_local0 = {}
		local f74_local1 = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
			if not Engine.IsInGame() then
				return 
			else
				ToggleControllerModelValueNumber( f75_arg1, "CodCaster.profileSettingsUpdated" )
			end
		end
		
		local f74_local2 = {}
		table.insert( f74_local2, {
			name = "MENU_OFF",
			value = 0
		} )
		table.insert( f74_local2, {
			name = "MENU_ON",
			value = 1
		} )
		for f74_local6, f74_local7 in ipairs( {
			{
				name = "PlayerSpecialist",
				displayText = "CODCASTER_LS_PLAYER_SPECIALIST",
				hintText = "CODCASTER_LS_PLAYER_SPECIALIST_DESC",
				profileVar = "shoutcaster_lo_specialist"
			},
			{
				name = "SpecialistWeaponAbility",
				displayText = "CODCASTER_LS_SPECIALIST_WEAPON_ABILITY",
				hintText = "CODCASTER_LS_SPECIALIST_WEAPON_ABILITY_DESC",
				profileVar = "shoutcaster_lo_specialist_weapon"
			},
			{
				name = "PrimaryWeapon",
				displayText = "CODCASTER_LS_PRIMARY_WEAPON",
				hintText = "CODCASTER_LS_PRIMARY_WEAPON_DESC",
				profileVar = "shoutcaster_lo_primary"
			},
			{
				name = "SecondaryWeapon",
				displayText = "CODCASTER_LS_SECONDARY_WEAPON",
				hintText = "CODCASTER_LS_SECONDARY_WEAPON_DESC",
				profileVar = "shoutcaster_lo_secondary"
			},
			{
				name = "Equipment",
				displayText = "CODCASTER_LS_EQUIPMENT",
				hintText = "CODCASTER_LS_EQUIPMENT_DESC",
				profileVar = "shoutcaster_lo_equipment"
			},
			{
				name = "Perks",
				displayText = "CODCASTER_LS_PERKS",
				hintText = "CODCASTER_LS_PERKS_DESC",
				profileVar = "shoutcaster_lo_perks"
			},
			{
				name = "Wildcards",
				displayText = "CODCASTER_LS_WILDCARDS",
				hintText = "CODCASTER_LS_WILDCARDS_DESC",
				profileVar = "shoutcaster_lo_wildcard"
			}
		} ) do
			table.insert( f74_local0, {
				models = {
					displayText = f74_local7.displayText,
					hintText = f74_local7.hintText,
					buttonOnly = false,
					disabled = false,
					optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f74_arg0, "CoDCasterLoadoutSettings_" .. f74_local7.name, f74_local2, f74_local7.profileVar, f74_local1, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
					currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f74_arg0, f74_local2, f74_local7.profileVar ),
					selected = false
				},
				properties = {
					hideArrows = false,
					disabled = false
				}
			} )
		end
		return f74_local0
	end
	 ),
	TeamIdentity = {
		getModel = function ( f76_arg0 )
			if not f76_arg0 then
				f76_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f76_arg0 ), "TeamIdentity" )
		end
	},
	TeamIdentityInformation = {
		getModel = function ( f77_arg0, f77_arg1 )
			if not f77_arg0 then
				f77_arg0 = Engine.GetPrimaryController()
			end
			local f77_local0 = Engine.GetModel( Engine.GetModelForController( f77_arg0 ), "TeamIdentity" )
			if not f77_arg1 then
				f77_arg1 = Engine.GetModelValue( Engine.GetModel( f77_local0, "team" ) )
			end
			return Engine.CreateModel( f77_local0, f77_arg1 )
		end
	},
	TeamIdentityColorList = f0_local7( "TeamIdentityColorList", function ( f78_arg0 )
		local f78_local0 = {}
		if not CoD.CodCaster_TeamIdentity.ColorList then
			CoD.CodCaster_TeamIdentity.ColorList = CoD.GetCodCasterTeamColorList( f78_arg0 )
		end
		local f78_local1 = CoD.CodCaster_TeamIdentity.ColorList
		local f78_local2 = Engine.GetModel( Engine.GetModelForController( f78_arg0 ), "TeamIdentity" )
		if f78_local2 then
			local f78_local3 = Engine.GetModelValue( Engine.GetModel( f78_local2, "team" ) )
			local f78_local4 = CoD.ShoutcasterProfileVarValue( f78_arg0, "shoutcaster_fe_" .. f78_local3 .. "_color" )
			local f78_local5 = -1
			if f78_local3 == "team1" then
				f78_local5 = CoD.ShoutcasterProfileVarValue( f78_arg0, "shoutcaster_fe_team2_color" )
			elseif f78_local3 == "team2" then
				f78_local5 = CoD.ShoutcasterProfileVarValue( f78_arg0, "shoutcaster_fe_team1_color" )
			end
			for f78_local6 = 1, #f78_local1, 1 do
				local f78_local9 = f78_local1[f78_local6]
				local f78_local10 = false
				local f78_local11 = false
				local f78_local12 = false
				if f78_local4 == f78_local6 - 1 then
					f78_local10 = true
					f78_local12 = true
				end
				if f78_local5 >= 0 and f78_local5 == f78_local6 - 1 then
					f78_local11 = true
				end
				if f78_local11 == false then
					table.insert( f78_local0, {
						models = {
							id = Engine.GetModelValue( Engine.GetModel( f78_local9, "id" ) ),
							color = Engine.GetModelValue( Engine.GetModel( f78_local9, "color" ) ),
							disabled = f78_local11,
							selected = f78_local12
						},
						properties = {
							selectIndex = f78_local10,
							disabled = f78_local11
						}
					} )
				end
			end
		end
		return f78_local0
	end
	 ),
	TeamIdentityLogoList = f0_local7( "TeamIdentityLogoList", function ( f79_arg0 )
		local f79_local0 = {}
		if not CoD.CodCaster_TeamIdentity.LogoList then
			CoD.CodCaster_TeamIdentity.LogoList = CoD.GetCodCasterTeamLogoList( f79_arg0 )
		end
		local f79_local1 = CoD.CodCaster_TeamIdentity.LogoList
		local f79_local2 = Engine.GetModel( Engine.GetModelForController( f79_arg0 ), "TeamIdentity" )
		if f79_local2 then
			local f79_local3 = Engine.GetModelValue( Engine.GetModel( f79_local2, "team" ) )
			local f79_local4 = CoD.ShoutcasterProfileVarValue( f79_arg0, "shoutcaster_fe_" .. f79_local3 .. "_icon" )
			local f79_local5 = -1
			if f79_local3 == "team1" then
				f79_local5 = CoD.ShoutcasterProfileVarValue( f79_arg0, "shoutcaster_fe_team2_icon" )
			elseif f79_local3 == "team2" then
				f79_local5 = CoD.ShoutcasterProfileVarValue( f79_arg0, "shoutcaster_fe_team1_icon" )
			end
			for f79_local6 = 1, #f79_local1, 1 do
				local f79_local9 = f79_local1[f79_local6]
				local f79_local10 = false
				local f79_local11 = false
				if f79_local4 == f79_local6 - 1 then
					f79_local10 = true
				end
				if f79_local5 >= 0 and f79_local5 == f79_local6 - 1 then
					f79_local11 = true
				end
				table.insert( f79_local0, {
					models = {
						id = Engine.GetModelValue( Engine.GetModel( f79_local9, "id" ) ),
						name = Engine.GetModelValue( Engine.GetModel( f79_local9, "name" ) ),
						ref = Engine.GetModelValue( Engine.GetModel( f79_local9, "ref" ) ),
						disabled = f79_local11
					},
					properties = {
						selectIndex = f79_local10,
						disabled = f79_local11
					}
				} )
			end
		end
		return f79_local0
	end
	 ),
	MyShowcaseTabs = f0_local7( "MyShowcaseTabs", function ( f80_arg0 )
		local f80_local0 = {}
		table.insert( f80_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f80_local0, {
			models = {
				tabName = Engine.Localize( "MENU_CATEGORIES_CAPS" ),
				tabWidget = "CoD.MyShowcase_CategorySelector",
				tabIcon = ""
			},
			properties = {
				tabId = "categories",
				selectIndex = true
			}
		} )
		table.insert( f80_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f80_local0
	end
	 ),
	MyShowcasePaintjobsTabs = f0_local7( "MyShowcasePaintjobsTabs", function ( f81_arg0 )
		return {}
	end
	 ),
	GametypeSettings = {
		getModel = function ( f82_arg0 )
			local f82_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
			Engine.CreateModel( f82_local0, "title" )
			Engine.CreateModel( f82_local0, "description" )
			Engine.CreateModel( f82_local0, "image" )
			Engine.SetModelValue( Engine.CreateModel( f82_local0, "gametype" ), Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" ) ) )
			return f82_local0
		end
	},
	GunsmithSnapshot = {
		getModel = function ( f83_arg0 )
			local f83_local0 = Engine.CurrentSessionMode()
			if f83_local0 ~= Enum.eModes.MODE_CAMPAIGN then
				f83_local0 = Enum.eModes.MODE_MULTIPLAYER
			end
			local f83_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "GunsmithSnapshot" )
			Engine.SetModelValue( Engine.CreateModel( f83_local1, "Stats" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f83_local1, "WeaponLevel" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f83_local1, "PlayerID" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f83_local1, "WeaponName" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f83_local1, "AttachmentIcons" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f83_local1, "BO3Logo" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f83_local1, "ShowControls" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f83_local1, "SessionMode" ), f83_local0 )
			return f83_local1
		end
	},
	GunsmithSnapshotStatsList = f0_local7( "GunsmithSnapshotStatsList", function ( f84_arg0 )
		local f84_local0 = CoD.perController[f84_arg0].gunsmithVariantModel
		local f84_local1 = Engine.GetModel( f84_local0, "variantIndex" )
		local f84_local2 = nil
		if f84_local1 then
			f84_local2 = Engine.GetModelValue( f84_local1 )
		end
		local f84_local3 = Engine.GetModel( f84_local0, "weaponIndex" )
		local f84_local4 = nil
		if f84_local3 then
			f84_local4 = Engine.GetModelValue( f84_local3 )
		end
		local f84_local5 = {
			"statName",
			"variantStatValue",
			"weaponStatValue"
		}
		local f84_local6 = CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode()
		local f84_local7 = CoD.CraftUtility.Gunsmith.GetWeaponStatList( f84_arg0, f84_local4, f84_local6 )
		local f84_local8 = false
		local f84_local9 = 0
		if Gunsmith_IsCurrentVariantChanged( f84_arg0 ) then
			f84_local8 = true
		end
		local f84_local10 = function ( f85_arg0, f85_arg1, f85_arg2 )
			local f85_local0 = "GunsmithStats_Column_" .. tostring( f85_arg1 )
			DataSources[f85_local0] = DataSourceHelpers.ListSetup( f85_local0, function ( f86_arg0 )
				local f86_local0 = {}
				for f86_local4, f86_local5 in ipairs( f84_local5 ) do
					if not f84_local8 then
						f84_local9 = CoD.CraftUtility.Gunsmith.GetVariantStats( f86_arg0, f85_arg2, f84_local2 + 1, f84_local6 )
					end
					table.insert( f86_local0, {
						models = {
							statName = CoD.CraftUtility.Gunsmith.GetWeaponStatHeader( f85_arg2 ),
							variantStatValue = f84_local9,
							weaponStatValue = CoD.CraftUtility.Gunsmith.GetWeaponStats( f86_arg0, f85_arg2, f84_local4, f84_local6 ),
							type = f86_local5
						}
					} )
				end
				return f86_local0
			end )
			return f85_local0
		end
		
		local f84_local11 = {}
		for f84_local15, f84_local16 in ipairs( f84_local7 ) do
			table.insert( f84_local11, {
				models = {
					SnapshotStatsColumn = f84_local10( f84_arg0, f84_local15, f84_local16 )
				}
			} )
		end
		return f84_local11
	end
	 ),
	CreateAClassEditSettingsName = {
		getModel = function ( f87_arg0 )
			local f87_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CreateAClassEditSettingsName" )
			Engine.SetModelValue( Engine.CreateModel( f87_local0, "name" ), "MENU_CREATE_A_CLASS_SETTINGS" )
			return f87_local0
		end
	},
	StartMenuGameOptions = f0_local7( "StartMenuGameOptions", function ( f88_arg0 )
		local f88_local0 = {}
		if Engine.IsDemoPlaying() then
			local f88_local1 = Engine.GetDemoSegmentCount()
			local f88_local2 = Engine.IsDemoHighlightReelMode()
			local f88_local3 = Engine.IsDemoClipPlaying()
			if not IsDemoRestrictedBasicMode() then
				table.insert( f88_local0, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_UPLOAD_CLIP", f88_local1 ) ),
						action = StartMenuUploadClip,
						disabledFunction = IsUploadClipButtonDisabled
					}
				} )
			end
			if f88_local2 then
				table.insert( f88_local0, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) ),
						action = StartMenuOpenCustomizeHighlightReel,
						disabledFunction = IsCustomizeHighlightReelButtonDisabled
					}
				} )
			end
			table.insert( f88_local0, {
				models = {
					displayText = Engine.ToUpper( Engine.ToUpper( Engine.Localize( "MENU_JUMP_TO_START" ) ) ),
					action = StartMenuJumpToStart,
					disabledFunction = IsJumpToStartButtonDisabled
				}
			} )
			local f88_local4 = nil
			if f88_local3 then
				f88_local4 = Engine.ToUpper( Engine.Localize( "MENU_END_CLIP" ) )
			else
				f88_local4 = Engine.ToUpper( Engine.Localize( "MENU_END_FILM" ) )
			end
			table.insert( f88_local0, {
				models = {
					displayText = Engine.ToUpper( f88_local4 ),
					action = StartMenuEndDemo
				}
			} )
		elseif CoD.isCampaign then
			table.insert( f88_local0, {
				models = {
					displayText = "MENU_RESUMEGAME_CAPS",
					action = StartMenuGoBack_ListElement
				}
			} )
			local f88_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f88_arg0 ), "safehouse.inTrainingSim" ) or 0
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				if not CoD.isSafehouse and f88_arg0 == Engine.GetPrimaryController() then
					table.insert( f88_local0, {
						models = {
							displayText = "MENU_RESTART_MISSION_CAPS",
							action = RestartMission
						}
					} )
					if LUI.DEV ~= nil then
						table.insert( f88_local0, {
							models = {
								displayText = "MENU_RESTART_CHECKPOINT_CAPS",
								action = RestartFromCheckpoint
							}
						} )
					end
				end
				if f88_arg0 == Engine.GetPrimaryController() then
					table.insert( f88_local0, {
						models = {
							displayText = "MENU_CHANGE_DIFFICULTY_CAPS",
							action = OpenDifficultySelect
						}
					} )
				end
				if CoD.isSafehouse and f88_local1 == 1 then
					table.insert( f88_local0, {
						models = {
							displayText = "MENU_END_TRAINING_SIM",
							action = EndTrainingSim
						}
					} )
				elseif f88_arg0 == Engine.GetPrimaryController() then
					if Engine.DvarBool( 0, "ui_blocksaves" ) then
						table.insert( f88_local0, {
							models = {
								displayText = "MENU_EXIT_CAPS",
								action = SaveAndQuitGame
							}
						} )
					else
						table.insert( f88_local0, {
							models = {
								displayText = "MENU_SAVE_AND_QUIT_CAPS",
								action = SaveAndQuitGame
							}
						} )
					end
				end
			elseif CoD.isSafehouse and f88_local1 == 1 then
				table.insert( f88_local0, {
					models = {
						displayText = "MENU_END_TRAINING_SIM",
						action = EndTrainingSim
					}
				} )
			else
				table.insert( f88_local0, {
					models = {
						displayText = "MENU_LEAVE_PARTY_AND_EXIT_CAPS",
						action = QuitGame
					}
				} )
			end
		elseif CoD.isMultiplayer then
			if Engine.Team( f88_arg0, "name" ) ~= "TEAM_SPECTATOR" and Engine.GetGametypeSetting( "disableClassSelection" ) ~= 1 then
				table.insert( f88_local0, {
					models = {
						displayText = "MPUI_CHOOSE_CLASS_BUTTON_CAPS",
						action = ChooseClass
					}
				} )
			end
			if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == false and Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false and not Engine.IsVisibilityBitSet( f88_arg0, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and not Engine.IsVisibilityBitSet( f88_arg0, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and CoD.IsTeamChangeAllowed() then
				table.insert( f88_local0, {
					models = {
						displayText = "MPUI_CHANGE_TEAM_BUTTON_CAPS",
						action = ChooseTeam
					}
				} )
			end
			local f88_local2 = "MENU_QUIT_GAME_CAPS"
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and not CoD.isOnlineGame() then
				f88_local2 = "MENU_END_GAME_CAPS"
			end
			table.insert( f88_local0, {
				models = {
					displayText = f88_local2,
					action = QuitGame_MP
				}
			} )
		elseif CoD.isZombie then
			table.insert( f88_local0, {
				models = {
					displayText = "MENU_RESUMEGAME_CAPS",
					action = StartMenuGoBack_ListElement
				}
			} )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and ((Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true) then
				table.insert( f88_local0, {
					models = {
						displayText = "MENU_RESTART_LEVEL_CAPS",
						action = RestartGame
					}
				} )
			end
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
				table.insert( f88_local0, {
					models = {
						displayText = "MENU_END_GAME_CAPS",
						action = QuitGame_MP
					}
				} )
			else
				table.insert( f88_local0, {
					models = {
						displayText = "MENU_QUIT_GAME_CAPS",
						action = QuitGame_MP
					}
				} )
			end
		end
		return f88_local0
	end
	, true ),
	PlatformControllerImage = {
		getModel = function ( f89_arg0 )
			local f89_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "PlatformControllerImage" )
			local f89_local1 = Engine.CreateModel( f89_local0, "image" )
			if CoD.isPC then
				Engine.SetModelValue( f89_local1, "t7_menu_startmenu_option_pc" )
			elseif CoD.isDurango then
				Engine.SetModelValue( f89_local1, "t7_menu_startmenu_option_xboxone" )
			else
				Engine.SetModelValue( f89_local1, "t7_menu_startmenu_option_ps4" )
			end
			return f89_local0
		end
	},
	MissionObjectives = f0_local7( "MissionObjectives", function ( f90_arg0 )
		local f90_local0 = {}
		local f90_local1 = 20
		local f90_local2 = Engine.GetPlayerObjectives( f90_arg0 )
		if f90_local2 == nil then
			return 
		end
		local f90_local3 = {}
		local f90_local4 = 1
		for f90_local10, f90_local11 in CoD.pairsByKeys( f90_local2 ) do
			if f90_local11.status ~= "invisible" and f90_local11.objective_desc ~= nil and f90_local11.objective_desc ~= "" then
				if not f90_local3[f90_local11.objective_desc] then
					f90_local3[f90_local11.objective_desc] = {
						index = f90_local4,
						desc = f90_local11.objective_desc,
						complete = f90_local11.status == "done"
					}
					f90_local4 = f90_local4 + 1
				end
				local f90_local8 = f90_local3[f90_local11.objective_desc]
				local f90_local9 = f90_local3[f90_local11.objective_desc].complete
				if f90_local9 then
					f90_local9 = f90_local11.status == "done"
				end
				f90_local8.complete = f90_local9
				if f90_local11.subobjective_desc and f90_local11.status ~= "done" then
					f90_local8 = nil
					if f90_local11.subobjective_image and f90_local11.subobjective_image ~= "" then
						f90_local8 = f90_local11.subobjective_image
					end
					f90_local3[f90_local11.objective_desc].sub_objective = {
						desc = f90_local11.subobjective_desc,
						complete = f90_local11.status == "done",
						subobjective_image = f90_local8
					}
				end
			end
		end
		f90_local5 = function ( f91_arg0, f91_arg1 )
			if not f90_local3[f91_arg1].complete then
				return false
			elseif not f90_local3[f91_arg0].complete then
				return true
			else
				return f90_local3[f91_arg0].index < f90_local3[f91_arg1].index
			end
		end
		
		f90_local6 = function ( f92_arg0, f92_arg1, f92_arg2, f92_arg3 )
			return {
				models = {
					objective = f92_arg0.desc,
					subobjective_image = f92_arg0.subobjective_image or "blacktransparent"
				},
				properties = {
					completed = f92_arg0.complete,
					subobjective = f92_arg1,
					awaitingOrders = f92_arg2,
					spacer = f92_arg3
				}
			}
		end
		
		f90_local7 = function ( f93_arg0 )
			return f90_local6( {
				desc = "CPUI_AWAITING_UPDATE"
			}, f93_arg0, true, f90_local1 )
		end
		
		f90_local10 = false
		for f90_local12, f90_local13 in LUI.IterateTableBySortedKeys( f90_local3, f90_local5 ) do
			table.insert( f90_local0, f90_local6( f90_local13 ) )
			if not f90_local13.complete then
				f90_local10 = true
				if f90_local13.sub_objective then
					table.insert( f90_local0, f90_local6( f90_local13.sub_objective, true, nil, f90_local1 ) )
				else
					table.insert( f90_local0, f90_local7( true ) )
				end
			end
		end
		if not f90_local10 then
			table.insert( f90_local0, 1, f90_local7( false ) )
		end
		return f90_local0
	end
	, true, nil, nil, function ( f94_arg0, f94_arg1, f94_arg2 )
		if f94_arg0[f94_arg0.customDataSourceHelper] then
			return f94_arg0[f94_arg0.customDataSourceHelper][f94_arg1].properties.spacer
		else
			
		end
	end
	 ),
	OptionsTabSelectionList = {
		prepare = function ( f95_arg0, f95_arg1, f95_arg2 )
			f95_arg1.options = {}
			local f95_local0 = {
				{
					optionDisplay = "OPEN OPTIONS MENU",
					action = OpenOptionsMenu
				}
			}
			local f95_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "OptionsTabSelectionList" )
			for f95_local5, f95_local6 in ipairs( f95_local0 ) do
				local f95_local7 = Engine.CreateModel( f95_local1, "buttonModel_" .. f95_local5 )
				f95_arg1.options[f95_local5] = f95_local7
				Engine.SetModelValue( Engine.CreateModel( f95_local7, "displayText" ), Engine.Localize( f95_local6.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( f95_local7, "action" ), f95_local6.action )
			end
		end,
		getCount = function ( f96_arg0 )
			return #f96_arg0.options
		end,
		getItem = function ( f97_arg0, f97_arg1, f97_arg2 )
			return f97_arg1.options[f97_arg2]
		end
	},
	StartMenuSelectionList = {
		prepare = function ( f98_arg0, f98_arg1, f98_arg2 )
			f98_arg1.options = {}
			local f98_local0 = nil
			if CoD.isCampaign == true then
				if LUI.DEV ~= nil then
					f98_local0 = {
						{
							optionDisplay = "MENU_RESTART_MISSION_CAPS",
							action = RestartMission
						},
						{
							optionDisplay = "MENU_RESTART_CHECKPOINT_CAPS",
							action = RestartFromCheckpoint
						},
						{
							optionDisplay = "MENU_END_GAME_CAPS",
							action = QuitGame
						}
					}
				else
					f98_local0 = {
						{
							optionDisplay = "MENU_RESTART_MISSION_CAPS",
							action = RestartMission
						},
						{
							optionDisplay = "MENU_END_GAME_CAPS",
							action = QuitGame
						}
					}
				end
			else
				f98_local0 = {
					{
						optionDisplay = "MPUI_CHOOSE_CLASS_CAPS",
						action = ChooseClass
					},
					{
						optionDisplay = "MPUI_CHANGE_TEAM_BUTTON_CAPS",
						action = ChooseTeam
					},
					{
						optionDisplay = "MENU_LEAVE_GAME_CAPS",
						action = QuitGame_MP
					}
				}
			end
			if not f98_local0 then
				return 
			end
			local f98_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "StartMenuSelectionModel" )
			for f98_local5, f98_local6 in ipairs( f98_local0 ) do
				local f98_local7 = Engine.CreateModel( f98_local1, "buttonModel_" .. f98_local5 )
				f98_arg1.options[f98_local5] = f98_local7
				Engine.SetModelValue( Engine.CreateModel( f98_local7, "displayText" ), Engine.Localize( f98_local6.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( f98_local7, "action" ), f98_local6.action )
			end
		end,
		getCount = function ( f99_arg0 )
			return #f99_arg0.options
		end,
		getItem = function ( f100_arg0, f100_arg1, f100_arg2 )
			return f100_arg1.options[f100_arg2]
		end
	},
	PartyLobbyMembers = {
		prepare = function ( f101_arg0, f101_arg1, f101_arg2 )
			f101_arg1.partyLobbyModel = f101_arg1:getModel( Engine.GetPrimaryController(), "partyLobby" )
			f101_arg1.partyLobbyMemberCountModel = Engine.GetModel( f101_arg1.partyLobbyModel, "memberCount" )
			f101_arg1:unsubscribeFromAllModels()
			f101_arg1:subscribeToModel( f101_arg1.partyLobbyMemberCountModel, function ()
				f101_arg1:updateDataSource()
			end )
		end,
		getCount = function ( f103_arg0 )
			return Engine.GetModelValue( f103_arg0.partyLobbyMemberCountModel )
		end,
		getItem = function ( f104_arg0, f104_arg1, f104_arg2 )
			return Engine.GetModel( f104_arg1.partyLobbyModel, "member" .. f104_arg2 - 1 )
		end
	},
	StorageGlobal = {
		getModel = function ( f105_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "storageGlobalRoot" )
		end
	},
	LobbyRoot = {
		getModel = function ( f106_arg0 )
			local f106_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			Engine.CreateModel( f106_local0, "leaderActivity" )
			if not Engine.GetModel( f106_local0, "lobbyStatusString1" ) then
				Engine.SetModelValue( Engine.CreateModel( f106_local0, "lobbyStatusString1" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f106_local0, "lobbyStatusString2" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f106_local0, "lobbyStatusString3" ), "" )
			end
			return f106_local0
		end
	},
	LobbyPromptTitle = {
		getModel = function ( f107_arg0 )
			local f107_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPromptModel" )
			local f107_local1 = Engine.CreateModel( f107_local0, "lobbyPromptTitle" )
			local f107_local2 = Engine.CreateModel( f107_local0, "lobbyPromptDescription" )
			Engine.SetModelValue( f107_local1, CoD.LobbyBase.Prompt.Title )
			Engine.SetModelValue( f107_local2, CoD.LobbyBase.Prompt.Description )
			return f107_local0
		end
	},
	LobbyPlaylistName = {
		getModel = function ( f108_arg0 )
			local f108_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
			local f108_local1 = Engine.CreateModel( f108_local0, "name" )
			return f108_local0
		end
	},
	LobbyPromptSelectionList = {
		prepare = function ( f109_arg0, f109_arg1, f109_arg2 )
			f109_arg1.options = {}
			local f109_local0 = CoD.LobbyBase.Prompt.Options
			local f109_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "LobbyPromptSelectionListModel" )
			for f109_local5, f109_local6 in ipairs( f109_local0 ) do
				local f109_local7 = Engine.CreateModel( f109_local1, "buttonModel_" .. f109_local5 )
				f109_arg1.options[f109_local5] = f109_local7
				Engine.SetModelValue( Engine.CreateModel( f109_local7, "displayText" ), Engine.Localize( f109_local6.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( f109_local7, "action" ), f109_local6.action )
				Engine.SetModelValue( Engine.CreateModel( f109_local7, "param" ), f109_local6.param )
				Engine.SetModelValue( Engine.CreateModel( f109_local7, "customId" ), f109_local6.customId )
			end
		end,
		getCount = function ( f110_arg0 )
			return #f110_arg0.options
		end,
		getItem = function ( f111_arg0, f111_arg1, f111_arg2 )
			return f111_arg1.options[f111_arg2]
		end
	},
	ModalDialogData = {
		getModel = function ( f112_arg0 )
			local f112_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" )
			Engine.SetModelValue( Engine.CreateModel( f112_local0, "title" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Title ) )
			Engine.SetModelValue( Engine.CreateModel( f112_local0, "description" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Description ) )
			return f112_local0
		end
	},
	ModalDialogDataList = {
		prepare = function ( f113_arg0, f113_arg1, f113_arg2 )
			f113_arg1.options = {}
			local f113_local0 = CoD.Menu.ModalDialogInfo.Options
			local f113_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" ), "list" )
			for f113_local5, f113_local6 in ipairs( f113_local0 ) do
				f113_arg1.options[f113_local5] = Engine.CreateModel( f113_local1, "buttonModel_" .. f113_local5 )
				Engine.SetModelValue( Engine.CreateModel( f113_arg1.options[f113_local5], "displayText" ), Engine.Localize( f113_local6 ) )
			end
		end,
		getCount = function ( f114_arg0 )
			return #f114_arg0.options
		end,
		getItem = function ( f115_arg0, f115_arg1, f115_arg2 )
			return f115_arg1.options[f115_arg2]
		end
	},
	SideModalDialogDataList = {
		prepare = function ( f116_arg0, f116_arg1, f116_arg2 )
			f116_arg1.options = {}
			local f116_local0 = CoD.Menu.ModalDialogInfo.Options
			local f116_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" ), "list" )
			for f116_local5, f116_local6 in ipairs( f116_local0 ) do
				f116_arg1.options[f116_local5] = Engine.CreateModel( f116_local1, "buttonModel_" .. f116_local5 )
				Engine.SetModelValue( Engine.CreateModel( f116_arg1.options[f116_local5], "displayText" ), Engine.Localize( f116_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f116_arg1.options[f116_local5], "displayImage" ), f116_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f116_arg1.options[f116_local5], "displayDesc" ), Engine.Localize( f116_local6.displayDesc ) )
			end
		end,
		getCount = function ( f117_arg0 )
			return #f117_arg0.options
		end,
		getItem = function ( f118_arg0, f118_arg1, f118_arg2 )
			return f118_arg1.options[f118_arg2]
		end
	},
	PartyPrivacy = {
		getModel = function ( f119_arg0 )
			Dvar.partyPrivacyEnabled:set( true )
			local f119_local0 = Engine.GetPartyPrivacy()
			local f119_local1 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				f119_local1 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
			end
			local f119_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
			Engine.SetModelValue( Engine.CreateModel( f119_local2, "privacy" ), f119_local0 )
			Engine.SetModelValue( Engine.CreateModel( f119_local2, "privacyStatus" ), PartyPrivacy( f119_local0 ) )
			Engine.SetModelValue( Engine.CreateModel( f119_local2, "maxPlayers" ), f119_local1 )
			return f119_local2
		end
	},
	MapVote = {
		getModel = function ( f120_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
		end
	},
	LobbyFriendsAndGroups = {
		updateOnlineCount = function ( f121_arg0, f121_arg1, f121_arg2 )
			local f121_local0 = Engine.GetModelValue( f121_arg1.friendsCountUIModel )
			local f121_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyFriends" )
			Engine.SetModelValue( Engine.CreateModel( f121_local1, "onlineCount" ), f121_local0 )
			Engine.SetModelValue( Engine.CreateModel( f121_local1, "moreCount" ), f121_local0 )
			DataSources.LobbyFriendsAndGroups.onlineFriendsCount = f121_local0
		end,
		prepare = function ( f122_arg0, f122_arg1, f122_arg2 )
			local f122_local0 = 0
			if CoD.isModeSelected == true then
				f122_local0 = 1
			end
			f122_arg1.listItems = {}
			if f122_arg1.countSubscription then
				f122_arg1:removeSubscription( f122_arg1.countSubscription )
			end
			if f122_arg1.lobbyListCountSubscription then
				f122_arg1:removeSubscription( f122_arg1.lobbyListCountSubscription )
			end
			local f122_local1 = {}
			f122_arg1.friendsUIModel = CoD.Friends.GetRootUIModel( f122_arg0 )
			f122_arg1.friendsCountUIModel = CoD.Friends.GetCountUIModel( f122_arg0 )
			if f122_arg1.friendsListCountSubscription then
				f122_arg1:removeSubscription( f122_arg1.friendsListCountSubscription )
			end
			f122_arg1.friendsListCountSubscription = f122_arg1:subscribeToModel( CoD.Friends.GetCountUIModel( f122_arg0 ), function ( model )
				DataSources.LobbyFriendsAndGroups.updateOnlineCount( f122_arg0, f122_arg1, f122_arg2 )
				f122_arg1:updateDataSource()
			end, false )
			if f122_arg1.friendsUpdateSubscription then
				f122_arg1:removeSubscription( f122_arg1.friendsUpdateSubscription )
			end
			local f122_local2 = CoD.Friends.GetUpdateUIModel( f122_arg0 )
			if f122_local2 ~= nil then
				f122_arg1.friendsUpdateSubscription = f122_arg1:subscribeToModel( f122_local2, function ( model )
					f122_arg1:updateDataSource()
				end, false )
			end
			DataSources.LobbyFriendsAndGroups.updateOnlineCount( f122_arg0, f122_arg1, f122_arg2 )
			local f122_local3 = Engine.GetModelValue( f122_arg1.friendsCountUIModel )
			for f122_local4 = 1, f122_local3, 1 do
				local f122_local7 = CoD.Friends.GetItemUIModel( f122_arg1.friendsUIModel, f122_local4 )
				local f122_local8 = Engine.GetModelValue( Engine.GetModel( f122_local7, "hasRank" ) )
				CoD.Friends.GetCount( f122_arg0 )
				if f122_local8 == 1 then
					Engine.SetModelValue( Engine.CreateModel( f122_local7, "rankShown" ), f122_local0 )
				else
					Engine.SetModelValue( Engine.CreateModel( f122_local7, "rankShown" ), 0 )
				end
				Engine.SetModelValue( Engine.CreateModel( f122_local7, "activity" ), Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY )
				table.insert( f122_local1, {
					model = f122_local7,
					isFriendItem = true,
					xuid = Engine.GetModelValue( Engine.GetModel( f122_local7, "xuid" ) )
				} )
			end
			local f122_local4 = {}
			local f122_local5 = Engine.GetModel( Engine.GetGlobalModel(), "unifiedGroupMembersListRoot" )
			if f122_local5 ~= nil then
				f122_arg1.groupMembersUIModel = f122_local5
				f122_arg1.groupMembersCountUIModel = Engine.GetModel( f122_arg1.groupMembersUIModel, "count" )
				if f122_arg1.groupsListCountSubscription then
					f122_arg1:removeSubscription( f122_arg1.groupsListCountSubscription )
				end
				f122_arg1.groupsListCountSubscription = f122_arg1:subscribeToModel( f122_arg1.groupMembersCountUIModel, function ( model )
					DataSources.LobbyFriendsAndGroups.updateOnlineCount( f122_arg0, f122_arg1, f122_arg2 )
					f122_arg1:updateDataSource()
				end, false )
				DataSources.LobbyFriendsAndGroups.updateOnlineCount( f122_arg0, f122_arg1, f122_arg2 )
				local f122_local6 = Engine.GetModelValue( f122_arg1.groupMembersCountUIModel )
				for f122_local9 = 1, f122_local6, 1 do
					local f122_local10 = Engine.GetModel( f122_arg1.groupMembersUIModel, "member" .. f122_local9 - 1 )
					local f122_local11 = Engine.GetModelValue( Engine.GetModel( f122_local10, "hasRank" ) )
					local f122_local12 = Engine.GetModelValue( Engine.GetModel( f122_local10, "xuid" ) )
					local f122_local13 = false
					for f122_local14 = 1, #f122_local1, 1 do
						if Engine.GetModelValue( Engine.GetModel( f122_local1[f122_local14].model, "xuid" ) ) == f122_local12 then
							f122_local13 = true
							break
						end
					end
					if not f122_local13 then
						if f122_local11 == 1 then
							Engine.SetModelValue( Engine.CreateModel( f122_local10, "rankShown" ), f122_local0 )
						else
							Engine.SetModelValue( Engine.CreateModel( f122_local10, "rankShown" ), 0 )
						end
						Engine.SetModelValue( Engine.CreateModel( f122_local10, "isJoinable" ), 0 )
						table.insert( f122_local4, {
							model = f122_local10,
							isGroupsItem = true,
							xuid = f122_local12
						} )
					end
				end
			end
			f122_local6 = #f122_local4
			for f122_local17, f122_local10 in ipairs( f122_local1 ) do
				table.insert( f122_arg1.listItems, f122_local10 )
			end
			for f122_local17, f122_local10 in ipairs( f122_local4 ) do
				table.insert( f122_arg1.listItems, f122_local10 )
			end
		end,
		getCount = function ( f126_arg0 )
			return #f126_arg0.listItems
		end,
		getItem = function ( f127_arg0, f127_arg1, f127_arg2 )
			return f127_arg1.listItems[f127_arg2].model
		end,
		getCustomPropertiesForItem = function ( f128_arg0, f128_arg1 )
			return f128_arg0.listItems[f128_arg1]
		end
	},
	LobbyList = {
		prepare = function ( f129_arg0, f129_arg1, f129_arg2 )
			f129_arg1.clientListModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
			f129_arg1.lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			if f129_arg1.gameClientUpdateSubscription then
				f129_arg1:removeSubscription( f129_arg1.gameClientUpdateSubscription )
			end
			f129_arg1.gameClientUpdateSubscription = f129_arg1:subscribeToModel( Engine.GetModel( f129_arg1.lobbyRootModel, "gameClient.update" ), function ()
				CoD.LobbyUtility.UpdateLobbyList()
				f129_arg1:setVerticalCount( Engine.GetModelValue( Engine.CreateModel( f129_arg1.clientListModel, "count" ) ), true )
			end, false )
			if f129_arg1.privateClientUpdateSubscription then
				f129_arg1:removeSubscription( f129_arg1.privateClientUpdateSubscription )
			end
			f129_arg1.privateClientUpdateSubscription = f129_arg1:subscribeToModel( Engine.GetModel( f129_arg1.lobbyRootModel, "privateClient.update" ), function ()
				CoD.LobbyUtility.UpdateLobbyList()
				f129_arg1:setVerticalCount( Engine.GetModelValue( Engine.CreateModel( f129_arg1.clientListModel, "count" ) ), true )
			end, false )
			if f129_arg1.lobbyNavSubscription then
				f129_arg1:removeSubscription( f129_arg1.lobbyNavSubscription )
			end
			f129_arg1.lobbyNavSubscription = f129_arg1:subscribeToModel( Engine.GetModel( f129_arg1.lobbyRootModel, "lobbyNav" ), function ()
				CoD.LobbyUtility.UpdateLobbyList()
				f129_arg1:setVerticalCount( Engine.GetModelValue( Engine.CreateModel( f129_arg1.clientListModel, "count" ) ) )
			end, false )
			CoD.LobbyUtility.UpdateLobbyList()
		end,
		getCount = function ( f133_arg0 )
			return Engine.GetModelValue( Engine.CreateModel( f133_arg0.clientListModel, "count" ) )
		end,
		getItem = function ( f134_arg0, f134_arg1, f134_arg2 )
			return Engine.GetModel( f134_arg1.clientListModel, f134_arg2 )
		end
	},
	LobbyPrivateHostMembers = {
		prepare = function ( f135_arg0, f135_arg1, f135_arg2 )
			f135_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "privateHost" )
			f135_arg1.countModel = Engine.GetModel( f135_arg1.baseModel, "count" )
			f135_arg1.updateModel = Engine.GetModel( f135_arg1.baseModel, "update" )
			if f135_arg1.countSubscription then
				f135_arg1:removeSubscription( f135_arg1.countSubscription )
			end
			f135_arg1.countSubscription = f135_arg1:subscribeToModel( f135_arg1.countModel, function ()
				f135_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f137_arg0 )
			return Engine.GetModelValue( f137_arg0.countModel )
		end,
		getItem = function ( f138_arg0, f138_arg1, f138_arg2 )
			return Engine.GetModel( f138_arg1.baseModel, "member" .. f138_arg2 - 1 )
		end
	},
	LobbyPrivateClientMembers = {
		prepare = function ( f139_arg0, f139_arg1, f139_arg2 )
			f139_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "privateClient" )
			f139_arg1.countModel = Engine.GetModel( f139_arg1.baseModel, "count" )
			f139_arg1.updateModel = Engine.GetModel( f139_arg1.baseModel, "update" )
			if f139_arg1.countSubscription then
				f139_arg1:removeSubscription( f139_arg1.countSubscription )
			end
			f139_arg1.countSubscription = f139_arg1:subscribeToModel( f139_arg1.countModel, function ()
				if not f139_arg1.preparing then
					f139_arg1:updateDataSource()
				end
			end, false )
		end,
		getCount = function ( f141_arg0 )
			return Engine.GetModelValue( f141_arg0.countModel )
		end,
		getItem = function ( f142_arg0, f142_arg1, f142_arg2 )
			return Engine.GetModel( f142_arg1.baseModel, "member" .. f142_arg2 - 1 )
		end
	},
	LobbyGameHostMembers = {
		prepare = function ( f143_arg0, f143_arg1, f143_arg2 )
			f143_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "gameHost" )
			f143_arg1.countModel = Engine.GetModel( f143_arg1.baseModel, "count" )
			f143_arg1.updateModel = Engine.GetModel( f143_arg1.baseModel, "update" )
			if f143_arg1.countSubscription then
				f143_arg1:removeSubscription( f143_arg1.countSubscription )
			end
			f143_arg1.countSubscription = f143_arg1:subscribeToModel( f143_arg1.countModel, function ()
				f143_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f145_arg0 )
			return Engine.GetModelValue( f145_arg0.countModel )
		end,
		getItem = function ( f146_arg0, f146_arg1, f146_arg2 )
			return Engine.GetModel( f146_arg1.baseModel, "member" .. f146_arg2 - 1 )
		end
	},
	LobbyGameClientMembers = {
		prepare = function ( f147_arg0, f147_arg1, f147_arg2 )
			f147_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "gameClient" )
			f147_arg1.countModel = Engine.GetModel( f147_arg1.baseModel, "count" )
			f147_arg1.updateModel = Engine.GetModel( f147_arg1.baseModel, "update" )
			if f147_arg1.countSubscription then
				f147_arg1:removeSubscription( f147_arg1.countSubscription )
			end
			f147_arg1.countSubscription = f147_arg1:subscribeToModel( f147_arg1.countModel, function ()
				f147_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f149_arg0 )
			return Engine.GetModelValue( f149_arg0.countModel )
		end,
		getItem = function ( f150_arg0, f150_arg1, f150_arg2 )
			return Engine.GetModel( f150_arg1.baseModel, "member" .. f150_arg2 - 1 )
		end
	},
	LobbyButtons = f0_local7( "LobbyButtons", function ( f151_arg0 )
		local f151_local0 = {}
		local f151_local1 = CoD.LobbyMenus.AddButtonsForTarget( f151_arg0, Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyNav" ) ) )
		CoD.perController[f151_arg0].updateNewBreadcrumbs = false
		local f151_local2 = false
		for f151_local6, f151_local7 in ipairs( f151_local1 ) do
			table.insert( f151_local0, {
				models = {
					displayText = Engine.Localize( f151_local7.optionDisplay ),
					customId = f151_local7.customId
				},
				properties = {
					disabled = f151_local7.disabled,
					action = f151_local7.action,
					actionParam = f151_local7.param,
					isLastButtonInGroup = f151_local7.isLastButtonInGroup,
					selectIndex = f151_local7.selected,
					isBreadcrumbNew = f151_local7.isBreadcrumbNew
				}
			} )
		end
		if #f151_local0 <= 0 then
			table.insert( f151_local0, {
				models = {
					displayText = ""
				},
				properties = {
					disabled = false,
					fake = true
				}
			} )
		end
		return f151_local0
	end
	, nil, nil, function ( f152_arg0, f152_arg1, f152_arg2 )
		local f152_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyNav" )
		if f152_arg1.lobbyNavSubscription then
			f152_arg1:removeSubscription( f152_arg1.lobbyNavSubscription )
		end
		f152_arg1.lobbyNavSubscription = f152_arg1:subscribeToModel( f152_local0, function ()
			f152_arg1:clearSavedActiveIndex()
			f152_arg1:clearSavedState()
			f152_arg1:updateDataSource( true, false )
			if f152_arg1 then
				if f152_arg1:getParent() then
					local f153_local0 = f152_arg1:getParent()
					if f153_local0:getParent() then
						f153_local0 = f152_arg1:getParent()
						f153_local0 = f153_local0:getParent()
						if f153_local0:getParent() then
							f153_local0 = IsMenuInState
							local f153_local1 = f152_arg1:getParent()
							f153_local1 = f153_local1:getParent()
							if not f153_local0( f153_local1:getParent(), "Right" ) then
							
							else
								
							end
						end
					end
				end
				f152_arg1:processEvent( {
					name = "gain_focus",
					controller = f152_arg0
				} )
			end
		end, false )
		local f152_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
		if f152_arg1.networkModeSub then
			f152_arg1:removeSubscription( f152_arg1.networkModeSub )
		end
		f152_arg1.networkModeSub = f152_arg1:subscribeToModel( f152_local1, function ()
			f152_arg1:updateDataSource()
		end, false )
		local f152_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
		if f152_arg1.timerActiveSubscription then
			f152_arg1:removeSubscription( f152_arg1.timerActiveSubscription )
		end
		f152_arg1.timerActiveSubscription = f152_arg1:subscribeToModel( f152_local2, function ()
			f152_arg1:updateDataSource()
		end, false )
		local f152_local3 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
		if f152_arg1.gameClientUpdateSubscription then
			f152_arg1:removeSubscription( f152_arg1.gameClientUpdateSubscription )
		end
		f152_arg1.gameClientUpdateSubscription = f152_arg1:subscribeToModel( f152_local3, function ()
			f152_arg1:updateDataSource( nil, true, true )
		end, false )
		local f152_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.isHost" )
		if f152_arg1.lobbyHostSub then
			f152_arg1:removeSubscription( f152_arg1.lobbyHostSub )
		end
		f152_arg1.lobbyHostSub = f152_arg1:subscribeToModel( f152_local4, function ()
			f152_arg1:updateDataSource()
		end, false )
		local f152_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.isHost" )
		if f152_arg1.lobbyGameHostSub then
			f152_arg1:removeSubscription( f152_arg1.lobbyGameHostSub )
		end
		f152_arg1.lobbyGameHostSub = f152_arg1:subscribeToModel( f152_local5, function ()
			f152_arg1:updateDataSource()
		end, false )
		local f152_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" )
		if f152_arg1.theaterDataDownloadedSub then
			f152_arg1:removeSubscription( f152_arg1.theaterDataDownloadedSub )
		end
		f152_arg1.theaterDataDownloadedSub = f152_arg1:subscribeToModel( f152_local6, function ()
			f152_arg1:updateDataSource()
		end, false )
		local f152_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" )
		if f152_arg1.updateButtonsModelSub then
			f152_arg1:removeSubscription( f152_arg1.updateButtonsModelSub )
		end
		f152_arg1.updateButtonsModelSub = f152_arg1:subscribeToModel( f152_local7, function ()
			local f160_local0 = IsCodCaster( f152_arg0 )
			local f160_local1 = Engine.GetGametypeSetting( "teamAssignment" )
			if f152_arg1.wasCodCaster == nil or f160_local0 ~= f152_arg1.wasCodCaster then
				f152_arg1.wasCodCaster = f160_local0
				f152_arg1:updateDataSource()
			elseif f152_arg1.oldTeamAssignment == nil or f152_arg1.oldTeamAssignment ~= f160_local1 then
				f152_arg1.oldTeamAssignment = f160_local1
				f152_arg1:updateDataSource()
			elseif CoD.perController[f152_arg0].updateNewBreadcrumbs == true then
				CoD.perController[f152_arg0].updateNewBreadcrumbs = false
				f152_arg1:updateDataSource()
			elseif CoD.isZombie == true and LobbyData.GetLobbyNav() == LobbyData.UITargets.UI_ZMLOBBYONLINE.id then
				f152_arg1:updateDataSource()
			end
		end, false )
	end
	, function ( f161_arg0, f161_arg1, f161_arg2 )
		if f161_arg0.LobbyButtons[f161_arg1].properties.isLastButtonInGroup then
			return 9
		else
			
		end
	end
	 ),
	SocialRoot = {
		getModel = function ( f162_arg0 )
			return Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
		end
	},
	SocialPlayerInfo = {
		getModel = function ( f163_arg0 )
			local f163_local0 = Engine.CreateModel( Engine.GetModelForController( f163_arg0 ), "socialPlayerInfo" )
			local f163_local1 = Engine.GetModelForController( f163_arg0 )
			local f163_local2 = Engine.GetModelValue( Engine.CreateModel( f163_local1, "Social.selectedFriendXUID" ), "xuid" )
			local f163_local3 = Engine.GetModelValue( Engine.CreateModel( f163_local1, "Social.selectedFriendGamertag" ) )
			if f163_local2 ~= nil then
				local f163_local4 = Engine.GetPlayerInfo( f163_arg0, f163_local2 )
				if f163_local4 ~= nil then
					local f163_local5 = true
					local f163_local6 = true
					local f163_local7 = true
					local f163_local8 = CoD.SocialUtility.GetRankIcons( "cp", f163_local5, f163_local4.info.cp.rank, f163_local4.info.cp.prestige )
					local f163_local9 = CoD.SocialUtility.GetRankIcons( "mp", f163_local6, f163_local4.info.mp.rank, f163_local4.info.mp.prestige )
					local f163_local10 = CoD.SocialUtility.GetRankIcons( "zm", f163_local7, f163_local4.info.zm.rank, f163_local4.info.zm.prestige )
					if f163_local4.info.gamertag == "" then
						f163_local4.info.gamertag = f163_local3
					end
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "xuid" ), f163_local4.info.xuid )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "cpRank" ), f163_local4.info.cp.rank )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "cpRankIcon" ), f163_local8 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "cpPrestige" ), f163_local4.info.cp.prestige )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "mpRank" ), f163_local4.info.mp.rank )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "mpRankIcon" ), f163_local9 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "mpPrestige" ), f163_local4.info.mp.prestige )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "zmRank" ), f163_local4.info.zm.rank )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "zmRankIcon" ), f163_local10 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "zmPrestige" ), f163_local4.info.zm.prestige )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "gamertag" ), f163_local4.info.gamertag )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "clantag" ), f163_local4.info.clantag )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "emblemBacking" ), f163_local4.info.emblemBacking )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "presence" ), f163_local4.info.presence )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "joinable" ), f163_local4.info.joinable )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "inGameLobby" ), f163_local4.info.inGameLobby )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "inPrivateLobby" ), f163_local4.info.inPrivateLobby )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "isSelf" ), f163_local4.info.isSelf )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "isLocal" ), f163_local4.info.isLocal )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "activity" ), f163_local4.info.activity )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "context" ), f163_local4.info.context )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "gametype" ), f163_local4.info.gametype )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "mapid" ), f163_local4.info.mapid )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "difficulty" ), f163_local4.info.difficulty )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "playlist" ), f163_local4.info.playlist )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "isFriend" ), f163_local4.info.isFriend )
				end
				if Engine.UInt64ToString( f163_local2 ) == "fefefefefefefefe" then
					local f163_local6 = 0
					local f163_local7 = 0
					local f163_local8 = CoD.SocialUtility.GetRankIcons( "cp", false, f163_local7, f163_local6 )
					local f163_local9 = 0
					local f163_local10 = 0
					local f163_local11 = CoD.SocialUtility.GetRankIcons( "mp", false, f163_local10, f163_local9 )
					local f163_local12 = 0
					local f163_local13 = 0
					local f163_local14 = CoD.SocialUtility.GetRankIcons( "zm", false, f163_local13, f163_local12 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "cpRank" ), f163_local7 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "cpRankIcon" ), f163_local8 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "cpPrestige" ), f163_local6 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "mpRank" ), f163_local10 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "mpRankIcon" ), f163_local11 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "mpPrestige" ), f163_local9 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "zmRank" ), f163_local13 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "zmRankIcon" ), f163_local14 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "zmPrestige" ), f163_local12 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "gamertag" ), f163_local3 )
					Engine.SetModelValue( Engine.CreateModel( f163_local0, "clantag" ), "" )
				end
			end
			return f163_local0
		end
	},
	PregameGlobal = {
		getModel = function ( f164_arg0 )
			local f164_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
			Engine.SetModelValue( Engine.CreateModel( f164_local0, "timeleft" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f164_local0, "status" ), "" )
			return f164_local0
		end
	},
	Pregame = {
		getModel = function ( f165_arg0 )
			local f165_local0 = Engine.CreateModel( Engine.GetModelForController( f165_arg0 ), "Pregame" )
			Engine.SetModelValue( Engine.CreateModel( f165_local0, "remainingVotes" ), 0 )
			return f165_local0
		end
	},
	PregameItemVoteTabs = f0_local7( "PregameItemVoteTabs", function ( f166_arg0 )
		local f166_local0 = {}
		local f166_local1 = CoD.CACUtility.PregameLoadoutFilters
		table.insert( f166_local0, {
			models = {
				index = -1,
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f166_local5, f166_local6 in pairs( f166_local1 ) do
			table.insert( f166_local0, {
				models = {
					tabName = f166_local6.title,
					index = f166_local5
				},
				properties = {}
			} )
		end
		table.insert( f166_local0, {
			models = {
				index = -1,
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f166_local0
	end
	 ),
	PregameRestrictedItems = f0_local7( "PregameRestrictedItems", function ( f167_arg0 )
		if DataSources.PregameRestrictedItems.cachedItems ~= nil then
			return DataSources.PregameRestrictedItems.cachedItems
		end
		local f167_local0, f167_local1 = CoD.CACUtility.GetAllItems( false, true )
		local f167_local2 = function ( f168_arg0 )
			if f168_arg0 == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
				return "MENU_RESTRICTED"
			elseif f168_arg0 == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY then
				return "MENU_BAN_ONLY"
			elseif f168_arg0 == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED then
				return "MENU_PROTECTED"
			else
				return ""
			end
		end
		
		local f167_local3 = {}
		for f167_local7, f167_local8 in pairs( f167_local1 ) do
			if #f167_local8.items > 0 then
				table.insert( f167_local3, {
					models = {
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT,
						attachmentIndex = f167_local8.index,
						restrictionState = f167_local8.restrictionState,
						hintText = f167_local2( f167_local8.restrictionState ),
						name = f167_local8.name,
						image = f167_local8.image,
						loadoutSlot = "attachment"
					}
				} )
			end
		end
		for f167_local7, f167_local8 in pairs( f167_local0 ) do
			table.insert( f167_local3, {
				models = {
					itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
					restrictionState = f167_local8.restrictionState,
					hintText = f167_local2( f167_local8.restrictionState ),
					itemIndex = f167_local8.index,
					name = f167_local8.name,
					image = f167_local8.image,
					loadoutSlot = f167_local8.loadoutSlot,
					groupName = f167_local8.groupName
				},
				properties = {
					item = {
						index = f167_local8.index
					}
				}
			} )
		end
		DataSources.PregameRestrictedItems.cachedItems = f167_local3
		return f167_local3
	end
	 ),
	PregameItemVotes = f0_local7( "PregameItemVotes", function ( f169_arg0 )
		if Engine.GetLobbyPregameState() ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE then
			return {}
		end
		local f169_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f169_local1 = f169_local0.sessionClients
		table.sort( f169_local1, function ( f170_arg0, f170_arg1 )
			return f170_arg0.pregamePosition < f170_arg1.pregamePosition
		end )
		local f169_local2 = {}
		for f169_local15, f169_local16 in ipairs( f169_local1 ) do
			if f169_local16.voteCount > 0 then
				for f169_local13, f169_local14 in ipairs( f169_local16.votes ) do
					local f169_local10 = ""
					local f169_local11 = ""
					local f169_local12 = ""
					if f169_local14.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
						local f169_local9 = Engine.GetUnlockableInfoByIndex( f169_local14.itemIndex )
						f169_local10 = f169_local9.name
						f169_local11 = f169_local9.image
						if LuaUtils.StartsWith( f169_local9.loadoutSlot, "hero" ) or f169_local9.loadoutSlot == "specialgadget" then
							f169_local11 = f169_local9.image .. "_large"
						end
						if LuaUtils.StartsWith( f169_local9.loadoutSlot, "killstreak" ) then
							f169_local11 = f169_local9.image .. "_menu"
						end
					elseif f169_local14.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
						f169_local10 = Engine.GetAttachmentNameByIndex( f169_local14.attachmentIndex )
						f169_local11 = Engine.GetAttachmentImageByIndex( f169_local14.attachmentIndex )
					elseif f169_local14.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
						f169_local10 = Engine.GetAttachmentNameByIndex( f169_local14.attachmentIndex )
						f169_local11 = Engine.GetAttachmentImageByIndex( f169_local14.attachmentIndex )
						local f169_local9 = Engine.GetUnlockableInfoByIndex( f169_local14.itemIndex )
						f169_local12 = f169_local9.name
					elseif f169_local14.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
						f169_local12 = itemInfo.group
					else
						error( "Item vote updated with invalid vote type" )
					end
					table.insert( f169_local2, {
						models = {
							name = f169_local10,
							image = f169_local11,
							headerName = f169_local12,
							hintText = f169_local16.gamertag,
							itemType = f169_local14.itemType,
							itemIndex = f169_local14.itemIndex,
							attachmentIndex = f169_local14.attachmentIndex,
							groupIndex = f169_local14.groupIndex
						},
						properties = {
							globalVoteIndex = f169_local14.globalVoteIndex
						}
					} )
				end
			end
		end
		table.sort( f169_local2, function ( f171_arg0, f171_arg1 )
			return f171_arg0.properties.globalVoteIndex < f171_arg1.properties.globalVoteIndex
		end )
		return f169_local2
	end
	, nil, nil, function ( f172_arg0, f172_arg1, f172_arg2 )
		local f172_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if f172_arg1.pregameUpdateSubscription then
			f172_arg1:removeSubscription( f172_arg1.pregameUpdateSubscription )
		end
		f172_arg1.pregameUpdateSubscription = f172_arg1:subscribeToModel( f172_local0, function ()
			f172_arg1:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameBannedItems = f0_local7( "PregameBannedItems", function ( f174_arg0 )
		local f174_local0 = {}
		local f174_local1 = {}
		local f174_local2 = {}
		local f174_local3 = function ( f175_arg0 )
			for f175_local3, f175_local4 in pairs( f175_arg0 ) do
				if not f174_local0[f175_local4] then
					f174_local0[f175_local4] = true
				end
			end
		end
		
		local f174_local4 = function ( f176_arg0, f176_arg1 )
			for f176_local3, f176_local4 in ipairs( f176_arg1 ) do
				if not f174_local1[f176_local4] then
					f174_local1[f176_local4] = true
				end
				if not f174_local2[f176_arg0] then
					f174_local2[f176_arg0] = {}
				end
				if not f174_local2[f176_arg0][f176_local4] then
					f174_local2[f176_arg0][f176_local4] = true
				end
			end
		end
		
		local f174_local5 = CoD.CACUtility.GetFullLoadout( f174_arg0 )
		for f174_local9, f174_local10 in ipairs( f174_local5.classes ) do
			f174_local3( f174_local10.weapons )
			f174_local3( f174_local10.equipment )
			f174_local3( f174_local10.perks )
			f174_local3( f174_local10.wildcards )
			if f174_local10.weapons.primary ~= nil then
				f174_local4( f174_local10.weapons.primary, f174_local10.primaryAttachments )
			end
			if f174_local10.weapons.secondary ~= nil then
				f174_local4( f174_local10.weapons.secondary, f174_local10.secondaryAttachments )
			end
		end
		f174_local6 = {}
		f174_local7 = {}
		f174_local8 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		for f174_local19, f174_local20 in ipairs( f174_local8.sessionClients ) do
			if f174_local20.voteCount > 0 then
				for f174_local17, f174_local18 in ipairs( f174_local20.votes ) do
					if f174_local18.voteType == Enum.VoteType.VOTE_TYPE_BAN then
						if f174_local18.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
							local f174_local16 = Engine.GetUnlockableInfoByIndex( f174_local18.itemIndex )
							if not LuaUtils.StartsWith( f174_local16.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f174_local16.loadoutSlot, "killstreak" ) then
								table.insert( f174_local6, {
									name = f174_local16.name,
									image = f174_local16.image,
									hintText = f174_local20.gamertag,
									groupIndex = f174_local16.groupIndex,
									loadoutSlot = f174_local16.loadoutSlot,
									loadoutSlotIndex = f174_local16.loadoutSlotIndex,
									equipped = f174_local0 and f174_local0[f174_local18.itemIndex] == true
								} )
							end
						end
						if f174_local18.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
							table.insert( f174_local7, {
								name = Engine.GetAttachmentNameByIndex( f174_local18.attachmentIndex ),
								image = Engine.GetAttachmentImageByIndex( f174_local18.attachmentIndex ),
								isOptic = Engine.IsOpticByAttachmentIndex( f174_local18.attachmentIndex ),
								hintText = f174_local20.gamertag,
								equipped = f174_local1 and f174_local1[f174_local18.attachmentIndex] == true
							} )
						end
						if f174_local18.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
							
						end
						if f174_local18.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
							
						else
							error( "PregameBannedItems: Unknown vote item type" )
						end
					end
				end
			end
		end
		f174_local10 = function ( f177_arg0, f177_arg1 )
			if f174_local7[f177_arg0].isOptic and f174_local7[f177_arg1].isOptic then
				return Engine.Localize( f174_local7[f177_arg0].name ) < Engine.Localize( f174_local7[f177_arg1].name )
			elseif f174_local7[f177_arg0].isOptic ~= f174_local7[f177_arg1].isOptic then
				return f174_local7[f177_arg0].isOptic
			else
				return Engine.Localize( f174_local7[f177_arg0].name ) < Engine.Localize( f174_local7[f177_arg1].name )
			end
		end
		
		f174_local11 = function ( f178_arg0, f178_arg1 )
			if f174_local6[f178_arg0].groupIndex ~= f174_local6[f178_arg1].groupIndex then
				return f174_local6[f178_arg0].groupIndex < f174_local6[f178_arg1].groupIndex
			elseif f174_local6[f178_arg0].loadoutSlot == f174_local6[f178_arg1].loadoutSlot then
				return Engine.Localize( f174_local6[f178_arg0].name ) < Engine.Localize( f174_local6[f178_arg1].name )
			else
				return Engine.Localize( f174_local6[f178_arg0].loadoutSlot ) < Engine.Localize( f174_local6[f178_arg1].loadoutSlot )
			end
		end
		
		f174_local12 = {}
		f174_local19 = false
		for f174_local15, f174_local17 in LUI.IterateTableBySortedKeys( f174_local6, f174_local11, nil ) do
			if f174_local19 == false and f174_local17.loadoutSlotIndex > 50 then
				for f174_local22, f174_local23 in LUI.IterateTableBySortedKeys( f174_local7, f174_local10, nil ) do
					table.insert( f174_local12, {
						models = {
							name = f174_local23.name,
							image = f174_local23.image,
							hintText = f174_local23.hintText,
							equipped = f174_local23.equipped
						}
					} )
				end
				f174_local19 = true
			end
			table.insert( f174_local12, {
				models = {
					name = f174_local17.name,
					image = f174_local17.image,
					hintText = f174_local17.hintText,
					equipped = f174_local17.equipped
				}
			} )
		end
		if f174_local19 == false then
			for f174_local15, f174_local17 in LUI.IterateTableBySortedKeys( f174_local7, f174_local10, nil ) do
				table.insert( f174_local12, {
					models = {
						name = f174_local17.name,
						image = f174_local17.image,
						hintText = f174_local17.hintText,
						equipped = f174_local17.equipped
					}
				} )
			end
		end
		return f174_local12
	end
	, nil, nil, function ( f179_arg0, f179_arg1, f179_arg2 )
		local f179_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if f179_arg1.pregameUpdateSubscription then
			f179_arg1:removeSubscription( f179_arg1.pregameUpdateSubscription )
		end
		f179_arg1.pregameUpdateSubscription = f179_arg1:subscribeToModel( f179_local0, function ()
			f179_arg1:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameBannedStreaks = f0_local7( "PregameAllBannedStreaks", function ( f181_arg0 )
		local f181_local0 = CoD.CACUtility.GetFullLoadout( f181_arg0 )
		local f181_local1 = {}
		for f181_local5, f181_local6 in pairs( f181_local0.streaks ) do
			f181_local1[f181_local6] = true
		end
		f181_local2 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		f181_local3 = f181_local2.sessionClients
		f181_local4 = {}
		for f181_local15, f181_local16 in ipairs( f181_local3 ) do
			if f181_local16.voteCount > 0 then
				for f181_local13, f181_local14 in ipairs( f181_local16.votes ) do
					if f181_local14.voteType == Enum.VoteType.VOTE_TYPE_BAN then
						local f181_local11 = Engine.GetUnlockableInfoByIndex( f181_local14.itemIndex )
						local f181_local12 = f181_local1 and f181_local1[f181_local14.itemIndex] == true
						if LUI.startswith( f181_local11.loadoutSlot, "killstreak" ) then
							table.insert( f181_local4, {
								name = f181_local11.name,
								image = f181_local11.image .. "_menu",
								momentum = f181_local11.momentum,
								gamertag = f181_local16.gamertag,
								equipped = f181_local12
							} )
						end
					end
				end
			end
		end
		f181_local5 = function ( f182_arg0, f182_arg1 )
			return f181_local4[f182_arg0].momentum < f181_local4[f182_arg1].momentum
		end
		
		f181_local6 = {}
		for f181_local8, f181_local9 in LUI.IterateTableBySortedKeys( f181_local4, f181_local5, nil ) do
			table.insert( f181_local6, {
				models = {
					name = f181_local9.name,
					image = f181_local9.image,
					hintText = f181_local9.gamertag,
					equipped = f181_local9.equipped
				}
			} )
		end
		return f181_local6
	end
	, nil, nil, function ( f183_arg0, f183_arg1, f183_arg2 )
		local f183_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if f183_arg1.pregameUpdateSubscription then
			f183_arg1:removeSubscription( f183_arg1.pregameUpdateSubscription )
		end
		f183_arg1.pregameUpdateSubscription = f183_arg1:subscribeToModel( f183_local0, function ()
			f183_arg1:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameClientList = f0_local7( "PregameClientList", function ( f185_arg0 )
		local f185_local0 = {}
		local f185_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f185_local2 = f185_local1.sessionClients
		table.sort( f185_local2, function ( f186_arg0, f186_arg1 )
			return f186_arg0.pregamePosition < f186_arg1.pregamePosition
		end )
		for f185_local7, f185_local8 in ipairs( f185_local2 ) do
			local f185_local9 = f185_local8.characterDraft.characterIndex
			local f185_local10 = f185_local8.characterDraft.loadout
			local f185_local11 = Engine.GetHeroName( Engine.CurrentSessionMode(), f185_local9 )
			local f185_local12 = Engine.GetLoadoutInfoForHero( Engine.CurrentSessionMode(), f185_local9, f185_local10 )
			local f185_local6 = ""
			if f185_local12 then
				f185_local6 = f185_local12.itemName
			end
			table.insert( f185_local0, {
				models = {
					xuid = f185_local8.xuid,
					gamertag = f185_local8.gamertag,
					clantag = "",
					rank = f185_local8.competitiveRank,
					rankIcon = f185_local8.competitiveRankIcon,
					prestige = f185_local8.prestige,
					team = f185_local8.team,
					teamString = tostring( f185_local8.team ),
					groupId = f185_local8.simpleGroupID,
					isHost = f185_local8.isHost,
					isLeader = f185_local8.isLeader,
					clientState = f185_local8.pregameState,
					position = f185_local8.pregamePosition,
					voteCount = f185_local8.voteCount,
					characterIndex = f185_local8.characterDraft.characterIndex,
					characterName = f185_local11,
					characterLoadout = f185_local8.characterDraft.loadout,
					characterLoadoutName = f185_local6
				},
				properties = {}
			} )
		end
		return f185_local0
	end
	, nil, nil, function ( f187_arg0, f187_arg1, f187_arg2 )
		local f187_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if f187_arg1.pregameUpdateSubscription then
			f187_arg1:removeSubscription( f187_arg1.pregameUpdateSubscription )
		end
		f187_arg1.pregameUpdateSubscription = f187_arg1:subscribeToModel( f187_local0, function ()
			f187_arg1:updateDataSource( false, false )
		end, false )
		local f187_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
		if f187_arg1.teamCountSubscription then
			f187_arg1:removeSubscription( f187_arg1.teamCountSubscription )
		end
		f187_arg1.teamCountSubscription = f187_arg1:subscribeToModel( f187_local1, function ()
			f187_arg1:updateDataSource()
		end, false )
	end
	 ),
	PregameBannedContentButtons = f0_local7( "PregameBannedContentButtons", function ( f190_arg0 )
		local f190_local0 = {}
		local f190_local1 = function ( f191_arg0, f191_arg1, f191_arg2, f191_arg3, f191_arg4 )
			Engine.SendPregameEditComplete( f191_arg2 )
			GoBack( f191_arg0, f191_arg1, f191_arg2, f191_arg3, f191_arg4 )
		end
		
		if ItemRestrictionCACEditActive() then
			table.insert( f190_local0, {
				text = "MENU_EDIT_CAC_CAPS",
				id = "editCaC",
				disabled = false,
				action = OpenCAC,
				params = {
					controller = f190_arg0
				}
			} )
			table.insert( f190_local0, {
				text = "MENU_DONE_CAPS",
				id = "cancel",
				disabled = false,
				action = f190_local1,
				params = {
					controller = f190_arg0
				}
			} )
		elseif ItemRestrictionScorestreakEditActive() then
			table.insert( f190_local0, {
				text = "MENU_EDIT_SCORESTREAKS_CAPS",
				id = "editStreaks",
				disabled = false,
				action = OpenScorestreaks,
				params = {
					controller = f190_arg0
				}
			} )
			table.insert( f190_local0, {
				text = "MENU_DONE_CAPS",
				id = "cancel",
				disabled = false,
				action = f190_local1,
				params = {
					controller = f190_arg0
				}
			} )
		end
		local f190_local2 = {}
		for f190_local6, f190_local7 in ipairs( f190_local0 ) do
			table.insert( f190_local2, {
				models = {
					displayText = Engine.Localize( f190_local7.text ),
					customId = f190_local7.customId
				},
				properties = {
					disabled = f190_local7.disabled,
					action = f190_local7.action,
					actionParam = f190_local7.params
				}
			} )
		end
		return f190_local2
	end
	 ),
	SocialPlayerDetailsButtons = f0_local7( "SocialPlayerDetailsButtons", function ( f192_arg0 )
		local f192_local0 = {}
		local f192_local1 = Engine.GetModelForController( f192_arg0 )
		local f192_local2 = Engine.GetModelValue( Engine.CreateModel( f192_local1, "Social.selectedFriendXUID" ) )
		local f192_local3 = Engine.GetModelValue( Engine.CreateModel( f192_local1, "Social.selectedFriendGamertag" ) )
		local f192_local4 = f192_local2 == Engine.GetXUID64( f192_arg0 )
		local f192_local5 = Engine.GetModelValue( Engine.CreateModel( f192_local1, "Social.selectedFriendInTitle" ) )
		if f192_local2 == nil then
			return f192_local0
		end
		local f192_local6 = Engine.GetPlayerInfo( f192_arg0, f192_local2 )
		if f192_local4 == false and IsInFileshare( f192_arg0 ) == false then
			if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f192_local2 ) then
				if Engine.IsLeader( f192_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
					if ShouldShowPromotePlayer( f192_arg0 ) then
						table.insert( f192_local0, {
							text = "MENU_PROMOTE_TO_PARTY_LEADER",
							id = "promoteToLeader",
							action = PromoteToLeader,
							params = {
								controller = f192_arg0,
								xuid = f192_local2
							},
							lastInGroup = false
						} )
					end
					table.insert( f192_local0, {
						text = "MENU_REMOVE_FROM_PARTY",
						id = "removeFromParty",
						action = DisconnectClient,
						params = {
							controller = f192_arg0,
							xuid = f192_local2
						},
						lastInGroup = true
					} )
				end
			elseif f192_local5 == true then
				local f192_local7 = Engine.IsFriendFromXUID( f192_arg0, f192_local2 )
				if f192_local6.info.joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or f192_local7 and f192_local6.info.joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
					if f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP or f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP or f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_IN_SAFEHOUSE or f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_IN_SAFEHOUSE or f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_IN_LOBBY or f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP or f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_IN_LOBBY or f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND or f192_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_IN_LOBBY then
						if f192_local7 then
							table.insert( f192_local0, {
								text = "MENU_JOIN_GAME",
								id = "joinGame",
								disabled = false,
								action = SocialJoin,
								params = {
									controller = f192_arg0,
									xuid = f192_local2,
									joinType = Enum.JoinType.JOIN_TYPE_FRIEND,
									goBack = true
								},
								lastInGroup = true
							} )
						else
							table.insert( f192_local0, {
								text = "MENU_JOIN_GAME",
								id = "joinGame",
								disabled = false,
								action = SocialJoin,
								params = {
									controller = f192_arg0,
									xuid = f192_local2,
									joinType = Enum.JoinType.JOIN_TYPE_NORMAL,
									goBack = true
								},
								lastInGroup = true
							} )
						end
					elseif f192_local7 then
						table.insert( f192_local0, {
							text = "MENU_JOIN_PARTY",
							id = "joinParty",
							disabled = false,
							action = SocialJoin,
							params = {
								controller = f192_arg0,
								xuid = f192_local2,
								joinType = Enum.JoinType.JOIN_TYPE_FRIEND,
								goBack = true
							},
							lastInGroup = true
						} )
					else
						table.insert( f192_local0, {
							text = "MENU_JOIN_PARTY",
							id = "joinParty",
							disabled = false,
							action = SocialJoin,
							params = {
								controller = f192_arg0,
								xuid = f192_local2,
								joinType = Enum.JoinType.JOIN_TYPE_NORMAL,
								goBack = true
							},
							lastInGroup = true
						} )
					end
				end
			end
		end
		if f192_local6.info.hasEverPlayed == true and not IsInGame() and not IsUserContentRestricted( f192_arg0 ) and IsInFileshare( f192_arg0 ) == false then
			table.insert( f192_local0, {
				text = "MENU_SHOWCASE_CAPS",
				id = "playerShowcase",
				disabled = false,
				action = OpenPlayerShowcaseOnParent,
				params = {
					controller = f192_arg0,
					xuid = f192_local2
				},
				lastInGroup = false
			} )
		end
		table.insert( f192_local0, {
			text = "XBOXLIVE_VIEW_PROFILE",
			id = "platformProfile",
			disabled = false,
			action = OpenPlatformProfile,
			params = {
				controller = f192_arg0,
				gamertag = f192_local3,
				xuid = f192_local2
			},
			lastInGroup = true
		} )
		if f192_local4 == false then
			local f192_local7 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f192_local2 )
			local f192_local8 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f192_local2 )
			local f192_local9 = Engine.IsPlayerMuted( f192_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f192_local2 )
			if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				f192_local9 = Engine.IsPlayerMuted( f192_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, f192_local2 )
			end
			local f192_local10 = CoD.isPC
			if f192_local10 then
				f192_local10 = not Engine.IsFriendFromXUID( f192_arg0, f192_local2 )
			end
			if not f192_local10 and CoD.canInviteToGame( f192_arg0, f192_local2 ) and f192_local7 == false and f192_local8 == false then
				if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
					table.insert( f192_local0, {
						text = "MENU_INVITE_GAME",
						id = "inviteToGame",
						disabled = false,
						action = LobbyInviteFriendGoBack,
						params = {
							controller = f192_arg0,
							xuid = f192_local2,
							gamertag = f192_local3
						},
						lastInGroup = false
					} )
				else
					table.insert( f192_local0, {
						text = "MENU_INVITE_TO_PARTY",
						id = "invteToParty",
						disabled = false,
						action = LobbyInviteFriendGoBack,
						params = {
							controller = f192_arg0,
							xuid = f192_local2,
							gamertag = f192_local3
						},
						lastInGroup = false
					} )
				end
			end
			if not Engine.IsFriendFromXUID( f192_arg0, f192_local2 ) then
				if IsDurango() then
					table.insert( f192_local0, {
						text = "MENU_FOLLOW_PLAYER",
						id = "sendFriendRequest",
						disabled = false,
						action = OpenPlatformFriendRequest,
						params = {
							controller = f192_arg0,
							gamertag = f192_local3,
							xuid = f192_local2
						},
						lastInGroup = false
					} )
				else
					table.insert( f192_local0, {
						text = "MENU_SEND_FRIEND_REQUEST",
						id = "sendFriendRequest",
						disabled = false,
						action = OpenPlatformFriendRequest,
						params = {
							controller = f192_arg0,
							gamertag = f192_local3,
							xuid = f192_local2
						},
						lastInGroup = false
					} )
				end
			end
			table.insert( f192_local0, {
				text = "MENU_REPORT_PLAYER",
				id = "reportPlayer",
				disabled = false,
				action = ShowReportPlayerDialog,
				params = {
					controller = f192_arg0,
					gamertag = f192_local3,
					xuid = f192_local2
				},
				lastInGroup = false
			} )
			if f192_local7 or f192_local8 then
				if f192_local9 then
					table.insert( f192_local0, {
						text = "MENU_UNMUTE_PLAYER",
						id = "unmutePlayer",
						disabled = false,
						action = UnMutePlayer,
						params = {
							controller = f192_arg0,
							xuid = f192_local2
						},
						lastInGroup = false
					} )
				else
					table.insert( f192_local0, {
						text = "MENU_MUTE_PLAYER",
						id = "mutePlayer",
						disabled = false,
						action = MutePlayer,
						params = {
							controller = f192_arg0,
							xuid = f192_local2
						},
						lastInGroup = false
					} )
				end
			end
		end
		local f192_local7 = {}
		for f192_local11, f192_local12 in ipairs( f192_local0 ) do
			table.insert( f192_local7, {
				models = {
					displayText = Engine.Localize( f192_local12.text ),
					customId = f192_local12.customId
				},
				properties = {
					disabled = f192_local12.disabled,
					action = f192_local12.action,
					actionParam = f192_local12.params,
					isLastButtonInGroup = f192_local12.lastInGroup
				}
			} )
		end
		return f192_local7
	end
	, nil, nil, function ( f193_arg0, f193_arg1, f193_arg2 )
		
	end
	, function ( f194_arg0, f194_arg1, f194_arg2 )
		if f194_arg0.SocialPlayerDetailsButtons[f194_arg1].properties.isLastButtonInGroup then
			return 9
		else
			
		end
	end
	 ),
	LobbySelectionListSelectMode = {
		prepare = function ( f195_arg0, f195_arg1, f195_arg2 )
			f195_arg1.options = {}
			local f195_local0 = {}
			CoD.LobbyMenus.AddButtons( f195_arg0, "privateClient.isHost", f195_local0, CoD.LobbyMenus.ModeSelect, CoD.LobbyMenus.ModeSelect )
			local f195_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "LobbySelectModeSelectionModel" )
			for f195_local5, f195_local6 in ipairs( f195_local0 ) do
				local f195_local7 = Engine.CreateModel( f195_local1, "buttonModel_" .. f195_local5 )
				f195_arg1.options[f195_local5] = f195_local6
				f195_arg1.options[f195_local5].model = f195_local7
				Engine.SetModelValue( Engine.CreateModel( f195_local7, "displayText" ), Engine.Localize( f195_local6.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( f195_local7, "customId" ), f195_local6.customId )
				f195_arg1.options[f195_local5].action = f195_local6.action
				f195_arg1.options[f195_local5].actionParam = f195_local6.param
			end
		end,
		getCount = function ( f196_arg0 )
			return #f196_arg0.options
		end,
		getItem = function ( f197_arg0, f197_arg1, f197_arg2 )
			return f197_arg1.options[f197_arg2].model
		end,
		getSpacerAfterRow = function ( f198_arg0, f198_arg1, f198_arg2 )
			if f198_arg0.options[f198_arg1] and f198_arg0.options[f198_arg1] then
				if f198_arg0.options[f198_arg1].isLastButtonInGroup then
					return 9
				else
					return 0
				end
			else
				return 7
			end
		end,
		getWidgetTypeForItem = function ( f199_arg0, f199_arg1, f199_arg2 )
			return CoD.List1ButtonLarge_PH
		end,
		getCustomPropertiesForItem = function ( f200_arg0, f200_arg1 )
			return f200_arg0.options[f200_arg1]
		end
	},
	SpinnerMessage = {
		getModel = function ( f201_arg0 )
			local f201_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "spinnerModel" )
			Engine.CreateModel( f201_local0, "spinnerMessage" )
			return f201_local0
		end
	},
	FeaturedCardsRoot = {
		getModel = function ( f202_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" )
		end
	},
	NetworkImage = {
		getModel = function ( f203_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "NetworkImage" )
		end
	},
	FeaturedCards = f0_local7( "FeaturedCards", function ( f204_arg0 )
		local f204_local0 = {}
		local f204_local1 = Engine.GetFeaturedCardsData()
		if f204_local1 ~= nil then
			local f204_local2 = f204_local1.cardsCountToShow
			if f204_local1.enabled == true and f204_local2 > 0 then
				local f204_local3 = 0
				for f204_local4 = 0, f204_local2 - 1, 1 do
					local f204_local7 = Engine.GetFeaturedCard( f204_local4 )
					if f204_local7.valid == true then
						table.insert( f204_local0, {
							models = {
								index = f204_local4,
								title = f204_local7.title,
								subTitle = f204_local7.subTitle,
								type = f204_local7.type,
								cardsCountToShow = f204_local7.cardsCountToShow,
								actionTitle = f204_local7.actionTitle,
								actionButton = f204_local7.actionButton,
								action = f204_local7.action,
								background = f204_local7.bg,
								sequence = f204_local3
							}
						} )
						f204_local3 = f204_local3 + 1
					end
				end
			end
		end
		return f204_local0
	end
	 ),
	MarketingRoot = {
		getModel = function ( f205_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "MarketingRoot" )
		end
	},
	NetworkInfo = {
		getModel = function ( f206_arg0 )
			local f206_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "NetworkInfo" )
			local f206_local1 = Engine.CreateModel( f206_local0, "natType" )
			local f206_local2 = Engine.CreateModel( f206_local0, "bandwidth" )
			local f206_local3 = Engine.CreateModel( f206_local0, "connectionType" )
			local f206_local4 = Engine.CreateModel( f206_local0, "externalIP" )
			local f206_local5 = Engine.CreateModel( f206_local0, "internalIP" )
			local f206_local6 = Engine.CreateModel( f206_local0, "region" )
			local f206_local7 = Engine.CreateModel( f206_local0, "version" )
			local f206_local8 = Engine.CreateModel( f206_local0, "connectivityInfo" )
			local f206_local9 = Engine.CreateModel( f206_local0, "supportURL" )
			local f206_local10 = function ( f207_arg0, f207_arg1 )
				local f207_local0, f207_local1 = Engine.GetSystemInfo( f206_arg0, f207_arg1 )
				Engine.SetModelValue( f207_arg0, f207_local0 )
			end
			
			f206_local10( f206_local1, CoD.SYSINFO_NAT_TYPE )
			f206_local10( f206_local2, CoD.SYSINFO_BANDWIDTH )
			f206_local10( f206_local3, CoD.SYSINFO_CONNECTION_TYPE )
			f206_local10( f206_local4, CoD.SYSINFO_EXTERNAL_IP_ADDRESS )
			f206_local10( f206_local5, CoD.SYSINFO_INTERNAL_IP_ADDRESS )
			f206_local10( f206_local6, CoD.SYSINFO_GEOGRAPHICAL_REGION )
			f206_local10( f206_local7, CoD.SYSINFO_VERSION_NUMBER )
			f206_local10( f206_local8, CoD.SYSINFO_CONNECTIVITY_INFO )
			local f206_local11 = "MENU_OPTIONS_NETWORK_CUSTOMER_SERVICE_LINK"
			if Dvar.ui_supportURL ~= nil then
				f206_local11 = Dvar.ui_supportURL:get()
			end
			Engine.SetModelValue( f206_local9, f206_local11 )
			return f206_local0
		end
	},
	PlayGoDownloadProgress = {
		getModel = function ( f208_arg0 )
			local f208_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress" )
			Engine.SetModelValue( Engine.CreateModel( f208_local0, "progress" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f208_local0, "chunk" ), "" )
			return f208_local0
		end
	},
	NetStatsInfo = {
		getModel = function ( f209_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "NetStatsInfo" )
		end
	},
	MOTD = {
		getModel = function ( f210_arg0 )
			local f210_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "motd" )
			local f210_local1 = Engine.CreateModel( f210_local0, "isValid" )
			local f210_local2 = Engine.CreateModel( f210_local0, "singleView" )
			local f210_local3 = Engine.CreateModel( f210_local0, "motdVersion" )
			local f210_local4 = Engine.CreateModel( f210_local0, "title" )
			local f210_local5 = Engine.CreateModel( f210_local0, "message" )
			local f210_local6 = Engine.CreateModel( f210_local0, "image" )
			local f210_local7 = Engine.CreateModel( f210_local0, "action" )
			local f210_local8 = Engine.CreateModel( f210_local0, "actionContext" )
			local f210_local9 = Engine.CreateModel( f210_local0, "actionString" )
			local f210_local10 = Engine.CreateModel( f210_local0, "bannerTitle" )
			local f210_local11 = Engine.CreateModel( f210_local0, "bannerMessage" )
			local f210_local12 = Engine.CreateModel( f210_local0, "bannerImage" )
			local f210_local13 = Engine.CreateModel( f210_local0, "bannerAction" )
			local f210_local14 = Engine.CreateModel( f210_local0, "bannerActionContext" )
			local f210_local15 = Engine.CreateModel( f210_local0, "bannerActionString" )
			local f210_local16 = Engine.GetMOTD()
			Engine.SetModelValue( f210_local1, f210_local16.isValid )
			if f210_local16.isValid then
				Engine.SetModelValue( f210_local2, f210_local16.singleView )
				Engine.SetModelValue( f210_local3, f210_local16.motdVersion )
				Engine.SetModelValue( f210_local4, f210_local16.title )
				Engine.SetModelValue( f210_local5, f210_local16.message )
				Engine.SetModelValue( f210_local6, f210_local16.image )
				Engine.SetModelValue( f210_local7, f210_local16.action )
				Engine.SetModelValue( f210_local8, f210_local16.actionContext )
				Engine.SetModelValue( f210_local9, f210_local16.actionString )
				Engine.SetModelValue( f210_local10, f210_local16.bannerTitle )
				Engine.SetModelValue( f210_local11, f210_local16.bannerMessage )
				Engine.SetModelValue( f210_local12, f210_local16.bannerImage )
				Engine.SetModelValue( f210_local13, f210_local16.bannerAction )
				Engine.SetModelValue( f210_local14, f210_local16.bannerActionContext )
				Engine.SetModelValue( f210_local15, f210_local16.bannerActionString )
			end
			return f210_local0
		end
	},
	MtxCommsMOTD = {
		getModel = function ( f211_arg0 )
			local f211_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsMOTD" )
			local f211_local1 = Engine.GetMarketingMessage( f211_arg0, "motd" )
			if f211_local1 ~= nil then
				for f211_local5, f211_local6 in next, f211_local1, nil do
					Engine.SetModelValue( Engine.CreateModel( f211_local0, f211_local5 ), f211_local6 )
				end
				if not f211_local1.messageID then
					Engine.SetModelValue( Engine.CreateModel( f211_local0, "messageID" ), 0 )
				end
			end
			return f211_local0
		end
	},
	MtxCommsRegistration = {
		getModel = function ( f212_arg0 )
			local f212_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsRegistration" )
			local f212_local1 = Engine.GetMarketingMessage( f212_arg0, "registration" )
			if f212_local1 ~= nil and not f212_local1.messageViewReported then
				for f212_local5, f212_local6 in next, f212_local1, nil do
					Engine.SetModelValue( Engine.CreateModel( f212_local0, f212_local5 ), f212_local6 )
				end
				if f212_local1.action ~= nil then
					if f212_local1.action == "registration" then
						Engine.SetModelValue( Engine.CreateModel( f212_local0, "action_title" ), Engine.Localize( "ACCOUNT_LINK_REGISTER" ) )
					elseif f212_local1.action == "opt-in" then
						Engine.SetModelValue( Engine.CreateModel( f212_local0, "action_title" ), Engine.Localize( "ACCOUNT_LINK_LEARN_MORE" ) )
					end
				end
			else
				local f212_local2 = Engine.GetMarketingMessage( f212_arg0, "motd" )
				if f212_local2 ~= nil and f212_local2.hasBanner then
					Engine.SetModelValue( Engine.CreateModel( f212_local0, "content_short" ), f212_local2.bannerTitle )
					Engine.SetModelValue( Engine.CreateModel( f212_local0, "action_title" ), Engine.Localize( f212_local2.bannerActionString ) )
					Engine.SetModelValue( Engine.CreateModel( f212_local0, "action" ), f212_local2.bannerAction )
					Engine.SetModelValue( Engine.CreateModel( f212_local0, "image" ), f212_local2.bannerImage )
				end
			end
			return f212_local0
		end
	},
	WeaponBuildKitCategories = f0_local7( "WeaponBuildKitCategories", function ( f213_arg0 )
		local f213_local0 = {}
		local f213_local1 = CoD.Craft.WeaponGroupNames
		for f213_local2 = 1, #f213_local1, 1 do
			local f213_local5 = f213_local1[f213_local2]
			table.insert( f213_local0, {
				models = {
					breadcrumbCount = 0,
					categoryRef = f213_local5.weapon_category,
					categoryName = f213_local5.lowercaseName,
					categoryImage = f213_local5.weapon_image
				},
				properties = {}
			} )
		end
		return f213_local0
	end
	, true ),
	WeaponGroups = f0_local7( "WeaponGroups", function ( f214_arg0 )
		local f214_local0 = {}
		local f214_local1 = function ( f215_arg0, f215_arg1 )
			local f215_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
			for f215_local4, f215_local5 in ipairs( f215_arg0 ) do
				if CoD.UnlockablesTable and CoD.UnlockablesTable[f215_local5.weapon_category] then
					table.insert( f214_local0, {
						models = {
							tabName = f215_local5.name,
							breadcrumbCount = Engine.WeaponGroupNewItemCount( f214_arg0, f215_local5.weapon_category, nil, f215_local0 )
						},
						properties = {
							filter = f215_local5.weapon_category,
							loadoutType = f215_arg1
						}
					} )
				end
			end
		end
		
		table.insert( f214_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		local f214_local2 = CoD.perController[f214_arg0].weaponClassGroup
		if f214_local2 == "primary" then
			f214_local1( CoD.CACUtility.PrimaryWeaponGroupNames, "primary" )
		elseif f214_local2 == "secondary" then
			f214_local1( CoD.CACUtility.SecondaryWeaponGroupNames, "secondary" )
		end
		table.insert( f214_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f214_local0
	end
	, true ),
	Unlockables = {
		prepare = function ( f216_arg0, f216_arg1, f216_arg2 )
			if not CoD.UnlockablesTable then
				CoD.UnlockablesTable = CoD.GetUnlockablesTable( f216_arg0, f216_arg2 )
			end
			f216_arg1.dataSource = CoD.UnlockablesTable
		end,
		getCount = function ( f217_arg0 )
			if not DataSources.Unlockables.currentFilter and f217_arg0.dataSource.filterList then
				return #f217_arg0.dataSource.filterList
			elseif f217_arg0.dataSource[DataSources.Unlockables.currentFilter] then
				return #f217_arg0.dataSource[DataSources.Unlockables.currentFilter]
			else
				return 0
			end
		end,
		getItem = function ( f218_arg0, f218_arg1, f218_arg2 )
			if not DataSources.Unlockables.currentFilter and f218_arg1.dataSource.filterList then
				return f218_arg1.dataSource.filterList[f218_arg2]
			elseif f218_arg1.dataSource[DataSources.Unlockables.currentFilter] then
				return f218_arg1.dataSource[DataSources.Unlockables.currentFilter][f218_arg2]
			else
				
			end
		end,
		setCurrentFilterItem = function ( f219_arg0 )
			DataSources.Unlockables.currentFilter = f219_arg0
		end,
		getCurrentFilterItem = function ()
			return DataSources.Unlockables.currentFilter
		end,
		currentFilter = nil
	},
	CraftWeaponList = {
		prepare = function ( f221_arg0, f221_arg1, f221_arg2 )
			if not CoD.CraftWeaponListTable then
				CoD.CraftWeaponListTable = CoD.GetCraftWeaponListTable( f221_arg0, f221_arg2 )
			end
			f221_arg1.dataSource = CoD.CraftWeaponListTable
		end,
		getCount = function ( f222_arg0 )
			if not DataSources.CraftWeaponList.currentFilter and f222_arg0.dataSource.filterList then
				return #f222_arg0.dataSource.filterList
			elseif f222_arg0.dataSource[DataSources.CraftWeaponList.currentFilter] then
				return #f222_arg0.dataSource[DataSources.CraftWeaponList.currentFilter]
			else
				return 0
			end
		end,
		getItem = function ( f223_arg0, f223_arg1, f223_arg2 )
			if not DataSources.CraftWeaponList.currentFilter and f223_arg1.dataSource.filterList then
				return f223_arg1.dataSource.filterList[f223_arg2]
			elseif f223_arg1.dataSource[DataSources.CraftWeaponList.currentFilter] then
				return f223_arg1.dataSource[DataSources.CraftWeaponList.currentFilter][f223_arg2]
			else
				
			end
		end,
		setCurrentFilterItem = function ( f224_arg0 )
			DataSources.CraftWeaponList.currentFilter = f224_arg0
		end,
		getCurrentFilterItem = function ()
			return DataSources.CraftWeaponList.currentFilter
		end,
		currentFilter = nil
	},
	WeaponAttachments = f0_local7( "WeaponAttachments", function ( f226_arg0 )
		local f226_local0 = {}
		local f226_local1 = CoD.perController[f226_arg0].weaponSlot
		local f226_local2 = CoD.perController[f226_arg0].weaponCategory
		local f226_local3 = CoD.perController[f226_arg0].classModel
		local f226_local4 = Engine.GetModelValue( Engine.GetModel( f226_local3, f226_local1 .. ".itemIndex" ) )
		local f226_local5 = Engine.GetNumAttachments( f226_local4 )
		local f226_local6 = CoD.perController[f226_arg0].attachmentType
		local f226_local7 = Engine.GetItemRef( f226_local4 )
		local f226_local8 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
		local f226_local9 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
		local f226_local10 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
		local f226_local11 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
		local f226_local12 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
		local f226_local13 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
		local f226_local14 = {
			damage = 0,
			range = 0,
			fireRate = 0,
			accuracy = 0
		}
		local f226_local15 = CoD.CACUtility.GetAttachmentListForSlot( f226_local2 )
		local f226_local16 = {}
		for f226_local27, f226_local28 in ipairs( f226_local15 ) do
			local f226_local29 = Engine.GetModelValue( Engine.GetModel( f226_local3, f226_local28 .. ".itemIndex" ) )
			if f226_local28 ~= f226_local2 and CoD.CACUtility.EmptyItemIndex < f226_local29 then
				local f226_local20 = Engine.GetAttachmentRef( f226_local4, f226_local29 )
				table.insert( f226_local16, f226_local20 )
				local f226_local21 = Engine.TableLookup( nil, CoD.weaponAttributes, f226_local8, f226_local20, f226_local9, f226_local7, f226_local10 )
				local f226_local22 = Engine.TableLookup( nil, CoD.weaponAttributes, f226_local8, f226_local20, f226_local9, f226_local7, f226_local11 )
				local f226_local23 = Engine.TableLookup( nil, CoD.weaponAttributes, f226_local8, f226_local20, f226_local9, f226_local7, f226_local12 )
				local f226_local24 = Engine.TableLookup( nil, CoD.weaponAttributes, f226_local8, f226_local20, f226_local9, f226_local7, f226_local13 )
				local f226_local25 = f226_local14.damage
				local f226_local26
				if f226_local21 == "" then
					f226_local26 = 0
					if not f226_local26 then
					
					else
						f226_local14.damage = f226_local25 + f226_local26
						f226_local25 = f226_local14.range
						if f226_local22 == "" then
							f226_local26 = 0
							if not f226_local26 then
							
							else
								f226_local14.range = f226_local25 + f226_local26
								f226_local25 = f226_local14.fireRate
								if f226_local23 == "" then
									f226_local26 = 0
									if not f226_local26 then
									
									else
										f226_local14.fireRate = f226_local25 + f226_local26
										f226_local25 = f226_local14.accuracy
										if f226_local24 == "" then
											f226_local26 = 0
											if not f226_local26 then
											
											else
												f226_local14.accuracy = f226_local25 + f226_local26
											end
										end
										f226_local26 = f226_local24
									end
								end
								f226_local26 = f226_local23
							end
						end
						f226_local26 = f226_local22
					end
				end
				f226_local26 = f226_local21
			end
		end
		for f226_local17 = 1, f226_local5 - 1, 1 do
			f226_local28 = CoD.CACUtility.EmptyItemIndex
			if f226_local6 == "attachment" then
				if Engine.IsOptic( f226_local4, f226_local17 ) == false then
					f226_local28 = Engine.GetItemAttachment( f226_local4, f226_local17 )
				end
			elseif f226_local6 == "optic" and Engine.IsOptic( f226_local4, f226_local17 ) == true then
				f226_local28 = Engine.GetItemAttachment( f226_local4, f226_local17 )
			end
			if CoD.CACUtility.EmptyItemIndex < f226_local28 and Engine.GetAttachmentAllocationCost( f226_local4, f226_local17 ) > 0 then
				local f226_local20 = Engine.GetAttachmentRef( f226_local4, f226_local17 )
				local f226_local21 = Engine.GetAttachmentNameByIndex( f226_local28 )
				local f226_local22 = Engine.GetAttachmentUniqueImageByIndex( f226_local4, f226_local17 )
				local f226_local24 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" ), f226_local4 .. ".weaponAttributes" )
				local f226_local25 = function ( f227_arg0, f227_arg1 )
					local f227_local0 = Engine.GetModelValue( Engine.GetModel( f226_local24, f227_arg0 ) )
					local f227_local1 = Engine.TableLookup( nil, CoD.weaponAttributes, f226_local8, f226_local20, f226_local9, f226_local7, f227_arg1 )
					if f227_local0 == "" then
						f227_local0 = 0
					end
					if f227_local1 == "" then
						f227_local1 = 0
					end
					local f227_local2 = false
					for f227_local6, f227_local7 in ipairs( f226_local16 ) do
						if f227_local7 == f226_local20 then
							f227_local2 = true
							break
						end
					end
					f227_local3 = f227_local0 + f226_local14[f227_arg0]
					if not f227_local2 then
						f227_local3 = f227_local3 + f227_local1
					end
					return f227_local0 .. "," .. f227_local3
				end
				
				table.insert( f226_local0, {
					models = {
						name = f226_local21,
						image = f226_local22,
						itemIndex = f226_local17,
						weaponIndex = f226_local4,
						attachmentIndex = f226_local28,
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT,
						weaponSlot = f226_local2,
						weaponIndex = f226_local4,
						description = Engine.GetAttachmentDesc( f226_local4, f226_local17 ),
						weaponAttributes = {
							damage = f226_local25( "damage", f226_local10 ),
							range = f226_local25( "range", f226_local11 ),
							fireRate = f226_local25( "fireRate", f226_local12 ),
							accuracy = f226_local25( "accuracy", f226_local13 )
						}
					},
					properties = {
						weaponIndex = f226_local4,
						attachmentTableIndex = f226_local28,
						acvIndex = CoD.CACUtility.EmptyItemIndex
					}
				} )
			end
		end
		return f226_local0
	end
	, true ),
	EquippedBubbleGumPack = {
		getModel = function ( f228_arg0 )
			local f228_local0 = Engine.CreateModel( Engine.GetModelForController( f228_arg0 ), "EquippedBubbleGumPack" )
			Engine.SetModelValue( Engine.CreateModel( f228_local0, "bgbPackIndex" ), Engine.GetEquippedBubbleGumPack( f228_arg0 ) )
			return f228_local0
		end
	},
	BubbleGumBuffs = {
		prepare = function ( f229_arg0, f229_arg1, f229_arg2 )
			DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( f229_arg0, Engine.GetModelForController( f229_arg0 ), Engine.GetEquippedBubbleGumPack( f229_arg0 ) )
		end,
		getCount = function ( f230_arg0 )
			return CoD.BubbleGumBuffs.NumBuffsPerPack
		end,
		getItem = function ( f231_arg0, f231_arg1, f231_arg2 )
			if f231_arg1:getParent() then
				local f231_local0 = f231_arg1:getParent()
				return f231_local0:getModel( f231_arg0, "BubbleGumBuffs." .. f231_arg2 )
			else
				return Engine.CreateModel( Engine.GetModelForController( f231_arg0 ), "BubbleGumBuffs." .. f231_arg2 )
			end
		end,
		setupBubbleGumBuffsModel = function ( f232_arg0, f232_arg1, f232_arg2 )
			local f232_local0 = Engine.CreateModel( f232_arg1, "BubbleGumBuffs" )
			for f232_local1 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
				local f232_local4 = Engine.CreateModel( f232_local0, f232_local1 + 1 )
				local f232_local5 = Engine.GetBubbleGumBuff( f232_arg0, f232_arg2, f232_local1 )
				Engine.SetModelValue( Engine.CreateModel( f232_local4, "bgbIndex" ), f232_local1 )
				Engine.SetModelValue( Engine.CreateModel( f232_local4, "itemIndex" ), f232_local5 )
			end
		end
	},
	BubbleGumPacks = {
		prepare = function ( f233_arg0, f233_arg1, f233_arg2 )
			f233_arg1.bubbleGumPacks = {}
			local f233_local0 = Engine.CreateModel( Engine.GetModelForController( f233_arg0 ), "BubbleGumPacks" )
			for f233_local1 = 0, CoD.BubbleGumBuffs.NumPacks - 1, 1 do
				local f233_local4 = Engine.CreateModel( f233_local0, f233_local1 )
				local f233_local5 = Engine.GetBubbleGumPackName( f233_arg0, f233_local1 )
				Engine.SetModelValue( Engine.CreateModel( f233_local4, "bgbPackIndex" ), f233_local1 )
				Engine.SetModelValue( Engine.CreateModel( f233_local4, "bubbleGumPackName" ), f233_local5 )
				DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( f233_arg0, f233_local4, f233_local1 )
				local f233_local6 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f233_arg0 ), "EquippedBubbleGumPack.bgbPackIndex" ) )
				if f233_local6 and f233_local6 + 1 == f233_local1 then
					f233_arg1.selectIndex = f233_local1
				end
				table.insert( f233_arg1.bubbleGumPacks, f233_local4 )
			end
		end,
		getCount = function ( f234_arg0 )
			return #f234_arg0.bubbleGumPacks
		end,
		getItem = function ( f235_arg0, f235_arg1, f235_arg2 )
			return f235_arg1.bubbleGumPacks[f235_arg2]
		end,
		getCustomPropertiesForItem = function ( f236_arg0, f236_arg1 )
			if f236_arg0.selectIndex == f236_arg1 then
				return {
					selectIndex = true
				}
			else
				
			end
		end
	},
	BubbleGumTabType = f0_local7( "BubbleGumTabType", function ( f237_arg0 )
		local f237_local0 = {}
		table.insert( f237_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f237_local0, {
			models = {
				tabName = Engine.Localize( "ZMUI_BUBBLEGUM_TAB_NAME_CAPS" ),
				breadcrumbCount = Engine.WeaponGroupNewItemCount( f237_arg0, "bubblegum", "", Enum.eModes.MODE_ZOMBIES )
			},
			properties = {
				filter = "bubblegum"
			}
		} )
		if IsProgressionEnabled( f237_arg0 ) and not IsInPermanentUnlockMenu( f237_arg0 ) then
			table.insert( f237_local0, {
				models = {
					tabName = Engine.Localize( "ZMUI_MEGACHEW_CAPS" ),
					breadcrumbCount = Engine.WeaponGroupNewItemCount( f237_arg0, "bubblegum_consumable", "", Enum.eModes.MODE_ZOMBIES )
				},
				properties = {
					filter = "bubblegum_consumable"
				}
			} )
		end
		table.insert( f237_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f237_local0
	end
	, true ),
	MegaChewTokens = {
		getModel = function ( f238_arg0 )
			local f238_local0 = Engine.CreateModel( Engine.GetModelForController( f238_arg0 ), "MegaChewTokens" )
			Engine.SetModelValue( Engine.CreateModel( f238_local0, "remainingTokens" ), Engine.GetZMVials( f238_arg0 ) )
			return f238_local0
		end
	},
	MegaChewMachines = {
		getModel = function ( f239_arg0 )
			local f239_local0 = Engine.CreateModel( Engine.GetModelForController( f239_arg0 ), "MegaChewMachines" )
			for f239_local1 = 0, 2, 1 do
				local f239_local4 = Engine.CreateModel( f239_local0, "machine" .. f239_local1 )
				local f239_local5 = f239_local1
				local f239_local6 = f239_local1 + 1
				Engine.SetModelValue( Engine.CreateModel( f239_local4, "index" ), f239_local5 )
				Engine.SetModelValue( Engine.CreateModel( f239_local4, "price" ), f239_local6 )
			end
			return f239_local0
		end
	},
	ClientDemoFiles = {
		prepare = function ( f240_arg0, f240_arg1, f240_arg2 )
			f240_arg1.clientDemoFiles = {}
			local f240_local0 = Engine.GetClientDemoFileCount()
			local f240_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "ClientDemo" )
			for f240_local2 = 1, f240_local0, 1 do
				local f240_local5 = f240_local2 - 1
				local f240_local6 = Engine.GetClientDemoFileInfo( f240_local5 )
				local f240_local7 = Engine.CreateModel( f240_local1, f240_local5 )
				Engine.SetModelValue( Engine.CreateModel( f240_local7, "index" ), f240_local5 )
				Engine.SetModelValue( Engine.CreateModel( f240_local7, "fileName" ), f240_local6.fileName )
				Engine.SetModelValue( Engine.CreateModel( f240_local7, "gameType" ), f240_local6.gameType )
				Engine.SetModelValue( Engine.CreateModel( f240_local7, "mapName" ), f240_local6.mapName )
				Engine.SetModelValue( Engine.CreateModel( f240_local7, "authorName" ), f240_local6.authorName )
				Engine.SetModelValue( Engine.CreateModel( f240_local7, "createTime" ), f240_local6.createTime )
				Engine.SetModelValue( Engine.CreateModel( f240_local7, "duration" ), f240_local6.duration )
				table.insert( f240_arg1.clientDemoFiles, f240_local7 )
			end
		end,
		getCount = function ( f241_arg0 )
			return #f241_arg0.clientDemoFiles
		end,
		getItem = function ( f242_arg0, f242_arg1, f242_arg2 )
			return f242_arg1.clientDemoFiles[f242_arg2]
		end
	},
	TheaterSelectFilmTabs = f0_local7( "TheaterSelectFilmTabs", function ( f243_arg0 )
		local f243_local0 = {}
		table.insert( f243_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f243_local0, {
			models = {
				tabName = Engine.ToUpper( Engine.Localize( "MENU_MY_THEATER" ) ),
				tabWidget = "CoD.SelectFilm_MyTheater",
				tabIcon = ""
			},
			properties = {
				tabId = "mytheater",
				selectIndex = false,
				disabled = false
			}
		} )
		table.insert( f243_local0, {
			models = {
				tabName = Engine.ToUpper( Engine.Localize( "MENU_COMMUNITY" ) ),
				tabWidget = "CoD.SelectFilm_MyTheater",
				tabIcon = ""
			},
			properties = {
				tabId = "community",
				selectIndex = false,
				disabled = true
			}
		} )
		table.insert( f243_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f243_local0
	end
	 ),
	Demo = {
		getModel = function ( f244_arg0 )
			if not f244_arg0 then
				f244_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetGlobalModel(), "demo" )
		end
	},
	DemoControlsButtons = {
		prepare = function ( f245_arg0, f245_arg1, f245_arg2 )
			f245_arg1.buttons = {}
			local f245_local0 = {}
			local f245_local1 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isPaused" )
			local f245_local2 = Engine.GetModelValue( f245_local1 )
			local f245_local3 = Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" )
			local f245_local4 = Engine.GetModel( Engine.GetGlobalModel(), "demo.clipState" )
			local f245_local5 = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
			local f245_local6 = Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" )
			local f245_local7 = Engine.GetModel( Engine.GetGlobalModel(), "demo.freeCameraMode" )
			local f245_local8 = Engine.GetModel( Engine.GetGlobalModel(), "demo.keyframeForJumpBack" )
			local f245_local9 = Engine.GetModel( Engine.GetGlobalModel(), "demo.keyframeForJumpForward" )
			local f245_local10 = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerForJumpBack" )
			local f245_local11 = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerForJumpForward" )
			local f245_local12 = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerCount" )
			local f245_local13 = Engine.GetModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" )
			local f245_local14 = Engine.GetModelValue( f245_local13 )
			local f245_local15 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleMode" )
			local f245_local16 = Engine.GetModelValue( f245_local15 )
			local f245_local17 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningDollyCamMarker" )
			local f245_local18 = Engine.GetModelValue( f245_local17 )
			local f245_local19 = Engine.GetModel( Engine.GetGlobalModel(), "demo.lightmanMarkerCount" )
			local f245_local20 = Engine.GetModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" )
			local f245_local21 = Engine.GetModelValue( f245_local20 )
			local f245_local22 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightMode" )
			local f245_local23 = Engine.GetModelValue( f245_local22 )
			local f245_local24 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningLightmanMarker" )
			local f245_local25 = Engine.GetModelValue( f245_local24 )
			local f245_local26 = function ( f246_arg0 )
				if 6 <= f246_arg0 then
					return "theater_fastforward_3"
				elseif f246_arg0 >= 4 then
					return "theater_fastforward_2"
				elseif f246_arg0 >= 2 then
					return "theater_fastforward_1"
				else
					return "theater_fastforward"
				end
			end
			
			local f245_local27 = function ( f247_arg0 )
				if f247_arg0 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
					return "theater_draw_straight"
				elseif f247_arg0 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
					return "theater_draw_angle"
				else
					return "theater_draw"
				end
			end
			
			local f245_local28 = function ( f248_arg0 )
				if f248_arg0 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
					return "DEMO_DOLLY_CAMERA_SPEED_MODE_FIXED_HINT"
				elseif f248_arg0 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
					return "DEMO_DOLLY_CAMERA_SPEED_MODE_LINEAR_HINT"
				else
					return "DEMO_DOLLY_CAMERA_SPEED_MODE_MANUAL_HINT"
				end
			end
			
			local f245_local29 = function ( f249_arg0 )
				if f249_arg0 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
					return "theater_light_omni"
				else
					return "theater_light_spot"
				end
			end
			
			local f245_local30 = function ( f250_arg0 )
				if f250_arg0 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
					return "DEMO_LIGHTMAN_LIGHT_MODE_OMNI_HINT"
				else
					return "DEMO_LIGHTMAN_LIGHT_MODE_SPOT_HINT"
				end
			end
			
			local f245_local31 = function ( f251_arg0, f251_arg1, f251_arg2, f251_arg3, f251_arg4 )
				local f251_local0 = f251_arg1.btnId
				if f251_local0 == "screenshot" then
					
				elseif f251_local0 == "record" then
					if Engine.IsDemoClipRecording() then
						Engine.Exec( f251_arg2, "demo_pausecliprecord" )
					else
						Engine.Exec( f251_arg2, "demo_startcliprecord" )
					end
				elseif f251_local0 == "jumpback" then
					DemoJumpBack( f251_arg2 )
				elseif f251_local0 == "jumpforward" then
					Engine.Exec( f251_arg2, "demo_forward" )
				elseif f251_local0 == "play" or f251_local0 == "pause" then
					CoD.DemoUtility.RunPauseCommand( f251_arg2 )
				elseif f251_local0 == "fastforward" then
					CoD.DemoUtility.UnpauseIfPaused( f251_arg2 )
					Engine.SetModelValue( Engine.GetModel( f251_arg1:getModel(), "icon" ), f245_local26( UpdateDemoFastForward( f251_arg2 ) ) )
				elseif f251_local0 == "options" then
					
				elseif f251_local0 == "jumpbackdollycamera" then
					CoD.DemoUtility.SwitchToDollyCamMarker( f251_arg2, Engine.GetModelValue( f245_local10 ) )
					CoD.DemoUtility.SetEditingDollyCameraMarker( f251_arg2, true )
				elseif f251_local0 == "playdollycamera" then
					CoD.DemoUtility.UnpauseIfPaused( f251_arg2 )
					Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_DOLLY )
				elseif f251_local0 == "pausedollycamera" then
					Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_EDIT )
				elseif f251_local0 == "jumpforwarddollycamera" then
					CoD.DemoUtility.SwitchToDollyCamMarker( f251_arg2, Engine.GetModelValue( f245_local11 ) )
					CoD.DemoUtility.SetEditingDollyCameraMarker( f251_arg2, true )
				elseif f251_local0 == "movedollycameramarker" then
					if f245_local18 then
						DemoPlaceDollyCameraMarker( f251_arg2 )
					else
						CoD.DemoUtility.RepositionDollyCamMarker( f251_arg2, Engine.GetHighlightedCameraMarker() )
					end
				elseif f251_local0 == "deletedollycameramarker" then
					CoD.DemoUtility.RemoveDollyCamMarker( f251_arg2, Engine.GetHighlightedCameraMarker() )
					CoD.DemoUtility.SetEditingDollyCameraMarker( f251_arg2, false )
				elseif f251_local0 == "deletealldollycameramarkers" then
					CoD.OverlayUtility.CreateOverlay( f251_arg2, f251_arg4:getParent(), "DemoDeleteAllDollyCameraMarkers" )
				elseif f251_local0 == "movelightmanmarker" then
					if f245_local25 then
						DemoPlaceLightmanMarker( f251_arg2 )
					else
						CoD.DemoUtility.RepositionLightmanMarker( f251_arg2, Engine.GetHighlightedCameraMarker() )
					end
				elseif f251_local0 == "lightmanlightcolor" then
					OpenPopupWithPriority( f251_arg4:getParent(), "LightmanColorPicker", f251_arg2, 200 )
					Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.showLightmanColorPicker" ), true )
				elseif f251_local0 == "deletelightmanmarker" then
					CoD.DemoUtility.RemoveLightmanMarker( f251_arg2, Engine.GetHighlightedCameraMarker() )
					CoD.DemoUtility.SetEditingLightmanMarker( f251_arg2, false )
				elseif f251_local0 == "deletealllightmanmarkers" then
					CoD.OverlayUtility.CreateOverlay( f251_arg2, f251_arg4:getParent(), "DemoDeleteAllLightmanMarkers" )
				end
			end
			
			if IsDemoClipPreviewRunning() then
				table.insert( f245_local0, {
					btnId = "dummy",
					icon = "theater_move",
					hintText = "",
					disabled = true
				} )
			elseif f245_local14 then
				table.insert( f245_local0, {
					btnId = "movedollycameramarker",
					icon = "theater_move",
					hintText = "DEMO_MOVE_DOLLY_CAMERA_HINT"
				} )
				table.insert( f245_local0, {
					btnId = "dollycameraspeedmode",
					icon = f245_local27( f245_local16 ),
					hintText = f245_local28( f245_local16 ),
					disabled = f245_local18 == true
				} )
				local f245_local32 = table.insert
				local f245_local33 = f245_local0
				local f245_local34 = {
					btnId = "dollycameratimescale",
					icon = nil,
					hintText = "DEMO_DOLLY_CAMERA_SPEED_HINT"
				}
				local f245_local35
				if f245_local16 ~= Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL and f245_local18 ~= true then
					f245_local35 = false
				else
					f245_local35 = true
				end
				f245_local34.disabled = f245_local35
				f245_local32( f245_local33, f245_local34 )
				table.insert( f245_local0, {
					btnId = "deletedollycameramarker",
					icon = "theater_video_x",
					hintText = "DEMO_DOLLY_CAMERA_DELETE_HINT",
					disabled = f245_local18 == true
				} )
				table.insert( f245_local0, {
					btnId = "deletealldollycameramarkers",
					icon = "theater_video_xx",
					hintText = "DEMO_DOLLY_CAMERA_DELETE_ALL_HINT",
					disabled = f245_local18 == true
				} )
			elseif f245_local21 then
				table.insert( f245_local0, {
					btnId = "movelightmanmarker",
					icon = "theater_move",
					hintText = "DEMO_MOVE_LIGHT_HINT"
				} )
				table.insert( f245_local0, {
					btnId = "lightmanlightmode",
					icon = f245_local29( f245_local23 ),
					hintText = f245_local30( f245_local23 ),
					disabled = f245_local25 == true
				} )
				table.insert( f245_local0, {
					btnId = "lightmanlightintensity",
					icon = "theater_light_intensity",
					hintText = "DEMO_LIGHT_INTENSITY_HINT",
					disabled = f245_local25 == true
				} )
				table.insert( f245_local0, {
					btnId = "lightmanlightrange",
					icon = "theater_light_range",
					hintText = "DEMO_LIGHT_RANGE_HINT",
					disabled = f245_local25 == true
				} )
				table.insert( f245_local0, {
					btnId = "lightmanlightcolor",
					icon = "theater_light_color",
					hintText = "DEMO_LIGHT_COLOR_HINT",
					disabled = f245_local25 == true
				} )
				table.insert( f245_local0, {
					btnId = "deletelightmanmarker",
					icon = "theater_video_x",
					hintText = "DEMO_LIGHT_DELETE_HINT",
					disabled = f245_local25 == true
				} )
				table.insert( f245_local0, {
					btnId = "deletealllightmanmarkers",
					icon = "theater_video_xx",
					hintText = "DEMO_LIGHT_DELETE_ALL_HINT",
					disabled = f245_local25 == true
				} )
			else
				if not IsDemoRestrictedBasicMode() then
					if not IsDemoContextPlaybackMode() then
						table.insert( f245_local0, {
							btnId = "screenshot",
							icon = "theater_photo",
							hintText = "DEMO_SCREENSHOT_HINT"
						} )
						table.insert( f245_local0, {
							btnId = "record",
							icon = "theater_record",
							hintText = "DEMO_RECORD_HINT",
							spacerWidth = 10
						} )
					else
						table.insert( f245_local0, {
							btnId = "screenshot",
							icon = "theater_photo",
							hintText = "DEMO_SCREENSHOT_HINT",
							spacerWidth = 10
						} )
					end
				end
				table.insert( f245_local0, {
					btnId = "jumpback",
					icon = "theater_back",
					hintText = "DEMO_JUMP_BACK_HINT",
					disabled = Engine.GetModelValue( f245_local8 ) == -1
				} )
				if IsDemoContextDirectorMode() then
					table.insert( f245_local0, {
						btnId = "jumpbackdollycamera",
						icon = "theater_back_active",
						hintText = "DEMO_JUMP_BACK_DOLLY_CAMERA_HINT",
						disabled = Engine.GetModelValue( f245_local10 ) == -1
					} )
				end
				if f245_local2 == true then
					table.insert( f245_local0, {
						btnId = "play",
						icon = "theater_play",
						hintText = "DEMO_PLAY_HINT"
					} )
				else
					table.insert( f245_local0, {
						btnId = "pause",
						icon = "theater_pause",
						hintText = "DEMO_PAUSE_HINT"
					} )
				end
				if IsDemoContextDirectorMode() then
					if Engine.IsDemoDollyCamera() then
						table.insert( f245_local0, {
							btnId = "pausedollycamera",
							icon = "theater_video_pause",
							hintText = "DEMO_PAUSE_DOLLY_CAMERA_HINT"
						} )
					else
						local f245_local32 = "DEMO_PLAY_DOLLY_CAMERA_HINT"
						local f245_local33 = false
						if Engine.GetModelValue( f245_local12 ) <= 0 then
							f245_local32 = "DEMO_PLAY_DOLLY_CAMERA_NOMARKERS_HINT"
							f245_local33 = true
						end
						table.insert( f245_local0, {
							btnId = "playdollycamera",
							icon = "theater_video_play",
							hintText = f245_local32,
							disabled = f245_local33
						} )
					end
				end
				if not IsDemoContextPlaybackMode() then
					table.insert( f245_local0, {
						btnId = "fastforward",
						icon = f245_local26( CoD.DemoUtility.GetRoundedTimeScale() ),
						hintText = "DEMO_FAST_FORWARD_HINT"
					} )
				end
				if IsDemoContextDirectorMode() then
					table.insert( f245_local0, {
						btnId = "jumpforwarddollycamera",
						icon = "theater_forward_active",
						hintText = "DEMO_JUMP_FORWARD_DOLLY_CAMERA_HINT",
						disabled = Engine.GetModelValue( f245_local11 ) == -1
					} )
				end
				table.insert( f245_local0, {
					btnId = "jumpforward",
					icon = "theater_forward",
					hintText = "DEMO_JUMP_FORWARD_HINT",
					disabled = Engine.GetModelValue( f245_local9 ) == -1
				} )
				if not IsDemoContextPlaybackMode() then
					table.insert( f245_local0, {
						btnId = "timescale",
						icon = nil,
						hintText = "DEMO_TIMESCALE_HINT"
					} )
					if IsDemoContextBasicMode() then
						table.insert( f245_local0, {
							btnId = "cameramode",
							icon = "theater_video",
							hintText = "DEMO_CHANGE_CAMERA_HINT"
						} )
					end
					if not IsDemoRestrictedBasicMode() then
						table.insert( f245_local0, {
							btnId = "options",
							icon = "theater_settings",
							hintText = "DEMO_OPTIONS_HINT"
						} )
					end
				end
			end
			for f245_local35, f245_local36 in ipairs( f245_local0 ) do
				local f245_local37 = {
					btnId = f245_local36.btnId,
					spacerWidth = f245_local36.spacerWidth
				}
				local f245_local38 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "DemoControls" ), "buttonModel_" .. f245_local35 )
				table.insert( f245_arg1.buttons, {
					model = f245_local38,
					properties = f245_local37
				} )
				Engine.SetModelValue( Engine.CreateModel( f245_local38, "btnId" ), f245_local36.btnId )
				Engine.SetModelValue( Engine.CreateModel( f245_local38, "icon" ), f245_local36.icon )
				Engine.SetModelValue( Engine.CreateModel( f245_local38, "hintText" ), Engine.Localize( f245_local36.hintText ) )
				Engine.SetModelValue( Engine.CreateModel( f245_local38, "action" ), f245_local31 )
				if f245_local36.disabled then
					Engine.SetModelValue( Engine.CreateModel( f245_local38, "disabled" ), f245_local36.disabled )
				else
					Engine.SetModelValue( Engine.CreateModel( f245_local38, "disabled" ), false )
				end
			end
			f245_local32 = function ()
				f245_arg1:updateDataSource()
			end
			
			if not f245_arg1.subscribedToModels then
				f245_arg1:subscribeToModel( f245_local1, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local6, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local7, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local8, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local9, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local3, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local4, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local5, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local10, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local11, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local12, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local13, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local15, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local17, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local19, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local20, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local22, f245_local32, false )
				f245_arg1:subscribeToModel( f245_local24, f245_local32, false )
				f245_arg1.subscribedToModels = true
			end
		end,
		getCount = function ( f253_arg0 )
			return #f253_arg0.buttons
		end,
		getItem = function ( f254_arg0, f254_arg1, f254_arg2 )
			return f254_arg1.buttons[f254_arg2].model
		end,
		getCustomPropertiesForItem = function ( f255_arg0, f255_arg1 )
			return f255_arg0.buttons[f255_arg1].properties
		end,
		getSpacerAfterColumn = function ( f256_arg0, f256_arg1, f256_arg2 )
			if f256_arg0.buttons[f256_arg1].properties.spacerWidth then
				return f256_arg0.buttons[f256_arg1].properties.spacerWidth
			else
				return 0
			end
		end,
		getWidgetTypeForItem = function ( f257_arg0, f257_arg1, f257_arg2, f257_arg3 )
			local f257_local0 = f257_arg0.buttons[f257_arg3].properties.btnId
			if f257_local0 == "timescale" then
				return CoD.DemoControlsButtonTimeScale
			elseif f257_local0 == "dollycameratimescale" then
				return CoD.DemoControlsButtonDollyCameraTimeScale
			elseif f257_local0 == "cameramode" then
				return CoD.DemoControlsButtonCameraMode
			elseif f257_local0 == "dollycameraspeedmode" then
				return CoD.DemoControlsButtonDollyCameraSpeedMode
			elseif f257_local0 == "lightmanlightmode" then
				return CoD.DemoControlsButtonLightmanLightMode
			elseif f257_local0 == "lightmanlightintensity" or f257_local0 == "lightmanlightrange" then
				return CoD.DemoControlsButtonLightmanLightFloatParam
			else
				return CoD.DemoControlsButton
			end
		end
	},
	DemoChooseModeButtonList = f0_local7( "DemoChooseModeButtonList", function ( f258_arg0 )
		local f258_local0 = {}
		local f258_local1 = function ( f259_arg0, f259_arg1, f259_arg2, f259_arg3, f259_arg4 )
			local f259_local0 = f259_arg1.btnId
			if CoD.DemoUtility.GetDemoContextMode() == Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC then
				CoD.perController[f259_arg2].prevDemoCameraMode = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ) )
			end
			if f259_local0 == "basic" then
				if CoD.perController[f259_arg2].prevDemoCameraMode then
					Engine.SwitchDemoCameraMode( CoD.perController[f259_arg2].prevDemoCameraMode )
				else
					Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE )
				end
				Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_FREEROAM )
				CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC )
			elseif f259_local0 == "director" then
				Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
				Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_EDIT )
				CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_DIRECTOR )
			elseif f259_local0 == "objectlink" then
				Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
				Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_LOCK_ON )
				CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_OBJECT_LINK )
			elseif f259_local0 == "lighter" then
				Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
				Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_LIGHTMAN )
				CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_LIGHTER )
			elseif f259_local0 == "timeline" then
				StartMenuOpenManageSegments( f259_arg0, f259_arg1, f259_arg2, f259_arg3, f259_arg4 )
			end
		end
		
		for f258_local5, f258_local6 in ipairs( {
			{
				btnId = "basic",
				displayText = "DEMO_MODE_BASIC",
				hintText = "DEMO_MODE_BASIC_HINT",
				icon = "theater_play"
			},
			{
				btnId = "director",
				displayText = "DEMO_MODE_DIRECTOR",
				hintText = "DEMO_MODE_DIRECTOR_HINT",
				icon = "theater_video"
			},
			{
				btnId = "objectlink",
				displayText = "DEMO_MODE_OBJECT_LINK",
				hintText = "DEMO_MODE_OBJECT_LINK_HINT",
				icon = "theater_link"
			},
			{
				btnId = "lighter",
				displayText = "DEMO_MODE_LIGHTER",
				hintText = "DEMO_MODE_LIGHTER_HINT",
				icon = "theater_bulb"
			},
			{
				btnId = "timeline",
				displayText = "DEMO_MODE_TIMELINE_EDITOR",
				hintText = "DEMO_MODE_TIMELINE_EDITOR_HINT",
				icon = "theater_timeline"
			}
		} ) do
			table.insert( f258_local0, {
				models = {
					displayText = Engine.Localize( f258_local6.displayText ),
					hintText = Engine.Localize( f258_local6.hintText ),
					icon = f258_local6.icon,
					action = f258_local1
				},
				properties = {
					btnId = f258_local6.btnId
				}
			} )
		end
		return f258_local0
	end
	 ),
	DemoFilmOptionsButtonList = f0_local7( "DemoFilmOptionsButtonList", function ( f260_arg0 )
		local f260_local0 = {}
		local f260_local1 = {}
		local f260_local2 = CoD.Timeline_GetHighlightedSegmentModel()
		local f260_local3 = function ( f261_arg0, f261_arg1, f261_arg2, f261_arg3, f261_arg4 )
			local f261_local0 = f261_arg1.btnId
			local f261_local1, f261_local2 = nil
			if f260_local2 then
				f261_local2 = Engine.GetModelValue( Engine.GetModel( f260_local2, "segmentNumber" ) ) - 1
			end
			if f261_local0 == "preview" then
				Engine.Exec( f261_arg2, "demo_previewsegment " .. f261_local2 )
				GoBack( f261_arg0.occludedMenu, f261_arg2 )
			elseif f261_local0 == "delete" then
				CoD.OverlayUtility.CreateOverlay( f261_arg2, f261_arg0, "DemoDeleteSegment" )
			elseif f261_local0 == "rename" then
				Engine.Exec( f261_arg2, "demo_keyboard segmentName " .. f261_local2 )
			elseif f261_local0 == "saveclip" then
				
			elseif f261_local0 == "mergeall" then
				CoD.OverlayUtility.CreateOverlay( f261_arg2, f261_arg0, "DemoMergeAllSegments" )
			elseif f261_local0 == "deleteall" then
				CoD.OverlayUtility.CreateOverlay( f261_arg2, f261_arg0, "DemoDeleteAllSegments" )
			end
		end
		
		if f260_local2 ~= nil and Engine.GetModelValue( Engine.GetModel( f260_local2, "disabled" ) ) == false then
			table.insert( f260_local1, {
				btnId = "preview",
				displayText = "DEMO_VIEW_SHOT",
				hintText = "DEMO_VIEW_SHOT_HINT",
				icon = "theater_view"
			} )
			table.insert( f260_local1, {
				btnId = "delete",
				displayText = "DEMO_DELETE_SHOT",
				hintText = "DEMO_DELETE_SHOT_HINT",
				icon = "theater_delete"
			} )
			table.insert( f260_local1, {
				btnId = "rename",
				displayText = "DEMO_RENAME_SHOT",
				hintText = "DEMO_RENAME_SHOT_HINT",
				icon = "theater_rename",
				spacerHeight = 16
			} )
		end
		table.insert( f260_local1, {
			btnId = "saveclip",
			displayText = "DEMO_SAVE_CLIP",
			hintText = "DEMO_SAVE_CLIP_HINT",
			icon = "theater_save"
		} )
		table.insert( f260_local1, {
			btnId = "mergeall",
			displayText = "DEMO_MERGE_ALL_SHOTS",
			hintText = "DEMO_MERGE_ALL_SHOTS_HINT",
			icon = "theater_merge"
		} )
		table.insert( f260_local1, {
			btnId = "deleteall",
			displayText = "DEMO_DELETE_ALL_SHOTS",
			hintText = "DEMO_DELETE_ALL_SHOTS_HINT",
			icon = "theater_delete_all"
		} )
		for f260_local7, f260_local8 in ipairs( f260_local1 ) do
			table.insert( f260_local0, {
				models = {
					displayText = Engine.Localize( f260_local8.displayText ),
					hintText = Engine.Localize( f260_local8.hintText ),
					icon = f260_local8.icon,
					action = f260_local3
				},
				properties = {
					btnId = f260_local8.btnId,
					spacerHeight = f260_local8.spacerHeight
				}
			} )
		end
		return f260_local0
	end
	, nil, nil, nil, function ( f262_arg0, f262_arg1, f262_arg2 )
		local f262_local0 = f262_arg0.DemoFilmOptionsButtonList[f262_arg1].properties.spacerHeight
		if f262_local0 then
			return f262_local0
		else
			return f262_arg0.spacing
		end
	end
	 ),
	DemoSegments = {
		prepare = function ( f263_arg0, f263_arg1, f263_arg2 )
			f263_arg1.segments = {}
			local f263_local0 = 20
			local f263_local1, f263_local2, f263_local3, f263_local4, f263_local5 = nil
			if Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" ) == nil then
				f263_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "DemoSegments" )
				f263_local2 = Engine.CreateModel( f263_local1, "refresh" )
				Engine.SetModelValue( f263_local2, 0 )
			else
				f263_local1 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
				f263_local2 = Engine.GetModel( f263_local1, "refresh" )
			end
			local f263_local6 = Engine.GetDemoSegmentCount()
			f263_local3 = CoD.Timeline_GetSelectedSegmentModel()
			if f263_local3 then
				f263_local4 = Engine.GetModelValue( Engine.GetModel( f263_local3, "segmentNumber" ) )
				f263_local5 = Engine.GetDemoSegmentInformation( f263_local4 - 1, "name" )
			end
			for f263_local7 = 1, f263_local0, 1 do
				local f263_local10 = f263_local7 - 1
				local f263_local11 = Engine.CreateModel( f263_local1, f263_local10 )
				local f263_local12, f263_local13, f263_local14, f263_local15, f263_local16, f263_local17 = nil
				Engine.SetModelValue( Engine.CreateModel( f263_local11, "segmentNumber" ), f263_local7 )
				if f263_local7 <= f263_local6 then
					if f263_local4 ~= nil then
						if f263_local4 == f263_local7 then
							f263_local12 = Engine.Localize( "MENU_MOVING_SEGMENT_SELECT_NEW_SPOT", f263_local5 )
						else
							f263_local12 = Engine.Localize( "MENU_PLACE_SEGMENT_AT_TIMELINE_POSITION", f263_local5, f263_local7 )
						end
					else
						f263_local12 = Engine.GetDemoSegmentInformation( f263_local10, "name" )
					end
					if f263_local4 ~= nil then
						f263_local13 = ""
						f263_local14 = ""
						f263_local15 = ""
						f263_local16 = ""
					else
						f263_local13 = Engine.GetDemoSegmentInformation( f263_local10, "durationTimeDisplay" )
						if f263_local7 < f263_local6 then
							f263_local14 = Engine.Localize( "MENU_TRANSITION" ) .. Engine.GetDemoSegmentInformation( f263_local10, "transition" )
						else
							f263_local14 = ""
						end
						if Engine.IsDemoHighlightReelMode() then
							local f263_local18 = tonumber( Engine.GetDemoSegmentInformation( f263_local10, "score" ) )
							local f263_local19 = tonumber( Engine.GetDemoSegmentInformation( f263_local10, "stars" ) )
							f263_local15 = f263_local18
							f263_local16 = f263_local19
						end
					end
					f263_local17 = false
				else
					if f263_local4 ~= nil then
						f263_local12 = Engine.Localize( "MENU_CANNOT_PLACE_SEGMENT_IN_TIMELINE", f263_local5 )
					else
						f263_local12 = ""
					end
					f263_local13 = ""
					f263_local14 = ""
					f263_local15 = ""
					f263_local16 = ""
					f263_local17 = true
				end
				Engine.SetModelValue( Engine.CreateModel( f263_local11, "name" ), f263_local12 )
				Engine.SetModelValue( Engine.CreateModel( f263_local11, "duration" ), f263_local13 )
				Engine.SetModelValue( Engine.CreateModel( f263_local11, "transitionText" ), f263_local14 )
				Engine.SetModelValue( Engine.CreateModel( f263_local11, "stars" ), f263_local15 )
				Engine.SetModelValue( Engine.CreateModel( f263_local11, "score" ), f263_local16 )
				Engine.SetModelValue( Engine.CreateModel( f263_local11, "disabled" ), f263_local17 )
				table.insert( f263_arg1.segments, {
					model = f263_local11
				} )
			end
			f263_arg1:subscribeToModel( f263_local2, function ()
				f263_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f265_arg0 )
			return #f265_arg0.segments
		end,
		getItem = function ( f266_arg0, f266_arg1, f266_arg2 )
			return f266_arg1.segments[f266_arg2].model
		end,
		getCustomPropertiesForItem = function ( f267_arg0, f267_arg1 )
			return f267_arg0.segments[f267_arg1]
		end
	},
	PrimaryOffhandGadget = {
		getModel = function ( f268_arg0 )
			if not f268_arg0 then
				f268_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f268_arg0 ), "playerAbilities.playerGadget0" )
		end
	},
	SecondaryOffhandGadget = {
		getModel = function ( f269_arg0 )
			if not f269_arg0 then
				f269_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f269_arg0 ), "playerAbilities.playerGadget1" )
		end
	},
	SpecialOffhandGadget = {
		getModel = function ( f270_arg0 )
			if not f270_arg0 then
				f270_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f270_arg0 ), "playerAbilities.playerGadget2" )
		end
	},
	HeroWeapon = {
		getModel = function ( f271_arg0 )
			if not f271_arg0 then
				f271_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f271_arg0 ), "playerAbilities.playerGadget3" )
		end
	},
	CurrentWeapon = {
		getModel = function ( f272_arg0 )
			if not f272_arg0 then
				f272_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f272_arg0 ), "currentWeapon" )
		end
	},
	CurrentPrimaryOffhand = {
		getModel = function ( f273_arg0 )
			if not f273_arg0 then
				f273_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f273_arg0 ), "currentPrimaryOffhand" )
		end
	},
	CurrentSecondaryOffhand = {
		getModel = function ( f274_arg0 )
			if not f274_arg0 then
				f274_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f274_arg0 ), "currentSecondaryOffhand" )
		end
	},
	CurrentSpecialOffhand = {
		getModel = function ( f275_arg0 )
			if not f275_arg0 then
				f275_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f275_arg0 ), "currentSpecialOffhand" )
		end
	},
	HUDItems = {
		getModel = function ( f276_arg0 )
			if not f276_arg0 then
				f276_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f276_arg0 ), "hudItems" )
		end
	},
	InteractivePrompt = {
		getModel = function ( f277_arg0 )
			if not f277_arg0 then
				f277_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f277_arg0 ), "interactivePrompt" )
		end
	},
	InGameNotifications = {
		getModel = function ( f278_arg0 )
			if not f278_arg0 then
				f278_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f278_arg0 ), "inGameNotifications" )
		end
	},
	KillstreakReward = {
		getModel = function ( f279_arg0 )
			if not f279_arg0 then
				f279_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f279_arg0 ), "killstreakRewards" )
		end
	},
	PlayerCallout = {
		getModel = function ( f280_arg0 )
			if not f280_arg0 then
				f280_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f280_arg0 ), "playerCallout" )
		end
	},
	PlayerObituary = {
		getModel = function ( f281_arg0 )
			if not f281_arg0 then
				f281_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f281_arg0 ), "playerObituary" )
		end
	},
	PlayerAbilities = {
		getModel = function ( f282_arg0 )
			if not f282_arg0 then
				f282_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f282_arg0 ), "playerAbilities" )
		end
	},
	Perks = {
		getModel = function ( f283_arg0 )
			if not f283_arg0 then
				f283_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f283_arg0 ), "perks" )
		end
	},
	Specialties = {
		getModel = function ( f284_arg0 )
			if not f284_arg0 then
				f284_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f284_arg0 ), "specialties" )
		end
	},
	CTF = {
		prepared = false,
		prepare = function ( f285_arg0, f285_arg1, f285_arg2 )
			local f285_local0 = Engine.CreateModel( Engine.GetModelForController( f285_arg0 ), "CTF" )
			local f285_local1 = Engine.CreateModel( f285_local0, "friendlyFlagCarrier" )
			local f285_local2 = Engine.CreateModel( f285_local0, "enemyFlagCarrier" )
		end,
		getModel = function ( f286_arg0 )
			if not DataSources.CTF.prepared then
				DataSources.CTF.prepare( f286_arg0 )
			end
			if not f286_arg0 then
				f286_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f286_arg0 ), "CTF" )
		end
	},
	Ball = {
		getModel = function ( f287_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f287_arg0 ), "ballGametype" )
		end
	},
	Escort = {
		getModel = function ( f288_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f288_arg0 ), "escortGametype" )
		end
	},
	Factions = {
		prepared = false,
		factionSubscription = {},
		prepare = function ( f289_arg0, f289_arg1, f289_arg2 )
			if not DataSources.Factions.prepared then
				DataSources.Factions.prepared = {}
			end
			if not DataSources.Factions.factionSubscription[f289_arg0] then
				DataSources.Factions.factionSubscription[f289_arg0] = LUI.UIElement.new()
			end
			local f289_local0 = Engine.GetModelForController( f289_arg0 )
			local f289_local1 = Engine.CreateModel( f289_local0, "factions" )
			local f289_local2 = Engine.CreateModel( f289_local1, "playerFactionTeamEnum" )
			local f289_local3 = Engine.CreateModel( f289_local1, "playerFactionName" )
			local f289_local4 = Engine.CreateModel( f289_local1, "playerFactionDisplayName" )
			local f289_local5 = Engine.CreateModel( f289_local1, "playerFactionIcon" )
			local f289_local6 = Engine.CreateModel( f289_local1, "playerFactionColor" )
			local f289_local7 = Engine.CreateModel( f289_local1, "playerFactionFlagColor" )
			local f289_local8 = Engine.CreateModel( f289_local1, "enemyFactionTeamEnum" )
			local f289_local9 = Engine.CreateModel( f289_local1, "enemyFactionName" )
			local f289_local10 = Engine.CreateModel( f289_local1, "enemyFactionDisplayName" )
			local f289_local11 = Engine.CreateModel( f289_local1, "enemyFactionIcon" )
			local f289_local12 = Engine.CreateModel( f289_local1, "enemyFactionColor" )
			local f289_local13 = Engine.CreateModel( f289_local1, "enemyFactionFlagColor" )
			DataSources.Factions.factionSubscription[f289_arg0]:unsubscribeFromAllModels()
			DataSources.Factions.factionSubscription[f289_arg0]:subscribeToModel( f289_local2, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					Engine.SetModelValue( f289_local5, CoD.GetTeamFactionIcon( modelValue ) )
					Engine.SetModelValue( f289_local4, CoD.GetTeamNameCaps( modelValue ) )
					Engine.SetModelValue( f289_local6, CoD.GetTeamFactionColor( modelValue ) )
					local f290_local1 = string.format( "%d %d %d", ColorSet.FriendlyBlue.r * 255, ColorSet.FriendlyBlue.g * 255, ColorSet.FriendlyBlue.b * 255 )
					if CoD.IsShoutcaster( f289_arg0 ) then
						local f290_local2 = CoD.GetTeamFactionColor( modelValue )
						if not CoDShared.IsGametypeTeamBased() then
							f290_local2 = f290_local1
						end
						CoD.UpdateColorSet( "CodCasterFriendly", f290_local2 )
						Engine.SetupCompassColors( f289_arg0 )
						f290_local1 = f290_local2
					end
					Engine.SetModelValue( f289_local7, f290_local1 )
				end
			end )
			DataSources.Factions.factionSubscription[f289_arg0]:subscribeToModel( f289_local8, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					Engine.SetModelValue( f289_local11, CoD.GetTeamFactionIcon( modelValue ) )
					Engine.SetModelValue( f289_local10, CoD.GetTeamNameCaps( modelValue ) )
					Engine.SetModelValue( f289_local12, CoD.GetTeamFactionColor( modelValue ) )
					local f291_local1 = string.format( "%d %d %d", ColorSet.EnemyOrange.r * 255, ColorSet.EnemyOrange.g * 255, ColorSet.EnemyOrange.b * 255 )
					if CoD.IsShoutcaster( f289_arg0 ) then
						local f291_local2 = CoD.GetTeamFactionColor( modelValue )
						if not CoDShared.IsGametypeTeamBased() then
							f291_local2 = f291_local1
						end
						CoD.UpdateColorSet( "CodCasterEnemy", f291_local2 )
						Engine.SetupCompassColors( f289_arg0 )
						f291_local1 = f291_local2
					end
					Engine.SetModelValue( f289_local13, f291_local1 )
				end
			end )
			local f289_local14 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			local f289_local15 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
			if CoD.IsShoutcaster( f289_arg0 ) and CoD.ShoutcasterProfileVarBool( f289_arg0, "shoutcaster_flip_scorepanel" ) then
				f289_local15 = {
					name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
					icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
					color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
				}
				f289_local14 = {
					name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
					icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
					color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
				}
			end
			Engine.SetModelValue( Engine.CreateModel( f289_local1, "axisFactionDisplayName" ), f289_local15.name )
			Engine.SetModelValue( Engine.CreateModel( f289_local1, "axisFactionIcon" ), f289_local15.icon )
			Engine.SetModelValue( Engine.CreateModel( f289_local1, "axisFactionColor" ), f289_local15.color )
			Engine.SetModelValue( Engine.CreateModel( f289_local1, "alliesFactionDisplayName" ), f289_local14.name )
			Engine.SetModelValue( Engine.CreateModel( f289_local1, "alliesFactionIcon" ), f289_local14.icon )
			Engine.SetModelValue( Engine.CreateModel( f289_local1, "alliesFactionColor" ), f289_local14.color )
			if CoD.IsShoutcaster( f289_arg0 ) then
				CoD.UpdateColorSet( "CodCasterFactionAllies", f289_local14.color )
				CoD.UpdateColorSet( "CodCasterFactionAxis", f289_local15.color )
				Engine.SetupCompassColors( f289_arg0 )
			end
			local f289_local16 = Engine.GetModel( f289_local0, "team" )
			if f289_local16 then
				DataSources.Factions.factionSubscription[f289_arg0]:subscribeToModel( f289_local16, function ( model )
					DataSources.Factions.prepared[f289_arg0] = false
					DataSources.Factions.prepare( f289_arg0 )
				end, false )
			end
			local f289_local17 = Engine.GetModel( f289_local0, "CodCaster.profileSettingsUpdated" )
			if f289_local17 then
				DataSources.Factions.factionSubscription[f289_arg0]:subscribeToModel( f289_local17, function ( model )
					DataSources.Factions.prepared[f289_arg0] = false
					DataSources.Factions.prepare( f289_arg0 )
				end, false )
			end
			DataSources.Factions.prepared[f289_arg0] = true
		end,
		getModel = function ( f294_arg0 )
			if not DataSources.Factions.prepared or not DataSources.Factions.prepared[f294_arg0] then
				DataSources.Factions.prepare( f294_arg0 )
			end
			if not f294_arg0 then
				f294_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f294_arg0 ), "factions" )
		end
	},
	FactionsGlobal = {
		prepare = function ( f295_arg0, f295_arg1, f295_arg2 )
			local f295_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
			local f295_local1 = Engine.GetModelForController( f295_arg0 )
			if not DataSources.FactionsGlobal.factionSubscription then
				DataSources.FactionsGlobal.factionSubscription = LUI.UIElement.new()
			end
			DataSources.FactionsGlobal.factionSubscription:unsubscribeFromAllModels()
			local f295_local2 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			local f295_local3 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
			if CoD.IsShoutcaster( f295_arg0 ) and CoD.ShoutcasterProfileVarBool( f295_arg0, "shoutcaster_flip_scorepanel" ) then
				f295_local3 = {
					name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
					icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
					color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
				}
				f295_local2 = {
					name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
					icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
					color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
				}
			end
			Engine.SetModelValue( Engine.CreateModel( f295_local0, "axisFactionDisplayName" ), f295_local3.name )
			Engine.SetModelValue( Engine.CreateModel( f295_local0, "axisFactionIcon" ), f295_local3.icon )
			Engine.SetModelValue( Engine.CreateModel( f295_local0, "axisFactionColor" ), f295_local3.color )
			Engine.SetModelValue( Engine.CreateModel( f295_local0, "alliesFactionDisplayName" ), f295_local2.name )
			Engine.SetModelValue( Engine.CreateModel( f295_local0, "alliesFactionIcon" ), f295_local2.icon )
			Engine.SetModelValue( Engine.CreateModel( f295_local0, "alliesFactionColor" ), f295_local2.color )
			local f295_local4 = Engine.GetModel( f295_local1, "team" )
			if f295_local4 then
				DataSources.FactionsGlobal.factionSubscription:subscribeToModel( f295_local4, function ( model )
					DataSources.FactionsGlobal.prepared = false
					DataSources.FactionsGlobal.prepare( f295_arg0 )
				end, false )
			end
			local f295_local5 = Engine.GetModel( f295_local1, "CodCaster.profileSettingsUpdated" )
			if f295_local5 then
				DataSources.FactionsGlobal.factionSubscription:subscribeToModel( f295_local5, function ( model )
					DataSources.FactionsGlobal.prepared = false
					DataSources.FactionsGlobal.prepare( f295_arg0 )
				end, false )
			end
			DataSources.FactionsGlobal.prepared = true
		end,
		getModel = function ( f298_arg0 )
			if not DataSources.FactionsGlobal.prepared then
				DataSources.FactionsGlobal.prepare( f298_arg0 )
			end
			return Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
		end
	},
	FactionList = {
		prepare = function ( f299_arg0, f299_arg1, f299_arg2 )
			f299_arg1.factions = {}
			local f299_local0 = Engine.CreateModel( Engine.GetModelForController( f299_arg0 ), "factionList" )
			for f299_local4, f299_local5 in ipairs( Engine.GetTeamPositions( f299_arg0 ) ) do
				local f299_local6 = Engine.GetFactionForTeam( f299_local4 )
				f299_arg1.factions[f299_local4] = Engine.CreateModel( f299_local0, "faction" .. f299_local4 )
				local f299_local7 = 0
				local f299_local8 = "faction_" .. f299_local6
				Engine.SetModelValue( Engine.CreateModel( f299_arg1.factions[f299_local4], "factionName" ), f299_local6 )
				Engine.SetModelValue( Engine.CreateModel( f299_arg1.factions[f299_local4], "factionIcon" ), f299_local8 )
				Engine.SetModelValue( Engine.CreateModel( f299_arg1.factions[f299_local4], "factionScore" ), f299_local7 )
			end
		end,
		getCount = function ( f300_arg0 )
			return #f300_arg0.factions
		end,
		getItem = function ( f301_arg0, f301_arg1, f301_arg2 )
			return f301_arg1.factions[f301_arg2]
		end
	},
	NetStats = {
		getModel = function ( f302_arg0 )
			return Engine.CreateModel( Engine.GetGlobalModel(), "netstats" )
		end
	},
	Groups = {
		getModel = function ( f303_arg0 )
			if not f303_arg0 then
				f303_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f303_arg0 ), "groups" )
		end
	},
	GroupsMainTabList = f0_local7( "GroupsMainTabModel", function ( f304_arg0 )
		local f304_local0 = {}
		table.insert( f304_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f304_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_MY_GROUPS_CAPS" ),
				tabWidget = "CoD.MyGroupsTab"
			},
			properties = {
				tabId = "mygroups"
			}
		} )
		table.insert( f304_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_FIND_GROUPS_CAPS" ),
				tabWidget = "CoD.FindGroupsTab"
			},
			properties = {
				tabId = "findgroups"
			}
		} )
		table.insert( f304_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f304_local0
	end
	, true ),
	GroupsEmblemTabList = f0_local7( "GroupsEmblemTabModel", function ( f305_arg0 )
		local f305_local0 = {}
		table.insert( f305_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f305_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_GROUP_EMBLEMS_CAPS" ),
				tabWidget = "CoD.GroupEmblemsTab"
			},
			properties = {
				tabId = "groupemblems"
			}
		} )
		table.insert( f305_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_MY_EMBLEMS_CAPS" ),
				tabWidget = "CoD.GroupMyEmblemsTab"
			},
			properties = {
				tabId = "groupmyemblems"
			}
		} )
		table.insert( f305_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f305_local0
	end
	, true ),
	GroupsInviteFriendsList = {
		prepare = function ( f306_arg0, f306_arg1, f306_arg2 )
			f306_arg1.numElementsInList = f306_arg1.vCount
			f306_arg1.controller = f306_arg0
			f306_arg1.filter = Enum.PresenceFilter.PRESENCE_FILTER_ALL
			local f306_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
			local f306_local1 = Engine.GetModelValue( Engine.GetModel( f306_local0, "tab" ) )
			f306_arg1.showyourfriend = false
			f306_arg1.showlastmet = false
			f306_arg1.GetList = Engine.GetFriends
			f306_arg1.playerCount = Engine.GetFriendsCount( f306_arg0, f306_arg1.filter )
			f306_arg1.socialSubModel = Engine.GetModel( f306_local0, "friends" )
			f306_arg1.players = {}
			local f306_local2 = Engine.GetModel( Engine.GetModelForController( f306_arg0 ), "groups.createGroup.friends_count" )
			if f306_local2 ~= nil then
				Engine.SetModelValue( f306_local2, f306_arg1.playerCount )
			end
			local f306_local3 = {
				selected = false,
				xuid = 0,
				gamertag = "",
				clantag = "",
				fullname = "",
				activity = 0,
				context = 0,
				difficulty = 0,
				playlist = 1,
				joinable = 0,
				gametype = 0,
				mapid = 0,
				friend = 0,
				primaryPresence = Enum.PresencePrimary.PRESENCE_PRIMARY_OFFLINE,
				titlePresence = "",
				platformPresence = "",
				cpRank = 0,
				cpRankIcon = "",
				cpPrestige = 0,
				mpRank = 0,
				mpRankIcon = "",
				mpPrestige = 0,
				zmRank = 0,
				zmRankIcon = "",
				zmPrestige = 0
			}
			local f306_local4 = {
				xuid = 0,
				showyourfriend = false,
				showlastmet = false,
				gametype = 0,
				mapid = 0,
				difficulty = 0,
				playlist = 1
			}
			for f306_local5 = 1, f306_arg1.numElementsInList, 1 do
				f306_arg1.players[f306_local5] = {}
				f306_arg1.players[f306_local5].root = Engine.CreateModel( f306_arg1.socialSubModel, "player_" .. f306_local5 )
				f306_arg1.players[f306_local5].model = Engine.CreateModel( f306_arg1.players[f306_local5].root, "model" )
				f306_arg1.players[f306_local5].properties = {
					xuid = 0,
					showyourfriend = 0,
					showlastmet = 0,
					gametype = 0,
					mapid = 0,
					difficulty = 0,
					playlist = 1
				}
				for f306_local11, f306_local12 in pairs( f306_local3 ) do
					local f306_local13 = Engine.CreateModel( f306_arg1.players[f306_local5].model, f306_local11 )
				end
			end
			f306_arg1.updateModels = function ( f307_arg0, f307_arg1, f307_arg2, f307_arg3 )
				if not f307_arg1.GetList then
					return 
				end
				local f307_local0 = {}
				f307_local0 = f307_arg1.GetList( f307_arg0, f307_arg2, f307_arg3, f307_arg1.filter )
				for f307_local1 = 1, #f307_local0, 1 do
					local f307_local4 = f307_local0[f307_local1]
					local f307_local5 = (f307_arg2 + f307_local1 - 1) % f307_arg1.numElementsInList + 1
					f307_local4.clantag = "3ARC"
					f307_local4.fullname = string.format( "[%s]%s", f307_local4.clantag, f307_local4.gamertag )
					if f307_arg1.showlastmet == 0 then
						f307_local4.titlePresence = ""
					end
					for f307_local9, f307_local10 in pairs( f307_local4 ) do
						local f307_local11 = Engine.GetModel( f307_arg1.players[f307_local5].model, f307_local9 )
						if f307_local11 ~= nil then
							Engine.SetModelValue( f307_local11, f307_local10 )
						end
						if f307_arg1.players[f307_local5].properties[f307_local9] ~= nil then
							f307_arg1.players[f307_local5].properties[f307_local9] = f307_local10
						end
					end
					f307_arg1.players[f307_local5].properties.showlastmet = f307_arg1.showlastmet
					f307_arg1.players[f307_local5].properties.showyourfriend = f307_arg1.showyourfriend
				end
				return f307_arg1.players[f307_arg2 % f307_arg1.numElementsInList + 1].model
			end
			
			f306_arg1.updateModels( f306_arg0, f306_arg1, 0, f306_arg1.numElementsInList )
			local f306_local5 = Engine.GetModel( f306_arg1.socialSubModel, "update" )
			if f306_arg1.socialUpdateSubscription then
				f306_arg1:removeSubscription( f306_arg1.socialUpdateSubscription )
			end
			f306_arg1.socialUpdateSubscription = f306_arg1:subscribeToModel( f306_local5, function ()
				f0_local12( f306_arg0, f306_arg1 )
			end, false )
		end,
		getCount = function ( f309_arg0 )
			return f309_arg0.playerCount
		end,
		getItem = function ( f310_arg0, f310_arg1, f310_arg2 )
			local f310_local0 = f310_arg1.updateModels( f310_arg0, f310_arg1, f310_arg2 - 1, 1 )
			local f310_local1 = (f310_arg2 - 1)
			return f310_arg1.players[(f310_arg2 - 1) % f310_arg1.numElementsInList + 1].model
		end,
		getCustomPropertiesForItem = function ( f311_arg0, f311_arg1 )
			local f311_local0 = (f311_arg1 - 1)
			return f311_arg0.players[(f311_arg1 - 1) % f311_arg0.numElementsInList + 1].properties
		end
	},
	GroupsMemberDetailsButtons = f0_local7( "GroupsMemberDetailsButtons", function ( f312_arg0 )
		local f312_local0 = {}
		local f312_local1 = Engine.GetModelForController( f312_arg0 )
		local f312_local2 = Engine.GetModelValue( Engine.CreateModel( f312_local1, "Social.selectedFriendXUID" ) )
		local f312_local3 = Engine.GetModelValue( Engine.CreateModel( f312_local1, "Social.selectedFriendGamertag" ) )
		local f312_local4 = f312_local2 == Engine.GetXUID64( f312_arg0 )
		local f312_local5 = Engine.GetModelValue( Engine.CreateModel( f312_local1, "Social.selectedFriendInTitle" ) )
		if f312_local2 == nil then
			return f312_local0
		end
		local f312_local6 = false
		local f312_local7 = Engine.GetPlayerInfo( f312_arg0, f312_local2 )
		if f312_local4 ~= false then
			
		else
			
		end
		local f312_local8 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f312_local2 )
		local f312_local9 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f312_local2 )
		local f312_local10 = Engine.IsPlayerMuted( f312_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f312_local2 )
		table.insert( f312_local0, {
			text = "GROUPS_COMBAT_RECORD_CAPS",
			id = "combatRecord",
			disabled = false,
			action = PromoteToLeader,
			params = {
				controller = f312_arg0,
				xuid = f312_local2
			},
			lastInGroup = false
		} )
		table.insert( f312_local0, {
			text = "GROUPS_VIEW_PROFILE_CAPS",
			id = "platformProfile",
			disabled = false,
			action = OpenPlatformProfile,
			params = {
				controller = f312_arg0,
				gamertag = f312_local3,
				xuid = f312_local2
			},
			lastInGroup = true
		} )
		if not Engine.IsFriendFromXUID( f312_arg0, f312_local2 ) then
			table.insert( f312_local0, {
				text = "GROUPS_SEND_FRIEND_REQUEST_CAPS",
				id = "sendFriendRequest",
				disabled = false,
				action = OpenPlatformProfile,
				params = {
					controller = f312_arg0,
					gamertag = f312_local3,
					xuid = f312_local2
				},
				lastInGroup = true
			} )
		end
		if not f312_local6 then
			table.insert( f312_local0, {
				text = "GROUPS_PROMOTE_TO_ADMIN_CAPS",
				id = "promoteToAdmin",
				disabled = false,
				action = OpenPlatformProfile,
				params = {
					controller = f312_arg0,
					gamertag = f312_local3,
					xuid = f312_local2
				},
				lastInGroup = false
			} )
		end
		table.insert( f312_local0, {
			text = "GROUPS_BLOCK_PUBLISHED_CONTENT_CAPS",
			id = "blockPublishedContent",
			disabled = false,
			action = BlockPublishedContent,
			params = {
				controller = f312_arg0,
				gamertag = f312_local3,
				xuid = f312_local2
			},
			lastInGroup = false
		} )
		table.insert( f312_local0, {
			text = "GROUPS_REMOVE_FROM_GROUP_CAPS",
			id = "removeFromGroup",
			disabled = false,
			action = RemoveFromGroup,
			params = {
				controller = f312_arg0,
				gamertag = f312_local3,
				xuid = f312_local2
			},
			lastInGroup = false
		} )
		table.insert( f312_local0, {
			text = "GROUPS_BAN_FROM_GROUP_CAPS",
			id = "banFromGroup",
			disabled = false,
			action = BanFromGroup,
			params = {
				controller = f312_arg0,
				gamertag = f312_local3,
				xuid = f312_local2
			},
			lastInGroup = true
		} )
		table.insert( f312_local0, {
			text = "GROUPS_REPORT_PLAYER_CAPS",
			id = "reportPlayer",
			disabled = false,
			action = nil,
			params = nil,
			lastInGroup = false
		} )
		if f312_local8 or f312_local9 then
			if f312_local10 then
				table.insert( f312_local0, {
					text = "GROUPS_UNMUTE_PLAYER_CAPS",
					id = "unmutePlayer",
					disabled = false,
					action = UnMutePlayer,
					params = {
						controller = f312_arg0,
						xuid = f312_local2
					},
					lastInGroup = true
				} )
			else
				table.insert( f312_local0, {
					text = "GROUPS_MUTE_PLAYER_CAPS",
					id = "mutePlayer",
					disabled = false,
					action = MutePlayer,
					params = {
						controller = f312_arg0,
						xuid = f312_local2
					},
					lastInGroup = true
				} )
			end
		end
		f312_local8 = {}
		for f312_local12, f312_local13 in ipairs( f312_local0 ) do
			table.insert( f312_local8, {
				models = {
					displayText = Engine.Localize( f312_local13.text ),
					customId = f312_local13.customId
				},
				properties = {
					disabled = f312_local13.disabled,
					action = f312_local13.action,
					actionParam = f312_local13.params,
					isLastButtonInGroup = f312_local13.lastInGroup
				}
			} )
		end
		return f312_local8
	end
	, nil, nil, function ( f313_arg0, f313_arg1, f313_arg2 )
		
	end
	, function ( f314_arg0, f314_arg1, f314_arg2 )
		if f314_arg0.GroupsMemberDetailsButtons[f314_arg1].properties.isLastButtonInGroup then
			return 9
		else
			
		end
	end
	 ),
	GroupsShowcaseButtons = f0_local7( "GroupsShowcaseButtons", function ( f315_arg0 )
		local f315_local0 = {}
		table.insert( f315_local0, {
			text = "GROUPS_FAVORITES",
			id = "favorites",
			disabled = false,
			action = nil,
			params = {
				controller = f315_arg0
			},
			lastInGroup = false
		} )
		table.insert( f315_local0, {
			text = "GROUPS_RECENT",
			id = "recent",
			disabled = false,
			action = nil,
			params = {
				controller = f315_arg0
			},
			lastInGroup = true
		} )
		table.insert( f315_local0, {
			text = "GROUPS_PAINT_JOBS",
			id = "paintJobs",
			disabled = false,
			action = nil,
			params = {
				controller = f315_arg0
			},
			lastInGroup = false
		} )
		table.insert( f315_local0, {
			text = "GROUPS_VARIANTS",
			id = "variants",
			disabled = false,
			action = nil,
			params = {
				controller = f315_arg0
			},
			lastInGroup = false
		} )
		table.insert( f315_local0, {
			text = "GROUPS_EMBLEMS",
			id = "emblems",
			disabled = false,
			action = nil,
			params = {
				controller = f315_arg0
			},
			lastInGroup = false
		} )
		table.insert( f315_local0, {
			text = "GROUPS_SCREENSHOTS",
			id = "screenshots",
			disabled = false,
			action = nil,
			params = {
				controller = f315_arg0
			},
			lastInGroup = false
		} )
		table.insert( f315_local0, {
			text = "GROUPS_CLIPS",
			id = "clips",
			disabled = false,
			action = nil,
			params = {
				controller = f315_arg0
			},
			lastInGroup = false
		} )
		table.insert( f315_local0, {
			text = "GROUPS_CUSTOM_GAMES",
			id = "customGames",
			disabled = false,
			action = PromoteToLeader,
			params = {
				controller = f315_arg0
			},
			lastInGroup = true
		} )
		local f315_local1 = {}
		for f315_local5, f315_local6 in ipairs( f315_local0 ) do
			table.insert( f315_local1, {
				models = {
					displayText = Engine.Localize( f315_local6.text ),
					customId = f315_local6.customId
				},
				properties = {
					disabled = f315_local6.disabled,
					action = f315_local6.action,
					actionParam = f315_local6.params,
					isLastButtonInGroup = f315_local6.lastInGroup
				}
			} )
		end
		return f315_local1
	end
	, nil, nil, function ( f316_arg0, f316_arg1, f316_arg2 )
		
	end
	, function ( f317_arg0, f317_arg1, f317_arg2 )
		if f317_arg0.GroupsShowcaseButtons[f317_arg1].properties.isLastButtonInGroup then
			return 9
		else
			
		end
	end
	 ),
	GroupsMembersList = {
		prepare = function ( f318_arg0, f318_arg1, f318_arg2 )
			f318_arg1.numElementsInList = f318_arg1.vCount
			f318_arg1.controller = f318_arg0
			local f318_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
			local f318_local1 = Engine.GetModelValue( Engine.GetModel( f318_local0, "tab" ) )
			f318_arg1.showyourfriend = false
			f318_arg1.showlastmet = false
			f318_arg1.GetList = Engine.GetGroupMembers
			f318_arg1.playerCount = Engine.GetFriendsCount( f318_arg0, f318_arg1.filter )
			f318_arg1.socialSubModel = Engine.GetModel( f318_local0, "friends" )
			f318_arg1.players = {}
			local f318_local2 = Engine.GetModel( Engine.GetModelForController( f318_arg0 ), "groups.createGroup.friends_count" )
			if f318_local2 ~= nil then
				Engine.SetModelValue( f318_local2, f318_arg1.playerCount )
			end
			local f318_local3 = {
				selected = false,
				xuid = 0,
				gamertag = "",
				clantag = "",
				fullname = "",
				activity = 0,
				context = 0,
				difficulty = 0,
				playlist = 1,
				joinable = 0,
				gametype = 0,
				mapid = 0,
				friend = 0,
				cpRank = 0,
				cpRankIcon = "",
				cpPrestige = 0,
				mpRank = 0,
				mpRankIcon = "",
				mpPrestige = 0,
				zmRank = 0,
				zmRankIcon = "",
				zmPrestige = 0
			}
			local f318_local4 = {
				xuid = 0,
				showyourfriend = false,
				showlastmet = false,
				gametype = 0,
				mapid = 0,
				difficulty = 0,
				playlist = 1
			}
			for f318_local5 = 1, f318_arg1.numElementsInList, 1 do
				f318_arg1.players[f318_local5] = {}
				f318_arg1.players[f318_local5].root = Engine.CreateModel( f318_arg1.socialSubModel, "player_" .. f318_local5 )
				f318_arg1.players[f318_local5].model = Engine.CreateModel( f318_arg1.players[f318_local5].root, "model" )
				f318_arg1.players[f318_local5].properties = {
					xuid = 0,
					showyourfriend = 0,
					showlastmet = 0,
					gametype = 0,
					mapid = 0,
					difficulty = 0,
					playlist = 1
				}
				for f318_local11, f318_local12 in pairs( f318_local3 ) do
					local f318_local13 = Engine.CreateModel( f318_arg1.players[f318_local5].model, f318_local11 )
				end
			end
			f318_arg1.updateModels = function ( f319_arg0, f319_arg1, f319_arg2, f319_arg3 )
				if not f319_arg1.GetList then
					return 
				end
				local f319_local0 = {}
				f319_local0 = f319_arg1.GetList( f319_arg0, f319_arg2, f319_arg3 )
				for f319_local1 = 1, #f319_local0, 1 do
					local f319_local4 = f319_local0[f319_local1]
					local f319_local5 = (f319_arg2 + f319_local1 - 1) % f319_arg1.numElementsInList + 1
					f319_local4.clantag = "3ARC"
					f319_local4.fullname = string.format( "[%s]%s", f319_local4.clantag, f319_local4.gamertag )
					if f319_arg1.showlastmet == 0 then
						f319_local4.titlePresence = ""
					end
					for f319_local9, f319_local10 in pairs( f319_local4 ) do
						local f319_local11 = Engine.GetModel( f319_arg1.players[f319_local5].model, f319_local9 )
						if f319_local11 ~= nil then
							Engine.SetModelValue( f319_local11, f319_local10 )
						end
						if f319_arg1.players[f319_local5].properties[f319_local9] ~= nil then
							f319_arg1.players[f319_local5].properties[f319_local9] = f319_local10
						end
					end
					f319_arg1.players[f319_local5].properties.showlastmet = f319_arg1.showlastmet
					f319_arg1.players[f319_local5].properties.showyourfriend = f319_arg1.showyourfriend
				end
				return f319_arg1.players[f319_arg2 % f319_arg1.numElementsInList + 1].model
			end
			
			local f318_local5 = Engine.GetModel( f318_arg1.socialSubModel, "update" )
			if f318_arg1.socialUpdateSubscription then
				f318_arg1:removeSubscription( f318_arg1.socialUpdateSubscription )
			end
			f318_arg1.socialUpdateSubscription = f318_arg1:subscribeToModel( f318_local5, function ()
				f0_local12( f318_arg0, f318_arg1 )
			end, false )
		end,
		getCount = function ( f321_arg0 )
			return f321_arg0.playerCount
		end,
		getItem = function ( f322_arg0, f322_arg1, f322_arg2 )
			local f322_local0 = f322_arg1.updateModels( f322_arg0, f322_arg1, f322_arg2 - 1, 1 )
			local f322_local1 = (f322_arg2 - 1)
			return f322_arg1.players[(f322_arg2 - 1) % f322_arg1.numElementsInList + 1].model
		end,
		getCustomPropertiesForItem = function ( f323_arg0, f323_arg1 )
			local f323_local0 = (f323_arg1 - 1)
			return f323_arg0.players[(f323_arg1 - 1) % f323_arg0.numElementsInList + 1].properties
		end
	},
	GroupsGroupEmblemsList = {
		prepare = function ( f324_arg0, f324_arg1, f324_arg2 )
			f324_arg1.controller = f324_arg0
			f324_arg1.emblemListModel = Engine.CreateModel( Engine.GetModelForController( f324_arg0 ), "GroupsGroupEmblemsList" )
			local f324_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f324_arg0 )
			f324_arg1.totalEmblems = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f324_arg0, Enum.StorageFileType.STORAGE_EMBLEMS )
			f324_arg1.emblemList = {}
			local f324_local1 = CoD.CraftUtility.Emblems.GetSortedEmblemsList()
			for f324_local2 = 1, #f324_local1, 1 do
				local f324_local5 = f324_local1[f324_local2]
				if f324_local5.isUsed == 1 then
					table.insert( f324_arg1.emblemList, f324_local5 )
				end
			end
		end,
		getCount = function ( f325_arg0 )
			return f325_arg0.totalEmblems
		end,
		getItem = function ( f326_arg0, f326_arg1, f326_arg2 )
			local f326_local0 = Engine.CreateModel( f326_arg1.emblemListModel, "emblem_" .. f326_arg2 )
			local f326_local1 = f326_arg1.emblemList[f326_arg2]
			if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( f326_local1.emblemIndex ) then
				Engine.SetModelValue( Engine.CreateModel( f326_local0, "emblemName" ), f326_local1.emblemName )
				Engine.SetModelValue( Engine.CreateModel( f326_local0, "emblemTextEntry" ), f326_local1.emblemName )
			else
				Engine.SetModelValue( Engine.CreateModel( f326_local0, "emblemName" ), Engine.Localize( "MENU_EMBLEM_CREATE_NEW" ) )
				Engine.SetModelValue( Engine.CreateModel( f326_local0, "emblemTextEntry" ), Engine.Localize( "MENU_ENTER_EMBLEM_NAME" ) )
			end
			Engine.SetModelValue( Engine.CreateModel( f326_local0, "sortIndex" ), f326_local1.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( f326_local0, "emblemIndex" ), f326_local1.emblemIndex )
			Engine.SetModelValue( Engine.CreateModel( f326_local0, "isUsed" ), f326_local1.isUsed )
			return f326_local0
		end
	},
	GroupMembers = {
		prepare = function ( f327_arg0, f327_arg1, f327_arg2 )
			local f327_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f327_arg0 ), "friends" ), "tab" ) )
			f327_arg1.unifiedFriendModel = Engine.GetModel( Engine.GetGlobalModel(), "sgmListRoot" )
			f327_arg1.unifiedFriendCount = Engine.GetModel( f327_arg1.unifiedFriendModel, "count" )
			f327_arg1:unsubscribeFromAllModels()
			f327_arg1.countSubscription = f327_arg1:subscribeToModel( f327_arg1.unifiedFriendCount, function ( model )
				f327_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f329_arg0 )
			return Engine.GetModelValue( f329_arg0.unifiedFriendCount )
		end,
		getItem = function ( f330_arg0, f330_arg1, f330_arg2 )
			return Engine.GetModel( f330_arg1.unifiedFriendModel, "member" .. f330_arg2 - 1 )
		end
	},
	GroupsInviteButtonList = {
		prepare = function ( f331_arg0, f331_arg1, f331_arg2 )
			f331_arg1.buttons = {}
			local f331_local0 = {}
			f331_arg1.groups = Engine.GetGroupList( f331_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
			for f331_local1 = 1, #f331_arg1.groups, 1 do
				local f331_local4 = f331_arg1.groups[f331_local1]
				table.insert( f331_local0, {
					displayText = f331_local4.name,
					action = InviteToGroup,
					btnType = "group",
					disabled = true,
					groupId = f331_local4.groupId,
					groupBufferType = f331_local4.bufferType,
					name = f331_local4.name,
					clanTag = f331_local4.clanTag,
					description = f331_local4.description,
					message = f331_local4.message,
					privacy = f331_local4.privacy,
					creationTimestamp = f331_local4.creationTimestamp,
					owner = f331_local4.owner,
					ownerXuid = f331_local4.ownerXuid,
					memberStatus = f331_local4.memberStatus,
					memberStatusText = f331_local4.memberStatusText,
					memberCount = f331_local4.memberCount,
					onlineCount = f331_local4.onlineCount,
					inTitleCount = f331_local4.inTitleCount,
					lbIndex = f331_local4.lbIndex,
					lbSortColumn = f331_local4.lbSortColumn,
					lbTimeFrame = f331_local4.lbTimeFrame,
					lbHardcore = f331_local4.lbHardcore,
					lbInitialized = f331_local4.lbInitialized
				} )
			end
			local f331_local2 = Engine.CreateModel( Engine.GetModelForController( f331_arg0 ), "groups" )
			f331_arg1.groupCountModel = Engine.CreateModel( f331_local2, "groupCount_self" )
			local f331_local3 = Engine.CreateModel( f331_local2, "mainButtons" )
			for f331_local7, f331_local8 in ipairs( f331_local0 ) do
				local f331_local9 = Engine.CreateModel( f331_local3, "buttonModel_" .. f331_local7 )
				table.insert( f331_arg1.buttons, {
					model = f331_local9,
					type = f331_local8.btnType,
					groupId = f331_local8.groupId,
					groupBufferType = f331_local8.groupBufferType
				} )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "displayText" ), Engine.Localize( f331_local8.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "action" ), f331_local8.action )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "type" ), f331_local8.btnType )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "groupId" ), f331_local8.groupId )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "groupBufferType" ), f331_local8.groupBufferType )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "name" ), f331_local8.name )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "clanTag" ), f331_local8.clanTag )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "description" ), f331_local8.description )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "message" ), f331_local8.message )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "privacy" ), f331_local8.privacy )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "creationTimestamp" ), f331_local8.creationTimestamp )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "owner" ), f331_local8.owner )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "ownerXuid" ), f331_local8.ownerXuid )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "memberStatus" ), f331_local8.memberStatus )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "memberStatusText" ), f331_local8.memberStatusText )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "memberCount" ), f331_local8.memberCount )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "onlineCount" ), f331_local8.onlineCount )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "inTitleCount" ), f331_local8.inTitleCount )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "lbIndex" ), f331_local8.lbIndex )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "lbSortColumn" ), f331_local8.lbSortColumn )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "lbTimeFrame" ), f331_local8.lbTimeFrame )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "lbHardcore" ), f331_local8.lbHardcore )
				Engine.SetModelValue( Engine.CreateModel( f331_local9, "lbInitialized" ), f331_local8.lbInitialized )
			end
			f331_arg1:subscribeToModel( f331_arg1.groupCountModel, function ()
				f331_arg1:updateDataSource()
			end, false )
		end,
		getCustomPropertiesForItem = function ( f333_arg0, f333_arg1 )
			return f333_arg0.buttons[f333_arg1]
		end,
		getCount = function ( f334_arg0 )
			return #f334_arg0.buttons
		end,
		getItem = function ( f335_arg0, f335_arg1, f335_arg2 )
			return f335_arg1.buttons[f335_arg2].model
		end
	},
	GroupsMainButtonList = {
		prepare = function ( f336_arg0, f336_arg1, f336_arg2 )
			f336_arg1.buttons = {}
			local f336_local0 = {}
			f336_arg1.groups = Engine.GetGroupList( f336_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
			for f336_local1 = 1, #f336_arg1.groups, 1 do
				local f336_local4 = f336_arg1.groups[f336_local1]
				table.insert( f336_local0, {
					displayText = f336_local4.name,
					action = OpenGroupHeadquarters,
					btnType = "group",
					groupId = f336_local4.groupId,
					groupBufferType = f336_local4.bufferType,
					name = f336_local4.name,
					clanTag = f336_local4.clanTag,
					description = f336_local4.description,
					message = f336_local4.message,
					privacy = f336_local4.privacy,
					creationTimestamp = f336_local4.creationTimestamp,
					owner = f336_local4.owner,
					ownerXuid = f336_local4.ownerXuid,
					memberStatus = f336_local4.memberStatus,
					memberStatusText = f336_local4.memberStatusText,
					memberCount = f336_local4.memberCount,
					onlineCount = f336_local4.onlineCount,
					inTitleCount = f336_local4.inTitleCount,
					lbIndex = f336_local4.lbIndex,
					lbSortColumn = f336_local4.lbSortColumn,
					lbTimeFrame = f336_local4.lbTimeFrame,
					lbHardcore = f336_local4.lbHardcore,
					lbInitialized = f336_local4.lbInitialized
				} )
			end
			local f336_local2 = Engine.CreateModel( Engine.GetModelForController( f336_arg0 ), "groups" )
			f336_arg1.groupCountModel = Engine.CreateModel( f336_local2, "groupCount_self" )
			local f336_local3 = Engine.CreateModel( f336_local2, "mainButtons" )
			for f336_local7, f336_local8 in ipairs( f336_local0 ) do
				local f336_local9 = Engine.CreateModel( f336_local3, "buttonModel_" .. f336_local7 )
				table.insert( f336_arg1.buttons, {
					model = f336_local9,
					type = f336_local8.btnType,
					groupId = f336_local8.groupId,
					groupBufferType = f336_local8.groupBufferType
				} )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "displayText" ), Engine.Localize( f336_local8.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "action" ), f336_local8.action )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "type" ), f336_local8.btnType )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "groupId" ), f336_local8.groupId )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "groupBufferType" ), f336_local8.groupBufferType )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "name" ), f336_local8.name )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "clanTag" ), f336_local8.clanTag )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "description" ), f336_local8.description )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "message" ), f336_local8.message )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "privacy" ), f336_local8.privacy )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "creationTimestamp" ), f336_local8.creationTimestamp )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "owner" ), f336_local8.owner )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "ownerXuid" ), f336_local8.ownerXuid )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "memberStatus" ), f336_local8.memberStatus )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "memberStatusText" ), f336_local8.memberStatusText )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "memberCount" ), f336_local8.memberCount )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "onlineCount" ), f336_local8.onlineCount )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "inTitleCount" ), f336_local8.inTitleCount )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "lbIndex" ), f336_local8.lbIndex )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "lbSortColumn" ), f336_local8.lbSortColumn )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "lbTimeFrame" ), f336_local8.lbTimeFrame )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "lbHardcore" ), f336_local8.lbHardcore )
				Engine.SetModelValue( Engine.CreateModel( f336_local9, "lbInitialized" ), f336_local8.lbInitialized )
			end
			f336_arg1:subscribeToModel( f336_arg1.groupCountModel, function ()
				f336_arg1:updateDataSource()
			end, false )
		end,
		getCustomPropertiesForItem = function ( f338_arg0, f338_arg1 )
			return f338_arg0.buttons[f338_arg1]
		end,
		getCount = function ( f339_arg0 )
			return #f339_arg0.buttons
		end,
		getItem = function ( f340_arg0, f340_arg1, f340_arg2 )
			return f340_arg1.buttons[f340_arg2].model
		end
	},
	FindGroupsButtonList = {
		prepare = function ( f341_arg0, f341_arg1, f341_arg2 )
			f341_arg1.buttons = {}
			local f341_local0 = {}
			local f341_local1 = Engine.GetGroupList( f341_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
			local f341_local2 = Engine.GetGroupList( f341_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
			for f341_local3 = 1, #f341_local1, 1 do
				local f341_local6 = false
				for f341_local7 = 1, #f341_local2, 1 do
					if f341_local1[f341_local3].groupId == f341_local2[f341_local7].groupId then
						f341_local6 = true
						break
					end
				end
				if not f341_local6 then
					local f341_local7 = f341_local1[f341_local3]
					table.insert( f341_local0, {
						displayText = f341_local7.name,
						action = OpenGroupHeadquarters,
						btnType = "group",
						groupId = f341_local7.groupId,
						groupBufferType = f341_local7.bufferType,
						name = f341_local7.name,
						clanTag = f341_local7.clanTag,
						description = f341_local7.description,
						message = f341_local7.message,
						privacy = f341_local7.privacy,
						creationTimestamp = f341_local7.creationTimestamp,
						owner = f341_local7.owner,
						ownerXuid = f341_local7.ownerXuid,
						memberStatus = f341_local7.memberStatus,
						memberStatusText = f341_local7.memberStatusText,
						memberCount = f341_local7.memberCount,
						onlineCount = f341_local7.onlineCount,
						inTitleCount = f341_local7.inTitleCount,
						lbIndex = f341_local7.lbIndex,
						lbSortColumn = f341_local7.lbSortColumn,
						lbTimeFrame = f341_local7.lbTimeFrame,
						lbHardcore = f341_local7.lbHardcore,
						lbInitialized = f341_local7.lbInitialized
					} )
				end
			end
			local f341_local4 = Engine.CreateModel( Engine.GetModelForController( f341_arg0 ), "groups" )
			local f341_local5 = Engine.CreateModel( f341_local4, "findGroupsButtons" )
			for f341_local8, f341_local9 in ipairs( f341_local0 ) do
				local f341_local11 = Engine.CreateModel( f341_local5, "buttonModel_" .. f341_local8 )
				table.insert( f341_arg1.buttons, {
					model = f341_local11,
					type = f341_local9.btnType,
					groupId = f341_local9.groupId,
					groupBufferType = f341_local9.groupBufferType
				} )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "displayText" ), Engine.Localize( f341_local9.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "action" ), f341_local9.action )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "type" ), f341_local9.btnType )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "groupId" ), f341_local9.groupId )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "groupBufferType" ), f341_local9.groupBufferType )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "name" ), f341_local9.name )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "clanTag" ), f341_local9.clanTag )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "description" ), f341_local9.description )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "message" ), f341_local9.message )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "privacy" ), f341_local9.privacy )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "creationTimestamp" ), f341_local9.creationTimestamp )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "owner" ), f341_local9.owner )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "ownerXuid" ), f341_local9.ownerXuid )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "memberStatus" ), f341_local9.memberStatus )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "memberStatusText" ), f341_local9.memberStatusText )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "memberCount" ), f341_local9.memberCount )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "onlineCount" ), f341_local9.onlineCount )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "inTitleCount" ), f341_local9.inTitleCount )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "lbIndex" ), f341_local9.lbIndex )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "lbSortColumn" ), f341_local9.lbSortColumn )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "lbTimeFrame" ), f341_local9.lbTimeFrame )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "lbHardcore" ), f341_local9.lbHardcore )
				Engine.SetModelValue( Engine.CreateModel( f341_local11, "lbInitialized" ), f341_local9.lbInitialized )
			end
			f341_arg1.groupCountModel = Engine.CreateModel( f341_local4, "groupCount_search" )
			f341_arg1:subscribeToModel( f341_arg1.groupCountModel, function ()
				f341_arg1:updateDataSource()
			end, false )
			f341_arg1.myGroupCountModel = Engine.CreateModel( f341_local4, "groupCount_self" )
			f341_arg1:subscribeToModel( f341_arg1.myGroupCountModel, function ()
				f341_arg1:updateDataSource()
			end, false )
		end,
		getCustomPropertiesForItem = function ( f344_arg0, f344_arg1 )
			return f344_arg0.buttons[f344_arg1]
		end,
		getCount = function ( f345_arg0 )
			return #f345_arg0.buttons
		end,
		getItem = function ( f346_arg0, f346_arg1, f346_arg2 )
			return f346_arg1.buttons[f346_arg2].model
		end
	},
	GroupsHeadquartersTabList = f0_local7( "GroupsHeadquartersTabModel", function ( f347_arg0 )
		local f347_local0 = {}
		local f347_local1 = DoesHaveAdminRightsForGroup( nil, f347_arg0 )
		table.insert( f347_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f347_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_OVERVIEW_CAPS" ),
				tabWidget = "CoD.OverviewTab"
			},
			properties = {
				tabId = "overview"
			}
		} )
		table.insert( f347_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_ROSTER_CAPS" ),
				tabWidget = "CoD.RosterTab"
			},
			properties = {
				tabId = "roster"
			}
		} )
		table.insert( f347_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_LEADERBOARD_CAPS" ),
				tabWidget = "CoD.LeaderboardTab"
			},
			properties = {
				tabId = "leaderboard"
			}
		} )
		table.insert( f347_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_SHOWCASE_CAPS" ),
				tabWidget = "CoD.ShowcaseTab"
			},
			properties = {
				tabId = "showcase"
			}
		} )
		if f347_local1 then
			table.insert( f347_local0, {
				models = {
					tabName = Engine.Localize( "GROUPS_ADMIN_CAPS" ),
					tabWidget = "CoD.AdminTab"
				},
				properties = {
					tabId = "admin"
				}
			} )
		end
		table.insert( f347_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f347_local0
	end
	, true ),
	GroupHeadquartersOverviewButtonList = f0_local7( "GroupHeadquartersOverviewButtonListModel", function ( f348_arg0 )
		local f348_local0 = {}
		local f348_local1 = not IsNotAGroupMember( nil, f348_arg0 )
		local f348_local2 = IsGroupOwner( nil, f348_arg0 )
		if f348_local1 then
			table.insert( f348_local0, {
				models = {
					displayText = Engine.Localize( "GROUPS_SET_AS_PRIMARY_GROUP_CAPS" ),
					action = CoD.NullFunction
				}
			} )
			table.insert( f348_local0, {
				models = {
					displayText = Engine.Localize( "GROUPS_STOP_PUBLISHING_CAPS" ),
					action = CoD.NullFunction
				}
			} )
			table.insert( f348_local0, {
				models = {
					displayText = Engine.Localize( "GROUPS_LEAVE_GROUP_CAPS" ),
					action = ProcessLeaveSelectedGroup
				}
			} )
		end
		if not f348_local2 then
			table.insert( f348_local0, {
				models = {
					displayText = Engine.Localize( "GROUPS_REPORT_GROUP_CAPS" ),
					action = CoD.NullFunction
				}
			} )
		end
		return f348_local0
	end
	 ),
	GroupHeadquartersAdminButtonList = f0_local7( "GroupHeadquartersAdminButtonListModel", function ( f349_arg0 )
		local f349_local0 = {}
		table.insert( f349_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_MESSAGE" ),
				action = EditSelectedGroupMessage
			}
		} )
		table.insert( f349_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_EMBLEM" ),
				action = EditSelectedGroupEmblem
			}
		} )
		table.insert( f349_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_DESCRIPTION" ),
				action = EditSelectedGroupDescription
			}
		} )
		table.insert( f349_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_CLAN_TAG" ),
				action = EditSelectedGroupClanTag
			}
		} )
		table.insert( f349_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_CHANGE_GROUP_TYPE" ),
				action = CoD.NullFunction
			}
		} )
		return f349_local0
	end
	 ),
	SelectedGroup = {
		getModel = function ( f350_arg0 )
			if not f350_arg0 then
				f350_arg0 = Engine.GetPrimaryController()
			end
			return CoD.perController[f350_arg0].selectedGroup
		end
	},
	CreateGroup = {
		getModel = function ( f351_arg0 )
			if not f351_arg0 then
				f351_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f351_arg0 ), "groups" ), "createGroup" )
		end
	},
	GroupPrivacyModes = f0_local7( "GroupPrivacyModes", function ( f352_arg0 )
		local f352_local0 = {
			{
				name = "Public",
				value = Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC
			},
			{
				name = "Private",
				value = Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE
			}
		}
		local f352_local1 = {}
		for f352_local5, f352_local6 in ipairs( f352_local0 ) do
			table.insert( f352_local1, {
				models = {
					text = f352_local0[f352_local5].name,
					value = f352_local0[f352_local5].value,
					selectIndex = 1
				},
				properties = {
					title = f352_local0[f352_local5].name,
					value = f352_local0[f352_local5].value,
					selectIndex = 1
				}
			} )
		end
		f352_local1[1].properties.first = true
		f352_local1[#f352_local0].properties.last = true
		return f352_local1
	end
	, nil, nil, nil ),
	LeaderboardMakerButtonList = {
		prepare = function ( f353_arg0, f353_arg1, f353_arg2 )
			f353_arg1.buttons = {}
			local f353_local0 = {}
			local f353_local1 = ""
			local f353_local2 = nil
			local f353_local3 = Engine.GetModelForController( f353_arg0 )
			local f353_local4 = Engine.GetModel( f353_local3, "groups.leaderboardmaker.state" )
			local f353_local5 = Engine.GetModelValue( f353_local4 )
			local f353_local6 = Engine.GetModelValue( Engine.GetModel( f353_local3, "groups.leaderboardmaker.lbIndex" ) )
			local f353_local7 = Engine.GetModelValue( Engine.GetModel( f353_local3, "groups.leaderboardmaker.lbSortColumn" ) )
			if f353_local6 ~= nil and f353_local6 > 0 then
				f353_local2 = CoD.Leaderboard_MP.GetLeaderboardCoreNameData( CoD.Leaderboard_MP.Leaderboards[f353_local6][CoD.Leaderboard_MP.CoreName] )
			end
			local f353_local8 = CoD.perController[f353_arg0].selectedGroup
			local f353_local9 = Engine.GetModelValue( Engine.GetModel( f353_local8, "lbIndex" ) )
			local f353_local10 = Engine.GetModelValue( Engine.GetModel( f353_local8, "lbSortColumn" ) )
			local f353_local11 = Engine.GetModelValue( Engine.GetModel( f353_local8, "lbTimeFrame" ) )
			f353_arg1.leaderboardMakerStateModel = f353_local4
			if f353_local5 ~= nil then
				if f353_local5 == "SelectAction" then
					f353_local1 = "GROUPS_LBMAKER_SELECT_ACTION_TITLE"
					table.insert( f353_local0, {
						model = {
							titleText = f353_local1,
							displayText = "GROUPS_EDIT_LEADERBOARD",
							action = ProcessEditGroupLeaderboard,
							hintText = Engine.Localize( "GROUPS_EDIT_LEADERBOARD_HINT_TEXT" )
						},
						properties = {
							btnId = "EditLeaderboard"
						}
					} )
					table.insert( f353_local0, {
						model = {
							titleText = f353_local1,
							displayText = "GROUPS_REMOVE_LEADERBOARD",
							action = ProcessRemoveGroupLeaderboard,
							hintText = Engine.Localize( "GROUPS_REMOVE_LEADERBOARD_HINT_TEXT" )
						},
						properties = {
							btnId = "RemoveLeaderboard"
						}
					} )
				elseif f353_local5 == "ChooseBaseLeaderboard" then
					f353_local1 = "GROUPS_LBMAKER_CHOOSE_BASE_LEADERBOARD_TITLE"
					for f353_local12 = 1, #CoD.Leaderboard_MP.LeaderboardCoreNames, 1 do
						local f353_local15 = CoD.Leaderboard_MP.LeaderboardCoreNames[f353_local12]
						local f353_local16 = false
						if f353_local9 ~= nil and f353_local12 == f353_local9 then
							f353_local16 = true
						end
						table.insert( f353_local0, {
							model = {
								titleText = f353_local1,
								displayText = f353_local15.stringRef,
								action = ProcessChooseBaseLeaderboard,
								hintText = Engine.Localize( f353_local15.lbMakerHint ),
								icon = f353_local15.icon,
								baseLeaderboard = f353_local15.stringRef
							},
							properties = {
								btnId = f353_local15.name,
								showSelectedIcon = f353_local16
							}
						} )
					end
				elseif f353_local5 == "ChooseDefaultSort" then
					f353_local1 = "GROUPS_LBMAKER_CHOOSE_DEFAULT_SORT_TITLE"
					local f353_local12 = CoD.Leaderboard_MP.Leaderboards[f353_local6][CoD.Leaderboard_MP.SortColumn]
					for f353_local13 = 1, #f353_local12, 1 do
						local f353_local16 = f353_local12[f353_local13]
						local f353_local18 = false
						if f353_local9 ~= nil and f353_local10 ~= nil and f353_local6 == f353_local9 and f353_local13 == f353_local10 then
							f353_local18 = true
						end
						for f353_local19 = 1, #CoD.Leaderboard_MP.LeaderboardSortColumns, 1 do
							local f353_local22 = CoD.Leaderboard_MP.LeaderboardSortColumns[f353_local19]
							if f353_local22.name == f353_local16 then
								table.insert( f353_local0, {
									model = {
										titleText = f353_local1,
										displayText = f353_local22.stringRef,
										action = ProcessChooseDefaultSort,
										hintText = Engine.Localize( "GROUPS_LBMAKER_DEFAULT_SORT_ORDER_HINT_TEXT", f353_local22.stringRef ),
										icon = f353_local2.icon,
										baseLeaderboard = f353_local2.stringRef,
										sortColumn = f353_local22.stringRef
									},
									properties = {
										btnId = f353_local16,
										showSelectedIcon = f353_local18
									}
								} )
							end
						end
					end
				elseif f353_local5 == "ChooseTimeFrame" then
					f353_local1 = "GROUPS_LBMAKER_CHOOSE_TIME_FRAME_TITLE"
					local f353_local12 = CoD.Leaderboard_MP.GetLeaderboardSortColumnData( CoD.Leaderboard_MP.Leaderboards[f353_local6][CoD.Leaderboard_MP.SortColumn][f353_local7] )
					local f353_local13 = CoD.Leaderboard_MP.Leaderboards[f353_local6][CoD.Leaderboard_MP.TimeFrame]
					for f353_local14 = 1, #f353_local13, 1 do
						local f353_local18 = f353_local13[f353_local14]
						for f353_local19 = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
							local f353_local22 = CoD.Leaderboard_MP.LeaderboardTimeFrames[f353_local19]
							if f353_local22.name == f353_local18 then
								local f353_local23 = false
								if f353_local9 ~= nil and f353_local10 ~= nil and f353_local11 ~= nil and f353_local6 == f353_local9 and f353_local7 == f353_local10 and f353_local22.value == f353_local11 then
									f353_local23 = true
								end
								table.insert( f353_local0, {
									model = {
										titleText = f353_local1,
										displayText = f353_local22.stringRef,
										action = ProcessChooseTimeFrame,
										hintText = Engine.Localize( f353_local22.lbMakerHint ),
										icon = f353_local2.icon,
										baseLeaderboard = f353_local2.stringRef,
										sortColumn = f353_local12.stringRef,
										timeFrame = f353_local22.stringRef
									},
									properties = {
										btnId = f353_local18,
										showSelectedIcon = f353_local23
									}
								} )
							end
						end
					end
				end
			end
			for f353_local17, f353_local15 in ipairs( f353_local0 ) do
				local f353_local16 = f353_local15.model
				local f353_local18 = f353_local15.properties
				local f353_local19 = Engine.CreateModel( Engine.GetModel( f353_local3, "groups.leaderboardmaker" ), "buttonModel_" .. f353_local17 )
				table.insert( f353_arg1.buttons, {
					model = f353_local19,
					properties = f353_local18
				} )
				Engine.SetModelValue( Engine.CreateModel( f353_local19, "titleText" ), Engine.Localize( f353_local16.titleText ) )
				Engine.SetModelValue( Engine.CreateModel( f353_local19, "displayText" ), Engine.Localize( f353_local16.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f353_local19, "hintText" ), f353_local16.hintText )
				Engine.SetModelValue( Engine.CreateModel( f353_local19, "action" ), f353_local16.action )
				Engine.SetModelValue( Engine.CreateModel( f353_local19, "icon" ), f353_local16.icon )
				Engine.SetModelValue( Engine.CreateModel( f353_local19, "baseLeaderboard" ), f353_local16.baseLeaderboard )
				Engine.SetModelValue( Engine.CreateModel( f353_local19, "sortColumn" ), f353_local16.sortColumn )
				Engine.SetModelValue( Engine.CreateModel( f353_local19, "timeFrame" ), f353_local16.timeFrame )
			end
			f353_arg1:subscribeToModel( f353_arg1.leaderboardMakerStateModel, function ()
				f353_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f355_arg0 )
			return #f355_arg0.buttons
		end,
		getCustomPropertiesForItem = function ( f356_arg0, f356_arg1 )
			return f356_arg0.buttons[f356_arg1].properties
		end,
		getItem = function ( f357_arg0, f357_arg1, f357_arg2 )
			return f357_arg1.buttons[f357_arg2].model
		end
	},
	LeaderboardHeader = {
		getModel = function ( f358_arg0 )
			if not f358_arg0 then
				f358_arg0 = Engine.GetPrimaryController()
			end
			local f358_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "header" )
			local f358_local1 = 3
			local f358_local2 = 5
			local f358_local3 = f358_local1 - 1
			local f358_local4 = {}
			local f358_local5, f358_local6 = nil
			local f358_local7 = 1
			local f358_local8 = Engine.GetLeaderboardHeaders( f358_arg0 )
			if f358_local8 == nil then
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "baseLeaderboard" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "timeFrame" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "position" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "rank" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "name" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "column0" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "column1" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "column2" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "column3" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f358_local0, "column4" ), "" )
				return f358_local0
			end
			local f358_local9 = f358_local8.lbheaders
			if f358_local1 < tonumber( f358_local9.count ) then
				f358_local5 = f358_local9.count - f358_local1
			else
				f358_local5 = 0
			end
			local f358_local10 = f358_local2 - f358_local5
			for f358_local11 = 1, f358_local3, 1 do
				f358_local4[f358_local11] = f358_local9[f358_local7]
				f358_local7 = f358_local7 + 1
			end
			for f358_local11 = 1, f358_local2, 1 do
				if f358_local11 <= f358_local10 then
					f358_local4[f358_local11 + f358_local3] = ""
				else
					f358_local4[f358_local11 + f358_local3] = f358_local9[f358_local7]
					f358_local7 = f358_local7 + 1
				end
			end
			local f358_local11 = ""
			local f358_local12 = ""
			if HasSelectedGroup( nil, nil, {
				controller = f358_arg0
			} ) then
				local f358_local13, f358_local14, f358_local15, f358_local16, f358_local17 = Engine.GetGroupLeaderboardInfo()
				if f358_local17 == true and f358_local13 > 0 then
					local f358_local18 = CoD.Leaderboard_MP.GetLeaderboardCoreNameData( CoD.Leaderboard_MP.Leaderboards[f358_local13][CoD.Leaderboard_MP.CoreName] )
					local f358_local19 = CoD.Leaderboard_MP.GetTimeFrameDataFromEnumValue( f358_local15 )
					f358_local11 = Engine.Localize( f358_local18.stringRef )
					f358_local12 = Engine.Localize( f358_local19.stringRef )
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "baseLeaderboard" ), f358_local11 )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "timeFrame" ), f358_local12 )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "position" ), f358_local4[1] )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "rank" ), Engine.Localize( "MENU_LB_LEVEL" ) )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "name" ), f358_local4[2] )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "column0" ), f358_local4[3] )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "column1" ), f358_local4[4] )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "column2" ), f358_local4[5] )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "column3" ), f358_local4[6] )
			Engine.SetModelValue( Engine.CreateModel( f358_local0, "column4" ), f358_local4[7] )
			return f358_local0
		end
	},
	LeaderboardRows = {
		prepare = function ( f359_arg0, f359_arg1, f359_arg2 )
			f359_arg1.buttons = {}
			local f359_local0 = {}
			local f359_local1 = Enum.eModes.MODE_MULTIPLAYER
			local f359_local2 = Engine.GetModel( Engine.GetGlobalModel(), "combatRecordMode" )
			if f359_local2 then
				local f359_local3 = Engine.GetModelValue( f359_local2 )
				if f359_local3 == "cp" then
					f359_local1 = Enum.eModes.MODE_CAMPAIGN
				elseif f359_local3 == "mp" then
					f359_local1 = Enum.eModes.MODE_MULTIPLAYER
				elseif f359_local3 == "zm" then
					f359_local1 = Enum.eModes.MODE_ZOMBIES
				end
			end
			CoD.perController[f359_arg0].leaderboardTopOrBottom = nil
			local f359_local3 = CoD.perController[f359_arg0].pivotPosition
			local f359_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
			local f359_local5 = Engine.CreateModel( f359_local4, "rows" )
			local f359_local6 = string.format( "%d %d %d", CoD.BOIIOrange.r * 255, CoD.BOIIOrange.g * 255, CoD.BOIIOrange.b * 255 )
			local f359_local7 = string.format( "%d %d %d", CoD.white.r * 255, CoD.white.g * 255, CoD.white.b * 255 )
			local f359_local8 = string.format( "%d %d %d", CoD.playerYellow.r * 255, CoD.playerYellow.g * 255, CoD.playerYellow.b * 255 )
			local f359_local9 = Engine.GetXUID64( f359_arg0 )
			local f359_local10 = Engine.GetLeaderboardData( f359_arg0, f359_local1 )
			local f359_local11 = Engine.GetLeaderboardHeaders( f359_arg0 )
			local f359_local12 = 4
			local f359_local13 = 5
			local f359_local14 = 3
			for f359_local15 = 1, #f359_local10, 1 do
				local f359_local18 = f359_local10[f359_local15]
				local f359_local19 = f359_local13 - #f359_local18 - f359_local12
				local f359_local20 = {}
				local f359_local21 = {}
				local f359_local22 = false
				local f359_local23 = f359_local12 + 1
				local f359_local24 = f359_local7
				if f359_local9 == f359_local18.xuid then
					f359_local24 = f359_local8
				end
				local f359_local25 = {
					position = 0,
					gamertag = "",
					rank = 0,
					rankIcon = "",
					rankString = "",
					colData = {},
					colColor = {},
					statData = {},
					statColor = {},
					statLabel = {}
				}
				for f359_local26 = #f359_local18, 1, -1 do
					if f359_local18[f359_local26].rankCol then
						f359_local25.position = f359_local18[f359_local26].col
					end
					if f359_local18[f359_local26].gamertagCol then
						f359_local25.gamertag = f359_local18[f359_local26].col
					end
					if f359_local18[f359_local26].type == LuaEnums.LBCOL_TYPE.LBCOL_TYPE_PRESTIGE then
						f359_local25.rankIcon = f359_local18[f359_local26].col
					end
					if f359_local18[f359_local26].type == LuaEnums.LBCOL_TYPE.LBCOL_TYPE_LEVELXP and not IsFreerunLeaderboard( f359_arg0 ) then
						f359_local25.rank = tonumber( f359_local18[f359_local26].col )
						f359_local25.rankString = CoD.GetRankName( f359_local25.rank - 1, 0, f359_local1 )
					end
					if f359_local26 == 3 and IsFreerunLeaderboard( f359_arg0 ) then
						f359_local18[f359_local26].col = NumberAsTime( f359_local18[f359_local26].col )
					end
					table.insert( f359_local25.colData, f359_local18[f359_local26].col )
					table.insert( f359_local25.colColor, f359_local24 )
				end
				local f359_local26 = #f359_local25.colData
				local f359_local27 = f359_local13 - f359_local26
				f359_local25.colColor[f359_local26] = f359_local6
				for f359_local28 = 0, f359_local14 - 1, 1 do
					local f359_local31 = f359_local26 - f359_local28
					local f359_local32 = f359_local28 + 3
					table.insert( f359_local25.statData, f359_local25.colData[f359_local31] )
					table.insert( f359_local25.statColor, f359_local25.colColor[f359_local31] )
					table.insert( f359_local25.statLabel, f359_local11.lbheaders[f359_local32] )
				end
				for f359_local28 = 1, f359_local27, 1 do
					local f359_local33 = f359_local28
					table.insert( f359_local25.colData, "" )
					table.insert( f359_local25.colColor, f359_local24 )
				end
				if HasSelectedGroup( nil, nil, {
					controller = f359_arg0
				} ) then
					position = f359_local15
				end
				local f359_local28 = 0
				local f359_local29 = false
				if f359_local3 then
					f359_local29 = tonumber( f359_local25.position ) == f359_local3
				else
					f359_local29 = f359_local9 == f359_local18.xuid
				end
				table.insert( f359_local0, {
					model = {
						position = f359_local25.position,
						name = f359_local25.gamertag,
						rank = f359_local25.rank,
						rankIcon = f359_local25.rankIcon,
						rankString = f359_local25.rankString,
						column0 = f359_local25.colData[5],
						column0color = f359_local25.colColor[5],
						column1 = f359_local25.colData[4],
						column1color = f359_local25.colColor[4],
						column2 = f359_local25.colData[3],
						column2color = f359_local25.colColor[3],
						column3 = f359_local25.colData[2],
						column3color = f359_local25.colColor[2],
						column4 = f359_local25.colData[1],
						column4color = f359_local25.colColor[1],
						stat0 = f359_local25.statData[1],
						stat0color = f359_local25.statColor[1],
						stat0label = f359_local25.statLabel[1],
						stat1 = f359_local25.statData[2],
						stat1color = f359_local25.statColor[2],
						stat1label = f359_local25.statLabel[2],
						stat2 = f359_local25.statData[3],
						stat2color = f359_local25.statColor[3],
						stat2label = f359_local25.statLabel[3],
						rowColor = f359_local24,
						xuid = f359_local18.xuid,
						backgroundId = f359_local28
					},
					properties = {
						selectIndex = f359_local29
					}
				} )
			end
			for f359_local34, f359_local18 in ipairs( f359_local0 ) do
				local f359_local35 = f359_local18.model
				local f359_local19 = f359_local18.properties
				local f359_local20 = Engine.CreateModel( f359_local5, "buttonModel_" .. f359_local34 )
				table.insert( f359_arg1.buttons, {
					model = f359_local20,
					properties = f359_local19
				} )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "position" ), f359_local35.position )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "rankIcon" ), f359_local35.rankIcon )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "rank" ), f359_local35.rank )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "rankString" ), f359_local35.rankString )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "name" ), f359_local35.name )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column0" ), tostring( f359_local35.column0 ) )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column1" ), tostring( f359_local35.column1 ) )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column2" ), tostring( f359_local35.column2 ) )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column3" ), tostring( f359_local35.column3 ) )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column4" ), tostring( f359_local35.column4 ) )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column0color" ), f359_local35.column0color )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column1color" ), f359_local35.column1color )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column2color" ), f359_local35.column2color )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column3color" ), f359_local35.column3color )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "column4color" ), f359_local35.column4color )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat0" ), f359_local35.stat0 )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat1" ), f359_local35.stat1 )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat2" ), f359_local35.stat2 )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat0color" ), f359_local35.stat0color )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat1color" ), f359_local35.stat1color )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat2color" ), f359_local35.stat2color )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat0label" ), f359_local35.stat0label )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat1label" ), f359_local35.stat1label )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "stat2label" ), f359_local35.stat2label )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "rowColor" ), f359_local35.rowColor )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "xuid" ), f359_local35.xuid )
				Engine.SetModelValue( Engine.CreateModel( f359_local20, "backgroundId" ), f359_local35.backgroundId )
			end
			f359_arg1.leaderboardIsUpdatingModel = Engine.CreateModel( f359_local4, "isUpdating" )
			if f359_arg1.leaderboardIsUpdatingSubscription then
				f359_arg1:removeSubscription( f359_arg1.leaderboardIsUpdatingSubscription )
			end
			f359_arg1.leaderboardIsUpdatingSubscription = f359_arg1:subscribeToModel( f359_arg1.leaderboardIsUpdatingModel, function ( model )
				f359_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f361_arg0 )
			return #f361_arg0.buttons
		end,
		getCustomPropertiesForItem = function ( f362_arg0, f362_arg1 )
			return f362_arg0.buttons[f362_arg1].properties
		end,
		getItem = function ( f363_arg0, f363_arg1, f363_arg2 )
			return f363_arg1.buttons[f363_arg2].model
		end
	},
	LeaderboardTabType = f0_local7( "LeaderboardTabType", function ( f364_arg0 )
		local f364_local0 = {}
		local f364_local1 = Engine.GetModel( Engine.GetGlobalModel(), "combatRecordMode" )
		if not f364_local1 then
			return f364_local0
		end
		local f364_local2 = Engine.GetModelValue( f364_local1 )
		table.insert( f364_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if f364_local2 == "cp" then
			table.insert( f364_local0, {
				models = {
					tabName = "MENU_LB_TAB_TRAINING_SIM_CAPS",
					tabIcon = "",
					tabCategory = "trainingSim"
				},
				properties = {
					tabId = "leaderboard_cp_trainingSim"
				}
			} )
		elseif f364_local2 == "mp" then
			table.insert( f364_local0, {
				models = {
					tabName = "MENU_LB_TAB_CORE_CAPS",
					tabIcon = "",
					tabCategory = "core"
				},
				properties = {
					tabId = "leaderboard_mp_core"
				}
			} )
			table.insert( f364_local0, {
				models = {
					tabName = "MENU_LB_TAB_HARDCORE_CAPS",
					tabIcon = "",
					tabCategory = "hardcore"
				},
				properties = {
					tabId = "leaderboard_mp_hardcore"
				}
			} )
			table.insert( f364_local0, {
				models = {
					tabName = "MENU_LB_TAB_ARENA_CAPS",
					tabIcon = "",
					tabCategory = "arena"
				},
				properties = {
					tabId = "leaderboard_mp_arena"
				}
			} )
			table.insert( f364_local0, {
				models = {
					tabName = "MENU_LB_TAB_FREERUN_CAPS",
					tabIcon = "",
					tabCategory = "freerun"
				},
				properties = {
					tabId = "leaderboard_mp_freerun"
				}
			} )
		elseif f364_local2 == "zm" then
			table.insert( f364_local0, {
				models = {
					tabName = "MENU_LB_TAB_ZMGLOBAL_CAPS",
					tabIcon = "",
					tabCategory = "zm_global"
				},
				properties = {
					tabId = "leaderboard_zm_global"
				}
			} )
			table.insert( f364_local0, {
				models = {
					tabName = "MENU_LB_TAB_ZMMAPS_CAPS",
					tabIcon = "",
					tabCategory = "zm_maps"
				},
				properties = {
					tabId = "leaderboard_zm_maps"
				}
			} )
			table.insert( f364_local0, {
				models = {
					tabName = "MENU_DOA2_TITLE",
					tabIcon = "",
					tabCategory = "doa"
				},
				properties = {
					tabId = "leaderboard_doa"
				}
			} )
		end
		table.insert( f364_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f364_local0
	end
	 ),
	LeaderboardMenuTitle = {
		getModel = function ( f365_arg0 )
			local f365_local0 = Engine.CreateModel( Engine.GetModelForController( f365_arg0 ), "leaderboardMenuTitle" )
			local f365_local1 = Engine.CreateModel( f365_local0, "title" )
			local f365_local2 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
			if not f365_local2 then
				return f365_local0
			else
				local f365_local3 = Engine.GetModelValue( f365_local2 )
				if not f365_local3 then
					return f365_local0
				else
					Engine.SetModelValue( f365_local1, Engine.Localize( "MENU_LEADERBOARD_MENU_HEADER_CAPS", Engine.Localize( CoD.LeaderboardUtility.leaderboardTab[f365_local3].leaderboardHeaderText ) ) )
					return f365_local0
				end
			end
		end
	},
	TeamOperationSystem = {
		getModel = function ( f366_arg0 )
			if not f366_arg0 then
				f366_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f366_arg0 ), "teamOperationSystem" )
		end
	},
	RaidsPurchases = {
		prepare = function ( f367_arg0, f367_arg1, f367_arg2 )
			
		end,
		getCount = function ( f368_arg0 )
			return #DataSources.RaidsPurchases.Items
		end,
		getItem = function ( f369_arg0, f369_arg1, f369_arg2 )
			return DataSources.RaidsPurchases.Items[f369_arg2]
		end
	},
	Friends = {
		getCount = function ( f370_arg0 )
			return 10
		end,
		getItem = function ( f371_arg0, f371_arg1, f371_arg2 )
			local f371_local0 = {
				name = "Caezar",
				status = "Online",
				rank = "14",
				emblem = "menu_div_gold",
				rankIcon = "rank_com"
			}
			if f371_arg2 % 2 == 0 then
				f371_local0.name = "Bat35" .. f371_arg2
				f371_local0.emblem = "menu_div_bronze"
			end
			if f371_arg2 % 3 == 0 then
				f371_local0.name = "FakeForAll" .. f371_arg2
				f371_local0.emblem = "menu_div_silver"
				f371_local0.rankIcon = "rank_cpt"
				f371_local0.rank = 19
			end
			if f371_arg2 % 5 == 0 then
				f371_local0.name = "SuperGoat" .. f371_arg2
				f371_local0.emblem = "menu_div_bronze"
				f371_local0.rankIcon = "rank_sgt"
				f371_local0.rank = 34
			end
			if f371_arg2 % 7 == 0 then
				f371_local0.name = "SuperGoat" .. f371_arg2
				f371_local0.emblem = "menu_div_platinum"
				f371_local0.rankIcon = "rank_prestige02"
				f371_local0.rank = 50
			end
			local f371_local1 = Engine.CreateModel( Engine.GetModelForController( f371_arg0 ), "Friendz." .. f371_arg2 )
			for f371_local5, f371_local6 in pairs( f371_local0 ) do
				Engine.SetModelValue( Engine.CreateModel( f371_local1, f371_local5 ), f371_local6 )
			end
			return f371_local1
		end
	},
	FriendsMainTabList = f0_local7( "FriendsMainTabModel", function ( f372_arg0 )
		local f372_local0 = {
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderl
				},
				properties = {
					m_mouseDisabled = true
				}
			},
			{
				models = {
					tabName = Engine.Localize( "MENU_FRIENDS_CAPS" ),
					tabWidget = "CoD.Friends_FriendsTab"
				},
				properties = {
					tabId = "friends"
				}
			},
			{
				models = {
					tabName = Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ),
					tabWidget = "CoD.Friends_RecentPlayersTab"
				},
				properties = {
					tabId = "recent"
				}
			},
			{
				models = {
					tabName = Engine.Localize( "GROUPS_CAPS" ),
					tabWidget = "CoD.Friends_GroupsTab"
				},
				properties = {
					tabId = "grpmembers"
				}
			},
			{
				models = {
					tabName = Engine.Localize( "MENU_INBOX_CAPS" ),
					tabWidget = "CoD.Friends_InboxTab"
				},
				properties = {
					tabId = "inbox"
				}
			},
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderr
				},
				properties = {
					m_mouseDisabled = true
				}
			}
		}
		if Dvar.ui_execdemo:get() or CoD.isPC then
			f372_local0 = {
				{
					models = {
						tabIcon = "^BBUTTON_LUI_SHOULDERL^"
					},
					properties = {
						m_mouseDisabled = true
					}
				},
				{
					models = {
						tabName = Engine.Localize( "MENU_FRIENDS_CAPS" ),
						tabWidget = "CoD.Friends_FriendsTab"
					},
					properties = {
						tabId = "friends"
					}
				},
				{
					models = {
						tabName = Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ),
						tabWidget = "CoD.Friends_RecentPlayersTab"
					},
					properties = {
						tabId = "recent"
					}
				},
				{
					models = {
						tabIcon = "^BBUTTON_LUI_SHOULDERR^"
					},
					properties = {
						m_mouseDisabled = true
					}
				}
			}
		end
		return f372_local0
	end
	 ),
	LobbyFriends = {
		prepare = function ( f373_arg0, f373_arg1, f373_arg2 )
			local f373_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f373_arg0 ), "friends" ), "tab" ) )
			local f373_local1 = nil
			if f373_local0 == "friends" then
				f373_local1 = "unifiedListRoot"
			elseif f373_local0 == "recent" then
				f373_local1 = "rmpListRoot"
			elseif f373_local0 == "inbox" then
				f373_local1 = "inboxListRoot"
			elseif f373_local0 == "roster" then
				f373_local1 = "sgmListRoot"
			elseif f373_local0 == "grpmembers" then
				f373_local1 = "unifiedGroupMembersListRoot"
			else
				f373_local1 = "unifiedListRoot"
			end
			f373_arg1.unifiedFriendModel = Engine.GetModel( Engine.GetGlobalModel(), f373_local1 )
			f373_arg1.unifiedFriendCount = Engine.GetModel( f373_arg1.unifiedFriendModel, "count" )
			f373_arg1:unsubscribeFromAllModels()
			f373_arg1.countSubscription = f373_arg1:subscribeToModel( f373_arg1.unifiedFriendCount, function ( model )
				f373_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f375_arg0 )
			return Engine.GetModelValue( f375_arg0.unifiedFriendCount )
		end,
		getItem = function ( f376_arg0, f376_arg1, f376_arg2 )
			return Engine.GetModel( f376_arg1.unifiedFriendModel, "member" .. f376_arg2 - 1 )
		end
	},
	GameScore = {
		getModel = function ( f377_arg0 )
			if not f377_arg0 then
				f377_arg0 = Engine.GetPrimaryController()
			end
			local f377_local0 = Engine.CreateModel( Engine.GetModelForController( f377_arg0 ), "gameScore" )
			if not Engine.IsInGame() then
				local f377_local1 = Engine.GetScoreboardData( f377_arg0 )
				Engine.SetModelValue( Engine.CreateModel( f377_local0, "alliesScore" ), f377_local1.scores.TEAM_ALLIES )
				Engine.SetModelValue( Engine.CreateModel( f377_local0, "axisScore" ), f377_local1.scores.TEAM_AXIS )
				if Engine.GetLuaCodeVersion() >= 7 and not IsTeamBasedGame( f377_arg0 ) then
					Engine.SetModelValue( Engine.CreateModel( f377_local0, "firstPlaceXUID" ), f377_local1.topScore.topScoreXUID )
					Engine.SetModelValue( Engine.CreateModel( f377_local0, "highestScore" ), f377_local1.topScore.highestScore )
					Engine.SetModelValue( Engine.CreateModel( f377_local0, "highestScoreName" ), f377_local1.topScore.highestScoreName )
				end
			end
			return f377_local0
		end
	},
	Equipment = {
		getModel = function ( f378_arg0 )
			if not f378_arg0 then
				f378_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f378_arg0 ), "Equipment" )
		end
	},
	ClientscriptDebugMenu = {
		prepare = function ( f379_arg0, f379_arg1, f379_arg2 )
			f379_arg1.cscDebugMenuModel = f379_arg1:getModel( Engine.GetPrimaryController(), "cscDebugMenu" )
			f379_arg1.cscDebugMenuCountModel = Engine.GetModel( f379_arg1.cscDebugMenuModel, "cscDebugMenuCount" )
			f379_arg1:unsubscribeFromAllModels()
			f379_arg1:subscribeToModel( f379_arg1.cscDebugMenuCountModel, function ()
				f379_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f381_arg0 )
			return Engine.GetModelValue( f381_arg0.cscDebugMenuCountModel )
		end,
		getItem = function ( f382_arg0, f382_arg1, f382_arg2 )
			return Engine.GetModel( f382_arg1.cscDebugMenuModel, "listItem" .. f382_arg2 - 1 )
		end
	},
	CPMissionOverviewFrontend = {
		getModel = function ( f383_arg0 )
			DataSources.CPMapsList.prepare( f383_arg0, {} )
			local f383_local0 = 0
			local f383_local1 = Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if Engine.IsCampaignModeZombies() then
				f383_local1 = Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES
			end
			for f383_local5, f383_local6 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f384_arg0, f384_arg1 )
				return CoD.mapsTable[f384_arg0].unique_id < CoD.mapsTable[f384_arg1].unique_id
			end, nil ) do
				if f383_local6.session_mode == Enum.eModes.MODE_CAMPAIGN and f383_local6.campaign_mode == f383_local1 and f383_local6.dlc_pack ~= -1 and f383_local6.isSubLevel == false then
					f383_local0 = f383_local0 + 1
				end
			end
			f383_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
			if Engine.IsCampaignModeZombies() and string.find( f383_local2, "_nightmares" ) == nil then
				f383_local2 = f383_local2 .. "_nightmares"
			end
			for f383_local3 = 1, f383_local0, 1 do
				local f383_local7 = Engine.GetModel( Engine.GetModelForController( f383_arg0 ), "CPMapsList." .. f383_local3 )
				local f383_local8 = Engine.GetModel( f383_local7, "rootMapName" )
				if f383_local8 and Engine.GetModelValue( f383_local8 ) == f383_local2 then
					return f383_local7
				end
			end
		end
	},
	CPMapsList = f0_local7( "CPMapsList", function ( f385_arg0 )
		local f385_local0 = {}
		local f385_local1 = 0
		local f385_local2 = Engine.IsCampaignModeZombies()
		if f385_local2 then
			f385_local2 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) ~= true
		end
		local f385_local3 = true
		for f385_local25, f385_local26 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f386_arg0, f386_arg1 )
			return CoD.mapsTable[f386_arg0].unique_id < CoD.mapsTable[f386_arg1].unique_id
		end, nil ) do
			local f385_local7
			if f385_local26.campaign_mode ~= Enum.CampaignMode.CAMPAIGNMODE_DEFAULT or f385_local2 then
				if f385_local26.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
					f385_local7 = f385_local2
				else
					f385_local7 = false
				end
			else
				f385_local7 = true
			end
			if f385_local25 == "cp_doa_bo3" then
				if Dvar.ui_doa_unlocked:get() and IsLive() then
					f385_local26.isSubLevel = false
				else
					f385_local26.isSubLevel = true
				end
			end
			if f385_local26.session_mode == Enum.eModes.MODE_CAMPAIGN and f385_local7 and f385_local26.dlc_pack ~= -1 and f385_local26.isSubLevel == false then
				local f385_local8, f385_local9 = f0_local11( f385_arg0, f385_local25 )
				local f385_local10, f385_local11 = f0_local9( f385_arg0, f385_local25 )
				local f385_local12 = Engine.GetPlayerStats( f385_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				local f385_local13 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true
				if f385_local13 then
					f385_local12 = Engine.StorageGetBuffer( f385_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
				end
				local f385_local14 = f385_local12.allMapsUnlocked:get()
				local f385_local15 = f385_local12.PlayerStatsByMap[f385_local25].hasBeenCompleted:get() == 1
				local f385_local16 = false
				f385_local1 = f385_local1 + 1
				local f385_local17 = 0
				local f385_local18 = CoD.DIFFICULTY_ICON[0]
				local f385_local19 = CoD.DIFFICULTY[0]
				if f385_local14 ~= 1 and not f385_local15 then
					f385_local3 = f385_local3
				end
				local f385_local20 = 0
				if f385_local12.PlayerStatsByMap[f385_local25] and not f385_local16 then
					local f385_local21 = nil
					for f385_local22 = 0, 4, 1 do
						if f385_local12.PlayerStatsByMap[f385_local25].completedDifficulties[f385_local22]:get() == 1 then
							f385_local21 = f385_local22
						end
					end
					if f385_local15 and f385_local21 and 0 <= f385_local21 then
						f385_local17 = 1
						f385_local18 = CoD.DIFFICULTY_ICON[f385_local21]
						f385_local19 = CoD.DIFFICULTY[f385_local21]
					end
					f385_local20 = f385_local12.PlayerStatsByMap[f385_local25].highestStats.SCORE:get()
				end
				local f385_local22 = f385_local15 and (f385_local12 and f385_local12.highestMapReached:get()) < f385_local1
				local f385_local23 = false
				if not f385_local13 then
					local f385_local24 = Engine.GetSavedMap()
					if f385_local24 then
						if LUI.startswith( f385_local24, "cp_sh" ) then
							f385_local24 = Engine.GetSavedMapQueuedMap()
						end
						if f385_local24 and f385_local24 == f385_local26.rootMapName then
							f385_local23 = true
						end
					end
				end
				local f385_local24 = f385_local20
				if not f385_local15 then
					f385_local24 = "--"
				end
				table.insert( f385_local0, {
					models = {
						displayText = Engine.Localize( f385_local26.mapNameCaps ),
						Image = f385_local26.previewImage,
						name = f385_local26.mapName,
						mapName = f385_local26.mapName,
						rootMapName = f385_local26.rootMapName,
						mapLocation = f385_local26.mapLocation,
						mapDescription = f385_local26.mapDescription,
						bestTime = 0,
						stat = f385_local24,
						bestScore = f385_local20,
						completedDifficultyAlpha = f385_local17,
						completedDifficulty = f385_local18,
						completedDifficultyText = f385_local19,
						classified = f385_local16,
						collectiblesFound = f385_local8,
						collectiblesTotal = f385_local9,
						accoladesTotal = f385_local11,
						accoladesFound = f385_local10,
						completedOutOfOrder = f385_local22,
						completed = f385_local15,
						isCurrentMap = f385_local23,
						unique_id = f385_local26.unique_id
					},
					properties = {
						mapId = f385_local25,
						classified = f385_local16
					}
				} )
			end
		end
		return f385_local0
	end
	 ),
	ZMMapsList = f0_local7( "ZMMapsList", function ( f387_arg0 )
		local f387_local0 = {}
		if CoD.perController[f387_arg0].choosingZMPlaylist then
			local f387_local1 = Engine.GetPlaylistCategories()
			local f387_local2 = CoD.PlaylistCategoryFilter or ""
			local f387_local3 = FindPlaylistCategory( f387_local1, Engine.ProfileInt( f387_arg0, "playlist_" .. f387_local2 ) )
			local f387_local4 = 0
			for f387_local8, f387_local9 in ipairs( f387_local1 ) do
				if f387_local9.filter == f387_local2 then
					f387_local4 = f387_local4 + f387_local9.playerCount
				end
			end
			f387_local5 = function ( f388_arg0 )
				local f388_local0 = ""
				if Engine.DvarBool( nil, "groupCountsVisible" ) == true then
					f388_local0 = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( f388_arg0.playerCount ), CoD.separateNumberWithCommas( f387_local4 ) )
				else
					f388_local0 = Engine.Localize( "MENU_CATEGORY_USER_PERCENT", math.floor( f388_arg0.playerCount / f387_local4 * 100 + 0.5 ) )
				end
				local f388_local1 = f388_arg0.playlists[1]
				local f388_local2 = true
				if f388_local1 then
					f388_local2 = Engine.IsPlaylistLocked( f387_arg0, f388_local1.index )
				end
				return {
					models = {
						displayText = Engine.ToUpper( f388_arg0.name ) or "",
						mapName = Engine.ToUpper( f388_arg0.name ) or "",
						Image = f388_arg0.icon or "playlist_standard",
						mapDescription = f388_arg0.description or "",
						playingCount = f388_local0
					},
					properties = {
						id = f388_arg0.ref,
						category = f388_arg0,
						playlist = f388_local1,
						selectIndex = f388_arg0 == f387_local3,
						disabled = f388_local2
					}
				}
			end
			
			for f387_local9, f387_local10 in ipairs( f387_local1 ) do
				if f387_local10.filter == f387_local2 then
					table.insert( f387_local0, f387_local5( f387_local10 ) )
				end
			end
		else
			for f387_local4, f387_local5 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f389_arg0, f389_arg1 )
				return CoD.mapsTable[f389_arg0].unique_id < CoD.mapsTable[f389_arg1].unique_id
			end, nil ) do
				if f387_local5.session_mode == Enum.eModes.MODE_ZOMBIES and f387_local5.dlc_pack ~= -1 and Engine.IsMapValid( f387_local4 ) then
					local f387_local6 = ""
					table.insert( f387_local0, {
						models = {
							displayText = Engine.Localize( f387_local5.mapNameCaps ),
							Image = f387_local5.previewImage,
							mapName = f387_local5.mapName,
							mapLocation = f387_local5.mapLocation,
							mapDescription = f387_local5.mapDescription,
							playingCount = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( 0 ), CoD.separateNumberWithCommas( 0 ) )
						},
						properties = {
							mapId = f387_local4
						}
					} )
				end
			end
		end
		return f387_local0
	end
	 ),
	CPVideoPlayerList = f0_local7( "CPVideoPlayerList", function ( f390_arg0 )
		local f390_local0 = {}
		local f390_local1 = function ( f391_arg0, f391_arg1 )
			return CoD.mapsTable[f391_arg0].unique_id < CoD.mapsTable[f391_arg1].unique_id
		end
		
		local f390_local2 = "cp_doa_bo3"
		local f390_local3 = "cp_codfu"
		for f390_local7, f390_local8 in LUI.IterateTableBySortedKeys( CoD.mapsTable, f390_local1, nil ) do
			if f390_local8.session_mode == Enum.eModes.MODE_CAMPAIGN and f390_local8.isSafeHouse == false and f390_local8.dlc_pack ~= -1 and f390_local8.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT and f390_local7 ~= f390_local2 and f390_local7 ~= f390_local3 and (Engine.GetDStat( f390_arg0, "PlayerStatsByMap", f390_local7, "hasBeenCompleted" ) == 1 or false ~= Dvar.allCollectiblesUnlocked:get()) then
				table.insert( f390_local0, {
					models = {
						displayText = Engine.Localize( f390_local8.mapNameCaps ),
						video = f390_local8.introMovie
					},
					properties = {}
				} )
			end
		end
		table.insert( f390_local0, {
			models = {
				displayText = Engine.Localize( "ZMUI_ZOD_CAPS" ),
				video = "zm_zod_load_zodloadingmovie"
			},
			properties = {}
		} )
		return f390_local0
	end
	 ),
	CPPublicGameSelectionList = f0_local7( "CPPublicGameSelectionList", function ( f392_arg0 )
		local f392_local0 = {}
		table.insert( f392_local0, {
			models = {
				displayText = "MENU_PLAY_ANY_MISSION_CAPS",
				Image = "t7_menu_cp_front_end_bo3",
				action = CPSelectPublicGame,
				param = "anyMission",
				mapInfoVis = 0,
				infoText = "MENU_PLAY_ANY_MISSION_DESC",
				playerCountText = "MENU_X_PLAYERS_PLAYING",
				playersPlaying = 0,
				type = "anyMission"
			}
		} )
		local f392_local1 = Engine.GetSavedMap()
		if f392_local1 and LUI.startswith( f392_local1, "cp_sh" ) then
			f392_local1 = Engine.GetSavedMapQueuedMap()
		end
		if not f392_local1 then
			f392_local1 = "cp_mi_eth_prologue"
			if Engine.IsCampaignModeZombies() then
				f392_local1 = "cp_mi_sing_sgen_nightmares"
			end
		end
		local f392_local2 = CoD.mapsTable[f392_local1]
		local f392_local3, f392_local4 = f0_local11( f392_arg0, f392_local1 )
		local f392_local5, f392_local6 = f0_local9( f392_arg0, f392_local1 )
		local f392_local7 = 0
		local f392_local8 = CoD.DIFFICULTY_ICON[0]
		local f392_local9 = CoD.DIFFICULTY[0]
		local f392_local10 = Engine.GetDStat( f392_arg0, "PlayerStatsByMap", f392_local1, "hasBeenCompleted" ) == 1
		local f392_local11 = Engine.GetDStat( f392_arg0, "PlayerStatsByMap", f392_local1, "lastCompletedDifficulty" )
		if f392_local10 and f392_local11 >= 0 then
			f392_local7 = 1
			f392_local8 = CoD.DIFFICULTY_ICON[f392_local11]
			f392_local9 = CoD.DIFFICULTY[f392_local11]
		end
		local f392_local12 = Engine.GetPlayerStats( f392_arg0 )
		local f392_local13 = f392_local12.PlayerStatsByMap[f392_local1].highestStats.SCORE:get()
		if f392_local2 then
			table.insert( f392_local0, {
				models = {
					displayText = "MENU_PLAY_CURRENT_MISSION_CAPS",
					Image = f392_local2.previewImage,
					mapName = f392_local2.mapName,
					mapLocation = f392_local2.mapLocation,
					mapDescription = f392_local2.mapDescription,
					bestTime = 0,
					bestScore = f392_local13,
					action = CPSelectPublicGame,
					param = "currMission",
					mapInfoVis = 1,
					infoText = "",
					playerCountText = "MENU_X_PLAYERS_PLAYING",
					collectiblesFound = f392_local3,
					collectiblesTotal = f392_local4,
					accoladesTotal = f392_local6,
					accoladesFound = f392_local5,
					playersPlaying = 0,
					type = "currentMission",
					completedDifficultyAlpha = f392_local7,
					completedDifficulty = f392_local8,
					completedDifficultyText = f392_local9
				}
			} )
		end
		table.insert( f392_local0, {
			models = {
				displayText = "MENU_PLAY_SPECIFIC_MISSION_CAPS",
				Image = "t7_menu_cp_front_end_bo3",
				action = CPSelectPublicGame,
				param = "specificMission",
				mapInfoVis = 0,
				infoText = "MENU_PLAY_SPECIFIC_MISSION_DESC",
				playerCountText = "",
				type = "specificMission"
			}
		} )
		return f392_local0
	end
	 ),
	CampaignSettings = {
		getModel = function ( f393_arg0 )
			local f393_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
			local f393_local1 = 1
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and f393_arg0 == Engine.GetPrimaryController() then
				f393_local1 = Engine.GetProfileVarInt( f393_arg0, "g_gameskill" )
			else
				local f393_local2 = Engine.GetModel( Engine.GetModelForController( f393_arg0 ), "serverDifficulty" )
				f393_local1 = f393_local2 and Engine.GetModelValue( f393_local2 )
			end
			if f393_local1 == nil then
				f393_local1 = 1
			end
			Engine.SetModelValue( Engine.CreateModel( f393_local0, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[f393_local1] ) )
			Engine.SetModelValue( Engine.CreateModel( f393_local0, "difficultyIcon" ), CoD.DIFFICULTY_ICON[f393_local1] )
			if Engine.GetModelValue( Engine.CreateModel( f393_local0, "selectedMap" ) ) == nil then
				Engine.SetModelValue( Engine.CreateModel( f393_local0, "selectedMap" ), "cp_mi_eth_prologue" )
			end
			return f393_local0
		end
	},
	ZMSettings = {
		getModel = function ( f394_arg0 )
			return Engine.CreateModel( Engine.GetGlobalModel(), "ZMSettings" )
		end
	},
	CampaignMissionList = {
		prepare = function ( f395_arg0, f395_arg1, f395_arg2 )
			f395_arg1.missionList = {}
			local f395_local0 = Engine.TableLookup( f395_arg0, CoD.protoMapsTable, 0, "mapCount", 1 )
			local f395_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "MissionLevels" )
			for f395_local2 = 1, f395_local0, 1 do
				local f395_local5 = f395_local2 - 1 .. ""
				local f395_local6 = Engine.TableLookup( f395_arg0, CoD.protoMapsTable, 3, f395_local5, 0 )
				local f395_local7 = Engine.TableLookup( f395_arg0, CoD.protoMapsTable, 3, f395_local5, 1 )
				local f395_local8 = Engine.TableLookup( f395_arg0, CoD.protoMapsTable, 3, f395_local5, 2 )
				local f395_local9 = Engine.TableLookup( f395_arg0, CoD.protoMapsTable, 3, f395_local5, 4 )
				local f395_local10 = Engine.CreateModel( f395_local1, f395_local5 )
				Engine.SetModelValue( Engine.CreateModel( f395_local10, "devName" ), f395_local6 .. "" )
				Engine.SetModelValue( Engine.CreateModel( f395_local10, "locName" ), f395_local7 .. "" )
				Engine.SetModelValue( Engine.CreateModel( f395_local10, "imagename" ), f395_local8 .. "" )
				Engine.SetModelValue( Engine.CreateModel( f395_local10, "desc" ), f395_local9 .. "" )
				table.insert( f395_arg1.missionList, f395_local10 )
			end
		end,
		getCount = function ( f396_arg0 )
			return #f396_arg0.missionList
		end,
		getItem = function ( f397_arg0, f397_arg1, f397_arg2 )
			return f397_arg1.missionList[f397_arg2]
		end
	},
	LocalServer = {
		prepare = function ( f398_arg0, f398_arg1, f398_arg2 )
			f398_arg1.baseModel = Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" )
			f398_arg1.countModel = Engine.GetModel( f398_arg1.baseModel, "count" )
			if f398_arg1.countSubscription then
				f398_arg1:removeSubscription( f398_arg1.countSubscription )
			end
			f398_arg1.countSubscription = f398_arg1:subscribeToModel( f398_arg1.countModel, function ()
				f0_local12( f398_arg0, f398_arg1 )
			end, false )
		end,
		getCount = function ( f400_arg0 )
			return Engine.GetModelValue( f400_arg0.countModel )
		end,
		getItem = function ( f401_arg0, f401_arg1, f401_arg2 )
			return Engine.GetModel( f401_arg1.baseModel, "server" .. f401_arg2 - 1 )
		end
	},
	LocalServerPlayer = {
		prepare = function ( f402_arg0, f402_arg1, f402_arg2 )
			f402_arg1.playerList = {}
			local f402_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" )
			f402_arg1.selectedServerModel = Engine.CreateModel( f402_local0, "selectedServer" )
			local f402_local1 = Engine.GetModelValue( f402_arg1.selectedServerModel )
			if f402_local1 ~= nil then
				f402_arg1.playerList = Engine.LobbyServerListGetClientList( f402_local1 )
				if f402_arg1.playerList ~= nil then
					for f402_local5, f402_local6 in pairs( f402_arg1.playerList ) do
						local f402_local7 = Engine.CreateModel( f402_local0, "playerModel_" .. f402_local5 )
						f402_arg1.playerList[f402_local5].model = f402_local7
						Engine.SetModelValue( Engine.CreateModel( f402_local7, "xuid" ), f402_local6.xuid )
						Engine.SetModelValue( Engine.CreateModel( f402_local7, "gamertag" ), f402_local6.gamertag )
						Engine.SetModelValue( Engine.CreateModel( f402_local7, "isLeader" ), f402_local6.isLeader )
					end
				else
					f402_arg1.playerList = {}
				end
			end
		end,
		getCustomPropertiesForItem = function ( f403_arg0, f403_arg1 )
			return f403_arg0.playerList[f403_arg1]
		end,
		getCount = function ( f404_arg0 )
			return #f404_arg0.playerList
		end,
		getItem = function ( f405_arg0, f405_arg1, f405_arg2 )
			return f405_arg1.playerList[f405_arg2].model
		end
	},
	XPProgressionBar = {
		getModel = function ( f406_arg0 )
			if not f406_arg0 then
				f406_arg0 = Engine.GetPrimaryController()
			end
			local f406_local0 = {
				currentStats = CoD.GetPlayerStats( f406_arg0 ),
				currentRank = f406_local0.currentStats.PlayerStatsList.RANK.StatValue:get(),
				displayLevelForCurrRank = Engine.TableLookup( f406_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f406_local0.currentRank, CoD.XPBar.RankDisplayLevelCol ),
				currPrestige = f406_local0.currentStats.PlayerStatsList.PLEVEL.StatValue:get(),
				currRankIconMaterialName = Engine.TableLookup( f406_arg0, CoD.rankIconTable, CoD.XPBar.RankIdCol, f406_local0.currentRank, f406_local0.currPrestige + 1 ),
				nextRank = f406_local0.currentRank + 1,
				displayLevelForNextRank = tonumber( f406_local0.displayLevelForCurrRank ) + 1,
				nextRankIconMaterialName = Engine.TableLookup( f406_arg0, CoD.rankIconTable, CoD.XPBar.RankIdCol, f406_local0.nextRank, f406_local0.currPrestige + 1 ),
				currRankXP = f406_local0.currentStats.PlayerStatsList.RANKXP.StatValue:get(),
				minXPForCurrRank = tonumber( Engine.TableLookup( f406_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f406_local0.currentRank, CoD.XPBar.RankTableColMinXP ) ),
				maxXPForCurrRank = tonumber( Engine.TableLookup( f406_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f406_local0.currentRank, CoD.XPBar.RankTableColMaxXP ) ),
				prestigeNext = CoD.PrestigeNext( f406_arg0 ),
				xpToNextRank = f406_local0.maxXPForCurrRank - f406_local0.currRankXP,
				relativeRankXP = f406_local0.currRankXP - f406_local0.minXPForCurrRank,
				progressPct = f406_local0.relativeRankXP / (f406_local0.maxXPForCurrRank - f406_local0.minXPForCurrRank)
			}
			local f406_local1 = Engine.CreateModel( Engine.GetModelForController( f406_arg0 ), "XPProgressionBar" )
			Engine.SetModelValue( Engine.CreateModel( f406_local1, "currentRank" ), f406_local0.displayLevelForCurrRank )
			Engine.SetModelValue( Engine.CreateModel( f406_local1, "currentRankIcon" ), f406_local0.currRankIconMaterialName )
			Engine.SetModelValue( Engine.CreateModel( f406_local1, "nextRank" ), f406_local0.displayLevelForNextRank )
			Engine.SetModelValue( Engine.CreateModel( f406_local1, "nextRankIcon" ), f406_local0.nextRankIconMaterialName )
			Engine.SetModelValue( Engine.CreateModel( f406_local1, "currentXP" ), f406_local0.currRankXP )
			Engine.SetModelValue( Engine.CreateModel( f406_local1, "xpToNextRank" ), f406_local0.xpToNextRank )
			Engine.SetModelValue( Engine.CreateModel( f406_local1, "progress" ), f406_local0.progressPct )
			return f406_local1
		end
	},
	CryptoKeyProgress = {
		getModel = function ( f407_arg0 )
			local f407_local0 = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f407_arg0 )
			local f407_local1 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f407_arg0 )
			local f407_local2 = Engine.CreateModel( Engine.GetModelForController( f407_arg0 ), "CryptoKeyProgress" )
			Engine.SetModelValue( Engine.CreateModel( f407_local2, "keyCount" ), f407_local0 )
			Engine.SetModelValue( Engine.CreateModel( f407_local2, "progress" ), f407_local1 )
			return f407_local2
		end
	},
	GadgetModList = {
		prepare = function ( f408_arg0, f408_arg1, f408_arg2 )
			
		end,
		getCount = function ( f409_arg0 )
			if f409_arg0.baseModel then
				local f409_local0 = Engine.GetModel( f409_arg0.baseModel, "gadgetAttachments.count" )
				if f409_local0 then
					return Engine.GetModelValue( f409_local0 )
				end
			end
			return 0
		end,
		getItem = function ( f410_arg0, f410_arg1, f410_arg2 )
			if f410_arg1.baseModel then
				local f410_local0 = Engine.GetModel( f410_arg1.baseModel, "gadgetAttachments." .. f410_arg2 )
				if f410_local0 then
					return f410_local0
				end
			end
			return nil
		end
	},
	Rewards = {
		prepare = function ( f411_arg0, f411_arg1, f411_arg2 )
			f411_arg1.rewardsList = {}
			local f411_local0 = Engine.CreateModel( Engine.GetModelForController( f411_arg0 ), "Rewards" )
			local f411_local1 = CoD.GetPlayerStats( f411_arg0 )
			if not f411_local1 then
				return 
			end
			f411_local1 = f411_local1.AfterActionReportStats
			local f411_local2 = -1
			local f411_local3 = Engine.GetSelfGamertag( f411_arg0 )
			for f411_local4 = 0, 3, 1 do
				if f411_local1.playerStats[f411_local4].name:get() == f411_local3 then
					f411_local2 = f411_local4
				end
			end
			if f411_local2 == -1 then
				return 
			end
			local f411_local4 = f411_local1.playerStats[f411_local2].curRank:get()
			local f411_local5 = f411_local1.playerStats[f411_local2].prvRank:get()
			local f411_local6 = {}
			local f411_local7 = 0
			if f411_local5 < f411_local4 then
				f411_local6[f411_local7] = {}
				f411_local6[f411_local7].itemName = "Promotion"
				f411_local6[f411_local7].itemImage = Engine.GetRankIcon( f411_local4 ) .. "_lrg"
				f411_local6[f411_local7].itemDesc = "Congratulations, you have been promoted!"
				f411_local6[f411_local7].itemDesc2 = ""
				f411_local7 = f411_local7 + 1
				f411_local6[f411_local7] = {}
				f411_local6[f411_local7].itemName = "Tech Spec - " .. tostring( f411_local4 - f411_local5 ) .. "X"
				f411_local6[f411_local7].itemImage = "t7_menu_tech_spec_token"
				f411_local6[f411_local7].itemDesc = "Unlock the weapon or gadget of your choice with this Tech spec."
				f411_local6[f411_local7].itemDesc2 = "Promotion award for reaching level " .. tostring( f411_local4 + 1 ) .. "."
				f411_local7 = f411_local7 + 1
				local f411_local8 = Engine.TableFindRows( CoD.statsTable, 10, tostring( f411_local4 + 1 ) )
				if f411_local8 ~= nil then
					local f411_local9 = 6
					local f411_local10 = 3
					local f411_local11 = f411_local8[1]
					local f411_local12 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.statsTable, f411_local11, f411_local10 ) )
					local f411_local13 = Engine.TableLookupGetColumnValueForRow( CoD.statsTable, f411_local11, f411_local9 )
					f411_local6[f411_local7] = {}
					f411_local6[f411_local7].itemName = f411_local12 .. " Blueprint"
					f411_local6[f411_local7].itemImage = f411_local13 .. "_big"
					f411_local6[f411_local7].itemDesc = "This weapon is now available for unlock the Armory."
					f411_local6[f411_local7].itemDesc2 = "Promotion award for reaching level " .. tostring( f411_local4 ) .. "."
					f411_local7 = f411_local7 + 1
				end
			end
			if f411_local1.matchWon:get() ~= 0 then
				f411_local6[f411_local7] = {}
				f411_local6[f411_local7].itemName = "Mod Spec"
				f411_local6[f411_local7].itemImage = "t7_menu_mod_spec_token"
				f411_local6[f411_local7].itemDesc = "Upgrade a weapon or gadget of your choice with this Mod Spec."
				f411_local6[f411_local7].itemDesc2 = "Awarded for completing your Mission."
				f411_local7 = f411_local7 + 1
				Engine.SetModelValue( Engine.CreateModel( f411_local0, "matchResult" ), Engine.Localize( "MENU_MISSION_SUCCESS_CAPS" ) )
			else
				Engine.SetModelValue( Engine.CreateModel( f411_local0, "matchResult" ), Engine.Localize( "MENU_MISSION_FAILED" ) )
			end
			local f411_local14 = #f411_local6
			for f411_local8 = 0, #f411_local6, 1 do
				local f411_local12 = f411_local6[f411_local8]
				if f411_local12 ~= nil then
					local f411_local13 = f411_local12.itemName .. ""
					local f411_local15 = f411_local12.itemImage .. ""
					local f411_local16 = f411_local12.itemDesc .. ""
					local f411_local17 = f411_local12.itemDesc2 .. ""
					local f411_local18 = Engine.CreateModel( f411_local0, f411_local8 )
					Engine.SetModelValue( Engine.CreateModel( f411_local18, "rewardName" ), f411_local13 )
					Engine.SetModelValue( Engine.CreateModel( f411_local18, "rewardImage" ), f411_local15 )
					Engine.SetModelValue( Engine.CreateModel( f411_local18, "rewardDesc1" ), f411_local16 )
					Engine.SetModelValue( Engine.CreateModel( f411_local18, "rewardDesc2" ), f411_local17 )
					table.insert( f411_arg1.rewardsList, f411_local18 )
				end
			end
		end,
		getCount = function ( f412_arg0 )
			return #f412_arg0.rewardsList
		end,
		getItem = function ( f413_arg0, f413_arg1, f413_arg2 )
			return f413_arg1.rewardsList[f413_arg2]
		end
	},
	AARStats = {
		prepare = function ( f414_arg0, f414_arg1, f414_arg2 )
			f414_arg1.AARStatsList = {}
			local f414_local0 = Engine.CreateModel( Engine.GetModelForController( f414_arg0 ), "AARStats" )
			local f414_local1 = CoD.GetPlayerStats( f414_arg0 )
			f414_local1 = f414_local1.AfterActionReportStats
			local f414_local2 = {}
			for f414_local3 = 0, Dvar.com_maxclients:get() - 1, 1 do
				if f414_local1.playerStats[f414_local3].isActive:get() == 1 then
					f414_local2[f414_local3] = {}
					f414_local2[f414_local3].name = f414_local1.playerStats[f414_local3].name:get()
					f414_local2[f414_local3].rank = f414_local1.playerStats[f414_local3].curRank:get() + 1
					f414_local2[f414_local3].rankIcon = Engine.GetRankIcon( f414_local1.playerStats[f414_local3].curRank:get() )
					f414_local2[f414_local3].kills = f414_local1.playerStats[f414_local3].kills:get()
					f414_local2[f414_local3].assists = f414_local1.playerStats[f414_local3].assists:get()
					f414_local2[f414_local3].medalName1 = ""
					f414_local2[f414_local3].medalImage1 = ""
					f414_local2[f414_local3].medalName2 = ""
					f414_local2[f414_local3].medalImage2 = ""
					f414_local2[f414_local3].medalName3 = ""
					f414_local2[f414_local3].medalImage3 = ""
					if f414_local1.playerStats[f414_local3].medals[0]:get() == f414_local3 then
						f414_local2[f414_local3].medalName1 = "Kill Master"
						f414_local2[f414_local3].medalImage1 = "hud_medals_default"
					end
					if f414_local1.playerStats[f414_local3].medals[1]:get() == f414_local3 then
						f414_local2[f414_local3].medalName2 = "Assist Master"
						f414_local2[f414_local3].medalImage2 = "hud_medals_revenge"
					end
					if f414_local1.playerStats[f414_local3].medals[2]:get() == f414_local3 then
						f414_local2[f414_local3].medalName3 = "Revive Master"
						f414_local2[f414_local3].medalImage3 = "hud_medals_afterlife"
					end
				end
			end
			for f414_local6, f414_local7 in pairs( f414_local2 ) do
				local f414_local8 = f414_local7.name .. ""
				local f414_local9 = f414_local7.rank .. ""
				local f414_local10 = f414_local7.rankIcon .. ""
				local f414_local11 = f414_local7.kills .. ""
				local f414_local12 = f414_local7.assists .. ""
				local f414_local13 = f414_local7.medalName1 .. ""
				local f414_local14 = f414_local7.medalImage1 .. ""
				local f414_local15 = f414_local7.medalName2 .. ""
				local f414_local16 = f414_local7.medalImage2 .. ""
				local f414_local17 = f414_local7.medalName3 .. ""
				local f414_local18 = f414_local7.medalImage3 .. ""
				local f414_local19 = Engine.CreateModel( f414_local0, f414_local6 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "playerName" ), f414_local8 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "playerRank" ), f414_local9 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "playerRankIcon" ), f414_local10 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "playerKills" ), f414_local11 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "playerAssists" ), f414_local12 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "medalName1" ), f414_local13 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "medalImage1" ), f414_local14 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "medalName2" ), f414_local15 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "medalImage2" ), f414_local16 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "medalName3" ), f414_local17 )
				Engine.SetModelValue( Engine.CreateModel( f414_local19, "medalImage3" ), f414_local18 )
				table.insert( f414_arg1.AARStatsList, f414_local19 )
			end
		end,
		getCount = function ( f415_arg0 )
			return #f415_arg0.AARStatsList
		end,
		getItem = function ( f416_arg0, f416_arg1, f416_arg2 )
			return f416_arg1.AARStatsList[f416_arg2]
		end
	},
	AARMedalsList = {
		prepare = function ( f417_arg0, f417_arg1, f417_arg2 )
			local f417_local0 = Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, Engine.GetCurrentGameType() .. " XP" )
			local f417_local1 = Engine.GetRecentMedals( f417_arg0, f417_local0 )
			f417_arg1.count = 0
			if f417_local1 and #f417_local1 > 0 then
				local f417_local2 = Engine.CreateModel( Engine.GetModelForController( f417_arg0 ), "aarMedalsList" )
				table.sort( f417_local1, CoD.AARUtility.SortMedals )
				for f417_local8, f417_local9 in ipairs( f417_local1 ) do
					local f417_local10 = Engine.CreateModel( f417_local2, f417_local8 .. "" )
					local f417_local11 = f417_local9.value
					local f417_local12 = f417_local9.row
					local f417_local7 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f417_local12, f417_local0 ) )
					Engine.SetModelValue( Engine.CreateModel( f417_local10, "medalIndex" ), f417_local12 )
					Engine.SetModelValue( Engine.CreateModel( f417_local10, "medalTimesObtained" ), f417_local11 )
					local f417_local6 = 1
					local f417_local13 = Engine.GetModel( Engine.GetModelForController( f417_arg0 ), "aarStats.xpScale" )
					if f417_local13 then
						f417_local6 = Engine.GetModelValue( f417_local13 )
					end
					f417_local7 = f417_local7 * f417_local6
					if f417_local11 > 1 then
						Engine.SetModelValue( Engine.CreateModel( f417_local10, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f417_local7 * tonumber( f417_local11 ) ) )
					else
						Engine.SetModelValue( Engine.CreateModel( f417_local10, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f417_local7 ) )
					end
				end
				if f417_local1 and #f417_local1 > 0 then
					f417_arg1.count = #f417_local1
				end
			end
		end,
		getCount = function ( f418_arg0 )
			return f418_arg0.count
		end,
		getItem = function ( f419_arg0, f419_arg1, f419_arg2 )
			return Engine.GetModel( Engine.GetModelForController( f419_arg0 ), "aarMedalsList" .. "." .. f419_arg2 )
		end
	},
	CombatRecordDeadliestCybercore = {
		getModel = function ( f420_arg0 )
			local f420_local0 = Engine.CreateModel( Engine.GetModelForController( f420_arg0 ), "CombatRecordDeadliestCybercore" )
			local f420_local1 = CoD.GetCombatRecordStats( f420_arg0 )
			local f420_local2 = 0
			local f420_local3 = 0
			local f420_local4 = 0
			local f420_local5 = 0
			local f420_local6 = Engine.Localize( "MENU_NONE" )
			for f420_local7 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f420_local7, CoD.GetCombatRecordMode() ) >= 0 then
					local f420_local10 = Engine.GetLoadoutSlotForItem( f420_local7, CoD.GetCombatRecordMode() )
					if f420_local10 == "cybercom_ability1" or f420_local10 == "cybercom_ability2" or f420_local10 == "cybercom_ability3" then
						local f420_local11 = CoD.GetCombatRecordStatForPath( f420_local1, "ItemStats." .. f420_local7 .. ".stats.kills" )
						local f420_local12 = CoD.GetCombatRecordStatForPath( f420_local1, "ItemStats." .. f420_local7 .. ".stats.assists" )
						local f420_local13 = f420_local11
						if f420_local11 < f420_local12 then
							f420_local13 = f420_local12
						end
						if f420_local2 < f420_local13 then
							f420_local2 = f420_local13
							f420_local3 = f420_local11
							f420_local4 = f420_local12
							f420_local5 = f420_local7
							f420_local6 = Engine.GetItemName( f420_local7, CoD.GetCombatRecordMode() )
						end
					end
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f420_local0, "itemIndex" ), f420_local5 )
			Engine.SetModelValue( Engine.CreateModel( f420_local0, "itemName" ), f420_local6 )
			if f420_local4 <= f420_local3 then
				Engine.SetModelValue( Engine.CreateModel( f420_local0, "numKills" ), f420_local3 )
			else
				Engine.SetModelValue( Engine.CreateModel( f420_local0, "numKills" ), f420_local4 )
			end
			return f420_local0
		end
	},
	CombatRecordBestScoreMap = {
		getModel = function ( f421_arg0 )
			local f421_local0 = Engine.CreateModel( Engine.GetModelForController( f421_arg0 ), "CombatRecordBestScoreMap" )
			local f421_local1 = CoD.GetCombatRecordStats( f421_arg0 )
			local f421_local2 = 0
			local f421_local3 = ""
			for f421_local8, f421_local9 in pairs( CoD.mapsTable ) do
				local f421_local10 = f421_local9.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
				if id == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
					f421_local9.isSubLevel = false
				end
				if f421_local9.session_mode == Enum.eModes.MODE_CAMPAIGN and f421_local10 and f421_local9.dlc_pack ~= -1 and f421_local9.isSubLevel == false then
					local f421_local7 = f421_local1.PlayerStatsByMap[f421_local8].highestStats.SCORE:get()
					if f421_local2 < f421_local7 then
						f421_local2 = f421_local7
						f421_local3 = f421_local8
					end
				end
			end
			if f421_local2 == 0 then
				f421_local2 = "--"
				f421_local3 = Engine.Localize( "MENU_NONE" )
			end
			Engine.SetModelValue( Engine.CreateModel( f421_local0, "highestScore" ), f421_local2 )
			Engine.SetModelValue( Engine.CreateModel( f421_local0, "mapName" ), f421_local3 )
			return f421_local0
		end
	},
	CombatRecordDeadliestEquipment = {
		getModel = function ( f422_arg0 )
			local f422_local0 = Engine.CreateModel( Engine.GetModelForController( f422_arg0 ), "CombatRecordDeadliestEquipment" )
			local f422_local1 = CoD.GetCombatRecordStats( f422_arg0 )
			local f422_local2 = 0
			local f422_local3 = 0
			local f422_local4 = Engine.Localize( "MENU_NONE" )
			for f422_local5 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f422_local5, CoD.GetCombatRecordMode() ) >= 0 and Engine.GetLoadoutSlotForItem( f422_local5, CoD.GetCombatRecordMode() ) == "primarygadget" then
					local f422_local8 = CoD.GetCombatRecordStatForPath( f422_local1, "ItemStats." .. f422_local5 .. ".stats.kills" )
					if f422_local2 < f422_local8 then
						f422_local2 = f422_local8
						f422_local3 = f422_local5
						f422_local4 = Engine.GetItemName( f422_local5, CoD.GetCombatRecordMode() )
					end
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f422_local0, "itemIndex" ), f422_local3 )
			Engine.SetModelValue( Engine.CreateModel( f422_local0, "numKills" ), f422_local2 )
			Engine.SetModelValue( Engine.CreateModel( f422_local0, "itemName" ), f422_local4 )
			return f422_local0
		end
	},
	CombatRecordDeadliestScorestreak = {
		getModel = function ( f423_arg0 )
			local f423_local0 = Engine.CreateModel( Engine.GetModelForController( f423_arg0 ), "CombatRecordDeadliestScorestreak" )
			local f423_local1 = CoD.GetCombatRecordStats( f423_arg0 )
			local f423_local2 = 0
			local f423_local3 = 0
			local f423_local4 = Engine.Localize( "MENU_NONE" )
			for f423_local5 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f423_local5, CoD.GetCombatRecordMode() ) >= 0 and Engine.GetItemGroup( f423_local5, CoD.GetCombatRecordMode() ) == "killstreak" then
					local f423_local8 = CoD.GetCombatRecordStatForPath( f423_local1, "ItemStats." .. f423_local5 .. ".stats.kills" )
					if f423_local2 < f423_local8 then
						f423_local2 = f423_local8
						f423_local3 = f423_local5
						f423_local4 = Engine.GetItemName( f423_local5, CoD.GetCombatRecordMode() )
					end
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f423_local0, "itemIndex" ), f423_local3 )
			Engine.SetModelValue( Engine.CreateModel( f423_local0, "numKills" ), f423_local2 )
			Engine.SetModelValue( Engine.CreateModel( f423_local0, "itemName" ), f423_local4 )
			return f423_local0
		end
	},
	CombatRecordDeadliestWeapon = {
		getModel = function ( f424_arg0 )
			local f424_local0 = Engine.CreateModel( Engine.GetModelForController( f424_arg0 ), "CombatRecordDeadliestWeapon" )
			local f424_local1 = CoD.GetCombatRecordStats( f424_arg0 )
			local f424_local2 = 0
			local f424_local3 = 0
			local f424_local4 = Engine.Localize( "MENU_NONE" )
			for f424_local5 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f424_local5, CoD.GetCombatRecordMode() ) >= 0 then
					local f424_local8 = Engine.GetLoadoutSlotForItem( f424_local5, CoD.GetCombatRecordMode() )
					if f424_local8 == "primary" or f424_local8 == "secondary" then
						local f424_local9 = CoD.GetCombatRecordStatForPath( f424_local1, "ItemStats." .. f424_local5 .. ".stats.kills" )
						if f424_local2 < f424_local9 then
							f424_local2 = f424_local9
							f424_local3 = f424_local5
							f424_local4 = Engine.GetItemName( f424_local5, CoD.GetCombatRecordMode() )
						end
					end
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f424_local0, "itemIndex" ), f424_local3 )
			Engine.SetModelValue( Engine.CreateModel( f424_local0, "numKills" ), f424_local2 )
			Engine.SetModelValue( Engine.CreateModel( f424_local0, "itemName" ), f424_local4 )
			return f424_local0
		end
	},
	CombatRecordMostUsedBubblegumBuff = {
		getModel = function ( f425_arg0 )
			local f425_local0 = Engine.CreateModel( Engine.GetModelForController( f425_arg0 ), "CombatRecordMostUsedBubblegumBuff" )
			local f425_local1 = CoD.GetCombatRecordStats( f425_arg0 )
			local f425_local2 = 0
			local f425_local3 = 0
			local f425_local4 = Engine.Localize( "MENU_NONE" )
			for f425_local5 = 0, 255, 1 do
				if Engine.GetLoadoutSlotForItem( f425_local5, CoD.GetCombatRecordMode() ) == "equippedbubblegumpack" then
					local f425_local8 = CoD.GetCombatRecordStatForPath( f425_local1, "ItemStats." .. f425_local5 .. ".stats.used" )
					if f425_local2 < f425_local8 then
						f425_local2 = f425_local8
						f425_local3 = f425_local5
						f425_local4 = Engine.GetItemName( f425_local5, CoD.GetCombatRecordMode() )
					end
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f425_local0, "itemIndex" ), f425_local3 )
			Engine.SetModelValue( Engine.CreateModel( f425_local0, "itemName" ), f425_local4 )
			Engine.SetModelValue( Engine.CreateModel( f425_local0, "numUsed" ), f425_local2 )
			return f425_local0
		end
	},
	CombatRecordZMHighestRound = {
		getModel = function ( f426_arg0 )
			local f426_local0 = Engine.CreateModel( Engine.GetModelForController( f426_arg0 ), "CombatRecordZMHighestRound" )
			local f426_local1 = CoD.GetCombatRecordStats( f426_arg0 )
			local f426_local2 = 0
			local f426_local3 = Engine.Localize( "MENU_NONE" )
			for f426_local8, f426_local9 in pairs( CoD.mapsTable ) do
				if f426_local9.session_mode == Enum.eModes.MODE_ZOMBIES and f426_local1.PlayerStatsByMap and f426_local1.PlayerStatsByMap[f426_local8] then
					local f426_local7 = f426_local1.PlayerStatsByMap[f426_local8].stats.HIGHEST_ROUND_REACHED.statValue:get()
					if f426_local2 < f426_local7 then
						f426_local2 = f426_local7
						f426_local3 = f426_local8
					end
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f426_local0, "highestRound" ), f426_local2 )
			Engine.SetModelValue( Engine.CreateModel( f426_local0, "mapName" ), f426_local3 )
			return f426_local0
		end
	},
	CombatRecordTotalAccoladesCompleted = {
		getModel = function ( f427_arg0 )
			local f427_local0 = Engine.CreateModel( Engine.GetModelForController( f427_arg0 ), "CombatRecordTotalAccoladesCompleted" )
			local f427_local1 = CoD.GetCombatRecordStats( f427_arg0 )
			local f427_local2 = 0
			for f427_local8, f427_local9 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f428_arg0, f428_arg1 )
				return CoD.mapsTable[f428_arg0].unique_id < CoD.mapsTable[f428_arg1].unique_id
			end, nil ) do
				local f427_local10 = f427_local9.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
				if f427_local8 == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
					f427_local9.isSubLevel = false
				end
				if f427_local9.session_mode == Enum.eModes.MODE_CAMPAIGN and f427_local10 and f427_local9.dlc_pack ~= -1 and f427_local9.isSubLevel == false then
					local f427_local6, f427_local7 = f0_local9( f427_arg0, f427_local8, true )
					f427_local2 = f427_local2 + f427_local6
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f427_local0, "accoladesCompleted" ), f427_local2 )
			return f427_local0
		end
	},
	CombatRecordTotalCollectiblesFound = {
		getModel = function ( f429_arg0 )
			local f429_local0 = Engine.CreateModel( Engine.GetModelForController( f429_arg0 ), "CombatRecordTotalCollectiblesFound" )
			local f429_local1 = CoD.GetCombatRecordStats( f429_arg0 )
			local f429_local2 = 0
			for f429_local8, f429_local9 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f430_arg0, f430_arg1 )
				return CoD.mapsTable[f430_arg0].unique_id < CoD.mapsTable[f430_arg1].unique_id
			end, nil ) do
				local f429_local10 = f429_local9.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
				if f429_local8 == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
					f429_local9.isSubLevel = false
				end
				if f429_local9.session_mode == Enum.eModes.MODE_CAMPAIGN and f429_local10 and f429_local9.dlc_pack ~= -1 and f429_local9.isSubLevel == false then
					local f429_local6, f429_local7 = f0_local11( f429_arg0, f429_local8, true )
					f429_local2 = f429_local2 + f429_local6
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f429_local0, "collectiblesFound" ), f429_local2 )
			return f429_local0
		end
	},
	CombatRecordCollectiblesList = {
		prepare = function ( f431_arg0, f431_arg1, f431_arg2 )
			f431_arg1.items = {}
			local f431_local0 = 0
			local f431_local1 = 0
			local f431_local2 = Engine.CreateModel( Engine.GetModelForController( f431_arg0 ), "CombatRecordCollectiblesList" )
			for f431_local10, f431_local11 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f432_arg0, f432_arg1 )
				return CoD.mapsTable[f432_arg0].unique_id < CoD.mapsTable[f432_arg1].unique_id
			end, nil ) do
				local f431_local12 = f431_local11.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
				if f431_local10 == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
					f431_local11.isSubLevel = false
				end
				if f431_local11.session_mode == Enum.eModes.MODE_CAMPAIGN and f431_local12 and f431_local11.dlc_pack ~= -1 and f431_local11.isSubLevel == false then
					f431_local0 = f431_local0 + 1
					local f431_local6, f431_local7 = f0_local11( f431_arg0, f431_local10, true )
					local f431_local8 = Engine.CreateModel( f431_local2, f431_local0 )
					local f431_local9 = CoD.GetCombatRecordStats( f431_arg0 )
					if f431_local9.PlayerStatsByMap[f431_local10].hasBeenCompleted:get() == 1 or f431_local6 > 0 then
						f431_local1 = f431_local1 + f431_local6
						Engine.SetModelValue( Engine.CreateModel( f431_local8, "name" ), f431_local11.mapName )
						Engine.SetModelValue( Engine.CreateModel( f431_local8, "stat" ), Engine.Localize( "MENU_LISTBOX_POS", f431_local6, f431_local7 ) )
						Engine.SetModelValue( Engine.CreateModel( f431_local8, "id" ), f431_local10 )
					else
						Engine.SetModelValue( Engine.CreateModel( f431_local8, "name" ), f431_local11.mapName )
						Engine.SetModelValue( Engine.CreateModel( f431_local8, "stat" ), "--" )
					end
					table.insert( f431_arg1.items, f431_local8 )
				end
			end
		end,
		getCount = function ( f433_arg0 )
			return #f433_arg0.items
		end,
		getItem = function ( f434_arg0, f434_arg1, f434_arg2 )
			return f434_arg1.items[f434_arg2]
		end
	},
	CombatRecordEquipmentList = {
		prepare = function ( f435_arg0, f435_arg1, f435_arg2 )
			f435_arg1.items = {}
			local f435_local0 = Engine.CreateModel( Engine.GetModelForController( f435_arg0 ), "CombatRecordEquipmentList" )
			local f435_local1 = CoD.GetCombatRecordStats( f435_arg0 )
			for f435_local2 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f435_local2, CoD.GetCombatRecordMode() ) >= 0 then
					local f435_local5 = Engine.GetLoadoutSlotForItem( f435_local2, CoD.GetCombatRecordMode() )
					if f435_local5 == "primarygadget" or f435_local5 == "secondarygadget" then
						local f435_local6 = Engine.CreateModel( f435_local0, f435_local2 )
						local f435_local7 = Engine.GetItemName( f435_local2, CoD.GetCombatRecordMode() )
						Engine.SetModelValue( Engine.CreateModel( f435_local6, "name" ), f435_local7 )
						local f435_local8, f435_local9, f435_local10 = nil
						if f435_local5 == "primarygadget" then
							f435_local9 = 1
							f435_local10 = "MENU_KILLS_CAPS"
							f435_local8 = CoD.GetCombatRecordStatForPath( f435_local1, "ItemStats." .. f435_local2 .. ".stats.kills" )
						else
							f435_local9 = 0
							f435_local10 = f435_local7 .. "_STAT_CAPS"
							f435_local8 = CoD.GetCombatRecordStatForPath( f435_local1, "ItemStats." .. f435_local2 .. ".stats.combatRecordStat" )
						end
						Engine.SetModelValue( Engine.CreateModel( f435_local6, "itemIndex" ), f435_local2 )
						Engine.SetModelValue( Engine.CreateModel( f435_local6, "stat" ), f435_local8 )
						Engine.SetModelValue( Engine.CreateModel( f435_local6, "lethalAlpha" ), f435_local9 )
						Engine.SetModelValue( Engine.CreateModel( f435_local6, "tacticalAlpha" ), 1 - f435_local9 )
						Engine.SetModelValue( Engine.CreateModel( f435_local6, "statLabel" ), f435_local10 )
						table.insert( f435_arg1.items, f435_local6 )
					end
				end
			end
			table.sort( f435_arg1.items, function ( f436_arg0, f436_arg1 )
				local f436_local0 = Engine.GetModelValue( Engine.GetModel( f436_arg0, "stat" ) )
				local f436_local1 = Engine.GetModelValue( Engine.GetModel( f436_arg1, "stat" ) )
				if f436_local0 == f436_local1 then
					return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f436_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f436_arg1, "name" ) ) )
				else
					return f436_local1 < f436_local0
				end
			end )
		end,
		getCount = function ( f437_arg0 )
			return #f437_arg0.items
		end,
		getItem = function ( f438_arg0, f438_arg1, f438_arg2 )
			return f438_arg1.items[f438_arg2]
		end
	},
	CombatRecordGameModeList = {
		prepare = function ( f439_arg0, f439_arg1, f439_arg2 )
			f439_arg1.items = {}
			local f439_local0 = Engine.CreateModel( Engine.GetModelForController( f439_arg0 ), "CombatRecordGameModeList" )
			local f439_local1 = CoD.GetCombatRecordStats( f439_arg0 )
			for f439_local8, f439_local9 in pairs( Engine.GetGametypesBase( CoD.GetCombatRecordMode() ) ) do
				if f439_local9.category == "standard" then
					local f439_local5 = Engine.CreateModel( f439_local0, f439_local8 )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "name" ), Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f439_local9.gametype, "name_ref" ) )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "image" ), Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f439_local9.gametype, "image" ) )
					local f439_local6 = CoD.GetCombatRecordStatForPath( f439_local1, "PlayerStatsByGameType." .. f439_local9.gametype .. ".LOSSES" )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "losses" ), f439_local6 )
					local f439_local7 = CoD.GetCombatRecordStatForPath( f439_local1, "PlayerStatsByGameType." .. f439_local9.gametype .. ".WINS" )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "stat" ), f439_local7 )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "wlRatio" ), CoD.GetDisplayRatioFromTwoStats( f439_local7, f439_local6 ) )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "lossRingFrac" ), f439_local6 / math.max( 1, f439_local6 + f439_local7 ) )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "streak" ), CoD.GetCombatRecordStatForPath( f439_local1, "PlayerStatsByGameType." .. f439_local9.gametype .. ".WIN_STREAK" ) )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "kdRatio" ), CoD.GetDisplayRatioFromTwoStats( CoD.GetCombatRecordStatForPath( f439_local1, "PlayerStatsByGameType." .. f439_local9.gametype .. ".KILLS" ), CoD.GetCombatRecordStatForPath( f439_local1, "PlayerStatsByGameType." .. f439_local9.gametype .. ".DEATHS" ) ) )
					Engine.SetModelValue( Engine.CreateModel( f439_local5, "spm" ), math.floor( CoD.GetCombatRecordStatForPath( f439_local1, "PlayerStatsByGameType." .. f439_local9.gametype .. ".SCORE" ) / math.max( 1, CoD.GetCombatRecordStatForPath( f439_local1, "PlayerStatsByGameType." .. f439_local9.gametype .. ".TIME_PLAYED_TOTAL" ) / 60 ) + 0.5 ) )
					table.insert( f439_arg1.items, f439_local5 )
				end
			end
			table.sort( f439_arg1.items, function ( f440_arg0, f440_arg1 )
				local f440_local0 = Engine.GetModelValue( Engine.GetModel( f440_arg0, "stat" ) )
				local f440_local1 = Engine.GetModelValue( Engine.GetModel( f440_arg1, "stat" ) )
				if f440_local0 == f440_local1 then
					return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f440_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f440_arg1, "name" ) ) )
				else
					return f440_local1 < f440_local0
				end
			end )
		end,
		getCount = function ( f441_arg0 )
			return #f441_arg0.items
		end,
		getItem = function ( f442_arg0, f442_arg1, f442_arg2 )
			return f442_arg1.items[f442_arg2]
		end
	},
	CombatRecordMostWonGameMode = {
		getModel = function ( f443_arg0 )
			local f443_local0 = Engine.CreateModel( Engine.GetModelForController( f443_arg0 ), "CombatRecordMostWonGameMode" )
			local f443_local1, f443_local2, f443_local3 = nil
			local f443_local4 = CoD.GetCombatRecordStats( f443_arg0 )
			for f443_local9, f443_local10 in pairs( Engine.GetGametypesBase( CoD.GetCombatRecordMode() ) ) do
				if f443_local10.category == "standard" then
					local f443_local8 = CoD.GetCombatRecordStatForPath( f443_local4, "PlayerStatsByGameType." .. f443_local10.gametype .. ".WINS" )
					if not f443_local1 or f443_local1 < f443_local8 then
						f443_local1 = f443_local8
						f443_local2 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f443_local10.gametype, "image" )
						f443_local3 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f443_local10.gametype, "name_ref" )
					end
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f443_local0, "image" ), f443_local2 )
			Engine.SetModelValue( Engine.CreateModel( f443_local0, "name" ), f443_local3 )
			Engine.SetModelValue( Engine.CreateModel( f443_local0, "wins" ), f443_local1 )
			return f443_local0
		end
	},
	CombatRecordMPMedal1 = {
		getModel = function ( f444_arg0 )
			local f444_local0 = Engine.CreateModel( Engine.GetModelForController( f444_arg0 ), "CombatRecordMedal1" )
			Engine.SetModelValue( Engine.CreateModel( f444_local0, "medalRef" ), "MEDAL_HEADSHOT" )
			local f444_local1 = Engine.StorageGetBuffer( f444_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			local f444_local2 = f444_local1.playerstatslist.medal_headshot.statvalue:get()
			if f444_local2 > 0 then
				local f444_local3 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, "MEDAL_HEADSHOT", 3 ) )
				if f444_local3 then
					Engine.SetModelValue( Engine.CreateModel( f444_local0, "backingLarge" ), f444_local3.backingLarge )
					Engine.SetModelValue( Engine.CreateModel( f444_local0, "iconLarge" ), f444_local3.iconLarge )
					Engine.SetModelValue( Engine.CreateModel( f444_local0, "value" ), f444_local2 )
				end
			else
				Engine.SetModelValue( Engine.CreateModel( f444_local0, "backingLarge" ), "uie_t7_hud_medal_backing_badassery_outline" )
				Engine.SetModelValue( Engine.CreateModel( f444_local0, "iconLarge" ), "$blank" )
				Engine.SetModelValue( Engine.CreateModel( f444_local0, "value" ), "--" )
			end
			return f444_local0
		end
	},
	CombatRecordMPMedal2 = {
		getModel = function ( f445_arg0 )
			local f445_local0 = Engine.CreateModel( Engine.GetModelForController( f445_arg0 ), "CombatRecordMedal2" )
			local f445_local1 = {
				"MEDAL_KILLSTREAK_MORE_THAN_30",
				"MEDAL_KILLSTREAK_30",
				"MEDAL_KILLSTREAK_25",
				"MEDAL_KILLSTREAK_20",
				"MEDAL_KILLSTREAK_15",
				"MEDAL_KILLSTREAK_10",
				"MEDAL_KILLSTREAK_5"
			}
			local f445_local2 = Engine.StorageGetBuffer( f445_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			local f445_local3, f445_local4, f445_local5, f445_local6 = nil
			for f445_local10, f445_local11 in ipairs( f445_local1 ) do
				local f445_local12 = f445_local2.playerstatslist[f445_local11].statvalue:get()
				if f445_local12 and f445_local12 > 0 then
					f445_local3 = f445_local11
					f445_local4 = f445_local12
					break
				end
			end
			if f445_local3 then
				f445_local8 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, f445_local3, 3 ) )
				Engine.SetModelValue( Engine.CreateModel( f445_local0, "medalRef" ), f445_local3 )
				Engine.SetModelValue( Engine.CreateModel( f445_local0, "value" ), f445_local4 )
				if f445_local8 then
					Engine.SetModelValue( Engine.CreateModel( f445_local0, "backingLarge" ), f445_local8.backingLarge )
					Engine.SetModelValue( Engine.CreateModel( f445_local0, "iconLarge" ), f445_local8.iconLarge )
				end
			else
				Engine.SetModelValue( Engine.CreateModel( f445_local0, "medalRef" ), "MENU_KILL_STREAKS" )
				Engine.SetModelValue( Engine.CreateModel( f445_local0, "value" ), "--" )
				Engine.SetModelValue( Engine.CreateModel( f445_local0, "backingLarge" ), "uie_t7_hud_medal_backing_killstreak_outline" )
				Engine.SetModelValue( Engine.CreateModel( f445_local0, "iconLarge" ), "$blank" )
			end
			return f445_local0
		end
	},
	CombatRecordMPMedal3 = {
		getModel = function ( f446_arg0 )
			local f446_local0 = Engine.CreateModel( Engine.GetModelForController( f446_arg0 ), "CombatRecordMedal3" )
			local f446_local1 = {
				"MEDAL_MULTIKILL_MORE_THAN_8",
				"MEDAL_MULTIKILL_8",
				"MEDAL_MULTIKILL_7",
				"MEDAL_MULTIKILL_6",
				"MEDAL_MULTIKILL_5",
				"MEDAL_MULTIKILL_4",
				"MEDAL_MULTIKILL_3",
				"MEDAL_MULTIKILL_2"
			}
			local f446_local2 = Engine.StorageGetBuffer( f446_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			local f446_local3, f446_local4, f446_local5, f446_local6 = nil
			for f446_local10, f446_local11 in ipairs( f446_local1 ) do
				local f446_local12 = f446_local2.playerstatslist[f446_local11].statvalue:get()
				if f446_local12 and f446_local12 > 0 then
					f446_local3 = f446_local11
					f446_local4 = f446_local12
					break
				end
			end
			if f446_local3 then
				f446_local8 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, f446_local3, 3 ) )
				Engine.SetModelValue( Engine.CreateModel( f446_local0, "medalRef" ), f446_local3 )
				Engine.SetModelValue( Engine.CreateModel( f446_local0, "value" ), f446_local4 )
				if f446_local8 then
					Engine.SetModelValue( Engine.CreateModel( f446_local0, "backingLarge" ), f446_local8.backingLarge )
					Engine.SetModelValue( Engine.CreateModel( f446_local0, "iconLarge" ), f446_local8.iconLarge )
				end
			else
				Engine.SetModelValue( Engine.CreateModel( f446_local0, "medalRef" ), "MENU_MULTI_KILLS" )
				Engine.SetModelValue( Engine.CreateModel( f446_local0, "value" ), "--" )
				Engine.SetModelValue( Engine.CreateModel( f446_local0, "backingLarge" ), "uie_t7_hud_medal_backing_multikill_outline" )
				Engine.SetModelValue( Engine.CreateModel( f446_local0, "iconLarge" ), "$blank" )
			end
			return f446_local0
		end
	},
	CombatRecordMPMedal4 = {
		getModel = function ( f447_arg0 )
			local f447_local0 = Engine.CreateModel( Engine.GetModelForController( f447_arg0 ), "CombatRecordMedal4" )
			local f447_local1 = {
				"MEDAL_ANNIHILATOR_MULTIKILL",
				"MEDAL_ARMBLADES_MULTIKILL",
				"MEDAL_BOWLAUNCHER_MULTIKILL",
				"MEDAL_FLAMETHROWER_MULTIKILL",
				"MEDAL_GELGUN_MULTIKILL",
				"MEDAL_GRAVITYSPIKES_MULTIKILL",
				"MEDAL_LIGHTNINGGUN_MULTIKILL",
				"MEDAL_MINIGUN_MULTIKILL",
				"MEDAL_PINEAPPLE_MULTIKILL"
			}
			local f447_local2 = Engine.StorageGetBuffer( f447_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			local f447_local3 = nil
			local f447_local4 = 0
			local f447_local5, f447_local6 = nil
			for f447_local10, f447_local11 in ipairs( f447_local1 ) do
				local f447_local12 = f447_local2.playerstatslist[f447_local11].statvalue:get()
				if f447_local12 and f447_local4 < f447_local12 then
					f447_local3 = f447_local11
					f447_local4 = f447_local12
				end
			end
			if f447_local3 then
				f447_local8 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, f447_local3, 3 ) )
				Engine.SetModelValue( Engine.CreateModel( f447_local0, "medalRef" ), f447_local3 )
				Engine.SetModelValue( Engine.CreateModel( f447_local0, "value" ), f447_local4 )
				if f447_local8 then
					Engine.SetModelValue( Engine.CreateModel( f447_local0, "backingLarge" ), f447_local8.backingLarge )
					Engine.SetModelValue( Engine.CreateModel( f447_local0, "iconLarge" ), f447_local8.iconLarge )
				end
			else
				Engine.SetModelValue( Engine.CreateModel( f447_local0, "medalRef" ), "MENU_SPECIALIST_WEAPON" )
				Engine.SetModelValue( Engine.CreateModel( f447_local0, "value" ), "--" )
				Engine.SetModelValue( Engine.CreateModel( f447_local0, "backingLarge" ), "uie_t7_hud_medal_backing_specialist_outline" )
				Engine.SetModelValue( Engine.CreateModel( f447_local0, "iconLarge" ), "$blank" )
			end
			return f447_local0
		end
	},
	CombatRecordMPMedal5 = {
		getModel = function ( f448_arg0 )
			local f448_local0 = Engine.CreateModel( Engine.GetModelForController( f448_arg0 ), "CombatRecordMedal5" )
			local f448_local1 = {
				"MEDAL_FLASHBACK_KILL",
				"MEDAL_FOCUS_EARN_MULTISCORESTREAK",
				"MEDAL_FOCUS_EARN_SCORESTREAK",
				"MEDAL_HEATWAVE_KILL",
				"MEDAL_KILL_ENEMY_WHILE_USING_PSYCHOSIS",
				"MEDAL_POWER_ARMOR_KILL",
				"MEDAL_OPTIC_CAMO_CAPTURE_OBJECTIVE",
				"MEDAL_OPTIC_CAMO_KILL",
				"MEDAL_RESURRRECT_KILL",
				"MEDAL_SPEED_BURST_KILL",
				"MEDAL_VISION_PULSE_KILL"
			}
			local f448_local2 = Engine.StorageGetBuffer( f448_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			local f448_local3 = nil
			local f448_local4 = 0
			local f448_local5, f448_local6 = nil
			for f448_local10, f448_local11 in ipairs( f448_local1 ) do
				local f448_local12 = f448_local2.playerstatslist[f448_local11].statvalue:get()
				if f448_local12 and f448_local4 < f448_local12 then
					f448_local3 = f448_local11
					f448_local4 = f448_local12
				end
			end
			if f448_local3 then
				f448_local8 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, f448_local3, 3 ) )
				Engine.SetModelValue( Engine.CreateModel( f448_local0, "medalRef" ), f448_local3 )
				Engine.SetModelValue( Engine.CreateModel( f448_local0, "value" ), f448_local4 )
				if f448_local8 then
					Engine.SetModelValue( Engine.CreateModel( f448_local0, "backingLarge" ), f448_local8.backingLarge )
					Engine.SetModelValue( Engine.CreateModel( f448_local0, "iconLarge" ), f448_local8.iconLarge )
				end
			else
				Engine.SetModelValue( Engine.CreateModel( f448_local0, "medalRef" ), "MENU_SPECIALIST_ABILITY" )
				Engine.SetModelValue( Engine.CreateModel( f448_local0, "value" ), "--" )
				Engine.SetModelValue( Engine.CreateModel( f448_local0, "backingLarge" ), "uie_t7_hud_medal_backing_specialist_outline" )
				Engine.SetModelValue( Engine.CreateModel( f448_local0, "iconLarge" ), "$blank" )
			end
			return f448_local0
		end
	},
	CombatRecordMPMedals = {
		prepare = function ( f449_arg0, f449_arg1, f449_arg2 )
			f449_arg1.items = {}
			local f449_local0 = Engine.CreateModel( Engine.GetModelForController( f449_arg0 ), "CombatRecordMPMedals" )
			local f449_local1 = Engine.StorageGetBuffer( f449_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			f449_local1 = f449_local1.PlayerStatsList
			local f449_local2 = Engine.GetTableRowCount( CoD.scoreInfoTableMP )
			local f449_local3 = 2
			local f449_local4 = 3
			local f449_local5 = 12
			local f449_local6 = 13
			for f449_local7 = 1, f449_local2, 1 do
				if Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, f449_local7 - 1, f449_local5 ) == CoD.CombatRecordMedalCategory then
					local f449_local10 = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, f449_local7 - 1, f449_local3 )
					local f449_local11 = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, f449_local7 - 1, f449_local4 )
					local f449_local12 = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, f449_local7 - 1, f449_local6 )
					if f449_local10 ~= "" then
						local f449_local13 = f449_local1[f449_local10].statValue:get()
						local f449_local14 = Engine.GetMedalInfo( f449_local11 )
						if f449_local13 > 0 then
							local f449_local15 = Engine.CreateModel( f449_local0, f449_local7 )
							Engine.SetModelValue( Engine.CreateModel( f449_local15, "name" ), f449_local10 )
							Engine.SetModelValue( Engine.CreateModel( f449_local15, "timesEarned" ), f449_local13 )
							Engine.SetModelValue( Engine.CreateModel( f449_local15, "iconLarge" ), f449_local14.iconLarge )
							Engine.SetModelValue( Engine.CreateModel( f449_local15, "backingLarge" ), f449_local14.backingLarge )
							Engine.SetModelValue( Engine.CreateModel( f449_local15, "sortKey" ), f449_local12 )
							table.insert( f449_arg1.items, f449_local15 )
						end
					end
				end
			end
			table.sort( f449_arg1.items, function ( f450_arg0, f450_arg1 )
				return Engine.GetModelValue( Engine.GetModel( f450_arg0, "sortKey" ) ) < Engine.GetModelValue( Engine.GetModel( f450_arg1, "sortKey" ) )
			end )
			return f449_local0
		end,
		getCount = function ( f451_arg0 )
			return #f451_arg0.items
		end,
		getItem = function ( f452_arg0, f452_arg1, f452_arg2 )
			return f452_arg1.items[f452_arg2]
		end
	},
	CombatRecordMPMedalTabs = f0_local7( "CombatRecordMPMedalTabs", function ( f453_arg0 )
		local f453_local0 = {}
		table.insert( f453_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f453_local0, {
			models = {
				tabName = "MENU_COMBAT_CAPS",
				tabIcon = ""
			},
			properties = {
				tabId = "combat"
			}
		} )
		table.insert( f453_local0, {
			models = {
				tabName = "MENU_SPECIALISTS_CAPS",
				tabIcon = ""
			},
			properties = {
				tabId = "specialist"
			}
		} )
		table.insert( f453_local0, {
			models = {
				tabName = "MENU_ANTISPECIALISTS_CAPS",
				tabIcon = ""
			},
			properties = {
				tabId = "antispecialist"
			}
		} )
		table.insert( f453_local0, {
			models = {
				tabName = "MENU_SCORESTREAKS_CAPS",
				tabIcon = ""
			},
			properties = {
				tabId = "scorestreak"
			}
		} )
		table.insert( f453_local0, {
			models = {
				tabName = "MENU_ANTISCORESTREAKS_CAPS",
				tabIcon = ""
			},
			properties = {
				tabId = "antiscorestreak"
			}
		} )
		table.insert( f453_local0, {
			models = {
				tabName = "MPUI_GAMEMODE_CAPS",
				tabIcon = ""
			},
			properties = {
				tabId = "gamemode"
			}
		} )
		table.insert( f453_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f453_local0
	end
	 ),
	CombatRecordMPTabs = f0_local7( "CombatRecordMPTabs", function ( f454_arg0 )
		local f454_local0 = {}
		table.insert( f454_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f454_local0, {
			models = {
				tabName = "MENU_COMBAT_RECORD_TAB_PUBLIC_CAPS",
				tabWidget = "CoD.CombatRecordPublicMatchPanel",
				tabIcon = ""
			},
			properties = {
				tabId = "public"
			}
		} )
		table.insert( f454_local0, {
			models = {
				tabName = "MENU_ARENA_CAPS",
				tabWidget = "CoD.CombatRecordArenaPanel",
				tabIcon = ""
			},
			properties = {
				tabId = "arena"
			}
		} )
		table.insert( f454_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f454_local0
	end
	 ),
	CombatRecordScorestreakList = {
		prepare = function ( f455_arg0, f455_arg1, f455_arg2 )
			f455_arg1.items = {}
			local f455_local0 = Engine.CreateModel( Engine.GetModelForController( f455_arg0 ), "CombatRecordScorestreakList" )
			local f455_local1 = CoD.GetCombatRecordStats( f455_arg0 )
			for f455_local2 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f455_local2, CoD.GetCombatRecordMode() ) >= 0 and Engine.GetItemGroup( f455_local2, CoD.GetCombatRecordMode() ) == "killstreak" then
					local f455_local5 = Engine.CreateModel( f455_local0, f455_local2 )
					Engine.SetModelValue( Engine.CreateModel( f455_local5, "name" ), Engine.GetItemName( f455_local2, CoD.GetCombatRecordMode() ) )
					local f455_local6 = "kills"
					if Engine.IsItemPassive( f455_local2, CoD.GetCombatRecordMode() ) then
						f455_local6 = "assists"
					end
					local f455_local7 = CoD.GetCombatRecordStatForPath( f455_local1, "ItemStats." .. f455_local2 .. ".stats." .. f455_local6 )
					Engine.SetModelValue( Engine.CreateModel( f455_local5, "itemIndex" ), f455_local2 )
					Engine.SetModelValue( Engine.CreateModel( f455_local5, "stat" ), f455_local7 )
					Engine.SetModelValue( Engine.CreateModel( f455_local5, "statName" ), Engine.Localize( "MENU_" .. f455_local6 .. "_CAPS" ) )
					Engine.SetModelValue( Engine.CreateModel( f455_local5, "statPerUseString" ), Engine.Localize( "MENU_" .. f455_local6 .. "_PER_USE_CAPS" ) )
					table.insert( f455_arg1.items, f455_local5 )
				end
			end
			table.sort( f455_arg1.items, function ( f456_arg0, f456_arg1 )
				local f456_local0 = Engine.GetModelValue( Engine.GetModel( f456_arg0, "stat" ) )
				local f456_local1 = Engine.GetModelValue( Engine.GetModel( f456_arg1, "stat" ) )
				if f456_local0 == f456_local1 then
					return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f456_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f456_arg1, "name" ) ) )
				else
					return f456_local1 < f456_local0
				end
			end )
		end,
		getCount = function ( f457_arg0 )
			return #f457_arg0.items
		end,
		getItem = function ( f458_arg0, f458_arg1, f458_arg2 )
			return f458_arg1.items[f458_arg2]
		end
	},
	CombatRecordCybercoreList = {
		prepare = function ( f459_arg0, f459_arg1, f459_arg2 )
			CoD.UnlockablesTable = CoD.GetUnlockablesTable( f459_arg0, nil, CoD.GetCombatRecordMode() )
			f459_arg1.items = {}
			local f459_local0 = Engine.CreateModel( Engine.GetModelForController( f459_arg0 ), "CombatRecordCybercoreList" )
			local f459_local1 = CoD.GetCombatRecordStats( f459_arg0 )
			for f459_local11, f459_local12 in ipairs( CoD.UnlockablesTable.cybercom_abilities ) do
				local f459_local13 = Engine.GetModelValue( Engine.GetModel( f459_local12, "ref" ) )
				local f459_local5 = false
				if LUI.endswith( f459_local13, "_pro" ) then
					f459_local5 = true
				end
				if not f459_local5 then
					local f459_local6 = Engine.GetModelValue( Engine.GetModel( f459_local12, "itemIndex" ) )
					local f459_local7 = Engine.CreateModel( f459_local0, f459_local6 )
					Engine.SetModelValue( Engine.CreateModel( f459_local7, "name" ), Engine.GetItemName( f459_local6, CoD.GetCombatRecordMode() ) )
					local f459_local8 = CoD.GetCombatRecordStatForPath( f459_local1, "ItemStats." .. f459_local6 .. ".stats.kills" )
					local f459_local9 = CoD.GetCombatRecordStatForPath( f459_local1, "ItemStats." .. f459_local6 .. ".stats.assists" )
					local f459_local10 = CoD.GetCombatRecordStatForPath( f459_local1, "ItemStats." .. f459_local6 .. ".stats.used" )
					Engine.SetModelValue( Engine.CreateModel( f459_local7, "cybercoreName" ), Engine.GetItemName( f459_local6, CoD.GetCombatRecordMode() ) )
					Engine.SetModelValue( Engine.CreateModel( f459_local7, "cybercoreIndex" ), f459_local6 )
					if f459_local8 < f459_local9 then
						Engine.SetModelValue( Engine.CreateModel( f459_local7, "stat" ), "*" .. f459_local9 )
						Engine.SetModelValue( Engine.CreateModel( f459_local7, "killsPerUse" ), "*" .. CoD.GetDisplayRatioFromTwoStats( f459_local9, f459_local10 ) )
					else
						Engine.SetModelValue( Engine.CreateModel( f459_local7, "stat" ), f459_local8 )
						Engine.SetModelValue( Engine.CreateModel( f459_local7, "killsPerUse" ), CoD.GetDisplayRatioFromTwoStats( f459_local8, f459_local10 ) )
					end
					table.insert( f459_arg1.items, f459_local7 )
				end
			end
			table.sort( f459_arg1.items, function ( f460_arg0, f460_arg1 )
				local f460_local0 = Engine.GetModelValue( Engine.GetModel( f460_arg0, "stat" ) )
				local f460_local1 = Engine.GetModelValue( Engine.GetModel( f460_arg1, "stat" ) )
				if type( f460_local0 ) == "string" and LUI.startswith( f460_local0, "*" ) then
					f460_local0 = tonumber( string.sub( f460_local0, 2 ) )
				end
				if type( f460_local1 ) == "string" and LUI.startswith( f460_local1, "*" ) then
					f460_local1 = tonumber( string.sub( f460_local1, 2 ) )
				end
				if f460_local0 == f460_local1 then
					return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f460_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f460_arg1, "name" ) ) )
				else
					return f460_local1 < f460_local0
				end
			end )
		end,
		getCount = function ( f461_arg0 )
			return #f461_arg0.items
		end,
		getItem = function ( f462_arg0, f462_arg1, f462_arg2 )
			return f462_arg1.items[f462_arg2]
		end
	},
	CombatRecordSpecialistList = {
		prepare = function ( f463_arg0, f463_arg1, f463_arg2 )
			f463_arg1.items = {}
			local f463_local0 = Engine.CreateModel( Engine.GetModelForController( f463_arg0 ), "CombatRecordSpecialistList" )
			local f463_local1 = CoD.GetCombatRecordStats( f463_arg0 )
			for f463_local11, f463_local12 in ipairs( Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER ) ) do
				if f463_local12.disabled ~= true then
					local f463_local5 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f463_local11 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					local f463_local6 = Engine.CreateModel( f463_local0, f463_local5 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "name" ), Engine.GetItemName( f463_local5, CoD.GetCombatRecordMode() ) )
					local f463_local7 = CoD.GetCombatRecordStatForPath( f463_local1, "ItemStats." .. f463_local5 .. ".stats.kills" )
					local f463_local8 = CombatRecordGetTwoStatRatioForItemIndex( f463_arg0, "kills", "used", f463_local5 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "heroIndex" ), f463_local11 - 1 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "heroName" ), f463_local12.displayName )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "itemIndex" ), f463_local5 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "killsPerUse" ), f463_local8 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "stat" ), f463_local7 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "statDesc" ), "" )
					table.insert( f463_arg1.items, f463_local6 )
					local f463_local9 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f463_local11 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					f463_local6 = Engine.CreateModel( f463_local0, f463_local9 )
					local f463_local10 = Engine.GetItemName( f463_local9, CoD.GetCombatRecordMode() )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "name" ), f463_local10 )
					f463_local7 = CoD.GetCombatRecordStatForPath( f463_local1, "ItemStats." .. f463_local9 .. ".stats.combatRecordStat" )
					f463_local8 = CombatRecordGetTwoStatRatioForItemIndex( f463_arg0, "combatRecordStat", "used", f463_local9 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "heroIndex" ), f463_local11 - 1 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "heroName" ), f463_local12.displayName )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "itemIndex" ), f463_local9 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "killsPerUse" ), f463_local8 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "stat" ), f463_local7 )
					Engine.SetModelValue( Engine.CreateModel( f463_local6, "statDesc" ), f463_local10 .. "_KILLS_DESC" )
					table.insert( f463_arg1.items, f463_local6 )
				end
			end
			table.sort( f463_arg1.items, function ( f464_arg0, f464_arg1 )
				local f464_local0 = Engine.GetModelValue( Engine.GetModel( f464_arg0, "stat" ) )
				local f464_local1 = Engine.GetModelValue( Engine.GetModel( f464_arg1, "stat" ) )
				if f464_local0 == f464_local1 then
					return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f464_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f464_arg1, "name" ) ) )
				else
					return f464_local1 < f464_local0
				end
			end )
		end,
		getCount = function ( f465_arg0 )
			return #f465_arg0.items
		end,
		getItem = function ( f466_arg0, f466_arg1, f466_arg2 )
			return f466_arg1.items[f466_arg2]
		end
	},
	CombatRecordWeaponsList = {
		prepare = function ( f467_arg0, f467_arg1, f467_arg2 )
			f467_arg1.weapons = {}
			local f467_local0 = Engine.CreateModel( Engine.GetModelForController( f467_arg0 ), "CombatRecordWeaponsList" )
			local f467_local1 = CoD.GetCombatRecordStats( f467_arg0 )
			for f467_local2 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f467_local2, CoD.GetCombatRecordMode() ) >= 0 then
					local f467_local5 = Engine.GetLoadoutSlotForItem( f467_local2, CoD.GetCombatRecordMode() )
					if f467_local5 == "primary" or f467_local5 == "secondary" then
						local f467_local6 = Engine.CreateModel( f467_local0, f467_local2 )
						Engine.SetModelValue( Engine.CreateModel( f467_local6, "name" ), Engine.GetItemName( f467_local2, CoD.GetCombatRecordMode() ) )
						local f467_local7 = CoD.GetCombatRecordStatForPath( f467_local1, "ItemStats." .. f467_local2 .. ".stats.kills" )
						Engine.SetModelValue( Engine.CreateModel( f467_local6, "itemIndex" ), f467_local2 )
						Engine.SetModelValue( Engine.CreateModel( f467_local6, "stat" ), f467_local7 )
						table.insert( f467_arg1.weapons, f467_local6 )
					end
				end
			end
			table.sort( f467_arg1.weapons, function ( f468_arg0, f468_arg1 )
				local f468_local0 = Engine.GetModelValue( Engine.GetModel( f468_arg0, "stat" ) )
				local f468_local1 = Engine.GetModelValue( Engine.GetModel( f468_arg1, "stat" ) )
				if f468_local0 == f468_local1 then
					return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f468_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f468_arg1, "name" ) ) )
				else
					return f468_local1 < f468_local0
				end
			end )
		end,
		getCount = function ( f469_arg0 )
			return #f469_arg0.weapons
		end,
		getItem = function ( f470_arg0, f470_arg1, f470_arg2 )
			return f470_arg1.weapons[f470_arg2]
		end
	},
	CombatRecordBGBList = {
		prepare = function ( f471_arg0, f471_arg1, f471_arg2 )
			f471_arg1.bubbleGumBuffs = {}
			local f471_local0 = Engine.CreateModel( Engine.GetModelForController( f471_arg0 ), "combatRecordBGBListModel" )
			local f471_local1 = CoD.GetCombatRecordStats( f471_arg0 )
			for f471_local2 = 0, 255, 1 do
				if Engine.GetLoadoutSlotForItem( f471_local2, CoD.GetCombatRecordMode() ) == "equippedbubblegumpack" then
					local f471_local5 = Engine.CreateModel( f471_local0, f471_local2 )
					Engine.SetModelValue( Engine.CreateModel( f471_local5, "name" ), Engine.GetItemName( f471_local2, CoD.GetCombatRecordMode() ) )
					local f471_local6 = CoD.GetCombatRecordStatForPath( f471_local1, "ItemStats." .. f471_local2 .. ".stats.used" )
					Engine.SetModelValue( Engine.CreateModel( f471_local5, "itemIndex" ), f471_local2 )
					Engine.SetModelValue( Engine.CreateModel( f471_local5, "stat" ), f471_local6 )
					table.insert( f471_arg1.bubbleGumBuffs, f471_local5 )
				end
			end
			table.sort( f471_arg1.bubbleGumBuffs, function ( f472_arg0, f472_arg1 )
				local f472_local0 = Engine.GetModelValue( Engine.GetModel( f472_arg0, "stat" ) )
				local f472_local1 = Engine.GetModelValue( Engine.GetModel( f472_arg1, "stat" ) )
				if f472_local0 == f472_local1 then
					return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f472_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f472_arg1, "name" ) ) )
				else
					return f472_local1 < f472_local0
				end
			end )
		end,
		getCount = function ( f473_arg0 )
			return #f473_arg0.bubbleGumBuffs
		end,
		getItem = function ( f474_arg0, f474_arg1, f474_arg2 )
			return f474_arg1.bubbleGumBuffs[f474_arg2]
		end
	},
	CombatRecordZMMapsList = {
		prepare = function ( f475_arg0, f475_arg1, f475_arg2 )
			f475_arg1.maps = {}
			local f475_local0 = Engine.CreateModel( Engine.GetModelForController( f475_arg0 ), "CombatRecordZMMapsList" )
			local f475_local1 = CoD.GetCombatRecordStats( f475_arg0 )
			for f475_local11, f475_local12 in pairs( CoD.mapsTable ) do
				if f475_local12.session_mode == Enum.eModes.MODE_ZOMBIES and f475_local1.PlayerStatsByMap and f475_local1.PlayerStatsByMap[f475_local11] then
					local f475_local5 = f475_local1.PlayerStatsByMap[f475_local11]
					local f475_local6 = Engine.CreateModel( f475_local0, f475_local11 )
					local f475_local7 = 0
					local f475_local8 = 0
					local f475_local9 = 0
					local f475_local10 = 0
					f475_local7 = f475_local5.stats.HIGHEST_ROUND_REACHED.statValue:get()
					f475_local8 = f475_local5.stats.TOTAL_ROUNDS_SURVIVED.statValue:get()
					f475_local9 = f475_local5.stats.TOTAL_GAMES_PLAYED.statValue:get()
					f475_local10 = f475_local5.stats.TOTAL_DOWNS.statValue:get()
					Engine.SetModelValue( Engine.CreateModel( f475_local6, "name" ), MapNameToLocalizedMapName( f475_local11 ) )
					Engine.SetModelValue( Engine.CreateModel( f475_local6, "highestRound" ), f475_local7 )
					Engine.SetModelValue( Engine.CreateModel( f475_local6, "avgDowns" ), math.floor( f475_local10 / math.max( 1, f475_local9 ) + 0.5 ) )
					Engine.SetModelValue( Engine.CreateModel( f475_local6, "avgRounds" ), math.floor( f475_local8 / math.max( 1, f475_local9 ) + 0.5 ) )
					Engine.SetModelValue( Engine.CreateModel( f475_local6, "stat" ), f475_local7 )
					Engine.SetModelValue( Engine.CreateModel( f475_local6, "previewImage" ), f475_local12.previewImage )
					table.insert( f475_arg1.maps, f475_local6 )
				end
			end
			table.sort( f475_arg1.maps, function ( f476_arg0, f476_arg1 )
				return Engine.GetModelValue( Engine.GetModel( f476_arg1, "stat" ) ) < Engine.GetModelValue( Engine.GetModel( f476_arg0, "stat" ) )
			end )
		end,
		getCount = function ( f477_arg0 )
			return #f477_arg0.maps
		end,
		getItem = function ( f478_arg0, f478_arg1, f478_arg2 )
			return f478_arg1.maps[f478_arg2]
		end
	},
	CombatRecordCPPercentComplete = {
		getModel = function ( f479_arg0 )
			local f479_local0 = Engine.CreateModel( Engine.GetModelForController( f479_arg0 ), "CombatRecordCPPercentComplete" )
			local f479_local1 = 35
			local f479_local2 = 15
			local f479_local3 = 8
			local f479_local4 = 10
			local f479_local5 = 10
			local f479_local6 = 10
			local f479_local7 = 10
			local f479_local8 = 2
			local f479_local9 = 0
			local f479_local10 = 0
			local f479_local11 = 0
			local f479_local12 = 0
			local f479_local13 = 0
			local f479_local14 = 0
			local f479_local15 = 0
			local f479_local16 = 0
			local f479_local17 = 0
			local f479_local18 = 0
			local f479_local19 = 0
			local f479_local20 = 0
			local f479_local21 = 0
			local f479_local22 = 0
			local f479_local23 = 0
			local f479_local24 = 0
			local f479_local25 = 9
			local f479_local26 = 0
			local f479_local27 = 0
			local f479_local28 = function ( f480_arg0, f480_arg1 )
				return CoD.mapsTable[f480_arg0].unique_id < CoD.mapsTable[f480_arg1].unique_id
			end
			
			local f479_local29 = Enum.eModes.MODE_CAMPAIGN
			local f479_local30 = Engine.GetPlayerStats( f479_arg0, CoD.STATS_LOCATION_NORMAL, f479_local29 )
			local f479_local31 = Engine.GetPlayerStatsNightmare( f479_arg0 )
			for f479_local40, f479_local41 in LUI.IterateTableBySortedKeys( CoD.mapsTable, f479_local28, nil ) do
				if f479_local41.session_mode == f479_local29 and f479_local40 ~= "cp_doa_bo3" and f479_local41.dlc_pack ~= -1 and f479_local41.isSubLevel == false then
					if f479_local41.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT then
						local f479_local35 = f479_local30.PlayerStatsByMap[f479_local41.rootMapName].hasBeenCompleted:get() ~= 0
						f479_local10 = f479_local10 + 1
						if f479_local35 then
							f479_local9 = f479_local9 + 1
						end
						local f479_local36, f479_local37 = f0_local9( f479_arg0, f479_local40, true )
						f479_local11 = f479_local11 + f479_local36
						f479_local12 = f479_local12 + f479_local37
						local f479_local38, f479_local39 = f0_local11( f479_arg0, f479_local40, true )
						f479_local13 = f479_local13 + f479_local38
						f479_local14 = f479_local14 + f479_local39
					end
					if f479_local41.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
						local f479_local35 = f479_local31.PlayerStatsByMap[f479_local41.rootMapName].hasBeenCompleted:get() ~= 0
						f479_local27 = f479_local27 + 1
						if f479_local35 then
							f479_local26 = f479_local26 + 1
						end
					end
				end
			end
			for f479_local32 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f479_local32, f479_local29 ) >= 0 then
					f479_local41 = Engine.GetLoadoutSlotForItem( f479_local32, f479_local29 )
					local f479_local35 = Engine.GetItemGroup( f479_local32, f479_local29 )
					if f479_local41 == "primary" or f479_local41 == "secondary" or f479_local41 == "primarygadget" or f479_local41 == "secondarygadget" then
						f479_local16 = f479_local16 + 1
						if Engine.IsItemPurchased( f479_arg0, f479_local32, f479_local29 ) then
							f479_local15 = f479_local15 + 1
						end
					end
					if f479_local35 == "cybercom_abilities" or f479_local35 == "cybercom_tacrig" then
						f479_local18 = f479_local18 + 1
						if Engine.IsItemPurchased( f479_arg0, f479_local32, f479_local29 ) then
							f479_local17 = f479_local17 + 1
						end
					end
				end
			end
			f479_local32 = Engine.GetChallengeInfoForImages( f479_arg0, challengeCategory, gameModeIndex )
			if f479_local32 then
				for f479_local41, f479_local35 in ipairs( f479_local32 ) do
					f479_local20 = f479_local20 + 1
					if not f479_local35.isLocked then
						f479_local19 = f479_local19 + 1
					end
				end
			end
			f479_local22 = 12
			for f479_local33 = 0, f479_local22 - 1, 1 do
				if f479_local30.PlayerCPDecorations[f479_local33]:get() ~= 0 then
					f479_local21 = f479_local21 + 1
				end
			end
			f479_local24 = 3
			for f479_local33 = 1, f479_local24, 1 do
				if f479_local30.trainingSimStats.ranksAchieved[f479_local33]:get() ~= 0 then
					f479_local23 = f479_local23 + 1
				end
			end
			f479_local33 = 0
			if f479_local9 > 0 then
				f479_local33 = f479_local33 + LUI.clamp( f479_local9 / f479_local10, 0, 1 ) * f479_local1 + LUI.clamp( f479_local11 / f479_local12, 0, 1 ) * f479_local2 + LUI.clamp( f479_local13 / f479_local14, 0, 1 ) * f479_local3 + LUI.clamp( f479_local15 / f479_local16, 0, 1 ) * f479_local4 + LUI.clamp( f479_local17 / f479_local18, 0, 1 ) * f479_local5 + LUI.clamp( f479_local19 / f479_local20, 0, 1 ) * f479_local6 + LUI.clamp( f479_local21 / f479_local22, 0, 1 ) * f479_local7
			end
			if f479_local33 > 99.99 then
				f479_local33 = f479_local33 + LUI.clamp( f479_local26 / f479_local27, 0, 1 ) * f479_local25
			end
			if f479_local33 ~= f479_local33 then
				Engine.SetModelValue( Engine.CreateModel( f479_local0, "percent" ), "-" )
			else
				Engine.SetModelValue( Engine.CreateModel( f479_local0, "percent" ), string.format( "%.1f%%", f479_local33 ) )
			end
			return f479_local0
		end
	},
	CombatRecordTotalWeaponAccuracy = {
		getModel = function ( f481_arg0 )
			local f481_local0 = Engine.CreateModel( Engine.GetModelForController( f481_arg0 ), "CombatRecordTotalWeaponAccuracy" )
			local f481_local1 = 0
			local f481_local2 = 0
			local f481_local3 = CoD.GetCombatRecordStats( f481_arg0 )
			for f481_local4 = 0, 255, 1 do
				if Engine.GetItemAllocationCost( f481_local4, CoD.GetCombatRecordMode() ) >= 0 then
					local f481_local7 = Engine.GetLoadoutSlotForItem( f481_local4, CoD.GetCombatRecordMode() )
					if f481_local7 == "primary" or f481_local7 == "secondary" or f481_local7 == "heroweapon" then
						f481_local1 = f481_local1 + CoD.GetCombatRecordStatForPath( f481_local3, "ItemStats." .. f481_local4 .. ".stats.shots" )
						f481_local2 = f481_local2 + CoD.GetCombatRecordStatForPath( f481_local3, "ItemStats." .. f481_local4 .. ".stats.hits" ) + 0.5 * CoD.GetCombatRecordStatForPath( f481_local3, "ItemStats." .. f481_local4 .. ".stats.headshots" )
					end
				end
			end
			local f481_local4 = 0
			if f481_local2 > 0 then
				f481_local4 = 100
			end
			if f481_local1 > 0 then
				f481_local4 = LUI.clamp( f481_local2 / f481_local1 * 100, 0, 100 )
			end
			if f481_local4 ~= f481_local4 then
				Engine.SetModelValue( Engine.CreateModel( f481_local0, "percent" ), "-" )
			else
				Engine.SetModelValue( Engine.CreateModel( f481_local0, "percent" ), string.format( "%.1f%%", f481_local4 ) )
			end
			return f481_local0
		end
	},
	FavoriteSpecialist = {
		getModel = function ( f482_arg0 )
			local f482_local0 = Engine.CreateModel( Engine.GetModelForController( f482_arg0 ), "FavoriteSpecialist" )
			local f482_local1 = CoD.GetCombatRecordStats( f482_arg0 )
			local f482_local2 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
			local f482_local3, f482_local4, f482_local5, f482_local6 = nil
			local f482_local7 = 0
			local f482_local8 = 0
			for f482_local16, f482_local17 in ipairs( f482_local2 ) do
				if f482_local17.disabled ~= true then
					local f482_local12 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f482_local16 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					local f482_local13 = CoD.GetCombatRecordStatForPath( f482_local1, "ItemStats." .. f482_local12 .. ".stats.used" )
					local f482_local14 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f482_local16 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					local f482_local15 = CoD.GetCombatRecordStatForPath( f482_local1, "ItemStats." .. f482_local14 .. ".stats.used" )
					if f482_local8 < f482_local13 + f482_local15 or f482_local3 == nil then
						if f482_local15 <= f482_local13 then
							f482_local7 = CoD.GetCombatRecordStatForPath( f482_local1, "ItemStats." .. f482_local12 .. ".stats.kills" )
							f482_local8 = f482_local13
							f482_local4 = f482_local12
						else
							f482_local7 = CoD.GetCombatRecordStatForPath( f482_local1, "ItemStats." .. f482_local14 .. ".stats.kills" )
							f482_local8 = f482_local15
							f482_local4 = f482_local14
						end
						f482_local3 = f482_local16 - 1
						f482_local5 = f482_local17.defaultHeroRender
						f482_local6 = f482_local17.displayName
					end
				end
			end
			f482_local9 = nil
			if f482_local8 == 0 then
				f482_local9 = string.format( "%.2f", 0 )
			else
				f482_local9 = string.format( "%.2f", math.floor( f482_local7 / f482_local8 * 100 + 0.5 ) / 100 )
			end
			Engine.SetModelValue( Engine.CreateModel( f482_local0, "heroIndex" ), f482_local3 )
			Engine.SetModelValue( Engine.CreateModel( f482_local0, "heroImage" ), f482_local5 )
			Engine.SetModelValue( Engine.CreateModel( f482_local0, "heroName" ), Engine.Localize( f482_local6 ) )
			Engine.SetModelValue( Engine.CreateModel( f482_local0, "itemIndex" ), f482_local4 )
			Engine.SetModelValue( Engine.CreateModel( f482_local0, "killsPerUse" ), f482_local9 )
			Engine.SetModelValue( Engine.CreateModel( f482_local0, "numKills" ), f482_local7 )
			Engine.SetModelValue( Engine.CreateModel( f482_local0, "numUses" ), f482_local8 )
			return f482_local0
		end
	},
	SubobjectivesList = {
		prepare = function ( f483_arg0, f483_arg1, f483_arg2 )
			f483_arg1.createWidgetFromDataSource = function ( f484_arg0, f484_arg1, f484_arg2 )
				return LUI.GridLayout.createWidgetFromDataSource( f484_arg0, f484_arg1, f484_arg2 )
			end
			
			f483_arg1.updateLayout = function ( f485_arg0, f485_arg1 )
				LUI.GridLayout.updateLayout( f485_arg0, f485_arg1 )
				f485_arg0:dispatchEventToParent( "child_size_updated" )
			end
			
		end,
		getCount = function ( f486_arg0 )
			if not f486_arg0.subobjectiveListModel then
				return 0
			else
				return DataSources.SubobjectivesList.getCountFromModel( f486_arg0.subobjectiveListModel )
			end
		end,
		getItem = function ( f487_arg0, f487_arg1, f487_arg2 )
			if not f487_arg1.subobjectiveListModel then
				return nil
			else
				return Engine.GetModel( f487_arg1.subobjectiveListModel, f487_arg2 )
			end
		end,
		getCountFromModel = function ( f488_arg0 )
			local f488_local0 = Engine.GetModel( f488_arg0, "count" )
			if f488_local0 then
				return Engine.GetModelValue( f488_local0 )
			else
				return 0
			end
		end,
		addSubObjective = function ( f489_arg0, f489_arg1, f489_arg2 )
			local f489_local0 = DataSources.SubobjectivesList.getCountFromModel( f489_arg0 ) + 1
			local f489_local1 = Engine.GetModel( f489_arg0, "count" )
			if f489_local1 then
				Engine.SetModelValue( f489_local1, f489_local0 )
			end
			local f489_local2 = Engine.CreateModel( f489_arg0, f489_local0 )
			Engine.SetModelValue( Engine.CreateModel( f489_local2, "text" ), f489_arg1 )
			Engine.SetModelValue( Engine.CreateModel( f489_local2, "status" ), f489_arg2 )
		end
	},
	ObjectivesList = {
		prepare = function ( f490_arg0, f490_arg1, f490_arg2 )
			f490_arg1:registerEventHandler( "child_size_updated", function ( element, event )
				element:updateLayout( 0 )
				return true
			end )
			f490_arg1.createWidgetFromDataSource = function ( f492_arg0, f492_arg1, f492_arg2 )
				local f492_local0 = LUI.GridLayout.createWidgetFromDataSource( f492_arg0, f492_arg1, f492_arg2 )
				f492_local0.internal.subobjectivesList.subobjectiveListModel = Engine.GetModel( f492_arg2, "subobjectivesList" )
				f492_local0.internal.subobjectivesList:updateDataSource()
				return f492_local0
			end
			
			f490_arg1.updateLayout = function ( f493_arg0, f493_arg1 )
				LUI.GridLayout.updateLayout( f493_arg0, f493_arg1 )
				f493_arg0:dispatchEventToParent( "child_size_updated" )
			end
			
		end,
		getCount = function ( f494_arg0 )
			if not f494_arg0.objectiveListModel then
				return 0
			else
				return DataSources.ObjectivesList.getCountFromModel( f494_arg0.objectiveListModel )
			end
		end,
		getItem = function ( f495_arg0, f495_arg1, f495_arg2 )
			if not f495_arg1.objectiveListModel then
				return nil
			else
				return Engine.GetModel( f495_arg1.objectiveListModel, f495_arg2 )
			end
		end,
		getCountFromModel = function ( f496_arg0 )
			local f496_local0 = Engine.GetModel( f496_arg0, "count" )
			if f496_local0 then
				return Engine.GetModelValue( f496_local0 )
			else
				return 0
			end
		end,
		addObjective = function ( f497_arg0, f497_arg1, f497_arg2, f497_arg3 )
			local f497_local0 = DataSources.ObjectivesList.getCountFromModel( f497_arg0 ) + 1
			local f497_local1 = Engine.GetModel( f497_arg0, "count" )
			if f497_local1 then
				Engine.SetModelValue( f497_local1, f497_local0 )
			end
			local f497_local2 = Engine.CreateModel( f497_arg0, f497_local0 )
			Engine.SetModelValue( Engine.CreateModel( f497_local2, "displayText" ), Engine.Localize( f497_arg1 ) )
			Engine.SetModelValue( Engine.CreateModel( f497_local2, "status" ), f497_arg2 )
			local f497_local3 = Engine.CreateModel( f497_local2, "subobjectivesList" )
			Engine.SetModelValue( Engine.CreateModel( f497_local3, "count" ), 0 )
			for f497_local7, f497_local8 in ipairs( f497_arg3 ) do
				DataSources.SubobjectivesList.addSubObjective( f497_local3, Engine.Localize( f497_local8.desc ), f497_local8.status )
			end
		end
	},
	CurrentObjectivesList = {
		prepare = function ( f498_arg0, f498_arg1, f498_arg2 )
			f498_arg1.objectiveOrder = {
				"active",
				"done"
			}
			f498_arg1.objectiveCategories = {}
			f498_arg1:registerEventHandler( "child_size_updated", function ( element, event )
				element:updateLayout( 0 )
				return true
			end )
			f498_arg1.createWidgetFromDataSource = function ( f500_arg0, f500_arg1, f500_arg2 )
				local f500_local0 = LUI.GridLayout.createWidgetFromDataSource( f500_arg0, f500_arg1, f500_arg2 )
				f500_local0.internal.objectivesList.objectiveListModel = Engine.GetModel( f500_arg2, "objectivesList" )
				f500_local0.internal.objectivesList:updateDataSource()
				return f500_local0
			end
			
			if CoD.isCampaign then
				local f498_local0 = Engine.GetPlayerObjectives( f498_arg0 )
				if f498_local0 == nil then
					return 
				end
				local f498_local1 = {}
				for f498_local7, f498_local8 in CoD.pairsByKeys( f498_local0 ) do
					if f498_local8.status ~= "invisible" and f498_local8.objective_desc ~= nil and f498_local8.objective_desc ~= "" then
						local f498_local5 = "done"
						if f498_local8.status == "current" or f498_local8.status == "active" or f498_local8.status == "failed" then
							f498_local5 = "active"
						end
						if not f498_local1[f498_local8.objective_desc] then
							f498_local1[f498_local8.objective_desc] = {
								desc = f498_local8.objective_desc,
								status = f498_local5,
								subobjectives = {}
							}
						end
						local f498_local6 = f498_local1[f498_local8.objective_desc]
						if f498_local8.subobjective_desc ~= "" then
							table.insert( f498_local6.subobjectives, {
								status = f498_local8.status,
								desc = f498_local8.subobjective_desc
							} )
						end
						if f498_local6.status == "done" and f498_local5 == "active" then
							f498_local6.status = "active"
						end
					end
				end
				f498_local2 = {}
				for f498_local8, f498_local5 in CoD.pairsByKeys( f498_local1 ) do
					if not f498_local2[f498_local5.status] then
						f498_local2[f498_local5.status] = {}
					end
					table.insert( f498_local2[f498_local5.status], f498_local5 )
				end
				f498_local3 = Engine.CreateModel( Engine.GetModelForController( f498_arg0 ), "CurrentObjectivesList" )
				for f498_local5, f498_local6 in CoD.pairsByKeys( f498_local2 ) do
					local f498_local12 = Engine.CreateModel( f498_local3, f498_local5 )
					Engine.SetModelValue( Engine.CreateModel( f498_local12, "status" ), f498_local5 )
					Engine.SetModelValue( Engine.CreateModel( f498_local12, "category" ), Engine.Localize( "MENU_" .. Engine.ToUpper( f498_local5 ) .. "_OBJECTIVES_CAPS" ) )
					local f498_local13 = Engine.CreateModel( f498_local12, "objectivesList" )
					Engine.SetModelValue( Engine.CreateModel( f498_local13, "count" ), 0 )
					for f498_local9, f498_local10 in ipairs( f498_local6 ) do
						DataSources.ObjectivesList.addObjective( f498_local13, f498_local10.desc, f498_local10.status, f498_local10.subobjectives )
					end
					f498_arg1.objectiveCategories[f498_local5] = f498_local12
				end
			else
				local f498_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f498_arg0 ), "GameObjectiveList" ), "gameMode" )
				local f498_local2 = Engine.DvarString( nil, "g_gametype" )
				local f498_local3 = Engine.Localize( "MPUI_" .. f498_local2 )
				local f498_local4 = Engine.TableLookup( f498_arg0, CoD.gametypesTable, 0, 0, 1, f498_local2, 3 )
				Engine.SetModelValue( Engine.CreateModel( f498_local1, "status" ), "active" )
				Engine.SetModelValue( Engine.CreateModel( f498_local1, "category" ), Engine.Localize( "GAME MODE" ) )
				local f498_local7 = Engine.CreateModel( f498_local1, "objectivesList" )
				Engine.SetModelValue( Engine.CreateModel( f498_local7, "count" ), 0 )
				DataSources.ObjectivesList.addObjective( f498_local7, f498_local3, "active", {
					{
						status = "description",
						desc = f498_local4
					}
				} )
				f498_arg1.objectiveCategories.active = f498_local1
			end
		end,
		getCount = function ( f501_arg0 )
			local f501_local0 = 0
			for f501_local4, f501_local5 in ipairs( f501_arg0.objectiveOrder ) do
				if f501_arg0.objectiveCategories[f501_local5] then
					f501_local0 = f501_local0 + 1
				end
			end
			return f501_local0
		end,
		getItem = function ( f502_arg0, f502_arg1, f502_arg2 )
			local f502_local0 = 0
			for f502_local4, f502_local5 in ipairs( f502_arg1.objectiveOrder ) do
				if f502_arg1.objectiveCategories[f502_local5] and f502_local0 + 1 == f502_arg2 then
					return f502_arg1.objectiveCategories[f502_local5]
				end
			end
			return nil
		end
	},
	DeadOpsArcadeGlobal = {
		getModel = function ( f503_arg0 )
			local f503_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal" )
			Engine.CreateModel( f503_local0, "redins" )
			Engine.CreateModel( f503_local0, "countdown" )
			Engine.CreateModel( f503_local0, "gbanner" )
			Engine.CreateModel( f503_local0, "grgb1" )
			Engine.CreateModel( f503_local0, "grgb2" )
			Engine.CreateModel( f503_local0, "grgb3" )
			Engine.CreateModel( f503_local0, "gtxt0" )
			Engine.CreateModel( f503_local0, "gpr0" )
			Engine.CreateModel( f503_local0, "gpr1" )
			Engine.CreateModel( f503_local0, "gpr2" )
			Engine.CreateModel( f503_local0, "gpr3" )
			Engine.CreateModel( f503_local0, "level" )
			return f503_local0
		end
	},
	DeadOpsArcadePlayers = {
		updateModelsForClient = function ( f504_arg0, f504_arg1 )
			local f504_local0 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadePlayers" ), "player" .. f504_arg1 + 1 )
			if f504_local0 ~= nil then
				local f504_local1 = Engine.GetPlayerListData( f504_arg0, f504_arg1 )
				if f504_local1.playerName ~= nil and f504_local1.playerConnected then
					Engine.SetModelValue( Engine.GetModel( f504_local0, "name" ), f504_local1.playerName )
				else
					Engine.SetModelValue( Engine.GetModel( f504_local0, "name" ), "" )
				end
			end
		end,
		getModel = function ( f505_arg0 )
			local f505_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadePlayers" )
			for f505_local1 = 1, 4, 1 do
				if Engine.GetModel( f505_local0, "player" .. f505_local1 ) == nil then
					local f505_local4 = Engine.CreateModel( f505_local0, "player" .. f505_local1 )
					Engine.CreateModel( f505_local4, "name" )
					Engine.CreateModel( f505_local4, "lives" )
					Engine.CreateModel( f505_local4, "bombs" )
					Engine.CreateModel( f505_local4, "boosts" )
					Engine.CreateModel( f505_local4, "score" )
					Engine.CreateModel( f505_local4, "multiplier" )
					Engine.CreateModel( f505_local4, "xbar" )
					Engine.CreateModel( f505_local4, "bulletbar" )
					Engine.CreateModel( f505_local4, "bulletbar_rgb" )
					Engine.CreateModel( f505_local4, "ribbon" )
					Engine.CreateModel( f505_local4, "gpr_rgb" )
					Engine.CreateModel( f505_local4, "generic_txt" )
					Engine.CreateModel( f505_local4, "gpr" )
					Engine.CreateModel( f505_local4, "gpr2" )
					Engine.CreateModel( f505_local4, "weaplevel1" )
					Engine.CreateModel( f505_local4, "weaplevel2" )
					Engine.CreateModel( f505_local4, "respawn" )
					DataSources.DeadOpsArcadePlayers.updateModelsForClient( f505_arg0, f505_local1 - 1 )
				end
			end
			return f505_local0
		end
	},
	PlayerList = {
		modelLinks = {
			playerName = "playerName",
			score = "playerScore",
			rankIcon = "playerRankIcon",
			rankNum = "rankNum",
			clanAbbrev = "clanAbbrev",
			clientNum = "clientNum",
			playerConnected = "playerConnected"
		},
		prepare = function ( f506_arg0, f506_arg1, f506_arg2 )
			f506_arg1.playerListInfoList = {}
			f506_arg1.playerListInfoOrder = {}
			local f506_local0 = Engine.GetModelForController( f506_arg0 )
			local f506_local1 = Engine.CreateModel( f506_local0, "PlayerList" )
			local f506_local2 = 2
			local f506_local3 = Engine.GetClientNum( f506_arg0 )
			for f506_local4 = 0, Dvar.com_maxclients:get() - 1, 1 do
				local f506_local7 = Engine.GetPlayerListData( f506_arg0, f506_local4 )
				local f506_local8 = Engine.CreateModel( f506_local1, f506_local4 )
				for f506_local12, f506_local13 in pairs( DataSources.PlayerList.modelLinks ) do
					Engine.SetModelValue( Engine.CreateModel( f506_local8, f506_local13 ), f506_local7[f506_local12] )
				end
				Engine.SetModelValue( Engine.CreateModel( f506_local8, "objectiveIcon" ), "" )
				f506_arg1.playerListInfoList[f506_local4 + 1] = f506_local8
				if f506_local4 == Engine.GetClientNum( f506_arg0 ) then
					f506_arg1.playerListInfoOrder[1] = f506_local4 + 1
				else
					f506_arg1.playerListInfoOrder[f506_local2] = f506_local4 + 1
					f506_local2 = f506_local2 + 1
				end
			end
			local f506_local4 = function ( f507_arg0, f507_arg1 )
				DataSources.PlayerList.updateModelsForClient( f507_arg0, f506_arg1, f507_arg1 )
			end
			
			if not f506_arg1.playerConnectedSubscription then
				f506_arg1.playerConnectedSubscription = f506_arg1:subscribeToModel( Engine.GetModel( f506_local0, "playerConnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f506_local4( f506_arg0, modelValue )
					end
				end, false )
			end
			if not f506_arg1.playerDisconnectedSubscription then
				f506_arg1.playerDisconnectedSubscription = f506_arg1:subscribeToModel( Engine.GetModel( f506_local0, "playerDisconnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f506_local4( f506_arg0, modelValue )
					end
				end, false )
			end
			if not f506_arg1.hasScoreboardSubscriptions then
				f506_arg1.hasScoreboardSubscriptions = true
				for f506_local5 = 0, Dvar.com_maxclients:get() - 1, 1 do
					f506_arg1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1." .. f506_local5 .. ".clientNum" ), function ( model )
						local modelValue = Engine.GetModelValue( model )
						if modelValue ~= nil then
							f506_local4( f506_arg0, modelValue )
						end
					end, false )
				end
			end
		end,
		updateModelsForClient = function ( f511_arg0, f511_arg1, f511_arg2 )
			local f511_local0 = DataSources.PlayerList.getModelForPlayer( f511_arg0, f511_arg1, f511_arg2 )
			if f511_local0 ~= nil then
				local f511_local1 = Engine.GetPlayerListData( f511_arg0, f511_arg2 )
				for f511_local5, f511_local6 in pairs( DataSources.PlayerList.modelLinks ) do
					local f511_local7 = Engine.GetModel( f511_local0, f511_local6 )
					if f511_local7 then
						Engine.SetModelValue( f511_local7, f511_local1[f511_local5] )
					end
				end
				f511_arg1:updateDataSource()
			end
		end,
		getCount = function ( f512_arg0 )
			local f512_local0 = 0
			for f512_local4, f512_local5 in pairs( f512_arg0.playerListInfoList ) do
				local f512_local6 = Engine.GetModel( f512_local5, "playerConnected" )
				if f512_local6 and Engine.GetModelValue( f512_local6 ) ~= 0 then
					f512_local0 = f512_local0 + 1
				end
			end
			if f512_local0 > 1 then
				return f512_local0
			else
				return 0
			end
		end,
		getItem = function ( f513_arg0, f513_arg1, f513_arg2 )
			local f513_local0 = 0
			for f513_local1 = 1, Dvar.com_maxclients:get(), 1 do
				local f513_local4 = f513_arg1.playerListInfoList[f513_arg1.playerListInfoOrder[f513_local1]]
				local f513_local5 = Engine.GetModel( f513_local4, "playerConnected" )
				if f513_local5 and Engine.GetModelValue( f513_local5 ) ~= 0 and f513_local0 + 1 == f513_arg2 then
					return f513_local4
				end
			end
			DebugPrint( "WARNING: returning invalid playerListInfoList row" )
			return f513_arg1.playerListInfoList[f513_arg1.playerListInfoOrder[0]]
		end,
		getModelForPlayer = function ( f514_arg0, f514_arg1, f514_arg2 )
			return f514_arg1.playerListInfoList[f514_arg2 + 1]
		end
	},
	PlayerListZM = {
		modelLinks = {
			playerName = "playerName",
			score = "playerScore",
			scoreVisible = "playerScoreVisible",
			rankIcon = "playerRankIcon",
			rankNum = "rankNum",
			clanAbbrev = "clanAbbrev",
			clientNum = "clientNum",
			playerConnected = "playerConnected",
			zombiePlayerIcon = "zombiePlayerIcon"
		},
		prepare = function ( f515_arg0, f515_arg1, f515_arg2 )
			f515_arg1.playerListInfoList = {}
			local f515_local0 = Engine.GetModelForController( f515_arg0 )
			local f515_local1 = Engine.CreateModel( f515_local0, "PlayerList" )
			local f515_local2 = Engine.GetClientNum( f515_arg0 )
			local f515_local3 = function ( f516_arg0, f516_arg1 )
				if f516_arg0 == f516_arg1 then
					return 1
				elseif f516_arg0 < f516_arg1 then
					return 2 + f516_arg0
				else
					return 1 + f516_arg0
				end
			end
			
			for f515_local4 = 0, Dvar.com_maxclients:get() - 1, 1 do
				local f515_local7 = f515_local3( f515_local4, f515_local2 )
				local f515_local8 = Engine.GetPlayerListData( f515_arg0, f515_local4 )
				local f515_local9 = Engine.CreateModel( f515_local1, f515_local7 - 1 )
				for f515_local13, f515_local14 in pairs( DataSources.PlayerListZM.modelLinks ) do
					Engine.SetModelValue( Engine.CreateModel( f515_local9, f515_local14 ), f515_local8[f515_local13] )
				end
				f515_arg1.playerListInfoList[f515_local7] = f515_local9
			end
			local f515_local4 = function ( f517_arg0, f517_arg1 )
				DataSources.PlayerListZM.updateModelsForClient( f517_arg0, f515_arg1, f517_arg1 )
			end
			
			if not f515_arg1.playerConnectedSubscription then
				f515_arg1.playerConnectedSubscription = f515_arg1:subscribeToModel( Engine.GetModel( f515_local0, "playerConnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f515_local4( f515_arg0, modelValue )
					end
				end, false )
			end
			if not f515_arg1.playerDisconnectedSubscription then
				f515_arg1.playerDisconnectedSubscription = f515_arg1:subscribeToModel( Engine.GetModel( f515_local0, "playerDisconnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f515_local4( f515_arg0, modelValue )
					end
				end, false )
			end
		end,
		updateModelsForClient = function ( f520_arg0, f520_arg1, f520_arg2 )
			local f520_local0 = DataSources.PlayerListZM.getModelForPlayer( f520_arg0, f520_arg1, f520_arg2 )
			if f520_local0 ~= nil then
				local f520_local1 = Engine.GetPlayerListData( f520_arg0, f520_arg2 )
				for f520_local5, f520_local6 in pairs( DataSources.PlayerListZM.modelLinks ) do
					local f520_local7 = Engine.GetModel( f520_local0, f520_local6 )
					if f520_local7 then
						Engine.SetModelValue( f520_local7, f520_local1[f520_local5] )
					end
				end
				f520_arg1:updateDataSource()
			end
		end,
		getCount = function ( f521_arg0 )
			local f521_local0 = 0
			for f521_local4, f521_local5 in pairs( f521_arg0.playerListInfoList ) do
				local f521_local6 = Engine.GetModel( f521_local5, "playerConnected" )
				if f521_local6 and Engine.GetModelValue( f521_local6 ) ~= 0 then
					f521_local0 = f521_local0 + 1
				end
			end
			return f521_local0
		end,
		getItem = function ( f522_arg0, f522_arg1, f522_arg2 )
			return f522_arg1.playerListInfoList[f522_arg2]
		end,
		getModelForPlayer = function ( f523_arg0, f523_arg1, f523_arg2 )
			for f523_local0 = 1, Dvar.com_maxclients:get(), 1 do
				local f523_local3 = f523_arg1.playerListInfoList[f523_local0]
				local f523_local4 = Engine.GetModel( f523_local3, "clientNum" )
				if f523_local4 and f523_local4 == f523_arg2 then
					return f523_local3
				end
			end
			DebugPrint( "WARNING: returning invalid playerListInfoList row" )
			return f523_arg1.playerListInfoList[1]
		end
	},
	RaidsPurchases = {
		modelLinks = {
			cost = "cost",
			description = "description",
			displayName = "displayName",
			image = "image",
			name = "name"
		},
		prepare = function ( f524_arg0, f524_arg1, f524_arg2 )
			if DataSources.RaidsPurchases.Model == nil then
				DataSources.RaidsPurchases.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.RaidsPurchases" )
				DataSources.RaidsPurchases.Items = {}
				local f524_local0 = "gamedata/tables/cp/cp_sm_resources.csv"
				local f524_local1 = {
					scriptID = 0,
					cost = 1,
					title = 2,
					description = 3,
					icon = 4,
					active = 5
				}
				local f524_local2 = Engine.TableFindRows( f524_local0, f524_local1.active, "1" )
				if f524_local2 ~= nil then
					for f524_local3 = 1, #f524_local2, 1 do
						local f524_local6 = f524_local2[f524_local3]
						DataSources.RaidsPurchases.Items[f524_local3] = Engine.CreateModel( DataSources.RaidsPurchases.Model, "item" .. f524_local3 )
						local f524_local7 = Engine.TableGetColumnValueForRow( f524_local0, f524_local6, f524_local1.scriptID )
						local f524_local8 = Engine.TableGetColumnValueForRow( f524_local0, f524_local6, f524_local1.title )
						local f524_local9 = Engine.TableGetColumnValueForRow( f524_local0, f524_local6, f524_local1.description )
						local f524_local10 = Engine.TableGetColumnValueForRow( f524_local0, f524_local6, f524_local1.icon )
						local f524_local11 = Engine.TableGetColumnValueForRow( f524_local0, f524_local6, f524_local1.cost )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f524_local3], "id" ), f524_local7 )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f524_local3], "name" ), f524_local8 )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f524_local3], "displayName" ), Engine.Localize( f524_local8 ) )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f524_local3], "description" ), Engine.Localize( f524_local9 ) )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f524_local3], "enabledDescription" ), f524_local9 )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f524_local3], "image" ), f524_local10 )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f524_local3], "cost" ), f524_local11 )
					end
				end
			end
		end,
		getCount = function ( f525_arg0 )
			return #DataSources.RaidsPurchases.Items
		end,
		getItem = function ( f526_arg0, f526_arg1, f526_arg2 )
			return DataSources.RaidsPurchases.Items[f526_arg2]
		end
	},
	EmblemLayerList = {
		createGroup = function ( f527_arg0, f527_arg1, f527_arg2, f527_arg3, f527_arg4 )
			local f527_local0 = f527_arg1
			local f527_local1 = f527_arg1
			for f527_local2 = f527_arg1, f527_arg3 - 1, 1 do
				local f527_local5 = Engine.GetSelectedLayerData( f527_arg0, f527_local2, f527_arg4 )
				if f527_local5.groupIndex == f527_arg2 then
					f527_local1 = f527_local2
				end
			end
			return {
				groupStartLayer = f527_local0,
				groupEndLayer = f527_local1,
				isGrouped = true
			}
		end,
		createLayer = function ( f528_arg0 )
			return {
				groupStartLayer = f528_arg0,
				groupEndLayer = f528_arg0,
				isGrouped = false
			}
		end,
		prepare = function ( f529_arg0, f529_arg1, f529_arg2 )
			f529_arg1.emblemLayerListModel = Engine.CreateModel( Engine.GetModelForController( f529_arg0 ), "Emblem.EmblemLayerList" )
			local f529_local0 = CoD.GetCustomization( f529_arg0, "type" )
			f529_arg1.totalLayers = math.min( Engine.GetUsedLayerCount( f529_arg0, f529_local0, CoD.perController[f529_arg0].totalLayers ) + 1, CoD.perController[f529_arg0].totalLayers )
			f529_arg1.itemInfo = {}
			local f529_local1 = 0
			while f529_local1 < f529_arg1.totalLayers do
				local f529_local2 = Engine.GetSelectedLayerData( f529_arg0, f529_local1, f529_local0 )
				if f529_local2.isGrouped == true then
					local f529_local3 = DataSources.EmblemLayerList.createGroup( f529_arg0, f529_local1, f529_local2.groupIndex, f529_arg1.totalLayers, f529_local0 )
					table.insert( f529_arg1.itemInfo, f529_local3 )
					f529_local1 = f529_local3.groupEndLayer + 1
				else
					table.insert( f529_arg1.itemInfo, DataSources.EmblemLayerList.createLayer( f529_local1 ) )
					f529_local1 = f529_local1 + 1
				end
				if f529_local2.groupIndex == CoD.perController[f529_arg0].selectEmblemGroupIndex then
					f529_arg1.selectIndex = #f529_arg1.itemInfo
				end
			end
		end,
		getCount = function ( f530_arg0 )
			return #f530_arg0.itemInfo
		end,
		getItem = function ( f531_arg0, f531_arg1, f531_arg2 )
			local f531_local0 = nil
			local f531_local1 = f531_arg1.itemInfo[f531_arg2].groupStartLayer
			local f531_local2 = f531_arg1.itemInfo[f531_arg2].groupEndLayer - f531_arg1.itemInfo[f531_arg2].groupStartLayer + 1
			if f531_arg1.itemInfo[f531_arg2].isGrouped then
				f531_local0 = tostring( f531_arg1.itemInfo[f531_arg2].groupStartLayer + 1 ) .. "-" .. tostring( f531_arg1.itemInfo[f531_arg2].groupEndLayer + 1 )
			else
				f531_local0 = tostring( f531_local1 + 1 )
			end
			local f531_local3 = Engine.CreateModel( f531_arg1.emblemLayerListModel, "layer_" .. f531_local1 )
			Engine.SetModelValue( Engine.CreateModel( f531_local3, "layerIndex" ), f531_local1 )
			Engine.SetModelValue( Engine.CreateModel( f531_local3, "layerNumberString" ), f531_local0 )
			local f531_local4 = Engine.GetSelectedLayerData( f531_arg0, f531_local1, CoD.GetCustomization( f531_arg0, "type" ) )
			if f531_local4.iconID == CoD.emblem.INVALID_ID then
				Engine.SetModelValue( Engine.CreateModel( f531_local3, "layerName" ), Engine.Localize( "MENU_EMBLEM_ADD_DECAL" ) )
			else
				Engine.SetModelValue( Engine.CreateModel( f531_local3, "layerName" ), Engine.Localize( "MENU_EMBLEM_LAYER_NUMBER", f531_local1 + 1 ) )
			end
			Engine.SetModelValue( Engine.CreateModel( f531_local3, "isLinked" ), f531_local4.isLinked )
			Engine.SetModelValue( Engine.CreateModel( f531_local3, "isGrouped" ), f531_local4.isGrouped )
			Engine.SetModelValue( Engine.CreateModel( f531_local3, "groupIndex" ), f531_local4.groupIndex )
			Engine.SetModelValue( Engine.CreateModel( f531_local3, "layerAndGroupIndex" ), f531_local1 .. " " .. f531_local4.groupIndex )
			Engine.SetModelValue( Engine.CreateModel( f531_local3, "groupLayerCount" ), f531_local2 )
			return f531_local3
		end,
		getCustomPropertiesForItem = function ( f532_arg0, f532_arg1 )
			if f532_arg0.selectIndex == f532_arg1 then
				return {
					selectIndex = true
				}
			else
				
			end
		end,
		swapItemInfo = function ( f533_arg0, f533_arg1, f533_arg2, f533_arg3 )
			if f533_arg2 and f533_arg3 and f533_arg1 then
				f533_arg2:setModel( nil )
				f533_arg3:setModel( nil )
				local f533_local0 = f533_arg2.gridInfoTable.zeroBasedIndex + 1
				local f533_local1 = f533_arg3.gridInfoTable.zeroBasedIndex + 1
				local f533_local2 = f533_arg1.itemInfo[f533_local0]
				local f533_local3 = f533_arg1.itemInfo[f533_local1]
				local f533_local4 = f533_local2.groupEndLayer - f533_local2.groupStartLayer
				f533_local2.groupEndLayer = f533_local2.groupStartLayer + f533_local3.groupEndLayer - f533_local3.groupStartLayer
				f533_local3.groupStartLayer = f533_local2.groupEndLayer + 1
				f533_local3.groupEndLayer = f533_local3.groupStartLayer + f533_local4
				local f533_local5 = f533_local2.isGrouped
				f533_local2.isGrouped = f533_local3.isGrouped
				f533_local3.isGrouped = f533_local5
				f533_arg2:setModel( DataSources.EmblemLayerList.getItem( f533_arg0, f533_arg1, f533_local0 ) )
				f533_arg3:setModel( DataSources.EmblemLayerList.getItem( f533_arg0, f533_arg1, f533_local1 ) )
			end
		end
	},
	EmblemIconList = {
		prepare = function ( f534_arg0, f534_arg1, f534_arg2 )
			f534_arg1.emblemIconList = {}
			local f534_local0 = CoD.emblem.DECALTABS[1].category
			if CoD.perController[f534_arg0].selectedDecalCategory ~= nil then
				f534_local0 = CoD.perController[f534_arg0].selectedDecalCategory
			end
			local f534_local1 = Engine.CreateModel( Engine.GetModelForController( f534_arg0 ), "Emblem.EmblemIconList" )
			local f534_local2 = Engine.EmblemFilterCount( f534_arg0, 0, f534_local0 )
			for f534_local3 = 0, f534_local2 - 1, 1 do
				local f534_local6 = Engine.CreateModel( f534_local1, "icon_" .. f534_local3 )
				local f534_local7 = Engine.EmblemFilterIconID( f534_arg0, 0, f534_local0, f534_local3 )
				Engine.SetModelValue( Engine.CreateModel( f534_local6, "iconID" ), f534_local7 )
				Engine.SetModelValue( Engine.CreateModel( f534_local6, "name" ), GetEmblemDecalDesc( f534_local7 ) )
				if f534_local0 == CoD.emblem.BlackMarketDecalCategory then
					local f534_local8 = CoD.BlackMarketUtility.IsItemLocked( f534_arg0, CoD.BlackMarketUtility.GetLootDecalName( f534_arg0, f534_local7 ) )
					if f534_local8 then
						Engine.SetModelValue( Engine.GetModel( f534_local6, "name" ), CoD.BlackMarketUtility.ClassifiedName() )
					end
					Engine.SetModelValue( Engine.CreateModel( f534_local6, "isBMClassified" ), f534_local8 )
				else
					Engine.SetModelValue( Engine.CreateModel( f534_local6, "isBMClassified" ), false )
				end
				table.insert( f534_arg1.emblemIconList, f534_local6 )
			end
			table.sort( f534_arg1.emblemIconList, CoD.BlackMarketUtility.SortUnlocksModelIconID )
		end,
		getCount = function ( f535_arg0 )
			return #f535_arg0.emblemIconList
		end,
		getItem = function ( f536_arg0, f536_arg1, f536_arg2 )
			return f536_arg1.emblemIconList[f536_arg2]
		end
	},
	EmblemMaterialList = {
		prepare = function ( f537_arg0, f537_arg1, f537_arg2 )
			f537_arg1.emblemMaterialList = {}
			local f537_local0 = CoD.emblem.MaterialCategory[1].category
			if CoD.perController[f537_arg0].selectedMaterialCategory ~= nil then
				f537_local0 = CoD.perController[f537_arg0].selectedMaterialCategory
			end
			local f537_local1 = Engine.CreateModel( Engine.GetModelForController( f537_arg0 ), "Emblem.EmblemMaterialList" )
			local f537_local2 = Engine.GetEmblemMaterialFilterCount( f537_arg0, f537_local0 )
			for f537_local3 = 0, f537_local2 - 1, 1 do
				local f537_local6 = Engine.CreateModel( f537_local1, "emblemMaterial_" .. f537_local3 )
				local f537_local7 = Engine.GetEmblemMaterialIDByIndex( f537_arg0, f537_local0, f537_local3 )
				Engine.SetModelValue( Engine.CreateModel( f537_local6, "materialID" ), f537_local7 )
				local f537_local8 = Engine.GetEmblemMaterialName( f537_local7 )
				Engine.SetModelValue( Engine.CreateModel( f537_local6, "materialName" ), f537_local8 )
				local f537_local9 = false
				if f537_local0 == CoD.emblem.BlackMarketEmblemCategory then
					f537_local9 = CoD.BlackMarketUtility.IsItemLocked( f537_arg0, f537_local8 )
				end
				Engine.SetModelValue( Engine.CreateModel( f537_local6, "isBMClassified" ), f537_local9 )
				table.insert( f537_arg1.emblemMaterialList, f537_local6 )
			end
		end,
		getCount = function ( f538_arg0 )
			return #f538_arg0.emblemMaterialList
		end,
		getItem = function ( f539_arg0, f539_arg1, f539_arg2 )
			return f539_arg1.emblemMaterialList[f539_arg2]
		end
	},
	EmblemColorList = {
		prepare = function ( f540_arg0, f540_arg1, f540_arg2 )
			f540_arg1.emblemColorList = {}
			if not CoD.emblem.ColorList then
				CoD.emblem.ColorList = CoD.GetEmblemColorList( f540_arg0 )
			end
			f540_arg1.emblemColorList = CoD.emblem.ColorList
		end,
		getCount = function ( f541_arg0 )
			return #f541_arg0.emblemColorList
		end,
		getItem = function ( f542_arg0, f542_arg1, f542_arg2 )
			return f542_arg1.emblemColorList[f542_arg2]
		end
	},
	EmblemSelectedLayerColor = {
		getModel = function ( f543_arg0 )
			local f543_local0 = Engine.GetSelectedLayerColor( f543_arg0 )
			local f543_local1 = Engine.CreateModel( Engine.GetModelForController( f543_arg0 ), "Emblem.EmblemSelectedLayerColor" )
			Engine.SetModelValue( Engine.CreateModel( f543_local1, "color" ), CoD.ConvertColor( f543_local0.red, f543_local0.green, f543_local0.blue ) )
			Engine.SetModelValue( Engine.CreateModel( f543_local1, "red" ), f543_local0.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( f543_local1, "green" ), f543_local0.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( f543_local1, "blue" ), f543_local0.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			return f543_local1
		end
	},
	EmblemSelectedLayerColor1 = {
		getModel = function ( f544_arg0 )
			local f544_local0 = Engine.GetSelectedLayerColor1( f544_arg0 )
			local f544_local1 = Engine.CreateModel( Engine.GetModelForController( f544_arg0 ), "Emblem.EmblemSelectedLayerColor1" )
			Engine.SetModelValue( Engine.CreateModel( f544_local1, "color" ), CoD.ConvertColor( f544_local0.red, f544_local0.green, f544_local0.blue ) )
			Engine.SetModelValue( Engine.CreateModel( f544_local1, "red" ), f544_local0.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( f544_local1, "green" ), f544_local0.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( f544_local1, "blue" ), f544_local0.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			return f544_local1
		end
	},
	EmblemSelectedLayerEdittingColor = {
		getModel = function ( f545_arg0 )
			local f545_local0 = CoD.GetEditorProperties( f545_arg0, "isGradientMode" )
			local f545_local1 = CoD.GetEditorProperties( f545_arg0, "colorNum" )
			if f545_local0 ~= nil and f545_local1 ~= nil and f545_local0 == 1 and f545_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
				return DataSources.EmblemSelectedLayerColor1.getModel( f545_arg0 )
			else
				return DataSources.EmblemSelectedLayerColor.getModel( f545_arg0 )
			end
		end
	},
	EmblemSelectedLayerNoColor = {
		getModel = function ( f546_arg0 )
			local f546_local0 = CoD.GetEditorProperties( f546_arg0, "isGradientMode" )
			local f546_local1 = CoD.GetEditorProperties( f546_arg0, "colorNum" )
			if f546_local0 ~= nil and f546_local1 ~= nil and f546_local0 == 1 and f546_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
				return DataSources.EmblemSelectedLayerColor.getModel( f546_arg0 )
			else
				return DataSources.EmblemSelectedLayerColor1.getModel( f546_arg0 )
			end
		end
	},
	EmblemSelectedLayerProperties = {
		getModel = function ( f547_arg0 )
			local f547_local0 = Engine.GetSelectedEmblemLayerProperties()
			local f547_local1 = Engine.CreateModel( Engine.GetModelForController( f547_arg0 ), "Emblem.EmblemSelectedLayerProperties" )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "xposition" ), f547_local0.xposition )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "yposition" ), f547_local0.yposition )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "xscale" ), f547_local0.xscale )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "yscale" ), f547_local0.yscale )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "rotation" ), f547_local0.rotation )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "opacity0" ), f547_local0.opacity0 )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "opacity1" ), f547_local0.opacity1 )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "gradient_angle" ), f547_local0.gradient_angle )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "gradient_type" ), f547_local0.gradient_type )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "gradient_fill" ), f547_local0.gradient_fill )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "material_angle" ), f547_local0.material_angle )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "material_xscale" ), f547_local0.material_xscale )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "material_yscale" ), f547_local0.material_yscale )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "max_opacity" ), math.max( f547_local0.opacity0, f547_local0.opacity1 ) )
			Engine.SetModelValue( Engine.CreateModel( f547_local1, "blend" ), f547_local0.blend )
			return f547_local1
		end
	},
	EmblemProperties = {
		getModel = function ( f548_arg0 )
			local f548_local0 = Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID
			local f548_local1 = Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
			local f548_local2 = Engine.GetEmblemScaleMode( f548_arg0 )
			local f548_local3 = Engine.GetLayerMaterialScaleMode( f548_arg0 )
			local f548_local4 = CoD.perController[f548_arg0].totalLayers
			local f548_local5 = CoD.GetCustomization( f548_arg0, "type" )
			local f548_local6 = Engine.GetUsedLayerCount( f548_arg0, f548_local5, f548_local4 )
			local f548_local7 = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f548_local6, f548_local4 )
			local f548_local8 = Engine.GetLinkedLayerCount( f548_arg0, f548_local5 )
			local f548_local9 = CoD.perController[f548_arg0].totalGroups
			local f548_local10 = Engine.GetUsedGroupCount( f548_arg0, f548_local5, f548_local9 )
			local f548_local11 = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f548_local10, f548_local9 - 1 )
			local f548_local12 = Engine.GetModel( Engine.GetModelForController( f548_arg0 ), "Emblem.EmblemProperties" )
			if not f548_local12 then
				f548_local12 = Engine.CreateModel( Engine.GetModelForController( f548_arg0 ), "Emblem.EmblemProperties" )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "layersUsed" ), f548_local6 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "colorMode" ), f548_local0 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "scaleMode" ), f548_local2 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "materialScaleMode" ), f548_local3 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "layersUsedFraction" ), f548_local7 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "groupsUsed" ), f548_local10 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "groupsUsedFraction" ), f548_local11 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "isClipboardEmpty" ), CoD.emblem.CLIPBOARDSTATE.EMPTY )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "addDecalMode" ), CoD.emblem.ADDDECAL.REPLACE )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "isGradientMode" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "colorNum" ), Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "isColor0NoColor" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "isColor1NoColor" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "linkedLayerCount" ), f548_local8 )
				Engine.SetModelValue( Engine.CreateModel( f548_local12, "selectedDecalID" ), 0 )
			end
			return f548_local12
		end
	},
	Customization = {
		getModel = function ( f549_arg0 )
			local f549_local0 = Engine.GetModel( Engine.GetModelForController( f549_arg0 ), "Customization" )
			if not f549_local0 then
				f549_local0 = Engine.CreateModel( Engine.GetModelForController( f549_arg0 ), "Customization" )
				Engine.SetModelValue( Engine.CreateModel( f549_local0, "weapon_index" ), "20" )
				Engine.SetModelValue( Engine.CreateModel( f549_local0, "type" ), Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM )
			end
			return f549_local0
		end
	},
	StoreCategoryList = f0_local7( "Store.CategoryList", function ( f550_arg0 )
		local f550_local0 = {}
		local f550_local1 = Engine.GetStoreCategories()
		for f550_local2 = 1, #f550_local1, 1 do
			local f550_local5 = f550_local1[f550_local2]
			if f550_local5.visibility then
				table.insert( f550_local0, {
					models = {
						category = f550_local5.category,
						category_loc_ref = f550_local5.category_loc_ref,
						category_visibility = f550_local5.visibility
					}
				} )
			end
		end
		return f550_local0
	end
	 ),
	StoreProductList = f0_local7( "Store.ProductList", function ( f551_arg0 )
		local f551_local0 = {}
		local f551_local1 = Engine.GetStoreProductsByCategory( f551_arg0, CoD.SelectedStoreCategory )
		for f551_local2 = 1, #f551_local1, 1 do
			local f551_local5 = f551_local1[f551_local2]
			table.insert( f551_local0, {
				models = {
					name = f551_local5.name,
					price = f551_local5.price,
					desc = f551_local5.desc,
					productID = f551_local5.productID,
					skuID = f551_local5.skuID,
					previewImage = f551_local5.previewImage,
					productImage = f551_local5.productImage,
					purchasestatus = f551_local5.purchasestatus,
					serviceLabel = f551_local5.serviceLabel
				}
			} )
		end
		return f551_local0
	end
	 ),
	StoreRoot = {
		getModel = function ( f552_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "StoreRoot" )
		end
	},
	ChooseClassClients = f0_local7( "ChooseClassClients", function ( f553_arg0 )
		local f553_local0 = {}
		local f553_local1 = 1
		local f553_local2 = Engine.GetModel( Engine.GetModelForController( f553_arg0 ), "ChooseClassCPClientMenu" )
		if f553_local2 then
			local f553_local3 = Engine.GetModel( f553_local2, "numActiveClients" )
			if f553_local3 then
				f553_local1 = Engine.GetModelValue( f553_local3 )
			end
		end
		for f553_local3 = 1, f553_local1, 1 do
			table.insert( f553_local0, {
				models = {
					clientIndex = f553_local3
				}
			} )
		end
		return f553_local0
	end
	 ),
	ChooseClassList = {
		prepare = function ( f554_arg0, f554_arg1, f554_arg2 )
			f554_arg1.customClassList = {}
			local f554_local0 = Engine.GetCustomClassCount( f554_arg0 )
			local f554_local1 = Engine.CreateModel( Engine.GetModelForController( f554_arg0 ), "CustomClassList" )
			for f554_local2 = 1, f554_local0, 1 do
				local f554_local5 = f554_local2 - 1
				f554_arg1.customClassList[f554_local2] = {}
				f554_arg1.customClassList[f554_local2].models = Engine.CreateModel( f554_local1, "class" .. f554_local2 )
				CoD.CACUtility.GetCustomClassModel( f554_arg0, f554_local5, f554_arg1.customClassList[f554_local2].models )
				f554_arg1.customClassList[f554_local2].properties = {
					classNum = f554_local2 - 1
				}
			end
		end,
		getCount = function ( f555_arg0 )
			return #f555_arg0.customClassList
		end,
		getItem = function ( f556_arg0, f556_arg1, f556_arg2 )
			return f556_arg1.customClassList[f556_arg2].models
		end,
		getCustomPropertiesForItem = function ( f557_arg0, f557_arg1 )
			return f557_arg0.customClassList[f557_arg1].properties
		end
	},
	ChooseClass_InGame = {
		prepareModelForIndex = function ( f558_arg0, f558_arg1, f558_arg2, f558_arg3 )
			local f558_local0 = nil
			if CanUseSharedLoadouts( f558_arg3 ) then
				local f558_local1 = Engine.GetModel( Engine.GetModelForController( f558_arg3 ), "ChooseClassCPClientMenu" )
				if f558_local1 then
					local f558_local2 = Engine.GetModel( f558_local1, "selectedClientIndex" )
					if f558_local2 then
						local f558_local3 = Engine.GetModel( f558_local1, "client" .. Engine.GetModelValue( f558_local2 ) )
						if f558_local3 then
							f558_local0 = Engine.GetModelValue( Engine.GetModel( f558_local3, "xuid" ) )
						end
					end
				end
			end
			local f558_local1 = Engine.CreateModel( f558_arg0, "class" .. f558_arg1 )
			CoD.CACUtility.GetCustomClassModel( f558_arg3, f558_arg2, f558_local1, f558_local0 )
			return f558_local1
		end,
		prepare = function ( f559_arg0, f559_arg1, f559_arg2 )
			local f559_local0 = CoD.GetTeamID( f559_arg0 )
			local f559_local1 = Engine.GetModel( Engine.GetModelForController( f559_arg0 ), "CustomClassList.prepared" )
			if not f559_local1 then
				f559_local1 = Engine.CreateModel( Engine.GetModelForController( f559_arg0 ), "CustomClassList.prepared" )
				Engine.SetModelValue( f559_local1, -1 )
			end
			local f559_local2 = Engine.GetModelValue( f559_local1 )
			local f559_local3 = false
			local f559_local4 = -1
			local f559_local5 = Engine.GetModel( Engine.GetModelForController( f559_arg0 ), "classSetValue" )
			if f559_local5 then
				f559_local4 = Engine.GetModelValue( f559_local5 )
				if f559_local4 ~= CoD.PrestigeUtility.ChooseClassSets.Default and f559_local4 ~= CoD.PrestigeUtility.ChooseClassSets.Custom then
					f559_local3 = false
				else
					f559_local3 = true
				end
			end
			f559_arg1.customClassCount = Engine.GetCustomClassCount( f559_arg0 )
			local f559_local6 = math.min( math.max( 10 - f559_arg1.customClassCount, 0 ), 5 )
			if f559_local2 ~= f559_local0 or f559_local3 then
				Engine.SetModelValue( f559_local1, f559_local0 )
				CoD.CACUtility.classModels[f559_arg0] = {}
				local f559_local7 = Engine.CreateModel( Engine.GetModelForController( f559_arg0 ), "CustomClassList" )
				f559_arg1.classModels = {}
				if CustomClassesEnabled() and (not f559_local3 or f559_local3 and f559_local4 == CoD.PrestigeUtility.ChooseClassSets.Custom) then
					for f559_local8 = 1, f559_arg1.customClassCount, 1 do
						table.insert( f559_arg1.classModels, {
							models = DataSources.ChooseClass_InGame.prepareModelForIndex( f559_local7, f559_local8, f559_local8 - 1, f559_arg0 ),
							properties = {
								classNum = f559_local8 - 1
							}
						} )
					end
				end
				if IsMultiplayer() then
					if not f559_local3 then
						local f559_local8 = 11
						for f559_local9 = f559_local8, f559_local8 + f559_local6 - 1, 1 do
							table.insert( f559_arg1.classModels, {
								models = DataSources.ChooseClass_InGame.prepareModelForIndex( f559_local7, f559_local9, f559_local9 - 1, f559_arg0 ),
								properties = {
									classNum = f559_local9 - 1
								}
							} )
						end
					elseif f559_local3 and f559_local4 == CoD.PrestigeUtility.ChooseClassSets.Default then
						local f559_local8 = 11
						f559_local6 = 5
						for f559_local9 = f559_local8, f559_local8 + f559_local6 - 1, 1 do
							table.insert( f559_arg1.classModels, {
								models = DataSources.ChooseClass_InGame.prepareModelForIndex( f559_local7, f559_local9, f559_local9 - 1, f559_arg0 ),
								properties = {
									classNum = f559_local9 - 1
								}
							} )
						end
					end
				end
				if IsCampaign() then
					local f559_local8 = CoD.perController[f559_arg0].fieldOpsKitClassNum
					if f559_local8 ~= nil then
						table.insert( f559_arg1.classModels, {
							models = DataSources.ChooseClass_InGame.prepareModelForIndex( f559_local7, f559_arg1.customClassCount + 1, f559_local8 - 1, f559_arg0 ),
							properties = {
								classNum = f559_local8 - 1
							}
						} )
					end
				end
				CoD.CACUtility.classModels[f559_arg0] = f559_arg1.classModels
			elseif CoD.CACUtility.classModels[f559_arg0] then
				f559_arg1.classModels = CoD.CACUtility.classModels[f559_arg0]
				if IsCampaign() then
					local f559_local7 = Engine.GetModel( Engine.GetModelForController( f559_arg0 ), "CustomClassList" )
					local f559_local8 = CoD.perController[f559_arg0].fieldOpsKitClassNum
					if f559_local8 ~= nil then
						if f559_arg1.customClassCount + 1 <= #f559_arg1.classModels then
							f559_arg1.classModels[f559_arg1.customClassCount + 1].models = DataSources.ChooseClass_InGame.prepareModelForIndex( f559_local7, f559_arg1.customClassCount + 1, f559_local8 - 1, f559_arg0 )
							f559_arg1.classModels[f559_arg1.customClassCount + 1].properties.classNum = f559_local8 - 1
						else
							table.insert( f559_arg1.classModels, {
								models = DataSources.ChooseClass_InGame.prepareModelForIndex( f559_local7, f559_arg1.customClassCount + 1, f559_local8 - 1, f559_arg0 ),
								properties = {
									classNum = f559_local8 - 1
								}
							} )
						end
					end
				end
			end
		end,
		getCount = function ( f560_arg0 )
			if f560_arg0.classModels then
				return #f560_arg0.classModels
			else
				return 0
			end
		end,
		getItem = function ( f561_arg0, f561_arg1, f561_arg2 )
			if f561_arg1.classModels then
				return f561_arg1.classModels[f561_arg2].models
			else
				
			end
		end,
		getCustomPropertiesForItem = function ( f562_arg0, f562_arg1 )
			return f562_arg0.classModels[f562_arg1].properties
		end,
		getSpacerAfterRow = function ( f563_arg0, f563_arg1, f563_arg2 )
			if f563_arg1 == f563_arg0.customClassCount then
				return 20
			else
				return 0
			end
		end
	},
	CustomClassMenu = {
		getModel = function ( f564_arg0 )
			local f564_local0 = CoD.perController[f564_arg0].classModel
			Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f564_arg0 ), "CustomClassMenu" ), "currentClassName" ), Engine.GetModelValue( Engine.GetModel( f564_local0, "customClassName" ) ) )
			return f564_local0
		end,
		updateCustomSlotModel = function ( f565_arg0, f565_arg1, f565_arg2 )
			local f565_local0 = Engine.GetModel( f565_arg0, f565_arg1 )
			if f565_local0 == nil then
				return 
			elseif Engine.GetModelValue( Engine.GetModel( f565_local0, "itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
				local f565_local1 = f565_arg1 .. "attachment1"
				local f565_local2 = Engine.GetModel( f565_arg0, f565_local1 )
				if f565_local2 and Engine.GetModelValue( Engine.GetModel( f565_local2, "itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
					Engine.SetModelValue( Engine.CreateModel( f565_local2, "name" ), Engine.GetModelValue( Engine.GetModel( f565_local0, "name" ) ) )
					Engine.SetModelValue( Engine.CreateModel( f565_local2, "image" ), Engine.GetModelValue( Engine.GetModel( f565_local0, "image" ) ) )
					Engine.SetModelValue( Engine.CreateModel( f565_local2, "desc" ), Engine.GetModelValue( Engine.GetModel( f565_local0, "desc" ) ) )
					Engine.SetModelValue( Engine.CreateModel( f565_local2, "itemIndex" ), 1 )
					Engine.SetModelValue( Engine.CreateModel( f565_local2, "weaponSlot" ), f565_local1 )
				end
			end
		end,
		updateWeaponAttachmentList = function ( f566_arg0, f566_arg1, f566_arg2, f566_arg3 )
			local f566_local0 = Engine.GetModel( f566_arg1, f566_arg2 )
			if not f566_local0 then
				return 
			end
			local f566_local1 = function ( f567_arg0, f567_arg1, f567_arg2, f567_arg3, f567_arg4 )
				local f567_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
				local f567_local1 = Engine.CreateModel( f567_arg0, "cust" .. f566_arg2 .. "weaponattachment" .. f567_arg1 )
				Engine.SetModelValue( Engine.CreateModel( f567_local1, "name" ), Engine.GetAttachmentName( f567_arg3, f567_arg4, f567_local0 ) )
				Engine.SetModelValue( Engine.CreateModel( f567_local1, "image" ), Engine.GetAttachmentImageByWeaponAndAttachIndex( f567_arg3, f567_arg4, f567_local0 ) )
				Engine.SetModelValue( Engine.CreateModel( f567_local1, "weaponSlot" ), f566_arg2 .. "attachment" .. f567_arg2 )
				Engine.SetModelValue( Engine.CreateModel( f567_local1, "ref" ), Engine.GetAttachmentRef( f567_arg3, f567_arg4, f567_local0 ) )
			end
			
			if f566_arg2 == "primary" or f566_arg2 == "secondary" then
				local f566_local2 = Engine.GetModel( f566_local0, "itemIndex" )
				if f566_local2 then
					for f566_local3 = 1, f566_arg3, 1 do
						local f566_local6 = Engine.GetModel( f566_local0, "cust" .. f566_arg2 .. "weaponattachment" .. f566_local3 )
						if f566_local6 then
							Engine.UnsubscribeAndFreeModel( f566_local6 )
						end
					end
					local f566_local3 = Engine.GetModelValue( f566_local2 )
					if f566_local3 > CoD.CACUtility.EmptyItemIndex then
						local f566_local4 = 1
						local f566_local5 = CoD.CACUtility.GetAttachmentListForSlot( f566_arg2 )
						for f566_local9, f566_local10 in ipairs( f566_local5 ) do
							local f566_local11 = CoD.CACUtility.GetItemEquippedInSlot( f566_local10, f566_arg0, f566_arg1 )
							if f566_local11 > CoD.CACUtility.EmptyItemIndex then
								f566_local1( f566_local0, f566_local4, f566_local9, f566_local3, f566_local11 )
								f566_local4 = f566_local4 + 1
							end
						end
						for f566_local7 = f566_local4, #f566_local5, 1 do
							local f566_local11 = Engine.CreateModel( f566_local0, "cust" .. f566_arg2 .. "weaponattachment" .. f566_local7 )
						end
					end
				end
			end
		end
	},
	ResetDefaultClass = {
		prepare = function ( f568_arg0, f568_arg1, f568_arg2 )
			f568_arg1.resetDefaultClassList = {}
			local f568_local0 = Engine.CreateModel( Engine.GetModelForController( f568_arg0 ), "ResetDefaultClassList" )
			for f568_local1 = 1, CoD.CACUtility.maxDefaultClass, 1 do
				f568_arg1.resetDefaultClassList[f568_local1] = Engine.CreateModel( f568_local0, "DefaultClass" .. f568_local1 )
				Engine.SetModelValue( Engine.CreateModel( f568_arg1.resetDefaultClassList[f568_local1], "customClassName" ), Engine.Localize( "CLASS_SLOT" .. f568_local1 ) )
				Engine.SetModelValue( Engine.CreateModel( f568_arg1.resetDefaultClassList[f568_local1], "index" ), f568_local1 )
			end
		end,
		getCount = function ( f569_arg0 )
			return #f569_arg0.resetDefaultClassList
		end,
		getItem = function ( f570_arg0, f570_arg1, f570_arg2 )
			return f570_arg1.resetDefaultClassList[f570_arg2]
		end
	},
	PaintshopWeaponTabType = f0_local7( "Paintshop.PaintshopWeaponTabType", function ( f571_arg0 )
		local f571_local0 = {}
		table.insert( f571_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f571_local4, f571_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
			table.insert( f571_local0, {
				models = {
					tabName = Engine.Localize( f571_local5.name )
				},
				properties = {
					filter = f571_local5.weapon_category
				}
			} )
		end
		table.insert( f571_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f571_local0
	end
	 ),
	EmblemMaterialTabType = f0_local7( "Emblem.EmblemMaterialTabType", function ( f572_arg0 )
		local f572_local0 = {}
		table.insert( f572_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f572_local11, f572_local12 in ipairs( CoD.emblem.MaterialCategory ) do
			if f572_local12.type ~= "camo" or IsBooleanDvarSet( "enable_camo_materials_tab" ) then
				local f572_local4 = 0
				local f572_local5 = Engine.GetEmblemMaterialFilterCount( f572_arg0, f572_local12.category )
				for f572_local6 = 0, f572_local5 - 1, 1 do
					local f572_local9 = Engine.GetEmblemMaterialIDByIndex( f572_arg0, f572_local12.category, f572_local6 )
					local f572_local10 = false
					if f572_local12.category == CoD.emblem.BlackMarketEmblemCategory then
						f572_local10 = CoD.BlackMarketUtility.IsItemLocked( f572_arg0, Engine.GetEmblemMaterialName( f572_local9 ) )
					end
					if not f572_local10 and CoD.CraftUtility.Emblems.IsMaterialNew( f572_arg0, f572_local9 ) then
						f572_local4 = f572_local4 + 1
					end
				end
				table.insert( f572_local0, {
					models = {
						tabName = Engine.Localize( f572_local12.name ),
						breadcrumbCount = f572_local4
					},
					properties = {
						filter = f572_local12.category
					}
				} )
			end
		end
		table.insert( f572_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f572_local0
	end
	 ),
	CACCustomizationTabs = DataSourceHelpers.ListSetup( "CACCustomizationTabs", function ( f573_arg0 )
		local f573_local0 = {}
		local f573_local1 = CoD.perController[f573_arg0].gunsmithCamoIndexModel
		if f573_local1 then
			f573_local1 = not CoD.perController[f573_arg0].editingWeaponBuildKits
		end
		local f573_local2 = Engine.CurrentSessionMode()
		local f573_local3 = CoD.CACUtility.EmptyItemIndex
		if CoD.perController[f573_arg0].gunsmithCamoIndexModel or CoD.perController[f573_arg0].gunsmithReticleIndexModel or CoD.perController[f573_arg0].editingWeaponBuildKits then
			f573_local3 = CoD.GetCustomization( f573_arg0, "weapon_index" )
		else
			f573_local3 = CoD.CACUtility.GetItemEquippedInSlot( CoD.perController[f573_arg0].weaponCategory, f573_arg0, CoD.perController[f573_arg0].classModel )
		end
		local f573_local4 = ""
		if f573_local2 < Enum.eModes.MODE_COUNT then
			f573_local4 = Engine.GetItemRef( f573_local3, f573_local2 )
		else
			f573_local4 = Engine.GetItemRef( f573_local3, Enum.eModes.MODE_MULTIPLAYER )
		end
		local f573_local5 = function ( f574_arg0, f574_arg1 )
			local f574_local0 = false
			if f574_arg1 < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
				if f574_arg1 == f573_local2 then
					f574_local0 = not f573_local1
				else
					f574_local0 = false
				end
			end
			table.insert( f573_local0, {
				models = {
					tabName = f574_arg0,
					tabIcon = "",
					breadcrumbCount = 0
				},
				properties = {
					filterEnum = f574_arg1,
					filterString = CoD.WeaponOptionFilterToString( f574_arg1 ),
					selectIndex = f574_local0
				}
			} )
		end
		
		table.insert( f573_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if CoD.perController[f573_arg0].customizationType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
			f573_local5( "MENU_CAMPAIGN_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP )
			f573_local5( "MENU_MULTIPLAYER_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP )
			f573_local5( "MENU_ZOMBIES_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM )
			if IsLive() then
				f573_local5( "MENU_BLACK_MARKET", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM )
			end
		else
			if CoD.CACUtility.WeaponsWithNoCPCamos[f573_local4] == nil then
				f573_local5( "MENU_CAMPAIGN_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP )
			end
			if not IsLive() or CoD.CACUtility.WeaponsWithNoMPCamos[f573_local4] == nil then
				f573_local5( "MENU_MULTIPLAYER_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP )
			end
			if not IsLive() or CoD.CACUtility.WeaponsWithNoZMCamos[f573_local4] == nil then
				f573_local5( "MENU_ZOMBIES_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM )
			end
			if IsLive() and CoD.BlackMarketUtility.WeaponsWithNoBMCamos[f573_local4] == nil then
				f573_local5( "MENU_BLACK_MARKET", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM )
			end
		end
		f573_local5( "MENU_EXTRAS_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS )
		table.insert( f573_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f573_local0
	end
	, false ),
	GunsmithWeaponAttachments = f0_local7( "GunsmithWeaponAttachments", function ( f575_arg0 )
		local f575_local0 = {}
		local f575_local1 = CoD.CraftUtility.GetCraftMode()
		if CoD.perController[f575_arg0].gunsmithAttachmentIsZombieMode == "true" then
			f575_local1 = Enum.eModes.MODE_ZOMBIES
		end
		local f575_local2 = CoD.GetCustomization( f575_arg0, "weapon_index" )
		local f575_local3 = Engine.GetNumAttachments( f575_local2, f575_local1 )
		local f575_local4 = CoD.perController[f575_arg0].gunsmithAttachmentType
		local f575_local5 = Engine.GetModelValue( CoD.perController[f575_arg0].gunsmithAttachmentModel )
		local f575_local6 = CoD.perController[f575_arg0].gunsmithVariantModel
		local f575_local7 = CoD.GetCustomization( f575_arg0, "weapon_ref" )
		local f575_local8 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
		local f575_local9 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
		local f575_local10 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
		local f575_local11 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
		local f575_local12 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
		local f575_local13 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
		local f575_local14 = "gamedata/weapons/mp/mp_attributesTable.csv"
		local f575_local15 = {
			damage = 0,
			range = 0,
			fireRate = 0,
			accuracy = 0
		}
		local f575_local16 = {}
		for f575_local17 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f575_local20 = Engine.GetModelValue( Engine.GetModel( f575_local6, "attachment" .. f575_local17 ) )
			if f575_local5 ~= f575_local20 and CoD.CACUtility.EmptyItemIndex < f575_local20 then
				local f575_local21 = Engine.GetAttachmentRefByIndex( f575_local20 )
				table.insert( f575_local16, f575_local21 )
				local f575_local22 = Engine.TableLookup( nil, f575_local14, f575_local8, f575_local21, f575_local9, f575_local7, f575_local10 )
				local f575_local23 = Engine.TableLookup( nil, f575_local14, f575_local8, f575_local21, f575_local9, f575_local7, f575_local11 )
				local f575_local24 = Engine.TableLookup( nil, f575_local14, f575_local8, f575_local21, f575_local9, f575_local7, f575_local12 )
				local f575_local25 = Engine.TableLookup( nil, f575_local14, f575_local8, f575_local21, f575_local9, f575_local7, f575_local13 )
				local f575_local26 = f575_local15.damage
				local f575_local27
				if f575_local22 == "" then
					f575_local27 = 0
					if not f575_local27 then
					
					else
						f575_local15.damage = f575_local26 + f575_local27
						f575_local26 = f575_local15.range
						if f575_local23 == "" then
							f575_local27 = 0
							if not f575_local27 then
							
							else
								f575_local15.range = f575_local26 + f575_local27
								f575_local26 = f575_local15.fireRate
								if f575_local24 == "" then
									f575_local27 = 0
									if not f575_local27 then
									
									else
										f575_local15.fireRate = f575_local26 + f575_local27
										f575_local26 = f575_local15.accuracy
										if f575_local25 == "" then
											f575_local27 = 0
											if not f575_local27 then
											
											else
												f575_local15.accuracy = f575_local26 + f575_local27
											end
										end
										f575_local27 = f575_local25
									end
								end
								f575_local27 = f575_local24
							end
						end
						f575_local27 = f575_local23
					end
				end
				f575_local27 = f575_local22
			end
		end
		local f575_local17 = Engine.GetModelForController( f575_arg0 )
		for f575_local18 = 1, f575_local3 - 1, 1 do
			local f575_local21 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
			local f575_local22 = nil
			if IsToggleVariantEnabled() then
				f575_local22 = Engine.Localize( "MENU_BUTTON_EMBLEM_ACV" )
			end
			if f575_local4 == "attachment" then
				if Engine.IsOptic( f575_local2, f575_local18, f575_local1 ) == false then
					f575_local21 = Engine.GetItemAttachment( f575_local2, f575_local18, f575_local1 )
				end
			elseif f575_local4 == "optic" and Engine.IsOptic( f575_local2, f575_local18, f575_local1 ) == true then
				f575_local22 = nil
				f575_local21 = Engine.GetItemAttachment( f575_local2, f575_local18, f575_local1 )
			end
			if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f575_local21 and Engine.GetAttachmentAllocationCost( f575_local2, f575_local18, f575_local1 ) > 0 then
				local f575_local24 = Engine.GetAttachmentRef( f575_local2, f575_local18, f575_local1 )
				local f575_local25 = Engine.GetAttachmentNameByIndex( f575_local21 )
				local f575_local26 = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, f575_local2, f575_local21 )
				local f575_local27 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
				local f575_local29 = Engine.GetModel( Engine.GetGlobalModel(), "CraftWeaponList" )
				if Enum.eModes.MODE_ZOMBIES == Engine.CurrentSessionMode() then
					CoD.GetUnlockablesTable( f575_arg0 )
					f575_local29 = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" )
				end
				local f575_local30 = Engine.GetModel( f575_local29, f575_local2 .. ".weaponAttributes" )
				local f575_local31 = function ( f576_arg0, f576_arg1 )
					local f576_local0 = Engine.GetModelValue( Engine.GetModel( f575_local30, f576_arg0 ) )
					local f576_local1 = Engine.TableLookup( nil, f575_local14, f575_local8, f575_local24, f575_local9, f575_local7, f576_arg1 )
					if f576_local0 == "" then
						f576_local0 = 0
					end
					if f576_local1 == "" then
						f576_local1 = 0
					end
					local f576_local2 = false
					for f576_local6, f576_local7 in ipairs( f575_local16 ) do
						if f576_local7 == f575_local24 then
							f576_local2 = true
							break
						end
					end
					f576_local3 = f576_local0 + f575_local15[f576_arg0]
					if not f576_local2 then
						f576_local3 = f576_local3 + f576_local1
					end
					return f576_local0 .. "," .. f576_local3
				end
				
				table.insert( f575_local0, {
					models = {
						name = f575_local25,
						image = f575_local26,
						itemIndex = f575_local18,
						weaponIndex = f575_local2,
						attachmentIndex = f575_local21,
						description = Engine.GetAttachmentDesc( f575_local2, f575_local18, f575_local1 ),
						acvIndex = f575_local27,
						weaponAttributes = {
							damage = f575_local31( "damage", f575_local10 ),
							range = f575_local31( "range", f575_local11 ),
							fireRate = f575_local31( "fireRate", f575_local12 ),
							accuracy = f575_local31( "accuracy", f575_local13 )
						},
						hintText = f575_local22
					},
					properties = {
						selectIndex = f575_local5 == f575_local21
					}
				} )
			end
		end
		return f575_local0
	end
	, true ),
	GunsmithVariantList = {
		prepare = function ( f577_arg0, f577_arg1, f577_arg2 )
			f577_arg1.controller = f577_arg0
			local f577_local0 = CoD.GetCustomization( f577_arg0, "weapon_index" )
			if not f577_local0 then
				return 
			end
			f577_arg1.variantListModel = Engine.CreateModel( Engine.GetModelForController( f577_arg0 ), "Gunsmith.VariantList" )
			local f577_local1 = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
			local f577_local2 = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( f577_local0 )
			if f577_local1 == CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints() then
				f577_arg1.totalVariants = f577_local2
			else
				f577_arg1.totalVariants = f577_local2 + 1
			end
			f577_arg1.variantList = {}
			f577_arg1.variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f577_local0 )
		end,
		getCount = function ( f578_arg0 )
			return f578_arg0.totalVariants
		end,
		createVariantModel = function ( f579_arg0, f579_arg1, f579_arg2, f579_arg3, f579_arg4 )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "variantIndex" ), f579_arg2.variantIndex )
			local f579_local0 = CoD.GetCustomization( f579_arg0, "weapon_index" )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "weaponIndex" ), f579_local0 )
			if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f579_arg2.variantIndex ) then
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "variantName" ), f579_arg2.variantName )
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "variantNameBig" ), f579_arg2.variantName )
			else
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "variantName" ), Engine.Localize( "MENU_GUNSMITH_CREATE_VARIANT" ) )
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "variantNameBig" ), "" )
			end
			for f579_local4, f579_local5 in ipairs( f579_arg2.attachment ) do
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "attachment" .. f579_local4 ), f579_local5 )
			end
			for f579_local4, f579_local5 in ipairs( f579_arg2.attachmentVariant ) do
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "attachmentVariant" .. f579_local4 ), f579_local5 )
			end
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "reticleIndex" ), f579_arg2.reticleIndex )
			f579_local1 = "Gunsmith.VariantList.Variant" .. f579_arg1 .. "AttachmentList"
			DataSources[f579_local1] = CoD.CraftUtility.Gunsmith.GetAttachmentIconList( f579_arg0, f579_local1, f579_local0, f579_arg2.attachment )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "listDataSource" ), f579_local1 )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "sortIndex" ), f579_arg3 )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "paintjobSlot" ), f579_arg2.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "paintjobIndex" ), f579_arg2.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "camoIndex" ), f579_arg2.camoIndex )
			Engine.SetModelValue( Engine.CreateModel( f579_arg4, "paintjobSlotAndIndex" ), f579_arg2.paintjobSlot .. " " .. f579_arg2.paintjobIndex )
			if Engine.LastInput_Gamepad() then
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "hintText" ), Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
			elseif CoD.isPC then
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "hintText" ), Engine.Localize( "PLATFORM_GUNSMITH_PERSONALIZE_PROMPT" ) )
			end
			if f579_arg2.readOnly ~= nil then
				Engine.SetModelValue( Engine.CreateModel( f579_arg4, "readOnly" ), f579_arg2.readOnly )
			end
		end,
		getItem = function ( f580_arg0, f580_arg1, f580_arg2 )
			local f580_local0 = Engine.CreateModel( f580_arg1.variantListModel, "variant_" .. f580_arg2 )
			DataSources.GunsmithVariantList.createVariantModel( f580_arg0, f580_arg2, CoD.CraftUtility.Gunsmith.GetVariantByIndex( f580_arg0, f580_arg1.variantList[f580_arg2].variantIndex ), f580_arg1.variantList[f580_arg2].sortIndex, f580_local0 )
			return f580_local0
		end
	},
	GunsmithWeaponTabType = f0_local7( "Gunsmith.GunsmithWeaponTabType", function ( f581_arg0 )
		local f581_local0 = {}
		table.insert( f581_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f581_local4, f581_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
			table.insert( f581_local0, {
				models = {
					tabName = Engine.Localize( f581_local5.name )
				},
				properties = {
					filter = f581_local5.weapon_category,
					loadoutType = f581_local5.loadout_type
				}
			} )
		end
		table.insert( f581_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f581_local0
	end
	 ),
	GunsmithSelectedVariantAttachmentIconList = {
		getModel = function ( f582_arg0 )
			local f582_local0 = CoD.GetCustomization( f582_arg0, "weapon_index" )
			local f582_local1 = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( f582_arg0, CoD.perController[f582_arg0].gunsmithVariantModel )
			local f582_local2 = Engine.CreateModel( Engine.GetModelForController( f582_arg0 ), "Gunsmith.GunsmithSelectedVariantAttachmentIconList" )
			local f582_local3 = "Gunsmith.AttachmentIconList"
			DataSources[f582_local3] = CoD.CraftUtility.Gunsmith.GetAttachmentIconList( f582_arg0, f582_local3, f582_local0, f582_local1.baseAttachmentList )
			Engine.SetModelValue( Engine.CreateModel( f582_local2, "listDataSource" ), f582_local3 )
			return f582_local2
		end
	},
	GunsmithSelectedItemProperties = {
		getModel = function ( f583_arg0 )
			local f583_local0 = Engine.CreateModel( Engine.GetModelForController( f583_arg0 ), "Gunsmith.GunsmithSelectedItemProperties" )
			Engine.SetModelValue( Engine.CreateModel( f583_local0, "itemName" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f583_local0, "title" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f583_local0, "attachmentType" ), "" )
			return f583_local0
		end
	},
	FileshareRoot = {
		getModel = function ( f584_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
		end
	},
	FileshareSelectedItem = {
		getModel = function ( f585_arg0 )
			return CoD.FileshareUtility.GetSelectedItem()
		end
	},
	FileshareShowcaseManagerTabs = f0_local7( "FileshareShowcaseManagerTabs", function ( f586_arg0 )
		local f586_local0 = {}
		table.insert( f586_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		local f586_local1 = CoD.FileshareUtility.GetCurrentCategory()
		for f586_local7, f586_local8 in ipairs( CoD.FileshareUtility.ShowcaseManagerTabs ) do
			local f586_local5 = f586_local8.selectIndex
			local f586_local6 = f586_local8.disabled
			if f586_local8.fileshareCategory == f586_local1 then
				f586_local5 = true
				f586_local6 = false
			else
				f586_local5 = false
			end
			table.insert( f586_local0, {
				models = {
					tabName = Engine.Localize( Engine.TableLookup( 0, CoD.fileShareTable, 1, f586_local8.fileshareCategory, 8 ) .. "_CAPS" )
				},
				properties = {
					disabled = f586_local6,
					fileshareCategory = f586_local8.fileshareCategory,
					fileshareKey = f586_local8.fileshareKey,
					fileshareVal = f586_local8.fileshareVal,
					selectIndex = f586_local5
				}
			} )
		end
		table.insert( f586_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f586_local0
	end
	 ),
	FilesharePublishedPaintjobTabs = f0_local7( "FilesharePublishedPaintjobTabs", function ( f587_arg0 )
		local f587_local0 = {}
		table.insert( f587_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f587_local4, f587_local5 in ipairs( CoD.FileshareUtility.PublishedPaintjobsTabs ) do
			table.insert( f587_local0, {
				models = {
					tabName = Engine.Localize( f587_local5.name )
				},
				properties = {
					filter = f587_local5.weapon_category,
					loadoutType = f587_local5.loadout_type,
					disabled = f587_local5.disabled,
					fileshareGroup = f587_local5.fileshareGroup,
					fileshareCategory = f587_local5.fileshareCategory,
					fileshareKey = f587_local5.fileshareKey,
					fileshareVal = f587_local5.fileshareVal
				}
			} )
		end
		table.insert( f587_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f587_local0
	end
	 ),
	FilesharePublishedVariantsTabs = f0_local7( "FilesharePublishedVariantsTabs", function ( f588_arg0 )
		local f588_local0 = {}
		table.insert( f588_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f588_local4, f588_local5 in ipairs( CoD.FileshareUtility.PublishedVariantsTabs ) do
			table.insert( f588_local0, {
				models = {
					tabName = Engine.Localize( f588_local5.name )
				},
				properties = {
					filter = f588_local5.weapon_category,
					loadoutType = f588_local5.loadout_type,
					disabled = f588_local5.disabled,
					fileshareGroup = f588_local5.fileshareGroup,
					fileshareCategory = f588_local5.fileshareCategory,
					fileshareKey = f588_local5.fileshareKey,
					fileshareVal = f588_local5.fileshareVal
				}
			} )
		end
		table.insert( f588_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f588_local0
	end
	 ),
	EmblemDecalTabs = f0_local7( "EmblemDecalTabs", function ( f589_arg0 )
		local f589_local0 = {}
		table.insert( f589_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f589_local8, f589_local9 in ipairs( CoD.emblem.DECALTABS ) do
			local f589_local6 = 0
			local f589_local10 = Engine.EmblemFilterCount( f589_arg0, 0, f589_local9.category )
			for f589_local7 = 0, f589_local10 - 1, 1 do
				local f589_local4 = Engine.EmblemFilterIconID( f589_arg0, 0, f589_local9.category, f589_local7 )
				local f589_local5 = false
				if f589_local9.type == "BLACKMARKET" then
					f589_local5 = CoD.BlackMarketUtility.IsItemLocked( f589_arg0, CoD.BlackMarketUtility.GetLootDecalName( f589_arg0, f589_local4 ) )
				end
				if not f589_local5 and Engine.IsEmblemIconNew( f589_arg0, f589_local4 ) then
					f589_local6 = f589_local6 + 1
				end
			end
			table.insert( f589_local0, {
				models = {
					tabName = Engine.Localize( f589_local9.displayName ),
					breadcrumbCount = f589_local6
				},
				properties = {
					tabCategory = f589_local9.category
				}
			} )
		end
		table.insert( f589_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f589_local0
	end
	 ),
	EmblemCategoryTabs = f0_local7( "EmblemCategoryTabs", function ( f590_arg0 )
		local f590_local0 = {}
		if IsLive() then
			table.insert( f590_local0, {
				models = {
					tabIcon = CoD.buttonStrings.shoulderl
				},
				properties = {
					m_mouseDisabled = true
				}
			} )
			for f590_local7, f590_local8 in ipairs( CoD.CraftUtility.Emblems.CATEGORYTAB ) do
				local f590_local5 = 0
				local f590_local9 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f590_arg0, f590_local8.storageType )
				for f590_local6 = 0, f590_local9 - 1, 1 do
					local f590_local4 = false
					if f590_local8.storageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
						f590_local4 = CoD.BlackMarketUtility.IsItemLocked( f590_arg0, CoD.BlackMarketUtility.GetLootEmblemIDName( f590_arg0, f590_local6 ) )
					end
					if not f590_local4 and CoD.CraftUtility.Emblems.IsEmblemNew( f590_arg0, f590_local6, f590_local8.storageType ) then
						f590_local5 = f590_local5 + 1
					end
				end
				table.insert( f590_local0, {
					models = {
						tabName = Engine.Localize( f590_local8.displayName ),
						breadcrumbCount = f590_local5
					},
					properties = {
						tabCategory = f590_local8.category,
						tabType = f590_local8.type,
						storageType = f590_local8.storageType
					}
				} )
			end
			table.insert( f590_local0, {
				models = {
					tabIcon = CoD.buttonStrings.shoulderr
				},
				properties = {
					m_mouseDisabled = true
				}
			} )
		end
		return f590_local0
	end
	 ),
	MediaManagerQuotaList = {
		prepare = function ( f591_arg0, f591_arg1, f591_arg2 )
			f591_arg1.controller = f591_arg0
			f591_arg1.rootModel = Engine.CreateModel( Engine.GetModelForController( f591_arg0 ), "MediaManagerQuota" )
			f591_arg1.numFileshareCategories = Engine.GetTableRowCount( CoD.fileShareTable )
		end,
		getCount = function ( f592_arg0 )
			return f592_arg0.numFileshareCategories
		end,
		getItem = function ( f593_arg0, f593_arg1, f593_arg2 )
			local f593_local0 = Engine.CreateModel( f593_arg1.rootModel, "fileshareCateogory_" .. f593_arg2 )
			local f593_local1 = Engine.TableGetColumnValueForRow( CoD.fileShareTable, f593_arg2 - 1, 1 )
			local f593_local2 = Engine.MediaManagerGetQuota( f593_arg1.controller, f593_local1 )
			local f593_local3 = 0
			if f593_local2.categoryQuota > 0 then
				f593_local3 = f593_local2.categorySlotsUsed / f593_local2.categoryQuota
			end
			if f593_local3 > 1 then
				f593_local3 = 1
			elseif f593_local3 < 0 then
				f593_local3 = 0
			end
			Engine.SetModelValue( Engine.CreateModel( f593_local0, "category" ), f593_local2.category )
			Engine.SetModelValue( Engine.CreateModel( f593_local0, "locName" ), Engine.TableLookup( 0, CoD.fileShareTable, 1, f593_local2.category, 8 ) )
			Engine.SetModelValue( Engine.CreateModel( f593_local0, "quota" ), f593_local2.categoryQuota )
			Engine.SetModelValue( Engine.CreateModel( f593_local0, "slotsUsed" ), f593_local2.categorySlotsUsed )
			Engine.SetModelValue( Engine.CreateModel( f593_local0, "fraction" ), f593_local3 )
			Engine.SetModelValue( Engine.CreateModel( f593_local0, "image" ), CoD.FileshareUtility.GetCategoryImage( f593_local1 ) )
			Engine.SetModelValue( Engine.CreateModel( f593_local0, "barColor" ), CoD.FileshareUtility.GetCategoryColor( f593_local1 ) )
			if f593_local2.category == CoD.FileshareUtility.GetCurrentCategory() then
				Engine.SetModelValue( Engine.CreateModel( f593_local0, "isDim" ), false )
			else
				Engine.SetModelValue( Engine.CreateModel( f593_local0, "isDim" ), true )
			end
			return f593_local0
		end
	},
	FileshareQuotaList = {
		prepare = function ( f594_arg0, f594_arg1, f594_arg2 )
			f594_arg1.controller = f594_arg0
			f594_arg1.rootModel = Engine.CreateModel( Engine.GetModelForController( f594_arg0 ), "FileshareQuota" )
			f594_arg1.numFileshareCategories = Engine.GetTableRowCount( CoD.fileShareTable )
		end,
		getCount = function ( f595_arg0 )
			return f595_arg0.numFileshareCategories
		end,
		getItem = function ( f596_arg0, f596_arg1, f596_arg2 )
			local f596_local0 = Engine.CreateModel( f596_arg1.rootModel, "fileshareCateogory_" .. f596_arg2 )
			local f596_local1 = Engine.TableGetColumnValueForRow( CoD.fileShareTable, f596_arg2 - 1, 1 )
			local f596_local2 = Engine.FileshareGetQuota( f596_arg1.controller, f596_local1 )
			local f596_local3 = 0
			if f596_local2.categoryQuota > 0 then
				f596_local3 = f596_local2.categorySlotsUsed / f596_local2.categoryQuota
			end
			if f596_local3 > 1 then
				f596_local3 = 1
			elseif f596_local3 < 0 then
				f596_local3 = 0
			end
			Engine.SetModelValue( Engine.CreateModel( f596_local0, "category" ), f596_local2.category )
			Engine.SetModelValue( Engine.CreateModel( f596_local0, "locName" ), Engine.TableLookup( 0, CoD.fileShareTable, 1, f596_local2.category, 8 ) )
			Engine.SetModelValue( Engine.CreateModel( f596_local0, "quota" ), f596_local2.categoryQuota )
			Engine.SetModelValue( Engine.CreateModel( f596_local0, "slotsUsed" ), f596_local2.categorySlotsUsed )
			Engine.SetModelValue( Engine.CreateModel( f596_local0, "fraction" ), f596_local3 )
			Engine.SetModelValue( Engine.CreateModel( f596_local0, "image" ), CoD.FileshareUtility.GetCategoryImage( f596_local1 ) )
			Engine.SetModelValue( Engine.CreateModel( f596_local0, "barColor" ), CoD.FileshareUtility.GetCategoryColor( f596_local1 ) )
			if f596_local2.category == CoD.FileshareUtility.GetCurrentCategory() then
				Engine.SetModelValue( Engine.CreateModel( f596_local0, "isDim" ), false )
			else
				Engine.SetModelValue( Engine.CreateModel( f596_local0, "isDim" ), true )
			end
			return f596_local0
		end
	},
	FilesharePublishedList = {
		prepare = function ( f597_arg0, f597_arg1, f597_arg2 )
			f597_arg1.controller = f597_arg0
			if f597_arg1.vCount == 1 then
				f597_arg1.prepared = false
				return 
			end
			f597_arg1.numElements = f597_arg1.vCount * f597_arg1.hCount
			f597_arg1.hasCreateButton = CoD.FileshareUtility.GetShowCreateButton()
			f597_arg1.fileshareRootModel = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
			f597_arg1.fileshareData = {}
			for f597_local0 = 1, f597_arg1.numElements, 1 do
				f597_arg1.fileshareData[f597_local0] = {}
				f597_arg1.fileshareData[f597_local0].elementModel = Engine.CreateModel( f597_arg1.fileshareRootModel, "fileshareData_" .. f597_local0 )
				for f597_local6, f597_local7 in ipairs( CoD.FileshareUtility.FileProperties ) do
					Engine.CreateModel( f597_arg1.fileshareData[f597_local0].elementModel, f597_local7 )
				end
			end
			Engine.FileshareStartup( f597_arg1.controller )
			CoD.FileshareUtility.SetShowFileDetails( false )
			CoD.FileshareUtility.SetShowPublishNewDetails( false )
		end,
		getCount = function ( f598_arg0 )
			if f598_arg0.numElements == nil then
				return 0
			elseif not Engine.FileshareIsReady( f598_arg0.controller ) then
				return 0
			end
			local f598_local0 = CoD.FileshareUtility.GetCurrentCategory()
			local f598_local1 = CoD.FileshareUtility.GetIsCommunityMode( f598_arg0.controller )
			local f598_local2, f598_local3 = CoD.FileshareUtility.GetCurrentFilter()
			if f598_local0 == nil then
				return 0
			end
			local f598_local4 = 0
			if not (not f598_local1 or f598_local1 ~= true) or f598_local0 == "film" then
				f598_local4 = Engine.FileshareGetTotalUsedCommunitySlotCount( f598_arg0.controller, f598_local0, f598_local2, f598_local3 )
			else
				f598_local4 = Engine.FileshareGetSlotCount( f598_arg0.controller, f598_local0, f598_local2, f598_local3 )
			end
			CoD.FileshareUtility.SetItemsCount( f598_arg0.controller, f598_local4 )
			if f598_arg0.hasCreateButton == true then
				return f598_local4 + 1
			end
			return f598_local4
		end,
		getItem = function ( f599_arg0, f599_arg1, f599_arg2 )
			local f599_local0 = f599_arg2 - 1
			local f599_local1 = f599_local0 % f599_arg1.numElements + 1
			local f599_local2 = f599_arg2 % f599_arg1.numElements
			local f599_local3 = Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, "isPublishNew" )
			local f599_local4 = Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, "showPlusImage" )
			local f599_local5 = Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, "showFileImage" )
			local f599_local6 = Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, "fileImage" )
			local f599_local7 = Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, "fileId" )
			local f599_local8 = Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, "renderFileId" )
			Engine.SetModelValue( Engine.CreateModel( f599_arg1.fileshareData[f599_local1].elementModel, "uiModelIndex" ), f599_local1 )
			if f599_arg1.hasCreateButton == true then
				f599_local0 = f599_local0 - 1
			end
			if f599_arg1.hasCreateButton == true and f599_arg2 == 1 then
				Engine.SetModelValue( f599_local3, true )
				Engine.SetModelValue( f599_local4, 1 )
				Engine.SetModelValue( f599_local6, "" )
				Engine.SetModelValue( f599_local5, 0 )
				Engine.SetModelValue( f599_local7, 0 )
				Engine.SetModelValue( f599_local8, 0 )
				local f599_local9 = CoD.FileshareUtility.GetInShowcaseManager( f599_arg0 )
				local f599_local10 = Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, "fileName" )
				if f599_local9 and f599_local9 == true then
					Engine.SetModelValue( f599_local10, "MENU_FILESHARE_BUY_SLOTS" )
				else
					Engine.SetModelValue( f599_local10, "MENU_FILESHARE_PUBLISH_NEW" )
				end
			else
				Engine.SetModelValue( f599_local3, false )
				Engine.SetModelValue( f599_local6, "" )
				Engine.SetModelValue( f599_local4, 0 )
				Engine.SetModelValue( f599_local5, 1 )
				local f599_local9 = CoD.FileshareUtility.GetCurrentCategory()
				local f599_local10 = CoD.FileshareUtility.GetIsCommunityMode( f599_arg1.controller )
				local f599_local11, f599_local12 = CoD.FileshareUtility.GetCurrentFilter()
				local f599_local13 = nil
				if not (not f599_local10 or f599_local10 ~= true) or f599_local9 == "film" then
					f599_local13 = Engine.FileshareGetCommunitySlotData( f599_arg1.controller, f599_local9, f599_local11, f599_local12, f599_local0 )
				else
					f599_local13 = Engine.FileshareGetSlotData( f599_arg1.controller, f599_local9, f599_local11, f599_local12, f599_local0 )
				end
				for f599_local17, f599_local18 in ipairs( CoD.FileshareUtility.FileProperties ) do
					if f599_local13[f599_local18] ~= nil then
						Engine.SetModelValue( Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, f599_local18 ), f599_local13[f599_local18] )
					end
				end
				f599_local14 = Engine.GetFileshareWeaponIndex( f599_arg0, f599_local13.fileId )
				f599_local15 = ""
				if f599_local13.weaponIndex ~= nil and f599_local13.weaponIndex ~= 0 then
					Engine.SetModelValue( Engine.GetModel( f599_arg1.fileshareData[f599_local1].elementModel, "weaponName" ), Engine.ToUpper( Engine.Localize( Engine.GetItemName( f599_local13.weaponIndex ) ) ) )
				end
				CoD.FileshareUtility.SetCategoryCurrentPage( f599_arg0, f599_local9, f599_local0 )
				Engine.SetModelValue( Engine.CreateModel( f599_arg1.fileshareData[f599_local1].elementModel, "action" ), function ( f600_arg0, f600_arg1, f600_arg2, f600_arg3, f600_arg4 )
					FileshareSetSelectedItem( f600_arg0, f600_arg1, f600_arg2, "true" )
					FileshareOpenFullscreenView( f600_arg0, f600_arg1, f600_arg2, f600_arg4 )
				end )
			end
			return f599_arg1.fileshareData[f599_local1].elementModel
		end
	},
	FileshareCommunityList = {
		prepare = function ( f601_arg0, f601_arg1, f601_arg2 )
			f601_arg1.controller = f601_arg0
			f601_arg1.hasCreateButton = false
			f601_arg1.numElements = f601_arg1.vCount * f601_arg1.hCount
			f601_arg1.fileshareRootModel = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
			f601_arg1.fileshareData = {}
			for f601_local0 = 1, f601_arg1.numElements, 1 do
				f601_arg1.fileshareData[f601_local0] = {}
				f601_arg1.fileshareData[f601_local0].elementModel = Engine.CreateModel( f601_arg1.fileshareRootModel, "fileshareData_" .. f601_local0 )
				for f601_local6, f601_local7 in ipairs( CoD.FileshareUtility.FileProperties ) do
					Engine.CreateModel( f601_arg1.fileshareData[f601_local0].elementModel, f601_local7 )
				end
				CoD.FileshareUtility.ResetFileshareSummary( f601_arg1.fileshareData[f601_local0].elementModel )
			end
			CoD.FileshareUtility.SetItemsCount( f601_arg1.controller, f601_arg1.numElements )
			Engine.FileshareStartup( f601_arg1.controller )
			CoD.FileshareUtility.SetShowFileDetails( false )
			CoD.FileshareUtility.SetShowPublishNewDetails( false )
		end,
		getCount = function ( f602_arg0 )
			local f602_local0 = false
			local f602_local1 = CoD.FileshareUtility.GetCurrentCategory()
			if f602_local1 == "film" then
				local f602_local2 = Engine.GetDemoStreamedDownloadProgress()
				if f602_local2 > 0 and f602_local2 < 100 then
					f602_local0 = false
				else
					f602_local0 = true
				end
			end
			if f602_local0 and not Engine.FileshareIsReady( f602_arg0.controller ) then
				f602_arg0:addElement( LUI.UITimer.newElementTimer( 500, true, function ()
					f602_arg0:updateDataSource()
				end ) )
				CoD.FileshareUtility.SetItemsCount( f602_arg0.controller, 0 )
				return 0
			else
				local f602_local2, f602_local3 = CoD.FileshareUtility.GetCurrentFilter()
				if f602_local1 == nil then
					CoD.FileshareUtility.SetItemsCount( f602_arg0.controller, 0 )
					return 0
				else
					local f602_local4 = Engine.FileshareGetTotalUsedCommunitySlotCount( f602_arg0.controller, f602_local1, f602_local2, f602_local3 )
					CoD.FileshareUtility.SetItemsCount( f602_arg0.controller, f602_local4 )
					return f602_local4
				end
			end
		end,
		getItem = function ( f604_arg0, f604_arg1, f604_arg2 )
			local f604_local0 = f604_arg2 - 1
			local f604_local1 = f604_local0 % f604_arg1.numElements + 1
			local f604_local2 = f604_arg2 % f604_arg1.numElements
			local f604_local3 = Engine.GetModel( f604_arg1.fileshareData[f604_local1].elementModel, "isPublishNew" )
			local f604_local4 = Engine.GetModel( f604_arg1.fileshareData[f604_local1].elementModel, "showPlusImage" )
			local f604_local5 = Engine.GetModel( f604_arg1.fileshareData[f604_local1].elementModel, "showFileImage" )
			local f604_local6 = Engine.GetModel( f604_arg1.fileshareData[f604_local1].elementModel, "fileImage" )
			local f604_local7 = Engine.GetModel( f604_arg1.fileshareData[f604_local1].elementModel, "fileId" )
			local f604_local8 = Engine.GetModel( f604_arg1.fileshareData[f604_local1].elementModel, "renderFileId" )
			Engine.SetModelValue( Engine.CreateModel( f604_arg1.fileshareData[f604_local1].elementModel, "uiModelIndex" ), f604_local1 )
			Engine.SetModelValue( f604_local3, false )
			Engine.SetModelValue( f604_local6, "" )
			Engine.SetModelValue( f604_local4, 0 )
			Engine.SetModelValue( f604_local5, 1 )
			Engine.SetModelValue( f604_local8, 0 )
			local f604_local9 = CoD.FileshareUtility.GetCurrentCategory()
			local f604_local10, f604_local11 = CoD.FileshareUtility.GetCurrentFilter()
			local f604_local12 = Engine.FileshareGetCommunitySlotData( f604_arg1.controller, f604_local9, f604_local10, f604_local11, f604_local0 )
			for f604_local16, f604_local17 in ipairs( CoD.FileshareUtility.FileProperties ) do
				if f604_local12[f604_local17] ~= nil then
					Engine.SetModelValue( Engine.GetModel( f604_arg1.fileshareData[f604_local1].elementModel, f604_local17 ), f604_local12[f604_local17] )
				end
			end
			f604_local13 = ""
			if f604_local12.weaponIndex ~= nil and f604_local12.weaponIndex ~= 0 then
				Engine.SetModelValue( Engine.GetModel( f604_arg1.fileshareData[f604_local1].elementModel, "weaponName" ), Engine.ToUpper( Engine.Localize( Engine.GetItemName( f604_local12.weaponIndex ) ) ) )
			end
			CoD.FileshareUtility.SetupDefaultNameAndDescription( f604_arg1.fileshareData[f604_local1].elementModel )
			CoD.FileshareUtility.SetCategoryCurrentPage( f604_arg0, f604_local9, f604_local0 )
			Engine.SetModelValue( Engine.CreateModel( f604_arg1.fileshareData[f604_local1].elementModel, "action" ), function ( f605_arg0, f605_arg1, f605_arg2, f605_arg3, f605_arg4 )
				if CoD.FileshareUtility.IsCategoryFilm( f605_arg2, f605_arg1 ) then
					CoD.FileshareUtility.LoadTheaterFile( f605_arg0, f605_arg1, f605_arg2, f605_arg3, f605_arg4 )
					Close( f605_arg0, f605_arg2 )
				else
					FileshareSetSelectedItem( f605_arg0, f605_arg1, f605_arg2, "true" )
					FileshareOpenFullscreenView( f605_arg0, f605_arg1, f605_arg2, f605_arg4 )
				end
			end )
			return f604_arg1.fileshareData[f604_local1].elementModel
		end
	},
	FileshareCategoriesList = {
		prepare = function ( f606_arg0, f606_arg1, f606_arg2 )
			local f606_local0 = {
				{
					displayText = "GROUPS_PAINTJOBS_CAPS",
					displayImage = "uie_t7_mp_icon_header_paintshop",
					hintText = "MENU_FILESHARE_SHOWCASE_PAINTJOBS_DESC",
					category = "paintjob",
					disabled = false
				},
				{
					displayText = "MENU_VARIANTS_CAPS",
					displayImage = "uie_t7_mp_icon_header_gunsmith",
					hintText = "MENU_FILESHARE_SHOWCASE_VARIANTS_DESC",
					category = "variant",
					disabled = false
				},
				{
					displayText = "MENU_EMBLEMS_CAPS",
					displayImage = "uie_t7_mp_icon_header_emblem",
					hintText = "MENU_FILESHARE_SHOWCASE_EMBLEMS_DESC",
					category = "emblem",
					disabled = false
				}
			}
			local f606_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareCategoriesList" ), "list" )
			f606_arg1.optionModels = {}
			for f606_local5, f606_local6 in ipairs( f606_local0 ) do
				f606_arg1.optionModels[f606_local5] = Engine.CreateModel( f606_local1, "buttonModel_" .. f606_local5 )
				Engine.SetModelValue( Engine.CreateModel( f606_arg1.optionModels[f606_local5], "displayText" ), Engine.Localize( f606_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f606_arg1.optionModels[f606_local5], "displayImage" ), f606_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f606_arg1.optionModels[f606_local5], "hintText" ), Engine.Localize( f606_local6.hintText ) )
				Engine.SetModelValue( Engine.CreateModel( f606_arg1.optionModels[f606_local5], "category" ), f606_local6.category )
				Engine.SetModelValue( Engine.CreateModel( f606_arg1.optionModels[f606_local5], "disabled" ), f606_local6.disabled )
			end
		end,
		getCount = function ( f607_arg0 )
			return #f607_arg0.optionModels
		end,
		getItem = function ( f608_arg0, f608_arg1, f608_arg2 )
			return f608_arg1.optionModels[f608_arg2]
		end
	},
	FileshareCommunityCategoriesList = {
		prepare = function ( f609_arg0, f609_arg1, f609_arg2 )
			local f609_local0 = {}
			table.insert( f609_local0, {
				displayText = "GROUPS_PAINTJOBS_CAPS",
				displayImage = "uie_t7_mp_icon_header_paintshop",
				hintText = "MENU_FILESHARE_COMMUNITY_PAINTJOBS_DESC",
				category = "paintjob",
				disabled = false
			} )
			table.insert( f609_local0, {
				displayText = "MENU_VARIANTS_CAPS",
				displayImage = "uie_t7_mp_icon_header_gunsmith",
				hintText = "MENU_FILESHARE_COMMUNITY_VARIANTS_DESC",
				category = "variant",
				disabled = false
			} )
			table.insert( f609_local0, {
				displayText = "MENU_EMBLEMS_CAPS",
				displayImage = "uie_t7_mp_icon_header_emblem",
				hintText = "MENU_FILESHARE_COMMUNITY_EMBLEMS_DESC",
				category = "emblem",
				disabled = false
			} )
			local f609_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareCategoriesList" ), "list" )
			f609_arg1.optionModels = {}
			for f609_local5, f609_local6 in ipairs( f609_local0 ) do
				f609_arg1.optionModels[f609_local5] = Engine.CreateModel( f609_local1, "buttonModel_" .. f609_local5 )
				Engine.SetModelValue( Engine.CreateModel( f609_arg1.optionModels[f609_local5], "displayText" ), Engine.Localize( f609_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f609_arg1.optionModels[f609_local5], "displayImage" ), f609_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f609_arg1.optionModels[f609_local5], "hintText" ), Engine.Localize( f609_local6.hintText ) )
				Engine.SetModelValue( Engine.CreateModel( f609_arg1.optionModels[f609_local5], "category" ), f609_local6.category )
				Engine.SetModelValue( Engine.CreateModel( f609_arg1.optionModels[f609_local5], "disabled" ), f609_local6.disabled )
			end
		end,
		getCount = function ( f610_arg0 )
			return #f610_arg0.optionModels
		end,
		getItem = function ( f611_arg0, f611_arg1, f611_arg2 )
			return f611_arg1.optionModels[f611_arg2]
		end
	},
	FileshareMyTheaterCategoriesList = {
		prepare = function ( f612_arg0, f612_arg1, f612_arg2 )
			local f612_local0 = {}
			table.insert( f612_local0, {
				displayText = "MENU_RECENT_GAMES",
				displayImage = "t7_icon_menu_simple_emblems",
				hintText = "",
				category = "film",
				disabled = false
			} )
			local f612_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareMyTheaterCategoriesList" ), "list" )
			f612_arg1.optionModels = {}
			for f612_local5, f612_local6 in ipairs( f612_local0 ) do
				f612_arg1.optionModels[f612_local5] = Engine.CreateModel( f612_local1, "buttonModel_" .. f612_local5 )
				Engine.SetModelValue( Engine.CreateModel( f612_arg1.optionModels[f612_local5], "displayText" ), Engine.Localize( f612_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f612_arg1.optionModels[f612_local5], "displayImage" ), f612_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f612_arg1.optionModels[f612_local5], "hintText" ), Engine.Localize( f612_local6.hintText ) )
				Engine.SetModelValue( Engine.CreateModel( f612_arg1.optionModels[f612_local5], "category" ), f612_local6.category )
				Engine.SetModelValue( Engine.CreateModel( f612_arg1.optionModels[f612_local5], "disabled" ), f612_local6.disabled )
			end
		end,
		getCount = function ( f613_arg0 )
			return #f613_arg0.optionModels
		end,
		getItem = function ( f614_arg0, f614_arg1, f614_arg2 )
			return f614_arg1.optionModels[f614_arg2]
		end
	},
	FileshareOptionsButtonList = f0_local7( "FileshareOptionsButtonList", function ( f615_arg0 )
		local f615_local0 = {}
		if FilesshareCanShowVoteOptions( f615_arg0 ) then
			table.insert( f615_local0, {
				displayText = "MENU_FILESHARE_LIKE",
				displayImage = "uie_t7_icon_menu_options_like",
				displayDesc = "MENU_FILESHARE_LIKE_DESC",
				action = CoD.FileshareUtility.ReportLike
			} )
			table.insert( f615_local0, {
				displayText = "MENU_FILESHARE_DISLIKE",
				displayImage = "uie_t7_icon_menu_options_dislike",
				displayDesc = "MENU_FILESHARE_DISLIKE_DESC",
				action = CoD.FileshareUtility.ReportDislike
			} )
		end
		if FileshareCanDownloadItem( f615_arg0 ) then
			table.insert( f615_local0, {
				displayText = "MENU_FILESHARE_DOWNLOAD",
				displayImage = "t7_icon_menu_options_download",
				displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
				action = CoD.FileshareUtility.DownloadAction
			} )
		end
		if FileshareCanDeleteItem( f615_arg0 ) then
			table.insert( f615_local0, {
				displayText = "MENU_DELETE",
				displayImage = "t7_icon_menu_simple_delete",
				displayDesc = "MENU_FILESHARE_DELETE_DESC",
				action = CoD.FileshareUtility.Delete
			} )
		end
		if FileshareCanShowPlayerDetails( f615_arg0 ) then
			table.insert( f615_local0, {
				displayText = "MPUI_PLAYER_DETAILS",
				displayImage = "t7_icon_menu_simple_media_manager",
				displayDesc = "MENU_FILESHARE_MEDIA_MANAGER_DESC",
				action = ShowcaseOpenPlayerDetails
			} )
		end
		local f615_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorName" )
		local f615_local2 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
		if f615_local2 ~= Engine.GetXUID64( f615_arg0 ) then
			table.insert( f615_local0, {
				displayText = "MENU_REPORT_PLAYER",
				displayImage = "uie_t7_icon_error_overlays",
				displayDesc = "MENU_REPORT_PLAYER_DESC",
				action = ShowReportPlayerDialog,
				params = {
					controller = f615_arg0,
					gamertag = f615_local1,
					xuid = f615_local2
				},
				lastInGroup = false
			} )
		end
		if FileshareCanShowShowcaseManager( f615_arg0 ) then
			table.insert( f615_local0, {
				displayText = "MENU_FILESHARE_SHOWCASE_MANAGER",
				displayImage = "t7_icon_menu_simple_media_manager",
				displayDesc = "MENU_FILESHARE_MEDIA_MANAGER_DESC",
				action = CoD.FileshareUtility.OpenShowcaseManager
			} )
		end
		local f615_local3 = {}
		for f615_local7, f615_local8 in ipairs( f615_local0 ) do
			table.insert( f615_local3, {
				models = {
					displayText = Engine.Localize( f615_local8.displayText ),
					icon = f615_local8.displayImage,
					hintText = f615_local8.displayDesc
				},
				properties = {
					action = f615_local8.action,
					actionParam = f615_local8.params
				}
			} )
		end
		return f615_local3
	end
	 ),
	FileshareOptionsDeleteButtonList = {
		prepare = function ( f616_arg0, f616_arg1, f616_arg2 )
			local f616_local0 = {
				{
					displayText = "MENU_DELETE",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.DeleteYes
				},
				{
					displayText = "MENU_CANCEL",
					displayImage = "",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.DeleteNo
				}
			}
			local f616_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareOptionsDeleteButtonList" ), "list" )
			f616_arg1.optionModels = {}
			for f616_local5, f616_local6 in ipairs( f616_local0 ) do
				f616_arg1.optionModels[f616_local5] = Engine.CreateModel( f616_local1, "buttonModel_" .. f616_local5 )
				Engine.SetModelValue( Engine.CreateModel( f616_arg1.optionModels[f616_local5], "displayText" ), Engine.Localize( f616_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f616_arg1.optionModels[f616_local5], "displayImage" ), f616_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f616_arg1.optionModels[f616_local5], "hintText" ), Engine.Localize( f616_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f616_arg1.optionModels[f616_local5], "action" ), f616_local6.action )
			end
		end,
		getCount = function ( f617_arg0 )
			return #f617_arg0.optionModels
		end,
		getItem = function ( f618_arg0, f618_arg1, f618_arg2 )
			return f618_arg1.optionModels[f618_arg2]
		end
	},
	FileshareSlotsFullButtonList = {
		prepare = function ( f619_arg0, f619_arg1, f619_arg2 )
			local f619_local0 = {}
			if FileshareShowcaseSlotsAvailable( f619_arg0 ) == false then
				table.insert( f619_local0, {
					displayText = "MENU_FILESHARE_SHOWCASE_MANAGER_CAPS",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.OpenShowcaseManager
				} )
				if FileshareCanBuyMoreSlots( f619_arg0 ) == true then
					table.insert( f619_local0, {
						displayText = "MENU_FILESHARE_BUY_SLOTS",
						displayImage = "",
						displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
						action = CoD.FileshareUtility.OpenBuySlots
					} )
				end
			end
			local f619_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSlotsFullButtonList" ), "list" )
			f619_arg1.optionModels = {}
			for f619_local5, f619_local6 in ipairs( f619_local0 ) do
				f619_arg1.optionModels[f619_local5] = Engine.CreateModel( f619_local1, "buttonModel_" .. f619_local5 )
				Engine.SetModelValue( Engine.CreateModel( f619_arg1.optionModels[f619_local5], "displayText" ), Engine.Localize( f619_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f619_arg1.optionModels[f619_local5], "displayImage" ), f619_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f619_arg1.optionModels[f619_local5], "hintText" ), Engine.Localize( f619_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f619_arg1.optionModels[f619_local5], "action" ), f619_local6.action )
			end
		end,
		getCount = function ( f620_arg0 )
			return #f620_arg0.optionModels
		end,
		getItem = function ( f621_arg0, f621_arg1, f621_arg2 )
			return f621_arg1.optionModels[f621_arg2]
		end
	},
	GunsmithOptionsButtonList = f0_local7( "GunsmithOptionsButtonList", function ( f622_arg0 )
		local f622_local0 = {}
		local f622_local1 = false
		local f622_local2 = false
		local f622_local3 = false
		local f622_local4 = CraftSlotsFullByStorageType( f622_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
		local f622_local5 = CoD.perController[f622_arg0].gunsmithVariantModel
		if f622_local5 then
			local f622_local6 = Engine.GetModel( f622_local5, "readOnly" )
			if f622_local6 then
				local f622_local7 = Engine.GetModelValue( f622_local6 )
				if f622_local7 and f622_local7 == 1 then
					f622_local3 = true
				end
			end
		end
		if f622_local4 == true or f622_local3 == true then
			f622_local1 = true
		end
		if f622_local3 == true then
			f622_local2 = true
		end
		if FileshareCanPublish( f622_arg0 ) then
			table.insert( f622_local0, {
				displayText = "MENU_PUBLISH",
				displayImage = "t7_icon_menu_simple_publish",
				displayDesc = "MENU_GUNSMITH_PUBLISH_DESC",
				action = CoD.CraftUtility.OpenPublishPromptGunsmith,
				disabled = f622_local2
			} )
		end
		table.insert( f622_local0, {
			displayText = "MENU_DELETE",
			displayImage = "t7_icon_menu_simple_delete",
			displayDesc = "MENU_GUNSMITH_DELETE_DESC",
			action = CoD.CraftUtility.GunsmithClear,
			disabled = false
		} )
		table.insert( f622_local0, {
			displayText = "MENU_COPY",
			displayImage = "t7_icon_menu_simple_copy",
			displayDesc = "MENU_GUNSMITH_COPY_DESC",
			action = Gunsmith_CopyVariant,
			disabled = f622_local1
		} )
		table.insert( f622_local0, {
			displayText = "MENU_RENAME",
			displayImage = "t7_icon_menu_simple_rename",
			displayDesc = "MENU_GUNSMITH_RENAME_DESC",
			action = CoD.CraftUtility.GunsmithRename,
			disabled = false
		} )
		if CanShowMediaManager() then
			table.insert( f622_local0, {
				displayText = "MENU_MEDIA_MANAGER",
				displayImage = "t7_icon_menu_simple_media_manager",
				displayDesc = "MENU_MEDIA_MANAGER_DESC",
				action = GoBackAndOpenMediaManagerOnParent,
				param = "variant",
				disabled = false
			} )
		end
		local f622_local6 = {}
		for f622_local10, f622_local11 in ipairs( f622_local0 ) do
			table.insert( f622_local6, {
				models = {
					displayText = f622_local11.displayText,
					icon = f622_local11.displayImage,
					description = f622_local11.displayDesc,
					action = f622_local11.action,
					param = f622_local11.param
				},
				properties = {
					disabled = f622_local11.disabled
				}
			} )
		end
		return f622_local6
	end
	 ),
	EmblemOptionsButtonList = f0_local7( "EmblemOptionsButtonList", function ( f623_arg0 )
		local f623_local0 = {}
		local f623_local1 = false
		local f623_local2 = false
		local f623_local3 = false
		local f623_local4 = CraftSlotsFullByStorageType( f623_arg0, Enum.StorageFileType.STORAGE_EMBLEMS )
		local f623_local5 = CoD.perController[f623_arg0].selectedEmblemModel
		if f623_local5 then
			local f623_local6 = Engine.GetModel( f623_local5, "readOnly" )
			if f623_local6 then
				local f623_local7 = Engine.GetModelValue( f623_local6 )
				if f623_local7 and f623_local7 == 1 then
					f623_local3 = true
				end
			end
		end
		if f623_local4 == true or f623_local3 == true then
			f623_local1 = true
		end
		if f623_local3 == true then
			f623_local2 = true
		end
		if isFileshareFeatureEnabled() then
			table.insert( f623_local0, {
				displayText = "MENU_PUBLISH",
				displayImage = "t7_icon_menu_simple_publish",
				displayDesc = "MENU_EMBLEMS_PUBLISH_DESC",
				action = CoD.CraftUtility.OpenPublishPromptEmblem,
				disabled = f623_local2
			} )
		end
		table.insert( f623_local0, {
			displayText = "MENU_DELETE",
			displayImage = "t7_icon_menu_simple_delete",
			displayDesc = "MENU_EMBLEM_DELETE_DESC",
			action = CoD.CraftUtility.EmblemClear,
			disabled = false
		} )
		table.insert( f623_local0, {
			displayText = "MENU_COPY",
			displayImage = "t7_icon_menu_simple_copy",
			displayDesc = "MENU_EMBLEM_COPY_DESC",
			action = EmblemSelect_CopyEmblem,
			disabled = f623_local1
		} )
		table.insert( f623_local0, {
			displayText = "MENU_RENAME",
			displayImage = "t7_icon_menu_simple_rename",
			displayDesc = "MENU_EMBLEM_RENAME_DESC",
			action = CoD.CraftUtility.EmblemRename,
			disabled = false
		} )
		if CanShowMediaManager() then
			table.insert( f623_local0, {
				displayText = "MENU_MEDIA_MANAGER",
				displayImage = "t7_icon_menu_simple_media_manager",
				displayDesc = "MENU_MEDIA_MANAGER_DESC",
				action = GoBackAndOpenMediaManagerOnParent,
				param = "emblem",
				disabled = false
			} )
		end
		local f623_local6 = {}
		for f623_local10, f623_local11 in ipairs( f623_local0 ) do
			table.insert( f623_local6, {
				models = {
					displayText = f623_local11.displayText,
					icon = f623_local11.displayImage,
					description = f623_local11.displayDesc,
					action = f623_local11.action,
					param = f623_local11.param
				},
				properties = {
					disabled = f623_local11.disabled
				}
			} )
		end
		return f623_local6
	end
	 ),
	PaintjobOptionsButtonList = f0_local7( "PaintjobOptionsButtonList", function ( f624_arg0 )
		local f624_local0 = {}
		local f624_local1 = false
		local f624_local2 = false
		local f624_local3 = false
		local f624_local4 = CraftSlotsFullByStorageType( f624_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS )
		local f624_local5 = CoD.perController[f624_arg0].selectedpaintjobModel
		if f624_local5 then
			local f624_local6 = Engine.GetModel( f624_local5, "readOnly" )
			if f624_local6 then
				local f624_local7 = Engine.GetModelValue( f624_local6 )
				if f624_local7 and f624_local7 == 1 then
					f624_local3 = true
				end
			end
		end
		if f624_local4 == true or f624_local3 == true then
			f624_local1 = true
		end
		if f624_local3 == true then
			f624_local2 = true
		end
		if isFileshareFeatureEnabled() then
			table.insert( f624_local0, {
				displayText = "MENU_PUBLISH",
				displayImage = "t7_icon_menu_simple_publish",
				displayDesc = "MENU_PAINTJOB_PUBLISH_DESC",
				action = CoD.CraftUtility.OpenPublishPromptPaintjob,
				disabled = f624_local2
			} )
		end
		table.insert( f624_local0, {
			displayText = "MENU_DELETE",
			displayImage = "t7_icon_menu_simple_delete",
			displayDesc = "MENU_PAINTJOB_DELETE_DESC",
			action = CoD.CraftUtility.PaintjobClear,
			disabled = false
		} )
		table.insert( f624_local0, {
			displayText = "MENU_COPY",
			displayImage = "t7_icon_menu_simple_copy",
			displayDesc = "MENU_PAINTJOB_COPY_DESC",
			action = PaintjobSelector_CopyPaintjob,
			disabled = f624_local1
		} )
		table.insert( f624_local0, {
			displayText = "MENU_RENAME",
			displayImage = "t7_icon_menu_simple_rename",
			displayDesc = "MENU_PAINTJOB_RENAME_DESC",
			action = CoD.CraftUtility.PaintjobRename,
			disabled = false
		} )
		if CanShowMediaManager() then
			table.insert( f624_local0, {
				displayText = "MENU_MEDIA_MANAGER",
				displayImage = "t7_icon_menu_simple_media_manager",
				displayDesc = "MENU_MEDIA_MANAGER_DESC",
				action = GoBackAndOpenMediaManagerOnParent,
				param = "paintjob",
				disabled = false
			} )
		end
		if Engine.IsSteamWorkshopEnabled() then
			table.insert( f624_local0, {
				displayText = "PLATFORM_STEAM_PUBLISH",
				displayImage = "",
				displayDesc = "PLATFORM_STEAM_PUBLISH_DESC",
				action = CoD.CraftUtility.OpenSteamPublishPromptPaintjob
			} )
		end
		local f624_local6 = {}
		for f624_local10, f624_local11 in ipairs( f624_local0 ) do
			table.insert( f624_local6, {
				models = {
					displayText = f624_local11.displayText,
					icon = f624_local11.displayImage,
					description = f624_local11.displayDesc,
					action = f624_local11.action,
					param = f624_local11.param
				},
				properties = {
					disabled = f624_local11.disabled
				}
			} )
		end
		return f624_local6
	end
	 ),
	PaintjobLayerOptionsButtonList = f0_local7( "PaintjobLayerOptionsButtonList", function ( f625_arg0 )
		local f625_local0 = IsGridOn( f625_arg0, CoD.CraftUtility.GetGridTypeName( f625_arg0 ) )
		local f625_local1 = "MENU_EMBLEM_TURN_GRID_ON"
		local f625_local2 = "MENU_EMBLEM_TURN_GRID_ON_HINT"
		if f625_local0 then
			f625_local1 = "MENU_EMBLEM_TURN_GRID_OFF"
			f625_local2 = "MENU_EMBLEM_TURN_GRID_OFF_HINT"
		end
		local f625_local3 = {
			{
				displayText = f625_local1,
				displayImage = "",
				displayDesc = f625_local2,
				action = PaintjobEditor_ToggleGrid,
				disabled = false
			}
		}
		local f625_local4 = {}
		for f625_local8, f625_local9 in ipairs( f625_local3 ) do
			table.insert( f625_local4, {
				models = {
					displayText = f625_local9.displayText,
					icon = f625_local9.displayImage,
					description = f625_local9.displayDesc,
					action = f625_local9.action
				},
				properties = {
					disabled = f625_local9.disabled
				}
			} )
		end
		return f625_local4
	end
	 ),
	GunsmithSnapshotModeButtonList = f0_local7( "GunsmithSnapshotModeButtonList", function ( f626_arg0 )
		local f626_local0 = {}
		table.insert( f626_local0, {
			displayText = "",
			displayImage = "t7_menu_gunsmith_statssingle",
			displayDesc = "MENU_GUNSMITH_SNAPSHOT_STATS",
			action = Gunsmith_SnapshotToggleDisplayProperty,
			visibilityModelName = "GunsmithSnapshot.Stats"
		} )
		table.insert( f626_local0, {
			displayText = "",
			displayImage = "t7_menu_gunsmith_weaponlevel",
			displayDesc = "MENU_GUNSMITH_SNAPSHOT_WEAPON_LEVEL",
			action = Gunsmith_SnapshotToggleDisplayProperty,
			visibilityModelName = "GunsmithSnapshot.WeaponLevel"
		} )
		table.insert( f626_local0, {
			displayText = "",
			displayImage = "t7_menu_gunsmith_player",
			displayDesc = "MENU_GUNSMITH_SNAPSHOT_PLAYERID",
			action = Gunsmith_SnapshotToggleDisplayProperty,
			visibilityModelName = "GunsmithSnapshot.PlayerID"
		} )
		table.insert( f626_local0, {
			displayText = "",
			displayImage = "t7_menu_gunsmith_weaponname",
			displayDesc = "MENU_GUNSMITH_SNAPSHOT_WEAPON_NAME",
			action = Gunsmith_SnapshotToggleDisplayProperty,
			visibilityModelName = "GunsmithSnapshot.WeaponName"
		} )
		table.insert( f626_local0, {
			displayText = "",
			displayImage = "t7_menu_gunsmith_opticattach",
			displayDesc = "MENU_GUNSMITH_SNAPSHOT_ATTACHMENTS",
			action = Gunsmith_SnapshotToggleDisplayProperty,
			visibilityModelName = "GunsmithSnapshot.AttachmentIcons"
		} )
		table.insert( f626_local0, {
			displayText = "",
			displayImage = "t7_menu_gunsmith_bo3logo",
			displayDesc = "MENU_GUNSMITH_SNAPSHOT_BO3LOGO",
			action = Gunsmith_SnapshotToggleDisplayProperty,
			visibilityModelName = "GunsmithSnapshot.BO3Logo"
		} )
		local f626_local1 = {}
		for f626_local5, f626_local6 in ipairs( f626_local0 ) do
			table.insert( f626_local1, {
				models = {
					displayText = f626_local6.displayText,
					icon = f626_local6.displayImage,
					description = f626_local6.displayDesc,
					action = f626_local6.action,
					param = f626_local6.visibilityModelName
				},
				properties = {
					disabled = f626_local6.disabled
				}
			} )
		end
		return f626_local1
	end
	 ),
	MediaManagerPaintjobList = {
		prepare = function ( f627_arg0, f627_arg1, f627_arg2 )
			f627_arg1.controller = f627_arg0
			f627_arg1.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( f627_arg0 ), "MediaManager.PaintjobList" )
			f627_arg1.totalPaintjobs = 0
			f627_arg1.paintjobList = {}
			local f627_local0 = {
				isBuyMore = true,
				sortIndex = 0,
				weaponIndex = 0,
				paintjobSlot = 0,
				paintjobIndex = 0
			}
			if FileshareCanBuyMoreSlots( f627_arg0 ) == true then
				table.insert( f627_arg1.paintjobList, f627_local0 )
				f627_arg1.totalPaintjobs = f627_arg1.totalPaintjobs + 1
			end
			for f627_local4, f627_local5 in pairs( CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList() ) do
				if f627_local5.weaponIndex ~= 0 then
					table.insert( f627_arg1.paintjobList, f627_local5 )
					f627_arg1.totalPaintjobs = f627_arg1.totalPaintjobs + 1
				end
			end
		end,
		getCount = function ( f628_arg0 )
			return f628_arg0.totalPaintjobs
		end,
		getItem = function ( f629_arg0, f629_arg1, f629_arg2 )
			local f629_local0 = Engine.CreateModel( f629_arg1.paintjobListModel, "mm_paintjob_" .. f629_arg2 )
			local f629_local1 = f629_arg1.paintjobList[f629_arg2]
			if f629_local1 then
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "showBuyImage" ), 0 )
				if f629_local1.isBuyMore ~= nil and f629_local1.isBuyMore == true then
					Engine.SetModelValue( Engine.CreateModel( f629_local0, "isBuyMore" ), true )
					Engine.SetModelValue( Engine.CreateModel( f629_local0, "showBuyImage" ), 1 )
					Engine.SetModelValue( Engine.CreateModel( f629_local0, "sortIndex" ), 1 )
					Engine.SetModelValue( Engine.CreateModel( f629_local0, "paintjobName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
				end
				if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( f629_local1.paintjobSlot, f629_local1.paintjobIndex ) then
					Engine.SetModelValue( Engine.CreateModel( f629_local0, "paintjobName" ), f629_local1.paintjobName )
					Engine.SetModelValue( Engine.CreateModel( f629_local0, "paintjobTextEntry" ), f629_local1.paintjobName )
				end
				CoD.SetCustomization( f629_arg0, f629_local1.weaponIndex, "weapon_index" )
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "sortIndex" ), f629_local1.sortIndex )
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "weaponIndex" ), f629_local1.weaponIndex )
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "paintjobSlot" ), f629_local1.paintjobSlot )
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "paintjobIndex" ), f629_local1.paintjobIndex )
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "paintjobSlotAndIndex" ), f629_local1.paintjobSlot .. " " .. f629_local1.paintjobIndex )
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "authorName" ), Engine.GetSelfGamertag( f629_arg0 ) )
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "createTime" ), f629_local1.createTime )
				local f629_local2 = ""
				if f629_local1.weaponIndex ~= nil then
					f629_local2 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f629_local1.weaponIndex ) ) )
				end
				Engine.SetModelValue( Engine.CreateModel( f629_local0, "weaponName" ), f629_local2 )
				return f629_local0
			else
				
			end
		end
	},
	MediaManagerVariantList = {
		prepare = function ( f630_arg0, f630_arg1, f630_arg2 )
			f630_arg1.controller = f630_arg0
			f630_arg1.variantListModel = Engine.CreateModel( Engine.GetModelForController( f630_arg0 ), "MediaManager.VariantList" )
			f630_arg1.totalVariants = 0
			f630_arg1.variantList = {}
			local f630_local0 = {
				isBuyMore = true,
				sortIndex = 0,
				weaponIndex = 0,
				paintjobSlot = 0,
				paintjobIndex = 0
			}
			if FileshareCanBuyMoreSlots( f630_arg0 ) == true then
				table.insert( f630_arg1.variantList, f630_local0 )
				f630_arg1.totalVariants = f630_arg1.totalVariants + 1
			end
			for f630_local4, f630_local5 in pairs( CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList() ) do
				if f630_local5.weaponIndex ~= 0 then
					table.insert( f630_arg1.variantList, f630_local5 )
					f630_arg1.totalVariants = f630_arg1.totalVariants + 1
				end
			end
		end,
		getCount = function ( f631_arg0 )
			return f631_arg0.totalVariants
		end,
		createVariantModel = function ( f632_arg0, f632_arg1, f632_arg2, f632_arg3, f632_arg4 )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "variantIndex" ), f632_arg2.variantIndex )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "weaponIndex" ), f632_arg2.weaponIndex )
			if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f632_arg2.variantIndex ) then
				Engine.SetModelValue( Engine.CreateModel( f632_arg4, "variantName" ), f632_arg2.variantName )
				Engine.SetModelValue( Engine.CreateModel( f632_arg4, "variantNameBig" ), f632_arg2.variantName )
			else
				Engine.SetModelValue( Engine.CreateModel( f632_arg4, "variantName" ), Engine.Localize( "MENU_GUNSMITH_CREATE_VARIANT" ) )
				Engine.SetModelValue( Engine.CreateModel( f632_arg4, "variantNameBig" ), "" )
			end
			for f632_local3, f632_local4 in ipairs( f632_arg2.attachment ) do
				Engine.SetModelValue( Engine.CreateModel( f632_arg4, "attachment" .. f632_local3 ), f632_local4 )
			end
			for f632_local3, f632_local4 in ipairs( f632_arg2.attachmentVariant ) do
				Engine.SetModelValue( Engine.CreateModel( f632_arg4, "attachmentVariant" .. f632_local3 ), f632_local4 )
			end
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "sortIndex" ), f632_arg3 )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "paintjobSlot" ), f632_arg2.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "paintjobIndex" ), f632_arg2.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "camoIndex" ), f632_arg2.camoIndex )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "paintjobSlotAndIndex" ), f632_arg2.paintjobSlot .. " " .. f632_arg2.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "authorName" ), Engine.GetSelfGamertag( f632_arg0 ) )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "createTime" ), f632_arg2.createTime )
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "showBuyImage" ), 0 )
			f632_local0 = ""
			if f632_arg2.weaponIndex ~= nil then
				f632_local0 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f632_arg2.weaponIndex ) ) )
			end
			Engine.SetModelValue( Engine.CreateModel( f632_arg4, "weaponName" ), f632_local0 )
		end,
		getItem = function ( f633_arg0, f633_arg1, f633_arg2 )
			local f633_local0 = Engine.CreateModel( f633_arg1.variantListModel, "mm_variant_" .. f633_arg2 )
			if f633_arg1.variantList[f633_arg2].isBuyMore == true then
				Engine.SetModelValue( Engine.CreateModel( f633_local0, "isBuyMore" ), true )
				Engine.SetModelValue( Engine.CreateModel( f633_local0, "showBuyImage" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( f633_local0, "sortIndex" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( f633_local0, "variantName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			else
				DataSources.MediaManagerVariantList.createVariantModel( f633_arg0, f633_arg2, CoD.CraftUtility.Gunsmith.GetVariantByIndex( f633_arg0, f633_arg1.variantList[f633_arg2].variantIndex ), f633_arg1.variantList[f633_arg2].sortIndex, f633_local0 )
			end
			return f633_local0
		end
	},
	MediaManagerEmblemList = {
		prepare = function ( f634_arg0, f634_arg1, f634_arg2 )
			f634_arg1.controller = f634_arg0
			f634_arg1.emblemListModel = Engine.CreateModel( Engine.GetModelForController( f634_arg0 ), "MediaManager.EmblemList" )
			f634_arg1.totalEmblems = 0
			f634_arg1.emblemList = {}
			local f634_local0 = {
				isBuyMore = true,
				sortIndex = 0,
				emblemIndex = 0,
				isUsed = 1
			}
			if FileshareCanBuyMoreSlots( f634_arg0 ) == true then
				table.insert( f634_arg1.emblemList, f634_local0 )
				f634_arg1.totalEmblems = f634_arg1.totalEmblems + 1
			end
			for f634_local4, f634_local5 in pairs( CoD.CraftUtility.Emblems.GetSortedEmblemsList( CoD.perController[f634_arg0].selectedEmblemTabStorageType ) ) do
				if f634_local5.isUsed ~= 0 then
					table.insert( f634_arg1.emblemList, f634_local5 )
					f634_arg1.totalEmblems = f634_arg1.totalEmblems + 1
				end
			end
		end,
		getCount = function ( f635_arg0 )
			return f635_arg0.totalEmblems
		end,
		getItem = function ( f636_arg0, f636_arg1, f636_arg2 )
			local f636_local0 = Engine.CreateModel( f636_arg1.emblemListModel, "mm_emblem_" .. f636_arg2 )
			local f636_local1 = f636_arg1.emblemList[f636_arg2]
			if f636_local1.isBuyMore and f636_local1.isBuyMore == true then
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "isBuyMore" ), true )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "showBuyImage" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "sortIndex" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "emblemName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "emblemTitle" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "isUsed" ), false )
			else
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "emblemTitle" ), f636_local1.emblemTitle )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "emblemName" ), f636_local1.emblemName )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "emblemIndex" ), f636_local1.emblemIndex )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "emblemTextEntry" ), f636_local1.emblemTextEntry )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "subTitle" ), f636_local1.subTitle )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "storageFileType" ), CoD.perController[f636_arg0].selectedEmblemTabStorageType )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "isUsed" ), f636_local1.isUsed )
				Engine.SetModelValue( Engine.CreateModel( f636_local0, "showBuyImage" ), 0 )
			end
			Engine.SetModelValue( Engine.CreateModel( f636_local0, "sortIndex" ), f636_local1.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( f636_local0, "hintText" ), Engine.Localize( "MENU_BUTTON_EMBLEM_SET" ) )
			Engine.SetModelValue( Engine.CreateModel( f636_local0, "authorName" ), Engine.GetSelfGamertag( f636_arg0 ) )
			Engine.SetModelValue( Engine.CreateModel( f636_local0, "createTime" ), f636_local1.createTime )
			return f636_local0
		end
	},
	MediaManager = {
		getModel = function ( f637_arg0 )
			return Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager" )
		end
	},
	MediaManagerSelectedPaintjob = {
		getModel = function ( f638_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f638_arg0 ), "MediaManagerSelectedPaintjob" )
		end
	},
	MediaManagerSelectedVariant = {
		getModel = function ( f639_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f639_arg0 ), "MediaManagerSelectedVariant" )
		end
	},
	MediaManagerSelectedEmblem = {
		getModel = function ( f640_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f640_arg0 ), "MediaManagerSelectedEmblem" )
		end
	},
	MediaManagerSlotsFullButtonList = {
		prepare = function ( f641_arg0, f641_arg1, f641_arg2 )
			local f641_local0 = {}
			if CanShowMediaManager() then
				table.insert( f641_local0, {
					displayText = "MENU_MEDIA_MANAGER",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = GoBackAndOpenMediaManagerOnParent
				} )
			end
			if FileshareCanBuyMoreSlots( f641_arg0 ) == true then
				table.insert( f641_local0, {
					displayText = "MENU_FILESHARE_BUY_SLOTS",
					displayImage = "",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = OpenStore,
					param = "MediaManager"
				} )
			end
			local f641_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSlotsFullButtonList" ), "list" )
			f641_arg1.optionModels = {}
			for f641_local5, f641_local6 in ipairs( f641_local0 ) do
				f641_arg1.optionModels[f641_local5] = Engine.CreateModel( f641_local1, "mm_buttonModel_" .. f641_local5 )
				Engine.SetModelValue( Engine.CreateModel( f641_arg1.optionModels[f641_local5], "displayText" ), Engine.ToUpper( Engine.Localize( f641_local6.displayText ) ) )
				Engine.SetModelValue( Engine.CreateModel( f641_arg1.optionModels[f641_local5], "displayImage" ), f641_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f641_arg1.optionModels[f641_local5], "hintText" ), Engine.Localize( f641_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f641_arg1.optionModels[f641_local5], "action" ), f641_local6.action )
				Engine.SetModelValue( Engine.CreateModel( f641_arg1.optionModels[f641_local5], "param" ), f641_local6.param )
			end
		end,
		getCount = function ( f642_arg0 )
			return #f642_arg0.optionModels
		end,
		getItem = function ( f643_arg0, f643_arg1, f643_arg2 )
			return f643_arg1.optionModels[f643_arg2]
		end
	},
	PaintjobList = {
		prepare = function ( f644_arg0, f644_arg1, f644_arg2 )
			f644_arg1.controller = f644_arg0
			local f644_local0 = CoD.GetCustomization( f644_arg0, "weapon_index" )
			if not f644_local0 then
				return 
			end
			f644_arg1.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( f644_arg0 ), "Paintshop.PaintjobList" )
			local f644_local1 = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
			local f644_local2 = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( f644_local0 )
			if f644_local1 == CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f644_arg0 ) then
				f644_arg1.totalPaintjobs = f644_local2
			else
				f644_arg1.totalPaintjobs = f644_local2 + 1
			end
			f644_arg1.paintjobList = {}
			f644_arg1.paintjobList = CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList( f644_local0 )
		end,
		getCount = function ( f645_arg0 )
			return f645_arg0.totalPaintjobs
		end,
		getItem = function ( f646_arg0, f646_arg1, f646_arg2 )
			local f646_local0 = Engine.CreateModel( f646_arg1.paintjobListModel, "paintjob_" .. f646_arg2 )
			local f646_local1 = CoD.GetCustomization( f646_arg0, "weapon_index" )
			local f646_local2 = f646_arg1.paintjobList[f646_arg2]
			if f646_local2 then
				if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( f646_local2.paintjobSlot, f646_local2.paintjobIndex ) then
					Engine.SetModelValue( Engine.CreateModel( f646_local0, "paintjobName" ), f646_local2.paintjobName )
					Engine.SetModelValue( Engine.CreateModel( f646_local0, "paintjobTextEntry" ), f646_local2.paintjobName )
				else
					Engine.SetModelValue( Engine.CreateModel( f646_local0, "paintjobTextEntry" ), "Paintjob" )
					Engine.SetModelValue( Engine.CreateModel( f646_local0, "paintjobName" ), "" )
				end
				if f646_local2.readOnly ~= nil then
					Engine.SetModelValue( Engine.CreateModel( f646_local0, "readOnly" ), f646_local2.readOnly )
				end
				Engine.SetModelValue( Engine.CreateModel( f646_local0, "sortIndex" ), f646_local2.sortIndex )
				Engine.SetModelValue( Engine.CreateModel( f646_local0, "paintjobSlot" ), f646_local2.paintjobSlot )
				Engine.SetModelValue( Engine.CreateModel( f646_local0, "weaponIndex" ), f646_local1 )
				Engine.SetModelValue( Engine.CreateModel( f646_local0, "paintjobIndex" ), f646_local2.paintjobIndex )
				Engine.SetModelValue( Engine.CreateModel( f646_local0, "paintjobSlotAndIndex" ), f646_local2.paintjobSlot .. " " .. f646_local2.paintjobIndex )
				return f646_local0
			else
				
			end
		end
	},
	EmblemsList = {
		prepare = function ( f647_arg0, f647_arg1, f647_arg2 )
			f647_arg1.controller = f647_arg0
			f647_arg1.emblemList = {}
			local f647_local0 = CoD.perController[f647_arg0].selectedEmblemTabStorageType
			f647_arg1.emblemListModel = Engine.CreateModel( Engine.GetModelForController( f647_arg0 ), "Emblem.EmblemList" )
			local f647_local1 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f647_arg0, f647_local0 )
			local f647_local2 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f647_arg0, f647_local0 )
			if f647_local0 == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS or f647_local0 == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
				f647_arg1.totalEmblems = f647_local1
			else
				f647_arg1.totalEmblems = f647_local1 + 1
			end
			f647_arg1.emblemList = CoD.CraftUtility.Emblems.GetSortedEmblemsList( CoD.perController[f647_arg0].selectedEmblemTabStorageType )
		end,
		getCount = function ( f648_arg0 )
			return f648_arg0.totalEmblems
		end,
		getItem = function ( f649_arg0, f649_arg1, f649_arg2 )
			local f649_local0 = Engine.CreateModel( f649_arg1.emblemListModel, "emblem_" .. f649_arg2 )
			local f649_local1 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f649_arg0, CoD.perController[f649_arg0].selectedEmblemTabStorageType )
			local f649_local2 = function ( f650_arg0 )
				if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( f650_arg0.emblemIndex ) then
					f650_arg0.emblemTextEntry = f650_arg0.emblemName
					if CoD.perController[f649_arg0].selectedEmblemTabStorageType ~= Enum.StorageFileType.STORAGE_EMBLEMS then
						f650_arg0.emblemTextEntry = "Emblem"
					end
					f650_arg0.emblemTitle = f650_arg0.emblemName
					f650_arg0.subTitle = ""
				else
					f650_arg0.emblemName = Engine.Localize( "MENU_EMBLEM_CREATE_NEW" )
					f650_arg0.emblemTitle = Engine.Localize( "MENU_NEW" )
					f650_arg0.emblemTextEntry = "Emblem"
					f650_arg0.subTitle = Engine.Localize( "MENU_EMBLEM_NEW_SUBTITLE" )
				end
			end
			
			local f649_local3 = f649_arg1.emblemList[f649_arg2]
			f649_local2( f649_local3 )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "isNonClickableEmblem" ), 0 )
			if #f649_arg1.emblemList == f649_local1 + 1 and f649_arg2 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f649_local0, "isNonClickableEmblem" ), 1 )
				f649_local3.emblemTitle = Engine.Localize( "MENU_NEW" )
				f649_local3.emblemName = Engine.Localize( "MENU_EMBLEM_CREATE_NEW" )
				f649_local3.emblemTextEntry = "Emblem"
				f649_local3.subTitle = Engine.Localize( "MENU_EMBLEM_FULL_SUBTITLE" )
			end
			if CoD.perController[f649_arg0].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
				local f649_local4 = CoD.BlackMarketUtility.IsItemLocked( f649_arg0, CoD.BlackMarketUtility.GetLootEmblemIDName( f649_arg0, f649_local3.emblemIndex ) )
				Engine.SetModelValue( Engine.CreateModel( f649_local0, "isBMClassified" ), f649_local4 )
				if f649_local4 then
					f649_local3.subTitle = Engine.Localize( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_EMBLEM" )
					f649_local3.emblemName = CoD.BlackMarketUtility.ClassifiedName( true )
				end
			else
				Engine.SetModelValue( Engine.CreateModel( f649_local0, "isBMClassified" ), false )
			end
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "emblemTitle" ), f649_local3.emblemTitle )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "emblemName" ), f649_local3.emblemName )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "emblemTextEntry" ), f649_local3.emblemTextEntry )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "subTitle" ), f649_local3.subTitle )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "sortIndex" ), f649_local3.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "emblemIndex" ), f649_local3.emblemIndex )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "isUsed" ), f649_local3.isUsed )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "hintText" ), Engine.Localize( "MENU_BUTTON_EMBLEM_SET" ) )
			Engine.SetModelValue( Engine.CreateModel( f649_local0, "storageFileType" ), CoD.perController[f649_arg0].selectedEmblemTabStorageType )
			if CoD.isPC and not Engine.LastInput_Gamepad() then
				Engine.SetModelValue( Engine.CreateModel( f649_local0, "hintText" ), Engine.Localize( "PLATFORM_KEY_EMBLEM_SET" ) )
			end
			if f649_local3.readOnly ~= nil then
				Engine.SetModelValue( Engine.CreateModel( f649_local0, "readOnly" ), f649_local3.readOnly )
			end
			return f649_local0
		end
	},
	ChallengesCPCategoryStats = {
		init = function ( f651_arg0 )
			local f651_local0 = Engine.GetChallengeInfoForImages( f651_arg0, nil, Enum.eModes.MODE_CAMPAIGN )
			local f651_local1 = 0
			local f651_local2 = 0
			local f651_local3 = {}
			for f651_local7, f651_local8 in ipairs( f651_local0 ) do
				local f651_local9 = f651_local8.challengeCategory
				if not f651_local8.isMastery then
					if not f651_local3[f651_local9] then
						f651_local3[f651_local9] = {}
						f651_local3[f651_local9].numComplete = 0
						f651_local3[f651_local9].numTotal = 0
					end
					f651_local3[f651_local9].numTotal = f651_local3[f651_local9].numTotal + 1
					if not f651_local8.isLocked then
						f651_local3[f651_local9].numComplete = f651_local3[f651_local9].numComplete + 1
					end
				end
			end
			f651_local4 = 0
			f651_local5 = 0
			for f651_local9, f651_local10 in pairs( f651_local3 ) do
				f651_local4 = f651_local4 + f651_local3[f651_local9].numComplete
				f651_local5 = f651_local5 + f651_local3[f651_local9].numTotal
			end
			f651_local3.CP = {}
			f651_local3.CP.numComplete = f651_local4
			f651_local3.CP.numTotal = f651_local5
			f651_local6 = Engine.CreateModel( Engine.GetModelForController( f651_arg0 ), "ChallengesCPCategoryStats" )
			for f651_local10, f651_local12 in pairs( f651_local3 ) do
				local f651_local11 = 0
				if f651_local12.numTotal ~= 0 then
					f651_local11 = f651_local12.numComplete / f651_local12.numTotal
				end
				Engine.SetModelValue( Engine.CreateModel( f651_local6, f651_local10 ), f651_local11 )
			end
			return f651_local6
		end,
		getModel = function ( f652_arg0 )
			local f652_local0 = Engine.GetModel( Engine.GetModelForController( f652_arg0 ), "ChallengesCPCategoryStats" )
			if f652_local0 == nil then
				f652_local0 = DataSources.ChallengesCPCategoryStats.init( f652_arg0 )
			end
			return f652_local0
		end
	},
	ChallengesMPCategoryStats = {
		init = function ( f653_arg0 )
			local f653_local0 = Engine.GetChallengeInfoForImages( f653_arg0, nil, Enum.eModes.MODE_MULTIPLAYER )
			local f653_local1 = 0
			local f653_local2 = 0
			local f653_local3 = {}
			for f653_local7, f653_local8 in ipairs( f653_local0 ) do
				local f653_local9 = f653_local8.challengeCategory
				if not f653_local8.isMastery then
					if not f653_local3[f653_local9] then
						f653_local3[f653_local9] = {}
						f653_local3[f653_local9].numComplete = 0
						f653_local3[f653_local9].numTotal = 0
					end
					f653_local3[f653_local9].numTotal = f653_local3[f653_local9].numTotal + 1
					if not f653_local8.isLocked then
						f653_local3[f653_local9].numComplete = f653_local3[f653_local9].numComplete + 1
					end
				end
			end
			f653_local3.MP = {}
			f653_local3.MP.numComplete = 0
			f653_local3.MP.numTotal = 0
			for f653_local7, f653_local8 in pairs( CoD.ChallengesUtility.ChallengeCategoryTable.mp ) do
				if type( f653_local8 ) == "table" then
					f653_local3[f653_local7] = {}
					f653_local3[f653_local7].numComplete = 0
					f653_local3[f653_local7].numTotal = 0
					for f653_local12, f653_local13 in ipairs( f653_local8 ) do
						if f653_local3[f653_local13] then
							f653_local3[f653_local7].numComplete = f653_local3[f653_local7].numComplete + f653_local3[f653_local13].numComplete
							f653_local3[f653_local7].numTotal = f653_local3[f653_local7].numTotal + f653_local3[f653_local13].numTotal
						end
					end
					f653_local3.MP.numComplete = f653_local3.MP.numComplete + f653_local3[f653_local7].numComplete
					f653_local3.MP.numTotal = f653_local3.MP.numTotal + f653_local3[f653_local7].numTotal
				end
			end
			f653_local4 = Engine.CreateModel( Engine.GetModelForController( f653_arg0 ), "ChallengesMPCategoryStats" )
			for f653_local8, f653_local9 in pairs( f653_local3 ) do
				local f653_local10 = 0
				if f653_local9.numTotal ~= 0 then
					f653_local10 = f653_local9.numComplete / f653_local9.numTotal
				end
				Engine.SetModelValue( Engine.CreateModel( f653_local4, f653_local8 ), f653_local10 )
			end
			return f653_local4
		end,
		getModel = function ( f654_arg0 )
			local f654_local0 = Engine.GetModel( Engine.GetModelForController( f654_arg0 ), "ChallengesMPCategoryStats" )
			if f654_local0 == nil then
				f654_local0 = DataSources.ChallengesMPCategoryStats.init( f654_arg0 )
			end
			return f654_local0
		end
	},
	ChallengesZMCategoryStats = {
		init = function ( f655_arg0 )
			local f655_local0 = Engine.GetChallengeInfoForImages( f655_arg0, nil, Enum.eModes.MODE_ZOMBIES )
			local f655_local1 = 0
			local f655_local2 = 0
			local f655_local3 = {}
			for f655_local7, f655_local8 in ipairs( f655_local0 ) do
				local f655_local9 = f655_local8.challengeCategory
				if not f655_local8.isMastery then
					if not f655_local3[f655_local9] then
						f655_local3[f655_local9] = {}
						f655_local3[f655_local9].numComplete = 0
						f655_local3[f655_local9].numTotal = 0
					end
					f655_local3[f655_local9].numTotal = f655_local3[f655_local9].numTotal + 1
					if not f655_local8.isLocked then
						f655_local3[f655_local9].numComplete = f655_local3[f655_local9].numComplete + 1
					end
				end
			end
			f655_local4 = 0
			f655_local5 = 0
			for f655_local9, f655_local10 in pairs( f655_local3 ) do
				f655_local4 = f655_local4 + f655_local3[f655_local9].numComplete
				f655_local5 = f655_local5 + f655_local3[f655_local9].numTotal
			end
			f655_local3.ZM = {}
			f655_local3.ZM.numComplete = f655_local4
			f655_local3.ZM.numTotal = f655_local5
			f655_local6 = Engine.CreateModel( Engine.GetModelForController( f655_arg0 ), "ChallengesZMCategoryStats" )
			for f655_local10, f655_local12 in pairs( f655_local3 ) do
				local f655_local11 = 0
				if f655_local12.numTotal ~= 0 then
					f655_local11 = f655_local12.numComplete / f655_local12.numTotal
				end
				Engine.SetModelValue( Engine.CreateModel( f655_local6, f655_local10 ), f655_local11 )
			end
			return f655_local6
		end,
		getModel = function ( f656_arg0 )
			local f656_local0 = Engine.GetModel( Engine.GetModelForController( f656_arg0 ), "ChallengesZMCategoryStats" )
			if f656_local0 == nil then
				f656_local0 = DataSources.ChallengesZMCategoryStats.init( f656_arg0 )
			end
			return f656_local0
		end
	},
	ChallengesCPNearCompletion = {
		init = function ( f657_arg0 )
			local f657_local0 = Engine.CreateModel( Engine.GetModelForController( f657_arg0 ), "ChallengesCPNearCompletion" )
			local f657_local1 = Engine.CreateModel( f657_local0, "title" )
			local f657_local2 = Engine.CreateModel( f657_local0, "description" )
			local f657_local3 = Engine.CreateModel( f657_local0, "iconId" )
			local f657_local4 = Engine.CreateModel( f657_local0, "statPercent" )
			local f657_local5 = Engine.CreateModel( f657_local0, "statFractionText" )
			local f657_local6 = Engine.CreateModel( Engine.GetModelForController( f657_arg0 ), "noNearCompleteCP" )
			SetGlobalModelValue( "challengeGameMode", "cp" )
			local f657_local7 = {}
			DataSources.ChallengesNearCompletionList.prepare( f657_arg0, f657_local7, nil )
			local f657_local8 = f657_local7.ChallengesNearCompletionList[1]
			if f657_local8 == nil then
				Engine.SetModelValue( f657_local6, true )
			else
				Engine.SetModelValue( f657_local1, Engine.GetModelValue( Engine.GetModel( f657_local8.model, "title" ) ) )
				Engine.SetModelValue( f657_local2, Engine.GetModelValue( Engine.GetModel( f657_local8.model, "description" ) ) )
				Engine.SetModelValue( f657_local3, Engine.GetModelValue( Engine.GetModel( f657_local8.model, "iconId" ) ) )
				Engine.SetModelValue( f657_local4, Engine.GetModelValue( Engine.GetModel( f657_local8.model, "statPercent" ) ) )
				Engine.SetModelValue( f657_local5, Engine.GetModelValue( Engine.GetModel( f657_local8.model, "statFractionText" ) ) )
			end
			return f657_local0
		end,
		getModel = function ( f658_arg0 )
			local f658_local0 = Engine.GetModel( Engine.GetModelForController( f658_arg0 ), "ChallengesCPNearCompletion" )
			if f658_local0 == nil then
				f658_local0 = DataSources.ChallengesCPNearCompletion.init( f658_arg0 )
			end
			return f658_local0
		end
	},
	ChallengesMPNearCompletion = {
		init = function ( f659_arg0 )
			local f659_local0 = Engine.CreateModel( Engine.GetModelForController( f659_arg0 ), "ChallengesMPNearCompletion" )
			local f659_local1 = Engine.CreateModel( f659_local0, "title" )
			local f659_local2 = Engine.CreateModel( f659_local0, "description" )
			local f659_local3 = Engine.CreateModel( f659_local0, "iconId" )
			local f659_local4 = Engine.CreateModel( f659_local0, "statPercent" )
			local f659_local5 = Engine.CreateModel( f659_local0, "statFractionText" )
			SetGlobalModelValue( "challengeGameMode", "mp" )
			local f659_local6 = {}
			DataSources.ChallengesNearCompletionList.prepare( f659_arg0, f659_local6, nil )
			local f659_local7 = f659_local6.ChallengesNearCompletionList[1]
			if f659_local7 == nil then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f659_arg0 ), "noNearCompleteMP" ), true )
			else
				Engine.SetModelValue( f659_local1, Engine.GetModelValue( Engine.GetModel( f659_local7.model, "title" ) ) )
				Engine.SetModelValue( f659_local2, Engine.GetModelValue( Engine.GetModel( f659_local7.model, "description" ) ) )
				Engine.SetModelValue( f659_local3, Engine.GetModelValue( Engine.GetModel( f659_local7.model, "iconId" ) ) )
				Engine.SetModelValue( f659_local4, Engine.GetModelValue( Engine.GetModel( f659_local7.model, "statPercent" ) ) )
				Engine.SetModelValue( f659_local5, Engine.GetModelValue( Engine.GetModel( f659_local7.model, "statFractionText" ) ) )
			end
			return f659_local0
		end,
		getModel = function ( f660_arg0 )
			local f660_local0 = Engine.GetModel( Engine.GetModelForController( f660_arg0 ), "ChallengesMPNearCompletion" )
			if f660_local0 == nil then
				f660_local0 = DataSources.ChallengesMPNearCompletion.init( f660_arg0 )
			end
			return f660_local0
		end
	},
	ChallengesZMNearCompletion = {
		init = function ( f661_arg0 )
			local f661_local0 = Engine.CreateModel( Engine.GetModelForController( f661_arg0 ), "ChallengesZMNearCompletion" )
			local f661_local1 = Engine.CreateModel( f661_local0, "title" )
			local f661_local2 = Engine.CreateModel( f661_local0, "description" )
			local f661_local3 = Engine.CreateModel( f661_local0, "iconId" )
			local f661_local4 = Engine.CreateModel( f661_local0, "statPercent" )
			local f661_local5 = Engine.CreateModel( f661_local0, "statFractionText" )
			local f661_local6 = Engine.CreateModel( Engine.GetModelForController( f661_arg0 ), "noNearCompleteZM" )
			SetGlobalModelValue( "challengeGameMode", "zm" )
			local f661_local7 = {}
			DataSources.ChallengesNearCompletionList.prepare( f661_arg0, f661_local7, nil )
			local f661_local8 = f661_local7.ChallengesNearCompletionList[1]
			if f661_local8 == nil then
				Engine.SetModelValue( f661_local6, true )
			else
				Engine.SetModelValue( f661_local1, Engine.GetModelValue( Engine.GetModel( f661_local8.model, "title" ) ) )
				Engine.SetModelValue( f661_local2, Engine.GetModelValue( Engine.GetModel( f661_local8.model, "description" ) ) )
				Engine.SetModelValue( f661_local3, Engine.GetModelValue( Engine.GetModel( f661_local8.model, "iconId" ) ) )
				Engine.SetModelValue( f661_local4, Engine.GetModelValue( Engine.GetModel( f661_local8.model, "statPercent" ) ) )
				Engine.SetModelValue( f661_local5, Engine.GetModelValue( Engine.GetModel( f661_local8.model, "statFractionText" ) ) )
			end
			return f661_local0
		end,
		getModel = function ( f662_arg0 )
			local f662_local0 = Engine.GetModel( Engine.GetModelForController( f662_arg0 ), "ChallengesZMNearCompletion" )
			if f662_local0 == nil then
				f662_local0 = DataSources.ChallengesZMNearCompletion.init( f662_arg0 )
			end
			return f662_local0
		end
	},
	MasterCallingCard = {
		getModel = function ( f663_arg0 )
			local f663_local0 = Engine.GetModel( Engine.GetModelForController( f663_arg0 ), "MasterCallingCard" )
			if f663_local0 == nil then
				f663_local0 = Engine.CreateModel( Engine.GetModelForController( f663_arg0 ), "MasterCallingCard" )
				Engine.CreateModel( f663_local0, "title" )
				Engine.CreateModel( f663_local0, "description" )
				Engine.CreateModel( f663_local0, "iconId" )
				Engine.CreateModel( f663_local0, "percentComplete" )
				Engine.CreateModel( f663_local0, "isLocked" )
			end
			return f663_local0
		end,
		setModelValues = function ( f664_arg0, f664_arg1, f664_arg2, f664_arg3, f664_arg4 )
			local f664_local0 = Engine.GetModel( Engine.GetModelForController( f664_arg0 ), "MasterCallingCard" )
			if f664_local0 == nil then
				f664_local0 = DataSources.MasterCallingCard.getModel( f664_arg0 )
			end
			Engine.SetModelValue( Engine.GetModel( f664_local0, "title" ), f664_arg1 )
			Engine.SetModelValue( Engine.GetModel( f664_local0, "description" ), f664_arg2 )
			Engine.SetModelValue( Engine.GetModel( f664_local0, "iconId" ), f664_arg3 )
			Engine.SetModelValue( Engine.GetModel( f664_local0, "percentComplete" ), f664_arg4 )
			Engine.SetModelValue( Engine.GetModel( f664_local0, "isLocked" ), f664_arg4 < 1 )
		end
	},
	PrestigeStats = {
		getModel = function ( f665_arg0 )
			local f665_local0 = Engine.CreateModel( Engine.GetModelForController( f665_arg0 ), "PrestigeStats" )
			local f665_local1 = CoD.PrestigeUtility.GetCurrentPLevel( f665_arg0 )
			local f665_local2 = f665_local1
			if not IsMaxPrestigeLevel( f665_arg0 ) then
				f665_local2 = f665_local1 + 1
			end
			Engine.SetModelValue( Engine.CreateModel( f665_local0, "icon" ), Engine.GetRankIcon( 0, f665_local2, CoD.PrestigeUtility.GetPrestigeGameMode() ) )
			Engine.SetModelValue( Engine.CreateModel( f665_local0, "backgroundId" ), CoD.PrestigeUtility.GetBackgroundIdByPLevel( f665_arg0, f665_local2 ) )
			Engine.SetModelValue( Engine.CreateModel( f665_local0, "plevel" ), f665_local1 )
			return f665_local0
		end
	},
	PrestigeButtonInfopane = {
		getModel = function ( f666_arg0 )
			local f666_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "PrestigeButtonInfopane" )
			Engine.CreateModel( f666_local0, "title" )
			Engine.CreateModel( f666_local0, "description" )
			return f666_local0
		end
	},
	PersonalDataVault_CareerData = f0_local7( "PDV_CareerDataList", function ( f667_arg0 )
		return {
			{
				models = {
					displayText = "Videos",
					action = CoD.NullFunction
				},
				properties = {
					disabled = true
				}
			},
			{
				models = {
					displayText = "Player Emblem",
					action = CoD.NullFunction
				},
				properties = {
					disabled = true
				}
			},
			{
				models = {
					displayText = "Combat Record",
					action = CoD.NullFunction
				},
				properties = {
					disabled = true
				}
			},
			{
				models = {
					displayText = "Challenges",
					action = CoD.NullFunction
				},
				properties = {
					disabled = true
				}
			},
			{
				models = {
					displayText = "Medals",
					action = CoD.NullFunction
				},
				properties = {
					disabled = true
				}
			},
			{
				models = {
					displayText = "Extras",
					action = CoD.NullFunction
				},
				properties = {
					disabled = true
				}
			},
			{
				models = {
					displayText = "Omnipedia",
					action = function ( f668_arg0, f668_arg1, f668_arg2 )
						NavigateToMenu( f668_arg0, "Omnipedia", true, f668_arg2 )
					end
					
				},
				properties = {
					disabled = false
				}
			}
		}
	end
	 ),
	PersonalDataVault_MissionLocations = f0_local7( "PDV_MissionLocList", function ( f669_arg0 )
		local f669_local0 = {}
		for f669_local4, f669_local5 in pairs( CoD.mapsTable ) do
			if f669_local5.collectibles and f669_local5.collectibles ~= "" and f669_local5.mapName then
				table.insert( f669_local0, {
					models = {
						displayText = Engine.Localize( f669_local5.mapName )
					},
					properties = {
						map_name = f669_local4
					}
				} )
			end
		end
		return f669_local0
	end
	 ),
	CollectiblesList = f0_local7( "PDV_CollectiblesList", function ( f670_arg0 )
		local f670_local0 = {}
		for f670_local15, f670_local16 in pairs( CoD.mapsTable ) do
			if f670_local16.collectibles and f670_local16.collectibles ~= "" and (not CoD.perController[f670_arg0].inspectingMap or CoD.perController[f670_arg0].inspectingMap == f670_local15) then
				for f670_local13, f670_local14 in ipairs( Engine.GetAssetList( f670_local16.collectibles ) ) do
					if CoD.perController[f670_arg0].inspectingMap or CoD.perController[f670_arg0].inspectingCollectibleSize == f670_local14.slotSize then
						local f670_local7 = Engine.ClientHasCollectible( f670_arg0, f670_local15, f670_local13 - 1 )
						if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
							f670_local7 = f0_local10( f670_arg0, f670_local15, f670_local13 - 1, true )
						end
						local f670_local8 = table.insert
						local f670_local9 = f670_local0
						local f670_local10 = {}
						local f670_local11 = {
							name = f670_local14.name
						}
						local f670_local12
						if f670_local7 then
							f670_local12 = f670_local14.displayNameShort
							if not f670_local12 then
							
							else
								f670_local11.shortName = f670_local12
								f670_local11.longName = f670_local14.displayNameLong
								f670_local11.description = f670_local14.description
								f670_local11.image = f670_local14.uiMaterial
								f670_local11.imageLarge = f670_local14.uiMaterialLarge
								f670_local11.audioLog = f670_local14.audiolog_sound or ""
								f670_local11.mapDisplayName = f670_local16.mapName
								f670_local11.unlocked = f670_local7
								f670_local10.models = f670_local11
								f670_local10.properties = {
									mapName = f670_local15,
									model = f670_local14.uiModel or "tag_origin",
									unlocked = f670_local7
								}
								f670_local8( f670_local9, f670_local10 )
							end
						end
						f670_local12 = "COLLECTIBLE_NOT_FOUND_SHORT"
					end
				end
			end
		end
		table.sort( f670_local0, function ( f671_arg0, f671_arg1 )
			if f671_arg0.models.unlocked and f671_arg1.models.unlocked then
				return Engine.Localize( f671_arg0.models.shortName ) < Engine.Localize( f671_arg1.models.shortName )
			end
			return f671_arg0.models.unlocked and not f671_arg1.models.unlocked
		end )
		return f670_local0
	end
	 ),
	CollectiblesListAAR = f0_local7( "PDV_CollectiblesList", function ( f672_arg0 )
		local f672_local0 = {}
		local f672_local1 = nil
		local f672_local2 = Dvar.last_map:get()
		if not f672_local2 then
			return f672_local0
		end
		local f672_local3 = CoD.mapsTable[f672_local2].rootMapName
		f672_local1 = CoD.mapsTable[f672_local3]
		if f672_local1.collectibles and f672_local1.collectibles ~= "" then
			for f672_local8, f672_local9 in ipairs( Engine.GetAssetList( f672_local1.collectibles ) ) do
				local f672_local10 = Engine.ClientHasCollectible( f672_arg0, f672_local3, f672_local8 - 1 )
				local f672_local11 = table.insert
				local f672_local12 = f672_local0
				local f672_local13 = {}
				local f672_local14 = {
					name = f672_local9.name
				}
				local f672_local7
				if f672_local10 then
					f672_local7 = f672_local9.displayNameShort
					if not f672_local7 then
					
					else
						f672_local14.shortName = f672_local7
						f672_local14.longName = f672_local9.displayNameLong
						f672_local14.description = f672_local9.description
						f672_local14.image = f672_local9.uiMaterial
						f672_local14.imageLarge = f672_local9.uiMaterialLarge
						f672_local14.audioLog = f672_local9.audiolog_sound or ""
						f672_local14.mapDisplayName = f672_local1.mapName
						f672_local14.unlocked = f672_local10
						f672_local13.models = f672_local14
						f672_local13.properties = {
							mapName = f672_local3,
							model = f672_local9.uiModel or "tag_origin",
							unlocked = f672_local10
						}
						f672_local11( f672_local12, f672_local13 )
					end
				end
				f672_local7 = "COLLECTIBLE_NOT_FOUND_SHORT"
			end
		end
		table.sort( f672_local0, function ( f673_arg0, f673_arg1 )
			return f673_arg1.models.unlocked and not f673_arg0.models.unlocked
		end )
		return f672_local0
	end
	 ),
	BookmarksList = f0_local7( "BookmarksList", function ( f674_arg0 )
		local f674_local0 = {}
		if Dvar.ui_codexindex_unlocked:get() then
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "index.htm",
					bookmarkDesc = "INDEX"
				},
				propteries = {}
			} )
		end
		table.insert( f674_local0, {
			models = {
				bookmarkURL = "CIA-HomePage.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAHOME" )
			},
			propteries = {}
		} )
		table.insert( f674_local0, {
			models = {
				bookmarkURL = "WinslowAccord-MainMenu.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_WINSLOWMAIN" )
			},
			propteries = {}
		} )
		table.insert( f674_local0, {
			models = {
				bookmarkURL = "Omnipedia-WinslowAccord.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNIWINSLOW" )
			},
			propteries = {}
		} )
		table.insert( f674_local0, {
			models = {
				bookmarkURL = "Omnipedia-CDP.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNICDP" )
			},
			propteries = {}
		} )
		table.insert( f674_local0, {
			models = {
				bookmarkURL = "Omnipedia-CIA.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNICIA" )
			},
			propteries = {}
		} )
		if HighestMapReachedGreaterThan( f674_arg0, 15 ) then
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "CEA-EgyptianForcesMoveAgainstNRC.htm",
					bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSEGYPT" )
				},
				propteries = {}
			} )
		end
		if HighestMapReachedGreaterThan( f674_arg0, 6 ) then
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "CEA-GangViolenceSpillsIntoSingapore.htm",
					bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSGANG" )
				},
				propteries = {}
			} )
		end
		if HighestMapReachedGreaterThan( f674_arg0, 8 ) then
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "CEA-VictoryisWithinOurGrasp.htm",
					bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSVICTORY" )
				},
				propteries = {}
			} )
		end
		if HighestMapReachedGreaterThan( f674_arg0, 5 ) then
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "CIA-Krueger-FileEntryPoint.htm",
					bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAKRUEGER" )
				},
				propteries = {}
			} )
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "CIA-COALESCENCE-AudioLandingPage.htm",
					bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIASGEN" )
				},
				propteries = {}
			} )
		end
		if HighestMapReachedGreaterThan( f674_arg0, 11 ) then
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "CIA-Infection-AudioLandingPage.htm",
					bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAINFECTION" )
				},
				propteries = {}
			} )
		end
		if HighestMapReachedGreaterThan( f674_arg0, 16 ) then
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "CIA-Zurich-AudioLandingPage.htm",
					bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAZURICH" )
				},
				propteries = {}
			} )
			table.insert( f674_local0, {
				models = {
					bookmarkURL = "WinslowAccord-TeamPhiAutopsy.htm",
					bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_WINSLOWTEAMPHI" )
				},
				propteries = {}
			} )
		end
		for f674_local9, f674_local10 in pairs( CoD.mapsTable ) do
			if f674_local10.collectibles and f674_local10.collectibles ~= "" and (not CoD.perController[f674_arg0].inspectingMap or CoD.perController[f674_arg0].inspectingMap == f674_local9) then
				for f674_local7, f674_local8 in ipairs( Engine.GetAssetList( f674_local10.collectibles ) ) do
					if Engine.ClientHasCollectible( f674_arg0, f674_local9, f674_local7 - 1 ) then
						table.insert( f674_local0, {
							models = {
								bookmarkURL = f674_local8.codexurl,
								bookmarkDesc = Engine.Localize( f674_local8.codexurldesc )
							},
							properties = {}
						} )
					end
				end
			end
		end
		return f674_local0
	end
	 ),
	GalleryList = f0_local7( "GalleryList", function ( f675_arg0 )
		local f675_local0 = {}
		local f675_local1 = {
			"cp_mi_eth_prologue",
			"cp_mi_zurich_newworld",
			"cp_mi_sing_blackstation",
			"cp_mi_sing_biodomes",
			"cp_mi_sing_sgen",
			"cp_mi_sing_vengeance",
			"cp_mi_cairo_ramses",
			"cp_mi_cairo_infection",
			"cp_mi_cairo_aquifer",
			"cp_mi_cairo_lotus",
			"cp_mi_zurich_coalescence"
		}
		local f675_local2 = Engine.GetPlayerStats( f675_arg0 )
		local f675_local3 = Engine.GetAssetList( "cp_default_gallery" )
		for f675_local4 = 1, #f675_local3, 1 do
			table.insert( f675_local0, {
				models = {
					displayName = f675_local3[f675_local4].displayName,
					image = f675_local3[f675_local4].image,
					unlocked = true
				},
				properties = {
					mapName = "",
					unlocked = true
				}
			} )
		end
		for f675_local4 = 1, #f675_local1, 1 do
			local f675_local7 = f675_local1[f675_local4]
			local f675_local8 = CoD.mapsTable[f675_local7]
			local f675_local9
			if f675_local2.PlayerStatsByMap[f675_local7].hasBeenCompleted:get() ~= 1 then
				f675_local9 = f675_local8.isSafeHouse
			else
				f675_local9 = true
			end
			if f675_local9 then
				f675_local3 = Engine.GetAssetList( f675_local7 .. "_list" )
				if f675_local3 ~= nil then
					for f675_local10 = 1, #f675_local3, 1 do
						table.insert( f675_local0, {
							models = {
								displayName = f675_local3[f675_local10].displayName,
								image = f675_local3[f675_local10].image,
								unlocked = true
							},
							properties = {
								mapName = "",
								unlocked = true
							}
						} )
					end
				end
			end
		end
		return f675_local0
	end
	 ),
	StartMenuCollectables = f0_local7( "StartMenuCollectables", function ( f676_arg0 )
		local f676_local0 = {}
		local f676_local1 = Dvar.ui_mapname:get()
		if LUI.endswith( f676_local1, "2" ) or LUI.endswith( f676_local1, "3" ) then
			f676_local1 = string.sub( f676_local1, 0, string.len( f676_local1 ) - 1 )
		end
		for f676_local10, f676_local11 in pairs( CoD.mapsTable ) do
			if f676_local10 == f676_local1 and f676_local11.collectibles ~= nil and f676_local11.collectibles ~= "" then
				for f676_local8, f676_local9 in ipairs( Engine.GetAssetList( f676_local11.collectibles ) ) do
					table.insert( f676_local0, {
						models = {
							image = f676_local9.uiMaterial
						},
						properties = {
							unlocked = Engine.ClientHasCollectible( f676_arg0, f676_local1, f676_local8 - 1 )
						}
					} )
				end
			end
		end
		return f676_local0
	end
	 ),
	StartMenu = {
		getModel = function ( f677_arg0 )
			local f677_local0 = Engine.CreateModel( Engine.GetModelForController( f677_arg0 ), "StartMenu" )
			local f677_local1 = Engine.CreateModel( f677_local0, "score" )
			local f677_local2 = Engine.GetPlayerListData( f677_arg0, Engine.GetClientNum( f677_arg0 ) )
			local f677_local3 = 0
			if f677_local2.score ~= nil then
				f677_local3 = f677_local2.score
			end
			Engine.SetModelValue( f677_local1, f677_local3 )
			return f677_local0
		end
	},
	PlaceCollectiblesTabs = f0_local7( "PDV_PlaceCollectiblesTab", function ( f678_arg0 )
		local f678_local0 = {
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderl
				},
				properties = {
					m_mouseDisabled = true
				}
			},
			{
				models = {
					tabName = Engine.Localize( "COLLECTIBLE_SMALL_COLLECTIBLES_CAPS" ),
					tabWidget = "CoD.smallCollectibles"
				},
				properties = {
					collectibleSize = Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_SMALL
				}
			},
			{
				models = {
					tabName = Engine.Localize( "COLLECTIBLE_MEDIUM_COLLECTIBLES_CAPS" ),
					tabWidget = "CoD.mediumCollectibles"
				},
				properties = {
					collectibleSize = Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_MEDIUM
				}
			},
			{
				models = {
					tabName = Engine.Localize( "COLLECTIBLE_LARGE_COLLECTIBLES_CAPS" ),
					tabWidget = "CoD.largeCollectibles"
				},
				properties = {
					collectibleSize = Enum.bunkCollectibleSizes_e.COLLECTIBLE_SIZE_LARGE
				}
			},
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderr
				},
				properties = {
					m_mouseDisabled = true
				}
			}
		}
		if CoD.perController[f678_arg0].inspectingCollectibleSize then
			for f678_local4, f678_local5 in ipairs( f678_local0 ) do
				if f678_local5.properties and f678_local5.properties.collectibleSize == CoD.perController[f678_arg0].inspectingCollectibleSize then
					f678_local5.properties.selectIndex = true
					break
				end
			end
		end
		return f678_local0
	end
	 ),
	CollectiblesLayout = {
		getModel = function ( f679_arg0 )
			local f679_local0 = {
				"BUNK_COLLECTIBLE_SMALL_1",
				"BUNK_COLLECTIBLE_SMALL_2",
				"BUNK_COLLECTIBLE_SMALL_3",
				"BUNK_COLLECTIBLE_SMALL_4",
				"BUNK_COLLECTIBLE_SMALL_5",
				"BUNK_COLLECTIBLE_SMALL_6",
				"BUNK_COLLECTIBLE_MEDIUM_1",
				"BUNK_COLLECTIBLE_MEDIUM_2",
				"BUNK_COLLECTIBLE_LARGE_1"
			}
			local f679_local1 = Engine.CreateModel( Engine.GetModelForController( f679_arg0 ), "collectiblesLayout" )
			local f679_local2 = Engine.CreateModel( Engine.GetModelForController( f679_arg0 ), "safehouse.inClientBunk" )
			if f679_local2 then
				local f679_local3 = Engine.GetCollectibleLayout( Engine.GetModelValue( f679_local2 ) )
				for f679_local16, f679_local17 in ipairs( f679_local0 ) do
					local f679_local18 = Engine.CreateModel( f679_local1, f679_local17 )
					local f679_local19 = Enum.bunkCollectibleSlots_e[f679_local17]
					local f679_local9, f679_local10, f679_local11, f679_local13 = nil
					local f679_local15 = false
					local f679_local12, f679_local14 = nil
					local f679_local20 = f679_local3[f679_local19]
					if f679_local20 and f679_local20.isSet and f679_local18 then
						local f679_local7 = CoD.mapsTable[f679_local20.mapName]
						if f679_local7 and f679_local7.collectibles and f679_local7.collectibles ~= "" then
							local f679_local8 = Engine.GetAssetInfoFromListIndex( f679_local7.collectibles, f679_local20.collectibleIndex )
							if f679_local8 then
								f679_local9 = f679_local8.uiMaterial
								f679_local10 = f679_local8.uiMaterialLarge
								f679_local11 = f679_local8.displayNameLong
								f679_local12 = f679_local8.audioLog or ""
								f679_local13 = f679_local8.uiModel
								f679_local14 = f679_local7.mapName
								f679_local15 = true
							end
						end
					end
					Engine.SetModelValue( Engine.CreateModel( f679_local18, "image" ), f679_local9 or "" )
					Engine.SetModelValue( Engine.CreateModel( f679_local18, "imageLarge" ), f679_local10 or "" )
					Engine.SetModelValue( Engine.CreateModel( f679_local18, "name" ), f679_local11 or "" )
					Engine.SetModelValue( Engine.CreateModel( f679_local18, "model" ), f679_local13 or "tag_origin" )
					Engine.SetModelValue( Engine.CreateModel( f679_local18, "audioLog" ), f679_local12 or "" )
					Engine.SetModelValue( Engine.CreateModel( f679_local18, "collectibleSlot" ), f679_local19 )
					Engine.SetModelValue( Engine.CreateModel( f679_local18, "mapInfo" ), f679_local14 or "" )
					Engine.SetModelValue( Engine.CreateModel( f679_local18, "isSet" ), f679_local15 )
				end
			end
			return f679_local1
		end
	},
	TrainingSimRatingInfo = f0_local7( "TrainingSimRatingInfo", function ( f680_arg0 )
		local f680_local0 = {}
		local f680_local1 = Engine.GetPlayerStats( f680_arg0 )
		local f680_local2 = Engine.GetAssetList( "rating_list" )
		if f680_local2 ~= nil then
			for f680_local3 = 2, #f680_local2, 1 do
				f680_local0[f680_local3 - 1] = {
					models = f680_local2[f680_local3]
				}
				f680_local0[f680_local3 - 1].models.completed = f680_local1.trainingSimStats.ranksAchieved[f680_local3 - 1]:get() == 1
			end
		end
		return f680_local0
	end
	 ),
	MissionRecordVaultTabs = f0_local7( "MRV_MissionRecordVaultTabs", function ( f681_arg0 )
		return {
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderl
				},
				properties = {
					m_mouseDisabled = true
				}
			},
			{
				models = {
					tabName = Engine.Localize( "MENU_OVERVIEW_CAPS" ),
					tabWidget = "CoD.MissionRecordVault_Overview"
				}
			},
			{
				models = {
					tabName = Engine.Localize( "CPUI_ACCOLADES" ),
					tabWidget = "CoD.MissionRecordVault_Challenges"
				}
			},
			{
				models = {
					tabName = Engine.Localize( "MENU_PERFORMANCE_CAPS" ),
					tabWidget = "CoD.MissionRecordVault_Performance"
				}
			},
			{
				models = {
					tabName = Engine.Localize( "MENU_SELECT_MISSION_CAPS" ),
					tabWidget = "CoD.MissionRecordVault_ReplayMission"
				}
			},
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderr
				},
				properties = {
					m_mouseDisabled = true
				}
			}
		}
	end
	, false, {
		getCount = function ( f682_arg0 )
			local f682_local0 = f682_arg0
			local f682_local1 = f682_arg0.menu
			if f682_local1 then
				f682_local1 = f682_arg0.menu:getModel()
				if f682_local1 then
					f682_local1 = f682_local0 and Engine.GetModel( f682_arg0.menu:getModel(), "showMissionSelect" )
				end
			end
			return f0_local3( f682_arg0 ) + (f682_local1 and Engine.GetModelValue( f682_local1 )) - 1
		end
		,
		getItem = function ( f683_arg0, f683_arg1, f683_arg2 )
			if 5 <= f683_arg2 then
				local f683_local0 = f683_arg1
				local f683_local1 = f683_arg1.menu
				if f683_local1 then
					f683_local1 = f683_arg1.menu:getModel()
					if f683_local1 then
						f683_local1 = f683_local0 and Engine.GetModel( f683_arg1.menu:getModel(), "showMissionSelect" )
					end
				end
				if (f683_local1 and Engine.GetModelValue( f683_local1 )) ~= 1 then
					f683_arg2 = f683_arg2 + 1
				end
			end
			return f0_local4( f683_arg0, f683_arg1, f683_arg2 )
		end
		
	} ),
	MissionRecordVaultMapInfo = {
		getModel = function ( f684_arg0 )
			local f684_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo" )
			local f684_local1 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
			local f684_local2 = f684_local1 and Engine.GetModelValue( f684_local1 )
			local f684_local3 = CoD.mapsTable[f684_local2]
			if f684_local3 == nil then
				return f684_local0
			end
			Engine.SetModelValue( Engine.CreateModel( f684_local0, "mapId" ), f684_local2 )
			for f684_local7, f684_local8 in ipairs( {
				"previewImage",
				"mapName",
				"mapDescription",
				"mapDescriptionShort",
				"resisttitle1",
				"resist1",
				"resist1short",
				"resisttitle2",
				"resist2",
				"resist2short",
				"resisttitle3",
				"resist3",
				"resist3short"
			} ) do
				Engine.SetModelValue( Engine.CreateModel( f684_local0, f684_local8 ), f684_local3[f684_local8] )
			end
			f684_local4 = Engine.GetPlayerStats( f684_arg0 )
			f684_local5 = f684_local2
			if string.match( f684_local5, "[0-9]$" ) ~= nil then
				f684_local5 = string.sub( f684_local5, 0, string.len( f684_local5 ) - 1 )
			end
			f684_local6 = f684_local4.PlayerStatsByMap[f684_local5]
			if f684_local6 then
				for f684_local10, f684_local11 in ipairs( {
					"SCORE",
					"KILLS",
					"ASSISTS",
					"HIGHEST_DIFFICULTY"
				} ) do
					Engine.SetModelValue( Engine.CreateModel( f684_local0, f684_local11 ), f684_local6.highestStats[f684_local11]:get() )
				end
			end
			f684_local7 = Engine.GetGDTCampaignMapInfo( f684_local2 )
			if f684_local7 ~= nil then
				for f684_local11, f684_local12 in ipairs( {
					"mapObjective",
					"engageClose",
					"engageMedium",
					"engageLong",
					"resistanceText",
					"operationsBackground"
				} ) do
					Engine.SetModelValue( Engine.CreateModel( f684_local0, f684_local12 ), f684_local7[f684_local12] )
				end
			end
			return f684_local0
		end
	},
	AARAccolades = f0_local7( "AARAccolades", function ( f685_arg0 )
		local f685_local0 = CoD.perController[f685_arg0].aarAccoladeMapName
		if not f685_local0 then
			f685_local0 = CoD.AARUtilityCP.GetLastMapName()
		end
		local f685_local1 = f685_local0
		local f685_local2 = CoD.mapsTable[f685_local0]
		if f685_local2 then
			f685_local2 = f685_local1 and CoD.mapsTable[f685_local0].accoladelist
		end
		local f685_local3 = {}
		local f685_local4 = f685_local2 and Engine.GetAssetList( f685_local2 )
		if f685_local4 ~= nil then
			for f685_local5 = 1, #f685_local4, 1 do
				f685_local3[f685_local5] = {
					models = f685_local4[f685_local5]
				}
			end
			local f685_local5 = {
				"2",
				"100",
				"17:20",
				"1",
				"0"
			}
			local f685_local6 = Engine.GetPlayerStats( f685_arg0 )
			local f685_local8 = tonumber( Engine.TableLookup( f685_arg0, CoD.statsMilestone, 4, f685_local3[1].models.challengeReference, 0 ) )
			for f685_local9 = 1, #f685_local3, 1 do
				local f685_local12 = tonumber( Engine.TableLookup( f685_arg0, CoD.statsMilestone, 4, f685_local3[f685_local9].models.challengeReference, 0 ) )
				local f685_local13 = tonumber( Engine.TableLookup( f685_arg0, CoD.statsMilestone, 4, f685_local3[f685_local9].models.challengeReference, 2 ) )
				local f685_local14 = Engine.TableLookup( f685_arg0, CoD.statsMilestone, 4, f685_local3[f685_local9].models.challengeReference, 2 ) == "1"
				local f685_local15 = f685_local6.PlayerStatsByMap[f685_local0].accolades[f685_local12 - f685_local8].state:get()
				local f685_local16 = f685_local6.PlayerStatsByMap[f685_local0].accolades[f685_local12 - f685_local8].value:get()
				local f685_local17 = f685_local6.PlayerStatsByMap[f685_local0].accolades[f685_local12 - f685_local8].highestValue:get()
				f685_local3[f685_local9].models.completed = f685_local15 ~= 0
				if f685_local14 then
					if f685_local3[f685_local9].models.completed == true then
						f685_local3[f685_local9].models.challengeProgressQuantity = ""
						f685_local3[f685_local9].models.highestValue = ""
					else
						f685_local3[f685_local9].models.challengeProgressQuantity = "CPUI_INCOMPLETE"
						f685_local3[f685_local9].models.highestValue = "CPUI_INCOMPLETE"
					end
				else
					f685_local3[f685_local9].models.challengeProgressQuantity = tostring( f685_local16 )
					f685_local3[f685_local9].models.highestValue = tostring( f685_local17 )
				end
				if IsCPAndInSafehouse() then
					f685_local3[f685_local9].models.challengeProgressQuantity = f685_local3[f685_local9].models.highestValue
				end
			end
		end
		return f685_local3
	end
	 ),
	MissionRecordVaultChallengeInfo = f0_local7( "MissionRecordVaultChallengeInfo", function ( f686_arg0 )
		local f686_local0 = Dvar.ui_mapname:get()
		if InSafehouseOrFrontend() then
			local f686_local1 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
			f686_local0 = f686_local1 and Engine.GetModelValue( f686_local1 )
		end
		local f686_local1 = CoD.GetMapValue( f686_local0, "rootMapName" )
		local f686_local2 = f686_local1
		local f686_local3 = CoD.mapsTable[f686_local1]
		if f686_local3 then
			f686_local3 = f686_local2 and CoD.mapsTable[f686_local1].accoladelist
		end
		local f686_local4 = {}
		local f686_local5 = f686_local3 and Engine.GetAssetList( f686_local3 )
		if f686_local5 ~= nil then
			for f686_local6 = 1, #f686_local5, 1 do
				f686_local4[f686_local6] = {
					models = f686_local5[f686_local6]
				}
			end
			local f686_local6 = {
				"2",
				"100",
				"17:20",
				"1",
				"0"
			}
			local f686_local7 = Engine.GetPlayerStats( f686_arg0 )
			local f686_local8 = CoD.statsMilestone
			if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true then
				f686_local7 = CoD.GetCombatRecordStats( f686_arg0 )
				f686_local8 = CoD.getStatsMilestoneTable( 1, Enum.eModes.MODE_CAMPAIGN )
			end
			local f686_local9 = CoD.mapsTable[f686_local0].rootMapName
			local f686_local10 = tonumber( Engine.TableLookup( f686_arg0, f686_local8, 4, f686_local4[1].models.challengeReference, 0 ) )
			for f686_local11 = 1, #f686_local4, 1 do
				local f686_local14 = tonumber( Engine.TableLookup( f686_arg0, f686_local8, 4, f686_local4[f686_local11].models.challengeReference, 0 ) )
				local f686_local15 = tonumber( Engine.TableLookup( f686_arg0, f686_local8, 4, f686_local4[f686_local11].models.challengeReference, 2 ) )
				local f686_local16 = Engine.TableLookup( f686_arg0, f686_local8, 4, f686_local4[f686_local11].models.challengeReference, 2 ) == "1"
				local f686_local17 = f686_local7.PlayerStatsByMap[f686_local9].accolades[f686_local14 - f686_local10].state:get()
				local f686_local18 = f686_local7.PlayerStatsByMap[f686_local9].accolades[f686_local14 - f686_local10].value:get()
				local f686_local19 = f686_local7.PlayerStatsByMap[f686_local9].accolades[f686_local14 - f686_local10].highestValue:get()
				f686_local4[f686_local11].models.completed = f686_local17 ~= 0
				if f686_local16 then
					if f686_local4[f686_local11].models.completed == true then
						f686_local4[f686_local11].models.challengeProgressQuantity = ""
						f686_local4[f686_local11].models.highestValue = ""
					else
						f686_local4[f686_local11].models.challengeProgressQuantity = "CPUI_INCOMPLETE"
						f686_local4[f686_local11].models.highestValue = "CPUI_INCOMPLETE"
					end
				else
					f686_local4[f686_local11].models.challengeProgressQuantity = tostring( f686_local18 )
					f686_local4[f686_local11].models.highestValue = tostring( f686_local19 )
				end
				if IsCPAndInSafehouse() then
					f686_local4[f686_local11].models.challengeProgressQuantity = f686_local4[f686_local11].models.highestValue
				end
			end
		end
		return f686_local4
	end
	 ),
	WeaponCustomCategory = f0_local7( "WeaponCustomizationCategory", function ( f687_arg0 )
		local f687_local0 = {}
		local f687_local1 = CoD.perController[f687_arg0].classModel
		local f687_local2 = CoD.perController[f687_arg0].weaponCategory
		local f687_local3 = Engine.GetModelValue( Engine.GetModel( f687_local1, f687_local2 .. ".itemIndex" ) )
		local f687_local4 = Engine.GetNumAttachments( f687_local3 )
		local f687_local5 = CoD.CACUtility.PrimaryAttachmentSlotNameList
		local f687_local6 = "primaryattachment"
		if f687_local2 == "secondary" then
			f687_local5 = CoD.CACUtility.SecondaryAttachmentSlotNameList
			f687_local6 = "secondaryattachment"
		end
		local f687_local7 = function ( f688_arg0, f688_arg1, f688_arg2, f688_arg3, f688_arg4, f688_arg5, f688_arg6 )
			return {
				models = {
					displayText = f688_arg0,
					type = f688_arg1,
					name = f688_arg2,
					image = f688_arg3 or "blacktransparent",
					paintjobSlot = f688_arg4,
					paintjobIndex = f688_arg5,
					paintjobSlotAndIndex = f688_arg6
				},
				properties = {}
			}
		end
		
		local f687_local8 = function ( f689_arg0, f689_arg1, f689_arg2, f689_arg3, f689_arg4, f689_arg5, f689_arg6 )
			local f689_local0 = f687_local7( f689_arg0, f689_arg1, f689_arg2, f689_arg3, f689_arg4, f689_arg5, f689_arg6 )
			f689_local0.properties.viewWidget = "CoD.WeaponCustomizationSelect"
			f689_local0.properties.xcamNotetrack = "select01"
			return f689_local0
		end
		
		local f687_local9 = Engine.GetModel( f687_local1, f687_local2 .. "paintjobslot" )
		local f687_local10 = Engine.GetModel( f687_local1, f687_local2 .. "paintjobindex" )
		local f687_local11 = Engine.GetModelValue( Engine.GetModel( f687_local9, "itemIndex" ) )
		local f687_local12 = Engine.GetModelValue( Engine.GetModel( f687_local10, "itemIndex" ) )
		local f687_local13 = nil
		if Paintjobs_IsEnabled( nil, f687_arg0 ) and not IsUserContentRestricted( f687_arg0 ) then
			table.insert( f687_local0, f687_local8( Engine.Localize( "MENU_FILESHARE_CATEGORY_PAINTJOBS" ), "paintjob", "", nil, f687_local11, f687_local12, f687_local11 .. " " .. f687_local12 ) )
		end
		local f687_local14 = Engine.GetModel( f687_local1, f687_local2 .. "camo" )
		table.insert( f687_local0, f687_local8( Engine.Localize( "MPUI_CAMO" ), "camo", Engine.GetModelValue( Engine.GetModel( f687_local14, "name" ) ), Engine.GetModelValue( Engine.GetModel( f687_local14, "image" ) ), nil, nil, nil ) )
		if AllowWeaponPrestige( f687_arg0 ) then
			for f687_local20, f687_local21 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				local f687_local22 = Engine.GetAttachmentIndexByAttachmentTableIndex( f687_local3, Engine.GetAttachmentIndexByRef( f687_local21 ) )
				if f687_local22 and CoD.CACUtility.EmptyItemIndex < f687_local22 then
					local f687_local18 = Engine.GetModelValue( Engine.GetModel( f687_local1, f687_local2 .. CoD.CACUtility[f687_local2 .. "WeaponPrestigeSlot"] .. ".name" ) )
					local f687_local19 = Engine.GetModelValue( Engine.GetModel( f687_local1, f687_local2 .. CoD.CACUtility[f687_local2 .. "WeaponPrestigeSlot"] .. ".image" ) )
					if f687_local18 == "" then
					
					else
						table.insert( f687_local0, f687_local8( Engine.Localize( "MENU_WEAPON_PRESTIGE" ), CoD.CACUtility[f687_local2 .. "WeaponPrestigeSlot"], f687_local18, f687_local19, nil, nil, nil ) )
						break
					end
					f687_local18 = "MPUI_NONE"
				end
			end
		end
		return f687_local0
	end
	, false ),
	WeaponOptions = {
		prepare = function ( f690_arg0, f690_arg1, f690_arg2 )
			if not CoD.WeaponOptionsTable then
				CoD.WeaponOptionsTable = CoD.GetWeaponOptionsTable( f690_arg0, f690_arg1, f690_arg2 )
			end
			f690_arg1.weaponOptions = CoD.WeaponOptionsTable
		end,
		getCount = function ( f691_arg0 )
			local f691_local0 = DataSources.WeaponOptions.currentFilter
			if not f691_local0 and f691_arg0.weaponOptions.filterList then
				return #f691_arg0.weaponOptions.filterList
			elseif f691_arg0.weaponOptions[f691_local0] then
				return #f691_arg0.weaponOptions[f691_local0]
			else
				return 0
			end
		end,
		getItem = function ( f692_arg0, f692_arg1, f692_arg2 )
			local f692_local0 = DataSources.WeaponOptions.currentFilter
			if not f692_local0 and f692_arg1.weaponOptions.filterList then
				return f692_arg1.weaponOptions.filterList[f692_arg2]
			elseif f692_arg1.weaponOptions[f692_local0] then
				return f692_arg1.weaponOptions[f692_local0][f692_arg2]
			else
				
			end
		end,
		setCurrentFilterItem = function ( f693_arg0 )
			DataSources.WeaponOptions.currentFilter = f693_arg0
		end,
		getCurrentFilterItem = function ()
			return DataSources.WeaponOptions.currentFilter
		end,
		currentFilter = nil,
		setCurrentFilterItemNoMode = function ( f695_arg0 )
			DataSources.WeaponOptions.currentFilterNoMode = f695_arg0
		end,
		getCurrentFilterItemNoMode = function ()
			return DataSources.WeaponOptions.currentFilterNoMode
		end,
		currentFilterNoMode = nil
	},
	GunsmithWeaponOptions = {
		prepare = function ( f697_arg0, f697_arg1, f697_arg2 )
			if not CoD.GunsmithWeaponOptionsTable then
				CoD.GunsmithWeaponOptionsTable = CoD.GetGunsmithWeaponOptionsTable( f697_arg0, f697_arg1, f697_arg2 )
			end
			f697_arg1.gunsmithWeaponOptions = CoD.GunsmithWeaponOptionsTable
		end,
		getCount = function ( f698_arg0 )
			local f698_local0 = DataSources.GunsmithWeaponOptions.currentFilter
			if not f698_local0 and f698_arg0.gunsmithWeaponOptions.filterList then
				return #f698_arg0.gunsmithWeaponOptions.filterList
			elseif f698_arg0.gunsmithWeaponOptions[f698_local0] then
				return #f698_arg0.gunsmithWeaponOptions[f698_local0]
			else
				return 0
			end
		end,
		getItem = function ( f699_arg0, f699_arg1, f699_arg2 )
			local f699_local0 = DataSources.GunsmithWeaponOptions.currentFilter
			if not f699_local0 and f699_arg1.gunsmithWeaponOptions.filterList then
				return f699_arg1.gunsmithWeaponOptions.filterList[f699_arg2]
			elseif f699_arg1.gunsmithWeaponOptions[f699_local0] then
				return f699_arg1.gunsmithWeaponOptions[f699_local0][f699_arg2]
			else
				
			end
		end,
		setCurrentFilterItem = function ( f700_arg0 )
			DataSources.GunsmithWeaponOptions.currentFilter = f700_arg0
		end,
		getCurrentFilterItem = function ()
			return DataSources.GunsmithWeaponOptions.currentFilter
		end,
		currentFilter = nil,
		setCurrentFilterItemNoMode = function ( f702_arg0 )
			DataSources.GunsmithWeaponOptions.currentFilterNoMode = f702_arg0
		end,
		getCurrentFilterItemNoMode = function ()
			return DataSources.GunsmithWeaponOptions.currentFilterNoMode
		end,
		currentFilterNoMode = nil
	},
	AttachmentCosmeticVariantList = f0_local7( "AttachmentCosmeticVariantList", function ( f704_arg0 )
		local f704_local0 = {}
		local f704_local1 = function ( f705_arg0, f705_arg1 )
			local f705_local0 = CoD.BlackMarketUtility.IsItemLocked( f704_arg0, f705_arg0.acvName )
			local f705_local1 = f705_arg0.name
			if f705_local0 then
				f705_local1 = CoD.BlackMarketUtility.ClassifiedName()
			end
			return {
				models = {
					name = Engine.Localize( f705_local1 ),
					image = f705_arg0.image or "blacktransparent",
					variantIndex = f705_arg0.variantIndex,
					isBMClassified = CoD.BlackMarketUtility.IsItemLocked( f704_arg0, f705_arg0.acvName ),
					rarityType = {
						rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f705_arg0.acvName ),
						isBMClassified = f705_local0
					}
				},
				properties = {
					attachmentRef = f705_arg1,
					variantIndex = f705_arg0.variantIndex,
					itemIndex = CoD.WC_Category.ACV.selectedAttachmentIndex
				}
			}
		end
		
		local f704_local2 = Engine.GetAttachmentUniqueImageByIndex( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex, CoD.WC_Category.ACV.selectedAttachmentIndex )
		local f704_local3 = CoD.WC_Category.ACV.selectedAttachment
		if CoD.WC_Category.ACV.attachmentTable[f704_local3] then
			local f704_local4 = f704_local1( {
				name = "MENU_DEFAULT",
				image = f704_local2,
				variantIndex = 0
			}, f704_local3 )
			f704_local4.models.isClassified = false
			table.insert( f704_local0, f704_local4 )
			for f704_local8, f704_local9 in ipairs( CoD.WC_Category.ACV.attachmentTable[f704_local3].variants ) do
				table.insert( f704_local0, f704_local1( f704_local9, f704_local3 ) )
			end
		end
		table.sort( f704_local0, CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex )
		return f704_local0
	end
	, true ),
	GunsmithAttachmentVariantList = f0_local7( "GunsmithAttachmentVariantList", function ( f706_arg0 )
		local f706_local0 = {}
		local f706_local1 = function ( f707_arg0, f707_arg1, f707_arg2 )
			local f707_local0 = CoD.BlackMarketUtility.IsItemLocked( f706_arg0, f707_arg0.acvName )
			local f707_local1 = f707_arg0.name
			if f707_local0 then
				f707_local1 = CoD.BlackMarketUtility.ClassifiedName()
			end
			return {
				models = {
					name = Engine.Localize( f707_local1 ),
					image = f707_arg0.image or "blacktransparent",
					variantIndex = f707_arg0.variantIndex,
					isBMClassified = f707_local0,
					attachmentIndex = f707_arg2,
					rarityType = {
						rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f707_arg0.acvName ),
						isBMClassified = f707_local0
					}
				},
				properties = {
					attachmentRef = f707_arg1,
					variantIndex = f707_arg0.variantIndex
				}
			}
		end
		
		local f706_local2 = CoD.perController[f706_arg0].gunsmithAttachmentModel
		local f706_local3 = CoD.perController[f706_arg0].gunsmithVariantModel
		local f706_local4 = Engine.GetAttachmentCosmeticVariantTable( CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f706_arg0, f706_local3 ) )
		if f706_local2 and f706_local3 then
			local f706_local5 = Engine.GetModelValue( f706_local2 )
			local f706_local6 = Engine.GetAttachmentRefByIndex( f706_local5 )
			local f706_local7 = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, CoD.GetCustomization( f706_arg0, "weapon_index" ), f706_local5 )
			if f706_local4[f706_local6] then
				local f706_local8 = f706_local1( {
					name = "MENU_DEFAULT",
					image = f706_local7,
					variantIndex = 0
				}, f706_local6, f706_local5 )
				f706_local8.models.isClassified = false
				table.insert( f706_local0, f706_local8 )
				for f706_local12, f706_local13 in ipairs( f706_local4[f706_local6].variants ) do
					table.insert( f706_local0, f706_local1( f706_local13, f706_local6, f706_local5 ) )
				end
			end
		end
		table.sort( f706_local0, CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex )
		return f706_local0
	end
	, true ),
	Arena = {
		getModel = function ( f708_arg0 )
			local f708_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
			local f708_local1 = Engine.GetCurrentArenaSeason()
			local f708_local2 = Engine.GetCurrentArenaSeasonTimeRemaining()
			Engine.SetModelValue( Engine.CreateModel( f708_local0, "season" ), f708_local1 )
			Engine.SetModelValue( Engine.CreateModel( f708_local0, "seasonTimeleft" ), f708_local2 )
			return f708_local0
		end
	},
	ArenaRank = {
		getModel = function ( f709_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f709_arg0 ), "ArenaRank" )
		end
	},
	ArenaInspectionStars = f0_local7( "ArenaInspectionStars", function ( f710_arg0 )
		local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "Arena" ), "selectedPlayerPoints" ) )
		local f710_local1 = CoD.ArenaUtility.GetRankVisibleStars( modelValue )
		local f710_local2 = CoD.ArenaUtility.GetStarCount( modelValue )
		local f710_local3 = {}
		for f710_local4 = 0, f710_local1 - 1, 1 do
			table.insert( f710_local3, {
				models = {
					earned = f710_local4 < f710_local2
				}
			} )
		end
		return f710_local3
	end
	, nil, nil, function ( f711_arg0, f711_arg1, f711_arg2 )
		local f711_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "Arena" ), "selectedPlayerPoints" )
		if f711_arg1.updateSubscription then
			f711_arg1:removeSubscription( f711_arg1.updateSubscription )
		end
		f711_arg1.updateSubscription = f711_arg1:subscribeToModel( f711_local0, function ()
			f711_arg1:updateDataSource()
		end, false )
	end
	 ),
	ArenaActiveRules = f0_local7( "ArenaActiveRules", function ( f713_arg0 )
		local f713_local0 = {}
		if not IsArenaMode() then
			return f713_local0
		elseif PregameItemVoteEnabled() then
			table.insert( f713_local0, {
				models = {
					text = Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_CAPS" )
				}
			} )
		end
		if CharacterDraftEnabled() then
			table.insert( f713_local0, {
				models = {
					text = Engine.Localize( "MENU_DRAFT_ACTIVE_CAPS" )
				}
			} )
		end
		return f713_local0
	end
	, nil, nil, function ( f714_arg0, f714_arg1, f714_arg2 )
		local f714_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyNav" )
		if f714_arg1.lobbyNavSubscription then
			f714_arg1:removeSubscription( f714_arg1.lobbyNavSubscription )
		end
		f714_arg1.lobbyNavSubscription = f714_arg1:subscribeToModel( f714_local0, function ()
			f714_arg1:updateDataSource( true, false )
		end, false )
	end
	 ),
	LoadingScreenPlayerListTeam1 = {
		prepare = function ( f716_arg0, f716_arg1, f716_arg2 )
			local f716_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
			if f716_arg1.teamCountSubscription then
				f716_arg1:removeSubscription( f716_arg1.teamCountSubscription )
			end
			f716_arg1.teamCountSubscription = f716_arg1:subscribeToModel( f716_local0, function ()
				f716_arg1:updateDataSource()
			end, false )
			local f716_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
			local f716_local2 = {
				teamInfo = {}
			}
			f716_local2.teamInfo[1] = {}
			f716_local2.teamInfo[2] = {}
			local f716_local3 = 0
			local f716_local4 = 2
			local f716_local5 = Engine.GetGametypeSetting( "teamCount" ) < 2
			local f716_local6 = 6
			if f716_local5 then
				f716_local6 = 12
			end
			f716_arg1.maxMembersToShowOnEachTeam = f716_local6
			if f716_local1 and f716_local1.sessionClients then
				f716_local3 = #f716_local1.sessionClients
				local f716_local7 = nil
				for f716_local8 = 1, f716_local3, 1 do
					local f716_local11 = f716_local1.sessionClients[f716_local8]
					local f716_local12 = f716_local11.team
					local f716_local13 = f716_local11.xuid
					local f716_local14 = f716_local11.gamertag
					local f716_local15 = f716_local11.clantag
					if f716_local5 or f716_local12 == Enum.team_t.TEAM_ALLIES or f716_local12 == Enum.team_t.TEAM_FREE then
						table.insert( f716_local2.teamInfo[1], {
							name = f716_local14,
							clantag = f716_local15,
							xuid = f716_local13,
							team = f716_local12
						} )
					elseif f716_local12 == Enum.team_t.TEAM_AXIS then
						table.insert( f716_local2.teamInfo[2], {
							name = f716_local14,
							clantag = f716_local15,
							xuid = f716_local13,
							team = f716_local12
						} )
					end
					if Engine.GetXUID64( f716_arg0 ) == f716_local13 then
						f716_local7 = f716_local12
					end
				end
				local f716_local10 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "LoadingScreenInfo" ), "LoadingScreenPlayerList" )
				local f716_local16 = Engine.CreateModel( f716_local10, "team1" )
				local f716_local11 = Engine.CreateModel( f716_local16, "count" )
				local f716_local12 = Engine.CreateModel( f716_local10, "team2" )
				local f716_local13 = Engine.CreateModel( f716_local12, "count" )
				f716_arg1.team1CountModel = f716_local11
				f716_arg1.team1BaseModel = f716_local16
				f716_arg1.team2CountModel = f716_local13
				f716_arg1.team2BaseModel = f716_local12
				f716_local2.teamInfo[1].teamModel = f716_local16
				f716_local2.teamInfo[2].teamModel = f716_local12
				Engine.SetModelValue( f716_local11, #f716_local2.teamInfo[1] )
				Engine.SetModelValue( f716_local13, #f716_local2.teamInfo[2] )
				if not f716_local5 and f716_local7 ~= Enum.team_t.TEAM_ALLIES then
					f716_local2.teamInfo[1].teamModel = f716_local12
					f716_local2.teamInfo[2].teamModel = f716_local16
					Engine.SetModelValue( f716_local11, #f716_local2.teamInfo[2] )
					Engine.SetModelValue( f716_local13, #f716_local2.teamInfo[1] )
				end
				for f716_local14 = 1, f716_local4, 1 do
					for f716_local18 = 1, f716_local6, 1 do
						local f716_local21 = Engine.CreateModel( f716_local2.teamInfo[f716_local14].teamModel, "member" .. f716_local18 )
						if f716_local2.teamInfo[f716_local14][f716_local18] then
							Engine.SetModelValue( Engine.CreateModel( f716_local21, "playerxuid" ), f716_local2.teamInfo[f716_local14][f716_local18].xuid )
							Engine.SetModelValue( Engine.CreateModel( f716_local21, "playerName" ), f716_local2.teamInfo[f716_local14][f716_local18].name )
							local f716_local22 = Engine.CreateModel( f716_local21, "playerHeroLoadoutItem" )
							local f716_local23 = 0
							local f716_local24 = Engine.GetHeroLoadoutItemIndexLobbyData( Engine.CurrentSessionMode(), f716_local2.teamInfo[f716_local14][f716_local18].xuid )
							local f716_local25 = ""
							if f716_local24 ~= 0 then
								f716_local25 = Engine.GetItemName( f716_local24 )
							end
							Engine.SetModelValue( f716_local22, f716_local25 )
							local f716_local26 = Engine.CreateModel( f716_local21, "isSelfPlayerName" )
							local f716_local27 = false
							for f716_local28 = 0, Engine.GetMaxControllerCount() - 1, 1 do
								f716_local27 = Engine.GetXUID64( f716_local28 ) == f716_local2.teamInfo[f716_local14][f716_local18].xuid
								if f716_local27 then
									break
								end
							end
							Engine.SetModelValue( f716_local26, f716_local27 )
							Engine.SetModelValue( Engine.CreateModel( f716_local21, "team" ), f716_local2.teamInfo[f716_local14][f716_local18].team )
						end
					end
				end
			else
				return 
			end
		end,
		getCount = function ( f718_arg0 )
			if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
				return 0
			else
				local f718_local0 = Engine.GetModelValue( f718_arg0.team1CountModel )
				local f718_local1 = Engine.GetModelValue( f718_arg0.team2CountModel )
				local f718_local2 = f718_arg0.maxMembersToShowOnEachTeam
				if not (Engine.GetGametypeSetting( "teamCount" ) >= 2 or f718_local0 > f718_local2) or f718_local0 <= f718_local2 and f718_local1 <= f718_local2 then
					return f718_local0
				else
					return 0
				end
			end
		end,
		getItem = function ( f719_arg0, f719_arg1, f719_arg2 )
			return Engine.GetModel( f719_arg1.team1BaseModel, "member" .. f719_arg2 )
		end
	},
	LoadingScreenPlayerListTeam2 = {
		prepare = function ( f720_arg0, f720_arg1, f720_arg2 )
			DataSources.LoadingScreenPlayerListTeam1.prepare( f720_arg0, f720_arg1, f720_arg2 )
		end,
		getCount = function ( f721_arg0 )
			if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
				return 0
			else
				local f721_local0 = Engine.GetModelValue( f721_arg0.team1CountModel )
				local f721_local1 = Engine.GetModelValue( f721_arg0.team2CountModel )
				local f721_local2 = f721_arg0.maxMembersToShowOnEachTeam
				if f721_local0 <= f721_local2 and f721_local1 <= f721_local2 then
					return f721_local1
				else
					return 0
				end
			end
		end,
		getItem = function ( f722_arg0, f722_arg1, f722_arg2 )
			return Engine.GetModel( f722_arg1.team2BaseModel, "member" .. f722_arg2 )
		end
	},
	MapInfo = {
		getModel = function ( f723_arg0 )
			local f723_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MapInfo" )
			Engine.SetModelValue( Engine.CreateModel( f723_local0, "gameTypeIcon" ), CoD.GetLoadingScreenGameTypeIconName() )
			Engine.SetModelValue( Engine.CreateModel( f723_local0, "gameType" ), Engine.GetCurrentGametypeName( f723_arg0 ) )
			Engine.SetModelValue( Engine.CreateModel( f723_local0, "mapName" ), MapNameToLocalizedMapName( Engine.GetCurrentMap() ) )
			Engine.SetModelValue( Engine.CreateModel( f723_local0, "mapImage" ), CoD.GetMapValue( Dvar.ui_mapname:get(), "loadingImage", "black" ) )
			if not Engine.IsCampaignModeZombies() then
				Engine.SetModelValue( Engine.CreateModel( f723_local0, "dateTime" ), CoD.GetMapValue( Engine.GetCurrentMapName(), "mapDateTime", "" ) )
			end
			Engine.SetModelValue( Engine.CreateModel( f723_local0, "location" ), Dvar.ls_maplocation:get() )
			return f723_local0
		end
	},
	LoadingScreenTeamInfo = {
		getModel = function ( f724_arg0 )
			local f724_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f724_arg0 ), "LoadingScreenInfo" ), "LoadingScreenTeamInfo" )
			local f724_local1 = Engine.CreateModel( f724_local0, "team1FactionName" )
			local f724_local2 = Engine.CreateModel( f724_local0, "team2FactionName" )
			local f724_local3 = Engine.CreateModel( f724_local0, "team1FactionIcon" )
			local f724_local4 = Engine.CreateModel( f724_local0, "team2FactionIcon" )
			local f724_local5 = Engine.CreateModel( f724_local0, "team1FactionColor" )
			local f724_local6 = Engine.CreateModel( f724_local0, "team2FactionColor" )
			local f724_local7 = Engine.CreateModel( f724_local0, "gameTypeIcon" )
			local f724_local8 = Engine.CreateModel( f724_local0, "gameType" )
			local f724_local9 = Engine.CreateModel( f724_local0, "mapName" )
			local f724_local10 = Engine.CreateModel( f724_local0, "location" )
			local f724_local11 = Engine.CreateModel( f724_local0, "tip" )
			local f724_local12 = Engine.CreateModel( f724_local0, "statusText" )
			local f724_local13 = Engine.CreateModel( f724_local0, "loadedFraction" )
			local f724_local14, f724_local15 = nil
			local f724_local16 = CoD.GetTeamID( f724_arg0 )
			local f724_local17 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			local f724_local18 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
			if f724_local16 == Enum.team_t.TEAM_SPECTATOR then
				if CoD.ShoutcasterProfileVarBool( f724_arg0, "shoutcaster_flip_scorepanel" ) then
					f724_local14 = f724_local18
					f724_local15 = f724_local17
				else
					f724_local14 = f724_local17
					f724_local15 = f724_local18
				end
			elseif f724_local16 == Enum.team_t.TEAM_ALLIES then
				f724_local14 = f724_local17
				f724_local15 = f724_local18
			else
				f724_local14 = f724_local18
				f724_local15 = f724_local17
			end
			Engine.SetModelValue( f724_local1, f724_local14.name )
			Engine.SetModelValue( f724_local3, f724_local14.icon )
			Engine.SetModelValue( f724_local5, f724_local14.color )
			Engine.SetModelValue( f724_local2, f724_local15.name )
			Engine.SetModelValue( f724_local4, f724_local15.icon )
			Engine.SetModelValue( f724_local6, f724_local15.color )
			Engine.SetModelValue( f724_local7, CoD.GetLoadingScreenGameTypeIconName() )
			Engine.SetModelValue( f724_local9, MapNameToLocalizedMapName( Engine.GetCurrentMap() ) )
			Engine.SetModelValue( f724_local10, "" )
			if CoD.Loading ~= nil then
				Engine.SetModelValue( f724_local11, CoD.Loading.GetDidYouKnowString() )
			end
			Engine.SetModelValue( f724_local12, "" )
			Engine.SetModelValue( f724_local13, 0 )
			return f724_local0
		end
	},
	AbilityWheel = {
		getModel = function ( f725_arg0 )
			local f725_local0 = CoD.CACUtility.abilityButtonNumMapping
			local f725_local1 = Engine.CreateModel( Engine.GetModelForController( f725_arg0 ), "AbilityWheel" )
			local f725_local2 = Engine.GetModel( Engine.GetModelForController( f725_arg0 ), "hudItems.cybercomRequestedType" )
			Engine.CreateModel( f725_local1, "selectedAbilityDisplayName" )
			Engine.CreateModel( f725_local1, "selectedAbilityDisplayDesc" )
			Engine.CreateModel( f725_local1, "selectedAbilityDisplayIcon" )
			if Engine.GetModelValue( f725_local2 ) == nil then
				Engine.SetModelValue( f725_local2, 0 )
			end
			local f725_local3 = Engine.GetModelValue( f725_local2 )
			local f725_local4 = {
				"MENU_CONTROL",
				"MENU_MARTIAL",
				"MENU_CHAOS",
				"MENU_DEMO"
			}
			Engine.SetModelValue( Engine.CreateModel( f725_local1, "name" ), f725_local4[f725_local3 + 1] )
			local f725_local5 = function ( f726_arg0 )
				Engine.SetModelValue( Engine.CreateModel( f726_arg0, "name" ), nil )
				Engine.SetModelValue( Engine.CreateModel( f726_arg0, "image" ), nil )
				Engine.SetModelValue( Engine.CreateModel( f726_arg0, "enabled" ), false )
			end
			
			local f725_local6 = 0
			local f725_local7 = 0
			for f725_local8 = 1, CoD.CACUtility.maxAbilities, 1 do
				local f725_local11 = Engine.GetTacticalMenuItems( f725_arg0, f725_local8 - 1, f725_local3 )
				local f725_local12 = nil
				if f725_local11.contextual then
					f725_local12 = Engine.CreateModel( f725_local1, "AbilityWheelContextualWeapon" .. f725_local7 + 1 )
				else
					f725_local12 = Engine.CreateModel( f725_local1, "AbilityWheelWeapon" .. f725_local0[f725_local6 + 1] )
				end
				Engine.SetModelValue( Engine.CreateModel( f725_local12, "image" ), f725_local11.image )
				Engine.SetModelValue( Engine.CreateModel( f725_local12, "name" ), f725_local11.name )
				Engine.SetModelValue( Engine.CreateModel( f725_local12, "displayName" ), f725_local11.displayName )
				Engine.SetModelValue( Engine.CreateModel( f725_local12, "abilityFlag" ), f725_local11.abilityFlag )
				local f725_local13 = Engine.CreateModel( f725_local12, "enabled" )
				if f725_local11.enabled == nil then
					Engine.SetModelValue( f725_local13, true )
				else
					Engine.SetModelValue( f725_local13, f725_local11.enabled )
				end
				local f725_local14 = Engine.CreateModel( f725_local12, "description" )
				if f725_local11.description ~= nil then
					Engine.SetModelValue( f725_local14, "weapon_" .. f725_local11.description )
				end
				local f725_local15 = Engine.CreateModel( f725_local12, "enemyTypeIcon" )
				if f725_local11.enemyTypeIcon ~= nil then
					Engine.SetModelValue( f725_local15, f725_local11.enemyTypeIcon )
				end
			end
			for f725_local8 = f725_local6 + 1, CoD.CACUtility.maxAbilityWheelItems, 1 do
				f725_local5( Engine.CreateModel( f725_local1, "AbilityWheelWeapon" .. f725_local0[f725_local8] ) )
			end
			for f725_local8 = f725_local7 + 1, CoD.CACUtility.maxContextualAbilityItems, 1 do
				f725_local5( Engine.CreateModel( f725_local1, "AbilityWheelContextualWeapon" .. f725_local8 ) )
			end
			return f725_local1
		end
	},
	SwitchCameraWheel = {
		getModel = function ( f727_arg0 )
			local f727_local0 = {
				{
					disabled = false,
					cameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE,
					image = "t7_hud_ks_drone_hunter_drop",
					displayName = "MENU_DEMO_DVR_FIRST_PERSON"
				},
				{
					disabled = false,
					cameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON,
					image = "t7_hud_ks_drone_amws_drop",
					displayName = "MENU_DEMO_DVR_THIRD_PERSON"
				},
				{
					disabled = false,
					cameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM,
					freeCameraMode = Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_FREEROAM,
					image = "t7_hud_ks_auto_sentry_drop",
					displayName = "MENU_DEMO_DVR_FREE_CAMERA"
				},
				{
					disabled = false,
					cameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM,
					freeCameraMode = Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_LIGHTMAN,
					image = "t7_hud_ks_drone_attack_drop",
					displayName = "MENU_DEMO_DVR_LIGHTMAN"
				},
				{
					disabled = false,
					cameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM,
					freeCameraMode = Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_LOCK_ON,
					image = "t7_hud_ks_drone_dart_drop",
					displayName = "MENU_DEMO_DVR_LOCK_ON_CAMERA"
				},
				{
					disabled = Engine.IsDemoClipRecording(),
					cameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM,
					freeCameraMode = Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_EDIT,
					image = "t7_hud_ks_drone_cuav_drop",
					displayName = "MENU_DEMO_DVR_EDIT_DOLLY_CAMERA"
				},
				{
					disabled = false,
					cameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM,
					freeCameraMode = Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_DOLLY,
					image = "t7_hud_ks_emp_core_drop",
					displayName = "MENU_DEMO_DVR_DOLLY_CAMERA"
				}
			}
			local f727_local1 = Engine.CreateModel( Engine.GetModelForController( f727_arg0 ), "SwitchCameraWheel" )
			Engine.CreateModel( f727_local1, "selectedCameraDisplayName" )
			Engine.CreateModel( f727_local1, "selectedCameraDisplayDesc" )
			Engine.SetModelValue( Engine.CreateModel( f727_local1, "name" ), Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_SWITCH_CAMERA" ) ) )
			for f727_local2 = 1, #f727_local0, 1 do
				local f727_local5 = f727_local0[f727_local2]
				local f727_local6 = Engine.CreateModel( f727_local1, "Camera" .. f727_local2 )
				Engine.SetModelValue( Engine.CreateModel( f727_local6, "displayName" ), Engine.Localize( f727_local5.displayName ) )
				Engine.SetModelValue( Engine.CreateModel( f727_local6, "description" ), Engine.Localize( f727_local5.displayName .. "_DESC" ) )
				Engine.SetModelValue( Engine.CreateModel( f727_local6, "image" ), f727_local5.image )
				Engine.SetModelValue( Engine.CreateModel( f727_local6, "disabled" ), f727_local5.disabled )
				Engine.SetModelValue( Engine.CreateModel( f727_local6, "cameraMode" ), f727_local5.cameraMode )
				if f727_local5.freeCameraMode ~= nil then
					Engine.SetModelValue( Engine.CreateModel( f727_local6, "freeCameraMode" ), f727_local5.freeCameraMode )
				end
			end
			return f727_local1
		end
	},
	CommsMessages = f0_local7( "CommsMessages", function ( f728_arg0 )
		local f728_local0 = {}
		for f728_local1 = 1, 5, 1 do
			table.insert( f728_local0, {
				models = {
					icon = "",
					messageText = ""
				},
				properties = {
					messageIndex = f728_local1
				}
			} )
		end
		return f728_local0
	end
	 ),
	CommsWidget = {
		getModel = function ( f729_arg0 )
			local f729_local0 = Engine.CreateModel( Engine.GetModelForController( f729_arg0 ), "CommsWidget" )
			Engine.SetModelValue( Engine.CreateModel( f729_local0, "characterName" ), "COOP_KANYE_RACHEL" )
			Engine.SetModelValue( Engine.CreateModel( f729_local0, "characterImage" ), "t7_cp_hud_commswidget_rachel" )
			return f729_local0
		end
	},
	VehicleInfo = {
		setButtonModels = function ( f730_arg0, f730_arg1, f730_arg2 )
			local f730_local0 = Engine.GetModel( Engine.GetModelForController( f730_arg0 ), "vehicle" )
			if not f730_local0 then
				return 
			end
			local f730_local1 = Engine.GetModel( f730_local0, "bindings" )
			if f730_local1 then
				Engine.UnsubscribeAndFreeModel( f730_local1 )
			end
			f730_local1 = Engine.CreateModel( f730_local0, "bindings" )
			Engine.SetModelValue( Engine.CreateModel( f730_local1, "color" ), f730_arg2 or "255 255 255" )
			if not f730_arg1 then
				f730_arg1 = {}
			end
			local f730_local2 = IsGamepad( f730_arg0 )
			if f730_local0 then
				local f730_local3 = {}
				for f730_local9, f730_local10 in ipairs( f730_arg1 ) do
					if f730_local10.bindCommand then
						local f730_local7, f730_local8 = Engine.GetBindingButtonString( f730_arg0, f730_local10.bindCommand )
						if f730_local7 then
							if f730_local2 then
								Engine.SetModelValue( Engine.CreateModel( f730_local1, f730_local7 .. ".text" ), f730_local10.text )
							end
							f730_local10.bindPlacement = f730_local7
						end
						if f730_local8 then
							if f730_local2 then
								Engine.SetModelValue( Engine.CreateModel( f730_local1, f730_local8 .. ".text" ), f730_local10.text )
							end
							f730_local10.bindPlacement2 = f730_local8
						end
					end
					f730_local3[f730_local9] = f730_local10
				end
				f730_local4 = function ( f731_arg0, f731_arg1 )
					local f731_local0 = Engine.CreateModel( f730_local0, f731_arg0 .. ".imageText" )
					if f731_arg1 then
						if f731_arg1.bindCommand and f731_arg1.bindCommand ~= "" then
							local f731_local1 = Engine.KeyBinding( f730_arg0, f731_arg1.bindCommand )
							Engine.SetModelValue( Engine.CreateModel( f730_local1, f731_arg0 .. ".bind" ), f731_local1 )
							Engine.SetModelValue( f731_local0, f731_local1 )
						else
							Engine.SetModelValue( f731_local0, f731_arg1.imageText or "" )
						end
					else
						Engine.SetModelValue( f731_local0, "" )
					end
					local f731_local1 = Engine.CreateModel( f730_local0, f731_arg0 .. ".text" )
					if f731_arg1 and f731_arg1.text and f731_arg1.text ~= "" then
						Engine.SetModelValue( Engine.CreateModel( f730_local1, f731_arg0 .. ".text" ), f731_arg1.text )
						Engine.SetModelValue( f731_local1, f731_arg1.text )
					else
						Engine.SetModelValue( f731_local1, "" )
					end
				end
				
				f730_local5 = function ( f732_arg0 )
					local f732_local0 = {}
					local f732_local1 = #f732_arg0
					for f732_local5, f732_local6 in ipairs( f732_arg0 ) do
						f732_local0[f732_local1 + 1 - f732_local5] = f732_local6
					end
					return f732_local0
				end
				
				f730_local6, f730_local9 = nil
				if CoD.isPC then
					f730_local6 = f730_local5( {
						"LEFT_3",
						"LEFT_2",
						"LEFT_1",
						"LEFT_0"
					} )
					f730_local9 = f730_local5( {
						"RIGHT_3",
						"RIGHT_2",
						"RIGHT_1",
						"RIGHT_0"
					} )
				else
					f730_local6 = f730_local5( {
						"topLeftButton",
						"middleLeftButton",
						"bottomLeftButton"
					} )
					f730_local9 = f730_local5( {
						"topRightButton",
						"middleRightButton",
						"bottomRightButton"
					} )
				end
				if f730_local2 then
					f730_local10 = {
						"L_STICK",
						"BUTTON_LSTICK",
						"BUTTON_LSHLDR",
						"BUTTON_LTRIG",
						"BUTTON_X",
						"BUTTON_A"
					}
					local f730_local7 = {
						"R_STICK",
						"BUTTON_RSTICK",
						"BUTTON_RSHLDR",
						"BUTTON_RTRIG"
					}
					local f730_local11 = function ( f733_arg0 )
						local f733_local0 = {}
						for f733_local4, f733_local5 in ipairs( f733_arg0 ) do
							if f733_local5.bindPlacement ~= nil then
								f733_local0[f733_local5.bindPlacement] = f733_local5
							end
						end
						return f733_local0
					end
					
					f730_local11 = f730_local11( f730_local3 )
					local f730_local12 = function ( f734_arg0, f734_arg1, f734_arg2 )
						for f734_local3, f734_local4 in ipairs( f734_arg0 ) do
							if f734_arg2[f734_local4] then
								f730_local4( f734_arg1[1], f734_arg2[f734_local4] )
								table.remove( f734_arg1, 1 )
								if #f734_arg1 == 0 then
									break
								end
							end
						end
						for f734_local3, f734_local4 in ipairs( f734_arg1 ) do
							f730_local4( f734_local4, nil )
						end
					end
					
					leftActions = f730_local5( f730_local10 )
					f730_local12( leftActions, f730_local6, f730_local11 )
					rightActions = f730_local5( f730_local7 )
					f730_local12( rightActions, f730_local9, f730_local11 )
				else
					f730_local10 = {
						"KEYBOARD_MOVE",
						"KEYBOARD_BUTTON",
						"left"
					}
					local f730_local7 = {
						"MOUSE_LOOK",
						"MOUSE_BUTTON",
						"right"
					}
					local f730_local8 = function ( f735_arg0, f735_arg1, f735_arg2 )
						local f735_local0 = function ( f736_arg0, f736_arg1 )
							for f736_local3, f736_local4 in ipairs( f736_arg0 ) do
								if f736_local4.bindCommand == "+lookstick" then
									table.remove( f736_arg0, f736_local3 )
								end
								if f736_local4.screenSide then
									if f736_local4.screenSide == f736_arg1 then
										table.remove( f736_arg0, f736_local3 )
										return f736_local4
									end
								end
								if f736_local4.bindPlacement == f736_arg1 then
									table.remove( f736_arg0, f736_local3 )
									return f736_local4
								end
							end
							return nil
						end
						
						for f735_local5, f735_local6 in ipairs( f735_arg0 ) do
							local f735_local4 = f735_local0( f735_arg2, f735_local6 )
							while f735_local4 ~= nil do
								f730_local4( f735_arg1[1], f735_local4 )
								table.remove( f735_arg1, 1 )
								if #f735_arg1 == 0 then
									
								end
								f735_local4 = f735_local0( f735_arg2, f735_local6 )
							end
						end
						for f735_local5, f735_local6 in ipairs( f735_arg1 ) do
							f730_local4( f735_local6, nil )
						end
					end
					
					leftActions = f730_local5( f730_local10 )
					f730_local8( leftActions, f730_local6, f730_local3 )
					rightActions = f730_local5( f730_local7 )
					f730_local8( rightActions, f730_local9, f730_local3 )
				end
			end
		end,
		clearButtonModels = function ( f737_arg0 )
			DataSources.VehicleInfo.setButtonModels( f737_arg0 )
		end
	},
	Attacker = {
		getModel = function ( f738_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f738_arg0 ), "Attacker" )
		end
	},
	Victim = {
		getModel = function ( f739_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f739_arg0 ), "Victim" )
		end
	},
	TopScorerMenuData = {
		getModel = function ( f740_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f740_arg0 ), "topPlayerInfo" )
		end
	},
	TopPlayerInfoData1 = {
		getModel = function ( f741_arg0 )
			if Engine.GetLuaCodeVersion() >= 8 then
				return Engine.GetModel( DataSources.TopScorerMenuData.getModel( f741_arg0 ), "1" )
			else
				return Engine.GetModel( Engine.GetModelForController( f741_arg0 ), "topPlayerInfo1" )
			end
		end
	},
	TopPlayerInfoData2 = {
		getModel = function ( f742_arg0 )
			if Engine.GetLuaCodeVersion() >= 8 then
				return Engine.GetModel( DataSources.TopScorerMenuData.getModel( f742_arg0 ), "2" )
			else
				return Engine.GetModel( Engine.GetModelForController( f742_arg0 ), "topPlayerInfo2" )
			end
		end
	},
	TopPlayerInfoData3 = {
		getModel = function ( f743_arg0 )
			if Engine.GetLuaCodeVersion() >= 8 then
				return Engine.GetModel( DataSources.TopScorerMenuData.getModel( f743_arg0 ), "3" )
			else
				return Engine.GetModel( Engine.GetModelForController( f743_arg0 ), "topPlayerInfo3" )
			end
		end
	},
	SelfPlayerInfoData = {
		getModel = function ( f744_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f744_arg0 ), "selfPlayerInfo" )
		end
	},
	SocialTabs = f0_local7( "SocialTabs", function ( f745_arg0 )
		local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
		if modelValue == nil then
			modelValue = "friends"
		end
		local f745_local1 = false
		local f745_local2 = {}
		table.insert( f745_local2, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if Engine.IsInGame() == false then
			if CoD.isPC then
				local f745_local3 = table.insert
				local f745_local4 = f745_local2
				local f745_local5 = {
					models = {
						tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
						tabWidget = "CoD.Social_Party_PC"
					}
				}
				local f745_local6 = {
					tabId = "party",
					selectIndex = false
				}
				local f745_local7
				if Dvar.partyPrivacyEnabled:get() then
					f745_local7 = f745_local1
				else
					f745_local7 = true
				end
				f745_local6.disabled = f745_local7
				f745_local5.properties = f745_local6
				f745_local3( f745_local4, f745_local5 )
			else
				local f745_local3 = table.insert
				local f745_local4 = f745_local2
				local f745_local5 = {
					models = {
						tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
						tabWidget = "CoD.Social_Party"
					}
				}
				local f745_local6 = {
					tabId = "party",
					selectIndex = false
				}
				local f745_local7
				if Dvar.partyPrivacyEnabled:get() then
					f745_local7 = f745_local1
				else
					f745_local7 = true
				end
				f745_local6.disabled = f745_local7
				f745_local5.properties = f745_local6
				f745_local3( f745_local4, f745_local5 )
			end
		end
		table.insert( f745_local2, {
			models = {
				tabName = Engine.Localize( "MENU_FRIENDS_CAPS" ),
				tabWidget = "CoD.Social_Friends"
			},
			properties = {
				tabId = "friends",
				selectIndex = false
			}
		} )
		table.insert( f745_local2, {
			models = {
				tabName = Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ),
				tabWidget = "CoD.Social_RecentPlayers"
			},
			properties = {
				tabId = "recent",
				selectIndex = false
			}
		} )
		table.insert( f745_local2, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f745_local3 = 1, #f745_local2, 1 do
			if f745_local2[f745_local3].properties ~= nil then
				if f745_local2[f745_local3].properties.tabId == modelValue then
					f745_local2[f745_local3].properties.selectIndex = true
				else
					f745_local2[f745_local3].properties.selectIndex = false
				end
			end
		end
		return f745_local2
	end
	, true ),
	SocialOnlinePlayersList = f0_local7( "SocialOnlinePlayersList", function ( f746_arg0 )
		local f746_local0 = {}
		local f746_local1 = Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE | Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
		local f746_local2 = {}
		local f746_local3 = false
		local f746_local4 = false
		local f746_local5 = Engine.GetModelValue( Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
		if f746_local5 == "friends" then
			f746_local3 = false
			f746_local4 = false
			f746_local2 = Engine.GetOnlineFriendsList( f746_arg0, 0, 7, f746_local1 )
		elseif f746_local5 == "recent" then
			f746_local3 = true
			f746_local4 = true
			f746_local2 = Engine.GetRecentPlayersList( f746_arg0, 0, 7, f746_local1 )
		elseif f746_local5 == "party" then
			f746_local3 = false
			f746_local4 = false
			local f746_local6 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
			local f746_local7 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
			local f746_local8 = nil
			if f746_local7 and f746_local6.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
				f746_local8 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
			else
				f746_local8 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			end
			local f746_local9 = Engine.GetTitleData( Engine.GetPrimaryController() )
			for f746_local13, f746_local14 in ipairs( f746_local8.sessionClients ) do
				f746_local2[f746_local13] = {}
				local f746_local15 = f746_local2[f746_local13]
				f746_local15.xuid = f746_local14.xuid
				f746_local15.gamertag = f746_local14.gamertag
				f746_local15.clantag = f746_local14.clantag
				f746_local15.isLocal = f746_local14.isLocal
				f746_local15.activity = f746_local9.activity
				f746_local15.context = f746_local9.context
				f746_local15.joinable = Enum.LobbyJoinable.LOBBY_JOINABLE_NO_NOT_IN_LOBBY
				f746_local15.gametype = f746_local9.gametype
				f746_local15.mapid = f746_local9.mapid
				f746_local15.friend = 1
				f746_local15.titlePresence = ""
				f746_local15.cpRank = f746_local14.cpRank
				f746_local15.cpRankIcon = f746_local14.cpRankIcon
				f746_local15.mpRank = f746_local14.mpRank
				f746_local15.mpRankIcon = f746_local14.mpRankIcon
				f746_local15.zmRank = f746_local14.zmRank
				f746_local15.zmRankIcon = f746_local14.zmRankIcon
			end
		else
			f746_local2 = Engine.GetOnlineFriendsList( f746_arg0, 0, 7, f746_local1 )
		end
		for f746_local16 = 1, #f746_local2, 1 do
			local f746_local9 = f746_local2[f746_local16]
			local f746_local10 = ""
			local f746_local11 = string.format( "%s %s", f746_local10, f746_local9.gamertag )
			local f746_local12 = ""
			if f746_local4 then
				f746_local12 = f746_local9.titlePresence
			end
			local f746_local13 = "0"
			if f746_local9.isLocal == 1 then
				f746_local13 = "1"
			end
			table.insert( f746_local0, {
				models = {
					xuid = f746_local9.xuid,
					gamertag = f746_local9.gamertag,
					clantag = f746_local10,
					fullname = f746_local11,
					isLocal = f746_local13,
					activity = f746_local9.activity,
					context = f746_local9.context,
					difficulty = f746_local9.difficulty,
					playlist = f746_local9.playlist,
					joinable = f746_local9.joinable,
					gametype = f746_local9.gametype,
					mapid = f746_local9.mapid,
					friend = f746_local9.friend,
					titlePresence = f746_local12,
					cpRank = f746_local9.cpRank,
					cpRankIcon = f746_local9.cpRankIcon,
					mpRank = f746_local9.mpRank,
					mpRankIcon = GetRankIconLarge( f746_local9.mpRankIcon ),
					zmRank = f746_local9.zmRank,
					zmRankIcon = f746_local9.zmRankIcon
				},
				properties = {
					xuid = f746_local9.xuid,
					showyourfriend = f746_local3,
					showlastmet = f746_local4,
					gametype = f746_local9.gametype,
					mapid = f746_local9.mapid,
					difficulty = f746_local9.difficulty,
					playlist = f746_local9.playlist
				}
			} )
		end
		return f746_local0
	end
	, nil, nil, function ( f747_arg0, f747_arg1, f747_arg2 )
		local f747_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local f747_local1 = Engine.GetModelValue( Engine.GetModel( f747_local0, "tab" ) )
		local f747_local2 = Engine.GetModel( f747_local0, "friends" )
		if f747_local1 == "friends" then
			f747_local2 = Engine.GetModel( f747_local0, "friends" )
		elseif f747_local1 == "recent" then
			f747_local2 = Engine.GetModel( f747_local0, "recentPlayers" )
		elseif f747_local1 == "party" then
			f747_local2 = Engine.GetModel( f747_local0, "party" )
		end
		local f747_local3 = Engine.GetModel( f747_local2, "update" )
		if f747_arg1.socialUpdateSubscription then
			f747_arg1:removeSubscription( f747_arg1.socialUpdateSubscription )
		end
		f747_arg1.socialUpdateSubscription = f747_arg1:subscribeToModel( f747_local3, function ()
			f0_local12( f747_arg0, f747_arg1 )
		end, false )
		if f747_arg1.socialPartyUpdateSubscription then
			f747_arg1:removeSubscription( f747_arg1.socialPartyUpdateSubscription )
		end
		f747_arg1.socialPartyUpdateSubscription = f747_arg1:subscribeToModel( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "privateClient" ), "update" ), function ()
			f0_local12( f747_arg0, f747_arg1 )
		end, false )
	end
	 ),
	SocialMainMenu = {
		getModel = function ( f750_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu" )
		end
	},
	SocialPlayersList = {
		prepare = function ( f751_arg0, f751_arg1, f751_arg2 )
			f751_arg1.numElementsInList = f751_arg1.vCount
			f751_arg1.controller = f751_arg0
			f751_arg1.filter = Enum.PresenceFilter.PRESENCE_FILTER_ALL
			local f751_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
			local f751_local1 = Engine.GetModelValue( Engine.GetModel( f751_local0, "tab" ) )
			if f751_local1 == "friends" then
				f751_arg1.showyourfriend = false
				f751_arg1.showlastmet = false
				f751_arg1.GetList = Engine.GetFriends
				f751_arg1.GetParty = Engine.GetFriendPartry
				f751_arg1.playerCount = Engine.GetFriendsCount( f751_arg0, f751_arg1.filter )
				f751_arg1.socialSubModel = Engine.GetModel( f751_local0, "friends" )
			elseif f751_local1 == "recent" then
				f751_arg1.showyourfriend = true
				f751_arg1.showlastmet = true
				f751_arg1.GetList = Engine.GetRecentPlayersList
				f751_arg1.GetParty = Engine.GetGetRecentPlayerParty
				f751_arg1.playerCount = Engine.GetRecentPlayersCount( f751_arg0, f751_arg1.filter )
				f751_arg1.socialSubModel = Engine.GetModel( f751_local0, "recentPlayers" )
			else
				f751_arg1.showyourfriend = false
				f751_arg1.showlastmet = false
				f751_arg1.GetList = Engine.GetFriends
				f751_arg1.GetParty = Engine.GetFriendPartry
				f751_arg1.playerCount = Engine.GetFriendsCount( f751_arg0, f751_arg1.filter )
				f751_arg1.socialSubModel = Engine.GetModel( f751_local0, "friends" )
			end
			f751_arg1.players = {}
			local f751_local2 = {
				xuid = 0,
				gamertag = "",
				clantag = "",
				emblemBacking = 0,
				fullname = "",
				activity = 0,
				context = 0,
				difficulty = 0,
				playlist = 1,
				joinable = 0,
				gametype = 0,
				mapid = 0,
				friend = 0,
				primaryPresence = Enum.PresencePrimary.PRESENCE_PRIMARY_OFFLINE,
				titlePresence = "",
				platformPresence = "",
				cpPlayed = false,
				cpRank = 0,
				cpRankIcon = "",
				cpPrestige = 0,
				mpPlayed = false,
				mpRank = 0,
				mpRankIcon = "",
				mpPrestige = 0,
				zmPlayed = false,
				zmRank = 0,
				zmRankIcon = "",
				zmPrestige = 0,
				partySize = 1,
				partyMax = 9
			}
			local f751_local3 = {
				xuid = 0,
				showyourfriend = false,
				showlastmet = false,
				gametype = 0,
				mapid = 0,
				difficulty = 0,
				playlist = 1,
				party = {
					members = {},
					total = 1,
					available = 1,
					leader = ""
				}
			}
			for f751_local4 = 1, f751_arg1.numElementsInList, 1 do
				f751_arg1.players[f751_local4] = {}
				f751_arg1.players[f751_local4].root = Engine.CreateModel( f751_arg1.socialSubModel, "player_" .. f751_local4 )
				f751_arg1.players[f751_local4].model = Engine.CreateModel( f751_arg1.players[f751_local4].root, "model" )
				f751_arg1.players[f751_local4].properties = {
					xuid = 0,
					showyourfriend = 0,
					showlastmet = 0,
					gametype = 0,
					mapid = 0,
					difficulty = 0,
					playlist = 1
				}
				for f751_local10, f751_local11 in pairs( f751_local2 ) do
					local f751_local12 = Engine.CreateModel( f751_arg1.players[f751_local4].model, f751_local10 )
				end
			end
			f751_arg1.updateModels = function ( f752_arg0, f752_arg1, f752_arg2, f752_arg3 )
				if not f752_arg1.GetList then
					return 
				end
				local f752_local0 = {}
				f752_local0 = f752_arg1.GetList( f752_arg0, f752_arg2, f752_arg3, f752_arg1.filter )
				for f752_local1 = 1, #f752_local0, 1 do
					local f752_local4 = f752_local0[f752_local1]
					local f752_local5 = (f752_arg2 + f752_local1 - 1) % f752_arg1.numElementsInList + 1
					f752_local4.clantag = ""
					f752_local4.fullname = string.format( "%s%s", f752_local4.clantag, f752_local4.gamertag )
					if f752_arg1.showlastmet == 0 then
						f752_local4.titlePresence = ""
					end
					if LuaUtils.IsBetaBuild() then
						f752_local4.cpPlayed = false
						f752_local4.cpRank = 0
						f752_local4.cpPrestige = 0
						f752_local4.zmPlayed = false
						f752_local4.zmRank = 0
						f752_local4.zmPrestige = 0
					end
					f752_local4.cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", f752_local4.cpPlayed, f752_local4.cpRank, f752_local4.cpPrestige )
					f752_local4.mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", f752_local4.mpPlayed, f752_local4.mpRank, f752_local4.mpPrestige )
					f752_local4.zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", f752_local4.zmPlayed, f752_local4.zmRank, f752_local4.zmPrestige )
					for f752_local9, f752_local10 in pairs( f752_local4 ) do
						local f752_local11 = Engine.GetModel( f752_arg1.players[f752_local5].model, f752_local9 )
						if f752_local11 ~= nil then
							Engine.SetModelValue( f752_local11, f752_local10 )
						end
						if f752_arg1.players[f752_local5].properties[f752_local9] ~= nil then
							f752_arg1.players[f752_local5].properties[f752_local9] = f752_local10
						end
					end
					f752_arg1.players[f752_local5].properties.showlastmet = f752_arg1.showlastmet
					f752_arg1.players[f752_local5].properties.showyourfriend = f752_arg1.showyourfriend
					f752_local6 = f752_arg1.GetParty( f752_arg0, f752_arg2 + f752_local1 - 1 )
					f752_local7 = f752_local4.partyMembers
					f752_arg1.players[f752_local5].properties.party = {}
					if f752_local6.total == nil then
						f752_local6.total = f752_local6.totalCount
						f752_local6.available = f752_local6.availableCount
					end
					f752_arg1.players[f752_local5].properties.party.total = f752_local6.total
					f752_arg1.players[f752_local5].properties.party.available = f752_local6.available
					f752_arg1.players[f752_local5].properties.party.leader = f752_local6.leader
					if #f752_local6.members then
						f752_arg1.players[f752_local5].properties.party.members = {}
						for f752_local8 = 1, #f752_local6.members, 1 do
							f752_arg1.players[f752_local5].properties.party.members[f752_local8] = {}
							f752_arg1.players[f752_local5].properties.party.members[f752_local8].gamertag = f752_local6.members[f752_local8].gamertag
							f752_arg1.players[f752_local5].properties.party.members[f752_local8].leader = f752_local6.members[f752_local8].leader
						end
					end
				end
				return f752_arg1.players[f752_arg2 % f752_arg1.numElementsInList + 1].model
			end
			
			f751_arg1.updateModels( f751_arg0, f751_arg1, 0, f751_arg1.numElementsInList )
			local f751_local4 = Engine.GetModel( f751_arg1.socialSubModel, "update" )
			if f751_arg1.socialUpdateSubscription then
				f751_arg1:removeSubscription( f751_arg1.socialUpdateSubscription )
			end
			f751_arg1.socialUpdateSubscription = f751_arg1:subscribeToModel( f751_local4, function ()
				f0_local12( f751_arg0, f751_arg1 )
			end, false )
		end,
		getCount = function ( f754_arg0 )
			return f754_arg0.playerCount
		end,
		getItem = function ( f755_arg0, f755_arg1, f755_arg2 )
			local f755_local0 = f755_arg1.updateModels( f755_arg0, f755_arg1, f755_arg2 - 1, 1 )
			local f755_local1 = (f755_arg2 - 1)
			return f755_arg1.players[(f755_arg2 - 1) % f755_arg1.numElementsInList + 1].model
		end,
		getCustomPropertiesForItem = function ( f756_arg0, f756_arg1 )
			local f756_local0 = (f756_arg1 - 1)
			return f756_arg0.players[(f756_arg1 - 1) % f756_arg0.numElementsInList + 1].properties
		end
	},
	SocialPlayerPartyList = {
		prepare = function ( f757_arg0, f757_arg1, f757_arg2 )
			f757_arg1.numElementsInList = f757_arg1.vCount
			f757_arg1.controller = f757_arg0
			local f757_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
			f757_arg1.xuidModel = Engine.GetModel( Engine.GetModel( f757_local0, "cache" ), "xuid" )
			local f757_local1 = Engine.GetModel( f757_local0, "party" )
			f757_arg1.partyUpdate = Engine.CreateModel( f757_local1, "update" )
			local f757_local2 = Engine.GetModel( f757_local1, "available" )
			local f757_local3 = Engine.GetModel( f757_local1, "total" )
			local f757_local4 = Engine.GetModel( f757_local1, "leader" )
			f757_arg1.xuid = Engine.GetModelValue( f757_arg1.xuidModel, "xuid" )
			f757_arg1.available = Engine.GetModelValue( f757_local2 )
			f757_arg1.total = Engine.GetModelValue( f757_local3 )
			f757_arg1.leader = Engine.GetModelValue( f757_local4 )
			f757_arg1.partyMembers = {}
			for f757_local5 = 1, 18, 1 do
				f757_arg1.partyMembers[f757_local5] = Engine.GetModel( f757_local1, "pm_" .. f757_local5 )
			end
			if f757_arg1.selectedPlayerSubscription then
				f757_arg1:removeSubscription( f757_arg1.selectedPlayerSubscription )
			end
			f757_arg1.selectedPlayerSubscription = f757_arg1:subscribeToModel( f757_arg1.partyUpdate, function ()
				f757_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f759_arg0 )
			return f759_arg0.available
		end,
		getItem = function ( f760_arg0, f760_arg1, f760_arg2 )
			return f760_arg1.partyMembers[f760_arg2]
		end
	},
	AARTabs = f0_local7( "AARTabs", function ( f761_arg0 )
		local f761_local0 = {}
		table.insert( f761_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if Engine.IsMultiplayerGame() then
			local f761_local1 = Engine.GetModel( Engine.GetModelForController( f761_arg0 ), "aarType" )
			if f761_local1 and Engine.GetModelValue( f761_local1 ) == "public" then
				table.insert( f761_local0, {
					models = {
						tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
						tabWidget = "CoD.PerformanceTabWidget"
					},
					properties = {
						tabId = "performance"
					}
				} )
			end
			if not IsLocal() then
				local f761_local2 = Engine.GetRecentMedals( f761_arg0, Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, Engine.GetCurrentGameType() .. " XP" ) )
				if f761_local2 and #f761_local2 > 0 then
					table.insert( f761_local0, {
						models = {
							tabName = Engine.Localize( "MENU_AAR_TAB_MEDALS_CAPS" ),
							tabWidget = "CoD.MedalsTabWidget"
						},
						properties = {
							tabId = "medals"
						}
					} )
				end
			end
			table.insert( f761_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
					tabWidget = "CoD.ScoreboardTabWidget"
				},
				properties = {
					tabId = "scoreboard"
				}
			} )
		elseif Engine.IsCampaignGame() then
			table.insert( f761_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
					tabWidget = "CoD.PerformanceTabWidgetCP"
				},
				properties = {
					tabId = "performance"
				}
			} )
			table.insert( f761_local0, {
				models = {
					tabName = Engine.Localize( "CPUI_ACCOLADES" ),
					tabWidget = "CoD.MissionRecordVault_Challenges"
				},
				properties = {
					tabId = "accolades"
				}
			} )
			if not WasCampaignSoloGame( f761_arg0 ) then
				table.insert( f761_local0, {
					models = {
						tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
						tabWidget = "CoD.ScoreboardTabWidgetCP"
					},
					properties = {
						tabId = "scoreboard"
					}
				} )
			end
		elseif Engine.IsZombiesGame() then
			table.insert( f761_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
					tabWidget = "CoD.PerformanceTabWidgetZM"
				},
				properties = {
					tabId = "performance"
				}
			} )
			table.insert( f761_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
					tabWidget = "CoD.ScoreboardTabWidgetZM"
				},
				properties = {
					tabId = "scoreboard"
				}
			} )
		end
		table.insert( f761_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f761_local0
	end
	, true ),
	AARPerformanceTabStats = {
		getModel = function ( f762_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f762_arg0 ), "aarStats.performanceTabStats" )
		end
	},
	AARSPMGraph = {
		getModel = function ( f763_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f763_arg0 ), "aarStats.performanceTabStats.spmGraph" )
		end
	},
	AARKDRGraph = {
		getModel = function ( f764_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f764_arg0 ), "aarStats.performanceTabStats.kdrGraph" )
		end
	},
	Scoreboard = {
		getModel = function ( f765_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f765_arg0 ), "scoreboardInfo" )
		end
	},
	ScoreboardTeam1ListCP = f0_local7( "scoreboardTeam1ListCP", function ( f766_arg0 )
		return CoD.AARUtilityCP.GetScoreboardTeamTable( f766_arg0, 1 )
	end
	 ),
	ScoreboardTeam1List = {
		prepare = function ( f767_arg0, f767_arg1, f767_arg2 )
			f767_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
			if f767_arg1.teamCountSubscription then
				f767_arg1:removeSubscription( f767_arg1.teamCountSubscription )
			end
			f767_arg1.teamCountSubscription = f767_arg1:subscribeToModel( Engine.GetModel( f767_arg1.scoreboardInfoModel, "count" ), function ()
				f767_arg1:updateDataSource( nil, true, true )
				Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f767_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) )
			end, false )
		end,
		getCount = function ( f769_arg0 )
			local f769_local0 = CoD.ScoreboardUtility.MinRowsToShowOnEachTeam
			if Engine.GetCurrentTeamCount() < 2 then
				f769_local0 = CoD.ScoreboardUtility.MinRowsToShowOnEachTeamForFFA
			end
			return math.max( Engine.GetModelValue( Engine.GetModel( f769_arg0.scoreboardInfoModel, "count" ) ), f769_local0 )
		end,
		getItem = function ( f770_arg0, f770_arg1, f770_arg2 )
			return Engine.GetModel( f770_arg1.scoreboardInfoModel, f770_arg2 - 1 )
		end
	},
	ScoreboardTeam2List = {
		prepare = function ( f771_arg0, f771_arg1, f771_arg2 )
			f771_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
			if f771_arg1.teamCountSubscription then
				f771_arg1:removeSubscription( f771_arg1.teamCountSubscription )
			end
			f771_arg1.teamCountSubscription = f771_arg1:subscribeToModel( Engine.GetModel( f771_arg1.scoreboardInfoModel, "count" ), function ()
				f771_arg1:updateDataSource( nil, true, true )
				Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f771_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) )
			end, false )
		end,
		getCount = function ( f773_arg0 )
			if IsGameTypeDOA() then
				return 0
			else
				return math.max( Engine.GetModelValue( Engine.GetModel( f773_arg0.scoreboardInfoModel, "count" ) ), CoD.ScoreboardUtility.MinRowsToShowOnEachTeam )
			end
		end,
		getItem = function ( f774_arg0, f774_arg1, f774_arg2 )
			return Engine.GetModel( f774_arg1.scoreboardInfoModel, f774_arg2 - 1 )
		end
	},
	CodCasterScoreboardTeam1List = {
		prepare = function ( f775_arg0, f775_arg1, f775_arg2 )
			f775_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
			if f775_arg1.teamCountSubscription then
				f775_arg1:removeSubscription( f775_arg1.teamCountSubscription )
			end
			f775_arg1.teamCountSubscription = f775_arg1:subscribeToModel( Engine.GetModel( f775_arg1.scoreboardInfoModel, "count" ), function ()
				f775_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f777_arg0 )
			return math.max( Engine.GetModelValue( Engine.GetModel( f777_arg0.scoreboardInfoModel, "count" ) ), 0 )
		end,
		getItem = function ( f778_arg0, f778_arg1, f778_arg2 )
			return Engine.GetModel( f778_arg1.scoreboardInfoModel, f778_arg2 - 1 )
		end
	},
	CodCasterScoreboardTeam2List = {
		prepare = function ( f779_arg0, f779_arg1, f779_arg2 )
			f779_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
			if f779_arg1.teamCountSubscription then
				f779_arg1:removeSubscription( f779_arg1.teamCountSubscription )
			end
			f779_arg1.teamCountSubscription = f779_arg1:subscribeToModel( Engine.GetModel( f779_arg1.scoreboardInfoModel, "count" ), function ()
				f779_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f781_arg0 )
			return math.max( Engine.GetModelValue( Engine.GetModel( f781_arg0.scoreboardInfoModel, "count" ) ), 0 )
		end,
		getItem = function ( f782_arg0, f782_arg1, f782_arg2 )
			return Engine.GetModel( f782_arg1.scoreboardInfoModel, f782_arg2 - 1 )
		end
	},
	FreeRun = {
		getModel = function ( f783_arg0 )
			local f783_local0 = Engine.CreateModel( Engine.GetModelForController( f783_arg0 ), "FreeRun" )
			Engine.SetModelValue( Engine.CreateModel( f783_local0, "runState" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local0, "startTime" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local0, "pausedTime" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local0, "deltaTime" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local0, "finishTime" ), 0 )
			local f783_local1 = Engine.CreateModel( f783_local0, "topScore" )
			Engine.SetModelValue( Engine.CreateModel( f783_local1, "topScore1" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local1, "topScore2" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local1, "topScore3" ), 0 )
			local f783_local2 = Engine.CreateModel( f783_local0, "distanceBar" )
			Engine.SetModelValue( Engine.CreateModel( f783_local2, "completion" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local2, "ghostCompletion" ), 0 )
			local f783_local3 = Engine.CreateModel( f783_local0, "freeRunInfo" )
			if Engine.GetModel( f783_local3, "bestTime" ) == nil then
				Engine.SetModelValue( Engine.CreateModel( f783_local3, "bestTime" ), 0 )
			end
			if Engine.GetModel( f783_local3, "faults" ) == nil then
				Engine.SetModelValue( Engine.CreateModel( f783_local3, "faults" ), 0 )
			end
			Engine.SetModelValue( Engine.CreateModel( f783_local3, "retries" ), 0 )
			local f783_local4 = Engine.CreateModel( f783_local0, "timer" )
			Engine.SetModelValue( Engine.CreateModel( f783_local4, "currentTime" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local4, "timeAdjustment" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local4, "timeAdjustmentNegative" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local3, "bulletPenalty" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f783_local3, "activeCheckpoint" ), 0 )
			return f783_local0
		end
	},
	RewardsCarousel = {
		prepare = function ( f784_arg0, f784_arg1, f784_arg2 )
			if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
				CoD.AARUtility.CreateModelsForRewards( f784_arg0 )
			else
				CoD.AARUtilityCP.CreateModelsForRewards( f784_arg0 )
			end
		end,
		getCount = function ( f785_arg0 )
			if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
				return CoD.AARUtility.GetRewardItemCount( f785_arg0 )
			else
				return CoD.AARUtilityCP.GetRewardItemCount( f785_arg0 )
			end
		end,
		getItem = function ( f786_arg0, f786_arg1, f786_arg2 )
			if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
				return CoD.AARUtility.GetModelForRewardItemByIndex( f786_arg0, f786_arg2 )
			else
				return CoD.AARUtilityCP.GetModelForRewardItemByIndex( f786_arg0, f786_arg2 )
			end
		end,
		getWidgetTypeForItem = function ( f787_arg0, f787_arg1, f787_arg2, f787_arg3 )
			if CoD.isMultiplayer or CoD.isZombie then
				local f787_local0 = CoD.SafeGetModelValue( f787_arg1, "rewardCarouselWidgetType" )
				if f787_local0 and f787_local0 ~= "" then
					return LUI.getTableFromPath( f787_local0 )
				end
			end
			return nil
		end
	},
	ZmPlayerStyles = {
		prepare = function ( f788_arg0, f788_arg1, f788_arg2 )
			
		end,
		getCount = function ( f789_arg0 )
			return 0
		end,
		getItem = function ( f790_arg0, f790_arg1, f790_arg2 )
			return nil
		end
	},
	DropdownListTest = {
		prepare = function ( f791_arg0, f791_arg1, f791_arg2 )
			local f791_local0 = 25
			for f791_local1 = 1, f791_local0, 1 do
				Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f791_arg0 ), "DropdownTest.dropdownListTestModel" .. f791_local1 ), "itemName" ), "Random Value " .. f791_local1 )
			end
		end,
		getCount = function ( f792_arg0 )
			return 25
		end,
		getItem = function ( f793_arg0, f793_arg1, f793_arg2 )
			return Engine.CreateModel( Engine.GetModelForController( f793_arg0 ), "DropdownTest.dropdownListTestModel" .. f793_arg2 )
		end
	},
	DeadSpectate = {
		getModel = function ( f794_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f794_arg0 ), "deadSpectator" )
		end
	},
	DebugSessionSearchQoSJoin = f0_local7( "DebugSessionSearchQoSJoin", function ( f795_arg0 )
		if not Dvar.ui_lobbyDebugSessionSQJ:exists() or Dvar.ui_lobbyDebugSessionSQJ:get() == false then
			return {}
		end
		local f795_local0 = function ( f796_arg0, f796_arg1 )
			return Engine.GetModelValue( Engine.GetModel( f796_arg0, f796_arg1 ) )
		end
		
		local f795_local1 = function ( f797_arg0 )
			local f797_local0 = math.mod( f797_arg0, 3 )
			local f797_local1 = ColorSet.SelectedGreen
			if f797_local0 == 0 then
				f797_local1 = ColorSet.CoreMartial
			elseif f797_local0 == 1 then
				f797_local1 = ColorSet.ResistanceHigh
			end
			return string.format( "%d %d %d", f797_local1.r * 255, f797_local1.g * 255, f797_local1.b * 255 )
		end
		
		local f795_local2 = {}
		Engine.LobbyVM_CallFunc( "SessionSQJRefreshInfo", {
			controller = f795_arg0
		} )
		local f795_local3 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "debug" ), "sessionSQJ" )
		local f795_local4 = f795_local0( f795_local3, "searchStage" )
		local f795_local5 = Engine.GetModel( f795_local3, "results" )
		for f795_local6 = 1, f795_local4, 1 do
			local f795_local9 = f795_local1( f795_local6 )
			local f795_local10 = Engine.GetModel( f795_local5, tostring( f795_local6 ) )
			local f795_local11 = f795_local0( f795_local10, "numResults" )
			if f795_local11 == 0 then
				table.insert( f795_local2, {
					models = {
						noResults = "NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS",
						xuid = "",
						gamertag = "",
						publicIPAddress = "",
						privateIPAddress = "",
						natType = "",
						qosPing = "",
						status = "",
						searchStageColor = f795_local9
					},
					properties = {
						disabled = false
					}
				} )
			end
			local f795_local12 = Engine.GetModel( f795_local10, "data" )
			for f795_local13 = 1, f795_local11, 1 do
				local f795_local16 = Engine.GetModel( f795_local12, tostring( f795_local13 ) )
				local f795_local17 = f795_local0( f795_local16, "xuidstr" ) or "0"
				local f795_local18 = f795_local0( f795_local16, "gamertag" ) or ""
				local f795_local19 = f795_local0( f795_local16, "publicIPAddress" )
				if f795_local19 == nil then
					f795_local19 = "0.0.0.0"
				end
				local f795_local20 = f795_local0( f795_local16, "privateIPAddress" )
				if f795_local20 == nil then
					f795_local20 = "0.0.0.0"
				end
				local f795_local21 = f795_local0( f795_local16, "natType" )
				if f795_local21 == nil then
					f795_local21 = "UNKNOWN"
				end
				local f795_local22 = f795_local0( f795_local16, "ping" )
				if not f795_local22 then
					f795_local22 = "??? ms"
				end
				local f795_local23 = f795_local0( f795_local16, "status" )
				if not f795_local23 then
					f795_local23 = " ------- "
				end
				table.insert( f795_local2, {
					models = {
						noResults = "",
						xuid = f795_local17,
						gamertag = f795_local18,
						publicIPAddress = f795_local19,
						privateIPAddress = f795_local20,
						natType = f795_local21,
						qosPing = f795_local22,
						status = f795_local23,
						searchStageColor = f795_local9
					},
					properties = {
						disabled = false
					}
				} )
			end
		end
		return f795_local2
	end
	, nil, nil, function ( f798_arg0, f798_arg1, f798_arg2 )
		f798_arg1.updateModel = Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "debug" ), "sessionSQJ" ), "update" )
		Engine.SetModelValue( f798_arg1.updateModel, 0 )
		if f798_arg1.updateSubscription then
			f798_arg1:removeSubscription( f798_arg1.updateSubscription )
		end
		f798_arg1.updateSubscription = f798_arg1:subscribeToModel( f798_arg1.updateModel, function ()
			f798_arg1:updateDataSource()
		end, false )
	end
	 ),
	LobbyProcessQueueInfo = f0_local7( "LobbyProcessQueueInfo", function ( f800_arg0 )
		local f800_local0 = {}
		local f800_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug" ), "processQueue" )
		local f800_local2 = Engine.CreateModel( f800_local1, "data" )
		local f800_local3 = Engine.GetModelValue( Engine.CreateModel( f800_local1, "count" ) )
		if f800_local3 then
			for f800_local4 = 1, f800_local3, 1 do
				local f800_local7 = Engine.GetModel( f800_local2, tostring( f800_local4 ) )
				if f800_local7 then
					table.insert( f800_local0, {
						models = {
							processName = Engine.GetModelValue( Engine.GetModel( f800_local7, "processName" ) ),
							processCancellable = Engine.GetModelValue( Engine.GetModel( f800_local7, "processCancellable" ) ),
							type = Engine.GetModelValue( Engine.GetModel( f800_local7, "type" ) )
						}
					} )
					local f800_local8 = Engine.GetModelValue( Engine.GetModel( f800_local7, "actionCount" ) )
					if f800_local8 > 0 then
						local f800_local9 = Engine.GetModel( f800_local7, "actions" )
						for f800_local10 = 1, f800_local8, 1 do
							local f800_local13 = Engine.GetModel( f800_local9, tostring( f800_local10 ) )
							table.insert( f800_local0, {
								models = {
									processName = Engine.GetModelValue( Engine.GetModel( f800_local13, "processName" ) ),
									processState = Engine.GetModelValue( Engine.GetModel( f800_local13, "processState" ) ),
									type = Engine.GetModelValue( Engine.GetModel( f800_local13, "type" ) )
								}
							} )
						end
					end
				end
			end
		end
		return f800_local0
	end
	, nil, nil, function ( f801_arg0, f801_arg1, f801_arg2 )
		local f801_local0 = Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug" ), "processQueue" ), "update" )
		if f801_arg1.updateSubscription then
			f801_arg1:removeSubscription( f801_arg1.updateSubscription )
		end
		f801_arg1.updateSubscription = f801_arg1:subscribeToModel( f801_local0, function ()
			f801_arg1:updateDataSource()
		end, false )
	end
	 ),
	LeaveLobbyPopup = {
		getModel = function ( f803_arg0 )
			local f803_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
			Engine.CreateModel( f803_local0, "popupType" )
			Engine.CreateModel( f803_local0, "title" )
			Engine.CreateModel( f803_local0, "hint" )
			return f803_local0
		end
	},
	Blackhat = {
		getModel = function ( f804_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f804_arg0 ), "hudItems.blackhat" )
		end
	},
	BrightnessSelector = f0_local7( "BrightnessSelector", function ( f805_arg0 )
		local f805_local0 = {}
		local f805_local1 = 8
		local f805_local2 = 29
		local f805_local3 = Engine.ProfileFloat( f805_arg0, "r_sceneBrightness" )
		local f805_local4 = 1 / f805_local1 * 2
		for f805_local5 = 1, 2 * f805_local1 + 1, 1 do
			local f805_local8 = math.min( 1, math.max( -1, (f805_local5 - f805_local1 + 1) / f805_local1 ) )
			local f805_local9 = 2 * (f805_local5 - f805_local1 + 1) + f805_local2
			local f805_local10 = f805_local9 .. " " .. f805_local9 .. " " .. f805_local9
			local f805_local11 = table.insert
			local f805_local12 = f805_local0
			local f805_local13 = {
				models = {
					value = f805_local8,
					color = f805_local10
				}
			}
			local f805_local14 = {}
			local f805_local15
			if f805_local8 - f805_local4 > f805_local3 or f805_local3 > f805_local8 + f805_local4 then
				f805_local15 = false
			else
				f805_local15 = true
			end
			f805_local14.selectIndex = f805_local15
			f805_local13.properties = f805_local14
			f805_local11( f805_local12, f805_local13 )
		end
		return f805_local0
	end
	 ),
	ChatClientGlobal = {
		getModel = function ( f806_arg0 )
			local f806_local0 = CoD.ChatClientUtility.GetChatClientGlobalModel()
			CoD.ChatClientUtility.ResetAllModels( f806_arg0 )
			return f806_local0
		end
	},
	ChatClientEntriesList = {
		prepare = function ( f807_arg0, f807_arg1, f807_arg2 )
			f807_arg1.numElementsInList = f807_arg1.vCount
			f807_arg1.controller = f807_arg0
			f807_arg1.chatClientEntriesModel = CoD.ChatClientUtility.GetChatEntriesListModel()
			f807_arg1.filter = Engine.ChatClient_FilterChannelGet( f807_arg0, Enum.chatChannel_e.CHAT_CHANNEL_COUNT )
			f807_arg1.GetList = Engine.ChatClient_GetEntries
			f807_arg1.CountEntries = Engine.ChatClient_EntriesCount( f807_arg0, f807_arg1.filter )
			local f807_local0 = {
				xuid = 0,
				fullname = "",
				text = "",
				timestamp = "",
				timeMs = 0,
				chText = "",
				chColor = ""
			}
			f807_arg1.chatEntries = {}
			for f807_local1 = 1, f807_arg1.numElementsInList, 1 do
				f807_arg1.chatEntries[f807_local1] = {}
				f807_arg1.chatEntries[f807_local1].root = Engine.CreateModel( f807_arg1.chatClientEntriesModel, "entry_" .. f807_local1 )
				f807_arg1.chatEntries[f807_local1].model = Engine.CreateModel( f807_arg1.chatEntries[f807_local1].root, "model" )
				f807_arg1.chatEntries[f807_local1].properties = {}
				for f807_local7, f807_local8 in pairs( f807_local0 ) do
					local f807_local9 = Engine.CreateModel( f807_arg1.chatEntries[f807_local1].model, f807_local7 )
				end
			end
			f807_arg1.updateModels = function ( f808_arg0, f808_arg1, f808_arg2, f808_arg3 )
				if not f808_arg1.GetList then
					return 
				end
				local f808_local0 = {}
				f808_local0 = f808_arg1.GetList( f808_arg0, f808_arg2, f808_arg3, f808_arg1.filter )
				if f808_local0 then
					for f808_local1 = 1, #f808_local0, 1 do
						local f808_local4 = f808_local0[f808_local1]
						local f808_local5 = #f808_local0 + 1 - f808_local1
						for f808_local9, f808_local10 in pairs( f808_local4 ) do
							local f808_local11 = Engine.GetModel( f808_arg1.chatEntries[f808_local5].model, f808_local9 )
							if f808_local11 ~= nil then
								Engine.SetModelValue( f808_local11, f808_local10 )
							end
							f808_arg1.chatEntries[f808_local5].properties[f808_local9] = f808_local10
						end
					end
				end
				return f808_arg1.chatEntries[f808_arg2 % f808_arg1.numElementsInList + 1].model
			end
			
			f807_arg1.updateModels( f807_arg0, f807_arg1, 0, f807_arg1.numElementsInList )
			if f807_arg1.updateSubscription then
				f807_arg1:removeSubscription( f807_arg1.updateSubscription )
			end
			f807_arg1.updateSubscription = f807_arg1:subscribeToModel( CoD.ChatClientUtility.GetUpdateModel(), function ()
				f807_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f810_arg0 )
			return f810_arg0.CountEntries
		end,
		getItem = function ( f811_arg0, f811_arg1, f811_arg2 )
			return f811_arg1.chatEntries[f811_arg2].model
		end
	},
	FirstTimeLanguageSelection = f0_local7( "FirstTimeLanguageSelection", function ( f812_arg0 )
		local f812_local0 = {}
		if IsArabicSku() then
			table.insert( f812_local0, {
				models = {
					image = "uie_language_english",
					action = ChangeLanguage,
					param = "englisharabic"
				}
			} )
			table.insert( f812_local0, {
				models = {
					image = "uie_language_arabic",
					action = ChangeLanguage,
					param = "arabic"
				}
			} )
		elseif IsJapaneseSku() then
			table.insert( f812_local0, {
				models = {
					image = "uie_language_japanese",
					action = ChangeLanguage,
					param = "fulljapanese"
				}
			} )
			table.insert( f812_local0, {
				models = {
					image = "uie_language_english_with_japanese_subtitles",
					action = ChangeLanguage,
					param = "japanese"
				}
			} )
		elseif IsChineseSku() then
			table.insert( f812_local0, {
				models = {
					image = "uie_language_english",
					action = ChangeLanguage,
					param = "english"
				}
			} )
			table.insert( f812_local0, {
				models = {
					image = "uie_language_simplified_chinese",
					action = ChangeLanguage,
					param = "simplifiedchinese"
				}
			} )
			table.insert( f812_local0, {
				models = {
					image = "uie_language_traditional_chinese",
					action = ChangeLanguage,
					param = "traditionalchinese"
				}
			} )
		end
		return f812_local0
	end
	 ),
	ZMQuestItemHolders = {
		getModel = function ( f813_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f813_arg0 ), "zmInventory" )
		end
	},
	ReticleBindings = {
		getModel = function ( f814_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f814_arg0 ), "reticleBindings" )
		end,
		createModelsForActions = function ( f815_arg0, f815_arg1 )
			Engine.UnsubscribeAndFreeModel( DataSources.ReticleBindings.getModel( f815_arg0 ) )
			local f815_local0 = DataSources.ReticleBindings.getModel( f815_arg0 )
			for f815_local6, f815_local7 in ipairs( f815_arg1 ) do
				local f815_local8 = Engine.CreateModel( f815_local0, f815_local7 )
				local f815_local9, f815_local10 = Engine.GetBindingButtonString( f815_arg0, "+" .. f815_local7, true )
				if f815_local9 then
					local f815_local4 = CoD.ButtonMappings[f815_local9]
					if f815_local4 then
						local f815_local5 = Engine.GetModel( DataSources.Controller.Model, f815_local4 )
						if f815_local5 then
							Engine.SetModelValue( f815_local8, Engine.GetModelValue( f815_local5 ) )
						end
					end
				end
			end
		end
	}
}
DataSources.GlobalSources.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.GlobalSources" )
DataSources.Controller.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.Controller" )
DataSources.VehicleController.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.VehicleController" )
local f0_local13 = function ( f816_arg0, f816_arg1, f816_arg2, f816_arg3, f816_arg4 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, f816_arg2 ), f816_arg3 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.VehicleController.Model, f816_arg2 ), f816_arg4 or f816_arg3 )
	if f816_arg1 then
		CoD.ButtonMappings[f816_arg1] = f816_arg2
	end
end

local f0_local14 = function ( f817_arg0, f817_arg1 )
	if f817_arg0 ~= 0 then
		return 
	elseif f817_arg1 == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO then
		f0_local13( f817_arg0, "BUTTON_A", "primary_button_image", "xenonbutton_a" )
		f0_local13( f817_arg0, "BUTTON_B", "secondary_button_image", "xenonbutton_b" )
		f0_local13( f817_arg0, "BUTTON_X", "alt1_button_image", "xenonbutton_x" )
		f0_local13( f817_arg0, "BUTTON_Y", "alt2_button_image", "xenonbutton_y" )
		f0_local13( f817_arg0, "BUTTON_BACK", "back_button_image", "xenonbutton_back" )
		f0_local13( f817_arg0, "BUTTON_START", "start_button_image", "xenonbutton_start" )
		f0_local13( f817_arg0, "BUTTON_LSHLDR", "left_shoulder_button_image", "xenonbutton_lb", "t7_icons_controller_lbwhite" )
		f0_local13( f817_arg0, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_durango_lb_glow" )
		f0_local13( f817_arg0, "BUTTON_RSHLDR", "right_shoulder_button_image", "xenonbutton_rb", "t7_icons_controller_rbwhite" )
		f0_local13( f817_arg0, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_durango_rb_glow" )
		f0_local13( f817_arg0, "BUTTON_LSTICK", "left_stick_button_image", "ui_button_xenon_stick_ani_32_Ldown" )
		f0_local13( f817_arg0, "BUTTON_RSTICK", "right_stick_button_image", "ui_button_xenon_stick_ani_32_Rdown" )
		f0_local13( f817_arg0, nil, "move_left_stick_button_image", "t7_icons_controller_ls" )
		f0_local13( f817_arg0, nil, "move_right_stick_button_image", "t7_icons_controller_rs" )
		f0_local13( f817_arg0, "BUTTON_LTRIG", "left_trigger_button_image", "xenonbutton_lt", "t7_icons_controller_ltwhite" )
		f0_local13( f817_arg0, "BUTTON_RTRIG", "right_trigger_button_image", "xenonbutton_rt", "t7_icons_controller_rtwhite" )
		f0_local13( f817_arg0, nil, "dpad_all_button_image", "xenonbutton_dpad_all" )
		f0_local13( f817_arg0, nil, "dpad_lr_button_image", "xenonbutton_dpad_rl" )
		f0_local13( f817_arg0, nil, "dpad_ud_button_image", "xenonbutton_dpad_ud" )
		f0_local13( f817_arg0, "DPAD_UP", "dpad_up_button_image", "xenonbutton_dpad_up" )
		f0_local13( f817_arg0, "DPAD_DOWN", "dpad_down_button_image", "xenonbutton_dpad_down" )
		f0_local13( f817_arg0, "DPAD_LEFT", "dpad_left_button_image", "xenonbutton_dpad_left" )
		f0_local13( f817_arg0, "DPAD_RIGHT", "dpad_right_button_image", "xenonbutton_dpad_right" )
		f0_local13( f817_arg0, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		f0_local13( f817_arg0, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	elseif f817_arg1 == Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS then
		f0_local13( f817_arg0, "BUTTON_A", Engine.ShouldSwapCircleAndCross() and "secondary_button_image" or "primary_button_image", "ps3button_x" )
		f0_local13( f817_arg0, "BUTTON_B", Engine.ShouldSwapCircleAndCross() and "primary_button_image" or "secondary_button_image", "ps3button_circle" )
		f0_local13( f817_arg0, "BUTTON_X", "alt1_button_image", "ps3button_square" )
		f0_local13( f817_arg0, "BUTTON_Y", "alt2_button_image", "ps3button_triangle" )
		f0_local13( f817_arg0, "BUTTON_BACK", "back_button_image", "ps3button_select" )
		f0_local13( f817_arg0, "BUTTON_START", "start_button_image", "ps3button_start" )
		f0_local13( f817_arg0, "BUTTON_LSHLDR", "left_shoulder_button_image", "ps3button_l1", CoD.isPC and "t7_icons_controller_l1white" or "t7_icons_controller_lbwhite" )
		f0_local13( f817_arg0, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
		f0_local13( f817_arg0, "BUTTON_RSHLDR", "right_shoulder_button_image", "ps3button_r1", CoD.isPC and "t7_icons_controller_r1white" or "t7_icons_controller_rbwhite" )
		f0_local13( f817_arg0, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
		f0_local13( f817_arg0, "BUTTON_LSTICK", "left_stick_button_image", "ps3button_l3" )
		f0_local13( f817_arg0, "BUTTON_RSTICK", "right_stick_button_image", "ps3button_r3" )
		f0_local13( f817_arg0, nil, "move_left_stick_button_image", "t7_icons_controller_ls" )
		f0_local13( f817_arg0, nil, "move_right_stick_button_image", "t7_icons_controller_rs" )
		f0_local13( f817_arg0, "BUTTON_LTRIG", "left_trigger_button_image", "ps3button_l2", CoD.isPC and "t7_icons_controller_l2white" or "t7_icons_controller_ltwhite" )
		f0_local13( f817_arg0, "BUTTON_RTRIG", "right_trigger_button_image", "ps3button_r2", CoD.isPC and "t7_icons_controller_r2white" or "t7_icons_controller_rtwhite" )
		f0_local13( f817_arg0, nil, "dpad_all_button_image", "ps3button_dpad_all" )
		f0_local13( f817_arg0, nil, "dpad_lr_button_image", "ps3button_dpad_rl" )
		f0_local13( f817_arg0, nil, "dpad_ud_button_image", "ps3button_dpad_ud" )
		f0_local13( f817_arg0, "DPAD_UP", "dpad_up_button_image", "ps3button_dpad_up" )
		f0_local13( f817_arg0, "DPAD_DOWN", "dpad_down_button_image", "ps3button_dpad_down" )
		f0_local13( f817_arg0, "DPAD_LEFT", "dpad_left_button_image", "ps3button_dpad_left" )
		f0_local13( f817_arg0, "DPAD_RIGHT", "dpad_right_button_image", "ps3button_dpad_right" )
		f0_local13( f817_arg0, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		f0_local13( f817_arg0, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	else
		f0_local13( f817_arg0, "BUTTON_A", "primary_button_image", "ps3button_x" )
		f0_local13( f817_arg0, "BUTTON_B", "secondary_button_image", "ps3button_circle" )
		f0_local13( f817_arg0, "BUTTON_X", "alt1_button_image", "ps3button_square" )
		f0_local13( f817_arg0, "BUTTON_Y", "alt2_button_image", "ps3button_triangle" )
		f0_local13( f817_arg0, "BUTTON_BACK", "back_button_image", "ps3button_select" )
		f0_local13( f817_arg0, "BUTTON_START", "start_button_image", "ps3button_start" )
		f0_local13( f817_arg0, "BUTTON_LSHLDR", "left_shoulder_button_image", "ps3button_l1", CoD.isPC and "t7_icons_controller_l1white" or "t7_icons_controller_lbwhite" )
		f0_local13( f817_arg0, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
		f0_local13( f817_arg0, "BUTTON_RSHLDR", "right_shoulder_button_image", "ps3button_r1", CoD.isPC and "t7_icons_controller_r1white" or "t7_icons_controller_rbwhite" )
		f0_local13( f817_arg0, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
		f0_local13( f817_arg0, "BUTTON_LSTICK", "left_stick_button_image", "ps3button_l3" )
		f0_local13( f817_arg0, "BUTTON_RSTICK", "right_stick_button_image", "ps3button_r3" )
		f0_local13( f817_arg0, nil, "move_left_stick_button_image", "ui_button_ps3_stick_ls_32" )
		f0_local13( f817_arg0, nil, "move_right_stick_button_image", "ui_button_ps3_stick_rs_32" )
		f0_local13( f817_arg0, "BUTTON_LTRIG", "left_trigger_button_image", "ps3button_l2", CoD.isPC and "t7_icons_controller_l2white" or "t7_icons_controller_ltwhite" )
		f0_local13( f817_arg0, "BUTTON_RTRIG", "right_trigger_button_image", "ps3button_r2", CoD.isPC and "t7_icons_controller_r2white" or "t7_icons_controller_rtwhite" )
		f0_local13( f817_arg0, nil, "dpad_all_button_image", "ps3button_dpad_all" )
		f0_local13( f817_arg0, nil, "dpad_lr_button_image", "ps3button_dpad_rl" )
		f0_local13( f817_arg0, nil, "dpad_ud_button_image", "ps3button_dpad_ud" )
		f0_local13( f817_arg0, "DPAD_UP", "dpad_up_button_image", "ps3button_dpad_up" )
		f0_local13( f817_arg0, "DPAD_DOWN", "dpad_down_button_image", "ps3button_dpad_down" )
		f0_local13( f817_arg0, "DPAD_LEFT", "dpad_left_button_image", "ps3button_dpad_left" )
		f0_local13( f817_arg0, "DPAD_RIGHT", "dpad_right_button_image", "ps3button_dpad_right" )
		f0_local13( f817_arg0, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		f0_local13( f817_arg0, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	end
	if CoD.isPC then
		f0_local13( f817_arg0, "KEY_MOUSE1", "mouse_left_button_image", "mousebuttonleft" )
		f0_local13( f817_arg0, "KEY_MOUSE2", "mouse_right_button_image", "mousebuttonright" )
		f0_local13( f817_arg0, "KEY_MOUSE3", "mouse_middle_button_image", "mousebuttonmiddle" )
		f0_local13( f817_arg0, "MWHEELUP", "mouse_wheelup_button_image", "mouseWheelUp" )
		f0_local13( f817_arg0, "MWHEELDOWN", "mouse_wheeldown_button_image", "mouseWheelDown" )
		f0_local13( f817_arg0, nil, "mouse_button_image", "mouse" )
	end
end

local f0_local15 = Engine.GetPrimaryController()
f0_local14( f0_local15, Engine.GamepadType( f0_local15 ) )
for f0_local16 = 0, Engine.GetMaxControllerCount() - 1, 1 do
	local f0_local19 = f0_local16
	local f0_local20 = Engine.GetModelForController( f0_local19 )
	Engine.CreateModel( f0_local20, "hintText" )
	Engine.SetModelValue( Engine.CreateModel( f0_local20, "clanTag" ), "" )
	if CoD.isPC and CoD.useController then
		if DataSourceHelpers.ControllerTypeSubscription == nil then
			DataSourceHelpers.ControllerTypeSubscription = {}
		end
		if DataSourceHelpers.ControllerTypeSubscription[f0_local19] == nil then
			DataSourceHelpers.ControllerTypeSubscription[f0_local19] = LUI.UIElement.new()
		end
		DataSourceHelpers.ControllerTypeSubscription[f0_local19]:unsubscribeFromAllModels()
		DataSourceHelpers.ControllerTypeSubscription[f0_local19]:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f0_local19 ), "ControllerType" ), function ( model )
			local f818_local0 = f0_local15
			local f818_local1 = 1
			if Engine.GamepadsConnectedIsActive( f818_local1 ) and not IsGamepad( f0_local15 ) then
				f818_local0 = f818_local1
			end
			f0_local14( f0_local15, Engine.GamepadType( f818_local0 ) )
		end, true )
	end
	Engine.CreateModel( f0_local20, "WorldSpaceIndicators" )
	local f0_local21 = Engine.CreateModel( f0_local20, "scriptNotify" )
	Engine.SetModelValue( Engine.CreateModel( f0_local21, "numArgs" ), 0 )
	Engine.SetModelValue( f0_local21, "" )
	Engine.CreateModel( f0_local20, "playerConnected" )
	Engine.CreateModel( f0_local20, "playerDisconnected" )
	local f0_local22 = Engine.CreateModel( f0_local20, "hudItems" )
	Engine.CreateModel( f0_local22, "stickyImage" )
	Engine.CreateModel( f0_local22, "shockImageBottom" )
	Engine.CreateModel( f0_local22, "shockImageRight" )
	Engine.CreateModel( f0_local22, "shockImageLeft" )
	Engine.CreateModel( f0_local22, "shockImageTop" )
	Engine.CreateModel( f0_local22, "showCursorHint" )
	Engine.CreateModel( f0_local22, "cursorHintImage" )
	Engine.CreateModel( f0_local22, "cursorHintText" )
	Engine.CreateModel( f0_local22, "cursorHintTextLine2" )
	Engine.CreateModel( f0_local22, "cursorHintIconRatio" )
	Engine.CreateModel( f0_local22, "cursorHintIconFlip" )
	Engine.CreateModel( f0_local22, "sixthsense" )
	Engine.CreateModel( f0_local22, "outOfBoundsEndTime" )
	Engine.CreateModel( f0_local22, "pulseNoAmmo" )
	Engine.CreateModel( f0_local22, "pulseNoLethal" )
	Engine.CreateModel( f0_local22, "pulseNoTactical" )
	Engine.CreateModel( f0_local22, "armorOverlay" )
	Engine.CreateModel( f0_local22, "armorPercent" )
	Engine.CreateModel( f0_local22, "health" )
	Engine.CreateModel( f0_local22, "regenDelayProgress" )
	Engine.CreateModel( f0_local22, "showDamageWidget" )
	Engine.CreateModel( f0_local22, "cybercomActiveType" )
	Engine.CreateModel( f0_local22, "cybercomRequestedType" )
	Engine.CreateModel( f0_local22, "playerSpawned" )
	Engine.CreateModel( f0_local22, "ammoPickedUp" )
	Engine.CreateModel( f0_local22, "tacticalModeActivated" )
	Engine.CreateModel( f0_local22, "enhancedVisionActivated" )
	local f0_local23 = Engine.CreateModel( f0_local22, "voipInfo" )
	for f0_local24 = 1, 4, 1 do
		local f0_local27 = Engine.CreateModel( f0_local23, "voip" .. f0_local24 )
		Engine.SetModelValue( Engine.CreateModel( f0_local27, "status" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f0_local27, "name" ), "" )
	end
	local f0_local24 = Engine.CreateModel( f0_local20, "CTF" )
	Engine.CreateModel( f0_local24, "friendlyFlagCarrier" )
	Engine.CreateModel( f0_local24, "friendlyFlagAway" )
	Engine.CreateModel( f0_local24, "enemyFlagCarrier" )
	Engine.CreateModel( f0_local24, "enemyFlagAway" )
	if not CoD.isFrontend and not CoD.isCampaign and CoD.isZombie then
		Engine.CreateModel( f0_local20, "bgb_current" )
		Engine.CreateModel( f0_local20, "bgb_display" )
		Engine.CreateModel( f0_local20, "bgb_timer" )
		Engine.CreateModel( f0_local20, "bgb_activations_remaining" )
		Engine.CreateModel( f0_local20, "bgb_invalid_use" )
		Engine.CreateModel( f0_local20, "bgb_one_shot_use" )
	end
	local f0_local25 = Engine.CreateModel( f0_local22, "console" )
	Engine.SetModelValue( Engine.CreateModel( f0_local25, "currentIndex" ), 0 )
	for f0_local26 = 0, 6, 1 do
		local f0_local29 = Engine.CreateModel( f0_local25, "line" .. f0_local26 )
		Engine.CreateModel( f0_local29, "text0" )
		Engine.CreateModel( f0_local29, "text0color" )
		Engine.CreateModel( f0_local29, "icon0" )
		Engine.CreateModel( f0_local29, "text1" )
		Engine.CreateModel( f0_local29, "text1color" )
		Engine.CreateModel( f0_local29, "icon1" )
		Engine.CreateModel( f0_local29, "iconWidth" )
	end
	f0_local25 = Engine.CreateModel( f0_local22, "centerConsole" )
	Engine.SetModelValue( Engine.CreateModel( f0_local25, "currentIndex" ), 0 )
	for f0_local26 = 0, 6, 1 do
		local f0_local29 = Engine.CreateModel( f0_local25, "line" .. f0_local26 )
		Engine.CreateModel( f0_local29, "text0" )
		Engine.CreateModel( f0_local29, "text0color" )
		Engine.CreateModel( f0_local29, "icon0" )
		Engine.CreateModel( f0_local29, "text1" )
		Engine.CreateModel( f0_local29, "text1color" )
		Engine.CreateModel( f0_local29, "icon1" )
		Engine.CreateModel( f0_local29, "iconWidth" )
	end
	killcamWeaponModel = Engine.CreateModel( f0_local22, "killcamWeapon" )
	Engine.CreateModel( killcamWeaponModel, "weaponName" )
	Engine.SetModelValue( killcamWeaponModel, 0 )
	for f0_local26 = 0, 6, 1 do
		Engine.CreateModel( killcamWeaponModel, "attachment" .. f0_local26 )
	end
	Engine.CreateModel( killcamWeaponModel, "killfeedicon" )
	Engine.CreateModel( killcamWeaponModel, "flip" )
	Engine.CreateModel( Engine.CreateModel( f0_local20, "vehicle" ), "vehicleType" )
	DataSources.VehicleInfo.clearButtonModels( f0_local19 )
	if Engine.IsProfileSignedIn( f0_local19 ) then
		local f0_local28 = Engine.CreateModel( f0_local20, "profile" )
		if f0_local28 then
			local f0_local27 = function ( f819_arg0 )
				local f819_local0 = Engine.CreateModel( f0_local28, f819_arg0 )
				if f819_local0 then
					Engine.SetModelValue( f819_local0, CoD.ExeProfileVarBool( f0_local19, f819_arg0 ) )
				end
			end
			
			f0_local27( "tacticalModeShowDamage" )
			f0_local27( "tacticalModeShowArchetype" )
			f0_local27( "tacticalModeShowDistance" )
			f0_local27( "tacticalModeShowStatus" )
		end
	end
	f0_local28 = Engine.CreateModel( f0_local20, "CACMenu" )
	Engine.CreateModel( f0_local28, "numItemsToRemove" )
	Engine.CreateModel( f0_local28, "curWeaponVariantName" )
	Engine.CreateModel( f0_local28, "numWildcardItemsToRemove" )
	Engine.CreateModel( f0_local28, "currentHeroName" )
	Engine.CreateModel( f0_local28, "currentHeroImage" )
	Engine.CreateModel( f0_local28, "currentHeroLoadout" )
	Engine.CreateModel( f0_local20, "unlockTokensCount" )
	Engine.CreateModel( f0_local20, "permanentUnlockTokensCount" )
	f0_local27 = Engine.CreateModel( f0_local20, "CryptoKeyProgress" )
	Engine.CreateModel( f0_local27, "keyCount" )
	Engine.CreateModel( f0_local27, "progress" )
	Engine.SetModelValue( Engine.CreateModel( f0_local27, "animProgress" ), 0 )
end
DataSources.PartyPrivacy.getModel()
Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "ButtonStates.ReevaluateDisabledStates" ), false )
Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
if not Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ) then
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), 0 )
end
Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" )
Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged", true )
Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" )
Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" )
Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapPreviousGametype" )
Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteGameModeNext" )
Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), false )
