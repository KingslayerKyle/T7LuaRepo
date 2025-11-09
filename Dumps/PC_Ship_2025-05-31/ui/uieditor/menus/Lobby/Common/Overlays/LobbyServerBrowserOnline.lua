require( "ui.uieditor.widgets.backgrounds.MP_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserDetails" )
require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalScrollbar" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.PC.ServerBrowser.ServerBrowserHeader" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

DataSources.ServerBrowserCategories = ListHelper_SetupDataSource( "ServerBrowserCategories", function ( f1_arg0 )
	local f1_local0 = {}
	table.insert( f1_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_MULTIPLAYER_CAPS",
			serverType = Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_INTERNET
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_ZOMBIES_CAPS",
			serverType = Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_ZOMBIES
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_LAN",
			serverType = Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_LAN
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_RECENT_CAPS",
			serverType = Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_HISTORY
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_FRIENDS_CAPS",
			serverType = Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_FRIENDS
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabName = "MENU_FAVORITES_CAPS",
			serverType = Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_FAVORITES
		}
	} )
	table.insert( f1_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f1_local0
end, true )
local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.Tabs.Tabs.grid:setDataSource( "ServerBrowserCategories" )
	f2_arg0.updatingText.subscription = f2_arg0.updatingText:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser" ), "serverListUpdatedCount" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.updatingText:setText( Engine.Localize( "PLATFORM_RETRIEVING_SERVERS", modelValue ) )
		end
	end )
	f2_arg0:linkToElementModel( f2_arg0.Tabs.Tabs.grid, "serverType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.serverType = modelValue
			Engine.SteamServerBrowser_RequestServers( f2_arg0.serverType )
			if f2_arg0.serverType == Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_FAVORITES then
				f2_arg0.ServerDetails:setState( "NoServers" )
			else
				f2_arg0.ServerDetails:setState( "DefaultState" )
			end
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( f2_arg0, "close", function ( element )
		Engine.SteamServerBrowser_CancelServerRequest()
	end )
end

local PreLoadFunc = function ( self, controller )
	self.serverType = Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_INTERNET
	local f6_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "serverBrowser" )
	Engine.SetModelValue( Engine.CreateModel( f6_local0, "serverListCount" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f6_local0, "serverListUpdatedCount" ), 0 )
end

