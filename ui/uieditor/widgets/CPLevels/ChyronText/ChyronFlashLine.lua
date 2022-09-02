-- 0b9497ea4dc2878ea4c27ee1073df679
-- This hash is used for caching, delete to decompile the file again

CoD.ChyronFlashLine = InheritFrom( LUI.UIElement )
CoD.ChyronFlashLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChyronFlashLine )
	self.id = "ChyronFlashLine"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 2 )
	
	local LineImage = LUI.UIImage.new()
	LineImage:setLeftRight( true, true, 0, 0 )
	LineImage:setTopBottom( true, true, 0, 0 )
	LineImage:setAlpha( 0 )
	self:addElement( LineImage )
	self.LineImage = LineImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			Flash1 = function ()
				self:setupElementClipCounter( 1 )

				local LineImageFrame2 = function ( LineImage, event )
					local LineImageFrame3 = function ( LineImage, event )
						if not event.interrupted then
							LineImage:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						end
						LineImage:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LineImage, event )
						else
							LineImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineImageFrame3( LineImage, event )
						return 
					else
						LineImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						LineImage:setAlpha( 0.8 )
						LineImage:registerEventHandler( "transition_complete_keyframe", LineImageFrame3 )
					end
				end
				
				LineImage:completeAnimation()
				self.LineImage:setAlpha( 0 )
				LineImageFrame2( LineImage, {} )
			end,
			Flash2 = function ()
				self:setupElementClipCounter( 1 )

				local f6_local0 = function ( f7_arg0, f7_arg1 )
					local f7_local0 = function ( f8_arg0, f8_arg1 )
						if not f8_arg1.interrupted then
							f8_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						f8_arg0:setAlpha( 0 )
						if f8_arg1.interrupted then
							self.clipFinished( f8_arg0, f8_arg1 )
						else
							f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f7_arg1.interrupted then
						f7_local0( f7_arg0, f7_arg1 )
						return 
					else
						f7_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f7_arg0:setAlpha( 0.8 )
						f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
					end
				end
				
				LineImage:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				self.LineImage:setAlpha( 0 )
				LineImage:registerEventHandler( "transition_complete_keyframe", f6_local0 )
			end,
			Flash3 = function ()
				self:setupElementClipCounter( 1 )

				local f9_local0 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f11_arg0, f11_arg1 )
						if not f11_arg1.interrupted then
							f11_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						end
						f11_arg0:setAlpha( 0 )
						if f11_arg1.interrupted then
							self.clipFinished( f11_arg0, f11_arg1 )
						else
							f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f10_arg0:setAlpha( 1 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				LineImage:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				self.LineImage:setAlpha( 0 )
				LineImage:registerEventHandler( "transition_complete_keyframe", f9_local0 )
			end,
			Flash4 = function ()
				self:setupElementClipCounter( 1 )

				local f12_local0 = function ( f13_arg0, f13_arg1 )
					local f13_local0 = function ( f14_arg0, f14_arg1 )
						if not f14_arg1.interrupted then
							f14_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						f14_arg0:setAlpha( 0 )
						if f14_arg1.interrupted then
							self.clipFinished( f14_arg0, f14_arg1 )
						else
							f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f13_arg1.interrupted then
						f13_local0( f13_arg0, f13_arg1 )
						return 
					else
						f13_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f13_arg0:setAlpha( 0.8 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
					end
				end
				
				LineImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				self.LineImage:setAlpha( 0 )
				LineImage:registerEventHandler( "transition_complete_keyframe", f12_local0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

