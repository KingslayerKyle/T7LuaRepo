CoD.CPUtility = {}
CoD.CPUtility.DIFFICULTY = {}
CoD.CPUtility.DIFFICULTY[0] = "MENU_RECRUIT"
CoD.CPUtility.DIFFICULTY[1] = "MENU_REGULAR"
CoD.CPUtility.DIFFICULTY[2] = "MENU_HARDENED"
CoD.CPUtility.DIFFICULTY[3] = "MENU_VETERAN"
CoD.CPUtility.DIFFICULTY[4] = "MENU_HEROIC"
CoD.CPUtility.DIFFICULTY_DESC = {}
CoD.CPUtility.DIFFICULTY_DESC[0] = "MENU_DIFF_RECRUIT_DESC"
CoD.CPUtility.DIFFICULTY_DESC[1] = "MENU_DIFF_REGULAR_DESC"
CoD.CPUtility.DIFFICULTY_DESC[2] = "MENU_DIFF_HARDENED_DESC"
CoD.CPUtility.DIFFICULTY_DESC[3] = "MENU_DIFF_VETERAN_DESC"
CoD.CPUtility.DIFFICULTY_DESC[4] = "MENU_DIFF_HEROIC_DESC"
CoD.CPUtility.DIFFICULTY_ICON = {}
CoD.CPUtility.DIFFICULTY_ICON[0] = "playlist_sp_recr"
CoD.CPUtility.DIFFICULTY_ICON[1] = "playlist_sp_reg"
CoD.CPUtility.DIFFICULTY_ICON[2] = "playlist_sp_hard"
CoD.CPUtility.DIFFICULTY_ICON[3] = "playlist_sp_vet"
CoD.CPUtility.DIFFICULTY_ICON[4] = "playlist_sp_real"
CoD.CPUtility.FrontendPlayerCharacterUpdate = "updateCpCharacter"
CoD.CPUtility.FrontendPlayerCompanionUpdate = "updateCpCompanion"
CoD.CPUtility.GetFactionFromStats = function ( stats )
	if stats then
		local f1_local0 = stats.faction
		local f1_local1 = stats.faction:get()
	end
	return f1_local0 and f1_local1 or Enum.team_t.TEAM_ALLIES
end

CoD.CPUtility.GetFactionFromStatsByController = function ( controller )
	return CoD.CPUtility.GetFactionFromStats( Engine.GetPlayerStats( controller ) )
end

CoD.CPUtility.CreateCPFactionList = function ( controller, list, action, itemGainFocusAction )
	local results = {}
	local createTeam = function ( team )
		return {
			models = {
				name = CoD.TeamUtility.GetDefaultTeamName( team ),
				image = CoD.TeamUtility.GetDefaultTeamFactionIcon( team ),
				description = CoD.TeamUtility.GetDefaultTeamFactionDescription( team )
			},
			properties = {
				faction = team,
				action = action,
				itemGainFocusAction = itemGainFocusAction
			}
		}
	end
	
	table.insert( results, createTeam( Enum.team_t.TEAM_ALLIES ) )
	table.insert( results, createTeam( Enum.team_t.TEAM_AXIS ) )
	return results
end

DataSources.CPFactions = DataSourceHelpers.ListSetup( "CPFactions", function ( controller, list )
	return CoD.CPUtility.CreateCPFactionList( controller, list )
end, true )
DataSources.CPFactions_Lobby = DataSourceHelpers.ListSetup( "CPFactions_Lobby", function ( controller, list )
	local action = function ( self, element, controller, actionParam, menu )
		CoD.CPUtility.SelectFaction_Internal( controller, element.faction )
	end
	
	local itemGainFocusAction = function ( self, element, controller, actionParam, menu )
		CoD.CPUtility.FactionHighlighted( controller, menu, element )
	end
	
	return CoD.CPUtility.CreateCPFactionList( controller, list, action, itemGainFocusAction )
end, true, nil, function ( controller, list, listModel )
	list.loseFocusAction = function ( self, element, controller, actionParam, menu )
		CoD.CPUtility.FactionHighlighted( controller, menu, {
			faction = CoD.CPUtility.GetFactionFromStatsByController( controller )
		} )
	end
	
end )
CoD.CPUtility.CreateCompanionList = function ( controller, list, action, itemGainFocusAction )
	local results = {}
	local characters = Engine.GetHeroList( Enum.eModes.MODE_CAMPAIGN )
	local specialists = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local team = CoD.CPUtility.GetFactionFromStatsByController( controller )
	local faction = Engine.GetFactionForTeam( CoD.CPUtility.GetFactionFromStatsByController( controller ) )
	for _, character in ipairs( characters ) do
		local characterIndex = character.bodyIndex
		local extraData = Engine.GetHeroBundleInfo( Enum.eModes.MODE_CAMPAIGN, characterIndex )
		if extraData.isCompanion ~= 0 and (not extraData.baseTeam or extraData.baseTeam == team) then
			local item = {
				models = {},
				properties = {}
			}
			item.models.name = character.displayName
			item.models.desc = extraData.companionDescription or ""
			item.models.image = extraData["cprender_" .. faction] or "$white"
			item.models.locked = false
			item.properties.characterIndex = characterIndex
			item.properties.action = action
			item.properties.itemGainFocusAction = itemGainFocusAction
			if item.models.locked then
				item.models.name = "MENU_CLASSIFIED"
				if LuaUtils.FindItemInArray( {
					"pbt_mp_trapper",
					"pbt_mp_trapper_temp_t8"
				}, character.assetName ) then
					item.models.desc = "CPUI_MUST_PROGRESS_FURTHER"
				elseif LuaUtils.FindItemInArray( {
					"pbt_mp_outrider",
					"pbt_mp_outrider_temp_t8"
				}, character.assetName ) then
					item.models.desc = "CPUI_PURCHASE_ADDITIONAL_CONTENT"
				else
					item.models.desc = "MENU_CLASSIFIED"
				end
			end
			table.insert( results, item )
		end
	end
	table.sort( results, function ( a, b )
		if a.models.locked == b.models.locked then
			return a.properties.characterIndex < b.properties.characterIndex
		elseif a.models.locked then
			return false
		else
			return true
		end
	end )
	return results
