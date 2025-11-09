require( "ui_mp.T6.Zombie.SelectStartLocZombie" )

CoD.SelectMapZombie = {}
CoD.SelectMapZombie.MapInfoHeightOffSet = -20
CoD.SelectMapZombie.MapInfoWidth = 24
CoD.SelectMapZombie.MapInfoHeight = 24
CoD.SelectMapZombie.MapInfoTitleHeight = 60
CoD.SelectMapZombie.SideNewIconsRadiusAddOn = 15
CoD.SelectMapZombie.SideNewIconsLeftOffSet = 40
CoD.SelectMapZombie.SideNewIconsLatitudeScale = 1
CoD.SelectMapZombie.MapInfoNewIconWidth = 64
CoD.SelectMapZombie.MapInfoNewIconHeight = 32
CoD.SelectMapZombie.MapInfoNewIconHiddenScale = 0.8
CoD.SelectMapZombie.NewIconOffsetDirectionTable = {
	top = {
		width = 19,
		height = -25
	},
	left = {
		width = -18,
		height = 0
	},
	bottom = {
		width = -19,
		height = 25
	},
	right = {
		width = 50,
		height = 0
	}
}
CoD.SelectMapZombie.NewIconZoomOffsetDirectionTable = {
	top = {
		width = 17,
		height = -50
	},
	left = {
		width = -40,
		height = 0
	},
	bottom = {
		width = -17,
		height = 50
	},
	right = {
		width = 75,
		height = 0
	}
}
CoD.SelectMapZombie.GlobeMapSelectionRotationTimeShort = 250
CoD.SelectMapZombie.GlobeMapSelectionRotationTimeMedium = 500
CoD.SelectMapZombie.GlobeMapSelectionRotationTimeLong = 750
CoD.SelectMapZombie.GlobeMapSelectionRotationTimeLongest = 1000
CoD.SelectMapZombie.MapRotationInput = {}
CoD.SelectMapZombie.MapInfoRotatingPathDeltaLongitude = math.pi / 8
CoD.SelectMapZombie.MapInfoRotatingLongitudeOrigin = -math.pi / 2
CoD.SelectMapZombie.MapInfoRotatingPathNodesCount = 17
CoD.SelectMapZombie.MapInfoRotatingPathNodes = {}
for index = 1, CoD.SelectMapZombie.MapInfoRotatingPathNodesCount, 1 do
	CoD.SelectMapZombie.MapInfoRotatingPathNodes[index] = {
		longitude = CoD.GameGlobeZombie.ShaderVector2YMin + CoD.SelectMapZombie.MapInfoRotatingPathDeltaLongitude * (index - 1)
	}
