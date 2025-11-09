require( "ui.uieditor.widgets.CallingCards.CallingCards_Specialist8bit_eyes" )

CoD.CallingCards_Specialist8bit_Reaper = InheritFrom( LUI.UIElement )
CoD.CallingCards_Specialist8bit_Reaper.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Specialist8bit_Reaper )
	self.id = "CallingCards_Specialist8bit_Reaper"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 371 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local arm = LUI.UIImage.new()
	arm:setLeftRight( true, false, 235, 367 )
	arm:setTopBottom( true, false, 0, 120 )
	arm:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_arm" ) )
	self:addElement( arm )
	self.arm = arm
	
	local body = LUI.UIImage.new()
	body:setLeftRight( true, false, 347, 431 )
	body:setTopBottom( true, false, 0, 120 )
	body:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_body" ) )
	self:addElement( body )
	self.body = body
	
	local spark = LUI.UIImage.new()
	spark:setLeftRight( true, false, 60, 276 )
	spark:setTopBottom( true, false, 30, 114 )
	spark:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_sparks" ) )
	self:addElement( spark )
	self.spark = spark
	
	local spark2 = LUI.UIImage.new()
	spark2:setLeftRight( true, false, 60, 276 )
	spark2:setTopBottom( true, false, 35, 119 )
	spark2:setAlpha( 0 )
	spark2:setYRot( 180 )
	spark2:setZRot( 180 )
	spark2:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_sparks" ) )
	self:addElement( spark2 )
	self.spark2 = spark2
	
	local eyeswidget = CoD.CallingCards_Specialist8bit_eyes.new( menu, controller )
	eyeswidget:setLeftRight( true, false, 359, 395 )
	eyeswidget:setTopBottom( true, false, 14, 38 )
	self:addElement( eyeswidget )
	self.eyeswidget = eyeswidget
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 73, 289 )
	Image0:setTopBottom( true, false, 28, 112 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_bullet1" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 73, 289 )
	Image1:setTopBottom( true, false, 28, 112 )
	Image1:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_bullet2" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 73, 289 )
	Image2:setTopBottom( true, false, 28, 112 )
	Image2:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_bullet3" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 73, 289 )
	Image3:setTopBottom( true, false, 28, 112 )
	Image3:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_bullet4" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				local armFrame2 = function ( arm, event )
					local armFrame3 = function ( arm, event )
						local armFrame4 = function ( arm, event )
							local armFrame5 = function ( arm, event )
								local armFrame6 = function ( arm, event )
									local armFrame7 = function ( arm, event )
										local armFrame8 = function ( arm, event )
											local armFrame9 = function ( arm, event )
												local armFrame10 = function ( arm, event )
													local armFrame11 = function ( arm, event )
														local armFrame12 = function ( arm, event )
															local armFrame13 = function ( arm, event )
																local armFrame14 = function ( arm, event )
																	local armFrame15 = function ( arm, event )
																		local armFrame16 = function ( arm, event )
																			local armFrame17 = function ( arm, event )
																				local armFrame18 = function ( arm, event )
																					local armFrame19 = function ( arm, event )
																						local armFrame20 = function ( arm, event )
																							local armFrame21 = function ( arm, event )
																								if not event.interrupted then
																									arm:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								end
																								arm:setLeftRight( true, false, 235, 367 )
																								arm:setTopBottom( true, false, 0, 120 )
																								if event.interrupted then
																									self.clipFinished( arm, event )
																								else
																									arm:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																								end
																							end
																							
																							if event.interrupted then
																								armFrame21( arm, event )
																								return 
																							else
																								arm:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																								arm:registerEventHandler( "transition_complete_keyframe", armFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							armFrame20( arm, event )
																							return 
																						else
																							arm:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																							arm:registerEventHandler( "transition_complete_keyframe", armFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						armFrame19( arm, event )
																						return 
																					else
																						arm:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																						arm:setTopBottom( true, false, 5, 125 )
																						arm:registerEventHandler( "transition_complete_keyframe", armFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					armFrame18( arm, event )
																					return 
																				else
																					arm:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					arm:setTopBottom( true, false, 0, 120 )
																					arm:registerEventHandler( "transition_complete_keyframe", armFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				armFrame17( arm, event )
																				return 
																			else
																				arm:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																				arm:registerEventHandler( "transition_complete_keyframe", armFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			armFrame16( arm, event )
																			return 
																		else
																			arm:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																			arm:registerEventHandler( "transition_complete_keyframe", armFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		armFrame15( arm, event )
																		return 
																	else
																		arm:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																		arm:setTopBottom( true, false, 5, 125 )
																		arm:registerEventHandler( "transition_complete_keyframe", armFrame15 )
																	end
																end
																
																if event.interrupted then
																	armFrame14( arm, event )
																	return 
																else
																	arm:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	arm:setTopBottom( true, false, 0, 120 )
																	arm:registerEventHandler( "transition_complete_keyframe", armFrame14 )
																end
															end
															
															if event.interrupted then
																armFrame13( arm, event )
																return 
															else
																arm:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																arm:registerEventHandler( "transition_complete_keyframe", armFrame13 )
															end
														end
														
														if event.interrupted then
															armFrame12( arm, event )
															return 
														else
															arm:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															arm:registerEventHandler( "transition_complete_keyframe", armFrame12 )
														end
													end
													
													if event.interrupted then
														armFrame11( arm, event )
														return 
													else
														arm:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
														arm:setTopBottom( true, false, 5, 125 )
														arm:registerEventHandler( "transition_complete_keyframe", armFrame11 )
													end
												end
												
												if event.interrupted then
													armFrame10( arm, event )
													return 
												else
													arm:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													arm:setTopBottom( true, false, 0, 120 )
													arm:registerEventHandler( "transition_complete_keyframe", armFrame10 )
												end
											end
											
											if event.interrupted then
												armFrame9( arm, event )
												return 
											else
												arm:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
												arm:registerEventHandler( "transition_complete_keyframe", armFrame9 )
											end
										end
										
										if event.interrupted then
											armFrame8( arm, event )
											return 
										else
											arm:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											arm:registerEventHandler( "transition_complete_keyframe", armFrame8 )
										end
									end
									
									if event.interrupted then
										armFrame7( arm, event )
										return 
									else
										arm:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
										arm:setTopBottom( true, false, 5, 125 )
										arm:registerEventHandler( "transition_complete_keyframe", armFrame7 )
									end
								end
								
								if event.interrupted then
									armFrame6( arm, event )
									return 
								else
									arm:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									arm:setTopBottom( true, false, 0, 120 )
									arm:registerEventHandler( "transition_complete_keyframe", armFrame6 )
								end
							end
							
							if event.interrupted then
								armFrame5( arm, event )
								return 
							else
								arm:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								arm:registerEventHandler( "transition_complete_keyframe", armFrame5 )
							end
						end
						
						if event.interrupted then
							armFrame4( arm, event )
							return 
						else
							arm:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							arm:registerEventHandler( "transition_complete_keyframe", armFrame4 )
						end
					end
					
					if event.interrupted then
						armFrame3( arm, event )
						return 
					else
						arm:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						arm:setTopBottom( true, false, 5, 125 )
						arm:registerEventHandler( "transition_complete_keyframe", armFrame3 )
					end
				end
				
				arm:completeAnimation()
				self.arm:setLeftRight( true, false, 235, 367 )
				self.arm:setTopBottom( true, false, 0, 120 )
				armFrame2( arm, {} )
				body:completeAnimation()
				self.body:setLeftRight( true, false, 347, 431 )
				self.body:setTopBottom( true, false, 0, 120 )
				self.clipFinished( body, {} )
				local sparkFrame2 = function ( spark, event )
					local sparkFrame3 = function ( spark, event )
						local sparkFrame4 = function ( spark, event )
							local sparkFrame5 = function ( spark, event )
								local sparkFrame6 = function ( spark, event )
									local sparkFrame7 = function ( spark, event )
										local sparkFrame8 = function ( spark, event )
											local sparkFrame9 = function ( spark, event )
												local sparkFrame10 = function ( spark, event )
													local sparkFrame11 = function ( spark, event )
														if not event.interrupted then
															spark:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
														end
														spark:setLeftRight( true, false, 60, 276 )
														spark:setTopBottom( true, false, 34, 118 )
														spark:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( spark, event )
														else
															spark:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														sparkFrame11( spark, event )
														return 
													else
														spark:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
														spark:setAlpha( 1 )
														spark:registerEventHandler( "transition_complete_keyframe", sparkFrame11 )
													end
												end
												
												if event.interrupted then
													sparkFrame10( spark, event )
													return 
												else
													spark:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													spark:registerEventHandler( "transition_complete_keyframe", sparkFrame10 )
												end
											end
											
											if event.interrupted then
												sparkFrame9( spark, event )
												return 
											else
												spark:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
												spark:registerEventHandler( "transition_complete_keyframe", sparkFrame9 )
											end
										end
										
										if event.interrupted then
											sparkFrame8( spark, event )
											return 
										else
											spark:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											spark:setAlpha( 0 )
											spark:registerEventHandler( "transition_complete_keyframe", sparkFrame8 )
										end
									end
									
									if event.interrupted then
										sparkFrame7( spark, event )
										return 
									else
										spark:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										spark:setAlpha( 1 )
										spark:registerEventHandler( "transition_complete_keyframe", sparkFrame7 )
									end
								end
								
								if event.interrupted then
									sparkFrame6( spark, event )
									return 
								else
									spark:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									spark:registerEventHandler( "transition_complete_keyframe", sparkFrame6 )
								end
							end
							
							if event.interrupted then
								sparkFrame5( spark, event )
								return 
							else
								spark:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								spark:registerEventHandler( "transition_complete_keyframe", sparkFrame5 )
							end
						end
						
						if event.interrupted then
							sparkFrame4( spark, event )
							return 
						else
							spark:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							spark:setAlpha( 0 )
							spark:registerEventHandler( "transition_complete_keyframe", sparkFrame4 )
						end
					end
					
					if event.interrupted then
						sparkFrame3( spark, event )
						return 
					else
						spark:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						spark:setAlpha( 1 )
						spark:registerEventHandler( "transition_complete_keyframe", sparkFrame3 )
					end
				end
				
				spark:completeAnimation()
				self.spark:setLeftRight( true, false, 60, 276 )
				self.spark:setTopBottom( true, false, 34, 118 )
				self.spark:setAlpha( 0 )
				sparkFrame2( spark, {} )
				local spark2Frame2 = function ( spark2, event )
					local spark2Frame3 = function ( spark2, event )
						local spark2Frame4 = function ( spark2, event )
							local spark2Frame5 = function ( spark2, event )
								local spark2Frame6 = function ( spark2, event )
									local spark2Frame7 = function ( spark2, event )
										local spark2Frame8 = function ( spark2, event )
											if not event.interrupted then
												spark2:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
											end
											spark2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( spark2, event )
											else
												spark2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											spark2Frame8( spark2, event )
											return 
										else
											spark2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											spark2:setAlpha( 0 )
											spark2:registerEventHandler( "transition_complete_keyframe", spark2Frame8 )
										end
									end
									
									if event.interrupted then
										spark2Frame7( spark2, event )
										return 
									else
										spark2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										spark2:setAlpha( 1 )
										spark2:registerEventHandler( "transition_complete_keyframe", spark2Frame7 )
									end
								end
								
								if event.interrupted then
									spark2Frame6( spark2, event )
									return 
								else
									spark2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									spark2:registerEventHandler( "transition_complete_keyframe", spark2Frame6 )
								end
							end
							
							if event.interrupted then
								spark2Frame5( spark2, event )
								return 
							else
								spark2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								spark2:setAlpha( 0 )
								spark2:registerEventHandler( "transition_complete_keyframe", spark2Frame5 )
							end
						end
						
						if event.interrupted then
							spark2Frame4( spark2, event )
							return 
						else
							spark2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							spark2:setAlpha( 1 )
							spark2:registerEventHandler( "transition_complete_keyframe", spark2Frame4 )
						end
					end
					
					if event.interrupted then
						spark2Frame3( spark2, event )
						return 
					else
						spark2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						spark2:registerEventHandler( "transition_complete_keyframe", spark2Frame3 )
					end
				end
				
				spark2:completeAnimation()
				self.spark2:setAlpha( 0 )
				spark2Frame2( spark2, {} )
				eyeswidget:completeAnimation()
				self.eyeswidget:setLeftRight( true, false, 359, 395 )
				self.eyeswidget:setTopBottom( true, false, 14, 38 )
				self.eyeswidget:setAlpha( 1 )
				self.clipFinished( eyeswidget, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									local Image0Frame7 = function ( Image0, event )
										local Image0Frame8 = function ( Image0, event )
											if not event.interrupted then
												Image0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
											end
											Image0:setLeftRight( true, false, 26.7, 242.7 )
											Image0:setTopBottom( true, false, 28, 112 )
											Image0:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Image0, event )
											else
												Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Image0Frame8( Image0, event )
											return 
										else
											Image0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											Image0:setLeftRight( true, false, -113.26, 102.74 )
											Image0:setAlpha( 0 )
											Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame8 )
										end
									end
									
									if event.interrupted then
										Image0Frame7( Image0, event )
										return 
									else
										Image0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
										Image0:setLeftRight( true, false, -150.09, 65.91 )
										Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame7 )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									Image0:setLeftRight( true, false, 93, 309 )
									Image0:setAlpha( 1 )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
								Image0:setLeftRight( true, false, 68.69, 284.69 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Image0:setLeftRight( true, false, -119.7, 96.3 )
							Image0:setAlpha( 0 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( true, false, -150.09, 65.91 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, -127.99, 88.01 )
				self.Image0:setTopBottom( true, false, 28, 112 )
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
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
																												local Image1Frame26 = function ( Image1, event )
																													local Image1Frame27 = function ( Image1, event )
																														local Image1Frame28 = function ( Image1, event )
																															if not event.interrupted then
																																Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															end
																															Image1:setLeftRight( true, false, -152, 64 )
																															Image1:setTopBottom( true, false, 28, 112 )
																															Image1:setAlpha( 0 )
																															if event.interrupted then
																																self.clipFinished( Image1, event )
																															else
																																Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																															end
																														end
																														
																														if event.interrupted then
																															Image1Frame28( Image1, event )
																															return 
																														else
																															Image1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																															Image1:setLeftRight( true, false, -152, 64 )
																															Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														Image1Frame27( Image1, event )
																														return 
																													else
																														Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														Image1:setLeftRight( true, false, 73, 289 )
																														Image1:setAlpha( 1 )
																														Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													Image1Frame26( Image1, event )
																													return 
																												else
																													Image1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																													Image1:setLeftRight( true, false, 50.5, 266.5 )
																													Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												Image1Frame25( Image1, event )
																												return 
																											else
																												Image1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												Image1:setLeftRight( true, false, -129.5, 86.5 )
																												Image1:setAlpha( 0 )
																												Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											Image1Frame24( Image1, event )
																											return 
																										else
																											Image1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																											Image1:setLeftRight( true, false, -152, 64 )
																											Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										Image1Frame23( Image1, event )
																										return 
																									else
																										Image1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																										Image1:setLeftRight( true, false, 73, 289 )
																										Image1:setAlpha( 1 )
																										Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									Image1Frame22( Image1, event )
																									return 
																								else
																									Image1:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																									Image1:setLeftRight( true, false, 52.55, 268.55 )
																									Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								Image1Frame21( Image1, event )
																								return 
																							else
																								Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								Image1:setLeftRight( true, false, -131.55, 84.45 )
																								Image1:setAlpha( 0 )
																								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Image1Frame20( Image1, event )
																							return 
																						else
																							Image1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																							Image1:setLeftRight( true, false, -152, 64 )
																							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Image1Frame19( Image1, event )
																						return 
																					else
																						Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						Image1:setLeftRight( true, false, 73, 289 )
																						Image1:setAlpha( 1 )
																						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Image1Frame18( Image1, event )
																					return 
																				else
																					Image1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																					Image1:setLeftRight( true, false, 50.5, 266.5 )
																					Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Image1Frame17( Image1, event )
																				return 
																			else
																				Image1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				Image1:setLeftRight( true, false, -129.5, 86.5 )
																				Image1:setAlpha( 0 )
																				Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Image1Frame16( Image1, event )
																			return 
																		else
																			Image1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Image1:setLeftRight( true, false, -152, 64 )
																			Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Image1Frame15( Image1, event )
																		return 
																	else
																		Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		Image1:setLeftRight( true, false, 73, 289 )
																		Image1:setAlpha( 1 )
																		Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame15 )
																	end
																end
																
																if event.interrupted then
																	Image1Frame14( Image1, event )
																	return 
																else
																	Image1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																	Image1:setLeftRight( true, false, 54.25, 270.25 )
																	Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame14 )
																end
															end
															
															if event.interrupted then
																Image1Frame13( Image1, event )
																return 
															else
																Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Image1:setLeftRight( true, false, -133.25, 82.75 )
																Image1:setAlpha( 0 )
																Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame13 )
															end
														end
														
														if event.interrupted then
															Image1Frame12( Image1, event )
															return 
														else
															Image1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															Image1:setLeftRight( true, false, -152, 64 )
															Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame12 )
														end
													end
													
													if event.interrupted then
														Image1Frame11( Image1, event )
														return 
													else
														Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Image1:setLeftRight( true, false, 73, 289 )
														Image1:setAlpha( 1 )
														Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame11 )
													end
												end
												
												if event.interrupted then
													Image1Frame10( Image1, event )
													return 
												else
													Image1:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
													Image1:setLeftRight( true, false, 50.5, 266.5 )
													Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame10 )
												end
											end
											
											if event.interrupted then
												Image1Frame9( Image1, event )
												return 
											else
												Image1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Image1:setLeftRight( true, false, -129.5, 86.5 )
												Image1:setAlpha( 0 )
												Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame9 )
											end
										end
										
										if event.interrupted then
											Image1Frame8( Image1, event )
											return 
										else
											Image1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											Image1:setLeftRight( true, false, -152, 64 )
											Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame8 )
										end
									end
									
									if event.interrupted then
										Image1Frame7( Image1, event )
										return 
									else
										Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Image1:setLeftRight( true, false, 73, 289 )
										Image1:setAlpha( 1 )
										Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame7 )
									end
								end
								
								if event.interrupted then
									Image1Frame6( Image1, event )
									return 
								else
									Image1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									Image1:setLeftRight( true, false, 50.5, 266.5 )
									Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame6 )
								end
							end
							
							if event.interrupted then
								Image1Frame5( Image1, event )
								return 
							else
								Image1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Image1:setLeftRight( true, false, -129.5, 86.5 )
								Image1:setAlpha( 0 )
								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame5 )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Image1:setLeftRight( true, false, -152, 64 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Image1:setAlpha( 1 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( true, false, 73, 289 )
				self.Image1:setTopBottom( true, false, 28, 112 )
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							local Image2Frame5 = function ( Image2, event )
								local Image2Frame6 = function ( Image2, event )
									local Image2Frame7 = function ( Image2, event )
										local Image2Frame8 = function ( Image2, event )
											if not event.interrupted then
												Image2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											Image2:setLeftRight( true, false, 136, 352 )
											Image2:setTopBottom( true, false, 28, 112 )
											Image2:setAlpha( 1 )
											if event.interrupted then
												self.clipFinished( Image2, event )
											else
												Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Image2Frame8( Image2, event )
											return 
										else
											Image2:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
											Image2:setLeftRight( true, false, 128.78, 344.78 )
											Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame8 )
										end
									end
									
									if event.interrupted then
										Image2Frame7( Image2, event )
										return 
									else
										Image2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Image2:setLeftRight( true, false, -87.78, 128.22 )
										Image2:setAlpha( 0 )
										Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame7 )
									end
								end
								
								if event.interrupted then
									Image2Frame6( Image2, event )
									return 
								else
									Image2:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
									Image2:setAlpha( 0.02 )
									Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame6 )
								end
							end
							
							if event.interrupted then
								Image2Frame5( Image2, event )
								return 
							else
								Image2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								Image2:setLeftRight( true, false, -95, 121 )
								Image2:setAlpha( 0.84 )
								Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame5 )
							end
						end
						
						if event.interrupted then
							Image2Frame4( Image2, event )
							return 
						else
							Image2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Image2:setLeftRight( true, false, 136, 352 )
							Image2:setAlpha( 1 )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Image2:setLeftRight( true, false, 121.39, 337.39 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( true, false, -10.14, 205.86 )
				self.Image2:setTopBottom( true, false, 28, 112 )
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						local Image3Frame4 = function ( Image3, event )
							local Image3Frame5 = function ( Image3, event )
								local Image3Frame6 = function ( Image3, event )
									local Image3Frame7 = function ( Image3, event )
										local Image3Frame8 = function ( Image3, event )
											local Image3Frame9 = function ( Image3, event )
												local Image3Frame10 = function ( Image3, event )
													local Image3Frame11 = function ( Image3, event )
														local Image3Frame12 = function ( Image3, event )
															local Image3Frame13 = function ( Image3, event )
																local Image3Frame14 = function ( Image3, event )
																	local Image3Frame15 = function ( Image3, event )
																		local Image3Frame16 = function ( Image3, event )
																			local Image3Frame17 = function ( Image3, event )
																				if not event.interrupted then
																					Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				end
																				Image3:setLeftRight( true, false, 105, 321 )
																				Image3:setTopBottom( true, false, 28, 112 )
																				Image3:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( Image3, event )
																				else
																					Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				Image3Frame17( Image3, event )
																				return 
																			else
																				Image3:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																				Image3:setLeftRight( true, false, 85.54, 301.54 )
																				Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Image3Frame16( Image3, event )
																			return 
																		else
																			Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			Image3:setLeftRight( true, false, -128.54, 87.46 )
																			Image3:setAlpha( 0 )
																			Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Image3Frame15( Image3, event )
																		return 
																	else
																		Image3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																		Image3:setLeftRight( true, false, -148, 68 )
																		Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame15 )
																	end
																end
																
																if event.interrupted then
																	Image3Frame14( Image3, event )
																	return 
																else
																	Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	Image3:setLeftRight( true, false, 105, 321 )
																	Image3:setAlpha( 1 )
																	Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame14 )
																end
															end
															
															if event.interrupted then
																Image3Frame13( Image3, event )
																return 
															else
																Image3:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																Image3:setLeftRight( true, false, 85.54, 301.54 )
																Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame13 )
															end
														end
														
														if event.interrupted then
															Image3Frame12( Image3, event )
															return 
														else
															Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															Image3:setLeftRight( true, false, -128.54, 87.46 )
															Image3:setAlpha( 0 )
															Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame12 )
														end
													end
													
													if event.interrupted then
														Image3Frame11( Image3, event )
														return 
													else
														Image3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
														Image3:setLeftRight( true, false, -148, 68 )
														Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame11 )
													end
												end
												
												if event.interrupted then
													Image3Frame10( Image3, event )
													return 
												else
													Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Image3:setLeftRight( true, false, 105, 321 )
													Image3:setAlpha( 1 )
													Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame10 )
												end
											end
											
											if event.interrupted then
												Image3Frame9( Image3, event )
												return 
											else
												Image3:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												Image3:setLeftRight( true, false, 85.54, 301.54 )
												Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame9 )
											end
										end
										
										if event.interrupted then
											Image3Frame8( Image3, event )
											return 
										else
											Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Image3:setLeftRight( true, false, -128.54, 87.46 )
											Image3:setAlpha( 0 )
											Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame8 )
										end
									end
									
									if event.interrupted then
										Image3Frame7( Image3, event )
										return 
									else
										Image3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										Image3:setLeftRight( true, false, -148, 68 )
										Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame7 )
									end
								end
								
								if event.interrupted then
									Image3Frame6( Image3, event )
									return 
								else
									Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Image3:setLeftRight( true, false, 105, 321 )
									Image3:setAlpha( 1 )
									Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame6 )
								end
							end
							
							if event.interrupted then
								Image3Frame5( Image3, event )
								return 
							else
								Image3:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								Image3:setLeftRight( true, false, 85.54, 301.54 )
								Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame5 )
							end
						end
						
						if event.interrupted then
							Image3Frame4( Image3, event )
							return 
						else
							Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Image3:setLeftRight( true, false, -128.54, 87.46 )
							Image3:setAlpha( 0 )
							Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame4 )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
						Image3:setLeftRight( true, false, -148, 68 )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( true, false, -109.76, 106.24 )
				self.Image3:setTopBottom( true, false, 28, 112 )
				self.Image3:setAlpha( 1 )
				Image3Frame2( Image3, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.eyeswidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