end

DataSources.CompanionList = DataSourceHelpers.ListSetup( "CompanionList", function ( controller, list )
	return CoD.CPUtility.CreateCompanionList( controller, list, nil, nil, nil, nil )
end, true )
DataSources.CompanionList_Lobby = DataSourceHelpers.ListSetup( "CompanionList_Lobby", function ( controller, list )
	local action = function ( self, element, controller, actionParam, menu )
		CoD.CPUtility.SelectCompanion_Internal( controller, element.characterIndex )
		ForceNotifyGlobalModel( controller, "lobbyRoot.lobbyCompanionUpdate" )
	end
	
	local itemGainFocusAction = function ( self, element, controller, actionParam, menu )
		CoD.CPUtility.CompanionHighlighted( controller, menu, element )
	end
	
	return CoD.CPUtility.CreateCompanionList( controller, list, action, itemGainFocusAction )
end, true, {}, function ( controller, list, listModel )
	list.loseFocusAction = function ( self, element, controller, actionParam, menu )
		local storageBuffer = Engine.GetPlayerStats( controller )
		CoD.CPUtility.CompanionHighlighted( controller, menu, {
			characterIndex = storageBuffer.companion:get()
		} )
	end
	
end )
DataSources.StartingMissions = DataSourceHelpers.ListSetup( "StartingMissions", function ( controller )
	local results = {}
	local sortMaps = function ( a, b )
		return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
	end
	
	local faction = Engine.GetFactionForTeam( CoD.CPUtility.GetFactionFromStatsByController( controller ) )
	for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
		if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false and mapData.episodeNumber == 0 then
			local item = {
				models = {},
				properties = {}
			}
			item.models.name = mapData.mapName
			item.models.image = mapData.previewImage
			item.models.desc = mapData[faction .. "MapDesc"]
			item.properties.mapId = id
			table.insert( results, item )
		end
	end
	return results
end, true )
CoD.OverlayUtility.AddSystemOverlay( "CompleteCPFirstTimeFlow", {
	menuName = "SystemOverlay_FreeCursor",
	title = "MENU_COMPLETE_CP_FLOW_WARNING",
	description = "MENU_COMPLETE_CP_FLOW_WARNING_DESC",
	categoryType = CoD.OverlayUtility.OverlayTypes.Notice,
	[CoD.OverlayUtility.aCrossPromptFn] = function ( controller )
		return function ( menu, controller )
			GoBack( menu, controller )
		end
		
	end,
	[CoD.OverlayUtility.aCrossPromptText] = "MENU_OK",
	[CoD.OverlayUtility.bCirclePromptFn] = function ( controller )
		return function ( menu, controller )
			GoBack( menu, controller )
		end
		
	end,
	[CoD.OverlayUtility.bCirclePromptText] = "MENU_BACK"
} )
CoD.OverlayUtility.AddSystemOverlay( "ConfirmCompanionChange", {
	menuName = "SystemOverlay_FreeCursor",
	title = "MENU_CONFIRM_CHOOSE_COMPANION",
	description = function ( controller, characterIndex )
		local storageBuffer = Engine.GetPlayerStats( controller )
		local character = Engine.GetHeroInfo( Enum.eModes.MODE_CAMPAIGN, storageBuffer.companion:get() )
		return Engine.Localize( "MENU_CONFIRM_CHOOSE_COMPANION_DESC", character.displayName )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Notice,
	[CoD.OverlayUtility.aCrossPromptFn] = function ( controller, characterIndex )
		return function ( menu, controller )
			CoD.CPUtility.SelectCompanion_Internal( controller, characterIndex )
			local companionMenu = GoBack( menu, controller )
			SendClientScriptMenuChangeNotify( controller, companionMenu, false )
			GoBack( companionMenu, controller )
		end
		
	end,
	[CoD.OverlayUtility.aCrossPromptText] = "MENU_CONFIRM",
	[CoD.OverlayUtility.bCirclePromptFn] = function ( controller, characterIndex )
		return function ( menu, controller )
			GoBack( menu, controller )
		end
		
	end,
	[CoD.OverlayUtility.bCirclePromptText] = "MENU_CANCEL"
} )
CoD.OverlayUtility.AddSystemOverlay( "ConfirmFactionChange", {
	menuName = "SystemOverlay_FreeCursor",
	title = "MENU_CONFIRM_CHOOSE_FACTION",
	description = function ( controller, faction )
		return Engine.Localize( "MENU_CONFIRM_CHOOSE_FACTION_DESC", CoD.TeamUtility.GetDefaultTeamName( CoD.CPUtility.GetFactionFromStatsByController( controller ) ) )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Notice,
	[CoD.OverlayUtility.aCrossPromptFn] = function ( controller, faction )
		return function ( menu, controller )
			CoD.CPUtility.SelectFaction_Internal( controller, faction )
			local factionMenu = GoBack( menu, controller )
			SendClientScriptMenuChangeNotify( controller, factionMenu, false )
			GoBack( factionMenu, controller )
		end
		
	end,
	[CoD.OverlayUtility.aCrossPromptText] = "MENU_CONFIRM",
	[CoD.OverlayUtility.bCirclePromptFn] = function ( controller, faction )
		return function ( menu, controller )
			GoBack( menu, controller )
		end
		
	end,
	[CoD.OverlayUtility.bCirclePromptText] = "MENU_CANCEL"
} )
CoD.CPUtility.SelectCompanion_Internal = function ( controller, characterIndex )
	local storageBuffer = Engine.GetPlayerStats( controller )
	storageBuffer.companion:set( characterIndex )
	UploadStats( controller )
