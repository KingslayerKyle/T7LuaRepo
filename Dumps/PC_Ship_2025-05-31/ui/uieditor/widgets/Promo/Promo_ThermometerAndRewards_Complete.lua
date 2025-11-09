CoD.Promo_ThermometerAndRewards_Complete = InheritFrom( LUI.UIElement )
CoD.Promo_ThermometerAndRewards_Complete.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Promo_ThermometerAndRewards_Complete )
	self.id = "Promo_ThermometerAndRewards_Complete"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 243 )
	self:setTopBottom( true, false, 0, 594 )
	
	local LargeGlow = LUI.UIImage.new()
	LargeGlow:setLeftRight( true, false, 101.75, 667.42 )
	LargeGlow:setTopBottom( true, false, 12.33, 197.67 )
	LargeGlow:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowlarge" ) )
	LargeGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	LargeGlow:setShaderVector( 0, 0, 1, 0, 0 )
	LargeGlow:setShaderVector( 1, 0, 0, 0, 0 )
	LargeGlow:setShaderVector( 2, 0, 1.36, 0, 0 )
	LargeGlow:setShaderVector( 3, 0, 0.29, 0, 0 )
	self:addElement( LargeGlow )
	self.LargeGlow = LargeGlow
	
	local LargeGlow0 = LUI.UIImage.new()
	LargeGlow0:setLeftRight( true, false, 101.75, 667.42 )
	LargeGlow0:setTopBottom( true, false, 12.33, 197.67 )
	LargeGlow0:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowlarge" ) )
	LargeGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	LargeGlow0:setShaderVector( 0, 0, 1, 0, 0 )
	LargeGlow0:setShaderVector( 1, 0, 0, 0, 0 )
	LargeGlow0:setShaderVector( 2, 0, 1.36, 0, 0 )
	LargeGlow0:setShaderVector( 3, 0, 0.29, 0, 0 )
	self:addElement( LargeGlow0 )
	self.LargeGlow0 = LargeGlow0
	
	local LargeGlow00 = LUI.UIImage.new()
	LargeGlow00:setLeftRight( true, false, 101.75, 667.42 )
	LargeGlow00:setTopBottom( true, false, 12.33, 197.67 )
	LargeGlow00:setAlpha( 0 )
	LargeGlow00:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowlarge" ) )
	LargeGlow00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	LargeGlow00:setShaderVector( 0, 0, 1, 0, 0 )
	LargeGlow00:setShaderVector( 1, 0, 0, 0, 0 )
	LargeGlow00:setShaderVector( 2, 0, 1.36, 0, 0 )
	LargeGlow00:setShaderVector( 3, 0, 0.29, 0, 0 )
	self:addElement( LargeGlow00 )
	self.LargeGlow00 = LargeGlow00
	
	local ThermometerGlow = LUI.UIImage.new()
	ThermometerGlow:setLeftRight( true, false, 15.38, 227.13 )
	ThermometerGlow:setTopBottom( false, true, -594, -29.33 )
	ThermometerGlow:setAlpha( 0.22 )
	ThermometerGlow:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_mainbargglow" ) )
	ThermometerGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	ThermometerGlow:setShaderVector( 0, 0, 1, 0, 0 )
	ThermometerGlow:setShaderVector( 1, 0, 0, 0, 0 )
	ThermometerGlow:setShaderVector( 2, -0.13, 0.92, 0, 0 )
	ThermometerGlow:setShaderVector( 3, 0.62, 0.21, 0, 0 )
	self:addElement( ThermometerGlow )
	self.ThermometerGlow = ThermometerGlow
	
	local CoreComplete = LUI.UIImage.new()
	CoreComplete:setLeftRight( true, false, 89.5, 148.5 )
	CoreComplete:setTopBottom( true, false, 45.71, 126.83 )
	CoreComplete:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_boltcore" ) )
	self:addElement( CoreComplete )
	self.CoreComplete = CoreComplete
	
	local Bolt1a = LUI.UIImage.new()
	Bolt1a:setLeftRight( true, false, -14.88, 268.38 )
	Bolt1a:setTopBottom( true, false, -52.29, 131.83 )
	Bolt1a:setAlpha( 0.25 )
	Bolt1a:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt1a" ) )
	self:addElement( Bolt1a )
	self.Bolt1a = Bolt1a
	
	local Bolt1b = LUI.UIImage.new()
	Bolt1b:setLeftRight( true, false, -14.88, 268.38 )
	Bolt1b:setTopBottom( true, false, -52.29, 131.83 )
	Bolt1b:setAlpha( 0.35 )
	Bolt1b:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt1b" ) )
	self:addElement( Bolt1b )
	self.Bolt1b = Bolt1b
	
	local Bolt1c = LUI.UIImage.new()
	Bolt1c:setLeftRight( true, false, -14.88, 268.38 )
	Bolt1c:setTopBottom( true, false, -52.29, 131.83 )
	Bolt1c:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt1c" ) )
	self:addElement( Bolt1c )
	self.Bolt1c = Bolt1c
	
	local Bolt2a = LUI.UIImage.new()
	Bolt2a:setLeftRight( true, false, -14.88, 268.38 )
	Bolt2a:setTopBottom( true, false, -52.29, 131.83 )
	Bolt2a:setAlpha( 0.25 )
	Bolt2a:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt2a" ) )
	self:addElement( Bolt2a )
	self.Bolt2a = Bolt2a
	
	local Bolt2b = LUI.UIImage.new()
	Bolt2b:setLeftRight( true, false, -14.88, 268.38 )
	Bolt2b:setTopBottom( true, false, -52.29, 131.83 )
	Bolt2b:setAlpha( 0.35 )
	Bolt2b:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt2b" ) )
	self:addElement( Bolt2b )
	self.Bolt2b = Bolt2b
	
	local Bolt2c = LUI.UIImage.new()
	Bolt2c:setLeftRight( true, false, -14.88, 268.38 )
	Bolt2c:setTopBottom( true, false, -52.29, 131.83 )
	Bolt2c:setAlpha( 0.45 )
	Bolt2c:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt2c" ) )
	self:addElement( Bolt2c )
	self.Bolt2c = Bolt2c
	
	local Bolt2d = LUI.UIImage.new()
	Bolt2d:setLeftRight( true, false, -14.88, 268.38 )
	Bolt2d:setTopBottom( true, false, -52.29, 131.83 )
	Bolt2d:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt2d" ) )
	self:addElement( Bolt2d )
	self.Bolt2d = Bolt2d
	
	local Bolt3a = LUI.UIImage.new()
	Bolt3a:setLeftRight( true, false, -14.88, 268.38 )
	Bolt3a:setTopBottom( true, false, -52.29, 131.83 )
	Bolt3a:setAlpha( 0.25 )
	Bolt3a:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt3a" ) )
	self:addElement( Bolt3a )
	self.Bolt3a = Bolt3a
	
	local Bolt3b = LUI.UIImage.new()
	Bolt3b:setLeftRight( true, false, -14.88, 268.38 )
	Bolt3b:setTopBottom( true, false, -52.29, 131.83 )
	Bolt3b:setAlpha( 0.35 )
	Bolt3b:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt3b" ) )
	self:addElement( Bolt3b )
	self.Bolt3b = Bolt3b
	
	local Bolt3c = LUI.UIImage.new()
	Bolt3c:setLeftRight( true, false, -14.88, 268.38 )
	Bolt3c:setTopBottom( true, false, -52.29, 131.83 )
	Bolt3c:setAlpha( 0.45 )
	Bolt3c:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt3c" ) )
	self:addElement( Bolt3c )
	self.Bolt3c = Bolt3c
	
	local Bolt3d = LUI.UIImage.new()
	Bolt3d:setLeftRight( true, false, -14.88, 268.38 )
	Bolt3d:setTopBottom( true, false, -52.29, 131.83 )
	Bolt3d:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt3d" ) )
	self:addElement( Bolt3d )
	self.Bolt3d = Bolt3d
	
	local Bolt4a = LUI.UIImage.new()
	Bolt4a:setLeftRight( true, false, -14.88, 268.38 )
	Bolt4a:setTopBottom( true, false, -52.29, 131.83 )
	Bolt4a:setAlpha( 0.25 )
	Bolt4a:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt4a" ) )
	self:addElement( Bolt4a )
	self.Bolt4a = Bolt4a
	
	local Bolt4b = LUI.UIImage.new()
	Bolt4b:setLeftRight( true, false, -14.88, 268.38 )
	Bolt4b:setTopBottom( true, false, -52.29, 131.83 )
	Bolt4b:setAlpha( 0.35 )
	Bolt4b:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt4b" ) )
	self:addElement( Bolt4b )
	self.Bolt4b = Bolt4b
	
	local Bolt4c = LUI.UIImage.new()
	Bolt4c:setLeftRight( true, false, -14.88, 268.38 )
	Bolt4c:setTopBottom( true, false, -52.29, 131.83 )
	Bolt4c:setAlpha( 0.45 )
	Bolt4c:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt4c" ) )
	self:addElement( Bolt4c )
	self.Bolt4c = Bolt4c
	
	local Bolt4d = LUI.UIImage.new()
	Bolt4d:setLeftRight( true, false, -14.88, 268.38 )
	Bolt4d:setTopBottom( true, false, -52.29, 131.83 )
	Bolt4d:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_bolt4d" ) )
	self:addElement( Bolt4d )
	self.Bolt4d = Bolt4d
	
	local whiteFlash0 = LUI.UIImage.new()
	whiteFlash0:setLeftRight( true, false, 0, 234.63 )
	whiteFlash0:setTopBottom( true, false, 297, 423.74 )
	whiteFlash0:setRGB( 0.68, 0.98, 1 )
	whiteFlash0:setAlpha( 0 )
	whiteFlash0:setZRot( 88 )
	whiteFlash0:setScale( 1.3 )
	whiteFlash0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	whiteFlash0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( whiteFlash0 )
	self.whiteFlash0 = whiteFlash0
	
	local biglightFlare = LUI.UIImage.new()
	biglightFlare:setLeftRight( true, false, 0, 242.51 )
	biglightFlare:setTopBottom( false, true, -204.93, 0.27 )
	biglightFlare:setAlpha( 0 )
	biglightFlare:setZRot( -28.87 )
	biglightFlare:setImage( RegisterImage( "uie_t7_callingcards_champion_light4" ) )
	biglightFlare:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( biglightFlare )
	self.biglightFlare = biglightFlare
	
	local GlowPulseOuter = LUI.UIImage.new()
	GlowPulseOuter:setLeftRight( true, false, 55.75, 178.25 )
	GlowPulseOuter:setTopBottom( false, true, -159.33, -36.83 )
	GlowPulseOuter:setAlpha( 0 )
	GlowPulseOuter:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse2_99" ) )
	GlowPulseOuter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowPulseOuter )
	self.GlowPulseOuter = GlowPulseOuter
	
	local GlowPulseOuter2 = LUI.UIImage.new()
	GlowPulseOuter2:setLeftRight( true, false, 55.75, 178.25 )
	GlowPulseOuter2:setTopBottom( false, true, -159.33, -37.56 )
	GlowPulseOuter2:setAlpha( 0 )
	GlowPulseOuter2:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse3" ) )
	GlowPulseOuter2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowPulseOuter2 )
	self.GlowPulseOuter2 = GlowPulseOuter2
	
	local GlowPulseLine = LUI.UIImage.new()
	GlowPulseLine:setLeftRight( true, false, 27, 207 )
	GlowPulseLine:setTopBottom( false, true, -225.33, -77.33 )
	GlowPulseLine:setAlpha( 0 )
	GlowPulseLine:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_lineglow" ) )
	GlowPulseLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowPulseLine )
	self.GlowPulseLine = GlowPulseLine
	
	local GlowPulseLine0 = LUI.UIImage.new()
	GlowPulseLine0:setLeftRight( true, false, 102, 134.59 )
	GlowPulseLine0:setTopBottom( false, true, -173.04, -130.62 )
	GlowPulseLine0:setAlpha( 0 )
	GlowPulseLine0:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_lineglow" ) )
	GlowPulseLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowPulseLine0 )
	self.GlowPulseLine0 = GlowPulseLine0
	
	local GlowDots = LUI.UIImage.new()
	GlowDots:setLeftRight( true, false, 75.75, 160.84 )
	GlowDots:setTopBottom( false, true, -173.04, -142.33 )
	GlowDots:setAlpha( 0 )
	GlowDots:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse4" ) )
	GlowDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots )
	self.GlowDots = GlowDots
	
	local GlowDots2 = LUI.UIImage.new()
	GlowDots2:setLeftRight( true, false, 75.75, 163.75 )
	GlowDots2:setTopBottom( false, true, -250.33, -234.33 )
	GlowDots2:setAlpha( 0 )
	GlowDots2:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse5" ) )
	GlowDots2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots2 )
	self.GlowDots2 = GlowDots2
	
	local GlowDots3 = LUI.UIImage.new()
	GlowDots3:setLeftRight( true, false, 75.75, 163.75 )
	GlowDots3:setTopBottom( false, true, -347.33, -331.33 )
	GlowDots3:setAlpha( 0 )
	GlowDots3:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse5" ) )
	GlowDots3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots3 )
	self.GlowDots3 = GlowDots3
	
	local GlowDots4 = LUI.UIImage.new()
	GlowDots4:setLeftRight( true, false, 75.75, 163.75 )
	GlowDots4:setTopBottom( false, true, -445.33, -429.33 )
	GlowDots4:setAlpha( 0 )
	GlowDots4:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse5" ) )
	GlowDots4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots4 )
	self.GlowDots4 = GlowDots4
	
	local GlowDots5 = LUI.UIImage.new()
	GlowDots5:setLeftRight( true, false, 75.75, 163.75 )
	GlowDots5:setTopBottom( false, true, -542.33, -526.33 )
	GlowDots5:setAlpha( 0 )
	GlowDots5:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse5" ) )
	GlowDots5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowDots5 )
	self.GlowDots5 = GlowDots5
	
	local GlowPulse = LUI.UIImage.new()
	GlowPulse:setLeftRight( true, false, 31.75, 207.75 )
	GlowPulse:setTopBottom( false, true, -185.33, -9.33 )
	GlowPulse:setAlpha( 0 )
	GlowPulse:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse" ) )
	GlowPulse:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowPulse )
	self.GlowPulse = GlowPulse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )
				LargeGlow:completeAnimation()
				self.LargeGlow:setAlpha( 0 )
				self.LargeGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.LargeGlow:setShaderVector( 0, 0, 1, 0, 0 )
				self.LargeGlow:setShaderVector( 1, 0, 0, 0, 0 )
				self.LargeGlow:setShaderVector( 2, 0, 0, 0, 0 )
				self.LargeGlow:setShaderVector( 3, 0, 0.29, 0, 0 )
				self.clipFinished( LargeGlow, {} )
				LargeGlow0:completeAnimation()
				self.LargeGlow0:setAlpha( 0 )
				self.clipFinished( LargeGlow0, {} )
				LargeGlow00:completeAnimation()
				self.LargeGlow00:setAlpha( 0 )
				self.clipFinished( LargeGlow00, {} )
				ThermometerGlow:completeAnimation()
				self.ThermometerGlow:setAlpha( 0 )
				self.clipFinished( ThermometerGlow, {} )
				CoreComplete:completeAnimation()
				self.CoreComplete:setAlpha( 0 )
				self.clipFinished( CoreComplete, {} )
				Bolt1a:completeAnimation()
				self.Bolt1a:setAlpha( 0 )
				self.clipFinished( Bolt1a, {} )
				Bolt1b:completeAnimation()
				self.Bolt1b:setAlpha( 0 )
				self.clipFinished( Bolt1b, {} )
				Bolt1c:completeAnimation()
				self.Bolt1c:setAlpha( 0 )
				self.clipFinished( Bolt1c, {} )
				Bolt2a:completeAnimation()
				self.Bolt2a:setAlpha( 0 )
				self.clipFinished( Bolt2a, {} )
				Bolt2b:completeAnimation()
				self.Bolt2b:setAlpha( 0 )
				self.clipFinished( Bolt2b, {} )
				Bolt2c:completeAnimation()
				self.Bolt2c:setAlpha( 0 )
				self.clipFinished( Bolt2c, {} )
				Bolt2d:completeAnimation()
				self.Bolt2d:setAlpha( 0 )
				self.clipFinished( Bolt2d, {} )
				Bolt3a:completeAnimation()
				self.Bolt3a:setAlpha( 0 )
				self.clipFinished( Bolt3a, {} )
				Bolt3b:completeAnimation()
				self.Bolt3b:setAlpha( 0 )
				self.clipFinished( Bolt3b, {} )
				Bolt3c:completeAnimation()
				self.Bolt3c:setAlpha( 0 )
				self.clipFinished( Bolt3c, {} )
				Bolt3d:completeAnimation()
				self.Bolt3d:setAlpha( 0 )
				self.clipFinished( Bolt3d, {} )
				Bolt4a:completeAnimation()
				self.Bolt4a:setAlpha( 0 )
				self.clipFinished( Bolt4a, {} )
				Bolt4b:completeAnimation()
				self.Bolt4b:setAlpha( 0 )
				self.clipFinished( Bolt4b, {} )
				Bolt4c:completeAnimation()
				self.Bolt4c:setAlpha( 0 )
				self.clipFinished( Bolt4c, {} )
				Bolt4d:completeAnimation()
				self.Bolt4d:setAlpha( 0 )
				self.clipFinished( Bolt4d, {} )
				whiteFlash0:completeAnimation()
				self.whiteFlash0:setAlpha( 0 )
				self.clipFinished( whiteFlash0, {} )
				biglightFlare:completeAnimation()
				self.biglightFlare:setAlpha( 0 )
				self.clipFinished( biglightFlare, {} )
			end,
			Completed = function ()
				self:setupElementClipCounter( 22 )
				local LargeGlowFrame2 = function ( LargeGlow, event )
					local LargeGlowFrame3 = function ( LargeGlow, event )
						local LargeGlowFrame4 = function ( LargeGlow, event )
							local LargeGlowFrame5 = function ( LargeGlow, event )
								local LargeGlowFrame6 = function ( LargeGlow, event )
									if not event.interrupted then
										LargeGlow:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
									end
									LargeGlow:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LargeGlow, event )
									else
										LargeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LargeGlowFrame6( LargeGlow, event )
									return 
								else
									LargeGlow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									LargeGlow:setAlpha( 1 )
									LargeGlow:registerEventHandler( "transition_complete_keyframe", LargeGlowFrame6 )
								end
							end
							
							if event.interrupted then
								LargeGlowFrame5( LargeGlow, event )
								return 
							else
								LargeGlow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								LargeGlow:setAlpha( 0 )
								LargeGlow:registerEventHandler( "transition_complete_keyframe", LargeGlowFrame5 )
							end
						end
						
						if event.interrupted then
							LargeGlowFrame4( LargeGlow, event )
							return 
						else
							LargeGlow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							LargeGlow:setAlpha( 1 )
							LargeGlow:registerEventHandler( "transition_complete_keyframe", LargeGlowFrame4 )
						end
					end
					
					if event.interrupted then
						LargeGlowFrame3( LargeGlow, event )
						return 
					else
						LargeGlow:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Linear )
						LargeGlow:registerEventHandler( "transition_complete_keyframe", LargeGlowFrame3 )
					end
				end
				
				LargeGlow:completeAnimation()
				self.LargeGlow:setAlpha( 0 )
				LargeGlowFrame2( LargeGlow, {} )
				local LargeGlow0Frame2 = function ( LargeGlow0, event )
					local LargeGlow0Frame3 = function ( LargeGlow0, event )
						local LargeGlow0Frame4 = function ( LargeGlow0, event )
							local LargeGlow0Frame5 = function ( LargeGlow0, event )
								local LargeGlow0Frame6 = function ( LargeGlow0, event )
									if not event.interrupted then
										LargeGlow0:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
									end
									LargeGlow0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LargeGlow0, event )
									else
										LargeGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LargeGlow0Frame6( LargeGlow0, event )
									return 
								else
									LargeGlow0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									LargeGlow0:setAlpha( 1 )
									LargeGlow0:registerEventHandler( "transition_complete_keyframe", LargeGlow0Frame6 )
								end
							end
							
							if event.interrupted then
								LargeGlow0Frame5( LargeGlow0, event )
								return 
							else
								LargeGlow0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								LargeGlow0:setAlpha( 0 )
								LargeGlow0:registerEventHandler( "transition_complete_keyframe", LargeGlow0Frame5 )
							end
						end
						
						if event.interrupted then
							LargeGlow0Frame4( LargeGlow0, event )
							return 
						else
							LargeGlow0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							LargeGlow0:setAlpha( 1 )
							LargeGlow0:registerEventHandler( "transition_complete_keyframe", LargeGlow0Frame4 )
						end
					end
					
					if event.interrupted then
						LargeGlow0Frame3( LargeGlow0, event )
						return 
					else
						LargeGlow0:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Linear )
						LargeGlow0:registerEventHandler( "transition_complete_keyframe", LargeGlow0Frame3 )
					end
				end
				
				LargeGlow0:completeAnimation()
				self.LargeGlow0:setAlpha( 0 )
				LargeGlow0Frame2( LargeGlow0, {} )
				local LargeGlow00Frame2 = function ( LargeGlow00, event )
					local LargeGlow00Frame3 = function ( LargeGlow00, event )
						local LargeGlow00Frame4 = function ( LargeGlow00, event )
							local LargeGlow00Frame5 = function ( LargeGlow00, event )
								local LargeGlow00Frame6 = function ( LargeGlow00, event )
									if not event.interrupted then
										LargeGlow00:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
									end
									LargeGlow00:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LargeGlow00, event )
									else
										LargeGlow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LargeGlow00Frame6( LargeGlow00, event )
									return 
								else
									LargeGlow00:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									LargeGlow00:setAlpha( 1 )
									LargeGlow00:registerEventHandler( "transition_complete_keyframe", LargeGlow00Frame6 )
								end
							end
							
							if event.interrupted then
								LargeGlow00Frame5( LargeGlow00, event )
								return 
							else
								LargeGlow00:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								LargeGlow00:setAlpha( 0 )
								LargeGlow00:registerEventHandler( "transition_complete_keyframe", LargeGlow00Frame5 )
							end
						end
						
						if event.interrupted then
							LargeGlow00Frame4( LargeGlow00, event )
							return 
						else
							LargeGlow00:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							LargeGlow00:setAlpha( 1 )
							LargeGlow00:registerEventHandler( "transition_complete_keyframe", LargeGlow00Frame4 )
						end
					end
					
					if event.interrupted then
						LargeGlow00Frame3( LargeGlow00, event )
						return 
					else
						LargeGlow00:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Linear )
						LargeGlow00:registerEventHandler( "transition_complete_keyframe", LargeGlow00Frame3 )
					end
				end
				
				LargeGlow00:completeAnimation()
				self.LargeGlow00:setAlpha( 0 )
				LargeGlow00Frame2( LargeGlow00, {} )
				local ThermometerGlowFrame2 = function ( ThermometerGlow, event )
					local ThermometerGlowFrame3 = function ( ThermometerGlow, event )
						local ThermometerGlowFrame4 = function ( ThermometerGlow, event )
							local ThermometerGlowFrame5 = function ( ThermometerGlow, event )
								if not event.interrupted then
									ThermometerGlow:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
								end
								ThermometerGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ThermometerGlow, event )
								else
									ThermometerGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ThermometerGlowFrame5( ThermometerGlow, event )
								return 
							else
								ThermometerGlow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								ThermometerGlow:setAlpha( 0.44 )
								ThermometerGlow:registerEventHandler( "transition_complete_keyframe", ThermometerGlowFrame5 )
							end
						end
						
						if event.interrupted then
							ThermometerGlowFrame4( ThermometerGlow, event )
							return 
						else
							ThermometerGlow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ThermometerGlow:setAlpha( 0 )
							ThermometerGlow:registerEventHandler( "transition_complete_keyframe", ThermometerGlowFrame4 )
						end
					end
					
					if event.interrupted then
						ThermometerGlowFrame3( ThermometerGlow, event )
						return 
					else
						ThermometerGlow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						ThermometerGlow:setAlpha( 0.5 )
						ThermometerGlow:registerEventHandler( "transition_complete_keyframe", ThermometerGlowFrame3 )
					end
				end
				
				ThermometerGlow:completeAnimation()
				self.ThermometerGlow:setAlpha( 0 )
				ThermometerGlowFrame2( ThermometerGlow, {} )
				local CoreCompleteFrame2 = function ( CoreComplete, event )
					local CoreCompleteFrame3 = function ( CoreComplete, event )
						local CoreCompleteFrame4 = function ( CoreComplete, event )
							local CoreCompleteFrame5 = function ( CoreComplete, event )
								local CoreCompleteFrame6 = function ( CoreComplete, event )
									local CoreCompleteFrame7 = function ( CoreComplete, event )
										local CoreCompleteFrame8 = function ( CoreComplete, event )
											local CoreCompleteFrame9 = function ( CoreComplete, event )
												local CoreCompleteFrame10 = function ( CoreComplete, event )
													local CoreCompleteFrame11 = function ( CoreComplete, event )
														if not event.interrupted then
															CoreComplete:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
														end
														CoreComplete:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( CoreComplete, event )
														else
															CoreComplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														CoreCompleteFrame11( CoreComplete, event )
														return 
													else
														CoreComplete:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														CoreComplete:setAlpha( 0.99 )
														CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame11 )
													end
												end
												
												if event.interrupted then
													CoreCompleteFrame10( CoreComplete, event )
													return 
												else
													CoreComplete:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													CoreComplete:setAlpha( 0.43 )
													CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame10 )
												end
											end
											
											if event.interrupted then
												CoreCompleteFrame9( CoreComplete, event )
												return 
											else
												CoreComplete:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
												CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame9 )
											end
										end
										
										if event.interrupted then
											CoreCompleteFrame8( CoreComplete, event )
											return 
										else
											CoreComplete:beginAnimation( "keyframe", 1460, false, false, CoD.TweenType.Linear )
											CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame8 )
										end
									end
									
									if event.interrupted then
										CoreCompleteFrame7( CoreComplete, event )
										return 
									else
										CoreComplete:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										CoreComplete:setAlpha( 1 )
										CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame7 )
									end
								end
								
								if event.interrupted then
									CoreCompleteFrame6( CoreComplete, event )
									return 
								else
									CoreComplete:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									CoreComplete:setAlpha( 0.48 )
									CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame6 )
								end
							end
							
							if event.interrupted then
								CoreCompleteFrame5( CoreComplete, event )
								return 
							else
								CoreComplete:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								CoreComplete:setAlpha( 1 )
								CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame5 )
							end
						end
						
						if event.interrupted then
							CoreCompleteFrame4( CoreComplete, event )
							return 
						else
							CoreComplete:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							CoreComplete:setAlpha( 0.4 )
							CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame4 )
						end
					end
					
					if event.interrupted then
						CoreCompleteFrame3( CoreComplete, event )
						return 
					else
						CoreComplete:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						CoreComplete:setAlpha( 1 )
						CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame3 )
					end
				end
				
				CoreComplete:completeAnimation()
				self.CoreComplete:setAlpha( 0 )
				CoreCompleteFrame2( CoreComplete, {} )
				local Bolt1aFrame2 = function ( Bolt1a, event )
					local Bolt1aFrame3 = function ( Bolt1a, event )
						local Bolt1aFrame4 = function ( Bolt1a, event )
							local Bolt1aFrame5 = function ( Bolt1a, event )
								if not event.interrupted then
									Bolt1a:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
								end
								Bolt1a:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt1a, event )
								else
									Bolt1a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt1aFrame5( Bolt1a, event )
								return 
							else
								Bolt1a:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								Bolt1a:registerEventHandler( "transition_complete_keyframe", Bolt1aFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt1aFrame4( Bolt1a, event )
							return 
						else
							Bolt1a:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Bolt1a:setAlpha( 0.25 )
							Bolt1a:registerEventHandler( "transition_complete_keyframe", Bolt1aFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt1aFrame3( Bolt1a, event )
						return 
					else
						Bolt1a:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
						Bolt1a:registerEventHandler( "transition_complete_keyframe", Bolt1aFrame3 )
					end
				end
				
				Bolt1a:completeAnimation()
				self.Bolt1a:setAlpha( 0 )
				Bolt1aFrame2( Bolt1a, {} )
				local Bolt1bFrame2 = function ( Bolt1b, event )
					local Bolt1bFrame3 = function ( Bolt1b, event )
						local Bolt1bFrame4 = function ( Bolt1b, event )
							local Bolt1bFrame5 = function ( Bolt1b, event )
								if not event.interrupted then
									Bolt1b:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
								end
								Bolt1b:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt1b, event )
								else
									Bolt1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt1bFrame5( Bolt1b, event )
								return 
							else
								Bolt1b:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
								Bolt1b:registerEventHandler( "transition_complete_keyframe", Bolt1bFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt1bFrame4( Bolt1b, event )
							return 
						else
							Bolt1b:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Bolt1b:setAlpha( 0.35 )
							Bolt1b:registerEventHandler( "transition_complete_keyframe", Bolt1bFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt1bFrame3( Bolt1b, event )
						return 
					else
						Bolt1b:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
						Bolt1b:registerEventHandler( "transition_complete_keyframe", Bolt1bFrame3 )
					end
				end
				
				Bolt1b:completeAnimation()
				self.Bolt1b:setAlpha( 0 )
				Bolt1bFrame2( Bolt1b, {} )
				local Bolt1cFrame2 = function ( Bolt1c, event )
					local Bolt1cFrame3 = function ( Bolt1c, event )
						local Bolt1cFrame4 = function ( Bolt1c, event )
							local Bolt1cFrame5 = function ( Bolt1c, event )
								local Bolt1cFrame6 = function ( Bolt1c, event )
									local Bolt1cFrame7 = function ( Bolt1c, event )
										if not event.interrupted then
											Bolt1c:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
										end
										Bolt1c:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Bolt1c, event )
										else
											Bolt1c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Bolt1cFrame7( Bolt1c, event )
										return 
									else
										Bolt1c:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
										Bolt1c:registerEventHandler( "transition_complete_keyframe", Bolt1cFrame7 )
									end
								end
								
								if event.interrupted then
									Bolt1cFrame6( Bolt1c, event )
									return 
								else
									Bolt1c:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Bolt1c:setAlpha( 1 )
									Bolt1c:registerEventHandler( "transition_complete_keyframe", Bolt1cFrame6 )
								end
							end
							
							if event.interrupted then
								Bolt1cFrame5( Bolt1c, event )
								return 
							else
								Bolt1c:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								Bolt1c:setAlpha( 0.4 )
								Bolt1c:registerEventHandler( "transition_complete_keyframe", Bolt1cFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt1cFrame4( Bolt1c, event )
							return 
						else
							Bolt1c:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Bolt1c:setAlpha( 1 )
							Bolt1c:registerEventHandler( "transition_complete_keyframe", Bolt1cFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt1cFrame3( Bolt1c, event )
						return 
					else
						Bolt1c:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
						Bolt1c:registerEventHandler( "transition_complete_keyframe", Bolt1cFrame3 )
					end
				end
				
				Bolt1c:completeAnimation()
				self.Bolt1c:setAlpha( 0 )
				Bolt1cFrame2( Bolt1c, {} )
				local Bolt2aFrame2 = function ( Bolt2a, event )
					local Bolt2aFrame3 = function ( Bolt2a, event )
						local Bolt2aFrame4 = function ( Bolt2a, event )
							local Bolt2aFrame5 = function ( Bolt2a, event )
								if not event.interrupted then
									Bolt2a:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
								end
								Bolt2a:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt2a, event )
								else
									Bolt2a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt2aFrame5( Bolt2a, event )
								return 
							else
								Bolt2a:beginAnimation( "keyframe", 749, false, false, CoD.TweenType.Linear )
								Bolt2a:registerEventHandler( "transition_complete_keyframe", Bolt2aFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt2aFrame4( Bolt2a, event )
							return 
						else
							Bolt2a:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Bolt2a:setAlpha( 0.25 )
							Bolt2a:registerEventHandler( "transition_complete_keyframe", Bolt2aFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt2aFrame3( Bolt2a, event )
						return 
					else
						Bolt2a:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
						Bolt2a:registerEventHandler( "transition_complete_keyframe", Bolt2aFrame3 )
					end
				end
				
				Bolt2a:completeAnimation()
				self.Bolt2a:setAlpha( 0 )
				Bolt2aFrame2( Bolt2a, {} )
				local Bolt2bFrame2 = function ( Bolt2b, event )
					local Bolt2bFrame3 = function ( Bolt2b, event )
						local Bolt2bFrame4 = function ( Bolt2b, event )
							local Bolt2bFrame5 = function ( Bolt2b, event )
								if not event.interrupted then
									Bolt2b:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
								end
								Bolt2b:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt2b, event )
								else
									Bolt2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt2bFrame5( Bolt2b, event )
								return 
							else
								Bolt2b:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
								Bolt2b:registerEventHandler( "transition_complete_keyframe", Bolt2bFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt2bFrame4( Bolt2b, event )
							return 
						else
							Bolt2b:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Bolt2b:setAlpha( 0.35 )
							Bolt2b:registerEventHandler( "transition_complete_keyframe", Bolt2bFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt2bFrame3( Bolt2b, event )
						return 
					else
						Bolt2b:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
						Bolt2b:registerEventHandler( "transition_complete_keyframe", Bolt2bFrame3 )
					end
				end
				
				Bolt2b:completeAnimation()
				self.Bolt2b:setAlpha( 0 )
				Bolt2bFrame2( Bolt2b, {} )
				local Bolt2cFrame2 = function ( Bolt2c, event )
					local Bolt2cFrame3 = function ( Bolt2c, event )
						local Bolt2cFrame4 = function ( Bolt2c, event )
							local Bolt2cFrame5 = function ( Bolt2c, event )
								if not event.interrupted then
									Bolt2c:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
								end
								Bolt2c:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt2c, event )
								else
									Bolt2c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt2cFrame5( Bolt2c, event )
								return 
							else
								Bolt2c:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
								Bolt2c:registerEventHandler( "transition_complete_keyframe", Bolt2cFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt2cFrame4( Bolt2c, event )
							return 
						else
							Bolt2c:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Bolt2c:setAlpha( 0.45 )
							Bolt2c:registerEventHandler( "transition_complete_keyframe", Bolt2cFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt2cFrame3( Bolt2c, event )
						return 
					else
						Bolt2c:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Linear )
						Bolt2c:registerEventHandler( "transition_complete_keyframe", Bolt2cFrame3 )
					end
				end
				
				Bolt2c:completeAnimation()
				self.Bolt2c:setAlpha( 0 )
				Bolt2cFrame2( Bolt2c, {} )
				local Bolt2dFrame2 = function ( Bolt2d, event )
					local Bolt2dFrame3 = function ( Bolt2d, event )
						local Bolt2dFrame4 = function ( Bolt2d, event )
							local Bolt2dFrame5 = function ( Bolt2d, event )
								local Bolt2dFrame6 = function ( Bolt2d, event )
									if not event.interrupted then
										Bolt2d:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
									end
									Bolt2d:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Bolt2d, event )
									else
										Bolt2d:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Bolt2dFrame6( Bolt2d, event )
									return 
								else
									Bolt2d:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									Bolt2d:setAlpha( 1 )
									Bolt2d:registerEventHandler( "transition_complete_keyframe", Bolt2dFrame6 )
								end
							end
							
							if event.interrupted then
								Bolt2dFrame5( Bolt2d, event )
								return 
							else
								Bolt2d:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Bolt2d:setAlpha( 0.34 )
								Bolt2d:registerEventHandler( "transition_complete_keyframe", Bolt2dFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt2dFrame4( Bolt2d, event )
							return 
						else
							Bolt2d:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							Bolt2d:setAlpha( 1 )
							Bolt2d:registerEventHandler( "transition_complete_keyframe", Bolt2dFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt2dFrame3( Bolt2d, event )
						return 
					else
						Bolt2d:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
						Bolt2d:registerEventHandler( "transition_complete_keyframe", Bolt2dFrame3 )
					end
				end
				
				Bolt2d:completeAnimation()
				self.Bolt2d:setAlpha( 0 )
				Bolt2dFrame2( Bolt2d, {} )
				local Bolt3aFrame2 = function ( Bolt3a, event )
					local Bolt3aFrame3 = function ( Bolt3a, event )
						local Bolt3aFrame4 = function ( Bolt3a, event )
							local Bolt3aFrame5 = function ( Bolt3a, event )
								if not event.interrupted then
									Bolt3a:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								end
								Bolt3a:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt3a, event )
								else
									Bolt3a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt3aFrame5( Bolt3a, event )
								return 
							else
								Bolt3a:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
								Bolt3a:registerEventHandler( "transition_complete_keyframe", Bolt3aFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt3aFrame4( Bolt3a, event )
							return 
						else
							Bolt3a:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Bolt3a:setAlpha( 0.25 )
							Bolt3a:registerEventHandler( "transition_complete_keyframe", Bolt3aFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt3aFrame3( Bolt3a, event )
						return 
					else
						Bolt3a:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
						Bolt3a:registerEventHandler( "transition_complete_keyframe", Bolt3aFrame3 )
					end
				end
				
				Bolt3a:completeAnimation()
				self.Bolt3a:setAlpha( 0 )
				Bolt3aFrame2( Bolt3a, {} )
				local Bolt3bFrame2 = function ( Bolt3b, event )
					local Bolt3bFrame3 = function ( Bolt3b, event )
						local Bolt3bFrame4 = function ( Bolt3b, event )
							local Bolt3bFrame5 = function ( Bolt3b, event )
								if not event.interrupted then
									Bolt3b:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								Bolt3b:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt3b, event )
								else
									Bolt3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt3bFrame5( Bolt3b, event )
								return 
							else
								Bolt3b:beginAnimation( "keyframe", 820, false, false, CoD.TweenType.Linear )
								Bolt3b:registerEventHandler( "transition_complete_keyframe", Bolt3bFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt3bFrame4( Bolt3b, event )
							return 
						else
							Bolt3b:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							Bolt3b:setAlpha( 0.35 )
							Bolt3b:registerEventHandler( "transition_complete_keyframe", Bolt3bFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt3bFrame3( Bolt3b, event )
						return 
					else
						Bolt3b:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
						Bolt3b:registerEventHandler( "transition_complete_keyframe", Bolt3bFrame3 )
					end
				end
				
				Bolt3b:completeAnimation()
				self.Bolt3b:setAlpha( 0 )
				Bolt3bFrame2( Bolt3b, {} )
				local Bolt3cFrame2 = function ( Bolt3c, event )
					local Bolt3cFrame3 = function ( Bolt3c, event )
						local Bolt3cFrame4 = function ( Bolt3c, event )
							local Bolt3cFrame5 = function ( Bolt3c, event )
								if not event.interrupted then
									Bolt3c:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
								end
								Bolt3c:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt3c, event )
								else
									Bolt3c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt3cFrame5( Bolt3c, event )
								return 
							else
								Bolt3c:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
								Bolt3c:registerEventHandler( "transition_complete_keyframe", Bolt3cFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt3cFrame4( Bolt3c, event )
							return 
						else
							Bolt3c:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							Bolt3c:setAlpha( 0.45 )
							Bolt3c:registerEventHandler( "transition_complete_keyframe", Bolt3cFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt3cFrame3( Bolt3c, event )
						return 
					else
						Bolt3c:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						Bolt3c:registerEventHandler( "transition_complete_keyframe", Bolt3cFrame3 )
					end
				end
				
				Bolt3c:completeAnimation()
				self.Bolt3c:setAlpha( 0 )
				Bolt3cFrame2( Bolt3c, {} )
				local Bolt3dFrame2 = function ( Bolt3d, event )
					local Bolt3dFrame3 = function ( Bolt3d, event )
						local Bolt3dFrame4 = function ( Bolt3d, event )
							local Bolt3dFrame5 = function ( Bolt3d, event )
								local Bolt3dFrame6 = function ( Bolt3d, event )
									local Bolt3dFrame7 = function ( Bolt3d, event )
										if not event.interrupted then
											Bolt3d:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
										end
										Bolt3d:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Bolt3d, event )
										else
											Bolt3d:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Bolt3dFrame7( Bolt3d, event )
										return 
									else
										Bolt3d:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
										Bolt3d:registerEventHandler( "transition_complete_keyframe", Bolt3dFrame7 )
									end
								end
								
								if event.interrupted then
									Bolt3dFrame6( Bolt3d, event )
									return 
								else
									Bolt3d:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									Bolt3d:setAlpha( 1 )
									Bolt3d:registerEventHandler( "transition_complete_keyframe", Bolt3dFrame6 )
								end
							end
							
							if event.interrupted then
								Bolt3dFrame5( Bolt3d, event )
								return 
							else
								Bolt3d:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Bolt3d:setAlpha( 0.27 )
								Bolt3d:registerEventHandler( "transition_complete_keyframe", Bolt3dFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt3dFrame4( Bolt3d, event )
							return 
						else
							Bolt3d:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							Bolt3d:setAlpha( 1 )
							Bolt3d:registerEventHandler( "transition_complete_keyframe", Bolt3dFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt3dFrame3( Bolt3d, event )
						return 
					else
						Bolt3d:beginAnimation( "keyframe", 1250, false, false, CoD.TweenType.Linear )
						Bolt3d:registerEventHandler( "transition_complete_keyframe", Bolt3dFrame3 )
					end
				end
				
				Bolt3d:completeAnimation()
				self.Bolt3d:setAlpha( 0 )
				Bolt3dFrame2( Bolt3d, {} )
				local Bolt4aFrame2 = function ( Bolt4a, event )
					local Bolt4aFrame3 = function ( Bolt4a, event )
						local Bolt4aFrame4 = function ( Bolt4a, event )
							local Bolt4aFrame5 = function ( Bolt4a, event )
								if not event.interrupted then
									Bolt4a:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
								end
								Bolt4a:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt4a, event )
								else
									Bolt4a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt4aFrame5( Bolt4a, event )
								return 
							else
								Bolt4a:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
								Bolt4a:registerEventHandler( "transition_complete_keyframe", Bolt4aFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt4aFrame4( Bolt4a, event )
							return 
						else
							Bolt4a:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							Bolt4a:setAlpha( 0.25 )
							Bolt4a:registerEventHandler( "transition_complete_keyframe", Bolt4aFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt4aFrame3( Bolt4a, event )
						return 
					else
						Bolt4a:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						Bolt4a:registerEventHandler( "transition_complete_keyframe", Bolt4aFrame3 )
					end
				end
				
				Bolt4a:completeAnimation()
				self.Bolt4a:setAlpha( 0 )
				Bolt4aFrame2( Bolt4a, {} )
				local Bolt4bFrame2 = function ( Bolt4b, event )
					local Bolt4bFrame3 = function ( Bolt4b, event )
						local Bolt4bFrame4 = function ( Bolt4b, event )
							local Bolt4bFrame5 = function ( Bolt4b, event )
								if not event.interrupted then
									Bolt4b:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
								end
								Bolt4b:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt4b, event )
								else
									Bolt4b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt4bFrame5( Bolt4b, event )
								return 
							else
								Bolt4b:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
								Bolt4b:registerEventHandler( "transition_complete_keyframe", Bolt4bFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt4bFrame4( Bolt4b, event )
							return 
						else
							Bolt4b:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Bolt4b:setAlpha( 0.35 )
							Bolt4b:registerEventHandler( "transition_complete_keyframe", Bolt4bFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt4bFrame3( Bolt4b, event )
						return 
					else
						Bolt4b:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
						Bolt4b:registerEventHandler( "transition_complete_keyframe", Bolt4bFrame3 )
					end
				end
				
				Bolt4b:completeAnimation()
				self.Bolt4b:setAlpha( 0 )
				Bolt4bFrame2( Bolt4b, {} )
				local Bolt4cFrame2 = function ( Bolt4c, event )
					local Bolt4cFrame3 = function ( Bolt4c, event )
						local Bolt4cFrame4 = function ( Bolt4c, event )
							local Bolt4cFrame5 = function ( Bolt4c, event )
								if not event.interrupted then
									Bolt4c:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
								end
								Bolt4c:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Bolt4c, event )
								else
									Bolt4c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Bolt4cFrame5( Bolt4c, event )
								return 
							else
								Bolt4c:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
								Bolt4c:registerEventHandler( "transition_complete_keyframe", Bolt4cFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt4cFrame4( Bolt4c, event )
							return 
						else
							Bolt4c:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Bolt4c:setAlpha( 0.45 )
							Bolt4c:registerEventHandler( "transition_complete_keyframe", Bolt4cFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt4cFrame3( Bolt4c, event )
						return 
					else
						Bolt4c:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						Bolt4c:registerEventHandler( "transition_complete_keyframe", Bolt4cFrame3 )
					end
				end
				
				Bolt4c:completeAnimation()
				self.Bolt4c:setAlpha( 0 )
				Bolt4cFrame2( Bolt4c, {} )
				local Bolt4dFrame2 = function ( Bolt4d, event )
					local Bolt4dFrame3 = function ( Bolt4d, event )
						local Bolt4dFrame4 = function ( Bolt4d, event )
							local Bolt4dFrame5 = function ( Bolt4d, event )
								local Bolt4dFrame6 = function ( Bolt4d, event )
									local Bolt4dFrame7 = function ( Bolt4d, event )
										if not event.interrupted then
											Bolt4d:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
										end
										Bolt4d:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Bolt4d, event )
										else
											Bolt4d:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Bolt4dFrame7( Bolt4d, event )
										return 
									else
										Bolt4d:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
										Bolt4d:registerEventHandler( "transition_complete_keyframe", Bolt4dFrame7 )
									end
								end
								
								if event.interrupted then
									Bolt4dFrame6( Bolt4d, event )
									return 
								else
									Bolt4d:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									Bolt4d:setAlpha( 1 )
									Bolt4d:registerEventHandler( "transition_complete_keyframe", Bolt4dFrame6 )
								end
							end
							
							if event.interrupted then
								Bolt4dFrame5( Bolt4d, event )
								return 
							else
								Bolt4d:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								Bolt4d:setAlpha( 0.2 )
								Bolt4d:registerEventHandler( "transition_complete_keyframe", Bolt4dFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt4dFrame4( Bolt4d, event )
							return 
						else
							Bolt4d:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							Bolt4d:setAlpha( 1 )
							Bolt4d:registerEventHandler( "transition_complete_keyframe", Bolt4dFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt4dFrame3( Bolt4d, event )
						return 
					else
						Bolt4d:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						Bolt4d:registerEventHandler( "transition_complete_keyframe", Bolt4dFrame3 )
					end
				end
				
				Bolt4d:completeAnimation()
				self.Bolt4d:setAlpha( 0 )
				Bolt4dFrame2( Bolt4d, {} )
				local whiteFlash0Frame2 = function ( whiteFlash0, event )
					local whiteFlash0Frame3 = function ( whiteFlash0, event )
						local whiteFlash0Frame4 = function ( whiteFlash0, event )
							local whiteFlash0Frame5 = function ( whiteFlash0, event )
								local whiteFlash0Frame6 = function ( whiteFlash0, event )
									if not event.interrupted then
										whiteFlash0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
									end
									whiteFlash0:setLeftRight( true, false, 0, 234.63 )
									whiteFlash0:setTopBottom( true, false, -86.65, 199.1 )
									whiteFlash0:setAlpha( 0 )
									whiteFlash0:setScale( 1.5 )
									if event.interrupted then
										self.clipFinished( whiteFlash0, event )
									else
										whiteFlash0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									whiteFlash0Frame6( whiteFlash0, event )
									return 
								else
									whiteFlash0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
									whiteFlash0:setTopBottom( true, false, -86.65, 199.1 )
									whiteFlash0:setAlpha( 0.61 )
									whiteFlash0:setScale( 1.12 )
									whiteFlash0:registerEventHandler( "transition_complete_keyframe", whiteFlash0Frame6 )
								end
							end
							
							if event.interrupted then
								whiteFlash0Frame5( whiteFlash0, event )
								return 
							else
								whiteFlash0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								whiteFlash0:setTopBottom( true, false, -27.82, 187.25 )
								whiteFlash0:setAlpha( 0.82 )
								whiteFlash0:setScale( 0.99 )
								whiteFlash0:registerEventHandler( "transition_complete_keyframe", whiteFlash0Frame5 )
							end
						end
						
						if event.interrupted then
							whiteFlash0Frame4( whiteFlash0, event )
							return 
						else
							whiteFlash0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							whiteFlash0:setTopBottom( true, false, 23.65, 176.89 )
							whiteFlash0:setAlpha( 1 )
							whiteFlash0:setScale( 0.86 )
							whiteFlash0:registerEventHandler( "transition_complete_keyframe", whiteFlash0Frame4 )
						end
					end
					
					if event.interrupted then
						whiteFlash0Frame3( whiteFlash0, event )
						return 
					else
						whiteFlash0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						whiteFlash0:setTopBottom( true, false, 45.71, 172.45 )
						whiteFlash0:setAlpha( 0.5 )
						whiteFlash0:registerEventHandler( "transition_complete_keyframe", whiteFlash0Frame3 )
					end
				end
				
				whiteFlash0:completeAnimation()
				self.whiteFlash0:setLeftRight( true, false, 0, 234.63 )
				self.whiteFlash0:setTopBottom( true, false, 477.28, 604.03 )
				self.whiteFlash0:setAlpha( 0 )
				self.whiteFlash0:setScale( 0.8 )
				whiteFlash0Frame2( whiteFlash0, {} )
				local biglightFlareFrame2 = function ( biglightFlare, event )
					local biglightFlareFrame3 = function ( biglightFlare, event )
						local biglightFlareFrame4 = function ( biglightFlare, event )
							local biglightFlareFrame5 = function ( biglightFlare, event )
								local biglightFlareFrame6 = function ( biglightFlare, event )
									if not event.interrupted then
										biglightFlare:beginAnimation( "keyframe", 719, false, false, CoD.TweenType.Linear )
									end
									biglightFlare:setAlpha( 0 )
									biglightFlare:setZRot( -93.87 )
									biglightFlare:setScale( 1 )
									if event.interrupted then
										self.clipFinished( biglightFlare, event )
									else
										biglightFlare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									biglightFlareFrame6( biglightFlare, event )
									return 
								else
									biglightFlare:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									biglightFlare:setAlpha( 1 )
									biglightFlare:setZRot( -39.78 )
									biglightFlare:setScale( 1.3 )
									biglightFlare:registerEventHandler( "transition_complete_keyframe", biglightFlareFrame6 )
								end
							end
							
							if event.interrupted then
								biglightFlareFrame5( biglightFlare, event )
								return 
							else
								biglightFlare:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								biglightFlare:setAlpha( 0.48 )
								biglightFlare:setZRot( -36.77 )
								biglightFlare:setScale( 1.2 )
								biglightFlare:registerEventHandler( "transition_complete_keyframe", biglightFlareFrame5 )
							end
						end
						
						if event.interrupted then
							biglightFlareFrame4( biglightFlare, event )
							return 
						else
							biglightFlare:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							biglightFlare:setAlpha( 1 )
							biglightFlare:setZRot( -27.76 )
							biglightFlare:setScale( 1.5 )
							biglightFlare:registerEventHandler( "transition_complete_keyframe", biglightFlareFrame4 )
						end
					end
					
					if event.interrupted then
						biglightFlareFrame3( biglightFlare, event )
						return 
					else
						biglightFlare:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						biglightFlare:registerEventHandler( "transition_complete_keyframe", biglightFlareFrame3 )
					end
				end
				
				biglightFlare:completeAnimation()
				self.biglightFlare:setAlpha( 0 )
				self.biglightFlare:setZRot( -24 )
				self.biglightFlare:setScale( 1 )
				biglightFlareFrame2( biglightFlare, {} )
			end
		},
		Completed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 32 )
				local LargeGlowFrame2 = function ( LargeGlow, event )
					local LargeGlowFrame3 = function ( LargeGlow, event )
						local LargeGlowFrame4 = function ( LargeGlow, event )
							if not event.interrupted then
								LargeGlow:beginAnimation( "keyframe", 1860, false, false, CoD.TweenType.Linear )
							end
							LargeGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( LargeGlow, event )
							else
								LargeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LargeGlowFrame4( LargeGlow, event )
							return 
						else
							LargeGlow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							LargeGlow:setAlpha( 1 )
							LargeGlow:registerEventHandler( "transition_complete_keyframe", LargeGlowFrame4 )
						end
					end
					
					if event.interrupted then
						LargeGlowFrame3( LargeGlow, event )
						return 
					else
						LargeGlow:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						LargeGlow:registerEventHandler( "transition_complete_keyframe", LargeGlowFrame3 )
					end
				end
				
				LargeGlow:completeAnimation()
				self.LargeGlow:setAlpha( 0 )
				LargeGlowFrame2( LargeGlow, {} )
				local LargeGlow0Frame2 = function ( LargeGlow0, event )
					local LargeGlow0Frame3 = function ( LargeGlow0, event )
						local LargeGlow0Frame4 = function ( LargeGlow0, event )
							if not event.interrupted then
								LargeGlow0:beginAnimation( "keyframe", 1860, false, false, CoD.TweenType.Linear )
							end
							LargeGlow0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( LargeGlow0, event )
							else
								LargeGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LargeGlow0Frame4( LargeGlow0, event )
							return 
						else
							LargeGlow0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							LargeGlow0:setAlpha( 1 )
							LargeGlow0:registerEventHandler( "transition_complete_keyframe", LargeGlow0Frame4 )
						end
					end
					
					if event.interrupted then
						LargeGlow0Frame3( LargeGlow0, event )
						return 
					else
						LargeGlow0:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						LargeGlow0:registerEventHandler( "transition_complete_keyframe", LargeGlow0Frame3 )
					end
				end
				
				LargeGlow0:completeAnimation()
				self.LargeGlow0:setAlpha( 0 )
				LargeGlow0Frame2( LargeGlow0, {} )
				local LargeGlow00Frame2 = function ( LargeGlow00, event )
					local LargeGlow00Frame3 = function ( LargeGlow00, event )
						local LargeGlow00Frame4 = function ( LargeGlow00, event )
							if not event.interrupted then
								LargeGlow00:beginAnimation( "keyframe", 1860, false, false, CoD.TweenType.Linear )
							end
							LargeGlow00:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( LargeGlow00, event )
							else
								LargeGlow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LargeGlow00Frame4( LargeGlow00, event )
							return 
						else
							LargeGlow00:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							LargeGlow00:setAlpha( 1 )
							LargeGlow00:registerEventHandler( "transition_complete_keyframe", LargeGlow00Frame4 )
						end
					end
					
					if event.interrupted then
						LargeGlow00Frame3( LargeGlow00, event )
						return 
					else
						LargeGlow00:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						LargeGlow00:registerEventHandler( "transition_complete_keyframe", LargeGlow00Frame3 )
					end
				end
				
				LargeGlow00:completeAnimation()
				self.LargeGlow00:setAlpha( 0 )
				LargeGlow00Frame2( LargeGlow00, {} )
				local ThermometerGlowFrame2 = function ( ThermometerGlow, event )
					local ThermometerGlowFrame3 = function ( ThermometerGlow, event )
						if not event.interrupted then
							ThermometerGlow:beginAnimation( "keyframe", 1290, false, false, CoD.TweenType.Linear )
						end
						ThermometerGlow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ThermometerGlow, event )
						else
							ThermometerGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ThermometerGlowFrame3( ThermometerGlow, event )
						return 
					else
						ThermometerGlow:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						ThermometerGlow:setAlpha( 0.3 )
						ThermometerGlow:registerEventHandler( "transition_complete_keyframe", ThermometerGlowFrame3 )
					end
				end
				
				ThermometerGlow:completeAnimation()
				self.ThermometerGlow:setAlpha( 0 )
				ThermometerGlowFrame2( ThermometerGlow, {} )
				local CoreCompleteFrame2 = function ( CoreComplete, event )
					local CoreCompleteFrame3 = function ( CoreComplete, event )
						local CoreCompleteFrame4 = function ( CoreComplete, event )
							local CoreCompleteFrame5 = function ( CoreComplete, event )
								local CoreCompleteFrame6 = function ( CoreComplete, event )
									local CoreCompleteFrame7 = function ( CoreComplete, event )
										local CoreCompleteFrame8 = function ( CoreComplete, event )
											local CoreCompleteFrame9 = function ( CoreComplete, event )
												local CoreCompleteFrame10 = function ( CoreComplete, event )
													local CoreCompleteFrame11 = function ( CoreComplete, event )
														local CoreCompleteFrame12 = function ( CoreComplete, event )
															local CoreCompleteFrame13 = function ( CoreComplete, event )
																if not event.interrupted then
																	CoreComplete:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																end
																CoreComplete:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( CoreComplete, event )
																else
																	CoreComplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																CoreCompleteFrame13( CoreComplete, event )
																return 
															else
																CoreComplete:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																CoreComplete:setAlpha( 0.99 )
																CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame13 )
															end
														end
														
														if event.interrupted then
															CoreCompleteFrame12( CoreComplete, event )
															return 
														else
															CoreComplete:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
															CoreComplete:setAlpha( 0.43 )
															CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame12 )
														end
													end
													
													if event.interrupted then
														CoreCompleteFrame11( CoreComplete, event )
														return 
													else
														CoreComplete:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
														CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame11 )
													end
												end
												
												if event.interrupted then
													CoreCompleteFrame10( CoreComplete, event )
													return 
												else
													CoreComplete:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame10 )
												end
											end
											
											if event.interrupted then
												CoreCompleteFrame9( CoreComplete, event )
												return 
											else
												CoreComplete:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
												CoreComplete:setAlpha( 1 )
												CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame9 )
											end
										end
										
										if event.interrupted then
											CoreCompleteFrame8( CoreComplete, event )
											return 
										else
											CoreComplete:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
											CoreComplete:setAlpha( 0.66 )
											CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame8 )
										end
									end
									
									if event.interrupted then
										CoreCompleteFrame7( CoreComplete, event )
										return 
									else
										CoreComplete:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
										CoreComplete:setAlpha( 1 )
										CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame7 )
									end
								end
								
								if event.interrupted then
									CoreCompleteFrame6( CoreComplete, event )
									return 
								else
									CoreComplete:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
									CoreComplete:setAlpha( 0.55 )
									CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame6 )
								end
							end
							
							if event.interrupted then
								CoreCompleteFrame5( CoreComplete, event )
								return 
							else
								CoreComplete:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
								CoreComplete:setAlpha( 1 )
								CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame5 )
							end
						end
						
						if event.interrupted then
							CoreCompleteFrame4( CoreComplete, event )
							return 
						else
							CoreComplete:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							CoreComplete:setAlpha( 0.65 )
							CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame4 )
						end
					end
					
					if event.interrupted then
						CoreCompleteFrame3( CoreComplete, event )
						return 
					else
						CoreComplete:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						CoreComplete:setAlpha( 1 )
						CoreComplete:registerEventHandler( "transition_complete_keyframe", CoreCompleteFrame3 )
					end
				end
				
				CoreComplete:completeAnimation()
				self.CoreComplete:setAlpha( 0 )
				CoreCompleteFrame2( CoreComplete, {} )
				Bolt1a:completeAnimation()
				self.Bolt1a:setAlpha( 0 )
				self.clipFinished( Bolt1a, {} )
				Bolt1b:completeAnimation()
				self.Bolt1b:setAlpha( 0 )
				self.clipFinished( Bolt1b, {} )
				local Bolt1cFrame2 = function ( Bolt1c, event )
					local Bolt1cFrame3 = function ( Bolt1c, event )
						local Bolt1cFrame4 = function ( Bolt1c, event )
							if not event.interrupted then
								Bolt1c:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							end
							Bolt1c:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Bolt1c, event )
							else
								Bolt1c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Bolt1cFrame4( Bolt1c, event )
							return 
						else
							Bolt1c:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Bolt1c:setAlpha( 1 )
							Bolt1c:registerEventHandler( "transition_complete_keyframe", Bolt1cFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt1cFrame3( Bolt1c, event )
						return 
					else
						Bolt1c:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						Bolt1c:registerEventHandler( "transition_complete_keyframe", Bolt1cFrame3 )
					end
				end
				
				Bolt1c:completeAnimation()
				self.Bolt1c:setAlpha( 0 )
				Bolt1cFrame2( Bolt1c, {} )
				local Bolt2aFrame2 = function ( Bolt2a, event )
					local Bolt2aFrame3 = function ( Bolt2a, event )
						local Bolt2aFrame4 = function ( Bolt2a, event )
							if not event.interrupted then
								Bolt2a:beginAnimation( "keyframe", 789, false, false, CoD.TweenType.Linear )
							end
							Bolt2a:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Bolt2a, event )
							else
								Bolt2a:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Bolt2aFrame4( Bolt2a, event )
							return 
						else
							Bolt2a:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Bolt2a:setAlpha( 1 )
							Bolt2a:registerEventHandler( "transition_complete_keyframe", Bolt2aFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt2aFrame3( Bolt2a, event )
						return 
					else
						Bolt2a:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						Bolt2a:registerEventHandler( "transition_complete_keyframe", Bolt2aFrame3 )
					end
				end
				
				Bolt2a:completeAnimation()
				self.Bolt2a:setAlpha( 0 )
				Bolt2aFrame2( Bolt2a, {} )
				Bolt2b:completeAnimation()
				self.Bolt2b:setAlpha( 0 )
				self.clipFinished( Bolt2b, {} )
				Bolt2c:completeAnimation()
				self.Bolt2c:setAlpha( 0 )
				self.clipFinished( Bolt2c, {} )
				local Bolt2dFrame2 = function ( Bolt2d, event )
					local Bolt2dFrame3 = function ( Bolt2d, event )
						local Bolt2dFrame4 = function ( Bolt2d, event )
							if not event.interrupted then
								Bolt2d:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
							end
							Bolt2d:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Bolt2d, event )
							else
								Bolt2d:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Bolt2dFrame4( Bolt2d, event )
							return 
						else
							Bolt2d:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Bolt2d:setAlpha( 0.61 )
							Bolt2d:registerEventHandler( "transition_complete_keyframe", Bolt2dFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt2dFrame3( Bolt2d, event )
						return 
					else
						Bolt2d:beginAnimation( "keyframe", 1519, false, false, CoD.TweenType.Linear )
						Bolt2d:registerEventHandler( "transition_complete_keyframe", Bolt2dFrame3 )
					end
				end
				
				Bolt2d:completeAnimation()
				self.Bolt2d:setAlpha( 0 )
				Bolt2dFrame2( Bolt2d, {} )
				Bolt3a:completeAnimation()
				self.Bolt3a:setAlpha( 0 )
				self.clipFinished( Bolt3a, {} )
				Bolt3b:completeAnimation()
				self.Bolt3b:setAlpha( 0 )
				self.clipFinished( Bolt3b, {} )
				local Bolt3cFrame2 = function ( Bolt3c, event )
					local Bolt3cFrame3 = function ( Bolt3c, event )
						local Bolt3cFrame4 = function ( Bolt3c, event )
							local Bolt3cFrame5 = function ( Bolt3c, event )
								local Bolt3cFrame6 = function ( Bolt3c, event )
									local Bolt3cFrame7 = function ( Bolt3c, event )
										if not event.interrupted then
											Bolt3c:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
										end
										Bolt3c:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Bolt3c, event )
										else
											Bolt3c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Bolt3cFrame7( Bolt3c, event )
										return 
									else
										Bolt3c:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										Bolt3c:setAlpha( 0.14 )
										Bolt3c:registerEventHandler( "transition_complete_keyframe", Bolt3cFrame7 )
									end
								end
								
								if event.interrupted then
									Bolt3cFrame6( Bolt3c, event )
									return 
								else
									Bolt3c:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
									Bolt3c:registerEventHandler( "transition_complete_keyframe", Bolt3cFrame6 )
								end
							end
							
							if event.interrupted then
								Bolt3cFrame5( Bolt3c, event )
								return 
							else
								Bolt3c:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Linear )
								Bolt3c:setAlpha( 0 )
								Bolt3c:registerEventHandler( "transition_complete_keyframe", Bolt3cFrame5 )
							end
						end
						
						if event.interrupted then
							Bolt3cFrame4( Bolt3c, event )
							return 
						else
							Bolt3c:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Bolt3c:setAlpha( 1 )
							Bolt3c:registerEventHandler( "transition_complete_keyframe", Bolt3cFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt3cFrame3( Bolt3c, event )
						return 
					else
						Bolt3c:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						Bolt3c:registerEventHandler( "transition_complete_keyframe", Bolt3cFrame3 )
					end
				end
				
				Bolt3c:completeAnimation()
				self.Bolt3c:setAlpha( 0 )
				Bolt3cFrame2( Bolt3c, {} )
				Bolt3d:completeAnimation()
				self.Bolt3d:setAlpha( 0 )
				self.clipFinished( Bolt3d, {} )
				Bolt4a:completeAnimation()
				self.Bolt4a:setAlpha( 0 )
				self.clipFinished( Bolt4a, {} )
				Bolt4b:completeAnimation()
				self.Bolt4b:setAlpha( 0 )
				self.clipFinished( Bolt4b, {} )
				local Bolt4cFrame2 = function ( Bolt4c, event )
					local Bolt4cFrame3 = function ( Bolt4c, event )
						local Bolt4cFrame4 = function ( Bolt4c, event )
							if not event.interrupted then
								Bolt4c:beginAnimation( "keyframe", 470, false, false, CoD.TweenType.Linear )
							end
							Bolt4c:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Bolt4c, event )
							else
								Bolt4c:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Bolt4cFrame4( Bolt4c, event )
							return 
						else
							Bolt4c:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Bolt4c:setAlpha( 0.91 )
							Bolt4c:registerEventHandler( "transition_complete_keyframe", Bolt4cFrame4 )
						end
					end
					
					if event.interrupted then
						Bolt4cFrame3( Bolt4c, event )
						return 
					else
						Bolt4c:beginAnimation( "keyframe", 2029, false, false, CoD.TweenType.Linear )
						Bolt4c:registerEventHandler( "transition_complete_keyframe", Bolt4cFrame3 )
					end
				end
				
				Bolt4c:completeAnimation()
				self.Bolt4c:setAlpha( 0 )
				Bolt4cFrame2( Bolt4c, {} )
				Bolt4d:completeAnimation()
				self.Bolt4d:setAlpha( 0 )
				self.clipFinished( Bolt4d, {} )
				whiteFlash0:completeAnimation()
				self.whiteFlash0:setLeftRight( true, false, 0, 234.63 )
				self.whiteFlash0:setTopBottom( true, false, 477.28, 604.03 )
				self.whiteFlash0:setAlpha( 0 )
				self.whiteFlash0:setScale( 0.8 )
				self.clipFinished( whiteFlash0, {} )
				local biglightFlareFrame2 = function ( biglightFlare, event )
					local biglightFlareFrame3 = function ( biglightFlare, event )
						if not event.interrupted then
							biglightFlare:beginAnimation( "keyframe", 1929, false, false, CoD.TweenType.Linear )
						end
						biglightFlare:setAlpha( 0 )
						biglightFlare:setZRot( -80 )
						if event.interrupted then
							self.clipFinished( biglightFlare, event )
						else
							biglightFlare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						biglightFlareFrame3( biglightFlare, event )
						return 
					else
						biglightFlare:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
						biglightFlare:setAlpha( 0.6 )
						biglightFlare:setZRot( -29.54 )
						biglightFlare:registerEventHandler( "transition_complete_keyframe", biglightFlareFrame3 )
					end
				end
				
				biglightFlare:completeAnimation()
				self.biglightFlare:setAlpha( 0 )
				self.biglightFlare:setZRot( 0 )
				biglightFlareFrame2( biglightFlare, {} )
				local f110_local11 = function ( f154_arg0, f154_arg1 )
					local f154_local0 = function ( f155_arg0, f155_arg1 )
						local f155_local0 = function ( f156_arg0, f156_arg1 )
							if not f156_arg1.interrupted then
								f156_arg0:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
							end
							f156_arg0:setAlpha( 0 )
							f156_arg0:setScale( 1.6 )
							if f156_arg1.interrupted then
								self.clipFinished( f156_arg0, f156_arg1 )
							else
								f156_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f155_arg1.interrupted then
							f155_local0( f155_arg0, f155_arg1 )
							return 
						else
							f155_arg0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
							f155_arg0:setAlpha( 0.15 )
							f155_arg0:setScale( 1.26 )
							f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
						end
					end
					
					if f154_arg1.interrupted then
						f154_local0( f154_arg0, f154_arg1 )
						return 
					else
						f154_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f154_arg0:setAlpha( 0.4 )
						f154_arg0:setScale( 1.1 )
						f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
					end
				end
				
				GlowPulseOuter:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
				GlowPulseOuter:setAlpha( 0 )
				GlowPulseOuter:setScale( 1 )
				GlowPulseOuter:registerEventHandler( "transition_complete_keyframe", f110_local11 )
				local f110_local12 = function ( f157_arg0, f157_arg1 )
					local f157_local0 = function ( f158_arg0, f158_arg1 )
						local f158_local0 = function ( f159_arg0, f159_arg1 )
							if not f159_arg1.interrupted then
								f159_arg0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
							end
							f159_arg0:setAlpha( 0 )
							f159_arg0:setScale( 2.5 )
							if f159_arg1.interrupted then
								self.clipFinished( f159_arg0, f159_arg1 )
							else
								f159_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f158_arg1.interrupted then
							f158_local0( f158_arg0, f158_arg1 )
							return 
						else
							f158_arg0:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
							f158_arg0:setAlpha( 0.25 )
							f158_arg0:setScale( 1.71 )
							f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
						end
					end
					
					if f157_arg1.interrupted then
						f157_local0( f157_arg0, f157_arg1 )
						return 
					else
						f157_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f157_arg0:setAlpha( 1 )
						f157_arg0:registerEventHandler( "transition_complete_keyframe", f157_local0 )
					end
				end
				
				GlowPulseOuter2:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
				GlowPulseOuter2:setAlpha( 0 )
				GlowPulseOuter2:setScale( 1.2 )
				GlowPulseOuter2:registerEventHandler( "transition_complete_keyframe", f110_local12 )
				local f110_local13 = function ( f160_arg0, f160_arg1 )
					local f160_local0 = function ( f161_arg0, f161_arg1 )
						local f161_local0 = function ( f162_arg0, f162_arg1 )
							if not f162_arg1.interrupted then
								f162_arg0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
							end
							f162_arg0:setLeftRight( true, false, 27, 207 )
							f162_arg0:setTopBottom( false, true, -620.17, -472.17 )
							f162_arg0:setAlpha( 0 )
							if f162_arg1.interrupted then
								self.clipFinished( f162_arg0, f162_arg1 )
							else
								f162_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f161_arg1.interrupted then
							f161_local0( f161_arg0, f161_arg1 )
							return 
						else
							f161_arg0:beginAnimation( "keyframe", 1189, false, false, CoD.TweenType.Linear )
							f161_arg0:setTopBottom( false, true, -558.56, -410.56 )
							f161_arg0:registerEventHandler( "transition_complete_keyframe", f161_local0 )
						end
					end
					
					if f160_arg1.interrupted then
						f160_local0( f160_arg0, f160_arg1 )
						return 
					else
						f160_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f160_arg0:setAlpha( 0.25 )
						f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
					end
				end
				
				GlowPulseLine:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
				GlowPulseLine:setLeftRight( true, false, 27, 207 )
				GlowPulseLine:setTopBottom( false, true, -225.33, -77.33 )
				GlowPulseLine:setAlpha( 0 )
				GlowPulseLine:registerEventHandler( "transition_complete_keyframe", f110_local13 )
				local GlowPulseLine0Frame2 = function ( GlowPulseLine0, event )
					local GlowPulseLine0Frame3 = function ( GlowPulseLine0, event )
						local GlowPulseLine0Frame4 = function ( GlowPulseLine0, event )
							local GlowPulseLine0Frame5 = function ( GlowPulseLine0, event )
								if not event.interrupted then
									GlowPulseLine0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
								end
								GlowPulseLine0:setLeftRight( true, false, 102, 134.59 )
								GlowPulseLine0:setTopBottom( false, true, -568.76, -526.33 )
								GlowPulseLine0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( GlowPulseLine0, event )
								else
									GlowPulseLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowPulseLine0Frame5( GlowPulseLine0, event )
								return 
							else
								GlowPulseLine0:beginAnimation( "keyframe", 1189, false, false, CoD.TweenType.Linear )
								GlowPulseLine0:setTopBottom( false, true, -507.01, -464.59 )
								GlowPulseLine0:setAlpha( 0.3 )
								GlowPulseLine0:registerEventHandler( "transition_complete_keyframe", GlowPulseLine0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowPulseLine0Frame4( GlowPulseLine0, event )
							return 
						else
							GlowPulseLine0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							GlowPulseLine0:setAlpha( 0.6 )
							GlowPulseLine0:registerEventHandler( "transition_complete_keyframe", GlowPulseLine0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowPulseLine0Frame3( GlowPulseLine0, event )
						return 
					else
						GlowPulseLine0:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						GlowPulseLine0:registerEventHandler( "transition_complete_keyframe", GlowPulseLine0Frame3 )
					end
				end
				
				GlowPulseLine0:completeAnimation()
				self.GlowPulseLine0:setLeftRight( true, false, 102, 134.59 )
				self.GlowPulseLine0:setTopBottom( false, true, -173.04, -130.62 )
				self.GlowPulseLine0:setAlpha( 0 )
				GlowPulseLine0Frame2( GlowPulseLine0, {} )
				local f110_local15 = function ( f167_arg0, f167_arg1 )
					local f167_local0 = function ( f168_arg0, f168_arg1 )
						if not f168_arg1.interrupted then
							f168_arg0:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
						end
						f168_arg0:setAlpha( 0 )
						if f168_arg1.interrupted then
							self.clipFinished( f168_arg0, f168_arg1 )
						else
							f168_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f167_arg1.interrupted then
						f167_local0( f167_arg0, f167_arg1 )
						return 
					else
						f167_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f167_arg0:setAlpha( 1 )
						f167_arg0:registerEventHandler( "transition_complete_keyframe", f167_local0 )
					end
				end
				
				GlowDots:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
				GlowDots:setAlpha( 0 )
				GlowDots:registerEventHandler( "transition_complete_keyframe", f110_local15 )
				local f110_local16 = function ( f169_arg0, f169_arg1 )
					local f169_local0 = function ( f170_arg0, f170_arg1 )
						if not f170_arg1.interrupted then
							f170_arg0:beginAnimation( "keyframe", 530, false, false, CoD.TweenType.Linear )
						end
						f170_arg0:setAlpha( 0 )
						if f170_arg1.interrupted then
							self.clipFinished( f170_arg0, f170_arg1 )
						else
							f170_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f169_arg1.interrupted then
						f169_local0( f169_arg0, f169_arg1 )
						return 
					else
						f169_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f169_arg0:setAlpha( 1 )
						f169_arg0:registerEventHandler( "transition_complete_keyframe", f169_local0 )
					end
				end
				
				GlowDots2:beginAnimation( "keyframe", 1399, false, false, CoD.TweenType.Linear )
				GlowDots2:setAlpha( 0 )
				GlowDots2:registerEventHandler( "transition_complete_keyframe", f110_local16 )
				local f110_local17 = function ( f171_arg0, f171_arg1 )
					local f171_local0 = function ( f172_arg0, f172_arg1 )
						if not f172_arg1.interrupted then
							f172_arg0:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						end
						f172_arg0:setAlpha( 0 )
						if f172_arg1.interrupted then
							self.clipFinished( f172_arg0, f172_arg1 )
						else
							f172_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f171_arg1.interrupted then
						f171_local0( f171_arg0, f171_arg1 )
						return 
					else
						f171_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f171_arg0:setAlpha( 1 )
						f171_arg0:registerEventHandler( "transition_complete_keyframe", f171_local0 )
					end
				end
				
				GlowDots3:beginAnimation( "keyframe", 1750, false, false, CoD.TweenType.Linear )
				GlowDots3:setAlpha( 0 )
				GlowDots3:registerEventHandler( "transition_complete_keyframe", f110_local17 )
				local f110_local18 = function ( f173_arg0, f173_arg1 )
					local f173_local0 = function ( f174_arg0, f174_arg1 )
						if not f174_arg1.interrupted then
							f174_arg0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						f174_arg0:setAlpha( 0 )
						if f174_arg1.interrupted then
							self.clipFinished( f174_arg0, f174_arg1 )
						else
							f174_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f173_arg1.interrupted then
						f173_local0( f173_arg0, f173_arg1 )
						return 
					else
						f173_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f173_arg0:setAlpha( 1 )
						f173_arg0:registerEventHandler( "transition_complete_keyframe", f173_local0 )
					end
				end
				
				GlowDots4:beginAnimation( "keyframe", 2130, false, false, CoD.TweenType.Linear )
				GlowDots4:setAlpha( 0 )
				GlowDots4:registerEventHandler( "transition_complete_keyframe", f110_local18 )
				local f110_local19 = function ( f175_arg0, f175_arg1 )
					local f175_local0 = function ( f176_arg0, f176_arg1 )
						if not f176_arg1.interrupted then
							f176_arg0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						f176_arg0:setAlpha( 0 )
						if f176_arg1.interrupted then
							self.clipFinished( f176_arg0, f176_arg1 )
						else
							f176_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f175_arg1.interrupted then
						f175_local0( f175_arg0, f175_arg1 )
						return 
					else
						f175_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f175_arg0:setAlpha( 1 )
						f175_arg0:registerEventHandler( "transition_complete_keyframe", f175_local0 )
					end
				end
				
				GlowDots5:beginAnimation( "keyframe", 2450, false, false, CoD.TweenType.Linear )
				GlowDots5:setAlpha( 0 )
				GlowDots5:registerEventHandler( "transition_complete_keyframe", f110_local19 )
				local GlowPulseFrame2 = function ( GlowPulse, event )
					local GlowPulseFrame3 = function ( GlowPulse, event )
						local GlowPulseFrame4 = function ( GlowPulse, event )
							if not event.interrupted then
								GlowPulse:beginAnimation( "keyframe", 1760, false, false, CoD.TweenType.Linear )
							end
							GlowPulse:setAlpha( 0 )
							GlowPulse:setScale( 1.6 )
							if event.interrupted then
								self.clipFinished( GlowPulse, event )
							else
								GlowPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowPulseFrame4( GlowPulse, event )
							return 
						else
							GlowPulse:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							GlowPulse:setAlpha( 0.2 )
							GlowPulse:setScale( 1.1 )
							GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame4 )
						end
					end
					
					if event.interrupted then
						GlowPulseFrame3( GlowPulse, event )
						return 
					else
						GlowPulse:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						GlowPulse:registerEventHandler( "transition_complete_keyframe", GlowPulseFrame3 )
					end
				end
				
				GlowPulse:completeAnimation()
				self.GlowPulse:setAlpha( 0 )
				self.GlowPulse:setScale( 1 )
				GlowPulseFrame2( GlowPulse, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Completed",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Completed" )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

