-- 452d82ac91993ce9b8d8869e9a063cda
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Perk2Widget = InheritFrom( LUI.UIElement )
CoD.CallingCards_Perk2Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Perk2Widget )
	self.id = "CallingCards_Perk2Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, -35, 515 )
	BG:setTopBottom( true, false, -35.68, 155.68 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_perk2_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 163.6, 451.21 )
	GlowOrangeOver:setTopBottom( true, false, -135.66, 310.08 )
	GlowOrangeOver:setRGB( 1, 0.27, 0.27 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setZRot( 80 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local boat = LUI.UIImage.new()
	boat:setLeftRight( true, false, 207.55, 472 )
	boat:setTopBottom( true, false, -11.66, 133 )
	boat:setAlpha( 0.9 )
	boat:setImage( RegisterImage( "uie_t7_callingcard_perk2_boat" ) )
	boat:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( boat )
	self.boat = boat
	
	local sails = LUI.UIImage.new()
	sails:setLeftRight( true, false, 256.49, 492 )
	sails:setTopBottom( true, false, -35.68, 155.68 )
	sails:setImage( RegisterImage( "uie_t7_callingcard_perk2_sails" ) )
	self:addElement( sails )
	self.sails = sails
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( true, false, 102.6, 265.36 )
	GlowOrangeOver0:setTopBottom( true, false, -126.12, 126.12 )
	GlowOrangeOver0:setRGB( 1, 0.97, 0.88 )
	GlowOrangeOver0:setAlpha( 0.3 )
	GlowOrangeOver0:setZRot( 80 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	local octo = LUI.UIImage.new()
	octo:setLeftRight( true, false, -34.64, 515 )
	octo:setTopBottom( true, false, -41.39, 150.98 )
	octo:setImage( RegisterImage( "uie_t7_callingcard_perk2_octopus" ) )
	self:addElement( octo )
	self.octo = octo
	
	local splash = LUI.UIImage.new()
	splash:setLeftRight( true, false, 10.61, 293.18 )
	splash:setTopBottom( true, false, -23.68, 169.29 )
	splash:setAlpha( 0.49 )
	splash:setImage( RegisterImage( "uie_t7_callingcard_perk2_splash" ) )
	self:addElement( splash )
	self.splash = splash
	
	local octoright = LUI.UIImage.new()
	octoright:setLeftRight( true, false, 446, 496 )
	octoright:setTopBottom( true, false, 29.95, 72.81 )
	octoright:setImage( RegisterImage( "uie_t7_callingcard_perk2_octopus2" ) )
	self:addElement( octoright )
	self.octoright = octoright
	
	local octoleft = LUI.UIImage.new()
	octoleft:setLeftRight( true, false, 388, 432.97 )
	octoleft:setTopBottom( true, false, -22.66, 29.81 )
	octoleft:setImage( RegisterImage( "uie_t7_callingcard_perk2_octopus3" ) )
	self:addElement( octoleft )
	self.octoleft = octoleft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									local GlowOrangeOverFrame7 = function ( GlowOrangeOver, event )
										local GlowOrangeOverFrame8 = function ( GlowOrangeOver, event )
											local GlowOrangeOverFrame9 = function ( GlowOrangeOver, event )
												if not event.interrupted then
													GlowOrangeOver:beginAnimation( "keyframe", 1410, false, false, CoD.TweenType.Linear )
												end
												GlowOrangeOver:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( GlowOrangeOver, event )
												else
													GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GlowOrangeOverFrame9( GlowOrangeOver, event )
												return 
											else
												GlowOrangeOver:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												GlowOrangeOver:setAlpha( 0.35 )
												GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame9 )
											end
										end
										
										if event.interrupted then
											GlowOrangeOverFrame8( GlowOrangeOver, event )
											return 
										else
											GlowOrangeOver:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
											GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeOverFrame7( GlowOrangeOver, event )
										return 
									else
										GlowOrangeOver:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
										GlowOrangeOver:setAlpha( 0 )
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 0.37 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.35 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local boatFrame2 = function ( boat, event )
					local boatFrame3 = function ( boat, event )
						local boatFrame4 = function ( boat, event )
							local boatFrame5 = function ( boat, event )
								if not event.interrupted then
									boat:beginAnimation( "keyframe", 1010, false, false, CoD.TweenType.Linear )
								end
								boat:setLeftRight( true, false, 207.55, 472 )
								boat:setTopBottom( true, false, -11.66, 133 )
								boat:setZRot( 0 )
								if event.interrupted then
									self.clipFinished( boat, event )
								else
									boat:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								boatFrame5( boat, event )
								return 
							else
								boat:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
								boat:setZRot( -8 )
								boat:registerEventHandler( "transition_complete_keyframe", boatFrame5 )
							end
						end
						
						if event.interrupted then
							boatFrame4( boat, event )
							return 
						else
							boat:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
							boat:setZRot( 0 )
							boat:registerEventHandler( "transition_complete_keyframe", boatFrame4 )
						end
					end
					
					if event.interrupted then
						boatFrame3( boat, event )
						return 
					else
						boat:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						boat:setZRot( -8 )
						boat:registerEventHandler( "transition_complete_keyframe", boatFrame3 )
					end
				end
				
				boat:completeAnimation()
				self.boat:setLeftRight( true, false, 207.55, 472 )
				self.boat:setTopBottom( true, false, -11.66, 133 )
				self.boat:setZRot( 0 )
				boatFrame2( boat, {} )
				local sailsFrame2 = function ( sails, event )
					local sailsFrame3 = function ( sails, event )
						local sailsFrame4 = function ( sails, event )
							local sailsFrame5 = function ( sails, event )
								if not event.interrupted then
									sails:beginAnimation( "keyframe", 1010, false, false, CoD.TweenType.Linear )
								end
								sails:setZRot( 0 )
								if event.interrupted then
									self.clipFinished( sails, event )
								else
									sails:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								sailsFrame5( sails, event )
								return 
							else
								sails:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
								sails:setZRot( -8 )
								sails:registerEventHandler( "transition_complete_keyframe", sailsFrame5 )
							end
						end
						
						if event.interrupted then
							sailsFrame4( sails, event )
							return 
						else
							sails:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
							sails:setZRot( 0 )
							sails:registerEventHandler( "transition_complete_keyframe", sailsFrame4 )
						end
					end
					
					if event.interrupted then
						sailsFrame3( sails, event )
						return 
					else
						sails:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						sails:setZRot( -8 )
						sails:registerEventHandler( "transition_complete_keyframe", sailsFrame3 )
					end
				end
				
				sails:completeAnimation()
				self.sails:setZRot( 0 )
				sailsFrame2( sails, {} )
				local octoFrame2 = function ( octo, event )
					local octoFrame3 = function ( octo, event )
						if not event.interrupted then
							octo:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						end
						octo:setZRot( 0 )
						if event.interrupted then
							self.clipFinished( octo, event )
						else
							octo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						octoFrame3( octo, event )
						return 
					else
						octo:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
						octo:setZRot( 4 )
						octo:registerEventHandler( "transition_complete_keyframe", octoFrame3 )
					end
				end
				
				octo:completeAnimation()
				self.octo:setZRot( 0 )
				octoFrame2( octo, {} )
				local splashFrame2 = function ( splash, event )
					local splashFrame3 = function ( splash, event )
						local splashFrame4 = function ( splash, event )
							local splashFrame5 = function ( splash, event )
								local splashFrame6 = function ( splash, event )
									local splashFrame7 = function ( splash, event )
										local splashFrame8 = function ( splash, event )
											local splashFrame9 = function ( splash, event )
												local splashFrame10 = function ( splash, event )
													local splashFrame11 = function ( splash, event )
														local splashFrame12 = function ( splash, event )
															local splashFrame13 = function ( splash, event )
																if not event.interrupted then
																	splash:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
																end
																splash:setAlpha( 0.5 )
																splash:setZRot( 0 )
																if event.interrupted then
																	self.clipFinished( splash, event )
																else
																	splash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																splashFrame13( splash, event )
																return 
															else
																splash:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
																splash:setAlpha( 0.37 )
																splash:setZRot( 0.72 )
																splash:registerEventHandler( "transition_complete_keyframe", splashFrame13 )
															end
														end
														
														if event.interrupted then
															splashFrame12( splash, event )
															return 
														else
															splash:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
															splash:setAlpha( 0.5 )
															splash:setZRot( 1.33 )
															splash:registerEventHandler( "transition_complete_keyframe", splashFrame12 )
														end
													end
													
													if event.interrupted then
														splashFrame11( splash, event )
														return 
													else
														splash:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														splash:setAlpha( 0.8 )
														splash:setZRot( 1.41 )
														splash:registerEventHandler( "transition_complete_keyframe", splashFrame11 )
													end
												end
												
												if event.interrupted then
													splashFrame10( splash, event )
													return 
												else
													splash:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													splash:setAlpha( 0.35 )
													splash:setZRot( 1.49 )
													splash:registerEventHandler( "transition_complete_keyframe", splashFrame10 )
												end
											end
											
											if event.interrupted then
												splashFrame9( splash, event )
												return 
											else
												splash:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
												splash:setAlpha( 0.45 )
												splash:setZRot( 1.99 )
												splash:registerEventHandler( "transition_complete_keyframe", splashFrame9 )
											end
										end
										
										if event.interrupted then
											splashFrame8( splash, event )
											return 
										else
											splash:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											splash:setAlpha( 0.5 )
											splash:setZRot( 1.72 )
											splash:registerEventHandler( "transition_complete_keyframe", splashFrame8 )
										end
									end
									
									if event.interrupted then
										splashFrame7( splash, event )
										return 
									else
										splash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										splash:setAlpha( 0.8 )
										splash:setZRot( 1.62 )
										splash:registerEventHandler( "transition_complete_keyframe", splashFrame7 )
									end
								end
								
								if event.interrupted then
									splashFrame6( splash, event )
									return 
								else
									splash:beginAnimation( "keyframe", 640, false, false, CoD.TweenType.Linear )
									splash:setAlpha( 0.68 )
									splash:setZRot( 1.55 )
									splash:registerEventHandler( "transition_complete_keyframe", splashFrame6 )
								end
							end
							
							if event.interrupted then
								splashFrame5( splash, event )
								return 
							else
								splash:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
								splash:setAlpha( 0.5 )
								splash:setZRot( 0.92 )
								splash:registerEventHandler( "transition_complete_keyframe", splashFrame5 )
							end
						end
						
						if event.interrupted then
							splashFrame4( splash, event )
							return 
						else
							splash:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							splash:setAlpha( 0.3 )
							splash:setZRot( 0.33 )
							splash:registerEventHandler( "transition_complete_keyframe", splashFrame4 )
						end
					end
					
					if event.interrupted then
						splashFrame3( splash, event )
						return 
					else
						splash:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						splash:setAlpha( 0.66 )
						splash:setZRot( 0.23 )
						splash:registerEventHandler( "transition_complete_keyframe", splashFrame3 )
					end
				end
				
				splash:completeAnimation()
				self.splash:setAlpha( 0.5 )
				self.splash:setZRot( 0 )
				splashFrame2( splash, {} )
				local octorightFrame2 = function ( octoright, event )
					local octorightFrame3 = function ( octoright, event )
						if not event.interrupted then
							octoright:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						end
						octoright:setZRot( 0 )
						if event.interrupted then
							self.clipFinished( octoright, event )
						else
							octoright:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						octorightFrame3( octoright, event )
						return 
					else
						octoright:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
						octoright:setZRot( -18 )
						octoright:registerEventHandler( "transition_complete_keyframe", octorightFrame3 )
					end
				end
				
				octoright:completeAnimation()
				self.octoright:setZRot( 0 )
				octorightFrame2( octoright, {} )
				local octoleftFrame2 = function ( octoleft, event )
					local octoleftFrame3 = function ( octoleft, event )
						if not event.interrupted then
							octoleft:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						end
						octoleft:setZRot( 0 )
						if event.interrupted then
							self.clipFinished( octoleft, event )
						else
							octoleft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						octoleftFrame3( octoleft, event )
						return 
					else
						octoleft:beginAnimation( "keyframe", 2009, false, false, CoD.TweenType.Linear )
						octoleft:setZRot( 27 )
						octoleft:registerEventHandler( "transition_complete_keyframe", octoleftFrame3 )
					end
				end
				
				octoleft:completeAnimation()
				self.octoleft:setZRot( 0 )
				octoleftFrame2( octoleft, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