end

CoD.CPUtility.GetTeamTokenXModel = function ( faction )
	if faction == Enum.team_t.TEAM_ALLIES or faction == Enum.team_t.TEAM_AXIS then
		return "p8_frontend_cp_faction_" .. Engine.GetFactionForTeam( faction ) .. "_base"
	else
		return "tag_origin"
	end
end

CoD.CPUtility.GetFactionBodyIndexForPlayer = function ( faction )
	local f37_local0
	if faction == Enum.team_t.TEAM_ALLIES then
		f37_local0 = 0
		if not f37_local0 then
		
		else
			return f37_local0
		end
	end
	f37_local0 = 1
end

CoD.CPUtility.GetFactionBodyIndexForCompanion = function ( faction, validationTable )
	local f38_local0
	if faction == Enum.team_t.TEAM_ALLIES then
		f38_local0 = 1
		if not f38_local0 then
		
		else
			if validationTable and #validationTable.bodies <= f38_local0 then
				f38_local0 = 0
			end
			return f38_local0
		end
	end
	local bodyStyle = 2
end

CoD.CPUtility.GetFactionHelmetIndexForCompanion = function ( faction, validationTable )
	local f39_local0
	if faction == Enum.team_t.TEAM_ALLIES then
		f39_local0 = 1
		if not f39_local0 then
		
		else
			if validationTable and #validationTable.helmets <= f39_local0 then
				f39_local0 = 0
			end
			return f39_local0
		end
	end
	local helmetStyle = 2
end

CoD.CPUtility.SelectFaction_Internal = function ( controller, faction )
	local storageBuffer = Engine.GetPlayerStats( controller )
	storageBuffer.faction:set( faction )
	CoD.LobbyUtility.LobbySetTeam( controller, faction )
	local setNewCompanion = false
	local characters = Engine.GetHeroList( Enum.eModes.MODE_CAMPAIGN )
	for _, character in ipairs( characters ) do
		local characterIndex = character.bodyIndex
		local f40_local3 = 0
		local f40_local4 = CoD.CPUtility.GetFactionBodyIndexForPlayer( faction )
		local extraData = Engine.GetHeroBundleInfo( Enum.eModes.MODE_CAMPAIGN, characterIndex )
		if extraData.isCompanion ~= 0 then
			local customizations = Engine.GetHeroCustomizationTable( Enum.eModes.MODE_CAMPAIGN, characterIndex )
			f40_local3 = CoD.CPUtility.GetFactionHelmetIndexForCompanion( extraData.baseTeam or faction, customizations )
			f40_local4 = CoD.CPUtility.GetFactionBodyIndexForCompanion( extraData.baseTeam or faction, customizations )
			if not setNewCompanion and (not extraData.baseTeam or extraData.baseTeam == faction) then
				setNewCompanion = true
				CoD.CPUtility.SelectCompanion_Internal( controller, characterIndex )
			end
		end
		Engine.SetHeroItem( controller, Enum.eModes.MODE_CAMPAIGN, characterIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, f40_local4 )
		Engine.SetHeroItem( controller, Enum.eModes.MODE_CAMPAIGN, characterIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, f40_local3 )
	end
	UploadStats( controller )
