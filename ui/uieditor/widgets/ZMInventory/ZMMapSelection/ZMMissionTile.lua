-- 9d101f33e5365adf3da22a2964828193
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 312 )
	self:setTopBottom( true, false, 0, 36 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2, 3 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -53.43, 48.57 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0.37 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local MapName = LUI.UIText.new()
	MapName:setLeftRight( true, false, 6, 315 )
	MapName:setTopBottom( true, false, 1, 35 )
	MapName:setRGB( 0, 0, 0 )
	MapName:setText( Engine.Localize( "MENU_NEW" ) )
	MapName:setTTF( "fonts/escom.ttf" )
	MapName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	MapName:setShaderVector( 0, 0.06, 0, 0, 0 )
	MapName:setShaderVector( 1, 0.02, 0, 0, 0 )
	MapName:setShaderVector( 2, 1, 0, 0, 0 )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	MapName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( MapName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

