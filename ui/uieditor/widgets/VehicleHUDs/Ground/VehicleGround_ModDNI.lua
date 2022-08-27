-- bdaa7e6bbfdd94e40fba5dc605a41885
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ModDNI = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ModDNI.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ModDNI )
	self.id = "VehicleGround_ModDNI"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 52 )
	self:setTopBottom( true, false, 0, 57 )
	
	local ModDNI = LUI.UIImage.new()
	ModDNI:setLeftRight( true, false, 14, 38 )
	ModDNI:setTopBottom( true, false, 16, 40 )
	ModDNI:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesdni" ) )
	ModDNI:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ModDNI )
	self.ModDNI = ModDNI
	
	local ModDNIArrow = LUI.UIImage.new()
	ModDNIArrow:setLeftRight( true, false, 18, 34 )
	ModDNIArrow:setTopBottom( true, false, 0, 16 )
	ModDNIArrow:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesdniarrow" ) )
	ModDNIArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ModDNIArrow )
	self.ModDNIArrow = ModDNIArrow
	
	local ModDNIBracketB = LUI.UIImage.new()
	ModDNIBracketB:setLeftRight( true, false, 10, 42 )
	ModDNIBracketB:setTopBottom( true, false, 30, 46 )
	ModDNIBracketB:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesdnibracketb" ) )
	ModDNIBracketB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ModDNIBracketB )
	self.ModDNIBracketB = ModDNIBracketB
	
	local ModDNIBracketT = LUI.UIImage.new()
	ModDNIBracketT:setLeftRight( true, false, 10, 42 )
	ModDNIBracketT:setTopBottom( true, false, 8, 24 )
	ModDNIBracketT:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesdnibrackett" ) )
	ModDNIBracketT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ModDNIBracketT )
	self.ModDNIBracketT = ModDNIBracketT
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( false, false, -26, 26 )
	TextBox0:setTopBottom( false, false, 19.5, 28.5 )
	TextBox0:setText( Engine.Localize( "DNI SYNC" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextBox0:setShaderVector( 0, 0.05, 0.4, 0, 0 )
	TextBox0:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 3, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 4, 0, 0, 0, 0 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local ModDNI0 = LUI.UIImage.new()
	ModDNI0:setLeftRight( true, false, 9, 43 )
	ModDNI0:setTopBottom( true, false, 11, 45 )
	ModDNI0:setAlpha( 0 )
	ModDNI0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_modulesdni" ) )
	ModDNI0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ModDNI0 )
	self.ModDNI0 = ModDNI0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local ModDNIFrame2 = function ( ModDNI, event )
					local ModDNIFrame3 = function ( ModDNI, event )
						if not event.interrupted then
							ModDNI:beginAnimation( "keyframe", 1289, false, false, CoD.TweenType.Linear )
						end
						ModDNI:setAlpha( 1 )
						ModDNI:setXRot( 360 )
						ModDNI:setYRot( 360 )
						ModDNI:setZRot( 360 )
						ModDNI:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( ModDNI, event )
						else
							ModDNI:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ModDNIFrame3( ModDNI, event )
						return 
					else
						ModDNI:beginAnimation( "keyframe", 1210, true, true, CoD.TweenType.Linear )
						ModDNI:setXRot( 360 )
						ModDNI:setYRot( 360 )
						ModDNI:setZRot( 360 )
						ModDNI:registerEventHandler( "transition_complete_keyframe", ModDNIFrame3 )
					end
				end
				
				ModDNI:completeAnimation()
				self.ModDNI:setAlpha( 1 )
				self.ModDNI:setXRot( 0 )
				self.ModDNI:setYRot( 0 )
				self.ModDNI:setZRot( 0 )
				self.ModDNI:setZoom( 0 )
				ModDNIFrame2( ModDNI, {} )
				local f2_local1 = function ( f5_arg0, f5_arg1 )
					local f5_local0 = function ( f6_arg0, f6_arg1 )
						local f6_local0 = function ( f7_arg0, f7_arg1 )
							if not f7_arg1.interrupted then
								f7_arg0:beginAnimation( "keyframe", 389, false, true, CoD.TweenType.Linear )
							end
							f7_arg0:setLeftRight( true, false, 18, 34 )
							f7_arg0:setTopBottom( true, false, 0, 16 )
							if f7_arg1.interrupted then
								self.clipFinished( f7_arg0, f7_arg1 )
							else
								f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f6_arg1.interrupted then
							f6_local0( f6_arg0, f6_arg1 )
							return 
						else
							f6_arg0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
						end
					end
					
					if f5_arg1.interrupted then
						f5_local0( f5_arg0, f5_arg1 )
						return 
					else
						f5_arg0:beginAnimation( "keyframe", 329, false, true, CoD.TweenType.Back )
						f5_arg0:setTopBottom( true, false, -10, 6 )
						f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
					end
				end
				
				ModDNIArrow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				ModDNIArrow:setLeftRight( true, false, 18, 34 )
				ModDNIArrow:setTopBottom( true, false, 0, 16 )
				ModDNIArrow:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local ModDNIBracketBFrame2 = function ( ModDNIBracketB, event )
					local ModDNIBracketBFrame3 = function ( ModDNIBracketB, event )
						local ModDNIBracketBFrame4 = function ( ModDNIBracketB, event )
							local ModDNIBracketBFrame5 = function ( ModDNIBracketB, event )
								if not event.interrupted then
									ModDNIBracketB:beginAnimation( "keyframe", 320, true, false, CoD.TweenType.Back )
								end
								ModDNIBracketB:setLeftRight( true, false, 10, 42 )
								ModDNIBracketB:setTopBottom( true, false, 30, 46 )
								ModDNIBracketB:setRGB( 1, 1, 1 )
								ModDNIBracketB:setZRot( 0 )
								if event.interrupted then
									self.clipFinished( ModDNIBracketB, event )
								else
									ModDNIBracketB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ModDNIBracketBFrame5( ModDNIBracketB, event )
								return 
							else
								ModDNIBracketB:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								ModDNIBracketB:setLeftRight( true, false, 16.05, 48.05 )
								ModDNIBracketB:setTopBottom( true, false, 33.59, 49.59 )
								ModDNIBracketB:setRGB( 1, 1, 1 )
								ModDNIBracketB:setZRot( 34.06 )
								ModDNIBracketB:registerEventHandler( "transition_complete_keyframe", ModDNIBracketBFrame5 )
							end
						end
						
						if event.interrupted then
							ModDNIBracketBFrame4( ModDNIBracketB, event )
							return 
						else
							ModDNIBracketB:beginAnimation( "keyframe", 440, false, true, CoD.TweenType.Back )
							ModDNIBracketB:setLeftRight( true, false, -6, 26 )
							ModDNIBracketB:setTopBottom( true, false, 20.5, 36.5 )
							ModDNIBracketB:setRGB( 1, 0, 0 )
							ModDNIBracketB:setZRot( -90 )
							ModDNIBracketB:registerEventHandler( "transition_complete_keyframe", ModDNIBracketBFrame4 )
						end
					end
					
					if event.interrupted then
						ModDNIBracketBFrame3( ModDNIBracketB, event )
						return 
					else
						ModDNIBracketB:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ModDNIBracketB:setLeftRight( true, false, -8.41, 23.59 )
						ModDNIBracketB:setTopBottom( true, false, 19.07, 35.07 )
						ModDNIBracketB:setZRot( -103.55 )
						ModDNIBracketB:registerEventHandler( "transition_complete_keyframe", ModDNIBracketBFrame3 )
					end
				end
				
				ModDNIBracketB:completeAnimation()
				self.ModDNIBracketB:setLeftRight( true, false, 10, 42 )
				self.ModDNIBracketB:setTopBottom( true, false, 30, 46 )
				self.ModDNIBracketB:setRGB( 1, 1, 1 )
				self.ModDNIBracketB:setZRot( 0 )
				ModDNIBracketBFrame2( ModDNIBracketB, {} )
				local ModDNIBracketTFrame2 = function ( ModDNIBracketT, event )
					local ModDNIBracketTFrame3 = function ( ModDNIBracketT, event )
						local ModDNIBracketTFrame4 = function ( ModDNIBracketT, event )
							local ModDNIBracketTFrame5 = function ( ModDNIBracketT, event )
								if not event.interrupted then
									ModDNIBracketT:beginAnimation( "keyframe", 320, true, false, CoD.TweenType.Back )
								end
								ModDNIBracketT:setLeftRight( true, false, 10, 42 )
								ModDNIBracketT:setTopBottom( true, false, 8, 24 )
								ModDNIBracketT:setRGB( 1, 1, 1 )
								ModDNIBracketT:setZRot( 0 )
								if event.interrupted then
									self.clipFinished( ModDNIBracketT, event )
								else
									ModDNIBracketT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ModDNIBracketTFrame5( ModDNIBracketT, event )
								return 
							else
								ModDNIBracketT:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
								ModDNIBracketT:setLeftRight( true, false, 3.57, 35.57 )
								ModDNIBracketT:setTopBottom( true, false, 3.46, 19.46 )
								ModDNIBracketT:setRGB( 1, 1, 1 )
								ModDNIBracketT:setZRot( 34.06 )
								ModDNIBracketT:registerEventHandler( "transition_complete_keyframe", ModDNIBracketTFrame5 )
							end
						end
						
						if event.interrupted then
							ModDNIBracketTFrame4( ModDNIBracketT, event )
							return 
						else
							ModDNIBracketT:beginAnimation( "keyframe", 440, false, true, CoD.TweenType.Back )
							ModDNIBracketT:setLeftRight( true, false, 27, 59 )
							ModDNIBracketT:setTopBottom( true, false, 20, 36 )
							ModDNIBracketT:setRGB( 1, 0, 0 )
							ModDNIBracketT:setZRot( -90 )
							ModDNIBracketT:registerEventHandler( "transition_complete_keyframe", ModDNIBracketTFrame4 )
						end
					end
					
					if event.interrupted then
						ModDNIBracketTFrame3( ModDNIBracketT, event )
						return 
					else
						ModDNIBracketT:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						ModDNIBracketT:setLeftRight( true, false, 29.56, 61.56 )
						ModDNIBracketT:setTopBottom( true, false, 21.81, 37.81 )
						ModDNIBracketT:setZRot( -103.55 )
						ModDNIBracketT:registerEventHandler( "transition_complete_keyframe", ModDNIBracketTFrame3 )
					end
				end
				
				ModDNIBracketT:completeAnimation()
				self.ModDNIBracketT:setLeftRight( true, false, 10, 42 )
				self.ModDNIBracketT:setTopBottom( true, false, 8, 24 )
				self.ModDNIBracketT:setRGB( 1, 1, 1 )
				self.ModDNIBracketT:setZRot( 0 )
				ModDNIBracketTFrame2( ModDNIBracketT, {} )
				local TextBox0Frame2 = function ( TextBox0, event )
					local TextBox0Frame3 = function ( TextBox0, event )
						local TextBox0Frame4 = function ( TextBox0, event )
							local TextBox0Frame5 = function ( TextBox0, event )
								local TextBox0Frame6 = function ( TextBox0, event )
									local TextBox0Frame7 = function ( TextBox0, event )
										local TextBox0Frame8 = function ( TextBox0, event )
											local TextBox0Frame9 = function ( TextBox0, event )
												local TextBox0Frame10 = function ( TextBox0, event )
													local TextBox0Frame11 = function ( TextBox0, event )
														local TextBox0Frame12 = function ( TextBox0, event )
															local TextBox0Frame13 = function ( TextBox0, event )
																local TextBox0Frame14 = function ( TextBox0, event )
																	local TextBox0Frame15 = function ( TextBox0, event )
																		if not event.interrupted then
																			TextBox0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
																		end
																		TextBox0:setAlpha( 1 )
																		if event.interrupted then
																			self.clipFinished( TextBox0, event )
																		else
																			TextBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		TextBox0Frame15( TextBox0, event )
																		return 
																	else
																		TextBox0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																		TextBox0:setAlpha( 1 )
																		TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame15 )
																	end
																end
																
																if event.interrupted then
																	TextBox0Frame14( TextBox0, event )
																	return 
																else
																	TextBox0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
																	TextBox0:setAlpha( 0 )
																	TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame14 )
																end
															end
															
															if event.interrupted then
																TextBox0Frame13( TextBox0, event )
																return 
															else
																TextBox0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
																TextBox0:setAlpha( 1 )
																TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame13 )
															end
														end
														
														if event.interrupted then
															TextBox0Frame12( TextBox0, event )
															return 
														else
															TextBox0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
															TextBox0:setAlpha( 0 )
															TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame12 )
														end
													end
													
													if event.interrupted then
														TextBox0Frame11( TextBox0, event )
														return 
													else
														TextBox0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
														TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame11 )
													end
												end
												
												if event.interrupted then
													TextBox0Frame10( TextBox0, event )
													return 
												else
													TextBox0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													TextBox0:setAlpha( 1 )
													TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame10 )
												end
											end
											
											if event.interrupted then
												TextBox0Frame9( TextBox0, event )
												return 
											else
												TextBox0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												TextBox0:setAlpha( 0 )
												TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame9 )
											end
										end
										
										if event.interrupted then
											TextBox0Frame8( TextBox0, event )
											return 
										else
											TextBox0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
											TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame8 )
										end
									end
									
									if event.interrupted then
										TextBox0Frame7( TextBox0, event )
										return 
									else
										TextBox0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										TextBox0:setAlpha( 1 )
										TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame7 )
									end
								end
								
								if event.interrupted then
									TextBox0Frame6( TextBox0, event )
									return 
								else
									TextBox0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									TextBox0:setAlpha( 0 )
									TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame6 )
								end
							end
							
							if event.interrupted then
								TextBox0Frame5( TextBox0, event )
								return 
							else
								TextBox0:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame5 )
							end
						end
						
						if event.interrupted then
							TextBox0Frame4( TextBox0, event )
							return 
						else
							TextBox0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							TextBox0:setAlpha( 1 )
							TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame4 )
						end
					end
					
					if event.interrupted then
						TextBox0Frame3( TextBox0, event )
						return 
					else
						TextBox0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						TextBox0:setAlpha( 0 )
						TextBox0:registerEventHandler( "transition_complete_keyframe", TextBox0Frame3 )
					end
				end
				
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				TextBox0Frame2( TextBox0, {} )
				local ModDNI0Frame2 = function ( ModDNI0, event )
					local ModDNI0Frame3 = function ( ModDNI0, event )
						if not event.interrupted then
							ModDNI0:beginAnimation( "keyframe", 610, true, true, CoD.TweenType.Linear )
						end
						ModDNI0:setLeftRight( true, false, 9, 43 )
						ModDNI0:setTopBottom( true, false, 11, 45 )
						ModDNI0:setAlpha( 0 )
						ModDNI0:setXRot( -360 )
						ModDNI0:setYRot( -360 )
						ModDNI0:setZRot( -360 )
						if event.interrupted then
							self.clipFinished( ModDNI0, event )
						else
							ModDNI0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ModDNI0Frame3( ModDNI0, event )
						return 
					else
						ModDNI0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						ModDNI0:setAlpha( 0.55 )
						ModDNI0:setXRot( -177.66 )
						ModDNI0:setYRot( -177.66 )
						ModDNI0:setZRot( -177.66 )
						ModDNI0:registerEventHandler( "transition_complete_keyframe", ModDNI0Frame3 )
					end
				end
				
				ModDNI0:completeAnimation()
				self.ModDNI0:setLeftRight( true, false, 9, 43 )
				self.ModDNI0:setTopBottom( true, false, 11, 45 )
				self.ModDNI0:setAlpha( 0 )
				self.ModDNI0:setXRot( 0 )
				self.ModDNI0:setYRot( 0 )
				self.ModDNI0:setZRot( 0 )
				ModDNI0Frame2( ModDNI0, {} )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

