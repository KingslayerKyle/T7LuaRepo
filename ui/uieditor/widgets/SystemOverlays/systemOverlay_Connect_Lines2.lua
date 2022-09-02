-- 746045d0a778e08aade7492c1f3b9061
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 376 )
	self:setTopBottom( true, false, 0, 191 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, -0.3 )
	Image0:setTopBottom( true, false, 0, 191 )
	Image0:setImage( RegisterImage( "uie_t7_icon_connect_overlays_loop_bkg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, -7, 197 )
	mask:setTopBottom( true, false, -204.5, 395.5 )
	mask:setZRot( -90 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_lineanim_mask" ) )
	self:addElement( mask )
	self.mask = mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Image0:completeAnimation()
				self.Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( Image0, {} )
				local maskFrame2 = function ( mask, event )
					if not event.interrupted then
						mask:beginAnimation( "keyframe", 6030, false, true, CoD.TweenType.Linear )
					end
					mask:setLeftRight( true, false, 297, 501 )
					mask:setTopBottom( true, false, -196.5, 403.5 )
					mask:setScale( 1.35 )
					if event.interrupted then
						self.clipFinished( mask, event )
					else
						mask:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mask:completeAnimation()
				self.mask:setLeftRight( true, false, -123, 81 )
				self.mask:setTopBottom( true, false, -196.5, 403.5 )
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

