-- 18ab9ec14af74b24077c075d25035e41
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCard_loot_wizard = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_wizard.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_wizard )
	self.id = "CallingCard_loot_wizard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( true, false, 8, 488 )
	bg0:setTopBottom( true, false, -131, 229 )
	bg0:setAlpha( 0.3 )
	bg0:setZRot( 22 )
	bg0:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_bg2" ) )
	bg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	bg0:setShaderVector( 0, 1, 1, 0, 0 )
	bg0:setShaderVector( 1, 0, 3.06, 0, 0 )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local EMBER2c = LUI.UIImage.new()
	EMBER2c:setLeftRight( true, false, 0, 480 )
	EMBER2c:setTopBottom( true, false, -256, 404 )
	EMBER2c:setAlpha( 0.3 )
	EMBER2c:setYRot( 1 )
	EMBER2c:setZRot( 30 )
	EMBER2c:setScale( 1.5 )
	EMBER2c:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c:setShaderVector( 1, 0, 0.04, 0, 0 )
	self:addElement( EMBER2c )
	self.EMBER2c = EMBER2c
	
	local Ember2 = LUI.UIImage.new()
	Ember2:setLeftRight( true, false, 0, 480 )
	Ember2:setTopBottom( true, false, -256, 404 )
	Ember2:setAlpha( 0.3 )
	Ember2:setYRot( 1 )
	Ember2:setZRot( 34 )
	Ember2:setScale( 1.8 )
	Ember2:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	Ember2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Ember2:setShaderVector( 0, 1, 1, 0, 0 )
	Ember2:setShaderVector( 1, 0, 0.06, 0, 0 )
	self:addElement( Ember2 )
	self.Ember2 = Ember2
	
	local Wizz = LUI.UIImage.new()
	Wizz:setLeftRight( true, false, 0, 480 )
	Wizz:setTopBottom( true, false, 0, 120 )
	Wizz:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_ball1" ) )
	self:addElement( Wizz )
	self.Wizz = Wizz
	
	local Wizz2 = LUI.UIImage.new()
	Wizz2:setLeftRight( true, false, 0, 480 )
	Wizz2:setTopBottom( true, false, 0, 120 )
	Wizz2:setAlpha( 0.36 )
	Wizz2:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_ball1" ) )
	Wizz2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Wizz2 )
	self.Wizz2 = Wizz2
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( true, false, 0, 480 )
	glow:setTopBottom( true, false, 0, 120 )
	glow:setRGB( 0.5, 0.98, 1 )
	glow:setAlpha( 0.5 )
	glow:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	local ball0 = LUI.UIImage.new()
	ball0:setLeftRight( true, false, -20, 580 )
	ball0:setTopBottom( true, false, -86, 298 )
	ball0:setAlpha( 0.37 )
	ball0:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_glowball" ) )
	ball0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ball0 )
	self.ball0 = ball0
	
	local ball = LUI.UIImage.new()
	ball:setLeftRight( true, false, -20, 580 )
	ball:setTopBottom( true, false, -86, 298 )
	ball:setRGB( 0.49, 0.98, 1 )
	ball:setAlpha( 0.37 )
	ball:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_glowball" ) )
	ball:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ball )
	self.ball = ball
	
	local Ember20 = LUI.UIImage.new()
	Ember20:setLeftRight( true, false, 0, 480 )
	Ember20:setTopBottom( true, false, -256, 404 )
	Ember20:setAlpha( 0.3 )
	Ember20:setYRot( 1 )
	Ember20:setZRot( 34 )
	Ember20:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	Ember20:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Ember20:setShaderVector( 0, 1, 1, 0, 0 )
	Ember20:setShaderVector( 1, 0, 0.36, 0, 0 )
	self:addElement( Ember20 )
	self.Ember20 = Ember20
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 129.6, 448.41 )
	GlowOrangeOver:setTopBottom( true, false, -25.85, 291.85 )
	GlowOrangeOver:setRGB( 0.22, 0.88, 1 )
	GlowOrangeOver:setAlpha( 0.1 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local Eyes = LUI.UIImage.new()
	Eyes:setLeftRight( true, false, 255, 387 )
	Eyes:setTopBottom( true, false, 0, 36 )
	Eyes:setRGB( 0.68, 0.96, 1 )
	Eyes:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_eyes" ) )
	Eyes:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Eyes )
	self.Eyes = Eyes
	
	local Eyes0 = LUI.UIImage.new()
	Eyes0:setLeftRight( true, false, 255, 387 )
	Eyes0:setTopBottom( true, false, 0, 36 )
	Eyes0:setRGB( 0.68, 0.96, 1 )
	Eyes0:setAlpha( 0.3 )
	Eyes0:setImage( RegisterImage( "uie_t7_loot_callingcard_wizards_eyes" ) )
	Eyes0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Eyes0 )
	self.Eyes0 = Eyes0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local Wizz2Frame2 = function ( Wizz2, event )
					local Wizz2Frame3 = function ( Wizz2, event )
						local Wizz2Frame4 = function ( Wizz2, event )
							local Wizz2Frame5 = function ( Wizz2, event )
								local Wizz2Frame6 = function ( Wizz2, event )
									local Wizz2Frame7 = function ( Wizz2, event )
										local Wizz2Frame8 = function ( Wizz2, event )
											local Wizz2Frame9 = function ( Wizz2, event )
												if not event.interrupted then
													Wizz2:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
												end
												Wizz2:setAlpha( 0.36 )
												if event.interrupted then
													self.clipFinished( Wizz2, event )
												else
													Wizz2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Wizz2Frame9( Wizz2, event )
												return 
											else
												Wizz2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
												Wizz2:setAlpha( 0.88 )
												Wizz2:registerEventHandler( "transition_complete_keyframe", Wizz2Frame9 )
											end
										end
										
										if event.interrupted then
											Wizz2Frame8( Wizz2, event )
											return 
										else
											Wizz2:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
											Wizz2:setAlpha( 0.57 )
											Wizz2:registerEventHandler( "transition_complete_keyframe", Wizz2Frame8 )
										end
									end
									
									if event.interrupted then
										Wizz2Frame7( Wizz2, event )
										return 
									else
										Wizz2:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
										Wizz2:setAlpha( 0.98 )
										Wizz2:registerEventHandler( "transition_complete_keyframe", Wizz2Frame7 )
									end
								end
								
								if event.interrupted then
									Wizz2Frame6( Wizz2, event )
									return 
								else
									Wizz2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
									Wizz2:setAlpha( 0.59 )
									Wizz2:registerEventHandler( "transition_complete_keyframe", Wizz2Frame6 )
								end
							end
							
							if event.interrupted then
								Wizz2Frame5( Wizz2, event )
								return 
							else
								Wizz2:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
								Wizz2:setAlpha( 0.88 )
								Wizz2:registerEventHandler( "transition_complete_keyframe", Wizz2Frame5 )
							end
						end
						
						if event.interrupted then
							Wizz2Frame4( Wizz2, event )
							return 
						else
							Wizz2:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
							Wizz2:setAlpha( 0.54 )
							Wizz2:registerEventHandler( "transition_complete_keyframe", Wizz2Frame4 )
						end
					end
					
					if event.interrupted then
						Wizz2Frame3( Wizz2, event )
						return 
					else
						Wizz2:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						Wizz2:setAlpha( 0.92 )
						Wizz2:registerEventHandler( "transition_complete_keyframe", Wizz2Frame3 )
					end
				end
				
				Wizz2:completeAnimation()
				self.Wizz2:setAlpha( 0.36 )
				Wizz2Frame2( Wizz2, {} )
				local glowFrame2 = function ( glow, event )
					local glowFrame3 = function ( glow, event )
						local glowFrame4 = function ( glow, event )
							local glowFrame5 = function ( glow, event )
								local glowFrame6 = function ( glow, event )
									local glowFrame7 = function ( glow, event )
										local glowFrame8 = function ( glow, event )
											local glowFrame9 = function ( glow, event )
												local glowFrame10 = function ( glow, event )
													local glowFrame11 = function ( glow, event )
														local glowFrame12 = function ( glow, event )
															local glowFrame13 = function ( glow, event )
																local glowFrame14 = function ( glow, event )
																	local glowFrame15 = function ( glow, event )
																		local glowFrame16 = function ( glow, event )
																			if not event.interrupted then
																				glow:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
																			end
																			glow:setAlpha( 0.1 )
																			if event.interrupted then
																				self.clipFinished( glow, event )
																			else
																				glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			glowFrame16( glow, event )
																			return 
																		else
																			glow:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																			glow:setAlpha( 0.28 )
																			glow:registerEventHandler( "transition_complete_keyframe", glowFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		glowFrame15( glow, event )
																		return 
																	else
																		glow:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
																		glow:setAlpha( 0.09 )
																		glow:registerEventHandler( "transition_complete_keyframe", glowFrame15 )
																	end
																end
																
																if event.interrupted then
																	glowFrame14( glow, event )
																	return 
																else
																	glow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																	glow:setAlpha( 0.32 )
																	glow:registerEventHandler( "transition_complete_keyframe", glowFrame14 )
																end
															end
															
															if event.interrupted then
																glowFrame13( glow, event )
																return 
															else
																glow:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
																glow:setAlpha( 0.11 )
																glow:registerEventHandler( "transition_complete_keyframe", glowFrame13 )
															end
														end
														
														if event.interrupted then
															glowFrame12( glow, event )
															return 
														else
															glow:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
															glow:setAlpha( 1 )
															glow:registerEventHandler( "transition_complete_keyframe", glowFrame12 )
														end
													end
													
													if event.interrupted then
														glowFrame11( glow, event )
														return 
													else
														glow:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
														glow:setAlpha( 0.24 )
														glow:registerEventHandler( "transition_complete_keyframe", glowFrame11 )
													end
												end
												
												if event.interrupted then
													glowFrame10( glow, event )
													return 
												else
													glow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													glow:setAlpha( 0 )
													glow:registerEventHandler( "transition_complete_keyframe", glowFrame10 )
												end
											end
											
											if event.interrupted then
												glowFrame9( glow, event )
												return 
											else
												glow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												glow:setAlpha( 0.38 )
												glow:registerEventHandler( "transition_complete_keyframe", glowFrame9 )
											end
										end
										
										if event.interrupted then
											glowFrame8( glow, event )
											return 
										else
											glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											glow:setAlpha( 0.15 )
											glow:registerEventHandler( "transition_complete_keyframe", glowFrame8 )
										end
									end
									
									if event.interrupted then
										glowFrame7( glow, event )
										return 
									else
										glow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										glow:setAlpha( 0.45 )
										glow:registerEventHandler( "transition_complete_keyframe", glowFrame7 )
									end
								end
								
								if event.interrupted then
									glowFrame6( glow, event )
									return 
								else
									glow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									glow:setAlpha( 0.17 )
									glow:registerEventHandler( "transition_complete_keyframe", glowFrame6 )
								end
							end
							
							if event.interrupted then
								glowFrame5( glow, event )
								return 
							else
								glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								glow:setAlpha( 0.51 )
								glow:registerEventHandler( "transition_complete_keyframe", glowFrame5 )
							end
						end
						
						if event.interrupted then
							glowFrame4( glow, event )
							return 
						else
							glow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							glow:setAlpha( 0.25 )
							glow:registerEventHandler( "transition_complete_keyframe", glowFrame4 )
						end
					end
					
					if event.interrupted then
						glowFrame3( glow, event )
						return 
					else
						glow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						glow:setAlpha( 0.5 )
						glow:registerEventHandler( "transition_complete_keyframe", glowFrame3 )
					end
				end
				
				glow:completeAnimation()
				self.glow:setAlpha( 0.1 )
				glowFrame2( glow, {} )
				local ball0Frame2 = function ( ball0, event )
					local ball0Frame3 = function ( ball0, event )
						local ball0Frame4 = function ( ball0, event )
							local ball0Frame5 = function ( ball0, event )
								local ball0Frame6 = function ( ball0, event )
									local ball0Frame7 = function ( ball0, event )
										local ball0Frame8 = function ( ball0, event )
											if not event.interrupted then
												ball0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
											end
											ball0:setLeftRight( true, false, 10, 610 )
											ball0:setTopBottom( true, false, -47, 337 )
											ball0:setZRot( 180 )
											if event.interrupted then
												self.clipFinished( ball0, event )
											else
												ball0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											ball0Frame8( ball0, event )
											return 
										else
											ball0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
											ball0:setLeftRight( true, false, -7.25, 592.75 )
											ball0:setTopBottom( true, false, -43.94, 340.06 )
											ball0:setZRot( 142.46 )
											ball0:registerEventHandler( "transition_complete_keyframe", ball0Frame8 )
										end
									end
									
									if event.interrupted then
										ball0Frame7( ball0, event )
										return 
									else
										ball0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
										ball0:setLeftRight( true, false, -16.79, 583.21 )
										ball0:setTopBottom( true, false, -47.02, 336.98 )
										ball0:setZRot( 118.58 )
										ball0:registerEventHandler( "transition_complete_keyframe", ball0Frame7 )
									end
								end
								
								if event.interrupted then
									ball0Frame6( ball0, event )
									return 
								else
									ball0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
									ball0:setLeftRight( true, false, -20.62, 579.38 )
									ball0:setTopBottom( true, false, -51.85, 332.15 )
									ball0:setZRot( 86.16 )
									ball0:registerEventHandler( "transition_complete_keyframe", ball0Frame6 )
								end
							end
							
							if event.interrupted then
								ball0Frame5( ball0, event )
								return 
							else
								ball0:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
								ball0:setLeftRight( true, false, -31.86, 568.14 )
								ball0:setTopBottom( true, false, -60.33, 323.67 )
								ball0:setZRot( 65.69 )
								ball0:registerEventHandler( "transition_complete_keyframe", ball0Frame5 )
							end
						end
						
						if event.interrupted then
							ball0Frame4( ball0, event )
							return 
						else
							ball0:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
							ball0:setLeftRight( true, false, -29.62, 570.38 )
							ball0:setTopBottom( true, false, -72, 312 )
							ball0:setZRot( 42.65 )
							ball0:registerEventHandler( "transition_complete_keyframe", ball0Frame4 )
						end
					end
					
					if event.interrupted then
						ball0Frame3( ball0, event )
						return 
					else
						ball0:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						ball0:setLeftRight( true, false, -24.62, 575.38 )
						ball0:setTopBottom( true, false, -81, 303 )
						ball0:setZRot( 23.03 )
						ball0:registerEventHandler( "transition_complete_keyframe", ball0Frame3 )
					end
				end
				
				ball0:completeAnimation()
				self.ball0:setLeftRight( true, false, -20, 580 )
				self.ball0:setTopBottom( true, false, -85, 299 )
				self.ball0:setZRot( 0 )
				ball0Frame2( ball0, {} )
				local ballFrame2 = function ( ball, event )
					local ballFrame3 = function ( ball, event )
						local ballFrame4 = function ( ball, event )
							local ballFrame5 = function ( ball, event )
								local ballFrame6 = function ( ball, event )
									local ballFrame7 = function ( ball, event )
										local ballFrame8 = function ( ball, event )
											local ballFrame9 = function ( ball, event )
												if not event.interrupted then
													ball:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
												end
												ball:setLeftRight( true, false, -19, 581 )
												ball:setTopBottom( true, false, -85, 299 )
												ball:setZRot( 360 )
												ball:setScale( 1 )
												if event.interrupted then
													self.clipFinished( ball, event )
												else
													ball:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ballFrame9( ball, event )
												return 
											else
												ball:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												ball:setLeftRight( true, false, -2.15, 597.85 )
												ball:setTopBottom( true, false, -89, 295 )
												ball:setZRot( 307.11 )
												ball:registerEventHandler( "transition_complete_keyframe", ballFrame9 )
											end
										end
										
										if event.interrupted then
											ballFrame8( ball, event )
											return 
										else
											ball:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
											ball:setLeftRight( true, false, 5, 605 )
											ball:setTopBottom( true, false, -85, 299 )
											ball:setZRot( 284.93 )
											ball:registerEventHandler( "transition_complete_keyframe", ballFrame8 )
										end
									end
									
									if event.interrupted then
										ballFrame7( ball, event )
										return 
									else
										ball:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
										ball:setLeftRight( true, false, 14, 614 )
										ball:setTopBottom( true, false, -72, 312 )
										ball:setZRot( 237.16 )
										ball:registerEventHandler( "transition_complete_keyframe", ballFrame7 )
									end
								end
								
								if event.interrupted then
									ballFrame6( ball, event )
									return 
								else
									ball:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
									ball:setLeftRight( true, false, 11, 611 )
									ball:setTopBottom( true, false, -48, 336 )
									ball:setZRot( 170.62 )
									ball:registerEventHandler( "transition_complete_keyframe", ballFrame6 )
								end
							end
							
							if event.interrupted then
								ballFrame5( ball, event )
								return 
							else
								ball:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
								ball:setLeftRight( true, false, -13, 587 )
								ball:setTopBottom( true, false, -45.75, 338.25 )
								ball:setZRot( 131.37 )
								ball:registerEventHandler( "transition_complete_keyframe", ballFrame5 )
							end
						end
						
						if event.interrupted then
							ballFrame4( ball, event )
							return 
						else
							ball:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							ball:setLeftRight( true, false, -29.7, 570.3 )
							ball:setTopBottom( true, false, -58.13, 325.87 )
							ball:setZRot( 87.01 )
							ball:registerEventHandler( "transition_complete_keyframe", ballFrame4 )
						end
					end
					
					if event.interrupted then
						ballFrame3( ball, event )
						return 
					else
						ball:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						ball:setLeftRight( true, false, -28.14, 571.86 )
						ball:setTopBottom( true, false, -72, 312 )
						ball:setZRot( 46.07 )
						ball:registerEventHandler( "transition_complete_keyframe", ballFrame3 )
					end
				end
				
				ball:completeAnimation()
				self.ball:setLeftRight( true, false, -20, 580 )
				self.ball:setTopBottom( true, false, -85, 299 )
				self.ball:setZRot( 0 )
				self.ball:setScale( 1 )
				ballFrame2( ball, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								if not event.interrupted then
									GlowOrangeOver:beginAnimation( "keyframe", 979, false, false, CoD.TweenType.Linear )
								end
								GlowOrangeOver:setLeftRight( true, false, 127.6, 446.41 )
								GlowOrangeOver:setTopBottom( true, false, -18.7, 299 )
								GlowOrangeOver:setAlpha( 0.1 )
								if event.interrupted then
									self.clipFinished( GlowOrangeOver, event )
								else
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0.57 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.41 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.54 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 127.6, 446.41 )
				self.GlowOrangeOver:setTopBottom( true, false, -18.7, 299 )
				self.GlowOrangeOver:setAlpha( 0.1 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local EyesFrame2 = function ( Eyes, event )
					local EyesFrame3 = function ( Eyes, event )
						if not event.interrupted then
							Eyes:beginAnimation( "keyframe", 1089, false, false, CoD.TweenType.Linear )
						end
						Eyes:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( Eyes, event )
						else
							Eyes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EyesFrame3( Eyes, event )
						return 
					else
						Eyes:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						Eyes:setAlpha( 1 )
						Eyes:registerEventHandler( "transition_complete_keyframe", EyesFrame3 )
					end
				end
				
				Eyes:completeAnimation()
				self.Eyes:setAlpha( 0.3 )
				EyesFrame2( Eyes, {} )
				local Eyes0Frame2 = function ( Eyes0, event )
					local Eyes0Frame3 = function ( Eyes0, event )
						if not event.interrupted then
							Eyes0:beginAnimation( "keyframe", 1089, false, false, CoD.TweenType.Linear )
						end
						Eyes0:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( Eyes0, event )
						else
							Eyes0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Eyes0Frame3( Eyes0, event )
						return 
					else
						Eyes0:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						Eyes0:setAlpha( 1 )
						Eyes0:registerEventHandler( "transition_complete_keyframe", Eyes0Frame3 )
					end
				end
				
				Eyes0:completeAnimation()
				self.Eyes0:setAlpha( 0 )
				Eyes0Frame2( Eyes0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
