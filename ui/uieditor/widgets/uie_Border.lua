-- b9b02c38f8d15642c6c32b3f0a1952e8
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 25 )
	
	local top = LUI.UIImage.new()
	top:setLeftRight( true, true, 0, 0 )
	top:setTopBottom( true, false, 0, 2 )
	self:addElement( top )
	self.top = top
	
	local bottom = LUI.UIImage.new()
	bottom:setLeftRight( true, true, 0, 0 )
	bottom:setTopBottom( false, true, -2, 0 )
	self:addElement( bottom )
	self.bottom = bottom
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0, 2 )
	left:setTopBottom( true, true, 2, -2 )
	self:addElement( left )
	self.left = left
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -2, 0 )
	right:setTopBottom( true, true, 2, -2 )
	self:addElement( right )
	self.right = right
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

