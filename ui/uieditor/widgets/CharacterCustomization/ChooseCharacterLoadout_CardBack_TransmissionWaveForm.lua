-- 08f1d8c84bd3ac44daa8f610a11f7289
-- This hash is used for caching, delete to decompile the file again

CoD.ChooseCharacterLoadout_CardBack_TransmissionWaveForm = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_TransmissionWaveForm.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_TransmissionWaveForm )
	self.id = "ChooseCharacterLoadout_CardBack_TransmissionWaveForm"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 139 )
	self:setTopBottom( true, false, 0, 46 )
	
	local waveForm = LUI.UIImage.new()
	waveForm:setLeftRight( true, true, 0, 0 )
	waveForm:setTopBottom( true, true, 0, -0.5 )
	waveForm:setRGB( 0.3, 0.94, 1 )
	waveForm:setImage( RegisterImage( "uie_gradient_noise" ) )
	waveForm:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_blackhat_waveform" ) )
	waveForm:setShaderVector( 0, 0.5, 0.74, 0, 0 )
	self:addElement( waveForm )
	self.waveForm = waveForm
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				waveForm:completeAnimation()
				self.waveForm:setAlpha( 0 )
				self.waveForm:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_blackhat_waveform" ) )
				self.waveForm:setShaderVector( 0, 0.5, 0.74, 0, 0 )
				self.clipFinished( waveForm, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 1 )
				local waveFormFrame2 = function ( waveForm, event )
					if not event.interrupted then
						waveForm:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					waveForm:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( waveForm, event )
					else
						waveForm:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				waveForm:completeAnimation()
				self.waveForm:setAlpha( 0 )
				waveFormFrame2( waveForm, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local waveFormFrame2 = function ( waveForm, event )
					local waveFormFrame3 = function ( waveForm, event )
						local waveFormFrame4 = function ( waveForm, event )
							local waveFormFrame5 = function ( waveForm, event )
								local waveFormFrame6 = function ( waveForm, event )
									local waveFormFrame7 = function ( waveForm, event )
										local waveFormFrame8 = function ( waveForm, event )
											local waveFormFrame9 = function ( waveForm, event )
												local waveFormFrame10 = function ( waveForm, event )
													local waveFormFrame11 = function ( waveForm, event )
														local waveFormFrame12 = function ( waveForm, event )
															local waveFormFrame13 = function ( waveForm, event )
																if not event.interrupted then
																	waveForm:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
																end
																waveForm:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_blackhat_waveform" ) )
																waveForm:setShaderVector( 0, 0.5, 0.74, 0, 0 )
																if event.interrupted then
																	self.clipFinished( waveForm, event )
																else
																	waveForm:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																waveFormFrame13( waveForm, event )
																return 
															else
																waveForm:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
																waveForm:setShaderVector( 0, 0.62, 0.14, 0, 0 )
																waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame13 )
															end
														end
														
														if event.interrupted then
															waveFormFrame12( waveForm, event )
															return 
														else
															waveForm:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
															waveForm:setShaderVector( 0, 0.78, 0.26, 0, 0 )
															waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame12 )
														end
													end
													
													if event.interrupted then
														waveFormFrame11( waveForm, event )
														return 
													else
														waveForm:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
														waveForm:setShaderVector( 0, 0.71, 0.9, 0, 0 )
														waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame11 )
													end
												end
												
												if event.interrupted then
													waveFormFrame10( waveForm, event )
													return 
												else
													waveForm:beginAnimation( "keyframe", 900, false, false, CoD.TweenType.Linear )
													waveForm:setShaderVector( 0, 0.6, 0.84, 0, 0 )
													waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame10 )
												end
											end
											
											if event.interrupted then
												waveFormFrame9( waveForm, event )
												return 
											else
												waveForm:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
												waveForm:setShaderVector( 0, 0.69, 0.33, 0, 0 )
												waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame9 )
											end
										end
										
										if event.interrupted then
											waveFormFrame8( waveForm, event )
											return 
										else
											waveForm:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
											waveForm:setShaderVector( 0, 0.79, 0.8, 0, 0 )
											waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame8 )
										end
									end
									
									if event.interrupted then
										waveFormFrame7( waveForm, event )
										return 
									else
										waveForm:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
										waveForm:setShaderVector( 0, 0.65, 0.4, 0, 0 )
										waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame7 )
									end
								end
								
								if event.interrupted then
									waveFormFrame6( waveForm, event )
									return 
								else
									waveForm:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
									waveForm:setShaderVector( 0, 0.54, 0.51, 0, 0 )
									waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame6 )
								end
							end
							
							if event.interrupted then
								waveFormFrame5( waveForm, event )
								return 
							else
								waveForm:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
								waveForm:setShaderVector( 0, 0.33, 0.99, 0, 0 )
								waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame5 )
							end
						end
						
						if event.interrupted then
							waveFormFrame4( waveForm, event )
							return 
						else
							waveForm:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
							waveForm:setShaderVector( 0, 0.4, 0.32, 0, 0 )
							waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame4 )
						end
					end
					
					if event.interrupted then
						waveFormFrame3( waveForm, event )
						return 
					else
						waveForm:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						waveForm:setShaderVector( 0, 0.44, 1, 0, 0 )
						waveForm:registerEventHandler( "transition_complete_keyframe", waveFormFrame3 )
					end
				end
				
				waveForm:completeAnimation()
				self.waveForm:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_blackhat_waveform" ) )
				self.waveForm:setShaderVector( 0, 0.5, 0.74, 0, 0 )
				waveFormFrame2( waveForm, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local waveFormFrame2 = function ( waveForm, event )
					if not event.interrupted then
						waveForm:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					waveForm:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( waveForm, event )
					else
						waveForm:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				waveForm:completeAnimation()
				self.waveForm:setAlpha( 1 )
				waveFormFrame2( waveForm, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

