require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.InfoPaneItemNameLabel = InheritFrom( LUI.UIElement )
CoD.InfoPaneItemNameLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InfoPaneItemNameLabel )
	self.id = "InfoPaneItemNameLabel"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 40 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, 0, 0 )
	TitleGlow1:setTopBottom( true, true, -2.5, 2.5 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52.93, 49.07 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setAlpha( 0.5 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( true, true, 3, -3 )
	itemName:setTopBottom( false, false, -15, 17 )
	itemName:setRGB( 0, 0, 0 )
	itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName:setTTF( "fonts/escom.ttf" )
	itemName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	itemName:setShaderVector( 0, 0.06, 0, 0, 0 )
	itemName:setShaderVector( 1, 0.02, 0, 0, 0 )
	itemName:setShaderVector( 2, 1, 0, 0, 0 )
	itemName:setLetterSpacing( 0.6 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 1 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local Guide = LUI.UIImage.new()
	Guide:setLeftRight( true, false, 0, 3 )
	Guide:setTopBottom( true, false, 0.71, 34 )
	Guide:setRGB( 1, 0.61, 0.15 )
	Guide:setAlpha( 0 )
	self:addElement( Guide )
	self.Guide = Guide
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

