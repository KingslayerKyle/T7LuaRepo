-- a81274d5831600a0f3477ad29dfe551f
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_ZM_Samantha = InheritFrom( LUI.UIElement )
CoD.CallingCards_ZM_Samantha.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_ZM_Samantha )
	self.id = "CallingCards_ZM_Samantha"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bgglow = LUI.UIImage.new()
	bgglow:setLeftRight( true, false, 228, 480 )
	bgglow:setTopBottom( true, false, 0, 120 )
	bgglow:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_bg_glow" ) )
	self:addElement( bgglow )
	self.bgglow = bgglow
	
	local house = LUI.UIImage.new()
	house:setLeftRight( true, false, 206, 362 )
	house:setTopBottom( true, false, 0, 168 )
	house:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_house" ) )
	self:addElement( house )
	self.house = house
	
	local houselit = LUI.UIImage.new()
	houselit:setLeftRight( true, false, 206, 362 )
	houselit:setTopBottom( true, false, 0, 168 )
	houselit:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_house_lit" ) )
	self:addElement( houselit )
	self.houselit = houselit
	
	local cloud = LUI.UIImage.new()
	cloud:setLeftRight( true, false, 0, 480 )
	cloud:setTopBottom( true, false, -20, 120 )
	cloud:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_cloud" ) )
	cloud:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	cloud:setShaderVector( 0, -1, 1, 0, 0 )
	cloud:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( cloud )
	self.cloud = cloud
	
	local debri2 = LUI.UIImage.new()
	debri2:setLeftRight( true, false, 348, 396 )
	debri2:setTopBottom( true, false, 63, 111 )
	debri2:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_rocks2" ) )
	self:addElement( debri2 )
	self.debri2 = debri2
	
	local elephant = LUI.UIImage.new()
	elephant:setLeftRight( true, false, 366, 426 )
	elephant:setTopBottom( true, false, 24, 96 )
	elephant:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_elephant" ) )
	self:addElement( elephant )
	self.elephant = elephant
	
	local bunny = LUI.UIImage.new()
	bunny:setLeftRight( true, false, 310, 454 )
	bunny:setTopBottom( true, false, 120, 312 )
	bunny:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_bunny" ) )
	self:addElement( bunny )
	self.bunny = bunny
	
	local chair = LUI.UIImage.new()
	chair:setLeftRight( true, false, 182, 230 )
	chair:setTopBottom( true, false, 120, 168 )
	chair:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_chair" ) )
	self:addElement( chair )
	self.chair = chair
	
	local monkey = LUI.UIImage.new()
	monkey:setLeftRight( true, false, 94, 154 )
	monkey:setTopBottom( true, false, 24, 108 )
	monkey:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_monkey" ) )
	self:addElement( monkey )
	self.monkey = monkey
	
	local debri1 = LUI.UIImage.new()
	debri1:setLeftRight( true, false, 22, 70 )
	debri1:setTopBottom( true, false, 36, 84 )
	debri1:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_rocks1" ) )
	self:addElement( debri1 )
	self.debri1 = debri1
	
	local debri3 = LUI.UIImage.new()
	debri3:setLeftRight( true, false, 162, 210 )
	debri3:setTopBottom( true, false, 42, 90 )
	debri3:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_rocks3" ) )
	self:addElement( debri3 )
	self.debri3 = debri3
	
	local stars = LUI.UIImage.new()
	stars:setLeftRight( true, false, 421, 481 )
	stars:setTopBottom( true, false, 7, 43 )
	stars:setImage( RegisterImage( "uie_t7_callingcard_zm_samantha_stars" ) )
	self:addElement( stars )
	self.stars = stars
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				local bgFrame2 = function ( bg, event )
					if not event.interrupted then
						bg:beginAnimation( "keyframe", 7960, false, false, CoD.TweenType.Linear )
					end
					bg:setAlpha( 1 )
					bg:setScale( 1 )
					if event.interrupted then
						self.clipFinished( bg, event )
					else
						bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.bg:setScale( 1 )
				bgFrame2( bg, {} )
				local bgglowFrame2 = function ( bgglow, event )
					local bgglowFrame3 = function ( bgglow, event )
						local bgglowFrame4 = function ( bgglow, event )
							local bgglowFrame5 = function ( bgglow, event )
								if not event.interrupted then
									bgglow:beginAnimation( "keyframe", 1940, false, false, CoD.TweenType.Linear )
								end
								bgglow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( bgglow, event )
								else
									bgglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								bgglowFrame5( bgglow, event )
								return 
							else
								bgglow:beginAnimation( "keyframe", 2019, false, false, CoD.TweenType.Linear )
								bgglow:setAlpha( 1 )
								bgglow:registerEventHandler( "transition_complete_keyframe", bgglowFrame5 )
							end
						end
						
						if event.interrupted then
							bgglowFrame4( bgglow, event )
							return 
						else
							bgglow:beginAnimation( "keyframe", 1990, false, false, CoD.TweenType.Linear )
							bgglow:setAlpha( 0 )
							bgglow:registerEventHandler( "transition_complete_keyframe", bgglowFrame4 )
						end
					end
					
					if event.interrupted then
						bgglowFrame3( bgglow, event )
						return 
					else
						bgglow:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
						bgglow:setAlpha( 1 )
						bgglow:registerEventHandler( "transition_complete_keyframe", bgglowFrame3 )
					end
				end
				
				bgglow:completeAnimation()
				self.bgglow:setAlpha( 0 )
				bgglowFrame2( bgglow, {} )
				local houseFrame2 = function ( house, event )
					local houseFrame3 = function ( house, event )
						local houseFrame4 = function ( house, event )
							local houseFrame5 = function ( house, event )
								local houseFrame6 = function ( house, event )
									local houseFrame7 = function ( house, event )
										local houseFrame8 = function ( house, event )
											local houseFrame9 = function ( house, event )
												if not event.interrupted then
													house:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
												end
												house:setLeftRight( true, false, 206, 362 )
												house:setTopBottom( true, false, 0, 168 )
												house:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( house, event )
												else
													house:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												houseFrame9( house, event )
												return 
											else
												house:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
												house:setTopBottom( true, false, 5, 173 )
												house:registerEventHandler( "transition_complete_keyframe", houseFrame9 )
											end
										end
										
										if event.interrupted then
											houseFrame8( house, event )
											return 
										else
											house:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
											house:setTopBottom( true, false, 0, 168 )
											house:registerEventHandler( "transition_complete_keyframe", houseFrame8 )
										end
									end
									
									if event.interrupted then
										houseFrame7( house, event )
										return 
									else
										house:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
										house:setTopBottom( true, false, -5, 163 )
										house:registerEventHandler( "transition_complete_keyframe", houseFrame7 )
									end
								end
								
								if event.interrupted then
									houseFrame6( house, event )
									return 
								else
									house:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
									house:setTopBottom( true, false, 0, 168 )
									house:registerEventHandler( "transition_complete_keyframe", houseFrame6 )
								end
							end
							
							if event.interrupted then
								houseFrame5( house, event )
								return 
							else
								house:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
								house:setTopBottom( true, false, 5, 173 )
								house:registerEventHandler( "transition_complete_keyframe", houseFrame5 )
							end
						end
						
						if event.interrupted then
							houseFrame4( house, event )
							return 
						else
							house:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							house:setTopBottom( true, false, 0, 168 )
							house:registerEventHandler( "transition_complete_keyframe", houseFrame4 )
						end
					end
					
					if event.interrupted then
						houseFrame3( house, event )
						return 
					else
						house:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						house:setTopBottom( true, false, -5, 163 )
						house:registerEventHandler( "transition_complete_keyframe", houseFrame3 )
					end
				end
				
				house:completeAnimation()
				self.house:setLeftRight( true, false, 206, 362 )
				self.house:setTopBottom( true, false, 0, 168 )
				self.house:setAlpha( 1 )
				houseFrame2( house, {} )
				local houselitFrame2 = function ( houselit, event )
					local houselitFrame3 = function ( houselit, event )
						local houselitFrame4 = function ( houselit, event )
							local houselitFrame5 = function ( houselit, event )
								local houselitFrame6 = function ( houselit, event )
									local houselitFrame7 = function ( houselit, event )
										local houselitFrame8 = function ( houselit, event )
											local houselitFrame9 = function ( houselit, event )
												local houselitFrame10 = function ( houselit, event )
													local houselitFrame11 = function ( houselit, event )
														local houselitFrame12 = function ( houselit, event )
															local houselitFrame13 = function ( houselit, event )
																local houselitFrame14 = function ( houselit, event )
																	local houselitFrame15 = function ( houselit, event )
																		local houselitFrame16 = function ( houselit, event )
																			local houselitFrame17 = function ( houselit, event )
																				local houselitFrame18 = function ( houselit, event )
																					local houselitFrame19 = function ( houselit, event )
																						local houselitFrame20 = function ( houselit, event )
																							local houselitFrame21 = function ( houselit, event )
																								local houselitFrame22 = function ( houselit, event )
																									local houselitFrame23 = function ( houselit, event )
																										local houselitFrame24 = function ( houselit, event )
																											local houselitFrame25 = function ( houselit, event )
																												local houselitFrame26 = function ( houselit, event )
																													local houselitFrame27 = function ( houselit, event )
																														local houselitFrame28 = function ( houselit, event )
																															local houselitFrame29 = function ( houselit, event )
																																local houselitFrame30 = function ( houselit, event )
																																	local houselitFrame31 = function ( houselit, event )
																																		local houselitFrame32 = function ( houselit, event )
																																			local houselitFrame33 = function ( houselit, event )
																																				local houselitFrame34 = function ( houselit, event )
																																					local houselitFrame35 = function ( houselit, event )
																																						local houselitFrame36 = function ( houselit, event )
																																							local houselitFrame37 = function ( houselit, event )
																																								local houselitFrame38 = function ( houselit, event )
																																									local houselitFrame39 = function ( houselit, event )
																																										local houselitFrame40 = function ( houselit, event )
																																											local houselitFrame41 = function ( houselit, event )
																																												local houselitFrame42 = function ( houselit, event )
																																													local houselitFrame43 = function ( houselit, event )
																																														if not event.interrupted then
																																															houselit:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
																																														end
																																														houselit:setLeftRight( true, false, 206, 362 )
																																														houselit:setTopBottom( true, false, 0, 168 )
																																														houselit:setAlpha( 1 )
																																														if event.interrupted then
																																															self.clipFinished( houselit, event )
																																														else
																																															houselit:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														houselitFrame43( houselit, event )
																																														return 
																																													else
																																														houselit:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																																														houselit:setTopBottom( true, false, 1.63, 169.63 )
																																														houselit:setAlpha( 1 )
																																														houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													houselitFrame42( houselit, event )
																																													return 
																																												else
																																													houselit:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																													houselit:setTopBottom( true, false, 2.04, 170.04 )
																																													houselit:setAlpha( 0 )
																																													houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												houselitFrame41( houselit, event )
																																												return 
																																											else
																																												houselit:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
																																												houselit:setTopBottom( true, false, 2.35, 170.35 )
																																												houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											houselitFrame40( houselit, event )
																																											return 
																																										else
																																											houselit:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
																																											houselit:setTopBottom( true, false, 5, 173 )
																																											houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										houselitFrame39( houselit, event )
																																										return 
																																									else
																																										houselit:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																										houselit:setTopBottom( true, false, 1.35, 169.35 )
																																										houselit:setAlpha( 1 )
																																										houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									houselitFrame38( houselit, event )
																																									return 
																																								else
																																									houselit:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																									houselit:setTopBottom( true, false, 1.1, 169.1 )
																																									houselit:setAlpha( 0.2 )
																																									houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								houselitFrame37( houselit, event )
																																								return 
																																							else
																																								houselit:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																																								houselit:setTopBottom( true, false, 0.85, 168.85 )
																																								houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							houselitFrame36( houselit, event )
																																							return 
																																						else
																																							houselit:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																							houselit:setTopBottom( true, false, 0.05, 168.05 )
																																							houselit:setAlpha( 1 )
																																							houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						houselitFrame35( houselit, event )
																																						return 
																																					else
																																						houselit:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																						houselit:setTopBottom( true, false, 0, 168 )
																																						houselit:setAlpha( 0.8 )
																																						houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					houselitFrame34( houselit, event )
																																					return 
																																				else
																																					houselit:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																					houselit:setTopBottom( true, false, -0.15, 167.85 )
																																					houselit:setAlpha( 0.2 )
																																					houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				houselitFrame33( houselit, event )
																																				return 
																																			else
																																				houselit:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
																																				houselit:setTopBottom( true, false, -0.35, 167.65 )
																																				houselit:setAlpha( 1 )
																																				houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			houselitFrame32( houselit, event )
																																			return 
																																		else
																																			houselit:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																																			houselit:setTopBottom( true, false, -2.55, 165.45 )
																																			houselit:setAlpha( 0.2 )
																																			houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		houselitFrame31( houselit, event )
																																		return 
																																	else
																																		houselit:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																		houselit:setTopBottom( true, false, -3.05, 164.95 )
																																		houselit:setAlpha( 1 )
																																		houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	houselitFrame30( houselit, event )
																																	return 
																																else
																																	houselit:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																	houselit:setTopBottom( true, false, -3.25, 164.75 )
																																	houselit:setAlpha( 0.7 )
																																	houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																houselitFrame29( houselit, event )
																																return 
																															else
																																houselit:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
																																houselit:setTopBottom( true, false, -3.5, 164.5 )
																																houselit:setAlpha( 1 )
																																houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															houselitFrame28( houselit, event )
																															return 
																														else
																															houselit:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
																															houselit:setTopBottom( true, false, -5, 163 )
																															houselit:setAlpha( 0.8 )
																															houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														houselitFrame27( houselit, event )
																														return 
																													else
																														houselit:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																														houselit:setTopBottom( true, false, -2.8, 165.2 )
																														houselit:setAlpha( 0.5 )
																														houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													houselitFrame26( houselit, event )
																													return 
																												else
																													houselit:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																													houselit:setTopBottom( true, false, -2.2, 165.8 )
																													houselit:setAlpha( 0.61 )
																													houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												houselitFrame25( houselit, event )
																												return 
																											else
																												houselit:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																												houselit:setTopBottom( true, false, -1.85, 166.15 )
																												houselit:setAlpha( 0.2 )
																												houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											houselitFrame24( houselit, event )
																											return 
																										else
																											houselit:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
																											houselit:setTopBottom( true, false, -1.55, 166.45 )
																											houselit:setAlpha( 0.72 )
																											houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										houselitFrame23( houselit, event )
																										return 
																									else
																										houselit:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
																										houselit:setTopBottom( true, false, 0, 168 )
																										houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									houselitFrame22( houselit, event )
																									return 
																								else
																									houselit:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																									houselit:setTopBottom( true, false, 1.63, 169.63 )
																									houselit:setAlpha( 1 )
																									houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								houselitFrame21( houselit, event )
																								return 
																							else
																								houselit:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																								houselit:setTopBottom( true, false, 2.04, 170.04 )
																								houselit:setAlpha( 0 )
																								houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							houselitFrame20( houselit, event )
																							return 
																						else
																							houselit:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
																							houselit:setTopBottom( true, false, 2.35, 170.35 )
																							houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						houselitFrame19( houselit, event )
																						return 
																					else
																						houselit:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
																						houselit:setTopBottom( true, false, 5, 173 )
																						houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					houselitFrame18( houselit, event )
																					return 
																				else
																					houselit:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																					houselit:setTopBottom( true, false, 1.35, 169.35 )
																					houselit:setAlpha( 1 )
																					houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				houselitFrame17( houselit, event )
																				return 
																			else
																				houselit:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																				houselit:setTopBottom( true, false, 1.1, 169.1 )
																				houselit:setAlpha( 0.2 )
																				houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			houselitFrame16( houselit, event )
																			return 
																		else
																			houselit:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																			houselit:setTopBottom( true, false, 0.85, 168.85 )
																			houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		houselitFrame15( houselit, event )
																		return 
																	else
																		houselit:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		houselit:setTopBottom( true, false, 0.05, 168.05 )
																		houselit:setAlpha( 1 )
																		houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame15 )
																	end
																end
																
																if event.interrupted then
																	houselitFrame14( houselit, event )
																	return 
																else
																	houselit:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	houselit:setTopBottom( true, false, 0, 168 )
																	houselit:setAlpha( 0.8 )
																	houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame14 )
																end
															end
															
															if event.interrupted then
																houselitFrame13( houselit, event )
																return 
															else
																houselit:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																houselit:setTopBottom( true, false, -0.15, 167.85 )
																houselit:setAlpha( 0.2 )
																houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame13 )
															end
														end
														
														if event.interrupted then
															houselitFrame12( houselit, event )
															return 
														else
															houselit:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
															houselit:setTopBottom( true, false, -0.35, 167.65 )
															houselit:setAlpha( 1 )
															houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame12 )
														end
													end
													
													if event.interrupted then
														houselitFrame11( houselit, event )
														return 
													else
														houselit:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
														houselit:setTopBottom( true, false, -2.55, 165.45 )
														houselit:setAlpha( 0.2 )
														houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame11 )
													end
												end
												
												if event.interrupted then
													houselitFrame10( houselit, event )
													return 
												else
													houselit:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
													houselit:setTopBottom( true, false, -3.05, 164.95 )
													houselit:setAlpha( 1 )
													houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame10 )
												end
											end
											
											if event.interrupted then
												houselitFrame9( houselit, event )
												return 
											else
												houselit:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												houselit:setTopBottom( true, false, -3.25, 164.75 )
												houselit:setAlpha( 0.7 )
												houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame9 )
											end
										end
										
										if event.interrupted then
											houselitFrame8( houselit, event )
											return 
										else
											houselit:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
											houselit:setTopBottom( true, false, -3.5, 164.5 )
											houselit:setAlpha( 1 )
											houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame8 )
										end
									end
									
									if event.interrupted then
										houselitFrame7( houselit, event )
										return 
									else
										houselit:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
										houselit:setTopBottom( true, false, -5, 163 )
										houselit:setAlpha( 0.8 )
										houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame7 )
									end
								end
								
								if event.interrupted then
									houselitFrame6( houselit, event )
									return 
								else
									houselit:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									houselit:setTopBottom( true, false, -2.8, 165.2 )
									houselit:setAlpha( 0.5 )
									houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame6 )
								end
							end
							
							if event.interrupted then
								houselitFrame5( houselit, event )
								return 
							else
								houselit:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								houselit:setTopBottom( true, false, -2.2, 165.8 )
								houselit:setAlpha( 0.61 )
								houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame5 )
							end
						end
						
						if event.interrupted then
							houselitFrame4( houselit, event )
							return 
						else
							houselit:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							houselit:setTopBottom( true, false, -1.85, 166.15 )
							houselit:setAlpha( 0.2 )
							houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame4 )
						end
					end
					
					if event.interrupted then
						houselitFrame3( houselit, event )
						return 
					else
						houselit:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						houselit:setTopBottom( true, false, -1.55, 166.45 )
						houselit:setAlpha( 0.72 )
						houselit:registerEventHandler( "transition_complete_keyframe", houselitFrame3 )
					end
				end
				
				houselit:completeAnimation()
				self.houselit:setLeftRight( true, false, 206, 362 )
				self.houselit:setTopBottom( true, false, 0, 168 )
				self.houselit:setAlpha( 1 )
				houselitFrame2( houselit, {} )

				cloud:completeAnimation()
				self.cloud:setAlpha( 1 )
				self.cloud:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
				self.cloud:setShaderVector( 0, -1, 1, 0, 0 )
				self.cloud:setShaderVector( 1, 0.03, 0, 0, 0 )
				self.clipFinished( cloud, {} )
				local debri2Frame2 = function ( debri2, event )
					local debri2Frame3 = function ( debri2, event )
						if not event.interrupted then
							debri2:beginAnimation( "keyframe", 3940, false, false, CoD.TweenType.Linear )
						end
						debri2:setLeftRight( true, false, 382, 430 )
						debri2:setTopBottom( true, false, 50, 98 )
						debri2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( debri2, event )
						else
							debri2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						debri2Frame3( debri2, event )
						return 
					else
						debri2:beginAnimation( "keyframe", 4019, false, false, CoD.TweenType.Linear )
						debri2:setTopBottom( true, false, 29.75, 77.75 )
						debri2:registerEventHandler( "transition_complete_keyframe", debri2Frame3 )
					end
				end
				
				debri2:completeAnimation()
				self.debri2:setLeftRight( true, false, 382, 430 )
				self.debri2:setTopBottom( true, false, 50, 98 )
				self.debri2:setAlpha( 1 )
				debri2Frame2( debri2, {} )
				local elephantFrame2 = function ( elephant, event )
					if not event.interrupted then
						elephant:beginAnimation( "keyframe", 7960, true, false, CoD.TweenType.Linear )
					end
					elephant:setLeftRight( true, false, 210, 270 )
					elephant:setTopBottom( true, false, 127, 199 )
					elephant:setAlpha( 1 )
					elephant:setZRot( 342 )
					elephant:setScale( 0.5 )
					if event.interrupted then
						self.clipFinished( elephant, event )
					else
						elephant:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				elephant:completeAnimation()
				self.elephant:setLeftRight( true, false, 396, 476.83 )
				self.elephant:setTopBottom( true, false, -90, 7 )
				self.elephant:setAlpha( 1 )
				self.elephant:setZRot( 0 )
				self.elephant:setScale( 1 )
				elephantFrame2( elephant, {} )
				local bunnyFrame2 = function ( bunny, event )
					local bunnyFrame3 = function ( bunny, event )
						if not event.interrupted then
							bunny:beginAnimation( "keyframe", 4000, false, false, CoD.TweenType.Linear )
						end
						bunny:setLeftRight( true, false, 451, 595 )
						bunny:setTopBottom( true, false, -68, 124 )
						bunny:setAlpha( 1 )
						bunny:setZRot( 55 )
						bunny:setScale( 1.1 )
						if event.interrupted then
							self.clipFinished( bunny, event )
						else
							bunny:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bunnyFrame3( bunny, event )
						return 
					else
						bunny:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						bunny:registerEventHandler( "transition_complete_keyframe", bunnyFrame3 )
					end
				end
				
				bunny:completeAnimation()
				self.bunny:setLeftRight( true, false, 282, 426 )
				self.bunny:setTopBottom( true, false, 85, 277 )
				self.bunny:setAlpha( 1 )
				self.bunny:setZRot( -13 )
				self.bunny:setScale( 0.7 )
				bunnyFrame2( bunny, {} )
				local chairFrame2 = function ( chair, event )
					if not event.interrupted then
						chair:beginAnimation( "keyframe", 7960, false, true, CoD.TweenType.Linear )
					end
					chair:setLeftRight( true, false, 22, 70 )
					chair:setTopBottom( true, false, -48, 0 )
					chair:setAlpha( 1 )
					chair:setZRot( 233 )
					chair:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( chair, event )
					else
						chair:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chair:completeAnimation()
				self.chair:setLeftRight( true, false, 182, 230 )
				self.chair:setTopBottom( true, false, 110, 158 )
				self.chair:setAlpha( 1 )
				self.chair:setZRot( 0 )
				self.chair:setScale( 0.7 )
				chairFrame2( chair, {} )
				local monkeyFrame2 = function ( monkey, event )
					local monkeyFrame3 = function ( monkey, event )
						local monkeyFrame4 = function ( monkey, event )
							local monkeyFrame5 = function ( monkey, event )
								if not event.interrupted then
									monkey:beginAnimation( "keyframe", 1949, false, false, CoD.TweenType.Linear )
								end
								monkey:setLeftRight( true, false, 94, 154 )
								monkey:setTopBottom( true, false, 26, 110 )
								monkey:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( monkey, event )
								else
									monkey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								monkeyFrame5( monkey, event )
								return 
							else
								monkey:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
								monkey:setTopBottom( true, false, 40, 124 )
								monkey:registerEventHandler( "transition_complete_keyframe", monkeyFrame5 )
							end
						end
						
						if event.interrupted then
							monkeyFrame4( monkey, event )
							return 
						else
							monkey:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
							monkey:setTopBottom( true, false, 26, 110 )
							monkey:registerEventHandler( "transition_complete_keyframe", monkeyFrame4 )
						end
					end
					
					if event.interrupted then
						monkeyFrame3( monkey, event )
						return 
					else
						monkey:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
						monkey:setTopBottom( true, false, 15, 99 )
						monkey:registerEventHandler( "transition_complete_keyframe", monkeyFrame3 )
					end
				end
				
				monkey:completeAnimation()
				self.monkey:setLeftRight( true, false, 94, 154 )
				self.monkey:setTopBottom( true, false, 26, 110 )
				self.monkey:setAlpha( 1 )
				monkeyFrame2( monkey, {} )
				local debri1Frame2 = function ( debri1, event )
					local debri1Frame3 = function ( debri1, event )
						if not event.interrupted then
							debri1:beginAnimation( "keyframe", 3949, false, true, CoD.TweenType.Linear )
						end
						debri1:setLeftRight( true, false, 22, 70 )
						debri1:setTopBottom( true, false, 26, 74 )
						debri1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( debri1, event )
						else
							debri1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						debri1Frame3( debri1, event )
						return 
					else
						debri1:beginAnimation( "keyframe", 4010, true, false, CoD.TweenType.Linear )
						debri1:setTopBottom( true, false, 50, 98 )
						debri1:registerEventHandler( "transition_complete_keyframe", debri1Frame3 )
					end
				end
				
				debri1:completeAnimation()
				self.debri1:setLeftRight( true, false, 22, 70 )
				self.debri1:setTopBottom( true, false, 26, 74 )
				self.debri1:setAlpha( 1 )
				debri1Frame2( debri1, {} )
				local debri3Frame2 = function ( debri3, event )
					local debri3Frame3 = function ( debri3, event )
						if not event.interrupted then
							debri3:beginAnimation( "keyframe", 3949, false, false, CoD.TweenType.Linear )
						end
						debri3:setLeftRight( true, false, 162, 210 )
						debri3:setTopBottom( true, false, 52, 100 )
						debri3:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( debri3, event )
						else
							debri3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						debri3Frame3( debri3, event )
						return 
					else
						debri3:beginAnimation( "keyframe", 4010, false, false, CoD.TweenType.Linear )
						debri3:setTopBottom( true, false, 33, 81 )
						debri3:registerEventHandler( "transition_complete_keyframe", debri3Frame3 )
					end
				end
				
				debri3:completeAnimation()
				self.debri3:setLeftRight( true, false, 162, 210 )
				self.debri3:setTopBottom( true, false, 52, 100 )
				self.debri3:setAlpha( 1 )
				debri3Frame2( debri3, {} )
				local f2_local11 = function ( f72_arg0, f72_arg1 )
					local f72_local0 = function ( f73_arg0, f73_arg1 )
						local f73_local0 = function ( f74_arg0, f74_arg1 )
							local f74_local0 = function ( f75_arg0, f75_arg1 )
								if not f75_arg1.interrupted then
									f75_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								end
								f75_arg0:setAlpha( 0 )
								if f75_arg1.interrupted then
									self.clipFinished( f75_arg0, f75_arg1 )
								else
									f75_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f74_arg1.interrupted then
								f74_local0( f74_arg0, f74_arg1 )
								return 
							else
								f74_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								f74_arg0:setAlpha( 1 )
								f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
							end
						end
						
						if f73_arg1.interrupted then
							f73_local0( f73_arg0, f73_arg1 )
							return 
						else
							f73_arg0:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
							f73_arg0:setAlpha( 0 )
							f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
						end
					end
					
					if f72_arg1.interrupted then
						f72_local0( f72_arg0, f72_arg1 )
						return 
					else
						f72_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						f72_arg0:setAlpha( 1 )
						f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
					end
				end
				
				stars:beginAnimation( "keyframe", 5099, false, false, CoD.TweenType.Linear )
				stars:setAlpha( 0 )
				stars:registerEventHandler( "transition_complete_keyframe", f2_local11 )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

