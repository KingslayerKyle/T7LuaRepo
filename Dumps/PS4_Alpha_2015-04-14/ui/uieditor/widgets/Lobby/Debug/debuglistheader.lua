require( "ui.uieditor.widgets.Lobby.Connectivity.ConnPrivate" )

CoD.DebugListHeader = InheritFrom( LUI.UIElement )
CoD.DebugListHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DebugListHeader )
	self.id = "DebugListHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 410 )
	self:setTopBottom( true, false, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local txtKey = LUI.UIText.new()
	txtKey:setLeftRight( true, false, 28, 174 )
	txtKey:setTopBottom( true, false, 15, 29 )
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
	txtKey:subscribeToGlobalModel( controller, "Lobby", "privateClient.key", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtKey:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtKey )
	self.txtKey = txtKey
	
	local txtLobbyType = LUI.UIText.new()
	txtLobbyType:setLeftRight( true, false, 145, 327 )
	txtLobbyType:setTopBottom( true, false, 31, 48 )
	txtLobbyType:setRGB( 0.42, 0.52, 0.62 )
	txtLobbyType:setText( Engine.Localize( "Private Client List" ) )
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
	
	local txtPhrase = LUI.UIText.new()
	txtPhrase:setLeftRight( true, false, 27, 383 )
	txtPhrase:setTopBottom( true, false, 0, 20 )
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
	txtPhrase:subscribeToGlobalModel( controller, "Lobby", "privateClient.name", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			txtPhrase:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( txtPhrase )
	self.txtPhrase = txtPhrase
	
	local ConnPrivate0 = CoD.ConnPrivate.new( menu, controller )
	ConnPrivate0:setLeftRight( true, false, 0, 24 )
	ConnPrivate0:setTopBottom( true, false, 4, 24 )
	ConnPrivate0:setRGB( 1, 1, 1 )
	ConnPrivate0:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyDebugInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ConnPrivate0:setAlpha( modelValue )
		end
	end )
	self:addElement( ConnPrivate0 )
	self.ConnPrivate0 = ConnPrivate0
	
	local Manage = LUI.UIText.new()
	Manage:setLeftRight( true, false, 112, 410 )
	Manage:setTopBottom( true, false, 31, 48 )
	Manage:setRGB( 0.42, 0.52, 0.62 )
	Manage:setText( Engine.Localize( "MENU_MANAGE_PARTY" ) )
	Manage:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Manage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Manage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Manage:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyDebugInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Manage:setAlpha( modelValue )
		end
	end )
	self:addElement( Manage )
	self.Manage = Manage
	
	local XplayingXMax = LUI.UIText.new()
	XplayingXMax:setLeftRight( true, false, 28, 373 )
	XplayingXMax:setTopBottom( true, false, 31, 48 )
	XplayingXMax:setRGB( 0.42, 0.52, 0.62 )
	XplayingXMax:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	XplayingXMax:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	XplayingXMax:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	XplayingXMax:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyDebugInfo", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XplayingXMax:setAlpha( modelValue )
		end
	end )
	XplayingXMax:subscribeToGlobalModel( controller, "Lobby", "privateClient.count", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XplayingXMax:setText( Engine.Localize( PluralizedPrivatePlayerCount( modelValue ) ) )
		end
	end )
	self:addElement( XplayingXMax )
	self.XplayingXMax = XplayingXMax
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Manage:completeAnimation()
				self.clipFinished( Manage, {} )
				XplayingXMax:completeAnimation()
				self.clipFinished( XplayingXMax, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Party = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Manage:completeAnimation()
				self.clipFinished( Manage, {} )
			end
		}
	}
	self.close = function ( self )
		self.ConnPrivate0:close()
		self.txtKey:close()
		self.txtLobbyType:close()
		self.txtPhrase:close()
		self.Manage:close()
		self.XplayingXMax:close()
		CoD.DebugListHeader.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

