-- 90a9d627ebfaf0a9830a4ad9a788c27c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )
require( "ui.uieditor.widgets.BackgroundFrames.BackgroundPattern02" )

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
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
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
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( true, true, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( false, false, -18, 18 )
	CACvarientTitlePanel0:setAlpha( 0.37 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local BackgroundPattern020 = CoD.BackgroundPattern02.new( menu, controller )
	BackgroundPattern020:setLeftRight( true, true, 0, 0 )
	BackgroundPattern020:setTopBottom( false, false, -18, 18 )
	BackgroundPattern020:setRGB( 0.28, 0.28, 0.31 )
	BackgroundPattern020:setAlpha( 0.43 )
	self:addElement( BackgroundPattern020 )
	self.BackgroundPattern020 = BackgroundPattern020
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( true, false, 14, 83.8 )
	itemName:setTopBottom( false, false, -15, 17 )
	itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 0.6 )

	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlow1:close()
		element.CACvarientTitlePanel0:close()
		element.BackgroundPattern020:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

