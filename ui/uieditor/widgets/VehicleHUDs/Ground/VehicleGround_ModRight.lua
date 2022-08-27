-- fca3276a9a2cf509077e73e50621f551
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModB4" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModB3" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModB2" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT5" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT4" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT3" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT7" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT6" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT2" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT1" )

CoD.VehicleGround_ModRight = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ModRight )
	self.id = "VehicleGround_ModRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 644 )
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local ModB1 = CoD.VehicleGround_ModB4.new( menu, controller )
	ModB1:setLeftRight( true, false, 396.22, 510.22 )
	ModB1:setTopBottom( true, false, 36, 76 )
	ModB1:setAlpha( 0 )
	self:addElement( ModB1 )
	self.ModB1 = ModB1
	
	local ModB2 = CoD.VehicleGround_ModB3.new( menu, controller )
	ModB2:setLeftRight( true, false, 508, 644 )
	ModB2:setTopBottom( true, false, 36, 76 )
	self:addElement( ModB2 )
	self.ModB2 = ModB2
	
	local ModB3 = CoD.VehicleGround_ModB2.new( menu, controller )
	ModB3:setLeftRight( true, false, 364, 508 )
	ModB3:setTopBottom( true, false, 36, 76 )
	self:addElement( ModB3 )
	self.ModB3 = ModB3
	
	local ModT1 = CoD.VehicleGround_ModT5.new( menu, controller )
	ModT1:setLeftRight( true, false, 388, 500 )
	ModT1:setTopBottom( true, false, 0, 36 )
	self:addElement( ModT1 )
	self.ModT1 = ModT1
	
	local ModT2 = CoD.VehicleGround_ModT4.new( menu, controller )
	ModT2:setLeftRight( true, false, 500, 644 )
	ModT2:setTopBottom( true, false, 0, 36 )
	self:addElement( ModT2 )
	self.ModT2 = ModT2
	
	local ModT3 = CoD.VehicleGround_ModT3.new( menu, controller )
	ModT3:setLeftRight( true, false, 336.24, 384.24 )
	ModT3:setTopBottom( true, false, -32.24, 3.76 )
	ModT3:setAlpha( 0 )
	self:addElement( ModT3 )
	self.ModT3 = ModT3
	
	local ModT4 = CoD.VehicleGround_ModT7.new( menu, controller )
	ModT4:setLeftRight( true, false, 408, 444 )
	ModT4:setTopBottom( true, false, 0, 36 )
	ModT4:setAlpha( 0 )
	self:addElement( ModT4 )
	self.ModT4 = ModT4
	
	local ModT5 = CoD.VehicleGround_ModT6.new( menu, controller )
	ModT5:setLeftRight( true, false, 332, 436 )
	ModT5:setTopBottom( true, false, 0, 36 )
	ModT5:setAlpha( 0 )
	self:addElement( ModT5 )
	self.ModT5 = ModT5
	
	local ModT6 = CoD.VehicleGround_ModT2.new( menu, controller )
	ModT6:setLeftRight( true, false, 292, 340 )
	ModT6:setTopBottom( true, false, 0, 36 )
	ModT6:setAlpha( 0 )
	self:addElement( ModT6 )
	self.ModT6 = ModT6
	
	local ModT7 = CoD.VehicleGround_ModT1.new( menu, controller )
	ModT7:setLeftRight( true, false, 340, 388 )
	ModT7:setTopBottom( true, false, 0, 36 )
	self:addElement( ModT7 )
	self.ModT7 = ModT7
	
	local ModT1b = CoD.VehicleGround_ModT5.new( menu, controller )
	ModT1b:setLeftRight( true, false, 532, 644 )
	ModT1b:setTopBottom( true, false, 0, 36 )
	ModT1b:setAlpha( 0 )
	self:addElement( ModT1b )
	self.ModT1b = ModT1b
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				local ModB1Frame2 = function ( ModB1, event )
					local ModB1Frame3 = function ( ModB1, event )
						local ModB1Frame4 = function ( ModB1, event )
							local ModB1Frame5 = function ( ModB1, event )
								local ModB1Frame6 = function ( ModB1, event )
									local ModB1Frame7 = function ( ModB1, event )
										local ModB1Frame8 = function ( ModB1, event )
											local ModB1Frame9 = function ( ModB1, event )
												local ModB1Frame10 = function ( ModB1, event )
													local ModB1Frame11 = function ( ModB1, event )
														local ModB1Frame12 = function ( ModB1, event )
															local ModB1Frame13 = function ( ModB1, event )
																local ModB1Frame14 = function ( ModB1, event )
																	local ModB1Frame15 = function ( ModB1, event )
																		local ModB1Frame16 = function ( ModB1, event )
																			if not event.interrupted then
																				ModB1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			end
																			ModB1:setLeftRight( true, false, 530, 644 )
																			ModB1:setTopBottom( true, false, 36, 76 )
																			ModB1:setAlpha( 1 )
																			if event.interrupted then
																				self.clipFinished( ModB1, event )
																			else
																				ModB1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			ModB1Frame16( ModB1, event )
																			return 
																		else
																			ModB1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModB1Frame15( ModB1, event )
																		return 
																	else
																		ModB1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		ModB1:setAlpha( 0 )
																		ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModB1Frame14( ModB1, event )
																	return 
																else
																	ModB1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame14 )
																end
															end
															
															if event.interrupted then
																ModB1Frame13( ModB1, event )
																return 
															else
																ModB1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																ModB1:setAlpha( 0.5 )
																ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame13 )
															end
														end
														
														if event.interrupted then
															ModB1Frame12( ModB1, event )
															return 
														else
															ModB1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame12 )
														end
													end
													
													if event.interrupted then
														ModB1Frame11( ModB1, event )
														return 
													else
														ModB1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														ModB1:setAlpha( 0 )
														ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame11 )
													end
												end
												
												if event.interrupted then
													ModB1Frame10( ModB1, event )
													return 
												else
													ModB1:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
													ModB1:setLeftRight( true, false, 530, 644 )
													ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame10 )
												end
											end
											
											if event.interrupted then
												ModB1Frame9( ModB1, event )
												return 
											else
												ModB1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModB1:setLeftRight( true, false, 530, 534 )
												ModB1:setAlpha( 1 )
												ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame9 )
											end
										end
										
										if event.interrupted then
											ModB1Frame8( ModB1, event )
											return 
										else
											ModB1:beginAnimation( "keyframe", 3599, false, false, CoD.TweenType.Linear )
											ModB1:setLeftRight( true, false, 530, 644 )
											ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame8 )
										end
									end
									
									if event.interrupted then
										ModB1Frame7( ModB1, event )
										return 
									else
										ModB1:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
										ModB1:setLeftRight( true, false, 250, 364 )
										ModB1:setAlpha( 0 )
										ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame7 )
									end
								end
								
								if event.interrupted then
									ModB1Frame6( ModB1, event )
									return 
								else
									ModB1:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									ModB1:setLeftRight( true, false, 318, 432 )
									ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame6 )
								end
							end
							
							if event.interrupted then
								ModB1Frame5( ModB1, event )
								return 
							else
								ModB1:beginAnimation( "keyframe", 5599, false, false, CoD.TweenType.Linear )
								ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame5 )
							end
						end
						
						if event.interrupted then
							ModB1Frame4( ModB1, event )
							return 
						else
							ModB1:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
							ModB1:setLeftRight( true, false, 386, 500 )
							ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame4 )
						end
					end
					
					if event.interrupted then
						ModB1Frame3( ModB1, event )
						return 
					else
						ModB1:beginAnimation( "keyframe", 5599, false, false, CoD.TweenType.Linear )
						ModB1:registerEventHandler( "transition_complete_keyframe", ModB1Frame3 )
					end
				end
				
				ModB1:completeAnimation()
				self.ModB1:setLeftRight( true, false, 530, 644 )
				self.ModB1:setTopBottom( true, false, 36, 76 )
				self.ModB1:setAlpha( 1 )
				ModB1Frame2( ModB1, {} )
				local ModB2Frame2 = function ( ModB2, event )
					local ModB2Frame3 = function ( ModB2, event )
						local ModB2Frame4 = function ( ModB2, event )
							local ModB2Frame5 = function ( ModB2, event )
								local ModB2Frame6 = function ( ModB2, event )
									local ModB2Frame7 = function ( ModB2, event )
										local ModB2Frame8 = function ( ModB2, event )
											local ModB2Frame9 = function ( ModB2, event )
												local ModB2Frame10 = function ( ModB2, event )
													local ModB2Frame11 = function ( ModB2, event )
														local ModB2Frame12 = function ( ModB2, event )
															local ModB2Frame13 = function ( ModB2, event )
																local ModB2Frame14 = function ( ModB2, event )
																	local ModB2Frame15 = function ( ModB2, event )
																		local ModB2Frame16 = function ( ModB2, event )
																			if not event.interrupted then
																				ModB2:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																			end
																			ModB2:setLeftRight( true, false, 394, 530 )
																			ModB2:setTopBottom( true, false, 36, 76 )
																			ModB2:setAlpha( 1 )
																			if event.interrupted then
																				self.clipFinished( ModB2, event )
																			else
																				ModB2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			ModB2Frame16( ModB2, event )
																			return 
																		else
																			ModB2:beginAnimation( "keyframe", 2910, false, false, CoD.TweenType.Linear )
																			ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModB2Frame15( ModB2, event )
																		return 
																	else
																		ModB2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		ModB2:setAlpha( 1 )
																		ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModB2Frame14( ModB2, event )
																	return 
																else
																	ModB2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame14 )
																end
															end
															
															if event.interrupted then
																ModB2Frame13( ModB2, event )
																return 
															else
																ModB2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																ModB2:setAlpha( 0 )
																ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame13 )
															end
														end
														
														if event.interrupted then
															ModB2Frame12( ModB2, event )
															return 
														else
															ModB2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame12 )
														end
													end
													
													if event.interrupted then
														ModB2Frame11( ModB2, event )
														return 
													else
														ModB2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														ModB2:setAlpha( 0.5 )
														ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame11 )
													end
												end
												
												if event.interrupted then
													ModB2Frame10( ModB2, event )
													return 
												else
													ModB2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame10 )
												end
											end
											
											if event.interrupted then
												ModB2Frame9( ModB2, event )
												return 
											else
												ModB2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModB2:setAlpha( 0 )
												ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame9 )
											end
										end
										
										if event.interrupted then
											ModB2Frame8( ModB2, event )
											return 
										else
											ModB2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
											ModB2:setLeftRight( true, false, 508, 644 )
											ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame8 )
										end
									end
									
									if event.interrupted then
										ModB2Frame7( ModB2, event )
										return 
									else
										ModB2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ModB2:setLeftRight( true, false, 508, 512 )
										ModB2:setAlpha( 1 )
										ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame7 )
									end
								end
								
								if event.interrupted then
									ModB2Frame6( ModB2, event )
									return 
								else
									ModB2:beginAnimation( "keyframe", 5900, false, false, CoD.TweenType.Linear )
									ModB2:setLeftRight( true, false, 508, 644 )
									ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame6 )
								end
							end
							
							if event.interrupted then
								ModB2Frame5( ModB2, event )
								return 
							else
								ModB2:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
								ModB2:setLeftRight( true, false, 250, 386 )
								ModB2:setAlpha( 0 )
								ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame5 )
							end
						end
						
						if event.interrupted then
							ModB2Frame4( ModB2, event )
							return 
						else
							ModB2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							ModB2:setLeftRight( true, false, 322, 458 )
							ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame4 )
						end
					end
					
					if event.interrupted then
						ModB2Frame3( ModB2, event )
						return 
					else
						ModB2:beginAnimation( "keyframe", 5599, false, false, CoD.TweenType.Linear )
						ModB2:registerEventHandler( "transition_complete_keyframe", ModB2Frame3 )
					end
				end
				
				ModB2:completeAnimation()
				self.ModB2:setLeftRight( true, false, 394, 530 )
				self.ModB2:setTopBottom( true, false, 36, 76 )
				self.ModB2:setAlpha( 1 )
				ModB2Frame2( ModB2, {} )
				local ModB3Frame2 = function ( ModB3, event )
					local ModB3Frame3 = function ( ModB3, event )
						local ModB3Frame4 = function ( ModB3, event )
							local ModB3Frame5 = function ( ModB3, event )
								local ModB3Frame6 = function ( ModB3, event )
									local ModB3Frame7 = function ( ModB3, event )
										local ModB3Frame8 = function ( ModB3, event )
											local ModB3Frame9 = function ( ModB3, event )
												local ModB3Frame10 = function ( ModB3, event )
													local ModB3Frame11 = function ( ModB3, event )
														local ModB3Frame12 = function ( ModB3, event )
															local ModB3Frame13 = function ( ModB3, event )
																local ModB3Frame14 = function ( ModB3, event )
																	local ModB3Frame15 = function ( ModB3, event )
																		local ModB3Frame16 = function ( ModB3, event )
																			local ModB3Frame17 = function ( ModB3, event )
																				if not event.interrupted then
																					ModB3:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
																				end
																				ModB3:setLeftRight( true, false, 250, 394 )
																				ModB3:setTopBottom( true, false, 36, 76 )
																				ModB3:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( ModB3, event )
																				else
																					ModB3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModB3Frame17( ModB3, event )
																				return 
																			else
																				ModB3:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Linear )
																				ModB3:setLeftRight( true, false, 250, 394 )
																				ModB3:setAlpha( 0 )
																				ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModB3Frame16( ModB3, event )
																			return 
																		else
																			ModB3:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																			ModB3:setLeftRight( true, false, 257.64, 401.64 )
																			ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModB3Frame15( ModB3, event )
																		return 
																	else
																		ModB3:beginAnimation( "keyframe", 3300, false, false, CoD.TweenType.Linear )
																		ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModB3Frame14( ModB3, event )
																	return 
																else
																	ModB3:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																	ModB3:setLeftRight( true, false, 364, 508 )
																	ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame14 )
																end
															end
															
															if event.interrupted then
																ModB3Frame13( ModB3, event )
																return 
															else
																ModB3:beginAnimation( "keyframe", 5119, false, false, CoD.TweenType.Linear )
																ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame13 )
															end
														end
														
														if event.interrupted then
															ModB3Frame12( ModB3, event )
															return 
														else
															ModB3:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
															ModB3:setAlpha( 1 )
															ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame12 )
														end
													end
													
													if event.interrupted then
														ModB3Frame11( ModB3, event )
														return 
													else
														ModB3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame11 )
													end
												end
												
												if event.interrupted then
													ModB3Frame10( ModB3, event )
													return 
												else
													ModB3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													ModB3:setAlpha( 0 )
													ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame10 )
												end
											end
											
											if event.interrupted then
												ModB3Frame9( ModB3, event )
												return 
											else
												ModB3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame9 )
											end
										end
										
										if event.interrupted then
											ModB3Frame8( ModB3, event )
											return 
										else
											ModB3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ModB3:setAlpha( 0.5 )
											ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame8 )
										end
									end
									
									if event.interrupted then
										ModB3Frame7( ModB3, event )
										return 
									else
										ModB3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame7 )
									end
								end
								
								if event.interrupted then
									ModB3Frame6( ModB3, event )
									return 
								else
									ModB3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									ModB3:setAlpha( 0 )
									ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame6 )
								end
							end
							
							if event.interrupted then
								ModB3Frame5( ModB3, event )
								return 
							else
								ModB3:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
								ModB3:setLeftRight( true, false, 500, 644 )
								ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame5 )
							end
						end
						
						if event.interrupted then
							ModB3Frame4( ModB3, event )
							return 
						else
							ModB3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ModB3:setLeftRight( true, false, 500, 506 )
							ModB3:setAlpha( 1 )
							ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame4 )
						end
					end
					
					if event.interrupted then
						ModB3Frame3( ModB3, event )
						return 
					else
						ModB3:beginAnimation( "keyframe", 5900, false, false, CoD.TweenType.Linear )
						ModB3:setLeftRight( true, false, 500, 644 )
						ModB3:registerEventHandler( "transition_complete_keyframe", ModB3Frame3 )
					end
				end
				
				ModB3:completeAnimation()
				self.ModB3:setLeftRight( true, false, 249.64, 393.64 )
				self.ModB3:setTopBottom( true, false, 36, 76 )
				self.ModB3:setAlpha( 0 )
				ModB3Frame2( ModB3, {} )
				local ModT1Frame2 = function ( ModT1, event )
					local ModT1Frame3 = function ( ModT1, event )
						local ModT1Frame4 = function ( ModT1, event )
							local ModT1Frame5 = function ( ModT1, event )
								local ModT1Frame6 = function ( ModT1, event )
									local ModT1Frame7 = function ( ModT1, event )
										local ModT1Frame8 = function ( ModT1, event )
											local ModT1Frame9 = function ( ModT1, event )
												local ModT1Frame10 = function ( ModT1, event )
													local ModT1Frame11 = function ( ModT1, event )
														local ModT1Frame12 = function ( ModT1, event )
															local ModT1Frame13 = function ( ModT1, event )
																local ModT1Frame14 = function ( ModT1, event )
																	local ModT1Frame15 = function ( ModT1, event )
																		local ModT1Frame16 = function ( ModT1, event )
																			local ModT1Frame17 = function ( ModT1, event )
																				local ModT1Frame18 = function ( ModT1, event )
																					local ModT1Frame19 = function ( ModT1, event )
																						local ModT1Frame20 = function ( ModT1, event )
																							local ModT1Frame21 = function ( ModT1, event )
																								local ModT1Frame22 = function ( ModT1, event )
																									local ModT1Frame23 = function ( ModT1, event )
																										local ModT1Frame24 = function ( ModT1, event )
																											local ModT1Frame25 = function ( ModT1, event )
																												if not event.interrupted then
																													ModT1:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
																												end
																												ModT1:setLeftRight( true, false, 191, 303 )
																												ModT1:setTopBottom( true, false, 0, 36 )
																												ModT1:setAlpha( 0 )
																												if event.interrupted then
																													self.clipFinished( ModT1, event )
																												else
																													ModT1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																												end
																											end
																											
																											if event.interrupted then
																												ModT1Frame25( ModT1, event )
																												return 
																											else
																												ModT1:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
																												ModT1:setLeftRight( true, false, 191, 303 )
																												ModT1:setAlpha( 0 )
																												ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ModT1Frame24( ModT1, event )
																											return 
																										else
																											ModT1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
																											ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ModT1Frame23( ModT1, event )
																										return 
																									else
																										ModT1:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																										ModT1:setLeftRight( true, false, 276, 388 )
																										ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ModT1Frame22( ModT1, event )
																									return 
																								else
																									ModT1:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
																									ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ModT1Frame21( ModT1, event )
																								return 
																							else
																								ModT1:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																								ModT1:setLeftRight( true, false, 388, 500 )
																								ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ModT1Frame20( ModT1, event )
																							return 
																						else
																							ModT1:beginAnimation( "keyframe", 1909, false, false, CoD.TweenType.Linear )
																							ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ModT1Frame19( ModT1, event )
																						return 
																					else
																						ModT1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						ModT1:setAlpha( 1 )
																						ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ModT1Frame18( ModT1, event )
																					return 
																				else
																					ModT1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																					ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ModT1Frame17( ModT1, event )
																				return 
																			else
																				ModT1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				ModT1:setAlpha( 0 )
																				ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT1Frame16( ModT1, event )
																			return 
																		else
																			ModT1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT1Frame15( ModT1, event )
																		return 
																	else
																		ModT1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		ModT1:setAlpha( 0.5 )
																		ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT1Frame14( ModT1, event )
																	return 
																else
																	ModT1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame14 )
																end
															end
															
															if event.interrupted then
																ModT1Frame13( ModT1, event )
																return 
															else
																ModT1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																ModT1:setAlpha( 0 )
																ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame13 )
															end
														end
														
														if event.interrupted then
															ModT1Frame12( ModT1, event )
															return 
														else
															ModT1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
															ModT1:setLeftRight( true, false, 532, 644 )
															ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame12 )
														end
													end
													
													if event.interrupted then
														ModT1Frame11( ModT1, event )
														return 
													else
														ModT1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ModT1:setLeftRight( true, false, 532, 537 )
														ModT1:setAlpha( 1 )
														ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame11 )
													end
												end
												
												if event.interrupted then
													ModT1Frame10( ModT1, event )
													return 
												else
													ModT1:beginAnimation( "keyframe", 2899, false, false, CoD.TweenType.Linear )
													ModT1:setLeftRight( true, false, 532, 644 )
													ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame10 )
												end
											end
											
											if event.interrupted then
												ModT1Frame9( ModT1, event )
												return 
											else
												ModT1:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
												ModT1:setLeftRight( true, false, 344, 456 )
												ModT1:setAlpha( 0 )
												ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame9 )
											end
										end
										
										if event.interrupted then
											ModT1Frame8( ModT1, event )
											return 
										else
											ModT1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
											ModT1:setLeftRight( true, false, 365.04, 477.04 )
											ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame8 )
										end
									end
									
									if event.interrupted then
										ModT1Frame7( ModT1, event )
										return 
									else
										ModT1:beginAnimation( "keyframe", 3299, false, false, CoD.TweenType.Linear )
										ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame7 )
									end
								end
								
								if event.interrupted then
									ModT1Frame6( ModT1, event )
									return 
								else
									ModT1:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
									ModT1:setLeftRight( true, false, 391, 503 )
									ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame6 )
								end
							end
							
							if event.interrupted then
								ModT1Frame5( ModT1, event )
								return 
							else
								ModT1:beginAnimation( "keyframe", 1900, false, false, CoD.TweenType.Linear )
								ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame5 )
							end
						end
						
						if event.interrupted then
							ModT1Frame4( ModT1, event )
							return 
						else
							ModT1:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
							ModT1:setLeftRight( true, false, 496, 608 )
							ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame4 )
						end
					end
					
					if event.interrupted then
						ModT1Frame3( ModT1, event )
						return 
					else
						ModT1:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
						ModT1:registerEventHandler( "transition_complete_keyframe", ModT1Frame3 )
					end
				end
				
				ModT1:completeAnimation()
				self.ModT1:setLeftRight( true, false, 532, 644 )
				self.ModT1:setTopBottom( true, false, 0, 36 )
				self.ModT1:setAlpha( 1 )
				ModT1Frame2( ModT1, {} )
				local f2_local4 = function ( f73_arg0, f73_arg1 )
					local f73_local0 = function ( f74_arg0, f74_arg1 )
						local f74_local0 = function ( f75_arg0, f75_arg1 )
							local f75_local0 = function ( f76_arg0, f76_arg1 )
								local f76_local0 = function ( f77_arg0, f77_arg1 )
									local f77_local0 = function ( f78_arg0, f78_arg1 )
										local f78_local0 = function ( f79_arg0, f79_arg1 )
											local f79_local0 = function ( f80_arg0, f80_arg1 )
												local f80_local0 = function ( f81_arg0, f81_arg1 )
													local f81_local0 = function ( f82_arg0, f82_arg1 )
														local f82_local0 = function ( f83_arg0, f83_arg1 )
															local f83_local0 = function ( f84_arg0, f84_arg1 )
																local f84_local0 = function ( f85_arg0, f85_arg1 )
																	local f85_local0 = function ( f86_arg0, f86_arg1 )
																		local f86_local0 = function ( f87_arg0, f87_arg1 )
																			local f87_local0 = function ( f88_arg0, f88_arg1 )
																				if not f88_arg1.interrupted then
																					f88_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																				end
																				f88_arg0:setLeftRight( true, false, 388, 532 )
																				f88_arg0:setTopBottom( true, false, 0, 36 )
																				f88_arg0:setAlpha( 1 )
																				if f88_arg1.interrupted then
																					self.clipFinished( f88_arg0, f88_arg1 )
																				else
																					f88_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f87_arg1.interrupted then
																				f87_local0( f87_arg0, f87_arg1 )
																				return 
																			else
																				f87_arg0:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
																				f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
																			end
																		end
																		
																		if f86_arg1.interrupted then
																			f86_local0( f86_arg0, f86_arg1 )
																			return 
																		else
																			f86_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			f86_arg0:setAlpha( 1 )
																			f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
																		end
																	end
																	
																	if f85_arg1.interrupted then
																		f85_local0( f85_arg0, f85_arg1 )
																		return 
																	else
																		f85_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
																	end
																end
																
																if f84_arg1.interrupted then
																	f84_local0( f84_arg0, f84_arg1 )
																	return 
																else
																	f84_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	f84_arg0:setAlpha( 0 )
																	f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
																end
															end
															
															if f83_arg1.interrupted then
																f83_local0( f83_arg0, f83_arg1 )
																return 
															else
																f83_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
															end
														end
														
														if f82_arg1.interrupted then
															f82_local0( f82_arg0, f82_arg1 )
															return 
														else
															f82_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															f82_arg0:setAlpha( 0.5 )
															f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
														end
													end
													
													if f81_arg1.interrupted then
														f81_local0( f81_arg0, f81_arg1 )
														return 
													else
														f81_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
													end
												end
												
												if f80_arg1.interrupted then
													f80_local0( f80_arg0, f80_arg1 )
													return 
												else
													f80_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													f80_arg0:setAlpha( 0 )
													f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
												end
											end
											
											if f79_arg1.interrupted then
												f79_local0( f79_arg0, f79_arg1 )
												return 
											else
												f79_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
												f79_arg0:setLeftRight( true, false, 500, 644 )
												f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
											end
										end
										
										if f78_arg1.interrupted then
											f78_local0( f78_arg0, f78_arg1 )
											return 
										else
											f78_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f78_arg0:setLeftRight( true, false, 500, 505 )
											f78_arg0:setAlpha( 1 )
											f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
										end
									end
									
									if f77_arg1.interrupted then
										f77_local0( f77_arg0, f77_arg1 )
										return 
									else
										f77_arg0:beginAnimation( "keyframe", 9100, false, false, CoD.TweenType.Linear )
										f77_arg0:setLeftRight( true, false, 500, 644 )
										f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
									end
								end
								
								if f76_arg1.interrupted then
									f76_local0( f76_arg0, f76_arg1 )
									return 
								else
									f76_arg0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
									f76_arg0:setLeftRight( true, false, 247, 391 )
									f76_arg0:setAlpha( 0 )
									f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
								end
							end
							
							if f75_arg1.interrupted then
								f75_local0( f75_arg0, f75_arg1 )
								return 
							else
								f75_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								f75_arg0:setLeftRight( true, false, 299.5, 443.5 )
								f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
							end
						end
						
						if f74_arg1.interrupted then
							f74_local0( f74_arg0, f74_arg1 )
							return 
						else
							f74_arg0:beginAnimation( "keyframe", 1900, false, false, CoD.TweenType.Linear )
							f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
						end
					end
					
					if f73_arg1.interrupted then
						f73_local0( f73_arg0, f73_arg1 )
						return 
					else
						f73_arg0:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
						f73_arg0:setLeftRight( true, false, 352, 496 )
						f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
					end
				end
				
				ModT2:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
				ModT2:setLeftRight( true, false, 388, 532 )
				ModT2:setTopBottom( true, false, 0, 36 )
				ModT2:setAlpha( 1 )
				ModT2:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local f2_local5 = function ( f89_arg0, f89_arg1 )
					local f89_local0 = function ( f90_arg0, f90_arg1 )
						local f90_local0 = function ( f91_arg0, f91_arg1 )
							local f91_local0 = function ( f92_arg0, f92_arg1 )
								local f92_local0 = function ( f93_arg0, f93_arg1 )
									local f93_local0 = function ( f94_arg0, f94_arg1 )
										local f94_local0 = function ( f95_arg0, f95_arg1 )
											local f95_local0 = function ( f96_arg0, f96_arg1 )
												local f96_local0 = function ( f97_arg0, f97_arg1 )
													local f97_local0 = function ( f98_arg0, f98_arg1 )
														local f98_local0 = function ( f99_arg0, f99_arg1 )
															if not f99_arg1.interrupted then
																f99_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															end
															f99_arg0:setLeftRight( true, false, 340, 388 )
															f99_arg0:setTopBottom( true, false, 0, 36 )
															f99_arg0:setAlpha( 1 )
															if f99_arg1.interrupted then
																self.clipFinished( f99_arg0, f99_arg1 )
															else
																f99_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f98_arg1.interrupted then
															f98_local0( f98_arg0, f98_arg1 )
															return 
														else
															f98_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															f98_arg0:registerEventHandler( "transition_complete_keyframe", f98_local0 )
														end
													end
													
													if f97_arg1.interrupted then
														f97_local0( f97_arg0, f97_arg1 )
														return 
													else
														f97_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f97_arg0:setAlpha( 0 )
														f97_arg0:registerEventHandler( "transition_complete_keyframe", f97_local0 )
													end
												end
												
												if f96_arg1.interrupted then
													f96_local0( f96_arg0, f96_arg1 )
													return 
												else
													f96_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
												end
											end
											
											if f95_arg1.interrupted then
												f95_local0( f95_arg0, f95_arg1 )
												return 
											else
												f95_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f95_arg0:setAlpha( 0.5 )
												f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
											end
										end
										
										if f94_arg1.interrupted then
											f94_local0( f94_arg0, f94_arg1 )
											return 
										else
											f94_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
										end
									end
									
									if f93_arg1.interrupted then
										f93_local0( f93_arg0, f93_arg1 )
										return 
									else
										f93_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f93_arg0:setAlpha( 0 )
										f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
									end
								end
								
								if f92_arg1.interrupted then
									f92_local0( f92_arg0, f92_arg1 )
									return 
								else
									f92_arg0:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
									f92_arg0:setTopBottom( true, false, 0, 36 )
									f92_arg0:setAlpha( 0.5 )
									f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
								end
							end
							
							if f91_arg1.interrupted then
								f91_local0( f91_arg0, f91_arg1 )
								return 
							else
								f91_arg0:beginAnimation( "keyframe", 13600, false, false, CoD.TweenType.Linear )
								f91_arg0:setLeftRight( true, false, 340, 388 )
								f91_arg0:setTopBottom( true, false, -36, 0 )
								f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
							end
						end
						
						if f90_arg1.interrupted then
							f90_local0( f90_arg0, f90_arg1 )
							return 
						else
							f90_arg0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
							f90_arg0:setLeftRight( true, false, 304, 352 )
							f90_arg0:setAlpha( 0 )
							f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
						end
					end
					
					if f89_arg1.interrupted then
						f89_local0( f89_arg0, f89_arg1 )
						return 
					else
						f89_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						f89_arg0:setLeftRight( true, false, 323.2, 371.2 )
						f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
					end
				end
				
				ModT3:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
				ModT3:setLeftRight( true, false, 340, 388 )
				ModT3:setTopBottom( true, false, 0, 36 )
				ModT3:setAlpha( 1 )
				ModT3:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local f2_local6 = function ( f100_arg0, f100_arg1 )
					local f100_local0 = function ( f101_arg0, f101_arg1 )
						local f101_local0 = function ( f102_arg0, f102_arg1 )
							local f102_local0 = function ( f103_arg0, f103_arg1 )
								local f103_local0 = function ( f104_arg0, f104_arg1 )
									local f104_local0 = function ( f105_arg0, f105_arg1 )
										local f105_local0 = function ( f106_arg0, f106_arg1 )
											local f106_local0 = function ( f107_arg0, f107_arg1 )
												local f107_local0 = function ( f108_arg0, f108_arg1 )
													local f108_local0 = function ( f109_arg0, f109_arg1 )
														local f109_local0 = function ( f110_arg0, f110_arg1 )
															local f110_local0 = function ( f111_arg0, f111_arg1 )
																local f111_local0 = function ( f112_arg0, f112_arg1 )
																	local f112_local0 = function ( f113_arg0, f113_arg1 )
																		local f113_local0 = function ( f114_arg0, f114_arg1 )
																			local f114_local0 = function ( f115_arg0, f115_arg1 )
																				if not f115_arg1.interrupted then
																					f115_arg0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
																				end
																				f115_arg0:setLeftRight( true, false, 408, 444 )
																				f115_arg0:setTopBottom( true, false, 0, 36 )
																				f115_arg0:setAlpha( 0 )
																				if f115_arg1.interrupted then
																					self.clipFinished( f115_arg0, f115_arg1 )
																				else
																					f115_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f114_arg1.interrupted then
																				f114_local0( f114_arg0, f114_arg1 )
																				return 
																			else
																				f114_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																				f114_arg0:setLeftRight( true, false, 433.6, 469.6 )
																				f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
																			end
																		end
																		
																		if f113_arg1.interrupted then
																			f113_local0( f113_arg0, f113_arg1 )
																			return 
																		else
																			f113_arg0:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
																			f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
																		end
																	end
																	
																	if f112_arg1.interrupted then
																		f112_local0( f112_arg0, f112_arg1 )
																		return 
																	else
																		f112_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		f112_arg0:setLeftRight( true, false, 456, 492 )
																		f112_arg0:registerEventHandler( "transition_complete_keyframe", f112_local0 )
																	end
																end
																
																if f111_arg1.interrupted then
																	f111_local0( f111_arg0, f111_arg1 )
																	return 
																else
																	f111_arg0:beginAnimation( "keyframe", 3299, false, false, CoD.TweenType.Linear )
																	f111_arg0:registerEventHandler( "transition_complete_keyframe", f111_local0 )
																end
															end
															
															if f110_arg1.interrupted then
																f110_local0( f110_arg0, f110_arg1 )
																return 
															else
																f110_arg0:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																f110_arg0:setLeftRight( true, false, 503, 539 )
																f110_arg0:registerEventHandler( "transition_complete_keyframe", f110_local0 )
															end
														end
														
														if f109_arg1.interrupted then
															f109_local0( f109_arg0, f109_arg1 )
															return 
														else
															f109_arg0:beginAnimation( "keyframe", 1510, false, false, CoD.TweenType.Linear )
															f109_arg0:registerEventHandler( "transition_complete_keyframe", f109_local0 )
														end
													end
													
													if f108_arg1.interrupted then
														f108_local0( f108_arg0, f108_arg1 )
														return 
													else
														f108_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														f108_arg0:setAlpha( 1 )
														f108_arg0:registerEventHandler( "transition_complete_keyframe", f108_local0 )
													end
												end
												
												if f107_arg1.interrupted then
													f107_local0( f107_arg0, f107_arg1 )
													return 
												else
													f107_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													f107_arg0:registerEventHandler( "transition_complete_keyframe", f107_local0 )
												end
											end
											
											if f106_arg1.interrupted then
												f106_local0( f106_arg0, f106_arg1 )
												return 
											else
												f106_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f106_arg0:setAlpha( 0 )
												f106_arg0:registerEventHandler( "transition_complete_keyframe", f106_local0 )
											end
										end
										
										if f105_arg1.interrupted then
											f105_local0( f105_arg0, f105_arg1 )
											return 
										else
											f105_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											f105_arg0:registerEventHandler( "transition_complete_keyframe", f105_local0 )
										end
									end
									
									if f104_arg1.interrupted then
										f104_local0( f104_arg0, f104_arg1 )
										return 
									else
										f104_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f104_arg0:setAlpha( 0.5 )
										f104_arg0:registerEventHandler( "transition_complete_keyframe", f104_local0 )
									end
								end
								
								if f103_arg1.interrupted then
									f103_local0( f103_arg0, f103_arg1 )
									return 
								else
									f103_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									f103_arg0:registerEventHandler( "transition_complete_keyframe", f103_local0 )
								end
							end
							
							if f102_arg1.interrupted then
								f102_local0( f102_arg0, f102_arg1 )
								return 
							else
								f102_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f102_arg0:setAlpha( 0 )
								f102_arg0:registerEventHandler( "transition_complete_keyframe", f102_local0 )
							end
						end
						
						if f101_arg1.interrupted then
							f101_local0( f101_arg0, f101_arg1 )
							return 
						else
							f101_arg0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							f101_arg0:setLeftRight( true, false, 608, 644 )
							f101_arg0:registerEventHandler( "transition_complete_keyframe", f101_local0 )
						end
					end
					
					if f100_arg1.interrupted then
						f100_local0( f100_arg0, f100_arg1 )
						return 
					else
						f100_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f100_arg0:setLeftRight( true, false, 608, 612 )
						f100_arg0:setAlpha( 1 )
						f100_arg0:registerEventHandler( "transition_complete_keyframe", f100_local0 )
					end
				end
				
				ModT4:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
				ModT4:setLeftRight( true, false, 608, 644 )
				ModT4:setTopBottom( true, false, 0, 36 )
				ModT4:setAlpha( 0 )
				ModT4:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local f2_local7 = function ( f116_arg0, f116_arg1 )
					local f116_local0 = function ( f117_arg0, f117_arg1 )
						local f117_local0 = function ( f118_arg0, f118_arg1 )
							local f118_local0 = function ( f119_arg0, f119_arg1 )
								local f119_local0 = function ( f120_arg0, f120_arg1 )
									local f120_local0 = function ( f121_arg0, f121_arg1 )
										local f121_local0 = function ( f122_arg0, f122_arg1 )
											local f122_local0 = function ( f123_arg0, f123_arg1 )
												local f123_local0 = function ( f124_arg0, f124_arg1 )
													local f124_local0 = function ( f125_arg0, f125_arg1 )
														local f125_local0 = function ( f126_arg0, f126_arg1 )
															local f126_local0 = function ( f127_arg0, f127_arg1 )
																local f127_local0 = function ( f128_arg0, f128_arg1 )
																	local f128_local0 = function ( f129_arg0, f129_arg1 )
																		local f129_local0 = function ( f130_arg0, f130_arg1 )
																			local f130_local0 = function ( f131_arg0, f131_arg1 )
																				if not f131_arg1.interrupted then
																					f131_arg0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
																				end
																				f131_arg0:setLeftRight( true, false, 332, 436 )
																				f131_arg0:setTopBottom( true, false, 0, 36 )
																				f131_arg0:setAlpha( 0 )
																				if f131_arg1.interrupted then
																					self.clipFinished( f131_arg0, f131_arg1 )
																				else
																					f131_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f130_arg1.interrupted then
																				f130_local0( f130_arg0, f130_arg1 )
																				return 
																			else
																				f130_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																				f130_arg0:setLeftRight( true, false, 391.73, 495.73 )
																				f130_arg0:registerEventHandler( "transition_complete_keyframe", f130_local0 )
																			end
																		end
																		
																		if f129_arg1.interrupted then
																			f129_local0( f129_arg0, f129_arg1 )
																			return 
																		else
																			f129_arg0:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																			f129_arg0:registerEventHandler( "transition_complete_keyframe", f129_local0 )
																		end
																	end
																	
																	if f128_arg1.interrupted then
																		f128_local0( f128_arg0, f128_arg1 )
																		return 
																	else
																		f128_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		f128_arg0:setLeftRight( true, false, 444, 548 )
																		f128_arg0:registerEventHandler( "transition_complete_keyframe", f128_local0 )
																	end
																end
																
																if f127_arg1.interrupted then
																	f127_local0( f127_arg0, f127_arg1 )
																	return 
																else
																	f127_arg0:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
																	f127_arg0:registerEventHandler( "transition_complete_keyframe", f127_local0 )
																end
															end
															
															if f126_arg1.interrupted then
																f126_local0( f126_arg0, f126_arg1 )
																return 
															else
																f126_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																f126_arg0:setLeftRight( true, false, 492, 596 )
																f126_arg0:registerEventHandler( "transition_complete_keyframe", f126_local0 )
															end
														end
														
														if f125_arg1.interrupted then
															f125_local0( f125_arg0, f125_arg1 )
															return 
														else
															f125_arg0:beginAnimation( "keyframe", 2909, false, false, CoD.TweenType.Linear )
															f125_arg0:registerEventHandler( "transition_complete_keyframe", f125_local0 )
														end
													end
													
													if f124_arg1.interrupted then
														f124_local0( f124_arg0, f124_arg1 )
														return 
													else
														f124_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f124_arg0:setAlpha( 1 )
														f124_arg0:registerEventHandler( "transition_complete_keyframe", f124_local0 )
													end
												end
												
												if f123_arg1.interrupted then
													f123_local0( f123_arg0, f123_arg1 )
													return 
												else
													f123_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													f123_arg0:registerEventHandler( "transition_complete_keyframe", f123_local0 )
												end
											end
											
											if f122_arg1.interrupted then
												f122_local0( f122_arg0, f122_arg1 )
												return 
											else
												f122_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f122_arg0:setAlpha( 0 )
												f122_arg0:registerEventHandler( "transition_complete_keyframe", f122_local0 )
											end
										end
										
										if f121_arg1.interrupted then
											f121_local0( f121_arg0, f121_arg1 )
											return 
										else
											f121_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											f121_arg0:registerEventHandler( "transition_complete_keyframe", f121_local0 )
										end
									end
									
									if f120_arg1.interrupted then
										f120_local0( f120_arg0, f120_arg1 )
										return 
									else
										f120_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f120_arg0:setAlpha( 0.5 )
										f120_arg0:registerEventHandler( "transition_complete_keyframe", f120_local0 )
									end
								end
								
								if f119_arg1.interrupted then
									f119_local0( f119_arg0, f119_arg1 )
									return 
								else
									f119_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									f119_arg0:registerEventHandler( "transition_complete_keyframe", f119_local0 )
								end
							end
							
							if f118_arg1.interrupted then
								f118_local0( f118_arg0, f118_arg1 )
								return 
							else
								f118_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f118_arg0:setAlpha( 0 )
								f118_arg0:registerEventHandler( "transition_complete_keyframe", f118_local0 )
							end
						end
						
						if f117_arg1.interrupted then
							f117_local0( f117_arg0, f117_arg1 )
							return 
						else
							f117_arg0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							f117_arg0:setLeftRight( true, false, 539, 643 )
							f117_arg0:registerEventHandler( "transition_complete_keyframe", f117_local0 )
						end
					end
					
					if f116_arg1.interrupted then
						f116_local0( f116_arg0, f116_arg1 )
						return 
					else
						f116_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f116_arg0:setLeftRight( true, false, 539, 544 )
						f116_arg0:setAlpha( 1 )
						f116_arg0:registerEventHandler( "transition_complete_keyframe", f116_local0 )
					end
				end
				
				ModT5:beginAnimation( "keyframe", 3700, false, false, CoD.TweenType.Linear )
				ModT5:setLeftRight( true, false, 539, 643 )
				ModT5:setTopBottom( true, false, 0, 36 )
				ModT5:setAlpha( 0 )
				ModT5:registerEventHandler( "transition_complete_keyframe", f2_local7 )
				local f2_local8 = function ( f132_arg0, f132_arg1 )
					local f132_local0 = function ( f133_arg0, f133_arg1 )
						local f133_local0 = function ( f134_arg0, f134_arg1 )
							local f134_local0 = function ( f135_arg0, f135_arg1 )
								local f135_local0 = function ( f136_arg0, f136_arg1 )
									local f136_local0 = function ( f137_arg0, f137_arg1 )
										local f137_local0 = function ( f138_arg0, f138_arg1 )
											local f138_local0 = function ( f139_arg0, f139_arg1 )
												local f139_local0 = function ( f140_arg0, f140_arg1 )
													local f140_local0 = function ( f141_arg0, f141_arg1 )
														local f141_local0 = function ( f142_arg0, f142_arg1 )
															local f142_local0 = function ( f143_arg0, f143_arg1 )
																local f143_local0 = function ( f144_arg0, f144_arg1 )
																	local f144_local0 = function ( f145_arg0, f145_arg1 )
																		local f145_local0 = function ( f146_arg0, f146_arg1 )
																			local f146_local0 = function ( f147_arg0, f147_arg1 )
																				if not f147_arg1.interrupted then
																					f147_arg0:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
																				end
																				f147_arg0:setLeftRight( true, false, 292, 340 )
																				f147_arg0:setTopBottom( true, false, 0, 36 )
																				f147_arg0:setAlpha( 0 )
																				if f147_arg1.interrupted then
																					self.clipFinished( f147_arg0, f147_arg1 )
																				else
																					f147_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f146_arg1.interrupted then
																				f146_local0( f146_arg0, f146_arg1 )
																				return 
																			else
																				f146_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																				f146_arg0:setLeftRight( true, false, 368.8, 416.8 )
																				f146_arg0:registerEventHandler( "transition_complete_keyframe", f146_local0 )
																			end
																		end
																		
																		if f145_arg1.interrupted then
																			f145_local0( f145_arg0, f145_arg1 )
																			return 
																		else
																			f145_arg0:beginAnimation( "keyframe", 2300, false, false, CoD.TweenType.Linear )
																			f145_arg0:registerEventHandler( "transition_complete_keyframe", f145_local0 )
																		end
																	end
																	
																	if f144_arg1.interrupted then
																		f144_local0( f144_arg0, f144_arg1 )
																		return 
																	else
																		f144_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		f144_arg0:setLeftRight( true, false, 436, 484 )
																		f144_arg0:registerEventHandler( "transition_complete_keyframe", f144_local0 )
																	end
																end
																
																if f143_arg1.interrupted then
																	f143_local0( f143_arg0, f143_arg1 )
																	return 
																else
																	f143_arg0:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																	f143_arg0:registerEventHandler( "transition_complete_keyframe", f143_local0 )
																end
															end
															
															if f142_arg1.interrupted then
																f142_local0( f142_arg0, f142_arg1 )
																return 
															else
																f142_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																f142_arg0:setLeftRight( true, false, 548, 596 )
																f142_arg0:registerEventHandler( "transition_complete_keyframe", f142_local0 )
															end
														end
														
														if f141_arg1.interrupted then
															f141_local0( f141_arg0, f141_arg1 )
															return 
														else
															f141_arg0:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
															f141_arg0:registerEventHandler( "transition_complete_keyframe", f141_local0 )
														end
													end
													
													if f140_arg1.interrupted then
														f140_local0( f140_arg0, f140_arg1 )
														return 
													else
														f140_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f140_arg0:setAlpha( 1 )
														f140_arg0:registerEventHandler( "transition_complete_keyframe", f140_local0 )
													end
												end
												
												if f139_arg1.interrupted then
													f139_local0( f139_arg0, f139_arg1 )
													return 
												else
													f139_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													f139_arg0:registerEventHandler( "transition_complete_keyframe", f139_local0 )
												end
											end
											
											if f138_arg1.interrupted then
												f138_local0( f138_arg0, f138_arg1 )
												return 
											else
												f138_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f138_arg0:setAlpha( 0 )
												f138_arg0:registerEventHandler( "transition_complete_keyframe", f138_local0 )
											end
										end
										
										if f137_arg1.interrupted then
											f137_local0( f137_arg0, f137_arg1 )
											return 
										else
											f137_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											f137_arg0:registerEventHandler( "transition_complete_keyframe", f137_local0 )
										end
									end
									
									if f136_arg1.interrupted then
										f136_local0( f136_arg0, f136_arg1 )
										return 
									else
										f136_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f136_arg0:setAlpha( 0.5 )
										f136_arg0:registerEventHandler( "transition_complete_keyframe", f136_local0 )
									end
								end
								
								if f135_arg1.interrupted then
									f135_local0( f135_arg0, f135_arg1 )
									return 
								else
									f135_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									f135_arg0:registerEventHandler( "transition_complete_keyframe", f135_local0 )
								end
							end
							
							if f134_arg1.interrupted then
								f134_local0( f134_arg0, f134_arg1 )
								return 
							else
								f134_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f134_arg0:setAlpha( 0 )
								f134_arg0:registerEventHandler( "transition_complete_keyframe", f134_local0 )
							end
						end
						
						if f133_arg1.interrupted then
							f133_local0( f133_arg0, f133_arg1 )
							return 
						else
							f133_arg0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							f133_arg0:setLeftRight( true, false, 596, 644 )
							f133_arg0:registerEventHandler( "transition_complete_keyframe", f133_local0 )
						end
					end
					
					if f132_arg1.interrupted then
						f132_local0( f132_arg0, f132_arg1 )
						return 
					else
						f132_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f132_arg0:setLeftRight( true, false, 596, 599 )
						f132_arg0:setAlpha( 1 )
						f132_arg0:registerEventHandler( "transition_complete_keyframe", f132_local0 )
					end
				end
				
				ModT6:beginAnimation( "keyframe", 7300, false, false, CoD.TweenType.Linear )
				ModT6:setLeftRight( true, false, 596, 644 )
				ModT6:setTopBottom( true, false, 0, 36 )
				ModT6:setAlpha( 0 )
				ModT6:registerEventHandler( "transition_complete_keyframe", f2_local8 )
				local f2_local9 = function ( f148_arg0, f148_arg1 )
					local f148_local0 = function ( f149_arg0, f149_arg1 )
						local f149_local0 = function ( f150_arg0, f150_arg1 )
							local f150_local0 = function ( f151_arg0, f151_arg1 )
								local f151_local0 = function ( f152_arg0, f152_arg1 )
									local f152_local0 = function ( f153_arg0, f153_arg1 )
										local f153_local0 = function ( f154_arg0, f154_arg1 )
											local f154_local0 = function ( f155_arg0, f155_arg1 )
												local f155_local0 = function ( f156_arg0, f156_arg1 )
													local f156_local0 = function ( f157_arg0, f157_arg1 )
														local f157_local0 = function ( f158_arg0, f158_arg1 )
															local f158_local0 = function ( f159_arg0, f159_arg1 )
																local f159_local0 = function ( f160_arg0, f160_arg1 )
																	local f160_local0 = function ( f161_arg0, f161_arg1 )
																		local f161_local0 = function ( f162_arg0, f162_arg1 )
																			local f162_local0 = function ( f163_arg0, f163_arg1 )
																				if not f163_arg1.interrupted then
																					f163_arg0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
																				end
																				f163_arg0:setLeftRight( true, false, 228, 276 )
																				f163_arg0:setTopBottom( true, false, 0, 36 )
																				f163_arg0:setAlpha( 0 )
																				if f163_arg1.interrupted then
																					self.clipFinished( f163_arg0, f163_arg1 )
																				else
																					f163_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f162_arg1.interrupted then
																				f162_local0( f162_arg0, f162_arg1 )
																				return 
																			else
																				f162_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
																				f162_arg0:setLeftRight( true, false, 284, 332 )
																				f162_arg0:registerEventHandler( "transition_complete_keyframe", f162_local0 )
																			end
																		end
																		
																		if f161_arg1.interrupted then
																			f161_local0( f161_arg0, f161_arg1 )
																			return 
																		else
																			f161_arg0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
																			f161_arg0:registerEventHandler( "transition_complete_keyframe", f161_local0 )
																		end
																	end
																	
																	if f160_arg1.interrupted then
																		f160_local0( f160_arg0, f160_arg1 )
																		return 
																	else
																		f160_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		f160_arg0:setLeftRight( true, false, 340, 388 )
																		f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
																	end
																end
																
																if f159_arg1.interrupted then
																	f159_local0( f159_arg0, f159_arg1 )
																	return 
																else
																	f159_arg0:beginAnimation( "keyframe", 2300, false, false, CoD.TweenType.Linear )
																	f159_arg0:registerEventHandler( "transition_complete_keyframe", f159_local0 )
																end
															end
															
															if f158_arg1.interrupted then
																f158_local0( f158_arg0, f158_arg1 )
																return 
															else
																f158_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																f158_arg0:setLeftRight( true, false, 484, 532 )
																f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
															end
														end
														
														if f157_arg1.interrupted then
															f157_local0( f157_arg0, f157_arg1 )
															return 
														else
															f157_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
															f157_arg0:registerEventHandler( "transition_complete_keyframe", f157_local0 )
														end
													end
													
													if f156_arg1.interrupted then
														f156_local0( f156_arg0, f156_arg1 )
														return 
													else
														f156_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														f156_arg0:setAlpha( 1 )
														f156_arg0:registerEventHandler( "transition_complete_keyframe", f156_local0 )
													end
												end
												
												if f155_arg1.interrupted then
													f155_local0( f155_arg0, f155_arg1 )
													return 
												else
													f155_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
												end
											end
											
											if f154_arg1.interrupted then
												f154_local0( f154_arg0, f154_arg1 )
												return 
											else
												f154_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f154_arg0:setAlpha( 0 )
												f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
											end
										end
										
										if f153_arg1.interrupted then
											f153_local0( f153_arg0, f153_arg1 )
											return 
										else
											f153_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											f153_arg0:registerEventHandler( "transition_complete_keyframe", f153_local0 )
										end
									end
									
									if f152_arg1.interrupted then
										f152_local0( f152_arg0, f152_arg1 )
										return 
									else
										f152_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f152_arg0:setAlpha( 0.5 )
										f152_arg0:registerEventHandler( "transition_complete_keyframe", f152_local0 )
									end
								end
								
								if f151_arg1.interrupted then
									f151_local0( f151_arg0, f151_arg1 )
									return 
								else
									f151_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									f151_arg0:registerEventHandler( "transition_complete_keyframe", f151_local0 )
								end
							end
							
							if f150_arg1.interrupted then
								f150_local0( f150_arg0, f150_arg1 )
								return 
							else
								f150_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f150_arg0:setAlpha( 0 )
								f150_arg0:registerEventHandler( "transition_complete_keyframe", f150_local0 )
							end
						end
						
						if f149_arg1.interrupted then
							f149_local0( f149_arg0, f149_arg1 )
							return 
						else
							f149_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							f149_arg0:setLeftRight( true, false, 596, 644 )
							f149_arg0:registerEventHandler( "transition_complete_keyframe", f149_local0 )
						end
					end
					
					if f148_arg1.interrupted then
						f148_local0( f148_arg0, f148_arg1 )
						return 
					else
						f148_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f148_arg0:setLeftRight( true, false, 596, 600 )
						f148_arg0:setAlpha( 1 )
						f148_arg0:registerEventHandler( "transition_complete_keyframe", f148_local0 )
					end
				end
				
				ModT7:beginAnimation( "keyframe", 9300, false, false, CoD.TweenType.Linear )
				ModT7:setLeftRight( true, false, 596, 644 )
				ModT7:setTopBottom( true, false, 0, 36 )
				ModT7:setAlpha( 0 )
				ModT7:registerEventHandler( "transition_complete_keyframe", f2_local9 )
				local ModT1bFrame2 = function ( ModT1b, event )
					local ModT1bFrame3 = function ( ModT1b, event )
						local ModT1bFrame4 = function ( ModT1b, event )
							local ModT1bFrame5 = function ( ModT1b, event )
								local ModT1bFrame6 = function ( ModT1b, event )
									local ModT1bFrame7 = function ( ModT1b, event )
										local ModT1bFrame8 = function ( ModT1b, event )
											local ModT1bFrame9 = function ( ModT1b, event )
												local ModT1bFrame10 = function ( ModT1b, event )
													local ModT1bFrame11 = function ( ModT1b, event )
														local ModT1bFrame12 = function ( ModT1b, event )
															if not event.interrupted then
																ModT1b:beginAnimation( "keyframe", 2010, false, false, CoD.TweenType.Linear )
															end
															ModT1b:setLeftRight( true, false, 532, 644 )
															ModT1b:setTopBottom( true, false, 0, 36 )
															ModT1b:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( ModT1b, event )
															else
																ModT1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															ModT1bFrame12( ModT1b, event )
															return 
														else
															ModT1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															ModT1b:setAlpha( 1 )
															ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame12 )
														end
													end
													
													if event.interrupted then
														ModT1bFrame11( ModT1b, event )
														return 
													else
														ModT1b:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame11 )
													end
												end
												
												if event.interrupted then
													ModT1bFrame10( ModT1b, event )
													return 
												else
													ModT1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													ModT1b:setAlpha( 0 )
													ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame10 )
												end
											end
											
											if event.interrupted then
												ModT1bFrame9( ModT1b, event )
												return 
											else
												ModT1b:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame9 )
											end
										end
										
										if event.interrupted then
											ModT1bFrame8( ModT1b, event )
											return 
										else
											ModT1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ModT1b:setAlpha( 0.5 )
											ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame8 )
										end
									end
									
									if event.interrupted then
										ModT1bFrame7( ModT1b, event )
										return 
									else
										ModT1b:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame7 )
									end
								end
								
								if event.interrupted then
									ModT1bFrame6( ModT1b, event )
									return 
								else
									ModT1b:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									ModT1b:setAlpha( 0 )
									ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame6 )
								end
							end
							
							if event.interrupted then
								ModT1bFrame5( ModT1b, event )
								return 
							else
								ModT1b:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
								ModT1b:setLeftRight( true, false, 532, 644 )
								ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame5 )
							end
						end
						
						if event.interrupted then
							ModT1bFrame4( ModT1b, event )
							return 
						else
							ModT1b:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ModT1b:setLeftRight( true, false, 532, 536 )
							ModT1b:setAlpha( 1 )
							ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame4 )
						end
					end
					
					if event.interrupted then
						ModT1bFrame3( ModT1b, event )
						return 
					else
						ModT1b:beginAnimation( "keyframe", 14600, false, false, CoD.TweenType.Linear )
						ModT1b:registerEventHandler( "transition_complete_keyframe", ModT1bFrame3 )
					end
				end
				
				ModT1b:completeAnimation()
				self.ModT1b:setLeftRight( true, false, 532, 644 )
				self.ModT1b:setTopBottom( true, false, 0, 36 )
				self.ModT1b:setAlpha( 0 )
				ModT1bFrame2( ModT1b, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return HideVehicleReticle( self, controller, event )
			end
		}
	} )
	self:linkToElementModel( self, "vehicleType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicleType"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ModB1:close()
		element.ModB2:close()
		element.ModB3:close()
		element.ModT1:close()
		element.ModT2:close()
		element.ModT3:close()
		element.ModT4:close()
		element.ModT5:close()
		element.ModT6:close()
		element.ModT7:close()
		element.ModT1b:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

