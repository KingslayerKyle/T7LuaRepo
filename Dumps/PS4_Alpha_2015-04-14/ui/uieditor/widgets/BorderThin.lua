CoD.BorderThin = InheritFrom( LUI.UIElement )
CoD.BorderThin.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BorderThin )
	self.id = "BorderThin"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 25 )
	
	local top = LUI.UIImage.new()
	top:setLeftRight( true, true, 0, 0 )
	top:setTopBottom( true, false, 0, 1 )
	top:setRGB( 1, 1, 1 )
	top:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( top )
	self.top = top
	
	local bottom = LUI.UIImage.new()
	bottom:setLeftRight( true, true, 0, 0 )
	bottom:setTopBottom( false, true, -1, 0 )
	bottom:setRGB( 1, 1, 1 )
	bottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bottom )
	self.bottom = bottom
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, 0, 1 )
	left:setTopBottom( true, true, 1, -1 )
	left:setRGB( 1, 1, 1 )
	left:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( left )
	self.left = left
	
	local right = LUI.UIImage.new()
	right:setLeftRight( false, true, -1, 0 )
	right:setTopBottom( true, true, 1, -1 )
	right:setRGB( 1, 1, 1 )
	right:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( right )
	self.right = right
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

