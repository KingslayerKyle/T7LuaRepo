require( "ui.uieditor.widgets.backgrounds.MP_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabIdle" )
require( "ui.uieditor.widgets.Lobby.LANServerBrowser.LANServerBrowserDetails" )
require( "ui.uieditor.widgets.Lobby.LocalServerRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	if CoD.isPC and Dvar.ui_execdemo_gamescom:get() then
		f1_arg0.Title:setText( Engine.Localize( "MENU_FIND_GAME_CAPS" ) )
		f1_arg0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FIND_GAME_CAPS" ) )
	end
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f1_arg0, f1_arg1 )
	local self = LUI.UIImage.new( {
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
	self:setPriority( -100 )
	f1_arg0:addElement( self )
end

LUI.createMenu.LobbyServerBrowserOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyServerBrowserOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOverlay.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local MPBackground = CoD.MP_Background.new( self, controller )
	MPBackground:setLeftRight( true, false, 0, 1280 )
	MPBackground:setTopBottom( true, false, 0, 720 )
	self:addElement( MPBackground )
	self.MPBackground = MPBackground
	
	local FETabIdle0 = CoD.FE_TabIdle.new( self, controller )
	FETabIdle0:setLeftRight( true, true, -3, 1277 )
	FETabIdle0:setTopBottom( true, false, 82.5, 124.5 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local LANServerBrowserDetails = CoD.LANServerBrowserDetails.new( self, controller )
	LANServerBrowserDetails:setLeftRight( true, false, 770.5, 1216.5 )
	LANServerBrowserDetails:setTopBottom( true, false, 138, 684 )
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
	self:addElement( LANServerBrowserDetails )
	self.LANServerBrowserDetails = LANServerBrowserDetails
	
	local Servers = LUI.UIList.new( self, controller, 4, 0, nil, false, false, 0, 0, false, false )
	Servers:makeFocusable()
	Servers:setLeftRight( true, false, 64, 754 )
	Servers:setTopBottom( true, false, 148, 608 )
	Servers:setWidgetType( CoD.LocalServerRow )
	Servers:setVerticalCount( 16 )
	Servers:setSpacing( 4 )
	Servers:setVerticalCounter( CoD.verticalCounter )
	Servers:setDataSource( "LocalServer" )
	Servers:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		LobbyLANServerPlayerListRefresh( self, element, controller )
		return f5_local0
	end )
	Servers:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	Servers:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	self:AddButtonCallbackFunction( Servers, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		JoinSystemLinkServer( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Servers )
	self.Servers = Servers
	
	local StatusTextBox = LUI.UIText.new()
	StatusTextBox:setLeftRight( true, true, 616.75, -526 )
	StatusTextBox:setTopBottom( true, false, 93.5, 117.5 )
	StatusTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	StatusTextBox:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	StatusTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatusTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	StatusTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatusTextBox )
	self.StatusTextBox = StatusTextBox
	
	local GameTypeTextBox = LUI.UIText.new()
	GameTypeTextBox:setLeftRight( true, true, 432, -674 )
	GameTypeTextBox:setTopBottom( true, false, 94.5, 118.5 )
	GameTypeTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	GameTypeTextBox:setText( Engine.Localize( "MENU_GAMETYPE_CAPS" ) )
	GameTypeTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameTypeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameTypeTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameTypeTextBox )
	self.GameTypeTextBox = GameTypeTextBox
	
	local PlayerCountText = LUI.UIText.new()
	PlayerCountText:setLeftRight( true, true, 336, -848 )
	PlayerCountText:setTopBottom( true, false, 95, 118.5 )
	PlayerCountText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	PlayerCountText:setText( Engine.Localize( "MENU_NUMPLAYERS_CAPS" ) )
	PlayerCountText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PlayerCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PlayerCountText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PlayerCountText )
	self.PlayerCountText = PlayerCountText
	
	local HostNameText = LUI.UIText.new()
	HostNameText:setLeftRight( true, true, 75, -966 )
	HostNameText:setTopBottom( true, false, 94.5, 118.5 )
	HostNameText:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	HostNameText:setText( Engine.Localize( "MENU_HOST_CAPS" ) )
	HostNameText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HostNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HostNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HostNameText )
	self.HostNameText = HostNameText
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, -192, 64 )
	Title:setTopBottom( true, false, -183, -129 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 95, 712.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local DetailsTextBox = LUI.UIText.new()
	DetailsTextBox:setLeftRight( true, true, 775, -69 )
	DetailsTextBox:setTopBottom( true, false, 93.5, 117.5 )
	DetailsTextBox:setScale( LanguageOverrideNumber( "japanese", 0.75, 1 ) )
	DetailsTextBox:setText( Engine.Localize( "MENU_DETAILS_CAPS" ) )
	DetailsTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DetailsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DetailsTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DetailsTextBox )
	self.DetailsTextBox = DetailsTextBox
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	LANServerBrowserDetails:linkToElementModel( Servers, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			LANServerBrowserDetails.MapImage:setImage( RegisterImage( MapNameToMapImage( mapName ) ) )
		end
	end )
	LANServerBrowserDetails:linkToElementModel( Servers, "gameType", true, function ( model )
		local gameType = Engine.GetModelValue( model )
		if gameType then
			LANServerBrowserDetails.GameType:setText( GameTypeToLocalizedGameType( gameType ) )
		end
	end )
	LANServerBrowserDetails:linkToElementModel( Servers, "mapName", true, function ( model )
		local mapName = Engine.GetModelValue( model )
		if mapName then
			LANServerBrowserDetails.MapName:setText( MapNameToLocalizedMapName( mapName ) )
		end
	end )
	LANServerBrowserDetails.navigation = {
		left = Servers
	}
	Servers.navigation = {
		right = LANServerBrowserDetails
	}
	self:registerEventHandler( "filter_mode_changed", function ( self, event )
		CoD.Menu.UpdateButtonShownState( self, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f14_local0 = nil
		SetLobbyServerBrowserFilterForE3( self, self, controller )
		RefreshServerList( self, controller )
		if not f14_local0 then
			f14_local0 = self:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		RefreshServerList( self, controller )
		PlaySoundSetSound( self, "partyease_slide_right" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REFRESH" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Y", function ( element, menu, controller, model )
		if LANServerBrowserCheckFilterTest( menu, "all" ) then
			LobbyLANServerBrowserSetMainModeFilter( self, controller )
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "cp" ) then
			LobbyLANServerBrowserSetMainModeFilter( self, controller )
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "mp" ) then
			LobbyLANServerBrowserSetMainModeFilter( self, controller )
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "zm" ) then
			LobbyLANServerBrowserSetMainModeFilter( self, controller )
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "toggle" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if LANServerBrowserCheckFilterTest( menu, "all" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_ALL" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "cp" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_CAMPAIGN" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "mp" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_MULTIPLAYER" )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "zm" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_LAN_FILTER_ZOMBIES" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MPBackground:close()
		element.FETabIdle0:close()
		element.LANServerBrowserDetails:close()
		element.Servers:close()
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

