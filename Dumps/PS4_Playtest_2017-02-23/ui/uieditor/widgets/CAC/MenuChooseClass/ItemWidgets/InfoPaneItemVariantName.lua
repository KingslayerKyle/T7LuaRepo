require( "ui.uieditor.widgets.BackgroundFrames.BackgroundPattern02" )
require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

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
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 60 )
	
	local TitleGlow1 = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlow1:setLeftRight( 0, 1, -3, 5 )
	TitleGlow1:setTopBottom( 0, 1, -4, 4 )
	TitleGlow1:setRGB( 0.9, 0.9, 0.9 )
	TitleGlow1:setAlpha( 0 )
	self:addElement( TitleGlow1 )
	self.TitleGlow1 = TitleGlow1
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -80, 74 )
	Glow:setTopBottom( 0.5, 0.5, -45, 65 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( 0.5, 0.5, -27, 27 )
	CACvarientTitlePanel0:setAlpha( 0.37 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local BackgroundPattern020 = CoD.BackgroundPattern02.new( menu, controller )
	BackgroundPattern020:setLeftRight( 0, 1, 0, 0 )
	BackgroundPattern020:setTopBottom( 0.5, 0.5, -27, 27 )
	BackgroundPattern020:setRGB( 0.28, 0.28, 0.31 )
	BackgroundPattern020:setAlpha( 0.43 )
	self:addElement( BackgroundPattern020 )
	self.BackgroundPattern020 = BackgroundPattern020
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( 0, 0, 21, 126 )
	itemName:setTopBottom( 0.5, 0.5, -22, 26 )
	itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 0.6 )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlow1:close()
		self.CACvarientTitlePanel0:close()
		self.BackgroundPattern020:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

