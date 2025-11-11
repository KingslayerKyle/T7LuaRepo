CoD.CallingCards_SupportWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_SupportWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_SupportWidget )
	self.id = "CallingCards_SupportWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 720 )
	bg:setTopBottom( 0, 0, 0, 180 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_support_bg1" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bgWithReflect = LUI.UIImage.new()
	bgWithReflect:setLeftRight( 0, 0, 0, 720 )
	bgWithReflect:setTopBottom( 0, 0, 0, 180 )
	bgWithReflect:setImage( RegisterImage( "uie_t7_callingcard_support_bg2" ) )
	self:addElement( bgWithReflect )
	self.bgWithReflect = bgWithReflect
	
	local bgWithEyesClosed = LUI.UIImage.new()
	bgWithEyesClosed:setLeftRight( 0, 0, 0, 720 )
	bgWithEyesClosed:setTopBottom( 0, 0, 0, 180 )
	bgWithEyesClosed:setAlpha( 0 )
	bgWithEyesClosed:setImage( RegisterImage( "uie_t7_callingcard_support_bg3" ) )
	self:addElement( bgWithEyesClosed )
	self.bgWithEyesClosed = bgWithEyesClosed
	
	local ripple = LUI.UIImage.new()
	ripple:setLeftRight( 0, 0, 84, 411 )
	ripple:setTopBottom( 0, 0, 114, 180 )
	ripple:setAlpha( 0.57 )
	ripple:setImage( RegisterImage( "uie_t7_callingcard_support_ripple" ) )
	self:addElement( ripple )
	self.ripple = ripple
	
	local bgAdd = LUI.UIImage.new()
	bgAdd:setLeftRight( 0, 0, 0, 720 )
	bgAdd:setTopBottom( 0, 0, 0, 180 )
	bgAdd:setAlpha( 0.2 )
	bgAdd:setImage( RegisterImage( "uie_t7_callingcard_support_bg1" ) )
	bgAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgAdd )
	self.bgAdd = bgAdd
	
	local eye = LUI.UIImage.new()
	eye:setLeftRight( 0, 0, 478, 526 )
	eye:setTopBottom( 0, 0, 40, 88 )
	eye:setImage( RegisterImage( "uie_t7_callingcard_support_eye" ) )
	self:addElement( eye )
	self.eye = eye
	
	local tongue = LUI.UIImage.new()
	tongue:setLeftRight( 0, 0, 73, 451 )
	tongue:setTopBottom( 0, 0, 19, 109 )
	tongue:setImage( RegisterImage( "uie_t7_callingcard_support_tongue" ) )
	self:addElement( tongue )
	self.tongue = tongue
	
	local fly = LUI.UIImage.new()
	fly:setLeftRight( 0, 0, 26, 122 )
	fly:setTopBottom( 0, 0, -20, 76 )
	fly:setImage( RegisterImage( "uie_t7_callingcard_support_fly" ) )
	self:addElement( fly )
	self.fly = fly
	
	self.resetProperties = function ()
		bgWithReflect:completeAnimation()
		ripple:completeAnimation()
		tongue:completeAnimation()
		fly:completeAnimation()
		eye:completeAnimation()
		bgWithEyesClosed:completeAnimation()
		bgWithReflect:setAlpha( 1 )
		ripple:setAlpha( 0.57 )
		tongue:setAlpha( 1 )
		fly:setLeftRight( 0, 0, 26, 122 )
		fly:setTopBottom( 0, 0, -20, 76 )
		eye:setAlpha( 1 )
		bgWithEyesClosed:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local bgWithReflectFrame2 = function ( bgWithReflect, event )
					local bgWithReflectFrame3 = function ( bgWithReflect, event )
						local bgWithReflectFrame4 = function ( bgWithReflect, event )
							local bgWithReflectFrame5 = function ( bgWithReflect, event )
								if not event.interrupted then
									bgWithReflect:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
								end
								bgWithReflect:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( bgWithReflect, event )
								else
									bgWithReflect:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								bgWithReflectFrame5( bgWithReflect, event )
								return 
							else
								bgWithReflect:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
								bgWithReflect:setAlpha( 0.25 )
								bgWithReflect:registerEventHandler( "transition_complete_keyframe", bgWithReflectFrame5 )
							end
						end
						
						if event.interrupted then
							bgWithReflectFrame4( bgWithReflect, event )
							return 
						else
							bgWithReflect:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							bgWithReflect:setAlpha( 1 )
							bgWithReflect:registerEventHandler( "transition_complete_keyframe", bgWithReflectFrame4 )
						end
					end
					
					if event.interrupted then
						bgWithReflectFrame3( bgWithReflect, event )
						return 
					else
						bgWithReflect:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						bgWithReflect:setAlpha( 0.25 )
						bgWithReflect:registerEventHandler( "transition_complete_keyframe", bgWithReflectFrame3 )
					end
				end
				
				bgWithReflect:completeAnimation()
				self.bgWithReflect:setAlpha( 1 )
				bgWithReflectFrame2( bgWithReflect, {} )
				local bgWithEyesClosedFrame2 = function ( bgWithEyesClosed, event )
					local bgWithEyesClosedFrame3 = function ( bgWithEyesClosed, event )
						local bgWithEyesClosedFrame4 = function ( bgWithEyesClosed, event )
							local bgWithEyesClosedFrame5 = function ( bgWithEyesClosed, event )
								local bgWithEyesClosedFrame6 = function ( bgWithEyesClosed, event )
									local bgWithEyesClosedFrame7 = function ( bgWithEyesClosed, event )
										if not event.interrupted then
											bgWithEyesClosed:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
										end
										bgWithEyesClosed:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( bgWithEyesClosed, event )
										else
											bgWithEyesClosed:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										bgWithEyesClosedFrame7( bgWithEyesClosed, event )
										return 
									else
										bgWithEyesClosed:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										bgWithEyesClosed:setAlpha( 1 )
										bgWithEyesClosed:registerEventHandler( "transition_complete_keyframe", bgWithEyesClosedFrame7 )
									end
								end
								
								if event.interrupted then
									bgWithEyesClosedFrame6( bgWithEyesClosed, event )
									return 
								else
									bgWithEyesClosed:beginAnimation( "keyframe", 1259, false, false, CoD.TweenType.Linear )
									bgWithEyesClosed:registerEventHandler( "transition_complete_keyframe", bgWithEyesClosedFrame6 )
								end
							end
							
							if event.interrupted then
								bgWithEyesClosedFrame5( bgWithEyesClosed, event )
								return 
							else
								bgWithEyesClosed:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								bgWithEyesClosed:setAlpha( 0 )
								bgWithEyesClosed:registerEventHandler( "transition_complete_keyframe", bgWithEyesClosedFrame5 )
							end
						end
						
						if event.interrupted then
							bgWithEyesClosedFrame4( bgWithEyesClosed, event )
							return 
						else
							bgWithEyesClosed:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							bgWithEyesClosed:setAlpha( 1 )
							bgWithEyesClosed:registerEventHandler( "transition_complete_keyframe", bgWithEyesClosedFrame4 )
						end
					end
					
					if event.interrupted then
						bgWithEyesClosedFrame3( bgWithEyesClosed, event )
						return 
					else
						bgWithEyesClosed:beginAnimation( "keyframe", 1649, false, false, CoD.TweenType.Linear )
						bgWithEyesClosed:registerEventHandler( "transition_complete_keyframe", bgWithEyesClosedFrame3 )
					end
				end
				
				bgWithEyesClosed:completeAnimation()
				self.bgWithEyesClosed:setAlpha( 0 )
				bgWithEyesClosedFrame2( bgWithEyesClosed, {} )
				local rippleFrame2 = function ( ripple, event )
					local rippleFrame3 = function ( ripple, event )
						if not event.interrupted then
							ripple:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
						end
						ripple:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ripple, event )
						else
							ripple:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						rippleFrame3( ripple, event )
						return 
					else
						ripple:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						ripple:setAlpha( 0.26 )
						ripple:registerEventHandler( "transition_complete_keyframe", rippleFrame3 )
					end
				end
				
				ripple:completeAnimation()
				self.ripple:setAlpha( 0 )
				rippleFrame2( ripple, {} )
				local eyeFrame2 = function ( eye, event )
					local eyeFrame3 = function ( eye, event )
						local eyeFrame4 = function ( eye, event )
							local eyeFrame5 = function ( eye, event )
								if not event.interrupted then
									eye:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
								end
								eye:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( eye, event )
								else
									eye:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								eyeFrame5( eye, event )
								return 
							else
								eye:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
								eye:setAlpha( 0.3 )
								eye:registerEventHandler( "transition_complete_keyframe", eyeFrame5 )
							end
						end
						
						if event.interrupted then
							eyeFrame4( eye, event )
							return 
						else
							eye:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							eye:setAlpha( 1 )
							eye:registerEventHandler( "transition_complete_keyframe", eyeFrame4 )
						end
					end
					
					if event.interrupted then
						eyeFrame3( eye, event )
						return 
					else
						eye:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						eye:setAlpha( 0.42 )
						eye:registerEventHandler( "transition_complete_keyframe", eyeFrame3 )
					end
				end
				
				eye:completeAnimation()
				self.eye:setAlpha( 1 )
				eyeFrame2( eye, {} )
				local tongueFrame2 = function ( tongue, event )
					local tongueFrame3 = function ( tongue, event )
						local tongueFrame4 = function ( tongue, event )
							local tongueFrame5 = function ( tongue, event )
								local tongueFrame6 = function ( tongue, event )
									local tongueFrame7 = function ( tongue, event )
										local tongueFrame8 = function ( tongue, event )
											local tongueFrame9 = function ( tongue, event )
												local tongueFrame10 = function ( tongue, event )
													local tongueFrame11 = function ( tongue, event )
														if not event.interrupted then
															tongue:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
														end
														tongue:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( tongue, event )
														else
															tongue:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														tongueFrame11( tongue, event )
														return 
													else
														tongue:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
														tongue:setAlpha( 0 )
														tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame11 )
													end
												end
												
												if event.interrupted then
													tongueFrame10( tongue, event )
													return 
												else
													tongue:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
													tongue:setAlpha( 1 )
													tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame10 )
												end
											end
											
											if event.interrupted then
												tongueFrame9( tongue, event )
												return 
											else
												tongue:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
												tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame9 )
											end
										end
										
										if event.interrupted then
											tongueFrame8( tongue, event )
											return 
										else
											tongue:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
											tongue:setAlpha( 0 )
											tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame8 )
										end
									end
									
									if event.interrupted then
										tongueFrame7( tongue, event )
										return 
									else
										tongue:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										tongue:setAlpha( 1 )
										tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame7 )
									end
								end
								
								if event.interrupted then
									tongueFrame6( tongue, event )
									return 
								else
									tongue:beginAnimation( "keyframe", 1240, false, false, CoD.TweenType.Linear )
									tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame6 )
								end
							end
							
							if event.interrupted then
								tongueFrame5( tongue, event )
								return 
							else
								tongue:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								tongue:setAlpha( 0 )
								tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame5 )
							end
						end
						
						if event.interrupted then
							tongueFrame4( tongue, event )
							return 
						else
							tongue:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							tongue:setAlpha( 1 )
							tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame4 )
						end
					end
					
					if event.interrupted then
						tongueFrame3( tongue, event )
						return 
					else
						tongue:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
						tongue:registerEventHandler( "transition_complete_keyframe", tongueFrame3 )
					end
				end
				
				tongue:completeAnimation()
				self.tongue:setAlpha( 0 )
				tongueFrame2( tongue, {} )
				local flyFrame2 = function ( fly, event )
					local flyFrame3 = function ( fly, event )
						local flyFrame4 = function ( fly, event )
							local flyFrame5 = function ( fly, event )
								local flyFrame6 = function ( fly, event )
									local flyFrame7 = function ( fly, event )
										local flyFrame8 = function ( fly, event )
											local flyFrame9 = function ( fly, event )
												local flyFrame10 = function ( fly, event )
													local flyFrame11 = function ( fly, event )
														local flyFrame12 = function ( fly, event )
															local flyFrame13 = function ( fly, event )
																local flyFrame14 = function ( fly, event )
																	local flyFrame15 = function ( fly, event )
																		local flyFrame16 = function ( fly, event )
																			local flyFrame17 = function ( fly, event )
																				local flyFrame18 = function ( fly, event )
																					local flyFrame19 = function ( fly, event )
																						local flyFrame20 = function ( fly, event )
																							local flyFrame21 = function ( fly, event )
																								local flyFrame22 = function ( fly, event )
																									local flyFrame23 = function ( fly, event )
																										local flyFrame24 = function ( fly, event )
																											if not event.interrupted then
																												fly:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																											end
																											fly:setLeftRight( 0, 0, 18, 114 )
																											fly:setTopBottom( 0, 0, -69, 27 )
																											if event.interrupted then
																												self.clipFinished( fly, event )
																											else
																												fly:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																											end
																										end
																										
																										if event.interrupted then
																											flyFrame24( fly, event )
																											return 
																										else
																											fly:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
																											fly:setLeftRight( 0, 0, 116, 212 )
																											fly:setTopBottom( 0, 0, -15, 81 )
																											fly:registerEventHandler( "transition_complete_keyframe", flyFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										flyFrame23( fly, event )
																										return 
																									else
																										fly:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
																										fly:setLeftRight( 0, 0, 194, 290 )
																										fly:setTopBottom( 0, 0, 14, 110 )
																										fly:registerEventHandler( "transition_complete_keyframe", flyFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									flyFrame22( fly, event )
																									return 
																								else
																									fly:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																									fly:setLeftRight( 0, 0, 117, 213 )
																									fly:setTopBottom( 0, 0, 51, 147 )
																									fly:registerEventHandler( "transition_complete_keyframe", flyFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								flyFrame21( fly, event )
																								return 
																							else
																								fly:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
																								fly:setLeftRight( 0, 0, 78, 174 )
																								fly:setTopBottom( 0, 0, -32, 64 )
																								fly:registerEventHandler( "transition_complete_keyframe", flyFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							flyFrame20( fly, event )
																							return 
																						else
																							fly:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																							fly:setLeftRight( 0, 0, 20, 116 )
																							fly:setTopBottom( 0, 0, -48, 48 )
																							fly:registerEventHandler( "transition_complete_keyframe", flyFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						flyFrame19( fly, event )
																						return 
																					else
																						fly:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																						fly:setLeftRight( 0, 0, 268, 364 )
																						fly:setTopBottom( 0, 0, -14, 82 )
																						fly:registerEventHandler( "transition_complete_keyframe", flyFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					flyFrame18( fly, event )
																					return 
																				else
																					fly:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																					fly:setLeftRight( 0, 0, 222, 318 )
																					fly:setTopBottom( 0, 0, -18, 78 )
																					fly:registerEventHandler( "transition_complete_keyframe", flyFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				flyFrame17( fly, event )
																				return 
																			else
																				fly:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																				fly:setLeftRight( 0, 0, 108, 204 )
																				fly:setTopBottom( 0, 0, -36, 60 )
																				fly:registerEventHandler( "transition_complete_keyframe", flyFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			flyFrame16( fly, event )
																			return 
																		else
																			fly:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																			fly:setLeftRight( 0, 0, 42, 138 )
																			fly:setTopBottom( 0, 0, -40, 56 )
																			fly:registerEventHandler( "transition_complete_keyframe", flyFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		flyFrame15( fly, event )
																		return 
																	else
																		fly:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																		fly:setLeftRight( 0, 0, 110, 206 )
																		fly:setTopBottom( 0, 0, -6, 90 )
																		fly:registerEventHandler( "transition_complete_keyframe", flyFrame15 )
																	end
																end
																
																if event.interrupted then
																	flyFrame14( fly, event )
																	return 
																else
																	fly:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																	fly:setLeftRight( 0, 0, 159, 255 )
																	fly:setTopBottom( 0, 0, 34, 130 )
																	fly:registerEventHandler( "transition_complete_keyframe", flyFrame14 )
																end
															end
															
															if event.interrupted then
																flyFrame13( fly, event )
																return 
															else
																fly:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																fly:setLeftRight( 0, 0, 224, 320 )
																fly:setTopBottom( 0, 0, -16, 80 )
																fly:registerEventHandler( "transition_complete_keyframe", flyFrame13 )
															end
														end
														
														if event.interrupted then
															flyFrame12( fly, event )
															return 
														else
															fly:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
															fly:setLeftRight( 0, 0, 276, 372 )
															fly:setTopBottom( 0, 0, -8, 88 )
															fly:registerEventHandler( "transition_complete_keyframe", flyFrame12 )
														end
													end
													
													if event.interrupted then
														flyFrame11( fly, event )
														return 
													else
														fly:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
														fly:setLeftRight( 0, 0, 108, 204 )
														fly:setTopBottom( 0, 0, -22, 74 )
														fly:registerEventHandler( "transition_complete_keyframe", flyFrame11 )
													end
												end
												
												if event.interrupted then
													flyFrame10( fly, event )
													return 
												else
													fly:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
													fly:setLeftRight( 0, 0, 134, 230 )
													fly:setTopBottom( 0, 0, -20, 76 )
													fly:registerEventHandler( "transition_complete_keyframe", flyFrame10 )
												end
											end
											
											if event.interrupted then
												flyFrame9( fly, event )
												return 
											else
												fly:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
												fly:setLeftRight( 0, 0, 36, 132 )
												fly:registerEventHandler( "transition_complete_keyframe", flyFrame9 )
											end
										end
										
										if event.interrupted then
											flyFrame8( fly, event )
											return 
										else
											fly:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											fly:setLeftRight( 0, 0, 123, 219 )
											fly:setTopBottom( 0, 0, -40, 56 )
											fly:registerEventHandler( "transition_complete_keyframe", flyFrame8 )
										end
									end
									
									if event.interrupted then
										flyFrame7( fly, event )
										return 
									else
										fly:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
										fly:setLeftRight( 0, 0, 90, 186 )
										fly:setTopBottom( 0, 0, 8, 104 )
										fly:registerEventHandler( "transition_complete_keyframe", flyFrame7 )
									end
								end
								
								if event.interrupted then
									flyFrame6( fly, event )
									return 
								else
									fly:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
									fly:setLeftRight( 0, 0, 142, 238 )
									fly:setTopBottom( 0, 0, 0, 96 )
									fly:registerEventHandler( "transition_complete_keyframe", flyFrame6 )
								end
							end
							
							if event.interrupted then
								flyFrame5( fly, event )
								return 
							else
								fly:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								fly:setLeftRight( 0, 0, 84, 180 )
								fly:setTopBottom( 0, 0, -18, 78 )
								fly:registerEventHandler( "transition_complete_keyframe", flyFrame5 )
							end
						end
						
						if event.interrupted then
							flyFrame4( fly, event )
							return 
						else
							fly:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							fly:setLeftRight( 0, 0, 20, 116 )
							fly:setTopBottom( 0, 0, 0, 96 )
							fly:registerEventHandler( "transition_complete_keyframe", flyFrame4 )
						end
					end
					
					if event.interrupted then
						flyFrame3( fly, event )
						return 
					else
						fly:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						fly:setLeftRight( 0, 0, 36, 132 )
						fly:setTopBottom( 0, 0, -21, 75 )
						fly:registerEventHandler( "transition_complete_keyframe", flyFrame3 )
					end
				end
				
				fly:completeAnimation()
				self.fly:setLeftRight( 0, 0, 18, 114 )
				self.fly:setTopBottom( 0, 0, -69, 27 )
				flyFrame2( fly, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

