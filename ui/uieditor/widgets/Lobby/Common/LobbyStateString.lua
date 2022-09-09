-- f86ae0c27c0cfbffe079e7d76a0a0d05
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( true, true, -2, 0 )
	FEMemberBlurPanelContainer0:setTopBottom( true, true, -2, 0 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEMemberBlurPanelContainer0:setAlpha( 0 )
	FEMemberBlurPanelContainer0.FEMemberBlurPanel0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local TextState = LUI.UIText.new()
	TextState:setLeftRight( true, false, 0, 400 )
	TextState:setTopBottom( true, false, 0, 20 )
	TextState:setAlpha( 0 )
	TextState:setText( Engine.Localize( "MENU_NEW" ) )
	TextState:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextState:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( TextState, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 2, 0 )
	end )
	self:addElement( TextState )
	self.TextState = TextState
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextState:completeAnimation()
				self.TextState:setAlpha( 0 )
				self.clipFinished( TextState, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextState:completeAnimation()
				self.TextState:setAlpha( 1 )
				self.clipFinished( TextState, {} )
			end
		},
		VisibleWithBackground = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMemberBlurPanelContainer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
