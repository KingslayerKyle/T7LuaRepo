-- b4c7f316a7cc6bf6518c02d23e5cf2b2
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_GlowLoopFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_GlowLoopFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_GlowLoopFactory )
	self.id = "ZmAmmo_GlowLoopFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 60 )
	
	local GlowAnim = LUI.UIImage.new()
	GlowAnim:setLeftRight( true, false, 0, 60 )
	GlowAnim:setTopBottom( true, false, 0, 60 )
	GlowAnim:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_dpadbaseglowanim" ) )
	self:addElement( GlowAnim )
	self.GlowAnim = GlowAnim
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local GlowAnimFrame2 = function ( GlowAnim, event )
					local GlowAnimFrame3 = function ( GlowAnim, event )
						local GlowAnimFrame4 = function ( GlowAnim, event )
							local GlowAnimFrame5 = function ( GlowAnim, event )
								local GlowAnimFrame6 = function ( GlowAnim, event )
									local GlowAnimFrame7 = function ( GlowAnim, event )
										local GlowAnimFrame8 = function ( GlowAnim, event )
											local GlowAnimFrame9 = function ( GlowAnim, event )
												local GlowAnimFrame10 = function ( GlowAnim, event )
													local GlowAnimFrame11 = function ( GlowAnim, event )
														local GlowAnimFrame12 = function ( GlowAnim, event )
															local GlowAnimFrame13 = function ( GlowAnim, event )
																local GlowAnimFrame14 = function ( GlowAnim, event )
																	local GlowAnimFrame15 = function ( GlowAnim, event )
																		local GlowAnimFrame16 = function ( GlowAnim, event )
																			local GlowAnimFrame17 = function ( GlowAnim, event )
																				local GlowAnimFrame18 = function ( GlowAnim, event )
																					local GlowAnimFrame19 = function ( GlowAnim, event )
																						local GlowAnimFrame20 = function ( GlowAnim, event )
																							local GlowAnimFrame21 = function ( GlowAnim, event )
																								local GlowAnimFrame22 = function ( GlowAnim, event )
																									local GlowAnimFrame23 = function ( GlowAnim, event )
																										local GlowAnimFrame24 = function ( GlowAnim, event )
																											local GlowAnimFrame25 = function ( GlowAnim, event )
																												local GlowAnimFrame26 = function ( GlowAnim, event )
																													local GlowAnimFrame27 = function ( GlowAnim, event )
																														local GlowAnimFrame28 = function ( GlowAnim, event )
																															local GlowAnimFrame29 = function ( GlowAnim, event )
																																local GlowAnimFrame30 = function ( GlowAnim, event )
																																	local GlowAnimFrame31 = function ( GlowAnim, event )
																																		local GlowAnimFrame32 = function ( GlowAnim, event )
																																			local GlowAnimFrame33 = function ( GlowAnim, event )
																																				local GlowAnimFrame34 = function ( GlowAnim, event )
																																					local GlowAnimFrame35 = function ( GlowAnim, event )
																																						local GlowAnimFrame36 = function ( GlowAnim, event )
																																							local GlowAnimFrame37 = function ( GlowAnim, event )
																																								local GlowAnimFrame38 = function ( GlowAnim, event )
																																									local GlowAnimFrame39 = function ( GlowAnim, event )
																																										local GlowAnimFrame40 = function ( GlowAnim, event )
																																											local GlowAnimFrame41 = function ( GlowAnim, event )
																																												local GlowAnimFrame42 = function ( GlowAnim, event )
																																													local GlowAnimFrame43 = function ( GlowAnim, event )
																																														local GlowAnimFrame44 = function ( GlowAnim, event )
																																															local GlowAnimFrame45 = function ( GlowAnim, event )
																																																local GlowAnimFrame46 = function ( GlowAnim, event )
																																																	local GlowAnimFrame47 = function ( GlowAnim, event )
																																																		local GlowAnimFrame48 = function ( GlowAnim, event )
																																																			local GlowAnimFrame49 = function ( GlowAnim, event )
																																																				if not event.interrupted then
																																																					GlowAnim:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
																																																				end
																																																				GlowAnim:setLeftRight( true, false, 0, 60 )
																																																				GlowAnim:setTopBottom( true, false, -33, 27 )
																																																				GlowAnim:setAlpha( 0 )
																																																				if event.interrupted then
																																																					self.clipFinished( GlowAnim, event )
																																																				else
																																																					GlowAnim:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				GlowAnimFrame49( GlowAnim, event )
																																																				return 
																																																			else
																																																				GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																																				GlowAnim:setTopBottom( true, false, -33, 27 )
																																																				GlowAnim:setAlpha( 0 )
																																																				GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			GlowAnimFrame48( GlowAnim, event )
																																																			return 
																																																		else
																																																			GlowAnim:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																																			GlowAnim:setTopBottom( true, false, -32.01, 27.99 )
																																																			GlowAnim:setAlpha( 0.06 )
																																																			GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		GlowAnimFrame47( GlowAnim, event )
																																																		return 
																																																	else
																																																		GlowAnim:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																																																		GlowAnim:setTopBottom( true, false, -31.02, 28.98 )
																																																		GlowAnim:setAlpha( 0.12 )
																																																		GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	GlowAnimFrame46( GlowAnim, event )
																																																	return 
																																																else
																																																	GlowAnim:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																																																	GlowAnim:setTopBottom( true, false, -29.92, 30.08 )
																																																	GlowAnim:setAlpha( 0.18 )
																																																	GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																GlowAnimFrame45( GlowAnim, event )
																																																return 
																																															else
																																																GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																																GlowAnim:setTopBottom( true, false, -28.82, 31.18 )
																																																GlowAnim:setAlpha( 0.25 )
																																																GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															GlowAnimFrame44( GlowAnim, event )
																																															return 
																																														else
																																															GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																															GlowAnim:setTopBottom( true, false, -28.38, 31.62 )
																																															GlowAnim:setAlpha( 0.1 )
																																															GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														GlowAnimFrame43( GlowAnim, event )
																																														return 
																																													else
																																														GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																														GlowAnim:setTopBottom( true, false, -27.83, 32.17 )
																																														GlowAnim:setAlpha( 0.31 )
																																														GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													GlowAnimFrame42( GlowAnim, event )
																																													return 
																																												else
																																													GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																													GlowAnim:setTopBottom( true, false, -26.84, 33.16 )
																																													GlowAnim:setAlpha( 0.37 )
																																													GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												GlowAnimFrame41( GlowAnim, event )
																																												return 
																																											else
																																												GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																												GlowAnim:setTopBottom( true, false, -26.29, 33.71 )
																																												GlowAnim:setAlpha( 1 )
																																												GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											GlowAnimFrame40( GlowAnim, event )
																																											return 
																																										else
																																											GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																											GlowAnim:setTopBottom( true, false, -25.74, 34.26 )
																																											GlowAnim:setAlpha( 0.44 )
																																											GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										GlowAnimFrame39( GlowAnim, event )
																																										return 
																																									else
																																										GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																										GlowAnim:setTopBottom( true, false, -25.19, 34.81 )
																																										GlowAnim:setAlpha( 0.8 )
																																										GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									GlowAnimFrame38( GlowAnim, event )
																																									return 
																																								else
																																									GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																									GlowAnim:setTopBottom( true, false, -24.75, 35.25 )
																																									GlowAnim:setAlpha( 0.5 )
																																									GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								GlowAnimFrame37( GlowAnim, event )
																																								return 
																																							else
																																								GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																								GlowAnim:setTopBottom( true, false, -23.76, 36.24 )
																																								GlowAnim:setAlpha( 0.56 )
																																								GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							GlowAnimFrame36( GlowAnim, event )
																																							return 
																																						else
																																							GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																							GlowAnim:setTopBottom( true, false, -23.21, 36.79 )
																																							GlowAnim:setAlpha( 0.2 )
																																							GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						GlowAnimFrame35( GlowAnim, event )
																																						return 
																																					else
																																						GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																						GlowAnim:setTopBottom( true, false, -22.66, 37.34 )
																																						GlowAnim:setAlpha( 0.63 )
																																						GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					GlowAnimFrame34( GlowAnim, event )
																																					return 
																																				else
																																					GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																					GlowAnim:setTopBottom( true, false, -21.67, 38.33 )
																																					GlowAnim:setAlpha( 0.69 )
																																					GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				GlowAnimFrame33( GlowAnim, event )
																																				return 
																																			else
																																				GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																				GlowAnim:setTopBottom( true, false, -21.12, 38.88 )
																																				GlowAnim:setAlpha( 0.5 )
																																				GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			GlowAnimFrame32( GlowAnim, event )
																																			return 
																																		else
																																			GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																			GlowAnim:setTopBottom( true, false, -20.57, 39.43 )
																																			GlowAnim:setAlpha( 0.75 )
																																			GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		GlowAnimFrame31( GlowAnim, event )
																																		return 
																																	else
																																		GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																		GlowAnim:setTopBottom( true, false, -20.13, 39.87 )
																																		GlowAnim:setAlpha( 0.4 )
																																		GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	GlowAnimFrame30( GlowAnim, event )
																																	return 
																																else
																																	GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																	GlowAnim:setTopBottom( true, false, -19.58, 40.42 )
																																	GlowAnim:setAlpha( 0.81 )
																																	GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																GlowAnimFrame29( GlowAnim, event )
																																return 
																															else
																																GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																GlowAnim:setTopBottom( true, false, -19.03, 40.97 )
																																GlowAnim:setAlpha( 0.6 )
																																GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															GlowAnimFrame28( GlowAnim, event )
																															return 
																														else
																															GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																															GlowAnim:setTopBottom( true, false, -18.48, 41.52 )
																															GlowAnim:setAlpha( 0.88 )
																															GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														GlowAnimFrame27( GlowAnim, event )
																														return 
																													else
																														GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																														GlowAnim:setTopBottom( true, false, -18.04, 41.96 )
																														GlowAnim:setAlpha( 0.7 )
																														GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													GlowAnimFrame26( GlowAnim, event )
																													return 
																												else
																													GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																													GlowAnim:setTopBottom( true, false, -17.6, 42.4 )
																													GlowAnim:setAlpha( 0.93 )
																													GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												GlowAnimFrame25( GlowAnim, event )
																												return 
																											else
																												GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																												GlowAnim:setTopBottom( true, false, -17.05, 42.95 )
																												GlowAnim:setAlpha( 0.6 )
																												GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											GlowAnimFrame24( GlowAnim, event )
																											return 
																										else
																											GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																											GlowAnim:setTopBottom( true, false, -16.5, 43.5 )
																											GlowAnim:setAlpha( 1 )
																											GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										GlowAnimFrame23( GlowAnim, event )
																										return 
																									else
																										GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																										GlowAnim:setTopBottom( true, false, -16.06, 43.94 )
																										GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									GlowAnimFrame22( GlowAnim, event )
																									return 
																								else
																									GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									GlowAnim:setTopBottom( true, false, -15.51, 44.49 )
																									GlowAnim:setAlpha( 0.4 )
																									GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								GlowAnimFrame21( GlowAnim, event )
																								return 
																							else
																								GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																								GlowAnim:setTopBottom( true, false, -14.96, 45.04 )
																								GlowAnim:setAlpha( 0.1 )
																								GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							GlowAnimFrame20( GlowAnim, event )
																							return 
																						else
																							GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																							GlowAnim:setTopBottom( true, false, -14.41, 45.59 )
																							GlowAnim:setAlpha( 0.87 )
																							GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						GlowAnimFrame19( GlowAnim, event )
																						return 
																					else
																						GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																						GlowAnim:setTopBottom( true, false, -13.97, 46.03 )
																						GlowAnim:setAlpha( 0.4 )
																						GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					GlowAnimFrame18( GlowAnim, event )
																					return 
																				else
																					GlowAnim:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																					GlowAnim:setTopBottom( true, false, -13.42, 46.58 )
																					GlowAnim:setAlpha( 1 )
																					GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				GlowAnimFrame17( GlowAnim, event )
																				return 
																			else
																				GlowAnim:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																				GlowAnim:setTopBottom( true, false, -12.43, 47.57 )
																				GlowAnim:setAlpha( 0.75 )
																				GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			GlowAnimFrame16( GlowAnim, event )
																			return 
																		else
																			GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																			GlowAnim:setTopBottom( true, false, -11.44, 48.56 )
																			GlowAnim:setAlpha( 0.2 )
																			GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		GlowAnimFrame15( GlowAnim, event )
																		return 
																	else
																		GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		GlowAnim:setTopBottom( true, false, -10.45, 49.55 )
																		GlowAnim:setAlpha( 0.63 )
																		GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame15 )
																	end
																end
																
																if event.interrupted then
																	GlowAnimFrame14( GlowAnim, event )
																	return 
																else
																	GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																	GlowAnim:setTopBottom( true, false, -9.9, 50.1 )
																	GlowAnim:setAlpha( 0.8 )
																	GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame14 )
																end
															end
															
															if event.interrupted then
																GlowAnimFrame13( GlowAnim, event )
																return 
															else
																GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																GlowAnim:setTopBottom( true, false, -9.24, 50.76 )
																GlowAnim:setAlpha( 0.56 )
																GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame13 )
															end
														end
														
														if event.interrupted then
															GlowAnimFrame12( GlowAnim, event )
															return 
														else
															GlowAnim:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															GlowAnim:setTopBottom( true, false, -8.58, 51.42 )
															GlowAnim:setAlpha( 0.62 )
															GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame12 )
														end
													end
													
													if event.interrupted then
														GlowAnimFrame11( GlowAnim, event )
														return 
													else
														GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														GlowAnim:setTopBottom( true, false, -7.92, 52.08 )
														GlowAnim:setAlpha( 0.48 )
														GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame11 )
													end
												end
												
												if event.interrupted then
													GlowAnimFrame10( GlowAnim, event )
													return 
												else
													GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													GlowAnim:setTopBottom( true, false, -7.26, 52.74 )
													GlowAnim:setAlpha( 0.54 )
													GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame10 )
												end
											end
											
											if event.interrupted then
												GlowAnimFrame9( GlowAnim, event )
												return 
											else
												GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												GlowAnim:setTopBottom( true, false, -6.6, 53.4 )
												GlowAnim:setAlpha( 0.4 )
												GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame9 )
											end
										end
										
										if event.interrupted then
											GlowAnimFrame8( GlowAnim, event )
											return 
										else
											GlowAnim:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
											GlowAnim:setTopBottom( true, false, -5.94, 54.06 )
											GlowAnim:setAlpha( 0.46 )
											GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame8 )
										end
									end
									
									if event.interrupted then
										GlowAnimFrame7( GlowAnim, event )
										return 
									else
										GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										GlowAnim:setTopBottom( true, false, -5.17, 54.83 )
										GlowAnim:setAlpha( 0.31 )
										GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame7 )
									end
								end
								
								if event.interrupted then
									GlowAnimFrame6( GlowAnim, event )
									return 
								else
									GlowAnim:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									GlowAnim:setTopBottom( true, false, -4.51, 55.49 )
									GlowAnim:setAlpha( 0.37 )
									GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame6 )
								end
							end
							
							if event.interrupted then
								GlowAnimFrame5( GlowAnim, event )
								return 
							else
								GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								GlowAnim:setTopBottom( true, false, -3.63, 56.37 )
								GlowAnim:setAlpha( 0.22 )
								GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame5 )
							end
						end
						
						if event.interrupted then
							GlowAnimFrame4( GlowAnim, event )
							return 
						else
							GlowAnim:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							GlowAnim:setTopBottom( true, false, -2.97, 57.03 )
							GlowAnim:setAlpha( 0.28 )
							GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame4 )
						end
					end
					
					if event.interrupted then
						GlowAnimFrame3( GlowAnim, event )
						return 
					else
						GlowAnim:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						GlowAnim:setTopBottom( true, false, -2.2, 57.8 )
						GlowAnim:setAlpha( 0.13 )
						GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame3 )
					end
				end
				
				GlowAnim:completeAnimation()
				self.GlowAnim:setLeftRight( true, false, 0, 60 )
				self.GlowAnim:setTopBottom( true, false, 0, 60 )
				self.GlowAnim:setAlpha( 0 )
				GlowAnimFrame2( GlowAnim, {} )
				self.nextClip = "DefaultClip"
			end
		},
		WeaponDual = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local GlowAnimFrame2 = function ( GlowAnim, event )
					local GlowAnimFrame3 = function ( GlowAnim, event )
						local GlowAnimFrame4 = function ( GlowAnim, event )
							local GlowAnimFrame5 = function ( GlowAnim, event )
								local GlowAnimFrame6 = function ( GlowAnim, event )
									local GlowAnimFrame7 = function ( GlowAnim, event )
										local GlowAnimFrame8 = function ( GlowAnim, event )
											local GlowAnimFrame9 = function ( GlowAnim, event )
												local GlowAnimFrame10 = function ( GlowAnim, event )
													local GlowAnimFrame11 = function ( GlowAnim, event )
														local GlowAnimFrame12 = function ( GlowAnim, event )
															local GlowAnimFrame13 = function ( GlowAnim, event )
																local GlowAnimFrame14 = function ( GlowAnim, event )
																	local GlowAnimFrame15 = function ( GlowAnim, event )
																		local GlowAnimFrame16 = function ( GlowAnim, event )
																			local GlowAnimFrame17 = function ( GlowAnim, event )
																				local GlowAnimFrame18 = function ( GlowAnim, event )
																					local GlowAnimFrame19 = function ( GlowAnim, event )
																						local GlowAnimFrame20 = function ( GlowAnim, event )
																							local GlowAnimFrame21 = function ( GlowAnim, event )
																								local GlowAnimFrame22 = function ( GlowAnim, event )
																									local GlowAnimFrame23 = function ( GlowAnim, event )
																										local GlowAnimFrame24 = function ( GlowAnim, event )
																											local GlowAnimFrame25 = function ( GlowAnim, event )
																												local GlowAnimFrame26 = function ( GlowAnim, event )
																													local GlowAnimFrame27 = function ( GlowAnim, event )
																														local GlowAnimFrame28 = function ( GlowAnim, event )
																															local GlowAnimFrame29 = function ( GlowAnim, event )
																																local GlowAnimFrame30 = function ( GlowAnim, event )
																																	local GlowAnimFrame31 = function ( GlowAnim, event )
																																		local GlowAnimFrame32 = function ( GlowAnim, event )
																																			local GlowAnimFrame33 = function ( GlowAnim, event )
																																				local GlowAnimFrame34 = function ( GlowAnim, event )
																																					local GlowAnimFrame35 = function ( GlowAnim, event )
																																						local GlowAnimFrame36 = function ( GlowAnim, event )
																																							local GlowAnimFrame37 = function ( GlowAnim, event )
																																								local GlowAnimFrame38 = function ( GlowAnim, event )
																																									local GlowAnimFrame39 = function ( GlowAnim, event )
																																										local GlowAnimFrame40 = function ( GlowAnim, event )
																																											local GlowAnimFrame41 = function ( GlowAnim, event )
																																												local GlowAnimFrame42 = function ( GlowAnim, event )
																																													local GlowAnimFrame43 = function ( GlowAnim, event )
																																														local GlowAnimFrame44 = function ( GlowAnim, event )
																																															local GlowAnimFrame45 = function ( GlowAnim, event )
																																																local GlowAnimFrame46 = function ( GlowAnim, event )
																																																	local GlowAnimFrame47 = function ( GlowAnim, event )
																																																		local GlowAnimFrame48 = function ( GlowAnim, event )
																																																			local GlowAnimFrame49 = function ( GlowAnim, event )
																																																				if not event.interrupted then
																																																					GlowAnim:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
																																																				end
																																																				GlowAnim:setLeftRight( true, false, 0, 60 )
																																																				GlowAnim:setTopBottom( true, false, -33, 27 )
																																																				GlowAnim:setAlpha( 0 )
																																																				if event.interrupted then
																																																					self.clipFinished( GlowAnim, event )
																																																				else
																																																					GlowAnim:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				GlowAnimFrame49( GlowAnim, event )
																																																				return 
																																																			else
																																																				GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																																				GlowAnim:setTopBottom( true, false, -33, 27 )
																																																				GlowAnim:setAlpha( 0 )
																																																				GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			GlowAnimFrame48( GlowAnim, event )
																																																			return 
																																																		else
																																																			GlowAnim:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																																			GlowAnim:setTopBottom( true, false, -32.01, 27.99 )
																																																			GlowAnim:setAlpha( 0.06 )
																																																			GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		GlowAnimFrame47( GlowAnim, event )
																																																		return 
																																																	else
																																																		GlowAnim:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																																																		GlowAnim:setTopBottom( true, false, -31.02, 28.98 )
																																																		GlowAnim:setAlpha( 0.12 )
																																																		GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	GlowAnimFrame46( GlowAnim, event )
																																																	return 
																																																else
																																																	GlowAnim:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																																																	GlowAnim:setTopBottom( true, false, -29.92, 30.08 )
																																																	GlowAnim:setAlpha( 0.18 )
																																																	GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																GlowAnimFrame45( GlowAnim, event )
																																																return 
																																															else
																																																GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																																GlowAnim:setTopBottom( true, false, -28.82, 31.18 )
																																																GlowAnim:setAlpha( 0.25 )
																																																GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															GlowAnimFrame44( GlowAnim, event )
																																															return 
																																														else
																																															GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																															GlowAnim:setTopBottom( true, false, -28.38, 31.62 )
																																															GlowAnim:setAlpha( 0.1 )
																																															GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														GlowAnimFrame43( GlowAnim, event )
																																														return 
																																													else
																																														GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																														GlowAnim:setTopBottom( true, false, -27.83, 32.17 )
																																														GlowAnim:setAlpha( 0.31 )
																																														GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													GlowAnimFrame42( GlowAnim, event )
																																													return 
																																												else
																																													GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																													GlowAnim:setTopBottom( true, false, -26.84, 33.16 )
																																													GlowAnim:setAlpha( 0.37 )
																																													GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												GlowAnimFrame41( GlowAnim, event )
																																												return 
																																											else
																																												GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																												GlowAnim:setTopBottom( true, false, -26.29, 33.71 )
																																												GlowAnim:setAlpha( 1 )
																																												GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											GlowAnimFrame40( GlowAnim, event )
																																											return 
																																										else
																																											GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																											GlowAnim:setTopBottom( true, false, -25.74, 34.26 )
																																											GlowAnim:setAlpha( 0.44 )
																																											GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										GlowAnimFrame39( GlowAnim, event )
																																										return 
																																									else
																																										GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																										GlowAnim:setTopBottom( true, false, -25.19, 34.81 )
																																										GlowAnim:setAlpha( 0.8 )
																																										GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									GlowAnimFrame38( GlowAnim, event )
																																									return 
																																								else
																																									GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																									GlowAnim:setTopBottom( true, false, -24.75, 35.25 )
																																									GlowAnim:setAlpha( 0.5 )
																																									GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								GlowAnimFrame37( GlowAnim, event )
																																								return 
																																							else
																																								GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																								GlowAnim:setTopBottom( true, false, -23.76, 36.24 )
																																								GlowAnim:setAlpha( 0.56 )
																																								GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							GlowAnimFrame36( GlowAnim, event )
																																							return 
																																						else
																																							GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																							GlowAnim:setTopBottom( true, false, -23.21, 36.79 )
																																							GlowAnim:setAlpha( 0.2 )
																																							GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						GlowAnimFrame35( GlowAnim, event )
																																						return 
																																					else
																																						GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																						GlowAnim:setTopBottom( true, false, -22.66, 37.34 )
																																						GlowAnim:setAlpha( 0.63 )
																																						GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					GlowAnimFrame34( GlowAnim, event )
																																					return 
																																				else
																																					GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																					GlowAnim:setTopBottom( true, false, -21.67, 38.33 )
																																					GlowAnim:setAlpha( 0.69 )
																																					GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				GlowAnimFrame33( GlowAnim, event )
																																				return 
																																			else
																																				GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																				GlowAnim:setTopBottom( true, false, -21.12, 38.88 )
																																				GlowAnim:setAlpha( 0.5 )
																																				GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			GlowAnimFrame32( GlowAnim, event )
																																			return 
																																		else
																																			GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																			GlowAnim:setTopBottom( true, false, -20.57, 39.43 )
																																			GlowAnim:setAlpha( 0.75 )
																																			GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		GlowAnimFrame31( GlowAnim, event )
																																		return 
																																	else
																																		GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																		GlowAnim:setTopBottom( true, false, -20.13, 39.87 )
																																		GlowAnim:setAlpha( 0.4 )
																																		GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	GlowAnimFrame30( GlowAnim, event )
																																	return 
																																else
																																	GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																	GlowAnim:setTopBottom( true, false, -19.58, 40.42 )
																																	GlowAnim:setAlpha( 0.81 )
																																	GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																GlowAnimFrame29( GlowAnim, event )
																																return 
																															else
																																GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																GlowAnim:setTopBottom( true, false, -19.03, 40.97 )
																																GlowAnim:setAlpha( 0.6 )
																																GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															GlowAnimFrame28( GlowAnim, event )
																															return 
																														else
																															GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																															GlowAnim:setTopBottom( true, false, -18.48, 41.52 )
																															GlowAnim:setAlpha( 0.88 )
																															GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														GlowAnimFrame27( GlowAnim, event )
																														return 
																													else
																														GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																														GlowAnim:setTopBottom( true, false, -18.04, 41.96 )
																														GlowAnim:setAlpha( 0.7 )
																														GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													GlowAnimFrame26( GlowAnim, event )
																													return 
																												else
																													GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																													GlowAnim:setTopBottom( true, false, -17.6, 42.4 )
																													GlowAnim:setAlpha( 0.93 )
																													GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												GlowAnimFrame25( GlowAnim, event )
																												return 
																											else
																												GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																												GlowAnim:setTopBottom( true, false, -17.05, 42.95 )
																												GlowAnim:setAlpha( 0.6 )
																												GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											GlowAnimFrame24( GlowAnim, event )
																											return 
																										else
																											GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																											GlowAnim:setTopBottom( true, false, -16.5, 43.5 )
																											GlowAnim:setAlpha( 1 )
																											GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										GlowAnimFrame23( GlowAnim, event )
																										return 
																									else
																										GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																										GlowAnim:setTopBottom( true, false, -16.06, 43.94 )
																										GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									GlowAnimFrame22( GlowAnim, event )
																									return 
																								else
																									GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									GlowAnim:setTopBottom( true, false, -15.51, 44.49 )
																									GlowAnim:setAlpha( 0.4 )
																									GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								GlowAnimFrame21( GlowAnim, event )
																								return 
																							else
																								GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																								GlowAnim:setTopBottom( true, false, -14.96, 45.04 )
																								GlowAnim:setAlpha( 0.1 )
																								GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							GlowAnimFrame20( GlowAnim, event )
																							return 
																						else
																							GlowAnim:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																							GlowAnim:setTopBottom( true, false, -14.41, 45.59 )
																							GlowAnim:setAlpha( 0.87 )
																							GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						GlowAnimFrame19( GlowAnim, event )
																						return 
																					else
																						GlowAnim:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																						GlowAnim:setTopBottom( true, false, -13.97, 46.03 )
																						GlowAnim:setAlpha( 0.4 )
																						GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					GlowAnimFrame18( GlowAnim, event )
																					return 
																				else
																					GlowAnim:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																					GlowAnim:setTopBottom( true, false, -13.42, 46.58 )
																					GlowAnim:setAlpha( 1 )
																					GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				GlowAnimFrame17( GlowAnim, event )
																				return 
																			else
																				GlowAnim:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																				GlowAnim:setTopBottom( true, false, -12.43, 47.57 )
																				GlowAnim:setAlpha( 0.75 )
																				GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			GlowAnimFrame16( GlowAnim, event )
																			return 
																		else
																			GlowAnim:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																			GlowAnim:setTopBottom( true, false, -11.44, 48.56 )
																			GlowAnim:setAlpha( 0.2 )
																			GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		GlowAnimFrame15( GlowAnim, event )
																		return 
																	else
																		GlowAnim:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		GlowAnim:setTopBottom( true, false, -10.45, 49.55 )
																		GlowAnim:setAlpha( 0.63 )
																		GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame15 )
																	end
																end
																
																if event.interrupted then
																	GlowAnimFrame14( GlowAnim, event )
																	return 
																else
																	GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																	GlowAnim:setTopBottom( true, false, -9.9, 50.1 )
																	GlowAnim:setAlpha( 0.8 )
																	GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame14 )
																end
															end
															
															if event.interrupted then
																GlowAnimFrame13( GlowAnim, event )
																return 
															else
																GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																GlowAnim:setTopBottom( true, false, -9.24, 50.76 )
																GlowAnim:setAlpha( 0.56 )
																GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame13 )
															end
														end
														
														if event.interrupted then
															GlowAnimFrame12( GlowAnim, event )
															return 
														else
															GlowAnim:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															GlowAnim:setTopBottom( true, false, -8.58, 51.42 )
															GlowAnim:setAlpha( 0.62 )
															GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame12 )
														end
													end
													
													if event.interrupted then
														GlowAnimFrame11( GlowAnim, event )
														return 
													else
														GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														GlowAnim:setTopBottom( true, false, -7.92, 52.08 )
														GlowAnim:setAlpha( 0.48 )
														GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame11 )
													end
												end
												
												if event.interrupted then
													GlowAnimFrame10( GlowAnim, event )
													return 
												else
													GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													GlowAnim:setTopBottom( true, false, -7.26, 52.74 )
													GlowAnim:setAlpha( 0.54 )
													GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame10 )
												end
											end
											
											if event.interrupted then
												GlowAnimFrame9( GlowAnim, event )
												return 
											else
												GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												GlowAnim:setTopBottom( true, false, -6.6, 53.4 )
												GlowAnim:setAlpha( 0.4 )
												GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame9 )
											end
										end
										
										if event.interrupted then
											GlowAnimFrame8( GlowAnim, event )
											return 
										else
											GlowAnim:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
											GlowAnim:setTopBottom( true, false, -5.94, 54.06 )
											GlowAnim:setAlpha( 0.46 )
											GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame8 )
										end
									end
									
									if event.interrupted then
										GlowAnimFrame7( GlowAnim, event )
										return 
									else
										GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										GlowAnim:setTopBottom( true, false, -5.17, 54.83 )
										GlowAnim:setAlpha( 0.31 )
										GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame7 )
									end
								end
								
								if event.interrupted then
									GlowAnimFrame6( GlowAnim, event )
									return 
								else
									GlowAnim:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									GlowAnim:setTopBottom( true, false, -4.51, 55.49 )
									GlowAnim:setAlpha( 0.37 )
									GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame6 )
								end
							end
							
							if event.interrupted then
								GlowAnimFrame5( GlowAnim, event )
								return 
							else
								GlowAnim:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								GlowAnim:setTopBottom( true, false, -3.63, 56.37 )
								GlowAnim:setAlpha( 0.22 )
								GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame5 )
							end
						end
						
						if event.interrupted then
							GlowAnimFrame4( GlowAnim, event )
							return 
						else
							GlowAnim:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							GlowAnim:setTopBottom( true, false, -2.97, 57.03 )
							GlowAnim:setAlpha( 0.28 )
							GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame4 )
						end
					end
					
					if event.interrupted then
						GlowAnimFrame3( GlowAnim, event )
						return 
					else
						GlowAnim:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						GlowAnim:setTopBottom( true, false, -2.2, 57.8 )
						GlowAnim:setAlpha( 0.13 )
						GlowAnim:registerEventHandler( "transition_complete_keyframe", GlowAnimFrame3 )
					end
				end
				
				GlowAnim:completeAnimation()
				self.GlowAnim:setLeftRight( true, false, 0, 60 )
				self.GlowAnim:setTopBottom( true, false, 0, 60 )
				self.GlowAnim:setAlpha( 0 )
				GlowAnimFrame2( GlowAnim, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WeaponDual",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.ammoInDWClip", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInDWClip" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInDWClip"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