end
CoD.SelectMapZombie.MapNewIconMaterial = RegisterMaterial( "menu_mp_lobby_new_small" )
CoD.SelectMapZombie.DisableCycleRotation = true
LUI.createMenu.SelectMapZM = function ( controller )
	local selectMapMenu = CoD.Menu.New( "SelectMapZM" )
	selectMapMenu.m_ownerController = controller
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true or Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
		selectMapMenu:setPreviousMenu( "MainMenu" )
	else
		selectMapMenu:setPreviousMenu( "MainLobby" )
	end
	selectMapMenu.addSearchPreferencesButton = CoD.SelectMapZombie.AddSearchPreferencesButtonPrompt
	selectMapMenu:addSelectButton()
	selectMapMenu:addBackButton()
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true and CoD.PlaylistCategoryFilter ~= CoD.Zombie.PLAYLIST_CATEGORY_FILTER_SOLOMATCH then
		selectMapMenu:addSearchPreferencesButton()
	end
	selectMapMenu:registerEventHandler( "button_prompt_search_preferences", CoD.SelectMapZombie.ButtonPromptSearchPreferences )
	local mapInfoContainer = LUI.UIElement.new()
	mapInfoContainer:setLeftRight( true, true, 0, 0 )
	mapInfoContainer:setTopBottom( true, true, 0, 0 )
	mapInfoContainer.id = "mapinfocontainer"
	selectMapMenu:addElement( mapInfoContainer )
	selectMapMenu.mapInfos = {}
	local isPublicMatch = Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH )
	if isPublicMatch then
		selectMapMenu.totalSuperCategoryPlayerCount = 0
	end
	selectMapMenu.mapCount = 0
	local maps = CoD.SelectMapZombie.GetMaps( selectMapMenu, controller )
	local soloCount = nil
	local mapInfoIndex = 1
	for index, map in pairs( maps ) do
		if not isPublicMatch or map.filter == CoD.PlaylistCategoryFilter then
			map.loadName, soloCount = string.gsub( map.loadName, "_solo", "", 1 )
			local longitude = 0
			local latitude = 0
			local mapInfoPlaceLatitude = 0
			local x, y, alphaValue, sizeScale = CoD.SelectMapZombie:SphereToCartesian( CoD.GameGlobeZombie.CenterRadius, longitude, mapInfoPlaceLatitude )
			local mapInfo = LUI.UIElement.new()
			mapInfo:setLeftRight( false, false, x - 0.5 * CoD.SelectMapZombie.MapInfoWidth, x + 0.5 * CoD.SelectMapZombie.MapInfoWidth )
			mapInfo:setTopBottom( false, false, -y - 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet, -y + 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet )
			mapInfo:setAlpha( 0 )
			mapInfo.index = mapInfoIndex
			mapInfoIndex = mapInfoIndex + 1
			mapInfo.iconContainer = LUI.UIElement.new()
			mapInfo.iconContainer:setLeftRight( true, true, 0, 0 )
			mapInfo.iconContainer:setTopBottom( true, true, 0, 0 )
			mapInfo.iconContainer:setScale( 0 )
			mapInfo:addElement( mapInfo.iconContainer )
			local signpostName = CoD.GetMapValue( map.loadName, "previewImage", "black" )
			mapInfo.icon = LUI.UIImage.new()
			mapInfo.icon:setLeftRight( true, true, 0, 0 )
			mapInfo.icon:setTopBottom( true, true, 0, 0 )
			mapInfo.icon:setImage( RegisterMaterial( signpostName ) )
			if true == Dvar.ui_showNewestLeaderboards:get() and CoD.Zombie.IsSideQuestMap( map.loadName ) then
				local partialMapName = Engine.ToUpper( string.sub( map.loadName, 4 ) )
				local sidequestName = "SQ_" .. partialMapName .. "_LAST_COMPLETED"
				local sidequestStatValue = Engine.GetDStat( controller, "PlayerStatsList", sidequestName, "StatValue" )
				if sidequestStatValue ~= nil and sidequestStatValue > 0 then
					local glowImageContainer = LUI.UIElement.new()
					glowImageContainer:setLeftRight( true, true, -2, 2 )
					glowImageContainer:setTopBottom( true, true, -2, 2 )
					mapInfo.iconContainer:addElement( glowImageContainer )
					local glowImageName = "menu_" .. map.loadName .. "_signpost_glow"
					local glowIcon = LUI.UIImage.new()
					glowIcon:setLeftRight( true, true, 0, 0 )
					glowIcon:setTopBottom( true, true, 0, 0 )
					glowIcon:setImage( RegisterMaterial( glowImageName ) )
					glowIcon:setRGB( CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.r, CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.g, CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.b )
					glowImageContainer:addElement( glowIcon )
					glowImageContainer:alternateStates( 0, CoD.SelectMapZombie.PulseBright, CoD.SelectMapZombie.PulseLow, 750, 750 )
					local navCardInstalledName = "NAVCARD_APPLIED_" .. Engine.ToUpper( map.loadName )
					local navCardInstalledStatValue = Engine.GetDStat( controller, "PlayerStatsList", navCardInstalledName, "StatValue" )
					if not CoD.SelectMapZombie.NavCardRingImage then
						CoD.SelectMapZombie.NavCardRingImage = RegisterMaterial( "menu_zm_rings_ani" )
					end
					if not CoD.SelectMapZombie.NavCardLightningImage then
						CoD.SelectMapZombie.NavCardLightningImage = RegisterMaterial( "menu_zm_signpost_lightning" )
					end
					if navCardInstalledStatValue > 0 then
						local navCardRingImage = LUI.UIImage.new()
						navCardRingImage:setLeftRight( true, true, -3, 3 )
						navCardRingImage:setTopBottom( true, true, -3, 3 )
						navCardRingImage:setImage( CoD.SelectMapZombie.NavCardRingImage )
						navCardRingImage:setRGB( CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.r, CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.g, CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.b )
						navCardRingImage:setAlpha( 0.25 )
						mapInfo.iconContainer:addElement( navCardRingImage )
						local navCardLightningImage = LUI.UIImage.new()
						navCardLightningImage:setLeftRight( true, true, -3, 3 )
						navCardLightningImage:setTopBottom( true, true, -3, 3 )
						navCardLightningImage:setImage( CoD.SelectMapZombie.NavCardLightningImage )
						navCardLightningImage:setRGB( CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.r, CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.g, CoD.Zombie.SideQuestStoryLine[sidequestStatValue].color.b )
						navCardLightningImage:setAlpha( 1 )
						mapInfo.iconContainer:addElement( navCardLightningImage )
						mapInfo.iconContainer.navCardInstalled = true
					end
					mapInfo.icon:alternateStates( 0, CoD.Zombie.SideQuestStoryLine[sidequestStatValue].colorFunction, CoD.SelectMapZombie.ColorWhite, 750, 750 )
				end
			end
			mapInfo.iconContainer:addElement( mapInfo.icon )
			if not CoD.SelectStartLocZombie.SeenStartMap( controller, map.loadName ) then
				mapInfo.newIconPlacement = 0
				mapInfo.newIcon = LUI.UIImage.new()
				CoD.SelectMapZombie.MoveNewIconToNext( mapInfo, 0 )
				mapInfo.newIcon:setImage( CoD.SelectMapZombie.MapNewIconMaterial )
				mapInfo:addElement( mapInfo.newIcon )
				mapInfo.leftSideNewIcon = LUI.UIImage.new()
				mapInfo.leftSideNewIcon:setLeftRight( false, false, -CoD.SelectMapZombie.MapInfoNewIconWidth / 2, CoD.SelectMapZombie.MapInfoNewIconWidth / 2 )
				mapInfo.leftSideNewIcon:setTopBottom( false, false, -CoD.SelectMapZombie.MapInfoNewIconHeight / 2, CoD.SelectMapZombie.MapInfoNewIconHeight / 2 )
				mapInfo.leftSideNewIcon:setImage( CoD.SelectMapZombie.MapNewIconMaterial )
				mapInfo.leftSideNewIcon:setAlpha( 0 )
				mapInfoContainer:addElement( mapInfo.leftSideNewIcon )
				mapInfo.rightSideNewIcon = LUI.UIImage.new()
				mapInfo.rightSideNewIcon:setLeftRight( false, false, -CoD.SelectMapZombie.MapInfoNewIconWidth / 2, CoD.SelectMapZombie.MapInfoNewIconWidth / 2 )
				mapInfo.rightSideNewIcon:setTopBottom( false, false, -CoD.SelectMapZombie.MapInfoNewIconHeight / 2, CoD.SelectMapZombie.MapInfoNewIconHeight / 2 )
				mapInfo.rightSideNewIcon:setImage( CoD.SelectMapZombie.MapNewIconMaterial )
				mapInfo.rightSideNewIcon:setAlpha( 0 )
				mapInfoContainer:addElement( mapInfo.rightSideNewIcon )
			end
			if CoD.useMouse then
				local mouseButton = LUI.UIButton.new( LUI.UIElement.ContainerState, "mouse_select" )
				mouseButton:setLeftRight( true, true, 0, 0 )
				mouseButton:setTopBottom( true, true, 0, 0 )
				mouseButton.mapInfo = mapInfo
				if sizeScale == 0 then
					mouseButton:setHandleMouse( false )
				end
				mapInfo.mouseButton = mouseButton
				mapInfo:addElement( mouseButton )
			end
			mapInfo.superCategoryIndex = map.index
			mapInfo.name = map.name
			mapInfo.loadName = map.loadName
			mapInfo.size = "MPUI_MAPSIZE_" .. CoD.GetMapValue( map.loadName, "size", "MEDIUM" )
			mapInfo.x = x
			mapInfo.y = y
			mapInfo.z = z
			mapInfo.originalLongitude = longitude
			mapInfo.originalLatitude = latitude
			mapInfo.longitude = longitude
			mapInfo.latitude = latitude
			mapInfo.mapInfoPlaceLatitude = mapInfoPlaceLatitude
			if isPublicMatch and CoD.PlaylistCategoryFilter == "playermatch" then
				mapInfo.playerCount = map.playerCount
				selectMapMenu.totalSuperCategoryPlayerCount = selectMapMenu.totalSuperCategoryPlayerCount + map.playerCount
			end
			mapInfo:registerEventHandler( "transition_complete_move_to_next", CoD.SelectMapZombie.MapInfoMoveToNextFinish )
			mapInfoContainer:addElement( mapInfo )
			selectMapMenu.mapCount = selectMapMenu.mapCount + 1
			selectMapMenu.mapInfos[selectMapMenu.mapCount] = mapInfo
		end
		Engine.SetDvar( "ui_gametype", CoD.Zombie.GetDefaultGameTypeForMap() )
	end
	if isPublicMatch and CoD.PlaylistCategoryFilter == "playermatch" then
		selectMapMenu.playerCount = LUI.UIText.new()
		selectMapMenu.playerCount:setLeftRight( true, false, 0, 0 )
		selectMapMenu.playerCount:setTopBottom( false, true, -30 - CoD.textSize.Big, -30 )
		selectMapMenu.playerCount:setFont( CoD.fonts.Big )
		selectMapMenu.playerCount:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		selectMapMenu:addElement( selectMapMenu.playerCount )
	end
	CoD.GameGlobeZombie.gameGlobe.currentMenu = selectMapMenu
	CoD.GameGlobeZombie.mapInfoContainer = mapInfoContainer
	CoD.GameMapZombie.gameMap.currentMenu = selectMapMenu
	selectMapMenu:registerEventHandler( "gamepad_button", CoD.SelectMapZombie.GamepadButton )
	selectMapMenu:registerEventHandler( "button_prompt_back", CoD.SelectMapZombie.BackButton )
	selectMapMenu:registerEventHandler( "open_menu", CoD.SelectMapZombie.OpenMenu )
	if CoD.useMouse then
		selectMapMenu:setHandleMouse( true )
		selectMapMenu:setHandleMouseAnim( true )
		selectMapMenu:registerEventHandler( "mouse_select", CoD.SelectMapZombie.MouseSelect )
		selectMapMenu:registerEventHandler( "leftmousedown", CoD.SelectMapZombie.LeftMouseDown )
		selectMapMenu:registerEventHandler( "leftmouseup", CoD.SelectMapZombie.LeftMouseUp )
		selectMapMenu:registerEventHandler( "mousedrag", CoD.SelectMapZombie.MouseDrag )
	end
	selectMapMenu.currentMapIndex = 1
	selectMapMenu.m_inputDisabled = true
	Engine.Exec( controller, "loadcommonff" )
	return selectMapMenu
