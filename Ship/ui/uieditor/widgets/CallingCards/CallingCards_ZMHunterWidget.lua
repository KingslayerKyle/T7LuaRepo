-- 0e7bd52f5591e771eea364315edc5636
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_ZMHunterWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_ZMHunterWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_ZMHunterWidget )
	self.id = "CallingCards_ZMHunterWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bgDark = LUI.UIImage.new()
	bgDark:setLeftRight( true, false, 0, 480 )
	bgDark:setTopBottom( true, false, 0, 120 )
	bgDark:setImage( RegisterImage( "uie_t7_callingcard_zmhunder_bg" ) )
	self:addElement( bgDark )
	self.bgDark = bgDark
	
	local bgLight = LUI.UIImage.new()
	bgLight:setLeftRight( true, false, 0, 480 )
	bgLight:setTopBottom( true, false, 0, 120 )
	bgLight:setImage( RegisterImage( "uie_t7_callingcard_zmhunder_bg2" ) )
	self:addElement( bgLight )
	self.bgLight = bgLight
	
	local manDark = LUI.UIImage.new()
	manDark:setLeftRight( true, false, 316, 447 )
	manDark:setTopBottom( true, false, 0, 131 )
	manDark:setImage( RegisterImage( "uie_t7_callingcard_zmhunder_man2" ) )
	self:addElement( manDark )
	self.manDark = manDark
	
	local manLight = LUI.UIImage.new()
	manLight:setLeftRight( true, false, 316, 447 )
	manLight:setTopBottom( true, false, 0, 131 )
	manLight:setImage( RegisterImage( "uie_t7_callingcard_zmhunder_man" ) )
	self:addElement( manLight )
	self.manLight = manLight
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 361.6, 649.21 )
	GlowOrangeOver:setTopBottom( true, false, -53, 204.74 )
	GlowOrangeOver:setRGB( 0.56, 0, 0 )
	GlowOrangeOver:setAlpha( 0.75 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local bgLightFrame2 = function ( bgLight, event )
					local bgLightFrame3 = function ( bgLight, event )
						local bgLightFrame4 = function ( bgLight, event )
							local bgLightFrame5 = function ( bgLight, event )
								local bgLightFrame6 = function ( bgLight, event )
									local bgLightFrame7 = function ( bgLight, event )
										local bgLightFrame8 = function ( bgLight, event )
											local bgLightFrame9 = function ( bgLight, event )
												local bgLightFrame10 = function ( bgLight, event )
													local bgLightFrame11 = function ( bgLight, event )
														local bgLightFrame12 = function ( bgLight, event )
															if not event.interrupted then
																bgLight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															bgLight:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( bgLight, event )
															else
																bgLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															bgLightFrame12( bgLight, event )
															return 
														else
															bgLight:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
															bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame12 )
														end
													end
													
													if event.interrupted then
														bgLightFrame11( bgLight, event )
														return 
													else
														bgLight:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
														bgLight:setAlpha( 0 )
														bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame11 )
													end
												end
												
												if event.interrupted then
													bgLightFrame10( bgLight, event )
													return 
												else
													bgLight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
													bgLight:setAlpha( 0.16 )
													bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame10 )
												end
											end
											
											if event.interrupted then
												bgLightFrame9( bgLight, event )
												return 
											else
												bgLight:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
												bgLight:setAlpha( 0 )
												bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame9 )
											end
										end
										
										if event.interrupted then
											bgLightFrame8( bgLight, event )
											return 
										else
											bgLight:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											bgLight:setAlpha( 1 )
											bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame8 )
										end
									end
									
									if event.interrupted then
										bgLightFrame7( bgLight, event )
										return 
									else
										bgLight:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
										bgLight:setAlpha( 0 )
										bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame7 )
									end
								end
								
								if event.interrupted then
									bgLightFrame6( bgLight, event )
									return 
								else
									bgLight:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									bgLight:setAlpha( 1 )
									bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame6 )
								end
							end
							
							if event.interrupted then
								bgLightFrame5( bgLight, event )
								return 
							else
								bgLight:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								bgLight:setAlpha( 0 )
								bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame5 )
							end
						end
						
						if event.interrupted then
							bgLightFrame4( bgLight, event )
							return 
						else
							bgLight:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							bgLight:setAlpha( 1 )
							bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame4 )
						end
					end
					
					if event.interrupted then
						bgLightFrame3( bgLight, event )
						return 
					else
						bgLight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						bgLight:setAlpha( 0 )
						bgLight:registerEventHandler( "transition_complete_keyframe", bgLightFrame3 )
					end
				end
				
				bgLight:completeAnimation()
				self.bgLight:setAlpha( 1 )
				bgLightFrame2( bgLight, {} )
				local manLightFrame2 = function ( manLight, event )
					local manLightFrame3 = function ( manLight, event )
						local manLightFrame4 = function ( manLight, event )
							local manLightFrame5 = function ( manLight, event )
								local manLightFrame6 = function ( manLight, event )
									local manLightFrame7 = function ( manLight, event )
										local manLightFrame8 = function ( manLight, event )
											local manLightFrame9 = function ( manLight, event )
												local manLightFrame10 = function ( manLight, event )
													local manLightFrame11 = function ( manLight, event )
														local manLightFrame12 = function ( manLight, event )
															if not event.interrupted then
																manLight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															manLight:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( manLight, event )
															else
																manLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															manLightFrame12( manLight, event )
															return 
														else
															manLight:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
															manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame12 )
														end
													end
													
													if event.interrupted then
														manLightFrame11( manLight, event )
														return 
													else
														manLight:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
														manLight:setAlpha( 0 )
														manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame11 )
													end
												end
												
												if event.interrupted then
													manLightFrame10( manLight, event )
													return 
												else
													manLight:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
													manLight:setAlpha( 0.27 )
													manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame10 )
												end
											end
											
											if event.interrupted then
												manLightFrame9( manLight, event )
												return 
											else
												manLight:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
												manLight:setAlpha( 0 )
												manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame9 )
											end
										end
										
										if event.interrupted then
											manLightFrame8( manLight, event )
											return 
										else
											manLight:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											manLight:setAlpha( 1 )
											manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame8 )
										end
									end
									
									if event.interrupted then
										manLightFrame7( manLight, event )
										return 
									else
										manLight:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
										manLight:setAlpha( 0 )
										manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame7 )
									end
								end
								
								if event.interrupted then
									manLightFrame6( manLight, event )
									return 
								else
									manLight:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									manLight:setAlpha( 1 )
									manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame6 )
								end
							end
							
							if event.interrupted then
								manLightFrame5( manLight, event )
								return 
							else
								manLight:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								manLight:setAlpha( 0 )
								manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame5 )
							end
						end
						
						if event.interrupted then
							manLightFrame4( manLight, event )
							return 
						else
							manLight:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							manLight:setAlpha( 1 )
							manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame4 )
						end
					end
					
					if event.interrupted then
						manLightFrame3( manLight, event )
						return 
					else
						manLight:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						manLight:setAlpha( 0 )
						manLight:registerEventHandler( "transition_complete_keyframe", manLightFrame3 )
					end
				end
				
				manLight:completeAnimation()
				self.manLight:setAlpha( 1 )
				manLightFrame2( manLight, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									local GlowOrangeOverFrame7 = function ( GlowOrangeOver, event )
										local GlowOrangeOverFrame8 = function ( GlowOrangeOver, event )
											local GlowOrangeOverFrame9 = function ( GlowOrangeOver, event )
												local GlowOrangeOverFrame10 = function ( GlowOrangeOver, event )
													local GlowOrangeOverFrame11 = function ( GlowOrangeOver, event )
														local GlowOrangeOverFrame12 = function ( GlowOrangeOver, event )
															if not event.interrupted then
																GlowOrangeOver:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															GlowOrangeOver:setAlpha( 0.75 )
															if event.interrupted then
																self.clipFinished( GlowOrangeOver, event )
															else
																GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															GlowOrangeOverFrame12( GlowOrangeOver, event )
															return 
														else
															GlowOrangeOver:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
															GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame12 )
														end
													end
													
													if event.interrupted then
														GlowOrangeOverFrame11( GlowOrangeOver, event )
														return 
													else
														GlowOrangeOver:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
														GlowOrangeOver:setAlpha( 0 )
														GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame11 )
													end
												end
												
												if event.interrupted then
													GlowOrangeOverFrame10( GlowOrangeOver, event )
													return 
												else
													GlowOrangeOver:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
													GlowOrangeOver:setAlpha( 0.37 )
													GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame10 )
												end
											end
											
											if event.interrupted then
												GlowOrangeOverFrame9( GlowOrangeOver, event )
												return 
											else
												GlowOrangeOver:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
												GlowOrangeOver:setAlpha( 0 )
												GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame9 )
											end
										end
										
										if event.interrupted then
											GlowOrangeOverFrame8( GlowOrangeOver, event )
											return 
										else
											GlowOrangeOver:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											GlowOrangeOver:setAlpha( 0.75 )
											GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeOverFrame7( GlowOrangeOver, event )
										return 
									else
										GlowOrangeOver:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
										GlowOrangeOver:setAlpha( 0 )
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 0.75 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.75 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.75 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
