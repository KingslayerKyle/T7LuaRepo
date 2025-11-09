require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.cac_ListButtonLabel = InheritFrom( LUI.UIElement )
CoD.cac_ListButtonLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ListButtonLabel )
	self.id = "cac_ListButtonLabel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( true, true, 0, 0 )
	Panel:setTopBottom( true, true, 0, 0 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( true, false, 5.18, 86 )
	itemName:setTopBottom( false, false, -8, 8 )
	itemName:setRGB( 0.82, 0.85, 0.88 )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 0.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( itemName, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 1 )
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
	self.close = function ( self )
		self.Panel:close()
		self.itemName:close()
		CoD.cac_ListButtonLabel.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

