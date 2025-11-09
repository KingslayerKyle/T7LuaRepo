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
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	self:addElement( border )
	self.border = border
	
	self.close = function ( self )
		self.border:close()
		CoD.colorSwatch.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

