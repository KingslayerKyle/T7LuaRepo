CoD.uie_Border = InheritFrom( LUI.UIElement )
CoD.uie_Border.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.uie_Border )
	self.id = "uie_Border"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 540 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local top = LUI.UIImage.new()
	top:setLeftRight( 0, 1, 0, 0 )
	top:setTopBottom( 0, 0, 0, 3 )
	self:addElement( top )
	self.top = top
	
	local bottom = LUI.UIImage.new()
	bottom:setLeftRight( 0, 1, 0, 0 )
	bottom:setTopBottom( 1, 1, -3, 0 )
	self:addElement( bottom )
	self.bottom = bottom
	
	local left = LUI.UIImage.new()
	left:setLeftRight( 0, 0, 0, 3 )
	left:setTopBottom( 0, 1, 3, -3 )
	self:addElement( left )
	self.left = left
	
	local right = LUI.UIImage.new()
	right:setLeftRight( 1, 1, -3, 0 )
	right:setTopBottom( 0, 1, 3, -3 )
	self:addElement( right )
	self.right = right
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

