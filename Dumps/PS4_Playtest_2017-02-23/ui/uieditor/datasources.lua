require( "ui.uieditor.modifyFunctions" )

if not DataSourceHelpers then
	DataSourceHelpers = {}
end
if not DataSources then
	DataSources = {}
end
function ListHelper_CreateModelsFromTable( baseModel, modelTable )
	for modelName, modelValue in pairs( modelTable ) do
		if type( modelValue ) == "table" then
			ListHelper_CreateModelsFromTable( Engine.CreateModel( baseModel, modelName ), modelValue )
		else
			Engine.SetModelValue( Engine.CreateModel( baseModel, modelName ), modelValue )
		end
	end
end

function ListHelper_GetListHelperModel( list, create )
	if create then
		return Engine.CreateModel( Engine.GetModelForController( list.dataSourceController ), list.customDataSourceHelper )
	else
		return Engine.GetModel( Engine.GetModelForController( list.dataSourceController ), list.customDataSourceHelper )
	end
end

function ListHelper_Prepare( list, controller, listModelName, getInfoTableFn, filter, customSetupFn )
	list[listModelName] = {}
	list.customDataSourceHelper = listModelName
	list.dataSourceController = controller
	local listModel = ListHelper_GetListHelperModel( list, true )
	local infoTable = getInfoTableFn( controller, list )
	for index, tableItem in ipairs( infoTable ) do
		local f3_local3 = Engine.GetModel( listModel, index )
		if f3_local3 then
			Engine.UnsubscribeAndFreeModel( f3_local3 )
		end
		f3_local3 = Engine.CreateModel( listModel, index )
		if tableItem.models then
			ListHelper_CreateModelsFromTable( f3_local3, tableItem.models )
		end
		if tableItem.properties and tableItem.properties.loopEdges ~= nil then
			list.loopEdges = tableItem.properties.loopEdges
		end
		if not filter or filter( f3_local3 ) then
			table.insert( list[listModelName], {
				model = f3_local3,
				properties = tableItem.properties
			} )
		end
	end
	if customSetupFn then
		customSetupFn( controller, list, listModel )
	end
end

function ListHelper_GetCount( list )
	if list.customDataSourceHelper and list[list.customDataSourceHelper] then
		return #list[list.customDataSourceHelper]
	else
		return 0
	end
end

function ListHelper_GetItem( controller, list, index )
	if list.customDataSourceHelper and list[list.customDataSourceHelper] then
		return list[list.customDataSourceHelper][index].model
	else
		return nil
	end
end

function ListHelper_GetCustomPropertiesForItem( list, index )
	if list.customDataSourceHelper and list[list.customDataSourceHelper] then
		return list[list.customDataSourceHelper][index].properties
	else
		return nil
	end
end

function ListHelper_Cleanup( list, controller )
	local listModel = ListHelper_GetListHelperModel( list, false )
	if listModel then
		Engine.UnsubscribeAndFreeModel( listModel )
	end
end

function ListHelper_SetupDataSource( listModelName, getInfoTableFn, freeOnClose, listFnTable, customSetupFn, getSpacerAfterRowFn )
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
	
	if LUI.DEV then
		dataSourceTable.infoTableFn = getInfoTableFn
	end
	return dataSourceTable
end

DataSourceHelpers.ListSetup = ListHelper_SetupDataSource
function ListHelper_SetupDataSource_CustomPrepare( listModelName, prepareFn, freeOnClose, listFnTable )
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

function GetAccoladesXOfY( controller, mapName, fromCombatRecord )
	local mapData = CoD.MapUtility.MapsTable[mapName]
	local completedAccoladeCount = 0
	local accoladeCount = 0
	if mapData and mapData.accoladelist then
		local iteratedList = Engine.GetAssetList( mapData.accoladelist )
		if iteratedList ~= nil then
			accoladeCount = #iteratedList
			local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
			if fromCombatRecord or CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true then
				currentStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
			end
			for i = 0, 18, 1 do
				if currentStats.PlayerStatsByMap[mapData.rootMapName].accolades[i].state:get() ~= 0 then
					completedAccoladeCount = completedAccoladeCount + 1
				end
			end
		end
	end
	return completedAccoladeCount, accoladeCount
end

function ClientHasCollectible( controller, mapName, index, fromCombatRecord )
	if fromCombatRecord or CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true then
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
		return stats.PlayerStatsByMap[mapName].collectibles[index]:get() == 1
	else
		return Engine.ClientHasCollectible( controller, mapName, index, Enum.eModes.MODE_CAMPAIGN )
	end
end

function GetCollectiblesXOfY( controller, mapName, fromCombatRecord )
	local mapData = CoD.MapUtility.MapsTable[mapName]
	local collectibleCount = 0
	local collectedCollectibleCount = 0
	if mapData and mapData.collectibles then
		local iteratedList = Engine.GetAssetList( mapData.collectibles )
		if iteratedList ~= nil then
			collectibleCount = #iteratedList
			for i = 0, collectibleCount - 1, 1 do
				if ClientHasCollectible( controller, mapName, i, fromCombatRecord ) then
					collectedCollectibleCount = collectedCollectibleCount + 1
				end
			end
		end
	end
	return collectedCollectibleCount, collectibleCount
end

DataSourceHelpers.CustomListSetup = ListHelper_SetupDataSource_CustomPrepare
DataSourceHelpers.GlobalDataSourceSetup = function ( datasourceName, rootModelName, prepareFunction, freeOnInvalidate )
	DataSources[datasourceName] = {
		_cachedModel = nil,
		getModel = function ( controller )
			if not DataSources[datasourceName]._cachedModel then
				local globalRootModel = DataSources.GlobalModel.getModel( controller )
				DataSources[datasourceName]._cachedModel = globalRootModel:create( rootModelName )
				prepareFunction( DataSources[datasourceName]._cachedModel, controller )
			end
			return DataSources[datasourceName]._cachedModel
		end,
		invalidate = function ( controller )
			if not ignoreFreeOnInvalidate and freeOnInvalidate and DataSources[datasourceName]._cachedModel then
				if LUI.DEV then
					local f17_local0 = LUI.DEV.ErrorIfModelsDoNotMatch
					local f17_local1 = DataSources[datasourceName]._cachedModel
					local f17_local2 = DataSources.GlobalModel.getModel( controller )
					local modelsAreDifferent = f17_local0( f17_local1, f17_local2[rootModelName] )
				end
				Engine.UnsubscribeAndFreeModel( DataSources[datasourceName]._cachedModel )
			end
			DataSources[datasourceName]._cachedModel = nil
		end,
		recreate = function ( controller )
			if not DataSources[datasourceName]._cachedModel then
				return DataSources[datasourceName].getModel( controller )
			else
				prepareFunction( DataSources[datasourceName]._cachedModel, controller )
				return DataSources[datasourceName]._cachedModel
			end
		end
	}
	if LUI.DEV then
		DataSources[datasourceName].prepareFn = prepareFunction
	end
end

DataSourceHelpers.PerControllerDataSourceSetup = function ( datasourceName, rootModelName, prepareFunction, freeOnInvalidate )
	DataSources[datasourceName] = {
		_cachedModels = {},
		getModel = function ( controller )
			if not DataSources[datasourceName]._cachedModels[controller] then
				local controllerModel = DataSources.PerController.getModel( controller )
				DataSources[datasourceName]._cachedModels[controller] = controllerModel:create( rootModelName )
				prepareFunction( DataSources[datasourceName]._cachedModels[controller], controller )
			end
			return DataSources[datasourceName]._cachedModels[controller]
		end,
		invalidate = function ( controller )
			if freeOnInvalidate and DataSources[datasourceName]._cachedModels[controller] then
				if LUI.DEV then
					local f21_local0 = LUI.DEV.ErrorIfModelsDoNotMatch
					local f21_local1 = DataSources[datasourceName]._cachedModels[controller]
					local f21_local2 = DataSources.PerController.getModel( controller )
					local modelsAreDifferent = f21_local0( f21_local1, f21_local2[rootModelName] )
				end
				Engine.UnsubscribeAndFreeModel( DataSources[datasourceName]._cachedModels[controller] )
			end
			DataSources[datasourceName]._cachedModels[controller] = nil
		end,
		recreate = function ( controller )
			if not DataSources[datasourceName]._cachedModels[controller] then
				return DataSources[datasourceName].getModel( controller )
			else
				prepareFunction( DataSources[datasourceName]._cachedModels[controller], controller )
				return DataSources[datasourceName]._cachedModels[controller]
			end
		end
	}
	if LUI.DEV then
		DataSources[datasourceName].prepareFn = prepareFunction
	end
end

function RefreshListFindSelectedXuid( controller, list )
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
	list:updateDataSource( true, true )
	local xuidItem = nil
	if xuid ~= nil then
		xuidItem = list:findVisibleItem( {
			xuid = xuid
		}, nil )
		if not xuidItem then
			xuidItem = list:findItem( {
				xuid = xuid
			}, nil, true )
		elseif xuidItem ~= list.activeWidget then
			list:setActiveItem( xuidItem )
		end
	end
	if not xuidItem then
		list:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

DataSources.CreateFetchedListSource = function ( dataSourceName, fetchedListUserData )
	local fields = {
		getModel = function ( controller )
			return fetchedListUserData.model
		end,
		prepare = function ( controller, list, filter )
			DataSources[dataSourceName].activeLists[list] = true
			list.customProperties = {}
			if not list.statusSubscription then
				list.statusSubscription = list:subscribeToModel( fetchedListUserData.statusModel, function ( model )
					list.customProperties = {}
					list:updateDataSource( false, true, true )
				end, false )
			end
			if #fetchedListUserData.fetchingPages == 0 and #fetchedListUserData.fetchedPages == 0 then
				DataSources[dataSourceName].getItem( controller, list, 1 )
			end
		end,
		getModel = function ( controller )
			return fetchedListUserData.model
		end,
		getCount = function ( list )
			return fetchedListUserData.totalCount
		end,
		getItem = function ( controller, list, index )
			local cIndex = index - 1
			local args, extraOffset = DataSources[dataSourceName].getArguments( controller, list, index )
			if not args then
				args = {}
			end
			if not extraOffset then
				extraOffset = 0
			end
			local model, data = fetchedListUserData:getItem( controller, cIndex, args, extraOffset )
			if not model then
				return nil
			elseif list.prepared and DataSources[dataSourceName].prefetchOffset > 0 and 1 < fetchedListUserData.pageCount then
				local prefetchIndex = nil
				if list.lastDirection == "left" or list.lastDirection == "up" then
					prefetchIndex = math.max( 1, index + DataSources[dataSourceName].prefetchOffset - fetchedListUserData.pageSize * 2 )
				else
					prefetchIndex = index + DataSources[dataSourceName].prefetchOffset
				end
				if not fetchedListUserData:isPageFetching( controller, prefetchIndex ) and not fetchedListUserData:isPageFetched( controller, prefetchIndex ) then
					local prefetchArgs, prefetchExtraOffset = DataSources[dataSourceName].getArguments( controller, list, prefetchIndex )
					if not prefetchArgs then
						prefetchArgs = {}
					end
					if not prefetchExtraOffset then
						prefetchExtraOffset = 0
					end
					fetchedListUserData:getItem( controller, prefetchIndex - 1, prefetchArgs, prefetchExtraOffset )
				end
			end
			local setupData = DataSources[dataSourceName].setupItem( model, data or {}, controller, list, index )
			if setupData.models then
				ListHelper_CreateModelsFromTable( model, setupData.models )
			end
			list.customProperties[index] = setupData.properties
			return model
		end,
		cleanup = function ( list, controller )
			DataSources[dataSourceName].activeLists[list] = nil
			local hasList = false
			local f31_local0, f31_local1, f31_local2 = pairs( DataSources[dataSourceName].activeLists )
			local list, _ = f31_local0( f31_local1, f31_local2 )
			if list ~= nil then
				f31_local2 = list
				hasList = true
			else
				
			end
			if not hasList then
				fetchedListUserData:cancelAllPages( controller )
			end
		end,
		getCustomPropertiesForItem = function ( list, index )
			return list.customProperties[index]
		end,
		refresh = function ( controller )
			fetchedListUserData:cancelAllPages( controller )
			for list, _ in pairs( DataSources[dataSourceName].activeLists ) do
				list:updateDataSource()
			end
		end,
		activeLists = {},
		prefetchOffset = 0,
		getArguments = function ( controller, list, index )
			return {}, 0
		end,
		setupItem = function ( model, data, controller, list, index )
			return {
				models = data
			}
		end
	}
	DataSources[dataSourceName] = LuaUtils.OverrideTable( fields, DataSources[dataSourceName] )
end

DataSources.GlobalSources = {
	getModel = function ( controller )
		return DataSources.GlobalSources.Model
	end
}
DataSources.GlobalModel = {
	getModel = function ()
		return Engine.GetGlobalModel()
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
	getModel = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		local identityBadgeModel = Engine.CreateModel( perControllerModel, "identityBadge" )
		local xuid = Engine.CreateModel( identityBadgeModel, "xuid" )
		Engine.SetModelValue( xuid, Engine.GetXUID64( controller ) )
		local gamertagModel = Engine.CreateModel( identityBadgeModel, "gamertag" )
		Engine.SetModelValue( gamertagModel, Engine.GetSelfGamertag( controller ) )
		local clantagModel = Engine.CreateModel( identityBadgeModel, "clantag" )
		Engine.SetModelValue( clantagModel, Engine.GetClanName( controller ) )
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
}
DataSources.PerClient = {
	getModel = function ( controller )
		local clientNum = Engine.GetClientNum( controller )
		local perClientModel = Engine.GetModelForClient( clientNum )
		local f44_local0 = perClientModel:create( "clientNum" )
		f44_local0:set( clientNum )
		return perClientModel
	end
}
DataSources.Clients = {
	prepare = function ( controller, list, filter )
		local teamID = CoD.TeamUtility.GetTeamID( controller )
		if teamID == Enum.team_t.TEAM_SPECTATOR then
			if CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
				teamID = Enum.team_t.TEAM_AXIS
			else
				teamID = Enum.team_t.TEAM_ALLIES
			end
		end
		if list.friendlyTeam then
			list.clients = CoD.LobbyUtility.GetTeam( teamID )
			return 
		elseif list.enemyTeam then
			list.clients = CoD.LobbyUtility.GetEnemyTeam( teamID )
			return 
		else
			list.clients = CoD.LobbyUtility.GetClientList()
		end
	end,
	getCount = function ( list )
		return #list.clients
	end,
	getItem = function ( controller, list, index )
		return Engine.GetModelForClient( list.clients[index].clientNum )
	end
}
DataSources.WorldSpaceIndicators = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "WorldSpaceIndicators" )
	end
}
DataSources.MessageDialog = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
		return model
	end
}
DataSources.AccountLinkLogin = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
		Engine.SetModelValue( Engine.CreateModel( model, "email" ), Engine.Localize( "ACCOUNT_LINK_EMAIL" ) )
		Engine.SetModelValue( Engine.CreateModel( model, "password" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
		Engine.SetModelValue( Engine.CreateModel( model, "stars" ), Engine.Localize( "ACCOUNT_LINK_PASSWORD" ) )
		return model
	end
}
DataSources.AccountLinkRegister = {
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
}
DataSources.TermsOfService = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "TermsOfService" )
		local message = Engine.GetTermsOfService( controller )
		Engine.SetModelValue( Engine.CreateModel( model, "message" ), message )
		return model
	end
}
DataSources.Gender = {
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
}
DataSources.Month = {
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
}
DataSources.Day = {
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
}
DataSources.Year = {
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
}
DataSources.TabbedView = {
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
}
DataSources.StartMenuTabs = ListHelper_SetupDataSource( "StartMenuTabs", function ( controller )
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
		local tabWidgetName = "CoD.StartMenu_GameOptions"
		if Engine.IsZombiesGame() then
			tabWidgetName = "CoD.StartMenu_GameOptions_ZM"
		end
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "MENU_THEATER_CAPS" ),
				tabWidget = tabWidgetName,
				tabIcon = ""
			},
			properties = {
				tabId = "gameOptions"
			}
		} )
	elseif Engine.IsInGame() then
		if IsGameTypeDOA() and not InSafehouse() then
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
					tabName = "CPUI_CAREER",
					tabWidget = "CoD.StartMenu_GameOptions_CP",
					tabIcon = ""
				},
				properties = {
					tabId = "gameOptions"
				}
			} )
			if not Engine.IsCampaignModeZombies() and CoD.isSafehouse and CoD.isOnlineGame() and not IsInTrainingSim( controller ) and Dvar.ui_safehousebarracks:get() and not IsPlayerAGuest( controller ) then
				table.insert( tabList, {
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
			table.insert( tabList, {
				models = {
					tabName = "MENU_TAB_MAP_CAPS",
					tabWidget = "CoD.StartMenu_GameOptions_Map",
					tabIcon = ""
				},
				properties = {
					tabId = "gameOptions"
				}
			} )
		elseif Engine.IsZombiesGame() then
			table.insert( tabList, {
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
			if (IsIntDvarNonZero( "mp_prototype" ) or IsIntDvarNonZero( "mp_prototype_debug" )) and not CoD.IsShoutcaster( controller ) then
				table.insert( tabList, {
					models = {
						tabName = "MENU_LOADOUT",
						tabWidget = "CoD.StartMenu_EditLoadout",
						tabIcon = ""
					},
					properties = {
						tabId = "editLoadout"
					}
				} )
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
			if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST ) == false and Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE ) == false and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_PLAY_OF_THE_MATCH ) and CoD.IsTeamChangeAllowed( controller ) then
				table.insert( tabList, {
					models = {
						tabName = "MPUI_CHANGE_TEAM",
						tabWidget = "CoD.StartMenu_ChangeTeam",
						tabIcon = ""
					},
					properties = {
						tabId = "changeTeam"
					}
				} )
			end
		end
	else
		if not IsPlayerAGuest( controller ) then
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
		end
		if CoD.DirectorUtility.IsDirectorEnabled( controller ) then
			table.insert( tabList, {
				models = {
					tabName = "MENU_LOADOUT",
					tabWidget = "CoD.StartMenu_LoadoutModeSelect",
					tabIcon = ""
				},
				properties = {
					tabId = "loadoutModeSelect"
				}
			} )
		end
		if not IsLobbyNetworkModeLAN() and not Dvar.ui_execdemo:get() and not Engine.IsCampaignModeZombies() and not IsPlayerAGuest( controller ) then
			table.insert( tabList, {
				models = {
					tabName = "MENU_TAB_CHALLENGES_CAPS",
					tabWidget = "CoD.StartMenu_Challenges",
					tabIcon = ""
				},
				properties = {
					tabId = "challenges"
				}
			} )
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
			if CommunityOptionsEnabled() then
				local selectIndex = CoD.perController[controller].openMediaTabAfterClosingGroups
				CoD.perController[controller].openMediaTabAfterClosingGroups = false
				table.insert( tabList, {
					models = {
						tabName = "MENU_TAB_MEDIA_CAPS",
						tabWidget = "CoD.StartMenu_Media",
						tabIcon = ""
					},
					properties = {
						tabId = "media",
						selectIndex = selectIndex
					}
				} )
			end
		end
	end
	if IsGameTypeDOA() and Engine.IsInGame() and not InSafehouse() then
		local f68_local0 = table.insert
		local f68_local1 = tabList
		local f68_local2 = {
			models = {
				tabName = "MENU_TAB_OPTIONS_CAPS",
				tabWidget = "CoD.StartMenu_Options_DOA",
				tabIcon = ""
			}
		}
		local f68_local3 = {
			tabId = "options"
		}
		local f68_local4 = Dvar.ui_execdemo:get()
		if f68_local4 then
			f68_local4 = not Engine.IsInGame()
		end
		f68_local3.selectIndex = f68_local4
		f68_local2.properties = f68_local3
		f68_local0( f68_local1, f68_local2 )
	else
		local f68_local0 = table.insert
		local f68_local1 = tabList
		local f68_local2 = {
			models = {
				tabName = "MENU_TAB_OPTIONS_CAPS",
				tabWidget = "CoD.StartMenu_Options",
				tabIcon = ""
			}
		}
		local f68_local3 = {
			tabId = "options"
		}
		local f68_local4 = Dvar.ui_execdemo_gamescom:get()
		if f68_local4 then
			f68_local4 = not Engine.IsInGame()
		end
		f68_local3.selectIndex = f68_local4
		f68_local2.properties = f68_local3
		f68_local0( f68_local1, f68_local2 )
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
end )
DataSources.GameSettingsTabs = ListHelper_SetupDataSource( "GameSettingsTabs", function ( controller )
	local tabList = {}
	local gametype = Dvar.ui_gametype:get()
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	local gametypeName = gameTypeInfo.nameRefCaps
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
			tabName = gametypeName,
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
			tabName = "MENU_SPECIALIST_SETTINGS_CAPS",
			tabWidget = "CoD.GameSettings_Characters",
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
end, true )
DataSources.GameSettingsCompetitiveTabs = ListHelper_SetupDataSource( "GameSettingsCompetitiveTabs", function ( controller )
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
			tabName = "MENU_SETTINGS_CAPS",
			tabWidget = "CoD.GameSettings_CompetitiveSettings",
			tabIcon = ""
		},
		properties = {
			tabId = "game_mode_rules"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_ADVANCED_CAPS",
			tabWidget = "CoD.GameSettings_CompetitiveAdvancedSettings",
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
end, true )
DataSources.CallingCardsTabs = ListHelper_SetupDataSource( "CallingCardsTabs", function ( controller )
	local tabList = {}
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	local filterMasteryFunction = function ( ignoreMasteries )
		return function ( challenge )
			local f73_local0
			if challenge.challengeRow == nil or challenge.isLocked or challenge.isMastery == ignoreMasteries then
				f73_local0 = false
			else
				f73_local0 = true
			end
			return f73_local0
		end
		
	end
	
	local getBreadcrumbsForChallengeList = function ( challengeList, filterFn )
		local breadcrumbs = 0
		for _, challenge in ipairs( challengeList ) do
			if (not filterFn or filterFn( challenge )) and Engine.IsEmblemBackgroundNew( controller, challenge.imageID ) then
				breadcrumbs = breadcrumbs + 1
			end
		end
		return breadcrumbs
	end
	
	local getBreadcrumbsForDefaultCategory = function ()
		local breadcrumbs = 0
		local defaultBackgrounds = Engine.GetBackgroundsForCategoryName( controller, "default" )
		for _, background in ipairs( defaultBackgrounds ) do
			if Engine.IsEmblemBackgroundNew( controller, background.id ) then
				breadcrumbs = breadcrumbs + 1
			end
		end
		return breadcrumbs
	end
	
	local createCallingCardTab = function ( displayName, tabWidget, category, id, breadcrumbCount )
		table.insert( tabList, {
			models = {
				tabName = displayName,
				tabWidget = tabWidget,
				tabCategory = category,
				breadcrumbCount = breadcrumbCount,
				tabIcon = ""
			},
			properties = {
				tabId = id
			}
		} )
	end
	
	local cpCallingCards = Engine.GetChallengeInfoForImages( controller, nil, Enum.eModes.MODE_CAMPAIGN )
	createCallingCardTab( "MENU_DEFAULT_CAPS", "CoD.CallingCards_Stickerbook_Default", "default", "callingcards_default", getBreadcrumbsForDefaultCategory() )
	createCallingCardTab( "MENU_CAMPAIGN_CAPS", "CoD.CallingCards_Stickerbook", "cp", "callingcards_cp", getBreadcrumbsForChallengeList( cpCallingCards, filterMasteryFunction( true ) ) )
	if not IsLobbyNetworkModeLAN() then
		local mpCallingCards = Engine.GetChallengeInfoForImages( controller, nil, Enum.eModes.MODE_MULTIPLAYER )
		local zmCallingCards = Engine.GetChallengeInfoForImages( controller, nil, Enum.eModes.MODE_ZOMBIES )
		createCallingCardTab( "MENU_MULTIPLAYER_CAPS", "CoD.CallingCards_Stickerbook", "mp", "callingcards_mp", getBreadcrumbsForChallengeList( mpCallingCards, filterMasteryFunction( true ) ) )
		createCallingCardTab( "MENU_ZOMBIES_CAPS", "CoD.CallingCards_Stickerbook", "zm", "callingcards_zm", getBreadcrumbsForChallengeList( zmCallingCards, filterMasteryFunction( true ) ) )
		local masterCrumbs = getBreadcrumbsForChallengeList( cpCallingCards, filterMasteryFunction( false ) ) + getBreadcrumbsForChallengeList( mpCallingCards, filterMasteryFunction( false ) ) + getBreadcrumbsForChallengeList( zmCallingCards, filterMasteryFunction( false ) )
		createCallingCardTab( "MENU_MASTERS_CAPS", "CoD.CallingCards_Stickerbook_Master", "master", "callingcards_master", masterCrumbs )
	end
	if IsLive() then
		local callingCardRows = CoD.BlackMarketUtility.GetCallingCardRows()
		local breadcrumbs = 0
		for _, callingCardRow in ipairs( callingCardRows ) do
			local callingCardName = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, callingCardRow, 0 )
			if not CoD.BlackMarketUtility.IsItemLocked( controller, callingCardName ) then
				local backgroundsTableId = CoD.BlackMarketUtility.GetLootCallingCardIndex( controller, callingCardName )
				if backgroundsTableId and Engine.IsEmblemBackgroundNew( controller, backgroundsTableId ) then
					breadcrumbs = breadcrumbs + 1
				end
			end
		end
		createCallingCardTab( "MENU_BLACK_MARKET", "CoD.CallingCards_Set_BlackMarket", "loot", "callingcards_bm", breadcrumbs )
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
end )
DataSources.CPChallengesTabs = ListHelper_SetupDataSource( "CPChallengesTabs", function ( controller )
	local tabList = {}
	local challengeCategoryModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local lastSelected = "missions"
	if challengeCategoryModel ~= nil then
		lastSelected = Engine.GetModelValue( challengeCategoryModel )
	end
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
			tabName = "MENU_CHALLENGE_CATEGORY_MISSIONS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "missions"
		},
		properties = {
			tabId = "missions",
			disabled = Challenges_IsCategoryLocked( nil, controller, "missions" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_TOOLSOFTHETRADE_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "tott"
		},
		properties = {
			tabId = "tott",
			disabled = Challenges_IsCategoryLocked( nil, controller, "tott" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_CAREER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "career"
		},
		properties = {
			tabId = "career",
			disabled = Challenges_IsCategoryLocked( nil, controller, "career" ),
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
	for tabIndex = 1, #tabList, 1 do
		if tabList[tabIndex].properties ~= nil then
			if tabList[tabIndex].models.tabCategory == lastSelected then
				tabList[tabIndex].properties.selectIndex = true
			else
				tabList[tabIndex].properties.selectIndex = false
			end
		end
	end
	return tabList
end )
DataSources.CPGamePlayBundleData = {
	getModel = function ( controller )
		local f78_local0 = Engine.GetModelForController( controller )
		local bundleModel = f78_local0.GamePlayBundle
		if not bundleModel then
			local f78_local1 = Engine.GetModelForController( controller )
			bundleModel = f78_local1:create( "GamePlayBundle" )
			f78_local1 = bundleModel:create( "briefcaseClient" )
			f78_local1:set( -1 )
			f78_local1 = bundleModel:create( "hackPercentage" )
			f78_local1:set( -1 )
		end
		return bundleModel
	end
}
DataSources.ZMChallengesTabs = ListHelper_SetupDataSource( "ZMChallengesTabs", function ( controller )
	local tabList = {}
	local challengeCategoryModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local lastSelected = "missions"
	if challengeCategoryModel ~= nil then
		lastSelected = Engine.GetModelValue( challengeCategoryModel )
	end
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
			tabName = "MENU_CHALLENGE_CATEGORY_ZOMBIEHUNTER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "zombiehunter"
		},
		properties = {
			tabId = "zombiehunter",
			disabled = Challenges_IsCategoryLocked( nil, controller, "zombiehunter" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_SURVIVALIST_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "survivalist"
		},
		properties = {
			tabId = "survivalist",
			disabled = Challenges_IsCategoryLocked( nil, controller, "survivalist" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_GUMGOBBLER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "gumgobbler"
		},
		properties = {
			tabId = "gumgobbler",
			disabled = Challenges_IsCategoryLocked( nil, controller, "gumgobbler" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
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
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for tabIndex = 1, #tabList, 1 do
		if tabList[tabIndex].properties ~= nil then
			if tabList[tabIndex].models.tabCategory == lastSelected then
				tabList[tabIndex].properties.selectIndex = true
			else
				tabList[tabIndex].properties.selectIndex = false
			end
		end
	end
	return tabList
end )
DataSources.ChallengesTabs = ListHelper_SetupDataSource( "ChallengesTabs", function ( controller )
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
			tabName = "MPUI_SUMMARY_CAPS",
			tabWidget = "CoD.Challenges_MP_Summary",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_mp_summary"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_OPERATIONS_CAPS",
			tabWidget = "CoD.Challenges_FrameWidget_Operations",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_frameWidget_operations"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "HEROES_SPECIALISTS_CAPS",
			tabWidget = "CoD.Challenges_FrameWidget_Specialists",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_framewidget_specialists"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_SCORESTREAKS_CAPS",
			tabWidget = "CoD.Challenges_FrameWidget_Scorestreaks",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_framewidget_scorestreaks"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_EMBLEM_BACKGROUND_PRESTIGETAB",
			tabWidget = "CoD.Challenges_FrameWidget_Prestige",
			tabIcon = ""
		},
		properties = {
			tabId = "challenges_framewidget_prestige"
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
end )
DataSources.OperationsTabs = ListHelper_SetupDataSource( "OperationsTabs", function ( controller )
	local tabList = {}
	local challengeCategoryModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local lastSelected = "bootcamp"
	if challengeCategoryModel ~= nil then
		lastSelected = Engine.GetModelValue( challengeCategoryModel )
	end
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
			tabName = "MENU_CHALLENGE_CATEGORY_BOOTCAMP_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "bootcamp"
		},
		properties = {
			tabId = "bootcamp",
			disabled = Challenges_IsCategoryLocked( nil, controller, "bootcamp" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_KILLER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "killer"
		},
		properties = {
			tabId = "killer",
			disabled = Challenges_IsCategoryLocked( nil, controller, "killer" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_HUMILIATION_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "humiliation"
		},
		properties = {
			tabId = "humiliation",
			disabled = Challenges_IsCategoryLocked( nil, controller, "humiliation" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_CAREER_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "career"
		},
		properties = {
			tabId = "career",
			disabled = Challenges_IsCategoryLocked( nil, controller, "career" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_GAMEVICTORIES_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "gamevictories"
		},
		properties = {
			tabId = "gamevictories",
			disabled = Challenges_IsCategoryLocked( nil, controller, "gamevictories" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_GAMEHEROICS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "gameheroics"
		},
		properties = {
			tabId = "gameheroics",
			disabled = Challenges_IsCategoryLocked( nil, controller, "gameheroics" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
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
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for tabIndex = 1, #tabList, 1 do
		if tabList[tabIndex].properties ~= nil then
			if tabList[tabIndex].models.tabCategory == lastSelected then
				tabList[tabIndex].properties.selectIndex = true
			else
				tabList[tabIndex].properties.selectIndex = false
			end
		end
	end
	return tabList
end )
DataSources.SpecialistsTabs = ListHelper_SetupDataSource( "SpecialistsTabs", function ( controller )
	local tabList = {}
	local challengeCategoryModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local lastSelected = "weapons"
	if challengeCategoryModel ~= nil then
		lastSelected = Engine.GetModelValue( challengeCategoryModel )
	end
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
			tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTWEAPONS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "weapons"
		},
		properties = {
			tabId = "weapons",
			disabled = Challenges_IsCategoryLocked( nil, controller, "weapons" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTABILITIES_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "abilities"
		},
		properties = {
			tabId = "abilities",
			disabled = Challenges_IsCategoryLocked( nil, controller, "abilities" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_SPECIALISTKILLJOYS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "killjoys"
		},
		properties = {
			tabId = "killjoys",
			disabled = Challenges_IsCategoryLocked( nil, controller, "killjoys" ),
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
	for tabIndex = 1, #tabList, 1 do
		if tabList[tabIndex].properties ~= nil then
			if tabList[tabIndex].models.tabCategory == lastSelected then
				tabList[tabIndex].properties.selectIndex = true
			else
				tabList[tabIndex].properties.selectIndex = false
			end
		end
	end
	return tabList
end )
DataSources.ScorestreaksTabs = ListHelper_SetupDataSource( "ScorestreaksTabs", function ( controller )
	local tabList = {}
	local challengeCategoryModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local lastSelected = "airassault"
	if challengeCategoryModel ~= nil then
		lastSelected = Engine.GetModelValue( challengeCategoryModel )
	end
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
			tabName = "MENU_CHALLENGE_CATEGORY_AIR_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "airassault"
		},
		properties = {
			tabId = "airassault",
			disabled = Challenges_IsCategoryLocked( nil, controller, "airassault" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_GROUND_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "groundassault"
		},
		properties = {
			tabId = "groundassault",
			disabled = Challenges_IsCategoryLocked( nil, controller, "groundassault" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_SUPPORT_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "support"
		},
		properties = {
			tabId = "support",
			disabled = Challenges_IsCategoryLocked( nil, controller, "support" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_RETURNFIRE_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "returnfire"
		},
		properties = {
			tabId = "returnfire",
			disabled = Challenges_IsCategoryLocked( nil, controller, "returnfire" ),
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
	for tabIndex = 1, #tabList, 1 do
		if tabList[tabIndex].properties ~= nil then
			if tabList[tabIndex].models.tabCategory == lastSelected then
				tabList[tabIndex].properties.selectIndex = true
			else
				tabList[tabIndex].properties.selectIndex = false
			end
		end
	end
	return tabList
end )
DataSources.PrestigeTabs = ListHelper_SetupDataSource( "PrestigeTabs", function ( controller )
	local tabList = {}
	local challengeCategoryModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	local lastSelected = "combathandling"
	if challengeCategoryModel ~= nil then
		lastSelected = Engine.GetModelValue( challengeCategoryModel )
	end
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
			tabName = "MENU_CHALLENGE_CATEGORY_COMBATHANDLING_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "combathandling"
		},
		properties = {
			tabId = "combathandling",
			disabled = Challenges_IsCategoryLocked( nil, controller, "combathandling" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_COMBATEFFICIENCY_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "combatefficiency"
		},
		properties = {
			tabId = "combatefficiency",
			disabled = Challenges_IsCategoryLocked( nil, controller, "combatefficiency" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_PERKS1_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "perks1"
		},
		properties = {
			tabId = "perks1",
			disabled = Challenges_IsCategoryLocked( nil, controller, "perks1" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_PERKS2_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "perks2"
		},
		properties = {
			tabId = "perks2",
			disabled = Challenges_IsCategoryLocked( nil, controller, "perks2" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_PERKS3_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "perks3"
		},
		properties = {
			tabId = "perks3",
			disabled = Challenges_IsCategoryLocked( nil, controller, "perks3" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_LETHALS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "lethals"
		},
		properties = {
			tabId = "lethals",
			disabled = Challenges_IsCategoryLocked( nil, controller, "lethals" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_TACTICALS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "tacticals"
		},
		properties = {
			tabId = "tacticals",
			disabled = Challenges_IsCategoryLocked( nil, controller, "tacticals" ),
			selectIndex = false
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_CHALLENGE_CATEGORY_WILDCARDS_CAPS",
			tabWidget = "CoD.Challenges_MP_Stickerbook",
			tabIcon = "",
			tabCategory = "wildcards"
		},
		properties = {
			tabId = "wildcards",
			disabled = Challenges_IsCategoryLocked( nil, controller, "wildcards" ),
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
	for tabIndex = 1, #tabList, 1 do
		if tabList[tabIndex].properties ~= nil then
			if tabList[tabIndex].models.tabCategory == lastSelected then
				tabList[tabIndex].properties.selectIndex = true
			else
				tabList[tabIndex].properties.selectIndex = false
			end
		end
	end
	return tabList
end )
DataSources.GameSettingsOptions = ListHelper_SetupDataSource( "GameSettingsOptions", function ( controller )
	local tabList = {}
	if IsLive() then
		table.insert( tabList, {
			models = {
				displayText = "MENU_SAVE",
				description = "MENU_SAVE_DESCRIPTION",
				action = SaveCustomGame,
				icon = "t7_icon_menu_simple_save",
				disabled = false
			}
		} )
	end
	table.insert( tabList, {
		models = {
			displayText = "MENU_REVERT_CHANGES",
			description = "MENU_REVERT_CHANGES_DESCRIPTION",
			action = ResetGameSettings,
			icon = "t7_icon_menu_simple_revertchanges",
			disabled = false
		}
	} )
	local selectedSettingModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.selectedSetting" )
	local setting = Engine.GetModelValue( selectedSettingModel )
	local selectedElement = CoD.perController[controller].selectedGameSettingElement
	if selectedElement and selectedElement.revert then
		table.insert( tabList, {
			models = {
				displayText = "MENU_REVERT_SETTING",
				description = "MENU_REVERT_SETTINGS_DESCRIPTION",
				action = ResetSelectedGameSetting,
				icon = "t7_icon_menu_simple_revertsetting",
				disabled = false
			}
		} )
	end
	return tabList
end, true )
DataSources.CodCasterSideBarTabs = ListHelper_SetupDataSource( "CodCasterSideBarTabs", function ( controller )
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
end )
DataSources.EditCodCasterSettingsButtonList = ListHelper_SetupDataSource( "EditCodCasterSettingsButtonList", function ( controller )
	local list = {}
	local SetupTeamIdentityModel = function ( controller, team )
		local teamIdentityModel = DataSources.TeamIdentity.getModel( controller )
		Engine.SetModelValue( Engine.CreateModel( teamIdentityModel, "team" ), team )
	end
	
	local teamIdentityProfileVar = "shoutcaster_fe_team_identity"
	local f87_local0 = CoD.ShoutcasterProfileVarBool( controller, teamIdentityProfileVar ) == false
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
				local f89_local2 = value == 0
				Engine.SetModelValue( disabledModel, f89_local2 )
				button.properties.disabled = f89_local2
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
			disabled = f87_local0,
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
			disabled = f87_local0,
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
end, false, nil, nil, function ( list, row, widgetHeight )
	if list.EditCodCasterSettingsButtonList[row].properties.spacing then
		return list.EditCodCasterSettingsButtonList[row].properties.spacing
	else
		return list.spacing
	end
end )
DataSources.CodCasterQuickSettingsButtonList = ListHelper_SetupDataSource( "CodCasterQuickSettingsButtonList", function ( controller )
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
end )
DataSources.CodCasterDisplaySettingsButtonList = ListHelper_SetupDataSource( "CodCasterDisplaySettingsButtonList", function ( controller )
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
end )
DataSources.CodCasterLoadoutSettingsButtonList = ListHelper_SetupDataSource( "CodCasterLoadoutSettingsButtonList", function ( controller )
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
end )
DataSources.TeamIdentity = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "TeamIdentity" )
	end
}
DataSources.TeamIdentityInformation = {
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
}
DataSources.TeamIdentityColorList = ListHelper_SetupDataSource( "TeamIdentityColorList", function ( controller )
	local list = {}
	if not CoD.CodCaster_TeamIdentity.ColorList then
		CoD.CodCaster_TeamIdentity.ColorList = CoD.CodCasterUtility.GetCodCasterTeamColorList( controller )
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
end )
DataSources.TeamIdentityLogoList = ListHelper_SetupDataSource( "TeamIdentityLogoList", function ( controller )
	local list = {}
	if not CoD.CodCaster_TeamIdentity.LogoList then
		CoD.CodCaster_TeamIdentity.LogoList = CoD.CodCasterUtility.GetCodCasterTeamLogoList( controller )
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
end )
DataSources.MyShowcaseTabs = ListHelper_SetupDataSource( "MyShowcaseTabs", function ( controller )
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
			tabName = Engine.Localize( "MENU_CATEGORIES_CAPS" ),
			tabWidget = "CoD.MyShowcase_CategorySelector",
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
end )
DataSources.MyShowcasePaintjobsTabs = ListHelper_SetupDataSource( "MyShowcasePaintjobsTabs", function ( controller )
	local tabList = {}
	return tabList
end )
DataSources.GametypeSettings = {
	getModel = function ( controller )
		local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
		Engine.CreateModel( gametypeSettingsModel, "title" )
		Engine.CreateModel( gametypeSettingsModel, "description" )
		Engine.CreateModel( gametypeSettingsModel, "image" )
		local gametypeModel = Engine.CreateModel( gametypeSettingsModel, "gametype" )
		local gametype = Dvar.ui_gametype:get()
		local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
		local gametypeName = gameTypeInfo.nameRefCaps
		Engine.SetModelValue( gametypeModel, Engine.Localize( gametypeName ) )
		return gametypeSettingsModel
	end
}
DataSources.GunsmithSnapshot = {
	getModel = function ( controller )
		local currentSessionMode = Engine.CurrentSessionMode()
		if currentSessionMode ~= Enum.eModes.MODE_CAMPAIGN then
			currentSessionMode = Enum.eModes.MODE_MULTIPLAYER
		end
		local gunsmithSnapshotModel = Engine.CreateModel( Engine.GetGlobalModel(), "GunsmithSnapshot" )
		Engine.SetModelValue( Engine.CreateModel( gunsmithSnapshotModel, "Stats" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( gunsmithSnapshotModel, "WeaponLevel" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( gunsmithSnapshotModel, "PlayerID" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( gunsmithSnapshotModel, "WeaponName" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( gunsmithSnapshotModel, "AttachmentIcons" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( gunsmithSnapshotModel, "BO3Logo" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( gunsmithSnapshotModel, "ShowControls" ), 1 )
		Engine.SetModelValue( Engine.CreateModel( gunsmithSnapshotModel, "SessionMode" ), currentSessionMode )
		return gunsmithSnapshotModel
	end
}
DataSources.GunsmithSnapshotStatsList = ListHelper_SetupDataSource( "GunsmithSnapshotStatsList", function ( controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local variantIndexModel = Engine.GetModel( variantModel, "variantIndex" )
	local variantIndex = nil
	if variantIndexModel then
		variantIndex = Engine.GetModelValue( variantIndexModel )
	end
	local weaponIndexModel = Engine.GetModel( variantModel, "weaponIndex" )
	local weaponIndex = nil
	if weaponIndexModel then
		weaponIndex = Engine.GetModelValue( weaponIndexModel )
	end
	local statRowFields = {
		"statName",
		"variantStatValue",
		"weaponStatValue"
	}
	local sessionMode = CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode()
	local weaponStatTypeTable = CoD.CraftUtility.Gunsmith.GetWeaponStatList( controller, weaponIndex, sessionMode )
	local variantChanged = false
	local variantStatValue = 0
	if Gunsmith_IsCurrentVariantChanged( controller ) then
		variantChanged = true
	end
	local CreateGunsmithStatColumnDatasource = function ( controller, index, statType )
		local dataSourceName = "GunsmithStats_Column_" .. tostring( index )
		DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
			local statColumn = {}
			for index, field in ipairs( statRowFields ) do
				if not variantChanged then
					variantStatValue = CoD.CraftUtility.Gunsmith.GetVariantStats( controller, statType, variantIndex + 1, sessionMode )
				end
				table.insert( statColumn, {
					models = {
						statName = CoD.CraftUtility.Gunsmith.GetWeaponStatHeader( statType ),
						variantStatValue = variantStatValue,
						weaponStatValue = CoD.CraftUtility.Gunsmith.GetWeaponStats( controller, statType, weaponIndex, sessionMode ),
						type = field
					}
				} )
			end
			return statColumn
		end )
		return dataSourceName
	end
	
	local snapshotColumnList = {}
	for index, statType in ipairs( weaponStatTypeTable ) do
		table.insert( snapshotColumnList, {
			models = {
				SnapshotStatsColumn = CreateGunsmithStatColumnDatasource( controller, index, statType )
			}
		} )
	end
	return snapshotColumnList
end )
DataSources.CreateAClassEditSettingsName = {
	getModel = function ( controller )
		local createAClassEditSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CreateAClassEditSettingsName" )
		local nameModel = Engine.CreateModel( createAClassEditSettingsModel, "name" )
		Engine.SetModelValue( nameModel, "MENU_CREATE_A_CLASS_SETTINGS" )
		return createAClassEditSettingsModel
	end
}
DataSources.StartMenuGameOptions = ListHelper_SetupDataSource( "StartMenuGameOptions", function ( controller )
	local options = {}
	if Engine.IsDemoPlaying() then
		local segmentCount = Engine.GetDemoSegmentCount()
		local isHighlightReelMode = Engine.IsDemoHighlightReelMode()
		local isClipPlaying = Engine.IsDemoClipPlaying()
		if not IsDemoRestrictedBasicMode() then
			table.insert( options, {
				models = {
					displayText = Engine.ToUpper( Engine.Localize( "MENU_UPLOAD_CLIP", segmentCount ) ),
					action = StartMenuUploadClip,
					disabledFunction = IsUploadClipButtonDisabled
				},
				properties = {
					hideHelpItemLabel = true
				}
			} )
		end
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
		local inTrainingSim = CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "safehouse.inTrainingSim" ) or 0
		if not CoD.isSafehouse and controller == Engine.GetPrimaryController() then
			local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
			table.insert( options, {
				models = {
					displayText = "MENU_RESTART_MISSION_CAPS",
					action = RestartMission
				},
				properties = {
					disabled = not Engine.IsLobbyHost( lobbyType )
				}
			} )
		end
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			if CoD.isSafehouse and inTrainingSim == 1 then
				table.insert( options, {
					models = {
						displayText = "MENU_END_TRAINING_SIM",
						action = EndTrainingSim
					}
				} )
			elseif controller == Engine.GetPrimaryController() then
				if Engine.GetDvarBool( "ui_blocksaves" ) then
					table.insert( options, {
						models = {
							displayText = "MENU_EXIT_CAPS",
							action = SaveAndQuitGame
						}
					} )
				else
					table.insert( options, {
						models = {
							displayText = "MENU_QUIT",
							action = SaveAndQuitGame
						}
					} )
				end
			end
		elseif CoD.isSafehouse and inTrainingSim == 1 then
			table.insert( options, {
				models = {
					displayText = "MENU_END_TRAINING_SIM",
					action = EndTrainingSim
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
		if true == Dvar.ui_autoControlledPlayer:get() then
			table.insert( options, {
				models = {
					displayText = "MENU_AUTO_CONTROL_PLAYER",
					action = function ( self, element, controller, actionParam, menu )
						StartMenuGoBack( menu, controller )
						SendMenuResponse( self, menu.menuName, "autocontrol", controller )
					end
				}
			} )
		end
	elseif CoD.isMultiplayer then
		local team = Engine.Team( controller, "name" )
		if team ~= "TEAM_SPECTATOR" and Engine.GetGametypeSetting( "disableClassSelection" ) ~= 1 and (not IsIntDvarNonZero( "mp_prototype" ) or IsIntDvarNonZero( "mp_prototype_debug" )) then
			table.insert( options, {
				models = {
					displayText = "MPUI_CHOOSE_CLASS_BUTTON_CAPS",
					action = ChooseClass
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
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and ((Engine.SessionModeIsMode( Enum.eNetworkModes.MODE_NETWORK_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( Enum.eNetworkModes.MODE_NETWORK_OFFLINE ) == true) then
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
end, true )
DataSources.PlatformControllerImage = {
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
}
DataSources.MissionObjectives = ListHelper_SetupDataSource( "MissionObjectives", function ( controller )
	local objectives = {}
	local objectiveSpacerHeight = 20
	local objective_table = Engine.GetPlayerObjectives( controller )
	if objective_table == nil then
		return 
	end
	local main_objectives = {}
	local main_objectives_count = 1
	for index, objective in CoD.BaseUtility.PairsByKeys( objective_table ) do
		if objective.status ~= "invisible" and objective.objective_desc ~= nil and objective.objective_desc ~= "" and IsObjectiveVisibleForMyTeam( controller, index - 1 ) then
			if not main_objectives[objective.objective_desc] then
				main_objectives[objective.objective_desc] = {
					index = main_objectives_count,
					desc = objective.objective_desc,
					complete = objective.status == "done"
				}
				main_objectives_count = main_objectives_count + 1
			end
			local f117_local3 = main_objectives[objective.objective_desc]
			local f117_local4 = main_objectives[objective.objective_desc].complete
			if f117_local4 then
				f117_local4 = objective.status == "done"
			end
			f117_local3.complete = f117_local4
			if objective.subobjective_desc and objective.status ~= "done" then
				local subImage = nil
				if objective.subobjective_image and objective.subobjective_image ~= "" then
					subImage = objective.subobjective_image
				end
				if not main_objectives[objective.objective_desc].sub_objectives then
					main_objectives[objective.objective_desc].sub_objectives = {}
				end
				table.insert( main_objectives[objective.objective_desc].sub_objectives, {
					desc = objective.subobjective_desc,
					complete = objective.status == "done",
					subobjective_image = subImage
				} )
			end
		end
	end
	local main_objective_sort = function ( a, b )
		if not main_objectives[b].complete then
			return false
		elseif not main_objectives[a].complete then
			return true
		else
			return main_objectives[a].index < main_objectives[b].index
		end
	end
	
	f117_local1 = function ( obj_table, subobjective, awaitingOrders, spacer )
		return {
			models = {
				objective = obj_table.desc,
				subobjective_image = obj_table.subobjective_image or "blacktransparent"
			},
			properties = {
				completed = obj_table.complete,
				subobjective = subobjective,
				awaitingOrders = awaitingOrders,
				spacer = spacer
			}
		}
	end
	
	local add_awaiting_orders = function ( subobjective )
		return f117_local1( {
			desc = "CPUI_AWAITING_UPDATE"
		}, subobjective, true, objectiveSpacerHeight )
	end
	
	local any_incomplete_objectives = false
	for _, main_objective in LUI.IterateTableBySortedKeys( main_objectives, main_objective_sort ) do
		table.insert( objectives, f117_local1( main_objective ) )
		if not main_objective.complete then
			any_incomplete_objectives = true
			if main_objective.sub_objectives then
				for _, subobjective in ipairs( main_objective.sub_objectives ) do
					table.insert( objectives, f117_local1( subobjective, true, nil, objectiveSpacerHeight ) )
				end
			end
			table.insert( objectives, add_awaiting_orders( true ) )
		end
	end
	if not any_incomplete_objectives then
		table.insert( objectives, 1, add_awaiting_orders( false ) )
	end
	return objectives
end, true, nil, nil, function ( list, row, widgetHeight )
	if list[list.customDataSourceHelper] then
		return list[list.customDataSourceHelper][row].properties.spacer
	else
		
	end
end )
DataSources.OptionsTabSelectionList = {
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
}
DataSources.StartMenuSelectionList = {
	prepare = function ( controller, list, filter )
		list.options = {}
		local options = nil
		if CoD.isCampaign == true then
			if LUI.DEV ~= nil then
				options = {
					{
						optionDisplay = "MENU_RESTART_MISSION_CAPS",
						action = RestartMission
					},
					{
						optionDisplay = "MENU_END_GAME_CAPS",
						action = QuitGame
					}
				}
			else
				options = {
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
}
DataSources.PartyLobbyMembers = {
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
}
DataSources.StorageGlobal = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "storageGlobalRoot" )
		return model
	end
}
DataSources.LobbyRoot = {
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
}
DataSources.LobbyPromptTitle = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPromptModel" )
		local titleModel = Engine.CreateModel( model, "lobbyPromptTitle" )
		local descriptionModel = Engine.CreateModel( model, "lobbyPromptDescription" )
		Engine.SetModelValue( titleModel, CoD.LobbyUtility.Prompt.Title )
		Engine.SetModelValue( descriptionModel, CoD.LobbyUtility.Prompt.Description )
		return model
	end
}
DataSources.LobbyPlaylistName = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
		local nameModel = Engine.CreateModel( model, "name" )
		local kickerTextModel = Engine.CreateModel( model, "kickerText" )
		return model
	end
}
DataSources.LobbyPromptSelectionList = {
	prepare = function ( controller, list, filter )
		list.options = {}
		local options = CoD.LobbyUtility.Prompt.Options
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
}
DataSources.PrototypeLobbyTabs = ListHelper_SetupDataSource( "PrototypeLobbyTabs", function ( controller )
	local tabs = {}
	local f139_local0 = table.insert
	local f139_local1 = tabs
	local f139_local2 = {}
	local f139_local3 = {}
	local f139_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
	f139_local3.lobbyNav = f139_local4.id
	f139_local3.tabName = "CPUI_CAREER"
	f139_local2.models = f139_local3
	f139_local2.properties = {
		m_mouseDisabled = true
	}
	f139_local0( f139_local1, f139_local2 )
	f139_local0 = table.insert
	f139_local1 = tabs
	f139_local2 = {}
	f139_local3 = {}
	f139_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
	f139_local3.lobbyNav = f139_local4.id
	f139_local3.tabName = "MENU_MULTIPLAYER"
	f139_local2.models = f139_local3
	f139_local2.properties = {
		m_mouseDisabled = true
	}
	f139_local0( f139_local1, f139_local2 )
	return tabs
end )
DataSources.ModalDialogData = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "ModalDialog" )
		Engine.SetModelValue( Engine.CreateModel( model, "title" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Title ) )
		Engine.SetModelValue( Engine.CreateModel( model, "description" ), Engine.Localize( CoD.Menu.ModalDialogInfo.Description ) )
		return model
	end
}
DataSources.ModalDialogDataList = {
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
}
DataSources.SideModalDialogDataList = {
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
}
DataSources.PartyPrivacy = {
	getModel = function ( controller )
		Dvar.partyPrivacyEnabled:set( true )
		local privacy = Engine.GetPartyPrivacy()
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
		local maxClients = Engine.GetLobbyMaxClients( lobbyType )
		local partyPrivacyModel = Engine.CreateModel( Engine.GetGlobalModel(), "PartyPrivacy" )
		Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacy" ), privacy )
		Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "privacyStatus" ), PartyPrivacy( privacy ) )
		Engine.SetModelValue( Engine.CreateModel( partyPrivacyModel, "maxPlayers" ), maxClients )
		return partyPrivacyModel
	end
}
DataSources.MapVote = {
	getModel = function ( controller )
		return Engine.GetModel( Engine.GetGlobalModel(), "MapVote" )
	end
}
DataSources.LobbyQuickJoin = {
	updateCounts = function ( controller, list, filter )
		local count = Engine.GetQuickJoinPlayersCount( controller, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
		local visibleCount = #list.players
		local moreCount = count - visibleCount
		local lobbyFriendsModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyFriends" )
		Engine.SetModelValue( Engine.CreateModel( lobbyFriendsModel, "onlineCount" ), count )
		Engine.SetModelValue( list.countModel, count )
		Engine.SetModelValue( list.visibleCountModel, visibleCount )
		Engine.SetModelValue( Engine.CreateModel( lobbyFriendsModel, "moreCount" ), moreCount )
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
		list.lobbyClientListCountModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.clientList.count" )
		if list.lobbyClientListCountModel ~= nil then
			list.lobbyClientListCount = Engine.GetModelValue( list.lobbyClientListCountModel )
			if list.lobbyClientListCount == 0 then
				list.lobbyClientListCount = 1
			end
		else
			list.lobbyClientListCount = 1
		end
		list.maxElementsInList = Engine.GetDvarInt( "live_social_quickjoin_count" )
		local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		list.socialSubModel = Engine.CreateModel( socialRootModel, "quickJoin" )
		list.countModel = Engine.CreateModel( list.socialSubModel, "count" )
		list.visibleCountModel = Engine.CreateModel( list.socialSubModel, "visibleCount" )
		list.players = {}
		local emptyPlayerInfo, emptyProperties = CoD.SocialUtility.GetEmptyPlayerInfo()
		for i = 1, list.maxElementsInList, 1 do
			list.players[i] = {}
			list.players[i].root = Engine.CreateModel( list.socialSubModel, "player_" .. i )
			list.players[i].model = Engine.CreateModel( list.players[i].root, "model" )
			list.players[i].properties = emptyProperties
			local model = nil
			for key, value in pairs( emptyPlayerInfo ) do
				model = Engine.CreateModel( list.players[i].model, key )
			end
			model = Engine.CreateModel( list.players[i].model, "clanTagAndGamertag" )
			model = Engine.CreateModel( list.players[i].model, "rank" )
			model = Engine.CreateModel( list.players[i].model, "rankIcon" )
			model = Engine.CreateModel( list.players[i].model, "rankString" )
			model = Engine.CreateModel( list.players[i].model, "isJoinable" )
		end
		if list.lobbyClientListCount > 13 then
			list.numFreeSlotsInList = 0
		else
			list.numFreeSlotsInList = 16 - list.lobbyClientListCount
		end
		DataSources.LobbyQuickJoin.updateCounts( controller, list, filter )
		list.numPlayers = CoD.SocialUtility.UpdateModelsHelper( controller, list, 0, list.numFreeSlotsInList, list.maxElementsInList, {
			filter = Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE,
			isFriendItem = true
		}, Engine.GetQuickJoinPlayers )
		for i = 1, #list.players, 1 do
			local mpRank = Engine.GetModelValue( Engine.GetModel( list.players[i].model, "mpRank" ) )
			Engine.SetModelValue( Engine.GetModel( list.players[i].model, "rank" ), mpRank )
			local mpRankIcon = Engine.GetModelValue( Engine.GetModel( list.players[i].model, "mpRankIcon" ) )
			Engine.SetModelValue( Engine.GetModel( list.players[i].model, "rankIcon" ), mpRankIcon )
			if mpRank then
				local plevel = Engine.GetModelValue( Engine.GetModel( list.players[i].model, "mpPrestige" ) )
				local mpRankString = CoD.GetRankName( math.max( 0, mpRank - 1 ), plevel, Enum.eModes.MODE_MULTIPLAYER )
				Engine.SetModelValue( Engine.GetModel( list.players[i].model, "rankString" ), mpRankString )
			end
			local fullname = Engine.GetModelValue( Engine.GetModel( list.players[i].model, "fullname" ) )
			Engine.SetModelValue( Engine.GetModel( list.players[i].model, "clanTagAndGamertag" ), fullname )
			local joinable = Engine.GetModelValue( Engine.GetModel( list.players[i].model, "joinable" ) )
			local isJoinable = 0
			if joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
				isJoinable = 1
			end
			Engine.SetModelValue( Engine.GetModel( list.players[i].model, "isJoinable" ), isJoinable )
		end
		if list.lobbyClientListCountSubscription then
			list:removeSubscription( list.lobbyClientListCountSubscription )
		end
		list.lobbyClientListCountSubscription = list:subscribeToModel( list.lobbyClientListCountModel, function ()
			DataSources.LobbyQuickJoin.updateCounts( controller, list, filter )
			list:updateDataSource()
		end, false )
		local socialFriendsUpdateModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.friends.update" )
		if list.socialFriendsUpdateSubscription then
			list:removeSubscription( list.socialFriendsUpdateSubscription )
		end
		list.socialFriendsUpdateSubscription = list:subscribeToModel( socialFriendsUpdateModel, function ()
			DataSources.LobbyQuickJoin.updateCounts( controller, list, filter )
			list:updateDataSource()
		end, false )
	end,
	getCount = function ( list )
		return list.numPlayers
	end,
	getItem = function ( controller, list, index )
		local model = list.players[index].model
		return model
	end,
	getCustomPropertiesForItem = function ( list, index )
		if list.players[index] == nil then
			return nil
		else
			local properties = list.players[index].properties
			return properties
		end
	end
}
DataSources.LobbyList = {
	prepare = function ( controller, list, filter )
		list.clientListModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.clientList" )
		list.lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
		if list.gameClientUpdateSubscription then
			list:removeSubscription( list.gameClientUpdateSubscription )
		end
		list.gameClientUpdateSubscription = list:subscribeToModel( Engine.GetModel( list.lobbyRootModel, "gameClient.update" ), function ()
			CoD.LobbyUtility.UpdateLobbyList( list )
			local count = Engine.GetModelValue( Engine.CreateModel( list.clientListModel, "count" ) )
			list:setVerticalCount( count, true )
		end, false )
		if list.privateClientUpdateSubscription then
			list:removeSubscription( list.privateClientUpdateSubscription )
		end
		list.privateClientUpdateSubscription = list:subscribeToModel( Engine.GetModel( list.lobbyRootModel, "privateClient.update" ), function ()
			CoD.LobbyUtility.UpdateLobbyList( list )
			local count = Engine.GetModelValue( Engine.CreateModel( list.clientListModel, "count" ) )
			list:setVerticalCount( count, true )
		end, false )
		if list.lobbyNavSubscription then
			list:removeSubscription( list.lobbyNavSubscription )
		end
		list.lobbyNavSubscription = list:subscribeToModel( Engine.GetModel( list.lobbyRootModel, "lobbyNav" ), function ()
			CoD.LobbyUtility.UpdateLobbyList( list )
			local count = Engine.GetModelValue( Engine.CreateModel( list.clientListModel, "count" ) )
			list:setVerticalCount( count )
		end, false )
		CoD.LobbyUtility.UpdateLobbyList( list )
	end,
	getCount = function ( list )
		local count = Engine.GetModelValue( Engine.CreateModel( list.clientListModel, "count" ) )
		return count
	end,
	getItem = function ( controller, list, index )
		return Engine.GetModel( list.clientListModel, index )
	end
}
DataSources.LobbyPrivateHostMembers = {
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
}
DataSources.LobbyPrivateClientMembers = {
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
}
DataSources.LobbyGameHostMembers = {
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
}
DataSources.LobbyGameClientMembers = {
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
}
DataSources.LobbyButtons = ListHelper_SetupDataSource( "LobbyButtons", function ( controller )
	local buttons = {}
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local lobbyNavModel = Engine.GetModel( lobbyRootModel, "lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local buttonOptions = CoD.LobbyMenus.AddButtonsForTarget( controller, lobbyNav )
	CoD.perController[controller].updateNewBreadcrumbs = false
	local anyButtonEnabled = false
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.optionDisplay ),
				customId = buttonData.customId,
				warning = buttonData.warning
			},
			properties = {
				disabled = buttonData.disabled,
				action = buttonData.action,
				actionParam = buttonData.param,
				isLastButtonInGroup = buttonData.isLastButtonInGroup,
				selectIndex = buttonData.selected,
				isBreadcrumbNew = buttonData.isBreadcrumbNew
			}
		} )
	end
	if #buttons <= 0 then
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
end, nil, nil, function ( controller, list, listModel )
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
				local f180_local0 = list:getParent()
				if f180_local0:getParent() then
					f180_local0 = list:getParent()
					f180_local0 = f180_local0:getParent()
					if f180_local0:getParent() then
						f180_local0 = IsMenuInState
						local f180_local1 = list:getParent()
						f180_local1 = f180_local1:getParent()
						if not f180_local0( f180_local1:getParent(), "Right" ) then
						
						else
							
						end
					end
				end
			end
			if not IsFreeCursorActive( controller ) then
				list:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			end
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
	local gameClientUpdateModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	if list.gameClientUpdateSubscription then
		list:removeSubscription( list.gameClientUpdateSubscription )
	end
	list.gameClientUpdateSubscription = list:subscribeToModel( gameClientUpdateModel, function ()
		local ignoreFocusRestore = IsFreeCursorActive( controller )
		list:updateDataSource( ignoreFocusRestore, false, false )
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
	local mapVoteModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
	if list.mapChangedSub then
		list:removeSubscription( list.mapChangedSub )
	end
	list.mapChangedSub = list:subscribeToModel( mapVoteModel, function ()
		CoD.LobbyUtility.UpdateMapInstallStatusLine( list )
		if Engine.IsCampaignGame() then
			list:updateDataSource()
		end
	end, false )
	local updateButtonsModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" )
	if list.updateButtonsModelSub then
		list:removeSubscription( list.updateButtonsModelSub )
	end
	list.updateButtonsModelSub = list:subscribeToModel( updateButtonsModel, function ()
		local isCodcasterNow = IsCodCaster( controller )
		local newTeamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
		local ignoreFocusRestore = IsFreeCursorActive( controller )
		if list.wasCodCaster == nil or isCodcasterNow ~= list.wasCodCaster then
			list.wasCodCaster = isCodcasterNow
			list:updateDataSource( ignoreFocusRestore )
		elseif list.oldTeamAssignment == nil or list.oldTeamAssignment ~= newTeamAssignment then
			list.oldTeamAssignment = newTeamAssignment
			list:updateDataSource( ignoreFocusRestore )
		elseif CoD.perController[controller].updateNewBreadcrumbs == true then
			CoD.perController[controller].updateNewBreadcrumbs = false
			list:updateDataSource( ignoreFocusRestore )
		elseif CoD.isZombie == true then
			local menuID = LobbyData.GetLobbyNav()
			local f188_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
			if menuID == f188_local0.id then
				list:updateDataSource( ignoreFocusRestore )
			end
		elseif CoD.perController[controller].gamesettingsUpdated == true then
			CoD.perController[controller].gamesettingsUpdated = false
			list:updateDataSource( ignoreFocusRestore )
		elseif CoD.perController[controller].localClientChanged == true then
			CoD.perController[controller].localClientChanged = false
			list:updateDataSource( ignoreFocusRestore )
		elseif list.wasMissingMapTextShowing ~= CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing() then
			list.wasMissingMapTextShowing = CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing()
			list:updateDataSource( ignoreFocusRestore )
		end
	end, false )
end, function ( list, row, widgetHeight )
	if list.LobbyButtons[row] == nil then
		return 0
	elseif list.LobbyButtons[row].properties.isLastButtonInGroup then
		return 9
	else
		
	end
end )
DataSources.LobbyFlyoutButtons = ListHelper_SetupDataSource( "LobbyFlyoutButtons", function ( controller )
	local buttons = {}
	local f190_local0 = Engine.GetGlobalModel()
	local lobbyNav = f190_local0.lobbyRoot.lobbyNav:get()
	local buttonOptions = CoD.LobbyMenus.AddFlyoutsForTarget( controller, lobbyNav )
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				image = buttonData.image or "blacktransparent",
				renderInfo = buttonData.renderInfo,
				listDatasource = buttonData.flyoutDatasource or "",
				freeCursorTitle = buttonData.freeCursorTitle,
				description = buttonData.description,
				disabled = buttonData.disabled
			},
			properties = {
				action = buttonData.action,
				actionParam = buttonData.param,
				customWidgetOverride = buttonData.overrideWidget
			}
		} )
	end
	return buttons
end, nil, nil, function ( controller, list, listModel )
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
				local f192_local0 = list:getParent()
				if f192_local0:getParent() then
					f192_local0 = list:getParent()
					f192_local0 = f192_local0:getParent()
					if f192_local0:getParent() then
						f192_local0 = IsMenuInState
						local f192_local1 = list:getParent()
						f192_local1 = f192_local1:getParent()
						if not f192_local0( f192_local1:getParent(), "Right" ) then
						
						else
							
						end
					end
				end
			end
			if not IsFreeCursorActive( controller ) then
				list:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			end
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
	local gameClientUpdateModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	if list.gameClientUpdateSubscription then
		list:removeSubscription( list.gameClientUpdateSubscription )
	end
	list.gameClientUpdateSubscription = list:subscribeToModel( gameClientUpdateModel, function ()
		local ignoreFocusRestore = IsFreeCursorActive( controller )
		list:updateDataSource( ignoreFocusRestore, false, false )
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
	local mapVoteModel = Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" )
	if list.mapChangedSub then
		list:removeSubscription( list.mapChangedSub )
	end
	list.mapChangedSub = list:subscribeToModel( mapVoteModel, function ()
		CoD.LobbyUtility.UpdateMapInstallStatusLine( list )
		if Engine.IsCampaignGame() then
			list:updateDataSource()
		end
	end, false )
	local f191_local0 = Engine.GetGlobalModel()
	local companionChangeModel = f191_local0:create( "lobbyRoot.lobbyCompanionUpdate" )
	if list.companionChangeSubscription then
		list:removeSubscription( list.companionChangeSubscription )
	end
	list.companionChangeSubscription = list:subscribeToModel( companionChangeModel, function ()
		list:updateDataSource( true, true, false )
	end, false )
	local updateButtonsModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyButtonUpdate" )
	if list.updateButtonsModelSub then
		list:removeSubscription( list.updateButtonsModelSub )
	end
	list.updateButtonsModelSub = list:subscribeToModel( updateButtonsModel, function ()
		local isCodcasterNow = IsCodCaster( controller )
		local newTeamAssignment = Engine.GetGametypeSetting( "teamAssignment" )
		local ignoreFocusRestore = IsFreeCursorActive( controller )
		if list.wasCodCaster == nil or isCodcasterNow ~= list.wasCodCaster then
			list.wasCodCaster = isCodcasterNow
			list:updateDataSource( ignoreFocusRestore )
		elseif list.oldTeamAssignment == nil or list.oldTeamAssignment ~= newTeamAssignment then
			list.oldTeamAssignment = newTeamAssignment
			list:updateDataSource( ignoreFocusRestore )
		elseif CoD.perController[controller].updateNewBreadcrumbs == true then
			CoD.perController[controller].updateNewBreadcrumbs = false
			list:updateDataSource( ignoreFocusRestore )
		elseif CoD.isZombie == true then
			local menuID = LobbyData.GetLobbyNav()
			local f201_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
			if menuID == f201_local0.id then
				list:updateDataSource( ignoreFocusRestore )
			end
		elseif CoD.perController[controller].gamesettingsUpdated == true then
			CoD.perController[controller].gamesettingsUpdated = false
			list:updateDataSource( ignoreFocusRestore )
		elseif CoD.perController[controller].localClientChanged == true then
			CoD.perController[controller].localClientChanged = false
			list:updateDataSource( ignoreFocusRestore )
		elseif list.wasMissingMapTextShowing ~= CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing() then
			list.wasMissingMapTextShowing = CoD.LobbyUtility.IsSomePlayersDoNotHaveMapTextShowing()
			list:updateDataSource( ignoreFocusRestore )
		end
	end, false )
end )
DataSources.SocialRoot = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
	end
}
DataSources.SocialPlayerInfo = {
	getModel = function ( controller )
		local controllerModel = Engine.GetModelForController( controller )
		local playerInfoModel = Engine.CreateModel( controllerModel, "socialPlayerInfo" )
		local identityBadgeModel = Engine.CreateModel( playerInfoModel, "identityBadge" )
		local selectedFriendModel = Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" )
		local xuid = Engine.GetModelValue( selectedFriendModel, "xuid" )
		local selectedFriendGamertagModel = Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" )
		local gamertag = Engine.GetModelValue( selectedFriendGamertagModel )
		if xuid ~= nil then
			local playerInfo = Engine.GetPlayerInfo( controller, xuid )
			if playerInfo ~= nil then
				local cpPlayed = true
				local mpPlayed = true
				local zmPlayed = true
				local cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", cpPlayed, playerInfo.info.cp.rank, playerInfo.info.cp.prestige )
				local mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", mpPlayed, playerInfo.info.mp.rank, playerInfo.info.mp.prestige )
				local zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", zmPlayed, playerInfo.info.zm.rank, playerInfo.info.zm.prestige )
				if playerInfo.info.gamertag == "" then
					playerInfo.info.gamertag = gamertag
				end
				local mpRankString = Engine.GetRankDisplayLevel( playerInfo.info.mp.rank, Enum.eModes.MODE_MULTIPLAYER )
				if playerInfo.info.mp.prestige == Engine.GetPrestigeCap( Enum.eModes.MODE_MULTIPLAYER ) then
					mpRankString = Engine.GetParagonRankDisplayLevel( playerInfo.info.mp.paragonRank, Enum.eModes.MODE_MULTIPLAYER )
					if playerInfo.info.mp.paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
						mpRankIcon = Engine.GetParagonIconById( playerInfo.info.mp.paragonIconId, Enum.eModes.MODE_MULTIPLAYER )
					end
				end
				local zmRankString = Engine.GetRankDisplayLevel( playerInfo.info.zm.rank, Enum.eModes.MODE_ZOMBIES )
				if playerInfo.info.zm.prestige == Engine.GetPrestigeCap( Enum.eModes.MODE_ZOMBIES ) then
					zmRankString = Engine.GetParagonRankDisplayLevel( playerInfo.info.zm.paragonRank, Enum.eModes.MODE_ZOMBIES )
					if playerInfo.info.zm.paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
						zmRankIcon = Engine.GetParagonIconById( playerInfo.info.zm.paragonIconId, Enum.eModes.MODE_ZOMBIES )
					end
				end
				Engine.SetModelValue( Engine.CreateModel( identityBadgeModel, "xuid" ), playerInfo.info.xuid )
				Engine.SetModelValue( Engine.CreateModel( identityBadgeModel, "gamertag" ), playerInfo.info.gamertag )
				Engine.SetModelValue( Engine.CreateModel( identityBadgeModel, "clantag" ), playerInfo.info.clantag )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpRank" ), playerInfo.info.cp.rank )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpRankIcon" ), cpRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpPrestige" ), playerInfo.info.cp.prestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpRank" ), tonumber( mpRankString ) )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpRankIcon" ), mpRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpPrestige" ), playerInfo.info.mp.prestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmRank" ), tonumber( zmRankString ) )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmRankIcon" ), zmRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmPrestige" ), playerInfo.info.zm.prestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "emblemBacking" ), playerInfo.info.emblemBacking )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "presence" ), playerInfo.info.presence )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "joinable" ), playerInfo.info.joinable )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "inGameLobby" ), playerInfo.info.inGameLobby )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "inPrivateLobby" ), playerInfo.info.inPrivateLobby )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "isSelf" ), playerInfo.info.isSelf )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "isLocal" ), playerInfo.info.isLocal )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "activity" ), playerInfo.info.activity )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "activityString" ), GetPresenceActivityString( playerInfo.info ) )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "context" ), playerInfo.info.context )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "contextString" ), GetPresenceContextString( playerInfo.info ) )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "gametype" ), playerInfo.info.gametype )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mapid" ), playerInfo.info.mapid )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "difficulty" ), playerInfo.info.difficulty )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "playlist" ), playerInfo.info.playlist )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "isFriend" ), playerInfo.info.isFriend )
			end
			local xuidString = Engine.UInt64ToString( xuid )
			if xuidString == "fefefefefefefefe" then
				local cpPrestige = 0
				local cpRank = 0
				local cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", false, cpRank, cpPrestige )
				local mpPrestige = 0
				local mpRank = 0
				local mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", false, mpRank, mpPrestige )
				local zmPrestige = 0
				local zmRank = 0
				local zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", false, zmRank, zmPrestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpRank" ), cpRank )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpRankIcon" ), cpRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "cpPrestige" ), cpPrestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpRank" ), mpRank )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpRankIcon" ), mpRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "mpPrestige" ), mpPrestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmRank" ), zmRank )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmRankIcon" ), zmRankIcon )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "zmPrestige" ), zmPrestige )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "gamertag" ), gamertag )
				Engine.SetModelValue( Engine.CreateModel( playerInfoModel, "clantag" ), "" )
			end
		end
		return playerInfoModel
	end
}
DataSources.PregameGlobal = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
		local timeLeftModel = Engine.CreateModel( model, "timeleft" )
		Engine.SetModelValue( timeLeftModel, "" )
		local statusModel = Engine.CreateModel( model, "status" )
		Engine.SetModelValue( statusModel, "" )
		return model
	end
}
DataSources.Pregame = {
	getModel = function ( controller )
		local pregameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
		local remaininigVotesModel = Engine.CreateModel( pregameModel, "remainingVotes" )
		Engine.SetModelValue( remaininigVotesModel, 0 )
		return pregameModel
	end
}
DataSources.PregameItemVoteTabs = ListHelper_SetupDataSource( "PregameItemVoteTabs", function ( controller )
	local tabs = {}
	local filters = CoD.CACUtility.PregameLoadoutFilters
	table.insert( tabs, {
		models = {
			index = -1,
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
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
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return tabs
end )
DataSources.PregameRestrictedItems = ListHelper_SetupDataSource( "PregameRestrictedItems", function ( controller )
	if DataSources.PregameRestrictedItems.cachedItems ~= nil then
		return DataSources.PregameRestrictedItems.cachedItems
	end
	local items, attachments = CoD.CACUtility.GetAllItems( true, true )
	local GetHintTextForRestrictionState = function ( restrictionState )
		if restrictionState == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			return "MENU_RESTRICTED"
		elseif restrictionState == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY then
			return "MENU_BAN_ONLY"
		elseif restrictionState == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED then
			return "MENU_PROTECTED"
		else
			return ""
		end
	end
	
	local result = {}
	for attachmentIndex, attachment in pairs( attachments ) do
		if #attachment.items > 0 then
			table.insert( result, {
				models = {
					itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT,
					attachmentIndex = attachment.index,
					restrictionState = attachment.restrictionState,
					hintText = GetHintTextForRestrictionState( attachment.restrictionState ),
					name = attachment.name,
					image = attachment.image,
					loadoutSlot = "attachment"
				}
			} )
		end
	end
	for itemIndex, attachment in pairs( items ) do
		if attachment.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
			if attachment.name == "WEAPON_KNIFE_LOADOUT" then
				table.insert( result, {
					models = {
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
						restrictionState = attachment.restrictionState,
						hintText = GetHintTextForRestrictionState( attachment.restrictionState ),
						itemIndex = attachment.index,
						name = "MENU_MELEE_WEAPONS",
						image = attachment.image,
						loadoutSlot = attachment.loadoutSlot,
						groupName = attachment.groupName
					},
					properties = {
						item = {
							index = attachment.index
						}
					}
				} )
			end
		end
		local itemId = Engine.GetItemRef( attachment.index )
		if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
			table.insert( result, {
				models = {
					itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
					restrictionState = attachment.restrictionState,
					hintText = GetHintTextForRestrictionState( attachment.restrictionState ),
					itemIndex = attachment.index,
					name = attachment.name,
					image = attachment.image,
					loadoutSlot = attachment.loadoutSlot,
					groupName = attachment.groupName
				},
				properties = {
					item = {
						index = attachment.index
					}
				}
			} )
		end
	end
	DataSources.PregameRestrictedItems.cachedItems = result
	return result
end )
DataSources.PregameItemVotes = ListHelper_SetupDataSource( "PregameItemVotes", function ( controller )
	local pregameState = Engine.GetLobbyPregameState()
	if pregameState ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE then
		return {}
	end
	local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local clients = session.sessionClients
	local posSort = function ( a, b )
		return a.pregamePosition < b.pregamePosition
	end
	
	table.sort( clients, posSort )
	local result = {}
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local votes = Engine.GetPregameItemVotes( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	for voteIndex, vote in ipairs( votes ) do
		local f209_local3 = ""
		local f209_local4 = ""
		local f209_local5 = ""
		if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
			f209_local3 = itemInfo.name
			f209_local4 = itemInfo.image
			if itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
				f209_local3 = "MENU_MELEE_WEAPONS"
			end
			if LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) or itemInfo.loadoutSlot == "specialgadget" then
				f209_local4 = itemInfo.image .. "_large"
			end
			if LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) then
				f209_local4 = itemInfo.image .. "_menu"
			end
		elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			f209_local3 = Engine.GetAttachmentNameByIndex( vote.attachmentIndex )
			f209_local4 = Engine.GetAttachmentImageByIndex( vote.attachmentIndex )
		elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			f209_local3 = Engine.GetAttachmentNameByIndex( vote.attachmentIndex )
			f209_local4 = Engine.GetAttachmentImageByIndex( vote.attachmentIndex )
			local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
			f209_local5 = itemInfo.name
		elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			f209_local5 = itemInfo.group
		else
			error( "Item vote updated with invalid vote type" )
		end
		table.insert( result, {
			models = {
				name = f209_local3,
				image = f209_local4,
				headerName = f209_local5,
				hintText = vote.gamertag,
				intData = vote.team,
				itemType = vote.itemType,
				itemIndex = vote.itemIndex,
				attachmentIndex = vote.attachmentIndex,
				groupIndex = vote.groupIndex
			}
		} )
	end
	return result
end, nil, nil, function ( controller, list, listModel )
	local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	if list.pregameUpdateSubscription then
		list:removeSubscription( list.pregameUpdateSubscription )
	end
	list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
		list:updateDataSource( false, false )
	end, false )
end )
DataSources.PregameBannedItems = ListHelper_SetupDataSource( "PregameBannedItems", function ( controller )
	local equippedItems = {}
	local equippedAttachments = {}
	local equippedItemAttachments = {}
	local equippedMeleeWeapons = {}
	local AddItems = function ( itemsTable )
		for slot, itemIndex in pairs( itemsTable ) do
			if not equippedItems[itemIndex] then
				equippedItems[itemIndex] = true
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
				if itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
					table.insert( equippedMeleeWeapons, itemIndex )
				end
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
	f213_local0 = {}
	f213_local1 = {}
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local votes = Engine.GetPregameItemVotes( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	for index, vote in ipairs( votes ) do
		if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
				local itemId = Engine.GetItemRef( vote.itemIndex )
				if not LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
					if itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
						table.insert( f213_local0, {
							name = "MENU_MELEE_WEAPONS",
							image = itemInfo.image,
							hintText = vote.gamertag,
							intData = vote.team,
							groupIndex = itemInfo.groupIndex,
							loadoutSlot = itemInfo.loadoutSlot,
							loadoutSlotIndex = itemInfo.loadoutSlotIndex,
							equipped = equippedMeleeWeapons and #equippedMeleeWeapons > 0
						} )
					else
						table.insert( f213_local0, {
							name = itemInfo.name,
							image = itemInfo.image,
							hintText = vote.gamertag,
							intData = vote.team,
							groupIndex = itemInfo.groupIndex,
							loadoutSlot = itemInfo.loadoutSlot,
							loadoutSlotIndex = itemInfo.loadoutSlotIndex,
							equipped = equippedItems and equippedItems[vote.itemIndex] == true
						} )
						goto basicblock_27:
					end
				end
			end
			if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				table.insert( f213_local1, {
					name = Engine.GetAttachmentNameByIndex( vote.attachmentIndex ),
					image = Engine.GetAttachmentImageByIndex( vote.attachmentIndex ),
					isOptic = Engine.IsOpticByAttachmentIndex( vote.attachmentIndex ),
					hintText = vote.gamertag,
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
	local items, f213_local3 = CoD.CACUtility.GetAllItems( false, true )
	for iterIndex, item in pairs( items ) do
		if Engine.GetItemRestrictionState( item.index ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			local itemInfo = Engine.GetUnlockableInfoByIndex( item.index )
			if not LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) then
				local skipItem = false
				if itemInfo.groupIndex == Enum.itemGroup_t.ITEMGROUP_KNIFE then
					local knifeIndex = Engine.GetItemIndexFromReference( "knife_loadout", Enum.eModes.MODE_MULTIPLAYER )
					if Engine.GetItemVote( knifeIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
						skipItem = true
					end
				end
				if skipItem == false then
					table.insert( f213_local0, {
						name = itemInfo.name,
						image = itemInfo.image,
						hintText = Engine.Localize( "MENU_RESTRICTED" ),
						groupIndex = itemInfo.groupIndex,
						loadoutSlot = itemInfo.loadoutSlot,
						loadoutSlotIndex = itemInfo.loadoutSlotIndex,
						equipped = equippedItems and equippedItems[item.index] == true
					} )
				end
			end
		end
	end
	for iterIndex, item in pairs( f213_local3 ) do
		if Engine.IsAttachmentRestrictedForAnyWeapon( item.index ) then
			table.insert( f213_local1, {
				name = Engine.GetAttachmentNameByIndex( item.index ),
				image = Engine.GetAttachmentImageByIndex( item.index ),
				isOptic = Engine.IsOpticByAttachmentIndex( item.index ),
				hintText = Engine.Localize( "MENU_RESTRICTED" ),
				equipped = equippedAttachments and equippedAttachments[item.index] == true
			} )
		end
	end
	local attachmentSort = function ( a, b )
		if f213_local1[a].isOptic and f213_local1[b].isOptic then
			return Engine.Localize( f213_local1[a].name ) < Engine.Localize( f213_local1[b].name )
		elseif f213_local1[a].isOptic ~= f213_local1[b].isOptic then
			return f213_local1[a].isOptic
		else
			return Engine.Localize( f213_local1[a].name ) < Engine.Localize( f213_local1[b].name )
		end
	end
	
	local itemSort = function ( a, b )
		if f213_local0[a].groupIndex ~= f213_local0[b].groupIndex then
			return f213_local0[a].groupIndex < f213_local0[b].groupIndex
		elseif f213_local0[a].loadoutSlot == f213_local0[b].loadoutSlot then
			return Engine.Localize( f213_local0[a].name ) < Engine.Localize( f213_local0[b].name )
		else
			return Engine.Localize( f213_local0[a].loadoutSlot ) < Engine.Localize( f213_local0[b].loadoutSlot )
		end
	end
	
	local sortedBannedItemsAndAttachments = {}
	local attachmentsInserted = false
	for itemIndex, item in LUI.IterateTableBySortedKeys( f213_local0, itemSort, nil ) do
		if attachmentsInserted == false and item.loadoutSlotIndex > 50 then
			for attachmentIndex, attachment in LUI.IterateTableBySortedKeys( f213_local1, attachmentSort, nil ) do
				table.insert( sortedBannedItemsAndAttachments, {
					models = {
						name = attachment.name,
						image = attachment.image,
						hintText = attachment.hintText,
						intData = attachment.intData,
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
				intData = item.intData,
				equipped = item.equipped
			}
		} )
	end
	if attachmentsInserted == false then
		for attachmentIndex, item in LUI.IterateTableBySortedKeys( f213_local1, attachmentSort, nil ) do
			table.insert( sortedBannedItemsAndAttachments, {
				models = {
					name = item.name,
					image = item.image,
					hintText = item.hintText,
					intData = item.intData,
					equipped = item.equipped
				}
			} )
		end
	end
	return sortedBannedItemsAndAttachments
end, nil, nil, function ( controller, list, listModel )
	local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	if list.pregameUpdateSubscription then
		list:removeSubscription( list.pregameUpdateSubscription )
	end
	list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
		list:updateDataSource( false, false )
	end, false )
end )
DataSources.PregameBannedStreaks = ListHelper_SetupDataSource( "PregameAllBannedStreaks", function ( controller )
	local loadout = CoD.CACUtility.GetFullLoadout( controller )
	local equippedStreaks = {}
	for loadoutSlot, itemIndex in pairs( loadout.streaks ) do
		equippedStreaks[itemIndex] = true
	end
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local pregameVotes = Engine.GetPregameItemVotes( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	f220_local2 = {}
	for index, vote in ipairs( pregameVotes ) do
		if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
			local f220_local4 = equippedStreaks and equippedStreaks[vote.itemIndex] == true
			if LUI.startswith( itemInfo.loadoutSlot, "killstreak" ) then
				table.insert( f220_local2, {
					name = itemInfo.name,
					image = itemInfo.image .. "_menu",
					momentum = itemInfo.momentum,
					gamertag = vote.gamertag,
					intData = vote.team,
					equipped = f220_local4
				} )
			end
		end
	end
	local items, itemIndex = CoD.CACUtility.GetAllItems( false, true )
	for iterIndex, f220_local4 in pairs( items ) do
		if Engine.GetItemRestrictionState( f220_local4.index ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			local itemInfo = Engine.GetUnlockableInfoByIndex( f220_local4.index )
			if LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) then
				table.insert( f220_local2, {
					name = itemInfo.name,
					image = itemInfo.image .. "_menu",
					momentum = itemInfo.momentum,
					gamertag = "",
					equipped = equippedStreaks and equippedStreaks[f220_local4.index] == true
				} )
			end
		end
	end
	local streakSort = function ( a, b )
		return f220_local2[a].momentum < f220_local2[b].momentum
	end
	
	local result = {}
	for index, item in LUI.IterateTableBySortedKeys( f220_local2, streakSort, nil ) do
		table.insert( result, {
			models = {
				name = item.name,
				image = item.image,
				hintText = item.gamertag,
				intData = item.intData,
				equipped = item.equipped
			}
		} )
	end
	return result
end, nil, nil, function ( controller, list, listModel )
	local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	if list.pregameUpdateSubscription then
		list:removeSubscription( list.pregameUpdateSubscription )
	end
	list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
		list:updateDataSource( false, false )
	end, false )
end )
DataSources.PregameClientList = ListHelper_SetupDataSource( "PregameClientList", function ( controller )
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
		local f224_local3 = ""
		if characterLoadoutInfo then
			f224_local3 = characterLoadoutInfo.itemName
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
				characterLoadoutName = f224_local3
			},
			properties = {}
		} )
	end
	return characterDraftClients
end, nil, nil, function ( controller, list, listModel )
	local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	if list.pregameUpdateSubscription then
		list:removeSubscription( list.pregameUpdateSubscription )
	end
	list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
		list:updateDataSource( false, false )
	end, false )
	local gameClientUpdateModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	if list.teamCountSubscription then
		list:removeSubscription( list.teamCountSubscription )
	end
	list.teamCountSubscription = list:subscribeToModel( gameClientUpdateModel, function ()
		list:updateDataSource()
	end, false )
end )
DataSources.PregameBannedContentButtons = ListHelper_SetupDataSource( "PregameBannedContentButtons", function ( controller )
	local buttonOptions = {}
	local GoBackNotify = function ( self, element, controller, param, menu )
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
		Engine.SendPregameEditComplete( controller, lobbyType, true )
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
end )
DataSources.SocialPlayerDetailsButtons = ListHelper_SetupDataSource( "SocialPlayerDetailsButtons", function ( controller )
	local buttonOptions = {}
	local controllerModel = Engine.GetModelForController( controller )
	local selectedXuid = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" ) )
	local selectedGamertag = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" ) )
	local controllerXuid = Engine.GetXUID64( controller )
	local f231_local0 = selectedXuid == controllerXuid
	local selectedPlayerInTitle = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendInTitle" ) )
	if selectedXuid == nil then
		return buttonOptions
	end
	local playerInfo = Engine.GetPlayerInfo( controller, selectedXuid )
	if f231_local0 == false and IsInFileshare( controller ) == false then
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, selectedXuid ) then
			if Engine.IsLeader( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				if ShouldShowPromotePlayer( controller ) then
					table.insert( buttonOptions, {
						text = "MENU_PROMOTE_TO_PARTY_LEADER",
						id = "promoteToLeader",
						action = PromoteToLeader,
						params = {
							controller = controller,
							xuid = selectedXuid
						},
						lastInGroup = false
					} )
				end
				table.insert( buttonOptions, {
					text = "MENU_REMOVE_FROM_PARTY",
					id = "removeFromParty",
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
	if playerInfo.info.hasEverPlayed == true and not IsInGame() and not IsUserContentRestricted( controller ) then
		table.insert( buttonOptions, {
			text = "MENU_SHOWCASE_CAPS",
			id = "playerShowcase",
			disabled = false,
			action = OpenPlayerShowcaseOnParent,
			params = {
				controller = controller,
				xuid = selectedXuid
			},
			lastInGroup = false
		} )
		table.insert( buttonOptions, {
			text = "MENU_COMBAT_RECORD_CAPS",
			id = "combatRecord",
			disabled = false,
			action = CombatRecordOpenFromPlayerDetails,
			params = {
				controller = controller,
				xuid = selectedXuid
			},
			lastInGround = false
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
	if f231_local0 == false then
		local inPrivateLobby = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, selectedXuid )
		local inGameLobby = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, selectedXuid )
		local isMuted = Engine.IsPlayerMuted( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, selectedXuid )
		if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
			isMuted = Engine.IsPlayerMuted( controller, Enum.LobbyType.LOBBY_TYPE_GAME, selectedXuid )
		end
		if CoD.canInviteToGame( controller, selectedXuid ) and inPrivateLobby == false and inGameLobby == false then
			if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
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
		if IsGroupsEnabled() then
			table.insert( buttonOptions, {
				text = "MENU_INVITE_TO_GROUP",
				id = "inviteToGroup",
				disabled = false,
				action = OpenGroupSelector,
				params = nil,
				lastInGroup = false
			} )
		end
		if not Engine.IsFriendFromXUID( controller, selectedXuid ) then
			if IsDurango() then
				table.insert( buttonOptions, {
					text = "MENU_FOLLOW_PLAYER",
					id = "sendFriendRequest",
					disabled = false,
					action = OpenPlatformFriendRequest,
					params = {
						controller = controller,
						gamertag = selectedGamertag,
						xuid = selectedXuid
					},
					lastInGroup = false
				} )
			else
				table.insert( buttonOptions, {
					text = "MENU_SEND_FRIEND_REQUEST",
					id = "sendFriendRequest",
					disabled = false,
					action = OpenPlatformFriendRequest,
					params = {
						controller = controller,
						gamertag = selectedGamertag,
						xuid = selectedXuid
					},
					lastInGroup = false
				} )
			end
		end
		if playerInfo.info.hasEverPlayed == true then
			table.insert( buttonOptions, {
				text = "MENU_REPORT_PLAYER",
				id = "reportPlayer",
				disabled = false,
				action = ShowReportPlayerDialog,
				params = {
					controller = controller,
					gamertag = selectedGamertag,
					xuid = selectedXuid
				},
				lastInGroup = false
			} )
		end
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
end, nil, nil, function ( controller, list, listModel )
	
end, function ( list, row, widgetHeight )
	if list.SocialPlayerDetailsButtons[row].properties.isLastButtonInGroup then
		return 9
	else
		
	end
end )
DataSources.LobbySelectionListSelectMode = {
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
}
DataSources.SpinnerMessage = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "spinnerModel" )
		Engine.CreateModel( model, "spinnerMessage" )
		return model
	end
}
DataSources.FeaturedCardsRoot = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" )
		return model
	end
}
DataSources.NetworkImage = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "NetworkImage" )
		return model
	end
}
DataSources.FeaturedCardHelper = function ( controller, allowCustomWidgets )
	local list = {}
	local sequence = 0
	if HasLiveEvent( controller ) then
		local customWidget = nil
		if allowCustomWidgets then
			customWidget = CoD.FE_LiveEventFeatureCard
		end
		table.insert( list, {
			models = {
				actionTitle = "MENU_WATCH_NOW",
				action = "liveevent",
				sequence = sequence
			},
			properties = {
				customWidgetOverride = customWidget
			}
		} )
		sequence = sequence + 1
	end
	local cardsData = Engine.GetFeaturedCardsData()
	if cardsData ~= nil then
		local count = cardsData.cardsCountToShow
		local enabled = cardsData.enabled
		if enabled == true and 0 < count then
			for index = 0, count - 1, 1 do
				local card = Engine.GetFeaturedCard( index )
				if card.valid == true then
					table.insert( list, {
						models = {
							index = index,
							title = card.title,
							subTitle = card.subTitle,
							type = card.type,
							actionTitle = card.actionTitle,
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

DataSources.FeaturedCardPostCreationHelper = function ( controller, list, listModel )
	if not list.eventViewerSubscription then
		local eventViewerModel = DataSources.LiveEventViewer.getModel( controller )
		if eventViewerModel then
			local streamModel = Engine.GetModel( eventViewerModel, "stream" )
			if streamModel then
				list.eventViewerSubscription = list:subscribeToModel( streamModel, function ()
					list:updateDataSource()
				end, false )
			end
		end
	end
end

DataSources.FeaturedCards = ListHelper_SetupDataSource( "FeaturedCards", function ( controller )
	return DataSources.FeaturedCardHelper( controller, true )
end, nil, nil, DataSources.FeaturedCardPostCreationHelper )
DataSources.FeaturedCardTicks = ListHelper_SetupDataSource( "FeaturedCardTicks", function ( controller )
	return DataSources.FeaturedCardHelper( controller, false )
end, nil, nil, DataSources.FeaturedCardPostCreationHelper )
DataSources.MarketingRoot = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "MarketingRoot" )
		return model
	end
}
DataSources.NetworkInfo = {
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
		local setSystemInfo = function ( model, infoType )
			local mainInfo, debugInfo = Engine.GetSystemInfo( controller, infoType )
			Engine.SetModelValue( model, mainInfo )
		end
		
		setSystemInfo( natType, CoD.SYSINFO_NAT_TYPE )
		setSystemInfo( bandwidth, CoD.SYSINFO_BANDWIDTH )
		setSystemInfo( connType, CoD.SYSINFO_CONNECTION_TYPE )
		setSystemInfo( extIP, CoD.SYSINFO_EXTERNAL_IP_ADDRESS )
		setSystemInfo( intIP, CoD.SYSINFO_INTERNAL_IP_ADDRESS )
		setSystemInfo( region, CoD.SYSINFO_GEOGRAPHICAL_REGION )
		setSystemInfo( version, CoD.SYSINFO_VERSION_NUMBER )
		setSystemInfo( connectivityInfo, CoD.SYSINFO_CONNECTIVITY_INFO )
		local url = "MENU_OPTIONS_NETWORK_CUSTOMER_SERVICE_LINK"
		if Dvar.ui_supportURL ~= nil then
			url = Dvar.ui_supportURL:get()
		end
		Engine.SetModelValue( supportURL, url )
		return model
	end
}
DataSources.PlayGoDownloadProgress = {
	getModel = function ( controller )
		local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress" )
		Engine.SetModelValue( Engine.CreateModel( rootModel, "progress" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( rootModel, "chunk" ), "" )
		return rootModel
	end
}
DataSources.NetStatsInfo = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "NetStatsInfo" )
		return model
	end
}
DataSources.MOTD = {
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
}
DataSources.MtxCommsMOTD = {
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
			Engine.ExecNow( controller, "setupThumbnailForMarketing mtxcommsmotd" )
			Engine.SetModelValue( Engine.CreateModel( model, "imageFileID" ), 1 )
		end
		if not data or not data.type then
			Engine.SetModelValue( Engine.CreateModel( model, "type" ), "" )
		end
		return model
	end
}
DataSources.MtxCommsRegistration = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "mtxCommsRegistration" )
		local data = Engine.GetMarketingMessage( controller, "registration" )
		if data ~= nil and not data.messageViewReported then
			for key, value in next, data, nil do
				Engine.SetModelValue( Engine.CreateModel( model, key ), value )
			end
			if data.action ~= "opt-in" and data.action ~= "registration" and data.content_long ~= "" then
				Engine.SetModelValue( Engine.CreateModel( model, "action_title" ), Engine.Localize( "ACCOUNT_LINK_LEARN_MORE" ) )
			end
		else
			local data = Engine.GetMarketingMessage( controller, "motd" )
			if data ~= nil and data.hasBanner then
				Engine.SetModelValue( Engine.CreateModel( model, "content_short" ), data.bannerTitle )
				Engine.SetModelValue( Engine.CreateModel( model, "action_title" ), Engine.Localize( data.bannerActionString ) )
				Engine.SetModelValue( Engine.CreateModel( model, "action" ), data.bannerAction )
				Engine.SetModelValue( Engine.CreateModel( model, "image" ), data.bannerImage )
				Engine.SetModelValue( Engine.CreateModel( model, "locationID" ), 1 )
			end
		end
		return model
	end
}
DataSources.CRMPopup = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "CRMPopup" )
		local source = Engine.GetModel( model, "location" )
		local data = nil
		if source ~= nil then
			local sourceString = Engine.GetModelValue( source )
			if sourceString == "crm_featured" then
				local featuredRoot = Engine.GetModel( Engine.GetGlobalModel(), "FeaturedCardsRoot" )
				local cardSequence = Engine.GetModelValue( Engine.GetModel( featuredRoot, "CardSequence" ) )
				local cardDataModelRoot = Engine.GetModel( Engine.GetModelForController( controller ), "FeaturedCards" )
				local cardDataModel = Engine.GetModel( cardDataModelRoot, cardSequence + 1 )
				local cardIndex = Engine.GetModelValue( Engine.GetModel( cardDataModel, "index" ) )
				data = Engine.GetMarketingMessage( controller, sourceString, cardIndex )
			else
				data = Engine.GetMarketingMessage( controller, sourceString )
			end
		else
			data = Engine.GetMarketingMessage( controller, "crm_featured" )
		end
		if data ~= nil then
			for key, value in pairs( data ) do
				Engine.SetModelValue( Engine.CreateModel( model, key ), value )
			end
		end
		if not data or not data.action then
			Engine.SetModelValue( Engine.CreateModel( model, "action" ), "" )
		end
		return model
	end
}
DataSources.WeaponBuildKitCategories = ListHelper_SetupDataSource( "WeaponBuildKitCategories", function ( controller )
	local weaponCategoryList = {}
	local categories = CoD.CraftUtility.WeaponGroupNames
	for index = 1, #categories, 1 do
		local category = categories[index]
		local breadcrumbCount = 0
		table.insert( weaponCategoryList, {
			models = {
				breadcrumbCount = breadcrumbCount,
				categoryRef = category.weapon_category,
				categoryName = category.lowercaseName,
				categoryImage = category.weapon_image
			},
			properties = {}
		} )
	end
	return weaponCategoryList
end, true )
DataSources.WeaponGroups = ListHelper_SetupDataSource( "WeaponGroups", function ( controller )
	local weaponCategoryList = {}
	local createWeaponGroup = function ( weaponNameTable, loadoutType )
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		for _, category in ipairs( weaponNameTable ) do
			if CoD.CACUtility.UnlockablesTable and CoD.CACUtility.UnlockablesTable[category.weapon_category] then
				table.insert( weaponCategoryList, {
					models = {
						tabName = category.name,
						breadcrumbCount = Engine.WeaponGroupNewItemCount( controller, category.weapon_category, nil, mode )
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
end, true )
DataSources.Unlockables = {
	prepare = function ( controller, list, filter )
		if not CoD.CACUtility.UnlockablesTable then
			CoD.CACUtility.UnlockablesTable = CoD.CACUtility.GetUnlockablesTable( controller, filter )
		end
		CoD.CACUtility.UpdateUnlockableTableBMItems( controller, CoD.CACUtility.UnlockablesTable )
		list.dataSource = CoD.CACUtility.UnlockablesTable
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
}
DataSources.CraftWeaponList = {
	prepare = function ( controller, list, filter )
		if not CoD.CraftWeaponListTable then
			CoD.CraftWeaponListTable = CoD.CACUtility.GetCraftWeaponListTable( controller, filter )
		end
		CoD.CACUtility.UpdateUnlockableTableBMItems( controller, CoD.CraftWeaponListTable )
		list.dataSource = CoD.CraftWeaponListTable
	end,
	getCount = function ( list )
		if not DataSources.CraftWeaponList.currentFilter and list.dataSource.filterList then
			return #list.dataSource.filterList
		elseif list.dataSource[DataSources.CraftWeaponList.currentFilter] then
			return #list.dataSource[DataSources.CraftWeaponList.currentFilter]
		else
			return 0
		end
	end,
	getItem = function ( controller, list, index )
		if not DataSources.CraftWeaponList.currentFilter and list.dataSource.filterList then
			return list.dataSource.filterList[index]
		elseif list.dataSource[DataSources.CraftWeaponList.currentFilter] then
			return list.dataSource[DataSources.CraftWeaponList.currentFilter][index]
		else
			
		end
	end,
	setCurrentFilterItem = function ( filter )
		DataSources.CraftWeaponList.currentFilter = filter
	end,
	getCurrentFilterItem = function ()
		return DataSources.CraftWeaponList.currentFilter
	end,
	currentFilter = nil
}
DataSources.WeaponAttachments = ListHelper_SetupDataSource( "WeaponAttachments", function ( controller )
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
			local damageStat = Engine.TableLookup( CoD.weaponAttributes, damageLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
			local rangeStat = Engine.TableLookup( CoD.weaponAttributes, rangeLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
			local fireRateStat = Engine.TableLookup( CoD.weaponAttributes, fireRateLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
			local accuracyStat = Engine.TableLookup( CoD.weaponAttributes, accuracyLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
			local f270_local3 = equippedAttachmentAttributes.damage
			local f270_local4
			if damageStat == "" then
				f270_local4 = 0
				if not f270_local4 then
				
				else
					equippedAttachmentAttributes.damage = f270_local3 + f270_local4
					f270_local3 = equippedAttachmentAttributes.range
					if rangeStat == "" then
						f270_local4 = 0
						if not f270_local4 then
						
						else
							equippedAttachmentAttributes.range = f270_local3 + f270_local4
							f270_local3 = equippedAttachmentAttributes.fireRate
							if fireRateStat == "" then
								f270_local4 = 0
								if not f270_local4 then
								
								else
									equippedAttachmentAttributes.fireRate = f270_local3 + f270_local4
									f270_local3 = equippedAttachmentAttributes.accuracy
									if accuracyStat == "" then
										f270_local4 = 0
										if not f270_local4 then
										
										else
											equippedAttachmentAttributes.accuracy = f270_local3 + f270_local4
										end
									end
									f270_local4 = accuracyStat
								end
							end
							f270_local4 = fireRateStat
						end
					end
					f270_local4 = rangeStat
				end
			end
			f270_local4 = damageStat
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
			local attachmentAllocation = Engine.GetAttachmentAllocationCost( weaponItemIndex, index )
			if attachmentAllocation > 0 then
				local attachmentRef = Engine.GetAttachmentRef( weaponItemIndex, index )
				local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
				local attachmentImage = Engine.GetAttachmentUniqueImageByIndex( weaponItemIndex, index )
				local unlockablesModel = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" )
				if not unlockablesModel then
					CoD.CACUtility.GetUnlockablesTable( controller )
					unlockablesModel = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" )
				end
				local accuracyStat = Engine.GetModel( unlockablesModel, weaponItemIndex .. ".weaponAttributes" )
				local getWeaponAttributeValues = function ( attributeName, attributeLookupEnum )
					local weaponAttributeValue = Engine.GetModelValue( Engine.GetModel( accuracyStat, attributeName ) )
					local attachmentAttributeValue = Engine.TableLookup( CoD.weaponAttributes, attributeLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
					if weaponAttributeValue == "" then
						weaponAttributeValue = 0
					end
					if attachmentAttributeValue == "" then
						attachmentAttributeValue = 0
					end
					local isAttachmentEquipped = false
					for index, equippedAttachmentRef in ipairs( equippedAttachmentRefList ) do
						if equippedAttachmentRef == attachmentRef then
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
						acvIndex = CoD.CACUtility.EmptyItemIndex
					}
				}
				table.insert( attachments, attachmentInfo )
			end
		end
	end
	return attachments
end, true )
DataSources.EquippedBubbleGumPack = {
	getModel = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		local equippedBubbleGumPackModel = Engine.CreateModel( perControllerModel, "EquippedBubbleGumPack" )
		local equippedBubbleGumPackIndex = Engine.GetEquippedBubbleGumPack( controller )
		Engine.SetModelValue( Engine.CreateModel( equippedBubbleGumPackModel, "bgbPackIndex" ), equippedBubbleGumPackIndex )
		return equippedBubbleGumPackModel
	end
}
DataSources.BubbleGumBuffs = {
	prepare = function ( controller, list, filter )
		local perControllerModel = Engine.GetModelForController( controller )
		local equippedBubbleGumPackIndex = Engine.GetEquippedBubbleGumPack( controller )
		DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( controller, perControllerModel, equippedBubbleGumPackIndex )
	end,
	getCount = function ( list )
		return CoD.BGBUtility.NumBuffsPerPack
	end,
	getItem = function ( controller, list, index )
		if list:getParent() then
			local f275_local0 = list:getParent()
			return f275_local0:getModel( controller, "BubbleGumBuffs." .. index )
		else
			return Engine.CreateModel( Engine.GetModelForController( controller ), "BubbleGumBuffs." .. index )
		end
	end,
	setupBubbleGumBuffsModel = function ( controller, parentModel, bubbleGumPackIndex )
		local bubbleGumBuffsModel = Engine.CreateModel( parentModel, "BubbleGumBuffs" )
		for bubbleGumBuffIndex = 0, CoD.BGBUtility.NumBuffsPerPack - 1, 1 do
			local bubbleGumBuffModel = Engine.CreateModel( bubbleGumBuffsModel, bubbleGumBuffIndex + 1 )
			local itemIndex = Engine.GetBubbleGumBuff( controller, bubbleGumPackIndex, bubbleGumBuffIndex )
			Engine.SetModelValue( Engine.CreateModel( bubbleGumBuffModel, "bgbIndex" ), bubbleGumBuffIndex )
			Engine.SetModelValue( Engine.CreateModel( bubbleGumBuffModel, "itemIndex" ), itemIndex )
		end
	end
}
DataSources.BubbleGumPacks = {
	prepare = function ( controller, list, filter )
		list.bubbleGumPacks = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local bubbleGumPacksModel = Engine.CreateModel( perControllerModel, "BubbleGumPacks" )
		for bubbleGumPackIndex = 0, CoD.BGBUtility.NumPacks - 1, 1 do
			local bubbleGumPackModel = Engine.CreateModel( bubbleGumPacksModel, bubbleGumPackIndex )
			local bubbleGumPackName = Engine.GetBubbleGumPackName( controller, bubbleGumPackIndex )
			Engine.SetModelValue( Engine.CreateModel( bubbleGumPackModel, "bgbPackIndex" ), bubbleGumPackIndex )
			Engine.SetModelValue( Engine.CreateModel( bubbleGumPackModel, "bubbleGumPackName" ), bubbleGumPackName )
			DataSources.BubbleGumBuffs.setupBubbleGumBuffsModel( controller, bubbleGumPackModel, bubbleGumPackIndex )
			local equippedBubblegumPackIndex = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "EquippedBubbleGumPack.bgbPackIndex" ) )
			if equippedBubblegumPackIndex and equippedBubblegumPackIndex + 1 == bubbleGumPackIndex then
				list.selectIndex = bubbleGumPackIndex
			end
			table.insert( list.bubbleGumPacks, bubbleGumPackModel )
		end
	end,
	getCount = function ( list )
		return #list.bubbleGumPacks
	end,
	getItem = function ( controller, list, index )
		return list.bubbleGumPacks[index]
	end,
	getCustomPropertiesForItem = function ( list, index )
		if list.selectIndex == index then
			return {
				selectIndex = true
			}
		else
			
		end
	end
}
DataSources.BubbleGumTabType = ListHelper_SetupDataSource( "BubbleGumTabType", function ( controller )
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
			tabName = Engine.Localize( "ZMUI_BUBBLEGUM_TAB_NAME_CAPS" ),
			breadcrumbCount = Engine.WeaponGroupNewItemCount( controller, "bubblegum", "", Enum.eModes.MODE_ZOMBIES )
		},
		properties = {
			filter = "bubblegum"
		}
	} )
	if IsProgressionEnabled( controller ) and not IsInPermanentUnlockMenu( controller ) then
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( "ZMUI_MEGACHEW_CAPS" ),
				breadcrumbCount = Engine.WeaponGroupNewItemCount( controller, "bubblegum_consumable", "", Enum.eModes.MODE_ZOMBIES )
			},
			properties = {
				filter = "bubblegum_consumable"
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
end, true )
DataSources.MegaChewTokens = {
	getModel = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		local tokenModel = Engine.CreateModel( perControllerModel, "MegaChewTokens" )
		Engine.SetModelValue( Engine.CreateModel( tokenModel, "remainingTokens" ), Engine.IsLootReady( controller ) and Engine.GetZMVials( controller ) or -1 )
		return tokenModel
	end
}
DataSources.MegaChewMachines = {
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
}
DataSources.ClientDemoFiles = {
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
}
DataSources.TheaterSelectFilmTabs = ListHelper_SetupDataSource( "TheaterSelectFilmTabs", function ( controller )
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
	table.insert( tabList, {
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
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return tabList
end )
DataSources.Demo = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		return Engine.CreateModel( Engine.GetGlobalModel(), "demo" )
	end
}
DataSources.DemoControlsButtons = {
	prepare = function ( controller, list, filter )
		list.buttons = {}
		local buttons = {}
		local demoPausedModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.isPaused" )
		local isPaused = Engine.GetModelValue( demoPausedModel )
		local demoContextModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" )
		local demoClipStateModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.clipState" )
		local demoTimeScaleModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
		local demoCameraModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" )
		local demoFreeCameraModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.freeCameraMode" )
		local keyframeForJumpBackModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.keyframeForJumpBack" )
		local keyframeForJumpForwardModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.keyframeForJumpForward" )
		local dollycamMarkerForJumpBackModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerForJumpBack" )
		local dollycamMarkerForJumpForwardModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerForJumpForward" )
		local dollycamMarkerCountModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.dollyCamMarkerCount" )
		local editDollycamMarkerModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.editingDollyCameraMarker" )
		local isEditingDollyCamMarker = Engine.GetModelValue( editDollycamMarkerModel )
		local currentDollyCamMarkerTimeScaleModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleMode" )
		local currentDollyCamMarkerTimeScaleMode = Engine.GetModelValue( currentDollyCamMarkerTimeScaleModeModel )
		local isRepositioningDollyCamMarkerModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningDollyCamMarker" )
		local isRepositioningDollyCamMarker = Engine.GetModelValue( isRepositioningDollyCamMarkerModel )
		local lightmanMarkerCountModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.lightmanMarkerCount" )
		local editLightmanMarkerModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.editingLightmanMarker" )
		local isEditingLightmanMarker = Engine.GetModelValue( editLightmanMarkerModel )
		local currentLightmanMarkerLightModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightMode" )
		local currentLightmanMarkerLightMode = Engine.GetModelValue( currentLightmanMarkerLightModeModel )
		local isRepositioningLightmanMarkerModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.isRepositioningLightmanMarker" )
		local isRepositioningLightmanMarker = Engine.GetModelValue( isRepositioningLightmanMarkerModel )
		local isCreatingHighlightReelModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.isCreatingHighlightReel" )
		local isCreatingHighlightReel = Engine.GetModelValue( isCreatingHighlightReelModel )
		local GetFastForwardIconForTimeScale = function ( timescale )
			if 6 <= timescale then
				return "theater_fastforward_3"
			elseif timescale >= 4 then
				return "theater_fastforward_2"
			elseif timescale >= 2 then
				return "theater_fastforward_1"
			else
				return "theater_fastforward"
			end
		end
		
		local GetIconForDollyCameraSpeedMode = function ( mode )
			if mode == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
				return "theater_draw_straight"
			elseif mode == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
				return "theater_draw_angle"
			else
				return "theater_draw"
			end
		end
		
		local GetHintTextForDollyCameraSpeedMode = function ( mode )
			if mode == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
				return "DEMO_DOLLY_CAMERA_SPEED_MODE_FIXED_HINT"
			elseif mode == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
				return "DEMO_DOLLY_CAMERA_SPEED_MODE_LINEAR_HINT"
			else
				return "DEMO_DOLLY_CAMERA_SPEED_MODE_MANUAL_HINT"
			end
		end
		
		local GetIconForLightmanLightMode = function ( mode )
			if mode == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
				return "theater_light_omni"
			else
				return "theater_light_spot"
			end
		end
		
		local GetHintTextForLightmanLightMode = function ( mode )
			if mode == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
				return "DEMO_LIGHTMAN_LIGHT_MODE_OMNI_HINT"
			else
				return "DEMO_LIGHTMAN_LIGHT_MODE_SPOT_HINT"
			end
		end
		
		local GetHintTextForRecordButton = function ()
			if Engine.IsDemoCameraEditMode() then
				return "DEMO_RECORD_AND_PLAY_DOLLY_CAMERA_HINT"
			else
				return "DEMO_RECORD_HINT"
			end
		end
		
		local DemoPlayDollyCameraAction = function ()
			CoD.DemoUtility.UnpauseIfPaused( controller )
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_DOLLY )
		end
		
		local handleButtonAction = function ( self, element, controller, param, menu )
			local btnId = element.btnId
			if btnId == "screenshot" then
				Engine.Exec( controller, "demo_screenshot" )
			elseif btnId == "record" then
				if Engine.IsDemoClipRecording() then
					Engine.Exec( controller, "demo_pausecliprecord" )
				else
					if Engine.IsDemoCameraEditMode() then
						DemoPlayDollyCameraAction()
					end
					Engine.Exec( controller, "demo_startcliprecord" )
				end
			elseif btnId == "jumpback" then
				DemoJumpBack( controller )
			elseif btnId == "jumpforward" then
				Engine.Exec( controller, "demo_forward" )
			elseif btnId == "play" or btnId == "pause" then
				CoD.DemoUtility.RunPauseCommand( controller )
			elseif btnId == "fastforward" then
				CoD.DemoUtility.UnpauseIfPaused( controller )
				local timescale = UpdateDemoFastForward( controller )
				local iconModel = Engine.GetModel( element:getModel(), "icon" )
				local iconImage = GetFastForwardIconForTimeScale( timescale )
				Engine.SetModelValue( iconModel, iconImage )
			elseif btnId == "options" then
				
			elseif btnId == "jumpbackdollycamera" then
				CoD.DemoUtility.SwitchToDollyCamMarker( controller, Engine.GetModelValue( dollycamMarkerForJumpBackModel ) )
			elseif btnId == "playdollycamera" then
				DemoPlayDollyCameraAction()
			elseif btnId == "pausedollycamera" then
				Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_EDIT )
			elseif btnId == "jumpforwarddollycamera" then
				CoD.DemoUtility.SwitchToDollyCamMarker( controller, Engine.GetModelValue( dollycamMarkerForJumpForwardModel ) )
			elseif btnId == "movedollycameramarker" then
				if isRepositioningDollyCamMarker then
					DemoPlaceDollyCameraMarker( controller )
				else
					CoD.DemoUtility.RepositionDollyCamMarker( controller, Engine.GetHighlightedCameraMarker() )
				end
			elseif btnId == "deletedollycameramarker" then
				CoD.DemoUtility.RemoveDollyCamMarker( controller, Engine.GetHighlightedCameraMarker() )
				CoD.DemoUtility.SetEditingDollyCameraMarker( controller, false )
			elseif btnId == "deletealldollycameramarkers" then
				local parent = menu:getParent()
				CoD.OverlayUtility.CreateOverlay( controller, parent, "DemoDeleteAllDollyCameraMarkers" )
			elseif btnId == "movelightmanmarker" then
				if isRepositioningLightmanMarker then
					DemoPlaceLightmanMarker( controller )
				else
					CoD.DemoUtility.RepositionLightmanMarker( controller, Engine.GetHighlightedCameraMarker() )
				end
			elseif btnId == "lightmanlightcolor" then
				local parent = menu:getParent()
				OpenPopupWithPriority( parent, "LightmanColorPicker", controller, 200 )
				Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.showLightmanColorPicker" ), true )
			elseif btnId == "deletelightmanmarker" then
				CoD.DemoUtility.RemoveLightmanMarker( controller, Engine.GetHighlightedCameraMarker() )
				CoD.DemoUtility.SetEditingLightmanMarker( controller, false )
			elseif btnId == "deletealllightmanmarkers" then
				local parent = menu:getParent()
				CoD.OverlayUtility.CreateOverlay( controller, parent, "DemoDeleteAllLightmanMarkers" )
			end
		end
		
		if IsDemoClipPreviewRunning() or isCreatingHighlightReel then
			table.insert( buttons, {
				btnId = "dummy",
				icon = "theater_move",
				hintText = "",
				disabled = true
			} )
		elseif isEditingDollyCamMarker then
			table.insert( buttons, {
				btnId = "movedollycameramarker",
				icon = "theater_move",
				hintText = "DEMO_MOVE_DOLLY_CAMERA_HINT"
			} )
			table.insert( buttons, {
				btnId = "dollycameraspeedmode",
				icon = GetIconForDollyCameraSpeedMode( currentDollyCamMarkerTimeScaleMode ),
				hintText = GetHintTextForDollyCameraSpeedMode( currentDollyCamMarkerTimeScaleMode ),
				disabled = isRepositioningDollyCamMarker == true
			} )
			local f289_local0 = table.insert
			local f289_local1 = buttons
			local f289_local2 = {
				btnId = "dollycameratimescale",
				icon = nil,
				hintText = "DEMO_DOLLY_CAMERA_SPEED_HINT"
			}
			local f289_local3
			if currentDollyCamMarkerTimeScaleMode ~= Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL and isRepositioningDollyCamMarker ~= true then
				f289_local3 = false
			else
				f289_local3 = true
			end
			f289_local2.disabled = f289_local3
			f289_local0( f289_local1, f289_local2 )
			table.insert( buttons, {
				btnId = "deletedollycameramarker",
				icon = "theater_video_x",
				hintText = "DEMO_DOLLY_CAMERA_DELETE_HINT",
				disabled = isRepositioningDollyCamMarker == true
			} )
			table.insert( buttons, {
				btnId = "deletealldollycameramarkers",
				icon = "theater_video_xx",
				hintText = "DEMO_DOLLY_CAMERA_DELETE_ALL_HINT",
				disabled = isRepositioningDollyCamMarker == true
			} )
		elseif isEditingLightmanMarker then
			table.insert( buttons, {
				btnId = "movelightmanmarker",
				icon = "theater_move",
				hintText = "DEMO_MOVE_LIGHT_HINT"
			} )
			table.insert( buttons, {
				btnId = "lightmanlightmode",
				icon = GetIconForLightmanLightMode( currentLightmanMarkerLightMode ),
				hintText = GetHintTextForLightmanLightMode( currentLightmanMarkerLightMode ),
				disabled = isRepositioningLightmanMarker == true
			} )
			table.insert( buttons, {
				btnId = "lightmanlightintensity",
				icon = "theater_light_intensity",
				hintText = "DEMO_LIGHT_INTENSITY_HINT",
				disabled = isRepositioningLightmanMarker == true
			} )
			table.insert( buttons, {
				btnId = "lightmanlightrange",
				icon = "theater_light_range",
				hintText = "DEMO_LIGHT_RANGE_HINT",
				disabled = isRepositioningLightmanMarker == true
			} )
			table.insert( buttons, {
				btnId = "lightmanlightcolor",
				icon = "theater_light_color",
				hintText = "DEMO_LIGHT_COLOR_HINT",
				disabled = isRepositioningLightmanMarker == true
			} )
			table.insert( buttons, {
				btnId = "deletelightmanmarker",
				icon = "theater_video_x",
				hintText = "DEMO_LIGHT_DELETE_HINT",
				disabled = isRepositioningLightmanMarker == true
			} )
			table.insert( buttons, {
				btnId = "deletealllightmanmarkers",
				icon = "theater_video_xx",
				hintText = "DEMO_LIGHT_DELETE_ALL_HINT",
				disabled = isRepositioningLightmanMarker == true
			} )
		else
			if not IsDemoRestrictedBasicMode() then
				if not IsDemoContextPlaybackMode() and not IsDemoContextHighlightReelMode() then
					table.insert( buttons, {
						btnId = "screenshot",
						icon = "theater_photo",
						hintText = "DEMO_SCREENSHOT_HINT"
					} )
					table.insert( buttons, {
						btnId = "record",
						icon = "theater_record",
						hintText = GetHintTextForRecordButton(),
						spacerWidth = 10
					} )
				else
					table.insert( buttons, {
						btnId = "screenshot",
						icon = "theater_photo",
						hintText = "DEMO_SCREENSHOT_HINT",
						spacerWidth = 10
					} )
				end
			end
			table.insert( buttons, {
				btnId = "jumpback",
				icon = "theater_back",
				hintText = "DEMO_JUMP_BACK_HINT",
				disabled = Engine.GetModelValue( keyframeForJumpBackModel ) == -1
			} )
			if IsDemoContextDirectorMode() then
				table.insert( buttons, {
					btnId = "jumpbackdollycamera",
					icon = "theater_back_active",
					hintText = "DEMO_JUMP_BACK_DOLLY_CAMERA_HINT",
					disabled = Engine.GetModelValue( dollycamMarkerForJumpBackModel ) == -1
				} )
			end
			if isPaused == true then
				table.insert( buttons, {
					btnId = "play",
					icon = "theater_play",
					hintText = "DEMO_PLAY_HINT"
				} )
			else
				table.insert( buttons, {
					btnId = "pause",
					icon = "theater_pause",
					hintText = "DEMO_PAUSE_HINT"
				} )
			end
			if IsDemoContextDirectorMode() then
				if Engine.IsDemoDollyCamera() then
					table.insert( buttons, {
						btnId = "pausedollycamera",
						icon = "theater_video_pause",
						hintText = "DEMO_PAUSE_DOLLY_CAMERA_HINT"
					} )
				else
					local hintText = "DEMO_PLAY_DOLLY_CAMERA_HINT"
					local disabled = false
					if Engine.GetModelValue( dollycamMarkerCountModel ) <= 0 then
						hintText = "DEMO_PLAY_DOLLY_CAMERA_NOMARKERS_HINT"
						disabled = true
					end
					table.insert( buttons, {
						btnId = "playdollycamera",
						icon = "theater_video_play",
						hintText = hintText,
						disabled = disabled
					} )
				end
			end
			if not IsDemoContextPlaybackMode() then
				table.insert( buttons, {
					btnId = "fastforward",
					icon = GetFastForwardIconForTimeScale( CoD.DemoUtility.GetRoundedTimeScale() ),
					hintText = "DEMO_FAST_FORWARD_HINT"
				} )
			end
			if IsDemoContextDirectorMode() then
				table.insert( buttons, {
					btnId = "jumpforwarddollycamera",
					icon = "theater_forward_active",
					hintText = "DEMO_JUMP_FORWARD_DOLLY_CAMERA_HINT",
					disabled = Engine.GetModelValue( dollycamMarkerForJumpForwardModel ) == -1
				} )
			end
			table.insert( buttons, {
				btnId = "jumpforward",
				icon = "theater_forward",
				hintText = "DEMO_JUMP_FORWARD_HINT",
				disabled = Engine.GetModelValue( keyframeForJumpForwardModel ) == -1
			} )
			if not IsDemoContextPlaybackMode() then
				table.insert( buttons, {
					btnId = "timescale",
					icon = nil,
					hintText = "DEMO_TIMESCALE_HINT"
				} )
				if IsDemoContextBasicOrHighlightReelMode() then
					table.insert( buttons, {
						btnId = "cameramode",
						icon = "theater_video",
						hintText = "DEMO_CHANGE_CAMERA_HINT"
					} )
				end
			end
		end
		for index, buttonData in ipairs( buttons ) do
			local buttonProperties = {
				btnId = buttonData.btnId,
				spacerWidth = buttonData.spacerWidth
			}
			local buttonModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "DemoControls" ), "buttonModel_" .. index )
			table.insert( list.buttons, {
				model = buttonModel,
				properties = buttonProperties
			} )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "btnId" ), buttonData.btnId )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "icon" ), buttonData.icon )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "hintText" ), Engine.Localize( buttonData.hintText ) )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), handleButtonAction )
			if buttonData.disabled then
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "disabled" ), buttonData.disabled )
			else
				Engine.SetModelValue( Engine.CreateModel( buttonModel, "disabled" ), false )
			end
		end
		local updateDataSourceFn = function ()
			list:updateDataSource()
		end
		
		if not list.subscribedToModels then
			list:subscribeToModel( demoPausedModel, updateDataSourceFn, false )
			list:subscribeToModel( demoCameraModeModel, updateDataSourceFn, false )
			list:subscribeToModel( demoFreeCameraModeModel, updateDataSourceFn, false )
			list:subscribeToModel( keyframeForJumpBackModel, updateDataSourceFn, false )
			list:subscribeToModel( keyframeForJumpForwardModel, updateDataSourceFn, false )
			list:subscribeToModel( demoContextModeModel, updateDataSourceFn, false )
			list:subscribeToModel( demoClipStateModel, updateDataSourceFn, false )
			list:subscribeToModel( demoTimeScaleModel, updateDataSourceFn, false )
			list:subscribeToModel( dollycamMarkerForJumpBackModel, updateDataSourceFn, false )
			list:subscribeToModel( dollycamMarkerForJumpForwardModel, updateDataSourceFn, false )
			list:subscribeToModel( dollycamMarkerCountModel, updateDataSourceFn, false )
			list:subscribeToModel( editDollycamMarkerModel, updateDataSourceFn, false )
			list:subscribeToModel( currentDollyCamMarkerTimeScaleModeModel, updateDataSourceFn, false )
			list:subscribeToModel( isRepositioningDollyCamMarkerModel, updateDataSourceFn, false )
			list:subscribeToModel( lightmanMarkerCountModel, updateDataSourceFn, false )
			list:subscribeToModel( editLightmanMarkerModel, updateDataSourceFn, false )
			list:subscribeToModel( currentLightmanMarkerLightModeModel, updateDataSourceFn, false )
			list:subscribeToModel( isRepositioningLightmanMarkerModel, updateDataSourceFn, false )
			list:subscribeToModel( isCreatingHighlightReelModel, updateDataSourceFn, false )
			list.subscribedToModels = true
		end
	end,
	getCount = function ( list )
		return #list.buttons
	end,
	getItem = function ( controller, list, index )
		return list.buttons[index].model
	end,
	getCustomPropertiesForItem = function ( list, index )
		return list.buttons[index].properties
	end,
	getSpacerAfterColumn = function ( list, col, widgetWidth )
		if list.buttons[col].properties.spacerWidth then
			return list.buttons[col].properties.spacerWidth
		else
			return 0
		end
	end,
	getWidgetTypeForItem = function ( list, dataItemModel, row, col )
		local btnId = list.buttons[col].properties.btnId
		if btnId == "timescale" then
			return CoD.DemoControlsButtonTimeScale
		elseif btnId == "dollycameratimescale" then
			return CoD.DemoControlsButtonDollyCameraTimeScale
		elseif btnId == "cameramode" then
			return CoD.DemoControlsButtonCameraMode
		elseif btnId == "dollycameraspeedmode" then
			return CoD.DemoControlsButtonDollyCameraSpeedMode
		elseif btnId == "lightmanlightmode" then
			return CoD.DemoControlsButtonLightmanLightMode
		elseif btnId == "lightmanlightintensity" or btnId == "lightmanlightrange" then
			return CoD.DemoControlsButtonLightmanLightFloatParam
		else
			return CoD.DemoControlsButton
		end
	end
}
DataSources.DemoChooseModeButtonList = ListHelper_SetupDataSource( "DemoChooseModeButtonList", function ( controller )
	local list = {}
	local handleButtonAction = function ( self, element, controller, param, menu )
		local btnId = element.btnId
		local currentContextMode = CoD.DemoUtility.GetDemoContextMode()
		if currentContextMode == Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC then
			CoD.perController[controller].prevDemoCameraMode = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ) )
		end
		if btnId == "basic" then
			if CoD.perController[controller].prevDemoCameraMode then
				Engine.SwitchDemoCameraMode( CoD.perController[controller].prevDemoCameraMode )
			else
				Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE )
			end
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_FREEROAM )
			CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_BASIC )
		elseif btnId == "director" then
			Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_EDIT )
			CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_DIRECTOR )
		elseif btnId == "objectlink" then
			Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_LOCK_ON )
			CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_OBJECT_LINK )
		elseif btnId == "lighter" then
			Engine.SwitchDemoCameraMode( Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM )
			Engine.SwitchDemoFreeCameraMode( Enum.demoFreeCameraMode.DEMO_FREECAM_MODE_LIGHTMAN )
			CoD.DemoUtility.SetDemoContextMode( Enum.demoContextMode.DEMO_CONTEXT_MODE_LIGHTER )
		elseif btnId == "timeline" then
			StartMenuOpenManageSegments( self, element, controller, param, menu )
		end
	end
	
	local buttons = {}
	if not IsDemoContextHighlightReelMode() then
		table.insert( buttons, {
			btnId = "basic",
			displayText = "DEMO_MODE_BASIC",
			hintText = "DEMO_MODE_BASIC_HINT",
			icon = "theater_play"
		} )
		table.insert( buttons, {
			btnId = "director",
			displayText = "DEMO_MODE_DIRECTOR",
			hintText = "DEMO_MODE_DIRECTOR_HINT",
			icon = "theater_video"
		} )
		table.insert( buttons, {
			btnId = "objectlink",
			displayText = "DEMO_MODE_OBJECT_LINK",
			hintText = "DEMO_MODE_OBJECT_LINK_HINT",
			icon = "theater_link"
		} )
		table.insert( buttons, {
			btnId = "lighter",
			displayText = "DEMO_MODE_LIGHTER",
			hintText = "DEMO_MODE_LIGHTER_HINT",
			icon = "theater_bulb"
		} )
	end
	table.insert( buttons, {
		btnId = "timeline",
		displayText = "DEMO_MODE_TIMELINE_EDITOR",
		hintText = "DEMO_MODE_TIMELINE_EDITOR_HINT",
		icon = "theater_timeline"
	} )
	for index, buttonData in ipairs( buttons ) do
		table.insert( list, {
			models = {
				displayText = Engine.Localize( buttonData.displayText ),
				hintText = Engine.Localize( buttonData.hintText ),
				icon = buttonData.icon,
				action = handleButtonAction
			},
			properties = {
				btnId = buttonData.btnId
			}
		} )
	end
	return list
end )
DataSources.DemoFilmOptionsButtonList = ListHelper_SetupDataSource( "DemoFilmOptionsButtonList", function ( controller )
	local list = {}
	local buttons = {}
	local highlightedSegmentModel = CoD.DemoUtility.Timeline_GetHighlightedSegmentModel()
	local handleButtonAction = function ( self, element, controller, param, menu )
		local btnId = element.btnId
		local segmentNumber, segmentIndex = nil
		if highlightedSegmentModel then
			segmentIndex = Engine.GetModelValue( Engine.GetModel( highlightedSegmentModel, "segmentNumber" ) ) - 1
		end
		if btnId == "preview" then
			Engine.Exec( controller, "demo_previewsegment " .. segmentIndex )
			GoBack( self.occludedMenu, controller )
		elseif btnId == "delete" then
			CoD.OverlayUtility.CreateOverlay( controller, self, "DemoDeleteSegment" )
		elseif btnId == "rename" then
			OpenDemoKeyboard( self, element, controller, "segmentName", segmentIndex )
		elseif btnId == "saveclip" then
			StartMenuUploadClip( self, element, controller, param, menu )
		elseif btnId == "mergeall" then
			CoD.OverlayUtility.CreateOverlay( controller, self, "DemoMergeAllSegments" )
		elseif btnId == "deleteall" then
			CoD.OverlayUtility.CreateOverlay( controller, self, "DemoDeleteAllSegments" )
		end
	end
	
	if highlightedSegmentModel ~= nil then
		local isEmpty = Engine.GetModelValue( Engine.GetModel( highlightedSegmentModel, "disabled" ) )
		if isEmpty == false then
			table.insert( buttons, {
				btnId = "preview",
				displayText = "DEMO_VIEW_SHOT",
				hintText = "DEMO_VIEW_SHOT_HINT",
				icon = "theater_view"
			} )
			table.insert( buttons, {
				btnId = "delete",
				displayText = "DEMO_DELETE_SHOT",
				hintText = "DEMO_DELETE_SHOT_HINT",
				icon = "theater_delete"
			} )
			table.insert( buttons, {
				btnId = "rename",
				displayText = "DEMO_RENAME_SHOT",
				hintText = "DEMO_RENAME_SHOT_HINT",
				icon = "theater_rename",
				spacerHeight = 16
			} )
		end
	end
	table.insert( buttons, {
		btnId = "saveclip",
		displayText = "DEMO_SAVE_CLIP",
		hintText = "DEMO_SAVE_CLIP_HINT",
		icon = "theater_save"
	} )
	if Engine.GetDemoSegmentCount() > 1 then
		table.insert( buttons, {
			btnId = "mergeall",
			displayText = "DEMO_MERGE_ALL_SHOTS",
			hintText = "DEMO_MERGE_ALL_SHOTS_HINT",
			icon = "theater_merge"
		} )
	end
	table.insert( buttons, {
		btnId = "deleteall",
		displayText = "DEMO_DELETE_ALL_SHOTS",
		hintText = "DEMO_DELETE_ALL_SHOTS_HINT",
		icon = "theater_delete_all"
	} )
	for index, buttonData in ipairs( buttons ) do
		table.insert( list, {
			models = {
				displayText = Engine.Localize( buttonData.displayText ),
				hintText = Engine.Localize( buttonData.hintText ),
				icon = buttonData.icon,
				action = handleButtonAction
			},
			properties = {
				btnId = buttonData.btnId,
				spacerHeight = buttonData.spacerHeight
			}
		} )
	end
	return list
end, nil, nil, nil, function ( list, row, widgetHeight )
	local spacerHeight = list.DemoFilmOptionsButtonList[row].properties.spacerHeight
	if spacerHeight then
		return spacerHeight
	else
		return list.spacing
	end
end )
DataSources.DemoSegments = {
	prepare = function ( controller, list, filter )
		list.segments = {}
		local maxSegments = 20
		local demoSegmentsRefreshModel = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" )
		for i = 1, maxSegments, 1 do
			local index = i - 1
			local model = CoD.DemoUtility.SetupDemoSegmentModel( index )
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
}
DataSources.DemoHighlightReelSettingsButtonList = ListHelper_SetupDataSource( "DemoHighlightReelSettingsButtonList", function ( controller )
	local list = {}
	local f314_local0 = Engine.CurrentSessionMode() == Enum.eModes.MODE_ZOMBIES
	local engineFunc = function ( menu, controller, profileVar, value )
		CoD.DemoUtility.RebuildHighlightReelTimeline( controller )
	end
	
	local playerFilterOptions = {}
	table.insert( playerFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_ONLY_ME",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_ME
	} )
	table.insert( playerFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_FRIENDS",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_FRIENDS
	} )
	table.insert( playerFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_SELF_AND_FRIENDS",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_ME_AND_FRIENDS
	} )
	table.insert( playerFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_FRIENDLY_TEAM",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_FRIENDLY_TEAM
	} )
	table.insert( playerFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_ENEMY_TEAM",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_ENEMY_TEAM
	} )
	table.insert( playerFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_EVERYONE",
		value = Enum.demoHighlightReelPlayerFilter.DEMO_HIGHLIGHT_REEL_PLAYER_FILTER_EVERYONE
	} )
	local stylesFilterOptions = {}
	table.insert( stylesFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_BEST_MOMENTS",
		value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_BEST_MOMENTS
	} )
	if f314_local0 then
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_RAMPAGER",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_RAMPAGER
		} )
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_SAVIOR_AND_SINNER",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_SAVIOR_AND_SINNER
		} )
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_TEAM_PLAYER",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_TEAM_PLAYER
		} )
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_BIG_SPENDER",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_BIG_SPENDER
		} )
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_HANDYMAN",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_ZM_HANDYMAN
		} )
	else
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_EXPLOSIVE_AND_PROJECTILE",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_EXPLOSIVE_AND_PROJECTILE_KILLS
		} )
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_VEHICLE",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_VEHICLE_KILLS
		} )
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_GUN_KILLS_ONLY",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_ONLY
		} )
		table.insert( stylesFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_GUN_KILL_AND_EVENTS",
			value = Enum.demoHighlightReelStylesFilter.DEMO_HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_AND_EVENTS
		} )
	end
	local numberOfSegmentsOptions = {}
	table.insert( numberOfSegmentsOptions, {
		name = "5",
		value = 5
	} )
	table.insert( numberOfSegmentsOptions, {
		name = "10",
		value = 10
	} )
	table.insert( numberOfSegmentsOptions, {
		name = "20",
		value = 20
	} )
	local starsFilterOptions = {}
	table.insert( starsFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_ONE",
		value = 1
	} )
	table.insert( starsFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_TWO",
		value = 2
	} )
	table.insert( starsFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_THREE",
		value = 3
	} )
	table.insert( starsFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_FOUR",
		value = 4
	} )
	table.insert( starsFilterOptions, {
		name = "MENU_DEMO_HIGHLIGHT_REEL_STARS_FIVE",
		value = 5
	} )
	local transitionFilterOptions = {}
	table.insert( transitionFilterOptions, {
		name = "MENU_DEMO_TRANSITION_CUT",
		value = Enum.demoHighlightReelTransitionFilter.DEMO_HIGHLIGHT_REEL_TRANSITION_FILTER_NONE
	} )
	table.insert( transitionFilterOptions, {
		name = "MENU_DEMO_TRANSITION_FADE",
		value = Enum.demoHighlightReelTransitionFilter.DEMO_HIGHLIGHT_REEL_TRANSITION_FILTER_FADE
	} )
	table.insert( transitionFilterOptions, {
		name = "MENU_RANDOM",
		value = Enum.demoHighlightReelTransitionFilter.DEMO_HIGHLIGHT_REEL_TRANSITION_FILTER_RANDOM
	} )
	local buttons = {
		{
			name = "PlayerFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_DESC",
			dvarName = "demo_highlightReelPlayerFilter",
			options = playerFilterOptions
		},
		{
			name = "StylesFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_DESC",
			dvarName = "demo_highlightReelStylesFilter",
			options = stylesFilterOptions
		},
		{
			name = "NumberOfSegmentsFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_NUMBER_OF_SEGMENTS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_NUMBER_OF_SEGMENTS_DESC",
			dvarName = "demo_highlightReelNumberOfSegments",
			options = numberOfSegmentsOptions
		},
		{
			name = "StarsFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_STARS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_STARS_DESC",
			dvarName = "demo_highlightReelMinimumStarsFilter",
			options = starsFilterOptions
		},
		{
			name = "TransitionFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_TRANSITION_SETTINGS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_TRANSITION_SETTINGS_DESC",
			dvarName = "demo_highlightReelTransitionFilter",
			options = transitionFilterOptions
		}
	}
	if f314_local0 == false then
		local gameResultFilterOptions = {}
		table.insert( gameResultFilterOptions, {
			name = "MENU_NO",
			value = Enum.demoHighlightReelGameResultFilter.DEMO_HIGHLIGHT_REEL_GAME_RESULT_FILTER_OFF
		} )
		table.insert( gameResultFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_FINAL",
			value = Enum.demoHighlightReelGameResultFilter.DEMO_HIGHLIGHT_REEL_GAME_RESULT_FILTER_FINAL_RESULT
		} )
		table.insert( gameResultFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_WITH_EVENTS",
			value = Enum.demoHighlightReelGameResultFilter.DEMO_HIGHLIGHT_REEL_GAME_RESULT_FILTER_WITH_EVENTS
		} )
		table.insert( gameResultFilterOptions, {
			name = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_ALL",
			value = Enum.demoHighlightReelGameResultFilter.DEMO_HIGHLIGHT_REEL_GAME_RESULT_FILTER_ALL_RESULTS
		} )
		table.insert( buttons, {
			name = "GameResultFilter",
			displayText = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_SETTINGS",
			hintText = "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_SETTINGS_DESC",
			dvarName = "demo_highlightReelGameResultFilter",
			options = gameResultFilterOptions
		} )
	end
	for index, buttonData in ipairs( buttons ) do
		table.insert( list, {
			models = {
				displayText = buttonData.displayText,
				hintText = buttonData.hintText,
				buttonOnly = false,
				disabled = false,
				optionsDatasource = CoD.OptionsUtility.CreateCustomOptionDataSource( controller, "DemoHighlightReelSettingsButtonList_" .. buttonData.name, buttonData.options, buttonData.dvarName, engineFunc, CoD.DemoUtility.Options_ItemSelected, CoD.DemoUtility.Options_RevertItemSelected ),
				currentSelection = CoD.DemoUtility.Options_GetProfileSelection( controller, buttonData.options, buttonData.dvarName ),
				selected = false
			},
			properties = {
				hideArrows = false,
				disabled = false
			}
		} )
	end
	return list
end )
DataSources.PrimaryOffhandGadget = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget0" )
	end
}
DataSources.SecondaryOffhandGadget = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget1" )
	end
}
DataSources.SpecialOffhandGadget = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget2" )
	end
}
DataSources.HeroWeapon = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget3" )
	end
}
DataSources.CurrentWeapon = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "currentWeapon" )
	end
}
DataSources.StowedWeapon = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "stowedWeapon" )
	end
}
DataSources.CurrentPrimaryOffhand = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "currentPrimaryOffhand" )
	end
}
DataSources.CurrentSecondaryOffhand = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "currentSecondaryOffhand" )
	end
}
DataSources.CurrentSpecialOffhand = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "currentSpecialOffhand" )
	end
}
DataSources.HUDItems = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		local model = Engine.CreateModel( perControllerModel, "hudItems" )
		return Engine.CreateModel( perControllerModel, "hudItems" )
	end
}
DataSources.InGameNotifications = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "inGameNotifications" )
	end
}
DataSources.KillstreakReward = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "killstreakRewards" )
	end
}
DataSources.PlayerCallout = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "playerCallout" )
	end
}
DataSources.PlayerObituary = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "playerObituary" )
	end
}
DataSources.PlayerAbilities = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "playerAbilities" )
	end
}
DataSources.FirstHeroGadgetOrWeapon = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		local abilitiesModel = Engine.CreateModel( perControllerModel, "playerAbilities" )
		local abilityId = CoD.SafeGetModelValue( abilitiesModel, "playerGadget2.id" )
		if abilityId ~= nil and abilityId ~= "" then
			return Engine.GetModel( abilitiesModel, "playerGadget2" )
		else
			return Engine.CreateModel( abilitiesModel, "playerGadget3" )
		end
	end
}
DataSources.Perks = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "perks" )
	end
}
DataSources.Specialties = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "specialties" )
	end
}
DataSources.CTF = {
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
}
DataSources.Ball = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "ballGametype" )
	end
}
DataSources.Escort = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "escortGametype" )
	end
}
DataSources.Factions = {
	prepared = false,
	preparedForController = {},
	factionSubscription = {},
	prepare = function ( controller, element, filter )
		if not DataSources.Factions.preparedForController then
			DataSources.Factions.preparedForController = {}
		end
		if not DataSources.Factions.factionSubscription[controller] then
			DataSources.Factions.factionSubscription[controller] = LUI.UIElement.new()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		local factionModel = Engine.CreateModel( perControllerModel, "factions" )
		local isCoDCasterModel = Engine.CreateModel( factionModel, "isCoDCaster" )
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
		DataSources.Factions.factionSubscription[controller]:unsubscribeFromAllModels()
		DataSources.Factions.factionSubscription[controller]:subscribeToModel( playerFactionTeamEnumModel, function ( model )
			local team = Engine.GetModelValue( model )
			if team then
				if CoD.IsShoutcaster( controller ) then
					team = Enum.team_t.TEAM_ALLIES
				end
				Engine.SetModelValue( playerFactionIconModel, CoD.TeamUtility.GetTeamFactionIcon( team ) )
				Engine.SetModelValue( playerFactionDisplayNameModel, CoD.TeamUtility.GetTeamNameCaps( team ) )
				Engine.SetModelValue( playerFactionColorModel, CoD.TeamUtility.GetTeamFactionColor( team ) )
				local friendlyColor = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "FriendlyBlue" )
				local playerFactionFlagColor = string.format( "%d %d %d", friendlyColor.r * 255, friendlyColor.g * 255, friendlyColor.b * 255 )
				if CoD.IsShoutcaster( controller ) then
					local color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
					if not CoDShared.IsGametypeTeamBased() then
						color = playerFactionFlagColor
					end
					CoD.ColorUtility.UpdateColorSet( "CodCasterFriendly", color )
					Engine.SetupCompassColors( controller )
					playerFactionFlagColor = color
				end
				Engine.SetModelValue( playerFactionFlagColorModel, playerFactionFlagColor )
			end
		end )
		DataSources.Factions.factionSubscription[controller]:subscribeToModel( enemyFactionTeamEnumModel, function ( model )
			local team = Engine.GetModelValue( model )
			if team then
				if CoD.IsShoutcaster( controller ) then
					team = Enum.team_t.TEAM_AXIS
				end
				Engine.SetModelValue( enemyFactionIconModel, CoD.TeamUtility.GetTeamFactionIcon( team ) )
				Engine.SetModelValue( enemyFactionDisplayNameModel, CoD.TeamUtility.GetTeamNameCaps( team ) )
				Engine.SetModelValue( enemyFactionColorModel, CoD.TeamUtility.GetTeamFactionColor( team ) )
				local enemyColor = CoD.ColorUtility.GetColorBlindColorForPlayer( controller, "EnemyOrange" )
				local enemyFactionFlagColor = string.format( "%d %d %d", enemyColor.r * 255, enemyColor.g * 255, enemyColor.b * 255 )
				if CoD.IsShoutcaster( controller ) then
					local color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
					if not CoDShared.IsGametypeTeamBased() then
						color = enemyFactionFlagColor
					end
					CoD.ColorUtility.UpdateColorSet( "CodCasterEnemy", color )
					Engine.SetupCompassColors( controller )
					enemyFactionFlagColor = color
				end
				Engine.SetModelValue( enemyFactionFlagColorModel, enemyFactionFlagColor )
			end
		end )
		local alliesInfo = {
			name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
			icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
			color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
		}
		local axisInfo = {
			name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
			icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
			color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
		}
		if CoD.IsShoutcaster( controller ) and CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
			axisInfo = {
				name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			alliesInfo = {
				name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
		end
		Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionDisplayName" ), axisInfo.name )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionIcon" ), axisInfo.icon )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionColor" ), axisInfo.color )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionDisplayName" ), alliesInfo.name )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionIcon" ), alliesInfo.icon )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionColor" ), alliesInfo.color )
		if CoD.IsShoutcaster( controller ) then
			CoD.ColorUtility.UpdateColorSet( "CodCasterFactionAllies", alliesInfo.color )
			CoD.ColorUtility.UpdateColorSet( "CodCasterFactionAxis", axisInfo.color )
			Engine.SetupCompassColors( controller )
		end
		local teamModel = Engine.GetModel( perControllerModel, "team" )
		if teamModel then
			DataSources.Factions.factionSubscription[controller]:subscribeToModel( teamModel, function ( model )
				DataSources.Factions.preparedForController[controller] = false
				DataSources.Factions.prepare( controller )
			end, false )
		end
		local profileSettingsModel = Engine.GetModel( perControllerModel, "CodCaster.profileSettingsUpdated" )
		if profileSettingsModel then
			DataSources.Factions.factionSubscription[controller]:subscribeToModel( profileSettingsModel, function ( model )
				DataSources.Factions.preparedForController[controller] = false
				DataSources.Factions.prepare( controller )
			end, false )
		end
		local colorBlindModel = Engine.GetModel( perControllerModel, "profile.colorblindMode" )
		if colorBlindModel then
			DataSources.Factions.factionSubscription[controller]:subscribeToModel( colorBlindModel, function ( model )
				DataSources.Factions.preparedForController[controller] = false
				DataSources.Factions.prepare( controller )
			end, false )
		end
		DataSources.Factions.preparedForController[controller] = true
	end,
	getModel = function ( controller )
		if not DataSources.Factions.preparedForController or not DataSources.Factions.preparedForController[controller] then
			DataSources.Factions.prepare( controller )
		end
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "factions" )
	end
}
DataSources.FactionsGlobal = {
	prepare = function ( controller, element, filter )
		local factionModel = Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
		local perControllerModel = Engine.GetModelForController( controller )
		if not DataSources.FactionsGlobal.factionSubscription then
			DataSources.FactionsGlobal.factionSubscription = LUI.UIElement.new()
		end
		DataSources.FactionsGlobal.factionSubscription:unsubscribeFromAllModels()
		local alliesInfo = {
			name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
			icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
			color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
		}
		local axisInfo = {
			name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
			icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
			color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
		}
		if CoD.IsShoutcaster( controller ) and CoD.ShoutcasterProfileVarBool( controller, "shoutcaster_flip_scorepanel" ) then
			axisInfo = {
				name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
				icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
				color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
			}
			alliesInfo = {
				name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
				icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
				color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
			}
		end
		Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionDisplayName" ), axisInfo.name )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionIcon" ), axisInfo.icon )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "axisFactionColor" ), axisInfo.color )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionDisplayName" ), alliesInfo.name )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionIcon" ), alliesInfo.icon )
		Engine.SetModelValue( Engine.CreateModel( factionModel, "alliesFactionColor" ), alliesInfo.color )
		local teamModel = Engine.GetModel( perControllerModel, "team" )
		if teamModel then
			DataSources.FactionsGlobal.factionSubscription:subscribeToModel( teamModel, function ( model )
				DataSources.FactionsGlobal.prepared = false
				DataSources.FactionsGlobal.prepare( controller )
			end, false )
		end
		local profileSettingsModel = Engine.GetModel( perControllerModel, "CodCaster.profileSettingsUpdated" )
		if profileSettingsModel then
			DataSources.FactionsGlobal.factionSubscription:subscribeToModel( profileSettingsModel, function ( model )
				DataSources.FactionsGlobal.prepared = false
				DataSources.FactionsGlobal.prepare( controller )
			end, false )
		end
		local colorBlindModel = Engine.GetModel( perControllerModel, "profile.colorblindMode" )
		if colorBlindModel then
			DataSources.FactionsGlobal.factionSubscription:subscribeToModel( colorBlindModel, function ( model )
				DataSources.FactionsGlobal.prepared = false
				DataSources.FactionsGlobal.prepare( controller )
			end, false )
		end
		DataSources.FactionsGlobal.prepared = true
	end,
	getModel = function ( controller )
		if not DataSources.FactionsGlobal.prepared then
			DataSources.FactionsGlobal.prepare( controller )
		end
		return Engine.CreateModel( Engine.GetGlobalModel(), "factions" )
	end
}
DataSources.FactionList = {
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
}
DataSources.NetStats = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetGlobalModel(), "netstats" )
	end
}
DataSources.Groups = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "groups" )
	end
}
DataSources.GroupsMainTabList = ListHelper_SetupDataSource( "GroupsMainTabModel", function ( controller )
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
end, true )
DataSources.GroupsEmblemTabList = ListHelper_SetupDataSource( "GroupsEmblemTabModel", function ( controller )
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
			tabName = Engine.Localize( "GROUPS_GROUP_EMBLEMS_CAPS" ),
			tabWidget = "CoD.GroupEmblemsTab"
		},
		properties = {
			tabId = "groupemblems"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = Engine.Localize( "GROUPS_MY_EMBLEMS_CAPS" ),
			tabWidget = "CoD.GroupMyEmblemsTab"
		},
		properties = {
			tabId = "groupmyemblems"
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
end, true )
DataSources.GroupsInvitesList = {
	prepare = function ( controller, list, filter )
		local groupInvites = Engine.GetGroupInvitesList( controller )
		local groupsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "groups" )
		local groupInvitesRefreshEventUpdateModel = Engine.CreateModel( groupsModel, "eventUpdate" )
		local groupInvitesListModel = Engine.CreateModel( groupsModel, "invites" )
		list.inviteModels = {}
		if list.refreshSubscription then
			list:removeSubscription( list.refreshSubscription )
		end
		list.refreshSubscription = list:subscribeToModel( groupInvitesRefreshEventUpdateModel, function ()
			local eventName = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "groups.eventName" ) )
			if eventName == "refreshInvites" then
				list:updateDataSource()
			end
		end, false )
		for index, groupInviteData in ipairs( groupInvites ) do
			local inviteModel = Engine.CreateModel( groupInvitesListModel, "invite_" .. index )
			table.insert( list.inviteModels, inviteModel )
			for key, value in pairs( groupInviteData ) do
				Engine.SetModelValue( Engine.CreateModel( inviteModel, key ), value )
			end
		end
	end,
	getCount = function ( list )
		return #list.inviteModels
	end,
	getItem = function ( controller, list, index )
		return list.inviteModels[index]
	end
}
DataSources.GroupsMemberDetailsButtons = ListHelper_SetupDataSource( "GroupsMemberDetailsButtons", function ( controller )
	local buttonOptions = {}
	local controllerModel = Engine.GetModelForController( controller )
	local selectedXuid = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" ) )
	local selectedGamertag = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" ) )
	local controllerXuid = Engine.GetXUID64( controller )
	local f361_local0 = selectedXuid == controllerXuid
	local selectedPlayerInTitle = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendInTitle" ) )
	if selectedXuid == nil then
		return buttonOptions
	end
	local isAdmin = false
	local playerInfo = Engine.GetPlayerInfo( controller, selectedXuid )
	if f361_local0 ~= false then
		
	else
		
	end
	local inPrivateLobby = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, selectedXuid )
	local inGameLobby = Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, selectedXuid )
	local isMuted = Engine.IsPlayerMuted( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, selectedXuid )
	table.insert( buttonOptions, {
		text = "GROUPS_COMBAT_RECORD_CAPS",
		id = "combatRecord",
		disabled = false,
		action = PromoteToLeader,
		params = {
			controller = controller,
			xuid = selectedXuid
		},
		lastInGroup = false
	} )
	table.insert( buttonOptions, {
		text = "GROUPS_VIEW_PROFILE_CAPS",
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
	if not Engine.IsFriendFromXUID( controller, selectedXuid ) then
		table.insert( buttonOptions, {
			text = "GROUPS_SEND_FRIEND_REQUEST_CAPS",
			id = "sendFriendRequest",
			disabled = false,
			action = OpenPlatformProfile,
			params = {
				controller = controller,
				gamertag = selectedGamertag,
				xuid = selectedXuid
			},
			lastInGroup = true
		} )
	end
	table.insert( buttonOptions, {
		text = "GROUPS_REPORT_PLAYER_CAPS",
		id = "reportPlayer",
		disabled = false,
		action = nil,
		params = nil,
		lastInGroup = false
	} )
	if inPrivateLobby or inGameLobby then
		if isMuted then
			table.insert( buttonOptions, {
				text = "GROUPS_UNMUTE_PLAYER_CAPS",
				id = "unmutePlayer",
				disabled = false,
				action = UnMutePlayer,
				params = {
					controller = controller,
					xuid = selectedXuid
				},
				lastInGroup = true
			} )
		else
			table.insert( buttonOptions, {
				text = "GROUPS_MUTE_PLAYER_CAPS",
				id = "mutePlayer",
				disabled = false,
				action = MutePlayer,
				params = {
					controller = controller,
					xuid = selectedXuid
				},
				lastInGroup = true
			} )
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
end, nil, nil, function ( controller, list, listModel )
	
end, function ( list, row, widgetHeight )
	if list.GroupsMemberDetailsButtons[row].properties.isLastButtonInGroup then
		return 9
	else
		
	end
end )
DataSources.GroupsShowcaseButtons = ListHelper_SetupDataSource( "GroupsShowcaseButtons", function ( controller )
	local buttonOptions = {}
	table.insert( buttonOptions, {
		text = "GROUPS_FAVORITES",
		displayImage = "t7_mp_icon_group_action_favorite",
		hintText = "MENU_GROUPS_SHOWCASE_FAVORITE_DESC",
		id = "favorites",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = controller
		},
		lastInGroup = false
	} )
	table.insert( buttonOptions, {
		text = "GROUPS_RECENT",
		displayImage = "uie_t7_icon_menu_simple_media_recent",
		hintText = "MENU_GROUPS_SHOWCASE_RECENT_DESC",
		id = "recent",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = controller
		},
		lastInGroup = true
	} )
	table.insert( buttonOptions, {
		text = "GROUPS_PAINT_JOBS",
		displayImage = "uie_t7_mp_icon_header_paintshop",
		hintText = "MENU_GROUPS_SHOWCASE_PAINTJOBS_DESC",
		id = "paintjob",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = controller
		},
		lastInGroup = false
	} )
	table.insert( buttonOptions, {
		text = "GROUPS_VARIANTS",
		displayImage = "uie_t7_mp_icon_header_gunsmith",
		hintText = "MENU_GROUPS_SHOWCASE_VARIANTS_DESC",
		id = "variant",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = controller
		},
		lastInGroup = false
	} )
	table.insert( buttonOptions, {
		text = "GROUPS_EMBLEMS",
		displayImage = "uie_t7_mp_icon_header_emblem",
		hintText = "MENU_GROUPS_SHOWCASE_EMBLEMS_DESC",
		id = "emblem",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = controller
		},
		lastInGroup = false
	} )
	table.insert( buttonOptions, {
		text = "GROUPS_SCREENSHOTS",
		displayImage = "uie_t7_mp_icon_header_screenshot",
		hintText = "MENU_GROUPS_SHOWCASE_SCREENSHOTS_DESC",
		id = "screenshot",
		tabWidget = "CoD.FileshareScreenshotsContentList",
		disabled = false,
		action = nil,
		params = {
			controller = controller
		},
		lastInGroup = false
	} )
	table.insert( buttonOptions, {
		text = "GROUPS_CLIPS",
		displayImage = "t7_icon_menu_simple_clips",
		hintText = "MENU_GROUPS_SHOWCASE_CLIPS_DESC",
		id = "clip",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = controller
		},
		lastInGroup = false
	} )
	table.insert( buttonOptions, {
		text = "GROUPS_CUSTOM_GAMES",
		displayImage = "uie_t7_mp_icon_header_customgames",
		hintText = "MENU_GROUPS_SHOWCASE_CUSTOMGAMES_DESC",
		id = "customgame",
		tabWidget = "CoD.FileshareCategoryContentList",
		disabled = false,
		action = nil,
		params = {
			controller = controller
		},
		lastInGroup = true
	} )
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.text ),
				displayImage = buttonData.displayImage,
				hintText = buttonData.hintText,
				customId = buttonData.customId,
				category = buttonData.id,
				tabWidget = buttonData.tabWidget
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
end, nil, nil, function ( controller, list, listModel )
	
end, function ( list, row, widgetHeight )
	if list.GroupsShowcaseButtons[row].properties.isLastButtonInGroup then
		return 9
	else
		
	end
end )
DataSources.GroupsInviteButtonList = {
	prepare = function ( controller, list, filter )
		list.buttons = {}
		local buttons = {}
		list.groups = Engine.GetGroupList( controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" ) ) )
		for i = 1, #list.groups, 1 do
			local group = list.groups[i]
			table.insert( buttons, {
				displayText = group.name,
				action = InviteToGroup,
				btnType = "group",
				disabled = true,
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
			local selectedXuidModel = Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" )
			local f367_local5 = false
			if selectedXuidModel then
				local selectedXuid = Engine.GetModelValue( selectedXuidModel )
				f367_local5 = Engine.HasGroupInviteBeenSent( controller, buttonData.groupId, selectedXuid )
			end
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "inviteSent" ), f367_local5 )
			buttonData.inviteSent = f367_local5
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberCount" ), buttonData.memberCount )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "onlineCount" ), buttonData.onlineCount )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "inTitleCount" ), buttonData.inTitleCount )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbIndex" ), buttonData.lbIndex )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbSortColumn" ), buttonData.lbSortColumn )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbTimeFrame" ), buttonData.lbTimeFrame )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbHardcore" ), buttonData.lbHardcore )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbInitialized" ), buttonData.lbInitialized )
		end
		list:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.eventUpdate" ), function ()
			local eventName = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "groups.eventName" ) )
			if eventName == "refreshOutgoingInvites" then
				list:updateDataSource()
			end
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
}
DataSources.GroupsMainButtonList = {
	prepare = function ( controller, list, filter )
		list.buttons = {}
		local buttons = {}
		list.groups = Engine.GetGroupList( controller, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SELF )
		for i = 1, #list.groups, 1 do
			local group = list.groups[i]
			table.insert( buttons, {
				displayText = group.name,
				btnType = "group",
				groupId = group.groupId,
				groupBufferType = group.bufferType,
				name = group.name,
				clanTag = group.clanTag,
				description = group.description,
				message = group.message,
				privacy = group.privacy,
				creationTimestamp = group.creationTimestamp,
				joinApprovalType = group.joinApprovalType,
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
			local f372_local5 = OpenGroupHeadquarters
			if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.frameType" ) ) == "main" then
				f372_local5 = SetGroupSocialMenuFrameToMembers
			end
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), f372_local5 )
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
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "joinApprovalType" ), buttonData.joinApprovalType )
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
}
DataSources.FindGroupsCategoryList = ListHelper_SetupDataSource( "FindGroupsCategoryList", function ( controller )
	local buttonList = {}
	table.insert( buttonList, {
		models = {
			image = "t7_mp_icon_groups_friends",
			displayText = "GROUPS_FRIENDS_GROUPS"
		},
		properties = {
			category = "friends"
		}
	} )
	table.insert( buttonList, {
		models = {
			image = "t7_mp_icon_groups_popular",
			displayText = "GROUPS_POPULAR_GROUPS"
		},
		properties = {
			category = "popular"
		}
	} )
	return buttonList
end, true )
DataSources.FindGroupsButtonList = {
	prepare = function ( controller, list, filter )
		list.buttons = {}
		local buttons = {}
		local findGroupsCategoryModel = Engine.CreateModel( Engine.GetModelForController( controller ), "groups.findGroupsCategory" )
		local findGroupsCategory = Engine.GetModelValue( findGroupsCategoryModel )
		local groupsBufferType = Enum.GroupBufferType.GROUP_BUFFER_TYPE_FRIENDS
		if findGroupsCategory == "popular" then
			groupsBufferType = Enum.GroupBufferType.GROUP_BUFFER_TYPE_POPULAR
		end
		local foundGroups = Engine.GetGroupList( controller, groupsBufferType )
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
		for index, f378_local3 in ipairs( buttons ) do
			local buttonModel = Engine.CreateModel( groupMainButtonListModel, "buttonModel_" .. index )
			table.insert( list.buttons, {
				model = buttonModel,
				type = f378_local3.btnType,
				groupId = f378_local3.groupId,
				groupBufferType = f378_local3.groupBufferType
			} )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "displayText" ), Engine.Localize( f378_local3.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "action" ), f378_local3.action )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "type" ), f378_local3.btnType )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "groupId" ), f378_local3.groupId )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "groupBufferType" ), f378_local3.groupBufferType )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "name" ), f378_local3.name )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "clanTag" ), f378_local3.clanTag )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "description" ), f378_local3.description )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "message" ), f378_local3.message )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "privacy" ), f378_local3.privacy )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "creationTimestamp" ), f378_local3.creationTimestamp )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "owner" ), f378_local3.owner )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "ownerXuid" ), f378_local3.ownerXuid )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberStatus" ), f378_local3.memberStatus )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberStatusText" ), f378_local3.memberStatusText )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "memberCount" ), f378_local3.memberCount )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "onlineCount" ), f378_local3.onlineCount )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "inTitleCount" ), f378_local3.inTitleCount )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbIndex" ), f378_local3.lbIndex )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbSortColumn" ), f378_local3.lbSortColumn )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbTimeFrame" ), f378_local3.lbTimeFrame )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbHardcore" ), f378_local3.lbHardcore )
			Engine.SetModelValue( Engine.CreateModel( buttonModel, "lbInitialized" ), f378_local3.lbInitialized )
		end
		list:subscribeToModel( findGroupsCategoryModel, function ()
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
}
DataSources.GroupsHeadquartersTabList = ListHelper_SetupDataSource( "GroupsHeadquartersTabModel", function ( controller )
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
			tabName = Engine.Localize( "GROUPS_SHOWCASE_CAPS" ),
			tabWidget = "CoD.ShowcaseTab"
		},
		properties = {
			tabId = "showcase"
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
end, true )
DataSources.GroupHeadquartersOverviewButtonList = ListHelper_SetupDataSource( "GroupHeadquartersOverviewButtonListModel", function ( controller )
	local options = {}
	local isAMember = IsGroupMember( nil, controller )
	local isOwner = IsGroupOwner( nil, controller )
	local GoBackAndProcessLeaveSelectedGroup = function ( self, element, controller )
		local menu = GoBack( self, controller )
		ProcessLeaveSelectedGroup( menu, element, controller )
	end
	
	if isAMember then
		table.insert( options, {
			models = {
				displayText = Engine.Localize( "GROUPS_SET_AS_PRIMARY_GROUP_CAPS" ),
				icon = "t7_mp_icon_groups_primary",
				action = CoD.NullFunction,
				hintText = Engine.Localize( "GROUPS_SET_AS_PRIMARY_GROUP_DESC" )
			}
		} )
		table.insert( options, {
			models = {
				displayText = Engine.Localize( "GROUPS_LEAVE_GROUP_CAPS" ),
				icon = "t7_mp_icon_groups_remove",
				action = GoBackAndProcessLeaveSelectedGroup,
				hintText = Engine.Localize( "GROUPS_LEAVE_GROUP_DESC" )
			}
		} )
	end
	if not isOwner then
		table.insert( options, {
			models = {
				displayText = Engine.Localize( "GROUPS_REPORT_GROUP_CAPS" ),
				icon = "t7_mp_icon_groups_ban",
				action = CoD.NullFunction,
				hintText = Engine.Localize( "GROUPS_REPORT_GROUP_DESC" )
			}
		} )
	end
	return options
end )
DataSources.GroupHeadquartersAdminOptionsList = ListHelper_SetupDataSource( "GroupHeadquartersAdminOptionsListModel", function ( controller )
	local options = {}
	local controllerModel = Engine.GetModelForController( controller )
	local selectedXuid = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" ) )
	local selectedGamertag = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" ) )
	local controllerXuid = Engine.GetXUID64( controller )
	local f386_local0 = selectedXuid == controllerXuid
	local selectedPlayerInTitle = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendInTitle" ) )
	if selectedXuid == nil then
		return options
	end
	local isAMember = IsGroupMember( nil, controller )
	local isOwner = IsGroupOwner( nil, controller )
	if not isAdmin then
		
	else
		
	end
	table.insert( options, {
		models = {
			displayText = "GROUPS_REMOVE_FROM_GROUP_CAPS",
			icon = "t7_mp_icon_groups_remove",
			hintText = Engine.Localize( "GROUPS_REMOVE_FROM_GROUP_DESC" )
		},
		properties = {
			action = RemoveFromGroup,
			params = {
				controller = controller,
				gamertag = selectedGamertag,
				xuid = selectedXuid
			}
		}
	} )
	table.insert( options, {
		models = {
			displayText = "GROUPS_BAN_FROM_GROUP_CAPS",
			icon = "t7_mp_icon_groups_ban",
			hintText = Engine.Localize( "GROUPS_BAN_FROM_GROUP_DESC" )
		},
		properties = {
			action = BanFromGroup,
			params = {
				controller = controller,
				gamertag = selectedGamertag,
				xuid = selectedXuid
			}
		}
	} )
	return options
end )
DataSources.GroupHeadquartersAdminButtonList = ListHelper_SetupDataSource( "GroupHeadquartersAdminButtonListModel", function ( controller )
	local tabList = {}
	table.insert( tabList, {
		models = {
			displayText = Engine.Localize( "GROUPS_JOIN_REQUESTS" ),
			action = CoD.NullFunction,
			frameWidget = "CoD.AdminTabGroupApplicationsFrame"
		}
	} )
	table.insert( tabList, {
		models = {
			displayText = Engine.Localize( "GROUPS_EDIT_GROUP_OVERVIEW" ),
			action = CoD.NullFunction,
			frameWidget = "CoD.AdminTabGroupOverviewFrame"
		}
	} )
	table.insert( tabList, {
		models = {
			displayText = Engine.Localize( "GROUPS_CHANGE_GROUP_TYPE" ),
			action = CoD.NullFunction,
			frameWidget = "CoD.AdminTabGroupPrivacyFrame"
		}
	} )
	table.insert( tabList, {
		models = {
			displayText = Engine.Localize( "GROUPS_EDIT_GROUP_NAME" ),
			action = EditSelectedGroupName,
			frameWidget = "CoD.AdminTabGroupNameFrame"
		}
	} )
	table.insert( tabList, {
		models = {
			displayText = Engine.Localize( "GROUPS_DELETE_GROUP" ),
			action = ProcessLeaveSelectedGroup,
			frameWidget = "CoD.AdminTabGroupDeleteFrame"
		}
	} )
	return tabList
end )
DataSources.SelectedGroup = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		return CoD.perController[controller].selectedGroup
	end
}
DataSources.CreateGroup = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
		return Engine.CreateModel( groupsModel, "createGroup" )
	end
}
DataSources.GroupPrivacyModes = ListHelper_SetupDataSource( "GroupPrivacyModes", function ( controller )
	local options = {
		{
			name = "GROUPS_PRIVACY_PUBLIC",
			value = Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC
		},
		{
			name = "GROUPS_PRIVACY_PRIVATE",
			value = Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE
		}
	}
	local dataTable = {}
	local currentPrivacy = Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC
	if CoD.perController[controller].selectedGroup and Engine.GetModel( CoD.perController[controller].selectedGroup, "privacy" ) then
		currentPrivacy = Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "privacy" ) )
	end
	for index, optionTable in ipairs( options ) do
		table.insert( dataTable, {
			models = {
				text = options[index].name,
				value = options[index].value
			},
			properties = {
				title = options[index].name,
				value = options[index].value,
				selectIndex = currentPrivacy == options[index].value
			}
		} )
	end
	dataTable[1].properties.first = true
	dataTable[#options].properties.last = true
	return dataTable
end, nil, nil, nil )
DataSources.GroupJoinApprovalTypes = ListHelper_SetupDataSource( "GroupJoinApprovalTypes", function ( controller )
	local options = {
		{
			name = "GROUPS_JOIN_APPROVAL_OFF",
			value = Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF
		},
		{
			name = "GROUPS_JOIN_APPROVAL_ON",
			value = Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_ON
		}
	}
	local dataTable = {}
	for index, optionTable in ipairs( options ) do
		table.insert( dataTable, {
			models = {
				text = options[index].name,
				value = options[index].value,
				selectIndex = 1
			},
			properties = {
				title = options[index].name,
				value = options[index].value,
				selectIndex = 1
			}
		} )
	end
	dataTable[1].properties.first = true
	dataTable[#options].properties.last = true
	return dataTable
end, nil, nil, nil )
DataSources.LeaderboardMakerButtonList = {
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
		for index, f392_local5 in ipairs( buttons ) do
			local buttonModelData = f392_local5.model
			local buttonProperties = f392_local5.properties
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
}
DataSources.Leaderboard = {
	getModel = function ( controller )
		local leaderboardModel = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
		Engine.CreateModel( leaderboardModel, "controller" )
		Engine.CreateModel( leaderboardModel, "error" )
		Engine.CreateModel( leaderboardModel, "isUpdating" )
		Engine.CreateModel( leaderboardModel, "numResults" )
		Engine.CreateModel( leaderboardModel, "totalResults" )
		return leaderboardModel
	end
}
DataSources.LeaderboardHeader = {
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
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "position" ), "" )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "rank" ), "" )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "name" ), "" )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column0" ), "" )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column1" ), "" )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column2" ), "" )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column3" ), "" )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "column4" ), "" )
			Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "numDataColumns" ), 0 )
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
		Engine.SetModelValue( Engine.CreateModel( leaderboardHeaderModel, "numDataColumns" ), numDataCols )
		return leaderboardHeaderModel
	end
}
DataSources.LeaderboardRows = LuaUtils.OverrideTable( DataSources.LeaderboardRows, {
	getArguments = function ( controller, list, index )
		local isLobbyLeaderboard = IsLobbyLeaderboard( controller )
		if not CoD.perController[controller].leaderboardPlayerFilter then
			local filter = Enum.LbFilter.LB_FILTER_FRIENDS
		end
		local extraOffset = 0
		if isLobbyLeaderboard then
			local f399_local0 = Enum.LbFilter.LB_FILTER_LOBBY_MEMBERS
		end
		local results = {
			filter = f399_local0,
			offset = index
		}
		if f399_local0 ~= list.lastFilter then
			list.lastFilter = f399_local0
		else
			results.offset = index
		end
		return results, extraOffset
	end,
	prefetchOffset = 10,
	setupItem = function ( model, datarow, controller, list, index )
		local gameMode = CoD.GetCombatRecordMode()
		local sortColumnColor = string.format( "%d %d %d", ColorSet.Orange.r * 255, ColorSet.Orange.g * 255, ColorSet.Orange.b * 255 )
		local defaultOtherColumnColor = string.format( "%d %d %d", ColorSet.White.r * 255, ColorSet.White.g * 255, ColorSet.White.b * 255 )
		local selfOtherColumnColor = string.format( "%d %d %d", ColorSet.PlayerYellow.r * 255, ColorSet.PlayerYellow.g * 255, ColorSet.PlayerYellow.b * 255 )
		local selfXuid = Engine.GetXUID64( controller )
		local headers = Engine.GetLeaderboardHeaders( controller )
		local numDefaultCols = 4
		local maxDataCols = 5
		local maxStatValues = 3
		local pivotPosition = CoD.perController[controller].pivotPosition
		local otherColumnColor = defaultOtherColumnColor
		local rankColor = defaultOtherColumnColor
		if selfXuid == datarow.xuid then
			otherColumnColor = selfOtherColumnColor
			rankColor = selfOtherColumnColor
		end
		local rowData = {
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
		if datarow.columns then
			for i = #datarow.columns, 1, -1 do
				if datarow.columns[i].rankCol then
					rowData.position = datarow.columns[i].col
					rowData.positionUI = rowData.position
				end
				if datarow.columns[i].gamertagCol then
					rowData.gamertag = datarow.columns[i].col
				end
				if datarow.columns[i].type == LuaEnum.LBCOL_TYPE.LBCOL_TYPE_PRESTIGE then
					local prestigeMerge = tonumber( datarow.columns[i].col )
					rowData.plevel, rowData.paragonRank, rowData.paragonIconId = LuaUtils.ConvertFromPrestigeMerged( prestigeMerge )
				end
				if datarow.columns[i].type == LuaEnum.LBCOL_TYPE.LBCOL_TYPE_LEVELXP and not IsFreerunLeaderboard( controller ) then
					rowData.rank = tonumber( datarow.columns[i].col )
				end
				if i == 3 and IsFreerunLeaderboard( controller ) then
					datarow.columns[i].col = NumberAsTime( datarow.columns[i].col )
				end
				table.insert( rowData.colData, datarow.columns[i].col )
				table.insert( rowData.colColor, otherColumnColor )
			end
		end
		rowData.rankString = CoD.GetRankName( rowData.rank - 1, rowData.plevel, gameMode )
		rowData.rankIcon = CoD.GetRankOrParagonIcon( rowData.rank - 1, rowData.plevel, rowData.paragonIconId, gameMode )
		if IsGameModeParagonCapable( gameMode ) and rowData.plevel == Engine.GetPrestigeCap( gameMode ) then
			rowData.rank = tonumber( Engine.GetParagonRankDisplayLevel( rowData.paragonRank, gameMode ) )
			rankColor = string.format( "%d %d %d", ColorSet.ParagonRank.r * 255, ColorSet.ParagonRank.g * 255, ColorSet.ParagonRank.b * 255 )
		end
		local usedDataCols = #rowData.colData
		local colsToFill = maxDataCols - usedDataCols
		rowData.colColor[usedDataCols] = sortColumnColor
		if headers then
			for statIndex = 0, maxStatValues - 1, 1 do
				local columnIndex = usedDataCols - statIndex
				local headerIndex = statIndex + 3
				if headers.lbcolumnids[headerIndex] == 65534 and (headers.lbcolumnnames[headerIndex] == "Score Per Minute" or headers.lbcolumnnames[headerIndex] == "Points Per Game") and rowData.colData[columnIndex] == "-1" then
					rowData.positionUI = "-"
					rowData.colData[columnIndex] = "-"
				end
				table.insert( rowData.statData, rowData.colData[columnIndex] )
				table.insert( rowData.statColor, rowData.colColor[columnIndex] )
				table.insert( rowData.statLabel, headers.lbheaders[headerIndex] )
			end
		end
		for i = 1, colsToFill, 1 do
			local f400_local4 = i
			table.insert( rowData.colData, "" )
			table.insert( rowData.colColor, otherColumnColor )
		end
		if HasSelectedGroup( nil, nil, {
			controller = controller
		} ) then
			position = i
		end
		local isSelectedIndex = false
		if pivotPosition then
			isSelectedIndex = tonumber( rowData.position ) == pivotPosition
		else
			isSelectedIndex = selfXuid == datarow.xuid
		end
		local counterPosition = index
		if CoD.perController[controller].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
			counterPosition = tonumber( rowData.position )
		end
		return {
			models = {
				position = tonumber( rowData.position ),
				positionUI = tonumber( rowData.positionUI ),
				name = rowData.gamertag,
				rank = rowData.rank,
				rankColor = rankColor,
				rankIcon = rowData.rankIcon,
				rankString = rowData.rankString,
				plevel = rowData.plevel,
				column0 = rowData.colData[5],
				column0color = rowData.colColor[5],
				column1 = rowData.colData[4],
				column1color = rowData.colColor[4],
				column2 = rowData.colData[3],
				column2color = rowData.colColor[3],
				column3 = rowData.colData[2],
				column3color = rowData.colColor[2],
				column4 = rowData.colData[1],
				column4color = rowData.colColor[1],
				stat0 = rowData.statData[1],
				stat0color = rowData.statColor[1],
				stat0label = rowData.statLabel[1],
				stat1 = rowData.statData[2],
				stat1color = rowData.statColor[2],
				stat1label = rowData.statLabel[2],
				stat2 = rowData.statData[3],
				stat2color = rowData.statColor[3],
				stat2label = rowData.statLabel[3],
				rowColor = otherColumnColor,
				xuid = datarow.xuid,
				backgroundId = 0,
				counterPosition = counterPosition
			},
			properties = {
				selectIndex = isSelectedIndex
			}
		}
	end
} )
DataSources.LeaderboardTabType = ListHelper_SetupDataSource( "LeaderboardTabType", function ( controller )
	local tabList = {}
	local gameModeModel = Engine.GetModel( Engine.GetGlobalModel(), "combatRecordMode" )
	if not gameModeModel then
		return tabList
	end
	local gameMode = Engine.GetModelValue( gameModeModel )
	if gameMode ~= "doa" then
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
	end
	if gameMode == "cp" then
		table.insert( tabList, {
			models = {
				tabName = "MENU_LB_TAB_TRAINING_SIM_CAPS",
				tabIcon = "",
				tabCategory = "trainingSim"
			},
			properties = {
				tabId = "leaderboard_cp_trainingSim"
			}
		} )
	elseif gameMode == "mp" then
		table.insert( tabList, {
			models = {
				tabName = "MENU_LB_TAB_CORE_CAPS",
				tabIcon = "",
				tabCategory = "core"
			},
			properties = {
				tabId = "leaderboard_mp_core"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = "MENU_LB_TAB_HARDCORE_CAPS",
				tabIcon = "",
				tabCategory = "hardcore"
			},
			properties = {
				tabId = "leaderboard_mp_hardcore"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = "MENU_LB_TAB_ARENA_CAPS",
				tabIcon = "",
				tabCategory = "arena"
			},
			properties = {
				tabId = "leaderboard_mp_arena"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = "MENU_LB_TAB_FREERUN_CAPS",
				tabIcon = "",
				tabCategory = "freerun"
			},
			properties = {
				tabId = "leaderboard_mp_freerun"
			}
		} )
	elseif gameMode == "zm" then
		table.insert( tabList, {
			models = {
				tabName = "MENU_LB_TAB_ZMGLOBAL_CAPS",
				tabIcon = "",
				tabCategory = "zm_global"
			},
			properties = {
				tabId = "leaderboard_zm_global"
			}
		} )
		table.insert( tabList, {
			models = {
				tabName = "MENU_LB_TAB_ZMMAPS_CAPS",
				tabIcon = "",
				tabCategory = "zm_maps"
			},
			properties = {
				tabId = "leaderboard_zm_maps"
			}
		} )
	elseif gameMode == "doa" then
		table.insert( tabList, {
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
	if gameMode ~= "doa" then
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderr
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
	end
	return tabList
end )
DataSources.LeaderboardMenuTitle = {
	getModel = function ( controller )
		local menuTitleModel = Engine.CreateModel( Engine.GetModelForController( controller ), "leaderboardMenuTitle" )
		local titleModel = Engine.CreateModel( menuTitleModel, "title" )
		if IsLobbyLeaderboard( controller ) then
			local leaderboardDef = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )
			local headerText = CoD.LeaderboardUtility.leaderboardInfo[leaderboardDef].title
			Engine.SetModelValue( titleModel, Engine.Localize( headerText ) )
			return menuTitleModel
		else
			local categoryNameModel = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardCategoryName" )
			if not categoryNameModel then
				return menuTitleModel
			else
				local categoryName = Engine.GetModelValue( categoryNameModel )
				if not categoryName then
					return menuTitleModel
				else
					local headerText = CoD.LeaderboardUtility.leaderboardTab[categoryName].leaderboardHeaderText
					Engine.SetModelValue( titleModel, Engine.Localize( "MENU_LEADERBOARD_MENU_HEADER_CAPS", Engine.Localize( headerText ) ) )
					return menuTitleModel
				end
			end
		end
	end
}
DataSources.TeamOperationSystem = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "teamOperationSystem" )
	end
}
DataSources.Friends = {
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
}
DataSources.LobbyFriends = {
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
}
DataSources.GameScore = {
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
			if not IsTeamBasedGame( controller ) then
				Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "firstPlaceXUID" ), scoreboardInfo.topScore.topScoreXUID )
				Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "highestScore" ), scoreboardInfo.topScore.highestScore )
				Engine.SetModelValue( Engine.CreateModel( gameScoreModel, "highestScoreName" ), scoreboardInfo.topScore.highestScoreName )
			end
		end
		return gameScoreModel
	end
}
DataSources.Equipment = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local perControllerModel = Engine.GetModelForController( controller )
		return Engine.CreateModel( perControllerModel, "Equipment" )
	end
}
DataSources.ClientscriptDebugMenu = {
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
}
DataSources.CPMissionOverviewFrontend = {
	getModel = function ( controller )
		DataSources.CPMapsList.prepare( controller, {} )
		local numMaps = 0
		local currMode = Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
		if Engine.IsCampaignModeZombies() then
			currMode = Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES
		end
		local sortMaps = function ( a, b )
			return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
		end
		
		for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
			if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.campaign_mode == currMode and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
				numMaps = numMaps + 1
			end
		end
		local currentMission = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapNext" ) )
		if Engine.IsCampaignModeZombies() and string.find( currentMission, "_nightmares" ) == nil then
			currentMission = currentMission .. "_nightmares"
		end
		for mapIndex = 1, numMaps, 1 do
			local mapModel = Engine.GetModel( Engine.GetModelForController( controller ), "CPMapsList." .. mapIndex )
			local rootMapNameModel = Engine.GetModel( mapModel, "rootMapName" )
			if rootMapNameModel and Engine.GetModelValue( rootMapNameModel ) == currentMission then
				return mapModel
			end
		end
	end
}
DataSources.CPMapsList = ListHelper_SetupDataSource( "CPMapsList", function ( controller )
	DataSources.CPMapsList.spacers = {}
	local mapsList = {}
	local mapOrderIndex = 0
	local f418_local0 = Engine.IsCampaignModeZombies()
	if f418_local0 then
		f418_local0 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) ~= true
	end
	local isFirstIncompleteMap = true
	local sortMaps = function ( a, b )
		if CoD.MapUtility.MapsTable[a].episodeNumber ~= CoD.MapUtility.MapsTable[b].episodeNumber then
			if CoD.MapUtility.MapsTable[a].episodeNumber >= 0 and CoD.MapUtility.MapsTable[b].episodeNumber >= 0 then
				return CoD.MapUtility.MapsTable[a].episodeNumber < CoD.MapUtility.MapsTable[b].episodeNumber
			elseif CoD.MapUtility.MapsTable[a].episodeNumber < 0 and CoD.MapUtility.MapsTable[b].episodeNumber < 0 then
				return CoD.MapUtility.MapsTable[b].episodeNumber < CoD.MapUtility.MapsTable[a].episodeNumber
			elseif CoD.MapUtility.MapsTable[a].episodeNumber < 0 then
				return false
			elseif CoD.MapUtility.MapsTable[b].episodeNumber < 0 then
				return true
			end
		end
		return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
	end
	
	local categoryList = {
		[-1] = "CPUI_CUSTOM_GAME_OPTIONS",
		[-2] = "CPUI_MODULES"
	}
	local currentEpisode = nil
	for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
		local f418_local4
		if mapData.campaign_mode ~= Enum.CampaignMode.CAMPAIGNMODE_DEFAULT or f418_local0 then
			if mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
				f418_local4 = f418_local0
			else
				f418_local4 = false
			end
		else
			local mapValid = true
		end
		if id == "cp_doa_bo3" then
			if Dvar.ui_doa_unlocked:get() and IsLive() then
				mapData.isSubLevel = false
			else
				mapData.isSubLevel = true
			end
		end
		if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and f418_local4 and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
			local collectedCollectibleCount, collectibleCount = GetCollectiblesXOfY( controller, id )
			local completedAccoladeCount, accoladeCount = GetAccoladesXOfY( controller, id )
			local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
			local f418_local5 = CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true
			if f418_local5 then
				currentStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
			end
			local allMapsUnlocked = 1
			local f418_local6 = currentStats.PlayerStatsByMap[id]
			if f418_local6 then
				f418_local6 = currentStats.PlayerStatsByMap[id].hasBeenCompleted:get() == 1
			end
			local classified = false
			mapOrderIndex = mapOrderIndex + 1
			local completedDifficultyAlpha = 0
			local completedDifficultyIcon = CoD.CPUtility.DIFFICULTY_ICON[0]
			local completedDifficultyText = CoD.CPUtility.DIFFICULTY[0]
			if allMapsUnlocked ~= 1 and not f418_local6 then
				isFirstIncompleteMap = isFirstIncompleteMap
			end
			local highestScore = 0
			if currentStats.PlayerStatsByMap[id] and not classified then
				local completedDifficulty = nil
				for difficultyIndex = 0, 4, 1 do
					if currentStats.PlayerStatsByMap[id].completedDifficulties[difficultyIndex]:get() == 1 then
						completedDifficulty = difficultyIndex
					end
				end
				if f418_local6 and completedDifficulty and completedDifficulty >= 0 then
					completedDifficultyAlpha = 1
					completedDifficultyIcon = CoD.CPUtility.DIFFICULTY_ICON[completedDifficulty]
					completedDifficultyText = CoD.CPUtility.DIFFICULTY[completedDifficulty]
				end
				highestScore = currentStats.PlayerStatsByMap[id].highestStats.SCORE:get()
			end
			local f418_local9 = currentStats
			local highestMapReached = currentStats.highestMapReached:get()
			local f418_local10 = f418_local6 and (f418_local9 and highestMapReached) < mapOrderIndex
			local isCurrentMap = false
			if not f418_local5 then
				local savedMap = Engine.GetSavedMap()
				if savedMap then
					if LUI.startswith( savedMap, "cp_sh" ) then
						savedMap = Engine.GetSavedMapQueuedMap()
					end
					if savedMap and savedMap == mapData.rootMapName then
						isCurrentMap = true
					end
				end
			end
			local stat = highestScore
			if not f418_local6 then
				stat = "--"
			end
			if currentEpisode ~= mapData.episodeNumber then
				currentEpisode = mapData.episodeNumber or -1
				if #mapsList > 0 then
					DataSources.CPMapsList.spacers[#mapsList] = 20
				end
				local text = nil
				if CoD.BaseUtility.NumberToString( currentEpisode + 1 ) then
					text = ToUpper( Engine.Localize( "CPUI_EPISODE_X", CoD.BaseUtility.NumberToString( currentEpisode + 1 ) ) )
				else
					text = LocalizeToUpperString( categoryList[mapData.episodeNumber] )
				end
				table.insert( mapsList, {
					models = {
						displayText = text
					},
					properties = {
						customWidgetOverride = CoD.GenericListHeaderEntry
					}
				} )
			end
			local team = CoD.CPUtility.GetFactionFromStatsByController( controller )
			local faction = Engine.GetFactionForTeam( team )
			local f418_local11 = table.insert
			local f418_local12 = mapsList
			local f418_local13 = {}
			local f418_local14 = {
				displayText = Engine.Localize( mapData.mapNameCaps ),
				Image = mapData.previewImage,
				name = mapData.mapName,
				mapName = mapData.mapName,
				rootMapName = mapData.rootMapName,
				mapLocation = mapData.mapLocation
			}
			local f418_local15 = mapData[faction .. "MapDesc"]
			if not f418_local15 then
				f418_local15 = mapData.mapDescription
			end
			f418_local14.mapDescription = f418_local15
			f418_local14.bestTime = 0
			f418_local14.stat = stat
			f418_local14.bestScore = highestScore
			f418_local14.completedDifficultyAlpha = completedDifficultyAlpha
			f418_local14.completedDifficulty = completedDifficultyIcon
			f418_local14.completedDifficultyText = completedDifficultyText
			f418_local14.classified = classified
			f418_local14.collectiblesFound = collectedCollectibleCount
			f418_local14.collectiblesTotal = collectibleCount
			f418_local14.accoladesTotal = accoladeCount
			f418_local14.accoladesFound = completedAccoladeCount
			f418_local14.completedOutOfOrder = f418_local10
			f418_local14.completed = f418_local6
			f418_local14.isCurrentMap = isCurrentMap
			f418_local14.unique_id = mapData.unique_id
			f418_local14.noContextWidget = true
			f418_local13.models = f418_local14
			f418_local13.properties = {
				mapId = id,
				classified = classified,
				baseMapId = mapData.baseMapId,
				serverCmds = mapData.serverCmds
			}
			f418_local11( f418_local12, f418_local13 )
		end
	end
	return mapsList
end, false, nil, nil, function ( list, row, widgetHeight )
	return DataSources.CPMapsList.spacers[row] or 0
end )
function FindPlaylistCategory( categories, playlistId )
	for index, category in ipairs( categories ) do
		for pindex, playlist in ipairs( category.playlists ) do
			if playlist.index == playlistId then
				return category
			end
		end
	end
	return nil
end

DataSources.ZMMapsList = ListHelper_SetupDataSource( "ZMMapsList", function ( controller, list )
	local mapsList = {}
	if CoD.perController[controller].choosingZMPlaylist then
		local categories = Engine.GetPlaylistCategories()
		local filter = CoD.PlaylistCategoryFilter or ""
		local profile_playlist = Engine.ProfileInt( controller, "playlist_" .. filter )
		local profile_category = FindPlaylistCategory( categories, profile_playlist )
		local totalCategoryPlayerCounter = 0
		for index, category in ipairs( categories ) do
			if category.filter == filter then
				totalCategoryPlayerCounter = totalCategoryPlayerCounter + category.playerCount
			end
		end
		local createPlaylistCategory = function ( category )
			local playlists = {}
			for index, playlist in ipairs( category.playlists ) do
				local f423_local3 = ""
				if Dvar.groupCountsVisible:get() == true then
					f423_local3 = Engine.Localize( "MENU_PLAYLIST_USER_COUNT", CoD.separateNumberWithCommas( playlist.playerCount ), CoD.separateNumberWithCommas( totalCategoryPlayerCounter ) )
				else
					if totalCategoryPlayerCounter <= 0 then
						totalCategoryPlayerCounter = 1
					end
					f423_local3 = Engine.Localize( "MENU_PLAYLIST_USER_PERCENT", math.floor( playlist.playerCount / totalCategoryPlayerCounter * 100 + 0.5 ) )
				end
				table.insert( mapsList, {
					models = {
						displayText = playlist.name or "",
						mapName = playlist.name or "",
						Image = playlist.icon or "blacktransparent",
						buttonText = playlist.name or "",
						mapDescription = playlist.description or "",
						playingCount = f423_local3
					},
					properties = {
						id = tostring( playlist.index ),
						category = category,
						playlist = playlist,
						selectIndex = playlist.index == profile_playlist,
						disabled = Engine.IsPlaylistLocked( controller, playlist.index )
					}
				} )
			end
		end
		
		for index, category in ipairs( categories ) do
			if category.filter == filter then
				createPlaylistCategory( category )
			end
		end
	else
		local sortMaps = function ( a, b )
			return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
		end
		
		for totalCategoryPlayerCounter, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
			if mapData.session_mode == Enum.eModes.MODE_ZOMBIES and mapData.dlc_pack ~= -1 and (ShowPurchasableMap( controller, totalCategoryPlayerCounter ) or Engine.IsMapValid( totalCategoryPlayerCounter ) and mapData.mapName ~= nil) then
				local playlistCountString = ""
				table.insert( mapsList, {
					models = {
						displayText = CoD.StoreUtility.PrependPurchaseIconIfNeeded( controller, totalCategoryPlayerCounter, Engine.Localize( mapData.mapNameCaps ) ),
						Image = mapData.previewImage,
						mapName = mapData.mapName,
						mapLocation = mapData.mapLocation,
						mapDescription = CoD.StoreUtility.AddUpsellToDescriptionIfNeeded( controller, totalCategoryPlayerCounter, mapData.mapDescription ),
						playingCount = Engine.Localize( "MENU_CATEGORY_USER_COUNT", CoD.separateNumberWithCommas( 0 ), CoD.separateNumberWithCommas( 0 ) )
					},
					properties = {
						mapId = totalCategoryPlayerCounter,
						purchasable = not Engine.IsMapValid( totalCategoryPlayerCounter )
					}
				} )
			end
		end
	end
	CoD.StoreUtility.AddListDLCListener( list )
	return mapsList
end )
DataSources.CPVideoPlayerList = ListHelper_SetupDataSource( "CPVideoPlayerList", function ( controller )
	local videosList = {}
	local sortMaps = function ( a, b )
		return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
	end
	
	local doa_id = "cp_doa_bo3"
	local codfu_id = "cp_codfu"
	for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
		if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.isSafeHouse == false and mapData.dlc_pack ~= -1 and mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT and id ~= doa_id and id ~= codfu_id then
			local completed = Engine.GetDStat( controller, "PlayerStatsByMap", id, "hasBeenCompleted" )
			if completed == 1 or false ~= Dvar.allCollectiblesUnlocked:get() then
				table.insert( videosList, {
					models = {
						displayText = Engine.Localize( mapData.mapNameCaps ),
						video = mapData.introMovie
					},
					properties = {}
				} )
			end
		end
	end
	table.insert( videosList, {
		models = {
			displayText = Engine.Localize( "ZMUI_ZOD_CAPS" ),
			video = "zm_zod_load_zodloadingmovie"
		},
		properties = {}
	} )
	return videosList
end )
DataSources.CPPublicGameSelectionList = ListHelper_SetupDataSource( "CPPublicGameSelectionList", function ( controller )
	local listTable = {}
	table.insert( listTable, {
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
	local savedMap = Engine.GetSavedMap()
	if savedMap and LUI.startswith( savedMap, "cp_sh" ) then
		savedMap = Engine.GetSavedMapQueuedMap()
	end
	if not savedMap then
		savedMap = "cp_mi_eth_prologue"
		if Engine.IsCampaignModeZombies() then
			savedMap = "cp_mi_sing_sgen_nightmares"
		end
	end
	local mapData = CoD.MapUtility.MapsTable[savedMap]
	local collectedCollectibleCount, collectibleCount = GetCollectiblesXOfY( controller, savedMap )
	local completedAccoladeCount, accoladeCount = GetAccoladesXOfY( controller, savedMap )
	local completedDifficultyAlpha = 0
	local completedDifficultyIcon = CoD.CPUtility.DIFFICULTY_ICON[0]
	local completedDifficultyText = CoD.CPUtility.DIFFICULTY[0]
	local f427_local0 = Engine.GetDStat( controller, "PlayerStatsByMap", savedMap, "hasBeenCompleted" ) == 1
	local completedDifficulty = Engine.GetDStat( controller, "PlayerStatsByMap", savedMap, "lastCompletedDifficulty" )
	if f427_local0 and completedDifficulty >= 0 then
		completedDifficultyAlpha = 1
		completedDifficultyIcon = CoD.CPUtility.DIFFICULTY_ICON[completedDifficulty]
		completedDifficultyText = CoD.CPUtility.DIFFICULTY[completedDifficulty]
	end
	local stats = Engine.GetPlayerStats( controller )
	if mapData then
		local bestScore = stats.PlayerStatsByMap[savedMap].highestStats.SCORE:get()
		table.insert( listTable, {
			models = {
				displayText = "MENU_PLAY_CURRENT_MISSION_CAPS",
				Image = mapData.previewImage,
				mapName = mapData.mapName,
				mapLocation = mapData.mapLocation,
				mapDescription = mapData.mapDescription,
				bestTime = 0,
				bestScore = bestScore,
				action = CPSelectPublicGame,
				param = "currMission",
				mapInfoVis = 1,
				infoText = "",
				playerCountText = "MENU_X_PLAYERS_PLAYING",
				collectiblesFound = collectedCollectibleCount,
				collectiblesTotal = collectibleCount,
				accoladesTotal = accoladeCount,
				accoladesFound = completedAccoladeCount,
				playersPlaying = 0,
				type = "currentMission",
				completedDifficultyAlpha = completedDifficultyAlpha,
				completedDifficulty = completedDifficultyIcon,
				completedDifficultyText = completedDifficultyText
			}
		} )
	end
	table.insert( listTable, {
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
	return listTable
end )
DataSources.CampaignSettings = {
	getModel = function ( controller )
		local cpSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
		local difficulty = 1
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) and controller == Engine.GetPrimaryController() then
			difficulty = Engine.GetProfileVarInt( controller, "g_gameskill" )
		else
			local model = Engine.GetModel( Engine.GetModelForController( controller ), "serverDifficulty" )
			difficulty = model and Engine.GetModelValue( model )
		end
		if difficulty == nil then
			difficulty = 1
		end
		Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficulty" ), Engine.Localize( CoD.CPUtility.DIFFICULTY[difficulty] ) )
		Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficultyIcon" ), CoD.CPUtility.DIFFICULTY_ICON[difficulty] )
		local selectedMap = Engine.GetModelValue( Engine.CreateModel( cpSettingsModel, "selectedMap" ) )
		if selectedMap == nil then
			Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "selectedMap" ), Dvar.ui_mapname:get() )
		end
		return cpSettingsModel
	end
}
DataSources.ZMSettings = {
	getModel = function ( controller )
		local zmSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "ZMSettings" )
		return zmSettingsModel
	end
}
DataSources.CampaignMissionList = {
	prepare = function ( controller, list, filter )
		list.missionList = {}
		local count = Engine.TableLookup( CoD.protoMapsTable, 1, 0, "mapCount" )
		local missionLevelModel = Engine.CreateModel( Engine.GetGlobalModel(), "MissionLevels" )
		for i = 1, count, 1 do
			local index = i - 1 .. ""
			local devName = Engine.TableLookup( CoD.protoMapsTable, 0, 3, index )
			local locName = Engine.TableLookup( CoD.protoMapsTable, 1, 3, index )
			local imageName = Engine.TableLookup( CoD.protoMapsTable, 2, 3, index )
			local desc = Engine.TableLookup( CoD.protoMapsTable, 4, 3, index )
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
}
DataSources.LocalServer = {
	prepare = function ( controller, list, filter )
		list.baseModel = Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" )
		list.countModel = Engine.GetModel( list.baseModel, "count" )
		if list.countSubscription then
			list:removeSubscription( list.countSubscription )
		end
		list.countSubscription = list:subscribeToModel( list.countModel, function ()
			if IsFreeCursorActive( controller ) then
				list:updateDataSource( true, true )
			else
				RefreshListFindSelectedXuid( controller, list )
			end
		end, false )
	end,
	getCount = function ( list )
		return Engine.GetModelValue( list.countModel )
	end,
	getItem = function ( controller, list, index )
		return Engine.GetModel( list.baseModel, "server" .. index - 1 )
	end,
	cleanup = function ( list, controller )
		Engine.LobbyServerListClearServerList()
	end
}
DataSources.LocalServerPlayer = {
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
}
DataSources.XPProgressionBar = {
	getModel = function ( controller )
		if not controller then
			controller = Engine.GetPrimaryController()
		end
		local XPBar_RankIdCol = 0
		local XPBar_RankTableColMinXP = 2
		local XPBar_RankTableColMaxXP = 7
		local XPBar_RankDisplayLevelCol = 14
		local stats = {
			currentStats = CoD.GetPlayerStats( controller ),
			currPrestige = REG5.currentStats.PlayerStatsList.PLEVEL.StatValue:get()
		}
		if IsInParagonCapableGameMode() and stats.currPrestige == Engine.GetPrestigeCap() then
			stats.currentRank = stats.currentStats.PlayerStatsList.PARAGON_RANK.StatValue:get()
			stats.displayLevelForCurrRank = Engine.TableLookup( CoD.paragonRankTable, XPBar_RankDisplayLevelCol, XPBar_RankIdCol, stats.currentRank )
			stats.currRankIconMaterialName = Engine.TableLookup( CoD.rankIconTable, stats.currPrestige + 1, XPBar_RankIdCol, 0 )
			stats.nextRank = stats.currentRank + 1
			stats.displayLevelForNextRank = tonumber( stats.displayLevelForCurrRank ) + 1
			stats.nextRankIconMaterialName = Engine.TableLookup( CoD.rankIconTable, stats.currPrestige + 1, XPBar_RankIdCol, 0 )
			stats.paragonIconId = stats.currentStats.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
			if stats.paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
				stats.currRankIconMaterialName = Engine.GetParagonIconById( stats.paragonIconId )
				stats.nextRankIconMaterialName = stats.currRankIconMaterialName
			end
			stats.currRankXP = stats.currentStats.PlayerStatsList.PARAGON_RANKXP.StatValue:get()
			stats.minXPForCurrRank = tonumber( Engine.TableLookup( CoD.paragonRankTable, XPBar_RankTableColMinXP, XPBar_RankIdCol, stats.currentRank ) )
			stats.maxXPForCurrRank = tonumber( Engine.TableLookup( CoD.paragonRankTable, XPBar_RankTableColMaxXP, XPBar_RankIdCol, stats.currentRank ) )
		else
			stats.currentRank = stats.currentStats.PlayerStatsList.RANK.StatValue:get()
			stats.displayLevelForCurrRank = Engine.TableLookup( CoD.rankTable, XPBar_RankDisplayLevelCol, XPBar_RankIdCol, stats.currentRank )
			stats.currRankIconMaterialName = Engine.TableLookup( CoD.rankIconTable, stats.currPrestige + 1, XPBar_RankIdCol, stats.currentRank )
			stats.nextRank = stats.currentRank + 1
			stats.displayLevelForNextRank = tonumber( stats.displayLevelForCurrRank ) + 1
			stats.nextRankIconMaterialName = Engine.TableLookup( CoD.rankIconTable, stats.currPrestige + 1, XPBar_RankIdCol, stats.nextRank )
			stats.currRankXP = stats.currentStats.PlayerStatsList.RANKXP.StatValue:get()
			stats.minXPForCurrRank = tonumber( Engine.TableLookup( CoD.rankTable, XPBar_RankTableColMinXP, XPBar_RankIdCol, stats.currentRank ) )
			stats.maxXPForCurrRank = tonumber( Engine.TableLookup( CoD.rankTable, XPBar_RankTableColMaxXP, XPBar_RankIdCol, stats.currentRank ) )
		end
		stats.prestigeNext = CoD.PrestigeNext( controller )
		stats.xpToNextRank = stats.maxXPForCurrRank - stats.currRankXP
		stats.relativeRankXP = stats.currRankXP - stats.minXPForCurrRank
		stats.progressPct = stats.relativeRankXP / (stats.maxXPForCurrRank - stats.minXPForCurrRank)
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
}
DataSources.CryptoKeyProgress = {
	getModel = function ( controller )
		local f443_local0 = Engine.IsLootReady( controller )
		local f443_local1 = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller )
		local cryptoKeyCount = -1
		local f443_local2 = f443_local0 and f443_local1 or cryptoKeyCount
		local progressPct = CoD.BlackMarketUtility.GetProgressTowardNextKey( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		local cryptoKeyModel = Engine.CreateModel( perControllerModel, "CryptoKeyProgress" )
		if CoD.perController[controller].keysToNotShowYet then
			f443_local2 = f443_local2 - CoD.perController[controller].keysToNotShowYet
		end
		Engine.SetModelValue( Engine.CreateModel( cryptoKeyModel, "keyCount" ), f443_local2 )
		Engine.SetModelValue( Engine.CreateModel( cryptoKeyModel, "progress" ), progressPct )
		Engine.SetModelValue( Engine.CreateModel( cryptoKeyModel, "codPoints" ), Engine.IsLootReady( controller ) and Engine.GetCoDPoints( controller ) or -1 )
		return cryptoKeyModel
	end
}
DataSources.GadgetModList = {
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
}
DataSources.Rewards = {
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
				local unlockedWeaponName = Engine.Localize( Engine.GetItemName( unlockedWeaponIndex ) )
				local unlockedWeaponImage = Engine.GetItemImage( unlockedWeaponIndex )
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
}
DataSources.AARStats = {
	prepare = function ( controller, list, filter )
		list.AARStatsList = {}
		local aarStatsListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "AARStats" )
		local f450_local0 = CoD.GetPlayerStats( controller )
		local stats = f450_local0.AfterActionReportStats
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
}
DataSources.AARMedalsList = {
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
				local f453_local4 = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, xpColumn ) )
				Engine.SetModelValue( Engine.CreateModel( currMedalModel, "medalIndex" ), medalIndex )
				Engine.SetModelValue( Engine.CreateModel( currMedalModel, "medalTimesObtained" ), medalHitCount )
				local f453_local3 = 1
				local xpScaleModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarStats.xpScale" )
				if xpScaleModel then
					f453_local3 = Engine.GetModelValue( xpScaleModel )
				end
				f453_local4 = f453_local4 * f453_local3
				if medalHitCount > 1 then
					Engine.SetModelValue( Engine.CreateModel( currMedalModel, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f453_local4 * tonumber( medalHitCount ) ) )
				else
					Engine.SetModelValue( Engine.CreateModel( currMedalModel, "medalXP" ), "+" .. Engine.Localize( "MPUI_N_XP", f453_local4 ) )
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
}
DataSources.CombatRecordDeadliestCybercore = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordDeadliestCybercore" )
		local stats = CoD.GetCombatRecordStats( controller )
		local deadliestCybercoreValue = 0
		local deadliestCybercoreKills = 0
		local deadliestCybercoreAssists = 0
		local deadliestCybercoreItemIndex = 0
		local deadliestCybercoreItemName = Engine.Localize( "MENU_NONE" )
		for itemIndex = 0, 255, 1 do
			if Engine.GetItemAllocationCost( itemIndex, CoD.GetCombatRecordMode() ) >= 0 then
				local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
				if loadoutSlot == "cybercom_ability1" or loadoutSlot == "cybercom_ability2" or loadoutSlot == "cybercom_ability3" then
					local numKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.kills" )
					local numAssists = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.assists" )
					local maxValue = numKills
					if numKills < numAssists then
						maxValue = numAssists
					end
					if deadliestCybercoreValue < maxValue then
						deadliestCybercoreValue = maxValue
						deadliestCybercoreKills = numKills
						deadliestCybercoreAssists = numAssists
						deadliestCybercoreItemIndex = itemIndex
						deadliestCybercoreItemName = Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() )
					end
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "itemIndex" ), deadliestCybercoreItemIndex )
		Engine.SetModelValue( Engine.CreateModel( model, "itemName" ), deadliestCybercoreItemName )
		if deadliestCybercoreAssists <= deadliestCybercoreKills then
			Engine.SetModelValue( Engine.CreateModel( model, "numKills" ), deadliestCybercoreKills )
		else
			Engine.SetModelValue( Engine.CreateModel( model, "numKills" ), deadliestCybercoreAssists )
		end
		return model
	end
}
DataSources.CombatRecordBestScoreMap = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordBestScoreMap" )
		local stats = CoD.GetCombatRecordStats( controller )
		local highestScore = 0
		local highestScoreMapName = ""
		for mapName, mapData in pairs( CoD.MapUtility.MapsTable ) do
			local f457_local3 = mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if mapName == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
				mapData.isSubLevel = false
			end
			if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and f457_local3 and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
				local mapScore = stats.PlayerStatsByMap[mapName].highestStats.SCORE:get()
				if highestScore < mapScore then
					highestScore = mapScore
					highestScoreMapName = mapName
				end
			end
		end
		if highestScore == 0 then
			highestScore = "--"
			highestScoreMapName = Engine.Localize( "MENU_NONE" )
		end
		Engine.SetModelValue( Engine.CreateModel( model, "highestScore" ), highestScore )
		Engine.SetModelValue( Engine.CreateModel( model, "mapName" ), highestScoreMapName )
		return model
	end
}
DataSources.CombatRecordDeadliestEquipment = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordDeadliestEquipment" )
		local stats = CoD.GetCombatRecordStats( controller )
		local deadliestEquipmentKills = 0
		local deadliestEquipmentItemIndex = 0
		local deadliestWeaponItemName = Engine.Localize( "MENU_NONE" )
		for itemIndex = 0, 255, 1 do
			if Engine.GetItemAllocationCost( itemIndex, CoD.GetCombatRecordMode() ) >= 0 then
				local numKills = nil
				local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
				if loadoutSlot == "primarygadget" then
					numKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.kills" )
				elseif loadoutSlot == "secondarygadget" then
					numKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.combatRecordStat" )
				end
				if numKills and deadliestEquipmentKills < numKills then
					deadliestEquipmentKills = numKills
					deadliestEquipmentItemIndex = itemIndex
					deadliestWeaponItemName = Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() )
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "itemIndex" ), deadliestEquipmentItemIndex )
		Engine.SetModelValue( Engine.CreateModel( model, "numKills" ), deadliestEquipmentKills )
		Engine.SetModelValue( Engine.CreateModel( model, "itemName" ), deadliestWeaponItemName )
		return model
	end
}
DataSources.CombatRecordDeadliestScorestreak = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordDeadliestScorestreak" )
		local stats = CoD.GetCombatRecordStats( controller )
		local deadliestScorestreakKills = 0
		local deadliestScorestreakItemIndex = 0
		local deadliestWeaponItemName = Engine.Localize( "MENU_NONE" )
		for itemIndex = 0, 255, 1 do
			if Engine.GetItemAllocationCost( itemIndex, CoD.GetCombatRecordMode() ) >= 0 then
				local itemGroup = Engine.GetItemGroup( itemIndex, CoD.GetCombatRecordMode() )
				if itemGroup == "killstreak" then
					local numKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.kills" )
					if deadliestScorestreakKills < numKills then
						deadliestScorestreakKills = numKills
						deadliestScorestreakItemIndex = itemIndex
						deadliestWeaponItemName = Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() )
					end
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "itemIndex" ), deadliestScorestreakItemIndex )
		Engine.SetModelValue( Engine.CreateModel( model, "numKills" ), deadliestScorestreakKills )
		Engine.SetModelValue( Engine.CreateModel( model, "itemName" ), deadliestWeaponItemName )
		return model
	end
}
DataSources.CombatRecordDeadliestWeapon = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordDeadliestWeapon" )
		local stats = CoD.GetCombatRecordStats( controller )
		local deadliestWeaponKills = 0
		local deadliestWeaponItemIndex = 0
		local deadliestWeaponItemName = Engine.Localize( "MENU_NONE" )
		for itemIndex = 0, 255, 1 do
			local allocationCost = Engine.GetItemAllocationCost( itemIndex, CoD.GetCombatRecordMode() )
			if allocationCost < -1 or allocationCost >= 0 then
				local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
				if loadoutSlot == "primary" or loadoutSlot == "secondary" then
					local numKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.kills" )
					if deadliestWeaponKills < numKills then
						deadliestWeaponKills = numKills
						deadliestWeaponItemIndex = itemIndex
						deadliestWeaponItemName = Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() )
					end
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "itemIndex" ), deadliestWeaponItemIndex )
		Engine.SetModelValue( Engine.CreateModel( model, "numKills" ), deadliestWeaponKills )
		Engine.SetModelValue( Engine.CreateModel( model, "itemName" ), deadliestWeaponItemName )
		return model
	end
}
DataSources.CombatRecordMostUsedBubblegumBuff = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMostUsedBubblegumBuff" )
		local stats = CoD.GetCombatRecordStats( controller )
		local maxNumUsed = 0
		local mostUsedItemIndex = 0
		local mostUsedItemName = Engine.Localize( "MENU_NONE" )
		for itemIndex = 0, 255, 1 do
			local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
			if loadoutSlot == "equippedbubblegumpack" then
				local numUsed = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.used" )
				if maxNumUsed < numUsed then
					maxNumUsed = numUsed
					mostUsedItemIndex = itemIndex
					mostUsedItemName = Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() )
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "itemIndex" ), mostUsedItemIndex )
		Engine.SetModelValue( Engine.CreateModel( model, "itemName" ), mostUsedItemName )
		Engine.SetModelValue( Engine.CreateModel( model, "numUsed" ), maxNumUsed )
		return model
	end
}
DataSources.CombatRecordZMHighestRound = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordZMHighestRound" )
		local stats = CoD.GetCombatRecordStats( controller )
		local highestRound = 0
		local highestRoundMapName = Engine.Localize( "MENU_NONE" )
		for mapName, mapData in pairs( CoD.MapUtility.MapsTable ) do
			if mapData.session_mode == Enum.eModes.MODE_ZOMBIES and stats.PlayerStatsByMap and stats.PlayerStatsByMap[mapName] then
				local mapHighest = stats.PlayerStatsByMap[mapName].stats.HIGHEST_ROUND_REACHED.statValue:get()
				if highestRound < mapHighest then
					highestRound = mapHighest
					highestRoundMapName = mapName
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "highestRound" ), highestRound )
		Engine.SetModelValue( Engine.CreateModel( model, "mapName" ), highestRoundMapName )
		return model
	end
}
DataSources.CombatRecordTotalAccoladesCompleted = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordTotalAccoladesCompleted" )
		local stats = CoD.GetCombatRecordStats( controller )
		local accoladesCompleted = 0
		local sortMaps = function ( a, b )
			return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
		end
		
		for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
			local f463_local3 = mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if id == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
				mapData.isSubLevel = false
			end
			if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and f463_local3 and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
				local completedAccoladeCount, accoladeCount = GetAccoladesXOfY( controller, id, true )
				accoladesCompleted = accoladesCompleted + completedAccoladeCount
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "accoladesCompleted" ), accoladesCompleted )
		return model
	end
}
DataSources.CombatRecordTotalCollectiblesFound = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordTotalCollectiblesFound" )
		local stats = CoD.GetCombatRecordStats( controller )
		local collectiblesFound = 0
		local sortMaps = function ( a, b )
			return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
		end
		
		for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
			local f465_local3 = mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if id == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
				mapData.isSubLevel = false
			end
			if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and f465_local3 and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
				local collectedCollectibleCount, collectibleCount = GetCollectiblesXOfY( controller, id, true )
				collectiblesFound = collectiblesFound + collectedCollectibleCount
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "collectiblesFound" ), collectiblesFound )
		return model
	end
}
DataSources.CombatRecordCollectiblesList = {
	prepare = function ( controller, list, filter )
		list.items = {}
		local mapIndex = 0
		local totalCollected = 0
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordListModel = Engine.CreateModel( perControllerModel, "CombatRecordCollectiblesList" )
		local sortMaps = function ( a, b )
			return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
		end
		
		for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
			local f467_local4 = mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT
			if id == "cp_doa_bo3" and Dvar.ui_doa_unlocked:get() then
				mapData.isSubLevel = false
			end
			if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and f467_local4 and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
				mapIndex = mapIndex + 1
				local collectedCollectibleCount, collectibleCount = GetCollectiblesXOfY( controller, id, true )
				local mapModel = Engine.CreateModel( combatRecordListModel, mapIndex )
				local f467_local3 = CoD.GetCombatRecordStats( controller )
				if f467_local3.PlayerStatsByMap[id].hasBeenCompleted:get() == 1 or collectedCollectibleCount > 0 then
					totalCollected = totalCollected + collectedCollectibleCount
					Engine.SetModelValue( Engine.CreateModel( mapModel, "name" ), mapData.mapName )
					Engine.SetModelValue( Engine.CreateModel( mapModel, "stat" ), Engine.Localize( "MENU_LISTBOX_POS", collectedCollectibleCount, collectibleCount ) )
					Engine.SetModelValue( Engine.CreateModel( mapModel, "id" ), id )
				else
					Engine.SetModelValue( Engine.CreateModel( mapModel, "name" ), mapData.mapName )
					Engine.SetModelValue( Engine.CreateModel( mapModel, "stat" ), "--" )
				end
				table.insert( list.items, mapModel )
			end
		end
	end,
	getCount = function ( list )
		return #list.items
	end,
	getItem = function ( controller, list, index )
		return list.items[index]
	end
}
DataSources.CombatRecordEquipmentList = {
	prepare = function ( controller, list, filter )
		list.items = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordListModel = Engine.CreateModel( perControllerModel, "CombatRecordEquipmentList" )
		local stats = CoD.GetCombatRecordStats( controller )
		local comparisonStats = CoD.GetCombatRecordComparisonStats( controller )
		for itemIndex = 0, 255, 1 do
			if Engine.GetItemAllocationCost( itemIndex, CoD.GetCombatRecordMode() ) >= 0 then
				local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
				if loadoutSlot == "primarygadget" or loadoutSlot == "secondarygadget" then
					local itemModel = Engine.CreateModel( combatRecordListModel, itemIndex )
					local itemName = Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "name" ), itemName )
					local statValue, lethalAlpha, statLabel, statPath = nil
					if loadoutSlot == "primarygadget" then
						lethalAlpha = 1
						statLabel = "MENU_KILLS_CAPS"
						statPath = "ItemStats." .. itemIndex .. ".stats.kills"
					else
						lethalAlpha = 0
						statLabel = itemName .. "_STAT_CAPS"
						statPath = "ItemStats." .. itemIndex .. ".stats.combatRecordStat"
					end
					statValue = CoD.GetCombatRecordStatForPath( stats, statPath )
					local comparisonValue = 0
					if comparisonStats then
						comparisonValue = CoD.GetCombatRecordStatForPath( comparisonStats, statPath )
					end
					Engine.SetModelValue( Engine.CreateModel( itemModel, "itemIndex" ), itemIndex )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "stat" ), statValue )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "statComparison" ), comparisonValue )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "lethalAlpha" ), lethalAlpha )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "tacticalAlpha" ), 1 - lethalAlpha )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "statLabel" ), statLabel )
					table.insert( list.items, itemModel )
				end
			end
		end
		local statSort = function ( a, b )
			local statValueA = Engine.GetModelValue( Engine.GetModel( a, "stat" ) )
			local statValueB = Engine.GetModelValue( Engine.GetModel( b, "stat" ) )
			if statValueA == statValueB then
				local nameValueA = Engine.Localize( Engine.GetModelValue( Engine.GetModel( a, "name" ) ) )
				local nameValueB = Engine.Localize( Engine.GetModelValue( Engine.GetModel( b, "name" ) ) )
				return nameValueA < nameValueB
			else
				return statValueB < statValueA
			end
		end
		
		table.sort( list.items, statSort )
	end,
	getCount = function ( list )
		return #list.items
	end,
	getItem = function ( controller, list, index )
		return list.items[index]
	end
}
DataSources.CombatRecordCallingCardShowcase = {
	prepare = function ( controller, list, filter )
		list.items = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local listModel = Engine.CreateModel( perControllerModel, "CombatRecordCallingCardShowcase" )
		for index = 0, 2, 1 do
			local itemModel = Engine.CreateModel( listModel, index )
			local backgroundID = Engine.GetCombatRecordBackgroundId( controller, CoD.CombatRecordXUID, index )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "backgroundID" ), backgroundID )
			local cardDesc = ""
			local cardTitle = ""
			if backgroundID > 0 then
				local challengeInfo = Engine.GetChallengeInfoByBackingId( controller, backgroundID )
				if challengeInfo and #challengeInfo > 0 then
					cardTitle, cardDesc = CoD.ChallengesUtility.GetLocalizedNameAndDescriptionForChallengeInfo( challengeInfo[1] )
				else
					local backgroundIDColumn = 1
					local backgroundNameColumn = 4
					cardTitle = Engine.Localize( Engine.TableLookup( CoD.backgroundsTable, 4, 1, backgroundID ) )
				end
			elseif not CoD.CombatRecordOtherPlayerStats then
				cardDesc = Engine.Localize( "MENU_SELECT_CALLING_CARD" )
			end
			Engine.SetModelValue( Engine.CreateModel( itemModel, "description" ), cardDesc )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "title" ), cardTitle )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "slotIndex" ), index )
			table.insert( list.items, itemModel )
		end
		local showcaseUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "CallingCardShowcaseUpdated" )
		if list.updateSubscription then
			list:removeSubscription( list.updateSubscription )
		end
		list.updateSubscription = list:subscribeToModel( showcaseUpdateModel, function ()
			list:updateDataSource()
		end, false )
	end,
	getCount = function ( list )
		return #list.items
	end,
	getItem = function ( controller, list, index )
		return list.items[index]
	end
}
DataSources.CombatRecordGameModeList = {
	prepare = function ( controller, list, filter )
		list.items = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordListModel = Engine.CreateModel( perControllerModel, "CombatRecordGameModeList" )
		local stats = CoD.GetCombatRecordStats( controller )
		local comparisonStats = CoD.GetCombatRecordComparisonStats( controller )
		local gameModes = Engine.GetGametypesBase( CoD.GetCombatRecordMode() )
		for index, gameMode in pairs( gameModes ) do
			if gameMode.category == "standard" then
				local itemModel = Engine.CreateModel( combatRecordListModel, index )
				local gameTypeInfo = Engine.GetGameTypeInfo( gameMode.gametype )
				local gameModeName = gameTypeInfo.nameRef
				Engine.SetModelValue( Engine.CreateModel( itemModel, "name" ), gameModeName )
				local gameModeImage = gameTypeInfo.image
				Engine.SetModelValue( Engine.CreateModel( itemModel, "image" ), gameModeImage )
				local lossesStatPath = "PlayerStatsByGameType." .. gameMode.gametype .. ".LOSSES"
				local numLosses = CoD.GetCombatRecordStatForPathOrZero( stats, lossesStatPath )
				local numLossesComparison = 0
				if comparisonStats then
					numLossesComparison = CoD.GetCombatRecordStatForPathOrZero( comparisonStats, lossesStatPath )
				end
				Engine.SetModelValue( Engine.CreateModel( itemModel, "losses" ), numLosses )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "lossesComparison" ), numLossesComparison )
				local statPath = "PlayerStatsByGameType." .. gameMode.gametype .. ".WINS"
				local numWins = CoD.GetCombatRecordStatForPathOrZero( stats, statPath )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "stat" ), numWins )
				local numWinsComparison = 0
				if comparisonStats then
					numWinsComparison = CoD.GetCombatRecordStatForPathOrZero( comparisonStats, statPath )
				end
				Engine.SetModelValue( Engine.CreateModel( itemModel, "statComparison" ), numWinsComparison )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "wlRatio" ), CoD.GetDisplayRatioFromTwoStats( numWins, numLosses ) )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "wlRatioComparison" ), CoD.GetDisplayRatioFromTwoStats( numWinsComparison, numLossesComparison ) )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "lossRingFrac" ), numLosses / math.max( 1, numLosses + numWins ) )
				local streakStatPath = "PlayerStatsByGameType." .. gameMode.gametype .. ".WIN_STREAK"
				local streak = CoD.GetCombatRecordStatForPathOrZero( stats, streakStatPath )
				local streakComparison = 0
				if comparisonStats then
					streakComparison = CoD.GetCombatRecordStatForPathOrZero( comparisonStats, streakStatPath )
				end
				Engine.SetModelValue( Engine.CreateModel( itemModel, "streak" ), streak )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "streakComparison" ), streakComparison )
				local killsStatPath = "PlayerStatsByGameType." .. gameMode.gametype .. ".KILLS"
				local kills = CoD.GetCombatRecordStatForPathOrZero( stats, killsStatPath )
				local killsComparison = 0
				if comparisonStats then
					killsComparison = CoD.GetCombatRecordStatForPathOrZero( comparisonStats, killsStatPath )
				end
				local deathsStatPath = "PlayerStatsByGameType." .. gameMode.gametype .. ".DEATHS"
				local deaths = CoD.GetCombatRecordStatForPathOrZero( stats, deathsStatPath )
				local deathsComparison = 0
				if comparisonStats then
					deathsComparison = CoD.GetCombatRecordStatForPathOrZero( comparisonStats, deathsStatPath )
				end
				Engine.SetModelValue( Engine.CreateModel( itemModel, "kdRatio" ), CoD.GetDisplayRatioFromTwoStats( kills, deaths ) )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "kdRatioComparison" ), CoD.GetDisplayRatioFromTwoStats( killsComparison, deathsComparison ) )
				local scoreStatPath = "PlayerStatsByGameType." .. gameMode.gametype .. ".SCORE"
				local score = CoD.GetCombatRecordStatForPathOrZero( stats, scoreStatPath )
				local scoreComparison = 0
				if comparisonStats then
					scoreComparison = CoD.GetCombatRecordStatForPathOrZero( comparisonStats, scoreStatPath )
				end
				local secondsStatPath = "PlayerStatsByGameType." .. gameMode.gametype .. ".TIME_PLAYED_TOTAL"
				local seconds = CoD.GetCombatRecordStatForPathOrZero( stats, secondsStatPath )
				local secondsComparison = 0
				if comparisonStats then
					secondsComparison = CoD.GetCombatRecordStatForPathOrZero( comparisonStats, secondsStatPath )
				end
				local minutes = math.max( 1, seconds / 60 )
				local minutesComparison = math.max( 1, secondsComparison / 60 )
				local spm = math.floor( score / minutes + 0.5 )
				local spmComparison = math.floor( scoreComparison / minutesComparison + 0.5 )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "spm" ), spm )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "spmComparison" ), spmComparison )
				table.insert( list.items, itemModel )
			end
		end
		local statSort = function ( a, b )
			local statValueA = Engine.GetModelValue( Engine.GetModel( a, "stat" ) )
			local statValueB = Engine.GetModelValue( Engine.GetModel( b, "stat" ) )
			if statValueA == statValueB then
				local nameValueA = Engine.Localize( Engine.GetModelValue( Engine.GetModel( a, "name" ) ) )
				local nameValueB = Engine.Localize( Engine.GetModelValue( Engine.GetModel( b, "name" ) ) )
				return nameValueA < nameValueB
			else
				return statValueB < statValueA
			end
		end
		
		table.sort( list.items, statSort )
	end,
	getCount = function ( list )
		return #list.items
	end,
	getItem = function ( controller, list, index )
		return list.items[index]
	end
}
DataSources.CombatRecordMostWonGameMode = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMostWonGameMode" )
		local mostWins, gameModeImage, gameModeName = nil
		local stats = CoD.GetCombatRecordStats( controller )
		local gameModes = Engine.GetGametypesBase( CoD.GetCombatRecordMode() )
		for index, gameMode in pairs( gameModes ) do
			if gameMode.category == "standard" then
				local numWins = CoD.GetCombatRecordStatForPath( stats, "PlayerStatsByGameType." .. gameMode.gametype .. ".WINS" )
				if not mostWins or mostWins < numWins then
					mostWins = numWins
					local gameTypeInfo = Engine.GetGameTypeInfo( gameMode.gametype )
					gameModeImage = gameTypeInfo.image
					gameModeName = gameTypeInfo.nameRef
				end
			end
		end
		Engine.SetModelValue( Engine.CreateModel( model, "image" ), gameModeImage )
		Engine.SetModelValue( Engine.CreateModel( model, "name" ), gameModeName )
		Engine.SetModelValue( Engine.CreateModel( model, "wins" ), mostWins )
		return model
	end
}
DataSources.CombatRecordMPMedal1 = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMedal1" )
		Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), "MEDAL_HEADSHOT" )
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local numHeadshots = stats.playerstatslist.medal_headshot.statvalue:get()
		if numHeadshots > 0 then
			local medalAssetName = Engine.TableLookup( CoD.scoreInfoTableMP, 3, 2, "MEDAL_HEADSHOT" )
			local medalInfo = Engine.GetMedalInfo( medalAssetName )
			if medalInfo then
				Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), medalInfo.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), medalInfo.iconLarge )
				Engine.SetModelValue( Engine.CreateModel( model, "value" ), numHeadshots )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), "uie_t7_hud_medal_backing_badassery_outline" )
			Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), "$blank" )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), "--" )
		end
		return model
	end
}
DataSources.CombatRecordMPMedal2 = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMedal2" )
		local medalReferences = {
			"MEDAL_KILLSTREAK_MORE_THAN_30",
			"MEDAL_KILLSTREAK_30",
			"MEDAL_KILLSTREAK_25",
			"MEDAL_KILLSTREAK_20",
			"MEDAL_KILLSTREAK_15",
			"MEDAL_KILLSTREAK_10",
			"MEDAL_KILLSTREAK_5"
		}
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local bestMedalReference, bestMedalCount, index, medalReference = nil
		for index, medalReference in ipairs( medalReferences ) do
			local medalCount = stats.playerstatslist[medalReference].statvalue:get()
			if medalCount and medalCount > 0 then
				bestMedalReference = medalReference
				bestMedalCount = medalCount
				break
			end
		end
		if bestMedalReference then
			local medalAssetName = Engine.TableLookup( CoD.scoreInfoTableMP, 3, 2, bestMedalReference )
			local medalInfo = Engine.GetMedalInfo( medalAssetName )
			Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), bestMedalReference )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), bestMedalCount )
			if medalInfo then
				Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), medalInfo.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), medalInfo.iconLarge )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), "MENU_KILL_STREAKS" )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), "--" )
			Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), "uie_t7_hud_medal_backing_killstreak_outline" )
			Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), "$blank" )
		end
		return model
	end
}
DataSources.CombatRecordMPMedal3 = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMedal3" )
		local medalReferences = {
			"MEDAL_MULTIKILL_MORE_THAN_8",
			"MEDAL_MULTIKILL_8",
			"MEDAL_MULTIKILL_7",
			"MEDAL_MULTIKILL_6",
			"MEDAL_MULTIKILL_5",
			"MEDAL_MULTIKILL_4",
			"MEDAL_MULTIKILL_3",
			"MEDAL_MULTIKILL_2"
		}
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local bestMedalReference, bestMedalCount, index, medalReference = nil
		for index, medalReference in ipairs( medalReferences ) do
			local medalCount = stats.playerstatslist[medalReference].statvalue:get()
			if medalCount and medalCount > 0 then
				bestMedalReference = medalReference
				bestMedalCount = medalCount
				break
			end
		end
		if bestMedalReference then
			local medalAssetName = Engine.TableLookup( CoD.scoreInfoTableMP, 3, 2, bestMedalReference )
			local medalInfo = Engine.GetMedalInfo( medalAssetName )
			Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), bestMedalReference )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), bestMedalCount )
			if medalInfo then
				Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), medalInfo.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), medalInfo.iconLarge )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), "MENU_MULTI_KILLS" )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), "--" )
			Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), "uie_t7_hud_medal_backing_multikill_outline" )
			Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), "$blank" )
		end
		return model
	end
}
DataSources.CombatRecordMPMedal4 = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMedal4" )
		local medalReferences = {
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
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local bestMedalReference = nil
		local bestMedalCount = 0
		local index, medalReference = nil
		for index, medalReference in ipairs( medalReferences ) do
			local medalCount = stats.playerstatslist[medalReference].statvalue:get()
			if medalCount and bestMedalCount < medalCount then
				bestMedalReference = medalReference
				bestMedalCount = medalCount
			end
		end
		if bestMedalReference then
			local medalAssetName = Engine.TableLookup( CoD.scoreInfoTableMP, 3, 2, bestMedalReference )
			local medalInfo = Engine.GetMedalInfo( medalAssetName )
			Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), bestMedalReference )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), bestMedalCount )
			if medalInfo then
				Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), medalInfo.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), medalInfo.iconLarge )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), "MENU_SPECIALIST_WEAPON" )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), "--" )
			Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), "uie_t7_hud_medal_backing_specialist_outline" )
			Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), "$blank" )
		end
		return model
	end
}
DataSources.CombatRecordMPMedal5 = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMedal5" )
		local medalReferences = {
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
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local bestMedalReference = nil
		local bestMedalCount = 0
		local index, medalReference = nil
		for index, medalReference in ipairs( medalReferences ) do
			local medalCount = stats.playerstatslist[medalReference].statvalue:get()
			if medalCount and bestMedalCount < medalCount then
				bestMedalReference = medalReference
				bestMedalCount = medalCount
			end
		end
		if bestMedalReference then
			local medalAssetName = Engine.TableLookup( CoD.scoreInfoTableMP, 3, 2, bestMedalReference )
			local medalInfo = Engine.GetMedalInfo( medalAssetName )
			Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), bestMedalReference )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), bestMedalCount )
			if medalInfo then
				Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), medalInfo.backingLarge )
				Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), medalInfo.iconLarge )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( model, "medalRef" ), "MENU_SPECIALIST_ABILITY" )
			Engine.SetModelValue( Engine.CreateModel( model, "value" ), "--" )
			Engine.SetModelValue( Engine.CreateModel( model, "backingLarge" ), "uie_t7_hud_medal_backing_specialist_outline" )
			Engine.SetModelValue( Engine.CreateModel( model, "iconLarge" ), "$blank" )
		end
		return model
	end
}
DataSources.CombatRecordMPMedals = {
	prepare = function ( controller, list, filter )
		list.items = {}
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMPMedals" )
		local f489_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local mpPlayerStatsList = f489_local0.PlayerStatsList
		local numScoreRows = Engine.GetTableRowCount( CoD.scoreInfoTableMP )
		local medalReferenceColumnIndex = 2
		local medalAssetNameColumnIndex = 3
		local medalCategoryColumnIndex = 12
		local medalSortKeyColumnIndex = 13
		local medalsEarned = {}
		for rowIndex = 1, numScoreRows, 1 do
			local medalCategory = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, rowIndex - 1, medalCategoryColumnIndex )
			if medalCategory == CoD.CombatRecordMedalCategory then
				local medalReference = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, rowIndex - 1, medalReferenceColumnIndex )
				local medalAssetName = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, rowIndex - 1, medalAssetNameColumnIndex )
				local medalSortKey = Engine.TableGetColumnValueForRow( CoD.scoreInfoTableMP, rowIndex - 1, medalSortKeyColumnIndex )
				if medalReference ~= "" then
					local timesEarned = mpPlayerStatsList[medalReference].statValue:get()
					local medalInfo = Engine.GetMedalInfo( medalAssetName )
					if timesEarned > 0 then
						local medalModel = Engine.CreateModel( model, rowIndex )
						if not medalsEarned[medalReference] then
							medalsEarned[medalReference] = rowIndex
							Engine.SetModelValue( Engine.CreateModel( medalModel, "name" ), medalReference )
							Engine.SetModelValue( Engine.CreateModel( medalModel, "timesEarned" ), timesEarned )
							Engine.SetModelValue( Engine.CreateModel( medalModel, "iconLarge" ), medalInfo.iconLarge )
							Engine.SetModelValue( Engine.CreateModel( medalModel, "backingLarge" ), medalInfo.backingLarge )
							Engine.SetModelValue( Engine.CreateModel( medalModel, "sortKey" ), medalSortKey )
							table.insert( list.items, medalModel )
						else
							local oldRowIndex = medalsEarned[medalReference]
							local oldMedalModel = Engine.GetModel( model, oldRowIndex )
							local oldTimesEarnedModel = Engine.GetModel( oldMedalModel, "timesEarned" )
							local oldTimesEarned = Engine.GetModelValue( oldTimesEarnedModel )
							local newTimesEarned = oldTimesEarned + timesEarned
							Engine.SetModelValue( oldTimesEarnedModel, newTimesEarned )
						end
					end
				end
			end
		end
		local medalSort = function ( a, b )
			local sortKeyA = Engine.GetModelValue( Engine.GetModel( a, "sortKey" ) )
			local sortKeyB = Engine.GetModelValue( Engine.GetModel( b, "sortKey" ) )
			return sortKeyA < sortKeyB
		end
		
		table.sort( list.items, medalSort )
		return model
	end,
	getCount = function ( list )
		return #list.items
	end,
	getItem = function ( controller, list, index )
		return list.items[index]
	end
}
DataSources.CombatRecordMPMedalTabs = ListHelper_SetupDataSource( "CombatRecordMPMedalTabs", function ( controller )
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
			tabName = "MENU_COMBAT_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "combat"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_SPECIALISTS_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "specialist"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_ANTISPECIALISTS_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "antispecialist"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_SCORESTREAKS_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "scorestreak"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_ANTISCORESTREAKS_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "antiscorestreak"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MPUI_GAMEMODE_CAPS",
			tabIcon = ""
		},
		properties = {
			tabId = "gamemode"
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
end )
DataSources.CombatRecordMPTabs = ListHelper_SetupDataSource( "CombatRecordMPTabs", function ( controller )
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
			tabName = "MPUI_SUMMARY_CAPS",
			tabWidget = "CoD.CombatRecordSummaryPanel",
			tabIcon = ""
		},
		properties = {
			tabId = "summary"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_COMBAT_RECORD_TAB_PUBLIC_CAPS",
			tabWidget = "CoD.CombatRecordPublicMatchPanel",
			tabIcon = ""
		},
		properties = {
			tabId = "public"
		}
	} )
	table.insert( tabList, {
		models = {
			tabName = "MENU_ARENA_CAPS",
			tabWidget = "CoD.CombatRecordArenaPanel",
			tabIcon = ""
		},
		properties = {
			tabId = "arena"
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
end )
DataSources.CombatRecordScorestreakList = {
	prepare = function ( controller, list, filter )
		list.items = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordListModel = Engine.CreateModel( perControllerModel, "CombatRecordScorestreakList" )
		local stats = CoD.GetCombatRecordStats( controller )
		local comparisonStats = CoD.GetCombatRecordComparisonStats( controller )
		for itemIndex = 0, 255, 1 do
			if Engine.GetItemAllocationCost( itemIndex, CoD.GetCombatRecordMode() ) >= 0 then
				local itemGroup = Engine.GetItemGroup( itemIndex, CoD.GetCombatRecordMode() )
				if itemGroup == "killstreak" then
					local itemModel = Engine.CreateModel( combatRecordListModel, itemIndex )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "name" ), Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() ) )
					local statName = "kills"
					local isPassive = Engine.IsItemPassive( itemIndex, CoD.GetCombatRecordMode() )
					if isPassive then
						statName = "assists"
					end
					local statPath = "ItemStats." .. itemIndex .. ".stats." .. statName
					local numKills = CoD.GetCombatRecordStatForPath( stats, statPath )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "itemIndex" ), itemIndex )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "stat" ), numKills )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "statName" ), Engine.Localize( "MENU_" .. statName .. "_CAPS" ) )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "statPerUseString" ), Engine.Localize( "MENU_" .. statName .. "_PER_USE_CAPS" ) )
					local numKillsComparison = 0
					if comparisonStats then
						numKillsComparison = CoD.GetCombatRecordStatForPath( comparisonStats, statPath )
					end
					Engine.SetModelValue( Engine.CreateModel( itemModel, "statComparison" ), numKillsComparison )
					table.insert( list.items, itemModel )
				end
			end
		end
		local statSort = function ( a, b )
			local statValueA = Engine.GetModelValue( Engine.GetModel( a, "stat" ) )
			local statValueB = Engine.GetModelValue( Engine.GetModel( b, "stat" ) )
			if statValueA == statValueB then
				local nameValueA = Engine.Localize( Engine.GetModelValue( Engine.GetModel( a, "name" ) ) )
				local nameValueB = Engine.Localize( Engine.GetModelValue( Engine.GetModel( b, "name" ) ) )
				return nameValueA < nameValueB
			else
				return statValueB < statValueA
			end
		end
		
		table.sort( list.items, statSort )
	end,
	getCount = function ( list )
		return #list.items
	end,
	getItem = function ( controller, list, index )
		return list.items[index]
	end
}
DataSources.CombatRecordCybercoreList = {
	prepare = function ( controller, list, filter )
		CoD.CACUtility.UnlockablesTable = CoD.CACUtility.GetUnlockablesTable( controller, nil, CoD.GetCombatRecordMode() )
		list.items = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordListModel = Engine.CreateModel( perControllerModel, "CombatRecordCybercoreList" )
		local stats = CoD.GetCombatRecordStats( controller )
		local comparisonStats = CoD.GetCombatRecordComparisonStats( controller )
		for index, model in ipairs( CoD.CACUtility.UnlockablesTable.cybercom_abilities ) do
			local ref = Engine.GetModelValue( Engine.GetModel( model, "ref" ) )
			local f499_local3 = false
			if LUI.endswith( ref, "_pro" ) then
				f499_local3 = true
			end
			if not f499_local3 then
				local itemIndex = Engine.GetModelValue( Engine.GetModel( model, "itemIndex" ) )
				local itemModel = Engine.CreateModel( combatRecordListModel, itemIndex )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "name" ), Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() ) )
				local numKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.kills" )
				local numAssists = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.assists" )
				local uses = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.used" )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "cybercoreName" ), Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() ) )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "cybercoreIndex" ), itemIndex )
				if numKills < numAssists then
					Engine.SetModelValue( Engine.CreateModel( itemModel, "stat" ), "*" .. numAssists )
					local ratio = CoD.GetDisplayRatioFromTwoStats( numAssists, uses )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "killsPerUse" ), "*" .. ratio )
					local numAssistsComparison = 0
					if comparisonStats then
						numAssistsComparison = CoD.GetCombatRecordStatForPath( comparisonStats, "ItemStats." .. itemIndex .. ".stats.assists" )
					end
					Engine.SetModelValue( Engine.CreateModel( itemModel, "statComparison" ), numAssistsComparison )
				else
					Engine.SetModelValue( Engine.CreateModel( itemModel, "stat" ), numKills )
					local ratio = CoD.GetDisplayRatioFromTwoStats( numKills, uses )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "killsPerUse" ), ratio )
					local numKillsComparison = 0
					if comparisonStats then
						numKillsComparison = CoD.GetCombatRecordStatForPath( comparisonStats, "ItemStats." .. itemIndex .. ".stats.kills" )
					end
					Engine.SetModelValue( Engine.CreateModel( itemModel, "statComparison" ), numKillsComparison )
				end
				table.insert( list.items, itemModel )
			end
		end
		local statSort = function ( a, b )
			local statValueA = Engine.GetModelValue( Engine.GetModel( a, "stat" ) )
			local statValueB = Engine.GetModelValue( Engine.GetModel( b, "stat" ) )
			if type( statValueA ) == "string" and LUI.startswith( statValueA, "*" ) then
				statValueA = tonumber( string.sub( statValueA, 2 ) )
			end
			if type( statValueB ) == "string" and LUI.startswith( statValueB, "*" ) then
				statValueB = tonumber( string.sub( statValueB, 2 ) )
			end
			if statValueA == statValueB then
				local nameValueA = Engine.Localize( Engine.GetModelValue( Engine.GetModel( a, "name" ) ) )
				local nameValueB = Engine.Localize( Engine.GetModelValue( Engine.GetModel( b, "name" ) ) )
				return nameValueA < nameValueB
			else
				return statValueB < statValueA
			end
		end
		
		table.sort( list.items, statSort )
	end,
	getCount = function ( list )
		return #list.items
	end,
	getItem = function ( controller, list, index )
		return list.items[index]
	end
}
DataSources.CombatRecordSpecialistList = {
	prepare = function ( controller, list, filter )
		list.items = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordListModel = Engine.CreateModel( perControllerModel, "CombatRecordSpecialistList" )
		local stats = CoD.GetCombatRecordStats( controller )
		local comparisonStats = CoD.GetCombatRecordComparisonStats( controller )
		local heroTable = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		for _, hero in ipairs( heroTable ) do
			local heroIndex = hero.bodyIndex
			local weaponItemIndex = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			local f503_local5 = Engine.CreateModel( combatRecordListModel, weaponItemIndex )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "name" ), Engine.GetItemName( weaponItemIndex, CoD.GetCombatRecordMode() ) )
			local f503_local6 = "ItemStats." .. weaponItemIndex .. ".stats.kills"
			local f503_local7 = CoD.GetCombatRecordStatForPath( stats, f503_local6 )
			local f503_local3 = 0
			local f503_local4 = 0
			if comparisonStats then
				f503_local3 = CoD.GetCombatRecordStatForPath( comparisonStats, f503_local6 )
				f503_local4 = CombatRecordGetComparisonTwoStatRatioForItemIndex( controller, "kills", "used", weaponItemIndex )
			end
			local killsPerUse = CombatRecordGetTwoStatRatioForItemIndex( controller, "kills", "used", weaponItemIndex )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "heroIndex" ), heroIndex )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "heroName" ), hero.displayName )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "itemIndex" ), weaponItemIndex )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "killsPerUse" ), killsPerUse )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "killsPerUseComparison" ), f503_local4 )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "stat" ), f503_local7 )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "statComparison" ), f503_local3 )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "statDesc" ), "" )
			table.insert( list.items, f503_local5 )
			local gadgetItemIndex = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
			f503_local5 = Engine.CreateModel( combatRecordListModel, gadgetItemIndex )
			local itemName = Engine.GetItemName( gadgetItemIndex, CoD.GetCombatRecordMode() )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "name" ), itemName )
			f503_local6 = "ItemStats." .. gadgetItemIndex .. ".stats.combatRecordStat"
			f503_local7 = CoD.GetCombatRecordStatForPath( stats, f503_local6 )
			f503_local3 = 0
			if comparisonStats then
				f503_local3 = CoD.GetCombatRecordStatForPath( comparisonStats, f503_local6 )
				f503_local4 = CombatRecordGetComparisonTwoStatRatioForItemIndex( controller, "combatRecordStat", "used", gadgetItemIndex )
			end
			killsPerUse = CombatRecordGetTwoStatRatioForItemIndex( controller, "combatRecordStat", "used", gadgetItemIndex )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "heroIndex" ), heroIndex )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "heroName" ), hero.displayName )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "itemIndex" ), gadgetItemIndex )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "killsPerUse" ), killsPerUse )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "killsPerUseComparison" ), f503_local4 )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "stat" ), f503_local7 )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "statComparison" ), f503_local3 )
			Engine.SetModelValue( Engine.CreateModel( f503_local5, "statDesc" ), itemName .. "_KILLS_DESC" )
			table.insert( list.items, f503_local5 )
		end
		local statSort = function ( a, b )
			local statValueA = Engine.GetModelValue( Engine.GetModel( a, "stat" ) )
			local statValueB = Engine.GetModelValue( Engine.GetModel( b, "stat" ) )
			if statValueA == statValueB then
				local nameValueA = Engine.Localize( Engine.GetModelValue( Engine.GetModel( a, "name" ) ) )
				local nameValueB = Engine.Localize( Engine.GetModelValue( Engine.GetModel( b, "name" ) ) )
				return nameValueA < nameValueB
			else
				return statValueB < statValueA
			end
		end
		
		table.sort( list.items, statSort )
	end,
	getCount = function ( list )
		return #list.items
	end,
	getItem = function ( controller, list, index )
		return list.items[index]
	end
}
DataSources.CombatRecordWeaponsList = {
	prepare = function ( controller, list, filter )
		list.weapons = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordWeaponsListModel = Engine.CreateModel( perControllerModel, "CombatRecordWeaponsList" )
		local stats = CoD.GetCombatRecordStats( controller )
		local comparisonStats = CoD.GetCombatRecordComparisonStats( controller )
		for itemIndex = 0, 255, 1 do
			local allocationCost = Engine.GetItemAllocationCost( itemIndex, CoD.GetCombatRecordMode() )
			if allocationCost < -1 or allocationCost >= 0 then
				local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
				if loadoutSlot == "primary" or loadoutSlot == "secondary" then
					local weaponModel = Engine.CreateModel( combatRecordWeaponsListModel, itemIndex )
					local killsStatPath = "ItemStats." .. itemIndex .. ".stats.kills"
					local destroyedStatPath = "ItemStats." .. itemIndex .. ".stats.destroyed"
					local numKills = CoD.GetCombatRecordStatForPath( stats, killsStatPath )
					local numDestroyed = CoD.GetCombatRecordStatForPath( stats, destroyedStatPath )
					local statName = "kills"
					local statValue = numKills
					if Engine.GetItemGroup( itemIndex, CoD.GetCombatRecordMode() ) == "weapon_launcher" then
						statName = "kills_destroys"
						statValue = numKills + numDestroyed
					end
					Engine.SetModelValue( Engine.CreateModel( weaponModel, "itemIndex" ), itemIndex )
					Engine.SetModelValue( Engine.CreateModel( weaponModel, "stat" ), statValue )
					Engine.SetModelValue( Engine.CreateModel( weaponModel, "statName" ), Engine.Localize( "MENU_" .. statName .. "_CAPS" ) )
					local classified = false
					local name = Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() )
					local itemRef = Engine.GetItemRef( itemIndex, CoD.GetCombatRecordMode() )
					local statsAlpha = 1
					if CoD.BlackMarketUtility.IsBlackMarketItem( itemRef ) and CoD.BlackMarketUtility.IsItemLocked( controller, itemRef ) then
						name = CoD.BlackMarketUtility.ClassifiedName( false )
						classified = true
						statsAlpha = 0
					end
					Engine.SetModelValue( Engine.CreateModel( weaponModel, "name" ), name )
					Engine.SetModelValue( Engine.CreateModel( weaponModel, "isBMClassified" ), classified )
					Engine.SetModelValue( Engine.CreateModel( weaponModel, "statsAlpha" ), statsAlpha )
					local numKillsComparison = 0
					if comparisonStats then
						numKillsComparison = CoD.GetCombatRecordStatForPath( comparisonStats, killsStatPath )
					end
					Engine.SetModelValue( Engine.CreateModel( weaponModel, "statComparison" ), numKillsComparison )
					if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemRef ) then
						table.insert( list.weapons, weaponModel )
					end
				end
			end
		end
		local statSort = function ( a, b )
			local aBMClassified = CoD.SafeGetModelValue( a, "isBMClassified" )
			local bBMClassified = CoD.SafeGetModelValue( b, "isBMClassified" )
			if aBMClassified and not bBMClassified then
				return false
			elseif not aBMClassified and bBMClassified then
				return true
			else
				local statValueA = Engine.GetModelValue( Engine.GetModel( a, "stat" ) )
				local statValueB = Engine.GetModelValue( Engine.GetModel( b, "stat" ) )
				if statValueA == statValueB then
					local nameValueA = Engine.Localize( Engine.GetModelValue( Engine.GetModel( a, "name" ) ) )
					local nameValueB = Engine.Localize( Engine.GetModelValue( Engine.GetModel( b, "name" ) ) )
					return nameValueA < nameValueB
				else
					return statValueB < statValueA
				end
			end
		end
		
		table.sort( list.weapons, statSort )
	end,
	getCount = function ( list )
		return #list.weapons
	end,
	getItem = function ( controller, list, index )
		return list.weapons[index]
	end
}
DataSources.CombatRecordBGBList = {
	prepare = function ( controller, list, filter )
		list.bubbleGumBuffs = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordBGBListModel = Engine.CreateModel( perControllerModel, "combatRecordBGBListModel" )
		local stats = CoD.GetCombatRecordStats( controller )
		local comparisonStats = CoD.GetCombatRecordComparisonStats( controller )
		for itemIndex = 0, 255, 1 do
			local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
			if loadoutSlot == "equippedbubblegumpack" then
				local dlcID = CoD.CACUtility.GetDLCIdForBubbleGum( itemIndex )
				if not CoD.BaseUtility.IsHiddenDLC( CoD.ProductBitFromId[dlcID] ) then
					local bgbModel = Engine.CreateModel( combatRecordBGBListModel, itemIndex )
					Engine.SetModelValue( Engine.CreateModel( bgbModel, "name" ), Engine.GetItemName( itemIndex, CoD.GetCombatRecordMode() ) )
					local numUses = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.used" )
					Engine.SetModelValue( Engine.CreateModel( bgbModel, "itemIndex" ), itemIndex )
					Engine.SetModelValue( Engine.CreateModel( bgbModel, "stat" ), numUses )
					local numUsedComparison = 0
					if comparisonStats then
						numUsedComparison = CoD.GetCombatRecordStatForPath( comparisonStats, "ItemStats." .. itemIndex .. ".stats.used" )
					end
					Engine.SetModelValue( Engine.CreateModel( bgbModel, "statComparison" ), numUsedComparison )
					table.insert( list.bubbleGumBuffs, bgbModel )
				end
			end
		end
		local statSort = function ( a, b )
			local statValueA = Engine.GetModelValue( Engine.GetModel( a, "stat" ) )
			local statValueB = Engine.GetModelValue( Engine.GetModel( b, "stat" ) )
			if statValueA == statValueB then
				local nameValueA = Engine.Localize( Engine.GetModelValue( Engine.GetModel( a, "name" ) ) )
				local nameValueB = Engine.Localize( Engine.GetModelValue( Engine.GetModel( b, "name" ) ) )
				return nameValueA < nameValueB
			else
				return statValueB < statValueA
			end
		end
		
		table.sort( list.bubbleGumBuffs, statSort )
	end,
	getCount = function ( list )
		return #list.bubbleGumBuffs
	end,
	getItem = function ( controller, list, index )
		return list.bubbleGumBuffs[index]
	end
}
DataSources.CombatRecordZMMapsList = {
	prepare = function ( controller, list, filter )
		list.maps = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local combatRecordZMMapsListModel = Engine.CreateModel( perControllerModel, "CombatRecordZMMapsList" )
		local stats = CoD.GetCombatRecordStats( controller )
		for mapName, mapData in pairs( CoD.MapUtility.MapsTable ) do
			if mapData.session_mode == Enum.eModes.MODE_ZOMBIES then
				local dlcBit = Engine.GetDLCBitForMapName( mapName )
				if not CoD.BaseUtility.IsHiddenDLC( dlcBit ) and stats.PlayerStatsByMap and stats.PlayerStatsByMap[mapName] then
					local mapStats = stats.PlayerStatsByMap[mapName]
					local mapModel = Engine.CreateModel( combatRecordZMMapsListModel, mapName )
					local highestRound = 0
					local roundsSurvived = 0
					local gamesPlayed = 0
					local numDowns = 0
					highestRound = mapStats.stats.HIGHEST_ROUND_REACHED.statValue:get()
					roundsSurvived = mapStats.stats.TOTAL_ROUNDS_SURVIVED.statValue:get()
					gamesPlayed = mapStats.stats.TOTAL_GAMES_PLAYED.statValue:get()
					numDowns = mapStats.stats.TOTAL_DOWNS.statValue:get()
					Engine.SetModelValue( Engine.CreateModel( mapModel, "name" ), MapNameToLocalizedMapName( mapName ) )
					Engine.SetModelValue( Engine.CreateModel( mapModel, "highestRound" ), highestRound )
					Engine.SetModelValue( Engine.CreateModel( mapModel, "avgDowns" ), math.floor( numDowns / math.max( 1, gamesPlayed ) + 0.5 ) )
					Engine.SetModelValue( Engine.CreateModel( mapModel, "avgRounds" ), math.floor( roundsSurvived / math.max( 1, gamesPlayed ) + 0.5 ) )
					Engine.SetModelValue( Engine.CreateModel( mapModel, "stat" ), highestRound )
					Engine.SetModelValue( Engine.CreateModel( mapModel, "previewImage" ), mapData.previewImage )
					table.insert( list.maps, mapModel )
				end
			end
		end
		local statSort = function ( a, b )
			local statValueA = Engine.GetModelValue( Engine.GetModel( a, "stat" ) )
			local statValueB = Engine.GetModelValue( Engine.GetModel( b, "stat" ) )
			return statValueB < statValueA
		end
		
		table.sort( list.maps, statSort )
	end,
	getCount = function ( list )
		return #list.maps
	end,
	getItem = function ( controller, list, index )
		return list.maps[index]
	end
}
DataSources.CombatRecordCPPercentComplete = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordCPPercentComplete" )
		local missionWeight = 35
		local accoladeWeight = 15
		local collectibleWeight = 8
		local weaponsWeight = 10
		local cybercoreWeight = 10
		local challengeWeight = 10
		local medalWeight = 10
		local trainingWeight = 2
		local numMissionsCompleted = 0
		local numTotalMissions = 0
		local numAccoladesCompleted = 0
		local numTotalAccolades = 0
		local numCollectiblesCompleted = 0
		local numTotalCollectibles = 0
		local numWeaponsPurchased = 0
		local numTotalWeapons = 0
		local numcybercoresPurchased = 0
		local numTotalcybercores = 0
		local numchallengesCompleted = 0
		local numTotalchallenges = 0
		local nummedalsCompleted = 0
		local numTotalmedals = 0
		local numRatingsCompleted = 0
		local numTotalRatings = 0
		local cpzmMissionWeight = 9
		local numCPZMMissionsCompleted = 0
		local numCPZMTotalMissions = 0
		local sortMaps = function ( a, b )
			return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
		end
		
		local sessionMode = Enum.eModes.MODE_CAMPAIGN
		local cpPlayerStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_STATS_ONLINE )
		local cpzmPlayerStats = Engine.GetPlayerStatsNightmare( controller )
		for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
			if mapData.session_mode == sessionMode and id ~= "cp_doa_bo3" and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
				if mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_DEFAULT then
					local f519_local3 = cpPlayerStats.PlayerStatsByMap[mapData.rootMapName].hasBeenCompleted:get() ~= 0
					numTotalMissions = numTotalMissions + 1
					if f519_local3 then
						numMissionsCompleted = numMissionsCompleted + 1
					end
					local completedAccoladeCount, accoladeCount = GetAccoladesXOfY( controller, id, true )
					numAccoladesCompleted = numAccoladesCompleted + completedAccoladeCount
					numTotalAccolades = numTotalAccolades + accoladeCount
					local collectedCollectibleCount, collectibleCount = GetCollectiblesXOfY( controller, id, true )
					numCollectiblesCompleted = numCollectiblesCompleted + collectedCollectibleCount
					numTotalCollectibles = numTotalCollectibles + collectibleCount
				end
				if mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
					local completedLeaf = LUI.getTableFromPath( "PlayerStatsByMap." .. mapData.rootMapName .. ".hasBeenCompleted", cpzmPlayerStats )
					local f519_local4 = completedLeaf and completedLeaf:get() ~= 0
					numCPZMTotalMissions = numCPZMTotalMissions + 1
					if f519_local4 then
						numCPZMMissionsCompleted = numCPZMMissionsCompleted + 1
					end
				end
			end
		end
		for itemIndex = 0, 255, 1 do
			if Engine.GetItemAllocationCost( itemIndex, sessionMode ) >= 0 then
				local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, sessionMode )
				local itemGroup = Engine.GetItemGroup( itemIndex, sessionMode )
				if loadoutSlot == "primary" or loadoutSlot == "secondary" or loadoutSlot == "primarygadget" or loadoutSlot == "secondarygadget" then
					numTotalWeapons = numTotalWeapons + 1
					if Engine.IsItemPurchased( controller, itemIndex, sessionMode ) then
						numWeaponsPurchased = numWeaponsPurchased + 1
					end
				end
				if itemGroup == "cybercom_abilities" or itemGroup == "cybercom_tacrig" then
					local itemRef = Engine.GetItemRef( itemIndex, sessionMode )
					if itemRef ~= "cybercom_multicore_pro" then
						numTotalcybercores = numTotalcybercores + 1
						if Engine.IsItemPurchased( controller, itemIndex, sessionMode ) then
							numcybercoresPurchased = numcybercoresPurchased + 1
						end
					end
				end
			end
		end
		local challengeInfo = Engine.GetChallengeInfoForImages( controller, nil, sessionMode )
		if challengeInfo then
			for _, f519_local3 in ipairs( challengeInfo ) do
				if not f519_local3.isMastery then
					numTotalchallenges = numTotalchallenges + 1
					if not f519_local3.isLocked then
						numchallengesCompleted = numchallengesCompleted + 1
					end
				end
			end
		end
		numTotalmedals = 12
		for medalIndex = 0, numTotalmedals - 1, 1 do
			if cpPlayerStats.PlayerCPDecorations[medalIndex]:get() ~= 0 then
				nummedalsCompleted = nummedalsCompleted + 1
			end
		end
		numTotalRatings = 3
		for ratingIndex = 1, numTotalRatings, 1 do
			if cpPlayerStats.trainingSimStats.ranksAchieved[ratingIndex]:get() ~= 0 then
				numRatingsCompleted = numRatingsCompleted + 1
			end
		end
		local percentage = 0
		if numMissionsCompleted > 0 then
			percentage = percentage + LUI.clamp( numMissionsCompleted / numTotalMissions, 0, 1 ) * missionWeight + LUI.clamp( numAccoladesCompleted / numTotalAccolades, 0, 1 ) * accoladeWeight + LUI.clamp( numCollectiblesCompleted / numTotalCollectibles, 0, 1 ) * collectibleWeight + LUI.clamp( numWeaponsPurchased / numTotalWeapons, 0, 1 ) * weaponsWeight + LUI.clamp( numcybercoresPurchased / numTotalcybercores, 0, 1 ) * cybercoreWeight + LUI.clamp( numchallengesCompleted / numTotalchallenges, 0, 1 ) * challengeWeight + LUI.clamp( nummedalsCompleted / numTotalmedals, 0, 1 ) * medalWeight + LUI.clamp( numRatingsCompleted / numTotalRatings, 0, 1 ) * trainingWeight
		end
		if percentage > 99.99 then
			percentage = percentage + LUI.clamp( numCPZMMissionsCompleted / numCPZMTotalMissions, 0, 1 ) * cpzmMissionWeight
		end
		if percentage ~= percentage then
			Engine.SetModelValue( Engine.CreateModel( model, "percent" ), "-" )
		else
			Engine.SetModelValue( Engine.CreateModel( model, "percent" ), string.format( "%.1f%%", percentage ) )
		end
		return model
	end
}
DataSources.CombatRecordTotalWeaponAccuracy = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordTotalWeaponAccuracy" )
		local totalShots = 0
		local totalHits = 0
		local stats = CoD.GetCombatRecordStats( controller )
		for itemIndex = 0, 255, 1 do
			if Engine.GetItemAllocationCost( itemIndex, CoD.GetCombatRecordMode() ) >= 0 then
				local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
				if loadoutSlot == "primary" or loadoutSlot == "secondary" or loadoutSlot == "heroweapon" then
					totalShots = totalShots + CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.shots" )
					totalHits = totalHits + CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.hits" ) + 0.5 * CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. itemIndex .. ".stats.headshots" )
				end
			end
		end
		local percentage = 0
		if totalHits > 0 then
			percentage = 100
		end
		if totalShots > 0 then
			percentage = LUI.clamp( totalHits / totalShots * 100, 0, 100 )
		end
		if percentage ~= percentage then
			Engine.SetModelValue( Engine.CreateModel( model, "percent" ), "-" )
		else
			Engine.SetModelValue( Engine.CreateModel( model, "percent" ), string.format( "%.1f%%", percentage ) )
		end
		return model
	end
}
DataSources.FavoriteSpecialist = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "FavoriteSpecialist" )
		local stats = CoD.GetCombatRecordStats( controller )
		local heroTable = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		local favoriteHeroIndex, favoriteItemIndex, favoriteHeroImage, favoriteHeroName = nil
		local favoriteItemKills = 0
		local favoriteItemUses = 0
		for _, hero in ipairs( heroTable ) do
			local heroIndex = hero.bodyIndex
			local weaponItemIndex = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			local numWeaponKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. weaponItemIndex .. ".stats.kills" )
			local abilityItemIndex = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
			local numAbilityKills = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. abilityItemIndex .. ".stats.combatRecordStat" )
			if favoriteItemKills < numWeaponKills or favoriteItemKills < numAbilityKills or favoriteHeroIndex == nil then
				if favoriteItemKills <= numWeaponKills then
					favoriteItemKills = numWeaponKills
					favoriteItemUses = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. weaponItemIndex .. ".stats.used" )
					favoriteItemIndex = weaponItemIndex
				else
					favoriteItemKills = numAbilityKills
					favoriteItemUses = CoD.GetCombatRecordStatForPath( stats, "ItemStats." .. abilityItemIndex .. ".stats.used" )
					favoriteItemIndex = abilityItemIndex
				end
				favoriteHeroIndex = heroIndex
				favoriteHeroImage = hero.defaultHeroRender
				favoriteHeroName = hero.displayName
			end
		end
		local killsPerUse = nil
		if favoriteItemUses == 0 then
			killsPerUse = string.format( "%.2f", 0 )
		else
			killsPerUse = string.format( "%.2f", math.floor( favoriteItemKills / favoriteItemUses * 100 + 0.5 ) / 100 )
		end
		Engine.SetModelValue( Engine.CreateModel( model, "displayString" ), Engine.Localize( "MENU_FAVORITE_SPECIALIST_STATS", Engine.Localize( favoriteHeroName ), Engine.Localize( Engine.GetItemName( favoriteItemIndex ) ) ) )
		Engine.SetModelValue( Engine.CreateModel( model, "heroIndex" ), favoriteHeroIndex )
		Engine.SetModelValue( Engine.CreateModel( model, "heroImage" ), favoriteHeroImage )
		Engine.SetModelValue( Engine.CreateModel( model, "heroName" ), Engine.Localize( favoriteHeroName ) )
		Engine.SetModelValue( Engine.CreateModel( model, "itemIndex" ), favoriteItemIndex )
		Engine.SetModelValue( Engine.CreateModel( model, "killsPerUse" ), killsPerUse )
		Engine.SetModelValue( Engine.CreateModel( model, "numKills" ), favoriteItemKills )
		Engine.SetModelValue( Engine.CreateModel( model, "numUses" ), favoriteItemUses )
		return model
	end
}
DataSources.SubobjectivesList = {
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
}
DataSources.ObjectivesList = {
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
}
DataSources.CurrentObjectivesList = {
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
			for index, objective in CoD.BaseUtility.PairsByKeys( objective_table ) do
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
			for index, objectiveTable in CoD.BaseUtility.PairsByKeys( overallObjectivesTable ) do
				if not statusSortedTable[objectiveTable.status] then
					statusSortedTable[objectiveTable.status] = {}
				end
				table.insert( statusSortedTable[objectiveTable.status], objectiveTable )
			end
			local objectivesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CurrentObjectivesList" )
			for status, statusTable in CoD.BaseUtility.PairsByKeys( statusSortedTable ) do
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
			local gameMode = Engine.GetDvarString( "g_gametype" )
			local gameModeName = Engine.Localize( "MPUI_" .. gameMode )
			local gameModeDesc = Engine.TableLookup( CoD.gametypesTable, 3, 0, 0, 1, gameMode )
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
}
DataSources.DeadOpsArcadeGlobal = {
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
		Engine.CreateModel( model, "level" )
		return model
	end
}
DataSources.DeadOpsArcadePlayers = {
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
				Engine.CreateModel( playerModel, "bulletbar_rgb" )
				Engine.CreateModel( playerModel, "ribbon" )
				Engine.CreateModel( playerModel, "gpr_rgb" )
				Engine.CreateModel( playerModel, "generic_txt" )
				Engine.CreateModel( playerModel, "gpr" )
				Engine.CreateModel( playerModel, "gpr2" )
				Engine.CreateModel( playerModel, "weaplevel1" )
				Engine.CreateModel( playerModel, "weaplevel2" )
				Engine.CreateModel( playerModel, "respawn" )
				DataSources.DeadOpsArcadePlayers.updateModelsForClient( controller, playerNum - 1 )
			end
		end
		return model
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
		playerConnected = "playerConnected",
		team = "team",
		isBot = "isBot"
	},
	prepare = function ( controller, list, filter )
		list.playerListInfoList = {}
		list.playerListInfoOrder = {}
		local perControllerModel = Engine.GetModelForController( controller )
		local playerListListModel = Engine.CreateModel( perControllerModel, "PlayerList" )
		local nextNonLocalIndex = 2
		local ourClientNum = Engine.GetClientNum( controller )
		local ourTeam = CoD.TeamUtility.GetTeamID( controller )
		local nonBotPlayers = 0
		for clientIndex = 0, Dvar.com_maxclients:get() - 1, 1 do
			local clientData = Engine.GetPlayerListData( controller, clientIndex )
			if not clientData.isBot then
				nonBotPlayers = nonBotPlayers + 1
			end
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
		if nonBotPlayers == 1 then
			list.soloPlay = true
		else
			list.soloPlay = nil
		end
		if ourTeam then
			list.ourTeam = ourTeam
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
		if not list.hasScoreboardSubscriptions then
			list.hasScoreboardSubscriptions = true
			for playerIndex = 0, Dvar.com_maxclients:get() - 1, 1 do
				list:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1." .. playerIndex .. ".clientNum" ), function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue ~= nil then
						clientIndex( controller, modelValue )
					end
				end, false )
			end
		end
		if not list.hasBotStatusSubscription then
			list.hasBotStatusSubscription = list:subscribeToModel( Engine.GetModel( perControllerModel, "playerBotStatusChanged" ), function ( model )
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
		if list.soloPlay then
			return count
		end
		for playerIndex, playerModel in pairs( list.playerListInfoList ) do
			local connectedModel = Engine.GetModel( playerModel, "playerConnected" )
			if connectedModel then
				local connectedModelValue = Engine.GetModelValue( connectedModel )
				if connectedModelValue ~= 0 then
					if CoD.isCampaign then
						local isBotModel = Engine.GetModel( playerModel, "isBot" )
						local teamModel = Engine.GetModel( playerModel, "team" )
						if isBotModel and teamModel and Engine.GetModelValue( isBotModel ) == false and Engine.GetModelValue( teamModel ) == list.ourTeam then
							count = count + 1
						end
					end
					count = count + 1
				end
			end
		end
		if count > 1 then
			return count
		end
		return 0
	end,
	getItem = function ( controller, list, index )
		local count = 0
		for orderIndex = 1, Dvar.com_maxclients:get(), 1 do
			local clientIndex = list.playerListInfoOrder[orderIndex]
			local playerModel = list.playerListInfoList[clientIndex]
			local connectedModel = Engine.GetModel( playerModel, "playerConnected" )
			if connectedModel then
				local connectedModelValue = Engine.GetModelValue( connectedModel )
				if connectedModelValue ~= 0 then
					if CoD.isCampaign then
						local isBotModel = Engine.GetModel( playerModel, "isBot" )
						local teamModel = Engine.GetModel( playerModel, "team" )
						if isBotModel and teamModel and Engine.GetModelValue( isBotModel ) == false and Engine.GetModelValue( teamModel ) == list.ourTeam then
							count = count + 1
						end
					else
						count = count + 1
					end
					if count == index then
						return playerModel
					end
				end
			end
		end
		DebugPrint( "WARNING: returning invalid playerListInfoList row" )
		return list.playerListInfoList[list.playerListInfoOrder[0]]
	end,
	getModelForPlayer = function ( controller, list, index )
		return list.playerListInfoList[index + 1]
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
		playerScoreShown = "playerScoreShown"
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
			local playerModel = Engine.CreateModel( playerListListModel, oneBasedListIndex - 1 )
			for playerListItem, modelItem in pairs( DataSources.PlayerListZM.modelLinks ) do
				Engine.SetModelValue( Engine.CreateModel( playerModel, modelItem ), clientData[playerListItem] )
			end
			if not list.hasInventorySubscriptions then
				if CoD.Zombie.InventoryIcon ~= nil then
					list:subscribeToModel( Engine.GetModel( perControllerModel, "zmInventory.player" .. clientIndex .. "hasItem" ), function ( model )
						if Engine.GetModelValue( model ) == 1 then
							Engine.SetModelValue( Engine.CreateModel( playerModel, "zombieInventoryIcon" ), CoD.Zombie.InventoryIcon )
						else
							Engine.SetModelValue( Engine.CreateModel( playerModel, "zombieInventoryIcon" ), "blacktransparent" )
						end
					end )
				else
					Engine.SetModelValue( Engine.CreateModel( playerModel, "zombieInventoryIcon" ), "blacktransparent" )
				end
			end
			list.playerListInfoList[oneBasedListIndex] = playerModel
		end
		list.hasInventorySubscriptions = true
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
}
DataSources.EmblemLayerList = {
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
		if layerData.iconID == CoD.CraftUtility.EMBLEM_INVALID_ID then
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
}
DataSources.EmblemIconList = {
	prepare = function ( controller, list, filter )
		list.emblemIconList = {}
		local category = CoD.CraftUtility.EMBLEM_DECALTABS[1].category
		if CoD.perController[controller].selectedDecalCategory ~= nil then
			category = CoD.perController[controller].selectedDecalCategory
		end
		local emblemIconListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemIconList" )
		local totalIcons = Engine.EmblemFilterCount( controller, 0, category )
		for iconIndex = 0, totalIcons - 1, 1 do
			local iconModel = Engine.CreateModel( emblemIconListModel, "icon_" .. iconIndex )
			local id = Engine.EmblemFilterIconID( controller, 0, category, iconIndex )
			Engine.SetModelValue( Engine.CreateModel( iconModel, "iconID" ), id )
			Engine.SetModelValue( Engine.CreateModel( iconModel, "name" ), GetEmblemDecalDesc( id ) )
			if category == CoD.CraftUtility.EmblemBlackMarketDecalCategory then
				local imageName = CoD.BlackMarketUtility.GetLootDecalName( controller, id )
				local isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, imageName )
				if isBMClassified then
					Engine.SetModelValue( Engine.GetModel( iconModel, "name" ), CoD.BlackMarketUtility.ClassifiedName() )
				end
				Engine.SetModelValue( Engine.CreateModel( iconModel, "isBMClassified" ), isBMClassified )
			else
				Engine.SetModelValue( Engine.CreateModel( iconModel, "isBMClassified" ), false )
			end
			if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( id ) then
				table.insert( list.emblemIconList, iconModel )
			end
		end
		table.sort( list.emblemIconList, CoD.BlackMarketUtility.SortUnlocksModelIconID )
	end,
	getCount = function ( list )
		return #list.emblemIconList
	end,
	getItem = function ( controller, list, index )
		return list.emblemIconList[index]
	end
}
DataSources.EmblemMaterialList = {
	prepare = function ( controller, list, filter )
		list.emblemMaterialList = {}
		local category = CoD.CraftUtility.EmblemMaterialCategory[1].category
		if CoD.perController[controller].selectedMaterialCategory ~= nil then
			category = CoD.perController[controller].selectedMaterialCategory
		end
		local emblemMaterialListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemMaterialList" )
		local totalMaterials = Engine.GetEmblemMaterialFilterCount( controller, category )
		for materialIndex = 0, totalMaterials - 1, 1 do
			local materialModel = Engine.CreateModel( emblemMaterialListModel, "emblemMaterial_" .. materialIndex )
			local id = Engine.GetEmblemMaterialIDByIndex( controller, category, materialIndex )
			Engine.SetModelValue( Engine.CreateModel( materialModel, "materialID" ), id )
			local materialName = Engine.GetEmblemMaterialName( id )
			Engine.SetModelValue( Engine.CreateModel( materialModel, "materialName" ), materialName )
			local isBMClassified = false
			if category == CoD.CraftUtility.EmblemBlackMarketEmblemCategory then
				isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, materialName )
			end
			Engine.SetModelValue( Engine.CreateModel( materialModel, "isBMClassified" ), isBMClassified )
			table.insert( list.emblemMaterialList, materialModel )
		end
	end,
	getCount = function ( list )
		return #list.emblemMaterialList
	end,
	getItem = function ( controller, list, index )
		return list.emblemMaterialList[index]
	end
}
DataSources.EmblemColorList = {
	prepare = function ( controller, list, filter )
		list.emblemColorList = {}
		if not CoD.CraftUtility.EmblemColorList then
			CoD.CraftUtility.EmblemColorList = CoD.CACUtility.GetEmblemColorList( controller )
		end
		list.emblemColorList = CoD.CraftUtility.EmblemColorList
	end,
	getCount = function ( list )
		return #list.emblemColorList
	end,
	getItem = function ( controller, list, index )
		return list.emblemColorList[index]
	end
}
DataSources.EmblemSelectedLayerColor = {
	getModel = function ( controller )
		local emblemLayerColor = Engine.GetSelectedLayerColor( controller )
		local selectedLayerColorModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerColor" )
		Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "color" ), CoD.ColorUtility.ConvertColor( emblemLayerColor.red, emblemLayerColor.green, emblemLayerColor.blue ) )
		Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "red" ), emblemLayerColor.red * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
		Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "green" ), emblemLayerColor.green * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
		Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "blue" ), emblemLayerColor.blue * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
		return selectedLayerColorModel
	end
}
DataSources.EmblemSelectedLayerColor1 = {
	getModel = function ( controller )
		local emblemLayerColor1 = Engine.GetSelectedLayerColor1( controller )
		local selectedLayerColorModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerColor1" )
		Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "color" ), CoD.ColorUtility.ConvertColor( emblemLayerColor1.red, emblemLayerColor1.green, emblemLayerColor1.blue ) )
		Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "red" ), emblemLayerColor1.red * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
		Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "green" ), emblemLayerColor1.green * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
		Engine.SetModelValue( Engine.CreateModel( selectedLayerColorModel, "blue" ), emblemLayerColor1.blue * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
		return selectedLayerColorModel
	end
}
DataSources.EmblemSelectedLayerEdittingColor = {
	getModel = function ( controller )
		local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
		local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
		if isGradientMode ~= nil and colorNum ~= nil and isGradientMode == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			return DataSources.EmblemSelectedLayerColor1.getModel( controller )
		else
			return DataSources.EmblemSelectedLayerColor.getModel( controller )
		end
	end
}
DataSources.EmblemSelectedLayerNoColor = {
	getModel = function ( controller )
		local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
		local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
		if isGradientMode ~= nil and colorNum ~= nil and isGradientMode == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			return DataSources.EmblemSelectedLayerColor.getModel( controller )
		else
			return DataSources.EmblemSelectedLayerColor1.getModel( controller )
		end
	end
}
DataSources.EmblemSelectedLayerProperties = {
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
		Engine.SetModelValue( Engine.CreateModel( selectedLayerPropertiesModel, "blend" ), layerProperties.blend )
		return selectedLayerPropertiesModel
	end
}
DataSources.EmblemProperties = {
	getModel = function ( controller )
		local colorMode = Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID
		local editorMode = Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
		local scaleMode = Engine.GetEmblemScaleMode( controller )
		local materialScaleMode = Engine.GetLayerMaterialScaleMode( controller )
		local totalLayers = CoD.perController[controller].totalLayers
		local customizationType = CoD.GetCustomization( controller, "type" )
		local usedLayerCount = Engine.GetUsedLayerCount( controller, customizationType, totalLayers )
		local layersUsedFraction = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedLayerCount, totalLayers )
		local linkedLayerCount = Engine.GetLinkedLayerCount( controller, customizationType )
		local totalGroups = CoD.perController[controller].totalGroups
		local usedgroupCount = Engine.GetUsedGroupCount( controller, customizationType, totalGroups )
		local groupsUsedFraction = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedgroupCount, totalGroups - 1 )
		local emblemPropertiesModel = Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties" )
		if not emblemPropertiesModel then
			emblemPropertiesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemProperties" )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "layersUsed" ), usedLayerCount )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "colorMode" ), colorMode )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "scaleMode" ), scaleMode )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "materialScaleMode" ), materialScaleMode )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "layersUsedFraction" ), layersUsedFraction )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "groupsUsed" ), usedgroupCount )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "groupsUsedFraction" ), groupsUsedFraction )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isClipboardEmpty" ), CoD.CraftUtility.EMBLEM_CLIPBOARDSTATE.EMPTY )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "addDecalMode" ), CoD.CraftUtility.EMBLEM_ADDDECAL.REPLACE )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isGradientMode" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "colorNum" ), Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isColor0NoColor" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "isColor1NoColor" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "linkedLayerCount" ), linkedLayerCount )
			Engine.SetModelValue( Engine.CreateModel( emblemPropertiesModel, "selectedDecalID" ), 0 )
		end
		return emblemPropertiesModel
	end
}
DataSources.Customization = {
	getModel = function ( controller )
		local customizationModel = Engine.GetModel( Engine.GetModelForController( controller ), "Customization" )
		if not customizationModel then
			customizationModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Customization" )
			local weaponIndexModel = Engine.CreateModel( customizationModel, "weapon_index" )
			Engine.SetModelValue( weaponIndexModel, 20 )
			local customizationType = Engine.CreateModel( customizationModel, "type" )
			Engine.SetModelValue( customizationType, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM )
		end
		return customizationModel
	end
}
DataSources.StoreCategoryList = ListHelper_SetupDataSource( "Store.CategoryList", function ( controller )
	local list = {}
	local storeCategories = Engine.GetStoreCategories()
	for categoryNum = 1, #storeCategories, 1 do
		local storeCategory = storeCategories[categoryNum]
		if storeCategory.visibility then
			local categoryFrameWidget = "CoD.Store_NonFeaturedFrame"
			if storeCategory.category == "FEATURED" then
				categoryFrameWidget = "CoD.Store_FeaturedFrame"
			end
			if not (not Dvar.tu4_enableCodPoints:exists() or Dvar.tu4_enableCodPoints:get() ~= true) or storeCategory.category ~= "FEATURED" and storeCategory.category ~= "CODPOINTS" and storeCategory.category ~= "EXTRASLOTS" then
				table.insert( list, {
					models = {
						category = storeCategory.category,
						category_loc_ref = storeCategory.category_loc_ref,
						category_visibility = storeCategory.visibility,
						frameWidget = categoryFrameWidget,
						imageName = storeCategory.imageName
					}
				} )
			end
		end
	end
	return list
end )
DataSources.StoreProductList = ListHelper_SetupDataSource( "Store.ProductList", function ( controller )
	local list = {}
	local storeCategory = CoD.perController[controller].selectedStoreCategory
	if storeCategory then
		local storeProducts = Engine.GetStoreProductsByCategory( controller, storeCategory )
		if storeCategory == "EXTRASLOTS" then
			local purchasestatus = Enum.StoreProductPurchaseStatus.STORE_PRODUCT_NOT_PURCHASED
			if DoesPlayerHaveExtraSlotsItem( controller ) then
				purchasestatus = Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED
			end
			table.insert( list, {
				models = {
					name = "MENU_MEDIA_STORAGE_PACK",
					price = "^BBUTTON_COD_POINT_ICON^ " .. CoD.CACUtility.GetExtraSlotCODPointCost(),
					desc = "MENU_EXTRASLOTS_PACK_DESC",
					productID = "EXTRASLOTS",
					skuID = "EXTRASLOTS",
					previewImage = "t7_store_preview_extraslots",
					productImage = "t7_store_product_extraslots",
					purchasestatus = purchasestatus,
					serviceLabel = 0
				}
			} )
		else
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
		end
	end
	return list
end )
DataSources.StoreFeaturedProductList = {
	getProduct = function ( index, productList )
		if index == 1 and productList[1].purchasestatus == Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED then
			return productList[5]
		elseif index == 5 and productList[1].purchasestatus == Enum.StoreProductPurchaseStatus.STORE_PRODUCT_PURCHASED then
			return productList[1]
		else
			return productList[index]
		end
	end,
	getModel = function ( controller )
		local featuredProductList = Engine.CreateModel( Engine.GetModelForController( controller ), "Store.StoreFeaturedProductList" )
		local storeCategory = CoD.StoreUtility.StoreFeaturedCategory
		local storeProducts = {}
		if storeCategory then
			storeProducts = Engine.GetStoreProductsByCategory( controller, storeCategory )
		end
		for productIndex = 1, 6, 1 do
			if not storeProducts[productIndex] then
				local product = {
					name = "",
					price = "",
					desc = "",
					productID = "",
					skuID = "",
					previewImage = "",
					productImage = "",
					purchasestatus = 0,
					serviceLabel = 0
				}
			end
			if storeProducts[productIndex] ~= nil then
				local f592_local2 = DataSources.StoreFeaturedProductList.getProduct( productIndex, storeProducts )
			end
			local buttonModel = Engine.CreateModel( featuredProductList, "button" .. productIndex )
			ListHelper_CreateModelsFromTable( buttonModel, {
				name = f592_local2.name,
				price = f592_local2.price,
				desc = f592_local2.desc,
				productID = f592_local2.productID,
				skuID = f592_local2.skuID,
				previewImage = f592_local2.previewImage,
				productImage = f592_local2.productImage,
				purchasestatus = f592_local2.purchasestatus,
				serviceLabel = f592_local2.serviceLabel
			} )
		end
		return featuredProductList
	end
}
DataSources.StoreRoot = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "StoreRoot" )
		return model
	end
}
DataSources.ChooseClassClients = ListHelper_SetupDataSource( "ChooseClassClients", function ( controller )
	local list = {}
	local numClients = 1
	local cpClientLoadoutMenuModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChooseClassCPClientMenu" )
	if cpClientLoadoutMenuModel then
		local numClientsModel = Engine.GetModel( cpClientLoadoutMenuModel, "numActiveClients" )
		if numClientsModel then
			numClients = Engine.GetModelValue( numClientsModel )
		end
	end
	for index = 1, numClients, 1 do
		table.insert( list, {
			models = {
				clientIndex = index
			}
		} )
	end
	return list
end )
DataSources.ChooseClassList = {
	prepare = function ( controller, list, filter )
		list.customClassList = {}
		local classCount = Engine.GetCustomClassCount( controller )
		local editClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList" )
		if IsMultiplayer() and IsIntDvarNonZero( "mp_prototype" ) then
			local index = 1
			local classNum = Engine.GetEquippedHero( controller, CoD.gameModeEnum )
			classNum = math.min( math.max( 0, classNum ), 9 )
			list.customClassList[index] = {}
			list.customClassList[index].models = Engine.CreateModel( editClassModel, "class" .. index )
			CoD.CACUtility.GetCustomClassModel( controller, classNum, list.customClassList[index].models )
			list.customClassList[index].properties = {
				classNum = index - 1
			}
		else
			for index = 1, classCount, 1 do
				local classNum = index - 1
				list.customClassList[index] = {}
				list.customClassList[index].models = Engine.CreateModel( editClassModel, "class" .. index )
				CoD.CACUtility.GetCustomClassModel( controller, classNum, list.customClassList[index].models )
				list.customClassList[index].properties = {
					classNum = index - 1
				}
			end
		end
	end,
	getCount = function ( list )
		return #list.customClassList
	end,
	getItem = function ( controller, list, index )
		return list.customClassList[index].models
	end,
	getCustomPropertiesForItem = function ( list, index )
		return list.customClassList[index].properties
	end
}
DataSources.ChooseClass_InGame = {
	prepareModelForIndex = function ( editClassModel, index, classNum, controller )
		local selectedClientXUID = nil
		if CanUseSharedLoadouts( controller ) then
			local cpClientLoadoutMenuModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChooseClassCPClientMenu" )
			if cpClientLoadoutMenuModel then
				local selectedClientModel = Engine.GetModel( cpClientLoadoutMenuModel, "selectedClientIndex" )
				if selectedClientModel then
					local clientIndex = Engine.GetModelValue( selectedClientModel )
					local clientModel = Engine.GetModel( cpClientLoadoutMenuModel, "client" .. clientIndex )
					if clientModel then
						selectedClientXUID = Engine.GetModelValue( Engine.GetModel( clientModel, "xuid" ) )
					end
				end
			end
		end
		local listModel = Engine.CreateModel( editClassModel, "class" .. index )
		CoD.CACUtility.GetCustomClassModel( controller, classNum, listModel, selectedClientXUID )
		local f599_local0 = listModel:create( "classNumber" )
		f599_local0:set( classNum )
		CoD.CACUtility.CreateContextualWeaponAttachmentsDataSources( "ChooseClass_InGame_" .. classNum, controller, listModel )
		return listModel
	end,
	prepare = function ( controller, list, filter )
		local team = CoD.TeamUtility.GetTeamID( controller )
		local preparedModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList.prepared" )
		if not preparedModel then
			preparedModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList.prepared" )
			Engine.SetModelValue( preparedModel, -1 )
		end
		local preparedTeam = Engine.GetModelValue( preparedModel )
		local isUsingTabs = false
		local classSetValue = -1
		local classSetValueModel = Engine.GetModel( Engine.GetModelForController( controller ), "classSetValue" )
		if classSetValueModel then
			classSetValue = Engine.GetModelValue( classSetValueModel )
			if classSetValue ~= CoD.PrestigeUtility.ChooseClassSets.Default and classSetValue ~= CoD.PrestigeUtility.ChooseClassSets.Custom then
				isUsingTabs = false
			else
				isUsingTabs = true
			end
		end
		list.customClassCount = Engine.GetCustomClassCount( controller )
		local defaultClassesToDisplay = 10 - list.customClassCount
		defaultClassesToDisplay = math.min( math.max( defaultClassesToDisplay, 0 ), 5 )
		if IsMultiplayer() and IsIntDvarNonZero( "mp_prototype" ) then
			Engine.SetModelValue( preparedModel, team )
			CoD.CACUtility.classModels[controller] = {}
			local editClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList" )
			list.classModels = {}
			if CustomClassesEnabled() and (not isUsingTabs or isUsingTabs and classSetValue == CoD.PrestigeUtility.ChooseClassSets.Custom) then
				for index = 1, 10, 1 do
					table.insert( list.classModels, {
						models = DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, index, index - 1, controller ),
						properties = {
							classNum = index - 1
						}
					} )
				end
			end
			CoD.CACUtility.classModels[controller] = list.classModels
		elseif preparedTeam ~= team or isUsingTabs then
			Engine.SetModelValue( preparedModel, team )
			CoD.CACUtility.classModels[controller] = {}
			local editClassModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassList" )
			list.classModels = {}
			if CustomClassesEnabled() and (not isUsingTabs or isUsingTabs and classSetValue == CoD.PrestigeUtility.ChooseClassSets.Custom) then
				for index = 1, list.customClassCount, 1 do
					table.insert( list.classModels, {
						models = DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, index, index - 1, controller ),
						properties = {
							classNum = index - 1
						}
					} )
				end
			end
			if IsMultiplayer() then
				if not isUsingTabs then
					local defaultClassesStart = 11
					for index = defaultClassesStart, defaultClassesStart + defaultClassesToDisplay - 1, 1 do
						table.insert( list.classModels, {
							models = DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, index, index - 1, controller ),
							properties = {
								classNum = index - 1
							}
						} )
					end
				elseif isUsingTabs and classSetValue == CoD.PrestigeUtility.ChooseClassSets.Default then
					local defaultClassesStart = 11
					defaultClassesToDisplay = 5
					for index = defaultClassesStart, defaultClassesStart + defaultClassesToDisplay - 1, 1 do
						table.insert( list.classModels, {
							models = DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, index, index - 1, controller ),
							properties = {
								classNum = index - 1
							}
						} )
					end
				end
			end
			if IsCampaign() then
				local fieldOpsClassNumIndex = CoD.perController[controller].fieldOpsKitClassNum
				if fieldOpsClassNumIndex ~= nil then
					table.insert( list.classModels, {
						models = DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, list.customClassCount + 1, fieldOpsClassNumIndex - 1, controller ),
						properties = {
							classNum = fieldOpsClassNumIndex - 1
						}
					} )
				end
			end
			CoD.CACUtility.classModels[controller] = list.classModels
		elseif CoD.CACUtility.classModels[controller] then
			list.classModels = CoD.CACUtility.classModels[controller]
			if IsCampaign() then
				local editClassModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList" )
				local fieldOpsClassNumIndex = CoD.perController[controller].fieldOpsKitClassNum
				if fieldOpsClassNumIndex ~= nil then
					if list.customClassCount + 1 <= #list.classModels then
						list.classModels[list.customClassCount + 1].models = DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, list.customClassCount + 1, fieldOpsClassNumIndex - 1, controller )
						list.classModels[list.customClassCount + 1].properties.classNum = fieldOpsClassNumIndex - 1
					else
						table.insert( list.classModels, {
							models = DataSources.ChooseClass_InGame.prepareModelForIndex( editClassModel, list.customClassCount + 1, fieldOpsClassNumIndex - 1, controller ),
							properties = {
								classNum = fieldOpsClassNumIndex - 1
							}
						} )
					end
				end
			end
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
			return list.classModels[index].models
		else
			
		end
	end,
	getCustomPropertiesForItem = function ( list, index )
		return list.classModels[index].properties
	end,
	getSpacerAfterRow = function ( list, row, widgetHeight )
		if row == list.customClassCount then
			return 20
		else
			return 0
		end
	end
}
DataSources.CustomClassMenu = {
	getModel = function ( controller )
		local classModel = CoD.perController[controller].classModel
		local customClassName = Engine.GetModelValue( Engine.GetModel( classModel, "customClassName" ) )
		local currentClassSetIndex = -1
		local classSetName = ""
		if IsClassSetsAvailableForCurrentGameMode() then
			classSetName = Engine.GetClassSetName( controller, Engine.GetCurrentClassSetIndex( controller ) )
		end
		local customClassMenuModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CustomClassMenu" )
		Engine.SetModelValue( Engine.CreateModel( customClassMenuModel, "currentClassName" ), customClassName )
		Engine.SetModelValue( Engine.CreateModel( customClassMenuModel, "currentClassSetName" ), classSetName )
		Engine.SetModelValue( Engine.CreateModel( classModel, "customClassOptionsHintText" ), "" )
		Engine.SetModelValue( Engine.CreateModel( classModel, "customClassSetName" ), classSetName )
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
	end
}
DataSources.ResetDefaultClass = {
	prepare = function ( controller, list, filter )
		list.resetDefaultClassList = {}
		local resetDefaultClass = Engine.CreateModel( Engine.GetModelForController( controller ), "ResetDefaultClassList" )
		for index = 1, CoD.CACUtility.maxDefaultClass, 1 do
			list.resetDefaultClassList[index] = Engine.CreateModel( resetDefaultClass, "DefaultClass" .. index )
			Engine.SetModelValue( Engine.CreateModel( list.resetDefaultClassList[index], "customClassName" ), Engine.Localize( "CLASS_SLOT" .. index ) )
			Engine.SetModelValue( Engine.CreateModel( list.resetDefaultClassList[index], "index" ), index )
		end
	end,
	getCount = function ( list )
		return #list.resetDefaultClassList
	end,
	getItem = function ( controller, list, index )
		return list.resetDefaultClassList[index]
	end
}
DataSources.PaintshopWeaponTabType = ListHelper_SetupDataSource( "Paintshop.PaintshopWeaponTabType", function ( controller )
	local tabList = {}
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for _, weaponGroup in ipairs( CoD.CraftUtility.WeaponGroupNames ) do
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
end )
DataSources.EmblemMaterialTabType = ListHelper_SetupDataSource( "Emblem.EmblemMaterialTabType", function ( controller )
	local tabList = {}
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for _, materialGroup in ipairs( CoD.CraftUtility.EmblemMaterialCategory ) do
		if materialGroup.type ~= "camo" or IsBooleanDvarSet( "enable_camo_materials_tab" ) then
			local breadcrumbCount = 0
			local totalMaterials = Engine.GetEmblemMaterialFilterCount( controller, materialGroup.category )
			for materialIndex = 0, totalMaterials - 1, 1 do
				local id = Engine.GetEmblemMaterialIDByIndex( controller, materialGroup.category, materialIndex )
				local isBMClassified = false
				if materialGroup.category == CoD.CraftUtility.EmblemBlackMarketEmblemCategory then
					local materialName = Engine.GetEmblemMaterialName( id )
					isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, materialName )
				end
				if not isBMClassified and CoD.CraftUtility.Emblems.IsMaterialNew( controller, id ) then
					breadcrumbCount = breadcrumbCount + 1
				end
			end
			if materialGroup.type == "general" then
				breadcrumbCount = 0
			end
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( materialGroup.name ),
					breadcrumbCount = breadcrumbCount
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
end )
DataSources.CACCustomizationTabs = DataSourceHelpers.ListSetup( "CACCustomizationTabs", function ( controller )
	local tabList = {}
	local f612_local0 = CoD.perController[controller].gunsmithCamoIndexModel
	if f612_local0 then
		f612_local0 = not CoD.perController[controller].editingWeaponBuildKits
	end
	local currentSessionMode = Engine.CurrentSessionMode()
	local weaponIndex = CoD.CACUtility.EmptyItemIndex
	if CoD.perController[controller].gunsmithCamoIndexModel or CoD.perController[controller].gunsmithReticleIndexModel or CoD.perController[controller].editingWeaponBuildKits then
		weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	else
		local classModel = CoD.perController[controller].classModel
		local slotName = CoD.perController[controller].weaponCategory
		weaponIndex = CoD.CACUtility.GetItemEquippedInSlot( slotName, controller, classModel )
	end
	local itemRef = ""
	if currentSessionMode < Enum.eModes.MODE_COUNT then
		itemRef = Engine.GetItemRef( weaponIndex, currentSessionMode )
	else
		itemRef = Engine.GetItemRef( weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	end
	local addModeTab = function ( tabName, filterEnum )
		local selectIndex = false
		if filterEnum < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
			if filterEnum == currentSessionMode then
				selectIndex = not f612_local0
			else
				selectIndex = false
			end
		end
		table.insert( tabList, {
			models = {
				tabName = tabName,
				tabIcon = "",
				breadcrumbCount = 0
			},
			properties = {
				filterEnum = filterEnum,
				filterString = CoD.WeaponOptionFilterToString( filterEnum ),
				selectIndex = selectIndex
			}
		} )
	end
	
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	if CoD.perController[controller].customizationType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
		addModeTab( "MENU_CAMPAIGN_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP )
		addModeTab( "MENU_MULTIPLAYER_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP )
		addModeTab( "MENU_ZOMBIES_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM )
		if IsLive() then
			addModeTab( "MENU_BLACK_MARKET", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM )
		end
	else
		if CoD.CACUtility.WeaponsWithNoCPCamos[itemRef] == nil then
			addModeTab( "MENU_CAMPAIGN_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP )
		end
		if not IsLive() or CoD.CACUtility.WeaponsWithNoMPCamos[itemRef] == nil then
			addModeTab( "MENU_MULTIPLAYER_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP )
		end
		if not IsLive() or CoD.CACUtility.WeaponsWithNoZMCamos[itemRef] == nil then
			addModeTab( "MENU_ZOMBIES_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM )
		end
		if IsLive() and CoD.BlackMarketUtility.WeaponsWithNoBMCamos[itemRef] == nil then
			addModeTab( "MENU_BLACK_MARKET", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM )
		end
	end
	addModeTab( "MENU_EXTRAS_CAPS", Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_EXTRAS )
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return tabList
end, false )
DataSources.GunsmithWeaponAttachments = ListHelper_SetupDataSource( "GunsmithWeaponAttachments", function ( controller )
	local attachments = {}
	local mode = CoD.CraftUtility.GetCraftMode()
	if CoD.perController[controller].gunsmithAttachmentIsZombieMode == "true" then
		mode = Enum.eModes.MODE_ZOMBIES
	end
	local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local numAttachments = Engine.GetNumAttachments( weaponItemIndex, mode )
	local attachmentType = CoD.perController[controller].gunsmithAttachmentType
	local variantAttachmentModel = CoD.perController[controller].gunsmithAttachmentModel
	local variantAttchmentIndex = Engine.GetModelValue( variantAttachmentModel )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local weaponRef = CoD.GetCustomization( controller, "weapon_ref" )
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
		if variantAttchmentIndex ~= attachmentSlotAttachmentIndex and CoD.CACUtility.EmptyItemIndex < attachmentSlotAttachmentIndex then
			local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentSlotAttachmentIndex )
			table.insert( equippedAttachmentRefList, attachmentRef )
			local damageStat = Engine.TableLookup( weaponAttributes, damageLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
			local rangeStat = Engine.TableLookup( weaponAttributes, rangeLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
			local fireRateStat = Engine.TableLookup( weaponAttributes, fireRateLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
			local accuracyStat = Engine.TableLookup( weaponAttributes, accuracyLookupEnum, refCol, attachmentRef, weaponRefCol, weaponRef )
			local f614_local2 = equippedAttachmentAttributes.damage
			local f614_local3
			if damageStat == "" then
				f614_local3 = 0
				if not f614_local3 then
				
				else
					equippedAttachmentAttributes.damage = f614_local2 + f614_local3
					f614_local2 = equippedAttachmentAttributes.range
					if rangeStat == "" then
						f614_local3 = 0
						if not f614_local3 then
						
						else
							equippedAttachmentAttributes.range = f614_local2 + f614_local3
							f614_local2 = equippedAttachmentAttributes.fireRate
							if fireRateStat == "" then
								f614_local3 = 0
								if not f614_local3 then
								
								else
									equippedAttachmentAttributes.fireRate = f614_local2 + f614_local3
									f614_local2 = equippedAttachmentAttributes.accuracy
									if accuracyStat == "" then
										f614_local3 = 0
										if not f614_local3 then
										
										else
											equippedAttachmentAttributes.accuracy = f614_local2 + f614_local3
										end
									end
									f614_local3 = accuracyStat
								end
							end
							f614_local3 = fireRateStat
						end
					end
					f614_local3 = rangeStat
				end
			end
			f614_local3 = damageStat
		end
	end
	local perControllerModel = Engine.GetModelForController( controller )
	for index = 1, numAttachments - 1, 1 do
		local attachmentIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
		local hintText = nil
		if IsToggleVariantEnabled() then
			hintText = Engine.Localize( "MENU_BUTTON_EMBLEM_ACV" )
		end
		if attachmentType == "attachment" then
			if Engine.IsOptic( weaponItemIndex, index, mode ) == false then
				attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index, mode )
			end
		elseif attachmentType == "optic" and Engine.IsOptic( weaponItemIndex, index, mode ) == true then
			hintText = nil
			attachmentIndex = Engine.GetItemAttachment( weaponItemIndex, index, mode )
		end
		if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < attachmentIndex then
			local attachmentAllocation = Engine.GetAttachmentAllocationCost( weaponItemIndex, index, mode )
			if attachmentAllocation > 0 then
				local fireRateStat = Engine.GetAttachmentRef( weaponItemIndex, index, mode )
				local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
				local attachmentImage = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, weaponItemIndex, attachmentIndex )
				local acvIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
				local unlockablesModel = Engine.GetModel( Engine.GetGlobalModel(), "CraftWeaponList" )
				if Enum.eModes.MODE_ZOMBIES == Engine.CurrentSessionMode() then
					CoD.CACUtility.GetUnlockablesTable( controller )
					unlockablesModel = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" )
				end
				local weaponAttributesModel = Engine.GetModel( unlockablesModel, weaponItemIndex .. ".weaponAttributes" )
				local getWeaponAttributeValues = function ( attributeName, attributeLookupEnum )
					local weaponAttributeValue = Engine.GetModelValue( Engine.GetModel( weaponAttributesModel, attributeName ) )
					local attachmentAttributeValue = Engine.TableLookup( weaponAttributes, attributeLookupEnum, refCol, fireRateStat, weaponRefCol, weaponRef )
					if weaponAttributeValue == "" then
						weaponAttributeValue = 0
					end
					if attachmentAttributeValue == "" then
						attachmentAttributeValue = 0
					end
					local isAttachmentEquipped = false
					for index, equippedAttachmentRef in ipairs( equippedAttachmentRefList ) do
						if equippedAttachmentRef == fireRateStat then
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
						},
						hintText = hintText
					},
					properties = {
						selectIndex = variantAttchmentIndex == attachmentIndex
					}
				}
				table.insert( attachments, attachmentInfo )
			end
		end
	end
	return attachments
end, true )
DataSources.GunsmithVariantList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
		if not weaponIndex then
			return 
		end
		list.variantListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.VariantList" )
		local allUsedVariants = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
		local usedWeaponVariants = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( weaponIndex )
		local maxAllowedVariants = CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints()
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
		Engine.SetModelValue( Engine.CreateModel( variantModel, "reticleIndex" ), variant.reticleIndex )
		local dataSourceName = "Gunsmith.VariantList.Variant" .. itemIndex .. "AttachmentList"
		DataSources[dataSourceName] = CoD.CraftUtility.Gunsmith.GetAttachmentIconList( controller, dataSourceName, weaponIndex, variant.attachment )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "listDataSource" ), dataSourceName )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "sortIndex" ), sortIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlot" ), variant.paintjobSlot )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobIndex" ), variant.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "camoIndex" ), variant.camoIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlotAndIndex" ), variant.paintjobSlot .. " " .. variant.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "hintText" ), Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
		if variant.readOnly ~= nil then
			Engine.SetModelValue( Engine.CreateModel( variantModel, "readOnly" ), variant.readOnly )
		end
	end,
	getItem = function ( controller, list, index )
		local variantModel = Engine.CreateModel( list.variantListModel, "variant_" .. index )
		local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, list.variantList[index].variantIndex )
		DataSources.GunsmithVariantList.createVariantModel( controller, index, variant, list.variantList[index].sortIndex, variantModel )
		return variantModel
	end
}
DataSources.GunsmithWeaponTabType = ListHelper_SetupDataSource( "Gunsmith.GunsmithWeaponTabType", function ( controller )
	local tabList = {}
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for _, weaponGroup in ipairs( CoD.CraftUtility.WeaponGroupNames ) do
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
end )
DataSources.GunsmithSelectedVariantAttachmentIconList = {
	getModel = function ( controller )
		local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
		local variantModel = CoD.perController[controller].gunsmithVariantModel
		local attachmentList = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( controller, variantModel )
		local selectedVariantAttachmentIconListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedVariantAttachmentIconList" )
		local dataSourceName = "Gunsmith.AttachmentIconList"
		DataSources[dataSourceName] = CoD.CraftUtility.Gunsmith.GetAttachmentIconList( controller, dataSourceName, weaponIndex, attachmentList.baseAttachmentList )
		Engine.SetModelValue( Engine.CreateModel( selectedVariantAttachmentIconListModel, "listDataSource" ), dataSourceName )
		return selectedVariantAttachmentIconListModel
	end
}
DataSources.GunsmithSelectedItemProperties = {
	getModel = function ( controller )
		local selectedItemPropertiesModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties" )
		Engine.SetModelValue( Engine.CreateModel( selectedItemPropertiesModel, "itemName" ), "" )
		Engine.SetModelValue( Engine.CreateModel( selectedItemPropertiesModel, "title" ), "" )
		Engine.SetModelValue( Engine.CreateModel( selectedItemPropertiesModel, "attachmentType" ), "" )
		return selectedItemPropertiesModel
	end
}
DataSources.FileshareRoot = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
		return model
	end
}
DataSources.FileshareSelectedItem = {
	getModel = function ( controller )
		return CoD.FileshareUtility.GetSelectedItem()
	end
}
DataSources.FileshareShowcaseManagerTabs = ListHelper_SetupDataSource( "FileshareShowcaseManagerTabs", function ( controller )
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
		local f625_local3 = fileshareTab.selectIndex
		local f625_local4 = fileshareTab.disabled
		if fileshareTab.fileshareCategory == selectedCategory then
			f625_local3 = true
			f625_local4 = false
		else
			f625_local3 = false
		end
		local locName = Engine.TableLookup( CoD.fileShareTable, 8, 1, fileshareTab.fileshareCategory )
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( locName .. "_CAPS" )
			},
			properties = {
				disabled = f625_local4,
				fileshareCategory = fileshareTab.fileshareCategory,
				fileshareKey = fileshareTab.fileshareKey,
				fileshareVal = fileshareTab.fileshareVal,
				selectIndex = f625_local3
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
end )
DataSources.FilesharePublishedPaintjobTabs = ListHelper_SetupDataSource( "FilesharePublishedPaintjobTabs", function ( controller )
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
end )
DataSources.FilesharePublishedVariantsTabs = ListHelper_SetupDataSource( "FilesharePublishedVariantsTabs", function ( controller )
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
end )
DataSources.EmblemDecalTabs = ListHelper_SetupDataSource( "EmblemDecalTabs", function ( controller )
	local tabList = {}
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	for tabIndex, decalData in ipairs( CoD.CraftUtility.EMBLEM_DECALTABS ) do
		local f628_local3 = 0
		local totalIcons = Engine.EmblemFilterCount( controller, 0, decalData.category )
		for f628_local4 = 0, totalIcons - 1, 1 do
			local id = Engine.EmblemFilterIconID( controller, 0, decalData.category, f628_local4 )
			local isBMClassified = false
			if decalData.type == "BLACKMARKET" then
				local imageName = CoD.BlackMarketUtility.GetLootDecalName( controller, id )
				isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, imageName )
			end
			if not isBMClassified and Engine.IsEmblemIconNew( controller, id ) then
				f628_local3 = f628_local3 + 1
			end
		end
		if decalData.type ~= "BLACKMARKET" then
			f628_local3 = 0
		end
		table.insert( tabList, {
			models = {
				tabName = Engine.Localize( decalData.displayName ),
				breadcrumbCount = f628_local3
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
end )
DataSources.EmblemCategoryTabs = ListHelper_SetupDataSource( "EmblemCategoryTabs", function ( controller )
	local tabList = {}
	if IsLive() then
		table.insert( tabList, {
			models = {
				tabIcon = CoD.buttonStrings.shoulderl
			},
			properties = {
				m_mouseDisabled = true
			}
		} )
		for tabIndex, categoryData in ipairs( CoD.CraftUtility.Emblems.CATEGORYTAB ) do
			local f629_local3 = 0
			local emblemCount = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( controller, categoryData.storageType )
			for f629_local4 = 0, emblemCount - 1, 1 do
				local isBMClassified = false
				if categoryData.storageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
					local emblemName = CoD.BlackMarketUtility.GetLootEmblemIDName( f629_local4 )
					isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, emblemName )
				end
				if not isBMClassified and CoD.CraftUtility.Emblems.IsEmblemNew( controller, f629_local4, categoryData.storageType ) then
					f629_local3 = f629_local3 + 1
				end
			end
			table.insert( tabList, {
				models = {
					tabName = Engine.Localize( categoryData.displayName ),
					breadcrumbCount = f629_local3
				},
				properties = {
					tabCategory = categoryData.category,
					tabType = categoryData.type,
					storageType = categoryData.storageType
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
	end
	return tabList
end )
DataSources.CustomGamesOptionsButtonList = ListHelper_SetupDataSource( "CustomGamesOptionsButtonList", function ( controller )
	local options = {}
	table.insert( options, {
		displayText = "MENU_PUBLISH",
		displayImage = "t7_icon_menu_simple_publish",
		displayDesc = "MENU_CUSTOMGAMES_PUBLISH_DESC",
		action = OpenCustomGamePublishPrompt,
		disabled = false
	} )
	table.insert( options, {
		displayText = "MENU_DELETE",
		displayImage = "t7_icon_menu_simple_delete",
		displayDesc = "MENU_CUSTOMGAMES_DELETE_DESC",
		action = DeleteCustomGame,
		disabled = false
	} )
	local buttons = {}
	for index, buttonData in ipairs( options ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.displayText ),
				icon = buttonData.displayImage,
				hintText = buttonData.displayDesc
			},
			properties = {
				action = buttonData.action,
				actionParam = buttonData.params
			}
		} )
	end
	return buttons
end )
DataSources.ScreenshotsOptionsButtonList = ListHelper_SetupDataSource( "ScreenshotsOptionsButtonList", function ( controller )
	local options = {}
	if FileshareCanPublish( controller ) then
		table.insert( options, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = "MENU_SCREENSHOTS_PUBLISH_DESC",
			action = OpenLocalScreenshotsPublishPrompt,
			disabled = false
		} )
	end
	if FileshareCanDeleteItem( controller ) then
		local deleteRef = "MENU_FILESHARE_DELETE_DESC"
		if FileshareIsLocalCategory( controller ) then
			deleteRef = "MENU_FILESHARE_DELETE_LOCAL_DESC"
		end
		table.insert( options, {
			displayText = "MENU_DELETE",
			displayImage = "t7_icon_menu_simple_delete",
			displayDesc = deleteRef,
			action = CoD.FileshareUtility.Delete
		} )
	end
	local buttons = {}
	for index, buttonData in ipairs( options ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.displayText ),
				icon = buttonData.displayImage,
				hintText = buttonData.displayDesc
			},
			properties = {
				action = buttonData.action,
				actionParam = buttonData.params
			}
		} )
	end
	return buttons
end )
DataSources.CustomGamesOptionsDeleteButtonList = {
	prepare = function ( controller, list, filter )
		local options = {
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
		local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesOptionsDeleteButtonList" ), "list" )
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
}
DataSources.CustomGamesLoadOptionsButtonList = {
	prepare = function ( controller, list, filter )
		list.optionModels = {}
		local options = {
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
		local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesLoadOptionsButtonList" ), "list" )
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
}
DataSources.CustomGamesRoot = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		return model
	end
}
DataSources.ChangeGameModeNav = {
	prepare = function ( controller, list, filter )
		local buttons = {
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
		local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ChangeGameModeNav" ), "list" )
		list.buttonModels = {}
		for index, buttonData in ipairs( buttons ) do
			list.buttonModels[index] = Engine.CreateModel( menuModel, "ChangeGameModeNavButton_" .. index )
			Engine.SetModelValue( Engine.CreateModel( list.buttonModels[index], "text" ), Engine.Localize( buttonData.text ) )
			Engine.SetModelValue( Engine.CreateModel( list.buttonModels[index], "image" ), buttonData.image )
			Engine.SetModelValue( Engine.CreateModel( list.buttonModels[index], "description" ), Engine.Localize( buttonData.description ) )
			Engine.SetModelValue( Engine.CreateModel( list.buttonModels[index], "community" ), buttonData.community )
		end
	end,
	getCount = function ( list )
		return #list.buttonModels
	end,
	getItem = function ( controller, list, index )
		return list.buttonModels[index]
	end
}
DataSources.ChangeGameModeNavSecondary = {
	prepare = function ( controller, list, filter )
		local buttons = {
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
		local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "ChangeGameModeNavSecondary" ), "list" )
		list.buttonModels = {}
		for index, buttonData in ipairs( buttons ) do
			list.buttonModels[index] = Engine.CreateModel( menuModel, "ChangeGameModeNavSecondaryButton_" .. index )
			Engine.SetModelValue( Engine.CreateModel( list.buttonModels[index], "text" ), Engine.Localize( buttonData.text ) )
			Engine.SetModelValue( Engine.CreateModel( list.buttonModels[index], "image" ), buttonData.image )
			Engine.SetModelValue( Engine.CreateModel( list.buttonModels[index], "description" ), Engine.Localize( buttonData.description ) )
			Engine.SetModelValue( Engine.CreateModel( list.buttonModels[index], "action" ), buttonData.action )
		end
	end,
	getCount = function ( list )
		return #list.buttonModels
	end,
	getItem = function ( controller, list, index )
		return list.buttonModels[index]
	end
}
DataSources.CustomGamesList = {
	prepare = function ( controller, list, filter )
		list.showDefault = true
		list.controller = controller
		list.rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		list.communityOptions = {
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
		local currentGameType = GetCurrentUIGameType( controller )
		if currentGameType == "" then
			local customGamesRoot = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
			local communityOption = Engine.GetModelValue( Engine.CreateModel( customGamesRoot, "communityOption" ) )
			local showcaseOption = Engine.GetModelValue( Engine.CreateModel( customGamesRoot, "showcaseOption" ) )
			if communityOption then
				list.numFiles = 3
				list.communityOption = true
			elseif showcaseOption then
				list.numFiles = 0
			end
		else
			list.officialGameCount = Engine.GetCustomGamesCount( controller, currentGameType, true )
			list.customGameCount = Engine.GetCustomGamesCount( controller, currentGameType, false )
			list.communityOption = false
			list.numFiles = list.officialGameCount + list.customGameCount
			if list.showDefault == true then
				list.numFiles = list.numFiles + 1
			end
		end
	end,
	getCount = function ( list )
		return list.numFiles
	end,
	getItem = function ( controller, list, index )
		local itemModel = Engine.CreateModel( list.rootModel, "CustomGames_" .. index )
		local gameType = GetCurrentUIGameType( controller )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "uiIndex" ), index )
		if list.communityOption == true then
			local communityData = list.communityOptions[index]
			Engine.SetModelValue( Engine.CreateModel( itemModel, "text" ), communityData.text )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "buttonText" ), communityData.text )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "image" ), communityData.image )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "description" ), communityData.description )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "action" ), communityData.action )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isOfficial" ), false )
			return itemModel
		elseif list.showDefault == true and index == 1 then
			local gameModes = Engine.GetGametypesBase()
			local currentGameMode = GetCurrentUIGameType( controller )
			local gameName = ""
			for index, gameMode in pairs( gameModes ) do
				if gameMode.category == "standard" and gameMode.gametype == currentGameMode then
					gameName = "^BBUTTON_CUSTOMGAME_ICON^ " .. Engine.Localize( gameMode.name )
					break
				end
			end
			Engine.SetModelValue( Engine.CreateModel( itemModel, "text" ), gameName )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "buttonText" ), gameName )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "inUse" ), true )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isOfficial" ), true )
			if gameType then
				local gameTypeInfo = Engine.GetGameTypeInfo( gameType )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "description" ), Engine.Localize( gameTypeInfo.descriptionRef ) )
			end
		else
			local indexDelta = 1
			if list.showDefault == true then
				indexDelta = 2
			end
			local adjustedIndex = index - indexDelta
			local isOfficial = false
			if adjustedIndex < list.officialGameCount then
				isOfficial = true
			else
				adjustedIndex = adjustedIndex - list.officialGameCount
			end
			local data = Engine.GetCustomGameData( controller, adjustedIndex, GetCurrentUIGameType( controller ), isOfficial )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "slot" ), data.slot )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "index" ), data.index )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "gameName" ), data.gameName )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "inUse" ), data.inUse )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isOfficial" ), data.isOfficial )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "createTime" ), data.createTime )
			if data.isOfficial then
				Engine.SetModelValue( Engine.CreateModel( itemModel, "text" ), "^BBUTTON_CUSTOMGAME_ICON^ " .. Engine.Localize( data.gameName ) )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "buttonText" ), "^BBUTTON_CUSTOMGAME_ICON^ " .. Engine.Localize( data.gameName ) )
			else
				Engine.SetModelValue( Engine.CreateModel( itemModel, "text" ), data.gameName )
				Engine.SetModelValue( Engine.CreateModel( itemModel, "buttonText" ), data.gameName )
			end
			Engine.SetModelValue( Engine.CreateModel( itemModel, "gameTypeString" ), data.gameTypeString )
			if gameType then
				if data.isOfficial then
					Engine.SetModelValue( Engine.CreateModel( itemModel, "description" ), Engine.Localize( data.gameDescription ) )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "gameDescription" ), Engine.Localize( data.gameDescription ) )
				else
					Engine.SetModelValue( Engine.CreateModel( itemModel, "description" ), data.gameDescription )
					Engine.SetModelValue( Engine.CreateModel( itemModel, "gameDescription" ), data.gameDescription )
				end
			end
		end
		if gameType then
			local gameTypeInfo = Engine.GetGameTypeInfo( gameType )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "gametype" ), gameType )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "image" ), gameTypeInfo.image )
		end
		return itemModel
	end
}
DataSources.MediaManagerQuotaList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		list.rootModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerQuota" )
		list.numFileshareCategories = GetMediaManagerCategoryCount()
	end,
	getCount = function ( list )
		return list.numFileshareCategories
	end,
	getItem = function ( controller, list, index )
		local itemModel = Engine.CreateModel( list.rootModel, "fileshareCategory_" .. index )
		local category = Engine.TableGetColumnValueForRow( CoD.fileShareTable, index - 1, 1 )
		local quota = Engine.MediaManagerGetQuota( list.controller, category )
		local fraction = 0
		local slotsFull = 0
		if quota.categoryQuota > 0 then
			fraction = quota.categorySlotsUsed / quota.categoryQuota
		end
		if fraction > 1 then
			fraction = 1
		elseif fraction < 0 then
			fraction = 0
		end
		if fraction == 1 then
			slotsFull = 1
		end
		Engine.SetModelValue( Engine.CreateModel( itemModel, "category" ), quota.category )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "locName" ), Engine.TableLookup( CoD.fileShareTable, 8, 1, quota.category ) )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "quota" ), quota.categoryQuota )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "slotsUsed" ), quota.categorySlotsUsed )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "fraction" ), fraction )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "image" ), CoD.FileshareUtility.GetCategoryImage( category ) )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "barColor" ), CoD.FileshareUtility.GetCategoryColor( category ) )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "slotsFull" ), slotsFull )
		if quota.category == CoD.FileshareUtility.GetCurrentCategory() then
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isDim" ), false )
		else
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isDim" ), true )
		end
		return itemModel
	end
}
DataSources.FileshareQuotaList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		list.rootModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareQuota" )
		list.numFileshareCategories = GetMediaManagerCategoryCount()
	end,
	getCount = function ( list )
		return list.numFileshareCategories
	end,
	getItem = function ( controller, list, index )
		local itemModel = Engine.CreateModel( list.rootModel, "fileshareCategory_" .. index )
		local category = Engine.TableGetColumnValueForRow( CoD.fileShareTable, index - 1, 1 )
		local quota = Engine.FileshareGetQuota( list.controller, category )
		local fraction = 0
		local slotsFull = 0
		if quota.categoryQuota > 0 then
			fraction = quota.categorySlotsUsed / quota.categoryQuota
		end
		if fraction > 1 then
			fraction = 1
		elseif fraction < 0 then
			fraction = 0
		end
		if fraction == 1 then
			slotsFull = 1
		end
		Engine.SetModelValue( Engine.CreateModel( itemModel, "category" ), quota.category )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "locName" ), Engine.TableLookup( CoD.fileShareTable, 8, 1, quota.category ) )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "quota" ), quota.categoryQuota )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "slotsUsed" ), quota.categorySlotsUsed )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "fraction" ), fraction )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "image" ), CoD.FileshareUtility.GetCategoryImage( category ) )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "barColor" ), CoD.FileshareUtility.GetCategoryColor( category ) )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "slotsFull" ), slotsFull )
		if quota.category == CoD.FileshareUtility.GetCurrentCategory() then
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isDim" ), false )
		else
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isDim" ), true )
		end
		return itemModel
	end
}
DataSources.FilesharePublishedList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
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
			CoD.FileshareUtility.ResetFileshareSummary( list.fileshareData[i].elementModel )
		end
		Engine.FileshareStartup( list.controller )
		CoD.FileshareUtility.SetShowFileDetails( false )
	end,
	getCount = function ( list )
		list.itemsCount = 0
		if list.numElements == nil then
			CoD.FileshareUtility.SetItemsCount( list.controller, 0 )
			return 0
		end
		local checkForFileshareReady = true
		local category = CoD.FileshareUtility.GetCurrentCategory()
		if category == "film" or category == "recentgames" then
			local downloadProgress = Engine.GetDemoStreamedDownloadProgress()
			if downloadProgress > 0 and downloadProgress < 100 then
				checkForFileshareReady = false
			end
		end
		if checkForFileshareReady and not Engine.FileshareIsReady( list.controller ) then
			if not list.refreshElement then
				list.refreshElement = LUI.UITimer.newElementTimer( 500, false, function ()
					if Engine.FileshareIsReady( list.controller ) then
						list:updateDataSource()
						list.refreshElement:close()
						list.refreshElement = nil
					end
				end )
				list:addElement( list.refreshElement )
			end
			CoD.FileshareUtility.SetItemsCount( list.controller, 0 )
			return 0
		end
		local category = CoD.FileshareUtility.GetCurrentCategory()
		local isCommunityMode = CoD.FileshareUtility.GetIsCommunityMode( list.controller )
		local key, val = CoD.FileshareUtility.GetCurrentFilter()
		if category == nil then
			CoD.FileshareUtility.SetItemsCount( list.controller, 0 )
			return 0
		end
		local count = 0
		if isCommunityMode or CoD.FileshareUtility.GetIsGroupsMode( list.controller ) or category == "recentgames" then
			if category == "recentgames" then
				count = Engine.FileshareGetTotalUsedCommunitySlotCount( list.controller, "film", key, val )
			else
				count = Engine.FileshareGetTotalUsedCommunitySlotCount( list.controller, category, key, val )
			end
		else
			count = Engine.FileshareGetSlotCount( list.controller, category, key, val )
		end
		CoD.FileshareUtility.SetItemsCount( list.controller, count )
		if list.hasCreateButton == true then
			return count + 1
		end
		list.itemsCount = count
		return count
	end,
	getItem = function ( controller, list, index )
		local codeIndex = index - 1
		local modelIndex = codeIndex % list.numElements + 1
		local testIndex = index % list.numElements
		if list.hasCreateButton == true then
			codeIndex = codeIndex - 1
		end
		local isPublishNewModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "isPublishNew" )
		local showPlusImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "showPlusImage" )
		local showFileImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "showFileImage" )
		local plusImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "plusImageSrc" )
		local fileImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "fileImage" )
		local fileIdModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "fileId" )
		local renderFileIdModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "renderFileId" )
		local gameTypeModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "gameType" )
		local gameTypeImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "gameTypeImage" )
		local showGameTypeImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "showGameTypeImage" )
		local customGameSlotModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "slot" )
		local customGameIndexModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "index" )
		local mapNameModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "mapName" )
		local durationModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "duration" )
		local uiModelIndexModel = Engine.CreateModel( list.fileshareData[modelIndex].elementModel, "uiModelIndex" )
		Engine.SetModelValue( uiModelIndexModel, modelIndex )
		local codeIndexModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "codeIndex" )
		Engine.SetModelValue( codeIndexModel, codeIndex )
		local totalItemsModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "totalItems" )
		Engine.SetModelValue( totalItemsModel, list.itemsCount )
		local showDetailsViewSpinnerModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "showDetailsViewSpinner" )
		Engine.SetModelValue( showDetailsViewSpinnerModel, 0 )
		Engine.SetModelValue( fileIdModel, nil )
		if list.hasCreateButton == true and index == 1 then
			Engine.SetModelValue( isPublishNewModel, true )
			Engine.SetModelValue( showPlusImageModel, 1 )
			Engine.SetModelValue( fileImageModel, "" )
			Engine.SetModelValue( showFileImageModel, 0 )
			Engine.SetModelValue( renderFileIdModel, 0 )
			Engine.SetModelValue( plusImageModel, "uie_t7_icon_codpoints" )
			Engine.SetModelValue( durationModel, 0 )
			Engine.SetModelValue( mapNameModel, "" )
			Engine.SetModelValue( showGameTypeImageModel, 0 )
			Engine.SetModelValue( gameTypeImageModel, "" )
			local inShowcaseManager = CoD.FileshareUtility.GetInShowcaseManager( controller )
			local fileNameModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "fileName" )
			if inShowcaseManager and inShowcaseManager == true then
				Engine.SetModelValue( fileNameModel, "MENU_FILESHARE_BUY_SLOTS" )
			else
				Engine.SetModelValue( fileNameModel, Engine.Localize( "MENU_FILESHARE_PUBLISH_NEW" ) )
			end
		else
			Engine.SetModelValue( isPublishNewModel, false )
			Engine.SetModelValue( fileImageModel, "" )
			Engine.SetModelValue( showPlusImageModel, 0 )
			local category = CoD.FileshareUtility.GetCurrentCategory()
			local isCommunityMode = CoD.FileshareUtility.GetIsCommunityMode( list.controller )
			local key, val = CoD.FileshareUtility.GetCurrentFilter()
			if category == "recentgames" or category == "film" or category == "customgame" then
				Engine.SetModelValue( showGameTypeImageModel, 1 )
			else
				Engine.SetModelValue( showGameTypeImageModel, 0 )
			end
			if category == "clip" or category == "clip_private" or category == "recentgames" or category == "film" or category == "customgame" then
				Engine.SetModelValue( showFileImageModel, 0 )
			else
				Engine.SetModelValue( showFileImageModel, 1 )
			end
			local slotData = nil
			if isCommunityMode or CoD.FileshareUtility.GetIsGroupsMode( list.controller ) or category == "recentgames" then
				if category == "recentgames" then
					slotData = Engine.FileshareGetCommunitySlotData( list.controller, "film", key, val, codeIndex )
				else
					slotData = Engine.FileshareGetCommunitySlotData( list.controller, category, key, val, codeIndex )
				end
			else
				slotData = Engine.FileshareGetSlotData( list.controller, category, key, val, codeIndex )
			end
			for _, val in ipairs( CoD.FileshareUtility.FileProperties ) do
				if slotData[val] ~= nil then
					local valueModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, val )
					Engine.SetModelValue( valueModel, slotData[val] )
				end
			end
			local weaponIndex = Engine.GetFileshareWeaponIndex( controller, slotData.fileId )
			local weaponName = ""
			if slotData.weaponIndex ~= nil and slotData.weaponIndex ~= 0 then
				weaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( slotData.weaponIndex ) ) )
				local weaponNameModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "weaponName" )
				Engine.SetModelValue( weaponNameModel, weaponName )
			end
			CoD.FileshareUtility.SetupDefaultNameAndDescription( list.fileshareData[modelIndex].elementModel )
			CoD.FileshareUtility.SetCategoryCurrentPage( controller, category, codeIndex )
			if category == "screenshot_private" or category == "screenshot" or category == "clip_private" or category == "clip" then
				Engine.AddThumbnail( controller, Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_THUMBNAIL, slotData.fileId, slotData.fileSummarySize )
			end
			if slotData.isValid == false then
				Engine.SetModelValue( showGameTypeImageModel, 0 )
			end
			local handleButtonAction = function ( self, element, controller, param, menu )
				if CoD.FileshareUtility.IsCategoryFilm( controller, element ) or CoD.FileshareUtility.IsCategoryClip( controller, element ) then
					if not IsInTheaterMode() then
						LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_FILESHARE_PLAY_ONLY_IN_THEATER" )
						Engine.SendClientScriptNotify( controller, "menu_change" .. Engine.GetLocalClientNum( controller ), {
							menu = "Main",
							status = "closeToMenu"
						} )
					else
						local mainMode = Engine.GetModelValue( Engine.GetModel( element:getModel(), "mainMode" ) )
						if mainMode ~= Engine.CurrentSessionMode() then
							local errorText = ""
							if mainMode == Enum.eModes.MODE_ZOMBIES then
								errorText = Engine.Localize( "MENU_FILESHARE_PLAY_ONLY_IN_SPECIFIC_MODE", "MENU_ZOMBIE" )
							else
								errorText = Engine.Localize( "MENU_FILESHARE_PLAY_ONLY_IN_SPECIFIC_MODE", "MENU_MULTIPLAYER" )
							end
							LuaUtils.UI_ShowErrorMessageDialog( controller, errorText )
							Engine.SendClientScriptNotify( controller, "menu_change" .. Engine.GetLocalClientNum( controller ), {
								menu = "Main",
								status = "closeToMenu"
							} )
						else
							CoD.FileshareUtility.LoadTheaterFile( self, element, controller, param, menu )
							if menu.menuName == "Theater_SelectFilm" then
								Close( self, controller )
							else
								GoBackToMenu( menu, controller, "Lobby" )
								Engine.SendClientScriptNotify( controller, "menu_change" .. Engine.GetLocalClientNum( controller ), {
									menu = "Main",
									status = "closeToMenu"
								} )
							end
						end
					end
				elseif CoD.FileshareUtility.GetCurrentCategory() == "customgame" then
					if IsCustomMPLobby() then
						OpenOverlay( self, "CustomGamesLoadFileshareItem", controller )
					else
						LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CUSTOMGAMES_CANNOT_VIEW_DESC" )
					end
				else
					FileshareSetSelectedItem( self, element, controller, "true" )
					if FileshareCanOpenDetailsView( element, controller ) == true then
						FileshareOpenFullscreenView( self, element, controller, menu )
					end
				end
			end
			
			Engine.SetModelValue( Engine.CreateModel( list.fileshareData[modelIndex].elementModel, "action" ), handleButtonAction )
		end
		return list.fileshareData[modelIndex].elementModel
	end
}
DataSources.FileshareCommunityList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		list.hasCreateButton = false
		list.numElements = list.vCount * list.hCount
		list.fileshareRootModel = Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot" )
		list.fileshareData = {}
		for i = 1, list.numElements, 1 do
			list.fileshareData[i] = {}
			list.fileshareData[i].elementModel = Engine.CreateModel( list.fileshareRootModel, "fileshareData_community_" .. i )
			for _, val in ipairs( CoD.FileshareUtility.FileProperties ) do
				Engine.CreateModel( list.fileshareData[i].elementModel, val )
			end
			CoD.FileshareUtility.ResetFileshareSummary( list.fileshareData[i].elementModel )
		end
		CoD.FileshareUtility.SetItemsCount( list.controller, list.numElements )
		Engine.FileshareStartup( list.controller )
		CoD.FileshareUtility.SetShowFileDetails( false )
		CoD.FileshareUtility.SetShowPublishNewDetails( false )
	end,
	getCount = function ( list )
		local checkForFileshareReady = true
		local category = CoD.FileshareUtility.GetCurrentCategory()
		list.itemsCount = 0
		if category == "film" or category == "recentgames" then
			local downloadProgress = Engine.GetDemoStreamedDownloadProgress()
			if downloadProgress > 0 and downloadProgress < 100 then
				checkForFileshareReady = false
			end
		end
		if checkForFileshareReady and not Engine.FileshareIsReady( list.controller ) then
			CoD.FileshareUtility.SetItemsCount( list.controller, 0 )
			return 0
		else
			local key, val = CoD.FileshareUtility.GetCurrentFilter()
			if category == nil then
				CoD.FileshareUtility.SetItemsCount( list.controller, 0 )
				return 0
			else
				local count = Engine.FileshareGetTotalUsedCommunitySlotCount( list.controller, category, key, val )
				CoD.FileshareUtility.SetItemsCount( list.controller, count )
				list.itemsCount = count
				return count
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
		local fileIdModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "fileId" )
		local renderFileIdModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "renderFileId" )
		local showGameTypeImageModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "showGameTypeImage" )
		local codeIndexModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "codeIndex" )
		Engine.SetModelValue( codeIndexModel, codeIndex )
		local uiModelIndexModel = Engine.CreateModel( list.fileshareData[modelIndex].elementModel, "uiModelIndex" )
		Engine.SetModelValue( uiModelIndexModel, modelIndex )
		local totalItemsModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "totalItems" )
		Engine.SetModelValue( totalItemsModel, list.itemsCount )
		local showDetailsViewSpinnerModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "showDetailsViewSpinner" )
		Engine.SetModelValue( showDetailsViewSpinnerModel, 0 )
		Engine.SetModelValue( isPublishNewModel, false )
		Engine.SetModelValue( fileImageModel, "" )
		Engine.SetModelValue( showPlusImageModel, 0 )
		Engine.SetModelValue( renderFileIdModel, 0 )
		local category = CoD.FileshareUtility.GetCurrentCategory()
		local key, val = CoD.FileshareUtility.GetCurrentFilter()
		if category == "clip" or category == "clip_private" or category == "recentgames" or category == "film" or category == "customgame" then
			Engine.SetModelValue( showFileImageModel, 0 )
		else
			Engine.SetModelValue( showFileImageModel, 1 )
		end
		local slotData = Engine.FileshareGetCommunitySlotData( list.controller, category, key, val, codeIndex )
		for _, val in ipairs( CoD.FileshareUtility.FileProperties ) do
			if slotData[val] ~= nil then
				local valueModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, val )
				Engine.SetModelValue( valueModel, slotData[val] )
			end
		end
		if category == "customgame" then
			Engine.SetModelValue( showGameTypeImageModel, 1 )
		else
			Engine.SetModelValue( showGameTypeImageModel, 0 )
		end
		local weaponName = ""
		if slotData.weaponIndex ~= nil and slotData.weaponIndex ~= 0 then
			weaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( slotData.weaponIndex ) ) )
			local weaponNameModel = Engine.GetModel( list.fileshareData[modelIndex].elementModel, "weaponName" )
			Engine.SetModelValue( weaponNameModel, weaponName )
		end
		CoD.FileshareUtility.SetupDefaultNameAndDescription( list.fileshareData[modelIndex].elementModel )
		CoD.FileshareUtility.SetCategoryCurrentPage( controller, category, codeIndex )
		local handleButtonAction = function ( self, element, controller, param, menu )
			if CoD.FileshareUtility.IsCategoryFilm( controller, element ) or CoD.FileshareUtility.IsCategoryClip( controller, element ) then
				if not IsInTheaterMode() then
					LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_FILESHARE_PLAY_ONLY_IN_THEATER" )
				else
					local mainMode = Engine.GetModelValue( Engine.GetModel( element:getModel(), "mainMode" ) )
					if mainMode ~= Engine.CurrentSessionMode() then
						local errorText = ""
						if mainMode == Enum.eModes.MODE_ZOMBIES then
							errorText = Engine.Localize( "MENU_FILESHARE_PLAY_ONLY_IN_SPECIFIC_MODE", "MENU_ZOMBIE" )
						else
							errorText = Engine.Localize( "MENU_FILESHARE_PLAY_ONLY_IN_SPECIFIC_MODE", "MENU_MULTIPLAYER" )
						end
						LuaUtils.UI_ShowErrorMessageDialog( controller, errorText )
					else
						CoD.FileshareUtility.LoadTheaterFile( self, element, controller, param, menu )
						Close( self, controller )
					end
				end
			elseif CoD.FileshareUtility.GetCurrentCategory() == "customgame" then
				if IsCustomMPLobby() then
					OpenOverlay( self, "CustomGamesLoadFileshareItem", controller )
				else
					LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_CUSTOMGAMES_CANNOT_VIEW_DESC" )
				end
			else
				FileshareSetSelectedItem( self, element, controller, "true" )
				if FileshareCanOpenDetailsView( element, controller ) == true then
					FileshareOpenFullscreenView( self, element, controller, menu )
				end
			end
		end
		
		if category == "screenshot_private" or category == "screenshot" or category == "clip_private" or category == "clip" then
			Engine.AddThumbnail( controller, Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_THUMBNAIL, slotData.fileId, slotData.fileSummarySize )
		end
		Engine.SetModelValue( Engine.CreateModel( list.fileshareData[modelIndex].elementModel, "action" ), handleButtonAction )
		return list.fileshareData[modelIndex].elementModel
	end
}
DataSources.ShowcasePaintjobList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		local category = CoD.FileshareUtility.GetCurrentCategory()
		local key, weaponGroup = CoD.FileshareUtility.GetCurrentFilter()
		CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
		list.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.PaintjobList" )
		local allUsedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
		if weaponGroup ~= "" then
			allUsedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobsByWeaponGroup( weaponGroup )
		end
		list.totalPaintjobs = allUsedPaintjobs
		list.paintjobList = {}
		list.paintjobList = CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList( nil, weaponGroup )
	end,
	getCount = function ( list )
		return list.totalPaintjobs
	end,
	getItem = function ( controller, list, index )
		local paintjobModel = Engine.CreateModel( list.paintjobListModel, "paintjob_" .. index )
		local paintjob = list.paintjobList[index]
		if paintjob then
			if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( paintjob.paintjobSlot, paintjob.paintjobIndex ) then
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobName" ), paintjob.paintjobName )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobTextEntry" ), paintjob.paintjobName )
			else
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobTextEntry" ), "Paintjob" )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobName" ), "" )
			end
			if paintjob.readOnly ~= nil then
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "readOnly" ), paintjob.readOnly )
			end
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "sortIndex" ), paintjob.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobSlot" ), paintjob.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "weaponIndex" ), paintjob.weaponIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobIndex" ), paintjob.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobSlotAndIndex" ), paintjob.paintjobSlot .. " " .. paintjob.paintjobIndex )
			return paintjobModel
		else
			
		end
	end
}
DataSources.ShowcaseVariantList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		local category = CoD.FileshareUtility.GetCurrentCategory()
		local key, weaponGroup = CoD.FileshareUtility.GetCurrentFilter()
		CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
		list.variantListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.VariantList" )
		local allUsedVariants = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
		if weaponGroup ~= "" then
			allUsedVariants = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariantsByWeaponGroup( weaponGroup )
		end
		list.totalVariants = allUsedVariants
		list.variantList = {}
		list.variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( nil, weaponGroup )
	end,
	getCount = function ( list )
		return list.totalVariants
	end,
	createVariantModel = function ( controller, itemIndex, variant, sortIndex, variantModel )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "variantIndex" ), variant.variantIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "weaponIndex" ), variant.weaponIndex )
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
		Engine.SetModelValue( Engine.CreateModel( variantModel, "reticleIndex" ), variant.reticleIndex )
		local dataSourceName = "Gunsmith.VariantList.Variant" .. itemIndex .. "AttachmentList"
		DataSources[dataSourceName] = CoD.CraftUtility.Gunsmith.GetAttachmentIconList( controller, dataSourceName, variant.weaponIndex, variant.attachment )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "listDataSource" ), dataSourceName )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "sortIndex" ), sortIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlot" ), variant.paintjobSlot )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobIndex" ), variant.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "camoIndex" ), variant.camoIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlotAndIndex" ), variant.paintjobSlot .. " " .. variant.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "hintText" ), Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
		if variant.readOnly ~= nil then
			Engine.SetModelValue( Engine.CreateModel( variantModel, "readOnly" ), variant.readOnly )
		end
	end,
	getItem = function ( controller, list, index )
		local variantModel = Engine.CreateModel( list.variantListModel, "variant_" .. index )
		local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, list.variantList[index].variantIndex )
		DataSources.ShowcaseVariantList.createVariantModel( controller, index, variant, list.variantList[index].sortIndex, variantModel )
		return variantModel
	end
}
DataSources.FileshareCategoriesList = {
	prepare = function ( controller, list, filter )
		local options = {
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
				displayImage = "t7_icon_menu_simple_media_manager",
				hintText = "MENU_FILESHARE_SHOWCASE_FILMS_DESC",
				category = "recentgames",
				communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT,
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
		local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareCategoriesList" ), "list" )
		list.optionModels = {}
		for index, buttonData in ipairs( options ) do
			list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.hintText ) )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "category" ), buttonData.category )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "disabled" ), buttonData.disabled )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "tabWidget" ), buttonData.tabWidget )
			if buttonData.communityDataType then
				Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "communityDataType" ), buttonData.communityDataType )
			end
		end
	end,
	getCount = function ( list )
		return #list.optionModels
	end,
	getItem = function ( controller, list, index )
		return list.optionModels[index]
	end
}
DataSources.FileshareCommunityCategoriesList = {
	prepare = function ( controller, list, filter )
		local options = {}
		table.insert( options, {
			displayText = "GROUPS_PAINTJOBS_CAPS",
			displayImage = "uie_t7_mp_icon_header_paintshop",
			hintText = "MENU_FILESHARE_COMMUNITY_PAINTJOBS_DESC",
			category = "paintjob",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( options, {
			displayText = "MENU_VARIANTS_CAPS",
			displayImage = "uie_t7_mp_icon_header_gunsmith",
			hintText = "MENU_FILESHARE_COMMUNITY_VARIANTS_DESC",
			category = "variant",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( options, {
			displayText = "MENU_EMBLEMS_CAPS",
			displayImage = "uie_t7_mp_icon_header_emblem",
			hintText = "MENU_FILESHARE_COMMUNITY_EMBLEMS_DESC",
			category = "emblem",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( options, {
			displayText = "MENU_CUSTOMGAMES_CAPS",
			displayImage = "uie_t7_mp_icon_header_customgames",
			hintText = "MENU_FILESHARE_COMMUNITY_CUSTOMGAMES_DESC",
			category = "customgame",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( options, {
			displayText = "MENU_SCREENSHOTS",
			displayImage = "uie_t7_mp_icon_header_screenshot",
			hintText = "MENU_FILESHARE_COMMUNITY_SCREENSHOTS_DESC",
			category = "screenshot",
			disabled = false,
			tabWidget = "CoD.FileshareScreenshotsContentList"
		} )
		table.insert( options, {
			displayText = "MENU_FILESHARE_CLIPS_CAPS",
			displayImage = "t7_icon_menu_simple_clips",
			hintText = "MENU_FILESHARE_COMMUNITY_CLIPS_DESC",
			category = "clip",
			disabled = false,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareCategoriesList" ), "list" )
		list.optionModels = {}
		for index, buttonData in ipairs( options ) do
			list.optionModels[index] = Engine.CreateModel( menuModel, "community_buttonModel_" .. index )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.hintText ) )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "category" ), buttonData.category )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "disabled" ), buttonData.disabled )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "tabWidget" ), buttonData.tabWidget )
		end
	end,
	getCount = function ( list )
		return #list.optionModels
	end,
	getItem = function ( controller, list, index )
		return list.optionModels[index]
	end
}
DataSources.FileshareMyTheaterCategoriesList = {
	prepare = function ( controller, list, filter )
		local options = {}
		table.insert( options, {
			displayText = "MENU_FILESHARE_RECENTGAMES_CAPS",
			displayImage = "uie_t7_icon_menu_simple_media_recent",
			hintText = "MENU_FILESHARE_RECENTGAMES_DESC",
			category = "recentgames",
			communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		table.insert( options, {
			displayText = "MENU_FILESHARE_CLIPS_CAPS",
			displayImage = "t7_icon_menu_simple_clips",
			hintText = "MENU_FILESHARE_CLIPS_DESC",
			category = "clip_private",
			communityDataType = Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_INVALID,
			tabWidget = "CoD.FileshareCategoryContentList"
		} )
		local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareMyTheaterCategoriesList" ), "list" )
		list.optionModels = {}
		for index, buttonData in ipairs( options ) do
			list.optionModels[index] = Engine.CreateModel( menuModel, "buttonModel_" .. index )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.Localize( buttonData.displayText ) )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.hintText ) )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "category" ), buttonData.category )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "communityDataType" ), buttonData.communityDataType )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "disabled" ), buttonData.disabled )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "tabWidget" ), buttonData.tabWidget )
		end
	end,
	getCount = function ( list )
		return #list.optionModels
	end,
	getItem = function ( controller, list, index )
		return list.optionModels[index]
	end
}
DataSources.FileshareOptionsButtonList = ListHelper_SetupDataSource( "FileshareOptionsButtonList", function ( controller )
	local options = {}
	local isLocalCategory = FileshareIsLocalCategory( controller )
	if isLocalCategory and CoD.FileshareUtility.GetCurrentCategory() == "clip_private" then
		table.insert( options, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = "MENU_CLIP_PUBLISH_DESC",
			action = OpenLocalClipPublishPrompt
		} )
	end
	if not isLocalCategory and FilesshareCanShowVoteOptions( controller ) then
		table.insert( options, {
			displayText = "MENU_FILESHARE_LIKE",
			displayImage = "uie_t7_icon_menu_options_like",
			displayDesc = "MENU_FILESHARE_LIKE_DESC",
			action = CoD.FileshareUtility.ReportLike
		} )
		table.insert( options, {
			displayText = "MENU_FILESHARE_DISLIKE",
			displayImage = "uie_t7_icon_menu_options_dislike",
			displayDesc = "MENU_FILESHARE_DISLIKE_DESC",
			action = CoD.FileshareUtility.ReportDislike
		} )
	end
	if not isLocalCategory and FileshareCanDownloadItem( controller ) then
		table.insert( options, {
			displayText = "MENU_FILESHARE_DOWNLOAD",
			displayImage = "t7_icon_menu_options_download",
			displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
			action = CoD.FileshareUtility.DownloadAction
		} )
	end
	if FileshareCanDeleteItem( controller ) then
		local deleteRef = "MENU_FILESHARE_DELETE_DESC"
		if isLocalCategory then
			deleteRef = "MENU_FILESHARE_DELETE_LOCAL_DESC"
		end
		table.insert( options, {
			displayText = "MENU_DELETE",
			displayImage = "t7_icon_menu_simple_delete",
			displayDesc = deleteRef,
			action = CoD.FileshareUtility.Delete
		} )
	end
	if not isLocalCategory and FileshareCanShowPlayerDetails( controller ) then
		table.insert( options, {
			displayText = "MPUI_PLAYER_DETAILS",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_FILESHARE_PLAYER_DETAILS_DESC",
			action = ShowcaseOpenPlayerDetails
		} )
	end
	local selectedGamertag = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorName" )
	local selectedXuid = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	if not isLocalCategory and selectedXuid ~= Engine.GetXUID64( controller ) then
		local playerInfo = Engine.GetPlayerInfo( controller, selectedXuid )
		table.insert( options, {
			displayText = "MENU_REPORT_PLAYER",
			displayImage = "uie_t7_icon_error_overlays",
			displayDesc = "MENU_REPORT_PLAYER_DESC",
			action = ShowReportPlayerDialog,
			params = {
				controller = controller,
				gamertag = selectedGamertag,
				xuid = selectedXuid
			},
			lastInGroup = false
		} )
	end
	if isLocalCategory then
		
	elseif FileshareCanShowShowcaseManager( controller ) then
		table.insert( options, {
			displayText = "MENU_FILESHARE_SHOWCASE_MANAGER",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_FILESHARE_MEDIA_MANAGER_DESC",
			action = CoD.FileshareUtility.OpenShowcaseManager
		} )
	end
	local buttons = {}
	for index, buttonData in ipairs( options ) do
		table.insert( buttons, {
			models = {
				displayText = Engine.Localize( buttonData.displayText ),
				icon = buttonData.displayImage,
				hintText = buttonData.displayDesc
			},
			properties = {
				action = buttonData.action,
				actionParam = buttonData.params
			}
		} )
	end
	return buttons
end )
DataSources.FileshareOptionsDeleteButtonList = {
	prepare = function ( controller, list, filter )
		local options = {
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
}
DataSources.FileshareSlotsFullButtonList = {
	prepare = function ( controller, list, filter )
		local options = {}
		if FileshareShowcaseSlotsAvailable( controller ) == false then
			if Engine.IsDemoPlaying() then
				
			else
				table.insert( options, {
					displayText = "MENU_FILESHARE_SHOWCASE_MANAGER_CAPS",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.OpenShowcaseManager
				} )
			end
			if FileshareCanBuyMoreSlots( controller ) == true then
				table.insert( options, {
					displayText = "MENU_FILESHARE_BUY_SLOTS",
					displayImage = "",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = CoD.FileshareUtility.OpenBuySlots
				} )
			end
		end
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
}
DataSources.GunsmithOptionsButtonList = ListHelper_SetupDataSource( "GunsmithOptionsButtonList", function ( controller )
	local buttonOptions = {}
	local copyDisabled = false
	local publishDisabled = false
	local readOnly = false
	local slotsFull = CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	local gunsmithVariantModel = CoD.perController[controller].gunsmithVariantModel
	if gunsmithVariantModel then
		local readOnlyModel = Engine.GetModel( gunsmithVariantModel, "readOnly" )
		if readOnlyModel then
			local readOnlyValue = Engine.GetModelValue( readOnlyModel )
			if readOnlyValue and readOnlyValue == 1 then
				readOnly = true
			end
		end
	end
	if slotsFull == true or readOnly == true then
		copyDisabled = true
	end
	local publishDisplayDesc = "MENU_GUNSMITH_PUBLISH_DESC"
	if readOnly == true then
		publishDisabled = true
		publishDisplayDesc = "MENU_CANNOT_PUBLISH_DOWNLOADED_DESC"
	end
	if FileshareCanPublish( controller ) then
		table.insert( buttonOptions, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = publishDisplayDesc,
			action = CoD.CraftUtility.OpenPublishPromptGunsmith,
			disabled = publishDisabled
		} )
	end
	table.insert( buttonOptions, {
		displayText = "MENU_DELETE",
		displayImage = "t7_icon_menu_simple_delete",
		displayDesc = "MENU_GUNSMITH_DELETE_DESC",
		action = CoD.CraftUtility.GunsmithClear,
		disabled = false
	} )
	table.insert( buttonOptions, {
		displayText = "MENU_COPY",
		displayImage = "t7_icon_menu_simple_copy",
		displayDesc = "MENU_GUNSMITH_COPY_DESC",
		action = Gunsmith_CopyVariant,
		disabled = copyDisabled
	} )
	table.insert( buttonOptions, {
		displayText = "MENU_RENAME",
		displayImage = "t7_icon_menu_simple_rename",
		displayDesc = "MENU_GUNSMITH_RENAME_DESC",
		action = CoD.CraftUtility.GunsmithRename,
		disabled = false
	} )
	if CanShowMediaManager() then
		table.insert( buttonOptions, {
			displayText = "MENU_MEDIA_MANAGER",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_MEDIA_MANAGER_DESC",
			action = GoBackAndOpenMediaManagerOnParent,
			param = "variant",
			disabled = false
		} )
	end
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = buttonData.displayText,
				icon = buttonData.displayImage,
				description = buttonData.displayDesc,
				action = buttonData.action,
				param = buttonData.param
			},
			properties = {
				disabled = buttonData.disabled
			}
		} )
	end
	return buttons
end )
DataSources.EmblemOptionsButtonList = ListHelper_SetupDataSource( "EmblemOptionsButtonList", function ( controller )
	local buttonOptions = {}
	local copyDisabled = false
	local publishDisabled = false
	local readOnly = false
	local slotsFull = CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_EMBLEMS )
	local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
	if selectedEmblemModel then
		local readOnlyModel = Engine.GetModel( selectedEmblemModel, "readOnly" )
		if readOnlyModel then
			local readOnlyValue = Engine.GetModelValue( readOnlyModel )
			if readOnlyValue and readOnlyValue == 1 then
				readOnly = true
			end
		end
	end
	if slotsFull == true or readOnly == true then
		copyDisabled = true
	end
	local publishDisplayDesc = "MENU_EMBLEMS_PUBLISH_DESC"
	if readOnly == true then
		publishDisabled = true
		publishDisplayDesc = "MENU_CANNOT_PUBLISH_DOWNLOADED_DESC"
	end
	if isFileshareFeatureEnabled() then
		table.insert( buttonOptions, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = publishDisplayDesc,
			action = CoD.CraftUtility.OpenPublishPromptEmblem,
			disabled = publishDisabled
		} )
	end
	table.insert( buttonOptions, {
		displayText = "MENU_DELETE",
		displayImage = "t7_icon_menu_simple_delete",
		displayDesc = "MENU_EMBLEM_DELETE_DESC",
		action = CoD.CraftUtility.EmblemClear,
		disabled = false
	} )
	table.insert( buttonOptions, {
		displayText = "MENU_COPY",
		displayImage = "t7_icon_menu_simple_copy",
		displayDesc = "MENU_EMBLEM_COPY_DESC",
		action = EmblemSelect_CopyEmblem,
		disabled = copyDisabled
	} )
	table.insert( buttonOptions, {
		displayText = "MENU_RENAME",
		displayImage = "t7_icon_menu_simple_rename",
		displayDesc = "MENU_EMBLEM_RENAME_DESC",
		action = CoD.CraftUtility.EmblemRename,
		disabled = false
	} )
	if CanShowMediaManager() then
		table.insert( buttonOptions, {
			displayText = "MENU_MEDIA_MANAGER",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_MEDIA_MANAGER_DESC",
			action = GoBackAndOpenMediaManagerOnParent,
			param = "emblem",
			disabled = false
		} )
	end
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = buttonData.displayText,
				icon = buttonData.displayImage,
				description = buttonData.displayDesc,
				action = buttonData.action,
				param = buttonData.param
			},
			properties = {
				disabled = buttonData.disabled
			}
		} )
	end
	return buttons
end )
DataSources.PaintjobOptionsButtonList = ListHelper_SetupDataSource( "PaintjobOptionsButtonList", function ( controller )
	local buttonOptions = {}
	local copyDisabled = false
	local publishDisabled = false
	local readOnly = false
	local slotsFull = CraftSlotsFullByStorageType( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	local selectedPaintjobModel = CoD.perController[controller].selectedpaintjobModel
	if selectedPaintjobModel then
		local readOnlyModel = Engine.GetModel( selectedPaintjobModel, "readOnly" )
		if readOnlyModel then
			local readOnlyValue = Engine.GetModelValue( readOnlyModel )
			if readOnlyValue and readOnlyValue == 1 then
				readOnly = true
			end
		end
	end
	if slotsFull == true or readOnly == true then
		copyDisabled = true
	end
	local publishDisplayDesc = "MENU_PAINTJOB_PUBLISH_DESC"
	if readOnly == true then
		publishDisabled = true
		publishDisplayDesc = "MENU_CANNOT_PUBLISH_DOWNLOADED_DESC"
	end
	if isFileshareFeatureEnabled() then
		table.insert( buttonOptions, {
			displayText = "MENU_PUBLISH",
			displayImage = "t7_icon_menu_simple_publish",
			displayDesc = publishDisplayDesc,
			action = CoD.CraftUtility.OpenPublishPromptPaintjob,
			disabled = publishDisabled
		} )
	end
	table.insert( buttonOptions, {
		displayText = "MENU_DELETE",
		displayImage = "t7_icon_menu_simple_delete",
		displayDesc = "MENU_PAINTJOB_DELETE_DESC",
		action = CoD.CraftUtility.PaintjobClear,
		disabled = false
	} )
	table.insert( buttonOptions, {
		displayText = "MENU_COPY",
		displayImage = "t7_icon_menu_simple_copy",
		displayDesc = "MENU_PAINTJOB_COPY_DESC",
		action = PaintjobSelector_CopyPaintjob,
		disabled = copyDisabled
	} )
	table.insert( buttonOptions, {
		displayText = "MENU_RENAME",
		displayImage = "t7_icon_menu_simple_rename",
		displayDesc = "MENU_PAINTJOB_RENAME_DESC",
		action = CoD.CraftUtility.PaintjobRename,
		disabled = false
	} )
	if CanShowMediaManager() then
		table.insert( buttonOptions, {
			displayText = "MENU_MEDIA_MANAGER",
			displayImage = "t7_icon_menu_simple_media_manager",
			displayDesc = "MENU_MEDIA_MANAGER_DESC",
			action = GoBackAndOpenMediaManagerOnParent,
			param = "paintjob",
			disabled = false
		} )
	end
	if Engine.IsSteamWorkshopEnabled() then
		table.insert( buttonOptions, {
			displayText = "PLATFORM_STEAM_PUBLISH",
			displayImage = "",
			displayDesc = "PLATFORM_STEAM_PUBLISH_DESC",
			action = CoD.CraftUtility.OpenSteamPublishPromptPaintjob
		} )
	end
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = buttonData.displayText,
				icon = buttonData.displayImage,
				description = buttonData.displayDesc,
				action = buttonData.action,
				param = buttonData.param
			},
			properties = {
				disabled = buttonData.disabled
			}
		} )
	end
	return buttons
end )
DataSources.PaintjobLayerOptionsButtonList = ListHelper_SetupDataSource( "PaintjobLayerOptionsButtonList", function ( controller )
	local gridTypeName = CoD.CraftUtility.GetGridTypeName( controller )
	local isGridOn = IsGridOn( controller, gridTypeName )
	local gridButtonText = "MENU_EMBLEM_TURN_GRID_ON"
	local gridHintText = "MENU_EMBLEM_TURN_GRID_ON_HINT"
	if isGridOn then
		gridButtonText = "MENU_EMBLEM_TURN_GRID_OFF"
		gridHintText = "MENU_EMBLEM_TURN_GRID_OFF_HINT"
	end
	local buttonOptions = {
		{
			displayText = gridButtonText,
			displayImage = "",
			displayDesc = gridHintText,
			action = PaintjobEditor_ToggleGrid,
			disabled = false
		}
	}
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = buttonData.displayText,
				icon = buttonData.displayImage,
				description = buttonData.displayDesc,
				action = buttonData.action
			},
			properties = {
				disabled = buttonData.disabled
			}
		} )
	end
	return buttons
end )
DataSources.GunsmithSnapshotModeButtonList = ListHelper_SetupDataSource( "GunsmithSnapshotModeButtonList", function ( controller )
	local buttonOptions = {}
	table.insert( buttonOptions, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_statssingle",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_STATS",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.Stats"
	} )
	table.insert( buttonOptions, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_weaponlevel",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_WEAPON_LEVEL",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.WeaponLevel"
	} )
	table.insert( buttonOptions, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_player",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_PLAYERID",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.PlayerID"
	} )
	table.insert( buttonOptions, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_weaponname",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_WEAPON_NAME",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.WeaponName"
	} )
	table.insert( buttonOptions, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_opticattach",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_ATTACHMENTS",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.AttachmentIcons"
	} )
	table.insert( buttonOptions, {
		displayText = "",
		displayImage = "t7_menu_gunsmith_bo3logo",
		displayDesc = "MENU_GUNSMITH_SNAPSHOT_BO3LOGO",
		action = Gunsmith_SnapshotToggleDisplayProperty,
		visibilityModelName = "GunsmithSnapshot.BO3Logo"
	} )
	local buttons = {}
	for index, buttonData in ipairs( buttonOptions ) do
		table.insert( buttons, {
			models = {
				displayText = buttonData.displayText,
				icon = buttonData.displayImage,
				description = buttonData.displayDesc,
				action = buttonData.action,
				param = buttonData.visibilityModelName
			},
			properties = {
				disabled = buttonData.disabled
			}
		} )
	end
	return buttons
end )
DataSources.MediaManagerPaintjobList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		list.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManager.PaintjobList" )
		list.totalPaintjobs = 0
		list.paintjobList = {}
		local buyMoreSlots = {
			isBuyMore = true,
			sortIndex = 0,
			weaponIndex = 0,
			paintjobSlot = 0,
			paintjobIndex = 0
		}
		if FileshareCanBuyMoreSlots( controller ) == true then
			table.insert( list.paintjobList, buyMoreSlots )
			list.totalPaintjobs = list.totalPaintjobs + 1
		end
		local paintjobList = CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList()
		for k, paintjob in pairs( paintjobList ) do
			if paintjob.weaponIndex ~= 0 then
				table.insert( list.paintjobList, paintjob )
				list.totalPaintjobs = list.totalPaintjobs + 1
			end
		end
	end,
	getCount = function ( list )
		return list.totalPaintjobs
	end,
	getItem = function ( controller, list, index )
		local paintjobModel = Engine.CreateModel( list.paintjobListModel, "mm_paintjob_" .. index )
		local paintjob = list.paintjobList[index]
		if paintjob then
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "showBuyImage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "isBuyMore" ), false )
			if paintjob.isBuyMore ~= nil and paintjob.isBuyMore == true then
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "isBuyMore" ), true )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "showBuyImage" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "sortIndex" ), 1 )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "plusImageSrc" ), "uie_t7_icon_codpoints" )
			end
			if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( paintjob.paintjobSlot, paintjob.paintjobIndex ) then
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobName" ), paintjob.paintjobName )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobTextEntry" ), paintjob.paintjobName )
			end
			CoD.SetCustomization( controller, paintjob.weaponIndex, "weapon_index" )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "sortIndex" ), paintjob.sortIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "weaponIndex" ), paintjob.weaponIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobSlot" ), paintjob.paintjobSlot )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobIndex" ), paintjob.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobSlotAndIndex" ), paintjob.paintjobSlot .. " " .. paintjob.paintjobIndex )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "authorName" ), Engine.GetSelfGamertag( controller ) )
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "createTime" ), paintjob.createTime )
			local weaponName = ""
			if paintjob.weaponIndex ~= nil then
				weaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( paintjob.weaponIndex ) ) )
			end
			Engine.SetModelValue( Engine.CreateModel( paintjobModel, "weaponName" ), weaponName )
			return paintjobModel
		else
			
		end
	end
}
DataSources.MediaManagerVariantList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		list.variantListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManager.VariantList" )
		list.totalVariants = 0
		list.variantList = {}
		local buyMoreSlots = {
			isBuyMore = true,
			sortIndex = 0,
			weaponIndex = 0,
			paintjobSlot = 0,
			paintjobIndex = 0
		}
		if FileshareCanBuyMoreSlots( controller ) == true then
			table.insert( list.variantList, buyMoreSlots )
			list.totalVariants = list.totalVariants + 1
		end
		local variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList()
		for k, variant in pairs( variantList ) do
			if variant.weaponIndex ~= 0 then
				table.insert( list.variantList, variant )
				list.totalVariants = list.totalVariants + 1
			end
		end
	end,
	getCount = function ( list )
		return list.totalVariants
	end,
	createVariantModel = function ( controller, itemIndex, variant, sortIndex, variantModel )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "variantIndex" ), variant.variantIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "weaponIndex" ), variant.weaponIndex )
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
		Engine.SetModelValue( Engine.CreateModel( variantModel, "sortIndex" ), sortIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlot" ), variant.paintjobSlot )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobIndex" ), variant.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "camoIndex" ), variant.camoIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "paintjobSlotAndIndex" ), variant.paintjobSlot .. " " .. variant.paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "authorName" ), Engine.GetSelfGamertag( controller ) )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "createTime" ), variant.createTime )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "showBuyImage" ), 0 )
		local weaponName = ""
		if variant.weaponIndex ~= nil then
			weaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( variant.weaponIndex ) ) )
		end
		Engine.SetModelValue( Engine.CreateModel( variantModel, "weaponName" ), weaponName )
	end,
	getItem = function ( controller, list, index )
		local variantModel = Engine.CreateModel( list.variantListModel, "mm_variant_" .. index )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "isBuyMore" ), false )
		Engine.SetModelValue( Engine.CreateModel( variantModel, "showBuyImage" ), 0 )
		if list.variantList[index].isBuyMore == true then
			Engine.SetModelValue( Engine.CreateModel( variantModel, "isBuyMore" ), true )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "showBuyImage" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "sortIndex" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "variantName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( variantModel, "plusImageSrc" ), "uie_t7_icon_codpoints" )
		else
			local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, list.variantList[index].variantIndex )
			DataSources.MediaManagerVariantList.createVariantModel( controller, index, variant, list.variantList[index].sortIndex, variantModel )
		end
		return variantModel
	end
}
DataSources.ShowcaseEmblemList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		list.emblemListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManager.ShowcaseEmblemList" )
		list.totalEmblems = 0
		list.emblemList = {}
		local emblemList = CoD.CraftUtility.Emblems.GetSortedEmblemsList( controller, CoD.perController[controller].selectedEmblemTabStorageType )
		for k, emblem in pairs( emblemList ) do
			if emblem.isUsed ~= 0 then
				table.insert( list.emblemList, emblem )
				list.totalEmblems = list.totalEmblems + 1
			end
		end
	end,
	getCount = function ( list )
		return list.totalEmblems
	end,
	getItem = function ( controller, list, index )
		local emblemModel = Engine.CreateModel( list.emblemListModel, "mm_emblem_" .. index )
		local emblem = list.emblemList[index]
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "isBuyMore" ), false )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "showBuyImage" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTitle" ), emblem.emblemTitle )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemName" ), emblem.emblemName )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemIndex" ), emblem.emblemIndex )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTextEntry" ), emblem.emblemTextEntry )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "subTitle" ), emblem.subTitle )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "storageFileType" ), CoD.perController[controller].selectedEmblemTabStorageType )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "isUsed" ), emblem.isUsed )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "showBuyImage" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "readOnly" ), emblem.readOnly )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "isBMClassified" ), false )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "sortIndex" ), emblem.sortIndex )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "hintText" ), Engine.Localize( "MENU_BUTTON_EMBLEM_SET" ) )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "authorName" ), Engine.GetSelfGamertag( controller ) )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "createTime" ), emblem.createTime )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "plusImageSrc" ), "uie_t7_icon_codpoints" )
		return emblemModel
	end
}
DataSources.MediaManagerEmblemList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		list.emblemListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManager.EmblemList" )
		list.totalEmblems = 0
		list.emblemList = {}
		local buyMoreSlots = {
			isBuyMore = true,
			sortIndex = 0,
			emblemIndex = 0,
			isUsed = 1
		}
		if FileshareCanBuyMoreSlots( controller ) == true then
			table.insert( list.emblemList, buyMoreSlots )
			list.totalEmblems = list.totalEmblems + 1
		end
		local emblemList = CoD.CraftUtility.Emblems.GetSortedEmblemsList( controller, CoD.perController[controller].selectedEmblemTabStorageType )
		for k, emblem in pairs( emblemList ) do
			if emblem.isUsed ~= 0 then
				table.insert( list.emblemList, emblem )
				list.totalEmblems = list.totalEmblems + 1
			end
		end
	end,
	getCount = function ( list )
		return list.totalEmblems
	end,
	getItem = function ( controller, list, index )
		local emblemModel = Engine.CreateModel( list.emblemListModel, "mm_emblem_" .. index )
		local emblem = list.emblemList[index]
		if emblem.isBuyMore and emblem.isBuyMore == true then
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isBuyMore" ), true )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "showBuyImage" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "sortIndex" ), 1 )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemName" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTitle" ), Engine.Localize( "MENU_FILESHARE_BUY_SLOTS" ) )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isUsed" ), false )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "plusImageSrc" ), "uie_t7_icon_codpoints" )
		else
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isBuyMore" ), false )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "showBuyImage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTitle" ), emblem.emblemTitle )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemName" ), emblem.emblemName )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemIndex" ), emblem.emblemIndex )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTextEntry" ), emblem.emblemTextEntry )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "subTitle" ), emblem.subTitle )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "storageFileType" ), CoD.perController[controller].selectedEmblemTabStorageType )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isUsed" ), emblem.isUsed )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "showBuyImage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "readOnly" ), emblem.readOnly )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isBMClassified" ), false )
		end
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "sortIndex" ), emblem.sortIndex )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "hintText" ), Engine.Localize( "MENU_BUTTON_EMBLEM_SET" ) )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "authorName" ), Engine.GetSelfGamertag( controller ) )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "createTime" ), emblem.createTime )
		return emblemModel
	end
}
DataSources.MediaManagerCustomGamesList = {
	prepare = function ( controller, list, filter )
		list.showDefault = false
		list.controller = controller
		list.rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		list.numFiles = Engine.GetCustomGamesCount( controller, "" )
		list.communityOption = false
		if list.showDefault == true then
			list.numFiles = list.numFiles + 1
		end
	end,
	getCount = function ( list )
		CoD.FileshareUtility.SetItemsCount( list.controller, list.numFiles )
		return list.numFiles
	end,
	getItem = function ( controller, list, index )
		local itemModel = Engine.CreateModel( list.rootModel, "mm_customgames_" .. index )
		Engine.SetModelValue( Engine.CreateModel( itemModel, "uiIndex" ), index )
		if list.showDefault == true and index == 1 then
			local gameModes = Engine.GetGametypesBase()
			local currentGameMode = GetCurrentUIGameType( controller )
			local gameName = ""
			for index, gameMode in pairs( gameModes ) do
				if gameMode.category == "standard" and gameMode.gametype == currentGameMode then
					gameName = Engine.Localize( gameMode.name )
					break
				end
			end
			Engine.SetModelValue( Engine.CreateModel( itemModel, "text" ), gameName )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "inUse" ), true )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isOfficial" ), true )
		else
			local indexDelta = 1
			if list.showDefault == true then
				indexDelta = 2
			end
			local data = Engine.GetCustomGameData( controller, index - indexDelta, "" )
			local gameTypeInfo = Engine.GetGameTypeInfo( data.gameType )
			local gameName = data.gameName
			local gameDescription = data.gameDescription
			if data.isOfficial then
				gameName = Engine.Localize( data.gameName )
				gameDescription = Engine.Localize( data.gameDescription )
			end
			Engine.SetModelValue( Engine.CreateModel( itemModel, "name" ), gameName )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "gameName" ), gameName )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "text" ), gameName )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "gameDescription" ), gameDescription )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "slot" ), data.slot )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "index" ), data.index )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "inUse" ), data.inUse )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "isOfficial" ), data.isOfficial )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "createTime" ), data.createTime )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "gameType" ), data.gameType )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "gameTypeString" ), data.gameTypeString )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "image" ), gameTypeInfo.image )
			Engine.SetModelValue( Engine.CreateModel( itemModel, "description" ), gameTypeInfo.descriptionRef )
		end
		return itemModel
	end
}
DataSources.MediaManager = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager" )
		return model
	end
}
DataSources.MediaManagerSelectedPaintjob = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSelectedPaintjob" )
		return model
	end
}
DataSources.MediaManagerSelectedVariant = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSelectedVariant" )
		return model
	end
}
DataSources.MediaManagerSelectedEmblem = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSelectedEmblem" )
		return model
	end
}
DataSources.MediaManagerSlotsFullButtonList = {
	prepare = function ( controller, list, filter )
		local options = {}
		if MediaManagerSlotsAvailable( controller, CoD.FileshareUtility.GetCurrentCategory() ) == false then
			if CanShowMediaManager() then
				table.insert( options, {
					displayText = "MENU_MEDIA_MANAGER",
					displayImage = "",
					displayDesc = "MENU_ALLOW_DOWNLOAD_DESC",
					action = GoBackAndOpenMediaManagerOnParent
				} )
			end
			if FileshareCanBuyMoreSlots( controller ) == true then
				table.insert( options, {
					displayText = "MENU_FILESHARE_BUY_SLOTS",
					displayImage = "",
					displayDesc = "MENU_FILESHARE_DOWNLOAD_DESC",
					action = OpenBuyExtraSlotsPackDialog,
					param = "MediaManager"
				} )
			end
		end
		local menuModel = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSlotsFullButtonList" ), "list" )
		list.optionModels = {}
		for index, buttonData in ipairs( options ) do
			list.optionModels[index] = Engine.CreateModel( menuModel, "mm_buttonModel_" .. index )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayText" ), Engine.ToUpper( Engine.Localize( buttonData.displayText ) ) )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "displayImage" ), buttonData.displayImage )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "hintText" ), Engine.Localize( buttonData.displayDesc ) )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "action" ), buttonData.action )
			Engine.SetModelValue( Engine.CreateModel( list.optionModels[index], "param" ), buttonData.param )
		end
	end,
	getCount = function ( list )
		return #list.optionModels
	end,
	getItem = function ( controller, list, index )
		return list.optionModels[index]
	end
}
DataSources.PaintjobList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
		if not weaponIndex then
			return 
		end
		list.paintjobListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.PaintjobList" )
		local allUsedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
		local usedWeaponPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( weaponIndex )
		local maxAllowedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( controller )
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
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobTextEntry" ), "Paintjob" )
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "paintjobName" ), "" )
			end
			if paintjob.readOnly ~= nil then
				Engine.SetModelValue( Engine.CreateModel( paintjobModel, "readOnly" ), paintjob.readOnly )
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
}
DataSources.EmblemsList = {
	prepare = function ( controller, list, filter )
		list.controller = controller
		list.emblemList = {}
		local storageFileType = CoD.perController[controller].selectedEmblemTabStorageType
		list.emblemListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemList" )
		local emblemCount = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( controller, storageFileType )
		local maxEmblems = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( controller, storageFileType )
		if storageFileType == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS or storageFileType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT or SelectingGroupEmblem( controller ) then
			list.totalEmblems = emblemCount
		else
			list.totalEmblems = emblemCount + 1
		end
		list.emblemList = CoD.CraftUtility.Emblems.GetSortedEmblemsList( controller, CoD.perController[controller].selectedEmblemTabStorageType )
		if #list.emblemList < list.totalEmblems then
			list.totalEmblems = #list.emblemList
		end
	end,
	getCount = function ( list )
		return list.totalEmblems
	end,
	getItem = function ( controller, list, index )
		local emblemModel = Engine.CreateModel( list.emblemListModel, "emblem_" .. index )
		local maxEmblems = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( controller, CoD.perController[controller].selectedEmblemTabStorageType )
		local AddEmblemTextProperties = function ( emblem )
			if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( emblem.emblemIndex ) then
				emblem.emblemTextEntry = emblem.emblemName
				if CoD.perController[controller].selectedEmblemTabStorageType ~= Enum.StorageFileType.STORAGE_EMBLEMS then
					emblem.emblemTextEntry = "Emblem"
				end
				emblem.emblemTitle = emblem.emblemName
				emblem.subTitle = ""
			else
				emblem.emblemName = Engine.Localize( "MENU_EMBLEM_CREATE_NEW" )
				emblem.emblemTitle = Engine.Localize( "MENU_NEW" )
				emblem.emblemTextEntry = "Emblem"
				emblem.subTitle = Engine.Localize( "MENU_EMBLEM_NEW_SUBTITLE" )
			end
		end
		
		local emblem = list.emblemList[index]
		AddEmblemTextProperties( emblem )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "isNonClickableEmblem" ), 0 )
		if #list.emblemList == maxEmblems + 1 and index == 1 then
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isNonClickableEmblem" ), 1 )
			emblem.emblemTitle = Engine.Localize( "MENU_NEW" )
			emblem.emblemName = Engine.Localize( "MENU_EMBLEM_CREATE_NEW" )
			emblem.emblemTextEntry = "Emblem"
			emblem.subTitle = Engine.Localize( "MENU_EMBLEM_FULL_SUBTITLE" )
		end
		if CoD.perController[controller].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
			local emblemName = CoD.BlackMarketUtility.GetLootEmblemIDName( emblem.emblemIndex )
			local isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, emblemName )
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isBMClassified" ), isBMClassified )
			if isBMClassified then
				emblem.subTitle = Engine.Localize( "MPUI_BLACKMARKET_ITEM_CLASSIFIED_DESC", "MENU_EMBLEM" )
				emblem.emblemName = CoD.BlackMarketUtility.ClassifiedName( true )
				emblem.emblemTitle = CoD.BlackMarketUtility.ClassifiedName( true )
			end
		else
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "isBMClassified" ), false )
		end
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTitle" ), emblem.emblemTitle )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemName" ), emblem.emblemName )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemTextEntry" ), emblem.emblemTextEntry )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "subTitle" ), emblem.subTitle )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "sortIndex" ), emblem.sortIndex )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "emblemIndex" ), emblem.emblemIndex )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "isUsed" ), emblem.isUsed )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "hintText" ), Engine.Localize( "MENU_BUTTON_EMBLEM_SET" ) )
		Engine.SetModelValue( Engine.CreateModel( emblemModel, "storageFileType" ), CoD.perController[controller].selectedEmblemTabStorageType )
		if emblem.readOnly ~= nil then
			Engine.SetModelValue( Engine.CreateModel( emblemModel, "readOnly" ), emblem.readOnly )
		end
		return emblemModel
	end
}
DataSources.ChallengesCPCategoryStats = {
	init = function ( controller )
		local challengeInfo = Engine.GetChallengeInfoForImages( controller, nil, Enum.eModes.MODE_CAMPAIGN )
		local numComplete = 0
		local numTotal = 0
		local categoryCardCountTable = {}
		for _, currInfo in ipairs( challengeInfo ) do
			local categoryName = currInfo.challengeCategory
			if not currInfo.isMastery then
				if not categoryCardCountTable[categoryName] then
					categoryCardCountTable[categoryName] = {}
					categoryCardCountTable[categoryName].numComplete = 0
					categoryCardCountTable[categoryName].numTotal = 0
				end
				categoryCardCountTable[categoryName].numTotal = categoryCardCountTable[categoryName].numTotal + 1
				if not currInfo.isLocked then
					categoryCardCountTable[categoryName].numComplete = categoryCardCountTable[categoryName].numComplete + 1
				end
			end
		end
		local numCompleteAllCategories = 0
		local numTotalAllCategories = 0
		for category, countTable in pairs( categoryCardCountTable ) do
			numCompleteAllCategories = numCompleteAllCategories + categoryCardCountTable[category].numComplete
			numTotalAllCategories = numTotalAllCategories + categoryCardCountTable[category].numTotal
		end
		categoryCardCountTable.CP = {}
		categoryCardCountTable.CP.numComplete = numCompleteAllCategories
		categoryCardCountTable.CP.numTotal = numTotalAllCategories
		local categoryStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChallengesCPCategoryStats" )
		for modelPath, countTable in pairs( categoryCardCountTable ) do
			local f721_local3 = 0
			if countTable.numTotal ~= 0 then
				f721_local3 = countTable.numComplete / countTable.numTotal
			end
			Engine.SetModelValue( Engine.CreateModel( categoryStatsModel, modelPath ), f721_local3 )
		end
		return categoryStatsModel
	end,
	getModel = function ( controller )
		local categoryStatsModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesCPCategoryStats" )
		if categoryStatsModel == nil then
			categoryStatsModel = DataSources.ChallengesCPCategoryStats.init( controller )
		end
		return categoryStatsModel
	end
}
DataSources.ChallengesMPCategoryStats = {
	init = function ( controller )
		local challengeInfo = Engine.GetChallengeInfoForImages( controller, nil, Enum.eModes.MODE_MULTIPLAYER )
		local numComplete = 0
		local numTotal = 0
		local categoryCardCountTable = {}
		for _, currInfo in ipairs( challengeInfo ) do
			local categoryName = currInfo.challengeCategory
			if not currInfo.isMastery then
				if not categoryCardCountTable[categoryName] then
					categoryCardCountTable[categoryName] = {}
					categoryCardCountTable[categoryName].numComplete = 0
					categoryCardCountTable[categoryName].numTotal = 0
				end
				categoryCardCountTable[categoryName].numTotal = categoryCardCountTable[categoryName].numTotal + 1
				if not currInfo.isLocked then
					categoryCardCountTable[categoryName].numComplete = categoryCardCountTable[categoryName].numComplete + 1
				end
			end
		end
		categoryCardCountTable.MP = {}
		categoryCardCountTable.MP.numComplete = 0
		categoryCardCountTable.MP.numTotal = 0
		for className, currInfo in pairs( CoD.ChallengesUtility.ChallengeCategoryTable.mp ) do
			if type( currInfo ) == "table" then
				categoryCardCountTable[className] = {}
				categoryCardCountTable[className].numComplete = 0
				categoryCardCountTable[className].numTotal = 0
				for _, category in ipairs( currInfo ) do
					if categoryCardCountTable[category] then
						categoryCardCountTable[className].numComplete = categoryCardCountTable[className].numComplete + categoryCardCountTable[category].numComplete
						categoryCardCountTable[className].numTotal = categoryCardCountTable[className].numTotal + categoryCardCountTable[category].numTotal
					end
				end
				categoryCardCountTable.MP.numComplete = categoryCardCountTable.MP.numComplete + categoryCardCountTable[className].numComplete
				categoryCardCountTable.MP.numTotal = categoryCardCountTable.MP.numTotal + categoryCardCountTable[className].numTotal
			end
		end
		local categoryStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChallengesMPCategoryStats" )
		for modelPath, f723_local3 in pairs( categoryCardCountTable ) do
			local f723_local6 = 0
			if f723_local3.numTotal ~= 0 then
				f723_local6 = f723_local3.numComplete / f723_local3.numTotal
			end
			Engine.SetModelValue( Engine.CreateModel( categoryStatsModel, modelPath ), f723_local6 )
		end
		return categoryStatsModel
	end,
	getModel = function ( controller )
		local categoryStatsModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesMPCategoryStats" )
		if categoryStatsModel == nil then
			categoryStatsModel = DataSources.ChallengesMPCategoryStats.init( controller )
		end
		return categoryStatsModel
	end
}
DataSources.ChallengesZMCategoryStats = {
	init = function ( controller )
		local challengeInfo = Engine.GetChallengeInfoForImages( controller, nil, Enum.eModes.MODE_ZOMBIES )
		local numComplete = 0
		local numTotal = 0
		local categoryCardCountTable = {}
		for _, currInfo in ipairs( challengeInfo ) do
			local categoryName = currInfo.challengeCategory
			if not currInfo.isMastery and categoryName ~= "darkops" then
				if not categoryCardCountTable[categoryName] then
					categoryCardCountTable[categoryName] = {}
					categoryCardCountTable[categoryName].numComplete = 0
					categoryCardCountTable[categoryName].numTotal = 0
				end
				categoryCardCountTable[categoryName].numTotal = categoryCardCountTable[categoryName].numTotal + 1
				if not currInfo.isLocked then
					categoryCardCountTable[categoryName].numComplete = categoryCardCountTable[categoryName].numComplete + 1
				end
			end
		end
		local numCompleteAllCategories = 0
		local numTotalAllCategories = 0
		for category, countTable in pairs( categoryCardCountTable ) do
			numCompleteAllCategories = numCompleteAllCategories + categoryCardCountTable[category].numComplete
			numTotalAllCategories = numTotalAllCategories + categoryCardCountTable[category].numTotal
		end
		categoryCardCountTable.ZM = {}
		categoryCardCountTable.ZM.numComplete = numCompleteAllCategories
		categoryCardCountTable.ZM.numTotal = numTotalAllCategories
		local categoryStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChallengesZMCategoryStats" )
		for modelPath, countTable in pairs( categoryCardCountTable ) do
			local f725_local3 = 0
			if countTable.numTotal ~= 0 then
				f725_local3 = countTable.numComplete / countTable.numTotal
			end
			Engine.SetModelValue( Engine.CreateModel( categoryStatsModel, modelPath ), f725_local3 )
		end
		return categoryStatsModel
	end,
	getModel = function ( controller )
		local categoryStatsModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesZMCategoryStats" )
		if categoryStatsModel == nil then
			categoryStatsModel = DataSources.ChallengesZMCategoryStats.init( controller )
		end
		return categoryStatsModel
	end
}
DataSources.ChallengesCPNearCompletion = {
	init = function ( controller )
		local cpNearCompletionModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChallengesCPNearCompletion" )
		local titleModel = Engine.CreateModel( cpNearCompletionModel, "title" )
		local descriptionModel = Engine.CreateModel( cpNearCompletionModel, "description" )
		local iconIdModel = Engine.CreateModel( cpNearCompletionModel, "iconId" )
		local statPercentModel = Engine.CreateModel( cpNearCompletionModel, "statPercent" )
		local statFractionTextModel = Engine.CreateModel( cpNearCompletionModel, "statFractionText" )
		local noNearestCompleteModel = Engine.CreateModel( Engine.GetModelForController( controller ), "noNearCompleteCP" )
		SetGlobalModelValue( "challengeGameMode", "cp" )
		local nearCompletionList = {}
		DataSources.ChallengesNearCompletionList.prepare( controller, nearCompletionList, nil )
		local challengeNearestCompletion = nearCompletionList.ChallengesNearCompletionList[1]
		if challengeNearestCompletion == nil then
			Engine.SetModelValue( noNearestCompleteModel, true )
		else
			Engine.SetModelValue( titleModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "title" ) ) )
			Engine.SetModelValue( descriptionModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "description" ) ) )
			Engine.SetModelValue( iconIdModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "iconId" ) ) )
			Engine.SetModelValue( statPercentModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "statPercent" ) ) )
			Engine.SetModelValue( statFractionTextModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "statFractionText" ) ) )
		end
		return cpNearCompletionModel
	end,
	getModel = function ( controller )
		local cpNearCompletionModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesCPNearCompletion" )
		if cpNearCompletionModel == nil then
			cpNearCompletionModel = DataSources.ChallengesCPNearCompletion.init( controller )
		end
		return cpNearCompletionModel
	end
}
DataSources.ChallengesMPNearCompletion = {
	init = function ( controller )
		local mpNearCompletionModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChallengesMPNearCompletion" )
		local titleModel = Engine.CreateModel( mpNearCompletionModel, "title" )
		local descriptionModel = Engine.CreateModel( mpNearCompletionModel, "description" )
		local iconIdModel = Engine.CreateModel( mpNearCompletionModel, "iconId" )
		local statPercentModel = Engine.CreateModel( mpNearCompletionModel, "statPercent" )
		local statFractionTextModel = Engine.CreateModel( mpNearCompletionModel, "statFractionText" )
		SetGlobalModelValue( "challengeGameMode", "mp" )
		local nearCompletionList = {}
		DataSources.ChallengesNearCompletionList.prepare( controller, nearCompletionList, nil )
		local challengeNearestCompletion = nearCompletionList.ChallengesNearCompletionList[1]
		if challengeNearestCompletion == nil then
			local noNearestCompleteModel = Engine.CreateModel( Engine.GetModelForController( controller ), "noNearCompleteMP" )
			Engine.SetModelValue( noNearestCompleteModel, true )
		else
			Engine.SetModelValue( titleModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "title" ) ) )
			Engine.SetModelValue( descriptionModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "description" ) ) )
			Engine.SetModelValue( iconIdModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "iconId" ) ) )
			Engine.SetModelValue( statPercentModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "statPercent" ) ) )
			Engine.SetModelValue( statFractionTextModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "statFractionText" ) ) )
		end
		return mpNearCompletionModel
	end,
	getModel = function ( controller )
		local mpNearCompletionModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesMPNearCompletion" )
		if mpNearCompletionModel == nil then
			mpNearCompletionModel = DataSources.ChallengesMPNearCompletion.init( controller )
		end
		return mpNearCompletionModel
	end
}
DataSources.ChallengesZMNearCompletion = {
	init = function ( controller )
		local zmNearCompletionModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChallengesZMNearCompletion" )
		local titleModel = Engine.CreateModel( zmNearCompletionModel, "title" )
		local descriptionModel = Engine.CreateModel( zmNearCompletionModel, "description" )
		local iconIdModel = Engine.CreateModel( zmNearCompletionModel, "iconId" )
		local statPercentModel = Engine.CreateModel( zmNearCompletionModel, "statPercent" )
		local statFractionTextModel = Engine.CreateModel( zmNearCompletionModel, "statFractionText" )
		local noNearestCompleteModel = Engine.CreateModel( Engine.GetModelForController( controller ), "noNearCompleteZM" )
		SetGlobalModelValue( "challengeGameMode", "zm" )
		local nearCompletionList = {}
		DataSources.ChallengesNearCompletionList.prepare( controller, nearCompletionList, nil )
		local challengeNearestCompletion = nearCompletionList.ChallengesNearCompletionList[1]
		if challengeNearestCompletion == nil then
			Engine.SetModelValue( noNearestCompleteModel, true )
		else
			Engine.SetModelValue( titleModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "title" ) ) )
			Engine.SetModelValue( descriptionModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "description" ) ) )
			Engine.SetModelValue( iconIdModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "iconId" ) ) )
			Engine.SetModelValue( statPercentModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "statPercent" ) ) )
			Engine.SetModelValue( statFractionTextModel, Engine.GetModelValue( Engine.GetModel( challengeNearestCompletion.model, "statFractionText" ) ) )
		end
		return zmNearCompletionModel
	end,
	getModel = function ( controller )
		local zmNearCompletionModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesZMNearCompletion" )
		if zmNearCompletionModel == nil then
			zmNearCompletionModel = DataSources.ChallengesZMNearCompletion.init( controller )
		end
		return zmNearCompletionModel
	end
}
DataSources.MasterCallingCard = {
	getModel = function ( controller )
		local masterCallingCardModel = Engine.GetModel( Engine.GetModelForController( controller ), "MasterCallingCard" )
		if masterCallingCardModel == nil then
			masterCallingCardModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MasterCallingCard" )
			Engine.CreateModel( masterCallingCardModel, "title" )
			Engine.CreateModel( masterCallingCardModel, "description" )
			Engine.CreateModel( masterCallingCardModel, "iconId" )
			Engine.CreateModel( masterCallingCardModel, "percentComplete" )
			Engine.CreateModel( masterCallingCardModel, "isLocked" )
		end
		return masterCallingCardModel
	end,
	setModelValues = function ( controller, titleValue, descriptionValue, iconIdValue, percentValue )
		local masterCallingCardModel = Engine.GetModel( Engine.GetModelForController( controller ), "MasterCallingCard" )
		if masterCallingCardModel == nil then
			masterCallingCardModel = DataSources.MasterCallingCard.getModel( controller )
		end
		Engine.SetModelValue( Engine.GetModel( masterCallingCardModel, "title" ), titleValue )
		Engine.SetModelValue( Engine.GetModel( masterCallingCardModel, "description" ), descriptionValue )
		Engine.SetModelValue( Engine.GetModel( masterCallingCardModel, "iconId" ), iconIdValue )
		Engine.SetModelValue( Engine.GetModel( masterCallingCardModel, "percentComplete" ), percentValue )
		Engine.SetModelValue( Engine.GetModel( masterCallingCardModel, "isLocked" ), percentValue < 1 )
	end
}
DataSources.SpecialContractsList = DataSourceHelpers.ListSetup( "SpecialContractsList", function ( controller )
	local returnTable = {}
	table.insert( returnTable, {
		models = {
			index = 0,
			name = Engine.Localize( "MPUI_CONTRACTS_SPECIAL_TITLE_CAPS" ),
			description = Engine.Localize( "MPUI_BM_CONTRACT_SPECIAL_DESC", Dvar.weapon_contract_target_value:get() ),
			cost = 0,
			targetValue = Dvar.weapon_contract_target_value:get(),
			isComplete = HasEarnedWeaponContract( controller ),
			category = "default",
			rewardDescription1 = rewardDescription1,
			rewardDescription2 = rewardDescription2,
			rewardDescription3 = rewardDescription3,
			backgroundId = 0
		},
		properties = {}
	} )
	local contractIndexColumn = 0
	local targetValueColumn = 2
	local nameStringColumn = 3
	local overrideTitleColumn = 4
	local contractTypeRow = 5
	local cryptokeyCostColumn = 6
	local callingCardStatColumn = 7
	local camoStatColumn = 8
	local statsMilestones = CoD.getStatsMilestoneTable( 6, Enum.eModes.MODE_MULTIPLAYER )
	local specialContractRows = Engine.TableFindRows( CoD.contractTable_mp, contractTypeRow, "special_contract" )
	if specialContractRows then
		for _, contractRow in ipairs( specialContractRows ) do
			local index = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, contractRow, contractIndexColumn )
			local targetValue = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, contractRow, targetValueColumn )
			local nameStringRef = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, contractRow, nameStringColumn )
			local overrideTitleRef = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, contractRow, overrideTitleColumn )
			local f735_local4 = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, contractRow, cryptokeyCostColumn )
			local callingCardStat = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, contractRow, callingCardStatColumn )
			local camoStat = Engine.TableLookupGetColumnValueForRow( CoD.contractTable_mp, contractRow, camoStatColumn )
			local f735_local3 = "CONTRACT_" .. nameStringRef
			if overrideTitleRef and overrideTitleRef ~= "" then
				f735_local3 = "CONTRACT_" .. overrideTitleRef
			end
			if not f735_local4 or f735_local4 == "" then
				f735_local4 = 0
			end
			local category = ""
			local image = ""
			local rewardDescription1 = ""
			local rewardDescription2 = ""
			local rewardDescription3 = ""
			local backgroundId = 0
			if callingCardStat ~= "" then
				category = "calling_card"
				rewardDescription1 = Engine.TableLookup( nil, statsMilestones, 4, callingCardStat, 12 )
				backgroundId = tonumber( Engine.TableLookup( nil, CoD.backgroundsTable, 4, rewardDescription1, 1 ) )
			elseif camoStat ~= "" then
				category = "camo"
				rewardDescription1 = "MPUI_" .. Engine.TableLookup( nil, statsMilestones, 4, callingCardStat, 9 )
			end
			table.insert( returnTable, {
				models = {
					index = index,
					name = Engine.Localize( f735_local3 ),
					description = Engine.Localize( "CONTRACT_" .. nameStringRef .. "_DESC", targetValue ),
					cost = tonumber( f735_local4 ),
					targetValue = targetValue,
					isComplete = false,
					category = category,
					rewardDescription1 = rewardDescription1,
					rewardDescription2 = rewardDescription2,
					rewardDescription3 = rewardDescription3,
					backgroundId = backgroundId
				},
				properties = {}
			} )
		end
	end
	return returnTable
end, true )
DataSources.CurrentSpecialContract = {
	getModel = function ( controller )
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local specialContractStats = stats.contracts[LuaUtils.BMContracts.specialContractIndex]
		local targetValueColumn = 2
		local nameStringColumn = 3
		local overrideTitleColumn = 4
		local cryptokeyCostColumn = 6
		local name = ""
		local description = ""
		local cost = 0
		local currentValue = 0
		local targetValue = 0
		local isComplete = false
		local category = ""
		local index = specialContractStats.index:get()
		if index == 0 then
			name = "MPUI_CONTRACTS_SPECIAL_TITLE_CAPS"
			description = "MPUI_BM_CONTRACT_SPECIAL_DESC"
			currentValue = stats.weaponContractData.currentValue:get()
			targetValue = Dvar.weapon_contract_target_value:get()
			isComplete = HasEarnedWeaponContract( controller )
		else
			currentValue = specialContractStats.progress:get()
			targetValue = tonumber( Engine.TableLookup( nil, CoD.contractTable_mp, 0, index, targetValueColumn ) )
			local nameStringRef = Engine.TableLookup( nil, CoD.contractTable_mp, 0, index, nameStringColumn )
			local overrideTitleRef = Engine.TableLookup( nil, CoD.contractTable_mp, 0, index, overrideTitleColumn )
			cost = Engine.TableLookup( nil, CoD.contractTable_mp, 0, index, cryptokeyCostColumn )
			isComplete = targetValue <= currentValue
			description = "CONTRACT_" .. nameStringRef .. "_DESC"
			name = "CONTRACT_" .. nameStringRef
			if overrideTitleRef and overrideTitleRef ~= "" then
				name = "CONTRACT_" .. overrideTitleRef
			end
		end
		if not cost or cost == "" then
			cost = 0
		end
		local percentComplete = 0
		if targetValue > 0 then
			percentComplete = currentValue / targetValue
		end
		local currentSpecialContractModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CurrentSpecialContract" )
		Engine.SetModelValue( Engine.CreateModel( currentSpecialContractModel, "index" ), index )
		Engine.SetModelValue( Engine.CreateModel( currentSpecialContractModel, "name" ), Engine.Localize( name ) )
		Engine.SetModelValue( Engine.CreateModel( currentSpecialContractModel, "description" ), Engine.Localize( description, targetValue ) )
		Engine.SetModelValue( Engine.CreateModel( currentSpecialContractModel, "percentComplete" ), percentComplete )
		Engine.SetModelValue( Engine.CreateModel( currentSpecialContractModel, "fractionText" ), Engine.Localize( "MPUI_X_SLASH_Y", currentValue, targetValue ) )
		Engine.SetModelValue( Engine.CreateModel( currentSpecialContractModel, "cost" ), tonumber( cost ) )
		Engine.SetModelValue( Engine.CreateModel( currentSpecialContractModel, "isComplete" ), isComplete )
		return currentSpecialContractModel
	end
}
DataSources.PrestigeStats = {
	getModel = function ( controller )
		local prestigeStatsModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PrestigeStats" )
		local mode = CoD.PrestigeUtility.GetPrestigeGameMode()
		local currentPLevel = CoD.PrestigeUtility.GetCurrentPLevel( controller )
		local nextPLevel = currentPLevel
		local iconString = ""
		local iconId = 0
		if not IsMaxPrestigeLevel( controller ) then
			nextPLevel = currentPLevel + 1
		elseif IsGameModeParagonCapable( mode ) then
			local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, mode )
			iconId = currentStats.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
		end
		if iconId == 0 then
			iconString = Engine.GetRankIcon( 0, nextPLevel, mode )
		else
			iconString = Engine.GetParagonIconById( iconId, mode )
		end
		Engine.SetModelValue( Engine.CreateModel( prestigeStatsModel, "icon" ), iconString )
		Engine.SetModelValue( Engine.CreateModel( prestigeStatsModel, "backgroundId" ), CoD.PrestigeUtility.GetBackgroundIdByPLevel( controller, nextPLevel ) )
		Engine.SetModelValue( Engine.CreateModel( prestigeStatsModel, "plevel" ), currentPLevel )
		return prestigeStatsModel
	end
}
DataSources.PrestigeButtonInfopane = {
	getModel = function ( controller )
		local prestigeButtonInfopaneModel = Engine.CreateModel( Engine.GetGlobalModel(), "PrestigeButtonInfopane" )
		Engine.CreateModel( prestigeButtonInfopaneModel, "title" )
		Engine.CreateModel( prestigeButtonInfopaneModel, "description" )
		return prestigeButtonInfopaneModel
	end
}
DataSources.PersonalDataVault_CareerData = ListHelper_SetupDataSource( "PDV_CareerDataList", function ( controller )
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
end )
DataSources.PersonalDataVault_MissionLocations = ListHelper_SetupDataSource( "PDV_MissionLocList", function ( controller )
	local mapsWithCollectibles = {}
	for map_name, mapData in pairs( CoD.MapUtility.MapsTable ) do
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
end )
DataSources.CollectiblesList = ListHelper_SetupDataSource( "PDV_CollectiblesList", function ( controller )
	local collectiblesList = {}
	for map_name, mapData in pairs( CoD.MapUtility.MapsTable ) do
		if mapData.collectibles and mapData.collectibles ~= "" and (not CoD.perController[controller].inspectingMap or CoD.perController[controller].inspectingMap == map_name) then
			local collectibles = Engine.GetAssetList( mapData.collectibles )
			for index, collectible in ipairs( collectibles ) do
				if CoD.perController[controller].inspectingMap or CoD.perController[controller].inspectingCollectibleSize == collectible.slotSize then
					local isUnlocked = Engine.ClientHasCollectible( controller, map_name, index - 1 )
					if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "combatRecordMode" ) == "cp" then
						isUnlocked = ClientHasCollectible( controller, map_name, index - 1, true )
					end
					local f742_local6 = table.insert
					local f742_local7 = collectiblesList
					local f742_local8 = {}
					local f742_local9 = {
						name = collectible.name
					}
					local f742_local10
					if isUnlocked then
						f742_local10 = collectible.displayNameShort
						if not f742_local10 then
						
						else
							f742_local9.shortName = f742_local10
							f742_local9.longName = collectible.displayNameLong
							f742_local9.description = collectible.description
							f742_local9.image = collectible.uiMaterial
							f742_local9.imageLarge = collectible.uiMaterialLarge
							f742_local9.audioLog = collectible.audiolog_sound or ""
							f742_local9.mapDisplayName = mapData.mapName
							f742_local9.unlocked = isUnlocked
							f742_local8.models = f742_local9
							f742_local8.properties = {
								mapName = map_name,
								model = collectible.uiModel or "tag_origin",
								unlocked = isUnlocked
							}
							f742_local6( f742_local7, f742_local8 )
						end
					end
					f742_local10 = "COLLECTIBLE_NOT_FOUND_SHORT"
				end
			end
		end
	end
	local collectibleSortFn = function ( a, b )
		if a.models.unlocked and b.models.unlocked then
			local nameValueA = Engine.Localize( a.models.shortName )
			local nameValueB = Engine.Localize( b.models.shortName )
			return nameValueA < nameValueB
		end
		return a.models.unlocked and not b.models.unlocked
	end
	
	table.sort( collectiblesList, collectibleSortFn )
	return collectiblesList
end )
DataSources.CollectiblesListAAR = ListHelper_SetupDataSource( "PDV_CollectiblesList", function ( controller )
	local collectiblesList = {}
	local mapData = nil
	local lastMapName = Dvar.last_map:get()
	if not lastMapName then
		return collectiblesList
	end
	local lastRootMapName = CoD.MapUtility.MapsTable[lastMapName].rootMapName
	mapData = CoD.MapUtility.MapsTable[lastRootMapName]
	if mapData.collectibles and mapData.collectibles ~= "" then
		local collectibles = Engine.GetAssetList( mapData.collectibles )
		for index, collectible in ipairs( collectibles ) do
			local isUnlocked = Engine.ClientHasCollectible( controller, lastRootMapName, index - 1 )
			local f744_local4 = table.insert
			local f744_local5 = collectiblesList
			local f744_local6 = {}
			local f744_local7 = {
				name = collectible.name
			}
			local f744_local3
			if isUnlocked then
				f744_local3 = collectible.displayNameShort
				if not f744_local3 then
				
				else
					f744_local7.shortName = f744_local3
					f744_local7.longName = collectible.displayNameLong
					f744_local7.description = collectible.description
					f744_local7.image = collectible.uiMaterial
					f744_local7.imageLarge = collectible.uiMaterialLarge
					f744_local7.audioLog = collectible.audiolog_sound or ""
					f744_local7.mapDisplayName = mapData.mapName
					f744_local7.unlocked = isUnlocked
					f744_local6.models = f744_local7
					f744_local6.properties = {
						mapName = lastRootMapName,
						model = collectible.uiModel or "tag_origin",
						unlocked = isUnlocked
					}
					f744_local4( f744_local5, f744_local6 )
				end
			end
			f744_local3 = "COLLECTIBLE_NOT_FOUND_SHORT"
		end
	end
	local collectibleSortFn = function ( a, b )
		return b.models.unlocked and not a.models.unlocked
	end
	
	table.sort( collectiblesList, collectibleSortFn )
	return collectiblesList
end )
DataSources.BookmarksList = ListHelper_SetupDataSource( "BookmarksList", function ( controller )
	local bookmarksList = {}
	if Dvar.ui_codexindex_unlocked:get() then
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "index.htm",
				bookmarkDesc = "INDEX"
			},
			propteries = {}
		} )
	end
	table.insert( bookmarksList, {
		models = {
			bookmarkURL = "CIA-HomePage.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAHOME" )
		},
		propteries = {}
	} )
	table.insert( bookmarksList, {
		models = {
			bookmarkURL = "WinslowAccord-MainMenu.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_WINSLOWMAIN" )
		},
		propteries = {}
	} )
	table.insert( bookmarksList, {
		models = {
			bookmarkURL = "Omnipedia-WinslowAccord.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNIWINSLOW" )
		},
		propteries = {}
	} )
	table.insert( bookmarksList, {
		models = {
			bookmarkURL = "Omnipedia-CDP.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNICDP" )
		},
		propteries = {}
	} )
	table.insert( bookmarksList, {
		models = {
			bookmarkURL = "Omnipedia-CIA.htm",
			bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_OMNICIA" )
		},
		propteries = {}
	} )
	if HighestMapReachedGreaterThan( controller, 15 ) then
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "CEA-EgyptianForcesMoveAgainstNRC.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSEGYPT" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( controller, 6 ) then
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "CEA-GangViolenceSpillsIntoSingapore.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSGANG" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( controller, 8 ) then
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "CEA-VictoryisWithinOurGrasp.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_NEWSVICTORY" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( controller, 5 ) then
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "CIA-Krueger-FileEntryPoint.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAKRUEGER" )
			},
			propteries = {}
		} )
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "CIA-COALESCENCE-AudioLandingPage.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIASGEN" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( controller, 11 ) then
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "CIA-Infection-AudioLandingPage.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAINFECTION" )
			},
			propteries = {}
		} )
	end
	if HighestMapReachedGreaterThan( controller, 16 ) then
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "CIA-Zurich-AudioLandingPage.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_CIAZURICH" )
			},
			propteries = {}
		} )
		table.insert( bookmarksList, {
			models = {
				bookmarkURL = "WinslowAccord-TeamPhiAutopsy.htm",
				bookmarkDesc = Engine.Localize( "MENU_CODEX_BOOKMARK_WINSLOWTEAMPHI" )
			},
			propteries = {}
		} )
	end
	for map_name, mapData in pairs( CoD.MapUtility.MapsTable ) do
		if mapData.collectibles and mapData.collectibles ~= "" and (not CoD.perController[controller].inspectingMap or CoD.perController[controller].inspectingMap == map_name) then
			local collectibles = Engine.GetAssetList( mapData.collectibles )
			for index, collectible in ipairs( collectibles ) do
				local isUnlocked = Engine.ClientHasCollectible( controller, map_name, index - 1 )
				if isUnlocked then
					table.insert( bookmarksList, {
						models = {
							bookmarkURL = collectible.codexurl,
							bookmarkDesc = Engine.Localize( collectible.codexurldesc )
						},
						properties = {}
					} )
				end
			end
		end
	end
	return bookmarksList
end )
DataSources.GalleryList = ListHelper_SetupDataSource( "GalleryList", function ( controller )
	local galleryList = {}
	local cpMaps = {
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
	local currentStats = Engine.GetPlayerStats( controller )
	local gallery_image_list = Engine.GetAssetList( "cp_default_gallery" )
	for index = 1, #gallery_image_list, 1 do
		table.insert( galleryList, {
			models = {
				displayName = gallery_image_list[index].displayName,
				image = gallery_image_list[index].image,
				unlocked = true
			},
			properties = {
				mapName = "",
				unlocked = true
			}
		} )
	end
	for mapIndex = 1, #cpMaps, 1 do
		local mapName = cpMaps[mapIndex]
		local mapData = CoD.MapUtility.MapsTable[mapName]
		if currentStats.PlayerStatsByMap[mapName].hasBeenCompleted:get() ~= 1 then
			local f747_local2 = mapData.isSafeHouse
		else
			local imagesUnlocked = true
		end
		if f747_local2 then
			gallery_image_list = Engine.GetAssetList( mapName .. "_list" )
			if gallery_image_list ~= nil then
				for index = 1, #gallery_image_list, 1 do
					table.insert( galleryList, {
						models = {
							displayName = gallery_image_list[index].displayName,
							image = gallery_image_list[index].image,
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
	return galleryList
end )
DataSources.StartMenuCollectables = ListHelper_SetupDataSource( "StartMenuCollectables", function ( controller )
	local collectiblesList = {}
	local currentMapName = Dvar.ui_mapname:get()
	if LUI.endswith( currentMapName, "2" ) or LUI.endswith( currentMapName, "3" ) then
		currentMapName = string.sub( currentMapName, 0, string.len( currentMapName ) - 1 )
	end
	for map_name, mapData in pairs( CoD.MapUtility.MapsTable ) do
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
end )
DataSources.StartMenu = {
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
}
DataSources.PlaceCollectiblesTabs = ListHelper_SetupDataSource( "PDV_PlaceCollectiblesTab", function ( controller )
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
	if CoD.perController[controller].inspectingCollectibleSize then
		for _, item in ipairs( tabList ) do
			if item.properties and item.properties.collectibleSize == CoD.perController[controller].inspectingCollectibleSize then
				item.properties.selectIndex = true
				break
			end
		end
	end
	return tabList
end )
DataSources.CollectiblesLayout = {
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
				local f751_local3, f751_local4, f751_local5, f751_local7 = nil
				local f751_local9 = false
				local f751_local6, f751_local8 = nil
				local itemData = layoutData[slotIndex]
				if itemData and itemData.isSet and layoutItemModel then
					local mapData = CoD.MapUtility.MapsTable[itemData.mapName]
					if mapData and mapData.collectibles and mapData.collectibles ~= "" then
						local collectibleInfo = Engine.GetAssetInfoFromListIndex( mapData.collectibles, itemData.collectibleIndex )
						if collectibleInfo then
							f751_local3 = collectibleInfo.uiMaterial
							f751_local4 = collectibleInfo.uiMaterialLarge
							f751_local5 = collectibleInfo.displayNameLong
							f751_local6 = collectibleInfo.audioLog or ""
							f751_local7 = collectibleInfo.uiModel
							f751_local8 = mapData.mapName
							f751_local9 = true
						end
					end
				end
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "image" ), f751_local3 or "" )
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "imageLarge" ), f751_local4 or "" )
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "name" ), f751_local5 or "" )
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "model" ), f751_local7 or "tag_origin" )
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "audioLog" ), f751_local6 or "" )
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "collectibleSlot" ), slotIndex )
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "mapInfo" ), f751_local8 or "" )
				Engine.SetModelValue( Engine.CreateModel( layoutItemModel, "isSet" ), f751_local9 )
			end
		end
		return collectiblesLayoutModel
	end
}
DataSources.TrainingSimRatingInfo = ListHelper_SetupDataSource( "TrainingSimRatingInfo", function ( controller )
	local ratingList = {}
	local currentStats = Engine.GetPlayerStats( controller )
	local ratingAssets = Engine.GetAssetList( "rating_list" )
	if ratingAssets ~= nil then
		for i = 2, #ratingAssets, 1 do
			ratingList[i - 1] = {
				models = ratingAssets[i]
			}
			ratingList[i - 1].models.completed = currentStats.trainingSimStats.ranksAchieved[i - 1]:get() == 1
		end
	end
	return ratingList
end )
DataSources.MissionRecordVaultTabs = ListHelper_SetupDataSource( "MRV_MissionRecordVaultTabs", function ( controller )
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
	return tabList
end, false, {
	getCount = function ( list )
		local f754_local0 = list
		local f754_local1 = list.menu
		if f754_local1 then
			f754_local1 = list.menu:getModel()
			if f754_local1 then
				local missionSelectModel = Engine.GetModel( list.menu:getModel(), "showMissionSelect" )
				f754_local1 = f754_local0 and missionSelectModel
			end
		end
		local f754_local2 = f754_local1
		local showMissionSelect = Engine.GetModelValue( f754_local1 )
		return ListHelper_GetCount( list ) + (f754_local2 and showMissionSelect) - 1
	end,
	getItem = function ( controller, list, index )
		if 5 <= index then
			local f755_local0 = list
			local f755_local1 = list.menu
			if f755_local1 then
				f755_local1 = list.menu:getModel()
				if f755_local1 then
					local missionSelectModel = Engine.GetModel( list.menu:getModel(), "showMissionSelect" )
					f755_local1 = f755_local0 and missionSelectModel
				end
			end
			local f755_local2 = f755_local1
			local showMissionSelect = Engine.GetModelValue( f755_local1 )
			if (f755_local2 and showMissionSelect) ~= 1 then
				index = index + 1
			end
		end
		return ListHelper_GetItem( controller, list, index )
	end
} )
DataSources.MissionRecordVaultMapInfo = {
	getModel = function ( controller )
		local currentMissionModel = Engine.CreateModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo" )
		local mapModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		local f756_local0 = mapModel
		local mapId = Engine.GetModelValue( mapModel )
		local f756_local1 = f756_local0 and mapId
		local mapInfo = CoD.MapUtility.MapsTable[f756_local1]
		if mapInfo == nil then
			return currentMissionModel
		end
		Engine.SetModelValue( Engine.CreateModel( currentMissionModel, "mapId" ), f756_local1 )
		for i, field in ipairs( {
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
			Engine.SetModelValue( Engine.CreateModel( currentMissionModel, field ), mapInfo[field] )
		end
		local currentStats = Engine.GetPlayerStats( controller )
		local mapName = f756_local1
		if string.match( mapName, "[0-9]$" ) ~= nil then
			mapName = string.sub( mapName, 0, string.len( mapName ) - 1 )
		end
		local mapStats = currentStats.PlayerStatsByMap[mapName]
		if mapStats then
			for i, field in ipairs( {
				"SCORE",
				"KILLS",
				"ASSISTS",
				"HIGHEST_DIFFICULTY"
			} ) do
				local statValue = mapStats.highestStats[field]:get()
				Engine.SetModelValue( Engine.CreateModel( currentMissionModel, field ), statValue )
			end
		end
		local extraMapInfo = Engine.GetGDTCampaignMapInfo( f756_local1 )
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
}
DataSources.AARAccolades = ListHelper_SetupDataSource( "AARAccolades", function ( controller )
	local rootMapName = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "aarAccoladeMapName" ) )
	local f757_local0 = rootMapName
	local f757_local1 = CoD.MapUtility.MapsTable[rootMapName]
	if f757_local1 then
		local accoladeList = CoD.MapUtility.MapsTable[rootMapName].accoladelist
		f757_local1 = f757_local0 and accoladeList
	end
	local challengeList = {}
	local f757_local2 = f757_local1
	local accoladeList = Engine.GetAssetList( f757_local1 )
	local f757_local3 = f757_local2 and accoladeList
	if f757_local3 ~= nil then
		for i = 1, #f757_local3, 1 do
			challengeList[i] = {
				models = f757_local3[i]
			}
		end
		local fakeStats = {
			"2",
			"100",
			"17:20",
			"1",
			"0"
		}
		local currentStats = Engine.GetPlayerStats( controller )
		local firstReference = challengeList[1].models.challengeReference
		local baseAccoladeOffset = tonumber( Engine.TableLookup( CoD.statsMilestone, 0, 4, firstReference ) )
		for i = 1, #challengeList, 1 do
			local accoladeStatOffset = tonumber( Engine.TableLookup( CoD.statsMilestone, 0, 4, challengeList[i].models.challengeReference ) )
			local accoladeTargetValue = tonumber( Engine.TableLookup( CoD.statsMilestone, 2, 4, challengeList[i].models.challengeReference ) )
			local f757_local8 = Engine.TableLookup( CoD.statsMilestone, 2, 4, challengeList[i].models.challengeReference ) == "1"
			local accoladeState = currentStats.PlayerStatsByMap[rootMapName].accolades[accoladeStatOffset - baseAccoladeOffset].state:get()
			local accoladeValue = currentStats.PlayerStatsByMap[rootMapName].accolades[accoladeStatOffset - baseAccoladeOffset].value:get()
			local accoladeHighestValue = currentStats.PlayerStatsByMap[rootMapName].accolades[accoladeStatOffset - baseAccoladeOffset].highestValue:get()
			challengeList[i].models.completed = accoladeState ~= 0
			if f757_local8 then
				if challengeList[i].models.completed == true then
					challengeList[i].models.challengeProgressQuantity = ""
					challengeList[i].models.highestValue = ""
				else
					challengeList[i].models.challengeProgressQuantity = "CPUI_INCOMPLETE"
					challengeList[i].models.highestValue = "CPUI_INCOMPLETE"
				end
			else
				challengeList[i].models.challengeProgressQuantity = tostring( accoladeValue )
				challengeList[i].models.highestValue = tostring( accoladeHighestValue )
			end
			if IsCPAndInSafehouse() then
				challengeList[i].models.challengeProgressQuantity = challengeList[i].models.highestValue
			end
		end
	end
	return challengeList
end )
DataSources.MissionRecordVaultChallengeInfo = ListHelper_SetupDataSource( "MissionRecordVaultChallengeInfo", function ( controller )
	local nextMapName = Dvar.ui_mapname:get()
	if InSafehouseOrFrontend() then
		local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		nextMapName = nextMapNameModel and Engine.GetModelValue( nextMapNameModel )
	end
	local rootMapName = CoD.BaseUtility.GetMapValue( nextMapName, "rootMapName" )
	local f758_local0 = rootMapName
	local f758_local1 = CoD.MapUtility.MapsTable[rootMapName]
	if f758_local1 then
		local accoladeList = CoD.MapUtility.MapsTable[rootMapName].accoladelist
		f758_local1 = f758_local0 and accoladeList
	end
	local challengeList = {}
	local f758_local2 = f758_local1
	local accoladeList = Engine.GetAssetList( f758_local1 )
	local f758_local3 = f758_local2 and accoladeList
	if f758_local3 ~= nil then
		for i = 1, #f758_local3, 1 do
			challengeList[i] = {
				models = f758_local3[i]
			}
		end
		local fakeStats = {
			"2",
			"100",
			"17:20",
			"1",
			"0"
		}
		local currentStats = Engine.GetPlayerStats( controller )
		local statsMilestone = CoD.statsMilestone
		if CoD.SafeGetModelValue( Engine.GetGlobalModel(), "inBarracks" ) == true then
			currentStats = CoD.GetCombatRecordStats( controller )
			statsMilestone = CoD.getStatsMilestoneTable( 1, Enum.eModes.MODE_CAMPAIGN )
		end
		local mapName = CoD.MapUtility.MapsTable[nextMapName].rootMapName
		local firstReference = challengeList[1].models.challengeReference
		local baseAccoladeOffset = tonumber( Engine.TableLookup( statsMilestone, 0, 4, firstReference ) )
		for i = 1, #challengeList, 1 do
			local accoladeStatOffset = tonumber( Engine.TableLookup( statsMilestone, 0, 4, challengeList[i].models.challengeReference ) )
			local accoladeTargetValue = tonumber( Engine.TableLookup( statsMilestone, 2, 4, challengeList[i].models.challengeReference ) )
			local f758_local8 = Engine.TableLookup( statsMilestone, 2, 4, challengeList[i].models.challengeReference ) == "1"
			local accoladeState = currentStats.PlayerStatsByMap[mapName].accolades[accoladeStatOffset - baseAccoladeOffset].state:get()
			local accoladeValue = currentStats.PlayerStatsByMap[mapName].accolades[accoladeStatOffset - baseAccoladeOffset].value:get()
			local accoladeHighestValue = currentStats.PlayerStatsByMap[mapName].accolades[accoladeStatOffset - baseAccoladeOffset].highestValue:get()
			challengeList[i].models.completed = accoladeState ~= 0
			if f758_local8 then
				if challengeList[i].models.completed == true then
					challengeList[i].models.challengeProgressQuantity = ""
					challengeList[i].models.highestValue = ""
				else
					challengeList[i].models.challengeProgressQuantity = "CPUI_INCOMPLETE"
					challengeList[i].models.highestValue = "CPUI_INCOMPLETE"
				end
			else
				challengeList[i].models.challengeProgressQuantity = tostring( accoladeValue )
				challengeList[i].models.highestValue = tostring( accoladeHighestValue )
			end
			if IsCPAndInSafehouse() then
				challengeList[i].models.challengeProgressQuantity = challengeList[i].models.highestValue
			end
		end
	end
	return challengeList
end )
DataSources.WeaponCustomCategory = ListHelper_SetupDataSource( "WeaponCustomizationCategory", function ( controller )
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
	local mode = Engine.CurrentSessionMode()
	if mode == Enum.eModes.MODE_COUNT then
		mode = Enum.eModes.MODE_MULTIPLAYER
	end
	local currentWeaponName = Engine.GetWeaponString( controller, CoD.perController[controller].classNum, loadoutSlotName, mode )
	local camera = CoD.CACUtility.GetCameraNameForAttachments( currentWeaponName )
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
			properties = {
				weaponItemIndex = weaponItemIndex
			}
		}
	end
	
	local getWeaponOptionRow = function ( displayText, type, name, image, paintjobSlot, paintjobIndex, paintjobSlotAndIndex )
		local item = getBaseItemModels( displayText, type, name, image, paintjobSlot, paintjobIndex, paintjobSlotAndIndex )
		item.properties.viewWidget = "CoD.WeaponCustomizationSelect"
		item.properties.xcamNotetrack = camera
		return item
	end
	
	local paintjobSlotModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobslot" )
	local paintjobIndexModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobindex" )
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobSlotModel, "itemIndex" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobIndexModel, "itemIndex" ) )
	local displayText = nil
	if Paintjobs_IsEnabled( nil, controller ) and not IsUserContentRestricted( controller ) then
		local paintjobSlotAndIndex = paintjobSlot .. " " .. paintjobIndex
		table.insert( categoryList, getWeaponOptionRow( Engine.Localize( "MENU_FILESHARE_CATEGORY_PAINTJOBS" ), "paintjob", "", nil, paintjobSlot, paintjobIndex, paintjobSlotAndIndex ) )
	end
	local camoModel = Engine.GetModel( classModel, loadoutSlotName .. "camo" )
	local camoImage = Engine.GetModelValue( Engine.GetModel( camoModel, "image" ) )
	local camoName = Engine.GetModelValue( Engine.GetModel( camoModel, "name" ) )
	local camoWeaponOptionRow = getWeaponOptionRow( Engine.Localize( "MPUI_CAMO" ), "camo", camoName, camoImage, nil, nil, nil )
	camoWeaponOptionRow.properties.isCamo = true
	table.insert( categoryList, camoWeaponOptionRow )
	if AllowWeaponPrestige( controller ) then
		for index, ref in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
			local attachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponItemIndex, Engine.GetAttachmentIndexByRef( ref ) )
			if attachmentIndex and CoD.CACUtility.EmptyItemIndex < attachmentIndex then
				local name = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. CoD.CACUtility[loadoutSlotName .. "WeaponPrestigeSlot"] .. ".name" ) )
				local image = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. CoD.CACUtility[loadoutSlotName .. "WeaponPrestigeSlot"] .. ".image" ) )
				if name == "" then
				
				else
					table.insert( categoryList, getWeaponOptionRow( Engine.Localize( "MENU_WEAPON_PRESTIGE" ), CoD.CACUtility[loadoutSlotName .. "WeaponPrestigeSlot"], name, image, nil, nil, nil ) )
					break
				end
				name = "MPUI_NONE"
			end
		end
	end
	return categoryList
end, false )
DataSources.WeaponOptions = {
	prepare = function ( controller, list, filter )
		if not CoD.CACUtility.WeaponOptionsTable then
			CoD.CACUtility.WeaponOptionsTable = CoD.CACUtility.GetWeaponOptionsTable( controller, list, filter )
		end
		list.weaponOptions = CoD.CACUtility.WeaponOptionsTable
	end,
	getCount = function ( list )
		local currentFilter = DataSources.WeaponOptions.currentFilter
		if not currentFilter and list.weaponOptions.filterList then
			return #list.weaponOptions.filterList
		elseif list.weaponOptions[currentFilter] then
			return #list.weaponOptions[currentFilter]
		else
			return 0
		end
	end,
	getItem = function ( controller, list, index )
		local currentFilter = DataSources.WeaponOptions.currentFilter
		if not currentFilter and list.weaponOptions.filterList then
			return list.weaponOptions.filterList[index]
		elseif list.weaponOptions[currentFilter] then
			return list.weaponOptions[currentFilter][index]
		else
			
		end
	end,
	setCurrentFilterItem = function ( filter )
		DataSources.WeaponOptions.currentFilter = filter
	end,
	getCurrentFilterItem = function ()
		return DataSources.WeaponOptions.currentFilter
	end,
	currentFilter = nil,
	setCurrentFilterItemNoMode = function ( filter )
		DataSources.WeaponOptions.currentFilterNoMode = filter
	end,
	getCurrentFilterItemNoMode = function ()
		return DataSources.WeaponOptions.currentFilterNoMode
	end,
	currentFilterNoMode = nil
}
DataSources.GunsmithWeaponOptions = {
	prepare = function ( controller, list, filter )
		if not CoD.CACUtility.GunsmithWeaponOptionsTable then
			CoD.CACUtility.GunsmithWeaponOptionsTable = CoD.CACUtility.GetGunsmithWeaponOptionsTable( controller, list, filter )
		end
		list.gunsmithWeaponOptions = CoD.CACUtility.GunsmithWeaponOptionsTable
	end,
	getCount = function ( list )
		local currentFilter = DataSources.GunsmithWeaponOptions.currentFilter
		if not currentFilter and list.gunsmithWeaponOptions.filterList then
			return #list.gunsmithWeaponOptions.filterList
		elseif list.gunsmithWeaponOptions[currentFilter] then
			return #list.gunsmithWeaponOptions[currentFilter]
		else
			return 0
		end
	end,
	getItem = function ( controller, list, index )
		local currentFilter = DataSources.GunsmithWeaponOptions.currentFilter
		if not currentFilter and list.gunsmithWeaponOptions.filterList then
			return list.gunsmithWeaponOptions.filterList[index]
		elseif list.gunsmithWeaponOptions[currentFilter] then
			return list.gunsmithWeaponOptions[currentFilter][index]
		else
			
		end
	end,
	setCurrentFilterItem = function ( filter )
		DataSources.GunsmithWeaponOptions.currentFilter = filter
	end,
	getCurrentFilterItem = function ()
		return DataSources.GunsmithWeaponOptions.currentFilter
	end,
	currentFilter = nil,
	setCurrentFilterItemNoMode = function ( filter )
		DataSources.GunsmithWeaponOptions.currentFilterNoMode = filter
	end,
	getCurrentFilterItemNoMode = function ()
		return DataSources.GunsmithWeaponOptions.currentFilterNoMode
	end,
	currentFilterNoMode = nil
}
DataSources.AttachmentCosmeticVariantList = ListHelper_SetupDataSource( "AttachmentCosmeticVariantList", function ( controller )
	local acvList = {}
	local getBaseItemModels = function ( tableInfo, attachmentRef )
		local lootItemName = tableInfo.acvName
		local isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, lootItemName )
		local name = tableInfo.name
		if isBMClassified then
			name = CoD.BlackMarketUtility.ClassifiedName()
		end
		return {
			models = {
				name = Engine.Localize( name ),
				image = tableInfo.image or "blacktransparent",
				variantIndex = tableInfo.variantIndex,
				isBMClassified = isBMClassified,
				rarityType = {
					rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( lootItemName ),
					isBMClassified = isBMClassified,
					duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( controller, lootItemName )
				}
			},
			properties = {
				attachmentRef = attachmentRef,
				variantIndex = tableInfo.variantIndex,
				itemIndex = CoD.WC_Category.ACV.selectedAttachmentIndex,
				attachmentTableIndex = CoD.WC_Category.ACV.attachmentTable[attachmentRef].attachmentIndex
			}
		}
	end
	
	local defaultAttachmentImage = Engine.GetAttachmentUniqueImageByIndex( CoD.WC_Category.ACV.selectedAttachmentWeaponIndex, CoD.WC_Category.ACV.selectedAttachmentIndex )
	local attachmentRef = CoD.WC_Category.ACV.selectedAttachment
	if CoD.WC_Category.ACV.attachmentTable[attachmentRef] then
		local tableInfoNone = {
			name = "MENU_DEFAULT",
			image = defaultAttachmentImage,
			variantIndex = 0
		}
		local defaultEntry = getBaseItemModels( tableInfoNone, attachmentRef )
		defaultEntry.models.isClassified = false
		table.insert( acvList, defaultEntry )
		for index, tableInfo in ipairs( CoD.WC_Category.ACV.attachmentTable[attachmentRef].variants ) do
			table.insert( acvList, getBaseItemModels( tableInfo, attachmentRef ) )
		end
	end
	table.sort( acvList, CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex )
	return acvList
end, true )
DataSources.GunsmithAttachmentVariantList = ListHelper_SetupDataSource( "GunsmithAttachmentVariantList", function ( controller )
	local acvList = {}
	local getBaseItemModels = function ( tableInfo, attachmentRef, selectedAttachmentIndex )
		local isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, tableInfo.acvName )
		local name = tableInfo.name
		if isBMClassified then
			name = CoD.BlackMarketUtility.ClassifiedName()
		end
		local rarityString = CoD.BlackMarketUtility.GetRarityForLootItemFromName( tableInfo.acvName )
		return {
			models = {
				name = Engine.Localize( name ),
				image = tableInfo.image or "blacktransparent",
				variantIndex = tableInfo.variantIndex,
				isBMClassified = isBMClassified,
				attachmentIndex = selectedAttachmentIndex,
				rarityType = {
					rarity = rarityString,
					isBMClassified = isBMClassified
				}
			},
			properties = {
				attachmentRef = attachmentRef,
				variantIndex = tableInfo.variantIndex,
				attachmentTableIndex = selectedAttachmentIndex
			}
		}
	end
	
	local selectedAttachmentModel = CoD.perController[controller].gunsmithAttachmentModel
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local weaponPlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
	local attachmentVariantTable = Engine.GetAttachmentCosmeticVariantTable( weaponPlusAttachments )
	if selectedAttachmentModel and variantModel then
		local selectedAttachmentIndex = Engine.GetModelValue( selectedAttachmentModel )
		local attachmentRef = Engine.GetAttachmentRefByIndex( selectedAttachmentIndex )
		local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
		local defaultAttachmentImage = Engine.GetAttachmentUniqueImageByAttachmentIndex( Enum.eModes.MODE_MULTIPLAYER, weaponIndex, selectedAttachmentIndex )
		if attachmentVariantTable[attachmentRef] then
			local tableInfoNone = {
				name = "MENU_DEFAULT",
				image = defaultAttachmentImage,
				variantIndex = 0
			}
			local defaultEntry = getBaseItemModels( tableInfoNone, attachmentRef, selectedAttachmentIndex )
			defaultEntry.models.isClassified = false
			table.insert( acvList, defaultEntry )
			for index, tableInfo in ipairs( attachmentVariantTable[attachmentRef].variants ) do
				table.insert( acvList, getBaseItemModels( tableInfo, attachmentRef, selectedAttachmentIndex ) )
			end
		end
	end
	table.sort( acvList, CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex )
	return acvList
end, true )
DataSources.Arena = {
	getModel = function ( controller )
		local arenaModel = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
		local currentSeason = Engine.GetCurrentArenaSeason()
		local timeRemaining = Engine.GetCurrentArenaSeasonTimeRemaining()
		Engine.SetModelValue( Engine.CreateModel( arenaModel, "season" ), currentSeason )
		Engine.SetModelValue( Engine.CreateModel( arenaModel, "seasonTimeleft" ), timeRemaining )
		return arenaModel
	end
}
DataSources.ArenaRank = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "ArenaRank" )
	end
}
DataSources.ArenaInspectionStars = ListHelper_SetupDataSource( "ArenaInspectionStars", function ( controller )
	local arenaModel = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
	local selectedPlayerPointsModel = Engine.CreateModel( arenaModel, "selectedPlayerPoints" )
	local arenaPoints = Engine.GetModelValue( selectedPlayerPointsModel )
	local totalStars = CoD.ArenaUtility.GetRankVisibleStars( arenaPoints )
	local earnedStars = CoD.ArenaUtility.GetStarCount( arenaPoints )
	local points = {}
	for starIndex = 0, totalStars - 1, 1 do
		table.insert( points, {
			models = {
				earned = starIndex < earnedStars
			}
		} )
	end
	return points
end, nil, nil, function ( controller, list, listModel )
	local arenaModel = Engine.CreateModel( Engine.GetGlobalModel(), "Arena" )
	local selectedPlayerPointsModel = Engine.CreateModel( arenaModel, "selectedPlayerPoints" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( selectedPlayerPointsModel, function ()
		list:updateDataSource()
	end, false )
end )
DataSources.ArenaActiveRules = ListHelper_SetupDataSource( "ArenaActiveRules", function ( controller )
	local rules = {}
	if not IsArenaMode() then
		return rules
	elseif PregameItemVoteEnabled() then
		table.insert( rules, {
			models = {
				text = Engine.Localize( "MENU_BAN_PROTECT_ACTIVE_CAPS" )
			}
		} )
	end
	if CharacterDraftEnabled() then
		table.insert( rules, {
			models = {
				text = Engine.Localize( "MENU_DRAFT_ACTIVE_CAPS" )
			}
		} )
	end
	return rules
end, nil, nil, function ( controller, list, listModel )
	local lobbyRootModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot" )
	local lobbyNavModel = Engine.GetModel( lobbyRootModel, "lobbyNav" )
	if list.lobbyNavSubscription then
		list:removeSubscription( list.lobbyNavSubscription )
	end
	list.lobbyNavSubscription = list:subscribeToModel( lobbyNavModel, function ()
		list:updateDataSource( true, false )
	end, false )
end )
DataSources.FrontendVoip = {
	prepare = function ( controller, list, filter )
		
	end,
	getCount = function ( list )
		return LuaDefine.MAX_CLIENTS
	end,
	getItem = function ( controller, list, index )
		local voipInfoModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.voipInfo" )
		if voipInfoModel then
			return Engine.GetModel( voipInfoModel, "voip" .. tostring( index ) )
		else
			
		end
	end
}
DataSources.LoadingScreenPlayerListTeam1 = {
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
		local f791_local0 = Engine.GetGametypeSetting( "teamCount" ) < 2
		local maxMembersToShowOnEachTeam = 6
		if f791_local0 then
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
				local clantag = currClientData.clantag
				if f791_local0 or team == Enum.team_t.TEAM_ALLIES or team == Enum.team_t.TEAM_FREE then
					table.insert( lobbyClientData.teamInfo[1], {
						name = name,
						clantag = clantag,
						xuid = xuid,
						team = team
					} )
				elseif team == Enum.team_t.TEAM_AXIS then
					table.insert( lobbyClientData.teamInfo[2], {
						name = name,
						clantag = clantag,
						xuid = xuid,
						team = team
					} )
				end
				local selfXuid = Engine.GetXUID64( controller )
				if selfXuid == xuid then
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
			if not f791_local0 and selfTeam ~= Enum.team_t.TEAM_ALLIES then
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
						local isSelfPlayerNameModel = Engine.CreateModel( memberModel, "isSelfPlayerName" )
						local areXuidsEqual = false
						for controllerIter = 0, Engine.GetMaxControllerCount() - 1, 1 do
							local selfXuid = Engine.GetXUID64( controllerIter )
							areXuidsEqual = selfXuid == lobbyClientData.teamInfo[team][i].xuid
							if areXuidsEqual then
								break
							end
						end
						Engine.SetModelValue( isSelfPlayerNameModel, areXuidsEqual )
						Engine.SetModelValue( Engine.CreateModel( memberModel, "team" ), lobbyClientData.teamInfo[team][i].team )
					end
				end
			end
		else
			return 
		end
	end,
	getCount = function ( list )
		if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN ) then
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
}
DataSources.LoadingScreenPlayerListTeam2 = {
	prepare = function ( controller, list, filter )
		DataSources.LoadingScreenPlayerListTeam1.prepare( controller, list, filter )
	end,
	getCount = function ( list )
		if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN ) then
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
}
DataSources.MapInfo = {
	getModel = function ( controller )
		local globalModel = Engine.GetGlobalModel()
		local mapinfoModel = Engine.CreateModel( globalModel, "MapInfo" )
		local gameTypeIconModel = Engine.CreateModel( mapinfoModel, "gameTypeIcon" )
		Engine.SetModelValue( gameTypeIconModel, CoD.GetLoadingScreenGameTypeIconName() )
		local gameTypeTextModel = Engine.CreateModel( mapinfoModel, "gameType" )
		Engine.SetModelValue( gameTypeTextModel, Engine.GetCurrentGametypeName( controller ) )
		local mapNameModel = Engine.CreateModel( mapinfoModel, "mapName" )
		Engine.SetModelValue( mapNameModel, MapNameToLocalizedMapName( Engine.GetCurrentMap() ) )
		local mapImageModel = Engine.CreateModel( mapinfoModel, "mapImage" )
		local mapImage = MapNameToMapLoadingImage( controller, Dvar.ui_mapname:get() )
		Engine.SetModelValue( mapImageModel, mapImage )
		if not Engine.IsCampaignModeZombies() then
			local mapDateTimeModel = Engine.CreateModel( mapinfoModel, "dateTime" )
			Engine.SetModelValue( mapDateTimeModel, CoD.BaseUtility.GetMapValue( Engine.GetCurrentMapName(), "mapDateTime", "" ) )
		end
		local locationModel = Engine.CreateModel( mapinfoModel, "location" )
		Engine.SetModelValue( locationModel, Dvar.ls_maplocation:get() )
		return mapinfoModel
	end
}
DataSources.LoadingScreenTeamInfo = {
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
		local selfTeam = CoD.TeamUtility.GetTeamID( controller )
		local alliesInfo = {
			name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_ALLIES ),
			icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_ALLIES ),
			color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_ALLIES )
		}
		local axisInfo = {
			name = CoD.TeamUtility.GetTeamNameCaps( Enum.team_t.TEAM_AXIS ),
			icon = CoD.TeamUtility.GetTeamFactionIcon( Enum.team_t.TEAM_AXIS ),
			color = CoD.TeamUtility.GetTeamFactionColor( Enum.team_t.TEAM_AXIS )
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
		Engine.SetModelValue( mapNameModel, MapNameToLocalizedMapName( Engine.GetCurrentMap() ) )
		Engine.SetModelValue( locationModel, "" )
		Engine.SetModelValue( tipModel, CoD.HUDUtility.GetDidYouKnowString() )
		Engine.SetModelValue( statusTextModel, "" )
		Engine.SetModelValue( loadedFractionModel, 0 )
		return loadingScreenTeamInfoModel
	end
}
DataSources.AbilityWheel = {
	getModel = function ( controller )
		local buttonNumMapping = CoD.CACUtility.abilityButtonNumMapping
		local AbilityWheelRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "AbilityWheel" )
		local typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomRequestedType" )
		Engine.CreateModel( AbilityWheelRoot, "selectedAbilityDisplayName" )
		Engine.CreateModel( AbilityWheelRoot, "selectedAbilityDisplayDesc" )
		Engine.CreateModel( AbilityWheelRoot, "selectedAbilityDisplayIcon" )
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
			local f800_local2 = i
			local tacticalItemInfo, Ability = nil
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
			local enemyTypeIcon = Engine.CreateModel( Ability, "enemyTypeIcon" )
			if tacticalItemInfo.enemyTypeIcon ~= nil then
				Engine.SetModelValue( enemyTypeIcon, tacticalItemInfo.enemyTypeIcon )
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
}
DataSources.SwitchCameraWheel = {
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
}
DataSources.CommsMessages = ListHelper_SetupDataSource( "CommsMessages", function ( controller )
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
end )
DataSources.CommsWidget = {
	getModel = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		local commsWidgetModel = Engine.CreateModel( perControllerModel, "CommsWidget" )
		local characterNameModel = Engine.CreateModel( commsWidgetModel, "characterName" )
		Engine.SetModelValue( characterNameModel, "COOP_KANYE_RACHEL" )
		local characterImageModel = Engine.CreateModel( commsWidgetModel, "characterImage" )
		Engine.SetModelValue( characterImageModel, "t7_cp_hud_commswidget_rachel" )
		return commsWidgetModel
	end
}
DataSources.VehicleInfo = {
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
			f805_local0 = function ( modelName, valueTable )
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
							f805_local0( models[1], bindDataList[item] )
							table.remove( models, 1 )
							if #models == 0 then
								break
							end
						end
					end
					for i, item in ipairs( models ) do
						f805_local0( item, nil )
					end
				end
				
				local leftActions = reverseArray( leftBindPlacementListGamepad )
				processBindingModelsGamepad( leftActions, leftButtonModels, bindsInfoGamepad )
				local rightActions = reverseArray( rightBindPlacementListGamepad )
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
						local f810_local3 = getBindDataForAction( bindDataList, item )
						while f810_local3 ~= nil do
							f805_local0( models[1], f810_local3 )
							table.remove( models, 1 )
							if #models == 0 then
								
							end
							f810_local3 = getBindDataForAction( bindDataList, item )
						end
					end
					for i, item in ipairs( models ) do
						f805_local0( item, nil )
					end
				end
				
				local leftActions = reverseArray( keyboardBindPlacementList )
				processBindingModels( leftActions, leftButtonModels, bindsInfo )
				local rightActions = reverseArray( mouseBindPlacementList )
				processBindingModels( rightActions, index, bindsInfo )
			end
		end
	end,
	clearButtonModels = function ( controller )
		DataSources.VehicleInfo.setButtonModels( controller )
	end
}
DataSources.Attacker = {
	getModel = function ( controller )
		return Engine.GetModel( Engine.GetModelForController( controller ), "Attacker" )
	end
}
DataSources.Victim = {
	getModel = function ( controller )
		return Engine.GetModel( Engine.GetModelForController( controller ), "Victim" )
	end
}
DataSources.Player = {
	getModel = function ( controller )
		local controllerModel = Engine.GetModelForController( controller )
		local playerModel = controllerModel:get( "Player" )
		if playerModel == nil then
			playerModel = controllerModel:create( "Player" )
			local f815_local0 = playerModel:create( "clientNum" )
			f815_local0:set( Engine.GetClientNum( controller ) )
		end
		return playerModel
	end
}
DataSources.TopScorerMenuData = {
	getModel = function ( controller )
		return Engine.GetModel( Engine.GetModelForController( controller ), "topPlayerInfo" )
	end
}
DataSources.TopPlayerInfoData1 = {
	getModel = function ( controller )
		return Engine.GetModel( DataSources.TopScorerMenuData.getModel( controller ), "1" )
	end
}
DataSources.TopPlayerInfoData2 = {
	getModel = function ( controller )
		return Engine.GetModel( DataSources.TopScorerMenuData.getModel( controller ), "2" )
	end
}
DataSources.TopPlayerInfoData3 = {
	getModel = function ( controller )
		return Engine.GetModel( DataSources.TopScorerMenuData.getModel( controller ), "3" )
	end
}
DataSources.SelfPlayerInfoData = {
	getModel = function ( controller )
		return Engine.GetModel( Engine.GetModelForController( controller ), "selfPlayerInfo" )
	end
}
DataSources.SocialTabs = ListHelper_SetupDataSource( "SocialTabs", function ( controller )
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
	if Engine.IsInGame() == false then
		if CoD.isPC then
			local f821_local0 = table.insert
			local f821_local1 = tabList
			local f821_local2 = {
				models = {
					tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
					tabWidget = "CoD.Social_Party_PC"
				}
			}
			local f821_local3 = {
				tabId = "party",
				selectIndex = false
			}
			local f821_local4
			if Dvar.partyPrivacyEnabled:get() then
				f821_local4 = disablePartyManagerTab
			else
				f821_local4 = true
			end
			f821_local3.disabled = f821_local4
			f821_local2.properties = f821_local3
			f821_local0( f821_local1, f821_local2 )
		else
			local f821_local0 = table.insert
			local f821_local1 = tabList
			local f821_local2 = {
				models = {
					tabName = Engine.Localize( "MENU_TAB_PARTY_CAPS" ),
					tabWidget = "CoD.Social_Party"
				}
			}
			local f821_local3 = {
				tabId = "party",
				selectIndex = false
			}
			local f821_local4
			if Dvar.partyPrivacyEnabled:get() then
				f821_local4 = disablePartyManagerTab
			else
				f821_local4 = true
			end
			f821_local3.disabled = f821_local4
			f821_local2.properties = f821_local3
			f821_local0( f821_local1, f821_local2 )
		end
	end
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
	if IsGroupsEnabled() then
		table.insert( tabList, {
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
end, true )
DataSources.SocialOnlinePlayersList = ListHelper_SetupDataSource( "SocialOnlinePlayersList", function ( controller )
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
		local currTarget = LobbyData.GetLobbyMenuByID( currentMenuIdx )
		local gameActive = Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
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
				["identityBadge.xuid"] = playerInfo.xuid,
				["identityBadge.gamertag"] = playerInfo.gamertag,
				["identityBadge.clantag"] = clantag,
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
				mpRankIcon = GetRankIconLarge( playerInfo.mpRankIcon ),
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
end, nil, nil, function ( controller, list, listModel )
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
end )
DataSources.SocialMainMenu = {
	getModel = function ( controller )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu" )
		return model
	end
}
DataSources.SocialPlayersList = {
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
		elseif tabModelValue == "groupMembers" then
			list.showyourfriend = true
			list.showlastmet = false
			list.showGroupMemberStatus = true
			list.GetList = Engine.GetSelectedGroupMembersList
			list.GetParty = Engine.GetSelectedGroupMembersParty
			list.playerCount = Engine.GetSelectedGroupMembersCount( controller, list.filter )
			list.socialSubModel = Engine.GetModel( socialRootModel, "groupMembers" )
		elseif tabModelValue == "groupApplications" then
			list.showyourfriend = true
			list.showlastmet = false
			list.GetList = Engine.GetSelectedGroupApplicationsList
			list.playerCount = Engine.GetSelectedGroupApplicationsCount( controller, list.filter )
			list.socialSubModel = Engine.GetModel( socialRootModel, "groupApplications" )
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
			groupMemberStatus = 0
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
				playerInfo["identityBadge.xuid"] = playerInfo.xuid
				playerInfo["identityBadge.gamertag"] = playerInfo.gamertag
				playerInfo["identityBadge.clantag"] = playerInfo.clantag
				if list.showlastmet == 0 then
					playerInfo.titlePresence = ""
				end
				if list.showGroupMemberStatus then
					playerInfo.groupMemberStatus = Engine.GetSelectedGroupMemberStatus( playerInfo.xuid )
				end
				playerInfo.cpRankIcon = CoD.SocialUtility.GetRankIcons( "cp", playerInfo.cpPlayed, playerInfo.cpRank, playerInfo.cpPrestige )
				playerInfo.mpRankIcon = CoD.SocialUtility.GetRankIcons( "mp", playerInfo.mpPlayed, playerInfo.mpRank, playerInfo.mpPrestige )
				playerInfo.zmRankIcon = CoD.SocialUtility.GetRankIcons( "zm", playerInfo.zmPlayed, playerInfo.zmRank, playerInfo.zmPrestige )
				if playerInfo.mpPrestige == Engine.GetPrestigeCap( Enum.eModes.MODE_MULTIPLAYER ) then
					playerInfo.mpRank = Engine.GetParagonRankDisplayLevel( playerInfo.mpParagonRank, Enum.eModes.MODE_MULTIPLAYER )
					if playerInfo.mpParagonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
						playerInfo.mpRankIcon = Engine.GetParagonIconById( playerInfo.mpParagonIconId, Enum.eModes.MODE_MULTIPLAYER )
					end
				else
					playerInfo.mpRank = Engine.GetRankDisplayLevel( playerInfo.mpRank, Enum.eModes.MODE_MULTIPLAYER )
				end
				if playerInfo.zmPrestige == Engine.GetPrestigeCap( Enum.eModes.MODE_ZOMBIES ) then
					playerInfo.zmRank = Engine.GetParagonRankDisplayLevel( playerInfo.zmParagonRank, Enum.eModes.MODE_ZOMBIES )
					if playerInfo.zmParagonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
						playerInfo.zmRankIcon = Engine.GetParagonIconById( playerInfo.zmParagonIconId, Enum.eModes.MODE_ZOMBIES )
					end
				else
					playerInfo.zmRank = Engine.GetRankDisplayLevel( playerInfo.zmRank, Enum.eModes.MODE_ZOMBIES )
				end
				playerInfo.selected = Engine.IsFriendInInitialGroupInvitesList( playerInfo.xuid )
				playerInfo.playerCount = list.playerCount
				if playerInfo.mapid then
					local mapId = CoD.BaseUtility.GetMapIDFromMapUniqueID( playerInfo.mapid )
					if mapId then
						local dlcBit = Engine.GetDLCBitForMapName( mapId )
						local doIhaveMap = CoD.BitUtility.IsBitwiseAndNonZero( dlcBit, Engine.GetDLCBits() )
						local f828_local2
						if doIhaveMap then
							f828_local2 = playerInfo.joinable
							if not f828_local2 then
							
							else
								playerInfo.joinable = f828_local2
							end
						end
						f828_local2 = 10
					end
				end
				for key, value in pairs( playerInfo ) do
					local valueModel = Engine.GetModel( list.players[elementIndex].model, key )
					if valueModel ~= nil then
						Engine.SetModelValue( valueModel, value )
					end
					if list.players[elementIndex].properties[key] ~= nil then
						list.players[elementIndex].properties[key] = value
					end
				end
				Engine.SetModelValue( Engine.CreateModel( list.players[elementIndex].model, "activityString" ), GetPresenceActivityString( playerInfo ) )
				Engine.SetModelValue( Engine.CreateModel( list.players[elementIndex].model, "contextString" ), GetPresenceContextString( playerInfo ) )
				list.players[elementIndex].properties.showlastmet = list.showlastmet
				list.players[elementIndex].properties.showyourfriend = list.showyourfriend
				if list.GetParty then
					local party = list.GetParty( controller, offset + i - 1 )
					local numPartyMembers = playerInfo.partyMembers
					list.players[elementIndex].properties.party = {}
					if party then
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
}
DataSources.SocialPlayerPartyList = {
	prepare = function ( controller, list, filter )
		list.numElementsInList = list.vCount
		list.controller = controller
		local rootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local cacheModel = Engine.CreateModel( rootModel, "cache" )
		list.xuidModel = Engine.CreateModel( cacheModel, "xuid" )
		local partyModel = Engine.GetModel( rootModel, "party" )
		list.partyUpdate = Engine.CreateModel( partyModel, "update" )
		local availableModel = Engine.CreateModel( partyModel, "available" )
		local totalModel = Engine.CreateModel( partyModel, "total" )
		local leaderModel = Engine.CreateModel( partyModel, "leader" )
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
		return CoD.SafeGetModelValue( Engine.GetGlobalModel(), "socialRoot.party.available" ) or 0
	end,
	getItem = function ( controller, list, index )
		return list.partyMembers[index]
	end
}
DataSources.AARTabs = ListHelper_SetupDataSource( "AARTabs", function ( controller )
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
		if not IsLocal() then
			local xpColumn = Engine.TableLookupColumnNumForValue( CoD.scoreInfoTable, 0, Engine.GetCurrentGameType() .. " XP" )
			local medalsData = Engine.GetRecentMedals( controller, xpColumn )
			if medalsData and #medalsData > 0 then
				table.insert( tabList, {
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
				tabName = Engine.Localize( "CPUI_ACCOLADES" ),
				tabWidget = "CoD.MissionRecordVault_Challenges"
			},
			properties = {
				tabId = "accolades"
			}
		} )
		if not WasCampaignSoloGame( controller ) then
			table.insert( tabList, {
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
		if IsLive() then
			table.insert( tabList, {
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
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return tabList
end, true )
DataSources.AARPerformanceTabStats = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats" )
	end
}
DataSources.AARSPMGraph = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats.spmGraph" )
	end
}
DataSources.AARKDRGraph = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "aarStats.performanceTabStats.kdrGraph" )
	end
}
DataSources.Scoreboard = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "scoreboardInfo" )
	end
}
DataSources.ScoreboardTeam1ListCP = ListHelper_SetupDataSource( "scoreboardTeam1ListCP", function ( controller )
	return CoD.AARUtilityCP.GetScoreboardTeamTable( controller, 1 )
end )
DataSources.ScoreboardTeam1List = {
	prepare = function ( controller, list, filter )
		local codCasterModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCaster" )
		local showCasterBoardModel = Engine.CreateModel( codCasterModel, "showCodCasterScoreboard" )
		local showCasterBoard = Engine.GetModelValue( showCasterBoardModel )
		if showCasterBoard == true then
			list.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team3" )
		else
			list.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1" )
		end
		if list.teamCountSubscription then
			list:removeSubscription( list.teamCountSubscription )
		end
		list.teamCountSubscription = list:subscribeToModel( Engine.GetModel( list.scoreboardInfoModel, "count" ), function ()
			list:updateDataSource( nil, true, true )
			local scoreboardModel = Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			Engine.ForceNotifyModelSubscriptions( scoreboardModel )
		end, false )
		if list.showCasterScoreboardSubscription then
			list:removeSubscription( list.showCasterScoreboardSubscription )
		end
		list.showCasterScoreboardSubscription = list:subscribeToModel( showCasterBoardModel, function ()
			list:updateDataSource( nil, true, false )
			local scoreboardModel = Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			Engine.ForceNotifyModelSubscriptions( scoreboardModel )
		end, false )
	end,
	getCount = function ( list )
		local minRows = CoD.ScoreboardUtility.MinRowsToShowOnEachTeam
		if Engine.GetCurrentTeamCount() < 2 and not Engine.IsZombiesGame() and not Engine.IsCampaignGame() then
			minRows = CoD.ScoreboardUtility.MinRowsToShowOnEachTeamForFFA
		end
		return math.max( Engine.GetModelValue( Engine.GetModel( list.scoreboardInfoModel, "count" ) ), minRows )
	end,
	getItem = function ( controller, list, index )
		return Engine.GetModel( list.scoreboardInfoModel, index - 1 )
	end
}
DataSources.ScoreboardTeam2List = {
	prepare = function ( controller, list, filter )
		list.activeController = controller
		list.scoreboardInfoModel = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2" )
		if list.teamCountSubscription then
			list:removeSubscription( list.teamCountSubscription )
		end
		list.teamCountSubscription = list:subscribeToModel( Engine.GetModel( list.scoreboardInfoModel, "count" ), function ()
			list:updateDataSource( nil, true, true )
			local scoreboardModel = Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			Engine.ForceNotifyModelSubscriptions( scoreboardModel )
		end, false )
		if list.showCasterScoreboardSubscription then
			list:removeSubscription( list.showCasterScoreboardSubscription )
		end
		local codCasterModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCaster" )
		local showCasterBoardModel = Engine.CreateModel( codCasterModel, "showCodCasterScoreboard" )
		list.showCasterScoreboardSubscription = list:subscribeToModel( showCasterBoardModel, function ()
			list:updateDataSource( nil, true, true )
			local scoreboardModel = Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			Engine.ForceNotifyModelSubscriptions( scoreboardModel )
		end, false )
	end,
	getCount = function ( list )
		local showCasterBoard = false
		if Engine.IsInGame() then
			local codCasterModel = Engine.CreateModel( Engine.GetModelForController( list.activeController ), "CodCaster" )
			local showCasterBoardModel = Engine.CreateModel( codCasterModel, "showCodCasterScoreboard" )
			showCasterBoard = Engine.GetModelValue( showCasterBoardModel )
		end
		if IsGameTypeDOA() then
			return 0
		elseif showCasterBoard == true then
			return 0
		else
			return math.max( Engine.GetModelValue( Engine.GetModel( list.scoreboardInfoModel, "count" ) ), CoD.ScoreboardUtility.MinRowsToShowOnEachTeam )
		end
	end,
	getItem = function ( controller, list, index )
		return Engine.GetModel( list.scoreboardInfoModel, index - 1 )
	end
}
DataSources.CodCasterScoreboardTeam1List = {
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
}
DataSources.CodCasterScoreboardTeam2List = {
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
}
DataSources.FreeRun = {
	getModel = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		local freeRunModel = Engine.CreateModel( perControllerModel, "FreeRun" )
		local runStateModel = Engine.CreateModel( freeRunModel, "runState" )
		Engine.SetModelValue( runStateModel, 0 )
		local startTimeModel = Engine.CreateModel( freeRunModel, "startTime" )
		Engine.SetModelValue( startTimeModel, 0 )
		local pausedTimeModel = Engine.CreateModel( freeRunModel, "pausedTime" )
		Engine.SetModelValue( pausedTimeModel, 0 )
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
		local bestTime = Engine.GetModel( freeRunInfo, "bestTime" )
		if bestTime == nil then
			Engine.SetModelValue( Engine.CreateModel( freeRunInfo, "bestTime" ), 0 )
		end
		local faults = Engine.GetModel( freeRunInfo, "faults" )
		if faults == nil then
			Engine.SetModelValue( Engine.CreateModel( freeRunInfo, "faults" ), 0 )
		end
		local retries = Engine.CreateModel( freeRunInfo, "retries" )
		Engine.SetModelValue( retries, 0 )
		local timerModel = Engine.CreateModel( freeRunModel, "timer" )
		local currentTime = Engine.CreateModel( timerModel, "currentTime" )
		Engine.SetModelValue( currentTime, 0 )
		local timeAdjustment = Engine.CreateModel( timerModel, "timeAdjustment" )
		Engine.SetModelValue( timeAdjustment, 0 )
		local timeAdjustmentNegative = Engine.CreateModel( timerModel, "timeAdjustmentNegative" )
		Engine.SetModelValue( timeAdjustmentNegative, 0 )
		local bulletPenalty = Engine.CreateModel( freeRunInfo, "bulletPenalty" )
		Engine.SetModelValue( bulletPenalty, 0 )
		local activeCheckpoint = Engine.CreateModel( freeRunInfo, "activeCheckpoint" )
		Engine.SetModelValue( activeCheckpoint, 0 )
		return freeRunModel
	end
}
DataSources.RewardsCarousel = {
	prepare = function ( controller, list, filter )
		if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
			CoD.AARUtility.CreateModelsForRewards( controller )
		else
			CoD.AARUtilityCP.CreateModelsForRewards( controller )
		end
	end,
	getCount = function ( list )
		if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
			return CoD.AARUtility.GetRewardItemCount( list )
		else
			return CoD.AARUtilityCP.GetRewardItemCount( list )
		end
	end,
	getItem = function ( controller, list, index )
		if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() then
			return CoD.AARUtility.GetModelForRewardItemByIndex( controller, index )
		else
			return CoD.AARUtilityCP.GetModelForRewardItemByIndex( controller, index )
		end
	end,
	getWidgetTypeForItem = function ( list, dataItemModel, row, column )
		if CoD.isMultiplayer or CoD.isZombie then
			local widgetType = CoD.SafeGetModelValue( dataItemModel, "rewardCarouselWidgetType" )
			if widgetType and widgetType ~= "" then
				return LUI.getTableFromPath( widgetType )
			end
		end
		return nil
	end
}
DataSources.ZmPlayerStyles = {
	prepare = function ( controller, list, filter )
		
	end,
	getCount = function ( list )
		return 0
	end,
	getItem = function ( controller, list, index )
		return nil
	end
}
DataSources.DropdownListTest = {
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
}
DataSources.DeadSpectate = {
	getModel = function ( controller )
		return Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator" )
	end
}
DataSources.DebugSessionSearchQoSJoin = ListHelper_SetupDataSource( "DebugSessionSearchQoSJoin", function ( controller )
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
	Engine.LobbyEvent( "OnSessionSQJRefreshInfo", {
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
					noResults = "NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS - NO RESULTS",
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
			if publicIPAddress == nil then
				publicIPAddress = "0.0.0.0"
			end
			local privateIPAddress = getModelValue( dataEntryModel, "privateIPAddress" )
			if privateIPAddress == nil then
				privateIPAddress = "0.0.0.0"
			end
			local natType = getModelValue( dataEntryModel, "natType" )
			if natType == nil then
				natType = "UNKNOWN"
			end
			local ping = getModelValue( dataEntryModel, "ping" )
			if not ping then
				ping = "??? ms"
			end
			local status = getModelValue( dataEntryModel, "status" )
			if not status then
				status = " ------- "
			end
			table.insert( searchResults, {
				models = {
					noResults = "",
					xuid = xuid,
					gamertag = gamertag,
					publicIPAddress = publicIPAddress,
					privateIPAddress = privateIPAddress,
					natType = natType,
					qosPing = ping,
					status = status,
					searchStageColor = searchStageColor
				},
				properties = {
					disabled = false
				}
			} )
		end
	end
	return searchResults
end, nil, nil, function ( controller, list, listModel )
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
end )
DataSources.LobbyProcessQueueInfo = ListHelper_SetupDataSource( "LobbyProcessQueueInfo", function ( controller )
	local queue = {}
	local debugModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug" )
	local processQueueModel = Engine.CreateModel( debugModel, "processQueue" )
	local dataModel = Engine.CreateModel( processQueueModel, "data" )
	local processQueueCountModel = Engine.CreateModel( processQueueModel, "count" )
	local processQueueCount = Engine.GetModelValue( processQueueCountModel )
	if processQueueCount then
		for index = 1, processQueueCount, 1 do
			local itemModel = Engine.GetModel( dataModel, tostring( index ) )
			if itemModel then
				table.insert( queue, {
					models = {
						processCancellable = Engine.GetModelValue( Engine.GetModel( itemModel, "processCancellable" ) ),
						type = Engine.GetModelValue( Engine.GetModel( itemModel, "type" ) )
					}
				} )
				local actionCount = Engine.GetModelValue( Engine.GetModel( itemModel, "actionCount" ) )
				if actionCount > 0 then
					local actionsModel = Engine.GetModel( itemModel, "actions" )
					for actionIndex = 1, actionCount, 1 do
						local actionItemModel = Engine.GetModel( actionsModel, tostring( actionIndex ) )
						table.insert( queue, {
							models = {
								processState = Engine.GetModelValue( Engine.GetModel( actionItemModel, "processState" ) ),
								type = Engine.GetModelValue( Engine.GetModel( actionItemModel, "type" ) )
							}
						} )
					end
				end
			end
		end
	end
	return queue
end, nil, nil, function ( controller, list, listModel )
	local debugModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyDebug" )
	local processQueueModel = Engine.CreateModel( debugModel, "processQueue" )
	local updateModel = Engine.CreateModel( processQueueModel, "update" )
	if list.updateSubscription then
		list:removeSubscription( list.updateSubscription )
	end
	list.updateSubscription = list:subscribeToModel( updateModel, function ()
		list:updateDataSource()
	end, false )
end )
DataSources.LeaveLobbyPopup = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "LeaveLobbyPopup" )
		Engine.CreateModel( model, "popupType" )
		Engine.CreateModel( model, "title" )
		Engine.CreateModel( model, "hint" )
		return model
	end
}
DataSources.Blackhat = {
	getModel = function ( controller )
		return Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.blackhat" )
	end
}
DataSources.BrightnessSelector = ListHelper_SetupDataSource( "BrightnessSelector", function ( controller )
	local results = {}
	local range = 8
	local baseRGB = 29
	local current = Engine.ProfileFloat( controller, "r_sceneBrightness" )
	local halfDistanceBetweenItems = 1 / range * 2
	for i = 1, 2 * range + 1, 1 do
		local value = math.min( 1, math.max( -1, (i - range + 1) / range ) )
		local newRGB = 2 * (i - range + 1) + baseRGB
		local colorValue = newRGB .. " " .. newRGB .. " " .. newRGB
		local f883_local2 = table.insert
		local f883_local3 = results
		local f883_local4 = {
			models = {
				value = value,
				color = colorValue
			}
		}
		local f883_local5 = {}
		local f883_local6
		if value - halfDistanceBetweenItems > current or current > value + halfDistanceBetweenItems then
			f883_local6 = false
		else
			f883_local6 = true
		end
		f883_local5.selectIndex = f883_local6
		f883_local4.properties = f883_local5
		f883_local2( f883_local3, f883_local4 )
	end
	return results
end )
DataSources.ChatClientGlobal = {
	getModel = function ( controller )
		local model = CoD.ChatClientUtility.GetChatClientGlobalModel()
		CoD.ChatClientUtility.ResetAllModels( controller )
		return model
	end
}
DataSources.ChatClientEntriesList = {
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
			timeMs = 0,
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
}
DataSources.FirstTimeLanguageSelection = ListHelper_SetupDataSource( "FirstTimeLanguageSelection", function ( controller )
	local selectionList = {}
	if IsArabicSku() then
		table.insert( selectionList, {
			models = {
				image = "uie_language_english",
				action = ChangeLanguage,
				param = "englisharabic"
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
end )
DataSources.ZMQuestItemHolders = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory" )
	end
}
DataSources.ReticleBindings = {
	getModel = function ( controller )
		return Engine.CreateModel( Engine.GetModelForController( controller ), "reticleBindings" )
	end,
	createModelsForActions = function ( controller, actions )
		local base = DataSources.ReticleBindings.getModel( controller )
		Engine.UnsubscribeAndFreeModel( base )
		base = DataSources.ReticleBindings.getModel( controller )
		for _, action in ipairs( actions ) do
			local actionModel = Engine.CreateModel( base, action )
			local bindPlacement, bindPlacement2 = Engine.GetBindingButtonString( controller, "+" .. action )
			if bindPlacement then
				local imageMapping = CoD.ButtonMappings[bindPlacement]
				if imageMapping then
					local imageMapModel = Engine.GetModel( DataSources.Controller.Model, imageMapping )
					if imageMapModel then
						Engine.SetModelValue( actionModel, Engine.GetModelValue( imageMapModel ) )
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
DataSources.LiveEventViewerQualities = ListHelper_SetupDataSource( "LiveEventViewerQualities", function ( controller )
	local selectionList = {}
	local selectedQuality = Dvar.hls_quality:get()
	for _, quality in ipairs( CoD.LiveEventQualities ) do
		table.insert( selectionList, {
			models = {
				displayText = quality.display
			},
			properties = {
				qualityId = quality.qualityId,
				selectIndex = quality.qualityId == selectedQuality
			}
		} )
	end
	return selectionList
end, true, nil, function ( controller, list, listModel )
	DataSources.LiveEventViewerQualities.Update = function ()
		list:updateDatasource()
	end
	
	LUI.OverrideFunction_CallOriginalFirst( list, "close", function ()
		DataSources.LiveEventViewerQualities.Update = nil
	end )
end )
DataSources.OtherPlayerStats = {
	getModel = function ( controller )
		local model = Engine.CreateModel( Engine.GetGlobalModel(), "OtherPlayerStats" )
		return model
	end
}
DataSources.GlobalSources.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.GlobalSources" )
DataSources.Controller.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.Controller" )
DataSources.VehicleController.Model = Engine.CreateModel( Engine.GetGlobalModel(), "DataSources.VehicleController" )
DataSources.WarHeadings = {
	prepare = function ( controller, list, filter )
		list.model = Engine.CreateModel( Engine.GetModelForController( controller ), "DataSources.WarHeadings" )
		local warInfo = Engine.GetAssetInfo( "warscoring" )
		local count = 0
		list.models = {}
		while warInfo["zone" .. count + 1 .. "TimeLimit1"] ~= nil do
			count = count + 1
			list.models[count] = list.model:create( count )
			local f900_local0 = list.models[count]:create( "displayText" )
			f900_local0:set( Engine.Localize( "MPUI_ZONE_NUM", count ) )
		end
		count = count + 1
		list.models[count] = list.model:create( count )
		local f900_local0 = list.models[count]:create( "displayText" )
		f900_local0:set( "MENU_TOTAL" )
	end,
	getModel = function ( controller, list )
		return list.model
	end,
	getCount = function ( list )
		return #list.models
	end,
	getItem = function ( controller, list, index )
		return list.models[index]
	end,
	getSpacerAfterColumn = function ( list, column, width )
		if column == #list.models - 1 or column == #list.models - 2 then
			return 20
		else
			return 0
		end
	end
}
DataSources.CPObjectiveUIData = {
	Initialize = function ( controller )
		if not DataSources.CPObjectiveUIData.subscriptionElement then
			DataSources.CPObjectiveUIData.subscriptionElement = {}
		end
		if not DataSources.CPObjectiveUIData.subscriptionElement[controller] then
			DataSources.CPObjectiveUIData.subscriptionElement[controller] = LUI.UIElement.new()
		end
		local baseModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.cpObjectiveUiData" )
		local modelsToInit = {
			currentZone = 1,
			enemyObjectiveCount = 0,
			enemyObjectiveComplete1 = false,
			enemyObjectiveComplete2 = false,
			enemyObjectiveComplete3 = false
		}
		for k, v in pairs( modelsToInit ) do
			if not baseModel[k] then
				local f905_local3 = baseModel:create( k )
				f905_local3:set( v )
			end
		end
		local teamId = CoD.TeamUtility.GetTeamID( controller )
		if teamId == Enum.team_t.TEAM_ALLIES or teamId == Enum.team_t.TEAM_AXIS then
			local teamName = Engine.GetFactionForTeam( teamId )
			local currentMap = Engine.GetCurrentMap()
			local zoneCount = CoD.BaseUtility.GetMapValue( currentMap, teamName .. "NumObjZones", 0 )
			v = CoD.BaseUtility.GetMapValue( currentMap, teamName .. "NumEnemyObj", 0 )
			baseModel:create( "notificationWidget" )
			baseModel.enemyObjectiveCount:set( v )
			if zoneCount == 1 then
				baseModel.notificationWidget:set( "CoD.CP_Notifications_OneStage" )
			elseif zoneCount == 2 then
				baseModel.notificationWidget:set( "CoD.CP_Notifications_TwoStage" )
			end
			DataSources.EmenyObjectiveDatasource = ListHelper_SetupDataSource( "EmenyObjectiveDatasource", function ( controller )
				local objectiveList = {}
				for index = 1, v, 1 do
					local f906_local2 = index
					table.insert( objectiveList, {
						models = {},
						properties = {}
					} )
				end
				return objectiveList
			end, true )
			baseModel:create( "enemyObjectiveDatasource" )
			baseModel.enemyObjectiveDatasource:set( "EmenyObjectiveDatasource" )
			for zoneIndex = 1, zoneCount, 1 do
				local zoneModel = baseModel:create( "zone" .. zoneIndex )
				zoneModel:create( "teamObjective" )
				zoneModel:create( "progressWidget" )
				zoneModel:create( "objectiveIcon" )
				local progressWidgetString = CoD.BaseUtility.GetMapValue( currentMap, "objZoneWidget_" .. teamName .. "_" .. zoneIndex, nil )
				if progressWidgetString and progressWidgetString ~= "None" then
					zoneModel.progressWidget:set( "CoD." .. progressWidgetString )
				end
				zoneModel.teamObjective:set( CoD.BaseUtility.GetMapValue( currentMap, "objZoneDesc_" .. teamName .. "_" .. zoneIndex, nil ) )
				zoneModel.objectiveIcon:set( CoD.BaseUtility.GetMapValue( currentMap, "objZoneIcon_" .. teamName .. "_" .. zoneIndex, nil ) )
			end
		end
		return baseModel
	end,
	getModel = function ( controller )
		local baseModel = Engine.GetModel( Engine.GetGlobalModel(), "hudItems.cpObjectiveUiData" )
		if not baseModel then
			baseModel = DataSources.CPObjectiveUIData.Initialize( controller )
		end
		return baseModel
	end
}
DataSources.ConvoyAirAssaultData = {
	Initialize = function ( controller )
		if not DataSources.ConvoyAirAssaultData.subscriptionElement then
			DataSources.ConvoyAirAssaultData.subscriptionElement = {}
		end
		if not DataSources.ConvoyAirAssaultData.subscriptionElement[controller] then
			DataSources.ConvoyAirAssaultData.subscriptionElement[controller] = LUI.UIElement.new()
		end
		local baseModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.convoyAirAssaultData" )
		local modelsToInit = {
			closestTruckProgress = 0,
			truckDestroyed1 = 0,
			truckDestroyed2 = 0,
			truckDestroyed3 = 0,
			truckDestroyed4 = 0,
			truckDestroyed5 = 0
		}
		for k, v in pairs( modelsToInit ) do
			if not baseModel[k] then
				local f908_local3 = baseModel:create( k )
				f908_local3:set( v )
			end
		end
	end,
	getModel = function ( controller )
		DataSources.ConvoyAirAssaultData.Initialize( controller )
		return Engine.GetModel( Engine.GetGlobalModel(), "hudItems.convoyAirAssaultData" )
	end
}
DataSources.DataControlData = {
	Initialize = function ( controller )
		local alreadyInitialized = true
		if not DataSources.DataControlData.subscriptionElement then
			DataSources.DataControlData.subscriptionElement = {}
		end
		if not DataSources.DataControlData.subscriptionElement[controller] then
			DataSources.DataControlData.subscriptionElement[controller] = LUI.UIElement.new()
			alreadyInitialized = false
		end
		if alreadyInitialized then
			return 
		end
		local baseModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.dataControlData" )
		local modelsToInit = {
			chargeState1 = 0,
			chargeState2 = 0,
			chargeState3 = 0,
			terminalStateA = 0,
			terminalStateB = 0,
			downloadProgress = 0
		}
		for k, v in pairs( modelsToInit ) do
			if not baseModel[k] then
				local f910_local3 = baseModel:create( k )
				f910_local3:set( v )
			end
		end
		f910_local0 = Engine.GetGlobalModel()
		f910_local0 = f910_local0.hudItems:create( "cpObjectiveUiData" )
		local enemyObjectiveCount = 0
		local teamId = CoD.TeamUtility.GetTeamID( controller )
		if teamId == Enum.team_t.TEAM_ALLIES then
			enemyObjectiveCount = CoD.BaseUtility.GetMapValue( Engine.GetCurrentMap(), "alliesNumEnemyObj", nil )
		elseif teamId == Enum.team_t.TEAM_AXIS then
			enemyObjectiveCount = CoD.BaseUtility.GetMapValue( Engine.GetCurrentMap(), "axisNumEnemyObj", nil )
		end
		k = enemyObjectiveCount == 2
		local onTerminalUpdate = function ()
			if baseModel.terminalStateA:get() ~= 1 and baseModel.terminalStateB:get() ~= 1 then
				local f911_local0 = false
			else
				local isAnyTerminalActive = true
			end
			if k then
				f910_local0.enemyObjectiveComplete1:set( f911_local0 )
			else
				local currentZone = 1
				if f911_local0 then
					currentZone = 2
				end
				f910_local0.currentZone:set( currentZone )
			end
		end
		
		local onDownloadProgressUpdate = function ()
			f910_local0.enemyObjectiveComplete2:set( baseModel.downloadProgress:get() >= 1 )
		end
		
		local onFirstChargeSet = function ()
			f910_local0.enemyObjectiveComplete1:set( baseModel.chargeState1:get() == 1 )
		end
		
		local onSecondChargeSet = function ()
			f910_local0.enemyObjectiveComplete2:set( baseModel.chargeState2:get() == 1 )
		end
		
		local onThirdChargeSet = function ()
			f910_local0.enemyObjectiveComplete3:set( baseModel.chargeState3:get() == 1 )
		end
		
		if not DataSources.DataControlData.subscriptionElement[controller].hasEscapeSubscriptions then
			DataSources.DataControlData.subscriptionElement[controller]:subscribeToModel( baseModel.terminalStateA, onTerminalUpdate )
			DataSources.DataControlData.subscriptionElement[controller]:subscribeToModel( baseModel.terminalStateB, onTerminalUpdate )
			if k then
				DataSources.DataControlData.subscriptionElement[controller]:subscribeToModel( baseModel.downloadProgress, onDownloadProgressUpdate )
			else
				DataSources.DataControlData.subscriptionElement[controller]:subscribeToModel( baseModel.chargeState1, onFirstChargeSet )
				DataSources.DataControlData.subscriptionElement[controller]:subscribeToModel( baseModel.chargeState2, onSecondChargeSet )
				DataSources.DataControlData.subscriptionElement[controller]:subscribeToModel( baseModel.chargeState3, onThirdChargeSet )
			end
			DataSources.DataControlData.subscriptionElement[controller].hasEscapeSubscriptions = true
		end
	end,
	getModel = function ( controller )
		DataSources.DataControlData.Initialize( controller )
		return Engine.GetModel( Engine.GetGlobalModel(), "hudItems.dataControlData" )
	end
}
DataSources.StageResults = {
	getModel = function ( controller )
		return Engine.GetModel( Engine.GetGlobalModel(), "StageResults" )
	end
}
DataSources.DataEscapeData = {
	Initialize = function ( controller )
		if not DataSources.DataEscapeData.subscriptionElement then
			DataSources.DataEscapeData.subscriptionElement = {}
		end
		if not DataSources.DataEscapeData.subscriptionElement[controller] then
			DataSources.DataEscapeData.subscriptionElement[controller] = LUI.UIElement.new()
		end
		local baseModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.dataEscapeData" )
		local modelsToInit = {
			escapeTeamProgress = 0,
			escapeTeamDistance = 0,
			escapeTeamAtExtraction = 0,
			escapeTeamVictory = 0,
			chaseTeamProgress = 0,
			chaseTeamDistance = 0,
			chaseTeamAtExtraction = 0,
			chaseTeamVictory = 0,
			vtolHealth = 0
		}
		for k, v in pairs( modelsToInit ) do
			if not baseModel[k] then
				local f918_local3 = baseModel:create( k )
				f918_local3:set( v )
			end
		end
		f918_local0 = Engine.GetGlobalModel()
		f918_local0 = f918_local0.hudItems:create( "cpObjectiveUiData" )
		local mapMissionType = CoD.BaseUtility.GetMapValue( Engine.GetCurrentMap(), "missionType", nil )
		if (mapMissionType ~= "de" or CoD.TeamUtility.GetTeamID( controller ) ~= Enum.team_t.TEAM_AXIS) and (mapMissionType ~= "sng" or CoD.TeamUtility.GetTeamID( controller ) ~= Enum.team_t.TEAM_ALLIES) then
			f918_local2 = false
		else
			f918_local2 = true
		end
		local onEscapeTeamAtExtraction = function ()
			if baseModel.escapeTeamAtExtraction:get() == 1 then
				if f918_local2 then
					f918_local0.currentZone:set( 2 )
				else
					f918_local0.enemyObjectiveComplete1:set( true )
				end
			end
		end
		
		local onChaseTeamAtExtraction = function ()
			if baseModel.chaseTeamAtExtraction:get() == 1 then
				if f918_local2 then
					f918_local0.enemyObjectiveComplete1:set( true )
				else
					f918_local0.currentZone:set( 2 )
				end
			end
		end
		
		local onEscapeTeamVictory = function ()
			f918_local0.enemyObjectiveComplete2:set( baseModel.escapeTeamVictory:get() == 1 )
		end
		
		local onChaseTeamVictory = function ()
			f918_local0.enemyObjectiveComplete2:set( baseModel.chaseTeamVictory:get() == 1 )
		end
		
		if not DataSources.DataEscapeData.subscriptionElement[controller].hasEscapeSubscriptions then
			DataSources.DataEscapeData.subscriptionElement[controller]:subscribeToModel( baseModel.escapeTeamAtExtraction, onEscapeTeamAtExtraction )
			DataSources.DataEscapeData.subscriptionElement[controller]:subscribeToModel( baseModel.chaseTeamAtExtraction, onChaseTeamAtExtraction )
			if f918_local2 then
				DataSources.DataEscapeData.subscriptionElement[controller]:subscribeToModel( baseModel.chaseTeamVictory, onChaseTeamVictory )
			else
				DataSources.DataEscapeData.subscriptionElement[controller]:subscribeToModel( baseModel.escapeTeamVictory, onEscapeTeamVictory )
			end
			DataSources.DataEscapeData.subscriptionElement[controller].hasEscapeSubscriptions = true
		end
	end,
	getModel = function ( controller )
		DataSources.DataEscapeData.Initialize( controller )
		return Engine.GetModel( Engine.GetGlobalModel(), "hudItems.dataEscapeData" )
	end
}
DataSources.MPLevelUp = {
	Slots = {
		{
			count = 2,
			prefix = "majorSlot",
			cacPrefix = "major"
		},
		{
			count = 4,
			prefix = "generalSlot",
			cacPrefix = "general"
		}
	},
	Initialize = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		local levelModel = perControllerModel:create( "hudItems.lplevel" )
		local MAJOR_UNLOCK_SLOTS_COUNT = 2
		local GENERAL_SLOTS_COUNT = 4
		local UNLOCK_SLOTS_COUNT = MAJOR_UNLOCK_SLOTS_COUNT + GENERAL_SLOTS_COUNT
		levelModel:create( "unlockTokens" )
		levelModel:create( "progress" )
		levelModel:create( "level" )
		for _, slotType in ipairs( DataSources.MPLevelUp.Slots ) do
			for f924_local4 = 1, slotType.count, 1 do
				local slotName = slotType.prefix .. f924_local4
				local slotModel = perControllerModel:create( "hudItems.lplevel." .. slotName )
				slotModel:create( "level" )
				slotModel:create( "icon" )
				local f924_local3 = slotModel:create( "unlockLevel" )
				f924_local3:set( 0 )
				slotModel:create( "itemIndex" )
				slotModel:create( "upgradedItemIndex" )
				slotModel:create( "title" )
				slotModel:create( "desc" )
				slotModel:create( "cost" )
			end
		end
		f924_local0 = function ( slotName, slotInfo )
			local slotModel = perControllerModel:create( "hudItems.lplevel." .. slotName )
			if slotInfo then
				slotModel.icon:set( slotInfo.image )
				slotModel.unlockLevel:set( slotInfo.unlockIngameLevel )
				slotModel.itemIndex:set( slotInfo.itemIndex )
				slotModel.title:set( slotInfo.name )
				slotModel.desc:set( slotInfo.desc )
				slotModel.cost:set( slotInfo.cost )
			else
				slotModel.icon:set( "blacktransparent" )
				slotModel.unlockLevel:set( 0 )
				slotModel.itemIndex:set( CoD.CACUtility.EmptyItemIndex )
				slotModel.upgradedItemIndex:set( CoD.CACUtility.EmptyItemIndex )
				slotModel.title:set( "" )
				slotModel.desc:set( "" )
				slotModel.cost:set( 0 )
			end
		end
		
		CoD.CACUtility.SetDefaultCACRoot( controller )
		f924_local1 = function ( positionRoleInventoryInfo, itemIndex )
			for _, slotType in pairs( positionRoleInventoryInfo ) do
				for _, itemInfo in ipairs( slotType ) do
					if itemInfo.itemIndex == itemIndex then
						return itemInfo
					end
				end
			end
		end
		
		local updateLevelUpOptions = function ( model )
			local characterIndex = perControllerModel.CharacterSelection.characterIndex:get()
			local f927_local0
			if characterIndex >= 0 then
				f927_local0 = Engine.GetPostionRoleInventoryInfo( Enum.eModes.MODE_MULTIPLAYER, characterIndex )
			else
				f927_local0 = false
			end
			if not f927_local0 then
				return 
			end
			local cacRoot = CoD.CACUtility.GetCACRoot( controller )
			local classIndex = Engine.GetPostionRoleCustomClassIndex( Engine.CurrentSessionMode(), characterIndex )
			local f927_local1 = cacRoot
			local f927_local2 = cacRoot.customclass
			if f927_local2 then
				local classRoot = cacRoot.customclass[classIndex]
				f927_local2 = f927_local1 and classRoot
			end
			for _, slotType in ipairs( DataSources.MPLevelUp.Slots ) do
				local slotIter = 1
				for f927_local8 = 1, slotType.count, 1 do
					local slotName = slotType.prefix .. f927_local8
					local cacId = slotType.cacPrefix .. f927_local8
					local f927_local6 = f927_local2
					local f927_local7 = f927_local2[cacId]
					if f927_local7 then
						local classItemIndex = f927_local2[cacId]:get()
						f927_local7 = f927_local6 and classItemIndex
					end
					local upgradedItemIndex = perControllerModel.hudItems.lplevel[slotName].upgradedItemIndex:get()
					local slotInfo = nil
					if upgradedItemIndex and upgradedItemIndex > CoD.CACUtility.EmptyItemIndex then
						slotInfo = f924_local1( f927_local0, upgradedItemIndex )
					end
					if not slotInfo and f927_local7 and f927_local7 > CoD.CACUtility.EmptyItemIndex then
						slotInfo = f924_local1( f927_local0, f927_local7 )
					end
					f924_local0( slotName, slotInfo )
				end
			end
		end
		
		if not DataSources.MPLevelUp.subscriptionElement then
			DataSources.MPLevelUp.subscriptionElement = {}
		end
		if not DataSources.MPLevelUp.subscriptionElement[controller] then
			DataSources.MPLevelUp.subscriptionElement[controller] = LUI.UIElement.new()
			local characterSelectionUpdatedModel = perControllerModel:create( "CharacterSelection.characterIndex" )
			DataSources.MPLevelUp.subscriptionElement[controller]:subscribeToModel( characterSelectionUpdatedModel, updateLevelUpOptions, true )
			for _, slotType in ipairs( DataSources.MPLevelUp.Slots ) do
				for f924_local9 = 1, slotType.count, 1 do
					local slotName = slotType.prefix .. f924_local9
					local f924_local8 = perControllerModel.hudItems.lplevel:create( slotName )
					local slotLevelModel = f924_local8:create( "level" )
					DataSources.MPLevelUp.subscriptionElement[controller]:subscribeToModel( slotLevelModel, updateLevelUpOptions, false )
				end
			end
			local classUpdatedModel = levelModel:create( "classUpdated" )
			DataSources.MPLevelUp.subscriptionElement[controller]:subscribeToModel( classUpdatedModel, updateLevelUpOptions, true )
		end
		return levelModel
	end,
	getModel = function ( controller )
		return DataSources.MPLevelUp.Initialize( controller )
	end
}
DataSources.LeftStick = {
	getModel = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		return perControllerModel:create( "LeftStick" )
	end
}
DataSources.RightStick = {
	getModel = function ( controller )
		local perControllerModel = Engine.GetModelForController( controller )
		return perControllerModel:create( "RightStick" )
	end
}
function createControllerBindings( controller, key, button_name, button_image, vehicle_button_image )
	Engine.SetModelValue( Engine.CreateModel( DataSources.Controller.Model, button_name ), button_image )
	Engine.SetModelValue( Engine.CreateModel( DataSources.VehicleController.Model, button_name ), vehicle_button_image or button_image )
	if key then
		CoD.ButtonMappings[key] = button_name
	end
end

function UpdateControllerBindings( controller, controllerType )
	if controller ~= 0 then
		return 
	elseif controllerType == Enum.gamepadType_e.GAMEPAD_TYPE_DURANGO then
		createControllerBindings( controller, "BUTTON_A", "primary_button_image", "xenonbutton_a" )
		createControllerBindings( controller, "BUTTON_B", "secondary_button_image", "xenonbutton_b" )
		createControllerBindings( controller, "BUTTON_X", "alt1_button_image", "xenonbutton_x" )
		createControllerBindings( controller, "BUTTON_Y", "alt2_button_image", "xenonbutton_y" )
		createControllerBindings( controller, "BUTTON_BACK", "back_button_image", "xenonbutton_back" )
		createControllerBindings( controller, "BUTTON_START", "start_button_image", "xenonbutton_start" )
		createControllerBindings( controller, "BUTTON_LSHLDR", "left_shoulder_button_image", "xenonbutton_lb", "t7_icons_controller_lbwhite" )
		createControllerBindings( controller, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_durango_lb_glow" )
		createControllerBindings( controller, "BUTTON_RSHLDR", "right_shoulder_button_image", "xenonbutton_rb", "t7_icons_controller_rbwhite" )
		createControllerBindings( controller, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_durango_rb_glow" )
		createControllerBindings( controller, "BUTTON_LSTICK", "left_stick_button_image", "ui_button_xenon_stick_ani_32_Ldown" )
		createControllerBindings( controller, "BUTTON_RSTICK", "right_stick_button_image", "ui_button_xenon_stick_ani_32_Rdown" )
		createControllerBindings( controller, nil, "move_left_stick_button_image", "t7_icons_controller_ls" )
		createControllerBindings( controller, nil, "move_right_stick_button_image", "t7_icons_controller_rs" )
		createControllerBindings( controller, "BUTTON_LTRIG", "left_trigger_button_image", "xenonbutton_lt", "t7_icons_controller_ltwhite" )
		createControllerBindings( controller, "BUTTON_RTRIG", "right_trigger_button_image", "xenonbutton_rt", "t7_icons_controller_rtwhite" )
		createControllerBindings( controller, nil, "dpad_all_button_image", "xenonbutton_dpad_all" )
		createControllerBindings( controller, nil, "dpad_lr_button_image", "xenonbutton_dpad_rl" )
		createControllerBindings( controller, nil, "dpad_ud_button_image", "xenonbutton_dpad_ud" )
		createControllerBindings( controller, "DPAD_UP", "dpad_up_button_image", "xenonbutton_dpad_up" )
		createControllerBindings( controller, "DPAD_DOWN", "dpad_down_button_image", "xenonbutton_dpad_down" )
		createControllerBindings( controller, "DPAD_LEFT", "dpad_left_button_image", "xenonbutton_dpad_left" )
		createControllerBindings( controller, "DPAD_RIGHT", "dpad_right_button_image", "xenonbutton_dpad_right" )
		createControllerBindings( controller, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		createControllerBindings( controller, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	elseif controllerType == Enum.gamepadType_e.GAMEPAD_TYPE_ORBIS then
		createControllerBindings( controller, "BUTTON_A", Engine.ShouldSwapControllerCircleAndCross() and "secondary_button_image" or "primary_button_image", "ps3button_x", Engine.ShouldSwapControllerCircleAndCross() and "ps3button_circle" or "ps3button_x" )
		createControllerBindings( controller, "BUTTON_B", Engine.ShouldSwapControllerCircleAndCross() and "primary_button_image" or "secondary_button_image", "ps3button_circle", Engine.ShouldSwapControllerCircleAndCross() and "ps3button_x" or "ps3button_circle" )
		createControllerBindings( controller, "BUTTON_X", "alt1_button_image", "ps3button_square" )
		createControllerBindings( controller, "BUTTON_Y", "alt2_button_image", "ps3button_triangle" )
		createControllerBindings( controller, "BUTTON_BACK", "back_button_image", "ps3button_select" )
		createControllerBindings( controller, "BUTTON_START", "start_button_image", "ps3button_start" )
		createControllerBindings( controller, "BUTTON_LSHLDR", "left_shoulder_button_image", "ps3button_l1", "t7_icons_controller_lbwhite" )
		createControllerBindings( controller, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
		createControllerBindings( controller, "BUTTON_RSHLDR", "right_shoulder_button_image", "ps3button_r1", "t7_icons_controller_rbwhite" )
		createControllerBindings( controller, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
		createControllerBindings( controller, "BUTTON_LSTICK", "left_stick_button_image", "ps3button_l3" )
		createControllerBindings( controller, "BUTTON_RSTICK", "right_stick_button_image", "ps3button_r3" )
		createControllerBindings( controller, nil, "move_left_stick_button_image", "t7_icons_controller_ls" )
		createControllerBindings( controller, nil, "move_right_stick_button_image", "t7_icons_controller_rs" )
		createControllerBindings( controller, "BUTTON_LTRIG", "left_trigger_button_image", "ps3button_l2", "t7_icons_controller_ltwhite" )
		createControllerBindings( controller, "BUTTON_RTRIG", "right_trigger_button_image", "ps3button_r2", "t7_icons_controller_rtwhite" )
		createControllerBindings( controller, nil, "dpad_all_button_image", "ps3button_dpad_all" )
		createControllerBindings( controller, nil, "dpad_lr_button_image", "ps3button_dpad_rl" )
		createControllerBindings( controller, nil, "dpad_ud_button_image", "ps3button_dpad_ud" )
		createControllerBindings( controller, "DPAD_UP", "dpad_up_button_image", "ps3button_dpad_up" )
		createControllerBindings( controller, "DPAD_DOWN", "dpad_down_button_image", "ps3button_dpad_down" )
		createControllerBindings( controller, "DPAD_LEFT", "dpad_left_button_image", "ps3button_dpad_left" )
		createControllerBindings( controller, "DPAD_RIGHT", "dpad_right_button_image", "ps3button_dpad_right" )
		createControllerBindings( controller, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		createControllerBindings( controller, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	else
		createControllerBindings( controller, "BUTTON_A", "primary_button_image", "ps3button_x" )
		createControllerBindings( controller, "BUTTON_B", "secondary_button_image", "ps3button_circle" )
		createControllerBindings( controller, "BUTTON_X", "alt1_button_image", "ps3button_square" )
		createControllerBindings( controller, "BUTTON_Y", "alt2_button_image", "ps3button_triangle" )
		createControllerBindings( controller, "BUTTON_BACK", "back_button_image", "ps3button_select" )
		createControllerBindings( controller, "BUTTON_START", "start_button_image", "ps3button_start" )
		createControllerBindings( controller, "BUTTON_LSHLDR", "left_shoulder_button_image", "ps3button_l1", "t7_icons_controller_lbwhite" )
		createControllerBindings( controller, nil, "left_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_l1_glow" )
		createControllerBindings( controller, "BUTTON_RSHLDR", "right_shoulder_button_image", "ps3button_r1", "t7_icons_controller_rbwhite" )
		createControllerBindings( controller, nil, "right_shoulder_button_image_glow", "uie_t7_icons_controller_orbis_r1_glow" )
		createControllerBindings( controller, "BUTTON_LSTICK", "left_stick_button_image", "ps3button_l3" )
		createControllerBindings( controller, "BUTTON_RSTICK", "right_stick_button_image", "ps3button_r3" )
		createControllerBindings( controller, nil, "move_left_stick_button_image", "ui_button_ps3_stick_ls_32" )
		createControllerBindings( controller, nil, "move_right_stick_button_image", "ui_button_ps3_stick_rs_32" )
		createControllerBindings( controller, "BUTTON_LTRIG", "left_trigger_button_image", "ps3button_l2", "t7_icons_controller_ltwhite" )
		createControllerBindings( controller, "BUTTON_RTRIG", "right_trigger_button_image", "ps3button_r2", "t7_icons_controller_rtwhite" )
		createControllerBindings( controller, nil, "dpad_all_button_image", "ps3button_dpad_all" )
		createControllerBindings( controller, nil, "dpad_lr_button_image", "ps3button_dpad_rl" )
		createControllerBindings( controller, nil, "dpad_ud_button_image", "ps3button_dpad_ud" )
		createControllerBindings( controller, "DPAD_UP", "dpad_up_button_image", "ps3button_dpad_up" )
		createControllerBindings( controller, "DPAD_DOWN", "dpad_down_button_image", "ps3button_dpad_down" )
		createControllerBindings( controller, "DPAD_LEFT", "dpad_left_button_image", "ps3button_dpad_left" )
		createControllerBindings( controller, "DPAD_RIGHT", "dpad_right_button_image", "ps3button_dpad_right" )
		createControllerBindings( controller, nil, "left_stick_move_image", "t7_icons_controller_ls" )
		createControllerBindings( controller, nil, "right_stick_move_image", "t7_icons_controller_rs" )
	end
	if CoD.isPC then
		createControllerBindings( controller, "KEY_MOUSE1", "mouse_left_button_image", "mousebuttonleft" )
		createControllerBindings( controller, "KEY_MOUSE2", "mouse_right_button_image", "mousebuttonright" )
		createControllerBindings( controller, "KEY_MOUSE3", "mouse_middle_button_image", "mousebuttonmiddle" )
		createControllerBindings( controller, "MWHEELUP", "mouse_wheelup_button_image", "mouseWheelUp" )
		createControllerBindings( controller, "MWHEELDOWN", "mouse_wheeldown_button_image", "mouseWheelDown" )
		createControllerBindings( controller, nil, "mouse_button_image", "mouse" )
	end
end

DataSources.InitControllerModelsAndSubscriptions = function ()
	UpdateControllerBindings( 0, Engine.GamepadType( 0 ) )
	for controller = 0, Engine.GetMaxControllerCount() - 1, 1 do
		local f933_local2 = controller
		local perControllerModel = Engine.GetModelForController( f933_local2 )
		Engine.CreateModel( perControllerModel, "hintText" )
		local clanTagModel = Engine.CreateModel( perControllerModel, "clanTag" )
		Engine.SetModelValue( clanTagModel, "" )
		if CoD.isPC and CoD.useController then
			if DataSourceHelpers.ControllerTypeSubscription == nil then
				DataSourceHelpers.ControllerTypeSubscription = {}
			end
			if DataSourceHelpers.ControllerTypeSubscription[f933_local2] == nil then
				DataSourceHelpers.ControllerTypeSubscription[f933_local2] = LUI.UIElement.new()
			end
			DataSourceHelpers.ControllerTypeSubscription[f933_local2]:unsubscribeFromAllModels()
			local perControllerModel = Engine.GetModelForController( f933_local2 )
			local ctModel = Engine.CreateModel( perControllerModel, "ControllerType" )
			DataSourceHelpers.ControllerTypeSubscription[f933_local2]:subscribeToModel( ctModel, function ( model )
				UpdateControllerBindings( f933_local2, Engine.GamepadType( f933_local2 ) )
			end, false )
		end
		Engine.CreateModel( perControllerModel, "WorldSpaceIndicators" )
		local scriptNotifyModel = Engine.CreateModel( perControllerModel, "scriptNotify" )
		Engine.SetModelValue( Engine.CreateModel( scriptNotifyModel, "numArgs" ), 0 )
		Engine.SetModelValue( scriptNotifyModel, "" )
		Engine.CreateModel( perControllerModel, "playerConnected" )
		Engine.CreateModel( perControllerModel, "playerDisconnected" )
		local hudItemsModel = Engine.CreateModel( perControllerModel, "hudItems" )
		Engine.CreateModel( hudItemsModel, "stickyImage" )
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
		Engine.CreateModel( hudItemsModel, "cybercomRequestedType" )
		Engine.CreateModel( hudItemsModel, "playerSpawned" )
		Engine.CreateModel( hudItemsModel, "ammoPickedUp" )
		Engine.CreateModel( hudItemsModel, "tacticalModeActivated" )
		Engine.CreateModel( hudItemsModel, "enhancedVisionActivated" )
		Engine.SetModelValue( Engine.CreateModel( hudItemsModel, "heroHoldProgress" ), 0 )
		local voipInfoModel = Engine.CreateModel( hudItemsModel, "voipInfo" )
		for voipInfo = 1, LuaDefine.MAX_CLIENTS, 1 do
			local voipInfoItem = Engine.CreateModel( voipInfoModel, "voip" .. voipInfo )
			Engine.SetModelValue( Engine.CreateModel( voipInfoItem, "status" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( voipInfoItem, "name" ), "" )
		end
		hudItemsModel:create( "minimapTopLeftUV" )
		hudItemsModel:create( "minimapBottomRightUV" )
		hudItemsModel:create( "spawnSelectEndTime" )
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
		local numConsoleEntries = 7
		local consoleModel = Engine.CreateModel( hudItemsModel, "console" )
		Engine.SetModelValue( Engine.CreateModel( consoleModel, "currentIndex" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( consoleModel, "numEntries" ), numConsoleEntries )
		for i = 0, numConsoleEntries - 1, 1 do
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
		Engine.SetModelValue( Engine.CreateModel( consoleModel, "numEntries" ), numConsoleEntries )
		for i = 0, numConsoleEntries - 1, 1 do
			local consoleEntryModel = Engine.CreateModel( consoleModel, "line" .. i )
			Engine.CreateModel( consoleEntryModel, "text0" )
			Engine.CreateModel( consoleEntryModel, "text0color" )
			Engine.CreateModel( consoleEntryModel, "icon0" )
			Engine.CreateModel( consoleEntryModel, "text1" )
			Engine.CreateModel( consoleEntryModel, "text1color" )
			Engine.CreateModel( consoleEntryModel, "icon1" )
			Engine.CreateModel( consoleEntryModel, "iconWidth" )
		end
		local killcamWeaponModel = Engine.CreateModel( hudItemsModel, "killcamWeapon" )
		Engine.CreateModel( killcamWeaponModel, "weaponName" )
		Engine.SetModelValue( killcamWeaponModel, 0 )
		for i = 0, 6, 1 do
			Engine.CreateModel( killcamWeaponModel, "attachment" .. i )
		end
		Engine.CreateModel( killcamWeaponModel, "killfeedicon" )
		Engine.CreateModel( killcamWeaponModel, "flip" )
		local vehicleModel = Engine.CreateModel( perControllerModel, "vehicle" )
		Engine.CreateModel( vehicleModel, "vehicleType" )
		DataSources.VehicleInfo.clearButtonModels( f933_local2 )
		if Engine.IsProfileSignedIn( f933_local2 ) then
			local f933_local6 = Engine.CreateModel( perControllerModel, "profile" )
			if f933_local6 then
				local initGamerProfileBoolModel = function ( name )
					local newModel = Engine.CreateModel( f933_local6, name )
					if newModel then
						Engine.SetModelValue( newModel, CoD.ExeProfileVarBool( f933_local2, name ) )
					end
				end
				
				initGamerProfileBoolModel( "tacticalModeShowDamage" )
				initGamerProfileBoolModel( "tacticalModeShowArchetype" )
				initGamerProfileBoolModel( "tacticalModeShowDistance" )
				initGamerProfileBoolModel( "tacticalModeShowStatus" )
				local initGamerProfileUintModel = function ( name )
					local newModel = Engine.CreateModel( f933_local6, name )
					if newModel then
						local value = 0
						local profile = Engine.GetPlayerCommonGamerProfile( f933_local2 )
						if profile ~= nil and profile[profileVarName] ~= nil then
							value = profile[profileVarName]:get()
						end
						Engine.SetModelValue( newModel, value )
					end
				end
				
				initGamerProfileBoolModel( "colorblindMode" )
			end
		end
		f933_local6 = Engine.CreateModel( perControllerModel, "CACMenu" )
		Engine.CreateModel( f933_local6, "numItemsToRemove" )
		Engine.CreateModel( f933_local6, "curWeaponVariantName" )
		Engine.CreateModel( f933_local6, "numWildcardItemsToRemove" )
		Engine.CreateModel( f933_local6, "currentHeroName" )
		Engine.CreateModel( f933_local6, "currentHeroImage" )
		Engine.CreateModel( f933_local6, "currentHeroLoadout" )
		Engine.CreateModel( perControllerModel, "unlockTokensCount" )
		Engine.CreateModel( perControllerModel, "permanentUnlockTokensCount" )
		local cryptoKeyModel = Engine.CreateModel( perControllerModel, "CryptoKeyProgress" )
		Engine.CreateModel( cryptoKeyModel, "keyCount" )
		Engine.CreateModel( cryptoKeyModel, "progress" )
		Engine.CreateModel( cryptoKeyModel, "codPoints" )
		Engine.SetModelValue( Engine.CreateModel( cryptoKeyModel, "animProgress" ), 0 )
		local factionModel = Engine.CreateModel( perControllerModel, "factions" )
		Engine.CreateModel( factionModel, "isCoDCaster" )
	end
	DataSources.PartyPrivacy.getModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "ButtonStates.ReevaluateDisabledStates" ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive", true ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.hideMenusForGameStart" ), 0 )
	if not Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), 0 )
	end
	Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.missions.captureMultiplierStatus" )
	local globalWarModel = Engine.CreateModel( Engine.GetGlobalModel(), "hudItems.war" )
	Engine.CreateModel( globalWarModel, "attackingTeam" )
	Engine.CreateModel( globalWarModel, "batteryState1" )
	Engine.CreateModel( globalWarModel, "batteryState2" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" )
	Engine.CreateModel( Engine.GetGlobalModel(), "pubstorageFilesChanged", true )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" )
	Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" )
	Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteMapPreviousGametype", true )
	Engine.CreateModel( Engine.GetGlobalModel(), "MapVote.mapVoteGameModeNext", true )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), false )
end

