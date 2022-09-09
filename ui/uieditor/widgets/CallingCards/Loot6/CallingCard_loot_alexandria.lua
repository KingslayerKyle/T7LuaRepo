-- c33b4039855b80fdd8e240c378e9d946
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.Loot6.CallingCard_loot_alexandria_bolts" )
require( "ui.uieditor.widgets.CallingCards.Loot6.CallingCard_loot_alexandria_clouds" )

CoD.CallingCard_loot_alexandria = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_alexandria.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_alexandria )
	self.id = "CallingCard_loot_alexandria"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local light4 = LUI.UIImage.new()
	light4:setLeftRight( true, false, 0, 480 )
	light4:setTopBottom( true, false, 0, 120 )
	light4:setAlpha( 0.4 )
	light4:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_light4" ) )
	light4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light4 )
	self.light4 = light4
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( true, false, 0, 480 )
	bg2:setTopBottom( true, false, 0, 120 )
	bg2:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_bg2" ) )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local CallingCardlootalexandriabolts = CoD.CallingCard_loot_alexandria_bolts.new( menu, controller )
	CallingCardlootalexandriabolts:setLeftRight( true, false, 23, 287 )
	CallingCardlootalexandriabolts:setTopBottom( true, false, 31.71, 115.71 )
	self:addElement( CallingCardlootalexandriabolts )
	self.CallingCardlootalexandriabolts = CallingCardlootalexandriabolts
	
	local CallingCardlootalexandriaclouds = CoD.CallingCard_loot_alexandria_clouds.new( menu, controller )
	CallingCardlootalexandriaclouds:setLeftRight( true, false, 162, 480 )
	CallingCardlootalexandriaclouds:setTopBottom( true, false, -5, 103 )
	self:addElement( CallingCardlootalexandriaclouds )
	self.CallingCardlootalexandriaclouds = CallingCardlootalexandriaclouds
	
	local light2 = LUI.UIImage.new()
	light2:setLeftRight( true, false, -1, 361 )
	light2:setTopBottom( true, false, 0, 120 )
	light2:setAlpha( 0.5 )
	light2:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_light2" ) )
	light2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light2 )
	self.light2 = light2
	
	local light1 = LUI.UIImage.new()
	light1:setLeftRight( true, false, 325, 361 )
	light1:setTopBottom( true, false, 9, 45 )
	light1:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_light" ) )
	light1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light1 )
	self.light1 = light1
	
	local light10 = LUI.UIImage.new()
	light10:setLeftRight( true, false, 325, 361 )
	light10:setTopBottom( true, false, 9, 45 )
	light10:setAlpha( 0.65 )
	light10:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_light" ) )
	light10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light10 )
	self.light10 = light10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				CallingCardlootalexandriaclouds:completeAnimation()
				self.CallingCardlootalexandriaclouds:setAlpha( 1 )
				self.clipFinished( CallingCardlootalexandriaclouds, {} )
				local light2Frame2 = function ( light2, event )
					local light2Frame3 = function ( light2, event )
						local light2Frame4 = function ( light2, event )
							local light2Frame5 = function ( light2, event )
								local light2Frame6 = function ( light2, event )
									local light2Frame7 = function ( light2, event )
										local light2Frame8 = function ( light2, event )
											local light2Frame9 = function ( light2, event )
												local light2Frame10 = function ( light2, event )
													local light2Frame11 = function ( light2, event )
														local light2Frame12 = function ( light2, event )
															local light2Frame13 = function ( light2, event )
																local light2Frame14 = function ( light2, event )
																	local light2Frame15 = function ( light2, event )
																		local light2Frame16 = function ( light2, event )
																			local light2Frame17 = function ( light2, event )
																				local light2Frame18 = function ( light2, event )
																					local light2Frame19 = function ( light2, event )
																						local light2Frame20 = function ( light2, event )
																							local light2Frame21 = function ( light2, event )
																								local light2Frame22 = function ( light2, event )
																									local light2Frame23 = function ( light2, event )
																										local light2Frame24 = function ( light2, event )
																											local light2Frame25 = function ( light2, event )
																												local light2Frame26 = function ( light2, event )
																													local light2Frame27 = function ( light2, event )
																														if not event.interrupted then
																															light2:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																														end
																														light2:setLeftRight( true, false, -1, 361 )
																														light2:setTopBottom( true, false, 0, 120 )
																														light2:setAlpha( 0.5 )
																														light2:setXRot( 0 )
																														light2:setYRot( 0 )
																														light2:setZRot( 0 )
																														if event.interrupted then
																															self.clipFinished( light2, event )
																														else
																															light2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																														end
																													end
																													
																													if event.interrupted then
																														light2Frame27( light2, event )
																														return 
																													else
																														light2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																														light2:setLeftRight( true, false, 142.05, 353.91 )
																														light2:setTopBottom( true, false, 6.71, 76.1 )
																														light2:setZRot( -1.21 )
																														light2:registerEventHandler( "transition_complete_keyframe", light2Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													light2Frame26( light2, event )
																													return 
																												else
																													light2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																													light2:setLeftRight( true, false, 169.3, 352.56 )
																													light2:setTopBottom( true, false, 7.99, 67.74 )
																													light2:setZRot( -2.92 )
																													light2:registerEventHandler( "transition_complete_keyframe", light2Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												light2Frame25( light2, event )
																												return 
																											else
																												light2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																												light2:setLeftRight( true, false, 196.54, 351.21 )
																												light2:setTopBottom( true, false, 9.26, 59.37 )
																												light2:setAlpha( 0.5 )
																												light2:setZRot( -4.25 )
																												light2:registerEventHandler( "transition_complete_keyframe", light2Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											light2Frame24( light2, event )
																											return 
																										else
																											light2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																											light2:setLeftRight( true, false, 210.17, 350.54 )
																											light2:setTopBottom( true, false, 9.9, 55.19 )
																											light2:setAlpha( 0.47 )
																											light2:setZRot( -4.92 )
																											light2:registerEventHandler( "transition_complete_keyframe", light2Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										light2Frame23( light2, event )
																										return 
																									else
																										light2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																										light2:setAlpha( 0.38 )
																										light2:registerEventHandler( "transition_complete_keyframe", light2Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									light2Frame22( light2, event )
																									return 
																								else
																									light2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																									light2:setAlpha( 0.34 )
																									light2:setZRot( -8.92 )
																									light2:registerEventHandler( "transition_complete_keyframe", light2Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								light2Frame21( light2, event )
																								return 
																							else
																								light2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								light2:setLeftRight( true, false, 251.04, 348.51 )
																								light2:setTopBottom( true, false, 11.82, 42.65 )
																								light2:setAlpha( 0.3 )
																								light2:setZRot( -9.22 )
																								light2:registerEventHandler( "transition_complete_keyframe", light2Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							light2Frame20( light2, event )
																							return 
																						else
																							light2:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																							light2:setLeftRight( true, false, 254.94, 348.22 )
																							light2:setTopBottom( true, false, 12, 42.54 )
																							light2:setAlpha( 0.28 )
																							light2:setZRot( -9.32 )
																							light2:registerEventHandler( "transition_complete_keyframe", light2Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						light2Frame19( light2, event )
																						return 
																					else
																						light2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																						light2:setLeftRight( true, false, 325.17, 343 )
																						light2:setTopBottom( true, false, 15.3, 40.61 )
																						light2:setZRot( -12.52 )
																						light2:registerEventHandler( "transition_complete_keyframe", light2Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					light2Frame18( light2, event )
																					return 
																				else
																					light2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					light2:setLeftRight( true, false, 338.52, 362.8 )
																					light2:setTopBottom( true, false, 15.93, 37.36 )
																					light2:setAlpha( 0 )
																					light2:setZRot( 138.25 )
																					light2:registerEventHandler( "transition_complete_keyframe", light2Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				light2Frame17( light2, event )
																				return 
																			else
																				light2:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
																				light2:setLeftRight( true, false, 340, 365 )
																				light2:setTopBottom( true, false, 16, 37 )
																				light2:setAlpha( 0.01 )
																				light2:registerEventHandler( "transition_complete_keyframe", light2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			light2Frame16( light2, event )
																			return 
																		else
																			light2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																			light2:setLeftRight( true, false, 338, 480 )
																			light2:setTopBottom( true, false, 9, 67 )
																			light2:setAlpha( 0.39 )
																			light2:registerEventHandler( "transition_complete_keyframe", light2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		light2Frame15( light2, event )
																		return 
																	else
																		light2:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
																		light2:setLeftRight( true, false, 336.16, 509.22 )
																		light2:setTopBottom( true, false, 8.44, 75.19 )
																		light2:registerEventHandler( "transition_complete_keyframe", light2Frame15 )
																	end
																end
																
																if event.interrupted then
																	light2Frame14( light2, event )
																	return 
																else
																	light2:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
																	light2:setLeftRight( true, false, 325, 687 )
																	light2:setTopBottom( true, false, 5, 125 )
																	light2:setZRot( 155 )
																	light2:registerEventHandler( "transition_complete_keyframe", light2Frame14 )
																end
															end
															
															if event.interrupted then
																light2Frame13( light2, event )
																return 
															else
																light2:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																light2:setLeftRight( true, false, 303, 665 )
																light2:setTopBottom( true, false, 54, 174 )
																light2:setZRot( 136.6 )
																light2:registerEventHandler( "transition_complete_keyframe", light2Frame13 )
															end
														end
														
														if event.interrupted then
															light2Frame12( light2, event )
															return 
														else
															light2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
															light2:setLeftRight( true, false, 287.81, 649.81 )
															light2:setTopBottom( true, false, 45, 233.35 )
															light2:setAlpha( 0.5 )
															light2:setZRot( 120.33 )
															light2:registerEventHandler( "transition_complete_keyframe", light2Frame12 )
														end
													end
													
													if event.interrupted then
														light2Frame11( light2, event )
														return 
													else
														light2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
														light2:setLeftRight( true, false, 252, 614 )
														light2:setTopBottom( true, false, 67.71, 276 )
														light2:setAlpha( 0.58 )
														light2:setZRot( 102.64 )
														light2:registerEventHandler( "transition_complete_keyframe", light2Frame11 )
													end
												end
												
												if event.interrupted then
													light2Frame10( light2, event )
													return 
												else
													light2:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													light2:setLeftRight( true, false, 209, 571 )
													light2:setTopBottom( true, false, 79, 307 )
													light2:setAlpha( 0.65 )
													light2:setZRot( 84.95 )
													light2:registerEventHandler( "transition_complete_keyframe", light2Frame10 )
												end
											end
											
											if event.interrupted then
												light2Frame9( light2, event )
												return 
											else
												light2:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
												light2:setLeftRight( true, false, 184.7, 546.7 )
												light2:setTopBottom( true, false, 96.41, 292.91 )
												light2:setAlpha( 0.67 )
												light2:setZRot( 80 )
												light2:registerEventHandler( "transition_complete_keyframe", light2Frame9 )
											end
										end
										
										if event.interrupted then
											light2Frame8( light2, event )
											return 
										else
											light2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											light2:setLeftRight( true, false, 160.87, 522.87 )
											light2:setTopBottom( true, false, 99.9, 292.95 )
											light2:setAlpha( 0.7 )
											light2:setZRot( 72.34 )
											light2:registerEventHandler( "transition_complete_keyframe", light2Frame8 )
										end
									end
									
									if event.interrupted then
										light2Frame7( light2, event )
										return 
									else
										light2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										light2:setLeftRight( true, false, 139.69, 501.69 )
										light2:setTopBottom( true, false, 103, 292.98 )
										light2:setAlpha( 0.67 )
										light2:setZRot( 65.53 )
										light2:registerEventHandler( "transition_complete_keyframe", light2Frame7 )
									end
								end
								
								if event.interrupted then
									light2Frame6( light2, event )
									return 
								else
									light2:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
									light2:setLeftRight( true, false, 133, 495 )
									light2:setTopBottom( true, false, 89.71, 302.85 )
									light2:setAlpha( 0.65 )
									light2:setZRot( 61.28 )
									light2:registerEventHandler( "transition_complete_keyframe", light2Frame6 )
								end
							end
							
							if event.interrupted then
								light2Frame5( light2, event )
								return 
							else
								light2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								light2:setLeftRight( true, false, 66.89, 428.89 )
								light2:setTopBottom( true, false, 83, 258.21 )
								light2:setAlpha( 0.55 )
								light2:setZRot( 40.85 )
								light2:registerEventHandler( "transition_complete_keyframe", light2Frame5 )
							end
						end
						
						if event.interrupted then
							light2Frame4( light2, event )
							return 
						else
							light2:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							light2:setLeftRight( true, false, 37.72, 399.72 )
							light2:setTopBottom( true, false, 70, 209.32 )
							light2:setZRot( 29.79 )
							light2:registerEventHandler( "transition_complete_keyframe", light2Frame4 )
						end
					end
					
					if event.interrupted then
						light2Frame3( light2, event )
						return 
					else
						light2:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						light2:setLeftRight( true, false, 22.02, 384.02 )
						light2:setTopBottom( true, false, 63, 183 )
						light2:setZRot( 23.83 )
						light2:registerEventHandler( "transition_complete_keyframe", light2Frame3 )
					end
				end
				
				light2:completeAnimation()
				self.light2:setLeftRight( true, false, -1, 361 )
				self.light2:setTopBottom( true, false, 0, 120 )
				self.light2:setAlpha( 0.5 )
				self.light2:setXRot( 0 )
				self.light2:setYRot( 0 )
				self.light2:setZRot( 0 )
				light2Frame2( light2, {} )
				local light10Frame2 = function ( light10, event )
					local light10Frame3 = function ( light10, event )
						local light10Frame4 = function ( light10, event )
							local light10Frame5 = function ( light10, event )
								local light10Frame6 = function ( light10, event )
									local light10Frame7 = function ( light10, event )
										local light10Frame8 = function ( light10, event )
											local light10Frame9 = function ( light10, event )
												local light10Frame10 = function ( light10, event )
													if not event.interrupted then
														light10:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
													end
													light10:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( light10, event )
													else
														light10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													light10Frame10( light10, event )
													return 
												else
													light10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													light10:setAlpha( 1 )
													light10:registerEventHandler( "transition_complete_keyframe", light10Frame10 )
												end
											end
											
											if event.interrupted then
												light10Frame9( light10, event )
												return 
											else
												light10:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
												light10:setAlpha( 0.62 )
												light10:registerEventHandler( "transition_complete_keyframe", light10Frame9 )
											end
										end
										
										if event.interrupted then
											light10Frame8( light10, event )
											return 
										else
											light10:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
											light10:setAlpha( 0.45 )
											light10:registerEventHandler( "transition_complete_keyframe", light10Frame8 )
										end
									end
									
									if event.interrupted then
										light10Frame7( light10, event )
										return 
									else
										light10:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
										light10:setAlpha( 1 )
										light10:registerEventHandler( "transition_complete_keyframe", light10Frame7 )
									end
								end
								
								if event.interrupted then
									light10Frame6( light10, event )
									return 
								else
									light10:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
									light10:setAlpha( 0.74 )
									light10:registerEventHandler( "transition_complete_keyframe", light10Frame6 )
								end
							end
							
							if event.interrupted then
								light10Frame5( light10, event )
								return 
							else
								light10:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
								light10:setAlpha( 0.33 )
								light10:registerEventHandler( "transition_complete_keyframe", light10Frame5 )
							end
						end
						
						if event.interrupted then
							light10Frame4( light10, event )
							return 
						else
							light10:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
							light10:setAlpha( 1 )
							light10:registerEventHandler( "transition_complete_keyframe", light10Frame4 )
						end
					end
					
					if event.interrupted then
						light10Frame3( light10, event )
						return 
					else
						light10:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						light10:setAlpha( 0.65 )
						light10:registerEventHandler( "transition_complete_keyframe", light10Frame3 )
					end
				end
				
				light10:completeAnimation()
				self.light10:setAlpha( 1 )
				light10Frame2( light10, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardlootalexandriabolts:close()
		element.CallingCardlootalexandriaclouds:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
