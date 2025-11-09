require( "ui.uieditor.widgets.Lobby.LANServerBrowser.LANServerBrowserDetails" )
require( "ui.uieditor.widgets.Lobby.LocalServerRow" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleContainerNoLoc" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local controller = event.controller or controller
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") then
			RefreshServerList( self, controller )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "Y") then
			if LANServerBrowserCheckFilterTest( self, "all" ) then
				LobbyLANServerBrowserSetMainModeFilter( self, controller )
				RefreshServerList( self, controller )
			elseif LANServerBrowserCheckFilterTest( self, "cp" ) then
				LobbyLANServerBrowserSetMainModeFilter( self, controller )
				RefreshServerList( self, controller )
			elseif LANServerBrowserCheckFilterTest( self, "mp" ) then
				LobbyLANServerBrowserSetMainModeFilter( self, controller )
				RefreshServerList( self, controller )
			elseif LANServerBrowserCheckFilterTest( self, "zm" ) then
				LobbyLANServerBrowserSetMainModeFilter( self, controller )
				RefreshServerList( self, controller )
			end
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
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
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.85 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Background0 = LUI.UIImage.new()
	Background0:setLeftRight( false, false, -638, 642 )
	Background0:setTopBottom( false, false, -360, 360 )
	Background0:setRGB( 1, 1, 1 )
	Background0:setImage( RegisterImage( "uie_t7_mp_menu_cac_version5_backdrop720p" ) )
	Background0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background0 )
	self.Background0 = Background0
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -640, 642 )
	FooterBacking:setTopBottom( false, false, 323, 386 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local Topbanner = LUI.UIImage.new()
	Topbanner:setLeftRight( true, false, 0, 1285 )
	Topbanner:setTopBottom( true, false, 85, 123 )
	Topbanner:setRGB( 0.23, 0.23, 0.23 )
	Topbanner:setAlpha( 0.8 )
	Topbanner:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Topbanner )
	self.Topbanner = Topbanner
	
	local LANServerBrowserDetails = CoD.LANServerBrowserDetails.new( self, controller )
	LANServerBrowserDetails:setLeftRight( true, false, 803, 1190 )
	LANServerBrowserDetails:setTopBottom( true, false, 138.5, 698.5 )
	LANServerBrowserDetails:setRGB( 1, 1, 1 )
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
	
	local TitleBacking0 = LUI.UIImage.new()
	TitleBacking0:setLeftRight( false, false, -649, 645 )
	TitleBacking0:setTopBottom( false, false, -361, -275 )
	TitleBacking0:setRGB( 0, 0, 0 )
	TitleBacking0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking0 )
	self.TitleBacking0 = TitleBacking0
	
	local Servers = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, true )
	Servers:makeFocusable()
	Servers:setLeftRight( true, false, 96, 792 )
	Servers:setTopBottom( true, false, 138.5, 649.5 )
	Servers:setRGB( 1, 1, 1 )
	Servers:setDataSource( "LocalServer" )
	Servers:setWidgetType( CoD.LocalServerRow )
	Servers:setVerticalCount( 19 )
	Servers:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		JoinSystemLinkServer( self, element, controller )
		GoBack( self, controller )
		return retVal
	end )
	Servers:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		LobbyLANServerPlayerListRefresh( self, element, controller )
		return retVal
	end )
	self:addElement( Servers )
	self.Servers = Servers
	
	local Status = LUI.UITightText.new()
	Status:setLeftRight( true, false, 661.5, 716.5 )
	Status:setTopBottom( true, false, 94.5, 114.5 )
	Status:setRGB( 1, 1, 1 )
	Status:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	Status:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Status )
	self.Status = Status
	
	local GameType = LUI.UITightText.new()
	GameType:setLeftRight( true, false, 464, 505 )
	GameType:setTopBottom( true, false, 94.5, 114.5 )
	GameType:setRGB( 1, 1, 1 )
	GameType:setText( Engine.Localize( "MODE" ) )
	GameType:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( GameType )
	self.GameType = GameType
	
	local PlayerCount = LUI.UITightText.new()
	PlayerCount:setLeftRight( true, false, 368, 432 )
	PlayerCount:setTopBottom( true, false, 94.5, 114.5 )
	PlayerCount:setRGB( 1, 1, 1 )
	PlayerCount:setText( Engine.Localize( "MENU_NUMPLAYERS_CAPS" ) )
	PlayerCount:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( PlayerCount )
	self.PlayerCount = PlayerCount
	
	local HostName = LUI.UITightText.new()
	HostName:setLeftRight( true, false, 106, 143 )
	HostName:setTopBottom( true, false, 94.5, 114.5 )
	HostName:setRGB( 1, 1, 1 )
	HostName:setText( Engine.Localize( "MENU_HOST_CAPS" ) )
	HostName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( HostName )
	self.HostName = HostName
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, -192, 64 )
	Title:setTopBottom( true, false, -183, -129 )
	Title:setRGB( 1, 1, 1 )
	Title:setAlpha( 0 )
	Title:setText( Engine.Localize( "MPUI_LOCAL_GAMES_CAPS" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	local FE3dTitleContainer0 = CoD.cac_3dTitleContainerNoLoc.new( self, controller )
	FE3dTitleContainer0:setLeftRight( true, false, -74, 457 )
	FE3dTitleContainer0:setTopBottom( true, false, 0, 146 )
	FE3dTitleContainer0:setRGB( 1, 1, 1 )
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
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
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
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt1 = function ( menu, element, event )
		menu:addButtonPrompt( "alt1", Engine.Localize( "MENU_REFRESH" ), "X", element )
		return true
	end
	
	self.buttonPromptAddFunctions.alt2 = function ( menu, element, event )
		if LANServerBrowserCheckFilterTest( menu, "all" ) then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_LAN_FILTER_ALL" ), "Y", element )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "cp" ) then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_LAN_FILTER_CAMPAIGN" ), "Y", element )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "mp" ) then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_LAN_FILTER_MULTIPLAYER" ), "Y", element )
			return true
		elseif LANServerBrowserCheckFilterTest( menu, "zm" ) then
			menu:addButtonPrompt( "alt2", Engine.Localize( "MENU_LAN_FILTER_ZOMBIES" ), "Y", element )
			return true
		else
			
		end
	end
	
	self:registerEventHandler( "filter_mode_changed", function ( element, event )
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
		if not element.buttonPromptAddFunctions.alt2( self, element, event ) then
			self:removeButtonPrompt( "alt2", element )
		end
	end )
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt1( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.alt2( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "alt1" or event.button == "key_shortcut" and event.key == "X") then
			RefreshServerList( self, controller )
			PlaySoundSetSound( self, "partyease_slide_right" )
		end
		if not self.occludedBy and (event.button == "alt2" or event.button == "key_shortcut" and event.key == "Y") then
			if LANServerBrowserCheckFilterTest( self, "all" ) then
				LobbyLANServerBrowserSetMainModeFilter( self, controller )
				RefreshServerList( self, controller )
				PlaySoundSetSound( self, "toggle" )
			elseif LANServerBrowserCheckFilterTest( self, "cp" ) then
				LobbyLANServerBrowserSetMainModeFilter( self, controller )
				RefreshServerList( self, controller )
				PlaySoundSetSound( self, "toggle" )
			elseif LANServerBrowserCheckFilterTest( self, "mp" ) then
				LobbyLANServerBrowserSetMainModeFilter( self, controller )
				RefreshServerList( self, controller )
				PlaySoundSetSound( self, "toggle" )
			elseif LANServerBrowserCheckFilterTest( self, "zm" ) then
				LobbyLANServerBrowserSetMainModeFilter( self, controller )
				RefreshServerList( self, controller )
				PlaySoundSetSound( self, "toggle" )
			end
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		RefreshServerList( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	LANServerBrowserDetails.id = "LANServerBrowserDetails"
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
	self.close = function ( self )
		self.LANServerBrowserDetails:close()
		self.Servers:close()
		self.FE3dTitleContainer0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

