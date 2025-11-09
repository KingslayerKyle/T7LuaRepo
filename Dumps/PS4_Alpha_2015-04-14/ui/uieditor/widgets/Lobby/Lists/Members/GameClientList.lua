require( "ui.uieditor.widgets.Lobby.Connectivity.ConnGame" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMember" )

CoD.GameClientList = InheritFrom( LUI.UIElement )
CoD.GameClientList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameClientList )
	self.id = "GameClientList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 495 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local txtLobbyType = LUI.UIText.new()
	txtLobbyType:setLeftRight( true, false, 154, 336 )
	txtLobbyType:setTopBottom( true, false, 27, 44 )
	txtLobbyType:setRGB( 0.42, 0.52, 0.62 )
	txtLobbyType:setText( Engine.Localize( "Game Client List" ) )
	txtLobbyType:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	txtLobbyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtLobbyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtLobbyType:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyDebugInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtLobbyType:setAlpha( modelValue )
		end
	end )
	self:addElement( txtLobbyType )
	self.txtLobbyType = txtLobbyType
	
	local txtKey = LUI.UIText.new()
	txtKey:setLeftRight( true, false, 37, 183 )
	txtKey:setTopBottom( true, false, 11, 25 )
	txtKey:setRGB( 1, 1, 1 )
	txtKey:setTTF( "fonts/default.ttf" )
	txtKey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtKey:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtKey:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyDebugInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtKey:setAlpha( modelValue )
		end
	end )
	txtKey:subscribeToGlobalModel( controller, "Lobby", "gameClient.key", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtKey:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtKey )
	self.txtKey = txtKey
	
	local txtPhrase = LUI.UIText.new()
	txtPhrase:setLeftRight( true, false, 36, 392 )
	txtPhrase:setTopBottom( true, false, -4, 16 )
	txtPhrase:setRGB( 1, 1, 1 )
	txtPhrase:setTTF( "fonts/default.ttf" )
	txtPhrase:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtPhrase:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtPhrase:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyDebugInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtPhrase:setAlpha( modelValue )
		end
	end )
	txtPhrase:subscribeToGlobalModel( controller, "Lobby", "gameClient.name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtPhrase:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtPhrase )
	self.txtPhrase = txtPhrase
	
	local ConnGame0 = CoD.ConnGame.new( menu, controller )
	ConnGame0:setLeftRight( true, false, 9, 33 )
	ConnGame0:setTopBottom( true, false, 0, 20 )
	ConnGame0:setRGB( 1, 1, 1 )
	ConnGame0:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyDebugInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ConnGame0:setAlpha( modelValue )
		end
	end )
	self:addElement( ConnGame0 )
	self.ConnGame0 = ConnGame0
	
	local PartyNumber = LUI.UIText.new()
	PartyNumber:setLeftRight( true, false, 37, 219 )
	PartyNumber:setTopBottom( true, false, 27, 44 )
	PartyNumber:setRGB( 0.42, 0.52, 0.62 )
	PartyNumber:setAlpha( 0 )
	PartyNumber:setText( Engine.Localize( "3 Players (18 Max)" ) )
	PartyNumber:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	PartyNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PartyNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PartyNumber )
	self.PartyNumber = PartyNumber
	
	local Manage = LUI.UIText.new()
	Manage:setLeftRight( true, false, 66, 420 )
	Manage:setTopBottom( true, false, 27, 44 )
	Manage:setRGB( 0.42, 0.52, 0.62 )
	Manage:setText( Engine.Localize( "MENU_MANAGE_PARTY" ) )
	Manage:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Manage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Manage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Manage )
	self.Manage = Manage
	
	local XPlayingXMax = LUI.UIText.new()
	XPlayingXMax:setLeftRight( true, false, 37, 400 )
	XPlayingXMax:setTopBottom( true, false, 27, 44 )
	XPlayingXMax:setRGB( 0.42, 0.52, 0.62 )
	XPlayingXMax:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	XPlayingXMax:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XPlayingXMax:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	XPlayingXMax:subscribeToGlobalModel( controller, "Lobby", "gameClient.count", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XPlayingXMax:setText( Engine.Localize( PluralizedGamePlayerCount( modelValue ) ) )
		end
	end )
	self:addElement( XPlayingXMax )
	self.XPlayingXMax = XPlayingXMax
	
	local lstLobbyList = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	lstLobbyList:makeFocusable()
	lstLobbyList:setLeftRight( true, false, 0, 490 )
	lstLobbyList:setTopBottom( true, false, 50, 587 )
	lstLobbyList:setRGB( 1, 1, 1 )
	lstLobbyList:setDataSource( "LobbyGame" )
	lstLobbyList:setWidgetType( CoD.LobbyMember )
	lstLobbyList:setVerticalCount( 18 )
	lstLobbyList:setSpacing( 3 )
	self:addElement( lstLobbyList )
	self.lstLobbyList = lstLobbyList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				txtLobbyType:completeAnimation()
				self.txtLobbyType:setLeftRight( true, false, 238, 420 )
				self.txtLobbyType:setTopBottom( true, false, 27, 44 )
				self.txtLobbyType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( txtLobbyType, {} )
				PartyNumber:completeAnimation()
				self.PartyNumber:setAlpha( 0 )
				self.clipFinished( PartyNumber, {} )
				Manage:completeAnimation()
				self.Manage:setAlpha( 1 )
				self.clipFinished( Manage, {} )
				XPlayingXMax:completeAnimation()
				self.XPlayingXMax:setAlpha( 1 )
				self.clipFinished( XPlayingXMax, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Party = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				PartyNumber:completeAnimation()
				self.PartyNumber:setAlpha( 1 )
				self.clipFinished( PartyNumber, {} )
				Manage:completeAnimation()
				self.Manage:setAlpha( 1 )
				self.clipFinished( Manage, {} )
			end
		}
	}
	lstLobbyList.id = "lstLobbyList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.lstLobbyList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.ConnGame0:close()
		self.lstLobbyList:close()
		self.txtLobbyType:close()
		self.txtKey:close()
		self.txtPhrase:close()
		self.XPlayingXMax:close()
		CoD.GameClientList.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

