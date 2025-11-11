CoD.CodCasterUtility = {}
CoD.CodCasterUtility.codcasterTeamIdentityColorTable = "mp_codcaster_color_list"
CoD.CodCasterUtility.codcasterTeamIdentityLogoTable = "mp_codcaster_logo_list"
CoD.CodCasterUtility.TeamIdentity = {}
CoD.CodCasterUtility.GetCodCasterTeamColorList = function ( controller )
	local colorList = {}
	local teamIdentityColorListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TeamIdentity.ColorList" )
	local totalColors = Engine.StructTableRowCount( CoD.CodCasterUtility.codcasterTeamIdentityColorTable )
	for index = 0, totalColors - 1, 1 do
		local red = Engine.StructTableLookupNumber( CoD.CodCasterUtility.codcasterTeamIdentityColorTable, "id", index, "colorR" )
		local green = Engine.StructTableLookupNumber( CoD.CodCasterUtility.codcasterTeamIdentityColorTable, "id", index, "colorG" )
		local blue = Engine.StructTableLookupNumber( CoD.CodCasterUtility.codcasterTeamIdentityColorTable, "id", index, "colorB" )
		local colorModel = Engine.CreateModel( teamIdentityColorListModel, "color_" .. index )
		Engine.SetModelValue( Engine.CreateModel( colorModel, "id" ), index )
		Engine.SetModelValue( Engine.CreateModel( colorModel, "color" ), string.format( "%d %d %d", red, green, blue ) )
		table.insert( colorList, colorModel )
	end
	return colorList
end

CoD.CodCasterUtility.GetCodCasterTeamColorInformation = function ( controller, index, key )
	if not CoD.CodCasterUtility.TeamIdentity.ColorList then
		CoD.CodCasterUtility.TeamIdentity.ColorList = CoD.CodCasterUtility.GetCodCasterTeamColorList( controller )
	end
	local teamIdentityColorListModel = Engine.GetModel( Engine.GetModelForController( controller ), "TeamIdentity.ColorList" )
	local colorModel = Engine.GetModel( teamIdentityColorListModel, "color_" .. index )
	if not colorModel then
		return nil
	else
		local colorInfoModel = Engine.GetModel( colorModel, key )
		if not colorInfoModel then
			return nil
		else
			return Engine.GetModelValue( colorInfoModel )
		end
	end
end

CoD.CodCasterUtility.GetCodCasterTeamLogoList = function ( controller )
	local logoList = {}
	local teamIdentityLogoListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TeamIdentity.LogoList" )
	local totalLogos = Engine.StructTableRowCount( CoD.CodCasterUtility.codcasterTeamIdentityLogoTable )
	for index = 0, totalLogos - 1, 1 do
		local name = Engine.StructTableLookupString( CoD.CodCasterUtility.codcasterTeamIdentityLogoTable, "id", index, "logo_name" )
		local ref = Engine.StructTableLookupString( CoD.CodCasterUtility.codcasterTeamIdentityLogoTable, "id", index, "logo_icon" )
		local logoModel = Engine.CreateModel( teamIdentityLogoListModel, "logo_" .. index )
		Engine.SetModelValue( Engine.CreateModel( logoModel, "id" ), index )
		Engine.SetModelValue( Engine.CreateModel( logoModel, "name" ), name )
		Engine.SetModelValue( Engine.CreateModel( logoModel, "ref" ), ref )
		table.insert( logoList, logoModel )
	end
	return logoList
end

CoD.CodCasterUtility.GetCodCasterTeamLogoInformation = function ( controller, index, key )
	if not CoD.CodCasterUtility.TeamIdentity.LogoList then
		CoD.CodCasterUtility.TeamIdentity.LogoList = CoD.CodCasterUtility.GetCodCasterTeamLogoList( controller )
	end
	local teamIdentityLogoListModel = Engine.GetModel( Engine.GetModelForController( controller ), "TeamIdentity.LogoList" )
	local logoModel = Engine.GetModel( teamIdentityLogoListModel, "logo_" .. index )
	if not logoModel then
		return nil
	else
		local logoInfoModel = Engine.GetModel( logoModel, key )
		if not logoInfoModel then
			return nil
		else
			return Engine.GetModelValue( logoInfoModel )
		end
	end
end

CoD.CodCasterUtility.GetCodCasterFactionIcon = function ( controller, team )
	local teamName = nil
	if team == Enum.team_t.TEAM_ALLIES then
		teamName = "team1"
	elseif team == Enum.team_t.TEAM_AXIS then
		teamName = "team2"
	end
	if teamName then
		local profileVar = "shoutcaster_fe_" .. teamName .. "_icon"
		local teamIcon = CoD.CodCasterUtility.GetCodCasterTeamLogoInformation( controller, CoD.ShoutcasterProfileVarValue( controller, profileVar ), "ref" )
		if teamIcon ~= nil then
			return teamIcon
		end
	end
	return CoD.CodCasterUtility.GetDefaultCodCasterFactionIcon( team )
end

CoD.CodCasterUtility.GetDefaultCodCasterFactionIcon = function ( team )
	if team == Enum.team_t.TEAM_ALLIES then
		return "uie_t7_codcaster_faction1"
	elseif team == Enum.team_t.TEAM_AXIS then
		return "uie_t7_codcaster_faction2"
	else
		return ""
	end
end

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

