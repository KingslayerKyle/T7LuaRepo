require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )

CoD.GameHostList = InheritFrom( LUI.UIElement )
CoD.GameHostList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GameHostList )
	self.id = "GameHostList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 422 )
	self:setTopBottom( true, false, 0, 480 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local lstLobbyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	lstLobbyList:makeFocusable()
	lstLobbyList:setLeftRight( true, false, 0, 490 )
	lstLobbyList:setTopBottom( true, false, 50, 512 )
	lstLobbyList:setRGB( 1, 1, 1 )
	lstLobbyList:setDataSource( "LobbyGameHostMembers" )
	lstLobbyList:setWidgetType( CoD.LobbyMember )
	lstLobbyList:setVerticalCount( 16 )
	self:addElement( lstLobbyList )
	self.lstLobbyList = lstLobbyList
	
	local txtLobbyTYpe = LUI.UIText.new()
	txtLobbyTYpe:setLeftRight( true, false, 0, 160 )
	txtLobbyTYpe:setTopBottom( true, false, 25, 50 )
	txtLobbyTYpe:setRGB( 1, 1, 1 )
	txtLobbyTYpe:setText( Engine.Localize( "Game Lobby" ) )
	txtLobbyTYpe:setTTF( "fonts/default.ttf" )
	txtLobbyTYpe:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtLobbyTYpe:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtLobbyTYpe )
	self.txtLobbyTYpe = txtLobbyTYpe
	
	local txtCount = LUI.UIText.new()
	txtCount:setLeftRight( true, false, 155, 310 )
	txtCount:setTopBottom( true, false, 24.5, 49.5 )
	txtCount:setRGB( 1, 1, 1 )
	txtCount:setText( Engine.Localize( "MENU_LOBBY_GAME_HOST_COUNT" ) )
	txtCount:setTTF( "fonts/default.ttf" )
	txtCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	txtCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCount )
	self.txtCount = txtCount
	
	local txtKey = LUI.UIText.new()
	txtKey:setLeftRight( true, false, 132.5, 310 )
	txtKey:setTopBottom( true, false, 5, 25 )
	txtKey:setRGB( 1, 1, 1 )
	txtKey:setAlpha( 0.5 )
	txtKey:setTTF( "fonts/default.ttf" )
	txtKey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	txtKey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtKey:subscribeToGlobalModel( controller, "Lobby", "gameHost.key", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtKey:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtKey )
	self.txtKey = txtKey
	
	local txtPhrase = LUI.UIText.new()
	txtPhrase:setLeftRight( true, false, 0, 264 )
	txtPhrase:setTopBottom( true, false, 5, 25 )
	txtPhrase:setRGB( 1, 1, 1 )
	txtPhrase:setAlpha( 0.5 )
	txtPhrase:setTTF( "fonts/default.ttf" )
	txtPhrase:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtPhrase:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtPhrase:subscribeToGlobalModel( controller, "Lobby", "gameHost.name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtPhrase:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtPhrase )
	self.txtPhrase = txtPhrase
	
	lstLobbyList.id = "lstLobbyList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lstLobbyList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.lstLobbyList:close()
		self.txtKey:close()
		self.txtPhrase:close()
		CoD.GameHostList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

