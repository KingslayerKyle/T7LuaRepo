-- 5103d838ad6441e4b991cd0a5c558615
-- This hash is used for caching, delete to decompile the file again

CoD.Promo_ThermometerAndRewards_Idol = InheritFrom( LUI.UIElement )
CoD.Promo_ThermometerAndRewards_Idol.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.Promo_ThermometerAndRewards_Idol )
	self.id = "Promo_ThermometerAndRewards_Idol"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 243 )
	self:setTopBottom( true, false, 0, 594 )
	
	local ThermometerGlow = LUI.UIImage.new()
	ThermometerGlow:setLeftRight( true, false, 15.38, 227.13 )
	ThermometerGlow:setTopBottom( false, true, -594, -29.33 )
	ThermometerGlow:setAlpha( 0.25 )
	ThermometerGlow:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_mainbargglow" ) )
	ThermometerGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	ThermometerGlow:setShaderVector( 0, 0, 1, 0, 0 )
	ThermometerGlow:setShaderVector( 1, 0, 0, 0, 0 )
	ThermometerGlow:setShaderVector( 2, -0.13, 0.92, 0, 0 )
	ThermometerGlow:setShaderVector( 3, 0.62, 0.21, 0, 0 )
	self:addElement( ThermometerGlow )
	self.ThermometerGlow = ThermometerGlow
	
	local biglightFlare = LUI.UIImage.new()
	biglightFlare:setLeftRight( true, false, 0, 242.51 )
	biglightFlare:setTopBottom( false, true, -204.93, 0.27 )
	biglightFlare:setAlpha( 0 )
	biglightFlare:setImage( RegisterImage( "uie_t7_callingcards_champion_light4" ) )
	biglightFlare:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( biglightFlare )
	self.biglightFlare = biglightFlare
	
	local GlowPulse = LUI.UIImage.new()
	GlowPulse:setLeftRight( true, false, 31.75, 207.75 )
	GlowPulse:setTopBottom( false, true, -185.33, -9.33 )
	GlowPulse:setAlpha( 0 )
	GlowPulse:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowpulse" ) )
	GlowPulse:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowPulse )
	self.GlowPulse = GlowPulse
	
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
	GlowPulseLine:setTopBottom( false, true, -236.33, -88.33 )
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
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 46.4, 198.6 )
	Image0:setTopBottom( false, true, -586, -417.79 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_mainbargglowtip" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	Image0:setShaderVector( 0, 0, 1, 0, 0 )
	Image0:setShaderVector( 1, 0, 0, 0, 0 )
	Image0:setShaderVector( 2, -0.13, 0.92, 0, 0 )
	Image0:setShaderVector( 3, 0.62, 0.21, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local uinThmIdle = LUI.UIElement.new()
	uinThmIdle:setLeftRight( true, false, -203.02, -155.02 )
	uinThmIdle:setTopBottom( true, false, 665.44, 713.44 )
	uinThmIdle:setPlaySoundDirect( true )
	self:addElement( uinThmIdle )
	self.uinThmIdle = uinThmIdle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				local ThermometerGlowFrame2 = function ( ThermometerGlow, event )
					local ThermometerGlowFrame3 = function ( ThermometerGlow, event )
						local ThermometerGlowFrame4 = function ( ThermometerGlow, event )
							local ThermometerGlowFrame5 = function ( ThermometerGlow, event )
								local ThermometerGlowFrame6 = function ( ThermometerGlow, event )
									if not event.interrupted then
										ThermometerGlow:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
									end
									ThermometerGlow:setAlpha( 0 )
									ThermometerGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
									ThermometerGlow:setShaderVector( 0, 0, 1, 0, 0 )
									ThermometerGlow:setShaderVector( 1, 0, 0, 0, 0 )
									ThermometerGlow:setShaderVector( 2, -0.24, 1, 0, 0 )
									ThermometerGlow:setShaderVector( 3, 0.45, 2.29, 0, 0 )
									if event.interrupted then
										self.clipFinished( ThermometerGlow, event )
									else
										ThermometerGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ThermometerGlowFrame6( ThermometerGlow, event )
									return 
								else
									ThermometerGlow:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
									ThermometerGlow:setAlpha( 1 )
									ThermometerGlow:setShaderVector( 2, -0.24, 1, 0, 0 )
									ThermometerGlow:setShaderVector( 3, 0.45, 2.29, 0, 0 )
									ThermometerGlow:registerEventHandler( "transition_complete_keyframe", ThermometerGlowFrame6 )
								end
							end
							
							if event.interrupted then
								ThermometerGlowFrame5( ThermometerGlow, event )
								return 
							else
								ThermometerGlow:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
								ThermometerGlow:setAlpha( 0.33 )
								ThermometerGlow:setShaderVector( 2, 0.21, 1, 0, 0 )
								ThermometerGlow:setShaderVector( 3, 0.41, 0.74, 0, 0 )
								ThermometerGlow:registerEventHandler( "transition_complete_keyframe", ThermometerGlowFrame5 )
							end
						end
						
						if event.interrupted then
							ThermometerGlowFrame4( ThermometerGlow, event )
							return 
						else
							ThermometerGlow:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
							ThermometerGlow:setAlpha( 0.3 )
							ThermometerGlow:setShaderVector( 2, 0.42, 1, 0, 0 )
							ThermometerGlow:setShaderVector( 3, 0.41, 0.21, 0, 0 )
							ThermometerGlow:registerEventHandler( "transition_complete_keyframe", ThermometerGlowFrame4 )
						end
					end
					
					if event.interrupted then
						ThermometerGlowFrame3( ThermometerGlow, event )
						return 
					else
						ThermometerGlow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						ThermometerGlow:setAlpha( 0.64 )
						ThermometerGlow:setShaderVector( 2, 0.6, 0.93, 0, 0 )
						ThermometerGlow:setShaderVector( 3, 0.6, 0.21, 0, 0 )
						ThermometerGlow:registerEventHandler( "transition_complete_keyframe", ThermometerGlowFrame3 )
					end
				end
				
				ThermometerGlow:completeAnimation()
				self.ThermometerGlow:setAlpha( 0 )
				self.ThermometerGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.ThermometerGlow:setShaderVector( 0, 0, 1, 0, 0 )
				self.ThermometerGlow:setShaderVector( 1, 0, 0, 0, 0 )
				self.ThermometerGlow:setShaderVector( 2, 0.62, 0.92, 0, 0 )
				self.ThermometerGlow:setShaderVector( 3, 0.62, 0.21, 0, 0 )
				ThermometerGlowFrame2( ThermometerGlow, {} )
				local biglightFlareFrame2 = function ( biglightFlare, event )
					local biglightFlareFrame3 = function ( biglightFlare, event )
						if not event.interrupted then
							biglightFlare:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
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
						biglightFlare:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						biglightFlare:setAlpha( 0.5 )
						biglightFlare:setZRot( -34.78 )
						biglightFlare:registerEventHandler( "transition_complete_keyframe", biglightFlareFrame3 )
					end
				end
				
				biglightFlare:completeAnimation()
				self.biglightFlare:setAlpha( 0 )
				self.biglightFlare:setZRot( 0 )
				biglightFlareFrame2( biglightFlare, {} )
				local f2_local2 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f11_arg0, f11_arg1 )
						if not f11_arg1.interrupted then
							f11_arg0:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
						end
						f11_arg0:setAlpha( 0 )
						if f11_arg1.interrupted then
							self.clipFinished( f11_arg0, f11_arg1 )
						else
							f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f10_arg1.interrupted then
						f10_local0( f10_arg0, f10_arg1 )
						return 
					else
						f10_arg0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						f10_arg0:setAlpha( 0.8 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				GlowPulse:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowPulse:setAlpha( 0 )
				GlowPulse:registerEventHandler( "transition_complete_keyframe", f2_local2 )
				local f2_local3 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f13_arg0, f13_arg1 )
						local f13_local0 = function ( f14_arg0, f14_arg1 )
							if not f14_arg1.interrupted then
								f14_arg0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							f14_arg0:setAlpha( 0 )
							f14_arg0:setScale( 1.6 )
							if f14_arg1.interrupted then
								self.clipFinished( f14_arg0, f14_arg1 )
							else
								f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f13_arg1.interrupted then
							f13_local0( f13_arg0, f13_arg1 )
							return 
						else
							f13_arg0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							f13_arg0:setAlpha( 0.15 )
							f13_arg0:setScale( 1.3 )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f12_arg0:setAlpha( 0.4 )
						f12_arg0:setScale( 1.1 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				GlowPulseOuter:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
				GlowPulseOuter:setAlpha( 0 )
				GlowPulseOuter:setScale( 1 )
				GlowPulseOuter:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f15_arg0, f15_arg1 )
					local f15_local0 = function ( f16_arg0, f16_arg1 )
						local f16_local0 = function ( f17_arg0, f17_arg1 )
							local f17_local0 = function ( f18_arg0, f18_arg1 )
								if not f18_arg1.interrupted then
									f18_arg0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
								end
								f18_arg0:setAlpha( 0 )
								f18_arg0:setScale( 2.7 )
								if f18_arg1.interrupted then
									self.clipFinished( f18_arg0, f18_arg1 )
								else
									f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f17_arg1.interrupted then
								f17_local0( f17_arg0, f17_arg1 )
								return 
							else
								f17_arg0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
								f17_arg0:setAlpha( 0.23 )
								f17_arg0:setScale( 1.6 )
								f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
							end
						end
						
						if f16_arg1.interrupted then
							f16_local0( f16_arg0, f16_arg1 )
							return 
						else
							f16_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							f16_arg0:setAlpha( 1 )
							f16_arg0:setScale( 1.2 )
							f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
						end
					end
					
					if f15_arg1.interrupted then
						f15_local0( f15_arg0, f15_arg1 )
						return 
					else
						f15_arg0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
						f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
					end
				end
				
				GlowPulseOuter2:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowPulseOuter2:setAlpha( 0 )
				GlowPulseOuter2:setScale( 1 )
				GlowPulseOuter2:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local f2_local5 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f20_arg0, f20_arg1 )
						local f20_local0 = function ( f21_arg0, f21_arg1 )
							if not f21_arg1.interrupted then
								f21_arg0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							end
							f21_arg0:setLeftRight( true, false, 27, 207 )
							f21_arg0:setTopBottom( false, true, -611, -463 )
							f21_arg0:setAlpha( 0 )
							if f21_arg1.interrupted then
								self.clipFinished( f21_arg0, f21_arg1 )
							else
								f21_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f20_arg1.interrupted then
							f20_local0( f20_arg0, f20_arg1 )
							return 
						else
							f20_arg0:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
							f20_arg0:setLeftRight( true, false, 27, 207 )
							f20_arg0:setTopBottom( false, true, -518.77, -370.77 )
							f20_arg0:setAlpha( 0 )
							f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						f19_arg0:setAlpha( 0.35 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				GlowPulseLine:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowPulseLine:setLeftRight( true, false, 27, 207 )
				GlowPulseLine:setTopBottom( false, true, -236.33, -88.33 )
				GlowPulseLine:setAlpha( 0 )
				GlowPulseLine:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local f2_local6 = function ( f22_arg0, f22_arg1 )
					local f22_local0 = function ( f23_arg0, f23_arg1 )
						if not f23_arg1.interrupted then
							f23_arg0:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
						end
						f23_arg0:setLeftRight( true, false, 102.71, 135.3 )
						f23_arg0:setTopBottom( false, true, -558.21, -515.79 )
						f23_arg0:setAlpha( 0 )
						if f23_arg1.interrupted then
							self.clipFinished( f23_arg0, f23_arg1 )
						else
							f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f22_arg1.interrupted then
						f22_local0( f22_arg0, f22_arg1 )
						return 
					else
						f22_arg0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						f22_arg0:setAlpha( 1 )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
				end
				
				GlowPulseLine0:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowPulseLine0:setLeftRight( true, false, 101.71, 134.3 )
				GlowPulseLine0:setTopBottom( false, true, -183.54, -141.12 )
				GlowPulseLine0:setAlpha( 0 )
				GlowPulseLine0:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local f2_local7 = function ( f24_arg0, f24_arg1 )
					local f24_local0 = function ( f25_arg0, f25_arg1 )
						local f25_local0 = function ( f26_arg0, f26_arg1 )
							if not f26_arg1.interrupted then
								f26_arg0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							end
							f26_arg0:setAlpha( 0 )
							if f26_arg1.interrupted then
								self.clipFinished( f26_arg0, f26_arg1 )
							else
								f26_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f25_arg1.interrupted then
							f25_local0( f25_arg0, f25_arg1 )
							return 
						else
							f25_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							f25_arg0:setAlpha( 1 )
							f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
						end
					end
					
					if f24_arg1.interrupted then
						f24_local0( f24_arg0, f24_arg1 )
						return 
					else
						f24_arg0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
						f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
					end
				end
				
				GlowDots:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowDots:setAlpha( 0 )
				GlowDots:registerEventHandler( "transition_complete_keyframe", f2_local7 )
				local f2_local8 = function ( f27_arg0, f27_arg1 )
					local f27_local0 = function ( f28_arg0, f28_arg1 )
						local f28_local0 = function ( f29_arg0, f29_arg1 )
							if not f29_arg1.interrupted then
								f29_arg0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
							end
							f29_arg0:setAlpha( 0 )
							if f29_arg1.interrupted then
								self.clipFinished( f29_arg0, f29_arg1 )
							else
								f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f28_arg1.interrupted then
							f28_local0( f28_arg0, f28_arg1 )
							return 
						else
							f28_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							f28_arg0:setAlpha( 1 )
							f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
						end
					end
					
					if f27_arg1.interrupted then
						f27_local0( f27_arg0, f27_arg1 )
						return 
					else
						f27_arg0:beginAnimation( "keyframe", 630, false, false, CoD.TweenType.Linear )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
				end
				
				GlowDots2:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowDots2:setAlpha( 0 )
				GlowDots2:registerEventHandler( "transition_complete_keyframe", f2_local8 )
				local f2_local9 = function ( f30_arg0, f30_arg1 )
					local f30_local0 = function ( f31_arg0, f31_arg1 )
						local f31_local0 = function ( f32_arg0, f32_arg1 )
							if not f32_arg1.interrupted then
								f32_arg0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
							end
							f32_arg0:setAlpha( 0 )
							if f32_arg1.interrupted then
								self.clipFinished( f32_arg0, f32_arg1 )
							else
								f32_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f31_arg1.interrupted then
							f31_local0( f31_arg0, f31_arg1 )
							return 
						else
							f31_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							f31_arg0:setAlpha( 0.9 )
							f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
						end
					end
					
					if f30_arg1.interrupted then
						f30_local0( f30_arg0, f30_arg1 )
						return 
					else
						f30_arg0:beginAnimation( "keyframe", 979, false, false, CoD.TweenType.Linear )
						f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
					end
				end
				
				GlowDots3:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowDots3:setAlpha( 0 )
				GlowDots3:registerEventHandler( "transition_complete_keyframe", f2_local9 )
				local f2_local10 = function ( f33_arg0, f33_arg1 )
					local f33_local0 = function ( f34_arg0, f34_arg1 )
						local f34_local0 = function ( f35_arg0, f35_arg1 )
							if not f35_arg1.interrupted then
								f35_arg0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
							end
							f35_arg0:setAlpha( 0 )
							if f35_arg1.interrupted then
								self.clipFinished( f35_arg0, f35_arg1 )
							else
								f35_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f34_arg1.interrupted then
							f34_local0( f34_arg0, f34_arg1 )
							return 
						else
							f34_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							f34_arg0:setAlpha( 0.8 )
							f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
						end
					end
					
					if f33_arg1.interrupted then
						f33_local0( f33_arg0, f33_arg1 )
						return 
					else
						f33_arg0:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
						f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
					end
				end
				
				GlowDots4:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowDots4:setAlpha( 0 )
				GlowDots4:registerEventHandler( "transition_complete_keyframe", f2_local10 )
				local f2_local11 = function ( f36_arg0, f36_arg1 )
					local f36_local0 = function ( f37_arg0, f37_arg1 )
						local f37_local0 = function ( f38_arg0, f38_arg1 )
							if not f38_arg1.interrupted then
								f38_arg0:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
							end
							f38_arg0:setAlpha( 0 )
							if f38_arg1.interrupted then
								self.clipFinished( f38_arg0, f38_arg1 )
							else
								f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f37_arg1.interrupted then
							f37_local0( f37_arg0, f37_arg1 )
							return 
						else
							f37_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f37_arg0:setAlpha( 0.7 )
							f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
						end
					end
					
					if f36_arg1.interrupted then
						f36_local0( f36_arg0, f36_arg1 )
						return 
					else
						f36_arg0:beginAnimation( "keyframe", 1650, false, false, CoD.TweenType.Linear )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
					end
				end
				
				GlowDots5:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				GlowDots5:setAlpha( 0 )
				GlowDots5:registerEventHandler( "transition_complete_keyframe", f2_local11 )
				local f2_local12 = function ( f39_arg0, f39_arg1 )
					local f39_local0 = function ( f40_arg0, f40_arg1 )
						if not f40_arg1.interrupted then
							f40_arg0:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
						end
						f40_arg0:setAlpha( 0 )
						if f40_arg1.interrupted then
							self.clipFinished( f40_arg0, f40_arg1 )
						else
							f40_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f39_arg1.interrupted then
						f39_local0( f39_arg0, f39_arg1 )
						return 
					else
						f39_arg0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
						f39_arg0:setAlpha( 0.25 )
						f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
					end
				end
				
				Image0:beginAnimation( "keyframe", 1769, false, false, CoD.TweenType.Linear )
				Image0:setAlpha( 0 )
				Image0:registerEventHandler( "transition_complete_keyframe", f2_local12 )

				uinThmIdle:completeAnimation()
				self.uinThmIdle:playSound( "uin_thm_idle", controller )
				self.clipFinished( uinThmIdle, {} )

				self.nextClip = "DefaultClip"
			end
		},
		StopAnimations = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				ThermometerGlow:completeAnimation()
				self.ThermometerGlow:setAlpha( 0 )
				self.clipFinished( ThermometerGlow, {} )

				biglightFlare:completeAnimation()
				self.biglightFlare:setAlpha( 0 )
				self.clipFinished( biglightFlare, {} )

				GlowPulse:completeAnimation()
				self.GlowPulse:setAlpha( 0 )
				self.clipFinished( GlowPulse, {} )

				GlowPulseOuter:completeAnimation()
				self.GlowPulseOuter:setAlpha( 0 )
				self.clipFinished( GlowPulseOuter, {} )

				GlowPulseOuter2:completeAnimation()
				self.GlowPulseOuter2:setAlpha( 0 )
				self.clipFinished( GlowPulseOuter2, {} )

				GlowPulseLine:completeAnimation()
				self.GlowPulseLine:setAlpha( 0 )
				self.clipFinished( GlowPulseLine, {} )

				GlowPulseLine0:completeAnimation()
				self.GlowPulseLine0:setAlpha( 0 )
				self.clipFinished( GlowPulseLine0, {} )

				GlowDots:completeAnimation()
				self.GlowDots:setAlpha( 0 )
				self.clipFinished( GlowDots, {} )

				GlowDots2:completeAnimation()
				self.GlowDots2:setAlpha( 0 )
				self.clipFinished( GlowDots2, {} )

				GlowDots3:completeAnimation()
				self.GlowDots3:setAlpha( 0 )
				self.clipFinished( GlowDots3, {} )

				GlowDots4:completeAnimation()
				self.GlowDots4:setAlpha( 0 )
				self.clipFinished( GlowDots4, {} )

				GlowDots5:completeAnimation()
				self.GlowDots5:setAlpha( 0 )
				self.clipFinished( GlowDots5, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
