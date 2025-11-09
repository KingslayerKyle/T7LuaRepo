require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncher" )

CoD.SpikeLauncherContainer = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherContainer )
	self.id = "SpikeLauncherContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 326 )
	self:setTopBottom( true, false, 0, 268 )
	self.anyChildUsesUpdateState = true
	
	local SpikeLauncher = CoD.SpikeLauncher.new( menu, controller )
	SpikeLauncher:setLeftRight( true, false, 0, 326 )
	SpikeLauncher:setTopBottom( true, false, 0, 268 )
	SpikeLauncher:setRGB( 1, 1, 1 )
	SpikeLauncher:setAlpha( 0 )
	SpikeLauncher:setZoom( -75 )
	SpikeLauncher.SpikeLauncherLine:setAlpha( 0 )
	SpikeLauncher.AreaText.AreaLbl:setText( Engine.Localize( "33" ) )
	SpikeLauncher.DistanceText.DistanceLbl:setText( Engine.Localize( "243" ) )
	self:addElement( SpikeLauncher )
	self.SpikeLauncher = SpikeLauncher
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SpikeLauncher:completeAnimation()
				self.SpikeLauncher:setAlpha( 0 )
				self.clipFinished( SpikeLauncher, {} )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local SpikeLauncherFrame2 = function ( SpikeLauncher, event )
					local SpikeLauncherFrame3 = function ( SpikeLauncher, event )
						local SpikeLauncherFrame4 = function ( SpikeLauncher, event )
							local SpikeLauncherFrame5 = function ( SpikeLauncher, event )
								local SpikeLauncherFrame6 = function ( SpikeLauncher, event )
									local SpikeLauncherFrame7 = function ( SpikeLauncher, event )
										local SpikeLauncherFrame8 = function ( SpikeLauncher, event )
											local SpikeLauncherFrame9 = function ( SpikeLauncher, event )
												local SpikeLauncherFrame10 = function ( SpikeLauncher, event )
													local SpikeLauncherFrame11 = function ( SpikeLauncher, event )
														local SpikeLauncherFrame12 = function ( SpikeLauncher, event )
															local SpikeLauncherFrame13 = function ( SpikeLauncher, event )
																if not event.interrupted then
																	SpikeLauncher:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																	SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
																end
																SpikeLauncher:setAlpha( 1 )
																SpikeLauncher:setZoom( 0 )
																SpikeLauncher.SpikeLauncherLine:setAlpha( 1 )
																if event.interrupted then
																	self.clipFinished( SpikeLauncher, event )
																else
																	SpikeLauncher:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																SpikeLauncherFrame13( SpikeLauncher, event )
																return 
															else
																SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																SpikeLauncher.SpikeLauncherLine:setAlpha( 0 )
																SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame13 )
															end
														end
														
														if event.interrupted then
															SpikeLauncherFrame12( SpikeLauncher, event )
															return 
														else
															SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame12 )
														end
													end
													
													if event.interrupted then
														SpikeLauncherFrame11( SpikeLauncher, event )
														return 
													else
														SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														SpikeLauncher.SpikeLauncherLine:setAlpha( 1 )
														SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame11 )
													end
												end
												
												if event.interrupted then
													SpikeLauncherFrame10( SpikeLauncher, event )
													return 
												else
													SpikeLauncher:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame10 )
												end
											end
											
											if event.interrupted then
												SpikeLauncherFrame9( SpikeLauncher, event )
												return 
											else
												SpikeLauncher:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												SpikeLauncher:setAlpha( 1 )
												SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame9 )
											end
										end
										
										if event.interrupted then
											SpikeLauncherFrame8( SpikeLauncher, event )
											return 
										else
											SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											SpikeLauncher:setAlpha( 0.25 )
											SpikeLauncher.SpikeLauncherLine:setAlpha( 0 )
											SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame8 )
										end
									end
									
									if event.interrupted then
										SpikeLauncherFrame7( SpikeLauncher, event )
										return 
									else
										SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										SpikeLauncher:setAlpha( 0 )
										SpikeLauncher.SpikeLauncherLine:setAlpha( 0.5 )
										SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame7 )
									end
								end
								
								if event.interrupted then
									SpikeLauncherFrame6( SpikeLauncher, event )
									return 
								else
									SpikeLauncher:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									SpikeLauncher:setAlpha( 1 )
									SpikeLauncher:setZoom( 0 )
									SpikeLauncher.SpikeLauncherLine:setAlpha( 0.4 )
									SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame6 )
								end
							end
							
							if event.interrupted then
								SpikeLauncherFrame5( SpikeLauncher, event )
								return 
							else
								SpikeLauncher:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
								SpikeLauncher:setZoom( -2.5 )
								SpikeLauncher.SpikeLauncherLine:setAlpha( 0.3 )
								SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame5 )
							end
						end
						
						if event.interrupted then
							SpikeLauncherFrame4( SpikeLauncher, event )
							return 
						else
							SpikeLauncher:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
							SpikeLauncher:setAlpha( 0 )
							SpikeLauncher:setZoom( -7.5 )
							SpikeLauncher.SpikeLauncherLine:setAlpha( 0.1 )
							SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame4 )
						end
					end
					
					if event.interrupted then
						SpikeLauncherFrame3( SpikeLauncher, event )
						return 
					else
						SpikeLauncher:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						SpikeLauncher:setAlpha( 0.7 )
						SpikeLauncher:setZoom( -10 )
						SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame3 )
					end
				end
				
				SpikeLauncher:completeAnimation()
				SpikeLauncher.SpikeLauncherLine:completeAnimation()
				self.SpikeLauncher:setAlpha( 0 )
				self.SpikeLauncher:setZoom( -75 )
				self.SpikeLauncher.SpikeLauncherLine:setAlpha( 0 )
				SpikeLauncherFrame2( SpikeLauncher, {} )
			end
		},
		Off = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local SpikeLauncherFrame2 = function ( SpikeLauncher, event )
					local SpikeLauncherFrame3 = function ( SpikeLauncher, event )
						local SpikeLauncherFrame4 = function ( SpikeLauncher, event )
							local SpikeLauncherFrame5 = function ( SpikeLauncher, event )
								local SpikeLauncherFrame6 = function ( SpikeLauncher, event )
									local SpikeLauncherFrame7 = function ( SpikeLauncher, event )
										local SpikeLauncherFrame8 = function ( SpikeLauncher, event )
											local SpikeLauncherFrame9 = function ( SpikeLauncher, event )
												local SpikeLauncherFrame10 = function ( SpikeLauncher, event )
													local SpikeLauncherFrame11 = function ( SpikeLauncher, event )
														local SpikeLauncherFrame12 = function ( SpikeLauncher, event )
															local SpikeLauncherFrame13 = function ( SpikeLauncher, event )
																local SpikeLauncherFrame14 = function ( SpikeLauncher, event )
																	local SpikeLauncherFrame15 = function ( SpikeLauncher, event )
																		local SpikeLauncherFrame16 = function ( SpikeLauncher, event )
																			local SpikeLauncherFrame17 = function ( SpikeLauncher, event )
																				local SpikeLauncherFrame18 = function ( SpikeLauncher, event )
																					if not event.interrupted then
																						SpikeLauncher:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																						SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
																					end
																					SpikeLauncher:setAlpha( 0 )
																					SpikeLauncher:setZoom( 0 )
																					SpikeLauncher.SpikeLauncherLine:setAlpha( 0 )
																					if event.interrupted then
																						self.clipFinished( SpikeLauncher, event )
																					else
																						SpikeLauncher:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					SpikeLauncherFrame18( SpikeLauncher, event )
																					return 
																				else
																					SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					SpikeLauncher:setAlpha( 0.58 )
																					SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				SpikeLauncherFrame17( SpikeLauncher, event )
																				return 
																			else
																				SpikeLauncher:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			SpikeLauncherFrame16( SpikeLauncher, event )
																			return 
																		else
																			SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			SpikeLauncher:setAlpha( 0 )
																			SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		SpikeLauncherFrame15( SpikeLauncher, event )
																		return 
																	else
																		SpikeLauncher:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																		SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																		SpikeLauncher.SpikeLauncherLine:setAlpha( 0 )
																		SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame15 )
																	end
																end
																
																if event.interrupted then
																	SpikeLauncherFrame14( SpikeLauncher, event )
																	return 
																else
																	SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	SpikeLauncher:setAlpha( 0.6 )
																	SpikeLauncher.SpikeLauncherLine:setAlpha( 0.24 )
																	SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame14 )
																end
															end
															
															if event.interrupted then
																SpikeLauncherFrame13( SpikeLauncher, event )
																return 
															else
																SpikeLauncher:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																SpikeLauncher.SpikeLauncherLine:setAlpha( 0.36 )
																SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame13 )
															end
														end
														
														if event.interrupted then
															SpikeLauncherFrame12( SpikeLauncher, event )
															return 
														else
															SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															SpikeLauncher:setAlpha( 0 )
															SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame12 )
														end
													end
													
													if event.interrupted then
														SpikeLauncherFrame11( SpikeLauncher, event )
														return 
													else
														SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														SpikeLauncher:setAlpha( 1 )
														SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame11 )
													end
												end
												
												if event.interrupted then
													SpikeLauncherFrame10( SpikeLauncher, event )
													return 
												else
													SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													SpikeLauncher:setAlpha( 0 )
													SpikeLauncher.SpikeLauncherLine:setAlpha( 0.6 )
													SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame10 )
												end
											end
											
											if event.interrupted then
												SpikeLauncherFrame9( SpikeLauncher, event )
												return 
											else
												SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												SpikeLauncher:setAlpha( 0.5 )
												SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame9 )
											end
										end
										
										if event.interrupted then
											SpikeLauncherFrame8( SpikeLauncher, event )
											return 
										else
											SpikeLauncher:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
											SpikeLauncher.SpikeLauncherLine:setAlpha( 0 )
											SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame8 )
										end
									end
									
									if event.interrupted then
										SpikeLauncherFrame7( SpikeLauncher, event )
										return 
									else
										SpikeLauncher:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame7 )
									end
								end
								
								if event.interrupted then
									SpikeLauncherFrame6( SpikeLauncher, event )
									return 
								else
									SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									SpikeLauncher.SpikeLauncherLine:setAlpha( 0.5 )
									SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame6 )
								end
							end
							
							if event.interrupted then
								SpikeLauncherFrame5( SpikeLauncher, event )
								return 
							else
								SpikeLauncher:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame5 )
							end
						end
						
						if event.interrupted then
							SpikeLauncherFrame4( SpikeLauncher, event )
							return 
						else
							SpikeLauncher:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							SpikeLauncher.SpikeLauncherLine:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							SpikeLauncher.SpikeLauncherLine:setAlpha( 0 )
							SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame4 )
						end
					end
					
					if event.interrupted then
						SpikeLauncherFrame3( SpikeLauncher, event )
						return 
					else
						SpikeLauncher:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						SpikeLauncher:registerEventHandler( "transition_complete_keyframe", SpikeLauncherFrame3 )
					end
				end
				
				SpikeLauncher:completeAnimation()
				SpikeLauncher.SpikeLauncherLine:completeAnimation()
				self.SpikeLauncher:setAlpha( 1 )
				self.SpikeLauncher:setZoom( 0 )
				self.SpikeLauncher.SpikeLauncherLine:setAlpha( 1 )
				SpikeLauncherFrame2( SpikeLauncher, {} )
			end
		}
	}
	self.close = function ( self )
		self.SpikeLauncher:close()
		CoD.SpikeLauncherContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

