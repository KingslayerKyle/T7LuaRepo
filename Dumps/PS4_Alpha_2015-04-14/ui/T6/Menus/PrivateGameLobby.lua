require( "ui.T6.DualButtonPrompt" )
require( "ui.T6.GameLobby" )
require( "ui.T6.MapInfoImage" )
require( "ui.T6.MapVoter" )
require( "ui_mp.T6.Menus.CustomClassGameOptions" )
require( "ui_mp.T6.Menus.EditDefaultClasses" )
require( "ui_mp.T6.Menus.EditGameOptionsPopup" )
require( "ui_mp.T6.Menus.EditGeneralOptionsMenu" )
require( "ui_mp.T6.Menus.EditModeSpecificOptionsMenu" )
require( "ui_mp.T6.Menus.ViewGameOptionsPopup" )

CoD.PrivateGameLobby = {}
CoD.PrivateGameLobby.DefaultSetupGameFlyoutLeft = 140
require( "ui_mp.T6.Menus.PrivateGameLobby_Project" )
CoD.PrivateGameLobby.UpdateButtonPaneButtonVisibility = function ( self )
	if self == nil or self.body == nil then
		return 
	elseif self.body.mapInfoImage ~= nil then
		self.body.mapInfoImage:update( Dvar.ui_mapname:get(), Dvar.ui_gametype:get() )
	end
end

CoD.PrivateGameLobby.UpdateHostButtons = function ( self )
	self:processEvent( {
		name = "button_update"
	} )
end

CoD.PrivateGameLobby.Button_UpdateHostButton = function ( self )
	if Engine.PartyHostIsReadyToStart() == true then
		self:disable()
	else
		self:enable()
	end
end

CoD.PrivateGameLobby.ShouldDisableStartButton_Zombie = function ( self, event )
	local result = false
	local gametype = Engine.DvarString( nil, "ui_gametype" )
	local currentPlayers = Engine.PartyGetPlayerCount()
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == true and currentPlayers > 2 then
		if true == Dvar.r_dualPlayEnable:get() then
			result = true
			self.hintText = Engine.Localize( "ZMUI_START_MATCH_DUALVIEW_DISABLED_DESC", CoD.Zombie.GameTypeGroups[gametype].maxPlayers )
		elseif true == Dvar.r_stereo3DOn:get() then
			result = true
			self.hintText = Engine.Localize( "ZMUI_START_MATCH_STEREOSCOPIC3D_DISABLED_DESC", CoD.Zombie.GameTypeGroups[gametype].maxPlayers )
		else
			self.hintText = Engine.Localize( "MPUI_START_MATCH_DESC" )
		end
		if result == true then
			return result
		end
	end
	if gametype == CoD.Zombie.GAMETYPE_ZGRIEF then
		local cdcPlayers = Engine.PartyGetTeamMemberCount( Enum.team_t.TEAM_ALLIES )
		local ciaPlayers = Engine.PartyGetTeamMemberCount( Enum.team_t.TEAM_AXIS )
		if CoD.Zombie.GameTypeGroups[gametype].maxTeamPlayers < cdcPlayers or CoD.Zombie.GameTypeGroups[gametype].maxTeamPlayers < ciaPlayers then
			result = true
			self.hintText = Engine.Localize( "ZMUI_START_MATCH_MAX_TEAM_PLAYERS_DESC", CoD.Zombie.GameTypeGroups[gametype].maxTeamPlayers )
		elseif cdcPlayers < CoD.Zombie.GameTypeGroups[gametype].minTeamPlayers or ciaPlayers < CoD.Zombie.GameTypeGroups[gametype].minTeamPlayers then
			result = true
			self.hintText = Engine.Localize( "ZMUI_START_MATCH_MIN_TEAM_PLAYERS_DESC" )
		else
			self.hintText = Engine.Localize( "MPUI_START_MATCH_DESC" )
		end
	elseif CoD.Zombie.GameTypeGroups[gametype].maxPlayers < currentPlayers then
		result = true
		self.hintText = Engine.Localize( "ZMUI_START_MATCH_MAX_TOTAL_PLAYERS_DESC", CoD.Zombie.GameTypeGroups[gametype].maxPlayers )
	elseif currentPlayers < CoD.Zombie.GameTypeGroups[gametype].minPlayers then
		result = true
		self.hintText = Engine.Localize( "ZMUI_START_MATCH_MIN_TOTAL_PLAYERS_DESC", CoD.Zombie.GameTypeGroups[gametype].minPlayers )
	else
		self.hintText = Engine.Localize( "MPUI_START_MATCH_DESC" )
	end
	return result
