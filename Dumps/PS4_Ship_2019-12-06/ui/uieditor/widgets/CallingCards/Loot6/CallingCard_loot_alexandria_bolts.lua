CoD.CallingCard_loot_alexandria_bolts = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_alexandria_bolts.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_loot_alexandria_bolts )
	self.id = "CallingCard_loot_alexandria_bolts"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 264 )
	self:setTopBottom( true, false, 0, 84 )
	
	local bolt1 = LUI.UIImage.new()
	bolt1:setLeftRight( true, false, 0, 264 )
	bolt1:setTopBottom( true, false, 0, 84 )
	bolt1:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_bolt1" ) )
	self:addElement( bolt1 )
	self.bolt1 = bolt1
	
	local bolt2 = LUI.UIImage.new()
	bolt2:setLeftRight( true, false, 0, 264 )
	bolt2:setTopBottom( true, false, 0, 84 )
	bolt2:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_bolt2" ) )
	self:addElement( bolt2 )
	self.bolt2 = bolt2
	
	local bolt3 = LUI.UIImage.new()
	bolt3:setLeftRight( true, false, 0, 264 )
	bolt3:setTopBottom( true, false, 0, 84 )
	bolt3:setAlpha( 0 )
	bolt3:setImage( RegisterImage( "uie_t7_loot_callingcard_7wonders_alexandria_bolt3" ) )
	self:addElement( bolt3 )
	self.bolt3 = bolt3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local bolt1Frame2 = function ( bolt1, event )
					local bolt1Frame3 = function ( bolt1, event )
						local bolt1Frame4 = function ( bolt1, event )
							local bolt1Frame5 = function ( bolt1, event )
								local bolt1Frame6 = function ( bolt1, event )
									local bolt1Frame7 = function ( bolt1, event )
										local bolt1Frame8 = function ( bolt1, event )
											local bolt1Frame9 = function ( bolt1, event )
												local bolt1Frame10 = function ( bolt1, event )
													local bolt1Frame11 = function ( bolt1, event )
														local bolt1Frame12 = function ( bolt1, event )
															local bolt1Frame13 = function ( bolt1, event )
																if not event.interrupted then
																	bolt1:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
																end
																bolt1:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( bolt1, event )
																else
																	bolt1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																bolt1Frame13( bolt1, event )
																return 
															else
																bolt1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																bolt1:setAlpha( 1 )
																bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame13 )
															end
														end
														
														if event.interrupted then
															bolt1Frame12( bolt1, event )
															return 
														else
															bolt1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
															bolt1:setAlpha( 0.66 )
															bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame12 )
														end
													end
													
													if event.interrupted then
														bolt1Frame11( bolt1, event )
														return 
													else
														bolt1:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
														bolt1:setAlpha( 1 )
														bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame11 )
													end
												end
												
												if event.interrupted then
													bolt1Frame10( bolt1, event )
													return 
												else
													bolt1:beginAnimation( "keyframe", 3630, false, false, CoD.TweenType.Linear )
													bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame10 )
												end
											end
											
											if event.interrupted then
												bolt1Frame9( bolt1, event )
												return 
											else
												bolt1:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Linear )
												bolt1:setAlpha( 0 )
												bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame9 )
											end
										end
										
										if event.interrupted then
											bolt1Frame8( bolt1, event )
											return 
										else
											bolt1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											bolt1:setAlpha( 1 )
											bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame8 )
										end
									end
									
									if event.interrupted then
										bolt1Frame7( bolt1, event )
										return 
									else
										bolt1:beginAnimation( "keyframe", 2370, false, false, CoD.TweenType.Linear )
										bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame7 )
									end
								end
								
								if event.interrupted then
									bolt1Frame6( bolt1, event )
									return 
								else
									bolt1:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
									bolt1:setAlpha( 0 )
									bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame6 )
								end
							end
							
							if event.interrupted then
								bolt1Frame5( bolt1, event )
								return 
							else
								bolt1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								bolt1:setAlpha( 1 )
								bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame5 )
							end
						end
						
						if event.interrupted then
							bolt1Frame4( bolt1, event )
							return 
						else
							bolt1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							bolt1:setAlpha( 0.4 )
							bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame4 )
						end
					end
					
					if event.interrupted then
						bolt1Frame3( bolt1, event )
						return 
					else
						bolt1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bolt1:setAlpha( 1 )
						bolt1:registerEventHandler( "transition_complete_keyframe", bolt1Frame3 )
					end
				end
				
				bolt1:completeAnimation()
				self.bolt1:setAlpha( 0 )
				bolt1Frame2( bolt1, {} )
				local bolt2Frame2 = function ( bolt2, event )
					local bolt2Frame3 = function ( bolt2, event )
						local bolt2Frame4 = function ( bolt2, event )
							local bolt2Frame5 = function ( bolt2, event )
								local bolt2Frame6 = function ( bolt2, event )
									local bolt2Frame7 = function ( bolt2, event )
										local bolt2Frame8 = function ( bolt2, event )
											local bolt2Frame9 = function ( bolt2, event )
												if not event.interrupted then
													bolt2:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
												end
												bolt2:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( bolt2, event )
												else
													bolt2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												bolt2Frame9( bolt2, event )
												return 
											else
												bolt2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
												bolt2:setAlpha( 1 )
												bolt2:registerEventHandler( "transition_complete_keyframe", bolt2Frame9 )
											end
										end
										
										if event.interrupted then
											bolt2Frame8( bolt2, event )
											return 
										else
											bolt2:beginAnimation( "keyframe", 3829, false, false, CoD.TweenType.Linear )
											bolt2:registerEventHandler( "transition_complete_keyframe", bolt2Frame8 )
										end
									end
									
									if event.interrupted then
										bolt2Frame7( bolt2, event )
										return 
									else
										bolt2:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
										bolt2:setAlpha( 0 )
										bolt2:registerEventHandler( "transition_complete_keyframe", bolt2Frame7 )
									end
								end
								
								if event.interrupted then
									bolt2Frame6( bolt2, event )
									return 
								else
									bolt2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									bolt2:setAlpha( 1 )
									bolt2:registerEventHandler( "transition_complete_keyframe", bolt2Frame6 )
								end
							end
							
							if event.interrupted then
								bolt2Frame5( bolt2, event )
								return 
							else
								bolt2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								bolt2:setAlpha( 0.42 )
								bolt2:registerEventHandler( "transition_complete_keyframe", bolt2Frame5 )
							end
						end
						
						if event.interrupted then
							bolt2Frame4( bolt2, event )
							return 
						else
							bolt2:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							bolt2:setAlpha( 1 )
							bolt2:registerEventHandler( "transition_complete_keyframe", bolt2Frame4 )
						end
					end
					
					if event.interrupted then
						bolt2Frame3( bolt2, event )
						return 
					else
						bolt2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						bolt2:registerEventHandler( "transition_complete_keyframe", bolt2Frame3 )
					end
				end
				
				bolt2:completeAnimation()
				self.bolt2:setAlpha( 0 )
				bolt2Frame2( bolt2, {} )
				local bolt3Frame2 = function ( bolt3, event )
					local bolt3Frame3 = function ( bolt3, event )
						local bolt3Frame4 = function ( bolt3, event )
							local bolt3Frame5 = function ( bolt3, event )
								local bolt3Frame6 = function ( bolt3, event )
									local bolt3Frame7 = function ( bolt3, event )
										local bolt3Frame8 = function ( bolt3, event )
											local bolt3Frame9 = function ( bolt3, event )
												if not event.interrupted then
													bolt3:beginAnimation( "keyframe", 1409, false, false, CoD.TweenType.Linear )
												end
												bolt3:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( bolt3, event )
												else
													bolt3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												bolt3Frame9( bolt3, event )
												return 
											else
												bolt3:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
												bolt3:setAlpha( 1 )
												bolt3:registerEventHandler( "transition_complete_keyframe", bolt3Frame9 )
											end
										end
										
										if event.interrupted then
											bolt3Frame8( bolt3, event )
											return 
										else
											bolt3:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
											bolt3:setAlpha( 0.56 )
											bolt3:registerEventHandler( "transition_complete_keyframe", bolt3Frame8 )
										end
									end
									
									if event.interrupted then
										bolt3Frame7( bolt3, event )
										return 
									else
										bolt3:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										bolt3:setAlpha( 1 )
										bolt3:registerEventHandler( "transition_complete_keyframe", bolt3Frame7 )
									end
								end
								
								if event.interrupted then
									bolt3Frame6( bolt3, event )
									return 
								else
									bolt3:beginAnimation( "keyframe", 4190, false, false, CoD.TweenType.Linear )
									bolt3:registerEventHandler( "transition_complete_keyframe", bolt3Frame6 )
								end
							end
							
							if event.interrupted then
								bolt3Frame5( bolt3, event )
								return 
							else
								bolt3:beginAnimation( "keyframe", 940, false, false, CoD.TweenType.Linear )
								bolt3:setAlpha( 0 )
								bolt3:registerEventHandler( "transition_complete_keyframe", bolt3Frame5 )
							end
						end
						
						if event.interrupted then
							bolt3Frame4( bolt3, event )
							return 
						else
							bolt3:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							bolt3:setAlpha( 1 )
							bolt3:registerEventHandler( "transition_complete_keyframe", bolt3Frame4 )
						end
					end
					
					if event.interrupted then
						bolt3Frame3( bolt3, event )
						return 
					else
						bolt3:beginAnimation( "keyframe", 1940, false, false, CoD.TweenType.Linear )
						bolt3:registerEventHandler( "transition_complete_keyframe", bolt3Frame3 )
					end
				end
				
				bolt3:completeAnimation()
				self.bolt3:setAlpha( 0 )
				bolt3Frame2( bolt3, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

