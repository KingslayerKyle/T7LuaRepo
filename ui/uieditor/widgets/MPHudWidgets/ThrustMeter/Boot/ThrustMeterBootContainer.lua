-- 2011ff303d330859f7af2a833112fade
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.Boot.ThrustBootMeterCircle" )
require( "ui.uieditor.widgets.MPHudWidgets.ThrustMeter.Boot.ThrustBootChevron" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg1.controller
	if Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and (not CoD.IsShoutcaster( f1_local0 ) or CoD.ShoutcasterProfileVarBool( f1_local0, "shoutcaster_teamscore" )) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( f1_local0, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and CoD.isCampaign ~= true and CoD.FSM_VISIBILITY( f1_local0 ) == 0 then
		if not f1_arg0.visible then
			f1_arg0:setAlpha( 1 )
			f1_arg0.visible = true
		end
	elseif f1_arg0.visible then
		f1_arg0:setAlpha( 0 )
		f1_arg0.visible = nil
	end
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.hudStarted = false
	local f2_local0 = function ( f3_arg0 )
		f0_local0( f2_arg0, {
			controller = f2_arg1
		} )
	end
	
	local f2_local1 = Engine.GetModelForController( f2_arg1 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), f2_local0 )
	f2_arg0:subscribeToModel( Engine.GetModel( f2_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), f2_local0 )
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
	self:addElement( InnerCircle )
	self.InnerCircle = InnerCircle
	
	local ThrustBootMeterCircle0 = CoD.ThrustBootMeterCircle.new( menu, controller )
	ThrustBootMeterCircle0:setLeftRight( true, false, 9.17, 299.83 )
	ThrustBootMeterCircle0:setTopBottom( true, false, -3.67, 307.33 )
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
	Hash1:setAlpha( 0 )
	Hash1:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hash" ) )
	self:addElement( Hash1 )
	self.Hash1 = Hash1
	
	local Hash4 = LUI.UIImage.new()
	Hash4:setLeftRight( true, false, 42.67, 21.33 )
	Hash4:setTopBottom( true, false, 19, 43 )
	Hash4:setAlpha( 0 )
	Hash4:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hash" ) )
	self:addElement( Hash4 )
	self.Hash4 = Hash4
	
	local Hash2 = LUI.UIImage.new()
	Hash2:setLeftRight( true, false, 266, 287.33 )
	Hash2:setTopBottom( true, false, 285, 261 )
	Hash2:setAlpha( 0 )
	Hash2:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hash" ) )
	self:addElement( Hash2 )
	self.Hash2 = Hash2
	
	local Hash3 = LUI.UIImage.new()
	Hash3:setLeftRight( true, false, 42.67, 21.33 )
	Hash3:setTopBottom( true, false, 285, 261 )
	Hash3:setAlpha( 0 )
	Hash3:setImage( RegisterImage( "uie_t7_hud_boost_meter_boot_hash" ) )
	self:addElement( Hash3 )
	self.Hash3 = Hash3
	
	local ThrustBootChevron0 = CoD.ThrustBootChevron.new( menu, controller )
	ThrustBootChevron0:setLeftRight( true, false, 152, 157 )
	ThrustBootChevron0:setTopBottom( true, false, 3.25, 301.25 )
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

				local f6_local0 = function ( f7_arg0, f7_arg1 )
					local f7_local0 = function ( f8_arg0, f8_arg1 )
						local f8_local0 = function ( f9_arg0, f9_arg1 )
							local f9_local0 = function ( f10_arg0, f10_arg1 )
								local f10_local0 = function ( f11_arg0, f11_arg1 )
									local f11_local0 = function ( f12_arg0, f12_arg1 )
										local f12_local0 = function ( f13_arg0, f13_arg1 )
											local f13_local0 = function ( f14_arg0, f14_arg1 )
												local f14_local0 = function ( f15_arg0, f15_arg1 )
													local f15_local0 = function ( f16_arg0, f16_arg1 )
														local f16_local0 = function ( f17_arg0, f17_arg1 )
															local f17_local0 = function ( f18_arg0, f18_arg1 )
																local f18_local0 = function ( f19_arg0, f19_arg1 )
																	local f19_local0 = function ( f20_arg0, f20_arg1 )
																		if not f20_arg1.interrupted then
																			f20_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
																		end
																		f20_arg0:setRGB( 0.67, 0.8, 1 )
																		f20_arg0:setAlpha( 0 )
																		f20_arg0:setZRot( 0 )
																		f20_arg0:setZoom( -87 )
																		if f20_arg1.interrupted then
																			self.clipFinished( f20_arg0, f20_arg1 )
																		else
																			f20_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if f19_arg1.interrupted then
																		f19_local0( f19_arg0, f19_arg1 )
																		return 
																	else
																		f19_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		f19_arg0:setAlpha( 0.3 )
																		f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
																	end
																end
																
																if f18_arg1.interrupted then
																	f18_local0( f18_arg0, f18_arg1 )
																	return 
																else
																	f18_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	f18_arg0:setAlpha( 0 )
																	f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
																end
															end
															
															if f17_arg1.interrupted then
																f17_local0( f17_arg0, f17_arg1 )
																return 
															else
																f17_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																f17_arg0:setAlpha( 0.3 )
																f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
															end
														end
														
														if f16_arg1.interrupted then
															f16_local0( f16_arg0, f16_arg1 )
															return 
														else
															f16_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															f16_arg0:setAlpha( 0.21 )
															f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
														end
													end
													
													if f15_arg1.interrupted then
														f15_local0( f15_arg0, f15_arg1 )
														return 
													else
														f15_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
														f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
													end
												end
												
												if f14_arg1.interrupted then
													f14_local0( f14_arg0, f14_arg1 )
													return 
												else
													f14_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
													f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
												end
											end
											
											if f13_arg1.interrupted then
												f13_local0( f13_arg0, f13_arg1 )
												return 
											else
												f13_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
												f13_arg0:setZoom( -87 )
												f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
											end
										end
										
										if f12_arg1.interrupted then
											f12_local0( f12_arg0, f12_arg1 )
											return 
										else
											f12_arg0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
											f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
										end
									end
									
									if f11_arg1.interrupted then
										f11_local0( f11_arg0, f11_arg1 )
										return 
									else
										f11_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f11_arg0:setAlpha( 0.3 )
										f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
									end
								end
								
								if f10_arg1.interrupted then
									f10_local0( f10_arg0, f10_arg1 )
									return 
								else
									f10_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f10_arg0:setAlpha( 0 )
									f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
								end
							end
							
							if f9_arg1.interrupted then
								f9_local0( f9_arg0, f9_arg1 )
								return 
							else
								f9_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f9_arg0:setAlpha( 0.37 )
								f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
							end
						end
						
						if f8_arg1.interrupted then
							f8_local0( f8_arg0, f8_arg1 )
							return 
						else
							f8_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f8_arg0:setAlpha( 0 )
							f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
						end
					end
					
					if f7_arg1.interrupted then
						f7_local0( f7_arg0, f7_arg1 )
						return 
					else
						f7_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						f7_arg0:setAlpha( 0.4 )
						f7_arg0:setZoom( 0 )
						f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
					end
				end
				
				InnerCircle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				self.InnerCircle:setRGB( 0.67, 0.8, 1 )
				self.InnerCircle:setAlpha( 0 )
				self.InnerCircle:setZRot( 0 )
				self.InnerCircle:setZoom( -74 )
				InnerCircle:registerEventHandler( "transition_complete_keyframe", f6_local0 )
				local f6_local1 = function ( f21_arg0, f21_arg1 )
					local f21_local0 = function ( f22_arg0, f22_arg1 )
						local f22_local0 = function ( f23_arg0, f23_arg1 )
							local f23_local0 = function ( f24_arg0, f24_arg1 )
								local f24_local0 = function ( f25_arg0, f25_arg1 )
									local f25_local0 = function ( f26_arg0, f26_arg1 )
										local f26_local0 = function ( f27_arg0, f27_arg1 )
											local f27_local0 = function ( f28_arg0, f28_arg1 )
												local f28_local0 = function ( f29_arg0, f29_arg1 )
													local f29_local0 = function ( f30_arg0, f30_arg1 )
														local f30_local0 = function ( f31_arg0, f31_arg1 )
															local f31_local0 = function ( f32_arg0, f32_arg1 )
																local f32_local0 = function ( f33_arg0, f33_arg1 )
																	local f33_local0 = function ( f34_arg0, f34_arg1 )
																		local f34_local0 = function ( f35_arg0, f35_arg1 )
																			local f35_local0 = function ( f36_arg0, f36_arg1 )
																				local f36_local0 = function ( f37_arg0, f37_arg1 )
																					local f37_local0 = function ( f38_arg0, f38_arg1 )
																						local f38_local0 = function ( f39_arg0, f39_arg1 )
																							local f39_local0 = function ( f40_arg0, f40_arg1 )
																								local f40_local0 = function ( f41_arg0, f41_arg1 )
																									local f41_local0 = function ( f42_arg0, f42_arg1 )
																										if not f42_arg1.interrupted then
																											f42_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
																											f42_arg0.HashCircle:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
																											f42_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
																											f42_arg0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 280, false, false, CoD.TweenType.Linear )
																										end
																										f42_arg0:setLeftRight( true, false, 9.17, 299.83 )
																										f42_arg0:setTopBottom( true, false, -3.67, 307.33 )
																										f42_arg0:setAlpha( 0 )
																										f42_arg0:setZRot( 0 )
																										f42_arg0:setZoom( 0 )
																										f42_arg0.HashCircle:setAlpha( 0 )
																										f42_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
																										f42_arg0.ThrustMeterDotsBoot.dots:setAlpha( 0 )
																										if f42_arg1.interrupted then
																											self.clipFinished( f42_arg0, f42_arg1 )
																										else
																											f42_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if f41_arg1.interrupted then
																										f41_local0( f41_arg0, f41_arg1 )
																										return 
																									else
																										f41_arg0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																										f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
																									end
																								end
																								
																								if f40_arg1.interrupted then
																									f40_local0( f40_arg0, f40_arg1 )
																									return 
																								else
																									f40_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																									f40_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																									f40_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.52, 0, 0, 0 )
																									f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
																								end
																							end
																							
																							if f39_arg1.interrupted then
																								f39_local0( f39_arg0, f39_arg1 )
																								return 
																							else
																								f39_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																								f39_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
																								f39_arg0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 139, false, false, CoD.TweenType.Linear )
																								f39_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.51, 0, 0, 0 )
																								f39_arg0.ThrustMeterDotsBoot.dots:setAlpha( 0 )
																								f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
																							end
																						end
																						
																						if f38_arg1.interrupted then
																							f38_local0( f38_arg0, f38_arg1 )
																							return 
																						else
																							f38_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																							f38_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																							f38_arg0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																							f38_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.49, 0, 0, 0 )
																							f38_arg0.ThrustMeterDotsBoot.dots:setAlpha( 0.65 )
																							f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
																						end
																					end
																					
																					if f37_arg1.interrupted then
																						f37_local0( f37_arg0, f37_arg1 )
																						return 
																					else
																						f37_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						f37_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																						f37_arg0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																						f37_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.48, 0, 0, 0 )
																						f37_arg0.ThrustMeterDotsBoot.dots:setAlpha( 0.74 )
																						f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
																					end
																				end
																				
																				if f36_arg1.interrupted then
																					f36_local0( f36_arg0, f36_arg1 )
																					return 
																				else
																					f36_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					f36_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																					f36_arg0.ThrustMeterDotsBoot.dots:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																					f36_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.48, 0, 0, 0 )
																					f36_arg0.ThrustMeterDotsBoot.dots:setAlpha( 0.72 )
																					f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
																				end
																			end
																			
																			if f35_arg1.interrupted then
																				f35_local0( f35_arg0, f35_arg1 )
																				return 
																			else
																				f35_arg0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
																				f35_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 310, false, false, CoD.TweenType.Linear )
																				f35_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
																				f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
																			end
																		end
																		
																		if f34_arg1.interrupted then
																			f34_local0( f34_arg0, f34_arg1 )
																			return 
																		else
																			f34_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			f34_arg0.HashCircle:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			f34_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			f34_arg0.HashCircle:setAlpha( 0 )
																			f34_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
																			f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
																		end
																	end
																	
																	if f33_arg1.interrupted then
																		f33_local0( f33_arg0, f33_arg1 )
																		return 
																	else
																		f33_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																		f33_arg0.HashCircle:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																		f33_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																		f33_arg0.HashCircle:setAlpha( 0.19 )
																		f33_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
																		f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
																	end
																end
																
																if f32_arg1.interrupted then
																	f32_local0( f32_arg0, f32_arg1 )
																	return 
																else
																	f32_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																	f32_arg0.HashCircle:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																	f32_arg0.ThrustMeterDotsBoot.fill:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																	f32_arg0.HashCircle:setAlpha( 0 )
																	f32_arg0.ThrustMeterDotsBoot.fill:setShaderVector( 0, 0.47, 0, 0, 0 )
																	f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
																end
															end
															
															if f31_arg1.interrupted then
																f31_local0( f31_arg0, f31_arg1 )
																return 
															else
																f31_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																f31_arg0.HashCircle:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
																f31_arg0:setZRot( 0 )
																f31_arg0.HashCircle:setAlpha( 0.34 )
																f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
															end
														end
														
														if f30_arg1.interrupted then
															f30_local0( f30_arg0, f30_arg1 )
															return 
														else
															f30_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															f30_arg0.HashCircle:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
															f30_arg0:setZRot( 5.68 )
															f30_arg0.HashCircle:setAlpha( 0.51 )
															f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
														end
													end
													
													if f29_arg1.interrupted then
														f29_local0( f29_arg0, f29_arg1 )
														return 
													else
														f29_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														f29_arg0.HashCircle:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
														f29_arg0:setZRot( 28.42 )
														f29_arg0.HashCircle:setAlpha( 0.5 )
														f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
													end
												end
												
												if f28_arg1.interrupted then
													f28_local0( f28_arg0, f28_arg1 )
													return 
												else
													f28_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													f28_arg0.HashCircle:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
													f28_arg0:setZRot( 151.58 )
													f28_arg0.HashCircle:setAlpha( 0.48 )
													f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
												end
											end
											
											if f27_arg1.interrupted then
												f27_local0( f27_arg0, f27_arg1 )
												return 
											else
												f27_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												f27_arg0:setZRot( 174.32 )
												f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
											end
										end
										
										if f26_arg1.interrupted then
											f26_local0( f26_arg0, f26_arg1 )
											return 
										else
											f26_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
										end
									end
									
									if f25_arg1.interrupted then
										f25_local0( f25_arg0, f25_arg1 )
										return 
									else
										f25_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
									end
								end
								
								if f24_arg1.interrupted then
									f24_local0( f24_arg0, f24_arg1 )
									return 
								else
									f24_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									f24_arg0:setAlpha( 0.8 )
									f24_arg0:setZoom( 0 )
									f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
								end
							end
							
							if f23_arg1.interrupted then
								f23_local0( f23_arg0, f23_arg1 )
								return 
							else
								f23_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f23_arg0:setTopBottom( true, false, -3.67, 307.33 )
								f23_arg0:setAlpha( 0.52 )
								f23_arg0:setZoom( -64.29 )
								f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
							end
						end
						
						if f22_arg1.interrupted then
							f22_local0( f22_arg0, f22_arg1 )
							return 
						else
							f22_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f22_arg0:setTopBottom( true, false, -3.79, 307.21 )
							f22_arg0:setAlpha( 0.47 )
							f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
						end
					end
					
					if f21_arg1.interrupted then
						f21_local0( f21_arg0, f21_arg1 )
						return 
					else
						f21_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
						f21_arg0:setTopBottom( true, false, -3.92, 307.08 )
						f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
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
				ThrustBootMeterCircle0:registerEventHandler( "transition_complete_keyframe", f6_local1 )
				local f6_local2 = function ( f43_arg0, f43_arg1 )
					local f43_local0 = function ( f44_arg0, f44_arg1 )
						local f44_local0 = function ( f45_arg0, f45_arg1 )
							local f45_local0 = function ( f46_arg0, f46_arg1 )
								local f46_local0 = function ( f47_arg0, f47_arg1 )
									local f47_local0 = function ( f48_arg0, f48_arg1 )
										local f48_local0 = function ( f49_arg0, f49_arg1 )
											local f49_local0 = function ( f50_arg0, f50_arg1 )
												if not f50_arg1.interrupted then
													f50_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												f50_arg0:setLeftRight( true, false, 266, 287.33 )
												f50_arg0:setTopBottom( true, false, 19, 43 )
												f50_arg0:setAlpha( 0 )
												if f50_arg1.interrupted then
													self.clipFinished( f50_arg0, f50_arg1 )
												else
													f50_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f49_arg1.interrupted then
												f49_local0( f49_arg0, f49_arg1 )
												return 
											else
												f49_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f49_arg0:setAlpha( 0.7 )
												f49_arg0:registerEventHandler( "transition_complete_keyframe", f49_local0 )
											end
										end
										
										if f48_arg1.interrupted then
											f48_local0( f48_arg0, f48_arg1 )
											return 
										else
											f48_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f48_arg0:setAlpha( 0 )
											f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
										end
									end
									
									if f47_arg1.interrupted then
										f47_local0( f47_arg0, f47_arg1 )
										return 
									else
										f47_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f47_arg0:setLeftRight( true, false, 266, 287.33 )
										f47_arg0:setTopBottom( true, false, 19, 43 )
										f47_arg0:setAlpha( 0.7 )
										f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
									end
								end
								
								if f46_arg1.interrupted then
									f46_local0( f46_arg0, f46_arg1 )
									return 
								else
									f46_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
								end
							end
							
							if f45_arg1.interrupted then
								f45_local0( f45_arg0, f45_arg1 )
								return 
							else
								f45_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f45_arg0:setAlpha( 1 )
								f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
							end
						end
						
						if f44_arg1.interrupted then
							f44_local0( f44_arg0, f44_arg1 )
							return 
						else
							f44_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f44_arg0:setAlpha( 0 )
							f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
						end
					end
					
					if f43_arg1.interrupted then
						f43_local0( f43_arg0, f43_arg1 )
						return 
					else
						f43_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f43_arg0:setAlpha( 1 )
						f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
					end
				end
				
				Hash1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				Hash1:setLeftRight( true, false, 246, 267.33 )
				Hash1:setTopBottom( true, false, 39, 63 )
				Hash1:setAlpha( 0 )
				Hash1:registerEventHandler( "transition_complete_keyframe", f6_local2 )
				local f6_local3 = function ( f51_arg0, f51_arg1 )
					local f51_local0 = function ( f52_arg0, f52_arg1 )
						local f52_local0 = function ( f53_arg0, f53_arg1 )
							local f53_local0 = function ( f54_arg0, f54_arg1 )
								local f54_local0 = function ( f55_arg0, f55_arg1 )
									local f55_local0 = function ( f56_arg0, f56_arg1 )
										local f56_local0 = function ( f57_arg0, f57_arg1 )
											local f57_local0 = function ( f58_arg0, f58_arg1 )
												if not f58_arg1.interrupted then
													f58_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												f58_arg0:setLeftRight( true, false, 42.67, 21.33 )
												f58_arg0:setTopBottom( true, false, 19, 43 )
												f58_arg0:setAlpha( 0 )
												if f58_arg1.interrupted then
													self.clipFinished( f58_arg0, f58_arg1 )
												else
													f58_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f57_arg1.interrupted then
												f57_local0( f57_arg0, f57_arg1 )
												return 
											else
												f57_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f57_arg0:setAlpha( 0.7 )
												f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
											end
										end
										
										if f56_arg1.interrupted then
											f56_local0( f56_arg0, f56_arg1 )
											return 
										else
											f56_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f56_arg0:setAlpha( 0 )
											f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
										end
									end
									
									if f55_arg1.interrupted then
										f55_local0( f55_arg0, f55_arg1 )
										return 
									else
										f55_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f55_arg0:setLeftRight( true, false, 42.67, 21.33 )
										f55_arg0:setTopBottom( true, false, 19, 43 )
										f55_arg0:setAlpha( 0.7 )
										f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
									end
								end
								
								if f54_arg1.interrupted then
									f54_local0( f54_arg0, f54_arg1 )
									return 
								else
									f54_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
								end
							end
							
							if f53_arg1.interrupted then
								f53_local0( f53_arg0, f53_arg1 )
								return 
							else
								f53_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f53_arg0:setAlpha( 1 )
								f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
							end
						end
						
						if f52_arg1.interrupted then
							f52_local0( f52_arg0, f52_arg1 )
							return 
						else
							f52_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f52_arg0:setAlpha( 0 )
							f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
						end
					end
					
					if f51_arg1.interrupted then
						f51_local0( f51_arg0, f51_arg1 )
						return 
					else
						f51_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						f51_arg0:setAlpha( 1 )
						f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
					end
				end
				
				Hash4:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
				Hash4:setLeftRight( true, false, 62.67, 41.33 )
				Hash4:setTopBottom( true, false, 39, 63 )
				Hash4:setAlpha( 0 )
				Hash4:registerEventHandler( "transition_complete_keyframe", f6_local3 )
				local f6_local4 = function ( f59_arg0, f59_arg1 )
					local f59_local0 = function ( f60_arg0, f60_arg1 )
						local f60_local0 = function ( f61_arg0, f61_arg1 )
							local f61_local0 = function ( f62_arg0, f62_arg1 )
								local f62_local0 = function ( f63_arg0, f63_arg1 )
									local f63_local0 = function ( f64_arg0, f64_arg1 )
										local f64_local0 = function ( f65_arg0, f65_arg1 )
											local f65_local0 = function ( f66_arg0, f66_arg1 )
												if not f66_arg1.interrupted then
													f66_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												end
												f66_arg0:setLeftRight( true, false, 266, 287.33 )
												f66_arg0:setTopBottom( true, false, 285, 261 )
												f66_arg0:setAlpha( 0 )
												if f66_arg1.interrupted then
													self.clipFinished( f66_arg0, f66_arg1 )
												else
													f66_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f65_arg1.interrupted then
												f65_local0( f65_arg0, f65_arg1 )
												return 
											else
												f65_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f65_arg0:setAlpha( 0.7 )
												f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
											end
										end
										
										if f64_arg1.interrupted then
											f64_local0( f64_arg0, f64_arg1 )
											return 
										else
											f64_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f64_arg0:setAlpha( 0 )
											f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
										end
									end
									
									if f63_arg1.interrupted then
										f63_local0( f63_arg0, f63_arg1 )
										return 
									else
										f63_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										f63_arg0:setLeftRight( true, false, 266, 287.33 )
										f63_arg0:setTopBottom( true, false, 285, 261 )
										f63_arg0:setAlpha( 0.7 )
										f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
									end
								end
								
								if f62_arg1.interrupted then
									f62_local0( f62_arg0, f62_arg1 )
									return 
								else
									f62_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
								end
							end
							
							if f61_arg1.interrupted then
								f61_local0( f61_arg0, f61_arg1 )
								return 
							else
								f61_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f61_arg0:setAlpha( 1 )
								f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
							end
						end
						
						if f60_arg1.interrupted then
							f60_local0( f60_arg0, f60_arg1 )
							return 
						else
							f60_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f60_arg0:setAlpha( 0 )
							f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
						end
					end
					
					if f59_arg1.interrupted then
						f59_local0( f59_arg0, f59_arg1 )
						return 
					else
						f59_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f59_arg0:setAlpha( 1 )
						f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
					end
				end
				
				Hash2:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
				Hash2:setLeftRight( true, false, 246, 267.33 )
				Hash2:setTopBottom( true, false, 265, 241 )
				Hash2:setAlpha( 0 )
				Hash2:registerEventHandler( "transition_complete_keyframe", f6_local4 )
				local f6_local5 = function ( f67_arg0, f67_arg1 )
					local f67_local0 = function ( f68_arg0, f68_arg1 )
						local f68_local0 = function ( f69_arg0, f69_arg1 )
							local f69_local0 = function ( f70_arg0, f70_arg1 )
								local f70_local0 = function ( f71_arg0, f71_arg1 )
									local f71_local0 = function ( f72_arg0, f72_arg1 )
										local f72_local0 = function ( f73_arg0, f73_arg1 )
											local f73_local0 = function ( f74_arg0, f74_arg1 )
												if not f74_arg1.interrupted then
													f74_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												end
												f74_arg0:setLeftRight( true, false, 42.67, 21.33 )
												f74_arg0:setTopBottom( true, false, 285, 261 )
												f74_arg0:setAlpha( 0 )
												if f74_arg1.interrupted then
													self.clipFinished( f74_arg0, f74_arg1 )
												else
													f74_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if f73_arg1.interrupted then
												f73_local0( f73_arg0, f73_arg1 )
												return 
											else
												f73_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f73_arg0:setAlpha( 0.7 )
												f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
											end
										end
										
										if f72_arg1.interrupted then
											f72_local0( f72_arg0, f72_arg1 )
											return 
										else
											f72_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f72_arg0:setAlpha( 0 )
											f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
										end
									end
									
									if f71_arg1.interrupted then
										f71_local0( f71_arg0, f71_arg1 )
										return 
									else
										f71_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										f71_arg0:setLeftRight( true, false, 42.67, 21.33 )
										f71_arg0:setTopBottom( true, false, 285, 261 )
										f71_arg0:setAlpha( 0.7 )
										f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
									end
								end
								
								if f70_arg1.interrupted then
									f70_local0( f70_arg0, f70_arg1 )
									return 
								else
									f70_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
								end
							end
							
							if f69_arg1.interrupted then
								f69_local0( f69_arg0, f69_arg1 )
								return 
							else
								f69_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f69_arg0:setAlpha( 1 )
								f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
							end
						end
						
						if f68_arg1.interrupted then
							f68_local0( f68_arg0, f68_arg1 )
							return 
						else
							f68_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							f68_arg0:setAlpha( 0 )
							f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
						end
					end
					
					if f67_arg1.interrupted then
						f67_local0( f67_arg0, f67_arg1 )
						return 
					else
						f67_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f67_arg0:setAlpha( 1 )
						f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
					end
				end
				
				Hash3:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
				Hash3:setLeftRight( true, false, 62.67, 41.33 )
				Hash3:setTopBottom( true, false, 265, 241 )
				Hash3:setAlpha( 0 )
				Hash3:registerEventHandler( "transition_complete_keyframe", f6_local5 )
				local f6_local6 = function ( f75_arg0, f75_arg1 )
					local f75_local0 = function ( f76_arg0, f76_arg1 )
						local f76_local0 = function ( f77_arg0, f77_arg1 )
							local f77_local0 = function ( f78_arg0, f78_arg1 )
								local f78_local0 = function ( f79_arg0, f79_arg1 )
									local f79_local0 = function ( f80_arg0, f80_arg1 )
										local f80_local0 = function ( f81_arg0, f81_arg1 )
											local f81_local0 = function ( f82_arg0, f82_arg1 )
												local f82_local0 = function ( f83_arg0, f83_arg1 )
													local f83_local0 = function ( f84_arg0, f84_arg1 )
														local f84_local0 = function ( f85_arg0, f85_arg1 )
															if not f85_arg1.interrupted then
																f85_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
															end
															f85_arg0:setAlpha( 0 )
															f85_arg0:setZRot( -331 )
															if f85_arg1.interrupted then
																self.clipFinished( f85_arg0, f85_arg1 )
															else
																f85_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f84_arg1.interrupted then
															f84_local0( f84_arg0, f84_arg1 )
															return 
														else
															f84_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															f84_arg0:setAlpha( 0.6 )
															f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
														end
													end
													
													if f83_arg1.interrupted then
														f83_local0( f83_arg0, f83_arg1 )
														return 
													else
														f83_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														f83_arg0:setAlpha( 0 )
														f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
													end
												end
												
												if f82_arg1.interrupted then
													f82_local0( f82_arg0, f82_arg1 )
													return 
												else
													f82_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f82_arg0:setAlpha( 0.79 )
													f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
												end
											end
											
											if f81_arg1.interrupted then
												f81_local0( f81_arg0, f81_arg1 )
												return 
											else
												f81_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												f81_arg0:setAlpha( 0 )
												f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
											end
										end
										
										if f80_arg1.interrupted then
											f80_local0( f80_arg0, f80_arg1 )
											return 
										else
											f80_arg0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
											f80_arg0:setAlpha( 1 )
											f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
										end
									end
									
									if f79_arg1.interrupted then
										f79_local0( f79_arg0, f79_arg1 )
										return 
									else
										f79_arg0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										f79_arg0:setAlpha( 0.98 )
										f79_arg0:setZRot( -331 )
										f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
									end
								end
								
								if f78_arg1.interrupted then
									f78_local0( f78_arg0, f78_arg1 )
									return 
								else
									f78_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
								end
							end
							
							if f77_arg1.interrupted then
								f77_local0( f77_arg0, f77_arg1 )
								return 
							else
								f77_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								f77_arg0:setAlpha( 0.96 )
								f77_arg0:setZRot( -389 )
								f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
							end
						end
						
						if f76_arg1.interrupted then
							f76_local0( f76_arg0, f76_arg1 )
							return 
						else
							f76_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f76_arg0:setAlpha( 0.95 )
							f76_arg0:setZRot( -276.26 )
							f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
						end
					end
					
					if f75_arg1.interrupted then
						f75_local0( f75_arg0, f75_arg1 )
						return 
					else
						f75_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f75_arg0:setAlpha( 0.71 )
						f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
					end
				end
				
				ThrustBootChevron0:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
				ThrustBootChevron0:setAlpha( 0 )
				ThrustBootChevron0:setZRot( -270 )
				ThrustBootChevron0:registerEventHandler( "transition_complete_keyframe", f6_local6 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ThrustBootMeterCircle0:close()
		element.ThrustBootChevron0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

