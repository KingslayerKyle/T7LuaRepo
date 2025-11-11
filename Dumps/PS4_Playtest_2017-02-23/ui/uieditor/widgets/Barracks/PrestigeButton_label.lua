require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.PrestigeButton_label = InheritFrom( LUI.UIElement )
CoD.PrestigeButton_label.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrestigeButton_label )
	self.id = "PrestigeButton_label"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 265 )
	self:setTopBottom( 0, 0, 0, 28 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 0, 0 )
	Panel:setTopBottom( 0.5, 0.5, -14, 14 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local name = LUI.UITightText.new()
	name:setLeftRight( 0, 1, 3, -1 )
	name:setTopBottom( 0.5, 0.5, -14, 13 )
	name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	name:setLetterSpacing( 0.5 )
	name:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			name:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	name:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	LUI.OverrideFunction_CallOriginalFirst( name, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 3 )
	end )
	self:addElement( name )
	self.name = name
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Panel:close()
		self.name:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

