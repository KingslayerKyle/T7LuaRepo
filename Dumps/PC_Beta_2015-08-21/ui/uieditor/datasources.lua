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
	for f3_local4, f3_local5 in ipairs( f3_arg3( f3_arg1, f3_arg0 ) ) do
		local f3_local6 = Engine.CreateModel( f3_local0, f3_local4 )
		if f3_local5.models then
			f0_local0( f3_local6, f3_local5.models )
		end
		if f3_local5.properties and f3_local5.properties.loopEdges then
			f3_arg0.loopEdges = f3_local5.properties.loopEdges
		end
		if not f3_arg4 or f3_arg4( f3_local6 ) then
			table.insert( f3_arg0[f3_arg2], {
				model = f3_local6,
				properties = f3_local5.properties
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

CoD.XPBar = {}
CoD.XPBar.RankIdCol = 0
CoD.XPBar.RankTableColMinXP = 2
CoD.XPBar.RankTableColMaxXP = 7
CoD.XPBar.RankDisplayLevelCol = 14
DataSourceHelpers.CustomListSetup = f0_local8
local f0_local9 = function ( f12_arg0, f12_arg1 )
	if f12_arg1 == nil then
		return 
	end
	local f12_local0 = nil
	if f12_arg1.activeWidget ~= nil then
		local f12_local1 = f12_arg1.activeWidget:getModel( f12_arg0, "xuid" )
		if f12_local1 ~= nil then
			f12_local0 = Engine.GetModelValue( f12_local1 )
		end
	end
	f12_arg1:updateDataSource( false, false )
	if f12_local0 ~= nil and not f12_arg1:findItem( {
		xuid = f12_local0
	}, nil, true ) then
		f12_arg1:processEvent( {
			name = "gain_focus",
			controller = f12_arg0
		} )
	end
end

DataSources = {
	GlobalSources = {
		getModel = function ( f13_arg0 )
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
		getModel = function ( f16_arg0 )
			local f16_local0 = Engine.GetModelForController( f16_arg0 )
			Engine.SetModelValue( Engine.CreateModel( f16_local0, "xuid" ), Engine.GetXUID64( f16_arg0 ) )
			Engine.SetModelValue( Engine.CreateModel( f16_local0, "gamertag" ), Engine.GetSelfGamertag( f16_arg0 ) )
			Engine.SetModelValue( Engine.CreateModel( f16_local0, "clanTag" ), "" )
			Engine.CreateModel( f16_local0, "forceUpdateVehicleBindings" )
			return f16_local0
		end,
		setHintText = function ( f17_arg0, f17_arg1 )
			local f17_local0 = Engine.GetModel( Engine.GetModelForController( f17_arg0 ), "hintText" )
			if not f17_arg1 then
				f17_arg1 = ""
			end
			if f17_local0 then
				Engine.SetModelValue( f17_local0, f17_arg1 )
			end
		end,
		clearHintText = function ( f18_arg0, f18_arg1 )
			DataSources.PerController.setHintText( f18_arg0, "" )
		end,
		hasHintText = function ( f19_arg0 )
			local f19_local0 = Engine.GetModel( Engine.GetModelForController( f19_arg0 ), "hintText" )
			if f19_local0 and Engine.GetModelValue( f19_local0 ) ~= "" then
				return true
			else
				return false
			end
		end
	},
	WorldSpaceIndicators = {
		getModel = function ( f20_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f20_arg0 ), "WorldSpaceIndicators" )
		end
	},
	MessageDialog = {
		getModel = function ( f21_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		end
	},
	AccountLinkLogin = {
		getModel = function ( f22_arg0 )
			local f22_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
			Engine.SetModelValue( Engine.CreateModel( f22_local0, "email" ), Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
			Engine.SetModelValue( Engine.CreateModel( f22_local0, "password" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
			Engine.SetModelValue( Engine.CreateModel( f22_local0, "stars" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
			return f22_local0
		end
	},
	AccountLinkRegister = {
		getModel = function ( f23_arg0 )
			local f23_local0 = Engine.CreateModel( Engine.GetModelForController( f23_arg0 ), "AccountLinkRegister" )
			Engine.CreateModel( f23_local0, "firstName" )
			Engine.CreateModel( f23_local0, "lastName" )
			Engine.CreateModel( f23_local0, "zipCode" )
			Engine.CreateModel( f23_local0, "region" )
			Engine.CreateModel( f23_local0, "username" )
			Engine.CreateModel( f23_local0, "email" )
			Engine.CreateModel( f23_local0, "password" )
			Engine.CreateModel( f23_local0, "stars" )
			Engine.CreateModel( f23_local0, "confirmPass" )
			Engine.CreateModel( f23_local0, "confirmStars" )
			Engine.CreateModel( f23_local0, "gender" )
			Engine.CreateModel( f23_local0, "month" )
			Engine.CreateModel( f23_local0, "monthIndex" )
			Engine.CreateModel( f23_local0, "day" )
			Engine.CreateModel( f23_local0, "year" )
			return f23_local0
		end
	},
	TermsOfService = {
		getModel = function ( f24_arg0 )
			local f24_local0 = Engine.CreateModel( Engine.GetModelForController( f24_arg0 ), "TermsOfService" )
			Engine.SetModelValue( Engine.CreateModel( f24_local0, "message" ), Engine.GetTermsOfService( f24_arg0 ) )
			return f24_local0
		end
	},
	Gender = {
		prepare = function ( f25_arg0, f25_arg1, f25_arg2 )
			local f25_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GenderModel" )
			local f25_local1 = Engine.CreateModel( f25_local0, "Male" )
			Engine.SetModelValue( Engine.CreateModel( f25_local1, "gender" ), Engine.Localize( "EM_MALE" ) )
			local f25_local2 = Engine.CreateModel( f25_local0, "Female" )
			Engine.SetModelValue( Engine.CreateModel( f25_local2, "gender" ), Engine.Localize( "EM_FEMALE" ) )
			f25_arg1.genders = {
				f25_local1,
				f25_local2
			}
		end,
		getCount = function ( f26_arg0 )
			return #f26_arg0.genders
		end,
		getItem = function ( f27_arg0, f27_arg1, f27_arg2 )
			return f27_arg1.genders[f27_arg2]
		end
	},
	Month = {
		prepare = function ( f28_arg0, f28_arg1, f28_arg2 )
			local f28_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "monthModel" )
			local f28_local1 = Engine.CreateModel( f28_local0, "january" )
			Engine.SetModelValue( Engine.CreateModel( f28_local1, "month" ), Engine.Localize( "MENU_MONTHS_JAN" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local1, "monthIndex" ), 1 )
			local f28_local2 = Engine.CreateModel( f28_local0, "february" )
			Engine.SetModelValue( Engine.CreateModel( f28_local2, "month" ), Engine.Localize( "MENU_MONTHS_FEB" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local2, "monthIndex" ), 2 )
			local f28_local3 = Engine.CreateModel( f28_local0, "march" )
			Engine.SetModelValue( Engine.CreateModel( f28_local3, "month" ), Engine.Localize( "MENU_MONTHS_MAR" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local3, "monthIndex" ), 3 )
			local f28_local4 = Engine.CreateModel( f28_local0, "april" )
			Engine.SetModelValue( Engine.CreateModel( f28_local4, "month" ), Engine.Localize( "MENU_MONTHS_APR" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local4, "monthIndex" ), 4 )
			local f28_local5 = Engine.CreateModel( f28_local0, "may" )
			Engine.SetModelValue( Engine.CreateModel( f28_local5, "month" ), Engine.Localize( "MENU_MONTHS_MAY" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local5, "monthIndex" ), 5 )
			local f28_local6 = Engine.CreateModel( f28_local0, "june" )
			Engine.SetModelValue( Engine.CreateModel( f28_local6, "month" ), Engine.Localize( "MENU_MONTHS_JUN" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local6, "monthIndex" ), 6 )
			local f28_local7 = Engine.CreateModel( f28_local0, "july" )
			Engine.SetModelValue( Engine.CreateModel( f28_local7, "month" ), Engine.Localize( "MENU_MONTHS_JUL" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local7, "monthIndex" ), 7 )
			local f28_local8 = Engine.CreateModel( f28_local0, "august" )
			Engine.SetModelValue( Engine.CreateModel( f28_local8, "month" ), Engine.Localize( "MENU_MONTHS_AUG" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local8, "monthIndex" ), 8 )
			local f28_local9 = Engine.CreateModel( f28_local0, "september" )
			Engine.SetModelValue( Engine.CreateModel( f28_local9, "month" ), Engine.Localize( "MENU_MONTHS_SEP" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local9, "monthIndex" ), 9 )
			local f28_local10 = Engine.CreateModel( f28_local0, "october" )
			Engine.SetModelValue( Engine.CreateModel( f28_local10, "month" ), Engine.Localize( "MENU_MONTHS_OCT" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local10, "monthIndex" ), 10 )
			local f28_local11 = Engine.CreateModel( f28_local0, "november" )
			Engine.SetModelValue( Engine.CreateModel( f28_local11, "month" ), Engine.Localize( "MENU_MONTHS_NOV" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local11, "monthIndex" ), 11 )
			local f28_local12 = Engine.CreateModel( f28_local0, "december" )
			Engine.SetModelValue( Engine.CreateModel( f28_local12, "month" ), Engine.Localize( "MENU_MONTHS_DEC" ) )
			Engine.SetModelValue( Engine.CreateModel( f28_local12, "monthIndex" ), 12 )
			f28_arg1.months = {
				f28_local1,
				f28_local2,
				f28_local3,
				f28_local4,
				f28_local5,
				f28_local6,
				f28_local7,
				f28_local8,
				f28_local9,
				f28_local10,
				f28_local11,
				f28_local12
			}
		end,
		getCount = function ( f29_arg0 )
			return #f29_arg0.months
		end,
		getItem = function ( f30_arg0, f30_arg1, f30_arg2 )
			return f30_arg1.months[f30_arg2]
		end
	},
	Day = {
		prepare = function ( f31_arg0, f31_arg1, f31_arg2 )
			f31_arg1.days = {}
			local f31_local0 = 31
			local f31_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "dayModel" )
			for f31_local2 = 1, f31_local0, 1 do
				local f31_local5 = Engine.CreateModel( f31_local1, "Day " .. f31_local2 )
				Engine.SetModelValue( Engine.CreateModel( f31_local5, "day" ), f31_local2 )
				f31_arg1.days[#f31_arg1.days + 1] = f31_local5
			end
		end,
		getCount = function ( f32_arg0 )
			return #f32_arg0.days
		end,
		getItem = function ( f33_arg0, f33_arg1, f33_arg2 )
			return f33_arg1.days[f33_arg2]
		end
	},
	Year = {
		prepare = function ( f34_arg0, f34_arg1, f34_arg2 )
			f34_arg1.years = {}
			local f34_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "yearModel" )
			for f34_local1 = 2015, 1900, -1 do
				local f34_local4 = Engine.CreateModel( f34_local0, "Year " .. f34_local1 )
				Engine.SetModelValue( Engine.CreateModel( f34_local4, "year" ), f34_local1 )
				f34_arg1.years[#f34_arg1.years + 1] = f34_local4
			end
		end,
		getCount = function ( f35_arg0 )
			return #f35_arg0.years
		end,
		getItem = function ( f36_arg0, f36_arg1, f36_arg2 )
			return f36_arg1.years[f36_arg2]
		end
	},
	TabbedView = {
		prepare = function ( f37_arg0, f37_arg1, f37_arg2 )
			f37_arg1.tabs = {}
			local f37_local0 = {}
			if CoD.isCampaign == true then
				f37_local0 = {
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
				f37_local0 = {
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
			if #f37_local0 == 0 then
				return 
			end
			table.insert( f37_local0, 1, {
				displayName = "",
				viewWidget = "",
				tabIcon = CoD.buttonStrings.shoulderl
			} )
			table.insert( f37_local0, {
				displayName = "",
				viewWidget = "",
				tabIcon = CoD.buttonStrings.shoulderr
			} )
			local f37_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "TabViewModel" )
			for f37_local5, f37_local6 in ipairs( f37_local0 ) do
				local f37_local7 = Engine.CreateModel( f37_local1, "tabModel_" .. f37_local5 )
				Engine.SetModelValue( Engine.CreateModel( f37_local7, "tabName" ), f37_local6.displayName )
				Engine.SetModelValue( Engine.CreateModel( f37_local7, "tabWidget" ), f37_local6.viewWidget )
				Engine.SetModelValue( Engine.CreateModel( f37_local7, "tabIcon" ), f37_local6.tabIcon )
				f37_arg1.tabs[#f37_arg1.tabs + 1] = f37_local7
			end
		end,
		getCount = function ( f38_arg0 )
			return #f38_arg0.tabs
		end,
		getItem = function ( f39_arg0, f39_arg1, f39_arg2 )
			return f39_arg1.tabs[f39_arg2]
		end
	},
	StartMenuTabs = f0_local7( "StartMenuTabs", function ( f40_arg0 )
		local f40_local0 = {}
		table.insert( f40_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if Engine.IsDemoPlaying() then
			table.insert( f40_local0, {
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
				table.insert( f40_local0, {
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
				table.insert( f40_local0, {
					models = {
						tabName = SessionModeToUnlocalizedSessionModeCaps( Engine.CurrentSessionMode() ),
						tabWidget = "CoD.StartMenu_GameOptions_CP",
						tabIcon = ""
					},
					properties = {
						tabId = "gameOptions"
					}
				} )
				table.insert( f40_local0, {
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
					table.insert( f40_local0, {
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
				table.insert( f40_local0, {
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
			table.insert( f40_local0, {
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
				table.insert( f40_local0, {
					models = {
						tabName = "MENU_TAB_BARRACKS_CAPS",
						tabWidget = "CoD.StartMenu_Barracks",
						tabIcon = ""
					},
					properties = {
						tabId = "barracks"
					}
				} )
				table.insert( f40_local0, {
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
			local f40_local1 = table.insert
			local f40_local2 = f40_local0
			local f40_local3 = {
				models = {
					tabName = "MENU_TAB_OPTIONS_CAPS",
					tabWidget = "CoD.StartMenu_Options_DOA",
					tabIcon = ""
				}
			}
			local f40_local4 = {
				tabId = "options"
			}
			local f40_local5 = Dvar.ui_execdemo:get()
			if f40_local5 then
				f40_local5 = not Engine.IsInGame()
			end
			f40_local4.selectIndex = f40_local5
			f40_local3.properties = f40_local4
			f40_local1( f40_local2, f40_local3 )
		else
			local f40_local1 = table.insert
			local f40_local2 = f40_local0
			local f40_local3 = {
				models = {
					tabName = "MENU_TAB_OPTIONS_CAPS",
					tabWidget = "CoD.StartMenu_Options",
					tabIcon = ""
				}
			}
			local f40_local4 = {
				tabId = "options"
			}
			local f40_local5 = Dvar.ui_execdemo_gamescom:get()
			if f40_local5 then
				f40_local5 = not Engine.IsInGame()
			end
			f40_local4.selectIndex = f40_local5
			f40_local3.properties = f40_local4
			f40_local1( f40_local2, f40_local3 )
		end
		table.insert( f40_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f40_local0
	end
	 ),
	GameSettingsTabs = f0_local7( "GameSettingsTabs", function ( f41_arg0 )
		local f41_local0 = {}
		table.insert( f41_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f41_local0, {
			models = {
				tabName = "MENU_GAME_MODE_RULES",
				tabWidget = "CoD.GameSettings_GameModeRules",
				tabIcon = ""
			},
			properties = {
				tabId = "game_mode_rules"
			}
		} )
		table.insert( f41_local0, {
			models = {
				tabName = "MENU_GLOBAL_SETTINGS",
				tabWidget = "CoD.GameSettings_GlobalSettings",
				tabIcon = ""
			},
			properties = {
				tabId = "global_settings"
			}
		} )
		table.insert( f41_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f41_local0
	end
	 ),
	CodCasterSideBarTabs = f0_local7( "CodCasterSideBarTabs", function ( f42_arg0 )
		local f42_local0 = {}
		table.insert( f42_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f42_local0, {
			models = {
				tabName = "CODCASTER_SETTINGS",
				tabWidget = "CoD.CodCasterSettingsSideBarDisplaySettings",
				tabIcon = ""
			},
			properties = {
				tabId = "players"
			}
		} )
		table.insert( f42_local0, {
			models = {
				tabName = "CODCASTER_LOADOUT",
				tabWidget = "CoD.CodCasterSettingsSideBarLoadoutSettings",
				tabIcon = ""
			},
			properties = {
				tabId = "options"
			}
		} )
		table.insert( f42_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f42_local0
	end
	 ),
	EditCodCasterSettingsButtonList = f0_local7( "EditCodCasterSettingsButtonList", function ( f43_arg0 )
		local f43_local0 = {}
		local f43_local1 = function ( f44_arg0, f44_arg1 )
			Engine.SetModelValue( Engine.CreateModel( DataSources.TeamIdentity.getModel( f44_arg0 ), "team" ), f44_arg1 )
		end
		
		local f43_local2 = "shoutcaster_fe_team_identity"
		local f43_local3 = CoD.ShoutcasterProfileVarBool( f43_arg0, f43_local2 ) == false
		local f43_local4 = {}
		table.insert( f43_local4, {
			name = Engine.ToUpper( Engine.Localize( "CODCASTER_TEAM_IDENTITY_FACTIONS" ) ),
			value = Enum.ShoutcasterSettingTeamIdentityMode.SHOUTCASTER_SETTING_TEAM_IDENTITY_MODE_FACTION
		} )
		table.insert( f43_local4, {
			name = Engine.ToUpper( Engine.Localize( "CODCASTER_TEAM_IDENTITY_CUSTOM" ) ),
			value = Enum.ShoutcasterSettingTeamIdentityMode.SHOUTCASTER_SETTING_TEAM_IDENTITY_MODE_CUSTOM
		} )
		for f43_local8, f43_local9 in ipairs( {
			{
				btnType = "btnSettings",
				displayText = "CODCASTER_QUICK_SETTINGS",
				hintText = "CODCASTER_QUICK_SETTINGS_DESC",
				buttonOnly = true,
				disabled = false,
				showTeam1Info = false,
				showTeam2Info = false,
				actionFn = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3, f46_arg4 )
					NavigateToMenu( f46_arg4, "EditCodCasterQuickSettings", true, f46_arg2 )
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
				actionFn = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
					NavigateToMenu( f47_arg4, "EditCodCasterDisplaySettings", true, f47_arg2 )
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
				actionFn = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4 )
					NavigateToMenu( f48_arg4, "EditCodCasterLoadoutSettings", true, f48_arg2 )
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
				actionFn = function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3, f49_arg4 )
					
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
				optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f43_arg0, "CoDCasterSettings_TeamIdentity", f43_local4, f43_local2, function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
					for f45_local0 = 1, #f45_arg0.ButtonList.EditCodCasterSettingsButtonList, 1 do
						local f45_local3 = f45_arg0.ButtonList.EditCodCasterSettingsButtonList[f45_local0]
						if f45_local3.properties and f45_local3.properties.btnType == "btnTeamIdentitySubSettings" then
							local f45_local4 = Engine.GetModel( f45_local3.model, "disabled" )
							local f45_local5 = f45_arg3 == 0
							Engine.SetModelValue( f45_local4, f45_local5 )
							f45_local3.properties.disabled = f45_local5
							CoD.SetupTeamIdentityInformation( f45_arg0, f45_arg1, "team1" )
							CoD.SetupTeamIdentityInformation( f45_arg0, f45_arg1, "team2" )
						end
					end
				end
				, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
				currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f43_arg0, f43_local4, f43_local2 )
			},
			{
				btnType = "btnTeamIdentitySubSettings",
				displayText = "CODCASTER_TEAM1_SETTINGS",
				hintText = "CODCASTER_TEAM1_SETTINGS_DESC",
				buttonOnly = true,
				disabled = f43_local3,
				showTeam1Info = true,
				showTeam2Info = false,
				actionFn = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3, f50_arg4 )
					f43_local1( f50_arg2, "team1" )
					NavigateToMenu( f50_arg4, "EditTeamIdentity", true, f50_arg2 )
				end
			},
			{
				btnType = "btnTeamIdentitySubSettings",
				displayText = "CODCASTER_TEAM2_SETTINGS",
				hintText = "CODCASTER_TEAM2_SETTINGS_DESC",
				buttonOnly = true,
				disabled = f43_local3,
				showTeam1Info = false,
				showTeam2Info = true,
				actionFn = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3, f51_arg4 )
					f43_local1( f51_arg2, "team2" )
					NavigateToMenu( f51_arg4, "EditTeamIdentity", true, f51_arg2 )
				end
			}
		} ) do
			table.insert( f43_local0, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( f43_local9.displayText ) ),
					hintText = f43_local9.hintText,
					buttonOnly = f43_local9.buttonOnly,
					sliderOnly = f43_local9.sliderOnly,
					disabled = f43_local9.disabled,
					showTeam1Info = f43_local9.showTeam1Info,
					showTeam2Info = f43_local9.showTeam2Info,
					optionsDatasource = f43_local9.optionsDatasource,
					currentSelection = f43_local9.currentSelection,
					selected = false
				},
				properties = {
					btnType = f43_local9.btnType,
					hideArrows = f43_local9.buttonOnly == true,
					disabled = f43_local9.disabled,
					action = f43_local9.actionFn,
					spacing = f43_local9.spacing
				}
			} )
		end
		return f43_local0
	end
	, false, nil, nil, function ( f52_arg0, f52_arg1, f52_arg2 )
		if f52_arg0.EditCodCasterSettingsButtonList[f52_arg1].properties.spacing then
			return f52_arg0.EditCodCasterSettingsButtonList[f52_arg1].properties.spacing
		else
			return f52_arg0.spacing
		end
	end
	 ),
	CodCasterQuickSettingsButtonList = f0_local7( "CodCasterQuickSettingsButtonList", function ( f53_arg0 )
		local f53_local0 = {}
		for f53_local4, f53_local5 in ipairs( {
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
			table.insert( f53_local0, {
				models = {
					displayText = Engine.Localize( f53_local5.displayText ),
					hintText = Engine.Localize( f53_local5.hintText ),
					profileVarValue = CoD.ShoutcasterProfileVarBool( f53_arg0, f53_local5.profileVar )
				},
				properties = {
					profileVar = f53_local5.profileVar
				}
			} )
		end
		return f53_local0
	end
	 ),
	CodCasterDisplaySettingsButtonList = f0_local7( "CodCasterDisplaySettingsButtonList", function ( f54_arg0 )
		local f54_local0 = {}
		local f54_local1 = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
			if not Engine.IsInGame() then
				return 
			else
				ToggleControllerModelValueNumber( f55_arg1, "CodCaster.profileSettingsUpdated" )
			end
		end
		
		local f54_local2 = {}
		table.insert( f54_local2, {
			name = "MENU_OFF",
			value = 0
		} )
		table.insert( f54_local2, {
			name = "MENU_ON",
			value = 1
		} )
		local f54_local3 = {}
		table.insert( f54_local3, {
			name = "CODCASTER_XRAY_NONE",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_OFF
		} )
		table.insert( f54_local3, {
			name = "CODCASTER_XRAY_ENEMY",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_ENEMY
		} )
		table.insert( f54_local3, {
			name = "CODCASTER_XRAY_BOTH",
			value = Enum.ShoutcasterSettingsXray.SHOUTCASTER_SETTING_XRAY_ALL
		} )
		local f54_local4 = {}
		table.insert( f54_local4, {
			name = "MENU_ON_SPAWN",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ON
		} )
		table.insert( f54_local4, {
			name = "MPUI_ALWAYS_ON",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_ALWAYS
		} )
		table.insert( f54_local4, {
			name = "CODCASTER_MINIMAP_STANDARD",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_STANDARD
		} )
		table.insert( f54_local4, {
			name = "MENU_OFF",
			value = Enum.ShoutcasterSettingShowPerks.SHOUTCASTER_SETTING_SHOW_PERKS_OFF
		} )
		local f54_local5 = {}
		table.insert( f54_local5, {
			name = "MENU_OFF",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_OFF
		} )
		table.insert( f54_local5, {
			name = "CODCASTER_MINIMAP_STANDARD",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_STANDARD
		} )
		table.insert( f54_local5, {
			name = "CODCASTER_MINIMAP_FULL_VIEW",
			value = Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_FULL
		} )
		for f54_local9, f54_local10 in ipairs( {
			{
				name = "Xray",
				displayText = "CODCASTER_DS_XRAY",
				hintText = "CODCASTER_DS_XRAY_DESC",
				profileVar = "shoutcaster_xray",
				options = f54_local3
			},
			{
				name = "FlipScorePanel",
				displayText = "CODCASTER_DS_FLIP_SCORE_PANEL",
				hintText = "CODCASTER_DS_FLIP_SCORE_PANEL_DESC",
				profileVar = "shoutcaster_flip_scorepanel",
				options = f54_local2
			},
			{
				name = "TeamIdentity",
				displayText = "CODCASTER_DS_TEAM_IDENTITY",
				hintText = "CODCASTER_DS_TEAM_IDENTITY_DESC",
				profileVar = "shoutcaster_team_identity",
				options = f54_local2
			},
			{
				name = "Toolbar",
				displayText = "CODCASTER_DS_TOOLBAR",
				hintText = "CODCASTER_DS_TOOLBAR_DESC",
				profileVar = "shoutcaster_toolbar",
				options = f54_local2
			},
			{
				name = "Perks",
				displayText = "CODCASTER_DS_PERKS",
				hintText = "CODCASTER_DS_PERKS_DESC",
				profileVar = "shoutcaster_perks",
				options = f54_local4
			},
			{
				name = "Minimap",
				displayText = "CODCASTER_DS_MINIMAP",
				hintText = "CODCASTER_DS_MINIMAP_DESC",
				profileVar = "shoutcaster_minimap",
				options = f54_local5
			},
			{
				name = "TeamScore",
				displayText = "CODCASTER_DS_TEAM_SCORE",
				hintText = "CODCASTER_DS_TEAM_SCORE_DESC",
				profileVar = "shoutcaster_teamscore",
				options = f54_local2
			},
			{
				name = "Inventory",
				displayText = "CODCASTER_DS_INVENTORY",
				hintText = "CODCASTER_DS_INVENTORY_DESC",
				profileVar = "shoutcaster_inventory",
				options = f54_local2
			},
			{
				name = "Scorestreaks",
				displayText = "CODCASTER_DS_SCORESTREAKS",
				hintText = "CODCASTER_DS_SCORESTREAKS_DESC",
				profileVar = "shoutcaster_scorestreaks",
				options = f54_local2
			},
			{
				name = "ScorestreakNotifications",
				displayText = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS",
				hintText = "CODCASTER_DS_SCORESTREAK_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_scorestreaks_notification",
				options = f54_local2
			},
			{
				name = "SpecialistNotifications",
				displayText = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS",
				hintText = "CODCASTER_DS_SPECIALIST_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_specialist_notification",
				options = f54_local2
			},
			{
				name = "ObjectiveStatus",
				displayText = "CODCASTER_DS_OBJECTIVE_STATUS",
				hintText = "CODCASTER_DS_OBJECTIVE_STATUS_DESC",
				profileVar = "shoutcaster_objective_status",
				options = f54_local2
			},
			{
				name = "WaypointMarkers",
				displayText = "CODCASTER_DS_WAYPOINT_MARKERS",
				hintText = "CODCASTER_DS_WAYPOINT_MARKERS_DESC",
				profileVar = "shoutcaster_waypoint_markers",
				options = f54_local2
			},
			{
				name = "KillFeed",
				displayText = "CODCASTER_DS_KILLFEED",
				hintText = "CODCASTER_DS_KILLFEED_DESC",
				profileVar = "shoutcaster_killfeed",
				options = f54_local2
			},
			{
				name = "CalloutCards",
				displayText = "CODCASTER_DS_CALLOUT_CARDS",
				hintText = "CODCASTER_DS_CALLOUT_CARDS_DESC",
				profileVar = "shoutcaster_calloutcards",
				options = f54_local2
			},
			{
				name = "PlayerNotifications",
				displayText = "CODCASTER_DS_PLAYER_NOTIFICATIONS",
				hintText = "CODCASTER_DS_PLAYER_NOTIFICATIONS_DESC",
				profileVar = "shoutcaster_playernotifications",
				options = f54_local2
			},
			{
				name = "VoipDock",
				displayText = "CODCASTER_DS_VOIP_DOCK",
				hintText = "CODCASTER_DS_VOIP_DOCK_DESC",
				profileVar = "shoutcaster_voipdock",
				options = f54_local2
			}
		} ) do
			table.insert( f54_local0, {
				models = {
					displayText = f54_local10.displayText,
					hintText = f54_local10.hintText,
					buttonOnly = false,
					disabled = false,
					optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f54_arg0, "CoDCasterDisplaySettings_" .. f54_local10.name, f54_local10.options, f54_local10.profileVar, f54_local1, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
					currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f54_arg0, f54_local10.options, f54_local10.profileVar ),
					selected = false
				},
				properties = {
					hideArrows = false,
					disabled = false
				}
			} )
		end
		return f54_local0
	end
	 ),
	CodCasterLoadoutSettingsButtonList = f0_local7( "CodCasterLoadoutSettingsButtonList", function ( f56_arg0 )
		local f56_local0 = {}
		local f56_local1 = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
			if not Engine.IsInGame() then
				return 
			else
				ToggleControllerModelValueNumber( f57_arg1, "CodCaster.profileSettingsUpdated" )
			end
		end
		
		local f56_local2 = {}
		table.insert( f56_local2, {
			name = "MENU_OFF",
			value = 0
		} )
		table.insert( f56_local2, {
			name = "MENU_ON",
			value = 1
		} )
		for f56_local6, f56_local7 in ipairs( {
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
			table.insert( f56_local0, {
				models = {
					displayText = f56_local7.displayText,
					hintText = f56_local7.hintText,
					buttonOnly = false,
					disabled = false,
					optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( f56_arg0, "CoDCasterLoadoutSettings_" .. f56_local7.name, f56_local2, f56_local7.profileVar, f56_local1, CoD.CodCasterUtility.Options_ItemSelected, CoD.CodCasterUtility.Options_RevertItemSelected ),
					currentSelection = CoD.CodCasterUtility.Options_GetProfileSelection( f56_arg0, f56_local2, f56_local7.profileVar ),
					selected = false
				},
				properties = {
					hideArrows = false,
					disabled = false
				}
			} )
		end
		return f56_local0
	end
	 ),
	TeamIdentity = {
		getModel = function ( f58_arg0 )
			if not f58_arg0 then
				f58_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f58_arg0 ), "TeamIdentity" )
		end
	},
	TeamIdentityInformation = {
		getModel = function ( f59_arg0, f59_arg1 )
			if not f59_arg0 then
				f59_arg0 = Engine.GetPrimaryController()
			end
			local f59_local0 = Engine.GetModel( Engine.GetModelForController( f59_arg0 ), "TeamIdentity" )
			if not f59_arg1 then
				f59_arg1 = Engine.GetModelValue( Engine.GetModel( f59_local0, "team" ) )
			end
			return Engine.CreateModel( f59_local0, f59_arg1 )
		end
	},
	TeamIdentityColorList = f0_local7( "TeamIdentityColorList", function ( f60_arg0 )
		local f60_local0 = {}
		if not CoD.CodCaster_TeamIdentity.ColorList then
			CoD.CodCaster_TeamIdentity.ColorList = CoD.GetCodCasterTeamColorList( f60_arg0 )
		end
		local f60_local1 = CoD.CodCaster_TeamIdentity.ColorList
		local f60_local2 = Engine.GetModel( Engine.GetModelForController( f60_arg0 ), "TeamIdentity" )
		if f60_local2 then
			local f60_local3 = Engine.GetModelValue( Engine.GetModel( f60_local2, "team" ) )
			local f60_local4 = CoD.ShoutcasterProfileVarValue( f60_arg0, "shoutcaster_fe_" .. f60_local3 .. "_color" )
			local f60_local5 = -1
			if f60_local3 == "team1" then
				f60_local5 = CoD.ShoutcasterProfileVarValue( f60_arg0, "shoutcaster_fe_team2_color" )
			elseif f60_local3 == "team2" then
				f60_local5 = CoD.ShoutcasterProfileVarValue( f60_arg0, "shoutcaster_fe_team1_color" )
			end
			for f60_local6 = 1, #f60_local1, 1 do
				local f60_local9 = f60_local1[f60_local6]
				local f60_local10 = false
				local f60_local11 = false
				local f60_local12 = false
				if f60_local4 == f60_local6 - 1 then
					f60_local10 = true
					f60_local12 = true
				end
				if f60_local5 >= 0 and f60_local5 == f60_local6 - 1 then
					f60_local11 = true
				end
				if f60_local11 == false then
					table.insert( f60_local0, {
						models = {
							id = Engine.GetModelValue( Engine.GetModel( f60_local9, "id" ) ),
							color = Engine.GetModelValue( Engine.GetModel( f60_local9, "color" ) ),
							disabled = f60_local11,
							selected = f60_local12
						},
						properties = {
							selectIndex = f60_local10,
							disabled = f60_local11
						}
					} )
				end
			end
		end
		return f60_local0
	end
	 ),
	TeamIdentityLogoList = f0_local7( "TeamIdentityLogoList", function ( f61_arg0 )
		local f61_local0 = {}
		if not CoD.CodCaster_TeamIdentity.LogoList then
			CoD.CodCaster_TeamIdentity.LogoList = CoD.GetCodCasterTeamLogoList( f61_arg0 )
		end
		local f61_local1 = CoD.CodCaster_TeamIdentity.LogoList
		local f61_local2 = Engine.GetModel( Engine.GetModelForController( f61_arg0 ), "TeamIdentity" )
		if f61_local2 then
			local f61_local3 = Engine.GetModelValue( Engine.GetModel( f61_local2, "team" ) )
			local f61_local4 = CoD.ShoutcasterProfileVarValue( f61_arg0, "shoutcaster_fe_" .. f61_local3 .. "_icon" )
			local f61_local5 = -1
			if f61_local3 == "team1" then
				f61_local5 = CoD.ShoutcasterProfileVarValue( f61_arg0, "shoutcaster_fe_team2_icon" )
			elseif f61_local3 == "team2" then
				f61_local5 = CoD.ShoutcasterProfileVarValue( f61_arg0, "shoutcaster_fe_team1_icon" )
			end
			for f61_local6 = 1, #f61_local1, 1 do
				local f61_local9 = f61_local1[f61_local6]
				local f61_local10 = false
				local f61_local11 = false
				if f61_local4 == f61_local6 - 1 then
					f61_local10 = true
				end
				if f61_local5 >= 0 and f61_local5 == f61_local6 - 1 then
					f61_local11 = true
				end
				table.insert( f61_local0, {
					models = {
						id = Engine.GetModelValue( Engine.GetModel( f61_local9, "id" ) ),
						name = Engine.GetModelValue( Engine.GetModel( f61_local9, "name" ) ),
						ref = Engine.GetModelValue( Engine.GetModel( f61_local9, "ref" ) ),
						disabled = f61_local11
					},
					properties = {
						selectIndex = f61_local10,
						disabled = f61_local11
					}
				} )
			end
		end
		return f61_local0
	end
	 ),
	MyShowcaseTabs = f0_local7( "MyShowcaseTabs", function ( f62_arg0 )
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
		table.insert( f62_local0, {
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
		table.insert( f62_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f62_local0
	end
	 ),
	MyShowcasePaintjobsTabs = f0_local7( "MyShowcasePaintjobsTabs", function ( f63_arg0 )
		return {}
	end
	 ),
	GametypeSettings = {
		getModel = function ( f64_arg0 )
			return Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		end
	},
	StartMenuGameOptions = f0_local7( "StartMenuGameOptions", function ( f65_arg0 )
		local f65_local0 = {}
		if Engine.IsDemoPlaying() then
			local f65_local1 = Engine.GetDemoSegmentCount()
			local f65_local2 = Engine.IsDemoHighlightReelMode()
			local f65_local3 = Engine.IsDemoClipPlaying()
			table.insert( f65_local0, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( "MENU_UPLOAD_CLIP", f65_local1 ) ),
					action = StartMenuUploadClip,
					disabledFunction = IsUploadClipButtonDisabled
				}
			} )
			table.insert( f65_local0, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_MANAGE_SEGMENTS" ) ),
					action = StartMenuOpenManageSegments,
					disabledFunction = IsManageSegmentsButtonDisabled
				}
			} )
			if f65_local2 then
				table.insert( f65_local0, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) ),
						action = StartMenuOpenCustomizeHighlightReel,
						disabledFunction = IsCustomizeHighlightReelButtonDisabled
					}
				} )
			end
			table.insert( f65_local0, {
				models = {
					displayText = Engine.ToUpper( Engine.ToUpper( Engine.Localize( "MENU_JUMP_TO_START" ) ) ),
					action = StartMenuJumpToStart,
					disabledFunction = IsJumpToStartButtonDisabled
				}
			} )
			local f65_local4 = nil
			if f65_local3 then
				f65_local4 = Engine.ToUpper( Engine.Localize( "MENU_END_CLIP" ) )
			else
				f65_local4 = Engine.ToUpper( Engine.Localize( "MENU_END_FILM" ) )
			end
			table.insert( f65_local0, {
				models = {
					displayText = Engine.ToUpper( f65_local4 ),
					action = StartMenuEndDemo
				}
			} )
		elseif CoD.isCampaign then
			table.insert( f65_local0, {
				models = {
					displayText = "MENU_RESUMEGAME_CAPS",
					action = StartMenuGoBack_ListElement
				}
			} )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and not CoD.isSafehouse then
				table.insert( f65_local0, {
					models = {
						displayText = "MENU_RESTART_MISSION_CAPS",
						action = RestartMission
					}
				} )
				table.insert( f65_local0, {
					models = {
						displayText = "MENU_RESTART_CHECKPOINT_CAPS",
						action = RestartFromCheckpoint
					}
				} )
				table.insert( f65_local0, {
					models = {
						displayText = "MENU_CHANGE_DIFFICULTY_CAPS",
						action = OpenDifficultySelect
					}
				} )
			end
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				table.insert( f65_local0, {
					models = {
						displayText = "MENU_SAVE_AND_EXIT_CAPS",
						action = SaveAndQuitGame
					}
				} )
			else
				table.insert( f65_local0, {
					models = {
						displayText = "MENU_LEAVE_PARTY_AND_EXIT_CAPS",
						action = QuitGame
					}
				} )
			end
		elseif CoD.isMultiplayer then
			if Engine.Team( f65_arg0, "name" ) ~= "TEAM_SPECTATOR" and Engine.GetGametypeSetting( "disableClassSelection" ) ~= 1 then
				table.insert( f65_local0, {
					models = {
						displayText = "MPUI_CHOOSE_CLASS_BUTTON_CAPS",
						action = ChooseClass
					}
				} )
			end
			if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == false and Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false and not Engine.IsVisibilityBitSet( f65_arg0, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and not Engine.IsVisibilityBitSet( f65_arg0, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and CoD.IsGametypeTeamBased() == true and CoD.IsTeamChangeAllowed() then
				table.insert( f65_local0, {
					models = {
						displayText = "MPUI_CHANGE_TEAM_BUTTON_CAPS",
						action = ChooseTeam
					}
				} )
			end
			local f65_local2 = "MENU_QUIT_GAME_CAPS"
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and not CoD.isOnlineGame() then
				f65_local2 = "MENU_END_GAME_CAPS"
			end
			table.insert( f65_local0, {
				models = {
					displayText = f65_local2,
					action = QuitGame_MP
				}
			} )
		elseif CoD.isZombie then
			table.insert( f65_local0, {
				models = {
					displayText = "MENU_RESUMEGAME_CAPS",
					action = StartMenuGoBack_ListElement
				}
			} )
			if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
				table.insert( f65_local0, {
					models = {
						displayText = "MENU_RESTART_LEVEL_CAPS",
						action = RestartGame
					}
				} )
			end
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
				table.insert( f65_local0, {
					models = {
						displayText = "MENU_END_GAME_CAPS",
						action = QuitGame_MP
					}
				} )
			else
				table.insert( f65_local0, {
					models = {
						displayText = "MENU_QUIT_GAME_CAPS",
						action = QuitGame_MP
					}
				} )
			end
		end
		return f65_local0
	end
	, true ),
	PlatformControllerImage = {
		getModel = function ( f66_arg0 )
			local f66_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "PlatformControllerImage" )
			local f66_local1 = Engine.CreateModel( f66_local0, "image" )
			if CoD.isPC then
				Engine.SetModelValue( f66_local1, "t7_menu_startmenu_option_pc" )
			elseif CoD.isDurango then
				Engine.SetModelValue( f66_local1, "t7_menu_startmenu_option_xboxone" )
			else
				Engine.SetModelValue( f66_local1, "t7_menu_startmenu_option_ps4" )
			end
			return f66_local0
		end
	},
	MissionObjectives = f0_local7( "MissionObjectives", function ( f67_arg0 )
		local f67_local0 = {}
		local f67_local1 = Engine.GetPlayerObjectives( f67_arg0 )
		if f67_local1 == nil then
			return 
		end
		local f67_local2 = {}
		local f67_local3 = 1
		for f67_local9, f67_local10 in CoD.pairsByKeys( f67_local1 ) do
			if f67_local10.status ~= "invisible" and f67_local10.objective_desc ~= nil and f67_local10.objective_desc ~= "" then
				if not f67_local2[f67_local10.objective_desc] then
					f67_local2[f67_local10.objective_desc] = {
						index = f67_local3,
						desc = f67_local10.objective_desc,
						complete = f67_local10.status == "done",
						sub_objectives = {}
					}
					f67_local3 = f67_local3 + 1
				end
				local f67_local7 = f67_local2[f67_local10.objective_desc]
				local f67_local8 = f67_local2[f67_local10.objective_desc].complete
				if f67_local8 then
					f67_local8 = f67_local10.status == "done"
				end
				f67_local7.complete = f67_local8
				if f67_local10.subobjective_desc then
					table.insert( f67_local2[f67_local10.objective_desc].sub_objectives, {
						desc = f67_local10.subobjective_desc,
						complete = f67_local10.status == "done"
					} )
				end
			end
		end
		f67_local4 = function ( f68_arg0, f68_arg1 )
			return f67_local2[f68_arg0].index < f67_local2[f68_arg1].index
		end
		
		f67_local5 = function ( f69_arg0, f69_arg1, f69_arg2 )
			return {
				models = {
					objective = f69_arg0.desc
				},
				properties = {
					completed = f69_arg0.complete,
					subobjective = f69_arg1,
					awaitingOrders = f69_arg2
				}
			}
		end
		
		f67_local6 = function ( f70_arg0 )
			return f67_local5( {
				desc = "CPUI_AWAITING_UPDATE"
			}, f70_arg0, true )
		end
		
		f67_local9 = false
		for f67_local17, f67_local18 in LUI.IterateTableBySortedKeys( f67_local2, f67_local4 ) do
			table.insert( f67_local0, f67_local5( f67_local18 ) )
			if not f67_local18.complete then
				f67_local9 = true
				local f67_local11 = true
				for f67_local15, f67_local16 in ipairs( f67_local18.sub_objectives ) do
					table.insert( f67_local0, f67_local5( f67_local16, true ) )
					if f67_local11 then
						f67_local11 = f67_local16.complete
					end
				end
				if f67_local11 then
					table.insert( f67_local0, f67_local6( true ) )
				end
			end
		end
		if not f67_local9 then
			table.insert( f67_local0, 1, f67_local6( false ) )
		end
		return f67_local0
	end
	, true ),
	OptionsTabSelectionList = {
		prepare = function ( f71_arg0, f71_arg1, f71_arg2 )
			f71_arg1.options = {}
			local f71_local0 = {
				{
					optionDisplay = "OPEN OPTIONS MENU",
					action = OpenOptionsMenu
				}
			}
			local f71_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "OptionsTabSelectionList" )
			for f71_local5, f71_local6 in ipairs( f71_local0 ) do
				local f71_local7 = Engine.CreateModel( f71_local1, "buttonModel_" .. f71_local5 )
				f71_arg1.options[f71_local5] = f71_local7
				Engine.SetModelValue( Engine.CreateModel( f71_local7, "displayText" ), Engine.Localize( f71_local6.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( f71_local7, "action" ), f71_local6.action )
			end
		end,
		getCount = function ( f72_arg0 )
			return #f72_arg0.options
		end,
		getItem = function ( f73_arg0, f73_arg1, f73_arg2 )
			return f73_arg1.options[f73_arg2]
		end
	},
	StartMenuSelectionList = {
		prepare = function ( f74_arg0, f74_arg1, f74_arg2 )
			f74_arg1.options = {}
			local f74_local0 = nil
			if CoD.isCampaign == true then
				f74_local0 = {
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
				f74_local0 = {
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
			if not f74_local0 then
				return 
			end
			local f74_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "StartMenuSelectionModel" )
			for f74_local5, f74_local6 in ipairs( f74_local0 ) do
				local f74_local7 = Engine.CreateModel( f74_local1, "buttonModel_" .. f74_local5 )
				f74_arg1.options[f74_local5] = f74_local7
				Engine.SetModelValue( Engine.CreateModel( f74_local7, "displayText" ), Engine.Localize( f74_local6.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( f74_local7, "action" ), f74_local6.action )
			end
		end,
		getCount = function ( f75_arg0 )
			return #f75_arg0.options
		end,
		getItem = function ( f76_arg0, f76_arg1, f76_arg2 )
			return f76_arg1.options[f76_arg2]
		end
	},
	PartyLobbyMembers = {
		prepare = function ( f77_arg0, f77_arg1, f77_arg2 )
			f77_arg1.partyLobbyModel = f77_arg1:getModel( Engine.GetPrimaryController(), "partyLobby" )
			f77_arg1.partyLobbyMemberCountModel = Engine.GetModel( f77_arg1.partyLobbyModel, "memberCount" )
			f77_arg1:unsubscribeFromAllModels()
			f77_arg1:subscribeToModel( f77_arg1.partyLobbyMemberCountModel, function ()
				f77_arg1:updateDataSource()
			end )
		end,
		getCount = function ( f79_arg0 )
			return Engine.GetModelValue( f79_arg0.partyLobbyMemberCountModel )
		end,
		getItem = function ( f80_arg0, f80_arg1, f80_arg2 )
			return Engine.GetModel( f80_arg1.partyLobbyModel, "member" .. f80_arg2 - 1 )
		end
	},
	StorageGlobal = {
		getModel = function ( f81_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "storageGlobalRoot" )
		end
	},
	LobbyRoot = {
		getModel = function ( f82_arg0 )
			local f82_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			Engine.CreateModel( f82_local0, "leaderActivity" )
			if not Engine.GetModel( f82_local0, "lobbyStatusString1" ) then
				Engine.SetModelValue( Engine.CreateModel( f82_local0, "lobbyStatusString1" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f82_local0, "lobbyStatusString2" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f82_local0, "lobbyStatusString3" ), "" )
			end
			return f82_local0
		end
	},
	LobbyPromptTitle = {
		getModel = function ( f83_arg0 )
			local f83_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPromptModel" )
			local f83_local1 = Engine.CreateModel( f83_local0, "lobbyPromptTitle" )
			local f83_local2 = Engine.CreateModel( f83_local0, "lobbyPromptDescription" )
			Engine.SetModelValue( f83_local1, CoD.LobbyBase.Prompt.Title )
			Engine.SetModelValue( f83_local2, CoD.LobbyBase.Prompt.Description )
			return f83_local0
		end
	},
	LobbyPlaylistName = {
		getModel = function ( f84_arg0 )
			local f84_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
			local f84_local1 = Engine.CreateModel( f84_local0, "name" )
			if CoD.LobbyBase then
				Engine.SetModelValue( f84_local1, Engine.ToUpper( CoD.LobbyBase.PlaylistName ) )
			else
				Engine.SetModelValue( f84_local1, "" )
			end
			return f84_local0
		end
	},
	LobbyPromptSelectionList = {
		prepare = function ( f85_arg0, f85_arg1, f85_arg2 )
			f85_arg1.options = {}
			local f85_local0 = CoD.LobbyBase.Prompt.Options
			local f85_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "LobbyPromptSelectionListModel" )
			for f85_local5, f85_local6 in ipairs( f85_local0 ) do
				local f85_local7 = Engine.CreateModel( f85_local1, "buttonModel_" .. f85_local5 )
				f85_arg1.options[f85_local5] = f85_local7
				Engine.SetModelValue( Engine.CreateModel( f85_local7, "displayText" ), Engine.Localize( f85_local6.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( f85_local7, "action" ), f85_local6.action )
				Engine.SetModelValue( Engine.CreateModel( f85_local7, "param" ), f85_local6.param )
				Engine.SetModelValue( Engine.CreateModel( f85_local7, "customId" ), f85_local6.customId )
			end
		end,
		getCount = function ( f86_arg0 )
			return #f86_arg0.options
		end,
		getItem = function ( f87_arg0, f87_arg1, f87_arg2 )
			return f87_arg1.options[f87_arg2]
		end
	},
	ModalDialogData = {
		getModel = function ( f88_arg0 )
			local f88_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" )
			Engine.SetModelValue( Engine.CreateModel( f88_local0, "title" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Title ) )
			Engine.SetModelValue( Engine.CreateModel( f88_local0, "description" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Description ) )
			return f88_local0
		end
	},
	ModalDialogDataList = {
		prepare = function ( f89_arg0, f89_arg1, f89_arg2 )
			f89_arg1.options = {}
			local f89_local0 = CoD.Menu.ModalDialogInfo.Options
			local f89_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" ), "list" )
			for f89_local5, f89_local6 in ipairs( f89_local0 ) do
				f89_arg1.options[f89_local5] = Engine.CreateModel( f89_local1, "buttonModel_" .. f89_local5 )
				Engine.SetModelValue( Engine.CreateModel( f89_arg1.options[f89_local5], "displayText" ), Engine.Localize( f89_local6 ) )
			end
		end,
		getCount = function ( f90_arg0 )
			return #f90_arg0.options
		end,
		getItem = function ( f91_arg0, f91_arg1, f91_arg2 )
			return f91_arg1.options[f91_arg2]
		end
	},
	SideModalDialogDataList = {
		prepare = function ( f92_arg0, f92_arg1, f92_arg2 )
			f92_arg1.options = {}
			local f92_local0 = CoD.Menu.ModalDialogInfo.Options
			local f92_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" ), "list" )
			for f92_local5, f92_local6 in ipairs( f92_local0 ) do
				f92_arg1.options[f92_local5] = Engine.CreateModel( f92_local1, "buttonModel_" .. f92_local5 )
				Engine.SetModelValue( Engine.CreateModel( f92_arg1.options[f92_local5], "displayText" ), Engine.Localize( f92_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f92_arg1.options[f92_local5], "displayImage" ), f92_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f92_arg1.options[f92_local5], "displayDesc" ), Engine.Localize( f92_local6.displayDesc ) )
			end
		end,
		getCount = function ( f93_arg0 )
			return #f93_arg0.options
		end,
		getItem = function ( f94_arg0, f94_arg1, f94_arg2 )
			return f94_arg1.options[f94_arg2]
		end
	},
	PartyPrivacy = {
		getModel = function ( f95_arg0 )
			Dvar.partyPrivacyEnabled:set( true )
			local f95_local0 = Engine.GetPartyPrivacy()
			local f95_local1 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				f95_local1 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
			end
			local f95_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
			Engine.SetModelValue( Engine.CreateModel( f95_local2, "privacy" ), f95_local0 )
			Engine.SetModelValue( Engine.CreateModel( f95_local2, "privacyStatus" ), PartyPrivacy( f95_local0 ) )
			Engine.SetModelValue( Engine.CreateModel( f95_local2, "maxPlayers" ), f95_local1 )
			return f95_local2
		end
	},
	MapVote = {
		getModel = function ( f96_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
		end
	},
	LobbyFriendsAndGroups = {
		updateOnlineCount = function ( f97_arg0, f97_arg1, f97_arg2 )
			local f97_local0 = Engine.GetModelValue( f97_arg1.friendsCountUIModel )
			local f97_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyFriends" )
			Engine.SetModelValue( Engine.CreateModel( f97_local1, "onlineCount" ), f97_local0 )
			Engine.SetModelValue( Engine.CreateModel( f97_local1, "moreCount" ), f97_local0 )
			DataSources.LobbyFriendsAndGroups.onlineFriendsCount = f97_local0
		end,
		prepare = function ( f98_arg0, f98_arg1, f98_arg2 )
			local f98_local0 = 0
			if CoD.isModeSelected == true then
				f98_local0 = 1
			end
			f98_arg1.listItems = {}
			if f98_arg1.countSubscription then
				f98_arg1:removeSubscription( f98_arg1.countSubscription )
			end
			if f98_arg1.lobbyListCountSubscription then
				f98_arg1:removeSubscription( f98_arg1.lobbyListCountSubscription )
			end
			local f98_local1 = {}
			f98_arg1.friendsUIModel = CoD.Friends.GetRootUIModel( f98_arg0 )
			f98_arg1.friendsCountUIModel = CoD.Friends.GetCountUIModel( f98_arg0 )
			if f98_arg1.friendsListCountSubscription then
				f98_arg1:removeSubscription( f98_arg1.friendsListCountSubscription )
			end
			f98_arg1.friendsListCountSubscription = f98_arg1:subscribeToModel( CoD.Friends.GetCountUIModel( f98_arg0 ), function ( model )
				DataSources.LobbyFriendsAndGroups.updateOnlineCount( f98_arg0, f98_arg1, f98_arg2 )
				f98_arg1:updateDataSource()
			end, false )
			if f98_arg1.friendsUpdateSubscription then
				f98_arg1:removeSubscription( f98_arg1.friendsUpdateSubscription )
			end
			local f98_local2 = CoD.Friends.GetUpdateUIModel( f98_arg0 )
			if f98_local2 ~= nil then
				f98_arg1.friendsUpdateSubscription = f98_arg1:subscribeToModel( f98_local2, function ( model )
					f98_arg1:updateDataSource()
				end, false )
			end
			DataSources.LobbyFriendsAndGroups.updateOnlineCount( f98_arg0, f98_arg1, f98_arg2 )
			local f98_local3 = Engine.GetModelValue( f98_arg1.friendsCountUIModel )
			for f98_local4 = 1, f98_local3, 1 do
				local f98_local7 = CoD.Friends.GetItemUIModel( f98_arg1.friendsUIModel, f98_local4 )
				local f98_local8 = Engine.GetModelValue( Engine.GetModel( f98_local7, "hasRank" ) )
				CoD.Friends.GetCount( f98_arg0 )
				if f98_local8 == 1 then
					Engine.SetModelValue( Engine.CreateModel( f98_local7, "rankShown" ), f98_local0 )
				else
					Engine.SetModelValue( Engine.CreateModel( f98_local7, "rankShown" ), 0 )
				end
				Engine.SetModelValue( Engine.CreateModel( f98_local7, "activity" ), Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY )
				table.insert( f98_local1, {
					model = f98_local7,
					isFriendItem = true,
					xuid = Engine.GetModelValue( Engine.GetModel( f98_local7, "xuid" ) )
				} )
			end
			local f98_local4 = {}
			local f98_local5 = Engine.GetModel( Engine.GetGlobalModel(), "unifiedGroupMembersListRoot" )
			if f98_local5 ~= nil then
				f98_arg1.groupMembersUIModel = f98_local5
				f98_arg1.groupMembersCountUIModel = Engine.GetModel( f98_arg1.groupMembersUIModel, "count" )
				if f98_arg1.groupsListCountSubscription then
					f98_arg1:removeSubscription( f98_arg1.groupsListCountSubscription )
				end
				f98_arg1.groupsListCountSubscription = f98_arg1:subscribeToModel( f98_arg1.groupMembersCountUIModel, function ( model )
					DataSources.LobbyFriendsAndGroups.updateOnlineCount( f98_arg0, f98_arg1, f98_arg2 )
					f98_arg1:updateDataSource()
				end, false )
				DataSources.LobbyFriendsAndGroups.updateOnlineCount( f98_arg0, f98_arg1, f98_arg2 )
				local f98_local6 = Engine.GetModelValue( f98_arg1.groupMembersCountUIModel )
				for f98_local9 = 1, f98_local6, 1 do
					local f98_local10 = Engine.GetModel( f98_arg1.groupMembersUIModel, "member" .. f98_local9 - 1 )
					local f98_local11 = Engine.GetModelValue( Engine.GetModel( f98_local10, "hasRank" ) )
					local f98_local12 = Engine.GetModelValue( Engine.GetModel( f98_local10, "xuid" ) )
					local f98_local13 = false
					for f98_local14 = 1, #f98_local1, 1 do
						if Engine.GetModelValue( Engine.GetModel( f98_local1[f98_local14].model, "xuid" ) ) == f98_local12 then
							f98_local13 = true
							break
						end
					end
					if not f98_local13 then
						if f98_local11 == 1 then
							Engine.SetModelValue( Engine.CreateModel( f98_local10, "rankShown" ), f98_local0 )
						else
							Engine.SetModelValue( Engine.CreateModel( f98_local10, "rankShown" ), 0 )
						end
						Engine.SetModelValue( Engine.CreateModel( f98_local10, "isJoinable" ), 0 )
						table.insert( f98_local4, {
							model = f98_local10,
							isGroupsItem = true,
							xuid = f98_local12
						} )
					end
				end
			end
			f98_local6 = #f98_local4
			for f98_local17, f98_local10 in ipairs( f98_local1 ) do
				table.insert( f98_arg1.listItems, f98_local10 )
			end
			for f98_local17, f98_local10 in ipairs( f98_local4 ) do
				table.insert( f98_arg1.listItems, f98_local10 )
			end
		end,
		getCount = function ( f102_arg0 )
			return #f102_arg0.listItems
		end,
		getItem = function ( f103_arg0, f103_arg1, f103_arg2 )
			return f103_arg1.listItems[f103_arg2].model
		end,
		getCustomPropertiesForItem = function ( f104_arg0, f104_arg1 )
			return f104_arg0.listItems[f104_arg1]
		end
	},
	LobbyList = f0_local7( "LobbyList", function ( f105_arg0 )
		local f105_local0 = {}
		local f105_local1 = function ( f106_arg0, f106_arg1 )
			if f106_arg0.team < f106_arg1.team then
				return true
			elseif f106_arg0.team == f106_arg1.team and Engine.CompareUInt64( f106_arg0.lobbyID, f106_arg1.lobbyID, "<" ) then
				return true
			else
				return false
			end
		end
		
		local f105_local2 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyList" )
		local f105_local3 = Engine.CreateModel( f105_local2, "playerCount" )
		local f105_local4 = Engine.CreateModel( f105_local2, "maxPlayers" )
		local f105_local5 = 0
		local f105_local6 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f105_local6 then
			f105_local5 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
		else
			f105_local5 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		end
		local f105_local7 = Enum.LobbyModule.LOBBY_MODULE_CLIENT
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			f105_local7 = Enum.LobbyModule.LOBBY_MODULE_HOST
		end
		local f105_local8 = Engine.LobbyGetSessionClients( f105_local7, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f105_local9 = Engine.LobbyGetSessionClients( f105_local7, Enum.LobbyType.LOBBY_TYPE_GAME )
		if f105_local8 ~= nil and #f105_local8.sessionClients > 1 and f105_local6 == false then
			local f105_local10 = nil
			for f105_local14, f105_local15 in ipairs( f105_local8.sessionClients ) do
				f105_local8.sessionClients[f105_local14].isMember = 1
				f105_local8.sessionClients[f105_local14].isMemberLeader = f105_local15.isLeader
				f105_local8.sessionClients[f105_local14].isOtherMember = 0
				f105_local8.sessionClients[f105_local14].isMemberTopOrMiddle = 1
				f105_local10 = f105_local8.sessionClients[f105_local14]
			end
			if f105_local10 ~= nil then
				f105_local10.isMemberTopOrMiddle = 0
			end
		elseif f105_local6 == true and f105_local8 ~= nil and f105_local9 ~= nil then
			for f105_local13, f105_local14 in ipairs( f105_local9.sessionClients ) do
				local f105_local15 = false
				f105_local9.sessionClients[f105_local13].isMember = 0
				f105_local9.sessionClients[f105_local13].isMemberLeader = 0
				f105_local9.sessionClients[f105_local13].isOtherMember = 0
				f105_local9.sessionClients[f105_local13].isMemberTopOrMiddle = 0
				f105_local9.sessionClients[f105_local13].isOtherMemberTopOrMiddle = 0
				if #f105_local8.sessionClients > 1 then
					for f105_local19, f105_local20 in ipairs( f105_local8.sessionClients ) do
						if Engine.CompareUInt64( f105_local14.xuid, f105_local20.xuid, "=" ) then
							f105_local9.sessionClients[f105_local13].isMember = 1
							f105_local9.sessionClients[f105_local13].isMemberLeader = f105_local20.isLeader
							f105_local15 = true
							break
						end
					end
				end
				if f105_local15 == false then
					local f105_local16 = 0
					for f105_local20, f105_local21 in ipairs( f105_local9.sessionClients ) do
						if f105_local14.simpleLobbyID == f105_local9.sessionClients[f105_local20].simpleLobbyID then
							f105_local16 = f105_local16 + 1
						end
					end
					if f105_local16 > 1 then
						f105_local9.sessionClients[f105_local13].isOtherMember = 1
					end
				end
			end
			table.sort( f105_local9.sessionClients, f105_local1 )
			f105_local10, f105_local11 = nil
			for f105_local15, f105_local16 in ipairs( f105_local9.sessionClients ) do
				if f105_local10 ~= nil and f105_local11 == f105_local16.simpleLobbyID then
					if f105_local16.isMember == 1 or f105_local16.isMemberLeader and f105_local16.isMemberLeader ~= 0 then
						f105_local10.isMemberTopOrMiddle = 1
					elseif f105_local16.isOtherMember == 1 then
						f105_local10.isOtherMemberTopOrMiddle = 1
					end
				end
				f105_local10 = f105_local16
				f105_local11 = f105_local16.simpleLobbyID
			end
		end
		local f105_local10 = f105_local8.sessionClients
		if f105_local6 then
			f105_local10 = f105_local9.sessionClients
		end
		Engine.SetModelValue( f105_local3, #f105_local10 )
		Engine.SetModelValue( f105_local4, f105_local5 )
		for f105_local14, f105_local15 in ipairs( f105_local10 ) do
			local f105_local16 = 1
			if f105_local15.rankIcon == nil then
				f105_local16 = 0
			end
			f105_local15.displayRank = ""
			if f105_local15.rank then
				f105_local15.displayRank = Engine.GetRankDisplayLevel( f105_local15.rank )
			end
			local f105_local18 = Engine.TableLookup( f105_local15.localController, CoD.rankTable, CoD.XPBar.RankDisplayLevelCol, f105_local15.displayRank, 5 )
			local f105_local19 = f105_local15.team
			if not f105_local19 then
				f105_local19 = 0
			end
			if not f105_local15.isMemberLeader or f105_local15.isMemberLeader == 0 or #f105_local10 <= 1 or not 1 then
				local f105_local20 = 0
			end
			local f105_local21
			if f105_local15.isMember and f105_local15.isMember ~= 0 and #f105_local10 > 1 then
				f105_local21 = 1
				if not f105_local21 then
				
				else
					if f105_local15.isOtherMember then
						local f105_local22 = f105_local15.isOtherMember
						local f105_local23 = 1
					end
					local f105_local24 = f105_local22 and f105_local23 or 0
					local f105_local25 = Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
					if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL or Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
						local f105_local20 = 0
						f105_local15.isMember = 0
						f105_local15.isOtherMember = 0
					end
					if 0 < Dvar.ui_lobbyDebugVis:get() then
						f105_local15.gamertag = "s" .. string.format( "%.2f", f105_local15.skillRating ) .. " " .. f105_local15.gamertag
					end
					table.insert( f105_local0, {
						models = {
							xuid = f105_local15.xuid,
							gamertag = f105_local15.gamertag,
							lobbyID = f105_local15.lobbyID,
							rankShown = f105_local16,
							rank = f105_local15.displayRank,
							rankIcon = f105_local15.rankIcon,
							rankString = f105_local18,
							score = f105_local15.score,
							isHost = f105_local15.isHost,
							isLeader = f105_local15.isLeader,
							isLocal = f105_local15.isLocal,
							controllerNum = f105_local15.localController,
							isJoinable = 0,
							isMemberLeader = f105_local20,
							isMember = f105_local21,
							team = f105_local19,
							teamColor = CoD.GetTeamFactionColor( f105_local19 ),
							teamAlpha = 0.25,
							teamSwitch = f105_local19,
							voipStatus = f105_local15.VOIPStatus,
							activity = f105_local25,
							bgb1ItemIndex = f105_local15.bgb1ItemIndex,
							bgb2ItemIndex = f105_local15.bgb2ItemIndex,
							bgb3ItemIndex = f105_local15.bgb3ItemIndex,
							bgb4ItemIndex = f105_local15.bgb4ItemIndex,
							bgb5ItemIndex = f105_local15.bgb5ItemIndex
						},
						properties = {
							xuid = f105_local15.xuid,
							isSelf = f105_local15.isLocal == 1,
							isPartyMember = f105_local15.isMember == 1,
							isPartyMemberTopOrMiddle = f105_local15.isMemberTopOrMiddle == 1,
							isOtherMember = f105_local15.isOtherMember == 1,
							isOtherMemberTopOrMiddle = f105_local15.isOtherMemberTopOrMiddle == 1
						}
					} )
				end
			end
			f105_local21 = 0
		end
		return f105_local0
	end
	, nil, nil, function ( f107_arg0, f107_arg1, f107_arg2 )
		local f107_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local f107_local1 = Engine.GetModel( Engine.GetModel( f107_local0, "gameClient" ), "update" )
		local f107_local2 = Engine.GetModel( f107_local0, "lobbyNav" )
		if f107_arg1.gameClientUpdateSubscription then
			f107_arg1:removeSubscription( f107_arg1.gameClientUpdateSubscription )
		end
		f107_arg1.gameClientUpdateSubscription = f107_arg1:subscribeToModel( f107_local1, function ()
			f0_local9( f107_arg0, f107_arg1 )
		end, false )
		local f107_local3 = Engine.GetModel( Engine.GetModel( f107_local0, "privateClient" ), "update" )
		if f107_arg1.privateClientUpdateSubscription then
			f107_arg1:removeSubscription( f107_arg1.privateClientUpdateSubscription )
		end
		f107_arg1.privateClientUpdateSubscription = f107_arg1:subscribeToModel( f107_local3, function ()
			f0_local9( f107_arg0, f107_arg1 )
		end, false )
		if f107_arg1.lobbyNavSubscription then
			f107_arg1:removeSubscription( f107_arg1.lobbyNavSubscription )
		end
		f107_arg1.lobbyNavSubscription = f107_arg1:subscribeToModel( f107_local2, function ()
			f0_local9( f107_arg0, f107_arg1 )
		end, false )
	end
	 ),
	LobbyPrivateHostMembers = {
		prepare = function ( f111_arg0, f111_arg1, f111_arg2 )
			f111_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "privateHost" )
			f111_arg1.countModel = Engine.GetModel( f111_arg1.baseModel, "count" )
			f111_arg1.updateModel = Engine.GetModel( f111_arg1.baseModel, "update" )
			if f111_arg1.countSubscription then
				f111_arg1:removeSubscription( f111_arg1.countSubscription )
			end
			f111_arg1.countSubscription = f111_arg1:subscribeToModel( f111_arg1.countModel, function ()
				f111_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f113_arg0 )
			return Engine.GetModelValue( f113_arg0.countModel )
		end,
		getItem = function ( f114_arg0, f114_arg1, f114_arg2 )
			return Engine.GetModel( f114_arg1.baseModel, "member" .. f114_arg2 - 1 )
		end
	},
	LobbyPrivateClientMembers = {
		prepare = function ( f115_arg0, f115_arg1, f115_arg2 )
			f115_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "privateClient" )
			f115_arg1.countModel = Engine.GetModel( f115_arg1.baseModel, "count" )
			f115_arg1.updateModel = Engine.GetModel( f115_arg1.baseModel, "update" )
			if f115_arg1.countSubscription then
				f115_arg1:removeSubscription( f115_arg1.countSubscription )
			end
			f115_arg1.countSubscription = f115_arg1:subscribeToModel( f115_arg1.countModel, function ()
				if not f115_arg1.preparing then
					f115_arg1:updateDataSource()
				end
			end, false )
		end,
		getCount = function ( f117_arg0 )
			return Engine.GetModelValue( f117_arg0.countModel )
		end,
		getItem = function ( f118_arg0, f118_arg1, f118_arg2 )
			return Engine.GetModel( f118_arg1.baseModel, "member" .. f118_arg2 - 1 )
		end
	},
	LobbyGameHostMembers = {
		prepare = function ( f119_arg0, f119_arg1, f119_arg2 )
			f119_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "gameHost" )
			f119_arg1.countModel = Engine.GetModel( f119_arg1.baseModel, "count" )
			f119_arg1.updateModel = Engine.GetModel( f119_arg1.baseModel, "update" )
			if f119_arg1.countSubscription then
				f119_arg1:removeSubscription( f119_arg1.countSubscription )
			end
			f119_arg1.countSubscription = f119_arg1:subscribeToModel( f119_arg1.countModel, function ()
				f119_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f121_arg0 )
			return Engine.GetModelValue( f121_arg0.countModel )
		end,
		getItem = function ( f122_arg0, f122_arg1, f122_arg2 )
			return Engine.GetModel( f122_arg1.baseModel, "member" .. f122_arg2 - 1 )
		end
	},
	LobbyGameClientMembers = {
		prepare = function ( f123_arg0, f123_arg1, f123_arg2 )
			f123_arg1.baseModel = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "gameClient" )
			f123_arg1.countModel = Engine.GetModel( f123_arg1.baseModel, "count" )
			f123_arg1.updateModel = Engine.GetModel( f123_arg1.baseModel, "update" )
			if f123_arg1.countSubscription then
				f123_arg1:removeSubscription( f123_arg1.countSubscription )
			end
			f123_arg1.countSubscription = f123_arg1:subscribeToModel( f123_arg1.countModel, function ()
				f123_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f125_arg0 )
			return Engine.GetModelValue( f125_arg0.countModel )
		end,
		getItem = function ( f126_arg0, f126_arg1, f126_arg2 )
			return Engine.GetModel( f126_arg1.baseModel, "member" .. f126_arg2 - 1 )
		end
	},
	LobbyButtons = f0_local7( "LobbyButtons", function ( f127_arg0 )
		local f127_local0 = {}
		local f127_local1 = CoD.LobbyMenus.AddButtonsForTarget( f127_arg0, Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyNav" ) ) )
		local f127_local2 = false
		for f127_local6, f127_local7 in ipairs( f127_local1 ) do
			table.insert( f127_local0, {
				models = {
					displayText = Engine.Localize( f127_local7.optionDisplay ),
					customId = f127_local7.customId
				},
				properties = {
					disabled = f127_local7.disabled,
					action = f127_local7.action,
					actionParam = f127_local7.param,
					isLastButtonInGroup = f127_local7.isLastButtonInGroup,
					selectIndex = f127_local7.selected
				}
			} )
			if f127_local7.disabled ~= true then
				f127_local2 = true
			end
		end
		if not f127_local2 then
			table.insert( f127_local0, {
				models = {
					displayText = ""
				},
				properties = {
					disabled = false,
					fake = true
				}
			} )
		end
		return f127_local0
	end
	, nil, nil, function ( f128_arg0, f128_arg1, f128_arg2 )
		local f128_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "lobbyNav" )
		if f128_arg1.lobbyNavSubscription then
			f128_arg1:removeSubscription( f128_arg1.lobbyNavSubscription )
		end
		f128_arg1.lobbyNavSubscription = f128_arg1:subscribeToModel( f128_local0, function ()
			f128_arg1:clearSavedActiveIndex()
			f128_arg1:clearSavedState()
			f128_arg1:updateDataSource( true, false )
			if f128_arg1 then
				if f128_arg1:getParent() then
					local f129_local0 = f128_arg1:getParent()
					if f129_local0:getParent() then
						f129_local0 = f128_arg1:getParent()
						f129_local0 = f129_local0:getParent()
						if f129_local0:getParent() then
							f129_local0 = IsMenuInState
							local f129_local1 = f128_arg1:getParent()
							f129_local1 = f129_local1:getParent()
							if not f129_local0( f129_local1:getParent(), "Right" ) then
							
							else
								
							end
						end
					end
				end
				f128_arg1:processEvent( {
					name = "gain_focus",
					controller = f128_arg0
				} )
			end
		end, false )
		local f128_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
		if f128_arg1.networkModeSub then
			f128_arg1:removeSubscription( f128_arg1.networkModeSub )
		end
		f128_arg1.networkModeSub = f128_arg1:subscribeToModel( f128_local1, function ()
			f128_arg1:updateDataSource()
		end, false )
		local f128_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
		if f128_arg1.timerActiveSubscription then
			f128_arg1:removeSubscription( f128_arg1.timerActiveSubscription )
		end
		f128_arg1.timerActiveSubscription = f128_arg1:subscribeToModel( f128_local2, function ()
			f128_arg1:updateDataSource()
		end, false )
		local f128_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.isHost" )
		if f128_arg1.lobbyHostSub then
			f128_arg1:removeSubscription( f128_arg1.lobbyHostSub )
		end
		f128_arg1.lobbyHostSub = f128_arg1:subscribeToModel( f128_local3, function ()
			f128_arg1:updateDataSource()
		end, false )
		local f128_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.isHost" )
		if f128_arg1.lobbyGameHostSub then
			f128_arg1:removeSubscription( f128_arg1.lobbyGameHostSub )
		end
		f128_arg1.lobbyGameHostSub = f128_arg1:subscribeToModel( f128_local4, function ()
			f128_arg1:updateDataSource()
		end, false )
		local f128_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" )
		if f128_arg1.theaterDataDownloadedSub then
			f128_arg1:removeSubscription( f128_arg1.theaterDataDownloadedSub )
		end
		f128_arg1.theaterDataDownloadedSub = f128_arg1:subscribeToModel( f128_local5, function ()
			f128_arg1:updateDataSource()
		end, false )
		local f128_local6 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" )
		if f128_arg1.updateButtonsModelSub then
			f128_arg1:removeSubscription( f128_arg1.updateButtonsModelSub )
		end
		f128_arg1.updateButtonsModelSub = f128_arg1:subscribeToModel( f128_local6, function ()
			local f135_local0 = IsCodCaster( f128_arg0 )
			if f128_arg1.wasCodCaster == nil or f135_local0 ~= f128_arg1.wasCodCaster then
				f128_arg1.wasCodCaster = f135_local0
				f128_arg1:updateDataSource()
			else
				local f135_local1 = Engine.GetGametypeSetting( "teamAssignment" )
				if f128_arg1.oldTeamAssignment == nil or f128_arg1.oldTeamAssignment ~= f135_local1 then
					f128_arg1.oldTeamAssignment = f135_local1
					f128_arg1:updateDataSource()
				end
			end
		end, false )
	end
	, function ( f136_arg0, f136_arg1, f136_arg2 )
		if f136_arg0.LobbyButtons[f136_arg1].properties.isLastButtonInGroup then
			return 9
		else
			
		end
	end
	 ),
	SocialPlayerInfo = {
		getModel = function ( f137_arg0 )
			local f137_local0 = Engine.CreateModel( Engine.GetModelForController( f137_arg0 ), "socialPlayerInfo" )
			local f137_local1 = Engine.GetModelForController( f137_arg0 )
			local f137_local2 = Engine.GetModelValue( Engine.CreateModel( f137_local1, "Social.selectedFriendXUID" ), "xuid" )
			local f137_local3 = Engine.GetModelValue( Engine.CreateModel( f137_local1, "Social.selectedFriendGamertag" ) )
			local f137_local4 = Engine.GetPlayerInfo( f137_arg0, f137_local2 )
			if f137_local4 ~= nil then
				local f137_local5 = false
				local f137_local6 = false
				local f137_local7 = false
				if LuaUtils.IsBetaBuild() then
					f137_local5 = false
					f137_local4.info.cp.rank = 0
					f137_local4.info.cp.prestige = 0
					f137_local6 = true
					f137_local7 = false
					f137_local4.info.zm.rank = 0
					f137_local4.info.zm.prestige = 0
				end
				local f137_local8 = CoD.SocialUtility.GetRankIcons( "cp", f137_local5, f137_local4.info.cp.rank, f137_local4.info.cp.prestige )
				local f137_local9 = CoD.SocialUtility.GetRankIcons( "mp", f137_local6, f137_local4.info.mp.rank, f137_local4.info.mp.prestige )
				local f137_local10 = CoD.SocialUtility.GetRankIcons( "zm", f137_local7, f137_local4.info.zm.rank, f137_local4.info.zm.prestige )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "xuid" ), f137_local4.info.xuid )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "cpRank" ), f137_local4.info.cp.rank )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "cpRankIcon" ), f137_local8 )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "cpPrestige" ), f137_local4.info.cp.prestige )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "mpRank" ), f137_local4.info.mp.rank )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "mpRankIcon" ), f137_local9 )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "mpPrestige" ), f137_local4.info.mp.prestige )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "zmRank" ), f137_local4.info.zm.rank )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "zmRankIcon" ), f137_local10 )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "zmPrestige" ), f137_local4.info.zm.prestige )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "gamertag" ), f137_local4.info.gamertag )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "clantag" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "presence" ), f137_local4.info.presence )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "joinable" ), f137_local4.info.joinable )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "inGameLobby" ), f137_local4.info.inGameLobby )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "inPrivateLobby" ), f137_local4.info.inPrivateLobby )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "isSelf" ), f137_local4.info.isSelf )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "isLocal" ), f137_local4.info.isLocal )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "activity" ), f137_local4.info.activity )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "context" ), f137_local4.info.context )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "gametype" ), f137_local4.info.gametype )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "mapid" ), f137_local4.info.mapid )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "difficulty" ), f137_local4.info.difficulty )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "playlist" ), f137_local4.info.playlist )
				Engine.SetModelValue( Engine.CreateModel( f137_local0, "isFriend" ), f137_local4.info.isFriend )
			end
			return f137_local0
		end
	},
	PregameGlobal = {
		getModel = function ( f138_arg0 )
			local f138_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
			Engine.SetModelValue( Engine.CreateModel( f138_local0, "timeleft" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f138_local0, "status" ), "" )
			return f138_local0
		end
	},
	Pregame = {
		getModel = function ( f139_arg0 )
			local f139_local0 = Engine.CreateModel( Engine.GetModelForController( f139_arg0 ), "Pregame" )
			Engine.SetModelValue( Engine.CreateModel( f139_local0, "remainingVotes" ), 0 )
			return f139_local0
		end
	},
	PregameItemVoteTabs = f0_local7( "PregameItemVoteTabs", function ( f140_arg0 )
		local f140_local0 = {}
		local f140_local1 = CoD.CACUtility.PregameLoadoutFilters
		table.insert( f140_local0, {
			models = {
				index = -1,
				tabIcon = CoD.buttonStrings.shoulderl
			}
		} )
		for f140_local5, f140_local6 in pairs( f140_local1 ) do
			table.insert( f140_local0, {
				models = {
					tabName = f140_local6.title,
					index = f140_local5
				},
				properties = {}
			} )
		end
		table.insert( f140_local0, {
			models = {
				index = -1,
				tabIcon = CoD.buttonStrings.shoulderr
			}
		} )
		return f140_local0
	end
	 ),
	PregameRestrictedItems = f0_local7( "PregameRestrictedItems", function ( f141_arg0 )
		if DataSources.PregameRestrictedItems.cachedItems ~= nil then
			return DataSources.PregameRestrictedItems.cachedItems
		end
		local f141_local0 = {}
		for f141_local1 = 0, 43, 1 do
			local f141_local4 = {
				index = f141_local1,
				attachmentIndex = f141_local1,
				name = Engine.GetAttachmentNameByIndex( f141_local1 ),
				image = Engine.GetAttachmentImageByIndex( f141_local1 ),
				loadoutSlot = "attachment",
				isOptic = Engine.IsOpticByAttachmentIndex( f141_local1 ),
				items = {},
				bannedGroups = {}
			}
			for f141_local8, f141_local9 in pairs( CoD.CACUtility.PrimaryWeaponGroupNames ) do
				f141_local4.bannedGroups[f141_local9.index] = false
			end
			for f141_local8, f141_local9 in pairs( CoD.CACUtility.SecondaryWeaponGroupNames ) do
				f141_local4.bannedGroups[f141_local9.index] = false
			end
			f141_local0[f141_local1] = f141_local4
		end
		local f141_local1 = {}
		for f141_local2 = 0, 255, 1 do
			if Engine.ItemIndexValid( f141_local2 ) then
				local f141_local5 = Engine.GetUnlockableInfoByIndex( f141_local2 )
				local f141_local6 = true
				if LuaUtils.IsGamescomBuild() then
					f141_local6 = f141_local5.unlockLevel == 0
				end
				if f141_local5.allocation >= 0 and f141_local6 == true then
					local f141_local7 = {
						index = f141_local2,
						name = f141_local5.name,
						image = f141_local5.image,
						groupIndex = f141_local5.groupIndex,
						groupName = f141_local5.group,
						loadoutSlot = f141_local5.loadoutSlot,
						loadoutSlotIndex = f141_local5.loadoutSlotIndex,
						unlockLevel = f141_local5.unlockLevel,
						momentum = f141_local5.momentum
					}
					if LuaUtils.StartsWith( f141_local7.loadoutSlot, "hero" ) or f141_local7.loadoutSlot == "specialgadget" then
						f141_local7.image = f141_local5.image .. "_large"
					end
					if LuaUtils.StartsWith( f141_local7.loadoutSlot, "killstreak" ) then
						f141_local7.image = f141_local5.image .. "_menu"
					end
					if f141_local7.loadoutSlot == "primary" or f141_local7.loadoutSlot == "secondary" then
						local f141_local8 = Engine.GetNumAttachments( f141_local2 )
						if f141_local8 > 0 then
							f141_local7.attachments = {}
							for f141_local9 = 0, f141_local8 - 1, 1 do
								local f141_local13 = Engine.GetItemAttachment( f141_local2, f141_local9 )
								if not (f141_local0[f141_local13].bannedGroups[f141_local7.groupIndex] == true) and true and f141_local13 > CoD.CACUtility.EmptyItemIndex then
									f141_local7.attachments[f141_local13] = f141_local13
									table.insert( f141_local0[f141_local13].items, {
										itemIndex = f141_local2
									} )
								end
							end
						end
					end
					f141_local1[f141_local2] = f141_local7
				end
			end
		end
		local f141_local2 = {}
		for f141_local6, f141_local7 in LUI.IterateTableBySortedKeys( f141_local0, function ( f142_arg0, f142_arg1 )
			if f141_local0[f142_arg0].isOptic and f141_local0[f142_arg1].isOptic then
				return Engine.Localize( f141_local0[f142_arg0].name ) < Engine.Localize( f141_local0[f142_arg1].name )
			elseif f141_local0[f142_arg0].isOptic ~= f141_local0[f142_arg1].isOptic then
				return f141_local0[f142_arg0].isOptic
			else
				return Engine.Localize( f141_local0[f142_arg0].name ) < Engine.Localize( f141_local0[f142_arg1].name )
			end
		end, nil ) do
			if #f141_local7.items > 0 then
				table.insert( f141_local2, {
					models = {
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT,
						attachmentIndex = f141_local7.index,
						name = f141_local7.name,
						image = f141_local7.image,
						loadoutSlot = "attachment"
					},
					properties = {
						attachment = {}
					}
				} )
			end
		end
		f141_local10 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		for f141_local8, f141_local9 in LUI.IterateTableBySortedKeys( f141_local1, function ( f143_arg0, f143_arg1 )
			if LuaUtils.StartsWith( f141_local1[f143_arg0].loadoutSlot, "hero" ) or f141_local1[f143_arg0].loadoutSlot == "specialgadget" or LuaUtils.StartsWith( f141_local1[f143_arg1].loadoutSlot, "hero" ) or f141_local1[f143_arg1].loadoutSlot == "specialgadget" then
				local f143_local0 = -1
				local f143_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				local f143_local2 = -1
				local f143_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				for f143_local7, f143_local8 in ipairs( f141_local10 ) do
					local f143_local9 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f143_local7 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					local f143_local10 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f143_local7 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					if f141_local1[f143_arg0].index == f143_local9 then
						f143_local0 = f143_local7
						f143_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					elseif f141_local1[f143_arg0].index == f143_local10 then
						f143_local0 = f143_local7
						f143_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
					if f141_local1[f143_arg1].index == f143_local9 then
						f143_local2 = f143_local7
						f143_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					end
					if f141_local1[f143_arg1].index == f143_local10 then
						f143_local2 = f143_local7
						f143_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
				end
				if f143_local0 == f143_local2 then
					return f143_local1 < f143_local3
				end
				return f143_local0 < f143_local2
			elseif LUI.startswith( f141_local1[f143_arg0].loadoutSlot, "killstreak" ) or LUI.startswith( f141_local1[f143_arg1].loadoutSlot, "killstreak" ) then
				return f141_local1[f143_arg0].momentum < f141_local1[f143_arg1].momentum
			elseif f141_local1[f143_arg0].groupIndex ~= f141_local1[f143_arg1].groupIndex then
				return f141_local1[f143_arg0].groupIndex < f141_local1[f143_arg1].groupIndex
			elseif f141_local1[f143_arg0].loadoutSlot == f141_local1[f143_arg1].loadoutSlot then
				return Engine.Localize( f141_local1[f143_arg0].name ) < Engine.Localize( f141_local1[f143_arg1].name )
			else
				return Engine.Localize( f141_local1[f143_arg0].loadoutSlot ) < Engine.Localize( f141_local1[f143_arg1].loadoutSlot )
			end
		end, nil ) do
			table.insert( f141_local2, {
				models = {
					itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
					itemIndex = f141_local9.index,
					name = f141_local9.name,
					image = f141_local9.image,
					loadoutSlot = f141_local9.loadoutSlot,
					groupName = f141_local9.groupName
				},
				properties = {
					item = {
						index = f141_local9.index
					}
				}
			} )
		end
		DataSources.PregameRestrictedItems.cachedItems = f141_local2
		return f141_local2
	end
	 ),
	PregameItemVotes = f0_local7( "PregameItemVotes", function ( f144_arg0 )
		local f144_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f144_local1 = f144_local0.sessionClients
		table.sort( f144_local1, function ( f145_arg0, f145_arg1 )
			return f145_arg0.pregamePosition < f145_arg1.pregamePosition
		end )
		local f144_local2 = {}
		for f144_local15, f144_local16 in ipairs( f144_local1 ) do
			if f144_local16.voteCount > 0 then
				for f144_local13, f144_local14 in ipairs( f144_local16.votes ) do
					local f144_local10 = ""
					local f144_local11 = ""
					local f144_local12 = ""
					if f144_local14.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
						local f144_local9 = Engine.GetUnlockableInfoByIndex( f144_local14.itemIndex )
						f144_local10 = f144_local9.name
						f144_local11 = f144_local9.image
						if LuaUtils.StartsWith( f144_local9.loadoutSlot, "hero" ) or f144_local9.loadoutSlot == "specialgadget" then
							f144_local11 = f144_local9.image .. "_large"
						end
						if LuaUtils.StartsWith( f144_local9.loadoutSlot, "killstreak" ) then
							f144_local11 = f144_local9.image .. "_menu"
						end
					elseif f144_local14.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
						f144_local10 = Engine.GetAttachmentNameByIndex( f144_local14.attachmentIndex )
						f144_local11 = Engine.GetAttachmentImageByIndex( f144_local14.attachmentIndex )
					elseif f144_local14.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
						f144_local10 = Engine.GetAttachmentNameByIndex( f144_local14.attachmentIndex )
						f144_local11 = Engine.GetAttachmentImageByIndex( f144_local14.attachmentIndex )
						local f144_local9 = Engine.GetUnlockableInfoByIndex( f144_local14.itemIndex )
						f144_local12 = f144_local9.name
					elseif f144_local14.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
						f144_local12 = itemInfo.group
					else
						error( "Item vote updated with invalid vote type" )
					end
					table.insert( f144_local2, {
						models = {
							name = f144_local10,
							image = f144_local11,
							headerName = f144_local12,
							hintText = f144_local16.gamertag,
							itemType = f144_local14.itemType,
							itemIndex = f144_local14.itemIndex,
							attachmentIndex = f144_local14.attachmentIndex,
							groupIndex = f144_local14.groupIndex
						},
						properties = {
							globalVoteIndex = f144_local14.globalVoteIndex
						}
					} )
				end
			end
		end
		table.sort( f144_local2, function ( f146_arg0, f146_arg1 )
			return f146_arg0.properties.globalVoteIndex < f146_arg1.properties.globalVoteIndex
		end )
		return f144_local2
	end
	, nil, nil, function ( f147_arg0, f147_arg1, f147_arg2 )
		local f147_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if f147_arg1.pregameUpdateSubscription then
			f147_arg1:removeSubscription( f147_arg1.pregameUpdateSubscription )
		end
		f147_arg1.pregameUpdateSubscription = f147_arg1:subscribeToModel( f147_local0, function ()
			f147_arg1:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameBannedItems = f0_local7( "PregameBannedItems", function ( f149_arg0 )
		local f149_local0 = {}
		local f149_local1 = {}
		local f149_local2 = {}
		local f149_local3 = function ( f150_arg0 )
			for f150_local3, f150_local4 in pairs( f150_arg0 ) do
				if not f149_local0[f150_local4] then
					f149_local0[f150_local4] = true
				end
			end
		end
		
		local f149_local4 = function ( f151_arg0, f151_arg1 )
			for f151_local3, f151_local4 in ipairs( f151_arg1 ) do
				if not f149_local1[f151_local4] then
					f149_local1[f151_local4] = true
				end
				if not f149_local2[f151_arg0] then
					f149_local2[f151_arg0] = {}
				end
				if not f149_local2[f151_arg0][f151_local4] then
					f149_local2[f151_arg0][f151_local4] = true
				end
			end
		end
		
		local f149_local5 = CoD.CACUtility.GetFullLoadout( f149_arg0 )
		for f149_local9, f149_local10 in ipairs( f149_local5.classes ) do
			f149_local3( f149_local10.weapons )
			f149_local3( f149_local10.equipment )
			f149_local3( f149_local10.perks )
			f149_local3( f149_local10.wildcards )
			if f149_local10.weapons.primary ~= nil then
				f149_local4( f149_local10.weapons.primary, f149_local10.primaryAttachments )
			end
			if f149_local10.weapons.secondary ~= nil then
				f149_local4( f149_local10.weapons.secondary, f149_local10.secondaryAttachments )
			end
		end
		f149_local6 = {}
		f149_local7 = {}
		f149_local8 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		for f149_local19, f149_local20 in ipairs( f149_local8.sessionClients ) do
			if f149_local20.voteCount > 0 then
				for f149_local17, f149_local18 in ipairs( f149_local20.votes ) do
					if f149_local18.voteType == Enum.VoteType.VOTE_TYPE_BAN then
						if f149_local18.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
							local f149_local16 = Engine.GetUnlockableInfoByIndex( f149_local18.itemIndex )
							if not LuaUtils.StartsWith( f149_local16.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f149_local16.loadoutSlot, "killstreak" ) then
								table.insert( f149_local6, {
									name = f149_local16.name,
									image = f149_local16.image,
									hintText = f149_local20.gamertag,
									groupIndex = f149_local16.groupIndex,
									loadoutSlot = f149_local16.loadoutSlot,
									loadoutSlotIndex = f149_local16.loadoutSlotIndex,
									equipped = f149_local0 and f149_local0[f149_local18.itemIndex] == true
								} )
							end
						end
						if f149_local18.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
							table.insert( f149_local7, {
								name = Engine.GetAttachmentNameByIndex( f149_local18.attachmentIndex ),
								image = Engine.GetAttachmentImageByIndex( f149_local18.attachmentIndex ),
								isOptic = Engine.IsOpticByAttachmentIndex( f149_local18.attachmentIndex ),
								hintText = f149_local20.gamertag,
								equipped = f149_local1 and f149_local1[f149_local18.attachmentIndex] == true
							} )
						end
						if f149_local18.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
							
						end
						if f149_local18.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
							
						else
							error( "PregameBannedItems: Unknown vote item type" )
						end
					end
				end
			end
		end
		f149_local10 = function ( f152_arg0, f152_arg1 )
			if f149_local7[f152_arg0].isOptic and f149_local7[f152_arg1].isOptic then
				return Engine.Localize( f149_local7[f152_arg0].name ) < Engine.Localize( f149_local7[f152_arg1].name )
			elseif f149_local7[f152_arg0].isOptic ~= f149_local7[f152_arg1].isOptic then
				return f149_local7[f152_arg0].isOptic
			else
				return Engine.Localize( f149_local7[f152_arg0].name ) < Engine.Localize( f149_local7[f152_arg1].name )
			end
		end
		
		f149_local11 = function ( f153_arg0, f153_arg1 )
			if f149_local6[f153_arg0].groupIndex ~= f149_local6[f153_arg1].groupIndex then
				return f149_local6[f153_arg0].groupIndex < f149_local6[f153_arg1].groupIndex
			elseif f149_local6[f153_arg0].loadoutSlot == f149_local6[f153_arg1].loadoutSlot then
				return Engine.Localize( f149_local6[f153_arg0].name ) < Engine.Localize( f149_local6[f153_arg1].name )
			else
				return Engine.Localize( f149_local6[f153_arg0].loadoutSlot ) < Engine.Localize( f149_local6[f153_arg1].loadoutSlot )
			end
		end
		
		f149_local12 = {}
		f149_local19 = false
		for f149_local15, f149_local17 in LUI.IterateTableBySortedKeys( f149_local6, f149_local11, nil ) do
			if f149_local19 == false and f149_local17.loadoutSlotIndex > 50 then
				for f149_local22, f149_local23 in LUI.IterateTableBySortedKeys( f149_local7, f149_local10, nil ) do
					table.insert( f149_local12, {
						models = {
							name = f149_local23.name,
							image = f149_local23.image,
							hintText = f149_local23.hintText,
							equipped = f149_local23.equipped
						}
					} )
				end
				f149_local19 = true
			end
			table.insert( f149_local12, {
				models = {
					name = f149_local17.name,
					image = f149_local17.image,
					hintText = f149_local17.hintText,
					equipped = f149_local17.equipped
				}
			} )
		end
		if f149_local19 == false then
			for f149_local15, f149_local17 in LUI.IterateTableBySortedKeys( f149_local7, f149_local10, nil ) do
				table.insert( f149_local12, {
					models = {
						name = f149_local17.name,
						image = f149_local17.image,
						hintText = f149_local17.hintText,
						equipped = f149_local17.equipped
					}
				} )
			end
		end
		return f149_local12
	end
	, nil, nil, function ( f154_arg0, f154_arg1, f154_arg2 )
		local f154_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if f154_arg1.pregameUpdateSubscription then
			f154_arg1:removeSubscription( f154_arg1.pregameUpdateSubscription )
		end
		f154_arg1.pregameUpdateSubscription = f154_arg1:subscribeToModel( f154_local0, function ()
			f154_arg1:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameBannedStreaks = f0_local7( "PregameAllBannedStreaks", function ( f156_arg0 )
		local f156_local0 = CoD.CACUtility.GetFullLoadout( f156_arg0 )
		local f156_local1 = {}
		for f156_local5, f156_local6 in pairs( f156_local0.streaks ) do
			f156_local1[f156_local6] = true
		end
		f156_local2 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		f156_local3 = f156_local2.sessionClients
		f156_local4 = {}
		for f156_local15, f156_local16 in ipairs( f156_local3 ) do
			if f156_local16.voteCount > 0 then
				for f156_local13, f156_local14 in ipairs( f156_local16.votes ) do
					if f156_local14.voteType == Enum.VoteType.VOTE_TYPE_BAN then
						local f156_local11 = Engine.GetUnlockableInfoByIndex( f156_local14.itemIndex )
						local f156_local12 = f156_local1 and f156_local1[f156_local14.itemIndex] == true
						if LUI.startswith( f156_local11.loadoutSlot, "killstreak" ) then
							table.insert( f156_local4, {
								name = f156_local11.name,
								image = f156_local11.image .. "_menu",
								momentum = f156_local11.momentum,
								gamertag = f156_local16.gamertag,
								equipped = f156_local12
							} )
						end
					end
				end
			end
		end
		f156_local5 = function ( f157_arg0, f157_arg1 )
			return f156_local4[f157_arg0].momentum < f156_local4[f157_arg1].momentum
		end
		
		f156_local6 = {}
		for f156_local8, f156_local9 in LUI.IterateTableBySortedKeys( f156_local4, f156_local5, nil ) do
			table.insert( f156_local6, {
				models = {
					name = f156_local9.name,
					image = f156_local9.image,
					hintText = f156_local9.gamertag,
					equipped = f156_local9.equipped
				}
			} )
		end
		return f156_local6
	end
	, nil, nil, function ( f158_arg0, f158_arg1, f158_arg2 )
		local f158_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if f158_arg1.pregameUpdateSubscription then
			f158_arg1:removeSubscription( f158_arg1.pregameUpdateSubscription )
		end
		f158_arg1.pregameUpdateSubscription = f158_arg1:subscribeToModel( f158_local0, function ()
			f158_arg1:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameClientList = f0_local7( "PregameClientList", function ( f160_arg0 )
		local f160_local0 = {}
		local f160_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
		local f160_local2 = f160_local1.sessionClients
		table.sort( f160_local2, function ( f161_arg0, f161_arg1 )
			return f161_arg0.pregamePosition < f161_arg1.pregamePosition
		end )
		for f160_local7, f160_local8 in ipairs( f160_local2 ) do
			local f160_local9 = f160_local8.characterDraft.characterIndex
			local f160_local10 = f160_local8.characterDraft.loadout
			local f160_local11 = Engine.GetHeroName( Engine.CurrentSessionMode(), f160_local9 )
			local f160_local12 = Engine.GetLoadoutInfoForHero( Engine.CurrentSessionMode(), f160_local9, f160_local10 )
			local f160_local6 = ""
			if f160_local12 then
				f160_local6 = f160_local12.itemName
			end
			table.insert( f160_local0, {
				models = {
					xuid = f160_local8.xuid,
					gamertag = f160_local8.gamertag,
					clantag = "",
					rank = f160_local8.competitiveRank,
					rankIcon = f160_local8.competitiveRankIcon,
					prestige = f160_local8.prestige,
					team = f160_local8.team,
					teamString = tostring( f160_local8.team ),
					groupId = f160_local8.simpleGroupID,
					isHost = f160_local8.isHost,
					isLeader = f160_local8.isLeader,
					clientState = f160_local8.pregameState,
					position = f160_local8.pregamePosition,
					voteCount = f160_local8.voteCount,
					characterIndex = f160_local8.characterDraft.characterIndex,
					characterName = f160_local11,
					characterLoadout = f160_local8.characterDraft.loadout,
					characterLoadoutName = f160_local6
				},
				properties = {}
			} )
		end
		return f160_local0
	end
	, nil, nil, function ( f162_arg0, f162_arg1, f162_arg2 )
		local f162_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
		if f162_arg1.pregameUpdateSubscription then
			f162_arg1:removeSubscription( f162_arg1.pregameUpdateSubscription )
		end
		f162_arg1.pregameUpdateSubscription = f162_arg1:subscribeToModel( f162_local0, function ()
			f162_arg1:updateDataSource( false, false )
		end, false )
	end
	 ),
	PregameBannedContentButtons = f0_local7( "PregameBannedContentButtons", function ( f164_arg0 )
		local f164_local0 = {}
		local f164_local1 = function ( f165_arg0, f165_arg1, f165_arg2, f165_arg3, f165_arg4 )
			Engine.SendPregameEditComplete( f165_arg2 )
			GoBack( f165_arg0, f165_arg1, f165_arg2, f165_arg3, f165_arg4 )
		end
		
		if ItemRestrictionCACEditActive() then
			table.insert( f164_local0, {
				text = "MENU_EDIT_CAC_CAPS",
				id = "editCaC",
				disabled = false,
				action = OpenCAC,
				params = {
					controller = f164_arg0
				}
			} )
			table.insert( f164_local0, {
				text = "MENU_DONE_CAPS",
				id = "cancel",
				disabled = false,
				action = f164_local1,
				params = {
					controller = f164_arg0
				}
			} )
		elseif ItemRestrictionScorestreakEditActive() then
			table.insert( f164_local0, {
				text = "MENU_EDIT_SCORESTREAKS_CAPS",
				id = "editStreaks",
				disabled = false,
				action = OpenScorestreaks,
				params = {
					controller = f164_arg0
				}
			} )
			table.insert( f164_local0, {
				text = "MENU_DONE_CAPS",
				id = "cancel",
				disabled = false,
				action = f164_local1,
				params = {
					controller = f164_arg0
				}
			} )
		end
		local f164_local2 = {}
		for f164_local6, f164_local7 in ipairs( f164_local0 ) do
			table.insert( f164_local2, {
				models = {
					displayText = Engine.Localize( f164_local7.text ),
					customId = f164_local7.customId
				},
				properties = {
					disabled = f164_local7.disabled,
					action = f164_local7.action,
					actionParam = f164_local7.params
				}
			} )
		end
		return f164_local2
	end
	 ),
	SocialPlayerDetailsButtons = f0_local7( "SocialPlayerDetailsButtons", function ( f166_arg0 )
		local f166_local0 = {}
		local f166_local1 = Engine.GetModelForController( f166_arg0 )
		local f166_local2 = Engine.GetModelValue( Engine.CreateModel( f166_local1, "Social.selectedFriendXUID" ) )
		local f166_local3 = Engine.GetModelValue( Engine.CreateModel( f166_local1, "Social.selectedFriendGamertag" ) )
		local f166_local4 = Engine.CompareUInt64( f166_local2, Engine.GetXUID64( f166_arg0 ), "=" )
		local f166_local5 = Engine.GetModelValue( Engine.CreateModel( f166_local1, "Social.selectedFriendInTitle" ) )
		if f166_local2 == nil then
			return f166_local0
		end
		local f166_local6 = Engine.GetPlayerInfo( f166_arg0, f166_local2 )
		if f166_local4 == false then
			if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f166_local2 ) then
				if Engine.IsLeader( f166_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
					table.insert( f166_local0, {
						text = "MENU_PROMOTE_TO_PARTY_LEADER",
						id = "promoteToLeader",
						disabled = true,
						action = PromoteToLeader,
						params = {
							controller = f166_arg0,
							xuid = f166_local2
						},
						lastInGroup = false
					} )
					table.insert( f166_local0, {
						text = "MENU_REMOVE_FROM_PARTY",
						id = "removeFromParty",
						disabled = true,
						action = DisconnectClient,
						params = {
							controller = f166_arg0,
							xuid = f166_local2
						},
						lastInGroup = true
					} )
				end
			elseif f166_local5 == true then
				local f166_local7 = Engine.IsFriendFromXUID( f166_arg0, f166_local2 )
				if f166_local6.info.joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or f166_local7 and f166_local6.info.joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
					if f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_ON_MAP or f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_ON_MAP or f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_COOP_IN_SAFEHOUSE or f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_PLAYING_SOLO_IN_SAFEHOUSE or f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_IN_LOBBY or f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_PLAYING_GMODE_ON_MAP or f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_IN_LOBBY or f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_PLAYING_MAP_ON_ROUND or f166_local6.info.activity == Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_IN_LOBBY then
						if f166_local7 then
							table.insert( f166_local0, {
								text = "MENU_JOIN_GAME",
								id = "joinGame",
								disabled = false,
								action = SocialJoin,
								params = {
									controller = f166_arg0,
									xuid = f166_local2,
									joinType = Enum.JoinType.JOIN_TYPE_FRIEND,
									goBack = true
								},
								lastInGroup = true
							} )
						else
							table.insert( f166_local0, {
								text = "MENU_JOIN_GAME",
								id = "joinGame",
								disabled = false,
								action = SocialJoin,
								params = {
									controller = f166_arg0,
									xuid = f166_local2,
									joinType = Enum.JoinType.JOIN_TYPE_NORMAL,
									goBack = true
								},
								lastInGroup = true
							} )
						end
					elseif f166_local7 then
						table.insert( f166_local0, {
							text = "MENU_JOIN_PARTY",
							id = "joinParty",
							disabled = false,
							action = SocialJoin,
							params = {
								controller = f166_arg0,
								xuid = f166_local2,
								joinType = Enum.JoinType.JOIN_TYPE_FRIEND,
								goBack = true
							},
							lastInGroup = true
						} )
					else
						table.insert( f166_local0, {
							text = "MENU_JOIN_PARTY",
							id = "joinParty",
							disabled = false,
							action = SocialJoin,
							params = {
								controller = f166_arg0,
								xuid = f166_local2,
								joinType = Enum.JoinType.JOIN_TYPE_NORMAL,
								goBack = true
							},
							lastInGroup = true
						} )
					end
				end
			end
		end
		if f166_local6.info.hasEverPlayed == true then
			table.insert( f166_local0, {
				text = "MENU_INSPECT_PLAYER",
				id = "inspectPlayer",
				disabled = true,
				action = nil,
				params = nil,
				lastInGroup = false
			} )
		end
		table.insert( f166_local0, {
			text = "XBOXLIVE_VIEW_PROFILE",
			id = "platformProfile",
			disabled = false,
			action = OpenPlatformProfile,
			params = {
				controller = f166_arg0,
				gamertag = f166_local3,
				xuid = f166_local2
			},
			lastInGroup = true
		} )
		if f166_local4 == false then
			local f166_local7 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f166_local2 )
			local f166_local8 = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f166_local2 )
			local f166_local9 = Engine.IsPlayerMuted( f166_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f166_local2 )
			if f166_local7 == false and f166_local8 == false then
				if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
					table.insert( f166_local0, {
						text = "MENU_INVITE_GAME",
						id = "inviteToGame",
						disabled = false,
						action = LobbyInviteFriendGoBack,
						params = {
							controller = f166_arg0,
							xuid = f166_local2,
							gamertag = f166_local3
						},
						lastInGroup = false
					} )
				else
					table.insert( f166_local0, {
						text = "MENU_INVITE_TO_PARTY",
						id = "invteToParty",
						disabled = false,
						action = LobbyInviteFriendGoBack,
						params = {
							controller = f166_arg0,
							xuid = f166_local2,
							gamertag = f166_local3
						},
						lastInGroup = false
					} )
				end
			end
			if not LuaUtils.IsBetaBuild() then
				table.insert( f166_local0, {
					text = "MENU_INVITE_TO_GROUP",
					id = "inviteToGroup",
					disabled = true,
					action = nil,
					params = nil,
					lastInGroup = false
				} )
			end
			if not Engine.IsFriendFromXUID( f166_arg0, f166_local2 ) then
				table.insert( f166_local0, {
					text = "MENU_SEND_FRIEND_REQUEST",
					id = "sendFriendRequest",
					disabled = true,
					action = nil,
					params = nil,
					lastInGroup = false
				} )
			end
			table.insert( f166_local0, {
				text = "MENU_REPORT_PLAYER",
				id = "reportPlayer",
				disabled = true,
				action = nil,
				params = nil,
				lastInGroup = false
			} )
			if f166_local7 or f166_local8 then
				if f166_local9 then
					table.insert( f166_local0, {
						text = "MENU_UNMUTE_PLAYER",
						id = "unmutePlayer",
						disabled = false,
						action = UnMutePlayer,
						params = {
							controller = f166_arg0,
							xuid = f166_local2
						},
						lastInGroup = false
					} )
				else
					table.insert( f166_local0, {
						text = "MENU_MUTE_PLAYER",
						id = "mutePlayer",
						disabled = false,
						action = MutePlayer,
						params = {
							controller = f166_arg0,
							xuid = f166_local2
						},
						lastInGroup = false
					} )
				end
			end
		end
		local f166_local7 = {}
		for f166_local11, f166_local12 in ipairs( f166_local0 ) do
			table.insert( f166_local7, {
				models = {
					displayText = Engine.Localize( f166_local12.text ),
					customId = f166_local12.customId
				},
				properties = {
					disabled = f166_local12.disabled,
					action = f166_local12.action,
					actionParam = f166_local12.params,
					isLastButtonInGroup = f166_local12.lastInGroup
				}
			} )
		end
		return f166_local7
	end
	, nil, nil, function ( f167_arg0, f167_arg1, f167_arg2 )
		
	end
	, function ( f168_arg0, f168_arg1, f168_arg2 )
		if f168_arg0.SocialPlayerDetailsButtons[f168_arg1].properties.isLastButtonInGroup then
			return 9
		else
			
		end
	end
	 ),
	LobbySelectionListSelectMode = {
		prepare = function ( f169_arg0, f169_arg1, f169_arg2 )
			f169_arg1.options = {}
			local f169_local0 = {}
			CoD.LobbyMenus.AddButtons( f169_arg0, "privateClient.isHost", f169_local0, CoD.LobbyMenus.ModeSelect, CoD.LobbyMenus.ModeSelect )
			local f169_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "LobbySelectModeSelectionModel" )
			for f169_local5, f169_local6 in ipairs( f169_local0 ) do
				local f169_local7 = Engine.CreateModel( f169_local1, "buttonModel_" .. f169_local5 )
				f169_arg1.options[f169_local5] = f169_local6
				f169_arg1.options[f169_local5].model = f169_local7
				Engine.SetModelValue( Engine.CreateModel( f169_local7, "displayText" ), Engine.Localize( f169_local6.optionDisplay ) )
				Engine.SetModelValue( Engine.CreateModel( f169_local7, "customId" ), f169_local6.customId )
				f169_arg1.options[f169_local5].action = f169_local6.action
				f169_arg1.options[f169_local5].actionParam = f169_local6.param
			end
		end,
		getCount = function ( f170_arg0 )
			return #f170_arg0.options
		end,
		getItem = function ( f171_arg0, f171_arg1, f171_arg2 )
			return f171_arg1.options[f171_arg2].model
		end,
		getSpacerAfterRow = function ( f172_arg0, f172_arg1, f172_arg2 )
			if f172_arg0.options[f172_arg1] and f172_arg0.options[f172_arg1] then
				if f172_arg0.options[f172_arg1].isLastButtonInGroup then
					return 9
				else
					return 0
				end
			else
				return 7
			end
		end,
		getWidgetTypeForItem = function ( f173_arg0, f173_arg1, f173_arg2 )
			return CoD.List1ButtonLarge_PH
		end,
		getCustomPropertiesForItem = function ( f174_arg0, f174_arg1 )
			return f174_arg0.options[f174_arg1]
		end
	},
	SpinnerMessage = {
		getModel = function ( f175_arg0 )
			local f175_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "spinnerModel" )
			Engine.CreateModel( f175_local0, "spinnerMessage" )
			return f175_local0
		end
	},
	FeaturedCardsRoot = {
		getModel = function ( f176_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" )
		end
	},
	NetworkImage = {
		getModel = function ( f177_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "NetworkImage" )
		end
	},
	FeaturedCards = f0_local7( "FeaturedCards", function ( f178_arg0 )
		local f178_local0 = {}
		local f178_local1 = Engine.GetFeaturedCardsData()
		if f178_local1 ~= nil then
			local f178_local2 = f178_local1.cardsCountToShow
			if f178_local1.enabled == true and f178_local2 > 0 then
				local f178_local3 = 0
				for f178_local4 = 0, f178_local2 - 1, 1 do
					local f178_local7 = Engine.GetFeaturedCard( f178_local4 )
					if f178_local7.valid == true then
						table.insert( f178_local0, {
							models = {
								index = f178_local4,
								title = f178_local7.title,
								subTitle = f178_local7.subTitle,
								type = f178_local7.type,
								cardsCountToShow = f178_local7.cardsCountToShow,
								actionTitle = f178_local7.actionTitle,
								actionButton = f178_local7.actionButton,
								action = f178_local7.action,
								background = f178_local7.bg,
								sequence = f178_local3
							}
						} )
						f178_local3 = f178_local3 + 1
					end
				end
			end
		end
		return f178_local0
	end
	 ),
	MarketingRoot = {
		getModel = function ( f179_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "MarketingRoot" )
		end
	},
	NetworkInfo = {
		getModel = function ( f180_arg0 )
			local f180_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "NetworkInfo" )
			local f180_local1 = Engine.CreateModel( f180_local0, "natType" )
			local f180_local2 = Engine.CreateModel( f180_local0, "bandwidth" )
			local f180_local3 = Engine.CreateModel( f180_local0, "connectionType" )
			local f180_local4 = Engine.CreateModel( f180_local0, "externalIP" )
			local f180_local5 = Engine.CreateModel( f180_local0, "internalIP" )
			local f180_local6 = Engine.CreateModel( f180_local0, "region" )
			local f180_local7 = Engine.CreateModel( f180_local0, "version" )
			local f180_local8 = Engine.CreateModel( f180_local0, "connectivityInfo" )
			local f180_local9 = Engine.CreateModel( f180_local0, "supportURL" )
			Engine.SetModelValue( f180_local1, Engine.GetSystemInfo( f180_arg0, CoD.SYSINFO_NAT_TYPE ) )
			Engine.SetModelValue( f180_local2, Engine.GetSystemInfo( f180_arg0, CoD.SYSINFO_BANDWIDTH ) )
			Engine.SetModelValue( f180_local3, Engine.GetSystemInfo( f180_arg0, CoD.SYSINFO_CONNECTION_TYPE ) )
			Engine.SetModelValue( f180_local7, Engine.GetSystemInfo( f180_arg0, CoD.SYSINFO_VERSION_NUMBER ) )
			Engine.SetModelValue( f180_local8, Engine.GetSystemInfo( f180_arg0, CoD.SYSINFO_CONNECTIVITY_INFO ) )
			local f180_local10 = Dvar.loc_language:get()
			if f180_local10 ~= CoD.LANGUAGE_FULLJAPANESE and f180_local10 ~= CoD.LANGUAGE_JAPANESE then
				Engine.SetModelValue( f180_local4, Engine.GetSystemInfo( f180_arg0, CoD.SYSINFO_EXTERNAL_IP_ADDRESS ) )
				Engine.SetModelValue( f180_local5, Engine.GetSystemInfo( f180_arg0, CoD.SYSINFO_INTERNAL_IP_ADDRESS ) )
				Engine.SetModelValue( f180_local6, Engine.GetSystemInfo( f180_arg0, CoD.SYSINFO_GEOGRAPHICAL_REGION ) )
			end
			local f180_local11 = "MENU_OPTIONS_NETWORK_CUSTOMER_SERVICE_LINK"
			if Dvar.ui_supportURL ~= nil then
				f180_local11 = Dvar.ui_supportURL:get()
			end
			Engine.SetModelValue( f180_local9, f180_local11 )
			return f180_local0
		end
	},
	MOTD = {
		getModel = function ( f181_arg0 )
			local f181_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "motd" )
			local f181_local1 = Engine.CreateModel( f181_local0, "isValid" )
			local f181_local2 = Engine.CreateModel( f181_local0, "singleView" )
			local f181_local3 = Engine.CreateModel( f181_local0, "motdVersion" )
			local f181_local4 = Engine.CreateModel( f181_local0, "title" )
			local f181_local5 = Engine.CreateModel( f181_local0, "message" )
			local f181_local6 = Engine.CreateModel( f181_local0, "image" )
			local f181_local7 = Engine.CreateModel( f181_local0, "action" )
			local f181_local8 = Engine.CreateModel( f181_local0, "actionContext" )
			local f181_local9 = Engine.CreateModel( f181_local0, "actionString" )
			local f181_local10 = Engine.CreateModel( f181_local0, "bannerTitle" )
			local f181_local11 = Engine.CreateModel( f181_local0, "bannerMessage" )
			local f181_local12 = Engine.CreateModel( f181_local0, "bannerImage" )
			local f181_local13 = Engine.CreateModel( f181_local0, "bannerAction" )
			local f181_local14 = Engine.CreateModel( f181_local0, "bannerActionContext" )
			local f181_local15 = Engine.CreateModel( f181_local0, "bannerActionString" )
			local f181_local16 = Engine.GetMOTD()
			Engine.SetModelValue( f181_local1, f181_local16.isValid )
			if f181_local16.isValid then
				Engine.SetModelValue( f181_local2, f181_local16.singleView )
				Engine.SetModelValue( f181_local3, f181_local16.motdVersion )
				Engine.SetModelValue( f181_local4, f181_local16.title )
				Engine.SetModelValue( f181_local5, f181_local16.message )
				Engine.SetModelValue( f181_local6, f181_local16.image )
				Engine.SetModelValue( f181_local7, f181_local16.action )
				Engine.SetModelValue( f181_local8, f181_local16.actionContext )
				Engine.SetModelValue( f181_local9, f181_local16.actionString )
				Engine.SetModelValue( f181_local10, f181_local16.bannerTitle )
				Engine.SetModelValue( f181_local11, f181_local16.bannerMessage )
				Engine.SetModelValue( f181_local12, f181_local16.bannerImage )
				Engine.SetModelValue( f181_local13, f181_local16.bannerAction )
				Engine.SetModelValue( f181_local14, f181_local16.bannerActionContext )
				Engine.SetModelValue( f181_local15, f181_local16.bannerActionString )
			end
			return f181_local0
		end
	},
	MtxCommsMOTD = {
		getModel = function ( f182_arg0 )
			local f182_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsMOTD" )
			local f182_local1 = Engine.GetMarketingMessage( f182_arg0, "motd" )
			if f182_local1 ~= nil then
				for f182_local5, f182_local6 in next, f182_local1, nil do
					Engine.SetModelValue( Engine.CreateModel( f182_local0, f182_local5 ), f182_local6 )
				end
				if not f182_local1.messageID then
					Engine.SetModelValue( Engine.CreateModel( f182_local0, "messageID" ), 0 )
				end
			end
			return f182_local0
		end
	},
	MtxCommsRegistration = {
		getModel = function ( f183_arg0 )
			local f183_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsRegistration" )
			local f183_local1 = Engine.GetMarketingMessage( f183_arg0, "registration" )
			if f183_local1 ~= nil and not f183_local1.messageViewReported then
				for f183_local5, f183_local6 in next, f183_local1, nil do
					Engine.SetModelValue( Engine.CreateModel( f183_local0, f183_local5 ), f183_local6 )
				end
			else
				local f183_local2 = Engine.GetMarketingMessage( f183_arg0, "motd" )
				if f183_local2.hasBanner then
					Engine.SetModelValue( Engine.CreateModel( f183_local0, "content_short" ), f183_local2.bannerTitle )
					Engine.SetModelValue( Engine.CreateModel( f183_local0, "action_title" ), Engine.Localize( f183_local2.bannerActionString ) )
					Engine.SetModelValue( Engine.CreateModel( f183_local0, "action" ), f183_local2.bannerAction )
					Engine.SetModelValue( Engine.CreateModel( f183_local0, "image" ), f183_local2.bannerImage )
					Engine.SetModelValue( Engine.CreateModel( f183_local0, "locationID" ), 1 )
				end
			end
			return f183_local0
		end
	},
	WeaponGroups = f0_local7( "WeaponGroups", function ( f184_arg0 )
		local f184_local0 = {}
		local f184_local1 = function ( f185_arg0, f185_arg1 )
			for f185_local3, f185_local4 in ipairs( f185_arg0 ) do
				if CoD.UnlockablesTable and CoD.UnlockablesTable[f185_local4.weapon_category] then
					table.insert( f184_local0, {
						models = {
							tabName = f185_local4.name
						},
						properties = {
							filter = f185_local4.weapon_category,
							loadoutType = f185_arg1
						}
					} )
				end
			end
		end
		
		table.insert( f184_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		local f184_local2 = CoD.perController[f184_arg0].weaponClassGroup
		if f184_local2 == "primary" then
			f184_local1( CoD.CACUtility.PrimaryWeaponGroupNames, "primary" )
		elseif f184_local2 == "secondary" then
			f184_local1( CoD.CACUtility.SecondaryWeaponGroupNames, "secondary" )
		end
		table.insert( f184_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f184_local0
	end
	, true ),
	Unlockables = {
		prepare = function ( f186_arg0, f186_arg1, f186_arg2 )
			if not CoD.UnlockablesTable then
				CoD.UnlockablesTable = CoD.GetUnlockablesTable( f186_arg0, f186_arg2 )
			end
			f186_arg1.dataSource = CoD.UnlockablesTable
		end,
		getCount = function ( f187_arg0 )
			if not DataSources.Unlockables.currentFilter and f187_arg0.dataSource.filterList then
				return #f187_arg0.dataSource.filterList
			elseif f187_arg0.dataSource[DataSources.Unlockables.currentFilter] then
				return #f187_arg0.dataSource[DataSources.Unlockables.currentFilter]
			else
				return 0
			end
		end,
		getItem = function ( f188_arg0, f188_arg1, f188_arg2 )
			if not DataSources.Unlockables.currentFilter and f188_arg1.dataSource.filterList then
				return f188_arg1.dataSource.filterList[f188_arg2]
			elseif f188_arg1.dataSource[DataSources.Unlockables.currentFilter] then
				return f188_arg1.dataSource[DataSources.Unlockables.currentFilter][f188_arg2]
			else
				
			end
		end,
		setCurrentFilterItem = function ( f189_arg0 )
			DataSources.Unlockables.currentFilter = f189_arg0
		end,
		getCurrentFilterItem = function ()
			return DataSources.Unlockables.currentFilter
		end,
		currentFilter = nil
	},
	WeaponAttachments = f0_local7( "WeaponAttachments", function ( f191_arg0 )
		local f191_local0 = {}
		local f191_local1 = CoD.perController[f191_arg0].weaponSlot
		local f191_local2 = CoD.perController[f191_arg0].weaponCategory
		local f191_local3 = CoD.perController[f191_arg0].classModel
		local f191_local4 = Engine.GetModelValue( Engine.GetModel( f191_local3, f191_local1 .. ".itemIndex" ) )
		local f191_local5 = Engine.GetNumAttachments( f191_local4 )
		local f191_local6 = CoD.perController[f191_arg0].attachmentType
		local f191_local7 = Engine.GetItemRef( f191_local4 )
		local f191_local8 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
		local f191_local9 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
		local f191_local10 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
		local f191_local11 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
		local f191_local12 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
		local f191_local13 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
		local f191_local14 = {
			damage = 0,
			range = 0,
			fireRate = 0,
			accuracy = 0
		}
		local f191_local15 = CoD.CACUtility.GetAttachmentListForSlot( f191_local2 )
		local f191_local16 = {}
		for f191_local27, f191_local28 in ipairs( f191_local15 ) do
			local f191_local29 = Engine.GetModelValue( Engine.GetModel( f191_local3, f191_local28 .. ".itemIndex" ) )
			if f191_local28 ~= f191_local2 and CoD.CACUtility.EmptyItemIndex < f191_local29 then
				local f191_local20 = Engine.GetAttachmentRef( f191_local4, f191_local29 )
				table.insert( f191_local16, f191_local20 )
				local f191_local21 = Engine.TableLookup( nil, CoD.weaponAttributes, f191_local8, f191_local20, f191_local9, f191_local7, f191_local10 )
				local f191_local22 = Engine.TableLookup( nil, CoD.weaponAttributes, f191_local8, f191_local20, f191_local9, f191_local7, f191_local11 )
				local f191_local23 = Engine.TableLookup( nil, CoD.weaponAttributes, f191_local8, f191_local20, f191_local9, f191_local7, f191_local12 )
				local f191_local24 = Engine.TableLookup( nil, CoD.weaponAttributes, f191_local8, f191_local20, f191_local9, f191_local7, f191_local13 )
				local f191_local25 = f191_local14.damage
				local f191_local26
				if f191_local21 == "" then
					f191_local26 = 0
					if not f191_local26 then
					
					else
						f191_local14.damage = f191_local25 + f191_local26
						f191_local25 = f191_local14.range
						if f191_local22 == "" then
							f191_local26 = 0
							if not f191_local26 then
							
							else
								f191_local14.range = f191_local25 + f191_local26
								f191_local25 = f191_local14.fireRate
								if f191_local23 == "" then
									f191_local26 = 0
									if not f191_local26 then
									
									else
										f191_local14.fireRate = f191_local25 + f191_local26
										f191_local25 = f191_local14.accuracy
										if f191_local24 == "" then
											f191_local26 = 0
											if not f191_local26 then
											
											else
												f191_local14.accuracy = f191_local25 + f191_local26
											end
										end
										f191_local26 = f191_local24
									end
								end
								f191_local26 = f191_local23
							end
						end
						f191_local26 = f191_local22
					end
				end
				f191_local26 = f191_local21
			end
		end
		for f191_local17 = 1, f191_local5 - 1, 1 do
			f191_local28 = CoD.CACUtility.EmptyItemIndex
			if f191_local6 == "attachment" then
				if Engine.IsOptic( f191_local4, f191_local17 ) == false then
					f191_local28 = Engine.GetItemAttachment( f191_local4, f191_local17 )
				end
			elseif f191_local6 == "optic" and Engine.IsOptic( f191_local4, f191_local17 ) == true then
				f191_local28 = Engine.GetItemAttachment( f191_local4, f191_local17 )
			end
			if CoD.CACUtility.EmptyItemIndex < f191_local28 then
				local f191_local29 = Engine.GetAttachmentRef( f191_local4, f191_local17 )
				local f191_local20 = Engine.GetAttachmentNameByIndex( f191_local28 )
				local f191_local21 = Engine.GetAttachmentUniqueImageByIndex( f191_local4, f191_local17 )
				local f191_local22 = CoD.CACUtility.EmptyItemIndex
				local f191_local23 = CoD.CACUtility.GetLoadoutSlotForAttachmentName( f191_local3, f191_local1, f191_local29 )
				if f191_local23 then
					f191_local22 = Engine.GetModelValue( Engine.GetModel( f191_local3, f191_local23 .. "cosmeticvariant.itemIndex" ) )
					if CoD.CACUtility.EmptyItemIndex < f191_local22 then
						f191_local20 = Engine.GetModelValue( Engine.GetModel( f191_local3, f191_local23 .. "cosmeticvariant.name" ) )
						f191_local21 = Engine.GetModelValue( Engine.GetModel( f191_local3, f191_local23 .. "cosmeticvariant.image" ) )
					end
				end
				local f191_local25 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" ), f191_local4 .. ".weaponAttributes" )
				local f191_local26 = function ( f192_arg0, f192_arg1 )
					local f192_local0 = Engine.GetModelValue( Engine.GetModel( f191_local25, f192_arg0 ) )
					local f192_local1 = Engine.TableLookup( nil, CoD.weaponAttributes, f191_local8, f191_local29, f191_local9, f191_local7, f192_arg1 )
					if f192_local0 == "" then
						f192_local0 = 0
					end
					if f192_local1 == "" then
						f192_local1 = 0
					end
					local f192_local2 = false
					for f192_local6, f192_local7 in ipairs( f191_local16 ) do
						if f192_local7 == f191_local29 then
							f192_local2 = true
							break
						end
					end
					f192_local3 = f192_local0 + f191_local14[f192_arg0]
					if not f192_local2 then
						f192_local3 = f192_local3 + f192_local1
					end
					return f192_local0 .. "," .. f192_local3
				end
				
				table.insert( f191_local0, {
					models = {
						name = f191_local20,
						image = f191_local21,
						itemIndex = f191_local17,
						weaponIndex = f191_local4,
						attachmentIndex = f191_local28,
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT,
						weaponSlot = f191_local2,
						weaponIndex = f191_local4,
						description = Engine.GetAttachmentDesc( f191_local4, f191_local17 ),
						weaponAttributes = {
							damage = f191_local26( "damage", f191_local10 ),
							range = f191_local26( "range", f191_local11 ),
							fireRate = f191_local26( "fireRate", f191_local12 ),
							accuracy = f191_local26( "accuracy", f191_local13 )
						}
					},
					properties = {
						weaponIndex = f191_local4,
						attachmentTableIndex = f191_local28,
						acvIndex = f191_local22
					}
				} )
			end
		end
		return f191_local0
	end
	, true ),
	EquippedBubbleGumPack = {
		getModel = function ( f193_arg0 )
			local f193_local0 = Engine.CreateModel( Engine.GetModelForController( f193_arg0 ), "EquippedBubbleGumPack" )
			Engine.SetModelValue( Engine.CreateModel( f193_local0, "bgbPackIndex" ), Engine.GetEquippedBubbleGumPack( f193_arg0 ) )
			return f193_local0
		end
	},
	BubbleGumBuffs = {
		prepare = function ( f194_arg0, f194_arg1, f194_arg2 )
			DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( f194_arg0, Engine.GetModelForController( f194_arg0 ), Engine.GetEquippedBubbleGumPack( f194_arg0 ) )
		end,
		getCount = function ( f195_arg0 )
			return CoD.BubbleGumBuffs.NumBuffsPerPack
		end,
		getItem = function ( f196_arg0, f196_arg1, f196_arg2 )
			if f196_arg1:getParent() then
				local f196_local0 = f196_arg1:getParent()
				return f196_local0:getModel( f196_arg0, "BubbleGumBuffs." .. f196_arg2 )
			else
				return Engine.CreateModel( Engine.GetModelForController( f196_arg0 ), "BubbleGumBuffs." .. f196_arg2 )
			end
		end,
		setupBubbleGumBuffsModel = function ( f197_arg0, f197_arg1, f197_arg2 )
			local f197_local0 = Engine.CreateModel( f197_arg1, "BubbleGumBuffs" )
			for f197_local1 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
				local f197_local4 = Engine.CreateModel( f197_local0, f197_local1 + 1 )
				local f197_local5 = Engine.GetBubbleGumBuff( f197_arg0, f197_arg2, f197_local1 )
				Engine.SetModelValue( Engine.CreateModel( f197_local4, "bgbIndex" ), f197_local1 )
				Engine.SetModelValue( Engine.CreateModel( f197_local4, "itemIndex" ), f197_local5 )
			end
		end
	},
	BubbleGumPacks = {
		prepare = function ( f198_arg0, f198_arg1, f198_arg2 )
			f198_arg1.bubbleGumPacks = {}
			local f198_local0 = Engine.CreateModel( Engine.GetModelForController( f198_arg0 ), "BubbleGumPacks" )
			for f198_local1 = 0, CoD.BubbleGumBuffs.NumPacks - 1, 1 do
				local f198_local4 = Engine.CreateModel( f198_local0, f198_local1 )
				local f198_local5 = Engine.GetBubbleGumPackName( f198_arg0, f198_local1 )
				Engine.SetModelValue( Engine.CreateModel( f198_local4, "bgbPackIndex" ), f198_local1 )
				DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( f198_arg0, f198_local4, f198_local1 )
				table.insert( f198_arg1.bubbleGumPacks, f198_local4 )
			end
		end,
		getCount = function ( f199_arg0 )
			return #f199_arg0.bubbleGumPacks
		end,
		getItem = function ( f200_arg0, f200_arg1, f200_arg2 )
			return f200_arg1.bubbleGumPacks[f200_arg2]
		end
	},
	BubbleGumTabType = f0_local7( "BubbleGumTabType", function ( f201_arg0 )
		local f201_local0 = {}
		table.insert( f201_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			}
		} )
		table.insert( f201_local0, {
			models = {
				tabName = Engine.Localize( "ZMUI_BUBBLEGUM_CAPS" )
			},
			properties = {
				filter = "bubblegum"
			}
		} )
		table.insert( f201_local0, {
			models = {
				tabName = Engine.Localize( "ZMUI_MEGACHEW_CAPS" )
			},
			properties = {
				filter = "bubblegum_consumable"
			}
		} )
		table.insert( f201_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			}
		} )
		return f201_local0
	end
	 ),
	MegaChewTokens = {
		getModel = function ( f202_arg0 )
			local f202_local0 = Engine.CreateModel( Engine.GetModelForController( f202_arg0 ), "MegaChewTokens" )
			Engine.SetModelValue( Engine.CreateModel( f202_local0, "remainingTokens" ), Engine.GetBGBTokensRemaining( f202_arg0 ) )
			return f202_local0
		end
	},
	MegaChewMachines = {
		getModel = function ( f203_arg0 )
			local f203_local0 = Engine.CreateModel( Engine.GetModelForController( f203_arg0 ), "MegaChewMachines" )
			for f203_local1 = 0, 2, 1 do
				local f203_local4 = Engine.CreateModel( f203_local0, "machine" .. f203_local1 )
				local f203_local5 = f203_local1
				local f203_local6 = f203_local1 + 1
				Engine.SetModelValue( Engine.CreateModel( f203_local4, "index" ), f203_local5 )
				Engine.SetModelValue( Engine.CreateModel( f203_local4, "price" ), f203_local6 )
			end
			return f203_local0
		end
	},
	ClientDemoFiles = {
		prepare = function ( f204_arg0, f204_arg1, f204_arg2 )
			f204_arg1.clientDemoFiles = {}
			local f204_local0 = Engine.GetClientDemoFileCount()
			local f204_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "ClientDemo" )
			for f204_local2 = 1, f204_local0, 1 do
				local f204_local5 = f204_local2 - 1
				local f204_local6 = Engine.GetClientDemoFileInfo( f204_local5 )
				local f204_local7 = Engine.CreateModel( f204_local1, f204_local5 )
				Engine.SetModelValue( Engine.CreateModel( f204_local7, "index" ), f204_local5 )
				Engine.SetModelValue( Engine.CreateModel( f204_local7, "fileName" ), f204_local6.fileName )
				Engine.SetModelValue( Engine.CreateModel( f204_local7, "gameType" ), f204_local6.gameType )
				Engine.SetModelValue( Engine.CreateModel( f204_local7, "mapName" ), f204_local6.mapName )
				Engine.SetModelValue( Engine.CreateModel( f204_local7, "authorName" ), f204_local6.authorName )
				Engine.SetModelValue( Engine.CreateModel( f204_local7, "createTime" ), f204_local6.createTime )
				Engine.SetModelValue( Engine.CreateModel( f204_local7, "duration" ), f204_local6.duration )
				table.insert( f204_arg1.clientDemoFiles, f204_local7 )
			end
		end,
		getCount = function ( f205_arg0 )
			return #f205_arg0.clientDemoFiles
		end,
		getItem = function ( f206_arg0, f206_arg1, f206_arg2 )
			return f206_arg1.clientDemoFiles[f206_arg2]
		end
	},
	DemoSegments = {
		prepare = function ( f207_arg0, f207_arg1, f207_arg2 )
			f207_arg1.segments = {}
			local f207_local0 = 20
			local f207_local1, f207_local2, f207_local3, f207_local4, f207_local5 = nil
			if Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" ) == nil then
				f207_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "DemoSegments" )
				f207_local2 = Engine.CreateModel( f207_local1, "refresh" )
				Engine.SetModelValue( f207_local2, 0 )
			else
				f207_local1 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments" )
				f207_local2 = Engine.GetModel( f207_local1, "refresh" )
			end
			local f207_local6 = Engine.GetDemoSegmentCount()
			f207_local3 = GetSelectedSegmentModel()
			if f207_local3 then
				f207_local4 = Engine.GetModelValue( Engine.GetModel( f207_local3, "segmentNumber" ) )
				f207_local5 = Engine.GetDemoSegmentInformation( f207_local4 - 1, "name" )
			end
			for f207_local7 = 1, f207_local0, 1 do
				local f207_local10 = f207_local7 - 1
				local f207_local11 = Engine.CreateModel( f207_local1, f207_local10 )
				local f207_local12, f207_local13, f207_local14, f207_local15, f207_local16, f207_local17 = nil
				Engine.SetModelValue( Engine.CreateModel( f207_local11, "segmentNumber" ), f207_local7 )
				if f207_local7 <= f207_local6 then
					if f207_local4 ~= nil then
						if f207_local4 == f207_local7 then
							f207_local12 = Engine.Localize( "MENU_MOVING_SEGMENT_SELECT_NEW_SPOT", f207_local5 )
						else
							f207_local12 = Engine.Localize( "MENU_PLACE_SEGMENT_AT_TIMELINE_POSITION", f207_local5, f207_local7 )
						end
					else
						f207_local12 = Engine.GetDemoSegmentInformation( f207_local10, "name" )
					end
					if f207_local4 ~= nil then
						f207_local13 = ""
						f207_local14 = ""
						f207_local15 = ""
						f207_local16 = ""
					else
						f207_local13 = Engine.GetDemoSegmentInformation( f207_local10, "durationLocString" )
						if f207_local7 < f207_local6 then
							f207_local14 = Engine.Localize( "MENU_TRANSITION" ) .. Engine.GetDemoSegmentInformation( f207_local10, "transition" )
						else
							f207_local14 = ""
						end
						if Engine.IsDemoHighlightReelMode() then
							local f207_local18 = tonumber( Engine.GetDemoSegmentInformation( f207_local10, "score" ) )
							local f207_local19 = tonumber( Engine.GetDemoSegmentInformation( f207_local10, "stars" ) )
							f207_local15 = f207_local18
							f207_local16 = f207_local19
						end
					end
					f207_local17 = false
				else
					if f207_local4 ~= nil then
						f207_local12 = Engine.Localize( "MENU_CANNOT_PLACE_SEGMENT_IN_TIMELINE", f207_local5 )
					else
						f207_local12 = ""
					end
					f207_local13 = ""
					f207_local14 = ""
					f207_local15 = ""
					f207_local16 = ""
					f207_local17 = true
				end
				Engine.SetModelValue( Engine.CreateModel( f207_local11, "name" ), f207_local12 )
				Engine.SetModelValue( Engine.CreateModel( f207_local11, "duration" ), f207_local13 )
				Engine.SetModelValue( Engine.CreateModel( f207_local11, "transitionText" ), f207_local14 )
				Engine.SetModelValue( Engine.CreateModel( f207_local11, "stars" ), f207_local15 )
				Engine.SetModelValue( Engine.CreateModel( f207_local11, "score" ), f207_local16 )
				Engine.SetModelValue( Engine.CreateModel( f207_local11, "disabled" ), f207_local17 )
				table.insert( f207_arg1.segments, {
					model = f207_local11
				} )
			end
			f207_arg1:subscribeToModel( f207_local2, function ()
				f207_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f209_arg0 )
			return #f209_arg0.segments
		end,
		getItem = function ( f210_arg0, f210_arg1, f210_arg2 )
			return f210_arg1.segments[f210_arg2].model
		end,
		getCustomPropertiesForItem = function ( f211_arg0, f211_arg1 )
			return f211_arg0.segments[f211_arg1]
		end
	},
	PrimaryOffhandGadget = {
		getModel = function ( f212_arg0 )
			if not f212_arg0 then
				f212_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f212_arg0 ), "playerAbilities.playerGadget0" )
		end
	},
	SecondaryOffhandGadget = {
		getModel = function ( f213_arg0 )
			if not f213_arg0 then
				f213_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f213_arg0 ), "playerAbilities.playerGadget1" )
		end
	},
	SpecialOffhandGadget = {
		getModel = function ( f214_arg0 )
			if not f214_arg0 then
				f214_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f214_arg0 ), "playerAbilities.playerGadget2" )
		end
	},
	HeroWeapon = {
		getModel = function ( f215_arg0 )
			if not f215_arg0 then
				f215_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f215_arg0 ), "playerAbilities.playerGadget3" )
		end
	},
	CurrentWeapon = {
		getModel = function ( f216_arg0 )
			if not f216_arg0 then
				f216_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f216_arg0 ), "currentWeapon" )
		end
	},
	CurrentPrimaryOffhand = {
		getModel = function ( f217_arg0 )
			if not f217_arg0 then
				f217_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f217_arg0 ), "currentPrimaryOffhand" )
		end
	},
	CurrentSecondaryOffhand = {
		getModel = function ( f218_arg0 )
			if not f218_arg0 then
				f218_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f218_arg0 ), "currentSecondaryOffhand" )
		end
	},
	CurrentSpecialOffhand = {
		getModel = function ( f219_arg0 )
			if not f219_arg0 then
				f219_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f219_arg0 ), "currentSpecialOffhand" )
		end
	},
	HUDItems = {
		getModel = function ( f220_arg0 )
			if not f220_arg0 then
				f220_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f220_arg0 ), "hudItems" )
		end
	},
	InteractivePrompt = {
		getModel = function ( f221_arg0 )
			if not f221_arg0 then
				f221_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f221_arg0 ), "interactivePrompt" )
		end
	},
	InGameNotifications = {
		getModel = function ( f222_arg0 )
			if not f222_arg0 then
				f222_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f222_arg0 ), "inGameNotifications" )
		end
	},
	KillstreakReward = {
		getModel = function ( f223_arg0 )
			if not f223_arg0 then
				f223_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f223_arg0 ), "killstreakRewards" )
		end
	},
	PlayerCallout = {
		getModel = function ( f224_arg0 )
			if not f224_arg0 then
				f224_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f224_arg0 ), "playerCallout" )
		end
	},
	PlayerObituary = {
		getModel = function ( f225_arg0 )
			if not f225_arg0 then
				f225_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f225_arg0 ), "playerObituary" )
		end
	},
	PlayerAbilities = {
		getModel = function ( f226_arg0 )
			if not f226_arg0 then
				f226_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f226_arg0 ), "playerAbilities" )
		end
	},
	Perks = {
		getModel = function ( f227_arg0 )
			if not f227_arg0 then
				f227_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f227_arg0 ), "perks" )
		end
	},
	Specialties = {
		getModel = function ( f228_arg0 )
			if not f228_arg0 then
				f228_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f228_arg0 ), "specialties" )
		end
	},
	CTF = {
		prepared = false,
		prepare = function ( f229_arg0, f229_arg1, f229_arg2 )
			local f229_local0 = Engine.CreateModel( Engine.GetModelForController( f229_arg0 ), "CTF" )
			local f229_local1 = Engine.CreateModel( f229_local0, "friendlyFlagCarrier" )
			local f229_local2 = Engine.CreateModel( f229_local0, "enemyFlagCarrier" )
		end,
		getModel = function ( f230_arg0 )
			if not DataSources.CTF.prepared then
				DataSources.CTF.prepare( f230_arg0 )
			end
			if not f230_arg0 then
				f230_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f230_arg0 ), "CTF" )
		end
	},
	Ball = {
		getModel = function ( f231_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f231_arg0 ), "ballGametype" )
		end
	},
	Escort = {
		getModel = function ( f232_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f232_arg0 ), "escortGametype" )
		end
	},
	Factions = {
		prepared = false,
		factionSubscription = nil,
		prepare = function ( f233_arg0, f233_arg1, f233_arg2 )
			if not DataSources.Factions.factionSubscription then
				DataSources.Factions.factionSubscription = LUI.UIElement.new()
			end
			local f233_local0 = Engine.GetModelForController( f233_arg0 )
			local f233_local1 = Engine.CreateModel( f233_local0, "factions" )
			local f233_local2 = Engine.CreateModel( f233_local1, "playerFactionTeamEnum" )
			local f233_local3 = Engine.CreateModel( f233_local1, "playerFactionName" )
			local f233_local4 = Engine.CreateModel( f233_local1, "playerFactionDisplayName" )
			local f233_local5 = Engine.CreateModel( f233_local1, "playerFactionIcon" )
			local f233_local6 = Engine.CreateModel( f233_local1, "playerFactionColor" )
			local f233_local7 = Engine.CreateModel( f233_local1, "playerFactionFlagColor" )
			local f233_local8 = Engine.CreateModel( f233_local1, "enemyFactionTeamEnum" )
			local f233_local9 = Engine.CreateModel( f233_local1, "enemyFactionName" )
			local f233_local10 = Engine.CreateModel( f233_local1, "enemyFactionDisplayName" )
			local f233_local11 = Engine.CreateModel( f233_local1, "enemyFactionIcon" )
			local f233_local12 = Engine.CreateModel( f233_local1, "enemyFactionColor" )
			local f233_local13 = Engine.CreateModel( f233_local1, "enemyFactionFlagColor" )
			DataSources.Factions.factionSubscription:unsubscribeFromAllModels()
			DataSources.Factions.factionSubscription:subscribeToModel( f233_local2, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					Engine.SetModelValue( f233_local5, CoD.GetTeamFactionIcon( modelValue ) )
					Engine.SetModelValue( f233_local4, CoD.GetTeamNameCaps( modelValue ) )
					Engine.SetModelValue( f233_local6, CoD.GetTeamFactionColor( modelValue ) )
					local f234_local1 = string.format( "%d %d %d", ColorSet.FriendlyBlue.r * 255, ColorSet.FriendlyBlue.g * 255, ColorSet.FriendlyBlue.b * 255 )
					if CoD.IsShoutcaster( f233_arg0 ) then
						CoD.UpdateColorSet( "CodCasterFriendly", CoD.GetTeamFactionColor( modelValue ) )
						Engine.SetupCompassColors( f233_arg0 )
						f234_local1 = CoD.GetTeamFactionColor( modelValue )
					end
					Engine.SetModelValue( f233_local7, f234_local1 )
				end
			end )
			DataSources.Factions.factionSubscription:subscribeToModel( f233_local8, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					Engine.SetModelValue( f233_local11, CoD.GetTeamFactionIcon( modelValue ) )
					Engine.SetModelValue( f233_local10, CoD.GetTeamNameCaps( modelValue ) )
					Engine.SetModelValue( f233_local12, CoD.GetTeamFactionColor( modelValue ) )
					local f235_local1 = string.format( "%d %d %d", ColorSet.EnemyOrange.r * 255, ColorSet.EnemyOrange.g * 255, ColorSet.EnemyOrange.b * 255 )
					if CoD.IsShoutcaster( f233_arg0 ) then
						CoD.UpdateColorSet( "CodCasterEnemy", CoD.GetTeamFactionColor( modelValue ) )
						Engine.SetupCompassColors( f233_arg0 )
						f235_local1 = CoD.GetTeamFactionColor( modelValue )
					end
					Engine.SetModelValue( f233_local13, f235_local1 )
				end
			end )
			local f233_local14 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			local f233_local15 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
			if CoD.IsShoutcaster( f233_arg0 ) and CoD.ShoutcasterProfileVarBool( f233_arg0, "shoutcaster_flip_scorepanel" ) then
				f233_local15 = {
					name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
					icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
					color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
				}
				f233_local14 = {
					name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
					icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
					color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
				}
			end
			Engine.SetModelValue( Engine.CreateModel( f233_local1, "axisFactionDisplayName" ), f233_local15.name )
			Engine.SetModelValue( Engine.CreateModel( f233_local1, "axisFactionIcon" ), f233_local15.icon )
			Engine.SetModelValue( Engine.CreateModel( f233_local1, "axisFactionColor" ), f233_local15.color )
			Engine.SetModelValue( Engine.CreateModel( f233_local1, "alliesFactionDisplayName" ), f233_local14.name )
			Engine.SetModelValue( Engine.CreateModel( f233_local1, "alliesFactionIcon" ), f233_local14.icon )
			Engine.SetModelValue( Engine.CreateModel( f233_local1, "alliesFactionColor" ), f233_local14.color )
			if CoD.IsShoutcaster( f233_arg0 ) then
				CoD.UpdateColorSet( "CodCasterFactionAllies", f233_local14.color )
				CoD.UpdateColorSet( "CodCasterFactionAxis", f233_local15.color )
				Engine.SetupCompassColors( f233_arg0 )
			end
			local f233_local16 = Engine.GetModel( f233_local0, "team" )
			if f233_local16 then
				DataSources.Factions.factionSubscription:subscribeToModel( f233_local16, function ( model )
					DataSources.Factions.prepared = false
					DataSources.Factions.prepare( f233_arg0 )
				end, false )
			end
			local f233_local17 = Engine.GetModel( f233_local0, "CodCaster.profileSettingsUpdated" )
			if f233_local17 then
				DataSources.Factions.factionSubscription:subscribeToModel( f233_local17, function ( model )
					DataSources.Factions.prepared = false
					DataSources.Factions.prepare( f233_arg0 )
				end, false )
			end
			DataSources.Factions.prepared = true
		end,
		getModel = function ( f238_arg0 )
			if not DataSources.Factions.prepared then
				DataSources.Factions.prepare( f238_arg0 )
			end
			if not f238_arg0 then
				f238_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f238_arg0 ), "factions" )
		end
	},
	FactionList = {
		prepare = function ( f239_arg0, f239_arg1, f239_arg2 )
			f239_arg1.factions = {}
			local f239_local0 = Engine.CreateModel( Engine.GetModelForController( f239_arg0 ), "factionList" )
			for f239_local4, f239_local5 in ipairs( Engine.GetTeamPositions( f239_arg0 ) ) do
				local f239_local6 = Engine.GetFactionForTeam( f239_local4 )
				f239_arg1.factions[f239_local4] = Engine.CreateModel( f239_local0, "faction" .. f239_local4 )
				local f239_local7 = 0
				local f239_local8 = "faction_" .. f239_local6
				Engine.SetModelValue( Engine.CreateModel( f239_arg1.factions[f239_local4], "factionName" ), f239_local6 )
				Engine.SetModelValue( Engine.CreateModel( f239_arg1.factions[f239_local4], "factionIcon" ), f239_local8 )
				Engine.SetModelValue( Engine.CreateModel( f239_arg1.factions[f239_local4], "factionScore" ), f239_local7 )
			end
		end,
		getCount = function ( f240_arg0 )
			return #f240_arg0.factions
		end,
		getItem = function ( f241_arg0, f241_arg1, f241_arg2 )
			return f241_arg1.factions[f241_arg2]
		end
	},
	NetStats = {
		getModel = function ( f242_arg0 )
			return Engine.CreateModel( Engine.GetGlobalModel(), "netstats" )
		end
	},
	Groups = {
		getModel = function ( f243_arg0 )
			if not f243_arg0 then
				f243_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f243_arg0 ), "groups" )
		end
	},
	GroupsMainTabList = f0_local7( "GroupsMainTabModel", function ( f244_arg0 )
		local f244_local0 = {}
		table.insert( f244_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f244_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_MY_GROUPS_CAPS" ),
				tabWidget = "CoD.MyGroupsTab"
			},
			properties = {
				tabId = "mygroups"
			}
		} )
		table.insert( f244_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_FIND_GROUPS_CAPS" ),
				tabWidget = "CoD.FindGroupsTab"
			},
			properties = {
				tabId = "findgroups"
			}
		} )
		table.insert( f244_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f244_local0
	end
	, true ),
	GroupsMainButtonList = {
		prepare = function ( f245_arg0, f245_arg1, f245_arg2 )
			f245_arg1.buttons = {}
			local f245_local0 = {}
			f245_arg1.groups = Engine.GetGroupList( f245_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
			for f245_local1 = 1, #f245_arg1.groups, 1 do
				local f245_local4 = f245_arg1.groups[f245_local1]
				table.insert( f245_local0, {
					displayText = f245_local4.name,
					action = OpenGroupHeadquarters,
					btnType = "group",
					groupId = f245_local4.groupId,
					groupBufferType = f245_local4.bufferType,
					name = f245_local4.name,
					clanTag = f245_local4.clanTag,
					description = f245_local4.description,
					message = f245_local4.message,
					privacy = f245_local4.privacy,
					creationTimestamp = f245_local4.creationTimestamp,
					owner = f245_local4.owner,
					ownerXuid = f245_local4.ownerXuid,
					memberStatus = f245_local4.memberStatus,
					memberStatusText = f245_local4.memberStatusText,
					memberCount = f245_local4.memberCount,
					onlineCount = f245_local4.onlineCount,
					inTitleCount = f245_local4.inTitleCount,
					lbIndex = f245_local4.lbIndex,
					lbSortColumn = f245_local4.lbSortColumn,
					lbTimeFrame = f245_local4.lbTimeFrame,
					lbHardcore = f245_local4.lbHardcore,
					lbInitialized = f245_local4.lbInitialized
				} )
			end
			local f245_local2 = Engine.CreateModel( Engine.GetModelForController( f245_arg0 ), "groups" )
			f245_arg1.groupCountModel = Engine.CreateModel( f245_local2, "groupCount_self" )
			local f245_local3 = Engine.CreateModel( f245_local2, "mainButtons" )
			for f245_local7, f245_local8 in ipairs( f245_local0 ) do
				local f245_local9 = Engine.CreateModel( f245_local3, "buttonModel_" .. f245_local7 )
				table.insert( f245_arg1.buttons, {
					model = f245_local9,
					type = f245_local8.btnType,
					groupId = f245_local8.groupId,
					groupBufferType = f245_local8.groupBufferType
				} )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "displayText" ), Engine.Localize( f245_local8.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "action" ), f245_local8.action )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "type" ), f245_local8.btnType )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "groupId" ), f245_local8.groupId )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "groupBufferType" ), f245_local8.groupBufferType )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "name" ), f245_local8.name )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "clanTag" ), f245_local8.clanTag )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "description" ), f245_local8.description )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "message" ), f245_local8.message )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "privacy" ), f245_local8.privacy )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "creationTimestamp" ), f245_local8.creationTimestamp )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "owner" ), f245_local8.owner )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "ownerXuid" ), f245_local8.ownerXuid )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "memberStatus" ), f245_local8.memberStatus )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "memberStatusText" ), f245_local8.memberStatusText )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "memberCount" ), f245_local8.memberCount )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "onlineCount" ), f245_local8.onlineCount )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "inTitleCount" ), f245_local8.inTitleCount )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "lbIndex" ), f245_local8.lbIndex )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "lbSortColumn" ), f245_local8.lbSortColumn )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "lbTimeFrame" ), f245_local8.lbTimeFrame )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "lbHardcore" ), f245_local8.lbHardcore )
				Engine.SetModelValue( Engine.CreateModel( f245_local9, "lbInitialized" ), f245_local8.lbInitialized )
			end
			f245_arg1:subscribeToModel( f245_arg1.groupCountModel, function ()
				f245_arg1:updateDataSource()
			end, false )
		end,
		getCustomPropertiesForItem = function ( f247_arg0, f247_arg1 )
			return f247_arg0.buttons[f247_arg1]
		end,
		getCount = function ( f248_arg0 )
			return #f248_arg0.buttons
		end,
		getItem = function ( f249_arg0, f249_arg1, f249_arg2 )
			return f249_arg1.buttons[f249_arg2].model
		end
	},
	FindGroupsButtonList = {
		prepare = function ( f250_arg0, f250_arg1, f250_arg2 )
			f250_arg1.buttons = {}
			local f250_local0 = {}
			local f250_local1 = Engine.GetGroupList( f250_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
			local f250_local2 = Engine.GetGroupList( f250_arg0, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
			for f250_local3 = 1, #f250_local1, 1 do
				local f250_local6 = false
				for f250_local7 = 1, #f250_local2, 1 do
					if f250_local1[f250_local3].groupId == f250_local2[f250_local7].groupId then
						f250_local6 = true
						break
					end
				end
				if not f250_local6 then
					local f250_local7 = f250_local1[f250_local3]
					table.insert( f250_local0, {
						displayText = f250_local7.name,
						action = OpenGroupHeadquarters,
						btnType = "group",
						groupId = f250_local7.groupId,
						groupBufferType = f250_local7.bufferType,
						name = f250_local7.name,
						clanTag = f250_local7.clanTag,
						description = f250_local7.description,
						message = f250_local7.message,
						privacy = f250_local7.privacy,
						creationTimestamp = f250_local7.creationTimestamp,
						owner = f250_local7.owner,
						ownerXuid = f250_local7.ownerXuid,
						memberStatus = f250_local7.memberStatus,
						memberStatusText = f250_local7.memberStatusText,
						memberCount = f250_local7.memberCount,
						onlineCount = f250_local7.onlineCount,
						inTitleCount = f250_local7.inTitleCount,
						lbIndex = f250_local7.lbIndex,
						lbSortColumn = f250_local7.lbSortColumn,
						lbTimeFrame = f250_local7.lbTimeFrame,
						lbHardcore = f250_local7.lbHardcore,
						lbInitialized = f250_local7.lbInitialized
					} )
				end
			end
			local f250_local4 = Engine.CreateModel( Engine.GetModelForController( f250_arg0 ), "groups" )
			local f250_local5 = Engine.CreateModel( f250_local4, "findGroupsButtons" )
			for f250_local8, f250_local9 in ipairs( f250_local0 ) do
				local f250_local11 = Engine.CreateModel( f250_local5, "buttonModel_" .. f250_local8 )
				table.insert( f250_arg1.buttons, {
					model = f250_local11,
					type = f250_local9.btnType,
					groupId = f250_local9.groupId,
					groupBufferType = f250_local9.groupBufferType
				} )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "displayText" ), Engine.Localize( f250_local9.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "action" ), f250_local9.action )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "type" ), f250_local9.btnType )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "groupId" ), f250_local9.groupId )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "groupBufferType" ), f250_local9.groupBufferType )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "name" ), f250_local9.name )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "clanTag" ), f250_local9.clanTag )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "description" ), f250_local9.description )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "message" ), f250_local9.message )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "privacy" ), f250_local9.privacy )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "creationTimestamp" ), f250_local9.creationTimestamp )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "owner" ), f250_local9.owner )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "ownerXuid" ), f250_local9.ownerXuid )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "memberStatus" ), f250_local9.memberStatus )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "memberStatusText" ), f250_local9.memberStatusText )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "memberCount" ), f250_local9.memberCount )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "onlineCount" ), f250_local9.onlineCount )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "inTitleCount" ), f250_local9.inTitleCount )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "lbIndex" ), f250_local9.lbIndex )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "lbSortColumn" ), f250_local9.lbSortColumn )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "lbTimeFrame" ), f250_local9.lbTimeFrame )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "lbHardcore" ), f250_local9.lbHardcore )
				Engine.SetModelValue( Engine.CreateModel( f250_local11, "lbInitialized" ), f250_local9.lbInitialized )
			end
			f250_arg1.groupCountModel = Engine.CreateModel( f250_local4, "groupCount_search" )
			f250_arg1:subscribeToModel( f250_arg1.groupCountModel, function ()
				f250_arg1:updateDataSource()
			end, false )
			f250_arg1.myGroupCountModel = Engine.CreateModel( f250_local4, "groupCount_self" )
			f250_arg1:subscribeToModel( f250_arg1.myGroupCountModel, function ()
				f250_arg1:updateDataSource()
			end, false )
		end,
		getCustomPropertiesForItem = function ( f253_arg0, f253_arg1 )
			return f253_arg0.buttons[f253_arg1]
		end,
		getCount = function ( f254_arg0 )
			return #f254_arg0.buttons
		end,
		getItem = function ( f255_arg0, f255_arg1, f255_arg2 )
			return f255_arg1.buttons[f255_arg2].model
		end
	},
	GroupsHeadquartersTabList = f0_local7( "GroupsHeadquartersTabModel", function ( f256_arg0 )
		local f256_local0 = {}
		local f256_local1 = DoesHaveAdminRightsForGroup( nil, f256_arg0 )
		table.insert( f256_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		table.insert( f256_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_OVERVIEW_CAPS" ),
				tabWidget = "CoD.OverviewTab"
			},
			properties = {
				tabId = "overview"
			}
		} )
		table.insert( f256_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_ROSTER_CAPS" ),
				tabWidget = "CoD.RosterTab"
			},
			properties = {
				tabId = "roster"
			}
		} )
		table.insert( f256_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_BADGES_CAPS" ),
				tabWidget = "CoD.BadgesTab"
			},
			properties = {
				tabId = "badges"
			}
		} )
		table.insert( f256_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_LEADERBOARD_CAPS" ),
				tabWidget = "CoD.LeaderboardTab"
			},
			properties = {
				tabId = "leaderboard"
			}
		} )
		table.insert( f256_local0, {
			models = {
				tabName = Engine.Localize( "GROUPS_SHARE_CAPS" ),
				tabWidget = "CoD.ShareTab"
			},
			properties = {
				tabId = "share"
			}
		} )
		if f256_local1 then
			table.insert( f256_local0, {
				models = {
					tabName = Engine.Localize( "GROUPS_ADMIN_CAPS" ),
					tabWidget = "CoD.AdminTab"
				},
				properties = {
					tabId = "admin"
				}
			} )
		end
		table.insert( f256_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f256_local0
	end
	, true ),
	GroupHeadquartersOverviewButtonList = f0_local7( "GroupHeadquartersOverviewButtonListModel", function ( f257_arg0 )
		local f257_local0 = {}
		local f257_local1 = IsNotAGroupMember( nil, f257_arg0 )
		local f257_local2 = IsGroupOwner( nil, f257_arg0 )
		if not f257_local1 then
			table.insert( f257_local0, {
				models = {
					displayText = Engine.Localize( "GROUPS_SET_AS_PRIMARY_GROUP" ),
					action = CoD.NullFunction
				}
			} )
			table.insert( f257_local0, {
				models = {
					displayText = Engine.Localize( "GROUPS_LEAVE_GROUP" ),
					action = ProcessLeaveSelectedGroup
				}
			} )
		end
		if not f257_local2 then
			table.insert( f257_local0, {
				models = {
					displayText = Engine.Localize( "GROUPS_REPORT_GROUP" ),
					action = CoD.NullFunction
				}
			} )
		end
		return f257_local0
	end
	 ),
	GroupHeadquartersAdminButtonList = f0_local7( "GroupHeadquartersAdminButtonListModel", function ( f258_arg0 )
		local f258_local0 = {}
		table.insert( f258_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_MESSAGE" ),
				action = EditSelectedGroupMessage
			}
		} )
		table.insert( f258_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_EMBLEM" ),
				action = EditSelectedGroupEmblem
			}
		} )
		table.insert( f258_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_DESCRIPTION" ),
				action = EditSelectedGroupDescription
			}
		} )
		table.insert( f258_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_EDIT_GROUP_CLAN_TAG" ),
				action = EditSelectedGroupClanTag
			}
		} )
		table.insert( f258_local0, {
			models = {
				displayText = Engine.Localize( "GROUPS_CHANGE_GROUP_TYPE" ),
				action = CoD.NullFunction
			}
		} )
		return f258_local0
	end
	 ),
	SelectedGroup = {
		getModel = function ( f259_arg0 )
			if not f259_arg0 then
				f259_arg0 = Engine.GetPrimaryController()
			end
			return CoD.perController[f259_arg0].selectedGroup
		end
	},
	CreateGroup = {
		getModel = function ( f260_arg0 )
			if not f260_arg0 then
				f260_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f260_arg0 ), "groups" ), "createGroup" )
		end
	},
	LeaderboardMakerButtonList = {
		prepare = function ( f261_arg0, f261_arg1, f261_arg2 )
			f261_arg1.buttons = {}
			local f261_local0 = {}
			local f261_local1 = ""
			local f261_local2 = nil
			local f261_local3 = Engine.GetModelForController( f261_arg0 )
			local f261_local4 = Engine.GetModel( f261_local3, "groups.leaderboardmaker.state" )
			local f261_local5 = Engine.GetModelValue( f261_local4 )
			local f261_local6 = Engine.GetModelValue( Engine.GetModel( f261_local3, "groups.leaderboardmaker.lbIndex" ) )
			local f261_local7 = Engine.GetModelValue( Engine.GetModel( f261_local3, "groups.leaderboardmaker.lbSortColumn" ) )
			if f261_local6 ~= nil and f261_local6 > 0 then
				f261_local2 = CoD.Leaderboard_MP.GetLeaderboardCoreNameData( CoD.Leaderboard_MP.Leaderboards[f261_local6][CoD.Leaderboard_MP.CoreName] )
			end
			local f261_local8 = CoD.perController[f261_arg0].selectedGroup
			local f261_local9 = Engine.GetModelValue( Engine.GetModel( f261_local8, "lbIndex" ) )
			local f261_local10 = Engine.GetModelValue( Engine.GetModel( f261_local8, "lbSortColumn" ) )
			local f261_local11 = Engine.GetModelValue( Engine.GetModel( f261_local8, "lbTimeFrame" ) )
			f261_arg1.leaderboardMakerStateModel = f261_local4
			if f261_local5 ~= nil then
				if f261_local5 == "SelectAction" then
					f261_local1 = "GROUPS_LBMAKER_SELECT_ACTION_TITLE"
					table.insert( f261_local0, {
						model = {
							titleText = f261_local1,
							displayText = "GROUPS_EDIT_LEADERBOARD",
							action = ProcessEditGroupLeaderboard,
							hintText = Engine.Localize( "GROUPS_EDIT_LEADERBOARD_HINT_TEXT" )
						},
						properties = {
							btnId = "EditLeaderboard"
						}
					} )
					table.insert( f261_local0, {
						model = {
							titleText = f261_local1,
							displayText = "GROUPS_REMOVE_LEADERBOARD",
							action = ProcessRemoveGroupLeaderboard,
							hintText = Engine.Localize( "GROUPS_REMOVE_LEADERBOARD_HINT_TEXT" )
						},
						properties = {
							btnId = "RemoveLeaderboard"
						}
					} )
				elseif f261_local5 == "ChooseBaseLeaderboard" then
					f261_local1 = "GROUPS_LBMAKER_CHOOSE_BASE_LEADERBOARD_TITLE"
					for f261_local12 = 1, #CoD.Leaderboard_MP.LeaderboardCoreNames, 1 do
						local f261_local15 = CoD.Leaderboard_MP.LeaderboardCoreNames[f261_local12]
						local f261_local16 = false
						if f261_local9 ~= nil and f261_local12 == f261_local9 then
							f261_local16 = true
						end
						table.insert( f261_local0, {
							model = {
								titleText = f261_local1,
								displayText = f261_local15.stringRef,
								action = ProcessChooseBaseLeaderboard,
								hintText = Engine.Localize( f261_local15.lbMakerHint ),
								icon = f261_local15.icon,
								baseLeaderboard = f261_local15.stringRef
							},
							properties = {
								btnId = f261_local15.name,
								showSelectedIcon = f261_local16
							}
						} )
					end
				elseif f261_local5 == "ChooseDefaultSort" then
					f261_local1 = "GROUPS_LBMAKER_CHOOSE_DEFAULT_SORT_TITLE"
					local f261_local12 = CoD.Leaderboard_MP.Leaderboards[f261_local6][CoD.Leaderboard_MP.SortColumn]
					for f261_local13 = 1, #f261_local12, 1 do
						local f261_local16 = f261_local12[f261_local13]
						local f261_local18 = false
						if f261_local9 ~= nil and f261_local10 ~= nil and f261_local6 == f261_local9 and f261_local13 == f261_local10 then
							f261_local18 = true
						end
						for f261_local19 = 1, #CoD.Leaderboard_MP.LeaderboardSortColumns, 1 do
							local f261_local22 = CoD.Leaderboard_MP.LeaderboardSortColumns[f261_local19]
							if f261_local22.name == f261_local16 then
								table.insert( f261_local0, {
									model = {
										titleText = f261_local1,
										displayText = f261_local22.stringRef,
										action = ProcessChooseDefaultSort,
										hintText = Engine.Localize( "GROUPS_LBMAKER_DEFAULT_SORT_ORDER_HINT_TEXT", f261_local22.stringRef ),
										icon = f261_local2.icon,
										baseLeaderboard = f261_local2.stringRef,
										sortColumn = f261_local22.stringRef
									},
									properties = {
										btnId = f261_local16,
										showSelectedIcon = f261_local18
									}
								} )
							end
						end
					end
				elseif f261_local5 == "ChooseTimeFrame" then
					f261_local1 = "GROUPS_LBMAKER_CHOOSE_TIME_FRAME_TITLE"
					local f261_local12 = CoD.Leaderboard_MP.GetLeaderboardSortColumnData( CoD.Leaderboard_MP.Leaderboards[f261_local6][CoD.Leaderboard_MP.SortColumn][f261_local7] )
					local f261_local13 = CoD.Leaderboard_MP.Leaderboards[f261_local6][CoD.Leaderboard_MP.TimeFrame]
					for f261_local14 = 1, #f261_local13, 1 do
						local f261_local18 = f261_local13[f261_local14]
						for f261_local19 = 1, #CoD.Leaderboard_MP.LeaderboardTimeFrames, 1 do
							local f261_local22 = CoD.Leaderboard_MP.LeaderboardTimeFrames[f261_local19]
							if f261_local22.name == f261_local18 then
								local f261_local23 = false
								if f261_local9 ~= nil and f261_local10 ~= nil and f261_local11 ~= nil and f261_local6 == f261_local9 and f261_local7 == f261_local10 and f261_local22.value == f261_local11 then
									f261_local23 = true
								end
								table.insert( f261_local0, {
									model = {
										titleText = f261_local1,
										displayText = f261_local22.stringRef,
										action = ProcessChooseTimeFrame,
										hintText = Engine.Localize( f261_local22.lbMakerHint ),
										icon = f261_local2.icon,
										baseLeaderboard = f261_local2.stringRef,
										sortColumn = f261_local12.stringRef,
										timeFrame = f261_local22.stringRef
									},
									properties = {
										btnId = f261_local18,
										showSelectedIcon = f261_local23
									}
								} )
							end
						end
					end
				end
			end
			for f261_local17, f261_local15 in ipairs( f261_local0 ) do
				local f261_local16 = f261_local15.model
				local f261_local18 = f261_local15.properties
				local f261_local19 = Engine.CreateModel( Engine.GetModel( f261_local3, "groups.leaderboardmaker" ), "buttonModel_" .. f261_local17 )
				table.insert( f261_arg1.buttons, {
					model = f261_local19,
					properties = f261_local18
				} )
				Engine.SetModelValue( Engine.CreateModel( f261_local19, "titleText" ), Engine.Localize( f261_local16.titleText ) )
				Engine.SetModelValue( Engine.CreateModel( f261_local19, "displayText" ), Engine.Localize( f261_local16.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f261_local19, "hintText" ), f261_local16.hintText )
				Engine.SetModelValue( Engine.CreateModel( f261_local19, "action" ), f261_local16.action )
				Engine.SetModelValue( Engine.CreateModel( f261_local19, "icon" ), f261_local16.icon )
				Engine.SetModelValue( Engine.CreateModel( f261_local19, "baseLeaderboard" ), f261_local16.baseLeaderboard )
				Engine.SetModelValue( Engine.CreateModel( f261_local19, "sortColumn" ), f261_local16.sortColumn )
				Engine.SetModelValue( Engine.CreateModel( f261_local19, "timeFrame" ), f261_local16.timeFrame )
			end
			f261_arg1:subscribeToModel( f261_arg1.leaderboardMakerStateModel, function ()
				f261_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f263_arg0 )
			return #f263_arg0.buttons
		end,
		getCustomPropertiesForItem = function ( f264_arg0, f264_arg1 )
			return f264_arg0.buttons[f264_arg1].properties
		end,
		getItem = function ( f265_arg0, f265_arg1, f265_arg2 )
			return f265_arg1.buttons[f265_arg2].model
		end
	},
	LeaderboardHeader = {
		getModel = function ( f266_arg0 )
			if not f266_arg0 then
				f266_arg0 = Engine.GetPrimaryController()
			end
			local f266_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" ), "header" )
			local f266_local1 = 3
			local f266_local2 = 5
			local f266_local3 = f266_local1 - 1
			local f266_local4 = {}
			local f266_local5, f266_local6 = nil
			local f266_local7 = 1
			local f266_local8 = Engine.GetLeaderboardHeaders( f266_arg0 )
			if f266_local8 == nil then
				Engine.SetModelValue( Engine.CreateModel( f266_local0, "baseLeaderboard" ), "" )
				Engine.SetModelValue( Engine.CreateModel( f266_local0, "timeFrame" ), "" )
				return f266_local0
			end
			local f266_local9 = f266_local8.lbheaders
			if f266_local1 < tonumber( f266_local9.count ) then
				f266_local5 = f266_local9.count - f266_local1
			else
				f266_local5 = 0
			end
			local f266_local10 = f266_local2 - f266_local5
			for f266_local11 = 1, f266_local3, 1 do
				f266_local4[f266_local11] = f266_local9[f266_local7]
				f266_local7 = f266_local7 + 1
			end
			for f266_local11 = 1, f266_local2, 1 do
				if f266_local11 <= f266_local10 then
					f266_local4[f266_local11 + f266_local3] = ""
				else
					f266_local4[f266_local11 + f266_local3] = f266_local9[f266_local7]
					f266_local7 = f266_local7 + 1
				end
			end
			local f266_local11 = ""
			local f266_local12 = ""
			if HasSelectedGroup( nil, nil, {
				controller = f266_arg0
			} ) then
				local f266_local13, f266_local14, f266_local15, f266_local16, f266_local17 = Engine.GetGroupLeaderboardInfo()
				if f266_local17 == true and f266_local13 > 0 then
					local f266_local18 = CoD.Leaderboard_MP.GetLeaderboardCoreNameData( CoD.Leaderboard_MP.Leaderboards[f266_local13][CoD.Leaderboard_MP.CoreName] )
					local f266_local19 = CoD.Leaderboard_MP.GetTimeFrameDataFromEnumValue( f266_local15 )
					f266_local11 = Engine.Localize( f266_local18.stringRef )
					f266_local12 = Engine.Localize( f266_local19.stringRef )
				end
			end
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "baseLeaderboard" ), f266_local11 )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "timeFrame" ), f266_local12 )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "position" ), f266_local4[1] )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "rank" ), Engine.Localize( "MENU_LB_LEVEL" ) )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "name" ), f266_local4[2] )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "column0" ), f266_local4[3] )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "column1" ), f266_local4[4] )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "column2" ), f266_local4[5] )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "column3" ), f266_local4[6] )
			Engine.SetModelValue( Engine.CreateModel( f266_local0, "column4" ), f266_local4[7] )
			return f266_local0
		end
	},
	LeaderboardRows = {
		prepare = function ( f267_arg0, f267_arg1, f267_arg2 )
			f267_arg1.buttons = {}
			local f267_local0 = {}
			local f267_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
			local f267_local2 = Engine.CreateModel( f267_local1, "rows" )
			local f267_local3 = string.format( "%d %d %d", CoD.BOIIOrange.r * 255, CoD.BOIIOrange.g * 255, CoD.BOIIOrange.b * 255 )
			local f267_local4 = string.format( "%d %d %d", CoD.white.r * 255, CoD.white.g * 255, CoD.white.b * 255 )
			local f267_local5 = string.format( "%d %d %d", CoD.playerYellow.r * 255, CoD.playerYellow.g * 255, CoD.playerYellow.b * 255 )
			local f267_local6 = Engine.GetXUID64( f267_arg0 )
			local f267_local7 = Engine.GetLeaderboardData( f267_arg0 )
			local f267_local8 = 4
			local f267_local9 = 5
			for f267_local10 = 1, #f267_local7, 1 do
				local f267_local13 = f267_local7[f267_local10]
				local f267_local14 = f267_local9 - #f267_local13 - f267_local8
				local f267_local15 = {}
				local f267_local16 = {}
				local f267_local17 = false
				local f267_local18 = f267_local8 + 1
				local f267_local19 = f267_local4
				if f267_local6 == f267_local13.xuid then
					f267_local19 = f267_local5
				end
				for f267_local20 = 1, f267_local9, 1 do
					if f267_local20 <= f267_local14 then
						f267_local15[f267_local20] = ""
						f267_local16[f267_local20] = f267_local19
					end
					f267_local15[f267_local20] = f267_local13[f267_local18].col
					f267_local18 = f267_local18 + 1
					if not f267_local17 then
						f267_local16[f267_local20] = f267_local3
						f267_local17 = true
					else
						f267_local16[f267_local20] = f267_local19
					end
				end
				local f267_local20 = f267_local13[1].col
				if HasSelectedGroup( nil, nil, {
					controller = f267_arg0
				} ) then
					f267_local20 = f267_local10
				end
				table.insert( f267_local0, {
					model = {
						position = f267_local20,
						rankIcon = f267_local13[2].col,
						rank = f267_local13[3].col,
						name = f267_local13[4].col,
						column0 = f267_local15[1],
						column0color = f267_local16[1],
						column1 = f267_local15[2],
						column1color = f267_local16[2],
						column2 = f267_local15[3],
						column2color = f267_local16[3],
						column3 = f267_local15[4],
						column3color = f267_local16[4],
						column4 = f267_local15[5],
						column4color = f267_local16[5],
						rowColor = f267_local19
					}
				} )
			end
			for f267_local23, f267_local13 in ipairs( f267_local0 ) do
				local f267_local24 = f267_local13.model
				local f267_local14 = f267_local13.properties
				local f267_local15 = Engine.CreateModel( f267_local2, "buttonModel_" .. f267_local23 )
				table.insert( f267_arg1.buttons, {
					model = f267_local15,
					properties = f267_local14
				} )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "position" ), f267_local24.position )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "rankIcon" ), f267_local24.rankIcon )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "rank" ), f267_local24.rank )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "name" ), f267_local24.name )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column0" ), tostring( f267_local24.column0 ) )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column1" ), tostring( f267_local24.column1 ) )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column2" ), tostring( f267_local24.column2 ) )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column3" ), tostring( f267_local24.column3 ) )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column4" ), tostring( f267_local24.column4 ) )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column0color" ), f267_local24.column0color )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column1color" ), f267_local24.column1color )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column2color" ), f267_local24.column2color )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column3color" ), f267_local24.column3color )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "column4color" ), f267_local24.column4color )
				Engine.SetModelValue( Engine.CreateModel( f267_local15, "rowColor" ), f267_local24.rowColor )
			end
			f267_arg1:subscribeToModel( Engine.CreateModel( f267_local1, "isUpdating" ), function ()
				f267_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f269_arg0 )
			return #f269_arg0.buttons
		end,
		getCustomPropertiesForItem = function ( f270_arg0, f270_arg1 )
			return f270_arg0.buttons[f270_arg1]
		end,
		getItem = function ( f271_arg0, f271_arg1, f271_arg2 )
			return f271_arg1.buttons[f271_arg2].model
		end
	},
	TeamOperationSystem = {
		getModel = function ( f272_arg0 )
			if not f272_arg0 then
				f272_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f272_arg0 ), "teamOperationSystem" )
		end
	},
	RaidsPurchases = {
		prepare = function ( f273_arg0, f273_arg1, f273_arg2 )
			
		end,
		getCount = function ( f274_arg0 )
			return #DataSources.RaidsPurchases.Items
		end,
		getItem = function ( f275_arg0, f275_arg1, f275_arg2 )
			return DataSources.RaidsPurchases.Items[f275_arg2]
		end
	},
	Friends = {
		getCount = function ( f276_arg0 )
			return 10
		end,
		getItem = function ( f277_arg0, f277_arg1, f277_arg2 )
			local f277_local0 = {
				name = "Caezar",
				status = "Online",
				rank = "14",
				emblem = "menu_div_gold",
				rankIcon = "rank_com"
			}
			if f277_arg2 % 2 == 0 then
				f277_local0.name = "Bat35" .. f277_arg2
				f277_local0.emblem = "menu_div_bronze"
			end
			if f277_arg2 % 3 == 0 then
				f277_local0.name = "FakeForAll" .. f277_arg2
				f277_local0.emblem = "menu_div_silver"
				f277_local0.rankIcon = "rank_cpt"
				f277_local0.rank = 19
			end
			if f277_arg2 % 5 == 0 then
				f277_local0.name = "SuperGoat" .. f277_arg2
				f277_local0.emblem = "menu_div_bronze"
				f277_local0.rankIcon = "rank_sgt"
				f277_local0.rank = 34
			end
			if f277_arg2 % 7 == 0 then
				f277_local0.name = "SuperGoat" .. f277_arg2
				f277_local0.emblem = "menu_div_platinum"
				f277_local0.rankIcon = "rank_prestige02"
				f277_local0.rank = 50
			end
			local f277_local1 = Engine.CreateModel( Engine.GetModelForController( f277_arg0 ), "Friendz." .. f277_arg2 )
			for f277_local5, f277_local6 in pairs( f277_local0 ) do
				Engine.SetModelValue( Engine.CreateModel( f277_local1, f277_local5 ), f277_local6 )
			end
			return f277_local1
		end
	},
	FriendsMainTabList = f0_local7( "FriendsMainTabModel", function ( f278_arg0 )
		local f278_local0 = {
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
			f278_local0 = {
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
		return f278_local0
	end
	 ),
	LobbyFriends = {
		prepare = function ( f279_arg0, f279_arg1, f279_arg2 )
			local f279_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f279_arg0 ), "friends" ), "tab" ) )
			local f279_local1 = nil
			if f279_local0 == "friends" then
				f279_local1 = "unifiedListRoot"
			elseif f279_local0 == "recent" then
				f279_local1 = "rmpListRoot"
			elseif f279_local0 == "inbox" then
				f279_local1 = "inboxListRoot"
			elseif f279_local0 == "roster" then
				f279_local1 = "sgmListRoot"
			elseif f279_local0 == "grpmembers" then
				f279_local1 = "unifiedGroupMembersListRoot"
			else
				f279_local1 = "unifiedListRoot"
			end
			f279_arg1.unifiedFriendModel = Engine.GetModel( Engine.GetGlobalModel(), f279_local1 )
			f279_arg1.unifiedFriendCount = Engine.GetModel( f279_arg1.unifiedFriendModel, "count" )
			f279_arg1:unsubscribeFromAllModels()
			f279_arg1.countSubscription = f279_arg1:subscribeToModel( f279_arg1.unifiedFriendCount, function ( model )
				f279_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f281_arg0 )
			return Engine.GetModelValue( f281_arg0.unifiedFriendCount )
		end,
		getItem = function ( f282_arg0, f282_arg1, f282_arg2 )
			return Engine.GetModel( f282_arg1.unifiedFriendModel, "member" .. f282_arg2 - 1 )
		end
	},
	GameScore = {
		getModel = function ( f283_arg0 )
			if not f283_arg0 then
				f283_arg0 = Engine.GetPrimaryController()
			end
			local f283_local0 = Engine.CreateModel( Engine.GetModelForController( f283_arg0 ), "gameScore" )
			if not Engine.IsInGame() then
				local f283_local1 = Engine.GetScoreboardData( f283_arg0 )
				Engine.SetModelValue( Engine.CreateModel( f283_local0, "alliesScore" ), f283_local1.scores.TEAM_ALLIES )
				Engine.SetModelValue( Engine.CreateModel( f283_local0, "axisScore" ), f283_local1.scores.TEAM_AXIS )
			end
			return f283_local0
		end
	},
	Equipment = {
		getModel = function ( f284_arg0 )
			if not f284_arg0 then
				f284_arg0 = Engine.GetPrimaryController()
			end
			return Engine.CreateModel( Engine.GetModelForController( f284_arg0 ), "Equipment" )
		end
	},
	ClientscriptDebugMenu = {
		prepare = function ( f285_arg0, f285_arg1, f285_arg2 )
			f285_arg1.cscDebugMenuModel = f285_arg1:getModel( Engine.GetPrimaryController(), "cscDebugMenu" )
			f285_arg1.cscDebugMenuCountModel = Engine.GetModel( f285_arg1.cscDebugMenuModel, "cscDebugMenuCount" )
			f285_arg1:unsubscribeFromAllModels()
			f285_arg1:subscribeToModel( f285_arg1.cscDebugMenuCountModel, function ()
				f285_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f287_arg0 )
			return Engine.GetModelValue( f287_arg0.cscDebugMenuCountModel )
		end,
		getItem = function ( f288_arg0, f288_arg1, f288_arg2 )
			return Engine.GetModel( f288_arg1.cscDebugMenuModel, "listItem" .. f288_arg2 - 1 )
		end
	},
	CPMapsList = f0_local7( "CPMapsList", function ( f289_arg0 )
		local f289_local0 = {}
		local f289_local1 = function ( f290_arg0, f290_arg1 )
			return CoD.mapsTable[f290_arg0].unique_id < CoD.mapsTable[f290_arg1].unique_id
		end
		
		if Engine.IsCampaignModeZombies() == true then
			local f289_local2 = false
			for f289_local12, f289_local13 in LUI.IterateTableBySortedKeys( CoD.mapsTable, f289_local1, nil ) do
				if f289_local13.session_mode == Enum.eModes.MODE_CAMPAIGN and f289_local13.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES and f289_local13.dlc_pack ~= -1 then
					local f289_local6 = Engine.GetPlayerStats( f289_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
					local f289_local7 = f289_local6.allMapsUnlocked:get()
					local f289_local8 = Engine.GetDStat( f289_arg0, "PlayerStatsByMap", f289_local13.rootMapName, "hasBeenCompleted" )
					local f289_local9 = 0
					local f289_local10 = "playlist_sp_recr"
					if f289_local7 ~= 1 and f289_local8 ~= 1 then
						f289_local2 = true
					end
					if f289_local6.PlayerStatsByMap[f289_local12] and not f289_local2 then
						local f289_local11 = f289_local6.PlayerStatsByMap[f289_local12].highestStats.HIGHEST_DIFFICULTY:get() - 1
						if f289_local11 >= 0 then
							f289_local9 = 1
							f289_local10 = CoD.DIFFICULTY_ICON[f289_local11]
						end
					end
					if f289_local13.isSubLevel == false then
						table.insert( f289_local0, {
							models = {
								displayText = Engine.Localize( f289_local13.mapNameCaps ),
								Image = f289_local13.previewImage,
								mapName = f289_local13.mapName,
								mapLocation = f289_local13.mapLocation,
								mapDescription = f289_local13.mapDescription,
								bestTime = 0,
								bestScore = 0,
								completedDifficultyAlpha = f289_local9,
								completedDifficulty = f289_local10,
								classified = f289_local2
							},
							properties = {
								mapId = f289_local12,
								classified = f289_local2,
								collectiblesFound = 0,
								collectiblesTotal = 0
							}
						} )
					end
				end
			end
		else
			local f289_local2 = false
			for f289_local12, f289_local13 in LUI.IterateTableBySortedKeys( CoD.mapsTable, f289_local1, nil ) do
				if f289_local13.session_mode == Enum.eModes.MODE_CAMPAIGN and f289_local13.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT and f289_local13.dlc_pack ~= -1 then
					local f289_local6 = 0
					local f289_local7 = 0
					if f289_local13.collectibles then
						local f289_local8 = Engine.GetAssetList( f289_local13.collectibles )
						if f289_local8 ~= nil then
							f289_local6 = #f289_local8
							for f289_local9 = 0, f289_local6 - 1, 1 do
								if Engine.ClientHasCollectible( f289_arg0, f289_local12, f289_local9 ) then
									f289_local7 = f289_local7 + 1
								end
							end
						end
					end
					local f289_local8 = f289_local12
					if string.match( f289_local8, "[0-9]$" ) ~= nil then
						f289_local8 = string.sub( f289_local8, 0, string.len( f289_local8 ) - 1 )
					end
					local f289_local9 = Engine.GetPlayerStats( f289_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
					local f289_local10 = f289_local9.allMapsUnlocked:get()
					local f289_local11 = Engine.GetDStat( f289_arg0, "PlayerStatsByMap", f289_local12, "hasBeenCompleted" )
					local f289_local14 = 0
					local f289_local15 = "playlist_sp_recr"
					if f289_local10 ~= 1 and f289_local11 ~= 1 then
						f289_local2 = true
					end
					if f289_local9.PlayerStatsByMap[f289_local12] and not f289_local2 then
						local f289_local16 = f289_local9.PlayerStatsByMap[f289_local12].highestStats.HIGHEST_DIFFICULTY:get() - 1
						if f289_local16 >= 0 then
							f289_local14 = 1
							f289_local15 = CoD.DIFFICULTY_ICON[f289_local16]
						end
					end
					if f289_local13.isSubLevel == false then
						table.insert( f289_local0, {
							models = {
								displayText = Engine.Localize( f289_local13.mapNameCaps ),
								Image = f289_local13.previewImage,
								mapName = f289_local13.mapName,
								mapLocation = f289_local13.mapLocation,
								mapDescription = f289_local13.mapDescription,
								bestTime = 0,
								bestScore = 0,
								completedDifficultyAlpha = f289_local14,
								completedDifficulty = f289_local15,
								classified = f289_local2
							},
							properties = {
								mapId = f289_local12,
								classified = f289_local2,
								collectiblesFound = f289_local7,
								collectiblesTotal = f289_local6
							}
						} )
					end
				end
			end
		end
		return f289_local0
	end
	 ),
	ZMMapsList = f0_local7( "ZMMapsList", function ( f291_arg0 )
		local f291_local0 = {}
		for f291_local4, f291_local5 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f292_arg0, f292_arg1 )
			return CoD.mapsTable[f292_arg0].unique_id < CoD.mapsTable[f292_arg1].unique_id
		end, nil ) do
			if f291_local5.session_mode == Enum.eModes.MODE_ZOMBIES and f291_local5.dlc_pack ~= -1 then
				table.insert( f291_local0, {
					models = {
						displayText = Engine.Localize( f291_local5.mapNameCaps ),
						Image = f291_local5.previewImage,
						mapName = f291_local5.mapName,
						mapLocation = f291_local5.mapLocation,
						mapDescription = f291_local5.mapDescription,
						bestTime = 0,
						bestScore = 0
					},
					properties = {
						mapId = f291_local4
					}
				} )
			end
		end
		return f291_local0
	end
	 ),
	CPPublicGameSelectionList = f0_local7( "CPPublicGameSelectionList", function ( f293_arg0 )
		local f293_local0 = {}
		table.insert( f293_local0, {
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
		local f293_local1 = CoD.mapsTable.cp_mi_cairo_ramses
		if f293_local1 then
			table.insert( f293_local0, {
				models = {
					displayText = "MENU_PLAY_CURRENT_MISSION_CAPS",
					Image = f293_local1.previewImage,
					mapName = f293_local1.mapName,
					mapLocation = f293_local1.mapLocation,
					mapDescription = f293_local1.mapDescription,
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
		table.insert( f293_local0, {
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
		return f293_local0
	end
	 ),
	CampaignSettings = {
		getModel = function ( f294_arg0 )
			local f294_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
			Engine.SetModelValue( Engine.CreateModel( f294_local0, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( f294_arg0, "g_gameskill" )] ) )
			Engine.SetModelValue( Engine.CreateModel( f294_local0, "difficultyIcon" ), CoD.DIFFICULTY_ICON[Engine.GetProfileVarInt( f294_arg0, "g_gameskill" )] )
			if Engine.GetModelValue( Engine.CreateModel( f294_local0, "selectedMap" ) ) == nil then
				Engine.SetModelValue( Engine.CreateModel( f294_local0, "selectedMap" ), "cp_mi_eth_prologue" )
			end
			return f294_local0
		end
	},
	ZMSettings = {
		getModel = function ( f295_arg0 )
			return Engine.CreateModel( Engine.GetGlobalModel(), "ZMSettings" )
		end
	},
	CampaignMissionList = {
		prepare = function ( f296_arg0, f296_arg1, f296_arg2 )
			f296_arg1.missionList = {}
			local f296_local0 = Engine.TableLookup( f296_arg0, CoD.protoMapsTable, 0, "mapCount", 1 )
			local f296_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "MissionLevels" )
			for f296_local2 = 1, f296_local0, 1 do
				local f296_local5 = f296_local2 - 1 .. ""
				local f296_local6 = Engine.TableLookup( f296_arg0, CoD.protoMapsTable, 3, f296_local5, 0 )
				local f296_local7 = Engine.TableLookup( f296_arg0, CoD.protoMapsTable, 3, f296_local5, 1 )
				local f296_local8 = Engine.TableLookup( f296_arg0, CoD.protoMapsTable, 3, f296_local5, 2 )
				local f296_local9 = Engine.TableLookup( f296_arg0, CoD.protoMapsTable, 3, f296_local5, 4 )
				local f296_local10 = Engine.CreateModel( f296_local1, f296_local5 )
				Engine.SetModelValue( Engine.CreateModel( f296_local10, "devName" ), f296_local6 .. "" )
				Engine.SetModelValue( Engine.CreateModel( f296_local10, "locName" ), f296_local7 .. "" )
				Engine.SetModelValue( Engine.CreateModel( f296_local10, "imagename" ), f296_local8 .. "" )
				Engine.SetModelValue( Engine.CreateModel( f296_local10, "desc" ), f296_local9 .. "" )
				table.insert( f296_arg1.missionList, f296_local10 )
			end
		end,
		getCount = function ( f297_arg0 )
			return #f297_arg0.missionList
		end,
		getItem = function ( f298_arg0, f298_arg1, f298_arg2 )
			return f298_arg1.missionList[f298_arg2]
		end
	},
	SideMissionSelectList = {
		prepare = function ( f299_arg0, f299_arg1, f299_arg2 )
			f299_arg1.sideMissionList = {}
			local f299_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SideMissions" )
			for f299_local4, f299_local5 in pairs( Engine.GetSideMissionList() ) do
				local f299_local6 = Engine.CreateModel( f299_local0, f299_local4 )
				Engine.SetModelValue( Engine.CreateModel( f299_local6, "missionName" ), Engine.Localize( f299_local5.displayNameRef ) )
				Engine.SetModelValue( Engine.CreateModel( f299_local6, "missionTypeInternal" ), "coop" )
				Engine.SetModelValue( Engine.CreateModel( f299_local6, "missionTypeDisplay" ), "COOP" )
				Engine.SetModelValue( Engine.CreateModel( f299_local6, "desc" ), Engine.Localize( f299_local5.descriptionRef ) )
				Engine.SetModelValue( Engine.CreateModel( f299_local6, "mapName" ), f299_local5.name )
				Engine.SetModelValue( Engine.CreateModel( f299_local6, "missionIndex" ), f299_local5.id )
				Engine.SetModelValue( Engine.CreateModel( f299_local6, "lighting" ), 0 )
				table.insert( f299_arg1.sideMissionList, f299_local6 )
			end
		end,
		getCount = function ( f300_arg0 )
			return #f300_arg0.sideMissionList
		end,
		getItem = function ( f301_arg0, f301_arg1, f301_arg2 )
			return f301_arg1.sideMissionList[f301_arg2]
		end
	},
	LocalServer = {
		prepare = function ( f302_arg0, f302_arg1, f302_arg2 )
			f302_arg1.baseModel = Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" )
			f302_arg1.countModel = Engine.GetModel( f302_arg1.baseModel, "count" )
			if f302_arg1.countSubscription then
				f302_arg1:removeSubscription( f302_arg1.countSubscription )
			end
			f302_arg1.countSubscription = f302_arg1:subscribeToModel( f302_arg1.countModel, function ()
				f0_local9( f302_arg0, f302_arg1 )
			end, false )
		end,
		getCount = function ( f304_arg0 )
			return Engine.GetModelValue( f304_arg0.countModel )
		end,
		getItem = function ( f305_arg0, f305_arg1, f305_arg2 )
			return Engine.GetModel( f305_arg1.baseModel, "server" .. f305_arg2 - 1 )
		end
	},
	LocalServerPlayer = {
		prepare = function ( f306_arg0, f306_arg1, f306_arg2 )
			f306_arg1.playerList = {}
			local f306_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" )
			f306_arg1.selectedServerModel = Engine.CreateModel( f306_local0, "selectedServer" )
			local f306_local1 = Engine.GetModelValue( f306_arg1.selectedServerModel )
			if f306_local1 ~= nil then
				f306_arg1.playerList = Engine.LobbyServerListGetClientList( f306_local1 )
				if f306_arg1.playerList ~= nil then
					for f306_local5, f306_local6 in pairs( f306_arg1.playerList ) do
						local f306_local7 = Engine.CreateModel( f306_local0, "playerModel_" .. f306_local5 )
						f306_arg1.playerList[f306_local5].model = f306_local7
						Engine.SetModelValue( Engine.CreateModel( f306_local7, "xuid" ), f306_local6.xuid )
						Engine.SetModelValue( Engine.CreateModel( f306_local7, "gamertag" ), f306_local6.gamertag )
						Engine.SetModelValue( Engine.CreateModel( f306_local7, "isLeader" ), f306_local6.isLeader )
					end
				else
					f306_arg1.playerList = {}
				end
			end
		end,
		getCustomPropertiesForItem = function ( f307_arg0, f307_arg1 )
			return f307_arg0.playerList[f307_arg1]
		end,
		getCount = function ( f308_arg0 )
			return #f308_arg0.playerList
		end,
		getItem = function ( f309_arg0, f309_arg1, f309_arg2 )
			return f309_arg1.playerList[f309_arg2].model
		end
	},
	XPProgressionBar = {
		getModel = function ( f310_arg0 )
			if not f310_arg0 then
				f310_arg0 = Engine.GetPrimaryController()
			end
			local f310_local0 = {
				currentStats = CoD.GetPlayerStats( f310_arg0 ),
				currentRank = f310_local0.currentStats.PlayerStatsList.RANK.StatValue:get(),
				displayLevelForCurrRank = Engine.TableLookup( f310_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f310_local0.currentRank, CoD.XPBar.RankDisplayLevelCol ),
				currPrestige = f310_local0.currentStats.PlayerStatsList.PLEVEL.StatValue:get(),
				currRankIconMaterialName = Engine.TableLookup( f310_arg0, CoD.rankIconTable, CoD.XPBar.RankIdCol, f310_local0.currentRank, f310_local0.currPrestige + 1 ),
				nextRank = f310_local0.currentRank + 1,
				displayLevelForNextRank = tonumber( f310_local0.displayLevelForCurrRank ) + 1,
				nextRankIconMaterialName = Engine.TableLookup( f310_arg0, CoD.rankIconTable, CoD.XPBar.RankIdCol, f310_local0.nextRank, f310_local0.currPrestige + 1 ),
				currRankXP = f310_local0.currentStats.PlayerStatsList.RANKXP.StatValue:get(),
				minXPForCurrRank = tonumber( Engine.TableLookup( f310_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f310_local0.currentRank, CoD.XPBar.RankTableColMinXP ) ),
				maxXPForCurrRank = tonumber( Engine.TableLookup( f310_arg0, CoD.rankTable, CoD.XPBar.RankIdCol, f310_local0.currentRank, CoD.XPBar.RankTableColMaxXP ) ),
				prestigeNext = CoD.PrestigeNext( f310_arg0 ),
				xpToNextRank = f310_local0.maxXPForCurrRank - f310_local0.currRankXP,
				relativeRankXP = f310_local0.currRankXP - f310_local0.minXPForCurrRank,
				progressPct = f310_local0.relativeRankXP / (f310_local0.maxXPForCurrRank - f310_local0.minXPForCurrRank)
			}
			local f310_local1 = Engine.CreateModel( Engine.GetModelForController( f310_arg0 ), "XPProgressionBar" )
			Engine.SetModelValue( Engine.CreateModel( f310_local1, "currentRank" ), f310_local0.displayLevelForCurrRank )
			Engine.SetModelValue( Engine.CreateModel( f310_local1, "currentRankIcon" ), f310_local0.currRankIconMaterialName )
			Engine.SetModelValue( Engine.CreateModel( f310_local1, "nextRank" ), f310_local0.displayLevelForNextRank )
			Engine.SetModelValue( Engine.CreateModel( f310_local1, "nextRankIcon" ), f310_local0.nextRankIconMaterialName )
			Engine.SetModelValue( Engine.CreateModel( f310_local1, "currentXP" ), f310_local0.currRankXP )
			Engine.SetModelValue( Engine.CreateModel( f310_local1, "xpToNextRank" ), f310_local0.xpToNextRank )
			Engine.SetModelValue( Engine.CreateModel( f310_local1, "progress" ), f310_local0.progressPct )
			return f310_local1
		end
	},
	GadgetModList = {
		prepare = function ( f311_arg0, f311_arg1, f311_arg2 )
			
		end,
		getCount = function ( f312_arg0 )
			if f312_arg0.baseModel then
				local f312_local0 = Engine.GetModel( f312_arg0.baseModel, "gadgetAttachments.count" )
				if f312_local0 then
					return Engine.GetModelValue( f312_local0 )
				end
			end
			return 0
		end,
		getItem = function ( f313_arg0, f313_arg1, f313_arg2 )
			if f313_arg1.baseModel then
				local f313_local0 = Engine.GetModel( f313_arg1.baseModel, "gadgetAttachments." .. f313_arg2 )
				if f313_local0 then
					return f313_local0
				end
			end
			return nil
		end
	},
	Rewards = {
		prepare = function ( f314_arg0, f314_arg1, f314_arg2 )
			f314_arg1.rewardsList = {}
			local f314_local0 = Engine.CreateModel( Engine.GetModelForController( f314_arg0 ), "Rewards" )
			local f314_local1 = CoD.GetPlayerStats( f314_arg0 )
			if not f314_local1 then
				return 
			end
			f314_local1 = f314_local1.AfterActionReportStats
			local f314_local2 = -1
			local f314_local3 = Engine.GetSelfGamertag( f314_arg0 )
			for f314_local4 = 0, 3, 1 do
				if f314_local1.playerStats[f314_local4].name:get() == f314_local3 then
					f314_local2 = f314_local4
				end
			end
			if f314_local2 == -1 then
				return 
			end
			local f314_local4 = f314_local1.playerStats[f314_local2].curRank:get()
			local f314_local5 = f314_local1.playerStats[f314_local2].prvRank:get()
			local f314_local6 = {}
			local f314_local7 = 0
			if f314_local5 < f314_local4 then
				f314_local6[f314_local7] = {}
				f314_local6[f314_local7].itemName = "Promotion"
				f314_local6[f314_local7].itemImage = Engine.GetRankIcon( f314_local4 ) .. "_lrg"
				f314_local6[f314_local7].itemDesc = "Congratulations, you have been promoted!"
				f314_local6[f314_local7].itemDesc2 = ""
				f314_local7 = f314_local7 + 1
				f314_local6[f314_local7] = {}
				f314_local6[f314_local7].itemName = "Tech Spec - " .. tostring( f314_local4 - f314_local5 ) .. "X"
				f314_local6[f314_local7].itemImage = "t7_menu_tech_spec_token"
				f314_local6[f314_local7].itemDesc = "Unlock the weapon or gadget of your choice with this Tech spec."
				f314_local6[f314_local7].itemDesc2 = "Promotion award for reaching level " .. tostring( f314_local4 + 1 ) .. "."
				f314_local7 = f314_local7 + 1
				local f314_local8 = Engine.TableFindRows( CoD.statsTable, 10, tostring( f314_local4 + 1 ) )
				if f314_local8 ~= nil then
					local f314_local9 = 6
					local f314_local10 = 3
					local f314_local11 = f314_local8[1]
					local f314_local12 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( CoD.statsTable, f314_local11, f314_local10 ) )
					local f314_local13 = Engine.TableLookupGetColumnValueForRow( CoD.statsTable, f314_local11, f314_local9 )
					f314_local6[f314_local7] = {}
					f314_local6[f314_local7].itemName = f314_local12 .. " Blueprint"
					f314_local6[f314_local7].itemImage = f314_local13 .. "_big"
					f314_local6[f314_local7].itemDesc = "This weapon is now available for unlock the Armory."
					f314_local6[f314_local7].itemDesc2 = "Promotion award for reaching level " .. tostring( f314_local4 ) .. "."
					f314_local7 = f314_local7 + 1
				end
			end
			if f314_local1.matchWon:get() ~= 0 then
				f314_local6[f314_local7] = {}
				f314_local6[f314_local7].itemName = "Mod Spec"
				f314_local6[f314_local7].itemImage = "t7_menu_mod_spec_token"
				f314_local6[f314_local7].itemDesc = "Upgrade a weapon or gadget of your choice with this Mod Spec."
				f314_local6[f314_local7].itemDesc2 = "Awarded for completing your Mission."
				f314_local7 = f314_local7 + 1
				Engine.SetModelValue( Engine.CreateModel( f314_local0, "matchResult" ), Engine.Localize( "MENU_MISSION_SUCCESS_CAPS" ) )
			else
				Engine.SetModelValue( Engine.CreateModel( f314_local0, "matchResult" ), Engine.Localize( "MENU_MISSION_FAILED" ) )
			end
			local f314_local14 = #f314_local6
			for f314_local8 = 0, #f314_local6, 1 do
				local f314_local12 = f314_local6[f314_local8]
				if f314_local12 ~= nil then
					local f314_local13 = f314_local12.itemName .. ""
					local f314_local15 = f314_local12.itemImage .. ""
					local f314_local16 = f314_local12.itemDesc .. ""
					local f314_local17 = f314_local12.itemDesc2 .. ""
					local f314_local18 = Engine.CreateModel( f314_local0, f314_local8 )
					Engine.SetModelValue( Engine.CreateModel( f314_local18, "rewardName" ), f314_local13 )
					Engine.SetModelValue( Engine.CreateModel( f314_local18, "rewardImage" ), f314_local15 )
					Engine.SetModelValue( Engine.CreateModel( f314_local18, "rewardDesc1" ), f314_local16 )
					Engine.SetModelValue( Engine.CreateModel( f314_local18, "rewardDesc2" ), f314_local17 )
					table.insert( f314_arg1.rewardsList, f314_local18 )
				end
			end
		end,
		getCount = function ( f315_arg0 )
			return #f315_arg0.rewardsList
		end,
		getItem = function ( f316_arg0, f316_arg1, f316_arg2 )
			return f316_arg1.rewardsList[f316_arg2]
		end
	},
	AARStats = {
		prepare = function ( f317_arg0, f317_arg1, f317_arg2 )
			f317_arg1.AARStatsList = {}
			local f317_local0 = Engine.CreateModel( Engine.GetModelForController( f317_arg0 ), "AARStats" )
			local f317_local1 = CoD.GetPlayerStats( f317_arg0 )
			f317_local1 = f317_local1.AfterActionReportStats
			local f317_local2 = {}
			for f317_local3 = 0, Dvar.com_maxclients:get() - 1, 1 do
				if f317_local1.playerStats[f317_local3].isActive:get() == 1 then
					f317_local2[f317_local3] = {}
					f317_local2[f317_local3].name = f317_local1.playerStats[f317_local3].name:get()
					f317_local2[f317_local3].rank = f317_local1.playerStats[f317_local3].curRank:get() + 1
					f317_local2[f317_local3].rankIcon = Engine.GetRankIcon( f317_local1.playerStats[f317_local3].curRank:get() )
					f317_local2[f317_local3].kills = f317_local1.playerStats[f317_local3].kills:get()
					f317_local2[f317_local3].assists = f317_local1.playerStats[f317_local3].assists:get()
					f317_local2[f317_local3].medalName1 = ""
					f317_local2[f317_local3].medalImage1 = ""
					f317_local2[f317_local3].medalName2 = ""
					f317_local2[f317_local3].medalImage2 = ""
					f317_local2[f317_local3].medalName3 = ""
					f317_local2[f317_local3].medalImage3 = ""
					if f317_local1.playerStats[f317_local3].medals[0]:get() == f317_local3 then
						f317_local2[f317_local3].medalName1 = "Kill Master"
						f317_local2[f317_local3].medalImage1 = "hud_medals_default"
					end
					if f317_local1.playerStats[f317_local3].medals[1]:get() == f317_local3 then
						f317_local2[f317_local3].medalName2 = "Assist Master"
						f317_local2[f317_local3].medalImage2 = "hud_medals_revenge"
					end
					if f317_local1.playerStats[f317_local3].medals[2]:get() == f317_local3 then
						f317_local2[f317_local3].medalName3 = "Revive Master"
						f317_local2[f317_local3].medalImage3 = "hud_medals_afterlife"
					end
				end
			end
			for f317_local6, f317_local7 in pairs( f317_local2 ) do
				local f317_local8 = f317_local7.name .. ""
				local f317_local9 = f317_local7.rank .. ""
				local f317_local10 = f317_local7.rankIcon .. ""
				local f317_local11 = f317_local7.kills .. ""
				local f317_local12 = f317_local7.assists .. ""
				local f317_local13 = f317_local7.medalName1 .. ""
				local f317_local14 = f317_local7.medalImage1 .. ""
				local f317_local15 = f317_local7.medalName2 .. ""
				local f317_local16 = f317_local7.medalImage2 .. ""
				local f317_local17 = f317_local7.medalName3 .. ""
				local f317_local18 = f317_local7.medalImage3 .. ""
				local f317_local19 = Engine.CreateModel( f317_local0, f317_local6 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "playerName" ), f317_local8 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "playerRank" ), f317_local9 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "playerRankIcon" ), f317_local10 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "playerKills" ), f317_local11 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "playerAssists" ), f317_local12 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "medalName1" ), f317_local13 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "medalImage1" ), f317_local14 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "medalName2" ), f317_local15 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "medalImage2" ), f317_local16 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "medalName3" ), f317_local17 )
				Engine.SetModelValue( Engine.CreateModel( f317_local19, "medalImage3" ), f317_local18 )
				table.insert( f317_arg1.AARStatsList, f317_local19 )
			end
		end,
		getCount = function ( f318_arg0 )
			return #f318_arg0.AARStatsList
		end,
		getItem = function ( f319_arg0, f319_arg1, f319_arg2 )
			return f319_arg1.AARStatsList[f319_arg2]
		end
	},
	AARMedalsList = {
		prepare = function ( f320_arg0, f320_arg1, f320_arg2 )
			local f320_local0 = Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, Engine.GetCurrentGameType() .. " XP" )
			local f320_local1 = Engine.GetRecentMedals( f320_arg0, f320_local0 )
			f320_arg1.count = 0
			if f320_local1 and #f320_local1 > 0 then
				local f320_local2 = Engine.CreateModel( Engine.GetModelForController( f320_arg0 ), "aarMedalsList" )
				table.sort( f320_local1, CoD.AARUtility.SortMedals )
				for f320_local8, f320_local9 in ipairs( f320_local1 ) do
					local f320_local10 = Engine.CreateModel( f320_local2, f320_local8 .. "" )
					local f320_local11 = f320_local9.value
					local f320_local12 = f320_local9.row
					local f320_local7 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, f320_local12, f320_local0 ) )
					Engine.SetModelValue( Engine.CreateModel( f320_local10, "medalIndex" ), f320_local12 )
					Engine.SetModelValue( Engine.CreateModel( f320_local10, "medalTimesObtained" ), f320_local11 )
					local f320_local6 = 1
					local f320_local13 = Engine.GetModel( Engine.GetModelForController( f320_arg0 ), "aarStats.xpScale" )
					if f320_local13 then
						f320_local6 = Engine.GetModelValue( f320_local13 )
					end
					f320_local7 = f320_local7 * f320_local6
					if f320_local11 > 1 then
						Engine.SetModelValue( Engine.CreateModel( f320_local10, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f320_local7 * tonumber( f320_local11 ) ) )
					else
						Engine.SetModelValue( Engine.CreateModel( f320_local10, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f320_local7 ) )
					end
				end
				if f320_local1 and #f320_local1 > 0 then
					f320_arg1.count = #f320_local1
				end
			end
		end,
		getCount = function ( f321_arg0 )
			return f321_arg0.count
		end,
		getItem = function ( f322_arg0, f322_arg1, f322_arg2 )
			return Engine.GetModel( Engine.GetModelForController( f322_arg0 ), "aarMedalsList" .. "." .. f322_arg2 )
		end
	},
	SubobjectivesList = {
		prepare = function ( f323_arg0, f323_arg1, f323_arg2 )
			f323_arg1.createWidgetFromDataSource = function ( f324_arg0, f324_arg1, f324_arg2 )
				return LUI.GridLayout.createWidgetFromDataSource( f324_arg0, f324_arg1, f324_arg2 )
			end
			
			f323_arg1.updateLayout = function ( f325_arg0, f325_arg1 )
				LUI.GridLayout.updateLayout( f325_arg0, f325_arg1 )
				f325_arg0:dispatchEventToParent( "child_size_updated" )
			end
			
		end,
		getCount = function ( f326_arg0 )
			if not f326_arg0.subobjectiveListModel then
				return 0
			else
				return DataSources.SubobjectivesList.getCountFromModel( f326_arg0.subobjectiveListModel )
			end
		end,
		getItem = function ( f327_arg0, f327_arg1, f327_arg2 )
			if not f327_arg1.subobjectiveListModel then
				return nil
			else
				return Engine.GetModel( f327_arg1.subobjectiveListModel, f327_arg2 )
			end
		end,
		getCountFromModel = function ( f328_arg0 )
			local f328_local0 = Engine.GetModel( f328_arg0, "count" )
			if f328_local0 then
				return Engine.GetModelValue( f328_local0 )
			else
				return 0
			end
		end,
		addSubObjective = function ( f329_arg0, f329_arg1, f329_arg2 )
			local f329_local0 = DataSources.SubobjectivesList.getCountFromModel( f329_arg0 ) + 1
			local f329_local1 = Engine.GetModel( f329_arg0, "count" )
			if f329_local1 then
				Engine.SetModelValue( f329_local1, f329_local0 )
			end
			local f329_local2 = Engine.CreateModel( f329_arg0, f329_local0 )
			Engine.SetModelValue( Engine.CreateModel( f329_local2, "text" ), f329_arg1 )
			Engine.SetModelValue( Engine.CreateModel( f329_local2, "status" ), f329_arg2 )
		end
	},
	ObjectivesList = {
		prepare = function ( f330_arg0, f330_arg1, f330_arg2 )
			f330_arg1:registerEventHandler( "child_size_updated", function ( element, event )
				element:updateLayout( 0 )
				return true
			end )
			f330_arg1.createWidgetFromDataSource = function ( f332_arg0, f332_arg1, f332_arg2 )
				local f332_local0 = LUI.GridLayout.createWidgetFromDataSource( f332_arg0, f332_arg1, f332_arg2 )
				f332_local0.internal.subobjectivesList.subobjectiveListModel = Engine.GetModel( f332_arg2, "subobjectivesList" )
				f332_local0.internal.subobjectivesList:updateDataSource()
				return f332_local0
			end
			
			f330_arg1.updateLayout = function ( f333_arg0, f333_arg1 )
				LUI.GridLayout.updateLayout( f333_arg0, f333_arg1 )
				f333_arg0:dispatchEventToParent( "child_size_updated" )
			end
			
		end,
		getCount = function ( f334_arg0 )
			if not f334_arg0.objectiveListModel then
				return 0
			else
				return DataSources.ObjectivesList.getCountFromModel( f334_arg0.objectiveListModel )
			end
		end,
		getItem = function ( f335_arg0, f335_arg1, f335_arg2 )
			if not f335_arg1.objectiveListModel then
				return nil
			else
				return Engine.GetModel( f335_arg1.objectiveListModel, f335_arg2 )
			end
		end,
		getCountFromModel = function ( f336_arg0 )
			local f336_local0 = Engine.GetModel( f336_arg0, "count" )
			if f336_local0 then
				return Engine.GetModelValue( f336_local0 )
			else
				return 0
			end
		end,
		addObjective = function ( f337_arg0, f337_arg1, f337_arg2, f337_arg3 )
			local f337_local0 = DataSources.ObjectivesList.getCountFromModel( f337_arg0 ) + 1
			local f337_local1 = Engine.GetModel( f337_arg0, "count" )
			if f337_local1 then
				Engine.SetModelValue( f337_local1, f337_local0 )
			end
			local f337_local2 = Engine.CreateModel( f337_arg0, f337_local0 )
			Engine.SetModelValue( Engine.CreateModel( f337_local2, "displayText" ), Engine.Localize( f337_arg1 ) )
			Engine.SetModelValue( Engine.CreateModel( f337_local2, "status" ), f337_arg2 )
			local f337_local3 = Engine.CreateModel( f337_local2, "subobjectivesList" )
			Engine.SetModelValue( Engine.CreateModel( f337_local3, "count" ), 0 )
			for f337_local7, f337_local8 in ipairs( f337_arg3 ) do
				DataSources.SubobjectivesList.addSubObjective( f337_local3, Engine.Localize( f337_local8.desc ), f337_local8.status )
			end
		end
	},
	CurrentObjectivesList = {
		prepare = function ( f338_arg0, f338_arg1, f338_arg2 )
			f338_arg1.objectiveOrder = {
				"active",
				"done"
			}
			f338_arg1.objectiveCategories = {}
			f338_arg1:registerEventHandler( "child_size_updated", function ( element, event )
				element:updateLayout( 0 )
				return true
			end )
			f338_arg1.createWidgetFromDataSource = function ( f340_arg0, f340_arg1, f340_arg2 )
				local f340_local0 = LUI.GridLayout.createWidgetFromDataSource( f340_arg0, f340_arg1, f340_arg2 )
				f340_local0.internal.objectivesList.objectiveListModel = Engine.GetModel( f340_arg2, "objectivesList" )
				f340_local0.internal.objectivesList:updateDataSource()
				return f340_local0
			end
			
			if CoD.isCampaign then
				local f338_local0 = Engine.GetPlayerObjectives( f338_arg0 )
				if f338_local0 == nil then
					return 
				end
				local f338_local1 = {}
				for f338_local7, f338_local8 in CoD.pairsByKeys( f338_local0 ) do
					if f338_local8.status ~= "invisible" and f338_local8.objective_desc ~= nil and f338_local8.objective_desc ~= "" then
						local f338_local5 = "done"
						if f338_local8.status == "current" or f338_local8.status == "active" or f338_local8.status == "failed" then
							f338_local5 = "active"
						end
						if not f338_local1[f338_local8.objective_desc] then
							f338_local1[f338_local8.objective_desc] = {
								desc = f338_local8.objective_desc,
								status = f338_local5,
								subobjectives = {}
							}
						end
						local f338_local6 = f338_local1[f338_local8.objective_desc]
						if f338_local8.subobjective_desc ~= "" then
							table.insert( f338_local6.subobjectives, {
								status = f338_local8.status,
								desc = f338_local8.subobjective_desc
							} )
						end
						if f338_local6.status == "done" and f338_local5 == "active" then
							f338_local6.status = "active"
						end
					end
				end
				f338_local2 = {}
				for f338_local8, f338_local5 in CoD.pairsByKeys( f338_local1 ) do
					if not f338_local2[f338_local5.status] then
						f338_local2[f338_local5.status] = {}
					end
					table.insert( f338_local2[f338_local5.status], f338_local5 )
				end
				f338_local3 = Engine.CreateModel( Engine.GetModelForController( f338_arg0 ), "CurrentObjectivesList" )
				for f338_local5, f338_local6 in CoD.pairsByKeys( f338_local2 ) do
					local f338_local12 = Engine.CreateModel( f338_local3, f338_local5 )
					Engine.SetModelValue( Engine.CreateModel( f338_local12, "status" ), f338_local5 )
					Engine.SetModelValue( Engine.CreateModel( f338_local12, "category" ), Engine.Localize( "MENU_" .. Engine.ToUpper( f338_local5 ) .. "_OBJECTIVES_CAPS" ) )
					local f338_local13 = Engine.CreateModel( f338_local12, "objectivesList" )
					Engine.SetModelValue( Engine.CreateModel( f338_local13, "count" ), 0 )
					for f338_local9, f338_local10 in ipairs( f338_local6 ) do
						DataSources.ObjectivesList.addObjective( f338_local13, f338_local10.desc, f338_local10.status, f338_local10.subobjectives )
					end
					f338_arg1.objectiveCategories[f338_local5] = f338_local12
				end
			else
				local f338_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f338_arg0 ), "GameObjectiveList" ), "gameMode" )
				local f338_local2 = Engine.DvarString( nil, "g_gametype" )
				local f338_local3 = Engine.Localize( "MPUI_" .. f338_local2 )
				local f338_local4 = Engine.TableLookup( f338_arg0, CoD.gametypesTable, 0, 0, 1, f338_local2, 3 )
				Engine.SetModelValue( Engine.CreateModel( f338_local1, "status" ), "active" )
				Engine.SetModelValue( Engine.CreateModel( f338_local1, "category" ), Engine.Localize( "GAME MODE" ) )
				local f338_local7 = Engine.CreateModel( f338_local1, "objectivesList" )
				Engine.SetModelValue( Engine.CreateModel( f338_local7, "count" ), 0 )
				DataSources.ObjectivesList.addObjective( f338_local7, f338_local3, "active", {
					{
						status = "description",
						desc = f338_local4
					}
				} )
				f338_arg1.objectiveCategories.active = f338_local1
			end
		end,
		getCount = function ( f341_arg0 )
			local f341_local0 = 0
			for f341_local4, f341_local5 in ipairs( f341_arg0.objectiveOrder ) do
				if f341_arg0.objectiveCategories[f341_local5] then
					f341_local0 = f341_local0 + 1
				end
			end
			return f341_local0
		end,
		getItem = function ( f342_arg0, f342_arg1, f342_arg2 )
			local f342_local0 = 0
			for f342_local4, f342_local5 in ipairs( f342_arg1.objectiveOrder ) do
				if f342_arg1.objectiveCategories[f342_local5] and f342_local0 + 1 == f342_arg2 then
					return f342_arg1.objectiveCategories[f342_local5]
				end
			end
			return nil
		end
	},
	CodfuGlobal = {
		getModel = function ( f343_arg0 )
			local f343_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CodfuGlobal" )
			Engine.CreateModel( f343_local0, "player1name" )
			Engine.CreateModel( f343_local0, "player2name" )
			Engine.CreateModel( f343_local0, "player1health" )
			Engine.CreateModel( f343_local0, "player2health" )
			return f343_local0
		end
	},
	DeadOpsArcadeGlobal = {
		getModel = function ( f344_arg0 )
			local f344_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadeGlobal" )
			Engine.CreateModel( f344_local0, "redins" )
			Engine.CreateModel( f344_local0, "countdown" )
			Engine.CreateModel( f344_local0, "gbanner" )
			Engine.CreateModel( f344_local0, "grgb1" )
			Engine.CreateModel( f344_local0, "grgb2" )
			Engine.CreateModel( f344_local0, "grgb3" )
			Engine.CreateModel( f344_local0, "gtxt0" )
			Engine.CreateModel( f344_local0, "gpr0" )
			Engine.CreateModel( f344_local0, "gpr1" )
			Engine.CreateModel( f344_local0, "gpr2" )
			Engine.CreateModel( f344_local0, "gpr3" )
			return f344_local0
		end
	},
	DeadOpsArcadePlayers = {
		updateModelsForClient = function ( f345_arg0, f345_arg1 )
			local f345_local0 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadePlayers" ), "player" .. f345_arg1 + 1 )
			if f345_local0 ~= nil then
				local f345_local1 = Engine.GetPlayerListData( f345_arg0, f345_arg1 )
				if f345_local1.playerName ~= nil and f345_local1.playerConnected then
					Engine.SetModelValue( Engine.GetModel( f345_local0, "name" ), f345_local1.playerName )
				else
					Engine.SetModelValue( Engine.GetModel( f345_local0, "name" ), "" )
				end
			end
		end,
		getModel = function ( f346_arg0 )
			local f346_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "DeadOpsArcadePlayers" )
			for f346_local1 = 1, 4, 1 do
				if Engine.GetModel( f346_local0, "player" .. f346_local1 ) == nil then
					local f346_local4 = Engine.CreateModel( f346_local0, "player" .. f346_local1 )
					Engine.CreateModel( f346_local4, "name" )
					Engine.CreateModel( f346_local4, "lives" )
					Engine.CreateModel( f346_local4, "bombs" )
					Engine.CreateModel( f346_local4, "boosts" )
					Engine.CreateModel( f346_local4, "score" )
					Engine.CreateModel( f346_local4, "multiplier" )
					Engine.CreateModel( f346_local4, "xbar" )
					Engine.CreateModel( f346_local4, "bulletbar" )
					Engine.CreateModel( f346_local4, "ribbon" )
					Engine.CreateModel( f346_local4, "tank_rgb" )
					Engine.CreateModel( f346_local4, "tank_health" )
					Engine.CreateModel( f346_local4, "tank_name" )
					Engine.CreateModel( f346_local4, "tank_fuel" )
					Engine.CreateModel( f346_local4, "tank_msg" )
					Engine.CreateModel( f346_local4, "generic_txt" )
					Engine.CreateModel( f346_local4, "gpr" )
					Engine.CreateModel( f346_local4, "gpr2" )
					Engine.CreateModel( f346_local4, "weaplevel1" )
					Engine.CreateModel( f346_local4, "weaplevel2" )
					DataSources.DeadOpsArcadePlayers.updateModelsForClient( f346_arg0, f346_local1 - 1 )
				end
			end
			return f346_local0
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
		prepare = function ( f347_arg0, f347_arg1, f347_arg2 )
			f347_arg1.playerListInfoList = {}
			f347_arg1.playerListInfoOrder = {}
			local f347_local0 = Engine.GetModelForController( f347_arg0 )
			local f347_local1 = Engine.CreateModel( f347_local0, "PlayerList" )
			local f347_local2 = 2
			local f347_local3 = Engine.GetClientNum( f347_arg0 )
			for f347_local4 = 0, Dvar.com_maxclients:get() - 1, 1 do
				local f347_local7 = Engine.GetPlayerListData( f347_arg0, f347_local4 )
				local f347_local8 = Engine.CreateModel( f347_local1, f347_local4 )
				for f347_local12, f347_local13 in pairs( DataSources.PlayerList.modelLinks ) do
					Engine.SetModelValue( Engine.CreateModel( f347_local8, f347_local13 ), f347_local7[f347_local12] )
				end
				Engine.SetModelValue( Engine.CreateModel( f347_local8, "objectiveIcon" ), "" )
				f347_arg1.playerListInfoList[f347_local4 + 1] = f347_local8
				if f347_local4 == Engine.GetClientNum( f347_arg0 ) then
					f347_arg1.playerListInfoOrder[1] = f347_local4 + 1
				else
					f347_arg1.playerListInfoOrder[f347_local2] = f347_local4 + 1
					f347_local2 = f347_local2 + 1
				end
			end
			local f347_local4 = function ( f348_arg0, f348_arg1 )
				DataSources.PlayerList.updateModelsForClient( f348_arg0, f347_arg1, f348_arg1 )
			end
			
			if not f347_arg1.playerConnectedSubscription then
				f347_arg1.playerConnectedSubscription = f347_arg1:subscribeToModel( Engine.GetModel( f347_local0, "playerConnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f347_local4( f347_arg0, modelValue )
					end
				end, false )
			end
			if not f347_arg1.playerDisconnectedSubscription then
				f347_arg1.playerDisconnectedSubscription = f347_arg1:subscribeToModel( Engine.GetModel( f347_local0, "playerDisconnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f347_local4( f347_arg0, modelValue )
					end
				end, false )
			end
		end,
		updateModelsForClient = function ( f351_arg0, f351_arg1, f351_arg2 )
			local f351_local0 = DataSources.PlayerList.getModelForPlayer( f351_arg0, f351_arg1, f351_arg2 )
			if f351_local0 ~= nil then
				local f351_local1 = Engine.GetPlayerListData( f351_arg0, f351_arg2 )
				for f351_local5, f351_local6 in pairs( DataSources.PlayerList.modelLinks ) do
					local f351_local7 = Engine.GetModel( f351_local0, f351_local6 )
					if f351_local7 then
						Engine.SetModelValue( f351_local7, f351_local1[f351_local5] )
					end
				end
				f351_arg1:updateDataSource()
			end
		end,
		getCount = function ( f352_arg0 )
			local f352_local0 = 0
			for f352_local4, f352_local5 in pairs( f352_arg0.playerListInfoList ) do
				local f352_local6 = Engine.GetModel( f352_local5, "playerConnected" )
				if f352_local6 and Engine.GetModelValue( f352_local6 ) ~= 0 then
					f352_local0 = f352_local0 + 1
				end
			end
			return f352_local0
		end,
		getItem = function ( f353_arg0, f353_arg1, f353_arg2 )
			local f353_local0 = 0
			for f353_local1 = 1, Dvar.com_maxclients:get(), 1 do
				local f353_local4 = f353_arg1.playerListInfoList[f353_arg1.playerListInfoOrder[f353_local1]]
				local f353_local5 = Engine.GetModel( f353_local4, "playerConnected" )
				if f353_local5 and Engine.GetModelValue( f353_local5 ) ~= 0 and f353_local0 + 1 == f353_arg2 then
					return f353_local4
				end
			end
			DebugPrint( "WARNING: returning invalid playerListInfoList row" )
			return f353_arg1.playerListInfoList[f353_arg1.playerListInfoOrder[0]]
		end,
		getModelForPlayer = function ( f354_arg0, f354_arg1, f354_arg2 )
			return f354_arg1.playerListInfoList[f354_arg2 + 1]
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
		prepare = function ( f355_arg0, f355_arg1, f355_arg2 )
			f355_arg1.playerListInfoList = {}
			local f355_local0 = Engine.GetModelForController( f355_arg0 )
			local f355_local1 = Engine.CreateModel( f355_local0, "PlayerList" )
			local f355_local2 = Engine.GetClientNum( f355_arg0 )
			local f355_local3 = function ( f356_arg0, f356_arg1 )
				if f356_arg0 == f356_arg1 then
					return 1
				elseif f356_arg0 < f356_arg1 then
					return 2 + f356_arg0
				else
					return 1 + f356_arg0
				end
			end
			
			for f355_local4 = 0, Dvar.com_maxclients:get() - 1, 1 do
				local f355_local7 = f355_local3( f355_local4, f355_local2 )
				local f355_local8 = Engine.GetPlayerListData( f355_arg0, f355_local4 )
				local f355_local9 = Engine.CreateModel( f355_local1, f355_local7 - 1 )
				for f355_local13, f355_local14 in pairs( DataSources.PlayerListZM.modelLinks ) do
					Engine.SetModelValue( Engine.CreateModel( f355_local9, f355_local14 ), f355_local8[f355_local13] )
				end
				f355_arg1.playerListInfoList[f355_local7] = f355_local9
			end
			local f355_local4 = function ( f357_arg0, f357_arg1 )
				DataSources.PlayerListZM.updateModelsForClient( f357_arg0, f355_arg1, f357_arg1 )
			end
			
			if not f355_arg1.playerConnectedSubscription then
				f355_arg1.playerConnectedSubscription = f355_arg1:subscribeToModel( Engine.GetModel( f355_local0, "playerConnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f355_local4( f355_arg0, modelValue )
					end
				end, false )
			end
			if not f355_arg1.playerDisconnectedSubscription then
				f355_arg1.playerDisconnectedSubscription = f355_arg1:subscribeToModel( Engine.GetModel( f355_local0, "playerDisconnected" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						f355_local4( f355_arg0, modelValue )
					end
				end, false )
			end
		end,
		updateModelsForClient = function ( f360_arg0, f360_arg1, f360_arg2 )
			local f360_local0 = DataSources.PlayerListZM.getModelForPlayer( f360_arg0, f360_arg1, f360_arg2 )
			if f360_local0 ~= nil then
				local f360_local1 = Engine.GetPlayerListData( f360_arg0, f360_arg2 )
				for f360_local5, f360_local6 in pairs( DataSources.PlayerListZM.modelLinks ) do
					local f360_local7 = Engine.GetModel( f360_local0, f360_local6 )
					if f360_local7 then
						Engine.SetModelValue( f360_local7, f360_local1[f360_local5] )
					end
				end
				f360_arg1:updateDataSource()
			end
		end,
		getCount = function ( f361_arg0 )
			local f361_local0 = 0
			for f361_local4, f361_local5 in pairs( f361_arg0.playerListInfoList ) do
				local f361_local6 = Engine.GetModel( f361_local5, "playerConnected" )
				if f361_local6 and Engine.GetModelValue( f361_local6 ) ~= 0 then
					f361_local0 = f361_local0 + 1
				end
			end
			return f361_local0
		end,
		getItem = function ( f362_arg0, f362_arg1, f362_arg2 )
			return f362_arg1.playerListInfoList[f362_arg2]
		end,
		getModelForPlayer = function ( f363_arg0, f363_arg1, f363_arg2 )
			for f363_local0 = 1, Dvar.com_maxclients:get(), 1 do
				local f363_local3 = f363_arg1.playerListInfoList[f363_local0]
				local f363_local4 = Engine.GetModel( f363_local3, "clientNum" )
				if f363_local4 and f363_local4 == f363_arg2 then
					return f363_local3
				end
			end
			DebugPrint( "WARNING: returning invalid playerListInfoList row" )
			return f363_arg1.playerListInfoList[1]
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
		prepare = function ( f364_arg0, f364_arg1, f364_arg2 )
			if DataSources.RaidsPurchases.Model == nil then
				DataSources.RaidsPurchases.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.RaidsPurchases" )
				DataSources.RaidsPurchases.Items = {}
				local f364_local0 = "gamedata/tables/cp/cp_sm_resources.csv"
				local f364_local1 = {
					scriptID = 0,
					cost = 1,
					title = 2,
					description = 3,
					icon = 4,
					active = 5
				}
				local f364_local2 = Engine.TableFindRows( f364_local0, f364_local1.active, "1" )
				if f364_local2 ~= nil then
					for f364_local3 = 1, #f364_local2, 1 do
						local f364_local6 = f364_local2[f364_local3]
						DataSources.RaidsPurchases.Items[f364_local3] = Engine.CreateModel( DataSources.RaidsPurchases.Model, "item" .. f364_local3 )
						local f364_local7 = Engine.TableGetColumnValueForRow( f364_local0, f364_local6, f364_local1.scriptID )
						local f364_local8 = Engine.TableGetColumnValueForRow( f364_local0, f364_local6, f364_local1.title )
						local f364_local9 = Engine.TableGetColumnValueForRow( f364_local0, f364_local6, f364_local1.description )
						local f364_local10 = Engine.TableGetColumnValueForRow( f364_local0, f364_local6, f364_local1.icon )
						local f364_local11 = Engine.TableGetColumnValueForRow( f364_local0, f364_local6, f364_local1.cost )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f364_local3], "id" ), f364_local7 )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f364_local3], "name" ), f364_local8 )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f364_local3], "displayName" ), Engine.Localize( f364_local8 ) )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f364_local3], "description" ), Engine.Localize( f364_local9 ) )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f364_local3], "enabledDescription" ), f364_local9 )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f364_local3], "image" ), f364_local10 )
						Engine.SetModelValue( Engine.CreateModel( DataSources.RaidsPurchases.Items[f364_local3], "cost" ), f364_local11 )
					end
				end
			end
		end,
		getCount = function ( f365_arg0 )
			return #DataSources.RaidsPurchases.Items
		end,
		getItem = function ( f366_arg0, f366_arg1, f366_arg2 )
			return DataSources.RaidsPurchases.Items[f366_arg2]
		end
	},
	EmblemLayerList = {
		createGroup = function ( f367_arg0, f367_arg1, f367_arg2, f367_arg3, f367_arg4 )
			local f367_local0 = f367_arg1
			local f367_local1 = f367_arg1
			for f367_local2 = f367_arg1, f367_arg3 - 1, 1 do
				local f367_local5 = Engine.GetSelectedLayerData( f367_arg0, f367_local2, f367_arg4 )
				if f367_local5.groupIndex == f367_arg2 then
					f367_local1 = f367_local2
				end
			end
			return {
				groupStartLayer = f367_local0,
				groupEndLayer = f367_local1,
				isGrouped = true
			}
		end,
		createLayer = function ( f368_arg0 )
			return {
				groupStartLayer = f368_arg0,
				groupEndLayer = f368_arg0,
				isGrouped = false
			}
		end,
		prepare = function ( f369_arg0, f369_arg1, f369_arg2 )
			f369_arg1.emblemLayerListModel = Engine.CreateModel( Engine.GetModelForController( f369_arg0 ), "Emblem.EmblemLayerList" )
			local f369_local0 = CoD.GetCustomization( f369_arg0, "type" )
			f369_arg1.totalLayers = math.min( Engine.GetUsedLayerCount( f369_arg0, f369_local0, CoD.perController[f369_arg0].totalLayers ) + 1, CoD.perController[f369_arg0].totalLayers )
			f369_arg1.itemInfo = {}
			local f369_local1 = 0
			while f369_local1 < f369_arg1.totalLayers do
				local f369_local2 = Engine.GetSelectedLayerData( f369_arg0, f369_local1, f369_local0 )
				if f369_local2.isGrouped == true then
					local f369_local3 = DataSources.EmblemLayerList.createGroup( f369_arg0, f369_local1, f369_local2.groupIndex, f369_arg1.totalLayers, f369_local0 )
					table.insert( f369_arg1.itemInfo, f369_local3 )
					f369_local1 = f369_local3.groupEndLayer + 1
				else
					table.insert( f369_arg1.itemInfo, DataSources.EmblemLayerList.createLayer( f369_local1 ) )
					f369_local1 = f369_local1 + 1
				end
				if f369_local2.groupIndex == CoD.perController[f369_arg0].selectEmblemGroupIndex then
					f369_arg1.selectIndex = #f369_arg1.itemInfo
				end
			end
		end,
		getCount = function ( f370_arg0 )
			return #f370_arg0.itemInfo
		end,
		getItem = function ( f371_arg0, f371_arg1, f371_arg2 )
			local f371_local0 = nil
			local f371_local1 = f371_arg1.itemInfo[f371_arg2].groupStartLayer
			local f371_local2 = f371_arg1.itemInfo[f371_arg2].groupEndLayer - f371_arg1.itemInfo[f371_arg2].groupStartLayer + 1
			if f371_arg1.itemInfo[f371_arg2].isGrouped then
				f371_local0 = tostring( f371_arg1.itemInfo[f371_arg2].groupStartLayer + 1 ) .. "-" .. tostring( f371_arg1.itemInfo[f371_arg2].groupEndLayer + 1 )
			else
				f371_local0 = tostring( f371_local1 + 1 )
			end
			local f371_local3 = Engine.CreateModel( f371_arg1.emblemLayerListModel, "layer_" .. f371_local1 )
			Engine.SetModelValue( Engine.CreateModel( f371_local3, "layerIndex" ), f371_local1 )
			Engine.SetModelValue( Engine.CreateModel( f371_local3, "layerNumberString" ), f371_local0 )
			local f371_local4 = Engine.GetSelectedLayerData( f371_arg0, f371_local1, CoD.GetCustomization( f371_arg0, "type" ) )
			if f371_local4.iconID == CoD.emblem.INVALID_ID then
				Engine.SetModelValue( Engine.CreateModel( f371_local3, "layerName" ), Engine.Localize( "MENU_EMBLEM_ADD_DECAL" ) )
			else
				Engine.SetModelValue( Engine.CreateModel( f371_local3, "layerName" ), Engine.Localize( "MENU_EMBLEM_LAYER_NUMBER", f371_local1 + 1 ) )
			end
			Engine.SetModelValue( Engine.CreateModel( f371_local3, "isLinked" ), f371_local4.isLinked )
			Engine.SetModelValue( Engine.CreateModel( f371_local3, "isGrouped" ), f371_local4.isGrouped )
			Engine.SetModelValue( Engine.CreateModel( f371_local3, "groupIndex" ), f371_local4.groupIndex )
			Engine.SetModelValue( Engine.CreateModel( f371_local3, "layerAndGroupIndex" ), f371_local1 .. " " .. f371_local4.groupIndex )
			Engine.SetModelValue( Engine.CreateModel( f371_local3, "groupLayerCount" ), f371_local2 )
			return f371_local3
		end,
		getCustomPropertiesForItem = function ( f372_arg0, f372_arg1 )
			if f372_arg0.selectIndex == f372_arg1 then
				return {
					selectIndex = true
				}
			else
				
			end
		end,
		swapItemInfo = function ( f373_arg0, f373_arg1, f373_arg2, f373_arg3 )
			if f373_arg2 and f373_arg3 and f373_arg1 then
				f373_arg2:setModel( nil )
				f373_arg3:setModel( nil )
				local f373_local0 = f373_arg2.gridInfoTable.zeroBasedIndex + 1
				local f373_local1 = f373_arg3.gridInfoTable.zeroBasedIndex + 1
				local f373_local2 = f373_arg1.itemInfo[f373_local0]
				local f373_local3 = f373_arg1.itemInfo[f373_local1]
				local f373_local4 = f373_local2.groupEndLayer - f373_local2.groupStartLayer
				f373_local2.groupEndLayer = f373_local2.groupStartLayer + f373_local3.groupEndLayer - f373_local3.groupStartLayer
				f373_local3.groupStartLayer = f373_local2.groupEndLayer + 1
				f373_local3.groupEndLayer = f373_local3.groupStartLayer + f373_local4
				local f373_local5 = f373_local2.isGrouped
				f373_local2.isGrouped = f373_local3.isGrouped
				f373_local3.isGrouped = f373_local5
				f373_arg2:setModel( DataSources.EmblemLayerList.getItem( f373_arg0, f373_arg1, f373_local0 ) )
				f373_arg3:setModel( DataSources.EmblemLayerList.getItem( f373_arg0, f373_arg1, f373_local1 ) )
			end
		end
	},
	EmblemIconList = {
		prepare = function ( f374_arg0, f374_arg1, f374_arg2 )
			f374_arg1.emblemIconList = {}
			local f374_local0 = CoD.emblem.DECALTABS[1].category
			if CoD.perController[f374_arg0].selectedDecalCategory ~= nil then
				f374_local0 = CoD.perController[f374_arg0].selectedDecalCategory
			end
			local f374_local1 = Engine.CreateModel( Engine.GetModelForController( f374_arg0 ), "Emblem.EmblemIconList" )
			local f374_local2 = Engine.EmblemFilterCount( f374_arg0, 0, f374_local0 )
			for f374_local3 = 0, f374_local2 - 1, 1 do
				local f374_local6 = Engine.CreateModel( f374_local1, "icon_" .. f374_local3 )
				Engine.SetModelValue( Engine.CreateModel( f374_local6, "iconID" ), Engine.EmblemFilterIconID( f374_arg0, 0, f374_local0, f374_local3 ) )
				table.insert( f374_arg1.emblemIconList, f374_local6 )
			end
		end,
		getCount = function ( f375_arg0 )
			return #f375_arg0.emblemIconList
		end,
		getItem = function ( f376_arg0, f376_arg1, f376_arg2 )
			return f376_arg1.emblemIconList[f376_arg2]
		end
	},
	EmblemMaterialList = {
		prepare = function ( f377_arg0, f377_arg1, f377_arg2 )
			f377_arg1.emblemMaterialList = {}
			local f377_local0 = CoD.emblem.MaterialCategory[1].category
			if CoD.perController[f377_arg0].selectedMaterialCategory ~= nil then
				f377_local0 = CoD.perController[f377_arg0].selectedMaterialCategory
			end
			local f377_local1 = Engine.CreateModel( Engine.GetModelForController( f377_arg0 ), "Emblem.EmblemMaterialList" )
			local f377_local2 = Engine.GetEmblemMaterialFilterCount( f377_arg0, f377_local0 )
			for f377_local3 = 0, f377_local2 - 1, 1 do
				local f377_local6 = Engine.CreateModel( f377_local1, "emblemMaterial_" .. f377_local3 )
				local f377_local7 = Engine.GetEmblemMaterialIDByIndex( f377_arg0, f377_local0, f377_local3 )
				Engine.SetModelValue( Engine.CreateModel( f377_local6, "materialID" ), f377_local7 )
				Engine.SetModelValue( Engine.CreateModel( f377_local6, "materialName" ), Engine.GetEmblemMaterialName( f377_local7 ) )
				table.insert( f377_arg1.emblemMaterialList, f377_local6 )
			end
		end,
		getCount = function ( f378_arg0 )
			return #f378_arg0.emblemMaterialList
		end,
		getItem = function ( f379_arg0, f379_arg1, f379_arg2 )
			return f379_arg1.emblemMaterialList[f379_arg2]
		end
	},
	EmblemColorList = {
		prepare = function ( f380_arg0, f380_arg1, f380_arg2 )
			f380_arg1.emblemColorList = {}
			if not CoD.emblem.ColorList then
				CoD.emblem.ColorList = CoD.GetEmblemColorList( f380_arg0 )
			end
			f380_arg1.emblemColorList = CoD.emblem.ColorList
		end,
		getCount = function ( f381_arg0 )
			return #f381_arg0.emblemColorList
		end,
		getItem = function ( f382_arg0, f382_arg1, f382_arg2 )
			return f382_arg1.emblemColorList[f382_arg2]
		end
	},
	EmblemSelectedLayerColor = {
		getModel = function ( f383_arg0 )
			local f383_local0 = Engine.GetSelectedLayerColor( f383_arg0 )
			local f383_local1 = Engine.CreateModel( Engine.GetModelForController( f383_arg0 ), "Emblem.EmblemSelectedLayerColor" )
			Engine.SetModelValue( Engine.CreateModel( f383_local1, "color" ), CoD.ConvertColor( f383_local0.red, f383_local0.green, f383_local0.blue ) )
			Engine.SetModelValue( Engine.CreateModel( f383_local1, "red" ), f383_local0.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( f383_local1, "green" ), f383_local0.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( f383_local1, "blue" ), f383_local0.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			return f383_local1
		end
	},
	EmblemSelectedLayerColor1 = {
		getModel = function ( f384_arg0 )
			local f384_local0 = Engine.GetSelectedLayerColor1( f384_arg0 )
			local f384_local1 = Engine.CreateModel( Engine.GetModelForController( f384_arg0 ), "Emblem.EmblemSelectedLayerColor1" )
			Engine.SetModelValue( Engine.CreateModel( f384_local1, "color" ), CoD.ConvertColor( f384_local0.red, f384_local0.green, f384_local0.blue ) )
			Engine.SetModelValue( Engine.CreateModel( f384_local1, "red" ), f384_local0.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( f384_local1, "green" ), f384_local0.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( f384_local1, "blue" ), f384_local0.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			return f384_local1
		end
	},
	EmblemSelectedLayerEdittingColor = {
		getModel = function ( f385_arg0 )
			local f385_local0 = CoD.GetEditorProperties( f385_arg0, "isGradientMode" )
			local f385_local1 = CoD.GetEditorProperties( f385_arg0, "colorNum" )
			if f385_local0 ~= nil and f385_local1 ~= nil and f385_local0 == 1 and f385_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
				return DataSources.EmblemSelectedLayerColor1.getModel( f385_arg0 )
			else
				return DataSources.EmblemSelectedLayerColor.getModel( f385_arg0 )
			end
		end
	},
	EmblemSelectedLayerNoColor = {
		getModel = function ( f386_arg0 )
			local f386_local0 = CoD.GetEditorProperties( f386_arg0, "isGradientMode" )
			local f386_local1 = CoD.GetEditorProperties( f386_arg0, "colorNum" )
			if f386_local0 ~= nil and f386_local1 ~= nil and f386_local0 == 1 and f386_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
				return DataSources.EmblemSelectedLayerColor.getModel( f386_arg0 )
			else
				return DataSources.EmblemSelectedLayerColor1.getModel( f386_arg0 )
			end
		end
	},
	EmblemSelectedLayerProperties = {
		getModel = function ( f387_arg0 )
			local f387_local0 = Engine.GetSelectedEmblemLayerProperties()
			local f387_local1 = Engine.CreateModel( Engine.GetModelForController( f387_arg0 ), "Emblem.EmblemSelectedLayerProperties" )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "xposition" ), f387_local0.xposition )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "yposition" ), f387_local0.yposition )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "xscale" ), f387_local0.xscale )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "yscale" ), f387_local0.yscale )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "rotation" ), f387_local0.rotation )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "opacity0" ), f387_local0.opacity0 )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "opacity1" ), f387_local0.opacity1 )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "gradient_angle" ), f387_local0.gradient_angle )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "gradient_type" ), f387_local0.gradient_type )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "gradient_fill" ), f387_local0.gradient_fill )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "material_angle" ), f387_local0.material_angle )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "material_xscale" ), f387_local0.material_xscale )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "material_yscale" ), f387_local0.material_yscale )
			Engine.SetModelValue( Engine.CreateModel( f387_local1, "max_opacity" ), math.max( f387_local0.opacity0, f387_local0.opacity1 ) )
			return f387_local1
		end
	},
	EmblemProperties = {
		getModel = function ( f388_arg0 )
			local f388_local0 = Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID
			local f388_local1 = Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
			local f388_local2 = Engine.GetEmblemScaleMode( f388_arg0 )
			local f388_local3 = Engine.GetLayerMaterialScaleMode( f388_arg0 )
			local f388_local4 = CoD.perController[f388_arg0].totalLayers
			local f388_local5 = Engine.GetUsedLayerCount( f388_arg0, CoD.perController[f388_arg0].customizationType, f388_local4 )
			local f388_local6 = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f388_local5, f388_local4 )
			local f388_local7 = Engine.GetLinkedLayerCount( f388_arg0, CoD.perController[f388_arg0].customizationType )
			local f388_local8 = Engine.GetModel( Engine.GetModelForController( f388_arg0 ), "Emblem.EmblemProperties" )
			if not f388_local8 then
				f388_local8 = Engine.CreateModel( Engine.GetModelForController( f388_arg0 ), "Emblem.EmblemProperties" )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "layersUsed" ), f388_local5 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "colorMode" ), f388_local0 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "scaleMode" ), f388_local2 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "materialScaleMode" ), f388_local3 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "layersUsedFraction" ), f388_local6 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "isClipboardEmpty" ), CoD.emblem.CLIPBOARDSTATE.EMPTY )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "addDecalMode" ), CoD.emblem.ADDDECAL.REPLACE )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "isGradientMode" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "colorNum" ), Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "isColor0NoColor" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "isColor1NoColor" ), 0 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "linkedLayerCount" ), f388_local7 )
				Engine.SetModelValue( Engine.CreateModel( f388_local8, "selectedDecalID" ), 0 )
			end
			return f388_local8
		end
	},
	Customization = {
		getModel = function ( f389_arg0 )
			local f389_local0 = Engine.GetModel( Engine.GetModelForController( f389_arg0 ), "Customization" )
			if not f389_local0 then
				f389_local0 = Engine.CreateModel( Engine.GetModelForController( f389_arg0 ), "Customization" )
				Engine.SetModelValue( Engine.CreateModel( f389_local0, "weapon_index" ), "20" )
				Engine.SetModelValue( Engine.CreateModel( f389_local0, "type" ), Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM )
			end
			return f389_local0
		end
	},
	StoreCategoryList = f0_local7( "Store.CategoryList", function ( f390_arg0 )
		local f390_local0 = {}
		local f390_local1 = Engine.GetStoreCategories()
		for f390_local2 = 1, #f390_local1, 1 do
			local f390_local5 = f390_local1[f390_local2]
			if f390_local5.visibility then
				table.insert( f390_local0, {
					models = {
						category = f390_local5.category,
						category_loc_ref = f390_local5.category_loc_ref,
						category_visibility = f390_local5.visibility
					}
				} )
			end
		end
		return f390_local0
	end
	 ),
	StoreProductList = f0_local7( "Store.ProductList", function ( f391_arg0 )
		local f391_local0 = {}
		local f391_local1 = Engine.GetStoreProductsByCategory( f391_arg0, "BETA" )
		for f391_local2 = 1, #f391_local1, 1 do
			local f391_local5 = f391_local1[f391_local2]
			table.insert( f391_local0, {
				models = {
					name = f391_local5.name,
					price = f391_local5.price,
					desc = f391_local5.desc,
					productID = f391_local5.productID,
					skuID = f391_local5.skuID,
					previewImage = f391_local5.previewImage,
					productImage = f391_local5.productImage,
					purchasestatus = f391_local5.purchasestatus,
					serviceLabel = f391_local5.serviceLabel
				}
			} )
		end
		return f391_local0
	end
	 ),
	StoreRoot = {
		getModel = function ( f392_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "StoreRoot" )
		end
	},
	ChooseClassList = {
		prepare = function ( f393_arg0, f393_arg1, f393_arg2 )
			f393_arg1.customClassList = {}
			local f393_local0 = Engine.GetCustomClassCount( f393_arg0 )
			local f393_local1 = Engine.CreateModel( Engine.GetModelForController( f393_arg0 ), "CustomClassList" )
			for f393_local2 = 1, f393_local0, 1 do
				local f393_local5 = f393_local2 - 1
				f393_arg1.customClassList[f393_local2] = Engine.CreateModel( f393_local1, "class" .. f393_local2 )
				CoD.CACUtility.GetCustomClassModel( f393_arg0, f393_local5, f393_arg1.customClassList[f393_local2] )
			end
		end,
		getCount = function ( f394_arg0 )
			return #f394_arg0.customClassList
		end,
		getItem = function ( f395_arg0, f395_arg1, f395_arg2 )
			return f395_arg1.customClassList[f395_arg2]
		end
	},
	ChooseClass_InGame = {
		prepareModelForIndex = function ( f396_arg0, f396_arg1, f396_arg2 )
			local f396_local0 = f396_arg1 - 1
			local f396_local1 = Engine.CreateModel( f396_arg0, "class" .. f396_arg1 )
			CoD.CACUtility.GetCustomClassModel( f396_arg2, f396_local0, f396_local1 )
			return f396_local1
		end,
		prepare = function ( f397_arg0, f397_arg1, f397_arg2 )
			local f397_local0 = Engine.GetModel( Engine.GetModelForController( f397_arg0 ), "CustomClassList.prepared" )
			f397_arg1.customClassCount = Engine.GetCustomClassCount( f397_arg0 )
			local f397_local1 = math.min( math.max( 10 - f397_arg1.customClassCount, 0 ), 5 )
			if not f397_local0 then
				CoD.CACUtility.classModels = {}
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f397_arg0 ), "CustomClassList.prepared" ), true )
				local f397_local2 = Engine.CreateModel( Engine.GetModelForController( f397_arg0 ), "CustomClassList" )
				f397_arg1.classModels = {}
				for f397_local3 = 1, f397_arg1.customClassCount, 1 do
					table.insert( f397_arg1.classModels, DataSources.ChooseClass_InGame.prepareModelForIndex( f397_local2, f397_local3, f397_arg0 ) )
				end
				if IsMultiplayer() then
					local f397_local3 = 11
					for f397_local4 = f397_local3, f397_local3 + f397_local1 - 1, 1 do
						table.insert( f397_arg1.classModels, DataSources.ChooseClass_InGame.prepareModelForIndex( f397_local2, f397_local4, f397_arg0 ) )
					end
				end
				CoD.CACUtility.classModels = f397_arg1.classModels
			elseif CoD.CACUtility.classModels then
				f397_arg1.classModels = CoD.CACUtility.classModels
			end
		end,
		getCount = function ( f398_arg0 )
			if f398_arg0.classModels then
				return #f398_arg0.classModels
			else
				return 0
			end
		end,
		getItem = function ( f399_arg0, f399_arg1, f399_arg2 )
			if f399_arg1.classModels then
				return f399_arg1.classModels[f399_arg2]
			else
				
			end
		end,
		getSpacerAfterRow = function ( f400_arg0, f400_arg1, f400_arg2 )
			if f400_arg1 == f400_arg0.customClassCount then
				return 20
			else
				return 0
			end
		end
	},
	CustomClassMenu = {
		getModel = function ( f401_arg0 )
			local f401_local0 = CoD.perController[f401_arg0].classModel
			Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f401_arg0 ), "CustomClassMenu" ), "currentClassName" ), Engine.GetModelValue( Engine.GetModel( f401_local0, "customClassName" ) ) )
			return f401_local0
		end,
		updateCustomSlotModel = function ( f402_arg0, f402_arg1, f402_arg2 )
			local f402_local0 = Engine.GetModel( f402_arg0, f402_arg1 )
			if f402_local0 == nil then
				return 
			elseif Engine.GetModelValue( Engine.GetModel( f402_local0, "itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
				local f402_local1 = f402_arg1 .. "attachment1"
				local f402_local2 = Engine.GetModel( f402_arg0, f402_local1 )
				if f402_local2 and Engine.GetModelValue( Engine.GetModel( f402_local2, "itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
					Engine.SetModelValue( Engine.CreateModel( f402_local2, "name" ), Engine.GetModelValue( Engine.GetModel( f402_local0, "name" ) ) )
					Engine.SetModelValue( Engine.CreateModel( f402_local2, "image" ), Engine.GetModelValue( Engine.GetModel( f402_local0, "image" ) ) )
					Engine.SetModelValue( Engine.CreateModel( f402_local2, "desc" ), Engine.GetModelValue( Engine.GetModel( f402_local0, "desc" ) ) )
					Engine.SetModelValue( Engine.CreateModel( f402_local2, "itemIndex" ), 1 )
					Engine.SetModelValue( Engine.CreateModel( f402_local2, "weaponSlot" ), f402_local1 )
				end
			end
		end,
		updateWeaponAttachmentList = function ( f403_arg0, f403_arg1, f403_arg2, f403_arg3 )
			local f403_local0 = Engine.GetModel( f403_arg1, f403_arg2 )
			if not f403_local0 then
				return 
			end
			local f403_local1 = function ( f404_arg0, f404_arg1, f404_arg2, f404_arg3, f404_arg4 )
				local f404_local0 = Engine.CreateModel( f404_arg0, "cust" .. f403_arg2 .. "weaponattachment" .. f404_arg1 )
				Engine.SetModelValue( Engine.CreateModel( f404_local0, "name" ), Engine.GetAttachmentName( f404_arg3, f404_arg4 ) )
				Engine.SetModelValue( Engine.CreateModel( f404_local0, "image" ), Engine.GetAttachmentImageByWeaponAndAttachIndex( f404_arg3, f404_arg4 ) )
				Engine.SetModelValue( Engine.CreateModel( f404_local0, "weaponSlot" ), f403_arg2 .. "attachment" .. f404_arg2 )
				Engine.SetModelValue( Engine.CreateModel( f404_local0, "ref" ), Engine.GetAttachmentRef( f404_arg3, f404_arg4 ) )
			end
			
			if f403_arg2 == "primary" or f403_arg2 == "secondary" then
				local f403_local2 = Engine.GetModel( f403_local0, "itemIndex" )
				if f403_local2 then
					for f403_local3 = 1, f403_arg3, 1 do
						local f403_local6 = Engine.GetModel( f403_local0, "cust" .. f403_arg2 .. "weaponattachment" .. f403_local3 )
						if f403_local6 then
							Engine.UnsubscribeAndFreeModel( f403_local6 )
						end
					end
					local f403_local3 = Engine.GetModelValue( f403_local2 )
					if f403_local3 > CoD.CACUtility.EmptyItemIndex then
						local f403_local4 = 1
						local f403_local5 = CoD.CACUtility.GetAttachmentListForSlot( f403_arg2 )
						for f403_local9, f403_local10 in ipairs( f403_local5 ) do
							local f403_local11 = CoD.CACUtility.GetItemEquippedInSlot( f403_local10, f403_arg0, f403_arg1 )
							if f403_local11 > CoD.CACUtility.EmptyItemIndex then
								f403_local1( f403_local0, f403_local4, f403_local9, f403_local3, f403_local11 )
								f403_local4 = f403_local4 + 1
							end
						end
						for f403_local7 = f403_local4, #f403_local5, 1 do
							local f403_local11 = Engine.CreateModel( f403_local0, "cust" .. f403_arg2 .. "weaponattachment" .. f403_local7 )
						end
					end
				end
			end
		end
	},
	ResetDefaultClass = {
		prepare = function ( f405_arg0, f405_arg1, f405_arg2 )
			f405_arg1.resetDefaultClassList = {}
			local f405_local0 = Engine.CreateModel( Engine.GetModelForController( f405_arg0 ), "ResetDefaultClassList" )
			for f405_local1 = 1, CoD.CACUtility.maxDefaultClass, 1 do
				f405_arg1.resetDefaultClassList[f405_local1] = Engine.CreateModel( f405_local0, "DefaultClass" .. f405_local1 )
				Engine.SetModelValue( Engine.CreateModel( f405_arg1.resetDefaultClassList[f405_local1], "name" ), Engine.Localize( "CLASS_SLOT" .. f405_local1 ) )
				Engine.SetModelValue( Engine.CreateModel( f405_arg1.resetDefaultClassList[f405_local1], "index" ), f405_local1 )
			end
		end,
		getCount = function ( f406_arg0 )
			return #f406_arg0.resetDefaultClassList
		end,
		getItem = function ( f407_arg0, f407_arg1, f407_arg2 )
			return f407_arg1.resetDefaultClassList[f407_arg2]
		end
	},
	PaintshopWeaponTabType = f0_local7( "Paintshop.PaintshopWeaponTabType", function ( f408_arg0 )
		local f408_local0 = {}
		table.insert( f408_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f408_local4, f408_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
			table.insert( f408_local0, {
				models = {
					tabName = Engine.Localize( f408_local5.name )
				},
				properties = {
					filter = f408_local5.weapon_category
				}
			} )
		end
		table.insert( f408_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f408_local0
	end
	 ),
	EmblemMaterialTabType = f0_local7( "Emblem.EmblemMaterialTabType", function ( f409_arg0 )
		local f409_local0 = {}
		table.insert( f409_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f409_local4, f409_local5 in ipairs( CoD.emblem.MaterialCategory ) do
			if f409_local5.type == "camo" then
				table.insert( f409_local0, {
					models = {
						tabName = Engine.Localize( f409_local5.name )
					},
					properties = {
						filter = f409_local5.category,
						disabled = true
					}
				} )
			else
				table.insert( f409_local0, {
					models = {
						tabName = Engine.Localize( f409_local5.name )
					},
					properties = {
						filter = f409_local5.category
					}
				} )
			end
		end
		table.insert( f409_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f409_local0
	end
	 ),
	GunsmithWeaponAttachments = f0_local7( "GunsmithWeaponAttachments", function ( f410_arg0 )
		local f410_local0 = {}
		local f410_local1 = Enum.eModes.MODE_MULTIPLAYER
		local f410_local2 = CoD.GetCustomization( f410_arg0, "weapon_index" )
		local f410_local3 = Engine.GetNumAttachments( f410_local2, f410_local1 )
		local f410_local4 = CoD.perController[f410_arg0].gunsmithAttachmentType
		local f410_local5 = Engine.GetModelValue( CoD.perController[f410_arg0].gunsmithAttachmentModel )
		local f410_local6 = CoD.perController[f410_arg0].gunsmithVariantModel
		local f410_local7 = Engine.GetItemRef( f410_local2 )
		local f410_local8 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
		local f410_local9 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
		local f410_local10 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
		local f410_local11 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
		local f410_local12 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
		local f410_local13 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
		local f410_local14 = "gamedata/weapons/mp/mp_attributesTable.csv"
		local f410_local15 = {
			damage = 0,
			range = 0,
			fireRate = 0,
			accuracy = 0
		}
		local f410_local16 = {}
		for f410_local17 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f410_local20 = Engine.GetModelValue( Engine.GetModel( f410_local6, "attachment" .. f410_local17 ) )
			if f410_local5 ~= f410_local20 and f410_local20 > CoD.CACUtility.EmptyItemIndex then
				local f410_local21 = Engine.GetAttachmentRefByIndex( f410_local20 )
				table.insert( f410_local16, f410_local21 )
				local f410_local22 = Engine.TableLookup( nil, f410_local14, f410_local8, f410_local21, f410_local9, f410_local7, f410_local10 )
				local f410_local23 = Engine.TableLookup( nil, f410_local14, f410_local8, f410_local21, f410_local9, f410_local7, f410_local11 )
				local f410_local24 = Engine.TableLookup( nil, f410_local14, f410_local8, f410_local21, f410_local9, f410_local7, f410_local12 )
				local f410_local25 = Engine.TableLookup( nil, f410_local14, f410_local8, f410_local21, f410_local9, f410_local7, f410_local13 )
				local f410_local26 = f410_local15.damage
				local f410_local27
				if f410_local22 == "" then
					f410_local27 = 0
					if not f410_local27 then
					
					else
						f410_local15.damage = f410_local26 + f410_local27
						f410_local26 = f410_local15.range
						if f410_local23 == "" then
							f410_local27 = 0
							if not f410_local27 then
							
							else
								f410_local15.range = f410_local26 + f410_local27
								f410_local26 = f410_local15.fireRate
								if f410_local24 == "" then
									f410_local27 = 0
									if not f410_local27 then
									
									else
										f410_local15.fireRate = f410_local26 + f410_local27
										f410_local26 = f410_local15.accuracy
										if f410_local25 == "" then
											f410_local27 = 0
											if not f410_local27 then
											
											else
												f410_local15.accuracy = f410_local26 + f410_local27
											end
										end
										f410_local27 = f410_local25
									end
								end
								f410_local27 = f410_local24
							end
						end
						f410_local27 = f410_local23
					end
				end
				f410_local27 = f410_local22
			end
		end
		local f410_local17 = Engine.GetModelForController( f410_arg0 )
		for f410_local18 = 1, f410_local3 - 1, 1 do
			local f410_local21 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
			if f410_local4 == "attachment" then
				if Engine.IsOptic( f410_local2, f410_local18, f410_local1 ) == false then
					f410_local21 = Engine.GetItemAttachment( f410_local2, f410_local18, f410_local1 )
				end
			elseif f410_local4 == "optic" and Engine.IsOptic( f410_local2, f410_local18, f410_local1 ) == true then
				f410_local21 = Engine.GetItemAttachment( f410_local2, f410_local18, f410_local1 )
			end
			if f410_local21 > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local f410_local22 = Engine.GetAttachmentRef( f410_local2, f410_local18, f410_local1 )
				local f410_local23 = Engine.GetAttachmentNameByIndex( f410_local21 )
				local f410_local24 = Engine.GetAttachmentUniqueImageByAttachmentIndex( f410_local1, f410_local2, f410_local21 )
				local f410_local25 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
				if f410_local6 then
					for f410_local26 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
						local f410_local30 = Engine.GetModelValue( Engine.GetModel( f410_local6, "attachment" .. f410_local26 ) )
						local f410_local31 = Engine.GetModelValue( Engine.GetModel( f410_local6, "attachmentVariant" .. f410_local26 ) )
						if f410_local30 == f410_local21 and f410_local31 > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
							local f410_local32 = Engine.GetAttachmentCosmeticVariant( CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f410_arg0, f410_local6 ), f410_local21 )
							f410_local23 = f410_local32.name
							f410_local24 = f410_local32.image
							f410_local25 = f410_local31
							break
						end
					end
				end
				local f410_local27 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" ), f410_local2 .. ".weaponAttributes" )
				local f410_local29 = function ( f411_arg0, f411_arg1 )
					local f411_local0 = Engine.GetModelValue( Engine.GetModel( f410_local27, f411_arg0 ) )
					local f411_local1 = Engine.TableLookup( nil, f410_local14, f410_local8, f410_local22, f410_local9, f410_local7, f411_arg1 )
					if f411_local0 == "" then
						f411_local0 = 0
					end
					if f411_local1 == "" then
						f411_local1 = 0
					end
					local f411_local2 = false
					for f411_local6, f411_local7 in ipairs( f410_local16 ) do
						if f411_local7 == f410_local22 then
							f411_local2 = true
							break
						end
					end
					f411_local3 = f411_local0 + f410_local15[f411_arg0]
					if not f411_local2 then
						f411_local3 = f411_local3 + f411_local1
					end
					return f411_local0 .. "," .. f411_local3
				end
				
				table.insert( f410_local0, {
					models = {
						name = f410_local23,
						image = f410_local24,
						itemIndex = f410_local18,
						weaponIndex = f410_local2,
						attachmentIndex = f410_local21,
						description = Engine.GetAttachmentDesc( f410_local2, f410_local18, f410_local1 ),
						acvIndex = f410_local25,
						weaponAttributes = {
							damage = f410_local29( "damage", f410_local10 ),
							range = f410_local29( "range", f410_local11 ),
							fireRate = f410_local29( "fireRate", f410_local12 ),
							accuracy = f410_local29( "accuracy", f410_local13 )
						}
					},
					properties = {
						selectIndex = f410_local5 == f410_local21
					}
				} )
			end
		end
		return f410_local0
	end
	, true ),
	GunsmithCamoList = {
		prepare = function ( f412_arg0, f412_arg1, f412_arg2 )
			f412_arg1.camos = {}
			local f412_local0 = CoD.GetCustomization( f412_arg0, "weapon_index" )
			local f412_local1 = Engine.GetModelValue( CoD.perController[f412_arg0].gunsmithCamoIndexModel )
			if f412_local0 > CoD.CACUtility.EmptyItemIndex then
				for f412_local2 = 0, Engine.GetWeaponOptionsCount(), 1 do
					local f412_local5 = Engine.GetWeaponOptionsInfoModelByIndex( f412_arg0, f412_local2, "WeaponOptions", f412_local0, 0, Enum.eModes.MODE_MULTIPLAYER )
					if f412_local5 and Engine.GetModelValue( Engine.GetModel( f412_local5, "allocation" ) ) >= 0 and Engine.GetModelValue( Engine.GetModel( f412_local5, "weaponOptionTypeName" ) ) == "camo" then
						local f412_local6 = Engine.GetModelValue( Engine.GetModel( f412_local5, "itemIndex" ) )
						if f412_local6 > 0 then
							table.insert( f412_arg1.camos, {
								model = f412_local5,
								properties = {
									selectIndex = f412_local6 == f412_local1
								}
							} )
						end
					end
				end
			end
		end,
		getCount = function ( f413_arg0 )
			return #f413_arg0.camos
		end,
		getItem = function ( f414_arg0, f414_arg1, f414_arg2 )
			return f414_arg1.camos[f414_arg2].model
		end,
		getCustomPropertiesForItem = function ( f415_arg0, f415_arg1 )
			return f415_arg0.camos[f415_arg1].properties
		end
	},
	GunsmithVariantList = {
		prepare = function ( f416_arg0, f416_arg1, f416_arg2 )
			f416_arg1.controller = f416_arg0
			local f416_local0 = CoD.GetCustomization( f416_arg0, "weapon_index" )
			if not f416_local0 then
				return 
			end
			f416_arg1.variantListModel = Engine.CreateModel( Engine.GetModelForController( f416_arg0 ), "Gunsmith.VariantList" )
			local f416_local1 = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
			local f416_local2 = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( f416_local0 )
			if f416_local1 == CoD.CraftUtility.Gunsmith.GetTotalVaraints() then
				f416_arg1.totalVariants = f416_local2
			else
				f416_arg1.totalVariants = f416_local2 + 1
			end
			f416_arg1.variantList = {}
			f416_arg1.variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f416_local0 )
		end,
		getCount = function ( f417_arg0 )
			return f417_arg0.totalVariants
		end,
		createAttachmentListDataSource = function ( f418_arg0, f418_arg1, f418_arg2, f418_arg3 )
			local f418_local0 = "Gunsmith.VariantList.Variant" .. f418_arg1 .. "AttachmentList"
			DataSources[f418_local0] = DataSourceHelpers.ListSetup( f418_local0, function ( f419_arg0 )
				local f419_local0 = {}
				local f419_local1 = Enum.eModes.MODE_MULTIPLAYER
				for f419_local6, f419_local7 in ipairs( f418_arg3 ) do
					if f419_local7 > CoD.CACUtility.EmptyItemIndex then
						local f419_local5 = Engine.GetAttachmentIndexByAttachmentTableIndex( f418_arg2, f419_local7, f419_local1 )
						if f419_local5 > CoD.CACUtility.EmptyItemIndex then
							table.insert( f419_local0, {
								models = {
									image = Engine.GetAttachmentImage( f418_arg2, f419_local5, f419_local1 ) .. "_wv_icon"
								}
							} )
						end
					end
				end
				f419_local2 = 0
				if CoD.CraftUtility.GetLoadoutSlot( f419_arg0 ) == "primary" then
					f419_local4 = 4
					for f419_local6 = 0, 2, 1 do
						if f418_arg3[f419_local4 + f419_local6] > CoD.CACUtility.EmptyItemIndex then
							f419_local2 = f419_local2 + 1
						end
					end
				elseif f418_arg3[3] > CoD.CACUtility.EmptyItemIndex then
					f419_local2 = 1
					while f419_local2 > 0 do
						table.insert( f419_local0, {
							models = {
								image = "cac_mods_primary_gunfighter_wv_icon"
							}
						} )
						f419_local2 = f419_local2 - 1
					end
					return f419_local0
				end
			end, true )
			return f418_local0
		end,
		createVariantModel = function ( f420_arg0, f420_arg1, f420_arg2, f420_arg3, f420_arg4 )
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "variantIndex" ), f420_arg2.variantIndex )
			local f420_local0 = CoD.GetCustomization( f420_arg0, "weapon_index" )
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "weaponIndex" ), f420_local0 )
			if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f420_arg2.variantIndex ) then
				Engine.SetModelValue( Engine.CreateModel( f420_arg4, "variantName" ), f420_arg2.variantName )
				Engine.SetModelValue( Engine.CreateModel( f420_arg4, "variantNameBig" ), f420_arg2.variantName )
			else
				Engine.SetModelValue( Engine.CreateModel( f420_arg4, "variantName" ), Engine.Localize( "MENU_GUNSMITH_CREATE_VARIANT" ) )
				Engine.SetModelValue( Engine.CreateModel( f420_arg4, "variantNameBig" ), "" )
			end
			for f420_local4, f420_local5 in ipairs( f420_arg2.attachment ) do
				Engine.SetModelValue( Engine.CreateModel( f420_arg4, "attachment" .. f420_local4 ), f420_local5 )
			end
			for f420_local4, f420_local5 in ipairs( f420_arg2.attachmentVariant ) do
				Engine.SetModelValue( Engine.CreateModel( f420_arg4, "attachmentVariant" .. f420_local4 ), f420_local5 )
			end
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "listDataSource" ), DataSources.GunsmithVariantList.createAttachmentListDataSource( f420_arg0, f420_arg1, f420_local0, f420_arg2.attachment ) )
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "sortIndex" ), f420_arg3 )
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "paintjobSlot" ), f420_arg2.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "paintjobIndex" ), f420_arg2.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "camoIndex" ), f420_arg2.camoIndex )
			Engine.SetModelValue( Engine.CreateModel( f420_arg4, "paintjobSlotAndIndex" ), f420_arg2.paintjobSlot .. " " .. f420_arg2.paintjobIndex )
		end,
		getItem = function ( f421_arg0, f421_arg1, f421_arg2 )
			local f421_local0 = Engine.CreateModel( f421_arg1.variantListModel, "variant_" .. f421_arg2 )
			DataSources.GunsmithVariantList.createVariantModel( f421_arg0, f421_arg2, CoD.CraftUtility.Gunsmith.GetVariantByIndex( f421_arg0, f421_arg1.variantList[f421_arg2].variantIndex ), f421_arg1.variantList[f421_arg2].sortIndex, f421_local0 )
			return f421_local0
		end
	},
	GunsmithWeaponTabType = f0_local7( "Gunsmith.GunsmithWeaponTabType", function ( f422_arg0 )
		local f422_local0 = {}
		table.insert( f422_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f422_local4, f422_local5 in ipairs( CoD.Craft.WeaponGroupNames ) do
			table.insert( f422_local0, {
				models = {
					tabName = Engine.Localize( f422_local5.name )
				},
				properties = {
					filter = f422_local5.weapon_category,
					loadoutType = f422_local5.loadout_type
				}
			} )
		end
		table.insert( f422_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f422_local0
	end
	 ),
	GunsmithSelectedItemProperties = {
		getModel = function ( f423_arg0 )
			local f423_local0 = Engine.CreateModel( Engine.GetModelForController( f423_arg0 ), "Gunsmith.GunsmithSelectedItemProperties" )
			Engine.SetModelValue( Engine.CreateModel( f423_local0, "itemName" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f423_local0, "title" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f423_local0, "attachmentType" ), "" )
			return f423_local0
		end
	},
	FileshareRoot = {
		getModel = function ( f424_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
		end
	},
	FileshareShowcaseManagerTabs = f0_local7( "FileshareShowcaseManagerTabs", function ( f425_arg0 )
		local f425_local0 = {}
		table.insert( f425_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		local f425_local1 = CoD.FileshareUtility.GetCurrentCategory()
		for f425_local7, f425_local8 in ipairs( CoD.FileshareUtility.ShowcaseManagerTabs ) do
			local f425_local5 = false
			local f425_local6 = false
			if f425_local1 == "" then
				f425_local5 = f425_local8.selectIndex
				f425_local6 = f425_local8.disabled
			elseif f425_local8.fileshareCategory == f425_local1 then
				f425_local5 = true
				f425_local6 = false
			else
				f425_local5 = false
				f425_local6 = true
			end
			table.insert( f425_local0, {
				models = {
					tabName = Engine.Localize( Engine.TableLookup( 0, CoD.fileShareTable, 1, f425_local8.fileshareCategory, 8 ) .. "_CAPS" )
				},
				properties = {
					disabled = f425_local6,
					fileshareCategory = f425_local8.fileshareCategory,
					fileshareKey = f425_local8.fileshareKey,
					fileshareVal = f425_local8.fileshareVal,
					selectIndex = f425_local5
				}
			} )
		end
		table.insert( f425_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f425_local0
	end
	 ),
	FilesharePublishedPaintjobTabs = f0_local7( "FilesharePublishedPaintjobTabs", function ( f426_arg0 )
		local f426_local0 = {}
		table.insert( f426_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f426_local4, f426_local5 in ipairs( CoD.FileshareUtility.PublishedPaintjobsTabs ) do
			table.insert( f426_local0, {
				models = {
					tabName = Engine.Localize( f426_local5.name )
				},
				properties = {
					filter = f426_local5.weapon_category,
					loadoutType = f426_local5.loadout_type,
					disabled = f426_local5.disabled,
					fileshareGroup = f426_local5.fileshareGroup,
					fileshareCategory = f426_local5.fileshareCategory,
					fileshareKey = f426_local5.fileshareKey,
					fileshareVal = f426_local5.fileshareVal
				}
			} )
		end
		table.insert( f426_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f426_local0
	end
	 ),
	FilesharePublishedVariantsTabs = f0_local7( "FilesharePublishedVariantsTabs", function ( f427_arg0 )
		local f427_local0 = {}
		table.insert( f427_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f427_local4, f427_local5 in ipairs( CoD.FileshareUtility.PublishedVariantsTabs ) do
			table.insert( f427_local0, {
				models = {
					tabName = Engine.Localize( f427_local5.name )
				},
				properties = {
					filter = f427_local5.weapon_category,
					loadoutType = f427_local5.loadout_type,
					disabled = f427_local5.disabled,
					fileshareGroup = f427_local5.fileshareGroup,
					fileshareCategory = f427_local5.fileshareCategory,
					fileshareKey = f427_local5.fileshareKey,
					fileshareVal = f427_local5.fileshareVal
				}
			} )
		end
		table.insert( f427_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f427_local0
	end
	 ),
	EmblemDecalTabs = f0_local7( "EmblemDecalTabs", function ( f428_arg0 )
		local f428_local0 = {}
		table.insert( f428_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f428_local4, f428_local5 in ipairs( CoD.emblem.DECALTABS ) do
			table.insert( f428_local0, {
				models = {
					tabName = Engine.Localize( f428_local5.displayName )
				},
				properties = {
					tabCategory = f428_local5.category
				}
			} )
		end
		table.insert( f428_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f428_local0
	end
	 ),
	FileshareQuotaList = {
		prepare = function ( f429_arg0, f429_arg1, f429_arg2 )
			f429_arg1.controller = f429_arg0
			f429_arg1.rootModel = Engine.CreateModel( Engine.GetModelForController( f429_arg0 ), "FileshareQuota" )
			f429_arg1.numFileshareCategories = Engine.GetTableRowCount( CoD.fileShareTable )
		end,
		getCount = function ( f430_arg0 )
			return f430_arg0.numFileshareCategories
		end,
		getItem = function ( f431_arg0, f431_arg1, f431_arg2 )
			local f431_local0 = Engine.CreateModel( f431_arg1.rootModel, "fileshareCateogory_" .. f431_arg2 )
			local f431_local1 = Engine.FileshareGetQuota( f431_arg1.controller, Engine.TableGetColumnValueForRow( CoD.fileShareTable, f431_arg2 - 1, 1 ) )
			local f431_local2 = 0
			if f431_local1.categoryQuota > 0 then
				f431_local2 = f431_local1.categorySlotsUsed / f431_local1.categoryQuota
			end
			if f431_local2 > 1 then
				f431_local2 = 1
			elseif f431_local2 < 0 then
				f431_local2 = 0
			end
			Engine.SetModelValue( Engine.CreateModel( f431_local0, "category" ), f431_local1.category )
			Engine.SetModelValue( Engine.CreateModel( f431_local0, "locName" ), Engine.TableLookup( 0, CoD.fileShareTable, 1, f431_local1.category, 8 ) )
			Engine.SetModelValue( Engine.CreateModel( f431_local0, "quota" ), f431_local1.categoryQuota )
			Engine.SetModelValue( Engine.CreateModel( f431_local0, "slotsUsed" ), f431_local1.categorySlotsUsed )
			Engine.SetModelValue( Engine.CreateModel( f431_local0, "fraction" ), f431_local2 )
			if f431_local1.category == CoD.FileshareUtility.GetCurrentCategory() then
				Engine.SetModelValue( Engine.CreateModel( f431_local0, "isDim" ), false )
			else
				Engine.SetModelValue( Engine.CreateModel( f431_local0, "isDim" ), true )
			end
			return f431_local0
		end
	},
	FilesharePublishedList = {
		prepare = function ( f432_arg0, f432_arg1, f432_arg2 )
			f432_arg1.controller = f432_arg0
			if f432_arg1.vCount == 1 then
				f432_arg1.prepared = false
				return 
			end
			f432_arg1.numElements = f432_arg1.vCount * f432_arg1.hCount
			f432_arg1.hasCreateButton = CoD.FileshareUtility.GetShowCreateButton()
			f432_arg1.fileshareRootModel = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
			f432_arg1.fileshareData = {}
			for f432_local0 = 1, f432_arg1.numElements, 1 do
				f432_arg1.fileshareData[f432_local0] = {}
				f432_arg1.fileshareData[f432_local0].elementModel = Engine.CreateModel( f432_arg1.fileshareRootModel, "fileshareData_" .. f432_local0 )
				for f432_local6, f432_local7 in ipairs( CoD.FileshareUtility.FileProperties ) do
					Engine.CreateModel( f432_arg1.fileshareData[f432_local0].elementModel, f432_local7 )
				end
			end
			Engine.FileshareStartup( f432_arg1.controller )
			CoD.FileshareUtility.SetShowFileDetails( false )
			CoD.FileshareUtility.SetShowPublishNewDetails( false )
		end,
		getCount = function ( f433_arg0 )
			if f433_arg0.numElements == nil then
				return 0
			elseif not Engine.FileshareIsReady( f433_arg0.controller ) then
				return 0
			else
				local f433_local0 = CoD.FileshareUtility.GetCurrentCategory()
				local f433_local1, f433_local2 = CoD.FileshareUtility.GetCurrentFilter()
				if f433_local0 == nil then
					return 0
				else
					local f433_local3 = Engine.FileshareGetSlotCount( f433_arg0.controller, f433_local0, f433_local1, f433_local2 )
					if f433_arg0.hasCreateButton == true then
						return f433_local3 + 1
					else
						return f433_local3
					end
				end
			end
		end,
		getItem = function ( f434_arg0, f434_arg1, f434_arg2 )
			local f434_local0 = f434_arg2 - 1
			local f434_local1 = f434_local0 % f434_arg1.numElements + 1
			local f434_local2 = f434_arg2 % f434_arg1.numElements
			local f434_local3 = Engine.GetModel( f434_arg1.fileshareData[f434_local1].elementModel, "isPublishNew" )
			local f434_local4 = Engine.GetModel( f434_arg1.fileshareData[f434_local1].elementModel, "showPlusImage" )
			local f434_local5 = Engine.GetModel( f434_arg1.fileshareData[f434_local1].elementModel, "showFileImage" )
			local f434_local6 = Engine.GetModel( f434_arg1.fileshareData[f434_local1].elementModel, "fileImage" )
			if f434_arg1.hasCreateButton == true then
				f434_local0 = f434_local0 - 1
			end
			if f434_arg1.hasCreateButton == true and f434_arg2 == 1 then
				Engine.SetModelValue( f434_local3, true )
				Engine.SetModelValue( f434_local4, 1 )
				Engine.SetModelValue( f434_local6, "" )
				Engine.SetModelValue( f434_local5, 0 )
				Engine.SetModelValue( Engine.GetModel( f434_arg1.fileshareData[f434_local1].elementModel, "fileName" ), "MENU_FILESHARE_PUBLISH_NEW" )
			else
				Engine.SetModelValue( f434_local3, false )
				Engine.SetModelValue( f434_local6, "" )
				Engine.SetModelValue( f434_local4, 0 )
				Engine.SetModelValue( f434_local5, 1 )
				local f434_local7 = CoD.FileshareUtility.GetCurrentCategory()
				local f434_local8, f434_local9 = CoD.FileshareUtility.GetCurrentFilter()
				local f434_local10 = Engine.FileshareGetSlotData( f434_arg1.controller, f434_local7, f434_local8, f434_local9, f434_local0 )
				for f434_local14, f434_local15 in ipairs( CoD.FileshareUtility.FileProperties ) do
					if f434_local10[f434_local15] ~= nil then
						Engine.SetModelValue( Engine.GetModel( f434_arg1.fileshareData[f434_local1].elementModel, f434_local15 ), f434_local10[f434_local15] )
					end
				end
			end
			return f434_arg1.fileshareData[f434_local1].elementModel
		end
	},
	FileshareOptionsButtonList = {
		prepare = function ( f435_arg0, f435_arg1, f435_arg2 )
			local f435_local0 = {
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
			local f435_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareOptionsButtonList" ), "list" )
			f435_arg1.optionModels = {}
			for f435_local5, f435_local6 in ipairs( f435_local0 ) do
				f435_arg1.optionModels[f435_local5] = Engine.CreateModel( f435_local1, "buttonModel_" .. f435_local5 )
				Engine.SetModelValue( Engine.CreateModel( f435_arg1.optionModels[f435_local5], "displayText" ), Engine.Localize( f435_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f435_arg1.optionModels[f435_local5], "displayImage" ), f435_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f435_arg1.optionModels[f435_local5], "hintText" ), Engine.Localize( f435_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f435_arg1.optionModels[f435_local5], "action" ), f435_local6.action )
				Engine.SetModelValue( Engine.CreateModel( f435_arg1.optionModels[f435_local5], "disabled" ), false )
			end
		end,
		getCount = function ( f436_arg0 )
			return #f436_arg0.optionModels
		end,
		getItem = function ( f437_arg0, f437_arg1, f437_arg2 )
			return f437_arg1.optionModels[f437_arg2]
		end
	},
	FileshareOptionsDeleteButtonList = {
		prepare = function ( f438_arg0, f438_arg1, f438_arg2 )
			local f438_local0 = {
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
			local f438_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareOptionsDeleteButtonList" ), "list" )
			f438_arg1.optionModels = {}
			for f438_local5, f438_local6 in ipairs( f438_local0 ) do
				f438_arg1.optionModels[f438_local5] = Engine.CreateModel( f438_local1, "buttonModel_" .. f438_local5 )
				Engine.SetModelValue( Engine.CreateModel( f438_arg1.optionModels[f438_local5], "displayText" ), Engine.Localize( f438_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f438_arg1.optionModels[f438_local5], "displayImage" ), f438_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f438_arg1.optionModels[f438_local5], "hintText" ), Engine.Localize( f438_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f438_arg1.optionModels[f438_local5], "action" ), f438_local6.action )
			end
		end,
		getCount = function ( f439_arg0 )
			return #f439_arg0.optionModels
		end,
		getItem = function ( f440_arg0, f440_arg1, f440_arg2 )
			return f440_arg1.optionModels[f440_arg2]
		end
	},
	FileshareSlotsFullButtonList = {
		prepare = function ( f441_arg0, f441_arg1, f441_arg2 )
			local f441_local0 = {
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
			local f441_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSlotsFullButtonList" ), "list" )
			f441_arg1.optionModels = {}
			for f441_local5, f441_local6 in ipairs( f441_local0 ) do
				f441_arg1.optionModels[f441_local5] = Engine.CreateModel( f441_local1, "buttonModel_" .. f441_local5 )
				Engine.SetModelValue( Engine.CreateModel( f441_arg1.optionModels[f441_local5], "displayText" ), Engine.Localize( f441_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f441_arg1.optionModels[f441_local5], "displayImage" ), f441_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f441_arg1.optionModels[f441_local5], "hintText" ), Engine.Localize( f441_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f441_arg1.optionModels[f441_local5], "action" ), f441_local6.action )
			end
		end,
		getCount = function ( f442_arg0 )
			return #f442_arg0.optionModels
		end,
		getItem = function ( f443_arg0, f443_arg1, f443_arg2 )
			return f443_arg1.optionModels[f443_arg2]
		end
	},
	GunsmithOptionsButtonList = {
		prepare = function ( f444_arg0, f444_arg1, f444_arg2 )
			local f444_local0 = {
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
			local f444_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GunsmithOptionsButtonList" ), "list" )
			f444_arg1.optionModels = {}
			for f444_local5, f444_local6 in ipairs( f444_local0 ) do
				f444_arg1.optionModels[f444_local5] = Engine.CreateModel( f444_local1, "buttonModel_" .. f444_local5 )
				Engine.SetModelValue( Engine.CreateModel( f444_arg1.optionModels[f444_local5], "displayText" ), Engine.Localize( f444_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f444_arg1.optionModels[f444_local5], "displayImage" ), f444_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f444_arg1.optionModels[f444_local5], "hintText" ), Engine.Localize( f444_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f444_arg1.optionModels[f444_local5], "action" ), f444_local6.action )
			end
		end,
		getCount = function ( f445_arg0 )
			return #f445_arg0.optionModels
		end,
		getItem = function ( f446_arg0, f446_arg1, f446_arg2 )
			return f446_arg1.optionModels[f446_arg2]
		end
	},
	EmblemOptionsButtonList = {
		prepare = function ( f447_arg0, f447_arg1, f447_arg2 )
			local f447_local0 = {
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
			local f447_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "EmblemOptionsButtonList" ), "list" )
			f447_arg1.optionModels = {}
			for f447_local5, f447_local6 in ipairs( f447_local0 ) do
				f447_arg1.optionModels[f447_local5] = Engine.CreateModel( f447_local1, "buttonModel_" .. f447_local5 )
				Engine.SetModelValue( Engine.CreateModel( f447_arg1.optionModels[f447_local5], "displayText" ), Engine.Localize( f447_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f447_arg1.optionModels[f447_local5], "displayImage" ), f447_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f447_arg1.optionModels[f447_local5], "hintText" ), Engine.Localize( f447_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f447_arg1.optionModels[f447_local5], "action" ), f447_local6.action )
			end
		end,
		getCount = function ( f448_arg0 )
			return #f448_arg0.optionModels
		end,
		getItem = function ( f449_arg0, f449_arg1, f449_arg2 )
			return f449_arg1.optionModels[f449_arg2]
		end
	},
	PaintjobOptionsButtonList = {
		prepare = function ( f450_arg0, f450_arg1, f450_arg2 )
			local f450_local0 = {
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
				table.insert( f450_local0, {
					displayText = "PLATFORM_STEAM_PUBLISH",
					displayImage = "uie_headicon_dead",
					displayDesc = "PLATFORM_STEAM_PUBLISH_DESC",
					action = CoD.CraftUtility.OpenSteamPublishPromptPaintjob
				} )
			end
			local f450_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "PaintjobOptionsButtonList" ), "list" )
			f450_arg1.optionModels = {}
			for f450_local5, f450_local6 in ipairs( f450_local0 ) do
				f450_arg1.optionModels[f450_local5] = Engine.CreateModel( f450_local1, "buttonModel_" .. f450_local5 )
				Engine.SetModelValue( Engine.CreateModel( f450_arg1.optionModels[f450_local5], "displayText" ), Engine.Localize( f450_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f450_arg1.optionModels[f450_local5], "displayImage" ), f450_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f450_arg1.optionModels[f450_local5], "hintText" ), Engine.Localize( f450_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f450_arg1.optionModels[f450_local5], "action" ), f450_local6.action )
			end
		end,
		getCount = function ( f451_arg0 )
			return #f451_arg0.optionModels
		end,
		getItem = function ( f452_arg0, f452_arg1, f452_arg2 )
			return f452_arg1.optionModels[f452_arg2]
		end
	},
	PaintjobOptionsClearButtonList = {
		prepare = function ( f453_arg0, f453_arg1, f453_arg2 )
			local f453_local0 = {
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
			local f453_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "PaintjobOptionsClearButtonList" ), "list" )
			f453_arg1.optionModels = {}
			for f453_local5, f453_local6 in ipairs( f453_local0 ) do
				f453_arg1.optionModels[f453_local5] = Engine.CreateModel( f453_local1, "buttonModel_" .. f453_local5 )
				Engine.SetModelValue( Engine.CreateModel( f453_arg1.optionModels[f453_local5], "displayText" ), Engine.Localize( f453_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f453_arg1.optionModels[f453_local5], "displayImage" ), f453_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f453_arg1.optionModels[f453_local5], "hintText" ), Engine.Localize( f453_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f453_arg1.optionModels[f453_local5], "action" ), f453_local6.action )
			end
		end,
		getCount = function ( f454_arg0 )
			return #f454_arg0.optionModels
		end,
		getItem = function ( f455_arg0, f455_arg1, f455_arg2 )
			return f455_arg1.optionModels[f455_arg2]
		end
	},
	GunsmithOptionsClearButtonList = {
		prepare = function ( f456_arg0, f456_arg1, f456_arg2 )
			local f456_local0 = {
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
			local f456_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GunsmithOptionsClearButtonList" ), "list" )
			f456_arg1.optionModels = {}
			for f456_local5, f456_local6 in ipairs( f456_local0 ) do
				f456_arg1.optionModels[f456_local5] = Engine.CreateModel( f456_local1, "buttonModel_" .. f456_local5 )
				Engine.SetModelValue( Engine.CreateModel( f456_arg1.optionModels[f456_local5], "displayText" ), Engine.Localize( f456_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f456_arg1.optionModels[f456_local5], "displayImage" ), f456_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f456_arg1.optionModels[f456_local5], "hintText" ), Engine.Localize( f456_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f456_arg1.optionModels[f456_local5], "action" ), f456_local6.action )
			end
		end,
		getCount = function ( f457_arg0 )
			return #f457_arg0.optionModels
		end,
		getItem = function ( f458_arg0, f458_arg1, f458_arg2 )
			return f458_arg1.optionModels[f458_arg2]
		end
	},
	EmblemOptionsClearButtonList = {
		prepare = function ( f459_arg0, f459_arg1, f459_arg2 )
			local f459_local0 = {
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
			local f459_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "EmblemOptionsClearButtonList" ), "list" )
			f459_arg1.optionModels = {}
			for f459_local5, f459_local6 in ipairs( f459_local0 ) do
				f459_arg1.optionModels[f459_local5] = Engine.CreateModel( f459_local1, "buttonModel_" .. f459_local5 )
				Engine.SetModelValue( Engine.CreateModel( f459_arg1.optionModels[f459_local5], "displayText" ), Engine.Localize( f459_local6.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( f459_arg1.optionModels[f459_local5], "displayImage" ), f459_local6.displayImage )
				Engine.SetModelValue( Engine.CreateModel( f459_arg1.optionModels[f459_local5], "hintText" ), Engine.Localize( f459_local6.displayDesc ) )
				Engine.SetModelValue( Engine.CreateModel( f459_arg1.optionModels[f459_local5], "action" ), f459_local6.action )
			end
		end,
		getCount = function ( f460_arg0 )
			return #f460_arg0.optionModels
		end,
		getItem = function ( f461_arg0, f461_arg1, f461_arg2 )
			return f461_arg1.optionModels[f461_arg2]
		end
	},
	PaintjobList = {
		prepare = function ( f462_arg0, f462_arg1, f462_arg2 )
			f462_arg1.controller = f462_arg0
			local f462_local0 = CoD.GetCustomization( f462_arg0, "weapon_index" )
			if not f462_local0 then
				return 
			end
			f462_arg1.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( f462_arg0 ), "Paintshop.PaintjobList" )
			local f462_local1 = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
			local f462_local2 = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( f462_local0 )
			if f462_local1 == CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs() then
				f462_arg1.totalPaintjobs = f462_local2
			else
				f462_arg1.totalPaintjobs = f462_local2 + 1
			end
			f462_arg1.paintjobList = {}
			f462_arg1.paintjobList = CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList( f462_local0 )
		end,
		getCount = function ( f463_arg0 )
			return f463_arg0.totalPaintjobs
		end,
		getItem = function ( f464_arg0, f464_arg1, f464_arg2 )
			local f464_local0 = Engine.CreateModel( f464_arg1.paintjobListModel, "paintjob_" .. f464_arg2 )
			local f464_local1 = CoD.GetCustomization( f464_arg0, "weapon_index" )
			local f464_local2 = f464_arg1.paintjobList[f464_arg2]
			if f464_local2 then
				if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( f464_local2.paintjobSlot, f464_local2.paintjobIndex ) then
					Engine.SetModelValue( Engine.CreateModel( f464_local0, "paintjobName" ), f464_local2.paintjobName )
					Engine.SetModelValue( Engine.CreateModel( f464_local0, "paintjobTextEntry" ), f464_local2.paintjobName )
				else
					Engine.SetModelValue( Engine.CreateModel( f464_local0, "paintjobTextEntry" ), Engine.Localize( "MENU_ENTER_PAINTJOB_NAME" ) )
					Engine.SetModelValue( Engine.CreateModel( f464_local0, "paintjobName" ), "" )
				end
				Engine.SetModelValue( Engine.CreateModel( f464_local0, "sortIndex" ), f464_local2.sortIndex )
				Engine.SetModelValue( Engine.CreateModel( f464_local0, "paintjobSlot" ), f464_local2.paintjobSlot )
				Engine.SetModelValue( Engine.CreateModel( f464_local0, "weaponIndex" ), f464_local1 )
				Engine.SetModelValue( Engine.CreateModel( f464_local0, "paintjobIndex" ), f464_local2.paintjobIndex )
				Engine.SetModelValue( Engine.CreateModel( f464_local0, "paintjobSlotAndIndex" ), f464_local2.paintjobSlot .. " " .. f464_local2.paintjobIndex )
				return f464_local0
			else
				
			end
		end
	},
	EmblemsList = {
		prepare = function ( f465_arg0, f465_arg1, f465_arg2 )
			f465_arg1.controller = f465_arg0
			f465_arg1.emblemListModel = Engine.CreateModel( Engine.GetModelForController( f465_arg0 ), "Emblem.EmblemList" )
			local f465_local0 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems()
			if f465_local0 == CoD.CraftUtility.Emblems.GetTotalAllowedEmblems() then
				f465_arg1.totalEmblems = f465_local0
			else
				f465_arg1.totalEmblems = f465_local0 + 1
			end
			f465_arg1.emblemList = {}
			f465_arg1.emblemList = CoD.CraftUtility.Emblems.GetSortedEmblemsList()
		end,
		getCount = function ( f466_arg0 )
			return f466_arg0.totalEmblems
		end,
		getItem = function ( f467_arg0, f467_arg1, f467_arg2 )
			local f467_local0 = Engine.CreateModel( f467_arg1.emblemListModel, "emblem_" .. f467_arg2 )
			local f467_local1 = f467_arg1.emblemList[f467_arg2]
			if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( f467_local1.emblemIndex ) then
				Engine.SetModelValue( Engine.CreateModel( f467_local0, "emblemName" ), f467_local1.emblemName )
				Engine.SetModelValue( Engine.CreateModel( f467_local0, "emblemTextEntry" ), f467_local1.emblemName )
			else
				Engine.SetModelValue( Engine.CreateModel( f467_local0, "emblemName" ), Engine.Localize( "MENU_EMBLEM_CREATE_NEW" ) )
				Engine.SetModelValue( Engine.CreateModel( f467_local0, "emblemTextEntry" ), Engine.Localize( "MENU_ENTER_EMBLEM_NAME" ) )
			end
			Engine.SetModelValue( Engine.CreateModel( f467_local0, "sortIndex" ), f467_local1.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( f467_local0, "emblemIndex" ), f467_local1.emblemIndex )
			Engine.SetModelValue( Engine.CreateModel( f467_local0, "isUsed" ), f467_local1.isUsed )
			return f467_local0
		end
	},
	PersonalDataVault_CareerData = f0_local7( "PDV_CareerDataList", function ( f468_arg0 )
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
					action = function ( f469_arg0, f469_arg1, f469_arg2 )
						NavigateToMenu( f469_arg0, "Omnipedia", true, f469_arg2 )
					end
					
				},
				properties = {
					disabled = false
				}
			}
		}
	end
	 ),
	PersonalDataVault_MissionLocations = f0_local7( "PDV_MissionLocList", function ( f470_arg0 )
		local f470_local0 = {}
		for f470_local4, f470_local5 in pairs( CoD.mapsTable ) do
			if f470_local5.collectibles and f470_local5.collectibles ~= "" and f470_local5.mapName then
				table.insert( f470_local0, {
					models = {
						displayText = Engine.Localize( f470_local5.mapName )
					},
					properties = {
						map_name = f470_local4
					}
				} )
			end
		end
		return f470_local0
	end
	 ),
	CollectiblesList = f0_local7( "PDV_CollectiblesList", function ( f471_arg0 )
		local f471_local0 = {}
		for f471_local9, f471_local10 in pairs( CoD.mapsTable ) do
			if f471_local10.collectibles and f471_local10.collectibles ~= "" and (not CoD.perController[f471_arg0].inspectingMap or CoD.perController[f471_arg0].inspectingMap == f471_local9) then
				for f471_local7, f471_local8 in ipairs( Engine.GetAssetList( f471_local10.collectibles ) ) do
					if CoD.perController[f471_arg0].inspectingMap or CoD.perController[f471_arg0].inspectingCollectibleSize == f471_local8.slotSize then
						table.insert( f471_local0, {
							models = {
								name = f471_local8.name,
								shortName = f471_local8.displayNameShort,
								longName = f471_local8.displayNameLong,
								description = f471_local8.description,
								image = f471_local8.uiMaterial,
								imageLarge = f471_local8.uiMaterialLarge,
								mapDisplayName = f471_local10.mapName,
								unlocked = Engine.ClientHasCollectible( f471_arg0, f471_local9, f471_local7 - 1 )
							},
							properties = {
								mapName = f471_local9,
								model = f471_local8.uiModel or "tag_origin",
								unlocked = Engine.ClientHasCollectible( f471_arg0, f471_local9, f471_local7 - 1 )
							}
						} )
					end
				end
			end
		end
		table.sort( f471_local0, function ( f472_arg0, f472_arg1 )
			return f472_arg1.models.unlocked and not f472_arg0.models.unlocked
		end )
		return f471_local0
	end
	 ),
	BookmarksList = f0_local7( "BookmarksList", function ( f473_arg0 )
		local f473_local0 = {}
		table.insert( f473_local0, {
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
		for f473_local9, f473_local10 in pairs( CoD.mapsTable ) do
			if f473_local10.collectibles and f473_local10.collectibles ~= "" and (not CoD.perController[f473_arg0].inspectingMap or CoD.perController[f473_arg0].inspectingMap == f473_local9) then
				for f473_local7, f473_local8 in ipairs( Engine.GetAssetList( f473_local10.collectibles ) ) do
					if CoD.perController[f473_arg0].inspectingMap or CoD.perController[f473_arg0].inspectingCollectibleSize == f473_local8.slotSize then
						table.insert( f473_local0, {
							models = {
								bookmarkURLDesc = f473_local8.codexURLDesc,
								bookmarkURL = f473_local8.codexURL,
								unlocked = Engine.ClientHasCollectible( f473_arg0, f473_local9, f473_local7 - 1 )
							},
							properties = {
								mapName = f473_local9,
								unlocked = Engine.ClientHasCollectible( f473_arg0, f473_local9, f473_local7 - 1 )
							}
						} )
					end
				end
			end
		end
		table.sort( f473_local0, function ( f474_arg0, f474_arg1 )
			return f474_arg1.models.unlocked and not f474_arg0.models.unlocked
		end )
		return f473_local0
	end
	 ),
	StartMenuCollectables = f0_local7( "StartMenuCollectables", function ( f475_arg0 )
		local f475_local0 = {}
		local f475_local1 = Dvar.ui_mapname:get()
		if LUI.endswith( f475_local1, "2" ) or LUI.endswith( f475_local1, "3" ) then
			f475_local1 = string.sub( f475_local1, 0, string.len( f475_local1 ) - 1 )
		end
		for f475_local10, f475_local11 in pairs( CoD.mapsTable ) do
			if f475_local10 == f475_local1 and f475_local11.collectibles ~= nil and f475_local11.collectibles ~= "" then
				for f475_local8, f475_local9 in ipairs( Engine.GetAssetList( f475_local11.collectibles ) ) do
					table.insert( f475_local0, {
						models = {
							image = f475_local9.uiMaterial
						},
						properties = {
							unlocked = Engine.ClientHasCollectible( f475_arg0, f475_local1, f475_local8 - 1 )
						}
					} )
				end
			end
		end
		return f475_local0
	end
	 ),
	StartMenu = {
		getModel = function ( f476_arg0 )
			local f476_local0 = Engine.CreateModel( Engine.GetModelForController( f476_arg0 ), "StartMenu" )
			local f476_local1 = Engine.CreateModel( f476_local0, "score" )
			local f476_local2 = Engine.GetPlayerListData( f476_arg0, Engine.GetClientNum( f476_arg0 ) )
			local f476_local3 = 0
			if f476_local2.score ~= nil then
				f476_local3 = f476_local2.score
			end
			Engine.SetModelValue( f476_local1, f476_local3 )
			return f476_local0
		end
	},
	PlaceCollectiblesTabs = f0_local7( "PDV_PlaceCollectiblesTab", function ( f477_arg0 )
		local f477_local0 = {
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
		if CoD.perController[f477_arg0].inspectingCollectibleSize then
			for f477_local4, f477_local5 in ipairs( f477_local0 ) do
				if f477_local5.properties and f477_local5.properties.collectibleSize == CoD.perController[f477_arg0].inspectingCollectibleSize then
					f477_local5.properties.selectIndex = true
					break
				end
			end
		end
		return f477_local0
	end
	 ),
	CollectiblesLayout = {
		getModel = function ( f478_arg0 )
			local f478_local0 = {
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
			local f478_local1 = Engine.CreateModel( Engine.GetModelForController( f478_arg0 ), "collectiblesLayout" )
			local f478_local2 = Engine.CreateModel( Engine.GetModelForController( f478_arg0 ), "safehouse.inClientBunk" )
			if f478_local2 then
				local f478_local3 = Engine.GetCollectibleLayout( Engine.GetModelValue( f478_local2 ) )
				for f478_local14, f478_local15 in ipairs( f478_local0 ) do
					local f478_local16 = Engine.CreateModel( f478_local1, f478_local15 )
					local f478_local17 = Enum.bunkCollectibleSlots_e[f478_local15]
					local f478_local9, f478_local10, f478_local11, f478_local12 = nil
					local f478_local13 = false
					local f478_local18 = f478_local3[f478_local17]
					if f478_local18 and f478_local18.isSet and f478_local16 then
						local f478_local7 = CoD.mapsTable[f478_local18.mapName]
						if f478_local7 and f478_local7.collectibles and f478_local7.collectibles ~= "" then
							local f478_local8 = Engine.GetAssetInfoFromListIndex( f478_local7.collectibles, f478_local18.collectibleIndex )
							if f478_local8 then
								f478_local9 = f478_local8.uiMaterial
								f478_local10 = f478_local8.uiMaterialLarge
								f478_local11 = f478_local8.displayNameLong
								f478_local12 = f478_local8.uiModel
								f478_local13 = true
							end
						end
					end
					Engine.SetModelValue( Engine.CreateModel( f478_local16, "image" ), f478_local9 or "" )
					Engine.SetModelValue( Engine.CreateModel( f478_local16, "imageLarge" ), f478_local10 or "" )
					Engine.SetModelValue( Engine.CreateModel( f478_local16, "name" ), f478_local11 or "" )
					Engine.SetModelValue( Engine.CreateModel( f478_local16, "model" ), f478_local12 or "tag_origin" )
					Engine.SetModelValue( Engine.CreateModel( f478_local16, "collectibleSlot" ), f478_local17 )
					Engine.SetModelValue( Engine.CreateModel( f478_local16, "isSet" ), f478_local13 )
				end
			end
			return f478_local1
		end
	},
	MissionRecordVaultTabs = f0_local7( "MRV_MissionRecordVaultTabs", function ( f479_arg0 )
		return {
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
	end
	, false, {
		getCount = function ( f480_arg0 )
			local f480_local0 = f480_arg0
			local f480_local1 = f480_arg0.menu
			if f480_local1 then
				f480_local1 = f480_arg0.menu:getModel()
				if f480_local1 then
					f480_local1 = f480_local0 and Engine.GetModel( f480_arg0.menu:getModel(), "showMissionSelect" )
				end
			end
			return f0_local3( f480_arg0 ) + (f480_local1 and Engine.GetModelValue( f480_local1 )) - 1
		end
		,
		getItem = function ( f481_arg0, f481_arg1, f481_arg2 )
			if 5 <= f481_arg2 then
				local f481_local0 = f481_arg1
				local f481_local1 = f481_arg1.menu
				if f481_local1 then
					f481_local1 = f481_arg1.menu:getModel()
					if f481_local1 then
						f481_local1 = f481_local0 and Engine.GetModel( f481_arg1.menu:getModel(), "showMissionSelect" )
					end
				end
				if (f481_local1 and Engine.GetModelValue( f481_local1 )) ~= 1 then
					f481_arg2 = f481_arg2 + 1
				end
			end
			return f0_local4( f481_arg0, f481_arg1, f481_arg2 )
		end
		
	} ),
	MissionRecordVaultMapInfo = {
		getModel = function ( f482_arg0 )
			local f482_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo" )
			local f482_local1 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
			local f482_local2 = f482_local1 and Engine.GetModelValue( f482_local1 )
			local f482_local3 = CoD.mapsTable[f482_local2]
			if f482_local3 == nil then
				return f482_local0
			end
			Engine.SetModelValue( Engine.CreateModel( f482_local0, "mapId" ), f482_local2 )
			for f482_local7, f482_local8 in ipairs( {
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
				Engine.SetModelValue( Engine.CreateModel( f482_local0, f482_local8 ), f482_local3[f482_local8] )
			end
			f482_local4 = Engine.GetPlayerStats( f482_arg0 )
			f482_local5 = f482_local2
			if string.match( f482_local5, "[0-9]$" ) ~= nil then
				f482_local5 = string.sub( f482_local5, 0, string.len( f482_local5 ) - 1 )
			end
			f482_local6 = f482_local4.PlayerStatsByMap[f482_local5]
			if f482_local6 then
				for f482_local11, f482_local12 in ipairs( {
					"HIGHEST_SCORE",
					"HIGHEST_KILLS",
					"HIGHEST_ASSISTS",
					"HIGHEST_DIFFICULTY"
				} ) do
					local f482_local10 = f482_local6.highestStats[f482_local12]:get()
					if f482_local12 == "HIGHEST_DIFFICULTY" then
						f482_local10 = f482_local10 - 1
					end
					Engine.SetModelValue( Engine.CreateModel( f482_local0, f482_local12 ), f482_local10 )
				end
			end
			f482_local7 = Engine.GetGDTCampaignMapInfo( f482_local2 )
			if f482_local7 ~= nil then
				for f482_local12, f482_local10 in ipairs( {
					"mapObjective",
					"engageClose",
					"engageMedium",
					"engageLong",
					"resistanceText",
					"operationsBackground"
				} ) do
					Engine.SetModelValue( Engine.CreateModel( f482_local0, f482_local10 ), f482_local7[f482_local10] )
				end
			end
			return f482_local0
		end
	},
	MissionRecordVaultMaps = f0_local7( "MissionRecordVaultMaps", function ( f483_arg0 )
		local f483_local0 = {}
		for f483_local4, f483_local5 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f484_arg0, f484_arg1 )
			return CoD.mapsTable[f484_arg0].unique_id < CoD.mapsTable[f484_arg1].unique_id
		end, nil ) do
			if f483_local5.isSubLevel == false and f483_local5.session_mode == Enum.eModes.MODE_CAMPAIGN and f483_local5.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT and f483_local5.dlc_pack ~= -1 then
				table.insert( f483_local0, {
					models = {
						displayText = Engine.Localize( f483_local5.mapName )
					},
					properties = {
						mapId = f483_local4
					}
				} )
			end
		end
		return f483_local0
	end
	 ),
	MissionRecordVaultChallengeInfo = f0_local7( "MissionRecordVaultChallengeInfo", function ( f485_arg0 )
		local f485_local0 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		local f485_local1 = f485_local0 and Engine.GetModelValue( f485_local0 )
		local f485_local2 = f485_local1
		local f485_local3 = CoD.mapsTable[f485_local1]
		if f485_local3 then
			f485_local3 = f485_local2 and CoD.mapsTable[f485_local1].accoladelist
		end
		local f485_local4 = {}
		local f485_local5 = f485_local3 and Engine.GetAssetList( f485_local3 )
		if f485_local5 ~= nil then
			for f485_local6 = 1, #f485_local5, 1 do
				f485_local4[f485_local6] = {
					models = f485_local5[f485_local6]
				}
			end
		end
		local f485_local6 = {
			"2",
			"100",
			"17:20",
			"1",
			"0"
		}
		local f485_local7 = Engine.GetPlayerStats( f485_arg0 )
		local f485_local8 = f485_local1
		if string.match( f485_local8, "[0-9]$" ) ~= nil then
			f485_local8 = string.sub( f485_local8, 0, string.len( f485_local8 ) - 1 )
		end
		for f485_local9 = 1, #f485_local4, 1 do
			local f485_local12 = f485_local7.PlayerStatsByMap[f485_local8].accolades[f485_local9 - 1]:get()
			local f485_local13 = f485_local12 >> 29
			local f485_local14 = f485_local12 << 3 >> 3
			f485_local4[f485_local9].models.completed = f485_local13 ~= 0
			f485_local4[f485_local9].models.challengeProgressQuantity = f485_local14
		end
		return f485_local4
	end
	 ),
	WeaponCustomCategory = f0_local7( "WeaponCustomizationCategory", function ( f486_arg0 )
		local f486_local0 = {}
		local f486_local1 = CoD.perController[f486_arg0].classModel
		local f486_local2 = CoD.perController[f486_arg0].weaponCategory
		local f486_local3 = Engine.GetNumAttachments( Engine.GetModelValue( Engine.GetModel( f486_local1, f486_local2 .. ".itemIndex" ) ) )
		local f486_local4 = CoD.CACUtility.PrimaryAttachmentSlotNameList
		local f486_local5 = "primaryattachment"
		if f486_local2 == "secondary" then
			f486_local4 = CoD.CACUtility.SecondaryAttachmentSlotNameList
			f486_local5 = "secondaryattachment"
		end
		local f486_local6 = function ( f487_arg0, f487_arg1, f487_arg2, f487_arg3, f487_arg4, f487_arg5, f487_arg6 )
			return {
				models = {
					displayText = f487_arg0,
					type = f487_arg1,
					name = f487_arg2,
					image = f487_arg3 or "blacktransparent",
					paintjobSlot = f487_arg4,
					paintjobIndex = f487_arg5,
					paintjobSlotAndIndex = f487_arg6
				},
				properties = {}
			}
		end
		
		local f486_local7 = function ( f488_arg0, f488_arg1, f488_arg2, f488_arg3, f488_arg4, f488_arg5, f488_arg6 )
			local f488_local0 = f486_local6( f488_arg0, f488_arg1, f488_arg2, f488_arg3, f488_arg4, f488_arg5, f488_arg6 )
			f488_local0.properties.viewWidget = "CoD.WeaponCustomizationSelect"
			f488_local0.properties.xcamNotetrack = "select01"
			return f488_local0
		end
		
		local f486_local8 = Engine.GetModel( f486_local1, f486_local2 .. "paintjobslot" )
		local f486_local9 = Engine.GetModel( f486_local1, f486_local2 .. "paintjobindex" )
		local f486_local10 = Engine.GetModelValue( Engine.GetModel( f486_local8, "itemIndex" ) )
		local f486_local11 = Engine.GetModelValue( Engine.GetModel( f486_local9, "itemIndex" ) )
		local f486_local12 = nil
		if Paintjobs_IsEnabled( nil, f486_arg0 ) then
			table.insert( f486_local0, f486_local7( Engine.Localize( "MENU_FILESHARE_CATEGORY_PAINTJOBS" ), "paintjob", "", nil, f486_local10, f486_local11, f486_local10 .. " " .. f486_local11 ) )
		end
		local f486_local13 = Engine.GetModel( f486_local1, f486_local2 .. "camo" )
		local f486_local14 = Engine.GetModelValue( Engine.GetModel( f486_local13, "image" ) )
		local f486_local15 = Engine.GetModelValue( Engine.GetModel( f486_local13, "name" ) )
		if not Dvar.ui_execdemo_beta:get() then
			table.insert( f486_local0, f486_local7( Engine.Localize( "MPUI_CAMO" ), "camo", f486_local15, f486_local14, nil, nil, nil ) )
		end
		CoD.perController[f486_arg0].customReticleAttachmentIndex = 0
		return f486_local0
	end
	, false ),
	WeaponOptions = {
		prepare = function ( f489_arg0, f489_arg1, f489_arg2 )
			if not CoD.WeaponOptionsTable then
				CoD.WeaponOptionsTable = CoD.GetWeaponOptionsTable( f489_arg0, f489_arg1, f489_arg2 )
			end
			f489_arg1.weaponOptions = CoD.WeaponOptionsTable
		end,
		getCount = function ( f490_arg0 )
			if not DataSources.WeaponOptions.currentFilter and f490_arg0.weaponOptions.filterList then
				return #f490_arg0.weaponOptions.filterList
			elseif f490_arg0.weaponOptions[DataSources.WeaponOptions.currentFilter] then
				return #f490_arg0.weaponOptions[DataSources.WeaponOptions.currentFilter]
			else
				return 0
			end
		end,
		getItem = function ( f491_arg0, f491_arg1, f491_arg2 )
			if not DataSources.WeaponOptions.currentFilter and f491_arg1.weaponOptions.filterList then
				return f491_arg1.weaponOptions.filterList[f491_arg2]
			elseif f491_arg1.weaponOptions[DataSources.WeaponOptions.currentFilter] then
				return f491_arg1.weaponOptions[DataSources.WeaponOptions.currentFilter][f491_arg2]
			else
				
			end
		end,
		setCurrentFilterItem = function ( f492_arg0 )
			DataSources.WeaponOptions.currentFilter = f492_arg0
		end,
		getCurrentFilterItem = function ()
			return DataSources.WeaponOptions.currentFilter
		end,
		currentFilter = nil
	},
	AttachmentCosmeticVariantList = f0_local7( "AttachmentCosmeticVariantList", function ( f494_arg0 )
		local f494_local0 = {}
		local f494_local1 = function ( f495_arg0, f495_arg1 )
			return {
				models = {
					name = f495_arg0.name,
					image = f495_arg0.image or "blacktransparent"
				},
				properties = {
					variantIndex = f495_arg0.variantIndex,
					attachmentRef = f495_arg1
				}
			}
		end
		
		local f494_local2 = CoD.WC_Category.ACV.selectedAttachment
		if CoD.WC_Category.ACV.attachmentTable[f494_local2] then
			table.insert( f494_local0, f494_local1( {
				name = "MENU_NONE",
				image = "menu_cac_none",
				variantIndex = 0
			}, f494_local2 ) )
			for f494_local6, f494_local7 in ipairs( CoD.WC_Category.ACV.attachmentTable[f494_local2].variants ) do
				table.insert( f494_local0, f494_local1( f494_local7, f494_local2 ) )
			end
		end
		return f494_local0
	end
	, true ),
	ArenaRank = {
		getModel = function ( f496_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f496_arg0 ), "ArenaRank" )
		end
	},
	LoadingScreenPlayerListTeam1 = {
		prepare = function ( f497_arg0, f497_arg1, f497_arg2 )
			local f497_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
			if f497_arg1.teamCountSubscription then
				f497_arg1:removeSubscription( f497_arg1.teamCountSubscription )
			end
			f497_arg1.teamCountSubscription = f497_arg1:subscribeToModel( f497_local0, function ()
				f497_arg1:updateDataSource()
			end, false )
			local f497_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
			local f497_local2 = {
				teamInfo = {}
			}
			f497_local2.teamInfo[1] = {}
			f497_local2.teamInfo[2] = {}
			local f497_local3 = 0
			local f497_local4 = 2
			local f497_local5 = Engine.GetGametypeSetting( "teamCount" ) < 2
			local f497_local6 = 6
			if f497_local5 then
				f497_local6 = 12
			end
			f497_arg1.maxMembersToShowOnEachTeam = f497_local6
			if f497_local1 and f497_local1.sessionClients then
				f497_local3 = #f497_local1.sessionClients
				local f497_local7 = nil
				for f497_local8 = 1, f497_local3, 1 do
					local f497_local11 = f497_local1.sessionClients[f497_local8]
					local f497_local12 = f497_local11.team
					local f497_local13 = f497_local11.xuid
					local f497_local14 = f497_local11.gamertag
					if f497_local5 or f497_local12 == Enum.team_t.TEAM_ALLIES or f497_local12 == Enum.team_t.TEAM_FREE then
						table.insert( f497_local2.teamInfo[1], {
							name = f497_local14,
							xuid = f497_local13
						} )
					elseif f497_local12 == Enum.team_t.TEAM_AXIS then
						table.insert( f497_local2.teamInfo[2], {
							name = f497_local14,
							xuid = f497_local13
						} )
					end
					if Engine.CompareUInt64( Engine.GetXUID64( f497_arg0 ), f497_local13, "=" ) then
						f497_local7 = f497_local12
					end
				end
				local f497_local10 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "LoadingScreenInfo" ), "LoadingScreenPlayerList" )
				local f497_local15 = Engine.CreateModel( f497_local10, "team1" )
				local f497_local11 = Engine.CreateModel( f497_local15, "count" )
				local f497_local12 = Engine.CreateModel( f497_local10, "team2" )
				local f497_local13 = Engine.CreateModel( f497_local12, "count" )
				f497_arg1.team1CountModel = f497_local11
				f497_arg1.team1BaseModel = f497_local15
				f497_arg1.team2CountModel = f497_local13
				f497_arg1.team2BaseModel = f497_local12
				f497_local2.teamInfo[1].teamModel = f497_local15
				f497_local2.teamInfo[2].teamModel = f497_local12
				Engine.SetModelValue( f497_local11, #f497_local2.teamInfo[1] )
				Engine.SetModelValue( f497_local13, #f497_local2.teamInfo[2] )
				if not f497_local5 and f497_local7 ~= Enum.team_t.TEAM_ALLIES then
					f497_local2.teamInfo[1].teamModel = f497_local12
					f497_local2.teamInfo[2].teamModel = f497_local15
					Engine.SetModelValue( f497_local11, #f497_local2.teamInfo[2] )
					Engine.SetModelValue( f497_local13, #f497_local2.teamInfo[1] )
				end
				for f497_local14 = 1, f497_local4, 1 do
					for f497_local18 = 1, f497_local6, 1 do
						local f497_local21 = Engine.CreateModel( f497_local2.teamInfo[f497_local14].teamModel, "member" .. f497_local18 )
						if f497_local2.teamInfo[f497_local14][f497_local18] then
							Engine.SetModelValue( Engine.CreateModel( f497_local21, "playerxuid" ), f497_local2.teamInfo[f497_local14][f497_local18].xuid )
							Engine.SetModelValue( Engine.CreateModel( f497_local21, "playerName" ), f497_local2.teamInfo[f497_local14][f497_local18].name )
							local f497_local22 = Engine.CreateModel( f497_local21, "playerHeroLoadoutItem" )
							local f497_local23 = 0
							local f497_local24 = Engine.GetHeroLoadoutItemIndexLobbyData( Engine.CurrentSessionMode(), f497_local2.teamInfo[f497_local14][f497_local18].xuid )
							local f497_local25 = ""
							if f497_local24 ~= 0 then
								f497_local25 = Engine.GetItemName( f497_local24 )
							end
							Engine.SetModelValue( f497_local22, f497_local25 )
							Engine.SetModelValue( Engine.CreateModel( f497_local21, "isSelfPlayerName" ), Engine.CompareUInt64( Engine.GetXUID64( f497_arg0 ), f497_local2.teamInfo[f497_local14][f497_local18].xuid, "=" ) )
						end
					end
				end
			else
				return 
			end
		end,
		getCount = function ( f499_arg0 )
			if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
				return 0
			else
				local f499_local0 = Engine.GetModelValue( f499_arg0.team1CountModel )
				local f499_local1 = Engine.GetModelValue( f499_arg0.team2CountModel )
				local f499_local2 = f499_arg0.maxMembersToShowOnEachTeam
				if not (Engine.GetGametypeSetting( "teamCount" ) >= 2 or f499_local0 > f499_local2) or f499_local0 <= f499_local2 and f499_local1 <= f499_local2 then
					return f499_local0
				else
					return 0
				end
			end
		end,
		getItem = function ( f500_arg0, f500_arg1, f500_arg2 )
			return Engine.GetModel( f500_arg1.team1BaseModel, "member" .. f500_arg2 )
		end
	},
	LoadingScreenPlayerListTeam2 = {
		prepare = function ( f501_arg0, f501_arg1, f501_arg2 )
			DataSources.LoadingScreenPlayerListTeam1.prepare( f501_arg0, f501_arg1, f501_arg2 )
		end,
		getCount = function ( f502_arg0 )
			if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
				return 0
			else
				local f502_local0 = Engine.GetModelValue( f502_arg0.team1CountModel )
				local f502_local1 = Engine.GetModelValue( f502_arg0.team2CountModel )
				local f502_local2 = f502_arg0.maxMembersToShowOnEachTeam
				if f502_local0 <= f502_local2 and f502_local1 <= f502_local2 then
					return f502_local1
				else
					return 0
				end
			end
		end,
		getItem = function ( f503_arg0, f503_arg1, f503_arg2 )
			return Engine.GetModel( f503_arg1.team2BaseModel, "member" .. f503_arg2 )
		end
	},
	MapInfo = {
		getModel = function ( f504_arg0 )
			local f504_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MapInfo" )
			Engine.SetModelValue( Engine.CreateModel( f504_local0, "gameTypeIcon" ), CoD.GetLoadingScreenGameTypeIconName() )
			Engine.SetModelValue( Engine.CreateModel( f504_local0, "gameType" ), Dvar.ls_gametype:get() )
			Engine.SetModelValue( Engine.CreateModel( f504_local0, "mapName" ), Dvar.ls_mapname:get() )
			Engine.SetModelValue( Engine.CreateModel( f504_local0, "mapImage" ), CoD.GetMapValue( Dvar.ui_mapname:get(), "loadingImage", "black" ) )
			Engine.SetModelValue( Engine.CreateModel( f504_local0, "dateTime" ), CoD.GetMapValue( Engine.GetCurrentMapName(), "mapDateTime", "" ) )
			Engine.SetModelValue( Engine.CreateModel( f504_local0, "location" ), Dvar.ls_maplocation:get() )
			return f504_local0
		end
	},
	LoadingScreenTeamInfo = {
		getModel = function ( f505_arg0 )
			local f505_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f505_arg0 ), "LoadingScreenInfo" ), "LoadingScreenTeamInfo" )
			local f505_local1 = Engine.CreateModel( f505_local0, "team1FactionName" )
			local f505_local2 = Engine.CreateModel( f505_local0, "team2FactionName" )
			local f505_local3 = Engine.CreateModel( f505_local0, "team1FactionIcon" )
			local f505_local4 = Engine.CreateModel( f505_local0, "team2FactionIcon" )
			local f505_local5 = Engine.CreateModel( f505_local0, "team1FactionColor" )
			local f505_local6 = Engine.CreateModel( f505_local0, "team2FactionColor" )
			local f505_local7 = Engine.CreateModel( f505_local0, "gameTypeIcon" )
			local f505_local8 = Engine.CreateModel( f505_local0, "gameType" )
			local f505_local9 = Engine.CreateModel( f505_local0, "mapName" )
			local f505_local10 = Engine.CreateModel( f505_local0, "location" )
			local f505_local11 = Engine.CreateModel( f505_local0, "tip" )
			local f505_local12 = Engine.CreateModel( f505_local0, "statusText" )
			local f505_local13 = Engine.CreateModel( f505_local0, "loadedFraction" )
			local f505_local14, f505_local15 = nil
			local f505_local16 = CoD.GetTeamID( f505_arg0 )
			local f505_local17 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			local f505_local18 = {
				name = CoD.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
			if f505_local16 == Enum.team_t.TEAM_SPECTATOR then
				if CoD.ShoutcasterProfileVarBool( f505_arg0, "shoutcaster_flip_scorepanel" ) then
					f505_local14 = f505_local18
					f505_local15 = f505_local17
				else
					f505_local14 = f505_local17
					f505_local15 = f505_local18
				end
			elseif f505_local16 == Enum.team_t.TEAM_ALLIES then
				f505_local14 = f505_local17
				f505_local15 = f505_local18
			else
				f505_local14 = f505_local18
				f505_local15 = f505_local17
			end
			Engine.SetModelValue( f505_local1, f505_local14.name )
			Engine.SetModelValue( f505_local3, f505_local14.icon )
			Engine.SetModelValue( f505_local5, f505_local14.color )
			Engine.SetModelValue( f505_local2, f505_local15.name )
			Engine.SetModelValue( f505_local4, f505_local15.icon )
			Engine.SetModelValue( f505_local6, f505_local15.color )
			Engine.SetModelValue( f505_local7, CoD.GetLoadingScreenGameTypeIconName() )
			Engine.SetModelValue( f505_local8, Dvar.ls_gametype:get() )
			Engine.SetModelValue( f505_local9, Dvar.ls_mapname:get() )
			Engine.SetModelValue( f505_local10, "" )
			if CoD.Loading ~= nil then
				Engine.SetModelValue( f505_local11, CoD.Loading.GetDidYouKnowString() )
			end
			Engine.SetModelValue( f505_local12, "" )
			Engine.SetModelValue( f505_local13, 0 )
			return f505_local0
		end
	},
	AbilityWheel = {
		getModel = function ( f506_arg0 )
			local f506_local0 = CoD.CACUtility.abilityButtonNumMapping
			local f506_local1 = Engine.CreateModel( Engine.GetModelForController( f506_arg0 ), "AbilityWheel" )
			local f506_local2 = Engine.GetModel( Engine.GetModelForController( f506_arg0 ), "hudItems.cybercomActiveType" )
			Engine.CreateModel( f506_local1, "selectedAbilityDisplayName" )
			Engine.CreateModel( f506_local1, "selectedAbilityDisplayDesc" )
			if Engine.GetModelValue( f506_local2 ) == nil then
				Engine.SetModelValue( f506_local2, 0 )
			end
			local f506_local3 = Engine.GetModelValue( f506_local2 )
			local f506_local4 = {
				"MENU_CONTROL",
				"MENU_MARTIAL",
				"MENU_CHAOS",
				"MENU_DEMO"
			}
			Engine.SetModelValue( Engine.CreateModel( f506_local1, "name" ), f506_local4[f506_local3 + 1] )
			local f506_local5 = function ( f507_arg0 )
				Engine.SetModelValue( Engine.CreateModel( f507_arg0, "name" ), nil )
				Engine.SetModelValue( Engine.CreateModel( f507_arg0, "image" ), nil )
				Engine.SetModelValue( Engine.CreateModel( f507_arg0, "enabled" ), false )
			end
			
			local f506_local6 = 0
			local f506_local7 = 0
			for f506_local8 = 1, CoD.CACUtility.maxAbilities, 1 do
				local f506_local11 = Engine.GetTacticalMenuItems( f506_arg0, f506_local8 - 1, f506_local3 )
				local f506_local12 = nil
				if f506_local11.contextual then
					f506_local12 = Engine.CreateModel( f506_local1, "AbilityWheelContextualWeapon" .. f506_local7 + 1 )
				else
					f506_local12 = Engine.CreateModel( f506_local1, "AbilityWheelWeapon" .. f506_local0[f506_local6 + 1] )
				end
				Engine.SetModelValue( Engine.CreateModel( f506_local12, "image" ), f506_local11.image )
				Engine.SetModelValue( Engine.CreateModel( f506_local12, "name" ), f506_local11.name )
				Engine.SetModelValue( Engine.CreateModel( f506_local12, "displayName" ), f506_local11.displayName )
				Engine.SetModelValue( Engine.CreateModel( f506_local12, "abilityFlag" ), f506_local11.abilityFlag )
				local f506_local13 = Engine.CreateModel( f506_local12, "enabled" )
				if f506_local11.enabled == nil then
					Engine.SetModelValue( f506_local13, true )
				else
					Engine.SetModelValue( f506_local13, f506_local11.enabled )
				end
				local f506_local14 = Engine.CreateModel( f506_local12, "description" )
				if f506_local11.description ~= nil then
					Engine.SetModelValue( f506_local14, "weapon_" .. f506_local11.description )
				end
			end
			for f506_local8 = f506_local6 + 1, CoD.CACUtility.maxAbilityWheelItems, 1 do
				f506_local5( Engine.CreateModel( f506_local1, "AbilityWheelWeapon" .. f506_local0[f506_local8] ) )
			end
			for f506_local8 = f506_local7 + 1, CoD.CACUtility.maxContextualAbilityItems, 1 do
				f506_local5( Engine.CreateModel( f506_local1, "AbilityWheelContextualWeapon" .. f506_local8 ) )
			end
			return f506_local1
		end
	},
	SwitchCameraWheel = {
		getModel = function ( f508_arg0 )
			local f508_local0 = {
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
			local f508_local1 = Engine.CreateModel( Engine.GetModelForController( f508_arg0 ), "SwitchCameraWheel" )
			Engine.CreateModel( f508_local1, "selectedCameraDisplayName" )
			Engine.CreateModel( f508_local1, "selectedCameraDisplayDesc" )
			Engine.SetModelValue( Engine.CreateModel( f508_local1, "name" ), Engine.ToUpper( Engine.Localize( "MENU_DEMO_CONTROLS_SWITCH_CAMERA" ) ) )
			for f508_local2 = 1, #f508_local0, 1 do
				local f508_local5 = f508_local0[f508_local2]
				local f508_local6 = Engine.CreateModel( f508_local1, "Camera" .. f508_local2 )
				Engine.SetModelValue( Engine.CreateModel( f508_local6, "displayName" ), Engine.Localize( f508_local5.displayName ) )
				Engine.SetModelValue( Engine.CreateModel( f508_local6, "description" ), Engine.Localize( f508_local5.displayName .. "_DESC" ) )
				Engine.SetModelValue( Engine.CreateModel( f508_local6, "image" ), f508_local5.image )
				Engine.SetModelValue( Engine.CreateModel( f508_local6, "disabled" ), f508_local5.disabled )
				Engine.SetModelValue( Engine.CreateModel( f508_local6, "cameraMode" ), f508_local5.cameraMode )
				if f508_local5.freeCameraMode ~= nil then
					Engine.SetModelValue( Engine.CreateModel( f508_local6, "freeCameraMode" ), f508_local5.freeCameraMode )
				end
			end
			return f508_local1
		end
	},
	CommsMessages = f0_local7( "CommsMessages", function ( f509_arg0 )
		local f509_local0 = {}
		for f509_local1 = 1, 5, 1 do
			table.insert( f509_local0, {
				models = {
					icon = "",
					messageText = ""
				},
				properties = {
					messageIndex = f509_local1
				}
			} )
		end
		return f509_local0
	end
	 ),
	CommsWidget = {
		getModel = function ( f510_arg0 )
			local f510_local0 = Engine.CreateModel( Engine.GetModelForController( f510_arg0 ), "CommsWidget" )
			Engine.SetModelValue( Engine.CreateModel( f510_local0, "characterName" ), "COOP_KANYE_RACHEL" )
			Engine.SetModelValue( Engine.CreateModel( f510_local0, "characterImage" ), "t7_cp_hud_commswidget_rachel" )
			return f510_local0
		end
	},
	VehicleInfo = {
		setButtonModels = function ( f511_arg0, f511_arg1, f511_arg2 )
			local f511_local0 = Engine.GetModel( Engine.GetModelForController( f511_arg0 ), "vehicle" )
			if not f511_local0 then
				return 
			end
			local f511_local1 = Engine.GetModel( f511_local0, "bindings" )
			if f511_local1 then
				Engine.UnsubscribeAndFreeModel( f511_local1 )
			end
			f511_local1 = Engine.CreateModel( f511_local0, "bindings" )
			Engine.SetModelValue( Engine.CreateModel( f511_local1, "color" ), f511_arg2 or "255 255 255" )
			if not f511_arg1 then
				f511_arg1 = {}
			end
			local f511_local2 = IsGamepad( f511_arg0 )
			if f511_local0 then
				local f511_local3 = {}
				for f511_local9, f511_local10 in ipairs( f511_arg1 ) do
					if f511_local10.bindCommand then
						local f511_local7, f511_local8 = Engine.GetBindingButtonString( f511_arg0, f511_local10.bindCommand )
						if f511_local7 then
							if f511_local2 then
								Engine.SetModelValue( Engine.CreateModel( f511_local1, f511_local7 .. ".text" ), f511_local10.text )
							end
							f511_local10.bindPlacement = f511_local7
						end
						if f511_local8 then
							if f511_local2 then
								Engine.SetModelValue( Engine.CreateModel( f511_local1, f511_local8 .. ".text" ), f511_local10.text )
							end
							f511_local10.bindPlacement2 = f511_local8
						end
					end
					f511_local3[f511_local9] = f511_local10
				end
				f511_local4 = function ( f512_arg0, f512_arg1 )
					local f512_local0 = Engine.CreateModel( f511_local0, f512_arg0 .. ".imageText" )
					if f512_arg1 then
						if f512_arg1.bindCommand and f512_arg1.bindCommand ~= "" then
							local f512_local1 = Engine.KeyBinding( f511_arg0, f512_arg1.bindCommand )
							Engine.SetModelValue( Engine.CreateModel( f511_local1, f512_arg0 .. ".bind" ), f512_local1 )
							Engine.SetModelValue( f512_local0, f512_local1 )
						else
							Engine.SetModelValue( f512_local0, f512_arg1.imageText or "" )
						end
					else
						Engine.SetModelValue( f512_local0, "" )
					end
					local f512_local1 = Engine.CreateModel( f511_local0, f512_arg0 .. ".text" )
					if f512_arg1 and f512_arg1.text and f512_arg1.text ~= "" then
						Engine.SetModelValue( Engine.CreateModel( f511_local1, f512_arg0 .. ".text" ), f512_arg1.text )
						Engine.SetModelValue( f512_local1, f512_arg1.text )
					else
						Engine.SetModelValue( f512_local1, "" )
					end
				end
				
				f511_local5 = function ( f513_arg0 )
					local f513_local0 = {}
					local f513_local1 = #f513_arg0
					for f513_local5, f513_local6 in ipairs( f513_arg0 ) do
						f513_local0[f513_local1 + 1 - f513_local5] = f513_local6
					end
					return f513_local0
				end
				
				f511_local6, f511_local9 = nil
				if CoD.isPC then
					f511_local6 = f511_local5( {
						"LEFT_3",
						"LEFT_2",
						"LEFT_1",
						"LEFT_0"
					} )
					f511_local9 = f511_local5( {
						"RIGHT_3",
						"RIGHT_2",
						"RIGHT_1",
						"RIGHT_0"
					} )
				else
					f511_local6 = f511_local5( {
						"topLeftButton",
						"middleLeftButton",
						"bottomLeftButton"
					} )
					f511_local9 = f511_local5( {
						"topRightButton",
						"middleRightButton",
						"bottomRightButton"
					} )
				end
				if f511_local2 then
					f511_local10 = {
						"L_STICK",
						"BUTTON_LSTICK",
						"BUTTON_LSHLDR",
						"BUTTON_LTRIG",
						"BUTTON_X",
						"BUTTON_A"
					}
					local f511_local7 = {
						"R_STICK",
						"BUTTON_RSTICK",
						"BUTTON_RSHLDR",
						"BUTTON_RTRIG"
					}
					local f511_local11 = function ( f514_arg0 )
						local f514_local0 = {}
						for f514_local4, f514_local5 in ipairs( f514_arg0 ) do
							if f514_local5.bindPlacement ~= nil then
								f514_local0[f514_local5.bindPlacement] = f514_local5
							end
						end
						return f514_local0
					end
					
					f511_local11 = f511_local11( f511_local3 )
					local f511_local12 = function ( f515_arg0, f515_arg1, f515_arg2 )
						for f515_local3, f515_local4 in ipairs( f515_arg0 ) do
							if f515_arg2[f515_local4] then
								f511_local4( f515_arg1[1], f515_arg2[f515_local4] )
								table.remove( f515_arg1, 1 )
								if #f515_arg1 == 0 then
									break
								end
							end
						end
						for f515_local3, f515_local4 in ipairs( f515_arg1 ) do
							f511_local4( f515_local4, nil )
						end
					end
					
					leftActions = f511_local5( f511_local10 )
					f511_local12( leftActions, f511_local6, f511_local11 )
					rightActions = f511_local5( f511_local7 )
					f511_local12( rightActions, f511_local9, f511_local11 )
				else
					f511_local10 = {
						"KEYBOARD_MOVE",
						"KEYBOARD_BUTTON",
						"left"
					}
					local f511_local7 = {
						"MOUSE_LOOK",
						"MOUSE_BUTTON",
						"right"
					}
					local f511_local8 = function ( f516_arg0, f516_arg1, f516_arg2 )
						local f516_local0 = function ( f517_arg0, f517_arg1 )
							for f517_local3, f517_local4 in ipairs( f517_arg0 ) do
								if f517_local4.bindCommand == "+lookstick" then
									table.remove( f517_arg0, f517_local3 )
								end
								if f517_local4.screenSide then
									if f517_local4.screenSide == f517_arg1 then
										table.remove( f517_arg0, f517_local3 )
										return f517_local4
									end
								end
								if f517_local4.bindPlacement == f517_arg1 then
									table.remove( f517_arg0, f517_local3 )
									return f517_local4
								end
							end
							return nil
						end
						
						for f516_local5, f516_local6 in ipairs( f516_arg0 ) do
							local f516_local4 = f516_local0( f516_arg2, f516_local6 )
							while f516_local4 ~= nil do
								f511_local4( f516_arg1[1], f516_local4 )
								table.remove( f516_arg1, 1 )
								if #f516_arg1 == 0 then
									
								end
								f516_local4 = f516_local0( f516_arg2, f516_local6 )
							end
						end
						for f516_local5, f516_local6 in ipairs( f516_arg1 ) do
							f511_local4( f516_local6, nil )
						end
					end
					
					leftActions = f511_local5( f511_local10 )
					f511_local8( leftActions, f511_local6, f511_local3 )
					rightActions = f511_local5( f511_local7 )
					f511_local8( rightActions, f511_local9, f511_local3 )
				end
			end
		end,
		clearButtonModels = function ( f518_arg0 )
			DataSources.VehicleInfo.setButtonModels( f518_arg0 )
		end
	},
	Attacker = {
		getModel = function ( f519_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f519_arg0 ), "Attacker" )
		end
	},
	Victim = {
		getModel = function ( f520_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f520_arg0 ), "Victim" )
		end
	},
	TopPlayerInfoData1 = {
		getModel = function ( f521_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f521_arg0 ), "topPlayerInfo1" )
		end
	},
	TopPlayerInfoData2 = {
		getModel = function ( f522_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f522_arg0 ), "topPlayerInfo2" )
		end
	},
	TopPlayerInfoData3 = {
		getModel = function ( f523_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f523_arg0 ), "topPlayerInfo3" )
		end
	},
	SocialTabs = f0_local7( "SocialTabs", function ( f524_arg0 )
		local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
		if modelValue == nil then
			modelValue = "friends"
		end
		local f524_local1 = false
		local f524_local2 = {}
		table.insert( f524_local2, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if CoD.isPC then
			local f524_local3 = table.insert
			local f524_local4 = f524_local2
			local f524_local5 = {
				models = {
					tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
					tabWidget = "CoD.Social_Party_PC"
				}
			}
			local f524_local6 = {
				tabId = "party",
				selectIndex = false
			}
			local f524_local7
			if Dvar.partyPrivacyEnabled:get() then
				f524_local7 = f524_local1
			else
				f524_local7 = true
			end
			f524_local6.disabled = f524_local7
			f524_local5.properties = f524_local6
			f524_local3( f524_local4, f524_local5 )
		else
			local f524_local3 = table.insert
			local f524_local4 = f524_local2
			local f524_local5 = {
				models = {
					tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
					tabWidget = "CoD.Social_Party"
				}
			}
			local f524_local6 = {
				tabId = "party",
				selectIndex = false
			}
			local f524_local7
			if Dvar.partyPrivacyEnabled:get() then
				f524_local7 = f524_local1
			else
				f524_local7 = true
			end
			f524_local6.disabled = f524_local7
			f524_local5.properties = f524_local6
			f524_local3( f524_local4, f524_local5 )
		end
		table.insert( f524_local2, {
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
			table.insert( f524_local2, {
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
		table.insert( f524_local2, {
			models = {
				tabName = Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ),
				tabWidget = "CoD.Social_RecentPlayers"
			},
			properties = {
				tabId = "recent",
				selectIndex = false
			}
		} )
		table.insert( f524_local2, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for f524_local3 = 1, #f524_local2, 1 do
			if f524_local2[f524_local3].properties ~= nil then
				if f524_local2[f524_local3].properties.tabId == modelValue then
					f524_local2[f524_local3].properties.selectIndex = true
				else
					f524_local2[f524_local3].properties.selectIndex = false
				end
			end
		end
		return f524_local2
	end
	, true ),
	SocialOnlinePlayersList = f0_local7( "SocialOnlinePlayersList", function ( f525_arg0 )
		local f525_local0 = {}
		local f525_local1 = Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE | Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY
		local f525_local2 = {}
		local f525_local3 = false
		local f525_local4 = false
		local f525_local5 = Engine.GetModelValue( Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) )
		if f525_local5 == "friends" then
			f525_local3 = false
			f525_local4 = false
			f525_local2 = Engine.GetOnlineFriendsList( f525_arg0, 0, 7, f525_local1 )
		elseif f525_local5 == "recent" then
			f525_local3 = true
			f525_local4 = true
			f525_local2 = Engine.GetRecentPlayersList( f525_arg0, 0, 7, f525_local1 )
		elseif f525_local5 == "party" then
			f525_local3 = false
			f525_local4 = false
			local f525_local6 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
			local f525_local7 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
			local f525_local8 = nil
			if f525_local7 and f525_local6.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
				f525_local8 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
			else
				f525_local8 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			end
			local f525_local9 = Engine.GetTitleData( Engine.GetPrimaryController() )
			for f525_local13, f525_local14 in ipairs( f525_local8.sessionClients ) do
				f525_local2[f525_local13] = {}
				local f525_local15 = f525_local2[f525_local13]
				f525_local15.xuid = f525_local14.xuid
				f525_local15.gamertag = f525_local14.gamertag
				f525_local15.clantag = f525_local14.clantag
				f525_local15.isLocal = f525_local14.isLocal
				f525_local15.activity = f525_local9.activity
				f525_local15.context = f525_local9.context
				f525_local15.joinable = Enum.LobbyJoinable.LOBBY_JOINABLE_NO_NOT_IN_LOBBY
				f525_local15.gametype = f525_local9.gametype
				f525_local15.mapid = f525_local9.mapid
				f525_local15.friend = 1
				f525_local15.titlePresence = ""
				f525_local15.cpRank = f525_local14.cpRank
				f525_local15.cpRankIcon = f525_local14.cpRankIcon
				f525_local15.mpRank = f525_local14.mpRank
				f525_local15.mpRankIcon = f525_local14.mpRankIcon
				f525_local15.zmRank = f525_local14.zmRank
				f525_local15.zmRankIcon = f525_local14.zmRankIcon
			end
		else
			f525_local2 = Engine.GetOnlineFriendsList( f525_arg0, 0, 7, f525_local1 )
		end
		for f525_local16 = 1, #f525_local2, 1 do
			local f525_local9 = f525_local2[f525_local16]
			local f525_local10 = ""
			local f525_local11 = string.format( "%s %s", f525_local10, f525_local9.gamertag )
			local f525_local12 = ""
			if f525_local4 then
				f525_local12 = f525_local9.titlePresence
			end
			local f525_local13 = "0"
			if f525_local9.isLocal == 1 then
				f525_local13 = "1"
			end
			table.insert( f525_local0, {
				models = {
					xuid = f525_local9.xuid,
					gamertag = f525_local9.gamertag,
					clantag = f525_local10,
					fullname = f525_local11,
					isLocal = f525_local13,
					activity = f525_local9.activity,
					context = f525_local9.context,
					difficulty = f525_local9.difficulty,
					playlist = f525_local9.playlist,
					joinable = f525_local9.joinable,
					gametype = f525_local9.gametype,
					mapid = f525_local9.mapid,
					friend = f525_local9.friend,
					titlePresence = f525_local12,
					cpRank = f525_local9.cpRank,
					cpRankIcon = f525_local9.cpRankIcon,
					mpRank = f525_local9.mpRank,
					mpRankIcon = f525_local9.mpRankIcon .. "_lrg",
					zmRank = f525_local9.zmRank,
					zmRankIcon = f525_local9.zmRankIcon
				},
				properties = {
					xuid = f525_local9.xuid,
					showyourfriend = f525_local3,
					showlastmet = f525_local4,
					gametype = f525_local9.gametype,
					mapid = f525_local9.mapid,
					difficulty = f525_local9.difficulty,
					playlist = f525_local9.playlist
				}
			} )
		end
		return f525_local0
	end
	, nil, nil, function ( f526_arg0, f526_arg1, f526_arg2 )
		local f526_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local f526_local1 = Engine.GetModelValue( Engine.GetModel( f526_local0, "tab" ) )
		local f526_local2 = Engine.GetModel( f526_local0, "friends" )
		if f526_local1 == "friends" then
			f526_local2 = Engine.GetModel( f526_local0, "friends" )
		elseif f526_local1 == "recent" then
			f526_local2 = Engine.GetModel( f526_local0, "recentPlayers" )
		elseif f526_local1 == "party" then
			f526_local2 = Engine.GetModel( f526_local0, "party" )
		end
		local f526_local3 = Engine.GetModel( f526_local2, "update" )
		if f526_arg1.socialUpdateSubscription then
			f526_arg1:removeSubscription( f526_arg1.socialUpdateSubscription )
		end
		f526_arg1.socialUpdateSubscription = f526_arg1:subscribeToModel( f526_local3, function ()
			f0_local9( f526_arg0, f526_arg1 )
		end, false )
		if f526_arg1.socialPartyUpdateSubscription then
			f526_arg1:removeSubscription( f526_arg1.socialPartyUpdateSubscription )
		end
		f526_arg1.socialPartyUpdateSubscription = f526_arg1:subscribeToModel( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" ), "privateClient" ), "update" ), function ()
			f0_local9( f526_arg0, f526_arg1 )
		end, false )
	end
	 ),
	SocialMainMenu = {
		getModel = function ( f529_arg0 )
			return Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu" )
		end
	},
	SocialPlayersList = {
		prepare = function ( f530_arg0, f530_arg1, f530_arg2 )
			f530_arg1.numElementsInList = f530_arg1.vCount
			f530_arg1.controller = f530_arg0
			f530_arg1.filter = Enum.PresenceFilter.PRESENCE_FILTER_ALL
			local f530_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
			local f530_local1 = Engine.GetModelValue( Engine.GetModel( f530_local0, "tab" ) )
			if f530_local1 == "friends" then
				f530_arg1.showyourfriend = false
				f530_arg1.showlastmet = false
				f530_arg1.GetList = Engine.GetFriends
				f530_arg1.GetParty = Engine.GetFriendPartry
				f530_arg1.playerCount = Engine.GetFriendsCount( f530_arg0, f530_arg1.filter )
				f530_arg1.socialSubModel = Engine.GetModel( f530_local0, "friends" )
			elseif f530_local1 == "recent" then
				f530_arg1.showyourfriend = true
				f530_arg1.showlastmet = true
				f530_arg1.GetList = Engine.GetRecentPlayersList
				f530_arg1.GetParty = Engine.GetGetRecentPlayerParty
				f530_arg1.playerCount = Engine.GetRecentPlayersCount( f530_arg0, f530_arg1.filter )
				f530_arg1.socialSubModel = Engine.GetModel( f530_local0, "recentPlayers" )
			else
				f530_arg1.showyourfriend = false
				f530_arg1.showlastmet = false
				f530_arg1.GetList = Engine.GetFriends
				f530_arg1.GetParty = Engine.GetFriendPartry
				f530_arg1.playerCount = Engine.GetFriendsCount( f530_arg0, f530_arg1.filter )
				f530_arg1.socialSubModel = Engine.GetModel( f530_local0, "friends" )
			end
			f530_arg1.players = {}
			local f530_local2 = {
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
			local f530_local3 = {
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
			for f530_local4 = 1, f530_arg1.numElementsInList, 1 do
				f530_arg1.players[f530_local4] = {}
				f530_arg1.players[f530_local4].root = Engine.CreateModel( f530_arg1.socialSubModel, "player_" .. f530_local4 )
				f530_arg1.players[f530_local4].model = Engine.CreateModel( f530_arg1.players[f530_local4].root, "model" )
				f530_arg1.players[f530_local4].properties = {
					xuid = 0,
					showyourfriend = 0,
					showlastmet = 0,
					gametype = 0,
					mapid = 0,
					difficulty = 0,
					playlist = 1
				}
				for f530_local10, f530_local11 in pairs( f530_local2 ) do
					local f530_local12 = Engine.CreateModel( f530_arg1.players[f530_local4].model, f530_local10 )
				end
			end
			f530_arg1.updateModels = function ( f531_arg0, f531_arg1, f531_arg2, f531_arg3 )
				if not f531_arg1.GetList then
					return 
				end
				local f531_local0 = {}
				f531_local0 = f531_arg1.GetList( f531_arg0, f531_arg2, f531_arg3, f531_arg1.filter )
				for f531_local1 = 1, #f531_local0, 1 do
					local f531_local4 = f531_local0[f531_local1]
					local f531_local5 = (f531_arg2 + f531_local1 - 1) % f531_arg1.numElementsInList + 1
					f531_local4.clantag = ""
					f531_local4.fullname = string.format( "%s%s", f531_local4.clantag, f531_local4.gamertag )
					if f531_arg1.showlastmet == 0 then
						f531_local4.titlePresence = ""
					end
					if LuaUtils.IsBetaBuild() then
						f531_local4.cpPlayed = false
						f531_local4.cpRank = 0
						f531_local4.cpPrestige = 0
						f531_local4.zmPlayed = false
						f531_local4.zmRank = 0
						f531_local4.zmPrestige = 0
					end
					f531_local4.cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", f531_local4.cpPlayed, f531_local4.cpRank, f531_local4.cpPrestige )
					f531_local4.mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", f531_local4.mpPlayed, f531_local4.mpRank, f531_local4.mpPrestige )
					f531_local4.zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", f531_local4.zmPlayed, f531_local4.zmRank, f531_local4.zmPrestige )
					for f531_local9, f531_local10 in pairs( f531_local4 ) do
						local f531_local11 = Engine.GetModel( f531_arg1.players[f531_local5].model, f531_local9 )
						if f531_local11 ~= nil then
							Engine.SetModelValue( f531_local11, f531_local10 )
						end
						if f531_arg1.players[f531_local5].properties[f531_local9] ~= nil then
							f531_arg1.players[f531_local5].properties[f531_local9] = f531_local10
						end
					end
					f531_arg1.players[f531_local5].properties.showlastmet = f531_arg1.showlastmet
					f531_arg1.players[f531_local5].properties.showyourfriend = f531_arg1.showyourfriend
					f531_local6 = f531_arg1.GetParty( f531_arg0, f531_arg2 + f531_local1 - 1 )
					f531_local7 = f531_local4.partyMembers
					f531_arg1.players[f531_local5].properties.party = {}
					if f531_local6.total == nil then
						f531_local6.total = f531_local6.totalCount
						f531_local6.available = f531_local6.availableCount
					end
					f531_arg1.players[f531_local5].properties.party.total = f531_local6.total
					f531_arg1.players[f531_local5].properties.party.available = f531_local6.available
					f531_arg1.players[f531_local5].properties.party.leader = f531_local6.leader
					if #f531_local6.members then
						f531_arg1.players[f531_local5].properties.party.members = {}
						for f531_local8 = 1, #f531_local6.members, 1 do
							f531_arg1.players[f531_local5].properties.party.members[f531_local8] = {}
							f531_arg1.players[f531_local5].properties.party.members[f531_local8].gamertag = f531_local6.members[f531_local8].gamertag
							f531_arg1.players[f531_local5].properties.party.members[f531_local8].leader = f531_local6.members[f531_local8].leader
						end
					end
				end
				return f531_arg1.players[f531_arg2 % f531_arg1.numElementsInList + 1].model
			end
			
			f530_arg1.updateModels( f530_arg0, f530_arg1, 0, f530_arg1.numElementsInList )
			local f530_local4 = Engine.GetModel( f530_arg1.socialSubModel, "update" )
			if f530_arg1.socialUpdateSubscription then
				f530_arg1:removeSubscription( f530_arg1.socialUpdateSubscription )
			end
			f530_arg1.socialUpdateSubscription = f530_arg1:subscribeToModel( f530_local4, function ()
				f0_local9( f530_arg0, f530_arg1 )
			end, false )
		end,
		getCount = function ( f533_arg0 )
			return f533_arg0.playerCount
		end,
		getItem = function ( f534_arg0, f534_arg1, f534_arg2 )
			local f534_local0 = f534_arg1.updateModels( f534_arg0, f534_arg1, f534_arg2 - 1, 1 )
			local f534_local1 = (f534_arg2 - 1)
			return f534_arg1.players[(f534_arg2 - 1) % f534_arg1.numElementsInList + 1].model
		end,
		getCustomPropertiesForItem = function ( f535_arg0, f535_arg1 )
			local f535_local0 = (f535_arg1 - 1)
			return f535_arg0.players[(f535_arg1 - 1) % f535_arg0.numElementsInList + 1].properties
		end
	},
	SocialPlayerPartyList = {
		prepare = function ( f536_arg0, f536_arg1, f536_arg2 )
			f536_arg1.numElementsInList = f536_arg1.vCount
			f536_arg1.controller = f536_arg0
			local f536_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
			f536_arg1.xuidModel = Engine.GetModel( Engine.GetModel( f536_local0, "cache" ), "xuid" )
			local f536_local1 = Engine.GetModel( f536_local0, "party" )
			f536_arg1.partyUpdate = Engine.CreateModel( f536_local1, "update" )
			local f536_local2 = Engine.GetModel( f536_local1, "available" )
			local f536_local3 = Engine.GetModel( f536_local1, "total" )
			local f536_local4 = Engine.GetModel( f536_local1, "leader" )
			f536_arg1.xuid = Engine.GetModelValue( f536_arg1.xuidModel, "xuid" )
			f536_arg1.available = Engine.GetModelValue( f536_local2 )
			f536_arg1.total = Engine.GetModelValue( f536_local3 )
			f536_arg1.leader = Engine.GetModelValue( f536_local4 )
			f536_arg1.partyMembers = {}
			for f536_local5 = 1, 18, 1 do
				f536_arg1.partyMembers[f536_local5] = Engine.GetModel( f536_local1, "pm_" .. f536_local5 )
			end
			if f536_arg1.selectedPlayerSubscription then
				f536_arg1:removeSubscription( f536_arg1.selectedPlayerSubscription )
			end
			f536_arg1.selectedPlayerSubscription = f536_arg1:subscribeToModel( f536_arg1.partyUpdate, function ()
				f536_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f538_arg0 )
			return f538_arg0.available
		end,
		getItem = function ( f539_arg0, f539_arg1, f539_arg2 )
			return f539_arg1.partyMembers[f539_arg2]
		end
	},
	AARTabs = f0_local7( "AARTabs", function ( f540_arg0 )
		local f540_local0 = {}
		table.insert( f540_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		if Engine.IsMultiplayerGame() then
			local f540_local1 = Engine.GetModel( Engine.GetModelForController( f540_arg0 ), "aarType" )
			if f540_local1 and Engine.GetModelValue( f540_local1 ) == "public" then
				table.insert( f540_local0, {
					models = {
						tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
						tabWidget = "CoD.PerformanceTabWidget"
					},
					properties = {
						tabId = "performance"
					}
				} )
			end
			table.insert( f540_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_MEDALS_CAPS" ),
					tabWidget = "CoD.MedalsTabWidget"
				},
				properties = {
					tabId = "medals"
				}
			} )
			table.insert( f540_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
					tabWidget = "CoD.ScoreboardTabWidget"
				},
				properties = {
					tabId = "scoreboard"
				}
			} )
		elseif Engine.IsCampaignGame() then
			table.insert( f540_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
					tabWidget = "CoD.PerformanceTabWidgetCP"
				},
				properties = {
					tabId = "performance"
				}
			} )
			table.insert( f540_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
					tabWidget = "CoD.ScoreboardTabWidgetCP"
				},
				properties = {
					tabId = "scoreboard"
				}
			} )
		elseif Engine.IsZombiesGame() then
			table.insert( f540_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_PERFORMANCE_CAPS" ),
					tabWidget = "CoD.PerformanceTabWidgetZM"
				},
				properties = {
					tabId = "performance"
				}
			} )
			table.insert( f540_local0, {
				models = {
					tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
					tabWidget = "CoD.ScoreboardTabWidgetZM"
				},
				properties = {
					tabId = "scoreboard"
				}
			} )
		end
		table.insert( f540_local0, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		return f540_local0
	end
	, true ),
	AARPerformanceTabStats = {
		getModel = function ( f541_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f541_arg0 ), "aarStats.performanceTabStats" )
		end
	},
	AARSPMGraph = {
		getModel = function ( f542_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f542_arg0 ), "aarStats.performanceTabStats.spmGraph" )
		end
	},
	AARKDRGraph = {
		getModel = function ( f543_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f543_arg0 ), "aarStats.performanceTabStats.kdrGraph" )
		end
	},
	Scoreboard = {
		getModel = function ( f544_arg0 )
			return Engine.CreateModel( Engine.GetModelForController( f544_arg0 ), "scoreboardInfo" )
		end
	},
	ScoreboardTeam1ListCP = f0_local7( "scoreboardTeam1ListCP", function ( f545_arg0 )
		return CoD.AARUtilityCP.GetScoreboardTeamTable( f545_arg0, 1 )
	end
	 ),
	ScoreboardTeam1List = {
		prepare = function ( f546_arg0, f546_arg1, f546_arg2 )
			f546_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
			if f546_arg1.teamCountSubscription then
				f546_arg1:removeSubscription( f546_arg1.teamCountSubscription )
			end
			f546_arg1.teamCountSubscription = f546_arg1:subscribeToModel( Engine.GetModel( f546_arg1.scoreboardInfoModel, "count" ), function ()
				f546_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f548_arg0 )
			return math.max( Engine.GetModelValue( Engine.GetModel( f548_arg0.scoreboardInfoModel, "count" ) ), CoD.ScoreboardUtility.MinRowsToShowOnEachTeam )
		end,
		getItem = function ( f549_arg0, f549_arg1, f549_arg2 )
			return Engine.GetModel( f549_arg1.scoreboardInfoModel, f549_arg2 - 1 )
		end
	},
	ScoreboardTeam2List = {
		prepare = function ( f550_arg0, f550_arg1, f550_arg2 )
			f550_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
			if f550_arg1.teamCountSubscription then
				f550_arg1:removeSubscription( f550_arg1.teamCountSubscription )
			end
			f550_arg1.teamCountSubscription = f550_arg1:subscribeToModel( Engine.GetModel( f550_arg1.scoreboardInfoModel, "count" ), function ()
				f550_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f552_arg0 )
			if IsGameTypeDOA() then
				return 0
			else
				return math.max( Engine.GetModelValue( Engine.GetModel( f552_arg0.scoreboardInfoModel, "count" ) ), CoD.ScoreboardUtility.MinRowsToShowOnEachTeam )
			end
		end,
		getItem = function ( f553_arg0, f553_arg1, f553_arg2 )
			return Engine.GetModel( f553_arg1.scoreboardInfoModel, f553_arg2 - 1 )
		end
	},
	CodCasterScoreboardTeam1List = {
		prepare = function ( f554_arg0, f554_arg1, f554_arg2 )
			f554_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
			if f554_arg1.teamCountSubscription then
				f554_arg1:removeSubscription( f554_arg1.teamCountSubscription )
			end
			f554_arg1.teamCountSubscription = f554_arg1:subscribeToModel( Engine.GetModel( f554_arg1.scoreboardInfoModel, "count" ), function ()
				f554_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f556_arg0 )
			return math.max( Engine.GetModelValue( Engine.GetModel( f556_arg0.scoreboardInfoModel, "count" ) ), 0 )
		end,
		getItem = function ( f557_arg0, f557_arg1, f557_arg2 )
			return Engine.GetModel( f557_arg1.scoreboardInfoModel, f557_arg2 - 1 )
		end
	},
	CodCasterScoreboardTeam2List = {
		prepare = function ( f558_arg0, f558_arg1, f558_arg2 )
			f558_arg1.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
			if f558_arg1.teamCountSubscription then
				f558_arg1:removeSubscription( f558_arg1.teamCountSubscription )
			end
			f558_arg1.teamCountSubscription = f558_arg1:subscribeToModel( Engine.GetModel( f558_arg1.scoreboardInfoModel, "count" ), function ()
				f558_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f560_arg0 )
			return math.max( Engine.GetModelValue( Engine.GetModel( f560_arg0.scoreboardInfoModel, "count" ) ), 0 )
		end,
		getItem = function ( f561_arg0, f561_arg1, f561_arg2 )
			return Engine.GetModel( f561_arg1.scoreboardInfoModel, f561_arg2 - 1 )
		end
	},
	FreeRun = {
		getModel = function ( f562_arg0 )
			local f562_local0 = Engine.CreateModel( Engine.GetModelForController( f562_arg0 ), "FreeRun" )
			Engine.SetModelValue( Engine.CreateModel( f562_local0, "runState" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local0, "startTime" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local0, "deltaTime" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local0, "finishTime" ), 0 )
			local f562_local1 = Engine.CreateModel( f562_local0, "topScore" )
			Engine.SetModelValue( Engine.CreateModel( f562_local1, "topScore1" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local1, "topScore2" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local1, "topScore3" ), 0 )
			local f562_local2 = Engine.CreateModel( f562_local0, "distanceBar" )
			Engine.SetModelValue( Engine.CreateModel( f562_local2, "completion" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local2, "ghostCompletion" ), 0 )
			local f562_local3 = Engine.CreateModel( f562_local0, "freeRunInfo" )
			Engine.SetModelValue( Engine.CreateModel( f562_local3, "bestTime" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local3, "faults" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local3, "retries" ), 0 )
			local f562_local4 = Engine.CreateModel( f562_local0, "timer" )
			Engine.SetModelValue( Engine.CreateModel( f562_local4, "currentTime" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f562_local4, "timeAdjustment" ), 0 )
			return f562_local0
		end
	},
	RewardsCarousel = {
		prepare = function ( f563_arg0, f563_arg1, f563_arg2 )
			if Engine.IsMultiplayerGame() then
				CoD.AARUtility.CreateModelsForRewards( f563_arg0 )
			else
				CoD.AARUtilityCP.CreateModelsForRewards( f563_arg0 )
			end
		end,
		getCount = function ( f564_arg0 )
			if Engine.IsMultiplayerGame() then
				return CoD.AARUtility.GetRewardItemCount( f564_arg0 )
			else
				return CoD.AARUtilityCP.GetRewardItemCount( f564_arg0 )
			end
		end,
		getItem = function ( f565_arg0, f565_arg1, f565_arg2 )
			if Engine.IsMultiplayerGame() then
				return CoD.AARUtility.GetModelForRewardItemByIndex( f565_arg0, f565_arg2 )
			else
				return CoD.AARUtilityCP.GetModelForRewardItemByIndex( f565_arg0, f565_arg2 )
			end
		end
	},
	ZmPlayerStyles = {
		prepare = function ( f566_arg0, f566_arg1, f566_arg2 )
			
		end,
		getCount = function ( f567_arg0 )
			return 0
		end,
		getItem = function ( f568_arg0, f568_arg1, f568_arg2 )
			return nil
		end
	},
	DropdownListTest = {
		prepare = function ( f569_arg0, f569_arg1, f569_arg2 )
			local f569_local0 = 25
			for f569_local1 = 1, f569_local0, 1 do
				Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f569_arg0 ), "DropdownTest.dropdownListTestModel" .. f569_local1 ), "itemName" ), "Random Value " .. f569_local1 )
			end
		end,
		getCount = function ( f570_arg0 )
			return 25
		end,
		getItem = function ( f571_arg0, f571_arg1, f571_arg2 )
			return Engine.CreateModel( Engine.GetModelForController( f571_arg0 ), "DropdownTest.dropdownListTestModel" .. f571_arg2 )
		end
	},
	DeadSpectate = {
		getModel = function ( f572_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f572_arg0 ), "deadSpectator" )
		end
	},
	DebugSessionSearchQoSJoin = f0_local7( "DebugSessionSearchQoSJoin", function ( f573_arg0 )
		if not Dvar.ui_lobbyDebugSessionSQJ:exists() or Dvar.ui_lobbyDebugSessionSQJ:get() == false then
			return {}
		end
		local f573_local0 = function ( f574_arg0, f574_arg1 )
			return Engine.GetModelValue( Engine.GetModel( f574_arg0, f574_arg1 ) )
		end
		
		local f573_local1 = function ( f575_arg0 )
			local f575_local0 = math.mod( f575_arg0, 3 )
			local f575_local1 = ColorSet.SelectedGreen
			if f575_local0 == 0 then
				f575_local1 = ColorSet.CoreMartial
			elseif f575_local0 == 1 then
				f575_local1 = ColorSet.ResistanceHigh
			end
			return string.format( "%d %d %d", f575_local1.r * 255, f575_local1.g * 255, f575_local1.b * 255 )
		end
		
		local f573_local2 = {}
		Engine.LobbyVM_CallFunc( "SessionSQJRefreshInfo", {
			controller = f573_arg0
		} )
		local f573_local3 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "debug" ), "sessionSQJ" )
		local f573_local4 = f573_local0( f573_local3, "searchStage" )
		local f573_local5 = Engine.GetModel( f573_local3, "results" )
		for f573_local6 = 1, f573_local4, 1 do
			local f573_local9 = f573_local1( f573_local6 )
			local f573_local10 = Engine.GetModel( f573_local5, tostring( f573_local6 ) )
			local f573_local11 = f573_local0( f573_local10, "numResults" )
			if f573_local11 == 0 then
				table.insert( f573_local2, {
					models = {
						noResults = "NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS",
						xuid = "",
						gamertag = "",
						publicIPAddress = "",
						privateIPAddress = "",
						natType = "",
						qosPing = "",
						status = "",
						searchStageColor = f573_local9
					},
					properties = {
						disabled = false
					}
				} )
			end
			local f573_local12 = Engine.GetModel( f573_local10, "data" )
			for f573_local13 = 1, f573_local11, 1 do
				local f573_local16 = Engine.GetModel( f573_local12, tostring( f573_local13 ) )
				local f573_local17 = f573_local0( f573_local16, "xuidstr" ) or "0"
				local f573_local18 = f573_local0( f573_local16, "gamertag" ) or ""
				local f573_local19 = f573_local0( f573_local16, "publicIPAddress" )
				local f573_local20 = string.find( f573_local19, ":" )
				if f573_local19 then
					f573_local19 = string.sub( f573_local19, 0, string.find( f573_local19, ":" ) - 1 )
				else
					f573_local19 = "0.0.0.0"
				end
				local f573_local21 = f573_local0( f573_local16, "privateIPAddress" )
				if f573_local21 then
					f573_local21 = string.sub( f573_local21, 0, string.find( f573_local21, ":" ) - 1 )
				else
					f573_local21 = "0.0.0.0"
				end
				table.insert( f573_local2, {
					models = {
						noResults = "",
						xuid = f573_local17,
						gamertag = f573_local18,
						publicIPAddress = f573_local19,
						privateIPAddress = f573_local21,
						natType = f573_local0( f573_local16, "natType" ) or "UNKNOWN",
						qosPing = f573_local0( f573_local16, "ping" ) or "??? ms",
						status = f573_local0( f573_local16, "status" ) or " ------- ",
						searchStageColor = f573_local9
					},
					properties = {
						disabled = false
					}
				} )
			end
		end
		return f573_local2
	end
	, nil, nil, function ( f576_arg0, f576_arg1, f576_arg2 )
		f576_arg1.updateModel = Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "debug" ), "sessionSQJ" ), "update" )
		Engine.SetModelValue( f576_arg1.updateModel, 0 )
		if f576_arg1.updateSubscription then
			f576_arg1:removeSubscription( f576_arg1.updateSubscription )
		end
		f576_arg1.updateSubscription = f576_arg1:subscribeToModel( f576_arg1.updateModel, function ()
			f576_arg1:updateDataSource()
		end, false )
	end
	 ),
	LeaveLobbyPopup = {
		getModel = function ( f578_arg0 )
			local f578_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
			Engine.CreateModel( f578_local0, "popupType" )
			Engine.CreateModel( f578_local0, "title" )
			Engine.CreateModel( f578_local0, "hint" )
			return f578_local0
		end
	},
	LeaveLobbyPopupButtons = f0_local7( "LeaveLobbyPopupButtons", function ( f579_arg0 )
		local modelValue = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" ), "popupType" ) )
		local f579_local1 = {
			controller = f579_arg0
		}
		local f579_local2 = function ( f580_arg0, f580_arg1, f580_arg2, f580_arg3 )
			local f580_local0 = GoBack( f580_arg0, f580_arg2 )
			if f580_arg3 == nil then
				return 
			else
				f580_local0.ClientList:processEvent( {
					name = "lose_focus",
					controller = f580_arg2
				} )
				f579_local1.withParty = f580_arg3
				Engine.LobbyVM_CallFunc( "GoBack", f579_local1 )
			end
		end
		
		local f579_local3 = function ( f581_arg0, f581_arg1, f581_arg2, f581_arg3 )
			GoBackToMenu( f581_arg0, f581_arg2, "Lobby" )
			Engine.LobbyVM_CallFunc( "ManagePartyLeave", f579_local1 )
		end
		
		local f579_local4 = function ( f582_arg0, f582_arg1, f582_arg2, f582_arg3, f582_arg4 )
			table.insert( f582_arg0, {
				optionDisplay = f582_arg2,
				action = f582_arg3,
				param = f582_arg4,
				customId = f582_arg1,
				isLargeButton = true,
				isLastButtonInGroup = false,
				disabled = false
			} )
		end
		
		local f579_local5 = {}
		if modelValue == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
			f579_local4( f579_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_PARTY", f579_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		elseif modelValue == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
			f579_local4( f579_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_AND_DISBAND_PARTY", f579_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		elseif modelValue == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
			f579_local4( f579_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY", f579_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		elseif modelValue == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
			f579_local4( f579_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY_AND_PARTY", f579_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
		elseif modelValue == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
			f579_local4( f579_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_ALONE", f579_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
			f579_local4( f579_local5, "btnWith", "MENU_LEAVE_LOBBY_BRING_PARTY", f579_local2, LuaEnums.LEAVE_WITH_PARTY.WITH )
		elseif modelValue == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
			f579_local4( f579_local5, "btnWithout", "MENU_CONFIRM_CAPS", f579_local3, nil )
		end
		f579_local4( f579_local5, "btnCancel", "MENU_LEAVE_LOBBY_CANCEL", f579_local2, nil )
		local f579_local6 = {}
		for f579_local10, f579_local11 in ipairs( f579_local5 ) do
			table.insert( f579_local6, {
				models = {
					displayText = Engine.Localize( f579_local11.optionDisplay ),
					customId = f579_local11.customId
				},
				properties = {
					disabled = f579_local11.disabled,
					action = f579_local11.action,
					actionParam = f579_local11.param,
					isLastButtonInGroup = f579_local11.isLastButtonInGroup
				}
			} )
		end
		return f579_local6
	end
	, nil, nil, function ( f583_arg0, f583_arg1, f583_arg2 )
		
	end
	 ),
	Blackhat = {
		getModel = function ( f584_arg0 )
			return Engine.GetModel( Engine.GetModelForController( f584_arg0 ), "hudItems.blackhat" )
		end
	},
	BrightnessSelector = {
		getCount = function ( f585_arg0 )
			return 17
		end,
		getItem = function ( f586_arg0, f586_arg1, f586_arg2 )
			return Engine.CreateModel( Engine.GetModelForController( f586_arg0 ), "brightnessSelector" )
		end,
		getCustomPropertiesForItem = function ( f587_arg0, f587_arg1 )
			if f587_arg1 == 9 then
				return {
					selectIndex = true
				}
			else
				return {}
			end
		end
	},
	BrightnessSettingsImageColor = {
		getModel = function ( f588_arg0 )
			local f588_local0 = Engine.CreateModel( Engine.GetModelForController( f588_arg0 ), "brightnessSelector" )
			Engine.CreateModel( f588_local0, "imageColor" )
			return f588_local0
		end
	},
	ChatClientGlobal = {
		getModel = function ( f589_arg0 )
			local f589_local0 = CoD.ChatClientUtility.GetChatClientGlobalModel()
			CoD.ChatClientUtility.ResetAllModels( f589_arg0 )
			return f589_local0
		end
	},
	ChatClientEntriesList = {
		prepare = function ( f590_arg0, f590_arg1, f590_arg2 )
			f590_arg1.numElementsInList = f590_arg1.vCount
			f590_arg1.controller = f590_arg0
			f590_arg1.chatClientEntriesModel = CoD.ChatClientUtility.GetChatEntriesListModel()
			f590_arg1.filter = Engine.ChatClient_FilterChannelGet( f590_arg0, Enum.chatChannel_e.CHAT_CHANNEL_COUNT )
			f590_arg1.GetList = Engine.ChatClient_GetEntries
			f590_arg1.CountEntries = Engine.ChatClient_EntriesCount( f590_arg0, f590_arg1.filter )
			local f590_local0 = {
				xuid = 0,
				fullname = "",
				text = "",
				timestamp = "",
				timeMs = 0,
				chText = "",
				chColor = ""
			}
			f590_arg1.chatEntries = {}
			for f590_local1 = 1, f590_arg1.numElementsInList, 1 do
				f590_arg1.chatEntries[f590_local1] = {}
				f590_arg1.chatEntries[f590_local1].root = Engine.CreateModel( f590_arg1.chatClientEntriesModel, "entry_" .. f590_local1 )
				f590_arg1.chatEntries[f590_local1].model = Engine.CreateModel( f590_arg1.chatEntries[f590_local1].root, "model" )
				f590_arg1.chatEntries[f590_local1].properties = {}
				for f590_local7, f590_local8 in pairs( f590_local0 ) do
					local f590_local9 = Engine.CreateModel( f590_arg1.chatEntries[f590_local1].model, f590_local7 )
				end
			end
			f590_arg1.updateModels = function ( f591_arg0, f591_arg1, f591_arg2, f591_arg3 )
				if not f591_arg1.GetList then
					return 
				end
				local f591_local0 = {}
				f591_local0 = f591_arg1.GetList( f591_arg0, f591_arg2, f591_arg3, f591_arg1.filter )
				if f591_local0 then
					for f591_local1 = 1, #f591_local0, 1 do
						local f591_local4 = f591_local0[f591_local1]
						local f591_local5 = #f591_local0 + 1 - f591_local1
						for f591_local9, f591_local10 in pairs( f591_local4 ) do
							local f591_local11 = Engine.GetModel( f591_arg1.chatEntries[f591_local5].model, f591_local9 )
							if f591_local11 ~= nil then
								Engine.SetModelValue( f591_local11, f591_local10 )
							end
							f591_arg1.chatEntries[f591_local5].properties[f591_local9] = f591_local10
						end
					end
				end
				return f591_arg1.chatEntries[f591_arg2 % f591_arg1.numElementsInList + 1].model
			end
			
			f590_arg1.updateModels( f590_arg0, f590_arg1, 0, f590_arg1.numElementsInList )
			if f590_arg1.updateSubscription then
				f590_arg1:removeSubscription( f590_arg1.updateSubscription )
			end
			f590_arg1.updateSubscription = f590_arg1:subscribeToModel( CoD.ChatClientUtility.GetUpdateModel(), function ()
				f590_arg1:updateDataSource()
			end, false )
		end,
		getCount = function ( f593_arg0 )
			return f593_arg0.CountEntries
		end,
		getItem = function ( f594_arg0, f594_arg1, f594_arg2 )
			return f594_arg1.chatEntries[f594_arg2].model
		end
	},
	FirstTimeLanguageSelection = f0_local7( "FirstTimeLanguageSelection", function ( f595_arg0 )
		local f595_local0 = {}
		if IsArabicSku() then
			table.insert( f595_local0, {
				models = {
					image = "uie_language_english",
					action = ChangeLanguage,
					param = "english"
				}
			} )
			table.insert( f595_local0, {
				models = {
					image = "uie_language_arabic",
					action = ChangeLanguage,
					param = "arabic"
				}
			} )
		elseif IsJapaneseSku() then
			table.insert( f595_local0, {
				models = {
					image = "uie_language_japanese",
					action = ChangeLanguage,
					param = "fulljapanese"
				}
			} )
			table.insert( f595_local0, {
				models = {
					image = "uie_language_english_with_japanese_subtitles",
					action = ChangeLanguage,
					param = "japanese"
				}
			} )
		elseif IsChineseSku() then
			table.insert( f595_local0, {
				models = {
					image = "uie_language_english",
					action = ChangeLanguage,
					param = "english"
				}
			} )
			table.insert( f595_local0, {
				models = {
					image = "uie_language_simplified_chinese",
					action = ChangeLanguage,
					param = "simplifiedchinese"
				}
			} )
			table.insert( f595_local0, {
				models = {
					image = "uie_language_traditional_chinese",
					action = ChangeLanguage,
					param = "traditionalchinese"
				}
			} )
		end
		return f595_local0
	end
	 )
}
DataSources.GlobalSources.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.GlobalSources" )
DataSources.Controller.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.Controller" )
DataSources.VehicleController.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.VehicleController" )
local f0_local10 = function ( f596_arg0, f596_arg1, f596_arg2, f596_arg3 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, f596_arg1 ), f596_arg2 )
	Engine.SetModelValue( Engine.CreateModel( DataSources.VehicleController.Model, f596_arg1 ), f596_arg3 or f596_arg2 )
end

local f0_local11 = function ( f597_arg0, f597_arg1 )
	if f597_arg0 ~= 0 then
		return 
	elseif f597_arg1 == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO then
		f0_local10( f597_arg0, "primary_button_image", "xenonbutton_a" )
		f0_local10( f597_arg0, "secondary_button_image", "xenonbutton_b" )
		f0_local10( f597_arg0, "alt1_button_image", "xenonbutton_x" )
		f0_local10( f597_arg0, "alt2_button_image", "xenonbutton_y" )
		f0_local10( f597_arg0, "back_button_image", "xenonbutton_back" )
		f0_local10( f597_arg0, "start_button_image", "xenonbutton_start" )
		f0_local10( f597_arg0, "left_shoulder_button_image", "xenonbutton_lb", "t7_icons_controller_lbwhite" )
		f0_local10( f597_arg0, "left_shoulder_button_image_glow", "uie_t7_icons_controller_durango_lb_glow" )
		f0_local10( f597_arg0, "right_shoulder_button_image", "xenonbutton_rb", "t7_icons_controller_rbwhite" )
		f0_local10( f597_arg0, "right_shoulder_button_image_glow", "uie_t7_icons_controller_durango_rb_glow" )
		f0_local10( f597_arg0, "left_stick_button_image", "ui_button_xenon_stick_ani_32_Ldown" )
		f0_local10( f597_arg0, "right_stick_button_image", "ui_button_xenon_stick_ani_32_Rdown" )
		f0_local10( f597_arg0, "left_trigger_button_image", "xenonbutton_lt", "t7_icons_controller_ltwhite" )
		f0_local10( f597_arg0, "right_trigger_button_image", "xenonbutton_rt", "t7_icons_controller_rtwhite" )
		f0_local10( f597_arg0, "dpad_lr_button_image", "xenonbutton_dpad_rl" )
		f0_local10( f597_arg0, "dpad_ud_button_image", "xenonbutton_dpad_ud" )
		f0_local10( f597_arg0, "dpad_up_button_image", "xenonbutton_dpad_up" )
		f0_local10( f597_arg0, "dpad_down_button_image", "xenonbutton_dpad_down" )
		f0_local10( f597_arg0, "dpad_left_button_image", "xenonbutton_dpad_left" )
		f0_local10( f597_arg0, "dpad_right_button_image", "xenonbutton_dpad_right" )
		f0_local10( f597_arg0, "left_stick_move_image", "t7_icons_controller_ls" )
		f0_local10( f597_arg0, "right_stick_move_image", "t7_icons_controller_rs" )
	elseif f597_arg1 == Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS then
		f0_local10( f597_arg0, "primary_button_image", "ps3button_x" )
		f0_local10( f597_arg0, "secondary_button_image", "ps3button_circle" )
		f0_local10( f597_arg0, "alt1_button_image", "ps3button_square" )
		f0_local10( f597_arg0, "alt2_button_image", "ps3button_triangle" )
		f0_local10( f597_arg0, "back_button_image", "ps3button_select" )
		f0_local10( f597_arg0, "start_button_image", "ps3button_start" )
		f0_local10( f597_arg0, "left_shoulder_button_image", "ps3button_l1", "t7_icons_controller_lbwhite" )
		f0_local10( f597_arg0, "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
		f0_local10( f597_arg0, "right_shoulder_button_image", "ps3button_r1", "t7_icons_controller_rbwhite" )
		f0_local10( f597_arg0, "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
		f0_local10( f597_arg0, "left_stick_button_image", "ps3button_l3" )
		f0_local10( f597_arg0, "right_stick_button_image", "ps3button_r3" )
		f0_local10( f597_arg0, "left_trigger_button_image", "ps3button_l2", "t7_icons_controller_ltwhite" )
		f0_local10( f597_arg0, "right_trigger_button_image", "ps3button_r2", "t7_icons_controller_rtwhite" )
		f0_local10( f597_arg0, "dpad_lr_button_image", "ps3button_dpad_rl" )
		f0_local10( f597_arg0, "dpad_ud_button_image", "ps3button_dpad_ud" )
		f0_local10( f597_arg0, "dpad_up_button_image", "ps3button_dpad_up" )
		f0_local10( f597_arg0, "dpad_down_button_image", "ps3button_dpad_down" )
		f0_local10( f597_arg0, "dpad_left_button_image", "ps3button_dpad_left" )
		f0_local10( f597_arg0, "dpad_right_button_image", "ps3button_dpad_right" )
		f0_local10( f597_arg0, "left_stick_move_image", "t7_icons_controller_ls" )
		f0_local10( f597_arg0, "right_stick_move_image", "t7_icons_controller_rs" )
	else
		f0_local10( f597_arg0, "primary_button_image", "ps3button_x" )
		f0_local10( f597_arg0, "secondary_button_image", "ps3button_circle" )
		f0_local10( f597_arg0, "alt1_button_image", "ps3button_square" )
		f0_local10( f597_arg0, "alt2_button_image", "ps3button_triangle" )
		f0_local10( f597_arg0, "back_button_image", "ps3button_select" )
		f0_local10( f597_arg0, "start_button_image", "ps3button_start" )
		f0_local10( f597_arg0, "left_shoulder_button_image", "ps3button_l1", "t7_icons_controller_lbwhite" )
		f0_local10( f597_arg0, "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
		f0_local10( f597_arg0, "right_shoulder_button_image", "ps3button_r1", "t7_icons_controller_rbwhite" )
		f0_local10( f597_arg0, "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
		f0_local10( f597_arg0, "left_stick_button_image", "ps3button_l3" )
		f0_local10( f597_arg0, "right_stick_button_image", "ps3button_r3" )
		f0_local10( f597_arg0, "left_trigger_button_image", "ps3button_l2", "t7_icons_controller_ltwhite" )
		f0_local10( f597_arg0, "right_trigger_button_image", "ps3button_r2", "t7_icons_controller_rtwhite" )
		f0_local10( f597_arg0, "dpad_lr_button_image", "ps3button_dpad_rl" )
		f0_local10( f597_arg0, "dpad_ud_button_image", "ps3button_dpad_ud" )
		f0_local10( f597_arg0, "dpad_up_button_image", "ps3button_dpad_up" )
		f0_local10( f597_arg0, "dpad_down_button_image", "ps3button_dpad_down" )
		f0_local10( f597_arg0, "dpad_left_button_image", "ps3button_dpad_left" )
		f0_local10( f597_arg0, "dpad_right_button_image", "ps3button_dpad_right" )
		f0_local10( f597_arg0, "left_stick_move_image", "t7_icons_controller_ls" )
		f0_local10( f597_arg0, "right_stick_move_image", "t7_icons_controller_rs" )
	end
end

f0_local11( 0, Engine.GamepadType( 0 ) )
for f0_local12 = 0, Engine.GetMaxControllerCount() - 1, 1 do
	local f0_local15 = f0_local12
	local f0_local16 = Engine.GetModelForController( f0_local15 )
	Engine.CreateModel( f0_local16, "hintText" )
	Engine.SetModelValue( Engine.CreateModel( f0_local16, "clanTag" ), "" )
	if CoD.isPC and CoD.useController then
		if DataSourceHelpers.ControllerTypeSubscription == nil then
			DataSourceHelpers.ControllerTypeSubscription = {}
		end
		if DataSourceHelpers.ControllerTypeSubscription[f0_local15] == nil then
			DataSourceHelpers.ControllerTypeSubscription[f0_local15] = LUI.UIElement.new()
		end
		DataSourceHelpers.ControllerTypeSubscription[f0_local15]:unsubscribeFromAllModels()
		DataSourceHelpers.ControllerTypeSubscription[f0_local15]:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f0_local15 ), "ControllerType" ), function ( model )
			f0_local11( f0_local15, Engine.GamepadType( f0_local15 ) )
		end, false )
	end
	Engine.CreateModel( f0_local16, "WorldSpaceIndicators" )
	local f0_local17 = Engine.CreateModel( f0_local16, "scriptNotify" )
	Engine.SetModelValue( Engine.CreateModel( f0_local17, "numArgs" ), 0 )
	Engine.SetModelValue( f0_local17, "" )
	Engine.CreateModel( f0_local16, "playerConnected" )
	Engine.CreateModel( f0_local16, "playerDisconnected" )
	local f0_local18 = Engine.CreateModel( f0_local16, "hudItems" )
	Engine.CreateModel( f0_local18, "stickyImage" )
	Engine.CreateModel( f0_local18, "shockImageBottom" )
	Engine.CreateModel( f0_local18, "shockImageRight" )
	Engine.CreateModel( f0_local18, "shockImageLeft" )
	Engine.CreateModel( f0_local18, "shockImageTop" )
	Engine.CreateModel( f0_local18, "showCursorHint" )
	Engine.CreateModel( f0_local18, "cursorHintImage" )
	Engine.CreateModel( f0_local18, "cursorHintText" )
	Engine.CreateModel( f0_local18, "cursorHintTextLine2" )
	Engine.CreateModel( f0_local18, "cursorHintIconRatio" )
	Engine.CreateModel( f0_local18, "cursorHintIconFlip" )
	Engine.CreateModel( f0_local18, "sixthsense" )
	Engine.CreateModel( f0_local18, "outOfBoundsEndTime" )
	Engine.CreateModel( f0_local18, "pulseNoAmmo" )
	Engine.CreateModel( f0_local18, "pulseNoLethal" )
	Engine.CreateModel( f0_local18, "pulseNoTactical" )
	Engine.CreateModel( f0_local18, "armorOverlay" )
	Engine.CreateModel( f0_local18, "armorPercent" )
	Engine.CreateModel( f0_local18, "health" )
	Engine.CreateModel( f0_local18, "regenDelayProgress" )
	Engine.CreateModel( f0_local18, "showDamageWidget" )
	Engine.CreateModel( f0_local18, "cybercomActiveType" )
	Engine.CreateModel( f0_local18, "playerSpawned" )
	Engine.CreateModel( f0_local18, "ammoPickedUp" )
	local f0_local19 = Engine.CreateModel( f0_local18, "voipInfo" )
	for f0_local20 = 1, 4, 1 do
		local f0_local23 = Engine.CreateModel( f0_local19, "voip" .. f0_local20 )
		Engine.SetModelValue( Engine.CreateModel( f0_local23, "status" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f0_local23, "name" ), "" )
	end
	local f0_local20 = Engine.CreateModel( f0_local16, "CTF" )
	Engine.CreateModel( f0_local20, "friendlyFlagCarrier" )
	Engine.CreateModel( f0_local20, "friendlyFlagAway" )
	Engine.CreateModel( f0_local20, "enemyFlagCarrier" )
	Engine.CreateModel( f0_local20, "enemyFlagAway" )
	if not CoD.isFrontend and not CoD.isCampaign and CoD.isZombie then
		Engine.CreateModel( f0_local16, "bgb_current" )
		Engine.CreateModel( f0_local16, "bgb_display" )
		Engine.CreateModel( f0_local16, "bgb_timer" )
		Engine.CreateModel( f0_local16, "bgb_activations_remaining" )
		Engine.CreateModel( f0_local16, "bgb_invalid_use" )
		Engine.CreateModel( f0_local16, "bgb_one_shot_use" )
	end
	local f0_local21 = Engine.CreateModel( f0_local18, "console" )
	Engine.SetModelValue( Engine.CreateModel( f0_local21, "currentIndex" ), 0 )
	for f0_local22 = 0, 6, 1 do
		local f0_local25 = Engine.CreateModel( f0_local21, "line" .. f0_local22 )
		Engine.CreateModel( f0_local25, "text0" )
		Engine.CreateModel( f0_local25, "text0color" )
		Engine.CreateModel( f0_local25, "icon0" )
		Engine.CreateModel( f0_local25, "text1" )
		Engine.CreateModel( f0_local25, "text1color" )
		Engine.CreateModel( f0_local25, "icon1" )
		Engine.CreateModel( f0_local25, "iconWidth" )
	end
	f0_local21 = Engine.CreateModel( f0_local18, "centerConsole" )
	Engine.SetModelValue( Engine.CreateModel( f0_local21, "currentIndex" ), 0 )
	for f0_local22 = 0, 6, 1 do
		local f0_local25 = Engine.CreateModel( f0_local21, "line" .. f0_local22 )
		Engine.CreateModel( f0_local25, "text0" )
		Engine.CreateModel( f0_local25, "text0color" )
		Engine.CreateModel( f0_local25, "icon0" )
		Engine.CreateModel( f0_local25, "text1" )
		Engine.CreateModel( f0_local25, "text1color" )
		Engine.CreateModel( f0_local25, "icon1" )
		Engine.CreateModel( f0_local25, "iconWidth" )
	end
	Engine.CreateModel( Engine.CreateModel( f0_local16, "vehicle" ), "vehicleType" )
	DataSources.VehicleInfo.clearButtonModels( f0_local15 )
	if Engine.IsProfileSignedIn( f0_local15 ) then
		local f0_local24 = Engine.CreateModel( f0_local16, "profile" )
		if f0_local24 then
			local f0_local23 = function ( f599_arg0 )
				local f599_local0 = Engine.CreateModel( f0_local24, f599_arg0 )
				if f599_local0 then
					Engine.SetModelValue( f599_local0, CoD.ExeProfileVarBool( f0_local15, f599_arg0 ) )
				end
			end
			
			f0_local23( "tacticalModeShowDamage" )
			f0_local23( "tacticalModeShowArchetype" )
			f0_local23( "tacticalModeShowDistance" )
			f0_local23( "tacticalModeShowStatus" )
		end
	end
	f0_local24 = Engine.CreateModel( f0_local16, "CACMenu" )
	Engine.CreateModel( f0_local24, "numItemsToRemove" )
	Engine.CreateModel( f0_local24, "curWeaponVariantName" )
	Engine.CreateModel( f0_local24, "currentHeroName" )
	Engine.CreateModel( f0_local24, "currentHeroImage" )
	Engine.CreateModel( f0_local24, "currentHeroLoadout" )
	Engine.CreateModel( f0_local16, "unlockTokensCount" )
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
