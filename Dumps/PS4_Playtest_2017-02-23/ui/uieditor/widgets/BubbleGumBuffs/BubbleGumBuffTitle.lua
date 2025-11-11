require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.BubbleGumBuffTitle = InheritFrom( LUI.UIElement )
CoD.BubbleGumBuffTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumBuffTitle )
	self.id = "BubbleGumBuffTitle"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 384 )
	self:setTopBottom( 0, 0, 0, 37 )
	
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
	
	local EquippedBuffsLabel = LUI.UITightText.new()
	EquippedBuffsLabel:setLeftRight( 0, 0, 6, 354 )
	EquippedBuffsLabel:setTopBottom( 0, 0, 1, 34 )
	EquippedBuffsLabel:setRGB( 0, 0, 0 )
	EquippedBuffsLabel:setText( Engine.Localize( "MENU_EQUIPPED_BUBBLEGUM_PACK_CAPS" ) )
	EquippedBuffsLabel:setTTF( "fonts/escom.ttf" )
	EquippedBuffsLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	EquippedBuffsLabel:setShaderVector( 0, 0.08, 0, 0, 0 )
	EquippedBuffsLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	EquippedBuffsLabel:setShaderVector( 2, 1, 0, 0, 0 )
	EquippedBuffsLabel:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( EquippedBuffsLabel, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( EquippedBuffsLabel )
	self.EquippedBuffsLabel = EquippedBuffsLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

