require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.Boot.ThrustBootMeterCircle" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.Boot.ThrustBootChevron" )

local UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_teamscore" )) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and CoD.isCampaign ~= true and CoD.FSM_VISIBILITY( controller ) == 0 then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

local PostLoadFunc = function ( self, controller )
	self.hudStarted = false
	self:registerEventHandler( "hud_update_refresh", UpdateVisibility )
	local UpdateVisibility_Internal = function ( model )
		UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), UpdateVisibility_Internal )
end

CoD.ThrustMeterBootContainer = InheritFrom( LUI.UIElement )
CoD.ThrustMeterBootContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ThrustMeterBootContainer )
	self.id = "ThrustMeterBootContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 309 )
	self:setTopBottom( true, false, 0, 313 )
	
	local InnerCircle = LUI.UIImage.new()
	InnerCircle:setLeftRight( true, false, 24.67, 284.33 )
	InnerCircle:setTopBottom( true, false, 22, 281.67 )
	InnerCircle:setRGB( 0.67, 0.8, 1 )
	InnerCircle:setAlpha( 0 )
	InnerCircle:setZoom( -87 )
	InnerCircle:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_circle" ) )
	InnerCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( InnerCircle )
	self.InnerCircle = InnerCircle
	
	local ThrustBootMeterCircle0 = CoD.ThrustBootMeterCircle.new( menu, controller )
	ThrustBootMeterCircle0:setLeftRight( true, false, 9.17, 299.83 )
	ThrustBootMeterCircle0:setTopBottom( true, false, -3.67, 307.33 )
	ThrustBootMeterCircle0:setRGB( 1, 1, 1 )
	ThrustBootMeterCircle0:setAlpha( 0.8 )
	ThrustBootMeterCircle0.HashCircle:setAlpha( 0 )
	ThrustBootMeterCircle0.HashCircle:setShaderVector( 0, 1, 0, 0, 0 )
	ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
	ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 1, 0.5, 0, 0, 0 )
	ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 2, -2.84, 0, 0, 0 )
	ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:setAlpha( 0 )
	self:addElement( ThrustBootMeterCircle0 )
	self.ThrustBootMeterCircle0 = ThrustBootMeterCircle0
	
	local Hash1 = LUI.UIImage.new()
	Hash1:setLeftRight( true, false, 266, 287.33 )
	Hash1:setTopBottom( true, false, 19, 43 )
	Hash1:setRGB( 1, 1, 1 )
	Hash1:setAlpha( 0 )
	Hash1:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hash" ) )
	Hash1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Hash1 )
	self.Hash1 = Hash1
	
	local Hash4 = LUI.UIImage.new()
	Hash4:setLeftRight( true, false, 42.67, 21.33 )
	Hash4:setTopBottom( true, false, 19, 43 )
	Hash4:setRGB( 1, 1, 1 )
	Hash4:setAlpha( 0 )
	Hash4:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hash" ) )
	Hash4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Hash4 )
	self.Hash4 = Hash4
	
	local Hash2 = LUI.UIImage.new()
	Hash2:setLeftRight( true, false, 266, 287.33 )
	Hash2:setTopBottom( true, false, 285, 261 )
	Hash2:setRGB( 1, 1, 1 )
	Hash2:setAlpha( 0 )
	Hash2:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hash" ) )
	Hash2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Hash2 )
	self.Hash2 = Hash2
	
	local Hash3 = LUI.UIImage.new()
	Hash3:setLeftRight( true, false, 42.67, 21.33 )
	Hash3:setTopBottom( true, false, 285, 261 )
	Hash3:setRGB( 1, 1, 1 )
	Hash3:setAlpha( 0 )
	Hash3:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hash" ) )
	Hash3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Hash3 )
	self.Hash3 = Hash3
	
	local ThrustBootChevron0 = CoD.ThrustBootChevron.new( menu, controller )
	ThrustBootChevron0:setLeftRight( true, false, 152, 157 )
	ThrustBootChevron0:setTopBottom( true, false, 3.25, 301.25 )
	ThrustBootChevron0:setRGB( 1, 1, 1 )
	ThrustBootChevron0:setAlpha( 0.98 )
	ThrustBootChevron0:setZRot( -331 )
	self:addElement( ThrustBootChevron0 )
	self.ThrustBootChevron0 = ThrustBootChevron0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				InnerCircle:completeAnimation()
				self.InnerCircle:setLeftRight( true, false, 24.67, 284.33 )
				self.InnerCircle:setTopBottom( true, false, 22, 281.67 )
				self.InnerCircle:setAlpha( 0 )
				self.InnerCircle:setZRot( 180 )
				self.InnerCircle:setZoom( -74 )
				self.InnerCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( InnerCircle, {} )
				ThrustBootMeterCircle0:completeAnimation()
				ThrustBootMeterCircle0.HashCircle:completeAnimation()
				ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:completeAnimation()
				ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:completeAnimation()
				self.ThrustBootMeterCircle0:setAlpha( 0 )
				self.ThrustBootMeterCircle0:setZRot( 0 )
				self.ThrustBootMeterCircle0:setZoom( -75 )
				self.ThrustBootMeterCircle0.HashCircle:setAlpha( 1 )
				self.ThrustBootMeterCircle0.HashCircle:setShaderVector( 0, 1, 0, 0, 0 )
				self.ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setAlpha( 1 )
				self.ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
				self.ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:setAlpha( 1 )
				self.clipFinished( ThrustBootMeterCircle0, {} )
				Hash1:completeAnimation()
				self.Hash1:setLeftRight( true, false, 246, 267.33 )
				self.Hash1:setTopBottom( true, false, 39, 63 )
				self.Hash1:setAlpha( 0 )
				self.clipFinished( Hash1, {} )
				Hash4:completeAnimation()
				self.Hash4:setLeftRight( true, false, 62.67, 41.33 )
				self.Hash4:setTopBottom( true, false, 39, 63 )
				self.Hash4:setAlpha( 0 )
				self.clipFinished( Hash4, {} )
				Hash2:completeAnimation()
				self.Hash2:setLeftRight( true, false, 246, 267.33 )
				self.Hash2:setTopBottom( true, false, 265, 241 )
				self.Hash2:setAlpha( 0 )
				self.clipFinished( Hash2, {} )
				Hash3:completeAnimation()
				self.Hash3:setLeftRight( true, false, 62.67, 41.33 )
				self.Hash3:setTopBottom( true, false, 265, 241 )
				self.Hash3:setAlpha( 0 )
				self.clipFinished( Hash3, {} )
				ThrustBootChevron0:completeAnimation()
				self.ThrustBootChevron0:setAlpha( 0 )
				self.ThrustBootChevron0:setZRot( 29 )
				self.clipFinished( ThrustBootChevron0, {} )
			end,
			thrust_boot = function ()
				self:setupElementClipCounter( 7 )
				local InnerCircleFrame2 = function ( InnerCircle, event )
					local InnerCircleFrame3 = function ( InnerCircle, event )
						local InnerCircleFrame4 = function ( InnerCircle, event )
							local InnerCircleFrame5 = function ( InnerCircle, event )
								local InnerCircleFrame6 = function ( InnerCircle, event )
									local InnerCircleFrame7 = function ( InnerCircle, event )
										local InnerCircleFrame8 = function ( InnerCircle, event )
											local InnerCircleFrame9 = function ( InnerCircle, event )
												local InnerCircleFrame10 = function ( InnerCircle, event )
													local InnerCircleFrame11 = function ( InnerCircle, event )
														local InnerCircleFrame12 = function ( InnerCircle, event )
															local InnerCircleFrame13 = function ( InnerCircle, event )
																local InnerCircleFrame14 = function ( InnerCircle, event )
																	local InnerCircleFrame15 = function ( InnerCircle, event )
																		if not event.interrupted then
																			InnerCircle:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																		end
																		InnerCircle:setRGB( 0.67, 0.8, 1 )
																		InnerCircle:setAlpha( 0 )
																		InnerCircle:setZRot( 0 )
																		InnerCircle:setZoom( -87 )
																		if event.interrupted then
																			self.clipFinished( InnerCircle, event )
																		else
																			InnerCircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		InnerCircleFrame15( InnerCircle, event )
																		return 
																	else
																		InnerCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		InnerCircle:setAlpha( 0.3 )
																		InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame15 )
																	end
																end
																
																if event.interrupted then
																	InnerCircleFrame14( InnerCircle, event )
																	return 
																else
																	InnerCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	InnerCircle:setAlpha( 0 )
																	InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame14 )
																end
															end
															
															if event.interrupted then
																InnerCircleFrame13( InnerCircle, event )
																return 
															else
																InnerCircle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																InnerCircle:setAlpha( 0.3 )
																InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame13 )
															end
														end
														
														if event.interrupted then
															InnerCircleFrame12( InnerCircle, event )
															return 
														else
															InnerCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															InnerCircle:setAlpha( 0.21 )
															InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame12 )
														end
													end
													
													if event.interrupted then
														InnerCircleFrame11( InnerCircle, event )
														return 
													else
														InnerCircle:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
														InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame11 )
													end
												end
												
												if event.interrupted then
													InnerCircleFrame10( InnerCircle, event )
													return 
												else
													InnerCircle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame10 )
												end
											end
											
											if event.interrupted then
												InnerCircleFrame9( InnerCircle, event )
												return 
											else
												InnerCircle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
												InnerCircle:setZoom( -87 )
												InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame9 )
											end
										end
										
										if event.interrupted then
											InnerCircleFrame8( InnerCircle, event )
											return 
										else
											InnerCircle:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
											InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame8 )
										end
									end
									
									if event.interrupted then
										InnerCircleFrame7( InnerCircle, event )
										return 
									else
										InnerCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										InnerCircle:setAlpha( 0.3 )
										InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame7 )
									end
								end
								
								if event.interrupted then
									InnerCircleFrame6( InnerCircle, event )
									return 
								else
									InnerCircle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									InnerCircle:setAlpha( 0 )
									InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame6 )
								end
							end
							
							if event.interrupted then
								InnerCircleFrame5( InnerCircle, event )
								return 
							else
								InnerCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								InnerCircle:setAlpha( 0.37 )
								InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame5 )
							end
						end
						
						if event.interrupted then
							InnerCircleFrame4( InnerCircle, event )
							return 
						else
							InnerCircle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							InnerCircle:setAlpha( 0 )
							InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame4 )
						end
					end
					
					if event.interrupted then
						InnerCircleFrame3( InnerCircle, event )
						return 
					else
						InnerCircle:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						InnerCircle:setAlpha( 0.4 )
						InnerCircle:setZoom( 0 )
						InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame3 )
					end
				end
				
				InnerCircle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				self.InnerCircle:setRGB( 0.67, 0.8, 1 )
				self.InnerCircle:setAlpha( 0 )
				self.InnerCircle:setZRot( 0 )
				self.InnerCircle:setZoom( -74 )
				InnerCircle:registerEventHandler( "transition_complete_keyframe", InnerCircleFrame2 )
				local ThrustBootMeterCircle0Frame2 = function ( ThrustBootMeterCircle0, event )
					local ThrustBootMeterCircle0Frame3 = function ( ThrustBootMeterCircle0, event )
						local ThrustBootMeterCircle0Frame4 = function ( ThrustBootMeterCircle0, event )
							local ThrustBootMeterCircle0Frame5 = function ( ThrustBootMeterCircle0, event )
								local ThrustBootMeterCircle0Frame6 = function ( ThrustBootMeterCircle0, event )
									local ThrustBootMeterCircle0Frame7 = function ( ThrustBootMeterCircle0, event )
										local ThrustBootMeterCircle0Frame8 = function ( ThrustBootMeterCircle0, event )
											local ThrustBootMeterCircle0Frame9 = function ( ThrustBootMeterCircle0, event )
												local ThrustBootMeterCircle0Frame10 = function ( ThrustBootMeterCircle0, event )
													local ThrustBootMeterCircle0Frame11 = function ( ThrustBootMeterCircle0, event )
														local ThrustBootMeterCircle0Frame12 = function ( ThrustBootMeterCircle0, event )
															local ThrustBootMeterCircle0Frame13 = function ( ThrustBootMeterCircle0, event )
																local ThrustBootMeterCircle0Frame14 = function ( ThrustBootMeterCircle0, event )
																	local ThrustBootMeterCircle0Frame15 = function ( ThrustBootMeterCircle0, event )
																		local ThrustBootMeterCircle0Frame16 = function ( ThrustBootMeterCircle0, event )
																			local ThrustBootMeterCircle0Frame17 = function ( ThrustBootMeterCircle0, event )
																				local ThrustBootMeterCircle0Frame18 = function ( ThrustBootMeterCircle0, event )
																					local ThrustBootMeterCircle0Frame19 = function ( ThrustBootMeterCircle0, event )
																						local ThrustBootMeterCircle0Frame20 = function ( ThrustBootMeterCircle0, event )
																							local ThrustBootMeterCircle0Frame21 = function ( ThrustBootMeterCircle0, event )
																								local ThrustBootMeterCircle0Frame22 = function ( ThrustBootMeterCircle0, event )
																									local ThrustBootMeterCircle0Frame23 = function ( ThrustBootMeterCircle0, event )
																										if not event.interrupted then
																											ThrustBootMeterCircle0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
																											ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
																											ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
																											ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
																										end
																										ThrustBootMeterCircle0:setLeftRight( true, false, 9.17, 299.83 )
																										ThrustBootMeterCircle0:setTopBottom( true, false, -3.67, 307.33 )
																										ThrustBootMeterCircle0:setAlpha( 0 )
																										ThrustBootMeterCircle0:setZRot( 0 )
																										ThrustBootMeterCircle0:setZoom( 0 )
																										ThrustBootMeterCircle0.HashCircle:setAlpha( 0 )
																										ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
																										ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:setAlpha( 0 )
																										if event.interrupted then
																											self.clipFinished( ThrustBootMeterCircle0, event )
																										else
																											ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										ThrustBootMeterCircle0Frame23( ThrustBootMeterCircle0, event )
																										return 
																									else
																										ThrustBootMeterCircle0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																										ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ThrustBootMeterCircle0Frame22( ThrustBootMeterCircle0, event )
																									return 
																								else
																									ThrustBootMeterCircle0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																									ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																									ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
																									ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ThrustBootMeterCircle0Frame21( ThrustBootMeterCircle0, event )
																								return 
																							else
																								ThrustBootMeterCircle0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																								ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
																								ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
																								ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.51, 0, 0, 0 )
																								ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:setAlpha( 0 )
																								ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ThrustBootMeterCircle0Frame20( ThrustBootMeterCircle0, event )
																							return 
																						else
																							ThrustBootMeterCircle0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																							ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																							ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																							ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.49, 0, 0, 0 )
																							ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:setAlpha( 0.65 )
																							ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ThrustBootMeterCircle0Frame19( ThrustBootMeterCircle0, event )
																						return 
																					else
																						ThrustBootMeterCircle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																						ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																						ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.48, 0, 0, 0 )
																						ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:setAlpha( 0.74 )
																						ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ThrustBootMeterCircle0Frame18( ThrustBootMeterCircle0, event )
																					return 
																				else
																					ThrustBootMeterCircle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																					ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																					ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.48, 0, 0, 0 )
																					ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:setAlpha( 0.72 )
																					ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ThrustBootMeterCircle0Frame17( ThrustBootMeterCircle0, event )
																				return 
																			else
																				ThrustBootMeterCircle0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
																				ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
																				ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
																				ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ThrustBootMeterCircle0Frame16( ThrustBootMeterCircle0, event )
																			return 
																		else
																			ThrustBootMeterCircle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			ThrustBootMeterCircle0.HashCircle:setAlpha( 0 )
																			ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
																			ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ThrustBootMeterCircle0Frame15( ThrustBootMeterCircle0, event )
																		return 
																	else
																		ThrustBootMeterCircle0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																		ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																		ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																		ThrustBootMeterCircle0.HashCircle:setAlpha( 0.19 )
																		ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
																		ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame15 )
																	end
																end
																
																if event.interrupted then
																	ThrustBootMeterCircle0Frame14( ThrustBootMeterCircle0, event )
																	return 
																else
																	ThrustBootMeterCircle0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																	ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																	ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																	ThrustBootMeterCircle0.HashCircle:setAlpha( 0 )
																	ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
																	ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame14 )
																end
															end
															
															if event.interrupted then
																ThrustBootMeterCircle0Frame13( ThrustBootMeterCircle0, event )
																return 
															else
																ThrustBootMeterCircle0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																ThrustBootMeterCircle0:setZRot( 0 )
																ThrustBootMeterCircle0.HashCircle:setAlpha( 0.34 )
																ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame13 )
															end
														end
														
														if event.interrupted then
															ThrustBootMeterCircle0Frame12( ThrustBootMeterCircle0, event )
															return 
														else
															ThrustBootMeterCircle0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
															ThrustBootMeterCircle0:setZRot( 5.68 )
															ThrustBootMeterCircle0.HashCircle:setAlpha( 0.51 )
															ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame12 )
														end
													end
													
													if event.interrupted then
														ThrustBootMeterCircle0Frame11( ThrustBootMeterCircle0, event )
														return 
													else
														ThrustBootMeterCircle0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
														ThrustBootMeterCircle0:setZRot( 28.42 )
														ThrustBootMeterCircle0.HashCircle:setAlpha( 0.5 )
														ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame11 )
													end
												end
												
												if event.interrupted then
													ThrustBootMeterCircle0Frame10( ThrustBootMeterCircle0, event )
													return 
												else
													ThrustBootMeterCircle0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
													ThrustBootMeterCircle0:setZRot( 151.58 )
													ThrustBootMeterCircle0.HashCircle:setAlpha( 0.48 )
													ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame10 )
												end
											end
											
											if event.interrupted then
												ThrustBootMeterCircle0Frame9( ThrustBootMeterCircle0, event )
												return 
											else
												ThrustBootMeterCircle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												ThrustBootMeterCircle0:setZRot( 174.32 )
												ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame9 )
											end
										end
										
										if event.interrupted then
											ThrustBootMeterCircle0Frame8( ThrustBootMeterCircle0, event )
											return 
										else
											ThrustBootMeterCircle0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame8 )
										end
									end
									
									if event.interrupted then
										ThrustBootMeterCircle0Frame7( ThrustBootMeterCircle0, event )
										return 
									else
										ThrustBootMeterCircle0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame7 )
									end
								end
								
								if event.interrupted then
									ThrustBootMeterCircle0Frame6( ThrustBootMeterCircle0, event )
									return 
								else
									ThrustBootMeterCircle0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									ThrustBootMeterCircle0:setAlpha( 0.8 )
									ThrustBootMeterCircle0:setZoom( 0 )
									ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame6 )
								end
							end
							
							if event.interrupted then
								ThrustBootMeterCircle0Frame5( ThrustBootMeterCircle0, event )
								return 
							else
								ThrustBootMeterCircle0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ThrustBootMeterCircle0:setTopBottom( true, false, -3.67, 307.33 )
								ThrustBootMeterCircle0:setAlpha( 0.52 )
								ThrustBootMeterCircle0:setZoom( -64.29 )
								ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame5 )
							end
						end
						
						if event.interrupted then
							ThrustBootMeterCircle0Frame4( ThrustBootMeterCircle0, event )
							return 
						else
							ThrustBootMeterCircle0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ThrustBootMeterCircle0:setTopBottom( true, false, -3.79, 307.21 )
							ThrustBootMeterCircle0:setAlpha( 0.47 )
							ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame4 )
						end
					end
					
					if event.interrupted then
						ThrustBootMeterCircle0Frame3( ThrustBootMeterCircle0, event )
						return 
					else
						ThrustBootMeterCircle0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						ThrustBootMeterCircle0:setTopBottom( true, false, -3.92, 307.08 )
						ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame3 )
					end
				end
				
				ThrustBootMeterCircle0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
				ThrustBootMeterCircle0.HashCircle:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 439, false, false, CoD.TweenType.Linear )
				ThrustBootMeterCircle0:setLeftRight( true, false, 9.17, 299.83 )
				ThrustBootMeterCircle0:setTopBottom( true, false, -4.67, 306.33 )
				ThrustBootMeterCircle0:setAlpha( 0 )
				ThrustBootMeterCircle0:setZRot( 180 )
				ThrustBootMeterCircle0:setZoom( -75 )
				ThrustBootMeterCircle0.HashCircle:setAlpha( 0.47 )
				ThrustBootMeterCircle0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
				ThrustBootMeterCircle0.ThrustMeterDotsBoot.dots:setAlpha( 1 )
				ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", ThrustBootMeterCircle0Frame2 )
				local Hash1Frame2 = function ( Hash1, event )
					local Hash1Frame3 = function ( Hash1, event )
						local Hash1Frame4 = function ( Hash1, event )
							local Hash1Frame5 = function ( Hash1, event )
								local Hash1Frame6 = function ( Hash1, event )
									local Hash1Frame7 = function ( Hash1, event )
										local Hash1Frame8 = function ( Hash1, event )
											local Hash1Frame9 = function ( Hash1, event )
												if not event.interrupted then
													Hash1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												Hash1:setLeftRight( true, false, 266, 287.33 )
												Hash1:setTopBottom( true, false, 19, 43 )
												Hash1:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Hash1, event )
												else
													Hash1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Hash1Frame9( Hash1, event )
												return 
											else
												Hash1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Hash1:setAlpha( 0.7 )
												Hash1:registerEventHandler( "transition_complete_keyframe", Hash1Frame9 )
											end
										end
										
										if event.interrupted then
											Hash1Frame8( Hash1, event )
											return 
										else
											Hash1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Hash1:setAlpha( 0 )
											Hash1:registerEventHandler( "transition_complete_keyframe", Hash1Frame8 )
										end
									end
									
									if event.interrupted then
										Hash1Frame7( Hash1, event )
										return 
									else
										Hash1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										Hash1:setLeftRight( true, false, 266, 287.33 )
										Hash1:setTopBottom( true, false, 19, 43 )
										Hash1:setAlpha( 0.7 )
										Hash1:registerEventHandler( "transition_complete_keyframe", Hash1Frame7 )
									end
								end
								
								if event.interrupted then
									Hash1Frame6( Hash1, event )
									return 
								else
									Hash1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									Hash1:setLeftRight( true, false, 246, 267.33 )
									Hash1:registerEventHandler( "transition_complete_keyframe", Hash1Frame6 )
								end
							end
							
							if event.interrupted then
								Hash1Frame5( Hash1, event )
								return 
							else
								Hash1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Hash1:setAlpha( 1 )
								Hash1:registerEventHandler( "transition_complete_keyframe", Hash1Frame5 )
							end
						end
						
						if event.interrupted then
							Hash1Frame4( Hash1, event )
							return 
						else
							Hash1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Hash1:setAlpha( 0 )
							Hash1:registerEventHandler( "transition_complete_keyframe", Hash1Frame4 )
						end
					end
					
					if event.interrupted then
						Hash1Frame3( Hash1, event )
						return 
					else
						Hash1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Hash1:setAlpha( 1 )
						Hash1:registerEventHandler( "transition_complete_keyframe", Hash1Frame3 )
					end
				end
				
				Hash1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				Hash1:setLeftRight( true, false, 246, 267.33 )
				Hash1:setTopBottom( true, false, 39, 63 )
				Hash1:setAlpha( 0 )
				Hash1:registerEventHandler( "transition_complete_keyframe", Hash1Frame2 )
				local Hash4Frame2 = function ( Hash4, event )
					local Hash4Frame3 = function ( Hash4, event )
						local Hash4Frame4 = function ( Hash4, event )
							local Hash4Frame5 = function ( Hash4, event )
								local Hash4Frame6 = function ( Hash4, event )
									local Hash4Frame7 = function ( Hash4, event )
										local Hash4Frame8 = function ( Hash4, event )
											local Hash4Frame9 = function ( Hash4, event )
												if not event.interrupted then
													Hash4:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												Hash4:setLeftRight( true, false, 42.67, 21.33 )
												Hash4:setTopBottom( true, false, 19, 43 )
												Hash4:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Hash4, event )
												else
													Hash4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Hash4Frame9( Hash4, event )
												return 
											else
												Hash4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Hash4:setAlpha( 0.7 )
												Hash4:registerEventHandler( "transition_complete_keyframe", Hash4Frame9 )
											end
										end
										
										if event.interrupted then
											Hash4Frame8( Hash4, event )
											return 
										else
											Hash4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Hash4:setAlpha( 0 )
											Hash4:registerEventHandler( "transition_complete_keyframe", Hash4Frame8 )
										end
									end
									
									if event.interrupted then
										Hash4Frame7( Hash4, event )
										return 
									else
										Hash4:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										Hash4:setLeftRight( true, false, 42.67, 21.33 )
										Hash4:setTopBottom( true, false, 19, 43 )
										Hash4:setAlpha( 0.7 )
										Hash4:registerEventHandler( "transition_complete_keyframe", Hash4Frame7 )
									end
								end
								
								if event.interrupted then
									Hash4Frame6( Hash4, event )
									return 
								else
									Hash4:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									Hash4:setLeftRight( true, false, 62.67, 41.33 )
									Hash4:registerEventHandler( "transition_complete_keyframe", Hash4Frame6 )
								end
							end
							
							if event.interrupted then
								Hash4Frame5( Hash4, event )
								return 
							else
								Hash4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Hash4:setAlpha( 1 )
								Hash4:registerEventHandler( "transition_complete_keyframe", Hash4Frame5 )
							end
						end
						
						if event.interrupted then
							Hash4Frame4( Hash4, event )
							return 
						else
							Hash4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Hash4:setAlpha( 0 )
							Hash4:registerEventHandler( "transition_complete_keyframe", Hash4Frame4 )
						end
					end
					
					if event.interrupted then
						Hash4Frame3( Hash4, event )
						return 
					else
						Hash4:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						Hash4:setAlpha( 1 )
						Hash4:registerEventHandler( "transition_complete_keyframe", Hash4Frame3 )
					end
				end
				
				Hash4:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
				Hash4:setLeftRight( true, false, 62.67, 41.33 )
				Hash4:setTopBottom( true, false, 39, 63 )
				Hash4:setAlpha( 0 )
				Hash4:registerEventHandler( "transition_complete_keyframe", Hash4Frame2 )
				local Hash2Frame2 = function ( Hash2, event )
					local Hash2Frame3 = function ( Hash2, event )
						local Hash2Frame4 = function ( Hash2, event )
							local Hash2Frame5 = function ( Hash2, event )
								local Hash2Frame6 = function ( Hash2, event )
									local Hash2Frame7 = function ( Hash2, event )
										local Hash2Frame8 = function ( Hash2, event )
											local Hash2Frame9 = function ( Hash2, event )
												if not event.interrupted then
													Hash2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												Hash2:setLeftRight( true, false, 266, 287.33 )
												Hash2:setTopBottom( true, false, 285, 261 )
												Hash2:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Hash2, event )
												else
													Hash2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Hash2Frame9( Hash2, event )
												return 
											else
												Hash2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Hash2:setAlpha( 0.7 )
												Hash2:registerEventHandler( "transition_complete_keyframe", Hash2Frame9 )
											end
										end
										
										if event.interrupted then
											Hash2Frame8( Hash2, event )
											return 
										else
											Hash2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Hash2:setAlpha( 0 )
											Hash2:registerEventHandler( "transition_complete_keyframe", Hash2Frame8 )
										end
									end
									
									if event.interrupted then
										Hash2Frame7( Hash2, event )
										return 
									else
										Hash2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										Hash2:setLeftRight( true, false, 266, 287.33 )
										Hash2:setTopBottom( true, false, 285, 261 )
										Hash2:setAlpha( 0.7 )
										Hash2:registerEventHandler( "transition_complete_keyframe", Hash2Frame7 )
									end
								end
								
								if event.interrupted then
									Hash2Frame6( Hash2, event )
									return 
								else
									Hash2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									Hash2:setLeftRight( true, false, 246, 267.33 )
									Hash2:registerEventHandler( "transition_complete_keyframe", Hash2Frame6 )
								end
							end
							
							if event.interrupted then
								Hash2Frame5( Hash2, event )
								return 
							else
								Hash2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Hash2:setAlpha( 1 )
								Hash2:registerEventHandler( "transition_complete_keyframe", Hash2Frame5 )
							end
						end
						
						if event.interrupted then
							Hash2Frame4( Hash2, event )
							return 
						else
							Hash2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Hash2:setAlpha( 0 )
							Hash2:registerEventHandler( "transition_complete_keyframe", Hash2Frame4 )
						end
					end
					
					if event.interrupted then
						Hash2Frame3( Hash2, event )
						return 
					else
						Hash2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Hash2:setAlpha( 1 )
						Hash2:registerEventHandler( "transition_complete_keyframe", Hash2Frame3 )
					end
				end
				
				Hash2:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
				Hash2:setLeftRight( true, false, 246, 267.33 )
				Hash2:setTopBottom( true, false, 265, 241 )
				Hash2:setAlpha( 0 )
				Hash2:registerEventHandler( "transition_complete_keyframe", Hash2Frame2 )
				local Hash3Frame2 = function ( Hash3, event )
					local Hash3Frame3 = function ( Hash3, event )
						local Hash3Frame4 = function ( Hash3, event )
							local Hash3Frame5 = function ( Hash3, event )
								local Hash3Frame6 = function ( Hash3, event )
									local Hash3Frame7 = function ( Hash3, event )
										local Hash3Frame8 = function ( Hash3, event )
											local Hash3Frame9 = function ( Hash3, event )
												if not event.interrupted then
													Hash3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												end
												Hash3:setLeftRight( true, false, 42.67, 21.33 )
												Hash3:setTopBottom( true, false, 285, 261 )
												Hash3:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Hash3, event )
												else
													Hash3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Hash3Frame9( Hash3, event )
												return 
											else
												Hash3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Hash3:setAlpha( 0.7 )
												Hash3:registerEventHandler( "transition_complete_keyframe", Hash3Frame9 )
											end
										end
										
										if event.interrupted then
											Hash3Frame8( Hash3, event )
											return 
										else
											Hash3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Hash3:setAlpha( 0 )
											Hash3:registerEventHandler( "transition_complete_keyframe", Hash3Frame8 )
										end
									end
									
									if event.interrupted then
										Hash3Frame7( Hash3, event )
										return 
									else
										Hash3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										Hash3:setLeftRight( true, false, 42.67, 21.33 )
										Hash3:setTopBottom( true, false, 285, 261 )
										Hash3:setAlpha( 0.7 )
										Hash3:registerEventHandler( "transition_complete_keyframe", Hash3Frame7 )
									end
								end
								
								if event.interrupted then
									Hash3Frame6( Hash3, event )
									return 
								else
									Hash3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									Hash3:setLeftRight( true, false, 62.67, 41.33 )
									Hash3:registerEventHandler( "transition_complete_keyframe", Hash3Frame6 )
								end
							end
							
							if event.interrupted then
								Hash3Frame5( Hash3, event )
								return 
							else
								Hash3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Hash3:setAlpha( 1 )
								Hash3:registerEventHandler( "transition_complete_keyframe", Hash3Frame5 )
							end
						end
						
						if event.interrupted then
							Hash3Frame4( Hash3, event )
							return 
						else
							Hash3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Hash3:setAlpha( 0 )
							Hash3:registerEventHandler( "transition_complete_keyframe", Hash3Frame4 )
						end
					end
					
					if event.interrupted then
						Hash3Frame3( Hash3, event )
						return 
					else
						Hash3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Hash3:setAlpha( 1 )
						Hash3:registerEventHandler( "transition_complete_keyframe", Hash3Frame3 )
					end
				end
				
				Hash3:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				Hash3:setLeftRight( true, false, 62.67, 41.33 )
				Hash3:setTopBottom( true, false, 265, 241 )
				Hash3:setAlpha( 0 )
				Hash3:registerEventHandler( "transition_complete_keyframe", Hash3Frame2 )
				local ThrustBootChevron0Frame2 = function ( ThrustBootChevron0, event )
					local ThrustBootChevron0Frame3 = function ( ThrustBootChevron0, event )
						local ThrustBootChevron0Frame4 = function ( ThrustBootChevron0, event )
							local ThrustBootChevron0Frame5 = function ( ThrustBootChevron0, event )
								local ThrustBootChevron0Frame6 = function ( ThrustBootChevron0, event )
									local ThrustBootChevron0Frame7 = function ( ThrustBootChevron0, event )
										local ThrustBootChevron0Frame8 = function ( ThrustBootChevron0, event )
											local ThrustBootChevron0Frame9 = function ( ThrustBootChevron0, event )
												local ThrustBootChevron0Frame10 = function ( ThrustBootChevron0, event )
													local ThrustBootChevron0Frame11 = function ( ThrustBootChevron0, event )
														local ThrustBootChevron0Frame12 = function ( ThrustBootChevron0, event )
															if not event.interrupted then
																ThrustBootChevron0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
															end
															ThrustBootChevron0:setAlpha( 0 )
															ThrustBootChevron0:setZRot( -331 )
															if event.interrupted then
																self.clipFinished( ThrustBootChevron0, event )
															else
																ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															ThrustBootChevron0Frame12( ThrustBootChevron0, event )
															return 
														else
															ThrustBootChevron0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															ThrustBootChevron0:setAlpha( 0.6 )
															ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame12 )
														end
													end
													
													if event.interrupted then
														ThrustBootChevron0Frame11( ThrustBootChevron0, event )
														return 
													else
														ThrustBootChevron0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														ThrustBootChevron0:setAlpha( 0 )
														ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame11 )
													end
												end
												
												if event.interrupted then
													ThrustBootChevron0Frame10( ThrustBootChevron0, event )
													return 
												else
													ThrustBootChevron0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													ThrustBootChevron0:setAlpha( 0.79 )
													ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame10 )
												end
											end
											
											if event.interrupted then
												ThrustBootChevron0Frame9( ThrustBootChevron0, event )
												return 
											else
												ThrustBootChevron0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												ThrustBootChevron0:setAlpha( 0 )
												ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame9 )
											end
										end
										
										if event.interrupted then
											ThrustBootChevron0Frame8( ThrustBootChevron0, event )
											return 
										else
											ThrustBootChevron0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
											ThrustBootChevron0:setAlpha( 1 )
											ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame8 )
										end
									end
									
									if event.interrupted then
										ThrustBootChevron0Frame7( ThrustBootChevron0, event )
										return 
									else
										ThrustBootChevron0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										ThrustBootChevron0:setAlpha( 0.98 )
										ThrustBootChevron0:setZRot( -331 )
										ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame7 )
									end
								end
								
								if event.interrupted then
									ThrustBootChevron0Frame6( ThrustBootChevron0, event )
									return 
								else
									ThrustBootChevron0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame6 )
								end
							end
							
							if event.interrupted then
								ThrustBootChevron0Frame5( ThrustBootChevron0, event )
								return 
							else
								ThrustBootChevron0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								ThrustBootChevron0:setAlpha( 0.96 )
								ThrustBootChevron0:setZRot( -389 )
								ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame5 )
							end
						end
						
						if event.interrupted then
							ThrustBootChevron0Frame4( ThrustBootChevron0, event )
							return 
						else
							ThrustBootChevron0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ThrustBootChevron0:setAlpha( 0.95 )
							ThrustBootChevron0:setZRot( -276.26 )
							ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame4 )
						end
					end
					
					if event.interrupted then
						ThrustBootChevron0Frame3( ThrustBootChevron0, event )
						return 
					else
						ThrustBootChevron0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ThrustBootChevron0:setAlpha( 0.71 )
						ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame3 )
					end
				end
				
				ThrustBootChevron0:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
				ThrustBootChevron0:setAlpha( 0 )
				ThrustBootChevron0:setZRot( -270 )
				ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", ThrustBootChevron0Frame2 )
			end
		}
	}
	self.close = function ( self )
		self.ThrustBootMeterCircle0:close()
		self.ThrustBootChevron0:close()
		CoD.ThrustMeterBootContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

