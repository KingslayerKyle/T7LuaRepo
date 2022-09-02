-- af7fc6899bd893f5456e7100c712c675
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AmmoWidget_HeroAbilityThiefOverlayWidget" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )

CoD.AmmoWidget_HeroAbilityThiefRingAnimation = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityThiefRingAnimation.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityThiefRingAnimation )
	self.id = "AmmoWidget_HeroAbilityThiefRingAnimation"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local AmmoWidgetHeroAbilityThiefOverlayWidget = CoD.AmmoWidget_HeroAbilityThiefOverlayWidget.new( menu, controller )
	AmmoWidgetHeroAbilityThiefOverlayWidget:setLeftRight( false, false, -65.02, -13 )
	AmmoWidgetHeroAbilityThiefOverlayWidget:setTopBottom( false, false, -7.15, 8.85 )
	AmmoWidgetHeroAbilityThiefOverlayWidget.FEButtonPanel0:setAlpha( 0.95 )
	AmmoWidgetHeroAbilityThiefOverlayWidget.rerollInstruction:setRGB( 1, 0.96, 0.45 )
	AmmoWidgetHeroAbilityThiefOverlayWidget.rerollInstruction:setText( LocalizeToUpperString( "MPUI_FLIP" ) )
	AmmoWidgetHeroAbilityThiefOverlayWidget.Glow:setRGB( 0.4, 0.37, 0.22 )
	self:addElement( AmmoWidgetHeroAbilityThiefOverlayWidget )
	self.AmmoWidgetHeroAbilityThiefOverlayWidget = AmmoWidgetHeroAbilityThiefOverlayWidget
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( false, false, -31.41, 31.41 )
	GlowOrangeOver0:setTopBottom( false, false, -31.18, 31.18 )
	GlowOrangeOver0:setRGB( 0, 0, 0 )
	GlowOrangeOver0:setAlpha( 0.56 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	local BlackShadow = LUI.UIImage.new()
	BlackShadow:setLeftRight( false, false, 17, -17 )
	BlackShadow:setTopBottom( false, false, 17, -17 )
	BlackShadow:setRGB( 0, 0, 0 )
	BlackShadow:setScale( 0.75 )
	BlackShadow:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	self:addElement( BlackShadow )
	self.BlackShadow = BlackShadow
	
	local RingBG = LUI.UIImage.new()
	RingBG:setLeftRight( false, false, -18, 18 )
	RingBG:setTopBottom( false, false, -17, 19 )
	RingBG:setAlpha( 0.8 )
	RingBG:setYRot( 360 )
	RingBG:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_blackjackringsmall" ) )
	self:addElement( RingBG )
	self.RingBG = RingBG
	
	local WeaponIcon = LUI.UIImage.new()
	WeaponIcon:setLeftRight( false, false, 11.98, -12.02 )
	WeaponIcon:setTopBottom( false, false, -12, 12 )
	WeaponIcon:setYRot( 180 )
	WeaponIcon:setZRot( -7 )
	WeaponIcon:subscribeToGlobalModel( controller, "HeroWeapon", "thiefWeaponStatus", function ( model )
		local thiefWeaponStatus = Engine.GetModelValue( model )
		if thiefWeaponStatus then
			WeaponIcon:setImage( RegisterImage( AppendString( "_sm", GetThiefNextWeaponCoinImage( thiefWeaponStatus ) ) ) )
		end
	end )
	self:addElement( WeaponIcon )
	self.WeaponIcon = WeaponIcon
	
	local WeaponIconOld = LUI.UIImage.new()
	WeaponIconOld:setLeftRight( false, false, 11.98, -12.02 )
	WeaponIconOld:setTopBottom( false, false, -12, 12 )
	WeaponIconOld:setAlpha( 0 )
	WeaponIconOld:setYRot( 180 )
	WeaponIconOld:setZRot( -8 )
	WeaponIconOld:subscribeToGlobalModel( controller, "HeroWeapon", "imageAvailable", function ( model )
		local imageAvailable = Engine.GetModelValue( model )
		if imageAvailable then
			WeaponIconOld:setImage( RegisterImage( AppendString( "_sm", imageAvailable ) ) )
		end
	end )
	self:addElement( WeaponIconOld )
	self.WeaponIconOld = WeaponIconOld
	
	local GlowBig = LUI.UIImage.new()
	GlowBig:setLeftRight( false, false, -15, 15 )
	GlowBig:setTopBottom( false, false, -15, 15 )
	GlowBig:setRGB( 1, 0.79, 0.15 )
	GlowBig:setAlpha( 0.04 )
	GlowBig:setScale( 1.4 )
	GlowBig:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingglow" ) )
	GlowBig:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowBig )
	self.GlowBig = GlowBig
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( false, false, -12, 12 )
	AbilitySwirl:setTopBottom( false, false, -12.15, 11.85 )
	AbilitySwirl:setRGB( 1, 0.79, 0.15 )
	AbilitySwirl:setAlpha( 0 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -31.41, 31.41 )
	GlowOrangeOver:setTopBottom( false, false, -31.18, 31.18 )
	GlowOrangeOver:setRGB( 1, 0.54, 0 )
	GlowOrangeOver:setAlpha( 0.09 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local Glow = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow:setLeftRight( false, false, -18, 18 )
	Glow:setTopBottom( false, false, -18, 18 )
	Glow:setRGB( 1, 0.79, 0.15 )
	Glow:setAlpha( 0.09 )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				AmmoWidgetHeroAbilityThiefOverlayWidget:completeAnimation()
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityThiefOverlayWidget, {} )
				GlowOrangeOver0:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
				GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0 )
				self.clipFinished( BlackShadow, {} )

				RingBG:completeAnimation()
				self.RingBG:setAlpha( 0 )
				self.clipFinished( RingBG, {} )

				WeaponIcon:completeAnimation()
				self.WeaponIcon:setAlpha( 0 )
				self.clipFinished( WeaponIcon, {} )

				GlowBig:completeAnimation()
				self.GlowBig:setAlpha( 0 )
				self.GlowBig:setScale( 1.4 )
				self.clipFinished( GlowBig, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 1.1 )
				self.clipFinished( Glow, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				local AmmoWidgetHeroAbilityThiefOverlayWidgetFrame2 = function ( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
					local AmmoWidgetHeroAbilityThiefOverlayWidgetFrame3 = function ( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
						if not event.interrupted then
							AmmoWidgetHeroAbilityThiefOverlayWidget:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							AmmoWidgetHeroAbilityThiefOverlayWidget.FEButtonPanel0:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
						end
						AmmoWidgetHeroAbilityThiefOverlayWidget:setLeftRight( false, false, -65.02, -13 )
						AmmoWidgetHeroAbilityThiefOverlayWidget:setTopBottom( false, false, -7.15, 8.85 )
						AmmoWidgetHeroAbilityThiefOverlayWidget:setAlpha( 1 )
						AmmoWidgetHeroAbilityThiefOverlayWidget:setScale( 1 )
						AmmoWidgetHeroAbilityThiefOverlayWidget.FEButtonPanel0:setAlpha( 0.95 )
						if event.interrupted then
							self.clipFinished( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
						else
							AmmoWidgetHeroAbilityThiefOverlayWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoWidgetHeroAbilityThiefOverlayWidgetFrame3( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
						return 
					else
						AmmoWidgetHeroAbilityThiefOverlayWidget:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						AmmoWidgetHeroAbilityThiefOverlayWidget:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroAbilityThiefOverlayWidgetFrame3 )
					end
				end
				
				AmmoWidgetHeroAbilityThiefOverlayWidget:completeAnimation()

				AmmoWidgetHeroAbilityThiefOverlayWidget.FEButtonPanel0:completeAnimation()
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setLeftRight( false, false, -12.02, -6.15 )
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setTopBottom( false, false, -7.15, 8.85 )
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setAlpha( 0 )
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setScale( 0.2 )
				self.AmmoWidgetHeroAbilityThiefOverlayWidget.FEButtonPanel0:setAlpha( 0.95 )
				AmmoWidgetHeroAbilityThiefOverlayWidgetFrame2( AmmoWidgetHeroAbilityThiefOverlayWidget, {} )
				local f5_local1 = function ( f8_arg0, f8_arg1 )
					if not f8_arg1.interrupted then
						f8_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
					end
					f8_arg0:setAlpha( 0.56 )
					if f8_arg1.interrupted then
						self.clipFinished( f8_arg0, f8_arg1 )
					else
						f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrangeOver0:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
				GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", f5_local1 )
				local BlackShadowFrame2 = function ( BlackShadow, event )
					local BlackShadowFrame3 = function ( BlackShadow, event )
						local BlackShadowFrame4 = function ( BlackShadow, event )
							local BlackShadowFrame5 = function ( BlackShadow, event )
								local BlackShadowFrame6 = function ( BlackShadow, event )
									local BlackShadowFrame7 = function ( BlackShadow, event )
										local BlackShadowFrame8 = function ( BlackShadow, event )
											local BlackShadowFrame9 = function ( BlackShadow, event )
												if not event.interrupted then
													BlackShadow:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Bounce )
												end
												BlackShadow:setAlpha( 1 )
												BlackShadow:setScale( 0.75 )
												if event.interrupted then
													self.clipFinished( BlackShadow, event )
												else
													BlackShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												BlackShadowFrame9( BlackShadow, event )
												return 
											else
												BlackShadow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
												BlackShadow:setScale( 0.86 )
												BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame9 )
											end
										end
										
										if event.interrupted then
											BlackShadowFrame8( BlackShadow, event )
											return 
										else
											BlackShadow:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											BlackShadow:setScale( 0.95 )
											BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame8 )
										end
									end
									
									if event.interrupted then
										BlackShadowFrame7( BlackShadow, event )
										return 
									else
										BlackShadow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										BlackShadow:setScale( 1 )
										BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame7 )
									end
								end
								
								if event.interrupted then
									BlackShadowFrame6( BlackShadow, event )
									return 
								else
									BlackShadow:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									BlackShadow:setScale( 0.8 )
									BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame6 )
								end
							end
							
							if event.interrupted then
								BlackShadowFrame5( BlackShadow, event )
								return 
							else
								BlackShadow:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
								BlackShadow:setScale( 1.25 )
								BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame5 )
							end
						end
						
						if event.interrupted then
							BlackShadowFrame4( BlackShadow, event )
							return 
						else
							BlackShadow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
							BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame4 )
						end
					end
					
					if event.interrupted then
						BlackShadowFrame3( BlackShadow, event )
						return 
					else
						BlackShadow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BlackShadow:setAlpha( 0.2 )
						BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame3 )
					end
				end
				
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0 )
				self.BlackShadow:setScale( 1 )
				BlackShadowFrame2( BlackShadow, {} )
				local RingBGFrame2 = function ( RingBG, event )
					local RingBGFrame3 = function ( RingBG, event )
						local RingBGFrame4 = function ( RingBG, event )
							local RingBGFrame5 = function ( RingBG, event )
								local RingBGFrame6 = function ( RingBG, event )
									local RingBGFrame7 = function ( RingBG, event )
										if not event.interrupted then
											RingBG:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
										end
										RingBG:setAlpha( 0.9 )
										RingBG:setScale( 1 )
										if event.interrupted then
											self.clipFinished( RingBG, event )
										else
											RingBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										RingBGFrame7( RingBG, event )
										return 
									else
										RingBG:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										RingBG:setAlpha( 0.3 )
										RingBG:setScale( 1 )
										RingBG:registerEventHandler( "transition_complete_keyframe", RingBGFrame7 )
									end
								end
								
								if event.interrupted then
									RingBGFrame6( RingBG, event )
									return 
								else
									RingBG:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
									RingBG:setAlpha( 0 )
									RingBG:setScale( 0.9 )
									RingBG:registerEventHandler( "transition_complete_keyframe", RingBGFrame6 )
								end
							end
							
							if event.interrupted then
								RingBGFrame5( RingBG, event )
								return 
							else
								RingBG:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
								RingBG:setScale( 0.5 )
								RingBG:registerEventHandler( "transition_complete_keyframe", RingBGFrame5 )
							end
						end
						
						if event.interrupted then
							RingBGFrame4( RingBG, event )
							return 
						else
							RingBG:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							RingBG:setScale( 1.2 )
							RingBG:registerEventHandler( "transition_complete_keyframe", RingBGFrame4 )
						end
					end
					
					if event.interrupted then
						RingBGFrame3( RingBG, event )
						return 
					else
						RingBG:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						RingBG:setAlpha( 0.8 )
						RingBG:registerEventHandler( "transition_complete_keyframe", RingBGFrame3 )
					end
				end
				
				RingBG:completeAnimation()
				self.RingBG:setAlpha( 0 )
				self.RingBG:setScale( 0.8 )
				RingBGFrame2( RingBG, {} )
				local WeaponIconFrame2 = function ( WeaponIcon, event )
					local WeaponIconFrame3 = function ( WeaponIcon, event )
						local WeaponIconFrame4 = function ( WeaponIcon, event )
							local WeaponIconFrame5 = function ( WeaponIcon, event )
								local WeaponIconFrame6 = function ( WeaponIcon, event )
									local WeaponIconFrame7 = function ( WeaponIcon, event )
										local WeaponIconFrame8 = function ( WeaponIcon, event )
											local WeaponIconFrame9 = function ( WeaponIcon, event )
												local WeaponIconFrame10 = function ( WeaponIcon, event )
													local WeaponIconFrame11 = function ( WeaponIcon, event )
														local WeaponIconFrame12 = function ( WeaponIcon, event )
															if not event.interrupted then
																WeaponIcon:beginAnimation( "keyframe", 210, true, false, CoD.TweenType.Bounce )
															end
															WeaponIcon:setAlpha( 1 )
															WeaponIcon:setZRot( 7 )
															WeaponIcon:setScale( 1 )
															if event.interrupted then
																self.clipFinished( WeaponIcon, event )
															else
																WeaponIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															WeaponIconFrame12( WeaponIcon, event )
															return 
														else
															WeaponIcon:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
															WeaponIcon:setScale( 1.2 )
															WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame12 )
														end
													end
													
													if event.interrupted then
														WeaponIconFrame11( WeaponIcon, event )
														return 
													else
														WeaponIcon:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														WeaponIcon:setScale( 1.3 )
														WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame11 )
													end
												end
												
												if event.interrupted then
													WeaponIconFrame10( WeaponIcon, event )
													return 
												else
													WeaponIcon:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													WeaponIcon:setScale( 1.4 )
													WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame10 )
												end
											end
											
											if event.interrupted then
												WeaponIconFrame9( WeaponIcon, event )
												return 
											else
												WeaponIcon:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												WeaponIcon:setAlpha( 1 )
												WeaponIcon:setScale( 1.33 )
												WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame9 )
											end
										end
										
										if event.interrupted then
											WeaponIconFrame8( WeaponIcon, event )
											return 
										else
											WeaponIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											WeaponIcon:setAlpha( 0.4 )
											WeaponIcon:setZRot( 7 )
											WeaponIcon:setScale( 1.11 )
											WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame8 )
										end
									end
									
									if event.interrupted then
										WeaponIconFrame7( WeaponIcon, event )
										return 
									else
										WeaponIcon:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Linear )
										WeaponIcon:setAlpha( 0.1 )
										WeaponIcon:setZRot( 6 )
										WeaponIcon:setScale( 1 )
										WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame7 )
									end
								end
								
								if event.interrupted then
									WeaponIconFrame6( WeaponIcon, event )
									return 
								else
									WeaponIcon:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
									WeaponIcon:setZRot( 5.92 )
									WeaponIcon:setScale( 1.1 )
									WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame6 )
								end
							end
							
							if event.interrupted then
								WeaponIconFrame5( WeaponIcon, event )
								return 
							else
								WeaponIcon:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
								WeaponIcon:setZRot( 4.79 )
								WeaponIcon:setScale( 1.7 )
								WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponIconFrame4( WeaponIcon, event )
							return 
						else
							WeaponIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							WeaponIcon:setAlpha( 1 )
							WeaponIcon:setZRot( 0.67 )
							WeaponIcon:setScale( 1.36 )
							WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponIconFrame3( WeaponIcon, event )
						return 
					else
						WeaponIcon:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						WeaponIcon:setZRot( 0.33 )
						WeaponIcon:setScale( 1.33 )
						WeaponIcon:registerEventHandler( "transition_complete_keyframe", WeaponIconFrame3 )
					end
				end
				
				WeaponIcon:completeAnimation()
				self.WeaponIcon:setAlpha( 0 )
				self.WeaponIcon:setZRot( 0 )
				self.WeaponIcon:setScale( 1.3 )
				WeaponIconFrame2( WeaponIcon, {} )

				WeaponIconOld:completeAnimation()
				self.WeaponIconOld:setAlpha( 0 )
				self.WeaponIconOld:setScale( 1 )
				self.clipFinished( WeaponIconOld, {} )
				local GlowBigFrame2 = function ( GlowBig, event )
					local GlowBigFrame3 = function ( GlowBig, event )
						local GlowBigFrame4 = function ( GlowBig, event )
							local GlowBigFrame5 = function ( GlowBig, event )
								local GlowBigFrame6 = function ( GlowBig, event )
									local GlowBigFrame7 = function ( GlowBig, event )
										local GlowBigFrame8 = function ( GlowBig, event )
											local GlowBigFrame9 = function ( GlowBig, event )
												if not event.interrupted then
													GlowBig:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Bounce )
												end
												GlowBig:setAlpha( 0.04 )
												GlowBig:setScale( 1.4 )
												if event.interrupted then
													self.clipFinished( GlowBig, event )
												else
													GlowBig:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GlowBigFrame9( GlowBig, event )
												return 
											else
												GlowBig:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
												GlowBig:setScale( 1.36 )
												GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame9 )
											end
										end
										
										if event.interrupted then
											GlowBigFrame8( GlowBig, event )
											return 
										else
											GlowBig:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											GlowBig:setAlpha( 1 )
											GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame8 )
										end
									end
									
									if event.interrupted then
										GlowBigFrame7( GlowBig, event )
										return 
									else
										GlowBig:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										GlowBig:setAlpha( 0.62 )
										GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame7 )
									end
								end
								
								if event.interrupted then
									GlowBigFrame6( GlowBig, event )
									return 
								else
									GlowBig:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
									GlowBig:setAlpha( 1 )
									GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame6 )
								end
							end
							
							if event.interrupted then
								GlowBigFrame5( GlowBig, event )
								return 
							else
								GlowBig:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								GlowBig:setAlpha( 0 )
								GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame5 )
							end
						end
						
						if event.interrupted then
							GlowBigFrame4( GlowBig, event )
							return 
						else
							GlowBig:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBigFrame3( GlowBig, event )
						return 
					else
						GlowBig:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						GlowBig:setAlpha( 0.7 )
						GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame3 )
					end
				end
				
				GlowBig:completeAnimation()
				self.GlowBig:setAlpha( 0 )
				self.GlowBig:setScale( 1 )
				GlowBigFrame2( GlowBig, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						local AbilitySwirlFrame4 = function ( AbilitySwirl, event )
							if not event.interrupted then
								AbilitySwirl:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
							end
							AbilitySwirl:setAlpha( 0 )
							AbilitySwirl:setZRot( -231 )
							AbilitySwirl:setScale( 2.1 )
							if event.interrupted then
								self.clipFinished( AbilitySwirl, event )
							else
								AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AbilitySwirlFrame4( AbilitySwirl, event )
							return 
						else
							AbilitySwirl:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							AbilitySwirl:setAlpha( 1 )
							AbilitySwirl:setZRot( -45.94 )
							AbilitySwirl:setScale( 1.71 )
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame4 )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						AbilitySwirl:setAlpha( 0.58 )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setZRot( 150 )
				self.AbilitySwirl:setScale( 1.3 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									if not event.interrupted then
										GlowOrangeOver:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
									end
									GlowOrangeOver:setAlpha( 0.09 )
									if event.interrupted then
										self.clipFinished( GlowOrangeOver, event )
									else
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 0.6 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.3 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													if not event.interrupted then
														Glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
													end
													Glow:setAlpha( 0.15 )
													Glow:setScale( 1 )
													if event.interrupted then
														self.clipFinished( Glow, event )
													else
														Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
													Glow:setAlpha( 0.7 )
													Glow:setScale( 1.06 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
												Glow:setAlpha( 0.86 )
												Glow:setScale( 1.1 )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 1 )
											Glow:setScale( 0.5 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Glow:setScale( 0.8 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
									Glow:setScale( 1 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0 )
								Glow:setScale( 1.59 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.55 )
							Glow:setScale( 1.15 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.8 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.99 )
				GlowFrame2( Glow, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 10 )

				local AmmoWidgetHeroAbilityThiefOverlayWidgetFrame2 = function ( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
					local AmmoWidgetHeroAbilityThiefOverlayWidgetFrame3 = function ( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
						local AmmoWidgetHeroAbilityThiefOverlayWidgetFrame4 = function ( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
							if not event.interrupted then
								AmmoWidgetHeroAbilityThiefOverlayWidget:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							end
							AmmoWidgetHeroAbilityThiefOverlayWidget:setLeftRight( false, false, -12.02, -6.15 )
							AmmoWidgetHeroAbilityThiefOverlayWidget:setTopBottom( false, false, -7.15, 8.85 )
							AmmoWidgetHeroAbilityThiefOverlayWidget:setAlpha( 0 )
							AmmoWidgetHeroAbilityThiefOverlayWidget:setScale( 0.2 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
							else
								AmmoWidgetHeroAbilityThiefOverlayWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetHeroAbilityThiefOverlayWidgetFrame4( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
							return 
						else
							AmmoWidgetHeroAbilityThiefOverlayWidget:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							AmmoWidgetHeroAbilityThiefOverlayWidget:setLeftRight( false, false, -12.02, -6.15 )
							AmmoWidgetHeroAbilityThiefOverlayWidget:setAlpha( 0 )
							AmmoWidgetHeroAbilityThiefOverlayWidget:setScale( 0.2 )
							AmmoWidgetHeroAbilityThiefOverlayWidget:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroAbilityThiefOverlayWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetHeroAbilityThiefOverlayWidgetFrame3( AmmoWidgetHeroAbilityThiefOverlayWidget, event )
						return 
					else
						AmmoWidgetHeroAbilityThiefOverlayWidget:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						AmmoWidgetHeroAbilityThiefOverlayWidget:setLeftRight( false, false, -71.02, -13.15 )
						AmmoWidgetHeroAbilityThiefOverlayWidget:registerEventHandler( "transition_complete_keyframe", AmmoWidgetHeroAbilityThiefOverlayWidgetFrame3 )
					end
				end
				
				AmmoWidgetHeroAbilityThiefOverlayWidget:completeAnimation()
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setLeftRight( false, false, -65.02, -13 )
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setTopBottom( false, false, -7.15, 8.85 )
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setAlpha( 1 )
				self.AmmoWidgetHeroAbilityThiefOverlayWidget:setScale( 1 )
				AmmoWidgetHeroAbilityThiefOverlayWidgetFrame2( AmmoWidgetHeroAbilityThiefOverlayWidget, {} )
				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					if not event.interrupted then
						GlowOrangeOver0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					GlowOrangeOver0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowOrangeOver0, event )
					else
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 0.56 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )
				local BlackShadowFrame2 = function ( BlackShadow, event )
					local BlackShadowFrame3 = function ( BlackShadow, event )
						local BlackShadowFrame4 = function ( BlackShadow, event )
							local BlackShadowFrame5 = function ( BlackShadow, event )
								local BlackShadowFrame6 = function ( BlackShadow, event )
									if not event.interrupted then
										BlackShadow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									end
									BlackShadow:setAlpha( 0 )
									BlackShadow:setScale( 0.8 )
									if event.interrupted then
										self.clipFinished( BlackShadow, event )
									else
										BlackShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									BlackShadowFrame6( BlackShadow, event )
									return 
								else
									BlackShadow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									BlackShadow:setAlpha( 0.07 )
									BlackShadow:setScale( 0.8 )
									BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame6 )
								end
							end
							
							if event.interrupted then
								BlackShadowFrame5( BlackShadow, event )
								return 
							else
								BlackShadow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								BlackShadow:setAlpha( 0.09 )
								BlackShadow:setScale( 1 )
								BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame5 )
							end
						end
						
						if event.interrupted then
							BlackShadowFrame4( BlackShadow, event )
							return 
						else
							BlackShadow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							BlackShadow:setAlpha( 0.12 )
							BlackShadow:setScale( 0.95 )
							BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame4 )
						end
					end
					
					if event.interrupted then
						BlackShadowFrame3( BlackShadow, event )
						return 
					else
						BlackShadow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						BlackShadow:setAlpha( 0.2 )
						BlackShadow:setScale( 0.89 )
						BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame3 )
					end
				end
				
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 1 )
				self.BlackShadow:setScale( 0.75 )
				BlackShadowFrame2( BlackShadow, {} )
				local RingBGFrame2 = function ( RingBG, event )
					local RingBGFrame3 = function ( RingBG, event )
						local RingBGFrame4 = function ( RingBG, event )
							local RingBGFrame5 = function ( RingBG, event )
								if not event.interrupted then
									RingBG:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								end
								RingBG:setAlpha( 0 )
								RingBG:setScale( 0.2 )
								if event.interrupted then
									self.clipFinished( RingBG, event )
								else
									RingBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								RingBGFrame5( RingBG, event )
								return 
							else
								RingBG:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								RingBG:setAlpha( 0.8 )
								RingBG:setScale( 0.5 )
								RingBG:registerEventHandler( "transition_complete_keyframe", RingBGFrame5 )
							end
						end
						
						if event.interrupted then
							RingBGFrame4( RingBG, event )
							return 
						else
							RingBG:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							RingBG:setAlpha( 0 )
							RingBG:setScale( 0.9 )
							RingBG:registerEventHandler( "transition_complete_keyframe", RingBGFrame4 )
						end
					end
					
					if event.interrupted then
						RingBGFrame3( RingBG, event )
						return 
					else
						RingBG:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						RingBG:setAlpha( 0.3 )
						RingBG:setScale( 0.8 )
						RingBG:registerEventHandler( "transition_complete_keyframe", RingBGFrame3 )
					end
				end
				
				RingBG:completeAnimation()
				self.RingBG:setAlpha( 0.9 )
				self.RingBG:setScale( 1 )
				RingBGFrame2( RingBG, {} )

				WeaponIcon:completeAnimation()
				self.WeaponIcon:setAlpha( 0 )
				self.WeaponIcon:setScale( 1 )
				self.clipFinished( WeaponIcon, {} )
				local WeaponIconOldFrame2 = function ( WeaponIconOld, event )
					local WeaponIconOldFrame3 = function ( WeaponIconOld, event )
						local WeaponIconOldFrame4 = function ( WeaponIconOld, event )
							local WeaponIconOldFrame5 = function ( WeaponIconOld, event )
								local WeaponIconOldFrame6 = function ( WeaponIconOld, event )
									if not event.interrupted then
										WeaponIconOld:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									end
									WeaponIconOld:setAlpha( 0 )
									WeaponIconOld:setScale( 1 )
									if event.interrupted then
										self.clipFinished( WeaponIconOld, event )
									else
										WeaponIconOld:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									WeaponIconOldFrame6( WeaponIconOld, event )
									return 
								else
									WeaponIconOld:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									WeaponIconOld:setAlpha( 0.1 )
									WeaponIconOld:setScale( 1 )
									WeaponIconOld:registerEventHandler( "transition_complete_keyframe", WeaponIconOldFrame6 )
								end
							end
							
							if event.interrupted then
								WeaponIconOldFrame5( WeaponIconOld, event )
								return 
							else
								WeaponIconOld:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								WeaponIconOld:setAlpha( 0.28 )
								WeaponIconOld:setScale( 1.33 )
								WeaponIconOld:registerEventHandler( "transition_complete_keyframe", WeaponIconOldFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponIconOldFrame4( WeaponIconOld, event )
							return 
						else
							WeaponIconOld:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							WeaponIconOld:setAlpha( 0.32 )
							WeaponIconOld:setScale( 1.4 )
							WeaponIconOld:registerEventHandler( "transition_complete_keyframe", WeaponIconOldFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponIconOldFrame3( WeaponIconOld, event )
						return 
					else
						WeaponIconOld:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						WeaponIconOld:setAlpha( 0.57 )
						WeaponIconOld:setScale( 1.25 )
						WeaponIconOld:registerEventHandler( "transition_complete_keyframe", WeaponIconOldFrame3 )
					end
				end
				
				WeaponIconOld:completeAnimation()
				self.WeaponIconOld:setAlpha( 1 )
				self.WeaponIconOld:setScale( 1 )
				WeaponIconOldFrame2( WeaponIconOld, {} )
				local GlowBigFrame2 = function ( GlowBig, event )
					local GlowBigFrame3 = function ( GlowBig, event )
						local GlowBigFrame4 = function ( GlowBig, event )
							if not event.interrupted then
								GlowBig:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							GlowBig:setAlpha( 0 )
							GlowBig:setScale( 0.8 )
							if event.interrupted then
								self.clipFinished( GlowBig, event )
							else
								GlowBig:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowBigFrame4( GlowBig, event )
							return 
						else
							GlowBig:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							GlowBig:setScale( 1 )
							GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBigFrame3( GlowBig, event )
						return 
					else
						GlowBig:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						GlowBig:setAlpha( 1 )
						GlowBig:setScale( 1.17 )
						GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame3 )
					end
				end
				
				GlowBig:completeAnimation()
				self.GlowBig:setAlpha( 0.04 )
				self.GlowBig:setScale( 1.4 )
				GlowBigFrame2( GlowBig, {} )

				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver, event )
						else
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.6 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.09 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								end
								Glow:setRGB( 1, 0.79, 0.15 )
								Glow:setAlpha( 0 )
								Glow:setScale( 0.2 )
								if event.interrupted then
									self.clipFinished( Glow, event )
								else
									Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 1 )
								Glow:setScale( 0.5 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.86 )
							Glow:setScale( 1.1 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.7 )
						Glow:setScale( 1.06 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.79, 0.15 )
				self.Glow:setAlpha( 0.15 )
				self.Glow:setScale( 1 )
				GlowFrame2( Glow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				local f87_local0 = IsBlackMarketSpecialistThiefCoinActive( controller )
				if f87_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f87_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
					else
						f87_local0 = false
					end
				end
				return f87_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.thiefWeaponStatus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.thiefWeaponStatus"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidgetHeroAbilityThiefOverlayWidget:close()
		element.Glow:close()
		element.WeaponIcon:close()
		element.WeaponIconOld:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

