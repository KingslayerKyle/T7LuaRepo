CoD.OptionsUtility = {}
CoD.OptionsUtility.ItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	if actionParam then
		Engine.SetProfileVar( controller, actionParam, element.value )
	end
end

CoD.OptionsUtility.GetCustomProfileSelection = function ( controller, options, value )
	for index, optionTable in ipairs( options ) do
		if options[index].value == value then
			return REG6
		end
	end
end

CoD.OptionsUtility.GetProfileSelection = function ( controller, options, stat )
	local statValue = Engine.ProfileValueAsString( controller, stat )
	return CoD.OptionsUtility.GetCustomProfileSelection( controller, options, tonumber( statValue ) )
end

CoD.OptionsUtility.CreateOptionDataSource = function ( controller, dataSourceName, options, profileStat )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					value = options[index].value,
					actionParam = profileStat,
					action = CoD.OptionsUtility.ItemSelectedFunction
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, true )
	return dataSourceName
end

CoD.OptionsUtility.CustomItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	Engine.SetProfileVar( controller, actionParam, element.value )
	element.valueChangedCallback( element.value )
end

CoD.OptionsUtility.CreateCustomOptionDataSource = function ( controller, dataSourceName, options, profileStat, valueChangedCallback, itemSelectedFunction, revertAction )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		if not itemSelectedFunction then
			itemSelectedFunction = CoD.OptionsUtility.CustomItemSelectedFunction
		end
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					value = options[index].value,
					options = options,
					actionParam = profileStat,
					action = itemSelectedFunction,
					valueChangedCallback = valueChangedCallback,
					revertAction = revertAction
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, true )
	return dataSourceName
end

CoD.OptionsUtility.GametypeSettingsItemSelectedFunction = function ( self, element, controller, actionParam, menu )
	Engine.SetGametypeSetting( actionParam, element.value )
	print( "Setting GametypeSetting: " .. actionParam .. " to: " .. element.value )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local updateModel = Engine.CreateModel( gametypeSettingsModel, actionParam )
	Engine.SetModelValue( updateModel, element.value )
	local titleModel = Engine.CreateModel( gametypeSettingsModel, "title" )
	Engine.SetModelValue( titleModel, element.title )
	local descriptionModel = Engine.CreateModel( gametypeSettingsModel, "description" )
	Engine.SetModelValue( descriptionModel, element.desc )
	Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, 1 )
end

CoD.OptionsUtility.CreateGametypeSettingsDataSource = function ( controller, dataSourceName, options, statName, loopEdges )
	local statValue = tonumber( Engine.GetGametypeSetting( statName ) )
	if statValue == nil then
		statValue = 0
	end
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		for index, optionTable in ipairs( options ) do
			table.insert( dataTable, {
				models = {
					text = options[index].name
				},
				properties = {
					title = options[index].title,
					desc = options[index].desc,
					value = options[index].value,
					actionParam = statName,
					action = CoD.OptionsUtility.GametypeSettingsItemSelectedFunction,
					selectIndex = options[index].value == statValue,
					loopEdges = loopEdges
				}
			} )
		end
		dataTable[1].properties.first = true
		dataTable[#options].properties.last = true
		return dataTable
	end, nil, nil, nil )
	return dataSourceName
end

CoD.OptionsUtility.CreateEnabledDisabledOptions = function ( controller, title, desc, statName, optionsDatasourceName )
	local options = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1,
			title = title,
			desc = desc
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0,
			title = title,
			desc = desc
		}
	}
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, statName, true )
		},
		properties = {}
	}
	return listInfo
end

CoD.OptionsUtility.CreateListOptions = function ( controller, title, desc, statName, settingInfo, optionsDatasourceName )
	local setting = settingInfo.setting or statName
	local options = {}
	for index, value in ipairs( settingInfo.values ) do
		if settingInfo.labels[index] then
			options[#options + 1] = {
				name = Engine.Localize( settingInfo.labels[REG11], REG12 ),
				value = REG12,
				title = title,
				desc = desc
			}
		else
			options[#options + 1] = {
				name = Engine.Localize( settingInfo.labels[#settingInfo.labels], REG12 ),
				value = REG12,
				title = title,
				desc = desc
			}
		end
	end
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, setting, true )
		},
		properties = {}
	}
	return listInfo
end

CoD.OptionsUtility.CreateNamedSettings = function ( controller, title, desc, optionsDatasourceName, statName, values )
	local options = {}
	for index, value in ipairs( values ) do
		table.insert( options, {
			name = value.option,
			value = REG11.value,
			title = title,
			desc = desc
		} )
	end
	local listInfo = {
		models = {
			name = Engine.Localize( title ),
			desc = Engine.Localize( desc ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( controller, optionsDatasourceName, options, statName )
		},
		properties = {}
	}
	return listInfo
end

