-- 7b03a0967881b7bede3cc1a9c563cbb0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CODE.CallingCards_code_sea_sub" )
require( "ui.uieditor.widgets.CallingCards.CODE.CallingCards_code_sea_diver" )

CoD.CallingCards_code_sea = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_sea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_code_sea )
	self.id = "CallingCards_code_sea"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 128 )
	bg:setImage( RegisterImage( "uie_t7_callingcards_sea_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( true, false, 0, 480 )
	bg2:setTopBottom( true, false, 0, 128 )
	bg2:setImage( RegisterImage( "uie_t7_callingcards_sea_bg2" ) )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local CallingCardscodeseasub = CoD.CallingCards_code_sea_sub.new( menu, controller )
	CallingCardscodeseasub:setLeftRight( true, false, 0, 512 )
	CallingCardscodeseasub:setTopBottom( true, false, 0, 128 )
	self:addElement( CallingCardscodeseasub )
	self.CallingCardscodeseasub = CallingCardscodeseasub
	
	local light = LUI.UIImage.new()
	light:setLeftRight( true, false, 169, 412.2 )
	light:setTopBottom( true, false, 0, 128 )
	light:setImage( RegisterImage( "uie_t7_callingcards_sea_light" ) )
	self:addElement( light )
	self.light = light
	
	local light0 = LUI.UIImage.new()
	light0:setLeftRight( true, false, 266, 126.2 )
	light0:setTopBottom( true, false, 0, 128 )
	light0:setAlpha( 0.2 )
	light0:setImage( RegisterImage( "uie_t7_callingcards_sea_light" ) )
	self:addElement( light0 )
	self.light0 = light0
	
	local diver4 = LUI.UIImage.new()
	diver4:setLeftRight( true, false, 272, 320 )
	diver4:setTopBottom( true, false, 4, 52 )
	diver4:setImage( RegisterImage( "uie_t7_callingcards_sea_diver4" ) )
	self:addElement( diver4 )
	self.diver4 = diver4
	
	local diver3 = LUI.UIImage.new()
	diver3:setLeftRight( true, false, 384, 480 )
	diver3:setTopBottom( true, false, 0, 87 )
	diver3:setImage( RegisterImage( "uie_t7_callingcards_sea_diver3" ) )
	self:addElement( diver3 )
	self.diver3 = diver3
	
	local diver2 = LUI.UIImage.new()
	diver2:setLeftRight( true, false, 218, 326 )
	diver2:setTopBottom( true, false, 19, 115 )
	diver2:setImage( RegisterImage( "uie_t7_callingcards_sea_diver2" ) )
	self:addElement( diver2 )
	self.diver2 = diver2
	
	local particles = LUI.UIImage.new()
	particles:setLeftRight( true, false, 0, 480 )
	particles:setTopBottom( true, false, 0, 120 )
	particles:setImage( RegisterImage( "uie_t7_callingcards_sea_particles" ) )
	self:addElement( particles )
	self.particles = particles
	
	local CallingCardscodeseadiver = CoD.CallingCards_code_sea_diver.new( menu, controller )
	CallingCardscodeseadiver:setLeftRight( true, false, 300, 480 )
	CallingCardscodeseadiver:setTopBottom( true, false, 0, 120 )
	self:addElement( CallingCardscodeseadiver )
	self.CallingCardscodeseadiver = CallingCardscodeseadiver
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 174.5, 261.5 )
	Image0:setTopBottom( true, false, 54.5, 141.5 )
	Image0:setImage( RegisterImage( "uie_t7_callingcards_sea_fish" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 113.5, 183.5 )
	Image00:setTopBottom( true, false, 37, 107 )
	Image00:setAlpha( 0.5 )
	Image00:setImage( RegisterImage( "uie_t7_callingcards_sea_fish" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				local bg2Frame2 = function ( bg2, event )
					local bg2Frame3 = function ( bg2, event )
						local bg2Frame4 = function ( bg2, event )
							local bg2Frame5 = function ( bg2, event )
								if not event.interrupted then
									bg2:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
								end
								bg2:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( bg2, event )
								else
									bg2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								bg2Frame5( bg2, event )
								return 
							else
								bg2:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
								bg2:setAlpha( 0 )
								bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame5 )
							end
						end
						
						if event.interrupted then
							bg2Frame4( bg2, event )
							return 
						else
							bg2:beginAnimation( "keyframe", 1509, false, false, CoD.TweenType.Linear )
							bg2:setAlpha( 0.8 )
							bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame4 )
						end
					end
					
					if event.interrupted then
						bg2Frame3( bg2, event )
						return 
					else
						bg2:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						bg2:setAlpha( 0 )
						bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame3 )
					end
				end
				
				bg2:completeAnimation()
				self.bg2:setAlpha( 1 )
				bg2Frame2( bg2, {} )
				local CallingCardscodeseasubFrame2 = function ( CallingCardscodeseasub, event )
					local CallingCardscodeseasubFrame3 = function ( CallingCardscodeseasub, event )
						if not event.interrupted then
							CallingCardscodeseasub:beginAnimation( "keyframe", 1569, false, false, CoD.TweenType.Linear )
						end
						CallingCardscodeseasub:setLeftRight( true, false, 0, 512 )
						CallingCardscodeseasub:setTopBottom( true, false, 0, 128 )
						CallingCardscodeseasub:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CallingCardscodeseasub, event )
						else
							CallingCardscodeseasub:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CallingCardscodeseasubFrame3( CallingCardscodeseasub, event )
						return 
					else
						CallingCardscodeseasub:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
						CallingCardscodeseasub:setTopBottom( true, false, -1.97, 126.03 )
						CallingCardscodeseasub:setAlpha( 0.95 )
						CallingCardscodeseasub:registerEventHandler( "transition_complete_keyframe", CallingCardscodeseasubFrame3 )
					end
				end
				
				CallingCardscodeseasub:completeAnimation()
				self.CallingCardscodeseasub:setLeftRight( true, false, 0, 512 )
				self.CallingCardscodeseasub:setTopBottom( true, false, 0, 128 )
				self.CallingCardscodeseasub:setAlpha( 1 )
				CallingCardscodeseasubFrame2( CallingCardscodeseasub, {} )
				local lightFrame2 = function ( light, event )
					local lightFrame3 = function ( light, event )
						local lightFrame4 = function ( light, event )
							local lightFrame5 = function ( light, event )
								if not event.interrupted then
									light:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
								end
								light:setAlpha( 0.2 )
								if event.interrupted then
									self.clipFinished( light, event )
								else
									light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								lightFrame5( light, event )
								return 
							else
								light:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
								light:setAlpha( 0.57 )
								light:registerEventHandler( "transition_complete_keyframe", lightFrame5 )
							end
						end
						
						if event.interrupted then
							lightFrame4( light, event )
							return 
						else
							light:beginAnimation( "keyframe", 1440, false, false, CoD.TweenType.Linear )
							light:setAlpha( 0.35 )
							light:registerEventHandler( "transition_complete_keyframe", lightFrame4 )
						end
					end
					
					if event.interrupted then
						lightFrame3( light, event )
						return 
					else
						light:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						light:setAlpha( 0.7 )
						light:registerEventHandler( "transition_complete_keyframe", lightFrame3 )
					end
				end
				
				light:completeAnimation()
				self.light:setAlpha( 0.2 )
				lightFrame2( light, {} )
				local light0Frame2 = function ( light0, event )
					local light0Frame3 = function ( light0, event )
						local light0Frame4 = function ( light0, event )
							local light0Frame5 = function ( light0, event )
								local light0Frame6 = function ( light0, event )
									local light0Frame7 = function ( light0, event )
										if not event.interrupted then
											light0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
										end
										light0:setAlpha( 0.1 )
										if event.interrupted then
											self.clipFinished( light0, event )
										else
											light0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										light0Frame7( light0, event )
										return 
									else
										light0:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
										light0:setAlpha( 0.2 )
										light0:registerEventHandler( "transition_complete_keyframe", light0Frame7 )
									end
								end
								
								if event.interrupted then
									light0Frame6( light0, event )
									return 
								else
									light0:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
									light0:registerEventHandler( "transition_complete_keyframe", light0Frame6 )
								end
							end
							
							if event.interrupted then
								light0Frame5( light0, event )
								return 
							else
								light0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
								light0:setAlpha( 0 )
								light0:registerEventHandler( "transition_complete_keyframe", light0Frame5 )
							end
						end
						
						if event.interrupted then
							light0Frame4( light0, event )
							return 
						else
							light0:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							light0:setAlpha( 0.15 )
							light0:registerEventHandler( "transition_complete_keyframe", light0Frame4 )
						end
					end
					
					if event.interrupted then
						light0Frame3( light0, event )
						return 
					else
						light0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						light0:setAlpha( 0.26 )
						light0:registerEventHandler( "transition_complete_keyframe", light0Frame3 )
					end
				end
				
				light0:completeAnimation()
				self.light0:setAlpha( 0.1 )
				light0Frame2( light0, {} )
				local diver4Frame2 = function ( diver4, event )
					local diver4Frame3 = function ( diver4, event )
						local diver4Frame4 = function ( diver4, event )
							if not event.interrupted then
								diver4:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
							end
							diver4:setLeftRight( true, false, 272, 320 )
							diver4:setTopBottom( true, false, 9, 57 )
							if event.interrupted then
								self.clipFinished( diver4, event )
							else
								diver4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							diver4Frame4( diver4, event )
							return 
						else
							diver4:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
							diver4:setTopBottom( true, false, 15.61, 63.61 )
							diver4:registerEventHandler( "transition_complete_keyframe", diver4Frame4 )
						end
					end
					
					if event.interrupted then
						diver4Frame3( diver4, event )
						return 
					else
						diver4:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
						diver4:setTopBottom( true, false, 3.66, 51.66 )
						diver4:registerEventHandler( "transition_complete_keyframe", diver4Frame3 )
					end
				end
				
				diver4:completeAnimation()
				self.diver4:setLeftRight( true, false, 272, 320 )
				self.diver4:setTopBottom( true, false, 9, 57 )
				diver4Frame2( diver4, {} )
				local diver3Frame2 = function ( diver3, event )
					local diver3Frame3 = function ( diver3, event )
						local diver3Frame4 = function ( diver3, event )
							if not event.interrupted then
								diver3:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Linear )
							end
							diver3:setLeftRight( true, false, 384, 480 )
							diver3:setTopBottom( true, false, 0, 87 )
							if event.interrupted then
								self.clipFinished( diver3, event )
							else
								diver3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							diver3Frame4( diver3, event )
							return 
						else
							diver3:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
							diver3:setTopBottom( true, false, 12.5, 99.5 )
							diver3:registerEventHandler( "transition_complete_keyframe", diver3Frame4 )
						end
					end
					
					if event.interrupted then
						diver3Frame3( diver3, event )
						return 
					else
						diver3:beginAnimation( "keyframe", 1799, false, false, CoD.TweenType.Linear )
						diver3:setTopBottom( true, false, 16.5, 103.5 )
						diver3:registerEventHandler( "transition_complete_keyframe", diver3Frame3 )
					end
				end
				
				diver3:completeAnimation()
				self.diver3:setLeftRight( true, false, 384, 480 )
				self.diver3:setTopBottom( true, false, 0, 87 )
				diver3Frame2( diver3, {} )
				local diver2Frame2 = function ( diver2, event )
					local diver2Frame3 = function ( diver2, event )
						local diver2Frame4 = function ( diver2, event )
							if not event.interrupted then
								diver2:beginAnimation( "keyframe", 1249, false, false, CoD.TweenType.Linear )
							end
							diver2:setLeftRight( true, false, 218, 326 )
							diver2:setTopBottom( true, false, 12, 108 )
							if event.interrupted then
								self.clipFinished( diver2, event )
							else
								diver2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							diver2Frame4( diver2, event )
							return 
						else
							diver2:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							diver2:setTopBottom( true, false, 20, 116 )
							diver2:registerEventHandler( "transition_complete_keyframe", diver2Frame4 )
						end
					end
					
					if event.interrupted then
						diver2Frame3( diver2, event )
						return 
					else
						diver2:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						diver2:setTopBottom( true, false, 24, 120 )
						diver2:registerEventHandler( "transition_complete_keyframe", diver2Frame3 )
					end
				end
				
				diver2:completeAnimation()
				self.diver2:setLeftRight( true, false, 218, 326 )
				self.diver2:setTopBottom( true, false, 12, 108 )
				diver2Frame2( diver2, {} )
				local particlesFrame2 = function ( particles, event )
					local particlesFrame3 = function ( particles, event )
						local particlesFrame4 = function ( particles, event )
							local particlesFrame5 = function ( particles, event )
								local particlesFrame6 = function ( particles, event )
									local particlesFrame7 = function ( particles, event )
										local particlesFrame8 = function ( particles, event )
											local particlesFrame9 = function ( particles, event )
												local particlesFrame10 = function ( particles, event )
													local particlesFrame11 = function ( particles, event )
														local particlesFrame12 = function ( particles, event )
															local particlesFrame13 = function ( particles, event )
																local particlesFrame14 = function ( particles, event )
																	if not event.interrupted then
																		particles:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
																	end
																	particles:setAlpha( 0 )
																	if event.interrupted then
																		self.clipFinished( particles, event )
																	else
																		particles:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	particlesFrame14( particles, event )
																	return 
																else
																	particles:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
																	particles:setAlpha( 1 )
																	particles:registerEventHandler( "transition_complete_keyframe", particlesFrame14 )
																end
															end
															
															if event.interrupted then
																particlesFrame13( particles, event )
																return 
															else
																particles:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																particles:setAlpha( 0 )
																particles:registerEventHandler( "transition_complete_keyframe", particlesFrame13 )
															end
														end
														
														if event.interrupted then
															particlesFrame12( particles, event )
															return 
														else
															particles:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
															particles:setAlpha( 1 )
															particles:registerEventHandler( "transition_complete_keyframe", particlesFrame12 )
														end
													end
													
													if event.interrupted then
														particlesFrame11( particles, event )
														return 
													else
														particles:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
														particles:setAlpha( 0 )
														particles:registerEventHandler( "transition_complete_keyframe", particlesFrame11 )
													end
												end
												
												if event.interrupted then
													particlesFrame10( particles, event )
													return 
												else
													particles:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
													particles:setAlpha( 1 )
													particles:registerEventHandler( "transition_complete_keyframe", particlesFrame10 )
												end
											end
											
											if event.interrupted then
												particlesFrame9( particles, event )
												return 
											else
												particles:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
												particles:setAlpha( 0 )
												particles:registerEventHandler( "transition_complete_keyframe", particlesFrame9 )
											end
										end
										
										if event.interrupted then
											particlesFrame8( particles, event )
											return 
										else
											particles:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											particles:setAlpha( 1 )
											particles:registerEventHandler( "transition_complete_keyframe", particlesFrame8 )
										end
									end
									
									if event.interrupted then
										particlesFrame7( particles, event )
										return 
									else
										particles:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
										particles:setAlpha( 0 )
										particles:registerEventHandler( "transition_complete_keyframe", particlesFrame7 )
									end
								end
								
								if event.interrupted then
									particlesFrame6( particles, event )
									return 
								else
									particles:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									particles:setAlpha( 1 )
									particles:registerEventHandler( "transition_complete_keyframe", particlesFrame6 )
								end
							end
							
							if event.interrupted then
								particlesFrame5( particles, event )
								return 
							else
								particles:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								particles:setAlpha( 0 )
								particles:registerEventHandler( "transition_complete_keyframe", particlesFrame5 )
							end
						end
						
						if event.interrupted then
							particlesFrame4( particles, event )
							return 
						else
							particles:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
							particles:setAlpha( 1 )
							particles:registerEventHandler( "transition_complete_keyframe", particlesFrame4 )
						end
					end
					
					if event.interrupted then
						particlesFrame3( particles, event )
						return 
					else
						particles:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						particles:registerEventHandler( "transition_complete_keyframe", particlesFrame3 )
					end
				end
				
				particles:completeAnimation()
				self.particles:setAlpha( 0 )
				particlesFrame2( particles, {} )
				local CallingCardscodeseadiverFrame2 = function ( CallingCardscodeseadiver, event )
					local CallingCardscodeseadiverFrame3 = function ( CallingCardscodeseadiver, event )
						local CallingCardscodeseadiverFrame4 = function ( CallingCardscodeseadiver, event )
							local CallingCardscodeseadiverFrame5 = function ( CallingCardscodeseadiver, event )
								if not event.interrupted then
									CallingCardscodeseadiver:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
								end
								CallingCardscodeseadiver:setLeftRight( true, false, 300, 480 )
								CallingCardscodeseadiver:setTopBottom( true, false, 7, 127 )
								if event.interrupted then
									self.clipFinished( CallingCardscodeseadiver, event )
								else
									CallingCardscodeseadiver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CallingCardscodeseadiverFrame5( CallingCardscodeseadiver, event )
								return 
							else
								CallingCardscodeseadiver:beginAnimation( "keyframe", 1459, false, false, CoD.TweenType.Linear )
								CallingCardscodeseadiver:setTopBottom( true, false, 13, 133 )
								CallingCardscodeseadiver:registerEventHandler( "transition_complete_keyframe", CallingCardscodeseadiverFrame5 )
							end
						end
						
						if event.interrupted then
							CallingCardscodeseadiverFrame4( CallingCardscodeseadiver, event )
							return 
						else
							CallingCardscodeseadiver:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
							CallingCardscodeseadiver:setTopBottom( true, false, -10, 110 )
							CallingCardscodeseadiver:registerEventHandler( "transition_complete_keyframe", CallingCardscodeseadiverFrame4 )
						end
					end
					
					if event.interrupted then
						CallingCardscodeseadiverFrame3( CallingCardscodeseadiver, event )
						return 
					else
						CallingCardscodeseadiver:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						CallingCardscodeseadiver:setTopBottom( true, false, -13, 107 )
						CallingCardscodeseadiver:registerEventHandler( "transition_complete_keyframe", CallingCardscodeseadiverFrame3 )
					end
				end
				
				CallingCardscodeseadiver:completeAnimation()
				self.CallingCardscodeseadiver:setLeftRight( true, false, 300, 480 )
				self.CallingCardscodeseadiver:setTopBottom( true, false, 7, 127 )
				CallingCardscodeseadiverFrame2( CallingCardscodeseadiver, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 3119, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( true, false, -125.5, 27 )
					Image0:setTopBottom( true, false, -6, 146.5 )
					Image0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 145.5, 232.5 )
				self.Image0:setTopBottom( true, false, 51.5, 138.5 )
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image00Frame2 = function ( Image00, event )
					local Image00Frame3 = function ( Image00, event )
						local Image00Frame4 = function ( Image00, event )
							local Image00Frame5 = function ( Image00, event )
								if not event.interrupted then
									Image00:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
								end
								Image00:setLeftRight( true, false, 48.25, 118.25 )
								Image00:setTopBottom( true, false, 21.08, 91.08 )
								Image00:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( Image00, event )
								else
									Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image00Frame5( Image00, event )
								return 
							else
								Image00:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
								Image00:setLeftRight( true, false, 86.88, 156.88 )
								Image00:setTopBottom( true, false, 28.7, 98.7 )
								Image00:setAlpha( 0.5 )
								Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame5 )
							end
						end
						
						if event.interrupted then
							Image00Frame4( Image00, event )
							return 
						else
							Image00:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
							Image00:setLeftRight( true, false, 134, 204 )
							Image00:setTopBottom( true, false, 38, 108 )
							Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame4 )
						end
					end
					
					if event.interrupted then
						Image00Frame3( Image00, event )
						return 
					else
						Image00:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
						Image00:setLeftRight( true, false, -13, 57 )
						Image00:setTopBottom( true, false, 9, 79 )
						Image00:setAlpha( 0 )
						Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame3 )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 48.25, 118.25 )
				self.Image00:setTopBottom( true, false, 21.08, 91.08 )
				self.Image00:setAlpha( 0.5 )
				Image00Frame2( Image00, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardscodeseasub:close()
		element.CallingCardscodeseadiver:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

