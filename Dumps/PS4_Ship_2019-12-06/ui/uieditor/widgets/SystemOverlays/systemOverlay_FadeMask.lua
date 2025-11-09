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
	self:setLeftRight( true, false, 0, 328 )
	self:setTopBottom( true, false, 0, 191 )
	
	local Mask = LUI.UIImage.new()
	Mask:setLeftRight( true, true, 0, -164 )
	Mask:setTopBottom( true, true, 0, 0 )
	Mask:setRGB( 0, 0, 0 )
	Mask:setImage( RegisterImage( "uie_t7_icon_mask_overlays_bkg" ) )
	self:addElement( Mask )
	self.Mask = Mask
	
	local Mask0 = LUI.UIImage.new()
	Mask0:setLeftRight( true, true, 164, 0 )
	Mask0:setTopBottom( true, true, 0, 0 )
	Mask0:setYRot( 180 )
	Mask0:setImage( RegisterImage( "uie_t7_icon_mask_overlays_bkg" ) )
	self:addElement( Mask0 )
	self.Mask0 = Mask0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

