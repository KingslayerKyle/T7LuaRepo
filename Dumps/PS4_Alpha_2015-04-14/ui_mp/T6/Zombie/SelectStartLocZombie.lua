CoD.SelectStartLocZombie = {}
CoD.SelectStartLocZombie.StartLocInfoWidth = 400
CoD.SelectStartLocZombie.StartLocInfoHeight = 200
CoD.SelectStartLocZombie.StartLocInfoNewWidth = 64
CoD.SelectStartLocZombie.StartLocInfoNewHeight = 32
CoD.SelectStartLocZombie.StartLocInfoNewMaterial = "menu_mp_lobby_new_small"
CoD.SelectStartLocZombie.StartLocIconPulseDurationMax = 800
CoD.SelectStartLocZombie.StartLocIconPulseDurationMin = 400
CoD.SelectStartLocZombie.StartLocIconPulseAlphaHighMin = 0.7
CoD.SelectStartLocZombie.StartLocIconPulseAlphaLowMax = 0.3
CoD.SelectStartLocZombie.StartLocOptionInfoWidth = 225
CoD.SelectStartLocZombie.StartLocOptionInfoHeight = 480
if CoD.Zombie.miniGameDisabled == false then
	CoD.SelectStartLocZombie.ZombieDotCount = 60
	CoD.SelectStartLocZombie.ZombieDotLeftMax = 600
	CoD.SelectStartLocZombie.ZombieDotTopMax = 300
	CoD.SelectStartLocZombie.ZombieDotWidth = 6
	CoD.SelectStartLocZombie.ZombieDotHeight = 6
	CoD.SelectStartLocZombie.ZombieDotMovingSpeed = 0
	CoD.SelectStartLocZombie.ZombieDotMovingDirMax = 180
	CoD.SelectStartLocZombie.ZombieDotPathNodeCount = 10
	CoD.SelectStartLocZombie.ZombieDotPathNodes = {}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[1] = {
		left = -350,
		top = -100,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[2] = {
		left = -350,
		top = 100,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[3] = {
		left = -100,
		top = 188,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[4] = {
		left = 100,
		top = 188,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[5] = {
		left = 350,
		top = 100,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[6] = {
		left = 350,
		top = -100,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[7] = {
		left = 150,
		top = -200,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[8] = {
		left = -150,
		top = -200,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[9] = {
		left = 150,
		top = 0,
		radius = 30
	}
	CoD.SelectStartLocZombie.ZombieDotPathNodes[10] = {
		left = -150,
		top = 0,
		radius = 30
	}
end
LUI.createMenu.SelectStartLocZM = function ( controller )
	CoD.Fog.SetGameMap( controller, Dvar.ui_mapname:get() )
	local mapName = CoD.Zombie.GetUIMapName()
	if mapName == CoD.Zombie.MAP_ZM_HIGHRISE then
		CoD.SelectStartLocZombie.StartLocInfoWidth = 1280
		CoD.SelectStartLocZombie.StartLocInfoHeight = 720
	elseif mapName == CoD.Zombie.MAP_ZM_PRISON then
		CoD.SelectStartLocZombie.StartLocInfoWidth = 640
		CoD.SelectStartLocZombie.StartLocInfoHeight = 360
	elseif mapName == CoD.Zombie.MAP_ZM_BURIED then
		CoD.SelectStartLocZombie.StartLocInfoWidth = 426
		CoD.SelectStartLocZombie.StartLocInfoHeight = 426
	else
		CoD.SelectStartLocZombie.StartLocInfoWidth = 400
		CoD.SelectStartLocZombie.StartLocInfoHeight = 200
	end
	local selectStartLocMenu = CoD.Menu.New( "SelectStartLocZM" )
	selectStartLocMenu.m_ownerController = controller
	selectStartLocMenu:setPreviousMenu( "SelectMapZM" )
	selectStartLocMenu:registerEventHandler( "open_menu", CoD.SelectStartLocZombie.OpenMenu )
	selectStartLocMenu:registerEventHandler( "startloc_option_selected", CoD.SelectStartLocZombie.StartLocOptionSelected )
	selectStartLocMenu.isPublicMatch = Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH )
	if selectStartLocMenu.isPublicMatch then
		selectStartLocMenu:registerEventHandler( "partylobby_update", CoD.SelectStartLocZombie.PartyLobbyUpdate )
	end
	if CoD.useMouse then
		selectStartLocMenu:registerEventHandler( "startloc_mouseover", CoD.SelectStartLocZombie.StartLocMouseOver )
		selectStartLocMenu:registerEventHandler( "startloc_mouseclick", CoD.SelectStartLocZombie.StartLocMouseClick )
	end
	selectStartLocMenu:registerEventHandler( "button_prompt_search_preferences", CoD.SelectStartLocZombie.ButtonPromptSearchPreferences )
	selectStartLocMenu.addSearchPreferencesButton = CoD.SelectStartLocZombie.AddSearchPreferencesButtonPrompt
	selectStartLocMenu:addSelectButton()
	selectStartLocMenu:addBackButton()
	if selectStartLocMenu.isPublicMatch and CoD.PlaylistCategoryFilter ~= CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH then
		selectStartLocMenu:addSearchPreferencesButton()
	end
	selectStartLocMenu:registerEventHandler( "button_prompt_back", CoD.SelectStartLocZombie.BackButton )
	if not selectStartLocMenu.isPublicMatch or Engine.PartyGetMemberCount() > 0 then
		CoD.SelectStartLocZombie.PopulateStartLocs( selectStartLocMenu, controller )
	end
	CoD.GameGlobeZombie.gameGlobe.currentMenu = selectStartLocMenu
	CoD.GameMapZombie.gameMap.currentMenu = selectStartLocMenu
	if CoD.Zombie.miniGameDisabled == false then
		selectStartLocMenu.zombieDots = {}
		selectStartLocMenu.zombieDotContainer = LUI.UIElement.new()
		selectStartLocMenu.zombieDotContainer:setAlpha( 0 )
		selectStartLocMenu.zombieDotContainer:setLeftRight( true, true, 0, 0 )
		selectStartLocMenu.zombieDotContainer:setTopBottom( true, true, 0, 0 )
		selectStartLocMenu:addElement( selectStartLocMenu.zombieDotContainer )
		local zombieDotMaterial = RegisterMaterial( "menu_zm_map_zombie_dot" )
		for index = 1, CoD.SelectStartLocZombie.ZombieDotCount, 1 do
			local randomLeft = math.random( -CoD.SelectStartLocZombie.ZombieDotLeftMax, CoD.SelectStartLocZombie.ZombieDotLeftMax )
			local randomTop = math.random( -CoD.SelectStartLocZombie.ZombieDotTopMax, CoD.SelectStartLocZombie.ZombieDotTopMax )
			local zombieDot = LUI.UIImage.new()
			zombieDot:setLeftRight( false, false, randomLeft, randomLeft + CoD.SelectStartLocZombie.ZombieDotWidth )
			zombieDot:setTopBottom( false, false, randomTop, randomTop + CoD.SelectStartLocZombie.ZombieDotHeight )
			zombieDot:setImage( zombieDotMaterial )
			zombieDot.currentPathNodeIndex = CoD.SelectStartLocZombie.ZombieMoveFindClosestNodeIndex( randomLeft, randomTop )
			zombieDot:registerEventHandler( "transition_complete_zombie_move", CoD.SelectStartLocZombie.ZombieMoveFinish )
			selectStartLocMenu.zombieDotContainer:addElement( zombieDot )
			selectStartLocMenu.zombieDots[index] = zombieDot
		end
	end
	return selectStartLocMenu
end

CoD.SelectStartLocZombie.ButtonPromptSearchPreferences = function ( self, event )
	self:openPopup( "SearchPreferences", event.controller )
end

CoD.SelectStartLocZombie.AddSearchPreferencesButtonPrompt = function ( self )
	self.searchPreferencesButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_SEARCH_PREFERENCES" ), self, "button_prompt_search_preferences", false, nil, false, nil, "S" )
	self:addRightButtonPrompt( self.searchPreferencesButton )
end

CoD.SelectStartLocZombie.OpenMenu = function ( self, event )
	if event.menuName ~= nil and CoD.Zombie.OpenMenuEventMenuNames[event.menuName] == 1 then
		if self.skipOpenMenuEvent == true then
			if event.menuName == "MainLobby" and self.isPublicMatch == true then
				CoD.SwitchToPlayerMatchLobby( event.controller )
			end
		else
			CoD.GameGlobeZombie.MoveToCornerFromUp( event.controller )
			CoD.Lobby.OpenMenu( self, event )
		end
	end
	self.skipOpenMenuEvent = nil
end

CoD.SelectStartLocZombie.PartyLobbyUpdate = function ( self, event )
	if self == nil then
		return 
	elseif event ~= nil and event.actualPartyMemberCount ~= nil and event.actualPartyMemberCount > 0 and not self.startLocsPopulated then
		CoD.SwitchToPlayerMatchLobby( event.controller )
		CoD.SelectStartLocZombie.PopulateStartLocs( self, event.controller )
		CoD.SelectStartLocZombie.GoToPreChoices( self, event )
	end
	self:dispatchEventToChildren( event )
end

CoD.SelectStartLocZombie.PopulateStartLocs = function ( selectStartLocMenu, controller )
	selectStartLocMenu.startLocsPopulated = true
	if selectStartLocMenu.isPublicMatch then
		selectStartLocMenu.totalStartLocationPlayerCount = 0
		selectStartLocMenu.totalStartLocationOptionPlayerCount = 0
		if CoD.PlaylistCategoryFilter == nil then
			local currentPlaylist = Engine.GetPlaylistID()
			CoD.PlaylistCategoryFilter = Engine.GetPlaylistCategoryFilter( controller, currentPlaylist )
		end
	end
	selectStartLocMenu.startLocInfos = {}
	local startLocs = CoD.SelectStartLocZombie.GetStartLocs( selectStartLocMenu, controller )
	selectStartLocMenu.startLocCount = 0
	local startLocContainerState = {
		leftAnchor = false,
		rightAnchor = false,
		left = -CoD.Menu.Width * 0.5,
		right = CoD.Menu.Width * 0.5,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.Menu.Height * 0.5,
		bottom = CoD.Menu.Height * 0.5
	}
	local startLocContainer = LUI.UIElement.new( startLocContainerState )
	selectStartLocMenu:addElement( startLocContainer )
	startLocContainer.handleGamepadButton = CoD.SelectStartLocZombie.StartLocGamepadButton
	selectStartLocMenu.startLocContainer = startLocContainer
	selectStartLocMenu.startLocContainer.currentMenu = selectStartLocMenu
	
	local startLocNewOverlayContainer = LUI.UIElement.new( startLocContainerState )
	startLocNewOverlayContainer:setAlpha( 0 )
	selectStartLocMenu:addElement( startLocNewOverlayContainer )
	selectStartLocMenu.startLocNewOverlayContainer = startLocNewOverlayContainer
	
	startLocNewOverlayContainer:registerAnimationState( "show", {
		alpha = 1
	} )
	startLocNewOverlayContainer:registerAnimationState( "hide", {
		alpha = 0
	} )
	local soloCount = nil
	for index, startLoc in pairs( startLocs ) do
		if not selectStartLocMenu.isPublicMatch or startLoc.filter == CoD.PlaylistCategoryFilter then
			startLoc.ref, soloCount = string.gsub( startLoc.ref, "_solo", "", 1 )
			local startLocX = tonumber( Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 8 ) )
			local startLocY = tonumber( Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 9 ) )
			local newStartLocX = tonumber( Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 17 ) )
			local newStartLocY = tonumber( Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 18 ) )
			local startLocInfoState = {
				leftAnchor = false,
				rightAnchor = false,
				left = -CoD.SelectStartLocZombie.StartLocInfoWidth * 0.5 + startLocX,
				right = CoD.SelectStartLocZombie.StartLocInfoWidth * 0.5 + startLocX,
				topAnchor = false,
				bottomAnchor = false,
				top = -CoD.SelectStartLocZombie.StartLocInfoHeight * 0.5 + startLocY,
				bottom = CoD.SelectStartLocZombie.StartLocInfoHeight * 0.5 + startLocY,
				alpha = 0
			}
			local startLocInfo = LUI.UIElement.new( startLocInfoState )
			startLocContainer:addElement( startLocInfo )
			startLocInfo.startLocIcon = LUI.UIStreamedImage.new( {
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				topAnchor = true,
				bottomAnchor = true,
				top = 0,
				bottom = 0,
				alpha = 0
			} )
			startLocInfo:addElement( startLocInfo.startLocIcon )
			startLocInfo.newImage = LUI.UIImage.new()
			startLocInfo.newImage:setLeftRight( false, false, -CoD.SelectStartLocZombie.StartLocInfoNewWidth * 0.5 + newStartLocX, CoD.SelectStartLocZombie.StartLocInfoNewWidth * 0.5 + newStartLocX )
			startLocInfo.newImage:setTopBottom( false, false, -CoD.SelectStartLocZombie.StartLocInfoNewHeight * 0.5 + newStartLocY, CoD.SelectStartLocZombie.StartLocInfoNewHeight * 0.5 + newStartLocY )
			startLocInfo.newImage:setAlpha( 1 )
			startLocInfo.newImage:setRGB( 1, 1, 1 )
			startLocInfo.newImage:setImage( RegisterMaterial( CoD.SelectStartLocZombie.StartLocInfoNewMaterial ) )
			startLocNewOverlayContainer:addElement( startLocInfo.newImage )
			if CoD.SelectStartLocZombie.SeenStartLocation( controller, CoD.Zombie.GetUIMapName(), startLoc.ref ) then
				startLocInfo.newImage:setAlpha( 0 )
			end
			startLocInfo:registerAnimationState( "hide", {
				alpha = 0
			} )
			startLocInfo:registerAnimationState( "show", {
				alpha = 1
			} )
			startLocInfo:registerAnimationState( "disabled", {
				alpha = 0.1
			} )
			local startLocSelectedMaterialName = Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 6 )
			local startLocSelectedMaterial = RegisterMaterial( startLocSelectedMaterialName )
			startLocInfo.startLocIcon:setImage( startLocSelectedMaterial )
			startLocInfo.startLocIcon:setAlpha( 0 )
			startLocInfo.startLocIcon:setupUIStreamedImage( 0 )
			startLocInfo.startLocIcon:registerAnimationState( "show_default", {
				alpha = 0
			} )
			startLocInfo.startLocIcon:registerAnimationState( "show_selected", {
				alpha = 1
			} )
			startLocInfo.startLocIcon:registerEventHandler( "transition_complete_selected_pulse_high", CoD.SelectStartLocZombie.StartLocIconPulseHighFinish )
			startLocInfo.startLocIcon:registerEventHandler( "transition_complete_selected_pulse_low", CoD.SelectStartLocZombie.StartLocIconPulseLowFinish )
			startLocInfo.name = startLoc.name
			startLocInfo.ref = startLoc.ref
			startLocInfo.description = Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 5 )
			startLocInfo.image = RegisterMaterial( Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 6 ) )
			startLocInfo.startLocX = startLocX
			startLocInfo.startLocY = startLocY
			startLocInfo.startLocOptionX = Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 10 )
			startLocInfo.startLocOptionY = Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 11 )
			startLocInfo.leftStartLoc = Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 12 )
			startLocInfo.rightStartLoc = Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 13 )
			startLocInfo.upStartLoc = Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 14 )
			startLocInfo.downStartLoc = Engine.TableLookup( controller, CoD.gametypesTable, 0, 5, 3, startLoc.ref, 15 )
			if selectStartLocMenu.isPublicMatch then
				startLocInfo.playlists = startLoc.playlists
				if CoD.PlaylistCategoryFilter == "playermatch" then
					startLocInfo.playerCount = startLoc.playerCount
					selectStartLocMenu.totalStartLocationPlayerCount = selectStartLocMenu.totalStartLocationPlayerCount + startLoc.playerCount
				end
			end
			startLocInfo.currentMenu = selectStartLocMenu
			selectStartLocMenu.startLocCount = selectStartLocMenu.startLocCount + 1
			startLocInfo.index = selectStartLocMenu.startLocCount
			selectStartLocMenu.startLocInfos[selectStartLocMenu.startLocCount] = startLocInfo
			if CoD.Zombie.miniGameDisabled == false then
				CoD.SelectStartLocZombie.ZombieDotPathNodeCount = CoD.SelectStartLocZombie.ZombieDotPathNodeCount + 1
				CoD.SelectStartLocZombie.ZombieDotPathNodes[CoD.SelectStartLocZombie.ZombieDotPathNodeCount] = {
					left = startLocX,
					top = startLocY,
					radius = 50
				}
			end
			if CoD.useMouse then
				startLocInfo:setHandleMouse( true )
				startLocInfo:registerEventHandler( "mouseenter", CoD.SelectStartLocZombie.StartLocInfo_MouseEnter )
				startLocInfo:registerEventHandler( "leftmouseup", CoD.SelectStartLocZombie.StartLocInfo_LeftMouseUp )
				startLocInfo:registerEventHandler( "leftmousedown", CoD.NullFunction )
			end
		end
	end
	local startLocOptionInfoState = {
		leftAnchor = false,
		rightAnchor = false,
		left = -CoD.SelectStartLocZombie.StartLocOptionInfoWidth * 0.5,
		right = CoD.SelectStartLocZombie.StartLocOptionInfoWidth * 0.5,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.SelectStartLocZombie.StartLocOptionInfoHeight * 0.5,
		bottom = CoD.SelectStartLocZombie.StartLocOptionInfoHeight * 0.5,
		alpha = 0
	}
	selectStartLocMenu.startLocOptionInfo = LUI.UIElement.new( startLocOptionInfoState )
	selectStartLocMenu.startLocOptionInfo:registerAnimationState( "hide", {
		alpha = 0
	} )
	selectStartLocMenu.startLocOptionInfo.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.SelectStartLocZombie.StartLocOptionInfoWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.SelectStartLocZombie.StartLocOptionInfoHeight
	} )
	selectStartLocMenu.startLocOptionInfo:addElement( selectStartLocMenu.startLocOptionInfo.buttonList )
	selectStartLocMenu:addElement( selectStartLocMenu.startLocOptionInfo )
	if selectStartLocMenu.isPublicMatch and CoD.PlaylistCategoryFilter == "playermatch" then
		startLocContainer.playerCount = LUI.UIText.new()
		startLocContainer.playerCount:setLeftRight( true, false, 0, 0 )
		startLocContainer.playerCount:setTopBottom( false, true, -30 - CoD.textSize.Big, -30 )
		startLocContainer.playerCount:setFont( CoD.fonts.Big )
		startLocContainer.playerCount:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		startLocContainer:addElement( startLocContainer.playerCount )
	end
	CoD.SelectStartLocZombie.SetCurrentStartLocInfoIndex( selectStartLocMenu )
	selectStartLocMenu.isGameTypeListOpenned = false
	selectStartLocMenu.isBackToStartLoc = false
	selectStartLocMenu.m_inputDisabled = true
