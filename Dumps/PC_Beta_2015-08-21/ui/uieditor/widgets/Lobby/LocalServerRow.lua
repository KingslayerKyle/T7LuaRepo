CoD.LocalServerRow = InheritFrom( LUI.UIElement )
CoD.LocalServerRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LocalServerRow )
	self.id = "LocalServerRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 696 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Status = LUI.UIText.new()
	Status:setLeftRight( true, false, 564.5, 698.5 )
	Status:setTopBottom( true, false, 4.5, 24.5 )
	Status:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Status )
	self.Status = Status
	
	local GameType = LUI.UIText.new()
	GameType:setLeftRight( true, false, 366.5, 570.5 )
	GameType:setTopBottom( true, false, 4.5, 24.5 )
	GameType:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameType )
	self.GameType = GameType
	
	local ClientCount = LUI.UIText.new()
	ClientCount:setLeftRight( true, false, 270.5, 308.5 )
	ClientCount:setTopBottom( true, false, 4.5, 24.5 )
	ClientCount:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ClientCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClientCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClientCount )
	self.ClientCount = ClientCount
	
	local HostName = LUI.UIText.new()
	HostName:setLeftRight( true, false, 8, 297.5 )
	HostName:setTopBottom( true, false, 4.5, 24.5 )
	HostName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	HostName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HostName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HostName )
	self.HostName = HostName
	
	local HighlightBackground = LUI.UIImage.new()
	HighlightBackground:setLeftRight( true, false, 0, 696 )
	HighlightBackground:setTopBottom( true, false, 0, 25 )
	HighlightBackground:setRGB( 0, 0.46, 1 )
	HighlightBackground:setAlpha( 0.25 )
	self:addElement( HighlightBackground )
	self.HighlightBackground = HighlightBackground
	
	self.Status:linkToElementModel( self, "status", true, function ( model )
		local status = Engine.GetModelValue( model )
		if status then
			Status:setText( Engine.Localize( LocalServerStatusToString( status ) ) )
		end
	end )
	self.GameType:linkToElementModel( self, "sessionMode", true, function ( model )
		local sessionMode = Engine.GetModelValue( model )
		if sessionMode then
			GameType:setText( Engine.Localize( SessionModeToLocalizedSessionMode( sessionMode ) ) )
		end
	end )
	self.ClientCount:linkToElementModel( self, "clientCount", true, function ( model )
		local clientCount = Engine.GetModelValue( model )
		if clientCount then
			ClientCount:setText( Engine.Localize( clientCount ) )
		end
	end )
	self.HostName:linkToElementModel( self, "gamertag", true, function ( model )
		local gamertag = Engine.GetModelValue( model )
		if gamertag then
			HostName:setText( Engine.Localize( gamertag ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				HighlightBackground:completeAnimation()
				self.HighlightBackground:setAlpha( 0 )
				self.clipFinished( HighlightBackground, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				HighlightBackground:completeAnimation()
				self.HighlightBackground:setLeftRight( true, false, 0, 696 )
				self.HighlightBackground:setTopBottom( true, false, 0, 25 )
				self.HighlightBackground:setAlpha( 0.25 )
				self.clipFinished( HighlightBackground, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Status:close()
		element.GameType:close()
		element.ClientCount:close()
		element.HostName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

