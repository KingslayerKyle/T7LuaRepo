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
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 720 )
	Image0:setTopBottom( 0, 0, 0, 180 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_deepsea_master_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local light = LUI.UIImage.new()
	light:setLeftRight( 0, 0, 0, 720 )
	light:setTopBottom( 0, 0, 0, 180 )
	light:setAlpha( 0 )
	light:setImage( RegisterImage( "uie_t7_loot_callingcard_deepsea_master_light" ) )
	light:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light )
	self.light = light
	
	local flash = LUI.UIImage.new()
	flash:setLeftRight( 0, 0, 60, 207 )
	flash:setTopBottom( 0, 0, 51, 198 )
	flash:setImage( RegisterImage( "uie_t7_loot_callingcard_deepsea_master_flash" ) )
	flash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( flash )
	self.flash = flash
	
	local fish = LUI.UIImage.new()
	fish:setLeftRight( 0, 0, 96, 168 )
	fish:setTopBottom( 0, 0, 106, 157 )
	fish:setImage( RegisterImage( "uie_t7_loot_callingcard_deepsea_master_fish" ) )
	self:addElement( fish )
	self.fish = fish
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, 674, 699 )
	Glow:setTopBottom( 0, 0, 12, 70 )
	Glow:setRGB( 0.72, 0.91, 1 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( 0, 0, 374, 387 )
	Glow0:setTopBottom( 0, 0, 70, 107 )
	Glow0:setRGB( 0.72, 0.91, 1 )
	Glow0:setAlpha( 0 )
	Glow0:setZRot( 109 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( 0, 0, 675, 689 )
	Glow1:setTopBottom( 0, 0, 3, 37 )
	Glow1:setRGB( 0.72, 0.91, 1 )
	Glow1:setZRot( 101 )
	Glow1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( 0, 0, -15, 789 )
	Glow00:setTopBottom( 0, 0, -182, 64 )
	Glow00:setRGB( 0.72, 0.91, 1 )
	Glow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, -234, 570 )
	Image1:setTopBottom( 0, 0, 115, 361 )
	Image1:setRGB( 0.72, 0.91, 1 )
	Image1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( 0, 1, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.resetProperties = function ()
		flash:completeAnimation()
		fish:completeAnimation()
		light:completeAnimation()
		Glow:completeAnimation()
		Glow0:completeAnimation()
		Glow1:completeAnimation()
		Glow00:completeAnimation()
		Image1:completeAnimation()
		flash:setLeftRight( 0, 0, 60, 207 )
		flash:setTopBottom( 0, 0, 51, 198 )
		flash:setAlpha( 1 )
		flash:setScale( 1 )
		fish:setAlpha( 1 )
		fish:setScale( 1 )
		light:setAlpha( 0 )
		Glow:setLeftRight( 0, 0, 674, 699 )
		Glow:setTopBottom( 0, 0, 12, 70 )
		Glow:setAlpha( 1 )
		Glow:setZRot( 90 )
		Glow0:setAlpha( 0 )
		Glow1:setLeftRight( 0, 0, 675, 689 )
		Glow1:setTopBottom( 0, 0, 3, 37 )
		Glow1:setAlpha( 1 )
		Glow1:setZRot( 101 )
		Glow00:setAlpha( 1 )
		Image1:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
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
									flash:setLeftRight( 0, 0, 60, 207 )
									flash:setTopBottom( 0, 0, 51, 198 )
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
				self.flash:setLeftRight( 0, 0, 60, 207 )
				self.flash:setTopBottom( 0, 0, 51, 198 )
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
													Glow:setLeftRight( 0, 0, 376, 401 )
													Glow:setTopBottom( 0, 0, 56, 114 )
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
													Glow:setLeftRight( 0, 0, 445, 470 )
													Glow:setTopBottom( 0, 0, 39, 97 )
													Glow:setZRot( 101 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												Glow:setLeftRight( 0, 0, 452.38, 477.38 )
												Glow:setTopBottom( 0, 0, 37.46, 95.46 )
												Glow:setAlpha( 1 )
												Glow:setZRot( 101 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											Glow:setLeftRight( 0, 0, 493, 518 )
											Glow:setTopBottom( 0, 0, 29, 87 )
											Glow:setAlpha( 0.76 )
											Glow:setZRot( 99 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Glow:setLeftRight( 0, 0, 533, 558 )
										Glow:setTopBottom( 0, 0, 20, 78 )
										Glow:setAlpha( 0.52 )
										Glow:setZRot( 98 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									Glow:setLeftRight( 0, 0, 550.14, 575.14 )
									Glow:setTopBottom( 0, 0, 17.71, 75.71 )
									Glow:setAlpha( 0.43 )
									Glow:setZRot( 97 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								Glow:setLeftRight( 0, 0, 593, 618 )
								Glow:setTopBottom( 0, 0, 12, 70 )
								Glow:setAlpha( 0.66 )
								Glow:setZRot( 96 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Glow:setLeftRight( 0, 0, 620.14, 645.14 )
							Glow:setTopBottom( 0, 0, 9.86, 67.86 )
							Glow:setAlpha( 1 )
							Glow:setZRot( 94 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Glow:setLeftRight( 0, 0, 631, 656 )
						Glow:setTopBottom( 0, 0, 9, 67 )
						Glow:setAlpha( 0.8 )
						Glow:setZRot( 93 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( 0, 0, 674, 699 )
				self.Glow:setTopBottom( 0, 0, 12, 70 )
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
									Glow0:setAlpha( 0 )
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
				self.Glow0:setAlpha( 0 )
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
																Glow1:setLeftRight( 0, 0, 388, 402 )
																Glow1:setTopBottom( 0, 0, 48, 82 )
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
																Glow1:setLeftRight( 0, 0, 425.27, 439.27 )
																Glow1:setTopBottom( 0, 0, 34.13, 68.13 )
																Glow1:setAlpha( 1 )
																Glow1:setZRot( 99 )
																Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame13 )
															end
														end
														
														if event.interrupted then
															Glow1Frame12( Glow1, event )
															return 
														else
															Glow1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
															Glow1:setLeftRight( 0, 0, 431, 445 )
															Glow1:setTopBottom( 0, 0, 32, 66 )
															Glow1:setAlpha( 0.94 )
															Glow1:setZRot( 99 )
															Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame12 )
														end
													end
													
													if event.interrupted then
														Glow1Frame11( Glow1, event )
														return 
													else
														Glow1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														Glow1:setLeftRight( 0, 0, 469, 483 )
														Glow1:setTopBottom( 0, 0, 22, 56 )
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
													Glow1:setLeftRight( 0, 0, 477.54, 491.54 )
													Glow1:setTopBottom( 0, 0, 19.69, 53.69 )
													Glow1:setAlpha( 0.49 )
													Glow1:setZRot( 97 )
													Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame10 )
												end
											end
											
											if event.interrupted then
												Glow1Frame9( Glow1, event )
												return 
											else
												Glow1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Glow1:setLeftRight( 0, 0, 506, 520 )
												Glow1:setTopBottom( 0, 0, 12, 46 )
												Glow1:setZRot( 95 )
												Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame9 )
											end
										end
										
										if event.interrupted then
											Glow1Frame8( Glow1, event )
											return 
										else
											Glow1:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											Glow1:setLeftRight( 0, 0, 508.8, 522.8 )
											Glow1:setTopBottom( 0, 0, 11.4, 45.4 )
											Glow1:setZRot( 95 )
											Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame8 )
										end
									end
									
									if event.interrupted then
										Glow1Frame7( Glow1, event )
										return 
									else
										Glow1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
										Glow1:setLeftRight( 0, 0, 534, 548 )
										Glow1:setTopBottom( 0, 0, 6, 40 )
										Glow1:setZRot( 93 )
										Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame7 )
									end
								end
								
								if event.interrupted then
									Glow1Frame6( Glow1, event )
									return 
								else
									Glow1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									Glow1:setLeftRight( 0, 0, 572, 586 )
									Glow1:setTopBottom( 0, 0, 2, 36 )
									Glow1:setZRot( 91 )
									Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame6 )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Glow1:setLeftRight( 0, 0, 597.8, 611.8 )
								Glow1:setTopBottom( 0, 0, 0.8, 34.8 )
								Glow1:setAlpha( 1 )
								Glow1:setZRot( 89 )
								Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame5 )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Glow1:setLeftRight( 0, 0, 600.67, 614.67 )
							Glow1:setTopBottom( 0, 0, 0.67, 34.67 )
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
						Glow1:setLeftRight( 0, 0, 615, 629 )
						Glow1:setTopBottom( 0, 0, 0, 34 )
						Glow1:setAlpha( 0.78 )
						Glow1:setZRot( 88 )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( 0, 0, 675, 689 )
				self.Glow1:setTopBottom( 0, 0, 3, 37 )
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
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsGoldFrame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

