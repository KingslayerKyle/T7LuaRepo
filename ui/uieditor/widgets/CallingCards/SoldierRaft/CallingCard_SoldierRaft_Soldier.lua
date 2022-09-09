-- d914db72ef1d38753ad5b995b3554e76
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.SoldierRaft.CallingCard_SoldierRaft_Flag" )

CoD.CallingCard_SoldierRaft_Soldier = InheritFrom( LUI.UIElement )
CoD.CallingCard_SoldierRaft_Soldier.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_SoldierRaft_Soldier )
	self.id = "CallingCard_SoldierRaft_Soldier"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Flag = CoD.CallingCard_SoldierRaft_Flag.new( menu, controller )
	Flag:setLeftRight( true, false, 66, 126 )
	Flag:setTopBottom( true, false, -5, 55 )
	self:addElement( Flag )
	self.Flag = Flag
	
	local Soldier = LUI.UIImage.new()
	Soldier:setLeftRight( true, false, 0, 120 )
	Soldier:setTopBottom( true, false, 0, 120 )
	Soldier:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_body" ) )
	self:addElement( Soldier )
	self.Soldier = Soldier
	
	local Arm = LUI.UIImage.new()
	Arm:setLeftRight( true, false, 26, 56 )
	Arm:setTopBottom( true, false, 17, 77 )
	Arm:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_arm" ) )
	self:addElement( Arm )
	self.Arm = Arm
	
	local Leg = LUI.UIImage.new()
	Leg:setLeftRight( true, false, 5.5, 65.5 )
	Leg:setTopBottom( true, false, 47.75, 107.75 )
	Leg:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_leg" ) )
	self:addElement( Leg )
	self.Leg = Leg
	
	local Flash = LUI.UIImage.new()
	Flash:setLeftRight( true, false, 15, 45 )
	Flash:setTopBottom( true, false, -22, 38 )
	Flash:setAlpha( 0 )
	Flash:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_muzzle" ) )
	self:addElement( Flash )
	self.Flash = Flash
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local ArmFrame2 = function ( Arm, event )
					local ArmFrame3 = function ( Arm, event )
						local ArmFrame4 = function ( Arm, event )
							local ArmFrame5 = function ( Arm, event )
								local ArmFrame6 = function ( Arm, event )
									local ArmFrame7 = function ( Arm, event )
										local ArmFrame8 = function ( Arm, event )
											local ArmFrame9 = function ( Arm, event )
												local ArmFrame10 = function ( Arm, event )
													local ArmFrame11 = function ( Arm, event )
														local ArmFrame12 = function ( Arm, event )
															local ArmFrame13 = function ( Arm, event )
																local ArmFrame14 = function ( Arm, event )
																	local ArmFrame15 = function ( Arm, event )
																		local ArmFrame16 = function ( Arm, event )
																			local ArmFrame17 = function ( Arm, event )
																				local ArmFrame18 = function ( Arm, event )
																					local ArmFrame19 = function ( Arm, event )
																						local ArmFrame20 = function ( Arm, event )
																							local ArmFrame21 = function ( Arm, event )
																								local ArmFrame22 = function ( Arm, event )
																									local ArmFrame23 = function ( Arm, event )
																										local ArmFrame24 = function ( Arm, event )
																											local ArmFrame25 = function ( Arm, event )
																												local ArmFrame26 = function ( Arm, event )
																													local ArmFrame27 = function ( Arm, event )
																														local ArmFrame28 = function ( Arm, event )
																															local ArmFrame29 = function ( Arm, event )
																																local ArmFrame30 = function ( Arm, event )
																																	local ArmFrame31 = function ( Arm, event )
																																		if not event.interrupted then
																																			Arm:beginAnimation( "keyframe", 8000, false, false, CoD.TweenType.Linear )
																																		end
																																		Arm:setLeftRight( true, false, 26, 56 )
																																		Arm:setTopBottom( true, false, 17, 77 )
																																		if event.interrupted then
																																			self.clipFinished( Arm, event )
																																		else
																																			Arm:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ArmFrame31( Arm, event )
																																		return 
																																	else
																																		Arm:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
																																		Arm:setTopBottom( true, false, 17, 77 )
																																		Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ArmFrame30( Arm, event )
																																	return 
																																else
																																	Arm:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
																																	Arm:setTopBottom( true, false, 17.75, 77.75 )
																																	Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ArmFrame29( Arm, event )
																																return 
																															else
																																Arm:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																																Arm:setTopBottom( true, false, 17, 77 )
																																Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ArmFrame28( Arm, event )
																															return 
																														else
																															Arm:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																															Arm:setTopBottom( true, false, 17.75, 77.75 )
																															Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ArmFrame27( Arm, event )
																														return 
																													else
																														Arm:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																														Arm:setTopBottom( true, false, 17, 77 )
																														Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ArmFrame26( Arm, event )
																													return 
																												else
																													Arm:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																													Arm:setTopBottom( true, false, 17.75, 77.75 )
																													Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ArmFrame25( Arm, event )
																												return 
																											else
																												Arm:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																												Arm:setTopBottom( true, false, 17, 77 )
																												Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ArmFrame24( Arm, event )
																											return 
																										else
																											Arm:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																											Arm:setTopBottom( true, false, 17.75, 77.75 )
																											Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ArmFrame23( Arm, event )
																										return 
																									else
																										Arm:beginAnimation( "keyframe", 8159, false, false, CoD.TweenType.Linear )
																										Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ArmFrame22( Arm, event )
																									return 
																								else
																									Arm:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																									Arm:setTopBottom( true, false, 17, 77 )
																									Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ArmFrame21( Arm, event )
																								return 
																							else
																								Arm:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																								Arm:setTopBottom( true, false, 17.75, 77.75 )
																								Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ArmFrame20( Arm, event )
																							return 
																						else
																							Arm:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																							Arm:setTopBottom( true, false, 17, 77 )
																							Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ArmFrame19( Arm, event )
																						return 
																					else
																						Arm:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																						Arm:setTopBottom( true, false, 17.75, 77.75 )
																						Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ArmFrame18( Arm, event )
																					return 
																				else
																					Arm:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																					Arm:setTopBottom( true, false, 17, 77 )
																					Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ArmFrame17( Arm, event )
																				return 
																			else
																				Arm:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																				Arm:setTopBottom( true, false, 17.75, 77.75 )
																				Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ArmFrame16( Arm, event )
																			return 
																		else
																			Arm:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																			Arm:setTopBottom( true, false, 17, 77 )
																			Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ArmFrame15( Arm, event )
																		return 
																	else
																		Arm:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																		Arm:setTopBottom( true, false, 17.75, 77.75 )
																		Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame15 )
																	end
																end
																
																if event.interrupted then
																	ArmFrame14( Arm, event )
																	return 
																else
																	Arm:beginAnimation( "keyframe", 4930, false, false, CoD.TweenType.Linear )
																	Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame14 )
																end
															end
															
															if event.interrupted then
																ArmFrame13( Arm, event )
																return 
															else
																Arm:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																Arm:setTopBottom( true, false, 17, 77 )
																Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame13 )
															end
														end
														
														if event.interrupted then
															ArmFrame12( Arm, event )
															return 
														else
															Arm:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
															Arm:setTopBottom( true, false, 17.75, 77.75 )
															Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame12 )
														end
													end
													
													if event.interrupted then
														ArmFrame11( Arm, event )
														return 
													else
														Arm:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
														Arm:setTopBottom( true, false, 17, 77 )
														Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame11 )
													end
												end
												
												if event.interrupted then
													ArmFrame10( Arm, event )
													return 
												else
													Arm:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													Arm:setTopBottom( true, false, 17.75, 77.75 )
													Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame10 )
												end
											end
											
											if event.interrupted then
												ArmFrame9( Arm, event )
												return 
											else
												Arm:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												Arm:setTopBottom( true, false, 17, 77 )
												Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame9 )
											end
										end
										
										if event.interrupted then
											ArmFrame8( Arm, event )
											return 
										else
											Arm:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
											Arm:setTopBottom( true, false, 17.75, 77.75 )
											Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame8 )
										end
									end
									
									if event.interrupted then
										ArmFrame7( Arm, event )
										return 
									else
										Arm:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
										Arm:setTopBottom( true, false, 17, 77 )
										Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame7 )
									end
								end
								
								if event.interrupted then
									ArmFrame6( Arm, event )
									return 
								else
									Arm:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									Arm:setTopBottom( true, false, 17.75, 77.75 )
									Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame6 )
								end
							end
							
							if event.interrupted then
								ArmFrame5( Arm, event )
								return 
							else
								Arm:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								Arm:setTopBottom( true, false, 17, 77 )
								Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame5 )
							end
						end
						
						if event.interrupted then
							ArmFrame4( Arm, event )
							return 
						else
							Arm:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							Arm:setTopBottom( true, false, 17.75, 77.75 )
							Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame4 )
						end
					end
					
					if event.interrupted then
						ArmFrame3( Arm, event )
						return 
					else
						Arm:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Arm:registerEventHandler( "transition_complete_keyframe", ArmFrame3 )
					end
				end
				
				Arm:completeAnimation()
				self.Arm:setLeftRight( true, false, 26, 56 )
				self.Arm:setTopBottom( true, false, 17, 77 )
				ArmFrame2( Arm, {} )
				local FlashFrame2 = function ( Flash, event )
					local FlashFrame3 = function ( Flash, event )
						local FlashFrame4 = function ( Flash, event )
							local FlashFrame5 = function ( Flash, event )
								local FlashFrame6 = function ( Flash, event )
									local FlashFrame7 = function ( Flash, event )
										local FlashFrame8 = function ( Flash, event )
											local FlashFrame9 = function ( Flash, event )
												local FlashFrame10 = function ( Flash, event )
													local FlashFrame11 = function ( Flash, event )
														local FlashFrame12 = function ( Flash, event )
															local FlashFrame13 = function ( Flash, event )
																local FlashFrame14 = function ( Flash, event )
																	local FlashFrame15 = function ( Flash, event )
																		local FlashFrame16 = function ( Flash, event )
																			local FlashFrame17 = function ( Flash, event )
																				local FlashFrame18 = function ( Flash, event )
																					local FlashFrame19 = function ( Flash, event )
																						local FlashFrame20 = function ( Flash, event )
																							local FlashFrame21 = function ( Flash, event )
																								local FlashFrame22 = function ( Flash, event )
																									local FlashFrame23 = function ( Flash, event )
																										local FlashFrame24 = function ( Flash, event )
																											local FlashFrame25 = function ( Flash, event )
																												local FlashFrame26 = function ( Flash, event )
																													local FlashFrame27 = function ( Flash, event )
																														local FlashFrame28 = function ( Flash, event )
																															local FlashFrame29 = function ( Flash, event )
																																local FlashFrame30 = function ( Flash, event )
																																	if not event.interrupted then
																																		Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																	end
																																	Flash:setAlpha( 0 )
																																	if event.interrupted then
																																		self.clipFinished( Flash, event )
																																	else
																																		Flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																	end
																																end
																																
																																if event.interrupted then
																																	FlashFrame30( Flash, event )
																																	return 
																																else
																																	Flash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																	Flash:setAlpha( 1 )
																																	Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																FlashFrame29( Flash, event )
																																return 
																															else
																																Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																Flash:setAlpha( 0 )
																																Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															FlashFrame28( Flash, event )
																															return 
																														else
																															Flash:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																															Flash:setAlpha( 1 )
																															Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														FlashFrame27( Flash, event )
																														return 
																													else
																														Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																														Flash:setAlpha( 0 )
																														Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													FlashFrame26( Flash, event )
																													return 
																												else
																													Flash:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																													Flash:setAlpha( 1 )
																													Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												FlashFrame25( Flash, event )
																												return 
																											else
																												Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																												Flash:setAlpha( 0 )
																												Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											FlashFrame24( Flash, event )
																											return 
																										else
																											Flash:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																											Flash:setAlpha( 1 )
																											Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										FlashFrame23( Flash, event )
																										return 
																									else
																										Flash:beginAnimation( "keyframe", 8199, false, false, CoD.TweenType.Linear )
																										Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									FlashFrame22( Flash, event )
																									return 
																								else
																									Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																									Flash:setAlpha( 0 )
																									Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								FlashFrame21( Flash, event )
																								return 
																							else
																								Flash:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																								Flash:setAlpha( 1 )
																								Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							FlashFrame20( Flash, event )
																							return 
																						else
																							Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																							Flash:setAlpha( 0 )
																							Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						FlashFrame19( Flash, event )
																						return 
																					else
																						Flash:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																						Flash:setAlpha( 1 )
																						Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					FlashFrame18( Flash, event )
																					return 
																				else
																					Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																					Flash:setAlpha( 0 )
																					Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				FlashFrame17( Flash, event )
																				return 
																			else
																				Flash:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																				Flash:setAlpha( 1 )
																				Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			FlashFrame16( Flash, event )
																			return 
																		else
																			Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																			Flash:setAlpha( 0 )
																			Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		FlashFrame15( Flash, event )
																		return 
																	else
																		Flash:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
																		Flash:setAlpha( 1 )
																		Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame15 )
																	end
																end
																
																if event.interrupted then
																	FlashFrame14( Flash, event )
																	return 
																else
																	Flash:beginAnimation( "keyframe", 4869, false, false, CoD.TweenType.Linear )
																	Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame14 )
																end
															end
															
															if event.interrupted then
																FlashFrame13( Flash, event )
																return 
															else
																Flash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																Flash:setAlpha( 0 )
																Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame13 )
															end
														end
														
														if event.interrupted then
															FlashFrame12( Flash, event )
															return 
														else
															Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
															Flash:setAlpha( 1 )
															Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame12 )
														end
													end
													
													if event.interrupted then
														FlashFrame11( Flash, event )
														return 
													else
														Flash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
														Flash:setAlpha( 0 )
														Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame11 )
													end
												end
												
												if event.interrupted then
													FlashFrame10( Flash, event )
													return 
												else
													Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													Flash:setAlpha( 1 )
													Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame10 )
												end
											end
											
											if event.interrupted then
												FlashFrame9( Flash, event )
												return 
											else
												Flash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												Flash:setAlpha( 0 )
												Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame9 )
											end
										end
										
										if event.interrupted then
											FlashFrame8( Flash, event )
											return 
										else
											Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
											Flash:setAlpha( 1 )
											Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame8 )
										end
									end
									
									if event.interrupted then
										FlashFrame7( Flash, event )
										return 
									else
										Flash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
										Flash:setAlpha( 0 )
										Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame7 )
									end
								end
								
								if event.interrupted then
									FlashFrame6( Flash, event )
									return 
								else
									Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									Flash:setAlpha( 1 )
									Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame6 )
								end
							end
							
							if event.interrupted then
								FlashFrame5( Flash, event )
								return 
							else
								Flash:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								Flash:setAlpha( 0 )
								Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame5 )
							end
						end
						
						if event.interrupted then
							FlashFrame4( Flash, event )
							return 
						else
							Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							Flash:setAlpha( 1 )
							Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame4 )
						end
					end
					
					if event.interrupted then
						FlashFrame3( Flash, event )
						return 
					else
						Flash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame3 )
					end
				end
				
				Flash:completeAnimation()
				self.Flash:setAlpha( 0 )
				FlashFrame2( Flash, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Flag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
