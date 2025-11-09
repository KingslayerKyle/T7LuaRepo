LUI.createMenu.SecurityCameraOverlay = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SecurityCameraOverlay" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SecurityCameraOverlay.buttonPrompts" )
	local f1_local1 = self
	
	local Scanlines = LUI.UIImage.new()
	Scanlines:setLeftRight( true, true, 0, 0 )
	Scanlines:setTopBottom( false, false, -360, 360 )
	Scanlines:setAlpha( 0.1 )
	Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	Scanlines:setShaderVector( 0, 2, 0, 0, 0 )
	Scanlines:setShaderVector( 1, 5, 0, 0, 0 )
	Scanlines:setShaderVector( 2, 0, 0, 0, 0 )
	self:addElement( Scanlines )
	self.Scanlines = Scanlines
	
	local DigitalNoise = LUI.UIImage.new()
	DigitalNoise:setLeftRight( true, true, 0, 0 )
	DigitalNoise:setTopBottom( false, false, 0, 0 )
	DigitalNoise:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
	DigitalNoise:setShaderVector( 0, 0.1, 0, 0, 0 )
	DigitalNoise:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( DigitalNoise )
	self.DigitalNoise = DigitalNoise
	
	local VignetteImage = LUI.UIImage.new()
	VignetteImage:setLeftRight( true, true, 0, 0 )
	VignetteImage:setTopBottom( false, false, -360, 360 )
	VignetteImage:setAlpha( 0 )
	VignetteImage:setImage( RegisterImage( "uie_img_t7_hud_cp_aquifer_securitycamvignette" ) )
	self:addElement( VignetteImage )
	self.VignetteImage = VignetteImage
	
	local Overlay = LUI.UIImage.new()
	Overlay:setLeftRight( true, true, 0, 0 )
	Overlay:setTopBottom( false, false, -360, 360 )
	Overlay:setImage( RegisterImage( "uie_img_t7_hud_cp_aquifer_securitycamoverlay" ) )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	local IncomingText = LUI.UIText.new()
	IncomingText:setLeftRight( false, false, -300, 300 )
	IncomingText:setTopBottom( true, false, 360, 420 )
	IncomingText:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_INCOMING" ) )
	IncomingText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	IncomingText:setLetterSpacing( 5 )
	IncomingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	IncomingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( IncomingText )
	self.IncomingText = IncomingText
	
	local TransmissionText = LUI.UIText.new()
	TransmissionText:setLeftRight( false, false, -300, 300 )
	TransmissionText:setTopBottom( true, false, 280, 360 )
	TransmissionText:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_TRANSMISSION" ) )
	TransmissionText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TransmissionText:setLetterSpacing( 5 )
	TransmissionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TransmissionText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( TransmissionText )
	self.TransmissionText = TransmissionText
	
	local BlackTop = LUI.UIImage.new()
	BlackTop:setLeftRight( true, true, 0, 0 )
	BlackTop:setTopBottom( false, false, 0, 0 )
	BlackTop:setRGB( 0, 0, 0 )
	self:addElement( BlackTop )
	self.BlackTop = BlackTop
	
	local BlackBottom = LUI.UIImage.new()
	BlackBottom:setLeftRight( true, true, 0, 0 )
	BlackBottom:setTopBottom( false, false, 0, 0 )
	BlackBottom:setRGB( 0, 0, 0 )
	self:addElement( BlackBottom )
	self.BlackBottom = BlackBottom
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				local ScanlinesFrame2 = function ( Scanlines, event )
					local ScanlinesFrame3 = function ( Scanlines, event )
						if not event.interrupted then
							Scanlines:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Scanlines:setLeftRight( true, true, 0, 0 )
						Scanlines:setTopBottom( false, false, -360, 360 )
						Scanlines:setAlpha( 0.2 )
						Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
						Scanlines:setShaderVector( 0, 2, 0, 0, 0 )
						Scanlines:setShaderVector( 1, 5, 0, 0, 0 )
						Scanlines:setShaderVector( 2, 0, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( Scanlines, event )
						else
							Scanlines:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScanlinesFrame3( Scanlines, event )
						return 
					else
						Scanlines:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
						Scanlines:setAlpha( 0.2 )
						Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame3 )
					end
				end
				
				Scanlines:completeAnimation()
				self.Scanlines:setLeftRight( true, true, 0, 0 )
				self.Scanlines:setTopBottom( false, false, 0, 0 )
				self.Scanlines:setAlpha( 0 )
				self.Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.Scanlines:setShaderVector( 0, 2, 0, 0, 0 )
				self.Scanlines:setShaderVector( 1, 5, 0, 0, 0 )
				self.Scanlines:setShaderVector( 2, 0, 0, 0, 0 )
				ScanlinesFrame2( Scanlines, {} )
				local DigitalNoiseFrame2 = function ( DigitalNoise, event )
					local DigitalNoiseFrame3 = function ( DigitalNoise, event )
						if not event.interrupted then
							DigitalNoise:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						DigitalNoise:setLeftRight( true, true, 0, 0 )
						DigitalNoise:setTopBottom( false, false, -360, 360 )
						DigitalNoise:setAlpha( 0.2 )
						DigitalNoise:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
						DigitalNoise:setShaderVector( 0, 0.5, 0, 0, 0 )
						DigitalNoise:setShaderVector( 1, 1, 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( DigitalNoise, event )
						else
							DigitalNoise:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DigitalNoiseFrame3( DigitalNoise, event )
						return 
					else
						DigitalNoise:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
						DigitalNoise:setAlpha( 0.2 )
						DigitalNoise:registerEventHandler( "transition_complete_keyframe", DigitalNoiseFrame3 )
					end
				end
				
				DigitalNoise:completeAnimation()
				self.DigitalNoise:setLeftRight( true, true, 0, 0 )
				self.DigitalNoise:setTopBottom( false, false, 0, 0 )
				self.DigitalNoise:setAlpha( 0 )
				self.DigitalNoise:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
				self.DigitalNoise:setShaderVector( 0, 0.5, 0, 0, 0 )
				self.DigitalNoise:setShaderVector( 1, 1, 0, 0, 0 )
				DigitalNoiseFrame2( DigitalNoise, {} )
				local VignetteImageFrame2 = function ( VignetteImage, event )
					local VignetteImageFrame3 = function ( VignetteImage, event )
						if not event.interrupted then
							VignetteImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						VignetteImage:setLeftRight( true, true, 0, 0 )
						VignetteImage:setTopBottom( false, false, -360, 360 )
						VignetteImage:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VignetteImage, event )
						else
							VignetteImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VignetteImageFrame3( VignetteImage, event )
						return 
					else
						VignetteImage:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
						VignetteImage:registerEventHandler( "transition_complete_keyframe", VignetteImageFrame3 )
					end
				end
				
				VignetteImage:completeAnimation()
				self.VignetteImage:setLeftRight( true, true, 0, 0 )
				self.VignetteImage:setTopBottom( false, false, 0, 0 )
				self.VignetteImage:setAlpha( 1 )
				VignetteImageFrame2( VignetteImage, {} )
				local OverlayFrame2 = function ( Overlay, event )
					local OverlayFrame3 = function ( Overlay, event )
						if not event.interrupted then
							Overlay:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Overlay:setLeftRight( true, true, 0, 0 )
						Overlay:setTopBottom( false, false, -360, 360 )
						Overlay:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Overlay, event )
						else
							Overlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						OverlayFrame3( Overlay, event )
						return 
					else
						Overlay:beginAnimation( "keyframe", 3500, false, false, CoD.TweenType.Linear )
						Overlay:registerEventHandler( "transition_complete_keyframe", OverlayFrame3 )
					end
				end
				
				Overlay:completeAnimation()
				self.Overlay:setLeftRight( true, true, 0, 0 )
				self.Overlay:setTopBottom( false, false, 0, 0 )
				self.Overlay:setAlpha( 0 )
				OverlayFrame2( Overlay, {} )
				local IncomingTextFrame2 = function ( IncomingText, event )
					local IncomingTextFrame3 = function ( IncomingText, event )
						local IncomingTextFrame4 = function ( IncomingText, event )
							local IncomingTextFrame5 = function ( IncomingText, event )
								local IncomingTextFrame6 = function ( IncomingText, event )
									local IncomingTextFrame7 = function ( IncomingText, event )
										local IncomingTextFrame8 = function ( IncomingText, event )
											local IncomingTextFrame9 = function ( IncomingText, event )
												local IncomingTextFrame10 = function ( IncomingText, event )
													if not event.interrupted then
														IncomingText:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
													end
													IncomingText:setLeftRight( false, false, -300, 300 )
													IncomingText:setTopBottom( true, false, 360, 420 )
													IncomingText:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( IncomingText, event )
													else
														IncomingText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													IncomingTextFrame10( IncomingText, event )
													return 
												else
													IncomingText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
													IncomingText:setAlpha( 0 )
													IncomingText:registerEventHandler( "transition_complete_keyframe", IncomingTextFrame10 )
												end
											end
											
											if event.interrupted then
												IncomingTextFrame9( IncomingText, event )
												return 
											else
												IncomingText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
												IncomingText:setAlpha( 1 )
												IncomingText:registerEventHandler( "transition_complete_keyframe", IncomingTextFrame9 )
											end
										end
										
										if event.interrupted then
											IncomingTextFrame8( IncomingText, event )
											return 
										else
											IncomingText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
											IncomingText:setAlpha( 0 )
											IncomingText:registerEventHandler( "transition_complete_keyframe", IncomingTextFrame8 )
										end
									end
									
									if event.interrupted then
										IncomingTextFrame7( IncomingText, event )
										return 
									else
										IncomingText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
										IncomingText:setAlpha( 1 )
										IncomingText:registerEventHandler( "transition_complete_keyframe", IncomingTextFrame7 )
									end
								end
								
								if event.interrupted then
									IncomingTextFrame6( IncomingText, event )
									return 
								else
									IncomingText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									IncomingText:setAlpha( 0 )
									IncomingText:registerEventHandler( "transition_complete_keyframe", IncomingTextFrame6 )
								end
							end
							
							if event.interrupted then
								IncomingTextFrame5( IncomingText, event )
								return 
							else
								IncomingText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								IncomingText:setAlpha( 1 )
								IncomingText:registerEventHandler( "transition_complete_keyframe", IncomingTextFrame5 )
							end
						end
						
						if event.interrupted then
							IncomingTextFrame4( IncomingText, event )
							return 
						else
							IncomingText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							IncomingText:setAlpha( 0 )
							IncomingText:registerEventHandler( "transition_complete_keyframe", IncomingTextFrame4 )
						end
					end
					
					if event.interrupted then
						IncomingTextFrame3( IncomingText, event )
						return 
					else
						IncomingText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						IncomingText:setAlpha( 1 )
						IncomingText:registerEventHandler( "transition_complete_keyframe", IncomingTextFrame3 )
					end
				end
				
				IncomingText:completeAnimation()
				self.IncomingText:setLeftRight( false, false, -300, 300 )
				self.IncomingText:setTopBottom( true, false, 360, 420 )
				self.IncomingText:setAlpha( 0 )
				IncomingTextFrame2( IncomingText, {} )
				local TransmissionTextFrame2 = function ( TransmissionText, event )
					local TransmissionTextFrame3 = function ( TransmissionText, event )
						local TransmissionTextFrame4 = function ( TransmissionText, event )
							local TransmissionTextFrame5 = function ( TransmissionText, event )
								local TransmissionTextFrame6 = function ( TransmissionText, event )
									local TransmissionTextFrame7 = function ( TransmissionText, event )
										local TransmissionTextFrame8 = function ( TransmissionText, event )
											local TransmissionTextFrame9 = function ( TransmissionText, event )
												local TransmissionTextFrame10 = function ( TransmissionText, event )
													if not event.interrupted then
														TransmissionText:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
													end
													TransmissionText:setLeftRight( false, false, -300, 300 )
													TransmissionText:setTopBottom( true, false, 280, 360 )
													TransmissionText:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( TransmissionText, event )
													else
														TransmissionText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													TransmissionTextFrame10( TransmissionText, event )
													return 
												else
													TransmissionText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
													TransmissionText:setAlpha( 0 )
													TransmissionText:registerEventHandler( "transition_complete_keyframe", TransmissionTextFrame10 )
												end
											end
											
											if event.interrupted then
												TransmissionTextFrame9( TransmissionText, event )
												return 
											else
												TransmissionText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
												TransmissionText:setAlpha( 1 )
												TransmissionText:registerEventHandler( "transition_complete_keyframe", TransmissionTextFrame9 )
											end
										end
										
										if event.interrupted then
											TransmissionTextFrame8( TransmissionText, event )
											return 
										else
											TransmissionText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
											TransmissionText:setAlpha( 0 )
											TransmissionText:registerEventHandler( "transition_complete_keyframe", TransmissionTextFrame8 )
										end
									end
									
									if event.interrupted then
										TransmissionTextFrame7( TransmissionText, event )
										return 
									else
										TransmissionText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
										TransmissionText:setAlpha( 1 )
										TransmissionText:registerEventHandler( "transition_complete_keyframe", TransmissionTextFrame7 )
									end
								end
								
								if event.interrupted then
									TransmissionTextFrame6( TransmissionText, event )
									return 
								else
									TransmissionText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									TransmissionText:setAlpha( 0 )
									TransmissionText:registerEventHandler( "transition_complete_keyframe", TransmissionTextFrame6 )
								end
							end
							
							if event.interrupted then
								TransmissionTextFrame5( TransmissionText, event )
								return 
							else
								TransmissionText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								TransmissionText:setAlpha( 1 )
								TransmissionText:registerEventHandler( "transition_complete_keyframe", TransmissionTextFrame5 )
							end
						end
						
						if event.interrupted then
							TransmissionTextFrame4( TransmissionText, event )
							return 
						else
							TransmissionText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							TransmissionText:setAlpha( 0 )
							TransmissionText:registerEventHandler( "transition_complete_keyframe", TransmissionTextFrame4 )
						end
					end
					
					if event.interrupted then
						TransmissionTextFrame3( TransmissionText, event )
						return 
					else
						TransmissionText:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TransmissionText:setAlpha( 1 )
						TransmissionText:registerEventHandler( "transition_complete_keyframe", TransmissionTextFrame3 )
					end
				end
				
				TransmissionText:completeAnimation()
				self.TransmissionText:setLeftRight( false, false, -300, 300 )
				self.TransmissionText:setTopBottom( true, false, 280, 360 )
				self.TransmissionText:setAlpha( 0 )
				TransmissionTextFrame2( TransmissionText, {} )
				local BlackTopFrame2 = function ( BlackTop, event )
					local BlackTopFrame3 = function ( BlackTop, event )
						local BlackTopFrame4 = function ( BlackTop, event )
							if not event.interrupted then
								BlackTop:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							BlackTop:setLeftRight( true, true, 0, 0 )
							BlackTop:setTopBottom( false, false, -360, -360 )
							if event.interrupted then
								self.clipFinished( BlackTop, event )
							else
								BlackTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BlackTopFrame4( BlackTop, event )
							return 
						else
							BlackTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BlackTop:setTopBottom( false, false, -360, 0 )
							BlackTop:registerEventHandler( "transition_complete_keyframe", BlackTopFrame4 )
						end
					end
					
					if event.interrupted then
						BlackTopFrame3( BlackTop, event )
						return 
					else
						BlackTop:beginAnimation( "keyframe", 3490, false, false, CoD.TweenType.Linear )
						BlackTop:registerEventHandler( "transition_complete_keyframe", BlackTopFrame3 )
					end
				end
				
				BlackTop:completeAnimation()
				self.BlackTop:setLeftRight( true, true, 0, 0 )
				self.BlackTop:setTopBottom( false, false, 0, 0 )
				BlackTopFrame2( BlackTop, {} )
				local BlackBottomFrame2 = function ( BlackBottom, event )
					local BlackBottomFrame3 = function ( BlackBottom, event )
						local BlackBottomFrame4 = function ( BlackBottom, event )
							if not event.interrupted then
								BlackBottom:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							BlackBottom:setLeftRight( true, true, 0, 0 )
							BlackBottom:setTopBottom( false, false, 360, 360 )
							if event.interrupted then
								self.clipFinished( BlackBottom, event )
							else
								BlackBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BlackBottomFrame4( BlackBottom, event )
							return 
						else
							BlackBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BlackBottom:setTopBottom( false, false, 0, 360 )
							BlackBottom:registerEventHandler( "transition_complete_keyframe", BlackBottomFrame4 )
						end
					end
					
					if event.interrupted then
						BlackBottomFrame3( BlackBottom, event )
						return 
					else
						BlackBottom:beginAnimation( "keyframe", 3490, false, false, CoD.TweenType.Linear )
						BlackBottom:registerEventHandler( "transition_complete_keyframe", BlackBottomFrame3 )
					end
				end
				
				BlackBottom:completeAnimation()
				self.BlackBottom:setLeftRight( true, true, 0, 0 )
				self.BlackBottom:setTopBottom( false, false, 0, 0 )
				BlackBottomFrame2( BlackBottom, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SecurityCameraOverlay.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

