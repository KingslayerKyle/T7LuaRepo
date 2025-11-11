CoD.systemOverlay_FadeMask = InheritFrom( LUI.UIElement )
CoD.systemOverlay_FadeMask.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_FadeMask )
	self.id = "systemOverlay_FadeMask"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 492 )
	self:setTopBottom( 0, 0, 0, 286 )
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( 0, 1, 0, -246 )
	Mask:setTopBottom( 0, 1, 0, 0 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setImage( RegisterImage( "uie_t7_icon_mask_overlays_bkg" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	local Mask0 = LUI.UIImage.new()
	Mask0:setLeftRight( 0, 1, 246, 0 )
	Mask0:setTopBottom( 0, 1, 0, 0 )
	Mask0:setYRot( 180 )
	Mask0:setImage( RegisterImage( "uie_t7_icon_mask_overlays_bkg" ) )
	self:addElement( Mask0 )
	self.Mask0 = Mask0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

