CoD.VehicleGround_ReticleNumbers = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ReticleNumbers.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ReticleNumbers )
	self.id = "VehicleGround_ReticleNumbers"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 99 )
	
	local ReticleTextT = LUI.UIText.new()
	ReticleTextT:setLeftRight( false, false, -26, 26 )
	ReticleTextT:setTopBottom( false, false, -49.5, -42.5 )
	ReticleTextT:setRGB( 0.91, 0.67, 0.25 )
	ReticleTextT:setText( Engine.Localize( "80" ) )
	ReticleTextT:setTTF( "fonts/Entovo.ttf" )
	ReticleTextT:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ReticleTextT:setShaderVector( 0, 0.05, 0, 0, 0 )
	ReticleTextT:setShaderVector( 1, 0, 0, 0, 0 )
	ReticleTextT:setShaderVector( 2, 0, 0, 0, 0 )
	ReticleTextT:setShaderVector( 3, 0, 0, 0, 0 )
	ReticleTextT:setShaderVector( 4, 0, 0, 0, 0 )
	ReticleTextT:setLetterSpacing( 0.5 )
	ReticleTextT:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ReticleTextT:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ReticleTextT )
	self.ReticleTextT = ReticleTextT
	
	local ReticleTextL = LUI.UIText.new()
	ReticleTextL:setLeftRight( false, false, -87, -35 )
	ReticleTextL:setTopBottom( false, false, 42.5, 49.5 )
	ReticleTextL:setRGB( 0.91, 0.67, 0.25 )
	ReticleTextL:setText( Engine.Localize( "X-0/190" ) )
	ReticleTextL:setTTF( "fonts/Entovo.ttf" )
	ReticleTextL:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ReticleTextL:setShaderVector( 0, 0.05, 0, 0, 0 )
	ReticleTextL:setShaderVector( 1, 0, 0, 0, 0 )
	ReticleTextL:setShaderVector( 2, 0, 0, 0, 0 )
	ReticleTextL:setShaderVector( 3, 0, 0, 0, 0 )
	ReticleTextL:setShaderVector( 4, 0, 0, 0, 0 )
	ReticleTextL:setLetterSpacing( 0.5 )
	ReticleTextL:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	ReticleTextL:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ReticleTextL )
	self.ReticleTextL = ReticleTextL
	
	local ReticleTextR = LUI.UIText.new()
	ReticleTextR:setLeftRight( false, false, 35, 87 )
	ReticleTextR:setTopBottom( false, false, 42.5, 49.5 )
	ReticleTextR:setRGB( 0.91, 0.67, 0.25 )
	ReticleTextR:setText( Engine.Localize( "X-0/90" ) )
	ReticleTextR:setTTF( "fonts/Entovo.ttf" )
	ReticleTextR:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ReticleTextR:setShaderVector( 0, 0.05, 0, 0, 0 )
	ReticleTextR:setShaderVector( 1, 0, 0, 0, 0 )
	ReticleTextR:setShaderVector( 2, 0, 0, 0, 0 )
	ReticleTextR:setShaderVector( 3, 0, 0, 0, 0 )
	ReticleTextR:setShaderVector( 4, 0, 0, 0, 0 )
	ReticleTextR:setLetterSpacing( 0.5 )
	ReticleTextR:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ReticleTextR:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ReticleTextR )
	self.ReticleTextR = ReticleTextR
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local ReticleTextTFrame2 = function ( ReticleTextT, event )
					local ReticleTextTFrame3 = function ( ReticleTextT, event )
						local ReticleTextTFrame4 = function ( ReticleTextT, event )
							local ReticleTextTFrame5 = function ( ReticleTextT, event )
								local ReticleTextTFrame6 = function ( ReticleTextT, event )
									local ReticleTextTFrame7 = function ( ReticleTextT, event )
										local ReticleTextTFrame8 = function ( ReticleTextT, event )
											local ReticleTextTFrame9 = function ( ReticleTextT, event )
												local ReticleTextTFrame10 = function ( ReticleTextT, event )
													local ReticleTextTFrame11 = function ( ReticleTextT, event )
														local ReticleTextTFrame12 = function ( ReticleTextT, event )
															local ReticleTextTFrame13 = function ( ReticleTextT, event )
																local ReticleTextTFrame14 = function ( ReticleTextT, event )
																	local ReticleTextTFrame15 = function ( ReticleTextT, event )
																		local ReticleTextTFrame16 = function ( ReticleTextT, event )
																			local ReticleTextTFrame17 = function ( ReticleTextT, event )
																				if not event.interrupted then
																					ReticleTextT:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
																				end
																				ReticleTextT:setText( Engine.Localize( "79" ) )
																				if event.interrupted then
																					self.clipFinished( ReticleTextT, event )
																				else
																					ReticleTextT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ReticleTextTFrame17( ReticleTextT, event )
																				return 
																			else
																				ReticleTextT:beginAnimation( "keyframe", 2560, false, false, CoD.TweenType.Linear )
																				ReticleTextT:setText( Engine.Localize( "79" ) )
																				ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ReticleTextTFrame16( ReticleTextT, event )
																			return 
																		else
																			ReticleTextT:beginAnimation( "keyframe", 719, false, false, CoD.TweenType.Linear )
																			ReticleTextT:setText( Engine.Localize( "82" ) )
																			ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ReticleTextTFrame15( ReticleTextT, event )
																		return 
																	else
																		ReticleTextT:beginAnimation( "keyframe", 1460, false, false, CoD.TweenType.Linear )
																		ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame15 )
																	end
																end
																
																if event.interrupted then
																	ReticleTextTFrame14( ReticleTextT, event )
																	return 
																else
																	ReticleTextT:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
																	ReticleTextT:setText( Engine.Localize( "83" ) )
																	ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame14 )
																end
															end
															
															if event.interrupted then
																ReticleTextTFrame13( ReticleTextT, event )
																return 
															else
																ReticleTextT:beginAnimation( "keyframe", 1960, false, false, CoD.TweenType.Linear )
																ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame13 )
															end
														end
														
														if event.interrupted then
															ReticleTextTFrame12( ReticleTextT, event )
															return 
														else
															ReticleTextT:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
															ReticleTextT:setText( Engine.Localize( "84" ) )
															ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame12 )
														end
													end
													
													if event.interrupted then
														ReticleTextTFrame11( ReticleTextT, event )
														return 
													else
														ReticleTextT:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
														ReticleTextT:setText( Engine.Localize( "86" ) )
														ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame11 )
													end
												end
												
												if event.interrupted then
													ReticleTextTFrame10( ReticleTextT, event )
													return 
												else
													ReticleTextT:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
													ReticleTextT:setText( Engine.Localize( "88" ) )
													ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame10 )
												end
											end
											
											if event.interrupted then
												ReticleTextTFrame9( ReticleTextT, event )
												return 
											else
												ReticleTextT:beginAnimation( "keyframe", 1460, false, false, CoD.TweenType.Linear )
												ReticleTextT:setText( Engine.Localize( "90" ) )
												ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame9 )
											end
										end
										
										if event.interrupted then
											ReticleTextTFrame8( ReticleTextT, event )
											return 
										else
											ReticleTextT:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
											ReticleTextT:setText( Engine.Localize( "92" ) )
											ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame8 )
										end
									end
									
									if event.interrupted then
										ReticleTextTFrame7( ReticleTextT, event )
										return 
									else
										ReticleTextT:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
										ReticleTextT:setText( Engine.Localize( "90" ) )
										ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame7 )
									end
								end
								
								if event.interrupted then
									ReticleTextTFrame6( ReticleTextT, event )
									return 
								else
									ReticleTextT:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
									ReticleTextT:setText( Engine.Localize( "88" ) )
									ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame6 )
								end
							end
							
							if event.interrupted then
								ReticleTextTFrame5( ReticleTextT, event )
								return 
							else
								ReticleTextT:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
								ReticleTextT:setText( Engine.Localize( "86" ) )
								ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleTextTFrame4( ReticleTextT, event )
							return 
						else
							ReticleTextT:beginAnimation( "keyframe", 1320, false, false, CoD.TweenType.Linear )
							ReticleTextT:setText( Engine.Localize( "84" ) )
							ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleTextTFrame3( ReticleTextT, event )
						return 
					else
						ReticleTextT:beginAnimation( "keyframe", 1360, false, false, CoD.TweenType.Linear )
						ReticleTextT:setText( Engine.Localize( "82" ) )
						ReticleTextT:registerEventHandler( "transition_complete_keyframe", ReticleTextTFrame3 )
					end
				end
				
				ReticleTextT:completeAnimation()
				self.ReticleTextT:setText( Engine.Localize( "80" ) )
				ReticleTextTFrame2( ReticleTextT, {} )
				local ReticleTextLFrame2 = function ( ReticleTextL, event )
					local ReticleTextLFrame3 = function ( ReticleTextL, event )
						local ReticleTextLFrame4 = function ( ReticleTextL, event )
							local ReticleTextLFrame5 = function ( ReticleTextL, event )
								local ReticleTextLFrame6 = function ( ReticleTextL, event )
									local ReticleTextLFrame7 = function ( ReticleTextL, event )
										local ReticleTextLFrame8 = function ( ReticleTextL, event )
											local ReticleTextLFrame9 = function ( ReticleTextL, event )
												local ReticleTextLFrame10 = function ( ReticleTextL, event )
													if not event.interrupted then
														ReticleTextL:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
													end
													ReticleTextL:setText( Engine.Localize( "X-0/172" ) )
													if event.interrupted then
														self.clipFinished( ReticleTextL, event )
													else
														ReticleTextL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ReticleTextLFrame10( ReticleTextL, event )
													return 
												else
													ReticleTextL:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
													ReticleTextL:setText( Engine.Localize( "X-0/172" ) )
													ReticleTextL:registerEventHandler( "transition_complete_keyframe", ReticleTextLFrame10 )
												end
											end
											
											if event.interrupted then
												ReticleTextLFrame9( ReticleTextL, event )
												return 
											else
												ReticleTextL:beginAnimation( "keyframe", 2859, false, false, CoD.TweenType.Linear )
												ReticleTextL:setText( Engine.Localize( "X-0/146" ) )
												ReticleTextL:registerEventHandler( "transition_complete_keyframe", ReticleTextLFrame9 )
											end
										end
										
										if event.interrupted then
											ReticleTextLFrame8( ReticleTextL, event )
											return 
										else
											ReticleTextL:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
											ReticleTextL:setText( Engine.Localize( "X-0/145" ) )
											ReticleTextL:registerEventHandler( "transition_complete_keyframe", ReticleTextLFrame8 )
										end
									end
									
									if event.interrupted then
										ReticleTextLFrame7( ReticleTextL, event )
										return 
									else
										ReticleTextL:beginAnimation( "keyframe", 2719, false, false, CoD.TweenType.Linear )
										ReticleTextL:setText( Engine.Localize( "X-0/141" ) )
										ReticleTextL:registerEventHandler( "transition_complete_keyframe", ReticleTextLFrame7 )
									end
								end
								
								if event.interrupted then
									ReticleTextLFrame6( ReticleTextL, event )
									return 
								else
									ReticleTextL:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
									ReticleTextL:setText( Engine.Localize( "X-0/142" ) )
									ReticleTextL:registerEventHandler( "transition_complete_keyframe", ReticleTextLFrame6 )
								end
							end
							
							if event.interrupted then
								ReticleTextLFrame5( ReticleTextL, event )
								return 
							else
								ReticleTextL:beginAnimation( "keyframe", 1900, false, false, CoD.TweenType.Linear )
								ReticleTextL:setText( Engine.Localize( "X-0/143" ) )
								ReticleTextL:registerEventHandler( "transition_complete_keyframe", ReticleTextLFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleTextLFrame4( ReticleTextL, event )
							return 
						else
							ReticleTextL:beginAnimation( "keyframe", 1879, false, false, CoD.TweenType.Linear )
							ReticleTextL:setText( Engine.Localize( "X-0/165" ) )
							ReticleTextL:registerEventHandler( "transition_complete_keyframe", ReticleTextLFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleTextLFrame3( ReticleTextL, event )
						return 
					else
						ReticleTextL:beginAnimation( "keyframe", 3200, false, false, CoD.TweenType.Linear )
						ReticleTextL:registerEventHandler( "transition_complete_keyframe", ReticleTextLFrame3 )
					end
				end
				
				ReticleTextL:completeAnimation()
				self.ReticleTextL:setText( Engine.Localize( "X-0/190" ) )
				ReticleTextLFrame2( ReticleTextL, {} )
				local ReticleTextRFrame2 = function ( ReticleTextR, event )
					local ReticleTextRFrame3 = function ( ReticleTextR, event )
						local ReticleTextRFrame4 = function ( ReticleTextR, event )
							local ReticleTextRFrame5 = function ( ReticleTextR, event )
								local ReticleTextRFrame6 = function ( ReticleTextR, event )
									local ReticleTextRFrame7 = function ( ReticleTextR, event )
										local ReticleTextRFrame8 = function ( ReticleTextR, event )
											if not event.interrupted then
												ReticleTextR:beginAnimation( "keyframe", 3080, false, false, CoD.TweenType.Linear )
											end
											ReticleTextR:setText( Engine.Localize( "X-0/90" ) )
											if event.interrupted then
												self.clipFinished( ReticleTextR, event )
											else
												ReticleTextR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ReticleTextRFrame8( ReticleTextR, event )
											return 
										else
											ReticleTextR:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
											ReticleTextR:setText( Engine.Localize( "X-0/94" ) )
											ReticleTextR:registerEventHandler( "transition_complete_keyframe", ReticleTextRFrame8 )
										end
									end
									
									if event.interrupted then
										ReticleTextRFrame7( ReticleTextR, event )
										return 
									else
										ReticleTextR:beginAnimation( "keyframe", 3460, false, false, CoD.TweenType.Linear )
										ReticleTextR:setText( Engine.Localize( "X-0/92" ) )
										ReticleTextR:registerEventHandler( "transition_complete_keyframe", ReticleTextRFrame7 )
									end
								end
								
								if event.interrupted then
									ReticleTextRFrame6( ReticleTextR, event )
									return 
								else
									ReticleTextR:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
									ReticleTextR:setText( Engine.Localize( "X-0/86" ) )
									ReticleTextR:registerEventHandler( "transition_complete_keyframe", ReticleTextRFrame6 )
								end
							end
							
							if event.interrupted then
								ReticleTextRFrame5( ReticleTextR, event )
								return 
							else
								ReticleTextR:beginAnimation( "keyframe", 5220, false, false, CoD.TweenType.Linear )
								ReticleTextR:setText( Engine.Localize( "X-0/84" ) )
								ReticleTextR:registerEventHandler( "transition_complete_keyframe", ReticleTextRFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleTextRFrame4( ReticleTextR, event )
							return 
						else
							ReticleTextR:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							ReticleTextR:setText( Engine.Localize( "X-0/92" ) )
							ReticleTextR:registerEventHandler( "transition_complete_keyframe", ReticleTextRFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleTextRFrame3( ReticleTextR, event )
						return 
					else
						ReticleTextR:beginAnimation( "keyframe", 1820, false, false, CoD.TweenType.Linear )
						ReticleTextR:registerEventHandler( "transition_complete_keyframe", ReticleTextRFrame3 )
					end
				end
				
				ReticleTextR:completeAnimation()
				self.ReticleTextR:setText( Engine.Localize( "X-0/90" ) )
				ReticleTextRFrame2( ReticleTextR, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

