CoD.LobbyStateString = InheritFrom( LUI.UIElement )
CoD.LobbyStateString.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LobbyStateString )
	self.id = "LobbyStateString"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 24 )
	
	local TextState = LUI.UIText.new()
	TextState:setLeftRight( true, false, 0, 454 )
	TextState:setTopBottom( true, false, 0, 20 )
	TextState:setAlpha( 0 )
	TextState:setText( Engine.Localize( "MENU_NEW" ) )
	TextState:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextState )
	self.TextState = TextState
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextState:completeAnimation()
				self.TextState:setAlpha( 0 )
				self.clipFinished( TextState, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextState:completeAnimation()
				self.TextState:setAlpha( 1 )
				self.clipFinished( TextState, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

