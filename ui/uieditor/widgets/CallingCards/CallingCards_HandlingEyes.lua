-- 28fb176a2ba4602b8490c9e444a6fecb
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_HandlingEyes = InheritFrom( LUI.UIElement )
CoD.CallingCards_HandlingEyes.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_HandlingEyes )
	self.id = "CallingCards_HandlingEyes"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 6 )
	self:setTopBottom( true, false, 0, 7 )
	
	local RedGlow2 = LUI.UIImage.new()
	RedGlow2:setLeftRight( true, false, 0, 6.15 )
	RedGlow2:setTopBottom( true, false, 0, 6.7 )
	RedGlow2:setRGB( 1, 0.04, 0 )
	RedGlow2:setZRot( 90 )
	RedGlow2:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	RedGlow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RedGlow2 )
	self.RedGlow2 = RedGlow2
	
	local outerGlow = LUI.UIImage.new()
	outerGlow:setLeftRight( true, false, -0.99, 6.99 )
	outerGlow:setTopBottom( true, false, -4.92, 11.92 )
	outerGlow:setRGB( 1, 0.04, 0 )
	outerGlow:setAlpha( 0.25 )
	outerGlow:setZRot( 90 )
	outerGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	outerGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( outerGlow )
	self.outerGlow = outerGlow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local RedGlow2Frame2 = function ( RedGlow2, event )
					local RedGlow2Frame3 = function ( RedGlow2, event )
						local RedGlow2Frame4 = function ( RedGlow2, event )
							local RedGlow2Frame5 = function ( RedGlow2, event )
								local RedGlow2Frame6 = function ( RedGlow2, event )
									local RedGlow2Frame7 = function ( RedGlow2, event )
										local RedGlow2Frame8 = function ( RedGlow2, event )
											local RedGlow2Frame9 = function ( RedGlow2, event )
												local RedGlow2Frame10 = function ( RedGlow2, event )
													local RedGlow2Frame11 = function ( RedGlow2, event )
														if not event.interrupted then
															RedGlow2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														end
														RedGlow2:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( RedGlow2, event )
														else
															RedGlow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														RedGlow2Frame11( RedGlow2, event )
														return 
													else
														RedGlow2:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
														RedGlow2:setAlpha( 0 )
														RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame11 )
													end
												end
												
												if event.interrupted then
													RedGlow2Frame10( RedGlow2, event )
													return 
												else
													RedGlow2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
													RedGlow2:setAlpha( 1 )
													RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame10 )
												end
											end
											
											if event.interrupted then
												RedGlow2Frame9( RedGlow2, event )
												return 
											else
												RedGlow2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												RedGlow2:setAlpha( 0.5 )
												RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame9 )
											end
										end
										
										if event.interrupted then
											RedGlow2Frame8( RedGlow2, event )
											return 
										else
											RedGlow2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											RedGlow2:setAlpha( 1 )
											RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame8 )
										end
									end
									
									if event.interrupted then
										RedGlow2Frame7( RedGlow2, event )
										return 
									else
										RedGlow2:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
										RedGlow2:setAlpha( 0 )
										RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame7 )
									end
								end
								
								if event.interrupted then
									RedGlow2Frame6( RedGlow2, event )
									return 
								else
									RedGlow2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									RedGlow2:setAlpha( 1 )
									RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame6 )
								end
							end
							
							if event.interrupted then
								RedGlow2Frame5( RedGlow2, event )
								return 
							else
								RedGlow2:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
								RedGlow2:setAlpha( 0.2 )
								RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame5 )
							end
						end
						
						if event.interrupted then
							RedGlow2Frame4( RedGlow2, event )
							return 
						else
							RedGlow2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							RedGlow2:setAlpha( 1 )
							RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame4 )
						end
					end
					
					if event.interrupted then
						RedGlow2Frame3( RedGlow2, event )
						return 
					else
						RedGlow2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						RedGlow2:setAlpha( 0 )
						RedGlow2:registerEventHandler( "transition_complete_keyframe", RedGlow2Frame3 )
					end
				end
				
				RedGlow2:completeAnimation()
				self.RedGlow2:setAlpha( 1 )
				RedGlow2Frame2( RedGlow2, {} )
				local outerGlowFrame2 = function ( outerGlow, event )
					local outerGlowFrame3 = function ( outerGlow, event )
						local outerGlowFrame4 = function ( outerGlow, event )
							local outerGlowFrame5 = function ( outerGlow, event )
								local outerGlowFrame6 = function ( outerGlow, event )
									local outerGlowFrame7 = function ( outerGlow, event )
										local outerGlowFrame8 = function ( outerGlow, event )
											local outerGlowFrame9 = function ( outerGlow, event )
												local outerGlowFrame10 = function ( outerGlow, event )
													local outerGlowFrame11 = function ( outerGlow, event )
														if not event.interrupted then
															outerGlow:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														end
														outerGlow:setAlpha( 0.25 )
														if event.interrupted then
															self.clipFinished( outerGlow, event )
														else
															outerGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														outerGlowFrame11( outerGlow, event )
														return 
													else
														outerGlow:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
														outerGlow:setAlpha( 0 )
														outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame11 )
													end
												end
												
												if event.interrupted then
													outerGlowFrame10( outerGlow, event )
													return 
												else
													outerGlow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
													outerGlow:setAlpha( 0.25 )
													outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame10 )
												end
											end
											
											if event.interrupted then
												outerGlowFrame9( outerGlow, event )
												return 
											else
												outerGlow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												outerGlow:setAlpha( 0.08 )
												outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame9 )
											end
										end
										
										if event.interrupted then
											outerGlowFrame8( outerGlow, event )
											return 
										else
											outerGlow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											outerGlow:setAlpha( 0.25 )
											outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame8 )
										end
									end
									
									if event.interrupted then
										outerGlowFrame7( outerGlow, event )
										return 
									else
										outerGlow:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
										outerGlow:setAlpha( 0 )
										outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame7 )
									end
								end
								
								if event.interrupted then
									outerGlowFrame6( outerGlow, event )
									return 
								else
									outerGlow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									outerGlow:setAlpha( 0.25 )
									outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame6 )
								end
							end
							
							if event.interrupted then
								outerGlowFrame5( outerGlow, event )
								return 
							else
								outerGlow:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
								outerGlow:setAlpha( 0.1 )
								outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame5 )
							end
						end
						
						if event.interrupted then
							outerGlowFrame4( outerGlow, event )
							return 
						else
							outerGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							outerGlow:setAlpha( 0.25 )
							outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame4 )
						end
					end
					
					if event.interrupted then
						outerGlowFrame3( outerGlow, event )
						return 
					else
						outerGlow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						outerGlow:setAlpha( 0 )
						outerGlow:registerEventHandler( "transition_complete_keyframe", outerGlowFrame3 )
					end
				end
				
				outerGlow:completeAnimation()
				self.outerGlow:setAlpha( 0.25 )
				outerGlowFrame2( outerGlow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

