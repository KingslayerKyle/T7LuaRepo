CoD.weakpoint_NewRedArrow = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewRedArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewRedArrow )
	self.id = "weakpoint_NewRedArrow"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 7.5, -7.5 )
	Image0:setTopBottom( true, true, 4.5, -4.5 )
	Image0:setAlpha( RandomAddPercent( 0.99, -50 ) )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newredarrow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 7.5, -7.5 )
	Image00:setTopBottom( true, true, 4.5, -4.5 )
	Image00:setZoom( 75 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newredarrowblur" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( RandomAddPercent( 0.99, -50 ) )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( RandomAddPercent( 1, -50 ) )
				Image0Frame2( Image0, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

