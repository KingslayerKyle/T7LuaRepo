-- c80bd0bb5f2659c0964263cb1da319c6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.ScoreboardFFANameWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardFFANameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.ScoreboardFFANameWidget )
	self.id = "ScoreboardFFANameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 73 )
	self:setTopBottom( true, false, 0, 26 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 0, -1 )
	TitleGlow1:setTopBottom( true, true, 0, 0 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local FactionName = LUI.UITightText.new()
	FactionName:setLeftRight( true, false, 2.48, 231.48 )
	FactionName:setTopBottom( false, false, -8, 8 )
	FactionName:setRGB( 0, 0, 0 )
	FactionName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	FactionName:setTTF( "fonts/escom.ttf" )
	FactionName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	FactionName:setShaderVector( 0, 0.05, 0, 0, 0 )
	FactionName:setShaderVector( 1, 0, 0, 0, 0 )
	FactionName:setShaderVector( 2, 1, 0, 0, 0 )
	FactionName:setLetterSpacing( 0.5 )

	LUI.OverrideFunction_CallOriginalFirst( FactionName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( FactionName )
	self.FactionName = FactionName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
