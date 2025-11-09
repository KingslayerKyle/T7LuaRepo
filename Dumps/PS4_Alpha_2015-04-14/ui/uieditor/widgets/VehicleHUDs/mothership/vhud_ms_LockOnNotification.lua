CoD.vhud_ms_LockOnNotification = InheritFrom( LUI.UIElement )
CoD.vhud_ms_LockOnNotification.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_LockOnNotification )
	self.id = "vhud_ms_LockOnNotification"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 40 )
	
	local msLockOn = LUI.UIImage.new()
	msLockOn:setLeftRight( false, false, -27.59, 27.59 )
	msLockOn:setTopBottom( false, false, -23.59, 31.59 )
	msLockOn:setRGB( 0.74, 0.94, 0.99 )
	msLockOn:setAlpha( 0.5 )
	msLockOn:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_textlockon" ) )
	msLockOn:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msLockOn )
	self.msLockOn = msLockOn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local msLockOnFrame2 = function ( msLockOn, event )
					local msLockOnFrame3 = function ( msLockOn, event )
						local msLockOnFrame4 = function ( msLockOn, event )
							local msLockOnFrame5 = function ( msLockOn, event )
								local msLockOnFrame6 = function ( msLockOn, event )
									local msLockOnFrame7 = function ( msLockOn, event )
										local msLockOnFrame8 = function ( msLockOn, event )
											local msLockOnFrame9 = function ( msLockOn, event )
												local msLockOnFrame10 = function ( msLockOn, event )
													local msLockOnFrame11 = function ( msLockOn, event )
														local msLockOnFrame12 = function ( msLockOn, event )
															local msLockOnFrame13 = function ( msLockOn, event )
																local msLockOnFrame14 = function ( msLockOn, event )
																	local msLockOnFrame15 = function ( msLockOn, event )
																		local msLockOnFrame16 = function ( msLockOn, event )
																			local msLockOnFrame17 = function ( msLockOn, event )
																				local msLockOnFrame18 = function ( msLockOn, event )
																					local msLockOnFrame19 = function ( msLockOn, event )
																						if not event.interrupted then
																							msLockOn:beginAnimation( "keyframe", 3910, false, false, CoD.TweenType.Linear )
																						end
																						msLockOn:setRGB( 0.74, 0.94, 0.99 )
																						msLockOn:setAlpha( 0.5 )
																						if event.interrupted then
																							self.clipFinished( msLockOn, event )
																						else
																							msLockOn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						msLockOnFrame19( msLockOn, event )
																						return 
																					else
																						msLockOn:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																						msLockOn:setRGB( 0.74, 0.94, 0.99 )
																						msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					msLockOnFrame18( msLockOn, event )
																					return 
																				else
																					msLockOn:beginAnimation( "keyframe", 630, false, false, CoD.TweenType.Linear )
																					msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				msLockOnFrame17( msLockOn, event )
																				return 
																			else
																				msLockOn:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																				msLockOn:setAlpha( 0.5 )
																				msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			msLockOnFrame16( msLockOn, event )
																			return 
																		else
																			msLockOn:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																			msLockOn:setAlpha( 0 )
																			msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		msLockOnFrame15( msLockOn, event )
																		return 
																	else
																		msLockOn:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																		msLockOn:setAlpha( 0.5 )
																		msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame15 )
																	end
																end
																
																if event.interrupted then
																	msLockOnFrame14( msLockOn, event )
																	return 
																else
																	msLockOn:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	msLockOn:setAlpha( 0 )
																	msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame14 )
																end
															end
															
															if event.interrupted then
																msLockOnFrame13( msLockOn, event )
																return 
															else
																msLockOn:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
																msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame13 )
															end
														end
														
														if event.interrupted then
															msLockOnFrame12( msLockOn, event )
															return 
														else
															msLockOn:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															msLockOn:setRGB( 1, 0, 0.07 )
															msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame12 )
														end
													end
													
													if event.interrupted then
														msLockOnFrame11( msLockOn, event )
														return 
													else
														msLockOn:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
														msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame11 )
													end
												end
												
												if event.interrupted then
													msLockOnFrame10( msLockOn, event )
													return 
												else
													msLockOn:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													msLockOn:setRGB( 0.74, 0.94, 0.99 )
													msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame10 )
												end
											end
											
											if event.interrupted then
												msLockOnFrame9( msLockOn, event )
												return 
											else
												msLockOn:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
												msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame9 )
											end
										end
										
										if event.interrupted then
											msLockOnFrame8( msLockOn, event )
											return 
										else
											msLockOn:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											msLockOn:setRGB( 1, 0, 0.07 )
											msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame8 )
										end
									end
									
									if event.interrupted then
										msLockOnFrame7( msLockOn, event )
										return 
									else
										msLockOn:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
										msLockOn:setAlpha( 0.5 )
										msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame7 )
									end
								end
								
								if event.interrupted then
									msLockOnFrame6( msLockOn, event )
									return 
								else
									msLockOn:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
									msLockOn:setAlpha( 0.09 )
									msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame6 )
								end
							end
							
							if event.interrupted then
								msLockOnFrame5( msLockOn, event )
								return 
							else
								msLockOn:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								msLockOn:setAlpha( 0.5 )
								msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame5 )
							end
						end
						
						if event.interrupted then
							msLockOnFrame4( msLockOn, event )
							return 
						else
							msLockOn:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							msLockOn:setAlpha( 0.09 )
							msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame4 )
						end
					end
					
					if event.interrupted then
						msLockOnFrame3( msLockOn, event )
						return 
					else
						msLockOn:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame3 )
					end
				end
				
				msLockOn:completeAnimation()
				self.msLockOn:setRGB( 0.74, 0.94, 0.99 )
				self.msLockOn:setAlpha( 0.5 )
				msLockOnFrame2( msLockOn, {} )
				self.nextClip = "DefaultClip"
			end,
			StartUp = function ()
				self:setupElementClipCounter( 1 )
				local msLockOnFrame2 = function ( msLockOn, event )
					local msLockOnFrame3 = function ( msLockOn, event )
						local msLockOnFrame4 = function ( msLockOn, event )
							local msLockOnFrame5 = function ( msLockOn, event )
								if not event.interrupted then
									msLockOn:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								end
								msLockOn:setLeftRight( false, false, -16, 24.18 )
								msLockOn:setTopBottom( false, false, -190.44, -150.26 )
								msLockOn:setAlpha( 0.5 )
								if event.interrupted then
									self.clipFinished( msLockOn, event )
								else
									msLockOn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								msLockOnFrame5( msLockOn, event )
								return 
							else
								msLockOn:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								msLockOn:setAlpha( 0.5 )
								msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame5 )
							end
						end
						
						if event.interrupted then
							msLockOnFrame4( msLockOn, event )
							return 
						else
							msLockOn:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							msLockOn:setAlpha( 0 )
							msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame4 )
						end
					end
					
					if event.interrupted then
						msLockOnFrame3( msLockOn, event )
						return 
					else
						msLockOn:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						msLockOn:setAlpha( 1 )
						msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame3 )
					end
				end
				
				msLockOn:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
				msLockOn:setLeftRight( false, false, -16, 24.18 )
				msLockOn:setTopBottom( false, false, -190.44, -150.26 )
				msLockOn:setAlpha( 0 )
				msLockOn:registerEventHandler( "transition_complete_keyframe", msLockOnFrame2 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

