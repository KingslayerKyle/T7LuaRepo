require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideEmblemInternalWidget" )

CoD.LobbySlideEmblemWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideEmblemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideEmblemWidget )
	self.id = "LobbySlideEmblemWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 196 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, 0, 321 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 0, 197 )
	FEButtonPanelShaderContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanelShaderContainer0:setZoom( -10 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local pixelU = LUI.UIImage.new()
	pixelU:setLeftRight( false, true, -7, 29 )
	pixelU:setTopBottom( false, false, -98.75, -95.25 )
	pixelU:setRGB( 1, 1, 1 )
	pixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU )
	self.pixelU = pixelU
	
	local pixelB = LUI.UIImage.new()
	pixelB:setLeftRight( false, true, -7, 29 )
	pixelB:setTopBottom( false, false, 96.25, 99.75 )
	pixelB:setRGB( 1, 1, 1 )
	pixelB:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelB )
	self.pixelB = pixelB
	
	local EmblemAdd = CoD.LobbySlideEmblemInternalWidget.new( menu, controller )
	EmblemAdd:setLeftRight( true, false, -10, 331 )
	EmblemAdd:setTopBottom( true, false, -10, 207 )
	self:addElement( EmblemAdd )
	self.EmblemAdd = EmblemAdd
	
	self.close = function ( self )
		self.FEButtonPanelShaderContainer0:close()
		self.EmblemAdd:close()
		CoD.LobbySlideEmblemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

