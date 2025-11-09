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
	Status:setRGB( 1, 1, 1 )
	Status:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Status )
	self.Status = Status
	
	local GameType = LUI.UIText.new()
	GameType:setLeftRight( true, false, 366.5, 570.5 )
	GameType:setTopBottom( true, false, 4.5, 24.5 )
	GameType:setRGB( 1, 1, 1 )
	GameType:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameType )
	self.GameType = GameType
	
	local ClientCount = LUI.UIText.new()
	ClientCount:setLeftRight( true, false, 270.5, 308.5 )
	ClientCount:setTopBottom( true, false, 4.5, 24.5 )
	ClientCount:setRGB( 1, 1, 1 )
	ClientCount:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ClientCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClientCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClientCount )
	self.ClientCount = ClientCount
	
	local HostName = LUI.UIText.new()
	HostName:setLeftRight( true, false, 8, 297.5 )
	HostName:setTopBottom( true, false, 4.5, 24.5 )
	HostName:setRGB( 1, 1, 1 )
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
	HighlightBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HighlightBackground )
	self.HighlightBackground = HighlightBackground
	
	self.Status:linkToElementModel( self, "status", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Status:setText( Engine.Localize( LocalServerStatusToString( modelValue ) ) )
		end
	end )
	self.GameType:linkToElementModel( self, "sessionMode", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameType:setText( Engine.Localize( SessionModeToLocalizedSessionMode( modelValue ) ) )
		end
	end )
	self.ClientCount:linkToElementModel( self, "clientCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ClientCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.HostName:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HostName:setText( Engine.Localize( modelValue ) )
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
	self.close = function ( self )
		self.Status:close()
		self.GameType:close()
		self.ClientCount:close()
		self.HostName:close()
		CoD.LocalServerRow.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

