-- b49e9b21a1264bee8d637737e32c8b77
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_loot_skateboard = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_skateboard.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_skateboard )
	self.id = "CallingCard_loot_skateboard"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Board = LUI.UIImage.new()
	Board:setLeftRight( true, false, 0, 480 )
	Board:setTopBottom( true, false, 0, 120 )
	Board:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_board" ) )
	self:addElement( Board )
	self.Board = Board
	
	local eye1 = LUI.UIImage.new()
	eye1:setLeftRight( true, false, 58, 166 )
	eye1:setTopBottom( true, false, 18, 102 )
	eye1:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_1_eyeball" ) )
	self:addElement( eye1 )
	self.eye1 = eye1
	
	local eye2 = LUI.UIImage.new()
	eye2:setLeftRight( true, false, 190, 250 )
	eye2:setTopBottom( true, false, 42, 90 )
	eye2:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_2_eyeball" ) )
	self:addElement( eye2 )
	self.eye2 = eye2
	
	local eye3 = LUI.UIImage.new()
	eye3:setLeftRight( true, false, 277, 373 )
	eye3:setTopBottom( true, false, 11, 83 )
	eye3:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_3_eyeball" ) )
	self:addElement( eye3 )
	self.eye3 = eye3
	
	local eye4 = LUI.UIImage.new()
	eye4:setLeftRight( true, false, 374, 422 )
	eye4:setTopBottom( true, false, 67, 115 )
	eye4:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_4_eyeball" ) )
	self:addElement( eye4 )
	self.eye4 = eye4
	
	local eye5 = LUI.UIImage.new()
	eye5:setLeftRight( true, false, 426, 450 )
	eye5:setTopBottom( true, false, 26, 50 )
	eye5:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_5_eyeball" ) )
	self:addElement( eye5 )
	self.eye5 = eye5
	
	local pupil1 = LUI.UIImage.new()
	pupil1:setLeftRight( true, false, 99, 147 )
	pupil1:setTopBottom( true, false, 44, 92 )
	pupil1:setAlpha( 0.9 )
	pupil1:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_1_iris" ) )
	self:addElement( pupil1 )
	self.pupil1 = pupil1
	
	local pupil2 = LUI.UIImage.new()
	pupil2:setLeftRight( true, false, 198, 222 )
	pupil2:setTopBottom( true, false, 54, 78 )
	pupil2:setAlpha( 0.9 )
	pupil2:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_2_iris" ) )
	self:addElement( pupil2 )
	self.pupil2 = pupil2
	
	local pupil3 = LUI.UIImage.new()
	pupil3:setLeftRight( true, false, 325, 361 )
	pupil3:setTopBottom( true, false, 20, 56 )
	pupil3:setAlpha( 0.9 )
	pupil3:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_3_iris" ) )
	self:addElement( pupil3 )
	self.pupil3 = pupil3
	
	local pupil4 = LUI.UIImage.new()
	pupil4:setLeftRight( true, false, 384, 408 )
	pupil4:setTopBottom( true, false, 76, 100 )
	pupil4:setAlpha( 0.9 )
	pupil4:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_4_iris" ) )
	self:addElement( pupil4 )
	self.pupil4 = pupil4
	
	local pupil5 = LUI.UIImage.new()
	pupil5:setLeftRight( true, false, 425, 449 )
	pupil5:setTopBottom( true, false, 25, 49 )
	pupil5:setAlpha( 0.9 )
	pupil5:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_5_iris" ) )
	self:addElement( pupil5 )
	self.pupil5 = pupil5
	
	local reflection = LUI.UIImage.new()
	reflection:setLeftRight( true, false, 0, 480 )
	reflection:setTopBottom( true, false, 0, 120 )
	reflection:setImage( RegisterImage( "uie_t7_loot_callingcard_skateboard_reflection" ) )
	self:addElement( reflection )
	self.reflection = reflection
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				local eye1Frame2 = function ( eye1, event )
					local eye1Frame3 = function ( eye1, event )
						local eye1Frame4 = function ( eye1, event )
							local eye1Frame5 = function ( eye1, event )
								local eye1Frame6 = function ( eye1, event )
									if not event.interrupted then
										eye1:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
									end
									eye1:setZRot( 0 )
									if event.interrupted then
										self.clipFinished( eye1, event )
									else
										eye1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									eye1Frame6( eye1, event )
									return 
								else
									eye1:beginAnimation( "keyframe", 1319, false, false, CoD.TweenType.Linear )
									eye1:setZRot( -5 )
									eye1:registerEventHandler( "transition_complete_keyframe", eye1Frame6 )
								end
							end
							
							if event.interrupted then
								eye1Frame5( eye1, event )
								return 
							else
								eye1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								eye1:setZRot( 1 )
								eye1:registerEventHandler( "transition_complete_keyframe", eye1Frame5 )
							end
						end
						
						if event.interrupted then
							eye1Frame4( eye1, event )
							return 
						else
							eye1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
							eye1:setZRot( 4 )
							eye1:registerEventHandler( "transition_complete_keyframe", eye1Frame4 )
						end
					end
					
					if event.interrupted then
						eye1Frame3( eye1, event )
						return 
					else
						eye1:beginAnimation( "keyframe", 1289, false, false, CoD.TweenType.Linear )
						eye1:setZRot( 7 )
						eye1:registerEventHandler( "transition_complete_keyframe", eye1Frame3 )
					end
				end
				
				eye1:completeAnimation()
				self.eye1:setZRot( 0 )
				eye1Frame2( eye1, {} )
				local eye2Frame2 = function ( eye2, event )
					local eye2Frame3 = function ( eye2, event )
						local eye2Frame4 = function ( eye2, event )
							local eye2Frame5 = function ( eye2, event )
								local eye2Frame6 = function ( eye2, event )
									local eye2Frame7 = function ( eye2, event )
										local eye2Frame8 = function ( eye2, event )
											local eye2Frame9 = function ( eye2, event )
												if not event.interrupted then
													eye2:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Linear )
												end
												eye2:setZRot( 0 )
												if event.interrupted then
													self.clipFinished( eye2, event )
												else
													eye2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												eye2Frame9( eye2, event )
												return 
											else
												eye2:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
												eye2:setZRot( -4 )
												eye2:registerEventHandler( "transition_complete_keyframe", eye2Frame9 )
											end
										end
										
										if event.interrupted then
											eye2Frame8( eye2, event )
											return 
										else
											eye2:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											eye2:setZRot( 5 )
											eye2:registerEventHandler( "transition_complete_keyframe", eye2Frame8 )
										end
									end
									
									if event.interrupted then
										eye2Frame7( eye2, event )
										return 
									else
										eye2:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
										eye2:setZRot( 0 )
										eye2:registerEventHandler( "transition_complete_keyframe", eye2Frame7 )
									end
								end
								
								if event.interrupted then
									eye2Frame6( eye2, event )
									return 
								else
									eye2:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
									eye2:setZRot( -4 )
									eye2:registerEventHandler( "transition_complete_keyframe", eye2Frame6 )
								end
							end
							
							if event.interrupted then
								eye2Frame5( eye2, event )
								return 
							else
								eye2:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
								eye2:setZRot( 7 )
								eye2:registerEventHandler( "transition_complete_keyframe", eye2Frame5 )
							end
						end
						
						if event.interrupted then
							eye2Frame4( eye2, event )
							return 
						else
							eye2:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							eye2:setZRot( 4 )
							eye2:registerEventHandler( "transition_complete_keyframe", eye2Frame4 )
						end
					end
					
					if event.interrupted then
						eye2Frame3( eye2, event )
						return 
					else
						eye2:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
						eye2:setZRot( 9 )
						eye2:registerEventHandler( "transition_complete_keyframe", eye2Frame3 )
					end
				end
				
				eye2:completeAnimation()
				self.eye2:setZRot( 0 )
				eye2Frame2( eye2, {} )
				local eye3Frame2 = function ( eye3, event )
					local eye3Frame3 = function ( eye3, event )
						local eye3Frame4 = function ( eye3, event )
							local eye3Frame5 = function ( eye3, event )
								local eye3Frame6 = function ( eye3, event )
									local eye3Frame7 = function ( eye3, event )
										local eye3Frame8 = function ( eye3, event )
											local eye3Frame9 = function ( eye3, event )
												local eye3Frame10 = function ( eye3, event )
													local eye3Frame11 = function ( eye3, event )
														local eye3Frame12 = function ( eye3, event )
															local eye3Frame13 = function ( eye3, event )
																local eye3Frame14 = function ( eye3, event )
																	local eye3Frame15 = function ( eye3, event )
																		if not event.interrupted then
																			eye3:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
																		end
																		eye3:setLeftRight( true, false, 277, 373 )
																		eye3:setTopBottom( true, false, 11, 83 )
																		eye3:setYRot( 0 )
																		eye3:setZRot( 0 )
																		if event.interrupted then
																			self.clipFinished( eye3, event )
																		else
																			eye3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		eye3Frame15( eye3, event )
																		return 
																	else
																		eye3:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
																		eye3:setZRot( -2 )
																		eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame15 )
																	end
																end
																
																if event.interrupted then
																	eye3Frame14( eye3, event )
																	return 
																else
																	eye3:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
																	eye3:setZRot( 6 )
																	eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame14 )
																end
															end
															
															if event.interrupted then
																eye3Frame13( eye3, event )
																return 
															else
																eye3:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
																eye3:setZRot( -2 )
																eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame13 )
															end
														end
														
														if event.interrupted then
															eye3Frame12( eye3, event )
															return 
														else
															eye3:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
															eye3:setZRot( 4 )
															eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame12 )
														end
													end
													
													if event.interrupted then
														eye3Frame11( eye3, event )
														return 
													else
														eye3:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
														eye3:setZRot( -1 )
														eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame11 )
													end
												end
												
												if event.interrupted then
													eye3Frame10( eye3, event )
													return 
												else
													eye3:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
													eye3:setZRot( 6 )
													eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame10 )
												end
											end
											
											if event.interrupted then
												eye3Frame9( eye3, event )
												return 
											else
												eye3:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
												eye3:setZRot( -2 )
												eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame9 )
											end
										end
										
										if event.interrupted then
											eye3Frame8( eye3, event )
											return 
										else
											eye3:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
											eye3:setZRot( 5 )
											eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame8 )
										end
									end
									
									if event.interrupted then
										eye3Frame7( eye3, event )
										return 
									else
										eye3:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
										eye3:setZRot( 0 )
										eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame7 )
									end
								end
								
								if event.interrupted then
									eye3Frame6( eye3, event )
									return 
								else
									eye3:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
									eye3:setZRot( 2 )
									eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame6 )
								end
							end
							
							if event.interrupted then
								eye3Frame5( eye3, event )
								return 
							else
								eye3:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
								eye3:setZRot( -3 )
								eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame5 )
							end
						end
						
						if event.interrupted then
							eye3Frame4( eye3, event )
							return 
						else
							eye3:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
							eye3:setZRot( -7 )
							eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame4 )
						end
					end
					
					if event.interrupted then
						eye3Frame3( eye3, event )
						return 
					else
						eye3:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						eye3:setZRot( 3 )
						eye3:registerEventHandler( "transition_complete_keyframe", eye3Frame3 )
					end
				end
				
				eye3:completeAnimation()
				self.eye3:setLeftRight( true, false, 277, 373 )
				self.eye3:setTopBottom( true, false, 11, 83 )
				self.eye3:setYRot( 0 )
				self.eye3:setZRot( 0 )
				eye3Frame2( eye3, {} )
				local eye4Frame2 = function ( eye4, event )
					local eye4Frame3 = function ( eye4, event )
						local eye4Frame4 = function ( eye4, event )
							local eye4Frame5 = function ( eye4, event )
								local eye4Frame6 = function ( eye4, event )
									local eye4Frame7 = function ( eye4, event )
										local eye4Frame8 = function ( eye4, event )
											local eye4Frame9 = function ( eye4, event )
												local eye4Frame10 = function ( eye4, event )
													local eye4Frame11 = function ( eye4, event )
														local eye4Frame12 = function ( eye4, event )
															local eye4Frame13 = function ( eye4, event )
																local eye4Frame14 = function ( eye4, event )
																	local eye4Frame15 = function ( eye4, event )
																		local eye4Frame16 = function ( eye4, event )
																			local eye4Frame17 = function ( eye4, event )
																				local eye4Frame18 = function ( eye4, event )
																					if not event.interrupted then
																						eye4:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																					end
																					eye4:setZRot( 0 )
																					if event.interrupted then
																						self.clipFinished( eye4, event )
																					else
																						eye4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					eye4Frame18( eye4, event )
																					return 
																				else
																					eye4:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
																					eye4:setZRot( 6 )
																					eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				eye4Frame17( eye4, event )
																				return 
																			else
																				eye4:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																				eye4:setZRot( -9 )
																				eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			eye4Frame16( eye4, event )
																			return 
																		else
																			eye4:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
																			eye4:setZRot( 1 )
																			eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		eye4Frame15( eye4, event )
																		return 
																	else
																		eye4:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
																		eye4:setZRot( -4 )
																		eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame15 )
																	end
																end
																
																if event.interrupted then
																	eye4Frame14( eye4, event )
																	return 
																else
																	eye4:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
																	eye4:setZRot( 11 )
																	eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame14 )
																end
															end
															
															if event.interrupted then
																eye4Frame13( eye4, event )
																return 
															else
																eye4:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																eye4:setZRot( -2 )
																eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame13 )
															end
														end
														
														if event.interrupted then
															eye4Frame12( eye4, event )
															return 
														else
															eye4:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
															eye4:setZRot( 5 )
															eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame12 )
														end
													end
													
													if event.interrupted then
														eye4Frame11( eye4, event )
														return 
													else
														eye4:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
														eye4:setZRot( 9 )
														eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame11 )
													end
												end
												
												if event.interrupted then
													eye4Frame10( eye4, event )
													return 
												else
													eye4:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													eye4:setZRot( 0 )
													eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame10 )
												end
											end
											
											if event.interrupted then
												eye4Frame9( eye4, event )
												return 
											else
												eye4:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
												eye4:setZRot( -4 )
												eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame9 )
											end
										end
										
										if event.interrupted then
											eye4Frame8( eye4, event )
											return 
										else
											eye4:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
											eye4:setZRot( -5 )
											eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame8 )
										end
									end
									
									if event.interrupted then
										eye4Frame7( eye4, event )
										return 
									else
										eye4:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
										eye4:setZRot( -15 )
										eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame7 )
									end
								end
								
								if event.interrupted then
									eye4Frame6( eye4, event )
									return 
								else
									eye4:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
									eye4:setZRot( -4 )
									eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame6 )
								end
							end
							
							if event.interrupted then
								eye4Frame5( eye4, event )
								return 
							else
								eye4:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
								eye4:setZRot( 6 )
								eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame5 )
							end
						end
						
						if event.interrupted then
							eye4Frame4( eye4, event )
							return 
						else
							eye4:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							eye4:setZRot( 1 )
							eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame4 )
						end
					end
					
					if event.interrupted then
						eye4Frame3( eye4, event )
						return 
					else
						eye4:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						eye4:setZRot( 10 )
						eye4:registerEventHandler( "transition_complete_keyframe", eye4Frame3 )
					end
				end
				
				eye4:completeAnimation()
				self.eye4:setZRot( 0 )
				eye4Frame2( eye4, {} )
				local pupil1Frame2 = function ( pupil1, event )
					local pupil1Frame3 = function ( pupil1, event )
						local pupil1Frame4 = function ( pupil1, event )
							local pupil1Frame5 = function ( pupil1, event )
								local pupil1Frame6 = function ( pupil1, event )
									local pupil1Frame7 = function ( pupil1, event )
										local pupil1Frame8 = function ( pupil1, event )
											local pupil1Frame9 = function ( pupil1, event )
												local pupil1Frame10 = function ( pupil1, event )
													local pupil1Frame11 = function ( pupil1, event )
														local pupil1Frame12 = function ( pupil1, event )
															local pupil1Frame13 = function ( pupil1, event )
																if not event.interrupted then
																	pupil1:beginAnimation( "keyframe", 900, false, false, CoD.TweenType.Linear )
																end
																pupil1:setLeftRight( true, false, 99, 147 )
																pupil1:setTopBottom( true, false, 44, 92 )
																if event.interrupted then
																	self.clipFinished( pupil1, event )
																else
																	pupil1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																pupil1Frame13( pupil1, event )
																return 
															else
																pupil1:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																pupil1:setLeftRight( true, false, 64, 104 )
																pupil1:setTopBottom( true, false, 34, 82 )
																pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame13 )
															end
														end
														
														if event.interrupted then
															pupil1Frame12( pupil1, event )
															return 
														else
															pupil1:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
															pupil1:setLeftRight( true, false, 64, 105 )
															pupil1:setTopBottom( true, false, 38, 86 )
															pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame12 )
														end
													end
													
													if event.interrupted then
														pupil1Frame11( pupil1, event )
														return 
													else
														pupil1:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
														pupil1:setLeftRight( true, false, 72.03, 120.03 )
														pupil1:setTopBottom( true, false, 45, 93 )
														pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame11 )
													end
												end
												
												if event.interrupted then
													pupil1Frame10( pupil1, event )
													return 
												else
													pupil1:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													pupil1:setLeftRight( true, false, 74.92, 122.92 )
													pupil1:setTopBottom( true, false, 47, 92 )
													pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame10 )
												end
											end
											
											if event.interrupted then
												pupil1Frame9( pupil1, event )
												return 
											else
												pupil1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
												pupil1:setLeftRight( true, false, 79.03, 127.03 )
												pupil1:setTopBottom( true, false, 56.58, 97 )
												pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame9 )
											end
										end
										
										if event.interrupted then
											pupil1Frame8( pupil1, event )
											return 
										else
											pupil1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
											pupil1:setLeftRight( true, false, 86.33, 134.33 )
											pupil1:setTopBottom( true, false, 35.86, 83 )
											pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame8 )
										end
									end
									
									if event.interrupted then
										pupil1Frame7( pupil1, event )
										return 
									else
										pupil1:beginAnimation( "keyframe", 939, false, false, CoD.TweenType.Linear )
										pupil1:setLeftRight( true, false, 95.03, 143.03 )
										pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame7 )
									end
								end
								
								if event.interrupted then
									pupil1Frame6( pupil1, event )
									return 
								else
									pupil1:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									pupil1:setLeftRight( true, false, 101.03, 149.03 )
									pupil1:setTopBottom( true, false, 20, 60 )
									pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame6 )
								end
							end
							
							if event.interrupted then
								pupil1Frame5( pupil1, event )
								return 
							else
								pupil1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								pupil1:setLeftRight( true, false, 110, 158 )
								pupil1:setTopBottom( true, false, 23, 67 )
								pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame5 )
							end
						end
						
						if event.interrupted then
							pupil1Frame4( pupil1, event )
							return 
						else
							pupil1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							pupil1:setLeftRight( true, false, 124, 163 )
							pupil1:setTopBottom( true, false, 35, 83 )
							pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame4 )
						end
					end
					
					if event.interrupted then
						pupil1Frame3( pupil1, event )
						return 
					else
						pupil1:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						pupil1:setLeftRight( true, false, 112, 160 )
						pupil1:setTopBottom( true, false, 40, 88 )
						pupil1:registerEventHandler( "transition_complete_keyframe", pupil1Frame3 )
					end
				end
				
				pupil1:completeAnimation()
				self.pupil1:setLeftRight( true, false, 99, 147 )
				self.pupil1:setTopBottom( true, false, 44, 92 )
				pupil1Frame2( pupil1, {} )
				local pupil2Frame2 = function ( pupil2, event )
					local pupil2Frame3 = function ( pupil2, event )
						local pupil2Frame4 = function ( pupil2, event )
							local pupil2Frame5 = function ( pupil2, event )
								local pupil2Frame6 = function ( pupil2, event )
									local pupil2Frame7 = function ( pupil2, event )
										if not event.interrupted then
											pupil2:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										end
										pupil2:setLeftRight( true, false, 198, 222 )
										pupil2:setTopBottom( true, false, 54, 78 )
										if event.interrupted then
											self.clipFinished( pupil2, event )
										else
											pupil2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										pupil2Frame7( pupil2, event )
										return 
									else
										pupil2:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
										pupil2:setTopBottom( true, false, 57, 81 )
										pupil2:registerEventHandler( "transition_complete_keyframe", pupil2Frame7 )
									end
								end
								
								if event.interrupted then
									pupil2Frame6( pupil2, event )
									return 
								else
									pupil2:beginAnimation( "keyframe", 1539, false, false, CoD.TweenType.Linear )
									pupil2:setLeftRight( true, false, 198, 222 )
									pupil2:setTopBottom( true, false, 54, 78 )
									pupil2:registerEventHandler( "transition_complete_keyframe", pupil2Frame6 )
								end
							end
							
							if event.interrupted then
								pupil2Frame5( pupil2, event )
								return 
							else
								pupil2:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
								pupil2:setLeftRight( true, false, 216, 240 )
								pupil2:setTopBottom( true, false, 49, 71 )
								pupil2:registerEventHandler( "transition_complete_keyframe", pupil2Frame5 )
							end
						end
						
						if event.interrupted then
							pupil2Frame4( pupil2, event )
							return 
						else
							pupil2:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							pupil2:registerEventHandler( "transition_complete_keyframe", pupil2Frame4 )
						end
					end
					
					if event.interrupted then
						pupil2Frame3( pupil2, event )
						return 
					else
						pupil2:beginAnimation( "keyframe", 1879, false, false, CoD.TweenType.Linear )
						pupil2:setLeftRight( true, false, 226.58, 242.58 )
						pupil2:registerEventHandler( "transition_complete_keyframe", pupil2Frame3 )
					end
				end
				
				pupil2:completeAnimation()
				self.pupil2:setLeftRight( true, false, 198, 222 )
				self.pupil2:setTopBottom( true, false, 54, 78 )
				pupil2Frame2( pupil2, {} )
				local pupil3Frame2 = function ( pupil3, event )
					local pupil3Frame3 = function ( pupil3, event )
						local pupil3Frame4 = function ( pupil3, event )
							local pupil3Frame5 = function ( pupil3, event )
								local pupil3Frame6 = function ( pupil3, event )
									local pupil3Frame7 = function ( pupil3, event )
										local pupil3Frame8 = function ( pupil3, event )
											local pupil3Frame9 = function ( pupil3, event )
												local pupil3Frame10 = function ( pupil3, event )
													local pupil3Frame11 = function ( pupil3, event )
														local pupil3Frame12 = function ( pupil3, event )
															local pupil3Frame13 = function ( pupil3, event )
																local pupil3Frame14 = function ( pupil3, event )
																	local pupil3Frame15 = function ( pupil3, event )
																		local pupil3Frame16 = function ( pupil3, event )
																			local pupil3Frame17 = function ( pupil3, event )
																				if not event.interrupted then
																					pupil3:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
																				end
																				pupil3:setLeftRight( true, false, 321, 357 )
																				pupil3:setTopBottom( true, false, 18, 54 )
																				if event.interrupted then
																					self.clipFinished( pupil3, event )
																				else
																					pupil3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				pupil3Frame17( pupil3, event )
																				return 
																			else
																				pupil3:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
																				pupil3:setLeftRight( true, false, 336, 365 )
																				pupil3:setTopBottom( true, false, 26, 62 )
																				pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			pupil3Frame16( pupil3, event )
																			return 
																		else
																			pupil3:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																			pupil3:setLeftRight( true, false, 322, 358 )
																			pupil3:setTopBottom( true, false, 41.23, 77.23 )
																			pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		pupil3Frame15( pupil3, event )
																		return 
																	else
																		pupil3:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																		pupil3:setLeftRight( true, false, 318, 354 )
																		pupil3:setTopBottom( true, false, 42.23, 78.23 )
																		pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame15 )
																	end
																end
																
																if event.interrupted then
																	pupil3Frame14( pupil3, event )
																	return 
																else
																	pupil3:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
																	pupil3:setLeftRight( true, false, 315, 351 )
																	pupil3:setTopBottom( true, false, 43.23, 79.23 )
																	pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame14 )
																end
															end
															
															if event.interrupted then
																pupil3Frame13( pupil3, event )
																return 
															else
																pupil3:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																pupil3:setLeftRight( true, false, 299, 335 )
																pupil3:setTopBottom( true, false, 40.23, 76.23 )
																pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame13 )
															end
														end
														
														if event.interrupted then
															pupil3Frame12( pupil3, event )
															return 
														else
															pupil3:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
															pupil3:setLeftRight( true, false, 301, 337 )
															pupil3:setTopBottom( true, false, 43.23, 79.23 )
															pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame12 )
														end
													end
													
													if event.interrupted then
														pupil3Frame11( pupil3, event )
														return 
													else
														pupil3:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
														pupil3:setLeftRight( true, false, 299, 335 )
														pupil3:setTopBottom( true, false, 42.23, 78.23 )
														pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame11 )
													end
												end
												
												if event.interrupted then
													pupil3Frame10( pupil3, event )
													return 
												else
													pupil3:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
													pupil3:setLeftRight( true, false, 307, 343 )
													pupil3:setTopBottom( true, false, 44.37, 80.37 )
													pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame10 )
												end
											end
											
											if event.interrupted then
												pupil3Frame9( pupil3, event )
												return 
											else
												pupil3:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
												pupil3:setLeftRight( true, false, 325, 361 )
												pupil3:setTopBottom( true, false, 40, 76 )
												pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame9 )
											end
										end
										
										if event.interrupted then
											pupil3Frame8( pupil3, event )
											return 
										else
											pupil3:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
											pupil3:setLeftRight( true, false, 337.84, 365.84 )
											pupil3:setTopBottom( true, false, 36.13, 72.13 )
											pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame8 )
										end
									end
									
									if event.interrupted then
										pupil3Frame7( pupil3, event )
										return 
									else
										pupil3:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
										pupil3:setLeftRight( true, false, 336.34, 366 )
										pupil3:setTopBottom( true, false, 34.21, 70.21 )
										pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame7 )
									end
								end
								
								if event.interrupted then
									pupil3Frame6( pupil3, event )
									return 
								else
									pupil3:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									pupil3:setLeftRight( true, false, 339, 366 )
									pupil3:setTopBottom( true, false, 24, 60 )
									pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame6 )
								end
							end
							
							if event.interrupted then
								pupil3Frame5( pupil3, event )
								return 
							else
								pupil3:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
								pupil3:setLeftRight( true, false, 337, 366 )
								pupil3:setTopBottom( true, false, 26, 62 )
								pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame5 )
							end
						end
						
						if event.interrupted then
							pupil3Frame4( pupil3, event )
							return 
						else
							pupil3:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
							pupil3:setLeftRight( true, false, 323, 359 )
							pupil3:setTopBottom( true, false, 17, 53 )
							pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame4 )
						end
					end
					
					if event.interrupted then
						pupil3Frame3( pupil3, event )
						return 
					else
						pupil3:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						pupil3:setLeftRight( true, false, 324, 360 )
						pupil3:setTopBottom( true, false, 19, 55 )
						pupil3:registerEventHandler( "transition_complete_keyframe", pupil3Frame3 )
					end
				end
				
				pupil3:completeAnimation()
				self.pupil3:setLeftRight( true, false, 321, 357 )
				self.pupil3:setTopBottom( true, false, 18, 54 )
				pupil3Frame2( pupil3, {} )
				local pupil4Frame2 = function ( pupil4, event )
					local pupil4Frame3 = function ( pupil4, event )
						local pupil4Frame4 = function ( pupil4, event )
							local pupil4Frame5 = function ( pupil4, event )
								local pupil4Frame6 = function ( pupil4, event )
									local pupil4Frame7 = function ( pupil4, event )
										local pupil4Frame8 = function ( pupil4, event )
											local pupil4Frame9 = function ( pupil4, event )
												local pupil4Frame10 = function ( pupil4, event )
													local pupil4Frame11 = function ( pupil4, event )
														local pupil4Frame12 = function ( pupil4, event )
															local pupil4Frame13 = function ( pupil4, event )
																local pupil4Frame14 = function ( pupil4, event )
																	local pupil4Frame15 = function ( pupil4, event )
																		local pupil4Frame16 = function ( pupil4, event )
																			local pupil4Frame17 = function ( pupil4, event )
																				local pupil4Frame18 = function ( pupil4, event )
																					local pupil4Frame19 = function ( pupil4, event )
																						local pupil4Frame20 = function ( pupil4, event )
																							if not event.interrupted then
																								pupil4:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
																							end
																							pupil4:setLeftRight( true, false, 384, 408 )
																							pupil4:setTopBottom( true, false, 76, 100 )
																							if event.interrupted then
																								self.clipFinished( pupil4, event )
																							else
																								pupil4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							pupil4Frame20( pupil4, event )
																							return 
																						else
																							pupil4:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																							pupil4:setLeftRight( true, false, 380.5, 402.5 )
																							pupil4:setTopBottom( true, false, 77, 99 )
																							pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						pupil4Frame19( pupil4, event )
																						return 
																					else
																						pupil4:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
																						pupil4:setTopBottom( true, false, 75, 95 )
																						pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					pupil4Frame18( pupil4, event )
																					return 
																				else
																					pupil4:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																					pupil4:setTopBottom( true, false, 79, 99 )
																					pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				pupil4Frame17( pupil4, event )
																				return 
																			else
																				pupil4:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
																				pupil4:setLeftRight( true, false, 384.5, 405.5 )
																				pupil4:setTopBottom( true, false, 82, 102 )
																				pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			pupil4Frame16( pupil4, event )
																			return 
																		else
																			pupil4:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
																			pupil4:setLeftRight( true, false, 391.5, 412.5 )
																			pupil4:setTopBottom( true, false, 83, 103 )
																			pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		pupil4Frame15( pupil4, event )
																		return 
																	else
																		pupil4:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
																		pupil4:setTopBottom( true, false, 77, 97 )
																		pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame15 )
																	end
																end
																
																if event.interrupted then
																	pupil4Frame14( pupil4, event )
																	return 
																else
																	pupil4:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
																	pupil4:setLeftRight( true, false, 385.5, 406.5 )
																	pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame14 )
																end
															end
															
															if event.interrupted then
																pupil4Frame13( pupil4, event )
																return 
															else
																pupil4:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
																pupil4:setLeftRight( true, false, 387.5, 408.5 )
																pupil4:setTopBottom( true, false, 80, 100 )
																pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame13 )
															end
														end
														
														if event.interrupted then
															pupil4Frame12( pupil4, event )
															return 
														else
															pupil4:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
															pupil4:setLeftRight( true, false, 392, 413 )
															pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame12 )
														end
													end
													
													if event.interrupted then
														pupil4Frame11( pupil4, event )
														return 
													else
														pupil4:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
														pupil4:setTopBottom( true, false, 72, 92 )
														pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame11 )
													end
												end
												
												if event.interrupted then
													pupil4Frame10( pupil4, event )
													return 
												else
													pupil4:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
													pupil4:setLeftRight( true, false, 389, 410 )
													pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame10 )
												end
											end
											
											if event.interrupted then
												pupil4Frame9( pupil4, event )
												return 
											else
												pupil4:beginAnimation( "keyframe", 679, false, false, CoD.TweenType.Linear )
												pupil4:setLeftRight( true, false, 391, 412 )
												pupil4:setTopBottom( true, false, 71, 91 )
												pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame9 )
											end
										end
										
										if event.interrupted then
											pupil4Frame8( pupil4, event )
											return 
										else
											pupil4:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											pupil4:setLeftRight( true, false, 380, 401 )
											pupil4:setTopBottom( true, false, 73, 93 )
											pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame8 )
										end
									end
									
									if event.interrupted then
										pupil4Frame7( pupil4, event )
										return 
									else
										pupil4:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
										pupil4:setTopBottom( true, false, 72, 92 )
										pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame7 )
									end
								end
								
								if event.interrupted then
									pupil4Frame6( pupil4, event )
									return 
								else
									pupil4:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
									pupil4:setLeftRight( true, false, 381, 402 )
									pupil4:setTopBottom( true, false, 73, 93 )
									pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame6 )
								end
							end
							
							if event.interrupted then
								pupil4Frame5( pupil4, event )
								return 
							else
								pupil4:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								pupil4:setTopBottom( true, false, 78.65, 102.65 )
								pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame5 )
							end
						end
						
						if event.interrupted then
							pupil4Frame4( pupil4, event )
							return 
						else
							pupil4:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							pupil4:setTopBottom( true, false, 75.65, 99.65 )
							pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame4 )
						end
					end
					
					if event.interrupted then
						pupil4Frame3( pupil4, event )
						return 
					else
						pupil4:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						pupil4:setLeftRight( true, false, 378, 395 )
						pupil4:setTopBottom( true, false, 76.65, 100.65 )
						pupil4:registerEventHandler( "transition_complete_keyframe", pupil4Frame3 )
					end
				end
				
				pupil4:completeAnimation()
				self.pupil4:setLeftRight( true, false, 384, 408 )
				self.pupil4:setTopBottom( true, false, 76, 100 )
				pupil4Frame2( pupil4, {} )
				local pupil5Frame2 = function ( pupil5, event )
					local pupil5Frame3 = function ( pupil5, event )
						local pupil5Frame4 = function ( pupil5, event )
							local pupil5Frame5 = function ( pupil5, event )
								local pupil5Frame6 = function ( pupil5, event )
									local pupil5Frame7 = function ( pupil5, event )
										local pupil5Frame8 = function ( pupil5, event )
											local pupil5Frame9 = function ( pupil5, event )
												local pupil5Frame10 = function ( pupil5, event )
													local pupil5Frame11 = function ( pupil5, event )
														local pupil5Frame12 = function ( pupil5, event )
															if not event.interrupted then
																pupil5:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
															end
															pupil5:setLeftRight( true, false, 422, 446 )
															pupil5:setTopBottom( true, false, 26, 50 )
															if event.interrupted then
																self.clipFinished( pupil5, event )
															else
																pupil5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															pupil5Frame12( pupil5, event )
															return 
														else
															pupil5:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
															pupil5:setLeftRight( true, false, 423, 447 )
															pupil5:setTopBottom( true, false, 27, 51 )
															pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame12 )
														end
													end
													
													if event.interrupted then
														pupil5Frame11( pupil5, event )
														return 
													else
														pupil5:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
														pupil5:setLeftRight( true, false, 424, 448 )
														pupil5:setTopBottom( true, false, 29, 53 )
														pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame11 )
													end
												end
												
												if event.interrupted then
													pupil5Frame10( pupil5, event )
													return 
												else
													pupil5:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
													pupil5:setLeftRight( true, false, 427, 451 )
													pupil5:setTopBottom( true, false, 31, 55 )
													pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame10 )
												end
											end
											
											if event.interrupted then
												pupil5Frame9( pupil5, event )
												return 
											else
												pupil5:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
												pupil5:setLeftRight( true, false, 424, 448 )
												pupil5:setTopBottom( true, false, 29, 53 )
												pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame9 )
											end
										end
										
										if event.interrupted then
											pupil5Frame8( pupil5, event )
											return 
										else
											pupil5:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
											pupil5:setLeftRight( true, false, 422, 446 )
											pupil5:setTopBottom( true, false, 26, 50 )
											pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame8 )
										end
									end
									
									if event.interrupted then
										pupil5Frame7( pupil5, event )
										return 
									else
										pupil5:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
										pupil5:setLeftRight( true, false, 423, 447 )
										pupil5:setTopBottom( true, false, 22, 46 )
										pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame7 )
									end
								end
								
								if event.interrupted then
									pupil5Frame6( pupil5, event )
									return 
								else
									pupil5:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
									pupil5:setLeftRight( true, false, 422, 446 )
									pupil5:setTopBottom( true, false, 26, 50 )
									pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame6 )
								end
							end
							
							if event.interrupted then
								pupil5Frame5( pupil5, event )
								return 
							else
								pupil5:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
								pupil5:setLeftRight( true, false, 424, 448 )
								pupil5:setTopBottom( true, false, 30, 54 )
								pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame5 )
							end
						end
						
						if event.interrupted then
							pupil5Frame4( pupil5, event )
							return 
						else
							pupil5:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
							pupil5:setLeftRight( true, false, 426, 450 )
							pupil5:setTopBottom( true, false, 31, 55 )
							pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame4 )
						end
					end
					
					if event.interrupted then
						pupil5Frame3( pupil5, event )
						return 
					else
						pupil5:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						pupil5:setLeftRight( true, false, 424, 448 )
						pupil5:setTopBottom( true, false, 30, 54 )
						pupil5:registerEventHandler( "transition_complete_keyframe", pupil5Frame3 )
					end
				end
				
				pupil5:completeAnimation()
				self.pupil5:setLeftRight( true, false, 422, 446 )
				self.pupil5:setTopBottom( true, false, 26, 50 )
				pupil5Frame2( pupil5, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
