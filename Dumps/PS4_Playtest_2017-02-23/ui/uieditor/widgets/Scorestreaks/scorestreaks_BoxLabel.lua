require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )

CoD.scorestreaks_BoxLabel = InheritFrom( LUI.UIElement )
CoD.scorestreaks_BoxLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scorestreaks_BoxLabel )
	self.id = "scorestreaks_BoxLabel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 171 )
	self:setTopBottom( 0, 0, 0, 28 )
	
	local Panel = CoD.FE_PanelNoBlur.new( menu, controller )
	Panel:setLeftRight( 0, 1, 0, 0 )
	Panel:setTopBottom( 0.5, 0.5, -14, 14 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local name = LUI.UITightText.new()
	name:setLeftRight( 0, 1, 2, -2 )
	name:setTopBottom( 0.5, 0.5, -14, 13 )
	name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	name:setLetterSpacing( 0.5 )
	name:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			name:setText( Engine.Localize( GetItemNameFromIndex( modelValue ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( name, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedUp( self, element, 2, 2 )
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

