-- c40292eec78f9656b4d9a6b2d4f5819a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget" )

CoD.MapWidgetContainer = InheritFrom( LUI.UIElement )
CoD.MapWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapWidgetContainer )
	self.id = "MapWidgetContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 283 )
	self:setTopBottom( true, false, 0, 204 )
	self.anyChildUsesUpdateState = true
	
	local MapWidget = CoD.MapWidget.new( menu, controller )
	MapWidget:setLeftRight( true, false, 0, 283 )
	MapWidget:setTopBottom( true, false, 0, 204 )
	MapWidget:setXRot( -17 )
	MapWidget:setYRot( 21 )
	MapWidget:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( MapWidget )
	self.MapWidget = MapWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				MapWidget:completeAnimation()
				self.clipFinished( MapWidget, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 1 )
				local MapWidgetFrame2 = function ( MapWidget, event )
					local MapWidgetFrame3 = function ( MapWidget, event )
						local MapWidgetFrame4 = function ( MapWidget, event )
							local MapWidgetFrame5 = function ( MapWidget, event )
								local MapWidgetFrame6 = function ( MapWidget, event )
									local MapWidgetFrame7 = function ( MapWidget, event )
										local MapWidgetFrame8 = function ( MapWidget, event )
											local MapWidgetFrame9 = function ( MapWidget, event )
												local MapWidgetFrame10 = function ( MapWidget, event )
													local MapWidgetFrame11 = function ( MapWidget, event )
														local MapWidgetFrame12 = function ( MapWidget, event )
															local MapWidgetFrame13 = function ( MapWidget, event )
																local MapWidgetFrame14 = function ( MapWidget, event )
																	local MapWidgetFrame15 = function ( MapWidget, event )
																		local MapWidgetFrame16 = function ( MapWidget, event )
																			local MapWidgetFrame17 = function ( MapWidget, event )
																				local MapWidgetFrame18 = function ( MapWidget, event )
																					local MapWidgetFrame19 = function ( MapWidget, event )
																						local MapWidgetFrame20 = function ( MapWidget, event )
																							local MapWidgetFrame21 = function ( MapWidget, event )
																								local MapWidgetFrame22 = function ( MapWidget, event )
																									local MapWidgetFrame23 = function ( MapWidget, event )
																										if not event.interrupted then
																											MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										end
																										if event.interrupted then
																											self.clipFinished( MapWidget, event )
																										else
																											MapWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										MapWidgetFrame23( MapWidget, event )
																										return 
																									else
																										MapWidget:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																										MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									MapWidgetFrame22( MapWidget, event )
																									return 
																								else
																									MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																									MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								MapWidgetFrame21( MapWidget, event )
																								return 
																							else
																								MapWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																								MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							MapWidgetFrame20( MapWidget, event )
																							return 
																						else
																							MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																							MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MapWidgetFrame19( MapWidget, event )
																						return 
																					else
																						MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MapWidgetFrame18( MapWidget, event )
																					return 
																				else
																					MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MapWidgetFrame17( MapWidget, event )
																				return 
																			else
																				MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MapWidgetFrame16( MapWidget, event )
																			return 
																		else
																			MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MapWidgetFrame15( MapWidget, event )
																		return 
																	else
																		MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame15 )
																	end
																end
																
																if event.interrupted then
																	MapWidgetFrame14( MapWidget, event )
																	return 
																else
																	MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame14 )
																end
															end
															
															if event.interrupted then
																MapWidgetFrame13( MapWidget, event )
																return 
															else
																MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame13 )
															end
														end
														
														if event.interrupted then
															MapWidgetFrame12( MapWidget, event )
															return 
														else
															MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame12 )
														end
													end
													
													if event.interrupted then
														MapWidgetFrame11( MapWidget, event )
														return 
													else
														MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame11 )
													end
												end
												
												if event.interrupted then
													MapWidgetFrame10( MapWidget, event )
													return 
												else
													MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame10 )
												end
											end
											
											if event.interrupted then
												MapWidgetFrame9( MapWidget, event )
												return 
											else
												MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame9 )
											end
										end
										
										if event.interrupted then
											MapWidgetFrame8( MapWidget, event )
											return 
										else
											MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame8 )
										end
									end
									
									if event.interrupted then
										MapWidgetFrame7( MapWidget, event )
										return 
									else
										MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame7 )
									end
								end
								
								if event.interrupted then
									MapWidgetFrame6( MapWidget, event )
									return 
								else
									MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame6 )
								end
							end
							
							if event.interrupted then
								MapWidgetFrame5( MapWidget, event )
								return 
							else
								MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							MapWidgetFrame4( MapWidget, event )
							return 
						else
							MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						MapWidgetFrame3( MapWidget, event )
						return 
					else
						MapWidget:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame3 )
					end
				end
				
				MapWidget:completeAnimation()
				MapWidgetFrame2( MapWidget, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 1 )
				local MapWidgetFrame2 = function ( MapWidget, event )
					local MapWidgetFrame3 = function ( MapWidget, event )
						local MapWidgetFrame4 = function ( MapWidget, event )
							local MapWidgetFrame5 = function ( MapWidget, event )
								local MapWidgetFrame6 = function ( MapWidget, event )
									local MapWidgetFrame7 = function ( MapWidget, event )
										local MapWidgetFrame8 = function ( MapWidget, event )
											local MapWidgetFrame9 = function ( MapWidget, event )
												local MapWidgetFrame10 = function ( MapWidget, event )
													local MapWidgetFrame11 = function ( MapWidget, event )
														local MapWidgetFrame12 = function ( MapWidget, event )
															local MapWidgetFrame13 = function ( MapWidget, event )
																local MapWidgetFrame14 = function ( MapWidget, event )
																	local MapWidgetFrame15 = function ( MapWidget, event )
																		local MapWidgetFrame16 = function ( MapWidget, event )
																			local MapWidgetFrame17 = function ( MapWidget, event )
																				local MapWidgetFrame18 = function ( MapWidget, event )
																					local MapWidgetFrame19 = function ( MapWidget, event )
																						local MapWidgetFrame20 = function ( MapWidget, event )
																							local MapWidgetFrame21 = function ( MapWidget, event )
																								local MapWidgetFrame22 = function ( MapWidget, event )
																									local MapWidgetFrame23 = function ( MapWidget, event )
																										local MapWidgetFrame24 = function ( MapWidget, event )
																											local MapWidgetFrame25 = function ( MapWidget, event )
																												local MapWidgetFrame26 = function ( MapWidget, event )
																													local MapWidgetFrame27 = function ( MapWidget, event )
																														local MapWidgetFrame28 = function ( MapWidget, event )
																															local MapWidgetFrame29 = function ( MapWidget, event )
																																if not event.interrupted then
																																	MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																end
																																if event.interrupted then
																																	self.clipFinished( MapWidget, event )
																																else
																																	MapWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																MapWidgetFrame29( MapWidget, event )
																																return 
																															else
																																MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															MapWidgetFrame28( MapWidget, event )
																															return 
																														else
																															MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														MapWidgetFrame27( MapWidget, event )
																														return 
																													else
																														MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													MapWidgetFrame26( MapWidget, event )
																													return 
																												else
																													MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																													MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												MapWidgetFrame25( MapWidget, event )
																												return 
																											else
																												MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											MapWidgetFrame24( MapWidget, event )
																											return 
																										else
																											MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										MapWidgetFrame23( MapWidget, event )
																										return 
																									else
																										MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									MapWidgetFrame22( MapWidget, event )
																									return 
																								else
																									MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																									MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								MapWidgetFrame21( MapWidget, event )
																								return 
																							else
																								MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							MapWidgetFrame20( MapWidget, event )
																							return 
																						else
																							MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MapWidgetFrame19( MapWidget, event )
																						return 
																					else
																						MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MapWidgetFrame18( MapWidget, event )
																					return 
																				else
																					MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MapWidgetFrame17( MapWidget, event )
																				return 
																			else
																				MapWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																				MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MapWidgetFrame16( MapWidget, event )
																			return 
																		else
																			MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MapWidgetFrame15( MapWidget, event )
																		return 
																	else
																		MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame15 )
																	end
																end
																
																if event.interrupted then
																	MapWidgetFrame14( MapWidget, event )
																	return 
																else
																	MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame14 )
																end
															end
															
															if event.interrupted then
																MapWidgetFrame13( MapWidget, event )
																return 
															else
																MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame13 )
															end
														end
														
														if event.interrupted then
															MapWidgetFrame12( MapWidget, event )
															return 
														else
															MapWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame12 )
														end
													end
													
													if event.interrupted then
														MapWidgetFrame11( MapWidget, event )
														return 
													else
														MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame11 )
													end
												end
												
												if event.interrupted then
													MapWidgetFrame10( MapWidget, event )
													return 
												else
													MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame10 )
												end
											end
											
											if event.interrupted then
												MapWidgetFrame9( MapWidget, event )
												return 
											else
												MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame9 )
											end
										end
										
										if event.interrupted then
											MapWidgetFrame8( MapWidget, event )
											return 
										else
											MapWidget:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame8 )
										end
									end
									
									if event.interrupted then
										MapWidgetFrame7( MapWidget, event )
										return 
									else
										MapWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame7 )
									end
								end
								
								if event.interrupted then
									MapWidgetFrame6( MapWidget, event )
									return 
								else
									MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame6 )
								end
							end
							
							if event.interrupted then
								MapWidgetFrame5( MapWidget, event )
								return 
							else
								MapWidget:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							MapWidgetFrame4( MapWidget, event )
							return 
						else
							MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						MapWidgetFrame3( MapWidget, event )
						return 
					else
						MapWidget:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame3 )
					end
				end
				
				MapWidget:completeAnimation()
				MapWidgetFrame2( MapWidget, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				MapWidget:completeAnimation()
				self.clipFinished( MapWidget, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 1 )
				local MapWidgetFrame2 = function ( MapWidget, event )
					local MapWidgetFrame3 = function ( MapWidget, event )
						local MapWidgetFrame4 = function ( MapWidget, event )
							local MapWidgetFrame5 = function ( MapWidget, event )
								local MapWidgetFrame6 = function ( MapWidget, event )
									local MapWidgetFrame7 = function ( MapWidget, event )
										local MapWidgetFrame8 = function ( MapWidget, event )
											local MapWidgetFrame9 = function ( MapWidget, event )
												local MapWidgetFrame10 = function ( MapWidget, event )
													local MapWidgetFrame11 = function ( MapWidget, event )
														local MapWidgetFrame12 = function ( MapWidget, event )
															local MapWidgetFrame13 = function ( MapWidget, event )
																local MapWidgetFrame14 = function ( MapWidget, event )
																	local MapWidgetFrame15 = function ( MapWidget, event )
																		local MapWidgetFrame16 = function ( MapWidget, event )
																			local MapWidgetFrame17 = function ( MapWidget, event )
																				local MapWidgetFrame18 = function ( MapWidget, event )
																					local MapWidgetFrame19 = function ( MapWidget, event )
																						local MapWidgetFrame20 = function ( MapWidget, event )
																							local MapWidgetFrame21 = function ( MapWidget, event )
																								local MapWidgetFrame22 = function ( MapWidget, event )
																									local MapWidgetFrame23 = function ( MapWidget, event )
																										if not event.interrupted then
																											MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										end
																										if event.interrupted then
																											self.clipFinished( MapWidget, event )
																										else
																											MapWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										MapWidgetFrame23( MapWidget, event )
																										return 
																									else
																										MapWidget:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																										MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									MapWidgetFrame22( MapWidget, event )
																									return 
																								else
																									MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																									MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								MapWidgetFrame21( MapWidget, event )
																								return 
																							else
																								MapWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																								MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							MapWidgetFrame20( MapWidget, event )
																							return 
																						else
																							MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																							MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MapWidgetFrame19( MapWidget, event )
																						return 
																					else
																						MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MapWidgetFrame18( MapWidget, event )
																					return 
																				else
																					MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MapWidgetFrame17( MapWidget, event )
																				return 
																			else
																				MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MapWidgetFrame16( MapWidget, event )
																			return 
																		else
																			MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MapWidgetFrame15( MapWidget, event )
																		return 
																	else
																		MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame15 )
																	end
																end
																
																if event.interrupted then
																	MapWidgetFrame14( MapWidget, event )
																	return 
																else
																	MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame14 )
																end
															end
															
															if event.interrupted then
																MapWidgetFrame13( MapWidget, event )
																return 
															else
																MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame13 )
															end
														end
														
														if event.interrupted then
															MapWidgetFrame12( MapWidget, event )
															return 
														else
															MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame12 )
														end
													end
													
													if event.interrupted then
														MapWidgetFrame11( MapWidget, event )
														return 
													else
														MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame11 )
													end
												end
												
												if event.interrupted then
													MapWidgetFrame10( MapWidget, event )
													return 
												else
													MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame10 )
												end
											end
											
											if event.interrupted then
												MapWidgetFrame9( MapWidget, event )
												return 
											else
												MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame9 )
											end
										end
										
										if event.interrupted then
											MapWidgetFrame8( MapWidget, event )
											return 
										else
											MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame8 )
										end
									end
									
									if event.interrupted then
										MapWidgetFrame7( MapWidget, event )
										return 
									else
										MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame7 )
									end
								end
								
								if event.interrupted then
									MapWidgetFrame6( MapWidget, event )
									return 
								else
									MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame6 )
								end
							end
							
							if event.interrupted then
								MapWidgetFrame5( MapWidget, event )
								return 
							else
								MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							MapWidgetFrame4( MapWidget, event )
							return 
						else
							MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						MapWidgetFrame3( MapWidget, event )
						return 
					else
						MapWidget:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame3 )
					end
				end
				
				MapWidget:completeAnimation()
				MapWidgetFrame2( MapWidget, {} )
			end
		},
		HudStop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				MapWidget:completeAnimation()
				self.clipFinished( MapWidget, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 1 )
				local MapWidgetFrame2 = function ( MapWidget, event )
					local MapWidgetFrame3 = function ( MapWidget, event )
						local MapWidgetFrame4 = function ( MapWidget, event )
							local MapWidgetFrame5 = function ( MapWidget, event )
								local MapWidgetFrame6 = function ( MapWidget, event )
									local MapWidgetFrame7 = function ( MapWidget, event )
										local MapWidgetFrame8 = function ( MapWidget, event )
											local MapWidgetFrame9 = function ( MapWidget, event )
												local MapWidgetFrame10 = function ( MapWidget, event )
													local MapWidgetFrame11 = function ( MapWidget, event )
														local MapWidgetFrame12 = function ( MapWidget, event )
															local MapWidgetFrame13 = function ( MapWidget, event )
																local MapWidgetFrame14 = function ( MapWidget, event )
																	local MapWidgetFrame15 = function ( MapWidget, event )
																		local MapWidgetFrame16 = function ( MapWidget, event )
																			local MapWidgetFrame17 = function ( MapWidget, event )
																				local MapWidgetFrame18 = function ( MapWidget, event )
																					local MapWidgetFrame19 = function ( MapWidget, event )
																						local MapWidgetFrame20 = function ( MapWidget, event )
																							local MapWidgetFrame21 = function ( MapWidget, event )
																								local MapWidgetFrame22 = function ( MapWidget, event )
																									local MapWidgetFrame23 = function ( MapWidget, event )
																										local MapWidgetFrame24 = function ( MapWidget, event )
																											local MapWidgetFrame25 = function ( MapWidget, event )
																												local MapWidgetFrame26 = function ( MapWidget, event )
																													local MapWidgetFrame27 = function ( MapWidget, event )
																														local MapWidgetFrame28 = function ( MapWidget, event )
																															local MapWidgetFrame29 = function ( MapWidget, event )
																																if not event.interrupted then
																																	MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																end
																																if event.interrupted then
																																	self.clipFinished( MapWidget, event )
																																else
																																	MapWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																MapWidgetFrame29( MapWidget, event )
																																return 
																															else
																																MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															MapWidgetFrame28( MapWidget, event )
																															return 
																														else
																															MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														MapWidgetFrame27( MapWidget, event )
																														return 
																													else
																														MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													MapWidgetFrame26( MapWidget, event )
																													return 
																												else
																													MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																													MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												MapWidgetFrame25( MapWidget, event )
																												return 
																											else
																												MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											MapWidgetFrame24( MapWidget, event )
																											return 
																										else
																											MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										MapWidgetFrame23( MapWidget, event )
																										return 
																									else
																										MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									MapWidgetFrame22( MapWidget, event )
																									return 
																								else
																									MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																									MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								MapWidgetFrame21( MapWidget, event )
																								return 
																							else
																								MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							MapWidgetFrame20( MapWidget, event )
																							return 
																						else
																							MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MapWidgetFrame19( MapWidget, event )
																						return 
																					else
																						MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MapWidgetFrame18( MapWidget, event )
																					return 
																				else
																					MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MapWidgetFrame17( MapWidget, event )
																				return 
																			else
																				MapWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																				MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MapWidgetFrame16( MapWidget, event )
																			return 
																		else
																			MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MapWidgetFrame15( MapWidget, event )
																		return 
																	else
																		MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame15 )
																	end
																end
																
																if event.interrupted then
																	MapWidgetFrame14( MapWidget, event )
																	return 
																else
																	MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame14 )
																end
															end
															
															if event.interrupted then
																MapWidgetFrame13( MapWidget, event )
																return 
															else
																MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame13 )
															end
														end
														
														if event.interrupted then
															MapWidgetFrame12( MapWidget, event )
															return 
														else
															MapWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame12 )
														end
													end
													
													if event.interrupted then
														MapWidgetFrame11( MapWidget, event )
														return 
													else
														MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame11 )
													end
												end
												
												if event.interrupted then
													MapWidgetFrame10( MapWidget, event )
													return 
												else
													MapWidget:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame10 )
												end
											end
											
											if event.interrupted then
												MapWidgetFrame9( MapWidget, event )
												return 
											else
												MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame9 )
											end
										end
										
										if event.interrupted then
											MapWidgetFrame8( MapWidget, event )
											return 
										else
											MapWidget:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame8 )
										end
									end
									
									if event.interrupted then
										MapWidgetFrame7( MapWidget, event )
										return 
									else
										MapWidget:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame7 )
									end
								end
								
								if event.interrupted then
									MapWidgetFrame6( MapWidget, event )
									return 
								else
									MapWidget:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame6 )
								end
							end
							
							if event.interrupted then
								MapWidgetFrame5( MapWidget, event )
								return 
							else
								MapWidget:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							MapWidgetFrame4( MapWidget, event )
							return 
						else
							MapWidget:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						MapWidgetFrame3( MapWidget, event )
						return 
					else
						MapWidget:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						MapWidget:registerEventHandler( "transition_complete_keyframe", MapWidgetFrame3 )
					end
				end
				
				MapWidget:completeAnimation()
				MapWidgetFrame2( MapWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MapWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

