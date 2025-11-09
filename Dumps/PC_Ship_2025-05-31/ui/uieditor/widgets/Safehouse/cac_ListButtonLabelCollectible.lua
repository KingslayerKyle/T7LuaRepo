require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.cac_ListButtonLabelCollectible = InheritFrom( LUI.UIElement )
CoD.cac_ListButtonLabelCollectible.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ListButtonLabelCollectible )
	self.id = "cac_ListButtonLabelCollectible"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( true, false, 0, 102 )
	itemName:setTopBottom( false, true, -19.5, 0 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			itemName:setText( Engine.Localize( name ) )
		end
	end )
	itemName:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, controller )
		ScaleWidgetToLabelWrappedUp( self, element, 1, 1 )
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0.4 )
				self.clipFinished( Panel, {} )
				itemName:completeAnimation()
				self.itemName:setAlpha( 1 )
				self.clipFinished( itemName, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.itemName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