end

CoD.SelectStartLocZombie.GetStartLocs = function ( self, controller, map )
	if self and self.isPublicMatch == true then
		if CoD.Zombie.PlayListCurrentSuperCategoryIndex == nil then
			local currentPlayList = Engine.GetPlaylistID()
			CoD.Zombie.PlayListCurrentSuperCategoryIndex = Engine.GetPlaylistSuperCategoryID( currentPlayList )
		end
		return Engine.GetPlaylistCategories( CoD.Zombie.PlayListCurrentSuperCategoryIndex )
	end
	local mapRef = CoD.Zombie.GetUIMapName()
	if map then
		mapRef = map
	end
	local startLocations = Engine.GetStartLocsZombie( mapRef )
	for key, value in pairs( startLocations ) do
		local gameModes = Engine.GetGamemodesZombie( mapRef, value.ref )
		local f7_local3 = false
		for gameKey, gameValue in pairs( gameModes ) do
			local hasDLC = Engine.HasDLCContent( Engine.TableLookup( nil, CoD.gametypesTable, 2, mapRef, 3, value.ref, 4, gameValue.ref, 5 ) )
			if hasDLC then
				f7_local3 = true
				break
			end
		end
		if not f7_local3 then
			startLocations[key] = nil
		end
	end
	return startLocations
