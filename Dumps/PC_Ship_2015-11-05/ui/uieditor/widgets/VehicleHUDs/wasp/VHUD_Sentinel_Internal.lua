require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_iris" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.VHUD_Sentinel_Reticle" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_generic_button_layout" )
require( "ui.uieditor.widgets.VehicleHUDs.wasp.vhud_sentinel_outOfRangeLabels" )

CoD.VHUD_Sentinel_Internal = InheritFrom( LUI.UIElement )
CoD.VHUD_Sentinel_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VHUD_Sentinel_Internal )
	self.id = "VHUD_Sentinel_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local vhudsentineliris0 = CoD.vhud_sentinel_iris.new( menu, controller )
	vhudsentineliris0:setLeftRight( true, true, -202.5, 202.5 )
	vhudsentineliris0:setTopBottom( true, true, -115, 115 )
	vhudsentineliris0:linkToElementModel( self, nil, false, function ( model )
		vhudsentineliris0:setModel( model, controller )
	end )
	self:addElement( vhudsentineliris0 )
	self.vhudsentineliris0 = vhudsentineliris0
	
	local TextureOverlayDots = LUI.UIImage.new()
	TextureOverlayDots:setLeftRight( false, false, -640, 640 )
	TextureOverlayDots:setTopBottom( false, false, -360, 360 )
	TextureOverlayDots:setAlpha( 0.9 )
	TextureOverlayDots:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_textureoverlaydots" ) )
	TextureOverlayDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TextureOverlayDots )
	self.TextureOverlayDots = TextureOverlayDots
	
	local VHUDSentinelReticle = CoD.VHUD_Sentinel_Reticle.new( menu, controller )
	VHUDSentinelReticle:setLeftRight( true, true, 0, 0 )
	VHUDSentinelReticle:setTopBottom( true, true, 0, 0 )
	VHUDSentinelReticle:linkToElementModel( self, nil, false, function ( model )
		VHUDSentinelReticle:setModel( model, controller )
	end )
	VHUDSentinelReticle:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		PlayClipOnElement( self, {
			elementName = "VHUDSentinelReticle",
			clipName = "StartUp"
		}, controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	VHUDSentinelReticle:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	VHUDSentinelReticle:linkToElementModel( VHUDSentinelReticle, "zoomed", true, function ( model )
		menu:updateElementState( VHUDSentinelReticle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( VHUDSentinelReticle )
	self.VHUDSentinelReticle = VHUDSentinelReticle
	
	local vhudButtonContainer = CoD.vhud_generic_button_layout.new( menu, controller )
	vhudButtonContainer:setLeftRight( true, true, 0, 0 )
	vhudButtonContainer:setTopBottom( true, true, -2.45, -2.45 )
	vhudButtonContainer:linkToElementModel( self, "bindings", false, function ( model )
		vhudButtonContainer:setModel( model, controller )
	end )
	vhudButtonContainer:registerEventHandler( "menu_opened", function ( element, event )
		local f8_local0 = nil
		SizeToSafeArea( element, controller )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( vhudButtonContainer )
	self.vhudButtonContainer = vhudButtonContainer
	
	local vhudsentineloutOfRangeLabels0 = CoD.vhud_sentinel_outOfRangeLabels.new( menu, controller )
	vhudsentineloutOfRangeLabels0:setLeftRight( false, false, -263.4, 263.4 )
	vhudsentineloutOfRangeLabels0:setTopBottom( false, false, -123, 123 )
	vhudsentineloutOfRangeLabels0:linkToElementModel( self, nil, false, function ( model )
		vhudsentineloutOfRangeLabels0:setModel( model, controller )
	end )
	self:addElement( vhudsentineloutOfRangeLabels0 )
	self.vhudsentineloutOfRangeLabels0 = vhudsentineloutOfRangeLabels0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local TextureOverlayDotsFrame2 = function ( TextureOverlayDots, event )
					local TextureOverlayDotsFrame3 = function ( TextureOverlayDots, event )
						local TextureOverlayDotsFrame4 = function ( TextureOverlayDots, event )
							local TextureOverlayDotsFrame5 = function ( TextureOverlayDots, event )
								local TextureOverlayDotsFrame6 = function ( TextureOverlayDots, event )
									local TextureOverlayDotsFrame7 = function ( TextureOverlayDots, event )
										local TextureOverlayDotsFrame8 = function ( TextureOverlayDots, event )
											local TextureOverlayDotsFrame9 = function ( TextureOverlayDots, event )
												local TextureOverlayDotsFrame10 = function ( TextureOverlayDots, event )
													local TextureOverlayDotsFrame11 = function ( TextureOverlayDots, event )
														local TextureOverlayDotsFrame12 = function ( TextureOverlayDots, event )
															local TextureOverlayDotsFrame13 = function ( TextureOverlayDots, event )
																local TextureOverlayDotsFrame14 = function ( TextureOverlayDots, event )
																	local TextureOverlayDotsFrame15 = function ( TextureOverlayDots, event )
																		local TextureOverlayDotsFrame16 = function ( TextureOverlayDots, event )
																			local TextureOverlayDotsFrame17 = function ( TextureOverlayDots, event )
																				local TextureOverlayDotsFrame18 = function ( TextureOverlayDots, event )
																					local TextureOverlayDotsFrame19 = function ( TextureOverlayDots, event )
																						local TextureOverlayDotsFrame20 = function ( TextureOverlayDots, event )
																							local TextureOverlayDotsFrame21 = function ( TextureOverlayDots, event )
																								local TextureOverlayDotsFrame22 = function ( TextureOverlayDots, event )
																									local TextureOverlayDotsFrame23 = function ( TextureOverlayDots, event )
																										local TextureOverlayDotsFrame24 = function ( TextureOverlayDots, event )
																											local TextureOverlayDotsFrame25 = function ( TextureOverlayDots, event )
																												local TextureOverlayDotsFrame26 = function ( TextureOverlayDots, event )
																													local TextureOverlayDotsFrame27 = function ( TextureOverlayDots, event )
																														local TextureOverlayDotsFrame28 = function ( TextureOverlayDots, event )
																															local TextureOverlayDotsFrame29 = function ( TextureOverlayDots, event )
																																local TextureOverlayDotsFrame30 = function ( TextureOverlayDots, event )
																																	local TextureOverlayDotsFrame31 = function ( TextureOverlayDots, event )
																																		local TextureOverlayDotsFrame32 = function ( TextureOverlayDots, event )
																																			local TextureOverlayDotsFrame33 = function ( TextureOverlayDots, event )
																																				local TextureOverlayDotsFrame34 = function ( TextureOverlayDots, event )
																																					local TextureOverlayDotsFrame35 = function ( TextureOverlayDots, event )
																																						local TextureOverlayDotsFrame36 = function ( TextureOverlayDots, event )
																																							local TextureOverlayDotsFrame37 = function ( TextureOverlayDots, event )
																																								local TextureOverlayDotsFrame38 = function ( TextureOverlayDots, event )
																																									if not event.interrupted then
																																										TextureOverlayDots:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																																									end
																																									TextureOverlayDots:setAlpha( 0 )
																																									if event.interrupted then
																																										self.clipFinished( TextureOverlayDots, event )
																																									else
																																										TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									TextureOverlayDotsFrame38( TextureOverlayDots, event )
																																									return 
																																								else
																																									TextureOverlayDots:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																																									TextureOverlayDots:setAlpha( 1 )
																																									TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								TextureOverlayDotsFrame37( TextureOverlayDots, event )
																																								return 
																																							else
																																								TextureOverlayDots:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
																																								TextureOverlayDots:setAlpha( 0.2 )
																																								TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							TextureOverlayDotsFrame36( TextureOverlayDots, event )
																																							return 
																																						else
																																							TextureOverlayDots:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
																																							TextureOverlayDots:setAlpha( 0.4 )
																																							TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						TextureOverlayDotsFrame35( TextureOverlayDots, event )
																																						return 
																																					else
																																						TextureOverlayDots:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																																						TextureOverlayDots:setAlpha( 0.1 )
																																						TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					TextureOverlayDotsFrame34( TextureOverlayDots, event )
																																					return 
																																				else
																																					TextureOverlayDots:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																																					TextureOverlayDots:setAlpha( 0.4 )
																																					TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				TextureOverlayDotsFrame33( TextureOverlayDots, event )
																																				return 
																																			else
																																				TextureOverlayDots:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																																				TextureOverlayDots:setAlpha( 0.9 )
																																				TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			TextureOverlayDotsFrame32( TextureOverlayDots, event )
																																			return 
																																		else
																																			TextureOverlayDots:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
																																			TextureOverlayDots:setAlpha( 0.15 )
																																			TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		TextureOverlayDotsFrame31( TextureOverlayDots, event )
																																		return 
																																	else
																																		TextureOverlayDots:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																																		TextureOverlayDots:setAlpha( 1 )
																																		TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	TextureOverlayDotsFrame30( TextureOverlayDots, event )
																																	return 
																																else
																																	TextureOverlayDots:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																																	TextureOverlayDots:setAlpha( 0.2 )
																																	TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame30 )
																																end
																															end
																															
																															if event.interrupted then
																																TextureOverlayDotsFrame29( TextureOverlayDots, event )
																																return 
																															else
																																TextureOverlayDots:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																																TextureOverlayDots:setAlpha( 0.5 )
																																TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame29 )
																															end
																														end
																														
																														if event.interrupted then
																															TextureOverlayDotsFrame28( TextureOverlayDots, event )
																															return 
																														else
																															TextureOverlayDots:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																															TextureOverlayDots:setAlpha( 0.3 )
																															TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														TextureOverlayDotsFrame27( TextureOverlayDots, event )
																														return 
																													else
																														TextureOverlayDots:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																														TextureOverlayDots:setAlpha( 1 )
																														TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													TextureOverlayDotsFrame26( TextureOverlayDots, event )
																													return 
																												else
																													TextureOverlayDots:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																													TextureOverlayDots:setAlpha( 0.6 )
																													TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												TextureOverlayDotsFrame25( TextureOverlayDots, event )
																												return 
																											else
																												TextureOverlayDots:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																												TextureOverlayDots:setAlpha( 1 )
																												TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											TextureOverlayDotsFrame24( TextureOverlayDots, event )
																											return 
																										else
																											TextureOverlayDots:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																											TextureOverlayDots:setAlpha( 0.15 )
																											TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										TextureOverlayDotsFrame23( TextureOverlayDots, event )
																										return 
																									else
																										TextureOverlayDots:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																										TextureOverlayDots:setAlpha( 0.5 )
																										TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									TextureOverlayDotsFrame22( TextureOverlayDots, event )
																									return 
																								else
																									TextureOverlayDots:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
																									TextureOverlayDots:setAlpha( 1 )
																									TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								TextureOverlayDotsFrame21( TextureOverlayDots, event )
																								return 
																							else
																								TextureOverlayDots:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
																								TextureOverlayDots:setAlpha( 0.2 )
																								TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							TextureOverlayDotsFrame20( TextureOverlayDots, event )
																							return 
																						else
																							TextureOverlayDots:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																							TextureOverlayDots:setAlpha( 0.7 )
																							TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						TextureOverlayDotsFrame19( TextureOverlayDots, event )
																						return 
																					else
																						TextureOverlayDots:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																						TextureOverlayDots:setAlpha( 0.4 )
																						TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					TextureOverlayDotsFrame18( TextureOverlayDots, event )
																					return 
																				else
																					TextureOverlayDots:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																					TextureOverlayDots:setAlpha( 1 )
																					TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				TextureOverlayDotsFrame17( TextureOverlayDots, event )
																				return 
																			else
																				TextureOverlayDots:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
																				TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			TextureOverlayDotsFrame16( TextureOverlayDots, event )
																			return 
																		else
																			TextureOverlayDots:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																			TextureOverlayDots:setAlpha( 0.1 )
																			TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		TextureOverlayDotsFrame15( TextureOverlayDots, event )
																		return 
																	else
																		TextureOverlayDots:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																		TextureOverlayDots:setAlpha( 0.6 )
																		TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame15 )
																	end
																end
																
																if event.interrupted then
																	TextureOverlayDotsFrame14( TextureOverlayDots, event )
																	return 
																else
																	TextureOverlayDots:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
																	TextureOverlayDots:setAlpha( 0.25 )
																	TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame14 )
																end
															end
															
															if event.interrupted then
																TextureOverlayDotsFrame13( TextureOverlayDots, event )
																return 
															else
																TextureOverlayDots:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																TextureOverlayDots:setAlpha( 0.8 )
																TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame13 )
															end
														end
														
														if event.interrupted then
															TextureOverlayDotsFrame12( TextureOverlayDots, event )
															return 
														else
															TextureOverlayDots:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
															TextureOverlayDots:setAlpha( 1 )
															TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame12 )
														end
													end
													
													if event.interrupted then
														TextureOverlayDotsFrame11( TextureOverlayDots, event )
														return 
													else
														TextureOverlayDots:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
														TextureOverlayDots:setAlpha( 0.5 )
														TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame11 )
													end
												end
												
												if event.interrupted then
													TextureOverlayDotsFrame10( TextureOverlayDots, event )
													return 
												else
													TextureOverlayDots:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													TextureOverlayDots:setAlpha( 0.8 )
													TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame10 )
												end
											end
											
											if event.interrupted then
												TextureOverlayDotsFrame9( TextureOverlayDots, event )
												return 
											else
												TextureOverlayDots:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
												TextureOverlayDots:setAlpha( 1 )
												TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame9 )
											end
										end
										
										if event.interrupted then
											TextureOverlayDotsFrame8( TextureOverlayDots, event )
											return 
										else
											TextureOverlayDots:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											TextureOverlayDots:setAlpha( 0.1 )
											TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame8 )
										end
									end
									
									if event.interrupted then
										TextureOverlayDotsFrame7( TextureOverlayDots, event )
										return 
									else
										TextureOverlayDots:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										TextureOverlayDots:setAlpha( 0.2 )
										TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame7 )
									end
								end
								
								if event.interrupted then
									TextureOverlayDotsFrame6( TextureOverlayDots, event )
									return 
								else
									TextureOverlayDots:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
									TextureOverlayDots:setAlpha( 0.1 )
									TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame6 )
								end
							end
							
							if event.interrupted then
								TextureOverlayDotsFrame5( TextureOverlayDots, event )
								return 
							else
								TextureOverlayDots:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								TextureOverlayDots:setAlpha( 0.5 )
								TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame5 )
							end
						end
						
						if event.interrupted then
							TextureOverlayDotsFrame4( TextureOverlayDots, event )
							return 
						else
							TextureOverlayDots:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							TextureOverlayDots:setAlpha( 0.25 )
							TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame4 )
						end
					end
					
					if event.interrupted then
						TextureOverlayDotsFrame3( TextureOverlayDots, event )
						return 
					else
						TextureOverlayDots:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						TextureOverlayDots:setAlpha( 1 )
						TextureOverlayDots:registerEventHandler( "transition_complete_keyframe", TextureOverlayDotsFrame3 )
					end
				end
				
				TextureOverlayDots:completeAnimation()
				self.TextureOverlayDots:setAlpha( 0 )
				TextureOverlayDotsFrame2( TextureOverlayDots, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsentineliris0:close()
		element.VHUDSentinelReticle:close()
		element.vhudButtonContainer:close()
		element.vhudsentineloutOfRangeLabels0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

