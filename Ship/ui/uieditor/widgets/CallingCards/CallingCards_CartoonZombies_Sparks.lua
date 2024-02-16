-- 473c7ecf947d554a80f3cb0e5e04a10e
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_CartoonZombies_Sparks = InheritFrom( LUI.UIElement )
CoD.CallingCards_CartoonZombies_Sparks.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_CartoonZombies_Sparks )
	self.id = "CallingCards_CartoonZombies_Sparks"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	
	local sparks = LUI.UIImage.new()
	sparks:setLeftRight( true, false, 0, 96 )
	sparks:setTopBottom( true, false, 0, 96 )
	sparks:setImage( RegisterImage( "uie_t7_callingcard_cartoonzombies_fireflygroup" ) )
	self:addElement( sparks )
	self.sparks = sparks
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local sparksFrame2 = function ( sparks, event )
					local sparksFrame3 = function ( sparks, event )
						local sparksFrame4 = function ( sparks, event )
							local sparksFrame5 = function ( sparks, event )
								local sparksFrame6 = function ( sparks, event )
									local sparksFrame7 = function ( sparks, event )
										local sparksFrame8 = function ( sparks, event )
											local sparksFrame9 = function ( sparks, event )
												local sparksFrame10 = function ( sparks, event )
													local sparksFrame11 = function ( sparks, event )
														local sparksFrame12 = function ( sparks, event )
															local sparksFrame13 = function ( sparks, event )
																local sparksFrame14 = function ( sparks, event )
																	local sparksFrame15 = function ( sparks, event )
																		local sparksFrame16 = function ( sparks, event )
																			local sparksFrame17 = function ( sparks, event )
																				local sparksFrame18 = function ( sparks, event )
																					local sparksFrame19 = function ( sparks, event )
																						local sparksFrame20 = function ( sparks, event )
																							local sparksFrame21 = function ( sparks, event )
																								local sparksFrame22 = function ( sparks, event )
																									local sparksFrame23 = function ( sparks, event )
																										local sparksFrame24 = function ( sparks, event )
																											local sparksFrame25 = function ( sparks, event )
																												local sparksFrame26 = function ( sparks, event )
																													local sparksFrame27 = function ( sparks, event )
																														local sparksFrame28 = function ( sparks, event )
																															local sparksFrame29 = function ( sparks, event )
																																local sparksFrame30 = function ( sparks, event )
																																	local sparksFrame31 = function ( sparks, event )
																																		local sparksFrame32 = function ( sparks, event )
																																			if not event.interrupted then
																																				sparks:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
																																			end
																																			sparks:setAlpha( 1 )
																																			if event.interrupted then
																																				self.clipFinished( sparks, event )
																																			else
																																				sparks:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			sparksFrame32( sparks, event )
																																			return 
																																		else
																																			sparks:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
																																			sparks:setAlpha( 0.13 )
																																			sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		sparksFrame31( sparks, event )
																																		return 
																																	else
																																		sparks:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																																		sparks:setAlpha( 1 )
																																		sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	sparksFrame30( sparks, event )
																																	return 
																																else
																																	sparks:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
																																	sparks:setAlpha( 0.14 )
																																	sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																sparksFrame29( sparks, event )
																																return 
																															else
																																sparks:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
																																sparks:setAlpha( 1 )
																																sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															sparksFrame28( sparks, event )
																															return 
																														else
																															sparks:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																															sparks:setAlpha( 0.4 )
																															sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														sparksFrame27( sparks, event )
																														return 
																													else
																														sparks:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														sparks:setAlpha( 1 )
																														sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													sparksFrame26( sparks, event )
																													return 
																												else
																													sparks:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																													sparks:setAlpha( 0.37 )
																													sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												sparksFrame25( sparks, event )
																												return 
																											else
																												sparks:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
																												sparks:setAlpha( 1 )
																												sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											sparksFrame24( sparks, event )
																											return 
																										else
																											sparks:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																											sparks:setAlpha( 0.2 )
																											sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										sparksFrame23( sparks, event )
																										return 
																									else
																										sparks:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										sparks:setAlpha( 1 )
																										sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									sparksFrame22( sparks, event )
																									return 
																								else
																									sparks:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
																									sparks:setAlpha( 0.25 )
																									sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								sparksFrame21( sparks, event )
																								return 
																							else
																								sparks:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								sparks:setAlpha( 1 )
																								sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							sparksFrame20( sparks, event )
																							return 
																						else
																							sparks:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																							sparks:setAlpha( 0.65 )
																							sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						sparksFrame19( sparks, event )
																						return 
																					else
																						sparks:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						sparks:setAlpha( 1 )
																						sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					sparksFrame18( sparks, event )
																					return 
																				else
																					sparks:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																					sparks:setAlpha( 0.32 )
																					sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				sparksFrame17( sparks, event )
																				return 
																			else
																				sparks:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																				sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			sparksFrame16( sparks, event )
																			return 
																		else
																			sparks:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																			sparks:setAlpha( 1 )
																			sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		sparksFrame15( sparks, event )
																		return 
																	else
																		sparks:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																		sparks:setAlpha( 0.14 )
																		sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame15 )
																	end
																end
																
																if event.interrupted then
																	sparksFrame14( sparks, event )
																	return 
																else
																	sparks:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
																	sparks:setAlpha( 1 )
																	sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame14 )
																end
															end
															
															if event.interrupted then
																sparksFrame13( sparks, event )
																return 
															else
																sparks:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																sparks:setAlpha( 0.4 )
																sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame13 )
															end
														end
														
														if event.interrupted then
															sparksFrame12( sparks, event )
															return 
														else
															sparks:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															sparks:setAlpha( 1 )
															sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame12 )
														end
													end
													
													if event.interrupted then
														sparksFrame11( sparks, event )
														return 
													else
														sparks:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														sparks:setAlpha( 0.37 )
														sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame11 )
													end
												end
												
												if event.interrupted then
													sparksFrame10( sparks, event )
													return 
												else
													sparks:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
													sparks:setAlpha( 1 )
													sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame10 )
												end
											end
											
											if event.interrupted then
												sparksFrame9( sparks, event )
												return 
											else
												sparks:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
												sparks:setAlpha( 0.2 )
												sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame9 )
											end
										end
										
										if event.interrupted then
											sparksFrame8( sparks, event )
											return 
										else
											sparks:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											sparks:setAlpha( 1 )
											sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame8 )
										end
									end
									
									if event.interrupted then
										sparksFrame7( sparks, event )
										return 
									else
										sparks:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										sparks:setAlpha( 0.25 )
										sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame7 )
									end
								end
								
								if event.interrupted then
									sparksFrame6( sparks, event )
									return 
								else
									sparks:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									sparks:setAlpha( 1 )
									sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame6 )
								end
							end
							
							if event.interrupted then
								sparksFrame5( sparks, event )
								return 
							else
								sparks:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								sparks:setAlpha( 0.65 )
								sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame5 )
							end
						end
						
						if event.interrupted then
							sparksFrame4( sparks, event )
							return 
						else
							sparks:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							sparks:setAlpha( 1 )
							sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame4 )
						end
					end
					
					if event.interrupted then
						sparksFrame3( sparks, event )
						return 
					else
						sparks:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						sparks:setAlpha( 0.32 )
						sparks:registerEventHandler( "transition_complete_keyframe", sparksFrame3 )
					end
				end
				
				sparks:completeAnimation()
				self.sparks:setAlpha( 1 )
				sparksFrame2( sparks, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
