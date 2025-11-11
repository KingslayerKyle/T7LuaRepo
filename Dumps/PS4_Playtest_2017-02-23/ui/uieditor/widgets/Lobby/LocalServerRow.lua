require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.LocalServerRow = InheritFrom( LUI.UIElement )
CoD.LocalServerRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LocalServerRow )
	self.id = "LocalServerRow"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1035 )
	self:setTopBottom( 0, 0, 0, 60 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( 0, 1, 0, 0 )
	BlackBar:setTopBottom( 0, 1, 0, 2 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0.27 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local Status = LUI.UIText.new()
	Status:setLeftRight( 0, 0, 830, 1031 )
	Status:setTopBottom( 0, 0, 12, 45 )
	Status:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Status )
	self.Status = Status
	
	local GameType = LUI.UIText.new()
	GameType:setLeftRight( 0, 0, 551, 824 )
	GameType:setTopBottom( 0, 0, 12, 45 )
	GameType:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameType )
	self.GameType = GameType
	
	local ClientCount = LUI.UIText.new()
	ClientCount:setLeftRight( 0, 0, 413, 470 )
	ClientCount:setTopBottom( 0, 0, 12, 45 )
	ClientCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ClientCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClientCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClientCount )
	self.ClientCount = ClientCount
	
	local HostName = LUI.UIText.new()
	HostName:setLeftRight( 0, 0, 15, 413 )
	HostName:setTopBottom( 0, 0, 12, 45 )
	HostName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HostName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HostName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HostName )
	self.HostName = HostName
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -1, 5 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -3, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.Status:linkToElementModel( self, "status", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Status:setText( Engine.Localize( LocalServerStatusToString( modelValue ) ) )
		end
	end )
	self.GameType:linkToElementModel( self, "sessionMode", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameType:setText( SessionModeToLocalizedSessionMode( modelValue ) )
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
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.Status:close()
		self.GameType:close()
		self.ClientCount:close()
		self.HostName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

