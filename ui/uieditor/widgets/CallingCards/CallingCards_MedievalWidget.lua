-- 974e523a469f03411e51fe16efdff628
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_MedievalCapeWidget" )

CoD.CallingCards_MedievalWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_MedievalWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_MedievalWidget )
	self.id = "CallingCards_MedievalWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, false, 0, 480 )
	Bg:setTopBottom( true, false, 0, 120 )
	Bg:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_bg" ) )
	self:addElement( Bg )
	self.Bg = Bg
	
	local Flag = LUI.UIImage.new()
	Flag:setLeftRight( true, false, 422.2, 457.36 )
	Flag:setTopBottom( true, false, 40.52, 56.5 )
	Flag:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_flag" ) )
	self:addElement( Flag )
	self.Flag = Flag
	
	local Clouds = LUI.UIImage.new()
	Clouds:setLeftRight( true, false, -310.5, 518.5 )
	Clouds:setTopBottom( true, false, -135.52, 97 )
	Clouds:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_clouds" ) )
	self:addElement( Clouds )
	self.Clouds = Clouds
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 285, 416.33 )
	Glow:setTopBottom( true, false, -106.35, 218.35 )
	Glow:setRGB( 1, 0.79, 0.35 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Cape2 = CoD.CallingCards_MedievalCapeWidget.new( menu, controller )
	Cape2:setLeftRight( true, false, 127.6, 411.6 )
	Cape2:setTopBottom( true, false, 13.97, 108.97 )
	self:addElement( Cape2 )
	self.Cape2 = Cape2
	
	local Sword = LUI.UIImage.new()
	Sword:setLeftRight( true, false, 331.25, 380.75 )
	Sword:setTopBottom( true, false, 18, 117 )
	Sword:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_sword" ) )
	self:addElement( Sword )
	self.Sword = Sword
	
	local Hat = LUI.UIImage.new()
	Hat:setLeftRight( true, false, 285, 393 )
	Hat:setTopBottom( true, false, -1, 28.7 )
	Hat:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_hat" ) )
	self:addElement( Hat )
	self.Hat = Hat
	
	local Knight = LUI.UIImage.new()
	Knight:setLeftRight( true, false, 338, 454 )
	Knight:setTopBottom( true, false, 4, 120 )
	Knight:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_knight" ) )
	self:addElement( Knight )
	self.Knight = Knight
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, false, -4.13, 104 )
	Glow2:setTopBottom( true, false, -321.11, 282.59 )
	Glow2:setRGB( 1, 0.79, 0.35 )
	Glow2:setAlpha( 0 )
	Glow2:setZRot( 90 )
	Glow2:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local Glow3 = LUI.UIImage.new()
	Glow3:setLeftRight( true, false, 393, 667.13 )
	Glow3:setTopBottom( true, false, -70.18, 108.52 )
	Glow3:setRGB( 1, 0.79, 0.35 )
	Glow3:setAlpha( 0 )
	Glow3:setZRot( 90 )
	Glow3:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow3 )
	self.Glow3 = Glow3
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( true, false, 317.55, 394.45 )
	Glow0:setTopBottom( true, false, 77.36, 84.83 )
	Glow0:setRGB( 1, 0.79, 0.35 )
	Glow0:setAlpha( 0.88 )
	Glow0:setZRot( 88 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local FlagFrame2 = function ( Flag, event )
					local FlagFrame3 = function ( Flag, event )
						local FlagFrame4 = function ( Flag, event )
							local FlagFrame5 = function ( Flag, event )
								local FlagFrame6 = function ( Flag, event )
									local FlagFrame7 = function ( Flag, event )
										local FlagFrame8 = function ( Flag, event )
											local FlagFrame9 = function ( Flag, event )
												local FlagFrame10 = function ( Flag, event )
													local FlagFrame11 = function ( Flag, event )
														local FlagFrame12 = function ( Flag, event )
															local FlagFrame13 = function ( Flag, event )
																local FlagFrame14 = function ( Flag, event )
																	local FlagFrame15 = function ( Flag, event )
																		local FlagFrame16 = function ( Flag, event )
																			local FlagFrame17 = function ( Flag, event )
																				local FlagFrame18 = function ( Flag, event )
																					local FlagFrame19 = function ( Flag, event )
																						local FlagFrame20 = function ( Flag, event )
																							if not event.interrupted then
																								Flag:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
																							end
																							Flag:setLeftRight( true, false, 422.2, 457.36 )
																							Flag:setTopBottom( true, false, 40.52, 56.5 )
																							Flag:setAlpha( 1 )
																							if event.interrupted then
																								self.clipFinished( Flag, event )
																							else
																								Flag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							FlagFrame20( Flag, event )
																							return 
																						else
																							Flag:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
																							Flag:setLeftRight( true, false, 418.2, 457.36 )
																							Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						FlagFrame19( Flag, event )
																						return 
																					else
																						Flag:beginAnimation( "keyframe", 520, false, false, CoD.TweenType.Linear )
																						Flag:setLeftRight( true, false, 422.2, 457.36 )
																						Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					FlagFrame18( Flag, event )
																					return 
																				else
																					Flag:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
																					Flag:setLeftRight( true, false, 425.2, 457.36 )
																					Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				FlagFrame17( Flag, event )
																				return 
																			else
																				Flag:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
																				Flag:setLeftRight( true, false, 421.2, 457.36 )
																				Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			FlagFrame16( Flag, event )
																			return 
																		else
																			Flag:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
																			Flag:setLeftRight( true, false, 418.2, 457.36 )
																			Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		FlagFrame15( Flag, event )
																		return 
																	else
																		Flag:beginAnimation( "keyframe", 530, false, false, CoD.TweenType.Linear )
																		Flag:setLeftRight( true, false, 422.2, 457.36 )
																		Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame15 )
																	end
																end
																
																if event.interrupted then
																	FlagFrame14( Flag, event )
																	return 
																else
																	Flag:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
																	Flag:setLeftRight( true, false, 416.2, 457.36 )
																	Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame14 )
																end
															end
															
															if event.interrupted then
																FlagFrame13( Flag, event )
																return 
															else
																Flag:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																Flag:setLeftRight( true, false, 422.2, 457.36 )
																Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame13 )
															end
														end
														
														if event.interrupted then
															FlagFrame12( Flag, event )
															return 
														else
															Flag:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
															Flag:setLeftRight( true, false, 420.2, 457.36 )
															Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame12 )
														end
													end
													
													if event.interrupted then
														FlagFrame11( Flag, event )
														return 
													else
														Flag:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
														Flag:setLeftRight( true, false, 423.2, 457.36 )
														Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame11 )
													end
												end
												
												if event.interrupted then
													FlagFrame10( Flag, event )
													return 
												else
													Flag:beginAnimation( "keyframe", 1109, false, false, CoD.TweenType.Linear )
													Flag:setLeftRight( true, false, 420.2, 457.36 )
													Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame10 )
												end
											end
											
											if event.interrupted then
												FlagFrame9( Flag, event )
												return 
											else
												Flag:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												Flag:setLeftRight( true, false, 423.2, 457.36 )
												Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame9 )
											end
										end
										
										if event.interrupted then
											FlagFrame8( Flag, event )
											return 
										else
											Flag:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
											Flag:setLeftRight( true, false, 425.2, 457.36 )
											Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame8 )
										end
									end
									
									if event.interrupted then
										FlagFrame7( Flag, event )
										return 
									else
										Flag:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
										Flag:setLeftRight( true, false, 418.2, 457.36 )
										Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame7 )
									end
								end
								
								if event.interrupted then
									FlagFrame6( Flag, event )
									return 
								else
									Flag:beginAnimation( "keyframe", 719, false, false, CoD.TweenType.Linear )
									Flag:setLeftRight( true, false, 422.2, 457.36 )
									Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame6 )
								end
							end
							
							if event.interrupted then
								FlagFrame5( Flag, event )
								return 
							else
								Flag:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
								Flag:setLeftRight( true, false, 419.2, 457.36 )
								Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame5 )
							end
						end
						
						if event.interrupted then
							FlagFrame4( Flag, event )
							return 
						else
							Flag:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							Flag:setLeftRight( true, false, 423.2, 457.36 )
							Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame4 )
						end
					end
					
					if event.interrupted then
						FlagFrame3( Flag, event )
						return 
					else
						Flag:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						Flag:setLeftRight( true, false, 419.2, 457.36 )
						Flag:registerEventHandler( "transition_complete_keyframe", FlagFrame3 )
					end
				end
				
				Flag:completeAnimation()
				self.Flag:setLeftRight( true, false, 422.2, 457.36 )
				self.Flag:setTopBottom( true, false, 40.52, 56.5 )
				self.Flag:setAlpha( 1 )
				FlagFrame2( Flag, {} )
				local CloudsFrame2 = function ( Clouds, event )
					local CloudsFrame3 = function ( Clouds, event )
						local CloudsFrame4 = function ( Clouds, event )
							local CloudsFrame5 = function ( Clouds, event )
								if not event.interrupted then
									Clouds:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Clouds:setLeftRight( true, false, -301.5, 527.5 )
								Clouds:setTopBottom( true, false, -135.52, 97 )
								Clouds:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Clouds, event )
								else
									Clouds:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CloudsFrame5( Clouds, event )
								return 
							else
								Clouds:beginAnimation( "keyframe", 1580, false, false, CoD.TweenType.Linear )
								Clouds:setLeftRight( true, false, -301.26, 527.74 )
								Clouds:setTopBottom( true, false, -135.5, 97.02 )
								Clouds:setAlpha( 0 )
								Clouds:registerEventHandler( "transition_complete_keyframe", CloudsFrame5 )
							end
						end
						
						if event.interrupted then
							CloudsFrame4( Clouds, event )
							return 
						else
							Clouds:beginAnimation( "keyframe", 6839, false, false, CoD.TweenType.Linear )
							Clouds:setLeftRight( true, false, -262.98, 566.02 )
							Clouds:setTopBottom( true, false, -131.84, 100.69 )
							Clouds:setAlpha( 1 )
							Clouds:registerEventHandler( "transition_complete_keyframe", CloudsFrame4 )
						end
					end
					
					if event.interrupted then
						CloudsFrame3( Clouds, event )
						return 
					else
						Clouds:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
						Clouds:setLeftRight( true, false, -97.26, 731.74 )
						Clouds:setTopBottom( true, false, -115.97, 116.55 )
						Clouds:setAlpha( 0.8 )
						Clouds:registerEventHandler( "transition_complete_keyframe", CloudsFrame3 )
					end
				end
				
				Clouds:completeAnimation()
				self.Clouds:setLeftRight( true, false, -58.5, 770.5 )
				self.Clouds:setTopBottom( true, false, -112.26, 120.26 )
				self.Clouds:setAlpha( 0 )
				CloudsFrame2( Clouds, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													local GlowFrame11 = function ( Glow, event )
														local GlowFrame12 = function ( Glow, event )
															if not event.interrupted then
																Glow:beginAnimation( "keyframe", 1830, false, false, CoD.TweenType.Linear )
															end
															Glow:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Glow, event )
															else
																Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															GlowFrame12( Glow, event )
															return 
														else
															Glow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
															Glow:setAlpha( 0.85 )
															Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame12 )
														end
													end
													
													if event.interrupted then
														GlowFrame11( Glow, event )
														return 
													else
														Glow:beginAnimation( "keyframe", 2070, false, false, CoD.TweenType.Linear )
														Glow:setAlpha( 0.34 )
														Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame11 )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
													Glow:setAlpha( 0.8 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 0.16 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 2019, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 0.45 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 1590, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0.35 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.8 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0.06 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.7 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				Cape2:completeAnimation()
				self.Cape2:setAlpha( 1 )
				self.clipFinished( Cape2, {} )
				local HatFrame2 = function ( Hat, event )
					local HatFrame3 = function ( Hat, event )
						local HatFrame4 = function ( Hat, event )
							local HatFrame5 = function ( Hat, event )
								local HatFrame6 = function ( Hat, event )
									local HatFrame7 = function ( Hat, event )
										local HatFrame8 = function ( Hat, event )
											local HatFrame9 = function ( Hat, event )
												local HatFrame10 = function ( Hat, event )
													local HatFrame11 = function ( Hat, event )
														local HatFrame12 = function ( Hat, event )
															local HatFrame13 = function ( Hat, event )
																local HatFrame14 = function ( Hat, event )
																	local HatFrame15 = function ( Hat, event )
																		local HatFrame16 = function ( Hat, event )
																			local HatFrame17 = function ( Hat, event )
																				local HatFrame18 = function ( Hat, event )
																					local HatFrame19 = function ( Hat, event )
																						local HatFrame20 = function ( Hat, event )
																							local HatFrame21 = function ( Hat, event )
																								local HatFrame22 = function ( Hat, event )
																									local HatFrame23 = function ( Hat, event )
																										local HatFrame24 = function ( Hat, event )
																											local HatFrame25 = function ( Hat, event )
																												local HatFrame26 = function ( Hat, event )
																													local HatFrame27 = function ( Hat, event )
																														local HatFrame28 = function ( Hat, event )
																															local HatFrame29 = function ( Hat, event )
																																if not event.interrupted then
																																	Hat:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
																																end
																																Hat:setLeftRight( true, false, 285, 393 )
																																Hat:setTopBottom( true, false, -1, 28.7 )
																																if event.interrupted then
																																	self.clipFinished( Hat, event )
																																else
																																	Hat:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																HatFrame29( Hat, event )
																																return 
																															else
																																Hat:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																																Hat:setLeftRight( true, false, 294, 393 )
																																Hat:registerEventHandler( "transition_complete_keyframe", HatFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															HatFrame28( Hat, event )
																															return 
																														else
																															Hat:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
																															Hat:setLeftRight( true, false, 288, 393 )
																															Hat:registerEventHandler( "transition_complete_keyframe", HatFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														HatFrame27( Hat, event )
																														return 
																													else
																														Hat:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
																														Hat:setLeftRight( true, false, 293, 393 )
																														Hat:registerEventHandler( "transition_complete_keyframe", HatFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													HatFrame26( Hat, event )
																													return 
																												else
																													Hat:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																													Hat:setLeftRight( true, false, 304.67, 393 )
																													Hat:registerEventHandler( "transition_complete_keyframe", HatFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												HatFrame25( Hat, event )
																												return 
																											else
																												Hat:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																												Hat:setLeftRight( true, false, 284.5, 393 )
																												Hat:registerEventHandler( "transition_complete_keyframe", HatFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											HatFrame24( Hat, event )
																											return 
																										else
																											Hat:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
																											Hat:setLeftRight( true, false, 291.84, 393 )
																											Hat:registerEventHandler( "transition_complete_keyframe", HatFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										HatFrame23( Hat, event )
																										return 
																									else
																										Hat:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
																										Hat:setLeftRight( true, false, 274, 393 )
																										Hat:registerEventHandler( "transition_complete_keyframe", HatFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									HatFrame22( Hat, event )
																									return 
																								else
																									Hat:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
																									Hat:setLeftRight( true, false, 277, 393 )
																									Hat:registerEventHandler( "transition_complete_keyframe", HatFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								HatFrame21( Hat, event )
																								return 
																							else
																								Hat:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
																								Hat:setLeftRight( true, false, 271, 393 )
																								Hat:registerEventHandler( "transition_complete_keyframe", HatFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							HatFrame20( Hat, event )
																							return 
																						else
																							Hat:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
																							Hat:setLeftRight( true, false, 292.66, 393 )
																							Hat:registerEventHandler( "transition_complete_keyframe", HatFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						HatFrame19( Hat, event )
																						return 
																					else
																						Hat:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																						Hat:setLeftRight( true, false, 284.5, 393 )
																						Hat:registerEventHandler( "transition_complete_keyframe", HatFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					HatFrame18( Hat, event )
																					return 
																				else
																					Hat:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
																					Hat:setLeftRight( true, false, 295.26, 393 )
																					Hat:registerEventHandler( "transition_complete_keyframe", HatFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				HatFrame17( Hat, event )
																				return 
																			else
																				Hat:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
																				Hat:setLeftRight( true, false, 283.26, 393 )
																				Hat:registerEventHandler( "transition_complete_keyframe", HatFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			HatFrame16( Hat, event )
																			return 
																		else
																			Hat:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
																			Hat:setLeftRight( true, false, 278.26, 393 )
																			Hat:registerEventHandler( "transition_complete_keyframe", HatFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		HatFrame15( Hat, event )
																		return 
																	else
																		Hat:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
																		Hat:setLeftRight( true, false, 285.26, 393 )
																		Hat:registerEventHandler( "transition_complete_keyframe", HatFrame15 )
																	end
																end
																
																if event.interrupted then
																	HatFrame14( Hat, event )
																	return 
																else
																	Hat:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
																	Hat:setLeftRight( true, false, 275.26, 393 )
																	Hat:registerEventHandler( "transition_complete_keyframe", HatFrame14 )
																end
															end
															
															if event.interrupted then
																HatFrame13( Hat, event )
																return 
															else
																Hat:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
																Hat:setLeftRight( true, false, 281.26, 393 )
																Hat:registerEventHandler( "transition_complete_keyframe", HatFrame13 )
															end
														end
														
														if event.interrupted then
															HatFrame12( Hat, event )
															return 
														else
															Hat:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
															Hat:setLeftRight( true, false, 268.26, 393 )
															Hat:registerEventHandler( "transition_complete_keyframe", HatFrame12 )
														end
													end
													
													if event.interrupted then
														HatFrame11( Hat, event )
														return 
													else
														Hat:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
														Hat:setLeftRight( true, false, 285.26, 393 )
														Hat:registerEventHandler( "transition_complete_keyframe", HatFrame11 )
													end
												end
												
												if event.interrupted then
													HatFrame10( Hat, event )
													return 
												else
													Hat:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
													Hat:setLeftRight( true, false, 279, 393 )
													Hat:registerEventHandler( "transition_complete_keyframe", HatFrame10 )
												end
											end
											
											if event.interrupted then
												HatFrame9( Hat, event )
												return 
											else
												Hat:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
												Hat:setLeftRight( true, false, 300.52, 393 )
												Hat:registerEventHandler( "transition_complete_keyframe", HatFrame9 )
											end
										end
										
										if event.interrupted then
											HatFrame8( Hat, event )
											return 
										else
											Hat:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
											Hat:setLeftRight( true, false, 292, 393 )
											Hat:setTopBottom( true, false, -1, 25.7 )
											Hat:registerEventHandler( "transition_complete_keyframe", HatFrame8 )
										end
									end
									
									if event.interrupted then
										HatFrame7( Hat, event )
										return 
									else
										Hat:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
										Hat:setLeftRight( true, false, 304.67, 393 )
										Hat:setTopBottom( true, false, -1, 26.29 )
										Hat:registerEventHandler( "transition_complete_keyframe", HatFrame7 )
									end
								end
								
								if event.interrupted then
									HatFrame6( Hat, event )
									return 
								else
									Hat:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									Hat:setLeftRight( true, false, 295.32, 393 )
									Hat:setTopBottom( true, false, -1, 27.31 )
									Hat:registerEventHandler( "transition_complete_keyframe", HatFrame6 )
								end
							end
							
							if event.interrupted then
								HatFrame5( Hat, event )
								return 
							else
								Hat:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
								Hat:setLeftRight( true, false, 304.67, 393 )
								Hat:setTopBottom( true, false, -1, 27.68 )
								Hat:registerEventHandler( "transition_complete_keyframe", HatFrame5 )
							end
						end
						
						if event.interrupted then
							HatFrame4( Hat, event )
							return 
						else
							Hat:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							Hat:setLeftRight( true, false, 292, 393 )
							Hat:registerEventHandler( "transition_complete_keyframe", HatFrame4 )
						end
					end
					
					if event.interrupted then
						HatFrame3( Hat, event )
						return 
					else
						Hat:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						Hat:setLeftRight( true, false, 304.67, 393 )
						Hat:registerEventHandler( "transition_complete_keyframe", HatFrame3 )
					end
				end
				
				Hat:completeAnimation()
				self.Hat:setLeftRight( true, false, 285, 393 )
				self.Hat:setTopBottom( true, false, -1, 28.7 )
				HatFrame2( Hat, {} )
				local Glow2Frame2 = function ( Glow2, event )
					local Glow2Frame3 = function ( Glow2, event )
						local Glow2Frame4 = function ( Glow2, event )
							local Glow2Frame5 = function ( Glow2, event )
								local Glow2Frame6 = function ( Glow2, event )
									local Glow2Frame7 = function ( Glow2, event )
										local Glow2Frame8 = function ( Glow2, event )
											local Glow2Frame9 = function ( Glow2, event )
												local Glow2Frame10 = function ( Glow2, event )
													if not event.interrupted then
														Glow2:beginAnimation( "keyframe", 2680, false, false, CoD.TweenType.Linear )
													end
													Glow2:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Glow2, event )
													else
														Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Glow2Frame10( Glow2, event )
													return 
												else
													Glow2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
													Glow2:setAlpha( 0.51 )
													Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame10 )
												end
											end
											
											if event.interrupted then
												Glow2Frame9( Glow2, event )
												return 
											else
												Glow2:beginAnimation( "keyframe", 1400, false, false, CoD.TweenType.Linear )
												Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame9 )
											end
										end
										
										if event.interrupted then
											Glow2Frame8( Glow2, event )
											return 
										else
											Glow2:beginAnimation( "keyframe", 2760, false, false, CoD.TweenType.Linear )
											Glow2:setAlpha( 0 )
											Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame8 )
										end
									end
									
									if event.interrupted then
										Glow2Frame7( Glow2, event )
										return 
									else
										Glow2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										Glow2:setAlpha( 0.78 )
										Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame7 )
									end
								end
								
								if event.interrupted then
									Glow2Frame6( Glow2, event )
									return 
								else
									Glow2:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
									Glow2:setAlpha( 0.11 )
									Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame6 )
								end
							end
							
							if event.interrupted then
								Glow2Frame5( Glow2, event )
								return 
							else
								Glow2:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								Glow2:setAlpha( 0.45 )
								Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame5 )
							end
						end
						
						if event.interrupted then
							Glow2Frame4( Glow2, event )
							return 
						else
							Glow2:beginAnimation( "keyframe", 2160, false, false, CoD.TweenType.Linear )
							Glow2:setAlpha( 0 )
							Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame4 )
						end
					end
					
					if event.interrupted then
						Glow2Frame3( Glow2, event )
						return 
					else
						Glow2:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Glow2:setAlpha( 0.7 )
						Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame3 )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )
				local Glow3Frame2 = function ( Glow3, event )
					local Glow3Frame3 = function ( Glow3, event )
						local Glow3Frame4 = function ( Glow3, event )
							local Glow3Frame5 = function ( Glow3, event )
								local Glow3Frame6 = function ( Glow3, event )
									local Glow3Frame7 = function ( Glow3, event )
										if not event.interrupted then
											Glow3:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
										end
										Glow3:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Glow3, event )
										else
											Glow3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Glow3Frame7( Glow3, event )
										return 
									else
										Glow3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										Glow3:setAlpha( 1 )
										Glow3:registerEventHandler( "transition_complete_keyframe", Glow3Frame7 )
									end
								end
								
								if event.interrupted then
									Glow3Frame6( Glow3, event )
									return 
								else
									Glow3:beginAnimation( "keyframe", 4139, false, false, CoD.TweenType.Linear )
									Glow3:registerEventHandler( "transition_complete_keyframe", Glow3Frame6 )
								end
							end
							
							if event.interrupted then
								Glow3Frame5( Glow3, event )
								return 
							else
								Glow3:beginAnimation( "keyframe", 1659, false, false, CoD.TweenType.Linear )
								Glow3:setAlpha( 0 )
								Glow3:registerEventHandler( "transition_complete_keyframe", Glow3Frame5 )
							end
						end
						
						if event.interrupted then
							Glow3Frame4( Glow3, event )
							return 
						else
							Glow3:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							Glow3:setAlpha( 1 )
							Glow3:registerEventHandler( "transition_complete_keyframe", Glow3Frame4 )
						end
					end
					
					if event.interrupted then
						Glow3Frame3( Glow3, event )
						return 
					else
						Glow3:beginAnimation( "keyframe", 3279, false, false, CoD.TweenType.Linear )
						Glow3:registerEventHandler( "transition_complete_keyframe", Glow3Frame3 )
					end
				end
				
				Glow3:completeAnimation()
				self.Glow3:setAlpha( 0 )
				Glow3Frame2( Glow3, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									local Glow0Frame7 = function ( Glow0, event )
										local Glow0Frame8 = function ( Glow0, event )
											local Glow0Frame9 = function ( Glow0, event )
												local Glow0Frame10 = function ( Glow0, event )
													local Glow0Frame11 = function ( Glow0, event )
														local Glow0Frame12 = function ( Glow0, event )
															local Glow0Frame13 = function ( Glow0, event )
																if not event.interrupted then
																	Glow0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
																end
																Glow0:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( Glow0, event )
																else
																	Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																Glow0Frame13( Glow0, event )
																return 
															else
																Glow0:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Linear )
																Glow0:setAlpha( 0.55 )
																Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame13 )
															end
														end
														
														if event.interrupted then
															Glow0Frame12( Glow0, event )
															return 
														else
															Glow0:beginAnimation( "keyframe", 570, false, false, CoD.TweenType.Linear )
															Glow0:setAlpha( 0.21 )
															Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame12 )
														end
													end
													
													if event.interrupted then
														Glow0Frame11( Glow0, event )
														return 
													else
														Glow0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
														Glow0:setAlpha( 0.54 )
														Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame11 )
													end
												end
												
												if event.interrupted then
													Glow0Frame10( Glow0, event )
													return 
												else
													Glow0:beginAnimation( "keyframe", 1989, false, false, CoD.TweenType.Linear )
													Glow0:setAlpha( 0 )
													Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame10 )
												end
											end
											
											if event.interrupted then
												Glow0Frame9( Glow0, event )
												return 
											else
												Glow0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
												Glow0:setAlpha( 0.55 )
												Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame9 )
											end
										end
										
										if event.interrupted then
											Glow0Frame8( Glow0, event )
											return 
										else
											Glow0:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
											Glow0:setAlpha( 0.09 )
											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame8 )
										end
									end
									
									if event.interrupted then
										Glow0Frame7( Glow0, event )
										return 
									else
										Glow0:beginAnimation( "keyframe", 3159, false, false, CoD.TweenType.Linear )
										Glow0:setAlpha( 0.26 )
										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame7 )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									Glow0:setAlpha( 1 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								Glow0:setAlpha( 0.18 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 0.84 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 1139, false, false, CoD.TweenType.Linear )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Cape2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

