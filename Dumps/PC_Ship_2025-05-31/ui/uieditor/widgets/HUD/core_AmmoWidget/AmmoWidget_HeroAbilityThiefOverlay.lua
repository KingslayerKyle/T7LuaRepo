require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ThiefCoinWidgetxml" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )
require( "ui.uieditor.widgets.AmmoWidget_HeroAbilityThiefRingAnimation" )

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "clip_over", function ( element, event )
		LUI.UIElement.clipOver( element, event )
		local f2_local0 = Engine.GetModel( DataSources.HeroWeapon.getModel( controller ), "thiefStatus" )
		local f2_local1 = Engine.GetModelValue( f2_local0 )
		if f2_local1 and f2_local1 == 1 then
			Engine.SetModelValue( f2_local0, 2 )
		end
	end )
	local f1_local0 = DataSources.HeroWeapon.getModel( controller )
	local f1_local1 = Engine.GetModel( f1_local0, "thiefLastWeapon" )
	local f1_local2 = Engine.GetModel( f1_local0, "imageAvailable" )
	if f1_local1 and f1_local2 then
		local f1_local3 = Engine.GetModelValue( f1_local2 )
		self:subscribeToModel( f1_local2, function ( model )
			Engine.SetModelValue( f1_local1, f1_local3 or "blacktransparent" )
			f1_local3 = Engine.GetModelValue( model )
		end )
	end
end

