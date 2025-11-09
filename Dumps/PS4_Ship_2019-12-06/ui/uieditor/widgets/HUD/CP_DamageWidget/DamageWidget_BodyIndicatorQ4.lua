CoD.DamageWidget_BodyIndicatorQ4 = InheritFrom( LUI.UIElement )
CoD.DamageWidget_BodyIndicatorQ4.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_BodyIndicatorQ4 )
	self.id = "DamageWidget_BodyIndicatorQ4"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 6 )
	self:setTopBottom( true, false, 0, 26 )
	
	local ImgBodySmall = LUI.UIImage.new()
	ImgBodySmall:setLeftRight( true, false, 0, 5.33 )
	ImgBodySmall:setTopBottom( true, false, 0, 25.33 )
	ImgBodySmall:setRGB( 1, 0.2, 0.2 )
	ImgBodySmall:setAlpha( 0 )
	ImgBodySmall:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_body4small" ) )
	self:addElement( ImgBodySmall )
	self.ImgBodySmall = ImgBodySmall
	
	local ImgBodyLarge = LUI.UIImage.new()
	ImgBodyLarge:setLeftRight( true, false, 0, 5.33 )
	ImgBodyLarge:setTopBottom( true, false, 0, 25.33 )
	ImgBodyLarge:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_body4large" ) )
	self:addElement( ImgBodyLarge )
	self.ImgBodyLarge = ImgBodyLarge
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ImgBodySmall:completeAnimation()
				self.ImgBodySmall:setRGB( 1, 0.2, 0.2 )
				self.ImgBodySmall:setAlpha( 0 )
				self.clipFinished( ImgBodySmall, {} )
				ImgBodyLarge:completeAnimation()
				self.ImgBodyLarge:setRGB( 1, 1, 1 )
				self.ImgBodyLarge:setAlpha( 1 )
				self.clipFinished( ImgBodyLarge, {} )
			end
		},
		DamageLarge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ImgBodySmall:completeAnimation()
				self.ImgBodySmall:setRGB( 1, 0.2, 0.2 )
				self.ImgBodySmall:setAlpha( 0 )
				self.clipFinished( ImgBodySmall, {} )
				local ImgBodyLargeFrame2 = function ( ImgBodyLarge, event )
					local ImgBodyLargeFrame3 = function ( ImgBodyLarge, event )
						local ImgBodyLargeFrame4 = function ( ImgBodyLarge, event )
							local ImgBodyLargeFrame5 = function ( ImgBodyLarge, event )
								local ImgBodyLargeFrame6 = function ( ImgBodyLarge, event )
									if not event.interrupted then
										ImgBodyLarge:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									end
									ImgBodyLarge:setRGB( 1, 0.2, 0.2 )
									ImgBodyLarge:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ImgBodyLarge, event )
									else
										ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ImgBodyLargeFrame6( ImgBodyLarge, event )
									return 
								else
									ImgBodyLarge:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									ImgBodyLarge:setAlpha( 0.62 )
									ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame6 )
								end
							end
							
							if event.interrupted then
								ImgBodyLargeFrame5( ImgBodyLarge, event )
								return 
							else
								ImgBodyLarge:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								ImgBodyLarge:setAlpha( 1 )
								ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgBodyLargeFrame4( ImgBodyLarge, event )
							return 
						else
							ImgBodyLarge:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							ImgBodyLarge:setAlpha( 0.69 )
							ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgBodyLargeFrame3( ImgBodyLarge, event )
						return 
					else
						ImgBodyLarge:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame3 )
					end
				end
				
				ImgBodyLarge:completeAnimation()
				self.ImgBodyLarge:setRGB( 1, 0.2, 0.2 )
				self.ImgBodyLarge:setAlpha( 1 )
				ImgBodyLargeFrame2( ImgBodyLarge, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				ImgBodySmall:completeAnimation()
				self.ImgBodySmall:setRGB( 1, 0.2, 0.2 )
				self.clipFinished( ImgBodySmall, {} )
				local ImgBodyLargeFrame2 = function ( ImgBodyLarge, event )
					local ImgBodyLargeFrame3 = function ( ImgBodyLarge, event )
						local ImgBodyLargeFrame4 = function ( ImgBodyLarge, event )
							local ImgBodyLargeFrame5 = function ( ImgBodyLarge, event )
								local ImgBodyLargeFrame6 = function ( ImgBodyLarge, event )
									local ImgBodyLargeFrame7 = function ( ImgBodyLarge, event )
										local ImgBodyLargeFrame8 = function ( ImgBodyLarge, event )
											local ImgBodyLargeFrame9 = function ( ImgBodyLarge, event )
												local ImgBodyLargeFrame10 = function ( ImgBodyLarge, event )
													if not event.interrupted then
														ImgBodyLarge:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
													end
													ImgBodyLarge:setRGB( 1, 0.2, 0.2 )
													ImgBodyLarge:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( ImgBodyLarge, event )
													else
														ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ImgBodyLargeFrame10( ImgBodyLarge, event )
													return 
												else
													ImgBodyLarge:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
													ImgBodyLarge:setAlpha( 0.74 )
													ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame10 )
												end
											end
											
											if event.interrupted then
												ImgBodyLargeFrame9( ImgBodyLarge, event )
												return 
											else
												ImgBodyLarge:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame9 )
											end
										end
										
										if event.interrupted then
											ImgBodyLargeFrame8( ImgBodyLarge, event )
											return 
										else
											ImgBodyLarge:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											ImgBodyLarge:setAlpha( 0 )
											ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame8 )
										end
									end
									
									if event.interrupted then
										ImgBodyLargeFrame7( ImgBodyLarge, event )
										return 
									else
										ImgBodyLarge:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame7 )
									end
								end
								
								if event.interrupted then
									ImgBodyLargeFrame6( ImgBodyLarge, event )
									return 
								else
									ImgBodyLarge:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									ImgBodyLarge:setAlpha( 0.71 )
									ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame6 )
								end
							end
							
							if event.interrupted then
								ImgBodyLargeFrame5( ImgBodyLarge, event )
								return 
							else
								ImgBodyLarge:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgBodyLargeFrame4( ImgBodyLarge, event )
							return 
						else
							ImgBodyLarge:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							ImgBodyLarge:setAlpha( 0 )
							ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgBodyLargeFrame3( ImgBodyLarge, event )
						return 
					else
						ImgBodyLarge:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ImgBodyLarge:registerEventHandler( "transition_complete_keyframe", ImgBodyLargeFrame3 )
					end
				end
				
				ImgBodyLarge:completeAnimation()
				self.ImgBodyLarge:setRGB( 1, 0.2, 0.2 )
				self.ImgBodyLarge:setAlpha( 1 )
				ImgBodyLargeFrame2( ImgBodyLarge, {} )
			end
		},
		DamageSmall = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ImgBodySmall:completeAnimation()
				self.ImgBodySmall:setRGB( 1, 0.2, 0.2 )
				self.ImgBodySmall:setAlpha( 1 )
				self.clipFinished( ImgBodySmall, {} )
				ImgBodyLarge:completeAnimation()
				self.ImgBodyLarge:setRGB( 1, 0.2, 0.2 )
				self.ImgBodyLarge:setAlpha( 0 )
				self.clipFinished( ImgBodyLarge, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local ImgBodySmallFrame2 = function ( ImgBodySmall, event )
					local ImgBodySmallFrame3 = function ( ImgBodySmall, event )
						local ImgBodySmallFrame4 = function ( ImgBodySmall, event )
							local ImgBodySmallFrame5 = function ( ImgBodySmall, event )
								local ImgBodySmallFrame6 = function ( ImgBodySmall, event )
									if not event.interrupted then
										ImgBodySmall:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									end
									ImgBodySmall:setRGB( 1, 0.2, 0.2 )
									ImgBodySmall:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( ImgBodySmall, event )
									else
										ImgBodySmall:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ImgBodySmallFrame6( ImgBodySmall, event )
									return 
								else
									ImgBodySmall:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									ImgBodySmall:setAlpha( 0.84 )
									ImgBodySmall:registerEventHandler( "transition_complete_keyframe", ImgBodySmallFrame6 )
								end
							end
							
							if event.interrupted then
								ImgBodySmallFrame5( ImgBodySmall, event )
								return 
							else
								ImgBodySmall:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								ImgBodySmall:registerEventHandler( "transition_complete_keyframe", ImgBodySmallFrame5 )
							end
						end
						
						if event.interrupted then
							ImgBodySmallFrame4( ImgBodySmall, event )
							return 
						else
							ImgBodySmall:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							ImgBodySmall:setAlpha( 0 )
							ImgBodySmall:registerEventHandler( "transition_complete_keyframe", ImgBodySmallFrame4 )
						end
					end
					
					if event.interrupted then
						ImgBodySmallFrame3( ImgBodySmall, event )
						return 
					else
						ImgBodySmall:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ImgBodySmall:setAlpha( 0.4 )
						ImgBodySmall:registerEventHandler( "transition_complete_keyframe", ImgBodySmallFrame3 )
					end
				end
				
				ImgBodySmall:completeAnimation()
				self.ImgBodySmall:setRGB( 1, 0.2, 0.2 )
				self.ImgBodySmall:setAlpha( 1 )
				ImgBodySmallFrame2( ImgBodySmall, {} )
				ImgBodyLarge:completeAnimation()
				self.ImgBodyLarge:setRGB( 1, 0.2, 0.2 )
				self.clipFinished( ImgBodyLarge, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

