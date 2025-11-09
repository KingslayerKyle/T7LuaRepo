CoD.CallingCards_ZM_Heroes = InheritFrom( LUI.UIElement )
CoD.CallingCards_ZM_Heroes.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_ZM_Heroes )
	self.id = "CallingCards_ZM_Heroes"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local ember = LUI.UIImage.new()
	ember:setLeftRight( true, false, 0, 480 )
	ember:setTopBottom( true, false, 0, 120 )
	ember:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_cloud_tile" ) )
	ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	ember:setShaderVector( 0, 1, 1, 0, 0 )
	ember:setShaderVector( 1, 0.05, 0, 0, 0 )
	self:addElement( ember )
	self.ember = ember
	
	local dudes = LUI.UIImage.new()
	dudes:setLeftRight( true, false, 263.1, 419.1 )
	dudes:setTopBottom( true, false, -5.74, 114.26 )
	dudes:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes" ) )
	self:addElement( dudes )
	self.dudes = dudes
	
	local flash = LUI.UIImage.new()
	flash:setLeftRight( true, false, 92.1, 476.1 )
	flash:setTopBottom( true, false, 0, 108 )
	flash:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_flash" ) )
	self:addElement( flash )
	self.flash = flash
	
	local flip = LUI.UIImage.new()
	flip:setLeftRight( true, false, 226.6, 446.6 )
	flip:setTopBottom( true, false, -20.74, 72.26 )
	flip:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_flipbook" ) )
	flip:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flip:setShaderVector( 0, 4, 2, 0, 0 )
	flip:setShaderVector( 1, 12, 0, 0, 0 )
	self:addElement( flip )
	self.flip = flip
	
	local crowd1 = LUI.UIImage.new()
	crowd1:setLeftRight( true, false, -3.46, 200.54 )
	crowd1:setTopBottom( true, false, 42.26, 162.26 )
	crowd1:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_crowd1" ) )
	self:addElement( crowd1 )
	self.crowd1 = crowd1
	
	local crowd2 = LUI.UIImage.new()
	crowd2:setLeftRight( true, false, 348, 480 )
	crowd2:setTopBottom( true, false, 60, 156 )
	crowd2:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_crowd2" ) )
	self:addElement( crowd2 )
	self.crowd2 = crowd2
	
	local crowd3 = LUI.UIImage.new()
	crowd3:setLeftRight( true, false, 169.6, 289.6 )
	crowd3:setTopBottom( true, false, 56, 152 )
	crowd3:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_crowd3" ) )
	self:addElement( crowd3 )
	self.crowd3 = crowd3
	
	local crowd4 = LUI.UIImage.new()
	crowd4:setLeftRight( true, false, 418.1, 502.1 )
	crowd4:setTopBottom( true, false, 81.26, 141.26 )
	crowd4:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_crowd4" ) )
	self:addElement( crowd4 )
	self.crowd4 = crowd4
	
	local flash2 = LUI.UIImage.new()
	flash2:setLeftRight( true, false, 156, 480 )
	flash2:setTopBottom( true, false, 0, 120 )
	flash2:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_flash2" ) )
	flash2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( flash2 )
	self.flash2 = flash2
	
	local EMBER2c = LUI.UIImage.new()
	EMBER2c:setLeftRight( true, false, 240, 720 )
	EMBER2c:setTopBottom( true, false, -238, 422 )
	EMBER2c:setAlpha( 0.3 )
	EMBER2c:setYRot( 1 )
	EMBER2c:setZRot( 53 )
	EMBER2c:setScale( 0.7 )
	EMBER2c:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c:setShaderVector( 1, 0, 0.04, 0, 0 )
	self:addElement( EMBER2c )
	self.EMBER2c = EMBER2c
	
	local EMBER2b = LUI.UIImage.new()
	EMBER2b:setLeftRight( true, false, -141, 339 )
	EMBER2b:setTopBottom( true, false, -238, 422 )
	EMBER2b:setAlpha( 0.4 )
	EMBER2b:setYRot( 1 )
	EMBER2b:setZRot( 53 )
	EMBER2b:setScale( 0.7 )
	EMBER2b:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2b:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2b:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2b:setShaderVector( 1, 0, 0.03, 0, 0 )
	self:addElement( EMBER2b )
	self.EMBER2b = EMBER2b
	
	local EMBER2 = LUI.UIImage.new()
	EMBER2:setLeftRight( true, false, 0, 480 )
	EMBER2:setTopBottom( true, false, -251, 409 )
	EMBER2:setYRot( 1 )
	EMBER2:setZRot( 53 )
	EMBER2:setImage( RegisterImage( "uie_callingcards_cwl_ember2" ) )
	EMBER2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2:setShaderVector( 1, 0, 0.05, 0, 0 )
	self:addElement( EMBER2 )
	self.EMBER2 = EMBER2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
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
				local emberFrame2 = function ( ember, event )
					if not event.interrupted then
						ember:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
					end
					ember:setAlpha( 1 )
					ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
					ember:setShaderVector( 0, 1, 1, 0, 0 )
					ember:setShaderVector( 1, 0.03, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( ember, event )
					else
						ember:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ember:completeAnimation()
				self.ember:setAlpha( 1 )
				self.ember:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
				self.ember:setShaderVector( 0, 1, 1, 0, 0 )
				self.ember:setShaderVector( 1, 0.03, 0, 0, 0 )
				emberFrame2( ember, {} )
				dudes:completeAnimation()
				self.dudes:setAlpha( 1 )
				self.clipFinished( dudes, {} )
				local flashFrame2 = function ( flash, event )
					local flashFrame3 = function ( flash, event )
						local flashFrame4 = function ( flash, event )
							local flashFrame5 = function ( flash, event )
								local flashFrame6 = function ( flash, event )
									local flashFrame7 = function ( flash, event )
										local flashFrame8 = function ( flash, event )
											local flashFrame9 = function ( flash, event )
												local flashFrame10 = function ( flash, event )
													local flashFrame11 = function ( flash, event )
														local flashFrame12 = function ( flash, event )
															local flashFrame13 = function ( flash, event )
																local flashFrame14 = function ( flash, event )
																	local flashFrame15 = function ( flash, event )
																		local flashFrame16 = function ( flash, event )
																			local flashFrame17 = function ( flash, event )
																				local flashFrame18 = function ( flash, event )
																					local flashFrame19 = function ( flash, event )
																						if not event.interrupted then
																							flash:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
																						end
																						flash:setLeftRight( true, false, 92.1, 476.1 )
																						flash:setTopBottom( true, false, 0, 108 )
																						flash:setAlpha( 1 )
																						flash:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_flash" ) )
																						if event.interrupted then
																							self.clipFinished( flash, event )
																						else
																							flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						flashFrame19( flash, event )
																						return 
																					else
																						flash:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
																						flash:setAlpha( 0.7 )
																						flash:registerEventHandler( "transition_complete_keyframe", flashFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					flashFrame18( flash, event )
																					return 
																				else
																					flash:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																					flash:setAlpha( 1 )
																					flash:registerEventHandler( "transition_complete_keyframe", flashFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				flashFrame17( flash, event )
																				return 
																			else
																				flash:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																				flash:setAlpha( 0.2 )
																				flash:registerEventHandler( "transition_complete_keyframe", flashFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			flashFrame16( flash, event )
																			return 
																		else
																			flash:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
																			flash:setAlpha( 1 )
																			flash:registerEventHandler( "transition_complete_keyframe", flashFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		flashFrame15( flash, event )
																		return 
																	else
																		flash:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
																		flash:setAlpha( 0.7 )
																		flash:registerEventHandler( "transition_complete_keyframe", flashFrame15 )
																	end
																end
																
																if event.interrupted then
																	flashFrame14( flash, event )
																	return 
																else
																	flash:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																	flash:setAlpha( 1 )
																	flash:registerEventHandler( "transition_complete_keyframe", flashFrame14 )
																end
															end
															
															if event.interrupted then
																flashFrame13( flash, event )
																return 
															else
																flash:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																flash:setAlpha( 0.2 )
																flash:registerEventHandler( "transition_complete_keyframe", flashFrame13 )
															end
														end
														
														if event.interrupted then
															flashFrame12( flash, event )
															return 
														else
															flash:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
															flash:setAlpha( 0.7 )
															flash:registerEventHandler( "transition_complete_keyframe", flashFrame12 )
														end
													end
													
													if event.interrupted then
														flashFrame11( flash, event )
														return 
													else
														flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
														flash:setAlpha( 0.3 )
														flash:registerEventHandler( "transition_complete_keyframe", flashFrame11 )
													end
												end
												
												if event.interrupted then
													flashFrame10( flash, event )
													return 
												else
													flash:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
													flash:setAlpha( 1 )
													flash:registerEventHandler( "transition_complete_keyframe", flashFrame10 )
												end
											end
											
											if event.interrupted then
												flashFrame9( flash, event )
												return 
											else
												flash:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
												flash:setAlpha( 0.5 )
												flash:registerEventHandler( "transition_complete_keyframe", flashFrame9 )
											end
										end
										
										if event.interrupted then
											flashFrame8( flash, event )
											return 
										else
											flash:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
											flash:setAlpha( 1 )
											flash:registerEventHandler( "transition_complete_keyframe", flashFrame8 )
										end
									end
									
									if event.interrupted then
										flashFrame7( flash, event )
										return 
									else
										flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										flash:setAlpha( 0.3 )
										flash:registerEventHandler( "transition_complete_keyframe", flashFrame7 )
									end
								end
								
								if event.interrupted then
									flashFrame6( flash, event )
									return 
								else
									flash:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
									flash:setAlpha( 1 )
									flash:registerEventHandler( "transition_complete_keyframe", flashFrame6 )
								end
							end
							
							if event.interrupted then
								flashFrame5( flash, event )
								return 
							else
								flash:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								flash:setAlpha( 0.5 )
								flash:registerEventHandler( "transition_complete_keyframe", flashFrame5 )
							end
						end
						
						if event.interrupted then
							flashFrame4( flash, event )
							return 
						else
							flash:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							flash:setAlpha( 1 )
							flash:registerEventHandler( "transition_complete_keyframe", flashFrame4 )
						end
					end
					
					if event.interrupted then
						flashFrame3( flash, event )
						return 
					else
						flash:beginAnimation( "keyframe", 109, true, false, CoD.TweenType.Back )
						flash:setAlpha( 0.7 )
						flash:registerEventHandler( "transition_complete_keyframe", flashFrame3 )
					end
				end
				
				flash:completeAnimation()
				self.flash:setLeftRight( true, false, 92.1, 476.1 )
				self.flash:setTopBottom( true, false, 0, 108 )
				self.flash:setAlpha( 1 )
				self.flash:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_flash" ) )
				flashFrame2( flash, {} )
				local flipFrame2 = function ( flip, event )
					local flipFrame3 = function ( flip, event )
						local flipFrame4 = function ( flip, event )
							local flipFrame5 = function ( flip, event )
								if not event.interrupted then
									flip:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
								end
								flip:setLeftRight( true, false, 223.1, 448.1 )
								flip:setTopBottom( true, false, -25, 70 )
								flip:setAlpha( 1 )
								flip:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_flipbook" ) )
								flip:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
								flip:setShaderVector( 0, 4, 2, 0, 0 )
								flip:setShaderVector( 1, 12, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( flip, event )
								else
									flip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								flipFrame5( flip, event )
								return 
							else
								flip:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
								flip:setAlpha( 0 )
								flip:registerEventHandler( "transition_complete_keyframe", flipFrame5 )
							end
						end
						
						if event.interrupted then
							flipFrame4( flip, event )
							return 
						else
							flip:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							flip:setAlpha( 1 )
							flip:registerEventHandler( "transition_complete_keyframe", flipFrame4 )
						end
					end
					
					if event.interrupted then
						flipFrame3( flip, event )
						return 
					else
						flip:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						flip:setAlpha( 0 )
						flip:registerEventHandler( "transition_complete_keyframe", flipFrame3 )
					end
				end
				
				flip:completeAnimation()
				self.flip:setLeftRight( true, false, 223.1, 448.1 )
				self.flip:setTopBottom( true, false, -25, 70 )
				self.flip:setAlpha( 1 )
				self.flip:setImage( RegisterImage( "uie_t7_callingcard_zm_heroes_flipbook" ) )
				self.flip:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
				self.flip:setShaderVector( 0, 4, 2, 0, 0 )
				self.flip:setShaderVector( 1, 12, 0, 0, 0 )
				flipFrame2( flip, {} )
				local crowd1Frame2 = function ( crowd1, event )
					local crowd1Frame3 = function ( crowd1, event )
						local crowd1Frame4 = function ( crowd1, event )
							local crowd1Frame5 = function ( crowd1, event )
								local crowd1Frame6 = function ( crowd1, event )
									if not event.interrupted then
										crowd1:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
									end
									crowd1:setLeftRight( true, false, -3.46, 194.04 )
									crowd1:setTopBottom( true, false, 39.82, 156 )
									crowd1:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( crowd1, event )
									else
										crowd1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									crowd1Frame6( crowd1, event )
									return 
								else
									crowd1:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Linear )
									crowd1:setLeftRight( true, false, -3.46, 189.54 )
									crowd1:setTopBottom( true, false, 42.47, 156 )
									crowd1:registerEventHandler( "transition_complete_keyframe", crowd1Frame6 )
								end
							end
							
							if event.interrupted then
								crowd1Frame5( crowd1, event )
								return 
							else
								crowd1:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								crowd1:setLeftRight( true, false, -3.46, 195.54 )
								crowd1:setTopBottom( true, false, 39.47, 156 )
								crowd1:registerEventHandler( "transition_complete_keyframe", crowd1Frame5 )
							end
						end
						
						if event.interrupted then
							crowd1Frame4( crowd1, event )
							return 
						else
							crowd1:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
							crowd1:setLeftRight( true, false, -3.46, 189.54 )
							crowd1:setTopBottom( true, false, 42.47, 156 )
							crowd1:registerEventHandler( "transition_complete_keyframe", crowd1Frame4 )
						end
					end
					
					if event.interrupted then
						crowd1Frame3( crowd1, event )
						return 
					else
						crowd1:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						crowd1:setLeftRight( true, false, -3.46, 202.54 )
						crowd1:setTopBottom( true, false, 34.82, 156 )
						crowd1:registerEventHandler( "transition_complete_keyframe", crowd1Frame3 )
					end
				end
				
				crowd1:completeAnimation()
				self.crowd1:setLeftRight( true, false, -3.46, 194.04 )
				self.crowd1:setTopBottom( true, false, 39.82, 156 )
				self.crowd1:setAlpha( 1 )
				crowd1Frame2( crowd1, {} )
				local crowd2Frame2 = function ( crowd2, event )
					local crowd2Frame3 = function ( crowd2, event )
						local crowd2Frame4 = function ( crowd2, event )
							local crowd2Frame5 = function ( crowd2, event )
								local crowd2Frame6 = function ( crowd2, event )
									if not event.interrupted then
										crowd2:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
									end
									crowd2:setLeftRight( true, false, 348, 480 )
									crowd2:setTopBottom( true, false, 60, 156 )
									crowd2:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( crowd2, event )
									else
										crowd2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									crowd2Frame6( crowd2, event )
									return 
								else
									crowd2:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
									crowd2:setLeftRight( true, false, 342.5, 480 )
									crowd2:setTopBottom( true, false, 56, 156 )
									crowd2:registerEventHandler( "transition_complete_keyframe", crowd2Frame6 )
								end
							end
							
							if event.interrupted then
								crowd2Frame5( crowd2, event )
								return 
							else
								crowd2:beginAnimation( "keyframe", 940, false, false, CoD.TweenType.Linear )
								crowd2:setLeftRight( true, false, 341.1, 480 )
								crowd2:setTopBottom( true, false, 54.98, 156 )
								crowd2:registerEventHandler( "transition_complete_keyframe", crowd2Frame5 )
							end
						end
						
						if event.interrupted then
							crowd2Frame4( crowd2, event )
							return 
						else
							crowd2:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
							crowd2:setLeftRight( true, false, 348, 480 )
							crowd2:setTopBottom( true, false, 60, 156 )
							crowd2:registerEventHandler( "transition_complete_keyframe", crowd2Frame4 )
						end
					end
					
					if event.interrupted then
						crowd2Frame3( crowd2, event )
						return 
					else
						crowd2:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						crowd2:setLeftRight( true, false, 341.1, 480 )
						crowd2:setTopBottom( true, false, 54.98, 156 )
						crowd2:registerEventHandler( "transition_complete_keyframe", crowd2Frame3 )
					end
				end
				
				crowd2:completeAnimation()
				self.crowd2:setLeftRight( true, false, 348, 480 )
				self.crowd2:setTopBottom( true, false, 60, 156 )
				self.crowd2:setAlpha( 1 )
				crowd2Frame2( crowd2, {} )
				local crowd3Frame2 = function ( crowd3, event )
					local crowd3Frame3 = function ( crowd3, event )
						local crowd3Frame4 = function ( crowd3, event )
							local crowd3Frame5 = function ( crowd3, event )
								local crowd3Frame6 = function ( crowd3, event )
									if not event.interrupted then
										crowd3:beginAnimation( "keyframe", 890, false, false, CoD.TweenType.Linear )
									end
									crowd3:setLeftRight( true, false, 163.1, 283.1 )
									crowd3:setTopBottom( true, false, 55.26, 151.26 )
									crowd3:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( crowd3, event )
									else
										crowd3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									crowd3Frame6( crowd3, event )
									return 
								else
									crowd3:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
									crowd3:setLeftRight( true, false, 165.02, 286.6 )
									crowd3:setTopBottom( true, false, 54, 151.26 )
									crowd3:registerEventHandler( "transition_complete_keyframe", crowd3Frame6 )
								end
							end
							
							if event.interrupted then
								crowd3Frame5( crowd3, event )
								return 
							else
								crowd3:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
								crowd3:setLeftRight( true, false, 173.27, 289.85 )
								crowd3:setTopBottom( true, false, 58, 151.26 )
								crowd3:registerEventHandler( "transition_complete_keyframe", crowd3Frame5 )
							end
						end
						
						if event.interrupted then
							crowd3Frame4( crowd3, event )
							return 
						else
							crowd3:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Linear )
							crowd3:setLeftRight( true, false, 163.1, 284.35 )
							crowd3:setTopBottom( true, false, 54.26, 151.26 )
							crowd3:registerEventHandler( "transition_complete_keyframe", crowd3Frame4 )
						end
					end
					
					if event.interrupted then
						crowd3Frame3( crowd3, event )
						return 
					else
						crowd3:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						crowd3:setLeftRight( true, false, 163.1, 277.18 )
						crowd3:setTopBottom( true, false, 60, 151.26 )
						crowd3:registerEventHandler( "transition_complete_keyframe", crowd3Frame3 )
					end
				end
				
				crowd3:completeAnimation()
				self.crowd3:setLeftRight( true, false, 163.1, 283.1 )
				self.crowd3:setTopBottom( true, false, 55.26, 151.26 )
				self.crowd3:setAlpha( 1 )
				crowd3Frame2( crowd3, {} )
				local crowd4Frame2 = function ( crowd4, event )
					local crowd4Frame3 = function ( crowd4, event )
						local crowd4Frame4 = function ( crowd4, event )
							local crowd4Frame5 = function ( crowd4, event )
								local crowd4Frame6 = function ( crowd4, event )
									local crowd4Frame7 = function ( crowd4, event )
										if not event.interrupted then
											crowd4:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
										end
										crowd4:setLeftRight( true, false, 419.1, 503.1 )
										crowd4:setTopBottom( true, false, 81.26, 141.26 )
										crowd4:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( crowd4, event )
										else
											crowd4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										crowd4Frame7( crowd4, event )
										return 
									else
										crowd4:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
										crowd4:setLeftRight( true, false, 416.3, 503.1 )
										crowd4:setTopBottom( true, false, 79.26, 141.26 )
										crowd4:registerEventHandler( "transition_complete_keyframe", crowd4Frame7 )
									end
								end
								
								if event.interrupted then
									crowd4Frame6( crowd4, event )
									return 
								else
									crowd4:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
									crowd4:setLeftRight( true, false, 419.1, 503.1 )
									crowd4:setTopBottom( true, false, 81.26, 141.26 )
									crowd4:registerEventHandler( "transition_complete_keyframe", crowd4Frame6 )
								end
							end
							
							if event.interrupted then
								crowd4Frame5( crowd4, event )
								return 
							else
								crowd4:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
								crowd4:setLeftRight( true, false, 416.3, 503.1 )
								crowd4:setTopBottom( true, false, 79.26, 141.26 )
								crowd4:registerEventHandler( "transition_complete_keyframe", crowd4Frame5 )
							end
						end
						
						if event.interrupted then
							crowd4Frame4( crowd4, event )
							return 
						else
							crowd4:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
							crowd4:setLeftRight( true, false, 419.1, 503.1 )
							crowd4:setTopBottom( true, false, 81.26, 141.26 )
							crowd4:registerEventHandler( "transition_complete_keyframe", crowd4Frame4 )
						end
					end
					
					if event.interrupted then
						crowd4Frame3( crowd4, event )
						return 
					else
						crowd4:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						crowd4:setLeftRight( true, false, 416.3, 503.1 )
						crowd4:setTopBottom( true, false, 79.26, 141.26 )
						crowd4:registerEventHandler( "transition_complete_keyframe", crowd4Frame3 )
					end
				end
				
				crowd4:completeAnimation()
				self.crowd4:setLeftRight( true, false, 419.1, 503.1 )
				self.crowd4:setTopBottom( true, false, 81.26, 141.26 )
				self.crowd4:setAlpha( 1 )
				crowd4Frame2( crowd4, {} )
				local flash2Frame2 = function ( flash2, event )
					local flash2Frame3 = function ( flash2, event )
						local flash2Frame4 = function ( flash2, event )
							local flash2Frame5 = function ( flash2, event )
								local flash2Frame6 = function ( flash2, event )
									if not event.interrupted then
										flash2:beginAnimation( "keyframe", 399, false, true, CoD.TweenType.Linear )
									end
									flash2:setLeftRight( true, false, 59.59, 581 )
									flash2:setTopBottom( true, false, 0, 170.26 )
									flash2:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( flash2, event )
									else
										flash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									flash2Frame6( flash2, event )
									return 
								else
									flash2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									flash2:setLeftRight( true, false, 121.14, 515.19 )
									flash2:setTopBottom( true, false, 0, 137.84 )
									flash2:setAlpha( 1 )
									flash2:registerEventHandler( "transition_complete_keyframe", flash2Frame6 )
								end
							end
							
							if event.interrupted then
								flash2Frame5( flash2, event )
								return 
							else
								flash2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								flash2:setLeftRight( true, false, 136.53, 498.74 )
								flash2:setTopBottom( true, false, 0, 129.73 )
								flash2:setAlpha( 0.5 )
								flash2:registerEventHandler( "transition_complete_keyframe", flash2Frame5 )
							end
						end
						
						if event.interrupted then
							flash2Frame4( flash2, event )
							return 
						else
							flash2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							flash2:setLeftRight( true, false, 145.77, 488.87 )
							flash2:setTopBottom( true, false, 0, 124.86 )
							flash2:setAlpha( 1 )
							flash2:registerEventHandler( "transition_complete_keyframe", flash2Frame4 )
						end
					end
					
					if event.interrupted then
						flash2Frame3( flash2, event )
						return 
					else
						flash2:beginAnimation( "keyframe", 1179, false, false, CoD.TweenType.Linear )
						flash2:registerEventHandler( "transition_complete_keyframe", flash2Frame3 )
					end
				end
				
				flash2:completeAnimation()
				self.flash2:setLeftRight( true, false, 155, 479 )
				self.flash2:setTopBottom( true, false, 0, 120 )
				self.flash2:setAlpha( 0 )
				flash2Frame2( flash2, {} )
				EMBER2c:completeAnimation()
				self.EMBER2c:setAlpha( 0.3 )
				self.clipFinished( EMBER2c, {} )
				EMBER2b:completeAnimation()
				self.EMBER2b:setAlpha( 0.4 )
				self.clipFinished( EMBER2b, {} )
				EMBER2:completeAnimation()
				self.EMBER2:setAlpha( 1 )
				self.clipFinished( EMBER2, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

