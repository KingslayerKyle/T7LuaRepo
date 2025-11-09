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
	ImgArrow0:setXRot( -180 )
	ImgArrow0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_arrowfull" ) )
	self:addElement( ImgArrow0 )
	self.ImgArrow0 = ImgArrow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						if not f4_arg1.interrupted then
							f4_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						f4_arg0:setAlpha( 0 )
						if f4_arg1.interrupted then
							self.clipFinished( f4_arg0, f4_arg1 )
						else
							f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f3_arg0:setAlpha( 0 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				ImgArrow0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				self.ImgArrow0:setAlpha( 1 )
				ImgArrow0:registerEventHandler( "transition_complete_keyframe", f2_local0 )
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

