-- 469b81e7f7a182ec54d4b9fe25f85f36
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Pixel05FX = InheritFrom( LUI.UIElement )
CoD.BM_Pixel05FX.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Pixel05FX )
	self.id = "BM_Pixel05FX"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 380 )
	self:setTopBottom( true, false, 0, 476 )
	
	local Pixels04 = LUI.UIImage.new()
	Pixels04:setLeftRight( true, false, 0, 380 )
	Pixels04:setTopBottom( true, false, 0, 476 )
	Pixels04:setAlpha( 0 )
	Pixels04:setImage( RegisterImage( "uie_t7_blackmarket_limited_circuits_dots1" ) )
	self:addElement( Pixels04 )
	self.Pixels04 = Pixels04
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, 14.83, 366 )
	mask:setTopBottom( true, false, 14.44, 463.17 )
	mask:setRGB( 0, 0, 0 )
	mask:setAlpha( 0 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_pixelanim_mask" ) )
	self:addElement( mask )
	self.mask = mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local Pixels04Frame2 = function ( Pixels04, event )
					local Pixels04Frame3 = function ( Pixels04, event )
						local Pixels04Frame4 = function ( Pixels04, event )
							local Pixels04Frame5 = function ( Pixels04, event )
								local Pixels04Frame6 = function ( Pixels04, event )
									local Pixels04Frame7 = function ( Pixels04, event )
										local Pixels04Frame8 = function ( Pixels04, event )
											local Pixels04Frame9 = function ( Pixels04, event )
												local Pixels04Frame10 = function ( Pixels04, event )
													local Pixels04Frame11 = function ( Pixels04, event )
														local Pixels04Frame12 = function ( Pixels04, event )
															local Pixels04Frame13 = function ( Pixels04, event )
																local Pixels04Frame14 = function ( Pixels04, event )
																	local Pixels04Frame15 = function ( Pixels04, event )
																		local Pixels04Frame16 = function ( Pixels04, event )
																			local Pixels04Frame17 = function ( Pixels04, event )
																				local Pixels04Frame18 = function ( Pixels04, event )
																					local Pixels04Frame19 = function ( Pixels04, event )
																						local Pixels04Frame20 = function ( Pixels04, event )
																							local Pixels04Frame21 = function ( Pixels04, event )
																								local Pixels04Frame22 = function ( Pixels04, event )
																									local Pixels04Frame23 = function ( Pixels04, event )
																										local Pixels04Frame24 = function ( Pixels04, event )
																											local Pixels04Frame25 = function ( Pixels04, event )
																												local Pixels04Frame26 = function ( Pixels04, event )
																													local Pixels04Frame27 = function ( Pixels04, event )
																														local Pixels04Frame28 = function ( Pixels04, event )
																															local Pixels04Frame29 = function ( Pixels04, event )
																																local Pixels04Frame30 = function ( Pixels04, event )
																																	local Pixels04Frame31 = function ( Pixels04, event )
																																		local Pixels04Frame32 = function ( Pixels04, event )
																																			local Pixels04Frame33 = function ( Pixels04, event )
																																				local Pixels04Frame34 = function ( Pixels04, event )
																																					local Pixels04Frame35 = function ( Pixels04, event )
																																						local Pixels04Frame36 = function ( Pixels04, event )
																																							local Pixels04Frame37 = function ( Pixels04, event )
																																								if not event.interrupted then
																																									Pixels04:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
																																								end
																																								Pixels04:setAlpha( 0 )
																																								if event.interrupted then
																																									self.clipFinished( Pixels04, event )
																																								else
																																									Pixels04:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								Pixels04Frame37( Pixels04, event )
																																								return 
																																							else
																																								Pixels04:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																								Pixels04:setAlpha( 0.46 )
																																								Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							Pixels04Frame36( Pixels04, event )
																																							return 
																																						else
																																							Pixels04:beginAnimation( "keyframe", 719, false, false, CoD.TweenType.Linear )
																																							Pixels04:setAlpha( 0 )
																																							Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						Pixels04Frame35( Pixels04, event )
																																						return 
																																					else
																																						Pixels04:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																						Pixels04:setAlpha( 1 )
																																						Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					Pixels04Frame34( Pixels04, event )
																																					return 
																																				else
																																					Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																					Pixels04:setAlpha( 0.36 )
																																					Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				Pixels04Frame33( Pixels04, event )
																																				return 
																																			else
																																				Pixels04:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																				Pixels04:setAlpha( 1 )
																																				Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			Pixels04Frame32( Pixels04, event )
																																			return 
																																		else
																																			Pixels04:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																			Pixels04:setAlpha( 0.47 )
																																			Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		Pixels04Frame31( Pixels04, event )
																																		return 
																																	else
																																		Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																		Pixels04:setAlpha( 1 )
																																		Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	Pixels04Frame30( Pixels04, event )
																																	return 
																																else
																																	Pixels04:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																	Pixels04:setAlpha( 0 )
																																	Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																Pixels04Frame29( Pixels04, event )
																																return 
																															else
																																Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																Pixels04:setAlpha( 1 )
																																Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															Pixels04Frame28( Pixels04, event )
																															return 
																														else
																															Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																															Pixels04:setAlpha( 0.37 )
																															Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														Pixels04Frame27( Pixels04, event )
																														return 
																													else
																														Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														Pixels04:setAlpha( 1 )
																														Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													Pixels04Frame26( Pixels04, event )
																													return 
																												else
																													Pixels04:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																													Pixels04:setAlpha( 0.31 )
																													Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												Pixels04Frame25( Pixels04, event )
																												return 
																											else
																												Pixels04:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																												Pixels04:setAlpha( 1 )
																												Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											Pixels04Frame24( Pixels04, event )
																											return 
																										else
																											Pixels04:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
																											Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										Pixels04Frame23( Pixels04, event )
																										return 
																									else
																										Pixels04:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
																										Pixels04:setAlpha( 0 )
																										Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									Pixels04Frame22( Pixels04, event )
																									return 
																								else
																									Pixels04:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									Pixels04:setAlpha( 1 )
																									Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								Pixels04Frame21( Pixels04, event )
																								return 
																							else
																								Pixels04:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																								Pixels04:setAlpha( 0.42 )
																								Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Pixels04Frame20( Pixels04, event )
																							return 
																						else
																							Pixels04:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																							Pixels04:setAlpha( 0 )
																							Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Pixels04Frame19( Pixels04, event )
																						return 
																					else
																						Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						Pixels04:setAlpha( 1 )
																						Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Pixels04Frame18( Pixels04, event )
																					return 
																				else
																					Pixels04:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																					Pixels04:setAlpha( 0.36 )
																					Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Pixels04Frame17( Pixels04, event )
																				return 
																			else
																				Pixels04:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																				Pixels04:setAlpha( 0.61 )
																				Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Pixels04Frame16( Pixels04, event )
																			return 
																		else
																			Pixels04:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
																			Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Pixels04Frame15( Pixels04, event )
																		return 
																	else
																		Pixels04:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Linear )
																		Pixels04:setAlpha( 0 )
																		Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame15 )
																	end
																end
																
																if event.interrupted then
																	Pixels04Frame14( Pixels04, event )
																	return 
																else
																	Pixels04:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																	Pixels04:setAlpha( 1 )
																	Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame14 )
																end
															end
															
															if event.interrupted then
																Pixels04Frame13( Pixels04, event )
																return 
															else
																Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																Pixels04:setAlpha( 0.36 )
																Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame13 )
															end
														end
														
														if event.interrupted then
															Pixels04Frame12( Pixels04, event )
															return 
														else
															Pixels04:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															Pixels04:setAlpha( 1 )
															Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame12 )
														end
													end
													
													if event.interrupted then
														Pixels04Frame11( Pixels04, event )
														return 
													else
														Pixels04:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
														Pixels04:setAlpha( 0.47 )
														Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame11 )
													end
												end
												
												if event.interrupted then
													Pixels04Frame10( Pixels04, event )
													return 
												else
													Pixels04:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Pixels04:setAlpha( 1 )
													Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame10 )
												end
											end
											
											if event.interrupted then
												Pixels04Frame9( Pixels04, event )
												return 
											else
												Pixels04:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												Pixels04:setAlpha( 0 )
												Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame9 )
											end
										end
										
										if event.interrupted then
											Pixels04Frame8( Pixels04, event )
											return 
										else
											Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Pixels04:setAlpha( 1 )
											Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame8 )
										end
									end
									
									if event.interrupted then
										Pixels04Frame7( Pixels04, event )
										return 
									else
										Pixels04:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Pixels04:setAlpha( 0.37 )
										Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame7 )
									end
								end
								
								if event.interrupted then
									Pixels04Frame6( Pixels04, event )
									return 
								else
									Pixels04:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									Pixels04:setAlpha( 1 )
									Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame6 )
								end
							end
							
							if event.interrupted then
								Pixels04Frame5( Pixels04, event )
								return 
							else
								Pixels04:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								Pixels04:setAlpha( 0.31 )
								Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame5 )
							end
						end
						
						if event.interrupted then
							Pixels04Frame4( Pixels04, event )
							return 
						else
							Pixels04:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Pixels04:setAlpha( 1 )
							Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame4 )
						end
					end
					
					if event.interrupted then
						Pixels04Frame3( Pixels04, event )
						return 
					else
						Pixels04:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame3 )
					end
				end
				
				Pixels04:completeAnimation()
				self.Pixels04:setAlpha( 0 )
				Pixels04Frame2( Pixels04, {} )

				mask:completeAnimation()
				self.mask:setAlpha( 0 )
				self.clipFinished( mask, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