end

CoD.PrivateGameLobby.Button_GameLobbyUpdate = function ( self, event )
	local disableButton = Engine.PartyHostIsReadyToStart()
	local partyHasDLCForMap = Engine.DoesPartyHaveDLCForMap( Dvar.ui_mapname:get() )
	if CoD.isZombie == true then
		if not disableButton then
			if partyHasDLCForMap then
				disableButton = CoD.PrivateGameLobby.ShouldDisableStartButton_Zombie( self, event )
			else
				disableButton = true
			end
		end
	elseif not disableButton then
		disableButton = not partyHasDLCForMap
	end
	if disableButton == true then
		self:disable()
	else
		self:enable()
	end
	if CoD.isPartyHost() and (Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) or Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH )) then
		Engine.Exec( event.controller, "getLatestWAD" )
	end
	self:dispatchEventToChildren( event )
end

CoD.PrivateGameLobby.IsHost = function ( self, controller )
	if not Engine.InLobby() then
		return true
	elseif Engine.GameHost() then
		return true
	else
		return false
	end
end

CoD.PrivateGameLobby.Button_StartMatchCanceled = function ( self, event )
	self:enable()
	if self.checkGameTimer then
		self.checkGameTimer:close()
		self.checkGameTimer = nil
	end
end

CoD.PrivateGameLobby.IsGameValid = function ( self, event )
	local shouldDisable = false
	if CoD.isZombie then
		shouldDisable = CoD.PrivateGameLobby.ShouldDisableStartButton_Zombie( {} )
	end
	if shouldDisable then
		self:dispatchEventToParent( {
			name = "cancel_start_game"
		} )
	end
end

CoD.PrivateGameLobby.PopulateButtons = function ( self )
	if self.body == nil then
		return 
	end
	self.body.buttonList:removeAllButtons()
	self.body.widestButtonTextWidth = CoD.PrivateGameLobby.DefaultSetupGameFlyoutLeft
	local isHost = CoD.PrivateGameLobby.IsHost( self, self.panelManager.m_ownerController )
	if isHost == true then
		self.body.startMatchButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_START_MATCH_CAPS" ) )
		self.body.startMatchButton.hintText = Engine.Localize( "MPUI_START_MATCH_DESC" )
		self.body.startMatchButton:registerEventHandler( "button_action", CoD.PrivateGameLobby.Button_StartMatch )
		self.body.startMatchButton:registerEventHandler( "start_game", self.body.startMatchButton.disable )
		self.body.startMatchButton:registerEventHandler( "cancel_start_game", CoD.PrivateGameLobby.Button_StartMatchCanceled )
		self.body.startMatchButton:registerEventHandler( "gamelobby_update", CoD.PrivateGameLobby.Button_GameLobbyUpdate )
		self.body.startMatchButton:registerEventHandler( "check_game_is_valid", CoD.PrivateGameLobby.IsGameValid )
		self.body.gameModeInfo = CoD.Lobby.CreateInfoPane()
		self.defaultFocusButton = self.body.startMatchButton
		local partyHasDLCForMap = Engine.DoesPartyHaveDLCForMap( Dvar.ui_mapname:get() )
		if true == Engine.PartyHostIsReadyToStart() or partyHasDLCForMap ~= true then
			self.body.startMatchButton:disable()
		else
			self.body.startMatchButton:enable()
		end
	end
	CoD.PrivateGameLobby.PopulateButtons_Project( self, isHost )
	if isHost == false then
		self.defaultFocusButton = self.body.createAClassButton
	end
	CoD.PrivateGameLobby.UpdateHostButtons( self )
	if self.body.mapInfoImage ~= nil then
		self.body.mapInfoImage:close()
	end
	local mapInfoImageLeft = 0
	local mapInfoImageWidth = 350 - CoD.CoD9Button.Height - mapInfoImageLeft
	local mapInfoImageHeight = mapInfoImageWidth / CoD.MapInfoImage.AspectRatio
	self.body.mapInfoImage = CoD.MapInfoImage.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = mapInfoImageWidth,
		topAnchor = false,
		bottomAnchor = true,
		top = -mapInfoImageHeight - CoD.ButtonPrompt.Height - 15,
		bottom = -CoD.ButtonPrompt.Height - 15
	} )
	self.body.mapInfoImage:setPriority( 200 )
	self.body.mapInfoImage.controller = self.controller
	self.body:addElement( self.body.mapInfoImage )
	CoD.PrivateGameLobby.AddDLCWarning( self, isHost )
	CoD.GameLobby.PopulateButtons( self, mapInfoImageHeight + 45 )
	if not CoD.isZombie and not self:restoreState() and CoD.useController == true and self.defaultFocusButton ~= nil then
		self.defaultFocusButton:processEvent( {
			name = "gain_focus"
		} )
	end
	CoD.PrivateGameLobby.UpdateButtonPaneButtonVisibility( self )
