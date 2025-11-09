CoD.VehicleGround_HashIcon = InheritFrom( LUI.UIElement )
CoD.VehicleGround_HashIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_HashIcon )
	self.id = "VehicleGround_HashIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 16 )
	
	local HashIcon = LUI.UIImage.new()
	HashIcon:setLeftRight( true, false, 0, 32 )
	HashIcon:setTopBottom( true, false, 0, 16 )
	HashIcon:setRGB( 1, 1, 1 )
	HashIcon:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_hashringsmallicon" ) )
	HashIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HashIcon )
	self.HashIcon = HashIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local HashIconFrame2 = function ( HashIcon, event )
					local HashIconFrame3 = function ( HashIcon, event )
						local HashIconFrame4 = function ( HashIcon, event )
							local HashIconFrame5 = function ( HashIcon, event )
								local HashIconFrame6 = function ( HashIcon, event )
									local HashIconFrame7 = function ( HashIcon, event )
										local HashIconFrame8 = function ( HashIcon, event )
											local HashIconFrame9 = function ( HashIcon, event )
												local HashIconFrame10 = function ( HashIcon, event )
													local HashIconFrame11 = function ( HashIcon, event )
														local HashIconFrame12 = function ( HashIcon, event )
															local HashIconFrame13 = function ( HashIcon, event )
																local HashIconFrame14 = function ( HashIcon, event )
																	local HashIconFrame15 = function ( HashIcon, event )
																		local HashIconFrame16 = function ( HashIcon, event )
																			if not event.interrupted then
																				HashIcon:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
																			end
																			HashIcon:setRGB( 1, 1, 1 )
																			if event.interrupted then
																				self.clipFinished( HashIcon, event )
																			else
																				HashIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			HashIconFrame16( HashIcon, event )
																			return 
																		else
																			HashIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			HashIcon:setRGB( 1, 1, 1 )
																			HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		HashIconFrame15( HashIcon, event )
																		return 
																	else
																		HashIcon:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																		HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame15 )
																	end
																end
																
																if event.interrupted then
																	HashIconFrame14( HashIcon, event )
																	return 
																else
																	HashIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	HashIcon:setRGB( 0, 0, 0 )
																	HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame14 )
																end
															end
															
															if event.interrupted then
																HashIconFrame13( HashIcon, event )
																return 
															else
																HashIcon:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame13 )
															end
														end
														
														if event.interrupted then
															HashIconFrame12( HashIcon, event )
															return 
														else
															HashIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															HashIcon:setRGB( 1, 0, 0 )
															HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame12 )
														end
													end
													
													if event.interrupted then
														HashIconFrame11( HashIcon, event )
														return 
													else
														HashIcon:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame11 )
													end
												end
												
												if event.interrupted then
													HashIconFrame10( HashIcon, event )
													return 
												else
													HashIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													HashIcon:setRGB( 0, 0, 0 )
													HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame10 )
												end
											end
											
											if event.interrupted then
												HashIconFrame9( HashIcon, event )
												return 
											else
												HashIcon:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame9 )
											end
										end
										
										if event.interrupted then
											HashIconFrame8( HashIcon, event )
											return 
										else
											HashIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HashIcon:setRGB( 1, 1, 1 )
											HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame8 )
										end
									end
									
									if event.interrupted then
										HashIconFrame7( HashIcon, event )
										return 
									else
										HashIcon:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
										HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame7 )
									end
								end
								
								if event.interrupted then
									HashIconFrame6( HashIcon, event )
									return 
								else
									HashIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									HashIcon:setRGB( 1, 0, 0 )
									HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame6 )
								end
							end
							
							if event.interrupted then
								HashIconFrame5( HashIcon, event )
								return 
							else
								HashIcon:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame5 )
							end
						end
						
						if event.interrupted then
							HashIconFrame4( HashIcon, event )
							return 
						else
							HashIcon:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							HashIcon:setRGB( 0, 0, 0 )
							HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame4 )
						end
					end
					
					if event.interrupted then
						HashIconFrame3( HashIcon, event )
						return 
					else
						HashIcon:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						HashIcon:registerEventHandler( "transition_complete_keyframe", HashIconFrame3 )
					end
				end
				
				HashIcon:completeAnimation()
				self.HashIcon:setRGB( 1, 1, 1 )
				HashIconFrame2( HashIcon, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

