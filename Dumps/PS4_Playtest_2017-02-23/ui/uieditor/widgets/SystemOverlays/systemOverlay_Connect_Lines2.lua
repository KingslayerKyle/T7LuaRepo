CoD.systemOverlay_Connect_Lines2 = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Connect_Lines2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Connect_Lines2 )
	self.id = "systemOverlay_Connect_Lines2"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 564 )
	self:setTopBottom( 0, 0, 0, 286 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 1, 0, 0 )
	Image0:setTopBottom( 0, 0, 0, 286 )
	Image0:setImage( RegisterImage( "uie_t7_icon_connect_overlays_loop_bkg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( 0, 0, -11, 295 )
	mask:setTopBottom( 0, 0, -307, 593 )
	mask:setZRot( -90 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_mask" ) )
	self:addElement( mask )
	self.mask = mask
	
	self.resetProperties = function ()
		Image0:completeAnimation()
		mask:completeAnimation()
		Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		mask:setLeftRight( 0, 0, -11, 295 )
		mask:setTopBottom( 0, 0, -307, 593 )
		mask:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Image0:completeAnimation()
				self.Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( Image0, {} )
				local maskFrame2 = function ( mask, event )
					if not event.interrupted then
						mask:beginAnimation( "keyframe", 6030, false, true, CoD.TweenType.Linear )
					end
					mask:setLeftRight( 0, 0, 445, 751 )
					mask:setTopBottom( 0, 0, -295, 605 )
					mask:setScale( 1.35 )
					if event.interrupted then
						self.clipFinished( mask, event )
					else
						mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mask:completeAnimation()
				self.mask:setLeftRight( 0, 0, -185, 121 )
				self.mask:setTopBottom( 0, 0, -295, 605 )
				self.mask:setScale( 1.35 )
				maskFrame2( mask, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