end

CoD.CPUtility.SetupFrontendForFaction = function ( controller, faction )
	SendClientScriptNotify( controller, "changeFactionToken", CoD.CPUtility.GetTeamTokenXModel( faction ) )
	SendCustomClientScriptNotifyForAdjustedClient( controller, CoD.CPUtility.FrontendPlayerCharacterUpdate, "changeBody", CoD.CPUtility.GetFactionBodyIndexForPlayer( faction ), Enum.eModes.MODE_CAMPAIGN, true )
	local storageBuffer = Engine.GetPlayerStats( controller )
	local characterIndex = storageBuffer.companion:get()
	if faction ~= CoD.CPUtility.GetFactionFromStats( storageBuffer ) then
		local characters = Engine.GetHeroList( Enum.eModes.MODE_CAMPAIGN )
		for _, character in ipairs( characters ) do
			local extraData = Engine.GetHeroBundleInfo( Enum.eModes.MODE_CAMPAIGN, character.bodyIndex )
			if extraData.isCompanion ~= 0 and (not extraData.baseTeam or extraData.baseTeam == faction) then
				characterIndex = character.bodyIndex
				break
			end
		end
	end
	SendClientScriptCustomNotify( controller, CoD.CPUtility.FrontendPlayerCompanionUpdate .. CoD.GetLocalClientAdjustedNum( controller ), "changeHero", characterIndex, Enum.eModes.MODE_CAMPAIGN )
	SendCustomClientScriptNotifyForAdjustedClient( controller, CoD.CPUtility.FrontendPlayerCompanionUpdate, "changeBody", CoD.CPUtility.GetFactionBodyIndexForCompanion( faction ), Enum.eModes.MODE_CAMPAIGN, true )
	SendCustomClientScriptNotifyForAdjustedClient( controller, CoD.CPUtility.FrontendPlayerCompanionUpdate, "changeHelmet", CoD.CPUtility.GetFactionHelmetIndexForCompanion( faction ), Enum.eModes.MODE_CAMPAIGN, true )
end

CoD.CPUtility.EnteredCP_FlowComplete = function ( controller )
	CoD.CPUtility.SetupFrontendForFaction( controller, CoD.CPUtility.GetFactionFromStatsByController( controller ) )
	SendCustomClientScriptNotifyForAdjustedClient( controller, CoD.CPUtility.FrontendPlayerCharacterUpdate, "show" )
	SendCustomClientScriptNotifyForAdjustedClient( controller, CoD.CPUtility.FrontendPlayerCompanionUpdate, "show" )
end

CoD.CPUtility.SelectCompanion = function ( controller, menu, element )
	CoD.CPUtility.SelectCompanion_Internal( controller, element.characterIndex )
end

CoD.CPUtility.CompanionHighlighted = function ( controller, menu, element )
	SendClientScriptCustomNotify( controller, CoD.CPUtility.FrontendPlayerCompanionUpdate .. CoD.GetLocalClientAdjustedNum( controller ), "changeHero", element.characterIndex, Enum.eModes.MODE_CAMPAIGN )
end

CoD.CPUtility.ChooseFaction = function ( controller, menu, element )
	CoD.CPUtility.SelectFaction_Internal( controller, element.faction )
end

CoD.CPUtility.FactionHighlighted = function ( controller, menu, element )
	local faction = element.faction
	CoD.CPUtility.SetupFrontendForFaction( controller, faction )
end

CoD.CPUtility.ChooseStartingMission = function ( controller, menu, element )
	SetMap( controller, element.mapId, false )
	local gametype = CoD.BaseUtility.GetMapValue( element.mapId, "gametype" )
	if gametype ~= nil and gametype ~= "" then
		Engine.SetGametype( gametype )
	end
end

CoD.CPUtility.SetupStartingMission = function ( controller )
	local sortMaps = function ( a, b )
		return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
	end
	
	for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
		if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false and mapData.episodeNumber == 0 then
			CoD.CPUtility.ChooseStartingMission( controller, nil, {
				mapId = id
			} )
			return 
		end
	end
end

CoD.CPUtility.UnhideAllCPLobbyItems = function ( controller )
	if IsCampaign() then
		SendClientScriptNotifyForAdjustedClient( controller, CoD.CPUtility.FrontendPlayerCharacterUpdate, "show" )
		SendClientScriptNotifyForAdjustedClient( controller, CoD.CPUtility.FrontendPlayerCompanionUpdate, "show" )
		CoD.CPUtility.FactionHighlighted( controller, nil, {
			faction = CoD.CPUtility.GetFactionFromStatsByController( controller )
		} )
	end
