require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.InfoPaneItemVariantName = InheritFrom( LUI.UIElement )
CoD.InfoPaneItemVariantName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InfoPaneItemVariantName )
	self.id = "InfoPaneItemVariantName"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 34 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( true, true, -2, 3 )
	TitleGlow1:setTopBottom( true, true, -3, 3 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	TitleGlow1:setAlpha( 0 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -52.93, 49.07 )
	Glow:setTopBottom( false, false, -30, 43 )
	Glow:setRGB( 1, 1, 1 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( true, false, 14, 83.8 )
	itemName:setTopBottom( false, false, -15, 17 )
	itemName:setRGB( 1, 1, 1 )
	itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	itemName:setShaderVector( 0, 0.06, 0, 0, 0 )
	itemName:setShaderVector( 1, 0.02, 0, 0, 0 )
	itemName:setShaderVector( 2, 1, 0, 0, 0 )
	itemName:setLetterSpacing( 0.6 )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	self.close = function ( self )
		self.TitleGlow1:close()
		CoD.InfoPaneItemVariantName.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

