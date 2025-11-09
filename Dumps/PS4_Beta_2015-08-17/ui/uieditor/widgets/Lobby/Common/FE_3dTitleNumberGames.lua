require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingB" )

CoD.FE_3dTitleNumberGames = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleNumberGames.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FE_3dTitleNumberGames )
	self.id = "FE_3dTitleNumberGames"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 23 )
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( false, false, -11, 11 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local FELabelSubHeadingB0 = CoD.FE_LabelSubHeadingB.new( menu, controller )
	FELabelSubHeadingB0:setLeftRight( true, true, 7.13, 0 )
	FELabelSubHeadingB0:setTopBottom( true, false, 4.5, 23.5 )
	FELabelSubHeadingB0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FELabelSubHeadingB0:setShaderVector( 0, 0.05, 0, 0, 0 )
	FELabelSubHeadingB0:setShaderVector( 1, 0, 0, 0, 0 )
	FELabelSubHeadingB0:setShaderVector( 2, 0, 0, 0, 0 )
	FELabelSubHeadingB0:setShaderVector( 3, 0, 0, 0, 0 )
	FELabelSubHeadingB0:setShaderVector( 4, 0, 0, 0, 0 )
	FELabelSubHeadingB0.Label1:setRGB( 0.71, 0.76, 0.77 )
	FELabelSubHeadingB0.Label1:setText( Engine.Localize( "MENU_NUMPLAYERS_CAPS" ) )
	FELabelSubHeadingB0.Label1:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( FELabelSubHeadingB0, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( FELabelSubHeadingB0 )
	self.FELabelSubHeadingB0 = FELabelSubHeadingB0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr0:close()
		self.FELabelSubHeadingB0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