end

CoD.CPUtility.SetupVehicleHack = function ( self, controller )
	local hackPuzzle = "gamedata/tables/cp/cp_vehicleHacks.csv"
	local f51_local0 = DataSources.HUDItems.getModel( controller )
	f51_local0 = f51_local0:create( "vehicleHack.mode" )
	local puzzleIndex = f51_local0:get()
	local f51_local1 = {}
	local f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.cross = f51_local2[CoD.ButtonMappings.BUTTON_A]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.circle = f51_local2[CoD.ButtonMappings.BUTTON_B]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.square = f51_local2[CoD.ButtonMappings.BUTTON_X]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.triangle = f51_local2[CoD.ButtonMappings.BUTTON_Y]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.r1 = f51_local2[CoD.ButtonMappings.BUTTON_RSHLDR]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.l1 = f51_local2[CoD.ButtonMappings.BUTTON_LSHLDR]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.r2 = f51_local2[CoD.ButtonMappings.BUTTON_RTRIG]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.l2 = f51_local2[CoD.ButtonMappings.BUTTON_LTRIG]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.left = f51_local2[CoD.ButtonMappings.DPAD_LEFT]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.right = f51_local2[CoD.ButtonMappings.DPAD_RIGHT]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.up = f51_local2[CoD.ButtonMappings.DPAD_UP]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.down = f51_local2[CoD.ButtonMappings.DPAD_DOWN]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.l3 = f51_local2[CoD.ButtonMappings.BUTTON_LSTICK]:get()
	f51_local2 = DataSources.Controller.getModel( controller )
	f51_local1.r3 = f51_local2[CoD.ButtonMappings.BUTTON_RSTICK]:get()
	local buttonRowDefines = {}
	local maxButtons = 24
	for i = 1, maxButtons, 1 do
		table.insert( buttonRowDefines, "buttonTime" .. i )
		table.insert( buttonRowDefines, "buttonType" .. i )
	end
	local csvRows = LuaEnum.createEnum( "index", "difficulty", "numPrompts", unpack( buttonRowDefines ) )
	local f51_local3 = tonumber( Engine.TableLookup( hackPuzzle, csvRows.numPrompts, csvRows.index, puzzleIndex ) )
	local f51_local4 = DataSources.HUDItems.getModel( controller )
	f51_local4 = f51_local4:create( "vehicleHack.level" )
	local puzzleLevels = self.puzzleLevels
	if not puzzleLevels then
		self.puzzleLevels = {}
		puzzleLevels = self.puzzleLevels
		for i = 1, maxButtons, 1 do
			local spinner = self.spinnerContainer["spinner" .. i]
			assert( spinner and spinner.result )
			table.insert( puzzleLevels, {
				spinner = spinner,
				image = "$white"
			} )
		end
	else
		self:playClip( "Failure" )
		for _, puzzle in ipairs( puzzleLevels ) do
			puzzle.spinner:setState( "DefaultState" )
			if puzzle.timer then
				puzzle.timer:close()
				puzzle.timer = nil
			end
		end
	end
	LuaUtils.shuffle( puzzleLevels )
	for i = 1, f51_local3, 1 do
		puzzleLevels[i].delay = tonumber( Engine.TableLookup( hackPuzzle, csvRows["buttonTime" .. i], csvRows.index, puzzleIndex ) )
		puzzleLevels[i].image = f51_local1[Engine.TableLookup( hackPuzzle, csvRows["buttonType" .. i], csvRows.index, puzzleIndex )] or "$white"
		puzzleLevels[i].spinner.result:setImage( RegisterImage( puzzleLevels[i].image ) )
	end
	for i = f51_local3 + 1, maxButtons, 1 do
		puzzleLevels[i].spinner:setState( "Solved", true )
	end
	local i = function ( puzzle )
		puzzle.timer = LUI.UITimer.newElementTimer( puzzle.delay, true, function ()
			puzzle.timer = nil
			puzzle.spinner:setState( "Revealed" )
		end )
		self:addElement( puzzle.timer )
	end
	
	local f51_local5 = 0
	if self._vehicleHackSubscription then
		self:removeSubscription( self._vehicleHackSubscription )
	end
	self._vehicleHackSubscription = self:subscribeToModel( f51_local4, function ()
		local numCorrect = f51_local4:get()
		if f51_local5 < numCorrect then
			for i = f51_local5 + 1, numCorrect, 1 do
				puzzleLevels[i].spinner:setState( "Solved" )
				if puzzleLevels[i].timer then
					puzzleLevels[i].timer:close()
					puzzleLevels[i].timer = nil
				end
			end
			f51_local5 = numCorrect
			if f51_local5 == f51_local3 then
				self:setState( "Solved" )
			end
			i( puzzleLevels[f51_local5 + 1] )
		elseif f51_local5 == 0 and not puzzleLevels[1].timer then
			self:setState( "DefaultState" )
			i( puzzleLevels[1] )
		elseif numCorrect < f51_local5 and f51_local5 < f51_local3 then
			self:playClip( "Failure" )
			if puzzleLevels[f51_local5 + 1].timer then
				puzzleLevels[f51_local5 + 1].timer:close()
				puzzleLevels[f51_local5 + 1].timer = nil
			end
			for i = f51_local5 + 1, numCorrect + 1, -1 do
				if puzzleLevels[i].timer then
					puzzleLevels[i].timer:close()
					puzzleLevels[i].timer = nil
				end
				if f51_local5 + 1 < maxButtons then
					local otherItem = math.random( f51_local5 + 1, maxButtons )
					local originalSpinner = puzzleLevels[i].spinner
					puzzleLevels[i].spinner = puzzleLevels[otherItem].spinner
					puzzleLevels[otherItem].spinner = originalSpinner
					puzzleLevels[i].spinner.result:setImage( RegisterImage( puzzleLevels[i].image ) )
					puzzleLevels[otherItem].spinner.result:setImage( RegisterImage( puzzleLevels[otherItem].image ) )
					puzzleLevels[otherItem].spinner:setState( puzzleLevels[i].spinner.currentState, true )
					puzzleLevels[i].spinner:setState( "DefaultState", true )
				else
					puzzleLevels[i].spinner:setState( "DefaultState" )
				end
			end
			f51_local5 = numCorrect
			i( puzzleLevels[f51_local5 + 1] )
		end
	end )
