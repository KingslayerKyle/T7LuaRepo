require( "ui.uieditor.widgets.StartMenu.StartMenu_WhiteGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetContainer" )
require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_Player" )

local PostLoadFunc = function ( self, controller )
	local pregameRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
	local clientStateModel = Engine.CreateModel( pregameRoot, "clientState" )
	self:subscribeToModel( clientStateModel, function ( model )
		local clientState = Engine.GetModelValue( model )
		if clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING_CHARACTER then
			OpenChooseCharacterLoadout( nil, nil, controller, nil, self )
		elseif clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_CHARACTER_SELECTION_FORCED then
			local xuid = Engine.GetXUID( controller )
			local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			for index, client in ipairs( session.sessionClients ) do
				if client.xuid == xuid then
					local characterIndex = client.characterDraft.characterIndex
					local loadout = client.characterDraft.loadout
					Engine.SetHero( controller, CoD.perController[controller].customizationMode, characterIndex )
					Engine.SetHeroLoadoutItem( controller, CoD.perController[controller].customizationMode, characterIndex, loadout )
					return 
				end
			end
		end
	end )
end

LUI.createMenu.Competitive_CharacterDraft = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Competitive_CharacterDraft" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_CharacterDraft.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:subscribeToGlobalModel( controller, "MapInfo", "mapImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Background:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	local Darken = LUI.UIImage.new()
	Darken:setLeftRight( true, true, 0, 0 )
	Darken:setTopBottom( true, true, 0, 0 )
	Darken:setRGB( 0, 0, 0 )
	Darken:setAlpha( 0.39 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local StartMenuWhiteGlow = CoD.StartMenu_WhiteGlow.new( self, controller )
	StartMenuWhiteGlow:setLeftRight( true, true, 516.19, -513.5 )
	StartMenuWhiteGlow:setTopBottom( true, true, 77, -613 )
	self:addElement( StartMenuWhiteGlow )
	self.StartMenuWhiteGlow = StartMenuWhiteGlow
	
	local SpecialistDraft = LUI.UIText.new()
	SpecialistDraft:setLeftRight( true, false, 516.19, 766.5 )
	SpecialistDraft:setTopBottom( true, false, 77, 107 )
	SpecialistDraft:setRGB( 0, 0, 0 )
	SpecialistDraft:setText( Engine.Localize( "SPECIALIST DRAFT" ) )
	SpecialistDraft:setTTF( "fonts/escom.ttf" )
	SpecialistDraft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SpecialistDraft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialistDraft )
	self.SpecialistDraft = SpecialistDraft
	
	local VSpanel = CoD.FE_ButtonPanel.new( self, controller )
	VSpanel:setLeftRight( false, false, -640, 640 )
	VSpanel:setTopBottom( false, false, -237, -188 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.26 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local Team2IconAndNameWidgetContainer = CoD.TeamIconAndNameWidgetContainer.new( self, controller )
	Team2IconAndNameWidgetContainer:setLeftRight( true, false, 843.5, 1188.5 )
	Team2IconAndNameWidgetContainer:setTopBottom( true, false, 105, 190 )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionIconSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionIconSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	Team2IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team2IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Team2IconAndNameWidgetContainer )
	self.Team2IconAndNameWidgetContainer = Team2IconAndNameWidgetContainer
	
	local VSlabel = LUI.UIText.new()
	VSlabel:setLeftRight( false, false, -70.34, 73.03 )
	VSlabel:setTopBottom( true, false, 115, 184 )
	VSlabel:setText( Engine.Localize( "VS" ) )
	VSlabel:setTTF( "fonts/escom.ttf" )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VSlabel )
	self.VSlabel = VSlabel
	
	local Team1IconAndNameWidgetContainer = CoD.TeamIconAndNameWidgetContainer.new( self, controller )
	Team1IconAndNameWidgetContainer:setLeftRight( true, false, 107.47, 452.47 )
	Team1IconAndNameWidgetContainer:setTopBottom( true, false, 99, 184 )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionIconSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidget.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionIconSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	Team1IconAndNameWidgetContainer:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Team1IconAndNameWidgetContainer.TeamIconAndNameWidgetForCodCaster.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Team1IconAndNameWidgetContainer )
	self.Team1IconAndNameWidgetContainer = Team1IconAndNameWidgetContainer
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 486.97, 863.41 )
	Title:setTopBottom( true, false, 42, 69 )
	Title:setText( Engine.Localize( GetGameModeOnMapName( "Domination on Stronghold" ) ) )
	Title:setTTF( "fonts/UnitedSansRgMd.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local GameModeBackground = CoD.FE_ButtonPanel.new( self, controller )
	GameModeBackground:setLeftRight( false, false, -230.5, 230.5 )
	GameModeBackground:setTopBottom( false, false, -333, -283 )
	GameModeBackground:setRGB( 0, 0, 0 )
	GameModeBackground:setAlpha( 0.26 )
	self:addElement( GameModeBackground )
	self.GameModeBackground = GameModeBackground
	
	local GamemodeIcon = LUI.UIImage.new()
	GamemodeIcon:setLeftRight( true, false, 411.97, 492.97 )
	GamemodeIcon:setTopBottom( true, false, 11.5, 92.5 )
	GamemodeIcon:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GamemodeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GamemodeIcon )
	self.GamemodeIcon = GamemodeIcon
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( self, controller )
	FEButtonPanel0:setLeftRight( false, false, -190.53, 192.26 )
	FEButtonPanel0:setTopBottom( false, false, -168, 126 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.26 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local StartMenuWhiteGlow0 = CoD.StartMenu_WhiteGlow.new( self, controller )
	StartMenuWhiteGlow0:setLeftRight( true, false, 611.37, 670.37 )
	StartMenuWhiteGlow0:setTopBottom( true, false, 196, 255 )
	self:addElement( StartMenuWhiteGlow0 )
	self.StartMenuWhiteGlow0 = StartMenuWhiteGlow0
	
	local Timer = LUI.UIText.new()
	Timer:setLeftRight( true, false, 611.37, 670.37 )
	Timer:setTopBottom( true, false, 198.5, 252.5 )
	Timer:setRGB( 0, 0, 0 )
	Timer:setTTF( "fonts/escom.ttf" )
	Timer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Timer:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	Timer:subscribeToGlobalModel( controller, "PregameGlobal", "timeleft", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Timer:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local TimerStatus = LUI.UIText.new()
	TimerStatus:setLeftRight( true, false, 449.47, 832.26 )
	TimerStatus:setTopBottom( true, false, 255, 276.5 )
	TimerStatus:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	TimerStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TimerStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	TimerStatus:subscribeToGlobalModel( controller, "PregameGlobal", "status", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TimerStatus:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TimerStatus )
	self.TimerStatus = TimerStatus
	
	local Team1List = LUI.UIList.new( self, controller, 4, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "teamString" ) ) == "1"
	end, false, false, 0, 0, false, true )
	Team1List:makeFocusable()
	Team1List:setLeftRight( true, false, 64, 489 )
	Team1List:setTopBottom( true, false, 193.5, 489.5 )
	Team1List:setDataSource( "PregameClientList" )
	Team1List:setWidgetType( CoD.Competitive_CharacterDraft_Player )
	Team1List:setVerticalCount( 4 )
	Team1List:setSpacing( 4 )
	self:addElement( Team1List )
	self.Team1List = Team1List
	
	local Team2List = LUI.UIList.new( self, controller, 4, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "teamString" ) ) == "2"
	end, false, false, 0, 0, false, true )
	Team2List:makeFocusable()
	Team2List:setLeftRight( true, false, 791, 1216 )
	Team2List:setTopBottom( true, false, 192, 488 )
	Team2List:setDataSource( "PregameClientList" )
	Team2List:setWidgetType( CoD.Competitive_CharacterDraft_Player )
	Team2List:setVerticalCount( 4 )
	Team2List:setSpacing( 4 )
	self:addElement( Team2List )
	self.Team2List = Team2List
	
	Team1List.navigation = {
		right = Team2List
	}
	Team2List.navigation = {
		left = Team1List
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	Team1List.id = "Team1List"
	Team2List.id = "Team2List"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Team1List:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuWhiteGlow:close()
		self.VSpanel:close()
		self.Team2IconAndNameWidgetContainer:close()
		self.Team1IconAndNameWidgetContainer:close()
		self.GameModeBackground:close()
		self.FEButtonPanel0:close()
		self.StartMenuWhiteGlow0:close()
		self.Team1List:close()
		self.Team2List:close()
		self.Background:close()
		self.GamemodeIcon:close()
		self.Timer:close()
		self.TimerStatus:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Competitive_CharacterDraft.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

