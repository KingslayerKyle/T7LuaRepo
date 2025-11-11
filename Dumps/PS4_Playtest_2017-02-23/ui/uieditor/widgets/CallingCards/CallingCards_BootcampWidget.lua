CoD.CallingCards_BootcampWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_BootcampWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_BootcampWidget )
	self.id = "CallingCards_BootcampWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 720 )
	bg:setTopBottom( 0, 0, 0, 180 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_bg" ) )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bg:setShaderVector( 0, 1, 1, 0, 0 )
	bg:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local rider = LUI.UIImage.new()
	rider:setLeftRight( 0, 0, 339, 501 )
	rider:setTopBottom( 0, 0, -9, 153 )
	rider:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_biker" ) )
	self:addElement( rider )
	self.rider = rider
	
	local smoke = LUI.UIImage.new()
	smoke:setLeftRight( 0, 0, 274, 382 )
	smoke:setTopBottom( 0, 0, 64, 136 )
	smoke:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_smoke" ) )
	self:addElement( smoke )
	self.smoke = smoke
	
	local ramp = LUI.UIImage.new()
	ramp:setLeftRight( 0, 0, 0, 720 )
	ramp:setTopBottom( 0, 0, 0, 180 )
	ramp:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_ramp" ) )
	ramp:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ramp:setShaderVector( 0, 1, 1, 0, 0 )
	ramp:setShaderVector( 1, 0.5, 0, 0, 0 )
	self:addElement( ramp )
	self.ramp = ramp
	
	local flag = LUI.UIImage.new()
	flag:setLeftRight( 0, 0, 0, 720 )
	flag:setTopBottom( 0, 0, 0, 180 )
	flag:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_flagramp" ) )
	flag:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	flag:setShaderVector( 0, 1, 1, 0, 0 )
	flag:setShaderVector( 1, 0.5, 0, 0, 0 )
	self:addElement( flag )
	self.flag = flag
	
	self.resetProperties = function ()
		rider:completeAnimation()
		smoke:completeAnimation()
		rider:setLeftRight( 0, 0, 339, 501 )
		rider:setTopBottom( 0, 0, -9, 153 )
		rider:setZRot( 0 )
		smoke:setLeftRight( 0, 0, 274, 382 )
		smoke:setTopBottom( 0, 0, 64, 136 )
		smoke:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local riderFrame2 = function ( rider, event )
					local riderFrame3 = function ( rider, event )
						if not event.interrupted then
							rider:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						rider:setLeftRight( 0, 0, 411, 573 )
						rider:setTopBottom( 0, 0, -9, 153 )
						rider:setZRot( 0 )
						if event.interrupted then
							self.clipFinished( rider, event )
						else
							rider:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						riderFrame3( rider, event )
						return 
					else
						rider:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						rider:setLeftRight( 0, 0, 531, 693 )
						rider:registerEventHandler( "transition_complete_keyframe", riderFrame3 )
					end
				end
				
				rider:completeAnimation()
				self.rider:setLeftRight( 0, 0, 411, 573 )
				self.rider:setTopBottom( 0, 0, -9, 153 )
				self.rider:setZRot( 0 )
				riderFrame2( rider, {} )
				local smokeFrame2 = function ( smoke, event )
					local smokeFrame3 = function ( smoke, event )
						local smokeFrame4 = function ( smoke, event )
							local smokeFrame5 = function ( smoke, event )
								local smokeFrame6 = function ( smoke, event )
									local smokeFrame7 = function ( smoke, event )
										local smokeFrame8 = function ( smoke, event )
											local smokeFrame9 = function ( smoke, event )
												local smokeFrame10 = function ( smoke, event )
													local smokeFrame11 = function ( smoke, event )
														local smokeFrame12 = function ( smoke, event )
															local smokeFrame13 = function ( smoke, event )
																local smokeFrame14 = function ( smoke, event )
																	local smokeFrame15 = function ( smoke, event )
																		local smokeFrame16 = function ( smoke, event )
																			local smokeFrame17 = function ( smoke, event )
																				local smokeFrame18 = function ( smoke, event )
																					local smokeFrame19 = function ( smoke, event )
																						if not event.interrupted then
																							smoke:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
																						end
																						smoke:setLeftRight( 0, 0, 346, 454 )
																						smoke:setTopBottom( 0, 0, 64, 136 )
																						smoke:setAlpha( 1 )
																						if event.interrupted then
																							self.clipFinished( smoke, event )
																						else
																							smoke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						smokeFrame19( smoke, event )
																						return 
																					else
																						smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																						smoke:setLeftRight( 0, 0, 365.01, 473.01 )
																						smoke:setAlpha( 1 )
																						smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					smokeFrame18( smoke, event )
																					return 
																				else
																					smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																					smoke:setLeftRight( 0, 0, 378.08, 486.08 )
																					smoke:setAlpha( 0 )
																					smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				smokeFrame17( smoke, event )
																				return 
																			else
																				smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																				smoke:setLeftRight( 0, 0, 389.96, 497.96 )
																				smoke:setAlpha( 1 )
																				smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			smokeFrame16( smoke, event )
																			return 
																		else
																			smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																			smoke:setLeftRight( 0, 0, 403.03, 511.03 )
																			smoke:setAlpha( 0 )
																			smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		smokeFrame15( smoke, event )
																		return 
																	else
																		smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																		smoke:setLeftRight( 0, 0, 414.91, 522.91 )
																		smoke:setAlpha( 1 )
																		smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame15 )
																	end
																end
																
																if event.interrupted then
																	smokeFrame14( smoke, event )
																	return 
																else
																	smoke:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																	smoke:setLeftRight( 0, 0, 427.98, 535.98 )
																	smoke:setAlpha( 0 )
																	smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame14 )
																end
															end
															
															if event.interrupted then
																smokeFrame13( smoke, event )
																return 
															else
																smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																smoke:setLeftRight( 0, 0, 439.86, 547.86 )
																smoke:setAlpha( 1 )
																smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame13 )
															end
														end
														
														if event.interrupted then
															smokeFrame12( smoke, event )
															return 
														else
															smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
															smoke:setLeftRight( 0, 0, 452.93, 560.93 )
															smoke:setAlpha( 0 )
															smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame12 )
														end
													end
													
													if event.interrupted then
														smokeFrame11( smoke, event )
														return 
													else
														smoke:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
														smoke:setLeftRight( 0, 0, 466, 574 )
														smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame11 )
													end
												end
												
												if event.interrupted then
													smokeFrame10( smoke, event )
													return 
												else
													smoke:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
													smoke:setLeftRight( 0, 0, 447.82, 555.82 )
													smoke:setAlpha( 1 )
													smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame10 )
												end
											end
											
											if event.interrupted then
												smokeFrame9( smoke, event )
												return 
											else
												smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												smoke:setLeftRight( 0, 0, 434.48, 542.48 )
												smoke:setAlpha( 0 )
												smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame9 )
											end
										end
										
										if event.interrupted then
											smokeFrame8( smoke, event )
											return 
										else
											smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											smoke:setLeftRight( 0, 0, 422.36, 530.36 )
											smoke:setAlpha( 1 )
											smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame8 )
										end
									end
									
									if event.interrupted then
										smokeFrame7( smoke, event )
										return 
									else
										smoke:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										smoke:setLeftRight( 0, 0, 409.03, 517.03 )
										smoke:setAlpha( 0 )
										smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame7 )
									end
								end
								
								if event.interrupted then
									smokeFrame6( smoke, event )
									return 
								else
									smoke:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
									smoke:setLeftRight( 0, 0, 396.91, 504.91 )
									smoke:setAlpha( 1 )
									smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame6 )
								end
							end
							
							if event.interrupted then
								smokeFrame5( smoke, event )
								return 
							else
								smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								smoke:setLeftRight( 0, 0, 383.58, 491.58 )
								smoke:setAlpha( 0 )
								smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame5 )
							end
						end
						
						if event.interrupted then
							smokeFrame4( smoke, event )
							return 
						else
							smoke:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							smoke:setLeftRight( 0, 0, 371.45, 479.45 )
							smoke:setAlpha( 1 )
							smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame4 )
						end
					end
					
					if event.interrupted then
						smokeFrame3( smoke, event )
						return 
					else
						smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						smoke:setLeftRight( 0, 0, 358.12, 466.12 )
						smoke:setAlpha( 0 )
						smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame3 )
					end
				end
				
				smoke:completeAnimation()
				self.smoke:setLeftRight( 0, 0, 346, 454 )
				self.smoke:setTopBottom( 0, 0, 64, 136 )
				self.smoke:setAlpha( 1 )
				smokeFrame2( smoke, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

