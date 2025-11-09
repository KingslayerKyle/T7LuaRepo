require( "ui.T6.CategoryButton" )

CoD.ChangeMap = {}
CoD.ChangeMap.MaxCategories = 2
CoD.ChangeMap.DemoBuildMaps = {
	mp_sector = 1,
	mp_ethiopia = 2,
	mp_stronghold = 3
}
CoD.ChangeMap.DOWNLOAD_IN_PROGRESS = 0
CoD.ChangeMap.DOWNLOAD_IN_QUEUE = 1
CoD.ChangeMap.DOWNLOAD_FINISHED = 2
LUI.createMenu.ChangeMap = function ( controller )
	local changeMapMenu = CoD.Menu.New( "ChangeMap" )
	changeMapMenu:addTitle( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	changeMapMenu:addLargePopupBackground()
	changeMapMenu.m_ownerController = controller
	local background = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -640,
		right = 640,
		topAnchor = false,
		bottomAnchor = false,
		top = -360,
		bottom = 360,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 1
	} )
	background:setPriority( -100 )
	changeMapMenu:addElement( background )
	if CoD.isCampaign == true then
		CoD.ChangeMap.CategoryNames = {
			"missions",
			"dev"
		}
		CoD.ChangeMap.CategoryIndex = {
			CoD.CONTENT_ORIGINAL_MAP_INDEX,
			CoD.CONTENT_DEV_MAP_INDEX
		}
	else
		if Dvar.ui_execdemo:get() then
			CoD.ChangeMap.CategoryNames = {
				"standard"
			}
			CoD.ChangeMap.MaxCategories = 1
		else
			CoD.ChangeMap.CategoryNames = {
				"standard",
				"dlc"
			}
		end
		CoD.ChangeMap.CategoryIndex = {
			CoD.CONTENT_ORIGINAL_MAP_INDEX,
			nil
		}
	end
	CoD.ChangeMap.CategoryIconNames = {
		"playlist_map",
		"playlist_map"
	}
	changeMapMenu:addSelectButton()
	changeMapMenu:addBackButton()
	local buttonOffset = CoD.CoD9Button.Height
	local selectionContainerWidth = (CoD.Menu.Width - buttonOffset * 1) / 3
	local selectionContainerLeft = 0
	changeMapMenu.categoryContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + selectionContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0,
		alpha = 1
	} )
	changeMapMenu.categoryContainer:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	changeMapMenu:addElement( changeMapMenu.categoryContainer )
	changeMapMenu.categoryButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	changeMapMenu.categoryButtonList.id = changeMapMenu.categoryButtonList.id .. ".CategoryButtonList"
	changeMapMenu.categoryContainer:addElement( changeMapMenu.categoryButtonList )
	selectionContainerLeft = selectionContainerLeft + selectionContainerWidth - buttonOffset
	changeMapMenu.mapContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + selectionContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	changeMapMenu:addElement( changeMapMenu.mapContainer )
	changeMapMenu.mapButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	changeMapMenu.mapButtonList.id = changeMapMenu.mapButtonList.id .. ".mapButtonList"
	changeMapMenu.mapContainer:addElement( changeMapMenu.mapButtonList )
	selectionContainerLeft = selectionContainerLeft + selectionContainerWidth
	local infoContainerWidth = selectionContainerWidth + buttonOffset * 2
	changeMapMenu.infoContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -infoContainerWidth - 20,
		right = -20,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	changeMapMenu:addElement( changeMapMenu.infoContainer )
	local iconWidth = infoContainerWidth - 100
	local iconHeight = iconWidth
	changeMapMenu.infoContainer.icon = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -iconWidth / 2,
		right = iconWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = iconHeight,
		alpha = 0
	} )
	changeMapMenu.infoContainer:addElement( changeMapMenu.infoContainer.icon )
	changeMapMenu.infoContainer.iconHeight = iconHeight
	local infoWidth = iconHeight * 2
	local infoHeight = 136
	local infoItemTop = iconHeight + 15
	changeMapMenu.infoContainer.titleElement = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -infoWidth / 2,
		right = infoWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + CoD.textSize.Big,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Left
	} )
	changeMapMenu.infoContainer.titleElement:setTTF( "fonts/Entovo.ttf" )
	changeMapMenu.infoContainer.titleElement:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	changeMapMenu.infoContainer:addElement( changeMapMenu.infoContainer.titleElement )
	infoItemTop = infoItemTop + CoD.textSize.Big + 5
	changeMapMenu.infoContainer.description = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -infoWidth / 2,
		right = infoWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	changeMapMenu.infoContainer.description:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	changeMapMenu.infoContainer:addElement( changeMapMenu.infoContainer.description )
	changeMapMenu.infoContainer.description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	if Engine.IsPlayGoEnabled() then
		infoItemTop = infoItemTop + CoD.textSize.Big + 80
		changeMapMenu.infoContainer.downloadProgress = LUI.UIText.new( {
			leftAnchor = false,
			rightAnchor = false,
			left = -infoWidth / 2,
			right = infoWidth / 2,
			topAnchor = true,
			bottomAnchor = false,
			top = infoItemTop,
			bottom = infoItemTop + CoD.textSize.Default,
			font = CoD.fonts.Default,
			alignment = LUI.Alignment.Left
		} )
		changeMapMenu.infoContainer.downloadProgress:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		changeMapMenu.infoContainer:addElement( changeMapMenu.infoContainer.downloadProgress )
	end
	changeMapMenu:registerEventHandler( "category_button_action", CoD.ChangeMap.CategoryButtonAction )
	changeMapMenu:registerEventHandler( "category_button_gain_focus", CoD.ChangeMap.Button_GainFocus )
	changeMapMenu:registerEventHandler( "category_button_lose_focus", CoD.ChangeMap.Button_LoseFocus )
	changeMapMenu:registerEventHandler( "map_button_action", CoD.ChangeMap.MapSelected )
	changeMapMenu:registerEventHandler( "map_button_gain_focus", CoD.ChangeMap.Button_GainFocus )
	changeMapMenu:registerEventHandler( "map_button_lose_focus", CoD.ChangeMap.Button_LoseFocus )
	changeMapMenu.updateInfo = CoD.ChangeMap.UpdateInfo
	changeMapMenu.addMapButtons = CoD.ChangeMap.AddMapButtons
	CoD.ChangeMap.AddCategoryButtons( changeMapMenu )
	return changeMapMenu
