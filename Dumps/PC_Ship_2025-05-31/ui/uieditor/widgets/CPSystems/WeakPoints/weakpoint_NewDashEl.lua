CoD.weakpoint_NewDashEl = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewDashEl.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewDashEl )
	self.id = "weakpoint_NewDashEl"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 16 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -13, 13 )
	Image0:setTopBottom( false, false, -5.78, 5.78 )
	Image0:setAlpha( RandomAddPercent( -40, 0.99 ) )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newsideel" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, -13, 13 )
	Image00:setTopBottom( false, false, -5.78, 5.78 )
	Image00:setZoom( 70 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newsideelblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( RandomAddPercent( -40, 0.99 ) )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( RandomAddPercent( -40, 1 ) )
				Image0Frame2( Image0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

