-- 42d7d2f4a10ecb4f746a3ac1e22278fd
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_loot_hotrod_hand = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_hotrod_hand.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_loot_hotrod_hand )
	self.id = "CallingCards_loot_hotrod_hand"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 192 )
	
	local devilHand = LUI.UIImage.new()
	devilHand:setLeftRight( true, false, 0, 48 )
	devilHand:setTopBottom( true, false, 0, 108 )
	devilHand:setImage( RegisterImage( "uie_t7_callingcard_mp_hotrod_devil_hand" ) )
	self:addElement( devilHand )
	self.devilHand = devilHand
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local devilHandFrame2 = function ( devilHand, event )
					local devilHandFrame3 = function ( devilHand, event )
						local devilHandFrame4 = function ( devilHand, event )
							local devilHandFrame5 = function ( devilHand, event )
								local devilHandFrame6 = function ( devilHand, event )
									local devilHandFrame7 = function ( devilHand, event )
										local devilHandFrame8 = function ( devilHand, event )
											local devilHandFrame9 = function ( devilHand, event )
												local devilHandFrame10 = function ( devilHand, event )
													local devilHandFrame11 = function ( devilHand, event )
														local devilHandFrame12 = function ( devilHand, event )
															local devilHandFrame13 = function ( devilHand, event )
																if not event.interrupted then
																	devilHand:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
																end
																devilHand:setLeftRight( true, false, 0, 48 )
																devilHand:setTopBottom( true, false, 0, 108 )
																devilHand:setZRot( 0 )
																if event.interrupted then
																	self.clipFinished( devilHand, event )
																else
																	devilHand:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																devilHandFrame13( devilHand, event )
																return 
															else
																devilHand:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																devilHand:setLeftRight( true, false, 3, 51 )
																devilHand:setTopBottom( true, false, 2, 110 )
																devilHand:setZRot( -4 )
																devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame13 )
															end
														end
														
														if event.interrupted then
															devilHandFrame12( devilHand, event )
															return 
														else
															devilHand:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
															devilHand:setLeftRight( true, false, 0, 48 )
															devilHand:setTopBottom( true, false, 0, 108 )
															devilHand:setZRot( 0 )
															devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame12 )
														end
													end
													
													if event.interrupted then
														devilHandFrame11( devilHand, event )
														return 
													else
														devilHand:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
														devilHand:setLeftRight( true, false, -22, 26 )
														devilHand:setTopBottom( true, false, -3, 105 )
														devilHand:setZRot( 26 )
														devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame11 )
													end
												end
												
												if event.interrupted then
													devilHandFrame10( devilHand, event )
													return 
												else
													devilHand:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
													devilHand:setLeftRight( true, false, 0, 48 )
													devilHand:setTopBottom( true, false, 0, 108 )
													devilHand:setZRot( 0 )
													devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame10 )
												end
											end
											
											if event.interrupted then
												devilHandFrame9( devilHand, event )
												return 
											else
												devilHand:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
												devilHand:setLeftRight( true, false, 3, 51 )
												devilHand:setTopBottom( true, false, 2, 110 )
												devilHand:setZRot( -4 )
												devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame9 )
											end
										end
										
										if event.interrupted then
											devilHandFrame8( devilHand, event )
											return 
										else
											devilHand:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
											devilHand:setLeftRight( true, false, 0, 48 )
											devilHand:setTopBottom( true, false, 0, 108 )
											devilHand:setZRot( 0 )
											devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame8 )
										end
									end
									
									if event.interrupted then
										devilHandFrame7( devilHand, event )
										return 
									else
										devilHand:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
										devilHand:setLeftRight( true, false, -22, 26 )
										devilHand:setTopBottom( true, false, -3, 105 )
										devilHand:setZRot( 26 )
										devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame7 )
									end
								end
								
								if event.interrupted then
									devilHandFrame6( devilHand, event )
									return 
								else
									devilHand:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
									devilHand:setLeftRight( true, false, 0, 48 )
									devilHand:setTopBottom( true, false, 0, 108 )
									devilHand:setZRot( 0 )
									devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame6 )
								end
							end
							
							if event.interrupted then
								devilHandFrame5( devilHand, event )
								return 
							else
								devilHand:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								devilHand:setLeftRight( true, false, 3, 51 )
								devilHand:setTopBottom( true, false, 2, 110 )
								devilHand:setZRot( -4 )
								devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame5 )
							end
						end
						
						if event.interrupted then
							devilHandFrame4( devilHand, event )
							return 
						else
							devilHand:beginAnimation( "keyframe", 530, false, true, CoD.TweenType.Linear )
							devilHand:setLeftRight( true, false, 0, 48 )
							devilHand:setTopBottom( true, false, 0, 108 )
							devilHand:setZRot( 0 )
							devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame4 )
						end
					end
					
					if event.interrupted then
						devilHandFrame3( devilHand, event )
						return 
					else
						devilHand:beginAnimation( "keyframe", 560, true, false, CoD.TweenType.Linear )
						devilHand:setLeftRight( true, false, -22, 26 )
						devilHand:setTopBottom( true, false, -3, 105 )
						devilHand:setZRot( 26 )
						devilHand:registerEventHandler( "transition_complete_keyframe", devilHandFrame3 )
					end
				end
				
				devilHand:completeAnimation()
				self.devilHand:setLeftRight( true, false, 0, 48 )
				self.devilHand:setTopBottom( true, false, 0, 108 )
				self.devilHand:setZRot( 0 )
				devilHandFrame2( devilHand, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

