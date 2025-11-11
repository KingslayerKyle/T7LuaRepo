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
	self:setLeftRight( 0, 0, 0, 364 )
	self:setTopBottom( 0, 0, 0, 43 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 0, 0 )
	Panel:setTopBottom( 0, 1, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( 0, 1, 8, 0 )
	itemName:setTopBottom( 1, 1, -27, 0 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setText( Engine.Localize( "WWWWWWWWWWWWWW" ) )
	itemName:setTTF( "fonts/Store.ttf" )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedUp( self, element, 1, 1 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( 0, 0, 183, 189 )
	featlineleft:setTopBottom( 0, 0, -191, 189 )
	featlineleft:setAlpha( 0 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	self.resetProperties = function ()
		itemName:completeAnimation()
		Panel:completeAnimation()
		itemName:setAlpha( 1 )
		Panel:setAlpha( 0.4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 0 )
				self.clipFinished( itemName, {} )
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

