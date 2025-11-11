require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.StorePriceLabel = InheritFrom( LUI.UIElement )
CoD.StorePriceLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StorePriceLabel )
	self.id = "StorePriceLabel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 156 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 0, 0 )
	Panel:setTopBottom( 0.5, 0.5, -15, 15 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -42, 50 )
	Glow:setTopBottom( 0.5, 0.5, -27, 32 )
	Glow:setRGB( 0.3, 0.23, 0.2 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( 1, 1, -156, -6 )
	itemName:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	itemName:setTTF( "fonts/Store.ttf" )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabelRightAligned( self, element, 6 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

