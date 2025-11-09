require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideTopInfo" )

CoD.LobbySlideTopInfoWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideTopInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideTopInfoWidget )
	self.id = "LobbySlideTopInfoWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, 0, 320 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, -3, 26 )
	FEButtonPanelShaderContainer0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local LobbySlideTopInfo0 = CoD.LobbySlideTopInfo.new( menu, controller )
	LobbySlideTopInfo0:setLeftRight( true, false, 0, 290.67 )
	LobbySlideTopInfo0:setTopBottom( true, false, 0, 24 )
	LobbySlideTopInfo0:setRGB( 1, 1, 1 )
	LobbySlideTopInfo0.Status2:setText( Engine.Localize( "In a Game Lobby" ) )
	self:addElement( LobbySlideTopInfo0 )
	self.LobbySlideTopInfo0 = LobbySlideTopInfo0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LobbySlideTopInfo0:completeAnimation()
				self.LobbySlideTopInfo0:setAlpha( 1 )
				self.clipFinished( LobbySlideTopInfo0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LobbySlideTopInfo0:completeAnimation()
				self.LobbySlideTopInfo0:setAlpha( 0 )
				self.clipFinished( LobbySlideTopInfo0, {} )
			end
		}
	}
	self.close = function ( self )
		self.FEButtonPanelShaderContainer0:close()
		self.LobbySlideTopInfo0:close()
		CoD.LobbySlideTopInfoWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

