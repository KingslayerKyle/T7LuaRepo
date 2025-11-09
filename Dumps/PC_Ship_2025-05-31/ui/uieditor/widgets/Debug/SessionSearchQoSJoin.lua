CoD.SessionSearchQoSJoin = InheritFrom( LUI.UIElement )
CoD.SessionSearchQoSJoin.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SessionSearchQoSJoin )
	self.id = "SessionSearchQoSJoin"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 508 )
	self:setTopBottom( true, false, 0, 9 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setAlpha( 0.35 )
	self:addElement( Background )
	self.Background = Background
	
	local Status = LUI.UIText.new()
	Status:setLeftRight( true, false, 417.56, 507 )
	Status:setTopBottom( true, false, -2, 11 )
	Status:setTTF( "fonts/default.ttf" )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Status )
	self.Status = Status
	
	local QoSPing = LUI.UIText.new()
	QoSPing:setLeftRight( true, false, 368.26, 410.26 )
	QoSPing:setTopBottom( true, false, -2, 11 )
	QoSPing:setTTF( "fonts/default.ttf" )
	QoSPing:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	QoSPing:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( QoSPing )
	self.QoSPing = QoSPing
	
	local NATType = LUI.UIText.new()
	NATType:setLeftRight( true, false, 327.8, 364.8 )
	NATType:setTopBottom( true, false, -2, 11 )
	NATType:setTTF( "fonts/default.ttf" )
	NATType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	NATType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NATType )
	self.NATType = NATType
	
	local PrivateIPAddress = LUI.UIText.new()
	PrivateIPAddress:setLeftRight( true, false, 265.3, 325.8 )
	PrivateIPAddress:setTopBottom( true, false, -2, 11 )
	PrivateIPAddress:setTTF( "fonts/default.ttf" )
	PrivateIPAddress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrivateIPAddress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrivateIPAddress )
	self.PrivateIPAddress = PrivateIPAddress
	
	local PublicIPAddress = LUI.UIText.new()
	PublicIPAddress:setLeftRight( true, false, 178, 265.3 )
	PublicIPAddress:setTopBottom( true, false, -2, 11 )
	PublicIPAddress:setTTF( "fonts/default.ttf" )
	PublicIPAddress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PublicIPAddress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PublicIPAddress )
	self.PublicIPAddress = PublicIPAddress
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( true, false, 75, 171 )
	Gamertag:setTopBottom( true, false, -2, 11 )
	Gamertag:setTTF( "fonts/default.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local Xuid = LUI.UIText.new()
	Xuid:setLeftRight( true, false, 0, 73 )
	Xuid:setTopBottom( true, false, -2, 11 )
	Xuid:setTTF( "fonts/default.ttf" )
	Xuid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Xuid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Xuid )
	self.Xuid = Xuid
	
	local NoResults = LUI.UIText.new()
	NoResults:setLeftRight( true, true, 0, 0 )
	NoResults:setTopBottom( true, false, -1, 9 )
	NoResults:setTTF( "fonts/default.ttf" )
	NoResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoResults )
	self.NoResults = NoResults
	
	self.Background:linkToElementModel( self, "searchStageColor", true, function ( model )
		local searchStageColor = Engine.GetModelValue( model )
		if searchStageColor then
			Background:setRGB( searchStageColor )
		end
	end )
	self.Status:linkToElementModel( self, "status", true, function ( model )
		local status = Engine.GetModelValue( model )
		if status then
			Status:setText( Engine.Localize( status ) )
		end
	end )
	self.QoSPing:linkToElementModel( self, "qosPing", true, function ( model )
		local qosPing = Engine.GetModelValue( model )
		if qosPing then
			QoSPing:setText( Engine.Localize( qosPing ) )
		end
	end )
	self.NATType:linkToElementModel( self, "natType", true, function ( model )
		local natType = Engine.GetModelValue( model )
		if natType then
			NATType:setText( Engine.Localize( natType ) )
		end
	end )
	self.PrivateIPAddress:linkToElementModel( self, "privateIPAddress", true, function ( model )
		local privateIPAddress = Engine.GetModelValue( model )
		if privateIPAddress then
			PrivateIPAddress:setText( Engine.Localize( privateIPAddress ) )
		end
	end )
	self.PublicIPAddress:linkToElementModel( self, "publicIPAddress", true, function ( model )
		local publicIPAddress = Engine.GetModelValue( model )
		if publicIPAddress then
			PublicIPAddress:setText( Engine.Localize( publicIPAddress ) )
		end
	end )
	self.Gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			Gamertag:setText( Engine.Localize( gamertag ) )
		end
	end )
	self.Xuid:linkToElementModel( self, "xuid", true, function ( model )
		local xuid = Engine.GetModelValue( model )
		if xuid then
			Xuid:setText( Engine.Localize( xuid ) )
		end
	end )
	self.NoResults:linkToElementModel( self, "noResults", true, function ( model )
		local noResults = Engine.GetModelValue( model )
		if noResults then
			NoResults:setText( Engine.Localize( noResults ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Left = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 0 )
			end,
			Right = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Right = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			FadeIn = function ()
				self:setupElementClipCounter( 0 )
			end,
			Left = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Left",
			condition = function ( menu, element, event )
				return IsWidgetInFocus( self, "LeftContainer", event )
			end
		},
		{
			stateName = "Right",
			condition = function ( menu, element, event )
				return IsWidgetInFocus( self, "ClientList", event )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
		element.Status:close()
		element.QoSPing:close()
		element.NATType:close()
		element.PrivateIPAddress:close()
		element.PublicIPAddress:close()
		element.Gamertag:close()
		element.Xuid:close()
		element.NoResults:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