end

CoD.SelectMapZombie.ButtonPromptSearchPreferences = function ( self, event )
	self:openPopup( "SearchPreferences", event.controller )
end

CoD.SelectMapZombie.AddSearchPreferencesButtonPrompt = function ( self )
	self.searchPreferencesButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_SEARCH_PREFERENCES" ), self, "button_prompt_search_preferences", false, nil, false, nil, "S" )
	self:addRightButtonPrompt( self.searchPreferencesButton )
end

CoD.SelectMapZombie.OpenMenu = function ( self, event )
	if event.menuName ~= nil and CoD.Zombie.OpenMenuEventMenuNames[event.menuName] == 1 and not self.skipOpenMenuEvent and not self.m_inputDisabled then
		if event.menuName == "MainLobby" then
			CoD.GameGlobeZombie.gameGlobe.skipOpenMenuWhenAnimFinishs = true
			CoD.SelectMapZombie.HideMapInfo( self )
			CoD.GameMoonZombie.Reset()
			CoD.GameGlobeZombie.MoveToCorner( event.controller )
		end
		CoD.Lobby.OpenMenu( self, event )
	end
	self.skipOpenMenuEvent = nil
end

CoD.SelectMapZombie.GetMaps = function ( self, controller )
	local keptSignposts = nil
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
		local maps = Engine.GetPlaylistSuperCategories()
		keptSignposts = maps
	else
		local maps = CoD.mapsTable
		keptSignposts = {}
		local sortMaps = function ( a, b )
			return CoD.mapsTable[a].unique_id < CoD.mapsTable[b].unique_id
		end
		
		local filterMaps = function ( m )
			return CoD.mapsTable[m].session_mode == Enum.eModes.MODE_ZOMBIES
		end
		
		for id, map in LUI.IterateTableBySortedKeys( maps, sortMaps, filterMaps ) do
			if map.name == CoD.Zombie.MAP_ZM_TRANSIT or string.find( map.name, CoD.Zombie.MAP_ZM_TRANSIT ) == nil then
				table.insert( keptSignposts, map )
			end
		end
	end
	table.sort( keptSignposts, CoD.SelectMapZombie.SortMapsFunc )
	return keptSignposts
end

CoD.SelectMapZombie.SortMapsFunc = function ( a, b )
	local soloCount = nil
	a.loadName, soloCount = string.gsub( a.loadName, "_solo", "", 1 )
	b.loadName, soloCount = string.gsub( b.loadName, "_solo", "", 1 )
	local aLongitude = 0
	local bLongitude = 0
	return aLongitude < bLongitude
end

CoD.SelectMapZombie.GetMapIndexFromPlaylistSuperCategoryID = function ( self, superCategoryId )
	local mapIndex = 1
	for i = 1, self.mapCount, 1 do
		if self.mapInfos[i].superCategoryIndex == superCategoryId then
			mapIndex = i
			break
		end
	end
	return mapIndex
end

CoD.SelectMapZombie.GetMapIndexFromMapLoadName = function ( self, mapLoadName )
	local mapIndex = 1
	for i = 1, self.mapCount, 1 do
		if self.mapInfos[i].loadName == mapLoadName then
			mapIndex = i
			break
		end
	end
	return mapIndex
end

CoD.SelectMapZombie.GetFirstMapIndex = function ( self, controller, snapTo )
	local map = nil
	local firstMapIndex = 1
	local profile_playlistSuperCategoryID = 0
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
		if snapTo == true then
			profile_playlistSuperCategoryID = CoD.Zombie.PlayListCurrentSuperCategoryIndex
		else
			local profile_playlist = Engine.ProfileInt( controller, "playlist_" .. CoD.PlaylistCategoryFilter )
			profile_playlistSuperCategoryID = Engine.GetPlaylistSuperCategoryID( profile_playlist )
		end
		firstMapIndex = CoD.SelectMapZombie.GetMapIndexFromPlaylistSuperCategoryID( self, profile_playlistSuperCategoryID )
	else
		map = Engine.ProfileValueAsString( controller, CoD.profileKey_map )
		if map == nil or map == "" then
			map = CoD.Zombie.MAP_ZM_TRANSIT
		end
		firstMapIndex = CoD.SelectMapZombie.GetMapIndexFromMapLoadName( self, map )
	end
	return firstMapIndex
end

CoD.SelectMapZombie.GoToFirstMap = function ( globe, controller, snapTo )
	local firstMapIndex = CoD.SelectMapZombie.GetFirstMapIndex( globe.currentMenu, controller, snapTo )
	globe.currentMenu.currentMapIndex = firstMapIndex
	globe.isGoToFirstMap = true
	CoD.SelectMapZombie.GoToFirstMap_Globe( globe.currentMenu, firstMapIndex, snapTo )
	CoD.GameMoonZombie.MapMoveStart( controller )
end

CoD.SelectMapZombie.GoToFirstMap_Globe = function ( self, firstMapIndex, snapTo )
	local nextLongitude = self.mapInfos[firstMapIndex].originalLongitude
	local nextLatitude = self.mapInfos[firstMapIndex].originalLatitude
	local deltaLongitudePart1 = 0
	local deltaLongitudePart2 = 0
	local deltaLongitude = 0
	local time = 0
	local ratio = 0
	local hasInternState = false
	local internLongitude = 0
	local xrot, yrot, zrot, avalue = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
	if xrot ~= nil and yrot ~= nil and zrot ~= nil and avalue ~= nil then
		CoD.GameGlobeZombie.XRotCurrent = xrot
		CoD.GameGlobeZombie.YRotCurrent = CoD.SelectMapZombie.GetLongitudeWithinRange( self, yrot )
		CoD.GameGlobeZombie.ZRotCurrent = zrot
	end
	CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = nil
	CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude = CoD.GameGlobeZombie.XRotCurrent
	deltaLongitude = nextLongitude - CoD.GameGlobeZombie.YRotCurrent
	if deltaLongitude < 0 then
		deltaLongitudePart1 = math.abs( CoD.GameGlobeZombie.ShaderVector2YMax - CoD.GameGlobeZombie.YRotCurrent )
		deltaLongitude = deltaLongitudePart1 + math.abs( nextLongitude - CoD.GameGlobeZombie.ShaderVector2YMin )
		CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = true
		hasInternState = true
	end
	time = CoD.SelectMapZombie.GetRotationTime( self, math.abs( deltaLongitude ) )
	if snapTo then
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map", 1 )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, nextLatitude, nextLongitude, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	elseif hasInternState then
		ratio = deltaLongitudePart1 / deltaLongitude
		internLongitude = CoD.GameGlobeZombie.ShaderVector2YMax
		CoD.GameGlobeZombie.gameGlobe.nextMapInternTimeLeft = time * (1 - ratio)
		CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude = CoD.GameGlobeZombie.XRotCurrent + (nextLatitude - CoD.GameGlobeZombie.XRotCurrent) * ratio
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map_intern", time * ratio )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude, internLongitude, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		CoD.GameGlobeZombie.gameGlobe:registerAnimationState( "next_map", {
			alpha = 1,
			zoom = 0,
			shaderVector2 = {
				nextLatitude,
				nextLongitude,
				CoD.GameGlobeZombie.ShaderVector2Z,
				0
			}
		} )
	else
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map", time )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, nextLatitude, nextLongitude, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	end
end

