require( "ui_mp.T6.GameOptions" )

CoD.ViewGameOptions = {}
CoD.ViewGameOptions.AddOptionsForGametype = {}
CoD.ViewGameOptions.Update = function ( self, event )
	self:processEvent( {
		name = "button_update"
	} )
	Engine.PlaySound( CoD.CAC.ButtonActionSound )
end

CoD.ViewGameOptions.Reopen = function ( self, event )
	local controller = self.m_ownerController
	local occludedMenu = self.occludedMenu
	self:goBack( controller )
	occludedMenu:openPopup( "ViewGameOptions", controller )
end

CoD.ViewGameOptions.ConsumeButtonsCreated = function ( self, controller )
	CoD.GameOptions.AddSelectorButtons( self, controller, nil, false )
	self.buttonList:addSpacer( CoD.CoD9Button.Height )
	for i, v in ipairs( self.options ) do
		self.options[i] = nil
	end
end

CoD.ViewGameOptions.AddGametypeSpecificOptions = function ( self, controller, editable )
	local gametype = Engine.DvarString( nil, "ui_gametype" )
	self.options = {}
	if gametype and CoD.ViewGameOptions.AddOptionsForGametype[gametype] then
		CoD.ViewGameOptions.AddOptionsForGametype[gametype]( self, controller )
	end
	CoD.GameOptions.AddSelectorButtons( self, controller, self.options, editable )
end

CoD.ViewGameOptions.AddOptionsForGametype.dm = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.dm( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.tdm = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.tdm( self, controller )
	CoD.GameOptions.Button_MultiTeam_AddChoices( self, controller )
	CoD.ViewGameOptions.ConsumeButtonsCreated( self, controller )
	CoD.GameOptions.Button_RoundBased_AddChoices( self, controller )
	CoD.GameOptions.Button_RoundScoreCarry_AddChoices( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.pur = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.pur( self, controller )
	CoD.GameOptions.AddOptionsForGametype.pur( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.sd = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.sd( self, controller )
	CoD.GameOptions.AddOptionsForGametype.sd( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.sr = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.sr( self, controller )
	CoD.GameOptions.AddOptionsForGametype.sr( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.sab = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.sab( self, controller )
	CoD.GameOptions.AddOptionsForGametype.sab( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.dom = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.dom( self, controller )
	CoD.ViewGameOptions.ConsumeButtonsCreated( self, controller )
	CoD.GameOptions.AddOptionsForGametype.dom( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.koth = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.koth( self, controller )
	CoD.GameOptions.AddOptionsForGametype.koth( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.hq = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.hq( self, controller )
	CoD.GameOptions.AddOptionsForGametype.hq( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.ctf = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.ctf( self, controller )
	CoD.GameOptions.AddOptionsForGametype.ctf( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.hun = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.hun( self, controller )
	CoD.GameOptions.AddOptionsForGametype.hun( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.dem = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.dem( self, controller )
	CoD.GameOptions.AddOptionsForGametype.dem( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.conf = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.conf( self, controller )
	CoD.GameOptions.AddOptionsForGametype.conf( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.tdef = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.tdef( self, controller )
	CoD.GameOptions.AddOptionsForGametype.tdef( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.bwars = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.bwars( self, controller )
	CoD.GameOptions.AddOptionsForGametype.bwars( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.hack = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.hack( self, controller )
	CoD.ViewGameOptions.ConsumeButtonsCreated( self, controller )
	CoD.GameOptions.AddOptionsForGametype.hack( self, controller )
end

CoD.ViewGameOptions.AddOptionsForGametype.fr = function ( self, controller )
	CoD.GameOptions.AddBaseOptionsForGametype.fr( self, controller )
	CoD.GameOptions.AddOptionsForGametype.fr( self, controller )
end

CoD.ViewGameOptions.AddElements = function ( self, controller )
	self:addBackButton()
	self:registerEventHandler( "game_options_update", CoD.ViewGameOptions.Update )
	self:registerEventHandler( "gametype_update", CoD.ViewGameOptions.Reopen )
	local gametype = Engine.DvarString( nil, "ui_gametype" )
	local gamemodeName = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "name_ref_caps" )
	local gamemodeDesc = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "description" )
	local gamemodeImage = Engine.StructTableLookupString( CoD.gametypesStructTable, "name", gametype, "image" )
	local iconSize = 200
	local iconOffset = 180
	local gameModeDescWidth = 250
	local top = CoD.Menu.TitleHeight
	self.gameModeIcon = LUI.UIImage.new()
	self.gameModeIcon:setTopBottom( true, false, top, top + iconSize )
	self.gameModeIcon:setLeftRight( false, false, iconOffset, iconSize + iconOffset )
	self.gameModeIcon:setImage( gamemodeImage )
	self:addElement( self.gameModeIcon )
	self.gametypeLabel = LUI.UIText.new()
	self.gametypeLabel:setTopBottom( true, false, top + iconSize, top + iconSize + CoD.textSize.Condensed )
	self.gametypeLabel:setLeftRight( false, false, iconOffset, iconSize + iconOffset )
	self.gametypeLabel:setFont( CoD.fonts.Big )
	self.gametypeLabel:setAlignment( LUI.Alignment.Left )
	self.gametypeLabel:setText( Engine.Localize( gamemodeName ) )
	self:addElement( self.gametypeLabel )
	self.gametypeDesc = LUI.UIText.new()
	self.gametypeDesc:setTopBottom( true, false, top + iconSize + CoD.textSize.Condensed, top + iconSize + CoD.textSize.Condensed + CoD.textSize.ExtraSmall )
	self.gametypeDesc:setLeftRight( false, false, iconOffset, iconOffset + gameModeDescWidth )
	self.gametypeDesc:setFont( CoD.fonts.Big )
	self.gametypeDesc:setAlignment( LUI.Alignment.Left )
	self.gametypeDesc:setText( Engine.Localize( gamemodeDesc ) )
	self:addElement( self.gametypeDesc )
	local buttonListContainer = LUI.UIElement.new()
	buttonListContainer:setTopBottom( true, false, 10, 10 + CoD.CoD9Button.Height * 17 )
	buttonListContainer:setLeftRight( true, true, 0, 0 )
	buttonListContainer:setUseStencil( true )
	self:addElement( buttonListContainer )
	self.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.ButtonList.DefaultWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = top,
		bottom = 0
	} )
	self.buttonList.id = self.id .. "buttonList"
	buttonListContainer:addElement( self.buttonList )
	CoD.ViewGameOptions.AddGametypeSpecificOptions( self, controller, false )
	self.buttonList:addSpacer( CoD.CoD9Button.Height )
	CoD.GameOptions.AddBotSpecificOptions( self, controller, false )
	if not self.buttonList:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus"
		} )
	end
end

LUI.createMenu.ViewGameOptions = function ( controller )
	local viewGameOptionsMenu = CoD.Menu.New( "ViewGameOptions" )
	viewGameOptionsMenu:addLargePopupBackground()
	viewGameOptionsMenu.m_ownerController = controller
	viewGameOptionsMenu:addTitle( "" )
	local titleText = Engine.Localize( "MPUI_VIEW_GAME_OPTIONS_CAPS" )
	viewGameOptionsMenu:setTitle( titleText )
	Engine.ExecNow( controller, "beginCustomGametypeChanges" )
	CoD.ViewGameOptions.AddElements( viewGameOptionsMenu, controller )
	return viewGameOptionsMenu
end

