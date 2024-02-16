-- f15f5af04c940d03f3511e3151e6530c
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_loot_bboy = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_bboy.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_bboy )
	self.id = "CallingCards_loot_bboy"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_bboy_master_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( true, false, 0, 480 )
	bg0:setTopBottom( true, false, 0, 120 )
	bg0:setImage( RegisterImage( "uie_t7_loot_callingcard_bboy_master_bg2" ) )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local speakers = LUI.UIImage.new()
	speakers:setLeftRight( true, false, 0, 480 )
	speakers:setTopBottom( true, false, 0, 120 )
	speakers:setImage( RegisterImage( "uie_t7_loot_callingcard_bboy_master_speaker" ) )
	self:addElement( speakers )
	self.speakers = speakers
	
	local dude1 = LUI.UIImage.new()
	dude1:setLeftRight( true, false, 0, 480 )
	dude1:setTopBottom( true, false, 0, 120 )
	dude1:setImage( RegisterImage( "uie_t7_loot_callingcard_bboy_master_dude1" ) )
	self:addElement( dude1 )
	self.dude1 = dude1
	
	local dude2 = LUI.UIImage.new()
	dude2:setLeftRight( true, false, 0, 480 )
	dude2:setTopBottom( true, false, 0, 120 )
	dude2:setImage( RegisterImage( "uie_t7_loot_callingcard_bboy_master_dude2" ) )
	self:addElement( dude2 )
	self.dude2 = dude2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local bg0Frame2 = function ( bg0, event )
					local bg0Frame3 = function ( bg0, event )
						local bg0Frame4 = function ( bg0, event )
							local bg0Frame5 = function ( bg0, event )
								local bg0Frame6 = function ( bg0, event )
									local bg0Frame7 = function ( bg0, event )
										local bg0Frame8 = function ( bg0, event )
											local bg0Frame9 = function ( bg0, event )
												local bg0Frame10 = function ( bg0, event )
													local bg0Frame11 = function ( bg0, event )
														if not event.interrupted then
															bg0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
														end
														bg0:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( bg0, event )
														else
															bg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														bg0Frame11( bg0, event )
														return 
													else
														bg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
														bg0:setAlpha( 1 )
														bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame11 )
													end
												end
												
												if event.interrupted then
													bg0Frame10( bg0, event )
													return 
												else
													bg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													bg0:setAlpha( 0 )
													bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame10 )
												end
											end
											
											if event.interrupted then
												bg0Frame9( bg0, event )
												return 
											else
												bg0:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
												bg0:setAlpha( 1 )
												bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame9 )
											end
										end
										
										if event.interrupted then
											bg0Frame8( bg0, event )
											return 
										else
											bg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
											bg0:setAlpha( 0 )
											bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame8 )
										end
									end
									
									if event.interrupted then
										bg0Frame7( bg0, event )
										return 
									else
										bg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
										bg0:setAlpha( 0.57 )
										bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame7 )
									end
								end
								
								if event.interrupted then
									bg0Frame6( bg0, event )
									return 
								else
									bg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									bg0:setAlpha( 0 )
									bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame6 )
								end
							end
							
							if event.interrupted then
								bg0Frame5( bg0, event )
								return 
							else
								bg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame5 )
							end
						end
						
						if event.interrupted then
							bg0Frame4( bg0, event )
							return 
						else
							bg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							bg0:setAlpha( 1 )
							bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame4 )
						end
					end
					
					if event.interrupted then
						bg0Frame3( bg0, event )
						return 
					else
						bg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						bg0:setAlpha( 0 )
						bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame3 )
					end
				end
				
				bg0:completeAnimation()
				self.bg0:setAlpha( 1 )
				bg0Frame2( bg0, {} )
				local speakersFrame2 = function ( speakers, event )
					local speakersFrame3 = function ( speakers, event )
						local speakersFrame4 = function ( speakers, event )
							local speakersFrame5 = function ( speakers, event )
								local speakersFrame6 = function ( speakers, event )
									local speakersFrame7 = function ( speakers, event )
										local speakersFrame8 = function ( speakers, event )
											local speakersFrame9 = function ( speakers, event )
												if not event.interrupted then
													speakers:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
												end
												speakers:setScale( 1 )
												if event.interrupted then
													self.clipFinished( speakers, event )
												else
													speakers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												speakersFrame9( speakers, event )
												return 
											else
												speakers:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
												speakers:setScale( 1.1 )
												speakers:registerEventHandler( "transition_complete_keyframe", speakersFrame9 )
											end
										end
										
										if event.interrupted then
											speakersFrame8( speakers, event )
											return 
										else
											speakers:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
											speakers:registerEventHandler( "transition_complete_keyframe", speakersFrame8 )
										end
									end
									
									if event.interrupted then
										speakersFrame7( speakers, event )
										return 
									else
										speakers:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
										speakers:setScale( 1 )
										speakers:registerEventHandler( "transition_complete_keyframe", speakersFrame7 )
									end
								end
								
								if event.interrupted then
									speakersFrame6( speakers, event )
									return 
								else
									speakers:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									speakers:setScale( 1.1 )
									speakers:registerEventHandler( "transition_complete_keyframe", speakersFrame6 )
								end
							end
							
							if event.interrupted then
								speakersFrame5( speakers, event )
								return 
							else
								speakers:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
								speakers:registerEventHandler( "transition_complete_keyframe", speakersFrame5 )
							end
						end
						
						if event.interrupted then
							speakersFrame4( speakers, event )
							return 
						else
							speakers:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							speakers:setScale( 1 )
							speakers:registerEventHandler( "transition_complete_keyframe", speakersFrame4 )
						end
					end
					
					if event.interrupted then
						speakersFrame3( speakers, event )
						return 
					else
						speakers:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						speakers:setScale( 1.1 )
						speakers:registerEventHandler( "transition_complete_keyframe", speakersFrame3 )
					end
				end
				
				speakers:completeAnimation()
				self.speakers:setScale( 1 )
				speakersFrame2( speakers, {} )
				local dude2Frame2 = function ( dude2, event )
					local dude2Frame3 = function ( dude2, event )
						local dude2Frame4 = function ( dude2, event )
							local dude2Frame5 = function ( dude2, event )
								local dude2Frame6 = function ( dude2, event )
									local dude2Frame7 = function ( dude2, event )
										local dude2Frame8 = function ( dude2, event )
											local dude2Frame9 = function ( dude2, event )
												local dude2Frame10 = function ( dude2, event )
													local dude2Frame11 = function ( dude2, event )
														if not event.interrupted then
															dude2:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
														end
														dude2:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( dude2, event )
														else
															dude2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														dude2Frame11( dude2, event )
														return 
													else
														dude2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
														dude2:setAlpha( 0 )
														dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame11 )
													end
												end
												
												if event.interrupted then
													dude2Frame10( dude2, event )
													return 
												else
													dude2:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													dude2:setAlpha( 1 )
													dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame10 )
												end
											end
											
											if event.interrupted then
												dude2Frame9( dude2, event )
												return 
											else
												dude2:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
												dude2:setAlpha( 0 )
												dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame9 )
											end
										end
										
										if event.interrupted then
											dude2Frame8( dude2, event )
											return 
										else
											dude2:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
											dude2:setAlpha( 1 )
											dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame8 )
										end
									end
									
									if event.interrupted then
										dude2Frame7( dude2, event )
										return 
									else
										dude2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
										dude2:setAlpha( 0.41 )
										dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame7 )
									end
								end
								
								if event.interrupted then
									dude2Frame6( dude2, event )
									return 
								else
									dude2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									dude2:setAlpha( 1 )
									dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame6 )
								end
							end
							
							if event.interrupted then
								dude2Frame5( dude2, event )
								return 
							else
								dude2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame5 )
							end
						end
						
						if event.interrupted then
							dude2Frame4( dude2, event )
							return 
						else
							dude2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							dude2:setAlpha( 0 )
							dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame4 )
						end
					end
					
					if event.interrupted then
						dude2Frame3( dude2, event )
						return 
					else
						dude2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						dude2:setAlpha( 1 )
						dude2:registerEventHandler( "transition_complete_keyframe", dude2Frame3 )
					end
				end
				
				dude2:completeAnimation()
				self.dude2:setAlpha( 0 )
				dude2Frame2( dude2, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