end

CoD.SelectStartLocZombie.StartLocInfoSelectedFromMap = function ( menu, event )
	local startLocInfoCurrent = menu.startLocInfos[menu.currentStartLocIndex]
	menu.selectedMapStartLocation = startLocInfoCurrent.ref
	Engine.Exec( event.controller, "xupdatepartystate" )
	startLocInfoCurrent.startLocIcon:completeAnimation()
	startLocInfoCurrent.startLocIcon:setAlpha( 1 )
	CoD.SelectStartLocZombie.ShowStartLocOptionList( menu, menu.currentStartLocIndex, event )
	CoD.GameMapZombie.SwitchToMapDirect( 2, true, 500 )
	CoD.SelectStartLocZombie.DisableNonSelectedStartLoc( menu )
	CoD.Fog.Hide( 500 )
end

CoD.SelectStartLocZombie.StartLocGamepadButton = function ( self, event )
	local currentMenu = self.currentMenu
	if currentMenu.m_inputDisabled or currentMenu.m_ownerController ~= event.controller then
		return 
	end
	local dispatchEvent = true
	if event.down == true then
		local currentStartLocIndex = currentMenu.currentStartLocIndex
		local startLocInfoNext = nil
		if event.button == "primary" then
			Engine.PlaySound( "zmb_ui_map_level_select" )
			CoD.SelectStartLocZombie.StartLocInfoSelectedFromMap( currentMenu, event )
			if currentMenu.startLocNewOverlayContainer then
				currentMenu.startLocNewOverlayContainer:animateToState( "hide" )
			end
		else
			startLocInfoNext = CoD.SelectStartLocZombie.GetNextStartLoc( currentMenu, event )
		end
		if startLocInfoNext ~= nil and currentStartLocIndex ~= currentMenu.currentStartLocIndex then
			CoD.SelectStartLocZombie.GoToStartLoc( currentMenu, currentStartLocIndex, currentMenu.currentStartLocIndex )
		end
	end
	return true
