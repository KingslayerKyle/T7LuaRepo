-- be5ba09826b7998f8798a0b7a16254e7
-- This hash is used for caching, delete to decompile the file again

CoD.CookbookArrow_Widget = InheritFrom( LUI.UIElement )
CoD.CookbookArrow_Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CookbookArrow_Widget )
	self.id = "CookbookArrow_Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 313 )
	self:setTopBottom( true, false, 0, 157 )
	
	local Smudge = LUI.UIImage.new()
	Smudge:setLeftRight( false, false, -155.67, 157.5 )
	Smudge:setTopBottom( false, false, -115.58, 41 )
	Smudge:setAlpha( 0.8 )
	Smudge:setImage( RegisterImage( "uie_t7_zm_cookbook_selected_smudgeframe" ) )
	self:addElement( Smudge )
	self.Smudge = Smudge
	
	local Smudge0 = LUI.UIImage.new()
	Smudge0:setLeftRight( false, false, -155.67, 157.5 )
	Smudge0:setTopBottom( false, false, -393.58, -237 )
	Smudge0:setAlpha( 0.4 )
	Smudge0:setXRot( 180 )
	Smudge0:setImage( RegisterImage( "uie_t7_zm_cookbook_selected_smudgeframe" ) )
	self:addElement( Smudge0 )
	self.Smudge0 = Smudge0
	
	local Backing = LUI.UIImage.new()
	Backing:setLeftRight( false, false, -156.67, 156.67 )
	Backing:setTopBottom( false, false, -78.33, 78.33 )
	Backing:setImage( RegisterImage( "uie_t7_zm_cookbook_selected_arrow" ) )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( false, false, -47, 47 )
	Arrow:setTopBottom( false, false, -78.33, 78.33 )
	Arrow:setImage( RegisterImage( "uie_t7_zm_cookbook_selected_arrow_yellow" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Backing0 = LUI.UIImage.new()
	Backing0:setLeftRight( false, false, -133.5, -94.5 )
	Backing0:setTopBottom( false, false, -362.27, -346.67 )
	Backing0:setAlpha( 0.8 )
	Backing0:setImage( RegisterImage( "uie_t7_zm_cookbook_selected_point" ) )
	self:addElement( Backing0 )
	self.Backing0 = Backing0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, 96.5, 135.5 )
	Image0:setTopBottom( false, false, -362.27, -346.67 )
	Image0:setAlpha( 0.8 )
	Image0:setZRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_zm_cookbook_selected_point" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

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
																																								if not event.interrupted then
																																									Arrow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
																																								end
																																								Arrow:setLeftRight( false, false, -47, 47 )
																																								Arrow:setTopBottom( false, false, -78.33, 78.33 )
																																								if event.interrupted then
																																									self.clipFinished( Arrow, event )
																																								else
																																									Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								ArrowFrame37( Arrow, event )
																																								return 
																																							else
																																								Arrow:beginAnimation( "keyframe", 1199, false, false, CoD.TweenType.Linear )
																																								Arrow:setTopBottom( false, false, -74.33, 82.33 )
																																								Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							ArrowFrame36( Arrow, event )
																																							return 
																																						else
																																							Arrow:beginAnimation( "keyframe", 1040, false, false, CoD.TweenType.Linear )
																																							Arrow:setTopBottom( false, false, -84.33, 72.33 )
																																							Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						ArrowFrame35( Arrow, event )
																																						return 
																																					else
																																						Arrow:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
																																						Arrow:setTopBottom( false, false, -73.33, 83.33 )
																																						Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					ArrowFrame34( Arrow, event )
																																					return 
																																				else
																																					Arrow:beginAnimation( "keyframe", 1040, false, false, CoD.TweenType.Linear )
																																					Arrow:setTopBottom( false, false, -78.33, 78.33 )
																																					Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				ArrowFrame33( Arrow, event )
																																				return 
																																			else
																																				Arrow:beginAnimation( "keyframe", 1359, false, false, CoD.TweenType.Linear )
																																				Arrow:setTopBottom( false, false, -73.33, 83.33 )
																																				Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			ArrowFrame32( Arrow, event )
																																			return 
																																		else
																																			Arrow:beginAnimation( "keyframe", 1220, false, false, CoD.TweenType.Linear )
																																			Arrow:setTopBottom( false, false, -82.33, 74.33 )
																																			Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ArrowFrame31( Arrow, event )
																																		return 
																																	else
																																		Arrow:beginAnimation( "keyframe", 969, false, false, CoD.TweenType.Linear )
																																		Arrow:setTopBottom( false, false, -73.33, 83.33 )
																																		Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ArrowFrame30( Arrow, event )
																																	return 
																																else
																																	Arrow:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
																																	Arrow:setLeftRight( false, false, -47, 47 )
																																	Arrow:setTopBottom( false, false, -78.33, 78.33 )
																																	Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ArrowFrame29( Arrow, event )
																																return 
																															else
																																Arrow:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
																																Arrow:setLeftRight( false, false, -47, 47 )
																																Arrow:setTopBottom( false, false, -73.33, 83.33 )
																																Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ArrowFrame28( Arrow, event )
																															return 
																														else
																															Arrow:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
																															Arrow:setTopBottom( false, false, -78.33, 78.33 )
																															Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ArrowFrame27( Arrow, event )
																														return 
																													else
																														Arrow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
																														Arrow:setTopBottom( false, false, -75.33, 81.33 )
																														Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ArrowFrame26( Arrow, event )
																													return 
																												else
																													Arrow:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
																													Arrow:setTopBottom( false, false, -78.33, 78.33 )
																													Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ArrowFrame25( Arrow, event )
																												return 
																											else
																												Arrow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
																												Arrow:setTopBottom( false, false, -76.33, 80.33 )
																												Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ArrowFrame24( Arrow, event )
																											return 
																										else
																											Arrow:beginAnimation( "keyframe", 719, false, false, CoD.TweenType.Linear )
																											Arrow:setTopBottom( false, false, -78.33, 78.33 )
																											Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ArrowFrame23( Arrow, event )
																										return 
																									else
																										Arrow:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
																										Arrow:setTopBottom( false, false, -74.33, 82.33 )
																										Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ArrowFrame22( Arrow, event )
																									return 
																								else
																									Arrow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
																									Arrow:setTopBottom( false, false, -76.33, 80.33 )
																									Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ArrowFrame21( Arrow, event )
																								return 
																							else
																								Arrow:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
																								Arrow:setLeftRight( false, false, -47, 47 )
																								Arrow:setTopBottom( false, false, -75.33, 81.33 )
																								Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ArrowFrame20( Arrow, event )
																							return 
																						else
																							Arrow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
																							Arrow:setLeftRight( false, false, -47, 47 )
																							Arrow:setTopBottom( false, false, -78.33, 78.33 )
																							Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ArrowFrame19( Arrow, event )
																						return 
																					else
																						Arrow:beginAnimation( "keyframe", 1199, false, false, CoD.TweenType.Linear )
																						Arrow:setTopBottom( false, false, -74.33, 82.33 )
																						Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ArrowFrame18( Arrow, event )
																					return 
																				else
																					Arrow:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
																					Arrow:setTopBottom( false, false, -84.33, 72.33 )
																					Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ArrowFrame17( Arrow, event )
																				return 
																			else
																				Arrow:beginAnimation( "keyframe", 1300, false, false, CoD.TweenType.Linear )
																				Arrow:setTopBottom( false, false, -73.33, 83.33 )
																				Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ArrowFrame16( Arrow, event )
																			return 
																		else
																			Arrow:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
																			Arrow:setTopBottom( false, false, -78.33, 78.33 )
																			Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ArrowFrame15( Arrow, event )
																		return 
																	else
																		Arrow:beginAnimation( "keyframe", 1359, false, false, CoD.TweenType.Linear )
																		Arrow:setTopBottom( false, false, -73.33, 83.33 )
																		Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame15 )
																	end
																end
																
																if event.interrupted then
																	ArrowFrame14( Arrow, event )
																	return 
																else
																	Arrow:beginAnimation( "keyframe", 1219, false, false, CoD.TweenType.Linear )
																	Arrow:setTopBottom( false, false, -82.33, 74.33 )
																	Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame14 )
																end
															end
															
															if event.interrupted then
																ArrowFrame13( Arrow, event )
																return 
															else
																Arrow:beginAnimation( "keyframe", 970, false, false, CoD.TweenType.Linear )
																Arrow:setTopBottom( false, false, -73.33, 83.33 )
																Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame13 )
															end
														end
														
														if event.interrupted then
															ArrowFrame12( Arrow, event )
															return 
														else
															Arrow:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
															Arrow:setLeftRight( false, false, -47, 47 )
															Arrow:setTopBottom( false, false, -78.33, 78.33 )
															Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame12 )
														end
													end
													
													if event.interrupted then
														ArrowFrame11( Arrow, event )
														return 
													else
														Arrow:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
														Arrow:setLeftRight( false, false, -47, 47 )
														Arrow:setTopBottom( false, false, -73.33, 83.33 )
														Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame11 )
													end
												end
												
												if event.interrupted then
													ArrowFrame10( Arrow, event )
													return 
												else
													Arrow:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
													Arrow:setTopBottom( false, false, -78.33, 78.33 )
													Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame10 )
												end
											end
											
											if event.interrupted then
												ArrowFrame9( Arrow, event )
												return 
											else
												Arrow:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
												Arrow:setTopBottom( false, false, -75.33, 81.33 )
												Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame9 )
											end
										end
										
										if event.interrupted then
											ArrowFrame8( Arrow, event )
											return 
										else
											Arrow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
											Arrow:setTopBottom( false, false, -78.33, 78.33 )
											Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame8 )
										end
									end
									
									if event.interrupted then
										ArrowFrame7( Arrow, event )
										return 
									else
										Arrow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										Arrow:setTopBottom( false, false, -76.33, 80.33 )
										Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame7 )
									end
								end
								
								if event.interrupted then
									ArrowFrame6( Arrow, event )
									return 
								else
									Arrow:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
									Arrow:setTopBottom( false, false, -78.33, 78.33 )
									Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame6 )
								end
							end
							
							if event.interrupted then
								ArrowFrame5( Arrow, event )
								return 
							else
								Arrow:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
								Arrow:setTopBottom( false, false, -74.33, 82.33 )
								Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame5 )
							end
						end
						
						if event.interrupted then
							ArrowFrame4( Arrow, event )
							return 
						else
							Arrow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							Arrow:setTopBottom( false, false, -76.33, 80.33 )
							Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame4 )
						end
					end
					
					if event.interrupted then
						ArrowFrame3( Arrow, event )
						return 
					else
						Arrow:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						Arrow:setLeftRight( false, false, -47, 47 )
						Arrow:setTopBottom( false, false, -75.33, 81.33 )
						Arrow:registerEventHandler( "transition_complete_keyframe", ArrowFrame3 )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( false, false, -47, 47 )
				self.Arrow:setTopBottom( false, false, -78.33, 78.33 )
				ArrowFrame2( Arrow, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
