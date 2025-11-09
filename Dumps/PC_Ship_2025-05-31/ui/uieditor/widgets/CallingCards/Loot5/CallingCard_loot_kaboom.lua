CoD.CallingCard_loot_kaboom = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_kaboom.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_kaboom )
	self.id = "CallingCard_loot_kaboom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bomb = LUI.UIImage.new()
	bomb:setLeftRight( true, false, 271.17, 310.8 )
	bomb:setTopBottom( true, false, 44.71, 90 )
	bomb:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_bomb" ) )
	self:addElement( bomb )
	self.bomb = bomb
	
	local bomb2 = LUI.UIImage.new()
	bomb2:setLeftRight( true, false, 271.17, 310.8 )
	bomb2:setTopBottom( true, false, 44.71, 90 )
	bomb2:setAlpha( 0 )
	bomb2:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_bomb" ) )
	self:addElement( bomb2 )
	self.bomb2 = bomb2
	
	local dude = LUI.UIImage.new()
	dude:setLeftRight( true, false, 0, 313.8 )
	dude:setTopBottom( true, false, 16, 98.58 )
	dude:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_dude" ) )
	self:addElement( dude )
	self.dude = dude
	
	local stars = LUI.UIImage.new()
	stars:setLeftRight( true, false, 264.8, 310.8 )
	stars:setTopBottom( true, false, 67.36, 113.36 )
	stars:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_stars" ) )
	self:addElement( stars )
	self.stars = stars
	
	local stars2 = LUI.UIImage.new()
	stars2:setLeftRight( true, false, 146.8, 192.8 )
	stars2:setTopBottom( true, false, 105.86, 151.86 )
	stars2:setAlpha( 0 )
	stars2:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_stars" ) )
	self:addElement( stars2 )
	self.stars2 = stars2
	
	local Boom1 = LUI.UIImage.new()
	Boom1:setLeftRight( true, false, 325.71, 480 )
	Boom1:setTopBottom( true, false, 0, 120 )
	Boom1:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_boom1" ) )
	self:addElement( Boom1 )
	self.Boom1 = Boom1
	
	local Boom2 = LUI.UIImage.new()
	Boom2:setLeftRight( true, false, 325.71, 480 )
	Boom2:setTopBottom( true, false, 0, 120 )
	Boom2:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_boom2" ) )
	self:addElement( Boom2 )
	self.Boom2 = Boom2
	
	local Boom3 = LUI.UIImage.new()
	Boom3:setLeftRight( true, false, 325.71, 480 )
	Boom3:setTopBottom( true, false, 0, 120 )
	Boom3:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_boom3" ) )
	self:addElement( Boom3 )
	self.Boom3 = Boom3
	
	local frame = LUI.UIImage.new()
	frame:setLeftRight( true, false, 0, 480 )
	frame:setTopBottom( true, false, 0, 120 )
	frame:setImage( RegisterImage( "uie_t7_loot_callingcard_retro_kaboom_frame" ) )
	self:addElement( frame )
	self.frame = frame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local bombFrame2 = function ( bomb, event )
					local bombFrame3 = function ( bomb, event )
						local bombFrame4 = function ( bomb, event )
							local bombFrame5 = function ( bomb, event )
								local bombFrame6 = function ( bomb, event )
									local bombFrame7 = function ( bomb, event )
										local bombFrame8 = function ( bomb, event )
											local bombFrame9 = function ( bomb, event )
												local bombFrame10 = function ( bomb, event )
													local bombFrame11 = function ( bomb, event )
														local bombFrame12 = function ( bomb, event )
															local bombFrame13 = function ( bomb, event )
																local bombFrame14 = function ( bomb, event )
																	local bombFrame15 = function ( bomb, event )
																		local bombFrame16 = function ( bomb, event )
																			local bombFrame17 = function ( bomb, event )
																				local bombFrame18 = function ( bomb, event )
																					local bombFrame19 = function ( bomb, event )
																						if not event.interrupted then
																							bomb:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						end
																						bomb:setLeftRight( true, false, 268.37, 308 )
																						bomb:setTopBottom( true, false, 117.29, 162.58 )
																						bomb:setAlpha( 0 )
																						if event.interrupted then
																							self.clipFinished( bomb, event )
																						else
																							bomb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						bombFrame19( bomb, event )
																						return 
																					else
																						bomb:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
																						bomb:setTopBottom( true, false, 117.29, 162.58 )
																						bomb:registerEventHandler( "transition_complete_keyframe", bombFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					bombFrame18( bomb, event )
																					return 
																				else
																					bomb:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					bomb:setTopBottom( true, false, 53.29, 98.58 )
																					bomb:setAlpha( 1 )
																					bomb:registerEventHandler( "transition_complete_keyframe", bombFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				bombFrame17( bomb, event )
																				return 
																			else
																				bomb:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
																				bomb:setLeftRight( true, false, 268.37, 308 )
																				bomb:setTopBottom( true, false, 51.29, 96.58 )
																				bomb:registerEventHandler( "transition_complete_keyframe", bombFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			bombFrame16( bomb, event )
																			return 
																		else
																			bomb:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			bomb:setLeftRight( true, false, 187.76, 227.39 )
																			bomb:setTopBottom( true, false, 111.95, 157.24 )
																			bomb:setAlpha( 0 )
																			bomb:registerEventHandler( "transition_complete_keyframe", bombFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		bombFrame15( bomb, event )
																		return 
																	else
																		bomb:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
																		bomb:setTopBottom( true, false, 113, 158.29 )
																		bomb:registerEventHandler( "transition_complete_keyframe", bombFrame15 )
																	end
																end
																
																if event.interrupted then
																	bombFrame14( bomb, event )
																	return 
																else
																	bomb:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	bomb:setAlpha( 1 )
																	bomb:registerEventHandler( "transition_complete_keyframe", bombFrame14 )
																end
															end
															
															if event.interrupted then
																bombFrame13( bomb, event )
																return 
															else
																bomb:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
																bomb:setLeftRight( true, false, 186.37, 226 )
																bomb:setTopBottom( true, false, 51, 96.29 )
																bomb:registerEventHandler( "transition_complete_keyframe", bombFrame13 )
															end
														end
														
														if event.interrupted then
															bombFrame12( bomb, event )
															return 
														else
															bomb:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															bomb:setAlpha( 0 )
															bomb:registerEventHandler( "transition_complete_keyframe", bombFrame12 )
														end
													end
													
													if event.interrupted then
														bombFrame11( bomb, event )
														return 
													else
														bomb:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
														bomb:setTopBottom( true, false, 113, 158.29 )
														bomb:registerEventHandler( "transition_complete_keyframe", bombFrame11 )
													end
												end
												
												if event.interrupted then
													bombFrame10( bomb, event )
													return 
												else
													bomb:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													bomb:setAlpha( 1 )
													bomb:registerEventHandler( "transition_complete_keyframe", bombFrame10 )
												end
											end
											
											if event.interrupted then
												bombFrame9( bomb, event )
												return 
											else
												bomb:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												bomb:setLeftRight( true, false, 83.37, 123 )
												bomb:setTopBottom( true, false, 44.09, 89.38 )
												bomb:registerEventHandler( "transition_complete_keyframe", bombFrame9 )
											end
										end
										
										if event.interrupted then
											bombFrame8( bomb, event )
											return 
										else
											bomb:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											bomb:setAlpha( 0 )
											bomb:registerEventHandler( "transition_complete_keyframe", bombFrame8 )
										end
									end
									
									if event.interrupted then
										bombFrame7( bomb, event )
										return 
									else
										bomb:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
										bomb:setLeftRight( true, false, 179.45, 219.07 )
										bomb:setTopBottom( true, false, 109.71, 155 )
										bomb:registerEventHandler( "transition_complete_keyframe", bombFrame7 )
									end
								end
								
								if event.interrupted then
									bombFrame6( bomb, event )
									return 
								else
									bomb:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									bomb:setLeftRight( true, false, 181.4, 221.03 )
									bomb:setTopBottom( true, false, 48.32, 93.61 )
									bomb:setAlpha( 1 )
									bomb:registerEventHandler( "transition_complete_keyframe", bombFrame6 )
								end
							end
							
							if event.interrupted then
								bombFrame5( bomb, event )
								return 
							else
								bomb:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								bomb:setLeftRight( true, false, 181.51, 221.14 )
								bomb:setTopBottom( true, false, 44.71, 90 )
								bomb:registerEventHandler( "transition_complete_keyframe", bombFrame5 )
							end
						end
						
						if event.interrupted then
							bombFrame4( bomb, event )
							return 
						else
							bomb:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							bomb:setAlpha( 0 )
							bomb:registerEventHandler( "transition_complete_keyframe", bombFrame4 )
						end
					end
					
					if event.interrupted then
						bombFrame3( bomb, event )
						return 
					else
						bomb:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						bomb:setTopBottom( true, false, 113, 158.29 )
						bomb:registerEventHandler( "transition_complete_keyframe", bombFrame3 )
					end
				end
				
				bomb:completeAnimation()
				self.bomb:setLeftRight( true, false, 271.17, 310.8 )
				self.bomb:setTopBottom( true, false, 44.71, 90 )
				self.bomb:setAlpha( 1 )
				bombFrame2( bomb, {} )
				local bomb2Frame2 = function ( bomb2, event )
					local bomb2Frame3 = function ( bomb2, event )
						local bomb2Frame4 = function ( bomb2, event )
							local bomb2Frame5 = function ( bomb2, event )
								local bomb2Frame6 = function ( bomb2, event )
									local bomb2Frame7 = function ( bomb2, event )
										local bomb2Frame8 = function ( bomb2, event )
											local bomb2Frame9 = function ( bomb2, event )
												local bomb2Frame10 = function ( bomb2, event )
													local bomb2Frame11 = function ( bomb2, event )
														local bomb2Frame12 = function ( bomb2, event )
															local bomb2Frame13 = function ( bomb2, event )
																local bomb2Frame14 = function ( bomb2, event )
																	local bomb2Frame15 = function ( bomb2, event )
																		local bomb2Frame16 = function ( bomb2, event )
																			local bomb2Frame17 = function ( bomb2, event )
																				if not event.interrupted then
																					bomb2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				end
																				bomb2:setLeftRight( true, false, 228.74, 268.37 )
																				bomb2:setTopBottom( true, false, 117.29, 162.58 )
																				bomb2:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( bomb2, event )
																				else
																					bomb2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				bomb2Frame17( bomb2, event )
																				return 
																			else
																				bomb2:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																				bomb2:setLeftRight( true, false, 228.74, 268.37 )
																				bomb2:setTopBottom( true, false, 117.29, 162.58 )
																				bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			bomb2Frame16( bomb2, event )
																			return 
																		else
																			bomb2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			bomb2:setAlpha( 1 )
																			bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		bomb2Frame15( bomb2, event )
																		return 
																	else
																		bomb2:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
																		bomb2:setLeftRight( true, false, 226.74, 266.37 )
																		bomb2:setTopBottom( true, false, 47, 92.29 )
																		bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame15 )
																	end
																end
																
																if event.interrupted then
																	bomb2Frame14( bomb2, event )
																	return 
																else
																	bomb2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	bomb2:setLeftRight( true, false, 99.3, 138.93 )
																	bomb2:setTopBottom( true, false, 111.43, 156.72 )
																	bomb2:setAlpha( 0 )
																	bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame14 )
																end
															end
															
															if event.interrupted then
																bomb2Frame13( bomb2, event )
																return 
															else
																bomb2:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
																bomb2:setTopBottom( true, false, 113, 158.29 )
																bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame13 )
															end
														end
														
														if event.interrupted then
															bomb2Frame12( bomb2, event )
															return 
														else
															bomb2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															bomb2:setTopBottom( true, false, 48.94, 94.23 )
															bomb2:setAlpha( 1 )
															bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame12 )
														end
													end
													
													if event.interrupted then
														bomb2Frame11( bomb2, event )
														return 
													else
														bomb2:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
														bomb2:setLeftRight( true, false, 96.19, 135.82 )
														bomb2:setTopBottom( true, false, 47, 92.29 )
														bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame11 )
													end
												end
												
												if event.interrupted then
													bomb2Frame10( bomb2, event )
													return 
												else
													bomb2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													bomb2:setAlpha( 0 )
													bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame10 )
												end
											end
											
											if event.interrupted then
												bomb2Frame9( bomb2, event )
												return 
											else
												bomb2:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
												bomb2:setLeftRight( true, false, 196.19, 235.82 )
												bomb2:setTopBottom( true, false, 113, 158.29 )
												bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame9 )
											end
										end
										
										if event.interrupted then
											bomb2Frame8( bomb2, event )
											return 
										else
											bomb2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											bomb2:setAlpha( 1 )
											bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame8 )
										end
									end
									
									if event.interrupted then
										bomb2Frame7( bomb2, event )
										return 
									else
										bomb2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
										bomb2:setLeftRight( true, false, 195.37, 235 )
										bomb2:setTopBottom( true, false, 46.71, 92 )
										bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame7 )
									end
								end
								
								if event.interrupted then
									bomb2Frame6( bomb2, event )
									return 
								else
									bomb2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									bomb2:setAlpha( 0 )
									bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame6 )
								end
							end
							
							if event.interrupted then
								bomb2Frame5( bomb2, event )
								return 
							else
								bomb2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
								bomb2:setLeftRight( true, false, 129.37, 169 )
								bomb2:setTopBottom( true, false, 109.71, 155 )
								bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame5 )
							end
						end
						
						if event.interrupted then
							bomb2Frame4( bomb2, event )
							return 
						else
							bomb2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							bomb2:setLeftRight( true, false, 127.84, 167.47 )
							bomb2:setTopBottom( true, false, 47.38, 92.67 )
							bomb2:setAlpha( 1 )
							bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame4 )
						end
					end
					
					if event.interrupted then
						bomb2Frame3( bomb2, event )
						return 
					else
						bomb2:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						bomb2:registerEventHandler( "transition_complete_keyframe", bomb2Frame3 )
					end
				end
				
				bomb2:completeAnimation()
				self.bomb2:setLeftRight( true, false, 127.75, 167.38 )
				self.bomb2:setTopBottom( true, false, 43.71, 89 )
				self.bomb2:setAlpha( 0 )
				bomb2Frame2( bomb2, {} )
				local dudeFrame2 = function ( dude, event )
					local dudeFrame3 = function ( dude, event )
						local dudeFrame4 = function ( dude, event )
							local dudeFrame5 = function ( dude, event )
								local dudeFrame6 = function ( dude, event )
									local dudeFrame7 = function ( dude, event )
										local dudeFrame8 = function ( dude, event )
											local dudeFrame9 = function ( dude, event )
												local dudeFrame10 = function ( dude, event )
													if not event.interrupted then
														dude:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
													end
													dude:setLeftRight( true, false, 0, 313.8 )
													dude:setTopBottom( true, false, 16, 98.58 )
													if event.interrupted then
														self.clipFinished( dude, event )
													else
														dude:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													dudeFrame10( dude, event )
													return 
												else
													dude:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
													dude:setLeftRight( true, false, -93, 220.8 )
													dude:registerEventHandler( "transition_complete_keyframe", dudeFrame10 )
												end
											end
											
											if event.interrupted then
												dudeFrame9( dude, event )
												return 
											else
												dude:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
												dude:setLeftRight( true, false, 0, 313.8 )
												dude:registerEventHandler( "transition_complete_keyframe", dudeFrame9 )
											end
										end
										
										if event.interrupted then
											dudeFrame8( dude, event )
											return 
										else
											dude:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
											dude:setLeftRight( true, false, -175.8, 138 )
											dude:registerEventHandler( "transition_complete_keyframe", dudeFrame8 )
										end
									end
									
									if event.interrupted then
										dudeFrame7( dude, event )
										return 
									else
										dude:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
										dude:setLeftRight( true, false, -18.8, 295 )
										dude:registerEventHandler( "transition_complete_keyframe", dudeFrame7 )
									end
								end
								
								if event.interrupted then
									dudeFrame6( dude, event )
									return 
								else
									dude:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
									dude:setLeftRight( true, false, -119.8, 194 )
									dude:registerEventHandler( "transition_complete_keyframe", dudeFrame6 )
								end
							end
							
							if event.interrupted then
								dudeFrame5( dude, event )
								return 
							else
								dude:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
								dude:setLeftRight( true, false, -73.8, 240 )
								dude:registerEventHandler( "transition_complete_keyframe", dudeFrame5 )
							end
						end
						
						if event.interrupted then
							dudeFrame4( dude, event )
							return 
						else
							dude:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
							dude:setLeftRight( true, false, -201.9, 111.9 )
							dude:registerEventHandler( "transition_complete_keyframe", dudeFrame4 )
						end
					end
					
					if event.interrupted then
						dudeFrame3( dude, event )
						return 
					else
						dude:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						dude:setLeftRight( true, false, -33.9, 279.9 )
						dude:registerEventHandler( "transition_complete_keyframe", dudeFrame3 )
					end
				end
				
				dude:completeAnimation()
				self.dude:setLeftRight( true, false, 0, 313.8 )
				self.dude:setTopBottom( true, false, 16, 98.58 )
				dudeFrame2( dude, {} )
				local starsFrame2 = function ( stars, event )
					local starsFrame3 = function ( stars, event )
						local starsFrame4 = function ( stars, event )
							local starsFrame5 = function ( stars, event )
								local starsFrame6 = function ( stars, event )
									local starsFrame7 = function ( stars, event )
										local starsFrame8 = function ( stars, event )
											local starsFrame9 = function ( stars, event )
												local starsFrame10 = function ( stars, event )
													local starsFrame11 = function ( stars, event )
														local starsFrame12 = function ( stars, event )
															local starsFrame13 = function ( stars, event )
																local starsFrame14 = function ( stars, event )
																	local starsFrame15 = function ( stars, event )
																		local starsFrame16 = function ( stars, event )
																			local starsFrame17 = function ( stars, event )
																				local starsFrame18 = function ( stars, event )
																					local starsFrame19 = function ( stars, event )
																						local starsFrame20 = function ( stars, event )
																							local starsFrame21 = function ( stars, event )
																								local starsFrame22 = function ( stars, event )
																									if not event.interrupted then
																										stars:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																									end
																									stars:setLeftRight( true, false, 268.37, 314.37 )
																									stars:setTopBottom( true, false, 110, 156 )
																									stars:setAlpha( 1 )
																									if event.interrupted then
																										self.clipFinished( stars, event )
																									else
																										stars:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																									end
																								end
																								
																								if event.interrupted then
																									starsFrame22( stars, event )
																									return 
																								else
																									stars:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									stars:setAlpha( 1 )
																									stars:registerEventHandler( "transition_complete_keyframe", starsFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								starsFrame21( stars, event )
																								return 
																							else
																								stars:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																								stars:setLeftRight( true, false, 266.51, 312.51 )
																								stars:setTopBottom( true, false, 66.53, 112.53 )
																								stars:registerEventHandler( "transition_complete_keyframe", starsFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							starsFrame20( stars, event )
																							return 
																						else
																							stars:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							stars:setAlpha( 0 )
																							stars:registerEventHandler( "transition_complete_keyframe", starsFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						starsFrame19( stars, event )
																						return 
																					else
																						stars:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
																						stars:setLeftRight( true, false, 182.43, 228.43 )
																						stars:setTopBottom( true, false, 117.53, 163.53 )
																						stars:setAlpha( 0.03 )
																						stars:registerEventHandler( "transition_complete_keyframe", starsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					starsFrame18( stars, event )
																					return 
																				else
																					stars:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					stars:setAlpha( 1 )
																					stars:registerEventHandler( "transition_complete_keyframe", starsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				starsFrame17( stars, event )
																				return 
																			else
																				stars:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																				stars:registerEventHandler( "transition_complete_keyframe", starsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			starsFrame16( stars, event )
																			return 
																		else
																			stars:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
																			stars:setLeftRight( true, false, 183.19, 229.19 )
																			stars:setTopBottom( true, false, 69.76, 115.76 )
																			stars:registerEventHandler( "transition_complete_keyframe", starsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		starsFrame15( stars, event )
																		return 
																	else
																		stars:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		stars:setAlpha( 0 )
																		stars:registerEventHandler( "transition_complete_keyframe", starsFrame15 )
																	end
																end
																
																if event.interrupted then
																	starsFrame14( stars, event )
																	return 
																else
																	stars:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																	stars:setTopBottom( true, false, 114, 160 )
																	stars:setAlpha( 0.07 )
																	stars:registerEventHandler( "transition_complete_keyframe", starsFrame14 )
																end
															end
															
															if event.interrupted then
																starsFrame13( stars, event )
																return 
															else
																stars:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																stars:setAlpha( 1 )
																stars:registerEventHandler( "transition_complete_keyframe", starsFrame13 )
															end
														end
														
														if event.interrupted then
															starsFrame12( stars, event )
															return 
														else
															stars:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															stars:setLeftRight( true, false, 80.59, 126.59 )
															stars:setTopBottom( true, false, 72, 118 )
															stars:registerEventHandler( "transition_complete_keyframe", starsFrame12 )
														end
													end
													
													if event.interrupted then
														starsFrame11( stars, event )
														return 
													else
														stars:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														stars:setAlpha( 0 )
														stars:registerEventHandler( "transition_complete_keyframe", starsFrame11 )
													end
												end
												
												if event.interrupted then
													starsFrame10( stars, event )
													return 
												else
													stars:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
													stars:setLeftRight( true, false, 176.53, 222.53 )
													stars:setTopBottom( true, false, 117.58, 163.58 )
													stars:registerEventHandler( "transition_complete_keyframe", starsFrame10 )
												end
											end
											
											if event.interrupted then
												starsFrame9( stars, event )
												return 
											else
												stars:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												stars:setAlpha( 1 )
												stars:registerEventHandler( "transition_complete_keyframe", starsFrame9 )
											end
										end
										
										if event.interrupted then
											starsFrame8( stars, event )
											return 
										else
											stars:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											stars:setLeftRight( true, false, 177.53, 223.53 )
											stars:setTopBottom( true, false, 72.58, 118.58 )
											stars:setAlpha( 0.5 )
											stars:registerEventHandler( "transition_complete_keyframe", starsFrame8 )
										end
									end
									
									if event.interrupted then
										starsFrame7( stars, event )
										return 
									else
										stars:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
										stars:setLeftRight( true, false, 182.38, 228.38 )
										stars:setTopBottom( true, false, 75.07, 121.07 )
										stars:registerEventHandler( "transition_complete_keyframe", starsFrame7 )
									end
								end
								
								if event.interrupted then
									starsFrame6( stars, event )
									return 
								else
									stars:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									stars:setAlpha( 0 )
									stars:registerEventHandler( "transition_complete_keyframe", starsFrame6 )
								end
							end
							
							if event.interrupted then
								starsFrame5( stars, event )
								return 
							else
								stars:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								stars:setTopBottom( true, false, 117.36, 163.36 )
								stars:setAlpha( 0.04 )
								stars:registerEventHandler( "transition_complete_keyframe", starsFrame5 )
							end
						end
						
						if event.interrupted then
							starsFrame4( stars, event )
							return 
						else
							stars:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							stars:setAlpha( 1 )
							stars:registerEventHandler( "transition_complete_keyframe", starsFrame4 )
						end
					end
					
					if event.interrupted then
						starsFrame3( stars, event )
						return 
					else
						stars:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						stars:registerEventHandler( "transition_complete_keyframe", starsFrame3 )
					end
				end
				
				stars:completeAnimation()
				self.stars:setLeftRight( true, false, 264.8, 310.8 )
				self.stars:setTopBottom( true, false, 67.36, 113.36 )
				self.stars:setAlpha( 0 )
				starsFrame2( stars, {} )
				local stars2Frame2 = function ( stars2, event )
					local stars2Frame3 = function ( stars2, event )
						local stars2Frame4 = function ( stars2, event )
							local stars2Frame5 = function ( stars2, event )
								local stars2Frame6 = function ( stars2, event )
									local stars2Frame7 = function ( stars2, event )
										local stars2Frame8 = function ( stars2, event )
											local stars2Frame9 = function ( stars2, event )
												local stars2Frame10 = function ( stars2, event )
													local stars2Frame11 = function ( stars2, event )
														local stars2Frame12 = function ( stars2, event )
															local stars2Frame13 = function ( stars2, event )
																local stars2Frame14 = function ( stars2, event )
																	local stars2Frame15 = function ( stars2, event )
																		local stars2Frame16 = function ( stars2, event )
																			local stars2Frame17 = function ( stars2, event )
																				if not event.interrupted then
																					stars2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																				end
																				stars2:setLeftRight( true, false, 224.7, 270.7 )
																				stars2:setTopBottom( true, false, 113.29, 159.29 )
																				stars2:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( stars2, event )
																				else
																					stars2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				stars2Frame17( stars2, event )
																				return 
																			else
																				stars2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				stars2:setLeftRight( true, false, 224.97, 270.97 )
																				stars2:setTopBottom( true, false, 69.38, 115.38 )
																				stars2:setAlpha( 1 )
																				stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			stars2Frame16( stars2, event )
																			return 
																		else
																			stars2:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
																			stars2:setLeftRight( true, false, 224.99, 270.99 )
																			stars2:setTopBottom( true, false, 67.29, 113.29 )
																			stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		stars2Frame15( stars2, event )
																		return 
																	else
																		stars2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		stars2:setAlpha( 0 )
																		stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame15 )
																	end
																end
																
																if event.interrupted then
																	stars2Frame14( stars2, event )
																	return 
																else
																	stars2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																	stars2:setLeftRight( true, false, 93.71, 139.71 )
																	stars2:setTopBottom( true, false, 110, 156 )
																	stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame14 )
																end
															end
															
															if event.interrupted then
																stars2Frame13( stars2, event )
																return 
															else
																stars2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																stars2:setAlpha( 1 )
																stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame13 )
															end
														end
														
														if event.interrupted then
															stars2Frame12( stars2, event )
															return 
														else
															stars2:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
															stars2:setLeftRight( true, false, 93, 139 )
															stars2:setTopBottom( true, false, 68, 114 )
															stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame12 )
														end
													end
													
													if event.interrupted then
														stars2Frame11( stars2, event )
														return 
													else
														stars2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														stars2:setAlpha( 0 )
														stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame11 )
													end
												end
												
												if event.interrupted then
													stars2Frame10( stars2, event )
													return 
												else
													stars2:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
													stars2:setLeftRight( true, false, 193.03, 239.03 )
													stars2:setTopBottom( true, false, 114, 160 )
													stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame10 )
												end
											end
											
											if event.interrupted then
												stars2Frame9( stars2, event )
												return 
											else
												stars2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												stars2:setTopBottom( true, false, 73.76, 119.76 )
												stars2:setAlpha( 1 )
												stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame9 )
											end
										end
										
										if event.interrupted then
											stars2Frame8( stars2, event )
											return 
										else
											stars2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											stars2:setTopBottom( true, false, 72.58, 118.58 )
											stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame8 )
										end
									end
									
									if event.interrupted then
										stars2Frame7( stars2, event )
										return 
									else
										stars2:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
										stars2:setLeftRight( true, false, 192.97, 238.97 )
										stars2:setTopBottom( true, false, 75.58, 121.58 )
										stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame7 )
									end
								end
								
								if event.interrupted then
									stars2Frame6( stars2, event )
									return 
								else
									stars2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									stars2:setLeftRight( true, false, 130.99, 176.99 )
									stars2:setTopBottom( true, false, 106.45, 152.45 )
									stars2:setAlpha( 0 )
									stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame6 )
								end
							end
							
							if event.interrupted then
								stars2Frame5( stars2, event )
								return 
							else
								stars2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								stars2:setLeftRight( true, false, 129.59, 175.59 )
								stars2:setTopBottom( true, false, 107.16, 153.16 )
								stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame5 )
							end
						end
						
						if event.interrupted then
							stars2Frame4( stars2, event )
							return 
						else
							stars2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							stars2:setAlpha( 1 )
							stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame4 )
						end
					end
					
					if event.interrupted then
						stars2Frame3( stars2, event )
						return 
					else
						stars2:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						stars2:registerEventHandler( "transition_complete_keyframe", stars2Frame3 )
					end
				end
				
				stars2:completeAnimation()
				self.stars2:setLeftRight( true, false, 128.1, 174.1 )
				self.stars2:setTopBottom( true, false, 68.86, 114.86 )
				self.stars2:setAlpha( 0 )
				stars2Frame2( stars2, {} )
				local f2_local5 = function ( f83_arg0, f83_arg1 )
					local f83_local0 = function ( f84_arg0, f84_arg1 )
						local f84_local0 = function ( f85_arg0, f85_arg1 )
							local f85_local0 = function ( f86_arg0, f86_arg1 )
								local f86_local0 = function ( f87_arg0, f87_arg1 )
									local f87_local0 = function ( f88_arg0, f88_arg1 )
										local f88_local0 = function ( f89_arg0, f89_arg1 )
											local f89_local0 = function ( f90_arg0, f90_arg1 )
												local f90_local0 = function ( f91_arg0, f91_arg1 )
													local f91_local0 = function ( f92_arg0, f92_arg1 )
														if not f92_arg1.interrupted then
															f92_arg0:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
														end
														f92_arg0:setAlpha( 0 )
														f92_arg0:setZRot( 0 )
														f92_arg0:setScale( 1 )
														if f92_arg1.interrupted then
															self.clipFinished( f92_arg0, f92_arg1 )
														else
															f92_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if f91_arg1.interrupted then
														f91_local0( f91_arg0, f91_arg1 )
														return 
													else
														f91_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														f91_arg0:setAlpha( 0 )
														f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
													end
												end
												
												if f90_arg1.interrupted then
													f90_local0( f90_arg0, f90_arg1 )
													return 
												else
													f90_arg0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
													f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
												end
											end
											
											if f89_arg1.interrupted then
												f89_local0( f89_arg0, f89_arg1 )
												return 
											else
												f89_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												f89_arg0:setAlpha( 1 )
												f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
											end
										end
										
										if f88_arg1.interrupted then
											f88_local0( f88_arg0, f88_arg1 )
											return 
										else
											f88_arg0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
											f88_arg0:registerEventHandler( "transition_complete_keyframe", f88_local0 )
										end
									end
									
									if f87_arg1.interrupted then
										f87_local0( f87_arg0, f87_arg1 )
										return 
									else
										f87_arg0:beginAnimation( "keyframe", 1160, false, false, CoD.TweenType.Linear )
										f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
									end
								end
								
								if f86_arg1.interrupted then
									f86_local0( f86_arg0, f86_arg1 )
									return 
								else
									f86_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
								end
							end
							
							if f85_arg1.interrupted then
								f85_local0( f85_arg0, f85_arg1 )
								return 
							else
								f85_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								f85_arg0:setAlpha( 0 )
								f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
							end
						end
						
						if f84_arg1.interrupted then
							f84_local0( f84_arg0, f84_arg1 )
							return 
						else
							f84_arg0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
						end
					end
					
					if f83_arg1.interrupted then
						f83_local0( f83_arg0, f83_arg1 )
						return 
					else
						f83_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f83_arg0:setAlpha( 1 )
						f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
					end
				end
				
				Boom1:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				Boom1:setAlpha( 0 )
				Boom1:setZRot( 0 )
				Boom1:setScale( 1 )
				Boom1:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local f2_local6 = function ( f93_arg0, f93_arg1 )
					local f93_local0 = function ( f94_arg0, f94_arg1 )
						local f94_local0 = function ( f95_arg0, f95_arg1 )
							local f95_local0 = function ( f96_arg0, f96_arg1 )
								local f96_local0 = function ( f97_arg0, f97_arg1 )
									local f97_local0 = function ( f98_arg0, f98_arg1 )
										local f98_local0 = function ( f99_arg0, f99_arg1 )
											local f99_local0 = function ( f100_arg0, f100_arg1 )
												local f100_local0 = function ( f101_arg0, f101_arg1 )
													local f101_local0 = function ( f102_arg0, f102_arg1 )
														if not f102_arg1.interrupted then
															f102_arg0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
														end
														f102_arg0:setAlpha( 0 )
														f102_arg0:setZRot( 0 )
														f102_arg0:setScale( 1 )
														if f102_arg1.interrupted then
															self.clipFinished( f102_arg0, f102_arg1 )
														else
															f102_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if f101_arg1.interrupted then
														f101_local0( f101_arg0, f101_arg1 )
														return 
													else
														f101_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														f101_arg0:setAlpha( 0 )
														f101_arg0:registerEventHandler( "transition_complete_keyframe", f101_local0 )
													end
												end
												
												if f100_arg1.interrupted then
													f100_local0( f100_arg0, f100_arg1 )
													return 
												else
													f100_arg0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
													f100_arg0:registerEventHandler( "transition_complete_keyframe", f100_local0 )
												end
											end
											
											if f99_arg1.interrupted then
												f99_local0( f99_arg0, f99_arg1 )
												return 
											else
												f99_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f99_arg0:setAlpha( 1 )
												f99_arg0:registerEventHandler( "transition_complete_keyframe", f99_local0 )
											end
										end
										
										if f98_arg1.interrupted then
											f98_local0( f98_arg0, f98_arg1 )
											return 
										else
											f98_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
											f98_arg0:registerEventHandler( "transition_complete_keyframe", f98_local0 )
										end
									end
									
									if f97_arg1.interrupted then
										f97_local0( f97_arg0, f97_arg1 )
										return 
									else
										f97_arg0:beginAnimation( "keyframe", 1160, false, false, CoD.TweenType.Linear )
										f97_arg0:registerEventHandler( "transition_complete_keyframe", f97_local0 )
									end
								end
								
								if f96_arg1.interrupted then
									f96_local0( f96_arg0, f96_arg1 )
									return 
								else
									f96_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
									f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
								end
							end
							
							if f95_arg1.interrupted then
								f95_local0( f95_arg0, f95_arg1 )
								return 
							else
								f95_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								f95_arg0:setAlpha( 0 )
								f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
							end
						end
						
						if f94_arg1.interrupted then
							f94_local0( f94_arg0, f94_arg1 )
							return 
						else
							f94_arg0:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
							f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
						end
					end
					
					if f93_arg1.interrupted then
						f93_local0( f93_arg0, f93_arg1 )
						return 
					else
						f93_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f93_arg0:setAlpha( 1 )
						f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
					end
				end
				
				Boom2:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
				Boom2:setAlpha( 0 )
				Boom2:setZRot( 0 )
				Boom2:setScale( 1 )
				Boom2:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local Boom3Frame2 = function ( Boom3, event )
					local Boom3Frame3 = function ( Boom3, event )
						local Boom3Frame4 = function ( Boom3, event )
							local Boom3Frame5 = function ( Boom3, event )
								local Boom3Frame6 = function ( Boom3, event )
									local Boom3Frame7 = function ( Boom3, event )
										local Boom3Frame8 = function ( Boom3, event )
											local Boom3Frame9 = function ( Boom3, event )
												local Boom3Frame10 = function ( Boom3, event )
													local Boom3Frame11 = function ( Boom3, event )
														if not event.interrupted then
															Boom3:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
														end
														Boom3:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Boom3, event )
														else
															Boom3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Boom3Frame11( Boom3, event )
														return 
													else
														Boom3:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
														Boom3:setAlpha( 0 )
														Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame11 )
													end
												end
												
												if event.interrupted then
													Boom3Frame10( Boom3, event )
													return 
												else
													Boom3:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
													Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame10 )
												end
											end
											
											if event.interrupted then
												Boom3Frame9( Boom3, event )
												return 
											else
												Boom3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												Boom3:setAlpha( 1 )
												Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame9 )
											end
										end
										
										if event.interrupted then
											Boom3Frame8( Boom3, event )
											return 
										else
											Boom3:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame8 )
										end
									end
									
									if event.interrupted then
										Boom3Frame7( Boom3, event )
										return 
									else
										Boom3:beginAnimation( "keyframe", 1160, false, false, CoD.TweenType.Linear )
										Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame7 )
									end
								end
								
								if event.interrupted then
									Boom3Frame6( Boom3, event )
									return 
								else
									Boom3:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
									Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame6 )
								end
							end
							
							if event.interrupted then
								Boom3Frame5( Boom3, event )
								return 
							else
								Boom3:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								Boom3:setAlpha( 0 )
								Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame5 )
							end
						end
						
						if event.interrupted then
							Boom3Frame4( Boom3, event )
							return 
						else
							Boom3:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame4 )
						end
					end
					
					if event.interrupted then
						Boom3Frame3( Boom3, event )
						return 
					else
						Boom3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Boom3:setAlpha( 1 )
						Boom3:registerEventHandler( "transition_complete_keyframe", Boom3Frame3 )
					end
				end
				
				Boom3:completeAnimation()
				self.Boom3:setAlpha( 0 )
				Boom3Frame2( Boom3, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