end

CoD.SelectStartLocZombie.DisableNonSelectedStartLoc = function ( self )
	for index = 1, self.startLocCount, 1 do
		if index ~= self.currentStartLocIndex then
			self.startLocInfos[index]:animateToState( "disabled", 300 )
		end
	end
	if CoD.Zombie.miniGameDisabled == false then
		self.zombieDotContainer:setAlpha( 0 )
	end
end

CoD.SelectStartLocZombie.SetCurrentStartLocInfoIndex = function ( self )
	local startLoc = Dvar.ui_zm_mapstartlocation:get()
	local startLocInfo = nil
	if startLoc == "" then
		startLoc = CoD.Zombie.START_LOCATION_TRANSIT
	end
	self.selectedMapStartLocation = startLoc
	for i = 1, self.startLocCount, 1 do
		if startLoc == self.startLocInfos[i].ref then
			self.currentStartLocIndex = i
			break
		end
	end
	if self.currentStartLocIndex == nil then
		self.currentStartLocIndex = 1
	end
end

CoD.SelectStartLocZombie.GetNextStartLoc = function ( menu, event )
	local startLocInfoCurrent = menu.startLocInfos[menu.currentStartLocIndex]
	local startLocInfoNextRef, startLocInfo = nil
	local startLocInfoNextIndex = 0
	if event.button == "left" then
		startLocInfoNextRef = startLocInfoCurrent.leftStartLoc
	elseif event.button == "right" then
		startLocInfoNextRef = startLocInfoCurrent.rightStartLoc
	elseif event.button == "up" then
		startLocInfoNextRef = startLocInfoCurrent.upStartLoc
	elseif event.button == "down" then
		startLocInfoNextRef = startLocInfoCurrent.downStartLoc
	end
	if startLocInfoNextRef ~= "none" then
		for i = 1, menu.startLocCount, 1 do
			if menu.startLocInfos[i].ref == startLocInfoNextRef then
				startLocInfoNextIndex = i
			end
		end
		if startLocInfoNextIndex > 0 then
			menu.currentStartLocIndex = startLocInfoNextIndex
		end
	end
	return menu.startLocInfos[menu.currentStartLocIndex]
end

CoD.SelectStartLocZombie.BackButton = function ( self, event )
	if self.m_ownerController ~= event.controller then
		return true
	elseif not self.m_inputDisabled then
		if self.isBackToStartLoc == true then
			self.startLocOptionInfo:animateToState( "hide" )
			self.startLocContainer.m_inputDisabled = false
			self.startLocOptionInfo.m_inputDisabled = true
			self.isBackToStartLoc = false
			CoD.GameMapZombie.SwitchToMapDirect( 2, false, 500 )
			CoD.SelectStartLocZombie.ShowStartLoc( self )
			CoD.Fog.Show( 500 )
			if self.startLocNewOverlayContainer ~= nil then
				self.startLocNewOverlayContainer:animateToState( "show" )
			end
		else
			CoD.GameGlobeZombie.MoveDownShow( event.controller )
			CoD.SelectStartLocZombie.HideStartLoc( self )
			if self.startLocNewOverlayContainer ~= nil then
				self.startLocNewOverlayContainer:animateToState( "hide" )
			end
		end
	end
end

