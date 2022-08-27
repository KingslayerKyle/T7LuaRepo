-- 7d4bb1bae168ab3e4711c57469a05aee
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Loot_LegendaryAnimals = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_LegendaryAnimals.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_LegendaryAnimals )
	self.id = "CallingCards_Loot_LegendaryAnimals"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_legendaryanimals_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 46.67, 378 )
	Glow:setTopBottom( true, false, -181, 538.63 )
	Glow:setRGB( 1, 0.82, 0.27 )
	Glow:setAlpha( 0 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Smoke = LUI.UIImage.new()
	Smoke:setLeftRight( true, false, -12, 354 )
	Smoke:setTopBottom( true, false, -29.13, 131 )
	Smoke:setImage( RegisterImage( "uie_t7_callingcard_legendaryanimals_smoke_01" ) )
	self:addElement( Smoke )
	self.Smoke = Smoke
	
	local Fire = LUI.UIImage.new()
	Fire:setLeftRight( true, false, 0, 480 )
	Fire:setTopBottom( true, false, 0, 120 )
	Fire:setImage( RegisterImage( "uie_t7_callingcard_legendaryanimals_ember" ) )
	Fire:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Fire )
	self.Fire = Fire
	
	local Drago = LUI.UIImage.new()
	Drago:setLeftRight( true, false, 0, 480 )
	Drago:setTopBottom( true, false, 0, 120 )
	Drago:setImage( RegisterImage( "uie_t7_callingcard_legendaryanimals_dragon" ) )
	self:addElement( Drago )
	self.Drago = Drago
	
	local Ember = LUI.UIImage.new()
	Ember:setLeftRight( true, false, 0, 480 )
	Ember:setTopBottom( true, false, 0, 120 )
	Ember:setImage( RegisterImage( "uie_t7_callingcard_legendaryanimals_ember2" ) )
	Ember:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Ember )
	self.Ember = Ember
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( true, false, 329.78, 337.9 )
	Glow0:setTopBottom( true, false, 4, 21.63 )
	Glow0:setRGB( 1, 0.82, 0.27 )
	Glow0:setAlpha( 0 )
	Glow0:setZRot( 120 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local Clouds = LUI.UIImage.new()
	Clouds:setLeftRight( true, false, -270.5, 558.5 )
	Clouds:setTopBottom( true, false, -181.52, 51 )
	Clouds:setImage( RegisterImage( "uie_t7_callingcard_mp_career_medieval_clouds" ) )
	Clouds:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	Clouds:setShaderVector( 0, 1, 1, 0, 0 )
	Clouds:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( Clouds )
	self.Clouds = Clouds
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
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
														if not event.interrupted then
															Glow:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
														end
														Glow:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Glow, event )
														else
															Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														GlowFrame11( Glow, event )
														return 
													else
														Glow:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
														Glow:setAlpha( 1 )
														Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame11 )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
													Glow:setAlpha( 0.71 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 1 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 0.62 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 0.82 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.5 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 1 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.68 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local SmokeFrame2 = function ( Smoke, event )
					local SmokeFrame3 = function ( Smoke, event )
						local SmokeFrame4 = function ( Smoke, event )
							local SmokeFrame5 = function ( Smoke, event )
								if not event.interrupted then
									Smoke:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
								end
								Smoke:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( Smoke, event )
								else
									Smoke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								SmokeFrame5( Smoke, event )
								return 
							else
								Smoke:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
								Smoke:setAlpha( 0.87 )
								Smoke:registerEventHandler( "transition_complete_keyframe", SmokeFrame5 )
							end
						end
						
						if event.interrupted then
							SmokeFrame4( Smoke, event )
							return 
						else
							Smoke:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
							Smoke:setAlpha( 1 )
							Smoke:registerEventHandler( "transition_complete_keyframe", SmokeFrame4 )
						end
					end
					
					if event.interrupted then
						SmokeFrame3( Smoke, event )
						return 
					else
						Smoke:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						Smoke:setAlpha( 0.74 )
						Smoke:registerEventHandler( "transition_complete_keyframe", SmokeFrame3 )
					end
				end
				
				Smoke:completeAnimation()
				self.Smoke:setAlpha( 1 )
				SmokeFrame2( Smoke, {} )
				local FireFrame2 = function ( Fire, event )
					local FireFrame3 = function ( Fire, event )
						local FireFrame4 = function ( Fire, event )
							local FireFrame5 = function ( Fire, event )
								local FireFrame6 = function ( Fire, event )
									local FireFrame7 = function ( Fire, event )
										local FireFrame8 = function ( Fire, event )
											local FireFrame9 = function ( Fire, event )
												local FireFrame10 = function ( Fire, event )
													local FireFrame11 = function ( Fire, event )
														if not event.interrupted then
															Fire:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
														end
														Fire:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( Fire, event )
														else
															Fire:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														FireFrame11( Fire, event )
														return 
													else
														Fire:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
														Fire:setAlpha( 0.69 )
														Fire:registerEventHandler( "transition_complete_keyframe", FireFrame11 )
													end
												end
												
												if event.interrupted then
													FireFrame10( Fire, event )
													return 
												else
													Fire:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
													Fire:setAlpha( 1 )
													Fire:registerEventHandler( "transition_complete_keyframe", FireFrame10 )
												end
											end
											
											if event.interrupted then
												FireFrame9( Fire, event )
												return 
											else
												Fire:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
												Fire:setAlpha( 0.51 )
												Fire:registerEventHandler( "transition_complete_keyframe", FireFrame9 )
											end
										end
										
										if event.interrupted then
											FireFrame8( Fire, event )
											return 
										else
											Fire:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
											Fire:setAlpha( 1 )
											Fire:registerEventHandler( "transition_complete_keyframe", FireFrame8 )
										end
									end
									
									if event.interrupted then
										FireFrame7( Fire, event )
										return 
									else
										Fire:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
										Fire:setAlpha( 0.64 )
										Fire:registerEventHandler( "transition_complete_keyframe", FireFrame7 )
									end
								end
								
								if event.interrupted then
									FireFrame6( Fire, event )
									return 
								else
									Fire:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									Fire:setAlpha( 1 )
									Fire:registerEventHandler( "transition_complete_keyframe", FireFrame6 )
								end
							end
							
							if event.interrupted then
								FireFrame5( Fire, event )
								return 
							else
								Fire:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								Fire:setAlpha( 0.36 )
								Fire:registerEventHandler( "transition_complete_keyframe", FireFrame5 )
							end
						end
						
						if event.interrupted then
							FireFrame4( Fire, event )
							return 
						else
							Fire:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
							Fire:setAlpha( 1 )
							Fire:registerEventHandler( "transition_complete_keyframe", FireFrame4 )
						end
					end
					
					if event.interrupted then
						FireFrame3( Fire, event )
						return 
					else
						Fire:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Fire:setAlpha( 0.45 )
						Fire:registerEventHandler( "transition_complete_keyframe", FireFrame3 )
					end
				end
				
				Fire:completeAnimation()
				self.Fire:setAlpha( 1 )
				FireFrame2( Fire, {} )
				local EmberFrame2 = function ( Ember, event )
					local EmberFrame3 = function ( Ember, event )
						local EmberFrame4 = function ( Ember, event )
							local EmberFrame5 = function ( Ember, event )
								local EmberFrame6 = function ( Ember, event )
									local EmberFrame7 = function ( Ember, event )
										local EmberFrame8 = function ( Ember, event )
											local EmberFrame9 = function ( Ember, event )
												local EmberFrame10 = function ( Ember, event )
													local EmberFrame11 = function ( Ember, event )
														local EmberFrame12 = function ( Ember, event )
															local EmberFrame13 = function ( Ember, event )
																local EmberFrame14 = function ( Ember, event )
																	local EmberFrame15 = function ( Ember, event )
																		local EmberFrame16 = function ( Ember, event )
																			local EmberFrame17 = function ( Ember, event )
																				if not event.interrupted then
																					Ember:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
																				end
																				Ember:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( Ember, event )
																				else
																					Ember:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				EmberFrame17( Ember, event )
																				return 
																			else
																				Ember:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																				Ember:setAlpha( 0.87 )
																				Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			EmberFrame16( Ember, event )
																			return 
																		else
																			Ember:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																			Ember:setAlpha( 1 )
																			Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		EmberFrame15( Ember, event )
																		return 
																	else
																		Ember:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																		Ember:setAlpha( 0.79 )
																		Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame15 )
																	end
																end
																
																if event.interrupted then
																	EmberFrame14( Ember, event )
																	return 
																else
																	Ember:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																	Ember:setAlpha( 1 )
																	Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame14 )
																end
															end
															
															if event.interrupted then
																EmberFrame13( Ember, event )
																return 
															else
																Ember:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																Ember:setAlpha( 0.28 )
																Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame13 )
															end
														end
														
														if event.interrupted then
															EmberFrame12( Ember, event )
															return 
														else
															Ember:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
															Ember:setAlpha( 1 )
															Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame12 )
														end
													end
													
													if event.interrupted then
														EmberFrame11( Ember, event )
														return 
													else
														Ember:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														Ember:setAlpha( 0.54 )
														Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame11 )
													end
												end
												
												if event.interrupted then
													EmberFrame10( Ember, event )
													return 
												else
													Ember:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
													Ember:setAlpha( 1 )
													Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame10 )
												end
											end
											
											if event.interrupted then
												EmberFrame9( Ember, event )
												return 
											else
												Ember:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
												Ember:setAlpha( 0.71 )
												Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame9 )
											end
										end
										
										if event.interrupted then
											EmberFrame8( Ember, event )
											return 
										else
											Ember:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											Ember:setAlpha( 1 )
											Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame8 )
										end
									end
									
									if event.interrupted then
										EmberFrame7( Ember, event )
										return 
									else
										Ember:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
										Ember:setAlpha( 0.5 )
										Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame7 )
									end
								end
								
								if event.interrupted then
									EmberFrame6( Ember, event )
									return 
								else
									Ember:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									Ember:setAlpha( 1 )
									Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame6 )
								end
							end
							
							if event.interrupted then
								EmberFrame5( Ember, event )
								return 
							else
								Ember:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Ember:setAlpha( 0.65 )
								Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame5 )
							end
						end
						
						if event.interrupted then
							EmberFrame4( Ember, event )
							return 
						else
							Ember:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							Ember:setAlpha( 1 )
							Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame4 )
						end
					end
					
					if event.interrupted then
						EmberFrame3( Ember, event )
						return 
					else
						Ember:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Ember:setAlpha( 0.61 )
						Ember:registerEventHandler( "transition_complete_keyframe", EmberFrame3 )
					end
				end
				
				Ember:completeAnimation()
				self.Ember:setAlpha( 1 )
				EmberFrame2( Ember, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									local Glow0Frame7 = function ( Glow0, event )
										local Glow0Frame8 = function ( Glow0, event )
											local Glow0Frame9 = function ( Glow0, event )
												if not event.interrupted then
													Glow0:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
												end
												Glow0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Glow0, event )
												else
													Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Glow0Frame9( Glow0, event )
												return 
											else
												Glow0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
												Glow0:setAlpha( 1 )
												Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame9 )
											end
										end
										
										if event.interrupted then
											Glow0Frame8( Glow0, event )
											return 
										else
											Glow0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
											Glow0:setAlpha( 0.39 )
											Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame8 )
										end
									end
									
									if event.interrupted then
										Glow0Frame7( Glow0, event )
										return 
									else
										Glow0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										Glow0:setAlpha( 0.81 )
										Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame7 )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									Glow0:setAlpha( 0.11 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								Glow0:setAlpha( 0.36 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 0 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 1 )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

