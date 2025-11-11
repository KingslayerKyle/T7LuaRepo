require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLineSingle" )

CoD.CP_ConfirmSelection_Box = InheritFrom( LUI.UIElement )
CoD.CP_ConfirmSelection_Box.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CP_ConfirmSelection_Box )
	self.id = "CP_ConfirmSelection_Box"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 294 )
	
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
	
	local pixelU = LUI.UIImage.new()
	pixelU:setLeftRight( 1, 1, -11, 43 )
	pixelU:setTopBottom( 0, 0, -1, 4 )
	pixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU )
	self.pixelU = pixelU
	
	local pixelB = LUI.UIImage.new()
	pixelB:setLeftRight( 1, 1, -11, 43 )
	pixelB:setTopBottom( 1, 1, -2.5, 2.5 )
	pixelB:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelB )
	self.pixelB = pixelB
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( 0, 0, -43, 11 )
	pixelU0:setTopBottom( 0, 0, -1, 4 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local pixelB0 = LUI.UIImage.new()
	pixelB0:setLeftRight( 0, 0, -43, 11 )
	pixelB0:setTopBottom( 1, 1, -2.5, 2.5 )
	pixelB0:setZRot( 180 )
	pixelB0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelB0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelB0 )
	self.pixelB0 = pixelB0
	
	local FETitleLineSingle = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle:setLeftRight( 0, 1, 0, 6 )
	FETitleLineSingle:setTopBottom( 1, 1, -3, 3 )
	self:addElement( FETitleLineSingle )
	self.FETitleLineSingle = FETitleLineSingle
	
	local FETitleLineSingle0 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle0:setLeftRight( 0, 1, 0, 6 )
	FETitleLineSingle0:setTopBottom( 0, 0, -3, 3 )
	self:addElement( FETitleLineSingle0 )
	self.FETitleLineSingle0 = FETitleLineSingle0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleLineSingle:close()
		self.FETitleLineSingle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

