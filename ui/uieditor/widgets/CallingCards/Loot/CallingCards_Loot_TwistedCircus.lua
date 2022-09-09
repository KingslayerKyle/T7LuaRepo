-- d54bd80f0a17dacaf01e88448cfec0db
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Loot_TwistedCircus = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_TwistedCircus.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_TwistedCircus )
	self.id = "CallingCards_Loot_TwistedCircus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 480 )
	Image2:setTopBottom( true, false, 0, 120 )
	Image2:setImage( RegisterImage( "uie_t7_callingcard_twistedcircus_bg3" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 480 )
	Image1:setTopBottom( true, false, 0, 120 )
	Image1:setImage( RegisterImage( "uie_t7_callingcard_twistedcircus_bg2" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_twistedcircus_bg1" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 248.67, 257.71 )
	Glow:setTopBottom( true, false, 51.18, 70.82 )
	Glow:setRGB( 1, 0.85, 0.38 )
	Glow:setAlpha( 0.8 )
	Glow:setZRot( 101 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 221.67, 230.71 )
	Image3:setTopBottom( true, false, 57.18, 76.82 )
	Image3:setRGB( 1, 0.85, 0.38 )
	Image3:setAlpha( 0.8 )
	Image3:setZRot( 101 )
	Image3:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( true, false, -207.33, 124 )
	Glow0:setTopBottom( true, false, -243.82, 475.82 )
	Glow0:setRGB( 0, 0, 0 )
	Glow0:setAlpha( 0.67 )
	Glow0:setZRot( -66 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							local f5_local0 = function ( f6_arg0, f6_arg1 )
								local f6_local0 = function ( f7_arg0, f7_arg1 )
									local f7_local0 = function ( f8_arg0, f8_arg1 )
										local f8_local0 = function ( f9_arg0, f9_arg1 )
											if not f9_arg1.interrupted then
												f9_arg0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
											end
											f9_arg0:setAlpha( 0 )
											if f9_arg1.interrupted then
												self.clipFinished( f9_arg0, f9_arg1 )
											else
												f9_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f8_arg1.interrupted then
											f8_local0( f8_arg0, f8_arg1 )
											return 
										else
											f8_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											f8_arg0:setAlpha( 0 )
											f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
										end
									end
									
									if f7_arg1.interrupted then
										f7_local0( f7_arg0, f7_arg1 )
										return 
									else
										f7_arg0:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
										f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
									end
								end
								
								if f6_arg1.interrupted then
									f6_local0( f6_arg0, f6_arg1 )
									return 
								else
									f6_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									f6_arg0:setAlpha( 1 )
									f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
								end
							end
							
							if f5_arg1.interrupted then
								f5_local0( f5_arg0, f5_arg1 )
								return 
							else
								f5_arg0:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
								f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						f3_arg0:setAlpha( 0 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				Image1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Image1:setAlpha( 1 )
				Image1:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									local Image0Frame7 = function ( Image0, event )
										local Image0Frame8 = function ( Image0, event )
											local Image0Frame9 = function ( Image0, event )
												local Image0Frame10 = function ( Image0, event )
													local Image0Frame11 = function ( Image0, event )
														local Image0Frame12 = function ( Image0, event )
															local Image0Frame13 = function ( Image0, event )
																local Image0Frame14 = function ( Image0, event )
																	local Image0Frame15 = function ( Image0, event )
																		local Image0Frame16 = function ( Image0, event )
																			if not event.interrupted then
																				Image0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			end
																			Image0:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( Image0, event )
																			else
																				Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			Image0Frame16( Image0, event )
																			return 
																		else
																			Image0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Image0:setAlpha( 1 )
																			Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Image0Frame15( Image0, event )
																		return 
																	else
																		Image0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																		Image0:setAlpha( 0 )
																		Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame15 )
																	end
																end
																
																if event.interrupted then
																	Image0Frame14( Image0, event )
																	return 
																else
																	Image0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																	Image0:setAlpha( 1 )
																	Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame14 )
																end
															end
															
															if event.interrupted then
																Image0Frame13( Image0, event )
																return 
															else
																Image0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																Image0:setAlpha( 0 )
																Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame13 )
															end
														end
														
														if event.interrupted then
															Image0Frame12( Image0, event )
															return 
														else
															Image0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															Image0:setAlpha( 1 )
															Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame12 )
														end
													end
													
													if event.interrupted then
														Image0Frame11( Image0, event )
														return 
													else
														Image0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
														Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame11 )
													end
												end
												
												if event.interrupted then
													Image0Frame10( Image0, event )
													return 
												else
													Image0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
													Image0:setAlpha( 0 )
													Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame10 )
												end
											end
											
											if event.interrupted then
												Image0Frame9( Image0, event )
												return 
											else
												Image0:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
												Image0:setAlpha( 1 )
												Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame9 )
											end
										end
										
										if event.interrupted then
											Image0Frame8( Image0, event )
											return 
										else
											Image0:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
											Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame8 )
										end
									end
									
									if event.interrupted then
										Image0Frame7( Image0, event )
										return 
									else
										Image0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
										Image0:setAlpha( 0 )
										Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame7 )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								Image0:setAlpha( 1 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Image0:setAlpha( 0 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								if not event.interrupted then
									Glow0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
								end
								Glow0:setLeftRight( true, false, -209.33, 122 )
								Glow0:setTopBottom( true, false, -243.82, 475.82 )
								Glow0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow0, event )
								else
									Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
								Glow0:setAlpha( 0.49 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 0 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.42 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( true, false, -209.33, 122 )
				self.Glow0:setTopBottom( true, false, -243.82, 475.82 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
