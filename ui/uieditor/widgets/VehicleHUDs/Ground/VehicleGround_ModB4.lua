-- 8b602aca99c49900d0edf58433a7586d
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ModB4 = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModB4.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_ModB4 )
	self.id = "VehicleGround_ModB4"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 137 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Image12 = LUI.UIImage.new()
	Image12:setLeftRight( true, false, 0, 56 )
	Image12:setTopBottom( true, false, 0, 40 )
	Image12:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesb4a" ) )
	Image12:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image12 )
	self.Image12 = Image12
	
	local Image13 = LUI.UIImage.new()
	Image13:setLeftRight( true, false, 65.67, 89.67 )
	Image13:setTopBottom( true, false, 0, 40 )
	Image13:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesb4b" ) )
	Image13:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image13 )
	self.Image13 = Image13
	
	local Image14 = LUI.UIImage.new()
	Image14:setLeftRight( true, false, 116, 132 )
	Image14:setTopBottom( true, false, 0, 40 )
	Image14:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesb4c" ) )
	Image14:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image14 )
	self.Image14 = Image14
	
	local Image15 = LUI.UIImage.new()
	Image15:setLeftRight( true, false, 96, 112 )
	Image15:setTopBottom( true, false, 0, 40 )
	Image15:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesb4d" ) )
	Image15:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image15 )
	self.Image15 = Image15
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local Image13Frame2 = function ( Image13, event )
					local Image13Frame3 = function ( Image13, event )
						local Image13Frame4 = function ( Image13, event )
							local Image13Frame5 = function ( Image13, event )
								local Image13Frame6 = function ( Image13, event )
									local Image13Frame7 = function ( Image13, event )
										local Image13Frame8 = function ( Image13, event )
											local Image13Frame9 = function ( Image13, event )
												local Image13Frame10 = function ( Image13, event )
													local Image13Frame11 = function ( Image13, event )
														local Image13Frame12 = function ( Image13, event )
															local Image13Frame13 = function ( Image13, event )
																local Image13Frame14 = function ( Image13, event )
																	local Image13Frame15 = function ( Image13, event )
																		local Image13Frame16 = function ( Image13, event )
																			local Image13Frame17 = function ( Image13, event )
																				local Image13Frame18 = function ( Image13, event )
																					local Image13Frame19 = function ( Image13, event )
																						local Image13Frame20 = function ( Image13, event )
																							local Image13Frame21 = function ( Image13, event )
																								local Image13Frame22 = function ( Image13, event )
																									local Image13Frame23 = function ( Image13, event )
																										local Image13Frame24 = function ( Image13, event )
																											local Image13Frame25 = function ( Image13, event )
																												local Image13Frame26 = function ( Image13, event )
																													local Image13Frame27 = function ( Image13, event )
																														local Image13Frame28 = function ( Image13, event )
																															local Image13Frame29 = function ( Image13, event )
																																if not event.interrupted then
																																	Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																end
																																Image13:setLeftRight( true, false, 56, 80 )
																																Image13:setTopBottom( true, false, 0, 40 )
																																Image13:setAlpha( 1 )
																																if event.interrupted then
																																	self.clipFinished( Image13, event )
																																else
																																	Image13:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																Image13Frame29( Image13, event )
																																return 
																															else
																																Image13:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															Image13Frame28( Image13, event )
																															return 
																														else
																															Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															Image13:setAlpha( 0 )
																															Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														Image13Frame27( Image13, event )
																														return 
																													else
																														Image13:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													Image13Frame26( Image13, event )
																													return 
																												else
																													Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													Image13:setAlpha( 0.5 )
																													Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												Image13Frame25( Image13, event )
																												return 
																											else
																												Image13:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																												Image13:setAlpha( 0 )
																												Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											Image13Frame24( Image13, event )
																											return 
																										else
																											Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											Image13:setLeftRight( true, false, 56, 80 )
																											Image13:setAlpha( 1 )
																											Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										Image13Frame23( Image13, event )
																										return 
																									else
																										Image13:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										Image13:setAlpha( 0.67 )
																										Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									Image13Frame22( Image13, event )
																									return 
																								else
																									Image13:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																									Image13:setAlpha( 0 )
																									Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								Image13Frame21( Image13, event )
																								return 
																							else
																								Image13:beginAnimation( "keyframe", 570, false, false, CoD.TweenType.Linear )
																								Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Image13Frame20( Image13, event )
																							return 
																						else
																							Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							Image13:setAlpha( 1 )
																							Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Image13Frame19( Image13, event )
																						return 
																					else
																						Image13:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																						Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Image13Frame18( Image13, event )
																					return 
																				else
																					Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					Image13:setAlpha( 0 )
																					Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Image13Frame17( Image13, event )
																				return 
																			else
																				Image13:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																				Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Image13Frame16( Image13, event )
																			return 
																		else
																			Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			Image13:setAlpha( 0.5 )
																			Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Image13Frame15( Image13, event )
																		return 
																	else
																		Image13:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																		Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame15 )
																	end
																end
																
																if event.interrupted then
																	Image13Frame14( Image13, event )
																	return 
																else
																	Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	Image13:setLeftRight( true, false, 65.67, 89.67 )
																	Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame14 )
																end
															end
															
															if event.interrupted then
																Image13Frame13( Image13, event )
																return 
															else
																Image13:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame13 )
															end
														end
														
														if event.interrupted then
															Image13Frame12( Image13, event )
															return 
														else
															Image13:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
															Image13:setAlpha( 0 )
															Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame12 )
														end
													end
													
													if event.interrupted then
														Image13Frame11( Image13, event )
														return 
													else
														Image13:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
														Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame11 )
													end
												end
												
												if event.interrupted then
													Image13Frame10( Image13, event )
													return 
												else
													Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Image13:setAlpha( 1 )
													Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame10 )
												end
											end
											
											if event.interrupted then
												Image13Frame9( Image13, event )
												return 
											else
												Image13:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame9 )
											end
										end
										
										if event.interrupted then
											Image13Frame8( Image13, event )
											return 
										else
											Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Image13:setAlpha( 0 )
											Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame8 )
										end
									end
									
									if event.interrupted then
										Image13Frame7( Image13, event )
										return 
									else
										Image13:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame7 )
									end
								end
								
								if event.interrupted then
									Image13Frame6( Image13, event )
									return 
								else
									Image13:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Image13:setLeftRight( true, false, 109, 133 )
									Image13:setAlpha( 0.5 )
									Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame6 )
								end
							end
							
							if event.interrupted then
								Image13Frame5( Image13, event )
								return 
							else
								Image13:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame5 )
							end
						end
						
						if event.interrupted then
							Image13Frame4( Image13, event )
							return 
						else
							Image13:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							Image13:setAlpha( 0 )
							Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame4 )
						end
					end
					
					if event.interrupted then
						Image13Frame3( Image13, event )
						return 
					else
						Image13:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						Image13:registerEventHandler( "transition_complete_keyframe", Image13Frame3 )
					end
				end
				
				Image13:completeAnimation()
				self.Image13:setLeftRight( true, false, 56, 80 )
				self.Image13:setTopBottom( true, false, 0, 40 )
				self.Image13:setAlpha( 1 )
				Image13Frame2( Image13, {} )
				local Image14Frame2 = function ( Image14, event )
					local Image14Frame3 = function ( Image14, event )
						local Image14Frame4 = function ( Image14, event )
							local Image14Frame5 = function ( Image14, event )
								local Image14Frame6 = function ( Image14, event )
									local Image14Frame7 = function ( Image14, event )
										local Image14Frame8 = function ( Image14, event )
											local Image14Frame9 = function ( Image14, event )
												local Image14Frame10 = function ( Image14, event )
													local Image14Frame11 = function ( Image14, event )
														local Image14Frame12 = function ( Image14, event )
															local Image14Frame13 = function ( Image14, event )
																local Image14Frame14 = function ( Image14, event )
																	local Image14Frame15 = function ( Image14, event )
																		local Image14Frame16 = function ( Image14, event )
																			local Image14Frame17 = function ( Image14, event )
																				local Image14Frame18 = function ( Image14, event )
																					local Image14Frame19 = function ( Image14, event )
																						local Image14Frame20 = function ( Image14, event )
																							local Image14Frame21 = function ( Image14, event )
																								if not event.interrupted then
																									Image14:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								end
																								Image14:setLeftRight( true, false, 80, 96 )
																								Image14:setTopBottom( true, false, 0, 40 )
																								Image14:setAlpha( 1 )
																								if event.interrupted then
																									self.clipFinished( Image14, event )
																								else
																									Image14:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																								end
																							end
																							
																							if event.interrupted then
																								Image14Frame21( Image14, event )
																								return 
																							else
																								Image14:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																								Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Image14Frame20( Image14, event )
																							return 
																						else
																							Image14:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							Image14:setAlpha( 0 )
																							Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Image14Frame19( Image14, event )
																						return 
																					else
																						Image14:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Image14Frame18( Image14, event )
																					return 
																				else
																					Image14:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					Image14:setAlpha( 0.5 )
																					Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Image14Frame17( Image14, event )
																				return 
																			else
																				Image14:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
																				Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Image14Frame16( Image14, event )
																			return 
																		else
																			Image14:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			Image14:setLeftRight( true, false, 80, 96 )
																			Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Image14Frame15( Image14, event )
																		return 
																	else
																		Image14:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																		Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame15 )
																	end
																end
																
																if event.interrupted then
																	Image14Frame14( Image14, event )
																	return 
																else
																	Image14:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																	Image14:setAlpha( 0 )
																	Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame14 )
																end
															end
															
															if event.interrupted then
																Image14Frame13( Image14, event )
																return 
															else
																Image14:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
																Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame13 )
															end
														end
														
														if event.interrupted then
															Image14Frame12( Image14, event )
															return 
														else
															Image14:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															Image14:setAlpha( 1 )
															Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame12 )
														end
													end
													
													if event.interrupted then
														Image14Frame11( Image14, event )
														return 
													else
														Image14:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame11 )
													end
												end
												
												if event.interrupted then
													Image14Frame10( Image14, event )
													return 
												else
													Image14:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Image14:setAlpha( 0 )
													Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame10 )
												end
											end
											
											if event.interrupted then
												Image14Frame9( Image14, event )
												return 
											else
												Image14:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame9 )
											end
										end
										
										if event.interrupted then
											Image14Frame8( Image14, event )
											return 
										else
											Image14:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Image14:setAlpha( 0.5 )
											Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame8 )
										end
									end
									
									if event.interrupted then
										Image14Frame7( Image14, event )
										return 
									else
										Image14:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
										Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame7 )
									end
								end
								
								if event.interrupted then
									Image14Frame6( Image14, event )
									return 
								else
									Image14:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Image14:setLeftRight( true, false, 116, 132 )
									Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame6 )
								end
							end
							
							if event.interrupted then
								Image14Frame5( Image14, event )
								return 
							else
								Image14:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
								Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame5 )
							end
						end
						
						if event.interrupted then
							Image14Frame4( Image14, event )
							return 
						else
							Image14:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							Image14:setAlpha( 0 )
							Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame4 )
						end
					end
					
					if event.interrupted then
						Image14Frame3( Image14, event )
						return 
					else
						Image14:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
						Image14:registerEventHandler( "transition_complete_keyframe", Image14Frame3 )
					end
				end
				
				Image14:completeAnimation()
				self.Image14:setLeftRight( true, false, 80, 96 )
				self.Image14:setTopBottom( true, false, 0, 40 )
				self.Image14:setAlpha( 1 )
				Image14Frame2( Image14, {} )
				local Image15Frame2 = function ( Image15, event )
					local Image15Frame3 = function ( Image15, event )
						local Image15Frame4 = function ( Image15, event )
							local Image15Frame5 = function ( Image15, event )
								local Image15Frame6 = function ( Image15, event )
									local Image15Frame7 = function ( Image15, event )
										local Image15Frame8 = function ( Image15, event )
											local Image15Frame9 = function ( Image15, event )
												local Image15Frame10 = function ( Image15, event )
													local Image15Frame11 = function ( Image15, event )
														local Image15Frame12 = function ( Image15, event )
															local Image15Frame13 = function ( Image15, event )
																if not event.interrupted then
																	Image15:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																end
																Image15:setRGB( 1, 1, 1 )
																if event.interrupted then
																	self.clipFinished( Image15, event )
																else
																	Image15:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																Image15Frame13( Image15, event )
																return 
															else
																Image15:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
																Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame13 )
															end
														end
														
														if event.interrupted then
															Image15Frame12( Image15, event )
															return 
														else
															Image15:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
															Image15:setRGB( 1, 0, 0 )
															Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame12 )
														end
													end
													
													if event.interrupted then
														Image15Frame11( Image15, event )
														return 
													else
														Image15:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame11 )
													end
												end
												
												if event.interrupted then
													Image15Frame10( Image15, event )
													return 
												else
													Image15:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
													Image15:setRGB( 1, 1, 1 )
													Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame10 )
												end
											end
											
											if event.interrupted then
												Image15Frame9( Image15, event )
												return 
											else
												Image15:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
												Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame9 )
											end
										end
										
										if event.interrupted then
											Image15Frame8( Image15, event )
											return 
										else
											Image15:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											Image15:setRGB( 1, 0, 0 )
											Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame8 )
										end
									end
									
									if event.interrupted then
										Image15Frame7( Image15, event )
										return 
									else
										Image15:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame7 )
									end
								end
								
								if event.interrupted then
									Image15Frame6( Image15, event )
									return 
								else
									Image15:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									Image15:setRGB( 1, 1, 1 )
									Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame6 )
								end
							end
							
							if event.interrupted then
								Image15Frame5( Image15, event )
								return 
							else
								Image15:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
								Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame5 )
							end
						end
						
						if event.interrupted then
							Image15Frame4( Image15, event )
							return 
						else
							Image15:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							Image15:setRGB( 1, 0, 0 )
							Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame4 )
						end
					end
					
					if event.interrupted then
						Image15Frame3( Image15, event )
						return 
					else
						Image15:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Image15:registerEventHandler( "transition_complete_keyframe", Image15Frame3 )
					end
				end
				
				Image15:completeAnimation()
				self.Image15:setRGB( 1, 1, 1 )
				Image15Frame2( Image15, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

