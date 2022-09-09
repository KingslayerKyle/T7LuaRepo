-- 71bfbd9c638ebc1275d5fbc21ebf39ef
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 690 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BlackBar = LUI.UIImage.new()
	BlackBar:setLeftRight( true, true, 0, 0 )
	BlackBar:setTopBottom( true, true, 0, 1 )
	BlackBar:setRGB( 0, 0, 0 )
	BlackBar:setAlpha( 0.27 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local Status = LUI.UIText.new()
	Status:setLeftRight( true, false, 553.5, 687.5 )
	Status:setTopBottom( true, false, 1.5, 23.5 )
	Status:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Status )
	self.Status = Status
	
	local GameType = LUI.UIText.new()
	GameType:setLeftRight( true, false, 367.5, 549.5 )
	GameType:setTopBottom( true, false, 1.5, 23.5 )
	GameType:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameType:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameType )
	self.GameType = GameType
	
	local ClientCount = LUI.UIText.new()
	ClientCount:setLeftRight( true, false, 275.5, 313.5 )
	ClientCount:setTopBottom( true, false, 1.5, 23.5 )
	ClientCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ClientCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ClientCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ClientCount )
	self.ClientCount = ClientCount
	
	local HostName = LUI.UIText.new()
	HostName:setLeftRight( true, false, 10, 275.5 )
	HostName:setTopBottom( true, false, 1.5, 23.5 )
	HostName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HostName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HostName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HostName )
	self.HostName = HostName
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -1, 3 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -2, 2 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
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
				self:setupElementClipCounter( 2 )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusBarB:close()
		element.FocusBarT:close()
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
