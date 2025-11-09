require( "ui.uieditor.widgets.HUD.WeaponInfoPrototype.WeaponInfoProto" )

local UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_inventory" ) and Engine.IsSpectatingActiveClient( controller )) and CoD.FSM_VISIBILITY( controller ) == 0 then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

local PostLoadFunc = function ( self )
	self:setAlpha( 0 )
	self.hudStarted = false
	self:registerEventHandler( "hud_update_refresh", UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_VEHICLE, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_UI_ACTIVE, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_GAME_ENDED, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE, UpdateVisibility )
	self:registerEventHandler( "hud_update_bit_" .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION, UpdateVisibility )
	if Engine.DvarBool( nil, "ShakeHUD" ) or Engine.DvarBool( nil, "ParallaxHUD" ) then
		local weaponShaker_xOffset = -160
		local weaponShaker_yOffset = -25
		if Dvar.ParallaxHUD:get() then
			self.weaponShaker = CoD.HUDShaker.new( 10, 10 )
		else
			self.weaponShaker = CoD.HUDShaker.new( 0, 0 )
		end
		self.weaponShaker:setLeftRight( false, true, -454 + weaponShaker_xOffset, 160 + weaponShaker_xOffset )
		self.weaponShaker:setTopBottom( false, true, -218 + weaponShaker_yOffset, 32 + weaponShaker_yOffset )
		self:addElement( self.weaponShaker )
		self:removeElement( self.WeaponInfo )
		self.weaponShaker:addElement( self.WeaponInfo )
	end
end

