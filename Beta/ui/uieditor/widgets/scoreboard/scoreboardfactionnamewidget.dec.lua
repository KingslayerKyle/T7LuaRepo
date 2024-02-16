require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.ScoreboardFactionNameWidget = InheritFrom( LUI.UIElement )
CoD.ScoreboardFactionNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ScoreboardFactionNameWidget )
	self.id = "ScoreboardFactionNameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 73 )
	self:setTopBottom( true, false, 0, 26 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 0, -1 )
	TitleGlow1:setTopBottom( true, true, 0, 0 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local FactionName = LUI.UIText.new()
	FactionName:setLeftRight( true, true, 12.98, 8.02 )
	FactionName:setTopBottom( false, false, -9.5, 9.5 )
	FactionName:setRGB( 0, 0, 0 )
	FactionName:setText( Engine.Localize( "MPUI_AXIS_CAPS" ) )
	FactionName:setTTF( "fonts/escom.ttf" )
	FactionName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	FactionName:setShaderVector( 0, 0.05, 0, 0, 0 )
	FactionName:setShaderVector( 1, 0, 0, 0, 0 )
	FactionName:setShaderVector( 2, 1, 0, 0, 0 )
	FactionName:setLetterSpacing( 1.9 )
	FactionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FactionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
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

