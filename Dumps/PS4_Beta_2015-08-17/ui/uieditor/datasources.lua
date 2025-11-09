require( "ui.T6.CoDBase" )
require( "ui.uieditor.modifyFunctions" )

local f0_local0 = {}
DataSourceHelpers = f0_local0
f0_local0 = function ( baseModel, modelTable )
	for modelName, modelValue in pairs( modelTable ) do
		if type( modelValue ) == "table" then
			f0_local0( Engine.CreateModel( baseModel, modelName ), modelValue )
		else
			Engine.SetModelValue( Engine.CreateModel( baseModel, modelName ), modelValue )
		end
	end
end

local ListHelper_GetListHelperModel = function ( list, create )
	if create then
		return Engine.CreateModel( Engine.GetModelForController( list.dataSourceController ), list.customDataSourceHelper )
	else
		return Engine.GetModel( Engine.GetModelForController( list.dataSourceController ), list.customDataSourceHelper )
	end
end

local ListHelper_Prepare = function ( list, controller, listModelName, getInfoTableFn, filter, customSetupFn )
	list[listModelName] = {}
	list.customDataSourceHelper = listModelName
	list.dataSourceController = controller
	local listModel = ListHelper_GetListHelperModel( list, true )
	local infoTable = getInfoTableFn( controller, list )
	for index, tableItem in ipairs( infoTable ) do
		local indexModel = Engine.CreateModel( listModel, index )
		if tableItem.models then
			f0_local0( indexModel, tableItem.models )
		end
		if tableItem.properties and tableItem.properties.loopEdges then
			list.loopEdges = tableItem.properties.loopEdges
		end
		if not filter or filter( indexModel ) then
			table.insert( list[listModelName], {
				model = indexModel,
				properties = tableItem.properties
			} )
		end
	end
	if customSetupFn then
		customSetupFn( controller, list, listModel )
	end
end

local ListHelper_GetCount = function ( list )
	if list.customDataSourceHelper and list[list.customDataSourceHelper] then
		return #list[list.customDataSourceHelper]
	else
		return 0
	end
end

local ListHelper_GetItem = function ( controller, list, index )
	if list.customDataSourceHelper and list[list.customDataSourceHelper] then
		return list[list.customDataSourceHelper][index].model
	else
		return nil
	end
end

local ListHelper_GetCustomPropertiesForItem = function ( list, index )
	if list.customDataSourceHelper and list[list.customDataSourceHelper] then
		return list[list.customDataSourceHelper][index].properties
	else
		return nil
	end
end

local ListHelper_Cleanup = function ( list )
	local listModel = ListHelper_GetListHelperModel( list, false )
	if listModel then
		Engine.UnsubscribeAndFreeModel( listModel )
	end
end

local ListHelper_SetupDataSource = function ( listModelName, getInfoTableFn, freeOnClose, listFnTable, customSetupFn, getSpacerAfterRowFn )
	local dataSourceTable = {
		getCount = ListHelper_GetCount,
		getItem = ListHelper_GetItem,
		getCustomPropertiesForItem = ListHelper_GetCustomPropertiesForItem,
		getSpacerAfterRow = getSpacerAfterRowFn
	}
	if freeOnClose then
		dataSourceTable.cleanup = ListHelper_Cleanup
	end
	if listFnTable then
		for key, valueFn in pairs( listFnTable ) do
			dataSourceTable[key] = valueFn
		end
	end
	dataSourceTable.prepare = function ( controller, list, filter )
		ListHelper_Prepare( list, controller, listModelName, getInfoTableFn, filter, customSetupFn )
	end
	
	return dataSourceTable
end

DataSourceHelpers.ListSetup = ListHelper_SetupDataSource
local ListHelper_SetupDataSource_CustomPrepare = function ( listModelName, prepareFn, freeOnClose, listFnTable )
	local dataSourceTable = {
		getCount = ListHelper_GetCount,
		getItem = ListHelper_GetItem,
		getCustomPropertiesForItem = ListHelper_GetCustomPropertiesForItem
	}
	if freeOnClose then
		dataSourceTable.cleanup = ListHelper_Cleanup
	end
	if listFnTable then
		for key, valueFn in pairs( listFnTable ) do
			dataSourceTable[key] = valueFn
		end
	end
	dataSourceTable.prepare = function ( controller, list, filter )
		list[listModelName] = {}
		prepareFn( controller, Engine.CreateModel( Engine.GetModelForController( controller ), listModelName ), list[listModelName], filter )
	end
	
	return dataSourceTable
end

CoD.XPBar = {}
CoD.XPBar.RankIdCol = 0
CoD.XPBar.RankTableColMinXP = 2
CoD.XPBar.RankTableColMaxXP = 7
CoD.XPBar.RankDisplayLevelCol = 14
DataSourceHelpers.CustomListSetup = ListHelper_SetupDataSource_CustomPrepare
local RefreshListFindSelectedXuid = function ( controller, list )
	if list == nil then
		return 
	end
	local xuid = nil
	if list.activeWidget ~= nil then
		local xuidModel = list.activeWidget:getModel( controller, "xuid" )
		if xuidModel ~= nil then
			xuid = Engine.GetModelValue( xuidModel )
		end
	end
	list:updateDataSource( false, false )
	if xuid ~= nil and not list:findItem( {
		xuid = xuid
	}, nil, true ) then
		list:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

DataSources = {
	GlobalSources = {
		getModel = function ( controller )
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
		getModel = function ( controller )
			local perControllerModel = Engine.GetModelForController( controller )
			local xuid = Engine.CreateModel( perControllerModel, "xuid" )
			Engine.SetModelValue( xuid, Engine.GetXUID64( controller ) )
			local gamertagModel = Engine.CreateModel( perControllerModel, "gamertag" )
			Engine.SetModelValue( gamertagModel, Engine.GetSelfGamertag( controller ) )
			local clantagModel = Engine.CreateModel( perControllerModel, "clanTag" )
			Engine.SetModelValue( clantagModel, "" )
			Engine.CreateModel( perControllerModel, "forceUpdateVehicleBindings" )
			return perControllerModel
		end,
		setHintText = function ( controller, hintText )
			local hintTextModel = Engine.GetModel( Engine.GetModelForController( controller ), "hintText" )
			if not hintText then
				hintText = ""
			end
			if hintTextModel then
				Engine.SetModelValue( hintTextModel, hintText )
			end
		end,
		clearHintText = function ( controller, hintText )
			DataSources.PerController.setHintText( controller, "" )
		end,
		hasHintText = function ( controller )
			local hintTextModel = Engine.GetModel( Engine.GetModelForController( controller ), "hintText" )
			if hintTextModel and Engine.GetModelValue( hintTextModel ) ~= "" then
				return true
			else
				return false
			end
		end
	},
	WorldSpaceIndicators = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "WorldSpaceIndicators" )
		end
	},
	MessageDialog = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
			return model
		end
	},
	AccountLinkLogin = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
			Engine.SetModelValue( Engine.CreateModel( model, "email" ), Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
			Engine.SetModelValue( Engine.CreateModel( model, "password" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
			Engine.SetModelValue( Engine.CreateModel( model, "stars" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
			return model
		end
	},
	AccountLinkRegister = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
			Engine.CreateModel( model, "firstName" )
			Engine.CreateModel( model, "lastName" )
			Engine.CreateModel( model, "zipCode" )
			Engine.CreateModel( model, "region" )
			Engine.CreateModel( model, "username" )
			Engine.CreateModel( model, "email" )
			Engine.CreateModel( model, "password" )
			Engine.CreateModel( model, "stars" )
			Engine.CreateModel( model, "confirmPass" )
			Engine.CreateModel( model, "confirmStars" )
			Engine.CreateModel( model, "gender" )
			Engine.CreateModel( model, "month" )
			Engine.CreateModel( model, "monthIndex" )
			Engine.CreateModel( model, "day" )
			Engine.CreateModel( model, "year" )
			return model
		end
	},
	TermsOfService = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetModelForController( controller ), "TermsOfService" )
			local message = Engine.GetTermsOfService( controller )
			Engine.SetModelValue( Engine.CreateModel( model, "message" ), message )
			return model
		end
	},
	Gender = {
		prepare = function ( controller, list, filter )
			local genderModel = Engine.CreateModel( Engine.GetGlobalModel(), "GenderModel" )
			local maleModel = Engine.CreateModel( genderModel, "Male" )
			Engine.SetModelValue( Engine.CreateModel( maleModel, "gender" ), Engine.Localize( "EM_MALE" ) )
			local femaleModel = Engine.CreateModel( genderModel, "Female" )
			Engine.SetModelValue( Engine.CreateModel( femaleModel, "gender" ), Engine.Localize( "EM_FEMALE" ) )
			list.genders = {
				maleModel,
				femaleModel
			}
		end,
		getCount = function ( list )
			return #list.genders
		end,
		getItem = function ( controller, list, index )
			return list.genders[index]
		end
	},
	Month = {
		prepare = function ( controller, list, filter )
			local monthModel = Engine.CreateModel( Engine.GetGlobalModel(), "monthModel" )
			local jan = Engine.CreateModel( monthModel, "january" )
			Engine.SetModelValue( Engine.CreateModel( jan, "month" ), Engine.Localize( "MENU_MONTHS_JAN" ) )
			Engine.SetModelValue( Engine.CreateModel( jan, "monthIndex" ), 1 )
			local feb = Engine.CreateModel( monthModel, "february" )
			Engine.SetModelValue( Engine.CreateModel( feb, "month" ), Engine.Localize( "MENU_MONTHS_FEB" ) )
			Engine.SetModelValue( Engine.CreateModel( feb, "monthIndex" ), 2 )
			local mar = Engine.CreateModel( monthModel, "march" )
			Engine.SetModelValue( Engine.CreateModel( mar, "month" ), Engine.Localize( "MENU_MONTHS_MAR" ) )
			Engine.SetModelValue( Engine.CreateModel( mar, "monthIndex" ), 3 )
			local apr = Engine.CreateModel( monthModel, "april" )
			Engine.SetModelValue( Engine.CreateModel( apr, "month" ), Engine.Localize( "MENU_MONTHS_APR" ) )
			Engine.SetModelValue( Engine.CreateModel( apr, "monthIndex" ), 4 )
			local may = Engine.CreateModel( monthModel, "may" )
			Engine.SetModelValue( Engine.CreateModel( may, "month" ), Engine.Localize( "MENU_MONTHS_MAY" ) )
			Engine.SetModelValue( Engine.CreateModel( may, "monthIndex" ), 5 )
			local jun = Engine.CreateModel( monthModel, "june" )
			Engine.SetModelValue( Engine.CreateModel( jun, "month" ), Engine.Localize( "MENU_MONTHS_JUN" ) )
			Engine.SetModelValue( Engine.CreateModel( jun, "monthIndex" ), 6 )
			local jul = Engine.CreateModel( monthModel, "july" )
			Engine.SetModelValue( Engine.CreateModel( jul, "month" ), Engine.Localize( "MENU_MONTHS_JUL" ) )
			Engine.SetModelValue( Engine.CreateModel( jul, "monthIndex" ), 7 )
			local aug = Engine.CreateModel( monthModel, "august" )
			Engine.SetModelValue( Engine.CreateModel( aug, "month" ), Engine.Localize( "MENU_MONTHS_AUG" ) )
			Engine.SetModelValue( Engine.CreateModel( aug, "monthIndex" ), 8 )
			local sep = Engine.CreateModel( monthModel, "september" )
			Engine.SetModelValue( Engine.CreateModel( sep, "month" ), Engine.Localize( "MENU_MONTHS_SEP" ) )
			Engine.SetModelValue( Engine.CreateModel( sep, "monthIndex" ), 9 )
			local oct = Engine.CreateModel( monthModel, "october" )
			Engine.SetModelValue( Engine.CreateModel( oct, "month" ), Engine.Localize( "MENU_MONTHS_OCT" ) )
			Engine.SetModelValue( Engine.CreateModel( oct, "monthIndex" ), 10 )
			local nov = Engine.CreateModel( monthModel, "november" )
			Engine.SetModelValue( Engine.CreateModel( nov, "month" ), Engine.Localize( "MENU_MONTHS_NOV" ) )
			Engine.SetModelValue( Engine.CreateModel( nov, "monthIndex" ), 11 )
			local dec = Engine.CreateModel( monthModel, "december" )
			Engine.SetModelValue( Engine.CreateModel( dec, "month" ), Engine.Localize( "MENU_MONTHS_DEC" ) )
			Engine.SetModelValue( Engine.CreateModel( dec, "monthIndex" ), 12 )
			list.months = {
				jan,
				feb,
				mar,
				apr,
				may,
				jun,
				jul,
				aug,
				sep,
				oct,
				nov,
				dec
			}
		end,
		getCount = function ( list )
			return #list.months
		end,
		getItem = function ( controller, list, index )
			return list.months[index]
		end
	},
	Day = {
		prepare = function ( controller, list, filter )
			list.days = {}
			local itemCount = 31
			local dayModel = Engine.CreateModel( Engine.GetGlobalModel(), "dayModel" )
			for i = 1, itemCount, 1 do
				local tempModel = Engine.CreateModel( dayModel, "Day " .. i )
				local itemModel = Engine.CreateModel( tempModel, "day" )
				Engine.SetModelValue( itemModel, i )
				local index = #list.days + 1
				list.days[index] = tempModel
			end
		end,
		getCount = function ( list )
			return #list.days
		end,
		getItem = function ( controller, list, index )
			return list.days[index]
		end
	},
	Year = {
		prepare = function ( controller, list, filter )
			list.years = {}
			local yearModel = Engine.CreateModel( Engine.GetGlobalModel(), "yearModel" )
			for i = 2015, 1900, -1 do
				local tempModel = Engine.CreateModel( yearModel, "Year " .. i )
				local itemModel = Engine.CreateModel( tempModel, "year" )
				Engine.SetModelValue( itemModel, i )
				local index = #list.years + 1
				list.years[index] = tempModel
			end
		end,
		getCount = function ( list )
			return #list.years
		end,
		getItem = function ( controller, list, index )
			return list.years[index]
		end
	},
	TabbedView = {
		prepare = function ( controller, list, filter )
			list.tabs = {}
			local tabTypeMap = {}
			if CoD.isCampaign == true then
				tabTypeMap = {
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
				tabTypeMap = {
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
			if #tabTypeMap == 0 then
				return 
			end
			table.insert( tabTypeMap, 1, {
				displayName = "",
				viewWidget = "",
				tabIcon = CoD.buttonStrings.shoulderl
			} )
			table.insert( tabTypeMap, {
				displayName = "",
				viewWidget = "",
				tabIcon = CoD.buttonStrings.shoulderr
			} )
			local menuModel = Engine.CreateModel( Engine.GetGlobalModel(), "TabViewModel" )
			for index, tabData in ipairs( tabTypeMap ) do
				local itemModel = Engine.CreateModel( menuModel, "tabModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "tabName" ), tabData.displayName )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "tabWidget" ), tabData.viewWidget )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "tabIcon" ), tabData.tabIcon )
				local index = #list.tabs + 1
				list.tabs[index] = itemModel
			end
		end,
		getCount = function ( list )
			return #list.tabs
		end,
		getItem = function ( controller, list, index )
			return list.tabs[index]
		end
	},
	StartMenuTabs = ListHelper_SetupDataSource( "StartMenuTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if Engine.IsDemoPlaying() then
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_THEATER_CAPS" ),
					tabWidget = "CoD.StartMenu_GameOptions",
					tabIcon = ""
				},
				properties = {
					tabId = "gameOptions"
				}
			} )
		elseif Engine.IsInGame() then
			if CoD.isDOA then
				table.insert( tabList, {
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
				table.insert( tabList, {
					models = {
						tabName = SessionModeToUnlocalizedSessionModeCaps( Engine.CurrentSessionMode() ),
						tabWidget = "CoD.StartMenu_GameOptions_CP",
						tabIcon = ""
					},
					properties = {
						tabId = "gameOptions"
					}
				} )
				table.insert( tabList, {
					models = {
						tabName = "CPUI_TACTICAL_MODE_CAPS",
						tabWidget = "CoD.StartMenu_TacticalMode",
						tabIcon = ""
					},
					properties = {
						tabId = "tacticalMode"
					}
				} )
				if not CoD.isSafehouse then
					table.insert( tabList, {
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
			else
				table.insert( tabList, {
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
			table.insert( tabList, {
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
				table.insert( tabList, {
					models = {
						tabName = "MENU_TAB_BARRACKS_CAPS",
						tabWidget = "CoD.StartMenu_Barracks",
						tabIcon = ""
					},
					properties = {
						tabId = "barracks"
					}
				} )
				table.insert( tabList, {
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
		if CoD.isDOA then
			local f40_local0 = table.insert
			local f40_local1 = tabList
			local f40_local2 = {
				models = {
					tabName = "MENU_TAB_OPTIONS_CAPS",
					tabWidget = "CoD.StartMenu_Options_DOA",
					tabIcon = ""
				}
			}
			local f40_local3 = {
				tabId = "options"
			}
			local f40_local4 = Dvar.ui_execdemo:get()
			if f40_local4 then
				f40_local4 = not Engine.IsInGame()
			end
			f40_local3.selectIndex = f40_local4
			f40_local2.properties = f40_local3
			f40_local0( f40_local1, f40_local2 )
		else
			local f40_local0 = table.insert
			local f40_local1 = tabList
			local f40_local2 = {
				models = {
					tabName = "MENU_TAB_OPTIONS_CAPS",
					tabWidget = "CoD.StartMenu_Options",
					tabIcon = ""
				}
			}
			local f40_local3 = {
				tabId = "options"
			}
			local f40_local4 = Dvar.ui_execdemo_gamescom:get()
			if f40_local4 then
				f40_local4 = not Engine.IsInGame()
			end
			f40_local3.selectIndex = f40_local4
			f40_local2.properties = f40_local3
			f40_local0( f40_local1, f40_local2 )
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
	end
	 ),
	GameSettingsTabs = ListHelper_SetupDataSource( "GameSettingsTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = "MENU_GAME_MODE_RULES",
				tabWidget = "CoD.GameSettings_GameModeRules",
				tabIcon = ""
			},
			properties = {
				tabId = "game_mode_rules"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = "MENU_GLOBAL_SETTINGS",
				tabWidget = "CoD.GameSettings_GlobalSettings",
				tabIcon = ""
			},
			properties = {
				tabId = "global_settings"
			}
		} )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return tabList
	end
	 ),
	CodCasterSideBarTabs = ListHelper_SetupDataSource( "CodCasterSideBarTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = "CODCASTER_SETTINGS",
				tabWidget = "CoD.CodCasterSettingsSideBarDisplaySettings",
				tabIcon = ""
			},
			properties = {
				tabId = "players"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = "CODCASTER_LOADOUT",
				tabWidget = "CoD.CodCasterSettingsSideBarLoadoutSettings",
				tabIcon = ""
			},
			properties = {
				tabId = "options"
			}
		} )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return tabList
	end
	 ),
	EditCodCasterSettingsButtonList = ListHelper_SetupDataSource( "EditCodCasterSettingsButtonList", function ( controller )
		local list = {}
		local SetupTeamIdentityModel = function ( controller, team )
			local teamIdentityModel = DataSources.TeamIdentity.getModel( controller )
			Engine.SetModelValue( Engine.CreateModel( teamIdentityModel, "team" ), team )
		end
		
		local teamIdentityProfileVar = "shoutcaster_fe_team_identity"
		local f43_local0 = CoD.ShoutcasterProfileVarBool( controller, teamIdentityProfileVar ) == false
		local teamIdentityDataSourceOptions = {}
		table.insert( teamIdentityDataSourceOptions, {
			name = Engine.ToUpper( Engine.Localize( "CODCASTER_TEAM_IDENTITY_FACTIONS" ) ),
			value = Enum.ShoutcasterSettingTeamIdentityMode.SHOUTCASTER_SETTING_TEAM_IDENTITY_MODE_FACTION
		} )
		table.insert( teamIdentityDataSourceOptions, {
			name = Engine.ToUpper( Engine.Localize( "CODCASTER_TEAM_IDENTITY_CUSTOM" ) ),
			value = Enum.ShoutcasterSettingTeamIdentityMode.SHOUTCASTER_SETTING_TEAM_IDENTITY_MODE_CUSTOM
		} )
		local engineFunc = function ( menu, controller, profileVar, value )
			for i = 1, #menu.ButtonList.EditCodCasterSettingsButtonList, 1 do
				local button = menu.ButtonList.EditCodCasterSettingsButtonList[i]
				if button.properties and button.properties.btnType == "btnTeamIdentitySubSettings" then
					local disabledModel = Engine.GetModel( button.model, "disabled" )
					local f45_local2 = value == 0
					Engine.SetModelValue( disabledModel, f45_local2 )
					button.properties.disabled = f45_local2
					CoD.SetupTeamIdentityInformation( menu, controller, "team1" )
					CoD.SetupTeamIdentityInformation( menu, controller, "team2" )
				end
			end
		end
		
		local buttons = {
			{
				btnType = "btnSettings",
				displayText = "CODCASTER_QUICK_SETTINGS",
				hintText = "CODCASTER_QUICK_SETTINGS_DESC",
				buttonOnly = true,
				disabled = false,
				showTeam1Info = false,
				showTeam2Info = false,
				actionFn = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "EditCodCasterQuickSettings", true, controller )
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
				actionFn = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "EditCodCasterDisplaySettings", true, controller )
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
				actionFn = function ( self, element, controller, actionParam, menu )
					NavigateToMenu( menu, "EditCodCasterLoadoutSettings", true, controller )
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
				actionFn = function ( self, element, controller, actionParam, menu )
					
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
				optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "CoDCasterSettings_TeamIdentity", teamIdentityDataSourceOptions, teamIdentityProfileVar, engineFunc, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
				currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( controller, teamIdentityDataSourceOptions, teamIdentityProfileVar )
			},
			{
				btnType = "btnTeamIdentitySubSettings",
				displayText = "CODCASTER_TEAM1_SETTINGS",
				hintText = "CODCASTER_TEAM1_SETTINGS_DESC",
				buttonOnly = true,
				disabled = f43_local0,
				showTeam1Info = true,
				showTeam2Info = false,
				actionFn = function ( self, element, controller, actionParam, menu )
					SetupTeamIdentityModel( controller, "team1" )
					NavigateToMenu( menu, "EditTeamIdentity", true, controller )
				end
			},
			{
				btnType = "btnTeamIdentitySubSettings",
				displayText = "CODCASTER_TEAM2_SETTINGS",
				hintText = "CODCASTER_TEAM2_SETTINGS_DESC",
				buttonOnly = true,
				disabled = f43_local0,
				showTeam1Info = false,
				showTeam2Info = true,
				actionFn = function ( self, element, controller, actionParam, menu )
					SetupTeamIdentityModel( controller, "team2" )
					NavigateToMenu( menu, "EditTeamIdentity", true, controller )
				end
			}
		}
		for index, buttonData in ipairs( buttons ) do
			table.insert( list, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( buttonData.displayText ) ),
					hintText = buttonData.hintText,
					buttonOnly = buttonData.buttonOnly,
					sliderOnly = buttonData.sliderOnly,
					disabled = buttonData.disabled,
					showTeam1Info = buttonData.showTeam1Info,
					showTeam2Info = buttonData.showTeam2Info,
					optionsDatasource = buttonData.optionsDatasource,
					currentSelection = buttonData.currentSelection,
					selected = false
				},
				properties = {
					btnType = buttonData.btnType,
					hideArrows = buttonData.buttonOnly == true,
					disabled = buttonData.disabled,
					action = buttonData.actionFn,
					spacing = buttonData.spacing
				}
			} )
		end
		return list
	end
	, false, nil, nil, function ( list, row, widgetHeight )
		if list.EditCodCasterSettingsButtonList[row].properties.spacing then
			return list.EditCodCasterSettingsButtonList[row].properties.spacing
		else
			return list.spacing
		end
	end
	 ),
	CodCasterQuickSettingsButtonList = ListHelper_SetupDataSource( "CodCasterQuickSettingsButtonList", function ( controller )
		local list = {}
		local buttons = {
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
		}
		for index, buttonData in ipairs( buttons ) do
			table.insert( list, {
				models = {
					displayText = Engine.Localize( buttonData.displayText ),
					hintText = Engine.Localize( buttonData.hintText ),
					profileVarValue = CoD.ShoutcasterProfileVarBool( controller, buttonData.profileVar )
				},
				properties = {
					profileVar = buttonData.profileVar
				}
			} )
		end
		return list
	end
	 ),
	CodCasterDisplaySettingsButtonList = ListHelper_SetupDataSource( "CodCasterDisplaySettingsButtonList", function ( controller )
		local list = {}
		local engineFunc = function ( menu, controller, profileVar, value )
			if not Engine.IsInGame() then
				return 
			else
				ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			end
		end
		
		local onOffButtonOptions = {}
		table.insert( onOffButtonOptions, {
			name = "MENU_OFF",
			value = 0
		} )
		table.insert( onOffButtonOptions, {
			name = "MENU_ON",
			value = 1
		} )
		local xrayOptions = {}
		table.insert( xrayOptions, {
			name = "CODCASTER_XRAY_NONE",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_OFF
		} )
		table.insert( xrayOptions, {
			name = "CODCASTER_XRAY_ENEMY",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_ENEMY
		} )
		table.insert( xrayOptions, {
			name = "CODCASTER_XRAY_BOTH",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_ALL
		} )
		local perksOptions = {}
		table.insert( perksOptions, {
			name = "MENU_ON_SPAWN",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ON
		} )
		table.insert( perksOptions, {
			name = "MPUI_ALWAYS_ON",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ALWAYS
		} )
		table.insert( perksOptions, {
			name = "CODCASTER_MINIMAP_STANDARD",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_STANDARD
		} )
		table.insert( perksOptions, {
			name = "MENU_OFF",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_OFF
		} )
		local minimapOptions = {}
		table.insert( minimapOptions, {
			name = "MENU_OFF",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_OFF
		} )
		table.insert( minimapOptions, {
			name = "CODCASTER_MINIMAP_STANDARD",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_STANDARD
		} )
		table.insert( minimapOptions, {
			name = "CODCASTER_MINIMAP_FULL_VIEW",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_FULL
		} )
		local buttons = {
			{
				name = "Xray",
				displayText = "CODCASTER_DS_XRAY",
				hintText = "CODCASTER_DS_XRAY_DESC",
				profileVar = "shoutcaster_xray",
				options = xrayOptions
			},
			{
				name = "FlipScorePanel",
				displayText = "CODCASTER_DS_FLIP_SCORE_PANEL",
				hintText = "CODCASTER_DS_FLIP_SCORE_PANEL_DESC",
				profileVar = "shoutcaster_flip_scorepanel",
				options = onOffButtonOptions
			},
			{
				name = "TeamIdentity",
				displayText = "CODCASTER_DS_TEAM_IDENTITY",
				hintText = "CODCASTER_DS_TEAM_IDENTITY_DESC",
				profileVar = "shoutcaster_team_identity",
				options = onOffButtonOptions
			},
			{
				name = "Toolbar",
				displayText = "CODCASTER_DS_TOOLBAR",
				hintText = "CODCASTER_DS_TOOLBAR_DESC",
				profileVar = "shoutcaster_toolbar",
				options = onOffButtonOptions
			},
			{
				name = "Perks",
				displayText = "CODCASTER_DS_PERKS",
				hintText = "CODCASTER_DS_PERKS_DESC",
				profileVar = "shoutcaster_perks",
				options = perksOptions
			},
			{
				name = "Minimap",
				displayText = "CODCASTER_DS_MINIMAP",
				hintText = "CODCASTER_DS_MINIMAP_DESC",
				profileVar = "shoutcaster_minimap",
				options = minimapOptions
			},
			{
				name = "TeamScore",
				displayText = "CODCASTER_DS_TEAM_SCORE",
				hintText = "CODCASTER_DS_TEAM_SCORE_DESC",
				profileVar = "shoutcaster_teamscore",
				options = onOffButtonOptions
			},
			{
				name = "Inventory",
				displayText = "CODCASTER_DS_INVENTORY",
				hintText = "CODCASTER_DS_INVENTORY_DESC",
				profileVar = "shoutcaster_inventory",
				options = onOffButtonOptions
			},
			{
				name = "Scorestreaks",
				displayText = "CODCASTER_DS_SCORESTREAKS",
				hintText = "CODCASTER_DS_SCORESTREAKS_DESC",
				profileVar = "shoutcaster_scorestreaks",
				options = onOffButtonOptions
			},
			{
				name = "ScorestreakNotifications",
				displayText = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS",
				hintText = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_scorestreaks_notification",
				options = onOffButtonOptions
			},
			{
				name = "SpecialistNotifications",
				displayText = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS",
				hintText = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_specialist_notification",
				options = onOffButtonOptions
			},
			{
				name = "ObjectiveStatus",
				displayText = "CODCASTER_DS_OBJECTIVE_STATUS",
				hintText = "CODCASTER_DS_OBJECTIVE_STATUS_DESC",
				profileVar = "shoutcaster_objective_status",
				options = onOffButtonOptions
			},
			{
				name = "WaypointMarkers",
				displayText = "CODCASTER_DS_WAYPOINT_MARKERS",
				hintText = "CODCASTER_DS_WAYPOINT_MARKERS_DESC",
				profileVar = "shoutcaster_waypoint_markers",
				options = onOffButtonOptions
			},
			{
				name = "KillFeed",
				displayText = "CODCASTER_DS_KILLFEED",
				hintText = "CODCASTER_DS_KILLFEED_DESC",
				profileVar = "shoutcaster_killfeed",
				options = onOffButtonOptions
			},
			{
				name = "CalloutCards",
				displayText = "CODCASTER_DS_CALLOUT_CARDS",
				hintText = "CODCASTER_DS_CALLOUT_CARDS_DESC",
				profileVar = "shoutcaster_calloutcards",
				options = onOffButtonOptions
			},
			{
				name = "PlayerNotifications",
				displayText = "CODCASTER_DS_PLAYER_NOTIFICATIONS",
				hintText = "CODCASTER_DS_PLAYER_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_playernotifications",
				options = onOffButtonOptions
			},
			{
				name = "VoipDock",
				displayText = "CODCASTER_DS_VOIP_DOCK",
				hintText = "CODCASTER_DS_VOIP_DOCK_DESC",
				profileVar = "shoutcaster_voipdock",
				options = onOffButtonOptions
			}
		}
		for index, buttonData in ipairs( buttons ) do
			table.insert( list, {
				models = {
					displayText = buttonData.displayText,
					hintText = buttonData.hintText,
					buttonOnly = false,
					disabled = false,
					optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "CoDCasterDisplaySettings_" .. buttonData.name, buttonData.options, buttonData.profileVar, engineFunc, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
					currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( controller, buttonData.options, buttonData.profileVar ),
					selected = false
				},
				properties = {
					hideArrows = false,
					disabled = false
				}
			} )
		end
		return list
	end
	 ),
	CodCasterLoadoutSettingsButtonList = ListHelper_SetupDataSource( "CodCasterLoadoutSettingsButtonList", function ( controller )
		local list = {}
		local engineFunc = function ( menu, controller, profileVar, value )
			if not Engine.IsInGame() then
				return 
			else
				ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			end
		end
		
		local onOffButtonOptions = {}
		table.insert( onOffButtonOptions, {
			name = "MENU_OFF",
			value = 0
		} )
		table.insert( onOffButtonOptions, {
			name = "MENU_ON",
			value = 1
		} )
		local buttons = {
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
		}
		for index, buttonData in ipairs( buttons ) do
			table.insert( list, {
				models = {
					displayText = buttonData.displayText,
					hintText = buttonData.hintText,
					buttonOnly = false,
					disabled = false,
					optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "CoDCasterLoadoutSettings_" .. buttonData.name, onOffButtonOptions, buttonData.profileVar, engineFunc, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
					currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( controller, onOffButtonOptions, buttonData.profileVar ),
					selected = false
				},
				properties = {
					hideArrows = false,
					disabled = false
				}
			} )
		end
		return list
	end
	 ),
	TeamIdentity = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "TeamIdentity" )
		end
	},
	TeamIdentityInformation = {
		getModel = function ( controller, team )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			local teamIdentityModel = Engine.GetModel( perControllerModel, "TeamIdentity" )
			if not team then
				team = Engine.GetModelValue( Engine.GetModel( teamIdentityModel, "team" ) )
			end
			return Engine.CreateModel( teamIdentityModel, team )
		end
	},
	TeamIdentityColorList = ListHelper_SetupDataSource( "TeamIdentityColorList", function ( controller )
		local list = {}
		if not CoD.CodCaster_TeamIdentity.ColorList then
			CoD.CodCaster_TeamIdentity.ColorList = CoD.GetCodCasterTeamColorList( controller )
		end
		local colorList = CoD.CodCaster_TeamIdentity.ColorList
		local teamIdentityModel = Engine.GetModel( Engine.GetModelForController( controller ), "TeamIdentity" )
		if teamIdentityModel then
			local team = Engine.GetModelValue( Engine.GetModel( teamIdentityModel, "team" ) )
			local selectedColorIndex = CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_" .. team .. "_color" )
			local otherTeamColorIndex = -1
			if team == "team1" then
				otherTeamColorIndex = CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_team2_color" )
			elseif team == "team2" then
				otherTeamColorIndex = CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_team1_color" )
			end
			for i = 1, #colorList, 1 do
				local colorModel = colorList[i]
				local selectIndex = false
				local disabled = false
				local selected = false
				if selectedColorIndex == i - 1 then
					selectIndex = true
					selected = true
				end
				if otherTeamColorIndex >= 0 and otherTeamColorIndex == i - 1 then
					disabled = true
				end
				if disabled == false then
					local id = Engine.GetModelValue( Engine.GetModel( colorModel, "id" ) )
					local color = Engine.GetModelValue( Engine.GetModel( colorModel, "color" ) )
					table.insert( list, {
						models = {
							id = id,
							color = color,
							disabled = disabled,
							selected = selected
						},
						properties = {
							selectIndex = selectIndex,
							disabled = disabled
						}
					} )
				end
			end
		end
		return list
	end
	 ),
	TeamIdentityLogoList = ListHelper_SetupDataSource( "TeamIdentityLogoList", function ( controller )
		local list = {}
		if not CoD.CodCaster_TeamIdentity.LogoList then
			CoD.CodCaster_TeamIdentity.LogoList = CoD.GetCodCasterTeamLogoList( controller )
		end
		local logoList = CoD.CodCaster_TeamIdentity.LogoList
		local teamIdentityModel = Engine.GetModel( Engine.GetModelForController( controller ), "TeamIdentity" )
		if teamIdentityModel then
			local team = Engine.GetModelValue( Engine.GetModel( teamIdentityModel, "team" ) )
			local selectedLogoIndex = CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_" .. team .. "_icon" )
			local otherTeamLogoIndex = -1
			if team == "team1" then
				otherTeamLogoIndex = CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_team2_icon" )
			elseif team == "team2" then
				otherTeamLogoIndex = CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_fe_team1_icon" )
			end
			for i = 1, #logoList, 1 do
				local logoModel = logoList[i]
				local selectIndex = false
				local disabled = false
				if selectedLogoIndex == i - 1 then
					selectIndex = true
				end
				if otherTeamLogoIndex >= 0 and otherTeamLogoIndex == i - 1 then
					disabled = true
				end
				local id = Engine.GetModelValue( Engine.GetModel( logoModel, "id" ) )
				local name = Engine.GetModelValue( Engine.GetModel( logoModel, "name" ) )
				local ref = Engine.GetModelValue( Engine.GetModel( logoModel, "ref" ) )
				table.insert( list, {
					models = {
						id = id,
						name = name,
						ref = ref,
						disabled = disabled
					},
					properties = {
						selectIndex = selectIndex,
						disabled = disabled
					}
				} )
			end
		end
		return list
	end
	 ),
	MyShowcaseTabs = ListHelper_SetupDataSource( "MyShowcaseTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "MENU_SHOWCASE_CAPS" ),
				tabWidget = "CoD.MyShowcase_Showcase",
				tabIcon = ""
			},
			properties = {
				tabId = "showcase",
				selectIndex = false,
				disabled = true
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "MENU_CATEGORIES_CAPS" ),
				tabWidget = "CoD.MyShowcase_Categories",
				tabIcon = ""
			},
			properties = {
				tabId = "categories",
				selectIndex = true
			}
		} )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return tabList
	end
	 ),
	MyShowcasePaintjobsTabs = ListHelper_SetupDataSource( "MyShowcasePaintjobsTabs", function ( controller )
		local tabList = {}
		return tabList
	end
	 ),
	GametypeSettings = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		end
	},
	StartMenuGameOptions = ListHelper_SetupDataSource( "StartMenuGameOptions", function ( controller )
		local options = {}
		if Engine.IsDemoPlaying() then
			local segmentCount = Engine.GetDemoSegmentCount()
			local isHighlightReelMode = Engine.IsDemoHighlightReelMode()
			local isClipPlaying = Engine.IsDemoClipPlaying()
			table.insert( options, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( "MENU_UPLOAD_CLIP", segmentCount ) ),
					action = StartMenuUploadClip,
					disabledFunction = IsUploadClipButtonDisabled
				}
			} )
			table.insert( options, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_MANAGE_SEGMENTS" ) ),
					action = StartMenuOpenManageSegments,
					disabledFunction = IsManageSegmentsButtonDisabled
				}
			} )
			if isHighlightReelMode then
				table.insert( options, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) ),
						action = StartMenuOpenCustomizeHighlightReel,
						disabledFunction = IsCustomizeHighlightReelButtonDisabled
					}
				} )
			end
			table.insert( options, {
				models = {
					displayText = Engine.ToUpper( Engine.ToUpper( Engine.Localize( "MENU_JUMP_TO_START" ) ) ),
					action = StartMenuJumpToStart,
					disabledFunction = IsJumpToStartButtonDisabled
				}
			} )
			local endDemoButtonText = nil
			if isClipPlaying then
				endDemoButtonText = Engine.ToUpper( Engine.Localize( "MENU_END_CLIP" ) )
			else
				endDemoButtonText = Engine.ToUpper( Engine.Localize( "MENU_END_FILM" ) )
			end
			table.insert( options, {
				models = {
					displayText = Engine.ToUpper( endDemoButtonText ),
					action = StartMenuEndDemo
				}
			} )
		elseif CoD.isCampaign then
			table.insert( options, {
				models = {
					displayText = "MENU_RESUMEGAME_CAPS",
					action = StartMenuGoBack_ListElement
				}
			} )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and not CoD.isSafehouse then
				table.insert( options, {
					models = {
						displayText = "MENU_RESTART_MISSION_CAPS",
						action = RestartMission
					}
				} )
				table.insert( options, {
					models = {
						displayText = "MENU_RESTART_CHECKPOINT_CAPS",
						action = RestartFromCheckpoint
					}
				} )
				table.insert( options, {
					models = {
						displayText = "MENU_CHANGE_DIFFICULTY_CAPS",
						action = OpenDifficultySelect
					}
				} )
			end
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				table.insert( options, {
					models = {
						displayText = "MENU_SAVE_AND_EXIT_CAPS",
						action = SaveAndQuitGame
					}
				} )
			else
				table.insert( options, {
					models = {
						displayText = "MENU_LEAVE_PARTY_AND_EXIT_CAPS",
						action = QuitGame
					}
				} )
			end
		elseif CoD.isMultiplayer then
			local team = Engine.Team( controller, "name" )
			if team ~= "TEAM_SPECTATOR" and Engine.GetGametypeSetting( "disableClassSelection" ) ~= 1 then
				table.insert( options, {
					models = {
						displayText = "MPUI_CHOOSE_CLASS_BUTTON_CAPS",
						action = ChooseClass
					}
				} )
			end
			if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == false and Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and CoD.IsGametypeTeamBased() == true and CoD.IsTeamChangeAllowed() then
				table.insert( options, {
					models = {
						displayText = "MPUI_CHANGE_TEAM_BUTTON_CAPS",
						action = ChooseTeam
					}
				} )
			end
			local endGameText = "MENU_QUIT_GAME_CAPS"
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and not CoD.isOnlineGame() then
				endGameText = "MENU_END_GAME_CAPS"
			end
			table.insert( options, {
				models = {
					displayText = endGameText,
					action = QuitGame_MP
				}
			} )
		elseif CoD.isZombie then
			table.insert( options, {
				models = {
					displayText = "MENU_RESUMEGAME_CAPS",
					action = StartMenuGoBack_ListElement
				}
			} )
			if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
				table.insert( options, {
					models = {
						displayText = "MENU_RESTART_LEVEL_CAPS",
						action = RestartGame
					}
				} )
			end
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
				table.insert( options, {
					models = {
						displayText = "MENU_END_GAME_CAPS",
						action = QuitGame_MP
					}
				} )
			else
				table.insert( options, {
					models = {
						displayText = "MENU_QUIT_GAME_CAPS",
						action = QuitGame_MP
					}
				} )
			end
		end
		return options
	end
	, true ),
	PlatformControllerImage = {
		getModel = function ( controller )
			local controllerImageModel = Engine.CreateModel( Engine.GetGlobalModel(), "PlatformControllerImage" )
			local imageModel = Engine.CreateModel( controllerImageModel, "image" )
			if CoD.isPC then
				Engine.SetModelValue( imageModel, "t7_menu_startmenu_option_pc" )
			elseif CoD.isDurango then
				Engine.SetModelValue( imageModel, "t7_menu_startmenu_option_xboxone" )
			else
				Engine.SetModelValue( imageModel, "t7_menu_startmenu_option_ps4" )
			end
			return controllerImageModel
		end
	},
	MissionObjectives = ListHelper_SetupDataSource( "MissionObjectives", function ( controller )
		local objectives = {}
		local objective_table = Engine.GetPlayerObjectives( controller )
		if objective_table == nil then
			return 
		end
		local main_objectives = {}
		local main_objectives_count = 1
		for index, objective in CoD.pairsByKeys( objective_table ) do
			if objective.status ~= "invisible" and objective.objective_desc ~= nil and objective.objective_desc ~= "" then
				if not main_objectives[objective.objective_desc] then
					main_objectives[objective.objective_desc] = {
						index = main_objectives_count,
						desc = objective.objective_desc,
						complete = objective.status == "done",
						sub_objectives = {}
					}
					main_objectives_count = main_objectives_count + 1
				end
				local f67_local3 = main_objectives[objective.objective_desc]
				local f67_local4 = main_objectives[objective.objective_desc].complete
				if f67_local4 then
					f67_local4 = objective.status == "done"
				end
				f67_local3.complete = f67_local4
				if objective.subobjective_desc then
					table.insert( main_objectives[objective.objective_desc].sub_objectives, {
						desc = objective.subobjective_desc,
						complete = objective.status == "done"
					} )
				end
			end
		end
		local main_objective_sort = function ( a, b )
			return main_objectives[a].index < main_objectives[b].index
		end
		
		f67_local1 = function ( obj_table, subobjective, awaitingOrders )
			return {
				models = {
					objective = obj_table.desc
				},
				properties = {
					completed = obj_table.complete,
					subobjective = subobjective,
					awaitingOrders = awaitingOrders
				}
			}
		end
		
		local add_awaiting_orders = function ( subobjective )
			return f67_local1( {
				desc = "CPUI_AWAITING_UPDATE"
			}, subobjective, true )
		end
		
		local any_incomplete_objectives = false
		for _, main_objective in LUI.IterateTableBySortedKeys( main_objectives, main_objective_sort ) do
			table.insert( objectives, f67_local1( main_objective ) )
			if not main_objective.complete then
				any_incomplete_objectives = true
				local all_subobjectives_complete = true
				for __, sub_objective in ipairs( main_objective.sub_objectives ) do
					table.insert( objectives, f67_local1( sub_objective, true ) )
					if all_subobjectives_complete then
						all_subobjectives_complete = sub_objective.complete
					end
				end
				if all_subobjectives_complete then
					table.insert( objectives, add_awaiting_orders( true ) )
				end
			end
		end
		if not any_incomplete_objectives then
			table.insert( objectives, 1, add_awaiting_orders( false ) )
		end
		return objectives
	end
	, true ),
	OptionsTabSelectionList = {
		prepare = function ( controller, list, filter )
			list.options = {}
			local options = {
				{
					optionDisplay = "OPEN OPTIONS MENU",
					action = OpenOptionsMenu
				}
			}
			local menuModel = Engine.CreateModel( Engine.GetGlobalModel(), "OptionsTabSelectionList" )
			for index, buttonData in ipairs( options ) do
				local buttonModel = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				list.options[index] = buttonModel
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( buttonData.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.options
		end,
		getItem = function ( controller, list, index )
			return list.options[index]
		end
	},
	StartMenuSelectionList = {
		prepare = function ( controller, list, filter )
			list.options = {}
			local options = nil
			if CoD.isCampaign == true then
				options = {
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
				options = {
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
			if not options then
				return 
			end
			local menuModel = Engine.CreateModel( Engine.GetGlobalModel(), "StartMenuSelectionModel" )
			for index, buttonData in ipairs( options ) do
				local buttonModel = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				list.options[index] = buttonModel
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( buttonData.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.options
		end,
		getItem = function ( controller, list, index )
			return list.options[index]
		end
	},
	PartyLobbyMembers = {
		prepare = function ( controller, list, filter )
			list.partyLobbyModel = list:getModel( Engine.GetPrimaryController(), "partyLobby" )
			list.partyLobbyMemberCountModel = Engine.GetModel( list.partyLobbyModel, "memberCount" )
			list:unsubscribeFromAllModels()
			list:subscribeToModel( list.partyLobbyMemberCountModel, function ()
				list:updateDataSource()
			end )
		end,
		getCount = function ( list )
			return Engine.GetModelValue( list.partyLobbyMemberCountModel )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.partyLobbyModel, "member" .. index - 1 )
		end
	},
	StorageGlobal = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "storageGlobalRoot" )
			return model
		end
	},
	LobbyRoot = {
		getModel = function ( controller )
			local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			Engine.CreateModel( lobbyRootModel, "leaderActivity" )
			local lobbyStatusString1Model = Engine.GetModel( lobbyRootModel, "lobbyStatusString1" )
			if not lobbyStatusString1Model then
				Engine.SetModelValue( Engine.CreateModel( lobbyRootModel, "lobbyStatusString1" ), "" )
				local lobbyStatusString2Model = Engine.CreateModel( lobbyRootModel, "lobbyStatusString2" )
				Engine.SetModelValue( lobbyStatusString2Model, "" )
				local lobbyStatusString3Model = Engine.CreateModel( lobbyRootModel, "lobbyStatusString3" )
				Engine.SetModelValue( lobbyStatusString3Model, "" )
			end
			return lobbyRootModel
		end
	},
	LobbyPromptTitle = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPromptModel" )
			local titleModel = Engine.CreateModel( model, "lobbyPromptTitle" )
			local descriptionModel = Engine.CreateModel( model, "lobbyPromptDescription" )
			Engine.SetModelValue( titleModel, CoD.LobbyBase.Prompt.Title )
			Engine.SetModelValue( descriptionModel, CoD.LobbyBase.Prompt.Description )
			return model
		end
	},
	LobbyPlaylistName = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
			local nameModel = Engine.CreateModel( model, "name" )
			if CoD.LobbyBase then
				Engine.SetModelValue( nameModel, Engine.ToUpper( CoD.LobbyBase.PlaylistName ) )
			else
				Engine.SetModelValue( nameModel, "" )
			end
			return model
		end
	},
	LobbyPromptSelectionList = {
		prepare = function ( controller, list, filter )
			list.options = {}
			local options = CoD.LobbyBase.Prompt.Options
			local menuModel = Engine.CreateModel( Engine.GetGlobalModel(), "LobbyPromptSelectionListModel" )
			for index, buttonData in ipairs( options ) do
				local buttonModel = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				list.options[index] = buttonModel
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( buttonData.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), buttonData.action )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "param" ), buttonData.param )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "customId" ), buttonData.customId )
			end
		end,
		getCount = function ( list )
			return #list.options
		end,
		getItem = function ( controller, list, index )
			return list.options[index]
		end
	},
	ModalDialogData = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" )
			Engine.SetModelValue( Engine.CreateModel( model, "title" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Title ) )
			Engine.SetModelValue( Engine.CreateModel( model, "description" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Description ) )
			return model
		end
	},
	ModalDialogDataList = {
		prepare = function ( controller, list, filter )
			list.options = {}
			local options = CoD.Menu.ModalDialogInfo.Options
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" ), "list" )
			for index, buttonData in ipairs( options ) do
				list.options[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.options[index], "displayText" ), Engine.Localize( buttonData ) )
			end
		end,
		getCount = function ( list )
			return #list.options
		end,
		getItem = function ( controller, list, index )
			return list.options[index]
		end
	},
	SideModalDialogDataList = {
		prepare = function ( controller, list, filter )
			list.options = {}
			local options = CoD.Menu.ModalDialogInfo.Options
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" ), "list" )
			for index, buttonData in ipairs( options ) do
				list.options[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.options[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.options[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.options[index], "displayDesc" ), Engine.Localize( buttonData.displayDesc ) )
			end
		end,
		getCount = function ( list )
			return #list.options
		end,
		getItem = function ( controller, list, index )
			return list.options[index]
		end
	},
	PartyPrivacy = {
		getModel = function ( controller )
			Dvar.partyPrivacyEnabled:set( true )
			local privacy = Engine.GetPartyPrivacy()
			local maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				maxClients = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
			end
			local partyPrivacyModel = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
			Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacy" ), privacy )
			Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacyStatus" ), PartyPrivacy( privacy ) )
			Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "maxPlayers" ), maxClients )
			return partyPrivacyModel
		end
	},
	MapVote = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
		end
	},
	LobbyFriendsAndGroups = {
		updateOnlineCount = function ( controller, list, filter )
			local friendsCount = Engine.GetModelValue( list.friendsCountUIModel )
			local menuModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyFriends" )
			Engine.SetModelValue( Engine.CreateModel( menuModel, "onlineCount" ), friendsCount )
			Engine.SetModelValue( Engine.CreateModel( menuModel, "moreCount" ), friendsCount )
			DataSources.LobbyFriendsAndGroups.onlineFriendsCount = friendsCount
		end,
		prepare = function ( controller, list, filter )
			local rankShown = 0
			if CoD.isModeSelected == true then
				rankShown = 1
			end
			list.listItems = {}
			if list.countSubscription then
				list:removeSubscription( list.countSubscription )
			end
			if list.lobbyListCountSubscription then
				list:removeSubscription( list.lobbyListCountSubscription )
			end
			local friendsListItems = {}
			list.friendsUIModel = CoD.Friends.GetRootUIModel( controller )
			list.friendsCountUIModel = CoD.Friends.GetCountUIModel( controller )
			if list.friendsListCountSubscription then
				list:removeSubscription( list.friendsListCountSubscription )
			end
			local friendsCountModel = CoD.Friends.GetCountUIModel( controller )
			list.friendsListCountSubscription = list:subscribeToModel( friendsCountModel, function ( model )
				DataSources.LobbyFriendsAndGroups.updateOnlineCount( controller, list, filter )
				list:updateDataSource()
			end, false )
			if list.friendsUpdateSubscription then
				list:removeSubscription( list.friendsUpdateSubscription )
			end
			local friendsUpdateModel = CoD.Friends.GetUpdateUIModel( controller )
			if friendsUpdateModel ~= nil then
				list.friendsUpdateSubscription = list:subscribeToModel( friendsUpdateModel, function ( model )
					list:updateDataSource()
				end, false )
			end
			DataSources.LobbyFriendsAndGroups.updateOnlineCount( controller, list, filter )
			local friendsCount = Engine.GetModelValue( list.friendsCountUIModel )
			for i = 1, friendsCount, 1 do
				local itemModel = CoD.Friends.GetItemUIModel( list.friendsUIModel, i )
				local hasRank = Engine.GetModelValue( Engine.GetModel( itemModel, "hasRank" ) )
				CoD.Friends.GetCount( controller )
				if hasRank == 1 then
					Engine.SetModelValue( Engine.CreateModel( itemModel, "rankShown" ), rankShown )
				else
					Engine.SetModelValue( Engine.CreateModel( itemModel, "rankShown" ), 0 )
				end
				Engine.SetModelValue( Engine.CreateModel( itemModel, "activity" ), Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY )
				local xuid = Engine.GetModelValue( Engine.GetModel( itemModel, "xuid" ) )
				table.insert( friendsListItems, {
					model = itemModel,
					isFriendItem = true,
					xuid = xuid
				} )
			end
			local groupsListItems = {}
			local groupMembersUIModel = Engine.GetModel( Engine.GetGlobalModel(), "unifiedGroupMembersListRoot" )
			if groupMembersUIModel ~= nil then
				list.groupMembersUIModel = groupMembersUIModel
				list.groupMembersCountUIModel = Engine.GetModel( list.groupMembersUIModel, "count" )
				if list.groupsListCountSubscription then
					list:removeSubscription( list.groupsListCountSubscription )
				end
				list.groupsListCountSubscription = list:subscribeToModel( list.groupMembersCountUIModel, function ( model )
					DataSources.LobbyFriendsAndGroups.updateOnlineCount( controller, list, filter )
					list:updateDataSource()
				end, false )
				DataSources.LobbyFriendsAndGroups.updateOnlineCount( controller, list, filter )
				local groupMembersCount = Engine.GetModelValue( list.groupMembersCountUIModel )
				for i = 1, groupMembersCount, 1 do
					local itemModel = Engine.GetModel( list.groupMembersUIModel, "member" .. i - 1 )
					local hasRank = Engine.GetModelValue( Engine.GetModel( itemModel, "hasRank" ) )
					local xuid = Engine.GetModelValue( Engine.GetModel( itemModel, "xuid" ) )
					local isUserAlreadyAdded = false
					for j = 1, #friendsListItems, 1 do
						local friendsItemModel = friendsListItems[j].model
						local friendxuid = Engine.GetModelValue( Engine.GetModel( friendsItemModel, "xuid" ) )
						if friendxuid == xuid then
							isUserAlreadyAdded = true
							break
						end
					end
					if not isUserAlreadyAdded then
						if hasRank == 1 then
							Engine.SetModelValue( Engine.CreateModel( itemModel, "rankShown" ), rankShown )
						else
							Engine.SetModelValue( Engine.CreateModel( itemModel, "rankShown" ), 0 )
						end
						Engine.SetModelValue( Engine.CreateModel( itemModel, "isJoinable" ), 0 )
						table.insert( groupsListItems, {
							model = itemModel,
							isGroupsItem = true,
							xuid = xuid
						} )
					end
				end
			end
			local groupCount = #groupsListItems
			for i, item in ipairs( friendsListItems ) do
				table.insert( list.listItems, item )
			end
			for i, item in ipairs( groupsListItems ) do
				table.insert( list.listItems, item )
			end
		end,
		getCount = function ( list )
			return #list.listItems
		end,
		getItem = function ( controller, list, index )
			return list.listItems[index].model
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.listItems[index]
		end
	},
	LobbyList = ListHelper_SetupDataSource( "LobbyList", function ( controller )
		local lobbyMembers = {}
		local lobbySort = function ( a, b )
			if a.team < b.team then
				return true
			elseif a.team == b.team and Engine.CompareUInt64( a.lobbyID, b.lobbyID, "<" ) then
				return true
			else
				return false
			end
		end
		
		local lobbyRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local lobbyListModel = Engine.CreateModel( lobbyRootModel, "lobbyList" )
		local playerCountModel = Engine.CreateModel( lobbyListModel, "playerCount" )
		local maxPlayersModel = Engine.CreateModel( lobbyListModel, "maxPlayers" )
		local maxClientCount = 0
		local gameLobbyActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
		if gameLobbyActive then
			maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
		else
			maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		end
		local lobbyModule = Enum.LobbyModule.LOBBY_MODULE_CLIENT
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
		end
		local lobbyListPrivate = Engine.LobbyGetSessionClients( lobbyModule, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local lobbyListGame = Engine.LobbyGetSessionClients( lobbyModule, Enum.LobbyType.LOBBY_TYPE_GAME )
		if lobbyListPrivate ~= nil and #lobbyListPrivate.sessionClients > 1 and gameLobbyActive == false then
			local lastMember = nil
			for iPrivate, cPrivate in ipairs( lobbyListPrivate.sessionClients ) do
				lobbyListPrivate.sessionClients[iPrivate].isMember = 1
				lobbyListPrivate.sessionClients[iPrivate].isMemberLeader = cPrivate.isLeader
				lobbyListPrivate.sessionClients[iPrivate].isOtherMember = 0
				lobbyListPrivate.sessionClients[iPrivate].isMemberTopOrMiddle = 1
				lastMember = lobbyListPrivate.sessionClients[iPrivate]
			end
			if lastMember ~= nil then
				lastMember.isMemberTopOrMiddle = 0
			end
		elseif gameLobbyActive == true and lobbyListPrivate ~= nil and lobbyListGame ~= nil then
			for iGame, cGame in ipairs( lobbyListGame.sessionClients ) do
				local f105_local7 = false
				lobbyListGame.sessionClients[iGame].isMember = 0
				lobbyListGame.sessionClients[iGame].isMemberLeader = 0
				lobbyListGame.sessionClients[iGame].isOtherMember = 0
				lobbyListGame.sessionClients[iGame].isMemberTopOrMiddle = 0
				lobbyListGame.sessionClients[iGame].isOtherMemberTopOrMiddle = 0
				if #lobbyListPrivate.sessionClients > 1 then
					for iPrivate, cPrivate in ipairs( lobbyListPrivate.sessionClients ) do
						if Engine.CompareUInt64( cGame.xuid, cPrivate.xuid, "=" ) then
							lobbyListGame.sessionClients[iGame].isMember = 1
							lobbyListGame.sessionClients[iGame].isMemberLeader = cPrivate.isLeader
							f105_local7 = true
							break
						end
					end
				end
				if f105_local7 == false then
					local otherPartyCount = 0
					for jGame, bGame in ipairs( lobbyListGame.sessionClients ) do
						if cGame.simpleLobbyID == lobbyListGame.sessionClients[jGame].simpleLobbyID then
							otherPartyCount = otherPartyCount + 1
						end
					end
					if otherPartyCount > 1 then
						lobbyListGame.sessionClients[iGame].isOtherMember = 1
					end
				end
			end
			table.sort( lobbyListGame.sessionClients, lobbySort )
			local previousMember, f105_local0 = nil
			for iGame, f105_local4 in ipairs( lobbyListGame.sessionClients ) do
				if previousMember ~= nil and f105_local0 == f105_local4.simpleLobbyID then
					if f105_local4.isMember == 1 or f105_local4.isMemberLeader and f105_local4.isMemberLeader ~= 0 then
						previousMember.isMemberTopOrMiddle = 1
					elseif f105_local4.isOtherMember == 1 then
						previousMember.isOtherMemberTopOrMiddle = 1
					end
				end
				previousMember = f105_local4
				f105_local0 = f105_local4.simpleLobbyID
			end
		end
		local sessionClientsList = lobbyListPrivate.sessionClients
		if gameLobbyActive then
			sessionClientsList = lobbyListGame.sessionClients
		end
		Engine.SetModelValue( playerCountModel, #sessionClientsList )
		Engine.SetModelValue( maxPlayersModel, maxClientCount )
		for index, cPrivate in ipairs( sessionClientsList ) do
			local f105_local9 = 1
			if cPrivate.rankIcon == nil then
				f105_local9 = 0
			end
			cPrivate.displayRank = ""
			if cPrivate.rank then
				cPrivate.displayRank = Engine.GetRankDisplayLevel( cPrivate.rank )
			end
			local rankFullNameColumn = 5
			local rankTitle = Engine.TableLookup( cPrivate.localController, CoD.rankTable, CoD.XPBar.RankDisplayLevelCol, cPrivate.displayRank, rankFullNameColumn )
			local team = cPrivate.team
			if not team then
				team = 0
			end
			if not cPrivate.isMemberLeader or cPrivate.isMemberLeader == 0 or #sessionClientsList <= 1 or not 1 then
				local isMemberLeader = 0
			end
			if cPrivate.isMember and cPrivate.isMember ~= 0 and #sessionClientsList > 1 then
				local bGame = 1
				if not bGame then
				
				else
					if cPrivate.isOtherMember then
						local f105_local10 = cPrivate.isOtherMember
						local f105_local11 = 1
					end
					local isOtherMember = 0
					local f105_local12 = f105_local10 and f105_local11 or isOtherMember
					local activity = Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
					if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL or Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
						local cPrivate = 0
						cPrivate.isMember = 0
						cPrivate.isOtherMember = 0
					end
					table.insert( lobbyMembers, {
						models = {
							xuid = cPrivate.xuid,
							gamertag = cPrivate.gamertag,
							lobbyID = cPrivate.lobbyID,
							rankShown = f105_local9,
							rank = cPrivate.displayRank,
							rankIcon = cPrivate.rankIcon,
							rankString = rankTitle,
							score = cPrivate.score,
							isHost = cPrivate.isHost,
							isLeader = cPrivate.isLeader,
							isLocal = cPrivate.isLocal,
							controllerNum = cPrivate.localController,
							isJoinable = 0,
							isMemberLeader = cPrivate,
							isMember = bGame,
							team = team,
							teamColor = CoD.GetTeamFactionColor( team ),
							teamAlpha = 0.25,
							teamSwitch = team,
							voipStatus = cPrivate.VOIPStatus,
							activity = activity,
							bgb1ItemIndex = cPrivate.bgb1ItemIndex,
							bgb2ItemIndex = cPrivate.bgb2ItemIndex,
							bgb3ItemIndex = cPrivate.bgb3ItemIndex,
							bgb4ItemIndex = cPrivate.bgb4ItemIndex,
							bgb5ItemIndex = cPrivate.bgb5ItemIndex
						},
						properties = {
							xuid = cPrivate.xuid,
							isSelf = cPrivate.isLocal == 1,
							isPartyMember = cPrivate.isMember == 1,
							isPartyMemberTopOrMiddle = cPrivate.isMemberTopOrMiddle == 1,
							isOtherMember = cPrivate.isOtherMember == 1,
							isOtherMemberTopOrMiddle = cPrivate.isOtherMemberTopOrMiddle == 1
						}
					} )
				end
			end
			local isMember = 0
		end
		return lobbyMembers
	end
	, nil, nil, function ( controller, list, listModel )
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local gameClient = Engine.GetModel( lobbyRootModel, "gameClient" )
		local gameClientUpdateModel = Engine.GetModel( gameClient, "update" )
		local lobbyNavModel = Engine.GetModel( lobbyRootModel, "lobbyNav" )
		if list.gameClientUpdateSubscription then
			list:removeSubscription( list.gameClientUpdateSubscription )
		end
		list.gameClientUpdateSubscription = list:subscribeToModel( gameClientUpdateModel, function ()
			RefreshListFindSelectedXuid( controller, list )
		end, false )
		local privateClient = Engine.GetModel( lobbyRootModel, "privateClient" )
		local privateClientUpdateModel = Engine.GetModel( privateClient, "update" )
		if list.privateClientUpdateSubscription then
			list:removeSubscription( list.privateClientUpdateSubscription )
		end
		list.privateClientUpdateSubscription = list:subscribeToModel( privateClientUpdateModel, function ()
			RefreshListFindSelectedXuid( controller, list )
		end, false )
		if list.lobbyNavSubscription then
			list:removeSubscription( list.lobbyNavSubscription )
		end
		list.lobbyNavSubscription = list:subscribeToModel( lobbyNavModel, function ()
			RefreshListFindSelectedXuid( controller, list )
		end, false )
	end
	 ),
	LobbyPrivateHostMembers = {
		prepare = function ( controller, list, filter )
			local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			list.baseModel = Engine.GetModel( lobbyRootModel, "privateHost" )
			list.countModel = Engine.GetModel( list.baseModel, "count" )
			list.updateModel = Engine.GetModel( list.baseModel, "update" )
			if list.countSubscription then
				list:removeSubscription( list.countSubscription )
			end
			list.countSubscription = list:subscribeToModel( list.countModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return Engine.GetModelValue( list.countModel )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.baseModel, "member" .. index - 1 )
		end
	},
	LobbyPrivateClientMembers = {
		prepare = function ( controller, list, filter )
			local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			list.baseModel = Engine.GetModel( lobbyRootModel, "privateClient" )
			list.countModel = Engine.GetModel( list.baseModel, "count" )
			list.updateModel = Engine.GetModel( list.baseModel, "update" )
			if list.countSubscription then
				list:removeSubscription( list.countSubscription )
			end
			list.countSubscription = list:subscribeToModel( list.countModel, function ()
				if not list.preparing then
					list:updateDataSource()
				end
			end, false )
		end,
		getCount = function ( list )
			return Engine.GetModelValue( list.countModel )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.baseModel, "member" .. index - 1 )
		end
	},
	LobbyGameHostMembers = {
		prepare = function ( controller, list, filter )
			local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			list.baseModel = Engine.GetModel( lobbyRootModel, "gameHost" )
			list.countModel = Engine.GetModel( list.baseModel, "count" )
			list.updateModel = Engine.GetModel( list.baseModel, "update" )
			if list.countSubscription then
				list:removeSubscription( list.countSubscription )
			end
			list.countSubscription = list:subscribeToModel( list.countModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return Engine.GetModelValue( list.countModel )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.baseModel, "member" .. index - 1 )
		end
	},
	LobbyGameClientMembers = {
		prepare = function ( controller, list, filter )
			local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			list.baseModel = Engine.GetModel( lobbyRootModel, "gameClient" )
			list.countModel = Engine.GetModel( list.baseModel, "count" )
			list.updateModel = Engine.GetModel( list.baseModel, "update" )
			if list.countSubscription then
				list:removeSubscription( list.countSubscription )
			end
			list.countSubscription = list:subscribeToModel( list.countModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return Engine.GetModelValue( list.countModel )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.baseModel, "member" .. index - 1 )
		end
	},
	LobbyButtons = ListHelper_SetupDataSource( "LobbyButtons", function ( controller )
		local buttons = {}
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local lobbyNavModel = Engine.GetModel( lobbyRootModel, "lobbyNav" )
		local lobbyNav = Engine.GetModelValue( lobbyNavModel )
		local buttonOptions = CoD.LobbyMenus.AddButtonsForTarget( controller, lobbyNav )
		local anyButtonEnabled = false
		for index, buttonData in ipairs( buttonOptions ) do
			table.insert( buttons, {
				models = {
					displayText = Engine.Localize( buttonData.optionDisplay ),
					customId = buttonData.customId
				},
				properties = {
					disabled = buttonData.disabled,
					action = buttonData.action,
					actionParam = buttonData.param,
					isLastButtonInGroup = buttonData.isLastButtonInGroup,
					selectIndex = buttonData.selected
				}
			} )
			if buttonData.disabled ~= true then
				anyButtonEnabled = true
			end
		end
		if not anyButtonEnabled then
			table.insert( buttons, {
				models = {
					displayText = ""
				},
				properties = {
					disabled = false,
					fake = true
				}
			} )
		end
		return buttons
	end
	, nil, nil, function ( controller, list, listModel )
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local lobbyNavModel = Engine.GetModel( lobbyRootModel, "lobbyNav" )
		if list.lobbyNavSubscription then
			list:removeSubscription( list.lobbyNavSubscription )
		end
		list.lobbyNavSubscription = list:subscribeToModel( lobbyNavModel, function ()
			list:clearSavedActiveIndex()
			list:clearSavedState()
			list:updateDataSource( true, false )
			if list then
				if list:getParent() then
					local f129_local0 = list:getParent()
					if f129_local0:getParent() then
						f129_local0 = list:getParent()
						f129_local0 = f129_local0:getParent()
						if f129_local0:getParent() then
							f129_local0 = IsMenuInState
							local f129_local1 = list:getParent()
							f129_local1 = f129_local1:getParent()
							if not f129_local0( f129_local1:getParent(), "Right" ) then
							
							else
								
							end
						end
					end
				end
				list:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			end
		end, false )
		local lobbyNetworkModelMode = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
		if list.networkModeSub then
			list:removeSubscription( list.networkModeSub )
		end
		list.networkModeSub = list:subscribeToModel( lobbyNetworkModelMode, function ()
			list:updateDataSource()
		end, false )
		local timerActiveModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
		if list.timerActiveSubscription then
			list:removeSubscription( list.timerActiveSubscription )
		end
		list.timerActiveSubscription = list:subscribeToModel( timerActiveModel, function ()
			list:updateDataSource()
		end, false )
		local lobbyHostModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.isHost" )
		if list.lobbyHostSub then
			list:removeSubscription( list.lobbyHostSub )
		end
		list.lobbyHostSub = list:subscribeToModel( lobbyHostModel, function ()
			list:updateDataSource()
		end, false )
		local lobbyGameHostModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.isHost" )
		if list.lobbyGameHostSub then
			list:removeSubscription( list.lobbyGameHostSub )
		end
		list.lobbyGameHostSub = list:subscribeToModel( lobbyGameHostModel, function ()
			list:updateDataSource()
		end, false )
		local theaterDataDownloadedModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" )
		if list.theaterDataDownloadedSub then
			list:removeSubscription( list.theaterDataDownloadedSub )
		end
		list.theaterDataDownloadedSub = list:subscribeToModel( theaterDataDownloadedModel, function ()
			list:updateDataSource()
		end, false )
		local updateButtonsModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" )
		if list.updateButtonsModelSub then
			list:removeSubscription( list.updateButtonsModelSub )
		end
		list.updateButtonsModelSub = list:subscribeToModel( updateButtonsModel, function ()
			local isCodcasterNow = IsCodCaster( controller )
			if list.wasCodCaster == nil or isCodcasterNow ~= list.wasCodCaster then
				list.wasCodCaster = isCodcasterNow
				list:updateDataSource()
			else
				local newTeamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
				if list.oldTeamAssignment == nil or list.oldTeamAssignment ~= newTeamAssignment then
					list.oldTeamAssignment = newTeamAssignment
					list:updateDataSource()
				end
			end
		end, false )
	end
	, function ( list, row, widgetHeight )
		if list.LobbyButtons[row].properties.isLastButtonInGroup then
			return 9
		else
			
		end
	end
	 ),
	SocialPlayerInfo = {
		getModel = function ( controller )
			local controllerModel = Engine.GetModelForController( controller )
			local playerInfoModel = Engine.CreateModel( controllerModel, "socialPlayerInfo" )
			local controllerModel = Engine.GetModelForController( controller )
			local selectedFriendModel = Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" )
			local xuid = Engine.GetModelValue( selectedFriendModel, "xuid" )
			local selectedFriendGamertagModel = Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" )
			local gamertag = Engine.GetModelValue( selectedFriendGamertagModel )
			local playerInfo = Engine.GetPlayerInfo( controller, xuid )
			if playerInfo ~= nil then
				local cpPlayed = false
				local mpPlayed = false
				local zmPlayed = false
				if LuaUtils.IsBetaBuild() then
					cpPlayed = false
					playerInfo.info.cp.rank = 0
					playerInfo.info.cp.prestige = 0
					mpPlayed = true
					zmPlayed = false
					playerInfo.info.zm.rank = 0
					playerInfo.info.zm.prestige = 0
				end
				local cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", cpPlayed, playerInfo.info.cp.rank, playerInfo.info.cp.prestige )
				local mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", mpPlayed, playerInfo.info.mp.rank, playerInfo.info.mp.prestige )
				local zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", zmPlayed, playerInfo.info.zm.rank, playerInfo.info.zm.prestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "xuid" ), playerInfo.info.xuid )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpRank" ), playerInfo.info.cp.rank )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpRankIcon" ), cpRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpPrestige" ), playerInfo.info.cp.prestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpRank" ), playerInfo.info.mp.rank )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpRankIcon" ), mpRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpPrestige" ), playerInfo.info.mp.prestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmRank" ), playerInfo.info.zm.rank )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmRankIcon" ), zmRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmPrestige" ), playerInfo.info.zm.prestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "gamertag" ), playerInfo.info.gamertag )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "clantag" ), "" )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "presence" ), playerInfo.info.presence )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "joinable" ), playerInfo.info.joinable )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "inGameLobby" ), playerInfo.info.inGameLobby )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "inPrivateLobby" ), playerInfo.info.inPrivateLobby )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "isSelf" ), playerInfo.info.isSelf )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "isLocal" ), playerInfo.info.isLocal )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "activity" ), playerInfo.info.activity )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "context" ), playerInfo.info.context )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "gametype" ), playerInfo.info.gametype )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mapid" ), playerInfo.info.mapid )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "difficulty" ), playerInfo.info.difficulty )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "playlist" ), playerInfo.info.playlist )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "isFriend" ), playerInfo.info.isFriend )
			end
			return playerInfoModel
		end
	},
	PregameGlobal = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
			local timeLeftModel = Engine.CreateModel( model, "timeleft" )
			Engine.SetModelValue( timeLeftModel, "" )
			local statusModel = Engine.CreateModel( model, "status" )
			Engine.SetModelValue( statusModel, "" )
			return model
		end
	},
	Pregame = {
		getModel = function ( controller )
			local pregameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
			local remaininigVotesModel = Engine.CreateModel( pregameModel, "remainingVotes" )
			Engine.SetModelValue( remaininigVotesModel, 0 )
			return pregameModel
		end
	},
	PregameItemVoteTabs = ListHelper_SetupDataSource( "PregameItemVoteTabs", function ( controller )
		local tabs = {}
		local filters = CoD.CACUtility.PregameLoadoutFilters
		table.insert( tabs, {
			models = {
				index = -1,
				tabIcon = CoD.buttonStrings.shoulderl
			}
		} )
		for index, filter in pairs( filters ) do
			table.insert( tabs, {
				models = {
					tabName = filter.title,
					index = index
				},
				properties = {}
			} )
		end
		table.insert( tabs, {
			models = {
				index = -1,
				tabIcon = CoD.buttonStrings.shoulderr
			}
		} )
		return tabs
	end
	 ),
	PregameRestrictedItems = ListHelper_SetupDataSource( "PregameRestrictedItems", function ( controller )
		if DataSources.PregameRestrictedItems.cachedItems ~= nil then
			return DataSources.PregameRestrictedItems.cachedItems
		end
		local attachments = {}
		for attachmentIndex = 0, 43, 1 do
			local attachment = {
				index = attachmentIndex,
				attachmentIndex = attachmentIndex,
				name = Engine.GetAttachmentNameByIndex( attachmentIndex ),
				image = Engine.GetAttachmentImageByIndex( attachmentIndex ),
				loadoutSlot = "attachment",
				isOptic = Engine.IsOpticByAttachmentIndex( attachmentIndex ),
				items = {},
				bannedGroups = {}
			}
			for groupIndex, group in pairs( CoD.CACUtility.PrimaryWeaponGroupNames ) do
				attachment.bannedGroups[group.index] = false
			end
			for groupIndex, group in pairs( CoD.CACUtility.SecondaryWeaponGroupNames ) do
				attachment.bannedGroups[group.index] = false
			end
			attachments[attachmentIndex] = attachment
		end
		local attachmentIndex = {}
		for itemIndex = 0, 255, 1 do
			if Engine.ItemIndexValid( itemIndex ) then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				local itemVoteEnabled = true
				if LuaUtils.IsGamescomBuild() then
					itemVoteEnabled = itemInfo.unlockLevel == 0
				end
				if itemInfo.allocation >= 0 and itemVoteEnabled == true then
					local item = {
						index = itemIndex,
						name = itemInfo.name,
						image = itemInfo.image,
						groupIndex = itemInfo.groupIndex,
						groupName = itemInfo.group,
						loadoutSlot = itemInfo.loadoutSlot,
						loadoutSlotIndex = itemInfo.loadoutSlotIndex,
						unlockLevel = itemInfo.unlockLevel,
						momentum = itemInfo.momentum
					}
					if LuaUtils.StartsWith( item.loadoutSlot, "hero" ) or item.loadoutSlot == "specialgadget" then
						item.image = itemInfo.image .. "_large"
					end
					if LuaUtils.StartsWith( item.loadoutSlot, "killstreak" ) then
						item.image = itemInfo.image .. "_menu"
					end
					if item.loadoutSlot == "primary" or item.loadoutSlot == "secondary" then
						local attachmentCount = Engine.GetNumAttachments( itemIndex )
						if attachmentCount > 0 then
							item.attachments = {}
							for attachmentIndex = 0, attachmentCount - 1, 1 do
								local attachment = Engine.GetItemAttachment( itemIndex, attachmentIndex )
								if not (attachments[attachment].bannedGroups[item.groupIndex] == true) then
									local attachmentVoteEnabled = true
									if attachmentVoteEnabled and attachment > CoD.CACUtility.EmptyItemIndex then
										item.attachments[attachment] = attachment
										table.insert( attachments[attachment].items, {
											itemIndex = itemIndex
										} )
									end
								end
							end
						end
					end
					attachmentIndex[itemIndex] = item
				end
			end
		end
		local result = {}
		local attachmentSort = function ( a, b )
			if attachments[a].isOptic and attachments[b].isOptic then
				return Engine.Localize( attachments[a].name ) < Engine.Localize( attachments[b].name )
			elseif attachments[a].isOptic ~= attachments[b].isOptic then
				return attachments[a].isOptic
			else
				return Engine.Localize( attachments[a].name ) < Engine.Localize( attachments[b].name )
			end
		end
		
		for attachmentIndex, f141_local4 in LUI.IterateTableBySortedKeys( attachments, attachmentSort, nil ) do
			if #f141_local4.items > 0 then
				table.insert( result, {
					models = {
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT,
						attachmentIndex = f141_local4.index,
						name = f141_local4.name,
						image = f141_local4.image,
						loadoutSlot = "attachment"
					},
					properties = {
						attachment = {}
					}
				} )
			end
		end
		f141_local5 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		local itemSort = function ( a, b )
			if LuaUtils.StartsWith( attachmentIndex[a].loadoutSlot, "hero" ) or attachmentIndex[a].loadoutSlot == "specialgadget" or LuaUtils.StartsWith( attachmentIndex[b].loadoutSlot, "hero" ) or attachmentIndex[b].loadoutSlot == "specialgadget" then
				local heroIndexA = -1
				local heroLoadoutTypeA = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				local heroIndexB = -1
				local heroLoadoutTypeB = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				for heroIndex, hero in ipairs( f141_local5 ) do
					local weapon = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), heroIndex - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					local ability = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), heroIndex - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					if attachmentIndex[a].index == weapon then
						heroIndexA = heroIndex
						heroLoadoutTypeA = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					elseif attachmentIndex[a].index == ability then
						heroIndexA = heroIndex
						heroLoadoutTypeA = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
					if attachmentIndex[b].index == weapon then
						heroIndexB = heroIndex
						heroLoadoutTypeB = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					end
					if attachmentIndex[b].index == ability then
						heroIndexB = heroIndex
						heroLoadoutTypeB = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
				end
				if heroIndexA == heroIndexB then
					return heroLoadoutTypeA < heroLoadoutTypeB
				end
				return heroIndexA < heroIndexB
			elseif LUI.startswith( attachmentIndex[a].loadoutSlot, "killstreak" ) or LUI.startswith( attachmentIndex[b].loadoutSlot, "killstreak" ) then
				return attachmentIndex[a].momentum < attachmentIndex[b].momentum
			elseif attachmentIndex[a].groupIndex ~= attachmentIndex[b].groupIndex then
				return attachmentIndex[a].groupIndex < attachmentIndex[b].groupIndex
			elseif attachmentIndex[a].loadoutSlot == attachmentIndex[b].loadoutSlot then
				return Engine.Localize( attachmentIndex[a].name ) < Engine.Localize( attachmentIndex[b].name )
			else
				return Engine.Localize( attachmentIndex[a].loadoutSlot ) < Engine.Localize( attachmentIndex[b].loadoutSlot )
			end
		end
		
		for itemIndex, group in LUI.IterateTableBySortedKeys( attachmentIndex, itemSort, nil ) do
			table.insert( result, {
				models = {
					itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
					itemIndex = group.index,
					name = group.name,
					image = group.image,
					loadoutSlot = group.loadoutSlot,
					groupName = group.groupName
				},
				properties = {
					item = {
						index = group.index
					}
				}
			} )
		end
		DataSources.PregameRestrictedItems.cachedItems = result
		return result
	end
	 ),
	PregameItemVotes = ListHelper_SetupDataSource( "PregameItemVotes", function ( controller )
		local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local clients = session.sessionClients
		local posSort = function ( a, b )
			return a.pregamePosition < b.pregamePosition
		end
		
		table.sort( clients, posSort )
		local result = {}
		for index, client in ipairs( clients ) do
			if client.voteCount > 0 then
				for voteIndex, vote in ipairs( client.votes ) do
					local f144_local6 = ""
					local f144_local7 = ""
					local f144_local8 = ""
					if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
						local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
						f144_local6 = itemInfo.name
						f144_local7 = itemInfo.image
						if LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) or itemInfo.loadoutSlot == "specialgadget" then
							f144_local7 = itemInfo.image .. "_large"
						end
						if LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) then
							f144_local7 = itemInfo.image .. "_menu"
						end
					elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
						f144_local6 = Engine.GetAttachmentNameByIndex( vote.attachmentIndex )
						f144_local7 = Engine.GetAttachmentImageByIndex( vote.attachmentIndex )
					elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
						f144_local6 = Engine.GetAttachmentNameByIndex( vote.attachmentIndex )
						f144_local7 = Engine.GetAttachmentImageByIndex( vote.attachmentIndex )
						local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
						f144_local8 = itemInfo.name
					elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
						f144_local8 = itemInfo.group
					else
						error( "Item vote updated with invalid vote type" )
					end
					table.insert( result, {
						models = {
							name = f144_local6,
							image = f144_local7,
							headerName = f144_local8,
							hintText = client.gamertag,
							itemType = vote.itemType,
							itemIndex = vote.itemIndex,
							attachmentIndex = vote.attachmentIndex,
							groupIndex = vote.groupIndex
						},
						properties = {
							globalVoteIndex = vote.globalVoteIndex
						}
					} )
				end
			end
		end
		local globalVoteIndexSort = function ( a, b )
			return a.properties.globalVoteIndex < b.properties.globalVoteIndex
		end
		
		table.sort( result, globalVoteIndexSort )
		return result
	end
	, nil, nil, function ( controller, list, listModel )
		local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if list.pregameUpdateSubscription then
			list:removeSubscription( list.pregameUpdateSubscription )
		end
		list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
			list:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameBannedItems = ListHelper_SetupDataSource( "PregameBannedItems", function ( controller )
		local equippedItems = {}
		local equippedAttachments = {}
		local equippedItemAttachments = {}
		local AddItems = function ( itemsTable )
			for slot, itemIndex in pairs( itemsTable ) do
				if not equippedItems[itemIndex] then
					equippedItems[itemIndex] = true
				end
			end
		end
		
		local AddAttachments = function ( weaponIndex, attachments )
			for attachmentIndex, attachment in ipairs( attachments ) do
				if not equippedAttachments[attachment] then
					equippedAttachments[attachment] = true
				end
				if not equippedItemAttachments[weaponIndex] then
					equippedItemAttachments[weaponIndex] = {}
				end
				if not equippedItemAttachments[weaponIndex][attachment] then
					equippedItemAttachments[weaponIndex][attachment] = true
				end
			end
		end
		
		local loadout = CoD.CACUtility.GetFullLoadout( controller )
		for classIndex, class in ipairs( loadout.classes ) do
			AddItems( class.weapons )
			AddItems( class.equipment )
			AddItems( class.perks )
			AddItems( class.wildcards )
			if class.weapons.primary ~= nil then
				AddAttachments( class.weapons.primary, class.primaryAttachments )
			end
			if class.weapons.secondary ~= nil then
				AddAttachments( class.weapons.secondary, class.secondaryAttachments )
			end
		end
		f149_local0 = {}
		f149_local1 = {}
		local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local clients = session.sessionClients
		for index, client in ipairs( clients ) do
			if client.voteCount > 0 then
				for voteIndex, vote in ipairs( client.votes ) do
					if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
						if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
							local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
							if not LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) then
								table.insert( f149_local0, {
									name = itemInfo.name,
									image = itemInfo.image,
									hintText = client.gamertag,
									groupIndex = itemInfo.groupIndex,
									loadoutSlot = itemInfo.loadoutSlot,
									loadoutSlotIndex = itemInfo.loadoutSlotIndex,
									equipped = equippedItems and equippedItems[vote.itemIndex] == true
								} )
							end
						end
						if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
							table.insert( f149_local1, {
								name = Engine.GetAttachmentNameByIndex( vote.attachmentIndex ),
								image = Engine.GetAttachmentImageByIndex( vote.attachmentIndex ),
								isOptic = Engine.IsOpticByAttachmentIndex( vote.attachmentIndex ),
								hintText = client.gamertag,
								equipped = equippedAttachments and equippedAttachments[vote.attachmentIndex] == true
							} )
						end
						if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
							
						end
						if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
							
						else
							error( "PregameBannedItems: Unknown vote item type" )
						end
					end
				end
			end
		end
		local attachmentSort = function ( a, b )
			if f149_local1[a].isOptic and f149_local1[b].isOptic then
				return Engine.Localize( f149_local1[a].name ) < Engine.Localize( f149_local1[b].name )
			elseif f149_local1[a].isOptic ~= f149_local1[b].isOptic then
				return f149_local1[a].isOptic
			else
				return Engine.Localize( f149_local1[a].name ) < Engine.Localize( f149_local1[b].name )
			end
		end
		
		local itemSort = function ( a, b )
			if f149_local0[a].groupIndex ~= f149_local0[b].groupIndex then
				return f149_local0[a].groupIndex < f149_local0[b].groupIndex
			elseif f149_local0[a].loadoutSlot == f149_local0[b].loadoutSlot then
				return Engine.Localize( f149_local0[a].name ) < Engine.Localize( f149_local0[b].name )
			else
				return Engine.Localize( f149_local0[a].loadoutSlot ) < Engine.Localize( f149_local0[b].loadoutSlot )
			end
		end
		
		local sortedBannedItemsAndAttachments = {}
		local attachmentsInserted = false
		for itemIndex, item in LUI.IterateTableBySortedKeys( f149_local0, itemSort, nil ) do
			if attachmentsInserted == false and item.loadoutSlotIndex > 50 then
				for attachmentIndex, attachment in LUI.IterateTableBySortedKeys( f149_local1, attachmentSort, nil ) do
					table.insert( sortedBannedItemsAndAttachments, {
						models = {
							name = attachment.name,
							image = attachment.image,
							hintText = attachment.hintText,
							equipped = attachment.equipped
						}
					} )
				end
				attachmentsInserted = true
			end
			table.insert( sortedBannedItemsAndAttachments, {
				models = {
					name = item.name,
					image = item.image,
					hintText = item.hintText,
					equipped = item.equipped
				}
			} )
		end
		if attachmentsInserted == false then
			for attachmentIndex, item in LUI.IterateTableBySortedKeys( f149_local1, attachmentSort, nil ) do
				table.insert( sortedBannedItemsAndAttachments, {
					models = {
						name = item.name,
						image = item.image,
						hintText = item.hintText,
						equipped = item.equipped
					}
				} )
			end
		end
		return sortedBannedItemsAndAttachments
	end
	, nil, nil, function ( controller, list, listModel )
		local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if list.pregameUpdateSubscription then
			list:removeSubscription( list.pregameUpdateSubscription )
		end
		list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
			list:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameBannedStreaks = ListHelper_SetupDataSource( "PregameAllBannedStreaks", function ( controller )
		local loadout = CoD.CACUtility.GetFullLoadout( controller )
		local equippedStreaks = {}
		for loadoutSlot, itemIndex in pairs( loadout.streaks ) do
			equippedStreaks[itemIndex] = true
		end
		local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local clients = session.sessionClients
		f156_local2 = {}
		for index, client in ipairs( clients ) do
			if client.voteCount > 0 then
				for voteIndex, vote in ipairs( client.votes ) do
					if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
						local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
						local f156_local7 = equippedStreaks and equippedStreaks[vote.itemIndex] == true
						if LUI.startswith( itemInfo.loadoutSlot, "killstreak" ) then
							table.insert( f156_local2, {
								name = itemInfo.name,
								image = itemInfo.image .. "_menu",
								momentum = itemInfo.momentum,
								gamertag = client.gamertag,
								equipped = f156_local7
							} )
						end
					end
				end
			end
		end
		local streakSort = function ( a, b )
			return f156_local2[a].momentum < f156_local2[b].momentum
		end
		
		local result = {}
		for index, f156_local5 in LUI.IterateTableBySortedKeys( f156_local2, streakSort, nil ) do
			table.insert( result, {
				models = {
					name = f156_local5.name,
					image = f156_local5.image,
					hintText = f156_local5.gamertag,
					equipped = f156_local5.equipped
				}
			} )
		end
		return result
	end
	, nil, nil, function ( controller, list, listModel )
		local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if list.pregameUpdateSubscription then
			list:removeSubscription( list.pregameUpdateSubscription )
		end
		list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
			list:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameClientList = ListHelper_SetupDataSource( "PregameClientList", function ( controller )
		local characterDraftClients = {}
		local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local clients = session.sessionClients
		local posSort = function ( a, b )
			return a.pregamePosition < b.pregamePosition
		end
		
		table.sort( clients, posSort )
		for index, client in ipairs( clients ) do
			local characterIndex = client.characterDraft.characterIndex
			local loadout = client.characterDraft.loadout
			local characterName = Engine.GetHeroName( Engine.CurrentSessionMode(), characterIndex )
			local characterLoadoutInfo = Engine.GetLoadoutInfoForHero( Engine.CurrentSessionMode(), characterIndex, loadout )
			local f160_local3 = ""
			if characterLoadoutInfo then
				f160_local3 = characterLoadoutInfo.itemName
			end
			table.insert( characterDraftClients, {
				models = {
					xuid = client.xuid,
					gamertag = client.gamertag,
					clantag = "",
					rank = client.competitiveRank,
					rankIcon = client.competitiveRankIcon,
					prestige = client.prestige,
					team = client.team,
					teamString = tostring( client.team ),
					groupId = client.simpleGroupID,
					isHost = client.isHost,
					isLeader = client.isLeader,
					clientState = client.pregameState,
					position = client.pregamePosition,
					voteCount = client.voteCount,
					characterIndex = client.characterDraft.characterIndex,
					characterName = characterName,
					characterLoadout = client.characterDraft.loadout,
					characterLoadoutName = f160_local3
				},
				properties = {}
			} )
		end
		return characterDraftClients
	end
	, nil, nil, function ( controller, list, listModel )
		local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if list.pregameUpdateSubscription then
			list:removeSubscription( list.pregameUpdateSubscription )
		end
		list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
			list:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameBannedContentButtons = ListHelper_SetupDataSource( "PregameBannedContentButtons", function ( controller )
		local buttonOptions = {}
		local GoBackNotify = function ( self, element, controller, param, menu )
			Engine.SendPregameEditComplete( controller )
			GoBack( self, element, controller, param, menu )
		end
		
		if ItemRestrictionCACEditActive() then
			table.insert( buttonOptions, {
				text = "MENU_EDIT_CAC_CAPS",
				id = "editCaC",
				disabled = false,
				action = OpenCAC,
				params = {
					controller = controller
				}
			} )
			table.insert( buttonOptions, {
				text = "MENU_DONE_CAPS",
				id = "cancel",
				disabled = false,
				action = GoBackNotify,
				params = {
					controller = controller
				}
			} )
		elseif ItemRestrictionScorestreakEditActive() then
			table.insert( buttonOptions, {
				text = "MENU_EDIT_SCORESTREAKS_CAPS",
				id = "editStreaks",
				disabled = false,
				action = OpenScorestreaks,
				params = {
					controller = controller
				}
			} )
			table.insert( buttonOptions, {
				text = "MENU_DONE_CAPS",
				id = "cancel",
				disabled = false,
				action = GoBackNotify,
				params = {
					controller = controller
				}
			} )
		end
		local buttons = {}
		for index, buttonData in ipairs( buttonOptions ) do
			table.insert( buttons, {
				models = {
					displayText = Engine.Localize( buttonData.text ),
					customId = buttonData.customId
				},
				properties = {
					disabled = buttonData.disabled,
					action = buttonData.action,
					actionParam = buttonData.params
				}
			} )
		end
		return buttons
	end
	 ),
	SocialPlayerDetailsButtons = ListHelper_SetupDataSource( "SocialPlayerDetailsButtons", function ( controller )
		local buttonOptions = {}
		local controllerModel = Engine.GetModelForController( controller )
		local selectedXuid = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" ) )
		local selectedGamertag = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" ) )
		local controllerXuid = Engine.GetXUID64( controller )
		local selectedSelf = Engine.CompareUInt64( selectedXuid, controllerXuid, "=" )
		local selectedPlayerInTitle = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendInTitle" ) )
		if selectedXuid == nil then
			return buttonOptions
		end
		local playerInfo = Engine.GetPlayerInfo( controller, selectedXuid )
		if selectedSelf == false then
			if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, selectedXuid ) then
				if Engine.IsLeader( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
					table.insert( buttonOptions, {
						text = "MENU_PROMOTE_TO_PARTY_LEADER",
						id = "promoteToLeader",
						disabled = true,
						action = PromoteToLeader,
						params = {
							controller = controller,
							xuid = selectedXuid
						},
						lastInGroup = false
					} )
					table.insert( buttonOptions, {
						text = "MENU_REMOVE_FROM_PARTY",
						id = "removeFromParty",
						disabled = true,
						action = DisconnectClient,
						params = {
							controller = controller,
							xuid = selectedXuid
						},
						lastInGroup = true
					} )
				end
			elseif selectedPlayerInTitle == true then
				local isFriend = Engine.IsFriendFromXUID( controller, selectedXuid )
				if playerInfo.info.joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or isFriend and playerInfo.info.joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
					if playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP or playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP or playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_IN_SAFEHOUSE or playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_IN_SAFEHOUSE or playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_IN_LOBBY or playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP or playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_IN_LOBBY or playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND or playerInfo.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_IN_LOBBY then
						if isFriend then
							table.insert( buttonOptions, {
								text = "MENU_JOIN_GAME",
								id = "joinGame",
								disabled = false,
								action = SocialJoin,
								params = {
									controller = controller,
									xuid = selectedXuid,
									joinType = Enum.JoinType.JOIN_TYPE_FRIEND,
									goBack = true
								},
								lastInGroup = true
							} )
						else
							table.insert( buttonOptions, {
								text = "MENU_JOIN_GAME",
								id = "joinGame",
								disabled = false,
								action = SocialJoin,
								params = {
									controller = controller,
									xuid = selectedXuid,
									joinType = Enum.JoinType.JOIN_TYPE_NORMAL,
									goBack = true
								},
								lastInGroup = true
							} )
						end
					elseif isFriend then
						table.insert( buttonOptions, {
							text = "MENU_JOIN_PARTY",
							id = "joinParty",
							disabled = false,
							action = SocialJoin,
							params = {
								controller = controller,
								xuid = selectedXuid,
								joinType = Enum.JoinType.JOIN_TYPE_FRIEND,
								goBack = true
							},
							lastInGroup = true
						} )
					else
						table.insert( buttonOptions, {
							text = "MENU_JOIN_PARTY",
							id = "joinParty",
							disabled = false,
							action = SocialJoin,
							params = {
								controller = controller,
								xuid = selectedXuid,
								joinType = Enum.JoinType.JOIN_TYPE_NORMAL,
								goBack = true
							},
							lastInGroup = true
						} )
					end
				end
			end
		end
		if playerInfo.info.hasEverPlayed == true then
			table.insert( buttonOptions, {
				text = "MENU_INSPECT_PLAYER",
				id = "inspectPlayer",
				disabled = true,
				action = nil,
				params = nil,
				lastInGroup = false
			} )
		end
		table.insert( buttonOptions, {
			text = "XBOXLIVE_VIEW_PROFILE",
			id = "platformProfile",
			disabled = false,
			action = OpenPlatformProfile,
			params = {
				controller = controller,
				gamertag = selectedGamertag,
				xuid = selectedXuid
			},
			lastInGroup = true
		} )
		if selectedSelf == false then
			local inPrivateLobby = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, selectedXuid )
			local inGameLobby = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, selectedXuid )
			local isMuted = Engine.IsPlayerMuted( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, selectedXuid )
			if inPrivateLobby == false and inGameLobby == false then
				if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
					table.insert( buttonOptions, {
						text = "MENU_INVITE_GAME",
						id = "inviteToGame",
						disabled = false,
						action = LobbyInviteFriendGoBack,
						params = {
							controller = controller,
							xuid = selectedXuid,
							gamertag = selectedGamertag
						},
						lastInGroup = false
					} )
				else
					table.insert( buttonOptions, {
						text = "MENU_INVITE_TO_PARTY",
						id = "invteToParty",
						disabled = false,
						action = LobbyInviteFriendGoBack,
						params = {
							controller = controller,
							xuid = selectedXuid,
							gamertag = selectedGamertag
						},
						lastInGroup = false
					} )
				end
			end
			if not LuaUtils.IsBetaBuild() then
				table.insert( buttonOptions, {
					text = "MENU_INVITE_TO_GROUP",
					id = "inviteToGroup",
					disabled = true,
					action = nil,
					params = nil,
					lastInGroup = false
				} )
			end
			if not Engine.IsFriendFromXUID( controller, selectedXuid ) then
				table.insert( buttonOptions, {
					text = "MENU_SEND_FRIEND_REQUEST",
					id = "sendFriendRequest",
					disabled = true,
					action = nil,
					params = nil,
					lastInGroup = false
				} )
			end
			table.insert( buttonOptions, {
				text = "MENU_REPORT_PLAYER",
				id = "reportPlayer",
				disabled = true,
				action = nil,
				params = nil,
				lastInGroup = false
			} )
			if inPrivateLobby or inGameLobby then
				if isMuted then
					table.insert( buttonOptions, {
						text = "MENU_UNMUTE_PLAYER",
						id = "unmutePlayer",
						disabled = false,
						action = UnMutePlayer,
						params = {
							controller = controller,
							xuid = selectedXuid
						},
						lastInGroup = false
					} )
				else
					table.insert( buttonOptions, {
						text = "MENU_MUTE_PLAYER",
						id = "mutePlayer",
						disabled = false,
						action = MutePlayer,
						params = {
							controller = controller,
							xuid = selectedXuid
						},
						lastInGroup = false
					} )
				end
			end
		end
		local buttons = {}
		for index, buttonData in ipairs( buttonOptions ) do
			table.insert( buttons, {
				models = {
					displayText = Engine.Localize( buttonData.text ),
					customId = buttonData.customId
				},
				properties = {
					disabled = buttonData.disabled,
					action = buttonData.action,
					actionParam = buttonData.params,
					isLastButtonInGroup = buttonData.lastInGroup
				}
			} )
		end
		return buttons
	end
	, nil, nil, function ( controller, list, listModel )
		
	end
	, function ( list, row, widgetHeight )
		if list.SocialPlayerDetailsButtons[row].properties.isLastButtonInGroup then
			return 9
		else
			
		end
	end
	 ),
	LobbySelectionListSelectMode = {
		prepare = function ( controller, list, filter )
			list.options = {}
			local options = {}
			CoD.LobbyMenus.AddButtons( controller, "privateClient.isHost", options, CoD.LobbyMenus.ModeSelect, CoD.LobbyMenus.ModeSelect )
			local menuModel = Engine.CreateModel( Engine.GetGlobalModel(), "LobbySelectModeSelectionModel" )
			for index, buttonData in ipairs( options ) do
				local buttonModel = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				list.options[index] = buttonData
				list.options[index].model = buttonModel
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( buttonData.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "customId" ), buttonData.customId )
				list.options[index].action = buttonData.action
				list.options[index].actionParam = buttonData.param
			end
		end,
		getCount = function ( list )
			return #list.options
		end,
		getItem = function ( controller, list, index )
			return list.options[index].model
		end,
		getSpacerAfterRow = function ( list, row, widgetHeight )
			if list.options[row] and list.options[row] then
				local buttonData = list.options[row]
				if buttonData.isLastButtonInGroup then
					return 9
				else
					return 0
				end
			else
				return 7
			end
		end,
		getWidgetTypeForItem = function ( list, dataItemModel, row )
			return CoD.List1ButtonLarge_PH
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.options[index]
		end
	},
	SpinnerMessage = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "spinnerModel" )
			Engine.CreateModel( model, "spinnerMessage" )
			return model
		end
	},
	FeaturedCardsRoot = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" )
			return model
		end
	},
	NetworkImage = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "NetworkImage" )
			return model
		end
	},
	FeaturedCards = ListHelper_SetupDataSource( "FeaturedCards", function ( controller )
		local list = {}
		local cardsData = Engine.GetFeaturedCardsData()
		if cardsData ~= nil then
			local count = cardsData.cardsCountToShow
			local enabled = cardsData.enabled
			if enabled == true and count > 0 then
				local sequence = 0
				for index = 0, count - 1, 1 do
					local card = Engine.GetFeaturedCard( index )
					if card.valid == true then
						table.insert( list, {
							models = {
								index = index,
								title = card.title,
								subTitle = card.subTitle,
								type = card.type,
								cardsCountToShow = card.cardsCountToShow,
								actionTitle = card.actionTitle,
								actionButton = card.actionButton,
								action = card.action,
								background = card.bg,
								sequence = sequence
							}
						} )
						sequence = sequence + 1
					end
				end
			end
		end
		return list
	end
	 ),
	MarketingRoot = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "MarketingRoot" )
			return model
		end
	},
	NetworkInfo = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "NetworkInfo" )
			local natType = Engine.CreateModel( model, "natType" )
			local bandwidth = Engine.CreateModel( model, "bandwidth" )
			local connType = Engine.CreateModel( model, "connectionType" )
			local extIP = Engine.CreateModel( model, "externalIP" )
			local intIP = Engine.CreateModel( model, "internalIP" )
			local region = Engine.CreateModel( model, "region" )
			local version = Engine.CreateModel( model, "version" )
			local connectivityInfo = Engine.CreateModel( model, "connectivityInfo" )
			local supportURL = Engine.CreateModel( model, "supportURL" )
			Engine.SetModelValue( natType, Engine.GetSystemInfo( controller, CoD.SYSINFO_NAT_TYPE ) )
			Engine.SetModelValue( bandwidth, Engine.GetSystemInfo( controller, CoD.SYSINFO_BANDWIDTH ) )
			Engine.SetModelValue( connType, Engine.GetSystemInfo( controller, CoD.SYSINFO_CONNECTION_TYPE ) )
			Engine.SetModelValue( extIP, Engine.GetSystemInfo( controller, CoD.SYSINFO_EXTERNAL_IP_ADDRESS ) )
			Engine.SetModelValue( intIP, Engine.GetSystemInfo( controller, CoD.SYSINFO_INTERNAL_IP_ADDRESS ) )
			Engine.SetModelValue( region, Engine.GetSystemInfo( controller, CoD.SYSINFO_GEOGRAPHICAL_REGION ) )
			Engine.SetModelValue( version, Engine.GetSystemInfo( controller, CoD.SYSINFO_VERSION_NUMBER ) )
			Engine.SetModelValue( connectivityInfo, Engine.GetSystemInfo( controller, CoD.SYSINFO_CONNECTIVITY_INFO ) )
			local url = "MENU_OPTIONS_NETWORK_CUSTOMER_SERVICE_LINK"
			if Dvar.ui_supportURL ~= nil then
				url = Dvar.ui_supportURL:get()
			end
			Engine.SetModelValue( supportURL, url )
			return model
		end
	},
	MOTD = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "motd" )
			local isValidModel = Engine.CreateModel( model, "isValid" )
			local singleViewModel = Engine.CreateModel( model, "singleView" )
			local motdVersionModel = Engine.CreateModel( model, "motdVersion" )
			local titleModel = Engine.CreateModel( model, "title" )
			local messageModel = Engine.CreateModel( model, "message" )
			local imageModel = Engine.CreateModel( model, "image" )
			local actionModel = Engine.CreateModel( model, "action" )
			local actionContextModel = Engine.CreateModel( model, "actionContext" )
			local actionStringModel = Engine.CreateModel( model, "actionString" )
			local bannerTitleModel = Engine.CreateModel( model, "bannerTitle" )
			local bannerMessageModel = Engine.CreateModel( model, "bannerMessage" )
			local bannerImageModel = Engine.CreateModel( model, "bannerImage" )
			local bannerActionModel = Engine.CreateModel( model, "bannerAction" )
			local bannerActionContextModel = Engine.CreateModel( model, "bannerActionContext" )
			local bannerActionStringModel = Engine.CreateModel( model, "bannerActionString" )
			local data = Engine.GetMOTD()
			Engine.SetModelValue( isValidModel, data.isValid )
			if data.isValid then
				Engine.SetModelValue( singleViewModel, data.singleView )
				Engine.SetModelValue( motdVersionModel, data.motdVersion )
				Engine.SetModelValue( titleModel, data.title )
				Engine.SetModelValue( messageModel, data.message )
				Engine.SetModelValue( imageModel, data.image )
				Engine.SetModelValue( actionModel, data.action )
				Engine.SetModelValue( actionContextModel, data.actionContext )
				Engine.SetModelValue( actionStringModel, data.actionString )
				Engine.SetModelValue( bannerTitleModel, data.bannerTitle )
				Engine.SetModelValue( bannerMessageModel, data.bannerMessage )
				Engine.SetModelValue( bannerImageModel, data.bannerImage )
				Engine.SetModelValue( bannerActionModel, data.bannerAction )
				Engine.SetModelValue( bannerActionContextModel, data.bannerActionContext )
				Engine.SetModelValue( bannerActionStringModel, data.bannerActionString )
			end
			return model
		end
	},
	MtxCommsMOTD = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsMOTD" )
			local data = Engine.GetMarketingMessage( controller, "motd" )
			if data ~= nil then
				for key, value in next, data, nil do
					Engine.SetModelValue( Engine.CreateModel( model, key ), value )
				end
				if not data.messageID then
					Engine.SetModelValue( Engine.CreateModel( model, "messageID" ), 0 )
				end
			end
			return model
		end
	},
	MtxCommsRegistration = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsRegistration" )
			local data = Engine.GetMarketingMessage( controller, "registration" )
			if data ~= nil and not data.messageViewReported then
				for key, value in next, data, nil do
					Engine.SetModelValue( Engine.CreateModel( model, key ), value )
				end
				if data.action ~= nil then
					if data.action == "registration" then
						Engine.SetModelValue( Engine.CreateModel( model, "action_title" ), Engine.Localize( "ACCOUNT_LINK_REGISTER" ) )
					elseif data.action == "opt-in" then
						Engine.SetModelValue( Engine.CreateModel( model, "action_title" ), Engine.Localize( "ACCOUNT_LINK_LEARN_MORE" ) )
					end
				end
			else
				local data = Engine.GetMarketingMessage( controller, "motd" )
				if data.hasBanner then
					Engine.SetModelValue( Engine.CreateModel( model, "content_short" ), data.bannerTitle )
					Engine.SetModelValue( Engine.CreateModel( model, "action_title" ), Engine.Localize( data.bannerActionString ) )
					Engine.SetModelValue( Engine.CreateModel( model, "action" ), data.bannerAction )
					Engine.SetModelValue( Engine.CreateModel( model, "image" ), data.bannerImage )
				end
			end
			return model
		end
	},
	WeaponGroups = ListHelper_SetupDataSource( "WeaponGroups", function ( controller )
		local weaponCategoryList = {}
		local createWeaponGroup = function ( weaponNameTable, loadoutType )
			for _, category in ipairs( weaponNameTable ) do
				if CoD.UnlockablesTable and CoD.UnlockablesTable[category.weapon_category] then
					table.insert( weaponCategoryList, {
						models = {
							tabName = category.name
						},
						properties = {
							filter = category.weapon_category,
							loadoutType = loadoutType
						}
					} )
				end
			end
		end
		
		table.insert( weaponCategoryList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		local weaponClassGroup = CoD.perController[controller].weaponClassGroup
		if weaponClassGroup == "primary" then
			createWeaponGroup( CoD.CACUtility.PrimaryWeaponGroupNames, "primary" )
		elseif weaponClassGroup == "secondary" then
			createWeaponGroup( CoD.CACUtility.SecondaryWeaponGroupNames, "secondary" )
		end
		table.insert( weaponCategoryList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return weaponCategoryList
	end
	, true ),
	Unlockables = {
		prepare = function ( controller, list, filter )
			if not CoD.UnlockablesTable then
				CoD.UnlockablesTable = CoD.GetUnlockablesTable( controller, filter )
			end
			list.dataSource = CoD.UnlockablesTable
		end,
		getCount = function ( list )
			if not DataSources.Unlockables.currentFilter and list.dataSource.filterList then
				return #list.dataSource.filterList
			elseif list.dataSource[DataSources.Unlockables.currentFilter] then
				return #list.dataSource[DataSources.Unlockables.currentFilter]
			else
				return 0
			end
		end,
		getItem = function ( controller, list, index )
			if not DataSources.Unlockables.currentFilter and list.dataSource.filterList then
				return list.dataSource.filterList[index]
			elseif list.dataSource[DataSources.Unlockables.currentFilter] then
				return list.dataSource[DataSources.Unlockables.currentFilter][index]
			else
				
			end
		end,
		setCurrentFilterItem = function ( filter )
			DataSources.Unlockables.currentFilter = filter
		end,
		getCurrentFilterItem = function ()
			return DataSources.Unlockables.currentFilter
		end,
		currentFilter = nil
	},
	WeaponAttachments = ListHelper_SetupDataSource( "WeaponAttachments", function ( controller )
		local attachments = {}
		local weaponSlot = CoD.perController[controller].weaponSlot
		local weaponCategory = CoD.perController[controller].weaponCategory
		local classModel = CoD.perController[controller].classModel
		local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, weaponSlot .. ".itemIndex" ) )
		local numAttachments = Engine.GetNumAttachments( weaponItemIndex )
		local attachmentType = CoD.perController[controller].attachmentType
		local weaponRef = Engine.GetItemRef( weaponItemIndex )
		local refCol = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
		local weaponRefCol = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
		local damageLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
		local rangeLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
		local fireRateLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
		local accuracyLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
		local equippedAttachmentAttributes = {
			damage = 0,
			range = 0,
			fireRate = 0,
			accuracy = 0
		}
		local attachmentSlotList = CoD.CACUtility.GetAttachmentListForSlot( weaponCategory )
		local equippedAttachmentRefList = {}
		for _, attachmentSlot in ipairs( attachmentSlotList ) do
			local attachmentSlotAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlot .. ".itemIndex" ) )
			if attachmentSlot ~= weaponCategory and CoD.CACUtility.EmptyItemIndex < attachmentSlotAttachmentIndex then
				local attachmentRef = Engine.GetAttachmentRef( weaponItemIndex, attachmentSlotAttachmentIndex )
				table.insert( equippedAttachmentRefList, attachmentRef )
				local damageStat = Engine.TableLookup( nil, CoD.weaponAttributes, refCol, attachmentRef, weaponRefCol, weaponRef, damageLookupEnum )
				local rangeStat = Engine.TableLookup( nil, CoD.weaponAttributes, refCol, attachmentRef, weaponRefCol, weaponRef, rangeLookupEnum )
				local fireRateStat = Engine.TableLookup( nil, CoD.weaponAttributes, refCol, attachmentRef, weaponRefCol, weaponRef, fireRateLookupEnum )
				local accuracyStat = Engine.TableLookup( nil, CoD.weaponAttributes, refCol, attachmentRef, weaponRefCol, weaponRef, accuracyLookupEnum )
				local f191_local3 = equippedAttachmentAttributes.damage
				local f191_local4
				if damageStat == "" then
					f191_local4 = 0
					if not f191_local4 then
					
					else
						equippedAttachmentAttributes.damage = f191_local3 + f191_local4
						f191_local3 = equippedAttachmentAttributes.range
						if rangeStat == "" then
							f191_local4 = 0
							if not f191_local4 then
							
							else
								equippedAttachmentAttributes.range = f191_local3 + f191_local4
								f191_local3 = equippedAttachmentAttributes.fireRate
								if fireRateStat == "" then
									f191_local4 = 0
									if not f191_local4 then
									
									else
										equippedAttachmentAttributes.fireRate = f191_local3 + f191_local4
										f191_local3 = equippedAttachmentAttributes.accuracy
										if accuracyStat == "" then
											f191_local4 = 0
											if not f191_local4 then
											
											else
												equippedAttachmentAttributes.accuracy = f191_local3 + f191_local4
											end
										end
										f191_local4 = accuracyStat
									end
								end
								f191_local4 = fireRateStat
							end
						end
						f191_local4 = rangeStat
					end
				end
				f191_local4 = damageStat
			end
		end
		for index = 1, numAttachments - 1, 1 do
			local attachmentIndex = CoD.CACUtility.EmptyItemIndex
			if attachmentType == "attachment" then
				if Engine.IsOptic( weaponItemIndex, index ) == false then
					attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index )
				end
			elseif attachmentType == "optic" and Engine.IsOptic( weaponItemIndex, index ) == true then
				attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index )
			end
			if CoD.CACUtility.EmptyItemIndex < attachmentIndex then
				local attachmentSlotAttachmentIndex = Engine.GetAttachmentRef( weaponItemIndex, index )
				local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
				local attachmentImage = Engine.GetAttachmentUniqueImageByIndex( weaponItemIndex, index )
				local acvIndex = CoD.CACUtility.EmptyItemIndex
				local slot = CoD.CACUtility.GetLoadoutSlotForAttachmentName( classModel, weaponSlot, attachmentSlotAttachmentIndex )
				if slot then
					acvIndex = Engine.GetModelValue( Engine.GetModel( classModel, slot .. "cosmeticvariant.itemIndex" ) )
					if CoD.CACUtility.EmptyItemIndex < acvIndex then
						attachmentName = Engine.GetModelValue( Engine.GetModel( classModel, slot .. "cosmeticvariant.name" ) )
						attachmentImage = Engine.GetModelValue( Engine.GetModel( classModel, slot .. "cosmeticvariant.image" ) )
					end
				end
				local unlockablesModel = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" )
				local f191_local3 = Engine.GetModel( unlockablesModel, weaponItemIndex .. ".weaponAttributes" )
				local getWeaponAttributeValues = function ( attributeName, attributeLookupEnum )
					local weaponAttributeValue = Engine.GetModelValue( Engine.GetModel( f191_local3, attributeName ) )
					local attachmentAttributeValue = Engine.TableLookup( nil, CoD.weaponAttributes, refCol, attachmentSlotAttachmentIndex, weaponRefCol, weaponRef, attributeLookupEnum )
					if weaponAttributeValue == "" then
						weaponAttributeValue = 0
					end
					if attachmentAttributeValue == "" then
						attachmentAttributeValue = 0
					end
					local isAttachmentEquipped = false
					for index, equippedAttachmentRef in ipairs( equippedAttachmentRefList ) do
						if equippedAttachmentRef == attachmentSlotAttachmentIndex then
							isAttachmentEquipped = true
							break
						end
					end
					local combinedWeaponAttachmentAttribute = weaponAttributeValue + equippedAttachmentAttributes[attributeName]
					if not isAttachmentEquipped then
						combinedWeaponAttachmentAttribute = combinedWeaponAttachmentAttribute + attachmentAttributeValue
					end
					return weaponAttributeValue .. "," .. combinedWeaponAttachmentAttribute
				end
				
				local attachmentInfo = {
					models = {
						name = attachmentName,
						image = attachmentImage,
						itemIndex = index,
						weaponIndex = weaponItemIndex,
						attachmentIndex = attachmentIndex,
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT,
						weaponSlot = weaponCategory,
						weaponIndex = weaponItemIndex,
						description = Engine.GetAttachmentDesc( weaponItemIndex, index ),
						weaponAttributes = {
							damage = getWeaponAttributeValues( "damage", damageLookupEnum ),
							range = getWeaponAttributeValues( "range", rangeLookupEnum ),
							fireRate = getWeaponAttributeValues( "fireRate", fireRateLookupEnum ),
							accuracy = getWeaponAttributeValues( "accuracy", accuracyLookupEnum )
						}
					},
					properties = {
						weaponIndex = weaponItemIndex,
						attachmentTableIndex = attachmentIndex,
						acvIndex = acvIndex
					}
				}
				table.insert( attachments, attachmentInfo )
			end
		end
		return attachments
	end
	, true ),
	EquippedBubbleGumPack = {
		getModel = function ( controller )
			local perControllerModel = Engine.GetModelForController( controller )
			local equippedBubbleGumPackModel = Engine.CreateModel( perControllerModel, "EquippedBubbleGumPack" )
			local equippedBubbleGumPackIndex = Engine.GetEquippedBubbleGumPack( controller )
			Engine.SetModelValue( Engine.CreateModel( equippedBubbleGumPackModel, "bgbPackIndex" ), equippedBubbleGumPackIndex )
			return equippedBubbleGumPackModel
		end
	},
	BubbleGumBuffs = {
		prepare = function ( controller, list, filter )
			local perControllerModel = Engine.GetModelForController( controller )
			local equippedBubbleGumPackIndex = Engine.GetEquippedBubbleGumPack( controller )
			DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( controller, perControllerModel, equippedBubbleGumPackIndex )
		end,
		getCount = function ( list )
			return CoD.BubbleGumBuffs.NumBuffsPerPack
		end,
		getItem = function ( controller, list, index )
			if list:getParent() then
				local f196_local0 = list:getParent()
				return f196_local0:getModel( controller, "BubbleGumBuffs." .. index )
			else
				return Engine.CreateModel( Engine.GetModelForController( controller ), "BubbleGumBuffs." .. index )
			end
		end,
		setupBubbleGumBuffsModel = function ( controller, parentModel, bubbleGumPackIndex )
			local bubbleGumBuffsModel = Engine.CreateModel( parentModel, "BubbleGumBuffs" )
			for bubbleGumBuffIndex = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
				local bubbleGumBuffModel = Engine.CreateModel( bubbleGumBuffsModel, bubbleGumBuffIndex + 1 )
				local itemIndex = Engine.GetBubbleGumBuff( controller, bubbleGumPackIndex, bubbleGumBuffIndex )
				Engine.SetModelValue( Engine.CreateModel( bubbleGumBuffModel, "bgbIndex" ), bubbleGumBuffIndex )
				Engine.SetModelValue( Engine.CreateModel( bubbleGumBuffModel, "itemIndex" ), itemIndex )
			end
		end
	},
	BubbleGumPacks = {
		prepare = function ( controller, list, filter )
			list.bubbleGumPacks = {}
			local perControllerModel = Engine.GetModelForController( controller )
			local bubbleGumPacksModel = Engine.CreateModel( perControllerModel, "BubbleGumPacks" )
			for bubbleGumPackIndex = 0, CoD.BubbleGumBuffs.NumPacks - 1, 1 do
				local bubbleGumPackModel = Engine.CreateModel( bubbleGumPacksModel, bubbleGumPackIndex )
				local bubbleGumPackName = Engine.GetBubbleGumPackName( controller, bubbleGumPackIndex )
				Engine.SetModelValue( Engine.CreateModel( bubbleGumPackModel, "bgbPackIndex" ), bubbleGumPackIndex )
				DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( controller, bubbleGumPackModel, bubbleGumPackIndex )
				table.insert( list.bubbleGumPacks, bubbleGumPackModel )
			end
		end,
		getCount = function ( list )
			return #list.bubbleGumPacks
		end,
		getItem = function ( controller, list, index )
			return list.bubbleGumPacks[index]
		end
	},
	BubbleGumTabType = ListHelper_SetupDataSource( "BubbleGumTabType", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "ZMUI_BUBBLEGUM_CAPS" )
			},
			properties = {
				filter = "bubblegum"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "ZMUI_MEGACHEW_CAPS" )
			},
			properties = {
				filter = "bubblegum_consumable"
			}
		} )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			}
		} )
		return tabList
	end
	 ),
	MegaChewTokens = {
		getModel = function ( controller )
			local perControllerModel = Engine.GetModelForController( controller )
			local tokenModel = Engine.CreateModel( perControllerModel, "MegaChewTokens" )
			Engine.SetModelValue( Engine.CreateModel( tokenModel, "remainingTokens" ), Engine.GetBGBTokensRemaining( controller ) )
			return tokenModel
		end
	},
	MegaChewMachines = {
		getModel = function ( controller )
			local perControllerModel = Engine.GetModelForController( controller )
			local MegaChewMachinesModel = Engine.CreateModel( perControllerModel, "MegaChewMachines" )
			for index = 0, 2, 1 do
				local machineName = "machine" .. index
				local machineModel = Engine.CreateModel( MegaChewMachinesModel, machineName )
				local machineIndex = index
				local machinePrice = index + 1
				Engine.SetModelValue( Engine.CreateModel( machineModel, "index" ), machineIndex )
				Engine.SetModelValue( Engine.CreateModel( machineModel, "price" ), machinePrice )
			end
			return MegaChewMachinesModel
		end
	},
	ClientDemoFiles = {
		prepare = function ( controller, list, filter )
			list.clientDemoFiles = {}
			local count = Engine.GetClientDemoFileCount()
			local clientDemoModel = Engine.CreateModel( Engine.GetGlobalModel(), "ClientDemo" )
			for i = 1, count, 1 do
				local index = i - 1
				local fileInfo = Engine.GetClientDemoFileInfo( index )
				local model = Engine.CreateModel( clientDemoModel, index )
				Engine.SetModelValue( Engine.CreateModel( model, "index" ), index )
				Engine.SetModelValue( Engine.CreateModel( model, "fileName" ), fileInfo.fileName )
				Engine.SetModelValue( Engine.CreateModel( model, "gameType" ), fileInfo.gameType )
				Engine.SetModelValue( Engine.CreateModel( model, "mapName" ), fileInfo.mapName )
				Engine.SetModelValue( Engine.CreateModel( model, "authorName" ), fileInfo.authorName )
				Engine.SetModelValue( Engine.CreateModel( model, "createTime" ), fileInfo.createTime )
				Engine.SetModelValue( Engine.CreateModel( model, "duration" ), fileInfo.duration )
				table.insert( list.clientDemoFiles, model )
			end
		end,
		getCount = function ( list )
			return #list.clientDemoFiles
		end,
		getItem = function ( controller, list, index )
			return list.clientDemoFiles[index]
		end
	},
	DemoSegments = {
		prepare = function ( controller, list, filter )
			list.segments = {}
			local maxSegments = 20
			local demoSegmentsModel, demoSegmentsRefreshModel, selectedSegmentModel, selectedSegmentNumber, selectedSegmentName = nil
			if Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" ) == nil then
				demoSegmentsModel = Engine.CreateModel( Engine.GetGlobalModel(), "DemoSegments" )
				demoSegmentsRefreshModel = Engine.CreateModel( demoSegmentsModel, "refresh" )
				Engine.SetModelValue( demoSegmentsRefreshModel, 0 )
			else
				demoSegmentsModel = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
				demoSegmentsRefreshModel = Engine.GetModel( demoSegmentsModel, "refresh" )
			end
			local segmentCount = Engine.GetDemoSegmentCount()
			selectedSegmentModel = GetSelectedSegmentModel()
			if selectedSegmentModel then
				selectedSegmentNumber = Engine.GetModelValue( Engine.GetModel( selectedSegmentModel, "segmentNumber" ) )
				selectedSegmentName = Engine.GetDemoSegmentInformation( selectedSegmentNumber - 1, "name" )
			end
			for i = 1, maxSegments, 1 do
				local index = i - 1
				local model = Engine.CreateModel( demoSegmentsModel, index )
				local name, duration, transitionText, score, stars, isEmpty = nil
				Engine.SetModelValue( Engine.CreateModel( model, "segmentNumber" ), i )
				if i <= segmentCount then
					if selectedSegmentNumber ~= nil then
						if selectedSegmentNumber == i then
							name = Engine.Localize( "MENU_MOVING_SEGMENT_SELECT_NEW_SPOT", selectedSegmentName )
						else
							name = Engine.Localize( "MENU_PLACE_SEGMENT_AT_TIMELINE_POSITION", selectedSegmentName, i )
						end
					else
						name = Engine.GetDemoSegmentInformation( index, "name" )
					end
					if selectedSegmentNumber ~= nil then
						duration = ""
						transitionText = ""
						score = ""
						stars = ""
					else
						duration = Engine.GetDemoSegmentInformation( index, "durationLocString" )
						if i < segmentCount then
							local transition = Engine.GetDemoSegmentInformation( index, "transition" )
							transitionText = Engine.Localize( "MENU_TRANSITION" ) .. transition
						else
							transitionText = ""
						end
						if Engine.IsDemoHighlightReelMode() then
							local segmentScore = tonumber( Engine.GetDemoSegmentInformation( index, "score" ) )
							local segmentStars = tonumber( Engine.GetDemoSegmentInformation( index, "stars" ) )
							score = segmentScore
							stars = segmentStars
						end
					end
					isEmpty = false
				else
					if selectedSegmentNumber ~= nil then
						name = Engine.Localize( "MENU_CANNOT_PLACE_SEGMENT_IN_TIMELINE", selectedSegmentName )
					else
						name = ""
					end
					duration = ""
					transitionText = ""
					score = ""
					stars = ""
					isEmpty = true
				end
				Engine.SetModelValue( Engine.CreateModel( model, "name" ), name )
				Engine.SetModelValue( Engine.CreateModel( model, "duration" ), duration )
				Engine.SetModelValue( Engine.CreateModel( model, "transitionText" ), transitionText )
				Engine.SetModelValue( Engine.CreateModel( model, "stars" ), score )
				Engine.SetModelValue( Engine.CreateModel( model, "score" ), stars )
				Engine.SetModelValue( Engine.CreateModel( model, "disabled" ), isEmpty )
				table.insert( list.segments, {
					model = model
				} )
			end
			list:subscribeToModel( demoSegmentsRefreshModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return #list.segments
		end,
		getItem = function ( controller, list, index )
			return list.segments[index].model
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.segments[index]
		end
	},
	PrimaryOffhandGadget = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget0" )
		end
	},
	SecondaryOffhandGadget = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget1" )
		end
	},
	SpecialOffhandGadget = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget2" )
		end
	},
	HeroWeapon = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget3" )
		end
	},
	CurrentWeapon = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "currentWeapon" )
		end
	},
	CurrentPrimaryOffhand = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "currentPrimaryOffhand" )
		end
	},
	CurrentSecondaryOffhand = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "currentSecondaryOffhand" )
		end
	},
	CurrentSpecialOffhand = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "currentSpecialOffhand" )
		end
	},
	HUDItems = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "hudItems" )
		end
	},
	InteractivePrompt = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "interactivePrompt" )
		end
	},
	InGameNotifications = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "inGameNotifications" )
		end
	},
	KillstreakReward = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "killstreakRewards" )
		end
	},
	PlayerCallout = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "playerCallout" )
		end
	},
	PlayerObituary = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "playerObituary" )
		end
	},
	PlayerAbilities = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "playerAbilities" )
		end
	},
	Perks = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "perks" )
		end
	},
	Specialties = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "specialties" )
		end
	},
	CTF = {
		prepared = false,
		prepare = function ( controller, element, filter )
			local ctfModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CTF" )
			local friendlyFlagCarrierModel = Engine.CreateModel( ctfModel, "friendlyFlagCarrier" )
			local enemyFlagCarrierModel = Engine.CreateModel( ctfModel, "enemyFlagCarrier" )
		end,
		getModel = function ( controller )
			if not DataSources.CTF.prepared then
				DataSources.CTF.prepare( controller )
			end
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "CTF" )
		end
	},
	Ball = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "ballGametype" )
		end
	},
	Escort = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "escortGametype" )
		end
	},
	Factions = {
		prepared = false,
		factionSubscription = nil,
		prepare = function ( controller, element, filter )
			if not DataSources.Factions.factionSubscription then
				DataSources.Factions.factionSubscription = LUI.UIElement.new()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			local factionModel = Engine.CreateModel( perControllerModel, "factions" )
			local playerFactionTeamEnumModel = Engine.CreateModel( factionModel, "playerFactionTeamEnum" )
			local playerFactionNameModel = Engine.CreateModel( factionModel, "playerFactionName" )
			local playerFactionDisplayNameModel = Engine.CreateModel( factionModel, "playerFactionDisplayName" )
			local playerFactionIconModel = Engine.CreateModel( factionModel, "playerFactionIcon" )
			local playerFactionColorModel = Engine.CreateModel( factionModel, "playerFactionColor" )
			local playerFactionFlagColorModel = Engine.CreateModel( factionModel, "playerFactionFlagColor" )
			local enemyFactionTeamEnumModel = Engine.CreateModel( factionModel, "enemyFactionTeamEnum" )
			local enemyFactionNameModel = Engine.CreateModel( factionModel, "enemyFactionName" )
			local enemyFactionDisplayNameModel = Engine.CreateModel( factionModel, "enemyFactionDisplayName" )
			local enemyFactionIconModel = Engine.CreateModel( factionModel, "enemyFactionIcon" )
			local enemyFactionColorModel = Engine.CreateModel( factionModel, "enemyFactionColor" )
			local enemyFactionFlagColorModel = Engine.CreateModel( factionModel, "enemyFactionFlagColor" )
			DataSources.Factions.factionSubscription:unsubscribeFromAllModels()
			DataSources.Factions.factionSubscription:subscribeToModel( playerFactionTeamEnumModel, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					Engine.SetModelValue( playerFactionIconModel, CoD.GetTeamFactionIcon( modelValue ) )
					Engine.SetModelValue( playerFactionDisplayNameModel, CoD.GetTeamNameCaps( modelValue ) )
					Engine.SetModelValue( playerFactionColorModel, CoD.GetTeamFactionColor( modelValue ) )
					local playerFactionFlagColor = string.format( "%d %d %d", ColorSet.FriendlyBlue.r * 255, ColorSet.FriendlyBlue.g * 255, ColorSet.FriendlyBlue.b * 255 )
					if CoD.IsShoutcaster( controller ) then
						CoD.UpdateColorSet( "CodCasterFriendly", CoD.GetTeamFactionColor( modelValue ) )
						Engine.SetupCompassColors( controller )
						playerFactionFlagColor = CoD.GetTeamFactionColor( modelValue )
					end
					Engine.SetModelValue( playerFactionFlagColorModel, playerFactionFlagColor )
				end
			end )
			DataSources.Factions.factionSubscription:subscribeToModel( enemyFactionTeamEnumModel, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					Engine.SetModelValue( enemyFactionIconModel, CoD.GetTeamFactionIcon( modelValue ) )
					Engine.SetModelValue( enemyFactionDisplayNameModel, CoD.GetTeamNameCaps( modelValue ) )
					Engine.SetModelValue( enemyFactionColorModel, CoD.GetTeamFactionColor( modelValue ) )
					local enemyFactionFlagColor = string.format( "%d %d %d", ColorSet.EnemyOrange.r * 255, ColorSet.EnemyOrange.g * 255, ColorSet.EnemyOrange.b * 255 )
					if CoD.IsShoutcaster( controller ) then
						CoD.UpdateColorSet( "CodCasterEnemy", CoD.GetTeamFactionColor( modelValue ) )
						Engine.SetupCompassColors( controller )
						enemyFactionFlagColor = CoD.GetTeamFactionColor( modelValue )
					end
					Engine.SetModelValue( enemyFactionFlagColorModel, enemyFactionFlagColor )
				end
			end )
			local alliesInfo = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			local axisInfo = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
			if CoD.IsShoutcaster( controller ) and CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
				axisInfo = {
					name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
					icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
					color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
				}
				alliesInfo = {
					name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
					icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
					color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
				}
			end
			Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionDisplayName" ), axisInfo.name )
			Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionIcon" ), axisInfo.icon )
			Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionColor" ), axisInfo.color )
			Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionDisplayName" ), alliesInfo.name )
			Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionIcon" ), alliesInfo.icon )
			Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionColor" ), alliesInfo.color )
			if CoD.IsShoutcaster( controller ) then
				CoD.UpdateColorSet( "CodCasterFactionAllies", alliesInfo.color )
				CoD.UpdateColorSet( "CodCasterFactionAxis", axisInfo.color )
				Engine.SetupCompassColors( controller )
			end
			local teamModel = Engine.GetModel( perControllerModel, "team" )
			if teamModel then
				DataSources.Factions.factionSubscription:subscribeToModel( teamModel, function ( model )
					DataSources.Factions.prepared = false
					DataSources.Factions.prepare( controller )
				end, false )
			end
			local profileSettingsModel = Engine.GetModel( perControllerModel, "CodCaster.profileSettingsUpdated" )
			if profileSettingsModel then
				DataSources.Factions.factionSubscription:subscribeToModel( profileSettingsModel, function ( model )
					DataSources.Factions.prepared = false
					DataSources.Factions.prepare( controller )
				end, false )
			end
			DataSources.Factions.prepared = true
		end,
		getModel = function ( controller )
			if not DataSources.Factions.prepared then
				DataSources.Factions.prepare( controller )
			end
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "factions" )
		end
	},
	FactionList = {
		prepare = function ( controller, list, filter )
			list.factions = {}
			local factionModel = Engine.CreateModel( Engine.GetModelForController( controller ), "factionList" )
			local factions = Engine.GetTeamPositions( controller )
			for factionIndex, factionData in ipairs( factions ) do
				local factionName = Engine.GetFactionForTeam( factionIndex )
				list.factions[factionIndex] = Engine.CreateModel( factionModel, "faction" .. factionIndex )
				local factionScore = 0
				local factionMaterial = "faction_" .. factionName
				Engine.SetModelValue( Engine.CreateModel( list.factions[factionIndex], "factionName" ), factionName )
				Engine.SetModelValue( Engine.CreateModel( list.factions[factionIndex], "factionIcon" ), factionMaterial )
				Engine.SetModelValue( Engine.CreateModel( list.factions[factionIndex], "factionScore" ), factionScore )
			end
		end,
		getCount = function ( list )
			return #list.factions
		end,
		getItem = function ( controller, list, index )
			return list.factions[index]
		end
	},
	NetStats = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetGlobalModel(), "netstats" )
		end
	},
	Groups = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "groups" )
		end
	},
	GroupsMainTabList = ListHelper_SetupDataSource( "GroupsMainTabModel", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "GROUPS_MY_GROUPS_CAPS" ),
				tabWidget = "CoD.MyGroupsTab"
			},
			properties = {
				tabId = "mygroups"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "GROUPS_FIND_GROUPS_CAPS" ),
				tabWidget = "CoD.FindGroupsTab"
			},
			properties = {
				tabId = "findgroups"
			}
		} )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return tabList
	end
	, true ),
	GroupsMainButtonList = {
		prepare = function ( controller, list, filter )
			list.buttons = {}
			local buttons = {}
			list.groups = Engine.GetGroupList( controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
			for i = 1, #list.groups, 1 do
				local group = list.groups[i]
				table.insert( buttons, {
					displayText = group.name,
					action = OpenGroupHeadquarters,
					btnType = "group",
					groupId = group.groupId,
					groupBufferType = group.bufferType,
					name = group.name,
					clanTag = group.clanTag,
					description = group.description,
					message = group.message,
					privacy = group.privacy,
					creationTimestamp = group.creationTimestamp,
					owner = group.owner,
					ownerXuid = group.ownerXuid,
					memberStatus = group.memberStatus,
					memberStatusText = group.memberStatusText,
					memberCount = group.memberCount,
					onlineCount = group.onlineCount,
					inTitleCount = group.inTitleCount,
					lbIndex = group.lbIndex,
					lbSortColumn = group.lbSortColumn,
					lbTimeFrame = group.lbTimeFrame,
					lbHardcore = group.lbHardcore,
					lbInitialized = group.lbInitialized
				} )
			end
			local perControllerModel = Engine.GetModelForController( controller )
			local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
			list.groupCountModel = Engine.CreateModel( groupsModel, "groupCount_self" )
			local groupMainButtonListModel = Engine.CreateModel( groupsModel, "mainButtons" )
			for index, buttonData in ipairs( buttons ) do
				local buttonModel = Engine.CreateModel( groupMainButtonListModel, "buttonModel_" .. index )
				table.insert( list.buttons, {
					model = buttonModel,
					type = buttonData.btnType,
					groupId = buttonData.groupId,
					groupBufferType = buttonData.groupBufferType
				} )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), buttonData.action )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "type" ), buttonData.btnType )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "groupId" ), buttonData.groupId )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "groupBufferType" ), buttonData.groupBufferType )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "name" ), buttonData.name )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "clanTag" ), buttonData.clanTag )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "description" ), buttonData.description )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "message" ), buttonData.message )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "privacy" ), buttonData.privacy )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "creationTimestamp" ), buttonData.creationTimestamp )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "owner" ), buttonData.owner )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "ownerXuid" ), buttonData.ownerXuid )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberStatus" ), buttonData.memberStatus )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberStatusText" ), buttonData.memberStatusText )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberCount" ), buttonData.memberCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "onlineCount" ), buttonData.onlineCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "inTitleCount" ), buttonData.inTitleCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbIndex" ), buttonData.lbIndex )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbSortColumn" ), buttonData.lbSortColumn )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbTimeFrame" ), buttonData.lbTimeFrame )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbHardcore" ), buttonData.lbHardcore )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbInitialized" ), buttonData.lbInitialized )
			end
			list:subscribeToModel( list.groupCountModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.buttons[index]
		end,
		getCount = function ( list )
			return #list.buttons
		end,
		getItem = function ( controller, list, index )
			return list.buttons[index].model
		end
	},
	FindGroupsButtonList = {
		prepare = function ( controller, list, filter )
			list.buttons = {}
			local buttons = {}
			local foundGroups = Engine.GetGroupList( controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
			local myGroups = Engine.GetGroupList( controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
			for i = 1, #foundGroups, 1 do
				local alreadyAMember = false
				for j = 1, #myGroups, 1 do
					if foundGroups[i].groupId == myGroups[j].groupId then
						alreadyAMember = true
						break
					end
				end
				if not alreadyAMember then
					local group = foundGroups[i]
					table.insert( buttons, {
						displayText = group.name,
						action = OpenGroupHeadquarters,
						btnType = "group",
						groupId = group.groupId,
						groupBufferType = group.bufferType,
						name = group.name,
						clanTag = group.clanTag,
						description = group.description,
						message = group.message,
						privacy = group.privacy,
						creationTimestamp = group.creationTimestamp,
						owner = group.owner,
						ownerXuid = group.ownerXuid,
						memberStatus = group.memberStatus,
						memberStatusText = group.memberStatusText,
						memberCount = group.memberCount,
						onlineCount = group.onlineCount,
						inTitleCount = group.inTitleCount,
						lbIndex = group.lbIndex,
						lbSortColumn = group.lbSortColumn,
						lbTimeFrame = group.lbTimeFrame,
						lbHardcore = group.lbHardcore,
						lbInitialized = group.lbInitialized
					} )
				end
			end
			local perControllerModel = Engine.GetModelForController( controller )
			local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
			local groupMainButtonListModel = Engine.CreateModel( groupsModel, "findGroupsButtons" )
			for index, f250_local3 in ipairs( buttons ) do
				local buttonModel = Engine.CreateModel( groupMainButtonListModel, "buttonModel_" .. index )
				table.insert( list.buttons, {
					model = buttonModel,
					type = f250_local3.btnType,
					groupId = f250_local3.groupId,
					groupBufferType = f250_local3.groupBufferType
				} )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( f250_local3.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), f250_local3.action )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "type" ), f250_local3.btnType )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "groupId" ), f250_local3.groupId )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "groupBufferType" ), f250_local3.groupBufferType )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "name" ), f250_local3.name )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "clanTag" ), f250_local3.clanTag )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "description" ), f250_local3.description )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "message" ), f250_local3.message )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "privacy" ), f250_local3.privacy )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "creationTimestamp" ), f250_local3.creationTimestamp )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "owner" ), f250_local3.owner )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "ownerXuid" ), f250_local3.ownerXuid )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberStatus" ), f250_local3.memberStatus )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberStatusText" ), f250_local3.memberStatusText )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberCount" ), f250_local3.memberCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "onlineCount" ), f250_local3.onlineCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "inTitleCount" ), f250_local3.inTitleCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbIndex" ), f250_local3.lbIndex )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbSortColumn" ), f250_local3.lbSortColumn )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbTimeFrame" ), f250_local3.lbTimeFrame )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbHardcore" ), f250_local3.lbHardcore )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbInitialized" ), f250_local3.lbInitialized )
			end
			list.groupCountModel = Engine.CreateModel( groupsModel, "groupCount_search" )
			list:subscribeToModel( list.groupCountModel, function ()
				list:updateDataSource()
			end, false )
			list.myGroupCountModel = Engine.CreateModel( groupsModel, "groupCount_self" )
			list:subscribeToModel( list.myGroupCountModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.buttons[index]
		end,
		getCount = function ( list )
			return #list.buttons
		end,
		getItem = function ( controller, list, index )
			return list.buttons[index].model
		end
	},
	GroupsHeadquartersTabList = ListHelper_SetupDataSource( "GroupsHeadquartersTabModel", function ( controller )
		local tabList = {}
		local doesHaveAdminRights = DoesHaveAdminRightsForGroup( nil, controller )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "GROUPS_OVERVIEW_CAPS" ),
				tabWidget = "CoD.OverviewTab"
			},
			properties = {
				tabId = "overview"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "GROUPS_ROSTER_CAPS" ),
				tabWidget = "CoD.RosterTab"
			},
			properties = {
				tabId = "roster"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "GROUPS_BADGES_CAPS" ),
				tabWidget = "CoD.BadgesTab"
			},
			properties = {
				tabId = "badges"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "GROUPS_LEADERBOARD_CAPS" ),
				tabWidget = "CoD.LeaderboardTab"
			},
			properties = {
				tabId = "leaderboard"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "GROUPS_SHARE_CAPS" ),
				tabWidget = "CoD.ShareTab"
			},
			properties = {
				tabId = "share"
			}
		} )
		if doesHaveAdminRights then
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "GROUPS_ADMIN_CAPS" ),
					tabWidget = "CoD.AdminTab"
				},
				properties = {
					tabId = "admin"
				}
			} )
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
	end
	, true ),
	GroupHeadquartersOverviewButtonList = ListHelper_SetupDataSource( "GroupHeadquartersOverviewButtonListModel", function ( controller )
		local tabList = {}
		local isNotAMember = IsNotAGroupMember( nil, controller )
		local isOwner = IsGroupOwner( nil, controller )
		if not isNotAMember then
			table.insert( tabList, {
				models = {
					displayText = Engine.Localize( "GROUPS_SET_AS_PRIMARY_GROUP" ),
					action = CoD.NullFunction
				}
			} )
			table.insert( tabList, {
				models = {
					displayText = Engine.Localize( "GROUPS_LEAVE_GROUP" ),
					action = ProcessLeaveSelectedGroup
				}
			} )
		end
		if not isOwner then
			table.insert( tabList, {
				models = {
					displayText = Engine.Localize( "GROUPS_REPORT_GROUP" ),
					action = CoD.NullFunction
				}
			} )
		end
		return tabList
	end
	 ),
	GroupHeadquartersAdminButtonList = ListHelper_SetupDataSource( "GroupHeadquartersAdminButtonListModel", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_MESSAGE" ),
				action = EditSelectedGroupMessage
			}
		} )
		table.insert( tabList, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_EMBLEM" ),
				action = EditSelectedGroupEmblem
			}
		} )
		table.insert( tabList, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_DESCRIPTION" ),
				action = EditSelectedGroupDescription
			}
		} )
		table.insert( tabList, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_CLAN_TAG" ),
				action = EditSelectedGroupClanTag
			}
		} )
		table.insert( tabList, {
			models = {
				displayText = Engine.Localize( "GROUPS_CHANGE_GROUP_TYPE" ),
				action = CoD.NullFunction
			}
		} )
		return tabList
	end
	 ),
	SelectedGroup = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			return CoD.perController[controller].selectedGroup
		end
	},
	CreateGroup = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
			return Engine.CreateModel( groupsModel, "createGroup" )
		end
	},
	LeaderboardMakerButtonList = {
		prepare = function ( controller, list, filter )
			list.buttons = {}
			local buttons = {}
			local titleText = ""
			local leaderboardCoreNameData = nil
			local perControllerModel = Engine.GetModelForController( controller )
			local stateModel = Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" )
			local state = Engine.GetModelValue( stateModel )
			local leaderboardIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ) )
			local sortColumnIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbSortColumn" ) )
			if leaderboardIndex ~= nil and leaderboardIndex > 0 then
				leaderboardCoreNameData = CoD.Leaderboard_MP.GetLeaderboardCoreNameData( CoD.Leaderboard_MP.Leaderboards[leaderboardIndex][CoD.Leaderboard_MP.CoreName] )
			end
			local selectedGroupModel = CoD.perController[controller].selectedGroup
			local selectedLeaderboardIndex = Engine.GetModelValue( Engine.GetModel( selectedGroupModel, "lbIndex" ) )
			local selectedLeaderboardSortColumn = Engine.GetModelValue( Engine.GetModel( selectedGroupModel, "lbSortColumn" ) )
			local selectedLeaderboardTimeFrame = Engine.GetModelValue( Engine.GetModel( selectedGroupModel, "lbTimeFrame" ) )
			list.leaderboardMakerStateModel = stateModel
			if state ~= nil then
				if state == "SelectAction" then
					titleText = "GROUPS_LBMAKER_SELECT_ACTION_TITLE"
					table.insert( buttons, {
						model = {
							titleText = titleText,
							displayText = "GROUPS_EDIT_LEADERBOARD",
							action = ProcessEditGroupLeaderboard,
							hintText = Engine.Localize( "GROUPS_EDIT_LEADERBOARD_HINT_TEXT" )
						},
						properties = {
							btnId = "EditLeaderboard"
						}
					} )
					table.insert( buttons, {
						model = {
							titleText = titleText,
							displayText = "GROUPS_REMOVE_LEADERBOARD",
							action = ProcessRemoveGroupLeaderboard,
							hintText = Engine.Localize( "GROUPS_REMOVE_LEADERBOARD_HINT_TEXT" )
						},
						properties = {
							btnId = "RemoveLeaderboard"
						}
					} )
				elseif state == "ChooseBaseLeaderboard" then
					titleText = "GROUPS_LBMAKER_CHOOSE_BASE_LEADERBOARD_TITLE"
					for i = 1, #CoD.Leaderboard_MP.LeaderboardCoreNames, 1 do
						local row = CoD.Leaderboard_MP.LeaderboardCoreNames[i]
						local showSelectedIcon = false
						if selectedLeaderboardIndex ~= nil and i == selectedLeaderboardIndex then
							showSelectedIcon = true
						end
						table.insert( buttons, {
							model = {
								titleText = titleText,
								displayText = row.stringRef,
								action = ProcessChooseBaseLeaderboard,
								hintText = Engine.Localize( row.lbMakerHint ),
								icon = row.icon,
								baseLeaderboard = row.stringRef
							},
							properties = {
								btnId = row.name,
								showSelectedIcon = showSelectedIcon
							}
						} )
					end
				elseif state == "ChooseDefaultSort" then
					titleText = "GROUPS_LBMAKER_CHOOSE_DEFAULT_SORT_TITLE"
					local sortColumData = CoD.Leaderboard_MP.Leaderboards[leaderboardIndex][CoD.Leaderboard_MP.SortColumn]
					for i = 1, #sortColumData, 1 do
						local row = sortColumData[i]
						local showSelectedIcon = false
						if selectedLeaderboardIndex ~= nil and selectedLeaderboardSortColumn ~= nil and leaderboardIndex == selectedLeaderboardIndex and i == selectedLeaderboardSortColumn then
							showSelectedIcon = true
						end
						for j = 1, #CoD.Leaderboard_MP.LeaderboardSortColumns, 1 do
							local sortColumnDetails = CoD.Leaderboard_MP.LeaderboardSortColumns[j]
							if sortColumnDetails.name == row then
								table.insert( buttons, {
									model = {
										titleText = titleText,
										displayText = sortColumnDetails.stringRef,
										action = ProcessChooseDefaultSort,
										hintText = Engine.Localize( "GROUPS_LBMAKER_DEFAULT_SORT_ORDER_HINT_TEXT", sortColumnDetails.stringRef ),
										icon = leaderboardCoreNameData.icon,
										baseLeaderboard = leaderboardCoreNameData.stringRef,
										sortColumn = sortColumnDetails.stringRef
									},
									properties = {
										btnId = row,
										showSelectedIcon = showSelectedIcon
									}
								} )
							end
						end
					end
				elseif state == "ChooseTimeFrame" then
					titleText = "GROUPS_LBMAKER_CHOOSE_TIME_FRAME_TITLE"
					local sortColumnData = CoD.Leaderboard_MP.GetLeaderboardSortColumnData( CoD.Leaderboard_MP.Leaderboards[leaderboardIndex][CoD.Leaderboard_MP.SortColumn][sortColumnIndex] )
					local timeFrameData = CoD.Leaderboard_MP.Leaderboards[leaderboardIndex][CoD.Leaderboard_MP.TimeFrame]
					for i = 1, #timeFrameData, 1 do
						local row = timeFrameData[i]
						for j = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
							local timeFrameDetails = CoD.Leaderboard_MP.LeaderboardTimeFrames[j]
							if timeFrameDetails.name == row then
								local showSelectedIcon = false
								if selectedLeaderboardIndex ~= nil and selectedLeaderboardSortColumn ~= nil and selectedLeaderboardTimeFrame ~= nil and leaderboardIndex == selectedLeaderboardIndex and sortColumnIndex == selectedLeaderboardSortColumn and timeFrameDetails.value == selectedLeaderboardTimeFrame then
									showSelectedIcon = true
								end
								table.insert( buttons, {
									model = {
										titleText = titleText,
										displayText = timeFrameDetails.stringRef,
										action = ProcessChooseTimeFrame,
										hintText = Engine.Localize( timeFrameDetails.lbMakerHint ),
										icon = leaderboardCoreNameData.icon,
										baseLeaderboard = leaderboardCoreNameData.stringRef,
										sortColumn = sortColumnData.stringRef,
										timeFrame = timeFrameDetails.stringRef
									},
									properties = {
										btnId = row,
										showSelectedIcon = showSelectedIcon
									}
								} )
							end
						end
					end
				end
			end
			for index, f261_local5 in ipairs( buttons ) do
				local buttonModelData = f261_local5.model
				local buttonProperties = f261_local5.properties
				local buttonModel = Engine.CreateModel( Engine.GetModel( perControllerModel, "groups.leaderboardmaker" ), "buttonModel_" .. index )
				table.insert( list.buttons, {
					model = buttonModel,
					properties = buttonProperties
				} )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "titleText" ), Engine.Localize( buttonModelData.titleText ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( buttonModelData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "hintText" ), buttonModelData.hintText )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), buttonModelData.action )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "icon" ), buttonModelData.icon )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "baseLeaderboard" ), buttonModelData.baseLeaderboard )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "sortColumn" ), buttonModelData.sortColumn )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "timeFrame" ), buttonModelData.timeFrame )
			end
			list:subscribeToModel( list.leaderboardMakerStateModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return #list.buttons
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.buttons[index].properties
		end,
		getItem = function ( controller, list, index )
			return list.buttons[index].model
		end
	},
	LeaderboardHeader = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local leaderboardModel = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
			local leaderboardHeaderModel = Engine.CreateModel( leaderboardModel, "header" )
			local numFixedCols = 3
			local maxDataCols = 5
			local numFixedColsObtained = numFixedCols - 1
			local dataColValues = {}
			local numDataCols, deltaDataCols = nil
			local headerIndex = 1
			local headersTable = Engine.GetLeaderboardHeaders( controller )
			if headersTable == nil then
				Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "baseLeaderboard" ), "" )
				Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "timeFrame" ), "" )
				return leaderboardHeaderModel
			end
			local header = headersTable.lbheaders
			if numFixedCols < tonumber( header.count ) then
				numDataCols = header.count - numFixedCols
			else
				numDataCols = 0
			end
			local deltaDataCols = maxDataCols - numDataCols
			for i = 1, numFixedColsObtained, 1 do
				dataColValues[i] = header[headerIndex]
				headerIndex = headerIndex + 1
			end
			for i = 1, maxDataCols, 1 do
				if i <= deltaDataCols then
					dataColValues[i + numFixedColsObtained] = ""
				else
					dataColValues[i + numFixedColsObtained] = header[headerIndex]
					headerIndex = headerIndex + 1
				end
			end
			local baseLeaderboardString = ""
			local timeFrameString = ""
			if HasSelectedGroup( nil, nil, {
				controller = controller
			} ) then
				local leaderboardIndex, sortColumn, timeFrame, isHardcore, isInitialized = Engine.GetGroupLeaderboardInfo()
				if isInitialized == true and leaderboardIndex > 0 then
					local leaderboardCoreNameData = CoD.Leaderboard_MP.GetLeaderboardCoreNameData( CoD.Leaderboard_MP.Leaderboards[leaderboardIndex][CoD.Leaderboard_MP.CoreName] )
					local timeFrameData = CoD.Leaderboard_MP.GetTimeFrameDataFromEnumValue( timeFrame )
					baseLeaderboardString = Engine.Localize( leaderboardCoreNameData.stringRef )
					timeFrameString = Engine.Localize( timeFrameData.stringRef )
				end
			end
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "baseLeaderboard" ), baseLeaderboardString )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "timeFrame" ), timeFrameString )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "position" ), dataColValues[1] )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "rank" ), Engine.Localize( "MENU_LB_LEVEL" ) )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "name" ), dataColValues[2] )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column0" ), dataColValues[3] )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column1" ), dataColValues[4] )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column2" ), dataColValues[5] )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column3" ), dataColValues[6] )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column4" ), dataColValues[7] )
			return leaderboardHeaderModel
		end
	},
	LeaderboardRows = {
		prepare = function ( controller, list, filter )
			list.buttons = {}
			local buttons = {}
			local leaderboardModel = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
			local leaderboardRowsModel = Engine.CreateModel( leaderboardModel, "rows" )
			local sortColumnColor = string.format( "%d %d %d", CoD.BOIIOrange.r * 255, CoD.BOIIOrange.g * 255, CoD.BOIIOrange.b * 255 )
			local defaultOtherColumnColor = string.format( "%d %d %d", CoD.white.r * 255, CoD.white.g * 255, CoD.white.b * 255 )
			local selfOtherColumnColor = string.format( "%d %d %d", CoD.playerYellow.r * 255, CoD.playerYellow.g * 255, CoD.playerYellow.b * 255 )
			local selfXuid = Engine.GetXUID64( controller )
			local data = Engine.GetLeaderboardData( controller )
			local numDefaultCols = 4
			local maxDataCols = 5
			for i = 1, #data, 1 do
				local datarow = data[i]
				local numDataCols = #datarow - numDefaultCols
				local deltaDataCols = maxDataCols - numDataCols
				local dataColValues = {}
				local dataColColors = {}
				local sortColumnColorSet = false
				local dataRowIndex = numDefaultCols + 1
				local otherColumnColor = defaultOtherColumnColor
				if selfXuid == datarow.xuid then
					otherColumnColor = selfOtherColumnColor
				end
				for i = 1, maxDataCols, 1 do
					if i <= deltaDataCols then
						dataColValues[i] = ""
						dataColColors[i] = otherColumnColor
					end
					dataColValues[i] = datarow[dataRowIndex].col
					dataRowIndex = dataRowIndex + 1
					if not sortColumnColorSet then
						dataColColors[i] = sortColumnColor
						sortColumnColorSet = true
					else
						dataColColors[i] = otherColumnColor
					end
				end
				local position = datarow[1].col
				if HasSelectedGroup( nil, nil, {
					controller = controller
				} ) then
					position = i
				end
				table.insert( buttons, {
					model = {
						position = position,
						rankIcon = datarow[2].col,
						rank = datarow[3].col,
						name = datarow[4].col,
						column0 = dataColValues[1],
						column0color = dataColColors[1],
						column1 = dataColValues[2],
						column1color = dataColColors[2],
						column2 = dataColValues[3],
						column2color = dataColColors[3],
						column3 = dataColValues[4],
						column3color = dataColColors[4],
						column4 = dataColValues[5],
						column4color = dataColColors[5],
						rowColor = otherColumnColor
					}
				} )
			end
			for index, buttonData in ipairs( buttons ) do
				local buttonModelData = buttonData.model
				local buttonProperties = buttonData.properties
				local buttonModel = Engine.CreateModel( leaderboardRowsModel, "buttonModel_" .. index )
				table.insert( list.buttons, {
					model = buttonModel,
					properties = buttonProperties
				} )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "position" ), buttonModelData.position )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "rankIcon" ), buttonModelData.rankIcon )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "rank" ), buttonModelData.rank )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "name" ), buttonModelData.name )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column0" ), tostring( buttonModelData.column0 ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column1" ), tostring( buttonModelData.column1 ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column2" ), tostring( buttonModelData.column2 ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column3" ), tostring( buttonModelData.column3 ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column4" ), tostring( buttonModelData.column4 ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column0color" ), buttonModelData.column0color )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column1color" ), buttonModelData.column1color )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column2color" ), buttonModelData.column2color )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column3color" ), buttonModelData.column3color )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "column4color" ), buttonModelData.column4color )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "rowColor" ), buttonModelData.rowColor )
			end
			local leaderboardIsUpdatingModel = Engine.CreateModel( leaderboardModel, "isUpdating" )
			list:subscribeToModel( leaderboardIsUpdatingModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return #list.buttons
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.buttons[index]
		end,
		getItem = function ( controller, list, index )
			return list.buttons[index].model
		end
	},
	TeamOperationSystem = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "teamOperationSystem" )
		end
	},
	RaidsPurchases = {
		prepare = function ( controller, list, filter )
			
		end,
		getCount = function ( list )
			return #DataSources.RaidsPurchases.Items
		end,
		getItem = function ( controller, list, index )
			return DataSources.RaidsPurchases.Items[index]
		end
	},
	Friends = {
		getCount = function ( list )
			return 10
		end,
		getItem = function ( controller, list, index )
			local row = {
				name = "Caezar",
				status = "Online",
				rank = "14",
				emblem = "menu_div_gold",
				rankIcon = "rank_com"
			}
			if index % 2 == 0 then
				row.name = "Bat35" .. index
				row.emblem = "menu_div_bronze"
			end
			if index % 3 == 0 then
				row.name = "FakeForAll" .. index
				row.emblem = "menu_div_silver"
				row.rankIcon = "rank_cpt"
				row.rank = 19
			end
			if index % 5 == 0 then
				row.name = "SuperGoat" .. index
				row.emblem = "menu_div_bronze"
				row.rankIcon = "rank_sgt"
				row.rank = 34
			end
			if index % 7 == 0 then
				row.name = "SuperGoat" .. index
				row.emblem = "menu_div_platinum"
				row.rankIcon = "rank_prestige02"
				row.rank = 50
			end
			local perControllerModel = Engine.GetModelForController( controller )
			local model = Engine.CreateModel( perControllerModel, "Friendz." .. index )
			for key, value in pairs( row ) do
				local valueModel = Engine.CreateModel( model, key )
				Engine.SetModelValue( valueModel, value )
			end
			return model
		end
	},
	FriendsMainTabList = ListHelper_SetupDataSource( "FriendsMainTabModel", function ( controller )
		local tabList = {
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
			tabList = {
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
		return tabList
	end
	 ),
	LobbyFriends = {
		prepare = function ( controller, list, filter )
			local perControllerModel = Engine.GetModelForController( controller )
			local friendsModel = Engine.GetModel( perControllerModel, "friends" )
			local tabModel = Engine.GetModel( friendsModel, "tab" )
			local tab = Engine.GetModelValue( tabModel )
			local listModelName = nil
			if tab == "friends" then
				listModelName = "unifiedListRoot"
			elseif tab == "recent" then
				listModelName = "rmpListRoot"
			elseif tab == "inbox" then
				listModelName = "inboxListRoot"
			elseif tab == "roster" then
				listModelName = "sgmListRoot"
			elseif tab == "grpmembers" then
				listModelName = "unifiedGroupMembersListRoot"
			else
				listModelName = "unifiedListRoot"
			end
			list.unifiedFriendModel = Engine.GetModel( Engine.GetGlobalModel(), listModelName )
			list.unifiedFriendCount = Engine.GetModel( list.unifiedFriendModel, "count" )
			list:unsubscribeFromAllModels()
			list.countSubscription = list:subscribeToModel( list.unifiedFriendCount, function ( model )
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			local count = Engine.GetModelValue( list.unifiedFriendCount )
			return count
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.unifiedFriendModel, "member" .. index - 1 )
		end
	},
	GameScore = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			local gameScoreModel = Engine.CreateModel( perControllerModel, "gameScore" )
			if not Engine.IsInGame() then
				local scoreboardInfo = Engine.GetScoreboardData( controller )
				Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "alliesScore" ), scoreboardInfo.scores.TEAM_ALLIES )
				Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "axisScore" ), scoreboardInfo.scores.TEAM_AXIS )
			end
			return gameScoreModel
		end
	},
	Equipment = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "Equipment" )
		end
	},
	ClientscriptDebugMenu = {
		prepare = function ( controller, list, filter )
			list.cscDebugMenuModel = list:getModel( Engine.GetPrimaryController(), "cscDebugMenu" )
			list.cscDebugMenuCountModel = Engine.GetModel( list.cscDebugMenuModel, "cscDebugMenuCount" )
			list:unsubscribeFromAllModels()
			list:subscribeToModel( list.cscDebugMenuCountModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return Engine.GetModelValue( list.cscDebugMenuCountModel )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.cscDebugMenuModel, "listItem" .. index - 1 )
		end
	},
	CPMapsList = ListHelper_SetupDataSource( "CPMapsList", function ( controller )
		local mapsList = {}
		local sortMaps = function ( a, b )
			return CoD.mapsTable[a].unique_id < CoD.mapsTable[b].unique_id
		end
		
		if Engine.IsCampaignModeZombies() == true then
			local classified = false
			for id, mapData in LUI.IterateTableBySortedKeys( CoD.mapsTable, sortMaps, nil ) do
				if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES and mapData.dlc_pack ~= -1 then
					local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
					local allMapsUnlocked = currentStats.allMapsUnlocked:get()
					local completed = Engine.GetDStat( controller, "PlayerStatsByMap", mapData.rootMapName, "hasBeenCompleted" )
					local completedDifficultyAlpha = 0
					local completedDifficultyIcon = "playlist_sp_recr"
					if allMapsUnlocked ~= 1 and completed ~= 1 then
						classified = true
					end
					if currentStats.PlayerStatsByMap[id] and not classified then
						local completedDifficulty = currentStats.PlayerStatsByMap[id].highestStats.HIGHEST_DIFFICULTY:get()
						completedDifficulty = completedDifficulty - 1
						if completedDifficulty >= 0 then
							completedDifficultyAlpha = 1
							completedDifficultyIcon = CoD.DIFFICULTY_ICON[completedDifficulty]
						end
					end
					if mapData.isSubLevel == false then
						table.insert( mapsList, {
							models = {
								displayText = Engine.Localize( mapData.mapNameCaps ),
								Image = mapData.previewImage,
								mapName = mapData.mapName,
								mapLocation = mapData.mapLocation,
								mapDescription = mapData.mapDescription,
								bestTime = 0,
								bestScore = 0,
								completedDifficultyAlpha = completedDifficultyAlpha,
								completedDifficulty = completedDifficultyIcon,
								classified = classified
							},
							properties = {
								mapId = id,
								classified = classified,
								collectiblesFound = 0,
								collectiblesTotal = 0
							}
						} )
					end
				end
			end
		else
			local classified = false
			for id, mapData in LUI.IterateTableBySortedKeys( CoD.mapsTable, sortMaps, nil ) do
				if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT and mapData.dlc_pack ~= -1 then
					local collectibleCount = 0
					local collectedCollectibleCount = 0
					if mapData.collectibles then
						local iteratedList = Engine.GetAssetList( mapData.collectibles )
						if iteratedList ~= nil then
							collectibleCount = #iteratedList
							for i = 0, collectibleCount - 1, 1 do
								if Engine.ClientHasCollectible( controller, id, i ) then
									collectedCollectibleCount = collectedCollectibleCount + 1
								end
							end
						end
					end
					local map_name_without_number = id
					if string.match( map_name_without_number, "[0-9]$" ) ~= nil then
						map_name_without_number = string.sub( map_name_without_number, 0, string.len( map_name_without_number ) - 1 )
					end
					local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
					local allMapsUnlocked = currentStats.allMapsUnlocked:get()
					local completed = Engine.GetDStat( controller, "PlayerStatsByMap", id, "hasBeenCompleted" )
					local completedDifficultyAlpha = 0
					local completedDifficultyIcon = "playlist_sp_recr"
					if allMapsUnlocked ~= 1 and completed ~= 1 then
						classified = true
					end
					if currentStats.PlayerStatsByMap[id] and not classified then
						local completedDifficulty = currentStats.PlayerStatsByMap[id].highestStats.HIGHEST_DIFFICULTY:get()
						completedDifficulty = completedDifficulty - 1
						if completedDifficulty >= 0 then
							completedDifficultyAlpha = 1
							completedDifficultyIcon = CoD.DIFFICULTY_ICON[completedDifficulty]
						end
					end
					if mapData.isSubLevel == false then
						table.insert( mapsList, {
							models = {
								displayText = Engine.Localize( mapData.mapNameCaps ),
								Image = mapData.previewImage,
								mapName = mapData.mapName,
								mapLocation = mapData.mapLocation,
								mapDescription = mapData.mapDescription,
								bestTime = 0,
								bestScore = 0,
								completedDifficultyAlpha = completedDifficultyAlpha,
								completedDifficulty = completedDifficultyIcon,
								classified = classified
							},
							properties = {
								mapId = id,
								classified = classified,
								collectiblesFound = collectedCollectibleCount,
								collectiblesTotal = collectibleCount
							}
						} )
					end
				end
			end
		end
		return mapsList
	end
	 ),
	ZMMapsList = ListHelper_SetupDataSource( "ZMMapsList", function ( controller )
		local mapsList = {}
		local sortMaps = function ( a, b )
			return CoD.mapsTable[a].unique_id < CoD.mapsTable[b].unique_id
		end
		
		for id, mapData in LUI.IterateTableBySortedKeys( CoD.mapsTable, sortMaps, nil ) do
			if mapData.session_mode == Enum.eModes.MODE_ZOMBIES and mapData.dlc_pack ~= -1 then
				table.insert( mapsList, {
					models = {
						displayText = Engine.Localize( mapData.mapNameCaps ),
						Image = mapData.previewImage,
						mapName = mapData.mapName,
						mapLocation = mapData.mapLocation,
						mapDescription = mapData.mapDescription,
						bestTime = 0,
						bestScore = 0
					},
					properties = {
						mapId = id
					}
				} )
			end
		end
		return mapsList
	end
	 ),
	CPPublicGameSelectionList = ListHelper_SetupDataSource( "CPPublicGameSelectionList", function ( controller )
		local listTable = {}
		table.insert( listTable, {
			models = {
				displayText = "MENU_PLAY_ANY_MISSION_CAPS",
				Image = "t7_menu_cp_front_end_loadscreen_cairo_ramses",
				action = CPSelectPublicGame,
				param = "anyMission",
				mapInfoVis = 0,
				infoText = "MENU_PLAY_ANY_MISSION_DESC",
				playerCountText = "MENU_X_PLAYERS_PLAYING"
			}
		} )
		local lastPlayedMap = "cp_mi_cairo_ramses"
		local mapData = CoD.mapsTable[lastPlayedMap]
		if mapData then
			table.insert( listTable, {
				models = {
					displayText = "MENU_PLAY_CURRENT_MISSION_CAPS",
					Image = mapData.previewImage,
					mapName = mapData.mapName,
					mapLocation = mapData.mapLocation,
					mapDescription = mapData.mapDescription,
					bestTime = 0,
					bestScore = 0,
					action = CPSelectPublicGame,
					param = "currMission",
					mapInfoVis = 1,
					infoText = "",
					playerCountText = "MENU_X_PLAYERS_PLAYING"
				}
			} )
		end
		table.insert( listTable, {
			models = {
				displayText = "MENU_PLAY_SPECIFIC_MISSION_CAPS",
				Image = "t7_menu_cp_front_end_loadscreen_cairo_ramses",
				action = CPSelectPublicGame,
				param = "specificMission",
				mapInfoVis = 0,
				infoText = "MENU_PLAY_SPECIFIC_MISSION_DESC",
				playerCountText = ""
			}
		} )
		return listTable
	end
	 ),
	CampaignSettings = {
		getModel = function ( controller )
			local cpSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
			Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( controller, "g_gameskill" )] ) )
			Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficultyIcon" ), CoD.DIFFICULTY_ICON[Engine.GetProfileVarInt( controller, "g_gameskill" )] )
			local selectedMap = Engine.GetModelValue( Engine.CreateModel( cpSettingsModel, "selectedMap" ) )
			if selectedMap == nil then
				Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "selectedMap" ), "cp_mi_eth_prologue" )
			end
			return cpSettingsModel
		end
	},
	ZMSettings = {
		getModel = function ( controller )
			local zmSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "ZMSettings" )
			return zmSettingsModel
		end
	},
	CampaignMissionList = {
		prepare = function ( controller, list, filter )
			list.missionList = {}
			local count = Engine.TableLookup( controller, CoD.protoMapsTable, 0, "mapCount", 1 )
			local missionLevelModel = Engine.CreateModel( Engine.GetGlobalModel(), "MissionLevels" )
			for i = 1, count, 1 do
				local index = i - 1 .. ""
				local devName = Engine.TableLookup( controller, CoD.protoMapsTable, 3, index, 0 )
				local locName = Engine.TableLookup( controller, CoD.protoMapsTable, 3, index, 1 )
				local imageName = Engine.TableLookup( controller, CoD.protoMapsTable, 3, index, 2 )
				local desc = Engine.TableLookup( controller, CoD.protoMapsTable, 3, index, 4 )
				local model = Engine.CreateModel( missionLevelModel, index )
				Engine.SetModelValue( Engine.CreateModel( model, "devName" ), devName .. "" )
				Engine.SetModelValue( Engine.CreateModel( model, "locName" ), locName .. "" )
				Engine.SetModelValue( Engine.CreateModel( model, "imagename" ), imageName .. "" )
				Engine.SetModelValue( Engine.CreateModel( model, "desc" ), desc .. "" )
				table.insert( list.missionList, model )
			end
		end,
		getCount = function ( list )
			return #list.missionList
		end,
		getItem = function ( controller, list, index )
			return list.missionList[index]
		end
	},
	SideMissionSelectList = {
		prepare = function ( controller, list, filter )
			list.sideMissionList = {}
			local sideMissionLevelModel = Engine.CreateModel( Engine.GetGlobalModel(), "SideMissions" )
			local missionsTable = Engine.GetSideMissionList()
			for index, data in pairs( missionsTable ) do
				local model = Engine.CreateModel( sideMissionLevelModel, index )
				Engine.SetModelValue( Engine.CreateModel( model, "missionName" ), Engine.Localize( data.displayNameRef ) )
				Engine.SetModelValue( Engine.CreateModel( model, "missionTypeInternal" ), "coop" )
				Engine.SetModelValue( Engine.CreateModel( model, "missionTypeDisplay" ), "COOP" )
				Engine.SetModelValue( Engine.CreateModel( model, "desc" ), Engine.Localize( data.descriptionRef ) )
				Engine.SetModelValue( Engine.CreateModel( model, "mapName" ), data.name )
				Engine.SetModelValue( Engine.CreateModel( model, "missionIndex" ), data.id )
				Engine.SetModelValue( Engine.CreateModel( model, "lighting" ), 0 )
				table.insert( list.sideMissionList, model )
			end
		end,
		getCount = function ( list )
			return #list.sideMissionList
		end,
		getItem = function ( controller, list, index )
			return list.sideMissionList[index]
		end
	},
	LocalServer = {
		prepare = function ( controller, list, filter )
			list.baseModel = Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" )
			list.countModel = Engine.GetModel( list.baseModel, "count" )
			if list.countSubscription then
				list:removeSubscription( list.countSubscription )
			end
			list.countSubscription = list:subscribeToModel( list.countModel, function ()
				RefreshListFindSelectedXuid( controller, list )
			end, false )
		end,
		getCount = function ( list )
			return Engine.GetModelValue( list.countModel )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.baseModel, "server" .. index - 1 )
		end
	},
	LocalServerPlayer = {
		prepare = function ( controller, list, filter )
			list.playerList = {}
			local serverModel = Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" )
			list.selectedServerModel = Engine.CreateModel( serverModel, "selectedServer" )
			local index = Engine.GetModelValue( list.selectedServerModel )
			if index ~= nil then
				list.playerList = Engine.LobbyServerListGetClientList( index )
				if list.playerList ~= nil then
					for index, player in pairs( list.playerList ) do
						local playerModel = Engine.CreateModel( serverModel, "playerModel_" .. index )
						list.playerList[index].model = playerModel
						Engine.SetModelValue( Engine.CreateModel( playerModel, "xuid" ), player.xuid )
						Engine.SetModelValue( Engine.CreateModel( playerModel, "gamertag" ), player.gamertag )
						Engine.SetModelValue( Engine.CreateModel( playerModel, "isLeader" ), player.isLeader )
					end
				else
					list.playerList = {}
				end
			end
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.playerList[index]
		end,
		getCount = function ( list )
			return #list.playerList
		end,
		getItem = function ( controller, list, index )
			return list.playerList[index].model
		end
	},
	XPProgressionBar = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local stats = {
				currentStats = CoD.GetPlayerStats( controller ),
				currentRank = REG1.currentStats.PlayerStatsList.RANK.StatValue:get(),
				displayLevelForCurrRank = Engine.TableLookup( controller, CoD.rankTable, CoD.XPBar.RankIdCol, REG1.currentRank, CoD.XPBar.RankDisplayLevelCol ),
				currPrestige = REG1.currentStats.PlayerStatsList.PLEVEL.StatValue:get(),
				currRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, CoD.XPBar.RankIdCol, REG1.currentRank, REG1.currPrestige + 1 ),
				nextRank = REG1.currentRank + 1,
				displayLevelForNextRank = tonumber( REG1.displayLevelForCurrRank ) + 1,
				nextRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, CoD.XPBar.RankIdCol, REG1.nextRank, REG1.currPrestige + 1 ),
				currRankXP = REG1.currentStats.PlayerStatsList.RANKXP.StatValue:get(),
				minXPForCurrRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.XPBar.RankIdCol, REG1.currentRank, CoD.XPBar.RankTableColMinXP ) ),
				maxXPForCurrRank = tonumber( Engine.TableLookup( controller, CoD.rankTable, CoD.XPBar.RankIdCol, REG1.currentRank, CoD.XPBar.RankTableColMaxXP ) ),
				prestigeNext = CoD.PrestigeNext( controller ),
				xpToNextRank = REG1.maxXPForCurrRank - REG1.currRankXP,
				relativeRankXP = REG1.currRankXP - REG1.minXPForCurrRank,
				progressPct = REG1.relativeRankXP / (REG1.maxXPForCurrRank - REG1.minXPForCurrRank)
			}
			local perControllerModel = Engine.GetModelForController( controller )
			local xpModel = Engine.CreateModel( perControllerModel, "XPProgressionBar" )
			Engine.SetModelValue( Engine.CreateModel( xpModel, "currentRank" ), stats.displayLevelForCurrRank )
			Engine.SetModelValue( Engine.CreateModel( xpModel, "currentRankIcon" ), stats.currRankIconMaterialName )
			Engine.SetModelValue( Engine.CreateModel( xpModel, "nextRank" ), stats.displayLevelForNextRank )
			Engine.SetModelValue( Engine.CreateModel( xpModel, "nextRankIcon" ), stats.nextRankIconMaterialName )
			Engine.SetModelValue( Engine.CreateModel( xpModel, "currentXP" ), stats.currRankXP )
			Engine.SetModelValue( Engine.CreateModel( xpModel, "xpToNextRank" ), stats.xpToNextRank )
			Engine.SetModelValue( Engine.CreateModel( xpModel, "progress" ), stats.progressPct )
			return xpModel
		end
	},
	GadgetModList = {
		prepare = function ( controller, list, filter )
			
		end,
		getCount = function ( list )
			if list.baseModel then
				local countModel = Engine.GetModel( list.baseModel, "gadgetAttachments.count" )
				if countModel then
					return Engine.GetModelValue( countModel )
				end
			end
			return 0
		end,
		getItem = function ( controller, list, index )
			if list.baseModel then
				local itemModel = Engine.GetModel( list.baseModel, "gadgetAttachments." .. index )
				if itemModel then
					return itemModel
				end
			end
			return nil
		end
	},
	Rewards = {
		prepare = function ( controller, list, filter )
			list.rewardsList = {}
			local rewardListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Rewards" )
			local stats = CoD.GetPlayerStats( controller )
			if not stats then
				return 
			end
			stats = stats.AfterActionReportStats
			local currentClientIndex = -1
			local currentClientGamertag = Engine.GetSelfGamertag( controller )
			for idx = 0, 3, 1 do
				if stats.playerStats[idx].name:get() == currentClientGamertag then
					currentClientIndex = idx
				end
			end
			if currentClientIndex == -1 then
				return 
			end
			local currentRank = stats.playerStats[currentClientIndex].curRank:get()
			local previousRank = stats.playerStats[currentClientIndex].prvRank:get()
			local recentlyUnlockedItems = {}
			local count = 0
			if previousRank < currentRank then
				recentlyUnlockedItems[count] = {}
				recentlyUnlockedItems[count].itemName = "Promotion"
				recentlyUnlockedItems[count].itemImage = Engine.GetRankIcon( currentRank ) .. "_lrg"
				recentlyUnlockedItems[count].itemDesc = "Congratulations, you have been promoted!"
				recentlyUnlockedItems[count].itemDesc2 = ""
				count = count + 1
				recentlyUnlockedItems[count] = {}
				recentlyUnlockedItems[count].itemName = "Tech Spec - " .. tostring( currentRank - previousRank ) .. "X"
				recentlyUnlockedItems[count].itemImage = "t7_menu_tech_spec_token"
				recentlyUnlockedItems[count].itemDesc = "Unlock the weapon or gadget of your choice with this Tech spec."
				recentlyUnlockedItems[count].itemDesc2 = "Promotion award for reaching level " .. tostring( currentRank + 1 ) .. "."
				count = count + 1
				local unlockLevelCol = 10
				local weaponsUnlocked = Engine.TableFindRows( CoD.statsTable, unlockLevelCol, tostring( currentRank + 1 ) )
				if weaponsUnlocked ~= nil then
					local weaponMatCol = 6
					local weaponStringRefCol = 3
					local unlockedWeaponIndex = weaponsUnlocked[1]
					local unlockedWeaponName = Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.statsTable, unlockedWeaponIndex, weaponStringRefCol ) )
					local unlockedWeaponImage = Engine.TableLookupGetColumnValueForRow( CoD.statsTable, unlockedWeaponIndex, weaponMatCol )
					recentlyUnlockedItems[count] = {}
					recentlyUnlockedItems[count].itemName = unlockedWeaponName .. " Blueprint"
					recentlyUnlockedItems[count].itemImage = unlockedWeaponImage .. "_big"
					recentlyUnlockedItems[count].itemDesc = "This weapon is now available for unlock the Armory."
					recentlyUnlockedItems[count].itemDesc2 = "Promotion award for reaching level " .. tostring( currentRank ) .. "."
					count = count + 1
				end
			end
			if stats.matchWon:get() ~= 0 then
				recentlyUnlockedItems[count] = {}
				recentlyUnlockedItems[count].itemName = "Mod Spec"
				recentlyUnlockedItems[count].itemImage = "t7_menu_mod_spec_token"
				recentlyUnlockedItems[count].itemDesc = "Upgrade a weapon or gadget of your choice with this Mod Spec."
				recentlyUnlockedItems[count].itemDesc2 = "Awarded for completing your Mission."
				count = count + 1
				Engine.SetModelValue( Engine.CreateModel( rewardListModel, "matchResult" ), Engine.Localize( "MENU_MISSION_SUCCESS_CAPS" ) )
			else
				Engine.SetModelValue( Engine.CreateModel( rewardListModel, "matchResult" ), Engine.Localize( "MENU_MISSION_FAILED" ) )
			end
			local recentlyUnlockedItemCount = #recentlyUnlockedItems
			for index = 0, #recentlyUnlockedItems, 1 do
				local currItem = recentlyUnlockedItems[index]
				if currItem ~= nil then
					local rewardName = currItem.itemName .. ""
					local rewardImage = currItem.itemImage .. ""
					local rewardDesc1 = currItem.itemDesc .. ""
					local rewardDesc2 = currItem.itemDesc2 .. ""
					local model = Engine.CreateModel( rewardListModel, index )
					Engine.SetModelValue( Engine.CreateModel( model, "rewardName" ), rewardName )
					Engine.SetModelValue( Engine.CreateModel( model, "rewardImage" ), rewardImage )
					Engine.SetModelValue( Engine.CreateModel( model, "rewardDesc1" ), rewardDesc1 )
					Engine.SetModelValue( Engine.CreateModel( model, "rewardDesc2" ), rewardDesc2 )
					table.insert( list.rewardsList, model )
				end
			end
		end,
		getCount = function ( list )
			return #list.rewardsList
		end,
		getItem = function ( controller, list, index )
			return list.rewardsList[index]
		end
	},
	AARStats = {
		prepare = function ( controller, list, filter )
			list.AARStatsList = {}
			local aarStatsListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AARStats" )
			local f317_local0 = CoD.GetPlayerStats( controller )
			local stats = f317_local0.AfterActionReportStats
			local aarStats = {}
			for playerIndex = 0, Dvar.com_maxclients:get() - 1, 1 do
				if stats.playerStats[playerIndex].isActive:get() == 1 then
					aarStats[playerIndex] = {}
					aarStats[playerIndex].name = stats.playerStats[playerIndex].name:get()
					aarStats[playerIndex].rank = stats.playerStats[playerIndex].curRank:get() + 1
					aarStats[playerIndex].rankIcon = Engine.GetRankIcon( stats.playerStats[playerIndex].curRank:get() )
					aarStats[playerIndex].kills = stats.playerStats[playerIndex].kills:get()
					aarStats[playerIndex].assists = stats.playerStats[playerIndex].assists:get()
					aarStats[playerIndex].medalName1 = ""
					aarStats[playerIndex].medalImage1 = ""
					aarStats[playerIndex].medalName2 = ""
					aarStats[playerIndex].medalImage2 = ""
					aarStats[playerIndex].medalName3 = ""
					aarStats[playerIndex].medalImage3 = ""
					if stats.playerStats[playerIndex].medals[0]:get() == playerIndex then
						aarStats[playerIndex].medalName1 = "Kill Master"
						aarStats[playerIndex].medalImage1 = "hud_medals_default"
					end
					if stats.playerStats[playerIndex].medals[1]:get() == playerIndex then
						aarStats[playerIndex].medalName2 = "Assist Master"
						aarStats[playerIndex].medalImage2 = "hud_medals_revenge"
					end
					if stats.playerStats[playerIndex].medals[2]:get() == playerIndex then
						aarStats[playerIndex].medalName3 = "Revive Master"
						aarStats[playerIndex].medalImage3 = "hud_medals_afterlife"
					end
				end
			end
			for index, currItem in pairs( aarStats ) do
				local playerName = currItem.name .. ""
				local playerRank = currItem.rank .. ""
				local playerRankIcon = currItem.rankIcon .. ""
				local playerKills = currItem.kills .. ""
				local playerAssists = currItem.assists .. ""
				local medalName1 = currItem.medalName1 .. ""
				local medalImage1 = currItem.medalImage1 .. ""
				local medalName2 = currItem.medalName2 .. ""
				local medalImage2 = currItem.medalImage2 .. ""
				local medalName3 = currItem.medalName3 .. ""
				local medalImage3 = currItem.medalImage3 .. ""
				local model = Engine.CreateModel( aarStatsListModel, index )
				Engine.SetModelValue( Engine.CreateModel( model, "playerName" ), playerName )
				Engine.SetModelValue( Engine.CreateModel( model, "playerRank" ), playerRank )
				Engine.SetModelValue( Engine.CreateModel( model, "playerRankIcon" ), playerRankIcon )
				Engine.SetModelValue( Engine.CreateModel( model, "playerKills" ), playerKills )
				Engine.SetModelValue( Engine.CreateModel( model, "playerAssists" ), playerAssists )
				Engine.SetModelValue( Engine.CreateModel( model, "medalName1" ), medalName1 )
				Engine.SetModelValue( Engine.CreateModel( model, "medalImage1" ), medalImage1 )
				Engine.SetModelValue( Engine.CreateModel( model, "medalName2" ), medalName2 )
				Engine.SetModelValue( Engine.CreateModel( model, "medalImage2" ), medalImage2 )
				Engine.SetModelValue( Engine.CreateModel( model, "medalName3" ), medalName3 )
				Engine.SetModelValue( Engine.CreateModel( model, "medalImage3" ), medalImage3 )
				table.insert( list.AARStatsList, model )
			end
		end,
		getCount = function ( list )
			return #list.AARStatsList
		end,
		getItem = function ( controller, list, index )
			return list.AARStatsList[index]
		end
	},
	AARMedalsList = {
		prepare = function ( controller, list, filter )
			local xpColumn = Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, Engine.GetCurrentGameType() .. " XP" )
			local medalsData = Engine.GetRecentMedals( controller, xpColumn )
			list.count = 0
			if medalsData and #medalsData > 0 then
				local medalsListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "aarMedalsList" )
				table.sort( medalsData, CoD.AARUtility.SortMedals )
				for index, medalData in ipairs( medalsData ) do
					local currMedalModel = Engine.CreateModel( medalsListModel, index .. "" )
					local medalHitCount = medalData.value
					local medalIndex = medalData.row
					local f320_local4 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, xpColumn ) )
					Engine.SetModelValue( Engine.CreateModel( currMedalModel, "medalIndex" ), medalIndex )
					Engine.SetModelValue( Engine.CreateModel( currMedalModel, "medalTimesObtained" ), medalHitCount )
					local f320_local3 = 1
					local xpScaleModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarStats.xpScale" )
					if xpScaleModel then
						f320_local3 = Engine.GetModelValue( xpScaleModel )
					end
					f320_local4 = f320_local4 * f320_local3
					if medalHitCount > 1 then
						Engine.SetModelValue( Engine.CreateModel( currMedalModel, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f320_local4 * tonumber( medalHitCount ) ) )
					else
						Engine.SetModelValue( Engine.CreateModel( currMedalModel, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f320_local4 ) )
					end
				end
				if medalsData and #medalsData > 0 then
					list.count = #medalsData
				end
			end
		end,
		getCount = function ( list )
			return list.count
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( Engine.GetModelForController( controller ), "aarMedalsList" .. "." .. index )
		end
	},
	SubobjectivesList = {
		prepare = function ( controller, list, filter )
			list.createWidgetFromDataSource = function ( self, controller, dataItemModel )
				local itemWidget = LUI.GridLayout.createWidgetFromDataSource( self, controller, dataItemModel )
				return itemWidget
			end
			
			list.updateLayout = function ( self, time )
				LUI.GridLayout.updateLayout( self, time )
				self:dispatchEventToParent( "child_size_updated" )
			end
			
		end,
		getCount = function ( list )
			if not list.subobjectiveListModel then
				return 0
			else
				return DataSources.SubobjectivesList.getCountFromModel( list.subobjectiveListModel )
			end
		end,
		getItem = function ( controller, list, index )
			if not list.subobjectiveListModel then
				return nil
			else
				return Engine.GetModel( list.subobjectiveListModel, index )
			end
		end,
		getCountFromModel = function ( model )
			local countModel = Engine.GetModel( model, "count" )
			if countModel then
				return Engine.GetModelValue( countModel )
			else
				return 0
			end
		end,
		addSubObjective = function ( model, text, status )
			local index = DataSources.SubobjectivesList.getCountFromModel( model ) + 1
			local countModel = Engine.GetModel( model, "count" )
			if countModel then
				Engine.SetModelValue( countModel, index )
			end
			local newItemModel = Engine.CreateModel( model, index )
			Engine.SetModelValue( Engine.CreateModel( newItemModel, "text" ), text )
			Engine.SetModelValue( Engine.CreateModel( newItemModel, "status" ), status )
		end
	},
	ObjectivesList = {
		prepare = function ( controller, list, filter )
			list:registerEventHandler( "child_size_updated", function ( self, event )
				self:updateLayout( 0 )
				return true
			end )
			list.createWidgetFromDataSource = function ( self, controller, dataItemModel )
				local itemWidget = LUI.GridLayout.createWidgetFromDataSource( self, controller, dataItemModel )
				itemWidget.internal.subobjectivesList.subobjectiveListModel = Engine.GetModel( dataItemModel, "subobjectivesList" )
				itemWidget.internal.subobjectivesList:updateDataSource()
				return itemWidget
			end
			
			list.updateLayout = function ( self, time )
				LUI.GridLayout.updateLayout( self, time )
				self:dispatchEventToParent( "child_size_updated" )
			end
			
		end,
		getCount = function ( list )
			if not list.objectiveListModel then
				return 0
			else
				return DataSources.ObjectivesList.getCountFromModel( list.objectiveListModel )
			end
		end,
		getItem = function ( controller, list, index )
			if not list.objectiveListModel then
				return nil
			else
				return Engine.GetModel( list.objectiveListModel, index )
			end
		end,
		getCountFromModel = function ( model )
			local countModel = Engine.GetModel( model, "count" )
			if countModel then
				return Engine.GetModelValue( countModel )
			else
				return 0
			end
		end,
		addObjective = function ( model, displayText, status, subobjectives )
			local index = DataSources.ObjectivesList.getCountFromModel( model ) + 1
			local countModel = Engine.GetModel( model, "count" )
			if countModel then
				Engine.SetModelValue( countModel, index )
			end
			local newItemModel = Engine.CreateModel( model, index )
			Engine.SetModelValue( Engine.CreateModel( newItemModel, "displayText" ), Engine.Localize( displayText ) )
			Engine.SetModelValue( Engine.CreateModel( newItemModel, "status" ), status )
			local subobjectivesModel = Engine.CreateModel( newItemModel, "subobjectivesList" )
			Engine.SetModelValue( Engine.CreateModel( subobjectivesModel, "count" ), 0 )
			for index, subobjective in ipairs( subobjectives ) do
				DataSources.SubobjectivesList.addSubObjective( subobjectivesModel, Engine.Localize( subobjective.desc ), subobjective.status )
			end
		end
	},
	CurrentObjectivesList = {
		prepare = function ( controller, list, filter )
			list.objectiveOrder = {
				"active",
				"done"
			}
			list.objectiveCategories = {}
			list:registerEventHandler( "child_size_updated", function ( self, event )
				self:updateLayout( 0 )
				return true
			end )
			list.createWidgetFromDataSource = function ( self, controller, dataItemModel )
				local itemWidget = LUI.GridLayout.createWidgetFromDataSource( self, controller, dataItemModel )
				itemWidget.internal.objectivesList.objectiveListModel = Engine.GetModel( dataItemModel, "objectivesList" )
				itemWidget.internal.objectivesList:updateDataSource()
				return itemWidget
			end
			
			if CoD.isCampaign then
				local objective_table = Engine.GetPlayerObjectives( controller )
				if objective_table == nil then
					return 
				end
				local overallObjectivesTable = {}
				for index, objective in CoD.pairsByKeys( objective_table ) do
					if objective.status ~= "invisible" and objective.objective_desc ~= nil and objective.objective_desc ~= "" then
						local activeStatus = "done"
						if objective.status == "current" or objective.status == "active" or objective.status == "failed" then
							activeStatus = "active"
						end
						if not overallObjectivesTable[objective.objective_desc] then
							overallObjectivesTable[objective.objective_desc] = {
								desc = objective.objective_desc,
								status = activeStatus,
								subobjectives = {}
							}
						end
						local objTable = overallObjectivesTable[objective.objective_desc]
						if objective.subobjective_desc ~= "" then
							table.insert( objTable.subobjectives, {
								status = objective.status,
								desc = objective.subobjective_desc
							} )
						end
						if objTable.status == "done" and activeStatus == "active" then
							objTable.status = "active"
						end
					end
				end
				local statusSortedTable = {}
				for index, objectiveTable in CoD.pairsByKeys( overallObjectivesTable ) do
					if not statusSortedTable[objectiveTable.status] then
						statusSortedTable[objectiveTable.status] = {}
					end
					table.insert( statusSortedTable[objectiveTable.status], objectiveTable )
				end
				local objectivesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CurrentObjectivesList" )
				for status, statusTable in CoD.pairsByKeys( statusSortedTable ) do
					local statusModel = Engine.CreateModel( objectivesModel, status )
					Engine.SetModelValue( Engine.CreateModel( statusModel, "status" ), status )
					Engine.SetModelValue( Engine.CreateModel( statusModel, "category" ), Engine.Localize( "MENU_" .. Engine.ToUpper( status ) .. "_OBJECTIVES_CAPS" ) )
					local objectivesListModel = Engine.CreateModel( statusModel, "objectivesList" )
					Engine.SetModelValue( Engine.CreateModel( objectivesListModel, "count" ), 0 )
					for index, objectiveTable in ipairs( statusTable ) do
						DataSources.ObjectivesList.addObjective( objectivesListModel, objectiveTable.desc, objectiveTable.status, objectiveTable.subobjectives )
					end
					list.objectiveCategories[status] = statusModel
				end
			else
				local objectivesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GameObjectiveList" )
				local gameModeModel = Engine.CreateModel( objectivesModel, "gameMode" )
				local gameMode = Engine.DvarString( nil, "g_gametype" )
				local gameModeName = Engine.Localize( "MPUI_" .. gameMode )
				local gameModeDesc = Engine.TableLookup( controller, CoD.gametypesTable, 0, 0, 1, gameMode, 3 )
				Engine.SetModelValue( Engine.CreateModel( gameModeModel, "status" ), "active" )
				Engine.SetModelValue( Engine.CreateModel( gameModeModel, "category" ), Engine.Localize( "GAME MODE" ) )
				local objectivesListModel = Engine.CreateModel( gameModeModel, "objectivesList" )
				Engine.SetModelValue( Engine.CreateModel( objectivesListModel, "count" ), 0 )
				DataSources.ObjectivesList.addObjective( objectivesListModel, gameModeName, "active", {
					{
						status = "description",
						desc = gameModeDesc
					}
				} )
				list.objectiveCategories.active = gameModeModel
			end
		end,
		getCount = function ( list )
			local count = 0
			for index, status in ipairs( list.objectiveOrder ) do
				if list.objectiveCategories[status] then
					count = count + 1
				end
			end
			return count
		end,
		getItem = function ( controller, list, index )
			local count = 0
			for item_index, status in ipairs( list.objectiveOrder ) do
				if list.objectiveCategories[status] and count + 1 == index then
					return list.objectiveCategories[status]
				end
			end
			return nil
		end
	},
	CodfuGlobal = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "CodfuGlobal" )
			Engine.CreateModel( model, "player1name" )
			Engine.CreateModel( model, "player2name" )
			Engine.CreateModel( model, "player1health" )
			Engine.CreateModel( model, "player2health" )
			return model
		end
	},
	DeadOpsArcadeGlobal = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal" )
			Engine.CreateModel( model, "redins" )
			Engine.CreateModel( model, "countdown" )
			Engine.CreateModel( model, "gbanner" )
			Engine.CreateModel( model, "grgb1" )
			Engine.CreateModel( model, "grgb2" )
			Engine.CreateModel( model, "grgb3" )
			Engine.CreateModel( model, "gtxt0" )
			Engine.CreateModel( model, "gpr0" )
			Engine.CreateModel( model, "gpr1" )
			Engine.CreateModel( model, "gpr2" )
			Engine.CreateModel( model, "gpr3" )
			return model
		end
	},
	DeadOpsArcadePlayers = {
		updateModelsForClient = function ( controller, clientNum )
			local luaClientNum = clientNum + 1
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadePlayers" )
			local playerModel = Engine.GetModel( model, "player" .. luaClientNum )
			if playerModel ~= nil then
				local clientData = Engine.GetPlayerListData( controller, clientNum )
				if clientData.playerName ~= nil and clientData.playerConnected then
					Engine.SetModelValue( Engine.GetModel( playerModel, "name" ), clientData.playerName )
				else
					Engine.SetModelValue( Engine.GetModel( playerModel, "name" ), "" )
				end
			end
		end,
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadePlayers" )
			for playerNum = 1, 4, 1 do
				local playerModel = Engine.GetModel( model, "player" .. playerNum )
				if playerModel == nil then
					playerModel = Engine.CreateModel( model, "player" .. playerNum )
					Engine.CreateModel( playerModel, "name" )
					Engine.CreateModel( playerModel, "lives" )
					Engine.CreateModel( playerModel, "bombs" )
					Engine.CreateModel( playerModel, "boosts" )
					Engine.CreateModel( playerModel, "score" )
					Engine.CreateModel( playerModel, "multiplier" )
					Engine.CreateModel( playerModel, "xbar" )
					Engine.CreateModel( playerModel, "bulletbar" )
					Engine.CreateModel( playerModel, "ribbon" )
					Engine.CreateModel( playerModel, "tank_rgb" )
					Engine.CreateModel( playerModel, "tank_health" )
					Engine.CreateModel( playerModel, "tank_name" )
					Engine.CreateModel( playerModel, "tank_fuel" )
					Engine.CreateModel( playerModel, "tank_msg" )
					Engine.CreateModel( playerModel, "generic_txt" )
					Engine.CreateModel( playerModel, "gpr" )
					Engine.CreateModel( playerModel, "gpr2" )
					Engine.CreateModel( playerModel, "weaplevel1" )
					Engine.CreateModel( playerModel, "weaplevel2" )
					DataSources.DeadOpsArcadePlayers.updateModelsForClient( controller, playerNum - 1 )
				end
			end
			return model
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
		prepare = function ( controller, list, filter )
			list.playerListInfoList = {}
			list.playerListInfoOrder = {}
			local perControllerModel = Engine.GetModelForController( controller )
			local playerListListModel = Engine.CreateModel( perControllerModel, "PlayerList" )
			local nextNonLocalIndex = 2
			local ourClientNum = Engine.GetClientNum( controller )
			for clientIndex = 0, Dvar.com_maxclients:get() - 1, 1 do
				local clientData = Engine.GetPlayerListData( controller, clientIndex )
				local model = Engine.CreateModel( playerListListModel, clientIndex )
				for playerListItem, modelItem in pairs( DataSources.PlayerList.modelLinks ) do
					Engine.SetModelValue( Engine.CreateModel( model, modelItem ), clientData[playerListItem] )
				end
				Engine.SetModelValue( Engine.CreateModel( model, "objectiveIcon" ), "" )
				list.playerListInfoList[clientIndex + 1] = model
				if clientIndex == Engine.GetClientNum( controller ) then
					list.playerListInfoOrder[1] = clientIndex + 1
				else
					list.playerListInfoOrder[nextNonLocalIndex] = clientIndex + 1
					nextNonLocalIndex = nextNonLocalIndex + 1
				end
			end
			local clientIndex = function ( controller, clientNum )
				DataSources.PlayerList.updateModelsForClient( controller, list, clientNum )
			end
			
			if not list.playerConnectedSubscription then
				list.playerConnectedSubscription = list:subscribeToModel( Engine.GetModel( perControllerModel, "playerConnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						clientIndex( controller, modelValue )
					end
				end, false )
			end
			if not list.playerDisconnectedSubscription then
				list.playerDisconnectedSubscription = list:subscribeToModel( Engine.GetModel( perControllerModel, "playerDisconnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						clientIndex( controller, modelValue )
					end
				end, false )
			end
		end,
		updateModelsForClient = function ( controller, list, clientNum )
			local clientModel = DataSources.PlayerList.getModelForPlayer( controller, list, clientNum )
			if clientModel ~= nil then
				local clientData = Engine.GetPlayerListData( controller, clientNum )
				for playerListItem, modelItem in pairs( DataSources.PlayerList.modelLinks ) do
					local itemModel = Engine.GetModel( clientModel, modelItem )
					if itemModel then
						Engine.SetModelValue( itemModel, clientData[playerListItem] )
					end
				end
				list:updateDataSource()
			end
		end,
		getCount = function ( list )
			local count = 0
			for playerIndex, playerModel in pairs( list.playerListInfoList ) do
				local connectedModel = Engine.GetModel( playerModel, "playerConnected" )
				if connectedModel then
					local connectedModelValue = Engine.GetModelValue( connectedModel )
					if connectedModelValue ~= 0 then
						count = count + 1
					end
				end
			end
			return count
		end,
		getItem = function ( controller, list, index )
			local count = 0
			for orderIndex = 1, Dvar.com_maxclients:get(), 1 do
				local clientIndex = list.playerListInfoOrder[orderIndex]
				local playerModel = list.playerListInfoList[clientIndex]
				local connectedModel = Engine.GetModel( playerModel, "playerConnected" )
				if connectedModel then
					local connectedModelValue = Engine.GetModelValue( connectedModel )
					if connectedModelValue ~= 0 and count + 1 == index then
						return playerModel
					end
				end
			end
			DebugPrint( "WARNING: returning invalid playerListInfoList row" )
			return list.playerListInfoList[list.playerListInfoOrder[0]]
		end,
		getModelForPlayer = function ( controller, list, index )
			return list.playerListInfoList[index + 1]
		end
	},
	PlayerListZM = {
		modelLinks = {
			playerName = "playerName",
			score = "playerScore",
			rankIcon = "playerRankIcon",
			rankNum = "rankNum",
			clanAbbrev = "clanAbbrev",
			clientNum = "clientNum",
			playerConnected = "playerConnected",
			zombiePlayerIcon = "zombiePlayerIcon"
		},
		prepare = function ( controller, list, filter )
			list.playerListInfoList = {}
			local perControllerModel = Engine.GetModelForController( controller )
			local playerListListModel = Engine.CreateModel( perControllerModel, "PlayerList" )
			local ourClientNum = Engine.GetClientNum( controller )
			local clientNumToArrayIndex = function ( clientNum, ourClientNum )
				if clientNum == ourClientNum then
					return 1
				elseif clientNum < ourClientNum then
					return 2 + clientNum
				else
					return 1 + clientNum
				end
			end
			
			for clientIndex = 0, Dvar.com_maxclients:get() - 1, 1 do
				local oneBasedListIndex = clientNumToArrayIndex( clientIndex, ourClientNum )
				local clientData = Engine.GetPlayerListData( controller, clientIndex )
				local model = Engine.CreateModel( playerListListModel, oneBasedListIndex - 1 )
				for playerListItem, modelItem in pairs( DataSources.PlayerListZM.modelLinks ) do
					Engine.SetModelValue( Engine.CreateModel( model, modelItem ), clientData[playerListItem] )
				end
				list.playerListInfoList[oneBasedListIndex] = model
			end
			local clientIndex = function ( controller, clientNum )
				DataSources.PlayerListZM.updateModelsForClient( controller, list, clientNum )
			end
			
			if not list.playerConnectedSubscription then
				list.playerConnectedSubscription = list:subscribeToModel( Engine.GetModel( perControllerModel, "playerConnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						clientIndex( controller, modelValue )
					end
				end, false )
			end
			if not list.playerDisconnectedSubscription then
				list.playerDisconnectedSubscription = list:subscribeToModel( Engine.GetModel( perControllerModel, "playerDisconnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						clientIndex( controller, modelValue )
					end
				end, false )
			end
		end,
		updateModelsForClient = function ( controller, list, clientNum )
			local clientModel = DataSources.PlayerListZM.getModelForPlayer( controller, list, clientNum )
			if clientModel ~= nil then
				local clientData = Engine.GetPlayerListData( controller, clientNum )
				for playerListItem, modelItem in pairs( DataSources.PlayerListZM.modelLinks ) do
					local itemModel = Engine.GetModel( clientModel, modelItem )
					if itemModel then
						Engine.SetModelValue( itemModel, clientData[playerListItem] )
					end
				end
				list:updateDataSource()
			end
		end,
		getCount = function ( list )
			local count = 0
			for playerIndex, playerModel in pairs( list.playerListInfoList ) do
				local connectedModel = Engine.GetModel( playerModel, "playerConnected" )
				if connectedModel and Engine.GetModelValue( connectedModel ) ~= 0 then
					count = count + 1
				end
			end
			return count
		end,
		getItem = function ( controller, list, index )
			return list.playerListInfoList[index]
		end,
		getModelForPlayer = function ( controller, list, index )
			for clientIndex = 1, Dvar.com_maxclients:get(), 1 do
				local playerModel = list.playerListInfoList[clientIndex]
				local clientNumModel = Engine.GetModel( playerModel, "clientNum" )
				if clientNumModel and clientNumModel == index then
					return playerModel
				end
			end
			DebugPrint( "WARNING: returning invalid playerListInfoList row" )
			return list.playerListInfoList[1]
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
		prepare = function ( controller, list, filter )
			if DataSources.RaidsPurchases.Model == nil then
				DataSources.RaidsPurchases.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.RaidsPurchases" )
				DataSources.RaidsPurchases.Items = {}
				local resourceTable = "gamedata/tables/cp/cp_sm_resources.csv"
				local resourceTableColumn = {
					scriptID = 0,
					cost = 1,
					title = 2,
					description = 3,
					icon = 4,
					active = 5
				}
				local activePurchaseItems = Engine.TableFindRows( resourceTable, resourceTableColumn.active, "1" )
				if activePurchaseItems ~= nil then
					for index = 1, #activePurchaseItems, 1 do
						local tableIndex = activePurchaseItems[index]
						DataSources.RaidsPurchases.Items[index] = Engine.CreateModel( DataSources.RaidsPurchases.Model, "item" .. index )
						local scriptID = Engine.TableGetColumnValueForRow( resourceTable, tableIndex, resourceTableColumn.scriptID )
						local name = Engine.TableGetColumnValueForRow( resourceTable, tableIndex, resourceTableColumn.title )
						local description = Engine.TableGetColumnValueForRow( resourceTable, tableIndex, resourceTableColumn.description )
						local image = Engine.TableGetColumnValueForRow( resourceTable, tableIndex, resourceTableColumn.icon )
						local cost = Engine.TableGetColumnValueForRow( resourceTable, tableIndex, resourceTableColumn.cost )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[index], "id" ), scriptID )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[index], "name" ), name )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[index], "displayName" ), Engine.Localize( name ) )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[index], "description" ), Engine.Localize( description ) )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[index], "enabledDescription" ), description )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[index], "image" ), image )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[index], "cost" ), cost )
					end
				end
			end
		end,
		getCount = function ( list )
			return #DataSources.RaidsPurchases.Items
		end,
		getItem = function ( controller, list, index )
			return DataSources.RaidsPurchases.Items[index]
		end
	},
	EmblemLayerList = {
		createGroup = function ( controller, layerNumber, groupIndex, totalLayers, customizationType )
			local layerStart = layerNumber
			local layerEnd = layerNumber
			for index = layerNumber, totalLayers - 1, 1 do
				local layerData = Engine.GetSelectedLayerData( controller, index, customizationType )
				if layerData.groupIndex == groupIndex then
					layerEnd = index
				end
			end
			return {
				groupStartLayer = layerStart,
				groupEndLayer = layerEnd,
				isGrouped = true
			}
		end,
		createLayer = function ( layerNumber )
			return {
				groupStartLayer = layerNumber,
				groupEndLayer = layerNumber,
				isGrouped = false
			}
		end,
		prepare = function ( controller, list, filter )
			list.emblemLayerListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemLayerList" )
			local customizationType = CoD.GetCustomization( controller, "type" )
			local totalUsedLayers = Engine.GetUsedLayerCount( controller, customizationType, CoD.perController[controller].totalLayers )
			local totalLayersVisible = totalUsedLayers + 1
			list.totalLayers = math.min( totalLayersVisible, CoD.perController[controller].totalLayers )
			list.itemInfo = {}
			local layerNumber = 0
			while layerNumber < list.totalLayers do
				local layerData = Engine.GetSelectedLayerData( controller, layerNumber, customizationType )
				if layerData.isGrouped == true then
					local groupInfo = DataSources.EmblemLayerList.createGroup( controller, layerNumber, layerData.groupIndex, list.totalLayers, customizationType )
					table.insert( list.itemInfo, groupInfo )
					layerNumber = groupInfo.groupEndLayer + 1
				else
					table.insert( list.itemInfo, DataSources.EmblemLayerList.createLayer( layerNumber ) )
					layerNumber = layerNumber + 1
				end
				if layerData.groupIndex == CoD.perController[controller].selectEmblemGroupIndex then
					list.selectIndex = #list.itemInfo
				end
			end
		end,
		getCount = function ( list )
			return #list.itemInfo
		end,
		getItem = function ( controller, list, index )
			local displayLayerNumber = nil
			local layerNumber = list.itemInfo[index].groupStartLayer
			local groupLayerCount = list.itemInfo[index].groupEndLayer - list.itemInfo[index].groupStartLayer + 1
			if list.itemInfo[index].isGrouped then
				displayLayerNumber = tostring( list.itemInfo[index].groupStartLayer + 1 ) .. "-" .. tostring( list.itemInfo[index].groupEndLayer + 1 )
			else
				displayLayerNumber = tostring( layerNumber + 1 )
			end
			local layerModel = Engine.CreateModel( list.emblemLayerListModel, "layer_" .. layerNumber )
			Engine.SetModelValue( Engine.CreateModel( layerModel, "layerIndex" ), layerNumber )
			Engine.SetModelValue( Engine.CreateModel( layerModel, "layerNumberString" ), displayLayerNumber )
			local customizationType = CoD.GetCustomization( controller, "type" )
			local layerData = Engine.GetSelectedLayerData( controller, layerNumber, customizationType )
			if layerData.iconID == CoD.emblem.INVALID_ID then
				Engine.SetModelValue( Engine.CreateModel( layerModel, "layerName" ), Engine.Localize( "MENU_EMBLEM_ADD_DECAL" ) )
			else
				Engine.SetModelValue( Engine.CreateModel( layerModel, "layerName" ), Engine.Localize( "MENU_EMBLEM_LAYER_NUMBER", layerNumber + 1 ) )
			end
			Engine.SetModelValue( Engine.CreateModel( layerModel, "isLinked" ), layerData.isLinked )
			Engine.SetModelValue( Engine.CreateModel( layerModel, "isGrouped" ), layerData.isGrouped )
			Engine.SetModelValue( Engine.CreateModel( layerModel, "groupIndex" ), layerData.groupIndex )
			Engine.SetModelValue( Engine.CreateModel( layerModel, "layerAndGroupIndex" ), layerNumber .. " " .. layerData.groupIndex )
			Engine.SetModelValue( Engine.CreateModel( layerModel, "groupLayerCount" ), groupLayerCount )
			return layerModel
		end,
		getCustomPropertiesForItem = function ( list, index )
			if list.selectIndex == index then
				return {
					selectIndex = true
				}
			else
				
			end
		end,
		swapItemInfo = function ( controller, list, item1, item2 )
			if item1 and item2 and list then
				item1:setModel( nil )
				item2:setModel( nil )
				local item1Index = item1.gridInfoTable.zeroBasedIndex + 1
				local item2Index = item2.gridInfoTable.zeroBasedIndex + 1
				local item1Info = list.itemInfo[item1Index]
				local item2Info = list.itemInfo[item2Index]
				local item1TotalLayers = item1Info.groupEndLayer - item1Info.groupStartLayer
				local item2TotalLayers = item2Info.groupEndLayer - item2Info.groupStartLayer
				item1Info.groupEndLayer = item1Info.groupStartLayer + item2TotalLayers
				item2Info.groupStartLayer = item1Info.groupEndLayer + 1
				item2Info.groupEndLayer = item2Info.groupStartLayer + item1TotalLayers
				local tempIsGrouped = item1Info.isGrouped
				item1Info.isGrouped = item2Info.isGrouped
				item2Info.isGrouped = tempIsGrouped
				item1:setModel( DataSources.EmblemLayerList.getItem( controller, list, item1Index ) )
				item2:setModel( DataSources.EmblemLayerList.getItem( controller, list, item2Index ) )
			end
		end
	},
	EmblemIconList = {
		prepare = function ( controller, list, filter )
			list.emblemIconList = {}
			local category = CoD.emblem.DECALTABS[1].category
			if CoD.perController[controller].selectedDecalCategory ~= nil then
				category = CoD.perController[controller].selectedDecalCategory
			end
			local emblemIconListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemIconList" )
			local totalIcons = Engine.EmblemFilterCount( controller, 0, category )
			for iconIndex = 0, totalIcons - 1, 1 do
				local iconModel = Engine.CreateModel( emblemIconListModel, "icon_" .. iconIndex )
				local id = Engine.EmblemFilterIconID( controller, 0, category, iconIndex )
				Engine.SetModelValue( Engine.CreateModel( iconModel, "iconID" ), id )
				table.insert( list.emblemIconList, iconModel )
			end
		end,
		getCount = function ( list )
			return #list.emblemIconList
		end,
		getItem = function ( controller, list, index )
			return list.emblemIconList[index]
		end
	},
	EmblemMaterialList = {
		prepare = function ( controller, list, filter )
			list.emblemMaterialList = {}
			local category = CoD.emblem.MaterialCategory[1].category
			if CoD.perController[controller].selectedMaterialCategory ~= nil then
				category = CoD.perController[controller].selectedMaterialCategory
			end
			local emblemMaterialListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemMaterialList" )
			local totalMaterials = Engine.GetEmblemMaterialFilterCount( controller, category )
			for materialIndex = 0, totalMaterials - 1, 1 do
				local materialModel = Engine.CreateModel( emblemMaterialListModel, "emblemMaterial_" .. materialIndex )
				local id = Engine.GetEmblemMaterialIDByIndex( controller, category, materialIndex )
				Engine.SetModelValue( Engine.CreateModel( materialModel, "materialID" ), id )
				Engine.SetModelValue( Engine.CreateModel( materialModel, "materialName" ), Engine.GetEmblemMaterialName( id ) )
				table.insert( list.emblemMaterialList, materialModel )
			end
		end,
		getCount = function ( list )
			return #list.emblemMaterialList
		end,
		getItem = function ( controller, list, index )
			return list.emblemMaterialList[index]
		end
	},
	EmblemColorList = {
		prepare = function ( controller, list, filter )
			list.emblemColorList = {}
			if not CoD.emblem.ColorList then
				CoD.emblem.ColorList = CoD.GetEmblemColorList( controller )
			end
			list.emblemColorList = CoD.emblem.ColorList
		end,
		getCount = function ( list )
			return #list.emblemColorList
		end,
		getItem = function ( controller, list, index )
			return list.emblemColorList[index]
		end
	},
	EmblemSelectedLayerColor = {
		getModel = function ( controller )
			local emblemLayerColor = Engine.GetSelectedLayerColor( controller )
			local selectedLayerColorModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerColor" )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "color" ), CoD.ConvertColor( emblemLayerColor.red, emblemLayerColor.green, emblemLayerColor.blue ) )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "red" ), emblemLayerColor.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "green" ), emblemLayerColor.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "blue" ), emblemLayerColor.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			return selectedLayerColorModel
		end
	},
	EmblemSelectedLayerColor1 = {
		getModel = function ( controller )
			local emblemLayerColor1 = Engine.GetSelectedLayerColor1( controller )
			local selectedLayerColorModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerColor1" )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "color" ), CoD.ConvertColor( emblemLayerColor1.red, emblemLayerColor1.green, emblemLayerColor1.blue ) )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "red" ), emblemLayerColor1.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "green" ), emblemLayerColor1.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "blue" ), emblemLayerColor1.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			return selectedLayerColorModel
		end
	},
	EmblemSelectedLayerEdittingColor = {
		getModel = function ( controller )
			local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
			local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
			if isGradientMode ~= nil and colorNum ~= nil and isGradientMode == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
				return DataSources.EmblemSelectedLayerColor1.getModel( controller )
			else
				return DataSources.EmblemSelectedLayerColor.getModel( controller )
			end
		end
	},
	EmblemSelectedLayerNoColor = {
		getModel = function ( controller )
			local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
			local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
			if isGradientMode ~= nil and colorNum ~= nil and isGradientMode == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
				return DataSources.EmblemSelectedLayerColor.getModel( controller )
			else
				return DataSources.EmblemSelectedLayerColor1.getModel( controller )
			end
		end
	},
	EmblemSelectedLayerProperties = {
		getModel = function ( controller )
			local layerProperties = Engine.GetSelectedEmblemLayerProperties()
			local selectedLayerPropertiesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties" )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "xposition" ), layerProperties.xposition )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "yposition" ), layerProperties.yposition )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "xscale" ), layerProperties.xscale )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "yscale" ), layerProperties.yscale )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "rotation" ), layerProperties.rotation )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "opacity0" ), layerProperties.opacity0 )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "opacity1" ), layerProperties.opacity1 )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "gradient_angle" ), layerProperties.gradient_angle )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "gradient_type" ), layerProperties.gradient_type )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "gradient_fill" ), layerProperties.gradient_fill )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "material_angle" ), layerProperties.material_angle )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "material_xscale" ), layerProperties.material_xscale )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "material_yscale" ), layerProperties.material_yscale )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "max_opacity" ), math.max( layerProperties.opacity0, layerProperties.opacity1 ) )
			return selectedLayerPropertiesModel
		end
	},
	EmblemProperties = {
		getModel = function ( controller )
			local colorMode = Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID
			local editorMode = Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
			local scaleMode = Engine.GetEmblemScaleMode( controller )
			local materialScaleMode = Engine.GetLayerMaterialScaleMode( controller )
			local totalLayers = CoD.perController[controller].totalLayers
			local usedLayerCount = Engine.GetUsedLayerCount( controller, CoD.perController[controller].customizationType, totalLayers )
			local layersUsedFraction = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedLayerCount, totalLayers )
			local linkedLayerCount = Engine.GetLinkedLayerCount( controller, CoD.perController[controller].customizationType )
			local emblemPropertiesModel = Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties" )
			if not emblemPropertiesModel then
				emblemPropertiesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties" )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "layersUsed" ), usedLayerCount )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "colorMode" ), colorMode )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "scaleMode" ), scaleMode )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "materialScaleMode" ), materialScaleMode )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "layersUsedFraction" ), layersUsedFraction )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isClipboardEmpty" ), CoD.emblem.CLIPBOARDSTATE.EMPTY )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "addDecalMode" ), CoD.emblem.ADDDECAL.REPLACE )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isGradientMode" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "colorNum" ), Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isColor0NoColor" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isColor1NoColor" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "linkedLayerCount" ), linkedLayerCount )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "selectedDecalID" ), 0 )
			end
			return emblemPropertiesModel
		end
	},
	Customization = {
		getModel = function ( controller )
			local customizationModel = Engine.GetModel( Engine.GetModelForController( controller ), "Customization" )
			if not customizationModel then
				customizationModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Customization" )
				local weaponIndexModel = Engine.CreateModel( customizationModel, "weapon_index" )
				Engine.SetModelValue( weaponIndexModel, "20" )
				local customizationType = Engine.CreateModel( customizationModel, "type" )
				Engine.SetModelValue( customizationType, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM )
			end
			return customizationModel
		end
	},
	StoreCategoryList = ListHelper_SetupDataSource( "Store.CategoryList", function ( controller )
		local list = {}
		local storeCategories = Engine.GetStoreCategories()
		for categoryNum = 1, #storeCategories, 1 do
			local storeCategory = storeCategories[categoryNum]
			if storeCategory.visibility then
				table.insert( list, {
					models = {
						category = storeCategory.category,
						category_loc_ref = storeCategory.category_loc_ref,
						category_visibility = storeCategory.visibility
					}
				} )
			end
		end
		return list
	end
	 ),
	StoreProductList = ListHelper_SetupDataSource( "Store.ProductList", function ( controller )
		local list = {}
		local storeProducts = Engine.GetStoreProductsByCategory( controller, "BETA" )
		for productIndex = 1, #storeProducts, 1 do
			local product = storeProducts[productIndex]
			table.insert( list, {
				models = {
					name = product.name,
					price = product.price,
					desc = product.desc,
					productID = product.productID,
					skuID = product.skuID,
					previewImage = product.previewImage,
					productImage = product.productImage,
					purchasestatus = product.purchasestatus,
					serviceLabel = product.serviceLabel
				}
			} )
		end
		return list
	end
	 ),
	StoreRoot = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "StoreRoot" )
			return model
		end
	},
	ChooseClassList = {
		prepare = function ( controller, list, filter )
			list.customClassList = {}
			local classCount = Engine.GetCustomClassCount( controller )
			local editClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList" )
			for index = 1, classCount, 1 do
				local classNum = index - 1
				list.customClassList[index] = Engine.CreateModel( editClassModel, "class" .. index )
				CoD.CACUtility.GetCustomClassModel( controller, classNum, list.customClassList[index] )
			end
		end,
		getCount = function ( list )
			return #list.customClassList
		end,
		getItem = function ( controller, list, index )
			return list.customClassList[index]
		end
	},
	ChooseClass_InGame = {
		prepareModelForIndex = function ( editClassModel, index, controller )
			local classNum = index - 1
			local listModel = Engine.CreateModel( editClassModel, "class" .. index )
			CoD.CACUtility.GetCustomClassModel( controller, classNum, listModel )
			return listModel
		end,
		prepare = function ( controller, list, filter )
			local preparedModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList.prepared" )
			list.customClassCount = Engine.GetCustomClassCount( controller )
			local defaultClassesToDisplay = 10 - list.customClassCount
			defaultClassesToDisplay = math.min( math.max( defaultClassesToDisplay, 0 ), 5 )
			if not preparedModel then
				CoD.CACUtility.classModels = {}
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList.prepared" ), true )
				local editClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList" )
				list.classModels = {}
				for index = 1, list.customClassCount, 1 do
					table.insert( list.classModels, DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, index, controller ) )
				end
				if IsMultiplayer() then
					local defaultClassesStart = 11
					for index = defaultClassesStart, defaultClassesStart + defaultClassesToDisplay - 1, 1 do
						table.insert( list.classModels, DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, index, controller ) )
					end
				end
				CoD.CACUtility.classModels = list.classModels
			elseif CoD.CACUtility.classModels then
				list.classModels = CoD.CACUtility.classModels
			end
		end,
		getCount = function ( list )
			if list.classModels then
				return #list.classModels
			else
				return 0
			end
		end,
		getItem = function ( controller, list, index )
			if list.classModels then
				return list.classModels[index]
			else
				
			end
		end,
		getSpacerAfterRow = function ( list, row, widgetHeight )
			if row == list.customClassCount then
				return 20
			else
				return 0
			end
		end
	},
	CustomClassMenu = {
		getModel = function ( controller )
			local classModel = CoD.perController[controller].classModel
			local customClassName = Engine.GetModelValue( Engine.GetModel( classModel, "customClassName" ) )
			local customClassMenuModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassMenu" )
			Engine.SetModelValue( Engine.CreateModel( customClassMenuModel, "currentClassName" ), customClassName )
			return classModel
		end,
		updateCustomSlotModel = function ( model, slotName, controller )
			local slotModel = Engine.GetModel( model, slotName )
			if slotModel == nil then
				return 
			end
			local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
			if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
				local attachmentModelName = slotName .. "attachment1"
				local attachmentModel = Engine.GetModel( model, attachmentModelName )
				if attachmentModel then
					local attachmentItemIndex = Engine.GetModelValue( Engine.GetModel( attachmentModel, "itemIndex" ) )
					if attachmentItemIndex > CoD.CACUtility.EmptyItemIndex then
						local baseWeaponName = Engine.GetModelValue( Engine.GetModel( slotModel, "name" ) )
						Engine.SetModelValue( Engine.CreateModel( attachmentModel, "name" ), baseWeaponName )
						Engine.SetModelValue( Engine.CreateModel( attachmentModel, "image" ), Engine.GetModelValue( Engine.GetModel( slotModel, "image" ) ) )
						Engine.SetModelValue( Engine.CreateModel( attachmentModel, "desc" ), Engine.GetModelValue( Engine.GetModel( slotModel, "desc" ) ) )
						Engine.SetModelValue( Engine.CreateModel( attachmentModel, "itemIndex" ), 1 )
						Engine.SetModelValue( Engine.CreateModel( attachmentModel, "weaponSlot" ), attachmentModelName )
					end
				end
			end
		end,
		updateWeaponAttachmentList = function ( controller, classModel, slotName, maxAttachments )
			local slotModel = Engine.GetModel( classModel, slotName )
			if not slotModel then
				return 
			end
			local createCustomModelForAttachment = function ( slotModel, modelIndex, slotIndex, weaponItemIndex, attachmentIndex )
				local newModelName = "cust" .. slotName .. "weaponattachment" .. modelIndex
				local customAttachmentModel = Engine.CreateModel( slotModel, newModelName )
				local attachmentName = Engine.GetAttachmentName( weaponItemIndex, attachmentIndex )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "name" ), attachmentName )
				local imageName = Engine.GetAttachmentImageByWeaponAndAttachIndex( weaponItemIndex, attachmentIndex )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "image" ), imageName )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "weaponSlot" ), slotName .. "attachment" .. slotIndex )
				local attachmentRef = Engine.GetAttachmentRef( weaponItemIndex, attachmentIndex )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "ref" ), attachmentRef )
			end
			
			if slotName == "primary" or slotName == "secondary" then
				local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
				if itemIndexModel then
					for index = 1, maxAttachments, 1 do
						local newModelName = "cust" .. slotName .. "weaponattachment" .. index
						local customAttachmentModel = Engine.GetModel( slotModel, newModelName )
						if customAttachmentModel then
							Engine.UnsubscribeAndFreeModel( customAttachmentModel )
						end
					end
					local weaponItemIndex = Engine.GetModelValue( itemIndexModel )
					if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
						local modelIndex = 1
						local attachmentListForSlot = CoD.CACUtility.GetAttachmentListForSlot( slotName )
						for index, loadoutSlot in ipairs( attachmentListForSlot ) do
							local attachmentIndex = CoD.CACUtility.GetItemEquippedInSlot( loadoutSlot, controller, classModel )
							if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
								createCustomModelForAttachment( slotModel, modelIndex, index, weaponItemIndex, attachmentIndex )
								modelIndex = modelIndex + 1
							end
						end
						for i = modelIndex, #attachmentListForSlot, 1 do
							local newModelName = "cust" .. slotName .. "weaponattachment" .. i
							local customAttachmentModel = Engine.CreateModel( slotModel, newModelName )
						end
					end
				end
			end
		end
	},
	ResetDefaultClass = {
		prepare = function ( controller, list, filter )
			list.resetDefaultClassList = {}
			local resetDefaultClass = Engine.CreateModel( Engine.GetModelForController( controller ), "ResetDefaultClassList" )
			for index = 1, CoD.CACUtility.maxDefaultClass, 1 do
				list.resetDefaultClassList[index] = Engine.CreateModel( resetDefaultClass, "DefaultClass" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.resetDefaultClassList[index], "name" ), Engine.Localize( "CLASS_SLOT" .. index ) )
				Engine.SetModelValue( Engine.CreateModel( list.resetDefaultClassList[index], "index" ), index )
			end
		end,
		getCount = function ( list )
			return #list.resetDefaultClassList
		end,
		getItem = function ( controller, list, index )
			return list.resetDefaultClassList[index]
		end
	},
	PaintshopWeaponTabType = ListHelper_SetupDataSource( "Paintshop.PaintshopWeaponTabType", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for _, weaponGroup in ipairs( CoD.Craft.WeaponGroupNames ) do
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( weaponGroup.name )
				},
				properties = {
					filter = weaponGroup.weapon_category
				}
			} )
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
	end
	 ),
	EmblemMaterialTabType = ListHelper_SetupDataSource( "Emblem.EmblemMaterialTabType", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for _, materialGroup in ipairs( CoD.emblem.MaterialCategory ) do
			if materialGroup.type == "camo" then
				table.insert( tabList, {
					models = {
						tabName = Engine.Localize( materialGroup.name )
					},
					properties = {
						filter = materialGroup.category,
						disabled = true
					}
				} )
			else
				table.insert( tabList, {
					models = {
						tabName = Engine.Localize( materialGroup.name )
					},
					properties = {
						filter = materialGroup.category
					}
				} )
			end
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
	end
	 ),
	GunsmithWeaponAttachments = ListHelper_SetupDataSource( "GunsmithWeaponAttachments", function ( controller )
		local attachments = {}
		local mode = Enum.eModes.MODE_MULTIPLAYER
		local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
		local numAttachments = Engine.GetNumAttachments( weaponItemIndex, mode )
		local attachmentType = CoD.perController[controller].gunsmithAttachmentType
		local variantAttachmentModel = CoD.perController[controller].gunsmithAttachmentModel
		local variantAttchmentIndex = Engine.GetModelValue( variantAttachmentModel )
		local variantModel = CoD.perController[controller].gunsmithVariantModel
		local weaponRef = Engine.GetItemRef( weaponItemIndex )
		local refCol = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
		local weaponRefCol = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
		local damageLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
		local rangeLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
		local fireRateLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
		local accuracyLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
		local weaponAttributes = "gamedata/weapons/mp/mp_attributesTable.csv"
		local equippedAttachmentAttributes = {
			damage = 0,
			range = 0,
			fireRate = 0,
			accuracy = 0
		}
		local equippedAttachmentRefList = {}
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentSlotAttachmentIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "attachment" .. attachmentIndex ) )
			if variantAttchmentIndex ~= attachmentSlotAttachmentIndex and attachmentSlotAttachmentIndex > CoD.CACUtility.EmptyItemIndex then
				local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentSlotAttachmentIndex )
				table.insert( equippedAttachmentRefList, attachmentRef )
				local damageStat = Engine.TableLookup( nil, weaponAttributes, refCol, attachmentRef, weaponRefCol, weaponRef, damageLookupEnum )
				local rangeStat = Engine.TableLookup( nil, weaponAttributes, refCol, attachmentRef, weaponRefCol, weaponRef, rangeLookupEnum )
				local fireRateStat = Engine.TableLookup( nil, weaponAttributes, refCol, attachmentRef, weaponRefCol, weaponRef, fireRateLookupEnum )
				local accuracyStat = Engine.TableLookup( nil, weaponAttributes, refCol, attachmentRef, weaponRefCol, weaponRef, accuracyLookupEnum )
				local f410_local2 = equippedAttachmentAttributes.damage
				local f410_local3
				if damageStat == "" then
					f410_local3 = 0
					if not f410_local3 then
					
					else
						equippedAttachmentAttributes.damage = f410_local2 + f410_local3
						f410_local2 = equippedAttachmentAttributes.range
						if rangeStat == "" then
							f410_local3 = 0
							if not f410_local3 then
							
							else
								equippedAttachmentAttributes.range = f410_local2 + f410_local3
								f410_local2 = equippedAttachmentAttributes.fireRate
								if fireRateStat == "" then
									f410_local3 = 0
									if not f410_local3 then
									
									else
										equippedAttachmentAttributes.fireRate = f410_local2 + f410_local3
										f410_local2 = equippedAttachmentAttributes.accuracy
										if accuracyStat == "" then
											f410_local3 = 0
											if not f410_local3 then
											
											else
												equippedAttachmentAttributes.accuracy = f410_local2 + f410_local3
											end
										end
										f410_local3 = accuracyStat
									end
								end
								f410_local3 = fireRateStat
							end
						end
						f410_local3 = rangeStat
					end
				end
				f410_local3 = damageStat
			end
		end
		local perControllerModel = Engine.GetModelForController( controller )
		for index = 1, numAttachments - 1, 1 do
			local attachmentIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
			if attachmentType == "attachment" then
				if Engine.IsOptic( weaponItemIndex, index, mode ) == false then
					attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index, mode )
				end
			elseif attachmentType == "optic" and Engine.IsOptic( weaponItemIndex, index, mode ) == true then
				attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index, mode )
			end
			if attachmentIndex > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local damageStat = Engine.GetAttachmentRef( weaponItemIndex, index, mode )
				local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
				local attachmentImage = Engine.GetAttachmentUniqueImageByAttachmentIndex( mode, weaponItemIndex, attachmentIndex )
				local acvIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
				if variantModel then
					for index = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
						local model = Engine.GetModel( variantModel, "attachment" .. index )
						local attachmentID = Engine.GetModelValue( model )
						local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. index )
						local attachmentVariantID = Engine.GetModelValue( attachmentVariantModel )
						if attachmentID == attachmentIndex and attachmentVariantID > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
							local weaponName = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
							local cosmeticVariant = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentIndex )
							attachmentName = cosmeticVariant.name
							attachmentImage = cosmeticVariant.image
							acvIndex = attachmentVariantID
							break
						end
					end
				end
				local unlockablesModel = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" )
				local f410_local3 = Engine.GetModel( unlockablesModel, weaponItemIndex .. ".weaponAttributes" )
				local getWeaponAttributeValues = function ( attributeName, attributeLookupEnum )
					local weaponAttributeValue = Engine.GetModelValue( Engine.GetModel( f410_local3, attributeName ) )
					local attachmentAttributeValue = Engine.TableLookup( nil, weaponAttributes, refCol, damageStat, weaponRefCol, weaponRef, attributeLookupEnum )
					if weaponAttributeValue == "" then
						weaponAttributeValue = 0
					end
					if attachmentAttributeValue == "" then
						attachmentAttributeValue = 0
					end
					local isAttachmentEquipped = false
					for index, equippedAttachmentRef in ipairs( equippedAttachmentRefList ) do
						if equippedAttachmentRef == damageStat then
							isAttachmentEquipped = true
							break
						end
					end
					local combinedWeaponAttachmentAttribute = weaponAttributeValue + equippedAttachmentAttributes[attributeName]
					if not isAttachmentEquipped then
						combinedWeaponAttachmentAttribute = combinedWeaponAttachmentAttribute + attachmentAttributeValue
					end
					return weaponAttributeValue .. "," .. combinedWeaponAttachmentAttribute
				end
				
				local attachmentInfo = {
					models = {
						name = attachmentName,
						image = attachmentImage,
						itemIndex = index,
						weaponIndex = weaponItemIndex,
						attachmentIndex = attachmentIndex,
						description = Engine.GetAttachmentDesc( weaponItemIndex, index, mode ),
						acvIndex = acvIndex,
						weaponAttributes = {
							damage = getWeaponAttributeValues( "damage", damageLookupEnum ),
							range = getWeaponAttributeValues( "range", rangeLookupEnum ),
							fireRate = getWeaponAttributeValues( "fireRate", fireRateLookupEnum ),
							accuracy = getWeaponAttributeValues( "accuracy", accuracyLookupEnum )
						}
					},
					properties = {
						selectIndex = variantAttchmentIndex == attachmentIndex
					}
				}
				table.insert( attachments, attachmentInfo )
			end
		end
		return attachments
	end
	, true ),
	GunsmithCamoList = {
		prepare = function ( controller, list, filter )
			list.camos = {}
			local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
			local variantCamoIndexModel = CoD.perController[controller].gunsmithCamoIndexModel
			local variantCamoIndex = Engine.GetModelValue( variantCamoIndexModel )
			if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
				for itemIndex = 0, Engine.GetWeaponOptionsCount(), 1 do
					local optionInfoModel = Engine.GetWeaponOptionsInfoModelByIndex( controller, itemIndex, "WeaponOptions", weaponItemIndex, 0, Enum.eModes.MODE_MULTIPLAYER )
					if optionInfoModel and Engine.GetModelValue( Engine.GetModel( optionInfoModel, "allocation" ) ) >= 0 then
						local weaponOptionName = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionTypeName" ) )
						if weaponOptionName == "camo" then
							local camoIndex = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "itemIndex" ) )
							if camoIndex > 0 then
								table.insert( list.camos, {
									model = optionInfoModel,
									properties = {
										selectIndex = camoIndex == variantCamoIndex
									}
								} )
							end
						end
					end
				end
			end
		end,
		getCount = function ( list )
			return #list.camos
		end,
		getItem = function ( controller, list, index )
			return list.camos[index].model
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.camos[index].properties
		end
	},
	GunsmithVariantList = {
		prepare = function ( controller, list, filter )
			list.controller = controller
			local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
			if not weaponIndex then
				return 
			end
			list.variantListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.VariantList" )
			local allUsedVariants = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
			local usedWeaponVariants = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( weaponIndex )
			local maxAllowedVariants = CoD.CraftUtility.Gunsmith.GetTotalVaraints()
			if allUsedVariants == maxAllowedVariants then
				list.totalVariants = usedWeaponVariants
			else
				list.totalVariants = usedWeaponVariants + 1
			end
			list.variantList = {}
			list.variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( weaponIndex )
		end,
		getCount = function ( list )
			return list.totalVariants
		end,
		createAttachmentListDataSource = function ( controller, index, weaponIndex, attachmentList )
			local dataSourceName = "Gunsmith.VariantList.Variant" .. index .. "AttachmentList"
			DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
				local attachmentTable = {}
				local mode = Enum.eModes.MODE_MULTIPLAYER
				for i, attachmentTableIndex in ipairs( attachmentList ) do
					if attachmentTableIndex > CoD.CACUtility.EmptyItemIndex then
						local newAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, attachmentTableIndex, mode )
						if newAttachmentIndex > CoD.CACUtility.EmptyItemIndex then
							table.insert( attachmentTable, {
								models = {
									image = Engine.GetAttachmentImage( weaponIndex, newAttachmentIndex, mode ) .. "_wv_icon"
								}
							} )
						end
					end
				end
				local wildcardCount = 0
				if CoD.CraftUtility.GetLoadoutSlot( controller ) == "primary" then
					local primaryWildcardStartIndex = 4
					for i = 0, 2, 1 do
						if attachmentList[primaryWildcardStartIndex + i] > CoD.CACUtility.EmptyItemIndex then
							wildcardCount = wildcardCount + 1
						end
					end
				else
					local secondaryWildcardStartIndex = 3
					if attachmentList[secondaryWildcardStartIndex] > CoD.CACUtility.EmptyItemIndex then
						wildcardCount = 1
						while wildcardCount > 0 do
							table.insert( attachmentTable, {
								models = {
									image = "cac_mods_primary_gunfighter_wv_icon"
								}
							} )
							wildcardCount = wildcardCount - 1
						end
						return attachmentTable
					end
				end
			end, true )
			return dataSourceName
		end,
		createVariantModel = function ( controller, itemIndex, variant, sortIndex, variantModel )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "variantIndex" ), variant.variantIndex )
			local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "weaponIndex" ), weaponIndex )
			if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( variant.variantIndex ) then
				Engine.SetModelValue( Engine.CreateModel( variantModel, "variantName" ), variant.variantName )
				Engine.SetModelValue( Engine.CreateModel( variantModel, "variantNameBig" ), variant.variantName )
			else
				Engine.SetModelValue( Engine.CreateModel( variantModel, "variantName" ), Engine.Localize( "MENU_GUNSMITH_CREATE_VARIANT" ) )
				Engine.SetModelValue( Engine.CreateModel( variantModel, "variantNameBig" ), "" )
			end
			for index, value in ipairs( variant.attachment ) do
				Engine.SetModelValue( Engine.CreateModel( variantModel, "attachment" .. index ), value )
			end
			for index, value in ipairs( variant.attachmentVariant ) do
				Engine.SetModelValue( Engine.CreateModel( variantModel, "attachmentVariant" .. index ), value )
			end
			local listDataSource = DataSources.GunsmithVariantList.createAttachmentListDataSource( controller, itemIndex, weaponIndex, variant.attachment )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "listDataSource" ), listDataSource )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "sortIndex" ), sortIndex )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlot" ), variant.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobIndex" ), variant.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "camoIndex" ), variant.camoIndex )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlotAndIndex" ), variant.paintjobSlot .. " " .. variant.paintjobIndex )
		end,
		getItem = function ( controller, list, index )
			local variantModel = Engine.CreateModel( list.variantListModel, "variant_" .. index )
			local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, list.variantList[index].variantIndex )
			DataSources.GunsmithVariantList.createVariantModel( controller, index, variant, list.variantList[index].sortIndex, variantModel )
			return variantModel
		end
	},
	GunsmithWeaponTabType = ListHelper_SetupDataSource( "Gunsmith.GunsmithWeaponTabType", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for _, weaponGroup in ipairs( CoD.Craft.WeaponGroupNames ) do
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( weaponGroup.name )
				},
				properties = {
					filter = weaponGroup.weapon_category,
					loadoutType = weaponGroup.loadout_type
				}
			} )
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
	end
	 ),
	GunsmithSelectedItemProperties = {
		getModel = function ( controller )
			local selectedItemPropertiesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties" )
			Engine.SetModelValue( Engine.CreateModel( selectedItemPropertiesModel, "itemName" ), "" )
			Engine.SetModelValue( Engine.CreateModel( selectedItemPropertiesModel, "title" ), "" )
			Engine.SetModelValue( Engine.CreateModel( selectedItemPropertiesModel, "attachmentType" ), "" )
			return selectedItemPropertiesModel
		end
	},
	FileshareRoot = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
			return model
		end
	},
	FileshareShowcaseManagerTabs = ListHelper_SetupDataSource( "FileshareShowcaseManagerTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		local selectedCategory = CoD.FileshareUtility.GetCurrentCategory()
		for _, fileshareTab in ipairs( CoD.FileshareUtility.ShowcaseManagerTabs ) do
			local f425_local3 = false
			local f425_local4 = false
			if selectedCategory == "" then
				f425_local3 = fileshareTab.selectIndex
				f425_local4 = fileshareTab.disabled
			elseif fileshareTab.fileshareCategory == selectedCategory then
				f425_local3 = true
				f425_local4 = false
			else
				f425_local3 = false
				f425_local4 = true
			end
			local locName = Engine.TableLookup( 0, CoD.fileShareTable, 1, fileshareTab.fileshareCategory, 8 )
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( locName .. "_CAPS" )
				},
				properties = {
					disabled = f425_local4,
					fileshareCategory = fileshareTab.fileshareCategory,
					fileshareKey = fileshareTab.fileshareKey,
					fileshareVal = fileshareTab.fileshareVal,
					selectIndex = f425_local3
				}
			} )
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
	end
	 ),
	FilesharePublishedPaintjobTabs = ListHelper_SetupDataSource( "FilesharePublishedPaintjobTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for _, fileshareTab in ipairs( CoD.FileshareUtility.PublishedPaintjobsTabs ) do
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( fileshareTab.name )
				},
				properties = {
					filter = fileshareTab.weapon_category,
					loadoutType = fileshareTab.loadout_type,
					disabled = fileshareTab.disabled,
					fileshareGroup = fileshareTab.fileshareGroup,
					fileshareCategory = fileshareTab.fileshareCategory,
					fileshareKey = fileshareTab.fileshareKey,
					fileshareVal = fileshareTab.fileshareVal
				}
			} )
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
	end
	 ),
	FilesharePublishedVariantsTabs = ListHelper_SetupDataSource( "FilesharePublishedVariantsTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for _, fileshareTab in ipairs( CoD.FileshareUtility.PublishedVariantsTabs ) do
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( fileshareTab.name )
				},
				properties = {
					filter = fileshareTab.weapon_category,
					loadoutType = fileshareTab.loadout_type,
					disabled = fileshareTab.disabled,
					fileshareGroup = fileshareTab.fileshareGroup,
					fileshareCategory = fileshareTab.fileshareCategory,
					fileshareKey = fileshareTab.fileshareKey,
					fileshareVal = fileshareTab.fileshareVal
				}
			} )
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
	end
	 ),
	EmblemDecalTabs = ListHelper_SetupDataSource( "EmblemDecalTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for tabIndex, decalData in ipairs( CoD.emblem.DECALTABS ) do
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( decalData.displayName )
				},
				properties = {
					tabCategory = decalData.category
				}
			} )
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
	end
	 ),
	FileshareQuotaList = {
		prepare = function ( controller, list, filter )
			list.controller = controller
			list.rootModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareQuota" )
			list.numFileshareCategories = Engine.GetTableRowCount( CoD.fileShareTable )
		end,
		getCount = function ( list )
			return list.numFileshareCategories
		end,
		getItem = function ( controller, list, index )
			local itemModel = Engine.CreateModel( list.rootModel, "fileshareCateogory_" .. index )
			local category = Engine.TableGetColumnValueForRow( CoD.fileShareTable, index - 1, 1 )
			local quota = Engine.FileshareGetQuota( list.controller, category )
			local fraction = 0
			if quota.categoryQuota > 0 then
				fraction = quota.categorySlotsUsed / quota.categoryQuota
			end
			if fraction > 1 then
				fraction = 1
			elseif fraction < 0 then
				fraction = 0
			end
			Engine.SetModelValue( Engine.CreateModel( itemModel, "category" ), quota.category )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "locName" ), Engine.TableLookup( 0, CoD.fileShareTable, 1, quota.category, 8 ) )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "quota" ), quota.categoryQuota )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "slotsUsed" ), quota.categorySlotsUsed )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "fraction" ), fraction )
			if quota.category == CoD.FileshareUtility.GetCurrentCategory() then
				Engine.SetModelValue( Engine.CreateModel( itemModel, "isDim" ), false )
			else
				Engine.SetModelValue( Engine.CreateModel( itemModel, "isDim" ), true )
			end
			return itemModel
		end
	},
	FilesharePublishedList = {
		prepare = function ( controller, list, filter )
			list.controller = controller
			if list.vCount == 1 then
				list.prepared = false
				return 
			end
			list.numElements = list.vCount * list.hCount
			list.hasCreateButton = CoD.FileshareUtility.GetShowCreateButton()
			list.fileshareRootModel = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
			list.fileshareData = {}
			for i = 1, list.numElements, 1 do
				list.fileshareData[i] = {}
				list.fileshareData[i].elementModel = Engine.CreateModel( list.fileshareRootModel, "fileshareData_" .. i )
				for _, val in ipairs( CoD.FileshareUtility.FileProperties ) do
					Engine.CreateModel( list.fileshareData[i].elementModel, val )
				end
			end
			Engine.FileshareStartup( list.controller )
			CoD.FileshareUtility.SetShowFileDetails( false )
			CoD.FileshareUtility.SetShowPublishNewDetails( false )
		end,
		getCount = function ( list )
			if list.numElements == nil then
				return 0
			elseif not Engine.FileshareIsReady( list.controller ) then
				return 0
			else
				local category = CoD.FileshareUtility.GetCurrentCategory()
				local key, val = CoD.FileshareUtility.GetCurrentFilter()
				if category == nil then
					return 0
				else
					local count = Engine.FileshareGetSlotCount( list.controller, category, key, val )
					if list.hasCreateButton == true then
						return count + 1
					else
						return count
					end
				end
			end
		end,
		getItem = function ( controller, list, index )
			local codeIndex = index - 1
			local modelIndex = codeIndex % list.numElements + 1
			local testIndex = index % list.numElements
			local isPublishNewModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "isPublishNew" )
			local showPlusImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "showPlusImage" )
			local showFileImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "showFileImage" )
			local fileImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "fileImage" )
			if list.hasCreateButton == true then
				codeIndex = codeIndex - 1
			end
			if list.hasCreateButton == true and index == 1 then
				Engine.SetModelValue( isPublishNewModel, true )
				Engine.SetModelValue( showPlusImageModel, 1 )
				Engine.SetModelValue( fileImageModel, "" )
				Engine.SetModelValue( showFileImageModel, 0 )
				local fileNameModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "fileName" )
				Engine.SetModelValue( fileNameModel, "MENU_FILESHARE_PUBLISH_NEW" )
			else
				Engine.SetModelValue( isPublishNewModel, false )
				Engine.SetModelValue( fileImageModel, "" )
				Engine.SetModelValue( showPlusImageModel, 0 )
				Engine.SetModelValue( showFileImageModel, 1 )
				local category = CoD.FileshareUtility.GetCurrentCategory()
				local key, val = CoD.FileshareUtility.GetCurrentFilter()
				local slotData = Engine.FileshareGetSlotData( list.controller, category, key, val, codeIndex )
				for _, val in ipairs( CoD.FileshareUtility.FileProperties ) do
					if slotData[val] ~= nil then
						local valueModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, val )
						Engine.SetModelValue( valueModel, slotData[val] )
					end
				end
			end
			return list.fileshareData[modelIndex].elementModel
		end
	},
	FileshareOptionsButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_FILESHARE_LIKE",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_LIKE_DESC",
					action = CoD.FileshareUtility.ReportLike
				},
				{
					displayText = "MENU_FILESHARE_DISLIKE",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DISLIKE_DESC",
					action = CoD.FileshareUtility.ReportDislike
				},
				{
					displayText = "MENU_FILESHARE_ALLOW_DOWNLOAD",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.AllowDownload
				},
				{
					displayText = "MENU_FILESHARE_DOWNLOAD",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.Download
				},
				{
					displayText = "MENU_DELETE",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DELETE_DESC",
					action = CoD.FileshareUtility.Delete
				}
			}
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareOptionsButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "disabled" ), false )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	FileshareOptionsDeleteButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_YES",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.DeleteYes
				},
				{
					displayText = "MENU_NO",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.DeleteNo
				}
			}
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareOptionsDeleteButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	FileshareSlotsFullButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_FILESHARE_SHOWCASE_MANAGER_CAPS",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.OpenShowcaseManager
				},
				{
					displayText = "MENU_FILESHARE_BUY_SLOTS",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.OpenBuySlots
				}
			}
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSlotsFullButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	GunsmithOptionsButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_RENAME",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.CraftUtility.GunsmithRename
				},
				{
					displayText = "MENU_CLEAR",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.CraftUtility.GunsmithClear
				},
				{
					displayText = "MENU_PUBLISH",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.CraftUtility.OpenPublishPromptGunsmith
				}
			}
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GunsmithOptionsButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	EmblemOptionsButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_RENAME",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.CraftUtility.EmblemRename
				},
				{
					displayText = "MENU_CLEAR",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.CraftUtility.EmblemClear
				},
				{
					displayText = "MENU_PUBLISH",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.CraftUtility.OpenPublishPromptEmblem
				}
			}
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "EmblemOptionsButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	PaintjobOptionsButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_RENAME",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.CraftUtility.PaintjobRename
				},
				{
					displayText = "MENU_CLEAR",
					displayImage = "",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.CraftUtility.PaintjobClear
				}
			}
			if Engine.IsSteamWorkshopEnabled() then
				table.insert( options, {
					displayText = "PLATFORM_STEAM_PUBLISH",
					displayImage = "uie_headicon_dead",
					displayDesc = "PLATFORM_STEAM_PUBLISH_DESC",
					action = CoD.CraftUtility.OpenSteamPublishPromptPaintjob
				} )
			end
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "PaintjobOptionsButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	PaintjobOptionsClearButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_YES",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.CraftUtility.PaintjobClearYes
				},
				{
					displayText = "MENU_NO",
					displayImage = "",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.CraftUtility.PaintjobClearNo
				}
			}
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "PaintjobOptionsClearButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	GunsmithOptionsClearButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_YES",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.CraftUtility.GunsmithClearYes
				},
				{
					displayText = "MENU_NO",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.CraftUtility.GunsmithClearNo
				}
			}
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GunsmithOptionsClearButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	EmblemOptionsClearButtonList = {
		prepare = function ( controller, list, filter )
			local options = {
				{
					displayText = "MENU_YES",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.CraftUtility.EmblemClearYes
				},
				{
					displayText = "MENU_NO",
					displayImage = "uie_headicon_dead",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.CraftUtility.EmblemClearNo
				}
			}
			local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "EmblemOptionsClearButtonList" ), "list" )
			list.optionModels = {}
			for index, buttonData in ipairs( options ) do
				list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			end
		end,
		getCount = function ( list )
			return #list.optionModels
		end,
		getItem = function ( controller, list, index )
			return list.optionModels[index]
		end
	},
	PaintjobList = {
		prepare = function ( controller, list, filter )
			list.controller = controller
			local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
			if not weaponIndex then
				return 
			end
			list.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.PaintjobList" )
			local allUsedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
			local usedWeaponPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( weaponIndex )
			local maxAllowedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
			if allUsedPaintjobs == maxAllowedPaintjobs then
				list.totalPaintjobs = usedWeaponPaintjobs
			else
				list.totalPaintjobs = usedWeaponPaintjobs + 1
			end
			list.paintjobList = {}
			list.paintjobList = CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList( weaponIndex )
		end,
		getCount = function ( list )
			return list.totalPaintjobs
		end,
		getItem = function ( controller, list, index )
			local paintjobModel = Engine.CreateModel( list.paintjobListModel, "paintjob_" .. index )
			local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
			local paintjob = list.paintjobList[index]
			if paintjob then
				if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( paintjob.paintjobSlot, paintjob.paintjobIndex ) then
					Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobName" ), paintjob.paintjobName )
					Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobTextEntry" ), paintjob.paintjobName )
				else
					Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobTextEntry" ), Engine.Localize( "MENU_ENTER_PAINTJOB_NAME" ) )
					Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobName" ), "" )
				end
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "sortIndex" ), paintjob.sortIndex )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobSlot" ), paintjob.paintjobSlot )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "weaponIndex" ), weaponIndex )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobIndex" ), paintjob.paintjobIndex )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobSlotAndIndex" ), paintjob.paintjobSlot .. " " .. paintjob.paintjobIndex )
				return paintjobModel
			else
				
			end
		end
	},
	EmblemsList = {
		prepare = function ( controller, list, filter )
			list.controller = controller
			list.emblemListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemList" )
			local emblemCount = CoD.CraftUtility.Emblems.GetTotalUsedEmblems()
			local maxEmblems = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems()
			if emblemCount == maxEmblems then
				list.totalEmblems = emblemCount
			else
				list.totalEmblems = emblemCount + 1
			end
			list.emblemList = {}
			list.emblemList = CoD.CraftUtility.Emblems.GetSortedEmblemsList()
		end,
		getCount = function ( list )
			return list.totalEmblems
		end,
		getItem = function ( controller, list, index )
			local emblemModel = Engine.CreateModel( list.emblemListModel, "emblem_" .. index )
			local emblem = list.emblemList[index]
			if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( emblem.emblemIndex ) then
				Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemName" ), emblem.emblemName )
				Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTextEntry" ), emblem.emblemName )
			else
				Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemName" ), Engine.Localize( "MENU_EMBLEM_CREATE_NEW" ) )
				Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTextEntry" ), Engine.Localize( "MENU_ENTER_EMBLEM_NAME" ) )
			end
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "sortIndex" ), emblem.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemIndex" ), emblem.emblemIndex )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isUsed" ), emblem.isUsed )
			return emblemModel
		end
	},
	PersonalDataVault_CareerData = ListHelper_SetupDataSource( "PDV_CareerDataList", function ( controller )
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
					action = function ( self, element, controller )
						NavigateToMenu( self, "Omnipedia", true, controller )
					end
					
				},
				properties = {
					disabled = false
				}
			}
		}
	end
	 ),
	PersonalDataVault_MissionLocations = ListHelper_SetupDataSource( "PDV_MissionLocList", function ( controller )
		local mapsWithCollectibles = {}
		for map_name, mapData in pairs( CoD.mapsTable ) do
			if mapData.collectibles and mapData.collectibles ~= "" and mapData.mapName then
				table.insert( mapsWithCollectibles, {
					models = {
						displayText = Engine.Localize( mapData.mapName )
					},
					properties = {
						map_name = map_name
					}
				} )
			end
		end
		return mapsWithCollectibles
	end
	 ),
	CollectiblesList = ListHelper_SetupDataSource( "PDV_CollectiblesList", function ( controller )
		local collectiblesList = {}
		for map_name, mapData in pairs( CoD.mapsTable ) do
			if mapData.collectibles and mapData.collectibles ~= "" and (not CoD.perController[controller].inspectingMap or CoD.perController[controller].inspectingMap == map_name) then
				local collectibles = Engine.GetAssetList( mapData.collectibles )
				for index, collectible in ipairs( collectibles ) do
					if CoD.perController[controller].inspectingMap or CoD.perController[controller].inspectingCollectibleSize == collectible.slotSize then
						table.insert( collectiblesList, {
							models = {
								name = collectible.name,
								shortName = collectible.displayNameShort,
								longName = collectible.displayNameLong,
								description = collectible.description,
								image = collectible.uiMaterial,
								imageLarge = collectible.uiMaterialLarge,
								mapDisplayName = mapData.mapName,
								unlocked = Engine.ClientHasCollectible( controller, map_name, index - 1 )
							},
							properties = {
								mapName = map_name,
								model = collectible.uiModel or "tag_origin",
								unlocked = Engine.ClientHasCollectible( controller, map_name, index - 1 )
							}
						} )
					end
				end
			end
		end
		local collectibleSortFn = function ( a, b )
			return b.models.unlocked and not a.models.unlocked
		end
		
		table.sort( collectiblesList, collectibleSortFn )
		return collectiblesList
	end
	 ),
	BookmarksList = ListHelper_SetupDataSource( "BookmarksList", function ( controller )
		local bookmarksList = {}
		table.insert( bookmarksList, {
			models = {
				bookmarkURLDesc = Engine.Localize( "BOOKMARK_DEFAULT" ),
				bookmarkURL = "home.htm",
				unlocked = true
			},
			properties = {
				mapName = "",
				unlocked = true
			}
		} )
		for map_name, mapData in pairs( CoD.mapsTable ) do
			if mapData.collectibles and mapData.collectibles ~= "" and (not CoD.perController[controller].inspectingMap or CoD.perController[controller].inspectingMap == map_name) then
				local collectibles = Engine.GetAssetList( mapData.collectibles )
				for index, collectible in ipairs( collectibles ) do
					if CoD.perController[controller].inspectingMap or CoD.perController[controller].inspectingCollectibleSize == collectible.slotSize then
						table.insert( bookmarksList, {
							models = {
								bookmarkURLDesc = collectible.codexURLDesc,
								bookmarkURL = collectible.codexURL,
								unlocked = Engine.ClientHasCollectible( controller, map_name, index - 1 )
							},
							properties = {
								mapName = map_name,
								unlocked = Engine.ClientHasCollectible( controller, map_name, index - 1 )
							}
						} )
					end
				end
			end
		end
		local bookmarkSortFn = function ( a, b )
			return b.models.unlocked and not a.models.unlocked
		end
		
		table.sort( bookmarksList, bookmarkSortFn )
		return bookmarksList
	end
	 ),
	StartMenuCollectables = ListHelper_SetupDataSource( "StartMenuCollectables", function ( controller )
		local collectiblesList = {}
		local currentMapName = Dvar.ui_mapname:get()
		if LUI.endswith( currentMapName, "2" ) or LUI.endswith( currentMapName, "3" ) then
			currentMapName = string.sub( currentMapName, 0, string.len( currentMapName ) - 1 )
		end
		for map_name, mapData in pairs( CoD.mapsTable ) do
			if map_name == currentMapName and mapData.collectibles ~= nil and mapData.collectibles ~= "" then
				local collectibles = Engine.GetAssetList( mapData.collectibles )
				for index, collectible in ipairs( collectibles ) do
					table.insert( collectiblesList, {
						models = {
							image = collectible.uiMaterial
						},
						properties = {
							unlocked = Engine.ClientHasCollectible( controller, currentMapName, index - 1 )
						}
					} )
				end
			end
		end
		return collectiblesList
	end
	 ),
	StartMenu = {
		getModel = function ( controller )
			local startMenuRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu" )
			local scoreModel = Engine.CreateModel( startMenuRoot, "score" )
			local clientNum = Engine.GetClientNum( controller )
			local clientData = Engine.GetPlayerListData( controller, clientNum )
			local score = 0
			if clientData.score ~= nil then
				score = clientData.score
			end
			Engine.SetModelValue( scoreModel, score )
			return startMenuRoot
		end
	},
	PlaceCollectiblesTabs = ListHelper_SetupDataSource( "PDV_PlaceCollectiblesTab", function ( controller )
		local tabList = {
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderl
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
				}
			}
		}
		if CoD.perController[controller].inspectingCollectibleSize then
			for _, item in ipairs( tabList ) do
				if item.properties and item.properties.collectibleSize == CoD.perController[controller].inspectingCollectibleSize then
					item.properties.selectIndex = true
					break
				end
			end
		end
		return tabList
	end
	 ),
	CollectiblesLayout = {
		getModel = function ( controller )
			local modelItems = {
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
			local collectiblesLayoutModel = Engine.CreateModel( Engine.GetModelForController( controller ), "collectiblesLayout" )
			local safehouseBunkClientModel = Engine.CreateModel( Engine.GetModelForController( controller ), "safehouse.inClientBunk" )
			if safehouseBunkClientModel then
				local inspectingClient = Engine.GetModelValue( safehouseBunkClientModel )
				local layoutData = Engine.GetCollectibleLayout( inspectingClient )
				for index, enumString in ipairs( modelItems ) do
					local layoutItemModel = Engine.CreateModel( collectiblesLayoutModel, enumString )
					local slotIndex = Enum.bunkCollectibleSlots_e[enumString]
					local f478_local3, f478_local4, f478_local5, f478_local6 = nil
					local f478_local7 = false
					local itemData = layoutData[slotIndex]
					if itemData and itemData.isSet and layoutItemModel then
						local mapData = CoD.mapsTable[itemData.mapName]
						if mapData and mapData.collectibles and mapData.collectibles ~= "" then
							local collectibleInfo = Engine.GetAssetInfoFromListIndex( mapData.collectibles, itemData.collectibleIndex )
							if collectibleInfo then
								f478_local3 = collectibleInfo.uiMaterial
								f478_local4 = collectibleInfo.uiMaterialLarge
								f478_local5 = collectibleInfo.displayNameLong
								f478_local6 = collectibleInfo.uiModel
								f478_local7 = true
							end
						end
					end
					Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "image" ), f478_local3 or "" )
					Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "imageLarge" ), f478_local4 or "" )
					Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "name" ), f478_local5 or "" )
					Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "model" ), f478_local6 or "tag_origin" )
					Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "collectibleSlot" ), slotIndex )
					Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "isSet" ), f478_local7 )
				end
			end
			return collectiblesLayoutModel
		end
	},
	MissionRecordVaultTabs = ListHelper_SetupDataSource( "MRV_MissionRecordVaultTabs", function ( controller )
		local tabList = {
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderl
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
					tabName = Engine.Localize( "MENU_MISSION_SELECT_CAPS" ),
					tabWidget = "CoD.MissionRecordVault_ReplayMission"
				}
			},
			{
				models = {
					tabIcon = CoD.buttonStrings.shoulderr
				}
			}
		}
		return tabList
	end
	, false, {
		getCount = function ( list )
			local f480_local0 = list
			local f480_local1 = list.menu
			if f480_local1 then
				f480_local1 = list.menu:getModel()
				if f480_local1 then
					local missionSelectModel = Engine.GetModel( list.menu:getModel(), "showMissionSelect" )
					f480_local1 = f480_local0 and missionSelectModel
				end
			end
			local f480_local2 = f480_local1
			local showMissionSelect = Engine.GetModelValue( f480_local1 )
			return ListHelper_GetCount( list ) + (f480_local2 and showMissionSelect) - 1
		end
		,
		getItem = function ( controller, list, index )
			if 5 <= index then
				local f481_local0 = list
				local f481_local1 = list.menu
				if f481_local1 then
					f481_local1 = list.menu:getModel()
					if f481_local1 then
						local missionSelectModel = Engine.GetModel( list.menu:getModel(), "showMissionSelect" )
						f481_local1 = f481_local0 and missionSelectModel
					end
				end
				local f481_local2 = f481_local1
				local showMissionSelect = Engine.GetModelValue( f481_local1 )
				if (f481_local2 and showMissionSelect) ~= 1 then
					index = index + 1
				end
			end
			return ListHelper_GetItem( controller, list, index )
		end
		
	} ),
	MissionRecordVaultMapInfo = {
		getModel = function ( controller )
			local currentMissionModel = Engine.CreateModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo" )
			local mapModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
			local f482_local0 = mapModel
			local mapId = Engine.GetModelValue( mapModel )
			local f482_local1 = f482_local0 and mapId
			local mapInfo = CoD.mapsTable[f482_local1]
			if mapInfo == nil then
				return currentMissionModel
			end
			Engine.SetModelValue( Engine.CreateModel( currentMissionModel, "mapId" ), f482_local1 )
			for i, field in ipairs( {
				"previewImage",
				"mapName",
				"mapDescription",
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
				Engine.SetModelValue( Engine.CreateModel( currentMissionModel, field ), mapInfo[field] )
			end
			local currentStats = Engine.GetPlayerStats( controller )
			local mapName = f482_local1
			if string.match( mapName, "[0-9]$" ) ~= nil then
				mapName = string.sub( mapName, 0, string.len( mapName ) - 1 )
			end
			local mapStats = currentStats.PlayerStatsByMap[mapName]
			if mapStats then
				for i, field in ipairs( {
					"HIGHEST_SCORE",
					"HIGHEST_KILLS",
					"HIGHEST_ASSISTS",
					"HIGHEST_DIFFICULTY"
				} ) do
					local f482_local6 = mapStats.highestStats[field]:get()
					if field == "HIGHEST_DIFFICULTY" then
						f482_local6 = f482_local6 - 1
					end
					Engine.SetModelValue( Engine.CreateModel( currentMissionModel, field ), f482_local6 )
				end
			end
			local extraMapInfo = Engine.GetGDTCampaignMapInfo( f482_local1 )
			if extraMapInfo ~= nil then
				for i, field in ipairs( {
					"mapObjective",
					"engageClose",
					"engageMedium",
					"engageLong",
					"resistanceText",
					"operationsBackground"
				} ) do
					Engine.SetModelValue( Engine.CreateModel( currentMissionModel, field ), extraMapInfo[field] )
				end
			end
			return currentMissionModel
		end
	},
	MissionRecordVaultMaps = ListHelper_SetupDataSource( "MissionRecordVaultMaps", function ( controller )
		local cpMaps = {}
		local sortMaps = function ( a, b )
			return CoD.mapsTable[a].unique_id < CoD.mapsTable[b].unique_id
		end
		
		for id, mapData in LUI.IterateTableBySortedKeys( CoD.mapsTable, sortMaps, nil ) do
			if mapData.isSubLevel == false and mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT and mapData.dlc_pack ~= -1 then
				table.insert( cpMaps, {
					models = {
						displayText = Engine.Localize( mapData.mapName )
					},
					properties = {
						mapId = id
					}
				} )
			end
		end
		return cpMaps
	end
	 ),
	MissionRecordVaultChallengeInfo = ListHelper_SetupDataSource( "MissionRecordVaultChallengeInfo", function ( controller )
		local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		local f485_local0 = nextMapNameModel
		local nextMapName = Engine.GetModelValue( nextMapNameModel )
		local f485_local1 = f485_local0 and nextMapName
		local f485_local2 = f485_local1
		local f485_local3 = CoD.mapsTable[f485_local1]
		if f485_local3 then
			local accoladeList = CoD.mapsTable[f485_local1].accoladelist
			f485_local3 = f485_local2 and accoladeList
		end
		local challengeList = {}
		local f485_local4 = f485_local3
		local accoladeList = Engine.GetAssetList( f485_local3 )
		local f485_local5 = f485_local4 and accoladeList
		if f485_local5 ~= nil then
			for i = 1, #f485_local5, 1 do
				challengeList[i] = {
					models = f485_local5[i]
				}
			end
		end
		local fakeStats = {
			"2",
			"100",
			"17:20",
			"1",
			"0"
		}
		local currentStats = Engine.GetPlayerStats( controller )
		local mapName = f485_local1
		if string.match( mapName, "[0-9]$" ) ~= nil then
			mapName = string.sub( mapName, 0, string.len( mapName ) - 1 )
		end
		for i = 1, #challengeList, 1 do
			local accoladeStat = currentStats.PlayerStatsByMap[mapName].accolades[i - 1]:get()
			local accoladeState = accoladeStat >> 29
			local accoladeValue = accoladeStat << 3
			accoladeValue = accoladeValue >> 3
			challengeList[i].models.completed = accoladeState ~= 0
			challengeList[i].models.challengeProgressQuantity = accoladeValue
		end
		return challengeList
	end
	 ),
	WeaponCustomCategory = ListHelper_SetupDataSource( "WeaponCustomizationCategory", function ( controller )
		local categoryList = {}
		local classModel = CoD.perController[controller].classModel
		local loadoutSlotName = CoD.perController[controller].weaponCategory
		local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. ".itemIndex" ) )
		local numAttachments = Engine.GetNumAttachments( weaponItemIndex )
		local attachmentSlotList = CoD.CACUtility.PrimaryAttachmentSlotNameList
		local attachmentLoadoutSlotName = "primaryattachment"
		if loadoutSlotName == "secondary" then
			attachmentSlotList = CoD.CACUtility.SecondaryAttachmentSlotNameList
			attachmentLoadoutSlotName = "secondaryattachment"
		end
		local getBaseItemModels = function ( displayText, type, name, image, paintjobSlot, paintjobIndex, paintjobSlotAndIndex )
			return {
				models = {
					displayText = displayText,
					type = type,
					name = name,
					image = image or "blacktransparent",
					paintjobSlot = paintjobSlot,
					paintjobIndex = paintjobIndex,
					paintjobSlotAndIndex = paintjobSlotAndIndex
				},
				properties = {}
			}
		end
		
		local getWeaponOptionRow = function ( displayText, type, name, image, paintjobSlot, paintjobIndex, paintjobSlotAndIndex )
			local item = getBaseItemModels( displayText, type, name, image, paintjobSlot, paintjobIndex, paintjobSlotAndIndex )
			item.properties.viewWidget = "CoD.WeaponCustomizationSelect"
			item.properties.xcamNotetrack = "select01"
			return item
		end
		
		local paintjobSlotModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobslot" )
		local paintjobIndexModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobindex" )
		local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobSlotModel, "itemIndex" ) )
		local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobIndexModel, "itemIndex" ) )
		local displayText = nil
		if Paintjobs_IsEnabled( nil, controller ) then
			local paintjobSlotAndIndex = paintjobSlot .. " " .. paintjobIndex
			table.insert( categoryList, getWeaponOptionRow( Engine.Localize( "MENU_FILESHARE_CATEGORY_PAINTJOBS" ), "paintjob", "", nil, paintjobSlot, paintjobIndex, paintjobSlotAndIndex ) )
		end
		local camoModel = Engine.GetModel( classModel, loadoutSlotName .. "camo" )
		local camoImage = Engine.GetModelValue( Engine.GetModel( camoModel, "image" ) )
		local camoName = Engine.GetModelValue( Engine.GetModel( camoModel, "name" ) )
		if not Dvar.ui_execdemo_beta:get() then
			table.insert( categoryList, getWeaponOptionRow( Engine.Localize( "MPUI_CAMO" ), "camo", camoName, camoImage, nil, nil, nil ) )
		end
		CoD.perController[controller].customReticleAttachmentIndex = 0
		return categoryList
	end
	, false ),
	WeaponOptions = {
		prepare = function ( controller, list, filter )
			if not CoD.WeaponOptionsTable then
				CoD.WeaponOptionsTable = CoD.GetWeaponOptionsTable( controller, list, filter )
			end
			list.weaponOptions = CoD.WeaponOptionsTable
		end,
		getCount = function ( list )
			if not DataSources.WeaponOptions.currentFilter and list.weaponOptions.filterList then
				return #list.weaponOptions.filterList
			elseif list.weaponOptions[DataSources.WeaponOptions.currentFilter] then
				return #list.weaponOptions[DataSources.WeaponOptions.currentFilter]
			else
				return 0
			end
		end,
		getItem = function ( controller, list, index )
			if not DataSources.WeaponOptions.currentFilter and list.weaponOptions.filterList then
				return list.weaponOptions.filterList[index]
			elseif list.weaponOptions[DataSources.WeaponOptions.currentFilter] then
				return list.weaponOptions[DataSources.WeaponOptions.currentFilter][index]
			else
				
			end
		end,
		setCurrentFilterItem = function ( filter )
			DataSources.WeaponOptions.currentFilter = filter
		end,
		getCurrentFilterItem = function ()
			return DataSources.WeaponOptions.currentFilter
		end,
		currentFilter = nil
	},
	AttachmentCosmeticVariantList = ListHelper_SetupDataSource( "AttachmentCosmeticVariantList", function ( controller )
		local acvList = {}
		local getBaseItemModels = function ( tableInfo, attachmentRef )
			return {
				models = {
					name = tableInfo.name,
					image = tableInfo.image or "blacktransparent"
				},
				properties = {
					variantIndex = tableInfo.variantIndex,
					attachmentRef = attachmentRef
				}
			}
		end
		
		local attachmentRef = CoD.WC_Category.ACV.selectedAttachment
		if CoD.WC_Category.ACV.attachmentTable[attachmentRef] then
			local tableInfoNone = {
				name = "MENU_NONE",
				image = "menu_cac_none",
				variantIndex = 0
			}
			table.insert( acvList, getBaseItemModels( tableInfoNone, attachmentRef ) )
			for index, tableInfo in ipairs( CoD.WC_Category.ACV.attachmentTable[attachmentRef].variants ) do
				table.insert( acvList, getBaseItemModels( tableInfo, attachmentRef ) )
			end
		end
		return acvList
	end
	, true ),
	ArenaRank = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "ArenaRank" )
		end
	},
	LoadingScreenPlayerListTeam1 = {
		prepare = function ( controller, list, filter )
			local gameClientUpdateModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
			if list.teamCountSubscription then
				list:removeSubscription( list.teamCountSubscription )
			end
			list.teamCountSubscription = list:subscribeToModel( gameClientUpdateModel, function ()
				list:updateDataSource()
			end, false )
			local gameLobbyData = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
			local lobbyClientData = {
				teamInfo = {}
			}
			lobbyClientData.teamInfo[1] = {}
			lobbyClientData.teamInfo[2] = {}
			local lobbyMemberCount = 0
			local maxTeams = 2
			local f497_local0 = Engine.GetGametypeSetting( "teamCount" ) < 2
			local maxMembersToShowOnEachTeam = 6
			if f497_local0 then
				maxMembersToShowOnEachTeam = 12
			end
			list.maxMembersToShowOnEachTeam = maxMembersToShowOnEachTeam
			if gameLobbyData and gameLobbyData.sessionClients then
				lobbyMemberCount = #gameLobbyData.sessionClients
				local selfTeam = nil
				for index = 1, lobbyMemberCount, 1 do
					local currClientData = gameLobbyData.sessionClients[index]
					local team = currClientData.team
					local xuid = currClientData.xuid
					local name = currClientData.gamertag
					if f497_local0 or team == Enum.team_t.TEAM_ALLIES or team == Enum.team_t.TEAM_FREE then
						table.insert( lobbyClientData.teamInfo[1], {
							name = name,
							xuid = xuid
						} )
					elseif team == Enum.team_t.TEAM_AXIS then
						table.insert( lobbyClientData.teamInfo[2], {
							name = name,
							xuid = xuid
						} )
					end
					local selfXuid = Engine.GetXUID64( controller )
					if Engine.CompareUInt64( selfXuid, xuid, "=" ) then
						selfTeam = team
					end
				end
				local globalModel = Engine.GetGlobalModel()
				local loadingScreenInfoModel = Engine.CreateModel( globalModel, "LoadingScreenInfo" )
				local loadingScreenPlayerListModel = Engine.CreateModel( loadingScreenInfoModel, "LoadingScreenPlayerList" )
				local team1Model = Engine.CreateModel( loadingScreenPlayerListModel, "team1" )
				local team1CountModel = Engine.CreateModel( team1Model, "count" )
				local team2Model = Engine.CreateModel( loadingScreenPlayerListModel, "team2" )
				local team2CountModel = Engine.CreateModel( team2Model, "count" )
				list.team1CountModel = team1CountModel
				list.team1BaseModel = team1Model
				list.team2CountModel = team2CountModel
				list.team2BaseModel = team2Model
				lobbyClientData.teamInfo[1].teamModel = team1Model
				lobbyClientData.teamInfo[2].teamModel = team2Model
				Engine.SetModelValue( team1CountModel, #lobbyClientData.teamInfo[1] )
				Engine.SetModelValue( team2CountModel, #lobbyClientData.teamInfo[2] )
				if not f497_local0 and selfTeam ~= Enum.team_t.TEAM_ALLIES then
					lobbyClientData.teamInfo[1].teamModel = team2Model
					lobbyClientData.teamInfo[2].teamModel = team1Model
					Engine.SetModelValue( team1CountModel, #lobbyClientData.teamInfo[2] )
					Engine.SetModelValue( team2CountModel, #lobbyClientData.teamInfo[1] )
				end
				for team = 1, maxTeams, 1 do
					for i = 1, maxMembersToShowOnEachTeam, 1 do
						local memberModel = Engine.CreateModel( lobbyClientData.teamInfo[team].teamModel, "member" .. i )
						if lobbyClientData.teamInfo[team][i] then
							local xuidModel = Engine.CreateModel( memberModel, "playerxuid" )
							Engine.SetModelValue( xuidModel, lobbyClientData.teamInfo[team][i].xuid )
							local nameModel = Engine.CreateModel( memberModel, "playerName" )
							Engine.SetModelValue( nameModel, lobbyClientData.teamInfo[team][i].name )
							local heroLoadoutItemModel = Engine.CreateModel( memberModel, "playerHeroLoadoutItem" )
							local heroLoadoutItemIndex = 0
							local heroLoadoutItemIndex = Engine.GetHeroLoadoutItemIndexLobbyData( Engine.CurrentSessionMode(), lobbyClientData.teamInfo[team][i].xuid )
							local heroLoadoutItemName = ""
							if heroLoadoutItemIndex ~= 0 then
								heroLoadoutItemName = Engine.GetItemName( heroLoadoutItemIndex )
							end
							Engine.SetModelValue( heroLoadoutItemModel, heroLoadoutItemName )
							local selfXuid = Engine.GetXUID64( controller )
							local areXuidsEqual = Engine.CompareUInt64( selfXuid, lobbyClientData.teamInfo[team][i].xuid, "=" )
							local isSelfPlayerNameModel = Engine.CreateModel( memberModel, "isSelfPlayerName" )
							Engine.SetModelValue( isSelfPlayerNameModel, areXuidsEqual )
						end
					end
				end
			else
				return 
			end
		end,
		getCount = function ( list )
			if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
				return 0
			else
				local team1Count = Engine.GetModelValue( list.team1CountModel )
				local team2Count = Engine.GetModelValue( list.team2CountModel )
				local maxMembersToShowOnEachTeam = list.maxMembersToShowOnEachTeam
				if not (Engine.GetGametypeSetting( "teamCount" ) >= 2 or team1Count > maxMembersToShowOnEachTeam) or team1Count <= maxMembersToShowOnEachTeam and team2Count <= maxMembersToShowOnEachTeam then
					return team1Count
				else
					return 0
				end
			end
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.team1BaseModel, "member" .. index )
		end
	},
	LoadingScreenPlayerListTeam2 = {
		prepare = function ( controller, list, filter )
			DataSources.LoadingScreenPlayerListTeam1.prepare( controller, list, filter )
		end,
		getCount = function ( list )
			if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
				return 0
			else
				local team1Count = Engine.GetModelValue( list.team1CountModel )
				local team2Count = Engine.GetModelValue( list.team2CountModel )
				local maxMembersToShowOnEachTeam = list.maxMembersToShowOnEachTeam
				if team1Count <= maxMembersToShowOnEachTeam and team2Count <= maxMembersToShowOnEachTeam then
					return team2Count
				else
					return 0
				end
			end
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.team2BaseModel, "member" .. index )
		end
	},
	MapInfo = {
		getModel = function ( controller )
			local globalModel = Engine.GetGlobalModel()
			local mapinfoModel = Engine.CreateModel( globalModel, "MapInfo" )
			local gameTypeIconModel = Engine.CreateModel( mapinfoModel, "gameTypeIcon" )
			Engine.SetModelValue( gameTypeIconModel, CoD.GetLoadingScreenGameTypeIconName() )
			local gameTypeTextModel = Engine.CreateModel( mapinfoModel, "gameType" )
			Engine.SetModelValue( gameTypeTextModel, Dvar.ls_gametype:get() )
			local mapNameModel = Engine.CreateModel( mapinfoModel, "mapName" )
			Engine.SetModelValue( mapNameModel, Dvar.ls_mapname:get() )
			local mapImageModel = Engine.CreateModel( mapinfoModel, "mapImage" )
			local mapImage = CoD.GetMapValue( Dvar.ui_mapname:get(), "loadingImage", "black" )
			Engine.SetModelValue( mapImageModel, mapImage )
			local mapDateTimeModel = Engine.CreateModel( mapinfoModel, "dateTime" )
			Engine.SetModelValue( mapDateTimeModel, CoD.GetMapValue( Engine.GetCurrentMapName(), "mapDateTime", "" ) )
			local locationModel = Engine.CreateModel( mapinfoModel, "location" )
			Engine.SetModelValue( locationModel, Dvar.ls_maplocation:get() )
			return mapinfoModel
		end
	},
	LoadingScreenTeamInfo = {
		getModel = function ( controller )
			local perControllerModel = Engine.GetModelForController( controller )
			local loadingScreenInfoModel = Engine.CreateModel( perControllerModel, "LoadingScreenInfo" )
			local loadingScreenTeamInfoModel = Engine.CreateModel( loadingScreenInfoModel, "LoadingScreenTeamInfo" )
			local team1FactionNameModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team1FactionName" )
			local team2FactionNameModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team2FactionName" )
			local team1FactionIconModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team1FactionIcon" )
			local team2FactionIconModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team2FactionIcon" )
			local team1FactionColorModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team1FactionColor" )
			local team2FactionColorModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team2FactionColor" )
			local gameTypeIconModel = Engine.CreateModel( loadingScreenTeamInfoModel, "gameTypeIcon" )
			local gameTypeTextModel = Engine.CreateModel( loadingScreenTeamInfoModel, "gameType" )
			local mapNameModel = Engine.CreateModel( loadingScreenTeamInfoModel, "mapName" )
			local locationModel = Engine.CreateModel( loadingScreenTeamInfoModel, "location" )
			local tipModel = Engine.CreateModel( loadingScreenTeamInfoModel, "tip" )
			local statusTextModel = Engine.CreateModel( loadingScreenTeamInfoModel, "statusText" )
			local loadedFractionModel = Engine.CreateModel( loadingScreenTeamInfoModel, "loadedFraction" )
			local team1Info, team2Info = nil
			local selfTeam = CoD.GetTeamID( controller )
			local alliesInfo = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			local axisInfo = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
			if selfTeam == Enum.team_t.TEAM_SPECTATOR then
				if CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
					team1Info = axisInfo
					team2Info = alliesInfo
				else
					team1Info = alliesInfo
					team2Info = axisInfo
				end
			elseif selfTeam == Enum.team_t.TEAM_ALLIES then
				team1Info = alliesInfo
				team2Info = axisInfo
			else
				team1Info = axisInfo
				team2Info = alliesInfo
			end
			Engine.SetModelValue( team1FactionNameModel, team1Info.name )
			Engine.SetModelValue( team1FactionIconModel, team1Info.icon )
			Engine.SetModelValue( team1FactionColorModel, team1Info.color )
			Engine.SetModelValue( team2FactionNameModel, team2Info.name )
			Engine.SetModelValue( team2FactionIconModel, team2Info.icon )
			Engine.SetModelValue( team2FactionColorModel, team2Info.color )
			Engine.SetModelValue( gameTypeIconModel, CoD.GetLoadingScreenGameTypeIconName() )
			Engine.SetModelValue( gameTypeTextModel, Dvar.ls_gametype:get() )
			Engine.SetModelValue( mapNameModel, Dvar.ls_mapname:get() )
			Engine.SetModelValue( locationModel, "" )
			if CoD.Loading ~= nil then
				Engine.SetModelValue( tipModel, CoD.Loading.GetDidYouKnowString() )
			end
			Engine.SetModelValue( statusTextModel, "" )
			Engine.SetModelValue( loadedFractionModel, 0 )
			return loadingScreenTeamInfoModel
		end
	},
	AbilityWheel = {
		getModel = function ( controller )
			local buttonNumMapping = CoD.CACUtility.abilityButtonNumMapping
			local AbilityWheelRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "AbilityWheel" )
			local typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" )
			Engine.CreateModel( AbilityWheelRoot, "selectedAbilityDisplayName" )
			Engine.CreateModel( AbilityWheelRoot, "selectedAbilityDisplayDesc" )
			if Engine.GetModelValue( typeModel ) == nil then
				Engine.SetModelValue( typeModel, 0 )
			end
			local typeModelValue = Engine.GetModelValue( typeModel )
			local cyberComStrings = {
				"MENU_CONTROL",
				"MENU_MARTIAL",
				"MENU_CHAOS",
				"MENU_DEMO"
			}
			Engine.SetModelValue( Engine.CreateModel( AbilityWheelRoot, "name" ), cyberComStrings[typeModelValue + 1] )
			local clearAbilityModel = function ( AbilityModel )
				local nameModel = Engine.CreateModel( AbilityModel, "name" )
				Engine.SetModelValue( nameModel, nil )
				local imageModel = Engine.CreateModel( AbilityModel, "image" )
				Engine.SetModelValue( imageModel, nil )
				local buttonEnabled = Engine.CreateModel( AbilityModel, "enabled" )
				Engine.SetModelValue( buttonEnabled, false )
			end
			
			local abilityCount = 0
			local contextualCount = 0
			for i = 1, CoD.CACUtility.maxAbilities, 1 do
				local tacticalItemInfo = Engine.GetTacticalMenuItems( controller, i - 1, typeModelValue )
				local Ability = nil
				if tacticalItemInfo.contextual then
					Ability = Engine.CreateModel( AbilityWheelRoot, "AbilityWheelContextualWeapon" .. contextualCount + 1 )
				else
					Ability = Engine.CreateModel( AbilityWheelRoot, "AbilityWheelWeapon" .. buttonNumMapping[abilityCount + 1] )
				end
				local imageModel = Engine.CreateModel( Ability, "image" )
				Engine.SetModelValue( imageModel, tacticalItemInfo.image )
				local nameModel = Engine.CreateModel( Ability, "name" )
				Engine.SetModelValue( nameModel, tacticalItemInfo.name )
				local displayNameModel = Engine.CreateModel( Ability, "displayName" )
				Engine.SetModelValue( displayNameModel, tacticalItemInfo.displayName )
				local abilityFlag = Engine.CreateModel( Ability, "abilityFlag" )
				Engine.SetModelValue( abilityFlag, tacticalItemInfo.abilityFlag )
				local buttonEnabled = Engine.CreateModel( Ability, "enabled" )
				if tacticalItemInfo.enabled == nil then
					Engine.SetModelValue( buttonEnabled, true )
				else
					Engine.SetModelValue( buttonEnabled, tacticalItemInfo.enabled )
				end
				local description = Engine.CreateModel( Ability, "description" )
				if tacticalItemInfo.description ~= nil then
					Engine.SetModelValue( description, "weapon_" .. tacticalItemInfo.description )
				end
			end
			for i = abilityCount + 1, CoD.CACUtility.maxAbilityWheelItems, 1 do
				local Ability = Engine.CreateModel( AbilityWheelRoot, "AbilityWheelWeapon" .. buttonNumMapping[i] )
				clearAbilityModel( Ability )
			end
			for i = contextualCount + 1, CoD.CACUtility.maxContextualAbilityItems, 1 do
				local Ability = Engine.CreateModel( AbilityWheelRoot, "AbilityWheelContextualWeapon" .. i )
				clearAbilityModel( Ability )
			end
			return AbilityWheelRoot
		end
	},
	SwitchCameraWheel = {
		getModel = function ( controller )
			local cameraModes = {
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
			local root = Engine.CreateModel( Engine.GetModelForController( controller ), "SwitchCameraWheel" )
			Engine.CreateModel( root, "selectedCameraDisplayName" )
			Engine.CreateModel( root, "selectedCameraDisplayDesc" )
			Engine.SetModelValue( Engine.CreateModel( root, "name" ), Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_SWITCH_CAMERA" ) ) )
			for i = 1, #cameraModes, 1 do
				local cameraModeInst = cameraModes[i]
				local cameraModel = Engine.CreateModel( root, "Camera" .. i )
				local displayNameModel = Engine.CreateModel( cameraModel, "displayName" )
				Engine.SetModelValue( displayNameModel, Engine.Localize( cameraModeInst.displayName ) )
				local description = Engine.CreateModel( cameraModel, "description" )
				Engine.SetModelValue( description, Engine.Localize( cameraModeInst.displayName .. "_DESC" ) )
				local imageModel = Engine.CreateModel( cameraModel, "image" )
				Engine.SetModelValue( imageModel, cameraModeInst.image )
				local buttonDisabled = Engine.CreateModel( cameraModel, "disabled" )
				Engine.SetModelValue( buttonDisabled, cameraModeInst.disabled )
				local cameraMode = Engine.CreateModel( cameraModel, "cameraMode" )
				Engine.SetModelValue( cameraMode, cameraModeInst.cameraMode )
				if cameraModeInst.freeCameraMode ~= nil then
					local freeCameraMode = Engine.CreateModel( cameraModel, "freeCameraMode" )
					Engine.SetModelValue( freeCameraMode, cameraModeInst.freeCameraMode )
				end
			end
			return root
		end
	},
	CommsMessages = ListHelper_SetupDataSource( "CommsMessages", function ( controller )
		local messageList = {}
		for i = 1, 5, 1 do
			table.insert( messageList, {
				models = {
					icon = "",
					messageText = ""
				},
				properties = {
					messageIndex = i
				}
			} )
		end
		return messageList
	end
	 ),
	CommsWidget = {
		getModel = function ( controller )
			local perControllerModel = Engine.GetModelForController( controller )
			local commsWidgetModel = Engine.CreateModel( perControllerModel, "CommsWidget" )
			local characterNameModel = Engine.CreateModel( commsWidgetModel, "characterName" )
			Engine.SetModelValue( characterNameModel, "COOP_KANYE_RACHEL" )
			local characterImageModel = Engine.CreateModel( commsWidgetModel, "characterImage" )
			Engine.SetModelValue( characterImageModel, "t7_cp_hud_commswidget_rachel" )
			return commsWidgetModel
		end
	},
	VehicleInfo = {
		setButtonModels = function ( controller, actionSlots, bindingColor )
			local vehicleModel = Engine.GetModel( Engine.GetModelForController( controller ), "vehicle" )
			if not vehicleModel then
				return 
			end
			local bindingsModel = Engine.GetModel( vehicleModel, "bindings" )
			if bindingsModel then
				Engine.UnsubscribeAndFreeModel( bindingsModel )
			end
			bindingsModel = Engine.CreateModel( vehicleModel, "bindings" )
			Engine.SetModelValue( Engine.CreateModel( bindingsModel, "color" ), bindingColor or "255 255 255" )
			if not actionSlots then
				actionSlots = {}
			end
			local isGamepad = IsGamepad( controller )
			if vehicleModel then
				local bindsInfo = {}
				for index, bindData in ipairs( actionSlots ) do
					if bindData.bindCommand then
						local bindPlacement, bindPlacement2 = Engine.GetBindingButtonString( controller, bindData.bindCommand )
						if bindPlacement then
							if isGamepad then
								Engine.SetModelValue( Engine.CreateModel( bindingsModel, bindPlacement .. ".text" ), bindData.text )
							end
							bindData.bindPlacement = bindPlacement
						end
						if bindPlacement2 then
							if isGamepad then
								Engine.SetModelValue( Engine.CreateModel( bindingsModel, bindPlacement2 .. ".text" ), bindData.text )
							end
							bindData.bindPlacement2 = bindPlacement2
						end
					end
					bindsInfo[index] = bindData
				end
				f511_local0 = function ( modelName, valueTable )
					local imageModel = Engine.CreateModel( vehicleModel, modelName .. ".imageText" )
					if valueTable then
						if valueTable.bindCommand and valueTable.bindCommand ~= "" then
							local bindingPrompt = Engine.KeyBinding( controller, valueTable.bindCommand )
							Engine.SetModelValue( Engine.CreateModel( bindingsModel, modelName .. ".bind" ), bindingPrompt )
							Engine.SetModelValue( imageModel, bindingPrompt )
						else
							Engine.SetModelValue( imageModel, valueTable.imageText or "" )
						end
					else
						Engine.SetModelValue( imageModel, "" )
					end
					local textModel = Engine.CreateModel( vehicleModel, modelName .. ".text" )
					if valueTable and valueTable.text and valueTable.text ~= "" then
						Engine.SetModelValue( Engine.CreateModel( bindingsModel, modelName .. ".text" ), valueTable.text )
						Engine.SetModelValue( textModel, valueTable.text )
					else
						Engine.SetModelValue( textModel, "" )
					end
				end
				
				local reverseArray = function ( list )
					local reversedTable = {}
					local itemCount = #list
					for k, v in ipairs( list ) do
						reversedTable[itemCount + 1 - k] = v
					end
					return reversedTable
				end
				
				local leftButtonModels, index = nil
				if CoD.isPC then
					leftButtonModels = reverseArray( {
						"LEFT_3",
						"LEFT_2",
						"LEFT_1",
						"LEFT_0"
					} )
					index = reverseArray( {
						"RIGHT_3",
						"RIGHT_2",
						"RIGHT_1",
						"RIGHT_0"
					} )
				else
					leftButtonModels = reverseArray( {
						"topLeftButton",
						"middleLeftButton",
						"bottomLeftButton"
					} )
					index = reverseArray( {
						"topRightButton",
						"middleRightButton",
						"bottomRightButton"
					} )
				end
				if isGamepad then
					local leftBindPlacementListGamepad = {
						"L_STICK",
						"BUTTON_LSTICK",
						"BUTTON_LSHLDR",
						"BUTTON_LTRIG",
						"BUTTON_X",
						"BUTTON_A"
					}
					local rightBindPlacementListGamepad = {
						"R_STICK",
						"BUTTON_RSTICK",
						"BUTTON_RSHLDR",
						"BUTTON_RTRIG"
					}
					local bindDataToSetGamepad = function ( bindDataList )
						local set = {}
						for _, l in ipairs( bindDataList ) do
							if l.bindPlacement ~= nil then
								set[l.bindPlacement] = l
							end
						end
						return set
					end
					
					local bindsInfoGamepad = bindDataToSetGamepad( bindsInfo )
					local processBindingModelsGamepad = function ( actions, models, bindDataList )
						for i, item in ipairs( actions ) do
							if bindDataList[item] then
								f511_local0( models[1], bindDataList[item] )
								table.remove( models, 1 )
								if #models == 0 then
									break
								end
							end
						end
						for i, item in ipairs( models ) do
							f511_local0( item, nil )
						end
					end
					
					leftActions = reverseArray( leftBindPlacementListGamepad )
					processBindingModelsGamepad( leftActions, leftButtonModels, bindsInfoGamepad )
					rightActions = reverseArray( rightBindPlacementListGamepad )
					processBindingModelsGamepad( rightActions, index, bindsInfoGamepad )
				else
					local keyboardBindPlacementList = {
						"KEYBOARD_MOVE",
						"KEYBOARD_BUTTON",
						"left"
					}
					local mouseBindPlacementList = {
						"MOUSE_LOOK",
						"MOUSE_BUTTON",
						"right"
					}
					local processBindingModels = function ( actions, models, bindDataList )
						local getBindDataForAction = function ( list, action )
							for i, bindData in ipairs( list ) do
								if bindData.bindCommand == "+lookstick" then
									table.remove( list, i )
								end
								if bindData.screenSide then
									if bindData.screenSide == action then
										table.remove( list, i )
										return bindData
									end
								end
								if bindData.bindPlacement == action then
									table.remove( list, i )
									return bindData
								end
							end
							return nil
						end
						
						for i, item in ipairs( actions ) do
							local f516_local3 = getBindDataForAction( bindDataList, item )
							while f516_local3 ~= nil do
								f511_local0( models[1], f516_local3 )
								table.remove( models, 1 )
								if #models == 0 then
									
								end
								f516_local3 = getBindDataForAction( bindDataList, item )
							end
						end
						for i, item in ipairs( models ) do
							f511_local0( item, nil )
						end
					end
					
					leftActions = reverseArray( keyboardBindPlacementList )
					processBindingModels( leftActions, leftButtonModels, bindsInfo )
					rightActions = reverseArray( mouseBindPlacementList )
					processBindingModels( rightActions, index, bindsInfo )
				end
			end
		end,
		clearButtonModels = function ( controller )
			DataSources.VehicleInfo.setButtonModels( controller )
		end
	},
	Attacker = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "Attacker" )
		end
	},
	Victim = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "Victim" )
		end
	},
	TopPlayerInfoData1 = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "topPlayerInfo1" )
		end
	},
	TopPlayerInfoData2 = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "topPlayerInfo2" )
		end
	},
	TopPlayerInfoData3 = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "topPlayerInfo3" )
		end
	},
	SocialTabs = ListHelper_SetupDataSource( "SocialTabs", function ( controller )
		local socialRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
		local tabModel = Engine.CreateModel( socialRootModel, "tab" )
		local lastSelected = Engine.GetModelValue( tabModel )
		if lastSelected == nil then
			lastSelected = "friends"
		end
		local disablePartyManagerTab = false
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		local f524_local0 = table.insert
		local f524_local1 = tabList
		local f524_local2 = {
			models = {
				tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
				tabWidget = "CoD.Social_Party"
			}
		}
		local f524_local3 = {
			tabId = "party",
			selectIndex = false
		}
		local f524_local4
		if Dvar.partyPrivacyEnabled:get() then
			f524_local4 = disablePartyManagerTab
		else
			f524_local4 = true
		end
		f524_local3.disabled = f524_local4
		f524_local2.properties = f524_local3
		f524_local0( f524_local1, f524_local2 )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "MENU_FRIENDS_CAPS" ),
				tabWidget = "CoD.Social_Friends"
			},
			properties = {
				tabId = "friends",
				selectIndex = false
			}
		} )
		if not Dvar.ui_execdemo:get() then
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "GROUPS_CAPS" ),
					tabWidget = "CoD.Social_Groups"
				},
				properties = {
					tabId = "groups",
					selectIndex = false,
					disabled = true
				}
			} )
		end
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ),
				tabWidget = "CoD.Social_RecentPlayers"
			},
			properties = {
				tabId = "recent",
				selectIndex = false
			}
		} )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for i = 1, #tabList, 1 do
			if tabList[i].properties ~= nil then
				if tabList[i].properties.tabId == lastSelected then
					tabList[i].properties.selectIndex = true
				else
					tabList[i].properties.selectIndex = false
				end
			end
		end
		return tabList
	end
	, true ),
	SocialOnlinePlayersList = ListHelper_SetupDataSource( "SocialOnlinePlayersList", function ( controller )
		local socialMembers = {}
		local filter = Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE | Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
		local listFiends = {}
		local showfriend = false
		local showlastmet = false
		local socialRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
		local tabModel = Engine.GetModel( socialRootModel, "tab" )
		local tabModelValue = Engine.GetModelValue( tabModel )
		if tabModelValue == "friends" then
			showfriend = false
			showlastmet = false
			listFiends = Engine.GetOnlineFriendsList( controller, 0, 7, filter )
		elseif tabModelValue == "recent" then
			showfriend = true
			showlastmet = true
			listFiends = Engine.GetRecentPlayersList( controller, 0, 7, filter )
		elseif tabModelValue == "party" then
			showfriend = false
			showlastmet = false
			local currentMenuIdx = Engine.GetLobbyUIScreen()
			local currTarget = LobbyData:UITargetFromId( currentMenuIdx )
			local gameActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
			local partyList = nil
			if gameActive and currTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
				partyList = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
			else
				partyList = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			end
			local titleData = Engine.GetTitleData( Engine.GetPrimaryController() )
			for clientIndex, client in ipairs( partyList.sessionClients ) do
				listFiends[clientIndex] = {}
				local playerInfo = listFiends[clientIndex]
				playerInfo.xuid = client.xuid
				playerInfo.gamertag = client.gamertag
				playerInfo.clantag = client.clantag
				playerInfo.isLocal = client.isLocal
				playerInfo.activity = titleData.activity
				playerInfo.context = titleData.context
				playerInfo.joinable = Enum.LobbyJoinable.LOBBY_JOINABLE_NO_NOT_IN_LOBBY
				playerInfo.gametype = titleData.gametype
				playerInfo.mapid = titleData.mapid
				playerInfo.friend = 1
				playerInfo.titlePresence = ""
				playerInfo.cpRank = client.cpRank
				playerInfo.cpRankIcon = client.cpRankIcon
				playerInfo.mpRank = client.mpRank
				playerInfo.mpRankIcon = client.mpRankIcon
				playerInfo.zmRank = client.zmRank
				playerInfo.zmRankIcon = client.zmRankIcon
			end
		else
			listFiends = Engine.GetOnlineFriendsList( controller, 0, 7, filter )
		end
		for i = 1, #listFiends, 1 do
			local playerInfo = listFiends[i]
			local clantag = ""
			local fullname = string.format( "%s %s", clantag, playerInfo.gamertag )
			local titlePresence = ""
			if showlastmet then
				titlePresence = playerInfo.titlePresence
			end
			local isLocal = "0"
			if playerInfo.isLocal == 1 then
				isLocal = "1"
			end
			table.insert( socialMembers, {
				models = {
					xuid = playerInfo.xuid,
					gamertag = playerInfo.gamertag,
					clantag = clantag,
					fullname = fullname,
					isLocal = isLocal,
					activity = playerInfo.activity,
					context = playerInfo.context,
					difficulty = playerInfo.difficulty,
					playlist = playerInfo.playlist,
					joinable = playerInfo.joinable,
					gametype = playerInfo.gametype,
					mapid = playerInfo.mapid,
					friend = playerInfo.friend,
					titlePresence = titlePresence,
					cpRank = playerInfo.cpRank,
					cpRankIcon = playerInfo.cpRankIcon,
					mpRank = playerInfo.mpRank,
					mpRankIcon = playerInfo.mpRankIcon .. "_lrg",
					zmRank = playerInfo.zmRank,
					zmRankIcon = playerInfo.zmRankIcon
				},
				properties = {
					xuid = playerInfo.xuid,
					showyourfriend = showfriend,
					showlastmet = showlastmet,
					gametype = playerInfo.gametype,
					mapid = playerInfo.mapid,
					difficulty = playerInfo.difficulty,
					playlist = playerInfo.playlist
				}
			} )
		end
		return socialMembers
	end
	, nil, nil, function ( controller, list, listModel )
		local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local tabModel = Engine.GetModel( socialRootModel, "tab" )
		local tabModelValue = Engine.GetModelValue( tabModel )
		local socialSubModel = Engine.GetModel( socialRootModel, "friends" )
		if tabModelValue == "friends" then
			socialSubModel = Engine.GetModel( socialRootModel, "friends" )
		elseif tabModelValue == "recent" then
			socialSubModel = Engine.GetModel( socialRootModel, "recentPlayers" )
		elseif tabModelValue == "party" then
			socialSubModel = Engine.GetModel( socialRootModel, "party" )
		end
		local socialUpdateModel = Engine.GetModel( socialSubModel, "update" )
		if list.socialUpdateSubscription then
			list:removeSubscription( list.socialUpdateSubscription )
		end
		list.socialUpdateSubscription = list:subscribeToModel( socialUpdateModel, function ()
			RefreshListFindSelectedXuid( controller, list )
		end, false )
		if list.socialPartyUpdateSubscription then
			list:removeSubscription( list.socialPartyUpdateSubscription )
		end
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local privateClient = Engine.GetModel( lobbyRootModel, "privateClient" )
		local privateClientUpdateModel = Engine.GetModel( privateClient, "update" )
		list.socialPartyUpdateSubscription = list:subscribeToModel( privateClientUpdateModel, function ()
			RefreshListFindSelectedXuid( controller, list )
		end, false )
	end
	 ),
	SocialMainMenu = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu" )
			return model
		end
	},
	SocialPlayersList = {
		prepare = function ( controller, list, filter )
			list.numElementsInList = list.vCount
			list.controller = controller
			list.filter = Enum.PresenceFilter.PRESENCE_FILTER_ALL
			local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
			local tabModel = Engine.GetModel( socialRootModel, "tab" )
			local tabModelValue = Engine.GetModelValue( tabModel )
			if tabModelValue == "friends" then
				list.showyourfriend = false
				list.showlastmet = false
				list.GetList = Engine.GetFriends
				list.GetParty = Engine.GetFriendPartry
				list.playerCount = Engine.GetFriendsCount( controller, list.filter )
				list.socialSubModel = Engine.GetModel( socialRootModel, "friends" )
			elseif tabModelValue == "recent" then
				list.showyourfriend = true
				list.showlastmet = true
				list.GetList = Engine.GetRecentPlayersList
				list.GetParty = Engine.GetGetRecentPlayerParty
				list.playerCount = Engine.GetRecentPlayersCount( controller, list.filter )
				list.socialSubModel = Engine.GetModel( socialRootModel, "recentPlayers" )
			else
				list.showyourfriend = false
				list.showlastmet = false
				list.GetList = Engine.GetFriends
				list.GetParty = Engine.GetFriendPartry
				list.playerCount = Engine.GetFriendsCount( controller, list.filter )
				list.socialSubModel = Engine.GetModel( socialRootModel, "friends" )
			end
			list.players = {}
			local emptyPlayerInfo = {
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
				cpPlayed = false,
				cpRank = 0,
				cpRankIcon = "",
				mpPlayed = false,
				mpRank = 0,
				mpRankIcon = "",
				zmPlayed = false,
				zmRank = 0,
				zmRankIcon = "",
				partySize = 1,
				partyMax = 9
			}
			local emptyProperties = {
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
			for i = 1, list.numElementsInList, 1 do
				list.players[i] = {}
				list.players[i].root = Engine.CreateModel( list.socialSubModel, "player_" .. i )
				list.players[i].model = Engine.CreateModel( list.players[i].root, "model" )
				list.players[i].properties = {
					xuid = 0,
					showyourfriend = 0,
					showlastmet = 0,
					gametype = 0,
					mapid = 0,
					difficulty = 0,
					playlist = 1
				}
				for key, value in pairs( emptyPlayerInfo ) do
					local model = Engine.CreateModel( list.players[i].model, key )
				end
			end
			list.updateModels = function ( controller, list, offset, count )
				if not list.GetList then
					return 
				end
				local listPlayers = {}
				listPlayers = list.GetList( controller, offset, count, list.filter )
				for i = 1, #listPlayers, 1 do
					local playerInfo = listPlayers[i]
					local elementIndex = (offset + i - 1) % list.numElementsInList + 1
					playerInfo.clantag = ""
					playerInfo.fullname = string.format( "%s%s", playerInfo.clantag, playerInfo.gamertag )
					if list.showlastmet == 0 then
						playerInfo.titlePresence = ""
					end
					if LuaUtils.IsBetaBuild() then
						playerInfo.cpPlayed = false
						playerInfo.cpRank = 0
						playerInfo.cpPrestige = 0
						playerInfo.zmPlayed = false
						playerInfo.zmRank = 0
						playerInfo.zmPrestige = 0
					end
					playerInfo.cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", playerInfo.cpPlayed, playerInfo.cpRank, playerInfo.cpPrestige )
					playerInfo.mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", playerInfo.mpPlayed, playerInfo.mpRank, playerInfo.mpPrestige )
					playerInfo.zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", playerInfo.zmPlayed, playerInfo.zmRank, playerInfo.zmPrestige )
					for key, value in pairs( playerInfo ) do
						local valueModel = Engine.GetModel( list.players[elementIndex].model, key )
						if valueModel ~= nil then
							Engine.SetModelValue( valueModel, value )
						end
						if list.players[elementIndex].properties[key] ~= nil then
							list.players[elementIndex].properties[key] = value
						end
					end
					list.players[elementIndex].properties.showlastmet = list.showlastmet
					list.players[elementIndex].properties.showyourfriend = list.showyourfriend
					local party = list.GetParty( controller, offset + i - 1 )
					local numPartyMembers = playerInfo.partyMembers
					list.players[elementIndex].properties.party = {}
					if party.total == nil then
						party.total = party.totalCount
						party.available = party.availableCount
					end
					list.players[elementIndex].properties.party.total = party.total
					list.players[elementIndex].properties.party.available = party.available
					list.players[elementIndex].properties.party.leader = party.leader
					if #party.members then
						list.players[elementIndex].properties.party.members = {}
						for i = 1, #party.members, 1 do
							list.players[elementIndex].properties.party.members[i] = {}
							list.players[elementIndex].properties.party.members[i].gamertag = party.members[i].gamertag
							list.players[elementIndex].properties.party.members[i].leader = party.members[i].leader
						end
					end
				end
				return list.players[offset % list.numElementsInList + 1].model
			end
			
			list.updateModels( controller, list, 0, list.numElementsInList )
			local socialUpdateModel = Engine.GetModel( list.socialSubModel, "update" )
			if list.socialUpdateSubscription then
				list:removeSubscription( list.socialUpdateSubscription )
			end
			list.socialUpdateSubscription = list:subscribeToModel( socialUpdateModel, function ()
				RefreshListFindSelectedXuid( controller, list )
			end, false )
		end,
		getCount = function ( list )
			return list.playerCount
		end,
		getItem = function ( controller, list, index )
			local offset = index - 1
			local firstModel = list.updateModels( controller, list, offset, 1 )
			local elementIndex = (index - 1) % list.numElementsInList + 1
			local model = list.players[elementIndex].model
			return model
		end,
		getCustomPropertiesForItem = function ( list, index )
			local elementIndex = (index - 1) % list.numElementsInList + 1
			local properties = list.players[elementIndex].properties
			return properties
		end
	},
	SocialPlayerPartyList = {
		prepare = function ( controller, list, filter )
			list.numElementsInList = list.vCount
			list.controller = controller
			local rootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
			local cacheModel = Engine.GetModel( rootModel, "cache" )
			list.xuidModel = Engine.GetModel( cacheModel, "xuid" )
			local partyModel = Engine.GetModel( rootModel, "party" )
			list.partyUpdate = Engine.CreateModel( partyModel, "update" )
			local availableModel = Engine.GetModel( partyModel, "available" )
			local totalModel = Engine.GetModel( partyModel, "total" )
			local leaderModel = Engine.GetModel( partyModel, "leader" )
			list.xuid = Engine.GetModelValue( list.xuidModel, "xuid" )
			list.available = Engine.GetModelValue( availableModel )
			list.total = Engine.GetModelValue( totalModel )
			list.leader = Engine.GetModelValue( leaderModel )
			list.partyMembers = {}
			for i = 1, 18, 1 do
				list.partyMembers[i] = Engine.GetModel( partyModel, "pm_" .. i )
			end
			if list.selectedPlayerSubscription then
				list:removeSubscription( list.selectedPlayerSubscription )
			end
			list.selectedPlayerSubscription = list:subscribeToModel( list.partyUpdate, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return list.available
		end,
		getItem = function ( controller, list, index )
			return list.partyMembers[index]
		end
	},
	AARTabs = ListHelper_SetupDataSource( "AARTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if Engine.IsMultiplayerGame() then
			local aarTypeModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarType" )
			if aarTypeModel and Engine.GetModelValue( aarTypeModel ) == "public" then
				table.insert( tabList, {
					models = {
						tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
						tabWidget = "CoD.PerformanceTabWidget"
					},
					properties = {
						tabId = "performance"
					}
				} )
			end
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_MEDALS_CAPS" ),
					tabWidget = "CoD.MedalsTabWidget"
				},
				properties = {
					tabId = "medals"
				}
			} )
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
					tabWidget = "CoD.ScoreboardTabWidget"
				},
				properties = {
					tabId = "scoreboard"
				}
			} )
		elseif Engine.IsCampaignGame() then
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
					tabWidget = "CoD.PerformanceTabWidgetCP"
				},
				properties = {
					tabId = "performance"
				}
			} )
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
					tabWidget = "CoD.ScoreboardTabWidgetCP"
				},
				properties = {
					tabId = "scoreboard"
				}
			} )
		elseif Engine.IsZombiesGame() then
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
					tabWidget = "CoD.PerformanceTabWidgetZM"
				},
				properties = {
					tabId = "performance"
				}
			} )
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
					tabWidget = "CoD.ScoreboardTabWidgetZM"
				},
				properties = {
					tabId = "scoreboard"
				}
			} )
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
	end
	, true ),
	AARPerformanceTabStats = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
		end
	},
	AARSPMGraph = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats.spmGraph" )
		end
	},
	AARKDRGraph = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats.kdrGraph" )
		end
	},
	Scoreboard = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "scoreboardInfo" )
		end
	},
	ScoreboardTeam1ListCP = ListHelper_SetupDataSource( "scoreboardTeam1ListCP", function ( controller )
		return CoD.AARUtilityCP.GetScoreboardTeamTable( controller, 1 )
	end
	 ),
	ScoreboardTeam1List = {
		prepare = function ( controller, list, filter )
			list.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
			if list.teamCountSubscription then
				list:removeSubscription( list.teamCountSubscription )
			end
			list.teamCountSubscription = list:subscribeToModel( Engine.GetModel( list.scoreboardInfoModel, "count" ), function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return math.max( Engine.GetModelValue( Engine.GetModel( list.scoreboardInfoModel, "count" ) ), CoD.ScoreboardUtility.MinRowsToShowOnEachTeam )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.scoreboardInfoModel, index - 1 )
		end
	},
	ScoreboardTeam2List = {
		prepare = function ( controller, list, filter )
			list.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
			if list.teamCountSubscription then
				list:removeSubscription( list.teamCountSubscription )
			end
			list.teamCountSubscription = list:subscribeToModel( Engine.GetModel( list.scoreboardInfoModel, "count" ), function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			if IsGameTypeDOA() then
				return 0
			else
				return math.max( Engine.GetModelValue( Engine.GetModel( list.scoreboardInfoModel, "count" ) ), CoD.ScoreboardUtility.MinRowsToShowOnEachTeam )
			end
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.scoreboardInfoModel, index - 1 )
		end
	},
	CodCasterScoreboardTeam1List = {
		prepare = function ( controller, list, filter )
			list.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
			if list.teamCountSubscription then
				list:removeSubscription( list.teamCountSubscription )
			end
			list.teamCountSubscription = list:subscribeToModel( Engine.GetModel( list.scoreboardInfoModel, "count" ), function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return math.max( Engine.GetModelValue( Engine.GetModel( list.scoreboardInfoModel, "count" ) ), 0 )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.scoreboardInfoModel, index - 1 )
		end
	},
	CodCasterScoreboardTeam2List = {
		prepare = function ( controller, list, filter )
			list.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
			if list.teamCountSubscription then
				list:removeSubscription( list.teamCountSubscription )
			end
			list.teamCountSubscription = list:subscribeToModel( Engine.GetModel( list.scoreboardInfoModel, "count" ), function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return math.max( Engine.GetModelValue( Engine.GetModel( list.scoreboardInfoModel, "count" ) ), 0 )
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.scoreboardInfoModel, index - 1 )
		end
	},
	FreeRun = {
		getModel = function ( controller )
			local perControllerModel = Engine.GetModelForController( controller )
			local freeRunModel = Engine.CreateModel( perControllerModel, "FreeRun" )
			local runStateModel = Engine.CreateModel( freeRunModel, "runState" )
			Engine.SetModelValue( runStateModel, 0 )
			local startTimeModel = Engine.CreateModel( freeRunModel, "startTime" )
			Engine.SetModelValue( startTimeModel, 0 )
			local deltaTimeModel = Engine.CreateModel( freeRunModel, "deltaTime" )
			Engine.SetModelValue( deltaTimeModel, 0 )
			local finishTimeModel = Engine.CreateModel( freeRunModel, "finishTime" )
			Engine.SetModelValue( finishTimeModel, 0 )
			local topScore = Engine.CreateModel( freeRunModel, "topScore" )
			local topScore1 = Engine.CreateModel( topScore, "topScore1" )
			Engine.SetModelValue( topScore1, 0 )
			local topScore2 = Engine.CreateModel( topScore, "topScore2" )
			Engine.SetModelValue( topScore2, 0 )
			local topScore3 = Engine.CreateModel( topScore, "topScore3" )
			Engine.SetModelValue( topScore3, 0 )
			local distanceBar = Engine.CreateModel( freeRunModel, "distanceBar" )
			local completion = Engine.CreateModel( distanceBar, "completion" )
			Engine.SetModelValue( completion, 0 )
			local ghostCompletion = Engine.CreateModel( distanceBar, "ghostCompletion" )
			Engine.SetModelValue( ghostCompletion, 0 )
			local freeRunInfo = Engine.CreateModel( freeRunModel, "freeRunInfo" )
			local bestTime = Engine.CreateModel( freeRunInfo, "bestTime" )
			Engine.SetModelValue( bestTime, 0 )
			local faults = Engine.CreateModel( freeRunInfo, "faults" )
			Engine.SetModelValue( faults, 0 )
			local retries = Engine.CreateModel( freeRunInfo, "retries" )
			Engine.SetModelValue( retries, 0 )
			local timerModel = Engine.CreateModel( freeRunModel, "timer" )
			local currentTime = Engine.CreateModel( timerModel, "currentTime" )
			Engine.SetModelValue( currentTime, 0 )
			local timeAdjustment = Engine.CreateModel( timerModel, "timeAdjustment" )
			Engine.SetModelValue( timeAdjustment, 0 )
			return freeRunModel
		end
	},
	RewardsCarousel = {
		prepare = function ( controller, list, filter )
			if Engine.IsMultiplayerGame() then
				CoD.AARUtility.CreateModelsForRewards( controller )
			else
				CoD.AARUtilityCP.CreateModelsForRewards( controller )
			end
		end,
		getCount = function ( list )
			if Engine.IsMultiplayerGame() then
				return CoD.AARUtility.GetRewardItemCount( list )
			else
				return CoD.AARUtilityCP.GetRewardItemCount( list )
			end
		end,
		getItem = function ( controller, list, index )
			if Engine.IsMultiplayerGame() then
				return CoD.AARUtility.GetModelForRewardItemByIndex( controller, index )
			else
				return CoD.AARUtilityCP.GetModelForRewardItemByIndex( controller, index )
			end
		end
	},
	ZmPlayerStyles = {
		prepare = function ( controller, list, filter )
			
		end,
		getCount = function ( list )
			return 0
		end,
		getItem = function ( controller, list, index )
			return nil
		end
	},
	DropdownListTest = {
		prepare = function ( controller, list, filter )
			local itemCount = 25
			for i = 1, itemCount, 1 do
				local tempModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DropdownTest.dropdownListTestModel" .. i )
				local itemModel = Engine.CreateModel( tempModel, "itemName" )
				Engine.SetModelValue( itemModel, "Random Value " .. i )
			end
		end,
		getCount = function ( list )
			return 25
		end,
		getItem = function ( controller, list, index )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "DropdownTest.dropdownListTestModel" .. index )
		end
	},
	DeadSpectate = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator" )
		end
	},
	DebugSessionSearchQoSJoin = ListHelper_SetupDataSource( "DebugSessionSearchQoSJoin", function ( controller )
		if not Dvar.ui_lobbyDebugSessionSQJ:exists() or Dvar.ui_lobbyDebugSessionSQJ:get() == false then
			return {}
		end
		local getModelValue = function ( parentModel, modelName )
			local model = Engine.GetModel( parentModel, modelName )
			return Engine.GetModelValue( model )
		end
		
		local getSearchStageColor = function ( searchStage )
			local mod = math.mod( searchStage, 3 )
			local color = ColorSet.SelectedGreen
			if mod == 0 then
				color = ColorSet.CoreMartial
			elseif mod == 1 then
				color = ColorSet.ResistanceHigh
			end
			return string.format( "%d %d %d", color.r * 255, color.g * 255, color.b * 255 )
		end
		
		local searchResults = {}
		Engine.LobbyVM_CallFunc( "SessionSQJRefreshInfo", {
			controller = controller
		} )
		local debugModel = Engine.GetModel( Engine.GetGlobalModel(), "debug" )
		local sessionSQJModel = Engine.GetModel( debugModel, "sessionSQJ" )
		local searchStage = getModelValue( sessionSQJModel, "searchStage" )
		local resultsModel = Engine.GetModel( sessionSQJModel, "results" )
		for i = 1, searchStage, 1 do
			local searchStageColor = getSearchStageColor( i )
			local resultEntryModel = Engine.GetModel( resultsModel, tostring( i ) )
			local numResults = getModelValue( resultEntryModel, "numResults" )
			if numResults == 0 then
				table.insert( searchResults, {
					models = {
						noResults = "NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS",
						xuid = "",
						gamertag = "",
						publicIPAddress = "",
						privateIPAddress = "",
						natType = "",
						qosPing = "",
						status = "",
						searchStageColor = searchStageColor
					},
					properties = {
						disabled = false
					}
				} )
			end
			local dataModel = Engine.GetModel( resultEntryModel, "data" )
			for j = 1, numResults, 1 do
				local dataEntryModel = Engine.GetModel( dataModel, tostring( j ) )
				local xuid = getModelValue( dataEntryModel, "xuidstr" )
				xuid = xuid or "0"
				local gamertag = getModelValue( dataEntryModel, "gamertag" )
				gamertag = gamertag or ""
				local publicIPAddress = getModelValue( dataEntryModel, "publicIPAddress" )
				local find = string.find( publicIPAddress, ":" )
				if publicIPAddress then
					publicIPAddress = string.sub( publicIPAddress, 0, string.find( publicIPAddress, ":" ) - 1 )
				else
					publicIPAddress = "0.0.0.0"
				end
				local privateIPAddress = getModelValue( dataEntryModel, "privateIPAddress" )
				if privateIPAddress then
					privateIPAddress = string.sub( privateIPAddress, 0, string.find( privateIPAddress, ":" ) - 1 )
				else
					privateIPAddress = "0.0.0.0"
				end
				local natType = getModelValue( dataEntryModel, "natType" )
				natType = natType or "UNKNOWN"
				local ping = getModelValue( dataEntryModel, "ping" )
				ping = ping or "??? ms"
				local status = getModelValue( dataEntryModel, "status" )
				table.insert( searchResults, {
					models = {
						noResults = "",
						xuid = xuid,
						gamertag = gamertag,
						publicIPAddress = publicIPAddress,
						privateIPAddress = privateIPAddress,
						natType = natType,
						qosPing = ping,
						status = status or " ------- ",
						searchStageColor = searchStageColor
					},
					properties = {
						disabled = false
					}
				} )
			end
		end
		return searchResults
	end
	, nil, nil, function ( controller, list, listModel )
		local debugModel = Engine.CreateModel( Engine.GetGlobalModel(), "debug" )
		local sessionSQJModel = Engine.CreateModel( debugModel, "sessionSQJ" )
		list.updateModel = Engine.CreateModel( sessionSQJModel, "update" )
		Engine.SetModelValue( list.updateModel, 0 )
		if list.updateSubscription then
			list:removeSubscription( list.updateSubscription )
		end
		list.updateSubscription = list:subscribeToModel( list.updateModel, function ()
			list:updateDataSource()
		end, false )
	end
	 ),
	LeaveLobbyPopup = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
			Engine.CreateModel( model, "popupType" )
			Engine.CreateModel( model, "title" )
			Engine.CreateModel( model, "hint" )
			return model
		end
	},
	LeaveLobbyPopupButtons = ListHelper_SetupDataSource( "LeaveLobbyPopupButtons", function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
		local popupTypeModel = Engine.GetModel( model, "popupType" )
		local popupType = Engine.GetModelValue( popupTypeModel )
		local data = {
			controller = controller
		}
		local goBackFunc = function ( self, element, controller, param )
			local lobbyMenu = GoBack( self, controller )
			if param == nil then
				return 
			else
				lobbyMenu.ClientList:processEvent( {
					name = "lose_focus",
					controller = controller
				} )
				data.withParty = param
				Engine.LobbyVM_CallFunc( "GoBack", data )
			end
		end
		
		local leavePartyFunc = function ( self, element, controller, param )
			self:goBack( controller )
			Engine.LobbyVM_CallFunc( "ManagePartyLeave", data )
		end
		
		local addButton = function ( buttons, customId, stringRef, executeFunc, param )
			table.insert( buttons, {
				optionDisplay = stringRef,
				action = executeFunc,
				param = param,
				customId = customId,
				isLargeButton = true,
				isLastButtonInGroup = false,
				disabled = false
			} )
		end
		
		local buttonOptions = {}
		if popupType == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
			addButton( buttonOptions, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_PARTY", goBackFunc, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
			addButton( buttonOptions, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_AND_DISBAND_PARTY", goBackFunc, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
			addButton( buttonOptions, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY", goBackFunc, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
			addButton( buttonOptions, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY_AND_PARTY", goBackFunc, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
			addButton( buttonOptions, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_ALONE", goBackFunc, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
			addButton( buttonOptions, "btnWith", "MENU_LEAVE_LOBBY_BRING_PARTY", goBackFunc, LuaEnums.LEAVE_WITH_PARTY.WITH )
		elseif popupType == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
			addButton( buttonOptions, "btnWithout", "MENU_CONFIRM_CAPS", leavePartyFunc, nil )
		end
		addButton( buttonOptions, "btnCancel", "MENU_LEAVE_LOBBY_CANCEL", goBackFunc, nil )
		local buttons = {}
		for index, buttonData in ipairs( buttonOptions ) do
			table.insert( buttons, {
				models = {
					displayText = Engine.Localize( buttonData.optionDisplay ),
					customId = buttonData.customId
				},
				properties = {
					disabled = buttonData.disabled,
					action = buttonData.action,
					actionParam = buttonData.param,
					isLastButtonInGroup = buttonData.isLastButtonInGroup
				}
			} )
		end
		return buttons
	end
	, nil, nil, function ( controller, list, listModel )
		
	end
	 ),
	Blackhat = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.blackhat" )
		end
	},
	BrightnessSelector = {
		getCount = function ( list )
			return 17
		end,
		getItem = function ( controller, list, index )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "brightnessSelector" )
		end,
		getCustomPropertiesForItem = function ( list, index )
			if index == 9 then
				return {
					selectIndex = true
				}
			else
				return {}
			end
		end
	},
	BrightnessSettingsImageColor = {
		getModel = function ( controller )
			local brightnessSelectorModel = Engine.CreateModel( Engine.GetModelForController( controller ), "brightnessSelector" )
			Engine.CreateModel( brightnessSelectorModel, "imageColor" )
			return brightnessSelectorModel
		end
	},
	ChatClientGlobal = {
		getModel = function ( controller )
			local model = CoD.ChatClientUtility.GetChatClientGlobalModel()
			CoD.ChatClientUtility.ResetAllModels( controller )
			return model
		end
	},
	ChatClientEntriesList = {
		prepare = function ( controller, list, filter )
			list.numElementsInList = list.vCount
			list.controller = controller
			local chatClientEntriesModel = CoD.ChatClientUtility.GetChatEntriesListModel()
			list.chatClientEntriesModel = chatClientEntriesModel
			list.filter = Engine.ChatClient_FilterChannelGet( controller, Enum.chatChannel_e.CHAT_CHANNEL_COUNT )
			list.GetList = Engine.ChatClient_GetEntries
			list.CountEntries = Engine.ChatClient_EntriesCount( controller, list.filter )
			local emptyChatEntry = {
				xuid = 0,
				fullname = "",
				text = "",
				timestamp = "",
				chText = "",
				chColor = ""
			}
			list.chatEntries = {}
			for i = 1, list.numElementsInList, 1 do
				list.chatEntries[i] = {}
				list.chatEntries[i].root = Engine.CreateModel( list.chatClientEntriesModel, "entry_" .. i )
				list.chatEntries[i].model = Engine.CreateModel( list.chatEntries[i].root, "model" )
				list.chatEntries[i].properties = {}
				for key, value in pairs( emptyChatEntry ) do
					local model = Engine.CreateModel( list.chatEntries[i].model, key )
				end
			end
			list.updateModels = function ( controller, list, offset, count )
				if not list.GetList then
					return 
				end
				local listChatEntries = {}
				listChatEntries = list.GetList( controller, offset, count, list.filter )
				if listChatEntries then
					for i = 1, #listChatEntries, 1 do
						local chatEntry = listChatEntries[i]
						local elementIndex = #listChatEntries + 1 - i
						for key, value in pairs( chatEntry ) do
							local valueModel = Engine.GetModel( list.chatEntries[elementIndex].model, key )
							if valueModel ~= nil then
								Engine.SetModelValue( valueModel, value )
							end
							list.chatEntries[elementIndex].properties[key] = value
						end
					end
				end
				return list.chatEntries[offset % list.numElementsInList + 1].model
			end
			
			list.updateModels( controller, list, 0, list.numElementsInList )
			if list.updateSubscription then
				list:removeSubscription( list.updateSubscription )
			end
			local updateModel = CoD.ChatClientUtility.GetUpdateModel()
			list.updateSubscription = list:subscribeToModel( updateModel, function ()
				list:updateDataSource()
			end, false )
		end,
		getCount = function ( list )
			return list.CountEntries
		end,
		getItem = function ( controller, list, index )
			return list.chatEntries[index].model
		end
	},
	FirstTimeLanguageSelection = ListHelper_SetupDataSource( "FirstTimeLanguageSelection", function ( controller )
		local selectionList = {}
		if IsArabicSku() then
			table.insert( selectionList, {
				models = {
					image = "uie_language_english",
					action = ChangeLanguage,
					param = "english"
				}
			} )
			table.insert( selectionList, {
				models = {
					image = "uie_language_arabic",
					action = ChangeLanguage,
					param = "arabic"
				}
			} )
		elseif IsJapaneseSku() then
			table.insert( selectionList, {
				models = {
					image = "uie_language_japanese",
					action = ChangeLanguage,
					param = "fulljapanese"
				}
			} )
			table.insert( selectionList, {
				models = {
					image = "uie_language_english_with_japanese_subtitles",
					action = ChangeLanguage,
					param = "japanese"
				}
			} )
		elseif IsChineseSku() then
			table.insert( selectionList, {
				models = {
					image = "uie_language_english",
					action = ChangeLanguage,
					param = "english"
				}
			} )
			table.insert( selectionList, {
				models = {
					image = "uie_language_simplified_chinese",
					action = ChangeLanguage,
					param = "simplifiedchinese"
				}
			} )
			table.insert( selectionList, {
				models = {
					image = "uie_language_traditional_chinese",
					action = ChangeLanguage,
					param = "traditionalchinese"
				}
			} )
		end
		return selectionList
	end
	 )
}
DataSources.GlobalSources.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.GlobalSources" )
DataSources.Controller.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.Controller" )
DataSources.VehicleController.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.VehicleController" )
local createControllerBindings = function ( button_name, button_image, vehicle_button_image )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, button_name ), button_image )
	Engine.SetModelValue( Engine.CreateModel( DataSources.VehicleController.Model, button_name ), vehicle_button_image or button_image )
end

if CoD.isDurango then
	createControllerBindings( "primary_button_image", "xenonbutton_a" )
	createControllerBindings( "secondary_button_image", "xenonbutton_b" )
	createControllerBindings( "alt1_button_image", "xenonbutton_x" )
	createControllerBindings( "alt2_button_image", "xenonbutton_y" )
	createControllerBindings( "back_button_image", "xenonbutton_back" )
	createControllerBindings( "start_button_image", "xenonbutton_start" )
	createControllerBindings( "left_shoulder_button_image", "xenonbutton_lb", "t7_icons_controller_lbwhite" )
	createControllerBindings( "left_shoulder_button_image_glow", "uie_t7_icons_controller_durango_lb_glow" )
	createControllerBindings( "right_shoulder_button_image", "xenonbutton_rb", "t7_icons_controller_rbwhite" )
	createControllerBindings( "right_shoulder_button_image_glow", "uie_t7_icons_controller_durango_rb_glow" )
	createControllerBindings( "left_stick_button_image", "ui_button_xenon_stick_ani_32_Ldown" )
	createControllerBindings( "right_stick_button_image", "ui_button_xenon_stick_ani_32_Rdown" )
	createControllerBindings( "left_trigger_button_image", "xenonbutton_lt", "t7_icons_controller_ltwhite" )
	createControllerBindings( "right_trigger_button_image", "xenonbutton_rt", "t7_icons_controller_rtwhite" )
	createControllerBindings( "dpad_lr_button_image", "xenonbutton_dpad_rl" )
	createControllerBindings( "dpad_ud_button_image", "xenonbutton_dpad_ud" )
	createControllerBindings( "dpad_up_button_image", "xenonbutton_dpad_up" )
	createControllerBindings( "dpad_down_button_image", "xenonbutton_dpad_down" )
	createControllerBindings( "dpad_left_button_image", "xenonbutton_dpad_left" )
	createControllerBindings( "dpad_right_button_image", "xenonbutton_dpad_right" )
	createControllerBindings( "left_stick_move_image", "t7_icons_controller_ls" )
	createControllerBindings( "right_stick_move_image", "t7_icons_controller_rs" )
elseif CoD.isPS4 then
	createControllerBindings( "primary_button_image", "ps3button_x" )
	createControllerBindings( "secondary_button_image", "ps3button_circle" )
	createControllerBindings( "alt1_button_image", "ps3button_square" )
	createControllerBindings( "alt2_button_image", "ps3button_triangle" )
	createControllerBindings( "back_button_image", "ps3button_select" )
	createControllerBindings( "start_button_image", "ps3button_start" )
	createControllerBindings( "left_shoulder_button_image", "ps3button_l1", "t7_icons_controller_lbwhite" )
	createControllerBindings( "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
	createControllerBindings( "right_shoulder_button_image", "ps3button_r1", "t7_icons_controller_rbwhite" )
	createControllerBindings( "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
	createControllerBindings( "left_stick_button_image", "ps3button_l3" )
	createControllerBindings( "right_stick_button_image", "ps3button_r3" )
	createControllerBindings( "left_trigger_button_image", "ps3button_l2", "t7_icons_controller_ltwhite" )
	createControllerBindings( "right_trigger_button_image", "ps3button_r2", "t7_icons_controller_rtwhite" )
	createControllerBindings( "dpad_lr_button_image", "ps3button_dpad_rl" )
	createControllerBindings( "dpad_ud_button_image", "ps3button_dpad_ud" )
	createControllerBindings( "dpad_up_button_image", "ps3button_dpad_up" )
	createControllerBindings( "dpad_down_button_image", "ps3button_dpad_down" )
	createControllerBindings( "dpad_left_button_image", "ps3button_dpad_left" )
	createControllerBindings( "dpad_right_button_image", "ps3button_dpad_right" )
	createControllerBindings( "left_stick_move_image", "t7_icons_controller_ls" )
	createControllerBindings( "right_stick_move_image", "t7_icons_controller_rs" )
else
	createControllerBindings( "primary_button_image", "ps3button_x" )
	createControllerBindings( "secondary_button_image", "ps3button_circle" )
	createControllerBindings( "alt1_button_image", "ps3button_square" )
	createControllerBindings( "alt2_button_image", "ps3button_triangle" )
	createControllerBindings( "back_button_image", "ps3button_select" )
	createControllerBindings( "start_button_image", "ps3button_start" )
	createControllerBindings( "left_shoulder_button_image", "ps3button_l1", "t7_icons_controller_lbwhite" )
	createControllerBindings( "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
	createControllerBindings( "right_shoulder_button_image", "ps3button_r1", "t7_icons_controller_rbwhite" )
	createControllerBindings( "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
	createControllerBindings( "left_stick_button_image", "ps3button_l3" )
	createControllerBindings( "right_stick_button_image", "ps3button_r3" )
	createControllerBindings( "left_trigger_button_image", "ps3button_l2", "t7_icons_controller_ltwhite" )
	createControllerBindings( "right_trigger_button_image", "ps3button_r2", "t7_icons_controller_rtwhite" )
	createControllerBindings( "dpad_lr_button_image", "ps3button_dpad_rl" )
	createControllerBindings( "dpad_ud_button_image", "ps3button_dpad_ud" )
	createControllerBindings( "dpad_up_button_image", "ps3button_dpad_up" )
	createControllerBindings( "dpad_down_button_image", "ps3button_dpad_down" )
	createControllerBindings( "dpad_left_button_image", "ps3button_dpad_left" )
	createControllerBindings( "dpad_right_button_image", "ps3button_dpad_right" )
	createControllerBindings( "left_stick_move_image", "t7_icons_controller_ls" )
	createControllerBindings( "right_stick_move_image", "t7_icons_controller_rs" )
end
for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
	local f0_local3 = controller
	local perControllerModel = Engine.GetModelForController( f0_local3 )
	Engine.CreateModel( perControllerModel, "hintText" )
	local clanTagModel = Engine.CreateModel( perControllerModel, "clanTag" )
	Engine.SetModelValue( clanTagModel, "" )
	Engine.CreateModel( perControllerModel, "WorldSpaceIndicators" )
	local scriptNotifyModel = Engine.CreateModel( perControllerModel, "scriptNotify" )
	Engine.SetModelValue( Engine.CreateModel( scriptNotifyModel, "numArgs" ), 0 )
	Engine.SetModelValue( scriptNotifyModel, "" )
	Engine.CreateModel( perControllerModel, "playerConnected" )
	Engine.CreateModel( perControllerModel, "playerDisconnected" )
	local hudItemsModel = Engine.CreateModel( perControllerModel, "hudItems" )
	Engine.CreateModel( hudItemsModel, "stickyImage" )
	Engine.CreateModel( hudItemsModel, "shockImageBottom" )
	Engine.CreateModel( hudItemsModel, "shockImageRight" )
	Engine.CreateModel( hudItemsModel, "shockImageLeft" )
	Engine.CreateModel( hudItemsModel, "shockImageTop" )
	Engine.CreateModel( hudItemsModel, "showCursorHint" )
	Engine.CreateModel( hudItemsModel, "cursorHintImage" )
	Engine.CreateModel( hudItemsModel, "cursorHintText" )
	Engine.CreateModel( hudItemsModel, "cursorHintTextLine2" )
	Engine.CreateModel( hudItemsModel, "cursorHintIconRatio" )
	Engine.CreateModel( hudItemsModel, "cursorHintIconFlip" )
	Engine.CreateModel( hudItemsModel, "sixthsense" )
	Engine.CreateModel( hudItemsModel, "outOfBoundsEndTime" )
	Engine.CreateModel( hudItemsModel, "pulseNoAmmo" )
	Engine.CreateModel( hudItemsModel, "pulseNoLethal" )
	Engine.CreateModel( hudItemsModel, "pulseNoTactical" )
	Engine.CreateModel( hudItemsModel, "armorOverlay" )
	Engine.CreateModel( hudItemsModel, "armorPercent" )
	Engine.CreateModel( hudItemsModel, "health" )
	Engine.CreateModel( hudItemsModel, "regenDelayProgress" )
	Engine.CreateModel( hudItemsModel, "showDamageWidget" )
	Engine.CreateModel( hudItemsModel, "cybercomActiveType" )
	Engine.CreateModel( hudItemsModel, "playerSpawned" )
	Engine.CreateModel( hudItemsModel, "ammoPickedUp" )
	local voipInfoModel = Engine.CreateModel( hudItemsModel, "voipInfo" )
	for voipInfo = 1, 4, 1 do
		local voipInfoItem = Engine.CreateModel( voipInfoModel, "voip" .. voipInfo )
		Engine.SetModelValue( Engine.CreateModel( voipInfoItem, "status" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( voipInfoItem, "name" ), "" )
	end
	local ctfModel = Engine.CreateModel( perControllerModel, "CTF" )
	Engine.CreateModel( ctfModel, "friendlyFlagCarrier" )
	Engine.CreateModel( ctfModel, "friendlyFlagAway" )
	Engine.CreateModel( ctfModel, "enemyFlagCarrier" )
	Engine.CreateModel( ctfModel, "enemyFlagAway" )
	if not CoD.isFrontend and not CoD.isCampaign and CoD.isZombie then
		Engine.CreateModel( perControllerModel, "bgb_current" )
		Engine.CreateModel( perControllerModel, "bgb_display" )
		Engine.CreateModel( perControllerModel, "bgb_timer" )
		Engine.CreateModel( perControllerModel, "bgb_activations_remaining" )
		Engine.CreateModel( perControllerModel, "bgb_invalid_use" )
		Engine.CreateModel( perControllerModel, "bgb_one_shot_use" )
	end
	local consoleModel = Engine.CreateModel( hudItemsModel, "console" )
	Engine.SetModelValue( Engine.CreateModel( consoleModel, "currentIndex" ), 0 )
	for i = 0, 6, 1 do
		local consoleEntryModel = Engine.CreateModel( consoleModel, "line" .. i )
		Engine.CreateModel( consoleEntryModel, "text0" )
		Engine.CreateModel( consoleEntryModel, "text0color" )
		Engine.CreateModel( consoleEntryModel, "icon0" )
		Engine.CreateModel( consoleEntryModel, "text1" )
		Engine.CreateModel( consoleEntryModel, "text1color" )
		Engine.CreateModel( consoleEntryModel, "icon1" )
		Engine.CreateModel( consoleEntryModel, "iconWidth" )
	end
	consoleModel = Engine.CreateModel( hudItemsModel, "centerConsole" )
	Engine.SetModelValue( Engine.CreateModel( consoleModel, "currentIndex" ), 0 )
	for i = 0, 6, 1 do
		local consoleEntryModel = Engine.CreateModel( consoleModel, "line" .. i )
		Engine.CreateModel( consoleEntryModel, "text0" )
		Engine.CreateModel( consoleEntryModel, "text0color" )
		Engine.CreateModel( consoleEntryModel, "icon0" )
		Engine.CreateModel( consoleEntryModel, "text1" )
		Engine.CreateModel( consoleEntryModel, "text1color" )
		Engine.CreateModel( consoleEntryModel, "icon1" )
		Engine.CreateModel( consoleEntryModel, "iconWidth" )
	end
	local vehicleModel = Engine.CreateModel( perControllerModel, "vehicle" )
	Engine.CreateModel( vehicleModel, "vehicleType" )
	DataSources.VehicleInfo.clearButtonModels( f0_local3 )
	if Engine.IsProfileSignedIn( f0_local3 ) then
		local f0_local6 = Engine.CreateModel( perControllerModel, "profile" )
		if f0_local6 then
			local initGamerProfileBoolModel = function ( name )
				local newModel = Engine.CreateModel( f0_local6, name )
				if newModel then
					Engine.SetModelValue( newModel, CoD.ExeProfileVarBool( f0_local3, name ) )
				end
			end
			
			initGamerProfileBoolModel( "tacticalModeShowDamage" )
			initGamerProfileBoolModel( "tacticalModeShowArchetype" )
			initGamerProfileBoolModel( "tacticalModeShowDistance" )
			initGamerProfileBoolModel( "tacticalModeShowStatus" )
		end
	end
	f0_local6 = Engine.CreateModel( perControllerModel, "CACMenu" )
	Engine.CreateModel( f0_local6, "numItemsToRemove" )
	Engine.CreateModel( f0_local6, "curWeaponVariantName" )
	Engine.CreateModel( f0_local6, "currentHeroName" )
	Engine.CreateModel( f0_local6, "currentHeroImage" )
	Engine.CreateModel( f0_local6, "currentHeroLoadout" )
	Engine.CreateModel( perControllerModel, "unlockTokensCount" )
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