CoD.WeaponInfoContainerProto = InheritFrom( LUI.UIElement )
CoD.WeaponInfoContainerProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponInfoContainerProto )
	self.id = "WeaponInfoContainerProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 614 )
	self:setTopBottom( true, false, 0, 250 )
	self.anyChildUsesUpdateState = true
	
	local WeaponInfo = CoD.WeaponInfoProto.new( menu, controller )
	WeaponInfo:setLeftRight( false, true, -467, -38 )
	WeaponInfo:setTopBottom( false, true, -149, -24 )
	WeaponInfo:setRGB( 1, 1, 1 )
	WeaponInfo:setXRot( 45 )
	WeaponInfo:setYRot( -33 )
	WeaponInfo:registerEventHandler( "hud_boot", function ( element, event )
		local retVal = nil
		if ShouldBootUpHUD( menu ) then
			PlayClip( self, "hud_start", controller )
			SetHudHasBooted( self )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( WeaponInfo )
	self.WeaponInfo = WeaponInfo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				WeaponInfo:completeAnimation()
				self.WeaponInfo:setAlpha( 0 )
				self.clipFinished( WeaponInfo, {} )
			end,
			hud_stop = function ()
				self:setupElementClipCounter( 1 )
				local WeaponInfoFrame2 = function ( WeaponInfo, event )
					local WeaponInfoFrame3 = function ( WeaponInfo, event )
						local WeaponInfoFrame4 = function ( WeaponInfo, event )
							local WeaponInfoFrame5 = function ( WeaponInfo, event )
								local WeaponInfoFrame6 = function ( WeaponInfo, event )
									local WeaponInfoFrame7 = function ( WeaponInfo, event )
										local WeaponInfoFrame8 = function ( WeaponInfo, event )
											local WeaponInfoFrame9 = function ( WeaponInfo, event )
												local WeaponInfoFrame10 = function ( WeaponInfo, event )
													if not event.interrupted then
														WeaponInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													WeaponInfo:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( WeaponInfo, event )
													else
														WeaponInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													WeaponInfoFrame10( WeaponInfo, event )
													return 
												else
													WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													WeaponInfo:setAlpha( 0.3 )
													WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame10 )
												end
											end
											
											if event.interrupted then
												WeaponInfoFrame9( WeaponInfo, event )
												return 
											else
												WeaponInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												WeaponInfo:setAlpha( 0 )
												WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame9 )
											end
										end
										
										if event.interrupted then
											WeaponInfoFrame8( WeaponInfo, event )
											return 
										else
											WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											WeaponInfo:setAlpha( 0.7 )
											WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame8 )
										end
									end
									
									if event.interrupted then
										WeaponInfoFrame7( WeaponInfo, event )
										return 
									else
										WeaponInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										WeaponInfo:setAlpha( 0 )
										WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame7 )
									end
								end
								
								if event.interrupted then
									WeaponInfoFrame6( WeaponInfo, event )
									return 
								else
									WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									WeaponInfo:setAlpha( 0.67 )
									WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame6 )
								end
							end
							
							if event.interrupted then
								WeaponInfoFrame5( WeaponInfo, event )
								return 
							else
								WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								WeaponInfo:setAlpha( 0 )
								WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponInfoFrame4( WeaponInfo, event )
							return 
						else
							WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							WeaponInfo:setAlpha( 1 )
							WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponInfoFrame3( WeaponInfo, event )
						return 
					else
						WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						WeaponInfo:setAlpha( 0 )
						WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame3 )
					end
				end
				
				WeaponInfo:completeAnimation()
				self.WeaponInfo:setAlpha( 1 )
				WeaponInfoFrame2( WeaponInfo, {} )
			end,
			hud_start = function ()
				self:setupElementClipCounter( 1 )
				local WeaponInfoFrame2 = function ( WeaponInfo, event )
					local WeaponInfoFrame3 = function ( WeaponInfo, event )
						local WeaponInfoFrame4 = function ( WeaponInfo, event )
							local WeaponInfoFrame5 = function ( WeaponInfo, event )
								local WeaponInfoFrame6 = function ( WeaponInfo, event )
									local WeaponInfoFrame7 = function ( WeaponInfo, event )
										local WeaponInfoFrame8 = function ( WeaponInfo, event )
											local WeaponInfoFrame9 = function ( WeaponInfo, event )
												local WeaponInfoFrame10 = function ( WeaponInfo, event )
													local WeaponInfoFrame11 = function ( WeaponInfo, event )
														local WeaponInfoFrame12 = function ( WeaponInfo, event )
															local WeaponInfoFrame13 = function ( WeaponInfo, event )
																local WeaponInfoFrame14 = function ( WeaponInfo, event )
																	local WeaponInfoFrame15 = function ( WeaponInfo, event )
																		local WeaponInfoFrame16 = function ( WeaponInfo, event )
																			local WeaponInfoFrame17 = function ( WeaponInfo, event )
																				local WeaponInfoFrame18 = function ( WeaponInfo, event )
																					if not event.interrupted then
																						WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					end
																					WeaponInfo:setAlpha( 1 )
																					if event.interrupted then
																						self.clipFinished( WeaponInfo, event )
																					else
																						WeaponInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																					end
																				end
																				
																				if event.interrupted then
																					WeaponInfoFrame18( WeaponInfo, event )
																					return 
																				else
																					WeaponInfo:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																					WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				WeaponInfoFrame17( WeaponInfo, event )
																				return 
																			else
																				WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			WeaponInfoFrame16( WeaponInfo, event )
																			return 
																		else
																			WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		WeaponInfoFrame15( WeaponInfo, event )
																		return 
																	else
																		WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame15 )
																	end
																end
																
																if event.interrupted then
																	WeaponInfoFrame14( WeaponInfo, event )
																	return 
																else
																	WeaponInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame14 )
																end
															end
															
															if event.interrupted then
																WeaponInfoFrame13( WeaponInfo, event )
																return 
															else
																WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame13 )
															end
														end
														
														if event.interrupted then
															WeaponInfoFrame12( WeaponInfo, event )
															return 
														else
															WeaponInfo:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame12 )
														end
													end
													
													if event.interrupted then
														WeaponInfoFrame11( WeaponInfo, event )
														return 
													else
														WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame11 )
													end
												end
												
												if event.interrupted then
													WeaponInfoFrame10( WeaponInfo, event )
													return 
												else
													WeaponInfo:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
													WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame10 )
												end
											end
											
											if event.interrupted then
												WeaponInfoFrame9( WeaponInfo, event )
												return 
											else
												WeaponInfo:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame9 )
											end
										end
										
										if event.interrupted then
											WeaponInfoFrame8( WeaponInfo, event )
											return 
										else
											WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame8 )
										end
									end
									
									if event.interrupted then
										WeaponInfoFrame7( WeaponInfo, event )
										return 
									else
										WeaponInfo:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame7 )
									end
								end
								
								if event.interrupted then
									WeaponInfoFrame6( WeaponInfo, event )
									return 
								else
									WeaponInfo:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame6 )
								end
							end
							
							if event.interrupted then
								WeaponInfoFrame5( WeaponInfo, event )
								return 
							else
								WeaponInfo:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame5 )
							end
						end
						
						if event.interrupted then
							WeaponInfoFrame4( WeaponInfo, event )
							return 
						else
							WeaponInfo:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame4 )
						end
					end
					
					if event.interrupted then
						WeaponInfoFrame3( WeaponInfo, event )
						return 
					else
						WeaponInfo:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						WeaponInfo:setAlpha( 1 )
						WeaponInfo:registerEventHandler( "transition_complete_keyframe", WeaponInfoFrame3 )
					end
				end
				
				WeaponInfo:completeAnimation()
				self.WeaponInfo:setAlpha( 0 )
				WeaponInfoFrame2( WeaponInfo, {} )
			end
		}
	}
	self.close = function ( self )
		self.WeaponInfo:close()
		CoD.WeaponInfoContainerProto.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

