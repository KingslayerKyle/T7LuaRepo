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
	ModB1:setRGB( 1, 1, 1 )
	ModB1:setAlpha( 0 )
	self:addElement( ModB1 )
	self.ModB1 = ModB1
	
	local ModB2 = CoD.VehicleGround_ModB3.new( menu, controller )
	ModB2:setLeftRight( true, false, 508, 644 )
	ModB2:setTopBottom( true, false, 36, 76 )
	ModB2:setRGB( 1, 1, 1 )
	self:addElement( ModB2 )
	self.ModB2 = ModB2
	
	local ModB3 = CoD.VehicleGround_ModB2.new( menu, controller )
	ModB3:setLeftRight( true, false, 364, 508 )
	ModB3:setTopBottom( true, false, 36, 76 )
	ModB3:setRGB( 1, 1, 1 )
	self:addElement( ModB3 )
	self.ModB3 = ModB3
	
	local ModT1 = CoD.VehicleGround_ModT5.new( menu, controller )
	ModT1:setLeftRight( true, false, 388, 500 )
	ModT1:setTopBottom( true, false, 0, 36 )
	ModT1:setRGB( 1, 1, 1 )
	self:addElement( ModT1 )
	self.ModT1 = ModT1
	
	local ModT2 = CoD.VehicleGround_ModT4.new( menu, controller )
	ModT2:setLeftRight( true, false, 500, 644 )
	ModT2:setTopBottom( true, false, 0, 36 )
	ModT2:setRGB( 1, 1, 1 )
	self:addElement( ModT2 )
	self.ModT2 = ModT2
	
	local ModT3 = CoD.VehicleGround_ModT3.new( menu, controller )
	ModT3:setLeftRight( true, false, 336.24, 384.24 )
	ModT3:setTopBottom( true, false, -32.24, 3.76 )
	ModT3:setRGB( 1, 1, 1 )
	ModT3:setAlpha( 0 )
	self:addElement( ModT3 )
	self.ModT3 = ModT3
	
	local ModT4 = CoD.VehicleGround_ModT7.new( menu, controller )
	ModT4:setLeftRight( true, false, 408, 444 )
	ModT4:setTopBottom( true, false, 0, 36 )
	ModT4:setRGB( 1, 1, 1 )
	ModT4:setAlpha( 0 )
	self:addElement( ModT4 )
	self.ModT4 = ModT4
	
	local ModT5 = CoD.VehicleGround_ModT6.new( menu, controller )
	ModT5:setLeftRight( true, false, 332, 436 )
	ModT5:setTopBottom( true, false, 0, 36 )
	ModT5:setRGB( 1, 1, 1 )
	ModT5:setAlpha( 0 )
	self:addElement( ModT5 )
	self.ModT5 = ModT5
	
	local ModT6 = CoD.VehicleGround_ModT2.new( menu, controller )
	ModT6:setLeftRight( true, false, 292, 340 )
	ModT6:setTopBottom( true, false, 0, 36 )
	ModT6:setRGB( 1, 1, 1 )
	ModT6:setAlpha( 0 )
	self:addElement( ModT6 )
	self.ModT6 = ModT6
	
	local ModT7 = CoD.VehicleGround_ModT1.new( menu, controller )
	ModT7:setLeftRight( true, false, 340, 388 )
	ModT7:setTopBottom( true, false, 0, 36 )
	ModT7:setRGB( 1, 1, 1 )
	self:addElement( ModT7 )
	self.ModT7 = ModT7
	
	local ModT1b = CoD.VehicleGround_ModT5.new( menu, controller )
	ModT1b:setLeftRight( true, false, 532, 644 )
	ModT1b:setTopBottom( true, false, 0, 36 )
	ModT1b:setRGB( 1, 1, 1 )
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
				local ModT2Frame2 = function ( ModT2, event )
					local ModT2Frame3 = function ( ModT2, event )
						local ModT2Frame4 = function ( ModT2, event )
							local ModT2Frame5 = function ( ModT2, event )
								local ModT2Frame6 = function ( ModT2, event )
									local ModT2Frame7 = function ( ModT2, event )
										local ModT2Frame8 = function ( ModT2, event )
											local ModT2Frame9 = function ( ModT2, event )
												local ModT2Frame10 = function ( ModT2, event )
													local ModT2Frame11 = function ( ModT2, event )
														local ModT2Frame12 = function ( ModT2, event )
															local ModT2Frame13 = function ( ModT2, event )
																local ModT2Frame14 = function ( ModT2, event )
																	local ModT2Frame15 = function ( ModT2, event )
																		local ModT2Frame16 = function ( ModT2, event )
																			local ModT2Frame17 = function ( ModT2, event )
																				if not event.interrupted then
																					ModT2:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																				end
																				ModT2:setLeftRight( true, false, 388, 532 )
																				ModT2:setTopBottom( true, false, 0, 36 )
																				ModT2:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( ModT2, event )
																				else
																					ModT2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModT2Frame17( ModT2, event )
																				return 
																			else
																				ModT2:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
																				ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT2Frame16( ModT2, event )
																			return 
																		else
																			ModT2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			ModT2:setAlpha( 1 )
																			ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT2Frame15( ModT2, event )
																		return 
																	else
																		ModT2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT2Frame14( ModT2, event )
																	return 
																else
																	ModT2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	ModT2:setAlpha( 0 )
																	ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame14 )
																end
															end
															
															if event.interrupted then
																ModT2Frame13( ModT2, event )
																return 
															else
																ModT2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame13 )
															end
														end
														
														if event.interrupted then
															ModT2Frame12( ModT2, event )
															return 
														else
															ModT2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															ModT2:setAlpha( 0.5 )
															ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame12 )
														end
													end
													
													if event.interrupted then
														ModT2Frame11( ModT2, event )
														return 
													else
														ModT2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame11 )
													end
												end
												
												if event.interrupted then
													ModT2Frame10( ModT2, event )
													return 
												else
													ModT2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													ModT2:setAlpha( 0 )
													ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame10 )
												end
											end
											
											if event.interrupted then
												ModT2Frame9( ModT2, event )
												return 
											else
												ModT2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
												ModT2:setLeftRight( true, false, 500, 644 )
												ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame9 )
											end
										end
										
										if event.interrupted then
											ModT2Frame8( ModT2, event )
											return 
										else
											ModT2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ModT2:setLeftRight( true, false, 500, 505 )
											ModT2:setAlpha( 1 )
											ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame8 )
										end
									end
									
									if event.interrupted then
										ModT2Frame7( ModT2, event )
										return 
									else
										ModT2:beginAnimation( "keyframe", 9100, false, false, CoD.TweenType.Linear )
										ModT2:setLeftRight( true, false, 500, 644 )
										ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame7 )
									end
								end
								
								if event.interrupted then
									ModT2Frame6( ModT2, event )
									return 
								else
									ModT2:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
									ModT2:setLeftRight( true, false, 247, 391 )
									ModT2:setAlpha( 0 )
									ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame6 )
								end
							end
							
							if event.interrupted then
								ModT2Frame5( ModT2, event )
								return 
							else
								ModT2:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								ModT2:setLeftRight( true, false, 299.5, 443.5 )
								ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame5 )
							end
						end
						
						if event.interrupted then
							ModT2Frame4( ModT2, event )
							return 
						else
							ModT2:beginAnimation( "keyframe", 1900, false, false, CoD.TweenType.Linear )
							ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame4 )
						end
					end
					
					if event.interrupted then
						ModT2Frame3( ModT2, event )
						return 
					else
						ModT2:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
						ModT2:setLeftRight( true, false, 352, 496 )
						ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame3 )
					end
				end
				
				ModT2:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
				ModT2:setLeftRight( true, false, 388, 532 )
				ModT2:setTopBottom( true, false, 0, 36 )
				ModT2:setAlpha( 1 )
				ModT2:registerEventHandler( "transition_complete_keyframe", ModT2Frame2 )
				local ModT3Frame2 = function ( ModT3, event )
					local ModT3Frame3 = function ( ModT3, event )
						local ModT3Frame4 = function ( ModT3, event )
							local ModT3Frame5 = function ( ModT3, event )
								local ModT3Frame6 = function ( ModT3, event )
									local ModT3Frame7 = function ( ModT3, event )
										local ModT3Frame8 = function ( ModT3, event )
											local ModT3Frame9 = function ( ModT3, event )
												local ModT3Frame10 = function ( ModT3, event )
													local ModT3Frame11 = function ( ModT3, event )
														local ModT3Frame12 = function ( ModT3, event )
															if not event.interrupted then
																ModT3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															end
															ModT3:setLeftRight( true, false, 340, 388 )
															ModT3:setTopBottom( true, false, 0, 36 )
															ModT3:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( ModT3, event )
															else
																ModT3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															ModT3Frame12( ModT3, event )
															return 
														else
															ModT3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame12 )
														end
													end
													
													if event.interrupted then
														ModT3Frame11( ModT3, event )
														return 
													else
														ModT3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ModT3:setAlpha( 0 )
														ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame11 )
													end
												end
												
												if event.interrupted then
													ModT3Frame10( ModT3, event )
													return 
												else
													ModT3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame10 )
												end
											end
											
											if event.interrupted then
												ModT3Frame9( ModT3, event )
												return 
											else
												ModT3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModT3:setAlpha( 0.5 )
												ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame9 )
											end
										end
										
										if event.interrupted then
											ModT3Frame8( ModT3, event )
											return 
										else
											ModT3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame8 )
										end
									end
									
									if event.interrupted then
										ModT3Frame7( ModT3, event )
										return 
									else
										ModT3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ModT3:setAlpha( 0 )
										ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame7 )
									end
								end
								
								if event.interrupted then
									ModT3Frame6( ModT3, event )
									return 
								else
									ModT3:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
									ModT3:setTopBottom( true, false, 0, 36 )
									ModT3:setAlpha( 0.5 )
									ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame6 )
								end
							end
							
							if event.interrupted then
								ModT3Frame5( ModT3, event )
								return 
							else
								ModT3:beginAnimation( "keyframe", 13600, false, false, CoD.TweenType.Linear )
								ModT3:setLeftRight( true, false, 340, 388 )
								ModT3:setTopBottom( true, false, -36, 0 )
								ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame5 )
							end
						end
						
						if event.interrupted then
							ModT3Frame4( ModT3, event )
							return 
						else
							ModT3:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
							ModT3:setLeftRight( true, false, 304, 352 )
							ModT3:setAlpha( 0 )
							ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame4 )
						end
					end
					
					if event.interrupted then
						ModT3Frame3( ModT3, event )
						return 
					else
						ModT3:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						ModT3:setLeftRight( true, false, 323.2, 371.2 )
						ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame3 )
					end
				end
				
				ModT3:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
				ModT3:setLeftRight( true, false, 340, 388 )
				ModT3:setTopBottom( true, false, 0, 36 )
				ModT3:setAlpha( 1 )
				ModT3:registerEventHandler( "transition_complete_keyframe", ModT3Frame2 )
				local ModT4Frame2 = function ( ModT4, event )
					local ModT4Frame3 = function ( ModT4, event )
						local ModT4Frame4 = function ( ModT4, event )
							local ModT4Frame5 = function ( ModT4, event )
								local ModT4Frame6 = function ( ModT4, event )
									local ModT4Frame7 = function ( ModT4, event )
										local ModT4Frame8 = function ( ModT4, event )
											local ModT4Frame9 = function ( ModT4, event )
												local ModT4Frame10 = function ( ModT4, event )
													local ModT4Frame11 = function ( ModT4, event )
														local ModT4Frame12 = function ( ModT4, event )
															local ModT4Frame13 = function ( ModT4, event )
																local ModT4Frame14 = function ( ModT4, event )
																	local ModT4Frame15 = function ( ModT4, event )
																		local ModT4Frame16 = function ( ModT4, event )
																			local ModT4Frame17 = function ( ModT4, event )
																				if not event.interrupted then
																					ModT4:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
																				end
																				ModT4:setLeftRight( true, false, 408, 444 )
																				ModT4:setTopBottom( true, false, 0, 36 )
																				ModT4:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( ModT4, event )
																				else
																					ModT4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModT4Frame17( ModT4, event )
																				return 
																			else
																				ModT4:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																				ModT4:setLeftRight( true, false, 433.6, 469.6 )
																				ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT4Frame16( ModT4, event )
																			return 
																		else
																			ModT4:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
																			ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT4Frame15( ModT4, event )
																		return 
																	else
																		ModT4:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		ModT4:setLeftRight( true, false, 456, 492 )
																		ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT4Frame14( ModT4, event )
																	return 
																else
																	ModT4:beginAnimation( "keyframe", 3299, false, false, CoD.TweenType.Linear )
																	ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame14 )
																end
															end
															
															if event.interrupted then
																ModT4Frame13( ModT4, event )
																return 
															else
																ModT4:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																ModT4:setLeftRight( true, false, 503, 539 )
																ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame13 )
															end
														end
														
														if event.interrupted then
															ModT4Frame12( ModT4, event )
															return 
														else
															ModT4:beginAnimation( "keyframe", 1510, false, false, CoD.TweenType.Linear )
															ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame12 )
														end
													end
													
													if event.interrupted then
														ModT4Frame11( ModT4, event )
														return 
													else
														ModT4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														ModT4:setAlpha( 1 )
														ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame11 )
													end
												end
												
												if event.interrupted then
													ModT4Frame10( ModT4, event )
													return 
												else
													ModT4:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame10 )
												end
											end
											
											if event.interrupted then
												ModT4Frame9( ModT4, event )
												return 
											else
												ModT4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ModT4:setAlpha( 0 )
												ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame9 )
											end
										end
										
										if event.interrupted then
											ModT4Frame8( ModT4, event )
											return 
										else
											ModT4:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame8 )
										end
									end
									
									if event.interrupted then
										ModT4Frame7( ModT4, event )
										return 
									else
										ModT4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ModT4:setAlpha( 0.5 )
										ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame7 )
									end
								end
								
								if event.interrupted then
									ModT4Frame6( ModT4, event )
									return 
								else
									ModT4:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame6 )
								end
							end
							
							if event.interrupted then
								ModT4Frame5( ModT4, event )
								return 
							else
								ModT4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ModT4:setAlpha( 0 )
								ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame5 )
							end
						end
						
						if event.interrupted then
							ModT4Frame4( ModT4, event )
							return 
						else
							ModT4:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							ModT4:setLeftRight( true, false, 608, 644 )
							ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame4 )
						end
					end
					
					if event.interrupted then
						ModT4Frame3( ModT4, event )
						return 
					else
						ModT4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ModT4:setLeftRight( true, false, 608, 612 )
						ModT4:setAlpha( 1 )
						ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame3 )
					end
				end
				
				ModT4:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
				ModT4:setLeftRight( true, false, 608, 644 )
				ModT4:setTopBottom( true, false, 0, 36 )
				ModT4:setAlpha( 0 )
				ModT4:registerEventHandler( "transition_complete_keyframe", ModT4Frame2 )
				local ModT5Frame2 = function ( ModT5, event )
					local ModT5Frame3 = function ( ModT5, event )
						local ModT5Frame4 = function ( ModT5, event )
							local ModT5Frame5 = function ( ModT5, event )
								local ModT5Frame6 = function ( ModT5, event )
									local ModT5Frame7 = function ( ModT5, event )
										local ModT5Frame8 = function ( ModT5, event )
											local ModT5Frame9 = function ( ModT5, event )
												local ModT5Frame10 = function ( ModT5, event )
													local ModT5Frame11 = function ( ModT5, event )
														local ModT5Frame12 = function ( ModT5, event )
															local ModT5Frame13 = function ( ModT5, event )
																local ModT5Frame14 = function ( ModT5, event )
																	local ModT5Frame15 = function ( ModT5, event )
																		local ModT5Frame16 = function ( ModT5, event )
																			local ModT5Frame17 = function ( ModT5, event )
																				if not event.interrupted then
																					ModT5:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
																				end
																				ModT5:setLeftRight( true, false, 332, 436 )
																				ModT5:setTopBottom( true, false, 0, 36 )
																				ModT5:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( ModT5, event )
																				else
																					ModT5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModT5Frame17( ModT5, event )
																				return 
																			else
																				ModT5:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																				ModT5:setLeftRight( true, false, 391.73, 495.73 )
																				ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT5Frame16( ModT5, event )
																			return 
																		else
																			ModT5:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																			ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT5Frame15( ModT5, event )
																		return 
																	else
																		ModT5:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		ModT5:setLeftRight( true, false, 444, 548 )
																		ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT5Frame14( ModT5, event )
																	return 
																else
																	ModT5:beginAnimation( "keyframe", 1699, false, false, CoD.TweenType.Linear )
																	ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame14 )
																end
															end
															
															if event.interrupted then
																ModT5Frame13( ModT5, event )
																return 
															else
																ModT5:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																ModT5:setLeftRight( true, false, 492, 596 )
																ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame13 )
															end
														end
														
														if event.interrupted then
															ModT5Frame12( ModT5, event )
															return 
														else
															ModT5:beginAnimation( "keyframe", 2909, false, false, CoD.TweenType.Linear )
															ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame12 )
														end
													end
													
													if event.interrupted then
														ModT5Frame11( ModT5, event )
														return 
													else
														ModT5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ModT5:setAlpha( 1 )
														ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame11 )
													end
												end
												
												if event.interrupted then
													ModT5Frame10( ModT5, event )
													return 
												else
													ModT5:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame10 )
												end
											end
											
											if event.interrupted then
												ModT5Frame9( ModT5, event )
												return 
											else
												ModT5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModT5:setAlpha( 0 )
												ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame9 )
											end
										end
										
										if event.interrupted then
											ModT5Frame8( ModT5, event )
											return 
										else
											ModT5:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame8 )
										end
									end
									
									if event.interrupted then
										ModT5Frame7( ModT5, event )
										return 
									else
										ModT5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ModT5:setAlpha( 0.5 )
										ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame7 )
									end
								end
								
								if event.interrupted then
									ModT5Frame6( ModT5, event )
									return 
								else
									ModT5:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame6 )
								end
							end
							
							if event.interrupted then
								ModT5Frame5( ModT5, event )
								return 
							else
								ModT5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ModT5:setAlpha( 0 )
								ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame5 )
							end
						end
						
						if event.interrupted then
							ModT5Frame4( ModT5, event )
							return 
						else
							ModT5:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							ModT5:setLeftRight( true, false, 539, 643 )
							ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame4 )
						end
					end
					
					if event.interrupted then
						ModT5Frame3( ModT5, event )
						return 
					else
						ModT5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ModT5:setLeftRight( true, false, 539, 544 )
						ModT5:setAlpha( 1 )
						ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame3 )
					end
				end
				
				ModT5:beginAnimation( "keyframe", 3700, false, false, CoD.TweenType.Linear )
				ModT5:setLeftRight( true, false, 539, 643 )
				ModT5:setTopBottom( true, false, 0, 36 )
				ModT5:setAlpha( 0 )
				ModT5:registerEventHandler( "transition_complete_keyframe", ModT5Frame2 )
				local ModT6Frame2 = function ( ModT6, event )
					local ModT6Frame3 = function ( ModT6, event )
						local ModT6Frame4 = function ( ModT6, event )
							local ModT6Frame5 = function ( ModT6, event )
								local ModT6Frame6 = function ( ModT6, event )
									local ModT6Frame7 = function ( ModT6, event )
										local ModT6Frame8 = function ( ModT6, event )
											local ModT6Frame9 = function ( ModT6, event )
												local ModT6Frame10 = function ( ModT6, event )
													local ModT6Frame11 = function ( ModT6, event )
														local ModT6Frame12 = function ( ModT6, event )
															local ModT6Frame13 = function ( ModT6, event )
																local ModT6Frame14 = function ( ModT6, event )
																	local ModT6Frame15 = function ( ModT6, event )
																		local ModT6Frame16 = function ( ModT6, event )
																			local ModT6Frame17 = function ( ModT6, event )
																				if not event.interrupted then
																					ModT6:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
																				end
																				ModT6:setLeftRight( true, false, 292, 340 )
																				ModT6:setTopBottom( true, false, 0, 36 )
																				ModT6:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( ModT6, event )
																				else
																					ModT6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModT6Frame17( ModT6, event )
																				return 
																			else
																				ModT6:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																				ModT6:setLeftRight( true, false, 368.8, 416.8 )
																				ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT6Frame16( ModT6, event )
																			return 
																		else
																			ModT6:beginAnimation( "keyframe", 2300, false, false, CoD.TweenType.Linear )
																			ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT6Frame15( ModT6, event )
																		return 
																	else
																		ModT6:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		ModT6:setLeftRight( true, false, 436, 484 )
																		ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT6Frame14( ModT6, event )
																	return 
																else
																	ModT6:beginAnimation( "keyframe", 599, false, false, CoD.TweenType.Linear )
																	ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame14 )
																end
															end
															
															if event.interrupted then
																ModT6Frame13( ModT6, event )
																return 
															else
																ModT6:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																ModT6:setLeftRight( true, false, 548, 596 )
																ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame13 )
															end
														end
														
														if event.interrupted then
															ModT6Frame12( ModT6, event )
															return 
														else
															ModT6:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
															ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame12 )
														end
													end
													
													if event.interrupted then
														ModT6Frame11( ModT6, event )
														return 
													else
														ModT6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														ModT6:setAlpha( 1 )
														ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame11 )
													end
												end
												
												if event.interrupted then
													ModT6Frame10( ModT6, event )
													return 
												else
													ModT6:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame10 )
												end
											end
											
											if event.interrupted then
												ModT6Frame9( ModT6, event )
												return 
											else
												ModT6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModT6:setAlpha( 0 )
												ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame9 )
											end
										end
										
										if event.interrupted then
											ModT6Frame8( ModT6, event )
											return 
										else
											ModT6:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame8 )
										end
									end
									
									if event.interrupted then
										ModT6Frame7( ModT6, event )
										return 
									else
										ModT6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ModT6:setAlpha( 0.5 )
										ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame7 )
									end
								end
								
								if event.interrupted then
									ModT6Frame6( ModT6, event )
									return 
								else
									ModT6:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame6 )
								end
							end
							
							if event.interrupted then
								ModT6Frame5( ModT6, event )
								return 
							else
								ModT6:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ModT6:setAlpha( 0 )
								ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame5 )
							end
						end
						
						if event.interrupted then
							ModT6Frame4( ModT6, event )
							return 
						else
							ModT6:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							ModT6:setLeftRight( true, false, 596, 644 )
							ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame4 )
						end
					end
					
					if event.interrupted then
						ModT6Frame3( ModT6, event )
						return 
					else
						ModT6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ModT6:setLeftRight( true, false, 596, 599 )
						ModT6:setAlpha( 1 )
						ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame3 )
					end
				end
				
				ModT6:beginAnimation( "keyframe", 7300, false, false, CoD.TweenType.Linear )
				ModT6:setLeftRight( true, false, 596, 644 )
				ModT6:setTopBottom( true, false, 0, 36 )
				ModT6:setAlpha( 0 )
				ModT6:registerEventHandler( "transition_complete_keyframe", ModT6Frame2 )
				local ModT7Frame2 = function ( ModT7, event )
					local ModT7Frame3 = function ( ModT7, event )
						local ModT7Frame4 = function ( ModT7, event )
							local ModT7Frame5 = function ( ModT7, event )
								local ModT7Frame6 = function ( ModT7, event )
									local ModT7Frame7 = function ( ModT7, event )
										local ModT7Frame8 = function ( ModT7, event )
											local ModT7Frame9 = function ( ModT7, event )
												local ModT7Frame10 = function ( ModT7, event )
													local ModT7Frame11 = function ( ModT7, event )
														local ModT7Frame12 = function ( ModT7, event )
															local ModT7Frame13 = function ( ModT7, event )
																local ModT7Frame14 = function ( ModT7, event )
																	local ModT7Frame15 = function ( ModT7, event )
																		local ModT7Frame16 = function ( ModT7, event )
																			local ModT7Frame17 = function ( ModT7, event )
																				if not event.interrupted then
																					ModT7:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
																				end
																				ModT7:setLeftRight( true, false, 228, 276 )
																				ModT7:setTopBottom( true, false, 0, 36 )
																				ModT7:setAlpha( 0 )
																				if event.interrupted then
																					self.clipFinished( ModT7, event )
																				else
																					ModT7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				ModT7Frame17( ModT7, event )
																				return 
																			else
																				ModT7:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
																				ModT7:setLeftRight( true, false, 284, 332 )
																				ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ModT7Frame16( ModT7, event )
																			return 
																		else
																			ModT7:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
																			ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ModT7Frame15( ModT7, event )
																		return 
																	else
																		ModT7:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		ModT7:setLeftRight( true, false, 340, 388 )
																		ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame15 )
																	end
																end
																
																if event.interrupted then
																	ModT7Frame14( ModT7, event )
																	return 
																else
																	ModT7:beginAnimation( "keyframe", 2300, false, false, CoD.TweenType.Linear )
																	ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame14 )
																end
															end
															
															if event.interrupted then
																ModT7Frame13( ModT7, event )
																return 
															else
																ModT7:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																ModT7:setLeftRight( true, false, 484, 532 )
																ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame13 )
															end
														end
														
														if event.interrupted then
															ModT7Frame12( ModT7, event )
															return 
														else
															ModT7:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
															ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame12 )
														end
													end
													
													if event.interrupted then
														ModT7Frame11( ModT7, event )
														return 
													else
														ModT7:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														ModT7:setAlpha( 1 )
														ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame11 )
													end
												end
												
												if event.interrupted then
													ModT7Frame10( ModT7, event )
													return 
												else
													ModT7:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame10 )
												end
											end
											
											if event.interrupted then
												ModT7Frame9( ModT7, event )
												return 
											else
												ModT7:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												ModT7:setAlpha( 0 )
												ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame9 )
											end
										end
										
										if event.interrupted then
											ModT7Frame8( ModT7, event )
											return 
										else
											ModT7:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame8 )
										end
									end
									
									if event.interrupted then
										ModT7Frame7( ModT7, event )
										return 
									else
										ModT7:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ModT7:setAlpha( 0.5 )
										ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame7 )
									end
								end
								
								if event.interrupted then
									ModT7Frame6( ModT7, event )
									return 
								else
									ModT7:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame6 )
								end
							end
							
							if event.interrupted then
								ModT7Frame5( ModT7, event )
								return 
							else
								ModT7:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								ModT7:setAlpha( 0 )
								ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame5 )
							end
						end
						
						if event.interrupted then
							ModT7Frame4( ModT7, event )
							return 
						else
							ModT7:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							ModT7:setLeftRight( true, false, 596, 644 )
							ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame4 )
						end
					end
					
					if event.interrupted then
						ModT7Frame3( ModT7, event )
						return 
					else
						ModT7:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						ModT7:setLeftRight( true, false, 596, 600 )
						ModT7:setAlpha( 1 )
						ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame3 )
					end
				end
				
				ModT7:beginAnimation( "keyframe", 9300, false, false, CoD.TweenType.Linear )
				ModT7:setLeftRight( true, false, 596, 644 )
				ModT7:setTopBottom( true, false, 0, 36 )
				ModT7:setAlpha( 0 )
				ModT7:registerEventHandler( "transition_complete_keyframe", ModT7Frame2 )
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
	self.close = function ( self )
		self.ModB1:close()
		self.ModB2:close()
		self.ModB3:close()
		self.ModT1:close()
		self.ModT2:close()
		self.ModT3:close()
		self.ModT4:close()
		self.ModT5:close()
		self.ModT6:close()
		self.ModT7:close()
		self.ModT1b:close()
		CoD.VehicleGround_ModRight.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