CoD.SelectMapZombie.GoToFirstMap_MapInfo = function ( self, firstMapIndex )
	local nextLongitude = self.mapInfos[firstMapIndex].originalLongitude
	local deltaLongitude = CoD.SelectMapZombie.MapInfoRotatingLongitudeOrigin - nextLongitude
	local mapInfo, x, y, alphaValue, sizeScale = nil
	CoD.SelectMapZombie.UpdateMapInfoPlacingLatitude( self, firstMapIndex )
	for i = 1, self.mapCount, 1 do
		mapInfo = self.mapInfos[i]
		mapInfo.longitude = CoD.SelectMapZombie.GetLongitudeWithinRange( self, mapInfo.longitude + deltaLongitude )
		x, y, alphaValue, sizeScale = CoD.SelectMapZombie.SphereToCartesian( self, CoD.GameGlobeZombie.CenterRadius, mapInfo.longitude, mapInfo.mapInfoPlaceLatitude )
		if CoD.useMouse then
			if sizeScale == 0 then
				mapInfo.mouseButton:setHandleMouse( false )
			else
				mapInfo.mouseButton:setHandleMouse( true )
			end
		end
		local leftValue = x - 0.5 * CoD.SelectMapZombie.MapInfoWidth
		local rightValue = x + 0.5 * CoD.SelectMapZombie.MapInfoWidth
		local topValue = -y - 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet
		local bottomValue = -y + 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet
		mapInfo:setLeftRight( false, false, leftValue, rightValue )
		mapInfo:setTopBottom( false, false, topValue, bottomValue )
		mapInfo:setAlpha( 0 )
		mapInfo.iconContainer:setScale( 0 )
		if mapInfo.newIcon then
			if alphaValue == 0 or sizeScale == 0 then
				mapInfo.hidden = true
			else
				mapInfo.hidden = false
			end
			CoD.SelectMapZombie.UpdateSideNewIcon( mapInfo, mapInfo.mapInfoPlaceLatitude, 0 )
		end
		if i == firstMapIndex then
			mapInfo:beginAnimation( "gain_focus", 100 )
			mapInfo.iconContainer:beginAnimation( "gain_focus", 100 )
			mapInfo.iconContainer:setScale( 3 )
			mapInfo:setAlpha( alphaValue )
			if mapInfo.iconContainer.navCardInstalled == true then
				Engine.PlaySound( "zmb_ui_sq_complete" )
			end
			if mapInfo.newIcon then
				CoD.SelectMapZombie.MoveNewIconToNext( mapInfo, time, true )
			end
		end
		mapInfo:beginAnimation( "first_show", 100 )
		mapInfo.iconContainer:beginAnimation( "first_show", 100 )
		mapInfo.iconContainer:setScale( sizeScale )
		mapInfo:setAlpha( alphaValue )
	end
end

CoD.SelectMapZombie.NextMapInternFinish = function ( self, event )
	if CoD.GameGlobeZombie.gameGlobe.YRotIncreasing ~= nil then
		if CoD.GameGlobeZombie.gameGlobe.YRotIncreasing == true then
			CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
			CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
			CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude, CoD.GameGlobeZombie.ShaderVector2YMin, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		else
			CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
			CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
			CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude, CoD.GameGlobeZombie.ShaderVector2YMax, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		end
	end
	CoD.GameGlobeZombie.gameGlobe:animateToState( "next_map", CoD.GameGlobeZombie.gameGlobe.nextMapInternTimeLeft )
end

CoD.SelectMapZombie.GoToMap = function ( self, currentMapIndex, nextMapIndex, isYRotIncreasing )
	Engine.PlaySound( "zmb_ui_globe_spin_start" )
	CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = true
	CoD.SelectMapZombie.GoToMap_Globe( self, currentMapIndex, nextMapIndex, isYRotIncreasing )
	CoD.SelectMapZombie.GoToMap_MapInfo( self, currentMapIndex, nextMapIndex, isYRotIncreasing )
end

CoD.SelectMapZombie.GetRotationTime = function ( self, deltaLongitude )
	local time = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeMedium
	if deltaLongitude < math.pi / 3 then
		time = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeShort
	elseif deltaLongitude < math.pi then
		time = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeMedium
	elseif deltaLongitude < math.pi * 1.5 then
		time = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeLong
	else
		time = CoD.SelectMapZombie.GlobeMapSelectionRotationTimeLongest
	end
	return time
end

CoD.SelectMapZombie.GoToMap_Globe = function ( self, currentMapIndex, nextMapIndex, isYRotIncreasing )
	local nextLongitude = self.mapInfos[nextMapIndex].originalLongitude
	local nextLatitude = self.mapInfos[nextMapIndex].originalLatitude
	local deltaLongitudePart1 = 0
	local deltaLongitudePart2 = 0
	local deltaLongitude = 0
	local time = 0
	local ratio = 0
	local hasInternState = false
	local isInternStateMax = false
	local internLongitude = 0
	local xrot, yrot, zrot, avalue = CoD.GameGlobeZombie.gameGlobe:getShaderVector2()
	if xrot ~= nil and yrot ~= nil and zrot ~= nil and avalue ~= nil then
		CoD.GameGlobeZombie.XRotCurrent = xrot
		CoD.GameGlobeZombie.YRotCurrent = yrot
		CoD.GameGlobeZombie.ZRotCurrent = zrot
	end
	CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = nil
	CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude = CoD.GameGlobeZombie.XRotCurrent
	if currentMapIndex == 0 then
		deltaLongitude = CoD.GameGlobeZombie.YRotCurrent - nextLongitude
	elseif currentMapIndex == 1 and nextMapIndex == self.mapCount and isYRotIncreasing == true then
		deltaLongitudePart1 = math.abs( CoD.GameGlobeZombie.YRotCurrent - CoD.GameGlobeZombie.ShaderVector2YMin )
		deltaLongitude = deltaLongitudePart1 + math.abs( CoD.GameGlobeZombie.ShaderVector2YMax - nextLongitude )
		CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = false
		hasInternState = true
	elseif currentMapIndex == self.mapCount and nextMapIndex == 1 and isYRotIncreasing == false then
		deltaLongitudePart1 = math.abs( CoD.GameGlobeZombie.ShaderVector2YMax - CoD.GameGlobeZombie.YRotCurrent )
		deltaLongitude = deltaLongitudePart1 + math.abs( nextLongitude - CoD.GameGlobeZombie.ShaderVector2YMin )
		CoD.GameGlobeZombie.gameGlobe.YRotIncreasing = true
		hasInternState = true
		isInternStateMax = true
	else
		deltaLongitude = math.abs( nextLongitude - CoD.GameGlobeZombie.YRotCurrent )
	end
	time = CoD.SelectMapZombie.GetRotationTime( self, math.abs( deltaLongitude ) )
	if hasInternState then
		ratio = deltaLongitudePart1 / deltaLongitude
		if isInternStateMax then
			internLongitude = CoD.GameGlobeZombie.ShaderVector2YMax
		else
			internLongitude = CoD.GameGlobeZombie.ShaderVector2YMin
		end
		CoD.GameGlobeZombie.gameGlobe.nextMapInternTimeLeft = time * (1 - ratio)
		CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude = CoD.GameGlobeZombie.XRotCurrent + (nextLatitude - CoD.GameGlobeZombie.XRotCurrent) * ratio
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map_intern", time * ratio )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, CoD.GameGlobeZombie.gameGlobe.nextMapInternLatitude, internLongitude, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
		CoD.GameGlobeZombie.gameGlobe:registerAnimationState( "next_map", {
			alpha = 1,
			zoom = 0,
			shaderVector2 = {
				nextLatitude,
				nextLongitude,
				CoD.GameGlobeZombie.ShaderVector2Z,
				0
			}
		} )
	else
		CoD.GameGlobeZombie.gameGlobe:beginAnimation( "next_map", time )
		CoD.GameGlobeZombie.gameGlobe:setAlpha( 1 )
		CoD.GameGlobeZombie.gameGlobe:setZoom( 0 )
		CoD.GameGlobeZombie.gameGlobe:setShaderVector( 2, nextLatitude, nextLongitude, CoD.GameGlobeZombie.ShaderVector2Z, 0 )
	end
