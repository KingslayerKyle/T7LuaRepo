CoD.CallingCards_SpecialistKilljoysEyes = InheritFrom( LUI.UIElement )
CoD.CallingCards_SpecialistKilljoysEyes.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_SpecialistKilljoysEyes )
	self.id = "CallingCards_SpecialistKilljoysEyes"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 126 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local maneyes = LUI.UIImage.new()
	maneyes:setLeftRight( 0, 0, 0, 126 )
	maneyes:setTopBottom( 0, 0, 0, 54 )
	maneyes:setImage( RegisterImage( "uie_t7_callingcard_specialistkilljoy_maneyes" ) )
	self:addElement( maneyes )
	self.maneyes = maneyes
	
	self.resetProperties = function ()
		maneyes:completeAnimation()
		maneyes:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local maneyesFrame2 = function ( maneyes, event )
					local maneyesFrame3 = function ( maneyes, event )
						local maneyesFrame4 = function ( maneyes, event )
							local maneyesFrame5 = function ( maneyes, event )
								local maneyesFrame6 = function ( maneyes, event )
									local maneyesFrame7 = function ( maneyes, event )
										local maneyesFrame8 = function ( maneyes, event )
											local maneyesFrame9 = function ( maneyes, event )
												local maneyesFrame10 = function ( maneyes, event )
													local maneyesFrame11 = function ( maneyes, event )
														local maneyesFrame12 = function ( maneyes, event )
															local maneyesFrame13 = function ( maneyes, event )
																local maneyesFrame14 = function ( maneyes, event )
																	local maneyesFrame15 = function ( maneyes, event )
																		if not event.interrupted then
																			maneyes:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
																		end
																		maneyes:setAlpha( 1 )
																		if event.interrupted then
																			self.clipFinished( maneyes, event )
																		else
																			maneyes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		maneyesFrame15( maneyes, event )
																		return 
																	else
																		maneyes:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
																		maneyes:setAlpha( 0.23 )
																		maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame15 )
																	end
																end
																
																if event.interrupted then
																	maneyesFrame14( maneyes, event )
																	return 
																else
																	maneyes:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																	maneyes:setAlpha( 1 )
																	maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame14 )
																end
															end
															
															if event.interrupted then
																maneyesFrame13( maneyes, event )
																return 
															else
																maneyes:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																maneyes:setAlpha( 0 )
																maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame13 )
															end
														end
														
														if event.interrupted then
															maneyesFrame12( maneyes, event )
															return 
														else
															maneyes:beginAnimation( "keyframe", 1030, false, false, CoD.TweenType.Linear )
															maneyes:setAlpha( 1 )
															maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame12 )
														end
													end
													
													if event.interrupted then
														maneyesFrame11( maneyes, event )
														return 
													else
														maneyes:beginAnimation( "keyframe", 1230, false, false, CoD.TweenType.Linear )
														maneyes:setAlpha( 0.34 )
														maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame11 )
													end
												end
												
												if event.interrupted then
													maneyesFrame10( maneyes, event )
													return 
												else
													maneyes:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
													maneyes:setAlpha( 1 )
													maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame10 )
												end
											end
											
											if event.interrupted then
												maneyesFrame9( maneyes, event )
												return 
											else
												maneyes:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												maneyes:setAlpha( 0.37 )
												maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame9 )
											end
										end
										
										if event.interrupted then
											maneyesFrame8( maneyes, event )
											return 
										else
											maneyes:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
											maneyes:setAlpha( 1 )
											maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame8 )
										end
									end
									
									if event.interrupted then
										maneyesFrame7( maneyes, event )
										return 
									else
										maneyes:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
										maneyes:setAlpha( 0.41 )
										maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame7 )
									end
								end
								
								if event.interrupted then
									maneyesFrame6( maneyes, event )
									return 
								else
									maneyes:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
									maneyes:setAlpha( 1 )
									maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame6 )
								end
							end
							
							if event.interrupted then
								maneyesFrame5( maneyes, event )
								return 
							else
								maneyes:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
								maneyes:setAlpha( 0.2 )
								maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame5 )
							end
						end
						
						if event.interrupted then
							maneyesFrame4( maneyes, event )
							return 
						else
							maneyes:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							maneyes:setAlpha( 1 )
							maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame4 )
						end
					end
					
					if event.interrupted then
						maneyesFrame3( maneyes, event )
						return 
					else
						maneyes:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						maneyes:setAlpha( 0 )
						maneyes:registerEventHandler( "transition_complete_keyframe", maneyesFrame3 )
					end
				end
				
				maneyes:completeAnimation()
				self.maneyes:setAlpha( 1 )
				maneyesFrame2( maneyes, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

