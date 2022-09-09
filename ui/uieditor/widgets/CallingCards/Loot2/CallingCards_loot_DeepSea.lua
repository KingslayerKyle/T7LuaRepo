-- 0a6489fafc9153e3349a781734fdb283
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_loot_DeepSea = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_DeepSea.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_DeepSea )
	self.id = "CallingCards_loot_DeepSea"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_deepsea_master_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local light = LUI.UIImage.new()
	light:setLeftRight( true, false, 0, 480 )
	light:setTopBottom( true, false, 0, 120 )
	light:setAlpha( 0 )
	light:setImage( RegisterImage( "uie_t7_loot_callingcard_deepsea_master_light" ) )
	light:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light )
	self.light = light
	
	local flash = LUI.UIImage.new()
	flash:setLeftRight( true, false, 40, 138 )
	flash:setTopBottom( true, false, 34, 132 )
	flash:setImage( RegisterImage( "uie_t7_loot_callingcard_deepsea_master_flash" ) )
	flash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( flash )
	self.flash = flash
	
	local fish = LUI.UIImage.new()
	fish:setLeftRight( true, false, 64, 112 )
	fish:setTopBottom( true, false, 70.71, 105 )
	fish:setImage( RegisterImage( "uie_t7_loot_callingcard_deepsea_master_fish" ) )
	self:addElement( fish )
	self.fish = fish
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 449.59, 466.02 )
	Glow:setTopBottom( true, false, 8, 46.72 )
	Glow:setRGB( 0.72, 0.91, 1 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( true, false, 249.59, 258.16 )
	Glow0:setTopBottom( true, false, 46.72, 71.44 )
	Glow0:setRGB( 0.72, 0.91, 1 )
	Glow0:setAlpha( 0 )
	Glow0:setZRot( 109 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( true, false, 449.59, 459.23 )
	Glow1:setTopBottom( true, false, 2, 24.72 )
	Glow1:setRGB( 0.72, 0.91, 1 )
	Glow1:setZRot( 101 )
	Glow1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( true, false, -9.74, 526.07 )
	Glow00:setTopBottom( true, false, -121, 42.72 )
	Glow00:setRGB( 0.72, 0.91, 1 )
	Glow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -155.91, 379.91 )
	Image1:setTopBottom( true, false, 77, 240.72 )
	Image1:setRGB( 0.72, 0.91, 1 )
	Image1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				local lightFrame2 = function ( light, event )
					local lightFrame3 = function ( light, event )
						local lightFrame4 = function ( light, event )
							local lightFrame5 = function ( light, event )
								local lightFrame6 = function ( light, event )
									local lightFrame7 = function ( light, event )
										local lightFrame8 = function ( light, event )
											if not event.interrupted then
												light:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											end
											light:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( light, event )
											else
												light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											lightFrame8( light, event )
											return 
										else
											light:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
											light:setAlpha( 0.56 )
											light:registerEventHandler( "transition_complete_keyframe", lightFrame8 )
										end
									end
									
									if event.interrupted then
										lightFrame7( light, event )
										return 
									else
										light:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										light:setAlpha( 1 )
										light:registerEventHandler( "transition_complete_keyframe", lightFrame7 )
									end
								end
								
								if event.interrupted then
									lightFrame6( light, event )
									return 
								else
									light:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									light:setAlpha( 0 )
									light:registerEventHandler( "transition_complete_keyframe", lightFrame6 )
								end
							end
							
							if event.interrupted then
								lightFrame5( light, event )
								return 
							else
								light:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
								light:setAlpha( 1 )
								light:registerEventHandler( "transition_complete_keyframe", lightFrame5 )
							end
						end
						
						if event.interrupted then
							lightFrame4( light, event )
							return 
						else
							light:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							light:setAlpha( 0 )
							light:registerEventHandler( "transition_complete_keyframe", lightFrame4 )
						end
					end
					
					if event.interrupted then
						lightFrame3( light, event )
						return 
					else
						light:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						light:setAlpha( 0.54 )
						light:registerEventHandler( "transition_complete_keyframe", lightFrame3 )
					end
				end
				
				light:completeAnimation()
				self.light:setAlpha( 1 )
				lightFrame2( light, {} )
				local flashFrame2 = function ( flash, event )
					local flashFrame3 = function ( flash, event )
						local flashFrame4 = function ( flash, event )
							local flashFrame5 = function ( flash, event )
								local flashFrame6 = function ( flash, event )
									if not event.interrupted then
										flash:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									flash:setLeftRight( true, false, 40, 138 )
									flash:setTopBottom( true, false, 34, 132 )
									flash:setAlpha( 1 )
									flash:setScale( 1 )
									if event.interrupted then
										self.clipFinished( flash, event )
									else
										flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									flashFrame6( flash, event )
									return 
								else
									flash:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									flash:setScale( 1.6 )
									flash:registerEventHandler( "transition_complete_keyframe", flashFrame6 )
								end
							end
							
							if event.interrupted then
								flashFrame5( flash, event )
								return 
							else
								flash:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								flash:setScale( 1.4 )
								flash:registerEventHandler( "transition_complete_keyframe", flashFrame5 )
							end
						end
						
						if event.interrupted then
							flashFrame4( flash, event )
							return 
						else
							flash:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							flash:setScale( 1.6 )
							flash:registerEventHandler( "transition_complete_keyframe", flashFrame4 )
						end
					end
					
					if event.interrupted then
						flashFrame3( flash, event )
						return 
					else
						flash:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						flash:registerEventHandler( "transition_complete_keyframe", flashFrame3 )
					end
				end
				
				flash:completeAnimation()
				self.flash:setLeftRight( true, false, 40, 138 )
				self.flash:setTopBottom( true, false, 34, 132 )
				self.flash:setAlpha( 1 )
				self.flash:setScale( 1 )
				flashFrame2( flash, {} )
				local fishFrame2 = function ( fish, event )
					local fishFrame3 = function ( fish, event )
						local fishFrame4 = function ( fish, event )
							local fishFrame5 = function ( fish, event )
								local fishFrame6 = function ( fish, event )
									if not event.interrupted then
										fish:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									fish:setAlpha( 1 )
									fish:setScale( 1 )
									if event.interrupted then
										self.clipFinished( fish, event )
									else
										fish:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									fishFrame6( fish, event )
									return 
								else
									fish:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									fish:setScale( 2.2 )
									fish:registerEventHandler( "transition_complete_keyframe", fishFrame6 )
								end
							end
							
							if event.interrupted then
								fishFrame5( fish, event )
								return 
							else
								fish:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								fish:setScale( 1.7 )
								fish:registerEventHandler( "transition_complete_keyframe", fishFrame5 )
							end
						end
						
						if event.interrupted then
							fishFrame4( fish, event )
							return 
						else
							fish:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							fish:setScale( 2.2 )
							fish:registerEventHandler( "transition_complete_keyframe", fishFrame4 )
						end
					end
					
					if event.interrupted then
						fishFrame3( fish, event )
						return 
					else
						fish:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						fish:registerEventHandler( "transition_complete_keyframe", fishFrame3 )
					end
				end
				
				fish:completeAnimation()
				self.fish:setAlpha( 1 )
				self.fish:setScale( 1 )
				fishFrame2( fish, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													if not event.interrupted then
														Glow:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
													end
													Glow:setLeftRight( true, false, 250.59, 267.02 )
													Glow:setTopBottom( true, false, 37, 75.72 )
													Glow:setAlpha( 1 )
													Glow:setZRot( 101 )
													if event.interrupted then
														self.clipFinished( Glow, event )
													else
														Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Glow:setLeftRight( true, false, 296.84, 313.27 )
													Glow:setTopBottom( true, false, 25.9, 64.62 )
													Glow:setZRot( 101 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												Glow:setLeftRight( true, false, 301.74, 318.17 )
												Glow:setTopBottom( true, false, 24.87, 63.59 )
												Glow:setAlpha( 1 )
												Glow:setZRot( 100.73 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											Glow:setLeftRight( true, false, 328.68, 345.11 )
											Glow:setTopBottom( true, false, 19.18, 57.9 )
											Glow:setAlpha( 0.76 )
											Glow:setZRot( 99.28 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Glow:setLeftRight( true, false, 355.12, 371.55 )
										Glow:setTopBottom( true, false, 13.26, 51.98 )
										Glow:setAlpha( 0.52 )
										Glow:setZRot( 97.82 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									Glow:setLeftRight( true, false, 366.68, 383.11 )
									Glow:setTopBottom( true, false, 11.76, 50.48 )
									Glow:setAlpha( 0.43 )
									Glow:setZRot( 97.29 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								Glow:setLeftRight( true, false, 395.59, 412.02 )
								Glow:setTopBottom( true, false, 8, 46.72 )
								Glow:setAlpha( 0.66 )
								Glow:setZRot( 95.96 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( true, false, 413.59, 430.02 )
							Glow:setTopBottom( true, false, 6.57, 45.29 )
							Glow:setAlpha( 1 )
							Glow:setZRot( 93.98 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Glow:setLeftRight( true, false, 420.79, 437.22 )
						Glow:setTopBottom( true, false, 6, 44.72 )
						Glow:setAlpha( 0.8 )
						Glow:setZRot( 93.18 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, false, 449.59, 466.02 )
				self.Glow:setTopBottom( true, false, 8, 46.72 )
				self.Glow:setAlpha( 0 )
				self.Glow:setZRot( 90 )
				GlowFrame2( Glow, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									if not event.interrupted then
										Glow0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									Glow0:setLeftRight( true, false, 249.59, 258.16 )
									Glow0:setTopBottom( true, false, 46.72, 71.44 )
									Glow0:setAlpha( 0 )
									Glow0:setZRot( 109 )
									if event.interrupted then
										self.clipFinished( Glow0, event )
									else
										Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									Glow0:setAlpha( 1 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Glow0:setAlpha( 0 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 1 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, 249.59, 258.16 )
				self.Glow0:setTopBottom( true, false, 46.72, 71.44 )
				self.Glow0:setAlpha( 0 )
				self.Glow0:setZRot( 109 )
				Glow0Frame2( Glow0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						local Glow1Frame4 = function ( Glow1, event )
							local Glow1Frame5 = function ( Glow1, event )
								local Glow1Frame6 = function ( Glow1, event )
									local Glow1Frame7 = function ( Glow1, event )
										local Glow1Frame8 = function ( Glow1, event )
											local Glow1Frame9 = function ( Glow1, event )
												local Glow1Frame10 = function ( Glow1, event )
													local Glow1Frame11 = function ( Glow1, event )
														local Glow1Frame12 = function ( Glow1, event )
															local Glow1Frame13 = function ( Glow1, event )
																if not event.interrupted then
																	Glow1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																end
																Glow1:setLeftRight( true, false, 258.8, 268.44 )
																Glow1:setTopBottom( true, false, 32, 54.72 )
																Glow1:setAlpha( 1 )
																Glow1:setZRot( 101 )
																if event.interrupted then
																	self.clipFinished( Glow1, event )
																else
																	Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																Glow1Frame13( Glow1, event )
																return 
															else
																Glow1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																Glow1:setLeftRight( true, false, 283.6, 293.24 )
																Glow1:setTopBottom( true, false, 22.98, 45.7 )
																Glow1:setAlpha( 1 )
																Glow1:setZRot( 99.14 )
																Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame13 )
															end
														end
														
														if event.interrupted then
															Glow1Frame12( Glow1, event )
															return 
														else
															Glow1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
															Glow1:setLeftRight( true, false, 287.42, 297.06 )
															Glow1:setTopBottom( true, false, 21.59, 44.31 )
															Glow1:setAlpha( 0.94 )
															Glow1:setZRot( 98.86 )
															Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame12 )
														end
													end
													
													if event.interrupted then
														Glow1Frame11( Glow1, event )
														return 
													else
														Glow1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														Glow1:setLeftRight( true, false, 312.22, 321.86 )
														Glow1:setTopBottom( true, false, 14.43, 37.15 )
														Glow1:setAlpha( 0.58 )
														Glow1:setZRot( 97 )
														Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame11 )
													end
												end
												
												if event.interrupted then
													Glow1Frame10( Glow1, event )
													return 
												else
													Glow1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													Glow1:setLeftRight( true, false, 317.94, 327.58 )
													Glow1:setTopBottom( true, false, 12.88, 35.6 )
													Glow1:setAlpha( 0.49 )
													Glow1:setZRot( 96.57 )
													Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame10 )
												end
											end
											
											if event.interrupted then
												Glow1Frame9( Glow1, event )
												return 
											else
												Glow1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Glow1:setLeftRight( true, false, 337.02, 346.66 )
												Glow1:setTopBottom( true, false, 7.73, 30.45 )
												Glow1:setZRot( 95.14 )
												Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame9 )
											end
										end
										
										if event.interrupted then
											Glow1Frame8( Glow1, event )
											return 
										else
											Glow1:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											Glow1:setLeftRight( true, false, 338.93, 348.57 )
											Glow1:setTopBottom( true, false, 7.39, 30.11 )
											Glow1:setZRot( 95 )
											Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame8 )
										end
									end
									
									if event.interrupted then
										Glow1Frame7( Glow1, event )
										return 
									else
										Glow1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
										Glow1:setLeftRight( true, false, 356.1, 365.74 )
										Glow1:setTopBottom( true, false, 4.3, 27.02 )
										Glow1:setZRot( 93.31 )
										Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame7 )
									end
								end
								
								if event.interrupted then
									Glow1Frame6( Glow1, event )
									return 
								else
									Glow1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									Glow1:setLeftRight( true, false, 380.9, 390.54 )
									Glow1:setTopBottom( true, false, 1, 23.72 )
									Glow1:setZRot( 90.88 )
									Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame6 )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Glow1:setLeftRight( true, false, 398.07, 407.71 )
								Glow1:setTopBottom( true, false, 0.4, 23.12 )
								Glow1:setAlpha( 1 )
								Glow1:setZRot( 89.19 )
								Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame5 )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Glow1:setLeftRight( true, false, 399.98, 409.62 )
							Glow1:setTopBottom( true, false, 0.33, 23.05 )
							Glow1:setAlpha( 0.96 )
							Glow1:setZRot( 89 )
							Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame4 )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						Glow1:setLeftRight( true, false, 409.52, 419.16 )
						Glow1:setTopBottom( true, false, 0, 22.72 )
						Glow1:setAlpha( 0.78 )
						Glow1:setZRot( 88.23 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( true, false, 449.59, 459.23 )
				self.Glow1:setTopBottom( true, false, 2, 24.72 )
				self.Glow1:setAlpha( 0 )
				self.Glow1:setZRot( 85 )
				Glow1Frame2( Glow1, {} )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							if not event.interrupted then
								Glow00:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							Glow00:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow00, event )
							else
								Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							Glow00:setAlpha( 1 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
					end
					Image1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0.6 )
				Image1Frame2( Image1, {} )

				CallingCardsGoldFrame:completeAnimation()
				self.CallingCardsGoldFrame:setAlpha( 1 )
				self.clipFinished( CallingCardsGoldFrame, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsGoldFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
