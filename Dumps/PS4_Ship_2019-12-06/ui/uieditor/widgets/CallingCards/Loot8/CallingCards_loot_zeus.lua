CoD.CallingCards_loot_zeus = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_zeus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_zeus )
	self.id = "CallingCards_loot_zeus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_bg1" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bgbright = LUI.UIImage.new()
	bgbright:setLeftRight( true, false, 0, 480 )
	bgbright:setTopBottom( true, false, 0, 120 )
	bgbright:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_bg2" ) )
	self:addElement( bgbright )
	self.bgbright = bgbright
	
	local dude = LUI.UIImage.new()
	dude:setLeftRight( true, false, 225.52, 393.52 )
	dude:setTopBottom( true, false, 0, 120 )
	dude:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_body1" ) )
	self:addElement( dude )
	self.dude = dude
	
	local dudebright = LUI.UIImage.new()
	dudebright:setLeftRight( true, false, 225.52, 393.52 )
	dudebright:setTopBottom( true, false, 0, 120 )
	dudebright:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_body2" ) )
	self:addElement( dudebright )
	self.dudebright = dudebright
	
	local dudeR = LUI.UIImage.new()
	dudeR:setLeftRight( true, false, 225.52, 393.52 )
	dudeR:setTopBottom( true, false, 0, 120 )
	dudeR:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_body_light" ) )
	self:addElement( dudeR )
	self.dudeR = dudeR
	
	local firestill1a = LUI.UIImage.new()
	firestill1a:setLeftRight( true, false, 144, 240 )
	firestill1a:setTopBottom( true, false, 48, 120 )
	firestill1a:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire2" ) )
	self:addElement( firestill1a )
	self.firestill1a = firestill1a
	
	local firestill1b = LUI.UIImage.new()
	firestill1b:setLeftRight( true, false, 159.5, 222.52 )
	firestill1b:setTopBottom( true, false, 72.73, 120 )
	firestill1b:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire1" ) )
	self:addElement( firestill1b )
	self.firestill1b = firestill1b
	
	local firestill2a = LUI.UIImage.new()
	firestill2a:setLeftRight( true, false, 359.52, 455.52 )
	firestill2a:setTopBottom( true, false, 48, 120 )
	firestill2a:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire2" ) )
	self:addElement( firestill2a )
	self.firestill2a = firestill2a
	
	local firestill2b = LUI.UIImage.new()
	firestill2b:setLeftRight( true, false, 376.01, 439.04 )
	firestill2b:setTopBottom( true, false, 72.73, 120 )
	firestill2b:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire1" ) )
	self:addElement( firestill2b )
	self.firestill2b = firestill2b
	
	local smokesmall = LUI.UIImage.new()
	smokesmall:setLeftRight( true, false, 126.83, 242.55 )
	smokesmall:setTopBottom( true, false, 0, 120.23 )
	smokesmall:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_smoke" ) )
	smokesmall:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	smokesmall:setShaderVector( 0, 1, 1, 0, 0 )
	smokesmall:setShaderVector( 1, 0, 0.1, 0, 0 )
	self:addElement( smokesmall )
	self.smokesmall = smokesmall
	
	local smokelarge2 = LUI.UIImage.new()
	smokelarge2:setLeftRight( true, false, 315, 487 )
	smokelarge2:setTopBottom( true, false, -87.56, 225.17 )
	smokelarge2:setAlpha( 0.5 )
	smokelarge2:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_smoke" ) )
	smokelarge2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	smokelarge2:setShaderVector( 0, 1, 1, 0, 0 )
	smokelarge2:setShaderVector( 1, 0, 0.1, 0, 0 )
	self:addElement( smokelarge2 )
	self.smokelarge2 = smokelarge2
	
	local smokelarge20 = LUI.UIImage.new()
	smokelarge20:setLeftRight( true, false, 70, 274 )
	smokelarge20:setTopBottom( true, false, -87.56, 225.17 )
	smokelarge20:setAlpha( 0.5 )
	smokelarge20:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_smoke" ) )
	smokelarge20:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	smokelarge20:setShaderVector( 0, 1, 1, 0, 0 )
	smokelarge20:setShaderVector( 1, 0, 0.1, 0, 0 )
	self:addElement( smokelarge20 )
	self.smokelarge20 = smokelarge20
	
	local smokesmall2 = LUI.UIImage.new()
	smokesmall2:setLeftRight( true, false, 342.83, 458.55 )
	smokesmall2:setTopBottom( true, false, 0, 120.23 )
	smokesmall2:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_smoke" ) )
	smokesmall2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	smokesmall2:setShaderVector( 0, 1, 1, 0, 0 )
	smokesmall2:setShaderVector( 1, 0, 0.1, 0, 0 )
	self:addElement( smokesmall2 )
	self.smokesmall2 = smokesmall2
	
	local EMBER2c1 = LUI.UIImage.new()
	EMBER2c1:setLeftRight( true, false, 111.36, 244.45 )
	EMBER2c1:setTopBottom( true, false, -7.69, 145.31 )
	EMBER2c1:setYRot( 1 )
	EMBER2c1:setScale( 0.7 )
	EMBER2c1:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c1:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c1:setShaderVector( 1, 0, 0.1, 0, 0 )
	self:addElement( EMBER2c1 )
	self.EMBER2c1 = EMBER2c1
	
	local EMBER2c2 = LUI.UIImage.new()
	EMBER2c2:setLeftRight( true, false, 233.98, 150.02 )
	EMBER2c2:setTopBottom( true, false, -31.69, 121.31 )
	EMBER2c2:setYRot( 1 )
	EMBER2c2:setScale( 0.7 )
	EMBER2c2:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c2:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c2:setShaderVector( 1, 0, 0.2, 0, 0 )
	self:addElement( EMBER2c2 )
	self.EMBER2c2 = EMBER2c2
	
	local EMBER2c3 = LUI.UIImage.new()
	EMBER2c3:setLeftRight( true, false, 332.86, 465.95 )
	EMBER2c3:setTopBottom( true, false, -7.69, 145.31 )
	EMBER2c3:setYRot( 1 )
	EMBER2c3:setScale( 0.7 )
	EMBER2c3:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c3:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c3:setShaderVector( 1, 0, 0.1, 0, 0 )
	self:addElement( EMBER2c3 )
	self.EMBER2c3 = EMBER2c3
	
	local EMBER2c4 = LUI.UIImage.new()
	EMBER2c4:setLeftRight( true, false, 455.48, 371.52 )
	EMBER2c4:setTopBottom( true, false, -31.69, 121.31 )
	EMBER2c4:setYRot( 1 )
	EMBER2c4:setScale( 0.7 )
	EMBER2c4:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c4:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c4:setShaderVector( 1, 0, 0.2, 0, 0 )
	self:addElement( EMBER2c4 )
	self.EMBER2c4 = EMBER2c4
	
	local flipbook = LUI.UIImage.new()
	flipbook:setLeftRight( true, false, 148, 217 )
	flipbook:setTopBottom( true, false, 17.61, 120 )
	flipbook:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire_flipbook" ) )
	flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flipbook:setShaderVector( 0, 6, 3, 0, 0 )
	flipbook:setShaderVector( 1, 18, 0, 0, 0 )
	self:addElement( flipbook )
	self.flipbook = flipbook
	
	local flipbook0 = LUI.UIImage.new()
	flipbook0:setLeftRight( true, false, 449, 378 )
	flipbook0:setTopBottom( true, false, 17.61, 120 )
	flipbook0:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_fire_flipbook" ) )
	flipbook0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flipbook0:setShaderVector( 0, 6, 3, 0, 0 )
	flipbook0:setShaderVector( 1, 18, 0, 0, 0 )
	self:addElement( flipbook0 )
	self.flipbook0 = flipbook0
	
	local rays = LUI.UIImage.new()
	rays:setLeftRight( true, false, 9.52, 441.52 )
	rays:setTopBottom( true, false, 0, 108 )
	rays:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_rays" ) )
	self:addElement( rays )
	self.rays = rays
	
	local rays2 = LUI.UIImage.new()
	rays2:setLeftRight( true, false, 9.52, 441.52 )
	rays2:setTopBottom( true, false, 0, 108 )
	rays2:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_rays" ) )
	self:addElement( rays2 )
	self.rays2 = rays2
	
	local rays3 = LUI.UIImage.new()
	rays3:setLeftRight( true, false, 63.52, 471.52 )
	rays3:setTopBottom( true, false, 1.31, 121.31 )
	rays3:setAlpha( 0 )
	rays3:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_rays2" ) )
	self:addElement( rays3 )
	self.rays3 = rays3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				local bgFrame2 = function ( bg, event )
					if not event.interrupted then
						bg:beginAnimation( "keyframe", 3980, false, false, CoD.TweenType.Linear )
					end
					bg:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( bg, event )
					else
						bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				bgFrame2( bg, {} )
				local bgbrightFrame2 = function ( bgbright, event )
					local bgbrightFrame3 = function ( bgbright, event )
						local bgbrightFrame4 = function ( bgbright, event )
							local bgbrightFrame5 = function ( bgbright, event )
								local bgbrightFrame6 = function ( bgbright, event )
									local bgbrightFrame7 = function ( bgbright, event )
										local bgbrightFrame8 = function ( bgbright, event )
											local bgbrightFrame9 = function ( bgbright, event )
												local bgbrightFrame10 = function ( bgbright, event )
													local bgbrightFrame11 = function ( bgbright, event )
														local bgbrightFrame12 = function ( bgbright, event )
															local bgbrightFrame13 = function ( bgbright, event )
																local bgbrightFrame14 = function ( bgbright, event )
																	local bgbrightFrame15 = function ( bgbright, event )
																		local bgbrightFrame16 = function ( bgbright, event )
																			local bgbrightFrame17 = function ( bgbright, event )
																				local bgbrightFrame18 = function ( bgbright, event )
																					local bgbrightFrame19 = function ( bgbright, event )
																						local bgbrightFrame20 = function ( bgbright, event )
																							local bgbrightFrame21 = function ( bgbright, event )
																								local bgbrightFrame22 = function ( bgbright, event )
																									local bgbrightFrame23 = function ( bgbright, event )
																										local bgbrightFrame24 = function ( bgbright, event )
																											local bgbrightFrame25 = function ( bgbright, event )
																												local bgbrightFrame26 = function ( bgbright, event )
																													local bgbrightFrame27 = function ( bgbright, event )
																														local bgbrightFrame28 = function ( bgbright, event )
																															local bgbrightFrame29 = function ( bgbright, event )
																																if not event.interrupted then
																																	bgbright:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																end
																																bgbright:setAlpha( 0.5 )
																																if event.interrupted then
																																	self.clipFinished( bgbright, event )
																																else
																																	bgbright:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																bgbrightFrame29( bgbright, event )
																																return 
																															else
																																bgbright:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
																																bgbright:setAlpha( 1 )
																																bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															bgbrightFrame28( bgbright, event )
																															return 
																														else
																															bgbright:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																															bgbright:setAlpha( 0.8 )
																															bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														bgbrightFrame27( bgbright, event )
																														return 
																													else
																														bgbright:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
																														bgbright:setAlpha( 1 )
																														bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													bgbrightFrame26( bgbright, event )
																													return 
																												else
																													bgbright:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																													bgbright:setAlpha( 0.8 )
																													bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												bgbrightFrame25( bgbright, event )
																												return 
																											else
																												bgbright:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																												bgbright:setAlpha( 1 )
																												bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											bgbrightFrame24( bgbright, event )
																											return 
																										else
																											bgbright:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																											bgbright:setAlpha( 0.8 )
																											bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										bgbrightFrame23( bgbright, event )
																										return 
																									else
																										bgbright:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																										bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									bgbrightFrame22( bgbright, event )
																									return 
																								else
																									bgbright:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								bgbrightFrame21( bgbright, event )
																								return 
																							else
																								bgbright:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																								bgbright:setAlpha( 1 )
																								bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							bgbrightFrame20( bgbright, event )
																							return 
																						else
																							bgbright:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																							bgbright:setAlpha( 0.8 )
																							bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						bgbrightFrame19( bgbright, event )
																						return 
																					else
																						bgbright:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																						bgbright:setAlpha( 1 )
																						bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					bgbrightFrame18( bgbright, event )
																					return 
																				else
																					bgbright:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																					bgbright:setAlpha( 0.7 )
																					bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				bgbrightFrame17( bgbright, event )
																				return 
																			else
																				bgbright:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																				bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			bgbrightFrame16( bgbright, event )
																			return 
																		else
																			bgbright:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		bgbrightFrame15( bgbright, event )
																		return 
																	else
																		bgbright:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																		bgbright:setAlpha( 1 )
																		bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame15 )
																	end
																end
																
																if event.interrupted then
																	bgbrightFrame14( bgbright, event )
																	return 
																else
																	bgbright:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	bgbright:setAlpha( 0.8 )
																	bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame14 )
																end
															end
															
															if event.interrupted then
																bgbrightFrame13( bgbright, event )
																return 
															else
																bgbright:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																bgbright:setAlpha( 1 )
																bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame13 )
															end
														end
														
														if event.interrupted then
															bgbrightFrame12( bgbright, event )
															return 
														else
															bgbright:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															bgbright:setAlpha( 0.8 )
															bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame12 )
														end
													end
													
													if event.interrupted then
														bgbrightFrame11( bgbright, event )
														return 
													else
														bgbright:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
														bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame11 )
													end
												end
												
												if event.interrupted then
													bgbrightFrame10( bgbright, event )
													return 
												else
													bgbright:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame10 )
												end
											end
											
											if event.interrupted then
												bgbrightFrame9( bgbright, event )
												return 
											else
												bgbright:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
												bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame9 )
											end
										end
										
										if event.interrupted then
											bgbrightFrame8( bgbright, event )
											return 
										else
											bgbright:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame8 )
										end
									end
									
									if event.interrupted then
										bgbrightFrame7( bgbright, event )
										return 
									else
										bgbright:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
										bgbright:setAlpha( 1 )
										bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame7 )
									end
								end
								
								if event.interrupted then
									bgbrightFrame6( bgbright, event )
									return 
								else
									bgbright:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									bgbright:setAlpha( 0.8 )
									bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame6 )
								end
							end
							
							if event.interrupted then
								bgbrightFrame5( bgbright, event )
								return 
							else
								bgbright:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								bgbright:setAlpha( 1 )
								bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame5 )
							end
						end
						
						if event.interrupted then
							bgbrightFrame4( bgbright, event )
							return 
						else
							bgbright:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							bgbright:setAlpha( 0.7 )
							bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame4 )
						end
					end
					
					if event.interrupted then
						bgbrightFrame3( bgbright, event )
						return 
					else
						bgbright:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						bgbright:setAlpha( 1 )
						bgbright:registerEventHandler( "transition_complete_keyframe", bgbrightFrame3 )
					end
				end
				
				bgbright:completeAnimation()
				self.bgbright:setAlpha( 0.5 )
				bgbrightFrame2( bgbright, {} )
				dude:completeAnimation()
				self.dude:setAlpha( 1 )
				self.clipFinished( dude, {} )
				local dudebrightFrame2 = function ( dudebright, event )
					local dudebrightFrame3 = function ( dudebright, event )
						local dudebrightFrame4 = function ( dudebright, event )
							local dudebrightFrame5 = function ( dudebright, event )
								local dudebrightFrame6 = function ( dudebright, event )
									local dudebrightFrame7 = function ( dudebright, event )
										local dudebrightFrame8 = function ( dudebright, event )
											local dudebrightFrame9 = function ( dudebright, event )
												local dudebrightFrame10 = function ( dudebright, event )
													local dudebrightFrame11 = function ( dudebright, event )
														local dudebrightFrame12 = function ( dudebright, event )
															local dudebrightFrame13 = function ( dudebright, event )
																local dudebrightFrame14 = function ( dudebright, event )
																	local dudebrightFrame15 = function ( dudebright, event )
																		local dudebrightFrame16 = function ( dudebright, event )
																			local dudebrightFrame17 = function ( dudebright, event )
																				local dudebrightFrame18 = function ( dudebright, event )
																					local dudebrightFrame19 = function ( dudebright, event )
																						local dudebrightFrame20 = function ( dudebright, event )
																							local dudebrightFrame21 = function ( dudebright, event )
																								local dudebrightFrame22 = function ( dudebright, event )
																									local dudebrightFrame23 = function ( dudebright, event )
																										local dudebrightFrame24 = function ( dudebright, event )
																											local dudebrightFrame25 = function ( dudebright, event )
																												local dudebrightFrame26 = function ( dudebright, event )
																													local dudebrightFrame27 = function ( dudebright, event )
																														local dudebrightFrame28 = function ( dudebright, event )
																															local dudebrightFrame29 = function ( dudebright, event )
																																if not event.interrupted then
																																	dudebright:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																																end
																																dudebright:setAlpha( 0.5 )
																																if event.interrupted then
																																	self.clipFinished( dudebright, event )
																																else
																																	dudebright:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																dudebrightFrame29( dudebright, event )
																																return 
																															else
																																dudebright:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
																																dudebright:setAlpha( 1 )
																																dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															dudebrightFrame28( dudebright, event )
																															return 
																														else
																															dudebright:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																															dudebright:setAlpha( 0.8 )
																															dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														dudebrightFrame27( dudebright, event )
																														return 
																													else
																														dudebright:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
																														dudebright:setAlpha( 1 )
																														dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													dudebrightFrame26( dudebright, event )
																													return 
																												else
																													dudebright:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																													dudebright:setAlpha( 0.8 )
																													dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												dudebrightFrame25( dudebright, event )
																												return 
																											else
																												dudebright:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																												dudebright:setAlpha( 1 )
																												dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											dudebrightFrame24( dudebright, event )
																											return 
																										else
																											dudebright:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																											dudebright:setAlpha( 0.5 )
																											dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										dudebrightFrame23( dudebright, event )
																										return 
																									else
																										dudebright:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																										dudebright:setAlpha( 1 )
																										dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									dudebrightFrame22( dudebright, event )
																									return 
																								else
																									dudebright:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									dudebright:setAlpha( 0.8 )
																									dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								dudebrightFrame21( dudebright, event )
																								return 
																							else
																								dudebright:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																								dudebright:setAlpha( 1 )
																								dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							dudebrightFrame20( dudebright, event )
																							return 
																						else
																							dudebright:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																							dudebright:setAlpha( 0.8 )
																							dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						dudebrightFrame19( dudebright, event )
																						return 
																					else
																						dudebright:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																						dudebright:setAlpha( 1 )
																						dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					dudebrightFrame18( dudebright, event )
																					return 
																				else
																					dudebright:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																					dudebright:setAlpha( 0.8 )
																					dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				dudebrightFrame17( dudebright, event )
																				return 
																			else
																				dudebright:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																				dudebright:setAlpha( 1 )
																				dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			dudebrightFrame16( dudebright, event )
																			return 
																		else
																			dudebright:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			dudebright:setAlpha( 0.5 )
																			dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		dudebrightFrame15( dudebright, event )
																		return 
																	else
																		dudebright:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																		dudebright:setAlpha( 1 )
																		dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame15 )
																	end
																end
																
																if event.interrupted then
																	dudebrightFrame14( dudebright, event )
																	return 
																else
																	dudebright:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	dudebright:setAlpha( 0.8 )
																	dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame14 )
																end
															end
															
															if event.interrupted then
																dudebrightFrame13( dudebright, event )
																return 
															else
																dudebright:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																dudebright:setAlpha( 1 )
																dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame13 )
															end
														end
														
														if event.interrupted then
															dudebrightFrame12( dudebright, event )
															return 
														else
															dudebright:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															dudebright:setAlpha( 0.8 )
															dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame12 )
														end
													end
													
													if event.interrupted then
														dudebrightFrame11( dudebright, event )
														return 
													else
														dudebright:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
														dudebright:setAlpha( 1 )
														dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame11 )
													end
												end
												
												if event.interrupted then
													dudebrightFrame10( dudebright, event )
													return 
												else
													dudebright:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													dudebright:setAlpha( 0.6 )
													dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame10 )
												end
											end
											
											if event.interrupted then
												dudebrightFrame9( dudebright, event )
												return 
											else
												dudebright:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
												dudebright:setAlpha( 1 )
												dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame9 )
											end
										end
										
										if event.interrupted then
											dudebrightFrame8( dudebright, event )
											return 
										else
											dudebright:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											dudebright:setAlpha( 0.8 )
											dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame8 )
										end
									end
									
									if event.interrupted then
										dudebrightFrame7( dudebright, event )
										return 
									else
										dudebright:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
										dudebright:setAlpha( 1 )
										dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame7 )
									end
								end
								
								if event.interrupted then
									dudebrightFrame6( dudebright, event )
									return 
								else
									dudebright:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									dudebright:setAlpha( 0.8 )
									dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame6 )
								end
							end
							
							if event.interrupted then
								dudebrightFrame5( dudebright, event )
								return 
							else
								dudebright:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								dudebright:setAlpha( 1 )
								dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame5 )
							end
						end
						
						if event.interrupted then
							dudebrightFrame4( dudebright, event )
							return 
						else
							dudebright:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							dudebright:setAlpha( 0.5 )
							dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame4 )
						end
					end
					
					if event.interrupted then
						dudebrightFrame3( dudebright, event )
						return 
					else
						dudebright:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						dudebright:setAlpha( 1 )
						dudebright:registerEventHandler( "transition_complete_keyframe", dudebrightFrame3 )
					end
				end
				
				dudebright:completeAnimation()
				self.dudebright:setAlpha( 0.5 )
				dudebrightFrame2( dudebright, {} )
				dudeR:completeAnimation()
				self.dudeR:setAlpha( 1 )
				self.dudeR:setImage( RegisterImage( "uie_t7_callingcard_mp_zeus_body_light" ) )
				self.clipFinished( dudeR, {} )
				local firestill1aFrame2 = function ( firestill1a, event )
					local firestill1aFrame3 = function ( firestill1a, event )
						local firestill1aFrame4 = function ( firestill1a, event )
							local firestill1aFrame5 = function ( firestill1a, event )
								local firestill1aFrame6 = function ( firestill1a, event )
									local firestill1aFrame7 = function ( firestill1a, event )
										local firestill1aFrame8 = function ( firestill1a, event )
											local firestill1aFrame9 = function ( firestill1a, event )
												local firestill1aFrame10 = function ( firestill1a, event )
													local firestill1aFrame11 = function ( firestill1a, event )
														if not event.interrupted then
															firestill1a:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
														end
														firestill1a:setAlpha( 0.5 )
														if event.interrupted then
															self.clipFinished( firestill1a, event )
														else
															firestill1a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														firestill1aFrame11( firestill1a, event )
														return 
													else
														firestill1a:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
														firestill1a:setAlpha( 1 )
														firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame11 )
													end
												end
												
												if event.interrupted then
													firestill1aFrame10( firestill1a, event )
													return 
												else
													firestill1a:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
													firestill1a:setAlpha( 0.3 )
													firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame10 )
												end
											end
											
											if event.interrupted then
												firestill1aFrame9( firestill1a, event )
												return 
											else
												firestill1a:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
												firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame9 )
											end
										end
										
										if event.interrupted then
											firestill1aFrame8( firestill1a, event )
											return 
										else
											firestill1a:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
											firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame8 )
										end
									end
									
									if event.interrupted then
										firestill1aFrame7( firestill1a, event )
										return 
									else
										firestill1a:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
										firestill1a:setAlpha( 1 )
										firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame7 )
									end
								end
								
								if event.interrupted then
									firestill1aFrame6( firestill1a, event )
									return 
								else
									firestill1a:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
									firestill1a:setAlpha( 0.3 )
									firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame6 )
								end
							end
							
							if event.interrupted then
								firestill1aFrame5( firestill1a, event )
								return 
							else
								firestill1a:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
								firestill1a:setAlpha( 1 )
								firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame5 )
							end
						end
						
						if event.interrupted then
							firestill1aFrame4( firestill1a, event )
							return 
						else
							firestill1a:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							firestill1a:setAlpha( 0.5 )
							firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame4 )
						end
					end
					
					if event.interrupted then
						firestill1aFrame3( firestill1a, event )
						return 
					else
						firestill1a:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						firestill1a:setAlpha( 1 )
						firestill1a:registerEventHandler( "transition_complete_keyframe", firestill1aFrame3 )
					end
				end
				
				firestill1a:completeAnimation()
				self.firestill1a:setAlpha( 0.3 )
				firestill1aFrame2( firestill1a, {} )
				firestill1b:completeAnimation()
				self.firestill1b:setAlpha( 1 )
				self.clipFinished( firestill1b, {} )
				local firestill2aFrame2 = function ( firestill2a, event )
					local firestill2aFrame3 = function ( firestill2a, event )
						local firestill2aFrame4 = function ( firestill2a, event )
							local firestill2aFrame5 = function ( firestill2a, event )
								local firestill2aFrame6 = function ( firestill2a, event )
									local firestill2aFrame7 = function ( firestill2a, event )
										local firestill2aFrame8 = function ( firestill2a, event )
											local firestill2aFrame9 = function ( firestill2a, event )
												local firestill2aFrame10 = function ( firestill2a, event )
													local firestill2aFrame11 = function ( firestill2a, event )
														if not event.interrupted then
															firestill2a:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
														end
														firestill2a:setAlpha( 0.4 )
														if event.interrupted then
															self.clipFinished( firestill2a, event )
														else
															firestill2a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														firestill2aFrame11( firestill2a, event )
														return 
													else
														firestill2a:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
														firestill2a:setAlpha( 1 )
														firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame11 )
													end
												end
												
												if event.interrupted then
													firestill2aFrame10( firestill2a, event )
													return 
												else
													firestill2a:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
													firestill2a:setAlpha( 0.4 )
													firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame10 )
												end
											end
											
											if event.interrupted then
												firestill2aFrame9( firestill2a, event )
												return 
											else
												firestill2a:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
												firestill2a:setAlpha( 1 )
												firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame9 )
											end
										end
										
										if event.interrupted then
											firestill2aFrame8( firestill2a, event )
											return 
										else
											firestill2a:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
											firestill2a:setAlpha( 0.4 )
											firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame8 )
										end
									end
									
									if event.interrupted then
										firestill2aFrame7( firestill2a, event )
										return 
									else
										firestill2a:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
										firestill2a:setAlpha( 1 )
										firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame7 )
									end
								end
								
								if event.interrupted then
									firestill2aFrame6( firestill2a, event )
									return 
								else
									firestill2a:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
									firestill2a:setAlpha( 0.4 )
									firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame6 )
								end
							end
							
							if event.interrupted then
								firestill2aFrame5( firestill2a, event )
								return 
							else
								firestill2a:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
								firestill2a:setAlpha( 1 )
								firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame5 )
							end
						end
						
						if event.interrupted then
							firestill2aFrame4( firestill2a, event )
							return 
						else
							firestill2a:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							firestill2a:setAlpha( 0.4 )
							firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame4 )
						end
					end
					
					if event.interrupted then
						firestill2aFrame3( firestill2a, event )
						return 
					else
						firestill2a:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
						firestill2a:setAlpha( 1 )
						firestill2a:registerEventHandler( "transition_complete_keyframe", firestill2aFrame3 )
					end
				end
				
				firestill2a:completeAnimation()
				self.firestill2a:setAlpha( 0.4 )
				firestill2aFrame2( firestill2a, {} )
				firestill2b:completeAnimation()
				self.firestill2b:setAlpha( 1 )
				self.clipFinished( firestill2b, {} )
				smokesmall:completeAnimation()
				self.smokesmall:setAlpha( 1 )
				self.clipFinished( smokesmall, {} )
				smokelarge2:completeAnimation()
				self.smokelarge2:setAlpha( 0.5 )
				self.clipFinished( smokelarge2, {} )
				smokelarge20:completeAnimation()
				self.smokelarge20:setAlpha( 0.5 )
				self.clipFinished( smokelarge20, {} )
				smokesmall2:completeAnimation()
				self.smokesmall2:setAlpha( 1 )
				self.clipFinished( smokesmall2, {} )
				EMBER2c1:completeAnimation()
				self.EMBER2c1:setAlpha( 1 )
				self.clipFinished( EMBER2c1, {} )
				EMBER2c2:completeAnimation()
				self.EMBER2c2:setAlpha( 1 )
				self.clipFinished( EMBER2c2, {} )
				EMBER2c3:completeAnimation()
				self.EMBER2c3:setAlpha( 1 )
				self.clipFinished( EMBER2c3, {} )
				EMBER2c4:completeAnimation()
				self.EMBER2c4:setAlpha( 1 )
				self.clipFinished( EMBER2c4, {} )
				flipbook:completeAnimation()
				self.flipbook:setAlpha( 1 )
				self.clipFinished( flipbook, {} )
				flipbook0:completeAnimation()
				self.flipbook0:setAlpha( 1 )
				self.clipFinished( flipbook0, {} )
				local raysFrame2 = function ( rays, event )
					local raysFrame3 = function ( rays, event )
						local raysFrame4 = function ( rays, event )
							local raysFrame5 = function ( rays, event )
								if not event.interrupted then
									rays:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
								end
								rays:setLeftRight( true, false, 111.36, 543.36 )
								rays:setTopBottom( true, false, 0, 108 )
								rays:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( rays, event )
								else
									rays:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								raysFrame5( rays, event )
								return 
							else
								rays:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Linear )
								rays:setLeftRight( true, false, 111.36, 543.36 )
								rays:setAlpha( 0.48 )
								rays:registerEventHandler( "transition_complete_keyframe", raysFrame5 )
							end
						end
						
						if event.interrupted then
							raysFrame4( rays, event )
							return 
						else
							rays:beginAnimation( "keyframe", 890, false, false, CoD.TweenType.Linear )
							rays:setLeftRight( true, false, 77.95, 509.95 )
							rays:registerEventHandler( "transition_complete_keyframe", raysFrame4 )
						end
					end
					
					if event.interrupted then
						raysFrame3( rays, event )
						return 
					else
						rays:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
						rays:setLeftRight( true, false, 36.08, 468.08 )
						rays:setAlpha( 0.7 )
						rays:registerEventHandler( "transition_complete_keyframe", raysFrame3 )
					end
				end
				
				rays:completeAnimation()
				self.rays:setLeftRight( true, false, -2.98, 429.02 )
				self.rays:setTopBottom( true, false, 0, 108 )
				self.rays:setAlpha( 0 )
				raysFrame2( rays, {} )
				local rays2Frame2 = function ( rays2, event )
					local rays2Frame3 = function ( rays2, event )
						local rays2Frame4 = function ( rays2, event )
							local rays2Frame5 = function ( rays2, event )
								local rays2Frame6 = function ( rays2, event )
									if not event.interrupted then
										rays2:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
									end
									rays2:setLeftRight( true, false, 23.48, 455.48 )
									rays2:setTopBottom( true, false, 0, 108 )
									rays2:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( rays2, event )
									else
										rays2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									rays2Frame6( rays2, event )
									return 
								else
									rays2:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
									rays2:setLeftRight( true, false, 3.71, 435.71 )
									rays2:setAlpha( 0 )
									rays2:registerEventHandler( "transition_complete_keyframe", rays2Frame6 )
								end
							end
							
							if event.interrupted then
								rays2Frame5( rays2, event )
								return 
							else
								rays2:beginAnimation( "keyframe", 570, false, false, CoD.TweenType.Linear )
								rays2:setLeftRight( true, false, -7.67, 424.33 )
								rays2:registerEventHandler( "transition_complete_keyframe", rays2Frame5 )
							end
						end
						
						if event.interrupted then
							rays2Frame4( rays2, event )
							return 
						else
							rays2:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
							rays2:setLeftRight( true, false, -19.05, 412.95 )
							rays2:setAlpha( 1 )
							rays2:registerEventHandler( "transition_complete_keyframe", rays2Frame4 )
						end
					end
					
					if event.interrupted then
						rays2Frame3( rays2, event )
						return 
					else
						rays2:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						rays2:setLeftRight( true, false, -41.41, 390.59 )
						rays2:registerEventHandler( "transition_complete_keyframe", rays2Frame3 )
					end
				end
				
				rays2:completeAnimation()
				self.rays2:setLeftRight( true, false, -55.99, 376.01 )
				self.rays2:setTopBottom( true, false, 0, 108 )
				self.rays2:setAlpha( 0 )
				rays2Frame2( rays2, {} )
				local rays3Frame2 = function ( rays3, event )
					if not event.interrupted then
						rays3:beginAnimation( "keyframe", 3119, false, false, CoD.TweenType.Linear )
					end
					rays3:setLeftRight( true, false, 63.52, 471.52 )
					rays3:setTopBottom( true, false, 0.31, 120.31 )
					rays3:setAlpha( 0.51 )
					if event.interrupted then
						self.clipFinished( rays3, event )
					else
						rays3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				rays3:completeAnimation()
				self.rays3:setLeftRight( true, false, 63.52, 471.52 )
				self.rays3:setTopBottom( true, false, 0.31, 120.31 )
				self.rays3:setAlpha( 0.51 )
				rays3Frame2( rays3, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

