require( "ui.uieditor.widgets.CallingCards.CallingCards_CodChamps_Champion_Lights" )

CoD.CallingCards_CodChamps_Champion = InheritFrom( LUI.UIElement )
CoD.CallingCards_CodChamps_Champion.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_CodChamps_Champion )
	self.id = "CallingCards_CodChamps_Champion"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( true, false, 0, 492 )
	bg0:setTopBottom( true, false, -16, 152 )
	bg0:setAlpha( 0 )
	bg0:setImage( RegisterImage( "uie_t7_callingcards_champion_bg" ) )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 492 )
	bg:setTopBottom( true, false, -16, 152 )
	bg:setImage( RegisterImage( "uie_t7_callingcards_champion_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local CallingCardsCodChampsChampionLights = CoD.CallingCards_CodChamps_Champion_Lights.new( menu, controller )
	CallingCardsCodChampsChampionLights:setLeftRight( true, false, 0, 156 )
	CallingCardsCodChampsChampionLights:setTopBottom( true, false, 0, 120 )
	self:addElement( CallingCardsCodChampsChampionLights )
	self.CallingCardsCodChampsChampionLights = CallingCardsCodChampsChampionLights
	
	local fighter1 = LUI.UIImage.new()
	fighter1:setLeftRight( true, false, 0, 480 )
	fighter1:setTopBottom( true, false, -16, 152 )
	fighter1:setAlpha( 0 )
	fighter1:setImage( RegisterImage( "uie_t7_callingcards_champion_fighter1" ) )
	self:addElement( fighter1 )
	self.fighter1 = fighter1
	
	local fighter2 = LUI.UIImage.new()
	fighter2:setLeftRight( true, false, 0, 480 )
	fighter2:setTopBottom( true, false, -16, 152 )
	fighter2:setAlpha( 0 )
	fighter2:setImage( RegisterImage( "uie_t7_callingcards_champion_fighter2" ) )
	self:addElement( fighter2 )
	self.fighter2 = fighter2
	
	local fighter3 = LUI.UIImage.new()
	fighter3:setLeftRight( true, false, 166.42, 500.29 )
	fighter3:setTopBottom( true, false, -54, 166 )
	fighter3:setImage( RegisterImage( "uie_t7_callingcards_champion_fighter3" ) )
	self:addElement( fighter3 )
	self.fighter3 = fighter3
	
	local belt = LUI.UIImage.new()
	belt:setLeftRight( true, false, 190.58, 356.54 )
	belt:setTopBottom( true, false, -8.5, 138.5 )
	belt:setAlpha( 0 )
	belt:setImage( RegisterImage( "uie_t7_callingcards_champion_belt" ) )
	belt:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	belt:setShaderVector( 0, 0.66, 0, 0, 0 )
	self:addElement( belt )
	self.belt = belt
	
	local whiteFlash = LUI.UIImage.new()
	whiteFlash:setLeftRight( true, false, -587.41, 135.16 )
	whiteFlash:setTopBottom( true, false, -448.11, 584.11 )
	whiteFlash:setAlpha( 0 )
	whiteFlash:setZRot( -84 )
	whiteFlash:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	whiteFlash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( whiteFlash )
	self.whiteFlash = whiteFlash
	
	local whiteFlash0 = LUI.UIImage.new()
	whiteFlash0:setLeftRight( true, false, 240, 962.56 )
	whiteFlash0:setTopBottom( true, false, -698.11, 334.11 )
	whiteFlash0:setAlpha( 0 )
	whiteFlash0:setZRot( -84 )
	whiteFlash0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	whiteFlash0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( whiteFlash0 )
	self.whiteFlash0 = whiteFlash0
	
	local biglight = LUI.UIImage.new()
	biglight:setLeftRight( true, false, -22.5, 334.5 )
	biglight:setTopBottom( true, false, -95.04, 207.04 )
	biglight:setImage( RegisterImage( "uie_t7_callingcards_champion_light4" ) )
	self:addElement( biglight )
	self.biglight = biglight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				bg0:completeAnimation()
				self.bg0:setLeftRight( true, false, 0, 492 )
				self.bg0:setTopBottom( true, false, -16, 152 )
				self.bg0:setAlpha( 1 )
				self.clipFinished( bg0, {} )
				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						local bgFrame4 = function ( bg, event )
							local bgFrame5 = function ( bg, event )
								local bgFrame6 = function ( bg, event )
									if not event.interrupted then
										bg:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
									end
									bg:setLeftRight( true, false, 0, 493 )
									bg:setTopBottom( true, false, -16, 152 )
									bg:setAlpha( 0 )
									bg:setZRot( 0 )
									bg:setScale( 1.23 )
									if event.interrupted then
										self.clipFinished( bg, event )
									else
										bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									bgFrame6( bg, event )
									return 
								else
									bg:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
									bg:registerEventHandler( "transition_complete_keyframe", bgFrame6 )
								end
							end
							
							if event.interrupted then
								bgFrame5( bg, event )
								return 
							else
								bg:beginAnimation( "keyframe", 1579, false, false, CoD.TweenType.Linear )
								bg:registerEventHandler( "transition_complete_keyframe", bgFrame5 )
							end
						end
						
						if event.interrupted then
							bgFrame4( bg, event )
							return 
						else
							bg:beginAnimation( "keyframe", 2400, false, false, CoD.TweenType.Linear )
							bg:setScale( 1.23 )
							bg:registerEventHandler( "transition_complete_keyframe", bgFrame4 )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
						bg:setLeftRight( true, false, 0, 493 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setLeftRight( true, false, 0, 492 )
				self.bg:setTopBottom( true, false, -16, 152 )
				self.bg:setAlpha( 1 )
				self.bg:setZRot( 0 )
				self.bg:setScale( 1 )
				bgFrame2( bg, {} )
				CallingCardsCodChampsChampionLights:completeAnimation()
				self.CallingCardsCodChampsChampionLights:setAlpha( 1 )
				self.clipFinished( CallingCardsCodChampsChampionLights, {} )
				local fighter1Frame2 = function ( fighter1, event )
					local fighter1Frame3 = function ( fighter1, event )
						local fighter1Frame4 = function ( fighter1, event )
							local fighter1Frame5 = function ( fighter1, event )
								local fighter1Frame6 = function ( fighter1, event )
									if not event.interrupted then
										fighter1:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
									end
									fighter1:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( fighter1, event )
									else
										fighter1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									fighter1Frame6( fighter1, event )
									return 
								else
									fighter1:beginAnimation( "keyframe", 1169, false, false, CoD.TweenType.Linear )
									fighter1:registerEventHandler( "transition_complete_keyframe", fighter1Frame6 )
								end
							end
							
							if event.interrupted then
								fighter1Frame5( fighter1, event )
								return 
							else
								fighter1:beginAnimation( "keyframe", 3870, false, false, CoD.TweenType.Linear )
								fighter1:registerEventHandler( "transition_complete_keyframe", fighter1Frame5 )
							end
						end
						
						if event.interrupted then
							fighter1Frame4( fighter1, event )
							return 
						else
							fighter1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							fighter1:setAlpha( 0 )
							fighter1:registerEventHandler( "transition_complete_keyframe", fighter1Frame4 )
						end
					end
					
					if event.interrupted then
						fighter1Frame3( fighter1, event )
						return 
					else
						fighter1:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						fighter1:registerEventHandler( "transition_complete_keyframe", fighter1Frame3 )
					end
				end
				
				fighter1:completeAnimation()
				self.fighter1:setAlpha( 1 )
				fighter1Frame2( fighter1, {} )
				local f2_local2 = function ( f13_arg0, f13_arg1 )
					local f13_local0 = function ( f14_arg0, f14_arg1 )
						local f14_local0 = function ( f15_arg0, f15_arg1 )
							local f15_local0 = function ( f16_arg0, f16_arg1 )
								local f16_local0 = function ( f17_arg0, f17_arg1 )
									if not f17_arg1.interrupted then
										f17_arg0:beginAnimation( "keyframe", 3150, false, false, CoD.TweenType.Linear )
									end
									f17_arg0:setAlpha( 0 )
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
									f16_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
									f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
								end
							end
							
							if f15_arg1.interrupted then
								f15_local0( f15_arg0, f15_arg1 )
								return 
							else
								f15_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								f15_arg0:setAlpha( 0 )
								f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
							end
						end
						
						if f14_arg1.interrupted then
							f14_local0( f14_arg0, f14_arg1 )
							return 
						else
							f14_arg0:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
							f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
						end
					end
					
					if f13_arg1.interrupted then
						f13_local0( f13_arg0, f13_arg1 )
						return 
					else
						f13_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f13_arg0:setAlpha( 1 )
						f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
					end
				end
				
				fighter2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				fighter2:setAlpha( 0 )
				fighter2:registerEventHandler( "transition_complete_keyframe", f2_local2 )
				local f2_local3 = function ( f18_arg0, f18_arg1 )
					local f18_local0 = function ( f19_arg0, f19_arg1 )
						local f19_local0 = function ( f20_arg0, f20_arg1 )
							local f20_local0 = function ( f21_arg0, f21_arg1 )
								local f21_local0 = function ( f22_arg0, f22_arg1 )
									local f22_local0 = function ( f23_arg0, f23_arg1 )
										if not f23_arg1.interrupted then
											f23_arg0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
										end
										f23_arg0:setLeftRight( true, false, 132.04, 697.19 )
										f23_arg0:setTopBottom( true, false, -2.5, 369.9 )
										f23_arg0:setAlpha( 0 )
										f23_arg0:setZRot( -35 )
										f23_arg0:setScale( 1.03 )
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
										f22_arg0:beginAnimation( "keyframe", 2119, false, false, CoD.TweenType.Linear )
										f22_arg0:setTopBottom( true, false, -2.5, 369.9 )
										f22_arg0:setZRot( -35 )
										f22_arg0:setScale( 1.03 )
										f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
									end
								end
								
								if f21_arg1.interrupted then
									f21_local0( f21_arg0, f21_arg1 )
									return 
								else
									f21_arg0:beginAnimation( "keyframe", 2289, false, false, CoD.TweenType.Linear )
									f21_arg0:setLeftRight( true, false, 132.04, 697.19 )
									f21_arg0:setTopBottom( true, false, -8.5, 363.9 )
									f21_arg0:setZRot( -33 )
									f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
								end
							end
							
							if f20_arg1.interrupted then
								f20_local0( f20_arg0, f20_arg1 )
								return 
							else
								f20_arg0:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
								f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
							end
						end
						
						if f19_arg1.interrupted then
							f19_local0( f19_arg0, f19_arg1 )
							return 
						else
							f19_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							f19_arg0:setAlpha( 1 )
							f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
						end
					end
					
					if f18_arg1.interrupted then
						f18_local0( f18_arg0, f18_arg1 )
						return 
					else
						f18_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
					end
				end
				
				fighter3:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
				fighter3:setLeftRight( true, false, 166.42, 500.29 )
				fighter3:setTopBottom( true, false, -54, 166 )
				fighter3:setAlpha( 0 )
				fighter3:setZRot( 0 )
				fighter3:setScale( 1 )
				fighter3:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f24_arg0, f24_arg1 )
					local f24_local0 = function ( f25_arg0, f25_arg1 )
						local f25_local0 = function ( f26_arg0, f26_arg1 )
							local f26_local0 = function ( f27_arg0, f27_arg1 )
								local f27_local0 = function ( f28_arg0, f28_arg1 )
									if not f28_arg1.interrupted then
										f28_arg0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
									end
									f28_arg0:setLeftRight( true, false, 210.89, 365.88 )
									f28_arg0:setTopBottom( true, false, 3, 133.73 )
									f28_arg0:setAlpha( 0 )
									f28_arg0:setZRot( 0 )
									f28_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
									f28_arg0:setShaderVector( 0, 0.35, 0, 0, 0 )
									if f28_arg1.interrupted then
										self.clipFinished( f28_arg0, f28_arg1 )
									else
										f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f27_arg1.interrupted then
									f27_local0( f27_arg0, f27_arg1 )
									return 
								else
									f27_arg0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
									f27_arg0:setAlpha( 0.7 )
									f27_arg0:setShaderVector( 0, 0.35, 0, 0, 0 )
									f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
								end
							end
							
							if f26_arg1.interrupted then
								f26_local0( f26_arg0, f26_arg1 )
								return 
							else
								f26_arg0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								f26_arg0:setAlpha( 0.73 )
								f26_arg0:setShaderVector( 0, 0.7, 0, 0, 0 )
								f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
							end
						end
						
						if f25_arg1.interrupted then
							f25_local0( f25_arg0, f25_arg1 )
							return 
						else
							f25_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f25_arg0:setAlpha( 0.75 )
							f25_arg0:setShaderVector( 0, 0.86, 0, 0, 0 )
							f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
						end
					end
					
					if f24_arg1.interrupted then
						f24_local0( f24_arg0, f24_arg1 )
						return 
					else
						f24_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						f24_arg0:setShaderVector( 0, 0.89, 0, 0, 0 )
						f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
					end
				end
				
				belt:beginAnimation( "keyframe", 3430, false, false, CoD.TweenType.Linear )
				belt:setLeftRight( true, false, 210.89, 365.88 )
				belt:setTopBottom( true, false, 3, 133.73 )
				belt:setAlpha( 0 )
				belt:setZRot( 0 )
				belt:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				belt:setShaderVector( 0, 1.02, 0, 0, 0 )
				belt:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local f2_local5 = function ( f29_arg0, f29_arg1 )
					local f29_local0 = function ( f30_arg0, f30_arg1 )
						local f30_local0 = function ( f31_arg0, f31_arg1 )
							local f31_local0 = function ( f32_arg0, f32_arg1 )
								local f32_local0 = function ( f33_arg0, f33_arg1 )
									local f33_local0 = function ( f34_arg0, f34_arg1 )
										local f34_local0 = function ( f35_arg0, f35_arg1 )
											if not f35_arg1.interrupted then
												f35_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
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
											f34_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											f34_arg0:setAlpha( 1 )
											f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
										end
									end
									
									if f33_arg1.interrupted then
										f33_local0( f33_arg0, f33_arg1 )
										return 
									else
										f33_arg0:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
										f33_arg0:setAlpha( 0 )
										f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
									end
								end
								
								if f32_arg1.interrupted then
									f32_local0( f32_arg0, f32_arg1 )
									return 
								else
									f32_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									f32_arg0:setAlpha( 1 )
									f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
								end
							end
							
							if f31_arg1.interrupted then
								f31_local0( f31_arg0, f31_arg1 )
								return 
							else
								f31_arg0:beginAnimation( "keyframe", 1289, false, false, CoD.TweenType.Linear )
								f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
							end
						end
						
						if f30_arg1.interrupted then
							f30_local0( f30_arg0, f30_arg1 )
							return 
						else
							f30_arg0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							f30_arg0:setAlpha( 0 )
							f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
						end
					end
					
					if f29_arg1.interrupted then
						f29_local0( f29_arg0, f29_arg1 )
						return 
					else
						f29_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f29_arg0:setAlpha( 1 )
						f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
					end
				end
				
				whiteFlash:beginAnimation( "keyframe", 1080, false, false, CoD.TweenType.Linear )
				whiteFlash:setAlpha( 0 )
				whiteFlash:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local f2_local6 = function ( f36_arg0, f36_arg1 )
					local f36_local0 = function ( f37_arg0, f37_arg1 )
						local f37_local0 = function ( f38_arg0, f38_arg1 )
							local f38_local0 = function ( f39_arg0, f39_arg1 )
								local f39_local0 = function ( f40_arg0, f40_arg1 )
									if not f40_arg1.interrupted then
										f40_arg0:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
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
									f39_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									f39_arg0:setAlpha( 1 )
									f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
								end
							end
							
							if f38_arg1.interrupted then
								f38_local0( f38_arg0, f38_arg1 )
								return 
							else
								f38_arg0:beginAnimation( "keyframe", 820, false, false, CoD.TweenType.Linear )
								f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
							end
						end
						
						if f37_arg1.interrupted then
							f37_local0( f37_arg0, f37_arg1 )
							return 
						else
							f37_arg0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
							f37_arg0:setAlpha( 0 )
							f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
						end
					end
					
					if f36_arg1.interrupted then
						f36_local0( f36_arg0, f36_arg1 )
						return 
					else
						f36_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						f36_arg0:setAlpha( 1 )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
					end
				end
				
				whiteFlash0:beginAnimation( "keyframe", 3220, false, false, CoD.TweenType.Linear )
				whiteFlash0:setAlpha( 0 )
				whiteFlash0:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local biglightFrame2 = function ( biglight, event )
					local biglightFrame3 = function ( biglight, event )
						local biglightFrame4 = function ( biglight, event )
							local biglightFrame5 = function ( biglight, event )
								local biglightFrame6 = function ( biglight, event )
									local biglightFrame7 = function ( biglight, event )
										local biglightFrame8 = function ( biglight, event )
											local biglightFrame9 = function ( biglight, event )
												local biglightFrame10 = function ( biglight, event )
													local biglightFrame11 = function ( biglight, event )
														local biglightFrame12 = function ( biglight, event )
															if not event.interrupted then
																biglight:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
															end
															biglight:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( biglight, event )
															else
																biglight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															biglightFrame12( biglight, event )
															return 
														else
															biglight:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
															biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame12 )
														end
													end
													
													if event.interrupted then
														biglightFrame11( biglight, event )
														return 
													else
														biglight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														biglight:setAlpha( 1 )
														biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame11 )
													end
												end
												
												if event.interrupted then
													biglightFrame10( biglight, event )
													return 
												else
													biglight:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Linear )
													biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame10 )
												end
											end
											
											if event.interrupted then
												biglightFrame9( biglight, event )
												return 
											else
												biglight:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
												biglight:setAlpha( 0 )
												biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame9 )
											end
										end
										
										if event.interrupted then
											biglightFrame8( biglight, event )
											return 
										else
											biglight:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame8 )
										end
									end
									
									if event.interrupted then
										biglightFrame7( biglight, event )
										return 
									else
										biglight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										biglight:setAlpha( 1 )
										biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame7 )
									end
								end
								
								if event.interrupted then
									biglightFrame6( biglight, event )
									return 
								else
									biglight:beginAnimation( "keyframe", 849, false, false, CoD.TweenType.Linear )
									biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame6 )
								end
							end
							
							if event.interrupted then
								biglightFrame5( biglight, event )
								return 
							else
								biglight:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
								biglight:setAlpha( 0 )
								biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame5 )
							end
						end
						
						if event.interrupted then
							biglightFrame4( biglight, event )
							return 
						else
							biglight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							biglight:setAlpha( 1 )
							biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame4 )
						end
					end
					
					if event.interrupted then
						biglightFrame3( biglight, event )
						return 
					else
						biglight:beginAnimation( "keyframe", 2339, false, false, CoD.TweenType.Linear )
						biglight:registerEventHandler( "transition_complete_keyframe", biglightFrame3 )
					end
				end
				
				biglight:completeAnimation()
				self.biglight:setAlpha( 0 )
				biglightFrame2( biglight, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsCodChampsChampionLights:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

