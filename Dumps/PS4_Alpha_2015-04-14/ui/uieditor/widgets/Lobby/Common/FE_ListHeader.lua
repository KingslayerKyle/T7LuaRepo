require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )

CoD.FE_ListHeader = InheritFrom( LUI.UIElement )
CoD.FE_ListHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListHeader )
	self.id = "FE_ListHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 117 )
	self:setTopBottom( true, false, 0, 28 )
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, true, 0, 0 )
	FEListHeaderGlow0:setTopBottom( true, true, 0, 0 )
	FEListHeaderGlow0:setRGB( 1, 1, 1 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local btnDisplayTextStroke = LUI.UITightText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 6, 117 )
	btnDisplayTextStroke:setTopBottom( false, false, -9, 11 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	btnDisplayTextStroke:setTTF( "fonts/Entovo.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.09, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0.06, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 2.5 )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 15 )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	self.close = function ( self )
		self.FEListHeaderGlow0:close()
		CoD.FE_ListHeader.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

