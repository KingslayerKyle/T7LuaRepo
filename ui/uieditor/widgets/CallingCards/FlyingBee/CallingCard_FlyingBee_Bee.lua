-- c01c5d3722aa25a758687fbd0e2df25c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Wing_Back_Anim" )
require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Legs_Right" )
require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Legs_Left" )
require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Wing_Front_Anim" )

CoD.CallingCard_FlyingBee_Bee = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Bee.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Bee )
	self.id = "CallingCard_FlyingBee_Bee"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 148 )
	self:setTopBottom( true, false, 0, 148 )
	self.anyChildUsesUpdateState = true
	
	local BackWing = CoD.CallingCard_FlyingBee_Wing_Back_Anim.new( menu, controller )
	BackWing:setLeftRight( true, false, 47, 79 )
	BackWing:setTopBottom( true, false, 42.33, 74.33 )
	self:addElement( BackWing )
	self.BackWing = BackWing
	
	local RightLegs = CoD.CallingCard_FlyingBee_Legs_Right.new( menu, controller )
	RightLegs:setLeftRight( true, false, 63, 95 )
	RightLegs:setTopBottom( true, false, 74, 106 )
	self:addElement( RightLegs )
	self.RightLegs = RightLegs
	
	local Gun = LUI.UIImage.new()
	Gun:setLeftRight( true, false, -19.34, 87.34 )
	Gun:setTopBottom( true, false, 47.67, 154.34 )
	Gun:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_gun" ) )
	self:addElement( Gun )
	self.Gun = Gun
	
	local Flash = LUI.UIImage.new()
	Flash:setLeftRight( true, false, -160, 53.34 )
	Flash:setTopBottom( true, false, 60, 113.33 )
	Flash:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_muzzle_flash" ) )
	self:addElement( Flash )
	self.Flash = Flash
	
	local Body = LUI.UIImage.new()
	Body:setLeftRight( true, false, 41, 147.67 )
	Body:setTopBottom( true, false, 41.33, 148 )
	Body:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_body" ) )
	self:addElement( Body )
	self.Body = Body
	
	local ArmLower = LUI.UIImage.new()
	ArmLower:setLeftRight( true, false, 19, 72.33 )
	ArmLower:setTopBottom( true, false, 75.34, 102 )
	ArmLower:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_arm_lower" ) )
	self:addElement( ArmLower )
	self.ArmLower = ArmLower
	
	local ArmUpper = LUI.UIImage.new()
	ArmUpper:setLeftRight( true, false, 48.67, 75.34 )
	ArmUpper:setTopBottom( true, false, 62.67, 89.34 )
	ArmUpper:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_arm_upper" ) )
	self:addElement( ArmUpper )
	self.ArmUpper = ArmUpper
	
	local LeftLegs = CoD.CallingCard_FlyingBee_Legs_Left.new( menu, controller )
	LeftLegs:setLeftRight( true, false, 73, 105 )
	LeftLegs:setTopBottom( true, false, 74, 106 )
	self:addElement( LeftLegs )
	self.LeftLegs = LeftLegs
	
	local FrontWing = CoD.CallingCard_FlyingBee_Wing_Front_Anim.new( menu, controller )
	FrontWing:setLeftRight( true, false, 61, 93 )
	FrontWing:setTopBottom( true, false, 44, 76 )
	self:addElement( FrontWing )
	self.FrontWing = FrontWing
	
	local Head = LUI.UIImage.new()
	Head:setLeftRight( true, false, 0, 106.67 )
	Head:setTopBottom( true, false, 0, 106.67 )
	Head:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_head" ) )
	self:addElement( Head )
	self.Head = Head
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local GunFrame2 = function ( Gun, event )
					local GunFrame3 = function ( Gun, event )
						local GunFrame4 = function ( Gun, event )
							local GunFrame5 = function ( Gun, event )
								local GunFrame6 = function ( Gun, event )
									local GunFrame7 = function ( Gun, event )
										local GunFrame8 = function ( Gun, event )
											local GunFrame9 = function ( Gun, event )
												local GunFrame10 = function ( Gun, event )
													local GunFrame11 = function ( Gun, event )
														local GunFrame12 = function ( Gun, event )
															local GunFrame13 = function ( Gun, event )
																local GunFrame14 = function ( Gun, event )
																	local GunFrame15 = function ( Gun, event )
																		local GunFrame16 = function ( Gun, event )
																			local GunFrame17 = function ( Gun, event )
																				local GunFrame18 = function ( Gun, event )
																					local GunFrame19 = function ( Gun, event )
																						local GunFrame20 = function ( Gun, event )
																							local GunFrame21 = function ( Gun, event )
																								local GunFrame22 = function ( Gun, event )
																									local GunFrame23 = function ( Gun, event )
																										local GunFrame24 = function ( Gun, event )
																											local GunFrame25 = function ( Gun, event )
																												local GunFrame26 = function ( Gun, event )
																													local GunFrame27 = function ( Gun, event )
																														local GunFrame28 = function ( Gun, event )
																															local GunFrame29 = function ( Gun, event )
																																local GunFrame30 = function ( Gun, event )
																																	local GunFrame31 = function ( Gun, event )
																																		local GunFrame32 = function ( Gun, event )
																																			local GunFrame33 = function ( Gun, event )
																																				local GunFrame34 = function ( Gun, event )
																																					local GunFrame35 = function ( Gun, event )
																																						local GunFrame36 = function ( Gun, event )
																																							local GunFrame37 = function ( Gun, event )
																																								local GunFrame38 = function ( Gun, event )
																																									local GunFrame39 = function ( Gun, event )
																																										local GunFrame40 = function ( Gun, event )
																																											local GunFrame41 = function ( Gun, event )
																																												local GunFrame42 = function ( Gun, event )
																																													local GunFrame43 = function ( Gun, event )
																																														local GunFrame44 = function ( Gun, event )
																																															local GunFrame45 = function ( Gun, event )
																																																local GunFrame46 = function ( Gun, event )
																																																	local GunFrame47 = function ( Gun, event )
																																																		local GunFrame48 = function ( Gun, event )
																																																			local GunFrame49 = function ( Gun, event )
																																																				local GunFrame50 = function ( Gun, event )
																																																					local GunFrame51 = function ( Gun, event )
																																																						local GunFrame52 = function ( Gun, event )
																																																							local GunFrame53 = function ( Gun, event )
																																																								local GunFrame54 = function ( Gun, event )
																																																									local GunFrame55 = function ( Gun, event )
																																																										local GunFrame56 = function ( Gun, event )
																																																											if not event.interrupted then
																																																												Gun:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
																																																											end
																																																											Gun:setLeftRight( true, false, -19.34, 87.34 )
																																																											Gun:setTopBottom( true, false, 47.67, 154.34 )
																																																											if event.interrupted then
																																																												self.clipFinished( Gun, event )
																																																											else
																																																												Gun:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																											end
																																																										end
																																																										
																																																										if event.interrupted then
																																																											GunFrame56( Gun, event )
																																																											return 
																																																										else
																																																											Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																											Gun:setLeftRight( true, false, -19.34, 87.34 )
																																																											Gun:registerEventHandler( "transition_complete_keyframe", GunFrame56 )
																																																										end
																																																									end
																																																									
																																																									if event.interrupted then
																																																										GunFrame55( Gun, event )
																																																										return 
																																																									else
																																																										Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																										Gun:setLeftRight( true, false, -17.84, 88.84 )
																																																										Gun:registerEventHandler( "transition_complete_keyframe", GunFrame55 )
																																																									end
																																																								end
																																																								
																																																								if event.interrupted then
																																																									GunFrame54( Gun, event )
																																																									return 
																																																								else
																																																									Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																									Gun:setLeftRight( true, false, -19.34, 87.34 )
																																																									Gun:registerEventHandler( "transition_complete_keyframe", GunFrame54 )
																																																								end
																																																							end
																																																							
																																																							if event.interrupted then
																																																								GunFrame53( Gun, event )
																																																								return 
																																																							else
																																																								Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																								Gun:setLeftRight( true, false, -17.84, 88.84 )
																																																								Gun:registerEventHandler( "transition_complete_keyframe", GunFrame53 )
																																																							end
																																																						end
																																																						
																																																						if event.interrupted then
																																																							GunFrame52( Gun, event )
																																																							return 
																																																						else
																																																							Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																																							Gun:setLeftRight( true, false, -19.34, 87.34 )
																																																							Gun:registerEventHandler( "transition_complete_keyframe", GunFrame52 )
																																																						end
																																																					end
																																																					
																																																					if event.interrupted then
																																																						GunFrame51( Gun, event )
																																																						return 
																																																					else
																																																						Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																						Gun:setLeftRight( true, false, -17.84, 88.84 )
																																																						Gun:registerEventHandler( "transition_complete_keyframe", GunFrame51 )
																																																					end
																																																				end
																																																				
																																																				if event.interrupted then
																																																					GunFrame50( Gun, event )
																																																					return 
																																																				else
																																																					Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																					Gun:setLeftRight( true, false, -19.34, 87.34 )
																																																					Gun:registerEventHandler( "transition_complete_keyframe", GunFrame50 )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				GunFrame49( Gun, event )
																																																				return 
																																																			else
																																																				Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																				Gun:setLeftRight( true, false, -17.84, 88.84 )
																																																				Gun:registerEventHandler( "transition_complete_keyframe", GunFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			GunFrame48( Gun, event )
																																																			return 
																																																		else
																																																			Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																			Gun:setLeftRight( true, false, -19.34, 87.34 )
																																																			Gun:registerEventHandler( "transition_complete_keyframe", GunFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		GunFrame47( Gun, event )
																																																		return 
																																																	else
																																																		Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																																		Gun:setLeftRight( true, false, -17.84, 88.84 )
																																																		Gun:registerEventHandler( "transition_complete_keyframe", GunFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	GunFrame46( Gun, event )
																																																	return 
																																																else
																																																	Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																	Gun:setLeftRight( true, false, -19.34, 87.34 )
																																																	Gun:registerEventHandler( "transition_complete_keyframe", GunFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																GunFrame45( Gun, event )
																																																return 
																																															else
																																																Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																Gun:setLeftRight( true, false, -17.84, 88.84 )
																																																Gun:registerEventHandler( "transition_complete_keyframe", GunFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															GunFrame44( Gun, event )
																																															return 
																																														else
																																															Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																															Gun:setLeftRight( true, false, -19.34, 87.34 )
																																															Gun:registerEventHandler( "transition_complete_keyframe", GunFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														GunFrame43( Gun, event )
																																														return 
																																													else
																																														Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																														Gun:setLeftRight( true, false, -17.84, 88.84 )
																																														Gun:registerEventHandler( "transition_complete_keyframe", GunFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													GunFrame42( Gun, event )
																																													return 
																																												else
																																													Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																													Gun:setLeftRight( true, false, -19.34, 87.34 )
																																													Gun:registerEventHandler( "transition_complete_keyframe", GunFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												GunFrame41( Gun, event )
																																												return 
																																											else
																																												Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																												Gun:setLeftRight( true, false, -17.84, 88.84 )
																																												Gun:registerEventHandler( "transition_complete_keyframe", GunFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											GunFrame40( Gun, event )
																																											return 
																																										else
																																											Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																											Gun:setLeftRight( true, false, -19.34, 87.34 )
																																											Gun:registerEventHandler( "transition_complete_keyframe", GunFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										GunFrame39( Gun, event )
																																										return 
																																									else
																																										Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																										Gun:setLeftRight( true, false, -17.84, 88.84 )
																																										Gun:registerEventHandler( "transition_complete_keyframe", GunFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									GunFrame38( Gun, event )
																																									return 
																																								else
																																									Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																									Gun:setLeftRight( true, false, -19.34, 87.34 )
																																									Gun:registerEventHandler( "transition_complete_keyframe", GunFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								GunFrame37( Gun, event )
																																								return 
																																							else
																																								Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																								Gun:setLeftRight( true, false, -17.84, 88.84 )
																																								Gun:registerEventHandler( "transition_complete_keyframe", GunFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							GunFrame36( Gun, event )
																																							return 
																																						else
																																							Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																							Gun:setLeftRight( true, false, -19.34, 87.34 )
																																							Gun:registerEventHandler( "transition_complete_keyframe", GunFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						GunFrame35( Gun, event )
																																						return 
																																					else
																																						Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																						Gun:setLeftRight( true, false, -17.84, 88.84 )
																																						Gun:registerEventHandler( "transition_complete_keyframe", GunFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					GunFrame34( Gun, event )
																																					return 
																																				else
																																					Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																					Gun:setLeftRight( true, false, -19.34, 87.34 )
																																					Gun:registerEventHandler( "transition_complete_keyframe", GunFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				GunFrame33( Gun, event )
																																				return 
																																			else
																																				Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																				Gun:setLeftRight( true, false, -17.84, 88.84 )
																																				Gun:registerEventHandler( "transition_complete_keyframe", GunFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			GunFrame32( Gun, event )
																																			return 
																																		else
																																			Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																			Gun:setLeftRight( true, false, -19.34, 87.34 )
																																			Gun:registerEventHandler( "transition_complete_keyframe", GunFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		GunFrame31( Gun, event )
																																		return 
																																	else
																																		Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																		Gun:setLeftRight( true, false, -17.84, 88.84 )
																																		Gun:registerEventHandler( "transition_complete_keyframe", GunFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	GunFrame30( Gun, event )
																																	return 
																																else
																																	Gun:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
																																	Gun:registerEventHandler( "transition_complete_keyframe", GunFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																GunFrame29( Gun, event )
																																return 
																															else
																																Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																Gun:setLeftRight( true, false, -19.34, 87.34 )
																																Gun:registerEventHandler( "transition_complete_keyframe", GunFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															GunFrame28( Gun, event )
																															return 
																														else
																															Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																															Gun:setLeftRight( true, false, -17.84, 88.84 )
																															Gun:registerEventHandler( "transition_complete_keyframe", GunFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														GunFrame27( Gun, event )
																														return 
																													else
																														Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														Gun:setLeftRight( true, false, -19.34, 87.34 )
																														Gun:registerEventHandler( "transition_complete_keyframe", GunFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													GunFrame26( Gun, event )
																													return 
																												else
																													Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																													Gun:setLeftRight( true, false, -17.84, 88.84 )
																													Gun:registerEventHandler( "transition_complete_keyframe", GunFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												GunFrame25( Gun, event )
																												return 
																											else
																												Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																												Gun:setLeftRight( true, false, -19.34, 87.34 )
																												Gun:registerEventHandler( "transition_complete_keyframe", GunFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											GunFrame24( Gun, event )
																											return 
																										else
																											Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																											Gun:setLeftRight( true, false, -17.84, 88.84 )
																											Gun:registerEventHandler( "transition_complete_keyframe", GunFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										GunFrame23( Gun, event )
																										return 
																									else
																										Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																										Gun:setLeftRight( true, false, -19.34, 87.34 )
																										Gun:registerEventHandler( "transition_complete_keyframe", GunFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									GunFrame22( Gun, event )
																									return 
																								else
																									Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									Gun:setLeftRight( true, false, -17.84, 88.84 )
																									Gun:registerEventHandler( "transition_complete_keyframe", GunFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								GunFrame21( Gun, event )
																								return 
																							else
																								Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								Gun:setLeftRight( true, false, -19.34, 87.34 )
																								Gun:registerEventHandler( "transition_complete_keyframe", GunFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							GunFrame20( Gun, event )
																							return 
																						else
																							Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																							Gun:setLeftRight( true, false, -17.84, 88.84 )
																							Gun:registerEventHandler( "transition_complete_keyframe", GunFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						GunFrame19( Gun, event )
																						return 
																					else
																						Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																						Gun:setLeftRight( true, false, -19.34, 87.34 )
																						Gun:registerEventHandler( "transition_complete_keyframe", GunFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					GunFrame18( Gun, event )
																					return 
																				else
																					Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																					Gun:setLeftRight( true, false, -17.84, 88.84 )
																					Gun:registerEventHandler( "transition_complete_keyframe", GunFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				GunFrame17( Gun, event )
																				return 
																			else
																				Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																				Gun:setLeftRight( true, false, -19.34, 87.34 )
																				Gun:registerEventHandler( "transition_complete_keyframe", GunFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			GunFrame16( Gun, event )
																			return 
																		else
																			Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			Gun:setLeftRight( true, false, -17.84, 88.84 )
																			Gun:registerEventHandler( "transition_complete_keyframe", GunFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		GunFrame15( Gun, event )
																		return 
																	else
																		Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		Gun:setLeftRight( true, false, -19.34, 87.34 )
																		Gun:registerEventHandler( "transition_complete_keyframe", GunFrame15 )
																	end
																end
																
																if event.interrupted then
																	GunFrame14( Gun, event )
																	return 
																else
																	Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																	Gun:setLeftRight( true, false, -17.84, 88.84 )
																	Gun:registerEventHandler( "transition_complete_keyframe", GunFrame14 )
																end
															end
															
															if event.interrupted then
																GunFrame13( Gun, event )
																return 
															else
																Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																Gun:setLeftRight( true, false, -19.34, 87.34 )
																Gun:registerEventHandler( "transition_complete_keyframe", GunFrame13 )
															end
														end
														
														if event.interrupted then
															GunFrame12( Gun, event )
															return 
														else
															Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															Gun:setLeftRight( true, false, -17.84, 88.84 )
															Gun:registerEventHandler( "transition_complete_keyframe", GunFrame12 )
														end
													end
													
													if event.interrupted then
														GunFrame11( Gun, event )
														return 
													else
														Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														Gun:setLeftRight( true, false, -19.34, 87.34 )
														Gun:registerEventHandler( "transition_complete_keyframe", GunFrame11 )
													end
												end
												
												if event.interrupted then
													GunFrame10( Gun, event )
													return 
												else
													Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													Gun:setLeftRight( true, false, -17.84, 88.84 )
													Gun:registerEventHandler( "transition_complete_keyframe", GunFrame10 )
												end
											end
											
											if event.interrupted then
												GunFrame9( Gun, event )
												return 
											else
												Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												Gun:setLeftRight( true, false, -19.34, 87.34 )
												Gun:registerEventHandler( "transition_complete_keyframe", GunFrame9 )
											end
										end
										
										if event.interrupted then
											GunFrame8( Gun, event )
											return 
										else
											Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											Gun:setLeftRight( true, false, -17.84, 88.84 )
											Gun:registerEventHandler( "transition_complete_keyframe", GunFrame8 )
										end
									end
									
									if event.interrupted then
										GunFrame7( Gun, event )
										return 
									else
										Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Gun:setLeftRight( true, false, -19.34, 87.34 )
										Gun:registerEventHandler( "transition_complete_keyframe", GunFrame7 )
									end
								end
								
								if event.interrupted then
									GunFrame6( Gun, event )
									return 
								else
									Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									Gun:setLeftRight( true, false, -17.84, 88.84 )
									Gun:registerEventHandler( "transition_complete_keyframe", GunFrame6 )
								end
							end
							
							if event.interrupted then
								GunFrame5( Gun, event )
								return 
							else
								Gun:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Gun:setLeftRight( true, false, -19.34, 87.34 )
								Gun:registerEventHandler( "transition_complete_keyframe", GunFrame5 )
							end
						end
						
						if event.interrupted then
							GunFrame4( Gun, event )
							return 
						else
							Gun:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Gun:setLeftRight( true, false, -17.84, 88.84 )
							Gun:registerEventHandler( "transition_complete_keyframe", GunFrame4 )
						end
					end
					
					if event.interrupted then
						GunFrame3( Gun, event )
						return 
					else
						Gun:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						Gun:registerEventHandler( "transition_complete_keyframe", GunFrame3 )
					end
				end
				
				Gun:completeAnimation()
				self.Gun:setLeftRight( true, false, -19.34, 87.34 )
				self.Gun:setTopBottom( true, false, 47.67, 154.34 )
				GunFrame2( Gun, {} )
				local FlashFrame2 = function ( Flash, event )
					local FlashFrame3 = function ( Flash, event )
						local FlashFrame4 = function ( Flash, event )
							local FlashFrame5 = function ( Flash, event )
								local FlashFrame6 = function ( Flash, event )
									local FlashFrame7 = function ( Flash, event )
										local FlashFrame8 = function ( Flash, event )
											local FlashFrame9 = function ( Flash, event )
												local FlashFrame10 = function ( Flash, event )
													local FlashFrame11 = function ( Flash, event )
														local FlashFrame12 = function ( Flash, event )
															local FlashFrame13 = function ( Flash, event )
																local FlashFrame14 = function ( Flash, event )
																	local FlashFrame15 = function ( Flash, event )
																		local FlashFrame16 = function ( Flash, event )
																			local FlashFrame17 = function ( Flash, event )
																				local FlashFrame18 = function ( Flash, event )
																					local FlashFrame19 = function ( Flash, event )
																						local FlashFrame20 = function ( Flash, event )
																							local FlashFrame21 = function ( Flash, event )
																								local FlashFrame22 = function ( Flash, event )
																									local FlashFrame23 = function ( Flash, event )
																										local FlashFrame24 = function ( Flash, event )
																											local FlashFrame25 = function ( Flash, event )
																												local FlashFrame26 = function ( Flash, event )
																													local FlashFrame27 = function ( Flash, event )
																														local FlashFrame28 = function ( Flash, event )
																															local FlashFrame29 = function ( Flash, event )
																																local FlashFrame30 = function ( Flash, event )
																																	local FlashFrame31 = function ( Flash, event )
																																		local FlashFrame32 = function ( Flash, event )
																																			local FlashFrame33 = function ( Flash, event )
																																				local FlashFrame34 = function ( Flash, event )
																																					local FlashFrame35 = function ( Flash, event )
																																						local FlashFrame36 = function ( Flash, event )
																																							local FlashFrame37 = function ( Flash, event )
																																								local FlashFrame38 = function ( Flash, event )
																																									local FlashFrame39 = function ( Flash, event )
																																										local FlashFrame40 = function ( Flash, event )
																																											local FlashFrame41 = function ( Flash, event )
																																												local FlashFrame42 = function ( Flash, event )
																																													local FlashFrame43 = function ( Flash, event )
																																														local FlashFrame44 = function ( Flash, event )
																																															local FlashFrame45 = function ( Flash, event )
																																																local FlashFrame46 = function ( Flash, event )
																																																	local FlashFrame47 = function ( Flash, event )
																																																		local FlashFrame48 = function ( Flash, event )
																																																			local FlashFrame49 = function ( Flash, event )
																																																				local FlashFrame50 = function ( Flash, event )
																																																					local FlashFrame51 = function ( Flash, event )
																																																						local FlashFrame52 = function ( Flash, event )
																																																							local FlashFrame53 = function ( Flash, event )
																																																								local FlashFrame54 = function ( Flash, event )
																																																									local FlashFrame55 = function ( Flash, event )
																																																										local FlashFrame56 = function ( Flash, event )
																																																											if not event.interrupted then
																																																												Flash:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
																																																											end
																																																											Flash:setAlpha( 0 )
																																																											if event.interrupted then
																																																												self.clipFinished( Flash, event )
																																																											else
																																																												Flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																											end
																																																										end
																																																										
																																																										if event.interrupted then
																																																											FlashFrame56( Flash, event )
																																																											return 
																																																										else
																																																											Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																																											Flash:setAlpha( 0 )
																																																											Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame56 )
																																																										end
																																																									end
																																																									
																																																									if event.interrupted then
																																																										FlashFrame55( Flash, event )
																																																										return 
																																																									else
																																																										Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																										Flash:setAlpha( 1 )
																																																										Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame55 )
																																																									end
																																																								end
																																																								
																																																								if event.interrupted then
																																																									FlashFrame54( Flash, event )
																																																									return 
																																																								else
																																																									Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																																									Flash:setAlpha( 0 )
																																																									Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame54 )
																																																								end
																																																							end
																																																							
																																																							if event.interrupted then
																																																								FlashFrame53( Flash, event )
																																																								return 
																																																							else
																																																								Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																								Flash:setAlpha( 1 )
																																																								Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame53 )
																																																							end
																																																						end
																																																						
																																																						if event.interrupted then
																																																							FlashFrame52( Flash, event )
																																																							return 
																																																						else
																																																							Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																																							Flash:setAlpha( 0 )
																																																							Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame52 )
																																																						end
																																																					end
																																																					
																																																					if event.interrupted then
																																																						FlashFrame51( Flash, event )
																																																						return 
																																																					else
																																																						Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																						Flash:setAlpha( 1 )
																																																						Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame51 )
																																																					end
																																																				end
																																																				
																																																				if event.interrupted then
																																																					FlashFrame50( Flash, event )
																																																					return 
																																																				else
																																																					Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																																																					Flash:setAlpha( 0 )
																																																					Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame50 )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				FlashFrame49( Flash, event )
																																																				return 
																																																			else
																																																				Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																				Flash:setAlpha( 1 )
																																																				Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			FlashFrame48( Flash, event )
																																																			return 
																																																		else
																																																			Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																																																			Flash:setAlpha( 0 )
																																																			Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		FlashFrame47( Flash, event )
																																																		return 
																																																	else
																																																		Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																		Flash:setAlpha( 1 )
																																																		Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	FlashFrame46( Flash, event )
																																																	return 
																																																else
																																																	Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																																	Flash:setAlpha( 0 )
																																																	Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																FlashFrame45( Flash, event )
																																																return 
																																															else
																																																Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																																Flash:setAlpha( 1 )
																																																Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															FlashFrame44( Flash, event )
																																															return 
																																														else
																																															Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																															Flash:setAlpha( 0 )
																																															Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														FlashFrame43( Flash, event )
																																														return 
																																													else
																																														Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																														Flash:setAlpha( 1 )
																																														Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													FlashFrame42( Flash, event )
																																													return 
																																												else
																																													Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																													Flash:setAlpha( 0 )
																																													Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												FlashFrame41( Flash, event )
																																												return 
																																											else
																																												Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																												Flash:setAlpha( 1 )
																																												Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											FlashFrame40( Flash, event )
																																											return 
																																										else
																																											Flash:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																																											Flash:setAlpha( 0 )
																																											Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										FlashFrame39( Flash, event )
																																										return 
																																									else
																																										Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																										Flash:setAlpha( 1 )
																																										Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									FlashFrame38( Flash, event )
																																									return 
																																								else
																																									Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																									Flash:setAlpha( 0 )
																																									Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								FlashFrame37( Flash, event )
																																								return 
																																							else
																																								Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																								Flash:setAlpha( 1 )
																																								Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							FlashFrame36( Flash, event )
																																							return 
																																						else
																																							Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																							Flash:setAlpha( 0 )
																																							Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						FlashFrame35( Flash, event )
																																						return 
																																					else
																																						Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																						Flash:setAlpha( 1 )
																																						Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					FlashFrame34( Flash, event )
																																					return 
																																				else
																																					Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																					Flash:setAlpha( 0 )
																																					Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				FlashFrame33( Flash, event )
																																				return 
																																			else
																																				Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																				Flash:setAlpha( 1 )
																																				Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			FlashFrame32( Flash, event )
																																			return 
																																		else
																																			Flash:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																			Flash:setAlpha( 0 )
																																			Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		FlashFrame31( Flash, event )
																																		return 
																																	else
																																		Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																		Flash:setAlpha( 1 )
																																		Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	FlashFrame30( Flash, event )
																																	return 
																																else
																																	Flash:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
																																	Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																FlashFrame29( Flash, event )
																																return 
																															else
																																Flash:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
																																Flash:setAlpha( 0 )
																																Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															FlashFrame28( Flash, event )
																															return 
																														else
																															Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															Flash:setAlpha( 1 )
																															Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														FlashFrame27( Flash, event )
																														return 
																													else
																														Flash:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
																														Flash:setAlpha( 0 )
																														Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													FlashFrame26( Flash, event )
																													return 
																												else
																													Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																													Flash:setAlpha( 1 )
																													Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												FlashFrame25( Flash, event )
																												return 
																											else
																												Flash:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
																												Flash:setAlpha( 0 )
																												Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											FlashFrame24( Flash, event )
																											return 
																										else
																											Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																											Flash:setAlpha( 1 )
																											Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										FlashFrame23( Flash, event )
																										return 
																									else
																										Flash:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
																										Flash:setAlpha( 0 )
																										Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									FlashFrame22( Flash, event )
																									return 
																								else
																									Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																									Flash:setAlpha( 1 )
																									Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								FlashFrame21( Flash, event )
																								return 
																							else
																								Flash:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
																								Flash:setAlpha( 0 )
																								Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							FlashFrame20( Flash, event )
																							return 
																						else
																							Flash:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																							Flash:setAlpha( 1 )
																							Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						FlashFrame19( Flash, event )
																						return 
																					else
																						Flash:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
																						Flash:setAlpha( 0 )
																						Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					FlashFrame18( Flash, event )
																					return 
																				else
																					Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																					Flash:setAlpha( 1 )
																					Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				FlashFrame17( Flash, event )
																				return 
																			else
																				Flash:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
																				Flash:setAlpha( 0 )
																				Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			FlashFrame16( Flash, event )
																			return 
																		else
																			Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			Flash:setAlpha( 1 )
																			Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		FlashFrame15( Flash, event )
																		return 
																	else
																		Flash:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
																		Flash:setAlpha( 0 )
																		Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame15 )
																	end
																end
																
																if event.interrupted then
																	FlashFrame14( Flash, event )
																	return 
																else
																	Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	Flash:setAlpha( 1 )
																	Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame14 )
																end
															end
															
															if event.interrupted then
																FlashFrame13( Flash, event )
																return 
															else
																Flash:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
																Flash:setAlpha( 0 )
																Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame13 )
															end
														end
														
														if event.interrupted then
															FlashFrame12( Flash, event )
															return 
														else
															Flash:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Flash:setAlpha( 1 )
															Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame12 )
														end
													end
													
													if event.interrupted then
														FlashFrame11( Flash, event )
														return 
													else
														Flash:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
														Flash:setAlpha( 0 )
														Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame11 )
													end
												end
												
												if event.interrupted then
													FlashFrame10( Flash, event )
													return 
												else
													Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													Flash:setAlpha( 1 )
													Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame10 )
												end
											end
											
											if event.interrupted then
												FlashFrame9( Flash, event )
												return 
											else
												Flash:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
												Flash:setAlpha( 0 )
												Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame9 )
											end
										end
										
										if event.interrupted then
											FlashFrame8( Flash, event )
											return 
										else
											Flash:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Flash:setAlpha( 1 )
											Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame8 )
										end
									end
									
									if event.interrupted then
										FlashFrame7( Flash, event )
										return 
									else
										Flash:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
										Flash:setAlpha( 0 )
										Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame7 )
									end
								end
								
								if event.interrupted then
									FlashFrame6( Flash, event )
									return 
								else
									Flash:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Flash:setAlpha( 1 )
									Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame6 )
								end
							end
							
							if event.interrupted then
								FlashFrame5( Flash, event )
								return 
							else
								Flash:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
								Flash:setAlpha( 0 )
								Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame5 )
							end
						end
						
						if event.interrupted then
							FlashFrame4( Flash, event )
							return 
						else
							Flash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Flash:setAlpha( 1 )
							Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame4 )
						end
					end
					
					if event.interrupted then
						FlashFrame3( Flash, event )
						return 
					else
						Flash:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						Flash:registerEventHandler( "transition_complete_keyframe", FlashFrame3 )
					end
				end
				
				Flash:completeAnimation()
				self.Flash:setAlpha( 0 )
				FlashFrame2( Flash, {} )
				local ArmLowerFrame2 = function ( ArmLower, event )
					local ArmLowerFrame3 = function ( ArmLower, event )
						local ArmLowerFrame4 = function ( ArmLower, event )
							local ArmLowerFrame5 = function ( ArmLower, event )
								local ArmLowerFrame6 = function ( ArmLower, event )
									local ArmLowerFrame7 = function ( ArmLower, event )
										local ArmLowerFrame8 = function ( ArmLower, event )
											local ArmLowerFrame9 = function ( ArmLower, event )
												local ArmLowerFrame10 = function ( ArmLower, event )
													local ArmLowerFrame11 = function ( ArmLower, event )
														local ArmLowerFrame12 = function ( ArmLower, event )
															local ArmLowerFrame13 = function ( ArmLower, event )
																local ArmLowerFrame14 = function ( ArmLower, event )
																	local ArmLowerFrame15 = function ( ArmLower, event )
																		local ArmLowerFrame16 = function ( ArmLower, event )
																			local ArmLowerFrame17 = function ( ArmLower, event )
																				local ArmLowerFrame18 = function ( ArmLower, event )
																					local ArmLowerFrame19 = function ( ArmLower, event )
																						local ArmLowerFrame20 = function ( ArmLower, event )
																							local ArmLowerFrame21 = function ( ArmLower, event )
																								local ArmLowerFrame22 = function ( ArmLower, event )
																									local ArmLowerFrame23 = function ( ArmLower, event )
																										local ArmLowerFrame24 = function ( ArmLower, event )
																											local ArmLowerFrame25 = function ( ArmLower, event )
																												local ArmLowerFrame26 = function ( ArmLower, event )
																													local ArmLowerFrame27 = function ( ArmLower, event )
																														local ArmLowerFrame28 = function ( ArmLower, event )
																															local ArmLowerFrame29 = function ( ArmLower, event )
																																local ArmLowerFrame30 = function ( ArmLower, event )
																																	local ArmLowerFrame31 = function ( ArmLower, event )
																																		local ArmLowerFrame32 = function ( ArmLower, event )
																																			local ArmLowerFrame33 = function ( ArmLower, event )
																																				local ArmLowerFrame34 = function ( ArmLower, event )
																																					local ArmLowerFrame35 = function ( ArmLower, event )
																																						local ArmLowerFrame36 = function ( ArmLower, event )
																																							local ArmLowerFrame37 = function ( ArmLower, event )
																																								local ArmLowerFrame38 = function ( ArmLower, event )
																																									local ArmLowerFrame39 = function ( ArmLower, event )
																																										local ArmLowerFrame40 = function ( ArmLower, event )
																																											local ArmLowerFrame41 = function ( ArmLower, event )
																																												local ArmLowerFrame42 = function ( ArmLower, event )
																																													local ArmLowerFrame43 = function ( ArmLower, event )
																																														local ArmLowerFrame44 = function ( ArmLower, event )
																																															local ArmLowerFrame45 = function ( ArmLower, event )
																																																local ArmLowerFrame46 = function ( ArmLower, event )
																																																	local ArmLowerFrame47 = function ( ArmLower, event )
																																																		local ArmLowerFrame48 = function ( ArmLower, event )
																																																			local ArmLowerFrame49 = function ( ArmLower, event )
																																																				local ArmLowerFrame50 = function ( ArmLower, event )
																																																					local ArmLowerFrame51 = function ( ArmLower, event )
																																																						local ArmLowerFrame52 = function ( ArmLower, event )
																																																							local ArmLowerFrame53 = function ( ArmLower, event )
																																																								local ArmLowerFrame54 = function ( ArmLower, event )
																																																									local ArmLowerFrame55 = function ( ArmLower, event )
																																																										local ArmLowerFrame56 = function ( ArmLower, event )
																																																											if not event.interrupted then
																																																												ArmLower:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
																																																											end
																																																											ArmLower:setLeftRight( true, false, 19, 72.33 )
																																																											ArmLower:setTopBottom( true, false, 75.34, 102 )
																																																											if event.interrupted then
																																																												self.clipFinished( ArmLower, event )
																																																											else
																																																												ArmLower:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																											end
																																																										end
																																																										
																																																										if event.interrupted then
																																																											ArmLowerFrame56( ArmLower, event )
																																																											return 
																																																										else
																																																											ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																											ArmLower:setLeftRight( true, false, 19, 72.33 )
																																																											ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame56 )
																																																										end
																																																									end
																																																									
																																																									if event.interrupted then
																																																										ArmLowerFrame55( ArmLower, event )
																																																										return 
																																																									else
																																																										ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																										ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																																										ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame55 )
																																																									end
																																																								end
																																																								
																																																								if event.interrupted then
																																																									ArmLowerFrame54( ArmLower, event )
																																																									return 
																																																								else
																																																									ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																									ArmLower:setLeftRight( true, false, 19, 72.33 )
																																																									ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame54 )
																																																								end
																																																							end
																																																							
																																																							if event.interrupted then
																																																								ArmLowerFrame53( ArmLower, event )
																																																								return 
																																																							else
																																																								ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																								ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																																								ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame53 )
																																																							end
																																																						end
																																																						
																																																						if event.interrupted then
																																																							ArmLowerFrame52( ArmLower, event )
																																																							return 
																																																						else
																																																							ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																																							ArmLower:setLeftRight( true, false, 19, 72.33 )
																																																							ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame52 )
																																																						end
																																																					end
																																																					
																																																					if event.interrupted then
																																																						ArmLowerFrame51( ArmLower, event )
																																																						return 
																																																					else
																																																						ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																						ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																																						ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame51 )
																																																					end
																																																				end
																																																				
																																																				if event.interrupted then
																																																					ArmLowerFrame50( ArmLower, event )
																																																					return 
																																																				else
																																																					ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																					ArmLower:setLeftRight( true, false, 19, 72.33 )
																																																					ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame50 )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				ArmLowerFrame49( ArmLower, event )
																																																				return 
																																																			else
																																																				ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																				ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																																				ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			ArmLowerFrame48( ArmLower, event )
																																																			return 
																																																		else
																																																			ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																			ArmLower:setLeftRight( true, false, 19, 72.33 )
																																																			ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		ArmLowerFrame47( ArmLower, event )
																																																		return 
																																																	else
																																																		ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																																		ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																																		ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	ArmLowerFrame46( ArmLower, event )
																																																	return 
																																																else
																																																	ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																	ArmLower:setLeftRight( true, false, 19, 72.33 )
																																																	ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																ArmLowerFrame45( ArmLower, event )
																																																return 
																																															else
																																																ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																																ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															ArmLowerFrame44( ArmLower, event )
																																															return 
																																														else
																																															ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																															ArmLower:setLeftRight( true, false, 19, 72.33 )
																																															ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														ArmLowerFrame43( ArmLower, event )
																																														return 
																																													else
																																														ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																														ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																														ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													ArmLowerFrame42( ArmLower, event )
																																													return 
																																												else
																																													ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																													ArmLower:setLeftRight( true, false, 19, 72.33 )
																																													ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												ArmLowerFrame41( ArmLower, event )
																																												return 
																																											else
																																												ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																												ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																												ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											ArmLowerFrame40( ArmLower, event )
																																											return 
																																										else
																																											ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																											ArmLower:setLeftRight( true, false, 19, 72.33 )
																																											ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										ArmLowerFrame39( ArmLower, event )
																																										return 
																																									else
																																										ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																										ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																										ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									ArmLowerFrame38( ArmLower, event )
																																									return 
																																								else
																																									ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																									ArmLower:setLeftRight( true, false, 19, 72.33 )
																																									ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								ArmLowerFrame37( ArmLower, event )
																																								return 
																																							else
																																								ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																								ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																								ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							ArmLowerFrame36( ArmLower, event )
																																							return 
																																						else
																																							ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																							ArmLower:setLeftRight( true, false, 19, 72.33 )
																																							ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						ArmLowerFrame35( ArmLower, event )
																																						return 
																																					else
																																						ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																						ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																						ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					ArmLowerFrame34( ArmLower, event )
																																					return 
																																				else
																																					ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																					ArmLower:setLeftRight( true, false, 19, 72.33 )
																																					ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				ArmLowerFrame33( ArmLower, event )
																																				return 
																																			else
																																				ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																				ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																				ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			ArmLowerFrame32( ArmLower, event )
																																			return 
																																		else
																																			ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																			ArmLower:setLeftRight( true, false, 19, 72.33 )
																																			ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ArmLowerFrame31( ArmLower, event )
																																		return 
																																	else
																																		ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																		ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																																		ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ArmLowerFrame30( ArmLower, event )
																																	return 
																																else
																																	ArmLower:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
																																	ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ArmLowerFrame29( ArmLower, event )
																																return 
																															else
																																ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																ArmLower:setLeftRight( true, false, 19, 72.33 )
																																ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ArmLowerFrame28( ArmLower, event )
																															return 
																														else
																															ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																															ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																															ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ArmLowerFrame27( ArmLower, event )
																														return 
																													else
																														ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														ArmLower:setLeftRight( true, false, 19, 72.33 )
																														ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ArmLowerFrame26( ArmLower, event )
																													return 
																												else
																													ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																													ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																													ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ArmLowerFrame25( ArmLower, event )
																												return 
																											else
																												ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																												ArmLower:setLeftRight( true, false, 19, 72.33 )
																												ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ArmLowerFrame24( ArmLower, event )
																											return 
																										else
																											ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																											ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																											ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ArmLowerFrame23( ArmLower, event )
																										return 
																									else
																										ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																										ArmLower:setLeftRight( true, false, 19, 72.33 )
																										ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ArmLowerFrame22( ArmLower, event )
																									return 
																								else
																									ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																									ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ArmLowerFrame21( ArmLower, event )
																								return 
																							else
																								ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								ArmLower:setLeftRight( true, false, 19, 72.33 )
																								ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ArmLowerFrame20( ArmLower, event )
																							return 
																						else
																							ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																							ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																							ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ArmLowerFrame19( ArmLower, event )
																						return 
																					else
																						ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																						ArmLower:setLeftRight( true, false, 19, 72.33 )
																						ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ArmLowerFrame18( ArmLower, event )
																					return 
																				else
																					ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																					ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																					ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ArmLowerFrame17( ArmLower, event )
																				return 
																			else
																				ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																				ArmLower:setLeftRight( true, false, 19, 72.33 )
																				ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ArmLowerFrame16( ArmLower, event )
																			return 
																		else
																			ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																			ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ArmLowerFrame15( ArmLower, event )
																		return 
																	else
																		ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		ArmLower:setLeftRight( true, false, 19, 72.33 )
																		ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame15 )
																	end
																end
																
																if event.interrupted then
																	ArmLowerFrame14( ArmLower, event )
																	return 
																else
																	ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																	ArmLower:setLeftRight( true, false, 20.5, 73.83 )
																	ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame14 )
																end
															end
															
															if event.interrupted then
																ArmLowerFrame13( ArmLower, event )
																return 
															else
																ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																ArmLower:setLeftRight( true, false, 19, 72.33 )
																ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame13 )
															end
														end
														
														if event.interrupted then
															ArmLowerFrame12( ArmLower, event )
															return 
														else
															ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															ArmLower:setLeftRight( true, false, 20.5, 73.83 )
															ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame12 )
														end
													end
													
													if event.interrupted then
														ArmLowerFrame11( ArmLower, event )
														return 
													else
														ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														ArmLower:setLeftRight( true, false, 19, 72.33 )
														ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame11 )
													end
												end
												
												if event.interrupted then
													ArmLowerFrame10( ArmLower, event )
													return 
												else
													ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													ArmLower:setLeftRight( true, false, 20.5, 73.83 )
													ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame10 )
												end
											end
											
											if event.interrupted then
												ArmLowerFrame9( ArmLower, event )
												return 
											else
												ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												ArmLower:setLeftRight( true, false, 19, 72.33 )
												ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame9 )
											end
										end
										
										if event.interrupted then
											ArmLowerFrame8( ArmLower, event )
											return 
										else
											ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											ArmLower:setLeftRight( true, false, 20.5, 73.83 )
											ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame8 )
										end
									end
									
									if event.interrupted then
										ArmLowerFrame7( ArmLower, event )
										return 
									else
										ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										ArmLower:setLeftRight( true, false, 19, 72.33 )
										ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame7 )
									end
								end
								
								if event.interrupted then
									ArmLowerFrame6( ArmLower, event )
									return 
								else
									ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									ArmLower:setLeftRight( true, false, 20.5, 73.83 )
									ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame6 )
								end
							end
							
							if event.interrupted then
								ArmLowerFrame5( ArmLower, event )
								return 
							else
								ArmLower:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								ArmLower:setLeftRight( true, false, 19, 72.33 )
								ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame5 )
							end
						end
						
						if event.interrupted then
							ArmLowerFrame4( ArmLower, event )
							return 
						else
							ArmLower:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							ArmLower:setLeftRight( true, false, 20.5, 73.83 )
							ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame4 )
						end
					end
					
					if event.interrupted then
						ArmLowerFrame3( ArmLower, event )
						return 
					else
						ArmLower:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						ArmLower:registerEventHandler( "transition_complete_keyframe", ArmLowerFrame3 )
					end
				end
				
				ArmLower:completeAnimation()
				self.ArmLower:setLeftRight( true, false, 19, 72.33 )
				self.ArmLower:setTopBottom( true, false, 75.34, 102 )
				ArmLowerFrame2( ArmLower, {} )
				local ArmUpperFrame2 = function ( ArmUpper, event )
					local ArmUpperFrame3 = function ( ArmUpper, event )
						local ArmUpperFrame4 = function ( ArmUpper, event )
							local ArmUpperFrame5 = function ( ArmUpper, event )
								local ArmUpperFrame6 = function ( ArmUpper, event )
									local ArmUpperFrame7 = function ( ArmUpper, event )
										local ArmUpperFrame8 = function ( ArmUpper, event )
											local ArmUpperFrame9 = function ( ArmUpper, event )
												local ArmUpperFrame10 = function ( ArmUpper, event )
													local ArmUpperFrame11 = function ( ArmUpper, event )
														local ArmUpperFrame12 = function ( ArmUpper, event )
															local ArmUpperFrame13 = function ( ArmUpper, event )
																local ArmUpperFrame14 = function ( ArmUpper, event )
																	local ArmUpperFrame15 = function ( ArmUpper, event )
																		local ArmUpperFrame16 = function ( ArmUpper, event )
																			local ArmUpperFrame17 = function ( ArmUpper, event )
																				local ArmUpperFrame18 = function ( ArmUpper, event )
																					local ArmUpperFrame19 = function ( ArmUpper, event )
																						local ArmUpperFrame20 = function ( ArmUpper, event )
																							local ArmUpperFrame21 = function ( ArmUpper, event )
																								local ArmUpperFrame22 = function ( ArmUpper, event )
																									local ArmUpperFrame23 = function ( ArmUpper, event )
																										local ArmUpperFrame24 = function ( ArmUpper, event )
																											local ArmUpperFrame25 = function ( ArmUpper, event )
																												local ArmUpperFrame26 = function ( ArmUpper, event )
																													local ArmUpperFrame27 = function ( ArmUpper, event )
																														local ArmUpperFrame28 = function ( ArmUpper, event )
																															local ArmUpperFrame29 = function ( ArmUpper, event )
																																local ArmUpperFrame30 = function ( ArmUpper, event )
																																	local ArmUpperFrame31 = function ( ArmUpper, event )
																																		local ArmUpperFrame32 = function ( ArmUpper, event )
																																			local ArmUpperFrame33 = function ( ArmUpper, event )
																																				local ArmUpperFrame34 = function ( ArmUpper, event )
																																					local ArmUpperFrame35 = function ( ArmUpper, event )
																																						local ArmUpperFrame36 = function ( ArmUpper, event )
																																							local ArmUpperFrame37 = function ( ArmUpper, event )
																																								local ArmUpperFrame38 = function ( ArmUpper, event )
																																									local ArmUpperFrame39 = function ( ArmUpper, event )
																																										local ArmUpperFrame40 = function ( ArmUpper, event )
																																											local ArmUpperFrame41 = function ( ArmUpper, event )
																																												local ArmUpperFrame42 = function ( ArmUpper, event )
																																													local ArmUpperFrame43 = function ( ArmUpper, event )
																																														local ArmUpperFrame44 = function ( ArmUpper, event )
																																															local ArmUpperFrame45 = function ( ArmUpper, event )
																																																local ArmUpperFrame46 = function ( ArmUpper, event )
																																																	local ArmUpperFrame47 = function ( ArmUpper, event )
																																																		local ArmUpperFrame48 = function ( ArmUpper, event )
																																																			local ArmUpperFrame49 = function ( ArmUpper, event )
																																																				local ArmUpperFrame50 = function ( ArmUpper, event )
																																																					local ArmUpperFrame51 = function ( ArmUpper, event )
																																																						local ArmUpperFrame52 = function ( ArmUpper, event )
																																																							local ArmUpperFrame53 = function ( ArmUpper, event )
																																																								local ArmUpperFrame54 = function ( ArmUpper, event )
																																																									local ArmUpperFrame55 = function ( ArmUpper, event )
																																																										local ArmUpperFrame56 = function ( ArmUpper, event )
																																																											if not event.interrupted then
																																																												ArmUpper:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
																																																											end
																																																											ArmUpper:setZRot( 0 )
																																																											if event.interrupted then
																																																												self.clipFinished( ArmUpper, event )
																																																											else
																																																												ArmUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																																											end
																																																										end
																																																										
																																																										if event.interrupted then
																																																											ArmUpperFrame56( ArmUpper, event )
																																																											return 
																																																										else
																																																											ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																											ArmUpper:setZRot( 0 )
																																																											ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame56 )
																																																										end
																																																									end
																																																									
																																																									if event.interrupted then
																																																										ArmUpperFrame55( ArmUpper, event )
																																																										return 
																																																									else
																																																										ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																										ArmUpper:setZRot( 8 )
																																																										ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame55 )
																																																									end
																																																								end
																																																								
																																																								if event.interrupted then
																																																									ArmUpperFrame54( ArmUpper, event )
																																																									return 
																																																								else
																																																									ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																									ArmUpper:setZRot( 0 )
																																																									ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame54 )
																																																								end
																																																							end
																																																							
																																																							if event.interrupted then
																																																								ArmUpperFrame53( ArmUpper, event )
																																																								return 
																																																							else
																																																								ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																								ArmUpper:setZRot( 8 )
																																																								ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame53 )
																																																							end
																																																						end
																																																						
																																																						if event.interrupted then
																																																							ArmUpperFrame52( ArmUpper, event )
																																																							return 
																																																						else
																																																							ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																																							ArmUpper:setZRot( 0 )
																																																							ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame52 )
																																																						end
																																																					end
																																																					
																																																					if event.interrupted then
																																																						ArmUpperFrame51( ArmUpper, event )
																																																						return 
																																																					else
																																																						ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																						ArmUpper:setZRot( 8 )
																																																						ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame51 )
																																																					end
																																																				end
																																																				
																																																				if event.interrupted then
																																																					ArmUpperFrame50( ArmUpper, event )
																																																					return 
																																																				else
																																																					ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																					ArmUpper:setZRot( 0 )
																																																					ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame50 )
																																																				end
																																																			end
																																																			
																																																			if event.interrupted then
																																																				ArmUpperFrame49( ArmUpper, event )
																																																				return 
																																																			else
																																																				ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																				ArmUpper:setZRot( 8 )
																																																				ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame49 )
																																																			end
																																																		end
																																																		
																																																		if event.interrupted then
																																																			ArmUpperFrame48( ArmUpper, event )
																																																			return 
																																																		else
																																																			ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																			ArmUpper:setZRot( 0 )
																																																			ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame48 )
																																																		end
																																																	end
																																																	
																																																	if event.interrupted then
																																																		ArmUpperFrame47( ArmUpper, event )
																																																		return 
																																																	else
																																																		ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																																		ArmUpper:setZRot( 8 )
																																																		ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame47 )
																																																	end
																																																end
																																																
																																																if event.interrupted then
																																																	ArmUpperFrame46( ArmUpper, event )
																																																	return 
																																																else
																																																	ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																	ArmUpper:setZRot( 0 )
																																																	ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame46 )
																																																end
																																															end
																																															
																																															if event.interrupted then
																																																ArmUpperFrame45( ArmUpper, event )
																																																return 
																																															else
																																																ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																																ArmUpper:setZRot( 8 )
																																																ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame45 )
																																															end
																																														end
																																														
																																														if event.interrupted then
																																															ArmUpperFrame44( ArmUpper, event )
																																															return 
																																														else
																																															ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																															ArmUpper:setZRot( 0 )
																																															ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame44 )
																																														end
																																													end
																																													
																																													if event.interrupted then
																																														ArmUpperFrame43( ArmUpper, event )
																																														return 
																																													else
																																														ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																														ArmUpper:setZRot( 8 )
																																														ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame43 )
																																													end
																																												end
																																												
																																												if event.interrupted then
																																													ArmUpperFrame42( ArmUpper, event )
																																													return 
																																												else
																																													ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																													ArmUpper:setZRot( 0 )
																																													ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame42 )
																																												end
																																											end
																																											
																																											if event.interrupted then
																																												ArmUpperFrame41( ArmUpper, event )
																																												return 
																																											else
																																												ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																												ArmUpper:setZRot( 8 )
																																												ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame41 )
																																											end
																																										end
																																										
																																										if event.interrupted then
																																											ArmUpperFrame40( ArmUpper, event )
																																											return 
																																										else
																																											ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																											ArmUpper:setZRot( 0 )
																																											ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame40 )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										ArmUpperFrame39( ArmUpper, event )
																																										return 
																																									else
																																										ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																										ArmUpper:setZRot( 8 )
																																										ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									ArmUpperFrame38( ArmUpper, event )
																																									return 
																																								else
																																									ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																									ArmUpper:setZRot( 0 )
																																									ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								ArmUpperFrame37( ArmUpper, event )
																																								return 
																																							else
																																								ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																								ArmUpper:setZRot( 8 )
																																								ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							ArmUpperFrame36( ArmUpper, event )
																																							return 
																																						else
																																							ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																							ArmUpper:setZRot( 0 )
																																							ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						ArmUpperFrame35( ArmUpper, event )
																																						return 
																																					else
																																						ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																						ArmUpper:setZRot( 8 )
																																						ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					ArmUpperFrame34( ArmUpper, event )
																																					return 
																																				else
																																					ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																					ArmUpper:setZRot( 0 )
																																					ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				ArmUpperFrame33( ArmUpper, event )
																																				return 
																																			else
																																				ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																				ArmUpper:setZRot( 8 )
																																				ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			ArmUpperFrame32( ArmUpper, event )
																																			return 
																																		else
																																			ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																			ArmUpper:setZRot( 0 )
																																			ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		ArmUpperFrame31( ArmUpper, event )
																																		return 
																																	else
																																		ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																		ArmUpper:setZRot( 8 )
																																		ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	ArmUpperFrame30( ArmUpper, event )
																																	return 
																																else
																																	ArmUpper:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
																																	ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																ArmUpperFrame29( ArmUpper, event )
																																return 
																															else
																																ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																ArmUpper:setZRot( 0 )
																																ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															ArmUpperFrame28( ArmUpper, event )
																															return 
																														else
																															ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																															ArmUpper:setZRot( 8 )
																															ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														ArmUpperFrame27( ArmUpper, event )
																														return 
																													else
																														ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																														ArmUpper:setZRot( 0 )
																														ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													ArmUpperFrame26( ArmUpper, event )
																													return 
																												else
																													ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																													ArmUpper:setZRot( 8 )
																													ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												ArmUpperFrame25( ArmUpper, event )
																												return 
																											else
																												ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																												ArmUpper:setZRot( 0 )
																												ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ArmUpperFrame24( ArmUpper, event )
																											return 
																										else
																											ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																											ArmUpper:setZRot( 8 )
																											ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ArmUpperFrame23( ArmUpper, event )
																										return 
																									else
																										ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																										ArmUpper:setZRot( 0 )
																										ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ArmUpperFrame22( ArmUpper, event )
																									return 
																								else
																									ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																									ArmUpper:setZRot( 8 )
																									ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ArmUpperFrame21( ArmUpper, event )
																								return 
																							else
																								ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								ArmUpper:setZRot( 0 )
																								ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ArmUpperFrame20( ArmUpper, event )
																							return 
																						else
																							ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																							ArmUpper:setZRot( 8 )
																							ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ArmUpperFrame19( ArmUpper, event )
																						return 
																					else
																						ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																						ArmUpper:setZRot( 0 )
																						ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ArmUpperFrame18( ArmUpper, event )
																					return 
																				else
																					ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																					ArmUpper:setZRot( 8 )
																					ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ArmUpperFrame17( ArmUpper, event )
																				return 
																			else
																				ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																				ArmUpper:setZRot( 0 )
																				ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ArmUpperFrame16( ArmUpper, event )
																			return 
																		else
																			ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			ArmUpper:setZRot( 8 )
																			ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ArmUpperFrame15( ArmUpper, event )
																		return 
																	else
																		ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		ArmUpper:setZRot( 0 )
																		ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame15 )
																	end
																end
																
																if event.interrupted then
																	ArmUpperFrame14( ArmUpper, event )
																	return 
																else
																	ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																	ArmUpper:setZRot( 8 )
																	ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame14 )
																end
															end
															
															if event.interrupted then
																ArmUpperFrame13( ArmUpper, event )
																return 
															else
																ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																ArmUpper:setZRot( 0 )
																ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame13 )
															end
														end
														
														if event.interrupted then
															ArmUpperFrame12( ArmUpper, event )
															return 
														else
															ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															ArmUpper:setZRot( 8 )
															ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame12 )
														end
													end
													
													if event.interrupted then
														ArmUpperFrame11( ArmUpper, event )
														return 
													else
														ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														ArmUpper:setZRot( 0 )
														ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame11 )
													end
												end
												
												if event.interrupted then
													ArmUpperFrame10( ArmUpper, event )
													return 
												else
													ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													ArmUpper:setZRot( 8 )
													ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame10 )
												end
											end
											
											if event.interrupted then
												ArmUpperFrame9( ArmUpper, event )
												return 
											else
												ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												ArmUpper:setZRot( 0 )
												ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame9 )
											end
										end
										
										if event.interrupted then
											ArmUpperFrame8( ArmUpper, event )
											return 
										else
											ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											ArmUpper:setZRot( 8 )
											ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame8 )
										end
									end
									
									if event.interrupted then
										ArmUpperFrame7( ArmUpper, event )
										return 
									else
										ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										ArmUpper:setZRot( 0 )
										ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame7 )
									end
								end
								
								if event.interrupted then
									ArmUpperFrame6( ArmUpper, event )
									return 
								else
									ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									ArmUpper:setZRot( 8 )
									ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame6 )
								end
							end
							
							if event.interrupted then
								ArmUpperFrame5( ArmUpper, event )
								return 
							else
								ArmUpper:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								ArmUpper:setZRot( 0 )
								ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame5 )
							end
						end
						
						if event.interrupted then
							ArmUpperFrame4( ArmUpper, event )
							return 
						else
							ArmUpper:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							ArmUpper:setZRot( 8 )
							ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame4 )
						end
					end
					
					if event.interrupted then
						ArmUpperFrame3( ArmUpper, event )
						return 
					else
						ArmUpper:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						ArmUpper:registerEventHandler( "transition_complete_keyframe", ArmUpperFrame3 )
					end
				end
				
				ArmUpper:completeAnimation()
				self.ArmUpper:setZRot( 0 )
				ArmUpperFrame2( ArmUpper, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackWing:close()
		element.RightLegs:close()
		element.LeftLegs:close()
		element.FrontWing:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

