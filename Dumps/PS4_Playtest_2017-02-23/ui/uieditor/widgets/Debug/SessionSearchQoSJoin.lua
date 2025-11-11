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
	self:setLeftRight( 0, 0, 0, 762 )
	self:setTopBottom( 0, 0, 0, 13 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setAlpha( 0.35 )
	self:addElement( Background )
	self.Background = Background
	
	local Status = LUI.UIText.new()
	Status:setLeftRight( 0, 0, 626, 760 )
	Status:setTopBottom( 0, 0, -3, 17 )
	Status:setTTF( "fonts/default.ttf" )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Status )
	self.Status = Status
	
	local QoSPing = LUI.UIText.new()
	QoSPing:setLeftRight( 0, 0, 552, 615 )
	QoSPing:setTopBottom( 0, 0, -3, 17 )
	QoSPing:setTTF( "fonts/default.ttf" )
	QoSPing:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	QoSPing:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( QoSPing )
	self.QoSPing = QoSPing
	
	local NATType = LUI.UIText.new()
	NATType:setLeftRight( 0, 0, 492, 547 )
	NATType:setTopBottom( 0, 0, -3, 17 )
	NATType:setTTF( "fonts/default.ttf" )
	NATType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	NATType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NATType )
	self.NATType = NATType
	
	local PrivateIPAddress = LUI.UIText.new()
	PrivateIPAddress:setLeftRight( 0, 0, 398, 489 )
	PrivateIPAddress:setTopBottom( 0, 0, -3, 17 )
	PrivateIPAddress:setTTF( "fonts/default.ttf" )
	PrivateIPAddress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PrivateIPAddress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PrivateIPAddress )
	self.PrivateIPAddress = PrivateIPAddress
	
	local PublicIPAddress = LUI.UIText.new()
	PublicIPAddress:setLeftRight( 0, 0, 267, 398 )
	PublicIPAddress:setTopBottom( 0, 0, -3, 17 )
	PublicIPAddress:setTTF( "fonts/default.ttf" )
	PublicIPAddress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PublicIPAddress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PublicIPAddress )
	self.PublicIPAddress = PublicIPAddress
	
	local Gamertag = LUI.UIText.new()
	Gamertag:setLeftRight( 0, 0, 112, 256 )
	Gamertag:setTopBottom( 0, 0, -3, 17 )
	Gamertag:setTTF( "fonts/default.ttf" )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Gamertag:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Gamertag )
	self.Gamertag = Gamertag
	
	local Xuid = LUI.UIText.new()
	Xuid:setLeftRight( 0, 0, 0, 110 )
	Xuid:setTopBottom( 0, 0, -3, 17 )
	Xuid:setTTF( "fonts/default.ttf" )
	Xuid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Xuid:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Xuid )
	self.Xuid = Xuid
	
	local NoResults = LUI.UIText.new()
	NoResults:setLeftRight( 0, 1, 0, 0 )
	NoResults:setTopBottom( 0, 0, -2, 13 )
	NoResults:setTTF( "fonts/default.ttf" )
	NoResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoResults:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoResults )
	self.NoResults = NoResults
	
	self.Background:linkToElementModel( self, "searchStageColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Background:setRGB( modelValue )
		end
	end )
	self.Status:linkToElementModel( self, "status", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Status:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.QoSPing:linkToElementModel( self, "qosPing", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			QoSPing:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.NATType:linkToElementModel( self, "natType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NATType:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.PrivateIPAddress:linkToElementModel( self, "privateIPAddress", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrivateIPAddress:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.PublicIPAddress:linkToElementModel( self, "publicIPAddress", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PublicIPAddress:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Xuid:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Xuid:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.NoResults:linkToElementModel( self, "noResults", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NoResults:setText( Engine.Localize( modelValue ) )
		end
	end )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Background:close()
		self.Status:close()
		self.QoSPing:close()
		self.NATType:close()
		self.PrivateIPAddress:close()
		self.PublicIPAddress:close()
		self.Gamertag:close()
		self.Xuid:close()
		self.NoResults:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

