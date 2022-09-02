-- 95e88f963dcbe025bad61c269a450730
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Loot_UrbanLegend = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_UrbanLegend.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_UrbanLegend )
	self.id = "CallingCards_Loot_UrbanLegend"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_urbanlegend_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local dude = LUI.UIImage.new()
	dude:setLeftRight( true, false, 1, 481 )
	dude:setTopBottom( true, false, 0, 120 )
	dude:setImage( RegisterImage( "uie_t7_callingcard_urbanlegend_dude" ) )
	self:addElement( dude )
	self.dude = dude
	
	local Snow1 = LUI.UIImage.new()
	Snow1:setLeftRight( true, false, 0, 480 )
	Snow1:setTopBottom( true, false, 0, 120 )
	Snow1:setImage( RegisterImage( "uie_t7_callingcard_urbanlegend_snow1" ) )
	self:addElement( Snow1 )
	self.Snow1 = Snow1
	
	local Snow2 = LUI.UIImage.new()
	Snow2:setLeftRight( true, false, 0, 480 )
	Snow2:setTopBottom( true, false, 0, 120 )
	Snow2:setImage( RegisterImage( "uie_t7_callingcard_urbanlegend_snow2" ) )
	self:addElement( Snow2 )
	self.Snow2 = Snow2
	
	local Snow3 = LUI.UIImage.new()
	Snow3:setLeftRight( true, false, 0, 480 )
	Snow3:setTopBottom( true, false, 0, 120 )
	Snow3:setImage( RegisterImage( "uie_t7_callingcard_urbanlegend_snow4" ) )
	self:addElement( Snow3 )
	self.Snow3 = Snow3
	
	local Snow4 = LUI.UIImage.new()
	Snow4:setLeftRight( true, false, 0, 480 )
	Snow4:setTopBottom( true, false, 0, 120 )
	Snow4:setImage( RegisterImage( "uie_t7_callingcard_urbanlegend_snow3" ) )
	self:addElement( Snow4 )
	self.Snow4 = Snow4
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -459.33, 216 )
	Glow:setTopBottom( true, false, -395.82, 323.82 )
	Glow:setAlpha( 0 )
	Glow:setZRot( -86 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local beast = LUI.UIImage.new()
	beast:setLeftRight( true, false, 1, 481 )
	beast:setTopBottom( true, false, 0, 120 )
	beast:setImage( RegisterImage( "uie_t7_callingcard_urbanlegend_beast" ) )
	self:addElement( beast )
	self.beast = beast
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local dudeFrame2 = function ( dude, event )
					local dudeFrame3 = function ( dude, event )
						if not event.interrupted then
							dude:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
						end
						dude:setLeftRight( true, false, 1, 481 )
						dude:setTopBottom( true, false, 0, 120 )
						dude:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( dude, event )
						else
							dude:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						dudeFrame3( dude, event )
						return 
					else
						dude:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
						dude:setLeftRight( true, false, 9, 489 )
						dude:registerEventHandler( "transition_complete_keyframe", dudeFrame3 )
					end
				end
				
				dude:completeAnimation()
				self.dude:setLeftRight( true, false, 1, 481 )
				self.dude:setTopBottom( true, false, 0, 120 )
				self.dude:setAlpha( 1 )
				dudeFrame2( dude, {} )
				local Snow1Frame2 = function ( Snow1, event )
					local Snow1Frame3 = function ( Snow1, event )
						local Snow1Frame4 = function ( Snow1, event )
							local Snow1Frame5 = function ( Snow1, event )
								local Snow1Frame6 = function ( Snow1, event )
									local Snow1Frame7 = function ( Snow1, event )
										local Snow1Frame8 = function ( Snow1, event )
											local Snow1Frame9 = function ( Snow1, event )
												local Snow1Frame10 = function ( Snow1, event )
													local Snow1Frame11 = function ( Snow1, event )
														local Snow1Frame12 = function ( Snow1, event )
															local Snow1Frame13 = function ( Snow1, event )
																local Snow1Frame14 = function ( Snow1, event )
																	local Snow1Frame15 = function ( Snow1, event )
																		local Snow1Frame16 = function ( Snow1, event )
																			if not event.interrupted then
																				Snow1:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
																			end
																			Snow1:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( Snow1, event )
																			else
																				Snow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			Snow1Frame16( Snow1, event )
																			return 
																		else
																			Snow1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Snow1:setAlpha( 1 )
																			Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Snow1Frame15( Snow1, event )
																		return 
																	else
																		Snow1:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
																		Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame15 )
																	end
																end
																
																if event.interrupted then
																	Snow1Frame14( Snow1, event )
																	return 
																else
																	Snow1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	Snow1:setAlpha( 0 )
																	Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame14 )
																end
															end
															
															if event.interrupted then
																Snow1Frame13( Snow1, event )
																return 
															else
																Snow1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																Snow1:setAlpha( 1 )
																Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame13 )
															end
														end
														
														if event.interrupted then
															Snow1Frame12( Snow1, event )
															return 
														else
															Snow1:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
															Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame12 )
														end
													end
													
													if event.interrupted then
														Snow1Frame11( Snow1, event )
														return 
													else
														Snow1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														Snow1:setAlpha( 0 )
														Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame11 )
													end
												end
												
												if event.interrupted then
													Snow1Frame10( Snow1, event )
													return 
												else
													Snow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
													Snow1:setAlpha( 1 )
													Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame10 )
												end
											end
											
											if event.interrupted then
												Snow1Frame9( Snow1, event )
												return 
											else
												Snow1:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame9 )
											end
										end
										
										if event.interrupted then
											Snow1Frame8( Snow1, event )
											return 
										else
											Snow1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
											Snow1:setAlpha( 0 )
											Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame8 )
										end
									end
									
									if event.interrupted then
										Snow1Frame7( Snow1, event )
										return 
									else
										Snow1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										Snow1:setAlpha( 1 )
										Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame7 )
									end
								end
								
								if event.interrupted then
									Snow1Frame6( Snow1, event )
									return 
								else
									Snow1:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
									Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame6 )
								end
							end
							
							if event.interrupted then
								Snow1Frame5( Snow1, event )
								return 
							else
								Snow1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								Snow1:setAlpha( 0 )
								Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame5 )
							end
						end
						
						if event.interrupted then
							Snow1Frame4( Snow1, event )
							return 
						else
							Snow1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Snow1:setAlpha( 1 )
							Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame4 )
						end
					end
					
					if event.interrupted then
						Snow1Frame3( Snow1, event )
						return 
					else
						Snow1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						Snow1:registerEventHandler( "transition_complete_keyframe", Snow1Frame3 )
					end
				end
				
				Snow1:completeAnimation()
				self.Snow1:setAlpha( 0 )
				Snow1Frame2( Snow1, {} )
				local Snow2Frame2 = function ( Snow2, event )
					local Snow2Frame3 = function ( Snow2, event )
						local Snow2Frame4 = function ( Snow2, event )
							local Snow2Frame5 = function ( Snow2, event )
								local Snow2Frame6 = function ( Snow2, event )
									local Snow2Frame7 = function ( Snow2, event )
										local Snow2Frame8 = function ( Snow2, event )
											if not event.interrupted then
												Snow2:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
											end
											Snow2:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( Snow2, event )
											else
												Snow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Snow2Frame8( Snow2, event )
											return 
										else
											Snow2:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
											Snow2:setAlpha( 1 )
											Snow2:registerEventHandler( "transition_complete_keyframe", Snow2Frame8 )
										end
									end
									
									if event.interrupted then
										Snow2Frame7( Snow2, event )
										return 
									else
										Snow2:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
										Snow2:registerEventHandler( "transition_complete_keyframe", Snow2Frame7 )
									end
								end
								
								if event.interrupted then
									Snow2Frame6( Snow2, event )
									return 
								else
									Snow2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									Snow2:setAlpha( 0 )
									Snow2:registerEventHandler( "transition_complete_keyframe", Snow2Frame6 )
								end
							end
							
							if event.interrupted then
								Snow2Frame5( Snow2, event )
								return 
							else
								Snow2:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
								Snow2:setAlpha( 1 )
								Snow2:registerEventHandler( "transition_complete_keyframe", Snow2Frame5 )
							end
						end
						
						if event.interrupted then
							Snow2Frame4( Snow2, event )
							return 
						else
							Snow2:beginAnimation( "keyframe", 749, false, false, CoD.TweenType.Linear )
							Snow2:setAlpha( 0 )
							Snow2:registerEventHandler( "transition_complete_keyframe", Snow2Frame4 )
						end
					end
					
					if event.interrupted then
						Snow2Frame3( Snow2, event )
						return 
					else
						Snow2:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						Snow2:setAlpha( 1 )
						Snow2:registerEventHandler( "transition_complete_keyframe", Snow2Frame3 )
					end
				end
				
				Snow2:completeAnimation()
				self.Snow2:setAlpha( 0 )
				Snow2Frame2( Snow2, {} )
				local Snow3Frame2 = function ( Snow3, event )
					local Snow3Frame3 = function ( Snow3, event )
						local Snow3Frame4 = function ( Snow3, event )
							local Snow3Frame5 = function ( Snow3, event )
								local Snow3Frame6 = function ( Snow3, event )
									local Snow3Frame7 = function ( Snow3, event )
										local Snow3Frame8 = function ( Snow3, event )
											local Snow3Frame9 = function ( Snow3, event )
												local Snow3Frame10 = function ( Snow3, event )
													local Snow3Frame11 = function ( Snow3, event )
														local Snow3Frame12 = function ( Snow3, event )
															local Snow3Frame13 = function ( Snow3, event )
																local Snow3Frame14 = function ( Snow3, event )
																	local Snow3Frame15 = function ( Snow3, event )
																		local Snow3Frame16 = function ( Snow3, event )
																			if not event.interrupted then
																				Snow3:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																			end
																			Snow3:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( Snow3, event )
																			else
																				Snow3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			Snow3Frame16( Snow3, event )
																			return 
																		else
																			Snow3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Snow3:setAlpha( 1 )
																			Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Snow3Frame15( Snow3, event )
																		return 
																	else
																		Snow3:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
																		Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame15 )
																	end
																end
																
																if event.interrupted then
																	Snow3Frame14( Snow3, event )
																	return 
																else
																	Snow3:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																	Snow3:setAlpha( 0 )
																	Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame14 )
																end
															end
															
															if event.interrupted then
																Snow3Frame13( Snow3, event )
																return 
															else
																Snow3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																Snow3:setAlpha( 1 )
																Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame13 )
															end
														end
														
														if event.interrupted then
															Snow3Frame12( Snow3, event )
															return 
														else
															Snow3:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
															Snow3:setAlpha( 0 )
															Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame12 )
														end
													end
													
													if event.interrupted then
														Snow3Frame11( Snow3, event )
														return 
													else
														Snow3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														Snow3:setAlpha( 1 )
														Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame11 )
													end
												end
												
												if event.interrupted then
													Snow3Frame10( Snow3, event )
													return 
												else
													Snow3:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													Snow3:setAlpha( 0 )
													Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame10 )
												end
											end
											
											if event.interrupted then
												Snow3Frame9( Snow3, event )
												return 
											else
												Snow3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Snow3:setAlpha( 1 )
												Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame9 )
											end
										end
										
										if event.interrupted then
											Snow3Frame8( Snow3, event )
											return 
										else
											Snow3:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
											Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame8 )
										end
									end
									
									if event.interrupted then
										Snow3Frame7( Snow3, event )
										return 
									else
										Snow3:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
										Snow3:setAlpha( 0 )
										Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame7 )
									end
								end
								
								if event.interrupted then
									Snow3Frame6( Snow3, event )
									return 
								else
									Snow3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									Snow3:setAlpha( 1 )
									Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame6 )
								end
							end
							
							if event.interrupted then
								Snow3Frame5( Snow3, event )
								return 
							else
								Snow3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								Snow3:setAlpha( 0 )
								Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame5 )
							end
						end
						
						if event.interrupted then
							Snow3Frame4( Snow3, event )
							return 
						else
							Snow3:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							Snow3:setAlpha( 1 )
							Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame4 )
						end
					end
					
					if event.interrupted then
						Snow3Frame3( Snow3, event )
						return 
					else
						Snow3:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						Snow3:registerEventHandler( "transition_complete_keyframe", Snow3Frame3 )
					end
				end
				
				Snow3:completeAnimation()
				self.Snow3:setAlpha( 0 )
				Snow3Frame2( Snow3, {} )
				local Snow4Frame2 = function ( Snow4, event )
					local Snow4Frame3 = function ( Snow4, event )
						local Snow4Frame4 = function ( Snow4, event )
							local Snow4Frame5 = function ( Snow4, event )
								local Snow4Frame6 = function ( Snow4, event )
									local Snow4Frame7 = function ( Snow4, event )
										local Snow4Frame8 = function ( Snow4, event )
											local Snow4Frame9 = function ( Snow4, event )
												local Snow4Frame10 = function ( Snow4, event )
													local Snow4Frame11 = function ( Snow4, event )
														local Snow4Frame12 = function ( Snow4, event )
															local Snow4Frame13 = function ( Snow4, event )
																local Snow4Frame14 = function ( Snow4, event )
																	local Snow4Frame15 = function ( Snow4, event )
																		local Snow4Frame16 = function ( Snow4, event )
																			if not event.interrupted then
																				Snow4:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
																			end
																			Snow4:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( Snow4, event )
																			else
																				Snow4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			Snow4Frame16( Snow4, event )
																			return 
																		else
																			Snow4:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Snow4:setAlpha( 1 )
																			Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Snow4Frame15( Snow4, event )
																		return 
																	else
																		Snow4:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		Snow4:setAlpha( 0 )
																		Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame15 )
																	end
																end
																
																if event.interrupted then
																	Snow4Frame14( Snow4, event )
																	return 
																else
																	Snow4:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	Snow4:setAlpha( 1 )
																	Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame14 )
																end
															end
															
															if event.interrupted then
																Snow4Frame13( Snow4, event )
																return 
															else
																Snow4:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
																Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame13 )
															end
														end
														
														if event.interrupted then
															Snow4Frame12( Snow4, event )
															return 
														else
															Snow4:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
															Snow4:setAlpha( 0 )
															Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame12 )
														end
													end
													
													if event.interrupted then
														Snow4Frame11( Snow4, event )
														return 
													else
														Snow4:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
														Snow4:setAlpha( 1 )
														Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame11 )
													end
												end
												
												if event.interrupted then
													Snow4Frame10( Snow4, event )
													return 
												else
													Snow4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
													Snow4:setAlpha( 0 )
													Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame10 )
												end
											end
											
											if event.interrupted then
												Snow4Frame9( Snow4, event )
												return 
											else
												Snow4:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												Snow4:setAlpha( 1 )
												Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame9 )
											end
										end
										
										if event.interrupted then
											Snow4Frame8( Snow4, event )
											return 
										else
											Snow4:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
											Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame8 )
										end
									end
									
									if event.interrupted then
										Snow4Frame7( Snow4, event )
										return 
									else
										Snow4:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
										Snow4:setAlpha( 0 )
										Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame7 )
									end
								end
								
								if event.interrupted then
									Snow4Frame6( Snow4, event )
									return 
								else
									Snow4:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									Snow4:setAlpha( 1 )
									Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame6 )
								end
							end
							
							if event.interrupted then
								Snow4Frame5( Snow4, event )
								return 
							else
								Snow4:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
								Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame5 )
							end
						end
						
						if event.interrupted then
							Snow4Frame4( Snow4, event )
							return 
						else
							Snow4:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							Snow4:setAlpha( 0 )
							Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame4 )
						end
					end
					
					if event.interrupted then
						Snow4Frame3( Snow4, event )
						return 
					else
						Snow4:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Snow4:setAlpha( 1 )
						Snow4:registerEventHandler( "transition_complete_keyframe", Snow4Frame3 )
					end
				end
				
				Snow4:completeAnimation()
				self.Snow4:setAlpha( 0 )
				Snow4Frame2( Snow4, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 849, false, false, CoD.TweenType.Linear )
									end
									Glow:setLeftRight( true, false, -459.33, 216 )
									Glow:setTopBottom( true, false, -396.82, 322.82 )
									Glow:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.57 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.2 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.53 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, -459.33, 216 )
				self.Glow:setTopBottom( true, false, -396.82, 322.82 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local beastFrame2 = function ( beast, event )
					local beastFrame3 = function ( beast, event )
						local beastFrame4 = function ( beast, event )
							local beastFrame5 = function ( beast, event )
								local beastFrame6 = function ( beast, event )
									local beastFrame7 = function ( beast, event )
										local beastFrame8 = function ( beast, event )
											local beastFrame9 = function ( beast, event )
												local beastFrame10 = function ( beast, event )
													local beastFrame11 = function ( beast, event )
														local beastFrame12 = function ( beast, event )
															local beastFrame13 = function ( beast, event )
																local beastFrame14 = function ( beast, event )
																	local beastFrame15 = function ( beast, event )
																		local beastFrame16 = function ( beast, event )
																			local beastFrame17 = function ( beast, event )
																				local beastFrame18 = function ( beast, event )
																					local beastFrame19 = function ( beast, event )
																						local beastFrame20 = function ( beast, event )
																							if not event.interrupted then
																								beast:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
																							end
																							beast:setLeftRight( true, false, 1, 481 )
																							beast:setTopBottom( true, false, 0, 120 )
																							beast:setScale( 1 )
																							if event.interrupted then
																								self.clipFinished( beast, event )
																							else
																								beast:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							beastFrame20( beast, event )
																							return 
																						else
																							beast:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																							beast:setLeftRight( true, false, -1.24, 478.76 )
																							beast:setScale( 1.05 )
																							beast:registerEventHandler( "transition_complete_keyframe", beastFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						beastFrame19( beast, event )
																						return 
																					else
																						beast:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																						beast:setLeftRight( true, false, -2, 478 )
																						beast:setScale( 1.02 )
																						beast:registerEventHandler( "transition_complete_keyframe", beastFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					beastFrame18( beast, event )
																					return 
																				else
																					beast:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																					beast:setLeftRight( true, false, -3, 477 )
																					beast:setScale( 1.01 )
																					beast:registerEventHandler( "transition_complete_keyframe", beastFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				beastFrame17( beast, event )
																				return 
																			else
																				beast:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																				beast:setLeftRight( true, false, -2, 478 )
																				beast:registerEventHandler( "transition_complete_keyframe", beastFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			beastFrame16( beast, event )
																			return 
																		else
																			beast:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																			beast:setLeftRight( true, false, -1, 479 )
																			beast:registerEventHandler( "transition_complete_keyframe", beastFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		beastFrame15( beast, event )
																		return 
																	else
																		beast:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		beast:setLeftRight( true, false, 0, 480 )
																		beast:registerEventHandler( "transition_complete_keyframe", beastFrame15 )
																	end
																end
																
																if event.interrupted then
																	beastFrame14( beast, event )
																	return 
																else
																	beast:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
																	beast:registerEventHandler( "transition_complete_keyframe", beastFrame14 )
																end
															end
															
															if event.interrupted then
																beastFrame13( beast, event )
																return 
															else
																beast:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																beast:setLeftRight( true, false, -1, 479 )
																beast:registerEventHandler( "transition_complete_keyframe", beastFrame13 )
															end
														end
														
														if event.interrupted then
															beastFrame12( beast, event )
															return 
														else
															beast:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
															beast:setLeftRight( true, false, 0, 480 )
															beast:registerEventHandler( "transition_complete_keyframe", beastFrame12 )
														end
													end
													
													if event.interrupted then
														beastFrame11( beast, event )
														return 
													else
														beast:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														beast:setLeftRight( true, false, -1, 479 )
														beast:registerEventHandler( "transition_complete_keyframe", beastFrame11 )
													end
												end
												
												if event.interrupted then
													beastFrame10( beast, event )
													return 
												else
													beast:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
													beast:registerEventHandler( "transition_complete_keyframe", beastFrame10 )
												end
											end
											
											if event.interrupted then
												beastFrame9( beast, event )
												return 
											else
												beast:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
												beast:setScale( 1 )
												beast:registerEventHandler( "transition_complete_keyframe", beastFrame9 )
											end
										end
										
										if event.interrupted then
											beastFrame8( beast, event )
											return 
										else
											beast:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											beast:setLeftRight( true, false, 0, 480 )
											beast:setScale( 1.03 )
											beast:registerEventHandler( "transition_complete_keyframe", beastFrame8 )
										end
									end
									
									if event.interrupted then
										beastFrame7( beast, event )
										return 
									else
										beast:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										beast:setLeftRight( true, false, 1, 481 )
										beast:setScale( 1.04 )
										beast:registerEventHandler( "transition_complete_keyframe", beastFrame7 )
									end
								end
								
								if event.interrupted then
									beastFrame6( beast, event )
									return 
								else
									beast:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									beast:setLeftRight( true, false, -0.11, 479.89 )
									beast:setScale( 1.05 )
									beast:registerEventHandler( "transition_complete_keyframe", beastFrame6 )
								end
							end
							
							if event.interrupted then
								beastFrame5( beast, event )
								return 
							else
								beast:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								beast:setLeftRight( true, false, -1, 479 )
								beast:setScale( 1.04 )
								beast:registerEventHandler( "transition_complete_keyframe", beastFrame5 )
							end
						end
						
						if event.interrupted then
							beastFrame4( beast, event )
							return 
						else
							beast:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							beast:setLeftRight( true, false, 1, 481 )
							beast:setScale( 1.03 )
							beast:registerEventHandler( "transition_complete_keyframe", beastFrame4 )
						end
					end
					
					if event.interrupted then
						beastFrame3( beast, event )
						return 
					else
						beast:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						beast:setLeftRight( true, false, 0, 480 )
						beast:setScale( 1.02 )
						beast:registerEventHandler( "transition_complete_keyframe", beastFrame3 )
					end
				end
				
				beast:completeAnimation()
				self.beast:setLeftRight( true, false, 1, 481 )
				self.beast:setTopBottom( true, false, 0, 120 )
				self.beast:setScale( 1 )
				beastFrame2( beast, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