end

CoD.ChangeMap.SetMap = function ( controller, mapName )
	Engine.ExecNow( controller, "lobby_setmap " .. mapName )
	if CoD.isCampaign then
		local gametype = "coop"
		if mapName == "cp_doa_bo3" then
			gametype = "doa"
			Engine.SetDvar( "mantle_enable", "0" )
		elseif mapName == "cp_codfu" then
			gametype = "codfu"
			Engine.SetDvar( "mantle_enable", "0" )
		else
			Engine.SetDvar( "mantle_enable", "1" )
		end
		Engine.SetGametype( gametype )
	end
	Engine.SetProfileVar( controller, CoD.profileKey_map, mapName )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( controller )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.SystemNeedsUpdate( nil, "game_options" )
end

CoD.ChangeMap.MapSelected = function ( self, event )
	Engine.PlaySound( "cac_slide_equip_item" )
	self.mapButtonList:saveState()
	CoD.ChangeMap.SetMap( event.controller, event.itemInfo.loadName )
	if CoD.isCampaign then
		Engine.SetDvar( "cp_queued_level", "" )
	end
	self:goBack( event.controller )
end

CoD.ChangeMap.CategoryBack = function ( self, event )
	self.mapButtonList:saveState()
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( self.m_ownerController )
	CoD.LobbyBase.ResetLeaderActivity( self.m_ownerController )
	CoD.Menu.ButtonPromptBack( self, event )
end

CoD.ChangeMap.MapBack = function ( self, event )
	self.mapButtonList:saveState()
	self:registerEventHandler( "button_prompt_back", CoD.ChangeMap.CategoryBack )
	self.mapButtonList:removeAllChildren()
	CoD.ButtonList.EnableInput( self.categoryButtonList )
	self.categoryContainer:animateToState( "default" )
	if not self.categoryButtonList:restoreState() then
		self.categoryButtonList:processEvent( {
			name = "gain_focus"
		} )
	end
	self.infoContainer.icon:setLeftRight( false, false, -self.infoContainer.iconHeight / 2, self.infoContainer.iconHeight / 2 )
	self.infoContainer.icon:setTopBottom( true, false, 0, self.infoContainer.iconHeight )
end

CoD.ChangeMap.Button_GainFocus = function ( self, event )
	self.infoContainer.owner = event.owner
	self:updateInfo( event.itemInfo )
end

CoD.ChangeMap.Button_LoseFocus = function ( self, event )
	if self.infoContainer.owner == event.owner then
		self:updateInfo( nil )
	end
end

