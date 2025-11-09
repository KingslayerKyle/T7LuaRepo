CoD.CodCasterUtility = {}
CoD.CodCasterUtility.SetupUIModels = function ( f1_arg0 )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "CodCaster" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "showLoadout" ), false )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "showFullscreenMap" ), false )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "showSettingsSideBar" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "showQuickSettingsSideBar" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "profileSettingsUpdated" ), 0 )
end

CoD.CodCasterUtility.Options_ItemSelected = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	if CoD.ShoutcasterProfileVarValue( f2_arg2, f2_arg3 ) == f2_arg1.value then
		return 
	end
	CoD.SetShoutcasterProfileVarValue( f2_arg2, f2_arg3, f2_arg1.value )
	if f2_arg1.valueChangedCallback then
		f2_arg1.valueChangedCallback( f2_arg4, f2_arg2, f2_arg3, f2_arg1.value )
	end
end

CoD.CodCasterUtility.Options_RevertItemSelected = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3, f3_arg4, f3_arg5 )
	local f3_local0 = CoD.OptionsUtility.GetCustomProfileSelection( f3_arg2, f3_arg1.options, CoD.ShoutcasterProfileVarValue( f3_arg2, f3_arg3 ) )
	local f3_local1, f3_local2 = f3_arg0.Slider:getRowAndColumnForIndex( Engine.GetModelValue( f3_arg0:getModel( f3_arg2, "currentSelection" ) ) - 1 )
	f3_arg0.Slider:setActiveIndex( f3_local1, f3_local2, 0 )
end

CoD.CodCasterUtility.Options_GetProfileSelection = function ( f4_arg0, f4_arg1, f4_arg2 )
	return CoD.OptionsUtility.GetCustomProfileSelection( f4_arg0, f4_arg1, CoD.ShoutcasterProfileVarValue( f4_arg0, f4_arg2 ) )
end

