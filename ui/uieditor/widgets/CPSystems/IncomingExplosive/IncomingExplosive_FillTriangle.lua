-- 22c1dc7dacd402a58f1a0b3d8777e0b9
-- This hash is used for caching, delete to decompile the file again

CoD.IncomingExplosive_FillTriangle = InheritFrom( LUI.UIElement )
CoD.IncomingExplosive_FillTriangle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IncomingExplosive_FillTriangle )
	self.id = "IncomingExplosive_FillTriangle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -32, 32 )
	Image0:setTopBottom( false, false, -18, 18 )
	Image0:setAlpha( RandomAddPercent( -30, 1 ) )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_newmeterfill" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, -32, 32 )
	Image00:setTopBottom( false, false, -18, 18 )
	Image00:setZoom( 100 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_newmeterfillblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( RandomAddPercent( -30, 1 ) )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( RandomAddPercent( -30, 1 ) )
				Image0Frame2( Image0, {} )
				self.nextClip = "DefaultClip"
			end,
			Visible = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

