require( "ui.uieditor.widgets.CPLevels.RamsesStation.WoundedSoldiers.woundedSoldier_Panel" )
require( "ui.uieditor.widgets.HUD.ZM_Notif.ZmNotif1_CursorHint" )
require( "ui.uieditor.widgets.HUD.ZM_NotifFactory.ZmNotif1Factory" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_ParticleFX" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.playNotification = function ( f2_arg0, f2_arg1 )
		f2_arg0.ZmNotif1CursorHint0.CursorHintText:setText( f2_arg1.description )
		f2_arg0.ZmNotifFactory.Label1:setText( f2_arg1.title )
		f2_arg0.ZmNotifFactory.Label2:setText( f2_arg1.title )
		if f2_arg1.clip == "TextandImageBGB" or f2_arg1.clip == "TextandImageBGBToken" then
			f2_arg0.bgbTexture:setImage( f2_arg1.bgbImage )
		end
		f2_arg0:playClip( f2_arg1.clip )
	end
	
	f1_arg0.appendNotification = function ( f3_arg0, f3_arg1 )
		if f3_arg0.notificationInProgress == true then
			local f3_local0 = f3_arg0.nextNotification
			if f3_local0 == nil then
				f3_arg0.nextNotification = LUI.ShallowCopy( f3_arg1 )
			end
			while f3_local0 and f3_local0.next ~= nil do
				f3_local0 = f3_local0.next
			end
			f3_local0.next = LUI.ShallowCopy( f3_arg1 )
		else
			f3_arg0:playNotification( LUI.ShallowCopy( f3_arg1 ) )
		end
	end
	
	f1_arg0.notificationInProgress = false
	f1_arg0.nextNotification = nil
	LUI.OverrideFunction_CallOriginalSecond( f1_arg0, "playClip", function ( element )
		element.notificationInProgress = true
	end )
	f1_arg0:registerEventHandler( "clip_over", function ( element, event )
		f1_arg0.notificationInProgress = false
		if f1_arg0.nextNotification ~= nil then
			f1_arg0:playNotification( f1_arg0.nextNotification )
			f1_arg0.nextNotification = f1_arg0.nextNotification.next
		end
	end )
end

CoD.ZmNotifBGB_ContainerFactory = InheritFrom( LUI.UIElement )
CoD.ZmNotifBGB_ContainerFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmNotifBGB_ContainerFactory )
	self.id = "ZmNotifBGB_ContainerFactory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 312 )
	self:setTopBottom( true, false, 0, 253 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.woundedSoldier_Panel.new( menu, controller )
	Panel:setLeftRight( false, false, -156, 156 )
	Panel:setTopBottom( true, false, 0, 250.67 )
	Panel:setRGB( 0.84, 0.78, 0.72 )
	Panel:setAlpha( 0 )
	Panel:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Panel:setShaderVector( 0, 30, 0, 0, 0 )
	Panel.Image1:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local basicImageBacking = LUI.UIImage.new()
	basicImageBacking:setLeftRight( false, false, -124, 124 )
	basicImageBacking:setTopBottom( true, false, 5, 253 )
	basicImageBacking:setAlpha( 0 )
	basicImageBacking:setImage( RegisterImage( "uie_t7_zm_hud_notif_backdesign_factory" ) )
	self:addElement( basicImageBacking )
	self.basicImageBacking = basicImageBacking
	
	local basicImage = LUI.UIImage.new()
	basicImage:setLeftRight( false, false, -123, 125 )
	basicImage:setTopBottom( true, false, 13, 221 )
	basicImage:setAlpha( 0 )
	basicImage:setImage( RegisterImage( "uie_t7_zm_hud_notif_factory" ) )
	self:addElement( basicImage )
	self.basicImage = basicImage
	
	local bgbGlowOrangeOver = LUI.UIImage.new()
	bgbGlowOrangeOver:setLeftRight( false, false, -103.18, 103.34 )
	bgbGlowOrangeOver:setTopBottom( false, false, -183.84, 124.17 )
	bgbGlowOrangeOver:setRGB( 0, 0.43, 1 )
	bgbGlowOrangeOver:setAlpha( 0 )
	bgbGlowOrangeOver:setZRot( 90 )
	bgbGlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	bgbGlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbGlowOrangeOver )
	self.bgbGlowOrangeOver = bgbGlowOrangeOver
	
	local bgbTexture = LUI.UIImage.new()
	bgbTexture:setLeftRight( false, false, -89.33, 90.67 )
	bgbTexture:setTopBottom( true, false, -3.5, 176.5 )
	bgbTexture:setAlpha( 0 )
	bgbTexture:setScale( 1.1 )
	bgbTexture:setImage( RegisterImage( "uie_t7_zm_hud_ammo_bbgumtexture" ) )
	self:addElement( bgbTexture )
	self.bgbTexture = bgbTexture
	
	local bgbAbilitySwirl = LUI.UIImage.new()
	bgbAbilitySwirl:setLeftRight( false, false, -63.43, 75.43 )
	bgbAbilitySwirl:setTopBottom( true, false, 19.64, 156.5 )
	bgbAbilitySwirl:setRGB( 0, 0.39, 1 )
	bgbAbilitySwirl:setAlpha( 0 )
	bgbAbilitySwirl:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityswirl" ) )
	bgbAbilitySwirl:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( bgbAbilitySwirl )
	self.bgbAbilitySwirl = bgbAbilitySwirl
	
	local ZmNotif1CursorHint0 = CoD.ZmNotif1_CursorHint.new( menu, controller )
	ZmNotif1CursorHint0:setLeftRight( false, false, -256, 256 )
	ZmNotif1CursorHint0:setTopBottom( true, false, 197.5, 217.5 )
	ZmNotif1CursorHint0:setAlpha( 0 )
	ZmNotif1CursorHint0:setScale( 1.4 )
	ZmNotif1CursorHint0.FEButtonPanel0:setAlpha( 0.27 )
	ZmNotif1CursorHint0.CursorHintText:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( ZmNotif1CursorHint0 )
	self.ZmNotif1CursorHint0 = ZmNotif1CursorHint0
	
	local ZmNotifFactory = CoD.ZmNotif1Factory.new( menu, controller )
	ZmNotifFactory:setLeftRight( false, false, -112, 112 )
	ZmNotifFactory:setTopBottom( true, false, 138.5, 193.5 )
	ZmNotifFactory:setAlpha( 0 )
	ZmNotifFactory.Label2:setText( Engine.Localize( "MENU_NEW" ) )
	ZmNotifFactory.Label1:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( ZmNotifFactory )
	self.ZmNotifFactory = ZmNotifFactory
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -205, 205 )
	Glow:setTopBottom( true, false, 18.5, 258.5 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_zm_hud_notif_glowfilm" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -102, 101.34 )
	ZmFxSpark20:setTopBottom( true, false, 73.5, 225.5 )
	ZmFxSpark20:setRGB( 0, 0, 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local Flsh = LUI.UIImage.new()
	Flsh:setLeftRight( false, false, -219.65, 219.34 )
	Flsh:setTopBottom( true, false, 146.25, 180.75 )
	Flsh:setRGB( 0.73, 0.35, 0 )
	Flsh:setAlpha( 0 )
	Flsh:setImage( RegisterImage( "uie_t7_zm_hud_notif_txtstreak" ) )
	Flsh:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Flsh )
	self.Flsh = Flsh
	
	local ZmAmmoParticleFX1left = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX1left:setLeftRight( true, false, -17.74, 125.74 )
	ZmAmmoParticleFX1left:setTopBottom( true, false, 132.89, 207.5 )
	ZmAmmoParticleFX1left:setAlpha( 0 )
	ZmAmmoParticleFX1left:setXRot( 1 )
	ZmAmmoParticleFX1left:setYRot( 1 )
	ZmAmmoParticleFX1left:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX1left.p2:setAlpha( 0 )
	ZmAmmoParticleFX1left.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX1left )
	self.ZmAmmoParticleFX1left = ZmAmmoParticleFX1left
	
	local ZmAmmoParticleFX2left = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX2left:setLeftRight( true, false, -17.74, 125.74 )
	ZmAmmoParticleFX2left:setTopBottom( true, false, 130.5, 205.11 )
	ZmAmmoParticleFX2left:setAlpha( 0 )
	ZmAmmoParticleFX2left:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX2left.p1:setAlpha( 0 )
	ZmAmmoParticleFX2left.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX2left )
	self.ZmAmmoParticleFX2left = ZmAmmoParticleFX2left
	
	local ZmAmmoParticleFX3left = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX3left:setLeftRight( true, false, -17.74, 125.74 )
	ZmAmmoParticleFX3left:setTopBottom( true, false, 131.5, 206.11 )
	ZmAmmoParticleFX3left:setAlpha( 0 )
	ZmAmmoParticleFX3left:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX3left.p1:setAlpha( 0 )
	ZmAmmoParticleFX3left.p2:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX3left )
	self.ZmAmmoParticleFX3left = ZmAmmoParticleFX3left
	
	local ZmAmmoParticleFX1right = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX1right:setLeftRight( true, false, 204.52, 348 )
	ZmAmmoParticleFX1right:setTopBottom( true, false, 129, 203.6 )
	ZmAmmoParticleFX1right:setAlpha( 0 )
	ZmAmmoParticleFX1right:setXRot( 1 )
	ZmAmmoParticleFX1right:setYRot( 1 )
	ZmAmmoParticleFX1right:setZRot( 180 )
	ZmAmmoParticleFX1right:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX1right.p2:setAlpha( 0 )
	ZmAmmoParticleFX1right.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX1right )
	self.ZmAmmoParticleFX1right = ZmAmmoParticleFX1right
	
	local ZmAmmoParticleFX2right = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX2right:setLeftRight( true, false, 204.52, 348 )
	ZmAmmoParticleFX2right:setTopBottom( true, false, 126.6, 201.21 )
	ZmAmmoParticleFX2right:setAlpha( 0 )
	ZmAmmoParticleFX2right:setZRot( 180 )
	ZmAmmoParticleFX2right:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX2right.p1:setAlpha( 0 )
	ZmAmmoParticleFX2right.p3:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX2right )
	self.ZmAmmoParticleFX2right = ZmAmmoParticleFX2right
	
	local ZmAmmoParticleFX3right = CoD.ZmAmmo_ParticleFX.new( menu, controller )
	ZmAmmoParticleFX3right:setLeftRight( true, false, 204.52, 348 )
	ZmAmmoParticleFX3right:setTopBottom( true, false, 127.6, 202.21 )
	ZmAmmoParticleFX3right:setAlpha( 0 )
	ZmAmmoParticleFX3right:setZRot( 180 )
	ZmAmmoParticleFX3right:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmAmmoParticleFX3right.p1:setAlpha( 0 )
	ZmAmmoParticleFX3right.p2:setAlpha( 0 )
	self:addElement( ZmAmmoParticleFX3right )
	self.ZmAmmoParticleFX3right = ZmAmmoParticleFX3right
	
	local Lightning = LUI.UIImage.new()
	Lightning:setLeftRight( true, false, 102, 192 )
	Lightning:setTopBottom( true, false, 33.21, 201.21 )
	Lightning:setAlpha( 0 )
	Lightning:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	Lightning:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Lightning:setShaderVector( 0, 28, 0, 0, 0 )
	Lightning:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Lightning )
	self.Lightning = Lightning
	
	local Lightning2 = LUI.UIImage.new()
	Lightning2:setLeftRight( true, false, 102, 192 )
	Lightning2:setTopBottom( true, false, 33.21, 201.21 )
	Lightning2:setAlpha( 0 )
	Lightning2:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	Lightning2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Lightning2:setShaderVector( 0, 28, 0, 0, 0 )
	Lightning2:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Lightning2 )
	self.Lightning2 = Lightning2
	
	local Lightning3 = LUI.UIImage.new()
	Lightning3:setLeftRight( true, false, 102, 192 )
	Lightning3:setTopBottom( true, false, 33.21, 201.21 )
	Lightning3:setAlpha( 0 )
	Lightning3:setImage( RegisterImage( "uie_t7_zm_derriese_hud_notification_anim" ) )
	Lightning3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	Lightning3:setShaderVector( 0, 28, 0, 0, 0 )
	Lightning3:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Lightning3 )
	self.Lightning3 = Lightning3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				basicImageBacking:beginAnimation( "keyframe", 4369, false, false, CoD.TweenType.Linear )
				basicImageBacking:setAlpha( 0 )
				basicImageBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				basicImage:beginAnimation( "keyframe", 4369, false, false, CoD.TweenType.Linear )
				basicImage:setAlpha( 0 )
				basicImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				bgbGlowOrangeOver:completeAnimation()
				self.bgbGlowOrangeOver:setAlpha( 0 )
				self.clipFinished( bgbGlowOrangeOver, {} )
				bgbTexture:completeAnimation()
				self.bgbTexture:setAlpha( 0 )
				self.clipFinished( bgbTexture, {} )
				bgbAbilitySwirl:completeAnimation()
				self.bgbAbilitySwirl:setAlpha( 0 )
				self.clipFinished( bgbAbilitySwirl, {} )
				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint0, {} )
				ZmNotifFactory:completeAnimation()
				self.ZmNotifFactory:setAlpha( 0 )
				self.clipFinished( ZmNotifFactory, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setRGB( 0, 0, 0 )
				self.ZmFxSpark20:setAlpha( 1 )
				self.clipFinished( ZmFxSpark20, {} )
				Flsh:completeAnimation()
				self.Flsh:setRGB( 0.62, 0.22, 0 )
				self.Flsh:setAlpha( 0 )
				self.clipFinished( Flsh, {} )
			end,
			TextandImageBGB = function ()
				self:setupElementClipCounter( 20 )
				local PanelFrame2 = function ( Panel, event )
					local PanelFrame3 = function ( Panel, event )
						local PanelFrame4 = function ( Panel, event )
							if not event.interrupted then
								Panel:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
							end
							Panel:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Panel, event )
							else
								Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PanelFrame4( Panel, event )
							return 
						else
							Panel:beginAnimation( "keyframe", 2850, false, false, CoD.TweenType.Linear )
							Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame4 )
						end
					end
					
					if event.interrupted then
						PanelFrame3( Panel, event )
						return 
					else
						Panel:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						Panel:setAlpha( 1 )
						Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame3 )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				basicImageBacking:completeAnimation()
				self.basicImageBacking:setAlpha( 0 )
				self.clipFinished( basicImageBacking, {} )
				basicImage:completeAnimation()
				self.basicImage:setAlpha( 0 )
				self.clipFinished( basicImage, {} )
				local bgbGlowOrangeOverFrame2 = function ( bgbGlowOrangeOver, event )
					local bgbGlowOrangeOverFrame3 = function ( bgbGlowOrangeOver, event )
						local bgbGlowOrangeOverFrame4 = function ( bgbGlowOrangeOver, event )
							local bgbGlowOrangeOverFrame5 = function ( bgbGlowOrangeOver, event )
								local bgbGlowOrangeOverFrame6 = function ( bgbGlowOrangeOver, event )
									local bgbGlowOrangeOverFrame7 = function ( bgbGlowOrangeOver, event )
										local bgbGlowOrangeOverFrame8 = function ( bgbGlowOrangeOver, event )
											local bgbGlowOrangeOverFrame9 = function ( bgbGlowOrangeOver, event )
												local bgbGlowOrangeOverFrame10 = function ( bgbGlowOrangeOver, event )
													local bgbGlowOrangeOverFrame11 = function ( bgbGlowOrangeOver, event )
														local bgbGlowOrangeOverFrame12 = function ( bgbGlowOrangeOver, event )
															local bgbGlowOrangeOverFrame13 = function ( bgbGlowOrangeOver, event )
																local bgbGlowOrangeOverFrame14 = function ( bgbGlowOrangeOver, event )
																	if not event.interrupted then
																		bgbGlowOrangeOver:beginAnimation( "keyframe", 720, true, false, CoD.TweenType.Bounce )
																	end
																	bgbGlowOrangeOver:setAlpha( 0 )
																	if event.interrupted then
																		self.clipFinished( bgbGlowOrangeOver, event )
																	else
																		bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	bgbGlowOrangeOverFrame14( bgbGlowOrangeOver, event )
																	return 
																else
																	bgbGlowOrangeOver:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																	bgbGlowOrangeOver:setAlpha( 0.75 )
																	bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame14 )
																end
															end
															
															if event.interrupted then
																bgbGlowOrangeOverFrame13( bgbGlowOrangeOver, event )
																return 
															else
																bgbGlowOrangeOver:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																bgbGlowOrangeOver:setAlpha( 1 )
																bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame13 )
															end
														end
														
														if event.interrupted then
															bgbGlowOrangeOverFrame12( bgbGlowOrangeOver, event )
															return 
														else
															bgbGlowOrangeOver:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
															bgbGlowOrangeOver:setAlpha( 0.8 )
															bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame12 )
														end
													end
													
													if event.interrupted then
														bgbGlowOrangeOverFrame11( bgbGlowOrangeOver, event )
														return 
													else
														bgbGlowOrangeOver:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														bgbGlowOrangeOver:setAlpha( 0.36 )
														bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame11 )
													end
												end
												
												if event.interrupted then
													bgbGlowOrangeOverFrame10( bgbGlowOrangeOver, event )
													return 
												else
													bgbGlowOrangeOver:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
													bgbGlowOrangeOver:setAlpha( 0.8 )
													bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame10 )
												end
											end
											
											if event.interrupted then
												bgbGlowOrangeOverFrame9( bgbGlowOrangeOver, event )
												return 
											else
												bgbGlowOrangeOver:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
												bgbGlowOrangeOver:setAlpha( 0.36 )
												bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame9 )
											end
										end
										
										if event.interrupted then
											bgbGlowOrangeOverFrame8( bgbGlowOrangeOver, event )
											return 
										else
											bgbGlowOrangeOver:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
											bgbGlowOrangeOver:setAlpha( 0.8 )
											bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame8 )
										end
									end
									
									if event.interrupted then
										bgbGlowOrangeOverFrame7( bgbGlowOrangeOver, event )
										return 
									else
										bgbGlowOrangeOver:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										bgbGlowOrangeOver:setAlpha( 0.33 )
										bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame7 )
									end
								end
								
								if event.interrupted then
									bgbGlowOrangeOverFrame6( bgbGlowOrangeOver, event )
									return 
								else
									bgbGlowOrangeOver:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									bgbGlowOrangeOver:setAlpha( 0.75 )
									bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								bgbGlowOrangeOverFrame5( bgbGlowOrangeOver, event )
								return 
							else
								bgbGlowOrangeOver:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								bgbGlowOrangeOver:setAlpha( 1 )
								bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							bgbGlowOrangeOverFrame4( bgbGlowOrangeOver, event )
							return 
						else
							bgbGlowOrangeOver:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Bounce )
							bgbGlowOrangeOver:setAlpha( 0.75 )
							bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						bgbGlowOrangeOverFrame3( bgbGlowOrangeOver, event )
						return 
					else
						bgbGlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame3 )
					end
				end
				
				bgbGlowOrangeOver:completeAnimation()
				self.bgbGlowOrangeOver:setAlpha( 0 )
				bgbGlowOrangeOverFrame2( bgbGlowOrangeOver, {} )
				local bgbTextureFrame2 = function ( bgbTexture, event )
					local bgbTextureFrame3 = function ( bgbTexture, event )
						local bgbTextureFrame4 = function ( bgbTexture, event )
							local bgbTextureFrame5 = function ( bgbTexture, event )
								local bgbTextureFrame6 = function ( bgbTexture, event )
									local bgbTextureFrame7 = function ( bgbTexture, event )
										local bgbTextureFrame8 = function ( bgbTexture, event )
											local bgbTextureFrame9 = function ( bgbTexture, event )
												if not event.interrupted then
													bgbTexture:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												end
												bgbTexture:setAlpha( 0 )
												bgbTexture:setScale( 0.5 )
												if event.interrupted then
													self.clipFinished( bgbTexture, event )
												else
													bgbTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												bgbTextureFrame9( bgbTexture, event )
												return 
											else
												bgbTexture:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
												bgbTexture:setAlpha( 0 )
												bgbTexture:setScale( 0.57 )
												bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame9 )
											end
										end
										
										if event.interrupted then
											bgbTextureFrame8( bgbTexture, event )
											return 
										else
											bgbTexture:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											bgbTexture:setAlpha( 0.77 )
											bgbTexture:setScale( 1.2 )
											bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame8 )
										end
									end
									
									if event.interrupted then
										bgbTextureFrame7( bgbTexture, event )
										return 
									else
										bgbTexture:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										bgbTexture:setScale( 0.82 )
										bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame7 )
									end
								end
								
								if event.interrupted then
									bgbTextureFrame6( bgbTexture, event )
									return 
								else
									bgbTexture:beginAnimation( "keyframe", 3170, false, false, CoD.TweenType.Linear )
									bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame6 )
								end
							end
							
							if event.interrupted then
								bgbTextureFrame5( bgbTexture, event )
								return 
							else
								bgbTexture:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								bgbTexture:setScale( 0.7 )
								bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame5 )
							end
						end
						
						if event.interrupted then
							bgbTextureFrame4( bgbTexture, event )
							return 
						else
							bgbTexture:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							bgbTexture:setAlpha( 1 )
							bgbTexture:setScale( 1.2 )
							bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame4 )
						end
					end
					
					if event.interrupted then
						bgbTextureFrame3( bgbTexture, event )
						return 
					else
						bgbTexture:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame3 )
					end
				end
				
				bgbTexture:completeAnimation()
				self.bgbTexture:setAlpha( 0 )
				self.bgbTexture:setScale( 0.5 )
				bgbTextureFrame2( bgbTexture, {} )
				local bgbAbilitySwirlFrame2 = function ( bgbAbilitySwirl, event )
					local bgbAbilitySwirlFrame3 = function ( bgbAbilitySwirl, event )
						if not event.interrupted then
							bgbAbilitySwirl:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						bgbAbilitySwirl:setAlpha( 0 )
						bgbAbilitySwirl:setZRot( 360 )
						bgbAbilitySwirl:setScale( 1.7 )
						if event.interrupted then
							self.clipFinished( bgbAbilitySwirl, event )
						else
							bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bgbAbilitySwirlFrame3( bgbAbilitySwirl, event )
						return 
					else
						bgbAbilitySwirl:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						bgbAbilitySwirl:setAlpha( 0.8 )
						bgbAbilitySwirl:setZRot( 240 )
						bgbAbilitySwirl:setScale( 1.7 )
						bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", bgbAbilitySwirlFrame3 )
					end
				end
				
				bgbAbilitySwirl:completeAnimation()
				self.bgbAbilitySwirl:setAlpha( 0 )
				self.bgbAbilitySwirl:setZRot( 0 )
				self.bgbAbilitySwirl:setScale( 1 )
				bgbAbilitySwirlFrame2( bgbAbilitySwirl, {} )
				local ZmNotif1CursorHint0Frame2 = function ( ZmNotif1CursorHint0, event )
					local ZmNotif1CursorHint0Frame3 = function ( ZmNotif1CursorHint0, event )
						local ZmNotif1CursorHint0Frame4 = function ( ZmNotif1CursorHint0, event )
							local ZmNotif1CursorHint0Frame5 = function ( ZmNotif1CursorHint0, event )
								if not event.interrupted then
									ZmNotif1CursorHint0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
								end
								ZmNotif1CursorHint0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmNotif1CursorHint0, event )
								else
									ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmNotif1CursorHint0Frame5( ZmNotif1CursorHint0, event )
								return 
							else
								ZmNotif1CursorHint0:beginAnimation( "keyframe", 2849, false, false, CoD.TweenType.Linear )
								ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmNotif1CursorHint0Frame4( ZmNotif1CursorHint0, event )
							return 
						else
							ZmNotif1CursorHint0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
							ZmNotif1CursorHint0:setAlpha( 1 )
							ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmNotif1CursorHint0Frame3( ZmNotif1CursorHint0, event )
						return 
					else
						ZmNotif1CursorHint0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame3 )
					end
				end
				
				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 0 )
				ZmNotif1CursorHint0Frame2( ZmNotif1CursorHint0, {} )
				local ZmNotifFactoryFrame2 = function ( ZmNotifFactory, event )
					local ZmNotifFactoryFrame3 = function ( ZmNotifFactory, event )
						local ZmNotifFactoryFrame4 = function ( ZmNotifFactory, event )
							if not event.interrupted then
								ZmNotifFactory:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Bounce )
							end
							ZmNotifFactory:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmNotifFactory, event )
							else
								ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmNotifFactoryFrame4( ZmNotifFactory, event )
							return 
						else
							ZmNotifFactory:beginAnimation( "keyframe", 3240, false, false, CoD.TweenType.Linear )
							ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", ZmNotifFactoryFrame4 )
						end
					end
					
					if event.interrupted then
						ZmNotifFactoryFrame3( ZmNotifFactory, event )
						return 
					else
						ZmNotifFactory:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						ZmNotifFactory:setAlpha( 1 )
						ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", ZmNotifFactoryFrame3 )
					end
				end
				
				ZmNotifFactory:completeAnimation()
				self.ZmNotifFactory:setAlpha( 0 )
				ZmNotifFactoryFrame2( ZmNotifFactory, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							end
							Glow:setRGB( 0, 0.04, 1 )
							Glow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 3359, false, false, CoD.TweenType.Linear )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0, 0.04, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				local FlshFrame2 = function ( Flsh, event )
					local FlshFrame3 = function ( Flsh, event )
						if not event.interrupted then
							Flsh:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Bounce )
						end
						Flsh:setLeftRight( false, false, -219.65, 219.34 )
						Flsh:setTopBottom( true, false, 146.25, 180.75 )
						Flsh:setRGB( 0, 0.34, 1 )
						Flsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Flsh, event )
						else
							Flsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FlshFrame3( Flsh, event )
						return 
					else
						Flsh:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Flsh:setRGB( 0, 0.89, 1 )
						Flsh:setAlpha( 1 )
						Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame3 )
					end
				end
				
				Flsh:completeAnimation()
				self.Flsh:setLeftRight( false, false, -219.65, 219.34 )
				self.Flsh:setTopBottom( true, false, 146.25, 180.75 )
				self.Flsh:setRGB( 0, 0.33, 1 )
				self.Flsh:setAlpha( 0.36 )
				FlshFrame2( Flsh, {} )
				local ZmAmmoParticleFX1leftFrame2 = function ( ZmAmmoParticleFX1left, event )
					local ZmAmmoParticleFX1leftFrame3 = function ( ZmAmmoParticleFX1left, event )
						local ZmAmmoParticleFX1leftFrame4 = function ( ZmAmmoParticleFX1left, event )
							if not event.interrupted then
								ZmAmmoParticleFX1left:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX1left:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX1left, event )
							else
								ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX1leftFrame4( ZmAmmoParticleFX1left, event )
							return 
						else
							ZmAmmoParticleFX1left:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1leftFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX1leftFrame3( ZmAmmoParticleFX1left, event )
						return 
					else
						ZmAmmoParticleFX1left:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX1left:setAlpha( 1 )
						ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX1left:completeAnimation()
				self.ZmAmmoParticleFX1left:setAlpha( 0 )
				ZmAmmoParticleFX1leftFrame2( ZmAmmoParticleFX1left, {} )
				local ZmAmmoParticleFX2leftFrame2 = function ( ZmAmmoParticleFX2left, event )
					local ZmAmmoParticleFX2leftFrame3 = function ( ZmAmmoParticleFX2left, event )
						local ZmAmmoParticleFX2leftFrame4 = function ( ZmAmmoParticleFX2left, event )
							if not event.interrupted then
								ZmAmmoParticleFX2left:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX2left:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX2left, event )
							else
								ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX2leftFrame4( ZmAmmoParticleFX2left, event )
							return 
						else
							ZmAmmoParticleFX2left:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2leftFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX2leftFrame3( ZmAmmoParticleFX2left, event )
						return 
					else
						ZmAmmoParticleFX2left:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX2left:setAlpha( 1 )
						ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX2left:completeAnimation()
				self.ZmAmmoParticleFX2left:setAlpha( 0 )
				ZmAmmoParticleFX2leftFrame2( ZmAmmoParticleFX2left, {} )
				local ZmAmmoParticleFX3leftFrame2 = function ( ZmAmmoParticleFX3left, event )
					local ZmAmmoParticleFX3leftFrame3 = function ( ZmAmmoParticleFX3left, event )
						local ZmAmmoParticleFX3leftFrame4 = function ( ZmAmmoParticleFX3left, event )
							if not event.interrupted then
								ZmAmmoParticleFX3left:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX3left:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX3left, event )
							else
								ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX3leftFrame4( ZmAmmoParticleFX3left, event )
							return 
						else
							ZmAmmoParticleFX3left:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3leftFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX3leftFrame3( ZmAmmoParticleFX3left, event )
						return 
					else
						ZmAmmoParticleFX3left:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX3left:setAlpha( 1 )
						ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX3left:completeAnimation()
				self.ZmAmmoParticleFX3left:setAlpha( 0 )
				ZmAmmoParticleFX3leftFrame2( ZmAmmoParticleFX3left, {} )
				local ZmAmmoParticleFX1rightFrame2 = function ( ZmAmmoParticleFX1right, event )
					local ZmAmmoParticleFX1rightFrame3 = function ( ZmAmmoParticleFX1right, event )
						local ZmAmmoParticleFX1rightFrame4 = function ( ZmAmmoParticleFX1right, event )
							if not event.interrupted then
								ZmAmmoParticleFX1right:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX1right:setLeftRight( true, false, 204.52, 348 )
							ZmAmmoParticleFX1right:setTopBottom( true, false, 129, 203.6 )
							ZmAmmoParticleFX1right:setAlpha( 0 )
							ZmAmmoParticleFX1right:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX1right, event )
							else
								ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX1rightFrame4( ZmAmmoParticleFX1right, event )
							return 
						else
							ZmAmmoParticleFX1right:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1rightFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX1rightFrame3( ZmAmmoParticleFX1right, event )
						return 
					else
						ZmAmmoParticleFX1right:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX1right:setAlpha( 1 )
						ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX1right:completeAnimation()
				self.ZmAmmoParticleFX1right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX1right:setTopBottom( true, false, 129, 203.6 )
				self.ZmAmmoParticleFX1right:setAlpha( 0 )
				self.ZmAmmoParticleFX1right:setZRot( 180 )
				ZmAmmoParticleFX1rightFrame2( ZmAmmoParticleFX1right, {} )
				local ZmAmmoParticleFX2rightFrame2 = function ( ZmAmmoParticleFX2right, event )
					local ZmAmmoParticleFX2rightFrame3 = function ( ZmAmmoParticleFX2right, event )
						local ZmAmmoParticleFX2rightFrame4 = function ( ZmAmmoParticleFX2right, event )
							if not event.interrupted then
								ZmAmmoParticleFX2right:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX2right:setLeftRight( true, false, 204.52, 348 )
							ZmAmmoParticleFX2right:setTopBottom( true, false, 126.6, 201.21 )
							ZmAmmoParticleFX2right:setAlpha( 0 )
							ZmAmmoParticleFX2right:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX2right, event )
							else
								ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX2rightFrame4( ZmAmmoParticleFX2right, event )
							return 
						else
							ZmAmmoParticleFX2right:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2rightFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX2rightFrame3( ZmAmmoParticleFX2right, event )
						return 
					else
						ZmAmmoParticleFX2right:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX2right:setAlpha( 1 )
						ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX2right:completeAnimation()
				self.ZmAmmoParticleFX2right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX2right:setTopBottom( true, false, 126.6, 201.21 )
				self.ZmAmmoParticleFX2right:setAlpha( 0 )
				self.ZmAmmoParticleFX2right:setZRot( 180 )
				ZmAmmoParticleFX2rightFrame2( ZmAmmoParticleFX2right, {} )
				local ZmAmmoParticleFX3rightFrame2 = function ( ZmAmmoParticleFX3right, event )
					local ZmAmmoParticleFX3rightFrame3 = function ( ZmAmmoParticleFX3right, event )
						local ZmAmmoParticleFX3rightFrame4 = function ( ZmAmmoParticleFX3right, event )
							if not event.interrupted then
								ZmAmmoParticleFX3right:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX3right:setLeftRight( true, false, 204.52, 348 )
							ZmAmmoParticleFX3right:setTopBottom( true, false, 127.6, 202.21 )
							ZmAmmoParticleFX3right:setAlpha( 0 )
							ZmAmmoParticleFX3right:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX3right, event )
							else
								ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX3rightFrame4( ZmAmmoParticleFX3right, event )
							return 
						else
							ZmAmmoParticleFX3right:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX3right:setAlpha( 0 )
							ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3rightFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX3rightFrame3( ZmAmmoParticleFX3right, event )
						return 
					else
						ZmAmmoParticleFX3right:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX3right:completeAnimation()
				self.ZmAmmoParticleFX3right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX3right:setTopBottom( true, false, 127.6, 202.21 )
				self.ZmAmmoParticleFX3right:setAlpha( 1 )
				self.ZmAmmoParticleFX3right:setZRot( 180 )
				ZmAmmoParticleFX3rightFrame2( ZmAmmoParticleFX3right, {} )
				local LightningFrame2 = function ( Lightning, event )
					local LightningFrame3 = function ( Lightning, event )
						local LightningFrame4 = function ( Lightning, event )
							local LightningFrame5 = function ( Lightning, event )
								if not event.interrupted then
									Lightning:beginAnimation( "keyframe", 679, false, false, CoD.TweenType.Linear )
								end
								Lightning:setLeftRight( true, false, 38.67, 280 )
								Lightning:setTopBottom( true, false, -22.5, 193.5 )
								Lightning:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Lightning, event )
								else
									Lightning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LightningFrame5( Lightning, event )
								return 
							else
								Lightning:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame5 )
							end
						end
						
						if event.interrupted then
							LightningFrame4( Lightning, event )
							return 
						else
							Lightning:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							Lightning:setAlpha( 1 )
							Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame4 )
						end
					end
					
					if event.interrupted then
						LightningFrame3( Lightning, event )
						return 
					else
						Lightning:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame3 )
					end
				end
				
				Lightning:completeAnimation()
				self.Lightning:setLeftRight( true, false, 38.67, 280 )
				self.Lightning:setTopBottom( true, false, -22.5, 193.5 )
				self.Lightning:setAlpha( 0 )
				LightningFrame2( Lightning, {} )
				Lightning2:completeAnimation()
				self.Lightning2:setAlpha( 0 )
				self.clipFinished( Lightning2, {} )
				Lightning3:completeAnimation()
				self.Lightning3:setAlpha( 0 )
				self.clipFinished( Lightning3, {} )
			end,
			TextandImageBGBToken = function ()
				self:setupElementClipCounter( 20 )
				local PanelFrame2 = function ( Panel, event )
					local PanelFrame3 = function ( Panel, event )
						local PanelFrame4 = function ( Panel, event )
							if not event.interrupted then
								Panel:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
							end
							Panel:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Panel, event )
							else
								Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							PanelFrame4( Panel, event )
							return 
						else
							Panel:beginAnimation( "keyframe", 2850, false, false, CoD.TweenType.Linear )
							Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame4 )
						end
					end
					
					if event.interrupted then
						PanelFrame3( Panel, event )
						return 
					else
						Panel:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						Panel:setAlpha( 1 )
						Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame3 )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				basicImageBacking:completeAnimation()
				self.basicImageBacking:setAlpha( 0 )
				self.clipFinished( basicImageBacking, {} )
				basicImage:completeAnimation()
				self.basicImage:setAlpha( 0 )
				self.clipFinished( basicImage, {} )
				local bgbGlowOrangeOverFrame2 = function ( bgbGlowOrangeOver, event )
					local bgbGlowOrangeOverFrame3 = function ( bgbGlowOrangeOver, event )
						local bgbGlowOrangeOverFrame4 = function ( bgbGlowOrangeOver, event )
							local bgbGlowOrangeOverFrame5 = function ( bgbGlowOrangeOver, event )
								local bgbGlowOrangeOverFrame6 = function ( bgbGlowOrangeOver, event )
									local bgbGlowOrangeOverFrame7 = function ( bgbGlowOrangeOver, event )
										local bgbGlowOrangeOverFrame8 = function ( bgbGlowOrangeOver, event )
											local bgbGlowOrangeOverFrame9 = function ( bgbGlowOrangeOver, event )
												local bgbGlowOrangeOverFrame10 = function ( bgbGlowOrangeOver, event )
													local bgbGlowOrangeOverFrame11 = function ( bgbGlowOrangeOver, event )
														local bgbGlowOrangeOverFrame12 = function ( bgbGlowOrangeOver, event )
															local bgbGlowOrangeOverFrame13 = function ( bgbGlowOrangeOver, event )
																local bgbGlowOrangeOverFrame14 = function ( bgbGlowOrangeOver, event )
																	if not event.interrupted then
																		bgbGlowOrangeOver:beginAnimation( "keyframe", 720, true, false, CoD.TweenType.Bounce )
																	end
																	bgbGlowOrangeOver:setAlpha( 0 )
																	if event.interrupted then
																		self.clipFinished( bgbGlowOrangeOver, event )
																	else
																		bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	bgbGlowOrangeOverFrame14( bgbGlowOrangeOver, event )
																	return 
																else
																	bgbGlowOrangeOver:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																	bgbGlowOrangeOver:setAlpha( 0.75 )
																	bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame14 )
																end
															end
															
															if event.interrupted then
																bgbGlowOrangeOverFrame13( bgbGlowOrangeOver, event )
																return 
															else
																bgbGlowOrangeOver:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																bgbGlowOrangeOver:setAlpha( 1 )
																bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame13 )
															end
														end
														
														if event.interrupted then
															bgbGlowOrangeOverFrame12( bgbGlowOrangeOver, event )
															return 
														else
															bgbGlowOrangeOver:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
															bgbGlowOrangeOver:setAlpha( 0.8 )
															bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame12 )
														end
													end
													
													if event.interrupted then
														bgbGlowOrangeOverFrame11( bgbGlowOrangeOver, event )
														return 
													else
														bgbGlowOrangeOver:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														bgbGlowOrangeOver:setAlpha( 0.36 )
														bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame11 )
													end
												end
												
												if event.interrupted then
													bgbGlowOrangeOverFrame10( bgbGlowOrangeOver, event )
													return 
												else
													bgbGlowOrangeOver:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
													bgbGlowOrangeOver:setAlpha( 0.8 )
													bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame10 )
												end
											end
											
											if event.interrupted then
												bgbGlowOrangeOverFrame9( bgbGlowOrangeOver, event )
												return 
											else
												bgbGlowOrangeOver:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
												bgbGlowOrangeOver:setAlpha( 0.36 )
												bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame9 )
											end
										end
										
										if event.interrupted then
											bgbGlowOrangeOverFrame8( bgbGlowOrangeOver, event )
											return 
										else
											bgbGlowOrangeOver:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
											bgbGlowOrangeOver:setAlpha( 0.8 )
											bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame8 )
										end
									end
									
									if event.interrupted then
										bgbGlowOrangeOverFrame7( bgbGlowOrangeOver, event )
										return 
									else
										bgbGlowOrangeOver:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										bgbGlowOrangeOver:setAlpha( 0.33 )
										bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame7 )
									end
								end
								
								if event.interrupted then
									bgbGlowOrangeOverFrame6( bgbGlowOrangeOver, event )
									return 
								else
									bgbGlowOrangeOver:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									bgbGlowOrangeOver:setAlpha( 0.75 )
									bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								bgbGlowOrangeOverFrame5( bgbGlowOrangeOver, event )
								return 
							else
								bgbGlowOrangeOver:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								bgbGlowOrangeOver:setAlpha( 1 )
								bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							bgbGlowOrangeOverFrame4( bgbGlowOrangeOver, event )
							return 
						else
							bgbGlowOrangeOver:beginAnimation( "keyframe", 159, true, false, CoD.TweenType.Bounce )
							bgbGlowOrangeOver:setAlpha( 0.75 )
							bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						bgbGlowOrangeOverFrame3( bgbGlowOrangeOver, event )
						return 
					else
						bgbGlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bgbGlowOrangeOver:registerEventHandler( "transition_complete_keyframe", bgbGlowOrangeOverFrame3 )
					end
				end
				
				bgbGlowOrangeOver:completeAnimation()
				self.bgbGlowOrangeOver:setAlpha( 0 )
				bgbGlowOrangeOverFrame2( bgbGlowOrangeOver, {} )
				local bgbTextureFrame2 = function ( bgbTexture, event )
					local bgbTextureFrame3 = function ( bgbTexture, event )
						local bgbTextureFrame4 = function ( bgbTexture, event )
							local bgbTextureFrame5 = function ( bgbTexture, event )
								local bgbTextureFrame6 = function ( bgbTexture, event )
									local bgbTextureFrame7 = function ( bgbTexture, event )
										local bgbTextureFrame8 = function ( bgbTexture, event )
											local bgbTextureFrame9 = function ( bgbTexture, event )
												if not event.interrupted then
													bgbTexture:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												end
												bgbTexture:setAlpha( 0 )
												bgbTexture:setScale( 0.5 )
												if event.interrupted then
													self.clipFinished( bgbTexture, event )
												else
													bgbTexture:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												bgbTextureFrame9( bgbTexture, event )
												return 
											else
												bgbTexture:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
												bgbTexture:setAlpha( 0 )
												bgbTexture:setScale( 0.57 )
												bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame9 )
											end
										end
										
										if event.interrupted then
											bgbTextureFrame8( bgbTexture, event )
											return 
										else
											bgbTexture:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											bgbTexture:setAlpha( 0.77 )
											bgbTexture:setScale( 1.2 )
											bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame8 )
										end
									end
									
									if event.interrupted then
										bgbTextureFrame7( bgbTexture, event )
										return 
									else
										bgbTexture:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										bgbTexture:setScale( 0.82 )
										bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame7 )
									end
								end
								
								if event.interrupted then
									bgbTextureFrame6( bgbTexture, event )
									return 
								else
									bgbTexture:beginAnimation( "keyframe", 3170, false, false, CoD.TweenType.Linear )
									bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame6 )
								end
							end
							
							if event.interrupted then
								bgbTextureFrame5( bgbTexture, event )
								return 
							else
								bgbTexture:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								bgbTexture:setScale( 0.7 )
								bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame5 )
							end
						end
						
						if event.interrupted then
							bgbTextureFrame4( bgbTexture, event )
							return 
						else
							bgbTexture:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							bgbTexture:setAlpha( 1 )
							bgbTexture:setScale( 1.2 )
							bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame4 )
						end
					end
					
					if event.interrupted then
						bgbTextureFrame3( bgbTexture, event )
						return 
					else
						bgbTexture:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						bgbTexture:registerEventHandler( "transition_complete_keyframe", bgbTextureFrame3 )
					end
				end
				
				bgbTexture:completeAnimation()
				self.bgbTexture:setAlpha( 0 )
				self.bgbTexture:setScale( 0.5 )
				bgbTextureFrame2( bgbTexture, {} )
				local bgbAbilitySwirlFrame2 = function ( bgbAbilitySwirl, event )
					local bgbAbilitySwirlFrame3 = function ( bgbAbilitySwirl, event )
						if not event.interrupted then
							bgbAbilitySwirl:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						end
						bgbAbilitySwirl:setAlpha( 0 )
						bgbAbilitySwirl:setZRot( 360 )
						bgbAbilitySwirl:setScale( 1.7 )
						if event.interrupted then
							self.clipFinished( bgbAbilitySwirl, event )
						else
							bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bgbAbilitySwirlFrame3( bgbAbilitySwirl, event )
						return 
					else
						bgbAbilitySwirl:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						bgbAbilitySwirl:setAlpha( 0.8 )
						bgbAbilitySwirl:setZRot( 240 )
						bgbAbilitySwirl:setScale( 1.7 )
						bgbAbilitySwirl:registerEventHandler( "transition_complete_keyframe", bgbAbilitySwirlFrame3 )
					end
				end
				
				bgbAbilitySwirl:completeAnimation()
				self.bgbAbilitySwirl:setAlpha( 0 )
				self.bgbAbilitySwirl:setZRot( 0 )
				self.bgbAbilitySwirl:setScale( 1 )
				bgbAbilitySwirlFrame2( bgbAbilitySwirl, {} )
				local ZmNotif1CursorHint0Frame2 = function ( ZmNotif1CursorHint0, event )
					local ZmNotif1CursorHint0Frame3 = function ( ZmNotif1CursorHint0, event )
						local ZmNotif1CursorHint0Frame4 = function ( ZmNotif1CursorHint0, event )
							local ZmNotif1CursorHint0Frame5 = function ( ZmNotif1CursorHint0, event )
								if not event.interrupted then
									ZmNotif1CursorHint0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
								end
								ZmNotif1CursorHint0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmNotif1CursorHint0, event )
								else
									ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmNotif1CursorHint0Frame5( ZmNotif1CursorHint0, event )
								return 
							else
								ZmNotif1CursorHint0:beginAnimation( "keyframe", 2849, false, false, CoD.TweenType.Linear )
								ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmNotif1CursorHint0Frame4( ZmNotif1CursorHint0, event )
							return 
						else
							ZmNotif1CursorHint0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
							ZmNotif1CursorHint0:setAlpha( 1 )
							ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmNotif1CursorHint0Frame3( ZmNotif1CursorHint0, event )
						return 
					else
						ZmNotif1CursorHint0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame3 )
					end
				end
				
				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 0 )
				ZmNotif1CursorHint0Frame2( ZmNotif1CursorHint0, {} )
				local ZmNotifFactoryFrame2 = function ( ZmNotifFactory, event )
					local ZmNotifFactoryFrame3 = function ( ZmNotifFactory, event )
						local ZmNotifFactoryFrame4 = function ( ZmNotifFactory, event )
							if not event.interrupted then
								ZmNotifFactory:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Bounce )
							end
							ZmNotifFactory:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmNotifFactory, event )
							else
								ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmNotifFactoryFrame4( ZmNotifFactory, event )
							return 
						else
							ZmNotifFactory:beginAnimation( "keyframe", 3240, false, false, CoD.TweenType.Linear )
							ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", ZmNotifFactoryFrame4 )
						end
					end
					
					if event.interrupted then
						ZmNotifFactoryFrame3( ZmNotifFactory, event )
						return 
					else
						ZmNotifFactory:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						ZmNotifFactory:setAlpha( 1 )
						ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", ZmNotifFactoryFrame3 )
					end
				end
				
				ZmNotifFactory:completeAnimation()
				self.ZmNotifFactory:setAlpha( 0 )
				ZmNotifFactoryFrame2( ZmNotifFactory, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							if not event.interrupted then
								Glow:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							end
							Glow:setRGB( 0, 0.04, 1 )
							Glow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow, event )
							else
								Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 3359, false, false, CoD.TweenType.Linear )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0, 0.04, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				local FlshFrame2 = function ( Flsh, event )
					local FlshFrame3 = function ( Flsh, event )
						if not event.interrupted then
							Flsh:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Bounce )
						end
						Flsh:setLeftRight( false, false, -219.65, 219.34 )
						Flsh:setTopBottom( true, false, 146.25, 180.75 )
						Flsh:setRGB( 0, 0.33, 1 )
						Flsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Flsh, event )
						else
							Flsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FlshFrame3( Flsh, event )
						return 
					else
						Flsh:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Flsh:setRGB( 0, 0.92, 1 )
						Flsh:setAlpha( 1 )
						Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame3 )
					end
				end
				
				Flsh:completeAnimation()
				self.Flsh:setLeftRight( false, false, -219.65, 219.34 )
				self.Flsh:setTopBottom( true, false, 146.25, 180.75 )
				self.Flsh:setRGB( 0, 0.37, 1 )
				self.Flsh:setAlpha( 0.36 )
				FlshFrame2( Flsh, {} )
				local ZmAmmoParticleFX1leftFrame2 = function ( ZmAmmoParticleFX1left, event )
					local ZmAmmoParticleFX1leftFrame3 = function ( ZmAmmoParticleFX1left, event )
						local ZmAmmoParticleFX1leftFrame4 = function ( ZmAmmoParticleFX1left, event )
							if not event.interrupted then
								ZmAmmoParticleFX1left:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX1left:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX1left, event )
							else
								ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX1leftFrame4( ZmAmmoParticleFX1left, event )
							return 
						else
							ZmAmmoParticleFX1left:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1leftFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX1leftFrame3( ZmAmmoParticleFX1left, event )
						return 
					else
						ZmAmmoParticleFX1left:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX1left:setAlpha( 1 )
						ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX1left:completeAnimation()
				self.ZmAmmoParticleFX1left:setAlpha( 0 )
				ZmAmmoParticleFX1leftFrame2( ZmAmmoParticleFX1left, {} )
				local ZmAmmoParticleFX2leftFrame2 = function ( ZmAmmoParticleFX2left, event )
					local ZmAmmoParticleFX2leftFrame3 = function ( ZmAmmoParticleFX2left, event )
						local ZmAmmoParticleFX2leftFrame4 = function ( ZmAmmoParticleFX2left, event )
							if not event.interrupted then
								ZmAmmoParticleFX2left:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX2left:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX2left, event )
							else
								ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX2leftFrame4( ZmAmmoParticleFX2left, event )
							return 
						else
							ZmAmmoParticleFX2left:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2leftFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX2leftFrame3( ZmAmmoParticleFX2left, event )
						return 
					else
						ZmAmmoParticleFX2left:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX2left:setAlpha( 1 )
						ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX2left:completeAnimation()
				self.ZmAmmoParticleFX2left:setAlpha( 0 )
				ZmAmmoParticleFX2leftFrame2( ZmAmmoParticleFX2left, {} )
				local ZmAmmoParticleFX3leftFrame2 = function ( ZmAmmoParticleFX3left, event )
					local ZmAmmoParticleFX3leftFrame3 = function ( ZmAmmoParticleFX3left, event )
						local ZmAmmoParticleFX3leftFrame4 = function ( ZmAmmoParticleFX3left, event )
							if not event.interrupted then
								ZmAmmoParticleFX3left:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX3left:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX3left, event )
							else
								ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX3leftFrame4( ZmAmmoParticleFX3left, event )
							return 
						else
							ZmAmmoParticleFX3left:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3leftFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX3leftFrame3( ZmAmmoParticleFX3left, event )
						return 
					else
						ZmAmmoParticleFX3left:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX3left:setAlpha( 1 )
						ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX3left:completeAnimation()
				self.ZmAmmoParticleFX3left:setAlpha( 0 )
				ZmAmmoParticleFX3leftFrame2( ZmAmmoParticleFX3left, {} )
				local ZmAmmoParticleFX1rightFrame2 = function ( ZmAmmoParticleFX1right, event )
					local ZmAmmoParticleFX1rightFrame3 = function ( ZmAmmoParticleFX1right, event )
						local ZmAmmoParticleFX1rightFrame4 = function ( ZmAmmoParticleFX1right, event )
							if not event.interrupted then
								ZmAmmoParticleFX1right:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX1right:setLeftRight( true, false, 204.52, 348 )
							ZmAmmoParticleFX1right:setTopBottom( true, false, 129, 203.6 )
							ZmAmmoParticleFX1right:setAlpha( 0 )
							ZmAmmoParticleFX1right:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX1right, event )
							else
								ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX1rightFrame4( ZmAmmoParticleFX1right, event )
							return 
						else
							ZmAmmoParticleFX1right:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1rightFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX1rightFrame3( ZmAmmoParticleFX1right, event )
						return 
					else
						ZmAmmoParticleFX1right:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX1right:setAlpha( 1 )
						ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX1right:completeAnimation()
				self.ZmAmmoParticleFX1right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX1right:setTopBottom( true, false, 129, 203.6 )
				self.ZmAmmoParticleFX1right:setAlpha( 0 )
				self.ZmAmmoParticleFX1right:setZRot( 180 )
				ZmAmmoParticleFX1rightFrame2( ZmAmmoParticleFX1right, {} )
				local ZmAmmoParticleFX2rightFrame2 = function ( ZmAmmoParticleFX2right, event )
					local ZmAmmoParticleFX2rightFrame3 = function ( ZmAmmoParticleFX2right, event )
						local ZmAmmoParticleFX2rightFrame4 = function ( ZmAmmoParticleFX2right, event )
							if not event.interrupted then
								ZmAmmoParticleFX2right:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX2right:setLeftRight( true, false, 204.52, 348 )
							ZmAmmoParticleFX2right:setTopBottom( true, false, 126.6, 201.21 )
							ZmAmmoParticleFX2right:setAlpha( 0 )
							ZmAmmoParticleFX2right:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX2right, event )
							else
								ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX2rightFrame4( ZmAmmoParticleFX2right, event )
							return 
						else
							ZmAmmoParticleFX2right:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2rightFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX2rightFrame3( ZmAmmoParticleFX2right, event )
						return 
					else
						ZmAmmoParticleFX2right:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX2right:setAlpha( 1 )
						ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX2right:completeAnimation()
				self.ZmAmmoParticleFX2right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX2right:setTopBottom( true, false, 126.6, 201.21 )
				self.ZmAmmoParticleFX2right:setAlpha( 0 )
				self.ZmAmmoParticleFX2right:setZRot( 180 )
				ZmAmmoParticleFX2rightFrame2( ZmAmmoParticleFX2right, {} )
				local ZmAmmoParticleFX3rightFrame2 = function ( ZmAmmoParticleFX3right, event )
					local ZmAmmoParticleFX3rightFrame3 = function ( ZmAmmoParticleFX3right, event )
						local ZmAmmoParticleFX3rightFrame4 = function ( ZmAmmoParticleFX3right, event )
							if not event.interrupted then
								ZmAmmoParticleFX3right:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
							end
							ZmAmmoParticleFX3right:setLeftRight( true, false, 204.52, 348 )
							ZmAmmoParticleFX3right:setTopBottom( true, false, 127.6, 202.21 )
							ZmAmmoParticleFX3right:setAlpha( 0 )
							ZmAmmoParticleFX3right:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( ZmAmmoParticleFX3right, event )
							else
								ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmAmmoParticleFX3rightFrame4( ZmAmmoParticleFX3right, event )
							return 
						else
							ZmAmmoParticleFX3right:beginAnimation( "keyframe", 3720, false, false, CoD.TweenType.Linear )
							ZmAmmoParticleFX3right:setAlpha( 0 )
							ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3rightFrame4 )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX3rightFrame3( ZmAmmoParticleFX3right, event )
						return 
					else
						ZmAmmoParticleFX3right:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX3right:setAlpha( 1 )
						ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX3right:completeAnimation()
				self.ZmAmmoParticleFX3right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX3right:setTopBottom( true, false, 127.6, 202.21 )
				self.ZmAmmoParticleFX3right:setAlpha( 0 )
				self.ZmAmmoParticleFX3right:setZRot( 180 )
				ZmAmmoParticleFX3rightFrame2( ZmAmmoParticleFX3right, {} )
				local LightningFrame2 = function ( Lightning, event )
					local LightningFrame3 = function ( Lightning, event )
						local LightningFrame4 = function ( Lightning, event )
							if not event.interrupted then
								Lightning:beginAnimation( "keyframe", 679, false, false, CoD.TweenType.Linear )
							end
							Lightning:setLeftRight( true, false, 38.67, 280 )
							Lightning:setTopBottom( true, false, -22.5, 193.5 )
							Lightning:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Lightning, event )
							else
								Lightning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LightningFrame4( Lightning, event )
							return 
						else
							Lightning:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
							Lightning:setAlpha( 1 )
							Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame4 )
						end
					end
					
					if event.interrupted then
						LightningFrame3( Lightning, event )
						return 
					else
						Lightning:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame3 )
					end
				end
				
				Lightning:completeAnimation()
				self.Lightning:setLeftRight( true, false, 38.67, 280 )
				self.Lightning:setTopBottom( true, false, -22.5, 193.5 )
				self.Lightning:setAlpha( 0 )
				LightningFrame2( Lightning, {} )
				Lightning2:completeAnimation()
				self.Lightning2:setAlpha( 0 )
				self.clipFinished( Lightning2, {} )
				Lightning3:completeAnimation()
				self.Lightning3:setAlpha( 0 )
				self.clipFinished( Lightning3, {} )
			end,
			TextandImageBasic = function ()
				self:setupElementClipCounter( 20 )
				local PanelFrame2 = function ( Panel, event )
					local PanelFrame3 = function ( Panel, event )
						local PanelFrame4 = function ( Panel, event )
							local PanelFrame5 = function ( Panel, event )
								if not event.interrupted then
									Panel:beginAnimation( "keyframe", 679, false, false, CoD.TweenType.Linear )
								end
								Panel:setRGB( 0.25, 0.49, 0.83 )
								Panel:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Panel, event )
								else
									Panel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								PanelFrame5( Panel, event )
								return 
							else
								Panel:beginAnimation( "keyframe", 1850, false, false, CoD.TweenType.Linear )
								Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame5 )
							end
						end
						
						if event.interrupted then
							PanelFrame4( Panel, event )
							return 
						else
							Panel:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							Panel:setAlpha( 1 )
							Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame4 )
						end
					end
					
					if event.interrupted then
						PanelFrame3( Panel, event )
						return 
					else
						Panel:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						Panel:setAlpha( 0.8 )
						Panel:registerEventHandler( "transition_complete_keyframe", PanelFrame3 )
					end
				end
				
				Panel:completeAnimation()
				self.Panel:setRGB( 0.25, 0.49, 0.83 )
				self.Panel:setAlpha( 0 )
				PanelFrame2( Panel, {} )
				local basicImageBackingFrame2 = function ( basicImageBacking, event )
					local basicImageBackingFrame3 = function ( basicImageBacking, event )
						local basicImageBackingFrame4 = function ( basicImageBacking, event )
							local basicImageBackingFrame5 = function ( basicImageBacking, event )
								if not event.interrupted then
									basicImageBacking:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
								end
								basicImageBacking:setAlpha( 0 )
								basicImageBacking:setZRot( 10 )
								if event.interrupted then
									self.clipFinished( basicImageBacking, event )
								else
									basicImageBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								basicImageBackingFrame5( basicImageBacking, event )
								return 
							else
								basicImageBacking:beginAnimation( "keyframe", 1879, false, false, CoD.TweenType.Linear )
								basicImageBacking:setZRot( 5.7 )
								basicImageBacking:registerEventHandler( "transition_complete_keyframe", basicImageBackingFrame5 )
							end
						end
						
						if event.interrupted then
							basicImageBackingFrame4( basicImageBacking, event )
							return 
						else
							basicImageBacking:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							basicImageBacking:setAlpha( 1 )
							basicImageBacking:setZRot( -7.78 )
							basicImageBacking:registerEventHandler( "transition_complete_keyframe", basicImageBackingFrame4 )
						end
					end
					
					if event.interrupted then
						basicImageBackingFrame3( basicImageBacking, event )
						return 
					else
						basicImageBacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						basicImageBacking:registerEventHandler( "transition_complete_keyframe", basicImageBackingFrame3 )
					end
				end
				
				basicImageBacking:completeAnimation()
				self.basicImageBacking:setAlpha( 0 )
				self.basicImageBacking:setZRot( -10 )
				basicImageBackingFrame2( basicImageBacking, {} )
				local basicImageFrame2 = function ( basicImage, event )
					local basicImageFrame3 = function ( basicImage, event )
						local basicImageFrame4 = function ( basicImage, event )
							local basicImageFrame5 = function ( basicImage, event )
								if not event.interrupted then
									basicImage:beginAnimation( "keyframe", 679, false, false, CoD.TweenType.Linear )
								end
								basicImage:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( basicImage, event )
								else
									basicImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								basicImageFrame5( basicImage, event )
								return 
							else
								basicImage:beginAnimation( "keyframe", 1970, false, false, CoD.TweenType.Linear )
								basicImage:registerEventHandler( "transition_complete_keyframe", basicImageFrame5 )
							end
						end
						
						if event.interrupted then
							basicImageFrame4( basicImage, event )
							return 
						else
							basicImage:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
							basicImage:setAlpha( 1 )
							basicImage:registerEventHandler( "transition_complete_keyframe", basicImageFrame4 )
						end
					end
					
					if event.interrupted then
						basicImageFrame3( basicImage, event )
						return 
					else
						basicImage:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						basicImage:registerEventHandler( "transition_complete_keyframe", basicImageFrame3 )
					end
				end
				
				basicImage:completeAnimation()
				self.basicImage:setAlpha( 0 )
				basicImageFrame2( basicImage, {} )
				bgbGlowOrangeOver:completeAnimation()
				self.bgbGlowOrangeOver:setAlpha( 0 )
				self.clipFinished( bgbGlowOrangeOver, {} )
				bgbTexture:completeAnimation()
				self.bgbTexture:setAlpha( 0 )
				self.clipFinished( bgbTexture, {} )
				bgbAbilitySwirl:completeAnimation()
				self.bgbAbilitySwirl:setAlpha( 0 )
				self.bgbAbilitySwirl:setZRot( 0 )
				self.bgbAbilitySwirl:setScale( 1 )
				self.clipFinished( bgbAbilitySwirl, {} )
				local ZmNotif1CursorHint0Frame2 = function ( ZmNotif1CursorHint0, event )
					local ZmNotif1CursorHint0Frame3 = function ( ZmNotif1CursorHint0, event )
						local ZmNotif1CursorHint0Frame4 = function ( ZmNotif1CursorHint0, event )
							local ZmNotif1CursorHint0Frame5 = function ( ZmNotif1CursorHint0, event )
								if not event.interrupted then
									ZmNotif1CursorHint0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
								end
								ZmNotif1CursorHint0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmNotif1CursorHint0, event )
								else
									ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmNotif1CursorHint0Frame5( ZmNotif1CursorHint0, event )
								return 
							else
								ZmNotif1CursorHint0:beginAnimation( "keyframe", 1849, false, false, CoD.TweenType.Linear )
								ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmNotif1CursorHint0Frame4( ZmNotif1CursorHint0, event )
							return 
						else
							ZmNotif1CursorHint0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
							ZmNotif1CursorHint0:setAlpha( 1 )
							ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmNotif1CursorHint0Frame3( ZmNotif1CursorHint0, event )
						return 
					else
						ZmNotif1CursorHint0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						ZmNotif1CursorHint0:registerEventHandler( "transition_complete_keyframe", ZmNotif1CursorHint0Frame3 )
					end
				end
				
				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 0 )
				ZmNotif1CursorHint0Frame2( ZmNotif1CursorHint0, {} )
				local ZmNotifFactoryFrame2 = function ( ZmNotifFactory, event )
					local ZmNotifFactoryFrame3 = function ( ZmNotifFactory, event )
						local ZmNotifFactoryFrame4 = function ( ZmNotifFactory, event )
							if not event.interrupted then
								ZmNotifFactory:beginAnimation( "keyframe", 869, false, false, CoD.TweenType.Bounce )
							end
							ZmNotifFactory:setRGB( 1, 1, 1 )
							ZmNotifFactory:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmNotifFactory, event )
							else
								ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmNotifFactoryFrame4( ZmNotifFactory, event )
							return 
						else
							ZmNotifFactory:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
							ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", ZmNotifFactoryFrame4 )
						end
					end
					
					if event.interrupted then
						ZmNotifFactoryFrame3( ZmNotifFactory, event )
						return 
					else
						ZmNotifFactory:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
						ZmNotifFactory:setAlpha( 1 )
						ZmNotifFactory:registerEventHandler( "transition_complete_keyframe", ZmNotifFactoryFrame3 )
					end
				end
				
				ZmNotifFactory:completeAnimation()
				self.ZmNotifFactory:setRGB( 1, 1, 1 )
				self.ZmNotifFactory:setAlpha( 0 )
				ZmNotifFactoryFrame2( ZmNotifFactory, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								if not event.interrupted then
									Glow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
								end
								Glow:setRGB( 0, 0.42, 1 )
								Glow:setAlpha( 0 )
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
								Glow:beginAnimation( "keyframe", 2049, false, false, CoD.TweenType.Linear )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Bounce )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0, 0.42, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				self.clipFinished( ZmFxSpark20, {} )
				local FlshFrame2 = function ( Flsh, event )
					local FlshFrame3 = function ( Flsh, event )
						if not event.interrupted then
							Flsh:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Bounce )
						end
						Flsh:setLeftRight( false, false, -219.65, 219.34 )
						Flsh:setTopBottom( true, false, 146.25, 180.75 )
						Flsh:setRGB( 0, 0.56, 1 )
						Flsh:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Flsh, event )
						else
							Flsh:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FlshFrame3( Flsh, event )
						return 
					else
						Flsh:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Flsh:setRGB( 0, 0.86, 1 )
						Flsh:setAlpha( 1 )
						Flsh:registerEventHandler( "transition_complete_keyframe", FlshFrame3 )
					end
				end
				
				Flsh:completeAnimation()
				self.Flsh:setLeftRight( false, false, -219.65, 219.34 )
				self.Flsh:setTopBottom( true, false, 146.25, 180.75 )
				self.Flsh:setRGB( 0, 0.53, 1 )
				self.Flsh:setAlpha( 0.36 )
				FlshFrame2( Flsh, {} )
				local ZmAmmoParticleFX1leftFrame2 = function ( ZmAmmoParticleFX1left, event )
					local ZmAmmoParticleFX1leftFrame3 = function ( ZmAmmoParticleFX1left, event )
						if not event.interrupted then
							ZmAmmoParticleFX1left:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						end
						ZmAmmoParticleFX1left:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmAmmoParticleFX1left, event )
						else
							ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX1leftFrame3( ZmAmmoParticleFX1left, event )
						return 
					else
						ZmAmmoParticleFX1left:beginAnimation( "keyframe", 2930, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX1left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX1left:completeAnimation()
				self.ZmAmmoParticleFX1left:setAlpha( 1 )
				ZmAmmoParticleFX1leftFrame2( ZmAmmoParticleFX1left, {} )
				local ZmAmmoParticleFX2leftFrame2 = function ( ZmAmmoParticleFX2left, event )
					local ZmAmmoParticleFX2leftFrame3 = function ( ZmAmmoParticleFX2left, event )
						if not event.interrupted then
							ZmAmmoParticleFX2left:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						end
						ZmAmmoParticleFX2left:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmAmmoParticleFX2left, event )
						else
							ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX2leftFrame3( ZmAmmoParticleFX2left, event )
						return 
					else
						ZmAmmoParticleFX2left:beginAnimation( "keyframe", 2930, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX2left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX2left:completeAnimation()
				self.ZmAmmoParticleFX2left:setAlpha( 1 )
				ZmAmmoParticleFX2leftFrame2( ZmAmmoParticleFX2left, {} )
				local ZmAmmoParticleFX3leftFrame2 = function ( ZmAmmoParticleFX3left, event )
					local ZmAmmoParticleFX3leftFrame3 = function ( ZmAmmoParticleFX3left, event )
						if not event.interrupted then
							ZmAmmoParticleFX3left:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						end
						ZmAmmoParticleFX3left:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( ZmAmmoParticleFX3left, event )
						else
							ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX3leftFrame3( ZmAmmoParticleFX3left, event )
						return 
					else
						ZmAmmoParticleFX3left:beginAnimation( "keyframe", 2930, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX3left:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3leftFrame3 )
					end
				end
				
				ZmAmmoParticleFX3left:completeAnimation()
				self.ZmAmmoParticleFX3left:setAlpha( 1 )
				ZmAmmoParticleFX3leftFrame2( ZmAmmoParticleFX3left, {} )
				local ZmAmmoParticleFX1rightFrame2 = function ( ZmAmmoParticleFX1right, event )
					local ZmAmmoParticleFX1rightFrame3 = function ( ZmAmmoParticleFX1right, event )
						if not event.interrupted then
							ZmAmmoParticleFX1right:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						end
						ZmAmmoParticleFX1right:setLeftRight( true, false, 204.52, 348 )
						ZmAmmoParticleFX1right:setTopBottom( true, false, 129, 203.6 )
						ZmAmmoParticleFX1right:setAlpha( 0 )
						ZmAmmoParticleFX1right:setZRot( 180 )
						if event.interrupted then
							self.clipFinished( ZmAmmoParticleFX1right, event )
						else
							ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX1rightFrame3( ZmAmmoParticleFX1right, event )
						return 
					else
						ZmAmmoParticleFX1right:beginAnimation( "keyframe", 2930, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX1right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX1rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX1right:completeAnimation()
				self.ZmAmmoParticleFX1right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX1right:setTopBottom( true, false, 129, 203.6 )
				self.ZmAmmoParticleFX1right:setAlpha( 1 )
				self.ZmAmmoParticleFX1right:setZRot( 180 )
				ZmAmmoParticleFX1rightFrame2( ZmAmmoParticleFX1right, {} )
				local ZmAmmoParticleFX2rightFrame2 = function ( ZmAmmoParticleFX2right, event )
					local ZmAmmoParticleFX2rightFrame3 = function ( ZmAmmoParticleFX2right, event )
						if not event.interrupted then
							ZmAmmoParticleFX2right:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						end
						ZmAmmoParticleFX2right:setLeftRight( true, false, 204.52, 348 )
						ZmAmmoParticleFX2right:setTopBottom( true, false, 126.6, 201.21 )
						ZmAmmoParticleFX2right:setAlpha( 0 )
						ZmAmmoParticleFX2right:setZRot( 180 )
						if event.interrupted then
							self.clipFinished( ZmAmmoParticleFX2right, event )
						else
							ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX2rightFrame3( ZmAmmoParticleFX2right, event )
						return 
					else
						ZmAmmoParticleFX2right:beginAnimation( "keyframe", 2930, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX2right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX2rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX2right:completeAnimation()
				self.ZmAmmoParticleFX2right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX2right:setTopBottom( true, false, 126.6, 201.21 )
				self.ZmAmmoParticleFX2right:setAlpha( 1 )
				self.ZmAmmoParticleFX2right:setZRot( 180 )
				ZmAmmoParticleFX2rightFrame2( ZmAmmoParticleFX2right, {} )
				local ZmAmmoParticleFX3rightFrame2 = function ( ZmAmmoParticleFX3right, event )
					local ZmAmmoParticleFX3rightFrame3 = function ( ZmAmmoParticleFX3right, event )
						if not event.interrupted then
							ZmAmmoParticleFX3right:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						end
						ZmAmmoParticleFX3right:setLeftRight( true, false, 204.52, 348 )
						ZmAmmoParticleFX3right:setTopBottom( true, false, 127.6, 202.21 )
						ZmAmmoParticleFX3right:setAlpha( 0 )
						ZmAmmoParticleFX3right:setZRot( 180 )
						if event.interrupted then
							self.clipFinished( ZmAmmoParticleFX3right, event )
						else
							ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ZmAmmoParticleFX3rightFrame3( ZmAmmoParticleFX3right, event )
						return 
					else
						ZmAmmoParticleFX3right:beginAnimation( "keyframe", 2930, false, false, CoD.TweenType.Linear )
						ZmAmmoParticleFX3right:registerEventHandler( "transition_complete_keyframe", ZmAmmoParticleFX3rightFrame3 )
					end
				end
				
				ZmAmmoParticleFX3right:completeAnimation()
				self.ZmAmmoParticleFX3right:setLeftRight( true, false, 204.52, 348 )
				self.ZmAmmoParticleFX3right:setTopBottom( true, false, 127.6, 202.21 )
				self.ZmAmmoParticleFX3right:setAlpha( 0 )
				self.ZmAmmoParticleFX3right:setZRot( 180 )
				ZmAmmoParticleFX3rightFrame2( ZmAmmoParticleFX3right, {} )
				local LightningFrame2 = function ( Lightning, event )
					local LightningFrame3 = function ( Lightning, event )
						local LightningFrame4 = function ( Lightning, event )
							if not event.interrupted then
								Lightning:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
							end
							Lightning:setLeftRight( true, false, 110.67, 200.67 )
							Lightning:setTopBottom( true, false, 8.5, 176.5 )
							Lightning:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Lightning, event )
							else
								Lightning:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LightningFrame4( Lightning, event )
							return 
						else
							Lightning:beginAnimation( "keyframe", 2360, false, false, CoD.TweenType.Linear )
							Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame4 )
						end
					end
					
					if event.interrupted then
						LightningFrame3( Lightning, event )
						return 
					else
						Lightning:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Lightning:setAlpha( 1 )
						Lightning:registerEventHandler( "transition_complete_keyframe", LightningFrame3 )
					end
				end
				
				Lightning:completeAnimation()
				self.Lightning:setLeftRight( true, false, 110.67, 200.67 )
				self.Lightning:setTopBottom( true, false, 8.5, 176.5 )
				self.Lightning:setAlpha( 0 )
				LightningFrame2( Lightning, {} )
				local Lightning2Frame2 = function ( Lightning2, event )
					local Lightning2Frame3 = function ( Lightning2, event )
						local Lightning2Frame4 = function ( Lightning2, event )
							if not event.interrupted then
								Lightning2:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
							end
							Lightning2:setLeftRight( true, false, 35.74, 125.74 )
							Lightning2:setTopBottom( true, false, 62.25, 230.25 )
							Lightning2:setAlpha( 0 )
							Lightning2:setZRot( 40 )
							Lightning2:setScale( 0.7 )
							if event.interrupted then
								self.clipFinished( Lightning2, event )
							else
								Lightning2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Lightning2Frame4( Lightning2, event )
							return 
						else
							Lightning2:beginAnimation( "keyframe", 2360, false, false, CoD.TweenType.Linear )
							Lightning2:registerEventHandler( "transition_complete_keyframe", Lightning2Frame4 )
						end
					end
					
					if event.interrupted then
						Lightning2Frame3( Lightning2, event )
						return 
					else
						Lightning2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Lightning2:setAlpha( 1 )
						Lightning2:registerEventHandler( "transition_complete_keyframe", Lightning2Frame3 )
					end
				end
				
				Lightning2:completeAnimation()
				self.Lightning2:setLeftRight( true, false, 35.74, 125.74 )
				self.Lightning2:setTopBottom( true, false, 62.25, 230.25 )
				self.Lightning2:setAlpha( 0 )
				self.Lightning2:setZRot( 40 )
				self.Lightning2:setScale( 0.7 )
				Lightning2Frame2( Lightning2, {} )
				local Lightning3Frame2 = function ( Lightning3, event )
					local Lightning3Frame3 = function ( Lightning3, event )
						local Lightning3Frame4 = function ( Lightning3, event )
							if not event.interrupted then
								Lightning3:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
							end
							Lightning3:setLeftRight( true, false, 186, 276 )
							Lightning3:setTopBottom( true, false, 60.5, 228.5 )
							Lightning3:setAlpha( 0 )
							Lightning3:setZRot( -40 )
							Lightning3:setScale( 0.7 )
							if event.interrupted then
								self.clipFinished( Lightning3, event )
							else
								Lightning3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Lightning3Frame4( Lightning3, event )
							return 
						else
							Lightning3:beginAnimation( "keyframe", 2360, false, false, CoD.TweenType.Linear )
							Lightning3:registerEventHandler( "transition_complete_keyframe", Lightning3Frame4 )
						end
					end
					
					if event.interrupted then
						Lightning3Frame3( Lightning3, event )
						return 
					else
						Lightning3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						Lightning3:setAlpha( 1 )
						Lightning3:registerEventHandler( "transition_complete_keyframe", Lightning3Frame3 )
					end
				end
				
				Lightning3:completeAnimation()
				self.Lightning3:setLeftRight( true, false, 186, 276 )
				self.Lightning3:setTopBottom( true, false, 60.5, 228.5 )
				self.Lightning3:setAlpha( 0 )
				self.Lightning3:setZRot( -40 )
				self.Lightning3:setScale( 0.7 )
				Lightning3Frame2( Lightning3, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.ZmNotif1CursorHint0:close()
		element.ZmNotifFactory:close()
		element.ZmFxSpark20:close()
		element.ZmAmmoParticleFX1left:close()
		element.ZmAmmoParticleFX2left:close()
		element.ZmAmmoParticleFX3left:close()
		element.ZmAmmoParticleFX1right:close()
		element.ZmAmmoParticleFX2right:close()
		element.ZmAmmoParticleFX3right:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

