CoD.CommsWidget_Arrow = InheritFrom( LUI.UIElement )
CoD.CommsWidget_Arrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_Arrow )
	self.id = "CommsWidget_Arrow"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 7 )
	self:setTopBottom( true, false, 0, 5 )
	
	local ImgArrow0 = LUI.UIImage.new()
	ImgArrow0:setLeftRight( true, false, 1, 6 )
	ImgArrow0:setTopBottom( true, false, 0, 5 )
	ImgArrow0:setRGB( 1, 1, 1 )
	ImgArrow0:setXRot( -180 )
	ImgArrow0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_arrowfull" ) )
	ImgArrow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgArrow0 )
	self.ImgArrow0 = ImgArrow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ImgArrow0Frame2 = function ( ImgArrow0, event )
					local ImgArrow0Frame3 = function ( ImgArrow0, event )
						if not event.interrupted then
							ImgArrow0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						ImgArrow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ImgArrow0, event )
						else
							ImgArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ImgArrow0Frame3( ImgArrow0, event )
						return 
					else
						ImgArrow0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						ImgArrow0:setAlpha( 0 )
						ImgArrow0:registerEventHandler( "transition_complete_keyframe", ImgArrow0Frame3 )
					end
				end
				
				ImgArrow0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				self.ImgArrow0:setAlpha( 1 )
				ImgArrow0:registerEventHandler( "transition_complete_keyframe", ImgArrow0Frame2 )
				self.nextClip = "DefaultClip"
			end,
			HudStart = function ()
				self:setupElementClipCounter( 0 )
				self.nextClip = "HudStart"
			end
		},
		Fake = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

