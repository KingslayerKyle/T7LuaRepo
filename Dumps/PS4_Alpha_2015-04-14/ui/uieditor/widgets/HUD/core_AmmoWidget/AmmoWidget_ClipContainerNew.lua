require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipContainerValue" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipContainerPress" )

CoD.AmmoWidget_ClipContainerNew = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ClipContainerNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ClipContainerNew )
	self.id = "AmmoWidget_ClipContainerNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Clip = CoD.AmmoWidget_ClipContainerValue.new( menu, controller )
	Clip:setLeftRight( false, false, -54, 54 )
	Clip:setTopBottom( false, false, -22, 20 )
	Clip:setRGB( 1, 0, 0.17 )
	Clip:setAlpha( 0.8 )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Clip.Clip:setText( Engine.Localize( modelValue ) )
		end
	end )
	Clip:mergeStateConditions( {
		{
			stateName = "HeroWeapon",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetCurrentWeapon( menu, controller )
			end
		},
		{
			stateName = "NoAmmo",
			condition = function ( menu, element, event )
				return not WeaponHasAmmo( controller )
			end
		}
	} )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			controller = controller,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoStock" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			controller = controller,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoStock"
		} )
	end )
	Clip:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.ammoInClip" ), function ( model )
		menu:updateElementState( Clip, {
			name = "model_validation",
			controller = controller,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.ammoInClip"
		} )
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	local ClipContainerPress = CoD.AmmoWidget_ClipContainerPress.new( menu, controller )
	ClipContainerPress:setLeftRight( false, false, -54, 54 )
	ClipContainerPress:setTopBottom( false, false, -22, 20 )
	ClipContainerPress:setRGB( 1, 1, 1 )
	ClipContainerPress:mergeStateConditions( {
		{
			stateName = "NoAmmoPress",
			condition = function ( menu, element, event )
				return PulseNoAmmo( controller )
			end
		}
	} )
	ClipContainerPress:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.pulseNoAmmo" ), function ( model )
		menu:updateElementState( ClipContainerPress, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.pulseNoAmmo"
		} )
	end )
	self:addElement( ClipContainerPress )
	self.ClipContainerPress = ClipContainerPress
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 1, 1 )
				self.Clip:setAlpha( 0.8 )
				self.clipFinished( Clip, {} )
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
			end,
			LowAmmo = function ()
				self:setupElementClipCounter( 1 )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								local ClipFrame6 = function ( Clip, event )
									local ClipFrame7 = function ( Clip, event )
										local ClipFrame8 = function ( Clip, event )
											local ClipFrame9 = function ( Clip, event )
												local ClipFrame10 = function ( Clip, event )
													local ClipFrame11 = function ( Clip, event )
														local ClipFrame12 = function ( Clip, event )
															if not event.interrupted then
																Clip:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															end
															Clip:setRGB( 1, 0, 0.17 )
															Clip:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( Clip, event )
															else
																Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															ClipFrame12( Clip, event )
															return 
														else
															Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															Clip:setRGB( 1, 0, 0.17 )
															Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame12 )
														end
													end
													
													if event.interrupted then
														ClipFrame11( Clip, event )
														return 
													else
														Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Clip:setRGB( 1, 1, 1 )
														Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame11 )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Clip:setRGB( 1, 0, 0.17 )
												Clip:setAlpha( 1 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Clip:setAlpha( 0 )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Clip:setAlpha( 1 )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Clip:setAlpha( 0.6 )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 1, 1 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								local ClipFrame6 = function ( Clip, event )
									local ClipFrame7 = function ( Clip, event )
										local ClipFrame8 = function ( Clip, event )
											local ClipFrame9 = function ( Clip, event )
												local ClipFrame10 = function ( Clip, event )
													local ClipFrame11 = function ( Clip, event )
														local ClipFrame12 = function ( Clip, event )
															local ClipFrame13 = function ( Clip, event )
																local ClipFrame14 = function ( Clip, event )
																	local ClipFrame15 = function ( Clip, event )
																		if not event.interrupted then
																			Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
																		end
																		Clip:setRGB( 1, 1, 1 )
																		Clip:setAlpha( 1 )
																		if event.interrupted then
																			self.clipFinished( Clip, event )
																		else
																			Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		ClipFrame15( Clip, event )
																		return 
																	else
																		Clip:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																		Clip:setRGB( 1, 1, 1 )
																		Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame15 )
																	end
																end
																
																if event.interrupted then
																	ClipFrame14( Clip, event )
																	return 
																else
																	Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame14 )
																end
															end
															
															if event.interrupted then
																ClipFrame13( Clip, event )
																return 
															else
																Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																Clip:setRGB( 1, 0.33, 0.11 )
																Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame13 )
															end
														end
														
														if event.interrupted then
															ClipFrame12( Clip, event )
															return 
														else
															Clip:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame12 )
														end
													end
													
													if event.interrupted then
														ClipFrame11( Clip, event )
														return 
													else
														Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Clip:setRGB( 1, 0.7, 0.4 )
														Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame11 )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Clip:setRGB( 1, 0.33, 0.11 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Clip:setRGB( 1, 0.25, 0 )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Clip:setRGB( 1, 0, 0.17 )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Clip:setRGB( 1, 0.33, 0.11 )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 1, 0, 0.17 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
				self.nextClip = "DefaultClip"
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Clip:completeAnimation()
				self.Clip:setAlpha( 0.8 )
				self.clipFinished( Clip, {} )
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 1 )
				self.clipFinished( ClipContainerPress, {} )
			end
		}
	}
	self.close = function ( self )
		self.Clip:close()
		self.ClipContainerPress:close()
		CoD.AmmoWidget_ClipContainerNew.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

