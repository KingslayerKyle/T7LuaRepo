require( "ui.T6.CoDBase" )
require( "ui.uieditor.modifyFunctions" )

if not DataSourceHelpers then
	DataSourceHelpers = {}
end
if not DataSources then
	DataSources = {}
end
function ListHelper_CreateModelsFromTable( f1_arg0, f1_arg1 )
	for f1_local3, f1_local4 in pairs( f1_arg1 ) do
		if type( f1_local4 ) == "table" then
			ListHelper_CreateModelsFromTable( Engine.CreateModel( f1_arg0, f1_local3 ), f1_local4 )
		else
			Engine.SetModelValue( Engine.CreateModel( f1_arg0, f1_local3 ), f1_local4 )
		end
	end
end

function ListHelper_GetListHelperModel( f2_arg0, f2_arg1 )
	if f2_arg1 then
		return Engine.CreateModel( Engine.GetModelForController( f2_arg0.dataSourceController ), f2_arg0.customDataSourceHelper )
	else
		return Engine.GetModel( Engine.GetModelForController( f2_arg0.dataSourceController ), f2_arg0.customDataSourceHelper )
	end
end

function ListHelper_Prepare( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4, f3_arg5 )
	f3_arg0[f3_arg2] = {}
	f3_arg0.customDataSourceHelper = f3_arg2
	f3_arg0.dataSourceController = f3_arg1
	local f3_local0 = ListHelper_GetListHelperModel( f3_arg0, true )
	for f3_local5, f3_local6 in ipairs( f3_arg3( f3_arg1, f3_arg0 ) ) do
		local f3_local4 = Engine.GetModel( f3_local0, f3_local5 )
		if f3_local4 then
			Engine.UnsubscribeAndFreeModel( f3_local4 )
		end
		f3_local4 = Engine.CreateModel( f3_local0, f3_local5 )
		if f3_local6.models then
			ListHelper_CreateModelsFromTable( f3_local4, f3_local6.models )
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

function ListHelper_GetCount( f4_arg0 )
	if f4_arg0.customDataSourceHelper and f4_arg0[f4_arg0.customDataSourceHelper] then
		return #f4_arg0[f4_arg0.customDataSourceHelper]
	else
		return 0
	end
end

function ListHelper_GetItem( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg1.customDataSourceHelper and f5_arg1[f5_arg1.customDataSourceHelper] then
		return f5_arg1[f5_arg1.customDataSourceHelper][f5_arg2].model
	else
		return nil
	end
end

function ListHelper_GetCustomPropertiesForItem( f6_arg0, f6_arg1 )
	if f6_arg0.customDataSourceHelper and f6_arg0[f6_arg0.customDataSourceHelper] then
		return f6_arg0[f6_arg0.customDataSourceHelper][f6_arg1].properties
	else
		return nil
	end
end

function ListHelper_Cleanup( f7_arg0 )
	local f7_local0 = ListHelper_GetListHelperModel( f7_arg0, false )
	if f7_local0 then
		Engine.UnsubscribeAndFreeModel( f7_local0 )
	end
end

function ListHelper_SetupDataSource( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5 )
	local f8_local0 = {
		getCount = ListHelper_GetCount,
		getItem = ListHelper_GetItem,
		getCustomPropertiesForItem = ListHelper_GetCustomPropertiesForItem,
		getSpacerAfterRow = f8_arg5
	}
	if f8_arg2 then
		f8_local0.cleanup = ListHelper_Cleanup
	end
	if f8_arg3 then
		for f8_local4, f8_local5 in pairs( f8_arg3 ) do
			f8_local0[f8_local4] = f8_local5
		end
	end
	f8_local0.prepare = function ( f9_arg0, f9_arg1, f9_arg2 )
		ListHelper_Prepare( f9_arg1, f9_arg0, f8_arg0, f8_arg1, f9_arg2, f8_arg4 )
	end
	
	return f8_local0
end

DataSourceHelpers.ListSetup = ListHelper_SetupDataSource
function ListHelper_SetupDataSource_CustomPrepare( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = {
		getCount = ListHelper_GetCount,
		getItem = ListHelper_GetItem,
		getCustomPropertiesForItem = ListHelper_GetCustomPropertiesForItem
	}
	if f10_arg2 then
		f10_local0.cleanup = ListHelper_Cleanup
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

function GetAccoladesXOfY( f12_arg0, f12_arg1, f12_arg2 )
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
				if CoD.CombatRecordOtherPlayerStats then
					f12_local4 = Engine.GetOtherPlayerStatsBuffer()
				end
			end
			for f12_local5 = 0, 18, 1 do
				if CoD.GetCombatRecordStatForPath( f12_local4, "PlayerStatsByMap." .. f12_local0.rootMapName .. ".accolades." .. tostring( f12_local5 ) .. ".state" ) ~= 0 then
					f12_local1 = f12_local1 + 1
				end
			end
		end
	end
	return f12_local1, f12_local2
end

function ClientHasCollectible( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	if f13_arg3 or CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true then
		local f13_local0 = Engine.StorageGetBuffer( f13_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
		if CoD.CombatRecordOtherPlayerStats then
			f13_local0 = Engine.GetOtherPlayerStatsBuffer()
		end
		return CoD.GetCombatRecordStatForPath( f13_local0, "PlayerStatsByMap." .. f13_arg1 .. ".collectibles." .. tostring( f13_arg2 ) ) == 1
	else
		return Engine.ClientHasCollectible( f13_arg0, f13_arg1, f13_arg2, Enum.eModes.MODE_CAMPAIGN )
	end
end

function GetCollectiblesXOfY( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = CoD.mapsTable[f14_arg1]
	local f14_local1 = 0
	local f14_local2 = 0
	if f14_local0.collectibles then
		local f14_local3 = Engine.GetAssetList( f14_local0.collectibles )
		if f14_local3 ~= nil then
			f14_local1 = #f14_local3
			for f14_local4 = 0, f14_local1 - 1, 1 do
				if ClientHasCollectible( f14_arg0, f14_arg1, f14_local4, f14_arg2 ) then
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
DataSourceHelpers.CustomListSetup = ListHelper_SetupDataSource_CustomPrepare
function RefreshListFindSelectedXuid( f15_arg0, f15_arg1 )
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
	f15_arg1:updateDataSource( true, true )
	local f15_local1 = nil
	if f15_local0 ~= nil then
		f15_local1 = f15_arg1:findVisibleItem( {
			xuid = f15_local0
		}, nil )
		if not f15_local1 then
			f15_local1 = f15_arg1:findItem( {
				xuid = f15_local0
			}, nil, true )
		elseif f15_local1 ~= f15_arg1.activeWidget then
			f15_arg1:setActiveItem( f15_local1 )
		end
	end
	if not f15_local1 then
		f15_arg1:processEvent( {
			name = "gain_focus",
			controller = f15_arg0
		} )
	end
end

function RefreshListFindSelectedGroupId( f16_arg0, f16_arg1 )
	if not f16_arg1 then
		return 
	end
	local f16_local0 = nil
	if f16_arg1.lastActiveWidget ~= nil then
		local f16_local1 = f16_arg1.lastActiveWidget:getModel( f16_arg0, "groupId" )
		if f16_local1 ~= nil then
			f16_local0 = Engine.GetModelValue( f16_local1 )
		end
	end
	f16_arg1:updateDataSource( true, true )
	local f16_local1 = nil
	if f16_local0 ~= nil then
		f16_local1 = f16_arg1:findVisibleItem( {
			groupId = f16_local0
		}, nil )
		if not f16_local1 then
			f16_local1 = f16_arg1:findItem( {
				groupId = f16_local0
			}, nil, true )
		elseif f16_local1 ~= f16_arg1.activeWidget then
			f16_arg1:setActiveItem( f16_local1 )
		end
	end
end

DataSources.GlobalSources = {
	getModel = function ( f17_arg0 )
		return DataSources.GlobalSources.Model
	end
}
DataSources.Controller = {
	getModel = function ()
		return DataSources.Controller.Model
	end
}
DataSources.VehicleController = {
	getModel = function ()
		return DataSources.VehicleController.Model
	end
}
DataSources.PerController = {
	getModel = function ( f20_arg0 )
		local f20_local0 = Engine.GetModelForController( f20_arg0 )
		local f20_local1 = Engine.CreateModel( f20_local0, "identityBadge" )
		Engine.SetModelValue( Engine.CreateModel( f20_local1, "xuid" ), Engine.GetXUID64( f20_arg0 ) )
		Engine.SetModelValue( Engine.CreateModel( f20_local1, "gamertag" ), Engine.GetSelfGamertag( f20_arg0 ) )
		Engine.SetModelValue( Engine.CreateModel( f20_local1, "clantag" ), Engine.GetClanName( f20_arg0 ) )
		Engine.CreateModel( f20_local0, "forceUpdateVehicleBindings" )
		return f20_local0
	end,
	setHintText = function ( f21_arg0, f21_arg1 )
		local f21_local0 = Engine.GetModel( Engine.GetModelForController( f21_arg0 ), "hintText" )
		if not f21_arg1 then
			f21_arg1 = ""
		end
		if f21_local0 then
			Engine.SetModelValue( f21_local0, f21_arg1 )
		end
	end,
	clearHintText = function ( f22_arg0, f22_arg1 )
		DataSources.PerController.setHintText( f22_arg0, "" )
	end,
	hasHintText = function ( f23_arg0 )
		local f23_local0 = Engine.GetModel( Engine.GetModelForController( f23_arg0 ), "hintText" )
		if f23_local0 and Engine.GetModelValue( f23_local0 ) ~= "" then
			return true
		else
			return false
		end
	end
}
DataSources.WorldSpaceIndicators = {
	getModel = function ( f24_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f24_arg0 ), "WorldSpaceIndicators" )
	end
}
DataSources.MessageDialog = {
	getModel = function ( f25_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	end
}
DataSources.AccountLinkLogin = {
	getModel = function ( f26_arg0 )
		local f26_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
		Engine.SetModelValue( Engine.CreateModel( f26_local0, "email" ), Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
		Engine.SetModelValue( Engine.CreateModel( f26_local0, "password" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
		Engine.SetModelValue( Engine.CreateModel( f26_local0, "stars" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
		return f26_local0
	end
}
DataSources.AccountLinkRegister = {
	getModel = function ( f27_arg0 )
		local f27_local0 = Engine.CreateModel( Engine.GetModelForController( f27_arg0 ), "AccountLinkRegister" )
		Engine.CreateModel( f27_local0, "firstName" )
		Engine.CreateModel( f27_local0, "lastName" )
		Engine.CreateModel( f27_local0, "zipCode" )
		Engine.CreateModel( f27_local0, "region" )
		Engine.CreateModel( f27_local0, "username" )
		Engine.CreateModel( f27_local0, "email" )
		Engine.CreateModel( f27_local0, "password" )
		Engine.CreateModel( f27_local0, "stars" )
		Engine.CreateModel( f27_local0, "confirmPass" )
		Engine.CreateModel( f27_local0, "confirmStars" )
		Engine.CreateModel( f27_local0, "gender" )
		Engine.CreateModel( f27_local0, "month" )
		Engine.CreateModel( f27_local0, "monthIndex" )
		Engine.CreateModel( f27_local0, "day" )
		Engine.CreateModel( f27_local0, "year" )
		return f27_local0
	end
}
DataSources.TermsOfService = {
	getModel = function ( f28_arg0 )
		local f28_local0 = Engine.CreateModel( Engine.GetModelForController( f28_arg0 ), "TermsOfService" )
		Engine.SetModelValue( Engine.CreateModel( f28_local0, "message" ), Engine.GetTermsOfService( f28_arg0 ) )
		return f28_local0
	end
}
DataSources.Gender = {
	prepare = function ( f29_arg0, f29_arg1, f29_arg2 )
		local f29_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GenderModel" )
		local f29_local1 = Engine.CreateModel( f29_local0, "Male" )
		Engine.SetModelValue( Engine.CreateModel( f29_local1, "gender" ), Engine.Localize( "EM_MALE" ) )
		local f29_local2 = Engine.CreateModel( f29_local0, "Female" )
		Engine.SetModelValue( Engine.CreateModel( f29_local2, "gender" ), Engine.Localize( "EM_FEMALE" ) )
		f29_arg1.genders = {
			f29_local1,
			f29_local2
		}
	end,
	getCount = function ( f30_arg0 )
		return #f30_arg0.genders
	end,
	getItem = function ( f31_arg0, f31_arg1, f31_arg2 )
		return f31_arg1.genders[f31_arg2]
	end
}
DataSources.Month = {
	prepare = function ( f32_arg0, f32_arg1, f32_arg2 )
		local f32_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "monthModel" )
		local f32_local1 = Engine.CreateModel( f32_local0, "january" )
		Engine.SetModelValue( Engine.CreateModel( f32_local1, "month" ), Engine.Localize( "MENU_MONTHS_JAN" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local1, "monthIndex" ), 1 )
		local f32_local2 = Engine.CreateModel( f32_local0, "february" )
		Engine.SetModelValue( Engine.CreateModel( f32_local2, "month" ), Engine.Localize( "MENU_MONTHS_FEB" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local2, "monthIndex" ), 2 )
		local f32_local3 = Engine.CreateModel( f32_local0, "march" )
		Engine.SetModelValue( Engine.CreateModel( f32_local3, "month" ), Engine.Localize( "MENU_MONTHS_MAR" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local3, "monthIndex" ), 3 )
		local f32_local4 = Engine.CreateModel( f32_local0, "april" )
		Engine.SetModelValue( Engine.CreateModel( f32_local4, "month" ), Engine.Localize( "MENU_MONTHS_APR" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local4, "monthIndex" ), 4 )
		local f32_local5 = Engine.CreateModel( f32_local0, "may" )
		Engine.SetModelValue( Engine.CreateModel( f32_local5, "month" ), Engine.Localize( "MENU_MONTHS_MAY" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local5, "monthIndex" ), 5 )
		local f32_local6 = Engine.CreateModel( f32_local0, "june" )
		Engine.SetModelValue( Engine.CreateModel( f32_local6, "month" ), Engine.Localize( "MENU_MONTHS_JUN" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local6, "monthIndex" ), 6 )
		local f32_local7 = Engine.CreateModel( f32_local0, "july" )
		Engine.SetModelValue( Engine.CreateModel( f32_local7, "month" ), Engine.Localize( "MENU_MONTHS_JUL" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local7, "monthIndex" ), 7 )
		local f32_local8 = Engine.CreateModel( f32_local0, "august" )
		Engine.SetModelValue( Engine.CreateModel( f32_local8, "month" ), Engine.Localize( "MENU_MONTHS_AUG" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local8, "monthIndex" ), 8 )
		local f32_local9 = Engine.CreateModel( f32_local0, "september" )
		Engine.SetModelValue( Engine.CreateModel( f32_local9, "month" ), Engine.Localize( "MENU_MONTHS_SEP" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local9, "monthIndex" ), 9 )
		local f32_local10 = Engine.CreateModel( f32_local0, "october" )
		Engine.SetModelValue( Engine.CreateModel( f32_local10, "month" ), Engine.Localize( "MENU_MONTHS_OCT" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local10, "monthIndex" ), 10 )
		local f32_local11 = Engine.CreateModel( f32_local0, "november" )
		Engine.SetModelValue( Engine.CreateModel( f32_local11, "month" ), Engine.Localize( "MENU_MONTHS_NOV" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local11, "monthIndex" ), 11 )
		local f32_local12 = Engine.CreateModel( f32_local0, "december" )
		Engine.SetModelValue( Engine.CreateModel( f32_local12, "month" ), Engine.Localize( "MENU_MONTHS_DEC" ) )
		Engine.SetModelValue( Engine.CreateModel( f32_local12, "monthIndex" ), 12 )
		f32_arg1.months = {
			f32_local1,
			f32_local2,
			f32_local3,
			f32_local4,
			f32_local5,
			f32_local6,
			f32_local7,
			f32_local8,
			f32_local9,
			f32_local10,
			f32_local11,
			f32_local12
		}
	end,
	getCount = function ( f33_arg0 )
		return #f33_arg0.months
	end,
	getItem = function ( f34_arg0, f34_arg1, f34_arg2 )
		return f34_arg1.months[f34_arg2]
	end
}
DataSources.Day = {
	prepare = function ( f35_arg0, f35_arg1, f35_arg2 )
		f35_arg1.days = {}
		local f35_local0 = 31
		local f35_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "dayModel" )
		for f35_local2 = 1, f35_local0, 1 do
			local f35_local5 = Engine.CreateModel( f35_local1, "Day " .. f35_local2 )
			Engine.SetModelValue( Engine.CreateModel( f35_local5, "day" ), f35_local2 )
			f35_arg1.days[#f35_arg1.days + 1] = f35_local5
		end
	end,
	getCount = function ( f36_arg0 )
		return #f36_arg0.days
	end,
	getItem = function ( f37_arg0, f37_arg1, f37_arg2 )
		return f37_arg1.days[f37_arg2]
	end
}
DataSources.Year = {
	prepare = function ( f38_arg0, f38_arg1, f38_arg2 )
		f38_arg1.years = {}
		local f38_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "yearModel" )
		for f38_local1 = 2015, 1900, -1 do
			local f38_local4 = Engine.CreateModel( f38_local0, "Year " .. f38_local1 )
			Engine.SetModelValue( Engine.CreateModel( f38_local4, "year" ), f38_local1 )
			f38_arg1.years[#f38_arg1.years + 1] = f38_local4
		end
	end,
	getCount = function ( f39_arg0 )
		return #f39_arg0.years
	end,
	getItem = function ( f40_arg0, f40_arg1, f40_arg2 )
		return f40_arg1.years[f40_arg2]
	end
}
DataSources.TabbedView = {
	prepare = function ( f41_arg0, f41_arg1, f41_arg2 )
		f41_arg1.tabs = {}
		local f41_local0 = {}
		if CoD.isCampaign == true then
			f41_local0 = {
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
			f41_local0 = {
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
		if #f41_local0 == 0 then
			return 
		end
		table.insert( f41_local0, 1, {
			displayName = "",
			viewWidget = "",
			tabIcon = CoD.buttonStrings.shoulderl
		} )
		table.insert( f41_local0, {
			displayName = "",
			viewWidget = "",
			tabIcon = CoD.buttonStrings.shoulderr
		} )
		local f41_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "TabViewModel" )
		for f41_local5, f41_local6 in ipairs( f41_local0 ) do
			local f41_local7 = Engine.CreateModel( f41_local1, "tabModel_" .. f41_local5 )
			Engine.SetModelValue( Engine.CreateModel( f41_local7, "tabName" ), f41_local6.displayName )
			Engine.SetModelValue( Engine.CreateModel( f41_local7, "tabWidget" ), f41_local6.viewWidget )
			Engine.SetModelValue( Engine.CreateModel( f41_local7, "tabIcon" ), f41_local6.tabIcon )
			f41_arg1.tabs[#f41_arg1.tabs + 1] = f41_local7
		end
	end,
	getCount = function ( f42_arg0 )
		return #f42_arg0.tabs
	end,
	getItem = function ( f43_arg0, f43_arg1, f43_arg2 )
		return f43_arg1.tabs[f43_arg2]
	end
}
DataSources.StartMenuTabs = ListHelper_SetupDataSource( "StartMenuTabs", function ( f44_arg0 )
	local f44_local0 = {}
	table.insert( f44_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	if Engine.IsDemoPlaying() then
		local f44_local1 = "CoD.StartMenu_GameOptions"
		if Engine.IsZombiesGame() then
			f44_local1 = "CoD.StartMenu_GameOptions_ZM"
		end
		table.insert( f44_local0, {
			models = {
				tabName = Engine.Localize( "MENU_THEATER_CAPS" ),
				tabWidget = f44_local1,
				tabIcon = ""
			},
			properties = {
				tabId = "gameOptions"
			}
		} )
	elseif Engine.IsInGame() then
		if IsGameTypeDOA() and not InSafehouse() then
			table.insert( f44_local0, {
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
			table.insert( f44_local0, {
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
				if CoD.isSafehouse and CoD.isOnlineGame() and not IsInTrainingSim( f44_arg0 ) and Dvar.ui_safehousebarracks:get() and not IsPlayerAGuest( f44_arg0 ) then
					table.insert( f44_local0, {
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
				if HighestMapReachedGreaterThan( f44_arg0, 1 ) or LUI.DEV ~= nil then
					table.insert( f44_local0, {
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
				if not CoD.isSafehouse and not IsPlayerAGuest( f44_arg0 ) then
					table.insert( f44_local0, {
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
			table.insert( f44_local0, {
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
			table.insert( f44_local0, {
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
		if not IsPlayerAGuest( f44_arg0 ) then
			table.insert( f44_local0, {
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
		end
		if not IsLobbyNetworkModeLAN() and not Dvar.ui_execdemo:get() and not Engine.IsCampaignModeZombies() and not IsPlayerAGuest( f44_arg0 ) then
			table.insert( f44_local0, {
				models = {
					tabName = "MENU_TAB_CHALLENGES_CAPS",
					tabWidget = "CoD.StartMenu_Challenges",
					tabIcon = ""
				},
				properties = {
					tabId = "challenges"
				}
			} )
			local f44_local1 = CoD.isPC
			if f44_local1 then
				f44_local1 = Mods_IsUsingMods()
			end
			table.insert( f44_local0, {
				models = {
					tabName = "MENU_TAB_BARRACKS_CAPS",
					tabWidget = "CoD.StartMenu_Barracks",
					tabIcon = "",
					disabled = f44_local1
				},
				properties = {
					tabId = "barracks"
				}
			} )
			if CommunityOptionsEnabled() then
				local f44_local2 = CoD.perController[f44_arg0].openMediaTabAfterClosingGroups
				CoD.perController[f44_arg0].openMediaTabAfterClosingGroups = false
				table.insert( f44_local0, {
					models = {
						tabName = "MENU_TAB_MEDIA_CAPS",
						tabWidget = "CoD.StartMenu_Media",
						tabIcon = ""
					},
					properties = {
						tabId = "media",
						selectIndex = f44_local2
					}
				} )
			end
		end
	end
	if IsGameTypeDOA() and Engine.IsInGame() and not InSafehouse() then
		local f44_local1 = table.insert
		local f44_local2 = f44_local0
		local f44_local3 = {
			models = {
				tabName = "MENU_TAB_OPTIONS_CAPS",
				tabWidget = "CoD.StartMenu_Options_DOA",
				tabIcon = ""
			}
		}
		local f44_local4 = {
			tabId = "options"
		}
		local f44_local5 = Dvar.ui_execdemo:get()
		if f44_local5 then
			f44_local5 = not Engine.IsInGame()
		end
		f44_local4.selectIndex = f44_local5
		f44_local3.properties = f44_local4
		f44_local1( f44_local2, f44_local3 )
	else
		local f44_local1 = table.insert
		local f44_local2 = f44_local0
		local f44_local3 = {
			models = {
				tabName = "MENU_TAB_OPTIONS_CAPS",
				tabWidget = "CoD.StartMenu_Options",
				tabIcon = ""
			}
		}
		local f44_local4 = {
			tabId = "options"
		}
		local f44_local5 = Dvar.ui_execdemo_gamescom:get()
		if f44_local5 then
			f44_local5 = not Engine.IsInGame()
		end
		f44_local4.selectIndex = f44_local5
		f44_local3.properties = f44_local4
		f44_local1( f44_local2, f44_local3 )
	end
	table.insert( f44_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f44_local0
end, true )
DataSources.GameSettingsTabs = ListHelper_SetupDataSource( "GameSettingsTabs", function ( f45_arg0 )
	local f45_local0 = {}
	local f45_local1 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" )
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
			tabName = f45_local1,
			tabWidget = "CoD.GameSettings_GameModeRules",
			tabIcon = ""
		},
		properties = {
			tabId = "game_mode_rules"
		}
	} )
	table.insert( f45_local0, {
		models = {
			tabName = "MENU_GLOBAL_SETTINGS",
			tabWidget = "CoD.GameSettings_GlobalSettings",
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
end, true )
DataSources.GameSettingsCompetitiveTabs = ListHelper_SetupDataSource( "GameSettingsCompetitiveTabs", function ( f46_arg0 )
	local f46_local0 = {}
	table.insert( f46_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f46_local0, {
		models = {
			tabName = "MENU_SETTINGS_CAPS",
			tabWidget = "CoD.GameSettings_CompetitiveSettings",
			tabIcon = ""
		},
		properties = {
			tabId = "game_mode_rules"
		}
	} )
	table.insert( f46_local0, {
		models = {
			tabName = "MENU_ADVANCED_CAPS",
			tabWidget = "CoD.GameSettings_CompetitiveAdvancedSettings",
			tabIcon = ""
		},
		properties = {
			tabId = "global_settings"
		}
	} )
	table.insert( f46_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f46_local0
end, true )
DataSources.CallingCardsTabs = ListHelper_SetupDataSource( "CallingCardsTabs", function ( f47_arg0 )
	local f47_local0 = {}
	table.insert( f47_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	local f47_local1 = {
		"sidebet",
		"mp_action"
	}
	local f47_local2 = function ( f48_arg0, f48_arg1 )
		return function ( f49_arg0 )
			if f48_arg1 then
				for f49_local3, f49_local4 in ipairs( f47_local1 ) do
					if f49_arg0.challengeCategory == f49_local4 then
						return false
					end
				end
			end
			local f49_local0
			if f49_arg0.challengeRow == nil or f49_arg0.isLocked or f49_arg0.isMastery == f48_arg0 then
				f49_local0 = false
			else
				f49_local0 = true
			end
			return f49_local0
		end
		
	end
	
	local f47_local3 = function ( f50_arg0, f50_arg1 )
		local f50_local0 = 0
		for f50_local4, f50_local5 in ipairs( f50_arg0 ) do
			if (not f50_arg1 or f50_arg1( f50_local5 )) and Engine.IsEmblemBackgroundNew( f47_arg0, f50_local5.imageID ) then
				f50_local0 = f50_local0 + 1
			end
		end
		return f50_local0
	end
	
	local f47_local4 = function ()
		local f51_local0 = 0
		for f51_local4, f51_local5 in ipairs( Engine.GetBackgroundsForCategoryName( f47_arg0, "default" ) ) do
			if Engine.IsEmblemBackgroundNew( f47_arg0, f51_local5.id ) then
				f51_local0 = f51_local0 + 1
			end
		end
		return f51_local0
	end
	
	local f47_local5 = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3, f52_arg4 )
		table.insert( f47_local0, {
			models = {
				tabName = f52_arg0,
				tabWidget = f52_arg1,
				tabCategory = f52_arg2,
				breadcrumbCount = f52_arg4,
				tabIcon = ""
			},
			properties = {
				tabId = f52_arg3
			}
		} )
	end
	
	local f47_local6 = Engine.GetChallengeInfoForImages( f47_arg0, nil, Enum.eModes.MODE_CAMPAIGN )
	f47_local5( "MENU_DEFAULT_CAPS", "CoD.CallingCards_Stickerbook_Default", "default", "callingcards_default", f47_local4() )
	if not CoD.isPC or Engine.CheckNetConnection() then
		f47_local5( "MENU_CAMPAIGN_CAPS", "CoD.CallingCards_Stickerbook", "cp", "callingcards_cp", f47_local3( f47_local6, f47_local2( true, true ) ) )
	end
	if not IsLobbyNetworkModeLAN() then
		local f47_local7 = Engine.GetChallengeInfoForImages( f47_arg0, nil, Enum.eModes.MODE_MULTIPLAYER )
		CoD.PrestigeUtility.AddPrestigeChallenges( f47_arg0, Enum.eModes.MODE_MULTIPLAYER, f47_local7 )
		if ArenaChallengesEnabled() then
			CoD.ArenaUtility.AddArenaChallenges( f47_arg0, f47_local7 )
		end
		local f47_local8 = Engine.GetChallengeInfoForImages( f47_arg0, nil, Enum.eModes.MODE_ZOMBIES )
		CoD.PrestigeUtility.AddPrestigeChallenges( f47_arg0, Enum.eModes.MODE_ZOMBIES, f47_local8 )
		f47_local5( "MENU_MULTIPLAYER_CAPS", "CoD.CallingCards_Stickerbook", "mp", "callingcards_mp", f47_local3( f47_local7, f47_local2( true, true ) ) )
		f47_local5( "MENU_ZOMBIES_CAPS", "CoD.CallingCards_Stickerbook", "zm", "callingcards_zm", f47_local3( f47_local8, f47_local2( true, true ) ) )
		local f47_local9 = f47_local3( f47_local6, f47_local2( false, true ) ) + f47_local3( f47_local7, f47_local2( false, true ) ) + f47_local3( f47_local8, f47_local2( false, true ) )
		if ArenaChallengesEnabled() then
			local f47_local10 = CoD.ArenaUtility.GetArenaVetMasterCard( f47_arg0 )
			if not f47_local10.models.isLocked then
				f47_local9 = f47_local9 + 1
			end
		end
		f47_local5( "MENU_MASTERS_CAPS", "CoD.CallingCards_Stickerbook_Master", "master", "callingcards_master", f47_local9 )
	end
	if IsLive() then
		local f47_local7 = CoD.BlackMarketUtility.GetCallingCardRows()
		local f47_local8 = 0
		for f47_local14, f47_local15 in ipairs( f47_local7 ) do
			local f47_local16 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f47_local15, 0 )
			local f47_local12
			if Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f47_local15, 4 ) ~= "" or Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f47_local15, 5 ) == "" then
				f47_local12 = false
			else
				f47_local12 = true
			end
			if not CoD.BlackMarketUtility.IsItemLocked( f47_arg0, f47_local16 ) and (not f47_local12 or not BlackMarketHideMasterCallingCards()) then
				local f47_local13 = CoD.BlackMarketUtility.GetLootCallingCardIndex( f47_arg0, f47_local16 )
				if f47_local13 and Engine.IsEmblemBackgroundNew( f47_arg0, f47_local13 ) then
					f47_local8 = f47_local8 + 1
				end
			end
		end
		if not Dvar.ui_disable_side_bet:exists() or Dvar.ui_disable_side_bet:get() == "0" then
			for f47_local15, f47_local16 in ipairs( CoD.ChallengesUtility.GetSideBetCallingCards( f47_arg0, nil ) ) do
				if not f47_local16.models.isLocked and Engine.IsEmblemBackgroundNew( f47_arg0, f47_local16.models.iconId ) then
					f47_local8 = f47_local8 + 1
				end
			end
		end
		for f47_local14, f47_local15 in ipairs( CoD.ChallengesUtility.SpecialContractCategories ) do
			for f47_local13, f47_local17 in ipairs( CoD.ChallengesUtility.GetChallengeTable( f47_arg0, Enum.eModes.MODE_MULTIPLAYER, "mp", f47_local15, nil, false ) ) do
				if not f47_local17.models.isLocked and Engine.IsEmblemBackgroundNew( f47_arg0, f47_local17.models.iconId ) then
					f47_local8 = f47_local8 + 1
				end
			end
		end
		f47_local5( "MENU_BLACK_MARKET", "CoD.CallingCards_Set_BlackMarket", "loot", "callingcards_bm", f47_local8 )
	end
	table.insert( f47_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f47_local0
end, true )
DataSources.CPChallengesTabs = ListHelper_SetupDataSource( "CPChallengesTabs", function ( f53_arg0 )
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
			tabName = "MENU_CHALLENGE_CATEGORY_MISSIONS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "missions"
		},
		properties = {
			tabId = "missions",
			disabled = Challenges_IsCategoryLocked( nil, f53_arg0, "missions" ),
			selectIndex = false
		}
	} )
	table.insert( f53_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_TOOLSOFTHETRADE_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "tott"
		},
		properties = {
			tabId = "tott",
			disabled = Challenges_IsCategoryLocked( nil, f53_arg0, "tott" ),
			selectIndex = false
		}
	} )
	table.insert( f53_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_CAREER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "career"
		},
		properties = {
			tabId = "career",
			disabled = Challenges_IsCategoryLocked( nil, f53_arg0, "career" ),
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
end )
DataSources.ZMChallengesTabs = ListHelper_SetupDataSource( "ZMChallengesTabs", function ( f54_arg0 )
	local f54_local0 = {}
	local f54_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local f54_local2 = "missions"
	if f54_local1 ~= nil then
		f54_local2 = Engine.GetModelValue( f54_local1 )
	end
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
			tabName = "MENU_CHALLENGE_CATEGORY_ZOMBIEHUNTER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "zombiehunter"
		},
		properties = {
			tabId = "zombiehunter",
			disabled = Challenges_IsCategoryLocked( nil, f54_arg0, "zombiehunter" ),
			selectIndex = false
		}
	} )
	table.insert( f54_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_SURVIVALIST_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "survivalist"
		},
		properties = {
			tabId = "survivalist",
			disabled = Challenges_IsCategoryLocked( nil, f54_arg0, "survivalist" ),
			selectIndex = false
		}
	} )
	table.insert( f54_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_GUMGOBBLER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "gumgobbler"
		},
		properties = {
			tabId = "gumgobbler",
			disabled = Challenges_IsCategoryLocked( nil, f54_arg0, "gumgobbler" ),
			selectIndex = false
		}
	} )
	table.insert( f54_local0, {
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
	table.insert( f54_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f54_local3 = 1, #f54_local0, 1 do
		if f54_local0[f54_local3].properties ~= nil then
			if f54_local0[f54_local3].models.tabCategory == f54_local2 then
				f54_local0[f54_local3].properties.selectIndex = true
			else
				f54_local0[f54_local3].properties.selectIndex = false
			end
		end
	end
	return f54_local0
end )
DataSources.ChallengesTabs = ListHelper_SetupDataSource( "ChallengesTabs", function ( f55_arg0 )
	local f55_local0 = {}
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
			tabName = "MPUI_SUMMARY_CAPS",
			tabWidget = "CoD.Challenges_MP_Summary",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_mp_summary"
		}
	} )
	table.insert( f55_local0, {
		models = {
			tabName = "MENU_OPERATIONS_CAPS",
			tabWidget = "CoD.Challenges_FrameWidget_Operations",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_frameWidget_operations"
		}
	} )
	table.insert( f55_local0, {
		models = {
			tabName = "HEROES_SPECIALISTS_CAPS",
			tabWidget = "CoD.Challenges_FrameWidget_Specialists",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_framewidget_specialists"
		}
	} )
	table.insert( f55_local0, {
		models = {
			tabName = "MENU_SCORESTREAKS_CAPS",
			tabWidget = "CoD.Challenges_FrameWidget_Scorestreaks",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_framewidget_scorestreaks"
		}
	} )
	table.insert( f55_local0, {
		models = {
			tabName = "MENU_EMBLEM_BACKGROUND_PRESTIGETAB",
			tabWidget = "CoD.Challenges_FrameWidget_Prestige",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_framewidget_prestige"
		}
	} )
	if ArenaChallengesEnabled() then
		table.insert( f55_local0, {
			models = {
				tabName = "MENU_ARENA_CAPS",
				tabWidget = "CoD.Challenges_FrameWidget_Arena",
				tabIcon = ""
			},
			properties = {
				tabId = "challenges_framewidget_arena"
			}
		} )
	end
	table.insert( f55_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f55_local0
end )
DataSources.OperationsTabs = ListHelper_SetupDataSource( "OperationsTabs", function ( f56_arg0 )
	local f56_local0 = {}
	local f56_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local f56_local2 = "bootcamp"
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
			tabName = "MENU_CHALLENGE_CATEGORY_BOOTCAMP_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "bootcamp"
		},
		properties = {
			tabId = "bootcamp",
			disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "bootcamp" ),
			selectIndex = false
		}
	} )
	table.insert( f56_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_KILLER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "killer"
		},
		properties = {
			tabId = "killer",
			disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "killer" ),
			selectIndex = false
		}
	} )
	table.insert( f56_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_HUMILIATION_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "humiliation"
		},
		properties = {
			tabId = "humiliation",
			disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "humiliation" ),
			selectIndex = false
		}
	} )
	table.insert( f56_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_CAREER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "career"
		},
		properties = {
			tabId = "career",
			disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "career" ),
			selectIndex = false
		}
	} )
	table.insert( f56_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_GAMEVICTORIES_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "gamevictories"
		},
		properties = {
			tabId = "gamevictories",
			disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "gamevictories" ),
			selectIndex = false
		}
	} )
	table.insert( f56_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_GAMEHEROICS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "gameheroics"
		},
		properties = {
			tabId = "gameheroics",
			disabled = Challenges_IsCategoryLocked( nil, f56_arg0, "gameheroics" ),
			selectIndex = false
		}
	} )
	table.insert( f56_local0, {
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
end )
DataSources.SpecialistsTabs = ListHelper_SetupDataSource( "SpecialistsTabs", function ( f57_arg0 )
	local f57_local0 = {}
	local f57_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local f57_local2 = "weapons"
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
			tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTWEAPONS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "weapons"
		},
		properties = {
			tabId = "weapons",
			disabled = Challenges_IsCategoryLocked( nil, f57_arg0, "weapons" ),
			selectIndex = false
		}
	} )
	table.insert( f57_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTABILITIES_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "abilities"
		},
		properties = {
			tabId = "abilities",
			disabled = Challenges_IsCategoryLocked( nil, f57_arg0, "abilities" ),
			selectIndex = false
		}
	} )
	table.insert( f57_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTKILLJOYS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "killjoys"
		},
		properties = {
			tabId = "killjoys",
			disabled = Challenges_IsCategoryLocked( nil, f57_arg0, "killjoys" ),
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
end )
DataSources.ScorestreaksTabs = ListHelper_SetupDataSource( "ScorestreaksTabs", function ( f58_arg0 )
	local f58_local0 = {}
	local f58_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local f58_local2 = "airassault"
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
			tabName = "MENU_CHALLENGE_CATEGORY_AIR_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "airassault"
		},
		properties = {
			tabId = "airassault",
			disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "airassault" ),
			selectIndex = false
		}
	} )
	table.insert( f58_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_GROUND_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "groundassault"
		},
		properties = {
			tabId = "groundassault",
			disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "groundassault" ),
			selectIndex = false
		}
	} )
	table.insert( f58_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_SUPPORT_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "support"
		},
		properties = {
			tabId = "support",
			disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "support" ),
			selectIndex = false
		}
	} )
	table.insert( f58_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_RETURNFIRE_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "returnfire"
		},
		properties = {
			tabId = "returnfire",
			disabled = Challenges_IsCategoryLocked( nil, f58_arg0, "returnfire" ),
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
end )
DataSources.PrestigeTabs = ListHelper_SetupDataSource( "PrestigeTabs", function ( f59_arg0 )
	local f59_local0 = {}
	local f59_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local f59_local2 = "combathandling"
	if f59_local1 ~= nil then
		f59_local2 = Engine.GetModelValue( f59_local1 )
	end
	table.insert( f59_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_COMBATHANDLING_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "combathandling"
		},
		properties = {
			tabId = "combathandling",
			disabled = Challenges_IsCategoryLocked( nil, f59_arg0, "combathandling" ),
			selectIndex = false
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_COMBATEFFICIENCY_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "combatefficiency"
		},
		properties = {
			tabId = "combatefficiency",
			disabled = Challenges_IsCategoryLocked( nil, f59_arg0, "combatefficiency" ),
			selectIndex = false
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_PERKS1_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "perks1"
		},
		properties = {
			tabId = "perks1",
			disabled = Challenges_IsCategoryLocked( nil, f59_arg0, "perks1" ),
			selectIndex = false
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_PERKS2_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "perks2"
		},
		properties = {
			tabId = "perks2",
			disabled = Challenges_IsCategoryLocked( nil, f59_arg0, "perks2" ),
			selectIndex = false
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_PERKS3_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "perks3"
		},
		properties = {
			tabId = "perks3",
			disabled = Challenges_IsCategoryLocked( nil, f59_arg0, "perks3" ),
			selectIndex = false
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_LETHALS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "lethals"
		},
		properties = {
			tabId = "lethals",
			disabled = Challenges_IsCategoryLocked( nil, f59_arg0, "lethals" ),
			selectIndex = false
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_TACTICALS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "tacticals"
		},
		properties = {
			tabId = "tacticals",
			disabled = Challenges_IsCategoryLocked( nil, f59_arg0, "tacticals" ),
			selectIndex = false
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_WILDCARDS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "wildcards"
		},
		properties = {
			tabId = "wildcards",
			disabled = Challenges_IsCategoryLocked( nil, f59_arg0, "wildcards" ),
			selectIndex = false
		}
	} )
	table.insert( f59_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f59_local3 = 1, #f59_local0, 1 do
		if f59_local0[f59_local3].properties ~= nil then
			if f59_local0[f59_local3].models.tabCategory == f59_local2 then
				f59_local0[f59_local3].properties.selectIndex = true
			else
				f59_local0[f59_local3].properties.selectIndex = false
			end
		end
	end
	return f59_local0
end )
DataSources.ArenaChallengesTabs = ListHelper_SetupDataSource( "ArenaChallengesTabs", function ( f60_arg0 )
	local f60_local0 = {}
	local f60_local1 = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local f60_local2 = "arenavet"
	if f60_local1 ~= nil then
		f60_local2 = Engine.GetModelValue( f60_local1 )
	end
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
			tabName = "MENU_CHALLENGE_CATEGORY_ARENAVET_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook_ArenaVet",
			tabIcon = "",
			tabCategory = "arenavet"
		},
		properties = {
			tabId = "arenavet",
			selectIndex = false
		}
	} )
	table.insert( f60_local0, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_ARENABEST_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook_ArenaBest",
			tabIcon = "",
			tabCategory = "arenabest"
		},
		properties = {
			tabId = "arenabest",
			selectIndex = false
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
	for f60_local3 = 1, #f60_local0, 1 do
		if f60_local0[f60_local3].properties ~= nil then
			if f60_local0[f60_local3].models.tabCategory == f60_local2 then
				f60_local0[f60_local3].properties.selectIndex = true
			else
				f60_local0[f60_local3].properties.selectIndex = false
			end
		end
	end
	return f60_local0
end )
DataSources.GameSettingsOptions = ListHelper_SetupDataSource( "GameSettingsOptions", function ( f61_arg0 )
	local f61_local0 = {}
	if IsLive() then
		table.insert( f61_local0, {
			models = {
				displayText = "MENU_SAVE",
				description = "MENU_SAVE_DESCRIPTION",
				action = SaveCustomGame,
				icon = "t7_icon_menu_simple_save",
				disabled = false
			}
		} )
	end
	table.insert( f61_local0, {
		models = {
			displayText = "MENU_REVERT_CHANGES",
			description = "MENU_REVERT_CHANGES_DESCRIPTION",
			action = ResetGameSettings,
			icon = "t7_icon_menu_simple_revertchanges",
			disabled = false
		}
	} )
	local f61_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.selectedSetting" ) )
	local f61_local2 = CoD.perController[f61_arg0].selectedGameSettingElement
	if f61_local2 and f61_local2.revert then
		table.insert( f61_local0, {
			models = {
				displayText = "MENU_REVERT_SETTING",
				description = "MENU_REVERT_SETTINGS_DESCRIPTION",
				action = ResetSelectedGameSetting,
				icon = "t7_icon_menu_simple_revertsetting",
				disabled = false
			}
		} )
	end
	return f61_local0
end, true )
DataSources.CodCasterSideBarTabs = ListHelper_SetupDataSource( "CodCasterSideBarTabs", function ( f62_arg0 )
	local f62_local0 = {}
	table.insert( f62_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f62_local0, {
		models = {
			tabName = "CODCASTER_SETTINGS",
			tabWidget = "CoD.CodCasterSettingsSideBarDisplaySettings",
			tabIcon = ""
		},
		properties = {
			tabId = "displaySettings",
			selectIndex = IsPerControllerTablePropertyValue( f62_arg0, "codcasterSettingsSideBarPrimaryTab", "displaySettings" )
		}
	} )
	table.insert( f62_local0, {
		models = {
			tabName = "CODCASTER_LOADOUT",
			tabWidget = "CoD.CodCasterSettingsSideBarLoadoutSettings",
			tabIcon = ""
		},
		properties = {
			tabId = "loadoutSettings",
			selectIndex = IsPerControllerTablePropertyValue( f62_arg0, "codcasterSettingsSideBarPrimaryTab", "loadoutSettings" )
		}
	} )
	table.insert( f62_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f62_local0
end )
DataSources.EditCodCasterSettingsButtonList = ListHelper_SetupDataSource( "EditCodCasterSettingsButtonList", function ( f63_arg0 )
	local f63_local0 = {}
	local f63_local1 = function ( f64_arg0, f64_arg1 )
		Engine.SetModelValue( Engine.CreateModel( DataSources.TeamIdentity.getModel( f64_arg0 ), "team" ), f64_arg1 )
	end
	
	local f63_local2 = "shoutcaster_fe_team_identity"
	local f63_local3 = CoD.ShoutcasterProfileVarBool( f63_arg0, f63_local2 ) == false
	local f63_local4 = {}
	table.insert( f63_local4, {
		name = Engine.ToUpper( Engine.Localize( "CODCASTER_TEAM_IDENTITY_FACTIONS" ) ),
		value = Enum.ShoutcasterSettingTeamIdentityMode.SHOUTCASTER_SETTING_TEAM_IDENTITY_MODE_FACTION
	} )
	table.insert( f63_local4, {
		name = Engine.ToUpper( Engine.Localize( "CODCASTER_TEAM_IDENTITY_CUSTOM" ) ),
		value = Enum.ShoutcasterSettingTeamIdentityMode.SHOUTCASTER_SETTING_TEAM_IDENTITY_MODE_CUSTOM
	} )
	for f63_local8, f63_local9 in ipairs( {
		{
			btnType = "btnSettings",
			displayText = "CODCASTER_QUICK_SETTINGS",
			hintText = "CODCASTER_QUICK_SETTINGS_DESC",
			buttonOnly = true,
			disabled = false,
			showTeam1Info = false,
			showTeam2Info = false,
			actionFn = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
				NavigateToMenu( f66_arg4, "EditCodCasterQuickSettings", true, f66_arg2 )
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
			actionFn = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
				NavigateToMenu( f67_arg4, "EditCodCasterDisplaySettings", true, f67_arg2 )
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
			actionFn = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
				NavigateToMenu( f68_arg4, "EditCodCasterLoadoutSettings", true, f68_arg2 )
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
			actionFn = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4 )
				
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
			optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f63_arg0, "CoDCasterSettings_TeamIdentity", f63_local4, f63_local2, function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
				for f65_local0 = 1, #f65_arg0.ButtonList.EditCodCasterSettingsButtonList, 1 do
					local f65_local3 = f65_arg0.ButtonList.EditCodCasterSettingsButtonList[f65_local0]
					if f65_local3.properties and (f65_local3.properties.btnType == "btnTeamIdentitySubSettings" or f65_local3.properties.btnType == "btnSwapTeamIdentitySettings") then
						local f65_local4 = Engine.GetModel( f65_local3.model, "disabled" )
						local f65_local5 = f65_arg3 == 0
						Engine.SetModelValue( f65_local4, f65_local5 )
						f65_local3.properties.disabled = f65_local5
						CoD.SetupTeamIdentityInformation( f65_arg0, f65_arg1, "team1" )
						CoD.SetupTeamIdentityInformation( f65_arg0, f65_arg1, "team2" )
					end
				end
			end
			, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
			currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f63_arg0, f63_local4, f63_local2 )
		},
		{
			btnType = "btnTeamIdentitySubSettings",
			displayText = "CODCASTER_TEAM1_SETTINGS",
			hintText = "CODCASTER_TEAM1_SETTINGS_DESC",
			buttonOnly = true,
			disabled = f63_local3,
			showTeam1Info = true,
			showTeam2Info = false,
			actionFn = function ( f70_arg0, f70_arg1, f70_arg2, f70_arg3, f70_arg4 )
				f63_local1( f70_arg2, "team1" )
				NavigateToMenu( f70_arg4, "EditTeamIdentity", true, f70_arg2 )
			end
		},
		{
			btnType = "btnTeamIdentitySubSettings",
			displayText = "CODCASTER_TEAM2_SETTINGS",
			hintText = "CODCASTER_TEAM2_SETTINGS_DESC",
			buttonOnly = true,
			disabled = f63_local3,
			showTeam1Info = false,
			showTeam2Info = true,
			actionFn = function ( f71_arg0, f71_arg1, f71_arg2, f71_arg3, f71_arg4 )
				f63_local1( f71_arg2, "team2" )
				NavigateToMenu( f71_arg4, "EditTeamIdentity", true, f71_arg2 )
			end
		},
		{
			btnType = "btnSwapTeamIdentitySettings",
			displayText = "CODCASTER_SWAP_TEAM_SETTINGS",
			hintText = "CODCASTER_SWAP_TEAM_SETTINGS_DESC",
			buttonOnly = true,
			disabled = f63_local3,
			showTeam1Info = true,
			showTeam2Info = true,
			actionFn = function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3, f72_arg4 )
				CoD.CodCasterUtility.SwapTeamSettings( f72_arg2 )
				CoD.SetupTeamIdentityInformation( f72_arg4, f72_arg2, "team1" )
				CoD.SetupTeamIdentityInformation( f72_arg4, f72_arg2, "team2" )
				LuaUtils.UI_ShowInfoMessageDialog( f72_arg2, "CODCASTER_SWAP_TEAM_SETTINGS_SUCCESS" )
			end
		}
	} ) do
		table.insert( f63_local0, {
			models = {
				displayText = Engine.ToUpper( Engine.Localize( f63_local9.displayText ) ),
				hintText = f63_local9.hintText,
				buttonOnly = f63_local9.buttonOnly,
				sliderOnly = f63_local9.sliderOnly,
				disabled = f63_local9.disabled,
				showTeam1Info = f63_local9.showTeam1Info,
				showTeam2Info = f63_local9.showTeam2Info,
				optionsDatasource = f63_local9.optionsDatasource,
				currentSelection = f63_local9.currentSelection,
				selected = false
			},
			properties = {
				btnType = f63_local9.btnType,
				hideArrows = f63_local9.buttonOnly == true,
				disabled = f63_local9.disabled,
				action = f63_local9.actionFn,
				spacing = f63_local9.spacing
			}
		} )
	end
	return f63_local0
end, false, nil, nil, function ( f73_arg0, f73_arg1, f73_arg2 )
	if f73_arg0.EditCodCasterSettingsButtonList[f73_arg1].properties.spacing then
		return f73_arg0.EditCodCasterSettingsButtonList[f73_arg1].properties.spacing
	else
		return f73_arg0.spacing
	end
end )
DataSources.CodCasterQuickSettingsButtonList = ListHelper_SetupDataSource( "CodCasterQuickSettingsButtonList", function ( f74_arg0 )
	local f74_local0 = {}
	for f74_local4, f74_local5 in ipairs( {
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
			displayText = "CODCASTER_QS_PLAYER_NUMBERS",
			hintText = "CODCASTER_QS_PLAYER_NUMBERS_HINT",
			profileVar = "shoutcaster_qs_playernumbers"
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
		table.insert( f74_local0, {
			models = {
				displayText = Engine.Localize( f74_local5.displayText ),
				hintText = Engine.Localize( f74_local5.hintText ),
				profileVarValue = CoD.ShoutcasterProfileVarBool( f74_arg0, f74_local5.profileVar )
			},
			properties = {
				profileVar = f74_local5.profileVar
			}
		} )
	end
	return f74_local0
end )
DataSources.CodCasterDisplaySettingsButtonList = ListHelper_SetupDataSource( "CodCasterDisplaySettingsButtonList", function ( f75_arg0 )
	local f75_local0 = {}
	local f75_local1 = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3 )
		if not Engine.IsInGame() then
			return 
		else
			ToggleControllerModelValueNumber( f76_arg1, "CodCaster.profileSettingsUpdated" )
		end
	end
	
	local f75_local2 = {}
	table.insert( f75_local2, {
		name = "MENU_OFF",
		value = 0
	} )
	table.insert( f75_local2, {
		name = "MENU_ON",
		value = 1
	} )
	local f75_local3 = {}
	table.insert( f75_local3, {
		name = "CODCASTER_XRAY_NONE",
		value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_OFF
	} )
	table.insert( f75_local3, {
		name = "CODCASTER_XRAY_ENEMY",
		value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_ENEMY
	} )
	table.insert( f75_local3, {
		name = "CODCASTER_XRAY_BOTH",
		value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_ALL
	} )
	local f75_local4 = {}
	table.insert( f75_local4, {
		name = "MENU_ON_SPAWN",
		value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ON
	} )
	table.insert( f75_local4, {
		name = "MPUI_ALWAYS_ON",
		value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ALWAYS
	} )
	table.insert( f75_local4, {
		name = "CODCASTER_MINIMAP_STANDARD",
		value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_STANDARD
	} )
	table.insert( f75_local4, {
		name = "MENU_OFF",
		value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_OFF
	} )
	local f75_local5 = {}
	table.insert( f75_local5, {
		name = "MENU_OFF",
		value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_OFF
	} )
	table.insert( f75_local5, {
		name = "CODCASTER_MINIMAP_STANDARD",
		value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_STANDARD
	} )
	table.insert( f75_local5, {
		name = "CODCASTER_MINIMAP_FULL_VIEW",
		value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_FULL
	} )
	local f75_local6 = {}
	table.insert( f75_local6, {
		name = "MENU_FRIENDLY",
		value = 0
	} )
	table.insert( f75_local6, {
		name = "MENU_BOTH",
		value = 1
	} )
	for f75_local10, f75_local11 in ipairs( {
		{
			name = "Xray",
			displayText = "CODCASTER_DS_XRAY",
			hintText = "CODCASTER_DS_XRAY_DESC",
			profileVar = "shoutcaster_xray",
			options = f75_local3
		},
		{
			name = "TeamIdentity",
			displayText = "CODCASTER_DS_TEAM_IDENTITY",
			hintText = "CODCASTER_DS_TEAM_IDENTITY_DESC",
			profileVar = "shoutcaster_team_identity",
			options = f75_local2
		},
		{
			name = "Toolbar",
			displayText = "CODCASTER_DS_TOOLBAR",
			hintText = "CODCASTER_DS_TOOLBAR_DESC",
			profileVar = "shoutcaster_toolbar",
			options = f75_local2
		},
		{
			name = "Perks",
			displayText = "CODCASTER_DS_PERKS",
			hintText = "CODCASTER_DS_PERKS_DESC",
			profileVar = "shoutcaster_perks",
			options = f75_local4
		},
		{
			name = "Minimap",
			displayText = "CODCASTER_DS_MINIMAP",
			hintText = "CODCASTER_DS_MINIMAP_DESC",
			profileVar = "shoutcaster_minimap",
			options = f75_local5
		},
		{
			name = "TeamScore",
			displayText = "CODCASTER_DS_TEAM_SCORE",
			hintText = "CODCASTER_DS_TEAM_SCORE_DESC",
			profileVar = "shoutcaster_teamscore",
			options = f75_local2
		},
		{
			name = "Inventory",
			displayText = "CODCASTER_DS_INVENTORY",
			hintText = "CODCASTER_DS_INVENTORY_DESC",
			profileVar = "shoutcaster_inventory",
			options = f75_local2
		},
		{
			name = "Scorestreaks",
			displayText = "CODCASTER_DS_SCORESTREAKS",
			hintText = "CODCASTER_DS_SCORESTREAKS_DESC",
			profileVar = "shoutcaster_scorestreaks",
			options = f75_local2
		},
		{
			name = "ScorestreakNotifications",
			displayText = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS",
			hintText = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS_DESC",
			profileVar = "shoutcaster_scorestreaks_notification",
			options = f75_local2
		},
		{
			name = "SpecialistNotifications",
			displayText = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS",
			hintText = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS_DESC",
			profileVar = "shoutcaster_specialist_notification",
			options = f75_local2
		},
		{
			name = "ObjectiveStatus",
			displayText = "CODCASTER_DS_OBJECTIVE_STATUS",
			hintText = "CODCASTER_DS_OBJECTIVE_STATUS_DESC",
			profileVar = "shoutcaster_objective_status",
			options = f75_local2
		},
		{
			name = "WaypointMarkers",
			displayText = "CODCASTER_DS_WAYPOINT_MARKERS",
			hintText = "CODCASTER_DS_WAYPOINT_MARKERS_DESC",
			profileVar = "shoutcaster_waypoint_markers",
			options = f75_local2
		},
		{
			name = "KillFeed",
			displayText = "CODCASTER_DS_KILLFEED",
			hintText = "CODCASTER_DS_KILLFEED_DESC",
			profileVar = "shoutcaster_killfeed",
			options = f75_local2
		},
		{
			name = "CalloutCards",
			displayText = "CODCASTER_DS_CALLOUT_CARDS",
			hintText = "CODCASTER_DS_CALLOUT_CARDS_DESC",
			profileVar = "shoutcaster_calloutcards",
			options = f75_local2
		},
		{
			name = "PlayerNotifications",
			displayText = "CODCASTER_DS_PLAYER_NOTIFICATIONS",
			hintText = "CODCASTER_DS_PLAYER_NOTIFICATIONS_DESC",
			profileVar = "shoutcaster_playernotifications",
			options = f75_local2
		},
		{
			name = "VoipDock",
			displayText = "CODCASTER_DS_VOIP_DOCK",
			hintText = "CODCASTER_DS_VOIP_DOCK_DESC",
			profileVar = "shoutcaster_voipdock",
			options = f75_local2
		},
		{
			name = "PlayerNames",
			displayText = "CODCASTER_DS_PLAYER_NAMES",
			hintText = "CODCASTER_DS_PLAYER_NAMES_DESC",
			profileVar = "shoutcaster_playernames",
			options = f75_local6
		}
	} ) do
		table.insert( f75_local0, {
			models = {
				displayText = f75_local11.displayText,
				hintText = f75_local11.hintText,
				buttonOnly = false,
				disabled = false,
				optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f75_arg0, "CoDCasterDisplaySettings_" .. f75_local11.name, f75_local11.options, f75_local11.profileVar, f75_local1, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
				currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f75_arg0, f75_local11.options, f75_local11.profileVar ),
				selected = false
			},
			properties = {
				hideArrows = false,
				disabled = false
			}
		} )
	end
	return f75_local0
end )
DataSources.CodCasterLoadoutSettingsButtonList = ListHelper_SetupDataSource( "CodCasterLoadoutSettingsButtonList", function ( f77_arg0 )
	local f77_local0 = {}
	local f77_local1 = function ( f78_arg0, f78_arg1, f78_arg2, f78_arg3 )
		if not Engine.IsInGame() then
			return 
		else
			ToggleControllerModelValueNumber( f78_arg1, "CodCaster.profileSettingsUpdated" )
		end
	end
	
	local f77_local2 = {}
	table.insert( f77_local2, {
		name = "MENU_OFF",
		value = 0
	} )
	table.insert( f77_local2, {
		name = "MENU_ON",
		value = 1
	} )
	for f77_local6, f77_local7 in ipairs( {
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
		table.insert( f77_local0, {
			models = {
				displayText = f77_local7.displayText,
				hintText = f77_local7.hintText,
				buttonOnly = false,
				disabled = false,
				optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f77_arg0, "CoDCasterLoadoutSettings_" .. f77_local7.name, f77_local2, f77_local7.profileVar, f77_local1, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
				currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f77_arg0, f77_local2, f77_local7.profileVar ),
				selected = false
			},
			properties = {
				hideArrows = false,
				disabled = false
			}
		} )
	end
	return f77_local0
end )
DataSources.TeamIdentity = {
	getModel = function ( f79_arg0 )
		if not f79_arg0 then
			f79_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f79_arg0 ), "TeamIdentity" )
	end
}
DataSources.TeamIdentityInformation = {
	getModel = function ( f80_arg0, f80_arg1 )
		if not f80_arg0 then
			f80_arg0 = Engine.GetPrimaryController()
		end
		local f80_local0 = Engine.GetModel( Engine.GetModelForController( f80_arg0 ), "TeamIdentity" )
		if not f80_arg1 then
			f80_arg1 = Engine.GetModelValue( Engine.GetModel( f80_local0, "team" ) )
		end
		return Engine.CreateModel( f80_local0, f80_arg1 )
	end
}
DataSources.TeamIdentityColorList = ListHelper_SetupDataSource( "TeamIdentityColorList", function ( f81_arg0 )
	local f81_local0 = {}
	if not CoD.CodCaster_TeamIdentity.ColorList then
		CoD.CodCaster_TeamIdentity.ColorList = CoD.GetCodCasterTeamColorList( f81_arg0 )
	end
	local f81_local1 = CoD.CodCaster_TeamIdentity.ColorList
	local f81_local2 = Engine.GetModel( Engine.GetModelForController( f81_arg0 ), "TeamIdentity" )
	if f81_local2 then
		local f81_local3 = Engine.GetModelValue( Engine.GetModel( f81_local2, "team" ) )
		local f81_local4 = CoD.ShoutcasterProfileVarValue( f81_arg0, "shoutcaster_fe_" .. f81_local3 .. "_color" )
		local f81_local5 = -1
		if f81_local3 == "team1" then
			f81_local5 = CoD.ShoutcasterProfileVarValue( f81_arg0, "shoutcaster_fe_team2_color" )
		elseif f81_local3 == "team2" then
			f81_local5 = CoD.ShoutcasterProfileVarValue( f81_arg0, "shoutcaster_fe_team1_color" )
		end
		for f81_local6 = 1, #f81_local1, 1 do
			local f81_local9 = f81_local1[f81_local6]
			local f81_local10 = false
			local f81_local11 = false
			local f81_local12 = false
			if f81_local4 == f81_local6 - 1 then
				f81_local10 = true
				f81_local12 = true
			end
			if f81_local5 >= 0 and f81_local5 == f81_local6 - 1 then
				f81_local11 = true
			end
			table.insert( f81_local0, {
				models = {
					id = Engine.GetModelValue( Engine.GetModel( f81_local9, "id" ) ),
					color = Engine.GetModelValue( Engine.GetModel( f81_local9, "color" ) ),
					disabled = f81_local11,
					selected = f81_local12
				},
				properties = {
					selectIndex = f81_local10,
					disabled = f81_local11
				}
			} )
		end
	end
	return f81_local0
end )
DataSources.TeamIdentityLogoList = ListHelper_SetupDataSource( "TeamIdentityLogoList", function ( f82_arg0 )
	local f82_local0 = {}
	if not CoD.CodCaster_TeamIdentity.LogoList then
		CoD.CodCaster_TeamIdentity.LogoList = CoD.GetCodCasterTeamLogoList( f82_arg0 )
	end
	local f82_local1 = CoD.CodCaster_TeamIdentity.LogoList
	local f82_local2 = Engine.GetModel( Engine.GetModelForController( f82_arg0 ), "TeamIdentity" )
	if f82_local2 then
		local f82_local3 = Engine.GetModelValue( Engine.GetModel( f82_local2, "team" ) )
		local f82_local4 = CoD.ShoutcasterProfileVarValue( f82_arg0, "shoutcaster_fe_" .. f82_local3 .. "_icon" )
		local f82_local5 = -1
		if f82_local3 == "team1" then
			f82_local5 = CoD.ShoutcasterProfileVarValue( f82_arg0, "shoutcaster_fe_team2_icon" )
		elseif f82_local3 == "team2" then
			f82_local5 = CoD.ShoutcasterProfileVarValue( f82_arg0, "shoutcaster_fe_team1_icon" )
		end
		for f82_local6 = 1, #f82_local1, 1 do
			local f82_local9 = f82_local1[f82_local6]
			local f82_local10 = false
			local f82_local11 = false
			if f82_local4 == f82_local6 - 1 then
				f82_local10 = true
			end
			if f82_local5 >= 0 and f82_local5 == f82_local6 - 1 then
				f82_local11 = true
			end
			table.insert( f82_local0, {
				models = {
					id = Engine.GetModelValue( Engine.GetModel( f82_local9, "id" ) ),
					name = Engine.GetModelValue( Engine.GetModel( f82_local9, "name" ) ),
					ref = Engine.GetModelValue( Engine.GetModel( f82_local9, "ref" ) ),
					disabled = f82_local11
				},
				properties = {
					selectIndex = f82_local10,
					disabled = f82_local11
				}
			} )
		end
	end
	return f82_local0
end )
DataSources.GametypeSettings = {
	getModel = function ( f83_arg0 )
		local f83_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		Engine.CreateModel( f83_local0, "title" )
		Engine.CreateModel( f83_local0, "description" )
		Engine.CreateModel( f83_local0, "image" )
		Engine.SetModelValue( Engine.CreateModel( f83_local0, "gametype" ), Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", Dvar.ui_gametype:get(), "name_ref_caps" ) ) )
		return f83_local0
	end
}
DataSources.GunsmithSnapshot = {
	getModel = function ( f84_arg0 )
		local f84_local0 = Engine.CurrentSessionMode()
		if f84_local0 ~= Enum.eModes.MODE_CAMPAIGN then
			f84_local0 = Enum.eModes.MODE_MULTIPLAYER
		end
		local f84_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "GunsmithSnapshot" )
		Engine.SetModelValue( Engine.CreateModel( f84_local1, "Stats" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( f84_local1, "WeaponLevel" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( f84_local1, "PlayerID" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( f84_local1, "WeaponName" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( f84_local1, "AttachmentIcons" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( f84_local1, "BO3Logo" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( f84_local1, "ShowControls" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( f84_local1, "SessionMode" ), f84_local0 )
		return f84_local1
	end
}
DataSources.GunsmithSnapshotStatsList = ListHelper_SetupDataSource( "GunsmithSnapshotStatsList", function ( f85_arg0 )
	local f85_local0 = CoD.perController[f85_arg0].gunsmithVariantModel
	local f85_local1 = Engine.GetModel( f85_local0, "variantIndex" )
	local f85_local2 = nil
	if f85_local1 then
		f85_local2 = Engine.GetModelValue( f85_local1 )
	end
	local f85_local3 = Engine.GetModel( f85_local0, "weaponIndex" )
	local f85_local4 = nil
	if f85_local3 then
		f85_local4 = Engine.GetModelValue( f85_local3 )
	end
	local f85_local5 = {
		"statName",
		"variantStatValue",
		"weaponStatValue"
	}
	local f85_local6 = CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode()
	local f85_local7 = CoD.CraftUtility.Gunsmith.GetWeaponStatList( f85_arg0, f85_local4, f85_local6 )
	local f85_local8 = false
	local f85_local9 = 0
	if Gunsmith_IsCurrentVariantChanged( f85_arg0 ) then
		f85_local8 = true
	end
	local f85_local10 = function ( f86_arg0, f86_arg1, f86_arg2 )
		local f86_local0 = "GunsmithStats_Column_" .. tostring( f86_arg1 )
		DataSources[f86_local0] = DataSourceHelpers.ListSetup( f86_local0, function ( f87_arg0 )
			local f87_local0 = {}
			for f87_local4, f87_local5 in ipairs( f85_local5 ) do
				if not f85_local8 then
					f85_local9 = CoD.CraftUtility.Gunsmith.GetVariantStats( f87_arg0, f86_arg2, f85_local2 + 1, f85_local6 )
				end
				table.insert( f87_local0, {
					models = {
						statName = CoD.CraftUtility.Gunsmith.GetWeaponStatHeader( f86_arg2 ),
						variantStatValue = f85_local9,
						weaponStatValue = CoD.CraftUtility.Gunsmith.GetWeaponStats( f87_arg0, f86_arg2, f85_local4, f85_local6 ),
						type = f87_local5
					}
				} )
			end
			return f87_local0
		end )
		return f86_local0
	end
	
	local f85_local11 = {}
	for f85_local15, f85_local16 in ipairs( f85_local7 ) do
		table.insert( f85_local11, {
			models = {
				SnapshotStatsColumn = f85_local10( f85_arg0, f85_local15, f85_local16 )
			}
		} )
	end
	return f85_local11
end )
DataSources.CreateAClassEditSettingsName = {
	getModel = function ( f88_arg0 )
		local f88_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CreateAClassEditSettingsName" )
		Engine.SetModelValue( Engine.CreateModel( f88_local0, "name" ), "MENU_CREATE_A_CLASS_SETTINGS" )
		return f88_local0
	end
}
DataSources.StartMenuGameOptions = ListHelper_SetupDataSource( "StartMenuGameOptions", function ( f89_arg0 )
	local f89_local0 = {}
	if Engine.IsDemoPlaying() then
		local f89_local1 = Engine.GetDemoSegmentCount()
		local f89_local2 = Engine.IsDemoHighlightReelMode()
		local f89_local3 = Engine.IsDemoClipPlaying()
		if not IsDemoRestrictedBasicMode() then
			table.insert( f89_local0, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( "MENU_UPLOAD_CLIP", f89_local1 ) ),
					action = StartMenuUploadClip,
					disabledFunction = IsUploadClipButtonDisabled
				},
				properties = {
					hideHelpItemLabel = true
				}
			} )
		end
		if f89_local2 then
			table.insert( f89_local0, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) ),
					action = StartMenuOpenCustomizeHighlightReel,
					disabledFunction = IsCustomizeHighlightReelButtonDisabled
				}
			} )
		end
		table.insert( f89_local0, {
			models = {
				displayText = Engine.ToUpper( Engine.ToUpper( Engine.Localize( "MENU_JUMP_TO_START" ) ) ),
				action = StartMenuJumpToStart,
				disabledFunction = IsJumpToStartButtonDisabled
			},
			properties = {
				hideHelpItemLabel = true
			}
		} )
		local f89_local4 = nil
		if f89_local3 then
			f89_local4 = Engine.ToUpper( Engine.Localize( "MENU_END_CLIP" ) )
		else
			f89_local4 = Engine.ToUpper( Engine.Localize( "MENU_END_FILM" ) )
		end
		table.insert( f89_local0, {
			models = {
				displayText = Engine.ToUpper( f89_local4 ),
				action = StartMenuEndDemo
			}
		} )
	elseif CoD.isCampaign then
		table.insert( f89_local0, {
			models = {
				displayText = "MENU_RESUMEGAME_CAPS",
				action = StartMenuGoBack_ListElement
			}
		} )
		local f89_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f89_arg0 ), "safehouse.inTrainingSim" ) or 0
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			if not CoD.isSafehouse and f89_arg0 == Engine.GetPrimaryController() then
				table.insert( f89_local0, {
					models = {
						displayText = "MENU_RESTART_MISSION_CAPS",
						action = RestartMission
					}
				} )
				if LUI.DEV ~= nil then
					table.insert( f89_local0, {
						models = {
							displayText = "MENU_RESTART_CHECKPOINT_CAPS",
							action = RestartFromCheckpoint
						}
					} )
				end
			end
			if f89_arg0 == Engine.GetPrimaryController() then
				table.insert( f89_local0, {
					models = {
						displayText = "MENU_CHANGE_DIFFICULTY_CAPS",
						action = OpenDifficultySelect
					}
				} )
			end
			if CoD.isSafehouse and f89_local1 == 1 then
				table.insert( f89_local0, {
					models = {
						displayText = "MENU_END_TRAINING_SIM",
						action = EndTrainingSim
					}
				} )
			elseif f89_arg0 == Engine.GetPrimaryController() then
				if Engine.DvarBool( 0, "ui_blocksaves" ) then
					table.insert( f89_local0, {
						models = {
							displayText = "MENU_EXIT_CAPS",
							action = SaveAndQuitGame
						}
					} )
				else
					table.insert( f89_local0, {
						models = {
							displayText = "MENU_SAVE_AND_QUIT_CAPS",
							action = SaveAndQuitGame
						}
					} )
				end
			end
		elseif CoD.isSafehouse and f89_local1 == 1 then
			table.insert( f89_local0, {
				models = {
					displayText = "MENU_END_TRAINING_SIM",
					action = EndTrainingSim
				}
			} )
		else
			table.insert( f89_local0, {
				models = {
					displayText = "MENU_LEAVE_PARTY_AND_EXIT_CAPS",
					action = QuitGame
				}
			} )
		end
	elseif CoD.isMultiplayer then
		if Engine.Team( f89_arg0, "name" ) ~= "TEAM_SPECTATOR" and Engine.GetGametypeSetting( "disableClassSelection" ) ~= 1 then
			table.insert( f89_local0, {
				models = {
					displayText = "MPUI_CHOOSE_CLASS_BUTTON_CAPS",
					action = ChooseClass
				}
			} )
		end
		if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == false and Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false and not Engine.IsVisibilityBitSet( f89_arg0, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and not Engine.IsVisibilityBitSet( f89_arg0, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and CoD.IsTeamChangeAllowed() then
			table.insert( f89_local0, {
				models = {
					displayText = "MPUI_CHANGE_TEAM_BUTTON_CAPS",
					action = ChooseTeam
				}
			} )
		end
		if f89_arg0 == 0 then
			local f89_local2 = "MENU_QUIT_GAME_CAPS"
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and not CoD.isOnlineGame() then
				f89_local2 = "MENU_END_GAME_CAPS"
			end
			table.insert( f89_local0, {
				models = {
					displayText = f89_local2,
					action = QuitGame_MP
				}
			} )
		end
	elseif CoD.isZombie then
		table.insert( f89_local0, {
			models = {
				displayText = "MENU_RESUMEGAME_CAPS",
				action = StartMenuGoBack_ListElement
			}
		} )
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and ((Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true) then
			table.insert( f89_local0, {
				models = {
					displayText = "MENU_RESTART_LEVEL_CAPS",
					action = RestartGame
				}
			} )
		end
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
			table.insert( f89_local0, {
				models = {
					displayText = "MENU_END_GAME_CAPS",
					action = QuitGame_MP
				}
			} )
		else
			table.insert( f89_local0, {
				models = {
					displayText = "MENU_QUIT_GAME_CAPS",
					action = QuitGame_MP
				}
			} )
		end
	end
	return f89_local0
end, true )
DataSources.PlatformControllerImage = {
	getModel = function ( f90_arg0 )
		local f90_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "PlatformControllerImage" )
		local f90_local1 = Engine.CreateModel( f90_local0, "image" )
		if CoD.isPC then
			Engine.SetModelValue( f90_local1, "t7_menu_startmenu_option_pc" )
		elseif CoD.isDurango then
			Engine.SetModelValue( f90_local1, "t7_menu_startmenu_option_xboxone" )
		else
			Engine.SetModelValue( f90_local1, "t7_menu_startmenu_option_ps4" )
		end
		return f90_local0
	end
}
DataSources.MissionObjectives = ListHelper_SetupDataSource( "MissionObjectives", function ( f91_arg0 )
	local f91_local0 = {}
	local f91_local1 = 20
	local f91_local2 = Engine.GetPlayerObjectives( f91_arg0 )
	if f91_local2 == nil then
		return 
	end
	local f91_local3 = {}
	local f91_local4 = 1
	for f91_local10, f91_local11 in CoD.pairsByKeys( f91_local2 ) do
		if f91_local11.status ~= "invisible" and f91_local11.objective_desc ~= nil and f91_local11.objective_desc ~= "" then
			if not f91_local3[f91_local11.objective_desc] then
				f91_local3[f91_local11.objective_desc] = {
					index = f91_local4,
					desc = f91_local11.objective_desc,
					complete = f91_local11.status == "done"
				}
				f91_local4 = f91_local4 + 1
			end
			local f91_local8 = f91_local3[f91_local11.objective_desc]
			local f91_local9 = f91_local3[f91_local11.objective_desc].complete
			if f91_local9 then
				f91_local9 = f91_local11.status == "done"
			end
			f91_local8.complete = f91_local9
			if f91_local11.subobjective_desc and f91_local11.status ~= "done" then
				f91_local8 = nil
				if f91_local11.subobjective_image and f91_local11.subobjective_image ~= "" then
					f91_local8 = f91_local11.subobjective_image
				end
				f91_local3[f91_local11.objective_desc].sub_objective = {
					desc = f91_local11.subobjective_desc,
					complete = f91_local11.status == "done",
					subobjective_image = f91_local8
				}
			end
		end
	end
	f91_local5 = function ( f92_arg0, f92_arg1 )
		if not f91_local3[f92_arg1].complete then
			return false
		elseif not f91_local3[f92_arg0].complete then
			return true
		else
			return f91_local3[f92_arg0].index < f91_local3[f92_arg1].index
		end
	end
	
	f91_local6 = function ( f93_arg0, f93_arg1, f93_arg2, f93_arg3 )
		return {
			models = {
				objective = f93_arg0.desc,
				subobjective_image = f93_arg0.subobjective_image or "blacktransparent"
			},
			properties = {
				completed = f93_arg0.complete,
				subobjective = f93_arg1,
				awaitingOrders = f93_arg2,
				spacer = f93_arg3
			}
		}
	end
	
	f91_local7 = function ( f94_arg0 )
		return f91_local6( {
			desc = "CPUI_AWAITING_UPDATE"
		}, f94_arg0, true, f91_local1 )
	end
	
	f91_local10 = false
	for f91_local12, f91_local13 in LUI.IterateTableBySortedKeys( f91_local3, f91_local5 ) do
		table.insert( f91_local0, f91_local6( f91_local13 ) )
		if not f91_local13.complete then
			f91_local10 = true
			if f91_local13.sub_objective then
				table.insert( f91_local0, f91_local6( f91_local13.sub_objective, true, nil, f91_local1 ) )
			else
				table.insert( f91_local0, f91_local7( true ) )
			end
		end
	end
	if not f91_local10 then
		table.insert( f91_local0, 1, f91_local7( false ) )
	end
	return f91_local0
end, true, nil, nil, function ( f95_arg0, f95_arg1, f95_arg2 )
	if f95_arg0[f95_arg0.customDataSourceHelper] then
		return f95_arg0[f95_arg0.customDataSourceHelper][f95_arg1].properties.spacer
	else
		
	end
end )
DataSources.OptionsTabSelectionList = {
	prepare = function ( f96_arg0, f96_arg1, f96_arg2 )
		f96_arg1.options = {}
		local f96_local0 = {
			{
				optionDisplay = "OPEN OPTIONS MENU",
				action = OpenOptionsMenu
			}
		}
		local f96_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "OptionsTabSelectionList" )
		for f96_local5, f96_local6 in ipairs( f96_local0 ) do
			local f96_local7 = Engine.CreateModel( f96_local1, "buttonModel_" .. f96_local5 )
			f96_arg1.options[f96_local5] = f96_local7
			Engine.SetModelValue( Engine.CreateModel( f96_local7, "displayText" ), Engine.Localize( f96_local6.optionDisplay ) )
			Engine.SetModelValue( Engine.CreateModel( f96_local7, "action" ), f96_local6.action )
		end
	end,
	getCount = function ( f97_arg0 )
		return #f97_arg0.options
	end,
	getItem = function ( f98_arg0, f98_arg1, f98_arg2 )
		return f98_arg1.options[f98_arg2]
	end
}
DataSources.StartMenuSelectionList = {
	prepare = function ( f99_arg0, f99_arg1, f99_arg2 )
		f99_arg1.options = {}
		local f99_local0 = nil
		if CoD.isCampaign == true then
			if LUI.DEV ~= nil then
				f99_local0 = {
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
				f99_local0 = {
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
			f99_local0 = {
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
		if not f99_local0 then
			return 
		end
		local f99_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "StartMenuSelectionModel" )
		for f99_local5, f99_local6 in ipairs( f99_local0 ) do
			local f99_local7 = Engine.CreateModel( f99_local1, "buttonModel_" .. f99_local5 )
			f99_arg1.options[f99_local5] = f99_local7
			Engine.SetModelValue( Engine.CreateModel( f99_local7, "displayText" ), Engine.Localize( f99_local6.optionDisplay ) )
			Engine.SetModelValue( Engine.CreateModel( f99_local7, "action" ), f99_local6.action )
		end
	end,
	getCount = function ( f100_arg0 )
		return #f100_arg0.options
	end,
	getItem = function ( f101_arg0, f101_arg1, f101_arg2 )
		return f101_arg1.options[f101_arg2]
	end
}
DataSources.StorageGlobal = {
	getModel = function ( f102_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "storageGlobalRoot" )
	end
}
DataSources.LobbyRoot = {
	getModel = function ( f103_arg0 )
		local f103_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		Engine.CreateModel( f103_local0, "leaderActivity" )
		if not Engine.GetModel( f103_local0, "lobbyStatusString1" ) then
			Engine.SetModelValue( Engine.CreateModel( f103_local0, "lobbyStatusString1" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f103_local0, "lobbyStatusString2" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f103_local0, "lobbyStatusString3" ), "" )
		end
		return f103_local0
	end
}
DataSources.LobbyPromptTitle = {
	getModel = function ( f104_arg0 )
		local f104_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPromptModel" )
		local f104_local1 = Engine.CreateModel( f104_local0, "lobbyPromptTitle" )
		local f104_local2 = Engine.CreateModel( f104_local0, "lobbyPromptDescription" )
		Engine.SetModelValue( f104_local1, CoD.LobbyBase.Prompt.Title )
		Engine.SetModelValue( f104_local2, CoD.LobbyBase.Prompt.Description )
		return f104_local0
	end
}
DataSources.LobbyPlaylistName = {
	getModel = function ( f105_arg0 )
		local f105_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
		local f105_local1 = Engine.CreateModel( f105_local0, "name" )
		local f105_local2 = Engine.CreateModel( f105_local0, "kickerText" )
		return f105_local0
	end
}
DataSources.LobbyPromptSelectionList = {
	prepare = function ( f106_arg0, f106_arg1, f106_arg2 )
		f106_arg1.options = {}
		local f106_local0 = CoD.LobbyBase.Prompt.Options
		local f106_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "LobbyPromptSelectionListModel" )
		for f106_local5, f106_local6 in ipairs( f106_local0 ) do
			local f106_local7 = Engine.CreateModel( f106_local1, "buttonModel_" .. f106_local5 )
			f106_arg1.options[f106_local5] = f106_local7
			Engine.SetModelValue( Engine.CreateModel( f106_local7, "displayText" ), Engine.Localize( f106_local6.optionDisplay ) )
			Engine.SetModelValue( Engine.CreateModel( f106_local7, "action" ), f106_local6.action )
			Engine.SetModelValue( Engine.CreateModel( f106_local7, "param" ), f106_local6.param )
			Engine.SetModelValue( Engine.CreateModel( f106_local7, "customId" ), f106_local6.customId )
		end
	end,
	getCount = function ( f107_arg0 )
		return #f107_arg0.options
	end,
	getItem = function ( f108_arg0, f108_arg1, f108_arg2 )
		return f108_arg1.options[f108_arg2]
	end
}
DataSources.ModalDialogData = {
	getModel = function ( f109_arg0 )
		local f109_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" )
		Engine.SetModelValue( Engine.CreateModel( f109_local0, "title" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Title ) )
		Engine.SetModelValue( Engine.CreateModel( f109_local0, "description" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Description ) )
		return f109_local0
	end
}
DataSources.ModalDialogDataList = {
	prepare = function ( f110_arg0, f110_arg1, f110_arg2 )
		f110_arg1.options = {}
		local f110_local0 = CoD.Menu.ModalDialogInfo.Options
		local f110_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" ), "list" )
		for f110_local5, f110_local6 in ipairs( f110_local0 ) do
			f110_arg1.options[f110_local5] = Engine.CreateModel( f110_local1, "buttonModel_" .. f110_local5 )
			Engine.SetModelValue( Engine.CreateModel( f110_arg1.options[f110_local5], "displayText" ), Engine.Localize( f110_local6 ) )
		end
	end,
	getCount = function ( f111_arg0 )
		return #f111_arg0.options
	end,
	getItem = function ( f112_arg0, f112_arg1, f112_arg2 )
		return f112_arg1.options[f112_arg2]
	end
}
DataSources.SideModalDialogDataList = {
	prepare = function ( f113_arg0, f113_arg1, f113_arg2 )
		f113_arg1.options = {}
		local f113_local0 = CoD.Menu.ModalDialogInfo.Options
		local f113_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" ), "list" )
		for f113_local5, f113_local6 in ipairs( f113_local0 ) do
			f113_arg1.options[f113_local5] = Engine.CreateModel( f113_local1, "buttonModel_" .. f113_local5 )
			Engine.SetModelValue( Engine.CreateModel( f113_arg1.options[f113_local5], "displayText" ), Engine.Localize( f113_local6.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f113_arg1.options[f113_local5], "displayImage" ), f113_local6.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f113_arg1.options[f113_local5], "displayDesc" ), Engine.Localize( f113_local6.displayDesc ) )
		end
	end,
	getCount = function ( f114_arg0 )
		return #f114_arg0.options
	end,
	getItem = function ( f115_arg0, f115_arg1, f115_arg2 )
		return f115_arg1.options[f115_arg2]
	end
}
DataSources.PartyPrivacy = {
	getModel = function ( f116_arg0 )
		Dvar.partyPrivacyEnabled:set( true )
		local f116_local0 = Engine.GetPartyPrivacy()
		local f116_local1 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			f116_local1 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
		end
		local f116_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
		Engine.SetModelValue( Engine.CreateModel( f116_local2, "privacy" ), f116_local0 )
		Engine.SetModelValue( Engine.CreateModel( f116_local2, "privacyStatus" ), PartyPrivacy( f116_local0 ) )
		Engine.SetModelValue( Engine.CreateModel( f116_local2, "maxPlayers" ), f116_local1 )
		return f116_local2
	end
}
DataSources.MapVote = {
	getModel = function ( f117_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
	end
}
DataSources.LobbyFriendsAndGroups = {
	updateOnlineCount = function ( f118_arg0, f118_arg1, f118_arg2 )
		local f118_local0 = Engine.GetModelValue( f118_arg1.friendsCountUIModel )
		local f118_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyFriends" )
		Engine.SetModelValue( Engine.CreateModel( f118_local1, "onlineCount" ), f118_local0 )
		Engine.SetModelValue( Engine.CreateModel( f118_local1, "moreCount" ), f118_local0 )
		DataSources.LobbyFriendsAndGroups.onlineFriendsCount = f118_local0
	end,
	prepare = function ( f119_arg0, f119_arg1, f119_arg2 )
		local f119_local0 = 0
		if CoD.isModeSelected == true then
			f119_local0 = 1
		end
		f119_arg1.listItems = {}
		if f119_arg1.countSubscription then
			f119_arg1:removeSubscription( f119_arg1.countSubscription )
		end
		if f119_arg1.lobbyListCountSubscription then
			f119_arg1:removeSubscription( f119_arg1.lobbyListCountSubscription )
		end
		local f119_local1 = {}
		f119_arg1.friendsUIModel = CoD.Friends.GetRootUIModel( f119_arg0 )
		f119_arg1.friendsCountUIModel = CoD.Friends.GetCountUIModel( f119_arg0 )
		if f119_arg1.friendsListCountSubscription then
			f119_arg1:removeSubscription( f119_arg1.friendsListCountSubscription )
		end
		f119_arg1.friendsListCountSubscription = f119_arg1:subscribeToModel( CoD.Friends.GetCountUIModel( f119_arg0 ), function ( model )
			DataSources.LobbyFriendsAndGroups.updateOnlineCount( f119_arg0, f119_arg1, f119_arg2 )
			f119_arg1:updateDataSource()
		end, false )
		if f119_arg1.friendsUpdateSubscription then
			f119_arg1:removeSubscription( f119_arg1.friendsUpdateSubscription )
		end
		local f119_local2 = CoD.Friends.GetUpdateUIModel( f119_arg0 )
		if f119_local2 ~= nil then
			f119_arg1.friendsUpdateSubscription = f119_arg1:subscribeToModel( f119_local2, function ( model )
				f119_arg1:updateDataSource()
			end, false )
		end
		DataSources.LobbyFriendsAndGroups.updateOnlineCount( f119_arg0, f119_arg1, f119_arg2 )
		local f119_local3 = Engine.GetModelValue( f119_arg1.friendsCountUIModel )
		for f119_local4 = 1, f119_local3, 1 do
			local f119_local7 = CoD.Friends.GetItemUIModel( f119_arg1.friendsUIModel, f119_local4 )
			local f119_local8 = Engine.GetModelValue( Engine.GetModel( f119_local7, "hasRank" ) )
			CoD.Friends.GetCount( f119_arg0 )
			if f119_local8 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f119_local7, "rankShown" ), f119_local0 )
			else
				Engine.SetModelValue( Engine.CreateModel( f119_local7, "rankShown" ), 0 )
			end
			Engine.SetModelValue( Engine.CreateModel( f119_local7, "activity" ), Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY )
			Engine.SetModelValue( Engine.CreateModel( f119_local7, "activityString" ), Engine.Localize( CoD.Presence.ActivityStrings[Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY] ) )
			table.insert( f119_local1, {
				model = f119_local7,
				isFriendItem = true,
				xuid = Engine.GetModelValue( Engine.GetModel( f119_local7, "xuid" ) )
			} )
		end
		local f119_local4 = {}
		local f119_local5 = Engine.GetModel( Engine.GetGlobalModel(), "unifiedGroupMembersListRoot" )
		if f119_local5 ~= nil then
			f119_arg1.groupMembersUIModel = f119_local5
			f119_arg1.groupMembersCountUIModel = Engine.GetModel( f119_arg1.groupMembersUIModel, "count" )
			if f119_arg1.groupsListCountSubscription then
				f119_arg1:removeSubscription( f119_arg1.groupsListCountSubscription )
			end
			f119_arg1.groupsListCountSubscription = f119_arg1:subscribeToModel( f119_arg1.groupMembersCountUIModel, function ( model )
				DataSources.LobbyFriendsAndGroups.updateOnlineCount( f119_arg0, f119_arg1, f119_arg2 )
				f119_arg1:updateDataSource()
			end, false )
			DataSources.LobbyFriendsAndGroups.updateOnlineCount( f119_arg0, f119_arg1, f119_arg2 )
			local f119_local6 = Engine.GetModelValue( f119_arg1.groupMembersCountUIModel )
			for f119_local9 = 1, f119_local6, 1 do
				local f119_local10 = Engine.GetModel( f119_arg1.groupMembersUIModel, "member" .. f119_local9 - 1 )
				local f119_local11 = Engine.GetModelValue( Engine.GetModel( f119_local10, "hasRank" ) )
				local f119_local12 = Engine.GetModelValue( Engine.GetModel( f119_local10, "xuid" ) )
				local f119_local13 = false
				for f119_local14 = 1, #f119_local1, 1 do
					if Engine.GetModelValue( Engine.GetModel( f119_local1[f119_local14].model, "xuid" ) ) == f119_local12 then
						f119_local13 = true
						break
					end
				end
				if not f119_local13 then
					if f119_local11 == 1 then
						Engine.SetModelValue( Engine.CreateModel( f119_local10, "rankShown" ), f119_local0 )
					else
						Engine.SetModelValue( Engine.CreateModel( f119_local10, "rankShown" ), 0 )
					end
					Engine.SetModelValue( Engine.CreateModel( f119_local10, "isJoinable" ), 0 )
					table.insert( f119_local4, {
						model = f119_local10,
						isGroupsItem = true,
						xuid = f119_local12
					} )
				end
			end
		end
		f119_local6 = #f119_local4
		for f119_local17, f119_local10 in ipairs( f119_local1 ) do
			table.insert( f119_arg1.listItems, f119_local10 )
		end
		for f119_local17, f119_local10 in ipairs( f119_local4 ) do
			table.insert( f119_arg1.listItems, f119_local10 )
		end
	end,
	getCount = function ( f123_arg0 )
		return #f123_arg0.listItems
	end,
	getItem = function ( f124_arg0, f124_arg1, f124_arg2 )
		return f124_arg1.listItems[f124_arg2].model
	end,
	getCustomPropertiesForItem = function ( f125_arg0, f125_arg1 )
		return f125_arg0.listItems[f125_arg1]
	end
}
DataSources.LobbyQuickJoin = {
	updateCounts = function ( f126_arg0, f126_arg1, f126_arg2 )
		local f126_local0 = Engine.GetQuickJoinPlayersCount( f126_arg0, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
		local f126_local1 = #f126_arg1.players
		local f126_local2 = f126_local0 - f126_local1
		local f126_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyFriends" )
		Engine.SetModelValue( Engine.CreateModel( f126_local3, "onlineCount" ), f126_local0 )
		Engine.SetModelValue( f126_arg1.countModel, f126_local0 )
		Engine.SetModelValue( f126_arg1.visibleCountModel, f126_local1 )
		Engine.SetModelValue( Engine.CreateModel( f126_local3, "moreCount" ), f126_local2 )
	end,
	prepare = function ( f127_arg0, f127_arg1, f127_arg2 )
		local f127_local0 = 0
		if CoD.isModeSelected == true then
			f127_local0 = 1
		end
		f127_arg1.listItems = {}
		if f127_arg1.countSubscription then
			f127_arg1:removeSubscription( f127_arg1.countSubscription )
		end
		if f127_arg1.lobbyListCountSubscription then
			f127_arg1:removeSubscription( f127_arg1.lobbyListCountSubscription )
		end
		f127_arg1.lobbyClientListCountModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.clientList.count" )
		if f127_arg1.lobbyClientListCountModel ~= nil then
			f127_arg1.lobbyClientListCount = Engine.GetModelValue( f127_arg1.lobbyClientListCountModel )
			if f127_arg1.lobbyClientListCount == 0 then
				f127_arg1.lobbyClientListCount = 1
			end
		else
			f127_arg1.lobbyClientListCount = 1
		end
		f127_arg1.maxElementsInList = Engine.DvarInt( nil, "live_social_quickjoin_count" )
		f127_arg1.socialSubModel = Engine.CreateModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "quickJoin" )
		f127_arg1.countModel = Engine.CreateModel( f127_arg1.socialSubModel, "count" )
		f127_arg1.visibleCountModel = Engine.CreateModel( f127_arg1.socialSubModel, "visibleCount" )
		f127_arg1.players = {}
		local f127_local1 = CoD.SocialUtility.GetEmptyPlayerInfo()
		for f127_local2 = 1, f127_arg1.maxElementsInList, 1 do
			f127_arg1.players[f127_local2] = {}
			f127_arg1.players[f127_local2].root = Engine.CreateModel( f127_arg1.socialSubModel, "player_" .. f127_local2 )
			f127_arg1.players[f127_local2].model = Engine.CreateModel( f127_arg1.players[f127_local2].root, "model" )
			CoD.SocialUtility.SetDefaultPlayerProperties( f127_arg1.players[f127_local2] )
			local f127_local5 = nil
			for f127_local9, f127_local10 in pairs( f127_local1 ) do
				f127_local5 = Engine.CreateModel( f127_arg1.players[f127_local2].model, f127_local9 )
			end
			f127_local5 = Engine.CreateModel( f127_arg1.players[f127_local2].model, "clanTagAndGamertag" )
			f127_local5 = Engine.CreateModel( f127_arg1.players[f127_local2].model, "rank" )
			f127_local5 = Engine.CreateModel( f127_arg1.players[f127_local2].model, "rankIcon" )
			f127_local5 = Engine.CreateModel( f127_arg1.players[f127_local2].model, "rankString" )
			f127_local5 = Engine.CreateModel( f127_arg1.players[f127_local2].model, "isJoinable" )
		end
		if f127_arg1.lobbyClientListCount > 13 then
			f127_arg1.numFreeSlotsInList = 0
		else
			f127_arg1.numFreeSlotsInList = 16 - f127_arg1.lobbyClientListCount
		end
		DataSources.LobbyQuickJoin.updateCounts( f127_arg0, f127_arg1, f127_arg2 )
		f127_arg1.numPlayers = CoD.SocialUtility.UpdateModelsHelper( f127_arg0, f127_arg1, 0, f127_arg1.numFreeSlotsInList, f127_arg1.maxElementsInList, {
			filter = Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE
		}, Engine.GetQuickJoinPlayers, Engine.GetQuickJoinPlayersPartyInfo )
		for f127_local2 = 1, #f127_arg1.players, 1 do
			local f127_local5 = Engine.GetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "mpRank" ) )
			Engine.SetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "rank" ), f127_local5 )
			Engine.SetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "rankIcon" ), Engine.GetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "mpRankIcon" ) ) )
			if f127_local5 then
				Engine.SetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "rankString" ), CoD.GetRankName( math.max( 0, f127_local5 - 1 ), Engine.GetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "mpPrestige" ) ), Enum.eModes.MODE_MULTIPLAYER ) )
			end
			Engine.SetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "clanTagAndGamertag" ), Engine.GetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "fullname" ) ) )
			Engine.SetModelValue( Engine.CreateModel( f127_arg1.players[f127_local2].model, "partyActivityString" ), GetPresencePartyActivityString( Engine.GetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "activity" ) ), Engine.GetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "partySize" ) ) ) )
			local f127_local11 = Engine.GetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "joinable" ) )
			local f127_local12 = 0
			if f127_local11 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or f127_local11 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
				f127_local12 = 1
			end
			if f127_local12 == 1 and f127_arg1.players[f127_local2].properties.mapid then
				local f127_local13 = CoD.GetMapIDFromMapUniqueID( f127_arg1.players[f127_local2].properties.mapid )
				if f127_local13 then
					local f127_local14 = Engine.GetDLCBitForMapName( f127_local13 )
					local f127_local15 = Engine.GetDLCBits()
					if IsDvarValueEqualTo( "ui_freeDLC1", "1" ) then
						f127_local15 = f127_local15 | Enum.ContentFlagBits.CONTENT_DLC1
					end
					if not CoD.BitUtility.IsBitwiseAndNonZero( f127_local14, f127_local15 ) then
						f127_local12 = 0
					end
				end
			end
			Engine.SetModelValue( Engine.GetModel( f127_arg1.players[f127_local2].model, "isJoinable" ), f127_local12 )
			Engine.SetModelValue( Engine.CreateModel( f127_arg1.players[f127_local2].model, "quickjoinListMember" ), true )
		end
		if f127_arg1.lobbyClientListCountSubscription then
			f127_arg1:removeSubscription( f127_arg1.lobbyClientListCountSubscription )
		end
		f127_arg1.lobbyClientListCountSubscription = f127_arg1:subscribeToModel( f127_arg1.lobbyClientListCountModel, function ()
			DataSources.LobbyQuickJoin.updateCounts( f127_arg0, f127_arg1, f127_arg2 )
			f127_arg1:updateDataSource( nil, true )
			local f128_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			for f128_local5, f128_local6 in ipairs( f128_local0.sessionClients ) do
				for f128_local4 = 1, #f127_arg1.players, 1 do
					if Engine.GetModelValue( Engine.GetModel( f127_arg1.players[f128_local4].model, "xuid" ) ) == f128_local6.xuid then
						if Engine.OnlineSetInternalEvent ~= nil then
							Engine.OnlineSetInternalEvent( 0, Enum.LiveInternalEvent.LIVE_INTERNAL_EVENT_QUICKJOIN_PRESENCE_UPDATED )
						end
					end
				end
			end
		end, false )
		local f127_local2 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.friends.update" )
		if f127_arg1.socialFriendsUpdateSubscription then
			f127_arg1:removeSubscription( f127_arg1.socialFriendsUpdateSubscription )
		end
		f127_arg1.socialFriendsUpdateSubscription = f127_arg1:subscribeToModel( f127_local2, function ()
			DataSources.LobbyQuickJoin.updateCounts( f127_arg0, f127_arg1, f127_arg2 )
			f127_arg1:updateDataSource( nil, true )
		end, false )
		local f127_local3 = Engine.CreateModel( Engine.GetModelForController( f127_arg0 ), "groups.quickJoinMembersUpdate", true )
		if f127_arg1.socialGroupsUpdateSubscription then
			f127_arg1:removeSubscription( f127_arg1.socialGroupsUpdateSubscription )
		end
		f127_arg1.socialGroupsUpdateSubscription = f127_arg1:subscribeToModel( f127_local3, function ()
			DataSources.LobbyQuickJoin.updateCounts( f127_arg0, f127_arg1, f127_arg2 )
			f127_arg1:updateDataSource()
		end, false )
		local f127_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot.quickjoin.update" )
		if f127_arg1.socialQuickjoinUpdateSubscription then
			f127_arg1:removeSubscription( f127_arg1.socialQuickjoinUpdateSubscription )
		end
		f127_arg1.socialQuickjoinUpdateSubscription = f127_arg1:subscribeToModel( f127_local4, function ()
			DataSources.LobbyQuickJoin.updateCounts( f127_arg0, f127_arg1, f127_arg2 )
			f127_arg1:updateDataSource( nil, true )
		end, false )
	end,
	getCount = function ( f132_arg0 )
		return math.min( f132_arg0.maxElementsInList, f132_arg0.numPlayers )
	end,
	getItem = function ( f133_arg0, f133_arg1, f133_arg2 )
		return f133_arg1.players[f133_arg2].model
	end,
	getCustomPropertiesForItem = function ( f134_arg0, f134_arg1 )
		return f134_arg0.players[f134_arg1].properties
	end
}
DataSources.LobbyList = {
	prepare = function ( f135_arg0, f135_arg1, f135_arg2 )
		f135_arg1.clientListModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
		f135_arg1.lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		if f135_arg1.gameClientUpdateSubscription then
			f135_arg1:removeSubscription( f135_arg1.gameClientUpdateSubscription )
		end
		f135_arg1.gameClientUpdateSubscription = f135_arg1:subscribeToModel( Engine.GetModel( f135_arg1.lobbyRootModel, "gameClient.update" ), function ()
			CoD.LobbyUtility.UpdateLobbyList( f135_arg1 )
			f135_arg1:setVerticalCount( Engine.GetModelValue( Engine.CreateModel( f135_arg1.clientListModel, "count" ) ), true )
		end, false )
		if f135_arg1.privateClientUpdateSubscription then
			f135_arg1:removeSubscription( f135_arg1.privateClientUpdateSubscription )
		end
		f135_arg1.privateClientUpdateSubscription = f135_arg1:subscribeToModel( Engine.GetModel( f135_arg1.lobbyRootModel, "privateClient.update" ), function ()
			CoD.LobbyUtility.UpdateLobbyList( f135_arg1 )
			f135_arg1:setVerticalCount( Engine.GetModelValue( Engine.CreateModel( f135_arg1.clientListModel, "count" ) ), true )
		end, false )
		if f135_arg1.lobbyNavSubscription then
			f135_arg1:removeSubscription( f135_arg1.lobbyNavSubscription )
		end
		f135_arg1.lobbyNavSubscription = f135_arg1:subscribeToModel( Engine.GetModel( f135_arg1.lobbyRootModel, "lobbyNav" ), function ()
			CoD.LobbyUtility.UpdateLobbyList( f135_arg1 )
			f135_arg1:setVerticalCount( Engine.GetModelValue( Engine.CreateModel( f135_arg1.clientListModel, "count" ) ) )
		end, false )
		CoD.LobbyUtility.UpdateLobbyList( f135_arg1 )
	end,
	getCount = function ( f139_arg0 )
		return Engine.GetModelValue( Engine.CreateModel( f139_arg0.clientListModel, "count" ) )
	end,
	getItem = function ( f140_arg0, f140_arg1, f140_arg2 )
		return Engine.GetModel( f140_arg1.clientListModel, f140_arg2 )
	end
}
DataSources.LobbyPrivateHostMembers = {
	prepare = function ( f141_arg0, f141_arg1, f141_arg2 )
		f141_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "privateHost" )
		f141_arg1.countModel = Engine.GetModel( f141_arg1.baseModel, "count" )
		f141_arg1.updateModel = Engine.GetModel( f141_arg1.baseModel, "update" )
		if f141_arg1.countSubscription then
			f141_arg1:removeSubscription( f141_arg1.countSubscription )
		end
		f141_arg1.countSubscription = f141_arg1:subscribeToModel( f141_arg1.countModel, function ()
			f141_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f143_arg0 )
		return Engine.GetModelValue( f143_arg0.countModel )
	end,
	getItem = function ( f144_arg0, f144_arg1, f144_arg2 )
		return Engine.GetModel( f144_arg1.baseModel, "member" .. f144_arg2 - 1 )
	end
}
DataSources.LobbyGameHostMembers = {
	prepare = function ( f145_arg0, f145_arg1, f145_arg2 )
		f145_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "gameHost" )
		f145_arg1.countModel = Engine.GetModel( f145_arg1.baseModel, "count" )
		f145_arg1.updateModel = Engine.GetModel( f145_arg1.baseModel, "update" )
		if f145_arg1.countSubscription then
			f145_arg1:removeSubscription( f145_arg1.countSubscription )
		end
		f145_arg1.countSubscription = f145_arg1:subscribeToModel( f145_arg1.countModel, function ()
			f145_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f147_arg0 )
		return Engine.GetModelValue( f147_arg0.countModel )
	end,
	getItem = function ( f148_arg0, f148_arg1, f148_arg2 )
		return Engine.GetModel( f148_arg1.baseModel, "member" .. f148_arg2 - 1 )
	end
}
DataSources.LobbyButtons = ListHelper_SetupDataSource( "LobbyButtons", function ( f149_arg0 )
	local f149_local0 = {}
	local f149_local1 = CoD.LobbyMenus.AddButtonsForTarget( f149_arg0, Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyNav" ) ) )
	CoD.perController[f149_arg0].updateNewBreadcrumbs = false
	local f149_local2 = false
	for f149_local6, f149_local7 in ipairs( f149_local1 ) do
		table.insert( f149_local0, {
			models = {
				displayText = Engine.Localize( f149_local7.optionDisplay ),
				customId = f149_local7.customId,
				warning = f149_local7.warning
			},
			properties = {
				disabled = f149_local7.disabled,
				action = f149_local7.action,
				actionParam = f149_local7.param,
				isLastButtonInGroup = f149_local7.isLastButtonInGroup,
				selectIndex = f149_local7.selected,
				isBreadcrumbNew = f149_local7.isBreadcrumbNew,
				requiredChunk = f149_local7.requiredChunk,
				starterPackUpgrade = f149_local7.starterPackUpgrade,
				unloadMod = f149_local7.unloadMod
			}
		} )
	end
	if #f149_local0 <= 0 then
		table.insert( f149_local0, {
			models = {
				displayText = ""
			},
			properties = {
				disabled = false,
				fake = true
			}
		} )
	end
	return f149_local0
end, nil, nil, function ( f150_arg0, f150_arg1, f150_arg2 )
	local f150_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyNav" )
	if f150_arg1.lobbyNavSubscription then
		f150_arg1:removeSubscription( f150_arg1.lobbyNavSubscription )
	end
	f150_arg1.lobbyNavSubscription = f150_arg1:subscribeToModel( f150_local0, function ()
		f150_arg1:clearSavedActiveIndex()
		f150_arg1:clearSavedState()
		f150_arg1:updateDataSource( true, false )
		if f150_arg1 then
			if f150_arg1:getParent() then
				local f151_local0 = f150_arg1:getParent()
				if f151_local0:getParent() then
					f151_local0 = f150_arg1:getParent()
					f151_local0 = f151_local0:getParent()
					if f151_local0:getParent() then
						f151_local0 = IsMenuInState
						local f151_local1 = f150_arg1:getParent()
						f151_local1 = f151_local1:getParent()
						if not f151_local0( f151_local1:getParent(), "Right" ) then
						
						else
							
						end
					end
				end
			end
			f150_arg1:processEvent( {
				name = "gain_focus",
				controller = f150_arg0
			} )
		end
	end, false )
	local f150_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
	if f150_arg1.networkModeSub then
		f150_arg1:removeSubscription( f150_arg1.networkModeSub )
	end
	f150_arg1.networkModeSub = f150_arg1:subscribeToModel( f150_local1, function ()
		f150_arg1:updateDataSource()
	end, false )
	local f150_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if f150_arg1.timerActiveSubscription then
		f150_arg1:removeSubscription( f150_arg1.timerActiveSubscription )
	end
	f150_arg1.timerActiveSubscription = f150_arg1:subscribeToModel( f150_local2, function ()
		f150_arg1:updateDataSource()
	end, false )
	local f150_local3 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	if f150_arg1.gameClientUpdateSubscription then
		f150_arg1:removeSubscription( f150_arg1.gameClientUpdateSubscription )
	end
	f150_arg1.gameClientUpdateSubscription = f150_arg1:subscribeToModel( f150_local3, function ()
		f150_arg1:updateDataSource( nil, true, true )
	end, false )
	local f150_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.isHost" )
	if f150_arg1.lobbyHostSub then
		f150_arg1:removeSubscription( f150_arg1.lobbyHostSub )
	end
	f150_arg1.lobbyHostSub = f150_arg1:subscribeToModel( f150_local4, function ()
		f150_arg1:updateDataSource()
	end, false )
	local f150_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.isHost" )
	if f150_arg1.lobbyGameHostSub then
		f150_arg1:removeSubscription( f150_arg1.lobbyGameHostSub )
	end
	f150_arg1.lobbyGameHostSub = f150_arg1:subscribeToModel( f150_local5, function ()
		f150_arg1:updateDataSource()
	end, false )
	local f150_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" )
	if f150_arg1.theaterDataDownloadedSub then
		f150_arg1:removeSubscription( f150_arg1.theaterDataDownloadedSub )
	end
	f150_arg1.theaterDataDownloadedSub = f150_arg1:subscribeToModel( f150_local6, function ()
		f150_arg1:updateDataSource()
	end, false )
	local f150_local7 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
	if f150_arg1.mapChangedSub then
		f150_arg1:removeSubscription( f150_arg1.mapChangedSub )
	end
	f150_arg1.mapChangedSub = f150_arg1:subscribeToModel( f150_local7, function ()
		CoD.LobbyUtility.UpdateMapInstallStatusLine( f150_arg1 )
		if Engine.IsCampaignGame() then
			f150_arg1:updateDataSource()
		end
	end, false )
	local f150_local8 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" )
	if f150_arg1.updateButtonsModelSub then
		f150_arg1:removeSubscription( f150_arg1.updateButtonsModelSub )
	end
	f150_arg1.wasCodCaster = false
	f150_arg1.oldTeamAssignment = 0
	f150_arg1.wasMissingMapTextShowing = false
	f150_arg1.updateButtonsModelSub = f150_arg1:subscribeToModel( f150_local8, function ()
		local f159_local0 = IsCodCaster( f150_arg0 )
		local f159_local1 = Engine.GetGametypeSetting( "teamAssignment" )
		local f159_local2 = false
		if f159_local0 ~= f150_arg1.wasCodCaster then
			f150_arg1.wasCodCaster = f159_local0
			f159_local2 = true
		end
		if f150_arg1.oldTeamAssignment ~= f159_local1 then
			f150_arg1.oldTeamAssignment = f159_local1
			f159_local2 = true
		end
		if CoD.perController[f150_arg0].updateNewBreadcrumbs == true then
			CoD.perController[f150_arg0].updateNewBreadcrumbs = false
			f159_local2 = true
		end
		if CoD.isZombie == true then
			local f159_local3 = LobbyData.GetLobbyNav()
			if f159_local3 == LobbyData.UITargets.UI_ZMLOBBYONLINE.id or f159_local3 == LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
				f159_local2 = true
			end
		end
		if CoD.perController[f150_arg0].gamesettingsUpdated == true then
			CoD.perController[f150_arg0].gamesettingsUpdated = false
			f159_local2 = true
		end
		if CoD.perController[f150_arg0].localClientChanged == true then
			CoD.perController[f150_arg0].localClientChanged = false
			f159_local2 = true
		end
		if f150_arg1.wasMissingMapTextShowing ~= CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing() then
			f150_arg1.wasMissingMapTextShowing = CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing()
			f159_local2 = true
		end
		if f159_local2 then
			f150_arg1:updateDataSource()
		end
	end, false )
end, function ( f160_arg0, f160_arg1, f160_arg2 )
	if f160_arg0.LobbyButtons[f160_arg1].properties.isLastButtonInGroup then
		return 9
	else
		
	end
end )
DataSources.SocialRoot = {
	getModel = function ( f161_arg0 )
		return Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
	end
}
DataSources.SocialPlayerInfo = {
	getModel = function ( f162_arg0 )
		local f162_local0 = Engine.GetModelForController( f162_arg0 )
		local f162_local1 = Engine.CreateModel( f162_local0, "socialPlayerInfo" )
		local f162_local2 = Engine.CreateModel( f162_local1, "identityBadge" )
		local f162_local3 = Engine.GetModelValue( Engine.CreateModel( f162_local0, "Social.selectedFriendXUID" ), "xuid" )
		local f162_local4 = Engine.GetModelValue( Engine.CreateModel( f162_local0, "Social.selectedFriendGamertag" ) )
		if f162_local3 ~= nil then
			local f162_local5 = Engine.GetPlayerInfo( f162_arg0, f162_local3 )
			if f162_local5 ~= nil then
				local f162_local6 = true
				local f162_local7 = true
				local f162_local8 = true
				local f162_local9 = CoD.SocialUtility.GetRankIcons( "cp", f162_local6, f162_local5.info.cp.rank, f162_local5.info.cp.prestige )
				local f162_local10 = CoD.SocialUtility.GetRankIcons( "mp", f162_local7, f162_local5.info.mp.rank, f162_local5.info.mp.prestige )
				local f162_local11 = CoD.SocialUtility.GetRankIcons( "zm", f162_local8, f162_local5.info.zm.rank, f162_local5.info.zm.prestige )
				if f162_local5.info.gamertag == "" then
					f162_local5.info.gamertag = f162_local4
				end
				local f162_local12 = 0
				local f162_local13 = Engine.GetRankDisplayLevel( f162_local5.info.mp.rank, Enum.eModes.MODE_MULTIPLAYER )
				if f162_local5.info.mp.prestige == Engine.GetPrestigeCap( Enum.eModes.MODE_MULTIPLAYER ) then
					f162_local13 = Engine.GetParagonRankDisplayLevel( f162_local5.info.mp.paragonRank, Enum.eModes.MODE_MULTIPLAYER )
					if f162_local5.info.mp.paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
						f162_local10 = Engine.GetParagonIconById( f162_local5.info.mp.paragonIconId, Enum.eModes.MODE_MULTIPLAYER )
					end
					f162_local12 = math.floor( (f162_local5.info.mp.paragonRank + CoD.PrestigeUtility.GetMaxRankByMode( Enum.eModes.MODE_MULTIPLAYER ) + 2) / 100 )
				end
				local f162_local14 = 0
				local f162_local15 = Engine.GetRankDisplayLevel( f162_local5.info.zm.rank, Enum.eModes.MODE_ZOMBIES )
				if f162_local5.info.zm.prestige == Engine.GetPrestigeCap( Enum.eModes.MODE_ZOMBIES ) then
					f162_local15 = Engine.GetParagonRankDisplayLevel( f162_local5.info.zm.paragonRank, Enum.eModes.MODE_ZOMBIES )
					if f162_local5.info.zm.paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
						f162_local11 = Engine.GetParagonIconById( f162_local5.info.zm.paragonIconId, Enum.eModes.MODE_ZOMBIES )
					end
					f162_local14 = math.floor( (f162_local5.info.zm.paragonRank + CoD.PrestigeUtility.GetMaxRankByMode( Enum.eModes.MODE_ZOMBIES ) + 2) / 100 )
				end
				Engine.SetModelValue( Engine.CreateModel( f162_local2, "xuid" ), f162_local5.info.xuid )
				Engine.SetModelValue( Engine.CreateModel( f162_local2, "gamertag" ), f162_local5.info.gamertag )
				Engine.SetModelValue( Engine.CreateModel( f162_local2, "clantag" ), f162_local5.info.clantag )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "cpRank" ), f162_local5.info.cp.rank )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "cpRankIcon" ), f162_local9 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "cpPrestige" ), f162_local5.info.cp.prestige )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mpRank" ), tonumber( f162_local13 ) )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mpRankIcon" ), f162_local10 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mpPrestige" ), f162_local5.info.mp.prestige )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mpPrestigeMasterTier" ), f162_local12 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "zmRank" ), tonumber( f162_local15 ) )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "zmRankIcon" ), f162_local11 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "zmPrestige" ), f162_local5.info.zm.prestige )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "zmPrestigeMasterTier" ), f162_local14 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "emblemBacking" ), f162_local5.info.emblemBacking )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "presence" ), f162_local5.info.presence )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "joinable" ), f162_local5.info.joinable )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "inGameLobby" ), f162_local5.info.inGameLobby )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "inPrivateLobby" ), f162_local5.info.inPrivateLobby )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "isSelf" ), f162_local5.info.isSelf )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "isLocal" ), f162_local5.info.isLocal )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "primaryPresence" ), f162_local5.info.primaryPresence )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "titlePresence" ), f162_local5.info.titlePresence )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "platformPresence" ), f162_local5.info.platformPresence )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "activity" ), f162_local5.info.activity )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "activityString" ), GetPresenceActivityString( f162_local5.info ) )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "context" ), f162_local5.info.context )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "contextString" ), GetPresenceContextString( f162_local5.info ) )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "gametype" ), f162_local5.info.gametype )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mapid" ), f162_local5.info.mapid )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "difficulty" ), f162_local5.info.difficulty )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "playlist" ), f162_local5.info.playlist )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "isFriend" ), f162_local5.info.isFriend )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "primaryGroup" ), f162_local5.info.primaryGroup )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "primaryGroupString" ), GetPresencePrimaryGroupString( f162_local5.info ) )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "partySize" ), f162_local5.info.partySize )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "partyMax" ), f162_local5.info.partyMax )
			end
			if Engine.UInt64ToString( f162_local3 ) == "fefefefefefefefe" then
				local f162_local7 = 0
				local f162_local8 = 0
				local f162_local9 = CoD.SocialUtility.GetRankIcons( "cp", false, f162_local8, f162_local7 )
				local f162_local10 = 0
				local f162_local11 = 0
				local f162_local12 = CoD.SocialUtility.GetRankIcons( "mp", false, f162_local11, f162_local10 )
				local f162_local13 = 0
				local f162_local14 = 0
				local f162_local15 = CoD.SocialUtility.GetRankIcons( "zm", false, f162_local14, f162_local13 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "cpRank" ), f162_local8 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "cpRankIcon" ), f162_local9 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "cpPrestige" ), f162_local7 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mpRank" ), f162_local11 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mpRankIcon" ), f162_local12 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mpPrestige" ), f162_local10 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "mpPrestigeMasterTier" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "zmRank" ), f162_local14 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "zmRankIcon" ), f162_local15 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "zmPrestige" ), f162_local13 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "zmPrestigeMasterTier" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "gamertag" ), f162_local4 )
				Engine.SetModelValue( Engine.CreateModel( f162_local1, "clantag" ), "" )
			end
		end
		return f162_local1
	end
}
DataSources.PregameGlobal = {
	getModel = function ( f163_arg0 )
		local f163_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
		Engine.SetModelValue( Engine.CreateModel( f163_local0, "timeleft" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f163_local0, "status" ), "" )
		return f163_local0
	end
}
DataSources.Pregame = {
	getModel = function ( f164_arg0 )
		local f164_local0 = Engine.CreateModel( Engine.GetModelForController( f164_arg0 ), "Pregame" )
		Engine.SetModelValue( Engine.CreateModel( f164_local0, "remainingVotes" ), 0 )
		return f164_local0
	end
}
DataSources.PregameItemVoteTabs = ListHelper_SetupDataSource( "PregameItemVoteTabs", function ( f165_arg0 )
	local f165_local0 = {}
	local f165_local1 = CoD.CACUtility.PregameLoadoutFilters
	table.insert( f165_local0, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f165_local5, f165_local6 in pairs( f165_local1 ) do
		table.insert( f165_local0, {
			models = {
				tabName = f165_local6.title,
				index = f165_local5
			},
			properties = {}
		} )
	end
	table.insert( f165_local0, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f165_local0
end )
DataSources.PregameRestrictedItems = ListHelper_SetupDataSource( "PregameRestrictedItems", function ( f166_arg0 )
	if DataSources.PregameRestrictedItems.cachedItems ~= nil then
		return DataSources.PregameRestrictedItems.cachedItems
	end
	local f166_local0, f166_local1 = CoD.CACUtility.GetAllItems( true, true )
	local f166_local2 = function ( f167_arg0 )
		if f167_arg0 == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			return "MENU_RESTRICTED"
		elseif f167_arg0 == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY then
			return "MENU_BAN_ONLY"
		elseif f167_arg0 == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED then
			return "MENU_PROTECTED"
		else
			return ""
		end
	end
	
	local f166_local3 = {}
	for f166_local7, f166_local8 in pairs( f166_local1 ) do
		if #f166_local8.items > 0 then
			table.insert( f166_local3, {
				models = {
					itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT,
					attachmentIndex = f166_local8.index,
					restrictionState = f166_local8.restrictionState,
					hintText = f166_local2( f166_local8.restrictionState ),
					name = f166_local8.name,
					image = f166_local8.image,
					loadoutSlot = "attachment"
				}
			} )
		end
	end
	for f166_local7, f166_local8 in pairs( f166_local0 ) do
		if f166_local8.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
			if f166_local8.name == "WEAPON_KNIFE_LOADOUT" then
				table.insert( f166_local3, {
					models = {
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
						restrictionState = f166_local8.restrictionState,
						hintText = f166_local2( f166_local8.restrictionState ),
						itemIndex = f166_local8.index,
						name = "MENU_MELEE_WEAPONS",
						image = f166_local8.image,
						loadoutSlot = f166_local8.loadoutSlot,
						groupName = f166_local8.groupName
					},
					properties = {
						item = {
							index = f166_local8.index
						}
					}
				} )
			end
		end
		local f166_local9 = CoD.statsTable
		if f166_local9 then
			f166_local9 = CoD.CACUtility.GetIdForItemRef( f166_local8.index )
		end
		if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f166_local9 ) then
			table.insert( f166_local3, {
				models = {
					itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
					restrictionState = f166_local8.restrictionState,
					hintText = f166_local2( f166_local8.restrictionState ),
					itemIndex = f166_local8.index,
					name = f166_local8.name,
					image = f166_local8.image,
					loadoutSlot = f166_local8.loadoutSlot,
					groupName = f166_local8.groupName
				},
				properties = {
					item = {
						index = f166_local8.index
					}
				}
			} )
		end
	end
	DataSources.PregameRestrictedItems.cachedItems = f166_local3
	return f166_local3
end )
DataSources.PregameItemVotes = ListHelper_SetupDataSource( "PregameItemVotes", function ( f168_arg0 )
	if Engine.GetLobbyPregameState() ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE then
		return {}
	end
	local f168_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	table.sort( f168_local0.sessionClients, function ( f169_arg0, f169_arg1 )
		return f169_arg0.pregamePosition < f169_arg1.pregamePosition
	end )
	local f168_local1 = {}
	for f168_local9, f168_local10 in ipairs( Engine.GetPregameItemVotes() ) do
		local f168_local6 = ""
		local f168_local7 = ""
		local f168_local8 = ""
		if f168_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local f168_local5 = Engine.GetUnlockableInfoByIndex( f168_local10.itemIndex )
			f168_local6 = f168_local5.name
			f168_local7 = f168_local5.image
			if f168_local5.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
				f168_local6 = "MENU_MELEE_WEAPONS"
			end
			if LuaUtils.StartsWith( f168_local5.loadoutSlot, "hero" ) or f168_local5.loadoutSlot == "specialgadget" then
				f168_local7 = f168_local5.image
			end
			if LuaUtils.StartsWith( f168_local5.loadoutSlot, "killstreak" ) then
				f168_local7 = f168_local5.image .. "_menu"
			end
		elseif f168_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			f168_local6 = Engine.GetAttachmentNameByIndex( f168_local10.attachmentIndex )
			f168_local7 = Engine.GetAttachmentImageByIndex( f168_local10.attachmentIndex )
		elseif f168_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			f168_local6 = Engine.GetAttachmentNameByIndex( f168_local10.attachmentIndex )
			f168_local7 = Engine.GetAttachmentImageByIndex( f168_local10.attachmentIndex )
			local f168_local5 = Engine.GetUnlockableInfoByIndex( f168_local10.itemIndex )
			f168_local8 = f168_local5.name
		elseif f168_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			f168_local8 = itemInfo.group
		else
			error( "Item vote updated with invalid vote type" )
		end
		table.insert( f168_local1, {
			models = {
				name = f168_local6,
				image = f168_local7,
				headerName = f168_local8,
				hintText = f168_local10.gamertag,
				intData = f168_local10.team,
				itemType = f168_local10.itemType,
				itemIndex = f168_local10.itemIndex,
				attachmentIndex = f168_local10.attachmentIndex,
				groupIndex = f168_local10.groupIndex
			}
		} )
	end
	return f168_local1
end, nil, nil, function ( f170_arg0, f170_arg1, f170_arg2 )
	local f170_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	if f170_arg1.pregameUpdateSubscription then
		f170_arg1:removeSubscription( f170_arg1.pregameUpdateSubscription )
	end
	f170_arg1.pregameUpdateSubscription = f170_arg1:subscribeToModel( f170_local0, function ()
		f170_arg1:updateDataSource( false, false )
	end, false )
end )
DataSources.PregameBannedItems = ListHelper_SetupDataSource( "PregameBannedItems", function ( f172_arg0 )
	local f172_local0 = {}
	local f172_local1 = {}
	local f172_local2 = {}
	local f172_local3 = {}
	local f172_local4 = function ( f173_arg0 )
		for f173_local4, f173_local5 in pairs( f173_arg0 ) do
			if not f172_local0[f173_local5] then
				f172_local0[f173_local5] = true
				local f173_local3 = Engine.GetUnlockableInfoByIndex( f173_local5 )
				if f173_local3.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
					table.insert( f172_local3, f173_local5 )
				end
			end
		end
	end
	
	local f172_local5 = function ( f174_arg0, f174_arg1 )
		for f174_local3, f174_local4 in ipairs( f174_arg1 ) do
			if not f172_local1[f174_local4] then
				f172_local1[f174_local4] = true
			end
			if not f172_local2[f174_arg0] then
				f172_local2[f174_arg0] = {}
			end
			if not f172_local2[f174_arg0][f174_local4] then
				f172_local2[f174_arg0][f174_local4] = true
			end
		end
	end
	
	local f172_local6 = CoD.CACUtility.GetFullLoadout( f172_arg0 )
	for f172_local10, f172_local11 in ipairs( f172_local6.classes ) do
		f172_local4( f172_local11.weapons )
		f172_local4( f172_local11.equipment )
		f172_local4( f172_local11.perks )
		f172_local4( f172_local11.wildcards )
		if f172_local11.weapons.primary ~= nil then
			f172_local5( f172_local11.weapons.primary, f172_local11.primaryAttachments )
		end
		if f172_local11.weapons.secondary ~= nil then
			f172_local5( f172_local11.weapons.secondary, f172_local11.secondaryAttachments )
		end
	end
	f172_local7 = {}
	f172_local8 = {}
	for f172_local15, f172_local16 in ipairs( Engine.GetPregameItemVotes() ) do
		if f172_local16.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if f172_local16.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local f172_local13 = Engine.GetUnlockableInfoByIndex( f172_local16.itemIndex )
				local f172_local14 = CoD.statsTable
				if f172_local14 then
					f172_local14 = CoD.CACUtility.GetIdForItemRef( f172_local16.itemIndex )
				end
				if not LuaUtils.StartsWith( f172_local13.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f172_local13.loadoutSlot, "killstreak" ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f172_local14 ) then
					if f172_local13.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
						table.insert( f172_local7, {
							name = "MENU_MELEE_WEAPONS",
							image = f172_local13.image,
							hintText = f172_local16.gamertag,
							intData = f172_local16.team,
							groupIndex = f172_local13.groupIndex,
							loadoutSlot = f172_local13.loadoutSlot,
							loadoutSlotIndex = f172_local13.loadoutSlotIndex,
							equipped = f172_local3 and #f172_local3 > 0
						} )
					else
						table.insert( f172_local7, {
							name = f172_local13.name,
							image = f172_local13.image,
							hintText = f172_local16.gamertag,
							intData = f172_local16.team,
							groupIndex = f172_local13.groupIndex,
							loadoutSlot = f172_local13.loadoutSlot,
							loadoutSlotIndex = f172_local13.loadoutSlotIndex,
							equipped = f172_local0 and f172_local0[f172_local16.itemIndex] == true
						} )
						goto basicblock_29:
					end
				end
			end
			if f172_local16.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				table.insert( f172_local8, {
					name = Engine.GetAttachmentNameByIndex( f172_local16.attachmentIndex ),
					image = Engine.GetAttachmentImageByIndex( f172_local16.attachmentIndex ),
					isOptic = Engine.IsOpticByAttachmentIndex( f172_local16.attachmentIndex ),
					hintText = f172_local16.gamertag,
					equipped = f172_local1 and f172_local1[f172_local16.attachmentIndex] == true
				} )
			end
			if f172_local16.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				
			end
			if f172_local16.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				
			else
				error( "PregameBannedItems: Unknown vote item type" )
			end
		end
	end
	f172_local10, f172_local11 = CoD.CACUtility.GetAllItems( false, true )
	for f172_local13, f172_local14 in pairs( f172_local10 ) do
		if Engine.GetItemRestrictionState( f172_local14.index ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			local f172_local17 = Engine.GetUnlockableInfoByIndex( f172_local14.index )
			if not LuaUtils.StartsWith( f172_local17.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f172_local17.loadoutSlot, "killstreak" ) then
				local f172_local18 = false
				if f172_local17.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE and Engine.GetItemVote( Engine.GetItemIndexFromReference( "knife_loadout", Enum.eModes.MODE_MULTIPLAYER ) ) == Enum.VoteType.VOTE_TYPE_BAN then
					f172_local18 = true
				end
				if f172_local18 == false then
					table.insert( f172_local7, {
						name = f172_local17.name,
						image = f172_local17.image,
						hintText = Engine.Localize( "MENU_RESTRICTED" ),
						groupIndex = f172_local17.groupIndex,
						loadoutSlot = f172_local17.loadoutSlot,
						loadoutSlotIndex = f172_local17.loadoutSlotIndex,
						equipped = f172_local0 and f172_local0[f172_local14.index] == true
					} )
				end
			end
		end
	end
	for f172_local13, f172_local14 in pairs( f172_local11 ) do
		if Engine.IsAttachmentRestrictedForAnyWeapon( f172_local14.index ) then
			table.insert( f172_local8, {
				name = Engine.GetAttachmentNameByIndex( f172_local14.index ),
				image = Engine.GetAttachmentImageByIndex( f172_local14.index ),
				isOptic = Engine.IsOpticByAttachmentIndex( f172_local14.index ),
				hintText = Engine.Localize( "MENU_RESTRICTED" ),
				equipped = f172_local1 and f172_local1[f172_local14.index] == true
			} )
		end
	end
	f172_local12 = function ( f175_arg0, f175_arg1 )
		if f172_local8[f175_arg0].isOptic and f172_local8[f175_arg1].isOptic then
			return Engine.Localize( f172_local8[f175_arg0].name ) < Engine.Localize( f172_local8[f175_arg1].name )
		elseif f172_local8[f175_arg0].isOptic ~= f172_local8[f175_arg1].isOptic then
			return f172_local8[f175_arg0].isOptic
		else
			return Engine.Localize( f172_local8[f175_arg0].name ) < Engine.Localize( f172_local8[f175_arg1].name )
		end
	end
	
	f172_local15 = function ( f176_arg0, f176_arg1 )
		if f172_local7[f176_arg0].groupIndex ~= f172_local7[f176_arg1].groupIndex then
			return f172_local7[f176_arg0].groupIndex < f172_local7[f176_arg1].groupIndex
		elseif f172_local7[f176_arg0].loadoutSlot == f172_local7[f176_arg1].loadoutSlot then
			return Engine.Localize( f172_local7[f176_arg0].name ) < Engine.Localize( f172_local7[f176_arg1].name )
		else
			return Engine.Localize( f172_local7[f176_arg0].loadoutSlot ) < Engine.Localize( f172_local7[f176_arg1].loadoutSlot )
		end
	end
	
	f172_local16 = {}
	f172_local13 = false
	for f172_local24, f172_local25 in LUI.IterateTableBySortedKeys( f172_local7, f172_local15, nil ) do
		if f172_local13 == false and f172_local25.loadoutSlotIndex > 50 then
			for f172_local22, f172_local23 in LUI.IterateTableBySortedKeys( f172_local8, f172_local12, nil ) do
				table.insert( f172_local16, {
					models = {
						name = f172_local23.name,
						image = f172_local23.image,
						hintText = f172_local23.hintText,
						intData = f172_local23.intData,
						equipped = f172_local23.equipped
					}
				} )
			end
			f172_local13 = true
		end
		table.insert( f172_local16, {
			models = {
				name = f172_local25.name,
				image = f172_local25.image,
				hintText = f172_local25.hintText,
				intData = f172_local25.intData,
				equipped = f172_local25.equipped
			}
		} )
	end
	if f172_local13 == false then
		for f172_local24, f172_local25 in LUI.IterateTableBySortedKeys( f172_local8, f172_local12, nil ) do
			table.insert( f172_local16, {
				models = {
					name = f172_local25.name,
					image = f172_local25.image,
					hintText = f172_local25.hintText,
					intData = f172_local25.intData,
					equipped = f172_local25.equipped
				}
			} )
		end
	end
	return f172_local16
end, nil, nil, function ( f177_arg0, f177_arg1, f177_arg2 )
	local f177_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	if f177_arg1.pregameUpdateSubscription then
		f177_arg1:removeSubscription( f177_arg1.pregameUpdateSubscription )
	end
	f177_arg1.pregameUpdateSubscription = f177_arg1:subscribeToModel( f177_local0, function ()
		f177_arg1:updateDataSource( false, false )
	end, false )
end )
DataSources.PregameBannedStreaks = ListHelper_SetupDataSource( "PregameAllBannedStreaks", function ( f179_arg0 )
	local f179_local0 = CoD.CACUtility.GetFullLoadout( f179_arg0 )
	local f179_local1 = {}
	for f179_local5, f179_local6 in pairs( f179_local0.streaks ) do
		f179_local1[f179_local6] = true
	end
	f179_local2 = Engine.GetPregameItemVotes()
	f179_local3 = {}
	for f179_local9, f179_local10 in ipairs( f179_local2 ) do
		if f179_local10.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			local f179_local7 = Engine.GetUnlockableInfoByIndex( f179_local10.itemIndex )
			local f179_local8 = f179_local1 and f179_local1[f179_local10.itemIndex] == true
			if LUI.startswith( f179_local7.loadoutSlot, "killstreak" ) then
				table.insert( f179_local3, {
					name = f179_local7.name,
					image = f179_local7.image .. "_menu",
					momentum = f179_local7.momentum,
					gamertag = f179_local10.gamertag,
					intData = f179_local10.team,
					equipped = f179_local8
				} )
			end
		end
	end
	f179_local4, f179_local5 = CoD.CACUtility.GetAllItems( false, true )
	for f179_local7, f179_local8 in pairs( f179_local4 ) do
		if Engine.GetItemRestrictionState( f179_local8.index ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			local f179_local11 = Engine.GetUnlockableInfoByIndex( f179_local8.index )
			if LuaUtils.StartsWith( f179_local11.loadoutSlot, "killstreak" ) then
				table.insert( f179_local3, {
					name = f179_local11.name,
					image = f179_local11.image .. "_menu",
					momentum = f179_local11.momentum,
					gamertag = "",
					equipped = f179_local1 and f179_local1[f179_local8.index] == true
				} )
			end
		end
	end
	f179_local6 = function ( f180_arg0, f180_arg1 )
		return f179_local3[f180_arg0].momentum < f179_local3[f180_arg1].momentum
	end
	
	f179_local9 = {}
	for f179_local11, f179_local12 in LUI.IterateTableBySortedKeys( f179_local3, f179_local6, nil ) do
		table.insert( f179_local9, {
			models = {
				name = f179_local12.name,
				image = f179_local12.image,
				hintText = f179_local12.gamertag,
				intData = f179_local12.intData,
				equipped = f179_local12.equipped
			}
		} )
	end
	return f179_local9
end, nil, nil, function ( f181_arg0, f181_arg1, f181_arg2 )
	local f181_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	if f181_arg1.pregameUpdateSubscription then
		f181_arg1:removeSubscription( f181_arg1.pregameUpdateSubscription )
	end
	f181_arg1.pregameUpdateSubscription = f181_arg1:subscribeToModel( f181_local0, function ()
		f181_arg1:updateDataSource( false, false )
	end, false )
end )
DataSources.PregameClientList = ListHelper_SetupDataSource( "PregameClientList", function ( f183_arg0 )
	local f183_local0 = {}
	local f183_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f183_local2 = f183_local1.sessionClients
	table.sort( f183_local2, function ( f184_arg0, f184_arg1 )
		return f184_arg0.pregamePosition < f184_arg1.pregamePosition
	end )
	for f183_local7, f183_local8 in ipairs( f183_local2 ) do
		local f183_local9 = f183_local8.characterDraft.characterIndex
		local f183_local10 = f183_local8.characterDraft.loadout
		local f183_local11 = Engine.GetHeroName( Engine.CurrentSessionMode(), f183_local9 )
		local f183_local12 = Engine.GetLoadoutInfoForHero( Engine.CurrentSessionMode(), f183_local9, f183_local10 )
		local f183_local6 = ""
		if f183_local12 then
			f183_local6 = f183_local12.itemName
		end
		table.insert( f183_local0, {
			models = {
				xuid = f183_local8.xuid,
				gamertag = f183_local8.gamertag,
				clantag = "",
				rank = f183_local8.competitiveRank,
				rankIcon = f183_local8.competitiveRankIcon,
				prestige = f183_local8.prestige,
				team = f183_local8.team,
				teamString = tostring( f183_local8.team ),
				groupId = f183_local8.simpleGroupID,
				isHost = f183_local8.isHost,
				isLeader = f183_local8.isLeader,
				clientState = f183_local8.pregameState,
				position = f183_local8.pregamePosition,
				voteCount = f183_local8.voteCount,
				characterIndex = f183_local8.characterDraft.characterIndex,
				characterName = f183_local11,
				characterLoadout = f183_local8.characterDraft.loadout,
				characterLoadoutName = f183_local6
			},
			properties = {}
		} )
	end
	return f183_local0
end, nil, nil, function ( f185_arg0, f185_arg1, f185_arg2 )
	local f185_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	if f185_arg1.pregameUpdateSubscription then
		f185_arg1:removeSubscription( f185_arg1.pregameUpdateSubscription )
	end
	f185_arg1.pregameUpdateSubscription = f185_arg1:subscribeToModel( f185_local0, function ()
		f185_arg1:updateDataSource( false, false )
	end, false )
	local f185_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	if f185_arg1.teamCountSubscription then
		f185_arg1:removeSubscription( f185_arg1.teamCountSubscription )
	end
	f185_arg1.teamCountSubscription = f185_arg1:subscribeToModel( f185_local1, function ()
		f185_arg1:updateDataSource()
	end, false )
end )
DataSources.PregameBannedContentButtons = ListHelper_SetupDataSource( "PregameBannedContentButtons", function ( f188_arg0 )
	local f188_local0 = {}
	local f188_local1 = function ( f189_arg0, f189_arg1, f189_arg2, f189_arg3, f189_arg4 )
		Engine.SendPregameEditComplete( f189_arg2, true )
		GoBack( f189_arg0, f189_arg1, f189_arg2, f189_arg3, f189_arg4 )
	end
	
	if ItemRestrictionCACEditActive() then
		table.insert( f188_local0, {
			text = "MENU_EDIT_CAC_CAPS",
			id = "editCaC",
			disabled = false,
			action = OpenCAC,
			params = {
				controller = f188_arg0
			}
		} )
		table.insert( f188_local0, {
			text = "MENU_DONE_CAPS",
			id = "cancel",
			disabled = false,
			action = f188_local1,
			params = {
				controller = f188_arg0
			}
		} )
	elseif ItemRestrictionScorestreakEditActive() then
		table.insert( f188_local0, {
			text = "MENU_EDIT_SCORESTREAKS_CAPS",
			id = "editStreaks",
			disabled = false,
			action = OpenScorestreaks,
			params = {
				controller = f188_arg0
			}
		} )
		table.insert( f188_local0, {
			text = "MENU_DONE_CAPS",
			id = "cancel",
			disabled = false,
			action = f188_local1,
			params = {
				controller = f188_arg0
			}
		} )
	end
	local f188_local2 = {}
	for f188_local6, f188_local7 in ipairs( f188_local0 ) do
		table.insert( f188_local2, {
			models = {
				displayText = Engine.Localize( f188_local7.text ),
				customId = f188_local7.customId
			},
			properties = {
				disabled = f188_local7.disabled,
				action = f188_local7.action,
				actionParam = f188_local7.params
			}
		} )
	end
	return f188_local2
end )
DataSources.SocialPlayerDetailsButtons = ListHelper_SetupDataSource( "SocialPlayerDetailsButtons", function ( f190_arg0 )
	local f190_local0 = {}
	local f190_local1 = Engine.GetModelForController( f190_arg0 )
	local f190_local2 = Engine.GetModelValue( Engine.CreateModel( f190_local1, "Social.selectedFriendXUID" ) )
	local f190_local3 = Engine.GetModelValue( Engine.CreateModel( f190_local1, "Social.selectedFriendGamertag" ) )
	local f190_local4 = f190_local2 == Engine.GetXUID64( f190_arg0 )
	local f190_local5 = Engine.GetModelValue( Engine.CreateModel( f190_local1, "Social.selectedFriendInTitle" ) )
	local f190_local6 = Engine.GetModelValue( Engine.CreateModel( f190_local1, "Social.hideSelectedFriendShowcase" ) )
	local f190_local7 = Engine.IsInGame()
	if f190_local2 == nil then
		return f190_local0
	end
	local f190_local8 = Engine.GetPlayerInfo( f190_arg0, f190_local2 )
	if f190_local4 == false and IsInFileshare( f190_arg0 ) == false then
		local f190_local9 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f190_local2 )
		local f190_local10 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f190_local2 )
		local f190_local11 = CoD.canInviteToGame( f190_arg0, f190_local2 )
		if f190_local11 then
			if f190_local9 ~= false or f190_local10 ~= false then
				f190_local11 = false
			else
				f190_local11 = true
			end
		end
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f190_local2 ) then
			if f190_local7 == false and Engine.IsLeader( f190_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				if ShouldShowPromotePlayer( f190_arg0 ) then
					table.insert( f190_local0, {
						text = "MENU_PROMOTE_TO_PARTY_LEADER",
						id = "promoteToLeader",
						action = PromoteToLeader,
						params = {
							controller = f190_arg0,
							xuid = f190_local2
						},
						lastInGroup = false
					} )
				end
				if not Engine.IsLocalClient( f190_local2 ) then
					table.insert( f190_local0, {
						text = "MENU_REMOVE_FROM_PARTY",
						id = "removeFromParty",
						action = DisconnectClient,
						params = {
							controller = f190_arg0,
							xuid = f190_local2
						},
						lastInGroup = true
					} )
				end
			end
		elseif f190_local5 == true then
			local f190_local12 = Engine.IsFriendFromXUID( f190_arg0, f190_local2 )
			local f190_local13 = true
			if f190_local8.info.mapid then
				local f190_local14 = CoD.GetMapIDFromMapUniqueID( f190_local8.info.mapid )
				if f190_local14 then
					local f190_local15 = Engine.GetDLCBitForMapName( f190_local14 )
					local f190_local16 = Engine.GetDLCBits()
					if IsDvarValueEqualTo( "ui_freeDLC1", "1" ) then
						f190_local16 = f190_local16 | Enum.ContentFlagBits.CONTENT_DLC1
					end
					f190_local13 = CoD.BitUtility.IsBitwiseAndNonZero( f190_local15, f190_local16 )
				end
			end
			if f190_local13 and (f190_local8.info.joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or f190_local12 and f190_local8.info.joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY) then
				if f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP or f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP or f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_IN_SAFEHOUSE or f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_IN_SAFEHOUSE or f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_IN_LOBBY or f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP or f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_IN_LOBBY or f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND or f190_local8.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_IN_LOBBY then
					if f190_local12 then
						table.insert( f190_local0, {
							text = "MENU_JOIN_GAME",
							id = "joinGame",
							disabled = false,
							action = SocialJoin,
							params = {
								controller = f190_arg0,
								xuid = f190_local2,
								joinType = Enum.JoinType.JOIN_TYPE_FRIEND,
								goBack = true
							},
							lastInGroup = not f190_local11
						} )
					else
						table.insert( f190_local0, {
							text = "MENU_JOIN_GAME",
							id = "joinGame",
							disabled = false,
							action = SocialJoin,
							params = {
								controller = f190_arg0,
								xuid = f190_local2,
								joinType = Enum.JoinType.JOIN_TYPE_NORMAL,
								goBack = true
							},
							lastInGroup = not f190_local11
						} )
					end
				elseif f190_local12 then
					table.insert( f190_local0, {
						text = "MENU_JOIN_PARTY",
						id = "joinParty",
						disabled = false,
						action = SocialJoin,
						params = {
							controller = f190_arg0,
							xuid = f190_local2,
							joinType = Enum.JoinType.JOIN_TYPE_FRIEND,
							goBack = true
						},
						lastInGroup = not f190_local11
					} )
				else
					table.insert( f190_local0, {
						text = "MENU_JOIN_PARTY",
						id = "joinParty",
						disabled = false,
						action = SocialJoin,
						params = {
							controller = f190_arg0,
							xuid = f190_local2,
							joinType = Enum.JoinType.JOIN_TYPE_NORMAL,
							goBack = true
						},
						lastInGroup = not f190_local11
					} )
				end
			end
		end
		if f190_local11 then
			if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				table.insert( f190_local0, {
					text = "MENU_INVITE_GAME",
					id = "inviteToGame",
					disabled = false,
					action = LobbyInviteFriendGoBack,
					params = {
						controller = f190_arg0,
						xuid = f190_local2,
						gamertag = f190_local3
					},
					lastInGroup = true
				} )
			else
				table.insert( f190_local0, {
					text = "MENU_INVITE_TO_PARTY",
					id = "invteToParty",
					disabled = false,
					action = LobbyInviteFriendGoBack,
					params = {
						controller = f190_arg0,
						xuid = f190_local2,
						gamertag = f190_local3
					},
					lastInGroup = true
				} )
			end
		end
	end
	if f190_local8.info.hasEverPlayed == true and not IsInGame() and not IsUserContentRestricted( f190_arg0 ) then
		if f190_local6 ~= true then
			table.insert( f190_local0, {
				text = "MENU_SHOWCASE_CAPS",
				id = "playerShowcase",
				disabled = false,
				action = OpenPlayerShowcaseOnParent,
				params = {
					controller = f190_arg0,
					xuid = f190_local2
				},
				lastInGroup = false
			} )
		end
		table.insert( f190_local0, {
			text = "MENU_COMBAT_RECORD_CAPS",
			id = "combatRecord",
			disabled = false,
			action = CombatRecordOpenFromPlayerDetails,
			params = {
				controller = f190_arg0,
				xuid = f190_local2
			},
			lastInGround = false
		} )
	end
	table.insert( f190_local0, {
		text = "XBOXLIVE_VIEW_PROFILE",
		id = "platformProfile",
		disabled = false,
		action = OpenPlatformProfile,
		params = {
			controller = f190_arg0,
			gamertag = f190_local3,
			xuid = f190_local2
		},
		lastInGroup = false
	} )
	if f190_local4 == false then
		if IsGroupsEnabled() and not IsPlayerAGuest( f190_arg0 ) and IsPrimaryControllerIndex( f190_arg0 ) and (not LuaUtils.isXbox or not string.find( f190_local3, "(", 1, true )) and not CoD.SafeGetModelValue( Engine.GetModelForController( f190_arg0 ), "groups.disableViewGroups" ) then
			table.insert( f190_local0, {
				text = "MENU_VIEW_GROUPS_CAPS",
				id = "viewGroups",
				disabled = false,
				action = OpenViewGroups,
				params = nil,
				lastInGroup = true
			} )
		end
		local f190_local9 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f190_local2 )
		local f190_local10 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f190_local2 )
		local f190_local11 = Engine.IsPlayerMuted( f190_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f190_local2 )
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			f190_local11 = Engine.IsPlayerMuted( f190_arg0, Enum.LobbyType.LOBBY_TYPE_GAME, f190_local2 )
		end
		if not Engine.IsFriendFromXUID( f190_arg0, f190_local2 ) then
			if IsDurango() then
				table.insert( f190_local0, {
					text = "MENU_FOLLOW_PLAYER",
					id = "sendFriendRequest",
					disabled = false,
					action = OpenPlatformFriendRequest,
					params = {
						controller = f190_arg0,
						gamertag = f190_local3,
						xuid = f190_local2
					},
					lastInGroup = false
				} )
			else
				table.insert( f190_local0, {
					text = "MENU_SEND_FRIEND_REQUEST",
					id = "sendFriendRequest",
					disabled = false,
					action = OpenPlatformFriendRequest,
					params = {
						controller = f190_arg0,
						gamertag = f190_local3,
						xuid = f190_local2
					},
					lastInGroup = false
				} )
			end
		end
		if IsGroupsEnabled() and CanSendGroupInvites( f190_arg0 ) and (not LuaUtils.isXbox or not string.find( f190_local3, "(", 1, true )) then
			table.insert( f190_local0, {
				text = "MENU_INVITE_TO_GROUP",
				id = "inviteToGroup",
				disabled = false,
				action = OpenGroupSelector,
				params = nil,
				lastInGroup = false
			} )
		end
		if f190_local8.info.hasEverPlayed == true then
			table.insert( f190_local0, {
				text = "MENU_REPORT_PLAYER",
				id = "reportPlayer",
				disabled = false,
				action = ShowReportPlayerDialog,
				params = {
					controller = f190_arg0,
					gamertag = f190_local3,
					xuid = f190_local2
				},
				lastInGroup = false
			} )
		end
		if f190_local9 or f190_local10 then
			if f190_local11 then
				table.insert( f190_local0, {
					text = "MENU_UNMUTE_PLAYER",
					id = "unmutePlayer",
					disabled = false,
					action = UnMutePlayer,
					params = {
						controller = f190_arg0,
						xuid = f190_local2
					},
					lastInGroup = false
				} )
			else
				table.insert( f190_local0, {
					text = "MENU_MUTE_PLAYER",
					id = "mutePlayer",
					disabled = false,
					action = MutePlayer,
					params = {
						controller = f190_arg0,
						xuid = f190_local2
					},
					lastInGroup = false
				} )
			end
		end
	end
	local f190_local9 = {}
	for f190_local13, f190_local14 in ipairs( f190_local0 ) do
		table.insert( f190_local9, {
			models = {
				displayText = Engine.Localize( f190_local14.text ),
				customId = f190_local14.customId
			},
			properties = {
				disabled = f190_local14.disabled,
				action = f190_local14.action,
				actionParam = f190_local14.params,
				isLastButtonInGroup = f190_local14.lastInGroup
			}
		} )
	end
	return f190_local9
end, nil, nil, function ( f191_arg0, f191_arg1, f191_arg2 )
	
end, function ( f192_arg0, f192_arg1, f192_arg2 )
	if f192_arg0.SocialPlayerDetailsButtons[f192_arg1].properties.isLastButtonInGroup then
		return 9
	else
		
	end
end )
DataSources.SpinnerMessage = {
	getModel = function ( f193_arg0 )
		local f193_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "spinnerModel" )
		Engine.CreateModel( f193_local0, "spinnerMessage" )
		return f193_local0
	end
}
DataSources.FeaturedCardsRoot = {
	getModel = function ( f194_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" )
	end
}
DataSources.NetworkImage = {
	getModel = function ( f195_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "NetworkImage" )
	end
}
DataSources.FeaturedCardHelper = function ( f196_arg0, f196_arg1 )
	local f196_local0 = {}
	local f196_local1 = 0
	if HasLiveEvent( f196_arg0 ) then
		local f196_local2 = nil
		if f196_arg1 then
			f196_local2 = CoD.FE_LiveEventFeatureCard
		end
		table.insert( f196_local0, {
			models = {
				actionTitle = "MENU_WATCH_NOW",
				action = "liveevent",
				sequence = f196_local1
			},
			properties = {
				customWidgetOverride = f196_local2
			}
		} )
		f196_local1 = f196_local1 + 1
	end
	if 1 == Dvar.ui_enableZMHDFeaturedCard:get() or Dvar.ui_enableZMHDFeaturedCard:get() == "1" then
		local f196_local2 = "t7_crm_zmhd_cosmic_featured_thermometerlocked"
		if IsThermometerProgressEqualTo( 1 ) then
			f196_local2 = "t7_crm_zmhd_cosmic_featured_thermometer"
		end
		table.insert( f196_local0, {
			models = {
				title = "",
				actionTitle = "MENU_DETAILS",
				action = "open_zmhd_thermometer",
				background = f196_local2,
				sequence = f196_local1
			}
		} )
		f196_local1 = f196_local1 + 1
	end
	local f196_local2 = Engine.GetFeaturedCardsData()
	if f196_local2 ~= nil then
		local f196_local3 = f196_local2.cardsCountToShow
		if f196_local2.enabled == true and 0 < f196_local3 then
			for f196_local4 = 0, f196_local3 - 1, 1 do
				local f196_local7 = Engine.GetFeaturedCard( f196_local4 )
				if f196_local7.valid == true then
					local f196_local8 = true
					if f196_local7.subTitle == "zm" and not CoD.isZombie then
						f196_local8 = false
					end
					if f196_local7.subTitle == "mp" and not CoD.isMultiplayer then
						f196_local8 = false
					end
					if f196_local8 then
						table.insert( f196_local0, {
							models = {
								index = f196_local4,
								title = f196_local7.title,
								subTitle = f196_local7.subTitle,
								type = f196_local7.type,
								actionTitle = f196_local7.actionTitle,
								action = f196_local7.action,
								background = f196_local7.bg,
								sequence = f196_local1
							}
						} )
						f196_local1 = f196_local1 + 1
					end
				end
			end
		end
	end
	if CoD.isZombie then
		local f196_local3 = nil
		if f196_arg1 then
			f196_local3 = CoD.FE_DailyRecipeFeatureCard
		end
		local f196_local9 = CoD.BubbleGumBuffUtility.GetCurrentGobbleGumRecipeIndices( f196_arg0 )
		local f196_local4 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f196_arg0, f196_local9[1] )
		local f196_local5 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f196_arg0, f196_local9[2] )
		local f196_local6 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f196_arg0, f196_local9[3] )
		table.insert( f196_local0, {
			models = {
				title = "MENU_TODAYS_NEWTONS_COOKBOOK_RECIPES",
				actionTitle = "MENU_DETAILS",
				action = "open_cookbook",
				background = "t7_crm_zm_featured_cookbook_daily",
				sequence = f196_local1,
				recipeResultIndex1 = f196_local4.result.itemIndex,
				recipeResultIndex2 = f196_local5.result.itemIndex,
				recipeResultIndex3 = f196_local6.result.itemIndex
			},
			properties = {
				customWidgetOverride = f196_local3
			}
		} )
		f196_local1 = f196_local1 + 1
		if f196_arg1 then
			f196_local3 = CoD.DailyChallengeWidgetContainer
		end
		table.insert( f196_local0, {
			models = {
				actionTitle = "MENU_DETAILS",
				action = "open_daily_challenge",
				sequence = f196_local1
			},
			properties = {
				customWidgetOverride = f196_local3
			}
		} )
		f196_local1 = f196_local1 + 1
	end
	return f196_local0
end

DataSources.FeaturedCardPostCreationHelper = function ( f197_arg0, f197_arg1, f197_arg2 )
	if not f197_arg1.eventViewerSubscription then
		local f197_local0 = DataSources.LiveEventViewer.getModel( f197_arg0 )
		if f197_local0 then
			local f197_local1 = Engine.GetModel( f197_local0, "stream" )
			if f197_local1 then
				f197_arg1.eventViewerSubscription = f197_arg1:subscribeToModel( f197_local1, function ()
					f197_arg1:updateDataSource()
				end, false )
			end
		end
	end
	if not f197_arg1.lobbyNavSubscription then
		local f197_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
		if f197_local0 then
			f197_arg1.lobbyNavSubscription = f197_arg1:subscribeToModel( f197_local0, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if f197_arg1.lastLobby ~= modelValue then
					f197_arg1.lastLobby = modelValue
					f197_arg1:updateDataSource()
				end
			end, false )
		end
	end
	if not f197_arg1.cookbookScheduleTimerSubscription then
		local f197_local0 = Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f197_arg0 ), "scheduleIndex" )
		if f197_local0 then
			f197_arg1.cookbookScheduleTimerSubscription = f197_arg1:subscribeToModel( f197_local0, function ( model )
				f197_arg1:updateDataSource()
			end, false )
		end
	end
end

DataSources.FeaturedCards = ListHelper_SetupDataSource( "FeaturedCards", function ( f201_arg0 )
	return DataSources.FeaturedCardHelper( f201_arg0, true )
end, nil, nil, DataSources.FeaturedCardPostCreationHelper )
DataSources.FeaturedCardTicks = ListHelper_SetupDataSource( "FeaturedCardTicks", function ( f202_arg0 )
	return DataSources.FeaturedCardHelper( f202_arg0, false )
end, nil, nil, DataSources.FeaturedCardPostCreationHelper )
DataSources.MarketingRoot = {
	getModel = function ( f203_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "MarketingRoot" )
	end
}
DataSources.NetworkInfo = {
	getModel = function ( f204_arg0 )
		local f204_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "NetworkInfo" )
		local f204_local1 = Engine.CreateModel( f204_local0, "natType" )
		local f204_local2 = Engine.CreateModel( f204_local0, "bandwidth" )
		local f204_local3 = Engine.CreateModel( f204_local0, "connectionType" )
		local f204_local4 = Engine.CreateModel( f204_local0, "externalIP" )
		local f204_local5 = Engine.CreateModel( f204_local0, "internalIP" )
		local f204_local6 = Engine.CreateModel( f204_local0, "region" )
		local f204_local7 = Engine.CreateModel( f204_local0, "version" )
		local f204_local8 = Engine.CreateModel( f204_local0, "connectivityInfo" )
		local f204_local9 = Engine.CreateModel( f204_local0, "supportURL" )
		local f204_local10 = function ( f205_arg0, f205_arg1 )
			local f205_local0, f205_local1 = Engine.GetSystemInfo( f204_arg0, f205_arg1 )
			Engine.SetModelValue( f205_arg0, f205_local0 )
		end
		
		f204_local10( f204_local1, CoD.SYSINFO_NAT_TYPE )
		f204_local10( f204_local2, CoD.SYSINFO_BANDWIDTH )
		f204_local10( f204_local3, CoD.SYSINFO_CONNECTION_TYPE )
		f204_local10( f204_local4, CoD.SYSINFO_EXTERNAL_IP_ADDRESS )
		f204_local10( f204_local5, CoD.SYSINFO_INTERNAL_IP_ADDRESS )
		f204_local10( f204_local6, CoD.SYSINFO_GEOGRAPHICAL_REGION )
		f204_local10( f204_local7, CoD.SYSINFO_VERSION_NUMBER )
		f204_local10( f204_local8, CoD.SYSINFO_CONNECTIVITY_INFO )
		local f204_local11 = "MENU_OPTIONS_NETWORK_CUSTOMER_SERVICE_LINK"
		if Dvar.ui_supportURL ~= nil then
			f204_local11 = Dvar.ui_supportURL:get()
		end
		Engine.SetModelValue( f204_local9, f204_local11 )
		return f204_local0
	end
}
DataSources.PlayGoDownloadProgress = {
	getModel = function ( f206_arg0 )
		local f206_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress" )
		Engine.SetModelValue( Engine.CreateModel( f206_local0, "progress" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f206_local0, "chunk" ), "" )
		return f206_local0
	end
}
DataSources.NetStatsInfo = {
	getModel = function ( f207_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "NetStatsInfo" )
	end
}
DataSources.MOTD = {
	getModel = function ( f208_arg0 )
		local f208_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "motd" )
		local f208_local1 = Engine.CreateModel( f208_local0, "isValid" )
		local f208_local2 = Engine.CreateModel( f208_local0, "singleView" )
		local f208_local3 = Engine.CreateModel( f208_local0, "motdVersion" )
		local f208_local4 = Engine.CreateModel( f208_local0, "title" )
		local f208_local5 = Engine.CreateModel( f208_local0, "message" )
		local f208_local6 = Engine.CreateModel( f208_local0, "image" )
		local f208_local7 = Engine.CreateModel( f208_local0, "action" )
		local f208_local8 = Engine.CreateModel( f208_local0, "actionContext" )
		local f208_local9 = Engine.CreateModel( f208_local0, "actionString" )
		local f208_local10 = Engine.CreateModel( f208_local0, "bannerTitle" )
		local f208_local11 = Engine.CreateModel( f208_local0, "bannerMessage" )
		local f208_local12 = Engine.CreateModel( f208_local0, "bannerImage" )
		local f208_local13 = Engine.CreateModel( f208_local0, "bannerAction" )
		local f208_local14 = Engine.CreateModel( f208_local0, "bannerActionContext" )
		local f208_local15 = Engine.CreateModel( f208_local0, "bannerActionString" )
		local f208_local16 = Engine.GetMOTD()
		Engine.SetModelValue( f208_local1, f208_local16.isValid )
		if f208_local16.isValid then
			Engine.SetModelValue( f208_local2, f208_local16.singleView )
			Engine.SetModelValue( f208_local3, f208_local16.motdVersion )
			Engine.SetModelValue( f208_local4, f208_local16.title )
			Engine.SetModelValue( f208_local5, f208_local16.message )
			Engine.SetModelValue( f208_local6, f208_local16.image )
			Engine.SetModelValue( f208_local7, f208_local16.action )
			Engine.SetModelValue( f208_local8, f208_local16.actionContext )
			Engine.SetModelValue( f208_local9, f208_local16.actionString )
			Engine.SetModelValue( f208_local10, f208_local16.bannerTitle )
			Engine.SetModelValue( f208_local11, f208_local16.bannerMessage )
			Engine.SetModelValue( f208_local12, f208_local16.bannerImage )
			Engine.SetModelValue( f208_local13, f208_local16.bannerAction )
			Engine.SetModelValue( f208_local14, f208_local16.bannerActionContext )
			Engine.SetModelValue( f208_local15, f208_local16.bannerActionString )
		end
		return f208_local0
	end
}
DataSources.MtxCommsMOTD = {
	getModel = function ( f209_arg0 )
		local f209_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsMOTD" )
		local f209_local1 = Engine.GetMarketingMessage( f209_arg0, "motd" )
		if f209_local1 ~= nil then
			for f209_local5, f209_local6 in next, f209_local1, nil do
				Engine.SetModelValue( Engine.CreateModel( f209_local0, f209_local5 ), f209_local6 )
			end
			if not f209_local1.messageID then
				Engine.SetModelValue( Engine.CreateModel( f209_local0, "messageID" ), 0 )
			end
			Engine.ExecNow( f209_arg0, "setupThumbnailForMarketing mtxcommsmotd" )
			Engine.SetModelValue( Engine.CreateModel( f209_local0, "imageFileID" ), 1 )
		end
		if not f209_local1 or not f209_local1.type then
			Engine.SetModelValue( Engine.CreateModel( f209_local0, "type" ), "" )
		end
		return f209_local0
	end
}
DataSources.MtxCommsRegistration = {
	getModel = function ( f210_arg0 )
		local f210_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsRegistration" )
		local f210_local1 = Engine.GetMarketingMessage( f210_arg0, "registration" )
		if f210_local1 ~= nil and not f210_local1.messageViewReported then
			for f210_local5, f210_local6 in next, f210_local1, nil do
				Engine.SetModelValue( Engine.CreateModel( f210_local0, f210_local5 ), f210_local6 )
			end
			if f210_local1.action ~= "opt-in" and f210_local1.action ~= "registration" and f210_local1.content_long ~= "" then
				Engine.SetModelValue( Engine.CreateModel( f210_local0, "action_title" ), Engine.Localize( "ACCOUNT_LINK_LEARN_MORE" ) )
			end
		else
			local f210_local2 = Engine.GetMarketingMessage( f210_arg0, "motd" )
			if f210_local2 ~= nil and f210_local2.hasBanner then
				Engine.SetModelValue( Engine.CreateModel( f210_local0, "content_short" ), f210_local2.bannerTitle )
				Engine.SetModelValue( Engine.CreateModel( f210_local0, "action_title" ), Engine.Localize( f210_local2.bannerActionString ) )
				Engine.SetModelValue( Engine.CreateModel( f210_local0, "action" ), f210_local2.bannerAction )
				Engine.SetModelValue( Engine.CreateModel( f210_local0, "image" ), f210_local2.bannerImage )
				Engine.SetModelValue( Engine.CreateModel( f210_local0, "locationID" ), 1 )
			end
		end
		return f210_local0
	end
}
DataSources.CRMPopup = {
	getModel = function ( f211_arg0 )
		local f211_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CRMPopup" )
		local f211_local1 = Engine.GetModel( f211_local0, "location" )
		local f211_local2 = nil
		if f211_local1 ~= nil then
			local f211_local3 = Engine.GetModelValue( f211_local1 )
			if f211_local3 == "crm_featured" then
				f211_local2 = Engine.GetMarketingMessage( f211_arg0, f211_local3, Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f211_arg0 ), "FeaturedCards" ), Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" ), "CardSequence" ) ) + 1 ), "index" ) ) )
			else
				f211_local2 = Engine.GetMarketingMessage( f211_arg0, f211_local3 )
			end
		else
			f211_local2 = Engine.GetMarketingMessage( f211_arg0, "crm_featured" )
		end
		if f211_local2 ~= nil then
			for f211_local6, f211_local7 in pairs( f211_local2 ) do
				Engine.SetModelValue( Engine.CreateModel( f211_local0, f211_local6 ), f211_local7 )
			end
		end
		if not f211_local2 or not f211_local2.action then
			Engine.SetModelValue( Engine.CreateModel( f211_local0, "action" ), "" )
		end
		return f211_local0
	end
}
DataSources.WeaponBuildKitCategories = ListHelper_SetupDataSource( "WeaponBuildKitCategories", function ( f212_arg0 )
	local f212_local0 = {}
	local f212_local1 = CoD.Craft.WeaponGroupNames
	for f212_local2 = 1, #f212_local1, 1 do
		local f212_local5 = f212_local1[f212_local2]
		table.insert( f212_local0, {
			models = {
				breadcrumbCount = 0,
				categoryRef = f212_local5.weapon_category,
				categoryName = f212_local5.lowercaseName,
				categoryImage = f212_local5.weapon_image
			},
			properties = {}
		} )
	end
	return f212_local0
end, true )
DataSources.WeaponGroups = ListHelper_SetupDataSource( "WeaponGroups", function ( f213_arg0 )
	local f213_local0 = {}
	local f213_local1 = function ( f214_arg0, f214_arg1 )
		local f214_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		for f214_local4, f214_local5 in ipairs( f214_arg0 ) do
			if CoD.UnlockablesTable and CoD.UnlockablesTable[f214_local5.weapon_category] then
				table.insert( f213_local0, {
					models = {
						tabName = f214_local5.name,
						breadcrumbCount = Engine.WeaponGroupNewItemCount( f213_arg0, f214_local5.weapon_category, nil, f214_local0 )
					},
					properties = {
						filter = f214_local5.weapon_category,
						loadoutType = f214_arg1
					}
				} )
			end
		end
	end
	
	table.insert( f213_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	local f213_local2 = CoD.perController[f213_arg0].weaponClassGroup
	if f213_local2 == "primary" then
		f213_local1( CoD.CACUtility.PrimaryWeaponGroupNames, "primary" )
	elseif f213_local2 == "secondary" then
		f213_local1( CoD.CACUtility.SecondaryWeaponGroupNames, "secondary" )
	end
	table.insert( f213_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f213_local0
end, true )
DataSources.Unlockables = {
	prepare = function ( f215_arg0, f215_arg1, f215_arg2 )
		if not CoD.UnlockablesTable then
			CoD.UnlockablesTable = CoD.GetUnlockablesTable( f215_arg0, f215_arg2 )
		end
		CoD.UpdateUnlockableTableBMItems( f215_arg0, CoD.UnlockablesTable )
		f215_arg1.dataSource = CoD.UnlockablesTable
	end,
	getCount = function ( f216_arg0 )
		if not DataSources.Unlockables.currentFilter and f216_arg0.dataSource.filterList then
			return #f216_arg0.dataSource.filterList
		elseif f216_arg0.dataSource[DataSources.Unlockables.currentFilter] then
			return #f216_arg0.dataSource[DataSources.Unlockables.currentFilter]
		else
			return 0
		end
	end,
	getItem = function ( f217_arg0, f217_arg1, f217_arg2 )
		if not DataSources.Unlockables.currentFilter and f217_arg1.dataSource.filterList then
			return f217_arg1.dataSource.filterList[f217_arg2]
		elseif f217_arg1.dataSource[DataSources.Unlockables.currentFilter] then
			return f217_arg1.dataSource[DataSources.Unlockables.currentFilter][f217_arg2]
		else
			
		end
	end,
	setCurrentFilterItem = function ( f218_arg0 )
		DataSources.Unlockables.currentFilter = f218_arg0
	end,
	getCurrentFilterItem = function ()
		return DataSources.Unlockables.currentFilter
	end,
	currentFilter = nil
}
DataSources.CraftWeaponList = {
	prepare = function ( f220_arg0, f220_arg1, f220_arg2 )
		if not CoD.CraftWeaponListTable then
			CoD.CraftWeaponListTable = CoD.GetCraftWeaponListTable( f220_arg0, f220_arg2 )
		end
		CoD.UpdateUnlockableTableBMItems( f220_arg0, CoD.CraftWeaponListTable, Enum.eModes.MODE_MULTIPLAYER )
		f220_arg1.dataSource = CoD.CraftWeaponListTable
	end,
	getCount = function ( f221_arg0 )
		if not DataSources.CraftWeaponList.currentFilter and f221_arg0.dataSource.filterList then
			return #f221_arg0.dataSource.filterList
		elseif f221_arg0.dataSource[DataSources.CraftWeaponList.currentFilter] then
			return #f221_arg0.dataSource[DataSources.CraftWeaponList.currentFilter]
		else
			return 0
		end
	end,
	getItem = function ( f222_arg0, f222_arg1, f222_arg2 )
		if not DataSources.CraftWeaponList.currentFilter and f222_arg1.dataSource.filterList then
			return f222_arg1.dataSource.filterList[f222_arg2]
		elseif f222_arg1.dataSource[DataSources.CraftWeaponList.currentFilter] then
			return f222_arg1.dataSource[DataSources.CraftWeaponList.currentFilter][f222_arg2]
		else
			
		end
	end,
	setCurrentFilterItem = function ( f223_arg0 )
		DataSources.CraftWeaponList.currentFilter = f223_arg0
	end,
	getCurrentFilterItem = function ()
		return DataSources.CraftWeaponList.currentFilter
	end,
	currentFilter = nil
}
DataSources.WeaponAttachments = ListHelper_SetupDataSource( "WeaponAttachments", function ( f225_arg0 )
	local f225_local0 = {}
	local f225_local1 = CoD.perController[f225_arg0].weaponSlot
	local f225_local2 = CoD.perController[f225_arg0].weaponCategory
	local f225_local3 = CoD.perController[f225_arg0].classModel
	local f225_local4 = Engine.GetModelValue( Engine.GetModel( f225_local3, f225_local1 .. ".itemIndex" ) )
	local f225_local5 = Engine.GetNumAttachments( f225_local4 )
	local f225_local6 = CoD.perController[f225_arg0].attachmentType
	local f225_local7 = Engine.GetItemRef( f225_local4 )
	local f225_local8 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
	local f225_local9 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
	local f225_local10 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
	local f225_local11 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
	local f225_local12 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
	local f225_local13 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
	local f225_local14 = {
		damage = 0,
		range = 0,
		fireRate = 0,
		accuracy = 0
	}
	local f225_local15 = CoD.CACUtility.GetAttachmentListForSlot( f225_local2 )
	local f225_local16 = {}
	for f225_local27, f225_local28 in ipairs( f225_local15 ) do
		local f225_local29 = Engine.GetModelValue( Engine.GetModel( f225_local3, f225_local28 .. ".itemIndex" ) )
		if f225_local28 ~= f225_local2 and CoD.CACUtility.EmptyItemIndex < f225_local29 then
			local f225_local20 = Engine.GetAttachmentRef( f225_local4, f225_local29 )
			table.insert( f225_local16, f225_local20 )
			local f225_local21 = Engine.TableLookup( nil, CoD.weaponAttributes, f225_local8, f225_local20, f225_local9, f225_local7, f225_local10 )
			local f225_local22 = Engine.TableLookup( nil, CoD.weaponAttributes, f225_local8, f225_local20, f225_local9, f225_local7, f225_local11 )
			local f225_local23 = Engine.TableLookup( nil, CoD.weaponAttributes, f225_local8, f225_local20, f225_local9, f225_local7, f225_local12 )
			local f225_local24 = Engine.TableLookup( nil, CoD.weaponAttributes, f225_local8, f225_local20, f225_local9, f225_local7, f225_local13 )
			local f225_local25 = f225_local14.damage
			local f225_local26
			if f225_local21 == "" then
				f225_local26 = 0
				if not f225_local26 then
				
				else
					f225_local14.damage = f225_local25 + f225_local26
					f225_local25 = f225_local14.range
					if f225_local22 == "" then
						f225_local26 = 0
						if not f225_local26 then
						
						else
							f225_local14.range = f225_local25 + f225_local26
							f225_local25 = f225_local14.fireRate
							if f225_local23 == "" then
								f225_local26 = 0
								if not f225_local26 then
								
								else
									f225_local14.fireRate = f225_local25 + f225_local26
									f225_local25 = f225_local14.accuracy
									if f225_local24 == "" then
										f225_local26 = 0
										if not f225_local26 then
										
										else
											f225_local14.accuracy = f225_local25 + f225_local26
										end
									end
									f225_local26 = f225_local24
								end
							end
							f225_local26 = f225_local23
						end
					end
					f225_local26 = f225_local22
				end
			end
			f225_local26 = f225_local21
		end
	end
	for f225_local17 = 1, f225_local5 - 1, 1 do
		f225_local28 = CoD.CACUtility.EmptyItemIndex
		if f225_local6 == "attachment" then
			if Engine.IsOptic( f225_local4, f225_local17 ) == false then
				f225_local28 = Engine.GetItemAttachment( f225_local4, f225_local17 )
			end
		elseif f225_local6 == "optic" and Engine.IsOptic( f225_local4, f225_local17 ) == true then
			f225_local28 = Engine.GetItemAttachment( f225_local4, f225_local17 )
		end
		if CoD.CACUtility.EmptyItemIndex < f225_local28 and Engine.GetAttachmentAllocationCost( f225_local4, f225_local17 ) > 0 then
			local f225_local20 = Engine.GetAttachmentRef( f225_local4, f225_local17 )
			local f225_local21 = Engine.GetAttachmentNameByIndex( f225_local28 )
			local f225_local22 = Engine.GetAttachmentUniqueImageByIndex( f225_local4, f225_local17 )
			local f225_local24 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" ), f225_local4 .. ".weaponAttributes" )
			local f225_local25 = function ( f226_arg0, f226_arg1 )
				local f226_local0 = Engine.GetModelValue( Engine.GetModel( f225_local24, f226_arg0 ) )
				local f226_local1 = Engine.TableLookup( nil, CoD.weaponAttributes, f225_local8, f225_local20, f225_local9, f225_local7, f226_arg1 )
				if f226_local0 == "" then
					f226_local0 = 0
				end
				if f226_local1 == "" then
					f226_local1 = 0
				end
				local f226_local2 = false
				for f226_local6, f226_local7 in ipairs( f225_local16 ) do
					if f226_local7 == f225_local20 then
						f226_local2 = true
						break
					end
				end
				f226_local3 = f226_local0 + f225_local14[f226_arg0]
				if not f226_local2 then
					f226_local3 = f226_local3 + f226_local1
				end
				return f226_local0 .. "," .. f226_local3
			end
			
			table.insert( f225_local0, {
				models = {
					name = f225_local21,
					image = f225_local22,
					itemIndex = f225_local17,
					weaponIndex = f225_local4,
					attachmentIndex = f225_local28,
					itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT,
					weaponSlot = f225_local2,
					weaponIndex = f225_local4,
					description = Engine.GetAttachmentDesc( f225_local4, f225_local17 ),
					weaponAttributes = {
						damage = f225_local25( "damage", f225_local10 ),
						range = f225_local25( "range", f225_local11 ),
						fireRate = f225_local25( "fireRate", f225_local12 ),
						accuracy = f225_local25( "accuracy", f225_local13 )
					}
				},
				properties = {
					weaponIndex = f225_local4,
					attachmentTableIndex = f225_local28,
					acvIndex = CoD.CACUtility.EmptyItemIndex
				}
			} )
		end
	end
	return f225_local0
end, true )
DataSources.EquippedBubbleGumPack = {
	getModel = function ( f227_arg0 )
		local f227_local0 = Engine.CreateModel( Engine.GetModelForController( f227_arg0 ), "EquippedBubbleGumPack" )
		Engine.SetModelValue( Engine.CreateModel( f227_local0, "bgbPackIndex" ), Engine.GetEquippedBubbleGumPack( f227_arg0 ) )
		return f227_local0
	end
}
DataSources.BubbleGumBuffs = {
	prepare = function ( f228_arg0, f228_arg1, f228_arg2 )
		f228_arg1.rootModel = DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( f228_arg0, Engine.GetModelForController( f228_arg0 ), Engine.GetEquippedBubbleGumPack( f228_arg0 ) )
	end,
	getCount = function ( f229_arg0 )
		return CoD.BubbleGumBuffs.NumBuffsPerPack
	end,
	getItem = function ( f230_arg0, f230_arg1, f230_arg2 )
		if f230_arg1:getParent() then
			local f230_local0 = f230_arg1:getParent()
			return f230_local0:getModel( f230_arg0, "BubbleGumBuffs." .. f230_arg2 )
		else
			return Engine.CreateModel( Engine.GetModelForController( f230_arg0 ), "BubbleGumBuffs." .. f230_arg2 )
		end
	end,
	setupBubbleGumBuffsModel = function ( f231_arg0, f231_arg1, f231_arg2 )
		local f231_local0 = Engine.CreateModel( f231_arg1, "BubbleGumBuffs" )
		for f231_local1 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
			local f231_local4 = Engine.CreateModel( f231_local0, f231_local1 + 1 )
			local f231_local5 = Engine.GetBubbleGumBuff( f231_arg0, f231_arg2, f231_local1 )
			local f231_local6 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "Unlockables." .. f231_local5 .. ".dlcIndex" )
			Engine.SetModelValue( Engine.CreateModel( f231_local4, "bgbIndex" ), f231_local1 )
			Engine.SetModelValue( Engine.CreateModel( f231_local4, "itemIndex" ), f231_local5 )
			Engine.SetModelValue( Engine.CreateModel( f231_local4, "dlcIndex" ), f231_local6 )
			if IsInGame() then
				Engine.SetModelValue( Engine.CreateModel( f231_local4, "remaining" ), GetConsumableCountFromIndex( f231_arg0, f231_local5 ) )
			end
		end
	end,
	cleanup = function ( f232_arg0 )
		if f232_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f232_arg0.rootModel )
			f232_arg0.rootModel = nil
		end
	end
}
DataSources.BubbleGumPacks = {
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
}
DataSources.GobbleGumRecipeResultList = ListHelper_SetupDataSource( "GobbleGumRecipeResultList", function ( f237_arg0 )
	local f237_local0 = {}
	local f237_local1 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipes( f237_arg0 )
	if #f237_local1 then
		local f237_local2 = Engine.GetPlayerStats( f237_arg0 )
		for f237_local6, f237_local7 in ipairs( f237_local1 ) do
			table.insert( f237_local0, {
				models = f237_local7.result,
				properties = {
					haveAllIngredients = f237_local7.haveAllIngredients,
					recipeIndex = f237_local7.recipeIndex
				}
			} )
		end
	end
	return f237_local0
end, true, nil, function ( f238_arg0, f238_arg1, f238_arg2 )
	if not f238_arg1.scheduleIndexSubscription then
		f238_arg1.scheduleIndexSubscription = f238_arg1:subscribeToModel( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f238_arg0 ), "scheduleIndex" ), function ( model )
			f238_arg1:updateDataSource()
		end, false )
	end
	if not f238_arg1.recipeUpdateSubscription then
		f238_arg1.recipeUpdateSubscription = f238_arg1:subscribeToModel( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f238_arg0 ), "update" ), function ( model )
			f238_arg1:updateDataSource()
		end, false )
	end
end )
DataSources.GobbleGumRecipeIngredientList = ListHelper_SetupDataSource( "GobbleGumRecipeIngredientList", function ( f241_arg0 )
	local f241_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f241_arg0 )
	if not f241_local0 then
		return nil
	end
	local f241_local1 = {}
	local f241_local2 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f241_arg0, Engine.GetModelValue( Engine.GetModel( f241_local0, "recipeIndex" ) ) )
	if f241_local2 then
		for f241_local6, f241_local7 in ipairs( f241_local2.ingredients ) do
			table.insert( f241_local1, {
				models = f241_local7
			} )
		end
	end
	Engine.SetModelValue( Engine.GetModel( f241_local0, "haveAllIngredients" ), f241_local2.haveAllIngredients )
	return f241_local1
end, true, nil, function ( f242_arg0, f242_arg1, f242_arg2 )
	if not f242_arg1.recipeUpdateSubscription then
		f242_arg1.recipeUpdateSubscription = f242_arg1:subscribeToModel( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f242_arg0 ), "update" ), function ( model )
			local f243_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f242_arg0 )
			local f243_local1 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f242_arg0, Engine.GetModelValue( Engine.GetModel( f243_local0, "recipeIndex" ) ) )
			Engine.SetModelValue( Engine.GetModel( f243_local0, "haveAllIngredients" ), f243_local1.haveAllIngredients )
		end, false )
	end
end )
DataSources.GobbleGumRecipeResult = {
	getModel = function ( f244_arg0 )
		local f244_local0 = Engine.CreateModel( Engine.GetModelForController( f244_arg0 ), "GobbleGumRecipeResult" )
		local f244_local1 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f244_arg0, Engine.GetModelValue( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f244_arg0 ), "recipeIndex" ) ) )
		if f244_local1 then
			f244_local1.result.fractionText = f244_local1.result.count
			ListHelper_CreateModelsFromTable( f244_local0, f244_local1.result )
		end
		return f244_local0
	end
}
DataSources.BubbleGumTabType = ListHelper_SetupDataSource( "BubbleGumTabType", function ( f245_arg0 )
	local f245_local0 = {}
	table.insert( f245_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f245_local0, {
		models = {
			tabName = Engine.Localize( "ZMUI_BUBBLEGUM_TAB_NAME_CAPS" ),
			breadcrumbCount = Engine.WeaponGroupNewItemCount( f245_arg0, "bubblegum", "", Enum.eModes.MODE_ZOMBIES )
		},
		properties = {
			filter = "bubblegum"
		}
	} )
	if IsProgressionEnabled( f245_arg0 ) and not IsInPermanentUnlockMenu( f245_arg0 ) then
		table.insert( f245_local0, {
			models = {
				tabName = Engine.Localize( "ZMUI_MEGACHEW_CAPS" ),
				breadcrumbCount = Engine.WeaponGroupNewItemCount( f245_arg0, "bubblegum_consumable", "", Enum.eModes.MODE_ZOMBIES )
			},
			properties = {
				filter = "bubblegum_consumable"
			}
		} )
	end
	table.insert( f245_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f245_local0
end, true )
DataSources.MegaChewTokens = {
	getModel = function ( f246_arg0 )
		local f246_local0 = Engine.CreateModel( Engine.GetModelForController( f246_arg0 ), "MegaChewTokens" )
		Engine.SetModelValue( Engine.CreateModel( f246_local0, "remainingTokens" ), Engine.IsLootReady( f246_arg0 ) and Engine.GetZMVials( f246_arg0 ) or -1 )
		return f246_local0
	end
}
DataSources.GobbleGumDistills = {
	getModel = function ( f247_arg0 )
		local f247_local0 = Engine.CreateModel( Engine.GetModelForController( f247_arg0 ), "GobbleGumDistills" )
		local f247_local1 = Engine.CreateModel( f247_local0, "freeDistills" )
		local f247_local2 = Engine.CreateModel( f247_local0, "paidDistills" )
		Engine.SetModelValue( f247_local1, Engine.IsLootReady( f247_arg0 ) and Engine.GetInventoryItemQuantity( f247_arg0, Engine.DvarInt( nil, "loot_distill_free_balance_id" ) ) or -1 )
		Engine.SetModelValue( f247_local2, Engine.IsLootReady( f247_arg0 ) and Engine.GetInventoryItemQuantity( f247_arg0, Engine.DvarInt( nil, "loot_distill_paid_balance_id" ) ) or -1 )
		if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
			Engine.SetModelValue( f247_local1, CoD.BubbleGumBuffUtility.Debug.DistillList[CoD.BubbleGumBuffUtility.FREE_DISTILL].uses )
			Engine.SetModelValue( f247_local2, CoD.BubbleGumBuffUtility.GetTotalRemainingDistills( f247_arg0 ) - CoD.BubbleGumBuffUtility.Debug.DistillList[CoD.BubbleGumBuffUtility.FREE_DISTILL].uses )
		end
		Engine.SetModelValue( Engine.CreateModel( f247_local0, "totalDistills" ), Engine.GetModelValue( f247_local1 ) + Engine.GetModelValue( f247_local2 ) )
		return f247_local0
	end
}
DataSources.MegaChewMachines = {
	getModel = function ( f248_arg0 )
		local f248_local0 = Engine.CreateModel( Engine.GetModelForController( f248_arg0 ), "MegaChewMachines" )
		for f248_local1 = 0, 2, 1 do
			local f248_local4 = Engine.CreateModel( f248_local0, "machine" .. f248_local1 )
			local f248_local5 = f248_local1
			local f248_local6 = f248_local1 + 1
			Engine.SetModelValue( Engine.CreateModel( f248_local4, "index" ), f248_local5 )
			Engine.SetModelValue( Engine.CreateModel( f248_local4, "price" ), f248_local6 )
		end
		return f248_local0
	end
}
DataSources.ClientDemoFiles = {
	prepare = function ( f249_arg0, f249_arg1, f249_arg2 )
		f249_arg1.clientDemoFiles = {}
		local f249_local0 = Engine.GetClientDemoFileCount()
		local f249_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "ClientDemo" )
		for f249_local2 = 1, f249_local0, 1 do
			local f249_local5 = f249_local2 - 1
			local f249_local6 = Engine.GetClientDemoFileInfo( f249_local5 )
			local f249_local7 = Engine.CreateModel( f249_local1, f249_local5 )
			Engine.SetModelValue( Engine.CreateModel( f249_local7, "index" ), f249_local5 )
			Engine.SetModelValue( Engine.CreateModel( f249_local7, "fileName" ), f249_local6.fileName )
			Engine.SetModelValue( Engine.CreateModel( f249_local7, "gameType" ), f249_local6.gameType )
			Engine.SetModelValue( Engine.CreateModel( f249_local7, "mapName" ), f249_local6.mapName )
			Engine.SetModelValue( Engine.CreateModel( f249_local7, "authorName" ), f249_local6.authorName )
			Engine.SetModelValue( Engine.CreateModel( f249_local7, "createTime" ), f249_local6.createTime )
			Engine.SetModelValue( Engine.CreateModel( f249_local7, "duration" ), f249_local6.duration )
			table.insert( f249_arg1.clientDemoFiles, f249_local7 )
		end
	end,
	getCount = function ( f250_arg0 )
		return #f250_arg0.clientDemoFiles
	end,
	getItem = function ( f251_arg0, f251_arg1, f251_arg2 )
		return f251_arg1.clientDemoFiles[f251_arg2]
	end
}
DataSources.TheaterSelectFilmTabs = ListHelper_SetupDataSource( "TheaterSelectFilmTabs", function ( f252_arg0 )
	local f252_local0 = {}
	table.insert( f252_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f252_local0, {
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
	table.insert( f252_local0, {
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
	table.insert( f252_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f252_local0
end )
DataSources.Demo = {
	getModel = function ( f253_arg0 )
		if not f253_arg0 then
			f253_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetGlobalModel(), "demo" )
	end
}
DataSources.DemoControlsButtons = {
	prepare = function ( f254_arg0, f254_arg1, f254_arg2 )
		f254_arg1.buttons = {}
		local f254_local0 = {}
		local f254_local1 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isPaused" )
		local f254_local2 = Engine.GetModelValue( f254_local1 )
		local f254_local3 = Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" )
		local f254_local4 = Engine.GetModel( Engine.GetGlobalModel(), "demo.clipState" )
		local f254_local5 = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
		local f254_local6 = Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" )
		local f254_local7 = Engine.GetModel( Engine.GetGlobalModel(), "demo.freeCameraMode" )
		local f254_local8 = Engine.GetModel( Engine.GetGlobalModel(), "demo.keyframeForJumpBack" )
		local f254_local9 = Engine.GetModel( Engine.GetGlobalModel(), "demo.keyframeForJumpForward" )
		local f254_local10 = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerForJumpBack" )
		local f254_local11 = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerForJumpForward" )
		local f254_local12 = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerCount" )
		local f254_local13 = Engine.GetModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" )
		local f254_local14 = Engine.GetModelValue( f254_local13 )
		local f254_local15 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleMode" )
		local f254_local16 = Engine.GetModelValue( f254_local15 )
		local f254_local17 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningDollyCamMarker" )
		local f254_local18 = Engine.GetModelValue( f254_local17 )
		local f254_local19 = Engine.GetModel( Engine.GetGlobalModel(), "demo.lightmanMarkerCount" )
		local f254_local20 = Engine.GetModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" )
		local f254_local21 = Engine.GetModelValue( f254_local20 )
		local f254_local22 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightMode" )
		local f254_local23 = Engine.GetModelValue( f254_local22 )
		local f254_local24 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningLightmanMarker" )
		local f254_local25 = Engine.GetModelValue( f254_local24 )
		local f254_local26 = Engine.GetModel( Engine.GetGlobalModel(), "demo.isCreatingHighlightReel" )
		local f254_local27 = Engine.GetModelValue( f254_local26 )
		local f254_local28 = Engine.GetModel( Engine.GetGlobalModel(), "demo.networkProfiling" )
		local f254_local29 = Engine.GetModelValue( f254_local28 )
		local f254_local30 = function ( f255_arg0 )
			if 6 <= f255_arg0 then
				return "theater_fastforward_3"
			elseif f255_arg0 >= 4 then
				return "theater_fastforward_2"
			elseif f255_arg0 >= 2 then
				return "theater_fastforward_1"
			else
				return "theater_fastforward"
			end
		end
		
		local f254_local31 = function ( f256_arg0 )
			if f256_arg0 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
				return "theater_draw_straight"
			elseif f256_arg0 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
				return "theater_draw_angle"
			else
				return "theater_draw"
			end
		end
		
		local f254_local32 = function ( f257_arg0 )
			if f257_arg0 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
				return "DEMO_DOLLY_CAMERA_SPEED_MODE_FIXED_HINT"
			elseif f257_arg0 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
				return "DEMO_DOLLY_CAMERA_SPEED_MODE_LINEAR_HINT"
			else
				return "DEMO_DOLLY_CAMERA_SPEED_MODE_MANUAL_HINT"
			end
		end
		
		local f254_local33 = function ( f258_arg0 )
			if f258_arg0 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
				return "theater_light_omni"
			else
				return "theater_light_spot"
			end
		end
		
		local f254_local34 = function ( f259_arg0 )
			if f259_arg0 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
				return "DEMO_LIGHTMAN_LIGHT_MODE_OMNI_HINT"
			else
				return "DEMO_LIGHTMAN_LIGHT_MODE_SPOT_HINT"
			end
		end
		
		local f254_local35 = function ( f260_arg0 )
			if Engine.IsDemoClipRecording() then
				return "DEMO_STOP_RECORD_HINT"
			elseif Engine.IsDemoCameraEditMode() then
				return "DEMO_RECORD_AND_PLAY_DOLLY_CAMERA_HINT"
			elseif Engine.GetProfileVarInt( f260_arg0, "demo_recordWithAutoPlay" ) ~= 0 then
				return "DEMO_RECORD_AND_PLAY_HINT"
			else
				return "DEMO_RECORD_HINT"
			end
		end
		
		local f254_local36 = function ()
			CoD.DemoUtility.UnpauseIfPaused( f254_arg0 )
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_DOLLY )
		end
		
		local f254_local37 = function ( f262_arg0, f262_arg1, f262_arg2, f262_arg3, f262_arg4 )
			local f262_local0 = f262_arg1.btnId
			if f262_local0 == "screenshot" then
				Engine.Exec( f262_arg2, "demo_screenshot" )
			elseif f262_local0 == "record" then
				if Engine.IsDemoClipRecording() then
					Engine.Exec( f262_arg2, "demo_pausecliprecord" )
				else
					if Engine.IsDemoCameraEditMode() then
						f254_local36()
					end
					if Engine.GetProfileVarInt( f262_arg2, "demo_recordWithAutoPlay" ) ~= 0 then
						CoD.DemoUtility.UnpauseIfPaused( f262_arg2 )
					end
					Engine.Exec( f262_arg2, "demo_startcliprecord" )
				end
			elseif f262_local0 == "jumpback" then
				DemoJumpBack( f262_arg2 )
			elseif f262_local0 == "jumpforward" then
				Engine.Exec( f262_arg2, "demo_forward" )
			elseif f262_local0 == "play" or f262_local0 == "pause" then
				CoD.DemoUtility.RunPauseCommand( f262_arg2 )
			elseif f262_local0 == "fastforward" then
				Engine.SetModelValue( Engine.GetModel( f262_arg1:getModel(), "icon" ), f254_local30( UpdateDemoFastForward( f262_arg2 ) ) )
				Engine.SetModelValue( Engine.GetModel( f262_arg1:getModel(), "hintText" ), Engine.Localize( "DEMO_FAST_FORWARD_HINT", CoD.DemoUtility.GetRoundedTimeScale() ) )
			elseif f262_local0 == "options" then
				SetGlobalModelValueTrue( "demo.showOptionsSidebar" )
				OpenPopupWithPriority( f262_arg0:getParent(), "DemoOptionsSidebar", f262_arg2, 100 )
			elseif f262_local0 == "jumpbackdollycamera" then
				CoD.DemoUtility.SwitchToDollyCamMarker( f262_arg2, Engine.GetModelValue( f254_local10 ) )
			elseif f262_local0 == "playdollycamera" then
				f254_local36()
			elseif f262_local0 == "pausedollycamera" then
				Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_EDIT )
			elseif f262_local0 == "jumpforwarddollycamera" then
				CoD.DemoUtility.SwitchToDollyCamMarker( f262_arg2, Engine.GetModelValue( f254_local11 ) )
			elseif f262_local0 == "movedollycameramarker" then
				if f254_local18 then
					DemoPlaceDollyCameraMarker( f262_arg2 )
				else
					CoD.DemoUtility.RepositionDollyCamMarker( f262_arg2, Engine.GetHighlightedCameraMarker() )
				end
			elseif f262_local0 == "deletedollycameramarker" then
				CoD.DemoUtility.RemoveDollyCamMarker( f262_arg2, Engine.GetHighlightedCameraMarker() )
				CoD.DemoUtility.SetEditingDollyCameraMarker( f262_arg2, false )
			elseif f262_local0 == "deletealldollycameramarkers" then
				CoD.OverlayUtility.CreateOverlay( f262_arg2, f262_arg4:getParent(), "DemoDeleteAllDollyCameraMarkers" )
			elseif f262_local0 == "movelightmanmarker" then
				if f254_local25 then
					DemoPlaceLightmanMarker( f262_arg2 )
				else
					CoD.DemoUtility.RepositionLightmanMarker( f262_arg2, Engine.GetHighlightedCameraMarker() )
				end
			elseif f262_local0 == "lightmanlightcolor" then
				OpenPopupWithPriority( f262_arg4:getParent(), "LightmanColorPicker", f262_arg2, 200 )
				Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.showLightmanColorPicker" ), true )
			elseif f262_local0 == "deletelightmanmarker" then
				CoD.DemoUtility.RemoveLightmanMarker( f262_arg2, Engine.GetHighlightedCameraMarker() )
				CoD.DemoUtility.SetEditingLightmanMarker( f262_arg2, false )
			elseif f262_local0 == "deletealllightmanmarkers" then
				CoD.OverlayUtility.CreateOverlay( f262_arg2, f262_arg4:getParent(), "DemoDeleteAllLightmanMarkers" )
			end
		end
		
		if f254_local29 == true then
			if f254_local2 == true then
				table.insert( f254_local0, {
					btnId = "play",
					icon = "theater_play",
					hintText = "DEMO_PLAY_HINT"
				} )
			else
				table.insert( f254_local0, {
					btnId = "pause",
					icon = "theater_pause",
					hintText = "DEMO_PAUSE_HINT"
				} )
			end
		elseif IsDemoClipPreviewRunning() or f254_local27 then
			table.insert( f254_local0, {
				btnId = "dummy",
				icon = "theater_move",
				hintText = "",
				disabled = true
			} )
		elseif f254_local14 then
			table.insert( f254_local0, {
				btnId = "movedollycameramarker",
				icon = "theater_move",
				hintText = "DEMO_MOVE_DOLLY_CAMERA_HINT"
			} )
			table.insert( f254_local0, {
				btnId = "dollycameraspeedmode",
				icon = f254_local31( f254_local16 ),
				hintText = f254_local32( f254_local16 ),
				disabled = f254_local18 == true
			} )
			local f254_local38 = table.insert
			local f254_local39 = f254_local0
			local f254_local40 = {
				btnId = "dollycameratimescale",
				icon = nil,
				hintText = "DEMO_DOLLY_CAMERA_SPEED_HINT"
			}
			local f254_local41
			if f254_local16 ~= Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL and f254_local18 ~= true then
				f254_local41 = false
			else
				f254_local41 = true
			end
			f254_local40.disabled = f254_local41
			f254_local38( f254_local39, f254_local40 )
			table.insert( f254_local0, {
				btnId = "deletedollycameramarker",
				icon = "theater_video_x",
				hintText = "DEMO_DOLLY_CAMERA_DELETE_HINT",
				disabled = f254_local18 == true
			} )
			table.insert( f254_local0, {
				btnId = "deletealldollycameramarkers",
				icon = "theater_video_xx",
				hintText = "DEMO_DOLLY_CAMERA_DELETE_ALL_HINT",
				disabled = f254_local18 == true
			} )
		elseif f254_local21 then
			table.insert( f254_local0, {
				btnId = "movelightmanmarker",
				icon = "theater_move",
				hintText = "DEMO_MOVE_LIGHT_HINT"
			} )
			table.insert( f254_local0, {
				btnId = "lightmanlightmode",
				icon = f254_local33( f254_local23 ),
				hintText = f254_local34( f254_local23 ),
				disabled = f254_local25 == true
			} )
			table.insert( f254_local0, {
				btnId = "lightmanlightintensity",
				icon = "theater_light_intensity",
				hintText = "DEMO_LIGHT_INTENSITY_HINT",
				disabled = f254_local25 == true
			} )
			table.insert( f254_local0, {
				btnId = "lightmanlightrange",
				icon = "theater_light_range",
				hintText = "DEMO_LIGHT_RANGE_HINT",
				disabled = f254_local25 == true
			} )
			table.insert( f254_local0, {
				btnId = "lightmanlightcolor",
				icon = "theater_light_color",
				hintText = "DEMO_LIGHT_COLOR_HINT",
				disabled = f254_local25 == true
			} )
			table.insert( f254_local0, {
				btnId = "deletelightmanmarker",
				icon = "theater_video_x",
				hintText = "DEMO_LIGHT_DELETE_HINT",
				disabled = f254_local25 == true
			} )
			table.insert( f254_local0, {
				btnId = "deletealllightmanmarkers",
				icon = "theater_video_xx",
				hintText = "DEMO_LIGHT_DELETE_ALL_HINT",
				disabled = f254_local25 == true
			} )
		else
			if not IsDemoRestrictedBasicMode() then
				if not IsDemoContextPlaybackMode() and not IsDemoContextHighlightReelMode() then
					table.insert( f254_local0, {
						btnId = "screenshot",
						icon = "theater_photo",
						hintText = "DEMO_SCREENSHOT_HINT"
					} )
					table.insert( f254_local0, {
						btnId = "record",
						icon = "theater_record",
						hintText = f254_local35( f254_arg0 ),
						spacerWidth = 10
					} )
				else
					table.insert( f254_local0, {
						btnId = "screenshot",
						icon = "theater_photo",
						hintText = "DEMO_SCREENSHOT_HINT",
						spacerWidth = 10
					} )
				end
			end
			table.insert( f254_local0, {
				btnId = "jumpback",
				icon = "theater_back",
				hintText = "DEMO_JUMP_BACK_HINT",
				disabled = Engine.GetModelValue( f254_local8 ) == -1
			} )
			if IsDemoContextDirectorMode() then
				local f254_local38 = false
				local f254_local39 = false
				local f254_local40 = "DEMO_JUMP_BACK_DOLLY_CAMERA_HINT"
				if Engine.GetModelValue( f254_local10 ) == -1 then
					f254_local38 = true
					f254_local39 = true
					f254_local40 = "DEMO_KEYFRAME_REQUIRED"
				end
				table.insert( f254_local0, {
					btnId = "jumpbackdollycamera",
					icon = "theater_back_active",
					hintText = f254_local40,
					disabled = f254_local38,
					disabledWithFocus = f254_local39
				} )
			end
			if f254_local2 == true then
				table.insert( f254_local0, {
					btnId = "play",
					icon = "theater_play",
					hintText = "DEMO_PLAY_HINT"
				} )
			else
				table.insert( f254_local0, {
					btnId = "pause",
					icon = "theater_pause",
					hintText = "DEMO_PAUSE_HINT"
				} )
			end
			if IsDemoContextDirectorMode() then
				if Engine.IsDemoDollyCamera() then
					table.insert( f254_local0, {
						btnId = "pausedollycamera",
						icon = "theater_video_pause",
						hintText = "DEMO_PAUSE_DOLLY_CAMERA_HINT"
					} )
				else
					local f254_local38 = "DEMO_PLAY_DOLLY_CAMERA_HINT"
					local f254_local39 = false
					if Engine.GetModelValue( f254_local12 ) <= 0 then
						f254_local38 = "DEMO_PLAY_DOLLY_CAMERA_NOMARKERS_HINT"
						f254_local39 = true
					end
					table.insert( f254_local0, {
						btnId = "playdollycamera",
						icon = "theater_video_play",
						hintText = f254_local38,
						disabled = f254_local39
					} )
				end
			end
			if not IsDemoContextPlaybackMode() then
				table.insert( f254_local0, {
					btnId = "fastforward",
					icon = f254_local30( CoD.DemoUtility.GetRoundedTimeScale() ),
					hintText = Engine.Localize( "DEMO_FAST_FORWARD_HINT", CoD.DemoUtility.GetRoundedTimeScale() )
				} )
			end
			if IsDemoContextDirectorMode() then
				local f254_local38 = false
				local f254_local39 = false
				local f254_local40 = "DEMO_JUMP_FORWARD_DOLLY_CAMERA_HINT"
				if Engine.GetModelValue( f254_local11 ) == -1 then
					f254_local38 = true
					f254_local39 = true
					f254_local40 = "DEMO_KEYFRAME_REQUIRED"
				end
				table.insert( f254_local0, {
					btnId = "jumpforwarddollycamera",
					icon = "theater_forward_active",
					hintText = f254_local40,
					disabled = f254_local38,
					disabledWithFocus = f254_local39
				} )
			end
			table.insert( f254_local0, {
				btnId = "jumpforward",
				icon = "theater_forward",
				hintText = "DEMO_JUMP_FORWARD_HINT",
				disabled = Engine.GetModelValue( f254_local9 ) == -1
			} )
			if not IsDemoContextPlaybackMode() then
				table.insert( f254_local0, {
					btnId = "timescale",
					icon = nil,
					hintText = "DEMO_TIMESCALE_HINT"
				} )
				if IsDemoContextBasicOrHighlightReelMode() then
					table.insert( f254_local0, {
						btnId = "cameramode",
						icon = "theater_video",
						hintText = "DEMO_CHANGE_CAMERA_HINT"
					} )
				end
				if not IsDemoRestrictedBasicMode() and not Engine.IsDemoClipPlaying() then
					table.insert( f254_local0, {
						btnId = "options",
						icon = "theater_settings",
						hintText = "DEMO_OPTIONS_HINT"
					} )
				end
			end
		end
		for f254_local41, f254_local42 in ipairs( f254_local0 ) do
			local f254_local43 = {
				btnId = f254_local42.btnId,
				spacerWidth = f254_local42.spacerWidth
			}
			local f254_local44 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "DemoControls" ), "buttonModel_" .. f254_local41 )
			table.insert( f254_arg1.buttons, {
				model = f254_local44,
				properties = f254_local43
			} )
			Engine.SetModelValue( Engine.CreateModel( f254_local44, "btnId" ), f254_local42.btnId )
			Engine.SetModelValue( Engine.CreateModel( f254_local44, "icon" ), f254_local42.icon )
			Engine.SetModelValue( Engine.CreateModel( f254_local44, "hintText" ), Engine.Localize( f254_local42.hintText ) )
			Engine.SetModelValue( Engine.CreateModel( f254_local44, "action" ), f254_local37 )
			if f254_local42.disabled == true then
				Engine.SetModelValue( Engine.CreateModel( f254_local44, "disabled" ), true )
			else
				Engine.SetModelValue( Engine.CreateModel( f254_local44, "disabled" ), false )
			end
			if f254_local42.disabledWithFocus == true then
				Engine.SetModelValue( Engine.CreateModel( f254_local44, "disabledWithFocus" ), true )
			else
				Engine.SetModelValue( Engine.CreateModel( f254_local44, "disabledWithFocus" ), false )
			end
		end
		f254_local38 = function ()
			f254_arg1:updateDataSource()
		end
		
		if not f254_arg1.subscribedToModels then
			f254_arg1:subscribeToModel( f254_local1, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local6, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local7, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local8, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local9, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local3, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local4, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local5, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local10, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local11, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local12, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local13, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local15, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local17, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local19, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local20, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local22, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local24, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local26, f254_local38, false )
			f254_arg1:subscribeToModel( f254_local28, f254_local38, false )
			f254_arg1.subscribedToModels = true
		end
	end,
	getCount = function ( f264_arg0 )
		return #f264_arg0.buttons
	end,
	getItem = function ( f265_arg0, f265_arg1, f265_arg2 )
		return f265_arg1.buttons[f265_arg2].model
	end,
	getCustomPropertiesForItem = function ( f266_arg0, f266_arg1 )
		return f266_arg0.buttons[f266_arg1].properties
	end,
	getSpacerAfterColumn = function ( f267_arg0, f267_arg1, f267_arg2 )
		if f267_arg0.buttons[f267_arg1].properties.spacerWidth then
			return f267_arg0.buttons[f267_arg1].properties.spacerWidth
		else
			return 0
		end
	end,
	getWidgetTypeForItem = function ( f268_arg0, f268_arg1, f268_arg2, f268_arg3 )
		local f268_local0 = f268_arg0.buttons[f268_arg3].properties.btnId
		if f268_local0 == "timescale" then
			return CoD.DemoControlsButtonTimeScale
		elseif f268_local0 == "dollycameratimescale" then
			return CoD.DemoControlsButtonDollyCameraTimeScale
		elseif f268_local0 == "cameramode" then
			return CoD.DemoControlsButtonCameraMode
		elseif f268_local0 == "dollycameraspeedmode" then
			return CoD.DemoControlsButtonDollyCameraSpeedMode
		elseif f268_local0 == "lightmanlightmode" then
			return CoD.DemoControlsButtonLightmanLightMode
		elseif f268_local0 == "lightmanlightintensity" or f268_local0 == "lightmanlightrange" then
			return CoD.DemoControlsButtonLightmanLightFloatParam
		else
			return CoD.DemoControlsButton
		end
	end
}
DataSources.DemoOptionsButtonList = ListHelper_SetupDataSource( "DemoOptionsButtonList", function ( f269_arg0 )
	local f269_local0 = {}
	local f269_local1 = {}
	table.insert( f269_local1, {
		name = "MENU_OFF",
		value = 0
	} )
	table.insert( f269_local1, {
		name = "MENU_ON",
		value = 1
	} )
	local f269_local2 = {}
	for f269_local3 = 1, 10, 1 do
		table.insert( f269_local2, {
			name = string.format( "%d", f269_local3 ),
			value = f269_local3
		} )
	end
	local f269_local3 = {
		{
			name = "RecordWithAutoPlay",
			displayText = "DEMO_OPTIONS_RECORD_WITH_AUTO_PLAY",
			hintText = "DEMO_OPTIONS_RECORD_WITH_AUTO_PLAY_HINT",
			profileVar = "demo_recordWithAutoPlay",
			options = f269_local1
		},
		{
			name = "ToggleGameHUD",
			displayText = "DEMO_OPTIONS_TOGGLE_GAME_HUD",
			hintText = "DEMO_OPTIONS_TOGGLE_GAME_HUD_HINT",
			profileVar = "demo_toggleGameHud",
			options = f269_local1,
			spacerHeight = 50
		},
		{
			name = "AutoDollyRecord",
			displayText = "DEMO_OPTIONS_AUTO_DOLLY_RECORD",
			hintText = "DEMO_OPTIONS_AUTO_DOLLY_RECORD_HINT",
			profileVar = "demo_autoDollyRecord",
			options = f269_local1
		},
		{
			name = "AutoDollyKeyframeInterval",
			displayText = "DEMO_OPTIONS_AUTO_DOLLY_KEYFRAME_INTERVAL",
			hintText = "DEMO_OPTIONS_AUTO_DOLLY_KEYFRAME_INTERVAL_HINT",
			profileVar = "demo_autoDollyKeyframeInterval",
			options = f269_local2
		}
	}
	local f269_local4 = function ( f270_arg0, f270_arg1, f270_arg2, f270_arg3, f270_arg4 )
		if f270_arg3 then
			Engine.SetProfileVar( f270_arg2, f270_arg3, f270_arg1.value )
			if f270_arg3 == "demo_toggleGameHud" then
				if f270_arg1.value == 1 then
					Engine.ExecNow( f270_arg2, "demo_hidegamehud 0" )
				else
					Engine.ExecNow( f270_arg2, "demo_hidegamehud 1" )
				end
			elseif f270_arg3 == "demo_autoDollyRecord" and f270_arg4.occludedMenu and f270_arg4.occludedMenu.Demo then
				UpdateElementState( f270_arg4.occludedMenu.Demo, "DemoPlaybackControlsButtonBar", f270_arg2 )
			elseif f270_arg3 == "demo_recordWithAutoPlay" and f270_arg4.occludedMenu and f270_arg4.occludedMenu.Demo and f270_arg4.occludedMenu.Demo.DemoPlaybackControls and f270_arg4.occludedMenu.Demo.DemoPlaybackControls.ButtonList then
				UpdateDataSource( f270_arg4.occludedMenu.Demo.DemoPlaybackControls, f270_arg4.occludedMenu.Demo.DemoPlaybackControls.ButtonList, f270_arg2 )
			end
		end
	end
	
	for f269_local8, f269_local9 in ipairs( f269_local3 ) do
		table.insert( f269_local0, {
			models = {
				displayText = f269_local9.displayText,
				hintText = f269_local9.hintText,
				buttonOnly = false,
				disabled = false,
				optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f269_arg0, "DemoOptionsButtonList_" .. f269_local9.name, f269_local9.options, f269_local9.profileVar, nil, f269_local4 ),
				currentSelection = CoD.OptionsUtility.GetProfileSelection( f269_arg0, f269_local9.options, f269_local9.profileVar ),
				selected = false
			},
			properties = {
				hideArrows = false,
				disabled = false,
				spacerHeight = f269_local9.spacerHeight
			}
		} )
	end
	return f269_local0
end, nil, nil, nil, function ( f271_arg0, f271_arg1, f271_arg2 )
	if f271_arg0.DemoOptionsButtonList[f271_arg1].properties.spacerHeight then
		return f271_arg0.DemoOptionsButtonList[f271_arg1].properties.spacerHeight
	else
		return f271_arg0.spacing
	end
end )
DataSources.DemoChooseModeButtonList = ListHelper_SetupDataSource( "DemoChooseModeButtonList", function ( f272_arg0 )
	local f272_local0 = {}
	local f272_local1 = function ( f273_arg0, f273_arg1, f273_arg2, f273_arg3, f273_arg4 )
		local f273_local0 = f273_arg1.btnId
		if CoD.DemoUtility.GetDemoContextMode() == Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC then
			CoD.perController[f273_arg2].prevDemoCameraMode = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ) )
		end
		if f273_local0 == "basic" then
			if CoD.perController[f273_arg2].prevDemoCameraMode then
				Engine.SwitchDemoCameraMode( CoD.perController[f273_arg2].prevDemoCameraMode )
			else
				Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE )
			end
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_FREEROAM )
			CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC )
		elseif f273_local0 == "director" then
			Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_EDIT )
			CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_DIRECTOR )
		elseif f273_local0 == "objectlink" then
			Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_LOCK_ON )
			CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_OBJECT_LINK )
		elseif f273_local0 == "lighter" then
			Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_LIGHTMAN )
			CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_LIGHTER )
		elseif f273_local0 == "timeline" then
			StartMenuOpenManageSegments( f273_arg0:getParent(), f273_arg1, f273_arg2, f273_arg3, f273_arg4 )
		end
	end
	
	local f272_local2 = {}
	if not IsDemoContextHighlightReelMode() then
		table.insert( f272_local2, {
			btnId = "basic",
			displayText = "DEMO_MODE_BASIC",
			hintText = "DEMO_MODE_BASIC_HINT",
			icon = "theater_play"
		} )
		table.insert( f272_local2, {
			btnId = "director",
			displayText = "DEMO_MODE_DIRECTOR",
			hintText = "DEMO_MODE_DIRECTOR_HINT",
			icon = "theater_video"
		} )
		table.insert( f272_local2, {
			btnId = "objectlink",
			displayText = "DEMO_MODE_OBJECT_LINK",
			hintText = "DEMO_MODE_OBJECT_LINK_HINT",
			icon = "theater_link"
		} )
		table.insert( f272_local2, {
			btnId = "lighter",
			displayText = "DEMO_MODE_LIGHTER",
			hintText = "DEMO_MODE_LIGHTER_HINT",
			icon = "theater_bulb"
		} )
	end
	table.insert( f272_local2, {
		btnId = "timeline",
		displayText = "DEMO_MODE_TIMELINE_EDITOR",
		hintText = "DEMO_MODE_TIMELINE_EDITOR_HINT",
		icon = "theater_timeline"
	} )
	for f272_local6, f272_local7 in ipairs( f272_local2 ) do
		table.insert( f272_local0, {
			models = {
				displayText = Engine.Localize( f272_local7.displayText ),
				hintText = Engine.Localize( f272_local7.hintText ),
				icon = f272_local7.icon,
				action = f272_local1
			},
			properties = {
				btnId = f272_local7.btnId
			}
		} )
	end
	return f272_local0
end )
DataSources.DemoFilmOptionsButtonList = ListHelper_SetupDataSource( "DemoFilmOptionsButtonList", function ( f274_arg0 )
	local f274_local0 = {}
	local f274_local1 = {}
	local f274_local2 = CoD.DemoUtility.Timeline_GetHighlightedSegmentModel()
	local f274_local3 = function ( f275_arg0, f275_arg1, f275_arg2, f275_arg3, f275_arg4 )
		local f275_local0 = f275_arg1.btnId
		local f275_local1, f275_local2 = nil
		if f274_local2 then
			f275_local2 = Engine.GetModelValue( Engine.GetModel( f274_local2, "segmentNumber" ) ) - 1
		end
		if f275_local0 == "preview" then
			Engine.Exec( f275_arg2, "demo_previewsegment " .. f275_local2 )
			GoBack( f275_arg0.occludedMenu, f275_arg2 )
		elseif f275_local0 == "delete" then
			CoD.OverlayUtility.CreateOverlay( f275_arg2, f275_arg0, "DemoDeleteSegment" )
		elseif f275_local0 == "rename" then
			OpenDemoKeyboard( f275_arg0, f275_arg1, f275_arg2, "segmentName", f275_local2 )
		elseif f275_local0 == "saveclip" then
			StartMenuUploadClip( f275_arg0, f275_arg1, f275_arg2, f275_arg3, f275_arg4 )
		elseif f275_local0 == "mergeall" then
			CoD.OverlayUtility.CreateOverlay( f275_arg2, f275_arg0, "DemoMergeAllSegments" )
		elseif f275_local0 == "deleteall" then
			CoD.OverlayUtility.CreateOverlay( f275_arg2, f275_arg0, "DemoDeleteAllSegments" )
		end
	end
	
	if f274_local2 ~= nil and Engine.GetModelValue( Engine.GetModel( f274_local2, "disabled" ) ) == false then
		table.insert( f274_local1, {
			btnId = "preview",
			displayText = "DEMO_VIEW_SHOT",
			hintText = "DEMO_VIEW_SHOT_HINT",
			icon = "theater_view"
		} )
		table.insert( f274_local1, {
			btnId = "delete",
			displayText = "DEMO_DELETE_SHOT",
			hintText = "DEMO_DELETE_SHOT_HINT",
			icon = "theater_delete"
		} )
		table.insert( f274_local1, {
			btnId = "rename",
			displayText = "DEMO_RENAME_SHOT",
			hintText = "DEMO_RENAME_SHOT_HINT",
			icon = "theater_rename",
			spacerHeight = 16
		} )
	end
	table.insert( f274_local1, {
		btnId = "saveclip",
		displayText = "DEMO_SAVE_CLIP",
		hintText = "DEMO_SAVE_CLIP_HINT",
		icon = "theater_save"
	} )
	if Engine.CanMergeSegments() == true then
		table.insert( f274_local1, {
			btnId = "mergeall",
			displayText = "DEMO_MERGE_ALL_SHOTS",
			hintText = "DEMO_MERGE_ALL_SHOTS_HINT",
			icon = "theater_merge"
		} )
	end
	table.insert( f274_local1, {
		btnId = "deleteall",
		displayText = "DEMO_DELETE_ALL_SHOTS",
		hintText = "DEMO_DELETE_ALL_SHOTS_HINT",
		icon = "theater_delete_all"
	} )
	for f274_local7, f274_local8 in ipairs( f274_local1 ) do
		table.insert( f274_local0, {
			models = {
				displayText = Engine.Localize( f274_local8.displayText ),
				hintText = Engine.Localize( f274_local8.hintText ),
				icon = f274_local8.icon,
				action = f274_local3
			},
			properties = {
				btnId = f274_local8.btnId,
				spacerHeight = f274_local8.spacerHeight
			}
		} )
	end
	return f274_local0
end, nil, nil, nil, function ( f276_arg0, f276_arg1, f276_arg2 )
	local f276_local0 = f276_arg0.DemoFilmOptionsButtonList[f276_arg1].properties.spacerHeight
	if f276_local0 then
		return f276_local0
	else
		return f276_arg0.spacing
	end
end )
DataSources.DemoSegments = {
	prepare = function ( f277_arg0, f277_arg1, f277_arg2 )
		f277_arg1.segments = {}
		local f277_local0 = 20
		local f277_local1 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" )
		for f277_local2 = 1, f277_local0, 1 do
			table.insert( f277_arg1.segments, {
				model = CoD.DemoUtility.SetupDemoSegmentModel( f277_local2 - 1 )
			} )
		end
		f277_arg1:subscribeToModel( f277_local1, function ()
			f277_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f279_arg0 )
		return #f279_arg0.segments
	end,
	getItem = function ( f280_arg0, f280_arg1, f280_arg2 )
		return f280_arg1.segments[f280_arg2].model
	end,
	getCustomPropertiesForItem = function ( f281_arg0, f281_arg1 )
		return f281_arg0.segments[f281_arg1]
	end
}
DataSources.DemoHighlightReelSettingsButtonList = ListHelper_SetupDataSource( "DemoHighlightReelSettingsButtonList", function ( f282_arg0 )
	local f282_local0 = {}
	local f282_local1 = Engine.CurrentSessionMode() == Enum.eModes.MODE_ZOMBIES
	local f282_local2 = function ( f283_arg0, f283_arg1, f283_arg2, f283_arg3 )
		CoD.DemoUtility.RebuildHighlightReelTimeline( f283_arg1 )
	end
	
	local f282_local3 = {}
	table.insert( f282_local3, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_ONLY_ME",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_ME
	} )
	table.insert( f282_local3, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_FRIENDS",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_FRIENDS
	} )
	table.insert( f282_local3, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_SELF_AND_FRIENDS",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_ME_AND_FRIENDS
	} )
	table.insert( f282_local3, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_FRIENDLY_TEAM",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_FRIENDLY_TEAM
	} )
	table.insert( f282_local3, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_ENEMY_TEAM",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_ENEMY_TEAM
	} )
	table.insert( f282_local3, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_EVERYONE",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_EVERYONE
	} )
	local f282_local4 = {}
	table.insert( f282_local4, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_BEST_MOMENTS",
		value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_BEST_MOMENTS
	} )
	if f282_local1 then
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_RAMPAGER",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_RAMPAGER
		} )
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_SAVIOR_AND_SINNER",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_SAVIOR_AND_SINNER
		} )
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_TEAM_PLAYER",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_TEAM_PLAYER
		} )
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_BIG_SPENDER",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_BIG_SPENDER
		} )
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_HANDYMAN",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_HANDYMAN
		} )
	else
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_EXPLOSIVE_AND_PROJECTILE",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_EXPLOSIVE_AND_PROJECTILE_KILLS
		} )
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_VEHICLE",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_VEHICLE_KILLS
		} )
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_GUN_KILLS_ONLY",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_ONLY
		} )
		table.insert( f282_local4, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_GUN_KILL_AND_EVENTS",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_AND_EVENTS
		} )
	end
	local f282_local5 = {}
	table.insert( f282_local5, {
		name = "5",
		value = 5
	} )
	table.insert( f282_local5, {
		name = "10",
		value = 10
	} )
	table.insert( f282_local5, {
		name = "20",
		value = 20
	} )
	local f282_local6 = {}
	table.insert( f282_local6, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_ONE",
		value = 1
	} )
	table.insert( f282_local6, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_TWO",
		value = 2
	} )
	table.insert( f282_local6, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_THREE",
		value = 3
	} )
	table.insert( f282_local6, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_FOUR",
		value = 4
	} )
	table.insert( f282_local6, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_FIVE",
		value = 5
	} )
	local f282_local7 = {}
	table.insert( f282_local7, {
		name = "MENU_DEMO_TRANSITION_CUT",
		value = Enum.demoHighlightReelTransitionFilter.DEMO_HIGHLIGHT_REEL_TRANSITION_FILTER_NONE
	} )
	table.insert( f282_local7, {
		name = "MENU_DEMO_TRANSITION_FADE",
		value = Enum.demoHighlightReelTransitionFilter.DEMO_HIGHLIGHT_REEL_TRANSITION_FILTER_FADE
	} )
	table.insert( f282_local7, {
		name = "MENU_RANDOM",
		value = Enum.demoHighlightReelTransitionFilter.DEMO_HIGHLIGHT_REEL_TRANSITION_FILTER_RANDOM
	} )
	local f282_local8 = {
		{
			name = "PlayerFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_DESC",
			dvarName = "demo_highlightReelPlayerFilter",
			options = f282_local3
		},
		{
			name = "StylesFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_DESC",
			dvarName = "demo_highlightReelStylesFilter",
			options = f282_local4
		},
		{
			name = "NumberOfSegmentsFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_NUMBER_OF_SEGMENTS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_NUMBER_OF_SEGMENTS_DESC",
			dvarName = "demo_highlightReelNumberOfSegments",
			options = f282_local5
		},
		{
			name = "StarsFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_STARS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_STARS_DESC",
			dvarName = "demo_highlightReelMinimumStarsFilter",
			options = f282_local6
		},
		{
			name = "TransitionFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_TRANSITION_SETTINGS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_TRANSITION_SETTINGS_DESC",
			dvarName = "demo_highlightReelTransitionFilter",
			options = f282_local7
		}
	}
	if f282_local1 == false then
		local f282_local9 = {}
		table.insert( f282_local9, {
			name = "MENU_NO",
			value = Enum.demoHighlightReelGameResultFilter.DEMO_HIGHLIGHT_REEL_GAME_RESULT_FILTER_OFF
		} )
		table.insert( f282_local9, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_FINAL",
			value = Enum.demoHighlightReelGameResultFilter.DEMO_HIGHLIGHT_REEL_GAME_RESULT_FILTER_FINAL_RESULT
		} )
		table.insert( f282_local9, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_WITH_EVENTS",
			value = Enum.demoHighlightReelGameResultFilter.DEMO_HIGHLIGHT_REEL_GAME_RESULT_FILTER_WITH_EVENTS
		} )
		table.insert( f282_local9, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_ALL",
			value = Enum.demoHighlightReelGameResultFilter.DEMO_HIGHLIGHT_REEL_GAME_RESULT_FILTER_ALL_RESULTS
		} )
		table.insert( f282_local8, {
			name = "GameResultFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_SETTINGS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_SETTINGS_DESC",
			dvarName = "demo_highlightReelGameResultFilter",
			options = f282_local9
		} )
	end
	for f282_local12, f282_local13 in ipairs( f282_local8 ) do
		table.insert( f282_local0, {
			models = {
				displayText = f282_local13.displayText,
				hintText = f282_local13.hintText,
				buttonOnly = false,
				disabled = false,
				optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f282_arg0, "DemoHighlightReelSettingsButtonList_" .. f282_local13.name, f282_local13.options, f282_local13.dvarName, f282_local2, CoD.DemoUtility.Options_ItemSelected, CoD.DemoUtility.Options_RevertItemSelected ),
				currentSelection = CoD.DemoUtility.Options_GetProfileSelection( f282_arg0, f282_local13.options, f282_local13.dvarName ),
				selected = false
			},
			properties = {
				hideArrows = false,
				disabled = false
			}
		} )
	end
	return f282_local0
end )
DataSources.HeroWeapon = {
	getModel = function ( f284_arg0 )
		if not f284_arg0 then
			f284_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f284_arg0 ), "playerAbilities.playerGadget3" )
	end
}
DataSources.CurrentWeapon = {
	getModel = function ( f285_arg0 )
		if not f285_arg0 then
			f285_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f285_arg0 ), "currentWeapon" )
	end
}
DataSources.CurrentPrimaryOffhand = {
	getModel = function ( f286_arg0 )
		if not f286_arg0 then
			f286_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f286_arg0 ), "currentPrimaryOffhand" )
	end
}
DataSources.CurrentSecondaryOffhand = {
	getModel = function ( f287_arg0 )
		if not f287_arg0 then
			f287_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f287_arg0 ), "currentSecondaryOffhand" )
	end
}
DataSources.HUDItems = {
	getModel = function ( f288_arg0 )
		if not f288_arg0 then
			f288_arg0 = Engine.GetPrimaryController()
		end
		local f288_local0 = Engine.GetModelForController( f288_arg0 )
		local f288_local1 = Engine.CreateModel( f288_local0, "hudItems" )
		if not IsLuaCodeVersionAtLeast( 17 ) then
			Engine.SetModelValue( Engine.CreateModel( f288_local1, "colorBlindSensitiveFriendlyColor" ), CoD.ConvertColor( CoD.ExplodeColor( ColorSet.FriendlyBlue ) ) )
			Engine.SetModelValue( Engine.CreateModel( f288_local1, "colorBlindSensitiveEnemyColor" ), CoD.ConvertColor( CoD.ExplodeColor( ColorSet.EnemyOrange ) ) )
			Engine.SetModelValue( Engine.CreateModel( f288_local1, "colorBlindSensitiveEnemyScorestreakTargetColor" ), CoD.ConvertColor( CoD.ExplodeColor( ColorSet.EnemyScorestreakTarget ) ) )
		end
		return Engine.CreateModel( f288_local0, "hudItems" )
	end
}
DataSources.InteractivePrompt = {
	getModel = function ( f289_arg0 )
		if not f289_arg0 then
			f289_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f289_arg0 ), "interactivePrompt" )
	end
}
DataSources.KillstreakReward = {
	getModel = function ( f290_arg0 )
		if not f290_arg0 then
			f290_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f290_arg0 ), "killstreakRewards" )
	end
}
DataSources.PlayerCallout = {
	getModel = function ( f291_arg0 )
		if not f291_arg0 then
			f291_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f291_arg0 ), "playerCallout" )
	end
}
DataSources.PlayerAbilities = {
	getModel = function ( f292_arg0 )
		if not f292_arg0 then
			f292_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f292_arg0 ), "playerAbilities" )
	end
}
DataSources.Perks = {
	getModel = function ( f293_arg0 )
		if not f293_arg0 then
			f293_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f293_arg0 ), "perks" )
	end
}
DataSources.CTF = {
	prepared = false,
	prepare = function ( f294_arg0, f294_arg1, f294_arg2 )
		local f294_local0 = Engine.CreateModel( Engine.GetModelForController( f294_arg0 ), "CTF" )
		local f294_local1 = Engine.CreateModel( f294_local0, "friendlyFlagCarrier" )
		local f294_local2 = Engine.CreateModel( f294_local0, "enemyFlagCarrier" )
	end,
	getModel = function ( f295_arg0 )
		if not DataSources.CTF.prepared then
			DataSources.CTF.prepare( f295_arg0 )
		end
		if not f295_arg0 then
			f295_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f295_arg0 ), "CTF" )
	end
}
DataSources.Ball = {
	getModel = function ( f296_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f296_arg0 ), "ballGametype" )
	end
}
DataSources.Escort = {
	getModel = function ( f297_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f297_arg0 ), "escortGametype" )
	end
}
DataSources.Factions = {
	prepared = false,
	factionSubscription = {},
	prepare = function ( f298_arg0, f298_arg1, f298_arg2 )
		if not DataSources.Factions.prepared then
			DataSources.Factions.prepared = {}
		end
		if not DataSources.Factions.factionSubscription[f298_arg0] then
			DataSources.Factions.factionSubscription[f298_arg0] = LUI.UIElement.new()
		end
		local f298_local0 = Engine.GetModelForController( f298_arg0 )
		local f298_local1 = Engine.CreateModel( f298_local0, "factions" )
		local f298_local2 = Engine.CreateModel( f298_local1, "isCoDCaster" )
		local f298_local3 = Engine.CreateModel( f298_local1, "playerFactionTeamEnum" )
		local f298_local4 = Engine.CreateModel( f298_local1, "playerFactionName" )
		local f298_local5 = Engine.CreateModel( f298_local1, "playerFactionDisplayName" )
		local f298_local6 = Engine.CreateModel( f298_local1, "playerFactionIcon" )
		local f298_local7 = Engine.CreateModel( f298_local1, "playerFactionColor" )
		local f298_local8 = Engine.CreateModel( f298_local1, "playerFactionFlagColor" )
		local f298_local9 = Engine.CreateModel( f298_local1, "enemyFactionTeamEnum" )
		local f298_local10 = Engine.CreateModel( f298_local1, "enemyFactionName" )
		local f298_local11 = Engine.CreateModel( f298_local1, "enemyFactionDisplayName" )
		local f298_local12 = Engine.CreateModel( f298_local1, "enemyFactionIcon" )
		local f298_local13 = Engine.CreateModel( f298_local1, "enemyFactionColor" )
		local f298_local14 = Engine.CreateModel( f298_local1, "enemyFactionFlagColor" )
		DataSources.Factions.factionSubscription[f298_arg0]:unsubscribeFromAllModels()
		DataSources.Factions.factionSubscription[f298_arg0]:subscribeToModel( f298_local3, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				if CoD.IsShoutcaster( f298_arg0 ) then
					modelValue = Enum.team_t.TEAM_ALLIES
				end
				Engine.SetModelValue( f298_local6, CoD.GetTeamFactionIcon( modelValue ) )
				Engine.SetModelValue( f298_local5, CoD.GetTeamNameCaps( modelValue ) )
				Engine.SetModelValue( f298_local7, CoD.GetTeamFactionColor( modelValue ) )
				local f299_local1 = CoD.GetColorBlindColorForPlayer( f298_arg0, "FriendlyBlue" )
				local f299_local2 = string.format( "%d %d %d", f299_local1.r * 255, f299_local1.g * 255, f299_local1.b * 255 )
				if CoD.IsShoutcaster( f298_arg0 ) then
					local f299_local3 = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
					local f299_local4 = CoD.GetTeamFactionColorEffect( Enum.team_t.TEAM_ALLIES )
					local f299_local5 = CoD.GetTeamFactionColorObituaryFont( Enum.team_t.TEAM_ALLIES )
					if not CoDShared.IsGametypeTeamBased() then
						f299_local3 = f299_local2
						f299_local4 = f299_local2
						f299_local5 = f299_local2
					end
					CoD.UpdateColorSet( "CodCasterFriendly", f299_local3 )
					CoD.UpdateColorSet( "CodCasterFriendlyEffect", f299_local4 )
					CoD.UpdateColorSet( "CodCasterFriendlyObituaryFont", f299_local5 )
					Engine.SetupCompassColors( f298_arg0 )
					f299_local2 = f299_local3
				end
				Engine.SetModelValue( f298_local8, f299_local2 )
			end
		end )
		DataSources.Factions.factionSubscription[f298_arg0]:subscribeToModel( f298_local9, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue then
				if CoD.IsShoutcaster( f298_arg0 ) then
					modelValue = Enum.team_t.TEAM_AXIS
				end
				Engine.SetModelValue( f298_local12, CoD.GetTeamFactionIcon( modelValue ) )
				Engine.SetModelValue( f298_local11, CoD.GetTeamNameCaps( modelValue ) )
				Engine.SetModelValue( f298_local13, CoD.GetTeamFactionColor( modelValue ) )
				local f300_local1 = CoD.GetColorBlindColorForPlayer( f298_arg0, "EnemyOrange" )
				local f300_local2 = string.format( "%d %d %d", f300_local1.r * 255, f300_local1.g * 255, f300_local1.b * 255 )
				if CoD.IsShoutcaster( f298_arg0 ) then
					local f300_local3 = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
					local f300_local4 = CoD.GetTeamFactionColorEffect( Enum.team_t.TEAM_AXIS )
					local f300_local5 = CoD.GetTeamFactionColorObituaryFont( Enum.team_t.TEAM_AXIS )
					if not CoDShared.IsGametypeTeamBased() then
						f300_local3 = f300_local2
						f300_local4 = f300_local2
						f300_local5 = f300_local2
					end
					CoD.UpdateColorSet( "CodCasterEnemy", f300_local3 )
					CoD.UpdateColorSet( "CodCasterEnemyEffect", f300_local4 )
					CoD.UpdateColorSet( "CodCasterFriendlyObituaryFont", f300_local5 )
					Engine.SetupCompassColors( f298_arg0 )
					f300_local2 = f300_local3
				end
				Engine.SetModelValue( f298_local14, f300_local2 )
			end
		end )
		local f298_local15 = {
			name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
			icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
			color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES ),
			colorEffect = CoD.GetTeamFactionColorEffect( Enum.team_t.TEAM_ALLIES ),
			colorObituaryFont = CoD.GetTeamFactionColorObituaryFont( Enum.team_t.TEAM_ALLIES )
		}
		local f298_local16 = {
			name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
			icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
			color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS ),
			colorEffect = CoD.GetTeamFactionColorEffect( Enum.team_t.TEAM_AXIS ),
			colorObituaryFont = CoD.GetTeamFactionColorObituaryFont( Enum.team_t.TEAM_AXIS )
		}
		if CoD.IsShoutcaster( f298_arg0 ) and CoD.ShoutcasterProfileVarBool( f298_arg0, "shoutcaster_flip_scorepanel" ) then
			f298_local16 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES ),
				colorEffect = CoD.GetTeamFactionColorEffect( Enum.team_t.TEAM_ALLIES ),
				colorObituaryFont = CoD.GetTeamFactionColorObituaryFont( Enum.team_t.TEAM_ALLIES )
			}
			f298_local15 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS ),
				colorEffect = CoD.GetTeamFactionColorEffect( Enum.team_t.TEAM_AXIS ),
				colorObituaryFont = CoD.GetTeamFactionColorObituaryFont( Enum.team_t.TEAM_AXIS )
			}
		end
		Engine.SetModelValue( Engine.CreateModel( f298_local1, "axisFactionDisplayName" ), f298_local16.name )
		Engine.SetModelValue( Engine.CreateModel( f298_local1, "axisFactionIcon" ), f298_local16.icon )
		Engine.SetModelValue( Engine.CreateModel( f298_local1, "axisFactionColor" ), f298_local16.color )
		Engine.SetModelValue( Engine.CreateModel( f298_local1, "alliesFactionDisplayName" ), f298_local15.name )
		Engine.SetModelValue( Engine.CreateModel( f298_local1, "alliesFactionIcon" ), f298_local15.icon )
		Engine.SetModelValue( Engine.CreateModel( f298_local1, "alliesFactionColor" ), f298_local15.color )
		if CoD.IsShoutcaster( f298_arg0 ) then
			CoD.UpdateColorSet( "CodCasterFactionAllies", f298_local15.color )
			CoD.UpdateColorSet( "CodCasterFactionAxis", f298_local16.color )
			CoD.UpdateColorSet( "CodCasterFactionAlliesEffect", f298_local15.colorEffect )
			CoD.UpdateColorSet( "CodCasterFactionAxisEffect", f298_local16.colorEffect )
			CoD.UpdateColorSet( "CodCasterFactionAlliesObituaryFont", f298_local15.colorObituaryFont )
			CoD.UpdateColorSet( "CodCasterFactionAxisObituaryFont", f298_local16.colorObituaryFont )
			Engine.SetupCompassColors( f298_arg0 )
		end
		local f298_local17 = Engine.GetModel( f298_local0, "team" )
		if f298_local17 then
			DataSources.Factions.factionSubscription[f298_arg0]:subscribeToModel( f298_local17, function ( model )
				DataSources.Factions.prepared[f298_arg0] = false
				DataSources.Factions.prepare( f298_arg0 )
			end, false )
		end
		local f298_local18 = Engine.GetModel( f298_local0, "CodCaster.profileSettingsUpdated" )
		if f298_local18 then
			DataSources.Factions.factionSubscription[f298_arg0]:subscribeToModel( f298_local18, function ( model )
				DataSources.Factions.prepared[f298_arg0] = false
				DataSources.Factions.prepare( f298_arg0 )
			end, false )
		end
		local f298_local19 = Engine.GetModel( f298_local0, "profile.colorblindMode" )
		if f298_local19 then
			DataSources.Factions.factionSubscription[f298_arg0]:subscribeToModel( f298_local19, function ( model )
				DataSources.Factions.prepared[f298_arg0] = false
				DataSources.Factions.prepare( f298_arg0 )
			end, false )
		end
		DataSources.Factions.prepared[f298_arg0] = true
	end,
	getModel = function ( f304_arg0 )
		if not DataSources.Factions.prepared or not DataSources.Factions.prepared[f304_arg0] then
			DataSources.Factions.prepare( f304_arg0 )
		end
		if not f304_arg0 then
			f304_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f304_arg0 ), "factions" )
	end
}
DataSources.FactionsGlobal = {
	prepare = function ( f305_arg0, f305_arg1, f305_arg2 )
		local f305_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
		local f305_local1 = Engine.GetModelForController( f305_arg0 )
		if not DataSources.FactionsGlobal.factionSubscription then
			DataSources.FactionsGlobal.factionSubscription = LUI.UIElement.new()
		end
		DataSources.FactionsGlobal.factionSubscription:unsubscribeFromAllModels()
		local f305_local2 = {
			name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
			icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
			color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
		}
		local f305_local3 = {
			name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
			icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
			color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
		}
		if CoD.IsShoutcaster( f305_arg0 ) and CoD.ShoutcasterProfileVarBool( f305_arg0, "shoutcaster_flip_scorepanel" ) then
			f305_local3 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			f305_local2 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
		end
		Engine.SetModelValue( Engine.CreateModel( f305_local0, "axisFactionDisplayName" ), f305_local3.name )
		Engine.SetModelValue( Engine.CreateModel( f305_local0, "axisFactionIcon" ), f305_local3.icon )
		Engine.SetModelValue( Engine.CreateModel( f305_local0, "axisFactionColor" ), f305_local3.color )
		Engine.SetModelValue( Engine.CreateModel( f305_local0, "alliesFactionDisplayName" ), f305_local2.name )
		Engine.SetModelValue( Engine.CreateModel( f305_local0, "alliesFactionIcon" ), f305_local2.icon )
		Engine.SetModelValue( Engine.CreateModel( f305_local0, "alliesFactionColor" ), f305_local2.color )
		local f305_local4 = Engine.GetModel( f305_local1, "team" )
		if f305_local4 then
			DataSources.FactionsGlobal.factionSubscription:subscribeToModel( f305_local4, function ( model )
				DataSources.FactionsGlobal.prepared = false
				DataSources.FactionsGlobal.prepare( f305_arg0 )
			end, false )
		end
		local f305_local5 = Engine.GetModel( f305_local1, "CodCaster.profileSettingsUpdated" )
		if f305_local5 then
			DataSources.FactionsGlobal.factionSubscription:subscribeToModel( f305_local5, function ( model )
				DataSources.FactionsGlobal.prepared = false
				DataSources.FactionsGlobal.prepare( f305_arg0 )
			end, false )
		end
		local f305_local6 = Engine.GetModel( f305_local1, "profile.colorblindMode" )
		if f305_local6 then
			DataSources.FactionsGlobal.factionSubscription:subscribeToModel( f305_local6, function ( model )
				DataSources.FactionsGlobal.prepared = false
				DataSources.FactionsGlobal.prepare( f305_arg0 )
			end, false )
		end
		DataSources.FactionsGlobal.prepared = true
	end,
	getModel = function ( f309_arg0 )
		if not DataSources.FactionsGlobal.prepared then
			DataSources.FactionsGlobal.prepare( f309_arg0 )
		end
		return Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
	end
}
DataSources.NetStats = {
	getModel = function ( f310_arg0 )
		return Engine.CreateModel( Engine.GetGlobalModel(), "netstats" )
	end
}
DataSources.Groups = {
	getModel = function ( f311_arg0 )
		if not f311_arg0 then
			f311_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f311_arg0 ), "groups" )
	end
}
DataSources.GroupsMainTabList = ListHelper_SetupDataSource( "GroupsMainTabModel", function ( f312_arg0 )
	local f312_local0 = {}
	table.insert( f312_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f312_local0, {
		models = {
			tabName = Engine.Localize( "GROUPS_MY_GROUPS_CAPS" ),
			tabWidget = "CoD.MyGroupsTab"
		},
		properties = {
			tabId = "mygroups"
		}
	} )
	table.insert( f312_local0, {
		models = {
			tabName = Engine.Localize( "GROUPS_FIND_GROUPS_CAPS" ),
			tabWidget = "CoD.FindGroupsTab"
		},
		properties = {
			tabId = "findgroups"
		}
	} )
	table.insert( f312_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f312_local0
end, true )
DataSources.GroupsEmblemTabList = ListHelper_SetupDataSource( "GroupsEmblemTabModel", function ( f313_arg0 )
	local f313_local0 = {}
	table.insert( f313_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f313_local0, {
		models = {
			tabName = Engine.Localize( "GROUPS_GROUP_EMBLEMS_CAPS" ),
			tabWidget = "CoD.GroupEmblemsTab"
		},
		properties = {
			tabId = "groupemblems"
		}
	} )
	table.insert( f313_local0, {
		models = {
			tabName = Engine.Localize( "GROUPS_MY_EMBLEMS_CAPS" ),
			tabWidget = "CoD.GroupMyEmblemsTab"
		},
		properties = {
			tabId = "groupmyemblems"
		}
	} )
	table.insert( f313_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f313_local0
end, true )
DataSources.LobbyCommonGroupsList = {
	prepare = function ( f314_arg0, f314_arg1, f314_arg2 )
		f314_arg1.commonGroups = {}
		if f314_arg1:getParent() then
			local f314_local0 = f314_arg1:getParent()
			if not f314_local0:getModel( f314_arg0, "xuid" ) then
				return 
			end
			f314_local0 = Engine.CreateModel( Engine.GetModelForController( f314_arg0 ), "groups" )
			local f314_local1 = f314_arg1:getParent()
			local f314_local2 = f314_local1:getModel()
			local f314_local3 = CoD.SafeGetModelValue( f314_local2, "xuid" )
			local f314_local4 = Engine.GetGroupList( f314_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
			local f314_local5 = Engine.GetXUID64( f314_arg0 )
			local f314_local6 = CoD.SafeGetModelValue( f314_local2, "quickjoinListMember" )
			if not Engine.GetModel( f314_local0, "lastSelectedFriendXuid" ) then
				Engine.SetModelValue( Engine.CreateModel( f314_local0, "lastSelectedFriendXuid" ), Engine.StringToXUIDDecimal( "0" ) )
			end
			if not f314_local4 or #f314_local4 == 0 or f314_local5 == f314_local3 or not f314_local6 then
				return 
			elseif f314_arg1.subscriptionForSearchGroups then
				f314_arg1:removeSubscription( f314_arg1.subscriptionForSearchGroups )
			end
			f314_arg1.groupsEventModel = Engine.CreateModel( f314_local0, "eventUpdate" )
			f314_arg1.subscriptionForSearchGroups = f314_arg1:subscribeToModel( f314_arg1.groupsEventModel, function ()
				local f315_local0 = Engine.GetModelValue( Engine.GetModel( f314_local0, "eventName" ) )
				if (f315_local0 == "search_groups_task_complete" or f315_local0 == "groupsFetched") and f314_arg1.searchingForGroups then
					f314_arg1.searchingForGroups = false
					f314_arg1:updateDataSource()
				end
			end, false )
			if Engine.GetModelValue( Engine.GetModel( f314_local0, "lastSelectedFriendXuid" ) ) ~= f314_local3 and not f314_arg1.searchingForGroups then
				ClearLastGroupSearchResults( self, element, f314_arg0 )
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f314_arg0 ), "Social.selectedFriendXUID" ), f314_local3 )
				SearchGroupsBySearchType( self, element, f314_arg0, Enum.GroupSearchType.GROUP_SEARCH_TYPE_SELECTED_FRIEND )
				Engine.SetModelValue( Engine.GetModel( f314_local0, "lastSelectedFriendXuid" ), f314_local3 )
				f314_arg1.searchingForGroups = true
				return 
			end
			local f314_local7 = Engine.GetTotalGroupsCount( f314_arg1.controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
			for f314_local13, f314_local14 in ipairs( f314_local4 ) do
				for f314_local12 = 1, f314_local7, 1 do
					local f314_local11 = Engine.GetGroupData( f314_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH, f314_local12 )
					if f314_local11 and f314_local14.groupId == f314_local11.groupId then
						table.insert( f314_arg1.commonGroups, {
							groupName = f314_local14.name,
							groupId = f314_local14.groupId,
							primaryGroup = false
						} )
					end
				end
			end
			f314_local8 = -1
			for f314_local14, f314_local12 in ipairs( f314_arg1.commonGroups ) do
				if f314_local12.groupId == Engine.GetPrimaryGroup( f314_arg0 ) then
					f314_local8 = f314_local14
				end
			end
			if f314_local8 > 0 then
				f314_local9 = LUI.ShallowCopy( f314_arg1.commonGroups[f314_local8] )
				f314_local9.primaryGroup = true
				table.remove( f314_arg1.commonGroups, f314_local8 )
				table.insert( f314_arg1.commonGroups, 1, f314_local9 )
			end
			f314_local9 = Engine.CreateModel( f314_local0, "commonGroups" )
			for f314_local10 = 1, #f314_arg1.commonGroups, 1 do
				f314_arg1.commonGroups[f314_local10].model = Engine.CreateModel( f314_local9, "listItem_" .. f314_local10 )
				for f314_local11, f314_local18 in pairs( f314_arg1.commonGroups[f314_local10] ) do
					if f314_local11 ~= "model" then
						Engine.SetModelValue( Engine.CreateModel( f314_arg1.commonGroups[f314_local10].model, f314_local11 ), f314_local18 )
					end
				end
			end
			if IsMainModeInvalid() then
				f314_arg1.vCount = 8
			else
				f314_arg1.vCount = 2
			end
			f314_arg1.resetToFirst = true
			f314_local1:updateState( {
				controller = f314_arg0
			} )
		end
		return 
	end,
	getCount = function ( f316_arg0 )
		return #f316_arg0.commonGroups
	end,
	getItem = function ( f317_arg0, f317_arg1, f317_arg2 )
		return f317_arg1.commonGroups[f317_arg2].model
	end
}
DataSources.GroupsInvitesList = {
	prepare = function ( f318_arg0, f318_arg1, f318_arg2 )
		f318_arg1.controller = f318_arg0
		f318_arg1.numElementsInList = f318_arg1.vCount
		local f318_local0 = Engine.GetGroupInvitesList( f318_arg0 )
		local f318_local1 = Engine.CreateModel( Engine.GetModelForController( f318_arg0 ), "groups" )
		local f318_local2 = Engine.CreateModel( f318_local1, "eventUpdate" )
		local f318_local3 = Engine.CreateModel( f318_local1, "invites" )
		f318_arg1.emptyGroupInviteInfo = {
			groupId = Engine.StringToXUIDDecimal( "0" ),
			bufferType = Enum.GroupBufferType.GROUP_BUFFER_TYPE_INVALID,
			name = "",
			description = "",
			message = "",
			privacy = Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC,
			privacyString = "",
			joinApprovalType = Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF,
			creationTimeStamp = "",
			owner = "",
			ownerXuid = 0,
			memberCount = 0,
			groupBufferType = Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH,
			onlineCount = 0,
			inTitleCount = 0,
			lbDef = "",
			lbTimeFrame = 0,
			lbHardcore = false,
			lbInitialized = false,
			loading = true,
			sentByGamertag = "",
			sentByXuid = Engine.StringToXUIDDecimal( "0" )
		}
		if not f318_arg1.initialized then
			f318_arg1.invites = {}
			for f318_local4 = 1, f318_arg1.numElementsInList, 1 do
				f318_arg1.invites[f318_local4] = {}
				f318_arg1.invites[f318_local4].model = Engine.CreateModel( f318_local3, "listItem_" .. f318_local4 )
				for f318_local10, f318_local11 in pairs( f318_arg1.emptyGroupInviteInfo ) do
					Engine.SetModelValue( Engine.CreateModel( f318_arg1.invites[f318_local4].model, f318_local10 ), f318_local11 )
				end
			end
			f318_arg1.initialized = true
		end
		f318_arg1.getModelForAbsoluteIndex = function ( f319_arg0, f319_arg1 )
			local f319_local0 = Engine.GetGroupInviteData( f319_arg0, f319_arg1 )
			if f319_local0 then
				f319_local0.loading = false
			else
				f319_local0 = f318_arg1.emptyGroupInviteInfo
			end
			local f319_local1 = f319_arg1 % f318_arg1.numElementsInList + 1
			for f319_local5, f319_local6 in pairs( f319_local0 ) do
				Engine.SetModelValue( Engine.CreateModel( f318_arg1.invites[f319_local1].model, f319_local5 ), f319_local6 )
			end
			return f318_arg1.invites[f319_local1].model
		end
		
		if f318_arg1.updateSubscription then
			f318_arg1:removeSubscription( f318_arg1.updateSubscription )
		end
		f318_arg1.groupsEventModel = Engine.CreateModel( f318_local1, "eventUpdate" )
		f318_arg1.updateSubscription = f318_arg1:subscribeToModel( f318_arg1.groupsEventModel, function ()
			local f320_local0 = Engine.GetModelValue( Engine.GetModel( f318_local1, "eventName" ) )
			if f320_local0 == "refreshInvites" or f320_local0 == "fetch_profiles_task_complete" then
				f318_arg1:updateDataSource( true, true )
				if Engine.GetTotalGroupInvitesCount( f318_arg1.controller ) > 0 and Engine.GetModelValue( Engine.GetModel( f318_local1, "inviteRemoved" ) ) then
					f318_arg1:setActiveItem( f318_arg1:getFirstSelectableItem() )
				end
				Engine.SetModelValue( Engine.GetModel( f318_local1, "inviteRemoved" ), false )
				f318_arg1:updateLayout()
			end
		end, false )
	end,
	getCount = function ( f321_arg0 )
		return Engine.GetTotalGroupInvitesCount( f321_arg0.controller )
	end,
	getItem = function ( f322_arg0, f322_arg1, f322_arg2 )
		return f322_arg1.getModelForAbsoluteIndex( f322_arg0, f322_arg2 )
	end
}
DataSources.GroupsMemberDetailsButtons = ListHelper_SetupDataSource( "GroupsMemberDetailsButtons", function ( f323_arg0 )
	local f323_local0 = {}
	local f323_local1 = Engine.GetModelForController( f323_arg0 )
	local f323_local2 = Engine.GetModelValue( Engine.CreateModel( f323_local1, "Social.selectedFriendXUID" ) )
	local f323_local3 = Engine.GetModelValue( Engine.CreateModel( f323_local1, "Social.selectedFriendGamertag" ) )
	local f323_local4 = f323_local2 == Engine.GetXUID64( f323_arg0 )
	local f323_local5 = Engine.GetModelValue( Engine.CreateModel( f323_local1, "Social.selectedFriendInTitle" ) )
	if f323_local2 == nil then
		return f323_local0
	end
	local f323_local6 = false
	local f323_local7 = Engine.GetPlayerInfo( f323_arg0, f323_local2 )
	if f323_local4 ~= false then
		
	else
		
	end
	local f323_local8 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f323_local2 )
	local f323_local9 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f323_local2 )
	local f323_local10 = Engine.IsPlayerMuted( f323_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f323_local2 )
	table.insert( f323_local0, {
		text = "GROUPS_COMBAT_RECORD_CAPS",
		id = "combatRecord",
		disabled = false,
		action = PromoteToLeader,
		params = {
			controller = f323_arg0,
			xuid = f323_local2
		},
		lastInGroup = false
	} )
	table.insert( f323_local0, {
		text = "GROUPS_VIEW_PROFILE_CAPS",
		id = "platformProfile",
		disabled = false,
		action = OpenPlatformProfile,
		params = {
			controller = f323_arg0,
			gamertag = f323_local3,
			xuid = f323_local2
		},
		lastInGroup = true
	} )
	if not Engine.IsFriendFromXUID( f323_arg0, f323_local2 ) then
		table.insert( f323_local0, {
			text = "GROUPS_SEND_FRIEND_REQUEST_CAPS",
			id = "sendFriendRequest",
			disabled = false,
			action = OpenPlatformProfile,
			params = {
				controller = f323_arg0,
				gamertag = f323_local3,
				xuid = f323_local2
			},
			lastInGroup = true
		} )
	end
	table.insert( f323_local0, {
		text = "GROUPS_REPORT_PLAYER_CAPS",
		id = "reportPlayer",
		disabled = false,
		action = nil,
		params = nil,
		lastInGroup = false
	} )
	if f323_local8 or f323_local9 then
		if f323_local10 then
			table.insert( f323_local0, {
				text = "GROUPS_UNMUTE_PLAYER_CAPS",
				id = "unmutePlayer",
				disabled = false,
				action = UnMutePlayer,
				params = {
					controller = f323_arg0,
					xuid = f323_local2
				},
				lastInGroup = true
			} )
		else
			table.insert( f323_local0, {
				text = "GROUPS_MUTE_PLAYER_CAPS",
				id = "mutePlayer",
				disabled = false,
				action = MutePlayer,
				params = {
					controller = f323_arg0,
					xuid = f323_local2
				},
				lastInGroup = true
			} )
		end
	end
	f323_local8 = {}
	for f323_local12, f323_local13 in ipairs( f323_local0 ) do
		table.insert( f323_local8, {
			models = {
				displayText = Engine.Localize( f323_local13.text ),
				customId = f323_local13.customId
			},
			properties = {
				disabled = f323_local13.disabled,
				action = f323_local13.action,
				actionParam = f323_local13.params,
				isLastButtonInGroup = f323_local13.lastInGroup
			}
		} )
	end
	return f323_local8
end, nil, nil, function ( f324_arg0, f324_arg1, f324_arg2 )
	
end, function ( f325_arg0, f325_arg1, f325_arg2 )
	if f325_arg0.GroupsMemberDetailsButtons[f325_arg1].properties.isLastButtonInGroup then
		return 9
	else
		
	end
end )
DataSources.GroupsShowcaseButtons = ListHelper_SetupDataSource( "GroupsShowcaseButtons", function ( f326_arg0 )
	local f326_local0 = {}
	table.insert( f326_local0, {
		text = "GROUPS_FAVORITES",
		displayImage = "t7_icon_menu_simple_groups_favorites",
		hintText = "MENU_GROUPS_SHOWCASE_FAVORITE_DESC",
		id = "favorites",
		tabWidget = "CoD.FileshareMixedCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = f326_arg0
		},
		lastInGroup = false
	} )
	table.insert( f326_local0, {
		text = "GROUPS_RECENT",
		displayImage = "uie_t7_icon_menu_simple_media_recent",
		hintText = "MENU_GROUPS_SHOWCASE_RECENT_DESC",
		id = "recent",
		tabWidget = "CoD.FileshareMixedCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = f326_arg0
		},
		lastInGroup = false
	} )
	table.insert( f326_local0, {
		text = "GROUPS_PAINT_JOBS",
		displayImage = "uie_t7_mp_icon_header_paintshop",
		hintText = "MENU_GROUPS_SHOWCASE_PAINTJOBS_DESC",
		id = "paintjob",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = f326_arg0
		},
		lastInGroup = false
	} )
	table.insert( f326_local0, {
		text = "GROUPS_VARIANTS",
		displayImage = "uie_t7_mp_icon_header_gunsmith",
		hintText = "MENU_GROUPS_SHOWCASE_VARIANTS_DESC",
		id = "variant",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = f326_arg0
		},
		lastInGroup = false
	} )
	table.insert( f326_local0, {
		text = "GROUPS_EMBLEMS",
		displayImage = "uie_t7_mp_icon_header_emblem",
		hintText = "MENU_GROUPS_SHOWCASE_EMBLEMS_DESC",
		id = "emblem",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = f326_arg0
		},
		lastInGroup = false
	} )
	table.insert( f326_local0, {
		text = "GROUPS_SCREENSHOTS",
		displayImage = "uie_t7_mp_icon_header_screenshot",
		hintText = "MENU_GROUPS_SHOWCASE_SCREENSHOTS_DESC",
		id = "screenshot",
		tabWidget = "CoD.FileshareScreenshotsContentList",
		disabled = false,
		action = nil,
		params = {
			controller = f326_arg0
		},
		lastInGroup = false
	} )
	table.insert( f326_local0, {
		text = "GROUPS_CLIPS",
		displayImage = "t7_icon_menu_simple_clips",
		hintText = "MENU_GROUPS_SHOWCASE_CLIPS_DESC",
		id = "clip",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = f326_arg0
		},
		lastInGroup = false
	} )
	table.insert( f326_local0, {
		text = "GROUPS_CUSTOM_GAMES",
		displayImage = "uie_t7_mp_icon_header_customgames",
		hintText = "MENU_GROUPS_SHOWCASE_CUSTOMGAMES_DESC",
		id = "customgame",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = f326_arg0
		},
		lastInGroup = true
	} )
	local f326_local1 = {}
	for f326_local5, f326_local6 in ipairs( f326_local0 ) do
		table.insert( f326_local1, {
			models = {
				displayText = Engine.Localize( f326_local6.text ),
				displayImage = f326_local6.displayImage,
				hintText = f326_local6.hintText,
				customId = f326_local6.customId,
				category = f326_local6.id,
				tabWidget = f326_local6.tabWidget
			},
			properties = {
				disabled = f326_local6.disabled,
				action = f326_local6.action,
				actionParam = f326_local6.params,
				isLastButtonInGroup = f326_local6.lastInGroup
			}
		} )
	end
	return f326_local1
end, nil, nil, function ( f327_arg0, f327_arg1, f327_arg2 )
	
end, function ( f328_arg0, f328_arg1, f328_arg2 )
	if f328_arg0.GroupsShowcaseButtons[f328_arg1].properties.isLastButtonInGroup then
		return 9
	else
		
	end
end )
DataSources.GroupsInviteButtonList = {
	prepare = function ( f329_arg0, f329_arg1, f329_arg2 )
		f329_arg1.buttons = {}
		local f329_local0 = {}
		f329_arg1.groups = Engine.GetGroupList( f329_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f329_arg0 ), "Social.selectedFriendXUID" ) ) )
		for f329_local1 = 1, #f329_arg1.groups, 1 do
			local f329_local4 = f329_arg1.groups[f329_local1]
			if Engine.GroupAdminHasPrivilege( f329_arg0, f329_local4.groupId, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_INVITE_PLAYERS ) then
				table.insert( f329_local0, {
					displayText = f329_local4.name,
					action = InviteToGroup,
					btnType = "group",
					disabled = true,
					groupId = f329_local4.groupId,
					groupBufferType = f329_local4.bufferType,
					name = f329_local4.name,
					clanTag = f329_local4.clanTag,
					description = f329_local4.description,
					message = f329_local4.message,
					privacy = f329_local4.privacy,
					creationTimestamp = f329_local4.creationTimestamp,
					owner = f329_local4.owner,
					ownerXuid = f329_local4.ownerXuid,
					memberStatus = f329_local4.memberStatus,
					memberStatusText = f329_local4.memberStatusText,
					memberCount = f329_local4.memberCount,
					onlineCount = f329_local4.onlineCount,
					inTitleCount = f329_local4.inTitleCount,
					lbIndex = f329_local4.lbIndex,
					lbSortColumn = f329_local4.lbSortColumn,
					lbTimeFrame = f329_local4.lbTimeFrame,
					lbHardcore = f329_local4.lbHardcore,
					lbInitialized = f329_local4.lbInitialized
				} )
			end
		end
		local f329_local3 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f329_arg0 ), "groups" ), "mainButtons" )
		for f329_local8, f329_local9 in ipairs( f329_local0 ) do
			local f329_local10 = Engine.CreateModel( f329_local3, "buttonModel_" .. f329_local8 )
			table.insert( f329_arg1.buttons, {
				model = f329_local10,
				type = f329_local9.btnType,
				groupId = f329_local9.groupId,
				groupBufferType = f329_local9.groupBufferType
			} )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "displayText" ), f329_local9.displayText )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "action" ), f329_local9.action )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "type" ), f329_local9.btnType )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "groupId" ), f329_local9.groupId )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "groupBufferType" ), f329_local9.groupBufferType )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "name" ), f329_local9.name )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "clanTag" ), f329_local9.clanTag )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "description" ), f329_local9.description )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "message" ), f329_local9.message )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "privacy" ), f329_local9.privacy )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "creationTimestamp" ), f329_local9.creationTimestamp )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "owner" ), f329_local9.owner )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "ownerXuid" ), f329_local9.ownerXuid )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "memberStatus" ), f329_local9.memberStatus )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "memberStatusText" ), f329_local9.memberStatusText )
			local f329_local11 = Engine.GetModel( Engine.GetModelForController( f329_arg0 ), "Social.selectedFriendXUID" )
			local f329_local7 = false
			if f329_local11 then
				f329_local7 = Engine.HasGroupInviteBeenSent( f329_arg0, f329_local9.groupId, Engine.GetModelValue( f329_local11 ) )
			end
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "inviteSent" ), f329_local7 )
			f329_local9.inviteSent = f329_local7
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "memberCount" ), f329_local9.memberCount )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "onlineCount" ), f329_local9.onlineCount )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "inTitleCount" ), f329_local9.inTitleCount )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "lbIndex" ), f329_local9.lbIndex )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "lbSortColumn" ), f329_local9.lbSortColumn )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "lbTimeFrame" ), f329_local9.lbTimeFrame )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "lbHardcore" ), f329_local9.lbHardcore )
			Engine.SetModelValue( Engine.CreateModel( f329_local10, "lbInitialized" ), f329_local9.lbInitialized )
		end
		f329_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f329_arg0 ), "groups.eventUpdate" ), function ()
			if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f329_arg0 ), "groups.eventName" ) ) == "refreshOutgoingInvites" then
				f329_arg1:updateDataSource()
			end
		end, false )
	end,
	getCustomPropertiesForItem = function ( f331_arg0, f331_arg1 )
		return f331_arg0.buttons[f331_arg1]
	end,
	getCount = function ( f332_arg0 )
		return #f332_arg0.buttons
	end,
	getItem = function ( f333_arg0, f333_arg1, f333_arg2 )
		return f333_arg1.buttons[f333_arg2].model
	end
}
DataSources.GroupsMainButtonList = {
	prepare = function ( f334_arg0, f334_arg1, f334_arg2 )
		f334_arg1.buttons = {}
		local f334_local0 = {}
		f334_arg1.controller = f334_arg0
		local f334_local1 = Engine.CreateModel( Engine.GetModelForController( f334_arg0 ), "groups" )
		f334_arg1.groupCountModel = Engine.CreateModel( f334_local1, "groupCount_self" )
		local f334_local2 = Engine.CreateModel( f334_local1, "selfGroupsList" )
		local f334_local3 = Engine.GetGroupList( f334_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
		if (not f334_local3 or #f334_local3 == 0) and HasFriends( f334_arg0 ) then
			f334_arg1.selfGroupsCount = 0
			Engine.SearchGroups( f334_arg0, Enum.GroupSearchType.GROUP_SEARCH_TYPE_FRIENDS )
			DataSources.FindGroupsButtonList.prepare( f334_arg0, f334_arg1, f334_arg2 )
		else
			f334_arg1.selfGroupsCount = #f334_local3
			table.sort( f334_local3, function ( f335_arg0, f335_arg1 )
				return f335_arg0.name < f335_arg1.name
			end )
			local f334_local4 = -1
			for f334_local8, f334_local9 in ipairs( f334_local3 ) do
				if f334_local9.groupId == Engine.GetPrimaryGroup( f334_arg0 ) then
					f334_local4 = f334_local8
				end
			end
			if f334_local4 > 0 then
				f334_local5 = LUI.ShallowCopy( f334_local3[f334_local4] )
				table.remove( f334_local3, f334_local4 )
				table.insert( f334_local3, 1, f334_local5 )
			end
			for f334_local8, f334_local9 in ipairs( f334_local3 ) do
				local f334_local13 = Engine.CreateModel( f334_local2, "listItem_" .. f334_local8 )
				for f334_local10, f334_local11 in pairs( f334_local9 ) do
					Engine.SetModelValue( Engine.CreateModel( f334_local13, f334_local10 ), f334_local11 )
				end
				Engine.SetModelValue( Engine.CreateModel( f334_local13, "action" ), OpenGroupHeadquarters )
				table.insert( f334_arg1.buttons, {
					model = f334_local13
				} )
			end
		end
		f334_arg1:subscribeToModel( f334_arg1.groupCountModel, function ()
			f334_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f337_arg0 )
		if f337_arg0.selfGroupsCount == 0 and HasFriends( f337_arg0.controller ) then
			local f337_local0 = Engine.GetTotalGroupsCount( f337_arg0.controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
			if f337_local0 > 6 then
				f337_local0 = 6
			end
			return f337_local0
		else
			return #f337_arg0.buttons
		end
	end,
	getItem = function ( f338_arg0, f338_arg1, f338_arg2 )
		if f338_arg1.selfGroupsCount == 0 and HasFriends( f338_arg0 ) then
			return f338_arg1.getModelForAbsoluteIndex( f338_arg0, f338_arg2 )
		elseif #f338_arg1.buttons > 0 and f338_arg2 <= #f338_arg1.buttons then
			return f338_arg1.buttons[f338_arg2].model
		else
			return nil
		end
	end
}
DataSources.FindGroupsCategoryList = ListHelper_SetupDataSource( "FindGroupsCategoryList", function ( f339_arg0 )
	local f339_local0 = {}
	table.insert( f339_local0, {
		models = {
			image = "t7_icon_menu_simple_groups_friends",
			displayText = "GROUPS_FRIENDS_GROUPS",
			category = "friends",
			frameWidget = "CoD.FindGroupsTabFriendsGroupsFrame"
		}
	} )
	table.insert( f339_local0, {
		models = {
			image = "t7_icon_menu_simple_groups_popular",
			displayText = "GROUPS_POPULAR_GROUPS",
			category = "popular",
			frameWidget = "CoD.FindGroupsTabPopularGroupsFrame"
		}
	} )
	local f339_local1 = "CoD.FindGroupsTabSearchGroupsFrame"
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f339_arg0 ), "groups.searchResultsVisible" ) ) then
		f339_local1 = "CoD.FindGroupsTabSearchGroupsResultsFrame"
	end
	local f339_local2 = "CoD.FindGroupsTabSearchPlayerFrame"
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f339_arg0 ), "groups.searchPlayerResultsVisible" ) ) then
		f339_local2 = "CoD.FindGroupsTabSearchPlayerResultsFrame"
	end
	table.insert( f339_local0, {
		models = {
			image = "t7_icon_menu_simple_groups_search",
			displayText = "GROUPS_SEARCH_GROUPS",
			category = "params",
			frameWidget = f339_local1
		}
	} )
	table.insert( f339_local0, {
		models = {
			image = "t7_icon_menu_simple_groups_search_player",
			displayText = "GROUPS_SEARCH_PLAYER",
			category = "playerSearch",
			frameWidget = f339_local2
		}
	} )
	table.insert( f339_local0, {
		models = {
			image = "t7_icon_menu_simple_groups_create",
			displayText = "GROUPS_CREATE_GROUP_CAPS",
			category = "create",
			frameWidget = "CoD.FindGroupsTabCreateGroupsFrame",
			action = CreateNewGroupFlow
		}
	} )
	return f339_local0
end, true, nil, function ( f340_arg0, f340_arg1, f340_arg2 )
	if not f340_arg1.subscription then
		f340_arg1.subscription = f340_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f340_arg0 ), "groups.searchResultsVisible" ), function ( model )
			f340_arg1:updateDataSource()
		end, false )
	end
	if not f340_arg1.playerSearchSubscription then
		f340_arg1.playerSearchSubscription = f340_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f340_arg0 ), "groups.searchPlayerResultsVisible" ), function ( model )
			f340_arg1:updateDataSource()
		end, false )
	end
end, function ( f343_arg0, f343_arg1, f343_arg2 )
	if f343_arg1 == 4 then
		return 10
	else
		return 0
	end
end )
DataSources.FindGroupsButtonList = {
	prepare = function ( f344_arg0, f344_arg1, f344_arg2 )
		f344_arg1.controller = f344_arg0
		f344_arg1.numElementsInList = f344_arg1.vCount
		local f344_local0 = Engine.CreateModel( Engine.GetModelForController( f344_arg0 ), "groups" )
		local f344_local1 = Engine.CreateModel( f344_local0, "findGroupsList" )
		f344_arg1.emptyGroupInfo = {
			groupId = Engine.StringToXUIDDecimal( "0" ),
			bufferType = Enum.GroupBufferType.GROUP_BUFFER_TYPE_INVALID,
			name = "",
			description = "",
			message = "",
			privacy = Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC,
			privacyString = "",
			joinApprovalType = Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF,
			creationTimeStamp = "",
			owner = "",
			ownerXuid = 0,
			memberCount = 0,
			groupBufferType = Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH,
			onlineCount = 0,
			inTitleCount = 0,
			lbDef = "",
			lbTimeFrame = 0,
			lbHardcore = false,
			lbInitialized = false,
			action = ProcessJoinSelectedGroup,
			loading = true,
			isPrimaryGroup = false
		}
		if not f344_arg1.initialized then
			f344_arg1.groups = {}
			for f344_local2 = 1, f344_arg1.numElementsInList, 1 do
				f344_arg1.groups[f344_local2] = {}
				f344_arg1.groups[f344_local2].model = Engine.CreateModel( f344_local1, "listItem_" .. f344_local2 )
				for f344_local8, f344_local9 in pairs( f344_arg1.emptyGroupInfo ) do
					Engine.SetModelValue( Engine.CreateModel( f344_arg1.groups[f344_local2].model, f344_local8 ), f344_local9 )
				end
			end
			f344_arg1.initialized = true
		end
		f344_arg1.getModelForAbsoluteIndex = function ( f345_arg0, f345_arg1 )
			local f345_local0 = Engine.GetGroupData( f345_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH, f345_arg1 )
			if f345_local0 then
				f345_local0.loading = false
			else
				f345_local0 = f344_arg1.emptyGroupInfo
			end
			f345_local0.isPrimaryGroup = false
			local f345_local1 = f345_arg1 % f344_arg1.numElementsInList + 1
			for f345_local5, f345_local6 in pairs( f345_local0 ) do
				Engine.SetModelValue( Engine.CreateModel( f344_arg1.groups[f345_local1].model, f345_local5 ), f345_local6 )
			end
			return f344_arg1.groups[f345_local1].model
		end
		
		if f344_arg1.updateSubscription then
			f344_arg1:removeSubscription( f344_arg1.updateSubscription )
		end
		f344_arg1.groupsEventModel = Engine.CreateModel( f344_local0, "eventUpdate" )
		f344_arg1.updateSubscription = f344_arg1:subscribeToModel( f344_arg1.groupsEventModel, function ()
			if Engine.GetModelValue( Engine.GetModel( f344_local0, "eventName" ) ) == "fetch_profiles_task_complete" then
				f344_arg1:updateDataSource( true, true )
				f344_arg1:updateLayout()
			end
		end, false )
	end,
	getCount = function ( f347_arg0 )
		return Engine.GetTotalGroupsCount( f347_arg0.controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
	end,
	getItem = function ( f348_arg0, f348_arg1, f348_arg2 )
		return f348_arg1.getModelForAbsoluteIndex( f348_arg0, f348_arg2 )
	end
}
DataSources.GroupsHeadquartersTabList = ListHelper_SetupDataSource( "GroupsHeadquartersTabModel", function ( f349_arg0 )
	local f349_local0 = {}
	local f349_local1 = IsGroupOwner( f349_arg0 )
	if not f349_local1 then
		f349_local1 = IsGroupAdmin( f349_arg0 )
	end
	table.insert( f349_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f349_local0, {
		models = {
			tabName = Engine.Localize( "GROUPS_OVERVIEW_CAPS" ),
			tabWidget = "CoD.OverviewTab"
		},
		properties = {
			tabId = "overview"
		}
	} )
	table.insert( f349_local0, {
		models = {
			tabName = Engine.Localize( "GROUPS_ROSTER_CAPS" ),
			tabWidget = "CoD.RosterTab"
		},
		properties = {
			tabId = "roster"
		}
	} )
	table.insert( f349_local0, {
		models = {
			tabName = Engine.Localize( "GROUPS_LEADERBOARD_CAPS" ),
			tabWidget = "CoD.LeaderboardTab"
		},
		properties = {
			tabId = "leaderboard"
		}
	} )
	table.insert( f349_local0, {
		models = {
			tabName = Engine.Localize( "GROUPS_SHOWCASE_CAPS" ),
			tabWidget = "CoD.ShowcaseTab"
		},
		properties = {
			tabId = "showcase"
		}
	} )
	if f349_local1 then
		table.insert( f349_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_ADMIN_CAPS" ),
				tabWidget = "CoD.AdminTab"
			},
			properties = {
				tabId = "admin"
			}
		} )
	end
	table.insert( f349_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f349_local0
end, true )
DataSources.GroupHeadquartersOverviewButtonList = ListHelper_SetupDataSource( "GroupHeadquartersOverviewButtonListModel", function ( f350_arg0 )
	local f350_local0 = {}
	local f350_local1 = IsGroupMember( f350_arg0 )
	local f350_local2 = IsGroupOwner( f350_arg0 )
	local f350_local3 = function ( f351_arg0, f351_arg1, f351_arg2 )
		local f351_local0 = GoBack( f351_arg0, f351_arg2 )
		local f351_local1 = true
		if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f351_arg2 ), "groups.grouphqtabname" ) ) == "overview" then
			f351_local1 = false
		end
		ProcessLeaveSelectedGroup( f351_local0, f351_arg1, f351_arg2, f351_local1 )
	end
	
	local f350_local4 = function ( f352_arg0, f352_arg1, f352_arg2, f352_arg3, f352_arg4 )
		ShowReportGroupDialog( f352_arg0, f352_arg1, f352_arg2, f352_arg3, GoBack( f352_arg0, f352_arg2 ) )
	end
	
	if f350_local1 and not f350_local2 then
		table.insert( f350_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_LEAVE_GROUP_CAPS" ),
				icon = "t7_mp_icon_groups_remove",
				action = f350_local3,
				hintText = Engine.Localize( "GROUPS_LEAVE_GROUP_DESC" )
			}
		} )
	end
	if f350_local1 then
		table.insert( f350_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_SET_AS_PRIMARY_GROUP_CAPS" ),
				icon = "t7_mp_icon_groups_primary",
				action = SetPrimaryGroup,
				hintText = Engine.Localize( "GROUPS_SET_AS_PRIMARY_GROUP_DESC" )
			}
		} )
	end
	table.insert( f350_local0, {
		models = {
			displayText = LocalizeToUpperString( "MENU_REPORT_GROUP" ),
			icon = "uie_t7_icon_error_overlays",
			action = f350_local4,
			hintText = Engine.Localize( "MENU_REPORT_GROUP_HINT" )
		}
	} )
	return f350_local0
end )
DataSources.GroupInvitesOverviewButtonList = ListHelper_SetupDataSource( "GroupInvitesOverviewButtonList", function ( f353_arg0 )
	local f353_local0 = {}
	table.insert( f353_local0, {
		models = {
			displayText = Engine.Localize( "MPUI_PLAYER_DETAILS" ),
			icon = "t7_icon_menu_simple_media_manager",
			hintText = Engine.Localize( "MENU_GROUP_INVITES_PLAYER_DETAILS_DESC" )
		},
		properties = {
			action = GroupInvitesOpenPlayerDetails,
			actionParam = {
				controller = f353_arg0,
				gamertag = sentByGamertag,
				xuid = sentByXuid
			}
		}
	} )
	return f353_local0
end )
DataSources.GroupLeaderboardOptionsList = ListHelper_SetupDataSource( "GroupHeadquartersAdminOptionsListModel", function ( f354_arg0 )
	local f354_local0 = {}
	table.insert( f354_local0, {
		models = {
			displayText = "GROUPS_EDIT_LEADERBOARD",
			icon = "t7_icon_menu_simple_rename",
			hintText = Engine.Localize( "GROUPS_EDIT_LEADERBOARD_HINT_TEXT" )
		},
		properties = {
			action = EditGroupLeaderboard
		}
	} )
	table.insert( f354_local0, {
		models = {
			displayText = "GROUPS_REMOVE_LEADERBOARD",
			icon = "t7_mp_icon_groups_remove",
			hintText = Engine.Localize( "GROUPS_REMOVE_LEADERBOARD_HINT_TEXT" )
		},
		properties = {
			action = RemoveGroupLeaderboard
		}
	} )
	return f354_local0
end )
DataSources.GroupHeadquartersAdminOptionsList = ListHelper_SetupDataSource( "GroupHeadquartersAdminOptionsListModel", function ( f355_arg0 )
	local f355_local0 = {}
	local f355_local1 = Engine.GetModelForController( f355_arg0 )
	local f355_local2 = Engine.GetModelValue( Engine.CreateModel( f355_local1, "Social.selectedFriendXUID" ) )
	local f355_local3 = Engine.GetModelValue( Engine.CreateModel( f355_local1, "Social.selectedFriendGamertag" ) )
	local f355_local4 = f355_local2 == Engine.GetXUID64( f355_arg0 )
	local f355_local5 = Engine.GetModelValue( Engine.CreateModel( f355_local1, "Social.selectedFriendInTitle" ) )
	if f355_local2 == nil then
		return f355_local0
	elseif HasAdminPrivilege( f355_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_MANAGE_ADMINS ) then
		if not IsGroupAdmin( f355_arg0, f355_local2 ) then
			table.insert( f355_local0, {
				models = {
					displayText = "GROUPS_PROMOTE_TO_ADMIN_CAPS",
					icon = "t7_mp_icon_groups_primary",
					hintText = Engine.Localize( "GROUPS_PROMOTE_TO_ADMIN_DESC" )
				},
				properties = {
					action = PromoteSelectedGroupMemberToAdmin,
					params = {
						controller = f355_arg0,
						gamertag = f355_local3,
						xuid = f355_local2
					}
				}
			} )
		elseif IsGroupAdmin( f355_arg0, f355_local2 ) then
			table.insert( f355_local0, {
				models = {
					displayText = "GROUPS_DEMOTE_ADMIN_CAPS",
					icon = "t7_mp_icon_groups_remove",
					hintText = Engine.Localize( "GROUPS_DEMOTE_ADMIN_DESC" )
				},
				properties = {
					action = DemoteAdminToRegularMember,
					params = {
						controller = f355_arg0,
						gamertag = f355_local3,
						xuid = f355_local2
					}
				}
			} )
		end
	end
	if HasAdminPrivilege( f355_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_REMOVE_MEMBERS ) then
		table.insert( f355_local0, {
			models = {
				displayText = "GROUPS_REMOVE_FROM_GROUP_CAPS",
				icon = "t7_mp_icon_groups_remove",
				hintText = Engine.Localize( "GROUPS_REMOVE_FROM_GROUP_DESC" )
			},
			properties = {
				action = RemoveFromGroup,
				params = {
					controller = f355_arg0,
					gamertag = f355_local3,
					xuid = f355_local2
				}
			}
		} )
	end
	if HasAdminPrivilege( f355_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_BAN_MEMBERS ) then
		table.insert( f355_local0, {
			models = {
				displayText = "GROUPS_BAN_FROM_GROUP_CAPS",
				icon = "t7_mp_icon_groups_ban",
				hintText = Engine.Localize( "GROUPS_BAN_FROM_GROUP_DESC" )
			},
			properties = {
				action = BanFromGroup,
				params = {
					controller = f355_arg0,
					gamertag = f355_local3,
					xuid = f355_local2
				}
			}
		} )
	end
	return f355_local0
end )
DataSources.GroupHeadquartersAdminButtonList = ListHelper_SetupDataSource( "GroupHeadquartersAdminButtonListModel", function ( f356_arg0 )
	local f356_local0 = {}
	table.insert( f356_local0, {
		models = {
			displayText = Engine.Localize( "GROUPS_JOIN_REQUESTS" ),
			action = CoD.NullFunction,
			disabled = not HasAdminPrivilege( f356_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_APPROVE_JOIN_REQUESTS ),
			frameWidget = "CoD.AdminTabGroupApplicationsFrame"
		},
		properties = {
			disabledAllowNav = true
		}
	} )
	table.insert( f356_local0, {
		models = {
			displayText = Engine.Localize( "GROUPS_ADMIN_SETTINGS" ),
			action = CoD.NullFunction,
			disabled = not HasAdminPrivilege( f356_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_MANAGE_ADMINS ),
			frameWidget = "CoD.AdminTabGroupAdminsFrame"
		},
		properties = {
			disabledAllowNav = true
		}
	} )
	table.insert( f356_local0, {
		models = {
			displayText = Engine.Localize( "GROUPS_BANNED_MEMBERS" ),
			action = CoD.NullFunction,
			disabled = not HasAdminPrivilege( f356_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_BAN_MEMBERS ),
			frameWidget = "CoD.AdminTabGroupBannedMembersFrame"
		},
		properties = {
			disabledAllowNav = true
		}
	} )
	local f356_local1 = false
	if HasAdminPrivilege( f356_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE ) or HasAdminPrivilege( f356_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_DESCRIPTION ) or HasAdminPrivilege( f356_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_EMBLEM ) then
		f356_local1 = true
	end
	table.insert( f356_local0, {
		models = {
			displayText = Engine.Localize( "GROUPS_EDIT_GROUP_OVERVIEW" ),
			action = CoD.NullFunction,
			disabled = not f356_local1,
			frameWidget = "CoD.AdminTabGroupOverviewFrame"
		},
		properties = {
			disabledAllowNav = true
		}
	} )
	table.insert( f356_local0, {
		models = {
			displayText = Engine.Localize( "GROUPS_CHANGE_GROUP_TYPE" ),
			action = CoD.NullFunction,
			disabled = not HasAdminPrivilege( f356_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_TYPE ),
			frameWidget = "CoD.AdminTabGroupPrivacyFrame"
		},
		properties = {
			disabledAllowNav = true
		}
	} )
	table.insert( f356_local0, {
		models = {
			displayText = Engine.Localize( "GROUPS_EDIT_GROUP_NAME" ),
			action = EditSelectedGroupName,
			disabled = not HasAdminPrivilege( f356_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_NAME ),
			frameWidget = "CoD.AdminTabGroupNameFrame"
		},
		properties = {
			disabledAllowNav = true
		}
	} )
	if IsGroupOwner( f356_arg0 ) then
		table.insert( f356_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_TRANSFER_OWNERSHIP" ),
				action = CoD.NullFunction,
				frameWidget = "CoD.AdminTabGroupAdminsTransferOwnershipFrame"
			}
		} )
		table.insert( f356_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_DELETE_GROUP" ),
				action = ProcessLeaveSelectedGroup,
				frameWidget = "CoD.AdminTabGroupDeleteFrame"
			}
		} )
	end
	return f356_local0
end )
DataSources.SelectedGroup = {
	getModel = function ( f357_arg0 )
		if not f357_arg0 then
			f357_arg0 = Engine.GetPrimaryController()
		end
		return CoD.perController[f357_arg0].selectedGroup
	end
}
DataSources.CreateGroup = {
	getModel = function ( f358_arg0 )
		if not f358_arg0 then
			f358_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f358_arg0 ), "groups" ), "createGroup" )
	end
}
DataSources.GroupPrivacyModes = ListHelper_SetupDataSource( "GroupPrivacyModes", function ( f359_arg0 )
	local f359_local0 = {
		{
			name = "GROUPS_PRIVACY_PUBLIC",
			value = Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC
		},
		{
			name = "GROUPS_PRIVACY_PRIVATE",
			value = Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE
		}
	}
	local f359_local1 = {}
	local f359_local2 = Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC
	if CoD.perController[f359_arg0].selectedGroup and Engine.GetModel( CoD.perController[f359_arg0].selectedGroup, "privacy" ) then
		f359_local2 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f359_arg0].selectedGroup, "privacy" ) )
	end
	for f359_local6, f359_local7 in ipairs( f359_local0 ) do
		table.insert( f359_local1, {
			models = {
				text = f359_local0[f359_local6].name,
				value = f359_local0[f359_local6].value
			},
			properties = {
				title = f359_local0[f359_local6].name,
				value = f359_local0[f359_local6].value,
				action = GroupChangePrivacy,
				selectIndex = f359_local2 == f359_local0[f359_local6].value,
				loopEdges = #f359_local0 <= 2
			}
		} )
	end
	f359_local1[1].properties.first = true
	f359_local1[#f359_local0].properties.last = true
	return f359_local1
end, nil, nil, nil )
DataSources.GroupsSearchGroupType = ListHelper_SetupDataSource( "GroupsSearchGroupType", function ( f360_arg0 )
	local f360_local0 = {
		{
			name = "GROUPS_PRIVACY_PUBLIC",
			value = Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC
		},
		{
			name = "GROUPS_PRIVACY_PRIVATE",
			value = Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE
		}
	}
	local f360_local1 = {}
	for f360_local5, f360_local6 in ipairs( f360_local0 ) do
		table.insert( f360_local1, {
			models = {
				text = f360_local0[f360_local5].name,
				value = f360_local0[f360_local5].value
			},
			properties = {
				title = f360_local0[f360_local5].name,
				value = f360_local0[f360_local5].value,
				action = GroupChangeSearchParamGroupType,
				selectIndex = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f360_arg0 ), "groups.searchGroupsGroupType" ) ) == f360_local0[f360_local5].value,
				loopEdges = #f360_local0 <= 2
			}
		} )
	end
	f360_local1[1].properties.first = true
	f360_local1[#f360_local0].properties.last = true
	return f360_local1
end, nil, nil, nil )
DataSources.GroupsSearchGroupSize = ListHelper_SetupDataSource( "GroupsSearchGroupSize", function ( f361_arg0 )
	local f361_local0 = {
		{
			name = "GROUPS_SEARCH_SIZE_RANGE_ANY",
			value = Enum.GroupSearchSizeRangeIndex.GROUP_SEARCH_SIZE_RANGE_INDEX_ANY
		},
		{
			name = "GROUPS_SEARCH_SIZE_RANGE_1",
			value = Enum.GroupSearchSizeRangeIndex.GROUP_SEARCH_SIZE_RANGE_INDEX_1
		},
		{
			name = "GROUPS_SEARCH_SIZE_RANGE_2",
			value = Enum.GroupSearchSizeRangeIndex.GROUP_SEARCH_SIZE_RANGE_INDEX_2
		},
		{
			name = "GROUPS_SEARCH_SIZE_RANGE_3",
			value = Enum.GroupSearchSizeRangeIndex.GROUP_SEARCH_SIZE_RANGE_INDEX_3
		},
		{
			name = "GROUPS_SEARCH_SIZE_RANGE_4",
			value = Enum.GroupSearchSizeRangeIndex.GROUP_SEARCH_SIZE_RANGE_INDEX_4
		}
	}
	local f361_local1 = {}
	for f361_local5, f361_local6 in ipairs( f361_local0 ) do
		table.insert( f361_local1, {
			models = {
				text = f361_local0[f361_local5].name,
				value = f361_local0[f361_local5].value
			},
			properties = {
				title = f361_local0[f361_local5].name,
				value = f361_local0[f361_local5].value,
				action = GroupChangeSearchParamGroupSize,
				selectIndex = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f361_arg0 ), "groups.searchGroupsGroupSize" ) ) == f361_local0[f361_local5].value
			}
		} )
	end
	f361_local1[1].properties.first = true
	f361_local1[#f361_local0].properties.last = true
	return f361_local1
end, nil, nil, nil )
DataSources.GroupJoinApprovalTypes = ListHelper_SetupDataSource( "GroupJoinApprovalTypes", function ( f362_arg0 )
	local f362_local0 = {
		{
			name = "GROUPS_JOIN_APPROVAL_OFF",
			value = Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF
		},
		{
			name = "GROUPS_JOIN_APPROVAL_ON",
			value = Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_ON
		}
	}
	local f362_local1 = {}
	for f362_local5, f362_local6 in ipairs( f362_local0 ) do
		table.insert( f362_local1, {
			models = {
				text = f362_local0[f362_local5].name,
				value = f362_local0[f362_local5].value,
				selectIndex = 1
			},
			properties = {
				title = f362_local0[f362_local5].name,
				value = f362_local0[f362_local5].value,
				action = GroupChangeJoinApprovalType,
				selectIndex = f362_local0[f362_local5].value == Engine.GetSelectedGroupJoinApprovalType(),
				loopEdges = #f362_local0 <= 2
			}
		} )
	end
	f362_local1[1].properties.first = true
	f362_local1[#f362_local0].properties.last = true
	return f362_local1
end, nil, nil, nil )
DataSources.LeaderboardMakerButtonList = {
	prepare = function ( f363_arg0, f363_arg1, f363_arg2 )
		f363_arg1.buttons = {}
		local f363_local0 = {}
		local f363_local1 = ""
		local f363_local2 = Engine.GetModelForController( f363_arg0 )
		local f363_local3 = Engine.GetModel( f363_local2, "groups.leaderboardmaker.state" )
		local f363_local4 = Engine.GetModelValue( f363_local3 )
		local f363_local5 = Engine.GetModel( Engine.GetModelForController( f363_arg0 ), "groups.selectedGroup" )
		local f363_local6 = Engine.GetModelValue( Engine.GetModel( f363_local5, "lbDef" ) )
		local f363_local7 = Engine.GetModelValue( Engine.GetModel( f363_local5, "lbHardcore" ) )
		local f363_local8 = Engine.GetModelValue( Engine.GetModel( f363_local5, "lbArena" ) )
		local f363_local9 = Engine.GetModelValue( Engine.GetModel( f363_local5, "lbSortType" ) )
		local f363_local10 = Engine.GetModelValue( Engine.GetModel( f363_local5, "lbTimeFrame" ) )
		local f363_local11 = Engine.GetModelValue( Engine.GetModel( f363_local5, "lbInitialized" ) )
		if f363_local7 then
			f363_local6 = string.gsub( f363_local6, "_HC", "" )
		end
		if f363_local8 then
			f363_local6 = string.gsub( f363_local6, "_ARENA", "" )
		end
		local f363_local12 = ""
		local f363_local13 = Engine.GetModelValue( Engine.GetModel( f363_local2, "groups.leaderboardmaker.lbDefOriginal" ) )
		if f363_local13 ~= "" and CoD.LeaderboardUtility.leaderboardInfo[f363_local13] then
			f363_local12 = CoD.LeaderboardUtility.leaderboardInfo[f363_local13].icon
		end
		f363_arg1.leaderboardMakerStateModel = f363_local3
		if f363_local4 ~= nil then
			if f363_local4 == "ChooseBaseLeaderboard" then
				f363_local1 = "GROUPS_LBMAKER_CHOOSE_BASE_LEADERBOARD_TITLE"
				local f363_local14 = CoD.LeaderboardUtility.leaderboardTab.core
				local f363_local15 = f363_local14.leaderboardList
				local f363_local16 = f363_local14.leaderboardSuffix
				local f363_local17 = function ( f364_arg0 )
					local f364_local0
					if f364_arg0 ~= "prop" and f364_arg0 ~= "sas" and f364_arg0 ~= "sniperonly" and f364_arg0 ~= "infect" then
						f364_local0 = false
					else
						f364_local0 = true
					end
					return f364_local0
				end
				
				for f363_local21, f363_local22 in pairs( f363_local15 ) do
					local f363_local23 = CoD.LeaderboardUtility.leaderboardInfo[f363_local22]
					if not CoD.IsHiddenDLC( f363_local23.dlcBit ) and not f363_local17( f363_local23.gameType ) then
						table.insert( f363_local0, {
							models = {
								titleText = f363_local1,
								displayText = LocalizeToUpperString( f363_local23.title ),
								hintText = Engine.Localize( "GROUPS_LBMAKER_" .. f363_local23.gameType .. "_HINT_TEXT" ),
								action = ProcessChooseBaseLeaderboard,
								icon = f363_local23.icon,
								lbDef = f363_local22 .. f363_local16
							},
							properties = {
								showSelectedIcon = f363_local11 and f363_local22 .. f363_local16 == f363_local6
							}
						} )
					end
				end
			elseif f363_local4 == "ChooseTimeFrame" then
				f363_local1 = "GROUPS_LBMAKER_CHOOSE_TIME_FRAME_TITLE"
				for f363_local14 = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
					local f363_local18 = CoD.Leaderboard_MP.LeaderboardTimeFrames[f363_local14]
					local f363_local19 = table.insert
					local f363_local20 = f363_local0
					local f363_local21 = {
						models = {
							titleText = f363_local1,
							displayText = f363_local18.stringRef,
							action = ProcessChooseTimeFrame,
							hintText = Engine.Localize( f363_local18.lbMakerHint ),
							icon = f363_local12,
							baseLeaderboard = "",
							timeFrame = f363_local18.stringRef
						}
					}
					local f363_local22 = {}
					local f363_local23
					if f363_local18.value == f363_local10 then
						f363_local23 = f363_local11
					else
						f363_local23 = false
					end
					f363_local22.showSelectedIcon = f363_local23
					f363_local22.value = f363_local18.value
					f363_local21.properties = f363_local22
					f363_local19( f363_local20, f363_local21 )
				end
			elseif f363_local4 == "ChooseDefaultSort" then
				f363_local1 = "GROUPS_LBMAKER_CHOOSE_DEFAULT_SORT_TITLE"
				if CoD.LeaderboardUtility.sortColumns[f363_local13] then
					for f363_local17, f363_local18 in ipairs( CoD.LeaderboardUtility.sortColumns[f363_local13] ) do
						local f363_local19 = "GROUPS_LBMAKER_" .. f363_local18.lbSortType .. "_HINT_TEXT"
						if f363_local18.lbSortType == "" then
							if f363_local13 == "LB_MP_GB_SCORE" then
								f363_local19 = "GROUPS_LBMAKER_SCORE_HINT_TEXT"
							else
								f363_local19 = "GROUPS_LBMAKER_SPM_HINT_TEXT"
							end
						end
						local f363_local20 = table.insert
						local f363_local21 = f363_local0
						local f363_local22 = {
							models = {
								titleText = f363_local1,
								displayText = f363_local18.columnStr,
								action = ProcessChooseDefaultSort,
								hintText = Engine.Localize( f363_local19 ),
								icon = f363_local12,
								baseLeaderboard = ""
							}
						}
						local f363_local23 = {}
						local f363_local24
						if f363_local18.lbSortType == f363_local9 then
							f363_local24 = f363_local11
						else
							f363_local24 = false
						end
						f363_local23.showSelectedIcon = f363_local24
						f363_local23.value = f363_local18.lbSortType
						f363_local22.properties = f363_local23
						f363_local20( f363_local21, f363_local22 )
					end
				end
			elseif f363_local4 == "ChooseHardcore" then
				f363_local1 = "GROUPS_LBMAKER_CHOOSE_HARDCORE"
				local f363_local14 = table.insert
				local f363_local15 = f363_local0
				local f363_local16 = {
					models = {
						titleText = f363_local1,
						displayText = "GROUPS_CORE_CAPS",
						action = ProcessChooseHardcoreAndArena,
						hintText = Engine.Localize( "GROUPS_CORE_DESC" ),
						icon = f363_local12,
						baseLeaderboard = "",
						timeFrame = ""
					}
				}
				local f363_local17 = {}
				local f363_local25 = f363_local11
				local f363_local18
				if not f363_local7 then
					f363_local18 = not f363_local8
				else
					f363_local18 = false
				end
				f363_local17.showSelectedIcon = f363_local18
				f363_local17.disabled = false
				f363_local17.value = ""
				f363_local16.properties = f363_local17
				f363_local14( f363_local15, f363_local16 )
				f363_local14 = true
				for f363_local18, f363_local19 in ipairs( CoD.LeaderboardUtility.leaderboardListHardcore ) do
					if f363_local19 == f363_local13 then
						f363_local14 = false
					end
				end
				table.insert( f363_local0, {
					models = {
						titleText = f363_local1,
						displayText = "GROUPS_HARDCORE_CAPS",
						action = ProcessChooseHardcoreAndArena,
						hintText = Engine.Localize( "GROUPS_HARDCORE_DESC" ),
						icon = f363_local12,
						baseLeaderboard = "",
						timeFrame = ""
					},
					properties = {
						showSelectedIcon = f363_local7 and f363_local11 and not f363_local8,
						disabled = f363_local14,
						value = "HC"
					}
				} )
				f363_local15 = true
				for f363_local19, f363_local20 in ipairs( CoD.LeaderboardUtility.leaderboardListArena ) do
					if f363_local20 == f363_local13 .. "_ARENA" then
						f363_local15 = false
					end
				end
				f363_local16 = table.insert
				f363_local17 = f363_local0
				f363_local18 = {
					models = {
						titleText = f363_local1,
						displayText = "MENU_ARENA_CAPS",
						action = ProcessChooseHardcoreAndArena,
						hintText = Engine.Localize( "MENU_ARENA_OVERVIEW_DESC" ),
						icon = f363_local12,
						baseLeaderboard = "",
						timeFrame = ""
					}
				}
				f363_local19 = {}
				local f363_local26 = f363_local11
				if not f363_local7 then
					f363_local20 = f363_local8
				else
					f363_local20 = false
				end
				f363_local19.showSelectedIcon = f363_local20
				f363_local19.disabled = f363_local15
				f363_local19.value = "ARENA"
				f363_local18.properties = f363_local19
				f363_local16( f363_local17, f363_local18 )
			end
		end
		for f363_local17, f363_local18 in ipairs( f363_local0 ) do
			local f363_local19 = f363_local18.models
			local f363_local20 = f363_local18.properties
			local f363_local21 = Engine.CreateModel( Engine.GetModel( f363_local2, "groups.leaderboardmaker" ), "buttonModel_" .. f363_local17 )
			table.insert( f363_arg1.buttons, {
				model = f363_local21,
				properties = f363_local20
			} )
			Engine.SetModelValue( Engine.CreateModel( f363_local21, "titleText" ), Engine.Localize( f363_local19.titleText ) )
			Engine.SetModelValue( Engine.CreateModel( f363_local21, "displayText" ), Engine.Localize( f363_local19.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f363_local21, "hintText" ), f363_local19.hintText )
			Engine.SetModelValue( Engine.CreateModel( f363_local21, "action" ), f363_local19.action )
			Engine.SetModelValue( Engine.CreateModel( f363_local21, "icon" ), f363_local19.icon )
			Engine.SetModelValue( Engine.CreateModel( f363_local21, "lbDef" ), f363_local19.lbDef )
			Engine.SetModelValue( Engine.CreateModel( f363_local21, "sortColumn" ), f363_local19.sortColumn )
			Engine.SetModelValue( Engine.CreateModel( f363_local21, "timeFrame" ), f363_local19.timeFrame )
		end
		if not f363_arg1.makerSubscription then
			f363_arg1.makerSubscription = f363_arg1:subscribeToModel( f363_arg1.leaderboardMakerStateModel, function ()
				f363_arg1:updateDataSource()
			end, false )
		end
	end,
	getCount = function ( f366_arg0 )
		return #f366_arg0.buttons
	end,
	getCustomPropertiesForItem = function ( f367_arg0, f367_arg1 )
		return f367_arg0.buttons[f367_arg1].properties
	end,
	getItem = function ( f368_arg0, f368_arg1, f368_arg2 )
		return f368_arg1.buttons[f368_arg2].model
	end
}
DataSources.Leaderboard = {
	getModel = function ( f369_arg0 )
		local f369_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
		Engine.CreateModel( f369_local0, "controller" )
		Engine.CreateModel( f369_local0, "error" )
		Engine.CreateModel( f369_local0, "isUpdating" )
		Engine.CreateModel( f369_local0, "numResults" )
		Engine.CreateModel( f369_local0, "totalResults" )
		return f369_local0
	end
}
DataSources.LeaderboardHeader = {
	getModel = function ( f370_arg0 )
		if not f370_arg0 then
			f370_arg0 = Engine.GetPrimaryController()
		end
		local f370_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "header" )
		local f370_local1 = 3
		local f370_local2 = 5
		local f370_local3 = f370_local1 - 1
		local f370_local4 = {}
		local f370_local5, f370_local6 = nil
		local f370_local7 = 1
		local f370_local8 = Engine.GetLeaderboardHeaders( f370_arg0 )
		if f370_local8 == nil then
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "baseLeaderboard" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "timeFrame" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "position" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "rank" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "name" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "column0" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "column1" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "column2" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "column3" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "column4" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f370_local0, "numDataColumns" ), 0 )
			return f370_local0
		end
		local f370_local9 = f370_local8.lbheaders
		if f370_local1 < tonumber( f370_local9.count ) then
			f370_local5 = f370_local9.count - f370_local1
		else
			f370_local5 = 0
		end
		local f370_local10 = f370_local2 - f370_local5
		for f370_local11 = 1, f370_local3, 1 do
			f370_local4[f370_local11] = f370_local9[f370_local7]
			f370_local7 = f370_local7 + 1
		end
		for f370_local11 = 1, f370_local2, 1 do
			if f370_local11 <= f370_local10 then
				f370_local4[f370_local11 + f370_local3] = ""
			else
				f370_local4[f370_local11 + f370_local3] = f370_local9[f370_local7]
				f370_local7 = f370_local7 + 1
			end
		end
		local f370_local11 = ""
		local f370_local12 = ""
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "baseLeaderboard" ), f370_local11 )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "timeFrame" ), f370_local12 )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "position" ), f370_local4[1] )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "rank" ), Engine.Localize( "MENU_LB_LEVEL" ) )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "name" ), f370_local4[2] )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "column0" ), f370_local4[3] )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "column1" ), f370_local4[4] )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "column2" ), f370_local4[5] )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "column3" ), f370_local4[6] )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "column4" ), f370_local4[7] )
		Engine.SetModelValue( Engine.CreateModel( f370_local0, "numDataColumns" ), f370_local5 )
		return f370_local0
	end
}
DataSources.LeaderboardRows = {
	prepare = function ( f371_arg0, f371_arg1, f371_arg2 )
		f371_arg1.buttons = {}
		local f371_local0 = {}
		local f371_local1 = IsCustomLeaderboard( f371_arg0 )
		local f371_local2 = CoD.GetCombatRecordMode()
		CoD.perController[f371_arg0].leaderboardTopOrBottom = nil
		local f371_local3 = CoD.perController[f371_arg0].pivotPosition
		local f371_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
		local f371_local5 = Engine.CreateModel( f371_local4, "rows" )
		f371_arg1.rootModel = f371_local5
		local f371_local6 = string.format( "%d %d %d", CoD.BOIIOrange.r * 255, CoD.BOIIOrange.g * 255, CoD.BOIIOrange.b * 255 )
		local f371_local7 = string.format( "%d %d %d", CoD.white.r * 255, CoD.white.g * 255, CoD.white.b * 255 )
		local f371_local8 = string.format( "%d %d %d", CoD.playerYellow.r * 255, CoD.playerYellow.g * 255, CoD.playerYellow.b * 255 )
		local f371_local9 = Engine.GetXUID64( f371_arg0 )
		local f371_local10 = Engine.GetLeaderboardData( f371_arg0, f371_local2 )
		local f371_local11 = Engine.GetLeaderboardHeaders( f371_arg0 )
		local f371_local12 = 4
		local f371_local13 = 5
		local f371_local14 = 3
		for f371_local15 = 1, #f371_local10, 1 do
			local f371_local18 = f371_local10[f371_local15]
			local f371_local19 = f371_local13 - #f371_local18 - f371_local12
			local f371_local20 = {}
			local f371_local21 = {}
			local f371_local22 = false
			local f371_local23 = f371_local12 + 1
			local f371_local24 = f371_local7
			local f371_local25 = f371_local7
			if f371_local9 == f371_local18.xuid then
				f371_local24 = f371_local8
				f371_local25 = f371_local8
			end
			local f371_local26 = {
				position = 0,
				positionUI = 0,
				gamertag = "",
				rank = 0,
				rankIcon = "",
				rankString = "",
				plevel = 0,
				paragonRank = 0,
				paragonIconId = CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID,
				colData = {},
				colColor = {},
				statData = {},
				statColor = {},
				statLabel = {}
			}
			for f371_local27 = #f371_local18, 1, -1 do
				if f371_local18[f371_local27].rankCol then
					f371_local26.position = f371_local18[f371_local27].col
					f371_local26.positionUI = f371_local26.position
				end
				if f371_local18[f371_local27].gamertagCol then
					f371_local26.gamertag = f371_local18[f371_local27].col
				end
				if f371_local18[f371_local27].type == LuaEnums.LBCOL_TYPE.LBCOL_TYPE_PRESTIGE then
					f371_local26.plevel, f371_local26.paragonRank, f371_local26.paragonIconId = LuaUtils.ConvertFromPrestigeMerged( tonumber( f371_local18[f371_local27].col ) )
				end
				if f371_local18[f371_local27].type == LuaEnums.LBCOL_TYPE.LBCOL_TYPE_LEVELXP and not IsFreerunLeaderboard( f371_arg0 ) then
					f371_local26.rank = tonumber( f371_local18[f371_local27].col )
				end
				if f371_local27 == 3 and IsFreerunLeaderboard( f371_arg0 ) then
					f371_local18[f371_local27].col = NumberAsTime( f371_local18[f371_local27].col )
				end
				table.insert( f371_local26.colData, f371_local18[f371_local27].col )
				table.insert( f371_local26.colColor, f371_local24 )
			end
			f371_local26.rankString = CoD.GetRankName( f371_local26.rank - 1, f371_local26.plevel, f371_local2 )
			f371_local26.rankIcon = CoD.GetRankOrParagonIcon( f371_local26.rank - 1, f371_local26.plevel, f371_local26.paragonIconId, f371_local2 )
			if IsGameModeParagonCapable( f371_local2 ) and f371_local26.plevel == Engine.GetPrestigeCap( f371_local2 ) then
				f371_local26.rank = tonumber( Engine.GetParagonRankDisplayLevel( f371_local26.paragonRank, f371_local2 ) )
				f371_local25 = string.format( "%d %d %d", ColorSet.ParagonRank.r * 255, ColorSet.ParagonRank.g * 255, ColorSet.ParagonRank.b * 255 )
			end
			local f371_local27 = #f371_local26.colData
			local f371_local28 = f371_local13 - f371_local27
			f371_local26.colColor[f371_local27] = f371_local6
			for f371_local29 = 0, f371_local14 - 1, 1 do
				local f371_local32 = f371_local27 - f371_local29
				local f371_local33 = f371_local29 + 3
				if f371_local11.lbcolumnids[f371_local33] == 65534 and (f371_local11.lbcolumnnames[f371_local33] == "Score Per Minute" or f371_local11.lbcolumnnames[f371_local33] == "Points Per Game") and f371_local26.colData[f371_local32] == "-1" then
					f371_local26.positionUI = "-"
					f371_local26.colData[f371_local32] = "-"
				end
				table.insert( f371_local26.statData, f371_local26.colData[f371_local32] )
				table.insert( f371_local26.statColor, f371_local26.colColor[f371_local32] )
				table.insert( f371_local26.statLabel, f371_local11.lbheaders[f371_local33] )
			end
			for f371_local29 = 1, f371_local28, 1 do
				local f371_local34 = f371_local29
				table.insert( f371_local26.colData, "" )
				table.insert( f371_local26.colColor, f371_local24 )
			end
			local f371_local29 = false
			if f371_local3 then
				f371_local29 = tonumber( f371_local26.position ) == f371_local3
			else
				f371_local29 = f371_local9 == f371_local18.xuid
			end
			local f371_local30 = f371_local15
			if CoD.perController[f371_arg0].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE or CoD.perController[f371_arg0].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
				f371_local30 = tonumber( f371_local26.position )
			end
			local f371_local31 = f371_local26.positionUI
			if f371_local1 == true then
				f371_local31 = f371_local15
			end
			table.insert( f371_local0, {
				model = {
					position = f371_local26.position,
					positionUI = f371_local31,
					name = f371_local26.gamertag,
					rank = f371_local26.rank,
					rankColor = f371_local25,
					rankIcon = f371_local26.rankIcon,
					rankString = f371_local26.rankString,
					plevel = f371_local26.plevel,
					column0 = f371_local26.colData[5],
					column0color = f371_local26.colColor[5],
					column1 = f371_local26.colData[4],
					column1color = f371_local26.colColor[4],
					column2 = f371_local26.colData[3],
					column2color = f371_local26.colColor[3],
					column3 = f371_local26.colData[2],
					column3color = f371_local26.colColor[2],
					column4 = f371_local26.colData[1],
					column4color = f371_local26.colColor[1],
					stat0 = f371_local26.statData[1],
					stat0color = f371_local26.statColor[1],
					stat0label = f371_local26.statLabel[1],
					stat1 = f371_local26.statData[2],
					stat1color = f371_local26.statColor[2],
					stat1label = f371_local26.statLabel[2],
					stat2 = f371_local26.statData[3],
					stat2color = f371_local26.statColor[3],
					stat2label = f371_local26.statLabel[3],
					rowColor = f371_local24,
					xuid = f371_local18.xuid,
					backgroundId = 0,
					counterPosition = f371_local30
				},
				properties = {
					selectIndex = f371_local29
				}
			} )
		end
		for f371_local35, f371_local18 in ipairs( f371_local0 ) do
			local f371_local36 = f371_local18.model
			local f371_local19 = f371_local18.properties
			local f371_local20 = Engine.CreateModel( f371_local5, "buttonModel_" .. f371_local35 )
			table.insert( f371_arg1.buttons, {
				model = f371_local20,
				properties = f371_local19
			} )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "position" ), f371_local36.position )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "positionUI" ), f371_local36.positionUI )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "rankIcon" ), f371_local36.rankIcon )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "rank" ), f371_local36.rank )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "rankColor" ), f371_local36.rankColor )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "rankString" ), f371_local36.rankString )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "plevel" ), f371_local36.plevel )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "name" ), f371_local36.name )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column0" ), tostring( f371_local36.column0 ) )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column1" ), tostring( f371_local36.column1 ) )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column2" ), tostring( f371_local36.column2 ) )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column3" ), tostring( f371_local36.column3 ) )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column4" ), tostring( f371_local36.column4 ) )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column0color" ), f371_local36.column0color )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column1color" ), f371_local36.column1color )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column2color" ), f371_local36.column2color )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column3color" ), f371_local36.column3color )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "column4color" ), f371_local36.column4color )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat0" ), f371_local36.stat0 )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat1" ), f371_local36.stat1 )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat2" ), f371_local36.stat2 )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat0color" ), f371_local36.stat0color )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat1color" ), f371_local36.stat1color )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat2color" ), f371_local36.stat2color )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat0label" ), f371_local36.stat0label )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat1label" ), f371_local36.stat1label )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "stat2label" ), f371_local36.stat2label )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "rowColor" ), f371_local36.rowColor )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "xuid" ), f371_local36.xuid )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "backgroundId" ), f371_local36.backgroundId )
			Engine.SetModelValue( Engine.CreateModel( f371_local20, "counterPosition" ), f371_local36.counterPosition )
		end
		f371_arg1.leaderboardIsUpdatingModel = Engine.CreateModel( f371_local4, "isUpdating" )
		if f371_arg1.leaderboardIsUpdatingSubscription then
			f371_arg1:removeSubscription( f371_arg1.leaderboardIsUpdatingSubscription )
		end
		f371_arg1.leaderboardIsUpdatingSubscription = f371_arg1:subscribeToModel( f371_arg1.leaderboardIsUpdatingModel, function ( model )
			f371_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f373_arg0 )
		return #f373_arg0.buttons
	end,
	getCustomPropertiesForItem = function ( f374_arg0, f374_arg1 )
		return f374_arg0.buttons[f374_arg1].properties
	end,
	getItem = function ( f375_arg0, f375_arg1, f375_arg2 )
		return f375_arg1.buttons[f375_arg2].model
	end,
	cleanup = function ( f376_arg0 )
		if f376_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f376_arg0.rootModel )
			f376_arg0.rootModel = nil
		end
	end
}
DataSources.LeaderboardTabType = ListHelper_SetupDataSource( "LeaderboardTabType", function ( f377_arg0 )
	local f377_local0 = {}
	local f377_local1 = Engine.GetModel( Engine.GetGlobalModel(), "combatRecordMode" )
	if not f377_local1 then
		return f377_local0
	end
	local f377_local2 = Engine.GetModelValue( f377_local1 )
	if f377_local2 ~= "doa" then
		table.insert( f377_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
	end
	if f377_local2 == "cp" then
		table.insert( f377_local0, {
			models = {
				tabName = "MENU_LB_TAB_TRAINING_SIM_CAPS",
				tabIcon = "",
				tabCategory = "trainingSim"
			},
			properties = {
				tabId = "leaderboard_cp_trainingSim"
			}
		} )
	elseif f377_local2 == "mp" then
		table.insert( f377_local0, {
			models = {
				tabName = "MENU_LB_TAB_CORE_CAPS",
				tabIcon = "",
				tabCategory = "core"
			},
			properties = {
				tabId = "leaderboard_mp_core"
			}
		} )
		table.insert( f377_local0, {
			models = {
				tabName = "MENU_LB_TAB_HARDCORE_CAPS",
				tabIcon = "",
				tabCategory = "hardcore"
			},
			properties = {
				tabId = "leaderboard_mp_hardcore"
			}
		} )
		table.insert( f377_local0, {
			models = {
				tabName = "MENU_LB_TAB_ARENA_CAPS",
				tabIcon = "",
				tabCategory = "arena"
			},
			properties = {
				tabId = "leaderboard_mp_arena"
			}
		} )
		table.insert( f377_local0, {
			models = {
				tabName = "MENU_LB_TAB_FREERUN_CAPS",
				tabIcon = "",
				tabCategory = "freerun"
			},
			properties = {
				tabId = "leaderboard_mp_freerun"
			}
		} )
		table.insert( f377_local0, {
			models = {
				tabName = "MENU_LB_TAB_CUSTOM_CAPS",
				tabIcon = "",
				tabCategory = "custom"
			},
			properties = {
				tabId = "leaderboard_mp_custom"
			}
		} )
	elseif f377_local2 == "zm" then
		table.insert( f377_local0, {
			models = {
				tabName = "MENU_LB_TAB_ZMGLOBAL_CAPS",
				tabIcon = "",
				tabCategory = "zm_global"
			},
			properties = {
				tabId = "leaderboard_zm_global"
			}
		} )
		table.insert( f377_local0, {
			models = {
				tabName = "MENU_LB_TAB_ZMMAPS_CAPS",
				tabIcon = "",
				tabCategory = "zm_maps"
			},
			properties = {
				tabId = "leaderboard_zm_maps"
			}
		} )
	elseif f377_local2 == "doa" then
		table.insert( f377_local0, {
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
	if f377_local2 ~= "doa" then
		table.insert( f377_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
	end
	return f377_local0
end )
DataSources.LeaderboardMenuTitle = {
	getModel = function ( f378_arg0 )
		local f378_local0 = Engine.CreateModel( Engine.GetModelForController( f378_arg0 ), "leaderboardMenuTitle" )
		local f378_local1 = Engine.CreateModel( f378_local0, "title" )
		if IsLobbyLeaderboard( f378_arg0 ) then
			local f378_local2 = Engine.GetModelValue
			local f378_local3 = Engine.GetModel
			local f378_local4 = Engine.GetGlobalModel()
			Engine.SetModelValue( f378_local1, Engine.Localize( CoD.LeaderboardUtility.leaderboardInfo[f378_local2( f378_local3( Engine.GetGlobalModel(), "leaderboardDef" ) )].title ) )
			return f378_local0
		else
			local f378_local2 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
			if not f378_local2 then
				return f378_local0
			else
				local f378_local3 = Engine.GetModelValue( f378_local2 )
				if not f378_local3 then
					return f378_local0
				else
					Engine.SetModelValue( f378_local1, Engine.Localize( "MENU_LEADERBOARD_MENU_HEADER_CAPS", Engine.Localize( CoD.LeaderboardUtility.leaderboardTab[f378_local3].leaderboardHeaderText ) ) )
					return f378_local0
				end
			end
		end
	end
}
DataSources.TeamOperationSystem = {
	getModel = function ( f379_arg0 )
		if not f379_arg0 then
			f379_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f379_arg0 ), "teamOperationSystem" )
	end
}
DataSources.RaidsPurchases = {
	prepare = function ( f380_arg0, f380_arg1, f380_arg2 )
		
	end,
	getCount = function ( f381_arg0 )
		return #DataSources.RaidsPurchases.Items
	end,
	getItem = function ( f382_arg0, f382_arg1, f382_arg2 )
		return DataSources.RaidsPurchases.Items[f382_arg2]
	end
}
DataSources.Friends = {
	getCount = function ( f383_arg0 )
		return 10
	end,
	getItem = function ( f384_arg0, f384_arg1, f384_arg2 )
		local f384_local0 = {
			name = "Caezar",
			status = "Online",
			rank = "14",
			emblem = "menu_div_gold",
			rankIcon = "rank_com"
		}
		if f384_arg2 % 2 == 0 then
			f384_local0.name = "Bat35" .. f384_arg2
			f384_local0.emblem = "menu_div_bronze"
		end
		if f384_arg2 % 3 == 0 then
			f384_local0.name = "FakeForAll" .. f384_arg2
			f384_local0.emblem = "menu_div_silver"
			f384_local0.rankIcon = "rank_cpt"
			f384_local0.rank = 19
		end
		if f384_arg2 % 5 == 0 then
			f384_local0.name = "SuperGoat" .. f384_arg2
			f384_local0.emblem = "menu_div_bronze"
			f384_local0.rankIcon = "rank_sgt"
			f384_local0.rank = 34
		end
		if f384_arg2 % 7 == 0 then
			f384_local0.name = "SuperGoat" .. f384_arg2
			f384_local0.emblem = "menu_div_platinum"
			f384_local0.rankIcon = "rank_prestige02"
			f384_local0.rank = 50
		end
		local f384_local1 = Engine.CreateModel( Engine.GetModelForController( f384_arg0 ), "Friendz." .. f384_arg2 )
		for f384_local5, f384_local6 in pairs( f384_local0 ) do
			Engine.SetModelValue( Engine.CreateModel( f384_local1, f384_local5 ), f384_local6 )
		end
		return f384_local1
	end
}
DataSources.FriendsMainTabList = ListHelper_SetupDataSource( "FriendsMainTabModel", function ( f385_arg0 )
	local f385_local0 = {
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
		f385_local0 = {
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
	return f385_local0
end )
DataSources.LobbyFriends = {
	prepare = function ( f386_arg0, f386_arg1, f386_arg2 )
		local f386_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f386_arg0 ), "friends" ), "tab" ) )
		local f386_local1 = nil
		if f386_local0 == "friends" then
			f386_local1 = "unifiedListRoot"
		elseif f386_local0 == "recent" then
			f386_local1 = "rmpListRoot"
		elseif f386_local0 == "inbox" then
			f386_local1 = "inboxListRoot"
		elseif f386_local0 == "roster" then
			f386_local1 = "sgmListRoot"
		elseif f386_local0 == "grpmembers" then
			f386_local1 = "unifiedGroupMembersListRoot"
		else
			f386_local1 = "unifiedListRoot"
		end
		f386_arg1.unifiedFriendModel = Engine.GetModel( Engine.GetGlobalModel(), f386_local1 )
		f386_arg1.unifiedFriendCount = Engine.GetModel( f386_arg1.unifiedFriendModel, "count" )
		f386_arg1:unsubscribeFromAllModels()
		f386_arg1.countSubscription = f386_arg1:subscribeToModel( f386_arg1.unifiedFriendCount, function ( model )
			f386_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f388_arg0 )
		return Engine.GetModelValue( f388_arg0.unifiedFriendCount )
	end,
	getItem = function ( f389_arg0, f389_arg1, f389_arg2 )
		return Engine.GetModel( f389_arg1.unifiedFriendModel, "member" .. f389_arg2 - 1 )
	end
}
DataSources.GameScore = {
	getModel = function ( f390_arg0 )
		if not f390_arg0 then
			f390_arg0 = Engine.GetPrimaryController()
		end
		local f390_local0 = Engine.CreateModel( Engine.GetModelForController( f390_arg0 ), "gameScore" )
		if not Engine.IsInGame() then
			local f390_local1 = Engine.GetScoreboardData( f390_arg0 )
			Engine.SetModelValue( Engine.CreateModel( f390_local0, "alliesScore" ), f390_local1.scores.TEAM_ALLIES )
			Engine.SetModelValue( Engine.CreateModel( f390_local0, "axisScore" ), f390_local1.scores.TEAM_AXIS )
			if not IsTeamBasedOrInfect( f390_arg0 ) then
				Engine.SetModelValue( Engine.CreateModel( f390_local0, "firstPlaceXUID" ), f390_local1.topScore.topScoreXUID )
				Engine.SetModelValue( Engine.CreateModel( f390_local0, "highestScore" ), f390_local1.topScore.highestScore )
				Engine.SetModelValue( Engine.CreateModel( f390_local0, "highestScoreName" ), f390_local1.topScore.highestScoreName )
			end
		end
		return f390_local0
	end
}
DataSources.Equipment = {
	getModel = function ( f391_arg0 )
		if not f391_arg0 then
			f391_arg0 = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetModelForController( f391_arg0 ), "Equipment" )
	end
}
DataSources.ClientscriptDebugMenu = {
	prepare = function ( f392_arg0, f392_arg1, f392_arg2 )
		f392_arg1.cscDebugMenuModel = f392_arg1:getModel( Engine.GetPrimaryController(), "cscDebugMenu" )
		f392_arg1.cscDebugMenuCountModel = Engine.GetModel( f392_arg1.cscDebugMenuModel, "cscDebugMenuCount" )
		f392_arg1:unsubscribeFromAllModels()
		f392_arg1:subscribeToModel( f392_arg1.cscDebugMenuCountModel, function ()
			f392_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f394_arg0 )
		return Engine.GetModelValue( f394_arg0.cscDebugMenuCountModel )
	end,
	getItem = function ( f395_arg0, f395_arg1, f395_arg2 )
		return Engine.GetModel( f395_arg1.cscDebugMenuModel, "listItem" .. f395_arg2 - 1 )
	end
}
DataSources.CPMissionOverviewFrontend = {
	getModel = function ( f396_arg0 )
		DataSources.CPMapsList.prepare( f396_arg0, {} )
		local f396_local0 = 0
		local f396_local1 = Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
		if Engine.IsCampaignModeZombies() then
			f396_local1 = Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES
		end
		for f396_local5, f396_local6 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f397_arg0, f397_arg1 )
			return CoD.mapsTable[f397_arg0].unique_id < CoD.mapsTable[f397_arg1].unique_id
		end, nil ) do
			if f396_local6.session_mode == Enum.eModes.MODE_CAMPAIGN and f396_local6.campaign_mode == f396_local1 and f396_local6.dlc_pack ~= -1 and f396_local6.isSubLevel == false then
				f396_local0 = f396_local0 + 1
			end
		end
		f396_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
		if Engine.IsCampaignModeZombies() and string.find( f396_local2, "_nightmares" ) == nil then
			f396_local2 = f396_local2 .. "_nightmares"
		end
		for f396_local3 = 1, f396_local0, 1 do
			local f396_local7 = Engine.GetModel( Engine.GetModelForController( f396_arg0 ), "CPMapsList." .. f396_local3 )
			local f396_local8 = Engine.GetModel( f396_local7, "rootMapName" )
			if f396_local8 and Engine.GetModelValue( f396_local8 ) == f396_local2 then
				return f396_local7
			end
		end
	end
}
DataSources.CPMapsList = ListHelper_SetupDataSource( "CPMapsList", function ( f398_arg0 )
	local f398_local0 = {}
	local f398_local1 = 0
	local f398_local2 = Engine.IsCampaignModeZombies()
	if f398_local2 then
		f398_local2 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) ~= true
	end
	local f398_local3 = true
	for f398_local25, f398_local26 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f399_arg0, f399_arg1 )
		return CoD.mapsTable[f399_arg0].unique_id < CoD.mapsTable[f399_arg1].unique_id
	end, nil ) do
		local f398_local7
		if f398_local26.campaign_mode ~= Enum.CampaignMode.CAMPAIGNMODE_DEFAULT or f398_local2 then
			if f398_local26.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
				f398_local7 = f398_local2
			else
				f398_local7 = false
			end
		else
			f398_local7 = true
		end
		if f398_local25 == "cp_doa_bo3" then
			if Dvar.ui_doa_unlocked:get() and IsLive() then
				f398_local26.isSubLevel = false
			else
				f398_local26.isSubLevel = true
			end
		end
		if f398_local26.session_mode == Enum.eModes.MODE_CAMPAIGN and f398_local7 and f398_local26.dlc_pack ~= -1 and f398_local26.isSubLevel == false then
			local f398_local8, f398_local9 = GetCollectiblesXOfY( f398_arg0, f398_local25 )
			local f398_local10, f398_local11 = GetAccoladesXOfY( f398_arg0, f398_local25 )
			local f398_local12 = Engine.GetPlayerStats( f398_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
			local f398_local13 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true
			if f398_local13 then
				f398_local12 = Engine.StorageGetBuffer( f398_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
				if CoD.CombatRecordOtherPlayerStats then
					f398_local12 = Engine.GetOtherPlayerStatsBuffer()
				end
			end
			local f398_local14 = CoD.GetCombatRecordStatForPath( f398_local12, "allMapsUnlocked" )
			local f398_local15 = CoD.GetCombatRecordStatForPath( f398_local12, "PlayerStatsByMap." .. f398_local25 .. ".hasBeenCompleted" ) == 1
			local f398_local16 = false
			f398_local1 = f398_local1 + 1
			local f398_local17 = 0
			local f398_local18 = CoD.DIFFICULTY_ICON[0]
			local f398_local19 = CoD.DIFFICULTY[0]
			if f398_local14 ~= 1 and not f398_local15 then
				f398_local3 = f398_local3
			end
			local f398_local20 = 0
			if not f398_local16 then
				local f398_local21 = nil
				for f398_local22 = 0, 4, 1 do
					if CoD.GetCombatRecordStatForPath( f398_local12, "PlayerStatsByMap." .. f398_local25 .. ".completedDifficulties." .. tostring( f398_local22 ) ) == 1 then
						f398_local21 = f398_local22
					end
				end
				if f398_local15 and f398_local21 and 0 <= f398_local21 then
					f398_local17 = 1
					f398_local18 = CoD.DIFFICULTY_ICON[f398_local21]
					f398_local19 = CoD.DIFFICULTY[f398_local21]
				end
				f398_local20 = CoD.GetCombatRecordStatForPath( f398_local12, "PlayerStatsByMap." .. f398_local25 .. ".highestStats.SCORE" )
			end
			local f398_local22 = f398_local15 and (f398_local12 and CoD.GetCombatRecordStatForPath( f398_local12, "highestMapReached" )) < f398_local1
			local f398_local23 = false
			if not f398_local13 then
				local f398_local24 = Engine.GetSavedMap()
				if f398_local24 then
					if LUI.startswith( f398_local24, "cp_sh" ) then
						f398_local24 = Engine.GetSavedMapQueuedMap()
					end
					if f398_local24 and f398_local24 == f398_local26.rootMapName then
						f398_local23 = true
					end
				end
			end
			local f398_local24 = f398_local20
			if not f398_local15 then
				f398_local24 = "--"
			end
			table.insert( f398_local0, {
				models = {
					displayText = Engine.Localize( f398_local26.mapNameCaps ),
					Image = f398_local26.previewImage,
					name = f398_local26.mapName,
					mapName = f398_local26.mapName,
					rootMapName = f398_local26.rootMapName,
					mapLocation = f398_local26.mapLocation,
					mapDescription = f398_local26.mapDescription,
					bestTime = 0,
					stat = f398_local24,
					bestScore = f398_local20,
					completedDifficultyAlpha = f398_local17,
					completedDifficulty = f398_local18,
					completedDifficultyText = f398_local19,
					classified = f398_local16,
					collectiblesFound = f398_local8,
					collectiblesTotal = f398_local9,
					accoladesTotal = f398_local11,
					accoladesFound = f398_local10,
					completedOutOfOrder = f398_local22,
					completed = f398_local15,
					isCurrentMap = f398_local23,
					unique_id = f398_local26.unique_id
				},
				properties = {
					mapId = f398_local25,
					classified = f398_local16
				}
			} )
		end
	end
	return f398_local0
end )
DataSources.ZMMapsList = ListHelper_SetupDataSource( "ZMMapsList", function ( f400_arg0, f400_arg1 )
	local f400_local0 = {}
	if CoD.perController[f400_arg0].choosingZMPlaylist then
		local f400_local1 = Engine.GetPlaylistCategories()
		local f400_local2 = CoD.PlaylistCategoryFilter or ""
		local f400_local3 = FindPlaylistCategory( f400_local1, Engine.ProfileInt( f400_arg0, "playlist_" .. f400_local2 ) )
		local f400_local4 = 0
		for f400_local8, f400_local9 in ipairs( f400_local1 ) do
			if f400_local9.filter == f400_local2 then
				f400_local4 = f400_local4 + f400_local9.playerCount
			end
		end
		f400_local5 = function ( f401_arg0 )
			local f401_local0 = ""
			if Engine.DvarBool( nil, "groupCountsVisible" ) == true then
				f401_local0 = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( f401_arg0.playerCount ), CoD.separateNumberWithCommas( f400_local4 ) )
			else
				local f401_local1 = 0
				if f400_local4 > 0 then
					f401_local1 = math.floor( f401_arg0.playerCount / f400_local4 * 100 + 0.5 )
				end
				f401_local0 = Engine.Localize( "MENU_CATEGORY_USER_PERCENT", f401_local1 )
			end
			local f401_local1 = f401_arg0.playlists[1]
			local f401_local2 = true
			local f401_local3
			if f401_local1 then
				f401_local3 = Engine.IsPlaylistLocked( f400_arg0, f401_local1.index )
				if f401_local3 then
					if IsDvarValueEqualTo( "ui_freeDLC1", "1" ) and Engine.GetDLCBitForMapName( f401_arg0.ref ) == CoD.DLCBits.CONTENT_DLC1 then
						f401_local3 = false
					else
						f401_local3 = true
					end
				end
			else
				f401_local3 = true
			end
			if f401_local1 then
				f401_local2 = f401_local3 and not ShowPurchasableMap( f400_arg0, f401_arg0.ref )
			end
			if f401_local2 then
				return nil
			end
			local f401_local4 = f401_arg0.description
			if f401_local3 then
				f401_local4 = CoD.StoreUtility.AddUpsellToDescriptionIfNeeded( f400_arg0, f401_arg0.ref, f401_arg0.description )
			end
			local f401_local5 = Engine.IsMapValid( f401_arg0.ref )
			local f401_local6 = {
				models = {
					displayText = CoD.StoreUtility.PrependPurchaseIconIfNeeded( f400_arg0, f401_arg0.ref, Engine.ToUpper( f401_arg0.name ) ) or "",
					mapName = Engine.ToUpper( f401_arg0.name ) or "",
					Image = f401_arg0.icon or "playlist_standard",
					mapDescription = f401_local4,
					playingCount = f401_local0
				}
			}
			local f401_local7 = {
				id = f401_arg0.ref,
				mapId = f401_arg0.ref,
				category = f401_arg0,
				playlist = f401_local1,
				selectIndex = f401_arg0 == f400_local3,
				disabled = f401_local5 and f401_local3
			}
			local f401_local8
			if not f401_local5 then
				local f401_local9 = f401_local3
				f401_local8 = ShowPurchasableMap( f400_arg0, f401_arg0.ref )
			else
				f401_local8 = false
			end
			f401_local7.purchasable = f401_local8
			f401_local6.properties = f401_local7
			return f401_local6
		end
		
		for f400_local9, f400_local11 in ipairs( f400_local1 ) do
			if f400_local11.filter == f400_local2 then
				local f400_local10 = f400_local5( f400_local11 )
				if f400_local10 then
					table.insert( f400_local0, f400_local10 )
				end
			end
		end
		if not f400_arg1.updateLobbyButtonsSubscription then
			f400_arg1.updateLobbyButtonsSubscription = f400_arg1:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" ), function ()
				f400_arg1:updateDataSource( true )
			end, false )
		end
	else
		for f400_local4, f400_local5 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f403_arg0, f403_arg1 )
			return CoD.mapsTable[f403_arg0].unique_id < CoD.mapsTable[f403_arg1].unique_id
		end, nil ) do
			if f400_local5.session_mode == Enum.eModes.MODE_ZOMBIES and f400_local5.dlc_pack ~= -1 and (not CoD.IsHiddenDLC( Engine.GetDLCBitForMapName( f400_local4 ) ) or Engine.IsMapValid( f400_local4 )) and (ShowPurchasableMap( f400_arg0, f400_local4 ) or Engine.IsMapValid( f400_local4 )) then
				table.insert( f400_local0, {
					models = {
						displayText = CoD.StoreUtility.PrependPurchaseIconIfNeeded( f400_arg0, f400_local4, Engine.Localize( f400_local5.mapNameCaps ) ),
						Image = f400_local5.previewImage,
						mapName = f400_local5.mapName,
						mapLocation = f400_local5.mapLocation,
						mapDescription = CoD.StoreUtility.AddUpsellToDescriptionIfNeeded( f400_arg0, f400_local4, f400_local5.mapDescription ),
						playingCount = "",
						dlcIndex = f400_local5.dlc_pack
					},
					properties = {
						mapId = f400_local4,
						purchasable = not Engine.IsMapValid( f400_local4 )
					}
				} )
			end
		end
		if Mods_Enabled() then
			f400_local2 = Engine.Mods_Lists_GetInfoEntries( LuaEnums.USERMAP_BASE_PATH, 0, Engine.Mods_Lists_GetInfoEntriesCount( LuaEnums.USERMAP_BASE_PATH ) )
			if f400_local2 then
				for f400_local12 = 0, #f400_local2, 1 do
					local f400_local6 = f400_local2[f400_local12]
					if LUI.startswith( f400_local6.internalName, "zm_" ) then
						table.insert( f400_local0, {
							models = {
								displayText = string.sub( f400_local6.name, 1, 32 ),
								Image = f400_local6.ugcName,
								mapName = f400_local6.name,
								mapDescription = f400_local6.description
							},
							properties = {
								mapId = f400_local6.ugcName
							}
						} )
					end
				end
			end
		end
	end
	CoD.StoreUtility.AddListDLCListener( f400_arg1 )
	return f400_local0
end, true )
DataSources.ZMLobbyEEMapSelect = ListHelper_SetupDataSource( "ZMLobbyEEMapSelect", function ( f404_arg0, f404_arg1 )
	local f404_local0 = function ( f405_arg0 )
		return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "eeGateworm." .. f405_arg0 .. ".cumulative" ) == true
	end
	
	if not IsLive() then
		return {}
	end
	local f404_local1 = {}
	local f404_local2 = CoD.perController[f404_arg0].zmLobbyEEMapRef
	if not f404_local2 then
		return {}
	elseif not CoD.LobbyUtility.IsMapEEMap( f404_local2 ) then
		return {}
	end
	local f404_local3 = Engine.ToUpper( f404_local2 )
	if f404_local3 == "ZM_GENESIS" then
		for f404_local7, f404_local8 in ipairs( CoD.LobbyUtility.EEMapsList ) do
			if f404_local8 ~= f404_local3 then
				table.insert( f404_local1, {
					models = {
						mapRef = f404_local8,
						visible = CoD.LobbyUtility.GetAnyEECompletedForController( f404_arg0, f404_local3 ),
						completed = f404_local0( f404_local8 ),
						showingAll = true
					},
					properties = {}
				} )
			end
		end
	else
		table.insert( f404_local1, {
			models = {
				mapRef = f404_local3,
				visible = CoD.LobbyUtility.GetAnyEECompletedForController( f404_arg0, f404_local3 ),
				completed = CoD.LobbyUtility.GetEECompletedForControllerRef( f404_arg0, f404_local3 ),
				showingAll = false
			},
			properties = {}
		} )
	end
	return f404_local1
end, true )
DataSources.ZMLobbyEEMapVote = ListHelper_SetupDataSource( "ZMLobbyEEMapVote", function ( f406_arg0, f406_arg1 )
	local f406_local0 = function ( f407_arg0 )
		return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "eeGateworm." .. f407_arg0 .. ".cumulative" ) == true
	end
	
	if not IsLive() then
		return {}
	end
	local f406_local1 = {}
	local f406_local2 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
	if not f406_local2 then
		return {}
	elseif not CoD.LobbyUtility.IsMapEEMap( f406_local2 ) then
		return {}
	end
	local f406_local3 = Engine.ToUpper( f406_local2 )
	if f406_local3 == "ZM_GENESIS" then
		for f406_local7, f406_local8 in ipairs( CoD.LobbyUtility.EEMapsList ) do
			if f406_local8 ~= f406_local3 then
				table.insert( f406_local1, {
					models = {
						mapRef = f406_local8,
						visible = CoD.LobbyUtility.GetAnyEECompletedForController( f406_arg0, f406_local3 ),
						completed = f406_local0( f406_local8 ),
						showingAll = true
					},
					properties = {}
				} )
			end
		end
	else
		table.insert( f406_local1, {
			models = {
				mapRef = f406_local3,
				visible = CoD.LobbyUtility.GetAnyEECompletedForController( f406_arg0, f406_local3 ),
				completed = CoD.LobbyUtility.GetEECompletedForControllerRef( f406_arg0, f406_local3 ),
				showingAll = false
			},
			properties = {}
		} )
	end
	return f406_local1
end, nil, nil, function ( f408_arg0, f408_arg1, f408_arg2 )
	local f408_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
	if f408_arg1.updateMapVoteSubscription then
		f408_arg1:removeSubscription( f408_arg1.updateMapVoteSubscription )
	end
	for f408_local4, f408_local5 in ipairs( CoD.LobbyUtility.EEMapsList ) do
		if f408_arg1[f408_local5 .. "CumulativeSubscription"] then
			f408_arg1:removeSubscription( f408_arg1[f408_local5 .. "CumulativeSubscription"] )
		end
	end
	f408_arg1.updateMapVoteSubscription = f408_arg1:subscribeToModel( f408_local0, function ()
		f408_arg1:updateDataSource()
	end, false )
	for f408_local4, f408_local5 in ipairs( CoD.LobbyUtility.EEMapsList ) do
		f408_arg1[f408_local5 .. "CumulativeSubscription"] = f408_arg1:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "eeGateworm." .. f408_local5 .. ".cumulative" ), function ()
			f408_arg1:updateDataSource()
		end, false )
	end
end )
DataSources.ZMPromoIconList = ListHelper_SetupDataSource( "ZMPromoIconList", function ( f411_arg0 )
	if not IsLive() then
		return {}
	end
	local f411_local0 = {
		{
			"doublexp",
			IsZMDoubleXPWeekend
		},
		{
			"doubleweaponxp",
			IsZMDoubleWeaponXP
		},
		{
			"doublevials",
			IsZMDoubleVialActive
		},
		{
			"firstonefree",
			IsZMFreeGumPerRoundActive
		}
	}
	local f411_local1 = {}
	for f411_local5, f411_local6 in ipairs( f411_local0 ) do
		local f411_local7 = f411_local6[2]
		local f411_local8 = f411_local6[1]
		if f411_local7( f411_arg0 ) then
			table.insert( f411_local1, {
				models = {
					type = f411_local8
				}
			} )
		end
	end
	return f411_local1
end, nil, nil, function ( f412_arg0, f412_arg1, f412_arg2 )
	if not f412_arg1.lobbyNavModel then
		f412_arg1.lobbyNavModel = f412_arg1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ()
			if Engine.CurrentSessionMode() == Enum.eModes.MODE_ZOMBIES then
				f412_arg1:updateDataSource()
			end
		end, false )
	end
end )
DataSources.DailyChallengeWidget = {
	getModel = function ( f414_arg0 )
		local f414_local0 = Engine.GetModel( Engine.GetModelForController( f414_arg0 ), "DailyChallengeWidget" )
		if not f414_local0 then
			f414_local0 = Engine.CreateModel( Engine.GetModelForController( f414_arg0 ), "DailyChallengeWidget" )
			local f414_local1 = Engine.CreateModel( f414_local0, "Data" )
			Engine.SetModelValue( Engine.CreateModel( f414_local0, "Update" ), 0 )
			CoD.ChallengesUtility.UpdateDailyChallengeModel( f414_arg0, f414_local1, Enum.eModes.MODE_ZOMBIES )
		end
		return f414_local0
	end
}
DataSources.CPVideoPlayerList = ListHelper_SetupDataSource( "CPVideoPlayerList", function ( f415_arg0 )
	local f415_local0 = {}
	local f415_local1 = function ( f416_arg0, f416_arg1 )
		return CoD.mapsTable[f416_arg0].unique_id < CoD.mapsTable[f416_arg1].unique_id
	end
	
	local f415_local2 = "cp_doa_bo3"
	local f415_local3 = "cp_codfu"
	for f415_local7, f415_local8 in LUI.IterateTableBySortedKeys( CoD.mapsTable, f415_local1, nil ) do
		if f415_local8.session_mode == Enum.eModes.MODE_CAMPAIGN and f415_local8.isSafeHouse == false and f415_local8.dlc_pack ~= -1 and f415_local8.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT and f415_local7 ~= f415_local2 and f415_local7 ~= f415_local3 and (Engine.GetDStat( f415_arg0, "PlayerStatsByMap", f415_local7, "hasBeenCompleted" ) == 1 or false ~= Dvar.allCollectiblesUnlocked:get()) then
			table.insert( f415_local0, {
				models = {
					displayText = Engine.Localize( f415_local8.mapNameCaps ),
					video = f415_local8.introMovie
				},
				properties = {}
			} )
		end
	end
	table.insert( f415_local0, {
		models = {
			displayText = Engine.Localize( "ZMUI_ZOD_CAPS" ),
			video = "zm_zod_load_zodloadingmovie"
		},
		properties = {}
	} )
	return f415_local0
end )
DataSources.CPPublicGameSelectionList = ListHelper_SetupDataSource( "CPPublicGameSelectionList", function ( f417_arg0 )
	local f417_local0 = {}
	table.insert( f417_local0, {
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
	local f417_local1 = Engine.GetSavedMap()
	if f417_local1 and LUI.startswith( f417_local1, "cp_sh" ) then
		f417_local1 = Engine.GetSavedMapQueuedMap()
	end
	if not f417_local1 then
		f417_local1 = "cp_mi_eth_prologue"
		if Engine.IsCampaignModeZombies() then
			f417_local1 = "cp_mi_sing_sgen_nightmares"
		end
	end
	local f417_local2 = CoD.mapsTable[f417_local1]
	if f417_local2.rootMapName and f417_local2.rootMapName ~= f417_local1 then
		f417_local1 = f417_local2.rootMapName
		f417_local2 = CoD.mapsTable[f417_local1]
	end
	local f417_local3, f417_local4 = GetCollectiblesXOfY( f417_arg0, f417_local1 )
	local f417_local5, f417_local6 = GetAccoladesXOfY( f417_arg0, f417_local1 )
	local f417_local7 = 0
	local f417_local8 = CoD.DIFFICULTY_ICON[0]
	local f417_local9 = CoD.DIFFICULTY[0]
	local f417_local10 = Engine.GetDStat( f417_arg0, "PlayerStatsByMap", f417_local1, "hasBeenCompleted" ) == 1
	local f417_local11 = Engine.GetDStat( f417_arg0, "PlayerStatsByMap", f417_local1, "lastCompletedDifficulty" )
	if f417_local10 and f417_local11 >= 0 then
		f417_local7 = 1
		f417_local8 = CoD.DIFFICULTY_ICON[f417_local11]
		f417_local9 = CoD.DIFFICULTY[f417_local11]
	end
	local f417_local12 = Engine.GetPlayerStats( f417_arg0 )
	local f417_local13 = f417_local12.PlayerStatsByMap[f417_local1].highestStats.SCORE:get()
	if f417_local2 then
		table.insert( f417_local0, {
			models = {
				displayText = "MENU_PLAY_CURRENT_MISSION_CAPS",
				Image = f417_local2.previewImage,
				mapName = f417_local2.mapName,
				mapLocation = f417_local2.mapLocation,
				mapDescription = f417_local2.mapDescription,
				bestTime = 0,
				bestScore = f417_local13,
				action = CPSelectPublicGame,
				param = "currMission",
				mapInfoVis = 1,
				infoText = "",
				playerCountText = "MENU_X_PLAYERS_PLAYING",
				collectiblesFound = f417_local3,
				collectiblesTotal = f417_local4,
				accoladesTotal = f417_local6,
				accoladesFound = f417_local5,
				playersPlaying = 0,
				type = "currentMission",
				completedDifficultyAlpha = f417_local7,
				completedDifficulty = f417_local8,
				completedDifficultyText = f417_local9
			}
		} )
	end
	table.insert( f417_local0, {
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
	return f417_local0
end )
DataSources.CampaignSettings = {
	getModel = function ( f418_arg0 )
		local f418_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
		local f418_local1 = 1
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and f418_arg0 == Engine.GetPrimaryController() then
			f418_local1 = Engine.GetProfileVarInt( f418_arg0, "g_gameskill" )
		else
			local f418_local2 = Engine.GetModel( Engine.GetModelForController( f418_arg0 ), "serverDifficulty" )
			f418_local1 = f418_local2 and Engine.GetModelValue( f418_local2 )
		end
		if f418_local1 == nil then
			f418_local1 = 1
		end
		Engine.SetModelValue( Engine.CreateModel( f418_local0, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[f418_local1] ) )
		Engine.SetModelValue( Engine.CreateModel( f418_local0, "difficultyIcon" ), CoD.DIFFICULTY_ICON[f418_local1] )
		if Engine.GetModelValue( Engine.CreateModel( f418_local0, "selectedMap" ) ) == nil then
			Engine.SetModelValue( Engine.CreateModel( f418_local0, "selectedMap" ), "cp_mi_eth_prologue" )
		end
		return f418_local0
	end
}
DataSources.ZMSettings = {
	getModel = function ( f419_arg0 )
		return Engine.CreateModel( Engine.GetGlobalModel(), "ZMSettings" )
	end
}
DataSources.CampaignMissionList = {
	prepare = function ( f420_arg0, f420_arg1, f420_arg2 )
		f420_arg1.missionList = {}
		local f420_local0 = Engine.TableLookup( f420_arg0, CoD.protoMapsTable, 0, "mapCount", 1 )
		local f420_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "MissionLevels" )
		for f420_local2 = 1, f420_local0, 1 do
			local f420_local5 = f420_local2 - 1 .. ""
			local f420_local6 = Engine.TableLookup( f420_arg0, CoD.protoMapsTable, 3, f420_local5, 0 )
			local f420_local7 = Engine.TableLookup( f420_arg0, CoD.protoMapsTable, 3, f420_local5, 1 )
			local f420_local8 = Engine.TableLookup( f420_arg0, CoD.protoMapsTable, 3, f420_local5, 2 )
			local f420_local9 = Engine.TableLookup( f420_arg0, CoD.protoMapsTable, 3, f420_local5, 4 )
			local f420_local10 = Engine.CreateModel( f420_local1, f420_local5 )
			Engine.SetModelValue( Engine.CreateModel( f420_local10, "devName" ), f420_local6 .. "" )
			Engine.SetModelValue( Engine.CreateModel( f420_local10, "locName" ), f420_local7 .. "" )
			Engine.SetModelValue( Engine.CreateModel( f420_local10, "imagename" ), f420_local8 .. "" )
			Engine.SetModelValue( Engine.CreateModel( f420_local10, "desc" ), f420_local9 .. "" )
			table.insert( f420_arg1.missionList, f420_local10 )
		end
	end,
	getCount = function ( f421_arg0 )
		return #f421_arg0.missionList
	end,
	getItem = function ( f422_arg0, f422_arg1, f422_arg2 )
		return f422_arg1.missionList[f422_arg2]
	end
}
DataSources.LobbyServer = {
	prepare = function ( f423_arg0, f423_arg1, f423_arg2 )
		f423_arg1.numElementsInList = f423_arg1.vCount
		f423_arg1.controller = f423_arg0
		f423_arg1.serverBrowserRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser" )
		local f423_local0 = Engine.GetModel( f423_arg1.serverBrowserRootModel, "serverListCount" )
		if f423_local0 then
			f423_arg1.serverCount = Engine.GetModelValue( f423_local0 )
		else
			f423_arg1.serverCount = 0
		end
		f423_arg1.servers = {}
		local f423_local1 = Engine.CreateModel( f423_arg1.serverBrowserRootModel, "servers" )
		for f423_local2 = 1, f423_arg1.numElementsInList, 1 do
			f423_arg1.servers[f423_local2] = {}
			f423_arg1.servers[f423_local2].root = Engine.CreateModel( f423_local1, "server_" .. f423_local2 )
			f423_arg1.servers[f423_local2].model = Engine.CreateModel( f423_arg1.servers[f423_local2].root, "model" )
		end
		f423_arg1.updateModels = function ( f424_arg0, f424_arg1, f424_arg2 )
			local f424_local0 = Engine.SteamServerBrowser_GetServerInfo( f424_arg2 )
			if f424_local0 then
				local f424_local1 = function ( f425_arg0, f425_arg1, f425_arg2 )
					local f425_local0 = Engine.CreateModel( f425_arg0, f425_arg1 )
					if f425_local0 then
						Engine.SetModelValue( f425_local0, f425_arg2 )
					end
				end
				
				local f424_local2 = f424_arg1.servers[f424_arg2 % f424_arg1.numElementsInList + 1].model
				f424_local1( f424_local2, "serverIndex", f424_local0.serverIndex )
				f424_local1( f424_local2, "connectAddr", f424_local0.connectAddr )
				f424_local1( f424_local2, "ping", f424_local0.ping )
				f424_local1( f424_local2, "modName", f424_local0.modName )
				f424_local1( f424_local2, "mapName", f424_local0.map )
				f424_local1( f424_local2, "desc", f424_local0.desc )
				f424_local1( f424_local2, "clientCount", f424_local0.playerCount )
				f424_local1( f424_local2, "maxClients", f424_local0.maxPlayers )
				f424_local1( f424_local2, "passwordProtected", f424_local0.password )
				f424_local1( f424_local2, "secure", f424_local0.secure )
				f424_local1( f424_local2, "name", f424_local0.name )
				f424_local1( f424_local2, "gameType", f424_local0.gametype )
				f424_local1( f424_local2, "dedicated", f424_local0.dedicated )
				f424_local1( f424_local2, "ranked", f424_local0.ranked )
				f424_local1( f424_local2, "hardcore", f424_local0.hardcore )
				return f424_local2
			else
				return nil
			end
		end
		
		if f423_arg1.serverListUpdateSubscription then
			f423_arg1:removeSubscription( f423_arg1.serverListUpdateSubscription )
		end
		f423_arg1.serverListUpdateSubscription = f423_arg1:subscribeToModel( Engine.CreateModel( f423_arg1.serverBrowserRootModel, "serverListCount" ), function ( model )
			f423_arg1:updateDataSource( false, false )
		end, false )
		if f423_arg1.serverListSortTypeSubscription then
			f423_arg1:removeSubscription( f423_arg1.serverListSortTypeSubscription )
		end
		f423_arg1.serverListSortTypeSubscription = f423_arg1:subscribeToModel( Engine.CreateModel( f423_arg1.serverBrowserRootModel, "serverListSortType" ), function ( model )
			f423_arg1:updateDataSource( false, false )
		end, false )
	end,
	getCount = function ( f428_arg0 )
		return f428_arg0.serverCount
	end,
	getItem = function ( f429_arg0, f429_arg1, f429_arg2 )
		return f429_arg1.updateModels( f429_arg0, f429_arg1, f429_arg2 - 1 )
	end,
	cleanup = function ( f430_arg0 )
		if f430_arg0.serverBrowserRootModel then
			Engine.UnsubscribeAndFreeModel( f430_arg0.serverBrowserRootModel )
			f430_arg0.serverBrowserRootModel = nil
		end
	end
}
DataSources.LocalServer = {
	prepare = function ( f431_arg0, f431_arg1, f431_arg2 )
		f431_arg1.baseModel = Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" )
		f431_arg1.countModel = Engine.GetModel( f431_arg1.baseModel, "count" )
		if f431_arg1.countSubscription then
			f431_arg1:removeSubscription( f431_arg1.countSubscription )
		end
		f431_arg1.countSubscription = f431_arg1:subscribeToModel( f431_arg1.countModel, function ()
			RefreshListFindSelectedXuid( f431_arg0, f431_arg1 )
		end, false )
	end,
	getCount = function ( f433_arg0 )
		return Engine.GetModelValue( f433_arg0.countModel )
	end,
	getItem = function ( f434_arg0, f434_arg1, f434_arg2 )
		return Engine.GetModel( f434_arg1.baseModel, "server" .. f434_arg2 - 1 )
	end
}
DataSources.LocalServerPlayer = {
	prepare = function ( f435_arg0, f435_arg1, f435_arg2 )
		f435_arg1.playerList = {}
		local f435_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" )
		f435_arg1.selectedServerModel = Engine.CreateModel( f435_local0, "selectedServer" )
		local f435_local1 = Engine.GetModelValue( f435_arg1.selectedServerModel )
		if f435_local1 ~= nil then
			f435_arg1.playerList = Engine.LobbyServerListGetClientList( f435_local1 )
			if f435_arg1.playerList ~= nil then
				for f435_local5, f435_local6 in pairs( f435_arg1.playerList ) do
					local f435_local7 = Engine.CreateModel( f435_local0, "playerModel_" .. f435_local5 )
					f435_arg1.playerList[f435_local5].model = f435_local7
					Engine.SetModelValue( Engine.CreateModel( f435_local7, "xuid" ), f435_local6.xuid )
					Engine.SetModelValue( Engine.CreateModel( f435_local7, "gamertag" ), f435_local6.gamertag )
					Engine.SetModelValue( Engine.CreateModel( f435_local7, "isLeader" ), f435_local6.isLeader )
				end
			else
				f435_arg1.playerList = {}
			end
		end
	end,
	getCustomPropertiesForItem = function ( f436_arg0, f436_arg1 )
		return f436_arg0.playerList[f436_arg1]
	end,
	getCount = function ( f437_arg0 )
		return #f437_arg0.playerList
	end,
	getItem = function ( f438_arg0, f438_arg1, f438_arg2 )
		return f438_arg1.playerList[f438_arg2].model
	end
}
DataSources.XPProgressionBar = {
	getModel = function ( f439_arg0 )
		if not f439_arg0 then
			f439_arg0 = Engine.GetPrimaryController()
		end
		local f439_local0 = {
			currentStats = CoD.GetPlayerStats( f439_arg0 ),
			currPrestige = f439_local0.currentStats.PlayerStatsList.PLEVEL.StatValue:get()
		}
		if IsInParagonCapableGameMode() and f439_local0.currPrestige == Engine.GetPrestigeCap() then
			f439_local0.currentRank = f439_local0.currentStats.PlayerStatsList.PARAGON_RANK.StatValue:get()
			f439_local0.displayLevelForCurrRank = Engine.TableLookup( f439_arg0, CoD.paragonRankTable, CoD.XPBar.RankIdCol, f439_local0.currentRank, CoD.XPBar.RankDisplayLevelCol )
			f439_local0.currRankIconMaterialName = Engine.TableLookup( f439_arg0, CoD.rankIconTable, CoD.XPBar.RankIdCol, 0, f439_local0.currPrestige + 1 )
			f439_local0.nextRank = f439_local0.currentRank + 1
			f439_local0.displayLevelForNextRank = tonumber( f439_local0.displayLevelForCurrRank ) + 1
			f439_local0.nextRankIconMaterialName = Engine.TableLookup( f439_arg0, CoD.rankIconTable, CoD.XPBar.RankIdCol, 0, f439_local0.currPrestige + 1 )
			f439_local0.paragonIconId = f439_local0.currentStats.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
			if f439_local0.paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
				f439_local0.currRankIconMaterialName = Engine.GetParagonIconById( f439_local0.paragonIconId )
				f439_local0.nextRankIconMaterialName = f439_local0.currRankIconMaterialName
			end
			f439_local0.currRankXP = f439_local0.currentStats.PlayerStatsList.PARAGON_RANKXP.StatValue:get()
			f439_local0.minXPForCurrRank = tonumber( Engine.TableLookup( f439_arg0, CoD.paragonRankTable, CoD.XPBar.RankIdCol, f439_local0.currentRank, CoD.XPBar.RankTableColMinXP ) )
			f439_local0.maxXPForCurrRank = tonumber( Engine.TableLookup( f439_arg0, CoD.paragonRankTable, CoD.XPBar.RankIdCol, f439_local0.currentRank, CoD.XPBar.RankTableColMaxXP ) )
		else
			f439_local0.currentRank = f439_local0.currentStats.PlayerStatsList.RANK.StatValue:get()
			f439_local0.displayLevelForCurrRank = Engine.TableLookup( f439_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f439_local0.currentRank, CoD.XPBar.RankDisplayLevelCol )
			f439_local0.currRankIconMaterialName = Engine.TableLookup( f439_arg0, CoD.rankIconTable, CoD.XPBar.RankIdCol, f439_local0.currentRank, f439_local0.currPrestige + 1 )
			f439_local0.nextRank = f439_local0.currentRank + 1
			f439_local0.displayLevelForNextRank = tonumber( f439_local0.displayLevelForCurrRank ) + 1
			f439_local0.nextRankIconMaterialName = Engine.TableLookup( f439_arg0, CoD.rankIconTable, CoD.XPBar.RankIdCol, f439_local0.nextRank, f439_local0.currPrestige + 1 )
			f439_local0.currRankXP = f439_local0.currentStats.PlayerStatsList.RANKXP.StatValue:get()
			f439_local0.minXPForCurrRank = tonumber( Engine.TableLookup( f439_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f439_local0.currentRank, CoD.XPBar.RankTableColMinXP ) )
			f439_local0.maxXPForCurrRank = tonumber( Engine.TableLookup( f439_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f439_local0.currentRank, CoD.XPBar.RankTableColMaxXP ) )
		end
		f439_local0.prestigeNext = CoD.PrestigeNext( f439_arg0 )
		f439_local0.xpToNextRank = f439_local0.maxXPForCurrRank - f439_local0.currRankXP
		f439_local0.relativeRankXP = f439_local0.currRankXP - f439_local0.minXPForCurrRank
		f439_local0.progressPct = f439_local0.relativeRankXP / (f439_local0.maxXPForCurrRank - f439_local0.minXPForCurrRank)
		local f439_local1 = Engine.CreateModel( Engine.GetModelForController( f439_arg0 ), "XPProgressionBar" )
		Engine.SetModelValue( Engine.CreateModel( f439_local1, "currentRank" ), f439_local0.displayLevelForCurrRank )
		Engine.SetModelValue( Engine.CreateModel( f439_local1, "currentRankIcon" ), f439_local0.currRankIconMaterialName )
		Engine.SetModelValue( Engine.CreateModel( f439_local1, "nextRank" ), f439_local0.displayLevelForNextRank )
		Engine.SetModelValue( Engine.CreateModel( f439_local1, "nextRankIcon" ), f439_local0.nextRankIconMaterialName )
		Engine.SetModelValue( Engine.CreateModel( f439_local1, "currentXP" ), f439_local0.currRankXP )
		Engine.SetModelValue( Engine.CreateModel( f439_local1, "xpToNextRank" ), f439_local0.xpToNextRank )
		Engine.SetModelValue( Engine.CreateModel( f439_local1, "progress" ), f439_local0.progressPct )
		return f439_local1
	end
}
DataSources.CryptoKeyProgress = {
	getModel = function ( f440_arg0 )
		local f440_local0 = Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f440_arg0 ) or -1
		local f440_local1 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f440_arg0 )
		local f440_local2 = Engine.GetModelForController( f440_arg0 )
		local f440_local3 = Engine.GetModel( f440_local2, "CryptoKeyProgress" )
		if not f440_local3 then
			f440_local3 = Engine.CreateModel( f440_local2, "CryptoKeyProgress" )
			Engine.SetModelValue( Engine.CreateModel( f440_local3, "challengeCryptoKeys" ), 0 )
		end
		if CoD.perController[f440_arg0].keysToNotShowYet then
			f440_local0 = f440_local0 - CoD.perController[f440_arg0].keysToNotShowYet
		end
		local f440_local4 = -1
		if Engine.IsLootReady( f440_arg0 ) then
			f440_local4 = CoD.BlackMarketUtility.GetCurrentBundleCount( f440_arg0 )
			if not IsBundleActive( f440_arg0 ) then
				f440_local4 = f440_local4 + CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f440_arg0 ) + CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f440_arg0 ) + CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f440_arg0 ) + CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f440_arg0 )
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "keyCount" ), f440_local0 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "progress" ), f440_local1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "codPoints" ), Engine.IsLootReady( f440_arg0 ) and Engine.GetCoDPoints( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "bundles" ), f440_local4 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "incentiveWeaponBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentIncentiveWeaponBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "incentiveRareBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentIncentiveRareBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "rangeWeaponNoDupesBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "meleeWeaponNoDupesBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "genericRewardBundles" ), -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "sixPackCommonBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "dailyDoubleRareBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "hundredBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "rareBundle10for5s" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "bundleExperimentRareBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "noDupesRareBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "codeBundleRareBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "weapon3XBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "limitedEditionCamoBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "gunMeterProgress" ), CoD.BlackMarketUtility.GetGunMeterProgress( f440_arg0 ) )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "rare20Bundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "rare15Bundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentRare15BundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "outfit3Bundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentOutfit3BundleCount( f440_arg0 ) or -1 )
		Engine.SetModelValue( Engine.CreateModel( f440_local3, "rare20LDBundles" ), Engine.IsLootReady( f440_arg0 ) and CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f440_arg0 ) or -1 )
		return f440_local3
	end
}
DataSources.Rewards = {
	prepare = function ( f441_arg0, f441_arg1, f441_arg2 )
		f441_arg1.rewardsList = {}
		local f441_local0 = Engine.CreateModel( Engine.GetModelForController( f441_arg0 ), "Rewards" )
		local f441_local1 = CoD.GetPlayerStats( f441_arg0 )
		if not f441_local1 then
			return 
		end
		f441_local1 = f441_local1.AfterActionReportStats
		local f441_local2 = -1
		local f441_local3 = Engine.GetSelfGamertag( f441_arg0 )
		for f441_local4 = 0, 3, 1 do
			if f441_local1.playerStats[f441_local4].name:get() == f441_local3 then
				f441_local2 = f441_local4
			end
		end
		if f441_local2 == -1 then
			return 
		end
		local f441_local4 = f441_local1.playerStats[f441_local2].curRank:get()
		local f441_local5 = f441_local1.playerStats[f441_local2].prvRank:get()
		local f441_local6 = {}
		local f441_local7 = 0
		if f441_local5 < f441_local4 then
			f441_local6[f441_local7] = {}
			f441_local6[f441_local7].itemName = "Promotion"
			f441_local6[f441_local7].itemImage = Engine.GetRankIcon( f441_local4 ) .. "_lrg"
			f441_local6[f441_local7].itemDesc = "Congratulations, you have been promoted!"
			f441_local6[f441_local7].itemDesc2 = ""
			f441_local7 = f441_local7 + 1
			f441_local6[f441_local7] = {}
			f441_local6[f441_local7].itemName = "Tech Spec - " .. tostring( f441_local4 - f441_local5 ) .. "X"
			f441_local6[f441_local7].itemImage = "t7_menu_tech_spec_token"
			f441_local6[f441_local7].itemDesc = "Unlock the weapon or gadget of your choice with this Tech spec."
			f441_local6[f441_local7].itemDesc2 = "Promotion award for reaching level " .. tostring( f441_local4 + 1 ) .. "."
			f441_local7 = f441_local7 + 1
			local f441_local8 = Engine.TableFindRows( CoD.statsTable, 10, tostring( f441_local4 + 1 ) )
			if f441_local8 ~= nil then
				local f441_local9 = 6
				local f441_local10 = 3
				local f441_local11 = f441_local8[1]
				local f441_local12 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.statsTable, f441_local11, f441_local10 ) )
				local f441_local13 = Engine.TableLookupGetColumnValueForRow( CoD.statsTable, f441_local11, f441_local9 )
				f441_local6[f441_local7] = {}
				f441_local6[f441_local7].itemName = f441_local12 .. " Blueprint"
				f441_local6[f441_local7].itemImage = f441_local13 .. "_big"
				f441_local6[f441_local7].itemDesc = "This weapon is now available for unlock the Armory."
				f441_local6[f441_local7].itemDesc2 = "Promotion award for reaching level " .. tostring( f441_local4 ) .. "."
				f441_local7 = f441_local7 + 1
			end
		end
		if f441_local1.matchWon:get() ~= 0 then
			f441_local6[f441_local7] = {}
			f441_local6[f441_local7].itemName = "Mod Spec"
			f441_local6[f441_local7].itemImage = "t7_menu_mod_spec_token"
			f441_local6[f441_local7].itemDesc = "Upgrade a weapon or gadget of your choice with this Mod Spec."
			f441_local6[f441_local7].itemDesc2 = "Awarded for completing your Mission."
			f441_local7 = f441_local7 + 1
			Engine.SetModelValue( Engine.CreateModel( f441_local0, "matchResult" ), Engine.Localize( "MENU_MISSION_SUCCESS_CAPS" ) )
		else
			Engine.SetModelValue( Engine.CreateModel( f441_local0, "matchResult" ), Engine.Localize( "MENU_MISSION_FAILED" ) )
		end
		local f441_local14 = #f441_local6
		for f441_local8 = 0, #f441_local6, 1 do
			local f441_local12 = f441_local6[f441_local8]
			if f441_local12 ~= nil then
				local f441_local13 = f441_local12.itemName .. ""
				local f441_local15 = f441_local12.itemImage .. ""
				local f441_local16 = f441_local12.itemDesc .. ""
				local f441_local17 = f441_local12.itemDesc2 .. ""
				local f441_local18 = Engine.CreateModel( f441_local0, f441_local8 )
				Engine.SetModelValue( Engine.CreateModel( f441_local18, "rewardName" ), f441_local13 )
				Engine.SetModelValue( Engine.CreateModel( f441_local18, "rewardImage" ), f441_local15 )
				Engine.SetModelValue( Engine.CreateModel( f441_local18, "rewardDesc1" ), f441_local16 )
				Engine.SetModelValue( Engine.CreateModel( f441_local18, "rewardDesc2" ), f441_local17 )
				table.insert( f441_arg1.rewardsList, f441_local18 )
			end
		end
	end,
	getCount = function ( f442_arg0 )
		return #f442_arg0.rewardsList
	end,
	getItem = function ( f443_arg0, f443_arg1, f443_arg2 )
		return f443_arg1.rewardsList[f443_arg2]
	end
}
DataSources.AARStats = {
	prepare = function ( f444_arg0, f444_arg1, f444_arg2 )
		f444_arg1.AARStatsList = {}
		local f444_local0 = Engine.CreateModel( Engine.GetModelForController( f444_arg0 ), "AARStats" )
		local f444_local1 = CoD.GetPlayerStats( f444_arg0 )
		f444_local1 = f444_local1.AfterActionReportStats
		local f444_local2 = {}
		for f444_local3 = 0, Dvar.com_maxclients:get() - 1, 1 do
			if f444_local1.playerStats[f444_local3].isActive:get() == 1 then
				f444_local2[f444_local3] = {}
				f444_local2[f444_local3].name = f444_local1.playerStats[f444_local3].name:get()
				f444_local2[f444_local3].rank = f444_local1.playerStats[f444_local3].curRank:get() + 1
				f444_local2[f444_local3].rankIcon = Engine.GetRankIcon( f444_local1.playerStats[f444_local3].curRank:get() )
				f444_local2[f444_local3].kills = f444_local1.playerStats[f444_local3].kills:get()
				f444_local2[f444_local3].assists = f444_local1.playerStats[f444_local3].assists:get()
				f444_local2[f444_local3].medalName1 = ""
				f444_local2[f444_local3].medalImage1 = ""
				f444_local2[f444_local3].medalName2 = ""
				f444_local2[f444_local3].medalImage2 = ""
				f444_local2[f444_local3].medalName3 = ""
				f444_local2[f444_local3].medalImage3 = ""
				if f444_local1.playerStats[f444_local3].medals[0]:get() == f444_local3 then
					f444_local2[f444_local3].medalName1 = "Kill Master"
					f444_local2[f444_local3].medalImage1 = "hud_medals_default"
				end
				if f444_local1.playerStats[f444_local3].medals[1]:get() == f444_local3 then
					f444_local2[f444_local3].medalName2 = "Assist Master"
					f444_local2[f444_local3].medalImage2 = "hud_medals_revenge"
				end
				if f444_local1.playerStats[f444_local3].medals[2]:get() == f444_local3 then
					f444_local2[f444_local3].medalName3 = "Revive Master"
					f444_local2[f444_local3].medalImage3 = "hud_medals_afterlife"
				end
			end
		end
		for f444_local6, f444_local7 in pairs( f444_local2 ) do
			local f444_local8 = f444_local7.name .. ""
			local f444_local9 = f444_local7.rank .. ""
			local f444_local10 = f444_local7.rankIcon .. ""
			local f444_local11 = f444_local7.kills .. ""
			local f444_local12 = f444_local7.assists .. ""
			local f444_local13 = f444_local7.medalName1 .. ""
			local f444_local14 = f444_local7.medalImage1 .. ""
			local f444_local15 = f444_local7.medalName2 .. ""
			local f444_local16 = f444_local7.medalImage2 .. ""
			local f444_local17 = f444_local7.medalName3 .. ""
			local f444_local18 = f444_local7.medalImage3 .. ""
			local f444_local19 = Engine.CreateModel( f444_local0, f444_local6 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "playerName" ), f444_local8 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "playerRank" ), f444_local9 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "playerRankIcon" ), f444_local10 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "playerKills" ), f444_local11 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "playerAssists" ), f444_local12 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "medalName1" ), f444_local13 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "medalImage1" ), f444_local14 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "medalName2" ), f444_local15 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "medalImage2" ), f444_local16 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "medalName3" ), f444_local17 )
			Engine.SetModelValue( Engine.CreateModel( f444_local19, "medalImage3" ), f444_local18 )
			table.insert( f444_arg1.AARStatsList, f444_local19 )
		end
	end,
	getCount = function ( f445_arg0 )
		return #f445_arg0.AARStatsList
	end,
	getItem = function ( f446_arg0, f446_arg1, f446_arg2 )
		return f446_arg1.AARStatsList[f446_arg2]
	end
}
DataSources.AARMedalsList = {
	prepare = function ( f447_arg0, f447_arg1, f447_arg2 )
		local f447_local0 = Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, Engine.GetCurrentGameType() .. " XP" )
		local f447_local1 = Engine.GetRecentMedals( f447_arg0, f447_local0 )
		f447_arg1.count = 0
		if f447_local1 and #f447_local1 > 0 then
			local f447_local2 = Engine.CreateModel( Engine.GetModelForController( f447_arg0 ), "aarMedalsList" )
			table.sort( f447_local1, CoD.AARUtility.SortMedals )
			for f447_local8, f447_local9 in ipairs( f447_local1 ) do
				local f447_local10 = Engine.CreateModel( f447_local2, f447_local8 .. "" )
				local f447_local11 = f447_local9.value
				local f447_local12 = f447_local9.row
				local f447_local7 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f447_local12, f447_local0 ) )
				Engine.SetModelValue( Engine.CreateModel( f447_local10, "medalIndex" ), f447_local12 )
				Engine.SetModelValue( Engine.CreateModel( f447_local10, "medalTimesObtained" ), f447_local11 )
				local f447_local6 = 1
				local f447_local13 = Engine.GetModel( Engine.GetModelForController( f447_arg0 ), "aarStats.xpScale" )
				if f447_local13 then
					f447_local6 = Engine.GetModelValue( f447_local13 )
				end
				f447_local7 = f447_local7 * f447_local6
				if f447_local11 > 1 then
					Engine.SetModelValue( Engine.CreateModel( f447_local10, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f447_local7 * tonumber( f447_local11 ) ) )
				else
					Engine.SetModelValue( Engine.CreateModel( f447_local10, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f447_local7 ) )
				end
			end
			if f447_local1 and #f447_local1 > 0 then
				f447_arg1.count = #f447_local1
			end
		end
	end,
	getCount = function ( f448_arg0 )
		return f448_arg0.count
	end,
	getItem = function ( f449_arg0, f449_arg1, f449_arg2 )
		return Engine.GetModel( Engine.GetModelForController( f449_arg0 ), "aarMedalsList" .. "." .. f449_arg2 )
	end
}
DataSources.CombatRecordDeadliestCybercore = {
	getModel = function ( f450_arg0 )
		local f450_local0 = Engine.CreateModel( Engine.GetModelForController( f450_arg0 ), "CombatRecordDeadliestCybercore" )
		local f450_local1 = CoD.GetCombatRecordStats( f450_arg0 )
		local f450_local2 = 0
		local f450_local3 = 0
		local f450_local4 = 0
		local f450_local5 = 0
		local f450_local6 = Engine.Localize( "MENU_NONE" )
		for f450_local7 = 0, 255, 1 do
			if Engine.GetItemAllocationCost( f450_local7, CoD.GetCombatRecordMode() ) >= 0 then
				local f450_local10 = Engine.GetLoadoutSlotForItem( f450_local7, CoD.GetCombatRecordMode() )
				if f450_local10 == "cybercom_ability1" or f450_local10 == "cybercom_ability2" or f450_local10 == "cybercom_ability3" then
					local f450_local11 = CoD.GetCombatRecordStatForPath( f450_local1, "ItemStats." .. f450_local7 .. ".stats.kills" )
					local f450_local12 = CoD.GetCombatRecordStatForPath( f450_local1, "ItemStats." .. f450_local7 .. ".stats.assists" )
					local f450_local13 = f450_local11
					if f450_local11 < f450_local12 then
						f450_local13 = f450_local12
					end
					if f450_local2 < f450_local13 then
						f450_local2 = f450_local13
						f450_local3 = f450_local11
						f450_local4 = f450_local12
						f450_local5 = f450_local7
						f450_local6 = Engine.GetItemName( f450_local7, CoD.GetCombatRecordMode() )
					end
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f450_local0, "itemIndex" ), f450_local5 )
		Engine.SetModelValue( Engine.CreateModel( f450_local0, "itemName" ), f450_local6 )
		if f450_local4 <= f450_local3 then
			Engine.SetModelValue( Engine.CreateModel( f450_local0, "numKills" ), f450_local3 )
		else
			Engine.SetModelValue( Engine.CreateModel( f450_local0, "numKills" ), f450_local4 )
		end
		return f450_local0
	end
}
DataSources.CombatRecordBestScoreMap = {
	getModel = function ( f451_arg0 )
		local f451_local0 = Engine.CreateModel( Engine.GetModelForController( f451_arg0 ), "CombatRecordBestScoreMap" )
		local f451_local1 = CoD.GetCombatRecordStats( f451_arg0 )
		local f451_local2 = 0
		local f451_local3 = ""
		for f451_local8, f451_local9 in pairs( CoD.mapsTable ) do
			local f451_local10 = f451_local9.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if f451_local8 == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
				f451_local9.isSubLevel = false
			end
			if f451_local9.session_mode == Enum.eModes.MODE_CAMPAIGN and f451_local10 and f451_local9.dlc_pack ~= -1 and f451_local9.isSubLevel == false then
				local f451_local7 = f451_local1.PlayerStatsByMap[f451_local8].highestStats.SCORE:get()
				if f451_local2 < f451_local7 then
					f451_local2 = f451_local7
					f451_local3 = f451_local8
				end
			end
		end
		if f451_local2 == 0 then
			f451_local2 = "--"
			f451_local3 = Engine.Localize( "MENU_NONE" )
		end
		Engine.SetModelValue( Engine.CreateModel( f451_local0, "highestScore" ), tostring( f451_local2 ) )
		Engine.SetModelValue( Engine.CreateModel( f451_local0, "mapName" ), f451_local3 )
		return f451_local0
	end
}
DataSources.CombatRecordDeadliestEquipment = {
	getModel = function ( f452_arg0 )
		local f452_local0 = Engine.CreateModel( Engine.GetModelForController( f452_arg0 ), "CombatRecordDeadliestEquipment" )
		local f452_local1 = CoD.GetCombatRecordStats( f452_arg0 )
		local f452_local2 = 0
		local f452_local3 = 0
		local f452_local4 = Engine.Localize( "MENU_NONE" )
		for f452_local5 = 0, 255, 1 do
			if Engine.GetItemAllocationCost( f452_local5, CoD.GetCombatRecordMode() ) >= 0 then
				local f452_local8 = nil
				local f452_local9 = Engine.GetLoadoutSlotForItem( f452_local5, CoD.GetCombatRecordMode() )
				if f452_local9 == "primarygadget" then
					f452_local8 = CoD.GetCombatRecordStatForPath( f452_local1, "ItemStats." .. f452_local5 .. ".stats.kills" )
				elseif f452_local9 == "secondarygadget" then
					f452_local8 = CoD.GetCombatRecordStatForPath( f452_local1, "ItemStats." .. f452_local5 .. ".stats.combatRecordStat" )
				end
				if f452_local8 and f452_local2 < f452_local8 then
					f452_local2 = f452_local8
					f452_local3 = f452_local5
					f452_local4 = Engine.GetItemName( f452_local5, CoD.GetCombatRecordMode() )
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f452_local0, "itemIndex" ), f452_local3 )
		Engine.SetModelValue( Engine.CreateModel( f452_local0, "numKills" ), f452_local2 )
		Engine.SetModelValue( Engine.CreateModel( f452_local0, "itemName" ), f452_local4 )
		return f452_local0
	end
}
DataSources.CombatRecordDeadliestScorestreak = {
	getModel = function ( f453_arg0 )
		local f453_local0 = Engine.CreateModel( Engine.GetModelForController( f453_arg0 ), "CombatRecordDeadliestScorestreak" )
		local f453_local1 = CoD.GetCombatRecordStats( f453_arg0 )
		local f453_local2 = 0
		local f453_local3 = 0
		local f453_local4 = Engine.Localize( "MENU_NONE" )
		for f453_local5 = 0, 255, 1 do
			if Engine.GetItemAllocationCost( f453_local5, CoD.GetCombatRecordMode() ) >= 0 and Engine.GetItemGroup( f453_local5, CoD.GetCombatRecordMode() ) == "killstreak" then
				local f453_local8 = CoD.GetCombatRecordStatForPath( f453_local1, "ItemStats." .. f453_local5 .. ".stats.kills" )
				if f453_local2 < f453_local8 then
					f453_local2 = f453_local8
					f453_local3 = f453_local5
					f453_local4 = Engine.GetItemName( f453_local5, CoD.GetCombatRecordMode() )
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f453_local0, "itemIndex" ), f453_local3 )
		Engine.SetModelValue( Engine.CreateModel( f453_local0, "numKills" ), f453_local2 )
		Engine.SetModelValue( Engine.CreateModel( f453_local0, "itemName" ), f453_local4 )
		return f453_local0
	end
}
DataSources.CombatRecordDeadliestWeapon = {
	getModel = function ( f454_arg0 )
		local f454_local0 = Engine.CreateModel( Engine.GetModelForController( f454_arg0 ), "CombatRecordDeadliestWeapon" )
		local f454_local1 = CoD.GetCombatRecordStats( f454_arg0 )
		local f454_local2 = 0
		local f454_local3 = 0
		local f454_local4 = Engine.Localize( "MENU_NONE" )
		for f454_local5 = 0, 255, 1 do
			local f454_local8 = Engine.GetItemAllocationCost( f454_local5, CoD.GetCombatRecordMode() )
			if f454_local8 < -1 or f454_local8 >= 0 then
				local f454_local9 = Engine.GetLoadoutSlotForItem( f454_local5, CoD.GetCombatRecordMode() )
				if f454_local9 == "primary" or f454_local9 == "secondary" then
					local f454_local10 = CoD.GetCombatRecordStatForPath( f454_local1, "ItemStats." .. f454_local5 .. ".stats.kills" )
					if f454_local2 < f454_local10 then
						f454_local2 = f454_local10
						f454_local3 = f454_local5
						f454_local4 = Engine.GetItemName( f454_local5, CoD.GetCombatRecordMode() )
					end
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f454_local0, "itemIndex" ), f454_local3 )
		Engine.SetModelValue( Engine.CreateModel( f454_local0, "numKills" ), f454_local2 )
		Engine.SetModelValue( Engine.CreateModel( f454_local0, "itemName" ), f454_local4 )
		return f454_local0
	end
}
DataSources.CombatRecordMostUsedBubblegumBuff = {
	getModel = function ( f455_arg0 )
		local f455_local0 = Engine.CreateModel( Engine.GetModelForController( f455_arg0 ), "CombatRecordMostUsedBubblegumBuff" )
		local f455_local1 = CoD.GetCombatRecordStats( f455_arg0 )
		local f455_local2 = 0
		local f455_local3 = 0
		local f455_local4 = Engine.Localize( "MENU_NONE" )
		for f455_local5 = 0, 255, 1 do
			if Engine.GetLoadoutSlotForItem( f455_local5, CoD.GetCombatRecordMode() ) == "equippedbubblegumpack" then
				local f455_local8 = CoD.GetCombatRecordStatForPath( f455_local1, "ItemStats." .. f455_local5 .. ".stats.used" )
				if f455_local2 < f455_local8 then
					f455_local2 = f455_local8
					f455_local3 = f455_local5
					f455_local4 = Engine.GetItemName( f455_local5, CoD.GetCombatRecordMode() )
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f455_local0, "itemIndex" ), f455_local3 )
		Engine.SetModelValue( Engine.CreateModel( f455_local0, "itemName" ), f455_local4 )
		Engine.SetModelValue( Engine.CreateModel( f455_local0, "numUsed" ), f455_local2 )
		return f455_local0
	end
}
DataSources.CombatRecordZMHighestRound = {
	getModel = function ( f456_arg0 )
		local f456_local0 = Engine.CreateModel( Engine.GetModelForController( f456_arg0 ), "CombatRecordZMHighestRound" )
		local f456_local1 = CoD.GetCombatRecordStats( f456_arg0 )
		local f456_local2 = 0
		local f456_local3 = Engine.Localize( "MENU_NONE" )
		for f456_local8, f456_local9 in pairs( CoD.mapsTable ) do
			if f456_local9.session_mode == Enum.eModes.MODE_ZOMBIES and f456_local1.PlayerStatsByMap and f456_local1.PlayerStatsByMap[f456_local8] then
				local f456_local7 = f456_local1.PlayerStatsByMap[f456_local8].stats.HIGHEST_ROUND_REACHED.statValue:get()
				if f456_local2 < f456_local7 then
					f456_local2 = f456_local7
					f456_local3 = f456_local8
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f456_local0, "highestRound" ), f456_local2 )
		Engine.SetModelValue( Engine.CreateModel( f456_local0, "mapName" ), f456_local3 )
		return f456_local0
	end
}
DataSources.CombatRecordTotalAccoladesCompleted = {
	getModel = function ( f457_arg0 )
		local f457_local0 = Engine.CreateModel( Engine.GetModelForController( f457_arg0 ), "CombatRecordTotalAccoladesCompleted" )
		local f457_local1 = CoD.GetCombatRecordStats( f457_arg0 )
		local f457_local2 = 0
		for f457_local8, f457_local9 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f458_arg0, f458_arg1 )
			return CoD.mapsTable[f458_arg0].unique_id < CoD.mapsTable[f458_arg1].unique_id
		end, nil ) do
			local f457_local10 = f457_local9.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if f457_local8 == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
				f457_local9.isSubLevel = false
			end
			if f457_local9.session_mode == Enum.eModes.MODE_CAMPAIGN and f457_local10 and f457_local9.dlc_pack ~= -1 and f457_local9.isSubLevel == false then
				local f457_local6, f457_local7 = GetAccoladesXOfY( f457_arg0, f457_local8, true )
				f457_local2 = f457_local2 + f457_local6
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f457_local0, "accoladesCompleted" ), f457_local2 )
		return f457_local0
	end
}
DataSources.CombatRecordTotalCollectiblesFound = {
	getModel = function ( f459_arg0 )
		local f459_local0 = Engine.CreateModel( Engine.GetModelForController( f459_arg0 ), "CombatRecordTotalCollectiblesFound" )
		local f459_local1 = CoD.GetCombatRecordStats( f459_arg0 )
		local f459_local2 = 0
		for f459_local8, f459_local9 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f460_arg0, f460_arg1 )
			return CoD.mapsTable[f460_arg0].unique_id < CoD.mapsTable[f460_arg1].unique_id
		end, nil ) do
			local f459_local10 = f459_local9.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if f459_local8 == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
				f459_local9.isSubLevel = false
			end
			if f459_local9.session_mode == Enum.eModes.MODE_CAMPAIGN and f459_local10 and f459_local9.dlc_pack ~= -1 and f459_local9.isSubLevel == false then
				local f459_local6, f459_local7 = GetCollectiblesXOfY( f459_arg0, f459_local8, true )
				f459_local2 = f459_local2 + f459_local6
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f459_local0, "collectiblesFound" ), f459_local2 )
		return f459_local0
	end
}
DataSources.CombatRecordCollectiblesList = {
	prepare = function ( f461_arg0, f461_arg1, f461_arg2 )
		f461_arg1.items = {}
		local f461_local0 = 0
		local f461_local1 = 0
		local f461_local2 = Engine.CreateModel( Engine.GetModelForController( f461_arg0 ), "CombatRecordCollectiblesList" )
		f461_arg1.rootModel = f461_local2
		for f461_local10, f461_local11 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f462_arg0, f462_arg1 )
			return CoD.mapsTable[f462_arg0].unique_id < CoD.mapsTable[f462_arg1].unique_id
		end, nil ) do
			local f461_local12 = f461_local11.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if f461_local10 == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
				f461_local11.isSubLevel = false
			end
			if f461_local11.session_mode == Enum.eModes.MODE_CAMPAIGN and f461_local12 and f461_local11.dlc_pack ~= -1 and f461_local11.isSubLevel == false then
				f461_local0 = f461_local0 + 1
				local f461_local6, f461_local7 = GetCollectiblesXOfY( f461_arg0, f461_local10, true )
				local f461_local8 = Engine.CreateModel( f461_local2, f461_local0 )
				local f461_local9 = CoD.GetCombatRecordStats( f461_arg0 )
				if f461_local9.PlayerStatsByMap[f461_local10].hasBeenCompleted:get() == 1 or f461_local6 > 0 then
					f461_local1 = f461_local1 + f461_local6
					Engine.SetModelValue( Engine.CreateModel( f461_local8, "name" ), f461_local11.mapName )
					Engine.SetModelValue( Engine.CreateModel( f461_local8, "stat" ), Engine.Localize( "MENU_LISTBOX_POS", f461_local6, f461_local7 ) )
					Engine.SetModelValue( Engine.CreateModel( f461_local8, "id" ), f461_local10 )
				else
					Engine.SetModelValue( Engine.CreateModel( f461_local8, "name" ), f461_local11.mapName )
					Engine.SetModelValue( Engine.CreateModel( f461_local8, "stat" ), "--" )
				end
				table.insert( f461_arg1.items, f461_local8 )
			end
		end
	end,
	getCount = function ( f463_arg0 )
		return #f463_arg0.items
	end,
	getItem = function ( f464_arg0, f464_arg1, f464_arg2 )
		return f464_arg1.items[f464_arg2]
	end,
	cleanup = function ( f465_arg0 )
		if f465_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f465_arg0.rootModel )
			f465_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordEquipmentList = {
	prepare = function ( f466_arg0, f466_arg1, f466_arg2 )
		f466_arg1.items = {}
		local f466_local0 = Engine.CreateModel( Engine.GetModelForController( f466_arg0 ), "CombatRecordEquipmentList" )
		f466_arg1.rootModel = f466_local0
		local f466_local1 = CoD.GetCombatRecordStats( f466_arg0 )
		local f466_local2 = CoD.GetCombatRecordComparisonStats( f466_arg0 )
		for f466_local3 = 0, 255, 1 do
			if Engine.GetItemAllocationCost( f466_local3, CoD.GetCombatRecordMode() ) >= 0 then
				local f466_local6 = Engine.GetLoadoutSlotForItem( f466_local3, CoD.GetCombatRecordMode() )
				if f466_local6 == "primarygadget" or f466_local6 == "secondarygadget" then
					local f466_local7 = Engine.CreateModel( f466_local0, f466_local3 )
					local f466_local8 = Engine.GetItemName( f466_local3, CoD.GetCombatRecordMode() )
					Engine.SetModelValue( Engine.CreateModel( f466_local7, "name" ), f466_local8 )
					local f466_local9, f466_local10, f466_local11, f466_local12 = nil
					if f466_local6 == "primarygadget" then
						f466_local10 = 1
						f466_local11 = "MENU_KILLS_CAPS"
						f466_local12 = "ItemStats." .. f466_local3 .. ".stats.kills"
					else
						f466_local10 = 0
						f466_local11 = f466_local8 .. "_STAT_CAPS"
						f466_local12 = "ItemStats." .. f466_local3 .. ".stats.combatRecordStat"
					end
					f466_local9 = CoD.GetCombatRecordStatForPath( f466_local1, f466_local12 )
					local f466_local13 = 0
					if f466_local2 then
						f466_local13 = CoD.GetCombatRecordStatForPath( f466_local2, f466_local12 )
					end
					Engine.SetModelValue( Engine.CreateModel( f466_local7, "itemIndex" ), f466_local3 )
					Engine.SetModelValue( Engine.CreateModel( f466_local7, "stat" ), f466_local9 )
					Engine.SetModelValue( Engine.CreateModel( f466_local7, "statComparison" ), f466_local13 )
					Engine.SetModelValue( Engine.CreateModel( f466_local7, "lethalAlpha" ), f466_local10 )
					Engine.SetModelValue( Engine.CreateModel( f466_local7, "tacticalAlpha" ), 1 - f466_local10 )
					Engine.SetModelValue( Engine.CreateModel( f466_local7, "statLabel" ), f466_local11 )
					table.insert( f466_arg1.items, f466_local7 )
				end
			end
		end
		table.sort( f466_arg1.items, function ( f467_arg0, f467_arg1 )
			local f467_local0 = Engine.GetModelValue( Engine.GetModel( f467_arg0, "stat" ) )
			local f467_local1 = Engine.GetModelValue( Engine.GetModel( f467_arg1, "stat" ) )
			if f467_local0 == f467_local1 then
				return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f467_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f467_arg1, "name" ) ) )
			else
				return f467_local1 < f467_local0
			end
		end )
	end,
	getCount = function ( f468_arg0 )
		return #f468_arg0.items
	end,
	getItem = function ( f469_arg0, f469_arg1, f469_arg2 )
		return f469_arg1.items[f469_arg2]
	end,
	cleanup = function ( f470_arg0 )
		if f470_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f470_arg0.rootModel )
			f470_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordProfileSnapshot = {
	getModel = function ( f471_arg0 )
		if not CoD.CombatRecordXUID then
			return nil
		else
			local f471_local0 = Engine.CreateModel( Engine.GetModelForController( f471_arg0 ), "CombatRecordProfileSnapshot" )
			local f471_local1, f471_local2, f471_local3 = Engine.GetCombatRecordScreenshotInfo( f471_arg0, CoD.CombatRecordXUID )
			Engine.SetModelValue( Engine.CreateModel( f471_local0, "fileId" ), f471_local1 )
			Engine.SetModelValue( Engine.CreateModel( f471_local0, "fileSize" ), f471_local2 )
			Engine.SetModelValue( Engine.CreateModel( f471_local0, "fileName" ), f471_local3 )
			return f471_local0
		end
	end
}
DataSources.CombatRecordCallingCardShowcase = {
	prepare = function ( f472_arg0, f472_arg1, f472_arg2 )
		f472_arg1.items = {}
		local f472_local0 = Engine.CreateModel( Engine.GetModelForController( f472_arg0 ), "CombatRecordCallingCardShowcase" )
		f472_arg1.rootModel = f472_local0
		for f472_local1 = 0, 2, 1 do
			local f472_local4 = Engine.CreateModel( f472_local0, f472_local1 )
			local f472_local5 = Engine.GetCombatRecordBackgroundId( f472_arg0, CoD.CombatRecordXUID, f472_local1 )
			Engine.SetModelValue( Engine.CreateModel( f472_local4, "backgroundID" ), f472_local5 )
			local f472_local6 = ""
			local f472_local7 = ""
			if f472_local5 > 0 then
				local f472_local8 = Engine.GetChallengeInfoByBackingId( f472_arg0, f472_local5 )
				if f472_local8 and #f472_local8 > 0 then
					f472_local7, f472_local6 = CoD.ChallengesUtility.GetLocalizedNameAndDescriptionForChallengeInfo( f472_local8[1] )
				else
					local f472_local9 = 1
					local f472_local10 = 4
					local f472_local11 = 9
					local f472_local12 = 12
					local f472_local13 = Engine.Localize( Engine.TableLookup( nil, CoD.backgroundsTable, f472_local9, f472_local5, f472_local11 ) )
					f472_local13 = f472_local13:sub( 2, #f472_local13 - 1 )
					if f472_local13 == "arenabest" then
						f472_local7, f472_local6 = CoD.ArenaUtility.GetArenaBestCallingCardNameAndDescForBackgroundId( f472_arg0, f472_local5 )
					elseif f472_local13 == "arenavet" then
						f472_local7, f472_local6 = CoD.ArenaUtility.GetArenaVetCallingCardNameAndDescForBackgroundId( f472_arg0, f472_local5 )
					else
						if f472_local13 == "default" then
							if tonumber( Engine.TableLookup( nil, CoD.backgroundsTable, f472_local9, f472_local5, f472_local12 ) ) == 1 then
								f472_local6 = Engine.Localize( "MENU_UNLOCKED_BY_COMMUNITY_CONTRACT" )
							else
								f472_local6 = Engine.Localize( "MENU_DEFAULT_CALLING_CARD" )
							end
						elseif f472_local13 == "loot" then
							f472_local6 = Engine.Localize( "MENU_LOOT_CALLING_CARD" )
						end
						f472_local7 = Engine.Localize( Engine.TableLookup( nil, CoD.backgroundsTable, f472_local9, f472_local5, f472_local10 ) )
					end
				end
			elseif not CoD.CombatRecordOtherPlayerStats then
				f472_local6 = Engine.Localize( "MENU_SELECT_CALLING_CARD" )
			end
			Engine.SetModelValue( Engine.CreateModel( f472_local4, "description" ), f472_local6 )
			Engine.SetModelValue( Engine.CreateModel( f472_local4, "title" ), f472_local7 )
			Engine.SetModelValue( Engine.CreateModel( f472_local4, "slotIndex" ), f472_local1 )
			table.insert( f472_arg1.items, f472_local4 )
		end
		local f472_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "CallingCardShowcaseUpdated" )
		if f472_arg1.updateSubscription then
			f472_arg1:removeSubscription( f472_arg1.updateSubscription )
		end
		f472_arg1.updateSubscription = f472_arg1:subscribeToModel( f472_local1, function ()
			f472_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f474_arg0 )
		return #f474_arg0.items
	end,
	getItem = function ( f475_arg0, f475_arg1, f475_arg2 )
		return f475_arg1.items[f475_arg2]
	end,
	cleanup = function ( f476_arg0 )
		if f476_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f476_arg0.rootModel )
			f476_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordGameModeList = {
	prepare = function ( f477_arg0, f477_arg1, f477_arg2 )
		f477_arg1.items = {}
		local f477_local0 = Engine.CreateModel( Engine.GetModelForController( f477_arg0 ), "CombatRecordGameModeList" )
		f477_arg1.rootModel = f477_local0
		local f477_local1 = CoD.GetCombatRecordStats( f477_arg0 )
		local f477_local2 = CoD.GetCombatRecordComparisonStats( f477_arg0 )
		for f477_local32, f477_local33 in pairs( Engine.GetGametypesBase( CoD.GetCombatRecordMode() ) ) do
			if f477_local33.category == "standard" and CoD.AllowGameType( f477_local33.gametype ) then
				local f477_local6 = Engine.CreateModel( f477_local0, f477_local32 )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "name" ), Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f477_local33.gametype, "name_ref" ) )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "image" ), Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f477_local33.gametype, "image" ) )
				local f477_local7 = "PlayerStatsByGameType." .. f477_local33.gametype .. ".LOSSES"
				local f477_local8 = CoD.GetCombatRecordStatForPathOrZero( f477_local1, f477_local7 )
				local f477_local9 = 0
				if f477_local2 then
					f477_local9 = CoD.GetCombatRecordStatForPathOrZero( f477_local2, f477_local7 )
				end
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "losses" ), f477_local8 )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "lossesComparison" ), f477_local9 )
				local f477_local10 = "PlayerStatsByGameType." .. f477_local33.gametype .. ".WINS"
				local f477_local11 = CoD.GetCombatRecordStatForPathOrZero( f477_local1, f477_local10 )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "stat" ), f477_local11 )
				local f477_local12 = 0
				if f477_local2 then
					f477_local12 = CoD.GetCombatRecordStatForPathOrZero( f477_local2, f477_local10 )
				end
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "statComparison" ), f477_local12 )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "wlRatio" ), CoD.GetDisplayRatioFromTwoStats( f477_local11, f477_local8 ) )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "wlRatioComparison" ), CoD.GetDisplayRatioFromTwoStats( f477_local12, f477_local9 ) )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "lossRingFrac" ), f477_local8 / math.max( 1, f477_local8 + f477_local11 ) )
				local f477_local13 = "PlayerStatsByGameType." .. f477_local33.gametype .. ".WIN_STREAK"
				local f477_local14 = CoD.GetCombatRecordStatForPathOrZero( f477_local1, f477_local13 )
				local f477_local15 = 0
				if f477_local2 then
					f477_local15 = CoD.GetCombatRecordStatForPathOrZero( f477_local2, f477_local13 )
				end
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "streak" ), f477_local14 )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "streakComparison" ), f477_local15 )
				local f477_local16 = "PlayerStatsByGameType." .. f477_local33.gametype .. ".KILLS"
				local f477_local17 = CoD.GetCombatRecordStatForPathOrZero( f477_local1, f477_local16 )
				local f477_local18 = 0
				if f477_local2 then
					f477_local18 = CoD.GetCombatRecordStatForPathOrZero( f477_local2, f477_local16 )
				end
				local f477_local19 = "PlayerStatsByGameType." .. f477_local33.gametype .. ".DEATHS"
				local f477_local20 = CoD.GetCombatRecordStatForPathOrZero( f477_local1, f477_local19 )
				local f477_local21 = 0
				if f477_local2 then
					f477_local21 = CoD.GetCombatRecordStatForPathOrZero( f477_local2, f477_local19 )
				end
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "kdRatio" ), CoD.GetDisplayRatioFromTwoStats( f477_local17, f477_local20 ) )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "kdRatioComparison" ), CoD.GetDisplayRatioFromTwoStats( f477_local18, f477_local21 ) )
				local f477_local22 = "PlayerStatsByGameType." .. f477_local33.gametype .. ".SCORE"
				local f477_local23 = CoD.GetCombatRecordStatForPathOrZero( f477_local1, f477_local22 )
				local f477_local24 = 0
				if f477_local2 then
					f477_local24 = CoD.GetCombatRecordStatForPathOrZero( f477_local2, f477_local22 )
				end
				local f477_local25 = "PlayerStatsByGameType." .. f477_local33.gametype .. ".TIME_PLAYED_TOTAL"
				local f477_local26 = CoD.GetCombatRecordStatForPathOrZero( f477_local1, f477_local25 )
				local f477_local27 = 0
				if f477_local2 then
					f477_local27 = CoD.GetCombatRecordStatForPathOrZero( f477_local2, f477_local25 )
				end
				local f477_local28 = math.max( 1, f477_local26 / 60 )
				local f477_local29 = math.max( 1, f477_local27 / 60 )
				local f477_local30 = math.floor( f477_local23 / f477_local28 + 0.5 )
				local f477_local31 = math.floor( f477_local24 / f477_local29 + 0.5 )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "spm" ), f477_local30 )
				Engine.SetModelValue( Engine.CreateModel( f477_local6, "spmComparison" ), f477_local31 )
				table.insert( f477_arg1.items, f477_local6 )
			end
		end
		table.sort( f477_arg1.items, function ( f478_arg0, f478_arg1 )
			local f478_local0 = Engine.GetModelValue( Engine.GetModel( f478_arg0, "stat" ) )
			local f478_local1 = Engine.GetModelValue( Engine.GetModel( f478_arg1, "stat" ) )
			if f478_local0 == f478_local1 then
				return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f478_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f478_arg1, "name" ) ) )
			else
				return f478_local1 < f478_local0
			end
		end )
	end,
	getCount = function ( f479_arg0 )
		return #f479_arg0.items
	end,
	getItem = function ( f480_arg0, f480_arg1, f480_arg2 )
		return f480_arg1.items[f480_arg2]
	end,
	cleanup = function ( f481_arg0 )
		if f481_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f481_arg0.rootModel )
			f481_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordMostWonGameMode = {
	getModel = function ( f482_arg0 )
		local f482_local0 = Engine.CreateModel( Engine.GetModelForController( f482_arg0 ), "CombatRecordMostWonGameMode" )
		local f482_local1, f482_local2, f482_local3 = nil
		local f482_local4 = CoD.GetCombatRecordStats( f482_arg0 )
		for f482_local9, f482_local10 in pairs( Engine.GetGametypesBase( CoD.GetCombatRecordMode() ) ) do
			if f482_local10.category == "standard" then
				local f482_local8 = CoD.GetCombatRecordStatForPath( f482_local4, "PlayerStatsByGameType." .. f482_local10.gametype .. ".WINS" )
				if not f482_local1 or f482_local1 < f482_local8 then
					f482_local1 = f482_local8
					f482_local2 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f482_local10.gametype, "image" )
					f482_local3 = Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f482_local10.gametype, "name_ref" )
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( f482_local0, "image" ), f482_local2 )
		Engine.SetModelValue( Engine.CreateModel( f482_local0, "name" ), f482_local3 )
		Engine.SetModelValue( Engine.CreateModel( f482_local0, "wins" ), f482_local1 )
		return f482_local0
	end
}
DataSources.CombatRecordMPMedal1 = {
	getModel = function ( f483_arg0 )
		local f483_local0 = Engine.CreateModel( Engine.GetModelForController( f483_arg0 ), "CombatRecordMedal1" )
		Engine.SetModelValue( Engine.CreateModel( f483_local0, "medalRef" ), "MEDAL_HEADSHOT" )
		local f483_local1 = Engine.StorageGetBuffer( f483_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local f483_local2 = f483_local1.playerstatslist.medal_headshot.statvalue:get()
		if f483_local2 > 0 then
			local f483_local3 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, "MEDAL_HEADSHOT", 3 ) )
			if f483_local3 then
				Engine.SetModelValue( Engine.CreateModel( f483_local0, "backingLarge" ), f483_local3.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( f483_local0, "iconLarge" ), f483_local3.iconLarge )
				Engine.SetModelValue( Engine.CreateModel( f483_local0, "value" ), f483_local2 )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( f483_local0, "backingLarge" ), "uie_t7_hud_medal_backing_badassery_outline" )
			Engine.SetModelValue( Engine.CreateModel( f483_local0, "iconLarge" ), "$blank" )
			Engine.SetModelValue( Engine.CreateModel( f483_local0, "value" ), "--" )
		end
		return f483_local0
	end
}
DataSources.CombatRecordMPMedal2 = {
	getModel = function ( f484_arg0 )
		local f484_local0 = Engine.CreateModel( Engine.GetModelForController( f484_arg0 ), "CombatRecordMedal2" )
		local f484_local1 = {
			"MEDAL_KILLSTREAK_MORE_THAN_30",
			"MEDAL_KILLSTREAK_30",
			"MEDAL_KILLSTREAK_25",
			"MEDAL_KILLSTREAK_20",
			"MEDAL_KILLSTREAK_15",
			"MEDAL_KILLSTREAK_10",
			"MEDAL_KILLSTREAK_5"
		}
		local f484_local2 = Engine.StorageGetBuffer( f484_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local f484_local3, f484_local4, f484_local5, f484_local6 = nil
		for f484_local10, f484_local11 in ipairs( f484_local1 ) do
			local f484_local12 = f484_local2.playerstatslist[f484_local11].statvalue:get()
			if f484_local12 and f484_local12 > 0 then
				f484_local3 = f484_local11
				f484_local4 = f484_local12
				break
			end
		end
		if f484_local3 then
			f484_local8 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, f484_local3, 3 ) )
			Engine.SetModelValue( Engine.CreateModel( f484_local0, "medalRef" ), f484_local3 )
			Engine.SetModelValue( Engine.CreateModel( f484_local0, "value" ), f484_local4 )
			if f484_local8 then
				Engine.SetModelValue( Engine.CreateModel( f484_local0, "backingLarge" ), f484_local8.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( f484_local0, "iconLarge" ), f484_local8.iconLarge )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( f484_local0, "medalRef" ), "MENU_KILL_STREAKS" )
			Engine.SetModelValue( Engine.CreateModel( f484_local0, "value" ), "--" )
			Engine.SetModelValue( Engine.CreateModel( f484_local0, "backingLarge" ), "uie_t7_hud_medal_backing_killstreak_outline" )
			Engine.SetModelValue( Engine.CreateModel( f484_local0, "iconLarge" ), "$blank" )
		end
		return f484_local0
	end
}
DataSources.CombatRecordMPMedal3 = {
	getModel = function ( f485_arg0 )
		local f485_local0 = Engine.CreateModel( Engine.GetModelForController( f485_arg0 ), "CombatRecordMedal3" )
		local f485_local1 = {
			"MEDAL_MULTIKILL_MORE_THAN_8",
			"MEDAL_MULTIKILL_8",
			"MEDAL_MULTIKILL_7",
			"MEDAL_MULTIKILL_6",
			"MEDAL_MULTIKILL_5",
			"MEDAL_MULTIKILL_4",
			"MEDAL_MULTIKILL_3",
			"MEDAL_MULTIKILL_2"
		}
		local f485_local2 = Engine.StorageGetBuffer( f485_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local f485_local3, f485_local4, f485_local5, f485_local6 = nil
		for f485_local10, f485_local11 in ipairs( f485_local1 ) do
			local f485_local12 = f485_local2.playerstatslist[f485_local11].statvalue:get()
			if f485_local12 and f485_local12 > 0 then
				f485_local3 = f485_local11
				f485_local4 = f485_local12
				break
			end
		end
		if f485_local3 then
			f485_local8 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, f485_local3, 3 ) )
			Engine.SetModelValue( Engine.CreateModel( f485_local0, "medalRef" ), f485_local3 )
			Engine.SetModelValue( Engine.CreateModel( f485_local0, "value" ), f485_local4 )
			if f485_local8 then
				Engine.SetModelValue( Engine.CreateModel( f485_local0, "backingLarge" ), f485_local8.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( f485_local0, "iconLarge" ), f485_local8.iconLarge )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( f485_local0, "medalRef" ), "MENU_MULTI_KILLS" )
			Engine.SetModelValue( Engine.CreateModel( f485_local0, "value" ), "--" )
			Engine.SetModelValue( Engine.CreateModel( f485_local0, "backingLarge" ), "uie_t7_hud_medal_backing_multikill_outline" )
			Engine.SetModelValue( Engine.CreateModel( f485_local0, "iconLarge" ), "$blank" )
		end
		return f485_local0
	end
}
DataSources.CombatRecordMPMedal4 = {
	getModel = function ( f486_arg0 )
		local f486_local0 = Engine.CreateModel( Engine.GetModelForController( f486_arg0 ), "CombatRecordMedal4" )
		local f486_local1 = {
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
		local f486_local2 = Engine.StorageGetBuffer( f486_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local f486_local3 = nil
		local f486_local4 = 0
		local f486_local5, f486_local6 = nil
		for f486_local10, f486_local11 in ipairs( f486_local1 ) do
			local f486_local12 = f486_local2.playerstatslist[f486_local11].statvalue:get()
			if f486_local12 and f486_local4 < f486_local12 then
				f486_local3 = f486_local11
				f486_local4 = f486_local12
			end
		end
		if f486_local3 then
			f486_local8 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, f486_local3, 3 ) )
			Engine.SetModelValue( Engine.CreateModel( f486_local0, "medalRef" ), f486_local3 )
			Engine.SetModelValue( Engine.CreateModel( f486_local0, "value" ), f486_local4 )
			if f486_local8 then
				Engine.SetModelValue( Engine.CreateModel( f486_local0, "backingLarge" ), f486_local8.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( f486_local0, "iconLarge" ), f486_local8.iconLarge )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( f486_local0, "medalRef" ), "MENU_SPECIALIST_WEAPON" )
			Engine.SetModelValue( Engine.CreateModel( f486_local0, "value" ), "--" )
			Engine.SetModelValue( Engine.CreateModel( f486_local0, "backingLarge" ), "uie_t7_hud_medal_backing_specialist_outline" )
			Engine.SetModelValue( Engine.CreateModel( f486_local0, "iconLarge" ), "$blank" )
		end
		return f486_local0
	end
}
DataSources.CombatRecordMPMedal5 = {
	getModel = function ( f487_arg0 )
		local f487_local0 = Engine.CreateModel( Engine.GetModelForController( f487_arg0 ), "CombatRecordMedal5" )
		local f487_local1 = {
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
		local f487_local2 = Engine.StorageGetBuffer( f487_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local f487_local3 = nil
		local f487_local4 = 0
		local f487_local5, f487_local6 = nil
		for f487_local10, f487_local11 in ipairs( f487_local1 ) do
			local f487_local12 = f487_local2.playerstatslist[f487_local11].statvalue:get()
			if f487_local12 and f487_local4 < f487_local12 then
				f487_local3 = f487_local11
				f487_local4 = f487_local12
			end
		end
		if f487_local3 then
			f487_local8 = Engine.GetMedalInfo( Engine.TableLookup( nil, CoD.scoreInfoTableMP, 2, f487_local3, 3 ) )
			Engine.SetModelValue( Engine.CreateModel( f487_local0, "medalRef" ), f487_local3 )
			Engine.SetModelValue( Engine.CreateModel( f487_local0, "value" ), f487_local4 )
			if f487_local8 then
				Engine.SetModelValue( Engine.CreateModel( f487_local0, "backingLarge" ), f487_local8.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( f487_local0, "iconLarge" ), f487_local8.iconLarge )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( f487_local0, "medalRef" ), "MENU_SPECIALIST_ABILITY" )
			Engine.SetModelValue( Engine.CreateModel( f487_local0, "value" ), "--" )
			Engine.SetModelValue( Engine.CreateModel( f487_local0, "backingLarge" ), "uie_t7_hud_medal_backing_specialist_outline" )
			Engine.SetModelValue( Engine.CreateModel( f487_local0, "iconLarge" ), "$blank" )
		end
		return f487_local0
	end
}
DataSources.CombatRecordMPMedals = {
	prepare = function ( f488_arg0, f488_arg1, f488_arg2 )
		f488_arg1.items = {}
		local f488_local0 = Engine.CreateModel( Engine.GetModelForController( f488_arg0 ), "CombatRecordMPMedals" )
		f488_arg1.rootModel = f488_local0
		local f488_local1 = Engine.StorageGetBuffer( f488_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		f488_local1 = f488_local1.PlayerStatsList
		local f488_local2 = Engine.GetTableRowCount( CoD.scoreInfoTableMP )
		local f488_local3 = 2
		local f488_local4 = 3
		local f488_local5 = 12
		local f488_local6 = 13
		local f488_local7 = {}
		for f488_local8 = 1, f488_local2, 1 do
			if Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, f488_local8 - 1, f488_local5 ) == CoD.CombatRecordMedalCategory then
				local f488_local11 = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, f488_local8 - 1, f488_local3 )
				local f488_local12 = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, f488_local8 - 1, f488_local4 )
				local f488_local13 = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, f488_local8 - 1, f488_local6 )
				if f488_local11 ~= "" then
					local f488_local14 = f488_local1[f488_local11].statValue:get()
					local f488_local15 = Engine.GetMedalInfo( f488_local12 )
					if f488_local14 > 0 then
						local f488_local16 = Engine.CreateModel( f488_local0, f488_local8 )
						if not f488_local7[f488_local11] then
							f488_local7[f488_local11] = f488_local8
							Engine.SetModelValue( Engine.CreateModel( f488_local16, "name" ), f488_local11 )
							Engine.SetModelValue( Engine.CreateModel( f488_local16, "timesEarned" ), f488_local14 )
							Engine.SetModelValue( Engine.CreateModel( f488_local16, "iconLarge" ), f488_local15.iconLarge )
							Engine.SetModelValue( Engine.CreateModel( f488_local16, "backingLarge" ), f488_local15.backingLarge )
							Engine.SetModelValue( Engine.CreateModel( f488_local16, "sortKey" ), f488_local13 )
							table.insert( f488_arg1.items, f488_local16 )
						else
							local f488_local17 = Engine.GetModel( Engine.GetModel( f488_local0, f488_local7[f488_local11] ), "timesEarned" )
							Engine.SetModelValue( f488_local17, Engine.GetModelValue( f488_local17 ) + f488_local14 )
						end
					end
				end
			end
		end
		if CoD.CombatRecordMedalSortFunc then
			table.sort( f488_arg1.items, CoD.CombatRecordMedalSortFunc )
		end
		return f488_local0
	end,
	getCount = function ( f489_arg0 )
		return #f489_arg0.items
	end,
	getItem = function ( f490_arg0, f490_arg1, f490_arg2 )
		return f490_arg1.items[f490_arg2]
	end,
	cleanup = function ( f491_arg0 )
		if f491_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f491_arg0.rootModel )
			f491_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordMPMedalTabs = ListHelper_SetupDataSource( "CombatRecordMPMedalTabs", function ( f492_arg0 )
	local f492_local0 = function ( f493_arg0, f493_arg1 )
		return Engine.GetModelValue( Engine.GetModel( f493_arg1, "timesEarned" ) ) < Engine.GetModelValue( Engine.GetModel( f493_arg0, "timesEarned" ) )
	end
	
	local f492_local1 = function ( f494_arg0, f494_arg1 )
		return Engine.GetModelValue( Engine.GetModel( f494_arg0, "timesEarned" ) ) < Engine.GetModelValue( Engine.GetModel( f494_arg1, "timesEarned" ) )
	end
	
	local f492_local2 = {}
	table.insert( f492_local2, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f492_local2, {
		models = {
			tabName = "MENU_COMBAT_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "combat",
			sortFunc = f492_local1
		}
	} )
	table.insert( f492_local2, {
		models = {
			tabName = "MENU_SPECIALISTS_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "specialist",
			sortFunc = f492_local0
		}
	} )
	table.insert( f492_local2, {
		models = {
			tabName = "MENU_ANTISPECIALISTS_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "antispecialist",
			sortFunc = f492_local0
		}
	} )
	table.insert( f492_local2, {
		models = {
			tabName = "MENU_SCORESTREAKS_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "scorestreak",
			sortFunc = f492_local0
		}
	} )
	table.insert( f492_local2, {
		models = {
			tabName = "MENU_ANTISCORESTREAKS_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "antiscorestreak",
			sortFunc = f492_local0
		}
	} )
	table.insert( f492_local2, {
		models = {
			tabName = "MPUI_GAMEMODE_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "gamemode",
			sortFunc = f492_local0
		}
	} )
	table.insert( f492_local2, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f492_local2
end, true )
DataSources.CombatRecordMPTabs = ListHelper_SetupDataSource( "CombatRecordMPTabs", function ( f495_arg0 )
	local f495_local0 = {}
	table.insert( f495_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f495_local0, {
		models = {
			tabName = "MPUI_SUMMARY_CAPS",
			tabWidget = "CoD.CombatRecordSummaryPanel",
			tabIcon = ""
		},
		properties = {
			tabId = "summary"
		}
	} )
	table.insert( f495_local0, {
		models = {
			tabName = "MENU_COMBAT_RECORD_TAB_PUBLIC_CAPS",
			tabWidget = "CoD.CombatRecordPublicMatchPanel",
			tabIcon = ""
		},
		properties = {
			tabId = "public"
		}
	} )
	table.insert( f495_local0, {
		models = {
			tabName = "MENU_ARENA_CAPS",
			tabWidget = "CoD.CombatRecordArenaPanel",
			tabIcon = ""
		},
		properties = {
			tabId = "arena"
		}
	} )
	table.insert( f495_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f495_local0
end, true )
DataSources.CombatRecordScorestreakList = {
	prepare = function ( f496_arg0, f496_arg1, f496_arg2 )
		f496_arg1.items = {}
		local f496_local0 = Engine.CreateModel( Engine.GetModelForController( f496_arg0 ), "CombatRecordScorestreakList" )
		f496_arg1.rootModel = f496_local0
		local f496_local1 = CoD.GetCombatRecordStats( f496_arg0 )
		local f496_local2 = CoD.GetCombatRecordComparisonStats( f496_arg0 )
		for f496_local3 = 0, 255, 1 do
			if Engine.GetItemAllocationCost( f496_local3, CoD.GetCombatRecordMode() ) >= 0 and Engine.GetItemGroup( f496_local3, CoD.GetCombatRecordMode() ) == "killstreak" then
				local f496_local6 = Engine.CreateModel( f496_local0, f496_local3 )
				Engine.SetModelValue( Engine.CreateModel( f496_local6, "name" ), Engine.GetItemName( f496_local3, CoD.GetCombatRecordMode() ) )
				local f496_local7 = "kills"
				if Engine.IsItemPassive( f496_local3, CoD.GetCombatRecordMode() ) then
					f496_local7 = "assists"
				end
				local f496_local8 = "ItemStats." .. f496_local3 .. ".stats." .. f496_local7
				local f496_local9 = CoD.GetCombatRecordStatForPath( f496_local1, f496_local8 )
				Engine.SetModelValue( Engine.CreateModel( f496_local6, "itemIndex" ), f496_local3 )
				Engine.SetModelValue( Engine.CreateModel( f496_local6, "stat" ), f496_local9 )
				Engine.SetModelValue( Engine.CreateModel( f496_local6, "statName" ), Engine.Localize( "MENU_" .. f496_local7 .. "_CAPS" ) )
				Engine.SetModelValue( Engine.CreateModel( f496_local6, "statPerUseString" ), Engine.Localize( "MENU_" .. f496_local7 .. "_PER_USE_CAPS" ) )
				local f496_local10 = 0
				if f496_local2 then
					f496_local10 = CoD.GetCombatRecordStatForPath( f496_local2, f496_local8 )
				end
				Engine.SetModelValue( Engine.CreateModel( f496_local6, "statComparison" ), f496_local10 )
				table.insert( f496_arg1.items, f496_local6 )
			end
		end
		table.sort( f496_arg1.items, function ( f497_arg0, f497_arg1 )
			local f497_local0 = Engine.GetModelValue( Engine.GetModel( f497_arg0, "stat" ) )
			local f497_local1 = Engine.GetModelValue( Engine.GetModel( f497_arg1, "stat" ) )
			if f497_local0 == f497_local1 then
				return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f497_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f497_arg1, "name" ) ) )
			else
				return f497_local1 < f497_local0
			end
		end )
	end,
	getCount = function ( f498_arg0 )
		return #f498_arg0.items
	end,
	getItem = function ( f499_arg0, f499_arg1, f499_arg2 )
		return f499_arg1.items[f499_arg2]
	end,
	cleanup = function ( f500_arg0 )
		if f500_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f500_arg0.rootModel )
			f500_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordCybercoreList = {
	prepare = function ( f501_arg0, f501_arg1, f501_arg2 )
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f501_arg0, nil, CoD.GetCombatRecordMode() )
		f501_arg1.items = {}
		local f501_local0 = Engine.CreateModel( Engine.GetModelForController( f501_arg0 ), "CombatRecordCybercoreList" )
		f501_arg1.rootModel = f501_local0
		local f501_local1 = CoD.GetCombatRecordStats( f501_arg0 )
		local f501_local2 = CoD.GetCombatRecordComparisonStats( f501_arg0 )
		for f501_local13, f501_local14 in ipairs( CoD.UnlockablesTable.cybercom_abilities ) do
			local f501_local15 = Engine.GetModelValue( Engine.GetModel( f501_local14, "ref" ) )
			local f501_local6 = false
			if LUI.endswith( f501_local15, "_pro" ) then
				f501_local6 = true
			end
			if not f501_local6 then
				local f501_local7 = Engine.GetModelValue( Engine.GetModel( f501_local14, "itemIndex" ) )
				local f501_local8 = Engine.CreateModel( f501_local0, f501_local7 )
				Engine.SetModelValue( Engine.CreateModel( f501_local8, "name" ), Engine.GetItemName( f501_local7, CoD.GetCombatRecordMode() ) )
				local f501_local9 = CoD.GetCombatRecordStatForPath( f501_local1, "ItemStats." .. f501_local7 .. ".stats.kills" )
				local f501_local10 = CoD.GetCombatRecordStatForPath( f501_local1, "ItemStats." .. f501_local7 .. ".stats.assists" )
				local f501_local11 = CoD.GetCombatRecordStatForPath( f501_local1, "ItemStats." .. f501_local7 .. ".stats.used" )
				Engine.SetModelValue( Engine.CreateModel( f501_local8, "cybercoreName" ), Engine.GetItemName( f501_local7, CoD.GetCombatRecordMode() ) )
				Engine.SetModelValue( Engine.CreateModel( f501_local8, "cybercoreIndex" ), f501_local7 )
				if f501_local9 < f501_local10 then
					Engine.SetModelValue( Engine.CreateModel( f501_local8, "stat" ), "*" .. f501_local10 )
					Engine.SetModelValue( Engine.CreateModel( f501_local8, "killsPerUse" ), "*" .. CoD.GetDisplayRatioFromTwoStats( f501_local10, f501_local11 ) )
					local f501_local12 = 0
					if f501_local2 then
						f501_local12 = CoD.GetCombatRecordStatForPath( f501_local2, "ItemStats." .. f501_local7 .. ".stats.assists" )
					end
					Engine.SetModelValue( Engine.CreateModel( f501_local8, "statComparison" ), f501_local12 )
				else
					Engine.SetModelValue( Engine.CreateModel( f501_local8, "stat" ), f501_local9 )
					Engine.SetModelValue( Engine.CreateModel( f501_local8, "killsPerUse" ), CoD.GetDisplayRatioFromTwoStats( f501_local9, f501_local11 ) )
					local f501_local12 = 0
					if f501_local2 then
						f501_local12 = CoD.GetCombatRecordStatForPath( f501_local2, "ItemStats." .. f501_local7 .. ".stats.kills" )
					end
					Engine.SetModelValue( Engine.CreateModel( f501_local8, "statComparison" ), f501_local12 )
				end
				table.insert( f501_arg1.items, f501_local8 )
			end
		end
		table.sort( f501_arg1.items, function ( f502_arg0, f502_arg1 )
			local f502_local0 = Engine.GetModelValue( Engine.GetModel( f502_arg0, "stat" ) )
			local f502_local1 = Engine.GetModelValue( Engine.GetModel( f502_arg1, "stat" ) )
			if type( f502_local0 ) == "string" and LUI.startswith( f502_local0, "*" ) then
				f502_local0 = tonumber( string.sub( f502_local0, 2 ) )
			end
			if type( f502_local1 ) == "string" and LUI.startswith( f502_local1, "*" ) then
				f502_local1 = tonumber( string.sub( f502_local1, 2 ) )
			end
			if f502_local0 == f502_local1 then
				return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f502_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f502_arg1, "name" ) ) )
			else
				return f502_local1 < f502_local0
			end
		end )
	end,
	getCount = function ( f503_arg0 )
		return #f503_arg0.items
	end,
	getItem = function ( f504_arg0, f504_arg1, f504_arg2 )
		return f504_arg1.items[f504_arg2]
	end,
	cleanup = function ( f505_arg0 )
		if f505_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f505_arg0.rootModel )
			f505_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordSpecialistList = {
	prepare = function ( f506_arg0, f506_arg1, f506_arg2 )
		f506_arg1.items = {}
		local f506_local0 = Engine.CreateModel( Engine.GetModelForController( f506_arg0 ), "CombatRecordSpecialistList" )
		f506_arg1.rootModel = f506_local0
		local f506_local1 = CoD.GetCombatRecordStats( f506_arg0 )
		local f506_local2 = CoD.GetCombatRecordComparisonStats( f506_arg0 )
		for f506_local15, f506_local16 in ipairs( Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER ) ) do
			if f506_local16.disabled ~= true then
				local f506_local6 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f506_local15 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
				local f506_local7 = Engine.CreateModel( f506_local0, f506_local6 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "name" ), Engine.GetItemName( f506_local6, CoD.GetCombatRecordMode() ) )
				local f506_local8 = "ItemStats." .. f506_local6 .. ".stats.kills"
				if f506_local15 == 10 then
					f506_local8 = "SpecialistStats.9.stats.kills_weapon"
				end
				local f506_local9 = CoD.GetCombatRecordStatForPath( f506_local1, f506_local8 )
				local f506_local10 = 0
				local f506_local11 = 0
				if f506_local2 then
					f506_local10 = CoD.GetCombatRecordStatForPath( f506_local2, f506_local8 )
					f506_local11 = CombatRecordGetComparisonTwoStatRatioForItemIndexAndSpecificNumerator( f506_arg0, f506_local8, "used", f506_local6 )
				end
				local f506_local12 = CombatRecordGetTwoStatRatioForItemIndexAndSpecificNumerator( f506_arg0, f506_local8, "used", f506_local6 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "heroIndex" ), f506_local15 - 1 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "heroName" ), f506_local16.displayName )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "itemIndex" ), f506_local6 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "killsPerUse" ), f506_local12 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "killsPerUseComparison" ), tonumber( f506_local11 ) )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "stat" ), f506_local9 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "statComparison" ), f506_local10 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "statDesc" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "type" ), Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
				table.insert( f506_arg1.items, f506_local7 )
				local f506_local13 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f506_local15 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
				f506_local7 = Engine.CreateModel( f506_local0, f506_local13 )
				local f506_local14 = Engine.GetItemName( f506_local13, CoD.GetCombatRecordMode() )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "name" ), f506_local14 )
				f506_local8 = "ItemStats." .. f506_local13 .. ".stats.combatRecordStat"
				if f506_local15 == 10 then
					f506_local8 = "SpecialistStats.9.stats.kills_ability"
				end
				f506_local9 = CoD.GetCombatRecordStatForPath( f506_local1, f506_local8 )
				f506_local10 = 0
				if f506_local2 then
					f506_local10 = CoD.GetCombatRecordStatForPath( f506_local2, f506_local8 )
					f506_local11 = CombatRecordGetComparisonTwoStatRatioForItemIndexAndSpecificNumerator( f506_arg0, f506_local8, "used", f506_local13 )
				end
				f506_local12 = CombatRecordGetTwoStatRatioForItemIndexAndSpecificNumerator( f506_arg0, f506_local8, "used", f506_local13 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "heroIndex" ), f506_local15 - 1 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "heroName" ), f506_local16.displayName )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "itemIndex" ), f506_local13 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "killsPerUse" ), f506_local12 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "killsPerUseComparison" ), tonumber( f506_local11 ) )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "stat" ), f506_local9 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "statComparison" ), f506_local10 )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "statDesc" ), f506_local14 .. "_KILLS_DESC" )
				Engine.SetModelValue( Engine.CreateModel( f506_local7, "type" ), Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
				table.insert( f506_arg1.items, f506_local7 )
			end
		end
		table.sort( f506_arg1.items, function ( f507_arg0, f507_arg1 )
			local f507_local0 = Engine.GetModelValue( Engine.GetModel( f507_arg0, "stat" ) )
			local f507_local1 = Engine.GetModelValue( Engine.GetModel( f507_arg1, "stat" ) )
			if f507_local0 == f507_local1 then
				return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f507_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f507_arg1, "name" ) ) )
			else
				return f507_local1 < f507_local0
			end
		end )
	end,
	getCount = function ( f508_arg0 )
		return #f508_arg0.items
	end,
	getItem = function ( f509_arg0, f509_arg1, f509_arg2 )
		return f509_arg1.items[f509_arg2]
	end,
	cleanup = function ( f510_arg0 )
		if f510_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f510_arg0.rootModel )
			f510_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordWeaponsList = {
	prepare = function ( f511_arg0, f511_arg1, f511_arg2 )
		f511_arg1.weapons = {}
		local f511_local0 = Engine.CreateModel( Engine.GetModelForController( f511_arg0 ), "CombatRecordWeaponsList" )
		f511_arg1.rootModel = f511_local0
		local f511_local1 = CoD.GetCombatRecordStats( f511_arg0 )
		local f511_local2 = CoD.GetCombatRecordComparisonStats( f511_arg0 )
		for f511_local3 = 0, 255, 1 do
			local f511_local6 = Engine.GetItemAllocationCost( f511_local3, CoD.GetCombatRecordMode() )
			if f511_local6 < -1 or f511_local6 >= 0 then
				local f511_local7 = Engine.GetLoadoutSlotForItem( f511_local3, CoD.GetCombatRecordMode() )
				if f511_local7 == "primary" or f511_local7 == "secondary" then
					local f511_local8 = Engine.CreateModel( f511_local0, f511_local3 )
					local f511_local9 = "ItemStats." .. f511_local3 .. ".stats.kills"
					local f511_local10 = "ItemStats." .. f511_local3 .. ".stats.destroyed"
					local f511_local11 = CoD.GetCombatRecordStatForPath( f511_local1, f511_local9 )
					local f511_local12 = CoD.GetCombatRecordStatForPath( f511_local1, f511_local10 )
					local f511_local13 = "kills"
					local f511_local14 = f511_local11
					if Engine.GetItemGroup( f511_local3, CoD.GetCombatRecordMode() ) == "weapon_launcher" then
						f511_local13 = "kills_destroys"
						f511_local14 = f511_local11 + f511_local12
					end
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "itemIndex" ), f511_local3 )
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "stat" ), f511_local14 )
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "statName" ), Engine.Localize( "MENU_" .. f511_local13 .. "_CAPS" ) )
					local f511_local15 = false
					local f511_local16 = Engine.GetItemName( f511_local3, CoD.GetCombatRecordMode() )
					local f511_local17 = Engine.GetItemRef( f511_local3, CoD.GetCombatRecordMode() )
					local f511_local18 = Engine.GetShotCountForItem( f511_local3, CoD.GetCombatRecordMode() ) or 1
					local f511_local19 = 1
					if CoD.BlackMarketUtility.IsBlackMarketItem( f511_local17 ) and CoD.BlackMarketUtility.IsItemLocked( f511_arg0, f511_local17 ) then
						f511_local16 = CoD.BlackMarketUtility.ClassifiedName( false )
						f511_local15 = true
						f511_local19 = 0
					end
					local f511_local20 = false
					if CoD.ContractWeaponTiers[f511_local17] and not IsThermometerUnlockIndexGreaterThanorEqualTo( CoD.ContractWeaponTiers[f511_local17] ) then
						f511_local16 = CoD.BlackMarketUtility.ClassifiedName( false )
						f511_local20 = true
						f511_local19 = 0
					end
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "name" ), f511_local16 )
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "isBMClassified" ), f511_local15 )
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "isContractClassified" ), f511_local20 )
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "statsAlpha" ), f511_local19 )
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "shotCount" ), f511_local18 )
					local f511_local21 = 0
					if f511_local2 then
						f511_local21 = CoD.GetCombatRecordStatForPath( f511_local2, f511_local9 )
					end
					Engine.SetModelValue( Engine.CreateModel( f511_local8, "statComparison" ), f511_local21 )
					if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f511_local17 ) and (Dvar.ui_enablePromoMenu:get() or not CoD.ContractWeaponTiers[f511_local17]) then
						table.insert( f511_arg1.weapons, f511_local8 )
					end
				end
			end
		end
		table.sort( f511_arg1.weapons, function ( f512_arg0, f512_arg1 )
			local f512_local0 = CoD.SafeGetModelValue( f512_arg0, "isBMClassified" )
			local f512_local1 = CoD.SafeGetModelValue( f512_arg1, "isBMClassified" )
			if f512_local0 and not f512_local1 then
				return false
			elseif not f512_local0 and f512_local1 then
				return true
			else
				local f512_local2 = CoD.SafeGetModelValue( f512_arg0, "isContractClassified" )
				local f512_local3 = CoD.SafeGetModelValue( f512_arg1, "isContractClassified" )
				if f512_local2 and not f512_local3 then
					return false
				elseif not f512_local2 and f512_local3 then
					return true
				else
					local f512_local4 = Engine.GetModelValue( Engine.GetModel( f512_arg0, "stat" ) )
					local f512_local5 = Engine.GetModelValue( Engine.GetModel( f512_arg1, "stat" ) )
					if f512_local4 == f512_local5 then
						return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f512_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f512_arg1, "name" ) ) )
					else
						return f512_local5 < f512_local4
					end
				end
			end
		end )
	end,
	getCount = function ( f513_arg0 )
		return #f513_arg0.weapons
	end,
	getItem = function ( f514_arg0, f514_arg1, f514_arg2 )
		return f514_arg1.weapons[f514_arg2]
	end,
	cleanup = function ( f515_arg0 )
		if f515_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f515_arg0.rootModel )
			f515_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordBGBList = {
	prepare = function ( f516_arg0, f516_arg1, f516_arg2 )
		f516_arg1.bubbleGumBuffs = {}
		local f516_local0 = Engine.CreateModel( Engine.GetModelForController( f516_arg0 ), "combatRecordBGBListModel" )
		f516_arg1.rootModel = f516_local0
		local f516_local1 = CoD.GetCombatRecordStats( f516_arg0 )
		local f516_local2 = CoD.GetCombatRecordComparisonStats( f516_arg0 )
		for f516_local3 = 0, 255, 1 do
			if Engine.GetLoadoutSlotForItem( f516_local3, CoD.GetCombatRecordMode() ) == "equippedbubblegumpack" and not CoD.IsHiddenDLC( CoD.ProductBitFromId[CoD.CACUtility.GetDLCIdForBubbleGum( f516_local3 )] ) then
				local f516_local6 = Engine.CreateModel( f516_local0, f516_local3 )
				Engine.SetModelValue( Engine.CreateModel( f516_local6, "name" ), Engine.GetItemName( f516_local3, CoD.GetCombatRecordMode() ) )
				local f516_local7 = CoD.GetCombatRecordStatForPath( f516_local1, "ItemStats." .. f516_local3 .. ".stats.used" )
				Engine.SetModelValue( Engine.CreateModel( f516_local6, "itemIndex" ), f516_local3 )
				Engine.SetModelValue( Engine.CreateModel( f516_local6, "stat" ), f516_local7 )
				local f516_local8 = 0
				if f516_local2 then
					f516_local8 = CoD.GetCombatRecordStatForPath( f516_local2, "ItemStats." .. f516_local3 .. ".stats.used" )
				end
				Engine.SetModelValue( Engine.CreateModel( f516_local6, "statComparison" ), f516_local8 )
				table.insert( f516_arg1.bubbleGumBuffs, f516_local6 )
			end
		end
		table.sort( f516_arg1.bubbleGumBuffs, function ( f517_arg0, f517_arg1 )
			local f517_local0 = Engine.GetModelValue( Engine.GetModel( f517_arg0, "stat" ) )
			local f517_local1 = Engine.GetModelValue( Engine.GetModel( f517_arg1, "stat" ) )
			if f517_local0 == f517_local1 then
				return Engine.Localize( Engine.GetModelValue( Engine.GetModel( f517_arg0, "name" ) ) ) < Engine.Localize( Engine.GetModelValue( Engine.GetModel( f517_arg1, "name" ) ) )
			else
				return f517_local1 < f517_local0
			end
		end )
	end,
	getCount = function ( f518_arg0 )
		return #f518_arg0.bubbleGumBuffs
	end,
	getItem = function ( f519_arg0, f519_arg1, f519_arg2 )
		return f519_arg1.bubbleGumBuffs[f519_arg2]
	end,
	cleanup = function ( f520_arg0 )
		if f520_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f520_arg0.rootModel )
			f520_arg0.rootModel = nil
		end
	end
}
DataSources.CombatRecordZMMapsList = {
	prepare = function ( f521_arg0, f521_arg1, f521_arg2 )
		f521_arg1.maps = {}
		local f521_local0 = Engine.CreateModel( Engine.GetModelForController( f521_arg0 ), "CombatRecordZMMapsList" )
		local f521_local1 = CoD.GetCombatRecordStats( f521_arg0 )
		for f521_local11, f521_local12 in pairs( CoD.mapsTable ) do
			if f521_local12.session_mode == Enum.eModes.MODE_ZOMBIES and not CoD.IsHiddenDLC( Engine.GetDLCBitForMapName( f521_local11 ) ) and f521_local1.PlayerStatsByMap and f521_local1.PlayerStatsByMap[f521_local11] then
				local f521_local5 = f521_local1.PlayerStatsByMap[f521_local11]
				local f521_local6 = Engine.CreateModel( f521_local0, f521_local11 )
				local f521_local7 = 0
				local f521_local8 = 0
				local f521_local9 = 0
				local f521_local10 = 0
				f521_local7 = f521_local5.stats.HIGHEST_ROUND_REACHED.statValue:get()
				f521_local8 = f521_local5.stats.TOTAL_ROUNDS_SURVIVED.statValue:get()
				f521_local9 = f521_local5.stats.TOTAL_GAMES_PLAYED.statValue:get()
				f521_local10 = f521_local5.stats.TOTAL_DOWNS.statValue:get()
				Engine.SetModelValue( Engine.CreateModel( f521_local6, "name" ), MapNameToLocalizedMapName( f521_local11 ) )
				Engine.SetModelValue( Engine.CreateModel( f521_local6, "highestRound" ), f521_local7 )
				Engine.SetModelValue( Engine.CreateModel( f521_local6, "avgDowns" ), math.floor( f521_local10 / math.max( 1, f521_local9 ) + 0.5 ) )
				Engine.SetModelValue( Engine.CreateModel( f521_local6, "avgRounds" ), math.floor( f521_local8 / math.max( 1, f521_local9 ) + 0.5 ) )
				Engine.SetModelValue( Engine.CreateModel( f521_local6, "stat" ), f521_local7 )
				Engine.SetModelValue( Engine.CreateModel( f521_local6, "previewImage" ), f521_local12.previewImage )
				table.insert( f521_arg1.maps, f521_local6 )
			end
		end
		table.sort( f521_arg1.maps, function ( f522_arg0, f522_arg1 )
			return Engine.GetModelValue( Engine.GetModel( f522_arg1, "stat" ) ) < Engine.GetModelValue( Engine.GetModel( f522_arg0, "stat" ) )
		end )
	end,
	getCount = function ( f523_arg0 )
		return #f523_arg0.maps
	end,
	getItem = function ( f524_arg0, f524_arg1, f524_arg2 )
		return f524_arg1.maps[f524_arg2]
	end
}
DataSources.CombatRecordCPPercentComplete = {
	getModel = function ( f525_arg0 )
		local f525_local0 = Engine.CreateModel( Engine.GetModelForController( f525_arg0 ), "CombatRecordCPPercentComplete" )
		local f525_local1 = 35
		local f525_local2 = 15
		local f525_local3 = 8
		local f525_local4 = 10
		local f525_local5 = 10
		local f525_local6 = 10
		local f525_local7 = 10
		local f525_local8 = 2
		local f525_local9 = 0
		local f525_local10 = 0
		local f525_local11 = 0
		local f525_local12 = 0
		local f525_local13 = 0
		local f525_local14 = 0
		local f525_local15 = 0
		local f525_local16 = 0
		local f525_local17 = 0
		local f525_local18 = 0
		local f525_local19 = 0
		local f525_local20 = 0
		local f525_local21 = 0
		local f525_local22 = 0
		local f525_local23 = 0
		local f525_local24 = 0
		local f525_local25 = 9
		local f525_local26 = 0
		local f525_local27 = 0
		local f525_local28 = function ( f526_arg0, f526_arg1 )
			return CoD.mapsTable[f526_arg0].unique_id < CoD.mapsTable[f526_arg1].unique_id
		end
		
		local f525_local29 = Enum.eModes.MODE_CAMPAIGN
		local f525_local30 = Engine.StorageGetBuffer( f525_arg0, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
		if CoD.CombatRecordOtherPlayerStats then
			f525_local30 = Engine.GetOtherPlayerStatsBuffer()
		end
		local f525_local31 = Engine.GetPlayerStatsNightmare( f525_arg0 )
		for f525_local40, f525_local41 in LUI.IterateTableBySortedKeys( CoD.mapsTable, f525_local28, nil ) do
			if f525_local41.session_mode == f525_local29 and f525_local40 ~= "cp_doa_bo3" and f525_local41.dlc_pack ~= -1 and f525_local41.isSubLevel == false then
				if f525_local41.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT then
					local f525_local35 = CoD.GetCombatRecordStatForPath( f525_local30, "PlayerStatsByMap." .. f525_local41.rootMapName .. ".hasBeenCompleted" ) ~= 0
					f525_local10 = f525_local10 + 1
					if f525_local35 then
						f525_local9 = f525_local9 + 1
					end
					local f525_local36, f525_local37 = GetAccoladesXOfY( f525_arg0, f525_local40, true )
					f525_local11 = f525_local11 + f525_local36
					f525_local12 = f525_local12 + f525_local37
					local f525_local38, f525_local39 = GetCollectiblesXOfY( f525_arg0, f525_local40, true )
					f525_local13 = f525_local13 + f525_local38
					f525_local14 = f525_local14 + f525_local39
				end
				if f525_local41.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
					local f525_local35 = f525_local31.PlayerStatsByMap[f525_local41.rootMapName].hasBeenCompleted:get() ~= 0
					f525_local27 = f525_local27 + 1
					if f525_local35 then
						f525_local26 = f525_local26 + 1
					end
				end
			end
		end
		for f525_local32 = 0, 255, 1 do
			if Engine.GetItemAllocationCost( f525_local32, f525_local29 ) >= 0 then
				f525_local41 = Engine.GetLoadoutSlotForItem( f525_local32, f525_local29 )
				local f525_local35 = Engine.GetItemGroup( f525_local32, f525_local29 )
				if f525_local41 == "primary" or f525_local41 == "secondary" or f525_local41 == "primarygadget" or f525_local41 == "secondarygadget" then
					f525_local16 = f525_local16 + 1
					if Engine.IsItemPurchased( f525_arg0, f525_local32, f525_local29 ) then
						f525_local15 = f525_local15 + 1
					end
				end
				if (f525_local35 == "cybercom_abilities" or f525_local35 == "cybercom_tacrig") and Engine.GetItemRef( f525_local32, f525_local29 ) ~= "cybercom_multicore_pro" then
					f525_local18 = f525_local18 + 1
					if Engine.IsItemPurchased( f525_arg0, f525_local32, f525_local29 ) then
						f525_local17 = f525_local17 + 1
					end
				end
			end
		end
		f525_local32 = Engine.GetChallengeInfoForImages( f525_arg0, nil, f525_local29 )
		if f525_local32 then
			for f525_local41, f525_local35 in ipairs( f525_local32 ) do
				if not f525_local35.isMastery then
					f525_local20 = f525_local20 + 1
					if not f525_local35.isLocked then
						f525_local19 = f525_local19 + 1
					end
				end
			end
		end
		f525_local22 = 12
		for f525_local33 = 0, f525_local22 - 1, 1 do
			if CoD.GetCombatRecordStatForPath( f525_local30, "PlayerCPDecorations." .. tostring( f525_local33 ) ) ~= 0 then
				f525_local21 = f525_local21 + 1
			end
		end
		f525_local24 = 3
		for f525_local33 = 1, f525_local24, 1 do
			if CoD.GetCombatRecordStatForPath( f525_local30, "trainingSimStats.ranksAchieved." .. tostring( f525_local33 ) ) ~= 0 then
				f525_local23 = f525_local23 + 1
			end
		end
		f525_local33 = 0
		if f525_local9 > 0 then
			f525_local33 = f525_local33 + LUI.clamp( f525_local9 / f525_local10, 0, 1 ) * f525_local1 + LUI.clamp( f525_local11 / f525_local12, 0, 1 ) * f525_local2 + LUI.clamp( f525_local13 / f525_local14, 0, 1 ) * f525_local3 + LUI.clamp( f525_local15 / f525_local16, 0, 1 ) * f525_local4 + LUI.clamp( f525_local17 / f525_local18, 0, 1 ) * f525_local5 + LUI.clamp( f525_local19 / f525_local20, 0, 1 ) * f525_local6 + LUI.clamp( f525_local21 / f525_local22, 0, 1 ) * f525_local7 + LUI.clamp( f525_local23 / f525_local24, 0, 1 ) * f525_local8
		end
		if f525_local33 > 99.99 then
			f525_local33 = f525_local33 + LUI.clamp( f525_local26 / f525_local27, 0, 1 ) * f525_local25
		end
		f525_local34 = "-"
		if f525_local33 == f525_local33 then
			f525_local34 = string.format( "%.1f%%", f525_local33 )
		end
		Engine.SetModelValue( Engine.CreateModel( f525_local0, "percent" ), f525_local34 )
		if not CoD.CombatRecordOtherPlayerStats then
			Engine.SetModelValue( Engine.CreateModel( f525_local0, "localPlayerPercent" ), f525_local34 )
		end
		return f525_local0
	end
}
DataSources.CombatRecordTotalWeaponAccuracy = {
	getModel = function ( f527_arg0 )
		local f527_local0 = Engine.CreateModel( Engine.GetModelForController( f527_arg0 ), "CombatRecordTotalWeaponAccuracy" )
		local f527_local1 = 0
		local f527_local2 = 0
		local f527_local3 = CoD.GetCombatRecordStats( f527_arg0 )
		for f527_local4 = 0, 255, 1 do
			if Engine.GetItemAllocationCost( f527_local4, CoD.GetCombatRecordMode() ) >= 0 then
				local f527_local7 = Engine.GetLoadoutSlotForItem( f527_local4, CoD.GetCombatRecordMode() )
				if f527_local7 == "primary" or f527_local7 == "secondary" or f527_local7 == "heroweapon" then
					f527_local1 = f527_local1 + CoD.GetCombatRecordStatForPath( f527_local3, "ItemStats." .. f527_local4 .. ".stats.shots" )
					f527_local2 = f527_local2 + CoD.GetCombatRecordStatForPath( f527_local3, "ItemStats." .. f527_local4 .. ".stats.hits" ) + 0.5 * CoD.GetCombatRecordStatForPath( f527_local3, "ItemStats." .. f527_local4 .. ".stats.headshots" )
				end
			end
		end
		local f527_local4 = 0
		if f527_local2 > 0 then
			f527_local4 = 100
		end
		if f527_local1 > 0 then
			f527_local4 = LUI.clamp( f527_local2 / f527_local1 * 100, 0, 100 )
		end
		if f527_local4 ~= f527_local4 then
			Engine.SetModelValue( Engine.CreateModel( f527_local0, "percent" ), "-" )
		else
			Engine.SetModelValue( Engine.CreateModel( f527_local0, "percent" ), string.format( "%.1f%%", f527_local4 ) )
		end
		return f527_local0
	end
}
DataSources.FavoriteSpecialist = {
	getModel = function ( f528_arg0 )
		local f528_local0 = Engine.CreateModel( Engine.GetModelForController( f528_arg0 ), "FavoriteSpecialist" )
		local f528_local1 = CoD.GetCombatRecordStats( f528_arg0 )
		local f528_local2 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		local f528_local3, f528_local4, f528_local5, f528_local6 = nil
		local f528_local7 = 0
		local f528_local8 = 0
		for f528_local16, f528_local17 in ipairs( f528_local2 ) do
			if f528_local17.disabled ~= true then
				local f528_local12 = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, f528_local16 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
				local f528_local13 = CoD.GetCombatRecordStatForPath( f528_local1, "ItemStats." .. f528_local12 .. ".stats.kills" )
				local f528_local14 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f528_local16 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
				local f528_local15 = CoD.GetCombatRecordStatForPath( f528_local1, "ItemStats." .. f528_local14 .. ".stats.combatRecordStat" )
				if f528_local16 == 10 then
					f528_local13 = CoD.GetCombatRecordStatForPath( f528_local1, "SpecialistStats.9.stats.kills_weapon" )
					f528_local15 = CoD.GetCombatRecordStatForPath( f528_local1, "SpecialistStats.9.stats.kills_ability" )
				end
				if f528_local7 < f528_local13 or f528_local7 < f528_local15 or f528_local3 == nil then
					if f528_local7 <= f528_local13 then
						f528_local7 = f528_local13
						f528_local8 = CoD.GetCombatRecordStatForPath( f528_local1, "ItemStats." .. f528_local12 .. ".stats.used" )
						f528_local4 = f528_local12
					else
						f528_local7 = f528_local15
						f528_local8 = CoD.GetCombatRecordStatForPath( f528_local1, "ItemStats." .. f528_local14 .. ".stats.used" )
						f528_local4 = f528_local14
					end
					f528_local3 = f528_local16 - 1
					f528_local5 = f528_local17.defaultHeroRender
					f528_local6 = f528_local17.displayName
				end
			end
		end
		f528_local9 = nil
		if f528_local8 == 0 then
			f528_local9 = string.format( "%.2f", 0 )
		else
			f528_local9 = string.format( "%.2f", math.floor( f528_local7 / f528_local8 * 100 + 0.5 ) / 100 )
		end
		Engine.SetModelValue( Engine.CreateModel( f528_local0, "displayString" ), Engine.Localize( "MENU_FAVORITE_SPECIALIST_STATS", Engine.Localize( f528_local6 ), Engine.Localize( Engine.GetItemName( f528_local4 ) ) ) )
		Engine.SetModelValue( Engine.CreateModel( f528_local0, "heroIndex" ), f528_local3 )
		Engine.SetModelValue( Engine.CreateModel( f528_local0, "heroImage" ), f528_local5 )
		Engine.SetModelValue( Engine.CreateModel( f528_local0, "heroName" ), Engine.Localize( f528_local6 ) )
		Engine.SetModelValue( Engine.CreateModel( f528_local0, "itemIndex" ), f528_local4 )
		Engine.SetModelValue( Engine.CreateModel( f528_local0, "killsPerUse" ), f528_local9 )
		Engine.SetModelValue( Engine.CreateModel( f528_local0, "numKills" ), f528_local7 )
		Engine.SetModelValue( Engine.CreateModel( f528_local0, "numUses" ), f528_local8 )
		return f528_local0
	end
}
DataSources.SubobjectivesList = {
	prepare = function ( f529_arg0, f529_arg1, f529_arg2 )
		f529_arg1.createWidgetFromDataSource = function ( f530_arg0, f530_arg1, f530_arg2 )
			return LUI.GridLayout.createWidgetFromDataSource( f530_arg0, f530_arg1, f530_arg2 )
		end
		
		f529_arg1.updateLayout = function ( f531_arg0, f531_arg1 )
			LUI.GridLayout.updateLayout( f531_arg0, f531_arg1 )
			f531_arg0:dispatchEventToParent( "child_size_updated" )
		end
		
	end,
	getCount = function ( f532_arg0 )
		if not f532_arg0.subobjectiveListModel then
			return 0
		else
			return DataSources.SubobjectivesList.getCountFromModel( f532_arg0.subobjectiveListModel )
		end
	end,
	getItem = function ( f533_arg0, f533_arg1, f533_arg2 )
		if not f533_arg1.subobjectiveListModel then
			return nil
		else
			return Engine.GetModel( f533_arg1.subobjectiveListModel, f533_arg2 )
		end
	end,
	getCountFromModel = function ( f534_arg0 )
		local f534_local0 = Engine.GetModel( f534_arg0, "count" )
		if f534_local0 then
			return Engine.GetModelValue( f534_local0 )
		else
			return 0
		end
	end,
	addSubObjective = function ( f535_arg0, f535_arg1, f535_arg2 )
		local f535_local0 = DataSources.SubobjectivesList.getCountFromModel( f535_arg0 ) + 1
		local f535_local1 = Engine.GetModel( f535_arg0, "count" )
		if f535_local1 then
			Engine.SetModelValue( f535_local1, f535_local0 )
		end
		local f535_local2 = Engine.CreateModel( f535_arg0, f535_local0 )
		Engine.SetModelValue( Engine.CreateModel( f535_local2, "text" ), f535_arg1 )
		Engine.SetModelValue( Engine.CreateModel( f535_local2, "status" ), f535_arg2 )
	end
}
DataSources.ObjectivesList = {
	prepare = function ( f536_arg0, f536_arg1, f536_arg2 )
		f536_arg1:registerEventHandler( "child_size_updated", function ( element, event )
			element:updateLayout( 0 )
			return true
		end )
		f536_arg1.createWidgetFromDataSource = function ( f538_arg0, f538_arg1, f538_arg2 )
			local f538_local0 = LUI.GridLayout.createWidgetFromDataSource( f538_arg0, f538_arg1, f538_arg2 )
			f538_local0.internal.subobjectivesList.subobjectiveListModel = Engine.GetModel( f538_arg2, "subobjectivesList" )
			f538_local0.internal.subobjectivesList:updateDataSource()
			return f538_local0
		end
		
		f536_arg1.updateLayout = function ( f539_arg0, f539_arg1 )
			LUI.GridLayout.updateLayout( f539_arg0, f539_arg1 )
			f539_arg0:dispatchEventToParent( "child_size_updated" )
		end
		
	end,
	getCount = function ( f540_arg0 )
		if not f540_arg0.objectiveListModel then
			return 0
		else
			return DataSources.ObjectivesList.getCountFromModel( f540_arg0.objectiveListModel )
		end
	end,
	getItem = function ( f541_arg0, f541_arg1, f541_arg2 )
		if not f541_arg1.objectiveListModel then
			return nil
		else
			return Engine.GetModel( f541_arg1.objectiveListModel, f541_arg2 )
		end
	end,
	getCountFromModel = function ( f542_arg0 )
		local f542_local0 = Engine.GetModel( f542_arg0, "count" )
		if f542_local0 then
			return Engine.GetModelValue( f542_local0 )
		else
			return 0
		end
	end,
	addObjective = function ( f543_arg0, f543_arg1, f543_arg2, f543_arg3 )
		local f543_local0 = DataSources.ObjectivesList.getCountFromModel( f543_arg0 ) + 1
		local f543_local1 = Engine.GetModel( f543_arg0, "count" )
		if f543_local1 then
			Engine.SetModelValue( f543_local1, f543_local0 )
		end
		local f543_local2 = Engine.CreateModel( f543_arg0, f543_local0 )
		Engine.SetModelValue( Engine.CreateModel( f543_local2, "displayText" ), Engine.Localize( f543_arg1 ) )
		Engine.SetModelValue( Engine.CreateModel( f543_local2, "status" ), f543_arg2 )
		local f543_local3 = Engine.CreateModel( f543_local2, "subobjectivesList" )
		Engine.SetModelValue( Engine.CreateModel( f543_local3, "count" ), 0 )
		for f543_local7, f543_local8 in ipairs( f543_arg3 ) do
			DataSources.SubobjectivesList.addSubObjective( f543_local3, Engine.Localize( f543_local8.desc ), f543_local8.status )
		end
	end
}
DataSources.CurrentObjectivesList = {
	prepare = function ( f544_arg0, f544_arg1, f544_arg2 )
		f544_arg1.objectiveOrder = {
			"active",
			"done"
		}
		f544_arg1.objectiveCategories = {}
		f544_arg1:registerEventHandler( "child_size_updated", function ( element, event )
			element:updateLayout( 0 )
			return true
		end )
		f544_arg1.createWidgetFromDataSource = function ( f546_arg0, f546_arg1, f546_arg2 )
			local f546_local0 = LUI.GridLayout.createWidgetFromDataSource( f546_arg0, f546_arg1, f546_arg2 )
			f546_local0.internal.objectivesList.objectiveListModel = Engine.GetModel( f546_arg2, "objectivesList" )
			f546_local0.internal.objectivesList:updateDataSource()
			return f546_local0
		end
		
		if CoD.isCampaign then
			local f544_local0 = Engine.GetPlayerObjectives( f544_arg0 )
			if f544_local0 == nil then
				return 
			end
			local f544_local1 = {}
			for f544_local7, f544_local8 in CoD.pairsByKeys( f544_local0 ) do
				if f544_local8.status ~= "invisible" and f544_local8.objective_desc ~= nil and f544_local8.objective_desc ~= "" then
					local f544_local5 = "done"
					if f544_local8.status == "current" or f544_local8.status == "active" or f544_local8.status == "failed" then
						f544_local5 = "active"
					end
					if not f544_local1[f544_local8.objective_desc] then
						f544_local1[f544_local8.objective_desc] = {
							desc = f544_local8.objective_desc,
							status = f544_local5,
							subobjectives = {}
						}
					end
					local f544_local6 = f544_local1[f544_local8.objective_desc]
					if f544_local8.subobjective_desc ~= "" then
						table.insert( f544_local6.subobjectives, {
							status = f544_local8.status,
							desc = f544_local8.subobjective_desc
						} )
					end
					if f544_local6.status == "done" and f544_local5 == "active" then
						f544_local6.status = "active"
					end
				end
			end
			f544_local2 = {}
			for f544_local8, f544_local5 in CoD.pairsByKeys( f544_local1 ) do
				if not f544_local2[f544_local5.status] then
					f544_local2[f544_local5.status] = {}
				end
				table.insert( f544_local2[f544_local5.status], f544_local5 )
			end
			f544_local3 = Engine.CreateModel( Engine.GetModelForController( f544_arg0 ), "CurrentObjectivesList" )
			for f544_local5, f544_local6 in CoD.pairsByKeys( f544_local2 ) do
				local f544_local12 = Engine.CreateModel( f544_local3, f544_local5 )
				Engine.SetModelValue( Engine.CreateModel( f544_local12, "status" ), f544_local5 )
				Engine.SetModelValue( Engine.CreateModel( f544_local12, "category" ), Engine.Localize( "MENU_" .. Engine.ToUpper( f544_local5 ) .. "_OBJECTIVES_CAPS" ) )
				local f544_local13 = Engine.CreateModel( f544_local12, "objectivesList" )
				Engine.SetModelValue( Engine.CreateModel( f544_local13, "count" ), 0 )
				for f544_local9, f544_local10 in ipairs( f544_local6 ) do
					DataSources.ObjectivesList.addObjective( f544_local13, f544_local10.desc, f544_local10.status, f544_local10.subobjectives )
				end
				f544_arg1.objectiveCategories[f544_local5] = f544_local12
			end
		else
			local f544_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f544_arg0 ), "GameObjectiveList" ), "gameMode" )
			local f544_local2 = Engine.DvarString( nil, "g_gametype" )
			local f544_local3 = Engine.Localize( "MPUI_" .. f544_local2 )
			local f544_local4 = Engine.TableLookup( f544_arg0, CoD.gametypesTable, 0, 0, 1, f544_local2, 3 )
			Engine.SetModelValue( Engine.CreateModel( f544_local1, "status" ), "active" )
			Engine.SetModelValue( Engine.CreateModel( f544_local1, "category" ), Engine.Localize( "GAME MODE" ) )
			local f544_local7 = Engine.CreateModel( f544_local1, "objectivesList" )
			Engine.SetModelValue( Engine.CreateModel( f544_local7, "count" ), 0 )
			DataSources.ObjectivesList.addObjective( f544_local7, f544_local3, "active", {
				{
					status = "description",
					desc = f544_local4
				}
			} )
			f544_arg1.objectiveCategories.active = f544_local1
		end
	end,
	getCount = function ( f547_arg0 )
		local f547_local0 = 0
		for f547_local4, f547_local5 in ipairs( f547_arg0.objectiveOrder ) do
			if f547_arg0.objectiveCategories[f547_local5] then
				f547_local0 = f547_local0 + 1
			end
		end
		return f547_local0
	end,
	getItem = function ( f548_arg0, f548_arg1, f548_arg2 )
		local f548_local0 = 0
		for f548_local4, f548_local5 in ipairs( f548_arg1.objectiveOrder ) do
			if f548_arg1.objectiveCategories[f548_local5] and f548_local0 + 1 == f548_arg2 then
				return f548_arg1.objectiveCategories[f548_local5]
			end
		end
		return nil
	end
}
DataSources.DeadOpsArcadeGlobal = {
	getModel = function ( f549_arg0 )
		local f549_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal" )
		Engine.CreateModel( f549_local0, "redins" )
		Engine.CreateModel( f549_local0, "countdown" )
		Engine.CreateModel( f549_local0, "gbanner" )
		Engine.CreateModel( f549_local0, "grgb1" )
		Engine.CreateModel( f549_local0, "grgb2" )
		Engine.CreateModel( f549_local0, "grgb3" )
		Engine.CreateModel( f549_local0, "gtxt0" )
		Engine.CreateModel( f549_local0, "gpr0" )
		Engine.CreateModel( f549_local0, "gpr1" )
		Engine.CreateModel( f549_local0, "gpr2" )
		Engine.CreateModel( f549_local0, "gpr3" )
		Engine.CreateModel( f549_local0, "level" )
		return f549_local0
	end
}
DataSources.DeadOpsArcadePlayers = {
	updateModelsForClient = function ( f550_arg0, f550_arg1 )
		local f550_local0 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadePlayers" ), "player" .. f550_arg1 + 1 )
		if f550_local0 ~= nil then
			local f550_local1 = Engine.GetPlayerListData( f550_arg0, f550_arg1 )
			if f550_local1.playerName ~= nil and f550_local1.playerConnected then
				Engine.SetModelValue( Engine.GetModel( f550_local0, "name" ), f550_local1.playerName )
			else
				Engine.SetModelValue( Engine.GetModel( f550_local0, "name" ), "" )
			end
		end
	end,
	getModel = function ( f551_arg0 )
		local f551_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadePlayers" )
		for f551_local1 = 1, 4, 1 do
			if Engine.GetModel( f551_local0, "player" .. f551_local1 ) == nil then
				local f551_local4 = Engine.CreateModel( f551_local0, "player" .. f551_local1 )
				Engine.CreateModel( f551_local4, "name" )
				Engine.CreateModel( f551_local4, "lives" )
				Engine.CreateModel( f551_local4, "bombs" )
				Engine.CreateModel( f551_local4, "boosts" )
				Engine.CreateModel( f551_local4, "score" )
				Engine.CreateModel( f551_local4, "multiplier" )
				Engine.CreateModel( f551_local4, "xbar" )
				Engine.CreateModel( f551_local4, "bulletbar" )
				Engine.CreateModel( f551_local4, "bulletbar_rgb" )
				Engine.CreateModel( f551_local4, "ribbon" )
				Engine.CreateModel( f551_local4, "gpr_rgb" )
				Engine.CreateModel( f551_local4, "generic_txt" )
				Engine.CreateModel( f551_local4, "gpr" )
				Engine.CreateModel( f551_local4, "gpr2" )
				Engine.CreateModel( f551_local4, "weaplevel1" )
				Engine.CreateModel( f551_local4, "weaplevel2" )
				Engine.CreateModel( f551_local4, "respawn" )
				DataSources.DeadOpsArcadePlayers.updateModelsForClient( f551_arg0, f551_local1 - 1 )
			end
		end
		return f551_local0
	end
}
DataSources.PlayerList = {
	modelLinks = {
		playerName = "playerName",
		score = "playerScore",
		rankIcon = "playerRankIcon",
		rankNum = "rankNum",
		clanAbbrev = "clanAbbrev",
		clientNum = "clientNum",
		playerConnected = "playerConnected"
	},
	prepare = function ( f552_arg0, f552_arg1, f552_arg2 )
		f552_arg1.playerListInfoList = {}
		f552_arg1.playerListInfoOrder = {}
		local f552_local0 = Engine.GetModelForController( f552_arg0 )
		local f552_local1 = Engine.CreateModel( f552_local0, "PlayerList" )
		local f552_local2 = 2
		local f552_local3 = Engine.GetClientNum( f552_arg0 )
		for f552_local4 = 0, Dvar.com_maxclients:get() - 1, 1 do
			local f552_local7 = Engine.GetPlayerListData( f552_arg0, f552_local4 )
			local f552_local8 = Engine.CreateModel( f552_local1, f552_local4 )
			for f552_local12, f552_local13 in pairs( DataSources.PlayerList.modelLinks ) do
				Engine.SetModelValue( Engine.CreateModel( f552_local8, f552_local13 ), f552_local7[f552_local12] )
			end
			Engine.SetModelValue( Engine.CreateModel( f552_local8, "objectiveIcon" ), "" )
			f552_arg1.playerListInfoList[f552_local4 + 1] = f552_local8
			if f552_local4 == Engine.GetClientNum( f552_arg0 ) then
				f552_arg1.playerListInfoOrder[1] = f552_local4 + 1
			else
				f552_arg1.playerListInfoOrder[f552_local2] = f552_local4 + 1
				f552_local2 = f552_local2 + 1
			end
		end
		local f552_local4 = function ( f553_arg0, f553_arg1 )
			DataSources.PlayerList.updateModelsForClient( f553_arg0, f552_arg1, f553_arg1 )
		end
		
		if not f552_arg1.playerConnectedSubscription then
			f552_arg1.playerConnectedSubscription = f552_arg1:subscribeToModel( Engine.GetModel( f552_local0, "playerConnected" ), function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue ~= nil then
					f552_local4( f552_arg0, modelValue )
				end
			end, false )
		end
		if not f552_arg1.playerDisconnectedSubscription then
			f552_arg1.playerDisconnectedSubscription = f552_arg1:subscribeToModel( Engine.GetModel( f552_local0, "playerDisconnected" ), function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue ~= nil then
					f552_local4( f552_arg0, modelValue )
				end
			end, false )
		end
		if not f552_arg1.hasScoreboardSubscriptions then
			f552_arg1.hasScoreboardSubscriptions = true
			for f552_local5 = 0, Dvar.com_maxclients:get() - 1, 1 do
				f552_arg1:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1." .. f552_local5 .. ".clientNum" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f552_local4( f552_arg0, modelValue )
					end
				end, false )
			end
		end
	end,
	updateModelsForClient = function ( f557_arg0, f557_arg1, f557_arg2 )
		local f557_local0 = DataSources.PlayerList.getModelForPlayer( f557_arg0, f557_arg1, f557_arg2 )
		if f557_local0 ~= nil then
			local f557_local1 = Engine.GetPlayerListData( f557_arg0, f557_arg2 )
			for f557_local5, f557_local6 in pairs( DataSources.PlayerList.modelLinks ) do
				local f557_local7 = Engine.GetModel( f557_local0, f557_local6 )
				if f557_local7 then
					Engine.SetModelValue( f557_local7, f557_local1[f557_local5] )
				end
			end
			f557_arg1:updateDataSource()
		end
	end,
	getCount = function ( f558_arg0 )
		local f558_local0 = 0
		for f558_local4, f558_local5 in pairs( f558_arg0.playerListInfoList ) do
			local f558_local6 = Engine.GetModel( f558_local5, "playerConnected" )
			if f558_local6 and Engine.GetModelValue( f558_local6 ) ~= 0 then
				f558_local0 = f558_local0 + 1
			end
		end
		if f558_local0 > 1 then
			return f558_local0
		else
			return 0
		end
	end,
	getItem = function ( f559_arg0, f559_arg1, f559_arg2 )
		local f559_local0 = 0
		for f559_local1 = 1, Dvar.com_maxclients:get(), 1 do
			local f559_local4 = f559_arg1.playerListInfoList[f559_arg1.playerListInfoOrder[f559_local1]]
			local f559_local5 = Engine.GetModel( f559_local4, "playerConnected" )
			if f559_local5 and Engine.GetModelValue( f559_local5 ) ~= 0 and f559_local0 + 1 == f559_arg2 then
				return f559_local4
			end
		end
		DebugPrint( "WARNING: returning invalid playerListInfoList row" )
		return f559_arg1.playerListInfoList[f559_arg1.playerListInfoOrder[0]]
	end,
	getModelForPlayer = function ( f560_arg0, f560_arg1, f560_arg2 )
		return f560_arg1.playerListInfoList[f560_arg2 + 1]
	end
}
DataSources.PlayerListZM = {
	modelLinks = {
		playerName = "playerName",
		score = "playerScore",
		scoreVisible = "playerScoreVisible",
		rankIcon = "playerRankIcon",
		rankNum = "rankNum",
		clanAbbrev = "clanAbbrev",
		clientNum = "clientNum",
		playerConnected = "playerConnected",
		zombiePlayerIcon = "zombiePlayerIcon",
		zombieInventoryIcon = "zombieInventoryIcon",
		zombieWearableIcon = "zombieWearableIcon",
		playerScoreShown = "playerScoreShown"
	},
	prepare = function ( f561_arg0, f561_arg1, f561_arg2 )
		f561_arg1.playerSlots = {}
		f561_arg1.playerListInfoList = {}
		local f561_local0 = Engine.GetModelForController( f561_arg0 )
		local f561_local1 = Engine.CreateModel( f561_local0, "PlayerList" )
		if f561_arg1.modelSubscriptions then
			for f561_local5, f561_local6 in pairs( f561_arg1.modelSubscriptions ) do
				f561_arg1:removeSubscription( f561_local6 )
			end
		end
		f561_arg1.modelSubscriptions = {}
		local f561_local2 = Engine.GetClientNum( f561_arg0 )
		local f561_local3 = function ( f562_arg0, f562_arg1 )
			if f562_arg0 == f562_arg1 then
				return 1
			elseif f562_arg0 < f562_arg1 then
				return 2 + f562_arg0
			else
				return 1 + f562_arg0
			end
		end
		
		local f561_local4 = function ( f563_arg0, f563_arg1, f563_arg2, f563_arg3 )
			local f563_local0 = Engine.GetModel( f563_arg0, "zmInventory.player" .. f563_arg1 .. f563_arg2 )
			if f563_local0 then
				f563_arg3[f563_arg2] = Engine.GetModelValue( f563_local0 )
				Engine.UnsubscribeAndFreeModel( f563_local0 )
				Engine.CreateModel( f563_arg0, "zmInventory.player" .. f563_arg1 .. f563_arg2 )
			end
		end
		
		for f561_local5 = 0, Dvar.com_maxclients:get() - 1, 1 do
			local f561_local8 = f561_local3( f561_local5, f561_local2 )
			local f561_local9 = Engine.GetPlayerListData( f561_arg0, f561_local5 )
			local f561_local10 = Engine.CreateModel( f561_local1, f561_local8 - 1 )
			for f561_local14, f561_local15 in pairs( DataSources.PlayerListZM.modelLinks ) do
				Engine.SetModelValue( Engine.CreateModel( f561_local10, f561_local15 ), f561_local9[f561_local14] )
			end
			f561_local4( f561_local0, f561_local5, "hasItem", f561_local9 )
			f561_local4( f561_local0, f561_local5, "wearableItem", f561_local9 )
			if f561_local9.playerConnected == 1 then
				if f561_local9.clientNum == f561_local2 then
					table.insert( f561_arg1.playerSlots, 1, f561_local9 )
				else
					table.insert( f561_arg1.playerSlots, f561_local9 )
				end
			end
			f561_arg1.playerListInfoList[f561_local8] = f561_local10
		end
		for f561_local16, f561_local8 in ipairs( f561_arg1.playerSlots ) do
			local f561_local9 = Engine.CreateModel( f561_local1, f561_local16 - 1 )
			for f561_local13, f561_local14 in pairs( DataSources.PlayerListZM.modelLinks ) do
				Engine.SetModelValue( Engine.CreateModel( f561_local9, f561_local14 ), f561_local8[f561_local13] )
			end
			if CoD.Zombie.InventoryIcon ~= nil then
				f561_local10 = Engine.CreateModel( f561_local0, "zmInventory.player" .. f561_local8.clientNum .. "hasItem" )
				Engine.SetModelValue( f561_local10, f561_arg1.playerSlots[f561_local16].hasItem or 0 )
				table.insert( f561_arg1.modelSubscriptions, f561_arg1:subscribeToModel( f561_local10, function ( f564_arg0 )
					local modelValue = Engine.GetModelValue( f564_arg0 )
					if modelValue == 0 then
						Engine.SetModelValue( Engine.CreateModel( f561_local9, "zombieInventoryIcon" ), "blacktransparent" )
					else
						Engine.SetModelValue( Engine.CreateModel( f561_local9, "zombieInventoryIcon" ), CoD.Zombie.InventoryIcon[modelValue] )
					end
				end ) )
			else
				Engine.SetModelValue( Engine.CreateModel( f561_local9, "zombieInventoryIcon" ), "blacktransparent" )
			end
			if CoD.Zombie.WearableItems ~= nil then
				f561_local10 = Engine.CreateModel( f561_local0, "zmInventory.player" .. f561_local8.clientNum .. "wearableItem" )
				Engine.SetModelValue( f561_local10, f561_arg1.playerSlots[f561_local16].wearableItem or 0 )
				f561_local11 = function ()
					local f565_local0 = Engine.GetModelValue( Engine.CreateModel( f561_local0, "zmInventory.player" .. f561_local8.clientNum .. "wearableItem" ) )
					local f565_local1 = Engine.GetModelValue( Engine.GetModel( f561_local9, "zombiePlayerIcon" ) )
					if not f565_local1 or f565_local0 == 0 then
						Engine.SetModelValue( Engine.CreateModel( f561_local9, "zombieWearableIcon" ), "blacktransparent" )
					else
						Engine.SetModelValue( Engine.CreateModel( f561_local9, "zombieWearableIcon" ), f565_local1 .. "_" .. CoD.Zombie.WearableItems[f565_local0] )
					end
				end
				
				table.insert( f561_arg1.modelSubscriptions, f561_arg1:subscribeToModel( f561_local10, f561_local11 ) )
				table.insert( f561_arg1.modelSubscriptions, f561_arg1:subscribeToModel( Engine.GetModel( f561_local9, "zombiePlayerIcon" ), f561_local11, false ) )
			else
				Engine.SetModelValue( Engine.CreateModel( f561_local9, "zombieWearableIcon" ), "blacktransparent" )
			end
			f561_arg1.playerListInfoList[f561_local16] = f561_local9
		end
		f561_local5 = function ( f566_arg0, f566_arg1 )
			DataSources.PlayerListZM.updateModelsForClient( f566_arg0, f561_arg1, f566_arg1 )
		end
		
		if not f561_arg1.playerConnectedSubscription then
			f561_arg1.playerConnectedSubscription = f561_arg1:subscribeToModel( Engine.GetModel( f561_local0, "playerConnected" ), function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue ~= nil then
					f561_local5( f561_arg0, modelValue )
				end
			end, false )
		end
		if not f561_arg1.playerDisconnectedSubscription then
			f561_arg1.playerDisconnectedSubscription = f561_arg1:subscribeToModel( Engine.GetModel( f561_local0, "playerDisconnected" ), function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue ~= nil then
					f561_local5( f561_arg0, modelValue )
				end
			end, false )
		end
		if IsDemoPlaying() and not f561_arg1.updatePlayerListOrderSubscription then
			f561_arg1.updatePlayerListOrderSubscription = f561_arg1:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "demo.clientNum" ), function ( model )
				if Engine.GetModelValue( model ) ~= nil then
					f561_local5( f561_arg0 )
				end
			end, false )
		end
	end,
	updateModelsForClient = function ( f570_arg0, f570_arg1, f570_arg2 )
		local f570_local0 = DataSources.PlayerListZM.getModelForPlayer( f570_arg0, f570_arg1, f570_arg2 )
		if f570_local0 ~= nil and f570_arg2 ~= nil then
			local f570_local1 = Engine.GetPlayerListData( f570_arg0, f570_arg2 )
			for f570_local5, f570_local6 in pairs( DataSources.PlayerListZM.modelLinks ) do
				local f570_local7 = Engine.GetModel( f570_local0, f570_local6 )
				if f570_local7 then
					Engine.SetModelValue( f570_local7, f570_local1[f570_local5] )
				end
			end
		end
		f570_arg1:updateDataSource()
	end,
	getCount = function ( f571_arg0 )
		local f571_local0 = 0
		for f571_local4, f571_local5 in pairs( f571_arg0.playerListInfoList ) do
			local f571_local6 = Engine.GetModel( f571_local5, "playerConnected" )
			if f571_local6 and Engine.GetModelValue( f571_local6 ) ~= 0 then
				f571_local0 = f571_local0 + 1
			end
		end
		return f571_local0
	end,
	getItem = function ( f572_arg0, f572_arg1, f572_arg2 )
		return f572_arg1.playerListInfoList[f572_arg2]
	end,
	getModelForPlayer = function ( f573_arg0, f573_arg1, f573_arg2 )
		for f573_local0 = 1, Dvar.com_maxclients:get(), 1 do
			local f573_local3 = f573_arg1.playerListInfoList[f573_local0]
			local f573_local4 = Engine.GetModel( f573_local3, "clientNum" )
			if f573_local4 and f573_local4 == f573_arg2 then
				return f573_local3
			end
		end
		DebugPrint( "WARNING: returning invalid playerListInfoList row" )
		return f573_arg1.playerListInfoList[1]
	end
}
DataSources.RaidsPurchases = {
	modelLinks = {
		cost = "cost",
		description = "description",
		displayName = "displayName",
		image = "image",
		name = "name"
	},
	prepare = function ( f574_arg0, f574_arg1, f574_arg2 )
		if DataSources.RaidsPurchases.Model == nil then
			DataSources.RaidsPurchases.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.RaidsPurchases" )
			DataSources.RaidsPurchases.Items = {}
			local f574_local0 = "gamedata/tables/cp/cp_sm_resources.csv"
			local f574_local1 = {
				scriptID = 0,
				cost = 1,
				title = 2,
				description = 3,
				icon = 4,
				active = 5
			}
			local f574_local2 = Engine.TableFindRows( f574_local0, f574_local1.active, "1" )
			if f574_local2 ~= nil then
				for f574_local3 = 1, #f574_local2, 1 do
					local f574_local6 = f574_local2[f574_local3]
					DataSources.RaidsPurchases.Items[f574_local3] = Engine.CreateModel( DataSources.RaidsPurchases.Model, "item" .. f574_local3 )
					local f574_local7 = Engine.TableGetColumnValueForRow( f574_local0, f574_local6, f574_local1.scriptID )
					local f574_local8 = Engine.TableGetColumnValueForRow( f574_local0, f574_local6, f574_local1.title )
					local f574_local9 = Engine.TableGetColumnValueForRow( f574_local0, f574_local6, f574_local1.description )
					local f574_local10 = Engine.TableGetColumnValueForRow( f574_local0, f574_local6, f574_local1.icon )
					local f574_local11 = Engine.TableGetColumnValueForRow( f574_local0, f574_local6, f574_local1.cost )
					Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f574_local3], "id" ), f574_local7 )
					Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f574_local3], "name" ), f574_local8 )
					Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f574_local3], "displayName" ), Engine.Localize( f574_local8 ) )
					Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f574_local3], "description" ), Engine.Localize( f574_local9 ) )
					Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f574_local3], "enabledDescription" ), f574_local9 )
					Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f574_local3], "image" ), f574_local10 )
					Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f574_local3], "cost" ), f574_local11 )
				end
			end
		end
	end,
	getCount = function ( f575_arg0 )
		return #DataSources.RaidsPurchases.Items
	end,
	getItem = function ( f576_arg0, f576_arg1, f576_arg2 )
		return DataSources.RaidsPurchases.Items[f576_arg2]
	end
}
DataSources.EmblemLayerList = {
	createGroup = function ( f577_arg0, f577_arg1, f577_arg2, f577_arg3, f577_arg4 )
		local f577_local0 = f577_arg1
		local f577_local1 = f577_arg1
		for f577_local2 = f577_arg1, f577_arg3 - 1, 1 do
			local f577_local5 = Engine.GetSelectedLayerData( f577_arg0, f577_local2, f577_arg4 )
			if f577_local5.groupIndex == f577_arg2 then
				f577_local1 = f577_local2
			end
		end
		return {
			groupStartLayer = f577_local0,
			groupEndLayer = f577_local1,
			isGrouped = true
		}
	end,
	createLayer = function ( f578_arg0 )
		return {
			groupStartLayer = f578_arg0,
			groupEndLayer = f578_arg0,
			isGrouped = false
		}
	end,
	prepare = function ( f579_arg0, f579_arg1, f579_arg2 )
		f579_arg1.emblemLayerListModel = Engine.CreateModel( Engine.GetModelForController( f579_arg0 ), "Emblem.EmblemLayerList" )
		local f579_local0 = CoD.GetCustomization( f579_arg0, "type" )
		f579_arg1.totalLayers = math.min( Engine.GetUsedLayerCount( f579_arg0, f579_local0, CoD.perController[f579_arg0].totalLayers ) + 1, CoD.perController[f579_arg0].totalLayers )
		f579_arg1.itemInfo = {}
		local f579_local1 = 0
		while f579_local1 < f579_arg1.totalLayers do
			local f579_local2 = Engine.GetSelectedLayerData( f579_arg0, f579_local1, f579_local0 )
			if f579_local2.isGrouped == true then
				local f579_local3 = DataSources.EmblemLayerList.createGroup( f579_arg0, f579_local1, f579_local2.groupIndex, f579_arg1.totalLayers, f579_local0 )
				table.insert( f579_arg1.itemInfo, f579_local3 )
				f579_local1 = f579_local3.groupEndLayer + 1
			else
				table.insert( f579_arg1.itemInfo, DataSources.EmblemLayerList.createLayer( f579_local1 ) )
				f579_local1 = f579_local1 + 1
			end
			if f579_local2.groupIndex == CoD.perController[f579_arg0].selectEmblemGroupIndex then
				f579_arg1.selectIndex = #f579_arg1.itemInfo
			end
		end
	end,
	getCount = function ( f580_arg0 )
		return #f580_arg0.itemInfo
	end,
	getItem = function ( f581_arg0, f581_arg1, f581_arg2 )
		local f581_local0 = nil
		local f581_local1 = f581_arg1.itemInfo[f581_arg2].groupStartLayer
		local f581_local2 = f581_arg1.itemInfo[f581_arg2].groupEndLayer - f581_arg1.itemInfo[f581_arg2].groupStartLayer + 1
		if f581_arg1.itemInfo[f581_arg2].isGrouped then
			f581_local0 = tostring( f581_arg1.itemInfo[f581_arg2].groupStartLayer + 1 ) .. "-" .. tostring( f581_arg1.itemInfo[f581_arg2].groupEndLayer + 1 )
		else
			f581_local0 = tostring( f581_local1 + 1 )
		end
		local f581_local3 = Engine.CreateModel( f581_arg1.emblemLayerListModel, "layer_" .. f581_local1 )
		Engine.SetModelValue( Engine.CreateModel( f581_local3, "layerIndex" ), f581_local1 )
		Engine.SetModelValue( Engine.CreateModel( f581_local3, "layerNumberString" ), f581_local0 )
		local f581_local4 = Engine.GetSelectedLayerData( f581_arg0, f581_local1, CoD.GetCustomization( f581_arg0, "type" ) )
		if f581_local4.iconID == CoD.emblem.INVALID_ID then
			Engine.SetModelValue( Engine.CreateModel( f581_local3, "layerName" ), Engine.Localize( "MENU_EMBLEM_ADD_DECAL" ) )
		else
			Engine.SetModelValue( Engine.CreateModel( f581_local3, "layerName" ), Engine.Localize( "MENU_EMBLEM_LAYER_NUMBER", f581_local1 + 1 ) )
		end
		Engine.SetModelValue( Engine.CreateModel( f581_local3, "isLinked" ), f581_local4.isLinked )
		Engine.SetModelValue( Engine.CreateModel( f581_local3, "isGrouped" ), f581_local4.isGrouped )
		Engine.SetModelValue( Engine.CreateModel( f581_local3, "groupIndex" ), f581_local4.groupIndex )
		Engine.SetModelValue( Engine.CreateModel( f581_local3, "layerAndGroupIndex" ), f581_local1 .. " " .. f581_local4.groupIndex )
		Engine.SetModelValue( Engine.CreateModel( f581_local3, "groupLayerCount" ), f581_local2 )
		return f581_local3
	end,
	getCustomPropertiesForItem = function ( f582_arg0, f582_arg1 )
		if f582_arg0.selectIndex == f582_arg1 then
			return {
				selectIndex = true
			}
		else
			
		end
	end,
	swapItemInfo = function ( f583_arg0, f583_arg1, f583_arg2, f583_arg3 )
		if f583_arg2 and f583_arg3 and f583_arg1 then
			f583_arg2:setModel( nil )
			f583_arg3:setModel( nil )
			local f583_local0 = f583_arg2.gridInfoTable.zeroBasedIndex + 1
			local f583_local1 = f583_arg3.gridInfoTable.zeroBasedIndex + 1
			local f583_local2 = f583_arg1.itemInfo[f583_local0]
			local f583_local3 = f583_arg1.itemInfo[f583_local1]
			local f583_local4 = f583_local2.groupEndLayer - f583_local2.groupStartLayer
			f583_local2.groupEndLayer = f583_local2.groupStartLayer + f583_local3.groupEndLayer - f583_local3.groupStartLayer
			f583_local3.groupStartLayer = f583_local2.groupEndLayer + 1
			f583_local3.groupEndLayer = f583_local3.groupStartLayer + f583_local4
			local f583_local5 = f583_local2.isGrouped
			f583_local2.isGrouped = f583_local3.isGrouped
			f583_local3.isGrouped = f583_local5
			f583_arg2:setModel( DataSources.EmblemLayerList.getItem( f583_arg0, f583_arg1, f583_local0 ) )
			f583_arg3:setModel( DataSources.EmblemLayerList.getItem( f583_arg0, f583_arg1, f583_local1 ) )
		end
	end
}
DataSources.EmblemIconList = {
	prepare = function ( f584_arg0, f584_arg1, f584_arg2 )
		f584_arg1.emblemIconList = {}
		local f584_local0 = CoD.emblem.DECALTABS[1].category
		if CoD.perController[f584_arg0].selectedDecalCategory ~= nil then
			f584_local0 = CoD.perController[f584_arg0].selectedDecalCategory
		end
		local f584_local1 = Engine.CreateModel( Engine.GetModelForController( f584_arg0 ), "Emblem.EmblemIconList" )
		f584_arg1.rootModel = f584_local1
		local f584_local2 = Engine.EmblemFilterCount( f584_arg0, 0, f584_local0 )
		for f584_local3 = 0, f584_local2 - 1, 1 do
			local f584_local6 = false
			local f584_local7 = Engine.CreateModel( f584_local1, "icon_" .. f584_local3 )
			local f584_local8 = Engine.EmblemFilterIconID( f584_arg0, 0, f584_local0, f584_local3 )
			Engine.SetModelValue( Engine.CreateModel( f584_local7, "iconID" ), f584_local8 )
			Engine.SetModelValue( Engine.CreateModel( f584_local7, "name" ), GetEmblemDecalDesc( f584_local8 ) )
			if f584_local0 == CoD.emblem.BlackMarketDecalCategory then
				local f584_local9 = CoD.BlackMarketUtility.IsItemLocked( f584_arg0, CoD.BlackMarketUtility.GetLootDecalName( f584_arg0, f584_local8 ) )
				if f584_local9 then
					if CoD.BlackMarketUtility.IsLootDecalHiddenIfClassified( f584_arg0, f584_local8 ) then
						f584_local6 = true
					end
					Engine.SetModelValue( Engine.GetModel( f584_local7, "name" ), CoD.BlackMarketUtility.ClassifiedName() )
				end
				Engine.SetModelValue( Engine.CreateModel( f584_local7, "isBMClassified" ), f584_local9 )
			else
				Engine.SetModelValue( Engine.CreateModel( f584_local7, "isBMClassified" ), false )
			end
			if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f584_local8 ) and not f584_local6 then
				table.insert( f584_arg1.emblemIconList, f584_local7 )
			end
		end
		table.sort( f584_arg1.emblemIconList, CoD.BlackMarketUtility.SortUnlocksModelIconID )
	end,
	getCount = function ( f585_arg0 )
		return #f585_arg0.emblemIconList
	end,
	getItem = function ( f586_arg0, f586_arg1, f586_arg2 )
		return f586_arg1.emblemIconList[f586_arg2]
	end,
	cleanup = function ( f587_arg0 )
		if f587_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f587_arg0.rootModel )
			f587_arg0.rootModel = nil
		end
	end
}
DataSources.EmblemMaterialList = {
	prepare = function ( f588_arg0, f588_arg1, f588_arg2 )
		f588_arg1.emblemMaterialList = {}
		local f588_local0 = CoD.emblem.MaterialCategory[1].category
		if CoD.perController[f588_arg0].selectedMaterialCategory ~= nil then
			f588_local0 = CoD.perController[f588_arg0].selectedMaterialCategory
		end
		local f588_local1 = Engine.CreateModel( Engine.GetModelForController( f588_arg0 ), "Emblem.EmblemMaterialList" )
		f588_arg1.rootModel = f588_local1
		local f588_local2 = Engine.GetEmblemMaterialFilterCount( f588_arg0, f588_local0 )
		for f588_local3 = 0, f588_local2 - 1, 1 do
			local f588_local6 = Engine.CreateModel( f588_local1, "emblemMaterial_" .. f588_local3 )
			local f588_local7 = Engine.GetEmblemMaterialIDByIndex( f588_arg0, f588_local0, f588_local3 )
			Engine.SetModelValue( Engine.CreateModel( f588_local6, "materialID" ), f588_local7 )
			local f588_local8 = Engine.GetEmblemMaterialName( f588_local7 )
			Engine.SetModelValue( Engine.CreateModel( f588_local6, "materialName" ), f588_local8 )
			local f588_local9 = false
			if f588_local0 == CoD.emblem.BlackMarketEmblemCategory then
				f588_local9 = CoD.BlackMarketUtility.IsItemLocked( f588_arg0, f588_local8 )
			end
			Engine.SetModelValue( Engine.CreateModel( f588_local6, "isBMClassified" ), f588_local9 )
			table.insert( f588_arg1.emblemMaterialList, f588_local6 )
		end
	end,
	getCount = function ( f589_arg0 )
		return #f589_arg0.emblemMaterialList
	end,
	getItem = function ( f590_arg0, f590_arg1, f590_arg2 )
		return f590_arg1.emblemMaterialList[f590_arg2]
	end,
	cleanup = function ( f591_arg0 )
		if f591_arg0.rootModel then
			Engine.UnsubscribeAndFreeModel( f591_arg0.rootModel )
			f591_arg0.rootModel = nil
		end
	end
}
DataSources.EmblemColorList = {
	prepare = function ( f592_arg0, f592_arg1, f592_arg2 )
		f592_arg1.emblemColorList = {}
		if not CoD.emblem.ColorList then
			CoD.emblem.ColorList = CoD.GetEmblemColorList( f592_arg0 )
		end
		f592_arg1.emblemColorList = CoD.emblem.ColorList
	end,
	getCount = function ( f593_arg0 )
		return #f593_arg0.emblemColorList
	end,
	getItem = function ( f594_arg0, f594_arg1, f594_arg2 )
		return f594_arg1.emblemColorList[f594_arg2]
	end
}
DataSources.EmblemSelectedLayerColor = {
	getModel = function ( f595_arg0 )
		local f595_local0 = Engine.GetSelectedLayerColor( f595_arg0 )
		local f595_local1 = Engine.CreateModel( Engine.GetModelForController( f595_arg0 ), "Emblem.EmblemSelectedLayerColor" )
		Engine.SetModelValue( Engine.CreateModel( f595_local1, "color" ), CoD.ConvertColor( f595_local0.red, f595_local0.green, f595_local0.blue ) )
		Engine.SetModelValue( Engine.CreateModel( f595_local1, "red" ), f595_local0.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
		Engine.SetModelValue( Engine.CreateModel( f595_local1, "green" ), f595_local0.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
		Engine.SetModelValue( Engine.CreateModel( f595_local1, "blue" ), f595_local0.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
		return f595_local1
	end
}
DataSources.EmblemSelectedLayerColor1 = {
	getModel = function ( f596_arg0 )
		local f596_local0 = Engine.GetSelectedLayerColor1( f596_arg0 )
		local f596_local1 = Engine.CreateModel( Engine.GetModelForController( f596_arg0 ), "Emblem.EmblemSelectedLayerColor1" )
		Engine.SetModelValue( Engine.CreateModel( f596_local1, "color" ), CoD.ConvertColor( f596_local0.red, f596_local0.green, f596_local0.blue ) )
		Engine.SetModelValue( Engine.CreateModel( f596_local1, "red" ), f596_local0.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
		Engine.SetModelValue( Engine.CreateModel( f596_local1, "green" ), f596_local0.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
		Engine.SetModelValue( Engine.CreateModel( f596_local1, "blue" ), f596_local0.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
		return f596_local1
	end
}
DataSources.EmblemSelectedLayerEdittingColor = {
	getModel = function ( f597_arg0 )
		local f597_local0 = CoD.GetEditorProperties( f597_arg0, "isGradientMode" )
		local f597_local1 = CoD.GetEditorProperties( f597_arg0, "colorNum" )
		if f597_local0 ~= nil and f597_local1 ~= nil and f597_local0 == 1 and f597_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			return DataSources.EmblemSelectedLayerColor1.getModel( f597_arg0 )
		else
			return DataSources.EmblemSelectedLayerColor.getModel( f597_arg0 )
		end
	end
}
DataSources.EmblemSelectedLayerNoColor = {
	getModel = function ( f598_arg0 )
		local f598_local0 = CoD.GetEditorProperties( f598_arg0, "isGradientMode" )
		local f598_local1 = CoD.GetEditorProperties( f598_arg0, "colorNum" )
		if f598_local0 ~= nil and f598_local1 ~= nil and f598_local0 == 1 and f598_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			return DataSources.EmblemSelectedLayerColor.getModel( f598_arg0 )
		else
			return DataSources.EmblemSelectedLayerColor1.getModel( f598_arg0 )
		end
	end
}
DataSources.EmblemSelectedLayerProperties = {
	getModel = function ( f599_arg0 )
		local f599_local0 = Engine.GetSelectedEmblemLayerProperties()
		local f599_local1 = Engine.CreateModel( Engine.GetModelForController( f599_arg0 ), "Emblem.EmblemSelectedLayerProperties" )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "xposition" ), f599_local0.xposition )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "yposition" ), f599_local0.yposition )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "xscale" ), f599_local0.xscale )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "yscale" ), f599_local0.yscale )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "rotation" ), f599_local0.rotation )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "opacity0" ), f599_local0.opacity0 )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "opacity1" ), f599_local0.opacity1 )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "gradient_angle" ), f599_local0.gradient_angle )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "gradient_type" ), f599_local0.gradient_type )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "gradient_fill" ), f599_local0.gradient_fill )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "material_angle" ), f599_local0.material_angle )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "material_xscale" ), f599_local0.material_xscale )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "material_yscale" ), f599_local0.material_yscale )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "max_opacity" ), math.max( f599_local0.opacity0, f599_local0.opacity1 ) )
		Engine.SetModelValue( Engine.CreateModel( f599_local1, "blend" ), f599_local0.blend )
		return f599_local1
	end
}
DataSources.EmblemProperties = {
	getModel = function ( f600_arg0 )
		local f600_local0 = Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID
		local f600_local1 = Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
		local f600_local2 = Engine.GetEmblemScaleMode( f600_arg0 )
		local f600_local3 = Engine.GetLayerMaterialScaleMode( f600_arg0 )
		local f600_local4 = CoD.perController[f600_arg0].totalLayers
		local f600_local5 = CoD.GetCustomization( f600_arg0, "type" )
		local f600_local6 = Engine.GetUsedLayerCount( f600_arg0, f600_local5, f600_local4 )
		local f600_local7 = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f600_local6, f600_local4 )
		local f600_local8 = Engine.GetLinkedLayerCount( f600_arg0, f600_local5 )
		local f600_local9 = CoD.perController[f600_arg0].totalGroups
		local f600_local10 = Engine.GetUsedGroupCount( f600_arg0, f600_local5, f600_local9 )
		local f600_local11 = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f600_local10, f600_local9 - 1 )
		local f600_local12 = Engine.GetModel( Engine.GetModelForController( f600_arg0 ), "Emblem.EmblemProperties" )
		if not f600_local12 then
			f600_local12 = Engine.CreateModel( Engine.GetModelForController( f600_arg0 ), "Emblem.EmblemProperties" )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "layersUsed" ), f600_local6 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "colorMode" ), f600_local0 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "scaleMode" ), f600_local2 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "materialScaleMode" ), f600_local3 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "layersUsedFraction" ), f600_local7 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "groupsUsed" ), f600_local10 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "groupsUsedFraction" ), f600_local11 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "isClipboardEmpty" ), CoD.emblem.CLIPBOARDSTATE.EMPTY )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "addDecalMode" ), CoD.emblem.ADDDECAL.REPLACE )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "isGradientMode" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "colorNum" ), Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "isColor0NoColor" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "isColor1NoColor" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "linkedLayerCount" ), f600_local8 )
			Engine.SetModelValue( Engine.CreateModel( f600_local12, "selectedDecalID" ), 0 )
		end
		return f600_local12
	end
}
DataSources.Customization = {
	getModel = function ( f601_arg0 )
		local f601_local0 = Engine.GetModel( Engine.GetModelForController( f601_arg0 ), "Customization" )
		if not f601_local0 then
			f601_local0 = Engine.CreateModel( Engine.GetModelForController( f601_arg0 ), "Customization" )
			Engine.SetModelValue( Engine.CreateModel( f601_local0, "weapon_index" ), 20 )
			Engine.SetModelValue( Engine.CreateModel( f601_local0, "type" ), Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM )
		end
		return f601_local0
	end
}
DataSources.StoreCategoryList = ListHelper_SetupDataSource( "Store.CategoryList", function ( f602_arg0 )
	local f602_local0 = {}
	local f602_local1 = Engine.GetStoreCategories()
	for f602_local2 = 1, #f602_local1, 1 do
		local f602_local5 = f602_local1[f602_local2]
		if f602_local5.category == "STRONGHOLD" and not ShouldShowStrongholdCategory( f602_arg0 ) then
			f602_local5.visibility = false
		end
		if f602_local5.category == "BO4" and Dvar.store_hideB04:exists() and Dvar.store_hideB04:get() == "1" then
			f602_local5.visibility = false
		end
		if f602_local5.category == "OUTFITS" and Dvar.store_hideOutfits:exists() and Dvar.store_hideOutfits:get() == "1" then
			f602_local5.visibility = false
		end
		if f602_local5.visibility then
			local f602_local6 = "CoD.Store_NonFeaturedFrame"
			if f602_local5.category == "FEATURED" then
				f602_local6 = "CoD.Store_FeaturedFrame"
			end
			local f602_local7 = false
			if f602_local5.category == "CODE" then
				local f602_local8 = Engine.GetModel( Engine.GetModelForController( f602_arg0 ), "StoreRoot.actionSource" )
				if f602_local8 and Engine.GetModelValue( f602_local8 ) == "BlackMarket" then
					f602_local7 = true
				end
			end
			if not (not Dvar.tu4_enableCodPoints:exists() or Dvar.tu4_enableCodPoints:get() ~= true) or f602_local5.category ~= "FEATURED" and f602_local5.category ~= "CODPOINTS" and f602_local5.category ~= "OUTFITS" and f602_local5.category ~= "EXTRAPACKS" and f602_local5.category ~= "DIGITAL_INCENTIVE" then
				table.insert( f602_local0, {
					models = {
						category = f602_local5.category,
						category_loc_ref = f602_local5.category_loc_ref,
						category_visibility = f602_local5.visibility,
						frameWidget = f602_local6,
						imageName = f602_local5.imageName
					},
					properties = {
						selectIndex = f602_local7
					}
				} )
			end
		end
	end
	return f602_local0
end )
DataSources.StoreProductList = ListHelper_SetupDataSource( "Store.ProductList", function ( f603_arg0 )
	local f603_local0 = {}
	local f603_local1 = CoD.perController[f603_arg0].selectedStoreCategory
	if f603_local1 then
		local f603_local2 = Engine.GetStoreProductsByCategory( f603_arg0, f603_local1 )
		if f603_local1 == "EXTRASLOTS" or f603_local1 == "ESPORTS" or f603_local1 == "OUTFITS" or f603_local1 == "EXTRAPACKS" then
			CoD.StoreUtility.GetDWItemsByCategory( f603_arg0, f603_local1, f603_local0 )
		else
			for f603_local3 = 1, #f603_local2, 1 do
				local f603_local6 = f603_local2[f603_local3]
				if (f603_local6.productID == "BO3SP00000000000" or f603_local6.productID == "1cc09968-536c-445b-aa4c-cbc8da96ac99") and ShouldDisplayDiscountedSeasonPass( nil, f603_arg0 ) then
					f603_local6.productImage = "t7_crm_mp_motd_seasonpass_upgrade_01"
					f603_local6.previewImage = "t7_crm_mp_motd_seasonpass_upgrade_02"
				end
				if CoD.StoreUtility.HideProductPriceAndPurchaseStatus( f603_local6.metadata ) then
					f603_local6.price = ""
					f603_local6.purchasestatus = Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED
				end
				local f603_local7 = "CoD.StorePreviewImageWidget"
				if Dvar.store_activateCPSale:exists() and Dvar.store_activateCPSale:get() == "1" and CoD.StoreUtility.IsCodPointSalePackage( f603_local6.metadata ) then
					f603_local6.productImage = f603_local6.productImage .. "_sale"
					f603_local6.previewImage = f603_local6.previewImage .. "_sale"
				end
				if Dvar.store_imageBestValue:exists() and Dvar.store_imageBestValue:get() == "1" and string.find( f603_local6.productImage, "13000" ) then
					f603_local6.productImage = f603_local6.productImage .. "_best_value"
					f603_local6.previewImage = f603_local6.previewImage .. "_best_value"
				end
				if Dvar.store_imageMostPopular:exists() and Dvar.store_imageMostPopular:get() == "1" and string.find( f603_local6.productImage, "2400" ) then
					f603_local6.productImage = f603_local6.productImage .. "_most_popular"
					f603_local6.previewImage = f603_local6.previewImage .. "_most_popular"
				end
				if Dvar.store_showBonusImage:exists() and Dvar.store_showBonusImage:get() == "1" and string.find( f603_local6.productImage, "codpoints" ) and not string.find( f603_local6.productImage, "200" ) then
					f603_local6.productImage = f603_local6.productImage .. "_bonus"
					f603_local6.previewImage = f603_local6.previewImage .. "_bonus"
				end
				if Dvar.store_highlightSpecial:exists() and Dvar.store_highlightSpecial:get() == "1" and string.find( f603_local6.productImage, "2400" ) then
					table.insert( f603_local0, 1, {
						models = {
							name = f603_local6.name,
							price = f603_local6.price,
							desc = f603_local6.desc,
							productID = f603_local6.productID,
							skuID = f603_local6.skuID,
							previewImage = f603_local6.previewImage,
							productImage = f603_local6.productImage,
							metadata = f603_local6.metadata,
							videoHighResRef = f603_local6.videoHighResRef,
							videoLowResRef = f603_local6.videoLowResRef,
							frameWidget = f603_local7,
							purchasestatus = f603_local6.purchasestatus,
							serviceLabel = f603_local6.serviceLabel
						}
					} )
				else
					table.insert( f603_local0, {
						models = {
							name = f603_local6.name,
							price = f603_local6.price,
							desc = f603_local6.desc,
							productID = f603_local6.productID,
							skuID = f603_local6.skuID,
							previewImage = f603_local6.previewImage,
							productImage = f603_local6.productImage,
							metadata = f603_local6.metadata,
							videoHighResRef = f603_local6.videoHighResRef,
							videoLowResRef = f603_local6.videoLowResRef,
							frameWidget = f603_local7,
							purchasestatus = f603_local6.purchasestatus,
							serviceLabel = f603_local6.serviceLabel
						}
					} )
				end
			end
		end
	end
	return f603_local0
end )
DataSources.StoreFeaturedProductList = {
	getModel = function ( f604_arg0 )
		local f604_local0 = Engine.CreateModel( Engine.GetModelForController( f604_arg0 ), "Store.StoreFeaturedProductList" )
		local f604_local1 = CoD.StoreFeaturedCategory
		local f604_local2 = {}
		local f604_local3 = {}
		local f604_local4 = {}
		f604_local2 = Engine.GetStoreProductsByCategory( f604_arg0, f604_local1 )
		if f604_local1 then
			for f604_local5 = 1, #f604_local2, 1 do
				local f604_local8 = f604_local2[f604_local5]
				if not Engine.HasEntitlementByOwnership( f604_arg0, "seasonpass" ) or f604_local8.metadata ~= "mappacks" then
					if f604_local8.purchasestatus == Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED and (f604_local8.metadata == "featured_first_3" or f604_local8.metadata == "seasonpass" or f604_local8.metadata == "mappacks") then
						table.insert( f604_local3, f604_local8 )
					end
					if f604_local8.purchasestatus == Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED and f604_local8.metadata == "featured_last_3" then
						table.insert( f604_local4, f604_local8 )
					end
				end
			end
		end
		if #f604_local3 > 2 and f604_local3[1].previewImage == "t7_store_stronghold_dde_preview" then
			local f604_local5 = f604_local3[2]
			f604_local3[2] = f604_local3[1]
			f604_local3[1] = f604_local5
		end
		local f604_local5 = function ( f605_arg0 )
			if 1 <= f605_arg0 and f605_arg0 <= 3 then
				return f604_local3[f605_arg0]
			elseif f605_arg0 >= 4 and f605_arg0 <= 6 then
				return f604_local4[f605_arg0 - 3]
			else
				return nil
			end
		end
		
		for f604_local6 = 1, 6, 1 do
			local f604_local10 = f604_local5( f604_local6 )
			if not f604_local10 then
				f604_local10 = {
					name = "",
					price = "",
					desc = "",
					productID = "",
					skuID = "",
					previewImage = "",
					productImage = "",
					metadata = "",
					purchasestatus = 0,
					serviceLabel = 0
				}
			end
			if (f604_local10.productID == "BO3SP00000000000" or f604_local10.productID == "1cc09968-536c-445b-aa4c-cbc8da96ac99") and ShouldDisplayDiscountedSeasonPass( nil, f604_arg0 ) then
				f604_local10.productImage = "t7_crm_mp_motd_seasonpass_upgrade_01"
				f604_local10.previewImage = "t7_crm_mp_motd_seasonpass_upgrade_02"
			end
			if CoD.StoreUtility.HideProductPriceAndPurchaseStatus( f604_local10.metadata ) then
				f604_local10.price = ""
				f604_local10.purchasestatus = Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED
			end
			if Dvar.store_activateCPSale:exists() and Dvar.store_activateCPSale:get() == "1" and CoD.StoreUtility.IsCodPointSalePackage( f604_local10.metadata ) then
				f604_local10.productImage = f604_local10.productImage .. "_sale"
				f604_local10.previewImage = f604_local10.previewImage .. "_sale"
			end
			if Dvar.store_showBonusImage:exists() and Dvar.store_showBonusImage:get() == "1" and string.find( f604_local10.productImage, "codpoints" ) and not string.find( f604_local10.productImage, "200" ) then
				f604_local10.productImage = f604_local10.productImage .. "_bonus"
				f604_local10.previewImage = f604_local10.previewImage .. "_bonus"
			end
			if Dvar.store_imageMostPopular:exists() and Dvar.store_imageMostPopular:get() == "1" and string.find( f604_local10.productImage, "2400" ) then
				f604_local10.productImage = f604_local10.productImage .. "_most_popular"
				f604_local10.previewImage = f604_local10.previewImage .. "_most_popular"
			end
			local f604_local11 = Engine.CreateModel( f604_local0, "button" .. f604_local6 )
			local f604_local12
			if f604_local6 == 1 then
				f604_local12 = "CoD.StoreFeaturePreviewImageWidget"
				if not f604_local12 then
				
				else
					ListHelper_CreateModelsFromTable( f604_local11, {
						name = f604_local10.name,
						price = f604_local10.price,
						desc = f604_local10.desc,
						productID = f604_local10.productID,
						skuID = f604_local10.skuID,
						previewImage = f604_local10.previewImage,
						productImage = f604_local10.productImage,
						metadata = f604_local10.metadata,
						videoHighResRef = f604_local10.videoHighResRef,
						videoLowResRef = f604_local10.videoLowResRef,
						videoHighResRef = f604_local10.videoHighResRef,
						videoLowResRef = f604_local10.videoLowResRef,
						frameWidget = f604_local12,
						purchasestatus = f604_local10.purchasestatus,
						serviceLabel = f604_local10.serviceLabel
					} )
				end
			end
			f604_local12 = "CoD.StoreVideoProductButtonImageWidget"
		end
		return f604_local0
	end
}
DataSources.StoreRoot = {
	getModel = function ( f606_arg0 )
		return Engine.GetModel( Engine.GetModelForController( f606_arg0 ), "StoreRoot" )
	end
}
DataSources.ChooseClassClients = ListHelper_SetupDataSource( "ChooseClassClients", function ( f607_arg0 )
	local f607_local0 = {}
	local f607_local1 = 1
	local f607_local2 = Engine.GetModel( Engine.GetModelForController( f607_arg0 ), "ChooseClassCPClientMenu" )
	if f607_local2 then
		local f607_local3 = Engine.GetModel( f607_local2, "numActiveClients" )
		if f607_local3 then
			f607_local1 = Engine.GetModelValue( f607_local3 )
		end
	end
	for f607_local3 = 1, f607_local1, 1 do
		table.insert( f607_local0, {
			models = {
				clientIndex = f607_local3
			}
		} )
	end
	return f607_local0
end )
DataSources.ChooseClassList = {
	prepare = function ( f608_arg0, f608_arg1, f608_arg2 )
		f608_arg1.customClassList = {}
		local f608_local0 = Engine.GetCustomClassCount( f608_arg0 )
		local f608_local1 = Engine.CreateModel( Engine.GetModelForController( f608_arg0 ), "CustomClassList" )
		for f608_local2 = 1, f608_local0, 1 do
			local f608_local5 = f608_local2 - 1
			f608_arg1.customClassList[f608_local2] = {}
			f608_arg1.customClassList[f608_local2].models = Engine.CreateModel( f608_local1, "class" .. f608_local2 )
			CoD.CACUtility.GetCustomClassModel( f608_arg0, f608_local5, f608_arg1.customClassList[f608_local2].models )
			f608_arg1.customClassList[f608_local2].properties = {
				classNum = f608_local2 - 1
			}
		end
	end,
	getCount = function ( f609_arg0 )
		return #f609_arg0.customClassList
	end,
	getItem = function ( f610_arg0, f610_arg1, f610_arg2 )
		return f610_arg1.customClassList[f610_arg2].models
	end,
	getCustomPropertiesForItem = function ( f611_arg0, f611_arg1 )
		return f611_arg0.customClassList[f611_arg1].properties
	end
}
DataSources.ChooseClass_InGame = {
	prepareModelForIndex = function ( f612_arg0, f612_arg1, f612_arg2, f612_arg3 )
		local f612_local0 = nil
		if CanUseSharedLoadouts( f612_arg3 ) then
			local f612_local1 = Engine.GetModel( Engine.GetModelForController( f612_arg3 ), "ChooseClassCPClientMenu" )
			if f612_local1 then
				local f612_local2 = Engine.GetModel( f612_local1, "selectedClientIndex" )
				if f612_local2 then
					local f612_local3 = Engine.GetModel( f612_local1, "client" .. Engine.GetModelValue( f612_local2 ) )
					if f612_local3 then
						f612_local0 = Engine.GetModelValue( Engine.GetModel( f612_local3, "xuid" ) )
					end
				end
			end
		end
		local f612_local1 = Engine.CreateModel( f612_arg0, "class" .. f612_arg1 )
		CoD.CACUtility.GetCustomClassModel( f612_arg3, f612_arg2, f612_local1, f612_local0 )
		return f612_local1
	end,
	prepare = function ( f613_arg0, f613_arg1, f613_arg2 )
		local f613_local0 = CoD.GetTeamID( f613_arg0 )
		local f613_local1 = Engine.GetModel( Engine.GetModelForController( f613_arg0 ), "CustomClassList.prepared" )
		if not f613_local1 then
			f613_local1 = Engine.CreateModel( Engine.GetModelForController( f613_arg0 ), "CustomClassList.prepared" )
			Engine.SetModelValue( f613_local1, -1 )
		end
		local f613_local2 = Engine.GetModelValue( f613_local1 )
		local f613_local3 = false
		local f613_local4 = -1
		local f613_local5 = Engine.GetModel( Engine.GetModelForController( f613_arg0 ), "classSetValue" )
		if f613_local5 then
			f613_local4 = Engine.GetModelValue( f613_local5 )
			if f613_local4 ~= CoD.PrestigeUtility.ChooseClassSets.Default and f613_local4 ~= CoD.PrestigeUtility.ChooseClassSets.Custom then
				f613_local3 = false
			else
				f613_local3 = true
			end
		end
		f613_arg1.customClassCount = Engine.GetCustomClassCount( f613_arg0 )
		local f613_local6 = math.min( math.max( 10 - f613_arg1.customClassCount, 0 ), 5 )
		if f613_local2 ~= f613_local0 or f613_local3 then
			Engine.SetModelValue( f613_local1, f613_local0 )
			CoD.CACUtility.classModels[f613_arg0] = {}
			local f613_local7 = Engine.CreateModel( Engine.GetModelForController( f613_arg0 ), "CustomClassList" )
			f613_arg1.classModels = {}
			if CustomClassesEnabled() and (not f613_local3 or f613_local3 and f613_local4 == CoD.PrestigeUtility.ChooseClassSets.Custom) then
				for f613_local8 = 1, f613_arg1.customClassCount, 1 do
					table.insert( f613_arg1.classModels, {
						models = DataSources.ChooseClass_InGame.prepareModelForIndex( f613_local7, f613_local8, f613_local8 - 1, f613_arg0 ),
						properties = {
							classNum = f613_local8 - 1
						}
					} )
				end
			end
			if IsMultiplayer() then
				if not f613_local3 then
					local f613_local8 = 11
					for f613_local9 = f613_local8, f613_local8 + f613_local6 - 1, 1 do
						table.insert( f613_arg1.classModels, {
							models = DataSources.ChooseClass_InGame.prepareModelForIndex( f613_local7, f613_local9, f613_local9 - 1, f613_arg0 ),
							properties = {
								classNum = f613_local9 - 1
							}
						} )
					end
				elseif f613_local3 and f613_local4 == CoD.PrestigeUtility.ChooseClassSets.Default then
					local f613_local8 = 11
					f613_local6 = 5
					for f613_local9 = f613_local8, f613_local8 + f613_local6 - 1, 1 do
						table.insert( f613_arg1.classModels, {
							models = DataSources.ChooseClass_InGame.prepareModelForIndex( f613_local7, f613_local9, f613_local9 - 1, f613_arg0 ),
							properties = {
								classNum = f613_local9 - 1
							}
						} )
					end
				end
			end
			if IsCampaign() then
				local f613_local8 = CoD.perController[f613_arg0].fieldOpsKitClassNum
				if f613_local8 ~= nil then
					table.insert( f613_arg1.classModels, {
						models = DataSources.ChooseClass_InGame.prepareModelForIndex( f613_local7, f613_arg1.customClassCount + 1, f613_local8 - 1, f613_arg0 ),
						properties = {
							classNum = f613_local8 - 1
						}
					} )
				end
			end
			CoD.CACUtility.classModels[f613_arg0] = f613_arg1.classModels
		elseif CoD.CACUtility.classModels[f613_arg0] then
			f613_arg1.classModels = CoD.CACUtility.classModels[f613_arg0]
			if IsCampaign() then
				local f613_local7 = Engine.GetModel( Engine.GetModelForController( f613_arg0 ), "CustomClassList" )
				local f613_local8 = CoD.perController[f613_arg0].fieldOpsKitClassNum
				if f613_local8 ~= nil then
					if f613_arg1.customClassCount + 1 <= #f613_arg1.classModels then
						f613_arg1.classModels[f613_arg1.customClassCount + 1].models = DataSources.ChooseClass_InGame.prepareModelForIndex( f613_local7, f613_arg1.customClassCount + 1, f613_local8 - 1, f613_arg0 )
						f613_arg1.classModels[f613_arg1.customClassCount + 1].properties.classNum = f613_local8 - 1
					else
						table.insert( f613_arg1.classModels, {
							models = DataSources.ChooseClass_InGame.prepareModelForIndex( f613_local7, f613_arg1.customClassCount + 1, f613_local8 - 1, f613_arg0 ),
							properties = {
								classNum = f613_local8 - 1
							}
						} )
					end
				end
			end
		end
	end,
	getCount = function ( f614_arg0 )
		if f614_arg0.classModels then
			return #f614_arg0.classModels
		else
			return 0
		end
	end,
	getItem = function ( f615_arg0, f615_arg1, f615_arg2 )
		if f615_arg1.classModels then
			return f615_arg1.classModels[f615_arg2].models
		else
			
		end
	end,
	getCustomPropertiesForItem = function ( f616_arg0, f616_arg1 )
		return f616_arg0.classModels[f616_arg1].properties
	end,
	getSpacerAfterRow = function ( f617_arg0, f617_arg1, f617_arg2 )
		if f617_arg1 == f617_arg0.customClassCount then
			return 20
		else
			return 0
		end
	end
}
DataSources.CustomClassMenu = {
	getModel = function ( f618_arg0 )
		local f618_local0 = CoD.perController[f618_arg0].classModel
		local f618_local1 = Engine.GetModelValue( Engine.GetModel( f618_local0, "customClassName" ) )
		local f618_local2 = -1
		local f618_local3 = ""
		if IsClassSetsAvailableForCurrentGameMode() then
			f618_local3 = Engine.GetClassSetName( f618_arg0, Engine.GetCurrentClassSetIndex( f618_arg0 ) )
		end
		local f618_local4 = Engine.CreateModel( Engine.GetModelForController( f618_arg0 ), "CustomClassMenu" )
		Engine.SetModelValue( Engine.CreateModel( f618_local4, "currentClassName" ), f618_local1 )
		Engine.SetModelValue( Engine.CreateModel( f618_local4, "currentClassSetName" ), f618_local3 )
		Engine.SetModelValue( Engine.CreateModel( f618_local0, "customClassOptionsHintText" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f618_local0, "customClassSetName" ), f618_local3 )
		return f618_local0
	end,
	updateCustomSlotModel = function ( f619_arg0, f619_arg1, f619_arg2 )
		local f619_local0 = Engine.GetModel( f619_arg0, f619_arg1 )
		if f619_local0 == nil then
			return 
		elseif Engine.GetModelValue( Engine.GetModel( f619_local0, "itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
			local f619_local1 = f619_arg1 .. "attachment1"
			local f619_local2 = Engine.GetModel( f619_arg0, f619_local1 )
			if f619_local2 and Engine.GetModelValue( Engine.GetModel( f619_local2, "itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
				Engine.SetModelValue( Engine.CreateModel( f619_local2, "name" ), Engine.GetModelValue( Engine.GetModel( f619_local0, "name" ) ) )
				Engine.SetModelValue( Engine.CreateModel( f619_local2, "image" ), Engine.GetModelValue( Engine.GetModel( f619_local0, "image" ) ) )
				Engine.SetModelValue( Engine.CreateModel( f619_local2, "desc" ), Engine.GetModelValue( Engine.GetModel( f619_local0, "desc" ) ) )
				Engine.SetModelValue( Engine.CreateModel( f619_local2, "itemIndex" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( f619_local2, "weaponSlot" ), f619_local1 )
			end
		end
	end,
	updateWeaponAttachmentList = function ( f620_arg0, f620_arg1, f620_arg2, f620_arg3 )
		local f620_local0 = Engine.GetModel( f620_arg1, f620_arg2 )
		if not f620_local0 then
			return 
		end
		local f620_local1 = function ( f621_arg0, f621_arg1, f621_arg2, f621_arg3, f621_arg4 )
			local f621_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
			local f621_local1 = Engine.CreateModel( f621_arg0, "cust" .. f620_arg2 .. "weaponattachment" .. f621_arg1 )
			Engine.SetModelValue( Engine.CreateModel( f621_local1, "name" ), Engine.GetAttachmentName( f621_arg3, f621_arg4, f621_local0 ) )
			Engine.SetModelValue( Engine.CreateModel( f621_local1, "image" ), Engine.GetAttachmentImageByWeaponAndAttachIndex( f621_arg3, f621_arg4, f621_local0 ) )
			Engine.SetModelValue( Engine.CreateModel( f621_local1, "weaponSlot" ), f620_arg2 .. "attachment" .. f621_arg2 )
			Engine.SetModelValue( Engine.CreateModel( f621_local1, "ref" ), Engine.GetAttachmentRef( f621_arg3, f621_arg4, f621_local0 ) )
		end
		
		if f620_arg2 == "primary" or f620_arg2 == "secondary" then
			local f620_local2 = Engine.GetModel( f620_local0, "itemIndex" )
			if f620_local2 then
				for f620_local3 = 1, f620_arg3, 1 do
					local f620_local6 = Engine.GetModel( f620_local0, "cust" .. f620_arg2 .. "weaponattachment" .. f620_local3 )
					if f620_local6 then
						Engine.UnsubscribeAndFreeModel( f620_local6 )
					end
				end
				local f620_local3 = Engine.GetModelValue( f620_local2 )
				if f620_local3 > CoD.CACUtility.EmptyItemIndex then
					local f620_local4 = 1
					local f620_local5 = CoD.CACUtility.GetAttachmentListForSlot( f620_arg2 )
					for f620_local9, f620_local10 in ipairs( f620_local5 ) do
						local f620_local11 = CoD.CACUtility.GetItemEquippedInSlot( f620_local10, f620_arg0, f620_arg1 )
						if f620_local11 > CoD.CACUtility.EmptyItemIndex then
							f620_local1( f620_local0, f620_local4, f620_local9, f620_local3, f620_local11 )
							f620_local4 = f620_local4 + 1
						end
					end
					for f620_local7 = f620_local4, #f620_local5, 1 do
						local f620_local11 = Engine.CreateModel( f620_local0, "cust" .. f620_arg2 .. "weaponattachment" .. f620_local7 )
					end
				end
			end
		end
	end
}
DataSources.ResetDefaultClass = {
	prepare = function ( f622_arg0, f622_arg1, f622_arg2 )
		f622_arg1.resetDefaultClassList = {}
		local f622_local0 = Engine.CreateModel( Engine.GetModelForController( f622_arg0 ), "ResetDefaultClassList" )
		for f622_local1 = 1, CoD.CACUtility.maxDefaultClass, 1 do
			f622_arg1.resetDefaultClassList[f622_local1] = Engine.CreateModel( f622_local0, "DefaultClass" .. f622_local1 )
			Engine.SetModelValue( Engine.CreateModel( f622_arg1.resetDefaultClassList[f622_local1], "customClassName" ), Engine.Localize( "CLASS_SLOT" .. f622_local1 ) )
			Engine.SetModelValue( Engine.CreateModel( f622_arg1.resetDefaultClassList[f622_local1], "index" ), f622_local1 )
		end
	end,
	getCount = function ( f623_arg0 )
		return #f623_arg0.resetDefaultClassList
	end,
	getItem = function ( f624_arg0, f624_arg1, f624_arg2 )
		return f624_arg1.resetDefaultClassList[f624_arg2]
	end
}
DataSources.PaintshopWeaponTabType = ListHelper_SetupDataSource( "Paintshop.PaintshopWeaponTabType", function ( f625_arg0 )
	local f625_local0 = {}
	table.insert( f625_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f625_local4, f625_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
		table.insert( f625_local0, {
			models = {
				tabName = Engine.Localize( f625_local5.name )
			},
			properties = {
				filter = f625_local5.weapon_category
			}
		} )
	end
	table.insert( f625_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f625_local0
end )
DataSources.EmblemMaterialTabType = ListHelper_SetupDataSource( "Emblem.EmblemMaterialTabType", function ( f626_arg0 )
	local f626_local0 = {}
	table.insert( f626_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f626_local11, f626_local12 in ipairs( CoD.emblem.MaterialCategory ) do
		if f626_local12.type ~= "camo" or IsBooleanDvarSet( "enable_camo_materials_tab" ) then
			local f626_local4 = 0
			local f626_local5 = Engine.GetEmblemMaterialFilterCount( f626_arg0, f626_local12.category )
			for f626_local6 = 0, f626_local5 - 1, 1 do
				local f626_local9 = Engine.GetEmblemMaterialIDByIndex( f626_arg0, f626_local12.category, f626_local6 )
				local f626_local10 = false
				if f626_local12.category == CoD.emblem.BlackMarketEmblemCategory then
					f626_local10 = CoD.BlackMarketUtility.IsItemLocked( f626_arg0, Engine.GetEmblemMaterialName( f626_local9 ) )
				end
				if not f626_local10 and CoD.CraftUtility.Emblems.IsMaterialNew( f626_arg0, f626_local9 ) then
					f626_local4 = f626_local4 + 1
				end
			end
			if f626_local12.type == "general" then
				f626_local4 = 0
			end
			table.insert( f626_local0, {
				models = {
					tabName = Engine.Localize( f626_local12.name ),
					breadcrumbCount = f626_local4
				},
				properties = {
					filter = f626_local12.category
				}
			} )
		end
	end
	table.insert( f626_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f626_local0
end )
DataSources.CACCustomizationTabs = DataSourceHelpers.ListSetup( "CACCustomizationTabs", function ( f627_arg0 )
	local f627_local0 = {}
	local f627_local1 = CoD.perController[f627_arg0].gunsmithCamoIndexModel
	if f627_local1 then
		f627_local1 = not CoD.perController[f627_arg0].editingWeaponBuildKits
	end
	local f627_local2 = Engine.CurrentSessionMode()
	local f627_local3 = CoD.CACUtility.EmptyItemIndex
	if CoD.perController[f627_arg0].gunsmithCamoIndexModel or CoD.perController[f627_arg0].gunsmithReticleIndexModel or CoD.perController[f627_arg0].editingWeaponBuildKits then
		f627_local3 = CoD.GetCustomization( f627_arg0, "weapon_index" )
	else
		f627_local3 = CoD.CACUtility.GetItemEquippedInSlot( CoD.perController[f627_arg0].weaponCategory, f627_arg0, CoD.perController[f627_arg0].classModel )
	end
	local f627_local4 = ""
	if f627_local2 < Enum.eModes.MODE_COUNT then
		f627_local4 = Engine.GetItemRef( f627_local3, f627_local2 )
	else
		f627_local4 = Engine.GetItemRef( f627_local3, Enum.eModes.MODE_MULTIPLAYER )
	end
	local f627_local5 = function ( f628_arg0, f628_arg1 )
		local f628_local0 = false
		if f628_arg1 < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
			if f628_arg1 == f627_local2 then
				f628_local0 = not f627_local1
			else
				f628_local0 = false
			end
		end
		table.insert( f627_local0, {
			models = {
				tabName = f628_arg0,
				tabIcon = "",
				breadcrumbCount = 0
			},
			properties = {
				filterEnum = f628_arg1,
				filterString = CoD.WeaponOptionFilterToString( f628_arg1 ),
				selectIndex = f628_local0
			}
		} )
	end
	
	table.insert( f627_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	if CoD.perController[f627_arg0].customizationType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
		f627_local5( "MENU_CAMPAIGN_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP )
		f627_local5( "MENU_MULTIPLAYER_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP )
		f627_local5( "MENU_ZOMBIES_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM )
		if IsLive() then
			f627_local5( "MENU_BLACK_MARKET", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM )
		end
	else
		if CoD.CACUtility.WeaponsWithNoCPCamos[f627_local4] == nil then
			f627_local5( "MENU_CAMPAIGN_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP )
		end
		if not IsLive() or CoD.CACUtility.WeaponsWithNoMPCamos[f627_local4] == nil then
			f627_local5( "MENU_MULTIPLAYER_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP )
		end
		if not IsLive() or CoD.CACUtility.WeaponsWithNoZMCamos[f627_local4] == nil then
			f627_local5( "MENU_ZOMBIES_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM )
		end
		if IsLive() and CoD.BlackMarketUtility.WeaponsWithNoBMCamos[f627_local4] == nil then
			f627_local5( "MENU_BLACK_MARKET", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM )
		end
	end
	f627_local5( "MENU_EXTRAS_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS )
	table.insert( f627_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f627_local0
end, false )
DataSources.GunsmithWeaponAttachments = ListHelper_SetupDataSource( "GunsmithWeaponAttachments", function ( f629_arg0 )
	local f629_local0 = {}
	local f629_local1 = CoD.CraftUtility.GetCraftMode()
	if CoD.perController[f629_arg0].gunsmithAttachmentIsZombieMode == "true" then
		f629_local1 = Enum.eModes.MODE_ZOMBIES
	end
	local f629_local2 = CoD.GetCustomization( f629_arg0, "weapon_index" )
	local f629_local3 = Engine.GetNumAttachments( f629_local2, f629_local1 )
	local f629_local4 = CoD.perController[f629_arg0].gunsmithAttachmentType
	local f629_local5 = Engine.GetModelValue( CoD.perController[f629_arg0].gunsmithAttachmentModel )
	local f629_local6 = CoD.perController[f629_arg0].gunsmithVariantModel
	local f629_local7 = CoD.GetCustomization( f629_arg0, "weapon_ref" )
	local f629_local8 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
	local f629_local9 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
	local f629_local10 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
	local f629_local11 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
	local f629_local12 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
	local f629_local13 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
	local f629_local14 = "gamedata/weapons/mp/mp_attributesTable.csv"
	local f629_local15 = {
		damage = 0,
		range = 0,
		fireRate = 0,
		accuracy = 0
	}
	local f629_local16 = {}
	for f629_local17 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f629_local20 = Engine.GetModelValue( Engine.GetModel( f629_local6, "attachment" .. f629_local17 ) )
		if f629_local5 ~= f629_local20 and CoD.CACUtility.EmptyItemIndex < f629_local20 then
			local f629_local21 = Engine.GetAttachmentRefByIndex( f629_local20 )
			table.insert( f629_local16, f629_local21 )
			local f629_local22 = Engine.TableLookup( nil, f629_local14, f629_local8, f629_local21, f629_local9, f629_local7, f629_local10 )
			local f629_local23 = Engine.TableLookup( nil, f629_local14, f629_local8, f629_local21, f629_local9, f629_local7, f629_local11 )
			local f629_local24 = Engine.TableLookup( nil, f629_local14, f629_local8, f629_local21, f629_local9, f629_local7, f629_local12 )
			local f629_local25 = Engine.TableLookup( nil, f629_local14, f629_local8, f629_local21, f629_local9, f629_local7, f629_local13 )
			local f629_local26 = f629_local15.damage
			local f629_local27
			if f629_local22 == "" then
				f629_local27 = 0
				if not f629_local27 then
				
				else
					f629_local15.damage = f629_local26 + f629_local27
					f629_local26 = f629_local15.range
					if f629_local23 == "" then
						f629_local27 = 0
						if not f629_local27 then
						
						else
							f629_local15.range = f629_local26 + f629_local27
							f629_local26 = f629_local15.fireRate
							if f629_local24 == "" then
								f629_local27 = 0
								if not f629_local27 then
								
								else
									f629_local15.fireRate = f629_local26 + f629_local27
									f629_local26 = f629_local15.accuracy
									if f629_local25 == "" then
										f629_local27 = 0
										if not f629_local27 then
										
										else
											f629_local15.accuracy = f629_local26 + f629_local27
										end
									end
									f629_local27 = f629_local25
								end
							end
							f629_local27 = f629_local24
						end
					end
					f629_local27 = f629_local23
				end
			end
			f629_local27 = f629_local22
		end
	end
	local f629_local17 = Engine.GetModelForController( f629_arg0 )
	for f629_local18 = 1, f629_local3 - 1, 1 do
		local f629_local21 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
		local f629_local22 = nil
		if IsToggleVariantEnabled() then
			f629_local22 = Engine.Localize( "MENU_BUTTON_EMBLEM_ACV" )
		end
		if f629_local4 == "attachment" then
			if Engine.IsOptic( f629_local2, f629_local18, f629_local1 ) == false then
				f629_local21 = Engine.GetItemAttachment( f629_local2, f629_local18, f629_local1 )
			end
		elseif f629_local4 == "optic" and Engine.IsOptic( f629_local2, f629_local18, f629_local1 ) == true then
			f629_local22 = nil
			f629_local21 = Engine.GetItemAttachment( f629_local2, f629_local18, f629_local1 )
		end
		if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f629_local21 and Engine.GetAttachmentAllocationCost( f629_local2, f629_local18, f629_local1 ) > 0 then
			local f629_local24 = Engine.GetAttachmentRef( f629_local2, f629_local18, f629_local1 )
			local f629_local25 = Engine.GetAttachmentNameByIndex( f629_local21 )
			local f629_local26 = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, f629_local2, f629_local21 )
			local f629_local27 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
			local f629_local29 = Engine.GetModel( Engine.GetGlobalModel(), "CraftWeaponList" )
			if f629_local1 == Enum.eModes.MODE_ZOMBIES then
				CoD.GetUnlockablesTable( f629_arg0 )
				f629_local29 = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" )
			end
			local f629_local30 = Engine.GetModel( f629_local29, f629_local2 .. ".weaponAttributes" )
			local f629_local31 = function ( f630_arg0, f630_arg1 )
				local f630_local0 = Engine.GetModelValue( Engine.GetModel( f629_local30, f630_arg0 ) )
				local f630_local1 = Engine.TableLookup( nil, f629_local14, f629_local8, f629_local24, f629_local9, f629_local7, f630_arg1 )
				if f630_local0 == "" then
					f630_local0 = 0
				end
				if f630_local1 == "" then
					f630_local1 = 0
				end
				local f630_local2 = false
				for f630_local6, f630_local7 in ipairs( f629_local16 ) do
					if f630_local7 == f629_local24 then
						f630_local2 = true
						break
					end
				end
				f630_local3 = f630_local0 + f629_local15[f630_arg0]
				if not f630_local2 then
					f630_local3 = f630_local3 + f630_local1
				end
				return f630_local0 .. "," .. f630_local3
			end
			
			table.insert( f629_local0, {
				models = {
					name = f629_local25,
					image = f629_local26,
					itemIndex = f629_local18,
					weaponIndex = f629_local2,
					attachmentIndex = f629_local21,
					description = Engine.GetAttachmentDesc( f629_local2, f629_local18, f629_local1 ),
					acvIndex = f629_local27,
					weaponAttributes = {
						damage = f629_local31( "damage", f629_local10 ),
						range = f629_local31( "range", f629_local11 ),
						fireRate = f629_local31( "fireRate", f629_local12 ),
						accuracy = f629_local31( "accuracy", f629_local13 )
					},
					hintText = f629_local22
				},
				properties = {
					selectIndex = f629_local5 == f629_local21
				}
			} )
		end
	end
	return f629_local0
end, true )
DataSources.GunsmithVariantList = {
	prepare = function ( f631_arg0, f631_arg1, f631_arg2 )
		f631_arg1.controller = f631_arg0
		local f631_local0 = CoD.GetCustomization( f631_arg0, "weapon_index" )
		if not f631_local0 then
			return 
		end
		f631_arg1.variantListModel = Engine.CreateModel( Engine.GetModelForController( f631_arg0 ), "Gunsmith.VariantList" )
		local f631_local1 = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
		local f631_local2 = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( f631_local0 )
		if f631_local1 == CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints() then
			f631_arg1.totalVariants = f631_local2
		else
			f631_arg1.totalVariants = f631_local2 + 1
		end
		local f631_local3 = Engine.CreateModel( f631_arg1.variantListModel, "ForceUpdate" )
		if not f631_arg1.updateSubscription then
			f631_arg1.updateSubscription = f631_arg1:subscribeToModel( f631_local3, function ()
				f631_arg1:updateDataSource()
			end, false )
		end
		f631_arg1.variantList = {}
		f631_arg1.variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f631_local0 )
	end,
	getCount = function ( f633_arg0 )
		return f633_arg0.totalVariants
	end,
	createVariantModel = function ( f634_arg0, f634_arg1, f634_arg2, f634_arg3, f634_arg4 )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "variantIndex" ), f634_arg2.variantIndex )
		local f634_local0 = CoD.GetCustomization( f634_arg0, "weapon_index" )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "weaponIndex" ), f634_local0 )
		if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f634_arg2.variantIndex ) then
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "variantName" ), f634_arg2.variantName )
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "variantNameBig" ), f634_arg2.variantName )
		else
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "variantName" ), Engine.Localize( "MENU_GUNSMITH_CREATE_VARIANT" ) )
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "variantNameBig" ), "" )
		end
		for f634_local4, f634_local5 in ipairs( f634_arg2.attachment ) do
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "attachment" .. f634_local4 ), f634_local5 )
		end
		for f634_local4, f634_local5 in ipairs( f634_arg2.attachmentVariant ) do
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "attachmentVariant" .. f634_local4 ), f634_local5 )
		end
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "reticleIndex" ), f634_arg2.reticleIndex )
		f634_local1 = "Gunsmith.VariantList.Variant" .. f634_arg1 .. "AttachmentList"
		DataSources[f634_local1] = CoD.CraftUtility.Gunsmith.GetAttachmentIconList( f634_arg0, f634_local1, f634_local0, f634_arg2.attachment )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "listDataSource" ), f634_local1 )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "sortIndex" ), f634_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "paintjobSlot" ), f634_arg2.paintjobSlot )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "paintjobIndex" ), f634_arg2.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "camoIndex" ), f634_arg2.camoIndex )
		Engine.SetModelValue( Engine.CreateModel( f634_arg4, "paintjobSlotAndIndex" ), f634_arg2.paintjobSlot .. " " .. f634_arg2.paintjobIndex )
		if Engine.LastInput_Gamepad() then
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "hintText" ), Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
		elseif CoD.isPC then
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "hintText" ), Engine.Localize( "PLATFORM_GUNSMITH_PERSONALIZE_PROMPT" ) )
		end
		if f634_arg2.readOnly ~= nil then
			Engine.SetModelValue( Engine.CreateModel( f634_arg4, "readOnly" ), f634_arg2.readOnly )
		end
	end,
	getItem = function ( f635_arg0, f635_arg1, f635_arg2 )
		local f635_local0 = Engine.CreateModel( f635_arg1.variantListModel, "variant_" .. f635_arg2 )
		DataSources.GunsmithVariantList.createVariantModel( f635_arg0, f635_arg2, CoD.CraftUtility.Gunsmith.GetVariantByIndex( f635_arg0, f635_arg1.variantList[f635_arg2].variantIndex ), f635_arg1.variantList[f635_arg2].sortIndex, f635_local0 )
		return f635_local0
	end
}
DataSources.GunsmithWeaponTabType = ListHelper_SetupDataSource( "Gunsmith.GunsmithWeaponTabType", function ( f636_arg0 )
	local f636_local0 = {}
	table.insert( f636_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f636_local4, f636_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
		table.insert( f636_local0, {
			models = {
				tabName = Engine.Localize( f636_local5.name )
			},
			properties = {
				filter = f636_local5.weapon_category,
				loadoutType = f636_local5.loadout_type
			}
		} )
	end
	table.insert( f636_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f636_local0
end )
DataSources.GunsmithSelectedVariantAttachmentIconList = {
	getModel = function ( f637_arg0 )
		local f637_local0 = CoD.GetCustomization( f637_arg0, "weapon_index" )
		local f637_local1 = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( f637_arg0, CoD.perController[f637_arg0].gunsmithVariantModel )
		local f637_local2 = Engine.CreateModel( Engine.GetModelForController( f637_arg0 ), "Gunsmith.GunsmithSelectedVariantAttachmentIconList" )
		local f637_local3 = "Gunsmith.AttachmentIconList"
		DataSources[f637_local3] = CoD.CraftUtility.Gunsmith.GetAttachmentIconList( f637_arg0, f637_local3, f637_local0, f637_local1.baseAttachmentList )
		Engine.SetModelValue( Engine.CreateModel( f637_local2, "listDataSource" ), f637_local3 )
		return f637_local2
	end
}
DataSources.GunsmithSelectedItemProperties = {
	getModel = function ( f638_arg0 )
		local f638_local0 = Engine.CreateModel( Engine.GetModelForController( f638_arg0 ), "Gunsmith.GunsmithSelectedItemProperties" )
		Engine.SetModelValue( Engine.CreateModel( f638_local0, "itemName" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f638_local0, "title" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f638_local0, "attachmentType" ), "" )
		return f638_local0
	end
}
DataSources.FileshareRoot = {
	getModel = function ( f639_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
	end
}
DataSources.FileshareSelectedItem = {
	getModel = function ( f640_arg0 )
		return CoD.FileshareUtility.GetSelectedItem()
	end
}
DataSources.FileshareShowcaseManagerTabs = ListHelper_SetupDataSource( "FileshareShowcaseManagerTabs", function ( f641_arg0 )
	local f641_local0 = {}
	table.insert( f641_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	local f641_local1 = CoD.FileshareUtility.GetCurrentCategory()
	for f641_local7, f641_local8 in ipairs( CoD.FileshareUtility.ShowcaseManagerTabs ) do
		local f641_local5 = f641_local8.selectIndex
		local f641_local6 = f641_local8.disabled
		if f641_local8.fileshareCategory == f641_local1 then
			f641_local5 = true
			f641_local6 = false
		else
			f641_local5 = false
		end
		table.insert( f641_local0, {
			models = {
				tabName = Engine.Localize( Engine.TableLookup( 0, CoD.fileShareTable, 1, f641_local8.fileshareCategory, 8 ) .. "_CAPS" )
			},
			properties = {
				disabled = f641_local6,
				fileshareCategory = f641_local8.fileshareCategory,
				fileshareKey = f641_local8.fileshareKey,
				fileshareVal = f641_local8.fileshareVal,
				selectIndex = f641_local5
			}
		} )
	end
	table.insert( f641_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f641_local0
end )
DataSources.FilesharePublishedPaintjobTabs = ListHelper_SetupDataSource( "FilesharePublishedPaintjobTabs", function ( f642_arg0 )
	local f642_local0 = {}
	table.insert( f642_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f642_local4, f642_local5 in ipairs( CoD.FileshareUtility.PublishedPaintjobsTabs ) do
		table.insert( f642_local0, {
			models = {
				tabName = Engine.Localize( f642_local5.name )
			},
			properties = {
				filter = f642_local5.weapon_category,
				loadoutType = f642_local5.loadout_type,
				disabled = f642_local5.disabled,
				fileshareGroup = f642_local5.fileshareGroup,
				fileshareCategory = f642_local5.fileshareCategory,
				fileshareKey = f642_local5.fileshareKey,
				fileshareVal = f642_local5.fileshareVal
			}
		} )
	end
	table.insert( f642_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f642_local0
end )
DataSources.FilesharePublishedVariantsTabs = ListHelper_SetupDataSource( "FilesharePublishedVariantsTabs", function ( f643_arg0 )
	local f643_local0 = {}
	table.insert( f643_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f643_local4, f643_local5 in ipairs( CoD.FileshareUtility.PublishedVariantsTabs ) do
		table.insert( f643_local0, {
			models = {
				tabName = Engine.Localize( f643_local5.name )
			},
			properties = {
				filter = f643_local5.weapon_category,
				loadoutType = f643_local5.loadout_type,
				disabled = f643_local5.disabled,
				fileshareGroup = f643_local5.fileshareGroup,
				fileshareCategory = f643_local5.fileshareCategory,
				fileshareKey = f643_local5.fileshareKey,
				fileshareVal = f643_local5.fileshareVal
			}
		} )
	end
	table.insert( f643_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f643_local0
end )
DataSources.EmblemDecalTabs = ListHelper_SetupDataSource( "EmblemDecalTabs", function ( f644_arg0 )
	local f644_local0 = {}
	table.insert( f644_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f644_local8, f644_local9 in ipairs( CoD.emblem.DECALTABS ) do
		local f644_local6 = 0
		local f644_local10 = Engine.EmblemFilterCount( f644_arg0, 0, f644_local9.category )
		for f644_local7 = 0, f644_local10 - 1, 1 do
			local f644_local4 = Engine.EmblemFilterIconID( f644_arg0, 0, f644_local9.category, f644_local7 )
			local f644_local5 = false
			if f644_local9.type == "BLACKMARKET" then
				f644_local5 = CoD.BlackMarketUtility.IsItemLocked( f644_arg0, CoD.BlackMarketUtility.GetLootDecalName( f644_arg0, f644_local4 ) )
			end
			if not f644_local5 and Engine.IsEmblemIconNew( f644_arg0, f644_local4 ) then
				f644_local6 = f644_local6 + 1
			end
		end
		if f644_local9.type ~= "BLACKMARKET" then
			f644_local6 = 0
		end
		table.insert( f644_local0, {
			models = {
				tabName = Engine.Localize( f644_local9.displayName ),
				breadcrumbCount = f644_local6
			},
			properties = {
				tabCategory = f644_local9.category
			}
		} )
	end
	table.insert( f644_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f644_local0
end )
DataSources.EmblemCategoryTabs = ListHelper_SetupDataSource( "EmblemCategoryTabs", function ( f645_arg0 )
	CoD.CraftUtility.Emblems.CATEGORYTAB = {}
	table.insert( CoD.CraftUtility.Emblems.CATEGORYTAB, {
		type = "custom",
		displayName = "MENU_EMBLEM_CUSTOM_TAB",
		category = 1,
		storageType = Enum.StorageFileType.STORAGE_EMBLEMS,
		tabWidget = "CoD.EmblemSelectFrame"
	} )
	table.insert( CoD.CraftUtility.Emblems.CATEGORYTAB, {
		type = "prebuilt",
		displayName = "MENU_EMBLEM_PREBUILT_TAB",
		category = 2,
		storageType = Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS,
		tabWidget = "CoD.EmblemSelectFrame"
	} )
	if not SelectingGroupEmblem( f645_arg0 ) then
		table.insert( CoD.CraftUtility.Emblems.CATEGORYTAB, {
			type = "loot",
			displayName = "MENU_BLACK_MARKET",
			category = 3,
			storageType = Enum.StorageFileType.STORAGE_EMBLEMS_LOOT,
			tabWidget = "CoD.EmblemSelectFrame"
		} )
	end
	local f645_local0 = {}
	if IsLive() then
		table.insert( f645_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f645_local7, f645_local8 in ipairs( CoD.CraftUtility.Emblems.CATEGORYTAB ) do
			local f645_local5 = 0
			local f645_local9 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f645_arg0, f645_local8.storageType )
			for f645_local6 = 0, f645_local9 - 1, 1 do
				local f645_local4 = false
				if f645_local8.storageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
					f645_local4 = CoD.BlackMarketUtility.IsItemLocked( f645_arg0, CoD.BlackMarketUtility.GetLootEmblemIDNameFromIndex( f645_local6 ) )
				end
				if not f645_local4 and CoD.CraftUtility.Emblems.IsEmblemNew( f645_arg0, f645_local6, f645_local8.storageType ) then
					f645_local5 = f645_local5 + 1
				end
			end
			table.insert( f645_local0, {
				models = {
					tabName = Engine.Localize( f645_local8.displayName ),
					breadcrumbCount = f645_local5
				},
				properties = {
					tabCategory = f645_local8.category,
					tabType = f645_local8.type,
					storageType = f645_local8.storageType
				}
			} )
		end
		table.insert( f645_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
	end
	return f645_local0
end )
DataSources.CustomGamesOptionsButtonList = ListHelper_SetupDataSource( "CustomGamesOptionsButtonList", function ( f646_arg0 )
	local f646_local0 = {}
	table.insert( f646_local0, {
		displayText = "MENU_PUBLISH",
		displayImage = "t7_icon_menu_simple_publish",
		displayDesc = "MENU_CUSTOMGAMES_PUBLISH_DESC",
		action = OpenCustomGamePublishPrompt,
		disabled = false
	} )
	table.insert( f646_local0, {
		displayText = "MENU_DELETE",
		displayImage = "t7_icon_menu_simple_delete",
		displayDesc = "MENU_CUSTOMGAMES_DELETE_DESC",
		action = DeleteCustomGame,
		disabled = false
	} )
	local f646_local1 = {}
	for f646_local5, f646_local6 in ipairs( f646_local0 ) do
		table.insert( f646_local1, {
			models = {
				displayText = Engine.Localize( f646_local6.displayText ),
				icon = f646_local6.displayImage,
				hintText = f646_local6.displayDesc
			},
			properties = {
				action = f646_local6.action,
				actionParam = f646_local6.params
			}
		} )
	end
	return f646_local1
end )
DataSources.ScreenshotsOptionsButtonList = ListHelper_SetupDataSource( "ScreenshotsOptionsButtonList", function ( f647_arg0 )
	local f647_local0 = {}
	if FileshareCanPublish( f647_arg0 ) then
		table.insert( f647_local0, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = "MENU_SCREENSHOTS_PUBLISH_DESC",
			action = OpenLocalScreenshotsPublishPrompt,
			disabled = false
		} )
	end
	if FileshareCanDeleteItem( f647_arg0 ) then
		local f647_local1 = "MENU_FILESHARE_DELETE_DESC"
		if FileshareIsLocalCategory( f647_arg0 ) then
			f647_local1 = "MENU_FILESHARE_DELETE_LOCAL_DESC"
		end
		table.insert( f647_local0, {
			displayText = "MENU_DELETE",
			displayImage = "t7_icon_menu_simple_delete",
			displayDesc = f647_local1,
			action = CoD.FileshareUtility.Delete
		} )
	end
	local f647_local1 = {}
	for f647_local5, f647_local6 in ipairs( f647_local0 ) do
		table.insert( f647_local1, {
			models = {
				displayText = Engine.Localize( f647_local6.displayText ),
				icon = f647_local6.displayImage,
				hintText = f647_local6.displayDesc
			},
			properties = {
				action = f647_local6.action,
				actionParam = f647_local6.params
			}
		} )
	end
	return f647_local1
end )
DataSources.CustomGamesOptionsDeleteButtonList = {
	prepare = function ( f648_arg0, f648_arg1, f648_arg2 )
		local f648_local0 = {
			{
				displayText = "MENU_DELETE",
				displayImage = "",
				displayDesc = "MENU_CUSTOMGAMES_DELETE_DESC",
				action = DeleteCustomGameYes
			},
			{
				displayText = "MENU_CANCEL",
				displayImage = "",
				displayDesc = "MENU_CUSTOMGAMES_CANCEL_DESC",
				action = DeleteCustomGameNo
			}
		}
		local f648_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesOptionsDeleteButtonList" ), "list" )
		f648_arg1.optionModels = {}
		for f648_local5, f648_local6 in ipairs( f648_local0 ) do
			f648_arg1.optionModels[f648_local5] = Engine.CreateModel( f648_local1, "buttonModel_" .. f648_local5 )
			Engine.SetModelValue( Engine.CreateModel( f648_arg1.optionModels[f648_local5], "displayText" ), Engine.Localize( f648_local6.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f648_arg1.optionModels[f648_local5], "displayImage" ), f648_local6.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f648_arg1.optionModels[f648_local5], "hintText" ), Engine.Localize( f648_local6.displayDesc ) )
			Engine.SetModelValue( Engine.CreateModel( f648_arg1.optionModels[f648_local5], "action" ), f648_local6.action )
		end
	end,
	getCount = function ( f649_arg0 )
		return #f649_arg0.optionModels
	end,
	getItem = function ( f650_arg0, f650_arg1, f650_arg2 )
		return f650_arg1.optionModels[f650_arg2]
	end
}
DataSources.CustomGamesLoadOptionsButtonList = {
	prepare = function ( f651_arg0, f651_arg1, f651_arg2 )
		f651_arg1.optionModels = {}
		local f651_local0 = {
			{
				displayText = "MENU_YES",
				displayImage = "",
				displayDesc = "",
				action = LoadFileshareCustomGame
			},
			{
				displayText = "MENU_NO",
				displayImage = "",
				displayDesc = "",
				action = GoBack
			}
		}
		local f651_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesLoadOptionsButtonList" ), "list" )
		for f651_local5, f651_local6 in ipairs( f651_local0 ) do
			f651_arg1.optionModels[f651_local5] = Engine.CreateModel( f651_local1, "buttonModel_" .. f651_local5 )
			Engine.SetModelValue( Engine.CreateModel( f651_arg1.optionModels[f651_local5], "displayText" ), Engine.Localize( f651_local6.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f651_arg1.optionModels[f651_local5], "displayImage" ), f651_local6.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f651_arg1.optionModels[f651_local5], "hintText" ), Engine.Localize( f651_local6.displayDesc ) )
			Engine.SetModelValue( Engine.CreateModel( f651_arg1.optionModels[f651_local5], "action" ), f651_local6.action )
		end
	end,
	getCount = function ( f652_arg0 )
		return #f652_arg0.optionModels
	end,
	getItem = function ( f653_arg0, f653_arg1, f653_arg2 )
		return f653_arg1.optionModels[f653_arg2]
	end
}
DataSources.CustomGamesRoot = {
	getModel = function ( f654_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	end
}
DataSources.ChangeGameModeNav = {
	prepare = function ( f655_arg0, f655_arg1, f655_arg2 )
		local f655_local0 = {
			{
				text = "MENU_COMMUNITY",
				image = "uie_t7_mp_icon_header_customgames_large",
				description = "MENU_FILESHARE_PUBLISH_DESCRIPTION",
				community = true
			},
			{
				text = "MENU_SHOWCASE",
				image = "uie_t7_mp_icon_header_customgames_large",
				description = "MENU_FILESHARE_PUBLISH_DESCRIPTION",
				community = false
			}
		}
		local f655_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ChangeGameModeNav" ), "list" )
		f655_arg1.buttonModels = {}
		for f655_local5, f655_local6 in ipairs( f655_local0 ) do
			f655_arg1.buttonModels[f655_local5] = Engine.CreateModel( f655_local1, "ChangeGameModeNavButton_" .. f655_local5 )
			Engine.SetModelValue( Engine.CreateModel( f655_arg1.buttonModels[f655_local5], "text" ), Engine.Localize( f655_local6.text ) )
			Engine.SetModelValue( Engine.CreateModel( f655_arg1.buttonModels[f655_local5], "image" ), f655_local6.image )
			Engine.SetModelValue( Engine.CreateModel( f655_arg1.buttonModels[f655_local5], "description" ), Engine.Localize( f655_local6.description ) )
			Engine.SetModelValue( Engine.CreateModel( f655_arg1.buttonModels[f655_local5], "community" ), f655_local6.community )
		end
	end,
	getCount = function ( f656_arg0 )
		return #f656_arg0.buttonModels
	end,
	getItem = function ( f657_arg0, f657_arg1, f657_arg2 )
		return f657_arg1.buttonModels[f657_arg2]
	end
}
DataSources.ChangeGameModeNavSecondary = {
	prepare = function ( f658_arg0, f658_arg1, f658_arg2 )
		local f658_local0 = {
			{
				text = "MENU_POPULAR",
				image = "uie_t7_menu_startmenu_media_recent",
				description = "",
				action = nil
			},
			{
				text = "MENU_TRENDING",
				image = "uie_t7_menu_startmenu_media_popular",
				description = "",
				action = nil
			},
			{
				text = "MENU_RECENT",
				image = "uie_t7_menu_startmenu_media_trending",
				description = "",
				action = nil
			}
		}
		local f658_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ChangeGameModeNavSecondary" ), "list" )
		f658_arg1.buttonModels = {}
		for f658_local5, f658_local6 in ipairs( f658_local0 ) do
			f658_arg1.buttonModels[f658_local5] = Engine.CreateModel( f658_local1, "ChangeGameModeNavSecondaryButton_" .. f658_local5 )
			Engine.SetModelValue( Engine.CreateModel( f658_arg1.buttonModels[f658_local5], "text" ), Engine.Localize( f658_local6.text ) )
			Engine.SetModelValue( Engine.CreateModel( f658_arg1.buttonModels[f658_local5], "image" ), f658_local6.image )
			Engine.SetModelValue( Engine.CreateModel( f658_arg1.buttonModels[f658_local5], "description" ), Engine.Localize( f658_local6.description ) )
			Engine.SetModelValue( Engine.CreateModel( f658_arg1.buttonModels[f658_local5], "action" ), f658_local6.action )
		end
	end,
	getCount = function ( f659_arg0 )
		return #f659_arg0.buttonModels
	end,
	getItem = function ( f660_arg0, f660_arg1, f660_arg2 )
		return f660_arg1.buttonModels[f660_arg2]
	end
}
DataSources.CustomGamesList = {
	prepare = function ( f661_arg0, f661_arg1, f661_arg2 )
		f661_arg1.showDefault = true
		f661_arg1.controller = f661_arg0
		f661_arg1.rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		f661_arg1.communityOptions = {
			{
				text = Engine.Localize( "MENU_POPULAR" ),
				image = "img_t7_menu_startmenu_media_recent",
				description = Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ),
				action = OpenPopularCustomGames
			},
			{
				text = Engine.Localize( "MENU_TRENDING" ),
				image = "img_t7_menu_startmenu_media_popular",
				description = Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ),
				action = OpenTrendingCustomGames
			},
			{
				text = Engine.Localize( "MENU_RECENT" ),
				image = "img_t7_menu_startmenu_media_trending",
				description = Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ),
				action = OpenrRecentCustomGames
			}
		}
		local f661_local0 = GetCurrentUIGameType( f661_arg0 )
		if f661_local0 == "" then
			local f661_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
			local f661_local2 = Engine.GetModelValue( Engine.CreateModel( f661_local1, "communityOption" ) )
			local f661_local3 = Engine.GetModelValue( Engine.CreateModel( f661_local1, "showcaseOption" ) )
			if f661_local2 then
				f661_arg1.numFiles = 3
				f661_arg1.communityOption = true
			elseif f661_local3 then
				f661_arg1.numFiles = 0
			end
		else
			f661_arg1.officialGameCount = Engine.GetCustomGamesCount( f661_arg0, f661_local0, true )
			f661_arg1.customGameCount = Engine.GetCustomGamesCount( f661_arg0, f661_local0, false )
			f661_arg1.communityOption = false
			f661_arg1.numFiles = f661_arg1.officialGameCount + f661_arg1.customGameCount
			if f661_arg1.showDefault == true then
				f661_arg1.numFiles = f661_arg1.numFiles + 1
			end
		end
	end,
	getCount = function ( f662_arg0 )
		return f662_arg0.numFiles
	end,
	getItem = function ( f663_arg0, f663_arg1, f663_arg2 )
		local f663_local0 = Engine.CreateModel( f663_arg1.rootModel, "CustomGames_" .. f663_arg2 )
		local f663_local1 = GetCurrentUIGameType( f663_arg0 )
		Engine.SetModelValue( Engine.CreateModel( f663_local0, "uiIndex" ), f663_arg2 )
		if f663_arg1.communityOption == true then
			local f663_local2 = f663_arg1.communityOptions[f663_arg2]
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "text" ), f663_local2.text )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "buttonText" ), f663_local2.text )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "image" ), f663_local2.image )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "description" ), f663_local2.description )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "action" ), f663_local2.action )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "isOfficial" ), false )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "isCommunityOption" ), true )
			return f663_local0
		elseif f663_arg1.showDefault == true and f663_arg2 == 1 then
			local f663_local2 = Engine.GetGametypesBase()
			local f663_local3 = GetCurrentUIGameType( f663_arg0 )
			local f663_local4 = ""
			for f663_local8, f663_local9 in pairs( f663_local2 ) do
				if f663_local9.category == "standard" and f663_local9.gametype == f663_local3 then
					f663_local4 = "^BBUTTON_CUSTOMGAME_ICON^ " .. Engine.Localize( f663_local9.name )
					break
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "text" ), f663_local4 )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "buttonText" ), f663_local4 )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "inUse" ), true )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "isOfficial" ), true )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "isCommunityOption" ), false )
			if f663_local1 then
				Engine.SetModelValue( Engine.CreateModel( f663_local0, "description" ), Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f663_local1, "description" ) ) )
			end
		else
			local f663_local2 = 1
			if f663_arg1.showDefault == true then
				f663_local2 = 2
			end
			local f663_local3 = f663_arg2 - f663_local2
			local f663_local4 = false
			if f663_local3 < f663_arg1.officialGameCount then
				f663_local4 = true
			else
				f663_local3 = f663_local3 - f663_arg1.officialGameCount
			end
			local f663_local5 = Engine.GetCustomGameData( f663_arg0, f663_local3, GetCurrentUIGameType( f663_arg0 ), f663_local4 )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "slot" ), f663_local5.slot )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "index" ), f663_local5.index )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "gameName" ), f663_local5.gameName )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "inUse" ), f663_local5.inUse )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "isOfficial" ), f663_local5.isOfficial )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "isCommunityOption" ), false )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "createTime" ), f663_local5.createTime )
			if f663_local5.isOfficial then
				Engine.SetModelValue( Engine.CreateModel( f663_local0, "text" ), "^BBUTTON_CUSTOMGAME_ICON^ " .. Engine.Localize( f663_local5.gameName ) )
				Engine.SetModelValue( Engine.CreateModel( f663_local0, "buttonText" ), "^BBUTTON_CUSTOMGAME_ICON^ " .. Engine.Localize( f663_local5.gameName ) )
			else
				Engine.SetModelValue( Engine.CreateModel( f663_local0, "text" ), f663_local5.gameName )
				Engine.SetModelValue( Engine.CreateModel( f663_local0, "buttonText" ), f663_local5.gameName )
			end
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "gameTypeString" ), f663_local5.gameTypeString )
			if f663_local1 then
				if f663_local5.isOfficial then
					Engine.SetModelValue( Engine.CreateModel( f663_local0, "description" ), Engine.Localize( f663_local5.gameDescription ) )
					Engine.SetModelValue( Engine.CreateModel( f663_local0, "gameDescription" ), Engine.Localize( f663_local5.gameDescription ) )
				else
					Engine.SetModelValue( Engine.CreateModel( f663_local0, "description" ), f663_local5.gameDescription )
					Engine.SetModelValue( Engine.CreateModel( f663_local0, "gameDescription" ), f663_local5.gameDescription )
				end
			end
		end
		if f663_local1 then
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "gametype" ), f663_local1 )
			Engine.SetModelValue( Engine.CreateModel( f663_local0, "image" ), Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f663_local1, "image" ) )
		end
		return f663_local0
	end
}
DataSources.MediaManagerTabs = ListHelper_SetupDataSource( "MediaManagerTabs", function ( f664_arg0 )
	local f664_local0 = {}
	table.insert( f664_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	local f664_local1 = CoD.FileshareUtility.GetCurrentCategory()
	for f664_local7, f664_local8 in ipairs( CoD.FileshareUtility.MediaManagerTabs ) do
		local f664_local5 = f664_local8.selectIndex
		local f664_local6 = f664_local8.disabled
		if f664_local8.fileshareCategory == f664_local1 then
			f664_local5 = true
			f664_local6 = false
		else
			f664_local5 = false
		end
		table.insert( f664_local0, {
			models = {
				tabName = Engine.Localize( Engine.TableLookup( 0, CoD.fileShareTable, 1, f664_local8.fileshareCategory, 8 ) .. "_CAPS" )
			},
			properties = {
				disabled = f664_local6,
				fileshareCategory = f664_local8.fileshareCategory,
				fileshareKey = f664_local8.fileshareKey,
				fileshareVal = f664_local8.fileshareVal,
				selectIndex = f664_local5
			}
		} )
	end
	table.insert( f664_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f664_local0
end )
DataSources.MediaManagerQuotaList = {
	prepare = function ( f665_arg0, f665_arg1, f665_arg2 )
		f665_arg1.controller = f665_arg0
		f665_arg1.rootModel = Engine.CreateModel( Engine.GetModelForController( f665_arg0 ), "MediaManagerQuota" )
		f665_arg1.tabs = GetMediaManagerCategoryList()
		f665_arg1.numFileshareCategories = GetMediaManagerCategoryCount()
	end,
	getCount = function ( f666_arg0 )
		return f666_arg0.numFileshareCategories
	end,
	getItem = function ( f667_arg0, f667_arg1, f667_arg2 )
		local f667_local0 = Engine.CreateModel( f667_arg1.rootModel, "fileshareCategory_" .. f667_arg2 )
		local f667_local1 = CoD.FileshareUtility.GetCategoryForTabIndex( f667_arg1.tabs, f667_arg1.numFileshareCategories, f667_arg2 )
		local f667_local2 = MediaManagerGetQuotaForCategory( f667_arg0, f667_local1 )
		local f667_local3 = 0
		local f667_local4 = 0
		if f667_local2.categoryQuota > 0 then
			f667_local3 = f667_local2.categorySlotsUsed / f667_local2.categoryQuota
		end
		if f667_local3 > 1 then
			f667_local3 = 1
		elseif f667_local3 < 0 then
			f667_local3 = 0
		end
		if f667_local3 == 1 then
			f667_local4 = 1
		end
		Engine.SetModelValue( Engine.CreateModel( f667_local0, "category" ), f667_local2.category )
		Engine.SetModelValue( Engine.CreateModel( f667_local0, "locName" ), Engine.TableLookup( 0, CoD.fileShareTable, 1, f667_local2.category, 8 ) )
		Engine.SetModelValue( Engine.CreateModel( f667_local0, "quota" ), f667_local2.categoryQuota )
		Engine.SetModelValue( Engine.CreateModel( f667_local0, "slotsUsed" ), f667_local2.categorySlotsUsed )
		Engine.SetModelValue( Engine.CreateModel( f667_local0, "fraction" ), f667_local3 )
		Engine.SetModelValue( Engine.CreateModel( f667_local0, "image" ), CoD.FileshareUtility.GetCategoryImage( f667_local1 ) )
		Engine.SetModelValue( Engine.CreateModel( f667_local0, "barColor" ), CoD.FileshareUtility.GetCategoryColor( f667_local1 ) )
		Engine.SetModelValue( Engine.CreateModel( f667_local0, "slotsFull" ), f667_local4 )
		if f667_local2.category == CoD.FileshareUtility.GetCurrentCategory() then
			Engine.SetModelValue( Engine.CreateModel( f667_local0, "isDim" ), false )
		else
			Engine.SetModelValue( Engine.CreateModel( f667_local0, "isDim" ), true )
		end
		return f667_local0
	end
}
DataSources.FileshareQuotaList = {
	prepare = function ( f668_arg0, f668_arg1, f668_arg2 )
		f668_arg1.controller = f668_arg0
		f668_arg1.rootModel = Engine.CreateModel( Engine.GetModelForController( f668_arg0 ), "FileshareQuota" )
		f668_arg1.tabs = GetShowcaseManagerCategoryList()
		f668_arg1.numFileshareCategories = GetShowcaseManagerCategoryCount()
	end,
	getCount = function ( f669_arg0 )
		return f669_arg0.numFileshareCategories
	end,
	getItem = function ( f670_arg0, f670_arg1, f670_arg2 )
		local f670_local0 = Engine.CreateModel( f670_arg1.rootModel, "fileshareCategory_" .. f670_arg2 )
		local f670_local1 = CoD.FileshareUtility.GetCategoryForTabIndex( f670_arg1.tabs, f670_arg1.numFileshareCategories, f670_arg2 )
		local f670_local2 = Engine.FileshareGetQuota( f670_arg1.controller, f670_local1 )
		local f670_local3 = 0
		local f670_local4 = 0
		if f670_local2.categoryQuota > 0 then
			f670_local3 = f670_local2.categorySlotsUsed / f670_local2.categoryQuota
		end
		if f670_local3 > 1 then
			f670_local3 = 1
		elseif f670_local3 < 0 then
			f670_local3 = 0
		end
		if f670_local3 == 1 then
			f670_local4 = 1
		end
		Engine.SetModelValue( Engine.CreateModel( f670_local0, "category" ), f670_local2.category )
		Engine.SetModelValue( Engine.CreateModel( f670_local0, "locName" ), Engine.TableLookup( 0, CoD.fileShareTable, 1, f670_local2.category, 8 ) )
		Engine.SetModelValue( Engine.CreateModel( f670_local0, "quota" ), f670_local2.categoryQuota )
		Engine.SetModelValue( Engine.CreateModel( f670_local0, "slotsUsed" ), f670_local2.categorySlotsUsed )
		Engine.SetModelValue( Engine.CreateModel( f670_local0, "fraction" ), f670_local3 )
		Engine.SetModelValue( Engine.CreateModel( f670_local0, "image" ), CoD.FileshareUtility.GetCategoryImage( f670_local1 ) )
		Engine.SetModelValue( Engine.CreateModel( f670_local0, "barColor" ), CoD.FileshareUtility.GetCategoryColor( f670_local1 ) )
		Engine.SetModelValue( Engine.CreateModel( f670_local0, "slotsFull" ), f670_local4 )
		if f670_local2.category == CoD.FileshareUtility.GetCurrentCategory() then
			Engine.SetModelValue( Engine.CreateModel( f670_local0, "isDim" ), false )
		else
			Engine.SetModelValue( Engine.CreateModel( f670_local0, "isDim" ), true )
		end
		return f670_local0
	end
}
DataSources.FilesharePublishedList = {
	prepare = function ( f671_arg0, f671_arg1, f671_arg2 )
		f671_arg1.controller = f671_arg0
		f671_arg1.numElements = f671_arg1.vCount * f671_arg1.hCount
		local f671_local0
		if not CoD.FileshareUtility.GetIsGroupsMode( f671_arg0 ) then
			f671_local0 = CoD.FileshareUtility.GetShowCreateButton()
		else
			f671_local0 = false
		end
		f671_arg1.hasCreateButton = f671_local0
		f671_arg1.fileshareRootModel = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
		f671_arg1.fileshareData = {}
		for f671_local0 = 1, f671_arg1.numElements, 1 do
			f671_arg1.fileshareData[f671_local0] = {}
			f671_arg1.fileshareData[f671_local0].elementModel = Engine.CreateModel( f671_arg1.fileshareRootModel, "fileshareData_" .. f671_local0 )
			for f671_local6, f671_local7 in ipairs( CoD.FileshareUtility.FileProperties ) do
				Engine.CreateModel( f671_arg1.fileshareData[f671_local0].elementModel, f671_local7 )
			end
			if CoD.FileshareUtility.GetIsGroupsMode( f671_arg0 ) then
				Engine.CreateModel( f671_arg1.fileshareData[f671_local0].elementModel, "featureIsProcessing" )
			end
			CoD.FileshareUtility.ResetFileshareSummary( f671_arg1.fileshareData[f671_local0].elementModel )
		end
		Engine.FileshareStartup( f671_arg1.controller )
		CoD.FileshareUtility.SetShowFileDetails( false )
	end,
	getCount = function ( f672_arg0 )
		f672_arg0.itemsCount = 0
		if f672_arg0.numElements == nil then
			CoD.FileshareUtility.SetItemsCount( f672_arg0.controller, 0 )
			return 0
		end
		local f672_local0 = true
		local f672_local1 = CoD.FileshareUtility.GetCurrentCategory()
		if f672_local1 == "film" or f672_local1 == "recentgames" then
			local f672_local2 = Engine.GetDemoStreamedDownloadProgress()
			if f672_local2 > 0 and f672_local2 < 100 then
				f672_local0 = false
			end
		end
		if f672_local0 and not Engine.FileshareIsReady( f672_arg0.controller ) then
			if not f672_arg0.refreshElement then
				f672_arg0.refreshElement = LUI.UITimer.newElementTimer( 500, false, function ()
					if Engine.FileshareIsReady( f672_arg0.controller ) then
						f672_arg0:updateDataSource()
						f672_arg0.refreshElement:close()
						f672_arg0.refreshElement = nil
						CoD.FileshareUtility.SetFileshareReady( 1 )
					end
				end )
				f672_arg0:addElement( f672_arg0.refreshElement )
			end
			CoD.FileshareUtility.SetItemsCount( f672_arg0.controller, 0 )
			CoD.FileshareUtility.SetFileshareReady( 0 )
			return 0
		end
		local f672_local2 = CoD.FileshareUtility.GetCurrentCategory()
		local f672_local3 = CoD.FileshareUtility.GetIsCommunityMode( f672_arg0.controller )
		local f672_local4, f672_local5 = CoD.FileshareUtility.GetCurrentFilter()
		if f672_local2 == nil then
			CoD.FileshareUtility.SetItemsCount( f672_arg0.controller, 0 )
			return 0
		end
		local f672_local6 = 0
		if f672_local3 or CoD.FileshareUtility.GetIsGroupsMode( f672_arg0.controller ) or f672_local2 == "recentgames" then
			if f672_local2 == "recentgames" then
				f672_local6 = Engine.FileshareGetTotalUsedCommunitySlotCount( f672_arg0.controller, "film", f672_local4, f672_local5 )
			else
				f672_local6 = Engine.FileshareGetTotalUsedCommunitySlotCount( f672_arg0.controller, f672_local2, f672_local4, f672_local5 )
			end
		else
			f672_local6 = Engine.FileshareGetSlotCount( f672_arg0.controller, f672_local2, f672_local4, f672_local5 )
		end
		f672_local6 = math.min( f672_local6, 300 )
		CoD.FileshareUtility.SetItemsCount( f672_arg0.controller, f672_local6 )
		if f672_arg0.hasCreateButton == true then
			return f672_local6 + 1
		end
		f672_arg0.itemsCount = f672_local6
		return f672_local6
	end,
	getItem = function ( f674_arg0, f674_arg1, f674_arg2 )
		local f674_local0 = f674_arg2 - 1
		local f674_local1 = f674_local0 % f674_arg1.numElements + 1
		local f674_local2 = f674_arg2 % f674_arg1.numElements
		if f674_arg1.hasCreateButton == true then
			f674_local0 = f674_local0 - 1
		end
		local f674_local3 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "isPublishNew" )
		local f674_local4 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "showPlusImage" )
		local f674_local5 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "showFileImage" )
		local f674_local6 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "plusImageSrc" )
		local f674_local7 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "fileImage" )
		local f674_local8 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "fileId" )
		local f674_local9 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "renderFileId" )
		local f674_local10 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "gameType" )
		local f674_local11 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "gameTypeImage" )
		local f674_local12 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "showGameTypeImage" )
		local f674_local13 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "slot" )
		local f674_local14 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "index" )
		local f674_local15 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "weaponName" )
		local f674_local16 = nil
		if CoD.FileshareUtility.GetIsGroupsMode( f674_arg0 ) then
			f674_local16 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "featureIsProcessing" )
		end
		local f674_local17 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "mapName" )
		local f674_local18 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "duration" )
		Engine.SetModelValue( Engine.CreateModel( f674_arg1.fileshareData[f674_local1].elementModel, "uiModelIndex" ), f674_local1 )
		Engine.SetModelValue( Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "codeIndex" ), f674_local0 )
		Engine.SetModelValue( Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "totalItems" ), f674_arg1.itemsCount )
		Engine.SetModelValue( Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "showDetailsViewSpinner" ), 0 )
		Engine.SetModelValue( f674_local8, nil )
		if f674_arg1.hasCreateButton == true and f674_arg2 == 1 then
			Engine.SetModelValue( f674_local3, true )
			Engine.SetModelValue( f674_local4, 1 )
			Engine.SetModelValue( f674_local7, "" )
			Engine.SetModelValue( f674_local5, 0 )
			Engine.SetModelValue( f674_local9, 0 )
			Engine.SetModelValue( f674_local6, "uie_t7_icon_codpoints" )
			Engine.SetModelValue( f674_local18, 0 )
			Engine.SetModelValue( f674_local17, "" )
			Engine.SetModelValue( f674_local12, 0 )
			Engine.SetModelValue( f674_local11, "" )
			Engine.SetModelValue( f674_local15, "" )
			local f674_local19 = CoD.FileshareUtility.GetInShowcaseManager( f674_arg0 )
			local f674_local20 = Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, "fileName" )
			if f674_local19 and f674_local19 == true then
				Engine.SetModelValue( f674_local20, Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			else
				Engine.SetModelValue( f674_local20, Engine.Localize( "MENU_FILESHARE_PUBLISH_NEW" ) )
			end
		else
			Engine.SetModelValue( f674_local3, false )
			Engine.SetModelValue( f674_local7, "" )
			Engine.SetModelValue( f674_local4, 0 )
			local f674_local19 = CoD.FileshareUtility.GetCurrentCategory()
			local f674_local20 = CoD.FileshareUtility.GetIsCommunityMode( f674_arg1.controller )
			local f674_local21, f674_local22 = CoD.FileshareUtility.GetCurrentFilter()
			local f674_local23 = nil
			if f674_local20 or CoD.FileshareUtility.GetIsGroupsMode( f674_arg1.controller ) or f674_local19 == "recentgames" then
				if f674_local19 == "recentgames" then
					f674_local23 = Engine.FileshareGetCommunitySlotData( f674_arg1.controller, "film", f674_local21, f674_local22, f674_local0 )
				else
					f674_local23 = Engine.FileshareGetCommunitySlotData( f674_arg1.controller, f674_local19, f674_local21, f674_local22, f674_local0 )
				end
			else
				f674_local23 = Engine.FileshareGetSlotData( f674_arg1.controller, f674_local19, f674_local21, f674_local22, f674_local0 )
			end
			CoD.FileshareUtility.SetCategoryCurrentPage( f674_arg0, f674_local19, f674_local0 )
			if CoD.FileshareUtility.GetIsGroupsMode( f674_arg0 ) then
				f674_local19 = f674_local23.fileCategory
			end
			if f674_local19 == "recentgames" or f674_local19 == "film" or f674_local19 == "customgame" then
				Engine.SetModelValue( f674_local12, 1 )
			else
				Engine.SetModelValue( f674_local12, 0 )
			end
			if f674_local19 == "clip" or f674_local19 == "clip_private" or f674_local19 == "recentgames" or f674_local19 == "film" or f674_local19 == "customgame" or f674_local19 == "screenshot" then
				Engine.SetModelValue( f674_local5, 0 )
			else
				Engine.SetModelValue( f674_local5, 1 )
			end
			local f674_local24 = nil
			local f674_local25
			if f674_local19 ~= "screenshot_private" and f674_local19 ~= "screenshot" and f674_local19 ~= "clip_private" and f674_local19 ~= "clip" then
				f674_local25 = false
			else
				f674_local25 = true
			end
			local f674_local26 = CoD.FileshareUtility.GetForceRefreshThumbnails()
			if f674_local25 == true then
				f674_local24 = Engine.GetModelValue( f674_local8 )
			end
			for f674_local30, f674_local31 in ipairs( CoD.FileshareUtility.FileProperties ) do
				if f674_local23[f674_local31] ~= nil then
					Engine.SetModelValue( Engine.GetModel( f674_arg1.fileshareData[f674_local1].elementModel, f674_local31 ), f674_local23[f674_local31] )
				end
			end
			f674_local27 = ""
			if f674_local23.weaponIndex ~= nil and f674_local23.weaponIndex ~= 0 then
				f674_local27 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f674_local23.weaponIndex ) ) )
			end
			Engine.SetModelValue( f674_local15, f674_local27 )
			CoD.FileshareUtility.SetupDefaultNameAndDescription( f674_arg1.fileshareData[f674_local1].elementModel )
			if f674_local25 == true then
				if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f674_arg0 ), "groups.showFullScreenshot" ) ) then
					if f674_local23.fileId ~= CoD.currentScreenshot then
						FileshareDestroyScreenshot( f674_arg0 )
						f674_local28 = f674_local23.fileSize
						if not f674_local28 then
							f674_local28 = 0
						end
						if f674_local23.fileId ~= Engine.DefaultID64Value() then
							Engine.DownloadScreenshot( f674_arg0, f674_local23.fileId, f674_local28 )
							CoD.currentScreenshot = f674_local23.fileId
						end
					end
				elseif f674_local24 ~= f674_local23.fileId or f674_local26 == true then
					if f674_local24 ~= nil then
						Engine.ResetThumbnail( f674_local24 )
					end
					Engine.AddThumbnail( f674_arg0, Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_THUMBNAIL, f674_local23.fileId, f674_local23.fileSummarySize )
				end
			end
			if f674_local23.isValid == false then
				Engine.SetModelValue( f674_local12, 0 )
			end
			if f674_local16 then
				f674_local28 = false
				if CoD.perController[f674_arg0].selectedGroup then
					f674_local29 = f674_local23.fileId
					f674_local31 = tostring( Engine.GetModelValue( Engine.GetModel( CoD.perController[f674_arg0].selectedGroup, "groupId" ) ) )
					if CoD.groupUnfeaturedList and CoD.groupUnfeaturedList[f674_local31] then
						for f674_local35, f674_local36 in ipairs( CoD.groupUnfeaturedList[f674_local31] ) do
							if f674_local36 == f674_local29 then
								f674_local28 = true
								break
							end
						end
					end
				end
				Engine.SetModelValue( f674_local16, f674_local28 )
			end
			Engine.SetModelValue( Engine.CreateModel( f674_arg1.fileshareData[f674_local1].elementModel, "action" ), function ( f675_arg0, f675_arg1, f675_arg2, f675_arg3, f675_arg4 )
				if not CoD.FileshareUtility.IsValid( f675_arg2, f675_arg1 ) then
					LuaUtils.UI_ShowErrorMessageDialog( f675_arg2, "MENU_FILESHARE_INVALID_ITEM" )
				elseif f674_local19 == "film" or f674_local19 == "recentgames" or f674_local19 == "film_private" or f674_local19 == "clip" or f674_local19 == "clip_private" then
					if not IsInTheaterMode() then
						LuaUtils.UI_ShowErrorMessageDialog( f675_arg2, "MENU_FILESHARE_PLAY_ONLY_IN_THEATER" )
					else
						local f675_local0 = Engine.GetModelValue( Engine.GetModel( f675_arg1:getModel(), "mainMode" ) )
						if f675_local0 ~= Engine.CurrentSessionMode() then
							local f675_local1 = ""
							if f675_local0 == Enum.eModes.MODE_ZOMBIES then
								f675_local1 = Engine.Localize( "MENU_FILESHARE_PLAY_ONLY_IN_SPECIFIC_MODE", "MENU_ZOMBIE" )
							else
								f675_local1 = Engine.Localize( "MENU_FILESHARE_PLAY_ONLY_IN_SPECIFIC_MODE", "MENU_MULTIPLAYER" )
							end
							LuaUtils.UI_ShowErrorMessageDialog( f675_arg2, f675_local1 )
						else
							CoD.FileshareUtility.LoadTheaterFile( f675_arg0, f675_arg1, f675_arg2, f675_arg3, f675_arg4 )
							if f675_arg4.menuName == "Theater_SelectFilm" then
								Close( f675_arg0, f675_arg2 )
							else
								GoBackToMenu( f675_arg4, f675_arg2, "Lobby" )
								Engine.SendClientScriptNotify( f675_arg2, "menu_change" .. Engine.GetLocalClientNum( f675_arg2 ), "Main", "closeToMenu" )
							end
						end
					end
				elseif f674_local19 == "customgame" then
					if IsCustomMPLobby() then
						OpenOverlay( f675_arg0, "CustomGamesLoadFileshareItem", f675_arg2 )
					else
						LuaUtils.UI_ShowErrorMessageDialog( f675_arg2, "MENU_CUSTOMGAMES_CANNOT_VIEW_DESC" )
					end
				else
					FileshareSetSelectedItem( f675_arg0, f675_arg1, f675_arg2, "true" )
					if FileshareCanOpenDetailsView( f675_arg1, f675_arg2 ) == true then
						FileshareOpenFullscreenView( f675_arg0, f675_arg1, f675_arg2, f675_arg4 )
					end
				end
			end )
		end
		return f674_arg1.fileshareData[f674_local1].elementModel
	end
}
DataSources.FileshareCommunityList = {
	prepare = function ( f676_arg0, f676_arg1, f676_arg2 )
		f676_arg1.controller = f676_arg0
		f676_arg1.hasCreateButton = false
		f676_arg1.numElements = f676_arg1.vCount * f676_arg1.hCount
		f676_arg1.fileshareRootModel = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
		f676_arg1.fileshareData = {}
		for f676_local0 = 1, f676_arg1.numElements, 1 do
			f676_arg1.fileshareData[f676_local0] = {}
			f676_arg1.fileshareData[f676_local0].elementModel = Engine.CreateModel( f676_arg1.fileshareRootModel, "fileshareData_community_" .. f676_local0 )
			for f676_local6, f676_local7 in ipairs( CoD.FileshareUtility.FileProperties ) do
				Engine.CreateModel( f676_arg1.fileshareData[f676_local0].elementModel, f676_local7 )
			end
			CoD.FileshareUtility.ResetFileshareSummary( f676_arg1.fileshareData[f676_local0].elementModel )
		end
		CoD.FileshareUtility.SetItemsCount( f676_arg1.controller, f676_arg1.numElements )
		Engine.FileshareStartup( f676_arg1.controller )
		CoD.FileshareUtility.SetShowFileDetails( false )
		CoD.FileshareUtility.SetShowPublishNewDetails( false )
	end,
	getCount = function ( f677_arg0 )
		local f677_local0 = true
		local f677_local1 = CoD.FileshareUtility.GetCurrentCategory()
		f677_arg0.itemsCount = 0
		if f677_local1 == "film" or f677_local1 == "recentgames" then
			local f677_local2 = Engine.GetDemoStreamedDownloadProgress()
			if f677_local2 > 0 and f677_local2 < 100 then
				f677_local0 = false
			end
		end
		if f677_local0 and not Engine.FileshareIsReady( f677_arg0.controller ) then
			CoD.FileshareUtility.SetItemsCount( f677_arg0.controller, 0 )
			CoD.FileshareUtility.SetFileshareReady( 0 )
			return 0
		else
			local f677_local2, f677_local3 = CoD.FileshareUtility.GetCurrentFilter()
			if f677_local1 == nil then
				CoD.FileshareUtility.SetItemsCount( f677_arg0.controller, 0 )
				return 0
			else
				local f677_local4 = math.min( Engine.FileshareGetTotalUsedCommunitySlotCount( f677_arg0.controller, f677_local1, f677_local2, f677_local3 ), 300 )
				CoD.FileshareUtility.SetItemsCount( f677_arg0.controller, f677_local4 )
				f677_arg0.itemsCount = f677_local4
				return f677_local4
			end
		end
	end,
	getItem = function ( f678_arg0, f678_arg1, f678_arg2 )
		local f678_local0 = f678_arg2 - 1
		local f678_local1 = f678_local0 % f678_arg1.numElements + 1
		local f678_local2 = f678_arg2 % f678_arg1.numElements
		local f678_local3 = Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "isPublishNew" )
		local f678_local4 = Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "showPlusImage" )
		local f678_local5 = Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "showFileImage" )
		local f678_local6 = Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "fileImage" )
		local f678_local7 = Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "fileId" )
		local f678_local8 = Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "renderFileId" )
		local f678_local9 = Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "showGameTypeImage" )
		Engine.SetModelValue( Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "codeIndex" ), f678_local0 )
		Engine.SetModelValue( Engine.CreateModel( f678_arg1.fileshareData[f678_local1].elementModel, "uiModelIndex" ), f678_local1 )
		Engine.SetModelValue( Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "totalItems" ), f678_arg1.itemsCount )
		Engine.SetModelValue( Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "showDetailsViewSpinner" ), 0 )
		Engine.SetModelValue( f678_local3, false )
		Engine.SetModelValue( f678_local6, "" )
		Engine.SetModelValue( f678_local4, 0 )
		Engine.SetModelValue( f678_local8, 0 )
		local f678_local10 = CoD.FileshareUtility.GetCurrentCategory()
		local f678_local11, f678_local12 = CoD.FileshareUtility.GetCurrentFilter()
		if f678_local10 == "clip" or f678_local10 == "clip_private" or f678_local10 == "recentgames" or f678_local10 == "film" or f678_local10 == "customgame" then
			Engine.SetModelValue( f678_local5, 0 )
		else
			Engine.SetModelValue( f678_local5, 1 )
		end
		local f678_local13 = nil
		local f678_local14
		if f678_local10 ~= "screenshot_private" and f678_local10 ~= "screenshot" and f678_local10 ~= "clip_private" and f678_local10 ~= "clip" then
			f678_local14 = false
		else
			f678_local14 = true
		end
		local f678_local15 = CoD.FileshareUtility.GetForceRefreshThumbnails()
		if f678_local14 == true then
			f678_local13 = Engine.GetModelValue( f678_local7 )
		end
		local f678_local16 = Engine.FileshareGetCommunitySlotData( f678_arg1.controller, f678_local10, f678_local11, f678_local12, f678_local0 )
		for f678_local20, f678_local21 in ipairs( CoD.FileshareUtility.FileProperties ) do
			if f678_local16[f678_local21] ~= nil then
				Engine.SetModelValue( Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, f678_local21 ), f678_local16[f678_local21] )
			end
		end
		if f678_local10 == "customgame" then
			Engine.SetModelValue( f678_local9, 1 )
		else
			Engine.SetModelValue( f678_local9, 0 )
		end
		f678_local17 = ""
		if f678_local16.weaponIndex ~= nil and f678_local16.weaponIndex ~= 0 then
			f678_local17 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f678_local16.weaponIndex ) ) )
		end
		Engine.SetModelValue( Engine.GetModel( f678_arg1.fileshareData[f678_local1].elementModel, "weaponName" ), f678_local17 )
		CoD.FileshareUtility.SetupDefaultNameAndDescription( f678_arg1.fileshareData[f678_local1].elementModel )
		CoD.FileshareUtility.SetCategoryCurrentPage( f678_arg0, f678_local10, f678_local0 )
		f678_local19 = function ( f679_arg0, f679_arg1, f679_arg2, f679_arg3, f679_arg4 )
			if not CoD.FileshareUtility.IsValid( f679_arg2, f679_arg1 ) then
				LuaUtils.UI_ShowErrorMessageDialog( f679_arg2, "MENU_FILESHARE_INVALID_ITEM" )
				Engine.SendClientScriptNotify( f679_arg2, "menu_change" .. Engine.GetLocalClientNum( f679_arg2 ), "Main", "closeToMenu" )
			elseif CoD.FileshareUtility.IsCategoryFilm( f679_arg2, f679_arg1 ) or CoD.FileshareUtility.IsCategoryClip( f679_arg2, f679_arg1 ) then
				if not IsInTheaterMode() then
					LuaUtils.UI_ShowErrorMessageDialog( f679_arg2, "MENU_FILESHARE_PLAY_ONLY_IN_THEATER" )
				else
					local f679_local0 = Engine.GetModelValue( Engine.GetModel( f679_arg1:getModel(), "mainMode" ) )
					if f679_local0 ~= Engine.CurrentSessionMode() then
						local f679_local1 = ""
						if f679_local0 == Enum.eModes.MODE_ZOMBIES then
							f679_local1 = Engine.Localize( "MENU_FILESHARE_PLAY_ONLY_IN_SPECIFIC_MODE", "MENU_ZOMBIE" )
						else
							f679_local1 = Engine.Localize( "MENU_FILESHARE_PLAY_ONLY_IN_SPECIFIC_MODE", "MENU_MULTIPLAYER" )
						end
						LuaUtils.UI_ShowErrorMessageDialog( f679_arg2, f679_local1 )
					else
						CoD.FileshareUtility.LoadTheaterFile( f679_arg0, f679_arg1, f679_arg2, f679_arg3, f679_arg4 )
						if f679_arg4.menuName == "Theater_SelectFilm" then
							Close( f679_arg0, f679_arg2 )
						else
							GoBackToMenu( f679_arg4, f679_arg2, "Lobby" )
							Engine.SendClientScriptNotify( f679_arg2, "menu_change" .. Engine.GetLocalClientNum( f679_arg2 ), "Main", "closeToMenu" )
						end
					end
				end
			elseif CoD.FileshareUtility.GetCurrentCategory() == "customgame" then
				if IsCustomMPLobby() then
					OpenOverlay( f679_arg0, "CustomGamesLoadFileshareItem", f679_arg2 )
				else
					LuaUtils.UI_ShowErrorMessageDialog( f679_arg2, "MENU_CUSTOMGAMES_CANNOT_VIEW_DESC" )
				end
			else
				FileshareSetSelectedItem( f679_arg0, f679_arg1, f679_arg2, "true" )
				if FileshareCanOpenDetailsView( f679_arg1, f679_arg2 ) == true then
					FileshareOpenFullscreenView( f679_arg0, f679_arg1, f679_arg2, f679_arg4 )
				end
			end
		end
		
		if f678_local14 == true and (f678_local13 ~= f678_local16.fileId or f678_local15 == true) then
			if f678_local13 ~= nil then
				Engine.ResetThumbnail( f678_local13 )
			end
			Engine.AddThumbnail( f678_arg0, Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_THUMBNAIL, f678_local16.fileId, f678_local16.fileSummarySize )
		end
		Engine.SetModelValue( Engine.CreateModel( f678_arg1.fileshareData[f678_local1].elementModel, "action" ), f678_local19 )
		return f678_arg1.fileshareData[f678_local1].elementModel
	end
}
DataSources.ShowcasePaintjobList = {
	prepare = function ( f680_arg0, f680_arg1, f680_arg2 )
		f680_arg1.controller = f680_arg0
		local f680_local0 = CoD.FileshareUtility.GetCurrentCategory()
		local f680_local1, f680_local2 = CoD.FileshareUtility.GetCurrentFilter()
		CoD.CraftUtility.Paintjobs.ParseDDL( f680_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS )
		f680_arg1.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( f680_arg0 ), "Paintshop.PaintjobList" )
		local f680_local3 = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
		if f680_local2 ~= "" then
			f680_local3 = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobsByWeaponGroup( f680_local2 )
		end
		f680_arg1.totalPaintjobs = f680_local3
		f680_arg1.paintjobList = {}
		f680_arg1.paintjobList = CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList( nil, f680_local2 )
	end,
	getCount = function ( f681_arg0 )
		return f681_arg0.totalPaintjobs
	end,
	getItem = function ( f682_arg0, f682_arg1, f682_arg2 )
		local f682_local0 = Engine.CreateModel( f682_arg1.paintjobListModel, "paintjob_" .. f682_arg2 )
		local f682_local1 = f682_arg1.paintjobList[f682_arg2]
		if f682_local1 then
			if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( f682_local1.paintjobSlot, f682_local1.paintjobIndex ) then
				Engine.SetModelValue( Engine.CreateModel( f682_local0, "paintjobName" ), f682_local1.paintjobName )
				Engine.SetModelValue( Engine.CreateModel( f682_local0, "paintjobTextEntry" ), f682_local1.paintjobName )
			else
				Engine.SetModelValue( Engine.CreateModel( f682_local0, "paintjobTextEntry" ), "Paintjob" )
				Engine.SetModelValue( Engine.CreateModel( f682_local0, "paintjobName" ), "" )
			end
			if f682_local1.readOnly ~= nil then
				Engine.SetModelValue( Engine.CreateModel( f682_local0, "readOnly" ), f682_local1.readOnly )
			end
			Engine.SetModelValue( Engine.CreateModel( f682_local0, "sortIndex" ), f682_local1.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( f682_local0, "paintjobSlot" ), f682_local1.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( f682_local0, "weaponIndex" ), f682_local1.weaponIndex )
			Engine.SetModelValue( Engine.CreateModel( f682_local0, "paintjobIndex" ), f682_local1.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( f682_local0, "paintjobSlotAndIndex" ), f682_local1.paintjobSlot .. " " .. f682_local1.paintjobIndex )
			return f682_local0
		else
			
		end
	end
}
DataSources.ShowcaseVariantList = {
	prepare = function ( f683_arg0, f683_arg1, f683_arg2 )
		f683_arg1.controller = f683_arg0
		local f683_local0 = CoD.FileshareUtility.GetCurrentCategory()
		local f683_local1, f683_local2 = CoD.FileshareUtility.GetCurrentFilter()
		CoD.CraftUtility.Gunsmith.ParseDDL( f683_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
		f683_arg1.variantListModel = Engine.CreateModel( Engine.GetModelForController( f683_arg0 ), "Gunsmith.VariantList" )
		local f683_local3 = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
		if f683_local2 ~= "" then
			f683_local3 = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariantsByWeaponGroup( f683_local2 )
		end
		f683_arg1.totalVariants = f683_local3
		f683_arg1.variantList = {}
		f683_arg1.variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( nil, f683_local2 )
	end,
	getCount = function ( f684_arg0 )
		return f684_arg0.totalVariants
	end,
	createVariantModel = function ( f685_arg0, f685_arg1, f685_arg2, f685_arg3, f685_arg4 )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "variantIndex" ), f685_arg2.variantIndex )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "weaponIndex" ), f685_arg2.weaponIndex )
		if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f685_arg2.variantIndex ) then
			Engine.SetModelValue( Engine.CreateModel( f685_arg4, "variantName" ), f685_arg2.variantName )
			Engine.SetModelValue( Engine.CreateModel( f685_arg4, "variantNameBig" ), f685_arg2.variantName )
		else
			Engine.SetModelValue( Engine.CreateModel( f685_arg4, "variantName" ), Engine.Localize( "MENU_GUNSMITH_CREATE_VARIANT" ) )
			Engine.SetModelValue( Engine.CreateModel( f685_arg4, "variantNameBig" ), "" )
		end
		for f685_local3, f685_local4 in ipairs( f685_arg2.attachment ) do
			Engine.SetModelValue( Engine.CreateModel( f685_arg4, "attachment" .. f685_local3 ), f685_local4 )
		end
		for f685_local3, f685_local4 in ipairs( f685_arg2.attachmentVariant ) do
			Engine.SetModelValue( Engine.CreateModel( f685_arg4, "attachmentVariant" .. f685_local3 ), f685_local4 )
		end
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "reticleIndex" ), f685_arg2.reticleIndex )
		f685_local0 = "Gunsmith.VariantList.Variant" .. f685_arg1 .. "AttachmentList"
		DataSources[f685_local0] = CoD.CraftUtility.Gunsmith.GetAttachmentIconList( f685_arg0, f685_local0, f685_arg2.weaponIndex, f685_arg2.attachment )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "listDataSource" ), f685_local0 )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "sortIndex" ), f685_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "paintjobSlot" ), f685_arg2.paintjobSlot )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "paintjobIndex" ), f685_arg2.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "camoIndex" ), f685_arg2.camoIndex )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "paintjobSlotAndIndex" ), f685_arg2.paintjobSlot .. " " .. f685_arg2.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( f685_arg4, "hintText" ), Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
		if f685_arg2.readOnly ~= nil then
			Engine.SetModelValue( Engine.CreateModel( f685_arg4, "readOnly" ), f685_arg2.readOnly )
		end
	end,
	getItem = function ( f686_arg0, f686_arg1, f686_arg2 )
		local f686_local0 = Engine.CreateModel( f686_arg1.variantListModel, "variant_" .. f686_arg2 )
		DataSources.ShowcaseVariantList.createVariantModel( f686_arg0, f686_arg2, CoD.CraftUtility.Gunsmith.GetVariantByIndex( f686_arg0, f686_arg1.variantList[f686_arg2].variantIndex ), f686_arg1.variantList[f686_arg2].sortIndex, f686_local0 )
		return f686_local0
	end
}
DataSources.FileshareCategoriesList = {
	prepare = function ( f687_arg0, f687_arg1, f687_arg2 )
		local f687_local0 = {
			{
				displayText = "GROUPS_PAINTJOBS_CAPS",
				displayImage = "uie_t7_mp_icon_header_paintshop",
				hintText = "MENU_FILESHARE_SHOWCASE_PAINTJOBS_DESC",
				category = "paintjob",
				communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_INVALID,
				disabled = false,
				tabWidget = "CoD.FileshareCategoryContentList"
			},
			{
				displayText = "MENU_VARIANTS_CAPS",
				displayImage = "uie_t7_mp_icon_header_gunsmith",
				hintText = "MENU_FILESHARE_SHOWCASE_VARIANTS_DESC",
				category = "variant",
				communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_INVALID,
				disabled = false,
				tabWidget = "CoD.FileshareCategoryContentList"
			},
			{
				displayText = "MENU_EMBLEMS_CAPS",
				displayImage = "uie_t7_mp_icon_header_emblem",
				hintText = "MENU_FILESHARE_SHOWCASE_EMBLEMS_DESC",
				category = "emblem",
				communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_INVALID,
				disabled = false,
				tabWidget = "CoD.FileshareCategoryContentList"
			},
			{
				displayText = "MENU_CUSTOMGAMES_CAPS",
				displayImage = "uie_t7_mp_icon_header_customgames",
				hintText = "MENU_FILESHARE_SHOWCASE_CUSTOMGAMES_DESC",
				category = "customgame",
				communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_INVALID,
				disabled = false,
				tabWidget = "CoD.FileshareCategoryContentList"
			},
			{
				displayText = "MENU_SCREENSHOTS",
				displayImage = "uie_t7_mp_icon_header_screenshot",
				hintText = "MENU_FILESHARE_SHOWCASE_SCREENSHOTS_DESC",
				category = "screenshot",
				communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_INVALID,
				disabled = false,
				tabWidget = "CoD.FileshareScreenshotsContentList"
			},
			{
				displayText = "MENU_RECENT_GAMES",
				displayImage = "uie_t7_icon_menu_simple_media_recent",
				hintText = "MENU_FILESHARE_SHOWCASE_FILMS_DESC",
				category = "recentgames",
				communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT_GAMES,
				disabled = false,
				tabWidget = "CoD.FileshareCategoryContentList"
			},
			{
				displayText = "MENU_FILESHARE_CLIPS_CAPS",
				displayImage = "t7_icon_menu_simple_clips",
				hintText = "MENU_FILESHARE_SHOWCASE_CLIPS_DESC",
				category = "clip",
				communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_INVALID,
				disabled = false,
				tabWidget = "CoD.FileshareCategoryContentList"
			}
		}
		local f687_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareCategoriesList" ), "list" )
		f687_arg1.optionModels = {}
		for f687_local5, f687_local6 in ipairs( f687_local0 ) do
			f687_arg1.optionModels[f687_local5] = Engine.CreateModel( f687_local1, "buttonModel_" .. f687_local5 )
			Engine.SetModelValue( Engine.CreateModel( f687_arg1.optionModels[f687_local5], "displayText" ), Engine.Localize( f687_local6.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f687_arg1.optionModels[f687_local5], "displayImage" ), f687_local6.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f687_arg1.optionModels[f687_local5], "hintText" ), Engine.Localize( f687_local6.hintText ) )
			Engine.SetModelValue( Engine.CreateModel( f687_arg1.optionModels[f687_local5], "category" ), f687_local6.category )
			Engine.SetModelValue( Engine.CreateModel( f687_arg1.optionModels[f687_local5], "disabled" ), f687_local6.disabled )
			Engine.SetModelValue( Engine.CreateModel( f687_arg1.optionModels[f687_local5], "tabWidget" ), f687_local6.tabWidget )
			if f687_local6.communityDataType then
				Engine.SetModelValue( Engine.CreateModel( f687_arg1.optionModels[f687_local5], "communityDataType" ), f687_local6.communityDataType )
			end
		end
	end,
	getCount = function ( f688_arg0 )
		return #f688_arg0.optionModels
	end,
	getItem = function ( f689_arg0, f689_arg1, f689_arg2 )
		return f689_arg1.optionModels[f689_arg2]
	end
}
DataSources.FileshareCommunityCategoriesList = {
	prepare = function ( f690_arg0, f690_arg1, f690_arg2 )
		local f690_local0 = {}
		table.insert( f690_local0, {
			displayText = "GROUPS_PAINTJOBS_CAPS",
			displayImage = "uie_t7_mp_icon_header_paintshop",
			hintText = "MENU_FILESHARE_COMMUNITY_PAINTJOBS_DESC",
			category = "paintjob",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( f690_local0, {
			displayText = "MENU_VARIANTS_CAPS",
			displayImage = "uie_t7_mp_icon_header_gunsmith",
			hintText = "MENU_FILESHARE_COMMUNITY_VARIANTS_DESC",
			category = "variant",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( f690_local0, {
			displayText = "MENU_EMBLEMS_CAPS",
			displayImage = "uie_t7_mp_icon_header_emblem",
			hintText = "MENU_FILESHARE_COMMUNITY_EMBLEMS_DESC",
			category = "emblem",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( f690_local0, {
			displayText = "MENU_CUSTOMGAMES_CAPS",
			displayImage = "uie_t7_mp_icon_header_customgames",
			hintText = "MENU_FILESHARE_COMMUNITY_CUSTOMGAMES_DESC",
			category = "customgame",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( f690_local0, {
			displayText = "MENU_SCREENSHOTS",
			displayImage = "uie_t7_mp_icon_header_screenshot",
			hintText = "MENU_FILESHARE_COMMUNITY_SCREENSHOTS_DESC",
			category = "screenshot",
			disabled = false,
			tabWidget = "CoD.FileshareScreenshotsContentList"
		} )
		table.insert( f690_local0, {
			displayText = "MENU_FILESHARE_CLIPS_CAPS",
			displayImage = "t7_icon_menu_simple_clips",
			hintText = "MENU_FILESHARE_COMMUNITY_CLIPS_DESC",
			category = "clip",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		local f690_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareCategoriesList" ), "list" )
		f690_arg1.optionModels = {}
		for f690_local5, f690_local6 in ipairs( f690_local0 ) do
			f690_arg1.optionModels[f690_local5] = Engine.CreateModel( f690_local1, "community_buttonModel_" .. f690_local5 )
			Engine.SetModelValue( Engine.CreateModel( f690_arg1.optionModels[f690_local5], "displayText" ), Engine.Localize( f690_local6.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f690_arg1.optionModels[f690_local5], "displayImage" ), f690_local6.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f690_arg1.optionModels[f690_local5], "hintText" ), Engine.Localize( f690_local6.hintText ) )
			Engine.SetModelValue( Engine.CreateModel( f690_arg1.optionModels[f690_local5], "category" ), f690_local6.category )
			Engine.SetModelValue( Engine.CreateModel( f690_arg1.optionModels[f690_local5], "disabled" ), f690_local6.disabled )
			Engine.SetModelValue( Engine.CreateModel( f690_arg1.optionModels[f690_local5], "tabWidget" ), f690_local6.tabWidget )
		end
	end,
	getCount = function ( f691_arg0 )
		return #f691_arg0.optionModels
	end,
	getItem = function ( f692_arg0, f692_arg1, f692_arg2 )
		return f692_arg1.optionModels[f692_arg2]
	end
}
DataSources.FileshareMyTheaterCategoriesList = {
	prepare = function ( f693_arg0, f693_arg1, f693_arg2 )
		local f693_local0 = {}
		table.insert( f693_local0, {
			displayText = "MENU_FILESHARE_RECENTGAMES_CAPS",
			displayImage = "uie_t7_icon_menu_simple_media_recent",
			hintText = "MENU_FILESHARE_RECENTGAMES_DESC",
			category = "recentgames",
			communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT_GAMES,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( f693_local0, {
			displayText = "MENU_FILESHARE_CLIPS_CAPS",
			displayImage = "t7_icon_menu_simple_clips",
			hintText = "MENU_FILESHARE_CLIPS_DESC",
			category = "clip_private",
			communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_INVALID,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		local f693_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareMyTheaterCategoriesList" ), "list" )
		f693_arg1.optionModels = {}
		for f693_local5, f693_local6 in ipairs( f693_local0 ) do
			f693_arg1.optionModels[f693_local5] = Engine.CreateModel( f693_local1, "buttonModel_" .. f693_local5 )
			Engine.SetModelValue( Engine.CreateModel( f693_arg1.optionModels[f693_local5], "displayText" ), Engine.Localize( f693_local6.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f693_arg1.optionModels[f693_local5], "displayImage" ), f693_local6.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f693_arg1.optionModels[f693_local5], "hintText" ), Engine.Localize( f693_local6.hintText ) )
			Engine.SetModelValue( Engine.CreateModel( f693_arg1.optionModels[f693_local5], "category" ), f693_local6.category )
			Engine.SetModelValue( Engine.CreateModel( f693_arg1.optionModels[f693_local5], "communityDataType" ), f693_local6.communityDataType )
			Engine.SetModelValue( Engine.CreateModel( f693_arg1.optionModels[f693_local5], "disabled" ), f693_local6.disabled )
			Engine.SetModelValue( Engine.CreateModel( f693_arg1.optionModels[f693_local5], "tabWidget" ), f693_local6.tabWidget )
		end
	end,
	getCount = function ( f694_arg0 )
		return #f694_arg0.optionModels
	end,
	getItem = function ( f695_arg0, f695_arg1, f695_arg2 )
		return f695_arg1.optionModels[f695_arg2]
	end
}
DataSources.FileshareOptionsButtonList = ListHelper_SetupDataSource( "FileshareOptionsButtonList", function ( f696_arg0 )
	local f696_local0 = {}
	local f696_local1 = FileshareIsLocalCategory( f696_arg0 )
	local f696_local2 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	local f696_local3 = f696_local2 == Engine.GetXUID64( f696_arg0 )
	if CoD.FileshareUtility.GetIsGroupsMode( f696_arg0 ) then
		if HasAdminPrivilege( f696_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_FAVORITE_SHOWCASE_CONTENT ) then
			local f696_local4 = "GROUPS_MARK_AS_FAVORITE"
			local f696_local5 = "GROUPS_MARK_AS_FAVORITE_DESC"
			if CoD.FileshareUtility.GetSelectedItemProperty( "favoriteInCurrGroup" ) then
				f696_local4 = "GROUPS_REMOVE_FROM_FAVORITES"
				f696_local5 = "GROUPS_REMOVE_FROM_FAVORITES_DESC"
			end
			table.insert( f696_local0, {
				displayText = f696_local4,
				displayImage = "t7_icon_menu_simple_groups_favorites",
				displayDesc = f696_local5,
				action = ToggleGroupShowcaseContentFavorite
			} )
		end
		if HasAdminPrivilege( f696_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_FEATURED_CONTENT ) then
			local f696_local4 = "GROUPS_MARK_AS_FEATURED"
			local f696_local5 = "GROUPS_MARK_AS_FEATURED_DESC"
			if CoD.FileshareUtility.GetSelectedItemProperty( "featuredInCurrGroup" ) then
				f696_local4 = "GROUPS_REMOVE_FROM_FEATURED"
				f696_local5 = "GROUPS_REMOVE_FROM_FEATURED_DESC"
			end
			table.insert( f696_local0, {
				displayText = f696_local4,
				displayImage = "t7_icon_menu_simple_emblems",
				displayDesc = f696_local5,
				action = ToggleGroupShowcaseContentFeatured
			} )
		end
		if f696_local3 or HasAdminPrivilege( f696_arg0, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_REMOVE_SHOWCASE_CONTENT ) then
			table.insert( f696_local0, {
				displayText = "GROUPS_REMOVE_FROM_SHOWCASE",
				displayImage = "t7_mp_icon_group_action_remove",
				displayDesc = "GROUPS_REMOVE_FROM_SHOWCASE_DESC",
				action = RemoveFileFromGroupsShowcase
			} )
		end
	end
	if f696_local1 and CoD.FileshareUtility.GetCurrentCategory() == "clip_private" and FileshareCanPublish( f696_arg0 ) then
		table.insert( f696_local0, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = "MENU_CLIP_PUBLISH_DESC",
			action = OpenLocalClipPublishPrompt
		} )
	end
	if not f696_local1 and FilesshareCanShowVoteOptions( f696_arg0 ) then
		table.insert( f696_local0, {
			displayText = "MENU_FILESHARE_LIKE",
			displayImage = "uie_t7_icon_menu_options_like",
			displayDesc = "MENU_FILESHARE_LIKE_DESC",
			action = CoD.FileshareUtility.ReportLike
		} )
		table.insert( f696_local0, {
			displayText = "MENU_FILESHARE_DISLIKE",
			displayImage = "uie_t7_icon_menu_options_dislike",
			displayDesc = "MENU_FILESHARE_DISLIKE_DESC",
			action = CoD.FileshareUtility.ReportDislike
		} )
	end
	if not f696_local1 and FileshareCanDownloadItem( f696_arg0 ) then
		table.insert( f696_local0, {
			displayText = "MENU_FILESHARE_DOWNLOAD",
			displayImage = "t7_icon_menu_options_download",
			displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
			action = CoD.FileshareUtility.DownloadAction
		} )
	end
	if f696_local3 and IsMemberOfAnyGroup( f696_arg0 ) then
		table.insert( f696_local0, {
			displayText = "GROUPS_REPUBLISH_TO_GROUPS_CAPS",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = "GROUPS_REPUBLISH_TO_GROUPS_DESC",
			action = PublishFileToGroupsShowcase
		} )
	end
	if FileshareCanDeleteItem( f696_arg0 ) then
		local f696_local4 = "MENU_FILESHARE_DELETE_DESC"
		if f696_local1 then
			f696_local4 = "MENU_FILESHARE_DELETE_LOCAL_DESC"
		end
		table.insert( f696_local0, {
			displayText = "MENU_DELETE",
			displayImage = "t7_icon_menu_simple_delete",
			displayDesc = f696_local4,
			action = CoD.FileshareUtility.Delete
		} )
	end
	if not f696_local1 and not f696_local3 and FileshareCanShowPlayerDetails( f696_arg0 ) then
		table.insert( f696_local0, {
			displayText = "MPUI_PLAYER_DETAILS",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_FILESHARE_PLAYER_DETAILS_DESC",
			action = ShowcaseOpenPlayerDetails
		} )
	end
	if not f696_local1 and not f696_local3 then
		table.insert( f696_local0, {
			displayText = "MENU_REPORT_PLAYER",
			displayImage = "uie_t7_icon_error_overlays",
			displayDesc = "MENU_REPORT_PLAYER_DESC",
			action = ShowReportPlayerDialog,
			params = {
				controller = f696_arg0,
				gamertag = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorName" ),
				xuid = f696_local2
			},
			lastInGroup = false
		} )
	end
	if f696_local1 then
		
	elseif FileshareCanShowShowcaseManager( f696_arg0 ) then
		table.insert( f696_local0, {
			displayText = "MENU_FILESHARE_SHOWCASE_MANAGER",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_FILESHARE_MEDIA_MANAGER_DESC",
			action = CoD.FileshareUtility.OpenShowcaseManager
		} )
	end
	local f696_local4 = {}
	for f696_local8, f696_local9 in ipairs( f696_local0 ) do
		table.insert( f696_local4, {
			models = {
				displayText = Engine.Localize( f696_local9.displayText ),
				icon = f696_local9.displayImage,
				hintText = f696_local9.displayDesc
			},
			properties = {
				action = f696_local9.action,
				actionParam = f696_local9.params
			}
		} )
	end
	return f696_local4
end )
DataSources.FileshareOptionsDeleteButtonList = {
	prepare = function ( f697_arg0, f697_arg1, f697_arg2 )
		local f697_local0 = {}
		if IsMediaManager() then
			table.insert( f697_local0, {
				displayText = "MENU_YES",
				displayImage = "",
				displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
				action = CoD.FileshareUtility.DeleteYes
			} )
			table.insert( f697_local0, {
				displayText = "MENU_NO",
				displayImage = "",
				displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
				action = CoD.FileshareUtility.DeleteNo
			} )
		else
			table.insert( f697_local0, {
				displayText = "MENU_DELETE",
				displayImage = "",
				displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
				action = CoD.FileshareUtility.DeleteYes
			} )
			table.insert( f697_local0, {
				displayText = "MENU_CANCEL",
				displayImage = "",
				displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
				action = CoD.FileshareUtility.DeleteNo
			} )
		end
		local f697_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareOptionsDeleteButtonList" ), "list" )
		f697_arg1.optionModels = {}
		for f697_local5, f697_local6 in ipairs( f697_local0 ) do
			f697_arg1.optionModels[f697_local5] = Engine.CreateModel( f697_local1, "buttonModel_" .. f697_local5 )
			Engine.SetModelValue( Engine.CreateModel( f697_arg1.optionModels[f697_local5], "displayText" ), Engine.Localize( f697_local6.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f697_arg1.optionModels[f697_local5], "displayImage" ), f697_local6.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f697_arg1.optionModels[f697_local5], "hintText" ), Engine.Localize( f697_local6.displayDesc ) )
			Engine.SetModelValue( Engine.CreateModel( f697_arg1.optionModels[f697_local5], "action" ), f697_local6.action )
		end
	end,
	getCount = function ( f698_arg0 )
		return #f698_arg0.optionModels
	end,
	getItem = function ( f699_arg0, f699_arg1, f699_arg2 )
		return f699_arg1.optionModels[f699_arg2]
	end
}
DataSources.FileshareSlotsFullButtonList = {
	prepare = function ( f700_arg0, f700_arg1, f700_arg2 )
		local f700_local0 = function ( f701_arg0, f701_arg1, f701_arg2, f701_arg3, f701_arg4 )
			OpenPurchaseExtraSlotsOverlay( f701_arg0, f701_arg2, GoBack( f701_arg0, f701_arg2 ) )
		end
		
		local f700_local1 = {}
		if FileshareShowcaseSlotsAvailable( f700_arg0 ) == false then
			if Engine.IsDemoPlaying() then
				
			else
				table.insert( f700_local1, {
					displayText = "MENU_FILESHARE_SHOWCASE_MANAGER_CAPS",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.OpenShowcaseManager
				} )
			end
			if FileshareCanBuyMoreSlots( f700_arg0 ) == true then
				table.insert( f700_local1, {
					displayText = "MENU_FILESHARE_BUY_SLOTS",
					displayImage = "",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = f700_local0
				} )
			end
		end
		local f700_local2 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSlotsFullButtonList" ), "list" )
		f700_arg1.optionModels = {}
		for f700_local6, f700_local7 in ipairs( f700_local1 ) do
			f700_arg1.optionModels[f700_local6] = Engine.CreateModel( f700_local2, "buttonModel_" .. f700_local6 )
			Engine.SetModelValue( Engine.CreateModel( f700_arg1.optionModels[f700_local6], "displayText" ), Engine.Localize( f700_local7.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( f700_arg1.optionModels[f700_local6], "displayImage" ), f700_local7.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f700_arg1.optionModels[f700_local6], "hintText" ), Engine.Localize( f700_local7.displayDesc ) )
			Engine.SetModelValue( Engine.CreateModel( f700_arg1.optionModels[f700_local6], "action" ), f700_local7.action )
		end
	end,
	getCount = function ( f702_arg0 )
		return #f702_arg0.optionModels
	end,
	getItem = function ( f703_arg0, f703_arg1, f703_arg2 )
		return f703_arg1.optionModels[f703_arg2]
	end
}
DataSources.GunsmithOptionsButtonList = ListHelper_SetupDataSource( "GunsmithOptionsButtonList", function ( f704_arg0 )
	local f704_local0 = {}
	local f704_local1 = false
	local f704_local2 = false
	local f704_local3 = false
	local f704_local4 = CraftSlotsFullByStorageType( f704_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	local f704_local5 = CoD.perController[f704_arg0].gunsmithVariantModel
	if f704_local5 then
		local f704_local6 = Engine.GetModel( f704_local5, "readOnly" )
		if f704_local6 then
			local f704_local7 = Engine.GetModelValue( f704_local6 )
			if f704_local7 and f704_local7 == 1 then
				f704_local3 = true
			end
		end
	end
	if f704_local4 == true or f704_local3 == true then
		f704_local1 = true
	end
	local f704_local6 = "MENU_GUNSMITH_PUBLISH_DESC"
	if f704_local3 == true then
		f704_local2 = true
		f704_local6 = "MENU_CANNOT_PUBLISH_DOWNLOADED_DESC"
	end
	if FileshareCanPublish( f704_arg0 ) then
		table.insert( f704_local0, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = f704_local6,
			action = CoD.CraftUtility.OpenPublishPromptGunsmith,
			disabled = f704_local2
		} )
	end
	table.insert( f704_local0, {
		displayText = "MENU_DELETE",
		displayImage = "t7_icon_menu_simple_delete",
		displayDesc = "MENU_GUNSMITH_DELETE_DESC",
		action = CoD.CraftUtility.GunsmithClear,
		disabled = false
	} )
	table.insert( f704_local0, {
		displayText = "MENU_COPY",
		displayImage = "t7_icon_menu_simple_copy",
		displayDesc = "MENU_GUNSMITH_COPY_DESC",
		action = Gunsmith_CopyVariant,
		disabled = f704_local1
	} )
	table.insert( f704_local0, {
		displayText = "MENU_RENAME",
		displayImage = "t7_icon_menu_simple_rename",
		displayDesc = "MENU_GUNSMITH_RENAME_DESC",
		action = CoD.CraftUtility.GunsmithRename,
		disabled = false
	} )
	if CanShowMediaManager() then
		table.insert( f704_local0, {
			displayText = "MENU_MEDIA_MANAGER",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_MEDIA_MANAGER_DESC",
			action = GoBackAndOpenMediaManagerOnParent,
			param = "variant",
			disabled = false
		} )
	end
	local f704_local7 = {}
	for f704_local11, f704_local12 in ipairs( f704_local0 ) do
		table.insert( f704_local7, {
			models = {
				displayText = f704_local12.displayText,
				icon = f704_local12.displayImage,
				description = f704_local12.displayDesc,
				action = f704_local12.action,
				param = f704_local12.param
			},
			properties = {
				disabled = f704_local12.disabled
			}
		} )
	end
	return f704_local7
end )
DataSources.EmblemOptionsButtonList = ListHelper_SetupDataSource( "EmblemOptionsButtonList", function ( f705_arg0 )
	local f705_local0 = {}
	local f705_local1 = false
	local f705_local2 = false
	local f705_local3 = false
	local f705_local4 = CraftSlotsFullByStorageType( f705_arg0, Enum.StorageFileType.STORAGE_EMBLEMS )
	local f705_local5 = CoD.perController[f705_arg0].selectedEmblemModel
	if f705_local5 then
		local f705_local6 = Engine.GetModel( f705_local5, "readOnly" )
		if f705_local6 then
			local f705_local7 = Engine.GetModelValue( f705_local6 )
			if f705_local7 and f705_local7 == 1 then
				f705_local3 = true
			end
		end
	end
	if f705_local4 == true or f705_local3 == true then
		f705_local1 = true
	end
	local f705_local6 = "MENU_EMBLEMS_PUBLISH_DESC"
	if f705_local3 == true then
		f705_local2 = true
		f705_local6 = "MENU_CANNOT_PUBLISH_DOWNLOADED_DESC"
	end
	if isFileshareFeatureEnabled() then
		table.insert( f705_local0, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = f705_local6,
			action = CoD.CraftUtility.OpenPublishPromptEmblem,
			disabled = f705_local2
		} )
	end
	table.insert( f705_local0, {
		displayText = "MENU_DELETE",
		displayImage = "t7_icon_menu_simple_delete",
		displayDesc = "MENU_EMBLEM_DELETE_DESC",
		action = CoD.CraftUtility.EmblemClear,
		disabled = false
	} )
	table.insert( f705_local0, {
		displayText = "MENU_COPY",
		displayImage = "t7_icon_menu_simple_copy",
		displayDesc = "MENU_EMBLEM_COPY_DESC",
		action = EmblemSelect_CopyEmblem,
		disabled = f705_local1
	} )
	table.insert( f705_local0, {
		displayText = "MENU_RENAME",
		displayImage = "t7_icon_menu_simple_rename",
		displayDesc = "MENU_EMBLEM_RENAME_DESC",
		action = CoD.CraftUtility.EmblemRename,
		disabled = false
	} )
	if CanShowMediaManager() then
		table.insert( f705_local0, {
			displayText = "MENU_MEDIA_MANAGER",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_MEDIA_MANAGER_DESC",
			action = GoBackAndOpenMediaManagerOnParent,
			param = "emblem",
			disabled = false
		} )
	end
	local f705_local7 = {}
	for f705_local11, f705_local12 in ipairs( f705_local0 ) do
		table.insert( f705_local7, {
			models = {
				displayText = f705_local12.displayText,
				icon = f705_local12.displayImage,
				description = f705_local12.displayDesc,
				action = f705_local12.action,
				param = f705_local12.param
			},
			properties = {
				disabled = f705_local12.disabled
			}
		} )
	end
	return f705_local7
end )
DataSources.PaintjobOptionsButtonList = ListHelper_SetupDataSource( "PaintjobOptionsButtonList", function ( f706_arg0 )
	local f706_local0 = {}
	local f706_local1 = false
	local f706_local2 = false
	local f706_local3 = false
	local f706_local4 = CraftSlotsFullByStorageType( f706_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS )
	local f706_local5 = CoD.perController[f706_arg0].selectedpaintjobModel
	if f706_local5 then
		local f706_local6 = Engine.GetModel( f706_local5, "readOnly" )
		if f706_local6 then
			local f706_local7 = Engine.GetModelValue( f706_local6 )
			if f706_local7 and f706_local7 == 1 then
				f706_local3 = true
			end
		end
	end
	if f706_local4 == true or f706_local3 == true then
		f706_local1 = true
	end
	local f706_local6 = "MENU_PAINTJOB_PUBLISH_DESC"
	if f706_local3 == true then
		f706_local2 = true
		f706_local6 = "MENU_CANNOT_PUBLISH_DOWNLOADED_DESC"
	end
	if isFileshareFeatureEnabled() then
		table.insert( f706_local0, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = f706_local6,
			action = CoD.CraftUtility.OpenPublishPromptPaintjob,
			disabled = f706_local2
		} )
	end
	table.insert( f706_local0, {
		displayText = "MENU_DELETE",
		displayImage = "t7_icon_menu_simple_delete",
		displayDesc = "MENU_PAINTJOB_DELETE_DESC",
		action = CoD.CraftUtility.PaintjobClear,
		disabled = false
	} )
	table.insert( f706_local0, {
		displayText = "MENU_COPY",
		displayImage = "t7_icon_menu_simple_copy",
		displayDesc = "MENU_PAINTJOB_COPY_DESC",
		action = PaintjobSelector_CopyPaintjob,
		disabled = f706_local1
	} )
	table.insert( f706_local0, {
		displayText = "MENU_RENAME",
		displayImage = "t7_icon_menu_simple_rename",
		displayDesc = "MENU_PAINTJOB_RENAME_DESC",
		action = CoD.CraftUtility.PaintjobRename,
		disabled = false
	} )
	if CanShowMediaManager() then
		table.insert( f706_local0, {
			displayText = "MENU_MEDIA_MANAGER",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_MEDIA_MANAGER_DESC",
			action = GoBackAndOpenMediaManagerOnParent,
			param = "paintjob",
			disabled = false
		} )
	end
	if Engine.IsSteamWorkshopEnabled() then
		table.insert( f706_local0, {
			displayText = "PLATFORM_STEAM_PUBLISH",
			displayImage = "",
			displayDesc = "PLATFORM_STEAM_PUBLISH_DESC",
			action = CoD.CraftUtility.OpenSteamPublishPromptPaintjob
		} )
	end
	local f706_local7 = {}
	for f706_local11, f706_local12 in ipairs( f706_local0 ) do
		table.insert( f706_local7, {
			models = {
				displayText = f706_local12.displayText,
				icon = f706_local12.displayImage,
				description = f706_local12.displayDesc,
				action = f706_local12.action,
				param = f706_local12.param
			},
			properties = {
				disabled = f706_local12.disabled
			}
		} )
	end
	return f706_local7
end )
DataSources.PaintjobLayerOptionsButtonList = ListHelper_SetupDataSource( "PaintjobLayerOptionsButtonList", function ( f707_arg0 )
	local f707_local0 = IsGridOn( f707_arg0, CoD.CraftUtility.GetGridTypeName( f707_arg0 ) )
	local f707_local1 = "MENU_EMBLEM_TURN_GRID_ON"
	local f707_local2 = "MENU_EMBLEM_TURN_GRID_ON_HINT"
	if f707_local0 then
		f707_local1 = "MENU_EMBLEM_TURN_GRID_OFF"
		f707_local2 = "MENU_EMBLEM_TURN_GRID_OFF_HINT"
	end
	local f707_local3 = {
		{
			displayText = f707_local1,
			displayImage = "",
			displayDesc = f707_local2,
			action = PaintjobEditor_ToggleGrid,
			disabled = false
		}
	}
	local f707_local4 = {}
	for f707_local8, f707_local9 in ipairs( f707_local3 ) do
		table.insert( f707_local4, {
			models = {
				displayText = f707_local9.displayText,
				icon = f707_local9.displayImage,
				description = f707_local9.displayDesc,
				action = f707_local9.action
			},
			properties = {
				disabled = f707_local9.disabled
			}
		} )
	end
	return f707_local4
end )
DataSources.GunsmithSnapshotModeButtonList = ListHelper_SetupDataSource( "GunsmithSnapshotModeButtonList", function ( f708_arg0 )
	local f708_local0 = {}
	table.insert( f708_local0, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_statssingle",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_STATS",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.Stats"
	} )
	table.insert( f708_local0, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_weaponlevel",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_WEAPON_LEVEL",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.WeaponLevel"
	} )
	table.insert( f708_local0, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_player",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_PLAYERID",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.PlayerID"
	} )
	table.insert( f708_local0, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_weaponname",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_WEAPON_NAME",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.WeaponName"
	} )
	table.insert( f708_local0, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_opticattach",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_ATTACHMENTS",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.AttachmentIcons"
	} )
	table.insert( f708_local0, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_bo3logo",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_BO3LOGO",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.BO3Logo"
	} )
	local f708_local1 = {}
	for f708_local5, f708_local6 in ipairs( f708_local0 ) do
		table.insert( f708_local1, {
			models = {
				displayText = f708_local6.displayText,
				icon = f708_local6.displayImage,
				description = f708_local6.displayDesc,
				action = f708_local6.action,
				param = f708_local6.visibilityModelName
			},
			properties = {
				disabled = f708_local6.disabled
			}
		} )
	end
	return f708_local1
end )
DataSources.MediaManagerPaintjobList = {
	prepare = function ( f709_arg0, f709_arg1, f709_arg2 )
		f709_arg1.controller = f709_arg0
		f709_arg1.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( f709_arg0 ), "MediaManager.PaintjobList" )
		f709_arg1.totalPaintjobs = 0
		f709_arg1.paintjobList = {}
		local f709_local0 = {
			isBuyMore = true,
			sortIndex = 0,
			weaponIndex = 0,
			paintjobSlot = 0,
			paintjobIndex = 0
		}
		if FileshareCanBuyMoreSlots( f709_arg0 ) == true then
			table.insert( f709_arg1.paintjobList, f709_local0 )
			f709_arg1.totalPaintjobs = f709_arg1.totalPaintjobs + 1
		end
		for f709_local4, f709_local5 in pairs( CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList() ) do
			if f709_local5.weaponIndex ~= 0 then
				table.insert( f709_arg1.paintjobList, f709_local5 )
				f709_arg1.totalPaintjobs = f709_arg1.totalPaintjobs + 1
			end
		end
	end,
	getCount = function ( f710_arg0 )
		return f710_arg0.totalPaintjobs
	end,
	getItem = function ( f711_arg0, f711_arg1, f711_arg2 )
		local f711_local0 = Engine.CreateModel( f711_arg1.paintjobListModel, "mm_paintjob_" .. f711_arg2 )
		local f711_local1 = f711_arg1.paintjobList[f711_arg2]
		if f711_local1 then
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "showBuyImage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "isBuyMore" ), false )
			if f711_local1.isBuyMore ~= nil and f711_local1.isBuyMore == true then
				Engine.SetModelValue( Engine.CreateModel( f711_local0, "isBuyMore" ), true )
				Engine.SetModelValue( Engine.CreateModel( f711_local0, "showBuyImage" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( f711_local0, "sortIndex" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( f711_local0, "paintjobName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
				Engine.SetModelValue( Engine.CreateModel( f711_local0, "plusImageSrc" ), "uie_t7_icon_codpoints" )
			end
			if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( f711_local1.paintjobSlot, f711_local1.paintjobIndex ) then
				Engine.SetModelValue( Engine.CreateModel( f711_local0, "paintjobName" ), f711_local1.paintjobName )
				Engine.SetModelValue( Engine.CreateModel( f711_local0, "paintjobTextEntry" ), f711_local1.paintjobName )
			end
			if f711_local1.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
				CoD.SetCustomization( f711_arg0, f711_local1.weaponIndex, "weapon_index" )
			end
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "sortIndex" ), f711_local1.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "weaponIndex" ), f711_local1.weaponIndex )
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "paintjobSlot" ), f711_local1.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "paintjobIndex" ), f711_local1.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "paintjobSlotAndIndex" ), f711_local1.paintjobSlot .. " " .. f711_local1.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "authorName" ), Engine.GetSelfGamertag( f711_arg0 ) )
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "createTime" ), f711_local1.createTime )
			local f711_local2 = ""
			if f711_local1.weaponIndex ~= nil then
				f711_local2 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f711_local1.weaponIndex ) ) )
			end
			Engine.SetModelValue( Engine.CreateModel( f711_local0, "weaponName" ), f711_local2 )
			return f711_local0
		else
			
		end
	end
}
DataSources.MediaManagerVariantList = {
	prepare = function ( f712_arg0, f712_arg1, f712_arg2 )
		f712_arg1.controller = f712_arg0
		f712_arg1.variantListModel = Engine.CreateModel( Engine.GetModelForController( f712_arg0 ), "MediaManager.VariantList" )
		f712_arg1.totalVariants = 0
		f712_arg1.variantList = {}
		local f712_local0 = {
			isBuyMore = true,
			sortIndex = 0,
			weaponIndex = 0,
			paintjobSlot = 0,
			paintjobIndex = 0
		}
		if FileshareCanBuyMoreSlots( f712_arg0 ) == true then
			table.insert( f712_arg1.variantList, f712_local0 )
			f712_arg1.totalVariants = f712_arg1.totalVariants + 1
		end
		for f712_local4, f712_local5 in pairs( CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList() ) do
			if f712_local5.weaponIndex ~= 0 then
				table.insert( f712_arg1.variantList, f712_local5 )
				f712_arg1.totalVariants = f712_arg1.totalVariants + 1
			end
		end
	end,
	getCount = function ( f713_arg0 )
		return f713_arg0.totalVariants
	end,
	createVariantModel = function ( f714_arg0, f714_arg1, f714_arg2, f714_arg3, f714_arg4 )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "variantIndex" ), f714_arg2.variantIndex )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "weaponIndex" ), f714_arg2.weaponIndex )
		if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f714_arg2.variantIndex ) then
			Engine.SetModelValue( Engine.CreateModel( f714_arg4, "variantName" ), f714_arg2.variantName )
			Engine.SetModelValue( Engine.CreateModel( f714_arg4, "variantNameBig" ), f714_arg2.variantName )
		else
			Engine.SetModelValue( Engine.CreateModel( f714_arg4, "variantName" ), Engine.Localize( "MENU_GUNSMITH_CREATE_VARIANT" ) )
			Engine.SetModelValue( Engine.CreateModel( f714_arg4, "variantNameBig" ), "" )
		end
		for f714_local3, f714_local4 in ipairs( f714_arg2.attachment ) do
			Engine.SetModelValue( Engine.CreateModel( f714_arg4, "attachment" .. f714_local3 ), f714_local4 )
		end
		for f714_local3, f714_local4 in ipairs( f714_arg2.attachmentVariant ) do
			Engine.SetModelValue( Engine.CreateModel( f714_arg4, "attachmentVariant" .. f714_local3 ), f714_local4 )
		end
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "sortIndex" ), f714_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "paintjobSlot" ), f714_arg2.paintjobSlot )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "paintjobIndex" ), f714_arg2.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "camoIndex" ), f714_arg2.camoIndex )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "paintjobSlotAndIndex" ), f714_arg2.paintjobSlot .. " " .. f714_arg2.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "authorName" ), Engine.GetSelfGamertag( f714_arg0 ) )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "createTime" ), f714_arg2.createTime )
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "showBuyImage" ), 0 )
		f714_local0 = ""
		if f714_arg2.weaponIndex ~= nil then
			f714_local0 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f714_arg2.weaponIndex ) ) )
		end
		Engine.SetModelValue( Engine.CreateModel( f714_arg4, "weaponName" ), f714_local0 )
	end,
	getItem = function ( f715_arg0, f715_arg1, f715_arg2 )
		local f715_local0 = Engine.CreateModel( f715_arg1.variantListModel, "mm_variant_" .. f715_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f715_local0, "isBuyMore" ), false )
		Engine.SetModelValue( Engine.CreateModel( f715_local0, "showBuyImage" ), 0 )
		if f715_arg1.variantList[f715_arg2].isBuyMore == true then
			Engine.SetModelValue( Engine.CreateModel( f715_local0, "isBuyMore" ), true )
			Engine.SetModelValue( Engine.CreateModel( f715_local0, "showBuyImage" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f715_local0, "sortIndex" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f715_local0, "variantName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( f715_local0, "plusImageSrc" ), "uie_t7_icon_codpoints" )
		else
			DataSources.MediaManagerVariantList.createVariantModel( f715_arg0, f715_arg2, CoD.CraftUtility.Gunsmith.GetVariantByIndex( f715_arg0, f715_arg1.variantList[f715_arg2].variantIndex ), f715_arg1.variantList[f715_arg2].sortIndex, f715_local0 )
		end
		return f715_local0
	end
}
DataSources.ShowcaseEmblemList = {
	prepare = function ( f716_arg0, f716_arg1, f716_arg2 )
		f716_arg1.controller = f716_arg0
		f716_arg1.emblemListModel = Engine.CreateModel( Engine.GetModelForController( f716_arg0 ), "MediaManager.ShowcaseEmblemList" )
		f716_arg1.totalEmblems = 0
		f716_arg1.emblemList = {}
		for f716_local3, f716_local4 in pairs( CoD.CraftUtility.Emblems.GetSortedEmblemsList( f716_arg0, CoD.perController[f716_arg0].selectedEmblemTabStorageType ) ) do
			if f716_local4.isUsed ~= 0 then
				table.insert( f716_arg1.emblemList, f716_local4 )
				f716_arg1.totalEmblems = f716_arg1.totalEmblems + 1
			end
		end
	end,
	getCount = function ( f717_arg0 )
		CoD.FileshareUtility.SetItemsCount( f717_arg0.controller, f717_arg0.totalEmblems )
		return f717_arg0.totalEmblems
	end,
	getItem = function ( f718_arg0, f718_arg1, f718_arg2 )
		local f718_local0 = Engine.CreateModel( f718_arg1.emblemListModel, "mm_emblem_" .. f718_arg2 )
		local f718_local1 = f718_arg1.emblemList[f718_arg2]
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "isBuyMore" ), false )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "showBuyImage" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "emblemTitle" ), f718_local1.emblemTitle )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "emblemName" ), f718_local1.emblemName )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "emblemIndex" ), f718_local1.emblemIndex )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "emblemTextEntry" ), f718_local1.emblemTextEntry )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "subTitle" ), f718_local1.subTitle )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "storageFileType" ), CoD.perController[f718_arg0].selectedEmblemTabStorageType )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "isUsed" ), f718_local1.isUsed )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "showBuyImage" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "readOnly" ), f718_local1.readOnly )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "isBMClassified" ), false )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "sortIndex" ), f718_local1.sortIndex )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "hintText" ), Engine.Localize( "MENU_BUTTON_EMBLEM_SET" ) )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "authorName" ), Engine.GetSelfGamertag( f718_arg0 ) )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "createTime" ), f718_local1.createTime )
		Engine.SetModelValue( Engine.CreateModel( f718_local0, "plusImageSrc" ), "uie_t7_icon_codpoints" )
		return f718_local0
	end
}
DataSources.MediaManagerEmblemList = {
	prepare = function ( f719_arg0, f719_arg1, f719_arg2 )
		f719_arg1.controller = f719_arg0
		f719_arg1.emblemListModel = Engine.CreateModel( Engine.GetModelForController( f719_arg0 ), "MediaManager.EmblemList" )
		f719_arg1.totalEmblems = 0
		f719_arg1.emblemList = {}
		local f719_local0 = {
			isBuyMore = true,
			sortIndex = 0,
			emblemIndex = 0,
			isUsed = 1
		}
		if FileshareCanBuyMoreSlots( f719_arg0 ) == true then
			table.insert( f719_arg1.emblemList, f719_local0 )
			f719_arg1.totalEmblems = f719_arg1.totalEmblems + 1
		end
		for f719_local4, f719_local5 in pairs( CoD.CraftUtility.Emblems.GetSortedEmblemsList( f719_arg0, CoD.perController[f719_arg0].selectedEmblemTabStorageType ) ) do
			if f719_local5.isUsed ~= 0 then
				table.insert( f719_arg1.emblemList, f719_local5 )
				f719_arg1.totalEmblems = f719_arg1.totalEmblems + 1
			end
		end
	end,
	getCount = function ( f720_arg0 )
		return f720_arg0.totalEmblems
	end,
	getItem = function ( f721_arg0, f721_arg1, f721_arg2 )
		local f721_local0 = Engine.CreateModel( f721_arg1.emblemListModel, "mm_emblem_" .. f721_arg2 )
		local f721_local1 = f721_arg1.emblemList[f721_arg2]
		if f721_local1.isBuyMore and f721_local1.isBuyMore == true then
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "isBuyMore" ), true )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "showBuyImage" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "sortIndex" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "emblemName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "emblemTitle" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "isUsed" ), false )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "plusImageSrc" ), "uie_t7_icon_codpoints" )
		else
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "isBuyMore" ), false )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "showBuyImage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "emblemTitle" ), f721_local1.emblemTitle )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "emblemName" ), f721_local1.emblemName )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "emblemIndex" ), f721_local1.emblemIndex )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "emblemTextEntry" ), f721_local1.emblemTextEntry )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "subTitle" ), f721_local1.subTitle )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "storageFileType" ), CoD.perController[f721_arg0].selectedEmblemTabStorageType )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "isUsed" ), f721_local1.isUsed )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "showBuyImage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "readOnly" ), f721_local1.readOnly )
			Engine.SetModelValue( Engine.CreateModel( f721_local0, "isBMClassified" ), false )
		end
		Engine.SetModelValue( Engine.CreateModel( f721_local0, "sortIndex" ), f721_local1.sortIndex )
		Engine.SetModelValue( Engine.CreateModel( f721_local0, "hintText" ), Engine.Localize( "MENU_BUTTON_EMBLEM_SET" ) )
		Engine.SetModelValue( Engine.CreateModel( f721_local0, "authorName" ), Engine.GetSelfGamertag( f721_arg0 ) )
		Engine.SetModelValue( Engine.CreateModel( f721_local0, "createTime" ), f721_local1.createTime )
		return f721_local0
	end
}
DataSources.MediaManagerCustomGamesList = {
	prepare = function ( f722_arg0, f722_arg1, f722_arg2 )
		f722_arg1.showDefault = false
		f722_arg1.controller = f722_arg0
		f722_arg1.rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		f722_arg1.numFiles = Engine.GetCustomGamesCount( f722_arg0, "" )
		f722_arg1.communityOption = false
		if f722_arg1.showDefault == true then
			f722_arg1.numFiles = f722_arg1.numFiles + 1
		elseif IsMediaManager() and FileshareCanBuyMoreSlots( f722_arg0 ) == true then
			f722_arg1.numFiles = f722_arg1.numFiles + 1
		end
	end,
	getCount = function ( f723_arg0 )
		if FileshareGetShowcasePublishMode( controller ) then
			CoD.FileshareUtility.SetItemsCount( f723_arg0.controller, f723_arg0.numFiles )
		end
		return f723_arg0.numFiles
	end,
	getItem = function ( f724_arg0, f724_arg1, f724_arg2 )
		local f724_local0 = Engine.CreateModel( f724_arg1.rootModel, "mm_customgames_" .. f724_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f724_local0, "uiIndex" ), f724_arg2 )
		if f724_arg1.showDefault == true and f724_arg2 == 1 then
			local f724_local1 = Engine.GetGametypesBase()
			local f724_local2 = GetCurrentUIGameType( f724_arg0 )
			local f724_local3 = ""
			for f724_local7, f724_local8 in pairs( f724_local1 ) do
				if f724_local8.category == "standard" and f724_local8.gametype == f724_local2 then
					f724_local3 = Engine.Localize( f724_local8.name )
					break
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "isBuyMore" ), false )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "showBuyImage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "text" ), f724_local3 )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "inUse" ), true )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "isOfficial" ), true )
		elseif IsMediaManager() and FileshareCanBuyMoreSlots( f724_arg0 ) == true and f724_arg2 == 1 then
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "isBuyMore" ), true )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "showBuyImage" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "name" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "gameName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "text" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "gameDescription" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "plusImageSrc" ), "uie_t7_icon_codpoints" )
		else
			local f724_local1 = 1
			if f724_arg1.showDefault == true then
				f724_local1 = 2
			elseif IsMediaManager() and FileshareCanBuyMoreSlots( f724_arg0 ) == true then
				f724_local1 = 2
			end
			local f724_local2 = Engine.GetCustomGameData( f724_arg0, f724_arg2 - f724_local1, "" )
			local f724_local3 = f724_local2.gameName
			local f724_local4 = f724_local2.gameDescription
			if f724_local2.isOfficial then
				f724_local3 = Engine.Localize( f724_local2.gameName )
				f724_local4 = Engine.Localize( f724_local2.gameDescription )
			end
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "isBuyMore" ), false )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "showBuyImage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "name" ), f724_local3 )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "gameName" ), f724_local3 )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "text" ), f724_local3 )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "gameDescription" ), f724_local4 )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "slot" ), f724_local2.slot )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "index" ), f724_local2.index )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "inUse" ), f724_local2.inUse )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "isOfficial" ), f724_local2.isOfficial )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "createTime" ), f724_local2.createTime )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "gameType" ), f724_local2.gameType )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "gameTypeString" ), f724_local2.gameTypeString )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "image" ), Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f724_local2.gameType, "image" ) )
			Engine.SetModelValue( Engine.CreateModel( f724_local0, "description" ), Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", f724_local2.gameType, "description" ) )
		end
		return f724_local0
	end
}
DataSources.MediaManagerTheaterFilesList = {
	prepare = function ( f725_arg0, f725_arg1, f725_arg2 )
		f725_arg1.controller = f725_arg0
		f725_arg1.rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManagerTheaterFilesRoot" )
		f725_arg1.numElements = f725_arg1.vCount * f725_arg1.hCount
		f725_arg1.numFiles = 0
		f725_arg1.fileshareData = {}
		for f725_local0 = 1, f725_arg1.numElements, 1 do
			f725_arg1.fileshareData[f725_local0] = {}
			f725_arg1.fileshareData[f725_local0].elementModel = Engine.CreateModel( f725_arg1.rootModel, "fileshareData_" .. f725_local0 )
			for f725_local6, f725_local7 in ipairs( CoD.FileshareUtility.FileProperties ) do
				Engine.CreateModel( f725_arg1.fileshareData[f725_local0].elementModel, f725_local7 )
			end
			CoD.FileshareUtility.ResetFileshareSummary( f725_arg1.fileshareData[f725_local0].elementModel )
		end
		Engine.FileshareStartup( f725_arg0 )
		CoD.FileshareUtility.FetchContentForUser( f725_arg0, Engine.GetXUID64( f725_arg0 ) )
	end,
	getCount = function ( f726_arg0 )
		local f726_local0 = false
		local f726_local1 = CoD.FileshareUtility.GetCurrentCategory()
		local f726_local2, f726_local3 = CoD.FileshareUtility.GetCurrentFilter()
		local f726_local4 = f726_arg0.controller
		if f726_arg0.numElements == nil or f726_local1 == nil then
			f726_local0 = true
		elseif not Engine.FileshareIsReady( f726_local4 ) then
			if not f726_arg0.refreshElement then
				f726_arg0.refreshElement = LUI.UITimer.newElementTimer( 500, false, function ()
					if Engine.FileshareIsReady( f726_local4 ) then
						f726_arg0:updateDataSource()
						f726_arg0.refreshElement:close()
						f726_arg0.refreshElement = nil
						CoD.FileshareUtility.SetFileshareReady( 1 )
					end
				end )
				f726_arg0:addElement( f726_arg0.refreshElement )
			end
			f726_local0 = true
		end
		if f726_local0 == true then
			f726_arg0.numFiles = 0
		else
			f726_arg0.numFiles = Engine.FileshareGetSlotCount( f726_local4, f726_local1, f726_local2, f726_local3 )
			if FileshareCanBuyMoreSlots( f726_local4 ) == true then
				f726_arg0.numFiles = f726_arg0.numFiles + 1
			end
		end
		CoD.FileshareUtility.SetItemsCount( f726_local4, f726_arg0.numFiles )
		return f726_arg0.numFiles
	end,
	getItem = function ( f728_arg0, f728_arg1, f728_arg2 )
		local f728_local0 = f728_arg2 - 1
		local f728_local1 = f728_local0 % f728_arg1.numElements + 1
		local f728_local2 = f728_arg2 % f728_arg1.numElements
		if FileshareCanBuyMoreSlots( f728_arg0 ) == true then
			f728_local0 = f728_local0 - 1
		end
		local f728_local3 = f728_arg1.fileshareData[f728_local1].elementModel
		Engine.SetModelValue( Engine.CreateModel( f728_local3, "uiModelIndex" ), f728_local1 )
		Engine.SetModelValue( Engine.GetModel( f728_local3, "codeIndex" ), f728_local0 )
		Engine.SetModelValue( Engine.GetModel( f728_local3, "totalItems" ), f728_arg1.numFiles )
		Engine.SetModelValue( Engine.GetModel( f728_local3, "fileID" ), nil )
		if FileshareCanBuyMoreSlots( f728_arg0 ) == true and f728_arg2 == 1 then
			Engine.SetModelValue( Engine.CreateModel( f728_local3, "isBuyMore" ), true )
			Engine.SetModelValue( Engine.GetModel( f728_local3, "showPlusImage" ), 1 )
			Engine.SetModelValue( Engine.GetModel( f728_local3, "fileName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.GetModel( f728_local3, "plusImageSrc" ), "uie_t7_icon_codpoints" )
		else
			Engine.SetModelValue( Engine.CreateModel( f728_local3, "isBuyMore" ), false )
			Engine.SetModelValue( Engine.GetModel( f728_local3, "showPlusImage" ), 0 )
			local f728_local4 = CoD.FileshareUtility.GetCurrentCategory()
			local f728_local5 = CoD.FileshareUtility.GetIsCommunityMode( f728_arg1.controller )
			local f728_local6, f728_local7 = CoD.FileshareUtility.GetCurrentFilter()
			local f728_local8 = Engine.FileshareGetSlotData( f728_arg1.controller, f728_local4, f728_local6, f728_local7, f728_local0 )
			CoD.FileshareUtility.SetCategoryCurrentPage( f728_arg0, f728_local4, f728_local0 )
			for f728_local12, f728_local13 in ipairs( CoD.FileshareUtility.FileProperties ) do
				if f728_local8[f728_local13] ~= nil then
					Engine.SetModelValue( Engine.GetModel( f728_local3, f728_local13 ), f728_local8[f728_local13] )
				end
			end
			CoD.FileshareUtility.SetupDefaultNameAndDescription( f728_local3 )
			if f728_local4 == "screenshot_private" or f728_local4 == "screenshot" or f728_local4 == "clip_private" or f728_local4 == "clip" then
				Engine.AddThumbnail( f728_arg0, Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_THUMBNAIL, f728_local8.fileId, f728_local8.fileSummarySize )
			end
		end
		return f728_local3
	end
}
DataSources.MediaManager = {
	getModel = function ( f729_arg0 )
		return Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager" )
	end
}
DataSources.MediaManagerSelectedPaintjob = {
	getModel = function ( f730_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f730_arg0 ), "MediaManagerSelectedPaintjob" )
	end
}
DataSources.MediaManagerSelectedVariant = {
	getModel = function ( f731_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f731_arg0 ), "MediaManagerSelectedVariant" )
	end
}
DataSources.MediaManagerSelectedEmblem = {
	getModel = function ( f732_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f732_arg0 ), "MediaManagerSelectedEmblem" )
	end
}
DataSources.MediaManagerSlotsFullButtonList = {
	prepare = function ( f733_arg0, f733_arg1, f733_arg2 )
		local f733_local0 = function ( f734_arg0, f734_arg1, f734_arg2, f734_arg3, f734_arg4 )
			OpenPurchaseExtraSlotsOverlay( f734_arg0, f734_arg2, GoBack( f734_arg0, f734_arg2 ) )
		end
		
		local f733_local1 = {}
		if MediaManagerSlotsAvailable( f733_arg0, CoD.FileshareUtility.GetCurrentCategory() ) == false then
			if CanShowMediaManager() then
				table.insert( f733_local1, {
					displayText = "MENU_MEDIA_MANAGER",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = GoBackAndOpenMediaManagerOnParent
				} )
			end
			if FileshareCanBuyMoreSlots( f733_arg0 ) == true then
				table.insert( f733_local1, {
					displayText = "MENU_FILESHARE_BUY_SLOTS",
					displayImage = "",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = f733_local0,
					param = "MediaManager"
				} )
			end
		end
		local f733_local2 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSlotsFullButtonList" ), "list" )
		f733_arg1.optionModels = {}
		for f733_local6, f733_local7 in ipairs( f733_local1 ) do
			f733_arg1.optionModels[f733_local6] = Engine.CreateModel( f733_local2, "mm_buttonModel_" .. f733_local6 )
			Engine.SetModelValue( Engine.CreateModel( f733_arg1.optionModels[f733_local6], "displayText" ), Engine.ToUpper( Engine.Localize( f733_local7.displayText ) ) )
			Engine.SetModelValue( Engine.CreateModel( f733_arg1.optionModels[f733_local6], "displayImage" ), f733_local7.displayImage )
			Engine.SetModelValue( Engine.CreateModel( f733_arg1.optionModels[f733_local6], "hintText" ), Engine.Localize( f733_local7.displayDesc ) )
			Engine.SetModelValue( Engine.CreateModel( f733_arg1.optionModels[f733_local6], "action" ), f733_local7.action )
			Engine.SetModelValue( Engine.CreateModel( f733_arg1.optionModels[f733_local6], "param" ), f733_local7.param )
		end
	end,
	getCount = function ( f735_arg0 )
		return #f735_arg0.optionModels
	end,
	getItem = function ( f736_arg0, f736_arg1, f736_arg2 )
		return f736_arg1.optionModels[f736_arg2]
	end
}
DataSources.PaintjobList = {
	prepare = function ( f737_arg0, f737_arg1, f737_arg2 )
		f737_arg1.controller = f737_arg0
		local f737_local0 = CoD.GetCustomization( f737_arg0, "weapon_index" )
		if not f737_local0 then
			return 
		end
		f737_arg1.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( f737_arg0 ), "Paintshop.PaintjobList" )
		local f737_local1 = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
		local f737_local2 = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( f737_local0 )
		if f737_local1 == CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f737_arg0 ) then
			f737_arg1.totalPaintjobs = f737_local2
		else
			f737_arg1.totalPaintjobs = f737_local2 + 1
		end
		f737_arg1.paintjobList = {}
		f737_arg1.paintjobList = CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList( f737_local0 )
	end,
	getCount = function ( f738_arg0 )
		return f738_arg0.totalPaintjobs
	end,
	getItem = function ( f739_arg0, f739_arg1, f739_arg2 )
		local f739_local0 = Engine.CreateModel( f739_arg1.paintjobListModel, "paintjob_" .. f739_arg2 )
		local f739_local1 = CoD.GetCustomization( f739_arg0, "weapon_index" )
		local f739_local2 = f739_arg1.paintjobList[f739_arg2]
		if f739_local2 then
			if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( f739_local2.paintjobSlot, f739_local2.paintjobIndex ) then
				Engine.SetModelValue( Engine.CreateModel( f739_local0, "paintjobName" ), f739_local2.paintjobName )
				Engine.SetModelValue( Engine.CreateModel( f739_local0, "paintjobTextEntry" ), f739_local2.paintjobName )
			else
				Engine.SetModelValue( Engine.CreateModel( f739_local0, "paintjobTextEntry" ), "Paintjob" )
				Engine.SetModelValue( Engine.CreateModel( f739_local0, "paintjobName" ), "" )
			end
			if f739_local2.readOnly ~= nil then
				Engine.SetModelValue( Engine.CreateModel( f739_local0, "readOnly" ), f739_local2.readOnly )
			end
			Engine.SetModelValue( Engine.CreateModel( f739_local0, "sortIndex" ), f739_local2.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( f739_local0, "paintjobSlot" ), f739_local2.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( f739_local0, "weaponIndex" ), f739_local1 )
			Engine.SetModelValue( Engine.CreateModel( f739_local0, "paintjobIndex" ), f739_local2.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( f739_local0, "paintjobSlotAndIndex" ), f739_local2.paintjobSlot .. " " .. f739_local2.paintjobIndex )
			return f739_local0
		else
			
		end
	end
}
DataSources.EmblemsList = {
	prepare = function ( f740_arg0, f740_arg1, f740_arg2 )
		f740_arg1.controller = f740_arg0
		f740_arg1.emblemList = {}
		local f740_local0 = CoD.perController[f740_arg0].selectedEmblemTabStorageType
		f740_arg1.emblemListModel = Engine.CreateModel( Engine.GetModelForController( f740_arg0 ), "Emblem.EmblemList" )
		local f740_local1 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f740_arg0, f740_local0 )
		local f740_local2 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f740_arg0, f740_local0 )
		if f740_local0 == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS or f740_local0 == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT or SelectingGroupEmblem( f740_arg0 ) then
			f740_arg1.totalEmblems = f740_local1
		else
			f740_arg1.totalEmblems = f740_local1 + 1
		end
		f740_arg1.emblemList = CoD.CraftUtility.Emblems.GetSortedEmblemsList( f740_arg0, CoD.perController[f740_arg0].selectedEmblemTabStorageType )
		if #f740_arg1.emblemList < f740_arg1.totalEmblems then
			f740_arg1.totalEmblems = #f740_arg1.emblemList
		end
	end,
	getCount = function ( f741_arg0 )
		return f741_arg0.totalEmblems
	end,
	getItem = function ( f742_arg0, f742_arg1, f742_arg2 )
		local f742_local0 = Engine.CreateModel( f742_arg1.emblemListModel, "emblem_" .. f742_arg2 )
		local f742_local1 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f742_arg0, CoD.perController[f742_arg0].selectedEmblemTabStorageType )
		local f742_local2 = function ( f743_arg0 )
			if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( f743_arg0.emblemIndex ) then
				f743_arg0.emblemTextEntry = f743_arg0.emblemName
				if CoD.perController[f742_arg0].selectedEmblemTabStorageType ~= Enum.StorageFileType.STORAGE_EMBLEMS then
					f743_arg0.emblemTextEntry = "Emblem"
				end
				f743_arg0.emblemTitle = f743_arg0.emblemName
				f743_arg0.subTitle = ""
			else
				f743_arg0.emblemName = Engine.Localize( "MENU_EMBLEM_CREATE_NEW" )
				f743_arg0.emblemTitle = Engine.Localize( "MENU_NEW" )
				f743_arg0.emblemTextEntry = "Emblem"
				f743_arg0.subTitle = Engine.Localize( "MENU_EMBLEM_NEW_SUBTITLE" )
			end
		end
		
		local f742_local3 = f742_arg1.emblemList[f742_arg2]
		f742_local2( f742_local3 )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "isNonClickableEmblem" ), 0 )
		if #f742_arg1.emblemList == f742_local1 + 1 and f742_arg2 == 1 then
			Engine.SetModelValue( Engine.CreateModel( f742_local0, "isNonClickableEmblem" ), 1 )
			f742_local3.emblemTitle = Engine.Localize( "MENU_NEW" )
			f742_local3.emblemName = Engine.Localize( "MENU_EMBLEM_CREATE_NEW" )
			f742_local3.emblemTextEntry = "Emblem"
			f742_local3.subTitle = Engine.Localize( "MENU_EMBLEM_FULL_SUBTITLE" )
		end
		local f742_local4 = Engine.CreateModel( f742_local0, "rarityType" )
		if CoD.perController[f742_arg0].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
			local f742_local5 = CoD.BlackMarketUtility.GetLootEmblemIDName( f742_local3.emblemIndex )
			local f742_local6 = CoD.BlackMarketUtility.IsItemLocked( f742_arg0, f742_local5 )
			Engine.SetModelValue( Engine.CreateModel( f742_local0, "isBMClassified" ), f742_local6 )
			if f742_local6 then
				f742_local3.subTitle = Engine.Localize( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_EMBLEM" )
				f742_local3.emblemName = CoD.BlackMarketUtility.ClassifiedName( true )
				f742_local3.emblemTitle = CoD.BlackMarketUtility.ClassifiedName( true )
			end
			Engine.SetModelValue( Engine.CreateModel( f742_local4, "duplicateCount" ), CoD.BlackMarketUtility.GetItemQuantity( f742_arg0, f742_local5 ) )
		else
			Engine.SetModelValue( Engine.CreateModel( f742_local0, "isBMClassified" ), false )
			Engine.SetModelValue( Engine.CreateModel( f742_local4, "duplicateCount" ), 0 )
		end
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "emblemTitle" ), f742_local3.emblemTitle )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "emblemName" ), f742_local3.emblemName )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "emblemTextEntry" ), f742_local3.emblemTextEntry )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "subTitle" ), f742_local3.subTitle )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "sortIndex" ), f742_local3.sortIndex )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "emblemIndex" ), f742_local3.emblemIndex )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "isUsed" ), f742_local3.isUsed )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "hintText" ), Engine.Localize( "MENU_BUTTON_EMBLEM_SET" ) )
		Engine.SetModelValue( Engine.CreateModel( f742_local0, "storageFileType" ), CoD.perController[f742_arg0].selectedEmblemTabStorageType )
		if CoD.isPC and not Engine.LastInput_Gamepad() then
			Engine.SetModelValue( Engine.CreateModel( f742_local0, "hintText" ), Engine.Localize( "PLATFORM_KEY_EMBLEM_SET" ) )
		end
		if f742_local3.readOnly ~= nil then
			Engine.SetModelValue( Engine.CreateModel( f742_local0, "readOnly" ), f742_local3.readOnly )
		end
		return f742_local0
	end,
	cleanup = function ( f744_arg0 )
		if f744_arg0.emblemListModel then
			Engine.UnsubscribeAndFreeModel( f744_arg0.emblemListModel )
			f744_arg0.emblemListModel = nil
		end
	end
}
DataSources.ChallengesCPCategoryStats = {
	init = function ( f745_arg0 )
		local f745_local0 = Engine.GetChallengeInfoForImages( f745_arg0, nil, Enum.eModes.MODE_CAMPAIGN )
		local f745_local1 = 0
		local f745_local2 = 0
		local f745_local3 = {}
		for f745_local7, f745_local8 in ipairs( f745_local0 ) do
			local f745_local9 = f745_local8.challengeCategory
			if not f745_local8.isMastery then
				if not f745_local3[f745_local9] then
					f745_local3[f745_local9] = {}
					f745_local3[f745_local9].numComplete = 0
					f745_local3[f745_local9].numTotal = 0
				end
				f745_local3[f745_local9].numTotal = f745_local3[f745_local9].numTotal + 1
				if not f745_local8.isLocked then
					f745_local3[f745_local9].numComplete = f745_local3[f745_local9].numComplete + 1
				end
			end
		end
		f745_local4 = 0
		f745_local5 = 0
		for f745_local9, f745_local10 in pairs( f745_local3 ) do
			f745_local4 = f745_local4 + f745_local3[f745_local9].numComplete
			f745_local5 = f745_local5 + f745_local3[f745_local9].numTotal
		end
		f745_local3.CP = {}
		f745_local3.CP.numComplete = f745_local4
		f745_local3.CP.numTotal = f745_local5
		f745_local6 = Engine.CreateModel( Engine.GetModelForController( f745_arg0 ), "ChallengesCPCategoryStats" )
		for f745_local10, f745_local12 in pairs( f745_local3 ) do
			local f745_local11 = 0
			if f745_local12.numTotal ~= 0 then
				f745_local11 = f745_local12.numComplete / f745_local12.numTotal
			end
			Engine.SetModelValue( Engine.CreateModel( f745_local6, f745_local10 ), f745_local11 )
		end
		return f745_local6
	end,
	getModel = function ( f746_arg0 )
		local f746_local0 = Engine.GetModel( Engine.GetModelForController( f746_arg0 ), "ChallengesCPCategoryStats" )
		if f746_local0 == nil then
			f746_local0 = DataSources.ChallengesCPCategoryStats.init( f746_arg0 )
		end
		return f746_local0
	end
}
DataSources.ChallengesMPCategoryStats = {
	init = function ( f747_arg0 )
		local f747_local0 = Engine.GetChallengeInfoForImages( f747_arg0, nil, Enum.eModes.MODE_MULTIPLAYER )
		local f747_local1 = 0
		local f747_local2 = 0
		local f747_local3 = {}
		local f747_local4 = nil
		for f747_local8, f747_local9 in ipairs( f747_local0 ) do
			local f747_local10 = f747_local9.challengeCategory
			if not f747_local9.isMastery then
				if not f747_local3[f747_local10] then
					f747_local3[f747_local10] = {}
					f747_local3[f747_local10].numComplete = 0
					f747_local3[f747_local10].numTotal = 0
				end
				f747_local3[f747_local10].numTotal = f747_local3[f747_local10].numTotal + 1
				if not f747_local9.isLocked then
					f747_local3[f747_local10].numComplete = f747_local3[f747_local10].numComplete + 1
				end
			end
			if f747_local10 == "onehundredpercent" then
				f747_local4 = f747_local9.imageID
			end
		end
		f747_local3.MP = {}
		f747_local3.MP.numComplete = 0
		f747_local3.MP.numTotal = 0
		for f747_local8, f747_local9 in pairs( CoD.ChallengesUtility.ChallengeCategoryTable.mp ) do
			if type( f747_local9 ) == "table" then
				f747_local3[f747_local8] = {}
				f747_local3[f747_local8].numComplete = 0
				f747_local3[f747_local8].numTotal = 0
				for f747_local13, f747_local14 in ipairs( f747_local9 ) do
					if f747_local3[f747_local14] then
						f747_local3[f747_local8].numComplete = f747_local3[f747_local8].numComplete + f747_local3[f747_local14].numComplete
						f747_local3[f747_local8].numTotal = f747_local3[f747_local8].numTotal + f747_local3[f747_local14].numTotal
					end
				end
				f747_local3.MP.numComplete = f747_local3.MP.numComplete + f747_local3[f747_local8].numComplete
				f747_local3.MP.numTotal = f747_local3.MP.numTotal + f747_local3[f747_local8].numTotal
			end
		end
		f747_local5 = Engine.CreateModel( Engine.GetModelForController( f747_arg0 ), "ChallengesMPCategoryStats" )
		for f747_local9, f747_local10 in pairs( f747_local3 ) do
			local f747_local11 = 0
			if f747_local10.numTotal ~= 0 then
				f747_local11 = f747_local10.numComplete / f747_local10.numTotal
			end
			Engine.SetModelValue( Engine.CreateModel( f747_local5, f747_local9 ), f747_local11 )
		end
		if f747_local4 then
			f747_local6 = f747_local3.MP.numComplete ~= f747_local3.MP.numTotal
			f747_local7 = DataSources.OneHundredPercentCallingCard.getModel( f747_arg0 )
			Engine.SetModelValue( Engine.GetModel( f747_local7, "iconId" ), f747_local4 )
			Engine.SetModelValue( Engine.GetModel( f747_local7, "isLocked" ), f747_local6 )
		end
		return f747_local5
	end,
	getModel = function ( f748_arg0 )
		local f748_local0 = Engine.GetModel( Engine.GetModelForController( f748_arg0 ), "ChallengesMPCategoryStats" )
		if f748_local0 == nil then
			f748_local0 = DataSources.ChallengesMPCategoryStats.init( f748_arg0 )
		end
		return f748_local0
	end
}
DataSources.ChallengesZMCategoryStats = {
	init = function ( f749_arg0 )
		local f749_local0 = Engine.GetChallengeInfoForImages( f749_arg0, nil, Enum.eModes.MODE_ZOMBIES )
		local f749_local1 = 0
		local f749_local2 = 0
		local f749_local3 = {}
		for f749_local7, f749_local8 in ipairs( f749_local0 ) do
			local f749_local9 = f749_local8.challengeCategory
			if not f749_local8.isMastery and f749_local9 ~= "darkops" then
				if not f749_local3[f749_local9] then
					f749_local3[f749_local9] = {}
					f749_local3[f749_local9].numComplete = 0
					f749_local3[f749_local9].numTotal = 0
				end
				f749_local3[f749_local9].numTotal = f749_local3[f749_local9].numTotal + 1
				if not f749_local8.isLocked then
					f749_local3[f749_local9].numComplete = f749_local3[f749_local9].numComplete + 1
				end
			end
		end
		f749_local4 = 0
		f749_local5 = 0
		for f749_local9, f749_local10 in pairs( f749_local3 ) do
			f749_local4 = f749_local4 + f749_local3[f749_local9].numComplete
			f749_local5 = f749_local5 + f749_local3[f749_local9].numTotal
		end
		f749_local3.ZM = {}
		f749_local3.ZM.numComplete = f749_local4
		f749_local3.ZM.numTotal = f749_local5
		f749_local6 = Engine.CreateModel( Engine.GetModelForController( f749_arg0 ), "ChallengesZMCategoryStats" )
		for f749_local10, f749_local12 in pairs( f749_local3 ) do
			local f749_local11 = 0
			if f749_local12.numTotal ~= 0 then
				f749_local11 = f749_local12.numComplete / f749_local12.numTotal
			end
			Engine.SetModelValue( Engine.CreateModel( f749_local6, f749_local10 ), f749_local11 )
		end
		return f749_local6
	end,
	getModel = function ( f750_arg0 )
		local f750_local0 = Engine.GetModel( Engine.GetModelForController( f750_arg0 ), "ChallengesZMCategoryStats" )
		if f750_local0 == nil then
			f750_local0 = DataSources.ChallengesZMCategoryStats.init( f750_arg0 )
		end
		return f750_local0
	end
}
DataSources.ChallengesCPNearCompletion = {
	init = function ( f751_arg0 )
		local f751_local0 = Engine.CreateModel( Engine.GetModelForController( f751_arg0 ), "ChallengesCPNearCompletion" )
		local f751_local1 = Engine.CreateModel( f751_local0, "title" )
		local f751_local2 = Engine.CreateModel( f751_local0, "description" )
		local f751_local3 = Engine.CreateModel( f751_local0, "iconId" )
		local f751_local4 = Engine.CreateModel( f751_local0, "statPercent" )
		local f751_local5 = Engine.CreateModel( f751_local0, "statFractionText" )
		local f751_local6 = Engine.CreateModel( Engine.GetModelForController( f751_arg0 ), "noNearCompleteCP" )
		SetGlobalModelValue( "challengeGameMode", "cp" )
		local f751_local7 = {}
		DataSources.ChallengesNearCompletionList.prepare( f751_arg0, f751_local7, nil )
		local f751_local8 = f751_local7.ChallengesNearCompletionList[1]
		if f751_local8 == nil then
			Engine.SetModelValue( f751_local6, true )
		else
			Engine.SetModelValue( f751_local1, Engine.GetModelValue( Engine.GetModel( f751_local8.model, "title" ) ) )
			Engine.SetModelValue( f751_local2, Engine.GetModelValue( Engine.GetModel( f751_local8.model, "description" ) ) )
			Engine.SetModelValue( f751_local3, Engine.GetModelValue( Engine.GetModel( f751_local8.model, "iconId" ) ) )
			Engine.SetModelValue( f751_local4, Engine.GetModelValue( Engine.GetModel( f751_local8.model, "statPercent" ) ) )
			Engine.SetModelValue( f751_local5, Engine.GetModelValue( Engine.GetModel( f751_local8.model, "statFractionText" ) ) )
		end
		return f751_local0
	end,
	getModel = function ( f752_arg0 )
		local f752_local0 = Engine.GetModel( Engine.GetModelForController( f752_arg0 ), "ChallengesCPNearCompletion" )
		if f752_local0 == nil then
			f752_local0 = DataSources.ChallengesCPNearCompletion.init( f752_arg0 )
		end
		return f752_local0
	end
}
DataSources.ChallengesMPNearCompletion = {
	init = function ( f753_arg0 )
		local f753_local0 = Engine.CreateModel( Engine.GetModelForController( f753_arg0 ), "ChallengesMPNearCompletion" )
		local f753_local1 = Engine.CreateModel( f753_local0, "title" )
		local f753_local2 = Engine.CreateModel( f753_local0, "description" )
		local f753_local3 = Engine.CreateModel( f753_local0, "iconId" )
		local f753_local4 = Engine.CreateModel( f753_local0, "statPercent" )
		local f753_local5 = Engine.CreateModel( f753_local0, "statFractionText" )
		SetGlobalModelValue( "challengeGameMode", "mp" )
		local f753_local6 = {}
		DataSources.ChallengesNearCompletionList.prepare( f753_arg0, f753_local6, nil )
		local f753_local7 = f753_local6.ChallengesNearCompletionList[1]
		if f753_local7 == nil then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f753_arg0 ), "noNearCompleteMP" ), true )
		else
			Engine.SetModelValue( f753_local1, Engine.GetModelValue( Engine.GetModel( f753_local7.model, "title" ) ) )
			Engine.SetModelValue( f753_local2, Engine.GetModelValue( Engine.GetModel( f753_local7.model, "description" ) ) )
			Engine.SetModelValue( f753_local3, Engine.GetModelValue( Engine.GetModel( f753_local7.model, "iconId" ) ) )
			Engine.SetModelValue( f753_local4, Engine.GetModelValue( Engine.GetModel( f753_local7.model, "statPercent" ) ) )
			Engine.SetModelValue( f753_local5, Engine.GetModelValue( Engine.GetModel( f753_local7.model, "statFractionText" ) ) )
		end
		return f753_local0
	end,
	getModel = function ( f754_arg0 )
		local f754_local0 = Engine.GetModel( Engine.GetModelForController( f754_arg0 ), "ChallengesMPNearCompletion" )
		if f754_local0 == nil then
			f754_local0 = DataSources.ChallengesMPNearCompletion.init( f754_arg0 )
		end
		return f754_local0
	end
}
DataSources.ChallengesZMNearCompletion = {
	init = function ( f755_arg0 )
		local f755_local0 = Engine.CreateModel( Engine.GetModelForController( f755_arg0 ), "ChallengesZMNearCompletion" )
		local f755_local1 = Engine.CreateModel( f755_local0, "title" )
		local f755_local2 = Engine.CreateModel( f755_local0, "description" )
		local f755_local3 = Engine.CreateModel( f755_local0, "iconId" )
		local f755_local4 = Engine.CreateModel( f755_local0, "statPercent" )
		local f755_local5 = Engine.CreateModel( f755_local0, "statFractionText" )
		local f755_local6 = Engine.CreateModel( Engine.GetModelForController( f755_arg0 ), "noNearCompleteZM" )
		SetGlobalModelValue( "challengeGameMode", "zm" )
		local f755_local7 = {}
		DataSources.ChallengesNearCompletionList.prepare( f755_arg0, f755_local7, nil )
		local f755_local8 = f755_local7.ChallengesNearCompletionList[1]
		if f755_local8 == nil then
			Engine.SetModelValue( f755_local6, true )
		else
			Engine.SetModelValue( f755_local1, Engine.GetModelValue( Engine.GetModel( f755_local8.model, "title" ) ) )
			Engine.SetModelValue( f755_local2, Engine.GetModelValue( Engine.GetModel( f755_local8.model, "description" ) ) )
			Engine.SetModelValue( f755_local3, Engine.GetModelValue( Engine.GetModel( f755_local8.model, "iconId" ) ) )
			Engine.SetModelValue( f755_local4, Engine.GetModelValue( Engine.GetModel( f755_local8.model, "statPercent" ) ) )
			Engine.SetModelValue( f755_local5, Engine.GetModelValue( Engine.GetModel( f755_local8.model, "statFractionText" ) ) )
		end
		return f755_local0
	end,
	getModel = function ( f756_arg0 )
		local f756_local0 = Engine.GetModel( Engine.GetModelForController( f756_arg0 ), "ChallengesZMNearCompletion" )
		if f756_local0 == nil then
			f756_local0 = DataSources.ChallengesZMNearCompletion.init( f756_arg0 )
		end
		return f756_local0
	end
}
DataSources.MasterCallingCard = {
	getModel = function ( f757_arg0 )
		local f757_local0 = Engine.GetModel( Engine.GetModelForController( f757_arg0 ), "MasterCallingCard" )
		if f757_local0 == nil then
			f757_local0 = Engine.CreateModel( Engine.GetModelForController( f757_arg0 ), "MasterCallingCard" )
			Engine.CreateModel( f757_local0, "title" )
			Engine.CreateModel( f757_local0, "description" )
			Engine.CreateModel( f757_local0, "iconId" )
			Engine.CreateModel( f757_local0, "percentComplete" )
			Engine.CreateModel( f757_local0, "isLocked" )
		end
		return f757_local0
	end,
	setModelValues = function ( f758_arg0, f758_arg1, f758_arg2, f758_arg3, f758_arg4 )
		local f758_local0 = Engine.GetModel( Engine.GetModelForController( f758_arg0 ), "MasterCallingCard" )
		if f758_local0 == nil then
			f758_local0 = DataSources.MasterCallingCard.getModel( f758_arg0 )
		end
		Engine.SetModelValue( Engine.GetModel( f758_local0, "title" ), f758_arg1 )
		Engine.SetModelValue( Engine.GetModel( f758_local0, "description" ), f758_arg2 )
		Engine.SetModelValue( Engine.GetModel( f758_local0, "iconId" ), f758_arg3 )
		Engine.SetModelValue( Engine.GetModel( f758_local0, "percentComplete" ), f758_arg4 )
		Engine.SetModelValue( Engine.GetModel( f758_local0, "isLocked" ), f758_arg4 < 1 )
	end
}
DataSources.OneHundredPercentCallingCard = {
	getModel = function ( f759_arg0 )
		local f759_local0 = Engine.CreateModel( Engine.GetModelForController( f759_arg0 ), "OneHundredPercentCallingCard" )
		Engine.CreateModel( f759_local0, "iconId" )
		Engine.CreateModel( f759_local0, "isLocked" )
		return f759_local0
	end
}
DataSources.SideBetCurrentChallenge = {
	getModel = function ( f760_arg0 )
		local f760_local0 = Engine.CreateModel( Engine.GetModelForController( f760_arg0 ), "SideBetCurrentChallenge" )
		local f760_local1 = Engine.CreateModel( f760_local0, "title" )
		local f760_local2 = Engine.CreateModel( f760_local0, "description" )
		local f760_local3 = Engine.CreateModel( f760_local0, "backgroundId" )
		local f760_local4 = Engine.CreateModel( f760_local0, "setCount" )
		local f760_local5 = Engine.CreateModel( f760_local0, "isLocked" )
		local f760_local6 = Engine.CreateModel( f760_local0, "isMastery" )
		local f760_local7 = Engine.CreateModel( f760_local0, "timeSeconds" )
		local f760_local8 = function ( f761_arg0, f761_arg1 )
			return tonumber( f761_arg0.imageID ) < tonumber( f761_arg1.imageID )
		end
		
		local f760_local9 = IsBlackjackContractActive( f760_arg0 )
		if f760_local9 then
			f760_local9 = Engine.GetDStat( f760_arg0, "TenthSpecialistContract", "special_card_earned" ) ~= 0
		end
		local f760_local10 = CoD.ChallengesUtility.GetSideBetCallingCards( f760_arg0, f760_local8 )
		local f760_local11 = 0
		local f760_local12 = 0
		local f760_local13 = false
		local f760_local14 = {}
		local f760_local15 = {}
		for f760_local19, f760_local20 in ipairs( f760_local10 ) do
			if not f760_local20.properties.isExpert then
				if not f760_local13 then
					f760_local11 = f760_local11 + 1
					if f760_local20.models.isLocked then
						f760_local14 = f760_local20.models
						if f760_local9 then
							f760_local14 = f760_local15
							f760_local11 = f760_local11 - 1
						end
						f760_local13 = true
					end
				end
				f760_local12 = f760_local12 + 1
			elseif not f760_local13 then
				f760_local14 = f760_local20.models
			end
			f760_local15 = f760_local20.models
		end
		f760_local16 = Engine.ConsumableGet( f760_arg0, "blackjack", "awarded" ) - Engine.ConsumableGet( f760_arg0, "blackjack", "consumed" )
		Engine.SetModelValue( f760_local1, f760_local14.title )
		Engine.SetModelValue( f760_local2, f760_local14.description )
		Engine.SetModelValue( f760_local3, f760_local14.iconId )
		Engine.SetModelValue( f760_local4, Engine.Localize( "MPUI_BM_SET_X_OF_Y", f760_local11, f760_local12 ) )
		Engine.SetModelValue( f760_local5, f760_local13 and not f760_local9 )
		Engine.SetModelValue( f760_local6, not f760_local13 )
		Engine.SetModelValue( f760_local7, f760_local16 )
		return f760_local0
	end
}
DataSources.SpecialContractsList = DataSourceHelpers.ListSetup( "SpecialContractsList", function ( f762_arg0 )
	local f762_local0 = {}
	local f762_local1 = function ( f763_arg0, f763_arg1, f763_arg2, f763_arg3, f763_arg4 )
		local f763_local0 = f763_arg1:getModel()
		OpenSystemOverlay( f763_arg0, f763_arg4, f763_arg2, "ActivateSpecialContractConfirmation", {
			contractIndex = Engine.GetModelValue( Engine.GetModel( f763_local0, "index" ) ),
			name = Engine.GetModelValue( Engine.GetModel( f763_local0, "name" ) ),
			cost = Engine.GetModelValue( Engine.GetModel( f763_local0, "cost" ) ),
			category = Engine.GetModelValue( Engine.GetModel( f763_local0, "category" ) ),
			image = Engine.GetModelValue( Engine.GetModel( f763_local0, "image" ) ),
			backgroundId = Engine.GetModelValue( Engine.GetModel( f763_local0, "backgroundId" ) ),
			activeDvar = Engine.GetModelValue( Engine.GetModel( f763_local0, "activeDvar" ) )
		} )
	end
	
	local f762_local2 = function ( f764_arg0, f764_arg1, f764_arg2, f764_arg3, f764_arg4 )
		OpenSystemOverlay( f764_arg0, f764_arg4, f764_arg2, "TradeForBlackjackContract", {
			itemCost = Dvar.blackjack_contract_ck_cost:get()
		} )
	end
	
	local f762_local3 = function ( f765_arg0, f765_arg1, f765_arg2, f765_arg3, f765_arg4 )
		local f765_local0 = f765_arg1:getModel( f765_arg2, "group" )
		if f765_local0 then
			CoD.perController[f765_arg2].callingCardContractGroup = Engine.GetModelValue( f765_local0 )
		end
		OpenPopup( f765_arg0, "BM_SpecialContracts_CallingCardContracts", f765_arg2, f765_arg3, f765_arg4 )
	end
	
	local f762_local4 = function ( f766_arg0, f766_arg1, f766_arg2, f766_arg3 )
		if f766_arg1 == f766_arg3 then
			local f766_local0 = nil
			if f766_arg1 == 0 then
				if HasEarnedWeaponContract( f766_arg0 ) then
					return ""
				end
				f766_local0 = Engine.GetDStat( f766_arg0, "weaponContractData", "currentValue" )
			else
				local f766_local1 = CoD.GetContractStatValuesForIndex( f766_arg0, LuaUtils.BMContracts.specialContractIndex )
				f766_local0 = f766_local1.progress
			end
			if f766_local0 < f766_arg2 then
				return Engine.Localize( "MENU_X_OF_Y_COMPLETE", f766_local0, f766_arg2 )
			end
		end
		return ""
	end
	
	local f762_local5 = Engine.StorageGetBuffer( f762_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f762_local6 = f762_local5.contracts[LuaUtils.BMContracts.specialContractIndex].index:get()
	if not CoD.perController[f762_arg0].callingCardContractGroup then
		table.insert( f762_local0, {
			models = {
				index = 0,
				name = Engine.Localize( "MPUI_BM_CONTRACT_TOTAL_VICTORY" ),
				description = Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL_DESC", Dvar.weapon_contract_target_value:get() ),
				cost = 0,
				targetValue = Dvar.weapon_contract_target_value:get(),
				isComplete = HasEarnedWeaponContract( f762_arg0 ),
				category = "default",
				rewardDescription1 = Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL_REWARD_DESC" ),
				rewardDescription2 = "",
				rewardDescription3 = "",
				backgroundId = 0,
				image = "uie_t7_bm_contracts_special_reward",
				group = "",
				groupProgress = f762_local4( f762_arg0, 0, Dvar.weapon_contract_target_value:get(), f762_local6 ),
				activeDvar = ""
			},
			properties = {
				action = f762_local1
			}
		} )
		if Dvar.blackjack_contract_purchasable:get() == true then
			table.insert( f762_local0, {
				models = {
					index = -1,
					name = Engine.Localize( "CONTRACT_BLACKJACK_CONTRACT" ),
					description = Engine.Localize( "CONTRACT_BLACKJACK_CONTRACT_DESC" ),
					cost = Dvar.blackjack_contract_ck_cost:get(),
					targetValue = 0,
					isComplete = false,
					category = "blackjack_contract",
					rewardDescription1 = Engine.Localize( "CONTRACT_REWARD_BLACKJACK_CONTRACT" ),
					rewardDescription2 = "",
					rewardDescription3 = "",
					backgroundId = 0,
					image = "t7_bm_contracts_mercenary_icon",
					group = "",
					groupProgress = "",
					activeDvar = ""
				},
				properties = {
					action = f762_local2
				}
			} )
		end
	end
	local f762_local7 = 0
	local f762_local8 = 2
	local f762_local9 = 3
	local f762_local10 = 4
	local f762_local11 = 5
	local f762_local12 = 6
	local f762_local13 = 7
	local f762_local14 = 8
	local f762_local15 = 9
	local f762_local16 = 10
	local f762_local17 = 11
	local f762_local18 = 12
	local f762_local19 = 13
	local f762_local20 = 14
	local f762_local21 = 15
	local f762_local22 = CoD.getStatsMilestoneTable( 6, Enum.eModes.MODE_MULTIPLAYER )
	local f762_local23 = Engine.TableFindRows( CoD.contractTable_mp, f762_local11, "special_contract" )
	local f762_local24 = {}
	if f762_local23 then
		for f762_local44, f762_local45 in ipairs( f762_local23 ) do
			local f762_local29 = ""
			local f762_local33 = ""
			local f762_local32 = ""
			local f762_local46 = ""
			local f762_local47 = ""
			local f762_local31 = 0
			local f762_local34 = false
			local f762_local28 = false
			local f762_local35 = false
			local f762_local43 = f762_local1
			local f762_local48 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local7 ) )
			local f762_local49 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local8 ) )
			local f762_local41 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local9 )
			local f762_local50 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local10 )
			local f762_local42 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local12 )
			local f762_local51 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local13 )
			local f762_local52 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local14 )
			local f762_local53 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local15 )
			local f762_local54 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local16 )
			local f762_local55 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local18 )
			local f762_local56 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local19 )
			local f762_local57 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local20 )
			local f762_local58 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, f762_local45, f762_local21 )
			if f762_local53 ~= "" then
				f762_local28 = LuaUtils.IsStatPathValueGreaterThanZero( f762_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_MULTIPLAYER, f762_local53 )
			elseif f762_local51 ~= "" then
				f762_local29 = "calling_card"
				local f762_local30 = Engine.TableLookup( nil, f762_local22, 4, f762_local51, 12 )
				f762_local31 = tonumber( Engine.TableLookup( nil, CoD.backgroundsTable, 4, f762_local30, 1 ) )
				f762_local32 = Engine.Localize( "CONTRACT_REWARD_CALLING_CARD", f762_local30 )
				f762_local28 = Engine.GetDStat( f762_arg0, "playerstatslist", f762_local51, "statvalue" ) > 0
			elseif f762_local52 ~= "" then
				f762_local29 = "camo"
				local f762_local30 = Engine.TableLookup( nil, f762_local22, 4, f762_local52, 9 )
				f762_local33 = Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f762_local30, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_IMAGE ) .. "_menu"
				f762_local32 = Engine.Localize( "CONTRACT_REWARD_CAMO", Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, f762_local30, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME ) )
				f762_local28 = Engine.GetDStat( f762_arg0, "playerstatslist", f762_local52, "statvalue" ) > 0
			end
			if f762_local57 ~= "" then
				f762_local33 = f762_local57
			end
			if f762_local58 ~= "" then
				f762_local29 = f762_local58
			end
			if not f762_local28 and f762_local54 ~= "" and Engine.AreStatsFetched( f762_arg0 ) and Engine.IsLootReady( f762_arg0 ) then
				f762_local28 = Engine.GetInventoryItemQuantity( f762_arg0, f762_local54 ) > 0
			end
			if CoD.perController[f762_arg0].callingCardContractGroup ~= nil then
				f762_local34 = CoD.perController[f762_arg0].callingCardContractGroup ~= f762_local55
			elseif f762_local55 ~= "" then
				if f762_local24[f762_local55] then
					f762_local34 = true
					if f762_local48 == f762_local6 then
						f762_local24[f762_local55].index = f762_local48
						f762_local24[f762_local55].backgroundId = f762_local31
					end
					f762_local24[f762_local55].contractCount = f762_local24[f762_local55].contractCount + 1
					if f762_local28 then
						f762_local24[f762_local55].completeCount = f762_local24[f762_local55].completeCount + 1
					end
				else
					f762_local35 = true
					local f762_local30 = 0
					if f762_local28 then
						f762_local30 = 1
					end
					f762_local24[f762_local55] = {
						index = f762_local48,
						backgroundId = f762_local31,
						contractCount = 1,
						completeCount = f762_local30
					}
				end
			end
			if not f762_local34 then
				if f762_local56 == "" or Engine.DvarBool( nil, f762_local56 ) or f762_local28 or f762_local48 == f762_local6 then
					f762_local34 = false
				else
					f762_local34 = true
				end
			end
			if f762_local29 == "outfits" then
				local f762_local30 = tonumber( f762_local54 )
				for f762_local39, f762_local40 in ipairs( CoD.BlackMarketUtility.UniqueSpecialistOutfits ) do
					if f762_local30 == f762_local40.contractRedeemId then
						if Engine.GetInventoryItemQuantity( f762_arg0, f762_local40.contractId ) <= 0 then
							f762_local34 = true
							break
						end
					end
				end
			end
			if not f762_local34 then
				if f762_local35 then
					f762_local41 = f762_local55
				end
				local f762_local30 = "CONTRACT_" .. f762_local41
				if not f762_local35 and f762_local50 and f762_local50 ~= "" then
					f762_local30 = "CONTRACT_" .. f762_local50
				end
				if not f762_local42 or f762_local42 == "" then
					f762_local42 = 0
				end
				if f762_local35 and f762_local29 == "calling_card" then
					f762_local43 = f762_local3
				end
				table.insert( f762_local0, {
					models = {
						index = f762_local48,
						name = Engine.Localize( f762_local30 ),
						description = Engine.Localize( "CONTRACT_" .. f762_local41 .. "_DESC", f762_local49 ),
						cost = tonumber( f762_local42 ),
						targetValue = f762_local49,
						isComplete = f762_local28,
						isGroupButton = f762_local35,
						category = f762_local29,
						rewardDescription1 = f762_local32,
						rewardDescription2 = f762_local46,
						rewardDescription3 = f762_local47,
						backgroundId = f762_local31,
						image = f762_local33,
						group = f762_local55,
						groupProgress = f762_local4( f762_arg0, f762_local48, f762_local49, f762_local6 ),
						activeDvar = f762_local56
					},
					properties = {
						action = f762_local43
					}
				} )
			end
		end
		for f762_local44, f762_local45 in pairs( f762_local24 ) do
			for f762_local46, f762_local47 in ipairs( f762_local0 ) do
				if f762_local47.models.group == f762_local44 then
					f762_local47.models.index = f762_local45.index
					f762_local47.models.backgroundId = f762_local45.backgroundId
					f762_local47.models.isComplete = f762_local45.completeCount == f762_local45.contractCount
					if f762_local47.models.isComplete then
						CoD.perController[f762_arg0].callingCardContractGroup = f762_local44
						f762_local47.models.backgroundId = Engine.GetModelValue( Engine.GetModel( DataSources.SpecialContractMasterCard.getModel( f762_arg0 ), "backgroundId" ) )
						CoD.perController[f762_arg0].callingCardContractGroup = nil
					end
					if f762_local45.completeCount ~= f762_local45.contractCount then
						f762_local47.models.groupProgress = Engine.Localize( "MENU_X_OF_Y_COMPLETE", f762_local45.completeCount, f762_local45.contractCount )
					end
				end
			end
		end
	end
	return f762_local0
end, true )
DataSources.CurrentSpecialContract = {
	getModel = function ( f767_arg0 )
		local f767_local0 = CoD.GetContractStatValuesForIndex( f767_arg0, LuaUtils.BMContracts.specialContractIndex, nil, false, true )
		if f767_local0.index == 0 then
			f767_local0.titleRef = "MPUI_BM_CONTRACT_TOTAL_VICTORY"
			f767_local0.descRef = "MPUI_BM_CONTRACT_SPECIAL_DESC"
			f767_local0.progress = Engine.GetDStat( f767_arg0, "weaponContractData", "currentValue" )
			f767_local0.targetValue = Dvar.weapon_contract_target_value:get()
			f767_local0.isAwardGiven = HasEarnedWeaponContract( f767_arg0 )
			f767_local0.category = "default"
			f767_local0.cost = 0
			f767_local0.image = "uie_t7_bm_contracts_special_reward"
			f767_local0.backgroundId = 0
		end
		local f767_local1 = 0
		if f767_local0.targetValue > 0 then
			f767_local1 = f767_local0.progress / f767_local0.targetValue
		end
		local f767_local2 = Engine.CreateModel( Engine.GetModelForController( f767_arg0 ), "CurrentSpecialContract" )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "index" ), f767_local0.index )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "name" ), Engine.Localize( f767_local0.titleRef ) )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "description" ), Engine.Localize( f767_local0.descRef, f767_local0.targetValue ) )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "percentComplete" ), f767_local1 )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "fractionText" ), Engine.Localize( "MPUI_X_SLASH_Y", f767_local0.progress, f767_local0.targetValue ) )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "category" ), f767_local0.category )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "cost" ), f767_local0.cost )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "image" ), f767_local0.image )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "backgroundId" ), f767_local0.backgroundId )
		Engine.SetModelValue( Engine.CreateModel( f767_local2, "isComplete" ), f767_local0.isAwardGiven )
		return f767_local2
	end
}
DataSources.SpecialContractMasterCard = {
	getModel = function ( f768_arg0 )
		local f768_local0 = 0
		local f768_local1 = ""
		local f768_local2 = 0
		local f768_local3 = true
		local f768_local4 = Engine.CreateModel( Engine.GetModelForController( f768_arg0 ), "SpecialContractMasterCard" )
		if CoD.perController[f768_arg0].callingCardContractGroup then
			local f768_local5 = 0
			local f768_local6 = 0
			for f768_local10, f768_local11 in ipairs( Engine.GetChallengeInfoForImages( f768_arg0, CoD.perController[f768_arg0].callingCardContractGroup, Enum.eModes.MODE_MULTIPLAYER ) ) do
				if Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( f768_local11.tableNum + 1, Enum.eModes.MODE_MULTIPLAYER ), f768_local11.challengeRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_ISEXPERT ) == "1" then
					f768_local2 = f768_local11.imageID
				end
				f768_local6 = f768_local6 + 1
				if not f768_local11.isLocked then
					f768_local5 = f768_local5 + 1
				end
			end
			f768_local0 = f768_local5 / f768_local6
			f768_local1 = Engine.Localize( "MPUI_X_SLASH_Y", f768_local5, f768_local6 )
			f768_local3 = f768_local5 ~= f768_local6
		end
		Engine.SetModelValue( Engine.CreateModel( f768_local4, "percentComplete" ), f768_local0 )
		Engine.SetModelValue( Engine.CreateModel( f768_local4, "fractionText" ), f768_local1 )
		Engine.SetModelValue( Engine.CreateModel( f768_local4, "backgroundId" ), f768_local2 )
		Engine.SetModelValue( Engine.CreateModel( f768_local4, "isLocked" ), f768_local3 )
		return f768_local4
	end
}
DataSources.LimitedItemPromo = {
	getModel = function ( f769_arg0 )
		local f769_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "LimitedItemPromo" )
		Engine.CreateModel( f769_local0, "itemCount" )
		return f769_local0
	end
}
DataSources.PrestigeStats = {
	getModel = function ( f770_arg0 )
		local f770_local0 = Engine.CreateModel( Engine.GetModelForController( f770_arg0 ), "PrestigeStats" )
		local f770_local1 = CoD.PrestigeUtility.GetPrestigeGameMode()
		local f770_local2 = CoD.PrestigeUtility.GetCurrentPLevel( f770_arg0 )
		local f770_local3 = f770_local2
		local f770_local4 = ""
		local f770_local5 = 0
		if not IsMaxPrestigeLevel( f770_arg0 ) then
			f770_local3 = f770_local2 + 1
		elseif IsGameModeParagonCapable( f770_local1 ) then
			local f770_local6 = Engine.GetPlayerStats( f770_arg0, CoD.STATS_LOCATION_NORMAL, f770_local1 )
			f770_local5 = f770_local6.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
		end
		if f770_local5 == 0 then
			f770_local4 = Engine.GetRankIcon( 0, f770_local3, f770_local1 )
		else
			f770_local4 = Engine.GetParagonIconById( f770_local5, f770_local1 )
		end
		Engine.SetModelValue( Engine.CreateModel( f770_local0, "icon" ), f770_local4 )
		Engine.SetModelValue( Engine.CreateModel( f770_local0, "backgroundId" ), CoD.PrestigeUtility.GetBackgroundIdByPLevel( f770_arg0, f770_local3 ) )
		Engine.SetModelValue( Engine.CreateModel( f770_local0, "plevel" ), f770_local2 )
		return f770_local0
	end
}
DataSources.PrestigeButtonInfopane = {
	getModel = function ( f771_arg0 )
		local f771_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "PrestigeButtonInfopane" )
		Engine.CreateModel( f771_local0, "title" )
		Engine.CreateModel( f771_local0, "description" )
		return f771_local0
	end
}
DataSources.CollectiblesList = ListHelper_SetupDataSource( "PDV_CollectiblesList", function ( f772_arg0 )
	local f772_local0 = {}
	for f772_local15, f772_local16 in pairs( CoD.mapsTable ) do
		if f772_local16.collectibles and f772_local16.collectibles ~= "" and (not CoD.perController[f772_arg0].inspectingMap or CoD.perController[f772_arg0].inspectingMap == f772_local15) then
			for f772_local13, f772_local14 in ipairs( Engine.GetAssetList( f772_local16.collectibles ) ) do
				if CoD.perController[f772_arg0].inspectingMap or CoD.perController[f772_arg0].inspectingCollectibleSize == f772_local14.slotSize then
					local f772_local7 = Engine.ClientHasCollectible( f772_arg0, f772_local15, f772_local13 - 1 )
					if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
						f772_local7 = ClientHasCollectible( f772_arg0, f772_local15, f772_local13 - 1, true )
					end
					local f772_local8 = table.insert
					local f772_local9 = f772_local0
					local f772_local10 = {}
					local f772_local11 = {
						name = f772_local14.name
					}
					local f772_local12
					if f772_local7 then
						f772_local12 = f772_local14.displayNameShort
						if not f772_local12 then
						
						else
							f772_local11.shortName = f772_local12
							f772_local11.longName = f772_local14.displayNameLong
							f772_local11.description = f772_local14.description
							f772_local11.image = f772_local14.uiMaterial
							f772_local11.imageLarge = f772_local14.uiMaterialLarge
							f772_local11.audioLog = f772_local14.audiolog_sound or ""
							f772_local11.mapDisplayName = f772_local16.mapName
							f772_local11.unlocked = f772_local7
							f772_local10.models = f772_local11
							f772_local10.properties = {
								mapName = f772_local15,
								model = f772_local14.uiModel or "tag_origin",
								unlocked = f772_local7
							}
							f772_local8( f772_local9, f772_local10 )
						end
					end
					f772_local12 = "COLLECTIBLE_NOT_FOUND_SHORT"
				end
			end
		end
	end
	table.sort( f772_local0, function ( f773_arg0, f773_arg1 )
		if f773_arg0.models.unlocked and f773_arg1.models.unlocked then
			return Engine.Localize( f773_arg0.models.shortName ) < Engine.Localize( f773_arg1.models.shortName )
		end
		return f773_arg0.models.unlocked and not f773_arg1.models.unlocked
	end )
	return f772_local0
end )
DataSources.CollectiblesListAAR = ListHelper_SetupDataSource( "PDV_CollectiblesList", function ( f774_arg0 )
	local f774_local0 = {}
	local f774_local1 = nil
	local f774_local2 = Dvar.last_map:get()
	if not f774_local2 then
		return f774_local0
	end
	local f774_local3 = CoD.mapsTable[f774_local2].rootMapName
	f774_local1 = CoD.mapsTable[f774_local3]
	if f774_local1.collectibles and f774_local1.collectibles ~= "" then
		for f774_local8, f774_local9 in ipairs( Engine.GetAssetList( f774_local1.collectibles ) ) do
			local f774_local10 = Engine.ClientHasCollectible( f774_arg0, f774_local3, f774_local8 - 1 )
			local f774_local11 = table.insert
			local f774_local12 = f774_local0
			local f774_local13 = {}
			local f774_local14 = {
				name = f774_local9.name
			}
			local f774_local7
			if f774_local10 then
				f774_local7 = f774_local9.displayNameShort
				if not f774_local7 then
				
				else
					f774_local14.shortName = f774_local7
					f774_local14.longName = f774_local9.displayNameLong
					f774_local14.description = f774_local9.description
					f774_local14.image = f774_local9.uiMaterial
					f774_local14.imageLarge = f774_local9.uiMaterialLarge
					f774_local14.audioLog = f774_local9.audiolog_sound or ""
					f774_local14.mapDisplayName = f774_local1.mapName
					f774_local14.unlocked = f774_local10
					f774_local13.models = f774_local14
					f774_local13.properties = {
						mapName = f774_local3,
						model = f774_local9.uiModel or "tag_origin",
						unlocked = f774_local10
					}
					f774_local11( f774_local12, f774_local13 )
				end
			end
			f774_local7 = "COLLECTIBLE_NOT_FOUND_SHORT"
		end
	end
	table.sort( f774_local0, function ( f775_arg0, f775_arg1 )
		return f775_arg1.models.unlocked and not f775_arg0.models.unlocked
	end )
	return f774_local0
end )
DataSources.BookmarksList = ListHelper_SetupDataSource( "BookmarksList", function ( f776_arg0 )
	local f776_local0 = {}
	if Dvar.ui_codexindex_unlocked:get() then
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "index.htm",
				bookmarkDesc = "INDEX"
			},
			propteries = {}
		} )
	end
	table.insert( f776_local0, {
		models = {
			bookmarkURL = "CIA-HomePage.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAHOME" )
		},
		propteries = {}
	} )
	table.insert( f776_local0, {
		models = {
			bookmarkURL = "WinslowAccord-MainMenu.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_WINSLOWMAIN" )
		},
		propteries = {}
	} )
	table.insert( f776_local0, {
		models = {
			bookmarkURL = "Omnipedia-WinslowAccord.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNIWINSLOW" )
		},
		propteries = {}
	} )
	table.insert( f776_local0, {
		models = {
			bookmarkURL = "Omnipedia-CDP.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNICDP" )
		},
		propteries = {}
	} )
	table.insert( f776_local0, {
		models = {
			bookmarkURL = "Omnipedia-CIA.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNICIA" )
		},
		propteries = {}
	} )
	if HighestMapReachedGreaterThan( f776_arg0, 15 ) then
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "CEA-EgyptianForcesMoveAgainstNRC.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSEGYPT" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( f776_arg0, 6 ) then
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "CEA-GangViolenceSpillsIntoSingapore.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSGANG" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( f776_arg0, 8 ) then
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "CEA-VictoryisWithinOurGrasp.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSVICTORY" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( f776_arg0, 5 ) then
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "CIA-Krueger-FileEntryPoint.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAKRUEGER" )
			},
			propteries = {}
		} )
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "CIA-COALESCENCE-AudioLandingPage.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIASGEN" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( f776_arg0, 11 ) then
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "CIA-Infection-AudioLandingPage.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAINFECTION" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( f776_arg0, 16 ) then
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "CIA-Zurich-AudioLandingPage.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAZURICH" )
			},
			propteries = {}
		} )
		table.insert( f776_local0, {
			models = {
				bookmarkURL = "WinslowAccord-TeamPhiAutopsy.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_WINSLOWTEAMPHI" )
			},
			propteries = {}
		} )
	end
	for f776_local9, f776_local10 in pairs( CoD.mapsTable ) do
		if f776_local10.collectibles and f776_local10.collectibles ~= "" and (not CoD.perController[f776_arg0].inspectingMap or CoD.perController[f776_arg0].inspectingMap == f776_local9) then
			for f776_local7, f776_local8 in ipairs( Engine.GetAssetList( f776_local10.collectibles ) ) do
				if Engine.ClientHasCollectible( f776_arg0, f776_local9, f776_local7 - 1 ) then
					table.insert( f776_local0, {
						models = {
							bookmarkURL = f776_local8.codexurl,
							bookmarkDesc = Engine.Localize( f776_local8.codexurldesc )
						},
						properties = {}
					} )
				end
			end
		end
	end
	return f776_local0
end )
DataSources.GalleryList = ListHelper_SetupDataSource( "GalleryList", function ( f777_arg0 )
	local f777_local0 = {}
	local f777_local1 = {
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
	local f777_local2 = Engine.GetPlayerStats( f777_arg0 )
	local f777_local3 = Engine.GetAssetList( "cp_default_gallery" )
	for f777_local4 = 1, #f777_local3, 1 do
		table.insert( f777_local0, {
			models = {
				displayName = f777_local3[f777_local4].displayName,
				image = f777_local3[f777_local4].image,
				unlocked = true
			},
			properties = {
				mapName = "",
				unlocked = true
			}
		} )
	end
	for f777_local4 = 1, #f777_local1, 1 do
		local f777_local7 = f777_local1[f777_local4]
		local f777_local8 = CoD.mapsTable[f777_local7]
		local f777_local9
		if f777_local2.PlayerStatsByMap[f777_local7].hasBeenCompleted:get() ~= 1 then
			f777_local9 = f777_local8.isSafeHouse
		else
			f777_local9 = true
		end
		if f777_local9 then
			f777_local3 = Engine.GetAssetList( f777_local7 .. "_list" )
			if f777_local3 ~= nil then
				for f777_local10 = 1, #f777_local3, 1 do
					table.insert( f777_local0, {
						models = {
							displayName = f777_local3[f777_local10].displayName,
							image = f777_local3[f777_local10].image,
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
	return f777_local0
end )
DataSources.StartMenuCollectables = ListHelper_SetupDataSource( "StartMenuCollectables", function ( f778_arg0 )
	local f778_local0 = {}
	local f778_local1 = Dvar.ui_mapname:get()
	if LUI.endswith( f778_local1, "2" ) or LUI.endswith( f778_local1, "3" ) then
		f778_local1 = string.sub( f778_local1, 0, string.len( f778_local1 ) - 1 )
	end
	for f778_local10, f778_local11 in pairs( CoD.mapsTable ) do
		if f778_local10 == f778_local1 and f778_local11.collectibles ~= nil and f778_local11.collectibles ~= "" then
			for f778_local8, f778_local9 in ipairs( Engine.GetAssetList( f778_local11.collectibles ) ) do
				table.insert( f778_local0, {
					models = {
						image = f778_local9.uiMaterial
					},
					properties = {
						unlocked = Engine.ClientHasCollectible( f778_arg0, f778_local1, f778_local8 - 1 )
					}
				} )
			end
		end
	end
	return f778_local0
end )
DataSources.StartMenu = {
	getModel = function ( f779_arg0 )
		local f779_local0 = Engine.CreateModel( Engine.GetModelForController( f779_arg0 ), "StartMenu" )
		local f779_local1 = Engine.CreateModel( f779_local0, "score" )
		local f779_local2 = Engine.GetPlayerListData( f779_arg0, Engine.GetClientNum( f779_arg0 ) )
		local f779_local3 = 0
		if f779_local2.score ~= nil then
			f779_local3 = f779_local2.score
		end
		Engine.SetModelValue( f779_local1, f779_local3 )
		return f779_local0
	end
}
DataSources.PlaceCollectiblesTabs = ListHelper_SetupDataSource( "PDV_PlaceCollectiblesTab", function ( f780_arg0 )
	local f780_local0 = {
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
	if CoD.perController[f780_arg0].inspectingCollectibleSize then
		for f780_local4, f780_local5 in ipairs( f780_local0 ) do
			if f780_local5.properties and f780_local5.properties.collectibleSize == CoD.perController[f780_arg0].inspectingCollectibleSize then
				f780_local5.properties.selectIndex = true
				break
			end
		end
	end
	return f780_local0
end )
DataSources.CollectiblesLayout = {
	getModel = function ( f781_arg0 )
		local f781_local0 = {
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
		local f781_local1 = Engine.CreateModel( Engine.GetModelForController( f781_arg0 ), "collectiblesLayout" )
		local f781_local2 = Engine.CreateModel( Engine.GetModelForController( f781_arg0 ), "safehouse.inClientBunk" )
		if f781_local2 then
			local f781_local3 = Engine.GetCollectibleLayout( Engine.GetModelValue( f781_local2 ) )
			for f781_local16, f781_local17 in ipairs( f781_local0 ) do
				local f781_local18 = Engine.CreateModel( f781_local1, f781_local17 )
				local f781_local19 = Enum.bunkCollectibleSlots_e[f781_local17]
				local f781_local9, f781_local10, f781_local11, f781_local13 = nil
				local f781_local15 = false
				local f781_local12, f781_local14 = nil
				local f781_local20 = f781_local3[f781_local19]
				if f781_local20 and f781_local20.isSet and f781_local18 then
					local f781_local7 = CoD.mapsTable[f781_local20.mapName]
					if f781_local7 and f781_local7.collectibles and f781_local7.collectibles ~= "" then
						local f781_local8 = Engine.GetAssetInfoFromListIndex( f781_local7.collectibles, f781_local20.collectibleIndex )
						if f781_local8 then
							f781_local9 = f781_local8.uiMaterial
							f781_local10 = f781_local8.uiMaterialLarge
							f781_local11 = f781_local8.displayNameLong
							f781_local12 = f781_local8.audioLog or ""
							f781_local13 = f781_local8.uiModel
							f781_local14 = f781_local7.mapName
							f781_local15 = true
						end
					end
				end
				Engine.SetModelValue( Engine.CreateModel( f781_local18, "image" ), f781_local9 or "" )
				Engine.SetModelValue( Engine.CreateModel( f781_local18, "imageLarge" ), f781_local10 or "" )
				Engine.SetModelValue( Engine.CreateModel( f781_local18, "name" ), f781_local11 or "" )
				Engine.SetModelValue( Engine.CreateModel( f781_local18, "model" ), f781_local13 or "tag_origin" )
				Engine.SetModelValue( Engine.CreateModel( f781_local18, "audioLog" ), f781_local12 or "" )
				Engine.SetModelValue( Engine.CreateModel( f781_local18, "collectibleSlot" ), f781_local19 )
				Engine.SetModelValue( Engine.CreateModel( f781_local18, "mapInfo" ), f781_local14 or "" )
				Engine.SetModelValue( Engine.CreateModel( f781_local18, "isSet" ), f781_local15 )
			end
		end
		return f781_local1
	end
}
DataSources.TrainingSimRatingInfo = ListHelper_SetupDataSource( "TrainingSimRatingInfo", function ( f782_arg0 )
	local f782_local0 = {}
	local f782_local1 = Engine.GetPlayerStats( f782_arg0 )
	local f782_local2 = Engine.GetAssetList( "rating_list" )
	if f782_local2 ~= nil then
		for f782_local3 = 2, #f782_local2, 1 do
			f782_local0[f782_local3 - 1] = {
				models = f782_local2[f782_local3]
			}
			f782_local0[f782_local3 - 1].models.completed = f782_local1.trainingSimStats.ranksAchieved[f782_local3 - 1]:get() == 1
		end
	end
	return f782_local0
end )
DataSources.MissionRecordVaultTabs = ListHelper_SetupDataSource( "MRV_MissionRecordVaultTabs", function ( f783_arg0 )
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
end, false, {
	getCount = function ( f784_arg0 )
		local f784_local0 = f784_arg0
		local f784_local1 = f784_arg0.menu
		if f784_local1 then
			f784_local1 = f784_arg0.menu:getModel()
			if f784_local1 then
				f784_local1 = f784_local0 and Engine.GetModel( f784_arg0.menu:getModel(), "showMissionSelect" )
			end
		end
		return ListHelper_GetCount( f784_arg0 ) + (f784_local1 and Engine.GetModelValue( f784_local1 )) - 1
	end,
	getItem = function ( f785_arg0, f785_arg1, f785_arg2 )
		if 5 <= f785_arg2 then
			local f785_local0 = f785_arg1
			local f785_local1 = f785_arg1.menu
			if f785_local1 then
				f785_local1 = f785_arg1.menu:getModel()
				if f785_local1 then
					f785_local1 = f785_local0 and Engine.GetModel( f785_arg1.menu:getModel(), "showMissionSelect" )
				end
			end
			if (f785_local1 and Engine.GetModelValue( f785_local1 )) ~= 1 then
				f785_arg2 = f785_arg2 + 1
			end
		end
		return ListHelper_GetItem( f785_arg0, f785_arg1, f785_arg2 )
	end
} )
DataSources.MissionRecordVaultMapInfo = {
	getModel = function ( f786_arg0 )
		local f786_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo" )
		local f786_local1 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		local f786_local2 = f786_local1 and Engine.GetModelValue( f786_local1 )
		local f786_local3 = CoD.mapsTable[f786_local2]
		if f786_local3 == nil then
			return f786_local0
		end
		Engine.SetModelValue( Engine.CreateModel( f786_local0, "mapId" ), f786_local2 )
		for f786_local7, f786_local8 in ipairs( {
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
			Engine.SetModelValue( Engine.CreateModel( f786_local0, f786_local8 ), f786_local3[f786_local8] )
		end
		f786_local4 = Engine.GetPlayerStats( f786_arg0 )
		f786_local5 = f786_local2
		if string.match( f786_local5, "[0-9]$" ) ~= nil then
			f786_local5 = string.sub( f786_local5, 0, string.len( f786_local5 ) - 1 )
		end
		f786_local6 = f786_local4.PlayerStatsByMap[f786_local5]
		if f786_local6 then
			for f786_local10, f786_local11 in ipairs( {
				"SCORE",
				"KILLS",
				"ASSISTS",
				"HIGHEST_DIFFICULTY"
			} ) do
				Engine.SetModelValue( Engine.CreateModel( f786_local0, f786_local11 ), f786_local6.highestStats[f786_local11]:get() )
			end
		end
		f786_local7 = Engine.GetGDTCampaignMapInfo( f786_local2 )
		if f786_local7 ~= nil then
			for f786_local11, f786_local12 in ipairs( {
				"mapObjective",
				"engageClose",
				"engageMedium",
				"engageLong",
				"resistanceText",
				"operationsBackground"
			} ) do
				Engine.SetModelValue( Engine.CreateModel( f786_local0, f786_local12 ), f786_local7[f786_local12] )
			end
		end
		return f786_local0
	end
}
DataSources.AARAccolades = ListHelper_SetupDataSource( "AARAccolades", function ( f787_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f787_arg0 ), "aarAccoladeMapName" ) )
	local f787_local1 = modelValue
	local f787_local2 = CoD.mapsTable[modelValue]
	if f787_local2 then
		f787_local2 = f787_local1 and CoD.mapsTable[modelValue].accoladelist
	end
	local f787_local3 = {}
	local f787_local4 = f787_local2 and Engine.GetAssetList( f787_local2 )
	if f787_local4 ~= nil then
		for f787_local5 = 1, #f787_local4, 1 do
			f787_local3[f787_local5] = {
				models = f787_local4[f787_local5]
			}
		end
		local f787_local5 = {
			"2",
			"100",
			"17:20",
			"1",
			"0"
		}
		local f787_local6 = Engine.GetPlayerStats( f787_arg0 )
		local f787_local8 = tonumber( Engine.TableLookup( f787_arg0, CoD.statsMilestone, 4, f787_local3[1].models.challengeReference, 0 ) )
		for f787_local9 = 1, #f787_local3, 1 do
			local f787_local12 = tonumber( Engine.TableLookup( f787_arg0, CoD.statsMilestone, 4, f787_local3[f787_local9].models.challengeReference, 0 ) )
			local f787_local13 = tonumber( Engine.TableLookup( f787_arg0, CoD.statsMilestone, 4, f787_local3[f787_local9].models.challengeReference, 2 ) )
			local f787_local14 = Engine.TableLookup( f787_arg0, CoD.statsMilestone, 4, f787_local3[f787_local9].models.challengeReference, 2 ) == "1"
			local f787_local15 = f787_local6.PlayerStatsByMap[modelValue].accolades[f787_local12 - f787_local8].state:get()
			local f787_local16 = f787_local6.PlayerStatsByMap[modelValue].accolades[f787_local12 - f787_local8].value:get()
			local f787_local17 = f787_local6.PlayerStatsByMap[modelValue].accolades[f787_local12 - f787_local8].highestValue:get()
			f787_local3[f787_local9].models.completed = f787_local15 ~= 0
			if f787_local14 then
				if f787_local3[f787_local9].models.completed == true then
					f787_local3[f787_local9].models.challengeProgressQuantity = ""
					f787_local3[f787_local9].models.highestValue = ""
				else
					f787_local3[f787_local9].models.challengeProgressQuantity = "CPUI_INCOMPLETE"
					f787_local3[f787_local9].models.highestValue = "CPUI_INCOMPLETE"
				end
			else
				f787_local3[f787_local9].models.challengeProgressQuantity = tostring( f787_local16 )
				f787_local3[f787_local9].models.highestValue = tostring( f787_local17 )
			end
			if IsCPAndInSafehouse() then
				f787_local3[f787_local9].models.challengeProgressQuantity = f787_local3[f787_local9].models.highestValue
			end
		end
	end
	return f787_local3
end )
DataSources.MissionRecordVaultChallengeInfo = ListHelper_SetupDataSource( "MissionRecordVaultChallengeInfo", function ( f788_arg0 )
	local f788_local0 = Dvar.ui_mapname:get()
	if InSafehouseOrFrontend() then
		local f788_local1 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		f788_local0 = f788_local1 and Engine.GetModelValue( f788_local1 )
	end
	local f788_local1 = CoD.GetMapValue( f788_local0, "rootMapName" )
	local f788_local2 = f788_local1
	local f788_local3 = CoD.mapsTable[f788_local1]
	if f788_local3 then
		f788_local3 = f788_local2 and CoD.mapsTable[f788_local1].accoladelist
	end
	local f788_local4 = {}
	local f788_local5 = f788_local3 and Engine.GetAssetList( f788_local3 )
	if f788_local5 ~= nil then
		for f788_local6 = 1, #f788_local5, 1 do
			f788_local4[f788_local6] = {
				models = f788_local5[f788_local6]
			}
		end
		local f788_local6 = {
			"2",
			"100",
			"17:20",
			"1",
			"0"
		}
		local f788_local7 = Engine.GetPlayerStats( f788_arg0 )
		local f788_local8 = CoD.statsMilestone
		if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true then
			f788_local7 = CoD.GetCombatRecordStats( f788_arg0 )
			f788_local8 = CoD.getStatsMilestoneTable( 1, Enum.eModes.MODE_CAMPAIGN )
		end
		local f788_local9 = CoD.mapsTable[f788_local0].rootMapName
		local f788_local10 = tonumber( Engine.TableLookup( f788_arg0, f788_local8, 4, f788_local4[1].models.challengeReference, 0 ) )
		for f788_local11 = 1, #f788_local4, 1 do
			local f788_local14 = tonumber( Engine.TableLookup( f788_arg0, f788_local8, 4, f788_local4[f788_local11].models.challengeReference, 0 ) )
			local f788_local15 = tonumber( Engine.TableLookup( f788_arg0, f788_local8, 4, f788_local4[f788_local11].models.challengeReference, 2 ) )
			local f788_local16 = Engine.TableLookup( f788_arg0, f788_local8, 4, f788_local4[f788_local11].models.challengeReference, 2 ) == "1"
			local f788_local17 = f788_local7.PlayerStatsByMap[f788_local9].accolades[f788_local14 - f788_local10].state:get()
			local f788_local18 = f788_local7.PlayerStatsByMap[f788_local9].accolades[f788_local14 - f788_local10].value:get()
			local f788_local19 = f788_local7.PlayerStatsByMap[f788_local9].accolades[f788_local14 - f788_local10].highestValue:get()
			f788_local4[f788_local11].models.completed = f788_local17 ~= 0
			if f788_local16 then
				if f788_local4[f788_local11].models.completed == true then
					f788_local4[f788_local11].models.challengeProgressQuantity = ""
					f788_local4[f788_local11].models.highestValue = ""
				else
					f788_local4[f788_local11].models.challengeProgressQuantity = "CPUI_INCOMPLETE"
					f788_local4[f788_local11].models.highestValue = "CPUI_INCOMPLETE"
				end
			else
				f788_local4[f788_local11].models.challengeProgressQuantity = tostring( f788_local18 )
				f788_local4[f788_local11].models.highestValue = tostring( f788_local19 )
			end
			if IsCPAndInSafehouse() then
				f788_local4[f788_local11].models.challengeProgressQuantity = f788_local4[f788_local11].models.highestValue
			end
		end
	end
	return f788_local4
end, true )
DataSources.WeaponCustomCategory = ListHelper_SetupDataSource( "WeaponCustomizationCategory", function ( f789_arg0 )
	local f789_local0 = {}
	local f789_local1 = CoD.perController[f789_arg0].classModel
	local f789_local2 = CoD.perController[f789_arg0].weaponCategory
	local f789_local3 = Engine.GetModelValue( Engine.GetModel( f789_local1, f789_local2 .. ".itemIndex" ) )
	local f789_local4 = Engine.GetNumAttachments( f789_local3 )
	local f789_local5 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	local f789_local6 = "primaryattachment"
	if f789_local2 == "secondary" then
		f789_local5 = CoD.CACUtility.SecondaryAttachmentSlotNameList
		f789_local6 = "secondaryattachment"
	end
	local f789_local7 = Engine.CurrentSessionMode()
	if f789_local7 == Enum.eModes.MODE_COUNT then
		f789_local7 = Enum.eModes.MODE_MULTIPLAYER
	end
	local f789_local8 = CoD.CACUtility.GetCameraNameForAttachments( Engine.GetWeaponString( f789_arg0, CoD.perController[f789_arg0].classNum, f789_local2, f789_local7 ) )
	local f789_local9 = function ( f790_arg0, f790_arg1, f790_arg2, f790_arg3, f790_arg4, f790_arg5, f790_arg6 )
		return {
			models = {
				displayText = f790_arg0,
				type = f790_arg1,
				name = f790_arg2,
				image = f790_arg3 or "blacktransparent",
				paintjobSlot = f790_arg4,
				paintjobIndex = f790_arg5,
				paintjobSlotAndIndex = f790_arg6
			},
			properties = {
				weaponItemIndex = f789_local3
			}
		}
	end
	
	local f789_local10 = function ( f791_arg0, f791_arg1, f791_arg2, f791_arg3, f791_arg4, f791_arg5, f791_arg6 )
		local f791_local0 = f789_local9( f791_arg0, f791_arg1, f791_arg2, f791_arg3, f791_arg4, f791_arg5, f791_arg6 )
		f791_local0.properties.viewWidget = "CoD.WeaponCustomizationSelect"
		f791_local0.properties.xcamNotetrack = f789_local8
		return f791_local0
	end
	
	local f789_local11 = Engine.GetModel( f789_local1, f789_local2 .. "paintjobslot" )
	local f789_local12 = Engine.GetModel( f789_local1, f789_local2 .. "paintjobindex" )
	local f789_local13 = Engine.GetModelValue( Engine.GetModel( f789_local11, "itemIndex" ) )
	local f789_local14 = Engine.GetModelValue( Engine.GetModel( f789_local12, "itemIndex" ) )
	local f789_local15 = nil
	if Paintjobs_IsEnabled( nil, f789_arg0 ) and not IsUserContentRestricted( f789_arg0 ) then
		table.insert( f789_local0, f789_local10( Engine.Localize( "MENU_FILESHARE_CATEGORY_PAINTJOBS" ), "paintjob", "", nil, f789_local13, f789_local14, f789_local13 .. " " .. f789_local14 ) )
	end
	local f789_local16 = Engine.GetModel( f789_local1, f789_local2 .. "camo" )
	local f789_local17 = f789_local10( Engine.Localize( "MPUI_CAMO" ), "camo", Engine.GetModelValue( Engine.GetModel( f789_local16, "name" ) ), Engine.GetModelValue( Engine.GetModel( f789_local16, "image" ) ), nil, nil, nil )
	f789_local17.properties.isCamo = true
	table.insert( f789_local0, f789_local17 )
	if AllowWeaponPrestige( f789_arg0 ) then
		for f789_local23, f789_local24 in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
			local f789_local25 = Engine.GetAttachmentIndexByAttachmentTableIndex( f789_local3, Engine.GetAttachmentIndexByRef( f789_local24 ) )
			if f789_local25 and CoD.CACUtility.EmptyItemIndex < f789_local25 then
				local f789_local21 = Engine.GetModelValue( Engine.GetModel( f789_local1, f789_local2 .. CoD.CACUtility[f789_local2 .. "WeaponPrestigeSlot"] .. ".name" ) )
				local f789_local22 = Engine.GetModelValue( Engine.GetModel( f789_local1, f789_local2 .. CoD.CACUtility[f789_local2 .. "WeaponPrestigeSlot"] .. ".image" ) )
				if f789_local21 == "" then
				
				else
					table.insert( f789_local0, f789_local10( Engine.Localize( "MENU_WEAPON_PRESTIGE" ), CoD.CACUtility[f789_local2 .. "WeaponPrestigeSlot"], f789_local21, f789_local22, nil, nil, nil ) )
					break
				end
				f789_local21 = "MPUI_NONE"
			end
		end
	end
	return f789_local0
end, false )
DataSources.WeaponOptions = {
	prepare = function ( f792_arg0, f792_arg1, f792_arg2 )
		if not CoD.WeaponOptionsTable then
			CoD.WeaponOptionsTable = CoD.GetWeaponOptionsTable( f792_arg0, f792_arg1, f792_arg2 )
		end
		f792_arg1.weaponOptions = CoD.WeaponOptionsTable
	end,
	getCount = function ( f793_arg0 )
		local f793_local0 = DataSources.WeaponOptions.currentFilter
		if not f793_local0 and f793_arg0.weaponOptions.filterList then
			return #f793_arg0.weaponOptions.filterList
		elseif f793_arg0.weaponOptions[f793_local0] then
			return #f793_arg0.weaponOptions[f793_local0]
		else
			return 0
		end
	end,
	getItem = function ( f794_arg0, f794_arg1, f794_arg2 )
		local f794_local0 = DataSources.WeaponOptions.currentFilter
		if not f794_local0 and f794_arg1.weaponOptions.filterList then
			return f794_arg1.weaponOptions.filterList[f794_arg2]
		elseif f794_arg1.weaponOptions[f794_local0] then
			return f794_arg1.weaponOptions[f794_local0][f794_arg2]
		else
			
		end
	end,
	setCurrentFilterItem = function ( f795_arg0 )
		DataSources.WeaponOptions.currentFilter = f795_arg0
	end,
	getCurrentFilterItem = function ()
		return DataSources.WeaponOptions.currentFilter
	end,
	currentFilter = nil,
	setCurrentFilterItemNoMode = function ( f797_arg0 )
		DataSources.WeaponOptions.currentFilterNoMode = f797_arg0
	end,
	getCurrentFilterItemNoMode = function ()
		return DataSources.WeaponOptions.currentFilterNoMode
	end,
	currentFilterNoMode = nil
}
DataSources.GunsmithWeaponOptions = {
	prepare = function ( f799_arg0, f799_arg1, f799_arg2 )
		if not CoD.GunsmithWeaponOptionsTable then
			CoD.GunsmithWeaponOptionsTable = CoD.GetGunsmithWeaponOptionsTable( f799_arg0, f799_arg1, f799_arg2 )
		end
		f799_arg1.gunsmithWeaponOptions = CoD.GunsmithWeaponOptionsTable
	end,
	getCount = function ( f800_arg0 )
		local f800_local0 = DataSources.GunsmithWeaponOptions.currentFilter
		if not f800_local0 and f800_arg0.gunsmithWeaponOptions.filterList then
			return #f800_arg0.gunsmithWeaponOptions.filterList
		elseif f800_arg0.gunsmithWeaponOptions[f800_local0] then
			return #f800_arg0.gunsmithWeaponOptions[f800_local0]
		else
			return 0
		end
	end,
	getItem = function ( f801_arg0, f801_arg1, f801_arg2 )
		local f801_local0 = DataSources.GunsmithWeaponOptions.currentFilter
		if not f801_local0 and f801_arg1.gunsmithWeaponOptions.filterList then
			return f801_arg1.gunsmithWeaponOptions.filterList[f801_arg2]
		elseif f801_arg1.gunsmithWeaponOptions[f801_local0] then
			return f801_arg1.gunsmithWeaponOptions[f801_local0][f801_arg2]
		else
			
		end
	end,
	setCurrentFilterItem = function ( f802_arg0 )
		DataSources.GunsmithWeaponOptions.currentFilter = f802_arg0
	end,
	getCurrentFilterItem = function ()
		return DataSources.GunsmithWeaponOptions.currentFilter
	end,
	currentFilter = nil,
	setCurrentFilterItemNoMode = function ( f804_arg0 )
		DataSources.GunsmithWeaponOptions.currentFilterNoMode = f804_arg0
	end,
	getCurrentFilterItemNoMode = function ()
		return DataSources.GunsmithWeaponOptions.currentFilterNoMode
	end,
	currentFilterNoMode = nil
}
DataSources.AttachmentCosmeticVariantList = ListHelper_SetupDataSource( "AttachmentCosmeticVariantList", function ( f806_arg0 )
	local f806_local0 = {}
	local f806_local1 = function ( f807_arg0, f807_arg1 )
		local f807_local0 = f807_arg0.acvName
		local f807_local1 = CoD.BlackMarketUtility.IsItemLocked( f806_arg0, f807_local0 )
		local f807_local2 = f807_arg0.name
		if f807_local1 then
			f807_local2 = CoD.BlackMarketUtility.ClassifiedName()
		end
		return {
			models = {
				name = Engine.Localize( f807_local2 ),
				image = f807_arg0.image or "blacktransparent",
				variantIndex = f807_arg0.variantIndex,
				isBMClassified = f807_local1,
				rarityType = {
					rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f807_local0 ),
					isBMClassified = f807_local1,
					duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( f806_arg0, f807_local0 )
				}
			},
			properties = {
				attachmentRef = f807_arg1,
				variantIndex = f807_arg0.variantIndex,
				itemIndex = CoD.WC_Category.ACV.selectedAttachmentIndex,
				attachmentTableIndex = CoD.WC_Category.ACV.attachmentTable[f807_arg1].attachmentIndex
			}
		}
	end
	
	local f806_local2 = Engine.GetAttachmentUniqueImageByIndex( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex, CoD.WC_Category.ACV.selectedAttachmentIndex )
	local f806_local3 = CoD.WC_Category.ACV.selectedAttachment
	if CoD.WC_Category.ACV.attachmentTable[f806_local3] then
		local f806_local4 = f806_local1( {
			name = "MENU_DEFAULT",
			image = f806_local2,
			variantIndex = 0
		}, f806_local3 )
		f806_local4.models.isClassified = false
		table.insert( f806_local0, f806_local4 )
		for f806_local8, f806_local9 in ipairs( CoD.WC_Category.ACV.attachmentTable[f806_local3].variants ) do
			table.insert( f806_local0, f806_local1( f806_local9, f806_local3 ) )
		end
	end
	table.sort( f806_local0, CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex )
	return f806_local0
end, true )
DataSources.GunsmithAttachmentVariantList = ListHelper_SetupDataSource( "GunsmithAttachmentVariantList", function ( f808_arg0 )
	local f808_local0 = {}
	local f808_local1 = function ( f809_arg0, f809_arg1, f809_arg2 )
		local f809_local0 = CoD.BlackMarketUtility.IsItemLocked( f808_arg0, f809_arg0.acvName )
		local f809_local1 = f809_arg0.name
		if f809_local0 then
			f809_local1 = CoD.BlackMarketUtility.ClassifiedName()
		end
		return {
			models = {
				name = Engine.Localize( f809_local1 ),
				image = f809_arg0.image or "blacktransparent",
				variantIndex = f809_arg0.variantIndex,
				isBMClassified = f809_local0,
				attachmentIndex = f809_arg2,
				rarityType = {
					rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f809_arg0.acvName ),
					isBMClassified = f809_local0
				}
			},
			properties = {
				attachmentRef = f809_arg1,
				variantIndex = f809_arg0.variantIndex,
				attachmentTableIndex = f809_arg2
			}
		}
	end
	
	local f808_local2 = CoD.perController[f808_arg0].gunsmithAttachmentModel
	local f808_local3 = CoD.perController[f808_arg0].gunsmithVariantModel
	local f808_local4 = Engine.GetAttachmentCosmeticVariantTable( CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f808_arg0, f808_local3 ) )
	if f808_local2 and f808_local3 then
		local f808_local5 = Engine.GetModelValue( f808_local2 )
		local f808_local6 = Engine.GetAttachmentRefByIndex( f808_local5 )
		local f808_local7 = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, CoD.GetCustomization( f808_arg0, "weapon_index" ), f808_local5 )
		if f808_local4[f808_local6] then
			local f808_local8 = f808_local1( {
				name = "MENU_DEFAULT",
				image = f808_local7,
				variantIndex = 0
			}, f808_local6, f808_local5 )
			f808_local8.models.isClassified = false
			table.insert( f808_local0, f808_local8 )
			for f808_local12, f808_local13 in ipairs( f808_local4[f808_local6].variants ) do
				table.insert( f808_local0, f808_local1( f808_local13, f808_local6, f808_local5 ) )
			end
		end
	end
	table.sort( f808_local0, CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex )
	return f808_local0
end, true )
DataSources.Arena = {
	getModel = function ( f810_arg0 )
		local f810_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
		local f810_local1 = Engine.GetCurrentArenaSeason()
		local f810_local2 = Engine.GetCurrentArenaSeasonTimeRemaining()
		Engine.SetModelValue( Engine.CreateModel( f810_local0, "season" ), f810_local1 )
		Engine.SetModelValue( Engine.CreateModel( f810_local0, "seasonTimeleft" ), f810_local2 )
		return f810_local0
	end
}
DataSources.ArenaRank = {
	getModel = function ( f811_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f811_arg0 ), "ArenaRank" )
	end
}
DataSources.ArenaInspectionStars = ListHelper_SetupDataSource( "ArenaInspectionStars", function ( f812_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "Arena" ), "selectedPlayerPoints" ) )
	local f812_local1 = CoD.ArenaUtility.GetRankVisibleStars( modelValue )
	local f812_local2 = CoD.ArenaUtility.GetStarCount( modelValue )
	local f812_local3 = {}
	for f812_local4 = 0, f812_local1 - 1, 1 do
		table.insert( f812_local3, {
			models = {
				earned = f812_local4 < f812_local2
			}
		} )
	end
	return f812_local3
end, nil, nil, function ( f813_arg0, f813_arg1, f813_arg2 )
	local f813_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "Arena" ), "selectedPlayerPoints" )
	if f813_arg1.updateSubscription then
		f813_arg1:removeSubscription( f813_arg1.updateSubscription )
	end
	f813_arg1.updateSubscription = f813_arg1:subscribeToModel( f813_local0, function ()
		f813_arg1:updateDataSource()
	end, false )
end )
DataSources.ArenaActiveRules = ListHelper_SetupDataSource( "ArenaActiveRules", function ( f815_arg0 )
	local f815_local0 = {}
	if not IsArenaMode() then
		return f815_local0
	elseif PregameItemVoteEnabled() then
		table.insert( f815_local0, {
			models = {
				text = Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_CAPS" )
			}
		} )
	end
	if CharacterDraftEnabled() then
		table.insert( f815_local0, {
			models = {
				text = Engine.Localize( "MENU_DRAFT_ACTIVE_CAPS" )
			}
		} )
	end
	return f815_local0
end, nil, nil, function ( f816_arg0, f816_arg1, f816_arg2 )
	local f816_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyNav" )
	if f816_arg1.lobbyNavSubscription then
		f816_arg1:removeSubscription( f816_arg1.lobbyNavSubscription )
	end
	f816_arg1.lobbyNavSubscription = f816_arg1:subscribeToModel( f816_local0, function ()
		f816_arg1:updateDataSource( true, false )
	end, false )
end )
DataSources.ArenaSeasonMonths = {
	getModel = function ( f818_arg0 )
		local f818_local0 = Engine.GetCurrentArenaSeason()
		local f818_local1 = Engine.GetArenaSeasonStartTime( f818_local0 )
		local f818_local2 = Engine.GetArenaSeasonStartTime( f818_local0 - 1 )
		local f818_local3 = Engine.GetMonthStringForTimestamp( f818_local1 )
		local f818_local4 = Engine.GetMonthStringForTimestamp( f818_local2 )
		local f818_local5 = Engine.CreateModel( Engine.GetModelForController( f818_arg0 ), "ArenaSeasonMonths" )
		Engine.SetModelValue( Engine.CreateModel( f818_local5, "currentSeasonMonth" ), f818_local3 )
		Engine.SetModelValue( Engine.CreateModel( f818_local5, "previousSeasonMonth" ), f818_local4 )
		return f818_local5
	end
}
DataSources.FrontendVoip = {
	prepare = function ( f819_arg0, f819_arg1, f819_arg2 )
		
	end,
	getCount = function ( f820_arg0 )
		return LuaEnums.MAX_CLIENTS
	end,
	getItem = function ( f821_arg0, f821_arg1, f821_arg2 )
		local f821_local0 = Engine.GetModel( Engine.GetModelForController( f821_arg0 ), "hudItems.voipInfo" )
		if f821_local0 then
			return Engine.GetModel( f821_local0, "voip" .. tostring( f821_arg2 ) )
		else
			
		end
	end
}
DataSources.LoadingScreenPlayerListTeam1 = {
	prepare = function ( f822_arg0, f822_arg1, f822_arg2 )
		local f822_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
		if f822_arg1.teamCountSubscription then
			f822_arg1:removeSubscription( f822_arg1.teamCountSubscription )
		end
		f822_arg1.teamCountSubscription = f822_arg1:subscribeToModel( f822_local0, function ()
			f822_arg1:updateDataSource()
		end, false )
		local f822_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f822_local2 = {
			teamInfo = {}
		}
		f822_local2.teamInfo[1] = {}
		f822_local2.teamInfo[2] = {}
		local f822_local3 = 0
		local f822_local4 = 2
		local f822_local5
		if Engine.GetGametypeSetting( "teamCount" ) >= 2 and Dvar.ui_gametype:get() ~= "infect" then
			f822_local5 = false
		else
			f822_local5 = true
		end
		local f822_local6 = 6
		if f822_local5 then
			f822_local6 = 12
		end
		f822_arg1.maxMembersToShowOnEachTeam = f822_local6
		if f822_local1 and f822_local1.sessionClients then
			f822_local3 = #f822_local1.sessionClients
			local f822_local7 = nil
			for f822_local8 = 1, f822_local3, 1 do
				local f822_local11 = f822_local1.sessionClients[f822_local8]
				local f822_local12 = f822_local11.team
				local f822_local13 = f822_local11.xuid
				local f822_local14 = f822_local11.gamertag
				local f822_local15 = f822_local11.clantag
				if f822_local5 or f822_local12 == Enum.team_t.TEAM_ALLIES or f822_local12 == Enum.team_t.TEAM_FREE then
					table.insert( f822_local2.teamInfo[1], {
						name = f822_local14,
						clantag = f822_local15,
						xuid = f822_local13,
						team = f822_local12
					} )
				elseif f822_local12 == Enum.team_t.TEAM_AXIS then
					table.insert( f822_local2.teamInfo[2], {
						name = f822_local14,
						clantag = f822_local15,
						xuid = f822_local13,
						team = f822_local12
					} )
				end
				if Engine.GetXUID64( f822_arg0 ) == f822_local13 then
					f822_local7 = f822_local12
				end
			end
			local f822_local10 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "LoadingScreenInfo" ), "LoadingScreenPlayerList" )
			local f822_local16 = Engine.CreateModel( f822_local10, "team1" )
			local f822_local11 = Engine.CreateModel( f822_local16, "count" )
			local f822_local12 = Engine.CreateModel( f822_local10, "team2" )
			local f822_local13 = Engine.CreateModel( f822_local12, "count" )
			f822_arg1.team1CountModel = f822_local11
			f822_arg1.team1BaseModel = f822_local16
			f822_arg1.team2CountModel = f822_local13
			f822_arg1.team2BaseModel = f822_local12
			f822_local2.teamInfo[1].teamModel = f822_local16
			f822_local2.teamInfo[2].teamModel = f822_local12
			Engine.SetModelValue( f822_local11, #f822_local2.teamInfo[1] )
			Engine.SetModelValue( f822_local13, #f822_local2.teamInfo[2] )
			if not f822_local5 and f822_local7 ~= Enum.team_t.TEAM_ALLIES then
				f822_local2.teamInfo[1].teamModel = f822_local12
				f822_local2.teamInfo[2].teamModel = f822_local16
				Engine.SetModelValue( f822_local11, #f822_local2.teamInfo[2] )
				Engine.SetModelValue( f822_local13, #f822_local2.teamInfo[1] )
			end
			for f822_local14 = 1, f822_local4, 1 do
				for f822_local18 = 1, f822_local6, 1 do
					local f822_local21 = Engine.CreateModel( f822_local2.teamInfo[f822_local14].teamModel, "member" .. f822_local18 )
					if f822_local2.teamInfo[f822_local14][f822_local18] then
						Engine.SetModelValue( Engine.CreateModel( f822_local21, "playerxuid" ), f822_local2.teamInfo[f822_local14][f822_local18].xuid )
						Engine.SetModelValue( Engine.CreateModel( f822_local21, "playerName" ), f822_local2.teamInfo[f822_local14][f822_local18].name )
						local f822_local22 = Engine.CreateModel( f822_local21, "playerHeroLoadoutItem" )
						local f822_local23 = 0
						local f822_local24 = Engine.GetHeroLoadoutItemIndexLobbyData( Engine.CurrentSessionMode(), f822_local2.teamInfo[f822_local14][f822_local18].xuid )
						local f822_local25 = ""
						if f822_local24 ~= 0 then
							f822_local25 = Engine.GetItemName( f822_local24 )
						end
						Engine.SetModelValue( f822_local22, f822_local25 )
						local f822_local26 = Engine.CreateModel( f822_local21, "isSelfPlayerName" )
						local f822_local27 = false
						for f822_local28 = 0, Engine.GetMaxControllerCount() - 1, 1 do
							f822_local27 = Engine.GetXUID64( f822_local28 ) == f822_local2.teamInfo[f822_local14][f822_local18].xuid
							if f822_local27 then
								break
							end
						end
						Engine.SetModelValue( f822_local26, f822_local27 )
						Engine.SetModelValue( Engine.CreateModel( f822_local21, "team" ), f822_local2.teamInfo[f822_local14][f822_local18].team )
					end
				end
			end
		else
			return 
		end
	end,
	getCount = function ( f824_arg0 )
		if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
			return 0
		end
		local f824_local0 = Engine.GetModelValue( f824_arg0.team1CountModel )
		local f824_local1 = Engine.GetModelValue( f824_arg0.team2CountModel )
		local f824_local2 = f824_arg0.maxMembersToShowOnEachTeam
		local f824_local3
		if Engine.GetGametypeSetting( "teamCount" ) >= 2 and Dvar.ui_gametype:get() ~= "infect" then
			f824_local3 = false
		else
			f824_local3 = true
		end
		if not (not f824_local3 or f824_local0 > f824_local2) or f824_local0 <= f824_local2 and f824_local1 <= f824_local2 then
			return f824_local0
		end
		return 0
	end,
	getItem = function ( f825_arg0, f825_arg1, f825_arg2 )
		return Engine.GetModel( f825_arg1.team1BaseModel, "member" .. f825_arg2 )
	end
}
DataSources.LoadingScreenPlayerListTeam2 = {
	prepare = function ( f826_arg0, f826_arg1, f826_arg2 )
		DataSources.LoadingScreenPlayerListTeam1.prepare( f826_arg0, f826_arg1, f826_arg2 )
	end,
	getCount = function ( f827_arg0 )
		if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
			return 0
		else
			local f827_local0 = Engine.GetModelValue( f827_arg0.team1CountModel )
			local f827_local1 = Engine.GetModelValue( f827_arg0.team2CountModel )
			local f827_local2 = f827_arg0.maxMembersToShowOnEachTeam
			if f827_local0 <= f827_local2 and f827_local1 <= f827_local2 then
				return f827_local1
			else
				return 0
			end
		end
	end,
	getItem = function ( f828_arg0, f828_arg1, f828_arg2 )
		return Engine.GetModel( f828_arg1.team2BaseModel, "member" .. f828_arg2 )
	end
}
DataSources.MapInfo = {
	getModel = function ( f829_arg0 )
		local f829_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MapInfo" )
		Engine.SetModelValue( Engine.CreateModel( f829_local0, "gameTypeIcon" ), CoD.GetLoadingScreenGameTypeIconName() )
		Engine.SetModelValue( Engine.CreateModel( f829_local0, "gameType" ), Engine.GetCurrentGametypeName( f829_arg0 ) )
		Engine.SetModelValue( Engine.CreateModel( f829_local0, "mapName" ), MapNameToLocalizedMapName( Engine.GetCurrentMap() ) )
		local f829_local1 = Engine.CreateModel( f829_local0, "mapImage" )
		local f829_local2 = CoD.GetMapValue( Dvar.ui_mapname:get(), "loadingImage", "black" )
		if Engine.IsUsingUsermap() then
			f829_local2 = "img_t7_mod_loading"
		end
		Engine.SetModelValue( f829_local1, f829_local2 )
		if not Engine.IsCampaignModeZombies() then
			Engine.SetModelValue( Engine.CreateModel( f829_local0, "dateTime" ), CoD.GetMapValue( Engine.GetCurrentMapName(), "mapDateTime", "" ) )
		end
		Engine.SetModelValue( Engine.CreateModel( f829_local0, "location" ), Dvar.ls_maplocation:get() )
		return f829_local0
	end
}
DataSources.LoadingScreenTeamInfo = {
	getModel = function ( f830_arg0 )
		local f830_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f830_arg0 ), "LoadingScreenInfo" ), "LoadingScreenTeamInfo" )
		local f830_local1 = Engine.CreateModel( f830_local0, "team1FactionName" )
		local f830_local2 = Engine.CreateModel( f830_local0, "team2FactionName" )
		local f830_local3 = Engine.CreateModel( f830_local0, "team1FactionIcon" )
		local f830_local4 = Engine.CreateModel( f830_local0, "team2FactionIcon" )
		local f830_local5 = Engine.CreateModel( f830_local0, "team1FactionColor" )
		local f830_local6 = Engine.CreateModel( f830_local0, "team2FactionColor" )
		local f830_local7 = Engine.CreateModel( f830_local0, "gameTypeIcon" )
		local f830_local8 = Engine.CreateModel( f830_local0, "gameType" )
		local f830_local9 = Engine.CreateModel( f830_local0, "mapName" )
		local f830_local10 = Engine.CreateModel( f830_local0, "location" )
		local f830_local11 = Engine.CreateModel( f830_local0, "tip" )
		local f830_local12 = Engine.CreateModel( f830_local0, "statusText" )
		local f830_local13 = Engine.CreateModel( f830_local0, "loadedFraction" )
		local f830_local14, f830_local15 = nil
		local f830_local16 = CoD.GetTeamID( f830_arg0 )
		local f830_local17 = {
			name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
			icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
			color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
		}
		local f830_local18 = {
			name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
			icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
			color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
		}
		if f830_local16 == Enum.team_t.TEAM_SPECTATOR then
			if CoD.ShoutcasterProfileVarBool( f830_arg0, "shoutcaster_flip_scorepanel" ) then
				f830_local14 = f830_local18
				f830_local15 = f830_local17
			else
				f830_local14 = f830_local17
				f830_local15 = f830_local18
			end
		elseif f830_local16 == Enum.team_t.TEAM_ALLIES then
			f830_local14 = f830_local17
			f830_local15 = f830_local18
		else
			f830_local14 = f830_local18
			f830_local15 = f830_local17
		end
		Engine.SetModelValue( f830_local1, f830_local14.name )
		Engine.SetModelValue( f830_local3, f830_local14.icon )
		Engine.SetModelValue( f830_local5, f830_local14.color )
		Engine.SetModelValue( f830_local2, f830_local15.name )
		Engine.SetModelValue( f830_local4, f830_local15.icon )
		Engine.SetModelValue( f830_local6, f830_local15.color )
		Engine.SetModelValue( f830_local7, CoD.GetLoadingScreenGameTypeIconName() )
		Engine.SetModelValue( f830_local8, Engine.GetCurrentGametypeName( f830_arg0 ) )
		Engine.SetModelValue( f830_local9, MapNameToLocalizedMapName( Engine.GetCurrentMap() ) )
		Engine.SetModelValue( f830_local10, "" )
		if CoD.Loading ~= nil then
			Engine.SetModelValue( f830_local11, CoD.Loading.GetDidYouKnowString() )
		end
		Engine.SetModelValue( f830_local12, "" )
		Engine.SetModelValue( f830_local13, 0 )
		return f830_local0
	end
}
DataSources.AbilityWheel = {
	getModel = function ( f831_arg0 )
		local f831_local0 = CoD.CACUtility.abilityButtonNumMapping
		local f831_local1 = Engine.CreateModel( Engine.GetModelForController( f831_arg0 ), "AbilityWheel" )
		local f831_local2 = Engine.GetModel( Engine.GetModelForController( f831_arg0 ), "hudItems.cybercomRequestedType" )
		Engine.CreateModel( f831_local1, "selectedAbilityDisplayName" )
		Engine.CreateModel( f831_local1, "selectedAbilityDisplayDesc" )
		Engine.CreateModel( f831_local1, "selectedAbilityDisplayIcon" )
		if Engine.GetModelValue( f831_local2 ) == nil then
			Engine.SetModelValue( f831_local2, 0 )
		end
		local f831_local3 = Engine.GetModelValue( f831_local2 )
		local f831_local4 = {
			"MENU_CONTROL",
			"MENU_MARTIAL",
			"MENU_CHAOS",
			"MENU_DEMO"
		}
		Engine.SetModelValue( Engine.CreateModel( f831_local1, "name" ), f831_local4[f831_local3 + 1] )
		local f831_local5 = function ( f832_arg0 )
			Engine.SetModelValue( Engine.CreateModel( f832_arg0, "name" ), nil )
			Engine.SetModelValue( Engine.CreateModel( f832_arg0, "image" ), nil )
			Engine.SetModelValue( Engine.CreateModel( f832_arg0, "enabled" ), false )
		end
		
		local f831_local6 = 0
		local f831_local7 = 0
		for f831_local8 = 1, CoD.CACUtility.maxAbilities, 1 do
			local f831_local11 = Engine.GetTacticalMenuItems( f831_arg0, f831_local8 - 1, f831_local3 )
			local f831_local12 = nil
			if f831_local11.contextual then
				f831_local12 = Engine.CreateModel( f831_local1, "AbilityWheelContextualWeapon" .. f831_local7 + 1 )
			else
				f831_local12 = Engine.CreateModel( f831_local1, "AbilityWheelWeapon" .. f831_local0[f831_local6 + 1] )
			end
			Engine.SetModelValue( Engine.CreateModel( f831_local12, "image" ), f831_local11.image )
			Engine.SetModelValue( Engine.CreateModel( f831_local12, "name" ), f831_local11.name )
			Engine.SetModelValue( Engine.CreateModel( f831_local12, "displayName" ), f831_local11.displayName )
			Engine.SetModelValue( Engine.CreateModel( f831_local12, "abilityFlag" ), f831_local11.abilityFlag )
			local f831_local13 = Engine.CreateModel( f831_local12, "enabled" )
			if f831_local11.enabled == nil then
				Engine.SetModelValue( f831_local13, true )
			else
				Engine.SetModelValue( f831_local13, f831_local11.enabled )
			end
			local f831_local14 = Engine.CreateModel( f831_local12, "description" )
			if f831_local11.description ~= nil then
				Engine.SetModelValue( f831_local14, "weapon_" .. f831_local11.description )
			end
			local f831_local15 = Engine.CreateModel( f831_local12, "enemyTypeIcon" )
			if f831_local11.enemyTypeIcon ~= nil then
				Engine.SetModelValue( f831_local15, f831_local11.enemyTypeIcon )
			end
		end
		for f831_local8 = f831_local6 + 1, CoD.CACUtility.maxAbilityWheelItems, 1 do
			f831_local5( Engine.CreateModel( f831_local1, "AbilityWheelWeapon" .. f831_local0[f831_local8] ) )
		end
		for f831_local8 = f831_local7 + 1, CoD.CACUtility.maxContextualAbilityItems, 1 do
			f831_local5( Engine.CreateModel( f831_local1, "AbilityWheelContextualWeapon" .. f831_local8 ) )
		end
		return f831_local1
	end
}
DataSources.SwitchCameraWheel = {
	getModel = function ( f833_arg0 )
		local f833_local0 = {
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
		local f833_local1 = Engine.CreateModel( Engine.GetModelForController( f833_arg0 ), "SwitchCameraWheel" )
		Engine.CreateModel( f833_local1, "selectedCameraDisplayName" )
		Engine.CreateModel( f833_local1, "selectedCameraDisplayDesc" )
		Engine.SetModelValue( Engine.CreateModel( f833_local1, "name" ), Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_SWITCH_CAMERA" ) ) )
		for f833_local2 = 1, #f833_local0, 1 do
			local f833_local5 = f833_local0[f833_local2]
			local f833_local6 = Engine.CreateModel( f833_local1, "Camera" .. f833_local2 )
			Engine.SetModelValue( Engine.CreateModel( f833_local6, "displayName" ), Engine.Localize( f833_local5.displayName ) )
			Engine.SetModelValue( Engine.CreateModel( f833_local6, "description" ), Engine.Localize( f833_local5.displayName .. "_DESC" ) )
			Engine.SetModelValue( Engine.CreateModel( f833_local6, "image" ), f833_local5.image )
			Engine.SetModelValue( Engine.CreateModel( f833_local6, "disabled" ), f833_local5.disabled )
			Engine.SetModelValue( Engine.CreateModel( f833_local6, "cameraMode" ), f833_local5.cameraMode )
			if f833_local5.freeCameraMode ~= nil then
				Engine.SetModelValue( Engine.CreateModel( f833_local6, "freeCameraMode" ), f833_local5.freeCameraMode )
			end
		end
		return f833_local1
	end
}
DataSources.CommsMessages = ListHelper_SetupDataSource( "CommsMessages", function ( f834_arg0 )
	local f834_local0 = {}
	for f834_local1 = 1, 5, 1 do
		table.insert( f834_local0, {
			models = {
				icon = "",
				messageText = ""
			},
			properties = {
				messageIndex = f834_local1
			}
		} )
	end
	return f834_local0
end )
DataSources.CommsWidget = {
	getModel = function ( f835_arg0 )
		local f835_local0 = Engine.CreateModel( Engine.GetModelForController( f835_arg0 ), "CommsWidget" )
		Engine.SetModelValue( Engine.CreateModel( f835_local0, "characterName" ), "COOP_KANYE_RACHEL" )
		Engine.SetModelValue( Engine.CreateModel( f835_local0, "characterImage" ), "t7_cp_hud_commswidget_rachel" )
		return f835_local0
	end
}
DataSources.VehicleInfo = {
	setButtonModels = function ( f836_arg0, f836_arg1, f836_arg2 )
		local f836_local0 = Engine.GetModel( Engine.GetModelForController( f836_arg0 ), "vehicle" )
		if not f836_local0 then
			return 
		end
		local f836_local1 = Engine.GetModel( f836_local0, "bindings" )
		if f836_local1 then
			Engine.UnsubscribeAndFreeModel( f836_local1 )
		end
		f836_local1 = Engine.CreateModel( f836_local0, "bindings" )
		Engine.SetModelValue( Engine.CreateModel( f836_local1, "color" ), f836_arg2 or "255 255 255" )
		if not f836_arg1 then
			f836_arg1 = {}
		end
		local f836_local2 = IsGamepad( f836_arg0 )
		if f836_local0 then
			local f836_local3 = {}
			for f836_local9, f836_local10 in ipairs( f836_arg1 ) do
				if f836_local10.bindCommand then
					local f836_local7, f836_local8 = Engine.GetBindingButtonString( f836_arg0, f836_local10.bindCommand )
					if f836_local7 then
						if f836_local2 then
							Engine.SetModelValue( Engine.CreateModel( f836_local1, f836_local7 .. ".text" ), f836_local10.text )
						end
						f836_local10.bindPlacement = f836_local7
					end
					if f836_local8 then
						if f836_local2 then
							Engine.SetModelValue( Engine.CreateModel( f836_local1, f836_local8 .. ".text" ), f836_local10.text )
						end
						f836_local10.bindPlacement2 = f836_local8
					end
				end
				f836_local3[f836_local9] = f836_local10
			end
			f836_local4 = function ( f837_arg0, f837_arg1 )
				local f837_local0 = Engine.CreateModel( f836_local0, f837_arg0 .. ".imageText" )
				if f837_arg1 then
					if f837_arg1.bindCommand and f837_arg1.bindCommand ~= "" then
						local f837_local1 = Engine.KeyBinding( f836_arg0, f837_arg1.bindCommand )
						Engine.SetModelValue( Engine.CreateModel( f836_local1, f837_arg0 .. ".bind" ), f837_local1 )
						Engine.SetModelValue( f837_local0, f837_local1 )
					else
						Engine.SetModelValue( f837_local0, f837_arg1.imageText or "" )
					end
				else
					Engine.SetModelValue( f837_local0, "" )
				end
				local f837_local1 = Engine.CreateModel( f836_local0, f837_arg0 .. ".text" )
				if f837_arg1 and f837_arg1.text and f837_arg1.text ~= "" then
					Engine.SetModelValue( Engine.CreateModel( f836_local1, f837_arg0 .. ".text" ), f837_arg1.text )
					Engine.SetModelValue( f837_local1, f837_arg1.text )
				else
					Engine.SetModelValue( f837_local1, "" )
				end
			end
			
			f836_local5 = function ( f838_arg0 )
				local f838_local0 = {}
				local f838_local1 = #f838_arg0
				for f838_local5, f838_local6 in ipairs( f838_arg0 ) do
					f838_local0[f838_local1 + 1 - f838_local5] = f838_local6
				end
				return f838_local0
			end
			
			f836_local6, f836_local9 = nil
			if CoD.isPC then
				f836_local6 = f836_local5( {
					"LEFT_3",
					"LEFT_2",
					"LEFT_1",
					"LEFT_0"
				} )
				f836_local9 = f836_local5( {
					"RIGHT_3",
					"RIGHT_2",
					"RIGHT_1",
					"RIGHT_0"
				} )
			else
				f836_local6 = f836_local5( {
					"topLeftButton",
					"middleLeftButton",
					"bottomLeftButton"
				} )
				f836_local9 = f836_local5( {
					"topRightButton",
					"middleRightButton",
					"bottomRightButton"
				} )
			end
			if f836_local2 then
				f836_local10 = {
					"L_STICK",
					"BUTTON_LSTICK",
					"BUTTON_LSHLDR",
					"BUTTON_LTRIG",
					"BUTTON_X",
					"BUTTON_A"
				}
				local f836_local7 = {
					"R_STICK",
					"BUTTON_RSTICK",
					"BUTTON_RSHLDR",
					"BUTTON_RTRIG"
				}
				local f836_local11 = function ( f839_arg0 )
					local f839_local0 = {}
					for f839_local4, f839_local5 in ipairs( f839_arg0 ) do
						if f839_local5.bindPlacement ~= nil then
							f839_local0[f839_local5.bindPlacement] = f839_local5
						end
					end
					return f839_local0
				end
				
				f836_local11 = f836_local11( f836_local3 )
				local f836_local12 = function ( f840_arg0, f840_arg1, f840_arg2 )
					for f840_local3, f840_local4 in ipairs( f840_arg0 ) do
						if f840_arg2[f840_local4] then
							f836_local4( f840_arg1[1], f840_arg2[f840_local4] )
							table.remove( f840_arg1, 1 )
							if #f840_arg1 == 0 then
								break
							end
						end
					end
					for f840_local3, f840_local4 in ipairs( f840_arg1 ) do
						f836_local4( f840_local4, nil )
					end
				end
				
				leftActions = f836_local5( f836_local10 )
				f836_local12( leftActions, f836_local6, f836_local11 )
				rightActions = f836_local5( f836_local7 )
				f836_local12( rightActions, f836_local9, f836_local11 )
			else
				f836_local10 = {
					"KEYBOARD_MOVE",
					"KEYBOARD_BUTTON",
					"left"
				}
				local f836_local7 = {
					"MOUSE_LOOK",
					"MOUSE_BUTTON",
					"right"
				}
				local f836_local8 = function ( f841_arg0, f841_arg1, f841_arg2 )
					local f841_local0 = function ( f842_arg0, f842_arg1 )
						for f842_local3, f842_local4 in ipairs( f842_arg0 ) do
							if f842_local4.bindCommand == "+lookstick" then
								table.remove( f842_arg0, f842_local3 )
							end
							if f842_local4.screenSide then
								if f842_local4.screenSide == f842_arg1 then
									table.remove( f842_arg0, f842_local3 )
									return f842_local4
								end
							end
							if f842_local4.bindPlacement == f842_arg1 then
								table.remove( f842_arg0, f842_local3 )
								return f842_local4
							end
						end
						return nil
					end
					
					for f841_local5, f841_local6 in ipairs( f841_arg0 ) do
						local f841_local4 = f841_local0( f841_arg2, f841_local6 )
						while f841_local4 ~= nil do
							f836_local4( f841_arg1[1], f841_local4 )
							table.remove( f841_arg1, 1 )
							if #f841_arg1 == 0 then
								
							end
							f841_local4 = f841_local0( f841_arg2, f841_local6 )
						end
					end
					for f841_local5, f841_local6 in ipairs( f841_arg1 ) do
						f836_local4( f841_local6, nil )
					end
				end
				
				leftActions = f836_local5( f836_local10 )
				f836_local8( leftActions, f836_local6, f836_local3 )
				rightActions = f836_local5( f836_local7 )
				f836_local8( rightActions, f836_local9, f836_local3 )
			end
		end
	end,
	clearButtonModels = function ( f843_arg0 )
		DataSources.VehicleInfo.setButtonModels( f843_arg0 )
	end
}
DataSources.Attacker = {
	getModel = function ( f844_arg0 )
		return Engine.GetModel( Engine.GetModelForController( f844_arg0 ), "Attacker" )
	end
}
DataSources.Victim = {
	getModel = function ( f845_arg0 )
		return Engine.GetModel( Engine.GetModelForController( f845_arg0 ), "Victim" )
	end
}
DataSources.TopScorerMenuData = {
	getModel = function ( f846_arg0 )
		return Engine.GetModel( Engine.GetModelForController( f846_arg0 ), "topPlayerInfo" )
	end
}
DataSources.TopPlayerInfoData1 = {
	getModel = function ( f847_arg0 )
		return Engine.GetModel( DataSources.TopScorerMenuData.getModel( f847_arg0 ), "1" )
	end
}
DataSources.TopPlayerInfoData2 = {
	getModel = function ( f848_arg0 )
		return Engine.GetModel( DataSources.TopScorerMenuData.getModel( f848_arg0 ), "2" )
	end
}
DataSources.TopPlayerInfoData3 = {
	getModel = function ( f849_arg0 )
		return Engine.GetModel( DataSources.TopScorerMenuData.getModel( f849_arg0 ), "3" )
	end
}
DataSources.SocialTabs = ListHelper_SetupDataSource( "SocialTabs", function ( f850_arg0 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) ) == nil then
		local f850_local0 = "friends"
	end
	local f850_local1 = false
	local f850_local2 = {}
	table.insert( f850_local2, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	if Engine.IsInGame() == false then
		if CoD.isPC then
			local f850_local3 = table.insert
			local f850_local4 = f850_local2
			local f850_local5 = {
				models = {
					tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
					tabWidget = "CoD.Social_Party_PC"
				}
			}
			local f850_local6 = {
				tabId = "party",
				selectIndex = false
			}
			local f850_local7
			if Dvar.partyPrivacyEnabled:get() then
				f850_local7 = f850_local1
			else
				f850_local7 = true
			end
			f850_local6.disabled = f850_local7
			f850_local5.properties = f850_local6
			f850_local3( f850_local4, f850_local5 )
		else
			local f850_local3 = table.insert
			local f850_local4 = f850_local2
			local f850_local5 = {
				models = {
					tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
					tabWidget = "CoD.Social_Party"
				}
			}
			local f850_local6 = {
				tabId = "party",
				selectIndex = false
			}
			local f850_local7
			if Dvar.partyPrivacyEnabled:get() then
				f850_local7 = f850_local1
			else
				f850_local7 = true
			end
			f850_local6.disabled = f850_local7
			f850_local5.properties = f850_local6
			f850_local3( f850_local4, f850_local5 )
		end
	end
	table.insert( f850_local2, {
		models = {
			tabName = Engine.Localize( "MENU_FRIENDS_CAPS" ),
			tabWidget = "CoD.Social_Friends"
		},
		properties = {
			tabId = "friends",
			selectIndex = false
		}
	} )
	if IsGroupsEnabled() then
		local f850_local3 = false
		local f850_local4 = Engine.GetModel( Engine.GetModelForController( f850_arg0 ), "groups.highlightGroupsTabInSocial" )
		if f850_local4 and Engine.GetModelValue( f850_local4 ) then
			local f850_local0 = "groups"
		end
		table.insert( f850_local2, {
			models = {
				tabName = Engine.Localize( "GROUPS_CAPS" ),
				tabWidget = "CoD.Social_Groups"
			},
			properties = {
				tabId = "groups",
				selectIndex = false
			}
		} )
	end
	table.insert( f850_local2, {
		models = {
			tabName = Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ),
			tabWidget = "CoD.Social_RecentPlayers"
		},
		properties = {
			tabId = "recent",
			selectIndex = false
		}
	} )
	table.insert( f850_local2, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for f850_local3 = 1, #f850_local2, 1 do
		if f850_local2[f850_local3].properties ~= nil then
			if f850_local2[f850_local3].properties.tabId == f850_local0 then
				f850_local2[f850_local3].properties.selectIndex = true
			else
				f850_local2[f850_local3].properties.selectIndex = false
			end
		end
	end
	return f850_local2
end, true )
DataSources.SocialOnlinePlayersList = ListHelper_SetupDataSource( "SocialOnlinePlayersList", function ( f851_arg0 )
	local f851_local0 = {}
	local f851_local1 = Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE | Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
	local f851_local2 = {}
	local f851_local3 = false
	local f851_local4 = false
	local f851_local5 = Engine.GetModelValue( Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
	if f851_local5 == "friends" and CoD.perController[f851_arg0].isCombatRecordCompare then
		f851_local3 = false
		f851_local4 = false
		f851_local2 = Engine.GetFriends( f851_arg0 )
	elseif f851_local5 == "friends" then
		f851_local3 = false
		f851_local4 = false
		f851_local2 = Engine.GetOnlineFriendsList( f851_arg0, 0, 7, f851_local1 )
	elseif f851_local5 == "recent" then
		f851_local3 = true
		f851_local4 = true
		f851_local2 = Engine.GetRecentPlayersList( f851_arg0, 0, 7, f851_local1 )
	elseif f851_local5 == "party" then
		f851_local3 = false
		f851_local4 = false
		local f851_local6 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
		local f851_local7 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
		local f851_local8 = nil
		if f851_local7 and f851_local6.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
			f851_local8 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		else
			f851_local8 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		end
		local f851_local9 = Engine.GetTitleData( Engine.GetPrimaryController() )
		for f851_local13, f851_local14 in ipairs( f851_local8.sessionClients ) do
			f851_local2[f851_local13] = {}
			local f851_local15 = f851_local2[f851_local13]
			f851_local15.xuid = f851_local14.xuid
			f851_local15.gamertag = f851_local14.gamertag
			f851_local15.clantag = f851_local14.clantag
			f851_local15.isLocal = f851_local14.isLocal
			f851_local15.activity = f851_local9.activity
			f851_local15.context = f851_local9.context
			f851_local15.joinable = Enum.LobbyJoinable.LOBBY_JOINABLE_NO_NOT_IN_LOBBY
			f851_local15.gametype = f851_local9.gametype
			f851_local15.mapid = f851_local9.mapid
			f851_local15.friend = 1
			f851_local15.titlePresence = ""
			f851_local15.cpRank = f851_local14.cpRank
			f851_local15.cpRankIcon = f851_local14.cpRankIcon
			f851_local15.mpRank = f851_local14.mpRank
			f851_local15.mpRankIcon = f851_local14.mpRankIcon
			f851_local15.zmRank = f851_local14.zmRank
			f851_local15.zmRankIcon = f851_local14.zmRankIcon
		end
	else
		f851_local2 = Engine.GetOnlineFriendsList( f851_arg0, 0, 7, f851_local1 )
	end
	for f851_local16 = 1, #f851_local2, 1 do
		local f851_local9 = f851_local2[f851_local16]
		local f851_local10 = ""
		local f851_local11 = string.format( "%s %s", f851_local10, f851_local9.gamertag )
		local f851_local12 = ""
		if f851_local4 then
			f851_local12 = f851_local9.titlePresence
		end
		local f851_local13 = "0"
		if f851_local9.isLocal == 1 then
			f851_local13 = "1"
		end
		table.insert( f851_local0, {
			models = {
				["identityBadge.xuid"] = f851_local9.xuid,
				["identityBadge.gamertag"] = f851_local9.gamertag,
				["identityBadge.clantag"] = f851_local10,
				xuid = f851_local9.xuid,
				gamertag = f851_local9.gamertag,
				clantag = f851_local10,
				fullname = f851_local11,
				isLocal = f851_local13,
				activity = f851_local9.activity,
				context = f851_local9.context,
				difficulty = f851_local9.difficulty,
				playlist = f851_local9.playlist,
				joinable = f851_local9.joinable,
				gametype = f851_local9.gametype,
				mapid = f851_local9.mapid,
				friend = f851_local9.friend,
				titlePresence = f851_local12,
				cpRank = f851_local9.cpRank,
				cpRankIcon = f851_local9.cpRankIcon,
				mpRank = f851_local9.mpRank,
				mpRankIcon = GetRankIconLarge( f851_local9.mpRankIcon ),
				zmRank = f851_local9.zmRank,
				zmRankIcon = f851_local9.zmRankIcon
			},
			properties = {
				xuid = f851_local9.xuid,
				showyourfriend = f851_local3,
				showlastmet = f851_local4,
				gametype = f851_local9.gametype,
				mapid = f851_local9.mapid,
				difficulty = f851_local9.difficulty,
				playlist = f851_local9.playlist
			}
		} )
	end
	return f851_local0
end, nil, nil, function ( f852_arg0, f852_arg1, f852_arg2 )
	local f852_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	local f852_local1 = Engine.GetModelValue( Engine.GetModel( f852_local0, "tab" ) )
	local f852_local2 = Engine.GetModel( f852_local0, "friends" )
	if f852_local1 == "friends" then
		f852_local2 = Engine.GetModel( f852_local0, "friends" )
	elseif f852_local1 == "recent" then
		f852_local2 = Engine.GetModel( f852_local0, "recentPlayers" )
	elseif f852_local1 == "party" then
		f852_local2 = Engine.GetModel( f852_local0, "party" )
	end
	local f852_local3 = Engine.GetModel( f852_local2, "update" )
	if f852_arg1.socialUpdateSubscription then
		f852_arg1:removeSubscription( f852_arg1.socialUpdateSubscription )
	end
	f852_arg1.socialUpdateSubscription = f852_arg1:subscribeToModel( f852_local3, function ()
		RefreshListFindSelectedXuid( f852_arg0, f852_arg1 )
	end, false )
	if f852_arg1.socialPartyUpdateSubscription then
		f852_arg1:removeSubscription( f852_arg1.socialPartyUpdateSubscription )
	end
	f852_arg1.socialPartyUpdateSubscription = f852_arg1:subscribeToModel( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "privateClient" ), "update" ), function ()
		RefreshListFindSelectedXuid( f852_arg0, f852_arg1 )
	end, false )
end )
DataSources.SocialMainMenu = {
	getModel = function ( f855_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu" )
	end
}
DataSources.SocialPlayersList = {
	prepare = function ( f856_arg0, f856_arg1, f856_arg2 )
		f856_arg1.numElementsInList = f856_arg1.vCount
		f856_arg1.controller = f856_arg0
		f856_arg1.filter = Enum.PresenceFilter.PRESENCE_FILTER_ALL
		local f856_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local f856_local1 = Engine.GetModelValue( Engine.GetModel( f856_local0, "tab" ) )
		if f856_local1 == "friends" then
			f856_arg1.showyourfriend = false
			f856_arg1.showlastmet = false
			f856_arg1.GetList = Engine.GetFriends
			f856_arg1.GetParty = Engine.GetFriendPartry
			f856_arg1.playerCount = Engine.GetFriendsCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "friends" )
		elseif f856_local1 == "recent" then
			f856_arg1.showyourfriend = true
			f856_arg1.showlastmet = true
			f856_arg1.GetList = Engine.GetRecentPlayersList
			f856_arg1.GetParty = Engine.GetGetRecentPlayerParty
			f856_arg1.playerCount = Engine.GetRecentPlayersCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "recentPlayers" )
		elseif f856_local1 == "groupMembers" then
			f856_arg1.showyourfriend = true
			f856_arg1.showlastmet = false
			f856_arg1.showGroupMemberStatus = true
			f856_arg1.GetList = Engine.GetSelectedGroupMembersList
			f856_arg1.GetParty = Engine.GetSelectedGroupMembersParty
			f856_arg1.playerCount = Engine.GetSelectedGroupMembersCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "groupMembers" )
			f856_arg1.updateOnlyLayoutOnRefresh = true
		elseif f856_local1 == "groupApplications" then
			f856_arg1.showyourfriend = true
			f856_arg1.showlastmet = false
			f856_arg1.GetList = Engine.GetSelectedGroupApplicationsList
			f856_arg1.playerCount = Engine.GetSelectedGroupApplicationsCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "groupApplications" )
			f856_arg1.updateOnlyLayoutOnRefresh = true
		elseif f856_local1 == "groupBannedMembers" then
			f856_arg1.showyourfriend = true
			f856_arg1.showlastmet = false
			f856_arg1.GetList = Engine.GetSelectedGroupBannedMembersList
			f856_arg1.playerCount = Engine.GetSelectedGroupBannedMembersCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "groupBannedMembers" )
			f856_arg1.updateOnlyLayoutOnRefresh = true
		elseif f856_local1 == "groupAdmins" then
			f856_arg1.showyourfriend = true
			f856_arg1.showlastmet = false
			f856_arg1.GetList = Engine.GetSelectedGroupAdminsList
			f856_arg1.playerCount = Engine.GetSelectedGroupAdminsCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "groupAdmins" )
		elseif f856_local1 == "groupPlayerSearch" then
			f856_arg1.showyourfriend = true
			f856_arg1.showlastmet = false
			f856_arg1.GetList = Engine.GetGroupPlayerSearchList
			f856_arg1.playerCount = Engine.GetGroupPlayerSearchCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "groupPlayerSearch" )
		elseif f856_local1 == "groupFriendsFiltered" then
			f856_arg1.showyourfriend = true
			f856_arg1.showlastmet = false
			f856_arg1.GetList = Engine.GetSelectedGroupFriendsFilteredList
			f856_arg1.playerCount = Engine.GetSelectedGroupFriendsFilteredCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "groupFriendsFiltered" )
		else
			f856_arg1.showyourfriend = false
			f856_arg1.showlastmet = false
			f856_arg1.GetList = Engine.GetFriends
			f856_arg1.GetParty = Engine.GetFriendPartry
			f856_arg1.playerCount = Engine.GetFriendsCount( f856_arg0, f856_arg1.filter )
			f856_arg1.socialSubModel = Engine.GetModel( f856_local0, "friends" )
		end
		f856_arg1.players = {}
		local f856_local2 = {
			["identityBadge.xuid"] = 0,
			["identityBadge.gamertag"] = "",
			["identityBadge.clantag"] = "",
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
			mpParagonRank = 0,
			mpParagonIconId = 0,
			zmParagonRank = 0,
			zmParagonIconId = 0,
			partySize = 1,
			partyMax = 9,
			selected = false,
			playerCount = 0,
			groupMemberStatus = 0,
			primaryGroup = ""
		}
		local f856_local3 = {
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
		for f856_local4 = 1, f856_arg1.numElementsInList, 1 do
			f856_arg1.players[f856_local4] = {}
			f856_arg1.players[f856_local4].root = Engine.CreateModel( f856_arg1.socialSubModel, "player_" .. f856_local4 )
			f856_arg1.players[f856_local4].model = Engine.CreateModel( f856_arg1.players[f856_local4].root, "model" )
			f856_arg1.players[f856_local4].properties = {
				xuid = 0,
				showyourfriend = 0,
				showlastmet = 0,
				gametype = 0,
				mapid = 0,
				difficulty = 0,
				playlist = 1
			}
			for f856_local10, f856_local11 in pairs( f856_local2 ) do
				local f856_local12 = Engine.CreateModel( f856_arg1.players[f856_local4].model, f856_local10 )
			end
		end
		f856_arg1.updateModels = function ( f857_arg0, f857_arg1, f857_arg2, f857_arg3 )
			if not f857_arg1.GetList then
				return 
			end
			local f857_local0 = {}
			f857_local0 = f857_arg1.GetList( f857_arg0, f857_arg2, f857_arg3, f857_arg1.filter )
			for f857_local1 = 1, #f857_local0, 1 do
				local f857_local4 = f857_local0[f857_local1]
				local f857_local5 = (f857_arg2 + f857_local1 - 1) % f857_arg1.numElementsInList + 1
				f857_local4.clantag = ""
				f857_local4.fullname = string.format( "%s%s", f857_local4.clantag, f857_local4.gamertag )
				f857_local4["identityBadge.xuid"] = f857_local4.xuid
				f857_local4["identityBadge.gamertag"] = f857_local4.gamertag
				f857_local4["identityBadge.clantag"] = f857_local4.clantag
				if f857_arg1.showlastmet == 0 then
					f857_local4.titlePresence = ""
				end
				if f857_arg1.showGroupMemberStatus then
					f857_local4.groupMemberStatus = Engine.GetSelectedGroupMemberStatus( f857_arg0, f857_local4.xuid )
				end
				f857_local4.cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", f857_local4.cpPlayed, f857_local4.cpRank, f857_local4.cpPrestige )
				f857_local4.mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", f857_local4.mpPlayed, f857_local4.mpRank, f857_local4.mpPrestige )
				f857_local4.zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", f857_local4.zmPlayed, f857_local4.zmRank, f857_local4.zmPrestige )
				if f857_local4.mpPrestige == Engine.GetPrestigeCap( Enum.eModes.MODE_MULTIPLAYER ) then
					f857_local4.mpRank = Engine.GetParagonRankDisplayLevel( f857_local4.mpParagonRank, Enum.eModes.MODE_MULTIPLAYER )
					if f857_local4.mpParagonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
						f857_local4.mpRankIcon = Engine.GetParagonIconById( f857_local4.mpParagonIconId, Enum.eModes.MODE_MULTIPLAYER )
					end
				else
					f857_local4.mpRank = Engine.GetRankDisplayLevel( f857_local4.mpRank, Enum.eModes.MODE_MULTIPLAYER )
				end
				if f857_local4.zmPrestige == Engine.GetPrestigeCap( Enum.eModes.MODE_ZOMBIES ) then
					f857_local4.zmRank = Engine.GetParagonRankDisplayLevel( f857_local4.zmParagonRank, Enum.eModes.MODE_ZOMBIES )
					if f857_local4.zmParagonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
						f857_local4.zmRankIcon = Engine.GetParagonIconById( f857_local4.zmParagonIconId, Enum.eModes.MODE_ZOMBIES )
					end
				else
					f857_local4.zmRank = Engine.GetRankDisplayLevel( f857_local4.zmRank, Enum.eModes.MODE_ZOMBIES )
				end
				f857_local4.selected = Engine.IsFriendInInitialGroupInvitesList( f857_local4.xuid )
				f857_local4.playerCount = f857_arg1.playerCount
				if f857_local4.mapid then
					local f857_local6 = CoD.GetMapIDFromMapUniqueID( f857_local4.mapid )
					if f857_local6 then
						local f857_local7 = Engine.GetDLCBitForMapName( f857_local6 )
						local f857_local8 = Engine.GetDLCBits()
						if IsDvarValueEqualTo( "ui_freeDLC1", "1" ) then
							f857_local8 = f857_local8 | Enum.ContentFlagBits.CONTENT_DLC1
						end
						local f857_local9
						if CoD.BitUtility.IsBitwiseAndNonZero( f857_local7, f857_local8 ) then
							f857_local9 = f857_local4.joinable
							if not f857_local9 then
							
							else
								f857_local4.joinable = f857_local9
							end
						end
						f857_local9 = 10
					end
				end
				for f857_local10, f857_local9 in pairs( f857_local4 ) do
					local f857_local11 = Engine.GetModel( f857_arg1.players[f857_local5].model, f857_local10 )
					if f857_local11 ~= nil then
						Engine.SetModelValue( f857_local11, f857_local9 )
					end
					if f857_arg1.players[f857_local5].properties[f857_local10] ~= nil then
						f857_arg1.players[f857_local5].properties[f857_local10] = f857_local9
					end
				end
				Engine.SetModelValue( Engine.CreateModel( f857_arg1.players[f857_local5].model, "activityString" ), GetPresenceActivityString( f857_local4 ) )
				Engine.SetModelValue( Engine.CreateModel( f857_arg1.players[f857_local5].model, "contextString" ), GetPresenceContextString( f857_local4 ) )
				Engine.SetModelValue( Engine.CreateModel( f857_arg1.players[f857_local5].model, "primaryGroupString" ), GetPresencePrimaryGroupString( f857_local4 ) )
				f857_arg1.players[f857_local5].properties.showlastmet = f857_arg1.showlastmet
				f857_arg1.players[f857_local5].properties.showyourfriend = f857_arg1.showyourfriend
				if f857_arg1.GetParty then
					f857_local6 = f857_arg1.GetParty( f857_arg0, f857_arg2 + f857_local1 - 1 )
					f857_local7 = f857_local4.partyMembers
					f857_arg1.players[f857_local5].properties.party = {}
					if f857_local6 then
						if f857_local6.total == nil then
							f857_local6.total = f857_local6.totalCount
							f857_local6.available = f857_local6.availableCount
						end
						f857_arg1.players[f857_local5].properties.party.total = f857_local6.total
						f857_arg1.players[f857_local5].properties.party.available = f857_local6.available
						f857_arg1.players[f857_local5].properties.party.leader = f857_local6.leader
						if #f857_local6.members then
							f857_arg1.players[f857_local5].properties.party.members = {}
							for f857_local8 = 1, #f857_local6.members, 1 do
								f857_arg1.players[f857_local5].properties.party.members[f857_local8] = {}
								f857_arg1.players[f857_local5].properties.party.members[f857_local8].gamertag = f857_local6.members[f857_local8].gamertag
								f857_arg1.players[f857_local5].properties.party.members[f857_local8].leader = f857_local6.members[f857_local8].leader
							end
						end
					end
				end
			end
			return f857_arg1.players[f857_arg2 % f857_arg1.numElementsInList + 1].model
		end
		
		if not f856_arg1.skipFirstTimeUpdateModels then
			f856_arg1.updateModels( f856_arg0, f856_arg1, 0, f856_arg1.numElementsInList )
		end
		local f856_local4 = Engine.GetModel( f856_arg1.socialSubModel, "update" )
		if f856_arg1.socialUpdateSubscription then
			f856_arg1:removeSubscription( f856_arg1.socialUpdateSubscription )
		end
		f856_arg1.socialUpdateSubscription = f856_arg1:subscribeToModel( f856_local4, function ()
			if f856_arg1.updateOnlyLayoutOnRefresh then
				f856_arg1.skipFirstTimeUpdateModels = true
				f856_arg1:updateDataSource( true, true )
				f856_arg1:updateLayout()
			else
				RefreshListFindSelectedXuid( f856_arg0, f856_arg1 )
			end
		end, false )
	end,
	getCount = function ( f859_arg0 )
		return f859_arg0.playerCount
	end,
	getItem = function ( f860_arg0, f860_arg1, f860_arg2 )
		local f860_local0 = f860_arg1.updateModels( f860_arg0, f860_arg1, f860_arg2 - 1, 1 )
		local f860_local1 = (f860_arg2 - 1)
		return f860_arg1.players[(f860_arg2 - 1) % f860_arg1.numElementsInList + 1].model
	end,
	getCustomPropertiesForItem = function ( f861_arg0, f861_arg1 )
		local f861_local0 = (f861_arg1 - 1)
		return f861_arg0.players[(f861_arg1 - 1) % f861_arg0.numElementsInList + 1].properties
	end
}
DataSources.SocialPlayerPartyList = {
	prepare = function ( f862_arg0, f862_arg1, f862_arg2 )
		f862_arg1.numElementsInList = f862_arg1.vCount
		f862_arg1.controller = f862_arg0
		local f862_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		f862_arg1.xuidModel = Engine.CreateModel( Engine.CreateModel( f862_local0, "cache" ), "xuid" )
		local f862_local1 = Engine.GetModel( f862_local0, "party" )
		f862_arg1.partyUpdate = Engine.CreateModel( f862_local1, "update" )
		local f862_local2 = Engine.CreateModel( f862_local1, "available" )
		local f862_local3 = Engine.CreateModel( f862_local1, "total" )
		local f862_local4 = Engine.CreateModel( f862_local1, "leader" )
		f862_arg1.xuid = Engine.GetModelValue( f862_arg1.xuidModel, "xuid" )
		f862_arg1.available = Engine.GetModelValue( f862_local2 )
		f862_arg1.total = Engine.GetModelValue( f862_local3 )
		f862_arg1.leader = Engine.GetModelValue( f862_local4 )
		f862_arg1.partyMembers = {}
		for f862_local5 = 1, 18, 1 do
			f862_arg1.partyMembers[f862_local5] = Engine.GetModel( f862_local1, "pm_" .. f862_local5 )
		end
		if f862_arg1.selectedPlayerSubscription then
			f862_arg1:removeSubscription( f862_arg1.selectedPlayerSubscription )
		end
		f862_arg1.selectedPlayerSubscription = f862_arg1:subscribeToModel( f862_arg1.partyUpdate, function ()
			f862_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f864_arg0 )
		return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "socialRoot.party.available" ) or 0
	end,
	getItem = function ( f865_arg0, f865_arg1, f865_arg2 )
		return f865_arg1.partyMembers[f865_arg2]
	end
}
DataSources.AARTabs = ListHelper_SetupDataSource( "AARTabs", function ( f866_arg0 )
	local f866_local0 = {}
	table.insert( f866_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	if Engine.IsMultiplayerGame() then
		local f866_local1 = Engine.GetModel( Engine.GetModelForController( f866_arg0 ), "aarType" )
		if f866_local1 and Engine.GetModelValue( f866_local1 ) == "public" then
			table.insert( f866_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
					tabWidget = "CoD.PerformanceTabWidget"
				},
				properties = {
					tabId = "performance"
				}
			} )
			if Dvar.show_contracts_button:get() then
				table.insert( f866_local0, {
					models = {
						tabName = Engine.Localize( "MENU_AAR_TAB_CONTRACTS_CAPS" ),
						tabWidget = "CoD.ContractsTabWidget"
					},
					properties = {
						tabId = "contracts"
					}
				} )
			end
		end
		if not IsLocal() then
			local f866_local2 = Engine.GetRecentMedals( f866_arg0, Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, Engine.GetCurrentGameType() .. " XP" ) )
			if f866_local2 and #f866_local2 > 0 then
				table.insert( f866_local0, {
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
		table.insert( f866_local0, {
			models = {
				tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
				tabWidget = "CoD.ScoreboardTabWidget"
			},
			properties = {
				tabId = "scoreboard"
			}
		} )
	elseif Engine.IsCampaignGame() then
		table.insert( f866_local0, {
			models = {
				tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
				tabWidget = "CoD.PerformanceTabWidgetCP"
			},
			properties = {
				tabId = "performance"
			}
		} )
		table.insert( f866_local0, {
			models = {
				tabName = Engine.Localize( "CPUI_ACCOLADES" ),
				tabWidget = "CoD.MissionRecordVault_Challenges"
			},
			properties = {
				tabId = "accolades"
			}
		} )
		if not WasCampaignSoloGame( f866_arg0 ) then
			table.insert( f866_local0, {
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
		table.insert( f866_local0, {
			models = {
				tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
				tabWidget = "CoD.PerformanceTabWidgetZM"
			},
			properties = {
				tabId = "performance"
			}
		} )
		table.insert( f866_local0, {
			models = {
				tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
				tabWidget = "CoD.ScoreboardTabWidgetZM"
			},
			properties = {
				tabId = "scoreboard"
			}
		} )
		if IsLive() then
			table.insert( f866_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_DAILY_CHALLENGE_CAPS" ),
					tabWidget = "CoD.DailyChallengeTabWidget"
				},
				properties = {
					tabId = "dailyChallenge"
				}
			} )
		end
	end
	table.insert( f866_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f866_local0
end, true )
DataSources.AARPerformanceTabStats = {
	getModel = function ( f867_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f867_arg0 ), "aarStats.performanceTabStats" )
	end
}
DataSources.AARSPMGraph = {
	getModel = function ( f868_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f868_arg0 ), "aarStats.performanceTabStats.spmGraph" )
	end
}
DataSources.AARKDRGraph = {
	getModel = function ( f869_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f869_arg0 ), "aarStats.performanceTabStats.kdrGraph" )
	end
}
DataSources.Scoreboard = {
	getModel = function ( f870_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f870_arg0 ), "scoreboardInfo" )
	end
}
DataSources.ScoreboardTeam1ListCP = ListHelper_SetupDataSource( "scoreboardTeam1ListCP", function ( f871_arg0 )
	return CoD.AARUtilityCP.GetScoreboardTeamTable( f871_arg0, 1 )
end )
DataSources.ScoreboardTeam1List = {
	prepare = function ( f872_arg0, f872_arg1, f872_arg2 )
		local f872_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f872_arg0 ), "CodCaster" ), "showCodCasterScoreboard" )
		if Engine.GetModelValue( f872_local0 ) == true then
			f872_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team3" )
		else
			f872_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
		end
		if f872_arg1.teamCountSubscription then
			f872_arg1:removeSubscription( f872_arg1.teamCountSubscription )
		end
		f872_arg1.teamCountSubscription = f872_arg1:subscribeToModel( Engine.GetModel( f872_arg1.scoreboardInfoModel, "count" ), function ()
			f872_arg1:updateDataSource( nil, true, true )
			Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f872_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) )
		end, false )
		if f872_arg1.showCasterScoreboardSubscription then
			f872_arg1:removeSubscription( f872_arg1.showCasterScoreboardSubscription )
		end
		f872_arg1.showCasterScoreboardSubscription = f872_arg1:subscribeToModel( f872_local0, function ()
			f872_arg1:updateDataSource( nil, true, false )
			Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f872_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) )
		end, false )
	end,
	getCount = function ( f875_arg0 )
		local f875_local0 = CoD.ScoreboardUtility.MinRowsToShowOnEachTeam
		if Engine.GetCurrentTeamCount() < 2 and not Engine.IsZombiesGame() and not Engine.IsCampaignGame() then
			f875_local0 = CoD.ScoreboardUtility.MinRowsToShowOnEachTeamForFFA
		end
		return math.max( Engine.GetModelValue( Engine.GetModel( f875_arg0.scoreboardInfoModel, "count" ) ), f875_local0 )
	end,
	getItem = function ( f876_arg0, f876_arg1, f876_arg2 )
		return Engine.GetModel( f876_arg1.scoreboardInfoModel, f876_arg2 - 1 )
	end
}
DataSources.ScoreboardTeam2List = {
	prepare = function ( f877_arg0, f877_arg1, f877_arg2 )
		f877_arg1.activeController = f877_arg0
		f877_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
		if f877_arg1.teamCountSubscription then
			f877_arg1:removeSubscription( f877_arg1.teamCountSubscription )
		end
		f877_arg1.teamCountSubscription = f877_arg1:subscribeToModel( Engine.GetModel( f877_arg1.scoreboardInfoModel, "count" ), function ()
			f877_arg1:updateDataSource( nil, true, true )
			Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f877_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) )
		end, false )
		if f877_arg1.showCasterScoreboardSubscription then
			f877_arg1:removeSubscription( f877_arg1.showCasterScoreboardSubscription )
		end
		f877_arg1.showCasterScoreboardSubscription = f877_arg1:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f877_arg0 ), "CodCaster" ), "showCodCasterScoreboard" ), function ()
			f877_arg1:updateDataSource( nil, true, true )
			Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f877_arg0 ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) )
		end, false )
	end,
	getCount = function ( f880_arg0 )
		local f880_local0 = false
		if Engine.IsInGame() then
			f880_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f880_arg0.activeController ), "CodCaster" ), "showCodCasterScoreboard" ) )
		end
		if IsGameTypeDOA() then
			return 0
		elseif f880_local0 == true then
			return 0
		else
			return math.max( Engine.GetModelValue( Engine.GetModel( f880_arg0.scoreboardInfoModel, "count" ) ), CoD.ScoreboardUtility.MinRowsToShowOnEachTeam )
		end
	end,
	getItem = function ( f881_arg0, f881_arg1, f881_arg2 )
		return Engine.GetModel( f881_arg1.scoreboardInfoModel, f881_arg2 - 1 )
	end
}
DataSources.CodCasterScoreboardTeam1List = {
	prepare = function ( f882_arg0, f882_arg1, f882_arg2 )
		f882_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
		if f882_arg1.teamCountSubscription then
			f882_arg1:removeSubscription( f882_arg1.teamCountSubscription )
		end
		f882_arg1.teamCountSubscription = f882_arg1:subscribeToModel( Engine.GetModel( f882_arg1.scoreboardInfoModel, "count" ), function ()
			f882_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f884_arg0 )
		return math.max( Engine.GetModelValue( Engine.GetModel( f884_arg0.scoreboardInfoModel, "count" ) ), 0 )
	end,
	getItem = function ( f885_arg0, f885_arg1, f885_arg2 )
		return Engine.GetModel( f885_arg1.scoreboardInfoModel, f885_arg2 - 1 )
	end
}
DataSources.CodCasterScoreboardTeam2List = {
	prepare = function ( f886_arg0, f886_arg1, f886_arg2 )
		f886_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
		if f886_arg1.teamCountSubscription then
			f886_arg1:removeSubscription( f886_arg1.teamCountSubscription )
		end
		f886_arg1.teamCountSubscription = f886_arg1:subscribeToModel( Engine.GetModel( f886_arg1.scoreboardInfoModel, "count" ), function ()
			f886_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f888_arg0 )
		return math.max( Engine.GetModelValue( Engine.GetModel( f888_arg0.scoreboardInfoModel, "count" ) ), 0 )
	end,
	getItem = function ( f889_arg0, f889_arg1, f889_arg2 )
		return Engine.GetModel( f889_arg1.scoreboardInfoModel, f889_arg2 - 1 )
	end
}
DataSources.FreeRun = {
	getModel = function ( f890_arg0 )
		local f890_local0 = Engine.CreateModel( Engine.GetModelForController( f890_arg0 ), "FreeRun" )
		Engine.SetModelValue( Engine.CreateModel( f890_local0, "runState" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local0, "startTime" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local0, "pausedTime" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local0, "deltaTime" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local0, "finishTime" ), 0 )
		local f890_local1 = Engine.CreateModel( f890_local0, "topScore" )
		Engine.SetModelValue( Engine.CreateModel( f890_local1, "topScore1" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local1, "topScore2" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local1, "topScore3" ), 0 )
		local f890_local2 = Engine.CreateModel( f890_local0, "distanceBar" )
		Engine.SetModelValue( Engine.CreateModel( f890_local2, "completion" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local2, "ghostCompletion" ), 0 )
		local f890_local3 = Engine.CreateModel( f890_local0, "freeRunInfo" )
		if Engine.GetModel( f890_local3, "bestTime" ) == nil then
			Engine.SetModelValue( Engine.CreateModel( f890_local3, "bestTime" ), 0 )
		end
		if Engine.GetModel( f890_local3, "faults" ) == nil then
			Engine.SetModelValue( Engine.CreateModel( f890_local3, "faults" ), 0 )
		end
		Engine.SetModelValue( Engine.CreateModel( f890_local3, "retries" ), 0 )
		local f890_local4 = Engine.CreateModel( f890_local0, "timer" )
		Engine.SetModelValue( Engine.CreateModel( f890_local4, "currentTime" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local4, "timeAdjustment" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local4, "timeAdjustmentNegative" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local3, "bulletPenalty" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f890_local3, "activeCheckpoint" ), 0 )
		return f890_local0
	end
}
DataSources.RewardsCarousel = {
	prepare = function ( f891_arg0, f891_arg1, f891_arg2 )
		if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
			CoD.AARUtility.CreateModelsForRewards( f891_arg0 )
		else
			CoD.AARUtilityCP.CreateModelsForRewards( f891_arg0 )
		end
	end,
	getCount = function ( f892_arg0 )
		if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
			return CoD.AARUtility.GetRewardItemCount( f892_arg0 )
		else
			return CoD.AARUtilityCP.GetRewardItemCount( f892_arg0 )
		end
	end,
	getItem = function ( f893_arg0, f893_arg1, f893_arg2 )
		if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
			return CoD.AARUtility.GetModelForRewardItemByIndex( f893_arg0, f893_arg2 )
		else
			return CoD.AARUtilityCP.GetModelForRewardItemByIndex( f893_arg0, f893_arg2 )
		end
	end,
	getWidgetTypeForItem = function ( f894_arg0, f894_arg1, f894_arg2, f894_arg3 )
		if CoD.isMultiplayer or CoD.isZombie then
			local f894_local0 = CoD.SafeGetModelValue( f894_arg1, "rewardCarouselWidgetType" )
			if f894_local0 and f894_local0 ~= "" then
				return LUI.getTableFromPath( f894_local0 )
			end
		end
		return nil
	end
}
DataSources.ZmPlayerStyles = {
	prepare = function ( f895_arg0, f895_arg1, f895_arg2 )
		
	end,
	getCount = function ( f896_arg0 )
		return 0
	end,
	getItem = function ( f897_arg0, f897_arg1, f897_arg2 )
		return nil
	end
}
DataSources.DropdownListTest = {
	prepare = function ( f898_arg0, f898_arg1, f898_arg2 )
		local f898_local0 = 25
		for f898_local1 = 1, f898_local0, 1 do
			Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f898_arg0 ), "DropdownTest.dropdownListTestModel" .. f898_local1 ), "itemName" ), "Random Value " .. f898_local1 )
		end
	end,
	getCount = function ( f899_arg0 )
		return 25
	end,
	getItem = function ( f900_arg0, f900_arg1, f900_arg2 )
		return Engine.CreateModel( Engine.GetModelForController( f900_arg0 ), "DropdownTest.dropdownListTestModel" .. f900_arg2 )
	end
}
DataSources.DeadSpectate = {
	getModel = function ( f901_arg0 )
		return Engine.GetModel( Engine.GetModelForController( f901_arg0 ), "deadSpectator" )
	end
}
DataSources.DebugSessionSearchQoSJoin = ListHelper_SetupDataSource( "DebugSessionSearchQoSJoin", function ( f902_arg0 )
	if not Dvar.ui_lobbyDebugSessionSQJ:exists() or Dvar.ui_lobbyDebugSessionSQJ:get() == false then
		return {}
	end
	local f902_local0 = function ( f903_arg0, f903_arg1 )
		return Engine.GetModelValue( Engine.GetModel( f903_arg0, f903_arg1 ) )
	end
	
	local f902_local1 = function ( f904_arg0 )
		local f904_local0 = math.mod( f904_arg0, 3 )
		local f904_local1 = ColorSet.SelectedGreen
		if f904_local0 == 0 then
			f904_local1 = ColorSet.CoreMartial
		elseif f904_local0 == 1 then
			f904_local1 = ColorSet.ResistanceHigh
		end
		return string.format( "%d %d %d", f904_local1.r * 255, f904_local1.g * 255, f904_local1.b * 255 )
	end
	
	local f902_local2 = {}
	Engine.LobbyVM_CallFunc( "SessionSQJRefreshInfo", {
		controller = f902_arg0
	} )
	local f902_local3 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "debug" ), "sessionSQJ" )
	local f902_local4 = f902_local0( f902_local3, "searchStage" )
	local f902_local5 = Engine.GetModel( f902_local3, "results" )
	for f902_local6 = 1, f902_local4, 1 do
		local f902_local9 = f902_local1( f902_local6 )
		local f902_local10 = Engine.GetModel( f902_local5, tostring( f902_local6 ) )
		local f902_local11 = f902_local0( f902_local10, "numResults" )
		if f902_local11 == 0 then
			table.insert( f902_local2, {
				models = {
					noResults = "NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS",
					xuid = "",
					gamertag = "",
					publicIPAddress = "",
					privateIPAddress = "",
					natType = "",
					qosPing = "",
					status = "",
					searchStageColor = f902_local9
				},
				properties = {
					disabled = false
				}
			} )
		end
		local f902_local12 = Engine.GetModel( f902_local10, "data" )
		for f902_local13 = 1, f902_local11, 1 do
			local f902_local16 = Engine.GetModel( f902_local12, tostring( f902_local13 ) )
			local f902_local17 = f902_local0( f902_local16, "xuidstr" ) or "0"
			local f902_local18 = f902_local0( f902_local16, "gamertag" ) or ""
			local f902_local19 = f902_local0( f902_local16, "publicIPAddress" )
			if f902_local19 == nil then
				f902_local19 = "0.0.0.0"
			end
			local f902_local20 = f902_local0( f902_local16, "privateIPAddress" )
			if f902_local20 == nil then
				f902_local20 = "0.0.0.0"
			end
			local f902_local21 = f902_local0( f902_local16, "natType" )
			if f902_local21 == nil then
				f902_local21 = "UNKNOWN"
			end
			local f902_local22 = f902_local0( f902_local16, "ping" )
			if not f902_local22 then
				f902_local22 = "??? ms"
			end
			local f902_local23 = f902_local0( f902_local16, "status" )
			if not f902_local23 then
				f902_local23 = " ------- "
			end
			table.insert( f902_local2, {
				models = {
					noResults = "",
					xuid = f902_local17,
					gamertag = f902_local18,
					publicIPAddress = f902_local19,
					privateIPAddress = f902_local20,
					natType = f902_local21,
					qosPing = f902_local22,
					status = f902_local23,
					searchStageColor = f902_local9
				},
				properties = {
					disabled = false
				}
			} )
		end
	end
	return f902_local2
end, nil, nil, function ( f905_arg0, f905_arg1, f905_arg2 )
	f905_arg1.updateModel = Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "debug" ), "sessionSQJ" ), "update" )
	Engine.SetModelValue( f905_arg1.updateModel, 0 )
	if f905_arg1.updateSubscription then
		f905_arg1:removeSubscription( f905_arg1.updateSubscription )
	end
	f905_arg1.updateSubscription = f905_arg1:subscribeToModel( f905_arg1.updateModel, function ()
		f905_arg1:updateDataSource()
	end, false )
end )
DataSources.LobbyProcessQueueInfo = ListHelper_SetupDataSource( "LobbyProcessQueueInfo", function ( f907_arg0 )
	local f907_local0 = {}
	local f907_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug" ), "processQueue" )
	local f907_local2 = Engine.CreateModel( f907_local1, "data" )
	local f907_local3 = Engine.GetModelValue( Engine.CreateModel( f907_local1, "count" ) )
	if f907_local3 then
		for f907_local4 = 1, f907_local3, 1 do
			local f907_local7 = Engine.GetModel( f907_local2, tostring( f907_local4 ) )
			if f907_local7 then
				table.insert( f907_local0, {
					models = {
						processName = Engine.GetModelValue( Engine.GetModel( f907_local7, "processName" ) ),
						processCancellable = Engine.GetModelValue( Engine.GetModel( f907_local7, "processCancellable" ) ),
						type = Engine.GetModelValue( Engine.GetModel( f907_local7, "type" ) )
					}
				} )
				local f907_local8 = Engine.GetModelValue( Engine.GetModel( f907_local7, "actionCount" ) )
				if f907_local8 > 0 then
					local f907_local9 = Engine.GetModel( f907_local7, "actions" )
					for f907_local10 = 1, f907_local8, 1 do
						local f907_local13 = Engine.GetModel( f907_local9, tostring( f907_local10 ) )
						table.insert( f907_local0, {
							models = {
								processName = Engine.GetModelValue( Engine.GetModel( f907_local13, "processName" ) ),
								processState = Engine.GetModelValue( Engine.GetModel( f907_local13, "processState" ) ),
								type = Engine.GetModelValue( Engine.GetModel( f907_local13, "type" ) )
							}
						} )
					end
				end
			end
		end
	end
	return f907_local0
end, nil, nil, function ( f908_arg0, f908_arg1, f908_arg2 )
	local f908_local0 = Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug" ), "processQueue" ), "update" )
	if f908_arg1.updateSubscription then
		f908_arg1:removeSubscription( f908_arg1.updateSubscription )
	end
	f908_arg1.updateSubscription = f908_arg1:subscribeToModel( f908_local0, function ()
		f908_arg1:updateDataSource()
	end, false )
end )
DataSources.LeaveLobbyPopup = {
	getModel = function ( f910_arg0 )
		local f910_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
		Engine.CreateModel( f910_local0, "popupType" )
		Engine.CreateModel( f910_local0, "title" )
		Engine.CreateModel( f910_local0, "hint" )
		return f910_local0
	end
}
DataSources.Blackhat = {
	getModel = function ( f911_arg0 )
		return Engine.GetModel( Engine.GetModelForController( f911_arg0 ), "hudItems.blackhat" )
	end
}
DataSources.BrightnessSelector = ListHelper_SetupDataSource( "BrightnessSelector", function ( f912_arg0 )
	local f912_local0 = {}
	local f912_local1 = 8
	local f912_local2 = 29
	local f912_local3 = Engine.ProfileFloat( f912_arg0, "r_sceneBrightness" )
	local f912_local4 = 1 / f912_local1 * 2
	for f912_local5 = 1, 2 * f912_local1 + 1, 1 do
		local f912_local8 = math.min( 1, math.max( -1, (f912_local5 - f912_local1 + 1) / f912_local1 ) )
		local f912_local9 = 2 * (f912_local5 - f912_local1 + 1) + f912_local2
		local f912_local10 = f912_local9 .. " " .. f912_local9 .. " " .. f912_local9
		local f912_local11 = table.insert
		local f912_local12 = f912_local0
		local f912_local13 = {
			models = {
				value = f912_local8,
				color = f912_local10
			}
		}
		local f912_local14 = {}
		local f912_local15
		if f912_local8 - f912_local4 > f912_local3 or f912_local3 > f912_local8 + f912_local4 then
			f912_local15 = false
		else
			f912_local15 = true
		end
		f912_local14.selectIndex = f912_local15
		f912_local13.properties = f912_local14
		f912_local11( f912_local12, f912_local13 )
	end
	return f912_local0
end, true )
DataSources.ChatClientGlobal = {
	getModel = function ( f913_arg0 )
		local f913_local0 = CoD.ChatClientUtility.GetChatClientGlobalModel()
		CoD.ChatClientUtility.ResetAllModels( f913_arg0 )
		return f913_local0
	end
}
DataSources.ChatClientEntriesList = {
	prepare = function ( f914_arg0, f914_arg1, f914_arg2 )
		f914_arg1.numElementsInList = f914_arg1.vCount
		f914_arg1.controller = f914_arg0
		f914_arg1.chatClientEntriesModel = CoD.ChatClientUtility.GetChatEntriesListModel()
		f914_arg1.filter = Engine.ChatClient_FilterChannelGet( f914_arg0, Enum.chatChannel_e.CHAT_CHANNEL_COUNT )
		f914_arg1.GetList = Engine.ChatClient_GetEntries
		f914_arg1.CountEntries = Engine.ChatClient_EntriesCount( f914_arg0, f914_arg1.filter )
		local f914_local0 = {
			xuid = 0,
			fullname = "",
			text = "",
			timestamp = "",
			timeMs = 0,
			chText = "",
			chColor = ""
		}
		f914_arg1.chatEntries = {}
		for f914_local1 = 1, f914_arg1.numElementsInList, 1 do
			f914_arg1.chatEntries[f914_local1] = {}
			f914_arg1.chatEntries[f914_local1].root = Engine.CreateModel( f914_arg1.chatClientEntriesModel, "entry_" .. f914_local1 )
			f914_arg1.chatEntries[f914_local1].model = Engine.CreateModel( f914_arg1.chatEntries[f914_local1].root, "model" )
			f914_arg1.chatEntries[f914_local1].properties = {}
			for f914_local7, f914_local8 in pairs( f914_local0 ) do
				local f914_local9 = Engine.CreateModel( f914_arg1.chatEntries[f914_local1].model, f914_local7 )
			end
		end
		f914_arg1.updateModels = function ( f915_arg0, f915_arg1, f915_arg2, f915_arg3 )
			if not f915_arg1.GetList then
				return 
			end
			local f915_local0 = {}
			f915_local0 = f915_arg1.GetList( f915_arg0, f915_arg2, f915_arg3, f915_arg1.filter )
			if f915_local0 then
				for f915_local1 = 1, #f915_local0, 1 do
					local f915_local4 = f915_local0[f915_local1]
					local f915_local5 = #f915_local0 + 1 - f915_local1
					for f915_local9, f915_local10 in pairs( f915_local4 ) do
						local f915_local11 = Engine.GetModel( f915_arg1.chatEntries[f915_local5].model, f915_local9 )
						if f915_local11 ~= nil then
							Engine.SetModelValue( f915_local11, f915_local10 )
						end
						f915_arg1.chatEntries[f915_local5].properties[f915_local9] = f915_local10
					end
				end
			end
			return f915_arg1.chatEntries[f915_arg2 % f915_arg1.numElementsInList + 1].model
		end
		
		f914_arg1.updateModels( f914_arg0, f914_arg1, 0, f914_arg1.numElementsInList )
		if f914_arg1.updateSubscription then
			f914_arg1:removeSubscription( f914_arg1.updateSubscription )
		end
		f914_arg1.updateSubscription = f914_arg1:subscribeToModel( CoD.ChatClientUtility.GetUpdateModel(), function ()
			f914_arg1:updateDataSource()
		end, false )
	end,
	getCount = function ( f917_arg0 )
		return f917_arg0.CountEntries
	end,
	getItem = function ( f918_arg0, f918_arg1, f918_arg2 )
		return f918_arg1.chatEntries[f918_arg2].model
	end
}
DataSources.ModsGlobal = {
	getModel = function ( f919_arg0 )
		return Engine.GetModel( Engine.GetGlobalModel(), "ModsGlobal" )
	end
}
DataSources.ModsLoadEntry = ListHelper_SetupDataSource( "ModsLoadEntry", function ( f920_arg0 )
	local f920_local0 = {}
	local f920_local1 = Engine.Mods_Lists_GetInfoEntries( LuaEnums.MODS_BASE_PATH, 0, Engine.Mods_Lists_GetInfoEntriesCount( LuaEnums.MODS_BASE_PATH ) )
	if f920_local1 then
		for f920_local2 = 0, #f920_local1, 1 do
			local f920_local5 = f920_local1[f920_local2]
			local f920_local6 = {}
			for f920_local10, f920_local11 in pairs( f920_local5 ) do
				f920_local6[f920_local10] = f920_local11
			end
			table.insert( f920_local0, {
				models = f920_local6
			} )
		end
	end
	return f920_local0
end, true )
DataSources.FirstTimeLanguageSelection = ListHelper_SetupDataSource( "FirstTimeLanguageSelection", function ( f921_arg0 )
	local f921_local0 = {}
	if IsArabicSku() then
		table.insert( f921_local0, {
			models = {
				image = "uie_language_english",
				action = ChangeLanguage,
				param = "englisharabic"
			}
		} )
		table.insert( f921_local0, {
			models = {
				image = "uie_language_arabic",
				action = ChangeLanguage,
				param = "arabic"
			}
		} )
	elseif IsJapaneseSku() then
		table.insert( f921_local0, {
			models = {
				image = "uie_language_japanese",
				action = ChangeLanguage,
				param = "fulljapanese"
			}
		} )
		table.insert( f921_local0, {
			models = {
				image = "uie_language_english_with_japanese_subtitles",
				action = ChangeLanguage,
				param = "japanese"
			}
		} )
	elseif IsChineseSku() then
		table.insert( f921_local0, {
			models = {
				image = "uie_language_english",
				action = ChangeLanguage,
				param = "english"
			}
		} )
		table.insert( f921_local0, {
			models = {
				image = "uie_language_simplified_chinese",
				action = ChangeLanguage,
				param = "simplifiedchinese"
			}
		} )
		table.insert( f921_local0, {
			models = {
				image = "uie_language_traditional_chinese",
				action = ChangeLanguage,
				param = "traditionalchinese"
			}
		} )
	end
	return f921_local0
end )
DataSources.ZMQuestItemHolders = {
	getModel = function ( f922_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f922_arg0 ), "zmInventory" )
	end
}
DataSources.GameTimeWidgetList = DataSourceHelpers.ListSetup( "GameTimeWidgetList", function ( f923_arg0, f923_arg1 )
	if not CoD.Zombie.Timers then
		return {}
	end
	local f923_local0 = {}
	local f923_local1 = Engine.GetModelForController( f923_arg0 )
	for f923_local8, f923_local9 in ipairs( CoD.Zombie.Timers ) do
		local f923_local10 = f923_local9.modelName
		local f923_local11 = Engine.CreateModel( f923_local1, "hudItems.time." .. f923_local10 )
		if not f923_arg1["timerSubscription_" .. f923_local10] then
			f923_arg1["timerSubscription_" .. f923_local10] = f923_arg1:subscribeToModel( f923_local11, function ( model )
				f923_arg1:updateDataSource()
			end, false )
		end
		local f923_local5 = f923_local9.header
		if f923_local9.headerModelName then
			local f923_local6 = Engine.GetModelValue( Engine.CreateModel( f923_local1, "hudItems.time." .. f923_local9.headerModelName ) )
			if f923_local6 then
				f923_local5 = Engine.Localize( f923_local9.header, f923_local6 )
			end
		end
		local f923_local7 = Engine.GetModelValue( f923_local11 )
		if f923_local7 and f923_local7 ~= 0 then
			table.insert( f923_local0, {
				models = {
					header = f923_local5,
					time = f923_local7
				}
			} )
		end
	end
	return f923_local0
end, true )
DataSources.ReticleBindings = {
	getModel = function ( f925_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f925_arg0 ), "reticleBindings" )
	end,
	createModelsForActions = function ( f926_arg0, f926_arg1 )
		Engine.UnsubscribeAndFreeModel( DataSources.ReticleBindings.getModel( f926_arg0 ) )
		local f926_local0 = DataSources.ReticleBindings.getModel( f926_arg0 )
		for f926_local6, f926_local7 in ipairs( f926_arg1 ) do
			local f926_local8 = Engine.CreateModel( f926_local0, f926_local7 )
			local f926_local9, f926_local10 = Engine.GetBindingButtonString( f926_arg0, "+" .. f926_local7, true )
			if f926_local9 then
				local f926_local4 = CoD.ButtonMappings[f926_local9]
				if f926_local4 then
					local f926_local5 = Engine.GetModel( DataSources.Controller.Model, f926_local4 )
					if f926_local5 then
						Engine.SetModelValue( f926_local8, Engine.GetModelValue( f926_local5 ) )
					end
				end
			end
		end
	end
}
DataSources.LiveEventViewer = {
	getModel = function ()
		return Engine.GetModel( Engine.GetGlobalModel(), "liveEventViewer" )
	end
}
DataSources.LiveEventViewerQualities = ListHelper_SetupDataSource( "LiveEventViewerQualities", function ( f928_arg0 )
	local f928_local0 = {}
	local f928_local1 = Dvar.hls_quality:get()
	for f928_local5, f928_local6 in ipairs( CoD.LiveEventQualities ) do
		table.insert( f928_local0, {
			models = {
				displayText = f928_local6.display
			},
			properties = {
				qualityId = f928_local6.qualityId,
				selectIndex = f928_local6.qualityId == f928_local1
			}
		} )
	end
	return f928_local0
end, true, nil, function ( f929_arg0, f929_arg1, f929_arg2 )
	DataSources.LiveEventViewerQualities.Update = function ()
		f929_arg1:updateDataSource()
	end
	
	LUI.OverrideFunction_CallOriginalFirst( f929_arg1, "close", function ()
		DataSources.LiveEventViewerQualities.Update = nil
	end )
end )
DataSources.VoDViewer = {
	getModel = function ()
		local f932_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "vodViewer" )
		Engine.CreateModel( f932_local0, "stream" )
		return f932_local0
	end
}
DataSources.OtherPlayerStats = {
	getModel = function ( f933_arg0 )
		return Engine.CreateModel( Engine.GetGlobalModel(), "OtherPlayerStats" )
	end
}
DataSources.GlobalSources.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.GlobalSources" )
DataSources.Controller.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.Controller" )
DataSources.VehicleController.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.VehicleController" )
function createControllerBindings( f934_arg0, f934_arg1, f934_arg2, f934_arg3, f934_arg4 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, f934_arg2 ), f934_arg3 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.VehicleController.Model, f934_arg2 ), f934_arg4 or f934_arg3 )
	if f934_arg1 then
		CoD.ButtonMappings[f934_arg1] = f934_arg2
	end
end

function UpdateControllerBindings( f935_arg0, f935_arg1 )
	if f935_arg0 ~= 0 then
		return 
	elseif f935_arg1 == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO then
		createControllerBindings( f935_arg0, "BUTTON_A", "primary_button_image", "xenonbutton_a" )
		createControllerBindings( f935_arg0, "BUTTON_B", "secondary_button_image", "xenonbutton_b" )
		createControllerBindings( f935_arg0, "BUTTON_X", "alt1_button_image", "xenonbutton_x" )
		createControllerBindings( f935_arg0, "BUTTON_Y", "alt2_button_image", "xenonbutton_y" )
		createControllerBindings( f935_arg0, "BUTTON_BACK", "back_button_image", "xenonbutton_back" )
		createControllerBindings( f935_arg0, "BUTTON_START", "start_button_image", "xenonbutton_start" )
		createControllerBindings( f935_arg0, "BUTTON_LSHLDR", "left_shoulder_button_image", "xenonbutton_lb", "t7_icons_controller_lbwhite" )
		createControllerBindings( f935_arg0, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_durango_lb_glow" )
		createControllerBindings( f935_arg0, "BUTTON_RSHLDR", "right_shoulder_button_image", "xenonbutton_rb", "t7_icons_controller_rbwhite" )
		createControllerBindings( f935_arg0, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_durango_rb_glow" )
		createControllerBindings( f935_arg0, "BUTTON_LSTICK", "left_stick_button_image", "ui_button_xenon_stick_ani_32_Ldown" )
		createControllerBindings( f935_arg0, "BUTTON_RSTICK", "right_stick_button_image", "ui_button_xenon_stick_ani_32_Rdown" )
		createControllerBindings( f935_arg0, nil, "move_left_stick_button_image", "t7_icons_controller_ls" )
		createControllerBindings( f935_arg0, nil, "move_right_stick_button_image", "t7_icons_controller_rs" )
		createControllerBindings( f935_arg0, "BUTTON_LTRIG", "left_trigger_button_image", "xenonbutton_lt", "t7_icons_controller_ltwhite" )
		createControllerBindings( f935_arg0, "BUTTON_RTRIG", "right_trigger_button_image", "xenonbutton_rt", "t7_icons_controller_rtwhite" )
		createControllerBindings( f935_arg0, nil, "dpad_all_button_image", "xenonbutton_dpad_all" )
		createControllerBindings( f935_arg0, nil, "dpad_lr_button_image", "xenonbutton_dpad_rl" )
		createControllerBindings( f935_arg0, nil, "dpad_ud_button_image", "xenonbutton_dpad_ud" )
		createControllerBindings( f935_arg0, "DPAD_UP", "dpad_up_button_image", "xenonbutton_dpad_up" )
		createControllerBindings( f935_arg0, "DPAD_DOWN", "dpad_down_button_image", "xenonbutton_dpad_down" )
		createControllerBindings( f935_arg0, "DPAD_LEFT", "dpad_left_button_image", "xenonbutton_dpad_left" )
		createControllerBindings( f935_arg0, "DPAD_RIGHT", "dpad_right_button_image", "xenonbutton_dpad_right" )
		createControllerBindings( f935_arg0, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		createControllerBindings( f935_arg0, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	elseif f935_arg1 == Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS then
		createControllerBindings( f935_arg0, "BUTTON_A", Engine.ShouldSwapCircleAndCross() and "secondary_button_image" or "primary_button_image", "ps3button_x", Engine.ShouldSwapCircleAndCross() and "ps3button_circle" or "ps3button_x" )
		createControllerBindings( f935_arg0, "BUTTON_B", Engine.ShouldSwapCircleAndCross() and "primary_button_image" or "secondary_button_image", "ps3button_circle", Engine.ShouldSwapCircleAndCross() and "ps3button_x" or "ps3button_circle" )
		createControllerBindings( f935_arg0, "BUTTON_X", "alt1_button_image", "ps3button_square" )
		createControllerBindings( f935_arg0, "BUTTON_Y", "alt2_button_image", "ps3button_triangle" )
		createControllerBindings( f935_arg0, "BUTTON_BACK", "back_button_image", "ps3button_select" )
		createControllerBindings( f935_arg0, "BUTTON_START", "start_button_image", "ps3button_start" )
		createControllerBindings( f935_arg0, "BUTTON_LSHLDR", "left_shoulder_button_image", "ps3button_l1", CoD.isPC and "t7_icons_controller_l1white" or "t7_icons_controller_lbwhite" )
		createControllerBindings( f935_arg0, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
		createControllerBindings( f935_arg0, "BUTTON_RSHLDR", "right_shoulder_button_image", "ps3button_r1", CoD.isPC and "t7_icons_controller_r1white" or "t7_icons_controller_rbwhite" )
		createControllerBindings( f935_arg0, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
		createControllerBindings( f935_arg0, "BUTTON_LSTICK", "left_stick_button_image", "ps3button_l3" )
		createControllerBindings( f935_arg0, "BUTTON_RSTICK", "right_stick_button_image", "ps3button_r3" )
		createControllerBindings( f935_arg0, nil, "move_left_stick_button_image", "t7_icons_controller_ls" )
		createControllerBindings( f935_arg0, nil, "move_right_stick_button_image", "t7_icons_controller_rs" )
		createControllerBindings( f935_arg0, "BUTTON_LTRIG", "left_trigger_button_image", "ps3button_l2", CoD.isPC and "t7_icons_controller_l2white" or "t7_icons_controller_ltwhite" )
		createControllerBindings( f935_arg0, "BUTTON_RTRIG", "right_trigger_button_image", "ps3button_r2", CoD.isPC and "t7_icons_controller_r2white" or "t7_icons_controller_rtwhite" )
		createControllerBindings( f935_arg0, nil, "dpad_all_button_image", "ps3button_dpad_all" )
		createControllerBindings( f935_arg0, nil, "dpad_lr_button_image", "ps3button_dpad_rl" )
		createControllerBindings( f935_arg0, nil, "dpad_ud_button_image", "ps3button_dpad_ud" )
		createControllerBindings( f935_arg0, "DPAD_UP", "dpad_up_button_image", "ps3button_dpad_up" )
		createControllerBindings( f935_arg0, "DPAD_DOWN", "dpad_down_button_image", "ps3button_dpad_down" )
		createControllerBindings( f935_arg0, "DPAD_LEFT", "dpad_left_button_image", "ps3button_dpad_left" )
		createControllerBindings( f935_arg0, "DPAD_RIGHT", "dpad_right_button_image", "ps3button_dpad_right" )
		createControllerBindings( f935_arg0, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		createControllerBindings( f935_arg0, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	else
		createControllerBindings( f935_arg0, "BUTTON_A", "primary_button_image", "ps3button_x" )
		createControllerBindings( f935_arg0, "BUTTON_B", "secondary_button_image", "ps3button_circle" )
		createControllerBindings( f935_arg0, "BUTTON_X", "alt1_button_image", "ps3button_square" )
		createControllerBindings( f935_arg0, "BUTTON_Y", "alt2_button_image", "ps3button_triangle" )
		createControllerBindings( f935_arg0, "BUTTON_BACK", "back_button_image", "ps3button_select" )
		createControllerBindings( f935_arg0, "BUTTON_START", "start_button_image", "ps3button_start" )
		createControllerBindings( f935_arg0, "BUTTON_LSHLDR", "left_shoulder_button_image", "ps3button_l1", CoD.isPC and "t7_icons_controller_l1white" or "t7_icons_controller_lbwhite" )
		createControllerBindings( f935_arg0, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
		createControllerBindings( f935_arg0, "BUTTON_RSHLDR", "right_shoulder_button_image", "ps3button_r1", CoD.isPC and "t7_icons_controller_r1white" or "t7_icons_controller_rbwhite" )
		createControllerBindings( f935_arg0, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
		createControllerBindings( f935_arg0, "BUTTON_LSTICK", "left_stick_button_image", "ps3button_l3" )
		createControllerBindings( f935_arg0, "BUTTON_RSTICK", "right_stick_button_image", "ps3button_r3" )
		createControllerBindings( f935_arg0, nil, "move_left_stick_button_image", "ui_button_ps3_stick_ls_32" )
		createControllerBindings( f935_arg0, nil, "move_right_stick_button_image", "ui_button_ps3_stick_rs_32" )
		createControllerBindings( f935_arg0, "BUTTON_LTRIG", "left_trigger_button_image", "ps3button_l2", CoD.isPC and "t7_icons_controller_l2white" or "t7_icons_controller_ltwhite" )
		createControllerBindings( f935_arg0, "BUTTON_RTRIG", "right_trigger_button_image", "ps3button_r2", CoD.isPC and "t7_icons_controller_r2white" or "t7_icons_controller_rtwhite" )
		createControllerBindings( f935_arg0, nil, "dpad_all_button_image", "ps3button_dpad_all" )
		createControllerBindings( f935_arg0, nil, "dpad_lr_button_image", "ps3button_dpad_rl" )
		createControllerBindings( f935_arg0, nil, "dpad_ud_button_image", "ps3button_dpad_ud" )
		createControllerBindings( f935_arg0, "DPAD_UP", "dpad_up_button_image", "ps3button_dpad_up" )
		createControllerBindings( f935_arg0, "DPAD_DOWN", "dpad_down_button_image", "ps3button_dpad_down" )
		createControllerBindings( f935_arg0, "DPAD_LEFT", "dpad_left_button_image", "ps3button_dpad_left" )
		createControllerBindings( f935_arg0, "DPAD_RIGHT", "dpad_right_button_image", "ps3button_dpad_right" )
		createControllerBindings( f935_arg0, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		createControllerBindings( f935_arg0, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	end
	if CoD.isPC then
		createControllerBindings( f935_arg0, "KEY_MOUSE1", "mouse_left_button_image", "mousebuttonleft" )
		createControllerBindings( f935_arg0, "KEY_MOUSE2", "mouse_right_button_image", "mousebuttonright" )
		createControllerBindings( f935_arg0, "KEY_MOUSE3", "mouse_middle_button_image", "mousebuttonmiddle" )
		createControllerBindings( f935_arg0, "MWHEELUP", "mouse_wheelup_button_image", "mouseWheelUp" )
		createControllerBindings( f935_arg0, "MWHEELDOWN", "mouse_wheeldown_button_image", "mouseWheelDown" )
		createControllerBindings( f935_arg0, nil, "mouse_button_image", "mouse" )
	end
end

local f0_local0 = Engine.GetPrimaryController()
UpdateControllerBindings( f0_local0, Engine.GamepadType( f0_local0 ) )
for f0_local1 = 0, Engine.GetMaxControllerCount() - 1, 1 do
	local f0_local4 = f0_local1
	local f0_local5 = Engine.GetModelForController( f0_local4 )
	Engine.CreateModel( f0_local5, "hintText" )
	Engine.SetModelValue( Engine.CreateModel( f0_local5, "clanTag" ), "" )
	if CoD.isPC and CoD.useController then
		if DataSourceHelpers.ControllerTypeSubscription == nil then
			DataSourceHelpers.ControllerTypeSubscription = {}
		end
		if DataSourceHelpers.ControllerTypeSubscription[f0_local4] == nil then
			DataSourceHelpers.ControllerTypeSubscription[f0_local4] = LUI.UIElement.new()
		end
		DataSourceHelpers.ControllerTypeSubscription[f0_local4]:unsubscribeFromAllModels()
		DataSourceHelpers.ControllerTypeSubscription[f0_local4]:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f0_local4 ), "ControllerType" ), function ( model )
			local f936_local0 = f0_local0
			local f936_local1 = 1
			if Engine.GamepadsConnectedIsActive( f936_local1 ) and not IsGamepad( f0_local0 ) then
				f936_local0 = f936_local1
			end
			UpdateControllerBindings( f0_local0, Engine.GamepadType( f936_local0 ) )
		end, true )
	end
	Engine.CreateModel( f0_local5, "WorldSpaceIndicators" )
	local f0_local6 = Engine.CreateModel( f0_local5, "scriptNotify" )
	Engine.SetModelValue( Engine.CreateModel( f0_local6, "numArgs" ), 0 )
	Engine.SetModelValue( f0_local6, "" )
	Engine.CreateModel( f0_local5, "playerConnected" )
	Engine.CreateModel( f0_local5, "playerDisconnected" )
	local f0_local7 = Engine.CreateModel( f0_local5, "hudItems" )
	Engine.CreateModel( f0_local7, "stickyImage" )
	Engine.CreateModel( f0_local7, "shockImageBottom" )
	Engine.CreateModel( f0_local7, "shockImageRight" )
	Engine.CreateModel( f0_local7, "shockImageLeft" )
	Engine.CreateModel( f0_local7, "shockImageTop" )
	Engine.CreateModel( f0_local7, "showCursorHint" )
	Engine.CreateModel( f0_local7, "cursorHintImage" )
	Engine.CreateModel( f0_local7, "cursorHintText" )
	Engine.CreateModel( f0_local7, "cursorHintTextLine2" )
	Engine.CreateModel( f0_local7, "cursorHintIconRatio" )
	Engine.CreateModel( f0_local7, "cursorHintIconFlip" )
	Engine.CreateModel( f0_local7, "sixthsense" )
	Engine.CreateModel( f0_local7, "outOfBoundsEndTime" )
	Engine.CreateModel( f0_local7, "pulseNoAmmo" )
	Engine.CreateModel( f0_local7, "pulseNoLethal" )
	Engine.CreateModel( f0_local7, "pulseNoTactical" )
	Engine.CreateModel( f0_local7, "armorOverlay" )
	Engine.CreateModel( f0_local7, "armorPercent" )
	Engine.CreateModel( f0_local7, "health" )
	Engine.CreateModel( f0_local7, "regenDelayProgress" )
	Engine.CreateModel( f0_local7, "showDamageWidget" )
	Engine.CreateModel( f0_local7, "cybercomActiveType" )
	Engine.CreateModel( f0_local7, "cybercomRequestedType" )
	Engine.CreateModel( f0_local7, "playerSpawned" )
	Engine.CreateModel( f0_local7, "ammoPickedUp" )
	Engine.CreateModel( f0_local7, "tacticalModeActivated" )
	Engine.CreateModel( f0_local7, "enhancedVisionActivated" )
	Engine.CreateModel( f0_local7, "livesLeft" )
	local f0_local8 = Engine.CreateModel( f0_local7, "voipInfo" )
	for f0_local9 = 1, LuaEnums.MAX_CLIENTS, 1 do
		local f0_local12 = Engine.CreateModel( f0_local8, "voip" .. f0_local9 )
		Engine.SetModelValue( Engine.CreateModel( f0_local12, "status" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f0_local12, "name" ), "" )
	end
	local f0_local9 = Engine.CreateModel( f0_local5, "CTF" )
	Engine.CreateModel( f0_local9, "friendlyFlagCarrier" )
	Engine.CreateModel( f0_local9, "friendlyFlagAway" )
	Engine.CreateModel( f0_local9, "enemyFlagCarrier" )
	Engine.CreateModel( f0_local9, "enemyFlagAway" )
	if not CoD.isFrontend and not CoD.isCampaign and CoD.isZombie then
		Engine.CreateModel( f0_local5, "bgb_current" )
		Engine.CreateModel( f0_local5, "bgb_display" )
		Engine.CreateModel( f0_local5, "bgb_timer" )
		Engine.CreateModel( f0_local5, "bgb_activations_remaining" )
		Engine.CreateModel( f0_local5, "bgb_invalid_use" )
		Engine.CreateModel( f0_local5, "bgb_one_shot_use" )
	end
	local f0_local10 = 7
	local f0_local11 = Engine.CreateModel( f0_local7, "console" )
	Engine.SetModelValue( Engine.CreateModel( f0_local11, "currentIndex" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f0_local11, "numEntries" ), f0_local10 )
	for f0_local13 = 0, f0_local10 - 1, 1 do
		local f0_local15 = Engine.CreateModel( f0_local11, "line" .. f0_local13 )
		Engine.CreateModel( f0_local15, "text0" )
		Engine.CreateModel( f0_local15, "text0color" )
		Engine.CreateModel( f0_local15, "icon0" )
		Engine.CreateModel( f0_local15, "text1" )
		Engine.CreateModel( f0_local15, "text1color" )
		Engine.CreateModel( f0_local15, "icon1" )
		Engine.CreateModel( f0_local15, "iconWidth" )
	end
	f0_local11 = Engine.CreateModel( f0_local7, "centerConsole" )
	Engine.SetModelValue( Engine.CreateModel( f0_local11, "currentIndex" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f0_local11, "numEntries" ), f0_local10 )
	for f0_local13 = 0, f0_local10 - 1, 1 do
		local f0_local15 = Engine.CreateModel( f0_local11, "line" .. f0_local13 )
		Engine.CreateModel( f0_local15, "text0" )
		Engine.CreateModel( f0_local15, "text0color" )
		Engine.CreateModel( f0_local15, "icon0" )
		Engine.CreateModel( f0_local15, "text1" )
		Engine.CreateModel( f0_local15, "text1color" )
		Engine.CreateModel( f0_local15, "icon1" )
		Engine.CreateModel( f0_local15, "iconWidth" )
	end
	killcamWeaponModel = Engine.CreateModel( f0_local7, "killcamWeapon" )
	Engine.CreateModel( killcamWeaponModel, "weaponName" )
	Engine.SetModelValue( killcamWeaponModel, 0 )
	for f0_local13 = 0, 6, 1 do
		Engine.CreateModel( killcamWeaponModel, "attachment" .. f0_local13 )
	end
	Engine.CreateModel( killcamWeaponModel, "killfeedicon" )
	Engine.CreateModel( killcamWeaponModel, "flip" )
	Engine.CreateModel( Engine.CreateModel( f0_local5, "vehicle" ), "vehicleType" )
	DataSources.VehicleInfo.clearButtonModels( f0_local4 )
	local f0_local12 = Engine.CreateModel( f0_local5, "profile" )
	if f0_local12 then
		local f0_local14 = function ( f937_arg0 )
			local f937_local0 = Engine.CreateModel( f0_local12, f937_arg0 )
			if f937_local0 and Engine.IsProfileSignedIn( f0_local4 ) then
				Engine.SetModelValue( f937_local0, CoD.ExeProfileVarBool( f0_local4, f937_arg0 ) )
			end
		end
		
		f0_local14( "tacticalModeShowDamage" )
		f0_local14( "tacticalModeShowArchetype" )
		f0_local14( "tacticalModeShowDistance" )
		f0_local14( "tacticalModeShowStatus" )
		local f0_local16 = function ( f938_arg0 )
			local f938_local0 = Engine.CreateModel( f0_local12, f938_arg0 )
			if f938_local0 and Engine.IsProfileSignedIn( f0_local4 ) then
				local f938_local1 = 0
				local f938_local2 = Engine.GetPlayerCommonGamerProfile( f0_local4 )
				if f938_local2 ~= nil and f938_local2[f938_arg0] ~= nil then
					f938_local1 = f938_local2[f938_arg0]:get()
				end
				Engine.SetModelValue( f938_local0, f938_local1 )
			end
		end
		
		f0_local16( "colorblindMode" )
		f0_local16( "snd_frontendTracksState" )
	end
	f0_local14 = Engine.CreateModel( f0_local5, "CACMenu" )
	Engine.CreateModel( f0_local14, "numItemsToRemove" )
	Engine.CreateModel( f0_local14, "curWeaponVariantName" )
	Engine.CreateModel( f0_local14, "numWildcardItemsToRemove" )
	Engine.CreateModel( f0_local14, "currentHeroName" )
	Engine.CreateModel( f0_local14, "currentHeroImage" )
	Engine.CreateModel( f0_local14, "currentHeroLoadout" )
	Engine.CreateModel( f0_local5, "unlockTokensCount" )
	Engine.CreateModel( f0_local5, "permanentUnlockTokensCount" )
	local f0_local16 = Engine.CreateModel( f0_local5, "CryptoKeyProgress" )
	Engine.CreateModel( f0_local16, "keyCount" )
	Engine.CreateModel( f0_local16, "progress" )
	Engine.CreateModel( f0_local16, "codPoints" )
	Engine.SetModelValue( Engine.CreateModel( f0_local16, "animProgress" ), 0 )
	Engine.CreateModel( Engine.CreateModel( f0_local5, "factions" ), "isCoDCaster" )
end
DataSources.PartyPrivacy.getModel()
Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "ButtonStates.ReevaluateDisabledStates" ), false )
Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive", true ), false )
if not Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ) then
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), 0 )
end
Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" )
Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged", true )
Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" )
Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" )
Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapPreviousGametype", true )
Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteGameModeNext", true )
Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), false )