CoD.SelectStartLocZombie.GetStartLocOptions = function ( self, startLocIndex )
	if self.isPublicMatch == true then
		return self.startLocInfos[startLocIndex].playlists
	else
		local mapRef = CoD.Zombie.GetUIMapName()
		return Engine.GetGamemodesZombie( mapRef, self.selectedMapStartLocation )
	end
end

CoD.SelectStartLocZombie.ShowStartLocOptionList = function ( self, startLocIndex, event )
	local controller = event.controller
	local startLocInfoCurrent = self.startLocInfos[startLocIndex]
	local startLocOptionInfo = self.startLocOptionInfo
	startLocOptionInfo.buttonList:removeAllButtons()
	local optionID = nil
	if self.isPublicMatch == true then
		optionID = Engine.ProfileInt( controller, "playlist_" .. CoD.PlaylistCategoryFilter )
		self.totalStartLocationOptionPlayerCount = 0
	else
		optionID = Engine.DvarString( nil, "ui_gametype" )
	end
	local firstOptionButton = nil
	local startLocOptions = CoD.SelectStartLocZombie.GetStartLocOptions( self, startLocIndex )
	local startLocOptionCount = 0
	for index, startLocOption in ipairs( startLocOptions ) do
		local f15_local3 = startLocOption.name
		if startLocOption.ref == CoD.Zombie.GAMETYPE_ZCLASSIC then
			f15_local3 = "ZMUI_" .. startLocOption.ref .. "_" .. CoD.Zombie.GetUIMapName() .. "_CAPS"
		end
		local startLocOptionButton = startLocOptionInfo.buttonList:addButton( Engine.Localize( f15_local3 ) )
		startLocOptionButton.name = f15_local3
		if self.isPublicMatch == true then
			startLocOptionButton.ref = startLocOption.index
			startLocOptionButton.hintText = Engine.Localize( startLocOption.description )
			startLocOptionButton.image = startLocOption.icon
			if CoD.PlaylistCategoryFilter == "playermatch" then
				startLocOptionButton.playerCount = startLocOption.playerCount
				self.totalStartLocationOptionPlayerCount = self.totalStartLocationOptionPlayerCount + startLocOption.playerCount
			end
		else
			startLocOptionButton.ref = startLocOption.ref
			startLocOptionButton.gameTypeGroup = Engine.TableLookup( controller, CoD.gametypesTable, 0, 0, 1, startLocOption.ref, 9 )
			startLocOptionButton.hintText = Engine.Localize( Engine.TableLookup( controller, CoD.gametypesTable, 0, 0, 1, startLocOption.ref, 3 ) .. "_" .. startLocInfoCurrent.ref )
			startLocOptionButton.image = RegisterMaterial( Engine.TableLookup( controller, CoD.gametypesTable, 0, 0, 1, startLocOption.ref, 4 ) )
		end
		startLocOptionButton.startLocation = startLocInfoCurrent.ref
		local gameType = nil
		if self.isPublicMatch then
			gameType = Engine.GetPlaylistGameType( controller, startLocOption.index )
		else
			gameType = startLocOption.ref
		end
		startLocOptionButton.gameType = gameType
		local newIconPosition = Engine.TableLookup( controller, CoD.gametypesTable, 2, CoD.Zombie.GetUIMapName(), 3, startLocInfoCurrent.ref, 4, gameType, 6 )
		local seenGameModeMap = CoD.SelectStartLocZombie.SeenGameModeMap( controller, CoD.Zombie.GetUIMapName(), startLocInfoCurrent.ref, gameType )
		if newIconPosition == "left" then
			startLocOptionButton:showZMNewIcon( not seenGameModeMap, nil, true )
		elseif newIconPosition == "right" then
			startLocOptionButton:showZMNewIcon( not seenGameModeMap, nil, false )
		end
		startLocOptionButton:registerEventHandler( "button_action", CoD.SelectStartLocZombie.StartLocOptionButton )
		startLocOptionButton:registerEventHandler( "gain_focus", CoD.SelectStartLocZombie.StartLocOptionButtonGainFocus )
		startLocOptionButton.currentMenu = self
		if firstOptionButton == nil then
			firstOptionButton = startLocOptionButton
		end
		if optionID == startLocOptionButton.ref then
			firstOptionButton = startLocOptionButton
		end
		startLocOptionCount = startLocOptionCount + 1
		if self.isPublicMatch == false then
			if CoD.Zombie.GameTypeGroups[startLocOptionButton.gameType].maxPlayers < Engine.PartyGetPlayerCount() then
				startLocOptionButton:disable()
			end
		end
		local maxTeamPlayers = CoD.Zombie.GameTypeGroups[startLocOptionButton.gameType].maxTeamPlayers
		if maxTeamPlayers and maxTeamPlayers < Engine.PartyGetPlayerCount() then
			startLocOptionButton:disable()
		end
	end
	if CoD.useController then
		firstOptionButton:processEvent( {
			name = "gain_focus"
		} )
	end
	local leftValue = startLocInfoCurrent.startLocOptionX
	local rightValue = leftValue + CoD.SelectStartLocZombie.StartLocOptionInfoWidth
	local topValue = startLocInfoCurrent.startLocOptionY
	local bottomValue = topValue + (CoD.CoD9Button.Height + CoD.ButtonList.ButtonSpacing) * startLocOptionCount
	local startLocOptionInfoNewState = {
		leftAnchor = false,
		rightAnchor = false,
		left = leftValue,
		right = rightValue,
		topAnchor = false,
		bottomAnchor = false,
		top = topValue,
		bottom = bottomValue,
		alpha = 1
	}
	startLocOptionInfo:registerAnimationState( "show", startLocOptionInfoNewState )
	startLocOptionInfo:animateToState( "show" )
	self.startLocContainer.m_inputDisabled = true
	startLocOptionInfo.m_inputDisabled = false
	self.isBackToStartLoc = true
	self.isGameTypeListOpenned = true
end

CoD.SelectStartLocZombie.StartLocOptionButtonGainFocus = function ( startLocOptionButton, event )
	local retVal = CoD.CoD9Button.GainFocus( startLocOptionButton, event )
	if startLocOptionButton.currentMenu.isPublicMatch and CoD.PlaylistCategoryFilter == "playermatch" then
		local playerCountString = Engine.FormatNumberWithCommas( startLocOptionButton.playerCount )
		local totalPlayerCountString = Engine.FormatNumberWithCommas( startLocOptionButton.currentMenu.totalStartLocationOptionPlayerCount )
		startLocOptionButton.currentMenu.startLocContainer.playerCount:setText( Engine.Localize( "ZMUI_GAMETYPE_USER_COUNT", playerCountString, totalPlayerCountString, startLocOptionButton.name ) )
	end
	return retVal
