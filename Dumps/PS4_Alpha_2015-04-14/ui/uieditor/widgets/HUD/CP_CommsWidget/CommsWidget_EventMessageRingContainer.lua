require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_EventMessageRing" )

CoD.CommsWidget_EventMessageRingContainer = InheritFrom( LUI.UIElement )
CoD.CommsWidget_EventMessageRingContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_EventMessageRingContainer )
	self.id = "CommsWidget_EventMessageRingContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 104 )
	
	local CommsWidgetEventMessageRing0 = CoD.CommsWidget_EventMessageRing.new( menu, controller )
	CommsWidgetEventMessageRing0:setLeftRight( true, false, 0, 104 )
	CommsWidgetEventMessageRing0:setTopBottom( true, false, 0, 104 )
	CommsWidgetEventMessageRing0:setRGB( 1, 1, 1 )
	CommsWidgetEventMessageRing0:setZRot( 22.53 )
	CommsWidgetEventMessageRing0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CommsWidgetEventMessageRing0 )
	self.CommsWidgetEventMessageRing0 = CommsWidgetEventMessageRing0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local CommsWidgetEventMessageRing0Frame2 = function ( CommsWidgetEventMessageRing0, event )
					local CommsWidgetEventMessageRing0Frame3 = function ( CommsWidgetEventMessageRing0, event )
						local CommsWidgetEventMessageRing0Frame4 = function ( CommsWidgetEventMessageRing0, event )
							local CommsWidgetEventMessageRing0Frame5 = function ( CommsWidgetEventMessageRing0, event )
								local CommsWidgetEventMessageRing0Frame6 = function ( CommsWidgetEventMessageRing0, event )
									local CommsWidgetEventMessageRing0Frame7 = function ( CommsWidgetEventMessageRing0, event )
										local CommsWidgetEventMessageRing0Frame8 = function ( CommsWidgetEventMessageRing0, event )
											local CommsWidgetEventMessageRing0Frame9 = function ( CommsWidgetEventMessageRing0, event )
												local CommsWidgetEventMessageRing0Frame10 = function ( CommsWidgetEventMessageRing0, event )
													local CommsWidgetEventMessageRing0Frame11 = function ( CommsWidgetEventMessageRing0, event )
														local CommsWidgetEventMessageRing0Frame12 = function ( CommsWidgetEventMessageRing0, event )
															local CommsWidgetEventMessageRing0Frame13 = function ( CommsWidgetEventMessageRing0, event )
																local CommsWidgetEventMessageRing0Frame14 = function ( CommsWidgetEventMessageRing0, event )
																	local CommsWidgetEventMessageRing0Frame15 = function ( CommsWidgetEventMessageRing0, event )
																		local CommsWidgetEventMessageRing0Frame16 = function ( CommsWidgetEventMessageRing0, event )
																			local CommsWidgetEventMessageRing0Frame17 = function ( CommsWidgetEventMessageRing0, event )
																				if not event.interrupted then
																					CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 1380, false, false, CoD.TweenType.Linear )
																				end
																				CommsWidgetEventMessageRing0:setAlpha( 1 )
																				CommsWidgetEventMessageRing0:setZRot( 360 )
																				if event.interrupted then
																					self.clipFinished( CommsWidgetEventMessageRing0, event )
																				else
																					CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				CommsWidgetEventMessageRing0Frame17( CommsWidgetEventMessageRing0, event )
																				return 
																			else
																				CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																				CommsWidgetEventMessageRing0:setAlpha( 1 )
																				CommsWidgetEventMessageRing0:setZRot( 289.33 )
																				CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			CommsWidgetEventMessageRing0Frame16( CommsWidgetEventMessageRing0, event )
																			return 
																		else
																			CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																			CommsWidgetEventMessageRing0:setAlpha( 0.81 )
																			CommsWidgetEventMessageRing0:setZRot( 284.21 )
																			CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		CommsWidgetEventMessageRing0Frame15( CommsWidgetEventMessageRing0, event )
																		return 
																	else
																		CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 2010, false, false, CoD.TweenType.Linear )
																		CommsWidgetEventMessageRing0:setZRot( 271.41 )
																		CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame15 )
																	end
																end
																
																if event.interrupted then
																	CommsWidgetEventMessageRing0Frame14( CommsWidgetEventMessageRing0, event )
																	return 
																else
																	CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																	CommsWidgetEventMessageRing0:setAlpha( 1 )
																	CommsWidgetEventMessageRing0:setZRot( 168.48 )
																	CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame14 )
																end
															end
															
															if event.interrupted then
																CommsWidgetEventMessageRing0Frame13( CommsWidgetEventMessageRing0, event )
																return 
															else
																CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																CommsWidgetEventMessageRing0:setAlpha( 0.91 )
																CommsWidgetEventMessageRing0:setZRot( 163.87 )
																CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame13 )
															end
														end
														
														if event.interrupted then
															CommsWidgetEventMessageRing0Frame12( CommsWidgetEventMessageRing0, event )
															return 
														else
															CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 1210, false, false, CoD.TweenType.Linear )
															CommsWidgetEventMessageRing0:setZRot( 160.8 )
															CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame12 )
														end
													end
													
													if event.interrupted then
														CommsWidgetEventMessageRing0Frame11( CommsWidgetEventMessageRing0, event )
														return 
													else
														CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
														CommsWidgetEventMessageRing0:setAlpha( 1 )
														CommsWidgetEventMessageRing0:setZRot( 98.83 )
														CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame11 )
													end
												end
												
												if event.interrupted then
													CommsWidgetEventMessageRing0Frame10( CommsWidgetEventMessageRing0, event )
													return 
												else
													CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
													CommsWidgetEventMessageRing0:setAlpha( 0.84 )
													CommsWidgetEventMessageRing0:setZRot( 92.18 )
													CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame10 )
												end
											end
											
											if event.interrupted then
												CommsWidgetEventMessageRing0Frame9( CommsWidgetEventMessageRing0, event )
												return 
											else
												CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
												CommsWidgetEventMessageRing0:setZRot( 86.54 )
												CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame9 )
											end
										end
										
										if event.interrupted then
											CommsWidgetEventMessageRing0Frame8( CommsWidgetEventMessageRing0, event )
											return 
										else
											CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											CommsWidgetEventMessageRing0:setAlpha( 1 )
											CommsWidgetEventMessageRing0:setZRot( 39.94 )
											CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame8 )
										end
									end
									
									if event.interrupted then
										CommsWidgetEventMessageRing0Frame7( CommsWidgetEventMessageRing0, event )
										return 
									else
										CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										CommsWidgetEventMessageRing0:setAlpha( 0.83 )
										CommsWidgetEventMessageRing0:setZRot( 37.38 )
										CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame7 )
									end
								end
								
								if event.interrupted then
									CommsWidgetEventMessageRing0Frame6( CommsWidgetEventMessageRing0, event )
									return 
								else
									CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
									CommsWidgetEventMessageRing0:setZRot( 32.77 )
									CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame6 )
								end
							end
							
							if event.interrupted then
								CommsWidgetEventMessageRing0Frame5( CommsWidgetEventMessageRing0, event )
								return 
							else
								CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								CommsWidgetEventMessageRing0:setAlpha( 1 )
								CommsWidgetEventMessageRing0:setZRot( 18.44 )
								CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame5 )
							end
						end
						
						if event.interrupted then
							CommsWidgetEventMessageRing0Frame4( CommsWidgetEventMessageRing0, event )
							return 
						else
							CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							CommsWidgetEventMessageRing0:setAlpha( 0.73 )
							CommsWidgetEventMessageRing0:setZRot( 16.39 )
							CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame4 )
						end
					end
					
					if event.interrupted then
						CommsWidgetEventMessageRing0Frame3( CommsWidgetEventMessageRing0, event )
						return 
					else
						CommsWidgetEventMessageRing0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						CommsWidgetEventMessageRing0:setZRot( 14.85 )
						CommsWidgetEventMessageRing0:registerEventHandler( "transition_complete_keyframe", CommsWidgetEventMessageRing0Frame3 )
					end
				end
				
				CommsWidgetEventMessageRing0:completeAnimation()
				self.CommsWidgetEventMessageRing0:setAlpha( 1 )
				self.CommsWidgetEventMessageRing0:setZRot( 0 )
				CommsWidgetEventMessageRing0Frame2( CommsWidgetEventMessageRing0, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Fake = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.CommsWidgetEventMessageRing0:close()
		CoD.CommsWidget_EventMessageRingContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

