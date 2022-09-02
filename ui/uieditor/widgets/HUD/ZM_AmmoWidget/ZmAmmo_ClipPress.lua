-- a0d7a45163e9648c421de73fcd0e1156
-- This hash is used for caching, delete to decompile the file again

CoD.ZmAmmo_ClipPress = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_ClipPress.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_ClipPress )
	self.id = "ZmAmmo_ClipPress"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 42 )
	
	local Clip0 = LUI.UIText.new()
	Clip0:setLeftRight( true, false, -4, 104 )
	Clip0:setTopBottom( true, false, -11, 53 )
	Clip0:setRGB( 1, 0, 0.13 )
	Clip0:setTTF( "fonts/WEARETRIPPINShort.ttf" )
	Clip0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Clip0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Clip0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Clip0:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			Clip0:setText( Engine.Localize( ammoInClip ) )
		end
	end )
	self:addElement( Clip0 )
	self.Clip0 = Clip0
	
	local ClipGlowTop = LUI.UIImage.new()
	ClipGlowTop:setLeftRight( true, false, 7.9, 100.1 )
	ClipGlowTop:setTopBottom( true, false, -15.75, 57.75 )
	ClipGlowTop:setRGB( 1, 0.32, 0 )
	ClipGlowTop:setAlpha( 0 )
	ClipGlowTop:setZRot( -4 )
	ClipGlowTop:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	ClipGlowTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ClipGlowTop )
	self.ClipGlowTop = ClipGlowTop
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setAlpha( 0 )
				self.clipFinished( ClipGlowTop, {} )
			end
		},
		NoAmmoPress = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local Clip0Frame2 = function ( Clip0, event )
					local Clip0Frame3 = function ( Clip0, event )
						local Clip0Frame4 = function ( Clip0, event )
							local Clip0Frame5 = function ( Clip0, event )
								local Clip0Frame6 = function ( Clip0, event )
									local Clip0Frame7 = function ( Clip0, event )
										local Clip0Frame8 = function ( Clip0, event )
											local Clip0Frame9 = function ( Clip0, event )
												local Clip0Frame10 = function ( Clip0, event )
													if not event.interrupted then
														Clip0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
													end
													Clip0:setLeftRight( true, false, -56.5, 167.39 )
													Clip0:setTopBottom( true, false, -43.45, 89.23 )
													Clip0:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Clip0, event )
													else
														Clip0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Clip0Frame10( Clip0, event )
													return 
												else
													Clip0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
													Clip0:setLeftRight( true, false, -46.5, 148.39 )
													Clip0:setTopBottom( true, false, -34.45, 81.04 )
													Clip0:setAlpha( 0.84 )
													Clip0:registerEventHandler( "transition_complete_keyframe", Clip0Frame10 )
												end
											end
											
											if event.interrupted then
												Clip0Frame9( Clip0, event )
												return 
											else
												Clip0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												Clip0:setLeftRight( true, false, -25.25, 126.2 )
												Clip0:setTopBottom( true, false, -22.73, 67.02 )
												Clip0:setAlpha( 1 )
												Clip0:registerEventHandler( "transition_complete_keyframe", Clip0Frame9 )
											end
										end
										
										if event.interrupted then
											Clip0Frame8( Clip0, event )
											return 
										else
											Clip0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Clip0:setLeftRight( true, false, -19.94, 120.65 )
											Clip0:setTopBottom( true, false, -19.79, 63.52 )
											Clip0:setAlpha( 0.75 )
											Clip0:registerEventHandler( "transition_complete_keyframe", Clip0Frame8 )
										end
									end
									
									if event.interrupted then
										Clip0Frame7( Clip0, event )
										return 
									else
										Clip0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Clip0:setLeftRight( true, false, -16.4, 116.95 )
										Clip0:setTopBottom( true, false, -17.84, 61.18 )
										Clip0:setAlpha( 0.09 )
										Clip0:registerEventHandler( "transition_complete_keyframe", Clip0Frame7 )
									end
								end
								
								if event.interrupted then
									Clip0Frame6( Clip0, event )
									return 
								else
									Clip0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									Clip0:setLeftRight( true, false, -14.62, 115.1 )
									Clip0:setTopBottom( true, false, -16.86, 60.01 )
									Clip0:setAlpha( 0.5 )
									Clip0:registerEventHandler( "transition_complete_keyframe", Clip0Frame6 )
								end
							end
							
							if event.interrupted then
								Clip0Frame5( Clip0, event )
								return 
							else
								Clip0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Clip0:setLeftRight( true, false, -9.31, 109.55 )
								Clip0:setTopBottom( true, false, -13.93, 56.51 )
								Clip0:setAlpha( 0.25 )
								Clip0:registerEventHandler( "transition_complete_keyframe", Clip0Frame5 )
							end
						end
						
						if event.interrupted then
							Clip0Frame4( Clip0, event )
							return 
						else
							Clip0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Clip0:setLeftRight( true, false, -7.54, 107.7 )
							Clip0:setTopBottom( true, false, -12.95, 55.34 )
							Clip0:setAlpha( 0.72 )
							Clip0:registerEventHandler( "transition_complete_keyframe", Clip0Frame4 )
						end
					end
					
					if event.interrupted then
						Clip0Frame3( Clip0, event )
						return 
					else
						Clip0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Clip0:setLeftRight( true, false, -5.77, 105.85 )
						Clip0:setTopBottom( true, false, -11.98, 54.17 )
						Clip0:setAlpha( 0.08 )
						Clip0:registerEventHandler( "transition_complete_keyframe", Clip0Frame3 )
					end
				end
				
				Clip0:completeAnimation()
				self.Clip0:setLeftRight( true, false, -4, 104 )
				self.Clip0:setTopBottom( true, false, -11, 53 )
				self.Clip0:setAlpha( 0 )
				Clip0Frame2( Clip0, {} )
				local ClipGlowTopFrame2 = function ( ClipGlowTop, event )
					local ClipGlowTopFrame3 = function ( ClipGlowTop, event )
						local ClipGlowTopFrame4 = function ( ClipGlowTop, event )
							local ClipGlowTopFrame5 = function ( ClipGlowTop, event )
								local ClipGlowTopFrame6 = function ( ClipGlowTop, event )
									local ClipGlowTopFrame7 = function ( ClipGlowTop, event )
										if not event.interrupted then
											ClipGlowTop:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
										end
										ClipGlowTop:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ClipGlowTop, event )
										else
											ClipGlowTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ClipGlowTopFrame7( ClipGlowTop, event )
										return 
									else
										ClipGlowTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										ClipGlowTop:registerEventHandler( "transition_complete_keyframe", ClipGlowTopFrame7 )
									end
								end
								
								if event.interrupted then
									ClipGlowTopFrame6( ClipGlowTop, event )
									return 
								else
									ClipGlowTop:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Bounce )
									ClipGlowTop:setAlpha( 1 )
									ClipGlowTop:registerEventHandler( "transition_complete_keyframe", ClipGlowTopFrame6 )
								end
							end
							
							if event.interrupted then
								ClipGlowTopFrame5( ClipGlowTop, event )
								return 
							else
								ClipGlowTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Bounce )
								ClipGlowTop:setAlpha( 0.46 )
								ClipGlowTop:registerEventHandler( "transition_complete_keyframe", ClipGlowTopFrame5 )
							end
						end
						
						if event.interrupted then
							ClipGlowTopFrame4( ClipGlowTop, event )
							return 
						else
							ClipGlowTop:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							ClipGlowTop:registerEventHandler( "transition_complete_keyframe", ClipGlowTopFrame4 )
						end
					end
					
					if event.interrupted then
						ClipGlowTopFrame3( ClipGlowTop, event )
						return 
					else
						ClipGlowTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
						ClipGlowTop:setAlpha( 1 )
						ClipGlowTop:registerEventHandler( "transition_complete_keyframe", ClipGlowTopFrame3 )
					end
				end
				
				ClipGlowTop:completeAnimation()
				self.ClipGlowTop:setAlpha( 0 )
				ClipGlowTopFrame2( ClipGlowTop, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Clip0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

