-- f07bd7ace4381b8e0569db64a4c308c5
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Loot_WomanInAction = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_WomanInAction.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_WomanInAction )
	self.id = "CallingCards_Loot_WomanInAction"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_womaninaction_bg1" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 480 )
	Image1:setTopBottom( true, false, 0, 120 )
	Image1:setImage( RegisterImage( "uie_t7_callingcard_womaninaction_bg2" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( true, false, -206.96, 84.96 )
	Glow0:setTopBottom( true, false, -87, 238.63 )
	Glow0:setRGB( 1, 0.93, 0.72 )
	Glow0:setZRot( 120 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							local Image1Frame5 = function ( Image1, event )
								local Image1Frame6 = function ( Image1, event )
									local Image1Frame7 = function ( Image1, event )
										local Image1Frame8 = function ( Image1, event )
											local Image1Frame9 = function ( Image1, event )
												local Image1Frame10 = function ( Image1, event )
													local Image1Frame11 = function ( Image1, event )
														local Image1Frame12 = function ( Image1, event )
															local Image1Frame13 = function ( Image1, event )
																local Image1Frame14 = function ( Image1, event )
																	local Image1Frame15 = function ( Image1, event )
																		local Image1Frame16 = function ( Image1, event )
																			local Image1Frame17 = function ( Image1, event )
																				local Image1Frame18 = function ( Image1, event )
																					local Image1Frame19 = function ( Image1, event )
																						local Image1Frame20 = function ( Image1, event )
																							local Image1Frame21 = function ( Image1, event )
																								local Image1Frame22 = function ( Image1, event )
																									local Image1Frame23 = function ( Image1, event )
																										local Image1Frame24 = function ( Image1, event )
																											local Image1Frame25 = function ( Image1, event )
																												if not event.interrupted then
																													Image1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																												end
																												Image1:setAlpha( 0 )
																												if event.interrupted then
																													self.clipFinished( Image1, event )
																												else
																													Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																												end
																											end
																											
																											if event.interrupted then
																												Image1Frame25( Image1, event )
																												return 
																											else
																												Image1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																												Image1:setAlpha( 1 )
																												Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											Image1Frame24( Image1, event )
																											return 
																										else
																											Image1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																											Image1:setAlpha( 0 )
																											Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										Image1Frame23( Image1, event )
																										return 
																									else
																										Image1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																										Image1:setAlpha( 1 )
																										Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									Image1Frame22( Image1, event )
																									return 
																								else
																									Image1:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
																									Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								Image1Frame21( Image1, event )
																								return 
																							else
																								Image1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								Image1:setAlpha( 0 )
																								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Image1Frame20( Image1, event )
																							return 
																						else
																							Image1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																							Image1:setAlpha( 1 )
																							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Image1Frame19( Image1, event )
																						return 
																					else
																						Image1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						Image1:setAlpha( 0 )
																						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Image1Frame18( Image1, event )
																					return 
																				else
																					Image1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																					Image1:setAlpha( 1 )
																					Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Image1Frame17( Image1, event )
																				return 
																			else
																				Image1:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
																				Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Image1Frame16( Image1, event )
																			return 
																		else
																			Image1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Image1:setAlpha( 0 )
																			Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Image1Frame15( Image1, event )
																		return 
																	else
																		Image1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																		Image1:setAlpha( 1 )
																		Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame15 )
																	end
																end
																
																if event.interrupted then
																	Image1Frame14( Image1, event )
																	return 
																else
																	Image1:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
																	Image1:setAlpha( 0 )
																	Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame14 )
																end
															end
															
															if event.interrupted then
																Image1Frame13( Image1, event )
																return 
															else
																Image1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																Image1:setAlpha( 1 )
																Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame13 )
															end
														end
														
														if event.interrupted then
															Image1Frame12( Image1, event )
															return 
														else
															Image1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															Image1:setAlpha( 0 )
															Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame12 )
														end
													end
													
													if event.interrupted then
														Image1Frame11( Image1, event )
														return 
													else
														Image1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														Image1:setAlpha( 1 )
														Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame11 )
													end
												end
												
												if event.interrupted then
													Image1Frame10( Image1, event )
													return 
												else
													Image1:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
													Image1:setAlpha( 0 )
													Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame10 )
												end
											end
											
											if event.interrupted then
												Image1Frame9( Image1, event )
												return 
											else
												Image1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Image1:setAlpha( 1 )
												Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame9 )
											end
										end
										
										if event.interrupted then
											Image1Frame8( Image1, event )
											return 
										else
											Image1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											Image1:setAlpha( 0 )
											Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame8 )
										end
									end
									
									if event.interrupted then
										Image1Frame7( Image1, event )
										return 
									else
										Image1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Image1:setAlpha( 1 )
										Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame7 )
									end
								end
								
								if event.interrupted then
									Image1Frame6( Image1, event )
									return 
								else
									Image1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Image1:setAlpha( 0 )
									Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame6 )
								end
							end
							
							if event.interrupted then
								Image1Frame5( Image1, event )
								return 
							else
								Image1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								Image1:setAlpha( 1 )
								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame5 )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Image1:setAlpha( 0 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Image1:setAlpha( 1 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									local Glow0Frame7 = function ( Glow0, event )
										local Glow0Frame8 = function ( Glow0, event )
											local Glow0Frame9 = function ( Glow0, event )
												local Glow0Frame10 = function ( Glow0, event )
													local Glow0Frame11 = function ( Glow0, event )
														local Glow0Frame12 = function ( Glow0, event )
															local Glow0Frame13 = function ( Glow0, event )
																local Glow0Frame14 = function ( Glow0, event )
																	local Glow0Frame15 = function ( Glow0, event )
																		local Glow0Frame16 = function ( Glow0, event )
																			local Glow0Frame17 = function ( Glow0, event )
																				local Glow0Frame18 = function ( Glow0, event )
																					local Glow0Frame19 = function ( Glow0, event )
																						local Glow0Frame20 = function ( Glow0, event )
																							local Glow0Frame21 = function ( Glow0, event )
																								local Glow0Frame22 = function ( Glow0, event )
																									local Glow0Frame23 = function ( Glow0, event )
																										local Glow0Frame24 = function ( Glow0, event )
																											local Glow0Frame25 = function ( Glow0, event )
																												if not event.interrupted then
																													Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																												end
																												Glow0:setAlpha( 0 )
																												if event.interrupted then
																													self.clipFinished( Glow0, event )
																												else
																													Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																												end
																											end
																											
																											if event.interrupted then
																												Glow0Frame25( Glow0, event )
																												return 
																											else
																												Glow0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																												Glow0:setAlpha( 1 )
																												Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											Glow0Frame24( Glow0, event )
																											return 
																										else
																											Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																											Glow0:setAlpha( 0.62 )
																											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										Glow0Frame23( Glow0, event )
																										return 
																									else
																										Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																										Glow0:setAlpha( 1 )
																										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									Glow0Frame22( Glow0, event )
																									return 
																								else
																									Glow0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
																									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								Glow0Frame21( Glow0, event )
																								return 
																							else
																								Glow0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																								Glow0:setAlpha( 0.61 )
																								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Glow0Frame20( Glow0, event )
																							return 
																						else
																							Glow0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																							Glow0:setAlpha( 1 )
																							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Glow0Frame19( Glow0, event )
																						return 
																					else
																						Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						Glow0:setAlpha( 0 )
																						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Glow0Frame18( Glow0, event )
																					return 
																				else
																					Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																					Glow0:setAlpha( 1 )
																					Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Glow0Frame17( Glow0, event )
																				return 
																			else
																				Glow0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
																				Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Glow0Frame16( Glow0, event )
																			return 
																		else
																			Glow0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Glow0:setAlpha( 0.36 )
																			Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Glow0Frame15( Glow0, event )
																		return 
																	else
																		Glow0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																		Glow0:setAlpha( 1 )
																		Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame15 )
																	end
																end
																
																if event.interrupted then
																	Glow0Frame14( Glow0, event )
																	return 
																else
																	Glow0:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
																	Glow0:setAlpha( 0 )
																	Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame14 )
																end
															end
															
															if event.interrupted then
																Glow0Frame13( Glow0, event )
																return 
															else
																Glow0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																Glow0:setAlpha( 1 )
																Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame13 )
															end
														end
														
														if event.interrupted then
															Glow0Frame12( Glow0, event )
															return 
														else
															Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															Glow0:setAlpha( 0.42 )
															Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame12 )
														end
													end
													
													if event.interrupted then
														Glow0Frame11( Glow0, event )
														return 
													else
														Glow0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														Glow0:setAlpha( 1 )
														Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame11 )
													end
												end
												
												if event.interrupted then
													Glow0Frame10( Glow0, event )
													return 
												else
													Glow0:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
													Glow0:setAlpha( 0 )
													Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame10 )
												end
											end
											
											if event.interrupted then
												Glow0Frame9( Glow0, event )
												return 
											else
												Glow0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Glow0:setAlpha( 1 )
												Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame9 )
											end
										end
										
										if event.interrupted then
											Glow0Frame8( Glow0, event )
											return 
										else
											Glow0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											Glow0:setAlpha( 0.67 )
											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame8 )
										end
									end
									
									if event.interrupted then
										Glow0Frame7( Glow0, event )
										return 
									else
										Glow0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Glow0:setAlpha( 1 )
										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame7 )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Glow0:setAlpha( 0.65 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								Glow0:setAlpha( 1 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 0.37 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

