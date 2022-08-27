-- 17fdbf6d5bee75e09f10e068bc8a5684
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_SciFi_LenseFlare = InheritFrom( LUI.UIElement )
CoD.CallingCards_SciFi_LenseFlare.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_SciFi_LenseFlare )
	self.id = "CallingCards_SciFi_LenseFlare"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 120 )
	
	local LenseFlare = LUI.UIImage.new()
	LenseFlare:setLeftRight( true, false, 0, 720 )
	LenseFlare:setTopBottom( true, false, 0, 120 )
	LenseFlare:setImage( RegisterImage( "uie_t7_callingcard_mp_scifi_lenseflare" ) )
	LenseFlare:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LenseFlare )
	self.LenseFlare = LenseFlare
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local LenseFlareFrame2 = function ( LenseFlare, event )
					local LenseFlareFrame3 = function ( LenseFlare, event )
						local LenseFlareFrame4 = function ( LenseFlare, event )
							local LenseFlareFrame5 = function ( LenseFlare, event )
								local LenseFlareFrame6 = function ( LenseFlare, event )
									local LenseFlareFrame7 = function ( LenseFlare, event )
										local LenseFlareFrame8 = function ( LenseFlare, event )
											local LenseFlareFrame9 = function ( LenseFlare, event )
												local LenseFlareFrame10 = function ( LenseFlare, event )
													local LenseFlareFrame11 = function ( LenseFlare, event )
														local LenseFlareFrame12 = function ( LenseFlare, event )
															local LenseFlareFrame13 = function ( LenseFlare, event )
																local LenseFlareFrame14 = function ( LenseFlare, event )
																	local LenseFlareFrame15 = function ( LenseFlare, event )
																		local LenseFlareFrame16 = function ( LenseFlare, event )
																			if not event.interrupted then
																				LenseFlare:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
																			end
																			LenseFlare:setAlpha( 1 )
																			if event.interrupted then
																				self.clipFinished( LenseFlare, event )
																			else
																				LenseFlare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			LenseFlareFrame16( LenseFlare, event )
																			return 
																		else
																			LenseFlare:beginAnimation( "keyframe", 630, false, false, CoD.TweenType.Linear )
																			LenseFlare:setAlpha( 0.54 )
																			LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		LenseFlareFrame15( LenseFlare, event )
																		return 
																	else
																		LenseFlare:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																		LenseFlare:setAlpha( 1 )
																		LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame15 )
																	end
																end
																
																if event.interrupted then
																	LenseFlareFrame14( LenseFlare, event )
																	return 
																else
																	LenseFlare:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
																	LenseFlare:setAlpha( 0.57 )
																	LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame14 )
																end
															end
															
															if event.interrupted then
																LenseFlareFrame13( LenseFlare, event )
																return 
															else
																LenseFlare:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																LenseFlare:setAlpha( 1 )
																LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame13 )
															end
														end
														
														if event.interrupted then
															LenseFlareFrame12( LenseFlare, event )
															return 
														else
															LenseFlare:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															LenseFlare:setAlpha( 0.69 )
															LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame12 )
														end
													end
													
													if event.interrupted then
														LenseFlareFrame11( LenseFlare, event )
														return 
													else
														LenseFlare:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														LenseFlare:setAlpha( 1 )
														LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame11 )
													end
												end
												
												if event.interrupted then
													LenseFlareFrame10( LenseFlare, event )
													return 
												else
													LenseFlare:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
													LenseFlare:setAlpha( 0.67 )
													LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame10 )
												end
											end
											
											if event.interrupted then
												LenseFlareFrame9( LenseFlare, event )
												return 
											else
												LenseFlare:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
												LenseFlare:setAlpha( 0.81 )
												LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame9 )
											end
										end
										
										if event.interrupted then
											LenseFlareFrame8( LenseFlare, event )
											return 
										else
											LenseFlare:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
											LenseFlare:setAlpha( 1 )
											LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame8 )
										end
									end
									
									if event.interrupted then
										LenseFlareFrame7( LenseFlare, event )
										return 
									else
										LenseFlare:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
										LenseFlare:setAlpha( 0.79 )
										LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame7 )
									end
								end
								
								if event.interrupted then
									LenseFlareFrame6( LenseFlare, event )
									return 
								else
									LenseFlare:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									LenseFlare:setAlpha( 1 )
									LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame6 )
								end
							end
							
							if event.interrupted then
								LenseFlareFrame5( LenseFlare, event )
								return 
							else
								LenseFlare:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								LenseFlare:setAlpha( 0.69 )
								LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame5 )
							end
						end
						
						if event.interrupted then
							LenseFlareFrame4( LenseFlare, event )
							return 
						else
							LenseFlare:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							LenseFlare:setAlpha( 1 )
							LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame4 )
						end
					end
					
					if event.interrupted then
						LenseFlareFrame3( LenseFlare, event )
						return 
					else
						LenseFlare:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						LenseFlare:setAlpha( 0.67 )
						LenseFlare:registerEventHandler( "transition_complete_keyframe", LenseFlareFrame3 )
					end
				end
				
				LenseFlare:completeAnimation()
				self.LenseFlare:setAlpha( 1 )
				LenseFlareFrame2( LenseFlare, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

