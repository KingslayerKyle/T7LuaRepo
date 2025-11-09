require( "ui.uieditor.widgets.Border" )

CoD.colorSwatch = InheritFrom( LUI.UIElement )
CoD.colorSwatch.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.colorSwatch )
	self.id = "colorSwatch"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.82, 0.28, 0.28 )
	self:addElement( background )
	self.background = background
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setAlpha( 0.45 )
	self:addElement( border )
	self.border = border
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.border:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