CoD.AmmoWidget_HeroAbilityThiefOverlay = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityThiefOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityThiefOverlay )
	self.id = "AmmoWidget_HeroAbilityThiefOverlay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 398 )
	self:setTopBottom( true, false, 0, 124 )
	self.anyChildUsesUpdateState = true
	
	local RingBLURShadow = LUI.UIImage.new()
	RingBLURShadow:setLeftRight( false, false, 28.36, 280.36 )
	RingBLURShadow:setTopBottom( false, false, -116.36, 135.65 )
	RingBLURShadow:setRGB( 0, 0, 0 )
	RingBLURShadow:setAlpha( 0 )
	RingBLURShadow:setScale( 0.45 )
	RingBLURShadow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringfillblur" ) )
	self:addElement( RingBLURShadow )
	self.RingBLURShadow = RingBLURShadow
	
	local MaskGlow0 = LUI.UIImage.new()
	MaskGlow0:setLeftRight( false, false, 68.71, 228.71 )
	MaskGlow0:setTopBottom( false, false, -68.83, 79.83 )
	MaskGlow0:setRGB( 0, 0, 0 )
	MaskGlow0:setAlpha( 0 )
	MaskGlow0:setScale( 0.9 )
	MaskGlow0:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	self:addElement( MaskGlow0 )
	self.MaskGlow0 = MaskGlow0
	
	local MaskGlow = LUI.UIImage.new()
	MaskGlow:setLeftRight( false, false, 119.83, 190.17 )
	MaskGlow:setTopBottom( false, false, -25.17, 45.17 )
	MaskGlow:setRGB( 0, 0, 0 )
	MaskGlow:setAlpha( 0 )
	MaskGlow:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	self:addElement( MaskGlow )
	self.MaskGlow = MaskGlow
	
	local EdgeGlow = LUI.UIImage.new()
	EdgeGlow:setLeftRight( false, false, 111, 199 )
	EdgeGlow:setTopBottom( false, false, -34, 54 )
	EdgeGlow:setRGB( 0.73, 0.43, 0 )
	EdgeGlow:setAlpha( 0 )
	EdgeGlow:setZoom( -2 )
	EdgeGlow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringedgeglow" ) )
	EdgeGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( EdgeGlow )
	self.EdgeGlow = EdgeGlow
	
	local EdgeGlow0 = LUI.UIImage.new()
	EdgeGlow0:setLeftRight( false, false, 111, 199 )
	EdgeGlow0:setTopBottom( false, false, -33.5, 54.5 )
	EdgeGlow0:setRGB( 1, 0.79, 0.15 )
	EdgeGlow0:setZoom( -5 )
	EdgeGlow0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_heroringedgeglow" ) )
	EdgeGlow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( EdgeGlow0 )
	self.EdgeGlow0 = EdgeGlow0
	
	local BlackShadow = LUI.UIImage.new()
	BlackShadow:setLeftRight( false, false, 108.5, 197.5 )
	BlackShadow:setTopBottom( false, false, -34, 55 )
	BlackShadow:setRGB( 0, 0, 0 )
	BlackShadow:setZoom( 3 )
	BlackShadow:setImage( RegisterImage( "uie_t7_cp_hud_incomingexplosive_glow" ) )
	self:addElement( BlackShadow )
	self.BlackShadow = BlackShadow
	
	local AmmoWidgetThiefCoinWidgetxml = CoD.AmmoWidget_ThiefCoinWidgetxml.new( menu, controller )
	AmmoWidgetThiefCoinWidgetxml:setLeftRight( true, false, 300.86, 405.86 )
	AmmoWidgetThiefCoinWidgetxml:setTopBottom( true, false, 19.15, 124.15 )
	AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.43 )
	self:addElement( AmmoWidgetThiefCoinWidgetxml )
	self.AmmoWidgetThiefCoinWidgetxml = AmmoWidgetThiefCoinWidgetxml
	
	local Texture1 = LUI.UIImage.new()
	Texture1:setLeftRight( false, false, 94, 214 )
	Texture1:setTopBottom( false, false, -49, 71 )
	Texture1:setRGB( 1, 0.79, 0.15 )
	Texture1:setAlpha( 0 )
	Texture1:setZoom( -5 )
	Texture1:setImage( RegisterImage( "uie_t7_hud_mp_blackjack_gambler_texture1" ) )
	Texture1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Texture1 )
	self.Texture1 = Texture1
	
	local Texture2 = LUI.UIImage.new()
	Texture2:setLeftRight( false, false, 94, 214 )
	Texture2:setTopBottom( false, false, -49, 71 )
	Texture2:setRGB( 1, 0.79, 0.15 )
	Texture2:setAlpha( 0.69 )
	Texture2:setZRot( 22.5 )
	Texture2:setZoom( -5 )
	Texture2:setScale( 1.23 )
	Texture2:setImage( RegisterImage( "uie_t7_hud_mp_blackjack_gambler_texture2" ) )
	Texture2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Texture2 )
	self.Texture2 = Texture2
	
	local GlowBig = LUI.UIImage.new()
	GlowBig:setLeftRight( false, false, 94, 214 )
	GlowBig:setTopBottom( false, false, -43, 65 )
	GlowBig:setRGB( 1, 0.79, 0.15 )
	GlowBig:setAlpha( 0.39 )
	GlowBig:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingglow" ) )
	GlowBig:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowBig )
	self.GlowBig = GlowBig
	
	local AbilitySwirl = LUI.UIImage.new()
	AbilitySwirl:setLeftRight( false, false, 91, 216.04 )
	AbilitySwirl:setTopBottom( false, false, -58, 69 )
	AbilitySwirl:setRGB( 1, 0.79, 0.15 )
	AbilitySwirl:setAlpha( 0.02 )
	AbilitySwirl:setYRot( 180 )
	AbilitySwirl:setZRot( 97 )
	AbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	AbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AbilitySwirl )
	self.AbilitySwirl = AbilitySwirl
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 250.01, 452.83 )
	GlowOrangeOver:setTopBottom( true, false, -32.67, 159.68 )
	GlowOrangeOver:setRGB( 1, 0.54, 0 )
	GlowOrangeOver:setAlpha( 0.34 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local Glow = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow:setLeftRight( false, false, 99.94, 204.9 )
	Glow:setTopBottom( false, false, -45, 62 )
	Glow:setRGB( 1, 0.79, 0.15 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local AmmoWidgetHeroAbilityThiefRingAnimation = CoD.AmmoWidget_HeroAbilityThiefRingAnimation.new( menu, controller )
	AmmoWidgetHeroAbilityThiefRingAnimation:setLeftRight( true, false, 328.17, 443.17 )
	AmmoWidgetHeroAbilityThiefRingAnimation:setTopBottom( true, false, 47.17, 171.17 )
	self:addElement( AmmoWidgetHeroAbilityThiefRingAnimation )
	self.AmmoWidgetHeroAbilityThiefRingAnimation = AmmoWidgetHeroAbilityThiefRingAnimation
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				RingBLURShadow:completeAnimation()
				self.RingBLURShadow:setAlpha( 0 )
				self.clipFinished( RingBLURShadow, {} )
				MaskGlow0:completeAnimation()
				self.MaskGlow0:setAlpha( 0 )
				self.clipFinished( MaskGlow0, {} )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				EdgeGlow0:completeAnimation()
				self.EdgeGlow0:setAlpha( 0 )
				self.clipFinished( EdgeGlow0, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0 )
				self.clipFinished( BlackShadow, {} )
				AmmoWidgetThiefCoinWidgetxml:completeAnimation()
				self.AmmoWidgetThiefCoinWidgetxml:setAlpha( 0 )
				self.clipFinished( AmmoWidgetThiefCoinWidgetxml, {} )
				Texture1:completeAnimation()
				self.Texture1:setAlpha( 0 )
				self.clipFinished( Texture1, {} )
				Texture2:completeAnimation()
				self.Texture2:setAlpha( 0 )
				self.clipFinished( Texture2, {} )
				GlowBig:completeAnimation()
				self.GlowBig:setAlpha( 0 )
				self.clipFinished( GlowBig, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				AmmoWidgetHeroAbilityThiefRingAnimation:completeAnimation()
				self.AmmoWidgetHeroAbilityThiefRingAnimation:setAlpha( 0 )
				self.clipFinished( AmmoWidgetHeroAbilityThiefRingAnimation, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				local RingBLURShadowFrame2 = function ( RingBLURShadow, event )
					local RingBLURShadowFrame3 = function ( RingBLURShadow, event )
						if not event.interrupted then
							RingBLURShadow:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
						end
						RingBLURShadow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( RingBLURShadow, event )
						else
							RingBLURShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RingBLURShadowFrame3( RingBLURShadow, event )
						return 
					else
						RingBLURShadow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						RingBLURShadow:setAlpha( 0.8 )
						RingBLURShadow:registerEventHandler( "transition_complete_keyframe", RingBLURShadowFrame3 )
					end
				end
				
				RingBLURShadow:completeAnimation()
				self.RingBLURShadow:setAlpha( 0 )
				RingBLURShadowFrame2( RingBLURShadow, {} )
				local MaskGlow0Frame2 = function ( MaskGlow0, event )
					local MaskGlow0Frame3 = function ( MaskGlow0, event )
						if not event.interrupted then
							MaskGlow0:beginAnimation( "keyframe", 459, false, false, CoD.TweenType.Linear )
						end
						MaskGlow0:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( MaskGlow0, event )
						else
							MaskGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MaskGlow0Frame3( MaskGlow0, event )
						return 
					else
						MaskGlow0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						MaskGlow0:setAlpha( 0.7 )
						MaskGlow0:registerEventHandler( "transition_complete_keyframe", MaskGlow0Frame3 )
					end
				end
				
				MaskGlow0:completeAnimation()
				self.MaskGlow0:setAlpha( 0 )
				MaskGlow0Frame2( MaskGlow0, {} )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					local EdgeGlowFrame3 = function ( EdgeGlow, event )
						local EdgeGlowFrame4 = function ( EdgeGlow, event )
							local EdgeGlowFrame5 = function ( EdgeGlow, event )
								local EdgeGlowFrame6 = function ( EdgeGlow, event )
									if not event.interrupted then
										EdgeGlow:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									end
									EdgeGlow:setAlpha( 0 )
									EdgeGlow:setYRot( 304 )
									EdgeGlow:setScale( 1.35 )
									if event.interrupted then
										self.clipFinished( EdgeGlow, event )
									else
										EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EdgeGlowFrame6( EdgeGlow, event )
									return 
								else
									EdgeGlow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									EdgeGlow:setYRot( 304 )
									EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame6 )
								end
							end
							
							if event.interrupted then
								EdgeGlowFrame5( EdgeGlow, event )
								return 
							else
								EdgeGlow:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								EdgeGlow:setYRot( 214 )
								EdgeGlow:setScale( 1.35 )
								EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame5 )
							end
						end
						
						if event.interrupted then
							EdgeGlowFrame4( EdgeGlow, event )
							return 
						else
							EdgeGlow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							EdgeGlow:setYRot( 123 )
							EdgeGlow:setScale( 1.26 )
							EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame4 )
						end
					end
					
					if event.interrupted then
						EdgeGlowFrame3( EdgeGlow, event )
						return 
					else
						EdgeGlow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						EdgeGlow:setScale( 1.12 )
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", EdgeGlowFrame3 )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.EdgeGlow:setYRot( 0 )
				self.EdgeGlow:setScale( 1 )
				EdgeGlowFrame2( EdgeGlow, {} )
				local EdgeGlow0Frame2 = function ( EdgeGlow0, event )
					local EdgeGlow0Frame3 = function ( EdgeGlow0, event )
						local EdgeGlow0Frame4 = function ( EdgeGlow0, event )
							local EdgeGlow0Frame5 = function ( EdgeGlow0, event )
								local EdgeGlow0Frame6 = function ( EdgeGlow0, event )
									if not event.interrupted then
										EdgeGlow0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									end
									EdgeGlow0:setAlpha( 0 )
									EdgeGlow0:setYRot( 304 )
									EdgeGlow0:setScale( 1.35 )
									if event.interrupted then
										self.clipFinished( EdgeGlow0, event )
									else
										EdgeGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EdgeGlow0Frame6( EdgeGlow0, event )
									return 
								else
									EdgeGlow0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									EdgeGlow0:setYRot( 304 )
									EdgeGlow0:registerEventHandler( "transition_complete_keyframe", EdgeGlow0Frame6 )
								end
							end
							
							if event.interrupted then
								EdgeGlow0Frame5( EdgeGlow0, event )
								return 
							else
								EdgeGlow0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								EdgeGlow0:setYRot( 214 )
								EdgeGlow0:setScale( 1.35 )
								EdgeGlow0:registerEventHandler( "transition_complete_keyframe", EdgeGlow0Frame5 )
							end
						end
						
						if event.interrupted then
							EdgeGlow0Frame4( EdgeGlow0, event )
							return 
						else
							EdgeGlow0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							EdgeGlow0:setYRot( 123 )
							EdgeGlow0:setScale( 1.26 )
							EdgeGlow0:registerEventHandler( "transition_complete_keyframe", EdgeGlow0Frame4 )
						end
					end
					
					if event.interrupted then
						EdgeGlow0Frame3( EdgeGlow0, event )
						return 
					else
						EdgeGlow0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						EdgeGlow0:setScale( 1.12 )
						EdgeGlow0:registerEventHandler( "transition_complete_keyframe", EdgeGlow0Frame3 )
					end
				end
				
				EdgeGlow0:completeAnimation()
				self.EdgeGlow0:setAlpha( 0 )
				self.EdgeGlow0:setYRot( 0 )
				self.EdgeGlow0:setScale( 1 )
				EdgeGlow0Frame2( EdgeGlow0, {} )
				local BlackShadowFrame2 = function ( BlackShadow, event )
					local BlackShadowFrame3 = function ( BlackShadow, event )
						local BlackShadowFrame4 = function ( BlackShadow, event )
							local BlackShadowFrame5 = function ( BlackShadow, event )
								local BlackShadowFrame6 = function ( BlackShadow, event )
									local BlackShadowFrame7 = function ( BlackShadow, event )
										if not event.interrupted then
											BlackShadow:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
										end
										BlackShadow:setAlpha( 0.2 )
										BlackShadow:setYRot( 180 )
										BlackShadow:setScale( 1.25 )
										if event.interrupted then
											self.clipFinished( BlackShadow, event )
										else
											BlackShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										BlackShadowFrame7( BlackShadow, event )
										return 
									else
										BlackShadow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										BlackShadow:setScale( 1.25 )
										BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame7 )
									end
								end
								
								if event.interrupted then
									BlackShadowFrame6( BlackShadow, event )
									return 
								else
									BlackShadow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									BlackShadow:setYRot( 180 )
									BlackShadow:setScale( 1.18 )
									BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame6 )
								end
							end
							
							if event.interrupted then
								BlackShadowFrame5( BlackShadow, event )
								return 
							else
								BlackShadow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								BlackShadow:setYRot( 114.55 )
								BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame5 )
							end
						end
						
						if event.interrupted then
							BlackShadowFrame4( BlackShadow, event )
							return 
						else
							BlackShadow:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame4 )
						end
					end
					
					if event.interrupted then
						BlackShadowFrame3( BlackShadow, event )
						return 
					else
						BlackShadow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						BlackShadow:setAlpha( 0.2 )
						BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame3 )
					end
				end
				
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0 )
				self.BlackShadow:setYRot( 0 )
				self.BlackShadow:setScale( 1 )
				BlackShadowFrame2( BlackShadow, {} )
				local AmmoWidgetThiefCoinWidgetxmlFrame2 = function ( AmmoWidgetThiefCoinWidgetxml, event )
					local AmmoWidgetThiefCoinWidgetxmlFrame3 = function ( AmmoWidgetThiefCoinWidgetxml, event )
						local AmmoWidgetThiefCoinWidgetxmlFrame4 = function ( AmmoWidgetThiefCoinWidgetxml, event )
							local AmmoWidgetThiefCoinWidgetxmlFrame5 = function ( AmmoWidgetThiefCoinWidgetxml, event )
								local AmmoWidgetThiefCoinWidgetxmlFrame6 = function ( AmmoWidgetThiefCoinWidgetxml, event )
									local AmmoWidgetThiefCoinWidgetxmlFrame7 = function ( AmmoWidgetThiefCoinWidgetxml, event )
										local AmmoWidgetThiefCoinWidgetxmlFrame8 = function ( AmmoWidgetThiefCoinWidgetxml, event )
											local AmmoWidgetThiefCoinWidgetxmlFrame9 = function ( AmmoWidgetThiefCoinWidgetxml, event )
												local AmmoWidgetThiefCoinWidgetxmlFrame10 = function ( AmmoWidgetThiefCoinWidgetxml, event )
													local AmmoWidgetThiefCoinWidgetxmlFrame11 = function ( AmmoWidgetThiefCoinWidgetxml, event )
														local AmmoWidgetThiefCoinWidgetxmlFrame12 = function ( AmmoWidgetThiefCoinWidgetxml, event )
															local AmmoWidgetThiefCoinWidgetxmlFrame13 = function ( AmmoWidgetThiefCoinWidgetxml, event )
																if not event.interrupted then
																	AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Linear )
																	AmmoWidgetThiefCoinWidgetxml.RingBG:beginAnimation( "subkeyframe", 19, false, true, CoD.TweenType.Linear )
																	AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:beginAnimation( "subkeyframe", 19, false, true, CoD.TweenType.Linear )
																	AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:beginAnimation( "subkeyframe", 19, false, true, CoD.TweenType.Linear )
																end
																AmmoWidgetThiefCoinWidgetxml:setLeftRight( true, false, 301.86, 404.86 )
																AmmoWidgetThiefCoinWidgetxml:setTopBottom( true, false, 20.15, 123.15 )
																AmmoWidgetThiefCoinWidgetxml:setAlpha( 0 )
																AmmoWidgetThiefCoinWidgetxml:setYRot( 0 )
																AmmoWidgetThiefCoinWidgetxml:setScale( 0.65 )
																AmmoWidgetThiefCoinWidgetxml.RingBG:setAlpha( 1 )
																AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:setAlpha( 1 )
																AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( AmmoWidgetThiefCoinWidgetxml, event )
																else
																	AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																AmmoWidgetThiefCoinWidgetxmlFrame13( AmmoWidgetThiefCoinWidgetxml, event )
																return 
															else
																AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 40, false, true, CoD.TweenType.Linear )
																AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.21 )
																AmmoWidgetThiefCoinWidgetxml:setYRot( 175 )
																AmmoWidgetThiefCoinWidgetxml:setScale( 0.81 )
																AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame13 )
															end
														end
														
														if event.interrupted then
															AmmoWidgetThiefCoinWidgetxmlFrame12( AmmoWidgetThiefCoinWidgetxml, event )
															return 
														else
															AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 99, true, true, CoD.TweenType.Back )
															AmmoWidgetThiefCoinWidgetxml:setYRot( 171.74 )
															AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame12 )
														end
													end
													
													if event.interrupted then
														AmmoWidgetThiefCoinWidgetxmlFrame11( AmmoWidgetThiefCoinWidgetxml, event )
														return 
													else
														AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.85 )
														AmmoWidgetThiefCoinWidgetxml:setYRot( 154.41 )
														AmmoWidgetThiefCoinWidgetxml:setScale( 1.3 )
														AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame11 )
													end
												end
												
												if event.interrupted then
													AmmoWidgetThiefCoinWidgetxmlFrame10( AmmoWidgetThiefCoinWidgetxml, event )
													return 
												else
													AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.7 )
													AmmoWidgetThiefCoinWidgetxml:setYRot( 150 )
													AmmoWidgetThiefCoinWidgetxml:setScale( 1.34 )
													AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame10 )
												end
											end
											
											if event.interrupted then
												AmmoWidgetThiefCoinWidgetxmlFrame9( AmmoWidgetThiefCoinWidgetxml, event )
												return 
											else
												AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.77 )
												AmmoWidgetThiefCoinWidgetxml:setYRot( 131.82 )
												AmmoWidgetThiefCoinWidgetxml:setScale( 1.4 )
												AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame9 )
											end
										end
										
										if event.interrupted then
											AmmoWidgetThiefCoinWidgetxmlFrame8( AmmoWidgetThiefCoinWidgetxml, event )
											return 
										else
											AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.86 )
											AmmoWidgetThiefCoinWidgetxml:setYRot( 110 )
											AmmoWidgetThiefCoinWidgetxml:setScale( 1.34 )
											AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame8 )
										end
									end
									
									if event.interrupted then
										AmmoWidgetThiefCoinWidgetxmlFrame7( AmmoWidgetThiefCoinWidgetxml, event )
										return 
									else
										AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.89 )
										AmmoWidgetThiefCoinWidgetxml:setYRot( 78.57 )
										AmmoWidgetThiefCoinWidgetxml:setScale( 1.32 )
										AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:setAlpha( 1 )
										AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:setAlpha( 0 )
										AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame7 )
									end
								end
								
								if event.interrupted then
									AmmoWidgetThiefCoinWidgetxmlFrame6( AmmoWidgetThiefCoinWidgetxml, event )
									return 
								else
									AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.9 )
									AmmoWidgetThiefCoinWidgetxml:setYRot( 62.86 )
									AmmoWidgetThiefCoinWidgetxml:setScale( 1.31 )
									AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame6 )
								end
							end
							
							if event.interrupted then
								AmmoWidgetThiefCoinWidgetxmlFrame5( AmmoWidgetThiefCoinWidgetxml, event )
								return 
							else
								AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.91 )
								AmmoWidgetThiefCoinWidgetxml:setYRot( 47.14 )
								AmmoWidgetThiefCoinWidgetxml:setScale( 1.3 )
								AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame5 )
							end
						end
						
						if event.interrupted then
							AmmoWidgetThiefCoinWidgetxmlFrame4( AmmoWidgetThiefCoinWidgetxml, event )
							return 
						else
							AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.96 )
							AmmoWidgetThiefCoinWidgetxml:setScale( 1.15 )
							AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetThiefCoinWidgetxmlFrame3( AmmoWidgetThiefCoinWidgetxml, event )
						return 
					else
						AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						AmmoWidgetThiefCoinWidgetxml:setAlpha( 1 )
						AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame3 )
					end
				end
				
				AmmoWidgetThiefCoinWidgetxml:completeAnimation()
				AmmoWidgetThiefCoinWidgetxml.RingBG:completeAnimation()
				AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:completeAnimation()
				AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:completeAnimation()
				self.AmmoWidgetThiefCoinWidgetxml:setLeftRight( true, false, 301.86, 404.86 )
				self.AmmoWidgetThiefCoinWidgetxml:setTopBottom( true, false, 20.15, 123.15 )
				self.AmmoWidgetThiefCoinWidgetxml:setAlpha( 0 )
				self.AmmoWidgetThiefCoinWidgetxml:setYRot( 0 )
				self.AmmoWidgetThiefCoinWidgetxml:setScale( 1 )
				self.AmmoWidgetThiefCoinWidgetxml.RingBG:setAlpha( 1 )
				self.AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:setAlpha( 0 )
				self.AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:setAlpha( 1 )
				AmmoWidgetThiefCoinWidgetxmlFrame2( AmmoWidgetThiefCoinWidgetxml, {} )
				local Texture1Frame2 = function ( Texture1, event )
					if not event.interrupted then
						Texture1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
					end
					Texture1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Texture1, event )
					else
						Texture1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Texture1:completeAnimation()
				self.Texture1:setAlpha( 0 )
				Texture1Frame2( Texture1, {} )
				local Texture2Frame2 = function ( Texture2, event )
					if not event.interrupted then
						Texture2:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
					end
					Texture2:setAlpha( 0 )
					Texture2:setXRot( 0 )
					Texture2:setYRot( 0 )
					Texture2:setZRot( 0 )
					Texture2:setScale( 1.1 )
					if event.interrupted then
						self.clipFinished( Texture2, event )
					else
						Texture2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Texture2:completeAnimation()
				self.Texture2:setAlpha( 0 )
				self.Texture2:setXRot( 0 )
				self.Texture2:setYRot( 0 )
				self.Texture2:setZRot( 0 )
				self.Texture2:setScale( 1.1 )
				Texture2Frame2( Texture2, {} )
				local GlowBigFrame2 = function ( GlowBig, event )
					local GlowBigFrame3 = function ( GlowBig, event )
						local GlowBigFrame4 = function ( GlowBig, event )
							local GlowBigFrame5 = function ( GlowBig, event )
								local GlowBigFrame6 = function ( GlowBig, event )
									local GlowBigFrame7 = function ( GlowBig, event )
										local GlowBigFrame8 = function ( GlowBig, event )
											if not event.interrupted then
												GlowBig:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											end
											GlowBig:setAlpha( 0.98 )
											GlowBig:setYRot( 180 )
											if event.interrupted then
												self.clipFinished( GlowBig, event )
											else
												GlowBig:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlowBigFrame8( GlowBig, event )
											return 
										else
											GlowBig:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											GlowBig:setAlpha( 0.62 )
											GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame8 )
										end
									end
									
									if event.interrupted then
										GlowBigFrame7( GlowBig, event )
										return 
									else
										GlowBig:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										GlowBig:setAlpha( 1 )
										GlowBig:setYRot( 180 )
										GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame7 )
									end
								end
								
								if event.interrupted then
									GlowBigFrame6( GlowBig, event )
									return 
								else
									GlowBig:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									GlowBig:setAlpha( 0 )
									GlowBig:setYRot( 86 )
									GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame6 )
								end
							end
							
							if event.interrupted then
								GlowBigFrame5( GlowBig, event )
								return 
							else
								GlowBig:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								GlowBig:setYRot( 43 )
								GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame5 )
							end
						end
						
						if event.interrupted then
							GlowBigFrame4( GlowBig, event )
							return 
						else
							GlowBig:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBigFrame3( GlowBig, event )
						return 
					else
						GlowBig:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						GlowBig:setAlpha( 0.7 )
						GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame3 )
					end
				end
				
				GlowBig:completeAnimation()
				self.GlowBig:setAlpha( 0 )
				self.GlowBig:setYRot( 0 )
				GlowBigFrame2( GlowBig, {} )
				local AbilitySwirlFrame2 = function ( AbilitySwirl, event )
					local AbilitySwirlFrame3 = function ( AbilitySwirl, event )
						local AbilitySwirlFrame4 = function ( AbilitySwirl, event )
							local AbilitySwirlFrame5 = function ( AbilitySwirl, event )
								local AbilitySwirlFrame6 = function ( AbilitySwirl, event )
									local AbilitySwirlFrame7 = function ( AbilitySwirl, event )
										if not event.interrupted then
											AbilitySwirl:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										end
										AbilitySwirl:setAlpha( 0 )
										AbilitySwirl:setYRot( 175 )
										AbilitySwirl:setZRot( -231 )
										AbilitySwirl:setScale( 1.3 )
										if event.interrupted then
											self.clipFinished( AbilitySwirl, event )
										else
											AbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										AbilitySwirlFrame7( AbilitySwirl, event )
										return 
									else
										AbilitySwirl:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										AbilitySwirl:setAlpha( 0.4 )
										AbilitySwirl:setYRot( 153.33 )
										AbilitySwirl:setZRot( -231 )
										AbilitySwirl:setScale( 1.6 )
										AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame7 )
									end
								end
								
								if event.interrupted then
									AbilitySwirlFrame6( AbilitySwirl, event )
									return 
								else
									AbilitySwirl:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									AbilitySwirl:setAlpha( 1 )
									AbilitySwirl:setYRot( 120.83 )
									AbilitySwirl:setZRot( -96.53 )
									AbilitySwirl:setScale( 1.32 )
									AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame6 )
								end
							end
							
							if event.interrupted then
								AbilitySwirlFrame5( AbilitySwirl, event )
								return 
							else
								AbilitySwirl:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								AbilitySwirl:setAlpha( 0.82 )
								AbilitySwirl:setYRot( 110 )
								AbilitySwirl:setZRot( -51.71 )
								AbilitySwirl:setScale( 1.22 )
								AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame5 )
							end
						end
						
						if event.interrupted then
							AbilitySwirlFrame4( AbilitySwirl, event )
							return 
						else
							AbilitySwirl:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							AbilitySwirl:setAlpha( 0.18 )
							AbilitySwirl:setZRot( 105.18 )
							AbilitySwirl:setScale( 0.89 )
							AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame4 )
						end
					end
					
					if event.interrupted then
						AbilitySwirlFrame3( AbilitySwirl, event )
						return 
					else
						AbilitySwirl:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						AbilitySwirl:registerEventHandler( "transition_complete_keyframe", AbilitySwirlFrame3 )
					end
				end
				
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.AbilitySwirl:setYRot( 0 )
				self.AbilitySwirl:setZRot( 150 )
				self.AbilitySwirl:setScale( 0.8 )
				AbilitySwirlFrame2( AbilitySwirl, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									if not event.interrupted then
										GlowOrangeOver:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									end
									GlowOrangeOver:setLeftRight( true, false, 250.01, 452.83 )
									GlowOrangeOver:setTopBottom( true, false, -32.68, 159.68 )
									GlowOrangeOver:setAlpha( 0.4 )
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
									GlowOrangeOver:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.3 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 250.01, 452.83 )
				self.GlowOrangeOver:setTopBottom( true, false, -32.68, 159.68 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									if not event.interrupted then
										Glow:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
									end
									Glow:setAlpha( 0 )
									Glow:setScale( 0.8 )
									if event.interrupted then
										self.clipFinished( Glow, event )
									else
										Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
									Glow:setScale( 1 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0 )
								Glow:setScale( 1.59 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.29 )
							Glow:setScale( 1.15 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.8 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.99 )
				GlowFrame2( Glow, {} )
				local AmmoWidgetHeroAbilityThiefRingAnimationFrame2 = function ( AmmoWidgetHeroAbilityThiefRingAnimation, event )
					if not event.interrupted then
						AmmoWidgetHeroAbilityThiefRingAnimation:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetHeroAbilityThiefRingAnimation:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetHeroAbilityThiefRingAnimation, event )
					else
						AmmoWidgetHeroAbilityThiefRingAnimation:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetHeroAbilityThiefRingAnimation:completeAnimation()
				self.AmmoWidgetHeroAbilityThiefRingAnimation:setAlpha( 1 )
				AmmoWidgetHeroAbilityThiefRingAnimationFrame2( AmmoWidgetHeroAbilityThiefRingAnimation, {} )
			end,
			Finished = function ()
				self:setupElementClipCounter( 14 )
				local RingBLURShadowFrame2 = function ( RingBLURShadow, event )
					local RingBLURShadowFrame3 = function ( RingBLURShadow, event )
						if not event.interrupted then
							RingBLURShadow:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						RingBLURShadow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( RingBLURShadow, event )
						else
							RingBLURShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RingBLURShadowFrame3( RingBLURShadow, event )
						return 
					else
						RingBLURShadow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						RingBLURShadow:setAlpha( 0.8 )
						RingBLURShadow:registerEventHandler( "transition_complete_keyframe", RingBLURShadowFrame3 )
					end
				end
				
				RingBLURShadow:completeAnimation()
				self.RingBLURShadow:setAlpha( 0 )
				RingBLURShadowFrame2( RingBLURShadow, {} )
				local MaskGlow0Frame2 = function ( MaskGlow0, event )
					local MaskGlow0Frame3 = function ( MaskGlow0, event )
						if not event.interrupted then
							MaskGlow0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						end
						MaskGlow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( MaskGlow0, event )
						else
							MaskGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MaskGlow0Frame3( MaskGlow0, event )
						return 
					else
						MaskGlow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MaskGlow0:registerEventHandler( "transition_complete_keyframe", MaskGlow0Frame3 )
					end
				end
				
				MaskGlow0:completeAnimation()
				self.MaskGlow0:setAlpha( 0.7 )
				MaskGlow0Frame2( MaskGlow0, {} )
				local MaskGlowFrame2 = function ( MaskGlow, event )
					if not event.interrupted then
						MaskGlow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					MaskGlow:setAlpha( 0 )
					MaskGlow:setScale( 0.75 )
					if event.interrupted then
						self.clipFinished( MaskGlow, event )
					else
						MaskGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.MaskGlow:setScale( 0.75 )
				MaskGlowFrame2( MaskGlow, {} )
				local EdgeGlowFrame2 = function ( EdgeGlow, event )
					if not event.interrupted then
						EdgeGlow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					EdgeGlow:setAlpha( 0 )
					EdgeGlow:setYRot( 360 )
					EdgeGlow:setScale( 1 )
					if event.interrupted then
						self.clipFinished( EdgeGlow, event )
					else
						EdgeGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.EdgeGlow:setYRot( 360 )
				self.EdgeGlow:setScale( 1 )
				EdgeGlowFrame2( EdgeGlow, {} )
				local EdgeGlow0Frame2 = function ( EdgeGlow0, event )
					if not event.interrupted then
						EdgeGlow0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					EdgeGlow0:setAlpha( 0 )
					EdgeGlow0:setYRot( 360 )
					EdgeGlow0:setScale( 1 )
					if event.interrupted then
						self.clipFinished( EdgeGlow0, event )
					else
						EdgeGlow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EdgeGlow0:completeAnimation()
				self.EdgeGlow0:setAlpha( 0 )
				self.EdgeGlow0:setYRot( 360 )
				self.EdgeGlow0:setScale( 1 )
				EdgeGlow0Frame2( EdgeGlow0, {} )
				local BlackShadowFrame2 = function ( BlackShadow, event )
					local BlackShadowFrame3 = function ( BlackShadow, event )
						local BlackShadowFrame4 = function ( BlackShadow, event )
							local BlackShadowFrame5 = function ( BlackShadow, event )
								if not event.interrupted then
									BlackShadow:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
								end
								BlackShadow:setAlpha( 0 )
								BlackShadow:setScale( 0.95 )
								if event.interrupted then
									self.clipFinished( BlackShadow, event )
								else
									BlackShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BlackShadowFrame5( BlackShadow, event )
								return 
							else
								BlackShadow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame5 )
							end
						end
						
						if event.interrupted then
							BlackShadowFrame4( BlackShadow, event )
							return 
						else
							BlackShadow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							BlackShadow:setScale( 0.95 )
							BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame4 )
						end
					end
					
					if event.interrupted then
						BlackShadowFrame3( BlackShadow, event )
						return 
					else
						BlackShadow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						BlackShadow:registerEventHandler( "transition_complete_keyframe", BlackShadowFrame3 )
					end
				end
				
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0.2 )
				self.BlackShadow:setScale( 1 )
				BlackShadowFrame2( BlackShadow, {} )
				local AmmoWidgetThiefCoinWidgetxmlFrame2 = function ( AmmoWidgetThiefCoinWidgetxml, event )
					local AmmoWidgetThiefCoinWidgetxmlFrame3 = function ( AmmoWidgetThiefCoinWidgetxml, event )
						local AmmoWidgetThiefCoinWidgetxmlFrame4 = function ( AmmoWidgetThiefCoinWidgetxml, event )
							local AmmoWidgetThiefCoinWidgetxmlFrame5 = function ( AmmoWidgetThiefCoinWidgetxml, event )
								local AmmoWidgetThiefCoinWidgetxmlFrame6 = function ( AmmoWidgetThiefCoinWidgetxml, event )
									if not event.interrupted then
										AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
										AmmoWidgetThiefCoinWidgetxml.RingBG:beginAnimation( "subkeyframe", 170, false, false, CoD.TweenType.Linear )
										AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:beginAnimation( "subkeyframe", 170, false, false, CoD.TweenType.Linear )
										AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:beginAnimation( "subkeyframe", 170, false, false, CoD.TweenType.Linear )
									end
									AmmoWidgetThiefCoinWidgetxml:setAlpha( 0 )
									AmmoWidgetThiefCoinWidgetxml:setYRot( 360 )
									AmmoWidgetThiefCoinWidgetxml:setScale( 1 )
									AmmoWidgetThiefCoinWidgetxml.RingBG:setAlpha( 0 )
									AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:setAlpha( 0 )
									AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( AmmoWidgetThiefCoinWidgetxml, event )
									else
										AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									AmmoWidgetThiefCoinWidgetxmlFrame6( AmmoWidgetThiefCoinWidgetxml, event )
									return 
								else
									AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.13 )
									AmmoWidgetThiefCoinWidgetxml:setScale( 1 )
									AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame6 )
								end
							end
							
							if event.interrupted then
								AmmoWidgetThiefCoinWidgetxmlFrame5( AmmoWidgetThiefCoinWidgetxml, event )
								return 
							else
								AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.16 )
								AmmoWidgetThiefCoinWidgetxml:setScale( 0.65 )
								AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame5 )
							end
						end
						
						if event.interrupted then
							AmmoWidgetThiefCoinWidgetxmlFrame4( AmmoWidgetThiefCoinWidgetxml, event )
							return 
						else
							AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							AmmoWidgetThiefCoinWidgetxml.RingBG:beginAnimation( "subkeyframe", 70, false, false, CoD.TweenType.Linear )
							AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.19 )
							AmmoWidgetThiefCoinWidgetxml:setScale( 1.15 )
							AmmoWidgetThiefCoinWidgetxml.RingBG:setAlpha( 0 )
							AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetThiefCoinWidgetxmlFrame3( AmmoWidgetThiefCoinWidgetxml, event )
						return 
					else
						AmmoWidgetThiefCoinWidgetxml:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
						AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.24 )
						AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:setAlpha( 0 )
						AmmoWidgetThiefCoinWidgetxml:registerEventHandler( "transition_complete_keyframe", AmmoWidgetThiefCoinWidgetxmlFrame3 )
					end
				end
				
				AmmoWidgetThiefCoinWidgetxml:completeAnimation()
				AmmoWidgetThiefCoinWidgetxml.RingBG:completeAnimation()
				AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:completeAnimation()
				AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:completeAnimation()
				self.AmmoWidgetThiefCoinWidgetxml:setAlpha( 0.26 )
				self.AmmoWidgetThiefCoinWidgetxml:setYRot( 360 )
				self.AmmoWidgetThiefCoinWidgetxml:setScale( 0.65 )
				self.AmmoWidgetThiefCoinWidgetxml.RingBG:setAlpha( 1 )
				self.AmmoWidgetThiefCoinWidgetxml.NewWeaponIcon:setAlpha( 1 )
				self.AmmoWidgetThiefCoinWidgetxml.CurrentWeaponIcon:setAlpha( 0 )
				AmmoWidgetThiefCoinWidgetxmlFrame2( AmmoWidgetThiefCoinWidgetxml, {} )
				local Texture1Frame2 = function ( Texture1, event )
					local Texture1Frame3 = function ( Texture1, event )
						local Texture1Frame4 = function ( Texture1, event )
							if not event.interrupted then
								Texture1:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							end
							Texture1:setAlpha( 0 )
							Texture1:setScale( 1.8 )
							if event.interrupted then
								self.clipFinished( Texture1, event )
							else
								Texture1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Texture1Frame4( Texture1, event )
							return 
						else
							Texture1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							Texture1:setScale( 1.38 )
							Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame4 )
						end
					end
					
					if event.interrupted then
						Texture1Frame3( Texture1, event )
						return 
					else
						Texture1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Texture1:setAlpha( 0.6 )
						Texture1:registerEventHandler( "transition_complete_keyframe", Texture1Frame3 )
					end
				end
				
				Texture1:completeAnimation()
				self.Texture1:setAlpha( 0 )
				self.Texture1:setScale( 1 )
				Texture1Frame2( Texture1, {} )
				local Texture2Frame2 = function ( Texture2, event )
					local Texture2Frame3 = function ( Texture2, event )
						local Texture2Frame4 = function ( Texture2, event )
							local Texture2Frame5 = function ( Texture2, event )
								if not event.interrupted then
									Texture2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								end
								Texture2:setAlpha( 0 )
								Texture2:setXRot( 0 )
								Texture2:setYRot( 0 )
								Texture2:setZRot( 0 )
								Texture2:setScale( 1.8 )
								if event.interrupted then
									self.clipFinished( Texture2, event )
								else
									Texture2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Texture2Frame5( Texture2, event )
								return 
							else
								Texture2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
								Texture2:setAlpha( 0 )
								Texture2:setScale( 1.49 )
								Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame5 )
							end
						end
						
						if event.interrupted then
							Texture2Frame4( Texture2, event )
							return 
						else
							Texture2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Texture2:setAlpha( 0.6 )
							Texture2:setScale( 1.24 )
							Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame4 )
						end
					end
					
					if event.interrupted then
						Texture2Frame3( Texture2, event )
						return 
					else
						Texture2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Texture2:setScale( 1.18 )
						Texture2:registerEventHandler( "transition_complete_keyframe", Texture2Frame3 )
					end
				end
				
				Texture2:completeAnimation()
				self.Texture2:setAlpha( 0 )
				self.Texture2:setXRot( 0 )
				self.Texture2:setYRot( 0 )
				self.Texture2:setZRot( 0 )
				self.Texture2:setScale( 1.1 )
				Texture2Frame2( Texture2, {} )
				local GlowBigFrame2 = function ( GlowBig, event )
					local GlowBigFrame3 = function ( GlowBig, event )
						local GlowBigFrame4 = function ( GlowBig, event )
							if not event.interrupted then
								GlowBig:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							end
							GlowBig:setAlpha( 0 )
							GlowBig:setScale( 1.4 )
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
							GlowBig:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							GlowBig:setScale( 1.14 )
							GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame4 )
						end
					end
					
					if event.interrupted then
						GlowBigFrame3( GlowBig, event )
						return 
					else
						GlowBig:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						GlowBig:setAlpha( 1 )
						GlowBig:registerEventHandler( "transition_complete_keyframe", GlowBigFrame3 )
					end
				end
				
				GlowBig:completeAnimation()
				self.GlowBig:setAlpha( 0.98 )
				self.GlowBig:setScale( 1 )
				GlowBigFrame2( GlowBig, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
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
						GlowOrangeOver:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.6 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.4 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								end
								Glow:setAlpha( 0 )
								Glow:setScale( 1.6 )
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
								Glow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 1 )
								Glow:setScale( 1.25 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.5 )
							Glow:setScale( 1.2 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow:setScale( 1.07 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.Glow:setScale( 0.8 )
				GlowFrame2( Glow, {} )
				AmmoWidgetHeroAbilityThiefRingAnimation:completeAnimation()
				self.AmmoWidgetHeroAbilityThiefRingAnimation:setAlpha( 1 )
				self.clipFinished( AmmoWidgetHeroAbilityThiefRingAnimation, {} )
			end
		},
		Finished = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				RingBLURShadow:completeAnimation()
				self.RingBLURShadow:setAlpha( 0 )
				self.clipFinished( RingBLURShadow, {} )
				MaskGlow0:completeAnimation()
				self.MaskGlow0:setAlpha( 0 )
				self.clipFinished( MaskGlow0, {} )
				MaskGlow:completeAnimation()
				self.MaskGlow:setAlpha( 0 )
				self.clipFinished( MaskGlow, {} )
				EdgeGlow:completeAnimation()
				self.EdgeGlow:setAlpha( 0 )
				self.clipFinished( EdgeGlow, {} )
				EdgeGlow0:completeAnimation()
				self.EdgeGlow0:setAlpha( 0 )
				self.clipFinished( EdgeGlow0, {} )
				BlackShadow:completeAnimation()
				self.BlackShadow:setAlpha( 0 )
				self.clipFinished( BlackShadow, {} )
				AmmoWidgetThiefCoinWidgetxml:completeAnimation()
				self.AmmoWidgetThiefCoinWidgetxml:setAlpha( 0 )
				self.clipFinished( AmmoWidgetThiefCoinWidgetxml, {} )
				Texture1:completeAnimation()
				self.Texture1:setAlpha( 0 )
				self.clipFinished( Texture1, {} )
				Texture2:completeAnimation()
				self.Texture2:setAlpha( 0 )
				self.clipFinished( Texture2, {} )
				GlowBig:completeAnimation()
				self.GlowBig:setAlpha( 0 )
				self.clipFinished( GlowBig, {} )
				AbilitySwirl:completeAnimation()
				self.AbilitySwirl:setAlpha( 0 )
				self.clipFinished( AbilitySwirl, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.thiefStatus", 1 )
			end
		},
		{
			stateName = "Finished",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.thiefStatus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.thiefStatus"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidgetThiefCoinWidgetxml:close()
		element.Glow:close()
		element.AmmoWidgetHeroAbilityThiefRingAnimation:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

