require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )

CoD.PrivateHostList = InheritFrom( LUI.UIElement )
CoD.PrivateHostList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PrivateHostList )
	self.id = "PrivateHostList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 633 )
	self:setTopBottom( 0, 0, 0, 720 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local lstLobbyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	lstLobbyList:makeFocusable()
	lstLobbyList:setLeftRight( 0, 0, 0, 735 )
	lstLobbyList:setTopBottom( 0, 0, 87, 757 )
	lstLobbyList:setWidgetType( CoD.LobbyMember )
	lstLobbyList:setVerticalCount( 16 )
	lstLobbyList:setDataSource( "LobbyPrivateHostMembers" )
	self:addElement( lstLobbyList )
	self.lstLobbyList = lstLobbyList
	
	local txtCount = LUI.UIText.new()
	txtCount:setLeftRight( 0, 0, 233, 465 )
	txtCount:setTopBottom( 0, 0, 37, 75 )
	txtCount:setText( Engine.Localize( "MENU_LOBBY_PRIVATE_HOST_COUNT" ) )
	txtCount:setTTF( "fonts/default.ttf" )
	txtCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	txtCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCount )
	self.txtCount = txtCount
	
	local txtKey = LUI.UIText.new()
	txtKey:setLeftRight( 0, 0, 239, 465 )
	txtKey:setTopBottom( 0, 0, 7, 37 )
	txtKey:setAlpha( 0.5 )
	txtKey:setText( Engine.Localize( "MENU_NEW" ) )
	txtKey:setTTF( "fonts/default.ttf" )
	txtKey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	txtKey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtKey )
	self.txtKey = txtKey
	
	local txtLobbyType = LUI.UIText.new()
	txtLobbyType:setLeftRight( 0, 0, 0, 273 )
	txtLobbyType:setTopBottom( 0, 0, 37, 75 )
	txtLobbyType:setText( Engine.Localize( "Private Lobby" ) )
	txtLobbyType:setTTF( "fonts/default.ttf" )
	txtLobbyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtLobbyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtLobbyType )
	self.txtLobbyType = txtLobbyType
	
	local txtPhrase = LUI.UIText.new()
	txtPhrase:setLeftRight( 0, 0, 0, 372 )
	txtPhrase:setTopBottom( 0, 0, 7, 37 )
	txtPhrase:setAlpha( 0.5 )
	txtPhrase:setText( Engine.Localize( "MENU_NEW" ) )
	txtPhrase:setTTF( "fonts/default.ttf" )
	txtPhrase:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtPhrase:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.lstLobbyList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

