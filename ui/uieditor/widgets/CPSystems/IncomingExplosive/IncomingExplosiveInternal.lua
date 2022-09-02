-- e5e1190da892e6b486c6a5e2bd7e5c5d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.IncomingExplosive.IncomingExplosive_Triangle" )
require( "ui.uieditor.widgets.CPSystems.IncomingExplosive.IncomingExplosive_Distance" )
require( "ui.uieditor.widgets.CPSystems.IncomingExplosive.IncomingExplosive_FillAll" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.IncomingExplosiveInternal = InheritFrom( LUI.UIElement )
CoD.IncomingExplosiveInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IncomingExplosiveInternal )
	self.id = "IncomingExplosiveInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 176 )
	self:setTopBottom( true, false, 0, 292 )
	self.anyChildUsesUpdateState = true
	
	local ElmTri = CoD.IncomingExplosive_Triangle.new( menu, controller )
	ElmTri:setLeftRight( false, false, -62, 62 )
	ElmTri:setTopBottom( false, true, -173.5, -73.5 )
	ElmTri:setAlpha( 0.5 )
	ElmTri:setZoom( 16 )
	self:addElement( ElmTri )
	self.ElmTri = ElmTri
	
	local Distance = CoD.IncomingExplosive_Distance.new( menu, controller )
	Distance:setLeftRight( true, false, 2, 178 )
	Distance:setTopBottom( true, false, 40.5, 103 )
	Distance:setAlpha( 0 )
	Distance:linkToElementModel( self, nil, false, function ( model )
		Distance:setModel( model, controller )
	end )
	Distance:linkToElementModel( self, "distance", true, function ( model )
		local distance = Engine.GetModelValue( model )
		if distance then
			Distance.IncomingExplosiveDistanceText0.textDistance:setText( Engine.Localize( distance ) )
		end
	end )
	Distance:mergeStateConditions( {
		{
			stateName = "Grenade",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThan( element, controller, "timeLeftPerc", 0 ) and AlwaysTrue()
			end
		}
	} )
	Distance:linkToElementModel( Distance, "timeLeftPerc", true, function ( model )
		menu:updateElementState( Distance, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "timeLeftPerc"
		} )
	end )
	self:addElement( Distance )
	self.Distance = Distance
	
	local FillAll = CoD.IncomingExplosive_FillAll.new( menu, controller )
	FillAll:setLeftRight( true, false, 8, 169 )
	FillAll:setTopBottom( true, false, 82, 202.5 )
	FillAll:setRGB( 0.78, 0.78, 0.78 )
	FillAll:setAlpha( 0 )
	FillAll:setZRot( -120 )
	FillAll:linkToElementModel( self, nil, false, function ( model )
		FillAll:setModel( model, controller )
	end )
	self:addElement( FillAll )
	self.FillAll = FillAll
	
	local AbilityWheelPixel0 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel0:setLeftRight( true, false, 30, 38 )
	AbilityWheelPixel0:setTopBottom( true, false, 108.17, 116.17 )
	AbilityWheelPixel0:setRGB( 1, 0, 0 )
	self:addElement( AbilityWheelPixel0 )
	self.AbilityWheelPixel0 = AbilityWheelPixel0
	
	local AbilityWheelPixel00 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel00:setLeftRight( true, false, 139, 147 )
	AbilityWheelPixel00:setTopBottom( true, false, 108.17, 116.17 )
	AbilityWheelPixel00:setRGB( 1, 0, 0 )
	self:addElement( AbilityWheelPixel00 )
	self.AbilityWheelPixel00 = AbilityWheelPixel00
	
	local AbilityWheelPixel000 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel000:setLeftRight( true, false, 85, 93 )
	AbilityWheelPixel000:setTopBottom( true, false, 201.5, 209.5 )
	AbilityWheelPixel000:setRGB( 1, 0, 0 )
	AbilityWheelPixel000:setAlpha( 0 )
	self:addElement( AbilityWheelPixel000 )
	self.AbilityWheelPixel000 = AbilityWheelPixel000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ElmTri:completeAnimation()
				self.ElmTri:setAlpha( 0 )
				self.ElmTri:setZoom( 20 )
				self.clipFinished( ElmTri, {} )

				Distance:completeAnimation()
				self.Distance:setAlpha( 0 )
				self.clipFinished( Distance, {} )

				FillAll:completeAnimation()
				self.FillAll:setAlpha( 0 )
				self.clipFinished( FillAll, {} )

				AbilityWheelPixel0:completeAnimation()
				self.AbilityWheelPixel0:setAlpha( 0 )
				self.clipFinished( AbilityWheelPixel0, {} )

				AbilityWheelPixel00:completeAnimation()
				self.AbilityWheelPixel00:setAlpha( 0 )
				self.clipFinished( AbilityWheelPixel00, {} )

				AbilityWheelPixel000:completeAnimation()
				self.AbilityWheelPixel000:setAlpha( 0 )
				self.clipFinished( AbilityWheelPixel000, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 6 )

				local f8_local0 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f10_arg0, f10_arg1 )
						local f10_local0 = function ( f11_arg0, f11_arg1 )
							local f11_local0 = function ( f12_arg0, f12_arg1 )
								local f12_local0 = function ( f13_arg0, f13_arg1 )
									local f13_local0 = function ( f14_arg0, f14_arg1 )
										local f14_local0 = function ( f15_arg0, f15_arg1 )
											local f15_local0 = function ( f16_arg0, f16_arg1 )
												local f16_local0 = function ( f17_arg0, f17_arg1 )
													if not f17_arg1.interrupted then
														f17_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													f17_arg0:setAlpha( 1 )
													f17_arg0:setZoom( 0 )
													if f17_arg1.interrupted then
														self.clipFinished( f17_arg0, f17_arg1 )
													else
														f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f16_arg1.interrupted then
													f16_local0( f16_arg0, f16_arg1 )
													return 
												else
													f16_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													f16_arg0:setZoom( 0 )
													f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
												end
											end
											
											if f15_arg1.interrupted then
												f15_local0( f15_arg0, f15_arg1 )
												return 
											else
												f15_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f15_arg0:setAlpha( 0.5 )
												f15_arg0:setZoom( 2 )
												f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
											end
										end
										
										if f14_arg1.interrupted then
											f14_local0( f14_arg0, f14_arg1 )
											return 
										else
											f14_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											f14_arg0:setZoom( 4 )
											f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
										end
									end
									
									if f13_arg1.interrupted then
										f13_local0( f13_arg0, f13_arg1 )
										return 
									else
										f13_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f13_arg0:setAlpha( 1 )
										f13_arg0:setZoom( 8 )
										f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
									end
								end
								
								if f12_arg1.interrupted then
									f12_local0( f12_arg0, f12_arg1 )
									return 
								else
									f12_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f12_arg0:setZoom( 10 )
									f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
								end
							end
							
							if f11_arg1.interrupted then
								f11_local0( f11_arg0, f11_arg1 )
								return 
							else
								f11_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f11_arg0:setAlpha( 0 )
								f11_arg0:setZoom( 14 )
								f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
							end
						end
						
						if f10_arg1.interrupted then
							f10_local0( f10_arg0, f10_arg1 )
							return 
						else
							f10_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f10_arg0:setZoom( 16 )
							f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f9_arg0:setAlpha( 0.5 )
						f9_arg0:setZoom( 18 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				ElmTri:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				ElmTri:setAlpha( 0 )
				ElmTri:setZoom( 20 )
				ElmTri:registerEventHandler( "transition_complete_keyframe", f8_local0 )
				local f8_local1 = function ( f18_arg0, f18_arg1 )
					local f18_local0 = function ( f19_arg0, f19_arg1 )
						local f19_local0 = function ( f20_arg0, f20_arg1 )
							local f20_local0 = function ( f21_arg0, f21_arg1 )
								local f21_local0 = function ( f22_arg0, f22_arg1 )
									if not f22_arg1.interrupted then
										f22_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									f22_arg0:setRGB( 1, 1, 1 )
									f22_arg0:setAlpha( 1 )
									if f22_arg1.interrupted then
										self.clipFinished( f22_arg0, f22_arg1 )
									else
										f22_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f21_arg1.interrupted then
									f21_local0( f21_arg0, f21_arg1 )
									return 
								else
									f21_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
								end
							end
							
							if f20_arg1.interrupted then
								f20_local0( f20_arg0, f20_arg1 )
								return 
							else
								f20_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f20_arg0:setAlpha( 0 )
								f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
							end
						end
						
						if f19_arg1.interrupted then
							f19_local0( f19_arg0, f19_arg1 )
							return 
						else
							f19_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f19_arg0:setRGB( 1, 1, 1 )
							f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
						end
					end
					
					if f18_arg1.interrupted then
						f18_local0( f18_arg0, f18_arg1 )
						return 
					else
						f18_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f18_arg0:setRGB( 0.58, 0.7, 1 )
						f18_arg0:setAlpha( 0.7 )
						f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
					end
				end
				
				Distance:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				Distance:setRGB( 0.37, 0.55, 1 )
				Distance:setAlpha( 0 )
				Distance:registerEventHandler( "transition_complete_keyframe", f8_local1 )
				local f8_local2 = function ( f23_arg0, f23_arg1 )
					local f23_local0 = function ( f24_arg0, f24_arg1 )
						local f24_local0 = function ( f25_arg0, f25_arg1 )
							local f25_local0 = function ( f26_arg0, f26_arg1 )
								local f26_local0 = function ( f27_arg0, f27_arg1 )
									local f27_local0 = function ( f28_arg0, f28_arg1 )
										local f28_local0 = function ( f29_arg0, f29_arg1 )
											local f29_local0 = function ( f30_arg0, f30_arg1 )
												local f30_local0 = function ( f31_arg0, f31_arg1 )
													if not f31_arg1.interrupted then
														f31_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													f31_arg0:setAlpha( 1 )
													if f31_arg1.interrupted then
														self.clipFinished( f31_arg0, f31_arg1 )
													else
														f31_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f30_arg1.interrupted then
													f30_local0( f30_arg0, f30_arg1 )
													return 
												else
													f30_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
												end
											end
											
											if f29_arg1.interrupted then
												f29_local0( f29_arg0, f29_arg1 )
												return 
											else
												f29_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f29_arg0:setAlpha( 0 )
												f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
											end
										end
										
										if f28_arg1.interrupted then
											f28_local0( f28_arg0, f28_arg1 )
											return 
										else
											f28_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
										end
									end
									
									if f27_arg1.interrupted then
										f27_local0( f27_arg0, f27_arg1 )
										return 
									else
										f27_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f27_arg0:setAlpha( 1 )
										f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
									end
								end
								
								if f26_arg1.interrupted then
									f26_local0( f26_arg0, f26_arg1 )
									return 
								else
									f26_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
								end
							end
							
							if f25_arg1.interrupted then
								f25_local0( f25_arg0, f25_arg1 )
								return 
							else
								f25_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f25_arg0:setAlpha( 0 )
								f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
							end
						end
						
						if f24_arg1.interrupted then
							f24_local0( f24_arg0, f24_arg1 )
							return 
						else
							f24_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
						end
					end
					
					if f23_arg1.interrupted then
						f23_local0( f23_arg0, f23_arg1 )
						return 
					else
						f23_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f23_arg0:setAlpha( 0.5 )
						f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
					end
				end
				
				FillAll:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				FillAll:setAlpha( 0 )
				FillAll:registerEventHandler( "transition_complete_keyframe", f8_local2 )
				local AbilityWheelPixel0Frame2 = function ( AbilityWheelPixel0, event )
					if not event.interrupted then
						AbilityWheelPixel0:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					AbilityWheelPixel0:setLeftRight( true, false, 30, 38 )
					AbilityWheelPixel0:setTopBottom( true, false, 108.17, 116.17 )
					AbilityWheelPixel0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel0, event )
					else
						AbilityWheelPixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel0:completeAnimation()
				self.AbilityWheelPixel0:setLeftRight( true, false, -53, -45 )
				self.AbilityWheelPixel0:setTopBottom( true, false, 50.17, 58.17 )
				self.AbilityWheelPixel0:setAlpha( 0 )
				AbilityWheelPixel0Frame2( AbilityWheelPixel0, {} )
				local AbilityWheelPixel00Frame2 = function ( AbilityWheelPixel00, event )
					if not event.interrupted then
						AbilityWheelPixel00:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					AbilityWheelPixel00:setLeftRight( true, false, 139, 147 )
					AbilityWheelPixel00:setTopBottom( true, false, 108.17, 116.17 )
					AbilityWheelPixel00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel00, event )
					else
						AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel00:completeAnimation()
				self.AbilityWheelPixel00:setLeftRight( true, false, 220, 228 )
				self.AbilityWheelPixel00:setTopBottom( true, false, 50.17, 58.17 )
				self.AbilityWheelPixel00:setAlpha( 0 )
				AbilityWheelPixel00Frame2( AbilityWheelPixel00, {} )
				local AbilityWheelPixel000Frame2 = function ( AbilityWheelPixel000, event )
					if not event.interrupted then
						AbilityWheelPixel000:beginAnimation( "keyframe", 70, false, true, CoD.TweenType.Linear )
					end
					AbilityWheelPixel000:setLeftRight( true, false, 85, 93 )
					AbilityWheelPixel000:setTopBottom( true, false, 201.5, 209.5 )
					AbilityWheelPixel000:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel000, event )
					else
						AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel000:completeAnimation()
				self.AbilityWheelPixel000:setLeftRight( true, false, 84.5, 92.5 )
				self.AbilityWheelPixel000:setTopBottom( true, false, 273.5, 281.5 )
				self.AbilityWheelPixel000:setAlpha( 0 )
				AbilityWheelPixel000Frame2( AbilityWheelPixel000, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ElmTri:completeAnimation()
				self.ElmTri:setAlpha( 1 )
				self.ElmTri:setZoom( 0 )
				self.clipFinished( ElmTri, {} )

				Distance:completeAnimation()
				self.Distance:setAlpha( 1 )
				self.clipFinished( Distance, {} )

				FillAll:completeAnimation()
				self.FillAll:setAlpha( 1 )
				self.clipFinished( FillAll, {} )

				AbilityWheelPixel0:completeAnimation()
				self.AbilityWheelPixel0:setLeftRight( true, false, 30, 38 )
				self.AbilityWheelPixel0:setTopBottom( true, false, 108.17, 116.17 )
				self.AbilityWheelPixel0:setAlpha( 1 )
				self.clipFinished( AbilityWheelPixel0, {} )

				AbilityWheelPixel00:completeAnimation()
				self.AbilityWheelPixel00:setLeftRight( true, false, 139, 147 )
				self.AbilityWheelPixel00:setTopBottom( true, false, 108.17, 116.17 )
				self.AbilityWheelPixel00:setAlpha( 1 )
				self.clipFinished( AbilityWheelPixel00, {} )

				AbilityWheelPixel000:completeAnimation()
				self.AbilityWheelPixel000:setLeftRight( true, false, 85, 93 )
				self.AbilityWheelPixel000:setTopBottom( true, false, 201.5, 209.5 )
				self.AbilityWheelPixel000:setAlpha( 1 )
				self.clipFinished( AbilityWheelPixel000, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 6 )

				local ElmTriFrame2 = function ( ElmTri, event )
					local ElmTriFrame3 = function ( ElmTri, event )
						local ElmTriFrame4 = function ( ElmTri, event )
							local ElmTriFrame5 = function ( ElmTri, event )
								local ElmTriFrame6 = function ( ElmTri, event )
									local ElmTriFrame7 = function ( ElmTri, event )
										local ElmTriFrame8 = function ( ElmTri, event )
											local ElmTriFrame9 = function ( ElmTri, event )
												local ElmTriFrame10 = function ( ElmTri, event )
													local ElmTriFrame11 = function ( ElmTri, event )
														local ElmTriFrame12 = function ( ElmTri, event )
															local ElmTriFrame13 = function ( ElmTri, event )
																local ElmTriFrame14 = function ( ElmTri, event )
																	local ElmTriFrame15 = function ( ElmTri, event )
																		if not event.interrupted then
																			ElmTri:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		end
																		ElmTri:setAlpha( 0 )
																		ElmTri:setZoom( 20 )
																		if event.interrupted then
																			self.clipFinished( ElmTri, event )
																		else
																			ElmTri:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		ElmTriFrame15( ElmTri, event )
																		return 
																	else
																		ElmTri:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																		ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame15 )
																	end
																end
																
																if event.interrupted then
																	ElmTriFrame14( ElmTri, event )
																	return 
																else
																	ElmTri:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	ElmTri:setAlpha( 0.5 )
																	ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame14 )
																end
															end
															
															if event.interrupted then
																ElmTriFrame13( ElmTri, event )
																return 
															else
																ElmTri:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame13 )
															end
														end
														
														if event.interrupted then
															ElmTriFrame12( ElmTri, event )
															return 
														else
															ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															ElmTri:setAlpha( 0 )
															ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame12 )
														end
													end
													
													if event.interrupted then
														ElmTriFrame11( ElmTri, event )
														return 
													else
														ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame11 )
													end
												end
												
												if event.interrupted then
													ElmTriFrame10( ElmTri, event )
													return 
												else
													ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													ElmTri:setZoom( 20 )
													ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame10 )
												end
											end
											
											if event.interrupted then
												ElmTriFrame9( ElmTri, event )
												return 
											else
												ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ElmTri:setAlpha( 0.5 )
												ElmTri:setZoom( 18.18 )
												ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame9 )
											end
										end
										
										if event.interrupted then
											ElmTriFrame8( ElmTri, event )
											return 
										else
											ElmTri:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											ElmTri:setZoom( 16.36 )
											ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame8 )
										end
									end
									
									if event.interrupted then
										ElmTriFrame7( ElmTri, event )
										return 
									else
										ElmTri:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										ElmTri:setAlpha( 0 )
										ElmTri:setZoom( 12.73 )
										ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame7 )
									end
								end
								
								if event.interrupted then
									ElmTriFrame6( ElmTri, event )
									return 
								else
									ElmTri:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									ElmTri:setZoom( 10.91 )
									ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame6 )
								end
							end
							
							if event.interrupted then
								ElmTriFrame5( ElmTri, event )
								return 
							else
								ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ElmTri:setAlpha( 1 )
								ElmTri:setZoom( 5.45 )
								ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame5 )
							end
						end
						
						if event.interrupted then
							ElmTriFrame4( ElmTri, event )
							return 
						else
							ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ElmTri:setZoom( 3.64 )
							ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame4 )
						end
					end
					
					if event.interrupted then
						ElmTriFrame3( ElmTri, event )
						return 
					else
						ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ElmTri:setAlpha( 0.5 )
						ElmTri:setZoom( 1.82 )
						ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame3 )
					end
				end
				
				ElmTri:completeAnimation()
				self.ElmTri:setAlpha( 1 )
				self.ElmTri:setZoom( 0 )
				ElmTriFrame2( ElmTri, {} )
				local f36_local1 = function ( f51_arg0, f51_arg1 )
					local f51_local0 = function ( f52_arg0, f52_arg1 )
						local f52_local0 = function ( f53_arg0, f53_arg1 )
							local f53_local0 = function ( f54_arg0, f54_arg1 )
								local f54_local0 = function ( f55_arg0, f55_arg1 )
									local f55_local0 = function ( f56_arg0, f56_arg1 )
										local f56_local0 = function ( f57_arg0, f57_arg1 )
											local f57_local0 = function ( f58_arg0, f58_arg1 )
												local f58_local0 = function ( f59_arg0, f59_arg1 )
													local f59_local0 = function ( f60_arg0, f60_arg1 )
														local f60_local0 = function ( f61_arg0, f61_arg1 )
															local f61_local0 = function ( f62_arg0, f62_arg1 )
																local f62_local0 = function ( f63_arg0, f63_arg1 )
																	if not f63_arg1.interrupted then
																		f63_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	end
																	f63_arg0:setAlpha( 0 )
																	if f63_arg1.interrupted then
																		self.clipFinished( f63_arg0, f63_arg1 )
																	else
																		f63_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if f62_arg1.interrupted then
																	f62_local0( f62_arg0, f62_arg1 )
																	return 
																else
																	f62_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
																end
															end
															
															if f61_arg1.interrupted then
																f61_local0( f61_arg0, f61_arg1 )
																return 
															else
																f61_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																f61_arg0:setAlpha( 0.5 )
																f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
															end
														end
														
														if f60_arg1.interrupted then
															f60_local0( f60_arg0, f60_arg1 )
															return 
														else
															f60_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
														end
													end
													
													if f59_arg1.interrupted then
														f59_local0( f59_arg0, f59_arg1 )
														return 
													else
														f59_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f59_arg0:setAlpha( 0 )
														f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
													end
												end
												
												if f58_arg1.interrupted then
													f58_local0( f58_arg0, f58_arg1 )
													return 
												else
													f58_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
												end
											end
											
											if f57_arg1.interrupted then
												f57_local0( f57_arg0, f57_arg1 )
												return 
											else
												f57_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f57_arg0:setAlpha( 0.5 )
												f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
											end
										end
										
										if f56_arg1.interrupted then
											f56_local0( f56_arg0, f56_arg1 )
											return 
										else
											f56_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
										end
									end
									
									if f55_arg1.interrupted then
										f55_local0( f55_arg0, f55_arg1 )
										return 
									else
										f55_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f55_arg0:setAlpha( 0 )
										f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
									end
								end
								
								if f54_arg1.interrupted then
									f54_local0( f54_arg0, f54_arg1 )
									return 
								else
									f54_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
								end
							end
							
							if f53_arg1.interrupted then
								f53_local0( f53_arg0, f53_arg1 )
								return 
							else
								f53_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f53_arg0:setAlpha( 1 )
								f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
							end
						end
						
						if f52_arg1.interrupted then
							f52_local0( f52_arg0, f52_arg1 )
							return 
						else
							f52_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
						end
					end
					
					if f51_arg1.interrupted then
						f51_local0( f51_arg0, f51_arg1 )
						return 
					else
						f51_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f51_arg0:setAlpha( 0 )
						f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
					end
				end
				
				Distance:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				Distance:setAlpha( 1 )
				Distance:registerEventHandler( "transition_complete_keyframe", f36_local1 )

				FillAll:completeAnimation()
				self.FillAll:setAlpha( 1 )
				self.clipFinished( FillAll, {} )
				local AbilityWheelPixel0Frame2 = function ( AbilityWheelPixel0, event )
					if not event.interrupted then
						AbilityWheelPixel0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel0:setLeftRight( true, false, -61, -53 )
					AbilityWheelPixel0:setTopBottom( true, false, 59.75, 67.75 )
					AbilityWheelPixel0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel0, event )
					else
						AbilityWheelPixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel0:completeAnimation()
				self.AbilityWheelPixel0:setLeftRight( true, false, 30, 38 )
				self.AbilityWheelPixel0:setTopBottom( true, false, 108.17, 116.17 )
				self.AbilityWheelPixel0:setAlpha( 1 )
				AbilityWheelPixel0Frame2( AbilityWheelPixel0, {} )
				local AbilityWheelPixel00Frame2 = function ( AbilityWheelPixel00, event )
					if not event.interrupted then
						AbilityWheelPixel00:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel00:setLeftRight( true, false, 234, 242 )
					AbilityWheelPixel00:setTopBottom( true, false, 63.75, 71.75 )
					AbilityWheelPixel00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel00, event )
					else
						AbilityWheelPixel00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel00:completeAnimation()
				self.AbilityWheelPixel00:setLeftRight( true, false, 139, 147 )
				self.AbilityWheelPixel00:setTopBottom( true, false, 108.17, 116.17 )
				self.AbilityWheelPixel00:setAlpha( 1 )
				AbilityWheelPixel00Frame2( AbilityWheelPixel00, {} )
				local AbilityWheelPixel000Frame2 = function ( AbilityWheelPixel000, event )
					if not event.interrupted then
						AbilityWheelPixel000:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					AbilityWheelPixel000:setLeftRight( true, false, 84.5, 92.5 )
					AbilityWheelPixel000:setTopBottom( true, false, 300.5, 308.5 )
					AbilityWheelPixel000:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityWheelPixel000, event )
					else
						AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityWheelPixel000:completeAnimation()
				self.AbilityWheelPixel000:setLeftRight( true, false, 85, 93 )
				self.AbilityWheelPixel000:setTopBottom( true, false, 201.5, 209.5 )
				self.AbilityWheelPixel000:setAlpha( 1 )
				AbilityWheelPixel000Frame2( AbilityWheelPixel000, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "visible" )
			end
		}
	} )
	self:linkToElementModel( self, "visible", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "visible"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ElmTri:close()
		element.Distance:close()
		element.FillAll:close()
		element.AbilityWheelPixel0:close()
		element.AbilityWheelPixel00:close()
		element.AbilityWheelPixel000:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

