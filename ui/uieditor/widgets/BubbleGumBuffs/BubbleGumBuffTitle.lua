-- dfe5cb354a4d26a8407aecae0d1bd950
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 25 )
	
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
	
	local EquippedBuffsLabel = LUI.UITightText.new()
	EquippedBuffsLabel:setLeftRight( true, true, 4, -4 )
	EquippedBuffsLabel:setTopBottom( true, false, 1, 23 )
	EquippedBuffsLabel:setRGB( 0, 0, 0 )
	EquippedBuffsLabel:setText( Engine.Localize( "MENU_EQUIPPED_BUBBLEGUM_PACK_CAPS" ) )
	EquippedBuffsLabel:setTTF( "fonts/escom.ttf" )
	EquippedBuffsLabel:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	EquippedBuffsLabel:setShaderVector( 0, 0.08, 0, 0, 0 )
	EquippedBuffsLabel:setShaderVector( 1, 0.02, 0, 0, 0 )
	EquippedBuffsLabel:setShaderVector( 2, 1, 0, 0, 0 )
	EquippedBuffsLabel:setLetterSpacing( 1 )

	LUI.OverrideFunction_CallOriginalFirst( EquippedBuffsLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 2 )
	end )
	self:addElement( EquippedBuffsLabel )
	self.EquippedBuffsLabel = EquippedBuffsLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