end

CoD.SelectMapZombie.GoToMap_MapInfo = function ( self, currentMapIndex, nextMapIndex, isYRotIncreasing )
	local nextLongitude = self.mapInfos[nextMapIndex].originalLongitude
	local nextLatitude = self.mapInfos[nextMapIndex].originalLatitude
	local time = 0
	local deltaLongitudePart1 = 0
	local deltaLongitudePart2 = 0
	local deltaLongitude = 0
	local deltaLatitude = 0
	local currLongitude = 0
	local currLatitude = 0
	local mapInfo, x, y, alphaValue, sizeScale, leftValue, rightValue, topValue, bottomValue = nil
	if currentMapIndex == 0 then
		deltaLongitude = CoD.SelectMapZombie.MapInfoRotatingLongitudeOrigin - nextLongitude
	else
		currLongitude = self.mapInfos[currentMapIndex].originalLongitude
		if currentMapIndex == 1 and nextMapIndex == self.mapCount and isYRotIncreasing == true then
			deltaLongitude = currLongitude - CoD.GameGlobeZombie.ShaderVector2YMin + CoD.GameGlobeZombie.ShaderVector2YMax - nextLongitude
		elseif currentMapIndex == self.mapCount and nextMapIndex == 1 and isYRotIncreasing == false then
			deltaLongitude = -(CoD.GameGlobeZombie.ShaderVector2YMax - currLongitude + nextLongitude - CoD.GameGlobeZombie.ShaderVector2YMin)
		else
			deltaLongitude = currLongitude - nextLongitude
		end
	end
	deltaLatitude = self.mapInfos[currentMapIndex].originalLatitude - nextLatitude
	time = CoD.SelectMapZombie.GetRotationTime( self, math.abs( deltaLongitude ) )
	for i = 1, self.mapCount, 1 do
		mapInfo = self.mapInfos[i]
		mapInfo.isYRotIncreasing = isYRotIncreasing
		mapInfo.currLongitude = mapInfo.longitude
		mapInfo.deltaLongitude = deltaLongitude
		mapInfo.longitude = CoD.SelectMapZombie.GetLongitudeWithinRange( self, mapInfo.currLongitude + mapInfo.deltaLongitude )
		mapInfo.currLatitude = mapInfo.latitude
		mapInfo.deltaLatitude = deltaLatitude
		mapInfo.latitude = CoD.SelectMapZombie.GetLatitudeWithinRange( self, mapInfo.currLatitude + mapInfo.deltaLatitude )
		mapInfo.deltaToEnd = math.abs( mapInfo.deltaLongitude )
		mapInfo.rotateTotalTime = time
		mapInfo.rotateAccumulatedTime = 0
		CoD.SelectMapZombie.MapInfoMoveToNextStart( self, mapInfo, isYRotIncreasing )
	end
end

CoD.SelectMapZombie.MapInfoMoveToNextStart = function ( self, mapInfo, isYRotIncreasing )
	local time = 0
	mapInfo.startPathNodeIndex = CoD.SelectMapZombie.GetMapInfoPathNodeIndex( self, mapInfo.currLongitude, mapInfo.isYRotIncreasing, true )
	mapInfo.endPathNodeIndex = CoD.SelectMapZombie.GetMapInfoPathNodeIndex( self, mapInfo.longitude, mapInfo.isYRotIncreasing )
	local needPathNode = true
	if math.abs( mapInfo.deltaLongitude ) < CoD.SelectMapZombie.MapInfoRotatingPathDeltaLongitude or mapInfo.startPathNodeIndex == 0 or mapInfo.endPathNodeIndex == 0 then
		needPathNode = false
	end
	if needPathNode == true then
		mapInfo.currPathNodeIndex = mapInfo.startPathNodeIndex
		time = mapInfo.rotateTotalTime * (CoD.SelectMapZombie.MapInfoRotatingPathNodes[mapInfo.currPathNodeIndex].longitude - mapInfo.currLongitude) / mapInfo.deltaLongitude
		mapInfo.deltaToEnd = mapInfo.deltaToEnd - math.abs( CoD.SelectMapZombie.MapInfoRotatingPathNodes[mapInfo.currPathNodeIndex].longitude - mapInfo.currLongitude )
		CoD.SelectMapZombie.MapInfoMoveToNext( self, mapInfo, time )
	else
		mapInfo.currPathNodeIndex = nil
		CoD.SelectMapZombie.MapInfoMoveToNext( self, mapInfo, mapInfo.rotateTotalTime )
	end
end

CoD.SelectMapZombie.MapInfoMoveToNext = function ( self, mapInfo, time )
	local longitude = 0
	local latitude = 0
	if mapInfo.currPathNodeIndex ~= nil then
		mapInfo.rotateAccumulatedTime = mapInfo.rotateAccumulatedTime + time
		longitude = CoD.SelectMapZombie.MapInfoRotatingPathNodes[mapInfo.currPathNodeIndex].longitude
		latitude = mapInfo.currLatitude + mapInfo.deltaLatitude * mapInfo.rotateAccumulatedTime / mapInfo.rotateTotalTime
	else
		longitude = mapInfo.longitude
		latitude = mapInfo.latitude
	end
	local x, y, alphaValue, sizeScale = CoD.SelectMapZombie.SphereToCartesian( self, CoD.GameGlobeZombie.CenterRadius, longitude, latitude )
	if CoD.useMouse then
		if sizeScale == 0 then
			mapInfo.mouseButton:setHandleMouse( false )
		else
			mapInfo.mouseButton:setHandleMouse( true )
		end
	end
	local leftValue = x - 0.5 * CoD.SelectMapZombie.MapInfoWidth
	local rightValue = x + 0.5 * CoD.SelectMapZombie.MapInfoWidth
	local topValue = -y - 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet
	local bottomValue = -y + 0.5 * CoD.SelectMapZombie.MapInfoHeight + CoD.GameGlobeZombie.PlaceYOffSet
	mapInfo:beginAnimation( "move_to_next", time )
	mapInfo:setLeftRight( false, false, leftValue, rightValue )
	mapInfo:setTopBottom( false, false, topValue, bottomValue )
	mapInfo:setAlpha( alphaValue )
	mapInfo.iconContainer:beginAnimation( "move_to_next", time )
	mapInfo.iconContainer:setScale( sizeScale )
	if mapInfo.newIcon then
		CoD.SelectMapZombie.MoveNewIconToNext( mapInfo, time )
		if alphaValue == 0 then
			mapInfo.newIcon:setAlpha( 0 )
			mapInfo.hidden = true
		else
			mapInfo.newIcon:setAlpha( alphaValue )
			mapInfo.hidden = false
		end
		CoD.SelectMapZombie.UpdateSideNewIcon( mapInfo, latitude, time )
	end
