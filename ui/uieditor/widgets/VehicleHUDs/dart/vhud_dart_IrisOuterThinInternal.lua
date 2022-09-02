-- 12d24f33bb2246a9fd91960674df7ba4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisOutterThin" )

CoD.vhud_dart_IrisOuterThinInternal = InheritFrom( LUI.UIElement )
CoD.vhud_dart_IrisOuterThinInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_IrisOuterThinInternal )
	self.id = "vhud_dart_IrisOuterThinInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1421 )
	self:setTopBottom( true, false, 0, 943 )
	
	local VehicleGroundIrisOutterThin0 = CoD.VehicleGround_IrisOutterThin.new( menu, controller )
	VehicleGroundIrisOutterThin0:setLeftRight( true, true, 0, 0 )
	VehicleGroundIrisOutterThin0:setTopBottom( true, true, 0, 0 )
	self:addElement( VehicleGroundIrisOutterThin0 )
	self.VehicleGroundIrisOutterThin0 = VehicleGroundIrisOutterThin0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local VehicleGroundIrisOutterThin0Frame2 = function ( VehicleGroundIrisOutterThin0, event )
					local VehicleGroundIrisOutterThin0Frame3 = function ( VehicleGroundIrisOutterThin0, event )
						local VehicleGroundIrisOutterThin0Frame4 = function ( VehicleGroundIrisOutterThin0, event )
							local VehicleGroundIrisOutterThin0Frame5 = function ( VehicleGroundIrisOutterThin0, event )
								local VehicleGroundIrisOutterThin0Frame6 = function ( VehicleGroundIrisOutterThin0, event )
									local VehicleGroundIrisOutterThin0Frame7 = function ( VehicleGroundIrisOutterThin0, event )
										local VehicleGroundIrisOutterThin0Frame8 = function ( VehicleGroundIrisOutterThin0, event )
											local VehicleGroundIrisOutterThin0Frame9 = function ( VehicleGroundIrisOutterThin0, event )
												local VehicleGroundIrisOutterThin0Frame10 = function ( VehicleGroundIrisOutterThin0, event )
													local VehicleGroundIrisOutterThin0Frame11 = function ( VehicleGroundIrisOutterThin0, event )
														local VehicleGroundIrisOutterThin0Frame12 = function ( VehicleGroundIrisOutterThin0, event )
															local VehicleGroundIrisOutterThin0Frame13 = function ( VehicleGroundIrisOutterThin0, event )
																local VehicleGroundIrisOutterThin0Frame14 = function ( VehicleGroundIrisOutterThin0, event )
																	if not event.interrupted then
																		VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 1579, true, true, CoD.TweenType.Linear )
																	end
																	VehicleGroundIrisOutterThin0:setZRot( 0 )
																	VehicleGroundIrisOutterThin0:setZoom( 0 )
																	if event.interrupted then
																		self.clipFinished( VehicleGroundIrisOutterThin0, event )
																	else
																		VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundIrisOutterThin0Frame14( VehicleGroundIrisOutterThin0, event )
																	return 
																else
																	VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 1840, false, true, CoD.TweenType.Back )
																	VehicleGroundIrisOutterThin0:setZRot( -0.72 )
																	VehicleGroundIrisOutterThin0:setZoom( 0 )
																	VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundIrisOutterThin0Frame13( VehicleGroundIrisOutterThin0, event )
																return 
															else
																VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
																VehicleGroundIrisOutterThin0:setZRot( -1.94 )
																VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundIrisOutterThin0Frame12( VehicleGroundIrisOutterThin0, event )
															return 
														else
															VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 3360, true, true, CoD.TweenType.Linear )
															VehicleGroundIrisOutterThin0:setZRot( -2 )
															VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundIrisOutterThin0Frame11( VehicleGroundIrisOutterThin0, event )
														return 
													else
														VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 520, false, false, CoD.TweenType.Linear )
														VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundIrisOutterThin0Frame10( VehicleGroundIrisOutterThin0, event )
													return 
												else
													VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 879, false, true, CoD.TweenType.Back )
													VehicleGroundIrisOutterThin0:setZoom( -20 )
													VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundIrisOutterThin0Frame9( VehicleGroundIrisOutterThin0, event )
												return 
											else
												VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 2740, false, false, CoD.TweenType.Linear )
												VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundIrisOutterThin0Frame8( VehicleGroundIrisOutterThin0, event )
											return 
										else
											VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 3859, true, true, CoD.TweenType.Linear )
											VehicleGroundIrisOutterThin0:setZRot( 3 )
											VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundIrisOutterThin0Frame7( VehicleGroundIrisOutterThin0, event )
										return 
									else
										VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
										VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundIrisOutterThin0Frame6( VehicleGroundIrisOutterThin0, event )
									return 
								else
									VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 1220, false, true, CoD.TweenType.Back )
									VehicleGroundIrisOutterThin0:setZoom( -40 )
									VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundIrisOutterThin0Frame5( VehicleGroundIrisOutterThin0, event )
								return 
							else
								VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 559, false, false, CoD.TweenType.Linear )
								VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundIrisOutterThin0Frame4( VehicleGroundIrisOutterThin0, event )
							return 
						else
							VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 3019, true, true, CoD.TweenType.Linear )
							VehicleGroundIrisOutterThin0:setZRot( -4 )
							VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundIrisOutterThin0Frame3( VehicleGroundIrisOutterThin0, event )
						return 
					else
						VehicleGroundIrisOutterThin0:beginAnimation( "keyframe", 2619, false, false, CoD.TweenType.Linear )
						VehicleGroundIrisOutterThin0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisOutterThin0Frame3 )
					end
				end
				
				VehicleGroundIrisOutterThin0:completeAnimation()
				self.VehicleGroundIrisOutterThin0:setZRot( 0 )
				self.VehicleGroundIrisOutterThin0:setZoom( 0 )
				VehicleGroundIrisOutterThin0Frame2( VehicleGroundIrisOutterThin0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VehicleGroundIrisOutterThin0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

