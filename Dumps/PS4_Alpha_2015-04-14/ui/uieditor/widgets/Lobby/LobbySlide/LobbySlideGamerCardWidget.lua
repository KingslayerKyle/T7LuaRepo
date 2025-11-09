require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideGamerCardInternalWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingE" )

CoD.LobbySlideGamerCardWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideGamerCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideGamerCardWidget )
	self.id = "LobbySlideGamerCardWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, false, 0, 320 )
	FEButtonPanelShaderContainer0:setTopBottom( true, false, 0, 80 )
	FEButtonPanelShaderContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanelShaderContainer0:setZoom( -10 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local LobbySlideGamerCardInternalWidget0 = CoD.LobbySlideGamerCardInternalWidget.new( menu, controller )
	LobbySlideGamerCardInternalWidget0:setLeftRight( true, false, -10, 330 )
	LobbySlideGamerCardInternalWidget0:setTopBottom( true, false, -10, 90 )
	LobbySlideGamerCardInternalWidget0:setRGB( 1, 1, 1 )
	self:addElement( LobbySlideGamerCardInternalWidget0 )
	self.LobbySlideGamerCardInternalWidget0 = LobbySlideGamerCardInternalWidget0
	
	local FELabelSubHeadingE0 = CoD.FE_LabelSubHeadingE.new( menu, controller )
	FELabelSubHeadingE0:setLeftRight( true, false, 7, 55 )
	FELabelSubHeadingE0:setTopBottom( true, false, 29, 51 )
	FELabelSubHeadingE0:setRGB( 1, 1, 1 )
	FELabelSubHeadingE0.FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	FELabelSubHeadingE0.Label0:setRGB( 1, 1, 1 )
	FELabelSubHeadingE0.Label0:setText( Engine.Localize( "3ARC" ) )
	FELabelSubHeadingE0.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FELabelSubHeadingE0 )
	self.FELabelSubHeadingE0 = FELabelSubHeadingE0
	
	local FELabelSubHeadingE1 = CoD.FE_LabelSubHeadingE.new( menu, controller )
	FELabelSubHeadingE1:setLeftRight( true, false, 7, 81 )
	FELabelSubHeadingE1:setTopBottom( true, false, 6, 29 )
	FELabelSubHeadingE1:setRGB( 1, 1, 1 )
	FELabelSubHeadingE1.FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	FELabelSubHeadingE1.Label0:setRGB( 1, 1, 1 )
	FELabelSubHeadingE1.Label0:setText( Engine.Localize( "Hendricks" ) )
	FELabelSubHeadingE1.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FELabelSubHeadingE1 )
	self.FELabelSubHeadingE1 = FELabelSubHeadingE1
	
	local PixelB = LUI.UIImage.new()
	PixelB:setLeftRight( false, true, -7, 29 )
	PixelB:setTopBottom( false, false, 38.25, 41.75 )
	PixelB:setRGB( 1, 1, 1 )
	PixelB:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	PixelB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( PixelB )
	self.PixelB = PixelB
	
	local PixelU = LUI.UIImage.new()
	PixelU:setLeftRight( false, true, -7, 29 )
	PixelU:setTopBottom( false, false, -40.75, -37.25 )
	PixelU:setRGB( 1, 1, 1 )
	PixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	PixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( PixelU )
	self.PixelU = PixelU
	
	self.close = function ( self )
		self.FEButtonPanelShaderContainer0:close()
		self.LobbySlideGamerCardInternalWidget0:close()
		self.FELabelSubHeadingE0:close()
		self.FELabelSubHeadingE1:close()
		CoD.LobbySlideGamerCardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

