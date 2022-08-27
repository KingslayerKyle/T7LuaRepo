-- c8c8e128b7d4450c3f3ff296f48c015d
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_CodChamps_Knockout = InheritFrom( LUI.UIElement )
CoD.CallingCards_CodChamps_Knockout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_CodChamps_Knockout )
	self.id = "CallingCards_CodChamps_Knockout"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcards_knockout_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( true, false, 0, 480 )
	bg2:setTopBottom( true, false, 0, 120 )
	bg2:setImage( RegisterImage( "uie_t7_callingcards_knockout_lightblur" ) )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local fighters1 = LUI.UIImage.new()
	fighters1:setLeftRight( true, false, 0, 480 )
	fighters1:setTopBottom( true, false, 0, 120 )
	fighters1:setImage( RegisterImage( "uie_t7_callingcards_knockout_fighters1" ) )
	self:addElement( fighters1 )
	self.fighters1 = fighters1
	
	local fighters2 = LUI.UIImage.new()
	fighters2:setLeftRight( true, false, 0, 480 )
	fighters2:setTopBottom( true, false, 0, 120 )
	fighters2:setAlpha( 0 )
	fighters2:setImage( RegisterImage( "uie_t7_callingcards_knockout_fighters2" ) )
	self:addElement( fighters2 )
	self.fighters2 = fighters2
	
	local fighters3 = LUI.UIImage.new()
	fighters3:setLeftRight( true, false, 0, 480 )
	fighters3:setTopBottom( true, false, 0, 120 )
	fighters3:setAlpha( 0 )
	fighters3:setImage( RegisterImage( "uie_t7_callingcards_knockout_fighters3" ) )
	self:addElement( fighters3 )
	self.fighters3 = fighters3
	
	local blood1 = LUI.UIImage.new()
	blood1:setLeftRight( true, false, 0, 216 )
	blood1:setTopBottom( true, false, 0, 120 )
	blood1:setImage( RegisterImage( "uie_t7_callingcards_knockout_blood1" ) )
	self:addElement( blood1 )
	self.blood1 = blood1
	
	local blood10 = LUI.UIImage.new()
	blood10:setLeftRight( true, false, 473, 689 )
	blood10:setTopBottom( true, false, 55, 175 )
	blood10:setZRot( -189 )
	blood10:setScale( 1.9 )
	blood10:setImage( RegisterImage( "uie_t7_callingcards_knockout_blood1" ) )
	self:addElement( blood10 )
	self.blood10 = blood10
	
	local blood20 = LUI.UIImage.new()
	blood20:setLeftRight( true, false, -161, 55 )
	blood20:setTopBottom( true, false, -60, 60 )
	blood20:setScale( 2.1 )
	blood20:setImage( RegisterImage( "uie_t7_callingcards_knockout_blood2" ) )
	self:addElement( blood20 )
	self.blood20 = blood20
	
	local blood200 = LUI.UIImage.new()
	blood200:setLeftRight( true, false, 137, 353 )
	blood200:setTopBottom( true, false, 3, 123 )
	blood200:setAlpha( 0 )
	blood200:setZRot( -19 )
	blood200:setScale( 2.1 )
	blood200:setImage( RegisterImage( "uie_t7_callingcards_knockout_blood2" ) )
	self:addElement( blood200 )
	self.blood200 = blood200
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local bg2Frame2 = function ( bg2, event )
					local bg2Frame3 = function ( bg2, event )
						local bg2Frame4 = function ( bg2, event )
							local bg2Frame5 = function ( bg2, event )
								local bg2Frame6 = function ( bg2, event )
									local bg2Frame7 = function ( bg2, event )
										local bg2Frame8 = function ( bg2, event )
											local bg2Frame9 = function ( bg2, event )
												local bg2Frame10 = function ( bg2, event )
													if not event.interrupted then
														bg2:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
													end
													bg2:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( bg2, event )
													else
														bg2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bg2Frame10( bg2, event )
													return 
												else
													bg2:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
													bg2:setAlpha( 1 )
													bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame10 )
												end
											end
											
											if event.interrupted then
												bg2Frame9( bg2, event )
												return 
											else
												bg2:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
												bg2:setAlpha( 0.59 )
												bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame9 )
											end
										end
										
										if event.interrupted then
											bg2Frame8( bg2, event )
											return 
										else
											bg2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											bg2:setAlpha( 1 )
											bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame8 )
										end
									end
									
									if event.interrupted then
										bg2Frame7( bg2, event )
										return 
									else
										bg2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										bg2:setAlpha( 0.6 )
										bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame7 )
									end
								end
								
								if event.interrupted then
									bg2Frame6( bg2, event )
									return 
								else
									bg2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									bg2:setAlpha( 1 )
									bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame6 )
								end
							end
							
							if event.interrupted then
								bg2Frame5( bg2, event )
								return 
							else
								bg2:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
								bg2:setAlpha( 0.61 )
								bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame5 )
							end
						end
						
						if event.interrupted then
							bg2Frame4( bg2, event )
							return 
						else
							bg2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							bg2:setAlpha( 1 )
							bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame4 )
						end
					end
					
					if event.interrupted then
						bg2Frame3( bg2, event )
						return 
					else
						bg2:beginAnimation( "keyframe", 930, false, false, CoD.TweenType.Linear )
						bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame3 )
					end
				end
				
				bg2:completeAnimation()
				self.bg2:setAlpha( 0 )
				bg2Frame2( bg2, {} )
				local fighters1Frame2 = function ( fighters1, event )
					local fighters1Frame3 = function ( fighters1, event )
						local fighters1Frame4 = function ( fighters1, event )
							local fighters1Frame5 = function ( fighters1, event )
								if not event.interrupted then
									fighters1:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
								end
								fighters1:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( fighters1, event )
								else
									fighters1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								fighters1Frame5( fighters1, event )
								return 
							else
								fighters1:beginAnimation( "keyframe", 2849, false, false, CoD.TweenType.Linear )
								fighters1:registerEventHandler( "transition_complete_keyframe", fighters1Frame5 )
							end
						end
						
						if event.interrupted then
							fighters1Frame4( fighters1, event )
							return 
						else
							fighters1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							fighters1:setAlpha( 0 )
							fighters1:registerEventHandler( "transition_complete_keyframe", fighters1Frame4 )
						end
					end
					
					if event.interrupted then
						fighters1Frame3( fighters1, event )
						return 
					else
						fighters1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						fighters1:registerEventHandler( "transition_complete_keyframe", fighters1Frame3 )
					end
				end
				
				fighters1:completeAnimation()
				self.fighters1:setAlpha( 1 )
				fighters1Frame2( fighters1, {} )
				local fighters2Frame2 = function ( fighters2, event )
					local fighters2Frame3 = function ( fighters2, event )
						local fighters2Frame4 = function ( fighters2, event )
							local fighters2Frame5 = function ( fighters2, event )
								if not event.interrupted then
									fighters2:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								end
								fighters2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( fighters2, event )
								else
									fighters2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								fighters2Frame5( fighters2, event )
								return 
							else
								fighters2:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								fighters2:registerEventHandler( "transition_complete_keyframe", fighters2Frame5 )
							end
						end
						
						if event.interrupted then
							fighters2Frame4( fighters2, event )
							return 
						else
							fighters2:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
							fighters2:setAlpha( 1 )
							fighters2:registerEventHandler( "transition_complete_keyframe", fighters2Frame4 )
						end
					end
					
					if event.interrupted then
						fighters2Frame3( fighters2, event )
						return 
					else
						fighters2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						fighters2:registerEventHandler( "transition_complete_keyframe", fighters2Frame3 )
					end
				end
				
				fighters2:completeAnimation()
				self.fighters2:setAlpha( 0 )
				fighters2Frame2( fighters2, {} )
				local f2_local3 = function ( f20_arg0, f20_arg1 )
					local f20_local0 = function ( f21_arg0, f21_arg1 )
						local f21_local0 = function ( f22_arg0, f22_arg1 )
							local f22_local0 = function ( f23_arg0, f23_arg1 )
								local f23_local0 = function ( f24_arg0, f24_arg1 )
									local f24_local0 = function ( f25_arg0, f25_arg1 )
										if not f25_arg1.interrupted then
											f25_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
										end
										f25_arg0:setLeftRight( true, false, 0, 480 )
										f25_arg0:setTopBottom( true, false, 4, 124 )
										f25_arg0:setAlpha( 0 )
										f25_arg0:setScale( 1.1 )
										if f25_arg1.interrupted then
											self.clipFinished( f25_arg0, f25_arg1 )
										else
											f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f24_arg1.interrupted then
										f24_local0( f24_arg0, f24_arg1 )
										return 
									else
										f24_arg0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
										f24_arg0:setTopBottom( true, false, 3.86, 123.86 )
										f24_arg0:setAlpha( 0.15 )
										f24_arg0:setScale( 1.1 )
										f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
									end
								end
								
								if f23_arg1.interrupted then
									f23_local0( f23_arg0, f23_arg1 )
									return 
								else
									f23_arg0:beginAnimation( "keyframe", 1929, false, false, CoD.TweenType.Linear )
									f23_arg0:setTopBottom( true, false, 3.04, 123.04 )
									f23_arg0:setScale( 1.08 )
									f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
								end
							end
							
							if f22_arg1.interrupted then
								f22_local0( f22_arg0, f22_arg1 )
								return 
							else
								f22_arg0:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
								f22_arg0:setScale( 1.03 )
								f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
							end
						end
						
						if f21_arg1.interrupted then
							f21_local0( f21_arg0, f21_arg1 )
							return 
						else
							f21_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
						end
					end
					
					if f20_arg1.interrupted then
						f20_local0( f20_arg0, f20_arg1 )
						return 
					else
						f20_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						f20_arg0:setAlpha( 1 )
						f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
					end
				end
				
				fighters3:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				fighters3:setLeftRight( true, false, 0, 480 )
				fighters3:setTopBottom( true, false, 0, 120 )
				fighters3:setAlpha( 0 )
				fighters3:setScale( 1 )
				fighters3:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local blood1Frame2 = function ( blood1, event )
					local blood1Frame3 = function ( blood1, event )
						local blood1Frame4 = function ( blood1, event )
							local blood1Frame5 = function ( blood1, event )
								local blood1Frame6 = function ( blood1, event )
									local blood1Frame7 = function ( blood1, event )
										local blood1Frame8 = function ( blood1, event )
											local blood1Frame9 = function ( blood1, event )
												if not event.interrupted then
													blood1:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
												end
												blood1:setLeftRight( true, false, -120, 96 )
												blood1:setTopBottom( true, false, -50, 70 )
												blood1:setAlpha( 0 )
												blood1:setScale( 1.8 )
												if event.interrupted then
													self.clipFinished( blood1, event )
												else
													blood1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												blood1Frame9( blood1, event )
												return 
											else
												blood1:beginAnimation( "keyframe", 1750, false, false, CoD.TweenType.Linear )
												blood1:registerEventHandler( "transition_complete_keyframe", blood1Frame9 )
											end
										end
										
										if event.interrupted then
											blood1Frame8( blood1, event )
											return 
										else
											blood1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											blood1:setAlpha( 1 )
											blood1:registerEventHandler( "transition_complete_keyframe", blood1Frame8 )
										end
									end
									
									if event.interrupted then
										blood1Frame7( blood1, event )
										return 
									else
										blood1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										blood1:registerEventHandler( "transition_complete_keyframe", blood1Frame7 )
									end
								end
								
								if event.interrupted then
									blood1Frame6( blood1, event )
									return 
								else
									blood1:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
									blood1:setLeftRight( true, false, -120, 96 )
									blood1:setTopBottom( true, false, -50, 70 )
									blood1:setScale( 1.8 )
									blood1:registerEventHandler( "transition_complete_keyframe", blood1Frame6 )
								end
							end
							
							if event.interrupted then
								blood1Frame5( blood1, event )
								return 
							else
								blood1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
								blood1:setAlpha( 0 )
								blood1:registerEventHandler( "transition_complete_keyframe", blood1Frame5 )
							end
						end
						
						if event.interrupted then
							blood1Frame4( blood1, event )
							return 
						else
							blood1:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
							blood1:setLeftRight( true, false, -76, 140 )
							blood1:setTopBottom( true, false, 0, 120 )
							blood1:setAlpha( 1 )
							blood1:setScale( 1.2 )
							blood1:registerEventHandler( "transition_complete_keyframe", blood1Frame4 )
						end
					end
					
					if event.interrupted then
						blood1Frame3( blood1, event )
						return 
					else
						blood1:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
						blood1:registerEventHandler( "transition_complete_keyframe", blood1Frame3 )
					end
				end
				
				blood1:completeAnimation()
				self.blood1:setLeftRight( true, false, 39, 255 )
				self.blood1:setTopBottom( true, false, -13, 107 )
				self.blood1:setAlpha( 0 )
				self.blood1:setScale( 0.7 )
				blood1Frame2( blood1, {} )
				local blood10Frame2 = function ( blood10, event )
					local blood10Frame3 = function ( blood10, event )
						local blood10Frame4 = function ( blood10, event )
							local blood10Frame5 = function ( blood10, event )
								local blood10Frame6 = function ( blood10, event )
									local blood10Frame7 = function ( blood10, event )
										local blood10Frame8 = function ( blood10, event )
											local blood10Frame9 = function ( blood10, event )
												local blood10Frame10 = function ( blood10, event )
													local blood10Frame11 = function ( blood10, event )
														if not event.interrupted then
															blood10:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
														end
														blood10:setLeftRight( true, false, 188, 404 )
														blood10:setTopBottom( true, false, 137, 257 )
														blood10:setAlpha( 0 )
														blood10:setZRot( -206 )
														if event.interrupted then
															self.clipFinished( blood10, event )
														else
															blood10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														blood10Frame11( blood10, event )
														return 
													else
														blood10:beginAnimation( "keyframe", 1609, false, false, CoD.TweenType.Linear )
														blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame11 )
													end
												end
												
												if event.interrupted then
													blood10Frame10( blood10, event )
													return 
												else
													blood10:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													blood10:setAlpha( 0.5 )
													blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame10 )
												end
											end
											
											if event.interrupted then
												blood10Frame9( blood10, event )
												return 
											else
												blood10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												blood10:setLeftRight( true, false, 188, 404 )
												blood10:setTopBottom( true, false, 137, 257 )
												blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame9 )
											end
										end
										
										if event.interrupted then
											blood10Frame8( blood10, event )
											return 
										else
											blood10:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											blood10:setLeftRight( true, false, 196, 412 )
											blood10:setTopBottom( true, false, 89, 209 )
											blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame8 )
										end
									end
									
									if event.interrupted then
										blood10Frame7( blood10, event )
										return 
									else
										blood10:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame7 )
									end
								end
								
								if event.interrupted then
									blood10Frame6( blood10, event )
									return 
								else
									blood10:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
									blood10:setAlpha( 0 )
									blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame6 )
								end
							end
							
							if event.interrupted then
								blood10Frame5( blood10, event )
								return 
							else
								blood10:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
								blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame5 )
							end
						end
						
						if event.interrupted then
							blood10Frame4( blood10, event )
							return 
						else
							blood10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							blood10:setAlpha( 1 )
							blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame4 )
						end
					end
					
					if event.interrupted then
						blood10Frame3( blood10, event )
						return 
					else
						blood10:beginAnimation( "keyframe", 1139, false, false, CoD.TweenType.Linear )
						blood10:registerEventHandler( "transition_complete_keyframe", blood10Frame3 )
					end
				end
				
				blood10:completeAnimation()
				self.blood10:setLeftRight( true, false, 473, 689 )
				self.blood10:setTopBottom( true, false, 55, 175 )
				self.blood10:setAlpha( 0 )
				self.blood10:setZRot( -206 )
				blood10Frame2( blood10, {} )
				local blood20Frame2 = function ( blood20, event )
					local blood20Frame3 = function ( blood20, event )
						local blood20Frame4 = function ( blood20, event )
							local blood20Frame5 = function ( blood20, event )
								if not event.interrupted then
									blood20:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
								end
								blood20:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( blood20, event )
								else
									blood20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								blood20Frame5( blood20, event )
								return 
							else
								blood20:beginAnimation( "keyframe", 2599, false, false, CoD.TweenType.Linear )
								blood20:registerEventHandler( "transition_complete_keyframe", blood20Frame5 )
							end
						end
						
						if event.interrupted then
							blood20Frame4( blood20, event )
							return 
						else
							blood20:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							blood20:setAlpha( 1 )
							blood20:registerEventHandler( "transition_complete_keyframe", blood20Frame4 )
						end
					end
					
					if event.interrupted then
						blood20Frame3( blood20, event )
						return 
					else
						blood20:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
						blood20:registerEventHandler( "transition_complete_keyframe", blood20Frame3 )
					end
				end
				
				blood20:completeAnimation()
				self.blood20:setAlpha( 0 )
				blood20Frame2( blood20, {} )
				local blood200Frame2 = function ( blood200, event )
					local blood200Frame3 = function ( blood200, event )
						local blood200Frame4 = function ( blood200, event )
							local blood200Frame5 = function ( blood200, event )
								if not event.interrupted then
									blood200:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
								end
								blood200:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( blood200, event )
								else
									blood200:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								blood200Frame5( blood200, event )
								return 
							else
								blood200:beginAnimation( "keyframe", 1609, false, false, CoD.TweenType.Linear )
								blood200:registerEventHandler( "transition_complete_keyframe", blood200Frame5 )
							end
						end
						
						if event.interrupted then
							blood200Frame4( blood200, event )
							return 
						else
							blood200:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							blood200:setAlpha( 1 )
							blood200:registerEventHandler( "transition_complete_keyframe", blood200Frame4 )
						end
					end
					
					if event.interrupted then
						blood200Frame3( blood200, event )
						return 
					else
						blood200:beginAnimation( "keyframe", 1909, false, false, CoD.TweenType.Linear )
						blood200:registerEventHandler( "transition_complete_keyframe", blood200Frame3 )
					end
				end
				
				blood200:completeAnimation()
				self.blood200:setAlpha( 0 )
				blood200Frame2( blood200, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

