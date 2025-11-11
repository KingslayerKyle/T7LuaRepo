require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingE" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLineSingle" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideGamerCardInternalWidget" )

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
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, -2, 2 )
	Background:setTopBottom( 0, 1, -3, 3 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.5 )
	Background:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background:setShaderVector( 0, 0, 0, 0, 0 )
	Background:setupNineSliceShader( 18, 18 )
	self:addElement( Background )
	self.Background = Background
	
	local LobbySlideGamerCardInternalWidget0 = CoD.LobbySlideGamerCardInternalWidget.new( menu, controller )
	LobbySlideGamerCardInternalWidget0:setLeftRight( 0, 0, -15, 495 )
	LobbySlideGamerCardInternalWidget0:setTopBottom( 0, 0, -15, 135 )
	LobbySlideGamerCardInternalWidget0:linkToElementModel( self, nil, false, function ( model )
		LobbySlideGamerCardInternalWidget0:setModel( model, controller )
	end )
	self:addElement( LobbySlideGamerCardInternalWidget0 )
	self.LobbySlideGamerCardInternalWidget0 = LobbySlideGamerCardInternalWidget0
	
	local FELabelSubHeadingE0 = CoD.FE_LabelSubHeadingE.new( menu, controller )
	FELabelSubHeadingE0:setLeftRight( 0, 0, 15, 469 )
	FELabelSubHeadingE0:setTopBottom( 0, 0, 52.5, 85.5 )
	FELabelSubHeadingE0.Label0:setText( Engine.Localize( "asda" ) )
	FELabelSubHeadingE0.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FELabelSubHeadingE0 )
	self.FELabelSubHeadingE0 = FELabelSubHeadingE0
	
	local FELabelSubHeadingE1 = CoD.FE_LabelSubHeadingE.new( menu, controller )
	FELabelSubHeadingE1:setLeftRight( 0, 0, 15, 469 )
	FELabelSubHeadingE1:setTopBottom( 0, 0, 17, 51 )
	FELabelSubHeadingE1.Label0:setText( Engine.Localize( "Hendricks" ) )
	FELabelSubHeadingE1.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FELabelSubHeadingE1 )
	self.FELabelSubHeadingE1 = FELabelSubHeadingE1
	
	local PixelB = LUI.UIImage.new()
	PixelB:setLeftRight( 1, 1, -11, 43 )
	PixelB:setTopBottom( 0.5, 0.5, 57, 62 )
	PixelB:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	PixelB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( PixelB )
	self.PixelB = PixelB
	
	local PixelU = LUI.UIImage.new()
	PixelU:setLeftRight( 1, 1, -11, 43 )
	PixelU:setTopBottom( 0.5, 0.5, -61, -56 )
	PixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	PixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( PixelU )
	self.PixelU = PixelU
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( 1, 1, -523, -469 )
	pixelU0:setTopBottom( 0.5, 0.5, -63, -58 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local FETitleLineSingle0 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle0:setLeftRight( 0, 0, 0, 486 )
	FETitleLineSingle0:setTopBottom( 0, 0, -3, 3 )
	self:addElement( FETitleLineSingle0 )
	self.FETitleLineSingle0 = FETitleLineSingle0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 1, 1, -523, -469 )
	Image0:setTopBottom( 0.5, 0.5, 56, 61 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FETitleLineSingle1 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle1:setLeftRight( 0, 0, 0, 486 )
	FETitleLineSingle1:setTopBottom( 0, 0, 117, 123 )
	self:addElement( FETitleLineSingle1 )
	self.FETitleLineSingle1 = FETitleLineSingle1
	
	LobbySlideGamerCardInternalWidget0.id = "LobbySlideGamerCardInternalWidget0"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbySlideGamerCardInternalWidget0:close()
		self.FELabelSubHeadingE0:close()
		self.FELabelSubHeadingE1:close()
		self.FETitleLineSingle0:close()
		self.FETitleLineSingle1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

