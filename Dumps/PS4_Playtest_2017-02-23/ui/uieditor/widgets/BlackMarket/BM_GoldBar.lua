CoD.BM_GoldBar = InheritFrom( LUI.UIElement )
CoD.BM_GoldBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_GoldBar )
	self.id = "BM_GoldBar"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local Left = LUI.UIImage.new()
	Left:setLeftRight( 0, 0, 0, 126 )
	Left:setTopBottom( 0, 1, -12, 12 )
	Left:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbar_left" ) )
	self:addElement( Left )
	self.Left = Left
	
	local Right = LUI.UIImage.new()
	Right:setLeftRight( 1, 1, -126, 0 )
	Right:setTopBottom( 0, 1, -12, 12 )
	Right:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbar_right" ) )
	self:addElement( Right )
	self.Right = Right
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( 0, 1, 126, -126 )
	Center:setTopBottom( 0.5, 0.5, -27, 27 )
	Center:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbar_middle" ) )
	self:addElement( Center )
	self.Center = Center
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

