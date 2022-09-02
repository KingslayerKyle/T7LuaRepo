-- 424de2cec27a6e6194f75c18c6a12856
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Specialist8bit_eyes = InheritFrom( LUI.UIElement )
CoD.CallingCards_Specialist8bit_eyes.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Specialist8bit_eyes )
	self.id = "CallingCards_Specialist8bit_eyes"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 24 )
	
	local eyes = LUI.UIImage.new()
	eyes:setLeftRight( true, false, 0, 36 )
	eyes:setTopBottom( true, false, 0, 24 )
	eyes:setImage( RegisterImage( "uie_t7_callingcard_mp_specialist8bit_eyes" ) )
	self:addElement( eyes )
	self.eyes = eyes
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local eyesFrame2 = function ( eyes, event )
					local eyesFrame3 = function ( eyes, event )
						local eyesFrame4 = function ( eyes, event )
							local eyesFrame5 = function ( eyes, event )
								local eyesFrame6 = function ( eyes, event )
									local eyesFrame7 = function ( eyes, event )
										local eyesFrame8 = function ( eyes, event )
											local eyesFrame9 = function ( eyes, event )
												local eyesFrame10 = function ( eyes, event )
													local eyesFrame11 = function ( eyes, event )
														local eyesFrame12 = function ( eyes, event )
															local eyesFrame13 = function ( eyes, event )
																local eyesFrame14 = function ( eyes, event )
																	local eyesFrame15 = function ( eyes, event )
																		if not event.interrupted then
																			eyes:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																		end
																		eyes:setAlpha( 0 )
																		if event.interrupted then
																			self.clipFinished( eyes, event )
																		else
																			eyes:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		eyesFrame15( eyes, event )
																		return 
																	else
																		eyes:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
																		eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame15 )
																	end
																end
																
																if event.interrupted then
																	eyesFrame14( eyes, event )
																	return 
																else
																	eyes:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	eyes:setAlpha( 1 )
																	eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame14 )
																end
															end
															
															if event.interrupted then
																eyesFrame13( eyes, event )
																return 
															else
																eyes:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame13 )
															end
														end
														
														if event.interrupted then
															eyesFrame12( eyes, event )
															return 
														else
															eyes:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
															eyes:setAlpha( 0 )
															eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame12 )
														end
													end
													
													if event.interrupted then
														eyesFrame11( eyes, event )
														return 
													else
														eyes:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
														eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame11 )
													end
												end
												
												if event.interrupted then
													eyesFrame10( eyes, event )
													return 
												else
													eyes:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													eyes:setAlpha( 1 )
													eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame10 )
												end
											end
											
											if event.interrupted then
												eyesFrame9( eyes, event )
												return 
											else
												eyes:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
												eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame9 )
											end
										end
										
										if event.interrupted then
											eyesFrame8( eyes, event )
											return 
										else
											eyes:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											eyes:setAlpha( 0 )
											eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame8 )
										end
									end
									
									if event.interrupted then
										eyesFrame7( eyes, event )
										return 
									else
										eyes:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
										eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame7 )
									end
								end
								
								if event.interrupted then
									eyesFrame6( eyes, event )
									return 
								else
									eyes:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									eyes:setAlpha( 1 )
									eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame6 )
								end
							end
							
							if event.interrupted then
								eyesFrame5( eyes, event )
								return 
							else
								eyes:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame5 )
							end
						end
						
						if event.interrupted then
							eyesFrame4( eyes, event )
							return 
						else
							eyes:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							eyes:setAlpha( 0 )
							eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame4 )
						end
					end
					
					if event.interrupted then
						eyesFrame3( eyes, event )
						return 
					else
						eyes:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						eyes:registerEventHandler( "transition_complete_keyframe", eyesFrame3 )
					end
				end
				
				eyes:completeAnimation()
				self.eyes:setAlpha( 1 )
				eyesFrame2( eyes, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

