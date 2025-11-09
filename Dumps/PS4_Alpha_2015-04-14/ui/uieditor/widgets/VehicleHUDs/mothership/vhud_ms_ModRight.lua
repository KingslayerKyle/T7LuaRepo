require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT5" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT4" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT3" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT6" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT2" )

CoD.vhud_ms_ModRight = InheritFrom( LUI.UIElement )
CoD.vhud_ms_ModRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_ModRight )
	self.id = "vhud_ms_ModRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 644 )
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local ModT1 = CoD.VehicleGround_ModT5.new( menu, controller )
	ModT1:setLeftRight( true, false, 388, 500 )
	ModT1:setTopBottom( true, false, 18, 54 )
	ModT1:setRGB( 1, 1, 1 )
	self:addElement( ModT1 )
	self.ModT1 = ModT1
	
	local ModT2 = CoD.VehicleGround_ModT4.new( menu, controller )
	ModT2:setLeftRight( true, false, 500, 644 )
	ModT2:setTopBottom( true, false, 18, 54 )
	ModT2:setRGB( 1, 1, 1 )
	self:addElement( ModT2 )
	self.ModT2 = ModT2
	
	local ModT3 = CoD.VehicleGround_ModT3.new( menu, controller )
	ModT3:setLeftRight( true, false, 336.24, 384.24 )
	ModT3:setTopBottom( true, false, -14.24, 21.76 )
	ModT3:setRGB( 1, 1, 1 )
	ModT3:setAlpha( 0 )
	self:addElement( ModT3 )
	self.ModT3 = ModT3
	
	local ModT5 = CoD.VehicleGround_ModT6.new( menu, controller )
	ModT5:setLeftRight( true, false, 332, 436 )
	ModT5:setTopBottom( true, false, 0, 36 )
	ModT5:setRGB( 1, 1, 1 )
	ModT5:setAlpha( 0 )
	self:addElement( ModT5 )
	self.ModT5 = ModT5
	
	local ModT6 = CoD.VehicleGround_ModT2.new( menu, controller )
	ModT6:setLeftRight( true, false, 292, 340 )
	ModT6:setTopBottom( true, false, 0, 36 )
	ModT6:setRGB( 1, 1, 1 )
	ModT6:setAlpha( 0 )
	self:addElement( ModT6 )
	self.ModT6 = ModT6
	
	local ModT1b = CoD.VehicleGround_ModT5.new( menu, controller )
	ModT1b:setLeftRight( true, false, 532, 644 )
	ModT1b:setTopBottom( true, false, 0, 36 )
	ModT1b:setRGB( 1, 1, 1 )
	ModT1b:setAlpha( 0 )
	self:addElement( ModT1b )
	self.ModT1b = ModT1b
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local ModT1Frame2 = function ( ModT1, event )
					local ModT1Frame3 = function ( ModT1, event )
						local ModT1Frame4 = function ( ModT1, event )
							local ModT1Frame5 = function ( ModT1, event )
								local ModT1Frame6 = function ( ModT1, event )
									local ModT1Frame7 = function ( ModT1, event )
										local ModT1Frame8 = function ( ModT1, event )
											local ModT1Frame9 = function ( ModT1, event )
												local ModT1Frame10 = function ( ModT1, event )
													local ModT1Frame11 = function ( ModT1, event )
														local ModT1Frame12 = function ( ModT1, event )
															local ModT1Frame13 = function ( ModT1, event )
																local ModT1Frame14 = function ( ModT1, event )
																	local ModT1Frame15 = function ( ModT1, event )
																		local ModT1Frame16 = function ( ModT1, event )
																			local ModT1Frame17 = function ( ModT1, event )
																				local ModT1Frame18 = function ( ModT1, event )
																					local ModT1Frame19 = function ( ModT1, event )
																						local ModT1Frame20 = function ( ModT1, event )
																							local ModT1Frame21 = function ( ModT1, event )
																								local ModT1Frame22 = function ( ModT1, event )
																									local ModT1Frame23 = function ( ModT1, event )
																										local ModT1Frame24 = function ( ModT1, event )
																											local ModT1Frame25 = function ( ModT1, event )
																												if not event.interrupted then
																													ModT1:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
																												end
																												ModT1:setLeftRight( true, false, 191, 303 )
																												ModT1:setTopBottom( true, false, 0, 36 )
																												ModT1:setAlpha( 0 )
																												if event.interrupted then
																													self.clipFinished( ModT1, event )
																												else
																													ModT1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																												end
																											end
																											
																											if event.interrupted then
																												ModT1Frame25( ModT1, event )
																												return 
																											else
																												ModT1:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
																												ModT1:setLeftRight( true, false, 191, 303 )
																												ModT1:setAlpha( 0 )
																												ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ModT1Frame24( ModT1, event )
																											return 
																										else
																											ModT1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
																											ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ModT1Frame23( ModT1, event )
																										return 
																									else
																										ModT1:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																										ModT1:setLeftRight( true, false, 276, 388 )
																										ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ModT1Frame22( ModT1, event )
																									return 
																								else
																									ModT1:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
																									ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ModT1Frame21( ModT1, event )
																								return 
																							else
																								ModT1:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																								ModT1:setLeftRight( true, false, 388, 500 )
																								ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ModT1Frame20( ModT1, event )
																							return 
																						else
																							ModT1:beginAnimation( "keyframe", 1909, false, false, CoD.TweenType.Linear )
																							ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ModT1Frame19( ModT1, event )
																						return 
																					else
																						ModT1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						ModT1:setAlpha( 1 )
																						ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ModT1Frame18( ModT1, event )
																					return 
																				else
																					ModT1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																					ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ModT1Frame17( ModT1, event )
																				return 
																			else
																				ModT1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				ModT1:setAlpha( 0 )
																				ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT1Frame16( ModT1, event )
																			return 
																		else
																			ModT1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT1Frame15( ModT1, event )
																		return 
																	else
																		ModT1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		ModT1:setAlpha( 0.5 )
																		ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT1Frame14( ModT1, event )
																	return 
																else
																	ModT1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame14 )
																end
															end
															
															if event.interrupted then
																ModT1Frame13( ModT1, event )
																return 
															else
																ModT1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																ModT1:setAlpha( 0 )
																ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame13 )
															end
														end
														
														if event.interrupted then
															ModT1Frame12( ModT1, event )
															return 
														else
															ModT1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
															ModT1:setLeftRight( true, false, 532, 644 )
															ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame12 )
														end
													end
													
													if event.interrupted then
														ModT1Frame11( ModT1, event )
														return 
													else
														ModT1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ModT1:setLeftRight( true, false, 532, 537 )
														ModT1:setAlpha( 1 )
														ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame11 )
													end
												end
												
												if event.interrupted then
													ModT1Frame10( ModT1, event )
													return 
												else
													ModT1:beginAnimation( "keyframe", 2899, false, false, CoD.TweenType.Linear )
													ModT1:setLeftRight( true, false, 532, 644 )
													ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame10 )
												end
											end
											
											if event.interrupted then
												ModT1Frame9( ModT1, event )
												return 
											else
												ModT1:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
												ModT1:setLeftRight( true, false, 344, 456 )
												ModT1:setAlpha( 0 )
												ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame9 )
											end
										end
										
										if event.interrupted then
											ModT1Frame8( ModT1, event )
											return 
										else
											ModT1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
											ModT1:setLeftRight( true, false, 365.04, 477.04 )
											ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame8 )
										end
									end
									
									if event.interrupted then
										ModT1Frame7( ModT1, event )
										return 
									else
										ModT1:beginAnimation( "keyframe", 3299, false, false, CoD.TweenType.Linear )
										ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame7 )
									end
								end
								
								if event.interrupted then
									ModT1Frame6( ModT1, event )
									return 
								else
									ModT1:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
									ModT1:setLeftRight( true, false, 391, 503 )
									ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame6 )
								end
							end
							
							if event.interrupted then
								ModT1Frame5( ModT1, event )
								return 
							else
								ModT1:beginAnimation( "keyframe", 1900, false, false, CoD.TweenType.Linear )
								ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame5 )
							end
						end
						
						if event.interrupted then
							ModT1Frame4( ModT1, event )
							return 
						else
							ModT1:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
							ModT1:setLeftRight( true, false, 496, 608 )
							ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame4 )
						end
					end
					
					if event.interrupted then
						ModT1Frame3( ModT1, event )
						return 
					else
						ModT1:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
						ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame3 )
					end
				end
				
				ModT1:completeAnimation()
				self.ModT1:setLeftRight( true, false, 532, 644 )
				self.ModT1:setTopBottom( true, false, 0, 36 )
				self.ModT1:setAlpha( 1 )
				ModT1Frame2( ModT1, {} )
				local ModT2Frame2 = function ( ModT2, event )
					local ModT2Frame3 = function ( ModT2, event )
						local ModT2Frame4 = function ( ModT2, event )
							local ModT2Frame5 = function ( ModT2, event )
								local ModT2Frame6 = function ( ModT2, event )
									local ModT2Frame7 = function ( ModT2, event )
										local ModT2Frame8 = function ( ModT2, event )
											local ModT2Frame9 = function ( ModT2, event )
												local ModT2Frame10 = function ( ModT2, event )
													local ModT2Frame11 = function ( ModT2, event )
														local ModT2Frame12 = function ( ModT2, event )
															local ModT2Frame13 = function ( ModT2, event )
																local ModT2Frame14 = function ( ModT2, event )
																	local ModT2Frame15 = function ( ModT2, event )
																		local ModT2Frame16 = function ( ModT2, event )
																			local ModT2Frame17 = function ( ModT2, event )
																				if not event.interrupted then
																					ModT2:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																				end
																				ModT2:setLeftRight( true, false, 388, 532 )
																				ModT2:setTopBottom( true, false, 0, 36 )
																				ModT2:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( ModT2, event )
																				else
																					ModT2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModT2Frame17( ModT2, event )
																				return 
																			else
																				ModT2:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
																				ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT2Frame16( ModT2, event )
																			return 
																		else
																			ModT2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			ModT2:setAlpha( 1 )
																			ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT2Frame15( ModT2, event )
																		return 
																	else
																		ModT2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT2Frame14( ModT2, event )
																	return 
																else
																	ModT2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	ModT2:setAlpha( 0 )
																	ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame14 )
																end
															end
															
															if event.interrupted then
																ModT2Frame13( ModT2, event )
																return 
															else
																ModT2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame13 )
															end
														end
														
														if event.interrupted then
															ModT2Frame12( ModT2, event )
															return 
														else
															ModT2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															ModT2:setAlpha( 0.5 )
															ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame12 )
														end
													end
													
													if event.interrupted then
														ModT2Frame11( ModT2, event )
														return 
													else
														ModT2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame11 )
													end
												end
												
												if event.interrupted then
													ModT2Frame10( ModT2, event )
													return 
												else
													ModT2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													ModT2:setAlpha( 0 )
													ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame10 )
												end
											end
											
											if event.interrupted then
												ModT2Frame9( ModT2, event )
												return 
											else
												ModT2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
												ModT2:setLeftRight( true, false, 500, 644 )
												ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame9 )
											end
										end
										
										if event.interrupted then
											ModT2Frame8( ModT2, event )
											return 
										else
											ModT2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ModT2:setLeftRight( true, false, 500, 505 )
											ModT2:setAlpha( 1 )
											ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame8 )
										end
									end
									
									if event.interrupted then
										ModT2Frame7( ModT2, event )
										return 
									else
										ModT2:beginAnimation( "keyframe", 9100, false, false, CoD.TweenType.Linear )
										ModT2:setLeftRight( true, false, 500, 644 )
										ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame7 )
									end
								end
								
								if event.interrupted then
									ModT2Frame6( ModT2, event )
									return 
								else
									ModT2:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
									ModT2:setLeftRight( true, false, 247, 391 )
									ModT2:setAlpha( 0 )
									ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame6 )
								end
							end
							
							if event.interrupted then
								ModT2Frame5( ModT2, event )
								return 
							else
								ModT2:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								ModT2:setLeftRight( true, false, 299.5, 443.5 )
								ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame5 )
							end
						end
						
						if event.interrupted then
							ModT2Frame4( ModT2, event )
							return 
						else
							ModT2:beginAnimation( "keyframe", 1900, false, false, CoD.TweenType.Linear )
							ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame4 )
						end
					end
					
					if event.interrupted then
						ModT2Frame3( ModT2, event )
						return 
					else
						ModT2:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
						ModT2:setLeftRight( true, false, 352, 496 )
						ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame3 )
					end
				end
				
				ModT2:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
				ModT2:setLeftRight( true, false, 388, 532 )
				ModT2:setTopBottom( true, false, 0, 36 )
				ModT2:setAlpha( 1 )
				ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame2 )
				local ModT3Frame2 = function ( ModT3, event )
					local ModT3Frame3 = function ( ModT3, event )
						local ModT3Frame4 = function ( ModT3, event )
							local ModT3Frame5 = function ( ModT3, event )
								local ModT3Frame6 = function ( ModT3, event )
									local ModT3Frame7 = function ( ModT3, event )
										local ModT3Frame8 = function ( ModT3, event )
											local ModT3Frame9 = function ( ModT3, event )
												local ModT3Frame10 = function ( ModT3, event )
													local ModT3Frame11 = function ( ModT3, event )
														local ModT3Frame12 = function ( ModT3, event )
															if not event.interrupted then
																ModT3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															end
															ModT3:setLeftRight( true, false, 340, 388 )
															ModT3:setTopBottom( true, false, 0, 36 )
															ModT3:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( ModT3, event )
															else
																ModT3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															ModT3Frame12( ModT3, event )
															return 
														else
															ModT3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame12 )
														end
													end
													
													if event.interrupted then
														ModT3Frame11( ModT3, event )
														return 
													else
														ModT3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ModT3:setAlpha( 0 )
														ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame11 )
													end
												end
												
												if event.interrupted then
													ModT3Frame10( ModT3, event )
													return 
												else
													ModT3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame10 )
												end
											end
											
											if event.interrupted then
												ModT3Frame9( ModT3, event )
												return 
											else
												ModT3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModT3:setAlpha( 0.5 )
												ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame9 )
											end
										end
										
										if event.interrupted then
											ModT3Frame8( ModT3, event )
											return 
										else
											ModT3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame8 )
										end
									end
									
									if event.interrupted then
										ModT3Frame7( ModT3, event )
										return 
									else
										ModT3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ModT3:setAlpha( 0 )
										ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame7 )
									end
								end
								
								if event.interrupted then
									ModT3Frame6( ModT3, event )
									return 
								else
									ModT3:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
									ModT3:setTopBottom( true, false, 0, 36 )
									ModT3:setAlpha( 0.5 )
									ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame6 )
								end
							end
							
							if event.interrupted then
								ModT3Frame5( ModT3, event )
								return 
							else
								ModT3:beginAnimation( "keyframe", 13600, false, false, CoD.TweenType.Linear )
								ModT3:setLeftRight( true, false, 340, 388 )
								ModT3:setTopBottom( true, false, -36, 0 )
								ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame5 )
							end
						end
						
						if event.interrupted then
							ModT3Frame4( ModT3, event )
							return 
						else
							ModT3:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
							ModT3:setLeftRight( true, false, 304, 352 )
							ModT3:setAlpha( 0 )
							ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame4 )
						end
					end
					
					if event.interrupted then
						ModT3Frame3( ModT3, event )
						return 
					else
						ModT3:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						ModT3:setLeftRight( true, false, 323.2, 371.2 )
						ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame3 )
					end
				end
				
				ModT3:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
				ModT3:setLeftRight( true, false, 340, 388 )
				ModT3:setTopBottom( true, false, 0, 36 )
				ModT3:setAlpha( 1 )
				ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame2 )
				local ModT5Frame2 = function ( ModT5, event )
					local ModT5Frame3 = function ( ModT5, event )
						local ModT5Frame4 = function ( ModT5, event )
							local ModT5Frame5 = function ( ModT5, event )
								local ModT5Frame6 = function ( ModT5, event )
									local ModT5Frame7 = function ( ModT5, event )
										local ModT5Frame8 = function ( ModT5, event )
											local ModT5Frame9 = function ( ModT5, event )
												local ModT5Frame10 = function ( ModT5, event )
													local ModT5Frame11 = function ( ModT5, event )
														local ModT5Frame12 = function ( ModT5, event )
															local ModT5Frame13 = function ( ModT5, event )
																local ModT5Frame14 = function ( ModT5, event )
																	local ModT5Frame15 = function ( ModT5, event )
																		local ModT5Frame16 = function ( ModT5, event )
																			local ModT5Frame17 = function ( ModT5, event )
																				if not event.interrupted then
																					ModT5:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
																				end
																				ModT5:setLeftRight( true, false, 332, 436 )
																				ModT5:setTopBottom( true, false, 0, 36 )
																				ModT5:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( ModT5, event )
																				else
																					ModT5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModT5Frame17( ModT5, event )
																				return 
																			else
																				ModT5:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																				ModT5:setLeftRight( true, false, 391.73, 495.73 )
																				ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT5Frame16( ModT5, event )
																			return 
																		else
																			ModT5:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																			ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT5Frame15( ModT5, event )
																		return 
																	else
																		ModT5:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		ModT5:setLeftRight( true, false, 444, 548 )
																		ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT5Frame14( ModT5, event )
																	return 
																else
																	ModT5:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
																	ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame14 )
																end
															end
															
															if event.interrupted then
																ModT5Frame13( ModT5, event )
																return 
															else
																ModT5:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																ModT5:setLeftRight( true, false, 492, 596 )
																ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame13 )
															end
														end
														
														if event.interrupted then
															ModT5Frame12( ModT5, event )
															return 
														else
															ModT5:beginAnimation( "keyframe", 2909, false, false, CoD.TweenType.Linear )
															ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame12 )
														end
													end
													
													if event.interrupted then
														ModT5Frame11( ModT5, event )
														return 
													else
														ModT5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ModT5:setAlpha( 1 )
														ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame11 )
													end
												end
												
												if event.interrupted then
													ModT5Frame10( ModT5, event )
													return 
												else
													ModT5:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame10 )
												end
											end
											
											if event.interrupted then
												ModT5Frame9( ModT5, event )
												return 
											else
												ModT5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModT5:setAlpha( 0 )
												ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame9 )
											end
										end
										
										if event.interrupted then
											ModT5Frame8( ModT5, event )
											return 
										else
											ModT5:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame8 )
										end
									end
									
									if event.interrupted then
										ModT5Frame7( ModT5, event )
										return 
									else
										ModT5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ModT5:setAlpha( 0.5 )
										ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame7 )
									end
								end
								
								if event.interrupted then
									ModT5Frame6( ModT5, event )
									return 
								else
									ModT5:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame6 )
								end
							end
							
							if event.interrupted then
								ModT5Frame5( ModT5, event )
								return 
							else
								ModT5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ModT5:setAlpha( 0 )
								ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame5 )
							end
						end
						
						if event.interrupted then
							ModT5Frame4( ModT5, event )
							return 
						else
							ModT5:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							ModT5:setLeftRight( true, false, 539, 643 )
							ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame4 )
						end
					end
					
					if event.interrupted then
						ModT5Frame3( ModT5, event )
						return 
					else
						ModT5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ModT5:setLeftRight( true, false, 539, 544 )
						ModT5:setAlpha( 1 )
						ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame3 )
					end
				end
				
				ModT5:beginAnimation( "keyframe", 3700, false, false, CoD.TweenType.Linear )
				ModT5:setLeftRight( true, false, 539, 643 )
				ModT5:setTopBottom( true, false, 0, 36 )
				ModT5:setAlpha( 0 )
				ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame2 )
				local ModT6Frame2 = function ( ModT6, event )
					local ModT6Frame3 = function ( ModT6, event )
						local ModT6Frame4 = function ( ModT6, event )
							local ModT6Frame5 = function ( ModT6, event )
								local ModT6Frame6 = function ( ModT6, event )
									local ModT6Frame7 = function ( ModT6, event )
										local ModT6Frame8 = function ( ModT6, event )
											local ModT6Frame9 = function ( ModT6, event )
												local ModT6Frame10 = function ( ModT6, event )
													local ModT6Frame11 = function ( ModT6, event )
														local ModT6Frame12 = function ( ModT6, event )
															local ModT6Frame13 = function ( ModT6, event )
																local ModT6Frame14 = function ( ModT6, event )
																	local ModT6Frame15 = function ( ModT6, event )
																		local ModT6Frame16 = function ( ModT6, event )
																			local ModT6Frame17 = function ( ModT6, event )
																				if not event.interrupted then
																					ModT6:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
																				end
																				ModT6:setLeftRight( true, false, 292, 340 )
																				ModT6:setTopBottom( true, false, 0, 36 )
																				ModT6:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( ModT6, event )
																				else
																					ModT6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModT6Frame17( ModT6, event )
																				return 
																			else
																				ModT6:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																				ModT6:setLeftRight( true, false, 368.8, 416.8 )
																				ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT6Frame16( ModT6, event )
																			return 
																		else
																			ModT6:beginAnimation( "keyframe", 2300, false, false, CoD.TweenType.Linear )
																			ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT6Frame15( ModT6, event )
																		return 
																	else
																		ModT6:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		ModT6:setLeftRight( true, false, 436, 484 )
																		ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT6Frame14( ModT6, event )
																	return 
																else
																	ModT6:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																	ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame14 )
																end
															end
															
															if event.interrupted then
																ModT6Frame13( ModT6, event )
																return 
															else
																ModT6:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																ModT6:setLeftRight( true, false, 548, 596 )
																ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame13 )
															end
														end
														
														if event.interrupted then
															ModT6Frame12( ModT6, event )
															return 
														else
															ModT6:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
															ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame12 )
														end
													end
													
													if event.interrupted then
														ModT6Frame11( ModT6, event )
														return 
													else
														ModT6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ModT6:setAlpha( 1 )
														ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame11 )
													end
												end
												
												if event.interrupted then
													ModT6Frame10( ModT6, event )
													return 
												else
													ModT6:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame10 )
												end
											end
											
											if event.interrupted then
												ModT6Frame9( ModT6, event )
												return 
											else
												ModT6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModT6:setAlpha( 0 )
												ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame9 )
											end
										end
										
										if event.interrupted then
											ModT6Frame8( ModT6, event )
											return 
										else
											ModT6:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame8 )
										end
									end
									
									if event.interrupted then
										ModT6Frame7( ModT6, event )
										return 
									else
										ModT6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ModT6:setAlpha( 0.5 )
										ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame7 )
									end
								end
								
								if event.interrupted then
									ModT6Frame6( ModT6, event )
									return 
								else
									ModT6:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame6 )
								end
							end
							
							if event.interrupted then
								ModT6Frame5( ModT6, event )
								return 
							else
								ModT6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ModT6:setAlpha( 0 )
								ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame5 )
							end
						end
						
						if event.interrupted then
							ModT6Frame4( ModT6, event )
							return 
						else
							ModT6:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							ModT6:setLeftRight( true, false, 596, 644 )
							ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame4 )
						end
					end
					
					if event.interrupted then
						ModT6Frame3( ModT6, event )
						return 
					else
						ModT6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ModT6:setLeftRight( true, false, 596, 599 )
						ModT6:setAlpha( 1 )
						ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame3 )
					end
				end
				
				ModT6:beginAnimation( "keyframe", 7300, false, false, CoD.TweenType.Linear )
				ModT6:setLeftRight( true, false, 596, 644 )
				ModT6:setTopBottom( true, false, 0, 36 )
				ModT6:setAlpha( 0 )
				ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame2 )
				local ModT1bFrame2 = function ( ModT1b, event )
					local ModT1bFrame3 = function ( ModT1b, event )
						local ModT1bFrame4 = function ( ModT1b, event )
							local ModT1bFrame5 = function ( ModT1b, event )
								local ModT1bFrame6 = function ( ModT1b, event )
									local ModT1bFrame7 = function ( ModT1b, event )
										local ModT1bFrame8 = function ( ModT1b, event )
											local ModT1bFrame9 = function ( ModT1b, event )
												local ModT1bFrame10 = function ( ModT1b, event )
													local ModT1bFrame11 = function ( ModT1b, event )
														local ModT1bFrame12 = function ( ModT1b, event )
															if not event.interrupted then
																ModT1b:beginAnimation( "keyframe", 2010, false, false, CoD.TweenType.Linear )
															end
															ModT1b:setLeftRight( true, false, 532, 644 )
															ModT1b:setTopBottom( true, false, 0, 36 )
															ModT1b:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( ModT1b, event )
															else
																ModT1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															ModT1bFrame12( ModT1b, event )
															return 
														else
															ModT1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															ModT1b:setAlpha( 1 )
															ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame12 )
														end
													end
													
													if event.interrupted then
														ModT1bFrame11( ModT1b, event )
														return 
													else
														ModT1b:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame11 )
													end
												end
												
												if event.interrupted then
													ModT1bFrame10( ModT1b, event )
													return 
												else
													ModT1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													ModT1b:setAlpha( 0 )
													ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame10 )
												end
											end
											
											if event.interrupted then
												ModT1bFrame9( ModT1b, event )
												return 
											else
												ModT1b:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame9 )
											end
										end
										
										if event.interrupted then
											ModT1bFrame8( ModT1b, event )
											return 
										else
											ModT1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ModT1b:setAlpha( 0.5 )
											ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame8 )
										end
									end
									
									if event.interrupted then
										ModT1bFrame7( ModT1b, event )
										return 
									else
										ModT1b:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame7 )
									end
								end
								
								if event.interrupted then
									ModT1bFrame6( ModT1b, event )
									return 
								else
									ModT1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									ModT1b:setAlpha( 0 )
									ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame6 )
								end
							end
							
							if event.interrupted then
								ModT1bFrame5( ModT1b, event )
								return 
							else
								ModT1b:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
								ModT1b:setLeftRight( true, false, 532, 644 )
								ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame5 )
							end
						end
						
						if event.interrupted then
							ModT1bFrame4( ModT1b, event )
							return 
						else
							ModT1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ModT1b:setLeftRight( true, false, 532, 536 )
							ModT1b:setAlpha( 1 )
							ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame4 )
						end
					end
					
					if event.interrupted then
						ModT1bFrame3( ModT1b, event )
						return 
					else
						ModT1b:beginAnimation( "keyframe", 14600, false, false, CoD.TweenType.Linear )
						ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame3 )
					end
				end
				
				ModT1b:completeAnimation()
				self.ModT1b:setLeftRight( true, false, 532, 644 )
				self.ModT1b:setTopBottom( true, false, 0, 36 )
				self.ModT1b:setAlpha( 0 )
				ModT1bFrame2( ModT1b, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return HideVehicleReticle( self, controller, event )
			end
		}
	} )
	self:linkToElementModel( self, "vehicleType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicleType"
		} )
	end )
	self.close = function ( self )
		self.ModT1:close()
		self.ModT2:close()
		self.ModT3:close()
		self.ModT5:close()
		self.ModT6:close()
		self.ModT1b:close()
		CoD.vhud_ms_ModRight.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