end

CoD.SelectStartLocZombie.GoToStartLoc = function ( self, currentStartLocIndex, nextStartLocIndex )
	if 0 < currentStartLocIndex then
		local startLocInfoCurrent = self.startLocInfos[currentStartLocIndex]
		startLocInfoCurrent.startLocIcon:animateToState( "show_default" )
		startLocInfoCurrent.newImage:animateToState( "show_default" )
	end
	local startLocInfoNext = self.startLocInfos[nextStartLocIndex]
	startLocInfoNext.startLocIcon:animateToState( "show_selected" )
	startLocInfoNext.newImage:animateToState( "show_selected" )
	CoD.SelectStartLocZombie.StartLocIconStartPulse( startLocInfoNext.startLocIcon )
	self.startLocNewOverlayContainer:animateToState( "show" )
	if self.isPublicMatch == true and CoD.PlaylistCategoryFilter == "playermatch" then
		local playerCountString = Engine.FormatNumberWithCommas( startLocInfoNext.playerCount )
		local totalPlayerCountString = Engine.FormatNumberWithCommas( self.totalStartLocationPlayerCount )
		self.startLocContainer.playerCount:setText( Engine.Localize( "ZMUI_START_LOCATION_USER_COUNT", playerCountString, totalPlayerCountString, startLocInfoNext.name ) )
	end
	self.startLocOptionInfo:animateToState( "hide" )
	self.isGameTypeListOpenned = false
	self.startLocOptionInfo.m_inputDisabled = true
	self.startLocContainer.m_inputDisabled = false
	Engine.PlaySound( "zmb_ui_map_level_switch" )
end

CoD.SelectStartLocZombie.StartLocOptionButton = function ( self, event )
	if self.currentMenu.isGameTypeListOpenned == true then
		CoD.SelectStartLocZombie.SawGameModeMap( event.controller, CoD.Zombie.GetUIMapName(), self.startLocation, self.gameType )
		self:dispatchEventToParent( {
			name = "startloc_option_selected",
			controller = event.controller,
			ref = self.ref,
			group = self.gameTypeGroup
		} )
	end
end

CoD.SelectStartLocZombie.SetUIMapName = function ( self, event )
	local mapRef = Dvar.ui_mapname:get()
	local startLoc = Dvar.ui_zm_mapstartlocation:get()
	local gameType = Dvar.ui_gametype:get()
	if mapRef ~= "" and string.find( mapRef, CoD.Zombie.MAP_ZM_TRANSIT ) ~= nil then
		if startLoc == CoD.Zombie.START_LOCATION_DINER and gameType == CoD.Zombie.GAMETYPE_ZCLEANSED then
			Engine.SetDvar( "ui_mapname", CoD.Zombie.MAP_ZM_TRANSIT_DR )
		elseif startLoc == CoD.Zombie.START_LOCATION_FARM and gameType == CoD.Zombie.GAMETYPE_ZCLEANSED then
			Engine.SetDvar( "ui_mapname", CoD.Zombie.MAP_ZM_TRANSIT_TM )
		elseif startLoc == CoD.Zombie.START_LOCATION_TOWN and gameType == CoD.Zombie.GAMETYPE_ZMEAT then
			Engine.SetDvar( "ui_mapname", CoD.Zombie.MAP_ZM_TRANSIT_TM )
		elseif startLoc == CoD.Zombie.START_LOCATION_TUNNEL and gameType == CoD.Zombie.GAMETYPE_ZMEAT then
			Engine.SetDvar( "ui_mapname", CoD.Zombie.MAP_ZM_TRANSIT_TM )
		else
			Engine.SetDvar( "ui_mapname", CoD.Zombie.MAP_ZM_TRANSIT )
		end
	end
end

CoD.SelectStartLocZombie.GameTypeSelected = function ( self, event )
	local currentGameType = Dvar.ui_gametype:get()
	Engine.Exec( event.controller, "resetCustomGametype" )
	Engine.SetGametype( event.ref )
	Engine.SetDvar( "ui_gametype", event.ref )
	Engine.SetDvar( "ui_zm_gamemodegroup", event.group )
	Engine.SetDvar( "ui_zm_mapstartlocation", self.selectedMapStartLocation )
	Engine.Exec( event.controller, "xupdatepartystate" )
	Engine.SetProfileVar( event.controller, CoD.profileKey_gametype, event.ref )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( self.m_ownerController )
	CoD.SelectStartLocZombie.SetUIMapName( self, event )
	if currentGameType ~= event.ref then
		Engine.PartyHostReassignTeams()
	end
	Engine.PartySetMaxPlayerCount( CoD.Zombie.GameTypeGroups[event.ref].maxPlayers )
	local privateLobby = nil
	if Engine.SessionMode_IsSystemlinkGame() then
		privateLobby = self:openMenu( "PrivateLocalGameLobby", event.controller )
		privateLobby:setPreviousMenu( "MainMenu" )
		Dvar.party_maxplayers_systemlink:set( CoD.Zombie.GameTypeGroups[event.ref].maxPlayers )
		Dvar.party_maxlocalplayers_systemlink:set( CoD.Zombie.GameTypeGroups[event.ref].maxLocalPlayers )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true then
		if CoD.isWIIU then
			local maxPrivatePlayers = Engine.DvarInt( nil, "party_maxlocalplayers_privatematch" )
			if maxPrivatePlayers < CoD.Zombie.GameTypeGroups[event.ref].maxPlayers then
				Dvar.party_maxplayers:set( maxPrivatePlayers )
			end
		end
		privateLobby = self:openMenu( "SplitscreenGameLobby", event.controller )
		privateLobby:setPreviousMenu( "MainMenu" )
		Dvar.party_maxplayers_local_splitscreen:set( CoD.Zombie.GameTypeGroups[event.ref].maxLocalSplitScreenPlayers )
		Dvar.party_maxlocalplayers_local_splitscreen:set( CoD.Zombie.GameTypeGroups[event.ref].maxLocalSplitScreenPlayers )
	else
		privateLobby = self:openMenu( "PrivateOnlineGameLobby", event.controller )
		privateLobby:setPreviousMenu( "MainLobby" )
		privateLobby:registerAnimationState( "hide", {
			alpha = 0
		} )
		privateLobby:animateToState( "hide" )
		privateLobby:registerAnimationState( "show", {
			alpha = 1
		} )
		privateLobby:animateToState( "show", 500 )
		Dvar.party_maxplayers_privatematch:set( CoD.Zombie.GameTypeGroups[event.ref].maxPlayers )
		Dvar.party_maxlocalplayers_privatematch:set( CoD.Zombie.GameTypeGroups[event.ref].maxLocalPlayers )
	end
	Engine.Exec( self.partyHostcontroller, "xsessionupdate" )
	self:close()
	if privateLobby ~= nil and Engine.ProfileInt( event.controller, "com_first_time_privategame_host_zm" ) == 1 and event.ref ~= "zcleansed" then
		privateLobby:openPopup( "SelectDifficultyLevelZM", event.controller )
	end
