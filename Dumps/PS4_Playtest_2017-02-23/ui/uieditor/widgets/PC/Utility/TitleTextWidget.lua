require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.TitleTextWidget = InheritFrom( LUI.UIElement )
CoD.TitleTextWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TitleTextWidget )
	self.id = "TitleTextWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 51 )
	
	local titleGlow = CoD.cac_ItemTitleGlow.new( menu, controller )
	titleGlow:setLeftRight( 0, 1, -3, 5 )
	titleGlow:setTopBottom( 0, 1, -4, 4 )
	titleGlow:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( titleGlow )
	self.titleGlow = titleGlow
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( 0, 0, 4, 109 )
	itemName:setTopBottom( 0.5, 0.5, -22, 26 )
	itemName:setRGB( 0, 0, 0 )
	itemName:setText( Engine.Localize( "MENU_NEW" ) )
	itemName:setTTF( "fonts/escom.ttf" )
	itemName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	itemName:setShaderVector( 0, 0.06, 0, 0, 0 )
	itemName:setShaderVector( 1, 0.02, 0, 0, 0 )
	itemName:setShaderVector( 2, 1, 0, 0, 0 )
	itemName:setLetterSpacing( 0.6 )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 5 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -80, 74 )
	Glow:setTopBottom( 0.5, 0.5, -45, 65 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.titleGlow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

