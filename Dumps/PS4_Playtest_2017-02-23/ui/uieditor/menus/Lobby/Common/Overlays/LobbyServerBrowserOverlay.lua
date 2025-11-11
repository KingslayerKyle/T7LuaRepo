require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.backgrounds.MP_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.Lobby.LANServerBrowser.LANServerBrowserDetails" )
require( "ui.uieditor.widgets.Lobby.LocalServerRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PostLoadFunc = function ( self, controller )
	if CoD.isPC and Dvar.ui_execdemo_gamescom:get() then
		self.Title:setText( Engine.Localize( "MENU_FIND_GAME_CAPS" ) )
		self.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FIND_GAME_CAPS" ) )
	end
	CoD.LobbyUtility.LobbyLANServerBrowserFilterUpdateEvent( self, controller )
	local background = LUI.UIImage.new( 0.5, 0.5, -640, 640, 0.5, 0.5, -360, 360 )
	background:setRGB( 0, 0, 0 )
	background:setPriority( -100 )
	self:addElement( background )
end

LUI.createMenu.LobbyServerBrowserOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyServerBrowserOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOverlay.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local MPBackground = CoD.MP_Background.new( self, controller )
	MPBackground:setLeftRight( 0, 0, 0, 1920 )
	MPBackground:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( MPBackground )
	self.MPBackground = MPBackground
	
	local FETabIdle0 = CoD.FE_TabIdle.new( self, controller )
	FETabIdle0:setLeftRight( 0, 1, -4, 1916 )
	FETabIdle0:setTopBottom( 0, 0, 124, 187 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local LANServerBrowserDetails = CoD.LANServerBrowserDetails.new( self, controller )
	LANServerBrowserDetails:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsLANServerBrowserEmpty()
			end
		}
	} )
	LANServerBrowserDetails:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot.count" ), function ( model )
		self:updateElementState( LANServerBrowserDetails, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverListRoot.count"
		} )
	end )
	LANServerBrowserDetails:setLeftRight( 0, 0, 1162, 1831 )
	LANServerBrowserDetails:setTopBottom( 0, 0, 222, 1021 )
	self:addElement( LANServerBrowserDetails )
	self.LANServerBrowserDetails = LANServerBrowserDetails
	
	local Servers = LUI.UIList.new( self, controller, 6, 0, nil, false, false, 0, 0, false, false )
	Servers:makeFocusable()
	Servers:setLeftRight( 0, 0, 96, 1131 )
	Servers:setTopBottom( 0, 0, 207, 927 )
	Servers:setWidgetType( CoD.LocalServerRow )
	Servers:setVerticalCount( 11 )
	Servers:setSpacing( 6 )
	Servers:setVerticalCounter( CoD.verticalCounter )
	Servers:setDataSource( "LocalServer" )
	Servers:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		LobbyLANServerPlayerListRefresh( self, element, controller )
		return retVal
	end )
	Servers:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	Servers:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( Servers, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		JoinSystemLinkServer( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( Servers )
	self.Servers = Servers
	
	local StatusTextBox = LUI.UIText.new()
	StatusTextBox:setLeftRight( 0, 1, 925, -789 )
	StatusTextBox:setTopBottom( 0, 0, 140, 176 )
	StatusTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	StatusTextBox:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	StatusTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatusTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StatusTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatusTextBox )
	self.StatusTextBox = StatusTextBox
	
	local GameTypeTextBox = LUI.UIText.new()
	GameTypeTextBox:setLeftRight( 0, 1, 648.5, -1011.5 )
	GameTypeTextBox:setTopBottom( 0, 0, 142, 178 )
	GameTypeTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	GameTypeTextBox:setText( Engine.Localize( "MENU_GAMETYPE_CAPS" ) )
	GameTypeTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameTypeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameTypeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameTypeTextBox )
	self.GameTypeTextBox = GameTypeTextBox
	
	local PlayerCountText = LUI.UIText.new()
	PlayerCountText:setLeftRight( 0, 1, 504, -1272 )
	PlayerCountText:setTopBottom( 0, 0, 143, 178 )
	PlayerCountText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	PlayerCountText:setText( Engine.Localize( "MENU_NUMPLAYERS_CAPS" ) )
	PlayerCountText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PlayerCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PlayerCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayerCountText )
	self.PlayerCountText = PlayerCountText
	
	local HostNameText = LUI.UIText.new()
	HostNameText:setLeftRight( 0, 1, 113, -1449 )
	HostNameText:setTopBottom( 0, 0, 142, 178 )
	HostNameText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	HostNameText:setText( Engine.Localize( "MENU_HOST_CAPS" ) )
	HostNameText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HostNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HostNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HostNameText )
	self.HostNameText = HostNameText
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, -288, 96 )
	Title:setTopBottom( 0, 0, -275, -194 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 142, 1068 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local DetailsTextBox = LUI.UIText.new()
	DetailsTextBox:setLeftRight( 0, 1, 1163, -103 )
	DetailsTextBox:setTopBottom( 0, 0, 140, 176 )
	DetailsTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	DetailsTextBox:setText( Engine.Localize( "MENU_DETAILS_CAPS" ) )
	DetailsTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DetailsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DetailsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DetailsTextBox )
	self.DetailsTextBox = DetailsTextBox
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	LANServerBrowserDetails:linkToElementModel( Servers, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LANServerBrowserDetails.MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	LANServerBrowserDetails:linkToElementModel( Servers, "gameType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LANServerBrowserDetails.GameType:setText( GameTypeToLocalizedGameType( modelValue ) )
		end
	end )
	LANServerBrowserDetails:linkToElementModel( Servers, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LANServerBrowserDetails.MapName:setText( MapNameToLocalizedMapName( modelValue ) )
		end
	end )
	LANServerBrowserDetails.navigation = {
		left = Servers
	}
	Servers.navigation = {
		right = LANServerBrowserDetails
	}
	self:registerEventHandler( "filter_mode_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetLobbyServerBrowserFilterForE3( self, element, controller )
		RefreshServerList( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		RefreshServerList( self, controller )
		PlaySoundSetSound( self, "partyease_slide_right" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REFRESH", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Y", function ( element, menu, controller, model )
		if LANServerBrowserCheckFilterTest( menu, "all" ) then
			CoD.LobbyUtility.LobbyLANServerBrowserSetMainModeFilter( self, controller )
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "cp" ) then
			CoD.LobbyUtility.LobbyLANServerBrowserSetMainModeFilter( self, controller )
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "mp" ) then
			CoD.LobbyUtility.LobbyLANServerBrowserSetMainModeFilter( self, controller )
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "zm" ) then
			CoD.LobbyUtility.LobbyLANServerBrowserSetMainModeFilter( self, controller )
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if LANServerBrowserCheckFilterTest( menu, "all" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_ALL", nil )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "cp" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_CAMPAIGN", nil )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "mp" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_MULTIPLAYER", nil )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "zm" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_ZOMBIES", nil )
			return true
		else
			return false
		end
	end, false )
	LANServerBrowserDetails.id = "LANServerBrowserDetails"
	Servers.id = "Servers"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Servers:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MPBackground:close()
		self.FETabIdle0:close()
		self.LANServerBrowserDetails:close()
		self.Servers:close()
		self.FEMenuLeftGraphics:close()
		self.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	local element = self
	DisableDefaultGainFocus( self, controller )
	return self
end

