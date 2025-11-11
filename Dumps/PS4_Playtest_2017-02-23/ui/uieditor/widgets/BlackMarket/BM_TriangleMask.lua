CoD.BM_TriangleMask = InheritFrom( LUI.UIElement )
CoD.BM_TriangleMask.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_TriangleMask )
	self.id = "BM_TriangleMask"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 468 )
	self:setTopBottom( 0, 0, 0, 912 )
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( 0, 0, 0, 468 )
	Mask:setTopBottom( 0, 0, 312, 600 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setImage( RegisterImage( "uie_t7_blackmarket_trianglemask" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 0, 0, 468 )
	black:setTopBottom( 0, 0, -322, 312 )
	black:setRGB( 0, 0, 0 )
	self:addElement( black )
	self.black = black
	
	local black0 = LUI.UIImage.new()
	black0:setLeftRight( 0, 0, 0, 468 )
	black0:setTopBottom( 0, 0, 600, 1174 )
	black0:setRGB( 0, 0, 0 )
	self:addElement( black0 )
	self.black0 = black0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

