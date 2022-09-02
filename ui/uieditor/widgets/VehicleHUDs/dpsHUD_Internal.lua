-- ae6b3f2db48610ea8c682c1b2b810835
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_Iris" )
require( "ui.uieditor.widgets.VehicleHUDs.dpsVehicleReticle" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )

CoD.dpsHUD_Internal = InheritFrom( LUI.UIElement )
CoD.dpsHUD_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.dpsHUD_Internal )
	self.id = "dpsHUD_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local VignetteContainer = CoD.VehicleGround_VignetteContainer.new( menu, controller )
	VignetteContainer:setLeftRight( true, true, 0, 0 )
	VignetteContainer:setTopBottom( false, false, -360, 360 )
	VignetteContainer:setAlpha( 0.7 )
	self:addElement( VignetteContainer )
	self.VignetteContainer = VignetteContainer
	
	local VehicleGroundIris = CoD.VehicleGround_Iris.new( menu, controller )
	VehicleGroundIris:setLeftRight( false, false, -640, 640 )
	VehicleGroundIris:setTopBottom( false, false, -360, 360 )
	VehicleGroundIris:setRGB( 1, 0.35, 0.35 )
	VehicleGroundIris:setAlpha( 0.8 )
	VehicleGroundIris:linkToElementModel( self, nil, false, function ( model )
		VehicleGroundIris:setModel( model, controller )
	end )
	VehicleGroundIris:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		PlayClipOnElement( self, {
			elementName = "VehicleGroundIris",
			clipName = "StartUp"
		}, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	VehicleGroundIris:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	VehicleGroundIris:linkToElementModel( VehicleGroundIris, "zoomed", true, function ( model )
		menu:updateElementState( VehicleGroundIris, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( VehicleGroundIris )
	self.VehicleGroundIris = VehicleGroundIris
	
	local dpsVehicleReticle = CoD.dpsVehicleReticle.new( menu, controller )
	dpsVehicleReticle:setLeftRight( false, false, -640, 640 )
	dpsVehicleReticle:setTopBottom( false, false, -360, 360 )
	dpsVehicleReticle:setRGB( 1, 0.59, 0.59 )
	dpsVehicleReticle:setAlpha( 0.38 )
	dpsVehicleReticle:linkToElementModel( self, nil, false, function ( model )
		dpsVehicleReticle:setModel( model, controller )
	end )
	dpsVehicleReticle:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		PlayClipOnElement( self, {
			elementName = "dpsVehicleReticle",
			clipName = "StartUp"
		}, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	dpsVehicleReticle:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	dpsVehicleReticle:linkToElementModel( dpsVehicleReticle, "zoomed", true, function ( model )
		menu:updateElementState( dpsVehicleReticle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( dpsVehicleReticle )
	self.dpsVehicleReticle = dpsVehicleReticle
	
	local outOfRangeTitle = LUI.UITightText.new()
	outOfRangeTitle:setLeftRight( false, false, -117.2, 117.2 )
	outOfRangeTitle:setTopBottom( true, false, 218, 248 )
	outOfRangeTitle:setRGB( 1, 0, 0 )
	outOfRangeTitle:setText( Engine.Localize( "CPUI_LINK_ERROR" ) )
	outOfRangeTitle:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	outOfRangeTitle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	outOfRangeTitle:setShaderVector( 0, 0.2, 0, 0, 0 )
	outOfRangeTitle:setShaderVector( 1, 0, 0, 0, 0 )
	outOfRangeTitle:setShaderVector( 2, 0, 0, 0, 0 )
	outOfRangeTitle:setShaderVector( 3, 0, 0, 0, 0 )
	outOfRangeTitle:setShaderVector( 4, 0, 0, 0, 0 )
	outOfRangeTitle:setLetterSpacing( 8.6 )
	self:addElement( outOfRangeTitle )
	self.outOfRangeTitle = outOfRangeTitle
	
	local outOfRangeLabel = LUI.UITightText.new()
	outOfRangeLabel:setLeftRight( false, false, -263.4, 263.4 )
	outOfRangeLabel:setTopBottom( false, true, -231.5, -201.5 )
	outOfRangeLabel:setRGB( 1, 0, 0 )
	outOfRangeLabel:setText( Engine.Localize( "CPUI_LEAVING_OPERATIONAL_RANGE" ) )
	outOfRangeLabel:setTTF( "fonts/default.ttf" )
	outOfRangeLabel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	outOfRangeLabel:setShaderVector( 0, 0.2, 0, 0, 0 )
	outOfRangeLabel:setShaderVector( 1, 0, 0, 0, 0 )
	outOfRangeLabel:setShaderVector( 2, 0, 0, 0, 0 )
	outOfRangeLabel:setShaderVector( 3, 0, 0, 0, 0 )
	outOfRangeLabel:setShaderVector( 4, 0, 0, 0, 0 )
	outOfRangeLabel:setLetterSpacing( 6.7 )
	self:addElement( outOfRangeLabel )
	self.outOfRangeLabel = outOfRangeLabel
	
	local buttonLayout = CoD.vhud_generic_button_layout.new( menu, controller )
	buttonLayout:setLeftRight( true, true, 0, 0 )
	buttonLayout:setTopBottom( true, true, 0, 0 )
	buttonLayout:linkToElementModel( self, "bindings", false, function ( model )
		buttonLayout:setModel( model, controller )
	end )
	buttonLayout:registerEventHandler( "menu_loaded", function ( element, event )
		local f11_local0 = nil
		SizeToSafeArea( element, controller )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:addElement( buttonLayout )
	self.buttonLayout = buttonLayout
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				VignetteContainer:completeAnimation()
				self.VignetteContainer:setAlpha( 1 )
				self.clipFinished( VignetteContainer, {} )

				VehicleGroundIris:completeAnimation()
				self.VehicleGroundIris:setRGB( 1, 1, 1 )
				self.VehicleGroundIris:setAlpha( 1 )
				self.clipFinished( VehicleGroundIris, {} )

				dpsVehicleReticle:completeAnimation()
				self.dpsVehicleReticle:setRGB( 1, 1, 1 )
				self.dpsVehicleReticle:setAlpha( 1 )
				self.clipFinished( dpsVehicleReticle, {} )

				outOfRangeTitle:completeAnimation()
				self.outOfRangeTitle:setAlpha( 0 )
				self.clipFinished( outOfRangeTitle, {} )

				outOfRangeLabel:completeAnimation()
				self.outOfRangeLabel:setAlpha( 0 )
				self.clipFinished( outOfRangeLabel, {} )
			end
		},
		LeavingOperationalZone = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				local VignetteContainerFrame2 = function ( VignetteContainer, event )
					local VignetteContainerFrame3 = function ( VignetteContainer, event )
						local VignetteContainerFrame4 = function ( VignetteContainer, event )
							if not event.interrupted then
								VignetteContainer:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
							end
							VignetteContainer:setAlpha( 0.7 )
							if event.interrupted then
								self.clipFinished( VignetteContainer, event )
							else
								VignetteContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							VignetteContainerFrame4( VignetteContainer, event )
							return 
						else
							VignetteContainer:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
							VignetteContainer:setAlpha( 0.63 )
							VignetteContainer:registerEventHandler( "transition_complete_keyframe", VignetteContainerFrame4 )
						end
					end
					
					if event.interrupted then
						VignetteContainerFrame3( VignetteContainer, event )
						return 
					else
						VignetteContainer:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						VignetteContainer:setAlpha( 0.8 )
						VignetteContainer:registerEventHandler( "transition_complete_keyframe", VignetteContainerFrame3 )
					end
				end
				
				VignetteContainer:completeAnimation()
				self.VignetteContainer:setAlpha( 0.7 )
				VignetteContainerFrame2( VignetteContainer, {} )
				local VehicleGroundIrisFrame2 = function ( VehicleGroundIris, event )
					local VehicleGroundIrisFrame3 = function ( VehicleGroundIris, event )
						local VehicleGroundIrisFrame4 = function ( VehicleGroundIris, event )
							local VehicleGroundIrisFrame5 = function ( VehicleGroundIris, event )
								local VehicleGroundIrisFrame6 = function ( VehicleGroundIris, event )
									local VehicleGroundIrisFrame7 = function ( VehicleGroundIris, event )
										local VehicleGroundIrisFrame8 = function ( VehicleGroundIris, event )
											if not event.interrupted then
												VehicleGroundIris:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
											end
											VehicleGroundIris:setRGB( 1, 0.35, 0.35 )
											VehicleGroundIris:setAlpha( 0.8 )
											if event.interrupted then
												self.clipFinished( VehicleGroundIris, event )
											else
												VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											VehicleGroundIrisFrame8( VehicleGroundIris, event )
											return 
										else
											VehicleGroundIris:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											VehicleGroundIris:setAlpha( 0.58 )
											VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundIrisFrame7( VehicleGroundIris, event )
										return 
									else
										VehicleGroundIris:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
										VehicleGroundIris:setAlpha( 0.52 )
										VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundIrisFrame6( VehicleGroundIris, event )
									return 
								else
									VehicleGroundIris:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
									VehicleGroundIris:setAlpha( 0.67 )
									VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundIrisFrame5( VehicleGroundIris, event )
								return 
							else
								VehicleGroundIris:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
								VehicleGroundIris:setAlpha( 0.92 )
								VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundIrisFrame4( VehicleGroundIris, event )
							return 
						else
							VehicleGroundIris:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							VehicleGroundIris:setAlpha( 0.86 )
							VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundIrisFrame3( VehicleGroundIris, event )
						return 
					else
						VehicleGroundIris:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						VehicleGroundIris:setAlpha( 0.59 )
						VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame3 )
					end
				end
				
				VehicleGroundIris:completeAnimation()
				self.VehicleGroundIris:setRGB( 1, 0.35, 0.35 )
				self.VehicleGroundIris:setAlpha( 0.8 )
				VehicleGroundIrisFrame2( VehicleGroundIris, {} )
				local dpsVehicleReticleFrame2 = function ( dpsVehicleReticle, event )
					local dpsVehicleReticleFrame3 = function ( dpsVehicleReticle, event )
						local dpsVehicleReticleFrame4 = function ( dpsVehicleReticle, event )
							local dpsVehicleReticleFrame5 = function ( dpsVehicleReticle, event )
								local dpsVehicleReticleFrame6 = function ( dpsVehicleReticle, event )
									local dpsVehicleReticleFrame7 = function ( dpsVehicleReticle, event )
										local dpsVehicleReticleFrame8 = function ( dpsVehicleReticle, event )
											local dpsVehicleReticleFrame9 = function ( dpsVehicleReticle, event )
												local dpsVehicleReticleFrame10 = function ( dpsVehicleReticle, event )
													local dpsVehicleReticleFrame11 = function ( dpsVehicleReticle, event )
														local dpsVehicleReticleFrame12 = function ( dpsVehicleReticle, event )
															local dpsVehicleReticleFrame13 = function ( dpsVehicleReticle, event )
																local dpsVehicleReticleFrame14 = function ( dpsVehicleReticle, event )
																	local dpsVehicleReticleFrame15 = function ( dpsVehicleReticle, event )
																		local dpsVehicleReticleFrame16 = function ( dpsVehicleReticle, event )
																			local dpsVehicleReticleFrame17 = function ( dpsVehicleReticle, event )
																				local dpsVehicleReticleFrame18 = function ( dpsVehicleReticle, event )
																					local dpsVehicleReticleFrame19 = function ( dpsVehicleReticle, event )
																						local dpsVehicleReticleFrame20 = function ( dpsVehicleReticle, event )
																							local dpsVehicleReticleFrame21 = function ( dpsVehicleReticle, event )
																								local dpsVehicleReticleFrame22 = function ( dpsVehicleReticle, event )
																									local dpsVehicleReticleFrame23 = function ( dpsVehicleReticle, event )
																										local dpsVehicleReticleFrame24 = function ( dpsVehicleReticle, event )
																											local dpsVehicleReticleFrame25 = function ( dpsVehicleReticle, event )
																												local dpsVehicleReticleFrame26 = function ( dpsVehicleReticle, event )
																													local dpsVehicleReticleFrame27 = function ( dpsVehicleReticle, event )
																														local dpsVehicleReticleFrame28 = function ( dpsVehicleReticle, event )
																															local dpsVehicleReticleFrame29 = function ( dpsVehicleReticle, event )
																																local dpsVehicleReticleFrame30 = function ( dpsVehicleReticle, event )
																																	local dpsVehicleReticleFrame31 = function ( dpsVehicleReticle, event )
																																		local dpsVehicleReticleFrame32 = function ( dpsVehicleReticle, event )
																																			local dpsVehicleReticleFrame33 = function ( dpsVehicleReticle, event )
																																				local dpsVehicleReticleFrame34 = function ( dpsVehicleReticle, event )
																																					local dpsVehicleReticleFrame35 = function ( dpsVehicleReticle, event )
																																						local dpsVehicleReticleFrame36 = function ( dpsVehicleReticle, event )
																																							local dpsVehicleReticleFrame37 = function ( dpsVehicleReticle, event )
																																								local dpsVehicleReticleFrame38 = function ( dpsVehicleReticle, event )
																																									if not event.interrupted then
																																										dpsVehicleReticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																									end
																																									dpsVehicleReticle:setRGB( 1, 0.59, 0.59 )
																																									dpsVehicleReticle:setAlpha( 0.38 )
																																									if event.interrupted then
																																										self.clipFinished( dpsVehicleReticle, event )
																																									else
																																										dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									dpsVehicleReticleFrame38( dpsVehicleReticle, event )
																																									return 
																																								else
																																									dpsVehicleReticle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																									dpsVehicleReticle:setAlpha( 0.79 )
																																									dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								dpsVehicleReticleFrame37( dpsVehicleReticle, event )
																																								return 
																																							else
																																								dpsVehicleReticle:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																								dpsVehicleReticle:setAlpha( 0.85 )
																																								dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							dpsVehicleReticleFrame36( dpsVehicleReticle, event )
																																							return 
																																						else
																																							dpsVehicleReticle:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																																							dpsVehicleReticle:setAlpha( 0.29 )
																																							dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						dpsVehicleReticleFrame35( dpsVehicleReticle, event )
																																						return 
																																					else
																																						dpsVehicleReticle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																						dpsVehicleReticle:setAlpha( 0.44 )
																																						dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					dpsVehicleReticleFrame34( dpsVehicleReticle, event )
																																					return 
																																				else
																																					dpsVehicleReticle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																																					dpsVehicleReticle:setAlpha( 0.06 )
																																					dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				dpsVehicleReticleFrame33( dpsVehicleReticle, event )
																																				return 
																																			else
																																				dpsVehicleReticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																				dpsVehicleReticle:setAlpha( 0.4 )
																																				dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			dpsVehicleReticleFrame32( dpsVehicleReticle, event )
																																			return 
																																		else
																																			dpsVehicleReticle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																																			dpsVehicleReticle:setAlpha( 0.94 )
																																			dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		dpsVehicleReticleFrame31( dpsVehicleReticle, event )
																																		return 
																																	else
																																		dpsVehicleReticle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																		dpsVehicleReticle:setAlpha( 0.7 )
																																		dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	dpsVehicleReticleFrame30( dpsVehicleReticle, event )
																																	return 
																																else
																																	dpsVehicleReticle:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																	dpsVehicleReticle:setAlpha( 0.2 )
																																	dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																dpsVehicleReticleFrame29( dpsVehicleReticle, event )
																																return 
																															else
																																dpsVehicleReticle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																																dpsVehicleReticle:setAlpha( 0.82 )
																																dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															dpsVehicleReticleFrame28( dpsVehicleReticle, event )
																															return 
																														else
																															dpsVehicleReticle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															dpsVehicleReticle:setAlpha( 0.32 )
																															dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														dpsVehicleReticleFrame27( dpsVehicleReticle, event )
																														return 
																													else
																														dpsVehicleReticle:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																														dpsVehicleReticle:setAlpha( 0.64 )
																														dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													dpsVehicleReticleFrame26( dpsVehicleReticle, event )
																													return 
																												else
																													dpsVehicleReticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																													dpsVehicleReticle:setAlpha( 0.27 )
																													dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												dpsVehicleReticleFrame25( dpsVehicleReticle, event )
																												return 
																											else
																												dpsVehicleReticle:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																												dpsVehicleReticle:setAlpha( 0.49 )
																												dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											dpsVehicleReticleFrame24( dpsVehicleReticle, event )
																											return 
																										else
																											dpsVehicleReticle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																											dpsVehicleReticle:setAlpha( 0.19 )
																											dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										dpsVehicleReticleFrame23( dpsVehicleReticle, event )
																										return 
																									else
																										dpsVehicleReticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																										dpsVehicleReticle:setAlpha( 0.63 )
																										dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									dpsVehicleReticleFrame22( dpsVehicleReticle, event )
																									return 
																								else
																									dpsVehicleReticle:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																									dpsVehicleReticle:setAlpha( 0.17 )
																									dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								dpsVehicleReticleFrame21( dpsVehicleReticle, event )
																								return 
																							else
																								dpsVehicleReticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																								dpsVehicleReticle:setAlpha( 0.5 )
																								dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							dpsVehicleReticleFrame20( dpsVehicleReticle, event )
																							return 
																						else
																							dpsVehicleReticle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																							dpsVehicleReticle:setAlpha( 0.23 )
																							dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						dpsVehicleReticleFrame19( dpsVehicleReticle, event )
																						return 
																					else
																						dpsVehicleReticle:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																						dpsVehicleReticle:setAlpha( 0.59 )
																						dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					dpsVehicleReticleFrame18( dpsVehicleReticle, event )
																					return 
																				else
																					dpsVehicleReticle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					dpsVehicleReticle:setAlpha( 0 )
																					dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				dpsVehicleReticleFrame17( dpsVehicleReticle, event )
																				return 
																			else
																				dpsVehicleReticle:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																				dpsVehicleReticle:setAlpha( 0.62 )
																				dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			dpsVehicleReticleFrame16( dpsVehicleReticle, event )
																			return 
																		else
																			dpsVehicleReticle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																			dpsVehicleReticle:setAlpha( 1 )
																			dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		dpsVehicleReticleFrame15( dpsVehicleReticle, event )
																		return 
																	else
																		dpsVehicleReticle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																		dpsVehicleReticle:setAlpha( 0.89 )
																		dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame15 )
																	end
																end
																
																if event.interrupted then
																	dpsVehicleReticleFrame14( dpsVehicleReticle, event )
																	return 
																else
																	dpsVehicleReticle:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																	dpsVehicleReticle:setAlpha( 0.02 )
																	dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame14 )
																end
															end
															
															if event.interrupted then
																dpsVehicleReticleFrame13( dpsVehicleReticle, event )
																return 
															else
																dpsVehicleReticle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																dpsVehicleReticle:setAlpha( 1 )
																dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame13 )
															end
														end
														
														if event.interrupted then
															dpsVehicleReticleFrame12( dpsVehicleReticle, event )
															return 
														else
															dpsVehicleReticle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
															dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame12 )
														end
													end
													
													if event.interrupted then
														dpsVehicleReticleFrame11( dpsVehicleReticle, event )
														return 
													else
														dpsVehicleReticle:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
														dpsVehicleReticle:setAlpha( 0.74 )
														dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame11 )
													end
												end
												
												if event.interrupted then
													dpsVehicleReticleFrame10( dpsVehicleReticle, event )
													return 
												else
													dpsVehicleReticle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													dpsVehicleReticle:setAlpha( 0.96 )
													dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame10 )
												end
											end
											
											if event.interrupted then
												dpsVehicleReticleFrame9( dpsVehicleReticle, event )
												return 
											else
												dpsVehicleReticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												dpsVehicleReticle:setAlpha( 0.63 )
												dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame9 )
											end
										end
										
										if event.interrupted then
											dpsVehicleReticleFrame8( dpsVehicleReticle, event )
											return 
										else
											dpsVehicleReticle:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
											dpsVehicleReticle:setAlpha( 1 )
											dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame8 )
										end
									end
									
									if event.interrupted then
										dpsVehicleReticleFrame7( dpsVehicleReticle, event )
										return 
									else
										dpsVehicleReticle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										dpsVehicleReticle:setAlpha( 0 )
										dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame7 )
									end
								end
								
								if event.interrupted then
									dpsVehicleReticleFrame6( dpsVehicleReticle, event )
									return 
								else
									dpsVehicleReticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame6 )
								end
							end
							
							if event.interrupted then
								dpsVehicleReticleFrame5( dpsVehicleReticle, event )
								return 
							else
								dpsVehicleReticle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								dpsVehicleReticle:setAlpha( 1 )
								dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame5 )
							end
						end
						
						if event.interrupted then
							dpsVehicleReticleFrame4( dpsVehicleReticle, event )
							return 
						else
							dpsVehicleReticle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							dpsVehicleReticle:setAlpha( 0.37 )
							dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame4 )
						end
					end
					
					if event.interrupted then
						dpsVehicleReticleFrame3( dpsVehicleReticle, event )
						return 
					else
						dpsVehicleReticle:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						dpsVehicleReticle:setAlpha( 0.83 )
						dpsVehicleReticle:registerEventHandler( "transition_complete_keyframe", dpsVehicleReticleFrame3 )
					end
				end
				
				dpsVehicleReticle:completeAnimation()
				self.dpsVehicleReticle:setRGB( 1, 0.59, 0.59 )
				self.dpsVehicleReticle:setAlpha( 0.38 )
				dpsVehicleReticleFrame2( dpsVehicleReticle, {} )
				local outOfRangeTitleFrame2 = function ( outOfRangeTitle, event )
					local outOfRangeTitleFrame3 = function ( outOfRangeTitle, event )
						local outOfRangeTitleFrame4 = function ( outOfRangeTitle, event )
							local outOfRangeTitleFrame5 = function ( outOfRangeTitle, event )
								local outOfRangeTitleFrame6 = function ( outOfRangeTitle, event )
									local outOfRangeTitleFrame7 = function ( outOfRangeTitle, event )
										local outOfRangeTitleFrame8 = function ( outOfRangeTitle, event )
											local outOfRangeTitleFrame9 = function ( outOfRangeTitle, event )
												local outOfRangeTitleFrame10 = function ( outOfRangeTitle, event )
													local outOfRangeTitleFrame11 = function ( outOfRangeTitle, event )
														local outOfRangeTitleFrame12 = function ( outOfRangeTitle, event )
															local outOfRangeTitleFrame13 = function ( outOfRangeTitle, event )
																local outOfRangeTitleFrame14 = function ( outOfRangeTitle, event )
																	local outOfRangeTitleFrame15 = function ( outOfRangeTitle, event )
																		local outOfRangeTitleFrame16 = function ( outOfRangeTitle, event )
																			local outOfRangeTitleFrame17 = function ( outOfRangeTitle, event )
																				local outOfRangeTitleFrame18 = function ( outOfRangeTitle, event )
																					local outOfRangeTitleFrame19 = function ( outOfRangeTitle, event )
																						local outOfRangeTitleFrame20 = function ( outOfRangeTitle, event )
																							local outOfRangeTitleFrame21 = function ( outOfRangeTitle, event )
																								local outOfRangeTitleFrame22 = function ( outOfRangeTitle, event )
																									local outOfRangeTitleFrame23 = function ( outOfRangeTitle, event )
																										local outOfRangeTitleFrame24 = function ( outOfRangeTitle, event )
																											local outOfRangeTitleFrame25 = function ( outOfRangeTitle, event )
																												local outOfRangeTitleFrame26 = function ( outOfRangeTitle, event )
																													local outOfRangeTitleFrame27 = function ( outOfRangeTitle, event )
																														local outOfRangeTitleFrame28 = function ( outOfRangeTitle, event )
																															local outOfRangeTitleFrame29 = function ( outOfRangeTitle, event )
																																local outOfRangeTitleFrame30 = function ( outOfRangeTitle, event )
																																	if not event.interrupted then
																																		outOfRangeTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																	end
																																	outOfRangeTitle:setAlpha( 1 )
																																	if event.interrupted then
																																		self.clipFinished( outOfRangeTitle, event )
																																	else
																																		outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																	end
																																end
																																
																																if event.interrupted then
																																	outOfRangeTitleFrame30( outOfRangeTitle, event )
																																	return 
																																else
																																	outOfRangeTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																																	outOfRangeTitle:setAlpha( 0.93 )
																																	outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																outOfRangeTitleFrame29( outOfRangeTitle, event )
																																return 
																															else
																																outOfRangeTitle:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																																outOfRangeTitle:setAlpha( 0.84 )
																																outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															outOfRangeTitleFrame28( outOfRangeTitle, event )
																															return 
																														else
																															outOfRangeTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																															outOfRangeTitle:setAlpha( 1 )
																															outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														outOfRangeTitleFrame27( outOfRangeTitle, event )
																														return 
																													else
																														outOfRangeTitle:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																														outOfRangeTitle:setAlpha( 0.88 )
																														outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													outOfRangeTitleFrame26( outOfRangeTitle, event )
																													return 
																												else
																													outOfRangeTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																													outOfRangeTitle:setAlpha( 1 )
																													outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												outOfRangeTitleFrame25( outOfRangeTitle, event )
																												return 
																											else
																												outOfRangeTitle:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																												outOfRangeTitle:setAlpha( 0.92 )
																												outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											outOfRangeTitleFrame24( outOfRangeTitle, event )
																											return 
																										else
																											outOfRangeTitle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																											outOfRangeTitle:setAlpha( 1 )
																											outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										outOfRangeTitleFrame23( outOfRangeTitle, event )
																										return 
																									else
																										outOfRangeTitle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																										outOfRangeTitle:setAlpha( 0.73 )
																										outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									outOfRangeTitleFrame22( outOfRangeTitle, event )
																									return 
																								else
																									outOfRangeTitle:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																									outOfRangeTitle:setAlpha( 0.98 )
																									outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								outOfRangeTitleFrame21( outOfRangeTitle, event )
																								return 
																							else
																								outOfRangeTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																								outOfRangeTitle:setAlpha( 0.84 )
																								outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							outOfRangeTitleFrame20( outOfRangeTitle, event )
																							return 
																						else
																							outOfRangeTitle:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																							outOfRangeTitle:setAlpha( 1 )
																							outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						outOfRangeTitleFrame19( outOfRangeTitle, event )
																						return 
																					else
																						outOfRangeTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						outOfRangeTitle:setAlpha( 0.93 )
																						outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					outOfRangeTitleFrame18( outOfRangeTitle, event )
																					return 
																				else
																					outOfRangeTitle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																					outOfRangeTitle:setAlpha( 1 )
																					outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				outOfRangeTitleFrame17( outOfRangeTitle, event )
																				return 
																			else
																				outOfRangeTitle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																				outOfRangeTitle:setAlpha( 0.85 )
																				outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			outOfRangeTitleFrame16( outOfRangeTitle, event )
																			return 
																		else
																			outOfRangeTitle:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																			outOfRangeTitle:setAlpha( 1 )
																			outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		outOfRangeTitleFrame15( outOfRangeTitle, event )
																		return 
																	else
																		outOfRangeTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																		outOfRangeTitle:setAlpha( 0.68 )
																		outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame15 )
																	end
																end
																
																if event.interrupted then
																	outOfRangeTitleFrame14( outOfRangeTitle, event )
																	return 
																else
																	outOfRangeTitle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																	outOfRangeTitle:setAlpha( 1 )
																	outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame14 )
																end
															end
															
															if event.interrupted then
																outOfRangeTitleFrame13( outOfRangeTitle, event )
																return 
															else
																outOfRangeTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																outOfRangeTitle:setAlpha( 0.59 )
																outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame13 )
															end
														end
														
														if event.interrupted then
															outOfRangeTitleFrame12( outOfRangeTitle, event )
															return 
														else
															outOfRangeTitle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
															outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame12 )
														end
													end
													
													if event.interrupted then
														outOfRangeTitleFrame11( outOfRangeTitle, event )
														return 
													else
														outOfRangeTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														outOfRangeTitle:setAlpha( 1 )
														outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame11 )
													end
												end
												
												if event.interrupted then
													outOfRangeTitleFrame10( outOfRangeTitle, event )
													return 
												else
													outOfRangeTitle:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
													outOfRangeTitle:setAlpha( 0.84 )
													outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame10 )
												end
											end
											
											if event.interrupted then
												outOfRangeTitleFrame9( outOfRangeTitle, event )
												return 
											else
												outOfRangeTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												outOfRangeTitle:setAlpha( 1 )
												outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame9 )
											end
										end
										
										if event.interrupted then
											outOfRangeTitleFrame8( outOfRangeTitle, event )
											return 
										else
											outOfRangeTitle:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											outOfRangeTitle:setAlpha( 0.77 )
											outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame8 )
										end
									end
									
									if event.interrupted then
										outOfRangeTitleFrame7( outOfRangeTitle, event )
										return 
									else
										outOfRangeTitle:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
										outOfRangeTitle:setAlpha( 1 )
										outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame7 )
									end
								end
								
								if event.interrupted then
									outOfRangeTitleFrame6( outOfRangeTitle, event )
									return 
								else
									outOfRangeTitle:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									outOfRangeTitle:setAlpha( 0.81 )
									outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame6 )
								end
							end
							
							if event.interrupted then
								outOfRangeTitleFrame5( outOfRangeTitle, event )
								return 
							else
								outOfRangeTitle:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame5 )
							end
						end
						
						if event.interrupted then
							outOfRangeTitleFrame4( outOfRangeTitle, event )
							return 
						else
							outOfRangeTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							outOfRangeTitle:setAlpha( 1 )
							outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame4 )
						end
					end
					
					if event.interrupted then
						outOfRangeTitleFrame3( outOfRangeTitle, event )
						return 
					else
						outOfRangeTitle:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						outOfRangeTitle:setAlpha( 0.86 )
						outOfRangeTitle:registerEventHandler( "transition_complete_keyframe", outOfRangeTitleFrame3 )
					end
				end
				
				outOfRangeTitle:completeAnimation()
				self.outOfRangeTitle:setAlpha( 1 )
				outOfRangeTitleFrame2( outOfRangeTitle, {} )
				local outOfRangeLabelFrame2 = function ( outOfRangeLabel, event )
					local outOfRangeLabelFrame3 = function ( outOfRangeLabel, event )
						local outOfRangeLabelFrame4 = function ( outOfRangeLabel, event )
							local outOfRangeLabelFrame5 = function ( outOfRangeLabel, event )
								local outOfRangeLabelFrame6 = function ( outOfRangeLabel, event )
									local outOfRangeLabelFrame7 = function ( outOfRangeLabel, event )
										local outOfRangeLabelFrame8 = function ( outOfRangeLabel, event )
											local outOfRangeLabelFrame9 = function ( outOfRangeLabel, event )
												local outOfRangeLabelFrame10 = function ( outOfRangeLabel, event )
													local outOfRangeLabelFrame11 = function ( outOfRangeLabel, event )
														local outOfRangeLabelFrame12 = function ( outOfRangeLabel, event )
															local outOfRangeLabelFrame13 = function ( outOfRangeLabel, event )
																local outOfRangeLabelFrame14 = function ( outOfRangeLabel, event )
																	local outOfRangeLabelFrame15 = function ( outOfRangeLabel, event )
																		local outOfRangeLabelFrame16 = function ( outOfRangeLabel, event )
																			local outOfRangeLabelFrame17 = function ( outOfRangeLabel, event )
																				if not event.interrupted then
																					outOfRangeLabel:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				end
																				outOfRangeLabel:setAlpha( 1 )
																				if event.interrupted then
																					self.clipFinished( outOfRangeLabel, event )
																				else
																					outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																				end
																			end
																			
																			if event.interrupted then
																				outOfRangeLabelFrame17( outOfRangeLabel, event )
																				return 
																			else
																				outOfRangeLabel:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																				outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			outOfRangeLabelFrame16( outOfRangeLabel, event )
																			return 
																		else
																			outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			outOfRangeLabel:setAlpha( 0.4 )
																			outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		outOfRangeLabelFrame15( outOfRangeLabel, event )
																		return 
																	else
																		outOfRangeLabel:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
																		outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame15 )
																	end
																end
																
																if event.interrupted then
																	outOfRangeLabelFrame14( outOfRangeLabel, event )
																	return 
																else
																	outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	outOfRangeLabel:setAlpha( 1 )
																	outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame14 )
																end
															end
															
															if event.interrupted then
																outOfRangeLabelFrame13( outOfRangeLabel, event )
																return 
															else
																outOfRangeLabel:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame13 )
															end
														end
														
														if event.interrupted then
															outOfRangeLabelFrame12( outOfRangeLabel, event )
															return 
														else
															outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															outOfRangeLabel:setAlpha( 0.4 )
															outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame12 )
														end
													end
													
													if event.interrupted then
														outOfRangeLabelFrame11( outOfRangeLabel, event )
														return 
													else
														outOfRangeLabel:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
														outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame11 )
													end
												end
												
												if event.interrupted then
													outOfRangeLabelFrame10( outOfRangeLabel, event )
													return 
												else
													outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													outOfRangeLabel:setAlpha( 1 )
													outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame10 )
												end
											end
											
											if event.interrupted then
												outOfRangeLabelFrame9( outOfRangeLabel, event )
												return 
											else
												outOfRangeLabel:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
												outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame9 )
											end
										end
										
										if event.interrupted then
											outOfRangeLabelFrame8( outOfRangeLabel, event )
											return 
										else
											outOfRangeLabel:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											outOfRangeLabel:setAlpha( 0.4 )
											outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame8 )
										end
									end
									
									if event.interrupted then
										outOfRangeLabelFrame7( outOfRangeLabel, event )
										return 
									else
										outOfRangeLabel:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
										outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame7 )
									end
								end
								
								if event.interrupted then
									outOfRangeLabelFrame6( outOfRangeLabel, event )
									return 
								else
									outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									outOfRangeLabel:setAlpha( 1 )
									outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame6 )
								end
							end
							
							if event.interrupted then
								outOfRangeLabelFrame5( outOfRangeLabel, event )
								return 
							else
								outOfRangeLabel:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame5 )
							end
						end
						
						if event.interrupted then
							outOfRangeLabelFrame4( outOfRangeLabel, event )
							return 
						else
							outOfRangeLabel:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							outOfRangeLabel:setAlpha( 0.4 )
							outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame4 )
						end
					end
					
					if event.interrupted then
						outOfRangeLabelFrame3( outOfRangeLabel, event )
						return 
					else
						outOfRangeLabel:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						outOfRangeLabel:registerEventHandler( "transition_complete_keyframe", outOfRangeLabelFrame3 )
					end
				end
				
				outOfRangeLabel:completeAnimation()
				self.outOfRangeLabel:setAlpha( 1 )
				outOfRangeLabelFrame2( outOfRangeLabel, {} )

				self.nextClip = "DefaultClip"
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteContainer:close()
		element.VehicleGroundIris:close()
		element.dpsVehicleReticle:close()
		element.buttonLayout:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

