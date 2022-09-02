-- 4694adce2557f48f628837058fddf147
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_CodChamps_Training = InheritFrom( LUI.UIElement )
CoD.CallingCards_CodChamps_Training.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_CodChamps_Training )
	self.id = "CallingCards_CodChamps_Training"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcards_training_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( true, false, 0, 480 )
	bg2:setTopBottom( true, false, 0, 120 )
	bg2:setImage( RegisterImage( "uie_t7_callingcards_training_bg2" ) )
	bg2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bg2:setShaderVector( 0, 1, 1, 0, 0 )
	bg2:setShaderVector( 1, 0.02, 0, 0, 0 )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local boxer1 = LUI.UIImage.new()
	boxer1:setLeftRight( true, false, 264, 480 )
	boxer1:setTopBottom( true, false, 0, 120 )
	boxer1:setImage( RegisterImage( "uie_t7_callingcards_training_boxer1" ) )
	self:addElement( boxer1 )
	self.boxer1 = boxer1
	
	local boxer2 = LUI.UIImage.new()
	boxer2:setLeftRight( true, false, 258, 474 )
	boxer2:setTopBottom( true, false, 0, 120 )
	boxer2:setImage( RegisterImage( "uie_t7_callingcards_training_boxer2" ) )
	self:addElement( boxer2 )
	self.boxer2 = boxer2
	
	local sweat = LUI.UIImage.new()
	sweat:setLeftRight( true, false, 298, 454 )
	sweat:setTopBottom( true, false, 24.27, 125 )
	sweat:setImage( RegisterImage( "uie_t7_callingcards_training_sweat" ) )
	self:addElement( sweat )
	self.sweat = sweat
	
	local dust1 = LUI.UIImage.new()
	dust1:setLeftRight( true, false, 211, 355 )
	dust1:setTopBottom( true, false, 0, 120 )
	dust1:setImage( RegisterImage( "uie_t7_callingcards_training_smoke1" ) )
	self:addElement( dust1 )
	self.dust1 = dust1
	
	local dust2 = LUI.UIImage.new()
	dust2:setLeftRight( true, false, 218, 362 )
	dust2:setTopBottom( true, false, 0, 120 )
	dust2:setAlpha( 0 )
	dust2:setImage( RegisterImage( "uie_t7_callingcards_training_smoke2" ) )
	self:addElement( dust2 )
	self.dust2 = dust2
	
	local bag = LUI.UIImage.new()
	bag:setLeftRight( true, false, 122, 290 )
	bag:setTopBottom( true, false, -21, 135 )
	bag:setImage( RegisterImage( "uie_t7_callingcards_training_bag" ) )
	self:addElement( bag )
	self.bag = bag
	
	local light = LUI.UIImage.new()
	light:setLeftRight( true, false, 0, 480 )
	light:setTopBottom( true, false, 0, 120 )
	light:setImage( RegisterImage( "uie_t7_callingcards_training_light" ) )
	self:addElement( light )
	self.light = light
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				local boxer1Frame2 = function ( boxer1, event )
					local boxer1Frame3 = function ( boxer1, event )
						local boxer1Frame4 = function ( boxer1, event )
							local boxer1Frame5 = function ( boxer1, event )
								local boxer1Frame6 = function ( boxer1, event )
									local boxer1Frame7 = function ( boxer1, event )
										local boxer1Frame8 = function ( boxer1, event )
											local boxer1Frame9 = function ( boxer1, event )
												local boxer1Frame10 = function ( boxer1, event )
													local boxer1Frame11 = function ( boxer1, event )
														local boxer1Frame12 = function ( boxer1, event )
															local boxer1Frame13 = function ( boxer1, event )
																local boxer1Frame14 = function ( boxer1, event )
																	local boxer1Frame15 = function ( boxer1, event )
																		local boxer1Frame16 = function ( boxer1, event )
																			local boxer1Frame17 = function ( boxer1, event )
																				local boxer1Frame18 = function ( boxer1, event )
																					if not event.interrupted then
																						boxer1:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																					end
																					boxer1:setLeftRight( true, false, 264, 480 )
																					boxer1:setTopBottom( true, false, 0, 120 )
																					boxer1:setAlpha( 1 )
																					if event.interrupted then
																						self.clipFinished( boxer1, event )
																					else
																						boxer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					boxer1Frame18( boxer1, event )
																					return 
																				else
																					boxer1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
																					boxer1:setLeftRight( true, false, 254, 470 )
																					boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				boxer1Frame17( boxer1, event )
																				return 
																			else
																				boxer1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
																				boxer1:setLeftRight( true, false, 263.58, 479.58 )
																				boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			boxer1Frame16( boxer1, event )
																			return 
																		else
																			boxer1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																			boxer1:setLeftRight( true, false, 250, 466 )
																			boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		boxer1Frame15( boxer1, event )
																		return 
																	else
																		boxer1:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
																		boxer1:setLeftRight( true, false, 262.15, 478.15 )
																		boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame15 )
																	end
																end
																
																if event.interrupted then
																	boxer1Frame14( boxer1, event )
																	return 
																else
																	boxer1:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
																	boxer1:setLeftRight( true, false, 278.5, 494.5 )
																	boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame14 )
																end
															end
															
															if event.interrupted then
																boxer1Frame13( boxer1, event )
																return 
															else
																boxer1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
																boxer1:setLeftRight( true, false, 281, 497 )
																boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame13 )
															end
														end
														
														if event.interrupted then
															boxer1Frame12( boxer1, event )
															return 
														else
															boxer1:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
															boxer1:setLeftRight( true, false, 269, 485 )
															boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame12 )
														end
													end
													
													if event.interrupted then
														boxer1Frame11( boxer1, event )
														return 
													else
														boxer1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
														boxer1:setLeftRight( true, false, 278.84, 494.84 )
														boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame11 )
													end
												end
												
												if event.interrupted then
													boxer1Frame10( boxer1, event )
													return 
												else
													boxer1:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
													boxer1:setLeftRight( true, false, 274, 490 )
													boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame10 )
												end
											end
											
											if event.interrupted then
												boxer1Frame9( boxer1, event )
												return 
											else
												boxer1:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
												boxer1:setLeftRight( true, false, 264, 480 )
												boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame9 )
											end
										end
										
										if event.interrupted then
											boxer1Frame8( boxer1, event )
											return 
										else
											boxer1:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
											boxer1:setLeftRight( true, false, 258, 474 )
											boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame8 )
										end
									end
									
									if event.interrupted then
										boxer1Frame7( boxer1, event )
										return 
									else
										boxer1:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
										boxer1:setLeftRight( true, false, 272, 488 )
										boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame7 )
									end
								end
								
								if event.interrupted then
									boxer1Frame6( boxer1, event )
									return 
								else
									boxer1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
									boxer1:setLeftRight( true, false, 271.59, 487.59 )
									boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame6 )
								end
							end
							
							if event.interrupted then
								boxer1Frame5( boxer1, event )
								return 
							else
								boxer1:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
								boxer1:setLeftRight( true, false, 281, 497 )
								boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame5 )
							end
						end
						
						if event.interrupted then
							boxer1Frame4( boxer1, event )
							return 
						else
							boxer1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							boxer1:setLeftRight( true, false, 266.25, 482.25 )
							boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame4 )
						end
					end
					
					if event.interrupted then
						boxer1Frame3( boxer1, event )
						return 
					else
						boxer1:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						boxer1:setLeftRight( true, false, 274.79, 490.79 )
						boxer1:registerEventHandler( "transition_complete_keyframe", boxer1Frame3 )
					end
				end
				
				boxer1:completeAnimation()
				self.boxer1:setLeftRight( true, false, 264, 480 )
				self.boxer1:setTopBottom( true, false, 0, 120 )
				self.boxer1:setAlpha( 1 )
				boxer1Frame2( boxer1, {} )
				local boxer2Frame2 = function ( boxer2, event )
					local boxer2Frame3 = function ( boxer2, event )
						local boxer2Frame4 = function ( boxer2, event )
							local boxer2Frame5 = function ( boxer2, event )
								local boxer2Frame6 = function ( boxer2, event )
									local boxer2Frame7 = function ( boxer2, event )
										local boxer2Frame8 = function ( boxer2, event )
											local boxer2Frame9 = function ( boxer2, event )
												local boxer2Frame10 = function ( boxer2, event )
													local boxer2Frame11 = function ( boxer2, event )
														local boxer2Frame12 = function ( boxer2, event )
															local boxer2Frame13 = function ( boxer2, event )
																local boxer2Frame14 = function ( boxer2, event )
																	local boxer2Frame15 = function ( boxer2, event )
																		local boxer2Frame16 = function ( boxer2, event )
																			local boxer2Frame17 = function ( boxer2, event )
																				local boxer2Frame18 = function ( boxer2, event )
																					local boxer2Frame19 = function ( boxer2, event )
																						local boxer2Frame20 = function ( boxer2, event )
																							local boxer2Frame21 = function ( boxer2, event )
																								local boxer2Frame22 = function ( boxer2, event )
																									local boxer2Frame23 = function ( boxer2, event )
																										if not event.interrupted then
																											boxer2:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																										end
																										boxer2:setLeftRight( true, false, 258, 474 )
																										boxer2:setTopBottom( true, false, 0, 120 )
																										boxer2:setAlpha( 0 )
																										if event.interrupted then
																											self.clipFinished( boxer2, event )
																										else
																											boxer2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										boxer2Frame23( boxer2, event )
																										return 
																									else
																										boxer2:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																										boxer2:setLeftRight( true, false, 248, 464 )
																										boxer2:setAlpha( 1 )
																										boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									boxer2Frame22( boxer2, event )
																									return 
																								else
																									boxer2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																									boxer2:setLeftRight( true, false, 254.92, 470.92 )
																									boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								boxer2Frame21( boxer2, event )
																								return 
																							else
																								boxer2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
																								boxer2:setLeftRight( true, false, 257.58, 473.58 )
																								boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							boxer2Frame20( boxer2, event )
																							return 
																						else
																							boxer2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
																							boxer2:setLeftRight( true, false, 250.79, 466.79 )
																							boxer2:setAlpha( 0 )
																							boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						boxer2Frame19( boxer2, event )
																						return 
																					else
																						boxer2:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																						boxer2:setLeftRight( true, false, 244, 460 )
																						boxer2:setAlpha( 1 )
																						boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					boxer2Frame18( boxer2, event )
																					return 
																				else
																					boxer2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																					boxer2:setLeftRight( true, false, 250.32, 466.32 )
																					boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				boxer2Frame17( boxer2, event )
																				return 
																			else
																				boxer2:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
																				boxer2:setLeftRight( true, false, 256.15, 472.15 )
																				boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			boxer2Frame16( boxer2, event )
																			return 
																		else
																			boxer2:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
																			boxer2:setLeftRight( true, false, 272.11, 488.11 )
																			boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		boxer2Frame15( boxer2, event )
																		return 
																	else
																		boxer2:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
																		boxer2:setLeftRight( true, false, 275, 491 )
																		boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame15 )
																	end
																end
																
																if event.interrupted then
																	boxer2Frame14( boxer2, event )
																	return 
																else
																	boxer2:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
																	boxer2:setLeftRight( true, false, 263, 479 )
																	boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame14 )
																end
															end
															
															if event.interrupted then
																boxer2Frame13( boxer2, event )
																return 
															else
																boxer2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																boxer2:setLeftRight( true, false, 272.84, 488.84 )
																boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame13 )
															end
														end
														
														if event.interrupted then
															boxer2Frame12( boxer2, event )
															return 
														else
															boxer2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
															boxer2:setLeftRight( true, false, 268, 484 )
															boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame12 )
														end
													end
													
													if event.interrupted then
														boxer2Frame11( boxer2, event )
														return 
													else
														boxer2:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
														boxer2:setLeftRight( true, false, 258, 474 )
														boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame11 )
													end
												end
												
												if event.interrupted then
													boxer2Frame10( boxer2, event )
													return 
												else
													boxer2:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
													boxer2:setLeftRight( true, false, 256.17, 472.17 )
													boxer2:setAlpha( 0 )
													boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame10 )
												end
											end
											
											if event.interrupted then
												boxer2Frame9( boxer2, event )
												return 
											else
												boxer2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												boxer2:setLeftRight( true, false, 252, 468 )
												boxer2:setAlpha( 1 )
												boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame9 )
											end
										end
										
										if event.interrupted then
											boxer2Frame8( boxer2, event )
											return 
										else
											boxer2:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											boxer2:setLeftRight( true, false, 261.1, 477.1 )
											boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame8 )
										end
									end
									
									if event.interrupted then
										boxer2Frame7( boxer2, event )
										return 
									else
										boxer2:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
										boxer2:setLeftRight( true, false, 266, 482 )
										boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame7 )
									end
								end
								
								if event.interrupted then
									boxer2Frame6( boxer2, event )
									return 
								else
									boxer2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
									boxer2:setLeftRight( true, false, 265.59, 481.59 )
									boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame6 )
								end
							end
							
							if event.interrupted then
								boxer2Frame5( boxer2, event )
								return 
							else
								boxer2:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
								boxer2:setLeftRight( true, false, 275.17, 491.17 )
								boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame5 )
							end
						end
						
						if event.interrupted then
							boxer2Frame4( boxer2, event )
							return 
						else
							boxer2:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							boxer2:setLeftRight( true, false, 260.25, 476.25 )
							boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame4 )
						end
					end
					
					if event.interrupted then
						boxer2Frame3( boxer2, event )
						return 
					else
						boxer2:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						boxer2:setLeftRight( true, false, 268.79, 484.79 )
						boxer2:registerEventHandler( "transition_complete_keyframe", boxer2Frame3 )
					end
				end
				
				boxer2:completeAnimation()
				self.boxer2:setLeftRight( true, false, 258, 474 )
				self.boxer2:setTopBottom( true, false, 0, 120 )
				self.boxer2:setAlpha( 0 )
				boxer2Frame2( boxer2, {} )
				local sweatFrame2 = function ( sweat, event )
					local sweatFrame3 = function ( sweat, event )
						local sweatFrame4 = function ( sweat, event )
							local sweatFrame5 = function ( sweat, event )
								if not event.interrupted then
									sweat:beginAnimation( "keyframe", 2960, false, false, CoD.TweenType.Linear )
								end
								sweat:setAlpha( 0 )
								sweat:setScale( 1.2 )
								if event.interrupted then
									self.clipFinished( sweat, event )
								else
									sweat:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								sweatFrame5( sweat, event )
								return 
							else
								sweat:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
								sweat:setAlpha( 0 )
								sweat:setScale( 1.2 )
								sweat:registerEventHandler( "transition_complete_keyframe", sweatFrame5 )
							end
						end
						
						if event.interrupted then
							sweatFrame4( sweat, event )
							return 
						else
							sweat:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							sweat:setAlpha( 1 )
							sweat:registerEventHandler( "transition_complete_keyframe", sweatFrame4 )
						end
					end
					
					if event.interrupted then
						sweatFrame3( sweat, event )
						return 
					else
						sweat:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
						sweat:registerEventHandler( "transition_complete_keyframe", sweatFrame3 )
					end
				end
				
				sweat:completeAnimation()
				self.sweat:setAlpha( 0 )
				self.sweat:setScale( 1 )
				sweatFrame2( sweat, {} )
				local dust1Frame2 = function ( dust1, event )
					local dust1Frame3 = function ( dust1, event )
						local dust1Frame4 = function ( dust1, event )
							local dust1Frame5 = function ( dust1, event )
								local dust1Frame6 = function ( dust1, event )
									local dust1Frame7 = function ( dust1, event )
										local dust1Frame8 = function ( dust1, event )
											local dust1Frame9 = function ( dust1, event )
												local dust1Frame10 = function ( dust1, event )
													local dust1Frame11 = function ( dust1, event )
														local dust1Frame12 = function ( dust1, event )
															if not event.interrupted then
																dust1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
															end
															dust1:setLeftRight( true, false, 224.23, 368.23 )
															dust1:setTopBottom( true, false, 17.43, 137.43 )
															dust1:setAlpha( 0.69 )
															if event.interrupted then
																self.clipFinished( dust1, event )
															else
																dust1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															dust1Frame12( dust1, event )
															return 
														else
															dust1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															dust1:setLeftRight( true, false, 223.66, 367.66 )
															dust1:setTopBottom( true, false, 26, 146 )
															dust1:setAlpha( 1 )
															dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame12 )
														end
													end
													
													if event.interrupted then
														dust1Frame11( dust1, event )
														return 
													else
														dust1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														dust1:setLeftRight( true, false, 223.57, 367.57 )
														dust1:setTopBottom( true, false, 17.5, 137.5 )
														dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame11 )
													end
												end
												
												if event.interrupted then
													dust1Frame10( dust1, event )
													return 
												else
													dust1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													dust1:setLeftRight( true, false, 223.48, 367.48 )
													dust1:setTopBottom( true, false, 9, 129 )
													dust1:setAlpha( 0 )
													dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame10 )
												end
											end
											
											if event.interrupted then
												dust1Frame9( dust1, event )
												return 
											else
												dust1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												dust1:setLeftRight( true, false, 223.01, 367.01 )
												dust1:setTopBottom( true, false, 22.73, 142.73 )
												dust1:setAlpha( 1 )
												dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame9 )
											end
										end
										
										if event.interrupted then
											dust1Frame8( dust1, event )
											return 
										else
											dust1:beginAnimation( "keyframe", 1619, false, false, CoD.TweenType.Linear )
											dust1:setLeftRight( true, false, 223, 367 )
											dust1:setTopBottom( true, false, 23, 143 )
											dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame8 )
										end
									end
									
									if event.interrupted then
										dust1Frame7( dust1, event )
										return 
									else
										dust1:beginAnimation( "keyframe", 940, false, false, CoD.TweenType.Linear )
										dust1:setLeftRight( true, false, 224, 368 )
										dust1:setTopBottom( true, false, 0, 120 )
										dust1:setAlpha( 0 )
										dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame7 )
									end
								end
								
								if event.interrupted then
									dust1Frame6( dust1, event )
									return 
								else
									dust1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									dust1:setLeftRight( true, false, 211.89, 355.89 )
									dust1:setTopBottom( true, false, 15, 135 )
									dust1:setAlpha( 1 )
									dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame6 )
								end
							end
							
							if event.interrupted then
								dust1Frame5( dust1, event )
								return 
							else
								dust1:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
								dust1:setLeftRight( true, false, 212.96, 356.96 )
								dust1:setTopBottom( true, false, 14.26, 134.26 )
								dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame5 )
							end
						end
						
						if event.interrupted then
							dust1Frame4( dust1, event )
							return 
						else
							dust1:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
							dust1:setTopBottom( true, false, 6, 126 )
							dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame4 )
						end
					end
					
					if event.interrupted then
						dust1Frame3( dust1, event )
						return 
					else
						dust1:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						dust1:setLeftRight( true, false, 225, 369 )
						dust1:setTopBottom( true, false, 15, 135 )
						dust1:setAlpha( 0 )
						dust1:registerEventHandler( "transition_complete_keyframe", dust1Frame3 )
					end
				end
				
				dust1:completeAnimation()
				self.dust1:setLeftRight( true, false, 224.23, 368.23 )
				self.dust1:setTopBottom( true, false, 17.43, 137.43 )
				self.dust1:setAlpha( 0.69 )
				dust1Frame2( dust1, {} )
				local bagFrame2 = function ( bag, event )
					local bagFrame3 = function ( bag, event )
						local bagFrame4 = function ( bag, event )
							local bagFrame5 = function ( bag, event )
								local bagFrame6 = function ( bag, event )
									local bagFrame7 = function ( bag, event )
										local bagFrame8 = function ( bag, event )
											local bagFrame9 = function ( bag, event )
												local bagFrame10 = function ( bag, event )
													local bagFrame11 = function ( bag, event )
														local bagFrame12 = function ( bag, event )
															local bagFrame13 = function ( bag, event )
																local bagFrame14 = function ( bag, event )
																	local bagFrame15 = function ( bag, event )
																		local bagFrame16 = function ( bag, event )
																			local bagFrame17 = function ( bag, event )
																				if not event.interrupted then
																					bag:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																				end
																				bag:setLeftRight( true, false, 118.58, 286.58 )
																				bag:setTopBottom( true, false, -21, 135 )
																				bag:setZRot( -1.76 )
																				if event.interrupted then
																					self.clipFinished( bag, event )
																				else
																					bag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				bagFrame17( bag, event )
																				return 
																			else
																				bag:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																				bag:setZRot( -2.74 )
																				bag:registerEventHandler( "transition_complete_keyframe", bagFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			bagFrame16( bag, event )
																			return 
																		else
																			bag:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
																			bag:setLeftRight( true, false, 116, 284 )
																			bag:setZRot( -4 )
																			bag:registerEventHandler( "transition_complete_keyframe", bagFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		bagFrame15( bag, event )
																		return 
																	else
																		bag:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																		bag:setLeftRight( true, false, 123, 291 )
																		bag:setZRot( 5 )
																		bag:registerEventHandler( "transition_complete_keyframe", bagFrame15 )
																	end
																end
																
																if event.interrupted then
																	bagFrame14( bag, event )
																	return 
																else
																	bag:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																	bag:setLeftRight( true, false, 116, 284 )
																	bag:setZRot( -4 )
																	bag:registerEventHandler( "transition_complete_keyframe", bagFrame14 )
																end
															end
															
															if event.interrupted then
																bagFrame13( bag, event )
																return 
															else
																bag:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
																bag:registerEventHandler( "transition_complete_keyframe", bagFrame13 )
															end
														end
														
														if event.interrupted then
															bagFrame12( bag, event )
															return 
														else
															bag:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
															bag:setZRot( 4 )
															bag:registerEventHandler( "transition_complete_keyframe", bagFrame12 )
														end
													end
													
													if event.interrupted then
														bagFrame11( bag, event )
														return 
													else
														bag:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
														bag:setZRot( 2 )
														bag:registerEventHandler( "transition_complete_keyframe", bagFrame11 )
													end
												end
												
												if event.interrupted then
													bagFrame10( bag, event )
													return 
												else
													bag:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
													bag:setZRot( 3 )
													bag:registerEventHandler( "transition_complete_keyframe", bagFrame10 )
												end
											end
											
											if event.interrupted then
												bagFrame9( bag, event )
												return 
											else
												bag:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
												bag:setLeftRight( true, false, 123, 291 )
												bag:setZRot( -1.8 )
												bag:registerEventHandler( "transition_complete_keyframe", bagFrame9 )
											end
										end
										
										if event.interrupted then
											bagFrame8( bag, event )
											return 
										else
											bag:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
											bag:setLeftRight( true, false, 116, 284 )
											bag:setZRot( -4 )
											bag:registerEventHandler( "transition_complete_keyframe", bagFrame8 )
										end
									end
									
									if event.interrupted then
										bagFrame7( bag, event )
										return 
									else
										bag:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
										bag:setZRot( 0 )
										bag:registerEventHandler( "transition_complete_keyframe", bagFrame7 )
									end
								end
								
								if event.interrupted then
									bagFrame6( bag, event )
									return 
								else
									bag:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
									bag:setZRot( 2 )
									bag:registerEventHandler( "transition_complete_keyframe", bagFrame6 )
								end
							end
							
							if event.interrupted then
								bagFrame5( bag, event )
								return 
							else
								bag:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
								bag:setZRot( -0.56 )
								bag:registerEventHandler( "transition_complete_keyframe", bagFrame5 )
							end
						end
						
						if event.interrupted then
							bagFrame4( bag, event )
							return 
						else
							bag:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							bag:setZRot( 7 )
							bag:registerEventHandler( "transition_complete_keyframe", bagFrame4 )
						end
					end
					
					if event.interrupted then
						bagFrame3( bag, event )
						return 
					else
						bag:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						bag:setLeftRight( true, false, 123, 291 )
						bag:setZRot( 5 )
						bag:registerEventHandler( "transition_complete_keyframe", bagFrame3 )
					end
				end
				
				bag:completeAnimation()
				self.bag:setLeftRight( true, false, 118.58, 286.58 )
				self.bag:setTopBottom( true, false, -21, 135 )
				self.bag:setZRot( -1.76 )
				bagFrame2( bag, {} )
				local lightFrame2 = function ( light, event )
					local lightFrame3 = function ( light, event )
						local lightFrame4 = function ( light, event )
							local lightFrame5 = function ( light, event )
								local lightFrame6 = function ( light, event )
									local lightFrame7 = function ( light, event )
										local lightFrame8 = function ( light, event )
											local lightFrame9 = function ( light, event )
												if not event.interrupted then
													light:beginAnimation( "keyframe", 679, false, false, CoD.TweenType.Linear )
												end
												light:setAlpha( 0.5 )
												if event.interrupted then
													self.clipFinished( light, event )
												else
													light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												lightFrame9( light, event )
												return 
											else
												light:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
												light:setAlpha( 1 )
												light:registerEventHandler( "transition_complete_keyframe", lightFrame9 )
											end
										end
										
										if event.interrupted then
											lightFrame8( light, event )
											return 
										else
											light:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
											light:setAlpha( 0.75 )
											light:registerEventHandler( "transition_complete_keyframe", lightFrame8 )
										end
									end
									
									if event.interrupted then
										lightFrame7( light, event )
										return 
									else
										light:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
										light:setAlpha( 0.91 )
										light:registerEventHandler( "transition_complete_keyframe", lightFrame7 )
									end
								end
								
								if event.interrupted then
									lightFrame6( light, event )
									return 
								else
									light:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
									light:setAlpha( 0.79 )
									light:registerEventHandler( "transition_complete_keyframe", lightFrame6 )
								end
							end
							
							if event.interrupted then
								lightFrame5( light, event )
								return 
							else
								light:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
								light:setAlpha( 1 )
								light:registerEventHandler( "transition_complete_keyframe", lightFrame5 )
							end
						end
						
						if event.interrupted then
							lightFrame4( light, event )
							return 
						else
							light:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
							light:setAlpha( 0.41 )
							light:registerEventHandler( "transition_complete_keyframe", lightFrame4 )
						end
					end
					
					if event.interrupted then
						lightFrame3( light, event )
						return 
					else
						light:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						light:setAlpha( 0.56 )
						light:registerEventHandler( "transition_complete_keyframe", lightFrame3 )
					end
				end
				
				light:completeAnimation()
				self.light:setAlpha( 0.5 )
				lightFrame2( light, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

