CoD.BM_BribeFrame = InheritFrom( LUI.UIElement )
CoD.BM_BribeFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_BribeFrame )
	self.id = "BM_BribeFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 277 )
	self:setTopBottom( 0, 0, 0, 339 )
	
	local BribeFrame = LUI.UIImage.new()
	BribeFrame:setLeftRight( 0, 1, 0, 0 )
	BribeFrame:setTopBottom( 0, 1, 0, 0 )
	BribeFrame:setImage( RegisterImage( "uie_t7_blackmarket_crate_bribe_frame" ) )
	self:addElement( BribeFrame )
	self.BribeFrame = BribeFrame
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