end

CoD.PrivateGameLobby.AddDLCWarning = function ( self, isHost )
	if self.body.mapInfoImage.dlcWarningContainer ~= nil then
		self.body.mapInfoImage.dlcWarningContainer:close()
		self.body.mapInfoImage.dlcWarningContainer = nil
	end
	local mapInfoFrameHeight = 40
	local dlcWarningContainer = LUI.UIElement.new()
	if CoD.isZombie == true then
		dlcWarningContainer:setLeftRight( true, false, CoD.MapInfoImage.MapImageLeft * 2, CoD.MapInfoImage.MapImageWidth - 2 )
		dlcWarningContainer:setTopBottom( false, true, CoD.MapInfoImage.MapImageBottom - CoD.MapInfoImage.MapImageHeight + 6, CoD.MapInfoImage.MapImageBottom + mapInfoFrameHeight )
	else
		dlcWarningContainer:setLeftRight( true, false, CoD.MapInfoImage.MapImageLeft, CoD.MapInfoImage.MapImageLeft + CoD.MapInfoImage.MapImageWidth )
		dlcWarningContainer:setTopBottom( false, true, CoD.MapInfoImage.MapImageBottom - CoD.MapInfoImage.MapImageHeight, CoD.MapInfoImage.MapImageBottom )
	end
	dlcWarningContainer:setAlpha( 0 )
	self.body.mapInfoImage:addElement( dlcWarningContainer )
	self.body.mapInfoImage.dlcWarningContainer = dlcWarningContainer
	dlcWarningContainer.warningBG = LUI.UIImage.new()
	dlcWarningContainer.warningBG:setLeftRight( true, true, 0, 0 )
	dlcWarningContainer.warningBG:setTopBottom( true, true, 0, 0 )
	dlcWarningContainer.warningBG:setRGB( 0, 0, 0 )
	dlcWarningContainer.warningBG:setAlpha( 0.8 )
	dlcWarningContainer:addElement( dlcWarningContainer.warningBG )
	local warningIconSize = 32
	local warningSpacing = 5
	local warningTop = 30
	local warningOffset = 5
	dlcWarningContainer.warningIcon = LUI.UIImage.new()
	dlcWarningContainer.warningIcon:setLeftRight( false, false, -warningIconSize / 2, warningIconSize / 2 )
	dlcWarningContainer.warningIcon:setTopBottom( true, false, warningTop, warningTop + warningIconSize )
	dlcWarningContainer.warningIcon:setImage( RegisterMaterial( "cac_restricted" ) )
	dlcWarningContainer:addElement( dlcWarningContainer.warningIcon )
	warningTop = warningTop + warningIconSize
	local warningFontName = "Default"
	local warningFont = CoD.fonts[warningFontName]
	local warningFontHeight = CoD.textSize[warningFontName]
	dlcWarningContainer.warningLabel = LUI.UIText.new()
	dlcWarningContainer.warningLabel:setLeftRight( true, true, warningOffset, -warningOffset )
	dlcWarningContainer.warningLabel:setTopBottom( true, false, warningTop, warningTop + warningFontHeight )
	dlcWarningContainer.warningLabel:setFont( warningFont )
	dlcWarningContainer.warningLabel:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
	dlcWarningContainer.warningLabel:setAlignment( LUI.Alignment.Center )
	dlcWarningContainer:addElement( dlcWarningContainer.warningLabel )
	local mapName = Dvar.ui_mapname:get()
	local partyHasDLCForMap = Engine.DoesPartyHaveDLCForMap( mapName )
	local warningText = ""
	if partyHasDLCForMap == false and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		dlcWarningContainer:setAlpha( 1 )
		if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
			warningText = Engine.Localize( "MPUI_DLC_WARNING_PARTY_MISSING_MAP_PACK_THEATER" )
		else
			warningText = Engine.Localize( "MPUI_DLC_WARNING_PARTY_MISSING_MAP_PACK" )
		end
	else
		dlcWarningContainer:setAlpha( 0 )
	end
	dlcWarningContainer.warningLabel:setText( warningText )
