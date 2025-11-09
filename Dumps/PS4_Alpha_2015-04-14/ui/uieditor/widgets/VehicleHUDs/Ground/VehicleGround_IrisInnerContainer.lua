require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_IrisInner" )

CoD.VehicleGround_IrisInnerContainer = InheritFrom( LUI.UIElement )
CoD.VehicleGround_IrisInnerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_IrisInnerContainer )
	self.id = "VehicleGround_IrisInnerContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local VehicleGroundIrisInner0 = CoD.VehicleGround_IrisInner.new( menu, controller )
	VehicleGroundIrisInner0:setLeftRight( true, false, 0, 1280 )
	VehicleGroundIrisInner0:setTopBottom( true, false, 0, 720 )
	VehicleGroundIrisInner0:setRGB( 1, 0.64, 0.35 )
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
																				if not event.interrupted then
																					VehicleGroundIrisInner0:beginAnimation( "keyframe", 2239, true, true, CoD.TweenType.Back )
																				end
																				VehicleGroundIrisInner0:setRGB( 1, 1, 1 )
																				VehicleGroundIrisInner0:setZRot( 0 )
																				VehicleGroundIrisInner0:setZoom( -149 )
																				if event.interrupted then
																					self.clipFinished( VehicleGroundIrisInner0, event )
																				else
																					VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				VehicleGroundIrisInner0Frame17( VehicleGroundIrisInner0, event )
																				return 
																			else
																				VehicleGroundIrisInner0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
																				VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			VehicleGroundIrisInner0Frame16( VehicleGroundIrisInner0, event )
																			return 
																		else
																			VehicleGroundIrisInner0:beginAnimation( "keyframe", 2010, false, true, CoD.TweenType.Back )
																			VehicleGroundIrisInner0:setRGB( 1, 1, 1 )
																			VehicleGroundIrisInner0:setZoom( -149 )
																			VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		VehicleGroundIrisInner0Frame15( VehicleGroundIrisInner0, event )
																		return 
																	else
																		VehicleGroundIrisInner0:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
																		VehicleGroundIrisInner0:setZRot( -10 )
																		VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame15 )
																	end
																end
																
																if event.interrupted then
																	VehicleGroundIrisInner0Frame14( VehicleGroundIrisInner0, event )
																	return 
																else
																	VehicleGroundIrisInner0:beginAnimation( "keyframe", 2939, true, true, CoD.TweenType.Back )
																	VehicleGroundIrisInner0:setZRot( -12 )
																	VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame14 )
																end
															end
															
															if event.interrupted then
																VehicleGroundIrisInner0Frame13( VehicleGroundIrisInner0, event )
																return 
															else
																VehicleGroundIrisInner0:beginAnimation( "keyframe", 2840, false, false, CoD.TweenType.Linear )
																VehicleGroundIrisInner0:setZRot( -10 )
																VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame13 )
															end
														end
														
														if event.interrupted then
															VehicleGroundIrisInner0Frame12( VehicleGroundIrisInner0, event )
															return 
														else
															VehicleGroundIrisInner0:beginAnimation( "keyframe", 1920, true, true, CoD.TweenType.Linear )
															VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame12 )
														end
													end
													
													if event.interrupted then
														VehicleGroundIrisInner0Frame11( VehicleGroundIrisInner0, event )
														return 
													else
														VehicleGroundIrisInner0:beginAnimation( "keyframe", 760, false, true, CoD.TweenType.Back )
														VehicleGroundIrisInner0:setRGB( 1, 0.64, 0.35 )
														VehicleGroundIrisInner0:setZRot( -15 )
														VehicleGroundIrisInner0:setZoom( -190 )
														VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame11 )
													end
												end
												
												if event.interrupted then
													VehicleGroundIrisInner0Frame10( VehicleGroundIrisInner0, event )
													return 
												else
													VehicleGroundIrisInner0:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Linear )
													VehicleGroundIrisInner0:setZRot( -14.5 )
													VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame10 )
												end
											end
											
											if event.interrupted then
												VehicleGroundIrisInner0Frame9( VehicleGroundIrisInner0, event )
												return 
											else
												VehicleGroundIrisInner0:beginAnimation( "keyframe", 1000, false, true, CoD.TweenType.Back )
												VehicleGroundIrisInner0:setRGB( 1, 1, 1 )
												VehicleGroundIrisInner0:setZRot( -13.87 )
												VehicleGroundIrisInner0:setZoom( -150 )
												VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame9 )
											end
										end
										
										if event.interrupted then
											VehicleGroundIrisInner0Frame8( VehicleGroundIrisInner0, event )
											return 
										else
											VehicleGroundIrisInner0:beginAnimation( "keyframe", 2369, false, false, CoD.TweenType.Linear )
											VehicleGroundIrisInner0:setZRot( -18 )
											VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundIrisInner0Frame7( VehicleGroundIrisInner0, event )
										return 
									else
										VehicleGroundIrisInner0:beginAnimation( "keyframe", 970, true, true, CoD.TweenType.Back )
										VehicleGroundIrisInner0:setZRot( -20 )
										VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundIrisInner0Frame6( VehicleGroundIrisInner0, event )
									return 
								else
									VehicleGroundIrisInner0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
									VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundIrisInner0Frame5( VehicleGroundIrisInner0, event )
								return 
							else
								VehicleGroundIrisInner0:beginAnimation( "keyframe", 600, false, true, CoD.TweenType.Back )
								VehicleGroundIrisInner0:setRGB( 1, 0.64, 0.35 )
								VehicleGroundIrisInner0:setZoom( -190 )
								VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundIrisInner0Frame4( VehicleGroundIrisInner0, event )
							return 
						else
							VehicleGroundIrisInner0:beginAnimation( "keyframe", 1569, true, true, CoD.TweenType.Back )
							VehicleGroundIrisInner0:setZRot( -15 )
							VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundIrisInner0Frame3( VehicleGroundIrisInner0, event )
						return 
					else
						VehicleGroundIrisInner0:beginAnimation( "keyframe", 1710, false, false, CoD.TweenType.Linear )
						VehicleGroundIrisInner0:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisInner0Frame3 )
					end
				end
				
				VehicleGroundIrisInner0:completeAnimation()
				self.VehicleGroundIrisInner0:setRGB( 1, 1, 1 )
				self.VehicleGroundIrisInner0:setZRot( 0 )
				self.VehicleGroundIrisInner0:setZoom( -149 )
				VehicleGroundIrisInner0Frame2( VehicleGroundIrisInner0, {} )
				self.nextClip = "DefaultClip"
			end
		},
		LeavingOperationalZone = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LeavingOperationalZone",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		}
	} )
	self:linkToElementModel( self, "outOfRange", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "outOfRange"
		} )
	end )
	self.close = function ( self )
		self.VehicleGroundIrisInner0:close()
		CoD.VehicleGround_IrisInnerContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