LUI.createMenu.LobbyServerBrowserOnline = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LobbyServerBrowserOnline" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOnline.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local MPBackground = CoD.MP_Background.new( self, controller )
	MPBackground:setLeftRight( true, false, 0, 1280 )
	MPBackground:setTopBottom( true, false, 0, 720 )
	self:addElement( MPBackground )
	self.MPBackground = MPBackground
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 95, 712.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_SERVER_BROWSER_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_SERVER_BROWSER_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local ServerDetails = CoD.ServerBrowserDetails.new( self, controller )
	ServerDetails:setLeftRight( true, false, 799.5, 1199.5 )
	ServerDetails:setTopBottom( true, false, 152, 652 )
	ServerDetails:mergeStateConditions( {
		{
			stateName = "NoServers",
			condition = function ( menu, element, event )
				return IsSteamServerBrowserEmpty()
			end
		},
		{
			stateName = "Favorites",
			condition = function ( menu, element, event )
				return SteamServerIsCurrentServerTypeFavorites( element )
			end
		},
		{
			stateName = "History",
			condition = function ( menu, element, event )
				return SteamServerIsCurrentServerTypeHistory( element )
			end
		}
	} )
	ServerDetails:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser.serverListCount" ), function ( model )
		self:updateElementState( ServerDetails, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverBrowser.serverListCount"
		} )
	end )
	ServerDetails:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser.serverListUpdatedCount" ), function ( model )
		self:updateElementState( ServerDetails, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverBrowser.serverListUpdatedCount"
		} )
	end )
	self:addElement( ServerDetails )
	self.ServerDetails = ServerDetails
	
	local Servers = LUI.UIList.new( self, controller, 4, 0, nil, false, false, 0, 0, false, false )
	Servers:makeFocusable()
	Servers:setLeftRight( true, false, 64, 764 )
	Servers:setTopBottom( true, false, 185, 649 )
	Servers:setWidgetType( CoD.ServerBrowserRow )
	Servers:setVerticalCount( 18 )
	Servers:setSpacing( 4 )
	Servers:setVerticalScrollbar( CoD.verticalScrollbar )
	Servers:setVerticalCounter( CoD.verticalCounter )
	Servers:setDataSource( "LobbyServer" )
	Servers:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f13_local0 = nil
		ServerBrowserRequestPlayersList( element, event )
		return f13_local0
	end )
	Servers:registerEventHandler( "gain_focus", function ( element, event )
		local f14_local0 = nil
		if element.gainFocus then
			f14_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f14_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED )
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f14_local0
	end )
	Servers:registerEventHandler( "lose_focus", function ( element, event )
		local f15_local0 = nil
		if element.loseFocus then
			f15_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f15_local0 = element.super:loseFocus( event )
		end
		return f15_local0
	end )
	self:AddButtonCallbackFunction( Servers, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "J", function ( element, menu, controller, model )
		ServerBrowserCancelRequest( self )
		JoinServerBrowser( self, element, controller, menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "PLATFORM_JOIN_SERVER_CAPS" )
		return true
	end, false )
	self:AddButtonCallbackFunction( Servers, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "F", function ( element, menu, controller, model )
		if SteamServerIsCurrentServerTypeFavorites( element ) then
			ServerBrowserSetFavorite( self, element, menu, model )
			return true
		elseif SteamServerIsCurrentServerTypeHistory( element ) then
			ServerBrowserSetFavorite( self, element, menu, model )
			return true
		else
			ServerBrowserSetFavorite( self, element, menu, model )
			return true
		end
	end, function ( element, menu, controller )
		if SteamServerIsCurrentServerTypeFavorites( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_REMOVE_FROM_FAVORITES_CAPS" )
			return true
		elseif SteamServerIsCurrentServerTypeHistory( element ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_REMOVE_FROM_HISTORY_CAPS" )
			return true
		else
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "MENU_ADD_TO_FAVORITES_CAPS" )
			return true
		end
	end, false )
	self:AddButtonCallbackFunction( Servers, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ServerBrowserRefreshServer( self, element, menu, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_REFRESH_CAPS" )
		return true
	end, false )
	self:addElement( Servers )
	self.Servers = Servers
	
	local ServerBrowserHeader = CoD.ServerBrowserHeader.new( self, controller )
	ServerBrowserHeader:setLeftRight( true, false, 64, 764 )
	ServerBrowserHeader:setTopBottom( true, false, 152, 180 )
	self:addElement( ServerBrowserHeader )
	self.ServerBrowserHeader = ServerBrowserHeader
	
	local Tabs = CoD.FE_TabBar.new( self, controller )
	Tabs:setLeftRight( true, false, 0, 2464 )
	Tabs:setTopBottom( true, false, 85, 126 )
	Tabs.Tabs.grid:setHorizontalCount( 8 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local updatingText = LUI.UIText.new()
	updatingText:setLeftRight( true, false, 564, 764 )
	updatingText:setTopBottom( true, false, 652, 677 )
	updatingText:setAlpha( 0 )
	updatingText:setText( Engine.Localize( "PLATFORM_RETRIEVING_SERVERS" ) )
	updatingText:setTTF( "fonts/default.ttf" )
	updatingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	updatingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( updatingText )
	self.updatingText = updatingText
	
	local noServersText = LUI.UIText.new()
	noServersText:setLeftRight( true, false, 314, 514 )
	noServersText:setTopBottom( true, false, 377, 402 )
	noServersText:setAlpha( 0 )
	noServersText:setText( Engine.Localize( "PLATFORM_NO_SERVERS_FOUND" ) )
	noServersText:setTTF( "fonts/default.ttf" )
	noServersText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	noServersText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( noServersText )
	self.noServersText = noServersText
	
	ServerDetails:linkToElementModel( Servers, nil, false, function ( model )
		ServerDetails:setModel( model, controller )
	end )
	ServerDetails.navigation = {
		left = Servers
	}
	Servers.navigation = {
		right = ServerDetails
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ServerDetails:completeAnimation()
				self.ServerDetails:setAlpha( 1 )
				self.clipFinished( ServerDetails, {} )
				Servers:completeAnimation()
				self.Servers:setAlpha( 1 )
				self.clipFinished( Servers, {} )
				updatingText:completeAnimation()
				self.updatingText:setAlpha( 0 )
				self.clipFinished( updatingText, {} )
				noServersText:completeAnimation()
				self.noServersText:setAlpha( 0 )
				self.clipFinished( noServersText, {} )
			end
		},
		Updating = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ServerDetails:completeAnimation()
				self.ServerDetails:setAlpha( 1 )
				self.clipFinished( ServerDetails, {} )
				Servers:completeAnimation()
				self.Servers:setAlpha( 1 )
				self.clipFinished( Servers, {} )
				updatingText:completeAnimation()
				self.updatingText:setAlpha( 1 )
				self.clipFinished( updatingText, {} )
				noServersText:completeAnimation()
				self.noServersText:setAlpha( 0 )
				self.clipFinished( noServersText, {} )
			end
		},
		NoServers = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ServerDetails:completeAnimation()
				self.ServerDetails:setAlpha( 0 )
				self.clipFinished( ServerDetails, {} )
				Servers:completeAnimation()
				self.Servers:setAlpha( 0 )
				self.clipFinished( Servers, {} )
				updatingText:completeAnimation()
				self.updatingText:setAlpha( 0 )
				self.clipFinished( updatingText, {} )
				noServersText:completeAnimation()
				self.noServersText:setAlpha( 1 )
				self.clipFinished( noServersText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Updating",
			condition = function ( menu, element, event )
				return IsSteamServerBrowserUpdating()
			end
		},
		{
			stateName = "NoServers",
			condition = function ( menu, element, event )
				return IsSteamServerBrowserEmpty()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser.serverListUpdatedCount" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverBrowser.serverListUpdatedCount"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser.serverListCount" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverBrowser.serverListCount"
		} )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f30_local0 = nil
		RefreshLobbyServerBrowser( self )
		if not f30_local0 then
			f30_local0 = self:dispatchEventToChildren( event )
		end
		return f30_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ServerBrowserCancelRequest( self )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK_CAPS" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "R", function ( element, menu, controller, model )
		RefreshLobbyServerBrowser( self )
		PlaySoundSetSound( self, "partyease_slide_right" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "PLATFORM_REFRESH_ALL_CAPS" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "E", function ( element, menu, controller, model )
		OpenServerBrowserFilters( self, element, controller, "", menu )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_FILTER_SERVERS_CAPS" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	ServerDetails.id = "ServerDetails"
	Servers.id = "Servers"
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
		element.FEMenuLeftGraphics:close()
		element.MenuFrame:close()
		element.ServerDetails:close()
		element.Servers:close()
		element.ServerBrowserHeader:close()
		element.Tabs:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LobbyServerBrowserOnline.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