end

DataSourceHelpers.PerControllerDataSourceSetup( "SpinnerPuzzle", "hudItems.SpinnerPuzzle", function ( baseModel, controller )
	local createPiece = function ( index )
		local pieceRootModel = baseModel:create( "piece" .. index )
		local f56_local0 = pieceRootModel:create( "highlighted" )
		f56_local0:set( false )
		f56_local0 = pieceRootModel:create( "lockedIn" )
		f56_local0:set( false )
		f56_local0 = pieceRootModel:create( "rotation" )
		f56_local0:set( 0 )
		f56_local0 = pieceRootModel:create( "visibleLines" )
		f56_local0:set( 0 )
	end
	
	local f55_local0 = baseModel:create( "active" )
	f55_local0:set( false )
	local count = 6
	for i = 0, count - 1, 1 do
		createPiece( i )
	end
end, false )
CoD.CPUtility.SpawnDynamicCPHUDWidgets = function ( self, controller )
	local worldIndicatorModel = DataSources.WorldSpaceIndicators.getModel( controller )
	local CreateWeakpoint = function ( entNumber, boneName, closeStateMaxDistance, mediumStateMaxDistance )
		local worldIconModel = Engine.GetModel( Engine.GetModelForController( controller ), "WorldSpaceIndicators" )
		if worldIconModel then
			local weakpointModel = Engine.CreateModel( worldIconModel, "weakpoint_" .. entNumber .. "_" .. boneName )
			if weakpointModel then
				LUI.CreateModelAndInitialize( weakpointModel, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_DEFAULT )
				local newWeakpoint = CoD.weakpointIndicator.new( self, controller )
				newWeakpoint:setModel( weakpointModel )
				newWeakpoint:setupWeakpointIndicator( controller, entNumber, boneName, closeStateMaxDistance, mediumStateMaxDistance )
				LUI.OverrideFunction_CallOriginalFirst( newWeakpoint, "close", function ()
					if LUI.DEV then
						local modelsAreDifferent = LUI.DEV.ErrorIfModelsDoNotMatch( weakpointModel, Engine.CreateModel( worldIconModel, "weakpoint_" .. entNumber .. "_" .. boneName ) )
					end
					Engine.UnsubscribeAndFreeModel( weakpointModel )
				end )
				return newWeakpoint
			end
		end
	end
	
	self.weakpoints = {}
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		local event = {
			controller = controller,
			name = modelValue,
			data = CoD.GetScriptNotifyData( model )
		}
		if modelValue == "weakpoint_update" then
			local entNumber = event.data[2]
			local boneName = Engine.GetIString( event.data[3], "CS_LOCALIZED_STRINGS" )
			if event.data[1] == 0 then
				if self.weakpoints[entNumber] and self.weakpoints[entNumber][boneName] then
					local statusModel = self.weakpoints[entNumber][boneName]:getModel( controller, "status" )
					if statusModel then
						Engine.SetModelValue( statusModel, Enum.WeakpointWidgetStates.WEAKPOINT_STATE_CLOSING )
					end
					local weakpointWidget = self.weakpoints[entNumber][boneName]
					weakpointWidget:addElement( LUI.UITimer.newElementTimer( 1500, true, weakpointWidget.close, weakpointWidget ) )
					self.weakpoints[entNumber][boneName] = nil
				end
			elseif event.data[1] == 1 then
				if not self.weakpoints[entNumber] then
					self.weakpoints[entNumber] = {}
				end
				if not self.weakpoints[entNumber][boneName] then
					local closeStateMaxDistance = event.data[4]
					local mediumStateMaxDistance = event.data[5]
					local newWeakpoint = CreateWeakpoint( entNumber, boneName, closeStateMaxDistance, mediumStateMaxDistance )
					if newWeakpoint then
						self.weakpoints[entNumber][boneName] = newWeakpoint
						self.fullscreenContainer:addElement( newWeakpoint )
						newWeakpoint:processEvent( {
							name = "update_state",
							controller = controller,
							menu = self
						} )
					end
				end
			elseif event.data[1] == 2 then
				if self.weakpoints[entNumber] and self.weakpoints[entNumber][boneName] then
					self.weakpoints[entNumber][boneName]:playClip( "Damaged" )
				end
			elseif event.data[1] == 3 and self.weakpoints[entNumber] and self.weakpoints[entNumber][boneName] then
				self.weakpoints[entNumber][boneName]:playClip( "Repulsed" )
			end
			return true
		else
			
		end
	end )
	if worldIndicatorModel then
		Engine.SetModelValue( Engine.CreateModel( worldIndicatorModel, "hackingPercent" ), 0 )
		local enemyTargetModels = {
			{
				name = "targetState",
				defaultValue = Enum.EnemyTargetStates.ENEMY_TARGET_NONE
			}
		}
		local index = 0
		local createAnother = true
		while createAnother do
			local newWidgetModel = Engine.CreateModel( worldIndicatorModel, "enemyTargets." .. index )
			for _, models in ipairs( enemyTargetModels ) do
				LUI.CreateModelAndInitialize( newWidgetModel, models.name, models.defaultValue )
			end
			f57_local0 = CoD.EnemyTargetInternal.new( self, controller )
			f57_local0:setModel( newWidgetModel )
			createAnother = f57_local0:setupCybercomLockon( index, controller )
			self.fullscreenContainer:addElement( f57_local0 )
			f57_local0:processEvent( {
				name = "update_state",
				controller = controller
			} )
			index = index + 1
		end
	end
	if worldIndicatorModel then
		local enemyTargetModels = {
			{
				name = "distance",
				defaultValue = 0
			},
			{
				name = "explosivesImage",
				defaultValue = "uie_img_t7_hud_widget_ammo_1_icon_grenade"
			},
			{
				name = "timeLeftPerc",
				defaultValue = -1
			},
			{
				name = "visible",
				defaultValue = false
			}
		}
		local index = 0
		local createAnother = true
		while createAnother do
			local newWidgetModel = Engine.CreateModel( worldIndicatorModel, "explosivesWarnings." .. index )
			for _, models in ipairs( enemyTargetModels ) do
				LUI.CreateModelAndInitialize( newWidgetModel, models.name, models.defaultValue )
			end
			f57_local0 = CoD.IncomingExplosiveInternal.new( self, controller )
			f57_local0:setModel( newWidgetModel )
			f57_local0:setPriority( 100 )
			createAnother = f57_local0:setupIncomingExplosive( index, controller )
			self.fullscreenContainer:addElement( f57_local0 )
			f57_local0:processEvent( {
				name = "update_state",
				controller = controller
			} )
			index = index + 1
		end
	end
	CoD.TacticalModeUtility.CreateTacticalModeWidgets( self, controller )
	CoD.TacticalModeUtility.CreateShooterSpottedWidgets( self, controller )
	if Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ) ~= nil then
		self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" ), function ( model )
			if IsCurrentViewmodelWeaponName( controller, "spike_launcher" ) then
				self.spikeLauncherCounter = CoD.SpikeLauncherSpikeCounter.new( self, controller )
				self:addElement( self.spikeLauncherCounter )
				self.spikeLauncherCounter:dispatchEventToChildren( {
					name = "update_state",
					controller = controller
				} )
			elseif self.spikeLauncherCounter ~= nil then
				self.spikeLauncherCounter:close()
				self.spikeLauncherCounter = nil
			end
		end )
	end
	local enemyTargetModels = self.close
	self.close = function ( self )
		enemyTargetModels( self )
		if self.spikeLauncherCounter ~= nil then
			self.spikeLauncherCounter:close()
		end
	end
	
	if worldIndicatorModel then
		local index = function ( bleedOutContainer )
			local bleedOutItem = bleedOutContainer:getFirstChild()
			while bleedOutItem do
				if LUI.startswith( bleedOutItem.id, "bleedOutItem" ) then
					local playerNameModel = bleedOutItem:getModel( controller, "playerName" )
					if playerNameModel then
						Engine.SetModelValue( playerNameModel, Engine.GetGamertagForClient( controller, bleedOutItem.bleedOutClient ) )
					end
				end
				bleedOutItem = bleedOutItem:getNextSibling()
			end
		end
		
		local bleedOutClient = 0
		local needAnother = true
		while needAnother do
			local f57_local0 = bleedOutClient
			local bleedOutModel = Engine.CreateModel( worldIndicatorModel, "bleedOutModel" .. f57_local0 )
			local f57_local2 = Engine.CreateModel( bleedOutModel, "playerName" )
			Engine.SetModelValue( f57_local2, GetClientName( controller, f57_local0 ) )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "prompt" ), "CPUI_REVIVE" )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "clockPercent" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "bleedOutPercent" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "stateFlags" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "arrowAngle" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( bleedOutModel, "isCompanion" ), false )
			local bleedOutItem = CoD.bleedOutWidget.new( self, controller )
			bleedOutItem.bleedOutClient = f57_local0
			bleedOutItem.id = "bleedOutItem" .. f57_local0
			bleedOutItem:setLeftRight( true, false, 0, 0 )
			bleedOutItem:setTopBottom( true, false, 0, 0 )
			bleedOutItem:setModel( bleedOutModel )
			needAnother = bleedOutItem:setupBleedOutWidget( controller, f57_local0 )
			self.fullscreenContainer:addElement( bleedOutItem )
			local playerListPlayerNameModel = Engine.GetModel( Engine.GetModelForController( controller ), "PlayerList." .. f57_local0 .. ".playerName" )
			bleedOutItem:subscribeToModel( playerListPlayerNameModel, function ( model )
				f57_local2:set( GetClientName( controller, f57_local0 ) )
			end )
			if not self.fullscreenContainer._hasPlayerConnectedSubscription then
				self.fullscreenContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerConnected" ), function ( model )
					index( self.fullscreenContainer )
				end )
				self.fullscreenContainer._hasPlayerConnectedSubscription = true
			end
			bleedOutClient = bleedOutClient + 1
		end
	end
	self.m_inputDisabled = true
