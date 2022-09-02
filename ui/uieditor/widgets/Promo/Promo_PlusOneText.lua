-- d364ba4cb3ffe56fc9b6def319726904
-- This hash is used for caching, delete to decompile the file again

CoD.Promo_PlusOneText = InheritFrom( LUI.UIElement )
CoD.Promo_PlusOneText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Promo_PlusOneText )
	self.id = "Promo_PlusOneText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 18 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, -2, 23 )
	Label0:setTopBottom( true, false, 0, 25 )
	Label0:setRGB( 0.67, 0.95, 1 )
	Label0:setText( Engine.Localize( "+1" ) )
	Label0:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local GlowPulse = LUI.UIImage.new()
	GlowPulse:setLeftRight( true, false, -30, 48 )
	GlowPulse:setTopBottom( true, false, -26.5, 51.5 )
	GlowPulse:setAlpha( 0.32 )
	GlowPulse:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse" ) )
	self:addElement( GlowPulse )
	self.GlowPulse = GlowPulse
	
	local GlowPulse0 = LUI.UIImage.new()
	GlowPulse0:setLeftRight( true, false, -121.08, 139.08 )
	GlowPulse0:setTopBottom( true, false, 12.5, 139.6 )
	GlowPulse0:setZRot( 90 )
	GlowPulse0:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse" ) )
	GlowPulse0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowPulse0 )
	self.GlowPulse0 = GlowPulse0
	
	local GlowPulse00 = LUI.UIImage.new()
	GlowPulse00:setLeftRight( true, false, -121.08, 139.08 )
	GlowPulse00:setTopBottom( true, false, -123.5, -57.4 )
	GlowPulse00:setAlpha( 0.59 )
	GlowPulse00:setZRot( 90 )
	GlowPulse00:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse" ) )
	self:addElement( GlowPulse00 )
	self.GlowPulse00 = GlowPulse00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )

				GlowPulse:completeAnimation()
				self.GlowPulse:setAlpha( 0 )
				self.clipFinished( GlowPulse, {} )

				GlowPulse0:completeAnimation()
				self.GlowPulse0:setAlpha( 0 )
				self.clipFinished( GlowPulse0, {} )

				GlowPulse00:completeAnimation()
				self.GlowPulse00:setAlpha( 0 )
				self.clipFinished( GlowPulse00, {} )
			end,
			PlayAfterIntro = function ()
				self:setupElementClipCounter( 4 )

				local Label0Frame2 = function ( Label0, event )
					local Label0Frame3 = function ( Label0, event )
						local Label0Frame4 = function ( Label0, event )
							local Label0Frame5 = function ( Label0, event )
								local Label0Frame6 = function ( Label0, event )
									local Label0Frame7 = function ( Label0, event )
										local Label0Frame8 = function ( Label0, event )
											local Label0Frame9 = function ( Label0, event )
												local Label0Frame10 = function ( Label0, event )
													local Label0Frame11 = function ( Label0, event )
														local Label0Frame12 = function ( Label0, event )
															local Label0Frame13 = function ( Label0, event )
																if not event.interrupted then
																	Label0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
																end
																Label0:setLeftRight( true, false, -95, -77 )
																Label0:setTopBottom( true, false, 0, 25 )
																Label0:setAlpha( 0 )
																Label0:setScale( 2.8 )
																if event.interrupted then
																	self.clipFinished( Label0, event )
																else
																	Label0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																Label0Frame13( Label0, event )
																return 
															else
																Label0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
																Label0:setLeftRight( true, false, -85.51, -67.51 )
																Label0:setScale( 2.49 )
																Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame13 )
															end
														end
														
														if event.interrupted then
															Label0Frame12( Label0, event )
															return 
														else
															Label0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
															Label0:setLeftRight( true, false, -65.97, -47.96 )
															Label0:setAlpha( 1 )
															Label0:setScale( 1.85 )
															Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame12 )
														end
													end
													
													if event.interrupted then
														Label0Frame11( Label0, event )
														return 
													else
														Label0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														Label0:setLeftRight( true, false, -63.73, -45.73 )
														Label0:setAlpha( 0.09 )
														Label0:setScale( 1.78 )
														Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame11 )
													end
												end
												
												if event.interrupted then
													Label0Frame10( Label0, event )
													return 
												else
													Label0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													Label0:setLeftRight( true, false, -62.06, -44.05 )
													Label0:setAlpha( 1 )
													Label0:setScale( 1.73 )
													Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame10 )
												end
											end
											
											if event.interrupted then
												Label0Frame9( Label0, event )
												return 
											else
												Label0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Label0:setLeftRight( true, false, -60.66, -42.65 )
												Label0:setAlpha( 0.05 )
												Label0:setScale( 1.68 )
												Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame9 )
											end
										end
										
										if event.interrupted then
											Label0Frame8( Label0, event )
											return 
										else
											Label0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											Label0:setLeftRight( true, false, -59.55, -41.54 )
											Label0:setAlpha( 1 )
											Label0:setScale( 1.65 )
											Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame8 )
										end
									end
									
									if event.interrupted then
										Label0Frame7( Label0, event )
										return 
									else
										Label0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										Label0:setLeftRight( true, false, -58.43, -40.42 )
										Label0:setAlpha( 0.23 )
										Label0:setScale( 1.61 )
										Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame7 )
									end
								end
								
								if event.interrupted then
									Label0Frame6( Label0, event )
									return 
								else
									Label0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Label0:setLeftRight( true, false, -57.31, -39.3 )
									Label0:setAlpha( 1 )
									Label0:setScale( 1.57 )
									Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame6 )
								end
							end
							
							if event.interrupted then
								Label0Frame5( Label0, event )
								return 
							else
								Label0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								Label0:setLeftRight( true, false, -56.2, -38.19 )
								Label0:setAlpha( 0.25 )
								Label0:setScale( 1.54 )
								Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame5 )
							end
						end
						
						if event.interrupted then
							Label0Frame4( Label0, event )
							return 
						else
							Label0:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
							Label0:setLeftRight( true, false, -55.08, -37.07 )
							Label0:setScale( 1.5 )
							Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame4 )
						end
					end
					
					if event.interrupted then
						Label0Frame3( Label0, event )
						return 
					else
						Label0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Label0:setLeftRight( true, false, -28.99, -10.98 )
						Label0:setAlpha( 1 )
						Label0:setScale( 0.88 )
						Label0:registerEventHandler( "transition_complete_keyframe", Label0Frame3 )
					end
				end
				
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 0, 18 )
				self.Label0:setTopBottom( true, false, 0, 25 )
				self.Label0:setAlpha( 0 )
				self.Label0:setScale( 0.2 )
				Label0Frame2( Label0, {} )
				local GlowPulseFrame2 = function ( GlowPulse, event )
					local GlowPulseFrame3 = function ( GlowPulse, event )
						local GlowPulseFrame4 = function ( GlowPulse, event )
							local GlowPulseFrame5 = function ( GlowPulse, event )
								local GlowPulseFrame6 = function ( GlowPulse, event )
									local GlowPulseFrame7 = function ( GlowPulse, event )
										local GlowPulseFrame8 = function ( GlowPulse, event )
											local GlowPulseFrame9 = function ( GlowPulse, event )
												local GlowPulseFrame10 = function ( GlowPulse, event )
													if not event.interrupted then
														GlowPulse:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
													end
													GlowPulse:setLeftRight( true, false, -104, -26 )
													GlowPulse:setTopBottom( true, false, -30.5, 47.5 )
													GlowPulse:setAlpha( 0 )
													GlowPulse:setScale( 2.8 )
													if event.interrupted then
														self.clipFinished( GlowPulse, event )
													else
														GlowPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													GlowPulseFrame10( GlowPulse, event )
													return 
												else
													GlowPulse:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													GlowPulse:setLeftRight( true, false, -93.64, -15.64 )
													GlowPulse:setTopBottom( true, false, -29.94, 48.06 )
													GlowPulse:setAlpha( 0.6 )
													GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame10 )
												end
											end
											
											if event.interrupted then
												GlowPulseFrame9( GlowPulse, event )
												return 
											else
												GlowPulse:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												GlowPulse:setLeftRight( true, false, -91.42, -13.42 )
												GlowPulse:setTopBottom( true, false, -29.82, 48.18 )
												GlowPulse:setAlpha( 1 )
												GlowPulse:setScale( 1.8 )
												GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame9 )
											end
										end
										
										if event.interrupted then
											GlowPulseFrame8( GlowPulse, event )
											return 
										else
											GlowPulse:beginAnimation( "keyframe", 969, false, false, CoD.TweenType.Linear )
											GlowPulse:setLeftRight( true, false, -90.31, -12.31 )
											GlowPulse:setTopBottom( true, false, -29.76, 48.24 )
											GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame8 )
										end
									end
									
									if event.interrupted then
										GlowPulseFrame7( GlowPulse, event )
										return 
									else
										GlowPulse:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
										GlowPulse:setLeftRight( true, false, -54.42, 23.58 )
										GlowPulse:setTopBottom( true, false, -27.82, 50.18 )
										GlowPulse:setAlpha( 0 )
										GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame7 )
									end
								end
								
								if event.interrupted then
									GlowPulseFrame6( GlowPulse, event )
									return 
								else
									GlowPulse:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									GlowPulse:setLeftRight( true, false, -41.1, 36.9 )
									GlowPulse:setTopBottom( true, false, -27.1, 50.9 )
									GlowPulse:setAlpha( 0.32 )
									GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame6 )
								end
							end
							
							if event.interrupted then
								GlowPulseFrame5( GlowPulse, event )
								return 
							else
								GlowPulse:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								GlowPulse:setLeftRight( true, false, -35.55, 42.45 )
								GlowPulse:setTopBottom( true, false, -26.8, 51.2 )
								GlowPulse:setAlpha( 0.72 )
								GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame5 )
							end
						end
						
						if event.interrupted then
							GlowPulseFrame4( GlowPulse, event )
							return 
						else
							GlowPulse:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							GlowPulse:setLeftRight( true, false, -34.81, 43.19 )
							GlowPulse:setTopBottom( true, false, -26.76, 51.24 )
							GlowPulse:setAlpha( 0.35 )
							GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame4 )
						end
					end
					
					if event.interrupted then
						GlowPulseFrame3( GlowPulse, event )
						return 
					else
						GlowPulse:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowPulse:setLeftRight( true, false, -33.7, 44.3 )
						GlowPulse:setTopBottom( true, false, -26.7, 51.3 )
						GlowPulse:setAlpha( 1 )
						GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame3 )
					end
				end
				
				GlowPulse:completeAnimation()
				self.GlowPulse:setLeftRight( true, false, -30, 48 )
				self.GlowPulse:setTopBottom( true, false, -26.5, 51.5 )
				self.GlowPulse:setAlpha( 0 )
				self.GlowPulse:setScale( 1 )
				GlowPulseFrame2( GlowPulse, {} )
				local GlowPulse0Frame2 = function ( GlowPulse0, event )
					local GlowPulse0Frame3 = function ( GlowPulse0, event )
						local GlowPulse0Frame4 = function ( GlowPulse0, event )
							local GlowPulse0Frame5 = function ( GlowPulse0, event )
								if not event.interrupted then
									GlowPulse0:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
								end
								GlowPulse0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowPulse0, event )
								else
									GlowPulse0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowPulse0Frame5( GlowPulse0, event )
								return 
							else
								GlowPulse0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								GlowPulse0:setAlpha( 1 )
								GlowPulse0:registerEventHandler( "transition_complete_keyframe", GlowPulse0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowPulse0Frame4( GlowPulse0, event )
							return 
						else
							GlowPulse0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							GlowPulse0:setAlpha( 0.22 )
							GlowPulse0:registerEventHandler( "transition_complete_keyframe", GlowPulse0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowPulse0Frame3( GlowPulse0, event )
						return 
					else
						GlowPulse0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowPulse0:setAlpha( 1 )
						GlowPulse0:registerEventHandler( "transition_complete_keyframe", GlowPulse0Frame3 )
					end
				end
				
				GlowPulse0:completeAnimation()
				self.GlowPulse0:setAlpha( 0 )
				GlowPulse0Frame2( GlowPulse0, {} )
				local GlowPulse00Frame2 = function ( GlowPulse00, event )
					local GlowPulse00Frame3 = function ( GlowPulse00, event )
						local GlowPulse00Frame4 = function ( GlowPulse00, event )
							local GlowPulse00Frame5 = function ( GlowPulse00, event )
								local GlowPulse00Frame6 = function ( GlowPulse00, event )
									local GlowPulse00Frame7 = function ( GlowPulse00, event )
										if not event.interrupted then
											GlowPulse00:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
										end
										GlowPulse00:setLeftRight( true, false, -121.08, 139.08 )
										GlowPulse00:setTopBottom( true, false, -274, -207.9 )
										GlowPulse00:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( GlowPulse00, event )
										else
											GlowPulse00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										GlowPulse00Frame7( GlowPulse00, event )
										return 
									else
										GlowPulse00:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										GlowPulse00:setTopBottom( true, false, -213.77, -46.78 )
										GlowPulse00:setAlpha( 0 )
										GlowPulse00:registerEventHandler( "transition_complete_keyframe", GlowPulse00Frame7 )
									end
								end
								
								if event.interrupted then
									GlowPulse00Frame6( GlowPulse00, event )
									return 
								else
									GlowPulse00:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									GlowPulse00:setTopBottom( true, false, -196.29, 0 )
									GlowPulse00:setAlpha( 0.17 )
									GlowPulse00:registerEventHandler( "transition_complete_keyframe", GlowPulse00Frame6 )
								end
							end
							
							if event.interrupted then
								GlowPulse00Frame5( GlowPulse00, event )
								return 
							else
								GlowPulse00:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								GlowPulse00:setTopBottom( true, false, -62.94, 3.16 )
								GlowPulse00:setAlpha( 0.54 )
								GlowPulse00:registerEventHandler( "transition_complete_keyframe", GlowPulse00Frame5 )
							end
						end
						
						if event.interrupted then
							GlowPulse00Frame4( GlowPulse00, event )
							return 
						else
							GlowPulse00:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							GlowPulse00:setAlpha( 1 )
							GlowPulse00:registerEventHandler( "transition_complete_keyframe", GlowPulse00Frame4 )
						end
					end
					
					if event.interrupted then
						GlowPulse00Frame3( GlowPulse00, event )
						return 
					else
						GlowPulse00:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						GlowPulse00:registerEventHandler( "transition_complete_keyframe", GlowPulse00Frame3 )
					end
				end
				
				GlowPulse00:completeAnimation()
				self.GlowPulse00:setLeftRight( true, false, -121.08, 139.08 )
				self.GlowPulse00:setTopBottom( true, false, 25, 91.1 )
				self.GlowPulse00:setAlpha( 0 )
				GlowPulse00Frame2( GlowPulse00, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

