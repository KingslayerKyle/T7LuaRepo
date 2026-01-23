require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_HealthStateRegen" )

CoD.DamageWidget_HealthState = InheritFrom( LUI.UIElement )
CoD.DamageWidget_HealthState.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_HealthState )
	self.id = "DamageWidget_HealthState"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 58 )
	self.anyChildUsesUpdateState = true
	
	local ImgStateShape = LUI.UIImage.new()
	ImgStateShape:setLeftRight( true, false, 0, 47.33 )
	ImgStateShape:setTopBottom( true, false, 0, 57.33 )
	ImgStateShape:setAlpha( 0 )
	ImgStateShape:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityfill" ) )
	self:addElement( ImgStateShape )
	self.ImgStateShape = ImgStateShape
	
	local HealthStateRegen = CoD.DamageWidget_HealthStateRegen.new( menu, controller )
	HealthStateRegen:setLeftRight( true, false, 0, 77.34 )
	HealthStateRegen:setTopBottom( true, false, 0, 77.34 )
	HealthStateRegen:mergeStateConditions( {
		{
			stateName = "Regen",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "hudItems.regenDelayProgress", 1 )
			end
		}
	} )
	HealthStateRegen:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.regenDelayProgress" ), function ( model )
		menu:updateElementState( HealthStateRegen, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.regenDelayProgress"
		} )
	end )
	self:addElement( HealthStateRegen )
	self.HealthStateRegen = HealthStateRegen
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 1, 1 )
				self.ImgStateShape:setAlpha( 0 )
				self.clipFinished( ImgStateShape, {} )
			end
		},
		Normal = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					local ImgStateShapeFrame3 = function ( ImgStateShape, event )
						local ImgStateShapeFrame4 = function ( ImgStateShape, event )
							local ImgStateShapeFrame5 = function ( ImgStateShape, event )
								local ImgStateShapeFrame6 = function ( ImgStateShape, event )
									local ImgStateShapeFrame7 = function ( ImgStateShape, event )
										local ImgStateShapeFrame8 = function ( ImgStateShape, event )
											local ImgStateShapeFrame9 = function ( ImgStateShape, event )
												local ImgStateShapeFrame10 = function ( ImgStateShape, event )
													local ImgStateShapeFrame11 = function ( ImgStateShape, event )
														if not event.interrupted then
															ImgStateShape:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
														end
														ImgStateShape:setRGB( 1, 1, 1 )
														ImgStateShape:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( ImgStateShape, event )
														else
															ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														ImgStateShapeFrame11( ImgStateShape, event )
														return 
													else
														ImgStateShape:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														ImgStateShape:setAlpha( 0.4 )
														ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame11 )
													end
												end
												
												if event.interrupted then
													ImgStateShapeFrame10( ImgStateShape, event )
													return 
												else
													ImgStateShape:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame10 )
												end
											end
											
											if event.interrupted then
												ImgStateShapeFrame9( ImgStateShape, event )
												return 
											else
												ImgStateShape:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ImgStateShape:setAlpha( 0 )
												ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame9 )
											end
										end
										
										if event.interrupted then
											ImgStateShapeFrame8( ImgStateShape, event )
											return 
										else
											ImgStateShape:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											ImgStateShape:setAlpha( 0.2 )
											ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame8 )
										end
									end
									
									if event.interrupted then
										ImgStateShapeFrame7( ImgStateShape, event )
										return 
									else
										ImgStateShape:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame7 )
									end
								end
								
								if event.interrupted then
									ImgStateShapeFrame6( ImgStateShape, event )
									return 
								else
									ImgStateShape:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ImgStateShape:setAlpha( 1 )
									ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame6 )
								end
							end
							
							if event.interrupted then
								ImgStateShapeFrame5( ImgStateShape, event )
								return 
							else
								ImgStateShape:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgStateShapeFrame4( ImgStateShape, event )
							return 
						else
							ImgStateShape:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ImgStateShape:setAlpha( 0 )
							ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShapeFrame3( ImgStateShape, event )
						return 
					else
						ImgStateShape:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame3 )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 1, 1 )
				self.ImgStateShape:setAlpha( 0.4 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end,
			Medium = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					local ImgStateShapeFrame3 = function ( ImgStateShape, event )
						local ImgStateShapeFrame4 = function ( ImgStateShape, event )
							local ImgStateShapeFrame5 = function ( ImgStateShape, event )
								local ImgStateShapeFrame6 = function ( ImgStateShape, event )
									local ImgStateShapeFrame7 = function ( ImgStateShape, event )
										local ImgStateShapeFrame8 = function ( ImgStateShape, event )
											local ImgStateShapeFrame9 = function ( ImgStateShape, event )
												local ImgStateShapeFrame10 = function ( ImgStateShape, event )
													if not event.interrupted then
														ImgStateShape:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
													end
													ImgStateShape:setRGB( 1, 0.83, 0 )
													ImgStateShape:setAlpha( 0.4 )
													if event.interrupted then
														self.clipFinished( ImgStateShape, event )
													else
														ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ImgStateShapeFrame10( ImgStateShape, event )
													return 
												else
													ImgStateShape:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													ImgStateShape:setRGB( 1, 0.87, 0.22 )
													ImgStateShape:setAlpha( 0.32 )
													ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame10 )
												end
											end
											
											if event.interrupted then
												ImgStateShapeFrame9( ImgStateShape, event )
												return 
											else
												ImgStateShape:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												ImgStateShape:setRGB( 1, 0.87, 0.25 )
												ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame9 )
											end
										end
										
										if event.interrupted then
											ImgStateShapeFrame8( ImgStateShape, event )
											return 
										else
											ImgStateShape:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											ImgStateShape:setRGB( 1, 0.88, 0.32 )
											ImgStateShape:setAlpha( 0 )
											ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame8 )
										end
									end
									
									if event.interrupted then
										ImgStateShapeFrame7( ImgStateShape, event )
										return 
									else
										ImgStateShape:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										ImgStateShape:setRGB( 1, 0.89, 0.35 )
										ImgStateShape:setAlpha( 0.28 )
										ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame7 )
									end
								end
								
								if event.interrupted then
									ImgStateShapeFrame6( ImgStateShape, event )
									return 
								else
									ImgStateShape:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									ImgStateShape:setRGB( 1, 0.93, 0.57 )
									ImgStateShape:setAlpha( 0.69 )
									ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame6 )
								end
							end
							
							if event.interrupted then
								ImgStateShapeFrame5( ImgStateShape, event )
								return 
							else
								ImgStateShape:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								ImgStateShape:setRGB( 1, 0.93, 0.6 )
								ImgStateShape:setAlpha( 0 )
								ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgStateShapeFrame4( ImgStateShape, event )
							return 
						else
							ImgStateShape:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							ImgStateShape:setRGB( 1, 0.97, 0.8 )
							ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShapeFrame3( ImgStateShape, event )
						return 
					else
						ImgStateShape:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						ImgStateShape:setRGB( 1, 0.98, 0.9 )
						ImgStateShape:setAlpha( 0.82 )
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame3 )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 1, 1 )
				self.ImgStateShape:setAlpha( 0.4 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end
		},
		Medium = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 0.83, 0 )
				self.ImgStateShape:setAlpha( 0.4 )
				self.clipFinished( ImgStateShape, {} )
			end,
			Normal = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					if not event.interrupted then
						ImgStateShape:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ImgStateShape:setRGB( 1, 1, 1 )
					ImgStateShape:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( ImgStateShape, event )
					else
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 0.83, 0 )
				self.ImgStateShape:setAlpha( 0.4 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end,
			Severe = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					local ImgStateShapeFrame3 = function ( ImgStateShape, event )
						local ImgStateShapeFrame4 = function ( ImgStateShape, event )
							local ImgStateShapeFrame5 = function ( ImgStateShape, event )
								if not event.interrupted then
									ImgStateShape:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								end
								ImgStateShape:setRGB( 1, 0.3, 0 )
								ImgStateShape:setAlpha( 0.4 )
								if event.interrupted then
									self.clipFinished( ImgStateShape, event )
								else
									ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ImgStateShapeFrame5( ImgStateShape, event )
								return 
							else
								ImgStateShape:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								ImgStateShape:setRGB( 1, 0.54, 0 )
								ImgStateShape:setAlpha( 0.6 )
								ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgStateShapeFrame4( ImgStateShape, event )
							return 
						else
							ImgStateShape:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							ImgStateShape:setRGB( 1, 0.6, 0 )
							ImgStateShape:setAlpha( 0.18 )
							ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShapeFrame3( ImgStateShape, event )
						return 
					else
						ImgStateShape:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						ImgStateShape:setRGB( 1, 0.74, 0 )
						ImgStateShape:setAlpha( 0.32 )
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame3 )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 0.83, 0 )
				self.ImgStateShape:setAlpha( 0.4 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end
		},
		Severe = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 0.3, 0 )
				self.ImgStateShape:setAlpha( 0.4 )
				self.clipFinished( ImgStateShape, {} )
			end,
			Medium = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					if not event.interrupted then
						ImgStateShape:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ImgStateShape:setRGB( 1, 0.83, 0 )
					ImgStateShape:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( ImgStateShape, event )
					else
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 0.3, 0 )
				self.ImgStateShape:setAlpha( 0.4 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end,
			Normal = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					if not event.interrupted then
						ImgStateShape:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ImgStateShape:setRGB( 1, 1, 1 )
					ImgStateShape:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( ImgStateShape, event )
					else
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 0.3, 0 )
				self.ImgStateShape:setAlpha( 0.4 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end,
			Critical = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					local ImgStateShapeFrame3 = function ( ImgStateShape, event )
						local ImgStateShapeFrame4 = function ( ImgStateShape, event )
							local ImgStateShapeFrame5 = function ( ImgStateShape, event )
								local ImgStateShapeFrame6 = function ( ImgStateShape, event )
									local ImgStateShapeFrame7 = function ( ImgStateShape, event )
										local ImgStateShapeFrame8 = function ( ImgStateShape, event )
											local ImgStateShapeFrame9 = function ( ImgStateShape, event )
												local ImgStateShapeFrame10 = function ( ImgStateShape, event )
													if not event.interrupted then
														ImgStateShape:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													end
													ImgStateShape:setRGB( 0.67, 0, 0.09 )
													ImgStateShape:setAlpha( 0.6 )
													if event.interrupted then
														self.clipFinished( ImgStateShape, event )
													else
														ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ImgStateShapeFrame10( ImgStateShape, event )
													return 
												else
													ImgStateShape:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													ImgStateShape:setRGB( 0.67, 0, 0.09 )
													ImgStateShape:setAlpha( 0.2 )
													ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame10 )
												end
											end
											
											if event.interrupted then
												ImgStateShapeFrame9( ImgStateShape, event )
												return 
											else
												ImgStateShape:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												ImgStateShape:setRGB( 0.71, 0.03, 0.09 )
												ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame9 )
											end
										end
										
										if event.interrupted then
											ImgStateShapeFrame8( ImgStateShape, event )
											return 
										else
											ImgStateShape:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											ImgStateShape:setRGB( 0.75, 0.07, 0.07 )
											ImgStateShape:setAlpha( 0 )
											ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame8 )
										end
									end
									
									if event.interrupted then
										ImgStateShapeFrame7( ImgStateShape, event )
										return 
									else
										ImgStateShape:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										ImgStateShape:setRGB( 0.8, 0.12, 0.06 )
										ImgStateShape:setAlpha( 0.84 )
										ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame7 )
									end
								end
								
								if event.interrupted then
									ImgStateShapeFrame6( ImgStateShape, event )
									return 
								else
									ImgStateShape:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									ImgStateShape:setRGB( 0.83, 0.14, 0.05 )
									ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame6 )
								end
							end
							
							if event.interrupted then
								ImgStateShapeFrame5( ImgStateShape, event )
								return 
							else
								ImgStateShape:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								ImgStateShape:setRGB( 0.89, 0.2, 0.03 )
								ImgStateShape:setAlpha( 0 )
								ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgStateShapeFrame4( ImgStateShape, event )
							return 
						else
							ImgStateShape:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							ImgStateShape:setRGB( 0.94, 0.24, 0.02 )
							ImgStateShape:setAlpha( 0.45 )
							ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShapeFrame3( ImgStateShape, event )
						return 
					else
						ImgStateShape:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ImgStateShape:setRGB( 0.97, 0.27, 0.01 )
						ImgStateShape:setAlpha( 0.44 )
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame3 )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 0.3, 0 )
				self.ImgStateShape:setAlpha( 0.4 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end
		},
		Critical = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					local ImgStateShapeFrame3 = function ( ImgStateShape, event )
						local ImgStateShapeFrame4 = function ( ImgStateShape, event )
							local ImgStateShapeFrame5 = function ( ImgStateShape, event )
								local ImgStateShapeFrame6 = function ( ImgStateShape, event )
									local ImgStateShapeFrame7 = function ( ImgStateShape, event )
										local ImgStateShapeFrame8 = function ( ImgStateShape, event )
											local ImgStateShapeFrame9 = function ( ImgStateShape, event )
												if not event.interrupted then
													ImgStateShape:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
												end
												ImgStateShape:setRGB( 0.67, 0, 0.09 )
												ImgStateShape:setAlpha( 0.6 )
												if event.interrupted then
													self.clipFinished( ImgStateShape, event )
												else
													ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ImgStateShapeFrame9( ImgStateShape, event )
												return 
											else
												ImgStateShape:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												ImgStateShape:setAlpha( 1 )
												ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame9 )
											end
										end
										
										if event.interrupted then
											ImgStateShapeFrame8( ImgStateShape, event )
											return 
										else
											ImgStateShape:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											ImgStateShape:setAlpha( 0.66 )
											ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame8 )
										end
									end
									
									if event.interrupted then
										ImgStateShapeFrame7( ImgStateShape, event )
										return 
									else
										ImgStateShape:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										ImgStateShape:setAlpha( 1 )
										ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame7 )
									end
								end
								
								if event.interrupted then
									ImgStateShapeFrame6( ImgStateShape, event )
									return 
								else
									ImgStateShape:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ImgStateShape:setAlpha( 0.67 )
									ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame6 )
								end
							end
							
							if event.interrupted then
								ImgStateShapeFrame5( ImgStateShape, event )
								return 
							else
								ImgStateShape:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								ImgStateShape:setAlpha( 1 )
								ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgStateShapeFrame4( ImgStateShape, event )
							return 
						else
							ImgStateShape:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							ImgStateShape:setAlpha( 0.61 )
							ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShapeFrame3( ImgStateShape, event )
						return 
					else
						ImgStateShape:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						ImgStateShape:setAlpha( 0.91 )
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame3 )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 0.67, 0, 0.09 )
				self.ImgStateShape:setAlpha( 0.6 )
				ImgStateShapeFrame2( ImgStateShape, {} )
				self.nextClip = "DefaultClip"
			end,
			Severe = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					if not event.interrupted then
						ImgStateShape:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ImgStateShape:setRGB( 1, 0.3, 0 )
					ImgStateShape:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( ImgStateShape, event )
					else
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 0.67, 0, 0.09 )
				self.ImgStateShape:setAlpha( 0.6 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end,
			Normal = function ()
				self:setupElementClipCounter( 1 )
				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					if not event.interrupted then
						ImgStateShape:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					ImgStateShape:setRGB( 1, 1, 1 )
					ImgStateShape:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( ImgStateShape, event )
					else
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 0.67, 0, 0.09 )
				self.ImgStateShape:setAlpha( 0.6 )
				ImgStateShapeFrame2( ImgStateShape, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HealthStateRegen:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

