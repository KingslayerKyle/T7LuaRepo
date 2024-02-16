-- 1fa2abb373ab9523c8776a6ae6dd425e
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_sentinel_outOfRangeLabels = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_outOfRangeLabels.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_outOfRangeLabels )
	self.id = "vhud_sentinel_outOfRangeLabels"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 527 )
	self:setTopBottom( true, false, 0, 245 )
	
	local outOfRangeLabel = LUI.UITightText.new()
	outOfRangeLabel:setLeftRight( false, false, -263.4, 263.4 )
	outOfRangeLabel:setTopBottom( true, false, 215, 245 )
	outOfRangeLabel:setRGB( 1, 0, 0 )
	outOfRangeLabel:setAlpha( 0 )
	outOfRangeLabel:setText( Engine.Localize( "CPUI_LEAVING_OPERATIONAL_RANGE" ) )
	outOfRangeLabel:setTTF( "fonts/default.ttf" )
	outOfRangeLabel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	outOfRangeLabel:setShaderVector( 0, 0.2, 0, 0, 0 )
	outOfRangeLabel:setShaderVector( 1, 0, 0, 0, 0 )
	outOfRangeLabel:setShaderVector( 2, 0, 0, 0, 0 )
	outOfRangeLabel:setShaderVector( 3, 0, 0, 0, 0 )
	outOfRangeLabel:setShaderVector( 4, 0, 0, 0, 0 )
	outOfRangeLabel:setLetterSpacing( 6.7 )
	self:addElement( outOfRangeLabel )
	self.outOfRangeLabel = outOfRangeLabel
	
	local outOfRangeTitle = LUI.UITightText.new()
	outOfRangeTitle:setLeftRight( false, false, -117.2, 117.2 )
	outOfRangeTitle:setTopBottom( true, false, 0, 30 )
	outOfRangeTitle:setRGB( 1, 0, 0 )
	outOfRangeTitle:setAlpha( 0 )
	outOfRangeTitle:setText( Engine.Localize( "CPUI_LINK_ERROR" ) )
	outOfRangeTitle:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	outOfRangeTitle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	outOfRangeTitle:setShaderVector( 0, 0.2, 0, 0, 0 )
	outOfRangeTitle:setShaderVector( 1, 0, 0, 0, 0 )
	outOfRangeTitle:setShaderVector( 2, 0, 0, 0, 0 )
	outOfRangeTitle:setShaderVector( 3, 0, 0, 0, 0 )
	outOfRangeTitle:setShaderVector( 4, 0, 0, 0, 0 )
	outOfRangeTitle:setLetterSpacing( 8.6 )
	self:addElement( outOfRangeTitle )
	self.outOfRangeTitle = outOfRangeTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				outOfRangeLabel:completeAnimation()
				self.outOfRangeLabel:setAlpha( 0 )
				self.clipFinished( outOfRangeLabel, {} )

				outOfRangeTitle:completeAnimation()
				self.outOfRangeTitle:setAlpha( 0 )
				self.clipFinished( outOfRangeTitle, {} )
			end
		},
		LeavingOperationalZone = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local outOfRangeLabelFrame2 = function ( outOfRangeLabel, event )
					local outOfRangeLabelFrame3 = function ( outOfRangeLabel, event )
						local outOfRangeLabelFrame4 = function ( outOfRangeLabel, event )
							local outOfRangeLabelFrame5 = function ( outOfRangeLabel, event )
								local outOfRangeLabelFrame6 = function ( outOfRangeLabel, event )
									local outOfRangeLabelFrame7 = function ( outOfRangeLabel, event )
										local outOfRangeLabelFrame8 = function ( outOfRangeLabel, event )
											local outOfRangeLabelFrame9 = function ( outOfRangeLabel, event )
												local outOfRangeLabelFrame10 = function ( outOfRangeLabel, event )
													local outOfRangeLabelFrame11 = function ( outOfRangeLabel, event )
														local outOfRangeLabelFrame12 = function ( outOfRangeLabel, event )
															local outOfRangeLabelFrame13 = function ( outOfRangeLabel, event )
																local outOfRangeLabelFrame14 = function ( outOfRangeLabel, event )
																	local outOfRangeLabelFrame15 = function ( outOfRangeLabel, event )
																		local outOfRangeLabelFrame16 = function ( outOfRangeLabel, event )
																			local outOfRangeLabelFrame17 = function ( outOfRangeLabel, event )
																				if not event.interrupted then
																					outOfRangeLabel:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				end
																				outOfRangeLabel:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( outOfRangeLabel, event )
																				else
																					outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				outOfRangeLabelFrame17( outOfRangeLabel, event )
																				return 
																			else
																				outOfRangeLabel:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																				outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			outOfRangeLabelFrame16( outOfRangeLabel, event )
																			return 
																		else
																			outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			outOfRangeLabel:setAlpha( 0.4 )
																			outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		outOfRangeLabelFrame15( outOfRangeLabel, event )
																		return 
																	else
																		outOfRangeLabel:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
																		outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame15 )
																	end
																end
																
																if event.interrupted then
																	outOfRangeLabelFrame14( outOfRangeLabel, event )
																	return 
																else
																	outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	outOfRangeLabel:setAlpha( 1 )
																	outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame14 )
																end
															end
															
															if event.interrupted then
																outOfRangeLabelFrame13( outOfRangeLabel, event )
																return 
															else
																outOfRangeLabel:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame13 )
															end
														end
														
														if event.interrupted then
															outOfRangeLabelFrame12( outOfRangeLabel, event )
															return 
														else
															outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															outOfRangeLabel:setAlpha( 0.4 )
															outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame12 )
														end
													end
													
													if event.interrupted then
														outOfRangeLabelFrame11( outOfRangeLabel, event )
														return 
													else
														outOfRangeLabel:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
														outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame11 )
													end
												end
												
												if event.interrupted then
													outOfRangeLabelFrame10( outOfRangeLabel, event )
													return 
												else
													outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													outOfRangeLabel:setAlpha( 1 )
													outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame10 )
												end
											end
											
											if event.interrupted then
												outOfRangeLabelFrame9( outOfRangeLabel, event )
												return 
											else
												outOfRangeLabel:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
												outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame9 )
											end
										end
										
										if event.interrupted then
											outOfRangeLabelFrame8( outOfRangeLabel, event )
											return 
										else
											outOfRangeLabel:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											outOfRangeLabel:setAlpha( 0.4 )
											outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame8 )
										end
									end
									
									if event.interrupted then
										outOfRangeLabelFrame7( outOfRangeLabel, event )
										return 
									else
										outOfRangeLabel:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
										outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame7 )
									end
								end
								
								if event.interrupted then
									outOfRangeLabelFrame6( outOfRangeLabel, event )
									return 
								else
									outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									outOfRangeLabel:setAlpha( 1 )
									outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame6 )
								end
							end
							
							if event.interrupted then
								outOfRangeLabelFrame5( outOfRangeLabel, event )
								return 
							else
								outOfRangeLabel:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame5 )
							end
						end
						
						if event.interrupted then
							outOfRangeLabelFrame4( outOfRangeLabel, event )
							return 
						else
							outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							outOfRangeLabel:setAlpha( 0.4 )
							outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame4 )
						end
					end
					
					if event.interrupted then
						outOfRangeLabelFrame3( outOfRangeLabel, event )
						return 
					else
						outOfRangeLabel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame3 )
					end
				end
				
				outOfRangeLabel:completeAnimation()
				self.outOfRangeLabel:setAlpha( 1 )
				outOfRangeLabelFrame2( outOfRangeLabel, {} )
				local outOfRangeTitleFrame2 = function ( outOfRangeTitle, event )
					local outOfRangeTitleFrame3 = function ( outOfRangeTitle, event )
						local outOfRangeTitleFrame4 = function ( outOfRangeTitle, event )
							local outOfRangeTitleFrame5 = function ( outOfRangeTitle, event )
								local outOfRangeTitleFrame6 = function ( outOfRangeTitle, event )
									local outOfRangeTitleFrame7 = function ( outOfRangeTitle, event )
										local outOfRangeTitleFrame8 = function ( outOfRangeTitle, event )
											local outOfRangeTitleFrame9 = function ( outOfRangeTitle, event )
												local outOfRangeTitleFrame10 = function ( outOfRangeTitle, event )
													local outOfRangeTitleFrame11 = function ( outOfRangeTitle, event )
														local outOfRangeTitleFrame12 = function ( outOfRangeTitle, event )
															local outOfRangeTitleFrame13 = function ( outOfRangeTitle, event )
																local outOfRangeTitleFrame14 = function ( outOfRangeTitle, event )
																	local outOfRangeTitleFrame15 = function ( outOfRangeTitle, event )
																		local outOfRangeTitleFrame16 = function ( outOfRangeTitle, event )
																			local outOfRangeTitleFrame17 = function ( outOfRangeTitle, event )
																				local outOfRangeTitleFrame18 = function ( outOfRangeTitle, event )
																					local outOfRangeTitleFrame19 = function ( outOfRangeTitle, event )
																						local outOfRangeTitleFrame20 = function ( outOfRangeTitle, event )
																							local outOfRangeTitleFrame21 = function ( outOfRangeTitle, event )
																								local outOfRangeTitleFrame22 = function ( outOfRangeTitle, event )
																									local outOfRangeTitleFrame23 = function ( outOfRangeTitle, event )
																										local outOfRangeTitleFrame24 = function ( outOfRangeTitle, event )
																											local outOfRangeTitleFrame25 = function ( outOfRangeTitle, event )
																												local outOfRangeTitleFrame26 = function ( outOfRangeTitle, event )
																													local outOfRangeTitleFrame27 = function ( outOfRangeTitle, event )
																														local outOfRangeTitleFrame28 = function ( outOfRangeTitle, event )
																															local outOfRangeTitleFrame29 = function ( outOfRangeTitle, event )
																																local outOfRangeTitleFrame30 = function ( outOfRangeTitle, event )
																																	if not event.interrupted then
																																		outOfRangeTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																	end
																																	outOfRangeTitle:setAlpha( 1 )
																																	if event.interrupted then
																																		self.clipFinished( outOfRangeTitle, event )
																																	else
																																		outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																	end
																																end
																																
																																if event.interrupted then
																																	outOfRangeTitleFrame30( outOfRangeTitle, event )
																																	return 
																																else
																																	outOfRangeTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																	outOfRangeTitle:setAlpha( 0.93 )
																																	outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																outOfRangeTitleFrame29( outOfRangeTitle, event )
																																return 
																															else
																																outOfRangeTitle:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																																outOfRangeTitle:setAlpha( 0.84 )
																																outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															outOfRangeTitleFrame28( outOfRangeTitle, event )
																															return 
																														else
																															outOfRangeTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																															outOfRangeTitle:setAlpha( 1 )
																															outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														outOfRangeTitleFrame27( outOfRangeTitle, event )
																														return 
																													else
																														outOfRangeTitle:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																														outOfRangeTitle:setAlpha( 0.88 )
																														outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													outOfRangeTitleFrame26( outOfRangeTitle, event )
																													return 
																												else
																													outOfRangeTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																													outOfRangeTitle:setAlpha( 1 )
																													outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												outOfRangeTitleFrame25( outOfRangeTitle, event )
																												return 
																											else
																												outOfRangeTitle:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																												outOfRangeTitle:setAlpha( 0.92 )
																												outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											outOfRangeTitleFrame24( outOfRangeTitle, event )
																											return 
																										else
																											outOfRangeTitle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																											outOfRangeTitle:setAlpha( 1 )
																											outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										outOfRangeTitleFrame23( outOfRangeTitle, event )
																										return 
																									else
																										outOfRangeTitle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																										outOfRangeTitle:setAlpha( 0.73 )
																										outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									outOfRangeTitleFrame22( outOfRangeTitle, event )
																									return 
																								else
																									outOfRangeTitle:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																									outOfRangeTitle:setAlpha( 0.98 )
																									outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								outOfRangeTitleFrame21( outOfRangeTitle, event )
																								return 
																							else
																								outOfRangeTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								outOfRangeTitle:setAlpha( 0.84 )
																								outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							outOfRangeTitleFrame20( outOfRangeTitle, event )
																							return 
																						else
																							outOfRangeTitle:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																							outOfRangeTitle:setAlpha( 1 )
																							outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						outOfRangeTitleFrame19( outOfRangeTitle, event )
																						return 
																					else
																						outOfRangeTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						outOfRangeTitle:setAlpha( 0.93 )
																						outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					outOfRangeTitleFrame18( outOfRangeTitle, event )
																					return 
																				else
																					outOfRangeTitle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																					outOfRangeTitle:setAlpha( 1 )
																					outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				outOfRangeTitleFrame17( outOfRangeTitle, event )
																				return 
																			else
																				outOfRangeTitle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																				outOfRangeTitle:setAlpha( 0.85 )
																				outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			outOfRangeTitleFrame16( outOfRangeTitle, event )
																			return 
																		else
																			outOfRangeTitle:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																			outOfRangeTitle:setAlpha( 1 )
																			outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		outOfRangeTitleFrame15( outOfRangeTitle, event )
																		return 
																	else
																		outOfRangeTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																		outOfRangeTitle:setAlpha( 0.68 )
																		outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame15 )
																	end
																end
																
																if event.interrupted then
																	outOfRangeTitleFrame14( outOfRangeTitle, event )
																	return 
																else
																	outOfRangeTitle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																	outOfRangeTitle:setAlpha( 1 )
																	outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame14 )
																end
															end
															
															if event.interrupted then
																outOfRangeTitleFrame13( outOfRangeTitle, event )
																return 
															else
																outOfRangeTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																outOfRangeTitle:setAlpha( 0.59 )
																outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame13 )
															end
														end
														
														if event.interrupted then
															outOfRangeTitleFrame12( outOfRangeTitle, event )
															return 
														else
															outOfRangeTitle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
															outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame12 )
														end
													end
													
													if event.interrupted then
														outOfRangeTitleFrame11( outOfRangeTitle, event )
														return 
													else
														outOfRangeTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														outOfRangeTitle:setAlpha( 1 )
														outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame11 )
													end
												end
												
												if event.interrupted then
													outOfRangeTitleFrame10( outOfRangeTitle, event )
													return 
												else
													outOfRangeTitle:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
													outOfRangeTitle:setAlpha( 0.84 )
													outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame10 )
												end
											end
											
											if event.interrupted then
												outOfRangeTitleFrame9( outOfRangeTitle, event )
												return 
											else
												outOfRangeTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												outOfRangeTitle:setAlpha( 1 )
												outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame9 )
											end
										end
										
										if event.interrupted then
											outOfRangeTitleFrame8( outOfRangeTitle, event )
											return 
										else
											outOfRangeTitle:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											outOfRangeTitle:setAlpha( 0.77 )
											outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame8 )
										end
									end
									
									if event.interrupted then
										outOfRangeTitleFrame7( outOfRangeTitle, event )
										return 
									else
										outOfRangeTitle:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
										outOfRangeTitle:setAlpha( 1 )
										outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame7 )
									end
								end
								
								if event.interrupted then
									outOfRangeTitleFrame6( outOfRangeTitle, event )
									return 
								else
									outOfRangeTitle:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									outOfRangeTitle:setAlpha( 0.81 )
									outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame6 )
								end
							end
							
							if event.interrupted then
								outOfRangeTitleFrame5( outOfRangeTitle, event )
								return 
							else
								outOfRangeTitle:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame5 )
							end
						end
						
						if event.interrupted then
							outOfRangeTitleFrame4( outOfRangeTitle, event )
							return 
						else
							outOfRangeTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							outOfRangeTitle:setAlpha( 1 )
							outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame4 )
						end
					end
					
					if event.interrupted then
						outOfRangeTitleFrame3( outOfRangeTitle, event )
						return 
					else
						outOfRangeTitle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						outOfRangeTitle:setAlpha( 0.86 )
						outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame3 )
					end
				end
				
				outOfRangeTitle:completeAnimation()
				self.outOfRangeTitle:setAlpha( 1 )
				outOfRangeTitleFrame2( outOfRangeTitle, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "LeavingOperationalZone",
			condition = function ( menu, element, event )
				return IsCampaign() and IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		}
	} )
	self:linkToElementModel( self, "outOfRange", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "outOfRange"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
