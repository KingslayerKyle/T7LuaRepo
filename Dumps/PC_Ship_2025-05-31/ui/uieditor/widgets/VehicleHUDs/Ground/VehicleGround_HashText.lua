require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_HashTextInternal" )

CoD.VehicleGround_HashText = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HashText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HashText )
	self.id = "VehicleGround_HashText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 106 )
	self:setTopBottom( true, false, 0, 26 )
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( false, false, -20, -4 )
	Arrow:setTopBottom( false, false, -7.33, 3.33 )
	Arrow:setRGB( 0.8, 0.82, 0.87 )
	Arrow:setZRot( -90 )
	Arrow:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_arrowt" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local VehicleGroundHashTextInternal0 = CoD.VehicleGround_HashTextInternal.new( menu, controller )
	VehicleGroundHashTextInternal0:setLeftRight( false, false, -49, -7 )
	VehicleGroundHashTextInternal0:setTopBottom( false, false, -160, 156 )
	self:addElement( VehicleGroundHashTextInternal0 )
	self.VehicleGroundHashTextInternal0 = VehicleGroundHashTextInternal0
	
	local TextStrike = LUI.UIText.new()
	TextStrike:setLeftRight( false, false, -4, 66 )
	TextStrike:setTopBottom( false, false, -8, 4 )
	TextStrike:setRGB( 0.47, 0.51, 0.6 )
	TextStrike:setText( Engine.Localize( "STRIKE" ) )
	TextStrike:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TextStrike:setLetterSpacing( 1.5 )
	TextStrike:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextStrike:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextStrike )
	self.TextStrike = TextStrike
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -37, -27 )
	Image0:setTopBottom( false, false, -12, 29 )
	Image0:setZRot( 90 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -37, -31 )
	Image1:setTopBottom( false, false, -32.5, 8.5 )
	Image1:setZRot( -90 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_woundedsoldier_sidemask" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local ArrowFrame2 = function ( Arrow, event )
					local ArrowFrame3 = function ( Arrow, event )
						local ArrowFrame4 = function ( Arrow, event )
							local ArrowFrame5 = function ( Arrow, event )
								local ArrowFrame6 = function ( Arrow, event )
									local ArrowFrame7 = function ( Arrow, event )
										local ArrowFrame8 = function ( Arrow, event )
											local ArrowFrame9 = function ( Arrow, event )
												local ArrowFrame10 = function ( Arrow, event )
													local ArrowFrame11 = function ( Arrow, event )
														local ArrowFrame12 = function ( Arrow, event )
															local ArrowFrame13 = function ( Arrow, event )
																local ArrowFrame14 = function ( Arrow, event )
																	local ArrowFrame15 = function ( Arrow, event )
																		local ArrowFrame16 = function ( Arrow, event )
																			local ArrowFrame17 = function ( Arrow, event )
																				local ArrowFrame18 = function ( Arrow, event )
																					local ArrowFrame19 = function ( Arrow, event )
																						local ArrowFrame20 = function ( Arrow, event )
																							local ArrowFrame21 = function ( Arrow, event )
																								local ArrowFrame22 = function ( Arrow, event )
																									local ArrowFrame23 = function ( Arrow, event )
																										local ArrowFrame24 = function ( Arrow, event )
																											local ArrowFrame25 = function ( Arrow, event )
																												local ArrowFrame26 = function ( Arrow, event )
																													local ArrowFrame27 = function ( Arrow, event )
																														local ArrowFrame28 = function ( Arrow, event )
																															local ArrowFrame29 = function ( Arrow, event )
																																local ArrowFrame30 = function ( Arrow, event )
																																	local ArrowFrame31 = function ( Arrow, event )
																																		local ArrowFrame32 = function ( Arrow, event )
																																			local ArrowFrame33 = function ( Arrow, event )
																																				local ArrowFrame34 = function ( Arrow, event )
																																					local ArrowFrame35 = function ( Arrow, event )
																																						local ArrowFrame36 = function ( Arrow, event )
																																							local ArrowFrame37 = function ( Arrow, event )
																																								local ArrowFrame38 = function ( Arrow, event )
																																									local ArrowFrame39 = function ( Arrow, event )
																																										local ArrowFrame40 = function ( Arrow, event )
																																											if not event.interrupted then
																																												Arrow:beginAnimation( "keyframe", 290, true, true, CoD.TweenType.Linear )
																																											end
																																											Arrow:setLeftRight( false, false, -20, -4 )
																																											Arrow:setTopBottom( false, false, -7.33, 3.33 )
																																											Arrow:setAlpha( 1 )
																																											if event.interrupted then
																																												self.clipFinished( Arrow, event )
																																											else
																																												Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											ArrowFrame40( Arrow, event )
																																											return 
																																										else
																																											Arrow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																											Arrow:setLeftRight( false, false, -26.75, -10.75 )
																																											Arrow:setAlpha( 0.2 )
																																											Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										ArrowFrame39( Arrow, event )
																																										return 
																																									else
																																										Arrow:beginAnimation( "keyframe", 260, true, true, CoD.TweenType.Linear )
																																										Arrow:setLeftRight( false, false, -27, -11 )
																																										Arrow:setAlpha( 0.28 )
																																										Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									ArrowFrame38( Arrow, event )
																																									return 
																																								else
																																									Arrow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																																									Arrow:setAlpha( 0.83 )
																																									Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								ArrowFrame37( Arrow, event )
																																								return 
																																							else
																																								Arrow:beginAnimation( "keyframe", 1729, false, false, CoD.TweenType.Linear )
																																								Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							ArrowFrame36( Arrow, event )
																																							return 
																																						else
																																							Arrow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																							Arrow:setAlpha( 1 )
																																							Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						ArrowFrame35( Arrow, event )
																																						return 
																																					else
																																						Arrow:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
																																						Arrow:setLeftRight( false, false, -20, -4 )
																																						Arrow:setAlpha( 0.97 )
																																						Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					ArrowFrame34( Arrow, event )
																																					return 
																																				else
																																					Arrow:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
																																					Arrow:setAlpha( 0.64 )
																																					Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				ArrowFrame33( Arrow, event )
																																				return 
																																			else
																																				Arrow:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
																																				Arrow:setAlpha( 0.2 )
																																				Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			ArrowFrame32( Arrow, event )
																																			return 
																																		else
																																			Arrow:beginAnimation( "keyframe", 310, true, true, CoD.TweenType.Linear )
																																			Arrow:setLeftRight( false, false, -27, -11 )
																																			Arrow:setAlpha( 0.61 )
																																			Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ArrowFrame31( Arrow, event )
																																		return 
																																	else
																																		Arrow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																																		Arrow:setAlpha( 0.9 )
																																		Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ArrowFrame30( Arrow, event )
																																	return 
																																else
																																	Arrow:beginAnimation( "keyframe", 1329, false, false, CoD.TweenType.Linear )
																																	Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ArrowFrame29( Arrow, event )
																																return 
																															else
																																Arrow:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
																																Arrow:setLeftRight( false, false, -20, -4 )
																																Arrow:setAlpha( 1 )
																																Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ArrowFrame28( Arrow, event )
																															return 
																														else
																															Arrow:beginAnimation( "keyframe", 739, false, false, CoD.TweenType.Linear )
																															Arrow:setAlpha( 0.72 )
																															Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ArrowFrame27( Arrow, event )
																														return 
																													else
																														Arrow:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Linear )
																														Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ArrowFrame26( Arrow, event )
																													return 
																												else
																													Arrow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
																													Arrow:setAlpha( 0.2 )
																													Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ArrowFrame25( Arrow, event )
																												return 
																											else
																												Arrow:beginAnimation( "keyframe", 809, true, true, CoD.TweenType.Linear )
																												Arrow:setLeftRight( false, false, -27, -11 )
																												Arrow:setAlpha( 0.44 )
																												Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ArrowFrame24( Arrow, event )
																											return 
																										else
																											Arrow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																											Arrow:setAlpha( 0.99 )
																											Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ArrowFrame23( Arrow, event )
																										return 
																									else
																										Arrow:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
																										Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ArrowFrame22( Arrow, event )
																									return 
																								else
																									Arrow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																									Arrow:setAlpha( 1 )
																									Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ArrowFrame21( Arrow, event )
																								return 
																							else
																								Arrow:beginAnimation( "keyframe", 989, true, true, CoD.TweenType.Linear )
																								Arrow:setLeftRight( false, false, -20, -4 )
																								Arrow:setAlpha( 0.99 )
																								Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ArrowFrame20( Arrow, event )
																							return 
																						else
																							Arrow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																							Arrow:setAlpha( 0.27 )
																							Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ArrowFrame19( Arrow, event )
																						return 
																					else
																						Arrow:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
																						Arrow:setAlpha( 0.2 )
																						Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ArrowFrame18( Arrow, event )
																					return 
																				else
																					Arrow:beginAnimation( "keyframe", 689, true, true, CoD.TweenType.Linear )
																					Arrow:setLeftRight( false, false, -27, -11 )
																					Arrow:setAlpha( 0.45 )
																					Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ArrowFrame17( Arrow, event )
																				return 
																			else
																				Arrow:beginAnimation( "keyframe", 1510, false, false, CoD.TweenType.Linear )
																				Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ArrowFrame16( Arrow, event )
																			return 
																		else
																			Arrow:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Arrow:setAlpha( 1 )
																			Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ArrowFrame15( Arrow, event )
																		return 
																	else
																		Arrow:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
																		Arrow:setLeftRight( false, false, -20, -4 )
																		Arrow:setAlpha( 0.89 )
																		Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame15 )
																	end
																end
																
																if event.interrupted then
																	ArrowFrame14( Arrow, event )
																	return 
																else
																	Arrow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																	Arrow:setAlpha( 0.35 )
																	Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame14 )
																end
															end
															
															if event.interrupted then
																ArrowFrame13( Arrow, event )
																return 
															else
																Arrow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																Arrow:setAlpha( 0.2 )
																Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame13 )
															end
														end
														
														if event.interrupted then
															ArrowFrame12( Arrow, event )
															return 
														else
															Arrow:beginAnimation( "keyframe", 240, true, true, CoD.TweenType.Linear )
															Arrow:setLeftRight( false, false, -27, -11 )
															Arrow:setAlpha( 0.35 )
															Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame12 )
														end
													end
													
													if event.interrupted then
														ArrowFrame11( Arrow, event )
														return 
													else
														Arrow:beginAnimation( "keyframe", 9, true, true, CoD.TweenType.Linear )
														Arrow:setAlpha( 0.97 )
														Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame11 )
													end
												end
												
												if event.interrupted then
													ArrowFrame10( Arrow, event )
													return 
												else
													Arrow:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
													Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame10 )
												end
											end
											
											if event.interrupted then
												ArrowFrame9( Arrow, event )
												return 
											else
												Arrow:beginAnimation( "keyframe", 940, true, true, CoD.TweenType.Linear )
												Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame9 )
											end
										end
										
										if event.interrupted then
											ArrowFrame8( Arrow, event )
											return 
										else
											Arrow:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
											Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame8 )
										end
									end
									
									if event.interrupted then
										ArrowFrame7( Arrow, event )
										return 
									else
										Arrow:beginAnimation( "keyframe", 179, true, true, CoD.TweenType.Linear )
										Arrow:setLeftRight( false, false, -20, -4 )
										Arrow:setAlpha( 1 )
										Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame7 )
									end
								end
								
								if event.interrupted then
									ArrowFrame6( Arrow, event )
									return 
								else
									Arrow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									Arrow:setAlpha( 0.45 )
									Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowFrame5( Arrow, event )
								return 
							else
								Arrow:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								Arrow:setAlpha( 0.2 )
								Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowFrame4( Arrow, event )
							return 
						else
							Arrow:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
							Arrow:setLeftRight( false, false, -27, -11 )
							Arrow:setAlpha( 0.47 )
							Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowFrame3( Arrow, event )
						return 
					else
						Arrow:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame3 )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( false, false, -20, -4 )
				self.Arrow:setTopBottom( false, false, -7.33, 3.33 )
				self.Arrow:setAlpha( 1 )
				ArrowFrame2( Arrow, {} )
				local VehicleGroundHashTextInternal0Frame2 = function ( VehicleGroundHashTextInternal0, event )
					local VehicleGroundHashTextInternal0Frame3 = function ( VehicleGroundHashTextInternal0, event )
						local VehicleGroundHashTextInternal0Frame4 = function ( VehicleGroundHashTextInternal0, event )
							local VehicleGroundHashTextInternal0Frame5 = function ( VehicleGroundHashTextInternal0, event )
								local VehicleGroundHashTextInternal0Frame6 = function ( VehicleGroundHashTextInternal0, event )
									local VehicleGroundHashTextInternal0Frame7 = function ( VehicleGroundHashTextInternal0, event )
										local VehicleGroundHashTextInternal0Frame8 = function ( VehicleGroundHashTextInternal0, event )
											local VehicleGroundHashTextInternal0Frame9 = function ( VehicleGroundHashTextInternal0, event )
												local VehicleGroundHashTextInternal0Frame10 = function ( VehicleGroundHashTextInternal0, event )
													local VehicleGroundHashTextInternal0Frame11 = function ( VehicleGroundHashTextInternal0, event )
														local VehicleGroundHashTextInternal0Frame12 = function ( VehicleGroundHashTextInternal0, event )
															local VehicleGroundHashTextInternal0Frame13 = function ( VehicleGroundHashTextInternal0, event )
																local VehicleGroundHashTextInternal0Frame14 = function ( VehicleGroundHashTextInternal0, event )
																	local VehicleGroundHashTextInternal0Frame15 = function ( VehicleGroundHashTextInternal0, event )
																		local VehicleGroundHashTextInternal0Frame16 = function ( VehicleGroundHashTextInternal0, event )
																			local VehicleGroundHashTextInternal0Frame17 = function ( VehicleGroundHashTextInternal0, event )
																				if not event.interrupted then
																					VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
																				end
																				VehicleGroundHashTextInternal0:setLeftRight( false, false, -49, -7 )
																				VehicleGroundHashTextInternal0:setTopBottom( false, false, -160, 156 )
																				if event.interrupted then
																					self.clipFinished( VehicleGroundHashTextInternal0, event )
																				else
																					VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundHashTextInternal0Frame17( VehicleGroundHashTextInternal0, event )
																				return 
																			else
																				VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
																				VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundHashTextInternal0Frame16( VehicleGroundHashTextInternal0, event )
																			return 
																		else
																			VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																			VehicleGroundHashTextInternal0:setTopBottom( false, false, -185, 131 )
																			VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundHashTextInternal0Frame15( VehicleGroundHashTextInternal0, event )
																		return 
																	else
																		VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
																		VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundHashTextInternal0Frame14( VehicleGroundHashTextInternal0, event )
																	return 
																else
																	VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
																	VehicleGroundHashTextInternal0:setTopBottom( false, false, -235, 81 )
																	VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundHashTextInternal0Frame13( VehicleGroundHashTextInternal0, event )
																return 
															else
																VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
																VehicleGroundHashTextInternal0:setTopBottom( false, false, -185, 131 )
																VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundHashTextInternal0Frame12( VehicleGroundHashTextInternal0, event )
															return 
														else
															VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 2000, true, true, CoD.TweenType.Linear )
															VehicleGroundHashTextInternal0:setTopBottom( false, false, -260, 56 )
															VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundHashTextInternal0Frame11( VehicleGroundHashTextInternal0, event )
														return 
													else
														VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundHashTextInternal0Frame10( VehicleGroundHashTextInternal0, event )
													return 
												else
													VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 2000, true, true, CoD.TweenType.Linear )
													VehicleGroundHashTextInternal0:setTopBottom( false, false, -210, 106 )
													VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundHashTextInternal0Frame9( VehicleGroundHashTextInternal0, event )
												return 
											else
												VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
												VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundHashTextInternal0Frame8( VehicleGroundHashTextInternal0, event )
											return 
										else
											VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
											VehicleGroundHashTextInternal0:setTopBottom( false, false, -285, 31 )
											VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundHashTextInternal0Frame7( VehicleGroundHashTextInternal0, event )
										return 
									else
										VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
										VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundHashTextInternal0Frame6( VehicleGroundHashTextInternal0, event )
									return 
								else
									VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
									VehicleGroundHashTextInternal0:setTopBottom( false, false, -85, 231 )
									VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundHashTextInternal0Frame5( VehicleGroundHashTextInternal0, event )
								return 
							else
								VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundHashTextInternal0Frame4( VehicleGroundHashTextInternal0, event )
							return 
						else
							VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
							VehicleGroundHashTextInternal0:setTopBottom( false, false, -35, 281 )
							VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundHashTextInternal0Frame3( VehicleGroundHashTextInternal0, event )
						return 
					else
						VehicleGroundHashTextInternal0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						VehicleGroundHashTextInternal0:registerEventHandler( "transition_complete_keyframe", VehicleGroundHashTextInternal0Frame3 )
					end
				end
				
				VehicleGroundHashTextInternal0:completeAnimation()
				self.VehicleGroundHashTextInternal0:setLeftRight( false, false, -49, -7 )
				self.VehicleGroundHashTextInternal0:setTopBottom( false, false, -160, 156 )
				VehicleGroundHashTextInternal0Frame2( VehicleGroundHashTextInternal0, {} )
				local TextStrikeFrame2 = function ( TextStrike, event )
					local TextStrikeFrame3 = function ( TextStrike, event )
						local TextStrikeFrame4 = function ( TextStrike, event )
							local TextStrikeFrame5 = function ( TextStrike, event )
								local TextStrikeFrame6 = function ( TextStrike, event )
									local TextStrikeFrame7 = function ( TextStrike, event )
										local TextStrikeFrame8 = function ( TextStrike, event )
											local TextStrikeFrame9 = function ( TextStrike, event )
												local TextStrikeFrame10 = function ( TextStrike, event )
													local TextStrikeFrame11 = function ( TextStrike, event )
														local TextStrikeFrame12 = function ( TextStrike, event )
															local TextStrikeFrame13 = function ( TextStrike, event )
																local TextStrikeFrame14 = function ( TextStrike, event )
																	local TextStrikeFrame15 = function ( TextStrike, event )
																		local TextStrikeFrame16 = function ( TextStrike, event )
																			local TextStrikeFrame17 = function ( TextStrike, event )
																				if not event.interrupted then
																					TextStrike:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				end
																				TextStrike:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( TextStrike, event )
																				else
																					TextStrike:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				TextStrikeFrame17( TextStrike, event )
																				return 
																			else
																				TextStrike:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																				TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			TextStrikeFrame16( TextStrike, event )
																			return 
																		else
																			TextStrike:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			TextStrike:setAlpha( 0 )
																			TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		TextStrikeFrame15( TextStrike, event )
																		return 
																	else
																		TextStrike:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																		TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame15 )
																	end
																end
																
																if event.interrupted then
																	TextStrikeFrame14( TextStrike, event )
																	return 
																else
																	TextStrike:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	TextStrike:setAlpha( 0.5 )
																	TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame14 )
																end
															end
															
															if event.interrupted then
																TextStrikeFrame13( TextStrike, event )
																return 
															else
																TextStrike:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame13 )
															end
														end
														
														if event.interrupted then
															TextStrikeFrame12( TextStrike, event )
															return 
														else
															TextStrike:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															TextStrike:setAlpha( 0 )
															TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame12 )
														end
													end
													
													if event.interrupted then
														TextStrikeFrame11( TextStrike, event )
														return 
													else
														TextStrike:beginAnimation( "keyframe", 3799, false, false, CoD.TweenType.Linear )
														TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame11 )
													end
												end
												
												if event.interrupted then
													TextStrikeFrame10( TextStrike, event )
													return 
												else
													TextStrike:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													TextStrike:setAlpha( 1 )
													TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame10 )
												end
											end
											
											if event.interrupted then
												TextStrikeFrame9( TextStrike, event )
												return 
											else
												TextStrike:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame9 )
											end
										end
										
										if event.interrupted then
											TextStrikeFrame8( TextStrike, event )
											return 
										else
											TextStrike:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											TextStrike:setAlpha( 0 )
											TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame8 )
										end
									end
									
									if event.interrupted then
										TextStrikeFrame7( TextStrike, event )
										return 
									else
										TextStrike:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame7 )
									end
								end
								
								if event.interrupted then
									TextStrikeFrame6( TextStrike, event )
									return 
								else
									TextStrike:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									TextStrike:setAlpha( 0.5 )
									TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame6 )
								end
							end
							
							if event.interrupted then
								TextStrikeFrame5( TextStrike, event )
								return 
							else
								TextStrike:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame5 )
							end
						end
						
						if event.interrupted then
							TextStrikeFrame4( TextStrike, event )
							return 
						else
							TextStrike:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							TextStrike:setAlpha( 0 )
							TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame4 )
						end
					end
					
					if event.interrupted then
						TextStrikeFrame3( TextStrike, event )
						return 
					else
						TextStrike:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						TextStrike:registerEventHandler( "transition_complete_keyframe", TextStrikeFrame3 )
					end
				end
				
				TextStrike:completeAnimation()
				self.TextStrike:setAlpha( 1 )
				TextStrikeFrame2( TextStrike, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundHashTextInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

