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
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( false, false, -10, 10 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -28, 33 )
	Glow:setTopBottom( false, false, -18.3, 21.3 )
	Glow:setRGB( 0.3, 0.23, 0.2 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( false, true, -104, -4 )
	itemName:setTopBottom( false, false, -9, 9 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAligned( self, element, 6 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