end

CoD.SelectStartLocZombie.PlaylistSelected = function ( self, event )
	Engine.SetPlaylistID( event.ref )
	Engine.SetProfileVar( event.controller, "playlist_" .. CoD.PlaylistCategoryFilter, tostring( event.ref ) )
	Engine.PartyHostClearUIState()
	if CoD.PlaylistCategoryFilter == CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH then
		Engine.ExecNow( event.controller, "xstartpartyhost" )
	else
		Engine.Exec( event.controller, "xstartparty" )
	end
	Engine.Exec( event.controller, "updategamerprofile" )
	local publicLobby = self:openMenu( "PublicGameLobby", event.controller )
	publicLobby:setPreviousMenu( "MainLobby" )
	publicLobby:setAlpha( 0 )
	publicLobby:beginAnimation( "show", 500 )
	publicLobby:setAlpha( 1 )
	self:close()
end

CoD.SelectStartLocZombie.StartLocOptionSelected = function ( self, event )
	Engine.PlaySound( "zmb_ui_map_level_select" )
	if self.isPublicMatch == true then
		CoD.SelectStartLocZombie.PlaylistSelected( self, event )
	else
		CoD.SelectStartLocZombie.GameTypeSelected( self, event )
	end
end

CoD.SelectStartLocZombie.GoToPreChoices = function ( self, event )
	CoD.SelectStartLocZombie.SetCurrentStartLocInfoIndex( self )
	local startLocInfo = nil
	for i = 1, self.startLocCount, 1 do
		startLocInfo = self.startLocInfos[i]
		if self.currentStartLocIndex == i then
			startLocInfo.startLocIcon:animateToState( "show_selected" )
			CoD.SelectStartLocZombie.ShowStartLocOptionList( self, i, event )
			startLocInfo:setAlpha( 1 )
		else
			startLocInfo:animateToState( "disabled", 300 )
		end
	end
	self.m_inputDisabled = false
end

CoD.SelectStartLocZombie.ShowStartLoc = function ( self )
	if self.startLocCount == nil then
		return 
	end
	for index = 1, self.startLocCount, 1 do
		self.startLocInfos[index]:animateToState( "show", 300 )
	end
	self.m_inputDisabled = false
	CoD.SelectStartLocZombie.GoToStartLoc( self, 0, self.currentStartLocIndex )
	if false == CoD.Zombie.miniGameDisabled then
		CoD.SelectStartLocZombie.ZombieMoveStart( self )
	end
end

CoD.SelectStartLocZombie.HideStartLoc = function ( self )
	if self.startLocCount == nil then
		return 
	end
	for index = 1, self.startLocCount, 1 do
		self.startLocInfos[index]:animateToState( "hide" )
	end
	self.startLocOptionInfo:animateToState( "hide" )
	if CoD.Zombie.miniGameDisabled == false then
		self.zombieDotContainer:setAlpha( 0 )
	end
end

CoD.SelectStartLocZombie.StartLocIconStartPulse = function ( startLocIcon )
	local duration = math.random( CoD.SelectStartLocZombie.StartLocIconPulseDurationMin, CoD.SelectStartLocZombie.StartLocIconPulseDurationMax )
	startLocIcon:beginAnimation( "selected_pulse_high", duration )
	local alphaValue = math.max( math.random(), CoD.SelectStartLocZombie.StartLocIconPulseAlphaHighMin )
	startLocIcon:setAlpha( alphaValue )
end

CoD.SelectStartLocZombie.StartLocIconPulseHighFinish = function ( startLocIcon, event )
	if event.interrupted == nil then
		local duration = math.random( CoD.SelectStartLocZombie.StartLocIconPulseDurationMin, CoD.SelectStartLocZombie.StartLocIconPulseDurationMax )
		startLocIcon:beginAnimation( "selected_pulse_low", duration )
		local alphaValue = math.min( math.random(), CoD.SelectStartLocZombie.StartLocIconPulseAlphaLowMax )
		startLocIcon:setAlpha( alphaValue )
	end
end

CoD.SelectStartLocZombie.StartLocIconPulseLowFinish = function ( startLocIcon, event )
	if event.interrupted == nil then
		local duration = math.random( CoD.SelectStartLocZombie.StartLocIconPulseDurationMin, CoD.SelectStartLocZombie.StartLocIconPulseDurationMax )
		startLocIcon:beginAnimation( "selected_pulse_high", duration )
		local alphaValue = math.max( math.random(), CoD.SelectStartLocZombie.StartLocIconPulseAlphaHighMin )
		startLocIcon:setAlpha( alphaValue )
	end
end

