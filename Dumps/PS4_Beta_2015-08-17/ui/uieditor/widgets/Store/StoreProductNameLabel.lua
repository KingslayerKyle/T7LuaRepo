require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.StoreProductNameLabel = InheritFrom( LUI.UIElement )
CoD.StoreProductNameLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StoreProductNameLabel )
	self.id = "StoreProductNameLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 243 )
	self:setTopBottom( true, false, 0, 29 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, false, 0, 243 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( true, false, 5, 243 )
	itemName:setTopBottom( false, true, -18, 0 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedUp( self, element, 1, 1 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( true, false, 122, 126 )
	featlineleft:setTopBottom( true, false, -127, 126 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

