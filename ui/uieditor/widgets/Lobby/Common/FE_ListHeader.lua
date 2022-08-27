-- 31ad343b07f1056300d47ae9c22ec200
-- This hash is used for caching, delete to decompile the file again

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
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 9, 320 )
	btnDisplayTextStroke:setTopBottom( false, true, -23, -3 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setText( Engine.Localize( "FEATURED" ) )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.06, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0.02, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 1 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListHeaderGlow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