end

CoD.CPUtility.UseFaceCustomization = function ( controller )
	return CoD.BaseUtility.IsDvarEnabled( "ui_facialCustomization" )
end

CoD.CPUtility.OpenChangeFace = function ( self, element, controller, param, menu )
	OpenOverlay( menu, "ChooseFace", controller )
end

CoD.CPUtility.FacialFeatures = {
	FACE = "Face",
	EYES = "Eyes",
	EARS = "Ears",
	NOSE = "Nose",
	MOUTH = "Mouth"
}
CoD.CPUtility.NUM_FACES = 8
CoD.CPUtility.FEATURE_INCREMENTS = 17
DataSources.ChooseFaceFeatures = DataSourceHelpers.ListSetup( "ChooseFaceFeatures", function ( controller, list )
	local results = {}
	for id, feature in pairs( CoD.CPUtility.FacialFeatures ) do
		table.insert( results, {
			models = {
				tabName = feature,
				tabIcon = "",
				dataSource = "FacialFeatureProperties_" .. id
			},
			properties = {
				tabId = id
			}
		} )
	end
	return results
end, true )
CoD.CPUtility.CreateFeatureDataSource = function ( controller, name, featureId, index, list )
	local modelName = "FacialFeatures" .. index
	local profileStat = {
		"facialFeatureProperties",
		featureId,
		"properties",
		index
	}
	local options = {}
	for i = 1, CoD.CPUtility.FEATURE_INCREMENTS, 1 do
		local name = string.rep( ". ", i - 1 ) .. "|" .. string.rep( " .", CoD.CPUtility.FEATURE_INCREMENTS - i )
		table.insert( options, {
			name = name,
			value = i / CoD.CPUtility.FEATURE_INCREMENTS
		} )
	end
	local listInfo = {
		models = {
			name = Engine.Localize( name ),
			desc = "",
			optionsDatasource = CoD.OptionsUtility.CreateStatDataSource( controller, modelName, options, profileStat ),
			currentSelection = CoD.OptionsUtility.GetCustomStatSelection( controller, options, profileStat, list )
		},
		properties = {
			disabled = false
		}
	}
	return listInfo
end

for featureId, featureName in pairs( CoD.CPUtility.FacialFeatures ) do
	DataSources["FacialFeatureProperties_" .. featureId] = DataSourceHelpers.ListSetup( "FacialFeatureProperties_" .. featureId, function ( controller, list )
		local results = {}
		for i = 1, CoD.CPUtility.NUM_FACES, 1 do
			table.insert( results, CoD.CPUtility.CreateFeatureDataSource( controller, featureName .. " " .. i, featureId, i, list ) )
		end
		return results
	end, true )
end
CoD.CPUtility.RandomizeFacialFeatures = function ( controller, element )
	element._randomize = true
	element:updateDataSource()
	element._randomize = nil
end

