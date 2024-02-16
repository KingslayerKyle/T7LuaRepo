CoD.CodCasterUtility = {}
CoD.CodCasterUtility.SetupUIModels = function ( controller )
	local codcasterModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCaster" )
	Engine.SetModelValue( Engine.CreateModel( codcasterModel, "showLoadout" ), false )
	Engine.SetModelValue( Engine.CreateModel( codcasterModel, "showFullscreenMap" ), false )
	Engine.SetModelValue( Engine.CreateModel( codcasterModel, "showSettingsSideBar" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( codcasterModel, "showQuickSettingsSideBar" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( codcasterModel, "profileSettingsUpdated" ), 0 )
end

CoD.CodCasterUtility.Options_ItemSelected = function ( self, element, controller, actionParam, menu )
	if CoD.ShoutcasterProfileVarValue( controller, actionParam ) == element.value then
		return 
	end
	CoD.SetShoutcasterProfileVarValue( controller, actionParam, element.value )
	if element.valueChangedCallback then
		element.valueChangedCallback( menu, controller, actionParam, element.value )
	end
end

CoD.CodCasterUtility.Options_RevertItemSelected = function ( self, element, controller, actionParam, model, menu )
	local currentSelection = CoD.OptionsUtility.GetCustomProfileSelection( controller, element.options, CoD.ShoutcasterProfileVarValue( controller, actionParam ) )
	local model = self:getModel( controller, "currentSelection" )
	local selectedIndex = Engine.GetModelValue( model )
	local row, col = self.Slider:getRowAndColumnForIndex( selectedIndex - 1 )
	self.Slider:setActiveIndex( row, col, 0 )
end

CoD.CodCasterUtility.Options_GetProfileSelection = function ( controller, options, profileVarName )
	local profileVarValue = CoD.ShoutcasterProfileVarValue( controller, profileVarName )
	return CoD.OptionsUtility.GetCustomProfileSelection( controller, options, profileVarValue )
end

