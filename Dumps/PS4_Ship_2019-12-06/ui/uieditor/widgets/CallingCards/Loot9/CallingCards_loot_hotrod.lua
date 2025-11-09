require( "ui.uieditor.widgets.CallingCards.Loot9.CallingCards_loot_hotrod_hand" )

CoD.CallingCards_loot_hotrod = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_hotrod.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_hotrod )
	self.id = "CallingCards_loot_hotrod"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local smoke1 = LUI.UIImage.new()
	smoke1:setLeftRight( true, false, 0, 192 )
	smoke1:setTopBottom( true, false, 12, 120 )
	smoke1:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_smoke" ) )
	self:addElement( smoke1 )
	self.smoke1 = smoke1
	
	local smoke4 = LUI.UIImage.new()
	smoke4:setLeftRight( true, false, -11.78, 176.67 )
	smoke4:setTopBottom( true, false, 55, 161 )
	smoke4:setZRot( 18 )
	smoke4:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_smoke" ) )
	self:addElement( smoke4 )
	self.smoke4 = smoke4
	
	local smoke2 = LUI.UIImage.new()
	smoke2:setLeftRight( true, false, -26, 26 )
	smoke2:setTopBottom( true, false, -57, -5 )
	smoke2:setAlpha( 0 )
	smoke2:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_smoke_small" ) )
	self:addElement( smoke2 )
	self.smoke2 = smoke2
	
	local smoke3 = LUI.UIImage.new()
	smoke3:setLeftRight( true, false, -26, 26 )
	smoke3:setTopBottom( true, false, -57, -5 )
	smoke3:setAlpha( 0 )
	smoke3:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_smoke_small" ) )
	self:addElement( smoke3 )
	self.smoke3 = smoke3
	
	local fireTile = LUI.UIImage.new()
	fireTile:setLeftRight( true, false, 133.67, 541 )
	fireTile:setTopBottom( true, false, 6.26, 79 )
	fireTile:setZRot( 15 )
	fireTile:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_tilescroll" ) )
	fireTile:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	fireTile:setShaderVector( 0, 1, 1, 0, 0 )
	fireTile:setShaderVector( 1, 0.3, 0, 0, 0 )
	self:addElement( fireTile )
	self.fireTile = fireTile
	
	local fireTile0 = LUI.UIImage.new()
	fireTile0:setLeftRight( true, false, 147.33, 554.67 )
	fireTile0:setTopBottom( true, false, 17.26, 90 )
	fireTile0:setZRot( 15 )
	fireTile0:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_tilescroll" ) )
	fireTile0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	fireTile0:setShaderVector( 0, 1, 1, 0, 0 )
	fireTile0:setShaderVector( 1, 0.1, 0, 0, 0 )
	self:addElement( fireTile0 )
	self.fireTile0 = fireTile0
	
	local fireFlipbook = LUI.UIImage.new()
	fireFlipbook:setLeftRight( true, false, 0, 355 )
	fireFlipbook:setTopBottom( true, false, 0, 120 )
	fireFlipbook:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_flipbook" ) )
	fireFlipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	fireFlipbook:setShaderVector( 0, 0, 3, 0, 0 )
	fireFlipbook:setShaderVector( 1, 4, 0, 0, 0 )
	self:addElement( fireFlipbook )
	self.fireFlipbook = fireFlipbook
	
	local carseat = LUI.UIImage.new()
	carseat:setLeftRight( true, false, 99, 279 )
	carseat:setTopBottom( true, false, 66, 150 )
	carseat:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_seat" ) )
	self:addElement( carseat )
	self.carseat = carseat
	
	local carseatSheen = LUI.UIImage.new()
	carseatSheen:setLeftRight( true, false, 99, 279 )
	carseatSheen:setTopBottom( true, false, 66, 150 )
	carseatSheen:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_seat_sheen" ) )
	carseatSheen:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
	carseatSheen:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( carseatSheen )
	self.carseatSheen = carseatSheen
	
	local devil = LUI.UIImage.new()
	devil:setLeftRight( true, false, 176.67, 332.67 )
	devil:setTopBottom( true, false, -6, 194 )
	devil:setZRot( 8 )
	devil:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_devil" ) )
	self:addElement( devil )
	self.devil = devil
	
	local devilhand = CoD.CallingCards_loot_hotrod_hand.new( menu, controller )
	devilhand:setLeftRight( true, false, 313.33, 361.33 )
	devilhand:setTopBottom( true, false, -12, 96 )
	self:addElement( devilhand )
	self.devilhand = devilhand
	
	local carfront = LUI.UIImage.new()
	carfront:setLeftRight( true, false, 201, 501 )
	carfront:setTopBottom( true, false, 30, 150 )
	carfront:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_car" ) )
	self:addElement( carfront )
	self.carfront = carfront
	
	local carfrontsheen = LUI.UIImage.new()
	carfrontsheen:setLeftRight( true, false, 201, 501 )
	carfrontsheen:setTopBottom( true, false, 30, 150 )
	carfrontsheen:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_car_sheen" ) )
	carfrontsheen:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	carfrontsheen:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( carfrontsheen )
	self.carfrontsheen = carfrontsheen
	
	local blk = LUI.UIImage.new()
	blk:setLeftRight( true, false, -289, 0 )
	blk:setTopBottom( true, false, -155, 338 )
	blk:setRGB( 0.11, 0.11, 0.11 )
	self:addElement( blk )
	self.blk = blk
	
	local blk0 = LUI.UIImage.new()
	blk0:setLeftRight( true, false, 480, 769 )
	blk0:setTopBottom( true, false, -155, 338 )
	blk0:setRGB( 0.11, 0.11, 0.11 )
	self:addElement( blk0 )
	self.blk0 = blk0
	
	local blk1 = LUI.UIImage.new()
	blk1:setLeftRight( true, false, -39, 564 )
	blk1:setTopBottom( true, false, -155, 0 )
	blk1:setRGB( 0.11, 0.11, 0.11 )
	self:addElement( blk1 )
	self.blk1 = blk1
	
	local blk10 = LUI.UIImage.new()
	blk10:setLeftRight( true, false, -39, 564 )
	blk10:setTopBottom( true, false, 120, 338 )
	blk10:setRGB( 0.11, 0.11, 0.11 )
	self:addElement( blk10 )
	self.blk10 = blk10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				local smoke1Frame2 = function ( smoke1, event )
					local smoke1Frame3 = function ( smoke1, event )
						local smoke1Frame4 = function ( smoke1, event )
							local smoke1Frame5 = function ( smoke1, event )
								local smoke1Frame6 = function ( smoke1, event )
									if not event.interrupted then
										smoke1:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
									end
									smoke1:setLeftRight( true, false, -40.89, 172.44 )
									smoke1:setTopBottom( true, false, 0, 120 )
									smoke1:setAlpha( 0.5 )
									if event.interrupted then
										self.clipFinished( smoke1, event )
									else
										smoke1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									smoke1Frame6( smoke1, event )
									return 
								else
									smoke1:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
									smoke1:setLeftRight( true, false, 0, 172.44 )
									smoke1:setTopBottom( true, false, 23, 120 )
									smoke1:registerEventHandler( "transition_complete_keyframe", smoke1Frame6 )
								end
							end
							
							if event.interrupted then
								smoke1Frame5( smoke1, event )
								return 
							else
								smoke1:beginAnimation( "keyframe", 1809, false, false, CoD.TweenType.Linear )
								smoke1:setLeftRight( true, false, -29.98, 172.44 )
								smoke1:setTopBottom( true, false, 6.14, 120 )
								smoke1:registerEventHandler( "transition_complete_keyframe", smoke1Frame5 )
							end
						end
						
						if event.interrupted then
							smoke1Frame4( smoke1, event )
							return 
						else
							smoke1:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
							smoke1:setLeftRight( true, false, -87.11, 172.44 )
							smoke1:setTopBottom( true, false, -26, 120 )
							smoke1:setAlpha( 0 )
							smoke1:registerEventHandler( "transition_complete_keyframe", smoke1Frame4 )
						end
					end
					
					if event.interrupted then
						smoke1Frame3( smoke1, event )
						return 
					else
						smoke1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						smoke1:setLeftRight( true, false, -51.98, 172.44 )
						smoke1:setTopBottom( true, false, -6.24, 120 )
						smoke1:setAlpha( 0.76 )
						smoke1:registerEventHandler( "transition_complete_keyframe", smoke1Frame3 )
					end
				end
				
				smoke1:completeAnimation()
				self.smoke1:setLeftRight( true, false, -40.89, 172.44 )
				self.smoke1:setTopBottom( true, false, 0, 120 )
				self.smoke1:setAlpha( 0.5 )
				smoke1Frame2( smoke1, {} )
				local smoke4Frame2 = function ( smoke4, event )
					local smoke4Frame3 = function ( smoke4, event )
						local smoke4Frame4 = function ( smoke4, event )
							local smoke4Frame5 = function ( smoke4, event )
								local smoke4Frame6 = function ( smoke4, event )
									local smoke4Frame7 = function ( smoke4, event )
										local smoke4Frame8 = function ( smoke4, event )
											if not event.interrupted then
												smoke4:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
											end
											smoke4:setLeftRight( true, false, -35, 189 )
											smoke4:setTopBottom( true, false, 34, 160 )
											smoke4:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( smoke4, event )
											else
												smoke4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											smoke4Frame8( smoke4, event )
											return 
										else
											smoke4:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
											smoke4:setLeftRight( true, false, -18.73, 189 )
											smoke4:setTopBottom( true, false, 43.76, 160.61 )
											smoke4:setAlpha( 1 )
											smoke4:registerEventHandler( "transition_complete_keyframe", smoke4Frame8 )
										end
									end
									
									if event.interrupted then
										smoke4Frame7( smoke4, event )
										return 
									else
										smoke4:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
										smoke4:setLeftRight( true, false, 0, 189 )
										smoke4:setTopBottom( true, false, 55, 161.31 )
										smoke4:registerEventHandler( "transition_complete_keyframe", smoke4Frame7 )
									end
								end
								
								if event.interrupted then
									smoke4Frame6( smoke4, event )
									return 
								else
									smoke4:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									smoke4:setLeftRight( true, false, -25, 189 )
									smoke4:setTopBottom( true, false, 40, 160.37 )
									smoke4:registerEventHandler( "transition_complete_keyframe", smoke4Frame6 )
								end
							end
							
							if event.interrupted then
								smoke4Frame5( smoke4, event )
								return 
							else
								smoke4:beginAnimation( "keyframe", 729, false, false, CoD.TweenType.Linear )
								smoke4:setLeftRight( true, false, -35, 189 )
								smoke4:setTopBottom( true, false, 34, 160 )
								smoke4:setAlpha( 0 )
								smoke4:registerEventHandler( "transition_complete_keyframe", smoke4Frame5 )
							end
						end
						
						if event.interrupted then
							smoke4Frame4( smoke4, event )
							return 
						else
							smoke4:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
							smoke4:setLeftRight( true, false, -18.73, 189 )
							smoke4:setTopBottom( true, false, 43.76, 160.61 )
							smoke4:setAlpha( 1 )
							smoke4:registerEventHandler( "transition_complete_keyframe", smoke4Frame4 )
						end
					end
					
					if event.interrupted then
						smoke4Frame3( smoke4, event )
						return 
					else
						smoke4:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						smoke4:registerEventHandler( "transition_complete_keyframe", smoke4Frame3 )
					end
				end
				
				smoke4:completeAnimation()
				self.smoke4:setLeftRight( true, false, 0, 189 )
				self.smoke4:setTopBottom( true, false, 55, 161.31 )
				self.smoke4:setAlpha( 0 )
				smoke4Frame2( smoke4, {} )
				local smoke2Frame2 = function ( smoke2, event )
					local smoke2Frame3 = function ( smoke2, event )
						local smoke2Frame4 = function ( smoke2, event )
							local smoke2Frame5 = function ( smoke2, event )
								local smoke2Frame6 = function ( smoke2, event )
									local smoke2Frame7 = function ( smoke2, event )
										if not event.interrupted then
											smoke2:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
										end
										smoke2:setLeftRight( true, false, -7, 45 )
										smoke2:setTopBottom( true, false, 0, 52 )
										smoke2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( smoke2, event )
										else
											smoke2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										smoke2Frame7( smoke2, event )
										return 
									else
										smoke2:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
										smoke2:setLeftRight( true, false, 8.17, 60.17 )
										smoke2:setTopBottom( true, false, 10.11, 62.11 )
										smoke2:setAlpha( 1 )
										smoke2:registerEventHandler( "transition_complete_keyframe", smoke2Frame7 )
									end
								end
								
								if event.interrupted then
									smoke2Frame6( smoke2, event )
									return 
								else
									smoke2:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
									smoke2:setLeftRight( true, false, 14, 66 )
									smoke2:setTopBottom( true, false, 14, 66 )
									smoke2:registerEventHandler( "transition_complete_keyframe", smoke2Frame6 )
								end
							end
							
							if event.interrupted then
								smoke2Frame5( smoke2, event )
								return 
							else
								smoke2:beginAnimation( "keyframe", 909, false, false, CoD.TweenType.Linear )
								smoke2:setLeftRight( true, false, -7, 45 )
								smoke2:setTopBottom( true, false, 0, 52 )
								smoke2:setAlpha( 0 )
								smoke2:registerEventHandler( "transition_complete_keyframe", smoke2Frame5 )
							end
						end
						
						if event.interrupted then
							smoke2Frame4( smoke2, event )
							return 
						else
							smoke2:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							smoke2:setLeftRight( true, false, 8.17, 60.17 )
							smoke2:setTopBottom( true, false, 10.11, 62.11 )
							smoke2:registerEventHandler( "transition_complete_keyframe", smoke2Frame4 )
						end
					end
					
					if event.interrupted then
						smoke2Frame3( smoke2, event )
						return 
					else
						smoke2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						smoke2:setLeftRight( true, false, 11.67, 63.67 )
						smoke2:setTopBottom( true, false, 12.44, 64.44 )
						smoke2:setAlpha( 1 )
						smoke2:registerEventHandler( "transition_complete_keyframe", smoke2Frame3 )
					end
				end
				
				smoke2:completeAnimation()
				self.smoke2:setLeftRight( true, false, 14, 66 )
				self.smoke2:setTopBottom( true, false, 14, 66 )
				self.smoke2:setAlpha( 0 )
				smoke2Frame2( smoke2, {} )
				local smoke3Frame2 = function ( smoke3, event )
					local smoke3Frame3 = function ( smoke3, event )
						local smoke3Frame4 = function ( smoke3, event )
							local smoke3Frame5 = function ( smoke3, event )
								local smoke3Frame6 = function ( smoke3, event )
									local smoke3Frame7 = function ( smoke3, event )
										local smoke3Frame8 = function ( smoke3, event )
											local smoke3Frame9 = function ( smoke3, event )
												local smoke3Frame10 = function ( smoke3, event )
													local smoke3Frame11 = function ( smoke3, event )
														if not event.interrupted then
															smoke3:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
														end
														smoke3:setLeftRight( true, false, 19, 100.44 )
														smoke3:setTopBottom( true, false, 71, 152.44 )
														smoke3:setAlpha( 0 )
														smoke3:setZRot( 42 )
														if event.interrupted then
															self.clipFinished( smoke3, event )
														else
															smoke3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														smoke3Frame11( smoke3, event )
														return 
													else
														smoke3:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
														smoke3:setLeftRight( true, false, 42.19, 123.63 )
														smoke3:setTopBottom( true, false, 71.39, 152.83 )
														smoke3:setAlpha( 1 )
														smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame11 )
													end
												end
												
												if event.interrupted then
													smoke3Frame10( smoke3, event )
													return 
												else
													smoke3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													smoke3:setLeftRight( true, false, 63.96, 145.4 )
													smoke3:setTopBottom( true, false, 71.76, 153.2 )
													smoke3:setAlpha( 0.03 )
													smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame10 )
												end
											end
											
											if event.interrupted then
												smoke3Frame9( smoke3, event )
												return 
											else
												smoke3:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
												smoke3:setLeftRight( true, false, 29.96, 111.4 )
												smoke3:setTopBottom( true, false, 70.76, 152.2 )
												smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame9 )
											end
										end
										
										if event.interrupted then
											smoke3Frame8( smoke3, event )
											return 
										else
											smoke3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											smoke3:setLeftRight( true, false, 65, 133 )
											smoke3:setTopBottom( true, false, 77, 145 )
											smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame8 )
										end
									end
									
									if event.interrupted then
										smoke3Frame7( smoke3, event )
										return 
									else
										smoke3:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
										smoke3:setLeftRight( true, false, 19, 100.44 )
										smoke3:setTopBottom( true, false, 71, 152.44 )
										smoke3:setAlpha( 0 )
										smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame7 )
									end
								end
								
								if event.interrupted then
									smoke3Frame6( smoke3, event )
									return 
								else
									smoke3:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
									smoke3:setLeftRight( true, false, 42.19, 123.63 )
									smoke3:setTopBottom( true, false, 71.39, 152.83 )
									smoke3:setAlpha( 1 )
									smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame6 )
								end
							end
							
							if event.interrupted then
								smoke3Frame5( smoke3, event )
								return 
							else
								smoke3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								smoke3:setLeftRight( true, false, 63.96, 145.4 )
								smoke3:setTopBottom( true, false, 71.76, 153.2 )
								smoke3:setAlpha( 0.03 )
								smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame5 )
							end
						end
						
						if event.interrupted then
							smoke3Frame4( smoke3, event )
							return 
						else
							smoke3:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
							smoke3:setLeftRight( true, false, 29.96, 111.4 )
							smoke3:setTopBottom( true, false, 70.76, 152.2 )
							smoke3:setAlpha( 0 )
							smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame4 )
						end
					end
					
					if event.interrupted then
						smoke3Frame3( smoke3, event )
						return 
					else
						smoke3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						smoke3:setLeftRight( true, false, 58.55, 129.02 )
						smoke3:setTopBottom( true, false, 75.85, 146.33 )
						smoke3:setAlpha( 0.82 )
						smoke3:registerEventHandler( "transition_complete_keyframe", smoke3Frame3 )
					end
				end
				
				smoke3:completeAnimation()
				self.smoke3:setLeftRight( true, false, 65, 133 )
				self.smoke3:setTopBottom( true, false, 77, 145 )
				self.smoke3:setAlpha( 0 )
				self.smoke3:setZRot( 42 )
				smoke3Frame2( smoke3, {} )
				fireTile:completeAnimation()
				self.fireTile:setLeftRight( true, false, 123, 530.33 )
				self.fireTile:setTopBottom( true, false, 14, 86.74 )
				self.fireTile:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
				self.fireTile:setShaderVector( 0, 1, 1, 0, 0 )
				self.fireTile:setShaderVector( 1, 0.3, 0, 0, 0 )
				self.clipFinished( fireTile, {} )
				fireFlipbook:completeAnimation()
				self.fireFlipbook:setAlpha( 1 )
				self.clipFinished( fireFlipbook, {} )
				local carseatFrame2 = function ( carseat, event )
					local carseatFrame3 = function ( carseat, event )
						local carseatFrame4 = function ( carseat, event )
							local carseatFrame5 = function ( carseat, event )
								local carseatFrame6 = function ( carseat, event )
									local carseatFrame7 = function ( carseat, event )
										local carseatFrame8 = function ( carseat, event )
											local carseatFrame9 = function ( carseat, event )
												local carseatFrame10 = function ( carseat, event )
													local carseatFrame11 = function ( carseat, event )
														local carseatFrame12 = function ( carseat, event )
															local carseatFrame13 = function ( carseat, event )
																local carseatFrame14 = function ( carseat, event )
																	local carseatFrame15 = function ( carseat, event )
																		local carseatFrame16 = function ( carseat, event )
																			local carseatFrame17 = function ( carseat, event )
																				local carseatFrame18 = function ( carseat, event )
																					local carseatFrame19 = function ( carseat, event )
																						local carseatFrame20 = function ( carseat, event )
																							local carseatFrame21 = function ( carseat, event )
																								local carseatFrame22 = function ( carseat, event )
																									local carseatFrame23 = function ( carseat, event )
																										local carseatFrame24 = function ( carseat, event )
																											local carseatFrame25 = function ( carseat, event )
																												local carseatFrame26 = function ( carseat, event )
																													local carseatFrame27 = function ( carseat, event )
																														if not event.interrupted then
																															carseat:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														end
																														carseat:setLeftRight( true, false, 99, 279 )
																														carseat:setTopBottom( true, false, 66, 150 )
																														carseat:setAlpha( 1 )
																														if event.interrupted then
																															self.clipFinished( carseat, event )
																														else
																															carseat:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																														end
																													end
																													
																													if event.interrupted then
																														carseatFrame27( carseat, event )
																														return 
																													else
																														carseat:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																														carseat:setTopBottom( true, false, 60, 144 )
																														carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													carseatFrame26( carseat, event )
																													return 
																												else
																													carseat:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																													carseat:setTopBottom( true, false, 55.07, 139.07 )
																													carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												carseatFrame25( carseat, event )
																												return 
																											else
																												carseat:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																												carseat:setTopBottom( true, false, 60, 144 )
																												carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											carseatFrame24( carseat, event )
																											return 
																										else
																											carseat:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																											carseat:setTopBottom( true, false, 52, 136 )
																											carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										carseatFrame23( carseat, event )
																										return 
																									else
																										carseat:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																										carseat:setTopBottom( true, false, 56.86, 140.86 )
																										carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									carseatFrame22( carseat, event )
																									return 
																								else
																									carseat:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																									carseat:setTopBottom( true, false, 52, 136 )
																									carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								carseatFrame21( carseat, event )
																								return 
																							else
																								carseat:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																								carseat:setTopBottom( true, false, 65.25, 149.25 )
																								carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							carseatFrame20( carseat, event )
																							return 
																						else
																							carseat:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																							carseat:setTopBottom( true, false, 60.83, 144.83 )
																							carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						carseatFrame19( carseat, event )
																						return 
																					else
																						carseat:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																						carseat:setTopBottom( true, false, 69.1, 153.1 )
																						carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					carseatFrame18( carseat, event )
																					return 
																				else
																					carseat:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																					carseat:setTopBottom( true, false, 66, 150 )
																					carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				carseatFrame17( carseat, event )
																				return 
																			else
																				carseat:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																				carseat:setTopBottom( true, false, 70.76, 154.76 )
																				carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			carseatFrame16( carseat, event )
																			return 
																		else
																			carseat:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																			carseat:setTopBottom( true, false, 61.36, 145.36 )
																			carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		carseatFrame15( carseat, event )
																		return 
																	else
																		carseat:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
																		carseat:setTopBottom( true, false, 67.5, 151.5 )
																		carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame15 )
																	end
																end
																
																if event.interrupted then
																	carseatFrame14( carseat, event )
																	return 
																else
																	carseat:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																	carseat:setTopBottom( true, false, 74.23, 158.23 )
																	carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame14 )
																end
															end
															
															if event.interrupted then
																carseatFrame13( carseat, event )
																return 
															else
																carseat:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																carseat:setTopBottom( true, false, 67.5, 151.5 )
																carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame13 )
															end
														end
														
														if event.interrupted then
															carseatFrame12( carseat, event )
															return 
														else
															carseat:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
															carseat:setTopBottom( true, false, 81.37, 165.37 )
															carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame12 )
														end
													end
													
													if event.interrupted then
														carseatFrame11( carseat, event )
														return 
													else
														carseat:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
														carseat:setTopBottom( true, false, 54, 138 )
														carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame11 )
													end
												end
												
												if event.interrupted then
													carseatFrame10( carseat, event )
													return 
												else
													carseat:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
													carseat:setTopBottom( true, false, 56.74, 140.74 )
													carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame10 )
												end
											end
											
											if event.interrupted then
												carseatFrame9( carseat, event )
												return 
											else
												carseat:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												carseat:setTopBottom( true, false, 75.68, 159.68 )
												carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame9 )
											end
										end
										
										if event.interrupted then
											carseatFrame8( carseat, event )
											return 
										else
											carseat:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
											carseat:setTopBottom( true, false, 72, 156 )
											carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame8 )
										end
									end
									
									if event.interrupted then
										carseatFrame7( carseat, event )
										return 
									else
										carseat:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										carseat:setTopBottom( true, false, 57.22, 141.22 )
										carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame7 )
									end
								end
								
								if event.interrupted then
									carseatFrame6( carseat, event )
									return 
								else
									carseat:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									carseat:setTopBottom( true, false, 60, 144 )
									carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame6 )
								end
							end
							
							if event.interrupted then
								carseatFrame5( carseat, event )
								return 
							else
								carseat:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								carseat:setTopBottom( true, false, 54.6, 138.6 )
								carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame5 )
							end
						end
						
						if event.interrupted then
							carseatFrame4( carseat, event )
							return 
						else
							carseat:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							carseat:setTopBottom( true, false, 63.22, 147.22 )
							carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame4 )
						end
					end
					
					if event.interrupted then
						carseatFrame3( carseat, event )
						return 
					else
						carseat:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						carseat:setLeftRight( true, false, 99, 279 )
						carseat:setTopBottom( true, false, 60, 144 )
						carseat:registerEventHandler( "transition_complete_keyframe", carseatFrame3 )
					end
				end
				
				carseat:completeAnimation()
				self.carseat:setLeftRight( true, false, 99, 279 )
				self.carseat:setTopBottom( true, false, 66, 150 )
				self.carseat:setAlpha( 1 )
				carseatFrame2( carseat, {} )
				local carseatSheenFrame2 = function ( carseatSheen, event )
					local carseatSheenFrame3 = function ( carseatSheen, event )
						local carseatSheenFrame4 = function ( carseatSheen, event )
							local carseatSheenFrame5 = function ( carseatSheen, event )
								local carseatSheenFrame6 = function ( carseatSheen, event )
									local carseatSheenFrame7 = function ( carseatSheen, event )
										local carseatSheenFrame8 = function ( carseatSheen, event )
											local carseatSheenFrame9 = function ( carseatSheen, event )
												local carseatSheenFrame10 = function ( carseatSheen, event )
													local carseatSheenFrame11 = function ( carseatSheen, event )
														local carseatSheenFrame12 = function ( carseatSheen, event )
															local carseatSheenFrame13 = function ( carseatSheen, event )
																local carseatSheenFrame14 = function ( carseatSheen, event )
																	local carseatSheenFrame15 = function ( carseatSheen, event )
																		local carseatSheenFrame16 = function ( carseatSheen, event )
																			local carseatSheenFrame17 = function ( carseatSheen, event )
																				local carseatSheenFrame18 = function ( carseatSheen, event )
																					local carseatSheenFrame19 = function ( carseatSheen, event )
																						local carseatSheenFrame20 = function ( carseatSheen, event )
																							local carseatSheenFrame21 = function ( carseatSheen, event )
																								local carseatSheenFrame22 = function ( carseatSheen, event )
																									local carseatSheenFrame23 = function ( carseatSheen, event )
																										local carseatSheenFrame24 = function ( carseatSheen, event )
																											local carseatSheenFrame25 = function ( carseatSheen, event )
																												local carseatSheenFrame26 = function ( carseatSheen, event )
																													local carseatSheenFrame27 = function ( carseatSheen, event )
																														local carseatSheenFrame28 = function ( carseatSheen, event )
																															local carseatSheenFrame29 = function ( carseatSheen, event )
																																local carseatSheenFrame30 = function ( carseatSheen, event )
																																	local carseatSheenFrame31 = function ( carseatSheen, event )
																																		local carseatSheenFrame32 = function ( carseatSheen, event )
																																			local carseatSheenFrame33 = function ( carseatSheen, event )
																																				local carseatSheenFrame34 = function ( carseatSheen, event )
																																					if not event.interrupted then
																																						carseatSheen:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																					end
																																					carseatSheen:setLeftRight( true, false, 99, 279 )
																																					carseatSheen:setTopBottom( true, false, 66, 150 )
																																					carseatSheen:setAlpha( 0 )
																																					carseatSheen:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
																																					carseatSheen:setShaderVector( 0, 1, 0, 0, 0 )
																																					if event.interrupted then
																																						self.clipFinished( carseatSheen, event )
																																					else
																																						carseatSheen:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					carseatSheenFrame34( carseatSheen, event )
																																					return 
																																				else
																																					carseatSheen:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																																					carseatSheen:setTopBottom( true, false, 60, 144 )
																																					carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				carseatSheenFrame33( carseatSheen, event )
																																				return 
																																			else
																																				carseatSheen:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																																				carseatSheen:setTopBottom( true, false, 55.07, 139.07 )
																																				carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			carseatSheenFrame32( carseatSheen, event )
																																			return 
																																		else
																																			carseatSheen:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																			carseatSheen:setTopBottom( true, false, 60, 144 )
																																			carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		carseatSheenFrame31( carseatSheen, event )
																																		return 
																																	else
																																		carseatSheen:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																																		carseatSheen:setTopBottom( true, false, 52, 136 )
																																		carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	carseatSheenFrame30( carseatSheen, event )
																																	return 
																																else
																																	carseatSheen:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																																	carseatSheen:setTopBottom( true, false, 56.86, 140.86 )
																																	carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																carseatSheenFrame29( carseatSheen, event )
																																return 
																															else
																																carseatSheen:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																																carseatSheen:setTopBottom( true, false, 52, 136 )
																																carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															carseatSheenFrame28( carseatSheen, event )
																															return 
																														else
																															carseatSheen:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																															carseatSheen:setTopBottom( true, false, 65.25, 149.25 )
																															carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														carseatSheenFrame27( carseatSheen, event )
																														return 
																													else
																														carseatSheen:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																														carseatSheen:setTopBottom( true, false, 60.83, 144.83 )
																														carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													carseatSheenFrame26( carseatSheen, event )
																													return 
																												else
																													carseatSheen:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																													carseatSheen:setTopBottom( true, false, 69.1, 153.1 )
																													carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												carseatSheenFrame25( carseatSheen, event )
																												return 
																											else
																												carseatSheen:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												carseatSheen:setTopBottom( true, false, 66, 150 )
																												carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											carseatSheenFrame24( carseatSheen, event )
																											return 
																										else
																											carseatSheen:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																											carseatSheen:setTopBottom( true, false, 66.32, 150.32 )
																											carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										carseatSheenFrame23( carseatSheen, event )
																										return 
																									else
																										carseatSheen:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																										carseatSheen:setTopBottom( true, false, 70.76, 154.76 )
																										carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									carseatSheenFrame22( carseatSheen, event )
																									return 
																								else
																									carseatSheen:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									carseatSheen:setTopBottom( true, false, 67.24, 151.24 )
																									carseatSheen:setAlpha( 0 )
																									carseatSheen:setShaderVector( 0, 1, 0, 0, 0 )
																									carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								carseatSheenFrame21( carseatSheen, event )
																								return 
																							else
																								carseatSheen:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																								carseatSheen:setTopBottom( true, false, 61.36, 145.36 )
																								carseatSheen:setAlpha( 0.11 )
																								carseatSheen:setShaderVector( 0, 0.89, 0, 0, 0 )
																								carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							carseatSheenFrame20( carseatSheen, event )
																							return 
																						else
																							carseatSheen:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
																							carseatSheen:setTopBottom( true, false, 67.5, 151.5 )
																							carseatSheen:setAlpha( 0.31 )
																							carseatSheen:setShaderVector( 0, 0.69, 0, 0, 0 )
																							carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						carseatSheenFrame19( carseatSheen, event )
																						return 
																					else
																						carseatSheen:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																						carseatSheen:setTopBottom( true, false, 74.23, 158.23 )
																						carseatSheen:setAlpha( 0.91 )
																						carseatSheen:setShaderVector( 0, 0.09, 0, 0, 0 )
																						carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					carseatSheenFrame18( carseatSheen, event )
																					return 
																				else
																					carseatSheen:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																					carseatSheen:setTopBottom( true, false, 73.15, 157.15 )
																					carseatSheen:setAlpha( 1 )
																					carseatSheen:setShaderVector( 0, 0, 0, 0, 0 )
																					carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				carseatSheenFrame17( carseatSheen, event )
																				return 
																			else
																				carseatSheen:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																				carseatSheen:setTopBottom( true, false, 69.12, 153.12 )
																				carseatSheen:setShaderVector( 0, 0.09, 0, 0, 0 )
																				carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			carseatSheenFrame16( carseatSheen, event )
																			return 
																		else
																			carseatSheen:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																			carseatSheen:setTopBottom( true, false, 67.5, 151.5 )
																			carseatSheen:setShaderVector( 0, 0.13, 0, 0, 0 )
																			carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		carseatSheenFrame15( carseatSheen, event )
																		return 
																	else
																		carseatSheen:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
																		carseatSheen:setTopBottom( true, false, 81.37, 165.37 )
																		carseatSheen:setShaderVector( 0, 0.24, 0, 0, 0 )
																		carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame15 )
																	end
																end
																
																if event.interrupted then
																	carseatSheenFrame14( carseatSheen, event )
																	return 
																else
																	carseatSheen:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																	carseatSheen:setTopBottom( true, false, 54, 138 )
																	carseatSheen:setShaderVector( 0, 0.53, 0, 0, 0 )
																	carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame14 )
																end
															end
															
															if event.interrupted then
																carseatSheenFrame13( carseatSheen, event )
																return 
															else
																carseatSheen:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
																carseatSheen:setTopBottom( true, false, 56.74, 140.74 )
																carseatSheen:setShaderVector( 0, 0.7, 0, 0, 0 )
																carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame13 )
															end
														end
														
														if event.interrupted then
															carseatSheenFrame12( carseatSheen, event )
															return 
														else
															carseatSheen:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															carseatSheen:setTopBottom( true, false, 75.68, 159.68 )
															carseatSheen:setShaderVector( 0, 0.85, 0, 0, 0 )
															carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame12 )
														end
													end
													
													if event.interrupted then
														carseatSheenFrame11( carseatSheen, event )
														return 
													else
														carseatSheen:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														carseatSheen:setTopBottom( true, false, 72, 156 )
														carseatSheen:setShaderVector( 0, 0.88, 0, 0, 0 )
														carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame11 )
													end
												end
												
												if event.interrupted then
													carseatSheenFrame10( carseatSheen, event )
													return 
												else
													carseatSheen:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
													carseatSheen:setTopBottom( true, false, 70.36, 154.36 )
													carseatSheen:setShaderVector( 0, 0.9, 0, 0, 0 )
													carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame10 )
												end
											end
											
											if event.interrupted then
												carseatSheenFrame9( carseatSheen, event )
												return 
											else
												carseatSheen:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												carseatSheen:setTopBottom( true, false, 57.22, 141.22 )
												carseatSheen:setShaderVector( 0, 0.99, 0, 0, 0 )
												carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame9 )
											end
										end
										
										if event.interrupted then
											carseatSheenFrame8( carseatSheen, event )
											return 
										else
											carseatSheen:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
											carseatSheen:setTopBottom( true, false, 57.42, 141.42 )
											carseatSheen:setAlpha( 0 )
											carseatSheen:setShaderVector( 0, 1, 0, 0, 0 )
											carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame8 )
										end
									end
									
									if event.interrupted then
										carseatSheenFrame7( carseatSheen, event )
										return 
									else
										carseatSheen:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										carseatSheen:setTopBottom( true, false, 60, 144 )
										carseatSheen:setAlpha( 0.29 )
										carseatSheen:setShaderVector( 0, 0.71, 0, 0, 0 )
										carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame7 )
									end
								end
								
								if event.interrupted then
									carseatSheenFrame6( carseatSheen, event )
									return 
								else
									carseatSheen:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
									carseatSheen:setTopBottom( true, false, 54.6, 138.6 )
									carseatSheen:setAlpha( 0.49 )
									carseatSheen:setShaderVector( 0, 0.51, 0, 0, 0 )
									carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame6 )
								end
							end
							
							if event.interrupted then
								carseatSheenFrame5( carseatSheen, event )
								return 
							else
								carseatSheen:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								carseatSheen:setTopBottom( true, false, 63.22, 147.22 )
								carseatSheen:setAlpha( 0.78 )
								carseatSheen:setShaderVector( 0, 0.22, 0, 0, 0 )
								carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame5 )
							end
						end
						
						if event.interrupted then
							carseatSheenFrame4( carseatSheen, event )
							return 
						else
							carseatSheen:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							carseatSheen:setTopBottom( true, false, 60.29, 144.29 )
							carseatSheen:setAlpha( 1 )
							carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame4 )
						end
					end
					
					if event.interrupted then
						carseatSheenFrame3( carseatSheen, event )
						return 
					else
						carseatSheen:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						carseatSheen:setLeftRight( true, false, 99, 279 )
						carseatSheen:setTopBottom( true, false, 60, 144 )
						carseatSheen:setAlpha( 0.93 )
						carseatSheen:registerEventHandler( "transition_complete_keyframe", carseatSheenFrame3 )
					end
				end
				
				carseatSheen:completeAnimation()
				self.carseatSheen:setLeftRight( true, false, 99, 279 )
				self.carseatSheen:setTopBottom( true, false, 66, 150 )
				self.carseatSheen:setAlpha( 0 )
				self.carseatSheen:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
				self.carseatSheen:setShaderVector( 0, 0, 0, 0, 0 )
				carseatSheenFrame2( carseatSheen, {} )
				local devilFrame2 = function ( devil, event )
					local devilFrame3 = function ( devil, event )
						local devilFrame4 = function ( devil, event )
							local devilFrame5 = function ( devil, event )
								local devilFrame6 = function ( devil, event )
									local devilFrame7 = function ( devil, event )
										local devilFrame8 = function ( devil, event )
											local devilFrame9 = function ( devil, event )
												local devilFrame10 = function ( devil, event )
													local devilFrame11 = function ( devil, event )
														local devilFrame12 = function ( devil, event )
															local devilFrame13 = function ( devil, event )
																local devilFrame14 = function ( devil, event )
																	local devilFrame15 = function ( devil, event )
																		local devilFrame16 = function ( devil, event )
																			local devilFrame17 = function ( devil, event )
																				local devilFrame18 = function ( devil, event )
																					local devilFrame19 = function ( devil, event )
																						local devilFrame20 = function ( devil, event )
																							local devilFrame21 = function ( devil, event )
																								local devilFrame22 = function ( devil, event )
																									local devilFrame23 = function ( devil, event )
																										local devilFrame24 = function ( devil, event )
																											local devilFrame25 = function ( devil, event )
																												local devilFrame26 = function ( devil, event )
																													local devilFrame27 = function ( devil, event )
																														local devilFrame28 = function ( devil, event )
																															local devilFrame29 = function ( devil, event )
																																local devilFrame30 = function ( devil, event )
																																	local devilFrame31 = function ( devil, event )
																																		if not event.interrupted then
																																			devil:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																		end
																																		devil:setLeftRight( true, false, 176.67, 332.67 )
																																		devil:setTopBottom( true, false, -6, 186 )
																																		devil:setAlpha( 1 )
																																		if event.interrupted then
																																			self.clipFinished( devil, event )
																																		else
																																			devil:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		devilFrame31( devil, event )
																																		return 
																																	else
																																		devil:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																																		devil:setTopBottom( true, false, -1.36, 190.64 )
																																		devil:registerEventHandler( "transition_complete_keyframe", devilFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	devilFrame30( devil, event )
																																	return 
																																else
																																	devil:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																																	devil:setTopBottom( true, false, -6.29, 185.71 )
																																	devil:registerEventHandler( "transition_complete_keyframe", devilFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																devilFrame29( devil, event )
																																return 
																															else
																																devil:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																devil:setTopBottom( true, false, -1.36, 190.64 )
																																devil:registerEventHandler( "transition_complete_keyframe", devilFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															devilFrame28( devil, event )
																															return 
																														else
																															devil:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																															devil:setTopBottom( true, false, -9.36, 182.64 )
																															devil:registerEventHandler( "transition_complete_keyframe", devilFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														devilFrame27( devil, event )
																														return 
																													else
																														devil:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																														devil:setTopBottom( true, false, -4.5, 187.5 )
																														devil:registerEventHandler( "transition_complete_keyframe", devilFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													devilFrame26( devil, event )
																													return 
																												else
																													devil:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																													devil:setTopBottom( true, false, -9.36, 182.64 )
																													devil:registerEventHandler( "transition_complete_keyframe", devilFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												devilFrame25( devil, event )
																												return 
																											else
																												devil:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																												devil:setTopBottom( true, false, 3.89, 195.89 )
																												devil:registerEventHandler( "transition_complete_keyframe", devilFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											devilFrame24( devil, event )
																											return 
																										else
																											devil:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																											devil:setTopBottom( true, false, -0.54, 191.46 )
																											devil:registerEventHandler( "transition_complete_keyframe", devilFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										devilFrame23( devil, event )
																										return 
																									else
																										devil:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																										devil:setTopBottom( true, false, 7.74, 199.74 )
																										devil:registerEventHandler( "transition_complete_keyframe", devilFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									devilFrame22( devil, event )
																									return 
																								else
																									devil:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																									devil:setTopBottom( true, false, 4.64, 196.64 )
																									devil:registerEventHandler( "transition_complete_keyframe", devilFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								devilFrame21( devil, event )
																								return 
																							else
																								devil:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																								devil:setTopBottom( true, false, 9.4, 201.4 )
																								devil:registerEventHandler( "transition_complete_keyframe", devilFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							devilFrame20( devil, event )
																							return 
																						else
																							devil:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																							devil:setTopBottom( true, false, 0, 192 )
																							devil:registerEventHandler( "transition_complete_keyframe", devilFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						devilFrame19( devil, event )
																						return 
																					else
																						devil:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
																						devil:setTopBottom( true, false, 6.14, 198.14 )
																						devil:registerEventHandler( "transition_complete_keyframe", devilFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					devilFrame18( devil, event )
																					return 
																				else
																					devil:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
																					devil:setTopBottom( true, false, 17.26, 208.26 )
																					devil:registerEventHandler( "transition_complete_keyframe", devilFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				devilFrame17( devil, event )
																				return 
																			else
																				devil:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																				devil:setTopBottom( true, false, 9.4, 201.41 )
																				devil:registerEventHandler( "transition_complete_keyframe", devilFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			devilFrame16( devil, event )
																			return 
																		else
																			devil:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																			devil:setTopBottom( true, false, 3.9, 196.39 )
																			devil:registerEventHandler( "transition_complete_keyframe", devilFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		devilFrame15( devil, event )
																		return 
																	else
																		devil:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
																		devil:setLeftRight( true, false, 177.5, 333.5 )
																		devil:setTopBottom( true, false, 14.58, 207.58 )
																		devil:registerEventHandler( "transition_complete_keyframe", devilFrame15 )
																	end
																end
																
																if event.interrupted then
																	devilFrame14( devil, event )
																	return 
																else
																	devil:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
																	devil:setTopBottom( true, false, -52, 147 )
																	devil:registerEventHandler( "transition_complete_keyframe", devilFrame14 )
																end
															end
															
															if event.interrupted then
																devilFrame13( devil, event )
																return 
															else
																devil:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
																devil:setTopBottom( true, false, -60, 140 )
																devil:registerEventHandler( "transition_complete_keyframe", devilFrame13 )
															end
														end
														
														if event.interrupted then
															devilFrame12( devil, event )
															return 
														else
															devil:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
															devil:setTopBottom( true, false, -52, 149 )
															devil:registerEventHandler( "transition_complete_keyframe", devilFrame12 )
														end
													end
													
													if event.interrupted then
														devilFrame11( devil, event )
														return 
													else
														devil:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
														devil:setTopBottom( true, false, -28.62, 172.02 )
														devil:registerEventHandler( "transition_complete_keyframe", devilFrame11 )
													end
												end
												
												if event.interrupted then
													devilFrame10( devil, event )
													return 
												else
													devil:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
													devil:setTopBottom( true, false, -15.26, 185.74 )
													devil:registerEventHandler( "transition_complete_keyframe", devilFrame10 )
												end
											end
											
											if event.interrupted then
												devilFrame9( devil, event )
												return 
											else
												devil:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												devil:setTopBottom( true, false, 3.68, 203.68 )
												devil:registerEventHandler( "transition_complete_keyframe", devilFrame9 )
											end
										end
										
										if event.interrupted then
											devilFrame8( devil, event )
											return 
										else
											devil:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
											devil:setTopBottom( true, false, 0, 201 )
											devil:registerEventHandler( "transition_complete_keyframe", devilFrame8 )
										end
									end
									
									if event.interrupted then
										devilFrame7( devil, event )
										return 
									else
										devil:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										devil:setTopBottom( true, false, -14.78, 184.22 )
										devil:registerEventHandler( "transition_complete_keyframe", devilFrame7 )
									end
								end
								
								if event.interrupted then
									devilFrame6( devil, event )
									return 
								else
									devil:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									devil:setTopBottom( true, false, -12, 186 )
									devil:registerEventHandler( "transition_complete_keyframe", devilFrame6 )
								end
							end
							
							if event.interrupted then
								devilFrame5( devil, event )
								return 
							else
								devil:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								devil:setTopBottom( true, false, -17.4, 181.6 )
								devil:registerEventHandler( "transition_complete_keyframe", devilFrame5 )
							end
						end
						
						if event.interrupted then
							devilFrame4( devil, event )
							return 
						else
							devil:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							devil:setTopBottom( true, false, -8.78, 187.22 )
							devil:registerEventHandler( "transition_complete_keyframe", devilFrame4 )
						end
					end
					
					if event.interrupted then
						devilFrame3( devil, event )
						return 
					else
						devil:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						devil:setTopBottom( true, false, -12, 186 )
						devil:registerEventHandler( "transition_complete_keyframe", devilFrame3 )
					end
				end
				
				devil:completeAnimation()
				self.devil:setLeftRight( true, false, 176.67, 332.67 )
				self.devil:setTopBottom( true, false, -6, 186 )
				self.devil:setAlpha( 1 )
				devilFrame2( devil, {} )
				local devilhandFrame2 = function ( devilhand, event )
					local devilhandFrame3 = function ( devilhand, event )
						local devilhandFrame4 = function ( devilhand, event )
							local devilhandFrame5 = function ( devilhand, event )
								local devilhandFrame6 = function ( devilhand, event )
									local devilhandFrame7 = function ( devilhand, event )
										local devilhandFrame8 = function ( devilhand, event )
											local devilhandFrame9 = function ( devilhand, event )
												local devilhandFrame10 = function ( devilhand, event )
													local devilhandFrame11 = function ( devilhand, event )
														local devilhandFrame12 = function ( devilhand, event )
															local devilhandFrame13 = function ( devilhand, event )
																local devilhandFrame14 = function ( devilhand, event )
																	local devilhandFrame15 = function ( devilhand, event )
																		local devilhandFrame16 = function ( devilhand, event )
																			local devilhandFrame17 = function ( devilhand, event )
																				local devilhandFrame18 = function ( devilhand, event )
																					local devilhandFrame19 = function ( devilhand, event )
																						local devilhandFrame20 = function ( devilhand, event )
																							local devilhandFrame21 = function ( devilhand, event )
																								local devilhandFrame22 = function ( devilhand, event )
																									local devilhandFrame23 = function ( devilhand, event )
																										local devilhandFrame24 = function ( devilhand, event )
																											local devilhandFrame25 = function ( devilhand, event )
																												local devilhandFrame26 = function ( devilhand, event )
																													local devilhandFrame27 = function ( devilhand, event )
																														local devilhandFrame28 = function ( devilhand, event )
																															if not event.interrupted then
																																devilhand:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																															end
																															devilhand:setLeftRight( true, false, 314.33, 362.33 )
																															devilhand:setTopBottom( true, false, -15.78, 92.22 )
																															devilhand:setAlpha( 1 )
																															if event.interrupted then
																																self.clipFinished( devilhand, event )
																															else
																																devilhand:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																															end
																														end
																														
																														if event.interrupted then
																															devilhandFrame28( devilhand, event )
																															return 
																														else
																															devilhand:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																															devilhand:setTopBottom( true, false, -11.78, 96.22 )
																															devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														devilhandFrame27( devilhand, event )
																														return 
																													else
																														devilhand:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																														devilhand:setTopBottom( true, false, -16.78, 91.22 )
																														devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													devilhandFrame26( devilhand, event )
																													return 
																												else
																													devilhand:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																													devilhand:setTopBottom( true, false, -11.78, 96.22 )
																													devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												devilhandFrame25( devilhand, event )
																												return 
																											else
																												devilhand:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																												devilhand:setTopBottom( true, false, -19.78, 88.22 )
																												devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											devilhandFrame24( devilhand, event )
																											return 
																										else
																											devilhand:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																											devilhand:setTopBottom( true, false, -14.78, 93.22 )
																											devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										devilhandFrame23( devilhand, event )
																										return 
																									else
																										devilhand:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																										devilhand:setTopBottom( true, false, -19.78, 88.22 )
																										devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									devilhandFrame22( devilhand, event )
																									return 
																								else
																									devilhand:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																									devilhand:setTopBottom( true, false, -6.78, 101.22 )
																									devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								devilhandFrame21( devilhand, event )
																								return 
																							else
																								devilhand:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																								devilhand:setTopBottom( true, false, -10.78, 97.22 )
																								devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							devilhandFrame20( devilhand, event )
																							return 
																						else
																							devilhand:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																							devilhand:setTopBottom( true, false, -2.78, 105.22 )
																							devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						devilhandFrame19( devilhand, event )
																						return 
																					else
																						devilhand:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																						devilhand:setTopBottom( true, false, -5.78, 102.22 )
																						devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					devilhandFrame18( devilhand, event )
																					return 
																				else
																					devilhand:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																					devilhand:setTopBottom( true, false, -0.78, 107.22 )
																					devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				devilhandFrame17( devilhand, event )
																				return 
																			else
																				devilhand:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																				devilhand:setTopBottom( true, false, -9.78, 98.22 )
																				devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			devilhandFrame16( devilhand, event )
																			return 
																		else
																			devilhand:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
																			devilhand:setTopBottom( true, false, -3.78, 104.22 )
																			devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		devilhandFrame15( devilhand, event )
																		return 
																	else
																		devilhand:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																		devilhand:setTopBottom( true, false, 6.22, 114.22 )
																		devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame15 )
																	end
																end
																
																if event.interrupted then
																	devilhandFrame14( devilhand, event )
																	return 
																else
																	devilhand:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																	devilhand:setTopBottom( true, false, -5.78, 102.22 )
																	devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame14 )
																end
															end
															
															if event.interrupted then
																devilhandFrame13( devilhand, event )
																return 
															else
																devilhand:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
																devilhand:setTopBottom( true, false, 5.22, 113.22 )
																devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame13 )
															end
														end
														
														if event.interrupted then
															devilhandFrame12( devilhand, event )
															return 
														else
															devilhand:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
															devilhand:setTopBottom( true, false, -58.78, 49.22 )
															devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame12 )
														end
													end
													
													if event.interrupted then
														devilhandFrame11( devilhand, event )
														return 
													else
														devilhand:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
														devilhand:setTopBottom( true, false, -66.78, 41.22 )
														devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame11 )
													end
												end
												
												if event.interrupted then
													devilhandFrame10( devilhand, event )
													return 
												else
													devilhand:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
													devilhand:setTopBottom( true, false, -57.78, 50.22 )
													devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame10 )
												end
											end
											
											if event.interrupted then
												devilhandFrame9( devilhand, event )
												return 
											else
												devilhand:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
												devilhand:setTopBottom( true, false, -20.98, 87.02 )
												devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame9 )
											end
										end
										
										if event.interrupted then
											devilhandFrame8( devilhand, event )
											return 
										else
											devilhand:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
											devilhand:setTopBottom( true, false, -1.78, 106.22 )
											devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame8 )
										end
									end
									
									if event.interrupted then
										devilhandFrame7( devilhand, event )
										return 
									else
										devilhand:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										devilhand:setTopBottom( true, false, -20.78, 87.22 )
										devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame7 )
									end
								end
								
								if event.interrupted then
									devilhandFrame6( devilhand, event )
									return 
								else
									devilhand:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									devilhand:setTopBottom( true, false, -18.78, 89.22 )
									devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame6 )
								end
							end
							
							if event.interrupted then
								devilhandFrame5( devilhand, event )
								return 
							else
								devilhand:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								devilhand:setTopBottom( true, false, -23.78, 84.22 )
								devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame5 )
							end
						end
						
						if event.interrupted then
							devilhandFrame4( devilhand, event )
							return 
						else
							devilhand:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							devilhand:setTopBottom( true, false, -16.78, 91.22 )
							devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame4 )
						end
					end
					
					if event.interrupted then
						devilhandFrame3( devilhand, event )
						return 
					else
						devilhand:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						devilhand:setTopBottom( true, false, -19.5, 88.5 )
						devilhand:registerEventHandler( "transition_complete_keyframe", devilhandFrame3 )
					end
				end
				
				devilhand:completeAnimation()
				self.devilhand:setLeftRight( true, false, 314.33, 362.33 )
				self.devilhand:setTopBottom( true, false, -16.5, 91.5 )
				self.devilhand:setAlpha( 1 )
				devilhandFrame2( devilhand, {} )
				local carfrontFrame2 = function ( carfront, event )
					local carfrontFrame3 = function ( carfront, event )
						local carfrontFrame4 = function ( carfront, event )
							local carfrontFrame5 = function ( carfront, event )
								local carfrontFrame6 = function ( carfront, event )
									local carfrontFrame7 = function ( carfront, event )
										local carfrontFrame8 = function ( carfront, event )
											local carfrontFrame9 = function ( carfront, event )
												local carfrontFrame10 = function ( carfront, event )
													local carfrontFrame11 = function ( carfront, event )
														local carfrontFrame12 = function ( carfront, event )
															local carfrontFrame13 = function ( carfront, event )
																local carfrontFrame14 = function ( carfront, event )
																	local carfrontFrame15 = function ( carfront, event )
																		local carfrontFrame16 = function ( carfront, event )
																			local carfrontFrame17 = function ( carfront, event )
																				local carfrontFrame18 = function ( carfront, event )
																					local carfrontFrame19 = function ( carfront, event )
																						local carfrontFrame20 = function ( carfront, event )
																							local carfrontFrame21 = function ( carfront, event )
																								local carfrontFrame22 = function ( carfront, event )
																									local carfrontFrame23 = function ( carfront, event )
																										local carfrontFrame24 = function ( carfront, event )
																											local carfrontFrame25 = function ( carfront, event )
																												local carfrontFrame26 = function ( carfront, event )
																													local carfrontFrame27 = function ( carfront, event )
																														if not event.interrupted then
																															carfront:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														end
																														carfront:setLeftRight( true, false, 201, 501 )
																														carfront:setTopBottom( true, false, 30, 150 )
																														carfront:setAlpha( 1 )
																														if event.interrupted then
																															self.clipFinished( carfront, event )
																														else
																															carfront:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																														end
																													end
																													
																													if event.interrupted then
																														carfrontFrame27( carfront, event )
																														return 
																													else
																														carfront:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																														carfront:setTopBottom( true, false, 24, 144 )
																														carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													carfrontFrame26( carfront, event )
																													return 
																												else
																													carfront:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																													carfront:setTopBottom( true, false, 19.07, 139.07 )
																													carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												carfrontFrame25( carfront, event )
																												return 
																											else
																												carfront:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																												carfront:setTopBottom( true, false, 24, 144 )
																												carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											carfrontFrame24( carfront, event )
																											return 
																										else
																											carfront:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																											carfront:setTopBottom( true, false, 16, 136 )
																											carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										carfrontFrame23( carfront, event )
																										return 
																									else
																										carfront:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																										carfront:setTopBottom( true, false, 20.86, 140.86 )
																										carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									carfrontFrame22( carfront, event )
																									return 
																								else
																									carfront:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																									carfront:setTopBottom( true, false, 16, 136 )
																									carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								carfrontFrame21( carfront, event )
																								return 
																							else
																								carfront:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																								carfront:setTopBottom( true, false, 29.25, 149.25 )
																								carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							carfrontFrame20( carfront, event )
																							return 
																						else
																							carfront:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																							carfront:setTopBottom( true, false, 24.83, 144.83 )
																							carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						carfrontFrame19( carfront, event )
																						return 
																					else
																						carfront:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																						carfront:setTopBottom( true, false, 33.1, 153.1 )
																						carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					carfrontFrame18( carfront, event )
																					return 
																				else
																					carfront:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																					carfront:setTopBottom( true, false, 30, 150 )
																					carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				carfrontFrame17( carfront, event )
																				return 
																			else
																				carfront:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																				carfront:setTopBottom( true, false, 34.76, 154.76 )
																				carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			carfrontFrame16( carfront, event )
																			return 
																		else
																			carfront:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																			carfront:setTopBottom( true, false, 25.36, 145.36 )
																			carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		carfrontFrame15( carfront, event )
																		return 
																	else
																		carfront:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
																		carfront:setTopBottom( true, false, 31.5, 151.5 )
																		carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame15 )
																	end
																end
																
																if event.interrupted then
																	carfrontFrame14( carfront, event )
																	return 
																else
																	carfront:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																	carfront:setTopBottom( true, false, 38.23, 158.23 )
																	carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame14 )
																end
															end
															
															if event.interrupted then
																carfrontFrame13( carfront, event )
																return 
															else
																carfront:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																carfront:setTopBottom( true, false, 31.5, 151.5 )
																carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame13 )
															end
														end
														
														if event.interrupted then
															carfrontFrame12( carfront, event )
															return 
														else
															carfront:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
															carfront:setTopBottom( true, false, 45.37, 165.37 )
															carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame12 )
														end
													end
													
													if event.interrupted then
														carfrontFrame11( carfront, event )
														return 
													else
														carfront:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
														carfront:setTopBottom( true, false, 18, 138 )
														carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame11 )
													end
												end
												
												if event.interrupted then
													carfrontFrame10( carfront, event )
													return 
												else
													carfront:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
													carfront:setTopBottom( true, false, 20.74, 140.74 )
													carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame10 )
												end
											end
											
											if event.interrupted then
												carfrontFrame9( carfront, event )
												return 
											else
												carfront:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												carfront:setTopBottom( true, false, 39.68, 159.68 )
												carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame9 )
											end
										end
										
										if event.interrupted then
											carfrontFrame8( carfront, event )
											return 
										else
											carfront:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
											carfront:setTopBottom( true, false, 36, 156 )
											carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame8 )
										end
									end
									
									if event.interrupted then
										carfrontFrame7( carfront, event )
										return 
									else
										carfront:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										carfront:setTopBottom( true, false, 21.22, 141.22 )
										carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame7 )
									end
								end
								
								if event.interrupted then
									carfrontFrame6( carfront, event )
									return 
								else
									carfront:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									carfront:setTopBottom( true, false, 24, 144 )
									carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame6 )
								end
							end
							
							if event.interrupted then
								carfrontFrame5( carfront, event )
								return 
							else
								carfront:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								carfront:setTopBottom( true, false, 18.6, 138.6 )
								carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame5 )
							end
						end
						
						if event.interrupted then
							carfrontFrame4( carfront, event )
							return 
						else
							carfront:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							carfront:setTopBottom( true, false, 27.22, 147.22 )
							carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame4 )
						end
					end
					
					if event.interrupted then
						carfrontFrame3( carfront, event )
						return 
					else
						carfront:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						carfront:setTopBottom( true, false, 24, 144 )
						carfront:registerEventHandler( "transition_complete_keyframe", carfrontFrame3 )
					end
				end
				
				carfront:completeAnimation()
				self.carfront:setLeftRight( true, false, 201, 501 )
				self.carfront:setTopBottom( true, false, 30, 150 )
				self.carfront:setAlpha( 1 )
				carfrontFrame2( carfront, {} )
				local carfrontsheenFrame2 = function ( carfrontsheen, event )
					local carfrontsheenFrame3 = function ( carfrontsheen, event )
						local carfrontsheenFrame4 = function ( carfrontsheen, event )
							local carfrontsheenFrame5 = function ( carfrontsheen, event )
								local carfrontsheenFrame6 = function ( carfrontsheen, event )
									local carfrontsheenFrame7 = function ( carfrontsheen, event )
										local carfrontsheenFrame8 = function ( carfrontsheen, event )
											local carfrontsheenFrame9 = function ( carfrontsheen, event )
												local carfrontsheenFrame10 = function ( carfrontsheen, event )
													local carfrontsheenFrame11 = function ( carfrontsheen, event )
														local carfrontsheenFrame12 = function ( carfrontsheen, event )
															local carfrontsheenFrame13 = function ( carfrontsheen, event )
																local carfrontsheenFrame14 = function ( carfrontsheen, event )
																	local carfrontsheenFrame15 = function ( carfrontsheen, event )
																		local carfrontsheenFrame16 = function ( carfrontsheen, event )
																			local carfrontsheenFrame17 = function ( carfrontsheen, event )
																				local carfrontsheenFrame18 = function ( carfrontsheen, event )
																					local carfrontsheenFrame19 = function ( carfrontsheen, event )
																						local carfrontsheenFrame20 = function ( carfrontsheen, event )
																							local carfrontsheenFrame21 = function ( carfrontsheen, event )
																								local carfrontsheenFrame22 = function ( carfrontsheen, event )
																									local carfrontsheenFrame23 = function ( carfrontsheen, event )
																										local carfrontsheenFrame24 = function ( carfrontsheen, event )
																											local carfrontsheenFrame25 = function ( carfrontsheen, event )
																												local carfrontsheenFrame26 = function ( carfrontsheen, event )
																													local carfrontsheenFrame27 = function ( carfrontsheen, event )
																														local carfrontsheenFrame28 = function ( carfrontsheen, event )
																															local carfrontsheenFrame29 = function ( carfrontsheen, event )
																																local carfrontsheenFrame30 = function ( carfrontsheen, event )
																																	local carfrontsheenFrame31 = function ( carfrontsheen, event )
																																		local carfrontsheenFrame32 = function ( carfrontsheen, event )
																																			local carfrontsheenFrame33 = function ( carfrontsheen, event )
																																				if not event.interrupted then
																																					carfrontsheen:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																				end
																																				carfrontsheen:setLeftRight( true, false, 201, 501 )
																																				carfrontsheen:setTopBottom( true, false, 30, 150 )
																																				carfrontsheen:setAlpha( 0 )
																																				carfrontsheen:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
																																				carfrontsheen:setShaderVector( 0, 1, 0, 0, 0 )
																																				if event.interrupted then
																																					self.clipFinished( carfrontsheen, event )
																																				else
																																					carfrontsheen:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				carfrontsheenFrame33( carfrontsheen, event )
																																				return 
																																			else
																																				carfrontsheen:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																																				carfrontsheen:setTopBottom( true, false, 24, 144 )
																																				carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			carfrontsheenFrame32( carfrontsheen, event )
																																			return 
																																		else
																																			carfrontsheen:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																																			carfrontsheen:setTopBottom( true, false, 19.07, 139.07 )
																																			carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		carfrontsheenFrame31( carfrontsheen, event )
																																		return 
																																	else
																																		carfrontsheen:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																																		carfrontsheen:setTopBottom( true, false, 24, 144 )
																																		carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	carfrontsheenFrame30( carfrontsheen, event )
																																	return 
																																else
																																	carfrontsheen:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																																	carfrontsheen:setTopBottom( true, false, 16, 136 )
																																	carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																carfrontsheenFrame29( carfrontsheen, event )
																																return 
																															else
																																carfrontsheen:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																																carfrontsheen:setTopBottom( true, false, 20.86, 140.86 )
																																carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															carfrontsheenFrame28( carfrontsheen, event )
																															return 
																														else
																															carfrontsheen:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																															carfrontsheen:setTopBottom( true, false, 16, 136 )
																															carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														carfrontsheenFrame27( carfrontsheen, event )
																														return 
																													else
																														carfrontsheen:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																														carfrontsheen:setTopBottom( true, false, 29.25, 149.25 )
																														carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													carfrontsheenFrame26( carfrontsheen, event )
																													return 
																												else
																													carfrontsheen:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																													carfrontsheen:setTopBottom( true, false, 24.83, 144.83 )
																													carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												carfrontsheenFrame25( carfrontsheen, event )
																												return 
																											else
																												carfrontsheen:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																												carfrontsheen:setTopBottom( true, false, 33.1, 153.1 )
																												carfrontsheen:setAlpha( 0 )
																												carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											carfrontsheenFrame24( carfrontsheen, event )
																											return 
																										else
																											carfrontsheen:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																											carfrontsheen:setTopBottom( true, false, 30, 150 )
																											carfrontsheen:setAlpha( 0.8 )
																											carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										carfrontsheenFrame23( carfrontsheen, event )
																										return 
																									else
																										carfrontsheen:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																										carfrontsheen:setTopBottom( true, false, 30.95, 150.95 )
																										carfrontsheen:setAlpha( 1 )
																										carfrontsheen:setShaderVector( 0, 1, 0, 0, 0 )
																										carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									carfrontsheenFrame22( carfrontsheen, event )
																									return 
																								else
																									carfrontsheen:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																									carfrontsheen:setTopBottom( true, false, 34.76, 154.76 )
																									carfrontsheen:setAlpha( 0.73 )
																									carfrontsheen:setShaderVector( 0, 0.73, 0, 0, 0 )
																									carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								carfrontsheenFrame21( carfrontsheen, event )
																								return 
																							else
																								carfrontsheen:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																								carfrontsheen:setTopBottom( true, false, 25.36, 145.36 )
																								carfrontsheen:setAlpha( 0.55 )
																								carfrontsheen:setShaderVector( 0, 0.55, 0, 0, 0 )
																								carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							carfrontsheenFrame20( carfrontsheen, event )
																							return 
																						else
																							carfrontsheen:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
																							carfrontsheen:setTopBottom( true, false, 31.5, 151.5 )
																							carfrontsheen:setAlpha( 0.34 )
																							carfrontsheen:setShaderVector( 0, 0.34, 0, 0, 0 )
																							carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						carfrontsheenFrame19( carfrontsheen, event )
																						return 
																					else
																						carfrontsheen:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																						carfrontsheen:setTopBottom( true, false, 35.24, 155.24 )
																						carfrontsheen:setShaderVector( 0, 0, 0, 0, 0 )
																						carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					carfrontsheenFrame18( carfrontsheen, event )
																					return 
																				else
																					carfrontsheen:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
																					carfrontsheen:setTopBottom( true, false, 38.23, 158.23 )
																					carfrontsheen:setShaderVector( 0, 0.07, 0, 0, 0 )
																					carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				carfrontsheenFrame17( carfrontsheen, event )
																				return 
																			else
																				carfrontsheen:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																				carfrontsheen:setTopBottom( true, false, 33.12, 153.12 )
																				carfrontsheen:setShaderVector( 0, 0.19, 0, 0, 0 )
																				carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			carfrontsheenFrame16( carfrontsheen, event )
																			return 
																		else
																			carfrontsheen:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
																			carfrontsheen:setTopBottom( true, false, 31.5, 151.5 )
																			carfrontsheen:setShaderVector( 0, 0.22, 0, 0, 0 )
																			carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		carfrontsheenFrame15( carfrontsheen, event )
																		return 
																	else
																		carfrontsheen:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
																		carfrontsheen:setTopBottom( true, false, 45.37, 165.37 )
																		carfrontsheen:setShaderVector( 0, 0.34, 0, 0, 0 )
																		carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame15 )
																	end
																end
																
																if event.interrupted then
																	carfrontsheenFrame14( carfrontsheen, event )
																	return 
																else
																	carfrontsheen:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																	carfrontsheen:setTopBottom( true, false, 18, 138 )
																	carfrontsheen:setShaderVector( 0, 0.62, 0, 0, 0 )
																	carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame14 )
																end
															end
															
															if event.interrupted then
																carfrontsheenFrame13( carfrontsheen, event )
																return 
															else
																carfrontsheen:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
																carfrontsheen:setTopBottom( true, false, 20.74, 140.74 )
																carfrontsheen:setShaderVector( 0, 0.79, 0, 0, 0 )
																carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame13 )
															end
														end
														
														if event.interrupted then
															carfrontsheenFrame12( carfrontsheen, event )
															return 
														else
															carfrontsheen:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															carfrontsheen:setTopBottom( true, false, 35.31, 155.31 )
															carfrontsheen:setAlpha( 0 )
															carfrontsheen:setShaderVector( 0, 0.91, 0, 0, 0 )
															carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame12 )
														end
													end
													
													if event.interrupted then
														carfrontsheenFrame11( carfrontsheen, event )
														return 
													else
														carfrontsheen:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														carfrontsheen:setTopBottom( true, false, 39.68, 159.68 )
														carfrontsheen:setAlpha( 0.4 )
														carfrontsheen:setShaderVector( 0, 0.95, 0, 0, 0 )
														carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame11 )
													end
												end
												
												if event.interrupted then
													carfrontsheenFrame10( carfrontsheen, event )
													return 
												else
													carfrontsheen:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													carfrontsheen:setTopBottom( true, false, 36, 156 )
													carfrontsheen:setAlpha( 0.73 )
													carfrontsheen:setShaderVector( 0, 0.98, 0, 0, 0 )
													carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame10 )
												end
											end
											
											if event.interrupted then
												carfrontsheenFrame9( carfrontsheen, event )
												return 
											else
												carfrontsheen:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												carfrontsheen:setTopBottom( true, false, 32.72, 152.72 )
												carfrontsheen:setAlpha( 1 )
												carfrontsheen:setShaderVector( 0, 1, 0, 0, 0 )
												carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame9 )
											end
										end
										
										if event.interrupted then
											carfrontsheenFrame8( carfrontsheen, event )
											return 
										else
											carfrontsheen:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
											carfrontsheen:setTopBottom( true, false, 21.22, 141.22 )
											carfrontsheen:setAlpha( 0.68 )
											carfrontsheen:setShaderVector( 0, 0.68, 0, 0, 0 )
											carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame8 )
										end
									end
									
									if event.interrupted then
										carfrontsheenFrame7( carfrontsheen, event )
										return 
									else
										carfrontsheen:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										carfrontsheen:setTopBottom( true, false, 24, 144 )
										carfrontsheen:setAlpha( 0.36 )
										carfrontsheen:setShaderVector( 0, 0.36, 0, 0, 0 )
										carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame7 )
									end
								end
								
								if event.interrupted then
									carfrontsheenFrame6( carfrontsheen, event )
									return 
								else
									carfrontsheen:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									carfrontsheen:setTopBottom( true, false, 18.6, 138.6 )
									carfrontsheen:setAlpha( 0.16 )
									carfrontsheen:setShaderVector( 0, 0.16, 0, 0, 0 )
									carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame6 )
								end
							end
							
							if event.interrupted then
								carfrontsheenFrame5( carfrontsheen, event )
								return 
							else
								carfrontsheen:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								carfrontsheen:setTopBottom( true, false, 23.24, 143.24 )
								carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame5 )
							end
						end
						
						if event.interrupted then
							carfrontsheenFrame4( carfrontsheen, event )
							return 
						else
							carfrontsheen:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							carfrontsheen:setTopBottom( true, false, 27.22, 147.22 )
							carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame4 )
						end
					end
					
					if event.interrupted then
						carfrontsheenFrame3( carfrontsheen, event )
						return 
					else
						carfrontsheen:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						carfrontsheen:setTopBottom( true, false, 24, 144 )
						carfrontsheen:registerEventHandler( "transition_complete_keyframe", carfrontsheenFrame3 )
					end
				end
				
				carfrontsheen:completeAnimation()
				self.carfrontsheen:setLeftRight( true, false, 201, 501 )
				self.carfrontsheen:setTopBottom( true, false, 30, 150 )
				self.carfrontsheen:setAlpha( 0 )
				self.carfrontsheen:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.carfrontsheen:setShaderVector( 0, 0, 0, 0, 0 )
				carfrontsheenFrame2( carfrontsheen, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.devilhand:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

