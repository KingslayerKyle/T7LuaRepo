require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.ZMMissionTile = InheritFrom( LUI.UIElement )
CoD.ZMMissionTile.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ZMMissionTile )
	self.id = "ZMMissionTile"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( 0, 0, 0, 468 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, -3, 5 )
	TitleGlow1:setTopBottom( 0, 1, -4, 4 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -81, 73 )
	Glow:setTopBottom( 0.5, 0.5, -45, 65 )
	Glow:setAlpha( 0.37 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local MapName = LUI.UIText.new()
	MapName:setLeftRight( 0, 0, 9, 473 )
	MapName:setTopBottom( 0, 0, 2, 53 )
	MapName:setRGB( 0, 0, 0 )
	MapName:setText( Engine.Localize( "MENU_NEW" ) )
	MapName:setTTF( "fonts/escom.ttf" )
	MapName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	MapName:setShaderVector( 0, 0.06, 0, 0, 0 )
	MapName:setShaderVector( 1, 0.02, 0, 0, 0 )
	MapName:setShaderVector( 2, 1, 0, 0, 0 )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( MapName, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

