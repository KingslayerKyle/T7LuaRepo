-- 70f0ad170a0c4658b4e47baf2d2efd7e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisInner" )

CoD.DniWipe_OuterIrisBlink = InheritFrom( LUI.UIElement )
CoD.DniWipe_OuterIrisBlink.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_OuterIrisBlink )
	self.id = "DniWipe_OuterIrisBlink"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local VehicleGroundIrisInner0 = CoD.VehicleGround_IrisInner.new( menu, controller )
	VehicleGroundIrisInner0:setLeftRight( true, true, 0, 0 )
	VehicleGroundIrisInner0:setTopBottom( true, true, 0, 0 )
	VehicleGroundIrisInner0:setRGB( 1, 0.64, 0.35 )
	VehicleGroundIrisInner0:setAlpha( 0.6 )
	VehicleGroundIrisInner0:setZRot( -18 )
	VehicleGroundIrisInner0:setZoom( -190 )
	self:addElement( VehicleGroundIrisInner0 )
	self.VehicleGroundIrisInner0 = VehicleGroundIrisInner0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local VehicleGroundIrisInner0Frame2 = function ( VehicleGroundIrisInner0, event )
					local VehicleGroundIrisInner0Frame3 = function ( VehicleGroundIrisInner0, event )
						local VehicleGroundIrisInner0Frame4 = function ( VehicleGroundIrisInner0, event )
							local VehicleGroundIrisInner0Frame5 = function ( VehicleGroundIrisInner0, event )
								local VehicleGroundIrisInner0Frame6 = function ( VehicleGroundIrisInner0, event )
									local VehicleGroundIrisInner0Frame7 = function ( VehicleGroundIrisInner0, event )
										local VehicleGroundIrisInner0Frame8 = function ( VehicleGroundIrisInner0, event )
											local VehicleGroundIrisInner0Frame9 = function ( VehicleGroundIrisInner0, event )
												local VehicleGroundIrisInner0Frame10 = function ( VehicleGroundIrisInner0, event )
													local VehicleGroundIrisInner0Frame11 = function ( VehicleGroundIrisInner0, event )
														local VehicleGroundIrisInner0Frame12 = function ( VehicleGroundIrisInner0, event )
															local VehicleGroundIrisInner0Frame13 = function ( VehicleGroundIrisInner0, event )
																local VehicleGroundIrisInner0Frame14 = function ( VehicleGroundIrisInner0, event )
																	local VehicleGroundIrisInner0Frame15 = function ( VehicleGroundIrisInner0, event )
																		local VehicleGroundIrisInner0Frame16 = function ( VehicleGroundIrisInner0, event )
																			local VehicleGroundIrisInner0Frame17 = function ( VehicleGroundIrisInner0, event )
																				local VehicleGroundIrisInner0Frame18 = function ( VehicleGroundIrisInner0, event )
																					local VehicleGroundIrisInner0Frame19 = function ( VehicleGroundIrisInner0, event )
																						local VehicleGroundIrisInner0Frame20 = function ( VehicleGroundIrisInner0, event )
																							local VehicleGroundIrisInner0Frame21 = function ( VehicleGroundIrisInner0, event )
																								local VehicleGroundIrisInner0Frame22 = function ( VehicleGroundIrisInner0, event )
																									local VehicleGroundIrisInner0Frame23 = function ( VehicleGroundIrisInner0, event )
																										local VehicleGroundIrisInner0Frame24 = function ( VehicleGroundIrisInner0, event )
																											if not event.interrupted then
																												VehicleGroundIrisInner0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																											end
																											VehicleGroundIrisInner0:setAlpha( 0.3 )
																											VehicleGroundIrisInner0:setScale( 1 )
																											if event.interrupted then
																												self.clipFinished( VehicleGroundIrisInner0, event )
																											else
																												VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																											end
																										end
																										
																										if event.interrupted then
																											VehicleGroundIrisInner0Frame24( VehicleGroundIrisInner0, event )
																											return 
																										else
																											VehicleGroundIrisInner0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																											VehicleGroundIrisInner0:setAlpha( 0.52 )
																											VehicleGroundIrisInner0:setScale( 1.02 )
																											VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										VehicleGroundIrisInner0Frame23( VehicleGroundIrisInner0, event )
																										return 
																									else
																										VehicleGroundIrisInner0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																										VehicleGroundIrisInner0:setAlpha( 0.3 )
																										VehicleGroundIrisInner0:setScale( 1.04 )
																										VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									VehicleGroundIrisInner0Frame22( VehicleGroundIrisInner0, event )
																									return 
																								else
																									VehicleGroundIrisInner0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																									VehicleGroundIrisInner0:setScale( 1.06 )
																									VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								VehicleGroundIrisInner0Frame21( VehicleGroundIrisInner0, event )
																								return 
																							else
																								VehicleGroundIrisInner0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																								VehicleGroundIrisInner0:setAlpha( 0.52 )
																								VehicleGroundIrisInner0:setScale( 1.08 )
																								VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							VehicleGroundIrisInner0Frame20( VehicleGroundIrisInner0, event )
																							return 
																						else
																							VehicleGroundIrisInner0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																							VehicleGroundIrisInner0:setAlpha( 0.08 )
																							VehicleGroundIrisInner0:setScale( 1.09 )
																							VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						VehicleGroundIrisInner0Frame19( VehicleGroundIrisInner0, event )
																						return 
																					else
																						VehicleGroundIrisInner0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						VehicleGroundIrisInner0:setAlpha( 0.52 )
																						VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					VehicleGroundIrisInner0Frame18( VehicleGroundIrisInner0, event )
																					return 
																				else
																					VehicleGroundIrisInner0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
																					VehicleGroundIrisInner0:setAlpha( 0.63 )
																					VehicleGroundIrisInner0:setScale( 1.1 )
																					VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundIrisInner0Frame17( VehicleGroundIrisInner0, event )
																				return 
																			else
																				VehicleGroundIrisInner0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																				VehicleGroundIrisInner0:setAlpha( 0.07 )
																				VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundIrisInner0Frame16( VehicleGroundIrisInner0, event )
																			return 
																		else
																			VehicleGroundIrisInner0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
																			VehicleGroundIrisInner0:setAlpha( 0.46 )
																			VehicleGroundIrisInner0:setScale( 1.08 )
																			VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundIrisInner0Frame15( VehicleGroundIrisInner0, event )
																		return 
																	else
																		VehicleGroundIrisInner0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
																		VehicleGroundIrisInner0:setAlpha( 0.3 )
																		VehicleGroundIrisInner0:setScale( 1.06 )
																		VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundIrisInner0Frame14( VehicleGroundIrisInner0, event )
																	return 
																else
																	VehicleGroundIrisInner0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																	VehicleGroundIrisInner0:setAlpha( 0.36 )
																	VehicleGroundIrisInner0:setScale( 1.05 )
																	VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundIrisInner0Frame13( VehicleGroundIrisInner0, event )
																return 
															else
																VehicleGroundIrisInner0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																VehicleGroundIrisInner0:setAlpha( 0.37 )
																VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundIrisInner0Frame12( VehicleGroundIrisInner0, event )
															return 
														else
															VehicleGroundIrisInner0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
															VehicleGroundIrisInner0:setAlpha( 0.38 )
															VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundIrisInner0Frame11( VehicleGroundIrisInner0, event )
														return 
													else
														VehicleGroundIrisInner0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
														VehicleGroundIrisInner0:setAlpha( 0.84 )
														VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundIrisInner0Frame10( VehicleGroundIrisInner0, event )
													return 
												else
													VehicleGroundIrisInner0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													VehicleGroundIrisInner0:setAlpha( 0.34 )
													VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundIrisInner0Frame9( VehicleGroundIrisInner0, event )
												return 
											else
												VehicleGroundIrisInner0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												VehicleGroundIrisInner0:setAlpha( 0.37 )
												VehicleGroundIrisInner0:setScale( 1.1 )
												VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundIrisInner0Frame8( VehicleGroundIrisInner0, event )
											return 
										else
											VehicleGroundIrisInner0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											VehicleGroundIrisInner0:setAlpha( 0.42 )
											VehicleGroundIrisInner0:setScale( 1 )
											VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundIrisInner0Frame7( VehicleGroundIrisInner0, event )
										return 
									else
										VehicleGroundIrisInner0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										VehicleGroundIrisInner0:setAlpha( 0.47 )
										VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundIrisInner0Frame6( VehicleGroundIrisInner0, event )
									return 
								else
									VehicleGroundIrisInner0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									VehicleGroundIrisInner0:setAlpha( 0.48 )
									VehicleGroundIrisInner0:setScale( 1.05 )
									VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundIrisInner0Frame5( VehicleGroundIrisInner0, event )
								return 
							else
								VehicleGroundIrisInner0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								VehicleGroundIrisInner0:setAlpha( 0.16 )
								VehicleGroundIrisInner0:setScale( 1.04 )
								VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundIrisInner0Frame4( VehicleGroundIrisInner0, event )
							return 
						else
							VehicleGroundIrisInner0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							VehicleGroundIrisInner0:setAlpha( 1 )
							VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundIrisInner0Frame3( VehicleGroundIrisInner0, event )
						return 
					else
						VehicleGroundIrisInner0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						VehicleGroundIrisInner0:setScale( 1.03 )
						VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame3 )
					end
				end
				
				VehicleGroundIrisInner0:completeAnimation()
				self.VehicleGroundIrisInner0:setAlpha( 0.6 )
				self.VehicleGroundIrisInner0:setScale( 1 )
				VehicleGroundIrisInner0Frame2( VehicleGroundIrisInner0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundIrisInner0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
