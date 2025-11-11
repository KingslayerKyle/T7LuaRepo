require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )

CoD.LobbyStateString = InheritFrom( LUI.UIElement )
CoD.LobbyStateString.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyStateString )
	self.id = "LobbyStateString"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( 0, 1, -4, 0 )
	FEMemberBlurPanelContainer0:setTopBottom( 0, 1, -4, 0 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEMemberBlurPanelContainer0:setAlpha( 0 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local TextState = LUI.UIText.new()
	TextState:setLeftRight( 0, 0, 0, 600 )
	TextState:setTopBottom( 0, 0, 0, 30 )
	TextState:setAlpha( 0 )
	TextState:setText( Engine.Localize( "MENU_NEW" ) )
	TextState:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( TextState, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 2, 0 )
	end )
	self:addElement( TextState )
	self.TextState = TextState
	
	self.resetProperties = function ()
		TextState:completeAnimation()
		FEMemberBlurPanelContainer0:completeAnimation()
		TextState:setAlpha( 0 )
		FEMemberBlurPanelContainer0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TextState:completeAnimation()
				self.TextState:setAlpha( 1 )
				self.clipFinished( TextState, {} )
			end
		},
		VisibleWithBackground = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )
				TextState:completeAnimation()
				self.TextState:setAlpha( 1 )
				self.clipFinished( TextState, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMemberBlurPanelContainer0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

