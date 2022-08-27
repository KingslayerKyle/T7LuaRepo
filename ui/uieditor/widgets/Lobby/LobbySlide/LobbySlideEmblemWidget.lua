-- 764c5201baca4184ac665ffa62fb3de3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideEmblemInternalWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLineSingle" )

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
	
	local pixelU = LUI.UIImage.new()
	pixelU:setLeftRight( false, true, -7, 29 )
	pixelU:setTopBottom( false, false, -98.75, -95.25 )
	pixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU )
	self.pixelU = pixelU
	
	local pixelB = LUI.UIImage.new()
	pixelB:setLeftRight( false, true, -7, 29 )
	pixelB:setTopBottom( false, false, 96.25, 99.75 )
	pixelB:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelB )
	self.pixelB = pixelB
	
	local EmblemAdd = CoD.LobbySlideEmblemInternalWidget.new( menu, controller )
	EmblemAdd:setLeftRight( true, false, -10, 331 )
	EmblemAdd:setTopBottom( true, false, -10, 207 )
	self:addElement( EmblemAdd )
	self.EmblemAdd = EmblemAdd
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( false, true, -349, -313 )
	pixelU0:setTopBottom( false, false, -98.75, -95.25 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local pixelB0 = LUI.UIImage.new()
	pixelB0:setLeftRight( false, true, -349, -313 )
	pixelB0:setTopBottom( false, false, 96.25, 99.75 )
	pixelB0:setZRot( 180 )
	pixelB0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelB0 )
	self.pixelB0 = pixelB0
	
	local FETitleLineSingle = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle:setLeftRight( true, false, 0, 323.99 )
	FETitleLineSingle:setTopBottom( true, false, 194.25, 198.25 )
	self:addElement( FETitleLineSingle )
	self.FETitleLineSingle = FETitleLineSingle
	
	local FETitleLineSingle0 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle0:setLeftRight( true, false, 0, 323.99 )
	FETitleLineSingle0:setTopBottom( true, false, -2, 2 )
	self:addElement( FETitleLineSingle0 )
	self.FETitleLineSingle0 = FETitleLineSingle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.EmblemAdd:close()
		element.FETitleLineSingle:close()
		element.FETitleLineSingle0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

