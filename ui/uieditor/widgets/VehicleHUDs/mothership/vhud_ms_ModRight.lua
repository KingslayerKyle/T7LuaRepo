-- 0076fa6aadd28da8db2d9f3007412a17
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT5" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_ModT4" )

CoD.vhud_ms_ModRight = InheritFrom( LUI.UIElement )
CoD.vhud_ms_ModRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_ModRight )
	self.id = "vhud_ms_ModRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 644 )
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local ModT1 = CoD.VehicleGround_ModT5.new( menu, controller )
	ModT1:setLeftRight( false, true, -256, -144 )
	ModT1:setTopBottom( true, false, 18, 54 )
	self:addElement( ModT1 )
	self.ModT1 = ModT1
	
	local ModT2 = CoD.VehicleGround_ModT4.new( menu, controller )
	ModT2:setLeftRight( false, true, -144, 0 )
	ModT2:setTopBottom( true, false, 18, 54 )
	self:addElement( ModT2 )
	self.ModT2 = ModT2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
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
				local f2_local1 = function ( f27_arg0, f27_arg1 )
					local f27_local0 = function ( f28_arg0, f28_arg1 )
						local f28_local0 = function ( f29_arg0, f29_arg1 )
							local f29_local0 = function ( f30_arg0, f30_arg1 )
								local f30_local0 = function ( f31_arg0, f31_arg1 )
									local f31_local0 = function ( f32_arg0, f32_arg1 )
										local f32_local0 = function ( f33_arg0, f33_arg1 )
											local f33_local0 = function ( f34_arg0, f34_arg1 )
												local f34_local0 = function ( f35_arg0, f35_arg1 )
													local f35_local0 = function ( f36_arg0, f36_arg1 )
														local f36_local0 = function ( f37_arg0, f37_arg1 )
															local f37_local0 = function ( f38_arg0, f38_arg1 )
																local f38_local0 = function ( f39_arg0, f39_arg1 )
																	local f39_local0 = function ( f40_arg0, f40_arg1 )
																		local f40_local0 = function ( f41_arg0, f41_arg1 )
																			local f41_local0 = function ( f42_arg0, f42_arg1 )
																				if not f42_arg1.interrupted then
																					f42_arg0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
																				end
																				f42_arg0:setLeftRight( true, false, 388, 532 )
																				f42_arg0:setTopBottom( true, false, 0, 36 )
																				f42_arg0:setAlpha( 1 )
																				if f42_arg1.interrupted then
																					self.clipFinished( f42_arg0, f42_arg1 )
																				else
																					f42_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if f41_arg1.interrupted then
																				f41_local0( f41_arg0, f41_arg1 )
																				return 
																			else
																				f41_arg0:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
																				f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
																			end
																		end
																		
																		if f40_arg1.interrupted then
																			f40_local0( f40_arg0, f40_arg1 )
																			return 
																		else
																			f40_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			f40_arg0:setAlpha( 1 )
																			f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
																		end
																	end
																	
																	if f39_arg1.interrupted then
																		f39_local0( f39_arg0, f39_arg1 )
																		return 
																	else
																		f39_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
																	end
																end
																
																if f38_arg1.interrupted then
																	f38_local0( f38_arg0, f38_arg1 )
																	return 
																else
																	f38_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	f38_arg0:setAlpha( 0 )
																	f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
																end
															end
															
															if f37_arg1.interrupted then
																f37_local0( f37_arg0, f37_arg1 )
																return 
															else
																f37_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
															end
														end
														
														if f36_arg1.interrupted then
															f36_local0( f36_arg0, f36_arg1 )
															return 
														else
															f36_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															f36_arg0:setAlpha( 0.5 )
															f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
														end
													end
													
													if f35_arg1.interrupted then
														f35_local0( f35_arg0, f35_arg1 )
														return 
													else
														f35_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
													end
												end
												
												if f34_arg1.interrupted then
													f34_local0( f34_arg0, f34_arg1 )
													return 
												else
													f34_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													f34_arg0:setAlpha( 0 )
													f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
												end
											end
											
											if f33_arg1.interrupted then
												f33_local0( f33_arg0, f33_arg1 )
												return 
											else
												f33_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
												f33_arg0:setLeftRight( true, false, 500, 644 )
												f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
											end
										end
										
										if f32_arg1.interrupted then
											f32_local0( f32_arg0, f32_arg1 )
											return 
										else
											f32_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f32_arg0:setLeftRight( true, false, 500, 505 )
											f32_arg0:setAlpha( 1 )
											f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
										end
									end
									
									if f31_arg1.interrupted then
										f31_local0( f31_arg0, f31_arg1 )
										return 
									else
										f31_arg0:beginAnimation( "keyframe", 9100, false, false, CoD.TweenType.Linear )
										f31_arg0:setLeftRight( true, false, 500, 644 )
										f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
									end
								end
								
								if f30_arg1.interrupted then
									f30_local0( f30_arg0, f30_arg1 )
									return 
								else
									f30_arg0:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
									f30_arg0:setLeftRight( true, false, 247, 391 )
									f30_arg0:setAlpha( 0 )
									f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
								end
							end
							
							if f29_arg1.interrupted then
								f29_local0( f29_arg0, f29_arg1 )
								return 
							else
								f29_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								f29_arg0:setLeftRight( true, false, 299.5, 443.5 )
								f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
							end
						end
						
						if f28_arg1.interrupted then
							f28_local0( f28_arg0, f28_arg1 )
							return 
						else
							f28_arg0:beginAnimation( "keyframe", 1900, false, false, CoD.TweenType.Linear )
							f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
						end
					end
					
					if f27_arg1.interrupted then
						f27_local0( f27_arg0, f27_arg1 )
						return 
					else
						f27_arg0:beginAnimation( "keyframe", 299, false, true, CoD.TweenType.Linear )
						f27_arg0:setLeftRight( true, false, 352, 496 )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
				end
				
				ModT2:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
				ModT2:setLeftRight( true, false, 388, 532 )
				ModT2:setTopBottom( true, false, 0, 36 )
				ModT2:setAlpha( 1 )
				ModT2:registerEventHandler( "transition_complete_keyframe", f2_local1 )
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
		element.ModT1:close()
		element.ModT2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

