require( "ui.uieditor.widgets.Lobby.LANServerBrowser.LANServerBrowserDetails" )
require( "ui.uieditor.widgets.Lobby.LocalServerRow" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleContainerNoLoc" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

local PostLoadFunc = function ( self, controller )
	if CoD.isPC and Dvar.ui_execdemo_gamescom:get() then
		self.Title:setText( Engine.Localize( "MENU_FIND_GAME_CAPS" ) )
		self.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_FIND_GAME_CAPS" ) )
	end
	CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( self, controller )
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
	self:addElement( background )
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOverlay.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( false, false, -638, 642 )
	Background0:setTopBottom( false, false, -360, 360 )
	Background0:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1282 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.17 )
	self:addElement( Background )
	self.Background = Background
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -640, 642 )
	FooterBacking:setTopBottom( false, false, 316, 371 )
	FooterBacking:setRGB( 0, 0, 0 )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Topbanner = LUI.UIImage.new()
	Topbanner:setLeftRight( true, false, 0, 1285 )
	Topbanner:setTopBottom( true, false, 84, 122 )
	Topbanner:setRGB( 0.23, 0.23, 0.23 )
	Topbanner:setAlpha( 0.8 )
	self:addElement( Topbanner )
	self.Topbanner = Topbanner
	
	local LANServerBrowserDetails = CoD.LANServerBrowserDetails.new( menu, controller )
	LANServerBrowserDetails:setLeftRight( true, false, 803, 1190 )
	LANServerBrowserDetails:setTopBottom( true, false, 138.5, 698.5 )
	LANServerBrowserDetails:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsLANServerBrowserEmpty()
			end
		}
	} )
	LANServerBrowserDetails:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot.count" ), function ( model )
		menu:updateElementState( LANServerBrowserDetails, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverListRoot.count"
		} )
	end )
	self:addElement( LANServerBrowserDetails )
	self.LANServerBrowserDetails = LANServerBrowserDetails
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local Servers = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Servers:makeFocusable()
	Servers:setLeftRight( true, false, 96, 792 )
	Servers:setTopBottom( true, false, 138.5, 649.5 )
	Servers:setDataSource( "LocalServer" )
	Servers:setWidgetType( CoD.LocalServerRow )
	Servers:setVerticalCount( 19 )
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
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
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
	menu:AddButtonCallbackFunction( Servers, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		JoinSystemLinkServer( self, element, controller )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( Servers )
	self.Servers = Servers
	
	local Status = LUI.UITightText.new()
	Status:setLeftRight( true, false, 661.5, 716.5 )
	Status:setTopBottom( true, false, 94.5, 114.5 )
	Status:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	Status:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Status )
	self.Status = Status
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( true, false, 464, 505 )
	GameType:setTopBottom( true, false, 94.5, 114.5 )
	GameType:setText( Engine.Localize( "MODE" ) )
	GameType:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( GameType )
	self.GameType = GameType
	
	local PlayerCount = LUI.UITightText.new()
	PlayerCount:setLeftRight( true, false, 368, 432 )
	PlayerCount:setTopBottom( true, false, 94.5, 114.5 )
	PlayerCount:setText( Engine.Localize( "MENU_NUMPLAYERS_CAPS" ) )
	PlayerCount:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( PlayerCount )
	self.PlayerCount = PlayerCount
	
	local HostName = LUI.UITightText.new()
	HostName:setLeftRight( true, false, 106, 143 )
	HostName:setTopBottom( true, false, 94.5, 114.5 )
	HostName:setText( Engine.Localize( "MENU_HOST_CAPS" ) )
	HostName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( HostName )
	self.HostName = HostName
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, -192, 64 )
	Title:setTopBottom( true, false, -183, -129 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local FE3dTitleContainer0 = CoD.cac_3dTitleContainerNoLoc.new( menu, controller )
	FE3dTitleContainer0:setLeftRight( true, false, -74, 457 )
	FE3dTitleContainer0:setTopBottom( true, false, 0, 146 )
	FE3dTitleContainer0.circles:setRGB( 0, 0, 0 )
	FE3dTitleContainer0.diaglrg:setRGB( 0, 0, 0 )
	FE3dTitleContainer0.diagsm:setRGB( 0, 0, 0 )
	FE3dTitleContainer0.centersquare:setRGB( 0, 0, 0 )
	FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	self:addElement( FE3dTitleContainer0 )
	self.FE3dTitleContainer0 = FE3dTitleContainer0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 1285 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( menu, controller )
	feFooterContainerNOTLobby:setLeftRight( true, false, -0.58, 1279.42 )
	feFooterContainerNOTLobby:setTopBottom( true, false, 653, 718 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	LANServerBrowserDetails:linkToElementModel( Servers, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LANServerBrowserDetails.MapImage:setImage( RegisterImage( MapNameToMapImage( modelValue ) ) )
		end
	end )
	LANServerBrowserDetails:linkToElementModel( Servers, "gameType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LANServerBrowserDetails.GameType:setText( Engine.Localize( GameTypeToLocalizedGameType( modelValue ) ) )
		end
	end )
	LANServerBrowserDetails:linkToElementModel( Servers, "mapName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LANServerBrowserDetails.MapName:setText( Engine.Localize( MapNameToLocalizedMapName( modelValue ) ) )
		end
	end )
	LANServerBrowserDetails.navigation = {
		left = Servers
	}
	Servers.navigation = {
		right = LANServerBrowserDetails
	}
	self:registerEventHandler( "filter_mode_changed", function ( element, event )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetLobbyServerBrowserFilterForE3( self, element, controller )
		RefreshServerList( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "X", function ( element, menu, controller, model )
		RefreshServerList( self, controller )
		PlaySoundSetSound( self, "partyease_slide_right" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_REFRESH" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "Y", function ( element, menu, controller, model )
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
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if not self:restoreState() then
		self.Servers:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LANServerBrowserDetails:close()
		self.Servers:close()
		self.FE3dTitleContainer0:close()
		self.feFooterContainerNOTLobby:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOverlay.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