end

CoD.PrivateGameLobby.AddSetupGameFlyout = function ( self )
	local flyoutLeft = self.body.widestButtonTextWidth + 10
	local flyoutTop = CoD.Menu.TitleHeight + CoD.CoD9Button.Height * 1 + 2
	local flyoutHeight = CoD.CoD9Button.Height * 5
	local flyoutWidth = CoD.ButtonList.DefaultWidth - 20
	self.body.setupGameFlyoutBG = LUI.UIImage.new()
	self.body.setupGameFlyoutBG:setLeftRight( true, false, -4, flyoutLeft )
	self.body.setupGameFlyoutBG:setTopBottom( true, false, flyoutTop, flyoutTop + CoD.CoD9Button.Height )
	self.body.setupGameFlyoutBG:setRGB( 0, 0, 0 )
	self.body.setupGameFlyoutBG:setAlpha( 0.8 )
	self.body.setupGameFlyoutBG:setPriority( -100 )
	self.body:addElement( self.body.setupGameFlyoutBG )
	self.body.setupGameFlyoutContainer = LUI.UIElement.new()
	self.body.setupGameFlyoutContainer:setLeftRight( true, false, flyoutLeft, flyoutLeft + flyoutWidth )
	self.body.setupGameFlyoutContainer:setTopBottom( true, false, flyoutTop, flyoutTop + flyoutHeight )
	self.body.setupGameFlyoutContainer:setPriority( 1000 )
	self.body:addElement( self.body.setupGameFlyoutContainer )
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.8 )
	self.body.setupGameFlyoutContainer:addElement( background )
	self.body.setupGameFlyoutContainer.buttonList = CoD.ButtonList.new()
	self.body.setupGameFlyoutContainer.buttonList:setLeftRight( true, true, 4, 0 )
	self.body.setupGameFlyoutContainer.buttonList:setTopBottom( true, true, 0, 0 )
	self.body.setupGameFlyoutContainer:addElement( self.body.setupGameFlyoutContainer.buttonList )
	CoD.PrivateGameLobby.PopulateFlyoutButtons_Project_Multiplayer( self )
end

CoD.PrivateGameLobby.RemoveSetupGameFlyout = function ( self )
	if self.body.setupGameFlyoutBG ~= nil then
		self.body.setupGameFlyoutBG:close()
		self.body.setupGameFlyoutBG = nil
	end
	if self.body.setupGameFlyoutContainer ~= nil then
		self.body.setupGameFlyoutContainer:close()
		self.body.setupGameFlyoutContainer = nil
	end
