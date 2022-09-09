-- 4d8a6efdff4ac1e3e8576d0650bed5a0
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ReticleTop = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ReticleTop.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ReticleTop )
	self.id = "VehicleGround_ReticleTop"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 52 )
	self:setTopBottom( true, false, 0, 42 )
	
	local ReticleUElement = LUI.UIImage.new()
	ReticleUElement:setLeftRight( false, false, -16, 16 )
	ReticleUElement:setTopBottom( false, false, -21, 11 )
	ReticleUElement:setRGB( 0.74, 0.94, 0.99 )
	ReticleUElement:setAlpha( 0.6 )
	ReticleUElement:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticleuelement" ) )
	ReticleUElement:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleUElement )
	self.ReticleUElement = ReticleUElement
	
	local ReticleUElementText = LUI.UIText.new()
	ReticleUElementText:setLeftRight( false, false, -26, 26 )
	ReticleUElementText:setTopBottom( false, false, 12, 21 )
	ReticleUElementText:setAlpha( 0.54 )
	ReticleUElementText:setText( Engine.Localize( "9" ) )
	ReticleUElementText:setTTF( "fonts/escom.ttf" )
	ReticleUElementText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ReticleUElementText:setShaderVector( 0, 0.05, 0.4, 0, 0 )
	ReticleUElementText:setShaderVector( 1, 0, 0, 0, 0 )
	ReticleUElementText:setShaderVector( 2, 0, 0, 0, 0 )
	ReticleUElementText:setShaderVector( 3, 0, 0, 0, 0 )
	ReticleUElementText:setShaderVector( 4, 0, 0, 0, 0 )
	ReticleUElementText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ReticleUElementText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ReticleUElementText )
	self.ReticleUElementText = ReticleUElementText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local ReticleUElementTextFrame2 = function ( ReticleUElementText, event )
					local ReticleUElementTextFrame3 = function ( ReticleUElementText, event )
						local ReticleUElementTextFrame4 = function ( ReticleUElementText, event )
							local ReticleUElementTextFrame5 = function ( ReticleUElementText, event )
								local ReticleUElementTextFrame6 = function ( ReticleUElementText, event )
									local ReticleUElementTextFrame7 = function ( ReticleUElementText, event )
										local ReticleUElementTextFrame8 = function ( ReticleUElementText, event )
											local ReticleUElementTextFrame9 = function ( ReticleUElementText, event )
												local ReticleUElementTextFrame10 = function ( ReticleUElementText, event )
													local ReticleUElementTextFrame11 = function ( ReticleUElementText, event )
														local ReticleUElementTextFrame12 = function ( ReticleUElementText, event )
															local ReticleUElementTextFrame13 = function ( ReticleUElementText, event )
																local ReticleUElementTextFrame14 = function ( ReticleUElementText, event )
																	local ReticleUElementTextFrame15 = function ( ReticleUElementText, event )
																		local ReticleUElementTextFrame16 = function ( ReticleUElementText, event )
																			local ReticleUElementTextFrame17 = function ( ReticleUElementText, event )
																				local ReticleUElementTextFrame18 = function ( ReticleUElementText, event )
																					local ReticleUElementTextFrame19 = function ( ReticleUElementText, event )
																						local ReticleUElementTextFrame20 = function ( ReticleUElementText, event )
																							local ReticleUElementTextFrame21 = function ( ReticleUElementText, event )
																								local ReticleUElementTextFrame22 = function ( ReticleUElementText, event )
																									local ReticleUElementTextFrame23 = function ( ReticleUElementText, event )
																										local ReticleUElementTextFrame24 = function ( ReticleUElementText, event )
																											local ReticleUElementTextFrame25 = function ( ReticleUElementText, event )
																												local ReticleUElementTextFrame26 = function ( ReticleUElementText, event )
																													if not event.interrupted then
																														ReticleUElementText:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
																													end
																													ReticleUElementText:setText( Engine.Localize( "9" ) )
																													if event.interrupted then
																														self.clipFinished( ReticleUElementText, event )
																													else
																														ReticleUElementText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																													end
																												end
																												
																												if event.interrupted then
																													ReticleUElementTextFrame26( ReticleUElementText, event )
																													return 
																												else
																													ReticleUElementText:beginAnimation( "keyframe", 1860, false, false, CoD.TweenType.Linear )
																													ReticleUElementText:setText( Engine.Localize( "9" ) )
																													ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ReticleUElementTextFrame25( ReticleUElementText, event )
																												return 
																											else
																												ReticleUElementText:beginAnimation( "keyframe", 1329, false, false, CoD.TweenType.Linear )
																												ReticleUElementText:setText( Engine.Localize( "10" ) )
																												ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ReticleUElementTextFrame24( ReticleUElementText, event )
																											return 
																										else
																											ReticleUElementText:beginAnimation( "keyframe", 1789, false, false, CoD.TweenType.Linear )
																											ReticleUElementText:setText( Engine.Localize( "11" ) )
																											ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ReticleUElementTextFrame23( ReticleUElementText, event )
																										return 
																									else
																										ReticleUElementText:beginAnimation( "keyframe", 4269, false, false, CoD.TweenType.Linear )
																										ReticleUElementText:setText( Engine.Localize( "12" ) )
																										ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ReticleUElementTextFrame22( ReticleUElementText, event )
																									return 
																								else
																									ReticleUElementText:beginAnimation( "keyframe", 880, false, false, CoD.TweenType.Linear )
																									ReticleUElementText:setText( Engine.Localize( "13" ) )
																									ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ReticleUElementTextFrame21( ReticleUElementText, event )
																								return 
																							else
																								ReticleUElementText:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
																								ReticleUElementText:setText( Engine.Localize( "14" ) )
																								ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ReticleUElementTextFrame20( ReticleUElementText, event )
																							return 
																						else
																							ReticleUElementText:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
																							ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ReticleUElementTextFrame19( ReticleUElementText, event )
																						return 
																					else
																						ReticleUElementText:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
																						ReticleUElementText:setText( Engine.Localize( "15" ) )
																						ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ReticleUElementTextFrame18( ReticleUElementText, event )
																					return 
																				else
																					ReticleUElementText:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																					ReticleUElementText:setText( Engine.Localize( "16" ) )
																					ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ReticleUElementTextFrame17( ReticleUElementText, event )
																				return 
																			else
																				ReticleUElementText:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
																				ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ReticleUElementTextFrame16( ReticleUElementText, event )
																			return 
																		else
																			ReticleUElementText:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																			ReticleUElementText:setText( Engine.Localize( "17" ) )
																			ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ReticleUElementTextFrame15( ReticleUElementText, event )
																		return 
																	else
																		ReticleUElementText:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																		ReticleUElementText:setText( Engine.Localize( "16" ) )
																		ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	ReticleUElementTextFrame14( ReticleUElementText, event )
																	return 
																else
																	ReticleUElementText:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
																	ReticleUElementText:setText( Engine.Localize( "17" ) )
																	ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame14 )
																end
															end
															
															if event.interrupted then
																ReticleUElementTextFrame13( ReticleUElementText, event )
																return 
															else
																ReticleUElementText:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
																ReticleUElementText:setText( Engine.Localize( "16" ) )
																ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame13 )
															end
														end
														
														if event.interrupted then
															ReticleUElementTextFrame12( ReticleUElementText, event )
															return 
														else
															ReticleUElementText:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
															ReticleUElementText:setText( Engine.Localize( "15" ) )
															ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame12 )
														end
													end
													
													if event.interrupted then
														ReticleUElementTextFrame11( ReticleUElementText, event )
														return 
													else
														ReticleUElementText:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
														ReticleUElementText:setText( Engine.Localize( "14" ) )
														ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame11 )
													end
												end
												
												if event.interrupted then
													ReticleUElementTextFrame10( ReticleUElementText, event )
													return 
												else
													ReticleUElementText:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
													ReticleUElementText:setText( Engine.Localize( "13" ) )
													ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame10 )
												end
											end
											
											if event.interrupted then
												ReticleUElementTextFrame9( ReticleUElementText, event )
												return 
											else
												ReticleUElementText:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												ReticleUElementText:setText( Engine.Localize( "12" ) )
												ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame9 )
											end
										end
										
										if event.interrupted then
											ReticleUElementTextFrame8( ReticleUElementText, event )
											return 
										else
											ReticleUElementText:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
											ReticleUElementText:setText( Engine.Localize( "11" ) )
											ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame8 )
										end
									end
									
									if event.interrupted then
										ReticleUElementTextFrame7( ReticleUElementText, event )
										return 
									else
										ReticleUElementText:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
										ReticleUElementText:setText( Engine.Localize( "10" ) )
										ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame7 )
									end
								end
								
								if event.interrupted then
									ReticleUElementTextFrame6( ReticleUElementText, event )
									return 
								else
									ReticleUElementText:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									ReticleUElementText:setText( Engine.Localize( "9" ) )
									ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame6 )
								end
							end
							
							if event.interrupted then
								ReticleUElementTextFrame5( ReticleUElementText, event )
								return 
							else
								ReticleUElementText:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
								ReticleUElementText:setText( Engine.Localize( "8" ) )
								ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame5 )
							end
						end
						
						if event.interrupted then
							ReticleUElementTextFrame4( ReticleUElementText, event )
							return 
						else
							ReticleUElementText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							ReticleUElementText:setText( Engine.Localize( "9" ) )
							ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame4 )
						end
					end
					
					if event.interrupted then
						ReticleUElementTextFrame3( ReticleUElementText, event )
						return 
					else
						ReticleUElementText:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						ReticleUElementText:registerEventHandler( "transition_complete_keyframe", ReticleUElementTextFrame3 )
					end
				end
				
				ReticleUElementText:completeAnimation()
				self.ReticleUElementText:setText( Engine.Localize( "10" ) )
				ReticleUElementTextFrame2( ReticleUElementText, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
