CoD.BM_GoldBarMed = InheritFrom( LUI.UIElement )
CoD.BM_GoldBarMed.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_GoldBarMed )
	self.id = "BM_GoldBarMed"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local Left = LUI.UIImage.new()
	Left:setLeftRight( 0, 0, 5, 60 )
	Left:setTopBottom( 0, 1, -17, 21 )
	Left:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbarmed_left" ) )
	self:addElement( Left )
	self.Left = Left
	
	local Center = LUI.UIImage.new()
	Center:setLeftRight( 0, 1, 60, -60 )
	Center:setTopBottom( 0, 1, -17, 21 )
	Center:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbarmed_middle" ) )
	self:addElement( Center )
	self.Center = Center
	
	local Right = LUI.UIImage.new()
	Right:setLeftRight( 1, 1, -60, -5 )
	Right:setTopBottom( 0, 1, -17, 21 )
	Right:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbarmed_right" ) )
	self:addElement( Right )
	self.Right = Right
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