end

CoD.SelectMapZombie.UpdateSideNewIcon = function ( mapInfo, latitude, time )
	local x, y, alphaValue, sizeScale = nil
	local leftValue = 0
	local rightValue = 0
	local topValue = 0
	local bottomValue = 0
	local longitude = 0
	local radius = CoD.GameGlobeZombie.CenterRadius + CoD.SelectMapZombie.SideNewIconsRadiusAddOn
	local f22_local0 = mapInfo:getParent()
	local topParent = f22_local0:getParent()
	local currentMapIndex = topParent.currentMapIndex
	local leftOffset = 0
	x, y, alphaValue, sizeScale = CoD.SelectMapZombie.SphereToCartesian( self, radius, longitude, latitude * CoD.SelectMapZombie.SideNewIconsLatitudeScale )
	leftValue = x - 0.5 * CoD.SelectMapZombie.MapInfoNewIconWidth + leftOffset
	rightValue = x + 0.5 * CoD.SelectMapZombie.MapInfoNewIconWidth + leftOffset
	topValue = -y - 0.5 * CoD.SelectMapZombie.MapInfoNewIconHeight + CoD.GameGlobeZombie.PlaceYOffSet
	bottomValue = -y + 0.5 * CoD.SelectMapZombie.MapInfoNewIconHeight + CoD.GameGlobeZombie.PlaceYOffSet
	mapInfo.leftSideNewIcon:beginAnimation( "move", time )
	mapInfo.leftSideNewIcon:setLeftRight( false, false, leftValue, rightValue )
	mapInfo.leftSideNewIcon:setTopBottom( false, false, topValue, bottomValue )
	if currentMapIndex < mapInfo.index and mapInfo.hidden then
		mapInfo.leftSideNewIcon:setScale( 1 )
		mapInfo.leftSideNewIcon:setAlpha( 1 )
	else
		mapInfo.leftSideNewIcon:setScale( 0.5 )
		mapInfo.leftSideNewIcon:setAlpha( 0 )
	end
	longitude = CoD.GameGlobeZombie.ShaderVector2YMax
	leftOffset = leftOffset + CoD.SelectMapZombie.SideNewIconsLeftOffSet
	x, y, alphaValue, sizeScale = CoD.SelectMapZombie.SphereToCartesian( self, radius, longitude, latitude * CoD.SelectMapZombie.SideNewIconsLatitudeScale )
	leftValue = x - 0.5 * CoD.SelectMapZombie.MapInfoNewIconWidth + leftOffset
	rightValue = x + 0.5 * CoD.SelectMapZombie.MapInfoNewIconWidth + leftOffset
	topValue = -y - 0.5 * CoD.SelectMapZombie.MapInfoNewIconHeight + CoD.GameGlobeZombie.PlaceYOffSet
	bottomValue = -y + 0.5 * CoD.SelectMapZombie.MapInfoNewIconHeight + CoD.GameGlobeZombie.PlaceYOffSet
	mapInfo.rightSideNewIcon:beginAnimation( "move", time )
	mapInfo.rightSideNewIcon:setLeftRight( false, false, leftValue, rightValue )
	mapInfo.rightSideNewIcon:setTopBottom( false, false, topValue, bottomValue )
	if mapInfo.index < currentMapIndex and mapInfo.hidden then
		mapInfo.rightSideNewIcon:setScale( 1 )
		mapInfo.rightSideNewIcon:setAlpha( 1 )
	else
		mapInfo.rightSideNewIcon:setScale( 0.5 )
		mapInfo.rightSideNewIcon:setAlpha( 0 )
	end
end

CoD.SelectMapZombie.GetMapInfoPathNodeIndex = function ( self, longitude, isYRotIncreasing, isStart )
	for i = 1, CoD.SelectMapZombie.MapInfoRotatingPathNodesCount, 1 do
		if longitude <= CoD.SelectMapZombie.MapInfoRotatingPathNodes[i].longitude then
			if isYRotIncreasing == true then
				if isStart == true then
					return i
				end
				return i - 1
			elseif isStart == true then
				return i - 1
			end
			return i
		end
	end
end

CoD.SelectMapZombie.MapInfoMoveToNextFinish = function ( mapInfo, event )
	if event.interrupted ~= true then
		local time = 0
		local currLongitude = 0
		local nextLongitude = 0
		local f24_local0 = mapInfo:getParent()
		local topParent = f24_local0:getParent()
		if mapInfo.currPathNodeIndex == nil then
			if mapInfo == CoD.GameGlobeZombie.gameGlobe.currentMenu.mapInfos[CoD.GameGlobeZombie.gameGlobe.currentMenu.currentMapIndex] then
				mapInfo:beginAnimation( "gain_focus", 100 )
				mapInfo.iconContainer:beginAnimation( "gain_focus", 100 )
				mapInfo.iconContainer:setScale( 3 )
				if mapInfo.iconContainer.navCardInstalled == true then
					Engine.PlaySound( "zmb_ui_sq_complete" )
				end
				if mapInfo.newIcon then
					CoD.SelectMapZombie.MoveNewIconToNext( mapInfo, 100, true )
				end
			end
		elseif mapInfo.deltaToEnd < math.pi * 2 and (mapInfo.currPathNodeIndex == mapInfo.endPathNodeIndex or mapInfo.currPathNodeIndex == CoD.SelectMapZombie.MapInfoRotatingPathNodesCount and mapInfo.endPathNodeIndex == 1) then
			if mapInfo.currPathNodeIndex == CoD.SelectMapZombie.MapInfoRotatingPathNodesCount and mapInfo.endPathNodeIndex == 1 then
				currLongitude = CoD.SelectMapZombie.MapInfoRotatingPathNodes[1].longitude
			else
				currLongitude = CoD.SelectMapZombie.MapInfoRotatingPathNodes[mapInfo.currPathNodeIndex].longitude
			end
			time = CoD.SelectMapZombie.GetRotationTime( self, math.abs( mapInfo.deltaLongitude ) ) * (mapInfo.longitude - currLongitude) / mapInfo.deltaLongitude
			mapInfo.currPathNodeIndex = nil
			CoD.SelectMapZombie.MapInfoMoveToNext( self, mapInfo, time )
		else
			currLongitude = CoD.SelectMapZombie.MapInfoRotatingPathNodes[mapInfo.currPathNodeIndex].longitude
			if mapInfo.isYRotIncreasing == true then
				mapInfo.currPathNodeIndex = mapInfo.currPathNodeIndex + 1
				if mapInfo.currPathNodeIndex > CoD.SelectMapZombie.MapInfoRotatingPathNodesCount then
					mapInfo.currPathNodeIndex = 2
					currLongitude = CoD.SelectMapZombie.MapInfoRotatingPathNodes[1].longitude
				end
			else
				mapInfo.currPathNodeIndex = mapInfo.currPathNodeIndex - 1
				if mapInfo.currPathNodeIndex < 1 then
					mapInfo.currPathNodeIndex = CoD.SelectMapZombie.MapInfoRotatingPathNodesCount - 1
					currLongitude = CoD.SelectMapZombie.MapInfoRotatingPathNodes[CoD.SelectMapZombie.MapInfoRotatingPathNodesCount].longitude
				end
			end
			nextLongitude = CoD.SelectMapZombie.MapInfoRotatingPathNodes[mapInfo.currPathNodeIndex].longitude
			time = CoD.SelectMapZombie.GetRotationTime( self, math.abs( mapInfo.deltaLongitude ) ) * (nextLongitude - currLongitude) / mapInfo.deltaLongitude
			mapInfo.deltaToEnd = mapInfo.deltaToEnd - math.abs( nextLongitude - currLongitude )
			CoD.SelectMapZombie.MapInfoMoveToNext( self, mapInfo, time )
		end
	end
