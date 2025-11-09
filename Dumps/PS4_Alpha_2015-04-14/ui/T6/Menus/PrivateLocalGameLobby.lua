require( "ui.T6.Menus.PrivateGameLobby" )
require( "ui.T6.Menus.ServerBrowserPopup" )

CoD.PrivateLocalGameLobby = {}
CoD.PrivateLocalGameLobby.PopulateButtons = function ( self )
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
		self.body.startMatchButton:registerEventHandler( "cancel_start_game", self.body.startMatchButton.enable )
		self.body.startMatchButton:registerEventHandler( "gamelobby_update", CoD.PrivateGameLobby.Button_GameLobbyUpdate )
		self.body.gameModeInfo = CoD.Lobby.CreateInfoPane()
		self.defaultFocusButton = self.body.startMatchButton
		CoD.PrivateGameLobby.Button_UpdateHostButton( self.body.startMatchButton )
	end
	CoD.PrivateLocalGameLobby.PopulateButtons_Project( self, isHost )
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
	self.body:addElement( self.body.mapInfoImage )
	CoD.PrivateGameLobby.AddDLCWarning( self, isHost )
	CoD.GameLobby.PopulateButtons( self, mapInfoImageHeight + 45 )
	if not self:restoreState() and CoD.useController == true and self.defaultFocusButton ~= nil then
		self.defaultFocusButton:processEvent( {
			name = "gain_focus"
		} )
	end
	CoD.PrivateGameLobby.UpdateButtonPaneButtonVisibility( self )
end

CoD.PrivateLocalGameLobby.PopulateButtonPaneElements = function ( self )
	CoD.PrivateLocalGameLobby.PopulateButtons( self )
end

CoD.PrivateLocalGameLobby.RebuildButtonPanel = function ( self, event )
	CoD.PanelManager.RebuildPanel( self.panelManager, "buttonPane" )
end

LUI.createMenu.PrivateLocalGameLobby = function ( controller )
	local privateLocalGameLobby = CoD.PrivateGameLobby.New( "PrivateLocalGameLobby", controller )
	privateLocalGameLobby:setPreviousMenu( "MainMenu" )
	local titleText = Engine.Localize( "PLATFORM_SYSTEM_LINK_CAPS" )
	privateLocalGameLobby:addTitle( titleText )
	privateLocalGameLobby.populateButtonPaneElements = CoD.PrivateLocalGameLobby.PopulateButtonPaneElements
	privateLocalGameLobby.populateButtons = CoD.PrivateLocalGameLobby.PopulateButtons
	privateLocalGameLobby:updatePanelFunctions()
	privateLocalGameLobby.populateButtons( privateLocalGameLobby.buttonPane )
	privateLocalGameLobby.panelManager.panels.buttonPane.titleText = titleText
	privateLocalGameLobby:registerEventHandler( "rebuild_button_panel", CoD.PrivateLocalGameLobby.RebuildButtonPanel )
	privateLocalGameLobby.panelManager:setSlidingAllowed( false )
	Engine.PlaySound( "uin_create_game" )
	return privateLocalGameLobby
end

CoD.PrivateLocalGameLobby.PopulateButtons_Project = function ( self, isHost )
	if CoD.isZombie == true then
		CoD.PrivateGameLobby.PopulateButtons_Project_Zombie( self, isHost )
	else
		CoD.PrivateLocalGameLobby.PopulateButtons_Project_Multiplayer( self, isHost )
	end
end

CoD.PrivateLocalGameLobby.PopulateButtons_Project_Multiplayer = function ( self, isHost )
	if isHost == true then
		local setupGameButtonText = Engine.Localize( "MPUI_SETUP_GAME_CAPS" )
		local f6_local0 = {}
		local setupGameButtonTextDim = GetTextDimensions( setupGameButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
		self.body.setupGameButton = self.body.buttonList:addButton( setupGameButtonText )
		self.body.setupGameButton.hintText = Engine.Localize( "MPUI_SETUP_GAME_DESC" )
		self.body.setupGameButton:setActionEventName( "open_setup_game_flyout" )
		self.body.setupGameButton:registerEventHandler( "button_update", CoD.PrivateGameLobby.Button_UpdateHostButton )
		if self.body.widestButtonTextWidth < setupGameButtonTextDim[3] then
			self.body.widestButtonTextWidth = setupGameButtonTextDim[3]
		end
		if not CoD.isCampaign and not Dvar.ui_execdemo:get() then
			local botsButtonText = Engine.Localize( "MENU_SETUP_BOTS_CAPS" )
			local f6_local1 = {}
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
	local f6_local0 = {}
	local createAClassButtonTextDim = GetTextDimensions( createAClassButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
	self.body.createAClassButton = self.body.buttonList:addButton( createAClassButtonText )
	CoD.CACUtility.SetupCACLock( self.body.createAClassButton )
	self.body.createAClassButton:registerEventHandler( "button_action", CoD.GameLobby.Button_CAC )
	if self.body.widestButtonTextWidth < createAClassButtonTextDim[3] then
		self.body.widestButtonTextWidth = createAClassButtonTextDim[3]
	end
	if Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1 then
		local rewardsButtonText = Engine.Localize( "MENU_SCORE_STREAKS_CAPS" )
		local f6_local1 = {}
		local rewardsButtonTextDim = GetTextDimensions( rewardsButtonText, CoD.CoD9Button.Font, CoD.CoD9Button.TextHeight )
		self.body.rewardsButton = self.body.buttonList:addButton( rewardsButtonText )
		self.body.rewardsButton.hintText = Engine.Localize( "FEATURE_KILLSTREAKS_DESC" )
		CoD.SetupButtonLock( self.body.rewardsButton, nil, "FEATURE_KILLSTREAKS", "FEATURE_KILLSTREAKS_DESC" )
		self.body.rewardsButton:registerEventHandler( "button_action", CoD.GameLobby.Button_Rewards )
		if self.body.widestButtonTextWidth < rewardsButtonTextDim[3] then
			self.body.widestButtonTextWidth = rewardsButtonTextDim[3]
		end
	end
	if isHost then
		CoD.PrivateGameLobby.AddRecordButton( self )
	end
end

