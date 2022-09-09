-- 852d7b843461f480b9d47b70eac9568f
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_bg" ) )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bg:setShaderVector( 0, 1, 1, 0, 0 )
	bg:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local rider = LUI.UIImage.new()
	rider:setLeftRight( true, false, 226, 334 )
	rider:setTopBottom( true, false, -6, 102 )
	rider:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_biker" ) )
	self:addElement( rider )
	self.rider = rider
	
	local smoke = LUI.UIImage.new()
	smoke:setLeftRight( true, false, 183, 255 )
	smoke:setTopBottom( true, false, 43, 91 )
	smoke:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_smoke" ) )
	self:addElement( smoke )
	self.smoke = smoke
	
	local ramp = LUI.UIImage.new()
	ramp:setLeftRight( true, false, 0, 480 )
	ramp:setTopBottom( true, false, 0, 120 )
	ramp:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_ramp" ) )
	ramp:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	ramp:setShaderVector( 0, 1, 1, 0, 0 )
	ramp:setShaderVector( 1, 0.5, 0, 0, 0 )
	self:addElement( ramp )
	self.ramp = ramp
	
	local flag = LUI.UIImage.new()
	flag:setLeftRight( true, false, 0, 480 )
	flag:setTopBottom( true, false, 0, 120 )
	flag:setImage( RegisterImage( "uie_t7_callingcard_8bitpixel_flagramp" ) )
	flag:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	flag:setShaderVector( 0, 1, 1, 0, 0 )
	flag:setShaderVector( 1, 0.5, 0, 0, 0 )
	self:addElement( flag )
	self.flag = flag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				bg:completeAnimation()
				self.bg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
				self.bg:setShaderVector( 0, 1, 1, 0, 0 )
				self.bg:setShaderVector( 1, 1, 0, 0, 0 )
				self.clipFinished( bg, {} )
				local riderFrame2 = function ( rider, event )
					local riderFrame3 = function ( rider, event )
						if not event.interrupted then
							rider:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						rider:setLeftRight( true, false, 274, 382 )
						rider:setTopBottom( true, false, -6, 102 )
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
						rider:setLeftRight( true, false, 354, 462 )
						rider:registerEventHandler( "transition_complete_keyframe", riderFrame3 )
					end
				end
				
				rider:completeAnimation()
				self.rider:setLeftRight( true, false, 274, 382 )
				self.rider:setTopBottom( true, false, -6, 102 )
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
																						smoke:setLeftRight( true, false, 231, 303 )
																						smoke:setTopBottom( true, false, 43, 91 )
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
																						smoke:setLeftRight( true, false, 243.67, 315.67 )
																						smoke:setAlpha( 1 )
																						smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					smokeFrame18( smoke, event )
																					return 
																				else
																					smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																					smoke:setLeftRight( true, false, 252.39, 324.39 )
																					smoke:setAlpha( 0 )
																					smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				smokeFrame17( smoke, event )
																				return 
																			else
																				smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																				smoke:setLeftRight( true, false, 260.31, 332.31 )
																				smoke:setAlpha( 1 )
																				smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			smokeFrame16( smoke, event )
																			return 
																		else
																			smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																			smoke:setLeftRight( true, false, 269.02, 341.02 )
																			smoke:setAlpha( 0 )
																			smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		smokeFrame15( smoke, event )
																		return 
																	else
																		smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																		smoke:setLeftRight( true, false, 276.94, 348.94 )
																		smoke:setAlpha( 1 )
																		smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame15 )
																	end
																end
																
																if event.interrupted then
																	smokeFrame14( smoke, event )
																	return 
																else
																	smoke:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																	smoke:setLeftRight( true, false, 285.65, 357.65 )
																	smoke:setAlpha( 0 )
																	smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame14 )
																end
															end
															
															if event.interrupted then
																smokeFrame13( smoke, event )
																return 
															else
																smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																smoke:setLeftRight( true, false, 293.57, 365.57 )
																smoke:setAlpha( 1 )
																smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame13 )
															end
														end
														
														if event.interrupted then
															smokeFrame12( smoke, event )
															return 
														else
															smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
															smoke:setLeftRight( true, false, 302.29, 374.29 )
															smoke:setAlpha( 0 )
															smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame12 )
														end
													end
													
													if event.interrupted then
														smokeFrame11( smoke, event )
														return 
													else
														smoke:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
														smoke:setLeftRight( true, false, 311, 383 )
														smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame11 )
													end
												end
												
												if event.interrupted then
													smokeFrame10( smoke, event )
													return 
												else
													smoke:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
													smoke:setLeftRight( true, false, 298.88, 370.88 )
													smoke:setAlpha( 1 )
													smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame10 )
												end
											end
											
											if event.interrupted then
												smokeFrame9( smoke, event )
												return 
											else
												smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												smoke:setLeftRight( true, false, 289.99, 361.99 )
												smoke:setAlpha( 0 )
												smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame9 )
											end
										end
										
										if event.interrupted then
											smokeFrame8( smoke, event )
											return 
										else
											smoke:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											smoke:setLeftRight( true, false, 281.91, 353.91 )
											smoke:setAlpha( 1 )
											smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame8 )
										end
									end
									
									if event.interrupted then
										smokeFrame7( smoke, event )
										return 
									else
										smoke:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										smoke:setLeftRight( true, false, 273.02, 345.02 )
										smoke:setAlpha( 0 )
										smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame7 )
									end
								end
								
								if event.interrupted then
									smokeFrame6( smoke, event )
									return 
								else
									smoke:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
									smoke:setLeftRight( true, false, 264.94, 336.94 )
									smoke:setAlpha( 1 )
									smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame6 )
								end
							end
							
							if event.interrupted then
								smokeFrame5( smoke, event )
								return 
							else
								smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								smoke:setLeftRight( true, false, 256.05, 328.05 )
								smoke:setAlpha( 0 )
								smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame5 )
							end
						end
						
						if event.interrupted then
							smokeFrame4( smoke, event )
							return 
						else
							smoke:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							smoke:setLeftRight( true, false, 247.97, 319.97 )
							smoke:setAlpha( 1 )
							smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame4 )
						end
					end
					
					if event.interrupted then
						smokeFrame3( smoke, event )
						return 
					else
						smoke:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						smoke:setLeftRight( true, false, 239.08, 311.08 )
						smoke:setAlpha( 0 )
						smoke:registerEventHandler( "transition_complete_keyframe", smokeFrame3 )
					end
				end
				
				smoke:completeAnimation()
				self.smoke:setLeftRight( true, false, 231, 303 )
				self.smoke:setTopBottom( true, false, 43, 91 )
				self.smoke:setAlpha( 1 )
				smokeFrame2( smoke, {} )

				ramp:completeAnimation()
				self.ramp:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
				self.ramp:setShaderVector( 0, 1, 1, 0, 0 )
				self.ramp:setShaderVector( 1, 0.5, 0, 0, 0 )
				self.clipFinished( ramp, {} )

				flag:completeAnimation()
				self.flag:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
				self.flag:setShaderVector( 0, 1, 1, 0, 0 )
				self.flag:setShaderVector( 1, 0.5, 0, 0, 0 )
				self.clipFinished( flag, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
