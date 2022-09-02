-- a1919a4a712e16df2738052bbc1fe700
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModB4" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModB3" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModB2" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT7" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT6" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT5" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT4" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT3" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT2" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT1" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModDNI" )

CoD.VehicleGround_ModLeft = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModLeft.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ModLeft )
	self.id = "VehicleGround_ModLeft"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 644 )
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local VehicleGroundModB40 = CoD.VehicleGround_ModB4.new( menu, controller )
	VehicleGroundModB40:setLeftRight( true, false, 330.43, 444.43 )
	VehicleGroundModB40:setTopBottom( true, false, 36, 76 )
	VehicleGroundModB40:setAlpha( 0.04 )
	self:addElement( VehicleGroundModB40 )
	self.VehicleGroundModB40 = VehicleGroundModB40
	
	local VehicleGroundModB30 = CoD.VehicleGround_ModB3.new( menu, controller )
	VehicleGroundModB30:setLeftRight( true, false, 194.43, 330.43 )
	VehicleGroundModB30:setTopBottom( true, false, 36, 76 )
	self:addElement( VehicleGroundModB30 )
	self.VehicleGroundModB30 = VehicleGroundModB30
	
	local VehicleGroundModB20 = CoD.VehicleGround_ModB2.new( menu, controller )
	VehicleGroundModB20:setLeftRight( true, false, 53.15, 197.15 )
	VehicleGroundModB20:setTopBottom( true, false, 36, 76 )
	VehicleGroundModB20:setAlpha( 0 )
	self:addElement( VehicleGroundModB20 )
	self.VehicleGroundModB20 = VehicleGroundModB20
	
	local VehicleGroundModT70 = CoD.VehicleGround_ModT7.new( menu, controller )
	VehicleGroundModT70:setLeftRight( true, false, 412, 448 )
	VehicleGroundModT70:setTopBottom( true, false, 0, 36 )
	VehicleGroundModT70:setAlpha( 0 )
	self:addElement( VehicleGroundModT70 )
	self.VehicleGroundModT70 = VehicleGroundModT70
	
	local VehicleGroundModT60 = CoD.VehicleGround_ModT6.new( menu, controller )
	VehicleGroundModT60:setLeftRight( true, false, 356, 460 )
	VehicleGroundModT60:setTopBottom( true, false, 0, 36 )
	VehicleGroundModT60:setAlpha( 0 )
	self:addElement( VehicleGroundModT60 )
	self.VehicleGroundModT60 = VehicleGroundModT60
	
	local VehicleGroundModT50 = CoD.VehicleGround_ModT5.new( menu, controller )
	VehicleGroundModT50:setLeftRight( true, false, 244, 356 )
	VehicleGroundModT50:setTopBottom( true, false, 0, 36 )
	self:addElement( VehicleGroundModT50 )
	self.VehicleGroundModT50 = VehicleGroundModT50
	
	local VehicleGroundModT40 = CoD.VehicleGround_ModT4.new( menu, controller )
	VehicleGroundModT40:setLeftRight( true, false, 100, 244 )
	VehicleGroundModT40:setTopBottom( true, false, 0, 36 )
	self:addElement( VehicleGroundModT40 )
	self.VehicleGroundModT40 = VehicleGroundModT40
	
	local VehicleGroundModT30 = CoD.VehicleGround_ModT3.new( menu, controller )
	VehicleGroundModT30:setLeftRight( true, false, 52, 100 )
	VehicleGroundModT30:setTopBottom( true, false, 0, 36 )
	self:addElement( VehicleGroundModT30 )
	self.VehicleGroundModT30 = VehicleGroundModT30
	
	local VehicleGroundModT20 = CoD.VehicleGround_ModT2.new( menu, controller )
	VehicleGroundModT20:setLeftRight( true, false, 102.3, 150.3 )
	VehicleGroundModT20:setTopBottom( true, false, 0, 36 )
	VehicleGroundModT20:setAlpha( 0 )
	self:addElement( VehicleGroundModT20 )
	self.VehicleGroundModT20 = VehicleGroundModT20
	
	local VehicleGroundModT10 = CoD.VehicleGround_ModT1.new( menu, controller )
	VehicleGroundModT10:setLeftRight( true, false, 250.36, 298.36 )
	VehicleGroundModT10:setTopBottom( true, false, 0, 36 )
	VehicleGroundModT10:setAlpha( 0 )
	self:addElement( VehicleGroundModT10 )
	self.VehicleGroundModT10 = VehicleGroundModT10
	
	local VehicleGroundModDNI0 = CoD.VehicleGround_ModDNI.new( menu, controller )
	VehicleGroundModDNI0:setLeftRight( true, false, 0, 52 )
	VehicleGroundModDNI0:setTopBottom( true, false, 1, 58 )
	self:addElement( VehicleGroundModDNI0 )
	self.VehicleGroundModDNI0 = VehicleGroundModDNI0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				local VehicleGroundModB40Frame2 = function ( VehicleGroundModB40, event )
					local VehicleGroundModB40Frame3 = function ( VehicleGroundModB40, event )
						local VehicleGroundModB40Frame4 = function ( VehicleGroundModB40, event )
							local VehicleGroundModB40Frame5 = function ( VehicleGroundModB40, event )
								local VehicleGroundModB40Frame6 = function ( VehicleGroundModB40, event )
									local VehicleGroundModB40Frame7 = function ( VehicleGroundModB40, event )
										local VehicleGroundModB40Frame8 = function ( VehicleGroundModB40, event )
											local VehicleGroundModB40Frame9 = function ( VehicleGroundModB40, event )
												local VehicleGroundModB40Frame10 = function ( VehicleGroundModB40, event )
													local VehicleGroundModB40Frame11 = function ( VehicleGroundModB40, event )
														local VehicleGroundModB40Frame12 = function ( VehicleGroundModB40, event )
															local VehicleGroundModB40Frame13 = function ( VehicleGroundModB40, event )
																local VehicleGroundModB40Frame14 = function ( VehicleGroundModB40, event )
																	local VehicleGroundModB40Frame15 = function ( VehicleGroundModB40, event )
																		local VehicleGroundModB40Frame16 = function ( VehicleGroundModB40, event )
																			if not event.interrupted then
																				VehicleGroundModB40:beginAnimation( "keyframe", 149, false, true, CoD.TweenType.Linear )
																			end
																			VehicleGroundModB40:setLeftRight( true, false, 332, 446 )
																			VehicleGroundModB40:setTopBottom( true, false, 36, 76 )
																			VehicleGroundModB40:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( VehicleGroundModB40, event )
																			else
																				VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModB40Frame16( VehicleGroundModB40, event )
																			return 
																		else
																			VehicleGroundModB40:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
																			VehicleGroundModB40:setLeftRight( true, false, 260, 374 )
																			VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModB40Frame15( VehicleGroundModB40, event )
																		return 
																	else
																		VehicleGroundModB40:beginAnimation( "keyframe", 4030, false, false, CoD.TweenType.Linear )
																		VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModB40Frame14( VehicleGroundModB40, event )
																	return 
																else
																	VehicleGroundModB40:beginAnimation( "keyframe", 289, false, true, CoD.TweenType.Linear )
																	VehicleGroundModB40:setLeftRight( true, false, 188, 302 )
																	VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModB40Frame13( VehicleGroundModB40, event )
																return 
															else
																VehicleGroundModB40:beginAnimation( "keyframe", 5549, false, false, CoD.TweenType.Linear )
																VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModB40Frame12( VehicleGroundModB40, event )
															return 
														else
															VehicleGroundModB40:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															VehicleGroundModB40:setAlpha( 1 )
															VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModB40Frame11( VehicleGroundModB40, event )
														return 
													else
														VehicleGroundModB40:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModB40Frame10( VehicleGroundModB40, event )
													return 
												else
													VehicleGroundModB40:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													VehicleGroundModB40:setAlpha( 0 )
													VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModB40Frame9( VehicleGroundModB40, event )
												return 
											else
												VehicleGroundModB40:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModB40Frame8( VehicleGroundModB40, event )
											return 
										else
											VehicleGroundModB40:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											VehicleGroundModB40:setAlpha( 0.5 )
											VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModB40Frame7( VehicleGroundModB40, event )
										return 
									else
										VehicleGroundModB40:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModB40Frame6( VehicleGroundModB40, event )
									return 
								else
									VehicleGroundModB40:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									VehicleGroundModB40:setAlpha( 0 )
									VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModB40Frame5( VehicleGroundModB40, event )
								return 
							else
								VehicleGroundModB40:beginAnimation( "keyframe", 190, false, true, CoD.TweenType.Linear )
								VehicleGroundModB40:setLeftRight( true, false, 52, 166 )
								VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModB40Frame4( VehicleGroundModB40, event )
							return 
						else
							VehicleGroundModB40:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							VehicleGroundModB40:setLeftRight( true, false, 52, 57 )
							VehicleGroundModB40:setAlpha( 1 )
							VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModB40Frame3( VehicleGroundModB40, event )
						return 
					else
						VehicleGroundModB40:beginAnimation( "keyframe", 2299, false, false, CoD.TweenType.Linear )
						VehicleGroundModB40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB40Frame3 )
					end
				end
				
				VehicleGroundModB40:completeAnimation()
				self.VehicleGroundModB40:setLeftRight( true, false, 52, 166 )
				self.VehicleGroundModB40:setTopBottom( true, false, 36, 76 )
				self.VehicleGroundModB40:setAlpha( 0 )
				VehicleGroundModB40Frame2( VehicleGroundModB40, {} )
				local VehicleGroundModB30Frame2 = function ( VehicleGroundModB30, event )
					local VehicleGroundModB30Frame3 = function ( VehicleGroundModB30, event )
						local VehicleGroundModB30Frame4 = function ( VehicleGroundModB30, event )
							local VehicleGroundModB30Frame5 = function ( VehicleGroundModB30, event )
								local VehicleGroundModB30Frame6 = function ( VehicleGroundModB30, event )
									local VehicleGroundModB30Frame7 = function ( VehicleGroundModB30, event )
										local VehicleGroundModB30Frame8 = function ( VehicleGroundModB30, event )
											local VehicleGroundModB30Frame9 = function ( VehicleGroundModB30, event )
												local VehicleGroundModB30Frame10 = function ( VehicleGroundModB30, event )
													local VehicleGroundModB30Frame11 = function ( VehicleGroundModB30, event )
														local VehicleGroundModB30Frame12 = function ( VehicleGroundModB30, event )
															local VehicleGroundModB30Frame13 = function ( VehicleGroundModB30, event )
																local VehicleGroundModB30Frame14 = function ( VehicleGroundModB30, event )
																	local VehicleGroundModB30Frame15 = function ( VehicleGroundModB30, event )
																		local VehicleGroundModB30Frame16 = function ( VehicleGroundModB30, event )
																			if not event.interrupted then
																				VehicleGroundModB30:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																			end
																			VehicleGroundModB30:setLeftRight( true, false, 196, 332 )
																			VehicleGroundModB30:setTopBottom( true, false, 36, 76 )
																			VehicleGroundModB30:setAlpha( 1 )
																			if event.interrupted then
																				self.clipFinished( VehicleGroundModB30, event )
																			else
																				VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModB30Frame16( VehicleGroundModB30, event )
																			return 
																		else
																			VehicleGroundModB30:beginAnimation( "keyframe", 3640, false, false, CoD.TweenType.Linear )
																			VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModB30Frame15( VehicleGroundModB30, event )
																		return 
																	else
																		VehicleGroundModB30:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		VehicleGroundModB30:setAlpha( 1 )
																		VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModB30Frame14( VehicleGroundModB30, event )
																	return 
																else
																	VehicleGroundModB30:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModB30Frame13( VehicleGroundModB30, event )
																return 
															else
																VehicleGroundModB30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																VehicleGroundModB30:setAlpha( 0 )
																VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModB30Frame12( VehicleGroundModB30, event )
															return 
														else
															VehicleGroundModB30:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModB30Frame11( VehicleGroundModB30, event )
														return 
													else
														VehicleGroundModB30:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														VehicleGroundModB30:setAlpha( 0.5 )
														VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModB30Frame10( VehicleGroundModB30, event )
													return 
												else
													VehicleGroundModB30:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModB30Frame9( VehicleGroundModB30, event )
												return 
											else
												VehicleGroundModB30:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												VehicleGroundModB30:setAlpha( 0 )
												VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModB30Frame8( VehicleGroundModB30, event )
											return 
										else
											VehicleGroundModB30:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
											VehicleGroundModB30:setLeftRight( true, false, 52, 188 )
											VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModB30Frame7( VehicleGroundModB30, event )
										return 
									else
										VehicleGroundModB30:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										VehicleGroundModB30:setLeftRight( true, false, 52, 59 )
										VehicleGroundModB30:setAlpha( 1 )
										VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModB30Frame6( VehicleGroundModB30, event )
									return 
								else
									VehicleGroundModB30:beginAnimation( "keyframe", 6229, false, false, CoD.TweenType.Linear )
									VehicleGroundModB30:setLeftRight( true, false, 52, 188 )
									VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModB30Frame5( VehicleGroundModB30, event )
								return 
							else
								VehicleGroundModB30:beginAnimation( "keyframe", 139, false, true, CoD.TweenType.Linear )
								VehicleGroundModB30:setLeftRight( true, false, 310, 446 )
								VehicleGroundModB30:setAlpha( 0 )
								VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModB30Frame4( VehicleGroundModB30, event )
							return 
						else
							VehicleGroundModB30:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							VehicleGroundModB30:setLeftRight( true, false, 258.96, 394.96 )
							VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModB30Frame3( VehicleGroundModB30, event )
						return 
					else
						VehicleGroundModB30:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						VehicleGroundModB30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB30Frame3 )
					end
				end
				
				VehicleGroundModB30:completeAnimation()
				self.VehicleGroundModB30:setLeftRight( true, false, 196, 332 )
				self.VehicleGroundModB30:setTopBottom( true, false, 36, 76 )
				self.VehicleGroundModB30:setAlpha( 1 )
				VehicleGroundModB30Frame2( VehicleGroundModB30, {} )
				local VehicleGroundModB20Frame2 = function ( VehicleGroundModB20, event )
					local VehicleGroundModB20Frame3 = function ( VehicleGroundModB20, event )
						local VehicleGroundModB20Frame4 = function ( VehicleGroundModB20, event )
							local VehicleGroundModB20Frame5 = function ( VehicleGroundModB20, event )
								local VehicleGroundModB20Frame6 = function ( VehicleGroundModB20, event )
									local VehicleGroundModB20Frame7 = function ( VehicleGroundModB20, event )
										local VehicleGroundModB20Frame8 = function ( VehicleGroundModB20, event )
											local VehicleGroundModB20Frame9 = function ( VehicleGroundModB20, event )
												local VehicleGroundModB20Frame10 = function ( VehicleGroundModB20, event )
													local VehicleGroundModB20Frame11 = function ( VehicleGroundModB20, event )
														local VehicleGroundModB20Frame12 = function ( VehicleGroundModB20, event )
															local VehicleGroundModB20Frame13 = function ( VehicleGroundModB20, event )
																local VehicleGroundModB20Frame14 = function ( VehicleGroundModB20, event )
																	local VehicleGroundModB20Frame15 = function ( VehicleGroundModB20, event )
																		local VehicleGroundModB20Frame16 = function ( VehicleGroundModB20, event )
																			local VehicleGroundModB20Frame17 = function ( VehicleGroundModB20, event )
																				if not event.interrupted then
																					VehicleGroundModB20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				end
																				VehicleGroundModB20:setLeftRight( true, false, 52, 196 )
																				VehicleGroundModB20:setTopBottom( true, false, 36, 76 )
																				VehicleGroundModB20:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( VehicleGroundModB20, event )
																				else
																					VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundModB20Frame17( VehicleGroundModB20, event )
																				return 
																			else
																				VehicleGroundModB20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																				VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModB20Frame16( VehicleGroundModB20, event )
																			return 
																		else
																			VehicleGroundModB20:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			VehicleGroundModB20:setAlpha( 0 )
																			VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModB20Frame15( VehicleGroundModB20, event )
																		return 
																	else
																		VehicleGroundModB20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModB20Frame14( VehicleGroundModB20, event )
																	return 
																else
																	VehicleGroundModB20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	VehicleGroundModB20:setAlpha( 0.5 )
																	VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModB20Frame13( VehicleGroundModB20, event )
																return 
															else
																VehicleGroundModB20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModB20Frame12( VehicleGroundModB20, event )
															return 
														else
															VehicleGroundModB20:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															VehicleGroundModB20:setAlpha( 0 )
															VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModB20Frame11( VehicleGroundModB20, event )
														return 
													else
														VehicleGroundModB20:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
														VehicleGroundModB20:setLeftRight( true, false, 52, 196 )
														VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModB20Frame10( VehicleGroundModB20, event )
													return 
												else
													VehicleGroundModB20:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													VehicleGroundModB20:setLeftRight( true, false, 52, 55 )
													VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModB20Frame9( VehicleGroundModB20, event )
												return 
											else
												VehicleGroundModB20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												VehicleGroundModB20:setLeftRight( true, false, 52, 149 )
												VehicleGroundModB20:setAlpha( 1 )
												VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModB20Frame8( VehicleGroundModB20, event )
											return 
										else
											VehicleGroundModB20:beginAnimation( "keyframe", 4329, false, false, CoD.TweenType.Linear )
											VehicleGroundModB20:setLeftRight( true, false, 52, 196 )
											VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModB20Frame7( VehicleGroundModB20, event )
										return 
									else
										VehicleGroundModB20:beginAnimation( "keyframe", 149, false, true, CoD.TweenType.Linear )
										VehicleGroundModB20:setLeftRight( true, false, 302, 446 )
										VehicleGroundModB20:setAlpha( 0 )
										VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModB20Frame6( VehicleGroundModB20, event )
									return 
								else
									VehicleGroundModB20:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									VehicleGroundModB20:setLeftRight( true, false, 231.66, 375.66 )
									VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModB20Frame5( VehicleGroundModB20, event )
								return 
							else
								VehicleGroundModB20:beginAnimation( "keyframe", 5939, false, false, CoD.TweenType.Linear )
								VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModB20Frame4( VehicleGroundModB20, event )
							return 
						else
							VehicleGroundModB20:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
							VehicleGroundModB20:setLeftRight( true, false, 166, 310 )
							VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModB20Frame3( VehicleGroundModB20, event )
						return 
					else
						VehicleGroundModB20:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						VehicleGroundModB20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModB20Frame3 )
					end
				end
				
				VehicleGroundModB20:completeAnimation()
				self.VehicleGroundModB20:setLeftRight( true, false, 52, 196 )
				self.VehicleGroundModB20:setTopBottom( true, false, 36, 76 )
				self.VehicleGroundModB20:setAlpha( 1 )
				VehicleGroundModB20Frame2( VehicleGroundModB20, {} )
				local VehicleGroundModT70Frame2 = function ( VehicleGroundModT70, event )
					local VehicleGroundModT70Frame3 = function ( VehicleGroundModT70, event )
						local VehicleGroundModT70Frame4 = function ( VehicleGroundModT70, event )
							local VehicleGroundModT70Frame5 = function ( VehicleGroundModT70, event )
								local VehicleGroundModT70Frame6 = function ( VehicleGroundModT70, event )
									local VehicleGroundModT70Frame7 = function ( VehicleGroundModT70, event )
										local VehicleGroundModT70Frame8 = function ( VehicleGroundModT70, event )
											local VehicleGroundModT70Frame9 = function ( VehicleGroundModT70, event )
												local VehicleGroundModT70Frame10 = function ( VehicleGroundModT70, event )
													local VehicleGroundModT70Frame11 = function ( VehicleGroundModT70, event )
														local VehicleGroundModT70Frame12 = function ( VehicleGroundModT70, event )
															local VehicleGroundModT70Frame13 = function ( VehicleGroundModT70, event )
																local VehicleGroundModT70Frame14 = function ( VehicleGroundModT70, event )
																	local VehicleGroundModT70Frame15 = function ( VehicleGroundModT70, event )
																		local VehicleGroundModT70Frame16 = function ( VehicleGroundModT70, event )
																			local VehicleGroundModT70Frame17 = function ( VehicleGroundModT70, event )
																				local VehicleGroundModT70Frame18 = function ( VehicleGroundModT70, event )
																					local VehicleGroundModT70Frame19 = function ( VehicleGroundModT70, event )
																						local VehicleGroundModT70Frame20 = function ( VehicleGroundModT70, event )
																							if not event.interrupted then
																								VehicleGroundModT70:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																							end
																							VehicleGroundModT70:setLeftRight( true, false, 412, 448 )
																							VehicleGroundModT70:setTopBottom( true, false, 0, 36 )
																							VehicleGroundModT70:setAlpha( 0 )
																							if event.interrupted then
																								self.clipFinished( VehicleGroundModT70, event )
																							else
																								VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							VehicleGroundModT70Frame20( VehicleGroundModT70, event )
																							return 
																						else
																							VehicleGroundModT70:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Linear )
																							VehicleGroundModT70:setLeftRight( true, false, 412, 448 )
																							VehicleGroundModT70:setAlpha( 0.57 )
																							VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						VehicleGroundModT70Frame19( VehicleGroundModT70, event )
																						return 
																					else
																						VehicleGroundModT70:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
																						VehicleGroundModT70:setLeftRight( true, false, 398.25, 434.25 )
																						VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					VehicleGroundModT70Frame18( VehicleGroundModT70, event )
																					return 
																				else
																					VehicleGroundModT70:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
																					VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundModT70Frame17( VehicleGroundModT70, event )
																				return 
																			else
																				VehicleGroundModT70:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																				VehicleGroundModT70:setLeftRight( true, false, 268, 304 )
																				VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModT70Frame16( VehicleGroundModT70, event )
																			return 
																		else
																			VehicleGroundModT70:beginAnimation( "keyframe", 1130, false, false, CoD.TweenType.Linear )
																			VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModT70Frame15( VehicleGroundModT70, event )
																		return 
																	else
																		VehicleGroundModT70:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		VehicleGroundModT70:setLeftRight( true, false, 156, 192 )
																		VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModT70Frame14( VehicleGroundModT70, event )
																	return 
																else
																	VehicleGroundModT70:beginAnimation( "keyframe", 1179, false, false, CoD.TweenType.Linear )
																	VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModT70Frame13( VehicleGroundModT70, event )
																return 
															else
																VehicleGroundModT70:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																VehicleGroundModT70:setAlpha( 1 )
																VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModT70Frame12( VehicleGroundModT70, event )
															return 
														else
															VehicleGroundModT70:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModT70Frame11( VehicleGroundModT70, event )
														return 
													else
														VehicleGroundModT70:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														VehicleGroundModT70:setAlpha( 0 )
														VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModT70Frame10( VehicleGroundModT70, event )
													return 
												else
													VehicleGroundModT70:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModT70Frame9( VehicleGroundModT70, event )
												return 
											else
												VehicleGroundModT70:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												VehicleGroundModT70:setAlpha( 0.5 )
												VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModT70Frame8( VehicleGroundModT70, event )
											return 
										else
											VehicleGroundModT70:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModT70Frame7( VehicleGroundModT70, event )
										return 
									else
										VehicleGroundModT70:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										VehicleGroundModT70:setAlpha( 0 )
										VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModT70Frame6( VehicleGroundModT70, event )
									return 
								else
									VehicleGroundModT70:beginAnimation( "keyframe", 190, false, true, CoD.TweenType.Linear )
									VehicleGroundModT70:setLeftRight( true, false, 52, 88 )
									VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModT70Frame5( VehicleGroundModT70, event )
								return 
							else
								VehicleGroundModT70:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								VehicleGroundModT70:setLeftRight( true, false, 52, 55 )
								VehicleGroundModT70:setAlpha( 1 )
								VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModT70Frame4( VehicleGroundModT70, event )
							return 
						else
							VehicleGroundModT70:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModT70Frame3( VehicleGroundModT70, event )
						return 
					else
						VehicleGroundModT70:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						VehicleGroundModT70:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT70Frame3 )
					end
				end
				
				VehicleGroundModT70:completeAnimation()
				self.VehicleGroundModT70:setLeftRight( true, false, 52, 88 )
				self.VehicleGroundModT70:setTopBottom( true, false, 0, 36 )
				self.VehicleGroundModT70:setAlpha( 0 )
				VehicleGroundModT70Frame2( VehicleGroundModT70, {} )
				local VehicleGroundModT60Frame2 = function ( VehicleGroundModT60, event )
					local VehicleGroundModT60Frame3 = function ( VehicleGroundModT60, event )
						local VehicleGroundModT60Frame4 = function ( VehicleGroundModT60, event )
							local VehicleGroundModT60Frame5 = function ( VehicleGroundModT60, event )
								local VehicleGroundModT60Frame6 = function ( VehicleGroundModT60, event )
									local VehicleGroundModT60Frame7 = function ( VehicleGroundModT60, event )
										local VehicleGroundModT60Frame8 = function ( VehicleGroundModT60, event )
											local VehicleGroundModT60Frame9 = function ( VehicleGroundModT60, event )
												local VehicleGroundModT60Frame10 = function ( VehicleGroundModT60, event )
													local VehicleGroundModT60Frame11 = function ( VehicleGroundModT60, event )
														local VehicleGroundModT60Frame12 = function ( VehicleGroundModT60, event )
															local VehicleGroundModT60Frame13 = function ( VehicleGroundModT60, event )
																local VehicleGroundModT60Frame14 = function ( VehicleGroundModT60, event )
																	local VehicleGroundModT60Frame15 = function ( VehicleGroundModT60, event )
																		local VehicleGroundModT60Frame16 = function ( VehicleGroundModT60, event )
																			local VehicleGroundModT60Frame17 = function ( VehicleGroundModT60, event )
																				local VehicleGroundModT60Frame18 = function ( VehicleGroundModT60, event )
																					local VehicleGroundModT60Frame19 = function ( VehicleGroundModT60, event )
																						if not event.interrupted then
																							VehicleGroundModT60:beginAnimation( "keyframe", 140, false, true, CoD.TweenType.Linear )
																						end
																						VehicleGroundModT60:setLeftRight( true, false, 356, 460 )
																						VehicleGroundModT60:setTopBottom( true, false, 0, 36 )
																						VehicleGroundModT60:setAlpha( 0 )
																						if event.interrupted then
																							self.clipFinished( VehicleGroundModT60, event )
																						else
																							VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						VehicleGroundModT60Frame19( VehicleGroundModT60, event )
																						return 
																					else
																						VehicleGroundModT60:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
																						VehicleGroundModT60:setLeftRight( true, false, 334.51, 438.51 )
																						VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					VehicleGroundModT60Frame18( VehicleGroundModT60, event )
																					return 
																				else
																					VehicleGroundModT60:beginAnimation( "keyframe", 1599, false, false, CoD.TweenType.Linear )
																					VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundModT60Frame17( VehicleGroundModT60, event )
																				return 
																			else
																				VehicleGroundModT60:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																				VehicleGroundModT60:setLeftRight( true, false, 308, 412 )
																				VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModT60Frame16( VehicleGroundModT60, event )
																			return 
																		else
																			VehicleGroundModT60:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
																			VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModT60Frame15( VehicleGroundModT60, event )
																		return 
																	else
																		VehicleGroundModT60:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																		VehicleGroundModT60:setLeftRight( true, false, 164, 268 )
																		VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModT60Frame14( VehicleGroundModT60, event )
																	return 
																else
																	VehicleGroundModT60:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Linear )
																	VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModT60Frame13( VehicleGroundModT60, event )
																return 
															else
																VehicleGroundModT60:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																VehicleGroundModT60:setAlpha( 1 )
																VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModT60Frame12( VehicleGroundModT60, event )
															return 
														else
															VehicleGroundModT60:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModT60Frame11( VehicleGroundModT60, event )
														return 
													else
														VehicleGroundModT60:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														VehicleGroundModT60:setAlpha( 0 )
														VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModT60Frame10( VehicleGroundModT60, event )
													return 
												else
													VehicleGroundModT60:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModT60Frame9( VehicleGroundModT60, event )
												return 
											else
												VehicleGroundModT60:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												VehicleGroundModT60:setAlpha( 0.5 )
												VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModT60Frame8( VehicleGroundModT60, event )
											return 
										else
											VehicleGroundModT60:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModT60Frame7( VehicleGroundModT60, event )
										return 
									else
										VehicleGroundModT60:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										VehicleGroundModT60:setAlpha( 0 )
										VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModT60Frame6( VehicleGroundModT60, event )
									return 
								else
									VehicleGroundModT60:beginAnimation( "keyframe", 190, false, true, CoD.TweenType.Linear )
									VehicleGroundModT60:setLeftRight( true, false, 52, 156 )
									VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModT60Frame5( VehicleGroundModT60, event )
								return 
							else
								VehicleGroundModT60:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								VehicleGroundModT60:setLeftRight( true, false, 52, 56 )
								VehicleGroundModT60:setAlpha( 1 )
								VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModT60Frame4( VehicleGroundModT60, event )
							return 
						else
							VehicleGroundModT60:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModT60Frame3( VehicleGroundModT60, event )
						return 
					else
						VehicleGroundModT60:beginAnimation( "keyframe", 2900, false, false, CoD.TweenType.Linear )
						VehicleGroundModT60:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT60Frame3 )
					end
				end
				
				VehicleGroundModT60:completeAnimation()
				self.VehicleGroundModT60:setLeftRight( true, false, 52, 156 )
				self.VehicleGroundModT60:setTopBottom( true, false, 0, 36 )
				self.VehicleGroundModT60:setAlpha( 0 )
				VehicleGroundModT60Frame2( VehicleGroundModT60, {} )
				local VehicleGroundModT50Frame2 = function ( VehicleGroundModT50, event )
					local VehicleGroundModT50Frame3 = function ( VehicleGroundModT50, event )
						local VehicleGroundModT50Frame4 = function ( VehicleGroundModT50, event )
							local VehicleGroundModT50Frame5 = function ( VehicleGroundModT50, event )
								local VehicleGroundModT50Frame6 = function ( VehicleGroundModT50, event )
									local VehicleGroundModT50Frame7 = function ( VehicleGroundModT50, event )
										local VehicleGroundModT50Frame8 = function ( VehicleGroundModT50, event )
											local VehicleGroundModT50Frame9 = function ( VehicleGroundModT50, event )
												local VehicleGroundModT50Frame10 = function ( VehicleGroundModT50, event )
													local VehicleGroundModT50Frame11 = function ( VehicleGroundModT50, event )
														local VehicleGroundModT50Frame12 = function ( VehicleGroundModT50, event )
															local VehicleGroundModT50Frame13 = function ( VehicleGroundModT50, event )
																local VehicleGroundModT50Frame14 = function ( VehicleGroundModT50, event )
																	local VehicleGroundModT50Frame15 = function ( VehicleGroundModT50, event )
																		local VehicleGroundModT50Frame16 = function ( VehicleGroundModT50, event )
																			local VehicleGroundModT50Frame17 = function ( VehicleGroundModT50, event )
																				local VehicleGroundModT50Frame18 = function ( VehicleGroundModT50, event )
																					local VehicleGroundModT50Frame19 = function ( VehicleGroundModT50, event )
																						if not event.interrupted then
																							VehicleGroundModT50:beginAnimation( "keyframe", 149, false, true, CoD.TweenType.Linear )
																						end
																						VehicleGroundModT50:setLeftRight( true, false, 292, 404 )
																						VehicleGroundModT50:setTopBottom( true, false, 0, 36 )
																						VehicleGroundModT50:setAlpha( 0 )
																						if event.interrupted then
																							self.clipFinished( VehicleGroundModT50, event )
																						else
																							VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																						end
																					end
																					
																					if event.interrupted then
																						VehicleGroundModT50Frame19( VehicleGroundModT50, event )
																						return 
																					else
																						VehicleGroundModT50:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
																						VehicleGroundModT50:setLeftRight( true, false, 268, 380 )
																						VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					VehicleGroundModT50Frame18( VehicleGroundModT50, event )
																					return 
																				else
																					VehicleGroundModT50:beginAnimation( "keyframe", 4899, false, false, CoD.TweenType.Linear )
																					VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundModT50Frame17( VehicleGroundModT50, event )
																				return 
																			else
																				VehicleGroundModT50:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																				VehicleGroundModT50:setLeftRight( true, false, 244, 356 )
																				VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModT50Frame16( VehicleGroundModT50, event )
																			return 
																		else
																			VehicleGroundModT50:beginAnimation( "keyframe", 1599, false, false, CoD.TweenType.Linear )
																			VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModT50Frame15( VehicleGroundModT50, event )
																		return 
																	else
																		VehicleGroundModT50:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																		VehicleGroundModT50:setLeftRight( true, false, 196, 308 )
																		VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModT50Frame14( VehicleGroundModT50, event )
																	return 
																else
																	VehicleGroundModT50:beginAnimation( "keyframe", 2110, false, false, CoD.TweenType.Linear )
																	VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModT50Frame13( VehicleGroundModT50, event )
																return 
															else
																VehicleGroundModT50:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																VehicleGroundModT50:setAlpha( 1 )
																VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModT50Frame12( VehicleGroundModT50, event )
															return 
														else
															VehicleGroundModT50:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModT50Frame11( VehicleGroundModT50, event )
														return 
													else
														VehicleGroundModT50:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														VehicleGroundModT50:setAlpha( 0 )
														VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModT50Frame10( VehicleGroundModT50, event )
													return 
												else
													VehicleGroundModT50:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModT50Frame9( VehicleGroundModT50, event )
												return 
											else
												VehicleGroundModT50:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												VehicleGroundModT50:setAlpha( 0.5 )
												VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModT50Frame8( VehicleGroundModT50, event )
											return 
										else
											VehicleGroundModT50:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModT50Frame7( VehicleGroundModT50, event )
										return 
									else
										VehicleGroundModT50:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										VehicleGroundModT50:setAlpha( 0 )
										VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModT50Frame6( VehicleGroundModT50, event )
									return 
								else
									VehicleGroundModT50:beginAnimation( "keyframe", 190, false, true, CoD.TweenType.Linear )
									VehicleGroundModT50:setLeftRight( true, false, 52, 164 )
									VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModT50Frame5( VehicleGroundModT50, event )
								return 
							else
								VehicleGroundModT50:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								VehicleGroundModT50:setLeftRight( true, false, 52, 55 )
								VehicleGroundModT50:setAlpha( 1 )
								VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModT50Frame4( VehicleGroundModT50, event )
							return 
						else
							VehicleGroundModT50:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModT50Frame3( VehicleGroundModT50, event )
						return 
					else
						VehicleGroundModT50:beginAnimation( "keyframe", 4300, false, false, CoD.TweenType.Linear )
						VehicleGroundModT50:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT50Frame3 )
					end
				end
				
				VehicleGroundModT50:completeAnimation()
				self.VehicleGroundModT50:setLeftRight( true, false, 52, 164 )
				self.VehicleGroundModT50:setTopBottom( true, false, 0, 36 )
				self.VehicleGroundModT50:setAlpha( 0 )
				VehicleGroundModT50Frame2( VehicleGroundModT50, {} )
				local VehicleGroundModT40Frame2 = function ( VehicleGroundModT40, event )
					local VehicleGroundModT40Frame3 = function ( VehicleGroundModT40, event )
						local VehicleGroundModT40Frame4 = function ( VehicleGroundModT40, event )
							local VehicleGroundModT40Frame5 = function ( VehicleGroundModT40, event )
								local VehicleGroundModT40Frame6 = function ( VehicleGroundModT40, event )
									local VehicleGroundModT40Frame7 = function ( VehicleGroundModT40, event )
										local VehicleGroundModT40Frame8 = function ( VehicleGroundModT40, event )
											local VehicleGroundModT40Frame9 = function ( VehicleGroundModT40, event )
												local VehicleGroundModT40Frame10 = function ( VehicleGroundModT40, event )
													local VehicleGroundModT40Frame11 = function ( VehicleGroundModT40, event )
														local VehicleGroundModT40Frame12 = function ( VehicleGroundModT40, event )
															local VehicleGroundModT40Frame13 = function ( VehicleGroundModT40, event )
																local VehicleGroundModT40Frame14 = function ( VehicleGroundModT40, event )
																	local VehicleGroundModT40Frame15 = function ( VehicleGroundModT40, event )
																		local VehicleGroundModT40Frame16 = function ( VehicleGroundModT40, event )
																			local VehicleGroundModT40Frame17 = function ( VehicleGroundModT40, event )
																				local VehicleGroundModT40Frame18 = function ( VehicleGroundModT40, event )
																					local VehicleGroundModT40Frame19 = function ( VehicleGroundModT40, event )
																						local VehicleGroundModT40Frame20 = function ( VehicleGroundModT40, event )
																							if not event.interrupted then
																								VehicleGroundModT40:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																							end
																							VehicleGroundModT40:setLeftRight( true, false, 196, 340 )
																							VehicleGroundModT40:setTopBottom( true, false, 0, 36 )
																							VehicleGroundModT40:setAlpha( 1 )
																							if event.interrupted then
																								self.clipFinished( VehicleGroundModT40, event )
																							else
																								VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							VehicleGroundModT40Frame20( VehicleGroundModT40, event )
																							return 
																						else
																							VehicleGroundModT40:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
																							VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						VehicleGroundModT40Frame19( VehicleGroundModT40, event )
																						return 
																					else
																						VehicleGroundModT40:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																						VehicleGroundModT40:setLeftRight( true, false, 148, 292 )
																						VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					VehicleGroundModT40Frame18( VehicleGroundModT40, event )
																					return 
																				else
																					VehicleGroundModT40:beginAnimation( "keyframe", 4899, false, false, CoD.TweenType.Linear )
																					VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundModT40Frame17( VehicleGroundModT40, event )
																				return 
																			else
																				VehicleGroundModT40:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																				VehicleGroundModT40:setLeftRight( true, false, 100, 244 )
																				VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModT40Frame16( VehicleGroundModT40, event )
																			return 
																		else
																			VehicleGroundModT40:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
																			VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModT40Frame15( VehicleGroundModT40, event )
																		return 
																	else
																		VehicleGroundModT40:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		VehicleGroundModT40:setAlpha( 1 )
																		VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModT40Frame14( VehicleGroundModT40, event )
																	return 
																else
																	VehicleGroundModT40:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModT40Frame13( VehicleGroundModT40, event )
																return 
															else
																VehicleGroundModT40:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																VehicleGroundModT40:setAlpha( 0 )
																VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModT40Frame12( VehicleGroundModT40, event )
															return 
														else
															VehicleGroundModT40:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModT40Frame11( VehicleGroundModT40, event )
														return 
													else
														VehicleGroundModT40:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														VehicleGroundModT40:setAlpha( 0.5 )
														VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModT40Frame10( VehicleGroundModT40, event )
													return 
												else
													VehicleGroundModT40:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModT40Frame9( VehicleGroundModT40, event )
												return 
											else
												VehicleGroundModT40:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												VehicleGroundModT40:setAlpha( 0 )
												VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModT40Frame8( VehicleGroundModT40, event )
											return 
										else
											VehicleGroundModT40:beginAnimation( "keyframe", 289, false, true, CoD.TweenType.Linear )
											VehicleGroundModT40:setLeftRight( true, false, 52, 196 )
											VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModT40Frame7( VehicleGroundModT40, event )
										return 
									else
										VehicleGroundModT40:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										VehicleGroundModT40:setLeftRight( true, false, 52, 55 )
										VehicleGroundModT40:setAlpha( 1 )
										VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModT40Frame6( VehicleGroundModT40, event )
									return 
								else
									VehicleGroundModT40:beginAnimation( "keyframe", 6100, false, false, CoD.TweenType.Linear )
									VehicleGroundModT40:setLeftRight( true, false, 52, 196 )
									VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModT40Frame5( VehicleGroundModT40, event )
								return 
							else
								VehicleGroundModT40:beginAnimation( "keyframe", 149, false, true, CoD.TweenType.Linear )
								VehicleGroundModT40:setLeftRight( true, false, 232, 376 )
								VehicleGroundModT40:setAlpha( 0 )
								VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModT40Frame4( VehicleGroundModT40, event )
							return 
						else
							VehicleGroundModT40:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							VehicleGroundModT40:setLeftRight( true, false, 214, 358 )
							VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModT40Frame3( VehicleGroundModT40, event )
						return 
					else
						VehicleGroundModT40:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						VehicleGroundModT40:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT40Frame3 )
					end
				end
				
				VehicleGroundModT40:completeAnimation()
				self.VehicleGroundModT40:setLeftRight( true, false, 196, 340 )
				self.VehicleGroundModT40:setTopBottom( true, false, 0, 36 )
				self.VehicleGroundModT40:setAlpha( 1 )
				VehicleGroundModT40Frame2( VehicleGroundModT40, {} )
				local VehicleGroundModT30Frame2 = function ( VehicleGroundModT30, event )
					local VehicleGroundModT30Frame3 = function ( VehicleGroundModT30, event )
						local VehicleGroundModT30Frame4 = function ( VehicleGroundModT30, event )
							local VehicleGroundModT30Frame5 = function ( VehicleGroundModT30, event )
								local VehicleGroundModT30Frame6 = function ( VehicleGroundModT30, event )
									local VehicleGroundModT30Frame7 = function ( VehicleGroundModT30, event )
										local VehicleGroundModT30Frame8 = function ( VehicleGroundModT30, event )
											local VehicleGroundModT30Frame9 = function ( VehicleGroundModT30, event )
												local VehicleGroundModT30Frame10 = function ( VehicleGroundModT30, event )
													local VehicleGroundModT30Frame11 = function ( VehicleGroundModT30, event )
														local VehicleGroundModT30Frame12 = function ( VehicleGroundModT30, event )
															local VehicleGroundModT30Frame13 = function ( VehicleGroundModT30, event )
																local VehicleGroundModT30Frame14 = function ( VehicleGroundModT30, event )
																	local VehicleGroundModT30Frame15 = function ( VehicleGroundModT30, event )
																		local VehicleGroundModT30Frame16 = function ( VehicleGroundModT30, event )
																			local VehicleGroundModT30Frame17 = function ( VehicleGroundModT30, event )
																				local VehicleGroundModT30Frame18 = function ( VehicleGroundModT30, event )
																					local VehicleGroundModT30Frame19 = function ( VehicleGroundModT30, event )
																						local VehicleGroundModT30Frame20 = function ( VehicleGroundModT30, event )
																							local VehicleGroundModT30Frame21 = function ( VehicleGroundModT30, event )
																								local VehicleGroundModT30Frame22 = function ( VehicleGroundModT30, event )
																									if not event.interrupted then
																										VehicleGroundModT30:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																									end
																									VehicleGroundModT30:setLeftRight( true, false, 148, 196 )
																									VehicleGroundModT30:setTopBottom( true, false, 0, 36 )
																									VehicleGroundModT30:setAlpha( 1 )
																									if event.interrupted then
																										self.clipFinished( VehicleGroundModT30, event )
																									else
																										VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																									end
																								end
																								
																								if event.interrupted then
																									VehicleGroundModT30Frame22( VehicleGroundModT30, event )
																									return 
																								else
																									VehicleGroundModT30:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
																									VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								VehicleGroundModT30Frame21( VehicleGroundModT30, event )
																								return 
																							else
																								VehicleGroundModT30:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																								VehicleGroundModT30:setLeftRight( true, false, 100, 148 )
																								VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							VehicleGroundModT30Frame20( VehicleGroundModT30, event )
																							return 
																						else
																							VehicleGroundModT30:beginAnimation( "keyframe", 4510, false, false, CoD.TweenType.Linear )
																							VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						VehicleGroundModT30Frame19( VehicleGroundModT30, event )
																						return 
																					else
																						VehicleGroundModT30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						VehicleGroundModT30:setAlpha( 1 )
																						VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					VehicleGroundModT30Frame18( VehicleGroundModT30, event )
																					return 
																				else
																					VehicleGroundModT30:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																					VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundModT30Frame17( VehicleGroundModT30, event )
																				return 
																			else
																				VehicleGroundModT30:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				VehicleGroundModT30:setAlpha( 0 )
																				VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModT30Frame16( VehicleGroundModT30, event )
																			return 
																		else
																			VehicleGroundModT30:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModT30Frame15( VehicleGroundModT30, event )
																		return 
																	else
																		VehicleGroundModT30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		VehicleGroundModT30:setAlpha( 0.5 )
																		VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModT30Frame14( VehicleGroundModT30, event )
																	return 
																else
																	VehicleGroundModT30:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																	VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModT30Frame13( VehicleGroundModT30, event )
																return 
															else
																VehicleGroundModT30:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																VehicleGroundModT30:setAlpha( 0 )
																VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModT30Frame12( VehicleGroundModT30, event )
															return 
														else
															VehicleGroundModT30:beginAnimation( "keyframe", 189, false, true, CoD.TweenType.Linear )
															VehicleGroundModT30:setLeftRight( true, false, 52, 100 )
															VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModT30Frame11( VehicleGroundModT30, event )
														return 
													else
														VehicleGroundModT30:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														VehicleGroundModT30:setLeftRight( true, false, 52, 55 )
														VehicleGroundModT30:setAlpha( 1 )
														VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModT30Frame10( VehicleGroundModT30, event )
													return 
												else
													VehicleGroundModT30:beginAnimation( "keyframe", 4700, false, false, CoD.TweenType.Linear )
													VehicleGroundModT30:setLeftRight( true, false, 52, 100 )
													VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModT30Frame9( VehicleGroundModT30, event )
												return 
											else
												VehicleGroundModT30:beginAnimation( "keyframe", 139, false, true, CoD.TweenType.Linear )
												VehicleGroundModT30:setLeftRight( true, false, 400, 448 )
												VehicleGroundModT30:setAlpha( 0 )
												VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModT30Frame8( VehicleGroundModT30, event )
											return 
										else
											VehicleGroundModT30:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
											VehicleGroundModT30:setLeftRight( true, false, 349.85, 397.85 )
											VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModT30Frame7( VehicleGroundModT30, event )
										return 
									else
										VehicleGroundModT30:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
										VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModT30Frame6( VehicleGroundModT30, event )
									return 
								else
									VehicleGroundModT30:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
									VehicleGroundModT30:setLeftRight( true, false, 288, 336 )
									VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModT30Frame5( VehicleGroundModT30, event )
								return 
							else
								VehicleGroundModT30:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
								VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModT30Frame4( VehicleGroundModT30, event )
							return 
						else
							VehicleGroundModT30:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
							VehicleGroundModT30:setLeftRight( true, false, 184, 232 )
							VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModT30Frame3( VehicleGroundModT30, event )
						return 
					else
						VehicleGroundModT30:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						VehicleGroundModT30:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT30Frame3 )
					end
				end
				
				VehicleGroundModT30:completeAnimation()
				self.VehicleGroundModT30:setLeftRight( true, false, 148, 196 )
				self.VehicleGroundModT30:setTopBottom( true, false, 0, 36 )
				self.VehicleGroundModT30:setAlpha( 1 )
				VehicleGroundModT30Frame2( VehicleGroundModT30, {} )
				local VehicleGroundModT20Frame2 = function ( VehicleGroundModT20, event )
					local VehicleGroundModT20Frame3 = function ( VehicleGroundModT20, event )
						local VehicleGroundModT20Frame4 = function ( VehicleGroundModT20, event )
							local VehicleGroundModT20Frame5 = function ( VehicleGroundModT20, event )
								local VehicleGroundModT20Frame6 = function ( VehicleGroundModT20, event )
									local VehicleGroundModT20Frame7 = function ( VehicleGroundModT20, event )
										local VehicleGroundModT20Frame8 = function ( VehicleGroundModT20, event )
											local VehicleGroundModT20Frame9 = function ( VehicleGroundModT20, event )
												local VehicleGroundModT20Frame10 = function ( VehicleGroundModT20, event )
													local VehicleGroundModT20Frame11 = function ( VehicleGroundModT20, event )
														local VehicleGroundModT20Frame12 = function ( VehicleGroundModT20, event )
															local VehicleGroundModT20Frame13 = function ( VehicleGroundModT20, event )
																local VehicleGroundModT20Frame14 = function ( VehicleGroundModT20, event )
																	local VehicleGroundModT20Frame15 = function ( VehicleGroundModT20, event )
																		local VehicleGroundModT20Frame16 = function ( VehicleGroundModT20, event )
																			local VehicleGroundModT20Frame17 = function ( VehicleGroundModT20, event )
																				local VehicleGroundModT20Frame18 = function ( VehicleGroundModT20, event )
																					local VehicleGroundModT20Frame19 = function ( VehicleGroundModT20, event )
																						local VehicleGroundModT20Frame20 = function ( VehicleGroundModT20, event )
																							local VehicleGroundModT20Frame21 = function ( VehicleGroundModT20, event )
																								if not event.interrupted then
																									VehicleGroundModT20:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
																								end
																								VehicleGroundModT20:setLeftRight( true, false, 100, 148 )
																								VehicleGroundModT20:setTopBottom( true, false, 0, 36 )
																								VehicleGroundModT20:setAlpha( 1 )
																								if event.interrupted then
																									self.clipFinished( VehicleGroundModT20, event )
																								else
																									VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																								end
																							end
																							
																							if event.interrupted then
																								VehicleGroundModT20Frame21( VehicleGroundModT20, event )
																								return 
																							else
																								VehicleGroundModT20:beginAnimation( "keyframe", 3109, false, false, CoD.TweenType.Linear )
																								VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							VehicleGroundModT20Frame20( VehicleGroundModT20, event )
																							return 
																						else
																							VehicleGroundModT20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																							VehicleGroundModT20:setAlpha( 1 )
																							VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						VehicleGroundModT20Frame19( VehicleGroundModT20, event )
																						return 
																					else
																						VehicleGroundModT20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																						VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					VehicleGroundModT20Frame18( VehicleGroundModT20, event )
																					return 
																				else
																					VehicleGroundModT20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					VehicleGroundModT20:setAlpha( 0 )
																					VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundModT20Frame17( VehicleGroundModT20, event )
																				return 
																			else
																				VehicleGroundModT20:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																				VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModT20Frame16( VehicleGroundModT20, event )
																			return 
																		else
																			VehicleGroundModT20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			VehicleGroundModT20:setAlpha( 0.5 )
																			VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModT20Frame15( VehicleGroundModT20, event )
																		return 
																	else
																		VehicleGroundModT20:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModT20Frame14( VehicleGroundModT20, event )
																	return 
																else
																	VehicleGroundModT20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	VehicleGroundModT20:setAlpha( 0 )
																	VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModT20Frame13( VehicleGroundModT20, event )
																return 
															else
																VehicleGroundModT20:beginAnimation( "keyframe", 189, false, true, CoD.TweenType.Linear )
																VehicleGroundModT20:setLeftRight( true, false, 52, 100 )
																VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModT20Frame12( VehicleGroundModT20, event )
															return 
														else
															VehicleGroundModT20:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															VehicleGroundModT20:setLeftRight( true, false, 52, 54 )
															VehicleGroundModT20:setAlpha( 1 )
															VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModT20Frame11( VehicleGroundModT20, event )
														return 
													else
														VehicleGroundModT20:beginAnimation( "keyframe", 9809, false, false, CoD.TweenType.Linear )
														VehicleGroundModT20:setLeftRight( true, false, 52, 100 )
														VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModT20Frame10( VehicleGroundModT20, event )
													return 
												else
													VehicleGroundModT20:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
													VehicleGroundModT20:setLeftRight( true, false, 349.27, 397.27 )
													VehicleGroundModT20:setAlpha( 0 )
													VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModT20Frame9( VehicleGroundModT20, event )
												return 
											else
												VehicleGroundModT20:beginAnimation( "keyframe", 59, false, true, CoD.TweenType.Linear )
												VehicleGroundModT20:setLeftRight( true, false, 352, 400 )
												VehicleGroundModT20:setAlpha( 0.6 )
												VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModT20Frame8( VehicleGroundModT20, event )
											return 
										else
											VehicleGroundModT20:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
											VehicleGroundModT20:setLeftRight( true, false, 341.31, 389.31 )
											VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModT20Frame7( VehicleGroundModT20, event )
										return 
									else
										VehicleGroundModT20:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
										VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModT20Frame6( VehicleGroundModT20, event )
									return 
								else
									VehicleGroundModT20:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
									VehicleGroundModT20:setLeftRight( true, false, 240, 288 )
									VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModT20Frame5( VehicleGroundModT20, event )
								return 
							else
								VehicleGroundModT20:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
								VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModT20Frame4( VehicleGroundModT20, event )
							return 
						else
							VehicleGroundModT20:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
							VehicleGroundModT20:setLeftRight( true, false, 136, 184 )
							VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModT20Frame3( VehicleGroundModT20, event )
						return 
					else
						VehicleGroundModT20:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						VehicleGroundModT20:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT20Frame3 )
					end
				end
				
				VehicleGroundModT20:completeAnimation()
				self.VehicleGroundModT20:setLeftRight( true, false, 100, 148 )
				self.VehicleGroundModT20:setTopBottom( true, false, 0, 36 )
				self.VehicleGroundModT20:setAlpha( 1 )
				VehicleGroundModT20Frame2( VehicleGroundModT20, {} )
				local VehicleGroundModT10Frame2 = function ( VehicleGroundModT10, event )
					local VehicleGroundModT10Frame3 = function ( VehicleGroundModT10, event )
						local VehicleGroundModT10Frame4 = function ( VehicleGroundModT10, event )
							local VehicleGroundModT10Frame5 = function ( VehicleGroundModT10, event )
								local VehicleGroundModT10Frame6 = function ( VehicleGroundModT10, event )
									local VehicleGroundModT10Frame7 = function ( VehicleGroundModT10, event )
										local VehicleGroundModT10Frame8 = function ( VehicleGroundModT10, event )
											local VehicleGroundModT10Frame9 = function ( VehicleGroundModT10, event )
												local VehicleGroundModT10Frame10 = function ( VehicleGroundModT10, event )
													local VehicleGroundModT10Frame11 = function ( VehicleGroundModT10, event )
														local VehicleGroundModT10Frame12 = function ( VehicleGroundModT10, event )
															local VehicleGroundModT10Frame13 = function ( VehicleGroundModT10, event )
																local VehicleGroundModT10Frame14 = function ( VehicleGroundModT10, event )
																	local VehicleGroundModT10Frame15 = function ( VehicleGroundModT10, event )
																		local VehicleGroundModT10Frame16 = function ( VehicleGroundModT10, event )
																			local VehicleGroundModT10Frame17 = function ( VehicleGroundModT10, event )
																				local VehicleGroundModT10Frame18 = function ( VehicleGroundModT10, event )
																					local VehicleGroundModT10Frame19 = function ( VehicleGroundModT10, event )
																						local VehicleGroundModT10Frame20 = function ( VehicleGroundModT10, event )
																							local VehicleGroundModT10Frame21 = function ( VehicleGroundModT10, event )
																								if not event.interrupted then
																									VehicleGroundModT10:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
																								end
																								VehicleGroundModT10:setLeftRight( true, false, 52, 100 )
																								VehicleGroundModT10:setTopBottom( true, false, 0, 36 )
																								VehicleGroundModT10:setAlpha( 1 )
																								if event.interrupted then
																									self.clipFinished( VehicleGroundModT10, event )
																								else
																									VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																								end
																							end
																							
																							if event.interrupted then
																								VehicleGroundModT10Frame21( VehicleGroundModT10, event )
																								return 
																							else
																								VehicleGroundModT10:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																								VehicleGroundModT10:setAlpha( 1 )
																								VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							VehicleGroundModT10Frame20( VehicleGroundModT10, event )
																							return 
																						else
																							VehicleGroundModT10:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																							VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						VehicleGroundModT10Frame19( VehicleGroundModT10, event )
																						return 
																					else
																						VehicleGroundModT10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						VehicleGroundModT10:setAlpha( 0 )
																						VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					VehicleGroundModT10Frame18( VehicleGroundModT10, event )
																					return 
																				else
																					VehicleGroundModT10:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																					VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundModT10Frame17( VehicleGroundModT10, event )
																				return 
																			else
																				VehicleGroundModT10:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																				VehicleGroundModT10:setAlpha( 0.5 )
																				VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundModT10Frame16( VehicleGroundModT10, event )
																			return 
																		else
																			VehicleGroundModT10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundModT10Frame15( VehicleGroundModT10, event )
																		return 
																	else
																		VehicleGroundModT10:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		VehicleGroundModT10:setAlpha( 0 )
																		VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundModT10Frame14( VehicleGroundModT10, event )
																	return 
																else
																	VehicleGroundModT10:beginAnimation( "keyframe", 190, false, true, CoD.TweenType.Linear )
																	VehicleGroundModT10:setLeftRight( true, false, 52, 100 )
																	VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundModT10Frame13( VehicleGroundModT10, event )
																return 
															else
																VehicleGroundModT10:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																VehicleGroundModT10:setLeftRight( true, false, 52, 54 )
																VehicleGroundModT10:setAlpha( 1 )
																VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundModT10Frame12( VehicleGroundModT10, event )
															return 
														else
															VehicleGroundModT10:beginAnimation( "keyframe", 10899, false, false, CoD.TweenType.Linear )
															VehicleGroundModT10:setLeftRight( true, false, 52, 100 )
															VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundModT10Frame11( VehicleGroundModT10, event )
														return 
													else
														VehicleGroundModT10:beginAnimation( "keyframe", 139, false, true, CoD.TweenType.Linear )
														VehicleGroundModT10:setLeftRight( true, false, 448, 496 )
														VehicleGroundModT10:setAlpha( 0 )
														VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundModT10Frame10( VehicleGroundModT10, event )
													return 
												else
													VehicleGroundModT10:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
													VehicleGroundModT10:setLeftRight( true, false, 383.53, 431.53 )
													VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundModT10Frame9( VehicleGroundModT10, event )
												return 
											else
												VehicleGroundModT10:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
												VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundModT10Frame8( VehicleGroundModT10, event )
											return 
										else
											VehicleGroundModT10:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
											VehicleGroundModT10:setLeftRight( true, false, 304, 352 )
											VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundModT10Frame7( VehicleGroundModT10, event )
										return 
									else
										VehicleGroundModT10:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
										VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundModT10Frame6( VehicleGroundModT10, event )
									return 
								else
									VehicleGroundModT10:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
									VehicleGroundModT10:setLeftRight( true, false, 192, 240 )
									VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundModT10Frame5( VehicleGroundModT10, event )
								return 
							else
								VehicleGroundModT10:beginAnimation( "keyframe", 1600, false, false, CoD.TweenType.Linear )
								VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundModT10Frame4( VehicleGroundModT10, event )
							return 
						else
							VehicleGroundModT10:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
							VehicleGroundModT10:setLeftRight( true, false, 88, 136 )
							VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundModT10Frame3( VehicleGroundModT10, event )
						return 
					else
						VehicleGroundModT10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						VehicleGroundModT10:registerEventHandler( "transition_complete_keyframe", VehicleGroundModT10Frame3 )
					end
				end
				
				VehicleGroundModT10:completeAnimation()
				self.VehicleGroundModT10:setLeftRight( true, false, 52, 100 )
				self.VehicleGroundModT10:setTopBottom( true, false, 0, 36 )
				self.VehicleGroundModT10:setAlpha( 1 )
				VehicleGroundModT10Frame2( VehicleGroundModT10, {} )

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
		element.VehicleGroundModB40:close()
		element.VehicleGroundModB30:close()
		element.VehicleGroundModB20:close()
		element.VehicleGroundModT70:close()
		element.VehicleGroundModT60:close()
		element.VehicleGroundModT50:close()
		element.VehicleGroundModT40:close()
		element.VehicleGroundModT30:close()
		element.VehicleGroundModT20:close()
		element.VehicleGroundModT10:close()
		element.VehicleGroundModDNI0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

