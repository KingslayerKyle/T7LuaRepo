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
	ElmTri:setRGB( 1, 1, 1 )
	ElmTri:setAlpha( 0.5 )
	ElmTri:setZoom( 16 )
	self:addElement( ElmTri )
	self.ElmTri = ElmTri
	
	local Distance = CoD.IncomingExplosive_Distance.new( menu, controller )
	Distance:setLeftRight( true, false, 2, 178 )
	Distance:setTopBottom( true, false, 40.5, 103 )
	Distance:setRGB( 1, 1, 1 )
	Distance:setAlpha( 0 )
	Distance:linkToElementModel( self, nil, false, function ( model )
		Distance:setModel( model, controller )
	end )
	Distance:linkToElementModel( self, "distance", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Distance.IncomingExplosiveDistanceText0.textDistance:setText( Engine.Localize( modelValue ) )
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
				local ElmTriFrame2 = function ( ElmTri, event )
					local ElmTriFrame3 = function ( ElmTri, event )
						local ElmTriFrame4 = function ( ElmTri, event )
							local ElmTriFrame5 = function ( ElmTri, event )
								local ElmTriFrame6 = function ( ElmTri, event )
									local ElmTriFrame7 = function ( ElmTri, event )
										local ElmTriFrame8 = function ( ElmTri, event )
											local ElmTriFrame9 = function ( ElmTri, event )
												local ElmTriFrame10 = function ( ElmTri, event )
													if not event.interrupted then
														ElmTri:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													ElmTri:setAlpha( 1 )
													ElmTri:setZoom( 0 )
													if event.interrupted then
														self.clipFinished( ElmTri, event )
													else
														ElmTri:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ElmTriFrame10( ElmTri, event )
													return 
												else
													ElmTri:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													ElmTri:setZoom( 0 )
													ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame10 )
												end
											end
											
											if event.interrupted then
												ElmTriFrame9( ElmTri, event )
												return 
											else
												ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ElmTri:setAlpha( 0.5 )
												ElmTri:setZoom( 2 )
												ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame9 )
											end
										end
										
										if event.interrupted then
											ElmTriFrame8( ElmTri, event )
											return 
										else
											ElmTri:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											ElmTri:setZoom( 4 )
											ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame8 )
										end
									end
									
									if event.interrupted then
										ElmTriFrame7( ElmTri, event )
										return 
									else
										ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										ElmTri:setAlpha( 1 )
										ElmTri:setZoom( 8 )
										ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame7 )
									end
								end
								
								if event.interrupted then
									ElmTriFrame6( ElmTri, event )
									return 
								else
									ElmTri:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									ElmTri:setZoom( 10 )
									ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame6 )
								end
							end
							
							if event.interrupted then
								ElmTriFrame5( ElmTri, event )
								return 
							else
								ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ElmTri:setAlpha( 0 )
								ElmTri:setZoom( 14 )
								ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame5 )
							end
						end
						
						if event.interrupted then
							ElmTriFrame4( ElmTri, event )
							return 
						else
							ElmTri:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							ElmTri:setZoom( 16 )
							ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame4 )
						end
					end
					
					if event.interrupted then
						ElmTriFrame3( ElmTri, event )
						return 
					else
						ElmTri:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						ElmTri:setAlpha( 0.5 )
						ElmTri:setZoom( 18 )
						ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame3 )
					end
				end
				
				ElmTri:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				ElmTri:setAlpha( 0 )
				ElmTri:setZoom( 20 )
				ElmTri:registerEventHandler( "transition_complete_keyframe", ElmTriFrame2 )
				local DistanceFrame2 = function ( Distance, event )
					local DistanceFrame3 = function ( Distance, event )
						local DistanceFrame4 = function ( Distance, event )
							local DistanceFrame5 = function ( Distance, event )
								local DistanceFrame6 = function ( Distance, event )
									if not event.interrupted then
										Distance:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									Distance:setRGB( 1, 1, 1 )
									Distance:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Distance, event )
									else
										Distance:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									DistanceFrame6( Distance, event )
									return 
								else
									Distance:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame6 )
								end
							end
							
							if event.interrupted then
								DistanceFrame5( Distance, event )
								return 
							else
								Distance:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Distance:setAlpha( 0 )
								Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame5 )
							end
						end
						
						if event.interrupted then
							DistanceFrame4( Distance, event )
							return 
						else
							Distance:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Distance:setRGB( 1, 1, 1 )
							Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame4 )
						end
					end
					
					if event.interrupted then
						DistanceFrame3( Distance, event )
						return 
					else
						Distance:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						Distance:setRGB( 0.58, 0.7, 1 )
						Distance:setAlpha( 0.7 )
						Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame3 )
					end
				end
				
				Distance:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				Distance:setRGB( 0.37, 0.55, 1 )
				Distance:setAlpha( 0 )
				Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame2 )
				local FillAllFrame2 = function ( FillAll, event )
					local FillAllFrame3 = function ( FillAll, event )
						local FillAllFrame4 = function ( FillAll, event )
							local FillAllFrame5 = function ( FillAll, event )
								local FillAllFrame6 = function ( FillAll, event )
									local FillAllFrame7 = function ( FillAll, event )
										local FillAllFrame8 = function ( FillAll, event )
											local FillAllFrame9 = function ( FillAll, event )
												local FillAllFrame10 = function ( FillAll, event )
													if not event.interrupted then
														FillAll:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													FillAll:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( FillAll, event )
													else
														FillAll:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													FillAllFrame10( FillAll, event )
													return 
												else
													FillAll:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame10 )
												end
											end
											
											if event.interrupted then
												FillAllFrame9( FillAll, event )
												return 
											else
												FillAll:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												FillAll:setAlpha( 0 )
												FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame9 )
											end
										end
										
										if event.interrupted then
											FillAllFrame8( FillAll, event )
											return 
										else
											FillAll:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame8 )
										end
									end
									
									if event.interrupted then
										FillAllFrame7( FillAll, event )
										return 
									else
										FillAll:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										FillAll:setAlpha( 1 )
										FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame7 )
									end
								end
								
								if event.interrupted then
									FillAllFrame6( FillAll, event )
									return 
								else
									FillAll:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame6 )
								end
							end
							
							if event.interrupted then
								FillAllFrame5( FillAll, event )
								return 
							else
								FillAll:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FillAll:setAlpha( 0 )
								FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame5 )
							end
						end
						
						if event.interrupted then
							FillAllFrame4( FillAll, event )
							return 
						else
							FillAll:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame4 )
						end
					end
					
					if event.interrupted then
						FillAllFrame3( FillAll, event )
						return 
					else
						FillAll:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						FillAll:setAlpha( 0.5 )
						FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame3 )
					end
				end
				
				FillAll:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				FillAll:setAlpha( 0 )
				FillAll:registerEventHandler( "transition_complete_keyframe", FillAllFrame2 )
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
				local DistanceFrame2 = function ( Distance, event )
					local DistanceFrame3 = function ( Distance, event )
						local DistanceFrame4 = function ( Distance, event )
							local DistanceFrame5 = function ( Distance, event )
								local DistanceFrame6 = function ( Distance, event )
									local DistanceFrame7 = function ( Distance, event )
										local DistanceFrame8 = function ( Distance, event )
											local DistanceFrame9 = function ( Distance, event )
												local DistanceFrame10 = function ( Distance, event )
													local DistanceFrame11 = function ( Distance, event )
														local DistanceFrame12 = function ( Distance, event )
															local DistanceFrame13 = function ( Distance, event )
																local DistanceFrame14 = function ( Distance, event )
																	if not event.interrupted then
																		Distance:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	end
																	Distance:setAlpha( 0 )
																	if event.interrupted then
																		self.clipFinished( Distance, event )
																	else
																		Distance:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	DistanceFrame14( Distance, event )
																	return 
																else
																	Distance:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame14 )
																end
															end
															
															if event.interrupted then
																DistanceFrame13( Distance, event )
																return 
															else
																Distance:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																Distance:setAlpha( 0.5 )
																Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame13 )
															end
														end
														
														if event.interrupted then
															DistanceFrame12( Distance, event )
															return 
														else
															Distance:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame12 )
														end
													end
													
													if event.interrupted then
														DistanceFrame11( Distance, event )
														return 
													else
														Distance:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Distance:setAlpha( 0 )
														Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame11 )
													end
												end
												
												if event.interrupted then
													DistanceFrame10( Distance, event )
													return 
												else
													Distance:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame10 )
												end
											end
											
											if event.interrupted then
												DistanceFrame9( Distance, event )
												return 
											else
												Distance:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Distance:setAlpha( 0.5 )
												Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame9 )
											end
										end
										
										if event.interrupted then
											DistanceFrame8( Distance, event )
											return 
										else
											Distance:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame8 )
										end
									end
									
									if event.interrupted then
										DistanceFrame7( Distance, event )
										return 
									else
										Distance:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Distance:setAlpha( 0 )
										Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame7 )
									end
								end
								
								if event.interrupted then
									DistanceFrame6( Distance, event )
									return 
								else
									Distance:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame6 )
								end
							end
							
							if event.interrupted then
								DistanceFrame5( Distance, event )
								return 
							else
								Distance:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Distance:setAlpha( 1 )
								Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame5 )
							end
						end
						
						if event.interrupted then
							DistanceFrame4( Distance, event )
							return 
						else
							Distance:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame4 )
						end
					end
					
					if event.interrupted then
						DistanceFrame3( Distance, event )
						return 
					else
						Distance:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Distance:setAlpha( 0 )
						Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame3 )
					end
				end
				
				Distance:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				Distance:setAlpha( 1 )
				Distance:registerEventHandler( "transition_complete_keyframe", DistanceFrame2 )
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
	self.close = function ( self )
		self.ElmTri:close()
		self.Distance:close()
		self.FillAll:close()
		self.AbilityWheelPixel0:close()
		self.AbilityWheelPixel00:close()
		self.AbilityWheelPixel000:close()
		CoD.IncomingExplosiveInternal.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

