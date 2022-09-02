-- 0c1648dac451caf1e65153289f16963f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.CP_Prologue_FaceScannerDots = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScannerDots.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScannerDots )
	self.id = "CP_Prologue_FaceScannerDots"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 8 )
	self:setTopBottom( true, false, 0, 8 )
	
	local AbilityWheelPixel00 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel00:setLeftRight( false, false, -4, 4 )
	AbilityWheelPixel00:setTopBottom( false, false, -4, 4 )
	AbilityWheelPixel00.Image20:setAlpha( 0.7 )
	AbilityWheelPixel00.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel00 )
	self.AbilityWheelPixel00 = AbilityWheelPixel00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local AbilityWheelPixel00Frame2 = function ( AbilityWheelPixel00, event )
					local AbilityWheelPixel00Frame3 = function ( AbilityWheelPixel00, event )
						local AbilityWheelPixel00Frame4 = function ( AbilityWheelPixel00, event )
							local AbilityWheelPixel00Frame5 = function ( AbilityWheelPixel00, event )
								local AbilityWheelPixel00Frame6 = function ( AbilityWheelPixel00, event )
									local AbilityWheelPixel00Frame7 = function ( AbilityWheelPixel00, event )
										local AbilityWheelPixel00Frame8 = function ( AbilityWheelPixel00, event )
											local AbilityWheelPixel00Frame9 = function ( AbilityWheelPixel00, event )
												local AbilityWheelPixel00Frame10 = function ( AbilityWheelPixel00, event )
													local AbilityWheelPixel00Frame11 = function ( AbilityWheelPixel00, event )
														local AbilityWheelPixel00Frame12 = function ( AbilityWheelPixel00, event )
															local AbilityWheelPixel00Frame13 = function ( AbilityWheelPixel00, event )
																local AbilityWheelPixel00Frame14 = function ( AbilityWheelPixel00, event )
																	local AbilityWheelPixel00Frame15 = function ( AbilityWheelPixel00, event )
																		local AbilityWheelPixel00Frame16 = function ( AbilityWheelPixel00, event )
																			local AbilityWheelPixel00Frame17 = function ( AbilityWheelPixel00, event )
																				if not event.interrupted then
																					AbilityWheelPixel00:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
																				end
																				AbilityWheelPixel00:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( AbilityWheelPixel00, event )
																				else
																					AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				AbilityWheelPixel00Frame17( AbilityWheelPixel00, event )
																				return 
																			else
																				AbilityWheelPixel00:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																				AbilityWheelPixel00:setAlpha( 0 )
																				AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			AbilityWheelPixel00Frame16( AbilityWheelPixel00, event )
																			return 
																		else
																			AbilityWheelPixel00:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			AbilityWheelPixel00:setAlpha( 1 )
																			AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		AbilityWheelPixel00Frame15( AbilityWheelPixel00, event )
																		return 
																	else
																		AbilityWheelPixel00:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		AbilityWheelPixel00:setAlpha( 0 )
																		AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame15 )
																	end
																end
																
																if event.interrupted then
																	AbilityWheelPixel00Frame14( AbilityWheelPixel00, event )
																	return 
																else
																	AbilityWheelPixel00:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																	AbilityWheelPixel00:setAlpha( 1 )
																	AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame14 )
																end
															end
															
															if event.interrupted then
																AbilityWheelPixel00Frame13( AbilityWheelPixel00, event )
																return 
															else
																AbilityWheelPixel00:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																AbilityWheelPixel00:setAlpha( 0 )
																AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame13 )
															end
														end
														
														if event.interrupted then
															AbilityWheelPixel00Frame12( AbilityWheelPixel00, event )
															return 
														else
															AbilityWheelPixel00:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
															AbilityWheelPixel00:setAlpha( 1 )
															AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame12 )
														end
													end
													
													if event.interrupted then
														AbilityWheelPixel00Frame11( AbilityWheelPixel00, event )
														return 
													else
														AbilityWheelPixel00:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
														AbilityWheelPixel00:setAlpha( 0 )
														AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame11 )
													end
												end
												
												if event.interrupted then
													AbilityWheelPixel00Frame10( AbilityWheelPixel00, event )
													return 
												else
													AbilityWheelPixel00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
													AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityWheelPixel00Frame9( AbilityWheelPixel00, event )
												return 
											else
												AbilityWheelPixel00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
												AbilityWheelPixel00:setAlpha( 1 )
												AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityWheelPixel00Frame8( AbilityWheelPixel00, event )
											return 
										else
											AbilityWheelPixel00:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											AbilityWheelPixel00:setAlpha( 0 )
											AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityWheelPixel00Frame7( AbilityWheelPixel00, event )
										return 
									else
										AbilityWheelPixel00:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										AbilityWheelPixel00:setAlpha( 1 )
										AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityWheelPixel00Frame6( AbilityWheelPixel00, event )
									return 
								else
									AbilityWheelPixel00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
									AbilityWheelPixel00:setAlpha( 0 )
									AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelPixel00Frame5( AbilityWheelPixel00, event )
								return 
							else
								AbilityWheelPixel00:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								AbilityWheelPixel00:setAlpha( 0.48 )
								AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelPixel00Frame4( AbilityWheelPixel00, event )
							return 
						else
							AbilityWheelPixel00:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							AbilityWheelPixel00:setAlpha( 1 )
							AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel00Frame3( AbilityWheelPixel00, event )
						return 
					else
						AbilityWheelPixel00:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel00:setAlpha( 0 )
						AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame3 )
					end
				end
				
				AbilityWheelPixel00:completeAnimation()
				self.AbilityWheelPixel00:setAlpha( 1 )
				AbilityWheelPixel00Frame2( AbilityWheelPixel00, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Scanning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local AbilityWheelPixel00Frame2 = function ( AbilityWheelPixel00, event )
					local AbilityWheelPixel00Frame3 = function ( AbilityWheelPixel00, event )
						local AbilityWheelPixel00Frame4 = function ( AbilityWheelPixel00, event )
							local AbilityWheelPixel00Frame5 = function ( AbilityWheelPixel00, event )
								local AbilityWheelPixel00Frame6 = function ( AbilityWheelPixel00, event )
									local AbilityWheelPixel00Frame7 = function ( AbilityWheelPixel00, event )
										local AbilityWheelPixel00Frame8 = function ( AbilityWheelPixel00, event )
											local AbilityWheelPixel00Frame9 = function ( AbilityWheelPixel00, event )
												local AbilityWheelPixel00Frame10 = function ( AbilityWheelPixel00, event )
													local AbilityWheelPixel00Frame11 = function ( AbilityWheelPixel00, event )
														local AbilityWheelPixel00Frame12 = function ( AbilityWheelPixel00, event )
															local AbilityWheelPixel00Frame13 = function ( AbilityWheelPixel00, event )
																local AbilityWheelPixel00Frame14 = function ( AbilityWheelPixel00, event )
																	local AbilityWheelPixel00Frame15 = function ( AbilityWheelPixel00, event )
																		local AbilityWheelPixel00Frame16 = function ( AbilityWheelPixel00, event )
																			local AbilityWheelPixel00Frame17 = function ( AbilityWheelPixel00, event )
																				if not event.interrupted then
																					AbilityWheelPixel00:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
																				end
																				AbilityWheelPixel00:setLeftRight( false, false, 30, 38 )
																				AbilityWheelPixel00:setTopBottom( false, false, -25.04, -17.04 )
																				AbilityWheelPixel00:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( AbilityWheelPixel00, event )
																				else
																					AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				AbilityWheelPixel00Frame17( AbilityWheelPixel00, event )
																				return 
																			else
																				AbilityWheelPixel00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
																				AbilityWheelPixel00:setAlpha( 0 )
																				AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			AbilityWheelPixel00Frame16( AbilityWheelPixel00, event )
																			return 
																		else
																			AbilityWheelPixel00:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			AbilityWheelPixel00:setAlpha( 1 )
																			AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		AbilityWheelPixel00Frame15( AbilityWheelPixel00, event )
																		return 
																	else
																		AbilityWheelPixel00:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																		AbilityWheelPixel00:setAlpha( 0 )
																		AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame15 )
																	end
																end
																
																if event.interrupted then
																	AbilityWheelPixel00Frame14( AbilityWheelPixel00, event )
																	return 
																else
																	AbilityWheelPixel00:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	AbilityWheelPixel00:setAlpha( 1 )
																	AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame14 )
																end
															end
															
															if event.interrupted then
																AbilityWheelPixel00Frame13( AbilityWheelPixel00, event )
																return 
															else
																AbilityWheelPixel00:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																AbilityWheelPixel00:setAlpha( 0 )
																AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame13 )
															end
														end
														
														if event.interrupted then
															AbilityWheelPixel00Frame12( AbilityWheelPixel00, event )
															return 
														else
															AbilityWheelPixel00:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
															AbilityWheelPixel00:setAlpha( 1 )
															AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame12 )
														end
													end
													
													if event.interrupted then
														AbilityWheelPixel00Frame11( AbilityWheelPixel00, event )
														return 
													else
														AbilityWheelPixel00:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														AbilityWheelPixel00:setAlpha( 0 )
														AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame11 )
													end
												end
												
												if event.interrupted then
													AbilityWheelPixel00Frame10( AbilityWheelPixel00, event )
													return 
												else
													AbilityWheelPixel00:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													AbilityWheelPixel00:setAlpha( 1 )
													AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityWheelPixel00Frame9( AbilityWheelPixel00, event )
												return 
											else
												AbilityWheelPixel00:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												AbilityWheelPixel00:setAlpha( 0 )
												AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityWheelPixel00Frame8( AbilityWheelPixel00, event )
											return 
										else
											AbilityWheelPixel00:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											AbilityWheelPixel00:setAlpha( 1 )
											AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityWheelPixel00Frame7( AbilityWheelPixel00, event )
										return 
									else
										AbilityWheelPixel00:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										AbilityWheelPixel00:setAlpha( 0 )
										AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityWheelPixel00Frame6( AbilityWheelPixel00, event )
									return 
								else
									AbilityWheelPixel00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									AbilityWheelPixel00:setAlpha( 1 )
									AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelPixel00Frame5( AbilityWheelPixel00, event )
								return 
							else
								AbilityWheelPixel00:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								AbilityWheelPixel00:setAlpha( 0 )
								AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelPixel00Frame4( AbilityWheelPixel00, event )
							return 
						else
							AbilityWheelPixel00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							AbilityWheelPixel00:setAlpha( 1 )
							AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel00Frame3( AbilityWheelPixel00, event )
						return 
					else
						AbilityWheelPixel00:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel00:setAlpha( 0 )
						AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel00Frame3 )
					end
				end
				
				AbilityWheelPixel00:completeAnimation()
				self.AbilityWheelPixel00:setLeftRight( false, false, 30, 38 )
				self.AbilityWheelPixel00:setTopBottom( false, false, -25.04, -17.04 )
				self.AbilityWheelPixel00:setAlpha( 1 )
				AbilityWheelPixel00Frame2( AbilityWheelPixel00, {} )
			end
		},
		Failed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelPixel00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

