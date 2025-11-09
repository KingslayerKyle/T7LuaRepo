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

local ListHelper_Prepare = function ( list, controller, parentModel, listModelName, getInfoTableFn, filter, customSetupFn )
	local listModel = Engine.CreateModel( parentModel, listModelName )
	list[listModelName] = {}
	list.customDataSourceHelper = listModelName
	list.baseModel = listModel
	local infoTable = getInfoTableFn( controller )
	for index, tableItem in ipairs( infoTable ) do
		local indexModel = Engine.CreateModel( listModel, index )
		if tableItem.models then
			f0_local0( indexModel, tableItem.models )
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
	if list.baseModel then
		Engine.UnsubscribeAndFreeModel( list.baseModel )
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
		ListHelper_Prepare( list, controller, Engine.GetModelForController( controller ), listModelName, getInfoTableFn, filter, customSetupFn )
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
	PerController = {
		getModel = function ( controller )
			return Engine.GetModelForController( controller )
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
			}
		} )
		if Engine.IsInGame() then
			table.insert( tabList, {
				models = {
					tabName = SessionModeToLocalizedSessionModeCaps( Engine.CurrentSessionMode() ),
					tabWidget = "CoD.StartMenu_GameOptions",
					tabIcon = ""
				},
				properties = {
					tabId = "gameOptions"
				}
			} )
		else
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_TAB_IDENTITY_CAPS" ),
					tabWidget = "CoD.StartMenu_Identity",
					tabIcon = ""
				},
				properties = {
					tabId = "identity"
				}
			} )
			if not IsLobbyNetworkModeLAN() and not Dvar.ui_execdemo:get() then
				table.insert( tabList, {
					models = {
						tabName = Engine.Localize( "MENU_TAB_BARRACKS_CAPS" ),
						tabWidget = "CoD.StartMenu_Barracks",
						tabIcon = ""
					},
					properties = {
						tabId = "barracks"
					}
				} )
				table.insert( tabList, {
					models = {
						tabName = Engine.Localize( "MENU_TAB_COMMUNITY_CAPS" ),
						tabWidget = "CoD.StartMenu_Community",
						tabIcon = ""
					},
					properties = {
						tabId = "community"
					}
				} )
			end
		end
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "MENU_TAB_OPTIONS_CAPS" ),
				tabWidget = "CoD.StartMenu_Options",
				tabIcon = ""
			},
			properties = {
				tabId = "options"
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
	StartMenuGameOptions = ListHelper_SetupDataSource( "StartMenuGameOptions", function ( controller )
		local options = {}
		if CoD.isCampaign then
			table.insert( options, {
				models = {
					displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
					action = StartMenuGoBack
				}
			} )
			table.insert( options, {
				models = {
					displayText = Engine.Localize( "MENU_RESTART_MISSION_CAPS" ),
					action = RestartMission
				}
			} )
			table.insert( options, {
				models = {
					displayText = Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" ),
					action = RestartFromCheckpoint
				}
			} )
			table.insert( options, {
				models = {
					displayText = Engine.Localize( "MPUI_CHOOSE_CLASS_BUTTON_CAPS" ),
					action = ChooseClass
				}
			} )
			table.insert( options, {
				models = {
					displayText = Engine.Localize( "MENU_END_GAME_CAPS" ),
					action = QuitGame_MP
				}
			} )
		elseif CoD.isMultiplayer then
			local team = Engine.Team( controller, "name" )
			if team ~= "TEAM_SPECTATOR" and not CoD.Class.DisableChooseClass() then
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MPUI_CHOOSE_CLASS_BUTTON_CAPS" ),
						action = ChooseClass
					}
				} )
			end
			if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == false and Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and CoD.IsGametypeTeamBased() == true and CoD.IsTeamChangeAllowed() then
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MPUI_CHANGE_TEAM_BUTTON_CAPS" ),
						action = ChooseTeam
					}
				} )
			end
			table.insert( options, {
				models = {
					displayText = Engine.Localize( "MENU_END_GAME_CAPS" ),
					action = QuitGame_MP
				}
			} )
		elseif CoD.isZombie then
			table.insert( options, {
				models = {
					displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
					action = StartMenuGoBack
				}
			} )
			if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MENU_RESTART_LEVEL_CAPS" ),
						action = RestartGame
					}
				} )
			end
			table.insert( options, {
				models = {
					displayText = Engine.Localize( "MENU_END_GAME_CAPS" ),
					action = QuitGame_MP
				}
			} )
		end
		return options
	end
	, true ),
	PlatformControllerImage = {
		getModel = function ( controller )
			local controllerImageModel = Engine.CreateModel( Engine.GetGlobalModel(), "PlatformControllerImage" )
			local imageModel = Engine.CreateModel( controllerImageModel, "image" )
			if CoD.isPC or CoD.isDurango then
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
		for index, objective in CoD.pairsByKeys( objective_table ) do
			if objective.status ~= "invisible" and objective.objective_desc ~= nil and objective.objective_desc ~= "" then
				table.insert( objectives, {
					models = {
						objective = Engine.Localize( objective.objective_desc )
					},
					properties = {
						completed = objective.status == "done"
					}
				} )
			end
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
	Lobby = {
		getModel = function ( controller )
			local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
			return lobbyRootModel
		end
	},
	LobbyGlobal = {
		getModel = function ( controller )
			local model = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot" )
			return model
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
	PartyPrivacy = {
		getModel = function ( controller )
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
			local mapVote = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote" )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapNext" ), "" )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteMapPrevious" ), "" )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteGameModeNext" ), "" )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteGameModePrevious" ), "" )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountNext" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountPrevious" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( mapVote, "mapVoteCountRandom" ), 0 )
			return mapVote
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
				table.insert( friendsListItems, {
					model = itemModel,
					isFriendItem = true
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
							isGroupsItem = true
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
			elseif a.team == b.team and Engine.CompareUInt64( a.groupID, b.groupID, "<" ) then
				return true
			else
				return false
			end
		end
		
		local gameLobbyActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
		local lobbyModule = nil
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
		else
			lobbyModule = Enum.LobbyModule.LOBBY_MODULE_CLIENT
		end
		local lobbyListGame = Engine.LobbyGetSessionClients( lobbyModule, Enum.LobbyType.LOBBY_TYPE_GAME )
		local lobbyListPrivate = Engine.LobbyGetSessionClients( lobbyModule, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		if lobbyListGame ~= nil and lobbyListPrivate ~= nil then
			for iGame, cGame in ipairs( lobbyListGame.sessionClients ) do
				lobbyListGame.sessionClients[iGame].isMember = 0
				lobbyListGame.sessionClients[iGame].isMemberLeader = 0
				for iPrivate, cPrivate in ipairs( lobbyListPrivate.sessionClients ) do
					if Engine.CompareUInt64( cGame.xuid, cPrivate.xuid, "=" ) then
						lobbyListGame.sessionClients[iGame].isMember = 1
						lobbyListGame.sessionClients[iGame].isMemberLeader = cPrivate.isLeader
					end
				end
			end
			table.sort( lobbyListGame.sessionClients, lobbySort )
		end
		local sessionClientsList = nil
		local maxClientCount = 0
		if gameLobbyActive then
			sessionClientsList = lobbyListGame.sessionClients
			maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
		else
			sessionClientsList = lobbyListPrivate.sessionClients
			maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		end
		local lobbyRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local lobbyListModel = Engine.CreateModel( lobbyRootModel, "lobbyList" )
		local playerCountModel = Engine.CreateModel( lobbyListModel, "playerCount" )
		local maxPlayersModel = Engine.CreateModel( lobbyListModel, "maxPlayers" )
		Engine.SetModelValue( playerCountModel, #sessionClientsList )
		Engine.SetModelValue( maxPlayersModel, maxClientCount )
		for index, client in ipairs( sessionClientsList ) do
			local f57_local7 = 1
			if client.rankIcon == nil then
				f57_local7 = 0
			end
			local localController = -1
			if client.localController ~= nil then
				localController = client.localController
			end
			local rankFullNameColumn = 5
			local rankTitle = Engine.TableLookup( localController, CoD.rankTable, CoD.XPBar.RankDisplayLevelCol, client.rank, rankFullNameColumn )
			local team = client.team
			if not team then
				team = 0
			end
			local f57_local8 = table.insert
			local f57_local9 = lobbyMembers
			local f57_local10 = {}
			local f57_local11 = {
				xuid = client.xuid,
				gamertag = client.gamertag,
				groupID = client.groupID,
				rankShown = f57_local7,
				rank = client.rank,
				rankIcon = client.rankIcon,
				rankString = rankTitle,
				score = client.score,
				isHost = client.isHost,
				isLeader = client.isLeader,
				isLocal = client.isLocal,
				controllerNum = localController,
				isJoinable = 0
			}
			local f57_local12
			if client.isMemberLeader and client.isMemberLeader ~= 0 and #sessionClientsList > 1 then
				f57_local12 = 1
				if not f57_local12 then
				
				else
					f57_local11.isMemberLeader = f57_local12
					if client.isMember and client.isMember ~= 0 and #sessionClientsList > 1 then
						f57_local12 = 1
						if not f57_local12 then
						
						else
							f57_local11.isMember = f57_local12
							f57_local11.team = team
							f57_local11.teamAlpha = 0.25
							f57_local11.teamSwitch = team
							f57_local10.models = f57_local11
							f57_local10.properties = {
								xuid = client.xuid,
								isSelf = client.isLocal == 1,
								isPartyMember = client.isMember == 1
							}
							f57_local8( f57_local9, f57_local10 )
						end
					end
					f57_local12 = 0
				end
			end
			f57_local12 = 0
		end
		return lobbyMembers
	end
	, nil, nil, function ( controller, list, listModel )
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local gameClient = Engine.GetModel( lobbyRootModel, "gameClient" )
		local gameClientUpdateModel = Engine.GetModel( gameClient, "update" )
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
		local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		local lobbyNavModel = Engine.GetModel( lobbyRootModel, "lobbyNav" )
		if list.lobbyNavSubscription then
			list:removeSubscription( list.lobbyNavSubscription )
		end
		list.lobbyNavSubscription = list:subscribeToModel( lobbyNavModel, function ()
			list:updateDataSource( false, false )
			list:clearSavedState()
			list:setActiveIndex( 1, 1 )
			list:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end, false )
		local lobbyNetworkModelMode = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" )
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
	end
	, function ( list, row, widgetHeight )
		if list.LobbyButtons[row].properties.isLastButtonInGroup then
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
	LobbyErrorMessage = {
		getModel = function ( controller )
			local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyErrorModel" )
			Engine.CreateModel( model, "lobbyErrorMessage" )
			return model
		end
	},
	WeaponGroups = {
		prepare = function ( controller, list, filter )
			list.weaponGroupModel = {}
			list.weaponGroupModel.primary = {}
			list.weaponGroupModel.secondary = {}
			local weaponGroupModel = Engine.CreateModel( Engine.GetGlobalModel(), "WeaponGroups" )
			local createWeaponGroupModel = function ( weaponNameTable, groupList )
				for _, category in ipairs( weaponNameTable ) do
					if category.weapon_category ~= "weapon_special" and CoD.UnlockablesTable[category.weapon_category] and #CoD.UnlockablesTable[category.weapon_category] > 0 then
						local weaponGroupIndex = category.index
						local groupModel = Engine.CreateModel( weaponGroupModel, weaponGroupIndex )
						for key, value in pairs( category ) do
							if key ~= "index" then
								Engine.SetModelValue( Engine.CreateModel( groupModel, key ), value )
							end
						end
						table.insert( groupList, groupModel )
					end
				end
			end
			
			createWeaponGroupModel( CoD.CACUtility.PrimaryWeaponGroupNames, list.weaponGroupModel.primary )
			createWeaponGroupModel( CoD.CACUtility.SecondaryWeaponGroupNames, list.weaponGroupModel.secondary )
		end,
		getCount = function ( list )
			local controller = Engine.GetPrimaryController()
			if CoD.perController[controller].weaponClassGroup == "secondary" then
				return #list.weaponGroupModel.secondary
			else
				return #list.weaponGroupModel.primary
			end
		end,
		getItem = function ( controller, list, index )
			if CoD.perController[controller].weaponClassGroup == "secondary" then
				return list.weaponGroupModel.secondary[index]
			else
				return list.weaponGroupModel.primary[index]
			end
		end
	},
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
	WeaponAttachments = {
		prepare = function ( controller, list, filter )
			list.attachments = {}
			local weaponSlot = CoD.perController[controller].weaponSlot
			local classModel = CoD.perController[controller].classModel
			local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, weaponSlot .. ".itemIndex" ) )
			local numAttachments = Engine.GetNumAttachments( weaponItemIndex )
			local attachmentType = CoD.perController[controller].attachmentType
			local tableCount = 1
			local cacAttachmentList = CoD.CACUtility.GetCACWeaponAttachmentList( weaponSlot )
			local perControllerModel = Engine.GetModelForController( controller )
			local weaponAttachmentModel = Engine.CreateModel( perControllerModel, "WeaponAttachments" )
			for index = 1, numAttachments - 1, 1 do
				local attachmentIndex = -1
				if attachmentType == "attachment" then
					if Engine.IsOptic( weaponItemIndex, index ) == false then
						attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index )
					end
				elseif attachmentType == "optic" and Engine.IsOptic( weaponItemIndex, index ) == true then
					attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index )
				end
				if attachmentIndex > -1 then
					local weaponRef = Engine.GetItemRef( weaponItemIndex )
					local attachmentRef = Engine.GetAttachmentRef( weaponItemIndex, index )
					local model = Engine.CreateModel( weaponAttachmentModel, tableCount )
					Engine.SetModelValue( Engine.CreateModel( model, "allocation" ), Engine.GetAttachmentAllocationCost( attachmentIndex ) )
					Engine.SetModelValue( Engine.CreateModel( model, "cost" ), Engine.GetAttachmentAllocationCost( attachmentIndex ) )
					Engine.SetModelValue( Engine.CreateModel( model, "image" ), Engine.GetAttachmentUniqueImageByIndex( weaponItemIndex, index ) )
					Engine.SetModelValue( Engine.CreateModel( model, "itemIndex" ), index )
					Engine.SetModelValue( Engine.CreateModel( model, "attachmentTableIndex" ), attachmentIndex )
					Engine.SetModelValue( Engine.CreateModel( model, "name" ), Engine.GetAttachmentNameByIndex( attachmentIndex ) )
					Engine.SetModelValue( Engine.CreateModel( model, "description" ), Engine.GetAttachmentDesc( weaponItemIndex, index ) )
					Engine.SetModelValue( Engine.CreateModel( model, "acvIndex" ), 0 )
					for index, attachmentSlotName in ipairs( cacAttachmentList ) do
						local slot = CoD.CACUtility.GetLoadoutSlotForAttachmentName( classModel, attachmentSlotName, attachmentRef )
						if slot then
							local acvIndex = Engine.GetModelValue( Engine.GetModel( classModel, slot .. "cosmeticvariant.itemIndex" ) )
							local acvName = Engine.GetModelValue( Engine.GetModel( classModel, slot .. "cosmeticvariant.name" ) )
							local acvImage = Engine.GetModelValue( Engine.GetModel( classModel, slot .. "cosmeticvariant.image" ) )
							if acvIndex > CoD.CACUtility.EmptyItemIndex then
								Engine.SetModelValue( Engine.CreateModel( model, "acvIndex" ), acvIndex )
								Engine.SetModelValue( Engine.GetModel( model, "name" ), acvName )
								Engine.SetModelValue( Engine.GetModel( model, "image" ), acvImage )
								break
							end
						end
					end
					table.insert( list.attachments, model )
					tableCount = tableCount + 1
				end
			end
		end,
		getCount = function ( list )
			return #list.attachments
		end,
		getItem = function ( controller, list, index )
			return list.attachments[index]
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
	PlayerNamePlate = {
		getModel = function ( controller )
			if not controller then
				controller = Engine.GetPrimaryController()
			end
			local perControllerModel = Engine.GetModelForController( controller )
			return Engine.CreateModel( perControllerModel, "namePlate" )
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
	Factions = {
		prepared = false,
		factionSubscription = nil,
		prepare = function ( controller, element, filter )
			DataSources.Factions.factionSubscription = LUI.UIElement.new()
			local factionModel = Engine.CreateModel( Engine.GetModelForController( controller ), "factions" )
			local playerFactionNameModel = Engine.CreateModel( factionModel, "playerFactionName" )
			local playerFactionDisplayNameModel = Engine.CreateModel( factionModel, "playerFactionDisplayName" )
			local playerFactionIconModel = Engine.CreateModel( factionModel, "playerFactionIcon" )
			local playerFactionColorModel = Engine.CreateModel( factionModel, "playerFactionColor" )
			local playerFactionFlagColorModel = Engine.CreateModel( factionModel, "playerFactionFlagColor" )
			local enemyFactionNameModel = Engine.CreateModel( factionModel, "enemyFactionName" )
			local enemyFactionDisplayNameModel = Engine.CreateModel( factionModel, "enemyFactionDisplayName" )
			local enemyFactionIconModel = Engine.CreateModel( factionModel, "enemyFactionIcon" )
			local enemyFactionColorModel = Engine.CreateModel( factionModel, "enemyFactionColor" )
			local enemyFactionFlagColorModel = Engine.CreateModel( factionModel, "enemyFactionFlagColor" )
			DataSources.Factions.factionSubscription:unsubscribeFromAllModels()
			DataSources.Factions.factionSubscription:subscribeToModel( playerFactionNameModel, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					Engine.SetModelValue( playerFactionIconModel, "faction_" .. modelValue )
					Engine.SetModelValue( playerFactionDisplayNameModel, "MPUI_" .. modelValue .. "_CAPS" )
					local factionR, factionG, factionB = Engine.GetFactionColor( modelValue )
					Engine.SetModelValue( playerFactionColorModel, string.format( "%d %d %d", factionR * 255, factionG * 255, factionB * 255 ) )
					Engine.SetModelValue( playerFactionFlagColorModel, string.format( "%d %d %d", ColorSet.FriendlyFlagBg.r * 255, ColorSet.FriendlyFlagBg.g * 255, ColorSet.FriendlyFlagBg.b * 255 ) )
				end
			end )
			DataSources.Factions.factionSubscription:subscribeToModel( enemyFactionNameModel, function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue then
					Engine.SetModelValue( enemyFactionIconModel, "faction_" .. modelValue )
					Engine.SetModelValue( enemyFactionDisplayNameModel, "MPUI_" .. modelValue .. "_CAPS" )
					local factionR, factionG, factionB = Engine.GetFactionColor( modelValue )
					Engine.SetModelValue( enemyFactionColorModel, string.format( "%d %d %d", factionR * 255, factionG * 255, factionB * 255 ) )
					Engine.SetModelValue( enemyFactionFlagColorModel, string.format( "%d %d %d", ColorSet.EnemyFlagBg.r * 255, ColorSet.EnemyFlagBg.g * 255, ColorSet.EnemyFlagBg.b * 255 ) )
				end
			end )
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
			for index, f142_local3 in ipairs( buttons ) do
				local buttonModel = Engine.CreateModel( groupMainButtonListModel, "buttonModel_" .. index )
				table.insert( list.buttons, {
					model = buttonModel,
					type = f142_local3.btnType,
					groupId = f142_local3.groupId,
					groupBufferType = f142_local3.groupBufferType
				} )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( f142_local3.displayText ) )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), f142_local3.action )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "type" ), f142_local3.btnType )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "groupId" ), f142_local3.groupId )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "groupBufferType" ), f142_local3.groupBufferType )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "name" ), f142_local3.name )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "clanTag" ), f142_local3.clanTag )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "description" ), f142_local3.description )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "message" ), f142_local3.message )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "privacy" ), f142_local3.privacy )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "creationTimestamp" ), f142_local3.creationTimestamp )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "owner" ), f142_local3.owner )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "ownerXuid" ), f142_local3.ownerXuid )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberStatus" ), f142_local3.memberStatus )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberStatusText" ), f142_local3.memberStatusText )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberCount" ), f142_local3.memberCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "onlineCount" ), f142_local3.onlineCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "inTitleCount" ), f142_local3.inTitleCount )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbIndex" ), f142_local3.lbIndex )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbSortColumn" ), f142_local3.lbSortColumn )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbTimeFrame" ), f142_local3.lbTimeFrame )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbHardcore" ), f142_local3.lbHardcore )
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbInitialized" ), f142_local3.lbInitialized )
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
		local doesHaveAdminRights = DoesHaveAdminRightsForGroup( nil, nil, {
			controller = controller
		} )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
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
			}
		} )
		return tabList
	end
	, true ),
	GroupHeadquartersOverviewButtonList = ListHelper_SetupDataSource( "GroupHeadquartersOverviewButtonListModel", function ( controller )
		local tabList = {}
		local isNotAMember = IsNotAGroupMember( nil, nil, {
			controller = controller
		} )
		local isOwner = IsGroupOwner( nil, nil, {
			controller = controller
		} )
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
			for index, f153_local5 in ipairs( buttons ) do
				local buttonModelData = f153_local5.model
				local buttonProperties = f153_local5.properties
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
				}
			}
		}
		if Dvar.ui_execdemo:get() or CoD.isPC then
			tabList = {
				{
					models = {
						tabIcon = "^BBUTTON_LUI_SHOULDERL^"
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
			return Engine.CreateModel( perControllerModel, "gameScore" )
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
		
		for id, mapData in LUI.IterateTableBySortedKeys( CoD.mapsTable, sortMaps, nil ) do
			if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.dlc_pack ~= -1 then
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
	CampaignSettings = {
		getModel = function ( controller )
			local cpSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
			Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( controller, "g_gameskill" )] ) )
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
	LocalServerPlayerList = {
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
			if list.selectedServerSubscription then
				list:removeSubscription( list.selectedServerSubscription )
			end
			list.selectedServerSubscription = list:subscribeToModel( list.selectedServerModel, function ()
				list:updateDataSource()
			end, false )
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
				displayLevelForNextRank = REG1.displayLevelForCurrRank + 1,
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
			local f209_local0 = CoD.GetPlayerStats( controller )
			local stats = f209_local0.AfterActionReportStats
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
			Engine.CreateModel( model, "player3name" )
			Engine.CreateModel( model, "player4name" )
			Engine.CreateModel( model, "player1health" )
			Engine.CreateModel( model, "player2health" )
			Engine.CreateModel( model, "player3health" )
			Engine.CreateModel( model, "player4health" )
			Engine.CreateModel( model, "fightBanner" )
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
			local playerListListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PlayerList" )
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
			local connectionChangeHandler = function ( self, event )
				DataSources.PlayerList.updateModelsForClient( event.controller, self, event.clientNum )
			end
			
			list:registerEventHandler( "player_connected", connectionChangeHandler )
			list:registerEventHandler( "player_disconnected", connectionChangeHandler )
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
		prepare = function ( controller, list, filter )
			list.emblemLayerListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemLayerList" )
			local customizationType = CoD.GetCustomization( controller, "type" )
			local totalUsedLayers = Engine.GetUsedLayerCount( controller, customizationType, CoD.perController[controller].totalLayers )
			local totalLayersVisible = totalUsedLayers + 1
			list.totalLayers = math.min( totalLayersVisible, CoD.perController[controller].totalLayers )
		end,
		getCount = function ( list )
			return list.totalLayers
		end,
		getItem = function ( controller, list, index )
			local layerNumber = index - 1
			local layerModel = Engine.CreateModel( list.emblemLayerListModel, "layer_" .. layerNumber )
			Engine.SetModelValue( Engine.CreateModel( layerModel, "layerIndex" ), layerNumber )
			local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, layerNumber )
			if selectedLayerIconID == CoD.emblem.INVALID_ICON_ID then
				Engine.SetModelValue( Engine.CreateModel( layerModel, "layerName" ), Engine.Localize( "MENU_EMBLEM_ADD_DECAL" ) )
			else
				Engine.SetModelValue( Engine.CreateModel( layerModel, "layerName" ), Engine.Localize( "MENU_EMBLEM_LAYER_NUMBER", layerNumber + 1 ) )
			end
			return layerModel
		end
	},
	EmblemIconList = {
		prepare = function ( controller, list, filter )
			list.emblemIconList = {}
			local category = CoD.emblem.DECALTABDATA[1].category
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
			local category = CoD.emblem.MaterialCategory[1].index
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
			local emblemColorListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemColorList" )
			local totalRows = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_ROWS
			local totalColumns = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_COLUMNS
			local totalColors = totalRows * totalColumns
			for index = 0, totalColors - 1, 1 do
				local row = index / totalColumns
				local column = index % totalColumns
				local red, green, blue = Engine.GetEmblemSwatchColor( row, column )
				local colorModel = Engine.CreateModel( emblemColorListModel, "color_" .. index )
				Engine.SetModelValue( Engine.CreateModel( colorModel, "color" ), string.format( "%d %d %d", red, green, blue ) )
				table.insert( list.emblemColorList, colorModel )
			end
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
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "color" ), CoD.ConvertColor( emblemLayerColor ) )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "red" ), emblemLayerColor.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "green" ), emblemLayerColor.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "blue" ), emblemLayerColor.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
			return selectedLayerColorModel
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
			Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "opacity" ), layerProperties.opacity )
			return selectedLayerPropertiesModel
		end
	},
	EmblemProperties = {
		getModel = function ( controller )
			local colorMode = Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID
			local editorMode = Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
			local scaleMode = Engine.GetEmblemScaleMode( controller )
			local totalLayers = CoD.perController[controller].totalLayers
			local usedLayerCount = Engine.GetUsedLayerCount( controller, CoD.perController[controller].customizationType, totalLayers )
			local layersUsedFraction = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedLayerCount, totalLayers )
			local emblemPropertiesModel = Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties" )
			if not emblemPropertiesModel then
				emblemPropertiesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties" )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "layersUsed" ), usedLayerCount )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "colorMode" ), colorMode )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "scaleMode" ), scaleMode )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "layersUsedFraction" ), layersUsedFraction )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isClipboardEmpty" ), CoD.emblem.CLIPBOARDSTATE.EMPTY )
				Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "addDecalMode" ), CoD.emblem.ADDDECAL.REPLACE )
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
			if not preparedModel then
				CoD.CACUtility.classModels = {}
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList.prepared" ), true )
				local editClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList" )
				list.classModels = {}
				for index = 1, list.customClassCount, 1 do
					table.insert( list.classModels, DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, index, controller ) )
				end
				for index = 11, 15, 1 do
					table.insert( list.classModels, DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, index, controller ) )
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
		updateCustomSlotModel = function ( model, slotName, controller, baseSlot )
			local slotModel = Engine.GetModel( model, slotName )
			if slotModel == nil then
				return 
			end
			local createCustomModelForAttachment = function ( slotModel, modelIndex, weaponItemIndex, attachmentIndex )
				local newModelName = "cust" .. slotName .. "attachment" .. modelIndex
				local customAttachmentModel = Engine.CreateModel( slotModel, newModelName )
				local baseWeaponName = Engine.GetModelValue( Engine.GetModel( slotModel, "name" ) )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "name" ), Engine.Localize( "MPUI_X2_GRENADE", baseWeaponName ) )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "image" ), Engine.GetModelValue( Engine.GetModel( slotModel, "image" ) ) )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "itemIndex" ), attachmentIndex )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "weaponSlot" ), slotName .. "attachment" .. modelIndex )
				Engine.SetModelValue( Engine.CreateModel( customAttachmentModel, "customWeaponSlot" ), slotName .. "." .. newModelName )
			end
			
			if slotName == "primarygadget" or slotName == "secondarygadget" then
				local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
				if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
					local numAttachments = math.min( Engine.GetNumGadgetAttachments( weaponItemIndex, false ), CoD.CACUtility.maxGadgetsMods )
					for attachmentIndex = 1, CoD.CACUtility.maxGadgetsMods, 1 do
						local newModelName = "cust" .. slotName .. "attachment" .. attachmentIndex
						local customAttachmentModel = Engine.GetModel( slotModel, newModelName )
						if customAttachmentModel ~= nil then
							Engine.UnsubscribeAndFreeModel( customAttachmentModel )
						end
					end
					for attachmentIndex = 1, numAttachments, 1 do
						if not Engine.IsTakeTwoGadgetAttachment( weaponItemIndex, attachmentIndex ) then
							createCustomModelForAttachment( slotModel, 1, weaponItemIndex, attachmentIndex )
						else
							createCustomModelForAttachment( slotModel, 2, weaponItemIndex, attachmentIndex )
						end
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
			}
		} )
		for _, materialGroup in ipairs( CoD.emblem.MaterialCategory ) do
			if materialGroup.material_category == "general" then
				table.insert( tabList, {
					models = {
						tabName = Engine.Localize( materialGroup.name )
					},
					properties = {
						filter = materialGroup.material_category
					}
				} )
			else
				table.insert( tabList, {
					models = {
						tabName = Engine.Localize( materialGroup.name )
					},
					properties = {
						filter = materialGroup.material_category,
						disabled = true
					}
				} )
			end
		end
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			}
		} )
		return tabList
	end
	 ),
	GunsmithWeaponAttachments = {
		prepare = function ( controller, list, filter )
			list.attachments = {}
			local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
			local numAttachments = Engine.GetNumAttachments( weaponItemIndex, Enum.eModes.MODE_MULTIPLAYER )
			local attachmentType = CoD.perController[controller].gunsmithAttachmentType
			local variantAttachmentModel = CoD.perController[controller].gunsmithAttachmentModel
			local variantAttchmentIndex = Engine.GetModelValue( variantAttachmentModel )
			local variantModel = CoD.perController[controller].gunsmithVariantModel
			local tableCount = 1
			local perControllerModel = Engine.GetModelForController( controller )
			local weaponAttachmentModel = Engine.CreateModel( perControllerModel, "GunsmithWeaponAttachments" )
			for index = 1, numAttachments - 1, 1 do
				local attachmentIndex = -1
				if attachmentType == "attachment" then
					if Engine.IsOptic( weaponItemIndex, index, Enum.eModes.MODE_MULTIPLAYER ) == false then
						attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index, Enum.eModes.MODE_MULTIPLAYER )
					end
				elseif attachmentType == "optic" and Engine.IsOptic( weaponItemIndex, index, Enum.eModes.MODE_MULTIPLAYER ) == true then
					attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index, Enum.eModes.MODE_MULTIPLAYER )
				end
				if attachmentIndex > -1 then
					local attachmentModel = Engine.CreateModel( weaponAttachmentModel, tableCount )
					Engine.SetModelValue( Engine.CreateModel( attachmentModel, "allocation" ), Engine.GetAttachmentAllocationCost( attachmentIndex ) )
					Engine.SetModelValue( Engine.CreateModel( attachmentModel, "cost" ), Engine.GetAttachmentAllocationCost( attachmentIndex ) )
					Engine.SetModelValue( Engine.CreateModel( attachmentModel, "image" ), Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, weaponItemIndex, attachmentIndex ) )
					Engine.SetModelValue( Engine.CreateModel( attachmentModel, "attachmentIndex" ), attachmentIndex )
					Engine.SetModelValue( Engine.CreateModel( attachmentModel, "name" ), Engine.GetAttachmentNameByIndex( attachmentIndex ) )
					Engine.SetModelValue( Engine.CreateModel( attachmentModel, "description" ), Engine.GetAttachmentDesc( weaponItemIndex, index, Enum.eModes.MODE_MULTIPLAYER ) )
					Engine.SetModelValue( Engine.CreateModel( attachmentModel, "acvIndex" ), 0 )
					if variantModel then
						for index = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
							local model = Engine.GetModel( variantModel, "attachment" .. index )
							local attachmentID = Engine.GetModelValue( model )
							local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. index )
							local attachmentVariantID = Engine.GetModelValue( attachmentVariantModel )
							if attachmentID == attachmentIndex and attachmentVariantID > CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
								local weaponName = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
								local cosmeticVariant = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentIndex )
								Engine.SetModelValue( Engine.GetModel( attachmentModel, "image" ), cosmeticVariant.image )
								Engine.SetModelValue( Engine.GetModel( attachmentModel, "name" ), cosmeticVariant.name )
								Engine.SetModelValue( Engine.CreateModel( attachmentModel, "acvIndex" ), attachmentVariantID )
								break
							end
						end
					end
					table.insert( list.attachments, {
						model = attachmentModel,
						properties = {
							selectIndex = variantAttchmentIndex == attachmentIndex
						}
					} )
					tableCount = tableCount + 1
				end
			end
		end,
		getCount = function ( list )
			return #list.attachments
		end,
		getItem = function ( controller, list, index )
			return list.attachments[index].model
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.attachments[index].properties
		end
	},
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
			list.varaintListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.VariantList" )
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
		getItem = function ( controller, list, index )
			local variantModel = Engine.CreateModel( list.varaintListModel, "variant_" .. index )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
			local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
			local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, list.variantList[index].variantIndex )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "variantIndex" ), variant.variantIndex )
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
			Engine.SetModelValue( Engine.CreateModel( variantModel, "sortIndex" ), list.variantList[index].sortIndex )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlot" ), variant.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobIndex" ), variant.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "camoIndex" ), variant.camoIndex )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "weaponIndex" ), weaponIndex )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "variantImage" ), CoD.perController[controller].gunsmithPreviewImage )
			return variantModel
		end
	},
	GunsmithWeaponTabType = ListHelper_SetupDataSource( "Gunsmith.GunsmithWeaponTabType", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			}
		} )
		for _, weaponGroup in ipairs( CoD.Craft.WeaponGroupNames ) do
			if weaponGroup.weapon_category ~= "weapon_launcher" then
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
		end
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
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
			}
		} )
		for tabIndex, decalData in ipairs( CoD.emblem.DECALTABDATA ) do
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
			}
		} )
		return tabList
	end
	 ),
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
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "sortIndex" ), paintjob.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobSlot" ), paintjob.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "weaponIndex" ), weaponIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobIndex" ), paintjob.paintjobIndex )
			return paintjobModel
		end
	},
	PersonalDataVault_CareerData = ListHelper_SetupDataSource( "PDV_CareerDataList", function ( controller )
		return {
			{
				models = {
					displayText = "Collectibles",
					action = function ( self, element, controller )
						NavigateToMenu( self, "PersonalDataVault_CollectiblesMenu", true, controller )
					end
					
				},
				properties = {
					disabled = false
				}
			},
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
		local iteratedList = nil
		if CoD.perController[controller].inspectingMap then
			local mapCollectibleListName = CoD.mapsTable[CoD.perController[controller].inspectingMap].collectibles
			if mapCollectibleListName then
				iteratedList = Engine.GetCollectiblesList( mapCollectibleListName )
			end
		else
			iteratedList = Engine.GetCompleteCollectiblesList()
		end
		local mustFitInSlot = CoD.perController[controller].selectingCollectibleSlot
		if iteratedList then
			for index, collectible in ipairs( iteratedList ) do
				if CoD.perController[controller].inspectingMap or mustFitInSlot and Engine.CollectibleFitsInSlot( collectible.name, mustFitInSlot ) then
					table.insert( collectiblesList, {
						models = collectible
					} )
				end
			end
		end
		return collectiblesList
	end
	 ),
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
			local layoutData = Engine.GetCollectibleLayout( controller )
			for index, enumString in ipairs( modelItems ) do
				local layoutItemModel = Engine.CreateModel( collectiblesLayoutModel, enumString )
				local slotIndex = Enum.bunkCollectibleSlots_e[enumString]
				local itemIndex = layoutData[slotIndex]
				if itemIndex ~= 0 and layoutItemModel then
					local collectibleInfo = Engine.GetCollectibleInfoFromCompleteList( itemIndex )
					if collectibleInfo then
						Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "image" ), collectibleInfo.image )
					else
						Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "image" ), "" )
					end
				else
					Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "image" ), "" )
				end
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "itemIndex" ), itemIndex )
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "collectibleSlot" ), slotIndex )
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
			local f303_local0 = list
			local f303_local1 = list.menu
			if f303_local1 then
				f303_local1 = list.menu:getModel()
				if f303_local1 then
					local missionSelectModel = Engine.GetModel( list.menu:getModel(), "showMissionSelect" )
					f303_local1 = f303_local0 and missionSelectModel
				end
			end
			local f303_local2 = f303_local1
			local showMissionSelect = Engine.GetModelValue( f303_local1 )
			return ListHelper_GetCount( list ) + (f303_local2 and showMissionSelect) - 1
		end
		,
		getItem = function ( controller, list, index )
			if 5 <= index then
				local f304_local0 = list
				local f304_local1 = list.menu
				if f304_local1 then
					f304_local1 = list.menu:getModel()
					if f304_local1 then
						local missionSelectModel = Engine.GetModel( list.menu:getModel(), "showMissionSelect" )
						f304_local1 = f304_local0 and missionSelectModel
					end
				end
				local f304_local2 = f304_local1
				local showMissionSelect = Engine.GetModelValue( f304_local1 )
				if (f304_local2 and showMissionSelect) ~= 1 then
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
			local f305_local0 = mapModel
			local mapId = Engine.GetModelValue( mapModel )
			local f305_local1 = f305_local0 and mapId
			local mapInfo = CoD.mapsTable[f305_local1]
			if mapInfo == nil then
				return currentMissionModel
			end
			Engine.SetModelValue( Engine.CreateModel( currentMissionModel, "mapId" ), f305_local1 )
			for i, field in ipairs( {
				"previewImage",
				"mapName",
				"mapDescription"
			} ) do
				Engine.SetModelValue( Engine.CreateModel( currentMissionModel, field ), mapInfo[field] )
			end
			local extraMapInfo = Engine.GetGDTCampaignMapInfo( f305_local1 )
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
			if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.dlc_pack ~= -1 then
				table.insert( cpMaps, {
					models = {
						displayText = Engine.Localize( mapData.mapName )
					},
					properties = {
						mapId = id
					}
				} )
			end
			if id == CoD.MissionRecordVaultMenu.highestMapReached then
				break
			end
		end
		return cpMaps
	end
	 ),
	MissionRecordVaultChallengeInfo = ListHelper_SetupDataSource( "MissionRecordVaultChallengeInfo", function ( controller )
		local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		local f308_local0 = nextMapNameModel
		local nextMapName = Engine.GetModelValue( nextMapNameModel )
		local f308_local1 = f308_local0 and nextMapName
		local f308_local2 = f308_local1
		local f308_local3 = CoD.mapsTable[f308_local1]
		if f308_local3 then
			local accoladeList = CoD.mapsTable[f308_local1].accoladelist
			f308_local3 = f308_local2 and accoladeList
		end
		local challengeList = {}
		local f308_local4 = f308_local3
		local accoladeList = Engine.GetAssetList( f308_local3 )
		local f308_local5 = f308_local4 and accoladeList
		if f308_local5 ~= nil then
			for i = 1, #f308_local5, 1 do
				challengeList[i] = {
					models = f308_local5[i]
				}
			end
		end
		local fakeStats = {
			"Veteran",
			"17:20",
			"1",
			"200",
			"0"
		}
		for i = 1, #challengeList, 1 do
			challengeList[i].models.completed = i % 2 == 1
			challengeList[i].models.challengeProgressQuantity = fakeStats[i]
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
		local getBaseItemModels = function ( displayText, type, name, image, paintjobSlot, paintjobIndex )
			return {
				models = {
					displayText = displayText,
					type = type,
					name = name,
					image = image or "blacktransparent",
					paintjobSlot = paintjobSlot,
					paintjobIndex = paintjobIndex
				},
				properties = {}
			}
		end
		
		local getWeaponOptionRow = function ( displayText, type, name, image, paintjobSlot, paintjobIndex )
			local item = getBaseItemModels( displayText, type, name, image, paintjobSlot, paintjobIndex )
			item.properties.viewWidget = "CoD.WeaponCustomizationSelect"
			return item
		end
		
		local getAttachmentCosmeticVariantRow = function ( index, type, displayText, name, image )
			if image == "" then
				image = nil
			end
			local item = getBaseItemModels( displayText, type, name, image, nil, nil )
			item.models.attachmentIndex = index
			item.properties.viewWidget = "CoD.AttachmentVariantSelect"
			item.properties.acv = true
			item.properties.attachmentSlotIndex = index
			return item
		end
		
		local paintjobSlotModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobslot" )
		local paintjobIndexModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobindex" )
		local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobSlotModel, "itemIndex" ) )
		local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobIndexModel, "itemIndex" ) )
		if Paintjobs_IsEnabled( nil, controller ) then
			table.insert( categoryList, getWeaponOptionRow( "Paint Jobs", "paintjob", "", nil, paintjobSlot, paintjobIndex ) )
		end
		local camoModel = Engine.GetModel( classModel, loadoutSlotName .. "camo" )
		local camoImage = Engine.GetModelValue( Engine.GetModel( camoModel, "image" ) )
		local camoName = Engine.GetModelValue( Engine.GetModel( camoModel, "name" ) )
		table.insert( categoryList, getWeaponOptionRow( "Camo", "camo", camoName, camoImage, nil, nil ) )
		CoD.perController[controller].customReticleAttachmentIndex = 0
		for index, attachmentSlotName in ipairs( attachmentSlotList ) do
			local attachmentRef = CoD.CACUtility.GetItemRefEquippedInSlot( attachmentSlotName, controller, classModel )
			if attachmentRef and attachmentRef ~= "" then
				if CoD.CACUtility.AttachmentHasCustomReticle( attachmentRef ) then
					CoD.perController[controller].customReticleAttachment = attachmentRef
					CoD.perController[controller].customReticleAttachmentIndex = index
					local reticleModel = Engine.GetModel( classModel, loadoutSlotName .. "reticle" )
					local reticleImage = Engine.GetModelValue( Engine.GetModel( reticleModel, "image" ) )
					local reticleName = Engine.GetModelValue( Engine.GetModel( reticleModel, "name" ) )
					table.insert( categoryList, getWeaponOptionRow( "Reticle", "reticle", reticleName, reticleImage, nil, nil ) )
				end
				local acvModel = Engine.GetModel( classModel, attachmentSlotName .. "cosmeticvariant" )
				local avcName = Engine.GetModelValue( Engine.GetModel( acvModel, "name" ) )
				local acvImage = Engine.GetModelValue( Engine.GetModel( acvModel, "image" ) )
				local attachmentUniqueRef = nil
				local acvTable = CoD.WC_Category.ACV.attachmentTable
				for attachRef, infoTable in pairs( acvTable ) do
					if attachmentRef == attachRef then
						table.insert( categoryList, getAttachmentCosmeticVariantRow( index, attachRef, infoTable.displayName, avcName, acvImage ) )
					end
				end
			end
		end
		return categoryList
	end
	, false, {
		getSpacerAfterRow = function ( list, row, widgetHeight )
			if row == 2 then
				return widgetHeight
			else
				return 0
			end
		end
		
	} ),
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
	ZombieQuestItemList = ListHelper_SetupDataSource( "ZombieQuestItemList", function ( controller )
		local craftableList = {}
		local mapName = CoD.Zombie.GetUIMapName()
		if CoD.Zombie.SideQuestDataSource[mapName] then
			for key, value in ipairs( CoD.Zombie.SideQuestDataSource[mapName] ) do
				table.insert( craftableList, {
					models = value.models,
					properties = value.properties
				} )
			end
		end
		return craftableList
	end
	 ),
	ZombieCraftableList = ListHelper_SetupDataSource( "ZombieCraftableList", function ( controller )
		local craftableList = {}
		local mapName = CoD.Zombie.GetUIMapName()
		if CoD.Zombie.CraftablesDataSource[mapName] then
			for key, value in ipairs( CoD.Zombie.CraftablesDataSource[mapName] ) do
				table.insert( craftableList, {
					models = value.models,
					properties = value.properties
				} )
			end
		end
		return craftableList
	end
	 ),
	ArenaRank = {
		getModel = function ( controller )
			return Engine.CreateModel( Engine.GetModelForController( controller ), "ArenaRank" )
		end
	},
	LoadingScreenPlayerListTeam1 = {
		prepare = function ( controller, list, filter )
			local gameLobbyData = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
			local lobbyClientData = {
				teamInfo = {}
			}
			lobbyClientData.teamInfo[1] = {}
			lobbyClientData.teamInfo[2] = {}
			local lobbyMemberCount = 0
			local maxTeams = 2
			local maxMembersToShowOnEachTeam = 6
			if HUD_IsFFA() then
				maxMembersToShowOnEachTeam = 12
			end
			list.maxMembersToShowOnEachTeam = maxMembersToShowOnEachTeam
			if gameLobbyData and gameLobbyData.sessionClients then
				lobbyMemberCount = #gameLobbyData.sessionClients
				for index = 1, lobbyMemberCount, 1 do
					local currClientData = gameLobbyData.sessionClients[index]
					local team = currClientData.team
					local xuid = currClientData.xuid
					local name = currClientData.gamertag
					if HUD_IsFFA() or team == Enum.team_t.TEAM_ALLIES or team == Enum.team_t.TEAM_FREE then
						table.insert( lobbyClientData.teamInfo[1], {
							name = name,
							xuid = xuid
						} )
					end
					if team == Enum.team_t.TEAM_AXIS then
						table.insert( lobbyClientData.teamInfo[2], {
							name = name,
							xuid = xuid
						} )
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
							local heroLoadoutItemIndex = Engine.GetHeroLoadoutItemIndexLobbyData( lobbyClientData.teamInfo[team][i].xuid )
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
				Engine.SetModelValue( team1CountModel, #lobbyClientData.teamInfo[1] )
				Engine.SetModelValue( team2CountModel, #lobbyClientData.teamInfo[2] )
			else
				return 
			end
		end,
		getCount = function ( list )
			local team1Count = Engine.GetModelValue( list.team1CountModel )
			local team2Count = Engine.GetModelValue( list.team2CountModel )
			local maxMembersToShowOnEachTeam = list.maxMembersToShowOnEachTeam
			if not (not HUD_IsFFA() or team1Count > maxMembersToShowOnEachTeam) or team1Count <= maxMembersToShowOnEachTeam and team2Count <= maxMembersToShowOnEachTeam then
				return team1Count
			else
				return 0
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
			local team1Count = Engine.GetModelValue( list.team1CountModel )
			local team2Count = Engine.GetModelValue( list.team2CountModel )
			local maxMembersToShowOnEachTeam = list.maxMembersToShowOnEachTeam
			if team1Count <= maxMembersToShowOnEachTeam and team2Count <= maxMembersToShowOnEachTeam then
				return team2Count
			else
				return 0
			end
		end,
		getItem = function ( controller, list, index )
			return Engine.GetModel( list.team2BaseModel, "member" .. index )
		end
	},
	LoadingScreenTeamInfo = {
		getModel = function ( controller )
			local globalModel = Engine.GetGlobalModel()
			local loadingScreenInfoModel = Engine.CreateModel( globalModel, "LoadingScreenInfo" )
			local loadingScreenTeamInfoModel = Engine.CreateModel( loadingScreenInfoModel, "LoadingScreenTeamInfo" )
			local team1FactionNameModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team1FactionName" )
			Engine.SetModelValue( team1FactionNameModel, "MPUI_ALLIES_SHORT_CAPS" )
			local team2FactionNameModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team2FactionName" )
			Engine.SetModelValue( team2FactionNameModel, "MPUI_AXIS_SHORT_CAPS" )
			local team1FactionIconModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team1FactionIcon" )
			Engine.SetModelValue( team1FactionIconModel, "faction_allies" )
			local team2FactionIconModel = Engine.CreateModel( loadingScreenTeamInfoModel, "team2FactionIcon" )
			Engine.SetModelValue( team2FactionIconModel, "faction_axis" )
			local gameTypeIconModel = Engine.CreateModel( loadingScreenTeamInfoModel, "gameTypeIcon" )
			Engine.SetModelValue( gameTypeIconModel, CoD.GetLoadingScreenGameTypeIconName() )
			local gameTypeTextModel = Engine.CreateModel( loadingScreenTeamInfoModel, "gameType" )
			Engine.SetModelValue( gameTypeTextModel, Dvar.ls_gametype:get() )
			local mapNameModel = Engine.CreateModel( loadingScreenTeamInfoModel, "mapName" )
			Engine.SetModelValue( mapNameModel, Dvar.ls_mapname:get() )
			local locationModel = Engine.CreateModel( loadingScreenTeamInfoModel, "location" )
			Engine.SetModelValue( locationModel, "" )
			local tipModel = Engine.CreateModel( loadingScreenTeamInfoModel, "tip" )
			Engine.SetModelValue( tipModel, CoD.Loading.GetDidYouKnowString() )
			local statusTextModel = Engine.CreateModel( loadingScreenTeamInfoModel, "statusText" )
			Engine.SetModelValue( statusTextModel, "" )
			local loadedFractionModel = Engine.CreateModel( loadingScreenTeamInfoModel, "loadedFraction" )
			Engine.SetModelValue( loadedFractionModel, 0 )
			return loadingScreenTeamInfoModel
		end
	},
	AbilityWheel = {
		getModel = function ( controller )
			local buttonNumMapping = {
				1,
				2,
				6,
				3,
				5,
				4
			}
			local AbilityWheelRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "AbilityWheel" )
			local typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomActiveType" )
			Engine.CreateModel( AbilityWheelRoot, "selectedAbilityDisplayName" )
			Engine.CreateModel( AbilityWheelRoot, "selectedAbilityDisplayDesc" )
			if Engine.GetModelValue( typeModel ) == nil then
				Engine.SetModelValue( typeModel, 0 )
			end
			local typeModelValue = Engine.GetModelValue( typeModel )
			if nil ~= CoD.CyberComStrings then
				Engine.SetModelValue( Engine.CreateModel( AbilityWheelRoot, "name" ), CoD.CyberComStrings[typeModelValue + 1] )
			end
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
		setButtonModels = function ( controller, topLeftTable, middleLeftTable, bottomLeftTable, topRightTable, bottomRightTable )
			local vehicleModel = Engine.GetModel( Engine.GetModelForController( controller ), "vehicle" )
			if vehicleModel then
				local createVehicleButtonModel = function ( modelName, valueTable )
					local imageModel = Engine.CreateModel( vehicleModel, modelName .. ".imageText" )
					if valueTable then
						if valueTable.keyBinding and valueTable.keyBinding ~= "" then
							Engine.SetModelValue( imageModel, Engine.KeyBinding( controller, valueTable.keyBinding ) )
						else
							Engine.SetModelValue( imageModel, valueTable.imageText or "" )
						end
					else
						Engine.SetModelValue( imageModel, "" )
					end
					local textModel = Engine.CreateModel( vehicleModel, modelName .. ".text" )
					if valueTable and valueTable.text and valueTable.text ~= "" then
						Engine.SetModelValue( textModel, valueTable.text )
					else
						Engine.SetModelValue( textModel, "" )
					end
				end
				
				createVehicleButtonModel( "topLeftButton", topLeftTable )
				createVehicleButtonModel( "middleLeftButton", middleLeftTable )
				createVehicleButtonModel( "bottomLeftButton", bottomLeftTable )
				createVehicleButtonModel( "topRightButton", topRightTable )
				createVehicleButtonModel( "bottomRightButton", bottomRightTable )
			end
		end,
		clearButtonModels = function ( controller )
			DataSources.VehicleInfo.setButtonModels( controller )
		end
	},
	KillcamInfo = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "killcamInfo" )
		end
	},
	TopPlayerInfoData = {
		getModel = function ( controller )
			return Engine.GetModel( Engine.GetModelForController( controller ), "topPlayerInfo" )
		end
	},
	SocialTabs = ListHelper_SetupDataSource( "SocialTabs", function ( controller )
		local socialRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
		local tabModel = Engine.CreateModel( socialRootModel, "tab" )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "MENU_FRIENDS_CAPS" ),
				tabWidget = "CoD.Social_Friends"
			},
			properties = {
				tabId = "friends"
			}
		} )
		if not Dvar.ui_execdemo:get() then
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
					tabWidget = "CoD.Social_Party"
				},
				properties = {
					tabId = "party",
					disabled = true
				}
			} )
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "GROUPS_CAPS" ),
					tabWidget = "CoD.Social_Groups"
				},
				properties = {
					tabId = "groups",
					disabled = true
				}
			} )
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ),
					tabWidget = "CoD.Social_RecentPlayers"
				},
				properties = {
					tabId = "recent"
				}
			} )
		end
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			}
		} )
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
			listFiends = Engine.GetRecenPlayersList( controller, 0, 7, filter )
		else
			listFiends = Engine.GetOnlineFriendsList( controller, 0, 7, filter )
		end
		for i = 1, #listFiends, 1 do
			local playerInfo = listFiends[i]
			local clantag = "3ARC"
			local fullname = string.format( "[%s]%s", clantag, playerInfo.gamertag )
			local titlePresence = ""
			if showlastmet then
				titlePresence = playerInfo.titlePresence
			end
			table.insert( socialMembers, {
				models = {
					xuid = playerInfo.xuid,
					gamertag = playerInfo.gamertag,
					clantag = clantag,
					fullname = fullname,
					activity = playerInfo.activity,
					context = playerInfo.context,
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
					showlastmet = showlastmet
				}
			} )
		end
		return socialMembers
	end
	, nil, nil, function ( controller, list, listModel )
		local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local tabModel = Engine.GetModel( socialRootModel, "tab" )
		local tabModelValue = Engine.GetModelValue( tabModel )
		local socialSubModel = nil
		if tabModelValue == "friends" then
			socialSubModel = Engine.GetModel( socialRootModel, "friends" )
		elseif tabModelValue == "recent" then
			socialSubModel = Engine.GetModel( socialRootModel, "recentPlayers" )
		else
			socialSubModel = Engine.GetModel( socialRootModel, "friends" )
		end
		local socialUpdateModel = Engine.GetModel( socialSubModel, "update" )
		if list.socialUpdateSubscription then
			list:removeSubscription( list.socialUpdateSubscription )
		end
		list.socialUpdateSubscription = list:subscribeToModel( socialUpdateModel, function ()
			RefreshListFindSelectedXuid( controller, list )
		end, false )
		local socialCountModel = Engine.GetModel( socialSubModel, "count" )
	end
	 ),
	AARTabs = ListHelper_SetupDataSource( "AARTabs", function ( controller )
		local tabList = {}
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			}
		} )
		if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) then
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
				tabName = Engine.Localize( "MENU_AAR_TAB_SCOREBOARD_CAPS" ),
				tabWidget = "CoD.ScoreboardTabWidget"
			},
			properties = {
				tabId = "scoreboard"
			}
		} )
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
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
			local scoreboardInfoModel = Engine.CreateModel( Engine.GetModelForController( controller ), "scoreboardInfo" )
			return scoreboardInfoModel
		end
	},
	ScoreboardTeam1List = ListHelper_SetupDataSource( "scoreboardTeam1List", function ( controller )
		return CoD.ScoreboardUtility.GetScoreboardTeamTable( controller, 1 )
	end
	 ),
	ScoreboardTeam2List = ListHelper_SetupDataSource( "scoreboardTeam2List", function ( controller )
		return CoD.ScoreboardUtility.GetScoreboardTeamTable( controller, 2 )
	end
	 )
}
DataSources.GlobalSources.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.GlobalSources" )
DataSources.Controller.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.Controller" )
if CoD.isXBOX then
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "primary_button_image" ), "ui_button_xenon_3d_a_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "secondary_button_image" ), "ui_button_xenon_3d_b_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "alt1_button_image" ), "ui_button_xenon_3d_x_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "alt2_button_image" ), "ui_button_xenon_3d_y_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "back_button_image" ), "ui_button_xenon_back_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "start_button_image" ), "ui_button_xenon_start_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_shoulder_button_image" ), "ui_button_xenon_3d_shoulderL_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_shoulder_button_image" ), "ui_button_xenon_3d_shoulderR_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_stick_button_image" ), "ui_button_xenon_stick_ani_32_Ldown" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_stick_button_image" ), "ui_button_xenon_stick_ani_32_Rdown" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_trigger_button_image" ), "ui_button_xenon_trigL_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_trigger_button_image" ), "ui_button_xenon_trigR_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_lr_button_image" ), "ui_button_xenon_dpadR_L_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_up_button_image" ), "ui_button_xenon_dpadU_32x32" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_down_button_image" ), "ui_button_xenon_dpadD_32x32" )
elseif CoD.isPS4 then
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "primary_button_image" ), "ps3button_x" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "secondary_button_image" ), "ps3button_circle" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "alt1_button_image" ), "ps3button_square" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "alt2_button_image" ), "ps3button_triangle" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "back_button_image" ), "ps3button_select" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "start_button_image" ), "ps3button_start" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_shoulder_button_image" ), "ps3button_l1" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_shoulder_button_image" ), "ps3button_r1" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_stick_button_image" ), "ps3button_l3" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_stick_button_image" ), "ps3button_r3" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_trigger_button_image" ), "ps3button_l2" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_trigger_button_image" ), "ps3button_r2" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_lr_button_image" ), "ps3button_dpad_rl" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_up_button_image" ), "ps3button_dpad_up" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_down_button_image" ), "ps3button_dpad_down" )
else
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "primary_button_image" ), "xenonbutton_a" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "secondary_button_image" ), "xenonbutton_b" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "alt1_button_image" ), "xenonbutton_x" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "alt2_button_image" ), "xenonbutton_y" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "back_button_image" ), "xenonbutton_back" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "start_button_image" ), "xenonbutton_start" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_shoulder_button_image" ), "xenonbutton_lb" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_shoulder_button_image" ), "xenonbutton_rb" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_stick_button_image" ), "xenonbutton_ls" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_stick_button_image" ), "xenonbutton_rs" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "left_trigger_button_image" ), "xenonbutton_lt" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "right_trigger_button_image" ), "xenonbutton_rt" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_lr_button_image" ), "xenonbutton_dpad_rl" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_up_button_image" ), "xenonbutton_dpad_up" )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, "dpad_down_button_image" ), "xenonbutton_dpad_down" )
end
for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
	local f0_local3 = controller
	local perControllerModel = Engine.GetModelForController( f0_local3 )
	Engine.CreateModel( perControllerModel, "hintText" )
	local clanTagModel = Engine.CreateModel( perControllerModel, "clanTag" )
	Engine.SetModelValue( clanTagModel, Engine.GetClanName( f0_local3 ) )
	Engine.CreateModel( perControllerModel, "WorldSpaceIndicators" )
	local hudItemsModel = Engine.CreateModel( perControllerModel, "hudItems" )
	Engine.CreateModel( hudItemsModel, "stickyImage" )
	Engine.CreateModel( hudItemsModel, "shockImageBottom" )
	Engine.CreateModel( hudItemsModel, "shockImageRight" )
	Engine.CreateModel( hudItemsModel, "shockImageLeft" )
	Engine.CreateModel( hudItemsModel, "shockImageTop" )
	Engine.CreateModel( hudItemsModel, "showCursorHint" )
	Engine.CreateModel( hudItemsModel, "cursorHintImage" )
	Engine.CreateModel( hudItemsModel, "cursorHintText" )
	Engine.CreateModel( hudItemsModel, "cursorHintIconRatio" )
	Engine.CreateModel( hudItemsModel, "sixthsense" )
	Engine.CreateModel( hudItemsModel, "outOfBoundsEndTime" )
	Engine.CreateModel( hudItemsModel, "pulseNoAmmo" )
	Engine.CreateModel( hudItemsModel, "pulseNoLethal" )
	Engine.CreateModel( hudItemsModel, "pulseNoTactical" )
	Engine.CreateModel( hudItemsModel, "armorOverlay" )
	Engine.CreateModel( hudItemsModel, "health" )
	Engine.CreateModel( hudItemsModel, "regenDelayProgress" )
	Engine.CreateModel( hudItemsModel, "showDamageWidget" )
	Engine.CreateModel( hudItemsModel, "cybercomActiveType" )
	Engine.CreateModel( hudItemsModel, "playerSpawned" )
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
	local vehicleModel = Engine.CreateModel( perControllerModel, "vehicle" )
	Engine.CreateModel( vehicleModel, "vehicleType" )
	DataSources.VehicleInfo.clearButtonModels( f0_local3 )
	if Engine.IsProfileSignedIn( f0_local3 ) then
		local f0_local5 = Engine.CreateModel( perControllerModel, "profile" )
		if f0_local5 then
			local initGamerProfileBoolModel = function ( name )
				local newModel = Engine.CreateModel( f0_local5, name )
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
end
local privacy = PartyPrivacy( Engine.GetPartyPrivacy() )
local partyPrivacyModel = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacyStatus" ), privacy )
Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "ButtonStates.ReevaluateDisabledStates" ), false )
if not Dvar.ai_spawn_only_zombies:get() then
	local f0_local2 = "Campaign"
	if not f0_local2 then
	
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CPSwitchMode" ), "mode" ), f0_local2 )
	end
end
local mode = "Zombies"
