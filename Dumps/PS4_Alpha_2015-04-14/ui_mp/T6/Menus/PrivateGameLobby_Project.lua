CoD.PrivateGameLobby.ButtonPrompt_TeamPrev = function ( self, event )
	if Engine.PartyHostIsReadyToStart() == true then
		return 
	else
		Engine.LocalPlayerPartyPrevTeam( event.controller )
		Engine.PlaySound( "cac_loadout_edit_submenu" )
	end
end

CoD.PrivateGameLobby.ButtonPrompt_TeamNext = function ( self, event )
	if Engine.PartyHostIsReadyToStart() == true then
		return 
	else
		Engine.LocalPlayerPartyNextTeam( event.controller )
		Engine.PlaySound( "cac_loadout_edit_submenu" )
	end
end

CoD.PrivateGameLobby.ShouldEnableTeamCycling = function ( self )
	if self.panelManager == nil then
		return false
	elseif not self.panelManager:isPanelOnscreen( "lobbyPane" ) then
		return false
	elseif Engine.PartyIsReadyToStart() == true then
		return false
	elseif Engine.PartyHostIsReadyToStart() == true then
		return false
	elseif Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 and Engine.GetGametypeSetting( "allowspectating" ) ~= 1 then
		return false
	else
		return true
	end
end

CoD.PrivateGameLobby.SetupTeamCycling = function ( self )
	if CoD.PrivateGameLobby.ShouldEnableTeamCycling( self ) then
		self.cycleTeamButtonPrompt:enable()
	else
		self.cycleTeamButtonPrompt:disable()
	end
end

CoD.PrivateGameLobby.CurrentPanelChanged = function ( self, event )
	CoD.Lobby.CurrentPanelChanged( self, event )
	CoD.PrivateGameLobby.SetupTeamCycling( self )
end

CoD.PrivateGameLobby.ButtonPrompt_PartyUpdateStatus = function ( self, event )
	CoD.GameLobby.UpdateStatusText( self, event )
	CoD.PrivateGameLobby.SetupTeamCycling( self )
	self:dispatchEventToChildren( event )
end

CoD.PrivateGameLobby.DoesGametypeSupportBots = function ( gametype )
	local allowed = {
		"dm",
		"tdm",
		"ctf",
		"dem",
		"dom",
		"koth",
		"hq",
		"conf",
		"sd"
	}
	for index = 1, #allowed, 1 do
		if gametype == allowed[index] then
			return true
		end
	end
	return false
end

CoD.PrivateGameLobby.BotButton_Update = function ( self )
	local gameType = Engine.DvarString( nil, "ui_gameType" )
	local friends = Engine.DvarInt( nil, "bot_friends" )
	local enemies = Engine.DvarInt( nil, "bot_enemies" )
	local difficulty = Engine.DvarInt( nil, "bot_difficulty" )
	if self.starImage then
		self.starImage:setAlpha( 0 )
	end
	if not CoD.IsGametypeTeamBased() then
		Engine.SetDvar( "bot_friends", 0 )
	end
	if CoD.IsGametypeTeamBased() and enemies > 9 then
		Engine.SetDvar( "bot_enemies", 9 )
	end
	if CoD.PrivateGameLobby.DoesGametypeSupportBots( gameType ) then
		self.hintText = Engine.Localize( "MENU_BOTS_HINT" )
		self:enable()
		if friends ~= 0 or enemies ~= 0 then
			self.starImage:setAlpha( 1 )
		end
	else
		self.hintText = Engine.Localize( "MENU_BOTS_NOT_SUPPORTED_" .. gameType )
		self:disable()
	end
end