if CoD.Zombie.miniGameDisabled == false then
	CoD.SelectStartLocZombie.ZombieMoveFindClosestNodeIndex = function ( leftValue, topValue )
		local leftDiff = 0
		local topDiff = 0
		local distSquare = 0
		local distSquareMin = 100000000
		local closestNodeIndex = 1
		for index = 1, CoD.SelectStartLocZombie.ZombieDotPathNodeCount, 1 do
			leftDiff = CoD.SelectStartLocZombie.ZombieDotPathNodes[index].left - leftValue
			topDiff = CoD.SelectStartLocZombie.ZombieDotPathNodes[index].top - topValue
			distSquare = leftDiff * leftDiff + topDiff * topDiff
			if distSquare < distSquareMin then
				distSquareMin = distSquare
				closestNodeIndex = index
			end
		end
		return closestNodeIndex
	end
	
	CoD.SelectStartLocZombie.ZombieMoveStart = function ( self )
		self.zombieDotContainer:setAlpha( 1 )
		for index = 1, CoD.SelectStartLocZombie.ZombieDotCount, 1 do
			CoD.SelectStartLocZombie.ZombieMoveToNext( self.zombieDots[index] )
		end
	end
	
	CoD.SelectStartLocZombie.ZombieMoveToNext = function ( zombieDot )
		local currNode = CoD.SelectStartLocZombie.ZombieDotPathNodes[zombieDot.currentPathNodeIndex]
		local nextNodeIndex = math.random( 1, CoD.SelectStartLocZombie.ZombieDotPathNodeCount )
		while nextNodeIndex == zombieDot.currentPathNodeIndex do
			nextNodeIndex = math.random( 1, CoD.SelectStartLocZombie.ZombieDotPathNodeCount )
		end
		zombieDot.currentPathNodeIndex = nextNodeIndex
		local nextNode = CoD.SelectStartLocZombie.ZombieDotPathNodes[nextNodeIndex]
		local randomDir = math.random( -CoD.SelectStartLocZombie.ZombieDotMovingDirMax, CoD.SelectStartLocZombie.ZombieDotMovingDirMax )
		randomDir = randomDir * CoD.GameGlobeZombie.DegreesToRadiansScale
		local leftDelta = nextNode.radius * math.cos( randomDir )
		local topDelta = nextNode.radius * math.sin( randomDir )
		local leftNew = nextNode.left + leftDelta
		local topNew = nextNode.top + topDelta
		local leftDiff = leftNew - currNode.left
		local topDiff = topNew - currNode.top
		local dist = math.sqrt( leftDiff * leftDiff + topDiff * topDiff )
		zombieDot:beginAnimation( "zombie_move", dist / CoD.SelectStartLocZombie.ZombieDotMovingSpeed )
		zombieDot:setLeftRight( false, false, leftNew, leftNew + CoD.SelectStartLocZombie.ZombieDotWidth )
		zombieDot:setTopBottom( false, false, topNew, topNew + CoD.SelectStartLocZombie.ZombieDotHeight )
	end
	
	CoD.SelectStartLocZombie.ZombieMoveFinish = function ( zombieDot, event )
		if event.interrupted == nil then
			CoD.SelectStartLocZombie.ZombieMoveToNext( zombieDot )
		end
	end
	
end
CoD.SelectStartLocZombie.StartLocMouseOver = function ( menu, event )
	CoD.SelectStartLocZombie.GoToStartLoc( menu, menu.currentStartLocIndex, event.index )
	menu.currentStartLocIndex = event.index
end

CoD.SelectStartLocZombie.StartLocMouseClick = function ( menu, event )
	if menu.currentStartLocIndex ~= event.index then
		CoD.SelectStartLocZombie.GoToStartLoc( menu, menu.currentStartLocIndex, event.index )
		menu.currentStartLocIndex = event.index
	end
	CoD.SelectStartLocZombie.StartLocInfoSelectedFromMap( menu, event )
end

CoD.SelectStartLocZombie.StartLocInfo_MouseEnter = function ( startLocInfo, event )
	startLocInfo:dispatchEventToParent( {
		name = "startloc_mouseover",
		controller = event.controller,
		index = startLocInfo.index
	} )
end

CoD.SelectStartLocZombie.StartLocInfo_LeftMouseUp = function ( startLocInfo, event )
	startLocInfo:dispatchEventToParent( {
		name = "startloc_mouseclick",
		controller = event.controller,
		index = startLocInfo.index
	} )
end

local convertBase10ToBase2 = function ( number )
	return CoD.BaseN( tonumber( number, 10 ), 2 )
end

local convertBase2ToBase10 = function ( number )
	return CoD.BaseN( tonumber( number, 2 ), 10 )
end

local convertBase2ToTable = function ( bitfield )
	local bitTable = {}
	for index = 1, string.len( bitfield ), 1 do
		bitTable[index] = tonumber( string.sub( bitfield, -index, -index ) )
	end
	for index = string.len( bitfield ) + 1, 32, 1 do
		bitTable[index] = 0
	end
	return bitTable
end

local convertTableToBase2 = function ( inputTable )
	return string.reverse( table.concat( inputTable, "" ) )
end

CoD.SelectStartLocZombie.SeenStartMap = function ( controller, map )
	if map == nil then
		return nil
	end
	local startLocations = CoD.SelectStartLocZombie.GetStartLocs( nil, controller, map )
	for key, value in pairs( startLocations ) do
		if not CoD.SelectStartLocZombie.SeenStartLocation( controller, map, value.ref ) then
			return false
		end
	end
	return true
end

CoD.SelectStartLocZombie.SeenStartLocation = function ( controller, map, startLocation )
	if map == nil or startLocation == nil then
		return nil
	end
	local gameModes = Engine.GetGamemodesZombie( map, startLocation )
	for key, value in pairs( gameModes ) do
		if not CoD.SelectStartLocZombie.SeenGameModeMap( controller, map, startLocation, value.ref ) then
			return false
		end
	end
	return true
end

CoD.SelectStartLocZombie.SawGameModeMap = function ( controller, map, startLocation, gameMode )
	local crumbs = Engine.ProfileValueAsString( controller, "unlock_crumbs_zm" )
	local seen = convertBase2ToTable( convertBase10ToBase2( crumbs ) )
	local gameModeMapIndex = tonumber( Engine.TableLookup( controller, CoD.gametypesTable, 2, map, 3, startLocation, 4, gameMode, 1 ) )
	if gameModeMapIndex == nil then
		return nil
	else
		seen[gameModeMapIndex + 1] = 1
		Engine.SetProfileVar( controller, "unlock_crumbs_zm", convertBase2ToBase10( convertTableToBase2( seen ) ) )
	end
end

CoD.SelectStartLocZombie.SeenGameModeMap = function ( controller, map, startLocation, gameMode )
	local crumbs = Engine.ProfileValueAsString( controller, "unlock_crumbs_zm" )
	local seen = convertBase2ToTable( convertBase10ToBase2( crumbs ) )
	if CoD.Zombie.GameTypeGroups[gameMode] then
		local maxPartySize = Dvar.party_maxplayers:get()
		local minRequiredPlayers = CoD.Zombie.GameTypeGroups[gameMode].minPlayers
		if maxPartySize < minRequiredPlayers then
			return true
		end
	end
	local gameModeMapIndex = tonumber( Engine.TableLookup( controller, CoD.gametypesTable, 2, map, 3, startLocation, 4, gameMode, 1 ) )
	if gameModeMapIndex == nil then
		return nil
	elseif gameModeMapIndex <= 11 then
		return true
	elseif seen[gameModeMapIndex + 1] == 1 then
		return true
	end
	return false
end

