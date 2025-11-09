require( "ui.T6.CategoryButton" )

CoD.ChangeGameMode = {}
CoD.ChangeGameMode.DemoBuildCategories = {
	"standard"
}
CoD.ChangeGameMode.DemoBuildGamemodes = {
	"tdm",
	"ctf",
	"koth",
	"dom",
	"conf"
}
LUI.createMenu.ChangeGameMode_old = function ( controller )
	local changeGameModeMenu = CoD.Menu.New( "ChangeGameMode" )
	changeGameModeMenu:addTitle( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	changeGameModeMenu:addLargePopupBackground()
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
	changeGameModeMenu:addElement( background )
	changeGameModeMenu.m_ownerController = controller
	if CoD.isCampaign == true then
		CoD.ChangeGameMode.Categories = {
			"missions",
			"sidemissions",
			"dev"
		}
	elseif CoD.isZombie == true then
		CoD.ChangeGameMode.Categories = {
			"zclassic",
			"zsurvival",
			"zencounter"
		}
	elseif true == Dvar.ui_execdemo_e3_host:get() then
		CoD.ChangeGameMode.Categories = {
			"standard"
		}
	else
		CoD.ChangeGameMode.Categories = {
			"standard",
			"party",
			"saved"
		}
	end
	CoD.ChangeGameMode.CategoryIconNames = {
		"playlist_standard",
		"playlist_party",
		"playlist_party"
	}
	changeGameModeMenu:addSelectButton()
	changeGameModeMenu:addBackButton()
	local buttonOffset = CoD.CoD9Button.Height
	local selectionContainerWidth = (CoD.Menu.Width - buttonOffset * 2) / 3
	local selectionContainerLeft = 0
	changeGameModeMenu.categoryContainer = LUI.UIElement.new( {
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
	changeGameModeMenu.categoryContainer:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	changeGameModeMenu:addElement( changeGameModeMenu.categoryContainer )
	changeGameModeMenu.categoryButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	changeGameModeMenu.categoryButtonList.id = changeGameModeMenu.categoryButtonList.id .. ".CategoryButtonList"
	changeGameModeMenu.categoryContainer:addElement( changeGameModeMenu.categoryButtonList )
	selectionContainerLeft = selectionContainerLeft + selectionContainerWidth - buttonOffset
	changeGameModeMenu.gamemodeContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + selectionContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	changeGameModeMenu:addElement( changeGameModeMenu.gamemodeContainer )
	changeGameModeMenu.gameModeButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	changeGameModeMenu.gameModeButtonList.id = changeGameModeMenu.gameModeButtonList.id .. ".gameModeButtonList"
	changeGameModeMenu.gamemodeContainer:addElement( changeGameModeMenu.gameModeButtonList )
	selectionContainerLeft = selectionContainerLeft + selectionContainerWidth
	local infoContainerWidth = selectionContainerWidth + buttonOffset * 2
	changeGameModeMenu.infoContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + infoContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	changeGameModeMenu:addElement( changeGameModeMenu.infoContainer )
	local iconWidth = infoContainerWidth - 100
	local iconHeight = iconWidth
	local infoItemTop = 0
	changeGameModeMenu.infoContainer.icon = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -iconWidth / 2,
		right = iconWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + iconHeight,
		alpha = 0
	} )
	changeGameModeMenu.infoContainer:addElement( changeGameModeMenu.infoContainer.icon )
	local infoWidth = iconHeight * 1.7
	changeGameModeMenu.infoContainer.infoWidth = infoWidth
	infoItemTop = infoItemTop + iconHeight + 15
	changeGameModeMenu.infoContainer.titleElement = LUI.UIText.new( {
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
	changeGameModeMenu.infoContainer.titleElement:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	changeGameModeMenu.infoContainer:addElement( changeGameModeMenu.infoContainer.titleElement )
	changeGameModeMenu.infoContainer.titleElement:setTTF( "fonts/escom.ttf" )
	infoItemTop = infoItemTop + CoD.textSize.Big + 5
	changeGameModeMenu.infoContainer.description = LUI.UIText.new( {
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
	changeGameModeMenu.infoContainer.description:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	changeGameModeMenu.infoContainer:addElement( changeGameModeMenu.infoContainer.description )
	changeGameModeMenu.infoContainer.description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	changeGameModeMenu:registerEventHandler( "category_button_gain_focus", CoD.ChangeGameMode.Button_GainFocus )
	changeGameModeMenu:registerEventHandler( "category_button_lose_focus", CoD.ChangeGameMode.Button_LoseFocus )
	changeGameModeMenu:registerEventHandler( "category_button_action", CoD.ChangeGameMode.CategoryButtonAction )
	changeGameModeMenu:registerEventHandler( "game_mode_button_gain_focus", CoD.ChangeGameMode.Button_GainFocus )
	changeGameModeMenu:registerEventHandler( "game_mode_button_lose_focus", CoD.ChangeGameMode.Button_LoseFocus )
	changeGameModeMenu:registerEventHandler( "game_mode_button_action", CoD.ChangeGameMode.GameModeSelected )
	changeGameModeMenu.updateInfo = CoD.ChangeGameMode.UpdateInfo
	changeGameModeMenu.addGameModeButtons = CoD.ChangeGameMode.AddGameModeButtons
	CoD.ChangeGameMode.AddCategoryButtons( changeGameModeMenu )
	return changeGameModeMenu
end

CoD.ChangeGameMode.GameModeSelected = function ( self, event )
	Engine.PlaySound( "cac_slide_equip_item" )
	self.gameModeButtonList:saveState()
	Engine.Exec( event.controller, "resetCustomGametype" )
	local oldTeamBased = CoD.IsGametypeTeamBased()
	Engine.SetGametype( event.itemInfo.gametype )
	local newTeamBased = CoD.IsGametypeTeamBased()
	if oldTeamBased ~= newTeamBased then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
		Engine.SetDvar( "bot_difficulty", 1 )
	end
	Engine.Exec( event.controller, "xupdatepartystate" )
	Engine.SetProfileVar( event.controller, CoD.profileKey_gametype, event.itemInfo.gametype )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( self.m_ownerController )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.Exec( event.controller, "lobby_setgametype " .. event.itemInfo.gametype )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
	self:goBack( self.m_ownerController )
end

CoD.ChangeGameMode.CategoryBack = function ( self, event )
	self.categoryButtonList:saveState()
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( self.m_ownerController )
	CoD.LobbyBase.ResetLeaderActivity( self.m_ownerController )
	CoD.Menu.ButtonPromptBack( self, event )
end

CoD.ChangeGameMode.GameModeBack = function ( self, event )
	self.gameModeButtonList:saveState()
	self:registerEventHandler( "button_prompt_back", CoD.ChangeGameMode.CategoryBack )
	self.gameModeButtonList:removeAllChildren()
	CoD.ButtonList.EnableInput( self.categoryButtonList )
	self.categoryContainer:animateToState( "default" )
	self.categoryButtonList:restoreState()
end

CoD.ChangeGameMode.Button_GainFocus = function ( self, event )
	self.infoContainer.owner = event.owner
	self:updateInfo( event.itemInfo )
end

CoD.ChangeGameMode.Button_LoseFocus = function ( self, event )
	if self.infoContainer.owner == event.owner then
		self:updateInfo( nil )
	end
end

CoD.ChangeGameMode.UpdateInfo = function ( self, itemInfo )
	local titleText = ""
	local descriptionText = ""
	local iconMaterial = nil
	if itemInfo ~= nil then
		titleText = itemInfo.name
		descriptionText = itemInfo.description
		iconMaterial = itemInfo.iconMaterial
	end
	self.infoContainer.titleElement:setText( titleText )
	self.infoContainer.description:setText( descriptionText )
	if iconMaterial ~= nil then
		self.infoContainer.icon:registerAnimationState( "icon", {
			material = iconMaterial,
			alpha = 1
		} )
		self.infoContainer.icon:animateToState( "icon" )
	else
		self.infoContainer.icon:animateToState( "default" )
	end
end

CoD.ChangeGameMode.CreateCategoryItemInfo = function ()
	local gameModeCategories = {}
	local availableCategories = CoD.ChangeGameMode.Categories
	if Dvar.ui_execdemo:get() then
		availableCategories = CoD.ChangeGameMode.DemoBuildCategories
	end
	for index, categoryName in ipairs( availableCategories ) do
		if categoryName ~= "saved" or Engine.SessionModeIsMode( CoD.SESSIONMODE_ONLINE ) then
			local category = {}
			if categoryName == "custom" then
				category.locked = true
			else
				category.locked = false
			end
			category.ref = categoryName
			category.name = Engine.Localize( "MPUI_CATEGORY_" .. categoryName .. "_CAPS" )
			category.description = Engine.Localize( "MPUI_CATEGORY_" .. categoryName .. "_DESC" )
			category.iconMaterial = RegisterMaterial( CoD.ChangeGameMode.CategoryIconNames[index] )
			table.insert( gameModeCategories, category )
		end
	end
	return gameModeCategories
end

CoD.ChangeGameMode.AddCategoryButtons = function ( self )
	local categories = CoD.ChangeGameMode.CreateCategoryItemInfo()
	local gametypeName = Engine.DvarString( nil, "ui_gametype" )
	local gametypeCategory = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametypeName, "groupname" )
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
		if category.ref == gametypeCategory then
			currentCategoryIndex = index
		end
	end
	if #self.categoryButtons > 0 then
		if CoD.useController and not self.categoryButtonList:restoreState() then
			self.categoryButtons[currentCategoryIndex]:processEvent( {
				name = "gain_focus"
			} )
		end
		self:registerEventHandler( "button_prompt_back", CoD.ChangeGameMode.CategoryBack )
	end
end

CoD.ChangeGameMode.CategoryButtonAction = function ( self, event )
	Engine.PlaySound( "cac_slide_equip_item" )
	self.categoryButtonList:saveState()
	CoD.ButtonList.DisableInput( self.categoryButtonList )
	self.categoryContainer:animateToState( "disabled" )
	if event.itemInfo.ref == "saved" then
		if Engine.IsGuest( event.controller ) then
			CoD.ButtonList.EnableInput( self.categoryButtonList )
			self.categoryContainer:animateToState( "default" )
			local errorPopup = self:openPopup( "Error", controller )
			errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
		elseif Engine.CanViewContent() == false then
			CoD.ButtonList.EnableInput( self.categoryButtonList )
			self.categoryContainer:animateToState( "default" )
			self:openPopup( "popup_contentrestricted", event.controller )
		else
			CoD.perController[event.controller].codtvRoot = "customgames"
			self:openMenu( "CODTv", event.controller )
			self:close()
		end
	else
		self:addGameModeButtons( event.controller, event.itemInfo.ref )
	end
end

CoD.ChangeGameMode.CreateGameModeInfo = function ( controller, gameMode )
	local gameModeInfo = {
		name = Engine.Localize( gameMode.name ),
		gametype = gameMode.gametype
	}
	local description = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gameMode.gametype, "description" )
	gameModeInfo.description = Engine.Localize( description )
	gameModeInfo.iconMaterial = RegisterMaterial( Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gameMode.gametype, "image" ) )
	return gameModeInfo
end

CoD.ChangeGameMode.DemoBuildHasGameType = function ( gameType )
	for index, type in ipairs( CoD.ChangeGameMode.DemoBuildGamemodes ) do
		if type == gameType then
			return true
		end
	end
end

CoD.ChangeGameMode.AddGameModeButtons = function ( self, controller, gameModeCategory )
	local gametypeName = Engine.DvarString( nil, "ui_gametype" )
	local currentGametypeIndex = 1
	local categoryGametypeIndex = 0
	self.gameModeButtons = {}
	local gameModes = Engine.GetGametypesBase()
	for index, gameMode in pairs( gameModes ) do
		local f13_local3 = true
		if Dvar.ui_execdemo:get() then
			f13_local3 = CoD.ChangeGameMode.DemoBuildHasGameType( gameMode.gametype )
		end
		if gameMode.category == gameModeCategory and f13_local3 then
			local gameModeInfo = CoD.ChangeGameMode.CreateGameModeInfo( controller, gameMode )
			local gameModeButtonDefaultAnimationState = {
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				topAnchor = true,
				bottomAnchor = false,
				top = 0,
				bottom = CoD.CoD9Button.Height
			}
			local gameModeButton = CoD.PlaylistButton.new( gameModeButtonDefaultAnimationState, "game_mode_button_action", "game_mode_button_gain_focus", "game_mode_button_lose_focus", gameModeInfo, index )
			gameModeButton:setLabel( gameModeInfo.name )
			self.gameModeButtonList:addElement( gameModeButton )
			table.insert( self.gameModeButtons, gameModeButton )
			categoryGametypeIndex = categoryGametypeIndex + 1
			if gameMode.gametype == gametypeName then
				currentGametypeIndex = categoryGametypeIndex
			end
		end
	end
	if #self.gameModeButtons > 0 then
		if CoD.useController and not self.gameModeButtonList:restoreState() then
			self.gameModeButtons[currentGametypeIndex]:processEvent( {
				name = "gain_focus"
			} )
		end
		self:registerEventHandler( "button_prompt_back", CoD.ChangeGameMode.GameModeBack )
	end
end