CoD.PrivateGameLobby.PopulateButtons_Project_Multiplayer = function ( self, isHost )
	if isHost == true then
		local setupGameButtonText = Engine.Localize( "MPUI_SETUP_GAME_CAPS" )
		local f9_local0 = {}
		local setupGameButtonTextDim = GetTextDimensions( setupGameButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
		self.body.setupGameButton = self.body.buttonList:addButton( setupGameButtonText )
		self.body.setupGameButton.hintText = Engine.Localize( "MPUI_SETUP_GAME_DESC" )
		self.body.setupGameButton:setActionEventName( "open_setup_game_flyout" )
		self.body.setupGameButton:registerEventHandler( "button_update", CoD.PrivateGameLobby.Button_UpdateHostButton )
		if self.body.widestButtonTextWidth < setupGameButtonTextDim[3] then
			self.body.widestButtonTextWidth = setupGameButtonTextDim[3]
		end
		if not Dvar.ui_execdemo:get() then
			local botsButtonText = Engine.Localize( "MENU_SETUP_BOTS_CAPS" )
			local f9_local1 = {}
			local botsButtonTextDim = GetTextDimensions( botsButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
			local right = botsButtonTextDim[3]
			self.body.botsButton = self.body.buttonList:addButton( botsButtonText )
			self.body.botsButton:setActionEventName( "open_bots_menu" )
			self.body.botsButton:registerEventHandler( "gamelobby_update", CoD.PrivateGameLobby.BotButton_Update )
			if self.body.widestButtonTextWidth < right then
				self.body.widestButtonTextWidth = right
			end
			local starImage = LUI.UIImage.new()
			starImage:setLeftRight( true, false, right + 5, right + 5 + 30 )
			starImage:setTopBottom( false, false, -15, 15 )
			starImage:setAlpha( 0 )
			starImage:setImage( RegisterMaterial( CoD.MPZM( "ui_host", "ui_host_zm" ) ) )
			self.body.botsButton:addElement( starImage )
			self.body.botsButton.starImage = starImage
			CoD.PrivateGameLobby.BotButton_Update( self.body.botsButton )
		end
		self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	end
	local createAClassButtonText = Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" )
	local f9_local0 = {}
	local createAClassButtonTextDim = GetTextDimensions( createAClassButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
	self.body.createAClassButton = self.body.buttonList:addButton( createAClassButtonText )
	self.body.createAClassButton.id = "CoD9Button." .. "PrivateGameLobby." .. Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" )
	CoD.CACUtility.SetupCACLock( self.body.createAClassButton )
	self.body.createAClassButton:registerEventHandler( "button_action", CoD.GameLobby.Button_CAC )
	if self.body.widestButtonTextWidth < createAClassButtonTextDim[3] then
		self.body.widestButtonTextWidth = createAClassButtonTextDim[3]
	end
	if Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1 then
		local rewardsButtonText = Engine.Localize( "MENU_SCORE_STREAKS_CAPS" )
		local f9_local1 = {}
		local rewardsButtonTextDim = GetTextDimensions( rewardsButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
		self.body.rewardsButton = self.body.buttonList:addButton( rewardsButtonText )
		self.body.rewardsButton.id = "CoD9Button." .. "PrivateGameLobby." .. Engine.Localize( "MENU_SCORE_STREAKS_CAPS" )
		self.body.rewardsButton.hintText = Engine.Localize( "FEATURE_KILLSTREAKS_DESC" )
		CoD.SetupButtonLock( self.body.rewardsButton, nil, "FEATURE_KILLSTREAKS", "FEATURE_KILLSTREAKS_DESC" )
		self.body.rewardsButton:registerEventHandler( "button_action", CoD.GameLobby.Button_Rewards )
		if self.body.widestButtonTextWidth < rewardsButtonTextDim[3] then
			self.body.widestButtonTextWidth = rewardsButtonTextDim[3]
		end
	end
	self.body.barracksButtonSpacer = self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 2 )
	self.body.barracksButton = self.body.buttonList:addButton( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	self.body.barracksButton.id = "CoD9Button." .. "PrivateGameLobby." .. Engine.Localize( "MENU_BARRACKS_CAPS" )
	CoD.SetupBarracksLock( self.body.barracksButton )
	self.body.barracksButton:setActionEventName( "open_barracks" )
	self.body.customLeaderboardButton = self.body.buttonList:addButton( Engine.Localize( "MENU_CUSTOM_LOBBY_LEADERBOARDS_CAPS" ) )
	self.body.customLeaderboardButton.id = "CoD9Button." .. "PrivateGameLobby." .. Engine.Localize( "MENU_CUSTOM_LOBBY_LEADERBOARDS_CAPS" )
	self.body.customLeaderboardButton:setActionEventName( "open_custom_leaderboard" )
	self.body.buttonList:addSpacer( CoD.CoD9Button.Height / 4, 200 )
	if isHost and Engine.SessionMode_IsOnlineGame() then
		CoD.PrivateGameLobby.AddRecordButton( self )
	end
	if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == false and Engine.DvarBool( nil, "webm_encUiEnabledCustom" ) then
		CoD.Lobby.AddLivestreamButton( self, 10, isHost )
	end
end

CoD.PrivateGameLobby.AddRecordButton = function ( self )
	local demoRecording = self.body.buttonList:addButton( Engine.Localize( "CUSTOM_GAME_RECORDING_CAPS" ) )
	demoRecording.hintText = Engine.Localize( "CUSTOM_GAME_RECORDING_DESC" )
	demoRecording:registerEventHandler( "button_action", CoD.PrivateGameLobby.DemoRecordingButton_ToggleDemoRecording )
	
	local recImage = LUI.UIImage.new()
	recImage:setLeftRight( false, true, -130, -100 )
	recImage:setTopBottom( false, false, -15, 15 )
	recImage:setAlpha( 1 )
	recImage:setImage( RegisterMaterial( "codtv_recording" ) )
	
	local recText = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -100,
		right = -40,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Condensed / 2,
		bottom = CoD.textSize.Condensed / 2,
		font = CoD.fonts.Condensed,
		alignment = LUI.Alignment.Left
	} )
	demoRecording:addElement( recImage )
	demoRecording.recImage = recImage
	
	demoRecording:addElement( recText )
	demoRecording.recText = recText
	
	CoD.PrivateGameLobby.UpdateDemoRecordingButton( demoRecording )
end

CoD.PrivateGameLobby.UpdateDemoRecordingButton = function ( self )
	local demoRecordDvar = nil
	if Engine.SessionMode_IsSystemlinkGame() then
		demoRecordDvar = Dvar.demo_recordSystemlinkMatch
	else
		demoRecordDvar = Dvar.demo_recordPrivateMatch
	end
	if demoRecordDvar:get() then
		self.recImage:setRGB( 1, 0, 0 )
		self.recText:setText( Engine.Localize( "MENU_ON_CAPS" ) )
	else
		self.recImage:setRGB( 0.3, 0.3, 0.3 )
		self.recText:setText( Engine.Localize( "MENU_OFF_CAPS" ) )
	end
end

CoD.PrivateGameLobby.DemoRecordingButton_ToggleDemoRecording = function ( self, event )
	local demoRecordDvar = nil
	if Engine.SessionMode_IsSystemlinkGame() then
		demoRecordDvar = Dvar.demo_recordSystemlinkMatch
	else
		demoRecordDvar = Dvar.demo_recordPrivateMatch
	end
	demoRecordDvar:set( not demoRecordDvar:get() )
	CoD.PrivateGameLobby.UpdateDemoRecordingButton( self )
end

CoD.PrivateGameLobby.OpenCustomLeaderboard = function ( self, event )
	local lb = self:openPopup( "LeaderboardMP", event.controller )
	local gameMode = Dvar.ui_gameType:get()
	if gameMode ~= nil then
		lb:processEvent( {
			name = "leaderboard_loadnew",
			controller = event.controller,
			lbIndex = 16,
			customLeaderboard = true
		} )
	end
end

CoD.PrivateGameLobby.PopulateFlyoutButtons_Project_Multiplayer = function ( self )
	self.body.setupGameFlyoutContainer.changeMapButton = self.body.setupGameFlyoutContainer.buttonList:addButton( Engine.Localize( "MPUI_CHANGE_MAP_CAPS" ) )
	self.body.setupGameFlyoutContainer.changeMapButton.hintText = Engine.Localize( "MPUI_CHANGE_MAP_DESC" )
	self.body.setupGameFlyoutContainer.changeMapButton:setActionEventName( "open_change_map" )
	self.body.setupGameFlyoutContainer.changeMapButton:registerEventHandler( "button_update", CoD.PrivateGameLobby.Button_UpdateHostButton )
	self.body.setupGameFlyoutContainer.changeGameModeButton = self.body.setupGameFlyoutContainer.buttonList:addButton( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
	self.body.setupGameFlyoutContainer.changeGameModeButton.hintText = Engine.Localize( "MPUI_CHANGE_GAME_MODE_DESC" )
	self.body.setupGameFlyoutContainer.changeGameModeButton:setActionEventName( "open_change_game_mode" )
	self.body.setupGameFlyoutContainer.changeGameModeButton:registerEventHandler( "button_update", CoD.PrivateGameLobby.Button_UpdateHostButton )
	self.body.setupGameFlyoutContainer.editGameOptionsButton = self.body.setupGameFlyoutContainer.buttonList:addButton( Engine.Localize( "MPUI_EDIT_GAME_RULES_CAPS" ) )
	self.body.setupGameFlyoutContainer.editGameOptionsButton.hintText = Engine.Localize( "MPUI_EDIT_GAME_RULES_DESC" )
	self.body.setupGameFlyoutContainer.editGameOptionsButton:setActionEventName( "open_editGameOptions_menu" )
	self.body.setupGameFlyoutContainer.editGameOptionsButton:registerEventHandler( "button_update", CoD.PrivateGameLobby.Button_UpdateHostButton )
end

CoD.PrivateGameLobby.PopulateButtons_Project_Zombie = function ( self, isHost )
	if isHost == true then
		self.body.changeMapButton = self.body.buttonList:addButton( Engine.Localize( "ZMUI_MAP_CAPS" ) )
		self.body.changeMapButton.hintText = Engine.Localize( "ZMUI_MAP_SELECTION_DESC" )
		self.body.changeMapButton:setActionEventName( "open_change_map" )
		self.body.changeMapButton:registerEventHandler( "button_update", CoD.PrivateGameLobby.Button_UpdateHostButton )
		self.body.changeGameModeButton = self.body.buttonList:addButton( Engine.Localize( "MPUI_CHANGE_GAME_MODE_CAPS" ) )
		self.body.changeGameModeButton.hintText = Engine.Localize( "MPUI_CHANGE_GAME_MODE_DESC" )
		self.body.changeGameModeButton:setActionEventName( "open_change_game_mode" )
		self.body.changeGameModeButton:registerEventHandler( "button_update", CoD.PrivateGameLobby.Button_UpdateHostButton )
		self.body.buttonList:addSpacer( CoD.CoD9Button.Height * 1 )
		local optionButtonHorizontalGap = 220
		local gameType = Engine.DvarString( nil, "ui_gameType" )
		local map = Engine.DvarString( nil, "ui_mapname" )
		local shouldBeShown = false
		local mapFound = false
		local gameOptionName, gameOption, button = nil
		for index, gameOption in pairs( CoD.Zombie.GameOptions ) do
			shouldBeShown = false
			if gameOption.gameTypes ~= nil then
				for index, element in pairs( gameOption.gameTypes ) do
					if element == gameType then
						shouldBeShown = true
					end
				end
			else
				shouldBeShown = true
			end
			if shouldBeShown and gameOption.maps ~= nil then
				for index, element in pairs( gameOption.maps ) do
					if element == map then
						mapFound = true
						break
					end
				end
				if not mapFound then
					shouldBeShown = false
				end
			end
			if shouldBeShown then
				button = self.body.buttonList:addGametypeSettingLeftRightSelector( self.panelManager.m_ownerController, Engine.Localize( gameOption.name ), gameOption.id, Engine.Localize( gameOption.hintText ), optionButtonHorizontalGap )
				for index = 1, #gameOption.labels, 1 do
					button:addChoice( self.panelManager.m_ownerController, Engine.Localize( gameOption.labels[index] ), gameOption.values[index] )
				end
				button:registerEventHandler( "gain_focus", CoD.PrivateGameLobby.ButtonGainFocusZombie )
				button:registerEventHandler( "lose_focus", CoD.PrivateGameLobby.ButtonLoseFocusZombie )
				button:registerEventHandler( "start_game", button.disable )
				button:registerEventHandler( "cancel_start_game", button.enable )
				button:registerEventHandler( "gamelobby_update", CoD.PrivateGameLobby.ButtonGameLobbyUpdate_Zombie )
			end
		end
		self:registerEventHandler( "enable_sliding_zm", CoD.PrivateGameLobby.EnableSlidingZombie )
		self.defaultFocusButton = self.body.startMatchButton
		self.body.buttonList.hintText:setAlpha( 1 )
		if true == CoD.useController and not self:restoreState() then
			self.body.buttonList:selectElementIndex( 1 )
		end
	else
		self.defaultFocusButton = nil
		self.body.buttonList.hintText:setAlpha( 0 )
	end
end

CoD.PrivateGameLobby.ButtonGameLobbyUpdate_Zombie = function ( button, event )
	button:refreshChoice()
	button:dispatchEventToChildren( event )
end

CoD.PrivateGameLobby.ButtonGainFocusZombie = function ( button, event )
	local retVal = CoD.CoD9Button.GainFocus( button, event )
	button:dispatchEventToParent( {
		name = "enable_sliding_zm",
		enableSliding = false,
		controller = event.controller
	} )
	return retVal
end

CoD.PrivateGameLobby.ButtonLoseFocusZombie = function ( button, event )
	CoD.CoD9Button.LoseFocus( button, event )
	button:dispatchEventToParent( {
		name = "enable_sliding_zm",
		enableSliding = true,
		controller = event.controller
	} )
end

CoD.PrivateGameLobby.EnableSlidingZombie = function ( buttonPane, event )
	buttonPane.panelManager.slidingEnabled = event.enableSliding
end

CoD.PrivateGameLobby.PopulateButtonPrompts_Project_Multiplayer = function ( self )
	
end

CoD.PrivateGameLobby.PopulateButtonPrompts_Project_Zombie = function ( self )
	
end

CoD.PrivateGameLobby.PopulateButtons_Project = function ( self, isHost )
	if CoD.isZombie == true then
		CoD.PrivateGameLobby.PopulateButtons_Project_Zombie( self, isHost )
	else
		CoD.PrivateGameLobby.PopulateButtons_Project_Multiplayer( self, isHost )
	end
end

local PrivateGameLobby_AllowTeamSwitching = function ( self, event )
	if Engine.GetGametypeSetting( "allowSpectating" ) == 1 then
		return true
	elseif Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 then
		return false
	elseif CoD.IsGametypeTeamBased() == true then
		if CoD.isZombie == true and Engine.GetGametypeSetting( "teamCount" ) == 1 then
			return false
		else
			return true
		end
	else
		return false
	end
end

CoD.PrivateGameLobby.PopulateButtonPrompts_Project = function ( self, isHost )
	if CoD.isZombie == true then
		CoD.PrivateGameLobby.PopulateButtonPrompts_Project_Zombie( self, isHost )
	else
		CoD.PrivateGameLobby.PopulateButtonPrompts_Project_Multiplayer( self, isHost )
	end
	if self.cycleTeamButtonPrompt ~= nil then
		self.cycleTeamButtonPrompt:close()
	end
	if PrivateGameLobby_AllowTeamSwitching() then
		self.cycleTeamButtonPrompt = CoD.DualButtonPrompt.new( "shoulderl", Engine.Localize( "MPUI_CHANGE_ROLE" ), "shoulderr", self, "button_prompt_team_prev", "button_prompt_team_next" )
		CoD.PrivateGameLobby.SetupTeamCycling( self )
		self:addRightButtonPrompt( self.cycleTeamButtonPrompt )
		self:registerEventHandler( "button_prompt_team_prev", CoD.PrivateGameLobby.ButtonPrompt_TeamPrev )
		self:registerEventHandler( "button_prompt_team_next", CoD.PrivateGameLobby.ButtonPrompt_TeamNext )
		self:registerEventHandler( "current_panel_changed", CoD.PrivateGameLobby.CurrentPanelChanged )
		self:registerEventHandler( "party_update_status", CoD.PrivateGameLobby.ButtonPrompt_PartyUpdateStatus )
	else
		self:registerEventHandler( "party_update_status", CoD.GameLobby.UpdateStatusText )
	end
end

CoD.PrivateGameLobby.LeaveLobby_Project_Multiplayer = function ( self, event )
	Engine.SetDvar( "invite_visible", 1 )
	Engine.SetGametype( Dvar.ui_gametype:get() )
	local controller = event.controller
	local isPrivatePartyHost = Engine.PrivatePartyHost()
	if Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true or Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
		Engine.ExecNow( event.controller, "xstopallparties" )
		CoD.resetGameModes()
		if CoD.isPS3 then
			Engine.ExecNow( event.controller, "signoutSubUsers" )
		end
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) == true then
		if not isPrivatePartyHost or event.name ~= nil and event.name == "confirm_leave_alone" then
			Engine.ExecNow( event.controller, "xstopallparties" )
		else
			Engine.ExecNow( event.controller, "xstoppartykeeptogether" )
		end
		CoD.resetGameModes()
		CoD.StartMainLobby( event.controller )
	elseif Engine.IsSignedInToDemonware( event.controller ) == true and Engine.HasMPPrivileges( event.controller ) then
		Engine.ExecNow( event.controller, "xstoppartykeeptogether" )
		CoD.resetGameModes()
		CoD.StartMainLobby( event.controller )
	else
		Engine.ExecNow( event.controller, "xstopprivateparty" )
		CoD.resetGameModes()
	end
	Engine.SessionModeSetPrivate( false )
	self:processEvent( {
		name = "lose_host"
	} )
	self:goBack( event )
end

CoD.PrivateGameLobby.LeaveLobby_Project = function ( self, event )
	CoD.PrivateGameLobby.LeaveLobby_Project_Multiplayer( self, event )
end

CoD.PrivateGameLobby.OpenSetupGameFlyout = function ( self, event )
	if self.buttonPane ~= nil and self.buttonPane.body ~= nil then
		CoD.PrivateGameLobby.RemoveSetupGameFlyout( self.buttonPane )
		CoD.PrivateGameLobby.AddSetupGameFlyout( self.buttonPane )
		self.panelManager.slidingEnabled = false
		CoD.ButtonList.DisableInput( self.buttonPane.body.buttonList )
		self.buttonPane.body.buttonList:animateToState( "disabled" )
		self.buttonPane.body.setupGameFlyoutContainer:processEvent( {
			name = "gain_focus"
		} )
		self:registerEventHandler( "button_prompt_back", CoD.PrivateGameLobby.CloseSetupGameFlyout )
	end
end

CoD.PrivateGameLobby.CloseSetupGameFlyout = function ( self, event )
	if self.buttonPane ~= nil and self.buttonPane.body ~= nil and self.buttonPane.body.setupGameFlyoutContainer ~= nil then
		CoD.PrivateGameLobby.RemoveSetupGameFlyout( self.buttonPane )
		CoD.ButtonList.EnableInput( self.buttonPane.body.buttonList )
		self.buttonPane.body.buttonList:animateToState( "default" )
		self:registerEventHandler( "button_prompt_back", CoD.PrivateGameLobby.ButtonBack )
		self.panelManager.slidingEnabled = true
		Engine.PlaySound( "cac_cmn_backout" )
	end
end

CoD.PrivateGameLobby.OpenBotsMenu = function ( self, event )
	Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_EDITING_GAME_OPTIONS )
	self:openPopup( "EditBotOptions", event.controller )
	Engine.PlaySound( "cac_screen_fade" )
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

CoD.PrivateGameLobby.OpenEditGameOptionsMenu = function ( self, event )
	Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_EDITING_GAME_OPTIONS )
	self:openPopup( "EditGameOptions", event.controller )
	Engine.PlaySound( "cac_screen_fade" )
