require( "ui.T6.ServerList" )

CoD.ServerBrowser = {}
CoD.ServerBrowser.DoNothing = function ( self, event )
	
end

CoD.ServerBrowser.JoinMatch = function ( self, event )
	Engine.ServerListStopRefresh()
	self.occludedMenu:processEvent( {
		name = "rebuild_button_panel"
	} )
	self:registerEventHandler( "party_joined", CoD.ServerBrowser.DoNothing )
	self:registerEventHandler( "button_prompt_back", CoD.ServerBrowser.DoNothing )
end

CoD.ServerBrowser.close = function ( self, event )
	Engine.ServerListStopRefresh()
	self.occludedMenu:processEvent( {
		name = "rebuild_button_panel"
	} )
	CoD.Menu.close( self, event )
end

CoD.ServerBrowser.AddRefreshButton = function ( self, serverList )
	self.refreshButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_REFRESH" ), serverList, "button_prompt_refresh", false, nil, false, nil, "R" )
	self:addRightButtonPrompt( self.refreshButton )
end

CoD.ServerBrowser.SignedOut = function ( serverBrowserMenu, event )
	if serverBrowserMenu.m_ownerController == event.controller then
		Engine.ServerListStopRefresh()
		CoD.Menu.SignedOut( serverBrowserMenu, event )
	end
end

LUI.createMenu.ServerBrowser = function ( controller )
	local serverBrowserMenu = CoD.Menu.New( "ServerBrowser" )
	serverBrowserMenu:addLargePopupBackground()
	serverBrowserMenu.m_ownerController = controller
	serverBrowserMenu:addTitle( Engine.Localize( "PLATFORM_SYSTEM_LINK_GAMES_CAPS" ) )
	serverBrowserMenu:registerEventHandler( "party_joined", CoD.ServerBrowser.JoinMatch )
	local top = CoD.Menu.TitleHeight
	local backgroundHeight = serverBrowserMenu.height - top
	local serverListTop = top + CoD.CoD9Button.Height
	serverBrowserMenu.header = LUI.UIHorizontalList.new( {
		left = 0,
		top = top,
		right = 0,
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = CoD.ServerList.ColumnSpacing
	} )
	serverBrowserMenu:addElement( serverBrowserMenu.header )
	serverBrowserMenu.backgroundGroup = LUI.UIHorizontalList.new( {
		left = 0,
		top = serverListTop,
		right = 0,
		bottom = -CoD.CoD9Button.Height - 10,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = CoD.ServerList.ColumnSpacing,
		alpha = 0.03
	} )
	serverBrowserMenu:addElement( serverBrowserMenu.backgroundGroup )
	local backgrounds = {
		LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = CoD.ServerList.ColumnWidth[1],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		} ),
		LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = CoD.ServerList.ColumnWidth[2],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		} ),
		LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = CoD.ServerList.ColumnWidth[3],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		} ),
		LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = CoD.ServerList.ColumnWidth[4],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		} ),
		LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = CoD.ServerList.ColumnWidth[5],
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		} )
	}
	serverBrowserMenu.backgroundGroup:addElement( backgrounds[1] )
	serverBrowserMenu.backgroundGroup:addElement( backgrounds[2] )
	serverBrowserMenu.backgroundGroup:addElement( backgrounds[3] )
	serverBrowserMenu.backgroundGroup:addElement( backgrounds[4] )
	serverBrowserMenu.backgroundGroup:addElement( backgrounds[5] )
	serverBrowserMenu.serverList = CoD.ServerList.new( {
		left = 0,
		top = serverListTop,
		right = 0,
		bottom = -CoD.CoD9Button.Height - 10,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 10
	} )
	serverBrowserMenu:addElement( serverBrowserMenu.serverList )
	local hostNameHeader = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.ServerList.ColumnWidth[1],
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Default
	} )
	local mapNameHeader = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.ServerList.ColumnWidth[2],
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Default
	} )
	local gametypeHeader = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.ServerList.ColumnWidth[4],
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Default
	} )
	local status = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.ServerList.ColumnWidth[5],
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Default
	} )
	local clientsHeader = LUI.UIText.new( {
		left = 0,
		top = 0,
		right = CoD.ServerList.ColumnWidth[3],
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Default
	} )
	hostNameHeader:setText( Engine.Localize( "MENU_HOST_CAPS" ) )
	mapNameHeader:setText( Engine.Localize( "MENU_MAP_NAME_CAPS" ) )
	clientsHeader:setText( Engine.Localize( "MENU_NUMPLAYERS_CAPS" ) )
	gametypeHeader:setText( Engine.Localize( "MENU_GAME_MODE_CAPS" ) )
	status:setText( Engine.Localize( "MENU_STATUS_CAPS" ) )
	serverBrowserMenu.header:addSpacer( CoD.ServerListButton.TextOffset )
	serverBrowserMenu.header:addElement( hostNameHeader )
	serverBrowserMenu.header:addElement( mapNameHeader )
	serverBrowserMenu.header:addElement( clientsHeader )
	serverBrowserMenu.header:addElement( gametypeHeader )
	serverBrowserMenu.header:addElement( status )
	serverBrowserMenu:addSelectButton()
	serverBrowserMenu:addBackButton()
	CoD.ServerBrowser.AddRefreshButton( serverBrowserMenu, serverBrowserMenu.serverList )
	serverBrowserMenu:registerEventHandler( "signed_out", CoD.ServerBrowser.SignedOut )
	return serverBrowserMenu
end