end

CoD.SelectMapZombie.UpdateMapInfoPlacingLatitude = function ( self, nextMapIndex )
	local mapInfoNext = self.mapInfos[nextMapIndex]
	local mapInfoCurr = nil
	for i = 1, self.mapCount, 1 do
		mapInfoCurr = self.mapInfos[i]
		mapInfoCurr.mapInfoPlaceLatitude = mapInfoCurr.originalLatitude - mapInfoNext.originalLatitude
		mapInfoCurr.latitude = mapInfoCurr.mapInfoPlaceLatitude
	end
end

CoD.SelectMapZombie.GamepadButton = function ( self, event )
	local maxRotationInputCount = 3
	if self.m_inputDisabled or self.m_ownerController ~= event.controller then
		return 
	elseif CoD.GameGlobeZombie.gameGlobe.isGoToFirstMap == true then
		return 
	elseif maxRotationInputCount <= #CoD.SelectMapZombie.MapRotationInput then
		return 
	elseif event.down == true then
		local preMapIndex = self.currentMapIndex
		local mapInfoCurrent = self.mapInfos[self.currentMapIndex]
		local mapRotationInputCount = #CoD.SelectMapZombie.MapRotationInput
		local isLeftRightInput = false
		local rotationIncreasing = nil
		if event.button == "left" then
			if CoD.SelectMapZombie.DisableCycleRotation == false then
				self.currentMapIndex = self.currentMapIndex % self.mapCount + 1
			else
				self.currentMapIndex = self.currentMapIndex + 1
				if self.mapCount < self.currentMapIndex then
					self.currentMapIndex = self.mapCount
				end
			end
			isLeftRightInput = true
			rotationIncreasing = false
		elseif event.button == "right" then
			if CoD.SelectMapZombie.DisableCycleRotation == false then
				self.currentMapIndex = self.currentMapIndex - 1
				if self.currentMapIndex == 0 then
					self.currentMapIndex = self.mapCount
				end
			else
				self.currentMapIndex = self.currentMapIndex - 1
				if self.currentMapIndex == 0 then
					self.currentMapIndex = 1
				end
			end
			isLeftRightInput = true
			rotationIncreasing = true
		elseif event.button == "primary" and mapRotationInputCount == 0 then
			CoD.GameMoonZombie.Reset()
			CoD.GameGlobeZombie.MoveUp( event.controller )
			Engine.SetDvar( "ui_mapname", mapInfoCurrent.loadName )
			Engine.SetDvar( "ui_zm_gamemodegroup", CoD.Zombie.GetDefaultGameTypeGroupForMap() )
			Engine.SetDvar( "ui_gametype", CoD.Zombie.GetDefaultGameTypeForMap() )
			Engine.Exec( event.controller, "xupdatepartystate" )
			if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
				CoD.Zombie.PlayListCurrentSuperCategoryIndex = mapInfoCurrent.superCategoryIndex
			else
				Engine.SetProfileVar( controller, CoD.profileKey_map, mapInfoCurrent.loadName )
			end
			self:openMenu( "SelectStartLocZM", event.controller )
			self:close()
		end
		if isLeftRightInput and preMapIndex ~= self.currentMapIndex then
			CoD.SelectMapZombie.MapRotationInput[mapRotationInputCount + 1] = {
				currentMapIndex = preMapIndex,
				nextMapIndex = self.currentMapIndex,
				yRotInc = rotationIncreasing
			}
			if mapRotationInputCount == 0 then
				CoD.SelectMapZombie.GoToMap( self, preMapIndex, self.currentMapIndex, rotationIncreasing )
			end
		end
	end
	return self:dispatchEventToChildren( event )
end

CoD.SelectMapZombie.MoveNewIconToNext = function ( self, duration, isZoom )
	local iconWidth = CoD.SelectMapZombie.MapInfoNewIconWidth
	local iconHeight = CoD.SelectMapZombie.MapInfoNewIconHeight
	local iconWidthOffset, iconHeightOffset = nil
	local offsetDirection = "top"
	if CoD.SelectMapZombie.NewIconOffsetDirectionTable[self.newIconPlacement] then
		offsetDirection = self.newIconPlacement
	end
	if isZoom == true then
		iconWidthOffset = CoD.SelectMapZombie.NewIconZoomOffsetDirectionTable[offsetDirection].width
		iconHeightOffset = CoD.SelectMapZombie.NewIconZoomOffsetDirectionTable[offsetDirection].height
	else
		iconWidthOffset = CoD.SelectMapZombie.NewIconOffsetDirectionTable[offsetDirection].width
		iconHeightOffset = CoD.SelectMapZombie.NewIconOffsetDirectionTable[offsetDirection].height
	end
	self.newIcon:beginAnimation( "move_new_icon_to_next", duration )
	self.newIcon:setLeftRight( false, false, iconWidthOffset - iconWidth / 2, iconWidthOffset + iconWidth / 2 )
	self.newIcon:setTopBottom( false, false, iconHeightOffset - iconHeight / 2, iconHeightOffset + iconHeight / 2 )
end

CoD.SelectMapZombie.MouseSelect = function ( self, event )
	if #CoD.SelectMapZombie.MapRotationInput > 0 then
		return 
	end
	local mapInfo = event.button.mapInfo
	local currentIndex = self.currentMapIndex
	local nextIndex = mapInfo.index
	local numMaps = table.getn( self.mapInfos )
	if currentIndex == nextIndex then
		self:processEvent( {
			name = "gamepad_button",
			controller = event.controller,
			button = "primary",
			down = true
		} )
	else
		local forwardDist, backwardsDist = nil
		if currentIndex < nextIndex then
			forwardDist = nextIndex - currentIndex
			backwardsDist = numMaps - nextIndex + currentIndex
		else
			forwardDist = nextIndex + numMaps - currentIndex
			backwardsDist = currentIndex - nextIndex
		end
		if forwardDist < backwardsDist then
			for i = 1, forwardDist, 1 do
				local f28_local2 = i
				self:processEvent( {
					name = "gamepad_button",
					controller = event.controller,
					button = "left",
					down = true
				} )
			end
		else
			for i = 1, backwardsDist, 1 do
				local f28_local2 = i
				self:processEvent( {
					name = "gamepad_button",
					controller = event.controller,
					button = "right",
					down = true
				} )
			end
		end
	end