end

CoD.PrivateGameLobby.OpenViewGameOptionsMenu = function ( self, event )
	Engine.PartyHostSetUIState( CoD.PARTYHOST_STATE_EDITING_GAME_OPTIONS )
	self:openPopup( "ViewGameOptions", event.controller )
end

CoD.PrivateGameLobby.CloseAllPopups = function ( self, event )
	CoD.PrivateGameLobby.CloseSetupGameFlyout( self, event )
	CoD.Menu.MenuChanged( self, event )
end

CoD.PrivateGameLobby.RegisterEventHandler_Project = function ( self )
	self:registerEventHandler( "open_setup_game_flyout", CoD.PrivateGameLobby.OpenSetupGameFlyout )
	self:registerEventHandler( "open_bots_menu", CoD.PrivateGameLobby.OpenBotsMenu )
	self:registerEventHandler( "open_change_map", CoD.PrivateGameLobby.OpenChangeMap )
	self:registerEventHandler( "open_change_game_mode", CoD.PrivateGameLobby.OpenChangeGameMode )
	self:registerEventHandler( "open_editGameOptions_menu", CoD.PrivateGameLobby.OpenEditGameOptionsMenu )
	self:registerEventHandler( "open_viewGameOptions_menu", CoD.PrivateGameLobby.OpenViewGameOptionsMenu )
	self:registerEventHandler( "open_custom_leaderboard", CoD.PrivateGameLobby.OpenCustomLeaderboard )
	self:registerEventHandler( "close_all_popups", CoD.PrivateGameLobby.CloseAllPopups )
end

