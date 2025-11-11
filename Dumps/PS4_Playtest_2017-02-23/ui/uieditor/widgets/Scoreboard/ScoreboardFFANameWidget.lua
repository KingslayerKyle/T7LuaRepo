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
	self:setLeftRight( 0, 0, 0, 109 )
	self:setTopBottom( 0, 0, 0, 39 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, 0, -2 )
	TitleGlow1:setTopBottom( 0, 1, 0, 0 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local FactionName = LUI.UITightText.new()
	FactionName:setLeftRight( 0, 0, 3, 347 )
	FactionName:setTopBottom( 0.5, 0.5, -12, 12 )
	FactionName:setRGB( 0, 0, 0 )
	FactionName:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	FactionName:setTTF( "fonts/escom.ttf" )
	FactionName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	FactionName:setShaderVector( 0, 0.05, 0, 0, 0 )
	FactionName:setShaderVector( 1, 0, 0, 0, 0 )
	FactionName:setShaderVector( 2, 1, 0, 0, 0 )
	FactionName:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( FactionName, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 10 )
	end )
	self:addElement( FactionName )
	self.FactionName = FactionName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

