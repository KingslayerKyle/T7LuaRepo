require( "ui.uieditor.widgets.CallingCards.Loot3.CallingCards_loot_BO2_flash" )
require( "ui.uieditor.widgets.CallingCards.Loot3.CallingCards_loot_BO2_light" )

CoD.CallingCards_loot_BO2retro = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_BO2retro.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_loot_BO2retro )
	self.id = "CallingCards_loot_BO2retro"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 720 )
	bg:setTopBottom( 0, 0, 0, 180 )
	bg:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_bg" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bullets = LUI.UIImage.new()
	bullets:setLeftRight( 0, 0, 232, 500 )
	bullets:setTopBottom( 0, 0, 137, 213 )
	bullets:setZRot( 14 )
	bullets:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_bullets" ) )
	bullets:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	bullets:setShaderVector( 0, 0.5, 1, 0, 0 )
	bullets:setShaderVector( 1, 1.33, 0, 0, 0 )
	self:addElement( bullets )
	self.bullets = bullets
	
	local CallingCardslootBO2flash = CoD.CallingCards_loot_BO2_flash.new( menu, controller )
	CallingCardslootBO2flash:setLeftRight( 0, 0, 449, 531 )
	CallingCardslootBO2flash:setTopBottom( 0, 0, 114, 196 )
	self:addElement( CallingCardslootBO2flash )
	self.CallingCardslootBO2flash = CallingCardslootBO2flash
	
	local drone = LUI.UIImage.new()
	drone:setLeftRight( 0, 0, 0, 720 )
	drone:setTopBottom( 0, 0, 0, 180 )
	drone:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_droneflipbook" ) )
	drone:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	drone:setShaderVector( 0, 2, 0, 0, 0 )
	drone:setShaderVector( 1, 23, 0, 0, 0 )
	self:addElement( drone )
	self.drone = drone
	
	local CallingCardslootBO2light = CoD.CallingCards_loot_BO2_light.new( menu, controller )
	CallingCardslootBO2light:setLeftRight( 0, 0, 555, 614 )
	CallingCardslootBO2light:setTopBottom( 0, 0, 79, 106 )
	self:addElement( CallingCardslootBO2light )
	self.CallingCardslootBO2light = CallingCardslootBO2light
	
	local flame1 = LUI.UIImage.new()
	flame1:setLeftRight( 0, 0, 223, 319 )
	flame1:setTopBottom( 0, 0, 106, 202 )
	flame1:setScale( 1.6 )
	flame1:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_flame1" ) )
	self:addElement( flame1 )
	self.flame1 = flame1
	
	local flame2 = LUI.UIImage.new()
	flame2:setLeftRight( 0, 0, 248, 344 )
	flame2:setTopBottom( 0, 0, 49, 145 )
	flame2:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_flame2" ) )
	self:addElement( flame2 )
	self.flame2 = flame2
	
	local flame3 = LUI.UIImage.new()
	flame3:setLeftRight( 0, 0, 152, 248 )
	flame3:setTopBottom( 0, 0, 45, 141 )
	flame3:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_flame3" ) )
	self:addElement( flame3 )
	self.flame3 = flame3
	
	local flame4 = LUI.UIImage.new()
	flame4:setLeftRight( 0, 0, 164, 260 )
	flame4:setTopBottom( 0, 0, 109, 205 )
	flame4:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_flame4" ) )
	self:addElement( flame4 )
	self.flame4 = flame4
	
	local flame5 = LUI.UIImage.new()
	flame5:setLeftRight( 0, 0, 148, 196 )
	flame5:setTopBottom( 0, 0, 69, 117 )
	flame5:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_flame5" ) )
	self:addElement( flame5 )
	self.flame5 = flame5
	
	local flame6 = LUI.UIImage.new()
	flame6:setLeftRight( 0, 0, 224, 260 )
	flame6:setTopBottom( 0, 0, 51, 87 )
	flame6:setZRot( -12 )
	flame6:setImage( RegisterImage( "uie_t7_loot_callingcard_bo2retro_flame6" ) )
	self:addElement( flame6 )
	self.flame6 = flame6
	
	local Glow000 = LUI.UIImage.new()
	Glow000:setLeftRight( 0, 0, 50, 413 )
	Glow000:setTopBottom( 0, 0, 5, 433 )
	Glow000:setRGB( 1, 0.91, 0.43 )
	Glow000:setAlpha( 0.71 )
	Glow000:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow000 )
	self.Glow000 = Glow000
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( 0, 0, -196, 608 )
	Glow00:setTopBottom( 0, 0, 103, 349 )
	Glow00:setRGB( 1, 0.91, 0.43 )
	Glow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	self.resetProperties = function ()
		Glow00:completeAnimation()
		drone:completeAnimation()
		bullets:completeAnimation()
		CallingCardslootBO2flash:completeAnimation()
		CallingCardslootBO2light:completeAnimation()
		Glow000:completeAnimation()
		flame1:completeAnimation()
		flame4:completeAnimation()
		flame3:completeAnimation()
		flame2:completeAnimation()
		flame5:completeAnimation()
		flame6:completeAnimation()
		Glow00:setLeftRight( 0, 0, -196, 608 )
		Glow00:setTopBottom( 0, 0, 103, 349 )
		Glow00:setAlpha( 1 )
		drone:setLeftRight( 0, 0, 0, 720 )
		drone:setTopBottom( 0, 0, 0, 180 )
		bullets:setLeftRight( 0, 0, 232, 500 )
		bullets:setTopBottom( 0, 0, 137, 213 )
		CallingCardslootBO2flash:setLeftRight( 0, 0, 449, 531 )
		CallingCardslootBO2flash:setTopBottom( 0, 0, 114, 196 )
		CallingCardslootBO2light:setLeftRight( 0, 0, 555, 614 )
		CallingCardslootBO2light:setTopBottom( 0, 0, 79, 106 )
		Glow000:setAlpha( 0.71 )
		flame1:setLeftRight( 0, 0, 223, 319 )
		flame1:setTopBottom( 0, 0, 106, 202 )
		flame1:setAlpha( 1 )
		flame1:setScale( 1.6 )
		flame4:setLeftRight( 0, 0, 164, 260 )
		flame4:setTopBottom( 0, 0, 109, 205 )
		flame4:setAlpha( 1 )
		flame4:setScale( 1 )
		flame3:setLeftRight( 0, 0, 152, 248 )
		flame3:setTopBottom( 0, 0, 45, 141 )
		flame3:setAlpha( 1 )
		flame3:setScale( 1 )
		flame2:setLeftRight( 0, 0, 248, 344 )
		flame2:setTopBottom( 0, 0, 49, 145 )
		flame2:setAlpha( 1 )
		flame2:setScale( 1 )
		flame5:setLeftRight( 0, 0, 148, 196 )
		flame5:setTopBottom( 0, 0, 69, 117 )
		flame5:setAlpha( 1 )
		flame6:setLeftRight( 0, 0, 224, 260 )
		flame6:setTopBottom( 0, 0, 51, 87 )
		flame6:setAlpha( 1 )
		flame6:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				local bulletsFrame2 = function ( bullets, event )
					if not event.interrupted then
						bullets:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
					end
					bullets:setLeftRight( 0, 0, 269, 537 )
					bullets:setTopBottom( 0, 0, 130, 206 )
					if event.interrupted then
						self.clipFinished( bullets, event )
					else
						bullets:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bullets:completeAnimation()
				self.bullets:setLeftRight( 0, 0, 232, 500 )
				self.bullets:setTopBottom( 0, 0, 135, 211 )
				bulletsFrame2( bullets, {} )
				local CallingCardslootBO2flashFrame2 = function ( CallingCardslootBO2flash, event )
					local CallingCardslootBO2flashFrame3 = function ( CallingCardslootBO2flash, event )
						if not event.interrupted then
							CallingCardslootBO2flash:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						end
						CallingCardslootBO2flash:setLeftRight( 0, 0, 449, 531 )
						CallingCardslootBO2flash:setTopBottom( 0, 0, 114, 196 )
						if event.interrupted then
							self.clipFinished( CallingCardslootBO2flash, event )
						else
							CallingCardslootBO2flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CallingCardslootBO2flashFrame3( CallingCardslootBO2flash, event )
						return 
					else
						CallingCardslootBO2flash:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						CallingCardslootBO2flash:setLeftRight( 0, 0, 479, 561 )
						CallingCardslootBO2flash:setTopBottom( 0, 0, 113, 195 )
						CallingCardslootBO2flash:registerEventHandler( "transition_complete_keyframe", CallingCardslootBO2flashFrame3 )
					end
				end
				
				CallingCardslootBO2flash:completeAnimation()
				self.CallingCardslootBO2flash:setLeftRight( 0, 0, 449, 531 )
				self.CallingCardslootBO2flash:setTopBottom( 0, 0, 114, 196 )
				CallingCardslootBO2flashFrame2( CallingCardslootBO2flash, {} )
				local droneFrame2 = function ( drone, event )
					local droneFrame3 = function ( drone, event )
						if not event.interrupted then
							drone:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						end
						drone:setLeftRight( 0, 0, 0, 720 )
						drone:setTopBottom( 0, 0, 0, 180 )
						if event.interrupted then
							self.clipFinished( drone, event )
						else
							drone:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						droneFrame3( drone, event )
						return 
					else
						drone:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						drone:setLeftRight( 0, 0, 32, 752 )
						drone:registerEventHandler( "transition_complete_keyframe", droneFrame3 )
					end
				end
				
				drone:completeAnimation()
				self.drone:setLeftRight( 0, 0, 0, 720 )
				self.drone:setTopBottom( 0, 0, 0, 180 )
				droneFrame2( drone, {} )
				local CallingCardslootBO2lightFrame2 = function ( CallingCardslootBO2light, event )
					local CallingCardslootBO2lightFrame3 = function ( CallingCardslootBO2light, event )
						if not event.interrupted then
							CallingCardslootBO2light:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						end
						CallingCardslootBO2light:setLeftRight( 0, 0, 555, 614 )
						CallingCardslootBO2light:setTopBottom( 0, 0, 79, 106 )
						if event.interrupted then
							self.clipFinished( CallingCardslootBO2light, event )
						else
							CallingCardslootBO2light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CallingCardslootBO2lightFrame3( CallingCardslootBO2light, event )
						return 
					else
						CallingCardslootBO2light:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						CallingCardslootBO2light:setLeftRight( 0, 0, 586, 645 )
						CallingCardslootBO2light:setTopBottom( 0, 0, 78, 105 )
						CallingCardslootBO2light:registerEventHandler( "transition_complete_keyframe", CallingCardslootBO2lightFrame3 )
					end
				end
				
				CallingCardslootBO2light:completeAnimation()
				self.CallingCardslootBO2light:setLeftRight( 0, 0, 555, 614 )
				self.CallingCardslootBO2light:setTopBottom( 0, 0, 79, 106 )
				CallingCardslootBO2lightFrame2( CallingCardslootBO2light, {} )
				local flame1Frame2 = function ( flame1, event )
					local flame1Frame3 = function ( flame1, event )
						if not event.interrupted then
							flame1:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						end
						flame1:setLeftRight( 0, 0, 232, 328 )
						flame1:setTopBottom( 0, 0, 99, 195 )
						flame1:setAlpha( 0 )
						flame1:setScale( 1.6 )
						if event.interrupted then
							self.clipFinished( flame1, event )
						else
							flame1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						flame1Frame3( flame1, event )
						return 
					else
						flame1:beginAnimation( "keyframe", 850, false, false, CoD.TweenType.Linear )
						flame1:setLeftRight( 0, 0, 229.96, 325.96 )
						flame1:setTopBottom( 0, 0, 101.54, 197.54 )
						flame1:setScale( 1.45 )
						flame1:registerEventHandler( "transition_complete_keyframe", flame1Frame3 )
					end
				end
				
				flame1:completeAnimation()
				self.flame1:setLeftRight( 0, 0, 224, 320 )
				self.flame1:setTopBottom( 0, 0, 109, 205 )
				self.flame1:setAlpha( 1 )
				self.flame1:setScale( 1 )
				flame1Frame2( flame1, {} )
				local flame2Frame2 = function ( flame2, event )
					local flame2Frame3 = function ( flame2, event )
						if not event.interrupted then
							flame2:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						end
						flame2:setLeftRight( 0, 0, 301, 397 )
						flame2:setTopBottom( 0, 0, -11, 85 )
						flame2:setAlpha( 0 )
						flame2:setScale( 0.5 )
						if event.interrupted then
							self.clipFinished( flame2, event )
						else
							flame2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						flame2Frame3( flame2, event )
						return 
					else
						flame2:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						flame2:setAlpha( 1 )
						flame2:registerEventHandler( "transition_complete_keyframe", flame2Frame3 )
					end
				end
				
				flame2:completeAnimation()
				self.flame2:setLeftRight( 0, 0, 247, 343 )
				self.flame2:setTopBottom( 0, 0, 51, 147 )
				self.flame2:setAlpha( 0 )
				self.flame2:setScale( 1 )
				flame2Frame2( flame2, {} )
				local flame3Frame2 = function ( flame3, event )
					local flame3Frame3 = function ( flame3, event )
						local flame3Frame4 = function ( flame3, event )
							if not event.interrupted then
								flame3:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
							end
							flame3:setLeftRight( 0, 0, 152, 248 )
							flame3:setTopBottom( 0, 0, 45, 141 )
							flame3:setAlpha( 0 )
							flame3:setScale( 1 )
							if event.interrupted then
								self.clipFinished( flame3, event )
							else
								flame3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							flame3Frame4( flame3, event )
							return 
						else
							flame3:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							flame3:setLeftRight( 0, 0, 116, 212 )
							flame3:setTopBottom( 0, 0, 25, 121 )
							flame3:setAlpha( 0 )
							flame3:setScale( 1.5 )
							flame3:registerEventHandler( "transition_complete_keyframe", flame3Frame4 )
						end
					end
					
					if event.interrupted then
						flame3Frame3( flame3, event )
						return 
					else
						flame3:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						flame3:setLeftRight( 0, 0, 127.27, 223.27 )
						flame3:setTopBottom( 0, 0, 31.26, 127.26 )
						flame3:setScale( 1.34 )
						flame3:registerEventHandler( "transition_complete_keyframe", flame3Frame3 )
					end
				end
				
				flame3:completeAnimation()
				self.flame3:setLeftRight( 0, 0, 152, 248 )
				self.flame3:setTopBottom( 0, 0, 45, 141 )
				self.flame3:setAlpha( 1 )
				self.flame3:setScale( 1 )
				flame3Frame2( flame3, {} )
				local flame4Frame2 = function ( flame4, event )
					local flame4Frame3 = function ( flame4, event )
						local flame4Frame4 = function ( flame4, event )
							local flame4Frame5 = function ( flame4, event )
								local flame4Frame6 = function ( flame4, event )
									if not event.interrupted then
										flame4:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
									end
									flame4:setLeftRight( 0, 0, 157, 253 )
									flame4:setTopBottom( 0, 0, 114, 210 )
									flame4:setAlpha( 1 )
									flame4:setScale( 2 )
									if event.interrupted then
										self.clipFinished( flame4, event )
									else
										flame4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									flame4Frame6( flame4, event )
									return 
								else
									flame4:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
									flame4:setAlpha( 1 )
									flame4:setScale( 1.68 )
									flame4:registerEventHandler( "transition_complete_keyframe", flame4Frame6 )
								end
							end
							
							if event.interrupted then
								flame4Frame5( flame4, event )
								return 
							else
								flame4:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
								flame4:setScale( 1.18 )
								flame4:registerEventHandler( "transition_complete_keyframe", flame4Frame5 )
							end
						end
						
						if event.interrupted then
							flame4Frame4( flame4, event )
							return 
						else
							flame4:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							flame4:setScale( 1 )
							flame4:registerEventHandler( "transition_complete_keyframe", flame4Frame4 )
						end
					end
					
					if event.interrupted then
						flame4Frame3( flame4, event )
						return 
					else
						flame4:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						flame4:setAlpha( 0 )
						flame4:registerEventHandler( "transition_complete_keyframe", flame4Frame3 )
					end
				end
				
				flame4:completeAnimation()
				self.flame4:setLeftRight( 0, 0, 157, 253 )
				self.flame4:setTopBottom( 0, 0, 114, 210 )
				self.flame4:setAlpha( 1 )
				self.flame4:setScale( 2 )
				flame4Frame2( flame4, {} )
				local flame5Frame2 = function ( flame5, event )
					local flame5Frame3 = function ( flame5, event )
						local flame5Frame4 = function ( flame5, event )
							if not event.interrupted then
								flame5:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							end
							flame5:setLeftRight( 0, 0, 152, 200 )
							flame5:setTopBottom( 0, 0, 75, 123 )
							flame5:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( flame5, event )
							else
								flame5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							flame5Frame4( flame5, event )
							return 
						else
							flame5:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
							flame5:setLeftRight( 0, 0, 150.18, 198.18 )
							flame5:setTopBottom( 0, 0, 73.32, 121.32 )
							flame5:registerEventHandler( "transition_complete_keyframe", flame5Frame4 )
						end
					end
					
					if event.interrupted then
						flame5Frame3( flame5, event )
						return 
					else
						flame5:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						flame5:setLeftRight( 0, 0, 61, 109 )
						flame5:setTopBottom( 0, 0, -9, 39 )
						flame5:setAlpha( 0 )
						flame5:registerEventHandler( "transition_complete_keyframe", flame5Frame3 )
					end
				end
				
				flame5:completeAnimation()
				self.flame5:setLeftRight( 0, 0, 152, 200 )
				self.flame5:setTopBottom( 0, 0, 75, 123 )
				self.flame5:setAlpha( 1 )
				flame5Frame2( flame5, {} )
				local flame6Frame2 = function ( flame6, event )
					local flame6Frame3 = function ( flame6, event )
						local flame6Frame4 = function ( flame6, event )
							if not event.interrupted then
								flame6:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
							end
							flame6:setLeftRight( 0, 0, 217, 253 )
							flame6:setTopBottom( 0, 0, -29, 7 )
							flame6:setAlpha( 0 )
							flame6:setScale( 1 )
							if event.interrupted then
								self.clipFinished( flame6, event )
							else
								flame6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							flame6Frame4( flame6, event )
							return 
						else
							flame6:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
							flame6:setLeftRight( 0, 0, 220.6, 256.6 )
							flame6:setTopBottom( 0, 0, 12.18, 48.18 )
							flame6:registerEventHandler( "transition_complete_keyframe", flame6Frame4 )
						end
					end
					
					if event.interrupted then
						flame6Frame3( flame6, event )
						return 
					else
						flame6:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						flame6:setAlpha( 1 )
						flame6:registerEventHandler( "transition_complete_keyframe", flame6Frame3 )
					end
				end
				
				flame6:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
				flame6:setLeftRight( 0, 0, 224, 260 )
				flame6:setTopBottom( 0, 0, 51, 87 )
				flame6:setAlpha( 0 )
				flame6:setScale( 1 )
				flame6:registerEventHandler( "transition_complete_keyframe", flame6Frame2 )
				local Glow000Frame2 = function ( Glow000, event )
					local Glow000Frame3 = function ( Glow000, event )
						local Glow000Frame4 = function ( Glow000, event )
							local Glow000Frame5 = function ( Glow000, event )
								local Glow000Frame6 = function ( Glow000, event )
									local Glow000Frame7 = function ( Glow000, event )
										local Glow000Frame8 = function ( Glow000, event )
											local Glow000Frame9 = function ( Glow000, event )
												local Glow000Frame10 = function ( Glow000, event )
													local Glow000Frame11 = function ( Glow000, event )
														local Glow000Frame12 = function ( Glow000, event )
															if not event.interrupted then
																Glow000:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															end
															Glow000:setAlpha( 0.2 )
															if event.interrupted then
																self.clipFinished( Glow000, event )
															else
																Glow000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Glow000Frame12( Glow000, event )
															return 
														else
															Glow000:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															Glow000:setAlpha( 0.48 )
															Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame12 )
														end
													end
													
													if event.interrupted then
														Glow000Frame11( Glow000, event )
														return 
													else
														Glow000:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														Glow000:setAlpha( 0.5 )
														Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame11 )
													end
												end
												
												if event.interrupted then
													Glow000Frame10( Glow000, event )
													return 
												else
													Glow000:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
													Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame10 )
												end
											end
											
											if event.interrupted then
												Glow000Frame9( Glow000, event )
												return 
											else
												Glow000:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
												Glow000:setAlpha( 0.28 )
												Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame9 )
											end
										end
										
										if event.interrupted then
											Glow000Frame8( Glow000, event )
											return 
										else
											Glow000:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											Glow000:setAlpha( 0.49 )
											Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame8 )
										end
									end
									
									if event.interrupted then
										Glow000Frame7( Glow000, event )
										return 
									else
										Glow000:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										Glow000:setAlpha( 0.63 )
										Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame7 )
									end
								end
								
								if event.interrupted then
									Glow000Frame6( Glow000, event )
									return 
								else
									Glow000:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
									Glow000:setAlpha( 0.5 )
									Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame6 )
								end
							end
							
							if event.interrupted then
								Glow000Frame5( Glow000, event )
								return 
							else
								Glow000:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Glow000:setAlpha( 0.6 )
								Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame5 )
							end
						end
						
						if event.interrupted then
							Glow000Frame4( Glow000, event )
							return 
						else
							Glow000:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Glow000:setAlpha( 0.5 )
							Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame4 )
						end
					end
					
					if event.interrupted then
						Glow000Frame3( Glow000, event )
						return 
					else
						Glow000:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						Glow000:setAlpha( 0.71 )
						Glow000:registerEventHandler( "transition_complete_keyframe", Glow000Frame3 )
					end
				end
				
				Glow000:completeAnimation()
				self.Glow000:setAlpha( 0.2 )
				Glow000Frame2( Glow000, {} )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							local Glow00Frame5 = function ( Glow00, event )
								local Glow00Frame6 = function ( Glow00, event )
									local Glow00Frame7 = function ( Glow00, event )
										local Glow00Frame8 = function ( Glow00, event )
											local Glow00Frame9 = function ( Glow00, event )
												local Glow00Frame10 = function ( Glow00, event )
													local Glow00Frame11 = function ( Glow00, event )
														local Glow00Frame12 = function ( Glow00, event )
															local Glow00Frame13 = function ( Glow00, event )
																local Glow00Frame14 = function ( Glow00, event )
																	if not event.interrupted then
																		Glow00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																	end
																	Glow00:setLeftRight( 0, 0, -190, 614 )
																	Glow00:setTopBottom( 0, 0, 92, 338 )
																	Glow00:setAlpha( 0.5 )
																	if event.interrupted then
																		self.clipFinished( Glow00, event )
																	else
																		Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																	end
																end
																
																if event.interrupted then
																	Glow00Frame14( Glow00, event )
																	return 
																else
																	Glow00:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																	Glow00:setAlpha( 0.5 )
																	Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame14 )
																end
															end
															
															if event.interrupted then
																Glow00Frame13( Glow00, event )
																return 
															else
																Glow00:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																Glow00:setAlpha( 0 )
																Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame13 )
															end
														end
														
														if event.interrupted then
															Glow00Frame12( Glow00, event )
															return 
														else
															Glow00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															Glow00:setAlpha( 0.5 )
															Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame12 )
														end
													end
													
													if event.interrupted then
														Glow00Frame11( Glow00, event )
														return 
													else
														Glow00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
														Glow00:setAlpha( 0.4 )
														Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame11 )
													end
												end
												
												if event.interrupted then
													Glow00Frame10( Glow00, event )
													return 
												else
													Glow00:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
													Glow00:setAlpha( 0 )
													Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame10 )
												end
											end
											
											if event.interrupted then
												Glow00Frame9( Glow00, event )
												return 
											else
												Glow00:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
												Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame9 )
											end
										end
										
										if event.interrupted then
											Glow00Frame8( Glow00, event )
											return 
										else
											Glow00:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Glow00:setAlpha( 0.4 )
											Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame8 )
										end
									end
									
									if event.interrupted then
										Glow00Frame7( Glow00, event )
										return 
									else
										Glow00:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										Glow00:setAlpha( 0.5 )
										Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame7 )
									end
								end
								
								if event.interrupted then
									Glow00Frame6( Glow00, event )
									return 
								else
									Glow00:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
									Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame6 )
								end
							end
							
							if event.interrupted then
								Glow00Frame5( Glow00, event )
								return 
							else
								Glow00:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Glow00:setAlpha( 0 )
								Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame5 )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Glow00:setAlpha( 0.5 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						Glow00:setAlpha( 0.21 )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setLeftRight( 0, 0, -190, 614 )
				self.Glow00:setTopBottom( 0, 0, 92, 338 )
				self.Glow00:setAlpha( 0.5 )
				Glow00Frame2( Glow00, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardslootBO2flash:close()
		self.CallingCardslootBO2light:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

