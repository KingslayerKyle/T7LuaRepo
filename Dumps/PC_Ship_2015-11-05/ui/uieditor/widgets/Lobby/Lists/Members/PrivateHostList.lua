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
	self:setLeftRight( true, false, 0, 422 )
	self:setTopBottom( true, false, 0, 480 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local lstLobbyList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	lstLobbyList:makeFocusable()
	lstLobbyList:setLeftRight( true, false, 0, 490 )
	lstLobbyList:setTopBottom( true, false, 50, 512 )
	lstLobbyList:setDataSource( "LobbyPrivateHostMembers" )
	lstLobbyList:setWidgetType( CoD.LobbyMember )
	lstLobbyList:setVerticalCount( 16 )
	self:addElement( lstLobbyList )
	self.lstLobbyList = lstLobbyList
	
	local txtCount = LUI.UIText.new()
	txtCount:setLeftRight( true, false, 155, 310 )
	txtCount:setTopBottom( true, false, 25, 50 )
	txtCount:setText( Engine.Localize( "MENU_LOBBY_PRIVATE_HOST_COUNT" ) )
	txtCount:setTTF( "fonts/default.ttf" )
	txtCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	txtCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtCount )
	self.txtCount = txtCount
	
	local txtKey = LUI.UIText.new()
	txtKey:setLeftRight( true, false, 159.07, 310 )
	txtKey:setTopBottom( true, false, 5, 25 )
	txtKey:setAlpha( 0.5 )
	txtKey:setText( Engine.Localize( "MENU_NEW" ) )
	txtKey:setTTF( "fonts/default.ttf" )
	txtKey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	txtKey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtKey )
	self.txtKey = txtKey
	
	local txtLobbyType = LUI.UIText.new()
	txtLobbyType:setLeftRight( true, false, 0, 182 )
	txtLobbyType:setTopBottom( true, false, 25, 50 )
	txtLobbyType:setText( Engine.Localize( "Private Lobby" ) )
	txtLobbyType:setTTF( "fonts/default.ttf" )
	txtLobbyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtLobbyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtLobbyType )
	self.txtLobbyType = txtLobbyType
	
	local txtPhrase = LUI.UIText.new()
	txtPhrase:setLeftRight( true, false, 0, 248 )
	txtPhrase:setTopBottom( true, false, 5, 25 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.lstLobbyList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

