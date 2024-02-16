-- 6b192bb687244813e8f1f2a905fbb82f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipContainerValue" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipContainerPress" )

CoD.AmmoWidgetMP_ClipContainerNew = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_ClipContainerNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_ClipContainerNew )
	self.id = "AmmoWidgetMP_ClipContainerNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local Clip = CoD.AmmoWidget_ClipContainerValue.new( menu, controller )
	Clip:setLeftRight( false, false, -54, 54 )
	Clip:setTopBottom( false, false, -22, 20 )
	Clip:setRGB( 0.94, 0.07, 0.09 )
	Clip.Clip:setText( Engine.Localize( "33" ) )
	self:addElement( Clip )
	self.Clip = Clip
	
	local ClipContainerPress = CoD.AmmoWidget_ClipContainerPress.new( menu, controller )
	ClipContainerPress:setLeftRight( false, false, -54, 54 )
	ClipContainerPress:setTopBottom( false, false, -24, 18 )
	ClipContainerPress.Clip:setText( Engine.Localize( "33" ) )
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
				self.Clip:setRGB( 0.74, 0.74, 0.74 )
				self.Clip:setAlpha( 1 )
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
												if not event.interrupted then
													Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												Clip:setRGB( 0.94, 0.07, 0.09 )
												Clip:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( Clip, event )
												else
													Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Clip:setRGB( 0.83, 0.19, 0.23 )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Clip:setRGB( 0.94, 0.07, 0.09 )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Clip:setRGB( 0.69, 0.36, 0.42 )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Clip:setRGB( 0.94, 0.07, 0.09 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.74, 0.74, 0.74 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
			end,
			Hero = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					Clip:setRGB( 0.74, 0.74, 0.74 )
					Clip:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.74, 0.74, 0.74 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )

				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								local ClipFrame6 = function ( Clip, event )
									local ClipFrame7 = function ( Clip, event )
										local ClipFrame8 = function ( Clip, event )
											local ClipFrame9 = function ( Clip, event )
												if not event.interrupted then
													Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												Clip:setRGB( 0.94, 0.07, 0.09 )
												Clip:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( Clip, event )
												else
													Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Clip:setRGB( 0.83, 0.19, 0.23 )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Clip:setRGB( 0.94, 0.07, 0.09 )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Clip:setRGB( 0.69, 0.36, 0.42 )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Clip:setRGB( 0.94, 0.07, 0.09 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.74, 0.74, 0.74 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
				local ClipContainerPressFrame2 = function ( ClipContainerPress, event )
					if not event.interrupted then
						ClipContainerPress:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					ClipContainerPress:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ClipContainerPress, event )
					else
						ClipContainerPress:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				ClipContainerPressFrame2( ClipContainerPress, {} )
			end
		},
		Hero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Clip:completeAnimation()
				self.Clip:setRGB( 0.59, 0.64, 0.74 )
				self.Clip:setAlpha( 0 )
				self.clipFinished( Clip, {} )

				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
			end,
			LowAmmo = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Clip:setRGB( 0.94, 0.07, 0.09 )
					Clip:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.59, 0.64, 0.74 )
				self.Clip:setAlpha( 0 )
				ClipFrame2( Clip, {} )

				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
			end,
			NoAmmo = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Clip:setRGB( 0.94, 0.07, 0.09 )
					Clip:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.59, 0.64, 0.74 )
				self.Clip:setAlpha( 0 )
				ClipFrame2( Clip, {} )
				local ClipContainerPressFrame2 = function ( ClipContainerPress, event )
					if not event.interrupted then
						ClipContainerPress:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					ClipContainerPress:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ClipContainerPress, event )
					else
						ClipContainerPress:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				ClipContainerPressFrame2( ClipContainerPress, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Clip:setRGB( 0.59, 0.64, 0.74 )
					Clip:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.59, 0.64, 0.74 )
				self.Clip:setAlpha( 0 )
				ClipFrame2( Clip, {} )

				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
			end
		},
		LowAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							if not event.interrupted then
								Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							Clip:setRGB( 0.59, 0.64, 0.74 )
							Clip:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( Clip, event )
							else
								Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							Clip:setRGB( 0.59, 0.64, 0.74 )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.94, 0.07, 0.09 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )

				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )

				self.nextClip = "DefaultClip"
			end,
			Hero = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					Clip:setRGB( 0.59, 0.64, 0.74 )
					Clip:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.94, 0.07, 0.09 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )

				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 0 )
				self.clipFinished( ClipContainerPress, {} )
			end,
			DefaultState = function ()
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
													if not event.interrupted then
														Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													Clip:setRGB( 0.59, 0.64, 0.74 )
													Clip:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( Clip, event )
													else
														Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Clip:setRGB( 0.63, 0.57, 0.66 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Clip:setRGB( 0.59, 0.64, 0.74 )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Clip:setRGB( 0.69, 0.47, 0.55 )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Clip:setRGB( 0.59, 0.64, 0.74 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.94, 0.07, 0.09 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
				local ClipContainerPressFrame2 = function ( ClipContainerPress, event )
					if not event.interrupted then
						ClipContainerPress:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					ClipContainerPress:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ClipContainerPress, event )
					else
						ClipContainerPress:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 1 )
				ClipContainerPressFrame2( ClipContainerPress, {} )
			end
		},
		NoAmmo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						if not event.interrupted then
							Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						Clip:setRGB( 0.94, 0.07, 0.09 )
						Clip:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Clip, event )
						else
							Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Clip:setAlpha( 0.71 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.94, 0.07, 0.09 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )

				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 1 )
				self.clipFinished( ClipContainerPress, {} )

				self.nextClip = "DefaultClip"
			end,
			Hero = function ()
				self:setupElementClipCounter( 2 )

				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					Clip:setRGB( 0.59, 0.64, 0.74 )
					Clip:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.94, 0.07, 0.09 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
				local ClipContainerPressFrame2 = function ( ClipContainerPress, event )
					if not event.interrupted then
						ClipContainerPress:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
					end
					ClipContainerPress:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ClipContainerPress, event )
					else
						ClipContainerPress:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 1 )
				ClipContainerPressFrame2( ClipContainerPress, {} )
			end,
			DefaultState = function ()
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
													if not event.interrupted then
														Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													Clip:setRGB( 0.59, 0.64, 0.74 )
													Clip:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( Clip, event )
													else
														Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Clip:setRGB( 0.63, 0.57, 0.66 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Clip:setRGB( 0.59, 0.64, 0.74 )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Clip:setRGB( 0.69, 0.47, 0.55 )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Clip:setRGB( 0.59, 0.64, 0.74 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setRGB( 0.94, 0.07, 0.09 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )

				ClipContainerPress:completeAnimation()
				self.ClipContainerPress:setAlpha( 1 )
				self.clipFinished( ClipContainerPress, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Clip:close()
		element.ClipContainerPress:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
