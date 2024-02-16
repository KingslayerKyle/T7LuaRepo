require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingD" )

CoD.FE_SlideSubHeader = InheritFrom( LUI.UIElement )
CoD.FE_SlideSubHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_SlideSubHeader )
	self.id = "FE_SlideSubHeader"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 36 )
	
	local ImageBorder0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	ImageBorder0:setLeftRight( true, true, 0, 0 )
	ImageBorder0:setTopBottom( false, false, -18, 16 )
	self:addElement( ImageBorder0 )
	self.ImageBorder0 = ImageBorder0
	
	local FELabelSubHeadingD0 = CoD.FE_LabelSubHeadingD.new( menu, controller )
	FELabelSubHeadingD0:setLeftRight( true, false, 7.1, 124.1 )
	FELabelSubHeadingD0:setTopBottom( true, false, 4, 36 )
	FELabelSubHeadingD0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FELabelSubHeadingD0:setShaderVector( 0, 0.05, 0, 0, 0 )
	FELabelSubHeadingD0:setShaderVector( 1, 0, 0, 0, 0 )
	FELabelSubHeadingD0:setShaderVector( 2, 0, 0, 0, 0 )
	FELabelSubHeadingD0:setShaderVector( 3, 0, 0, 0, 0 )
	FELabelSubHeadingD0:setShaderVector( 4, 0, 0, 0, 0 )
	FELabelSubHeadingD0.Label0:setText( Engine.Localize( "" ) )
	FELabelSubHeadingD0.Label0:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( FELabelSubHeadingD0, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 3 )
	end )
	self:addElement( FELabelSubHeadingD0 )
	self.FELabelSubHeadingD0 = FELabelSubHeadingD0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ImageBorder0:close()
		self.FELabelSubHeadingD0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