CoD.ChangeMap.UpdateInfo = function ( self, itemInfo )
	local titleText = ""
	local descriptionText = ""
	local iconMaterial = nil
	if itemInfo ~= nil then
		titleText = itemInfo.name
		descriptionText = itemInfo.description
		iconMaterial = itemInfo.iconMaterial
		if itemInfo.loadName ~= nil and Engine.IsPlayGoEnabled() then
			local downloadProgress, downloadStatus = Engine.GetProgressByFileName( itemInfo.loadName )
			if downloadStatus == CoD.ChangeMap.DOWNLOAD_IN_PROGRESS then
				self.infoContainer.downloadProgress:setText( Engine.Localize( itemInfo.name ) .. " : " .. downloadProgress .. "%, " .. Engine.Localize( "MENU_DOWNLOAD_IN_PROGRESS" ) )
			elseif downloadStatus == CoD.ChangeMap.DOWNLOAD_IN_QUEUE then
				self.infoContainer.downloadProgress:setText( Engine.Localize( itemInfo.name ) .. " : " .. downloadProgress .. "%, " .. Engine.Localize( "MENU_DOWNLOAD_IN_QUEUE" ) )
			else
				self.infoContainer.downloadProgress:setText( Engine.Localize( itemInfo.name ) .. " : " .. downloadProgress .. "%, " .. Engine.Localize( "MENU_DOWNLOAD_FINISHED" ) )
			end
		end
	end
	self.infoContainer.titleElement:setText( titleText )
	self.infoContainer.description:setText( descriptionText )
	if iconMaterial ~= nil then
		self.infoContainer.icon:registerAnimationState( "icon", {
			material = iconMaterial,
			alpha = 1
		} )
		self.infoContainer.icon:animateToState( "icon" )
		if itemInfo.iconImage ~= nil then
			self.infoContainer.icon:setImage( RegisterImage( itemInfo.iconImage ) )
		end
	else
		self.infoContainer.icon:animateToState( "default" )
	end
end

CoD.ChangeMap.CreateCategoryItemInfo = function ()
	local mapCategories = {}
	local maxCategories = CoD.ChangeMap.MaxCategories
	for index = 1, maxCategories, 1 do
		local category = {
			name = Engine.Localize( "MPUI_MAP_CATEGORY_" .. CoD.ChangeMap.CategoryNames[index] .. "_CAPS" )
		}
		if CoD.ChangeMap.CategoryNames[index] == "dlc" then
			category.locked = false
		else
			category.locked = false
		end
		category.mapPackTypeIndex = CoD.ChangeMap.CategoryIndex[index]
		category.description = Engine.Localize( "MPUI_MAP_CATEGORY_" .. CoD.ChangeMap.CategoryNames[index] .. "_DESC" )
		category.iconMaterial = RegisterMaterial( CoD.ChangeMap.CategoryIconNames[index] )
		if CoD.ChangeMap.CategoryNames[index] == "dlc" then
			if CoD.ChangeMap.ISAnyDLCMapAvailable( category.mapPackTypeIndex ) then
				table.insert( mapCategories, category )
			end
		end
		table.insert( mapCategories, category )
	end
	return mapCategories
end

CoD.ChangeMap.AddCategoryButtons = function ( self )
	local categories = CoD.ChangeMap.CreateCategoryItemInfo()
	local mapLoadName = Engine.DvarString( nil, "ui_mapname" )
	local categoryMapPackTypeIndex = CoD.GetMapValue( mapLoadName, "dlc_pack", -1 )
	local currentCategoryIndex = 1
	self.categoryButtons = {}
	for index, category in ipairs( categories ) do
		local categoryButtonDefaultAnimationState = {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = CoD.CoD9Button.Height
		}
		local categoryButton = CoD.CategoryButton.new( categoryButtonDefaultAnimationState, "category_button_action", "category_button_gain_focus", "category_button_lose_focus", category )
		categoryButton:setLabel( category.name )
		self.categoryButtonList:addElement( categoryButton )
		table.insert( self.categoryButtons, categoryButton )
		if category.locked == true then
			categoryButton:disable()
		end
		if category.mapPackTypeIndex == categoryMapPackTypeIndex then
			currentCategoryIndex = index
		end
	end
	if #self.categoryButtons > 0 then
		if CoD.useController and not self.categoryButtonList:restoreState() then
			self.categoryButtons[currentCategoryIndex]:processEvent( {
				name = "gain_focus"
			} )
		end
		self:registerEventHandler( "button_prompt_back", CoD.ChangeMap.CategoryBack )
	end
end

