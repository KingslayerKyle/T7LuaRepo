CoD.OptionsUtility = {}
CoD.OptionsUtility.ItemSelectedFunction = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	if f1_arg3 then
		Engine.SetProfileVar( f1_arg2, f1_arg3, f1_arg1.value )
	end
end

CoD.OptionsUtility.GetCustomProfileSelection = function ( f2_arg0, f2_arg1, f2_arg2 )
	for f2_local3, f2_local4 in ipairs( f2_arg1 ) do
		if f2_arg1[f2_local3].value == f2_arg2 then
			return f2_local3
		end
	end
end

CoD.OptionsUtility.GetProfileSelection = function ( f3_arg0, f3_arg1, f3_arg2 )
	return CoD.OptionsUtility.GetCustomProfileSelection( f3_arg0, f3_arg1, tonumber( Engine.ProfileValueAsString( f3_arg0, f3_arg2 ) ) )
end

CoD.OptionsUtility.CreateOptionDataSource = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	DataSources[f4_arg1] = DataSourceHelpers.ListSetup( f4_arg1, function ( f5_arg0 )
		local f5_local0 = {}
		for f5_local4, f5_local5 in ipairs( f4_arg2 ) do
			table.insert( f5_local0, {
				models = {
					text = f4_arg2[f5_local4].name
				},
				properties = {
					value = f4_arg2[f5_local4].value,
					actionParam = f4_arg3,
					action = CoD.OptionsUtility.ItemSelectedFunction
				}
			} )
		end
		f5_local0[1].properties.first = true
		f5_local0[#f4_arg2].properties.last = true
		return f5_local0
	end, true )
	return f4_arg1
end

CoD.OptionsUtility.CustomItemSelectedFunction = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
	Engine.SetProfileVar( f6_arg2, f6_arg3, f6_arg1.value )
	f6_arg1.valueChangedCallback( f6_arg1.value )
end

CoD.OptionsUtility.CreateCustomOptionDataSource = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6 )
	DataSources[f7_arg1] = DataSourceHelpers.ListSetup( f7_arg1, function ( f8_arg0 )
		local f8_local0 = {}
		if not f7_arg5 then
			f7_arg5 = CoD.OptionsUtility.CustomItemSelectedFunction
		end
		for f8_local4, f8_local5 in ipairs( f7_arg2 ) do
			table.insert( f8_local0, {
				models = {
					text = f7_arg2[f8_local4].name
				},
				properties = {
					value = f7_arg2[f8_local4].value,
					options = f7_arg2,
					actionParam = f7_arg3,
					action = f7_arg5,
					valueChangedCallback = f7_arg4,
					revertAction = f7_arg6
				}
			} )
		end
		f8_local0[1].properties.first = true
		f8_local0[#f7_arg2].properties.last = true
		return f8_local0
	end, true )
	return f7_arg1
end

CoD.OptionsUtility.GametypeSettingsItemSelectedFunction = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	Engine.SetGametypeSetting( f9_arg3, f9_arg1.value )
	print( "Setting GametypeSetting: " .. f9_arg3 .. " to: " .. f9_arg1.value )
	local f9_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	Engine.SetModelValue( Engine.CreateModel( f9_local0, f9_arg3 ), f9_arg1.value )
	Engine.SetModelValue( Engine.CreateModel( f9_local0, "title" ), f9_arg1.title )
	Engine.SetModelValue( Engine.CreateModel( f9_local0, "description" ), f9_arg1.desc )
	Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, 1 )
end

CoD.OptionsUtility.CreateGametypeSettingsDataSource = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
	local f10_local0 = tonumber( Engine.GetGametypeSetting( f10_arg3 ) )
	if f10_local0 == nil then
		f10_local0 = 0
	end
	DataSources[f10_arg1] = DataSourceHelpers.ListSetup( f10_arg1, function ( f11_arg0 )
		local f11_local0 = {}
		for f11_local4, f11_local5 in ipairs( f10_arg2 ) do
			table.insert( f11_local0, {
				models = {
					text = f10_arg2[f11_local4].name
				},
				properties = {
					title = f10_arg2[f11_local4].title,
					desc = f10_arg2[f11_local4].desc,
					value = f10_arg2[f11_local4].value,
					actionParam = f10_arg3,
					action = CoD.OptionsUtility.GametypeSettingsItemSelectedFunction,
					selectIndex = f10_arg2[f11_local4].value == f10_local0,
					loopEdges = f10_arg4
				}
			} )
		end
		f11_local0[1].properties.first = true
		f11_local0[#f10_arg2].properties.last = true
		return f11_local0
	end, nil, nil, nil )
	return f10_arg1
end

CoD.OptionsUtility.CreateEnabledDisabledOptions = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	return {
		models = {
			name = Engine.Localize( f12_arg1 ),
			desc = Engine.Localize( f12_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f12_arg0, f12_arg4, {
				{
					name = Engine.Localize( "MENU_ENABLED" ),
					value = 1,
					title = f12_arg1,
					desc = f12_arg2
				},
				{
					name = Engine.Localize( "MENU_DISABLED" ),
					value = 0,
					title = f12_arg1,
					desc = f12_arg2
				}
			}, f12_arg3, true )
		},
		properties = {}
	}
end

CoD.OptionsUtility.CreateListOptions = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4, f13_arg5 )
	local f13_local0 = f13_arg4.setting or f13_arg3
	local f13_local1 = {}
	for f13_local5, f13_local6 in ipairs( f13_arg4.values ) do
		if f13_arg4.labels[f13_local5] then
			f13_local1[#f13_local1 + 1] = {
				name = Engine.Localize( f13_arg4.labels[f13_local5], f13_local6 ),
				value = f13_local6,
				title = f13_arg1,
				desc = f13_arg2
			}
		else
			f13_local1[#f13_local1 + 1] = {
				name = Engine.Localize( f13_arg4.labels[#f13_arg4.labels], f13_local6 ),
				value = f13_local6,
				title = f13_arg1,
				desc = f13_arg2
			}
		end
	end
	return {
		models = {
			name = Engine.Localize( f13_arg1 ),
			desc = Engine.Localize( f13_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f13_arg0, f13_arg5, f13_local1, f13_local0, true )
		},
		properties = {}
	}
end

CoD.OptionsUtility.CreateNamedSettings = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5 )
	local f14_local0 = {}
	for f14_local4, f14_local5 in ipairs( f14_arg5 ) do
		table.insert( f14_local0, {
			name = f14_local5.option,
			value = f14_local5.value,
			title = f14_arg1,
			desc = f14_arg2
		} )
	end
	return {
		models = {
			name = Engine.Localize( f14_arg1 ),
			desc = Engine.Localize( f14_arg2 ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f14_arg0, f14_arg3, f14_local0, f14_arg4 )
		},
		properties = {}
	}
end

