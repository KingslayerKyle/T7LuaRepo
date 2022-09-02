-- 81f1fd6b7e95d41305b422fc9bc2284f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCard_loot_7deadlysins = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_7deadlysins.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_7deadlysins )
	self.id = "CallingCard_loot_7deadlysins"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_bg1" ) )
	self:addElement( bg )
	self.bg = bg
	
	local Face1 = LUI.UIImage.new()
	Face1:setLeftRight( true, false, 0, 276 )
	Face1:setTopBottom( true, false, 0, 120 )
	Face1:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_face1" ) )
	self:addElement( Face1 )
	self.Face1 = Face1
	
	local Face2 = LUI.UIImage.new()
	Face2:setLeftRight( true, false, 230, 386 )
	Face2:setTopBottom( true, false, 0, 120 )
	Face2:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_face2" ) )
	self:addElement( Face2 )
	self.Face2 = Face2
	
	local Face3 = LUI.UIImage.new()
	Face3:setLeftRight( true, false, 324, 480 )
	Face3:setTopBottom( true, false, 0, 120 )
	Face3:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_face3" ) )
	self:addElement( Face3 )
	self.Face3 = Face3
	
	local Smoke1 = LUI.UIImage.new()
	Smoke1:setLeftRight( true, false, 0, 140 )
	Smoke1:setTopBottom( true, false, 0, 120 )
	Smoke1:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke1a" ) )
	self:addElement( Smoke1 )
	self.Smoke1 = Smoke1
	
	local Smoke1b = LUI.UIImage.new()
	Smoke1b:setLeftRight( true, false, 0, 140 )
	Smoke1b:setTopBottom( true, false, 0, 120 )
	Smoke1b:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke1b" ) )
	self:addElement( Smoke1b )
	self.Smoke1b = Smoke1b
	
	local Smoke1c = LUI.UIImage.new()
	Smoke1c:setLeftRight( true, false, 0, 140 )
	Smoke1c:setTopBottom( true, false, 0, 120 )
	Smoke1c:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke1c" ) )
	self:addElement( Smoke1c )
	self.Smoke1c = Smoke1c
	
	local Smoke2 = LUI.UIImage.new()
	Smoke2:setLeftRight( true, false, 95, 244 )
	Smoke2:setTopBottom( true, false, 0, 120 )
	Smoke2:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke2a" ) )
	self:addElement( Smoke2 )
	self.Smoke2 = Smoke2
	
	local Smoke2b = LUI.UIImage.new()
	Smoke2b:setLeftRight( true, false, 95, 244 )
	Smoke2b:setTopBottom( true, false, 0, 120 )
	Smoke2b:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke2b" ) )
	self:addElement( Smoke2b )
	self.Smoke2b = Smoke2b
	
	local Smoke2c = LUI.UIImage.new()
	Smoke2c:setLeftRight( true, false, 95, 244 )
	Smoke2c:setTopBottom( true, false, 0, 120 )
	Smoke2c:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke2c" ) )
	self:addElement( Smoke2c )
	self.Smoke2c = Smoke2c
	
	local Smoke3 = LUI.UIImage.new()
	Smoke3:setLeftRight( true, false, 230, 386 )
	Smoke3:setTopBottom( true, false, 0, 120 )
	Smoke3:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke3a" ) )
	self:addElement( Smoke3 )
	self.Smoke3 = Smoke3
	
	local Smoke3b = LUI.UIImage.new()
	Smoke3b:setLeftRight( true, false, 230, 386 )
	Smoke3b:setTopBottom( true, false, 0, 120 )
	Smoke3b:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke3b" ) )
	self:addElement( Smoke3b )
	self.Smoke3b = Smoke3b
	
	local Smoke3c = LUI.UIImage.new()
	Smoke3c:setLeftRight( true, false, 230, 386 )
	Smoke3c:setTopBottom( true, false, 0, 120 )
	Smoke3c:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke3c" ) )
	self:addElement( Smoke3c )
	self.Smoke3c = Smoke3c
	
	local Smoke4 = LUI.UIImage.new()
	Smoke4:setLeftRight( true, false, 348, 480 )
	Smoke4:setTopBottom( true, false, 0, 120 )
	Smoke4:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke4a" ) )
	self:addElement( Smoke4 )
	self.Smoke4 = Smoke4
	
	local Smoke4b = LUI.UIImage.new()
	Smoke4b:setLeftRight( true, false, 348, 480 )
	Smoke4b:setTopBottom( true, false, 0, 120 )
	Smoke4b:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke4b" ) )
	self:addElement( Smoke4b )
	self.Smoke4b = Smoke4b
	
	local Smoke4c = LUI.UIImage.new()
	Smoke4c:setLeftRight( true, false, 348, 480 )
	Smoke4c:setTopBottom( true, false, 0, 120 )
	Smoke4c:setImage( RegisterImage( "uie_t7_loot_callingcard_7deadlysins_smoke4c" ) )
	self:addElement( Smoke4c )
	self.Smoke4c = Smoke4c
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( true, true, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( true, true, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )

				local Face1Frame2 = function ( Face1, event )
					local Face1Frame3 = function ( Face1, event )
						local Face1Frame4 = function ( Face1, event )
							local Face1Frame5 = function ( Face1, event )
								local Face1Frame6 = function ( Face1, event )
									local Face1Frame7 = function ( Face1, event )
										local Face1Frame8 = function ( Face1, event )
											local Face1Frame9 = function ( Face1, event )
												local Face1Frame10 = function ( Face1, event )
													local Face1Frame11 = function ( Face1, event )
														local Face1Frame12 = function ( Face1, event )
															if not event.interrupted then
																Face1:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
															end
															Face1:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Face1, event )
															else
																Face1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Face1Frame12( Face1, event )
															return 
														else
															Face1:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
															Face1:setAlpha( 1 )
															Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame12 )
														end
													end
													
													if event.interrupted then
														Face1Frame11( Face1, event )
														return 
													else
														Face1:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
														Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame11 )
													end
												end
												
												if event.interrupted then
													Face1Frame10( Face1, event )
													return 
												else
													Face1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
													Face1:setAlpha( 0 )
													Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame10 )
												end
											end
											
											if event.interrupted then
												Face1Frame9( Face1, event )
												return 
											else
												Face1:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
												Face1:setAlpha( 0.74 )
												Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame9 )
											end
										end
										
										if event.interrupted then
											Face1Frame8( Face1, event )
											return 
										else
											Face1:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
											Face1:setAlpha( 0.35 )
											Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame8 )
										end
									end
									
									if event.interrupted then
										Face1Frame7( Face1, event )
										return 
									else
										Face1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										Face1:setAlpha( 1 )
										Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame7 )
									end
								end
								
								if event.interrupted then
									Face1Frame6( Face1, event )
									return 
								else
									Face1:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
									Face1:setAlpha( 0.45 )
									Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame6 )
								end
							end
							
							if event.interrupted then
								Face1Frame5( Face1, event )
								return 
							else
								Face1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								Face1:setAlpha( 1 )
								Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame5 )
							end
						end
						
						if event.interrupted then
							Face1Frame4( Face1, event )
							return 
						else
							Face1:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
							Face1:setAlpha( 0.54 )
							Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame4 )
						end
					end
					
					if event.interrupted then
						Face1Frame3( Face1, event )
						return 
					else
						Face1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Face1:setAlpha( 1 )
						Face1:registerEventHandler( "transition_complete_keyframe", Face1Frame3 )
					end
				end
				
				Face1:completeAnimation()
				self.Face1:setAlpha( 0 )
				Face1Frame2( Face1, {} )
				local Face2Frame2 = function ( Face2, event )
					local Face2Frame3 = function ( Face2, event )
						local Face2Frame4 = function ( Face2, event )
							local Face2Frame5 = function ( Face2, event )
								local Face2Frame6 = function ( Face2, event )
									local Face2Frame7 = function ( Face2, event )
										local Face2Frame8 = function ( Face2, event )
											local Face2Frame9 = function ( Face2, event )
												local Face2Frame10 = function ( Face2, event )
													local Face2Frame11 = function ( Face2, event )
														local Face2Frame12 = function ( Face2, event )
															local Face2Frame13 = function ( Face2, event )
																local Face2Frame14 = function ( Face2, event )
																	local Face2Frame15 = function ( Face2, event )
																		local Face2Frame16 = function ( Face2, event )
																			if not event.interrupted then
																				Face2:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																			end
																			Face2:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( Face2, event )
																			else
																				Face2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			Face2Frame16( Face2, event )
																			return 
																		else
																			Face2:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																			Face2:setAlpha( 1 )
																			Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Face2Frame15( Face2, event )
																		return 
																	else
																		Face2:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																		Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame15 )
																	end
																end
																
																if event.interrupted then
																	Face2Frame14( Face2, event )
																	return 
																else
																	Face2:beginAnimation( "keyframe", 890, false, false, CoD.TweenType.Linear )
																	Face2:setAlpha( 0 )
																	Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame14 )
																end
															end
															
															if event.interrupted then
																Face2Frame13( Face2, event )
																return 
															else
																Face2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																Face2:setAlpha( 1 )
																Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame13 )
															end
														end
														
														if event.interrupted then
															Face2Frame12( Face2, event )
															return 
														else
															Face2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
															Face2:setAlpha( 0 )
															Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame12 )
														end
													end
													
													if event.interrupted then
														Face2Frame11( Face2, event )
														return 
													else
														Face2:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
														Face2:setAlpha( 0.3 )
														Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame11 )
													end
												end
												
												if event.interrupted then
													Face2Frame10( Face2, event )
													return 
												else
													Face2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
													Face2:setAlpha( 1 )
													Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame10 )
												end
											end
											
											if event.interrupted then
												Face2Frame9( Face2, event )
												return 
											else
												Face2:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
												Face2:setAlpha( 0.37 )
												Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame9 )
											end
										end
										
										if event.interrupted then
											Face2Frame8( Face2, event )
											return 
										else
											Face2:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											Face2:setAlpha( 1 )
											Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame8 )
										end
									end
									
									if event.interrupted then
										Face2Frame7( Face2, event )
										return 
									else
										Face2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										Face2:setAlpha( 0 )
										Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame7 )
									end
								end
								
								if event.interrupted then
									Face2Frame6( Face2, event )
									return 
								else
									Face2:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									Face2:setAlpha( 1 )
									Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame6 )
								end
							end
							
							if event.interrupted then
								Face2Frame5( Face2, event )
								return 
							else
								Face2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
								Face2:setAlpha( 0.49 )
								Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame5 )
							end
						end
						
						if event.interrupted then
							Face2Frame4( Face2, event )
							return 
						else
							Face2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							Face2:setAlpha( 1 )
							Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame4 )
						end
					end
					
					if event.interrupted then
						Face2Frame3( Face2, event )
						return 
					else
						Face2:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Face2:registerEventHandler( "transition_complete_keyframe", Face2Frame3 )
					end
				end
				
				Face2:completeAnimation()
				self.Face2:setAlpha( 0 )
				Face2Frame2( Face2, {} )
				local Face3Frame2 = function ( Face3, event )
					local Face3Frame3 = function ( Face3, event )
						local Face3Frame4 = function ( Face3, event )
							local Face3Frame5 = function ( Face3, event )
								local Face3Frame6 = function ( Face3, event )
									local Face3Frame7 = function ( Face3, event )
										local Face3Frame8 = function ( Face3, event )
											local Face3Frame9 = function ( Face3, event )
												if not event.interrupted then
													Face3:beginAnimation( "keyframe", 570, false, false, CoD.TweenType.Linear )
												end
												Face3:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Face3, event )
												else
													Face3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Face3Frame9( Face3, event )
												return 
											else
												Face3:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
												Face3:setAlpha( 1 )
												Face3:registerEventHandler( "transition_complete_keyframe", Face3Frame9 )
											end
										end
										
										if event.interrupted then
											Face3Frame8( Face3, event )
											return 
										else
											Face3:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
											Face3:registerEventHandler( "transition_complete_keyframe", Face3Frame8 )
										end
									end
									
									if event.interrupted then
										Face3Frame7( Face3, event )
										return 
									else
										Face3:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
										Face3:setAlpha( 0 )
										Face3:registerEventHandler( "transition_complete_keyframe", Face3Frame7 )
									end
								end
								
								if event.interrupted then
									Face3Frame6( Face3, event )
									return 
								else
									Face3:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									Face3:setAlpha( 1 )
									Face3:registerEventHandler( "transition_complete_keyframe", Face3Frame6 )
								end
							end
							
							if event.interrupted then
								Face3Frame5( Face3, event )
								return 
							else
								Face3:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
								Face3:setAlpha( 0.34 )
								Face3:registerEventHandler( "transition_complete_keyframe", Face3Frame5 )
							end
						end
						
						if event.interrupted then
							Face3Frame4( Face3, event )
							return 
						else
							Face3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							Face3:setAlpha( 1 )
							Face3:registerEventHandler( "transition_complete_keyframe", Face3Frame4 )
						end
					end
					
					if event.interrupted then
						Face3Frame3( Face3, event )
						return 
					else
						Face3:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						Face3:registerEventHandler( "transition_complete_keyframe", Face3Frame3 )
					end
				end
				
				Face3:completeAnimation()
				self.Face3:setAlpha( 0 )
				Face3Frame2( Face3, {} )
				local Smoke1Frame2 = function ( Smoke1, event )
					local Smoke1Frame3 = function ( Smoke1, event )
						if not event.interrupted then
							Smoke1:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
						end
						Smoke1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Smoke1, event )
						else
							Smoke1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Smoke1Frame3( Smoke1, event )
						return 
					else
						Smoke1:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						Smoke1:setAlpha( 1 )
						Smoke1:registerEventHandler( "transition_complete_keyframe", Smoke1Frame3 )
					end
				end
				
				Smoke1:completeAnimation()
				self.Smoke1:setAlpha( 0 )
				Smoke1Frame2( Smoke1, {} )
				local Smoke1bFrame2 = function ( Smoke1b, event )
					local Smoke1bFrame3 = function ( Smoke1b, event )
						local Smoke1bFrame4 = function ( Smoke1b, event )
							if not event.interrupted then
								Smoke1b:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
							end
							Smoke1b:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Smoke1b, event )
							else
								Smoke1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Smoke1bFrame4( Smoke1b, event )
							return 
						else
							Smoke1b:beginAnimation( "keyframe", 249, false, false, CoD.TweenType.Linear )
							Smoke1b:setAlpha( 0.9 )
							Smoke1b:registerEventHandler( "transition_complete_keyframe", Smoke1bFrame4 )
						end
					end
					
					if event.interrupted then
						Smoke1bFrame3( Smoke1b, event )
						return 
					else
						Smoke1b:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Smoke1b:registerEventHandler( "transition_complete_keyframe", Smoke1bFrame3 )
					end
				end
				
				Smoke1b:completeAnimation()
				self.Smoke1b:setAlpha( 0 )
				Smoke1bFrame2( Smoke1b, {} )
				local Smoke1cFrame2 = function ( Smoke1c, event )
					local Smoke1cFrame3 = function ( Smoke1c, event )
						local Smoke1cFrame4 = function ( Smoke1c, event )
							if not event.interrupted then
								Smoke1c:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
							end
							Smoke1c:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Smoke1c, event )
							else
								Smoke1c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Smoke1cFrame4( Smoke1c, event )
							return 
						else
							Smoke1c:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							Smoke1c:setAlpha( 1 )
							Smoke1c:registerEventHandler( "transition_complete_keyframe", Smoke1cFrame4 )
						end
					end
					
					if event.interrupted then
						Smoke1cFrame3( Smoke1c, event )
						return 
					else
						Smoke1c:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						Smoke1c:registerEventHandler( "transition_complete_keyframe", Smoke1cFrame3 )
					end
				end
				
				Smoke1c:completeAnimation()
				self.Smoke1c:setAlpha( 0 )
				Smoke1cFrame2( Smoke1c, {} )
				local Smoke2Frame2 = function ( Smoke2, event )
					local Smoke2Frame3 = function ( Smoke2, event )
						local Smoke2Frame4 = function ( Smoke2, event )
							local Smoke2Frame5 = function ( Smoke2, event )
								local Smoke2Frame6 = function ( Smoke2, event )
									local Smoke2Frame7 = function ( Smoke2, event )
										if not event.interrupted then
											Smoke2:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
										end
										Smoke2:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Smoke2, event )
										else
											Smoke2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Smoke2Frame7( Smoke2, event )
										return 
									else
										Smoke2:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
										Smoke2:setAlpha( 1 )
										Smoke2:registerEventHandler( "transition_complete_keyframe", Smoke2Frame7 )
									end
								end
								
								if event.interrupted then
									Smoke2Frame6( Smoke2, event )
									return 
								else
									Smoke2:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
									Smoke2:registerEventHandler( "transition_complete_keyframe", Smoke2Frame6 )
								end
							end
							
							if event.interrupted then
								Smoke2Frame5( Smoke2, event )
								return 
							else
								Smoke2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								Smoke2:setAlpha( 0 )
								Smoke2:registerEventHandler( "transition_complete_keyframe", Smoke2Frame5 )
							end
						end
						
						if event.interrupted then
							Smoke2Frame4( Smoke2, event )
							return 
						else
							Smoke2:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
							Smoke2:setAlpha( 1 )
							Smoke2:registerEventHandler( "transition_complete_keyframe", Smoke2Frame4 )
						end
					end
					
					if event.interrupted then
						Smoke2Frame3( Smoke2, event )
						return 
					else
						Smoke2:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						Smoke2:registerEventHandler( "transition_complete_keyframe", Smoke2Frame3 )
					end
				end
				
				Smoke2:completeAnimation()
				self.Smoke2:setAlpha( 0 )
				Smoke2Frame2( Smoke2, {} )
				local Smoke2bFrame2 = function ( Smoke2b, event )
					local Smoke2bFrame3 = function ( Smoke2b, event )
						local Smoke2bFrame4 = function ( Smoke2b, event )
							local Smoke2bFrame5 = function ( Smoke2b, event )
								local Smoke2bFrame6 = function ( Smoke2b, event )
									local Smoke2bFrame7 = function ( Smoke2b, event )
										if not event.interrupted then
											Smoke2b:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
										end
										Smoke2b:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Smoke2b, event )
										else
											Smoke2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Smoke2bFrame7( Smoke2b, event )
										return 
									else
										Smoke2b:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
										Smoke2b:setAlpha( 1 )
										Smoke2b:registerEventHandler( "transition_complete_keyframe", Smoke2bFrame7 )
									end
								end
								
								if event.interrupted then
									Smoke2bFrame6( Smoke2b, event )
									return 
								else
									Smoke2b:beginAnimation( "keyframe", 1089, false, false, CoD.TweenType.Linear )
									Smoke2b:registerEventHandler( "transition_complete_keyframe", Smoke2bFrame6 )
								end
							end
							
							if event.interrupted then
								Smoke2bFrame5( Smoke2b, event )
								return 
							else
								Smoke2b:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								Smoke2b:setAlpha( 0 )
								Smoke2b:registerEventHandler( "transition_complete_keyframe", Smoke2bFrame5 )
							end
						end
						
						if event.interrupted then
							Smoke2bFrame4( Smoke2b, event )
							return 
						else
							Smoke2b:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
							Smoke2b:setAlpha( 1 )
							Smoke2b:registerEventHandler( "transition_complete_keyframe", Smoke2bFrame4 )
						end
					end
					
					if event.interrupted then
						Smoke2bFrame3( Smoke2b, event )
						return 
					else
						Smoke2b:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						Smoke2b:registerEventHandler( "transition_complete_keyframe", Smoke2bFrame3 )
					end
				end
				
				Smoke2b:completeAnimation()
				self.Smoke2b:setAlpha( 0 )
				Smoke2bFrame2( Smoke2b, {} )
				local Smoke2cFrame2 = function ( Smoke2c, event )
					local Smoke2cFrame3 = function ( Smoke2c, event )
						local Smoke2cFrame4 = function ( Smoke2c, event )
							local Smoke2cFrame5 = function ( Smoke2c, event )
								local Smoke2cFrame6 = function ( Smoke2c, event )
									local Smoke2cFrame7 = function ( Smoke2c, event )
										if not event.interrupted then
											Smoke2c:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
										end
										Smoke2c:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Smoke2c, event )
										else
											Smoke2c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Smoke2cFrame7( Smoke2c, event )
										return 
									else
										Smoke2c:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
										Smoke2c:setAlpha( 1 )
										Smoke2c:registerEventHandler( "transition_complete_keyframe", Smoke2cFrame7 )
									end
								end
								
								if event.interrupted then
									Smoke2cFrame6( Smoke2c, event )
									return 
								else
									Smoke2c:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Linear )
									Smoke2c:registerEventHandler( "transition_complete_keyframe", Smoke2cFrame6 )
								end
							end
							
							if event.interrupted then
								Smoke2cFrame5( Smoke2c, event )
								return 
							else
								Smoke2c:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
								Smoke2c:setAlpha( 0 )
								Smoke2c:registerEventHandler( "transition_complete_keyframe", Smoke2cFrame5 )
							end
						end
						
						if event.interrupted then
							Smoke2cFrame4( Smoke2c, event )
							return 
						else
							Smoke2c:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							Smoke2c:setAlpha( 1 )
							Smoke2c:registerEventHandler( "transition_complete_keyframe", Smoke2cFrame4 )
						end
					end
					
					if event.interrupted then
						Smoke2cFrame3( Smoke2c, event )
						return 
					else
						Smoke2c:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						Smoke2c:registerEventHandler( "transition_complete_keyframe", Smoke2cFrame3 )
					end
				end
				
				Smoke2c:completeAnimation()
				self.Smoke2c:setAlpha( 0 )
				Smoke2cFrame2( Smoke2c, {} )
				local Smoke3Frame2 = function ( Smoke3, event )
					local Smoke3Frame3 = function ( Smoke3, event )
						local Smoke3Frame4 = function ( Smoke3, event )
							local Smoke3Frame5 = function ( Smoke3, event )
								local Smoke3Frame6 = function ( Smoke3, event )
									local Smoke3Frame7 = function ( Smoke3, event )
										if not event.interrupted then
											Smoke3:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
										end
										Smoke3:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Smoke3, event )
										else
											Smoke3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Smoke3Frame7( Smoke3, event )
										return 
									else
										Smoke3:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
										Smoke3:setAlpha( 1 )
										Smoke3:registerEventHandler( "transition_complete_keyframe", Smoke3Frame7 )
									end
								end
								
								if event.interrupted then
									Smoke3Frame6( Smoke3, event )
									return 
								else
									Smoke3:beginAnimation( "keyframe", 2379, false, false, CoD.TweenType.Linear )
									Smoke3:registerEventHandler( "transition_complete_keyframe", Smoke3Frame6 )
								end
							end
							
							if event.interrupted then
								Smoke3Frame5( Smoke3, event )
								return 
							else
								Smoke3:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								Smoke3:setAlpha( 0 )
								Smoke3:registerEventHandler( "transition_complete_keyframe", Smoke3Frame5 )
							end
						end
						
						if event.interrupted then
							Smoke3Frame4( Smoke3, event )
							return 
						else
							Smoke3:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
							Smoke3:setAlpha( 1 )
							Smoke3:registerEventHandler( "transition_complete_keyframe", Smoke3Frame4 )
						end
					end
					
					if event.interrupted then
						Smoke3Frame3( Smoke3, event )
						return 
					else
						Smoke3:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						Smoke3:registerEventHandler( "transition_complete_keyframe", Smoke3Frame3 )
					end
				end
				
				Smoke3:completeAnimation()
				self.Smoke3:setAlpha( 0 )
				Smoke3Frame2( Smoke3, {} )
				local Smoke3bFrame2 = function ( Smoke3b, event )
					local Smoke3bFrame3 = function ( Smoke3b, event )
						local Smoke3bFrame4 = function ( Smoke3b, event )
							local Smoke3bFrame5 = function ( Smoke3b, event )
								local Smoke3bFrame6 = function ( Smoke3b, event )
									local Smoke3bFrame7 = function ( Smoke3b, event )
										if not event.interrupted then
											Smoke3b:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
										end
										Smoke3b:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Smoke3b, event )
										else
											Smoke3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Smoke3bFrame7( Smoke3b, event )
										return 
									else
										Smoke3b:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
										Smoke3b:setAlpha( 1 )
										Smoke3b:registerEventHandler( "transition_complete_keyframe", Smoke3bFrame7 )
									end
								end
								
								if event.interrupted then
									Smoke3bFrame6( Smoke3b, event )
									return 
								else
									Smoke3b:beginAnimation( "keyframe", 2360, false, false, CoD.TweenType.Linear )
									Smoke3b:registerEventHandler( "transition_complete_keyframe", Smoke3bFrame6 )
								end
							end
							
							if event.interrupted then
								Smoke3bFrame5( Smoke3b, event )
								return 
							else
								Smoke3b:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								Smoke3b:setAlpha( 0 )
								Smoke3b:registerEventHandler( "transition_complete_keyframe", Smoke3bFrame5 )
							end
						end
						
						if event.interrupted then
							Smoke3bFrame4( Smoke3b, event )
							return 
						else
							Smoke3b:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							Smoke3b:setAlpha( 1 )
							Smoke3b:registerEventHandler( "transition_complete_keyframe", Smoke3bFrame4 )
						end
					end
					
					if event.interrupted then
						Smoke3bFrame3( Smoke3b, event )
						return 
					else
						Smoke3b:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						Smoke3b:registerEventHandler( "transition_complete_keyframe", Smoke3bFrame3 )
					end
				end
				
				Smoke3b:completeAnimation()
				self.Smoke3b:setAlpha( 0 )
				Smoke3bFrame2( Smoke3b, {} )
				local Smoke3cFrame2 = function ( Smoke3c, event )
					local Smoke3cFrame3 = function ( Smoke3c, event )
						local Smoke3cFrame4 = function ( Smoke3c, event )
							local Smoke3cFrame5 = function ( Smoke3c, event )
								local Smoke3cFrame6 = function ( Smoke3c, event )
									local Smoke3cFrame7 = function ( Smoke3c, event )
										if not event.interrupted then
											Smoke3c:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
										end
										Smoke3c:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Smoke3c, event )
										else
											Smoke3c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Smoke3cFrame7( Smoke3c, event )
										return 
									else
										Smoke3c:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
										Smoke3c:setAlpha( 1 )
										Smoke3c:registerEventHandler( "transition_complete_keyframe", Smoke3cFrame7 )
									end
								end
								
								if event.interrupted then
									Smoke3cFrame6( Smoke3c, event )
									return 
								else
									Smoke3c:beginAnimation( "keyframe", 2350, false, false, CoD.TweenType.Linear )
									Smoke3c:registerEventHandler( "transition_complete_keyframe", Smoke3cFrame6 )
								end
							end
							
							if event.interrupted then
								Smoke3cFrame5( Smoke3c, event )
								return 
							else
								Smoke3c:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
								Smoke3c:setAlpha( 0 )
								Smoke3c:registerEventHandler( "transition_complete_keyframe", Smoke3cFrame5 )
							end
						end
						
						if event.interrupted then
							Smoke3cFrame4( Smoke3c, event )
							return 
						else
							Smoke3c:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
							Smoke3c:setAlpha( 1 )
							Smoke3c:registerEventHandler( "transition_complete_keyframe", Smoke3cFrame4 )
						end
					end
					
					if event.interrupted then
						Smoke3cFrame3( Smoke3c, event )
						return 
					else
						Smoke3c:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
						Smoke3c:registerEventHandler( "transition_complete_keyframe", Smoke3cFrame3 )
					end
				end
				
				Smoke3c:completeAnimation()
				self.Smoke3c:setAlpha( 0 )
				Smoke3cFrame2( Smoke3c, {} )
				local Smoke4Frame2 = function ( Smoke4, event )
					local Smoke4Frame3 = function ( Smoke4, event )
						local Smoke4Frame4 = function ( Smoke4, event )
							if not event.interrupted then
								Smoke4:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							Smoke4:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Smoke4, event )
							else
								Smoke4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Smoke4Frame4( Smoke4, event )
							return 
						else
							Smoke4:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							Smoke4:setAlpha( 1 )
							Smoke4:registerEventHandler( "transition_complete_keyframe", Smoke4Frame4 )
						end
					end
					
					if event.interrupted then
						Smoke4Frame3( Smoke4, event )
						return 
					else
						Smoke4:beginAnimation( "keyframe", 1570, false, false, CoD.TweenType.Linear )
						Smoke4:registerEventHandler( "transition_complete_keyframe", Smoke4Frame3 )
					end
				end
				
				Smoke4:completeAnimation()
				self.Smoke4:setAlpha( 0 )
				Smoke4Frame2( Smoke4, {} )
				local Smoke4bFrame2 = function ( Smoke4b, event )
					local Smoke4bFrame3 = function ( Smoke4b, event )
						local Smoke4bFrame4 = function ( Smoke4b, event )
							if not event.interrupted then
								Smoke4b:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							end
							Smoke4b:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Smoke4b, event )
							else
								Smoke4b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Smoke4bFrame4( Smoke4b, event )
							return 
						else
							Smoke4b:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
							Smoke4b:setAlpha( 1 )
							Smoke4b:registerEventHandler( "transition_complete_keyframe", Smoke4bFrame4 )
						end
					end
					
					if event.interrupted then
						Smoke4bFrame3( Smoke4b, event )
						return 
					else
						Smoke4b:beginAnimation( "keyframe", 1740, false, false, CoD.TweenType.Linear )
						Smoke4b:registerEventHandler( "transition_complete_keyframe", Smoke4bFrame3 )
					end
				end
				
				Smoke4b:completeAnimation()
				self.Smoke4b:setAlpha( 0 )
				Smoke4bFrame2( Smoke4b, {} )
				local Smoke4cFrame2 = function ( Smoke4c, event )
					local Smoke4cFrame3 = function ( Smoke4c, event )
						local Smoke4cFrame4 = function ( Smoke4c, event )
							if not event.interrupted then
								Smoke4c:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
							end
							Smoke4c:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Smoke4c, event )
							else
								Smoke4c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Smoke4cFrame4( Smoke4c, event )
							return 
						else
							Smoke4c:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
							Smoke4c:setAlpha( 1 )
							Smoke4c:registerEventHandler( "transition_complete_keyframe", Smoke4cFrame4 )
						end
					end
					
					if event.interrupted then
						Smoke4cFrame3( Smoke4c, event )
						return 
					else
						Smoke4c:beginAnimation( "keyframe", 1909, false, false, CoD.TweenType.Linear )
						Smoke4c:registerEventHandler( "transition_complete_keyframe", Smoke4cFrame3 )
					end
				end
				
				Smoke4c:completeAnimation()
				self.Smoke4c:setAlpha( 0 )
				Smoke4cFrame2( Smoke4c, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsGoldFrame:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

