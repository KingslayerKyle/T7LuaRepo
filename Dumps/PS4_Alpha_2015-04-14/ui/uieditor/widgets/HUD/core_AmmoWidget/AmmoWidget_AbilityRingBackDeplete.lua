CoD.AmmoWidget_AbilityRingBackDeplete = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityRingBackDeplete.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityRingBackDeplete )
	self.id = "AmmoWidget_AbilityRingBackDeplete"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 109 )
	self:setTopBottom( true, false, 0, 109 )
	
	local ImgRingDepleteOutter = LUI.UIImage.new()
	ImgRingDepleteOutter:setLeftRight( true, true, 0, 0.33 )
	ImgRingDepleteOutter:setTopBottom( true, true, 0, 0.33 )
	ImgRingDepleteOutter:setRGB( 1, 1, 1 )
	ImgRingDepleteOutter:setZRot( -360 )
	ImgRingDepleteOutter:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdepleteoutter" ) )
	ImgRingDepleteOutter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgRingDepleteOutter )
	self.ImgRingDepleteOutter = ImgRingDepleteOutter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ImgRingDepleteOutterFrame2 = function ( ImgRingDepleteOutter, event )
					local ImgRingDepleteOutterFrame3 = function ( ImgRingDepleteOutter, event )
						local ImgRingDepleteOutterFrame4 = function ( ImgRingDepleteOutter, event )
							local ImgRingDepleteOutterFrame5 = function ( ImgRingDepleteOutter, event )
								local ImgRingDepleteOutterFrame6 = function ( ImgRingDepleteOutter, event )
									local ImgRingDepleteOutterFrame7 = function ( ImgRingDepleteOutter, event )
										local ImgRingDepleteOutterFrame8 = function ( ImgRingDepleteOutter, event )
											local ImgRingDepleteOutterFrame9 = function ( ImgRingDepleteOutter, event )
												local ImgRingDepleteOutterFrame10 = function ( ImgRingDepleteOutter, event )
													local ImgRingDepleteOutterFrame11 = function ( ImgRingDepleteOutter, event )
														local ImgRingDepleteOutterFrame12 = function ( ImgRingDepleteOutter, event )
															local ImgRingDepleteOutterFrame13 = function ( ImgRingDepleteOutter, event )
																local ImgRingDepleteOutterFrame14 = function ( ImgRingDepleteOutter, event )
																	local ImgRingDepleteOutterFrame15 = function ( ImgRingDepleteOutter, event )
																		local ImgRingDepleteOutterFrame16 = function ( ImgRingDepleteOutter, event )
																			local ImgRingDepleteOutterFrame17 = function ( ImgRingDepleteOutter, event )
																				local ImgRingDepleteOutterFrame18 = function ( ImgRingDepleteOutter, event )
																					local ImgRingDepleteOutterFrame19 = function ( ImgRingDepleteOutter, event )
																						local ImgRingDepleteOutterFrame20 = function ( ImgRingDepleteOutter, event )
																							local ImgRingDepleteOutterFrame21 = function ( ImgRingDepleteOutter, event )
																								local ImgRingDepleteOutterFrame22 = function ( ImgRingDepleteOutter, event )
																									local ImgRingDepleteOutterFrame23 = function ( ImgRingDepleteOutter, event )
																										local ImgRingDepleteOutterFrame24 = function ( ImgRingDepleteOutter, event )
																											local ImgRingDepleteOutterFrame25 = function ( ImgRingDepleteOutter, event )
																												local ImgRingDepleteOutterFrame26 = function ( ImgRingDepleteOutter, event )
																													local ImgRingDepleteOutterFrame27 = function ( ImgRingDepleteOutter, event )
																														local ImgRingDepleteOutterFrame28 = function ( ImgRingDepleteOutter, event )
																															local ImgRingDepleteOutterFrame29 = function ( ImgRingDepleteOutter, event )
																																local ImgRingDepleteOutterFrame30 = function ( ImgRingDepleteOutter, event )
																																	local ImgRingDepleteOutterFrame31 = function ( ImgRingDepleteOutter, event )
																																		local ImgRingDepleteOutterFrame32 = function ( ImgRingDepleteOutter, event )
																																			local ImgRingDepleteOutterFrame33 = function ( ImgRingDepleteOutter, event )
																																				local ImgRingDepleteOutterFrame34 = function ( ImgRingDepleteOutter, event )
																																					local ImgRingDepleteOutterFrame35 = function ( ImgRingDepleteOutter, event )
																																						local ImgRingDepleteOutterFrame36 = function ( ImgRingDepleteOutter, event )
																																							local ImgRingDepleteOutterFrame37 = function ( ImgRingDepleteOutter, event )
																																								local ImgRingDepleteOutterFrame38 = function ( ImgRingDepleteOutter, event )
																																									local ImgRingDepleteOutterFrame39 = function ( ImgRingDepleteOutter, event )
																																										local ImgRingDepleteOutterFrame40 = function ( ImgRingDepleteOutter, event )
																																											local ImgRingDepleteOutterFrame41 = function ( ImgRingDepleteOutter, event )
																																												local ImgRingDepleteOutterFrame42 = function ( ImgRingDepleteOutter, event )
																																													local ImgRingDepleteOutterFrame43 = function ( ImgRingDepleteOutter, event )
																																														local ImgRingDepleteOutterFrame44 = function ( ImgRingDepleteOutter, event )
																																															local ImgRingDepleteOutterFrame45 = function ( ImgRingDepleteOutter, event )
																																																local ImgRingDepleteOutterFrame46 = function ( ImgRingDepleteOutter, event )
																																																	local ImgRingDepleteOutterFrame47 = function ( ImgRingDepleteOutter, event )
																																																		local ImgRingDepleteOutterFrame48 = function ( ImgRingDepleteOutter, event )
																																																			local ImgRingDepleteOutterFrame49 = function ( ImgRingDepleteOutter, event )
																																																				if not event.interrupted then
																																																					ImgRingDepleteOutter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																																																				end
																																																				ImgRingDepleteOutter:setAlpha( 1 )
																																																				ImgRingDepleteOutter:setZRot( -360 )
																																																				if event.interrupted then
																																																					self.clipFinished( ImgRingDepleteOutter, event )
																																																				else
																																																					ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				ImgRingDepleteOutterFrame49( ImgRingDepleteOutter, event )
																																																				return 
																																																			else
																																																				ImgRingDepleteOutter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																																				ImgRingDepleteOutter:setAlpha( 1 )
																																																				ImgRingDepleteOutter:setZRot( -352.8 )
																																																				ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			ImgRingDepleteOutterFrame48( ImgRingDepleteOutter, event )
																																																			return 
																																																		else
																																																			ImgRingDepleteOutter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																																			ImgRingDepleteOutter:setAlpha( 0.78 )
																																																			ImgRingDepleteOutter:setZRot( -346.32 )
																																																			ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		ImgRingDepleteOutterFrame47( ImgRingDepleteOutter, event )
																																																		return 
																																																	else
																																																		ImgRingDepleteOutter:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																		ImgRingDepleteOutter:setAlpha( 1 )
																																																		ImgRingDepleteOutter:setZRot( -339.84 )
																																																		ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	ImgRingDepleteOutterFrame46( ImgRingDepleteOutter, event )
																																																	return 
																																																else
																																																	ImgRingDepleteOutter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																																																	ImgRingDepleteOutter:setAlpha( 0.61 )
																																																	ImgRingDepleteOutter:setZRot( -336.24 )
																																																	ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																ImgRingDepleteOutterFrame45( ImgRingDepleteOutter, event )
																																																return 
																																															else
																																																ImgRingDepleteOutter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																																ImgRingDepleteOutter:setAlpha( 1 )
																																																ImgRingDepleteOutter:setZRot( -330.48 )
																																																ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															ImgRingDepleteOutterFrame44( ImgRingDepleteOutter, event )
																																															return 
																																														else
																																															ImgRingDepleteOutter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																															ImgRingDepleteOutter:setAlpha( 0.59 )
																																															ImgRingDepleteOutter:setZRot( -324 )
																																															ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														ImgRingDepleteOutterFrame43( ImgRingDepleteOutter, event )
																																														return 
																																													else
																																														ImgRingDepleteOutter:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
																																														ImgRingDepleteOutter:setAlpha( 1 )
																																														ImgRingDepleteOutter:setZRot( -317.52 )
																																														ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													ImgRingDepleteOutterFrame42( ImgRingDepleteOutter, event )
																																													return 
																																												else
																																													ImgRingDepleteOutter:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																													ImgRingDepleteOutter:setAlpha( 0.38 )
																																													ImgRingDepleteOutter:setZRot( -301.68 )
																																													ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												ImgRingDepleteOutterFrame41( ImgRingDepleteOutter, event )
																																												return 
																																											else
																																												ImgRingDepleteOutter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																																												ImgRingDepleteOutter:setAlpha( 1 )
																																												ImgRingDepleteOutter:setZRot( -295.2 )
																																												ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											ImgRingDepleteOutterFrame40( ImgRingDepleteOutter, event )
																																											return 
																																										else
																																											ImgRingDepleteOutter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																											ImgRingDepleteOutter:setAlpha( 0.68 )
																																											ImgRingDepleteOutter:setZRot( -288 )
																																											ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										ImgRingDepleteOutterFrame39( ImgRingDepleteOutter, event )
																																										return 
																																									else
																																										ImgRingDepleteOutter:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																																										ImgRingDepleteOutter:setAlpha( 1 )
																																										ImgRingDepleteOutter:setZRot( -285.12 )
																																										ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									ImgRingDepleteOutterFrame38( ImgRingDepleteOutter, event )
																																									return 
																																								else
																																									ImgRingDepleteOutter:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																																									ImgRingDepleteOutter:setAlpha( 0.84 )
																																									ImgRingDepleteOutter:setZRot( -273.6 )
																																									ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								ImgRingDepleteOutterFrame37( ImgRingDepleteOutter, event )
																																								return 
																																							else
																																								ImgRingDepleteOutter:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
																																								ImgRingDepleteOutter:setAlpha( 1 )
																																								ImgRingDepleteOutter:setZRot( -269.28 )
																																								ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							ImgRingDepleteOutterFrame36( ImgRingDepleteOutter, event )
																																							return 
																																						else
																																							ImgRingDepleteOutter:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																							ImgRingDepleteOutter:setAlpha( 0.87 )
																																							ImgRingDepleteOutter:setZRot( -257.04 )
																																							ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						ImgRingDepleteOutterFrame35( ImgRingDepleteOutter, event )
																																						return 
																																					else
																																						ImgRingDepleteOutter:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																																						ImgRingDepleteOutter:setAlpha( 1 )
																																						ImgRingDepleteOutter:setZRot( -253.44 )
																																						ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					ImgRingDepleteOutterFrame34( ImgRingDepleteOutter, event )
																																					return 
																																				else
																																					ImgRingDepleteOutter:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																																					ImgRingDepleteOutter:setAlpha( 0.35 )
																																					ImgRingDepleteOutter:setZRot( -244.8 )
																																					ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				ImgRingDepleteOutterFrame33( ImgRingDepleteOutter, event )
																																				return 
																																			else
																																				ImgRingDepleteOutter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																																				ImgRingDepleteOutter:setAlpha( 1 )
																																				ImgRingDepleteOutter:setZRot( -240.48 )
																																				ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			ImgRingDepleteOutterFrame32( ImgRingDepleteOutter, event )
																																			return 
																																		else
																																			ImgRingDepleteOutter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																																			ImgRingDepleteOutter:setAlpha( 0.7 )
																																			ImgRingDepleteOutter:setZRot( -234.72 )
																																			ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ImgRingDepleteOutterFrame31( ImgRingDepleteOutter, event )
																																		return 
																																	else
																																		ImgRingDepleteOutter:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																																		ImgRingDepleteOutter:setAlpha( 1 )
																																		ImgRingDepleteOutter:setZRot( -227.52 )
																																		ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ImgRingDepleteOutterFrame30( ImgRingDepleteOutter, event )
																																	return 
																																else
																																	ImgRingDepleteOutter:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																																	ImgRingDepleteOutter:setAlpha( 0.89 )
																																	ImgRingDepleteOutter:setZRot( -219.6 )
																																	ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ImgRingDepleteOutterFrame29( ImgRingDepleteOutter, event )
																																return 
																															else
																																ImgRingDepleteOutter:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																																ImgRingDepleteOutter:setAlpha( 1 )
																																ImgRingDepleteOutter:setZRot( -211.68 )
																																ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ImgRingDepleteOutterFrame28( ImgRingDepleteOutter, event )
																															return 
																														else
																															ImgRingDepleteOutter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																															ImgRingDepleteOutter:setAlpha( 0.89 )
																															ImgRingDepleteOutter:setZRot( -200.16 )
																															ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ImgRingDepleteOutterFrame27( ImgRingDepleteOutter, event )
																														return 
																													else
																														ImgRingDepleteOutter:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																														ImgRingDepleteOutter:setAlpha( 1 )
																														ImgRingDepleteOutter:setZRot( -197.28 )
																														ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ImgRingDepleteOutterFrame26( ImgRingDepleteOutter, event )
																													return 
																												else
																													ImgRingDepleteOutter:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																													ImgRingDepleteOutter:setAlpha( 0.68 )
																													ImgRingDepleteOutter:setZRot( -185.76 )
																													ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ImgRingDepleteOutterFrame25( ImgRingDepleteOutter, event )
																												return 
																											else
																												ImgRingDepleteOutter:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
																												ImgRingDepleteOutter:setAlpha( 1 )
																												ImgRingDepleteOutter:setZRot( -177.84 )
																												ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ImgRingDepleteOutterFrame24( ImgRingDepleteOutter, event )
																											return 
																										else
																											ImgRingDepleteOutter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																											ImgRingDepleteOutter:setAlpha( 0.8 )
																											ImgRingDepleteOutter:setZRot( -168.48 )
																											ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ImgRingDepleteOutterFrame23( ImgRingDepleteOutter, event )
																										return 
																									else
																										ImgRingDepleteOutter:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																										ImgRingDepleteOutter:setAlpha( 1 )
																										ImgRingDepleteOutter:setZRot( -161.28 )
																										ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ImgRingDepleteOutterFrame22( ImgRingDepleteOutter, event )
																									return 
																								else
																									ImgRingDepleteOutter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
																									ImgRingDepleteOutter:setAlpha( 0.64 )
																									ImgRingDepleteOutter:setZRot( -156.96 )
																									ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ImgRingDepleteOutterFrame21( ImgRingDepleteOutter, event )
																								return 
																							else
																								ImgRingDepleteOutter:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																								ImgRingDepleteOutter:setAlpha( 1 )
																								ImgRingDepleteOutter:setZRot( -142.56 )
																								ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ImgRingDepleteOutterFrame20( ImgRingDepleteOutter, event )
																							return 
																						else
																							ImgRingDepleteOutter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																							ImgRingDepleteOutter:setAlpha( 0.66 )
																							ImgRingDepleteOutter:setZRot( -133.92 )
																							ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ImgRingDepleteOutterFrame19( ImgRingDepleteOutter, event )
																						return 
																					else
																						ImgRingDepleteOutter:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																						ImgRingDepleteOutter:setAlpha( 1 )
																						ImgRingDepleteOutter:setZRot( -131.04 )
																						ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ImgRingDepleteOutterFrame18( ImgRingDepleteOutter, event )
																					return 
																				else
																					ImgRingDepleteOutter:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																					ImgRingDepleteOutter:setAlpha( 0.65 )
																					ImgRingDepleteOutter:setZRot( -123.84 )
																					ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ImgRingDepleteOutterFrame17( ImgRingDepleteOutter, event )
																				return 
																			else
																				ImgRingDepleteOutter:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																				ImgRingDepleteOutter:setAlpha( 1 )
																				ImgRingDepleteOutter:setZRot( -116.64 )
																				ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ImgRingDepleteOutterFrame16( ImgRingDepleteOutter, event )
																			return 
																		else
																			ImgRingDepleteOutter:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																			ImgRingDepleteOutter:setAlpha( 0.63 )
																			ImgRingDepleteOutter:setZRot( -110.88 )
																			ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ImgRingDepleteOutterFrame15( ImgRingDepleteOutter, event )
																		return 
																	else
																		ImgRingDepleteOutter:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																		ImgRingDepleteOutter:setAlpha( 1 )
																		ImgRingDepleteOutter:setZRot( -106.56 )
																		ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame15 )
																	end
																end
																
																if event.interrupted then
																	ImgRingDepleteOutterFrame14( ImgRingDepleteOutter, event )
																	return 
																else
																	ImgRingDepleteOutter:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																	ImgRingDepleteOutter:setAlpha( 0.66 )
																	ImgRingDepleteOutter:setZRot( -96.48 )
																	ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame14 )
																end
															end
															
															if event.interrupted then
																ImgRingDepleteOutterFrame13( ImgRingDepleteOutter, event )
																return 
															else
																ImgRingDepleteOutter:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																ImgRingDepleteOutter:setAlpha( 1 )
																ImgRingDepleteOutter:setZRot( -87.84 )
																ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame13 )
															end
														end
														
														if event.interrupted then
															ImgRingDepleteOutterFrame12( ImgRingDepleteOutter, event )
															return 
														else
															ImgRingDepleteOutter:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
															ImgRingDepleteOutter:setAlpha( 0.75 )
															ImgRingDepleteOutter:setZRot( -83.52 )
															ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame12 )
														end
													end
													
													if event.interrupted then
														ImgRingDepleteOutterFrame11( ImgRingDepleteOutter, event )
														return 
													else
														ImgRingDepleteOutter:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
														ImgRingDepleteOutter:setAlpha( 1 )
														ImgRingDepleteOutter:setZRot( -62.64 )
														ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame11 )
													end
												end
												
												if event.interrupted then
													ImgRingDepleteOutterFrame10( ImgRingDepleteOutter, event )
													return 
												else
													ImgRingDepleteOutter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
													ImgRingDepleteOutter:setAlpha( 0.48 )
													ImgRingDepleteOutter:setZRot( -53.28 )
													ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame10 )
												end
											end
											
											if event.interrupted then
												ImgRingDepleteOutterFrame9( ImgRingDepleteOutter, event )
												return 
											else
												ImgRingDepleteOutter:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												ImgRingDepleteOutter:setAlpha( 0.74 )
												ImgRingDepleteOutter:setZRot( -47.52 )
												ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame9 )
											end
										end
										
										if event.interrupted then
											ImgRingDepleteOutterFrame8( ImgRingDepleteOutter, event )
											return 
										else
											ImgRingDepleteOutter:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											ImgRingDepleteOutter:setAlpha( 1 )
											ImgRingDepleteOutter:setZRot( -44.64 )
											ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame8 )
										end
									end
									
									if event.interrupted then
										ImgRingDepleteOutterFrame7( ImgRingDepleteOutter, event )
										return 
									else
										ImgRingDepleteOutter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										ImgRingDepleteOutter:setAlpha( 0.62 )
										ImgRingDepleteOutter:setZRot( -41.76 )
										ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame7 )
									end
								end
								
								if event.interrupted then
									ImgRingDepleteOutterFrame6( ImgRingDepleteOutter, event )
									return 
								else
									ImgRingDepleteOutter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									ImgRingDepleteOutter:setAlpha( 0.86 )
									ImgRingDepleteOutter:setZRot( -34.56 )
									ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame6 )
								end
							end
							
							if event.interrupted then
								ImgRingDepleteOutterFrame5( ImgRingDepleteOutter, event )
								return 
							else
								ImgRingDepleteOutter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								ImgRingDepleteOutter:setAlpha( 0.79 )
								ImgRingDepleteOutter:setZRot( -27.36 )
								ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame5 )
							end
						end
						
						if event.interrupted then
							ImgRingDepleteOutterFrame4( ImgRingDepleteOutter, event )
							return 
						else
							ImgRingDepleteOutter:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							ImgRingDepleteOutter:setAlpha( 1 )
							ImgRingDepleteOutter:setZRot( -20.16 )
							ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame4 )
						end
					end
					
					if event.interrupted then
						ImgRingDepleteOutterFrame3( ImgRingDepleteOutter, event )
						return 
					else
						ImgRingDepleteOutter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ImgRingDepleteOutter:setAlpha( 0.54 )
						ImgRingDepleteOutter:setZRot( -14.4 )
						ImgRingDepleteOutter:registerEventHandler( "transition_complete_keyframe", ImgRingDepleteOutterFrame3 )
					end
				end
				
				ImgRingDepleteOutter:completeAnimation()
				self.ImgRingDepleteOutter:setAlpha( 1 )
				self.ImgRingDepleteOutter:setZRot( 0 )
				ImgRingDepleteOutterFrame2( ImgRingDepleteOutter, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