end

CoD.PrivateGameLobby.ButtonListButtonGainFocus = function ( self, event )
	self:dispatchEventToParent( {
		name = "add_party_privacy_button"
	} )
	CoD.Lobby.ButtonListButtonGainFocus( self, event )
end

CoD.PrivateGameLobby.ButtonListAddButton = function ( self, text, hintText, priority )
	local newButton = CoD.Lobby.ButtonListAddButton( self, text, hintText, priority )
	newButton:registerEventHandler( "gain_focus", CoD.PrivateGameLobby.ButtonListButtonGainFocus )
	return newButton
end

CoD.PrivateGameLobby.AddButtonPaneElements = function ( self )
	CoD.LobbyPanes.addButtonPaneElements( self )
	self.body.buttonList.addButton = CoD.PrivateGameLobby.ButtonListAddButton
end

CoD.PrivateGameLobby.PopulateButtonPaneElements = function ( self )
	CoD.PrivateGameLobby.PopulateButtons( self )
end

CoD.PrivateGameLobby.PopulateButtonPrompts = function ( self )
	if self.friendsButton ~= nil then
		self.friendsButton:close()
		self.friendsButton = nil
	end
	if self.partyPrivacyButton ~= nil then
		self.partyPrivacyButton:close()
		self.partyPrivacyButton = nil
	end
	if not Engine.SessionMode_IsSystemlinkGame() and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		self:addFriendsButton()
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == false then
		local isHost = CoD.PrivateGameLobby.IsHost( self, self.panelManager.m_ownerController )
		CoD.PrivateGameLobby.PopulateButtonPrompts_Project( self, isHost )
	end
	if not Engine.SessionMode_IsSystemlinkGame() then
		self:addPartyPrivacyButton()
		self:addNATType()
	end
end

CoD.PrivateGameLobby.AddLobbyPaneElements = function ( self, headerText, maxControllersAllowed )
	if maxControllersAllowed == nil then
		maxControllersAllowed = Engine.DvarInt( controller, "party_maxlocalplayers_privatematch" )
	end
	CoD.LobbyPanes.addLobbyPaneElements( self, headerText, maxControllersAllowed )
end

CoD.PrivateGameLobby.GameLobbyUpdate = function ( self, event )
	CoD.PrivateGameLobby.PopulateButtonPrompts( self )
	self:dispatchEventToChildren( event )
end

local PrivateGameLobby_ValidateMap = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
		return 
	end
	local map = Dvar.ui_mapname:get()
	local map_valid = true
	if map == "" then
		map_valid = false
	end
	if not Engine.IsMapValid( map ) then
		map_valid = false
	end
	if not map_valid then
		Dvar.ui_mapname:set( CoD.GetDefaultMap( nil ) )
		if CoD.isZombie then
			local location, gameType = CoD.GetDefaultMapStartLocationGameType_Zombie( nil )
			Dvar.ui_gametype:set( gameType )
			Dvar.ui_zm_mapstartlocation:set( location )
		end
	end
end

local PrivateGameLobby_ValidateMode = function ()
	if CoD.isZombie then
		return 
	end
	local gametypeName = Engine.DvarString( nil, "ui_gametype" )
	local gameModes = Engine.GetGametypesBase()
	local validGamemode = false
	for index, gameMode in pairs( gameModes ) do
		if gameMode.gametype == gametypeName then
			validGamemode = true
			break
		end
	end
	if validGamemode == false then
		Dvar.ui_gametype:set( "tdm" )
	end
end

CoD.PrivateGameLobby.UpdateHost = function ( self, event )
	local isHost = event.isHost
	if isHost ~= self.wasHost then
		self.wasHost = isHost
		self:saveState()
		PrivateGameLobby_ValidateMap()
		PrivateGameLobby_ValidateMode()
		self.populateButtons( self.buttonPane )
		self:populateButtonPrompts()
	end
