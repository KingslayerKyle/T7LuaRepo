require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )

CoD.MapVoteLabelUpper = InheritFrom( LUI.UIElement )
CoD.MapVoteLabelUpper.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapVoteLabelUpper )
	self.id = "MapVoteLabelUpper"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 265 )
	self:setTopBottom( 0, 0, 0, 31 )
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( 0, 1, 0, 0 )
	FEListHeaderGlow0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local btnDisplayTextStroke = LUI.UITightText.new()
	btnDisplayTextStroke:setLeftRight( 0, 0, 6, 525 )
	btnDisplayTextStroke:setTopBottom( 0, 0, 1, 31 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.09, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0.06, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 2.5 )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, text )
		ScaleWidgetToLabelLeftJustify( self, element, 2 )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEListHeaderGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

