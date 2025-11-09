require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.KillcamWidgetTitle = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetTitle )
	self.id = "KillcamWidgetTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 702 )
	self:setTopBottom( true, false, 0, 53 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, 2, -5 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.2 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( true, true, 2, -5 )
	FETitleNumBrdr0:setRGB( 1, 1, 1 )
	FETitleNumBrdr0:setAlpha( 0.5 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, -29, 7 )
	Pixel201000:setTopBottom( true, false, 1, 5 )
	Pixel201000:setRGB( 1, 1, 1 )
	Pixel201000:setAlpha( 0.54 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( true, false, -29, 7 )
	Pixel2010000:setTopBottom( false, true, -7, -3 )
	Pixel2010000:setRGB( 1, 1, 1 )
	Pixel2010000:setAlpha( 0.54 )
	Pixel2010000:setYRot( -180 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	local Pixel2010001 = LUI.UIImage.new()
	Pixel2010001:setLeftRight( false, true, -7, 29 )
	Pixel2010001:setTopBottom( true, false, 1, 5 )
	Pixel2010001:setRGB( 1, 1, 1 )
	Pixel2010001:setAlpha( 0.54 )
	Pixel2010001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010001 )
	self.Pixel2010001 = Pixel2010001
	
	local Pixel20100000 = LUI.UIImage.new()
	Pixel20100000:setLeftRight( false, true, -7, 29 )
	Pixel20100000:setTopBottom( false, true, -7, -3 )
	Pixel20100000:setRGB( 1, 1, 1 )
	Pixel20100000:setAlpha( 0.54 )
	Pixel20100000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100000 )
	self.Pixel20100000 = Pixel20100000
	
	local KillcamText0 = LUI.UITightText.new()
	KillcamText0:setLeftRight( false, false, -351, 351 )
	KillcamText0:setTopBottom( true, false, 0, 53 )
	KillcamText0:setRGB( 0.59, 0.64, 0.74 )
	KillcamText0:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
	KillcamText0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	KillcamText0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	KillcamText0:setShaderVector( 0, 0.2, 0, 0, 0 )
	KillcamText0:setShaderVector( 1, 0, 0, 0, 0 )
	KillcamText0:setShaderVector( 2, -50, -100, 0, 0 )
	KillcamText0:setShaderVector( 3, 0, 0, 0, 0 )
	KillcamText0:setShaderVector( 4, 0.24, 0.02, 0, 0 )
	KillcamText0:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( KillcamText0, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 30 )
	end )
	self:addElement( KillcamText0 )
	self.KillcamText0 = KillcamText0
	
	self.close = function ( self )
		self.FEButtonPanel0:close()
		self.FETitleNumBrdr0:close()
		CoD.KillcamWidgetTitle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