end

CoD.PrivateGameLobby.UpdateButtons = function ( self, event )
	self:saveState()
	self.populateButtons( self.buttonPane )
	self:populateButtonPrompts()
	self:dispatchEventToChildren( event )
end

CoD.PrivateGameLobby.GameTypeEvent = function ( self, event )
	self:populateButtonPrompts()
	if CoD.isZombie and not Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
		CoD.GameMapZombie.SwitchToMapDirect( 2, true, 0 )
	end
	if self.buttonPane.body ~= nil and event.isModified ~= nil then
		self.buttonPane.body.mapInfoImage:setModifiedCustomGame( event.isModified )
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
		Engine.SetDvar( "bot_difficulty", 1 )
		Engine.SystemNeedsUpdate( nil, "game_options" )
		Engine.SystemNeedsUpdate( nil, "lobby" )
	end
	self:dispatchEventToChildren( event )
end

CoD.PrivateGameLobby.ButtonBack = function ( self, event )
	if not CoD.isPS3 and not Engine.IsPrimaryLocalClient( event.controller ) then
		Engine.Exec( event.controller, "signclientout" )
		self:processEvent( {
			name = "controller_backed_out"
		} )
		return 
	elseif CoD.Lobby.OpenSignOutPopup( self, event ) == true then
		return 
	elseif not self.m_inputDisabled then
		if Engine.PartyHostIsReadyToStart() then
			CoD.PrivateGameLobby.CancelStartGame( self, event )
		else
			CoD.Lobby.ConfirmLeaveGameLobby( self, {
				controller = event.controller,
				leaveLobbyHandler = CoD.PrivateGameLobby.LeaveLobby
			} )
		end
	end
end

CoD.PrivateGameLobby.LeaveLobby = function ( self, event )
	if Engine.IsLivestreamEnabled() then
		Engine.LivestreamDisableAsync()
	end
	CoD.PrivateGameLobby.LeaveLobby_Project( self, event )
	Engine.Exec( event.controller, "party_updateActiveMenu" )
end

CoD.PrivateGameLobby.Button_StartMatch = function ( self, event )
	self:dispatchEventToParent( {
		name = "start_game",
		controller = event.controller
	} )
	if self.checkGameTimer then
		self.checkGameTimer:close()
		self.checkGameTimer = nil
	end
	self.checkGameTimer = LUI.UITimer.new( 100, "check_game_is_valid", false )
	self:addElement( self.checkGameTimer )
end

CoD.PrivateGameLobby.OpenChangeMap = function ( self, event )
	Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_SELECTING_MAP )
	self:openPopup( "ChangeMap", event.controller )
	Engine.PlaySound( "cac_screen_fade" )
end

CoD.PrivateGameLobby.OpenChangeGameMode = function ( self, event )
	Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_SELECTING_GAMETYPE )
	self:openPopup( "ChangeGameMode", event.controller )
	Engine.PlaySound( "cac_screen_fade" )
end

CoD.PrivateGameLobby.StartGame = function ( self, event )
	if CoD.PrivateGameLobby.IsHost( self, event.controller ) then
		if Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 then
			Engine.PartyHostReassignTeams()
		end
		Engine.PartyHostToggleStart()
	end
	CoD.PrivateGameLobby.UpdateHostButtons( self )
	self:registerEventHandler( "button_prompt_back", CoD.PrivateGameLobby.CancelStartGame )
	self:dispatchEventToChildren( event )
end

CoD.PrivateGameLobby.CancelStartGameClear = function ( self, event )
	if Engine.PartyGetHostUIState() == CoD.PARTYHOST_STATE_COUNTDOWN_CANCELLED then
		Engine.PartyHostClearUIState()
	end
end

