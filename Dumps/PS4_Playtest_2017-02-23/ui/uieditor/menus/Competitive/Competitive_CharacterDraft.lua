require( "ui.uieditor.widgets.Competitive.Competitive_CharacterDraft_Player" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_WhiteGlow" )

local PostLoadFunc = function ( self, controller )
	local pregameRoot = Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame" )
	local clientStateModel = Engine.CreateModel( pregameRoot, "clientState" )
	self:subscribeToModel( clientStateModel, function ( model )
		local clientState = Engine.GetModelValue( model )
		if clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_SELECTING_CHARACTER then
			OpenChooseCharacterLoadout( nil, nil, controller, LuaEnum.CHOOSE_CHARACTER_OPENED_FROM.DRAFT, self )
		elseif clientState == Enum.LobbyClientPregameState.LOBBY_CLIENT_PREGAME_STATE_CHARACTER_SELECTION_FORCED then
			local xuid = Engine.GetXUIDString( controller )
			local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			for index, client in ipairs( session.sessionClients ) do
				if client.xuid == xuid and client.characterDraft.loadout ~= Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID then
					local characterIndex = client.characterDraft.characterIndex
					local loadout = client.characterDraft.loadout
					Engine.SetHero( controller, CoD.PlayerRoleUtility.customizationMode, characterIndex )
					Engine.SetHeroLoadoutItem( controller, CoD.PlayerRoleUtility.customizationMode, characterIndex, loadout )
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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Competitive_CharacterDraft.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:subscribeToGlobalModel( controller, "MapInfo", "mapImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Background:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Background )
	self.Background = Background
	
	local Darken = LUI.UIImage.new()
	Darken:setLeftRight( 0, 1, 0, 0 )
	Darken:setTopBottom( 0, 1, 0, 0 )
	Darken:setRGB( 0, 0, 0 )
	Darken:setAlpha( 0.39 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local StartMenuWhiteGlow = CoD.StartMenu_WhiteGlow.new( self, controller )
	StartMenuWhiteGlow:setLeftRight( 0, 1, 774, -770 )
	StartMenuWhiteGlow:setTopBottom( 0, 1, 116, -920 )
	self:addElement( StartMenuWhiteGlow )
	self.StartMenuWhiteGlow = StartMenuWhiteGlow
	
	local SpecialistDraft = LUI.UIText.new()
	SpecialistDraft:setLeftRight( 0, 0, 775, 1150 )
	SpecialistDraft:setTopBottom( 0, 0, 115, 160 )
	SpecialistDraft:setRGB( 0, 0, 0 )
	SpecialistDraft:setText( Engine.Localize( "SPECIALIST DRAFT" ) )
	SpecialistDraft:setTTF( "fonts/escom.ttf" )
	SpecialistDraft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SpecialistDraft:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialistDraft )
	self.SpecialistDraft = SpecialistDraft
	
	local VSpanel = CoD.FE_ButtonPanel.new( self, controller )
	VSpanel:setLeftRight( 0.5, 0.5, -960, 960 )
	VSpanel:setTopBottom( 0.5, 0.5, -356, -282 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.26 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local Team2IconAndNameWidgetContainer = CoD.TeamIconAndNameWidgetContainer.new( self, controller )
	Team2IconAndNameWidgetContainer:setLeftRight( 0, 0, 1265, 1782 )
	Team2IconAndNameWidgetContainer:setTopBottom( 0, 0, 157, 285 )
	self:addElement( Team2IconAndNameWidgetContainer )
	self.Team2IconAndNameWidgetContainer = Team2IconAndNameWidgetContainer
	
	local VSlabel = LUI.UIText.new()
	VSlabel:setLeftRight( 0.5, 0.5, -105, 110 )
	VSlabel:setTopBottom( 0, 0, 172, 276 )
	VSlabel:setText( Engine.Localize( "VS" ) )
	VSlabel:setTTF( "fonts/escom.ttf" )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VSlabel )
	self.VSlabel = VSlabel
	
	local Team1IconAndNameWidgetContainer = CoD.TeamIconAndNameWidgetContainer.new( self, controller )
	Team1IconAndNameWidgetContainer:setLeftRight( 0, 0, 161, 679 )
	Team1IconAndNameWidgetContainer:setTopBottom( 0, 0, 148, 276 )
	self:addElement( Team1IconAndNameWidgetContainer )
	self.Team1IconAndNameWidgetContainer = Team1IconAndNameWidgetContainer
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 730, 1295 )
	Title:setTopBottom( 0, 0, 63, 103 )
	Title:setText( Engine.Localize( GetGameModeOnMapName( "Domination on Stronghold" ) ) )
	Title:setTTF( "fonts/UnitedSansRgMd.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local GameModeBackground = CoD.FE_ButtonPanel.new( self, controller )
	GameModeBackground:setLeftRight( 0.5, 0.5, -346, 346 )
	GameModeBackground:setTopBottom( 0.5, 0.5, -500, -425 )
	GameModeBackground:setRGB( 0, 0, 0 )
	GameModeBackground:setAlpha( 0.26 )
	self:addElement( GameModeBackground )
	self.GameModeBackground = GameModeBackground
	
	local GamemodeIcon = LUI.UIImage.new()
	GamemodeIcon:setLeftRight( 0, 0, 618, 740 )
	GamemodeIcon:setTopBottom( 0, 0, 17, 139 )
	GamemodeIcon:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GamemodeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GamemodeIcon )
	self.GamemodeIcon = GamemodeIcon
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( self, controller )
	FEButtonPanel0:setLeftRight( 0.5, 0.5, -286, 288 )
	FEButtonPanel0:setTopBottom( 0.5, 0.5, -252, 189 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.26 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local StartMenuWhiteGlow0 = CoD.StartMenu_WhiteGlow.new( self, controller )
	StartMenuWhiteGlow0:setLeftRight( 0, 0, 917, 1005 )
	StartMenuWhiteGlow0:setTopBottom( 0, 0, 294, 382 )
	self:addElement( StartMenuWhiteGlow0 )
	self.StartMenuWhiteGlow0 = StartMenuWhiteGlow0
	
	local Timer = LUI.UIText.new()
	Timer:setLeftRight( 0, 0, 917, 1005 )
	Timer:setTopBottom( 0, 0, 298, 379 )
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
	TimerStatus:setLeftRight( 0, 0, 674, 1248 )
	TimerStatus:setTopBottom( 0, 0, 383, 415 )
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
	
	local Team1List = LUI.UIList.new( self, controller, 6, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "teamString" ) ) == "1"
	end, false, false, 0, 0, false, false )
	Team1List:makeFocusable()
	Team1List:setLeftRight( 0, 0, 96, 733 )
	Team1List:setTopBottom( 0, 0, 291, 733 )
	Team1List:setWidgetType( CoD.Competitive_CharacterDraft_Player )
	Team1List:setVerticalCount( 4 )
	Team1List:setSpacing( 6 )
	Team1List:setDataSource( "PregameClientList" )
	self:addElement( Team1List )
	self.Team1List = Team1List
	
	local Team2List = LUI.UIList.new( self, controller, 6, 0, function ( model )
		return Engine.GetModelValue( Engine.GetModel( model, "teamString" ) ) == "2"
	end, false, false, 0, 0, false, false )
	Team2List:makeFocusable()
	Team2List:setLeftRight( 0, 0, 1187, 1824 )
	Team2List:setTopBottom( 0, 0, 289, 731 )
	Team2List:setWidgetType( CoD.Competitive_CharacterDraft_Player )
	Team2List:setVerticalCount( 4 )
	Team2List:setSpacing( 6 )
	Team2List:setDataSource( "PregameClientList" )
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