CoD.ChangeMap.CategoryButtonAction = function ( self, event )
	Engine.PlaySound( "cac_slide_equip_item" )
	self.categoryButtonList:saveState()
	CoD.ButtonList.DisableInput( self.categoryButtonList )
	self.categoryContainer:animateToState( "disabled" )
	self:addMapButtons( event.controller, event.itemInfo.mapPackTypeIndex )
	local iconWidth = 384
	local iconHeight = 192
	local heightOffset = (self.infoContainer.iconHeight - iconHeight) / 2
	self.infoContainer.icon:setLeftRight( false, false, -iconWidth / 2, iconWidth / 2 )
	self.infoContainer.icon:setTopBottom( true, false, heightOffset, heightOffset + iconHeight )
end

CoD.ChangeMap.CreateMapInfo = function ( controller, id, map )
	local mapInfo = {}
	local sizeStrings = {
		"SMALL",
		"MEDIUM",
		"LARGE"
	}
	mapInfo.name = Engine.Localize( map.mapName )
	mapInfo.loadName = id
	mapInfo.size = Engine.Localize( "MPUI_MAPSIZE_" .. sizeStrings[map.size + 1] )
	mapInfo.description = Engine.Localize( map.mapDescription )
	mapInfo.iconMaterial = RegisterMaterial( "ui_normal" )
	mapInfo.iconImage = map.previewImage
	return mapInfo
end

CoD.ChangeMap.ISAnyDLCMapAvailable = function ( mapTypeIndex )
	for index, map in pairs( CoD.mapsTable ) do
		if map.dlc_pack == mapTypeIndex then
			return true
		end
	end
	return false
end

CoD.ChangeMap.IsMapInDemoBuild = function ( mapName )
	for key, value in pairs( CoD.ChangeMap.DemoBuildMaps ) do
		if key == mapName then
			return true
		end
	end
end

CoD.ChangeMap.AddMapButtons = function ( self, controller, mapPackTypeIndex )
	local mapLoadName = Engine.DvarString( nil, "ui_mapname" )
	local currentMapIndex = 1
	local categoryMapIndex = 0
	local sessionMode = Enum.eModes.MODE_MULTIPLAYER
	if CoD.isCampaign then
		sessionMode = Enum.eModes.MODE_CAMPAIGN
	elseif CoD.isZombie then
		sessionMode = Enum.eModes.MODE_ZOMBIES
	end
	self.mapButtons = {}
	local sortMaps = function ( a, b )
		if Dvar.ui_execdemo:get() then
			if CoD.ChangeMap.IsMapInDemoBuild( a ) and CoD.ChangeMap.IsMapInDemoBuild( a ) then
				return CoD.ChangeMap.DemoBuildMaps[a] < CoD.ChangeMap.DemoBuildMaps[b]
			else
				
			end
		else
			return CoD.mapsTable[a].unique_id < CoD.mapsTable[b].unique_id
		end
	end
	
	local filterMaps = function ( m )
		if sessionMode ~= CoD.mapsTable[m].session_mode then
			return false
		end
		local f17_local0 = CoD.mapsTable[m].dlc_pack == mapPackTypeIndex
		if Dvar.ui_execdemo:get() and f17_local0 then
			f17_local0 = CoD.ChangeMap.IsMapInDemoBuild( m )
		end
		return f17_local0
	end
	
	local maps = CoD.mapsTable
	local isOffline = Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE )
	local index = 1
	if isOffline == false then
		for id, map in LUI.IterateTableBySortedKeys( maps, sortMaps, filterMaps ) do
			index = index + 1
			local mapInfo = CoD.ChangeMap.CreateMapInfo( controller, id, map )
			local mapButtonDefaultAnimationState = {
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				topAnchor = true,
				bottomAnchor = false,
				top = 0,
				bottom = CoD.CoD9Button.Height
			}
			local mapButton = CoD.PlaylistButton.new( mapButtonDefaultAnimationState, "map_button_action", "map_button_gain_focus", "map_button_lose_focus", mapInfo, index )
			mapButton:setLabel( mapInfo.name )
			self.mapButtonList:addElement( mapButton )
			table.insert( self.mapButtons, mapButton )
			categoryMapIndex = categoryMapIndex + 1
			if map.loadName == mapLoadName then
				currentMapIndex = categoryMapIndex
			end
		end
	end
	if #self.mapButtons > 0 then
		if CoD.useController and not self.mapButtonList:restoreState() then
			self.mapButtons[currentMapIndex]:processEvent( {
				name = "gain_focus"
			} )
		end
		self:registerEventHandler( "button_prompt_back", CoD.ChangeMap.MapBack )
	end
end

