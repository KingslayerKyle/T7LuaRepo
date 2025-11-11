CoD.CallingCards_loot_BO2_flash = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_BO2_flash.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_loot_BO2_flash )
	self.id = "CallingCards_loot_BO2_flash"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 82 )
	self:setTopBottom( 0, 0, 0, 82 )
	
	local flash = LUI.UIImage.new()
	flash:setLeftRight( 0, 0, 0, 82 )
	flash:setTopBottom( 0, 0, 0, 82 )
	flash:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_flash" ) )
	self:addElement( flash )
	self.flash = flash
	
	self.resetProperties = function ()
		flash:completeAnimation()
		flash:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local flashFrame2 = function ( flash, event )
					local flashFrame3 = function ( flash, event )
						local flashFrame4 = function ( flash, event )
							local flashFrame5 = function ( flash, event )
								local flashFrame6 = function ( flash, event )
									local flashFrame7 = function ( flash, event )
										local flashFrame8 = function ( flash, event )
											local flashFrame9 = function ( flash, event )
												local flashFrame10 = function ( flash, event )
													local flashFrame11 = function ( flash, event )
														local flashFrame12 = function ( flash, event )
															local flashFrame13 = function ( flash, event )
																local flashFrame14 = function ( flash, event )
																	local flashFrame15 = function ( flash, event )
																		local flashFrame16 = function ( flash, event )
																			local flashFrame17 = function ( flash, event )
																				local flashFrame18 = function ( flash, event )
																					local flashFrame19 = function ( flash, event )
																						local flashFrame20 = function ( flash, event )
																							local flashFrame21 = function ( flash, event )
																								local flashFrame22 = function ( flash, event )
																									local flashFrame23 = function ( flash, event )
																										local flashFrame24 = function ( flash, event )
																											local flashFrame25 = function ( flash, event )
																												local flashFrame26 = function ( flash, event )
																													local flashFrame27 = function ( flash, event )
																														local flashFrame28 = function ( flash, event )
																															local flashFrame29 = function ( flash, event )
																																local flashFrame30 = function ( flash, event )
																																	local flashFrame31 = function ( flash, event )
																																		if not event.interrupted then
																																			flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																		end
																																		flash:setAlpha( 1 )
																																		if event.interrupted then
																																			self.clipFinished( flash, event )
																																		else
																																			flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		flashFrame31( flash, event )
																																		return 
																																	else
																																		flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																		flash:setAlpha( 0.1 )
																																		flash:registerEventHandler( "transition_complete_keyframe", flashFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	flashFrame30( flash, event )
																																	return 
																																else
																																	flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																	flash:setAlpha( 1 )
																																	flash:registerEventHandler( "transition_complete_keyframe", flashFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																flashFrame29( flash, event )
																																return 
																															else
																																flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																flash:setAlpha( 0.1 )
																																flash:registerEventHandler( "transition_complete_keyframe", flashFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															flashFrame28( flash, event )
																															return 
																														else
																															flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																															flash:setAlpha( 1 )
																															flash:registerEventHandler( "transition_complete_keyframe", flashFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														flashFrame27( flash, event )
																														return 
																													else
																														flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														flash:setAlpha( 0.1 )
																														flash:registerEventHandler( "transition_complete_keyframe", flashFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													flashFrame26( flash, event )
																													return 
																												else
																													flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																													flash:setAlpha( 1 )
																													flash:registerEventHandler( "transition_complete_keyframe", flashFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												flashFrame25( flash, event )
																												return 
																											else
																												flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																												flash:setAlpha( 0.1 )
																												flash:registerEventHandler( "transition_complete_keyframe", flashFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											flashFrame24( flash, event )
																											return 
																										else
																											flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																											flash:setAlpha( 1 )
																											flash:registerEventHandler( "transition_complete_keyframe", flashFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										flashFrame23( flash, event )
																										return 
																									else
																										flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																										flash:setAlpha( 0.1 )
																										flash:registerEventHandler( "transition_complete_keyframe", flashFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									flashFrame22( flash, event )
																									return 
																								else
																									flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																									flash:setAlpha( 1 )
																									flash:registerEventHandler( "transition_complete_keyframe", flashFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								flashFrame21( flash, event )
																								return 
																							else
																								flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																								flash:setAlpha( 0.1 )
																								flash:registerEventHandler( "transition_complete_keyframe", flashFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							flashFrame20( flash, event )
																							return 
																						else
																							flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																							flash:setAlpha( 1 )
																							flash:registerEventHandler( "transition_complete_keyframe", flashFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						flashFrame19( flash, event )
																						return 
																					else
																						flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																						flash:setAlpha( 0.1 )
																						flash:registerEventHandler( "transition_complete_keyframe", flashFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					flashFrame18( flash, event )
																					return 
																				else
																					flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																					flash:setAlpha( 1 )
																					flash:registerEventHandler( "transition_complete_keyframe", flashFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				flashFrame17( flash, event )
																				return 
																			else
																				flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																				flash:setAlpha( 0.1 )
																				flash:registerEventHandler( "transition_complete_keyframe", flashFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			flashFrame16( flash, event )
																			return 
																		else
																			flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			flash:setAlpha( 1 )
																			flash:registerEventHandler( "transition_complete_keyframe", flashFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		flashFrame15( flash, event )
																		return 
																	else
																		flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																		flash:setAlpha( 0.1 )
																		flash:registerEventHandler( "transition_complete_keyframe", flashFrame15 )
																	end
																end
																
																if event.interrupted then
																	flashFrame14( flash, event )
																	return 
																else
																	flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	flash:setAlpha( 1 )
																	flash:registerEventHandler( "transition_complete_keyframe", flashFrame14 )
																end
															end
															
															if event.interrupted then
																flashFrame13( flash, event )
																return 
															else
																flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																flash:setAlpha( 0.1 )
																flash:registerEventHandler( "transition_complete_keyframe", flashFrame13 )
															end
														end
														
														if event.interrupted then
															flashFrame12( flash, event )
															return 
														else
															flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															flash:setAlpha( 1 )
															flash:registerEventHandler( "transition_complete_keyframe", flashFrame12 )
														end
													end
													
													if event.interrupted then
														flashFrame11( flash, event )
														return 
													else
														flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														flash:setAlpha( 0.1 )
														flash:registerEventHandler( "transition_complete_keyframe", flashFrame11 )
													end
												end
												
												if event.interrupted then
													flashFrame10( flash, event )
													return 
												else
													flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													flash:setAlpha( 1 )
													flash:registerEventHandler( "transition_complete_keyframe", flashFrame10 )
												end
											end
											
											if event.interrupted then
												flashFrame9( flash, event )
												return 
											else
												flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												flash:setAlpha( 0.1 )
												flash:registerEventHandler( "transition_complete_keyframe", flashFrame9 )
											end
										end
										
										if event.interrupted then
											flashFrame8( flash, event )
											return 
										else
											flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											flash:setAlpha( 1 )
											flash:registerEventHandler( "transition_complete_keyframe", flashFrame8 )
										end
									end
									
									if event.interrupted then
										flashFrame7( flash, event )
										return 
									else
										flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										flash:setAlpha( 0.1 )
										flash:registerEventHandler( "transition_complete_keyframe", flashFrame7 )
									end
								end
								
								if event.interrupted then
									flashFrame6( flash, event )
									return 
								else
									flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									flash:setAlpha( 1 )
									flash:registerEventHandler( "transition_complete_keyframe", flashFrame6 )
								end
							end
							
							if event.interrupted then
								flashFrame5( flash, event )
								return 
							else
								flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								flash:setAlpha( 0.1 )
								flash:registerEventHandler( "transition_complete_keyframe", flashFrame5 )
							end
						end
						
						if event.interrupted then
							flashFrame4( flash, event )
							return 
						else
							flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							flash:setAlpha( 1 )
							flash:registerEventHandler( "transition_complete_keyframe", flashFrame4 )
						end
					end
					
					if event.interrupted then
						flashFrame3( flash, event )
						return 
					else
						flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						flash:setAlpha( 0.1 )
						flash:registerEventHandler( "transition_complete_keyframe", flashFrame3 )
					end
				end
				
				flash:completeAnimation()
				self.flash:setAlpha( 1 )
				flashFrame2( flash, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

