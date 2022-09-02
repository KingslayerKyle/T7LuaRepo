-- cd8bfd473249d2f858ce1051abce4972
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Effects.fxGlitch1_9" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_8" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_7" )

CoD.DniWipe_PurgingTextWidget = InheritFrom( LUI.UIElement )
CoD.DniWipe_PurgingTextWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_PurgingTextWidget )
	self.id = "DniWipe_PurgingTextWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 223 )
	self:setTopBottom( true, false, 0, 49 )
	
	local RedFrame = LUI.UIImage.new()
	RedFrame:setLeftRight( false, false, 111.5, -111.5 )
	RedFrame:setTopBottom( true, false, 3, 42.5 )
	RedFrame:setRGB( 0.58, 0, 0 )
	RedFrame:setAlpha( 0.2 )
	self:addElement( RedFrame )
	self.RedFrame = RedFrame
	
	local PurgingText = LUI.UIText.new()
	PurgingText:setLeftRight( false, false, -111.5, 111.5 )
	PurgingText:setTopBottom( true, false, 0.65, 48.65 )
	PurgingText:setRGB( 0.76, 0.88, 0.9 )
	PurgingText:setAlpha( 0.85 )
	PurgingText:setText( Engine.Localize( "MP_HUD_DNIWIPE_PURGING" ) )
	PurgingText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	PurgingText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	PurgingText:setShaderVector( 0, 0, 1, 0, 0 )
	PurgingText:setShaderVector( 1, 0, 0, 0, 0 )
	PurgingText:setShaderVector( 2, 0, 0, 0, 0 )
	PurgingText:setShaderVector( 3, 0, 0, 0, 0 )
	PurgingText:setShaderVector( 4, 0, 0, 0, 0 )
	PurgingText:setLetterSpacing( 4 )
	PurgingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PurgingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( PurgingText, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 0 )
	end )
	self:addElement( PurgingText )
	self.PurgingText = PurgingText
	
	local fxGlitch1900 = CoD.fxGlitch1_9.new( menu, controller )
	fxGlitch1900:setLeftRight( true, true, 118, -118 )
	fxGlitch1900:setTopBottom( true, true, 24.5, -64 )
	fxGlitch1900:setAlpha( 0.32 )
	self:addElement( fxGlitch1900 )
	self.fxGlitch1900 = fxGlitch1900
	
	local fxGlitch1800 = CoD.fxGlitch1_8.new( menu, controller )
	fxGlitch1800:setLeftRight( true, true, 0, 0 )
	fxGlitch1800:setTopBottom( true, true, 37.5, -41 )
	fxGlitch1800:setAlpha( 0.96 )
	self:addElement( fxGlitch1800 )
	self.fxGlitch1800 = fxGlitch1800
	
	local fxGlitch1700 = CoD.fxGlitch1_7.new( menu, controller )
	fxGlitch1700:setLeftRight( true, true, 0, 0 )
	fxGlitch1700:setTopBottom( true, true, 39.25, -39.25 )
	fxGlitch1700:setAlpha( 0.21 )
	self:addElement( fxGlitch1700 )
	self.fxGlitch1700 = fxGlitch1700
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local RedFrameFrame2 = function ( RedFrame, event )
					local RedFrameFrame3 = function ( RedFrame, event )
						local RedFrameFrame4 = function ( RedFrame, event )
							local RedFrameFrame5 = function ( RedFrame, event )
								local RedFrameFrame6 = function ( RedFrame, event )
									local RedFrameFrame7 = function ( RedFrame, event )
										local RedFrameFrame8 = function ( RedFrame, event )
											local RedFrameFrame9 = function ( RedFrame, event )
												local RedFrameFrame10 = function ( RedFrame, event )
													local RedFrameFrame11 = function ( RedFrame, event )
														local RedFrameFrame12 = function ( RedFrame, event )
															local RedFrameFrame13 = function ( RedFrame, event )
																local RedFrameFrame14 = function ( RedFrame, event )
																	local RedFrameFrame15 = function ( RedFrame, event )
																		local RedFrameFrame16 = function ( RedFrame, event )
																			if not event.interrupted then
																				RedFrame:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			end
																			RedFrame:setAlpha( 0.2 )
																			if event.interrupted then
																				self.clipFinished( RedFrame, event )
																			else
																				RedFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			RedFrameFrame16( RedFrame, event )
																			return 
																		else
																			RedFrame:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
																			RedFrame:setAlpha( 0.1 )
																			RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		RedFrameFrame15( RedFrame, event )
																		return 
																	else
																		RedFrame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																		RedFrame:setAlpha( 0.2 )
																		RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame15 )
																	end
																end
																
																if event.interrupted then
																	RedFrameFrame14( RedFrame, event )
																	return 
																else
																	RedFrame:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	RedFrame:setAlpha( 0.13 )
																	RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame14 )
																end
															end
															
															if event.interrupted then
																RedFrameFrame13( RedFrame, event )
																return 
															else
																RedFrame:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
																RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame13 )
															end
														end
														
														if event.interrupted then
															RedFrameFrame12( RedFrame, event )
															return 
														else
															RedFrame:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
															RedFrame:setAlpha( 0.2 )
															RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame12 )
														end
													end
													
													if event.interrupted then
														RedFrameFrame11( RedFrame, event )
														return 
													else
														RedFrame:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
														RedFrame:setAlpha( 0.1 )
														RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame11 )
													end
												end
												
												if event.interrupted then
													RedFrameFrame10( RedFrame, event )
													return 
												else
													RedFrame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													RedFrame:setAlpha( 0.2 )
													RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame10 )
												end
											end
											
											if event.interrupted then
												RedFrameFrame9( RedFrame, event )
												return 
											else
												RedFrame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												RedFrame:setAlpha( 0.05 )
												RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame9 )
											end
										end
										
										if event.interrupted then
											RedFrameFrame8( RedFrame, event )
											return 
										else
											RedFrame:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
											RedFrame:setAlpha( 0.2 )
											RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame8 )
										end
									end
									
									if event.interrupted then
										RedFrameFrame7( RedFrame, event )
										return 
									else
										RedFrame:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
										RedFrame:setAlpha( 0.05 )
										RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame7 )
									end
								end
								
								if event.interrupted then
									RedFrameFrame6( RedFrame, event )
									return 
								else
									RedFrame:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
									RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame6 )
								end
							end
							
							if event.interrupted then
								RedFrameFrame5( RedFrame, event )
								return 
							else
								RedFrame:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								RedFrame:setAlpha( 0.2 )
								RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame5 )
							end
						end
						
						if event.interrupted then
							RedFrameFrame4( RedFrame, event )
							return 
						else
							RedFrame:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							RedFrame:setAlpha( 0.1 )
							RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame4 )
						end
					end
					
					if event.interrupted then
						RedFrameFrame3( RedFrame, event )
						return 
					else
						RedFrame:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						RedFrame:registerEventHandler( "transition_complete_keyframe", RedFrameFrame3 )
					end
				end
				
				RedFrame:completeAnimation()
				self.RedFrame:setAlpha( 0.2 )
				RedFrameFrame2( RedFrame, {} )
				local PurgingTextFrame2 = function ( PurgingText, event )
					local PurgingTextFrame3 = function ( PurgingText, event )
						local PurgingTextFrame4 = function ( PurgingText, event )
							local PurgingTextFrame5 = function ( PurgingText, event )
								local PurgingTextFrame6 = function ( PurgingText, event )
									local PurgingTextFrame7 = function ( PurgingText, event )
										local PurgingTextFrame8 = function ( PurgingText, event )
											local PurgingTextFrame9 = function ( PurgingText, event )
												local PurgingTextFrame10 = function ( PurgingText, event )
													local PurgingTextFrame11 = function ( PurgingText, event )
														local PurgingTextFrame12 = function ( PurgingText, event )
															local PurgingTextFrame13 = function ( PurgingText, event )
																local PurgingTextFrame14 = function ( PurgingText, event )
																	local PurgingTextFrame15 = function ( PurgingText, event )
																		local PurgingTextFrame16 = function ( PurgingText, event )
																			local PurgingTextFrame17 = function ( PurgingText, event )
																				local PurgingTextFrame18 = function ( PurgingText, event )
																					local PurgingTextFrame19 = function ( PurgingText, event )
																						local PurgingTextFrame20 = function ( PurgingText, event )
																							local PurgingTextFrame21 = function ( PurgingText, event )
																								local PurgingTextFrame22 = function ( PurgingText, event )
																									local PurgingTextFrame23 = function ( PurgingText, event )
																										local PurgingTextFrame24 = function ( PurgingText, event )
																											local PurgingTextFrame25 = function ( PurgingText, event )
																												local PurgingTextFrame26 = function ( PurgingText, event )
																													local PurgingTextFrame27 = function ( PurgingText, event )
																														if not event.interrupted then
																															PurgingText:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
																														end
																														PurgingText:setLeftRight( true, true, 0, 0 )
																														PurgingText:setTopBottom( false, false, -24.5, 24.15 )
																														PurgingText:setAlpha( 0.8 )
																														PurgingText:setXRot( 0 )
																														if event.interrupted then
																															self.clipFinished( PurgingText, event )
																														else
																															PurgingText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																														end
																													end
																													
																													if event.interrupted then
																														PurgingTextFrame27( PurgingText, event )
																														return 
																													else
																														PurgingText:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																														PurgingText:setAlpha( 0.86 )
																														PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													PurgingTextFrame26( PurgingText, event )
																													return 
																												else
																													PurgingText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
																													PurgingText:setAlpha( 0.67 )
																													PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												PurgingTextFrame25( PurgingText, event )
																												return 
																											else
																												PurgingText:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																												PurgingText:setAlpha( 1 )
																												PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											PurgingTextFrame24( PurgingText, event )
																											return 
																										else
																											PurgingText:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																											PurgingText:setAlpha( 0.42 )
																											PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										PurgingTextFrame23( PurgingText, event )
																										return 
																									else
																										PurgingText:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																										PurgingText:setAlpha( 0.7 )
																										PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									PurgingTextFrame22( PurgingText, event )
																									return 
																								else
																									PurgingText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																									PurgingText:setAlpha( 1 )
																									PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								PurgingTextFrame21( PurgingText, event )
																								return 
																							else
																								PurgingText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																								PurgingText:setAlpha( 0 )
																								PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							PurgingTextFrame20( PurgingText, event )
																							return 
																						else
																							PurgingText:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																							PurgingText:setAlpha( 0.86 )
																							PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						PurgingTextFrame19( PurgingText, event )
																						return 
																					else
																						PurgingText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																						PurgingText:setAlpha( 0.91 )
																						PurgingText:setXRot( 0 )
																						PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					PurgingTextFrame18( PurgingText, event )
																					return 
																				else
																					PurgingText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																					PurgingText:setAlpha( 0.93 )
																					PurgingText:setXRot( 86 )
																					PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				PurgingTextFrame17( PurgingText, event )
																				return 
																			else
																				PurgingText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																				PurgingText:setAlpha( 0.94 )
																				PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PurgingTextFrame16( PurgingText, event )
																			return 
																		else
																			PurgingText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																			PurgingText:setAlpha( 1 )
																			PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PurgingTextFrame15( PurgingText, event )
																		return 
																	else
																		PurgingText:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																		PurgingText:setAlpha( 0.74 )
																		PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame15 )
																	end
																end
																
																if event.interrupted then
																	PurgingTextFrame14( PurgingText, event )
																	return 
																else
																	PurgingText:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																	PurgingText:setAlpha( 0.93 )
																	PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame14 )
																end
															end
															
															if event.interrupted then
																PurgingTextFrame13( PurgingText, event )
																return 
															else
																PurgingText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																PurgingText:setAlpha( 0.74 )
																PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame13 )
															end
														end
														
														if event.interrupted then
															PurgingTextFrame12( PurgingText, event )
															return 
														else
															PurgingText:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
															PurgingText:setAlpha( 0.53 )
															PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame12 )
														end
													end
													
													if event.interrupted then
														PurgingTextFrame11( PurgingText, event )
														return 
													else
														PurgingText:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
														PurgingText:setAlpha( 1 )
														PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame11 )
													end
												end
												
												if event.interrupted then
													PurgingTextFrame10( PurgingText, event )
													return 
												else
													PurgingText:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													PurgingText:setAlpha( 0.56 )
													PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame10 )
												end
											end
											
											if event.interrupted then
												PurgingTextFrame9( PurgingText, event )
												return 
											else
												PurgingText:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												PurgingText:setAlpha( 0.95 )
												PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame9 )
											end
										end
										
										if event.interrupted then
											PurgingTextFrame8( PurgingText, event )
											return 
										else
											PurgingText:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
											PurgingText:setAlpha( 0.7 )
											PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame8 )
										end
									end
									
									if event.interrupted then
										PurgingTextFrame7( PurgingText, event )
										return 
									else
										PurgingText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PurgingText:setAlpha( 0.81 )
										PurgingText:setXRot( 0 )
										PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame7 )
									end
								end
								
								if event.interrupted then
									PurgingTextFrame6( PurgingText, event )
									return 
								else
									PurgingText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									PurgingText:setAlpha( 0.83 )
									PurgingText:setXRot( 85 )
									PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame6 )
								end
							end
							
							if event.interrupted then
								PurgingTextFrame5( PurgingText, event )
								return 
							else
								PurgingText:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
								PurgingText:setAlpha( 0.85 )
								PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame5 )
							end
						end
						
						if event.interrupted then
							PurgingTextFrame4( PurgingText, event )
							return 
						else
							PurgingText:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
							PurgingText:setAlpha( 1 )
							PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame4 )
						end
					end
					
					if event.interrupted then
						PurgingTextFrame3( PurgingText, event )
						return 
					else
						PurgingText:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						PurgingText:setAlpha( 0.5 )
						PurgingText:registerEventHandler( "transition_complete_keyframe", PurgingTextFrame3 )
					end
				end
				
				PurgingText:completeAnimation()
				self.PurgingText:setLeftRight( true, true, 0, 0 )
				self.PurgingText:setTopBottom( false, false, -24.5, 24.15 )
				self.PurgingText:setAlpha( 0.8 )
				self.PurgingText:setXRot( 0 )
				PurgingTextFrame2( PurgingText, {} )
				local fxGlitch1900Frame2 = function ( fxGlitch1900, event )
					local fxGlitch1900Frame3 = function ( fxGlitch1900, event )
						local fxGlitch1900Frame4 = function ( fxGlitch1900, event )
							local fxGlitch1900Frame5 = function ( fxGlitch1900, event )
								local fxGlitch1900Frame6 = function ( fxGlitch1900, event )
									local fxGlitch1900Frame7 = function ( fxGlitch1900, event )
										local fxGlitch1900Frame8 = function ( fxGlitch1900, event )
											local fxGlitch1900Frame9 = function ( fxGlitch1900, event )
												local fxGlitch1900Frame10 = function ( fxGlitch1900, event )
													if not event.interrupted then
														fxGlitch1900:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													end
													fxGlitch1900:setLeftRight( true, true, 190, -46 )
													fxGlitch1900:setTopBottom( true, true, 29.5, -59 )
													fxGlitch1900:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( fxGlitch1900, event )
													else
														fxGlitch1900:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													fxGlitch1900Frame10( fxGlitch1900, event )
													return 
												else
													fxGlitch1900:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													fxGlitch1900:setAlpha( 0.63 )
													fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame10 )
												end
											end
											
											if event.interrupted then
												fxGlitch1900Frame9( fxGlitch1900, event )
												return 
											else
												fxGlitch1900:beginAnimation( "keyframe", 1580, false, false, CoD.TweenType.Linear )
												fxGlitch1900:setLeftRight( true, true, 190, -46 )
												fxGlitch1900:setTopBottom( true, true, 29.5, -59 )
												fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1900Frame8( fxGlitch1900, event )
											return 
										else
											fxGlitch1900:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											fxGlitch1900:setAlpha( 0 )
											fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1900Frame7( fxGlitch1900, event )
										return 
									else
										fxGlitch1900:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										fxGlitch1900:setAlpha( 0.27 )
										fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1900Frame6( fxGlitch1900, event )
									return 
								else
									fxGlitch1900:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
									fxGlitch1900:setLeftRight( true, true, 30, -206 )
									fxGlitch1900:setTopBottom( true, true, 53.5, -35 )
									fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1900Frame5( fxGlitch1900, event )
								return 
							else
								fxGlitch1900:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								fxGlitch1900:setAlpha( 0 )
								fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1900Frame4( fxGlitch1900, event )
							return 
						else
							fxGlitch1900:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							fxGlitch1900:setAlpha( 0.43 )
							fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1900Frame3( fxGlitch1900, event )
						return 
					else
						fxGlitch1900:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						fxGlitch1900:registerEventHandler( "transition_complete_keyframe", fxGlitch1900Frame3 )
					end
				end
				
				fxGlitch1900:completeAnimation()
				self.fxGlitch1900:setLeftRight( true, true, 118, -118 )
				self.fxGlitch1900:setTopBottom( true, true, 24.5, -64 )
				self.fxGlitch1900:setAlpha( 0 )
				fxGlitch1900Frame2( fxGlitch1900, {} )
				local fxGlitch1800Frame2 = function ( fxGlitch1800, event )
					local fxGlitch1800Frame3 = function ( fxGlitch1800, event )
						local fxGlitch1800Frame4 = function ( fxGlitch1800, event )
							local fxGlitch1800Frame5 = function ( fxGlitch1800, event )
								local fxGlitch1800Frame6 = function ( fxGlitch1800, event )
									local fxGlitch1800Frame7 = function ( fxGlitch1800, event )
										if not event.interrupted then
											fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										end
										fxGlitch1800:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( fxGlitch1800, event )
										else
											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										fxGlitch1800Frame7( fxGlitch1800, event )
										return 
									else
										fxGlitch1800:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										fxGlitch1800:setAlpha( 0.47 )
										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1800Frame6( fxGlitch1800, event )
									return 
								else
									fxGlitch1800:beginAnimation( "keyframe", 1420, false, false, CoD.TweenType.Linear )
									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1800Frame5( fxGlitch1800, event )
								return 
							else
								fxGlitch1800:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								fxGlitch1800:setAlpha( 0 )
								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1800Frame4( fxGlitch1800, event )
							return 
						else
							fxGlitch1800:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							fxGlitch1800:setAlpha( 0.4 )
							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1800Frame3( fxGlitch1800, event )
						return 
					else
						fxGlitch1800:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame3 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setAlpha( 0 )
				fxGlitch1800Frame2( fxGlitch1800, {} )
				local fxGlitch1700Frame2 = function ( fxGlitch1700, event )
					local fxGlitch1700Frame3 = function ( fxGlitch1700, event )
						local fxGlitch1700Frame4 = function ( fxGlitch1700, event )
							local fxGlitch1700Frame5 = function ( fxGlitch1700, event )
								local fxGlitch1700Frame6 = function ( fxGlitch1700, event )
									local fxGlitch1700Frame7 = function ( fxGlitch1700, event )
										if not event.interrupted then
											fxGlitch1700:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										end
										fxGlitch1700:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( fxGlitch1700, event )
										else
											fxGlitch1700:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										fxGlitch1700Frame7( fxGlitch1700, event )
										return 
									else
										fxGlitch1700:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										fxGlitch1700:setAlpha( 0.35 )
										fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1700Frame6( fxGlitch1700, event )
									return 
								else
									fxGlitch1700:beginAnimation( "keyframe", 1210, false, false, CoD.TweenType.Linear )
									fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1700Frame5( fxGlitch1700, event )
								return 
							else
								fxGlitch1700:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								fxGlitch1700:setAlpha( 0 )
								fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1700Frame4( fxGlitch1700, event )
							return 
						else
							fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1700:setAlpha( 0.31 )
							fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1700Frame3( fxGlitch1700, event )
						return 
					else
						fxGlitch1700:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame3 )
					end
				end
				
				fxGlitch1700:completeAnimation()
				self.fxGlitch1700:setAlpha( 0 )
				fxGlitch1700Frame2( fxGlitch1700, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fxGlitch1900:close()
		element.fxGlitch1800:close()
		element.fxGlitch1700:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

