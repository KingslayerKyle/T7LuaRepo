-- 3b071441f34ee6a2cbf631cf1707e7ea
-- This hash is used for caching, delete to decompile the file again

CoD.CaptureGeneratorWedgeWidget = InheritFrom( LUI.UIElement )
CoD.CaptureGeneratorWedgeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CaptureGeneratorWedgeWidget )
	self.id = "CaptureGeneratorWedgeWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	
	local capturedWedge = LUI.UIImage.new()
	capturedWedge:setLeftRight( true, true, 0, 0 )
	capturedWedge:setTopBottom( true, true, 0, 0 )
	capturedWedge:setRGB( 0, 0.5, 1 )
	capturedWedge:setAlpha( 0 )
	capturedWedge:setImage( RegisterImage( "uie_t7_zm_hd_capturemeter_wedge" ) )
	self:addElement( capturedWedge )
	self.capturedWedge = capturedWedge
	
	local capturedWedgeFlash = LUI.UIImage.new()
	capturedWedgeFlash:setLeftRight( true, true, 0, 0 )
	capturedWedgeFlash:setTopBottom( true, true, 0, 0 )
	capturedWedgeFlash:setRGB( 0.36, 0.85, 0.96 )
	capturedWedgeFlash:setImage( RegisterImage( "uie_t7_zm_hd_capturemeter_wedge" ) )
	self:addElement( capturedWedgeFlash )
	self.capturedWedgeFlash = capturedWedgeFlash
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				capturedWedge:completeAnimation()
				self.capturedWedge:setRGB( 0, 0.5, 1 )
				self.capturedWedge:setAlpha( 0 )
				self.clipFinished( capturedWedge, {} )

				capturedWedgeFlash:completeAnimation()
				self.capturedWedgeFlash:setRGB( 0.36, 0.85, 0.96 )
				self.capturedWedgeFlash:setAlpha( 0 )
				self.clipFinished( capturedWedgeFlash, {} )
			end,
			Captured = function ()
				self:setupElementClipCounter( 2 )

				capturedWedge:completeAnimation()
				self.capturedWedge:setRGB( 0, 0.5, 1 )
				self.capturedWedge:setAlpha( 1 )
				self.clipFinished( capturedWedge, {} )
				local capturedWedgeFlashFrame2 = function ( capturedWedgeFlash, event )
					local capturedWedgeFlashFrame3 = function ( capturedWedgeFlash, event )
						local capturedWedgeFlashFrame4 = function ( capturedWedgeFlash, event )
							local capturedWedgeFlashFrame5 = function ( capturedWedgeFlash, event )
								local capturedWedgeFlashFrame6 = function ( capturedWedgeFlash, event )
									local capturedWedgeFlashFrame7 = function ( capturedWedgeFlash, event )
										if not event.interrupted then
											capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										end
										capturedWedgeFlash:setRGB( 0.36, 0.85, 0.96 )
										capturedWedgeFlash:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( capturedWedgeFlash, event )
										else
											capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										capturedWedgeFlashFrame7( capturedWedgeFlash, event )
										return 
									else
										capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										capturedWedgeFlash:setAlpha( 1 )
										capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame7 )
									end
								end
								
								if event.interrupted then
									capturedWedgeFlashFrame6( capturedWedgeFlash, event )
									return 
								else
									capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									capturedWedgeFlash:setAlpha( 0 )
									capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame6 )
								end
							end
							
							if event.interrupted then
								capturedWedgeFlashFrame5( capturedWedgeFlash, event )
								return 
							else
								capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								capturedWedgeFlash:setAlpha( 1 )
								capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame5 )
							end
						end
						
						if event.interrupted then
							capturedWedgeFlashFrame4( capturedWedgeFlash, event )
							return 
						else
							capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							capturedWedgeFlash:setAlpha( 0 )
							capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame4 )
						end
					end
					
					if event.interrupted then
						capturedWedgeFlashFrame3( capturedWedgeFlash, event )
						return 
					else
						capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						capturedWedgeFlash:setAlpha( 1 )
						capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame3 )
					end
				end
				
				capturedWedgeFlash:completeAnimation()
				self.capturedWedgeFlash:setRGB( 0.36, 0.85, 0.96 )
				self.capturedWedgeFlash:setAlpha( 0 )
				capturedWedgeFlashFrame2( capturedWedgeFlash, {} )
			end
		},
		CapturedScoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				capturedWedge:completeAnimation()
				self.capturedWedge:setRGB( 0, 0.5, 1 )
				self.capturedWedge:setAlpha( 1 )
				self.clipFinished( capturedWedge, {} )

				capturedWedgeFlash:completeAnimation()
				self.capturedWedgeFlash:setRGB( 0.36, 0.85, 0.96 )
				self.capturedWedgeFlash:setAlpha( 0 )
				self.clipFinished( capturedWedgeFlash, {} )
			end
		},
		Captured = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				capturedWedge:completeAnimation()
				self.capturedWedge:setRGB( 0, 0.5, 1 )
				self.capturedWedge:setAlpha( 1 )
				self.clipFinished( capturedWedge, {} )

				capturedWedgeFlash:completeAnimation()
				self.capturedWedgeFlash:setRGB( 0.36, 0.85, 0.96 )
				self.capturedWedgeFlash:setAlpha( 0 )
				self.clipFinished( capturedWedgeFlash, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )

				capturedWedge:completeAnimation()
				self.capturedWedge:setRGB( 0, 0.5, 1 )
				self.capturedWedge:setAlpha( 0 )
				self.clipFinished( capturedWedge, {} )
				local capturedWedgeFlashFrame2 = function ( capturedWedgeFlash, event )
					local capturedWedgeFlashFrame3 = function ( capturedWedgeFlash, event )
						local capturedWedgeFlashFrame4 = function ( capturedWedgeFlash, event )
							local capturedWedgeFlashFrame5 = function ( capturedWedgeFlash, event )
								local capturedWedgeFlashFrame6 = function ( capturedWedgeFlash, event )
									local capturedWedgeFlashFrame7 = function ( capturedWedgeFlash, event )
										if not event.interrupted then
											capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										end
										capturedWedgeFlash:setRGB( 0.73, 0.25, 0.25 )
										capturedWedgeFlash:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( capturedWedgeFlash, event )
										else
											capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										capturedWedgeFlashFrame7( capturedWedgeFlash, event )
										return 
									else
										capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										capturedWedgeFlash:setAlpha( 1 )
										capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame7 )
									end
								end
								
								if event.interrupted then
									capturedWedgeFlashFrame6( capturedWedgeFlash, event )
									return 
								else
									capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									capturedWedgeFlash:setAlpha( 0 )
									capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame6 )
								end
							end
							
							if event.interrupted then
								capturedWedgeFlashFrame5( capturedWedgeFlash, event )
								return 
							else
								capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								capturedWedgeFlash:setAlpha( 1 )
								capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame5 )
							end
						end
						
						if event.interrupted then
							capturedWedgeFlashFrame4( capturedWedgeFlash, event )
							return 
						else
							capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							capturedWedgeFlash:setAlpha( 0 )
							capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame4 )
						end
					end
					
					if event.interrupted then
						capturedWedgeFlashFrame3( capturedWedgeFlash, event )
						return 
					else
						capturedWedgeFlash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						capturedWedgeFlash:setAlpha( 1 )
						capturedWedgeFlash:registerEventHandler( "transition_complete_keyframe", capturedWedgeFlashFrame3 )
					end
				end
				
				capturedWedgeFlash:completeAnimation()
				self.capturedWedgeFlash:setRGB( 0.73, 0.25, 0.25 )
				self.capturedWedgeFlash:setAlpha( 0 )
				capturedWedgeFlashFrame2( capturedWedgeFlash, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
