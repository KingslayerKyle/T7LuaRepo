require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.PlayerCard_Label = InheritFrom( LUI.UIElement )
CoD.PlayerCard_Label.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerCard_Label )
	self.id = "PlayerCard_Label"
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
	itemName:setTopBottom( false, false, -10, 10 )
	itemName:setRGB( 1, 1, 1 )
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
		CoD.PlayerCard_Label.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

