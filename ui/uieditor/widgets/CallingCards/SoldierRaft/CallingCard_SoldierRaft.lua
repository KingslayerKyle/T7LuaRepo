-- a9152bd51a3025e9545349ef435aeb09
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.SoldierRaft.CallingCard_SoldierRaft_Soldier" )

CoD.CallingCard_SoldierRaft = InheritFrom( LUI.UIElement )
CoD.CallingCard_SoldierRaft.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_SoldierRaft )
	self.id = "CallingCard_SoldierRaft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, true, -480, 0 )
	BG:setTopBottom( true, true, 0, 0 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_sky" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Water = LUI.UIImage.new()
	Water:setLeftRight( true, true, 0, 0 )
	Water:setTopBottom( true, true, 0, 0 )
	Water:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_water" ) )
	self:addElement( Water )
	self.Water = Water
	
	local Boat = LUI.UIImage.new()
	Boat:setLeftRight( true, false, 465, 585 )
	Boat:setTopBottom( true, false, 36.5, 96.5 )
	Boat:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_boat" ) )
	self:addElement( Boat )
	self.Boat = Boat
	
	local Fin1 = LUI.UIImage.new()
	Fin1:setLeftRight( true, false, -92, 28 )
	Fin1:setTopBottom( true, false, 34, 154 )
	Fin1:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_fin1" ) )
	self:addElement( Fin1 )
	self.Fin1 = Fin1
	
	local Fin2 = LUI.UIImage.new()
	Fin2:setLeftRight( true, false, 37, 157 )
	Fin2:setTopBottom( true, false, 35, 155 )
	Fin2:setAlpha( 0 )
	Fin2:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_fin2" ) )
	self:addElement( Fin2 )
	self.Fin2 = Fin2
	
	local Fin3 = LUI.UIImage.new()
	Fin3:setLeftRight( true, false, 124, 184 )
	Fin3:setTopBottom( true, false, 69, 129 )
	Fin3:setAlpha( 0 )
	Fin3:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_fin3" ) )
	self:addElement( Fin3 )
	self.Fin3 = Fin3
	
	local Fin4 = LUI.UIImage.new()
	Fin4:setLeftRight( true, false, 179, 239 )
	Fin4:setTopBottom( true, false, 75, 135 )
	Fin4:setAlpha( 0 )
	Fin4:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_fin4" ) )
	self:addElement( Fin4 )
	self.Fin4 = Fin4
	
	local Fin5 = LUI.UIImage.new()
	Fin5:setLeftRight( true, false, 223, 283 )
	Fin5:setTopBottom( true, false, 92, 122 )
	Fin5:setAlpha( 0 )
	Fin5:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_fin5" ) )
	self:addElement( Fin5 )
	self.Fin5 = Fin5
	
	local Fin6 = LUI.UIImage.new()
	Fin6:setLeftRight( true, false, 275, 305 )
	Fin6:setTopBottom( true, false, 93, 123 )
	Fin6:setAlpha( 0 )
	Fin6:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_fin6" ) )
	self:addElement( Fin6 )
	self.Fin6 = Fin6
	
	local FinBack = LUI.UIImage.new()
	FinBack:setLeftRight( true, false, 466, 526 )
	FinBack:setTopBottom( true, false, 55, 115 )
	FinBack:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_fin_back" ) )
	self:addElement( FinBack )
	self.FinBack = FinBack
	
	local Ball = LUI.UIImage.new()
	Ball:setLeftRight( true, false, 296, 356 )
	Ball:setTopBottom( true, false, 67, 127 )
	Ball:setImage( RegisterImage( "uie_t7_callingcard_mp_soldierraft_ball" ) )
	self:addElement( Ball )
	self.Ball = Ball
	
	local Soldier = CoD.CallingCard_SoldierRaft_Soldier.new( menu, controller )
	Soldier:setLeftRight( true, false, 348, 468 )
	Soldier:setTopBottom( true, false, 14.5, 134.5 )
	self:addElement( Soldier )
	self.Soldier = Soldier
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 24000, false, false, CoD.TweenType.Linear )
					end
					BG:setLeftRight( true, true, 0, 480 )
					BG:setTopBottom( true, true, 0, 0 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setLeftRight( true, true, -480, 0 )
				self.BG:setTopBottom( true, true, 0, 0 )
				BGFrame2( BG, {} )
				local BoatFrame2 = function ( Boat, event )
					if not event.interrupted then
						Boat:beginAnimation( "keyframe", 23500, false, false, CoD.TweenType.Linear )
					end
					Boat:setLeftRight( true, false, -105, 15 )
					Boat:setTopBottom( true, false, 36.5, 96.5 )
					if event.interrupted then
						self.clipFinished( Boat, event )
					else
						Boat:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Boat:completeAnimation()
				self.Boat:setLeftRight( true, false, 465, 585 )
				self.Boat:setTopBottom( true, false, 36.5, 96.5 )
				BoatFrame2( Boat, {} )
				local Fin1Frame2 = function ( Fin1, event )
					local Fin1Frame3 = function ( Fin1, event )
						local Fin1Frame4 = function ( Fin1, event )
							if not event.interrupted then
								Fin1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							Fin1:setLeftRight( true, false, -26, 94 )
							Fin1:setTopBottom( true, false, 34, 154 )
							Fin1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Fin1, event )
							else
								Fin1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Fin1Frame4( Fin1, event )
							return 
						else
							Fin1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							Fin1:registerEventHandler( "transition_complete_keyframe", Fin1Frame4 )
						end
					end
					
					if event.interrupted then
						Fin1Frame3( Fin1, event )
						return 
					else
						Fin1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						Fin1:setLeftRight( true, false, -26, 94 )
						Fin1:registerEventHandler( "transition_complete_keyframe", Fin1Frame3 )
					end
				end
				
				Fin1:completeAnimation()
				self.Fin1:setLeftRight( true, false, -92, 28 )
				self.Fin1:setTopBottom( true, false, 34, 154 )
				self.Fin1:setAlpha( 1 )
				Fin1Frame2( Fin1, {} )
				local Fin2Frame2 = function ( Fin2, event )
					local Fin2Frame3 = function ( Fin2, event )
						local Fin2Frame4 = function ( Fin2, event )
							local Fin2Frame5 = function ( Fin2, event )
								if not event.interrupted then
									Fin2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								end
								Fin2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Fin2, event )
								else
									Fin2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Fin2Frame5( Fin2, event )
								return 
							else
								Fin2:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								Fin2:registerEventHandler( "transition_complete_keyframe", Fin2Frame5 )
							end
						end
						
						if event.interrupted then
							Fin2Frame4( Fin2, event )
							return 
						else
							Fin2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fin2:setAlpha( 1 )
							Fin2:registerEventHandler( "transition_complete_keyframe", Fin2Frame4 )
						end
					end
					
					if event.interrupted then
						Fin2Frame3( Fin2, event )
						return 
					else
						Fin2:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						Fin2:registerEventHandler( "transition_complete_keyframe", Fin2Frame3 )
					end
				end
				
				Fin2:completeAnimation()
				self.Fin2:setAlpha( 0 )
				Fin2Frame2( Fin2, {} )
				local Fin3Frame2 = function ( Fin3, event )
					local Fin3Frame3 = function ( Fin3, event )
						local Fin3Frame4 = function ( Fin3, event )
							local Fin3Frame5 = function ( Fin3, event )
								if not event.interrupted then
									Fin3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Fin3:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Fin3, event )
								else
									Fin3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Fin3Frame5( Fin3, event )
								return 
							else
								Fin3:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								Fin3:registerEventHandler( "transition_complete_keyframe", Fin3Frame5 )
							end
						end
						
						if event.interrupted then
							Fin3Frame4( Fin3, event )
							return 
						else
							Fin3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fin3:setAlpha( 1 )
							Fin3:registerEventHandler( "transition_complete_keyframe", Fin3Frame4 )
						end
					end
					
					if event.interrupted then
						Fin3Frame3( Fin3, event )
						return 
					else
						Fin3:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						Fin3:registerEventHandler( "transition_complete_keyframe", Fin3Frame3 )
					end
				end
				
				Fin3:completeAnimation()
				self.Fin3:setAlpha( 0 )
				Fin3Frame2( Fin3, {} )
				local Fin4Frame2 = function ( Fin4, event )
					local Fin4Frame3 = function ( Fin4, event )
						local Fin4Frame4 = function ( Fin4, event )
							local Fin4Frame5 = function ( Fin4, event )
								if not event.interrupted then
									Fin4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Fin4:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Fin4, event )
								else
									Fin4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Fin4Frame5( Fin4, event )
								return 
							else
								Fin4:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Fin4:registerEventHandler( "transition_complete_keyframe", Fin4Frame5 )
							end
						end
						
						if event.interrupted then
							Fin4Frame4( Fin4, event )
							return 
						else
							Fin4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Fin4:setAlpha( 1 )
							Fin4:registerEventHandler( "transition_complete_keyframe", Fin4Frame4 )
						end
					end
					
					if event.interrupted then
						Fin4Frame3( Fin4, event )
						return 
					else
						Fin4:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						Fin4:registerEventHandler( "transition_complete_keyframe", Fin4Frame3 )
					end
				end
				
				Fin4:completeAnimation()
				self.Fin4:setAlpha( 0 )
				Fin4Frame2( Fin4, {} )
				local Fin5Frame2 = function ( Fin5, event )
					local Fin5Frame3 = function ( Fin5, event )
						local Fin5Frame4 = function ( Fin5, event )
							local Fin5Frame5 = function ( Fin5, event )
								if not event.interrupted then
									Fin5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Fin5:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Fin5, event )
								else
									Fin5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Fin5Frame5( Fin5, event )
								return 
							else
								Fin5:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								Fin5:registerEventHandler( "transition_complete_keyframe", Fin5Frame5 )
							end
						end
						
						if event.interrupted then
							Fin5Frame4( Fin5, event )
							return 
						else
							Fin5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fin5:setAlpha( 1 )
							Fin5:registerEventHandler( "transition_complete_keyframe", Fin5Frame4 )
						end
					end
					
					if event.interrupted then
						Fin5Frame3( Fin5, event )
						return 
					else
						Fin5:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
						Fin5:registerEventHandler( "transition_complete_keyframe", Fin5Frame3 )
					end
				end
				
				Fin5:completeAnimation()
				self.Fin5:setAlpha( 0 )
				Fin5Frame2( Fin5, {} )
				local Fin6Frame2 = function ( Fin6, event )
					local Fin6Frame3 = function ( Fin6, event )
						local Fin6Frame4 = function ( Fin6, event )
							local Fin6Frame5 = function ( Fin6, event )
								if not event.interrupted then
									Fin6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Fin6:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Fin6, event )
								else
									Fin6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Fin6Frame5( Fin6, event )
								return 
							else
								Fin6:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								Fin6:registerEventHandler( "transition_complete_keyframe", Fin6Frame5 )
							end
						end
						
						if event.interrupted then
							Fin6Frame4( Fin6, event )
							return 
						else
							Fin6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Fin6:setAlpha( 1 )
							Fin6:registerEventHandler( "transition_complete_keyframe", Fin6Frame4 )
						end
					end
					
					if event.interrupted then
						Fin6Frame3( Fin6, event )
						return 
					else
						Fin6:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						Fin6:registerEventHandler( "transition_complete_keyframe", Fin6Frame3 )
					end
				end
				
				Fin6:completeAnimation()
				self.Fin6:setAlpha( 0 )
				Fin6Frame2( Fin6, {} )
				local FinBackFrame2 = function ( FinBack, event )
					local FinBackFrame3 = function ( FinBack, event )
						if not event.interrupted then
							FinBack:beginAnimation( "keyframe", 11400, false, false, CoD.TweenType.Linear )
						end
						FinBack:setLeftRight( true, false, -46, 14 )
						FinBack:setTopBottom( true, false, 55, 115 )
						if event.interrupted then
							self.clipFinished( FinBack, event )
						else
							FinBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FinBackFrame3( FinBack, event )
						return 
					else
						FinBack:beginAnimation( "keyframe", 3619, false, false, CoD.TweenType.Linear )
						FinBack:registerEventHandler( "transition_complete_keyframe", FinBackFrame3 )
					end
				end
				
				FinBack:completeAnimation()
				self.FinBack:setLeftRight( true, false, 466, 526 )
				self.FinBack:setTopBottom( true, false, 55, 115 )
				FinBackFrame2( FinBack, {} )
				local BallFrame2 = function ( Ball, event )
					local BallFrame3 = function ( Ball, event )
						local BallFrame4 = function ( Ball, event )
							local BallFrame5 = function ( Ball, event )
								local BallFrame6 = function ( Ball, event )
									local BallFrame7 = function ( Ball, event )
										local BallFrame8 = function ( Ball, event )
											local BallFrame9 = function ( Ball, event )
												local BallFrame10 = function ( Ball, event )
													local BallFrame11 = function ( Ball, event )
														local BallFrame12 = function ( Ball, event )
															local BallFrame13 = function ( Ball, event )
																local BallFrame14 = function ( Ball, event )
																	local BallFrame15 = function ( Ball, event )
																		local BallFrame16 = function ( Ball, event )
																			local BallFrame17 = function ( Ball, event )
																				if not event.interrupted then
																					Ball:beginAnimation( "keyframe", 1670, true, true, CoD.TweenType.Linear )
																				end
																				Ball:setLeftRight( true, false, 296, 356 )
																				Ball:setTopBottom( true, false, 67, 127 )
																				if event.interrupted then
																					self.clipFinished( Ball, event )
																				else
																					Ball:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				BallFrame17( Ball, event )
																				return 
																			else
																				Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																				Ball:setTopBottom( true, false, 64, 124 )
																				Ball:registerEventHandler( "transition_complete_keyframe", BallFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			BallFrame16( Ball, event )
																			return 
																		else
																			Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																			Ball:setTopBottom( true, false, 67, 127 )
																			Ball:registerEventHandler( "transition_complete_keyframe", BallFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		BallFrame15( Ball, event )
																		return 
																	else
																		Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																		Ball:setTopBottom( true, false, 64, 124 )
																		Ball:registerEventHandler( "transition_complete_keyframe", BallFrame15 )
																	end
																end
																
																if event.interrupted then
																	BallFrame14( Ball, event )
																	return 
																else
																	Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																	Ball:setTopBottom( true, false, 67, 127 )
																	Ball:registerEventHandler( "transition_complete_keyframe", BallFrame14 )
																end
															end
															
															if event.interrupted then
																BallFrame13( Ball, event )
																return 
															else
																Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																Ball:setTopBottom( true, false, 64, 124 )
																Ball:registerEventHandler( "transition_complete_keyframe", BallFrame13 )
															end
														end
														
														if event.interrupted then
															BallFrame12( Ball, event )
															return 
														else
															Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
															Ball:setTopBottom( true, false, 67, 127 )
															Ball:registerEventHandler( "transition_complete_keyframe", BallFrame12 )
														end
													end
													
													if event.interrupted then
														BallFrame11( Ball, event )
														return 
													else
														Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
														Ball:setTopBottom( true, false, 64, 124 )
														Ball:registerEventHandler( "transition_complete_keyframe", BallFrame11 )
													end
												end
												
												if event.interrupted then
													BallFrame10( Ball, event )
													return 
												else
													Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
													Ball:setTopBottom( true, false, 67, 127 )
													Ball:registerEventHandler( "transition_complete_keyframe", BallFrame10 )
												end
											end
											
											if event.interrupted then
												BallFrame9( Ball, event )
												return 
											else
												Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
												Ball:setTopBottom( true, false, 64, 124 )
												Ball:registerEventHandler( "transition_complete_keyframe", BallFrame9 )
											end
										end
										
										if event.interrupted then
											BallFrame8( Ball, event )
											return 
										else
											Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
											Ball:setTopBottom( true, false, 67, 127 )
											Ball:registerEventHandler( "transition_complete_keyframe", BallFrame8 )
										end
									end
									
									if event.interrupted then
										BallFrame7( Ball, event )
										return 
									else
										Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
										Ball:setTopBottom( true, false, 64, 124 )
										Ball:registerEventHandler( "transition_complete_keyframe", BallFrame7 )
									end
								end
								
								if event.interrupted then
									BallFrame6( Ball, event )
									return 
								else
									Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
									Ball:setTopBottom( true, false, 67, 127 )
									Ball:registerEventHandler( "transition_complete_keyframe", BallFrame6 )
								end
							end
							
							if event.interrupted then
								BallFrame5( Ball, event )
								return 
							else
								Ball:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
								Ball:setTopBottom( true, false, 64, 124 )
								Ball:registerEventHandler( "transition_complete_keyframe", BallFrame5 )
							end
						end
						
						if event.interrupted then
							BallFrame4( Ball, event )
							return 
						else
							Ball:beginAnimation( "keyframe", 1499, true, true, CoD.TweenType.Linear )
							Ball:setTopBottom( true, false, 67, 127 )
							Ball:registerEventHandler( "transition_complete_keyframe", BallFrame4 )
						end
					end
					
					if event.interrupted then
						BallFrame3( Ball, event )
						return 
					else
						Ball:beginAnimation( "keyframe", 1330, true, true, CoD.TweenType.Linear )
						Ball:setTopBottom( true, false, 64, 124 )
						Ball:registerEventHandler( "transition_complete_keyframe", BallFrame3 )
					end
				end
				
				Ball:completeAnimation()
				self.Ball:setLeftRight( true, false, 296, 356 )
				self.Ball:setTopBottom( true, false, 67, 127 )
				BallFrame2( Ball, {} )
				local SoldierFrame2 = function ( Soldier, event )
					local SoldierFrame3 = function ( Soldier, event )
						local SoldierFrame4 = function ( Soldier, event )
							local SoldierFrame5 = function ( Soldier, event )
								local SoldierFrame6 = function ( Soldier, event )
									local SoldierFrame7 = function ( Soldier, event )
										local SoldierFrame8 = function ( Soldier, event )
											local SoldierFrame9 = function ( Soldier, event )
												local SoldierFrame10 = function ( Soldier, event )
													local SoldierFrame11 = function ( Soldier, event )
														local SoldierFrame12 = function ( Soldier, event )
															local SoldierFrame13 = function ( Soldier, event )
																local SoldierFrame14 = function ( Soldier, event )
																	local SoldierFrame15 = function ( Soldier, event )
																		local SoldierFrame16 = function ( Soldier, event )
																			local SoldierFrame17 = function ( Soldier, event )
																				if not event.interrupted then
																					Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																				end
																				Soldier:setLeftRight( true, false, 348, 468 )
																				Soldier:setTopBottom( true, false, 14.5, 134.5 )
																				if event.interrupted then
																					self.clipFinished( Soldier, event )
																				else
																					Soldier:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				SoldierFrame17( Soldier, event )
																				return 
																			else
																				Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																				Soldier:setTopBottom( true, false, 11, 131 )
																				Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			SoldierFrame16( Soldier, event )
																			return 
																		else
																			Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																			Soldier:setTopBottom( true, false, 14.5, 134.5 )
																			Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		SoldierFrame15( Soldier, event )
																		return 
																	else
																		Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																		Soldier:setTopBottom( true, false, 11, 131 )
																		Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame15 )
																	end
																end
																
																if event.interrupted then
																	SoldierFrame14( Soldier, event )
																	return 
																else
																	Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																	Soldier:setTopBottom( true, false, 14.5, 134.5 )
																	Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame14 )
																end
															end
															
															if event.interrupted then
																SoldierFrame13( Soldier, event )
																return 
															else
																Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
																Soldier:setTopBottom( true, false, 11, 131 )
																Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame13 )
															end
														end
														
														if event.interrupted then
															SoldierFrame12( Soldier, event )
															return 
														else
															Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
															Soldier:setTopBottom( true, false, 14.5, 134.5 )
															Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame12 )
														end
													end
													
													if event.interrupted then
														SoldierFrame11( Soldier, event )
														return 
													else
														Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
														Soldier:setTopBottom( true, false, 11, 131 )
														Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame11 )
													end
												end
												
												if event.interrupted then
													SoldierFrame10( Soldier, event )
													return 
												else
													Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
													Soldier:setTopBottom( true, false, 14.5, 134.5 )
													Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame10 )
												end
											end
											
											if event.interrupted then
												SoldierFrame9( Soldier, event )
												return 
											else
												Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
												Soldier:setTopBottom( true, false, 11, 131 )
												Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame9 )
											end
										end
										
										if event.interrupted then
											SoldierFrame8( Soldier, event )
											return 
										else
											Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
											Soldier:setTopBottom( true, false, 14.5, 134.5 )
											Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame8 )
										end
									end
									
									if event.interrupted then
										SoldierFrame7( Soldier, event )
										return 
									else
										Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
										Soldier:setTopBottom( true, false, 11, 131 )
										Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame7 )
									end
								end
								
								if event.interrupted then
									SoldierFrame6( Soldier, event )
									return 
								else
									Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
									Soldier:setTopBottom( true, false, 14.5, 134.5 )
									Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame6 )
								end
							end
							
							if event.interrupted then
								SoldierFrame5( Soldier, event )
								return 
							else
								Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
								Soldier:setTopBottom( true, false, 11, 131 )
								Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame5 )
							end
						end
						
						if event.interrupted then
							SoldierFrame4( Soldier, event )
							return 
						else
							Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
							Soldier:setTopBottom( true, false, 14.5, 134.5 )
							Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame4 )
						end
					end
					
					if event.interrupted then
						SoldierFrame3( Soldier, event )
						return 
					else
						Soldier:beginAnimation( "keyframe", 1500, true, true, CoD.TweenType.Linear )
						Soldier:setTopBottom( true, false, 11, 131 )
						Soldier:registerEventHandler( "transition_complete_keyframe", SoldierFrame3 )
					end
				end
				
				Soldier:completeAnimation()
				self.Soldier:setLeftRight( true, false, 348, 468 )
				self.Soldier:setTopBottom( true, false, 14.5, 134.5 )
				SoldierFrame2( Soldier, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Soldier:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