CoD.PrivateGameLobby.CancelStartGame = function ( self, event )
	if self.checkGameTimer then
		self.checkGameTimer:close()
		self.checkGameTimer = nil
	end
	Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_COUNTDOWN_CANCELLED )
	local success = Engine.PartyHostCancelStartMatch()
	if success == true then
		CoD.PrivateGameLobby.UpdateHostButtons( self )
		local statusTimer = LUI.UITimer.new( 1500, "cancel_start_game_clear", true )
		self:addElement( statusTimer )
		self:registerEventHandler( "button_prompt_back", CoD.PrivateGameLobby.ButtonBack )
		self:dispatchEventToChildren( {
			name = "cancel_start_game"
		} )
	end
end

CoD.PrivateGameLobby.New = function ( menuName, controller )
	local privateGameLobby = CoD.GameLobby.new( menuName, controller, false, nil, nil, true )
	privateGameLobby.buttonPane.menuName = menuName
	privateGameLobby.buttonPane.controller = controller
	privateGameLobby.addButtonPaneElements = CoD.PrivateGameLobby.AddButtonPaneElements
	privateGameLobby.populateButtonPaneElements = CoD.PrivateGameLobby.PopulateButtonPaneElements
	privateGameLobby.addLobbyPaneElements = CoD.PrivateGameLobby.AddLobbyPaneElements
	privateGameLobby.populateButtons = CoD.PrivateGameLobby.PopulateButtons
	privateGameLobby.populateButtonPrompts = CoD.PrivateGameLobby.PopulateButtonPrompts
	privateGameLobby:updatePanelFunctions()
	privateGameLobby:registerEventHandler( "button_prompt_back", CoD.PrivateGameLobby.ButtonBack )
	privateGameLobby:registerEventHandler( "party_update_host", CoD.PrivateGameLobby.UpdateHost )
	privateGameLobby:registerEventHandler( "party_joined", CoD.PrivateGameLobby.UpdateButtons )
	privateGameLobby:registerEventHandler( "start_game", CoD.PrivateGameLobby.StartGame )
	privateGameLobby:registerEventHandler( "cancel_start_game", CoD.PrivateGameLobby.CancelStartGame )
	privateGameLobby:registerEventHandler( "cancel_start_game_clear", CoD.PrivateGameLobby.CancelStartGameClear )
	privateGameLobby:registerEventHandler( "game_options_update", CoD.PrivateGameLobby.GameTypeEvent )
	privateGameLobby:registerEventHandler( "gametype_update", CoD.PrivateGameLobby.GameTypeEvent )
	privateGameLobby:registerEventHandler( "gamelobby_update", CoD.PrivateGameLobby.GameLobbyUpdate )
	privateGameLobby:registerEventHandler( "button_prompt_team_prev", CoD.PrivateGameLobby.ButtonPrompt_TeamPrev )
	privateGameLobby:registerEventHandler( "button_prompt_team_next", CoD.PrivateGameLobby.ButtonPrompt_TeamNext )
	privateGameLobby:registerEventHandler( "zombie_settings_update", CoD.PrivateGameLobby.ZombieGameSettingsUpdate )
	CoD.PrivateGameLobby.RegisterEventHandler_Project( privateGameLobby )
	privateGameLobby.lobbyPane.body.lobbyList:setSplitscreenSignInAllowed( true )
	if CoD.isZombie == true then
		local gametype = Dvar.ui_gametype:get()
		Engine.SetGametype( gametype )
		Engine.PartySetMaxPlayerCount( CoD.Zombie.GameTypeGroups[gametype].maxPlayers )
	end
	privateGameLobby.populateButtons( privateGameLobby.buttonPane )
	privateGameLobby:populateButtonPrompts()
	PrivateGameLobby_ValidateMap()
	PrivateGameLobby_ValidateMode()
	privateGameLobby.buttonPane.body.mapInfoImage:update( Dvar.ui_mapname:get(), Dvar.ui_gametype:get() )
	if CoD.isZombie then
		local isHost = CoD.PrivateGameLobby.IsHost( privateGameLobby, controller )
		if not isHost and Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == false then
			Engine.SetDvar( "party_readyPercentRequired", 0 )
		end
	end
	return privateGameLobby
end

