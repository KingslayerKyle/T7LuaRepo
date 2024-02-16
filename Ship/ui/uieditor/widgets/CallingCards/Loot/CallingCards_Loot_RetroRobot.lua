-- 63e887e00bd3ca072de420c14a88449d
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Loot_RetroRobot = InheritFrom( LUI.UIElement )
CoD.CallingCards_Loot_RetroRobot.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Loot_RetroRobot )
	self.id = "CallingCards_Loot_RetroRobot"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 120 )
	Image0:setImage( RegisterImage( "uie_t7_callingcard_retrorobot_bg" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 480 )
	Image1:setTopBottom( true, false, 0, 120 )
	Image1:setImage( RegisterImage( "uie_t7_callingcard_retrorobot_bg2" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							local Image1Frame5 = function ( Image1, event )
								local Image1Frame6 = function ( Image1, event )
									local Image1Frame7 = function ( Image1, event )
										local Image1Frame8 = function ( Image1, event )
											local Image1Frame9 = function ( Image1, event )
												local Image1Frame10 = function ( Image1, event )
													local Image1Frame11 = function ( Image1, event )
														local Image1Frame12 = function ( Image1, event )
															local Image1Frame13 = function ( Image1, event )
																local Image1Frame14 = function ( Image1, event )
																	local Image1Frame15 = function ( Image1, event )
																		local Image1Frame16 = function ( Image1, event )
																			local Image1Frame17 = function ( Image1, event )
																				local Image1Frame18 = function ( Image1, event )
																					local Image1Frame19 = function ( Image1, event )
																						local Image1Frame20 = function ( Image1, event )
																							local Image1Frame21 = function ( Image1, event )
																								local Image1Frame22 = function ( Image1, event )
																									if not event.interrupted then
																										Image1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																									end
																									Image1:setAlpha( 1 )
																									if event.interrupted then
																										self.clipFinished( Image1, event )
																									else
																										Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																									end
																								end
																								
																								if event.interrupted then
																									Image1Frame22( Image1, event )
																									return 
																								else
																									Image1:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
																									Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								Image1Frame21( Image1, event )
																								return 
																							else
																								Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																								Image1:setAlpha( 0 )
																								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							Image1Frame20( Image1, event )
																							return 
																						else
																							Image1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																							Image1:setAlpha( 1 )
																							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						Image1Frame19( Image1, event )
																						return 
																					else
																						Image1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					Image1Frame18( Image1, event )
																					return 
																				else
																					Image1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																					Image1:setAlpha( 0 )
																					Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				Image1Frame17( Image1, event )
																				return 
																			else
																				Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																				Image1:setAlpha( 1 )
																				Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			Image1Frame16( Image1, event )
																			return 
																		else
																			Image1:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
																			Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Image1Frame15( Image1, event )
																		return 
																	else
																		Image1:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
																		Image1:setAlpha( 0 )
																		Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame15 )
																	end
																end
																
																if event.interrupted then
																	Image1Frame14( Image1, event )
																	return 
																else
																	Image1:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																	Image1:setAlpha( 1 )
																	Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame14 )
																end
															end
															
															if event.interrupted then
																Image1Frame13( Image1, event )
																return 
															else
																Image1:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
																Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame13 )
															end
														end
														
														if event.interrupted then
															Image1Frame12( Image1, event )
															return 
														else
															Image1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
															Image1:setAlpha( 0 )
															Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame12 )
														end
													end
													
													if event.interrupted then
														Image1Frame11( Image1, event )
														return 
													else
														Image1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
														Image1:setAlpha( 1 )
														Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame11 )
													end
												end
												
												if event.interrupted then
													Image1Frame10( Image1, event )
													return 
												else
													Image1:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
													Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame10 )
												end
											end
											
											if event.interrupted then
												Image1Frame9( Image1, event )
												return 
											else
												Image1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
												Image1:setAlpha( 0 )
												Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame9 )
											end
										end
										
										if event.interrupted then
											Image1Frame8( Image1, event )
											return 
										else
											Image1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											Image1:setAlpha( 1 )
											Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame8 )
										end
									end
									
									if event.interrupted then
										Image1Frame7( Image1, event )
										return 
									else
										Image1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
										Image1:setAlpha( 0 )
										Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame7 )
									end
								end
								
								if event.interrupted then
									Image1Frame6( Image1, event )
									return 
								else
									Image1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Image1:setAlpha( 1 )
									Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame6 )
								end
							end
							
							if event.interrupted then
								Image1Frame5( Image1, event )
								return 
							else
								Image1:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame5 )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							Image1:setAlpha( 0 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						Image1:setAlpha( 1 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
