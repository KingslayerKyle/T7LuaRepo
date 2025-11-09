CoD.HostStateString = InheritFrom( LUI.UIElement )
CoD.HostStateString.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.HostStateString )
	self.id = "HostStateString"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 24 )
	
	local TextHostState = LUI.UIText.new()
	TextHostState:setLeftRight( true, false, 0, 500 )
	TextHostState:setTopBottom( true, false, 0, 25 )
	TextHostState:setRGB( 1, 1, 1 )
	TextHostState:setTTF( "fonts/default.ttf" )
	TextHostState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextHostState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextHostState:subscribeToGlobalModel( controller, "LobbyGlobal", "leaderActivity", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextHostState:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextHostState )
	self.TextHostState = TextHostState
	
	self.close = function ( self )
		self.TextHostState:close()
		CoD.HostStateString.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