end

CoD.SelectMapZombie.LeftMouseDown = function ( self, event )
	self.m_curX = event.x
end

CoD.SelectMapZombie.LeftMouseUp = function ( self, event )
	self.m_curX = nil
end

CoD.SelectMapZombie.MouseDrag = function ( self, event )
	if self.m_curX == nil then
		return 
	end
	local dragDistance = 80
	if dragDistance < math.abs( self.m_curX - event.x ) then
		if self.m_curX < event.x then
			self:processEvent( {
				name = "gamepad_button",
				controller = event.controller,
				button = "left",
				down = true
			} )
		else
			self:processEvent( {
				name = "gamepad_button",
				controller = event.controller,
				button = "right",
				down = true
			} )
		end
		self.m_curX = event.x
	end
end

CoD.SelectMapZombie.LeavePlayerMatchLobby = function ( self, event )
	CoD.SelectMapZombie.HideMapInfo( self )
	CoD.GameMoonZombie.Reset()
	CoD.GameGlobeZombie.MoveToCorner( event.controller )
	CoD.resetGameModes()
	if CoD.isPartyHost() then
		CoD.SwitchToMainLobby( event.controller )
	else
		Engine.PartyHostClearUIState()
		CoD.StartMainLobby( event.controller )
	end
	self:setPreviousMenu( "MainLobby" )
end

CoD.SelectMapZombie.LeavePrivateGameLobby = function ( self, event )
	CoD.SelectMapZombie.HideMapInfo( self )
	CoD.GameMoonZombie.Reset()
	CoD.GameGlobeZombie.MoveToCorner( event.controller )
	Engine.SetDvar( "invite_visible", 1 )
	if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
		Engine.ExecNow( event.controller, "xstopparty" )
		Engine.ExecNow( event.controller, "xstopprivateparty" )
		CoD.resetGameModes()
	elseif Engine.IsSignedInToDemonware( event.controller ) and Engine.HasMPPrivileges( event.controller ) then
		Engine.ExecNow( event.controller, "xstoppartykeeptogether" )
		CoD.StartMainLobby( event.controller )
	else
		Engine.ExecNow( event.controller, "xstopprivateparty" )
		CoD.resetGameModes()
	end
	Engine.SessionModeSetPrivate( false )
	self:processEvent( {
		name = "lose_host"
	} )
	Engine.Exec( event.controller, "party_updateActiveMenu" )
end

CoD.SelectMapZombie.BackButton = function ( self, event )
	if CoD.GameGlobeZombie.gameGlobe.isAnimating then
		return true
	elseif self.m_ownerController ~= event.controller then
		return true
	elseif self.newIconLeft then
		self.newIconLeft:close()
	end
	if self.newIconRight then
		self.newIconRight:close()
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == false and Engine.IsPrimaryLocalClient( event.controller ) == 0 then
		self:openPopup( "NoLeave", controller, leaveHandlerTextTable )
		return true
	elseif not self.m_inputDisabled then
		self.skipOpenMenuEvent = true
		if Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) == true then
			CoD.SelectMapZombie.LeavePlayerMatchLobby( self, event )
		else
			CoD.Lobby.ConfirmLeaveGameLobby( self, {
				controller = event.controller,
				leaveLobbyHandler = CoD.SelectMapZombie.LeavePrivateGameLobby
			} )
		end
	end
end

CoD.SelectMapZombie.HideMapInfo = function ( self )
	for i = 1, self.mapCount, 1 do
		self.mapInfos[i]:beginAnimation( "hide", 50 )
		self.mapInfos[i]:setAlpha( 0 )
	end
end

CoD.SelectMapZombie.MapRotatingFinish = function ( globe, event )
	if event.interrupted ~= true then
		table.remove( CoD.SelectMapZombie.MapRotationInput, 1 )
		local mapRotationInputCount = #CoD.SelectMapZombie.MapRotationInput
		local mapRotationInput = CoD.SelectMapZombie.MapRotationInput[1]
		if mapRotationInputCount == 0 then
			Engine.PlaySound( "zmb_ui_globe_spin_stop" )
			local mapInfo = globe.currentMenu.mapInfos[globe.currentMenu.currentMapIndex]
			if globe.isGoToFirstMap == true then
				CoD.SelectMapZombie.GoToFirstMap_MapInfo( globe.currentMenu, globe.currentMenu.currentMapIndex )
				globe.isGoToFirstMap = nil
			end
			if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil and CoD.GameGlobeZombie.gameGlobe.currentMenu.occludedBy == nil then
				CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = false
			end
		else
			CoD.SelectMapZombie.GoToMap( globe.currentMenu, mapRotationInput.currentMapIndex, mapRotationInput.nextMapIndex, mapRotationInput.yRotInc )
		end
	else
		if CoD.GameGlobeZombie.gameGlobe.currentMenu ~= nil and CoD.GameGlobeZombie.gameGlobe.currentMenu.occludedBy == nil then
			CoD.GameGlobeZombie.gameGlobe.currentMenu.m_inputDisabled = false
		end
		CoD.SelectMapZombie.MapRotationInput = {}
	end
end

CoD.SelectMapZombie.SphereToCartesian = function ( self, Radius, longitude, latitude )
	local x = Radius * math.cos( latitude ) * math.cos( longitude + math.pi )
	local y = Radius * math.sin( latitude )
	local sizeScale = math.max( math.min( 4 * (Radius - math.abs( x )) / Radius, 1 ), 0 )
	local alpha = 1
	if math.sin( longitude ) > 0 then
		alpha = 0
		sizeScale = 0
	end
	return x, y, alpha, sizeScale
end

CoD.SelectMapZombie.GetLongitudeWithinRange = function ( self, longitude )
	local result = longitude
	while CoD.GameGlobeZombie.ShaderVector2YMax < result do
		result = result - 2 * CoD.GameGlobeZombie.ShaderVector2YMax
	end
	while result < CoD.GameGlobeZombie.ShaderVector2YMin do
		result = result - 2 * CoD.GameGlobeZombie.ShaderVector2YMin
	end
	return result
end

CoD.SelectMapZombie.GetLatitudeWithinRange = function ( self, latitude )
	local result = latitude
	if CoD.GameGlobeZombie.ShaderVector2XMax < result then
		result = 2 * CoD.GameGlobeZombie.ShaderVector2XMax - result
	end
	if result < CoD.GameGlobeZombie.ShaderVector2XMin then
		result = 2 * CoD.GameGlobeZombie.ShaderVector2XMin - result
	end
	return result
end

CoD.SelectMapZombie.PulseBright = function ( self, time )
	self:beginAnimation( "pulse_bright", time )
	self:setAlpha( 0.5 )
end

CoD.SelectMapZombie.PulseLow = function ( self, time )
	self:beginAnimation( "pulse_low", time )
	self:setAlpha( 0.1 )
end

CoD.SelectMapZombie.ColorWhite = function ( self, time )
	self:beginAnimation( "color_white", time )
	self:setRGB( 1, 1, 1 )
end

