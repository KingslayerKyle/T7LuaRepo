require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideGamerCardInternalWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingE" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLineSingle" )

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
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, -1, 1 )
	Background:setTopBottom( true, true, -2, 2 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.5 )
	Background:setImage( RegisterImage( "uie_t7_menu_frontend_buttonpanelfull" ) )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Background:setShaderVector( 0, 0.05, 0.05, 0, 0 )
	Background:setupNineSliceShader( 12, 12 )
	self:addElement( Background )
	self.Background = Background
	
	local LobbySlideGamerCardInternalWidget0 = CoD.LobbySlideGamerCardInternalWidget.new( menu, controller )
	LobbySlideGamerCardInternalWidget0:setLeftRight( true, false, -10, 330 )
	LobbySlideGamerCardInternalWidget0:setTopBottom( true, false, -10, 90 )
	LobbySlideGamerCardInternalWidget0:linkToElementModel( self, nil, false, function ( model )
		LobbySlideGamerCardInternalWidget0:setModel( model, controller )
	end )
	self:addElement( LobbySlideGamerCardInternalWidget0 )
	self.LobbySlideGamerCardInternalWidget0 = LobbySlideGamerCardInternalWidget0
	
	local FELabelSubHeadingE0 = CoD.FE_LabelSubHeadingE.new( menu, controller )
	FELabelSubHeadingE0:setLeftRight( true, false, 10, 313 )
	FELabelSubHeadingE0:setTopBottom( true, false, 35, 57 )
	FELabelSubHeadingE0.Label0:setText( Engine.Localize( "asda" ) )
	FELabelSubHeadingE0.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FELabelSubHeadingE0 )
	self.FELabelSubHeadingE0 = FELabelSubHeadingE0
	
	local FELabelSubHeadingE1 = CoD.FE_LabelSubHeadingE.new( menu, controller )
	FELabelSubHeadingE1:setLeftRight( true, false, 10, 313 )
	FELabelSubHeadingE1:setTopBottom( true, false, 11, 34 )
	FELabelSubHeadingE1.Label0:setText( Engine.Localize( "Hendricks" ) )
	FELabelSubHeadingE1.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( FELabelSubHeadingE1 )
	self.FELabelSubHeadingE1 = FELabelSubHeadingE1
	
	local PixelB = LUI.UIImage.new()
	PixelB:setLeftRight( false, true, -7, 29 )
	PixelB:setTopBottom( false, false, 38.25, 41.75 )
	PixelB:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	PixelB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( PixelB )
	self.PixelB = PixelB
	
	local PixelU = LUI.UIImage.new()
	PixelU:setLeftRight( false, true, -7, 29 )
	PixelU:setTopBottom( false, false, -40.75, -37.25 )
	PixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	PixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( PixelU )
	self.PixelU = PixelU
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( false, true, -349, -313 )
	pixelU0:setTopBottom( false, false, -42, -38.5 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local FETitleLineSingle0 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle0:setLeftRight( true, false, 0, 323.99 )
	FETitleLineSingle0:setTopBottom( true, false, -2, 2 )
	self:addElement( FETitleLineSingle0 )
	self.FETitleLineSingle0 = FETitleLineSingle0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -349, -313 )
	Image0:setTopBottom( false, false, 37.25, 40.75 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local FETitleLineSingle1 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle1:setLeftRight( true, false, 0, 323.99 )
	FETitleLineSingle1:setTopBottom( true, false, 78, 82 )
	self:addElement( FETitleLineSingle1 )
	self.FETitleLineSingle1 = FETitleLineSingle1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbySlideGamerCardInternalWidget0:close()
		element.FELabelSubHeadingE0:close()
		element.FELabelSubHeadingE1:close()
		element.FETitleLineSingle0:close()
		element.FETitleLineSingle1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

