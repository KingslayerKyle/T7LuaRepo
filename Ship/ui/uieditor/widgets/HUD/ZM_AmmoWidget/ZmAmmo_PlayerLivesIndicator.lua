-- 0e5d8914d7a71115d926482f02b363f4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )
require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Flsh1" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "player_lives" )
end

CoD.ZmAmmo_PlayerLivesIndicator = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_PlayerLivesIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_PlayerLivesIndicator )
	self.id = "ZmAmmo_PlayerLivesIndicator"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )
	
	local BeastInactive = LUI.UIImage.new()
	BeastInactive:setLeftRight( true, false, 0, 50 )
	BeastInactive:setTopBottom( true, false, 0, 50 )
	BeastInactive:setImage( RegisterImage( "uie_t7_zm_zod_decal_symbol_beast_shuboth_inactive" ) )
	self:addElement( BeastInactive )
	self.BeastInactive = BeastInactive
	
	local BeastBlue = LUI.UIImage.new()
	BeastBlue:setLeftRight( true, false, 0, 50 )
	BeastBlue:setTopBottom( true, false, 0, 50 )
	BeastBlue:setAlpha( 0.7 )
	BeastBlue:setImage( RegisterImage( "uie_t7_zm_zod_decal_symbol_beast_shuboth_blue" ) )
	self:addElement( BeastBlue )
	self.BeastBlue = BeastBlue
	
	local BeastLight = LUI.UIImage.new()
	BeastLight:setLeftRight( true, false, 0, 50 )
	BeastLight:setTopBottom( true, false, 0, 50 )
	BeastLight:setImage( RegisterImage( "uie_t7_zm_zod_decal_symbol_beast_shuboth_light" ) )
	BeastLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	BeastLight:setShaderVector( 0, 1, 0, 0, 0 )
	BeastLight:setShaderVector( 1, 0, 0, 0, 0 )
	BeastLight:setShaderVector( 2, 1, 0, 0, 0 )
	BeastLight:setShaderVector( 3, 0.2, 0, 0, 0 )
	self:addElement( BeastLight )
	self.BeastLight = BeastLight
	
	local BeastGlow = LUI.UIImage.new()
	BeastGlow:setLeftRight( true, false, 0, 50 )
	BeastGlow:setTopBottom( true, false, 0, 50 )
	BeastGlow:setRGB( 1, 0.53, 0 )
	BeastGlow:setImage( RegisterImage( "uie_t7_zm_zod_decal_symbol_beast_shuboth_glow" ) )
	BeastGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BeastGlow )
	self.BeastGlow = BeastGlow
	
	local ZmFxSpark2Ext0 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext0:setLeftRight( true, false, 5.33, 48 )
	ZmFxSpark2Ext0:setTopBottom( true, false, -52, 12 )
	ZmFxSpark2Ext0:setZRot( 9 )
	ZmFxSpark2Ext0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext0 )
	self.ZmFxSpark2Ext0 = ZmFxSpark2Ext0
	
	local ZmFxSpark2Ext00 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext00:setLeftRight( true, false, 12.33, 55 )
	ZmFxSpark2Ext00:setTopBottom( true, false, -37, 27 )
	ZmFxSpark2Ext00:setZRot( 9 )
	ZmFxSpark2Ext00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext00 )
	self.ZmFxSpark2Ext00 = ZmFxSpark2Ext00
	
	local ZmFxSpark2Ext000 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext000:setLeftRight( true, false, 13.89, 56.56 )
	ZmFxSpark2Ext000:setTopBottom( true, false, -32, 32 )
	ZmFxSpark2Ext000:setAlpha( 0 )
	ZmFxSpark2Ext000:setZRot( 9 )
	ZmFxSpark2Ext000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext000 )
	self.ZmFxSpark2Ext000 = ZmFxSpark2Ext000
	
	local ZmFxSpark2Ext0000 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext0000:setLeftRight( true, false, 1.26, 43.93 )
	ZmFxSpark2Ext0000:setTopBottom( true, false, -16.89, 47.11 )
	ZmFxSpark2Ext0000:setZRot( 9 )
	ZmFxSpark2Ext0000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext0000 )
	self.ZmFxSpark2Ext0000 = ZmFxSpark2Ext0000
	
	local ZmFxFlsh10 = CoD.ZmFx_Flsh1.new( menu, controller )
	ZmFxFlsh10:setLeftRight( true, false, 0, 50 )
	ZmFxFlsh10:setTopBottom( true, false, -11, 65 )
	ZmFxFlsh10:setRGB( 0.71, 0.57, 0.32 )
	ZmFxFlsh10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxFlsh10 )
	self.ZmFxFlsh10 = ZmFxFlsh10
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, -1.4, 46.59 )
	GlowOrangeOver:setTopBottom( true, false, -15.85, 69.85 )
	GlowOrangeOver:setRGB( 1, 0.31, 0 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local ZmFxSpark2Ext00000 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext00000:setLeftRight( true, false, -15.45, 56.56 )
	ZmFxSpark2Ext00000:setTopBottom( true, false, -49, 59 )
	ZmFxSpark2Ext00000:setRGB( 0, 0.89, 1 )
	ZmFxSpark2Ext00000:setYRot( 180 )
	ZmFxSpark2Ext00000:setZRot( 9 )
	ZmFxSpark2Ext00000:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext00000 )
	self.ZmFxSpark2Ext00000 = ZmFxSpark2Ext00000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				BeastInactive:completeAnimation()
				self.BeastInactive:setAlpha( 0 )
				self.clipFinished( BeastInactive, {} )

				BeastBlue:completeAnimation()
				self.BeastBlue:setAlpha( 0 )
				self.clipFinished( BeastBlue, {} )

				BeastLight:completeAnimation()
				self.BeastLight:setAlpha( 0 )
				self.clipFinished( BeastLight, {} )

				BeastGlow:completeAnimation()
				self.BeastGlow:setAlpha( 0 )
				self.clipFinished( BeastGlow, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )

				ZmFxSpark2Ext000:completeAnimation()
				self.ZmFxSpark2Ext000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext000, {} )

				ZmFxSpark2Ext0000:completeAnimation()
				self.ZmFxSpark2Ext0000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0000, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxSpark2Ext00000:completeAnimation()
				self.ZmFxSpark2Ext00000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00000, {} )
			end
		},
		Unavailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				BeastInactive:completeAnimation()
				self.BeastInactive:setAlpha( 0.8 )
				self.clipFinished( BeastInactive, {} )

				BeastBlue:completeAnimation()
				self.BeastBlue:setAlpha( 0 )
				self.clipFinished( BeastBlue, {} )

				BeastLight:completeAnimation()
				self.BeastLight:setAlpha( 0 )
				self.clipFinished( BeastLight, {} )

				BeastGlow:completeAnimation()
				self.BeastGlow:setAlpha( 0 )
				self.clipFinished( BeastGlow, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )

				ZmFxSpark2Ext0000:completeAnimation()
				self.ZmFxSpark2Ext0000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0000, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxSpark2Ext00000:completeAnimation()
				self.ZmFxSpark2Ext00000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00000, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local BeastInactiveFrame2 = function ( BeastInactive, event )
					if not event.interrupted then
						BeastInactive:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
					end
					BeastInactive:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BeastInactive, event )
					else
						BeastInactive:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BeastInactive:completeAnimation()
				self.BeastInactive:setAlpha( 0.8 )
				BeastInactiveFrame2( BeastInactive, {} )
				local BeastBlueFrame2 = function ( BeastBlue, event )
					if not event.interrupted then
						BeastBlue:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
					end
					BeastBlue:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BeastBlue, event )
					else
						BeastBlue:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BeastBlue:completeAnimation()
				self.BeastBlue:setAlpha( 0 )
				BeastBlueFrame2( BeastBlue, {} )
				local BeastLightFrame2 = function ( BeastLight, event )
					local BeastLightFrame3 = function ( BeastLight, event )
						local BeastLightFrame4 = function ( BeastLight, event )
							local BeastLightFrame5 = function ( BeastLight, event )
								local BeastLightFrame6 = function ( BeastLight, event )
									local BeastLightFrame7 = function ( BeastLight, event )
										local BeastLightFrame8 = function ( BeastLight, event )
											local BeastLightFrame9 = function ( BeastLight, event )
												if not event.interrupted then
													BeastLight:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
												end
												BeastLight:setAlpha( 0 )
												BeastLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
												BeastLight:setShaderVector( 0, 1, 0, 0, 0 )
												BeastLight:setShaderVector( 1, 0, 0, 0, 0 )
												BeastLight:setShaderVector( 2, 1, 0, 0, 0 )
												BeastLight:setShaderVector( 3, 0.2, 0, 0, 0 )
												if event.interrupted then
													self.clipFinished( BeastLight, event )
												else
													BeastLight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												BeastLightFrame9( BeastLight, event )
												return 
											else
												BeastLight:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
												BeastLight:setAlpha( 1 )
												BeastLight:registerEventHandler( "transition_complete_keyframe", BeastLightFrame9 )
											end
										end
										
										if event.interrupted then
											BeastLightFrame8( BeastLight, event )
											return 
										else
											BeastLight:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
											BeastLight:setAlpha( 0 )
											BeastLight:registerEventHandler( "transition_complete_keyframe", BeastLightFrame8 )
										end
									end
									
									if event.interrupted then
										BeastLightFrame7( BeastLight, event )
										return 
									else
										BeastLight:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
										BeastLight:setAlpha( 1 )
										BeastLight:registerEventHandler( "transition_complete_keyframe", BeastLightFrame7 )
									end
								end
								
								if event.interrupted then
									BeastLightFrame6( BeastLight, event )
									return 
								else
									BeastLight:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
									BeastLight:registerEventHandler( "transition_complete_keyframe", BeastLightFrame6 )
								end
							end
							
							if event.interrupted then
								BeastLightFrame5( BeastLight, event )
								return 
							else
								BeastLight:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								BeastLight:setAlpha( 0 )
								BeastLight:registerEventHandler( "transition_complete_keyframe", BeastLightFrame5 )
							end
						end
						
						if event.interrupted then
							BeastLightFrame4( BeastLight, event )
							return 
						else
							BeastLight:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
							BeastLight:setShaderVector( 2, 1, 0, 0, 0 )
							BeastLight:registerEventHandler( "transition_complete_keyframe", BeastLightFrame4 )
						end
					end
					
					if event.interrupted then
						BeastLightFrame3( BeastLight, event )
						return 
					else
						BeastLight:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						BeastLight:setShaderVector( 0, 1, 0, 0, 0 )
						BeastLight:registerEventHandler( "transition_complete_keyframe", BeastLightFrame3 )
					end
				end
				
				BeastLight:completeAnimation()
				self.BeastLight:setAlpha( 1 )
				self.BeastLight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.BeastLight:setShaderVector( 0, 0, 0, 0, 0 )
				self.BeastLight:setShaderVector( 1, 0, 0, 0, 0 )
				self.BeastLight:setShaderVector( 2, 0, 0, 0, 0 )
				self.BeastLight:setShaderVector( 3, 0.2, 0, 0, 0 )
				BeastLightFrame2( BeastLight, {} )
				local f6_local3 = function ( f17_arg0, f17_arg1 )
					local f17_local0 = function ( f18_arg0, f18_arg1 )
						local f18_local0 = function ( f19_arg0, f19_arg1 )
							local f19_local0 = function ( f20_arg0, f20_arg1 )
								local f20_local0 = function ( f21_arg0, f21_arg1 )
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
																														local f42_local0 = function ( f43_arg0, f43_arg1 )
																															local f43_local0 = function ( f44_arg0, f44_arg1 )
																																local f44_local0 = function ( f45_arg0, f45_arg1 )
																																	local f45_local0 = function ( f46_arg0, f46_arg1 )
																																		local f46_local0 = function ( f47_arg0, f47_arg1 )
																																			local f47_local0 = function ( f48_arg0, f48_arg1 )
																																				local f48_local0 = function ( f49_arg0, f49_arg1 )
																																					local f49_local0 = function ( f50_arg0, f50_arg1 )
																																						local f50_local0 = function ( f51_arg0, f51_arg1 )
																																							local f51_local0 = function ( f52_arg0, f52_arg1 )
																																								local f52_local0 = function ( f53_arg0, f53_arg1 )
																																									local f53_local0 = function ( f54_arg0, f54_arg1 )
																																										if not f54_arg1.interrupted then
																																											f54_arg0:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
																																										end
																																										f54_arg0:setAlpha( 0 )
																																										if f54_arg1.interrupted then
																																											self.clipFinished( f54_arg0, f54_arg1 )
																																										else
																																											f54_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																										end
																																									end
																																									
																																									if f53_arg1.interrupted then
																																										f53_local0( f53_arg0, f53_arg1 )
																																										return 
																																									else
																																										f53_arg0:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
																																										f53_arg0:setAlpha( 0.8 )
																																										f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
																																									end
																																								end
																																								
																																								if f52_arg1.interrupted then
																																									f52_local0( f52_arg0, f52_arg1 )
																																									return 
																																								else
																																									f52_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
																																									f52_arg0:setAlpha( 0 )
																																									f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
																																								end
																																							end
																																							
																																							if f51_arg1.interrupted then
																																								f51_local0( f51_arg0, f51_arg1 )
																																								return 
																																							else
																																								f51_arg0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
																																								f51_arg0:setAlpha( 0.6 )
																																								f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
																																							end
																																						end
																																						
																																						if f50_arg1.interrupted then
																																							f50_local0( f50_arg0, f50_arg1 )
																																							return 
																																						else
																																							f50_arg0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
																																							f50_arg0:setAlpha( 0 )
																																							f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
																																						end
																																					end
																																					
																																					if f49_arg1.interrupted then
																																						f49_local0( f49_arg0, f49_arg1 )
																																						return 
																																					else
																																						f49_arg0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
																																						f49_arg0:setAlpha( 0.8 )
																																						f49_arg0:registerEventHandler( "transition_complete_keyframe", f49_local0 )
																																					end
																																				end
																																				
																																				if f48_arg1.interrupted then
																																					f48_local0( f48_arg0, f48_arg1 )
																																					return 
																																				else
																																					f48_arg0:beginAnimation( "keyframe", 510, false, false, CoD.TweenType.Linear )
																																					f48_arg0:setAlpha( 0 )
																																					f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
																																				end
																																			end
																																			
																																			if f47_arg1.interrupted then
																																				f47_local0( f47_arg0, f47_arg1 )
																																				return 
																																			else
																																				f47_arg0:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
																																				f47_arg0:setAlpha( 0.6 )
																																				f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
																																			end
																																		end
																																		
																																		if f46_arg1.interrupted then
																																			f46_local0( f46_arg0, f46_arg1 )
																																			return 
																																		else
																																			f46_arg0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
																																			f46_arg0:setAlpha( 0 )
																																			f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
																																		end
																																	end
																																	
																																	if f45_arg1.interrupted then
																																		f45_local0( f45_arg0, f45_arg1 )
																																		return 
																																	else
																																		f45_arg0:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
																																		f45_arg0:setAlpha( 0.8 )
																																		f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
																																	end
																																end
																																
																																if f44_arg1.interrupted then
																																	f44_local0( f44_arg0, f44_arg1 )
																																	return 
																																else
																																	f44_arg0:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Linear )
																																	f44_arg0:setAlpha( 0 )
																																	f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
																																end
																															end
																															
																															if f43_arg1.interrupted then
																																f43_local0( f43_arg0, f43_arg1 )
																																return 
																															else
																																f43_arg0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
																																f43_arg0:setAlpha( 0.6 )
																																f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
																															end
																														end
																														
																														if f42_arg1.interrupted then
																															f42_local0( f42_arg0, f42_arg1 )
																															return 
																														else
																															f42_arg0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
																															f42_arg0:setAlpha( 0 )
																															f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
																														end
																													end
																													
																													if f41_arg1.interrupted then
																														f41_local0( f41_arg0, f41_arg1 )
																														return 
																													else
																														f41_arg0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
																														f41_arg0:setAlpha( 0.8 )
																														f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
																													end
																												end
																												
																												if f40_arg1.interrupted then
																													f40_local0( f40_arg0, f40_arg1 )
																													return 
																												else
																													f40_arg0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
																													f40_arg0:setAlpha( 0 )
																													f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
																												end
																											end
																											
																											if f39_arg1.interrupted then
																												f39_local0( f39_arg0, f39_arg1 )
																												return 
																											else
																												f39_arg0:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
																												f39_arg0:setAlpha( 0.6 )
																												f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
																											end
																										end
																										
																										if f38_arg1.interrupted then
																											f38_local0( f38_arg0, f38_arg1 )
																											return 
																										else
																											f38_arg0:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
																											f38_arg0:setAlpha( 0 )
																											f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
																										end
																									end
																									
																									if f37_arg1.interrupted then
																										f37_local0( f37_arg0, f37_arg1 )
																										return 
																									else
																										f37_arg0:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
																										f37_arg0:setAlpha( 0.8 )
																										f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
																									end
																								end
																								
																								if f36_arg1.interrupted then
																									f36_local0( f36_arg0, f36_arg1 )
																									return 
																								else
																									f36_arg0:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Linear )
																									f36_arg0:setAlpha( 0 )
																									f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
																								end
																							end
																							
																							if f35_arg1.interrupted then
																								f35_local0( f35_arg0, f35_arg1 )
																								return 
																							else
																								f35_arg0:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																								f35_arg0:setAlpha( 0.6 )
																								f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
																							end
																						end
																						
																						if f34_arg1.interrupted then
																							f34_local0( f34_arg0, f34_arg1 )
																							return 
																						else
																							f34_arg0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
																							f34_arg0:setAlpha( 0 )
																							f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
																						end
																					end
																					
																					if f33_arg1.interrupted then
																						f33_local0( f33_arg0, f33_arg1 )
																						return 
																					else
																						f33_arg0:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																						f33_arg0:setAlpha( 0.8 )
																						f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
																					end
																				end
																				
																				if f32_arg1.interrupted then
																					f32_local0( f32_arg0, f32_arg1 )
																					return 
																				else
																					f32_arg0:beginAnimation( "keyframe", 510, false, false, CoD.TweenType.Linear )
																					f32_arg0:setAlpha( 0 )
																					f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
																				end
																			end
																			
																			if f31_arg1.interrupted then
																				f31_local0( f31_arg0, f31_arg1 )
																				return 
																			else
																				f31_arg0:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
																				f31_arg0:setAlpha( 0.6 )
																				f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
																			end
																		end
																		
																		if f30_arg1.interrupted then
																			f30_local0( f30_arg0, f30_arg1 )
																			return 
																		else
																			f30_arg0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
																			f30_arg0:setAlpha( 0 )
																			f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
																		end
																	end
																	
																	if f29_arg1.interrupted then
																		f29_local0( f29_arg0, f29_arg1 )
																		return 
																	else
																		f29_arg0:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
																		f29_arg0:setAlpha( 0.8 )
																		f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
																	end
																end
																
																if f28_arg1.interrupted then
																	f28_local0( f28_arg0, f28_arg1 )
																	return 
																else
																	f28_arg0:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Linear )
																	f28_arg0:setAlpha( 0 )
																	f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
																end
															end
															
															if f27_arg1.interrupted then
																f27_local0( f27_arg0, f27_arg1 )
																return 
															else
																f27_arg0:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Linear )
																f27_arg0:setAlpha( 0.6 )
																f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
															end
														end
														
														if f26_arg1.interrupted then
															f26_local0( f26_arg0, f26_arg1 )
															return 
														else
															f26_arg0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
															f26_arg0:setAlpha( 0 )
															f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
														end
													end
													
													if f25_arg1.interrupted then
														f25_local0( f25_arg0, f25_arg1 )
														return 
													else
														f25_arg0:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
														f25_arg0:setAlpha( 0.8 )
														f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
													end
												end
												
												if f24_arg1.interrupted then
													f24_local0( f24_arg0, f24_arg1 )
													return 
												else
													f24_arg0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
													f24_arg0:setAlpha( 0 )
													f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
												end
											end
											
											if f23_arg1.interrupted then
												f23_local0( f23_arg0, f23_arg1 )
												return 
											else
												f23_arg0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
												f23_arg0:setAlpha( 0.6 )
												f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
											end
										end
										
										if f22_arg1.interrupted then
											f22_local0( f22_arg0, f22_arg1 )
											return 
										else
											f22_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
											f22_arg0:setAlpha( 0 )
											f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
										end
									end
									
									if f21_arg1.interrupted then
										f21_local0( f21_arg0, f21_arg1 )
										return 
									else
										f21_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
										f21_arg0:setAlpha( 1 )
										f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
									end
								end
								
								if f20_arg1.interrupted then
									f20_local0( f20_arg0, f20_arg1 )
									return 
								else
									f20_arg0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
									f20_arg0:setAlpha( 0 )
									f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
								end
							end
							
							if f19_arg1.interrupted then
								f19_local0( f19_arg0, f19_arg1 )
								return 
							else
								f19_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								f19_arg0:setAlpha( 1 )
								f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
							end
						end
						
						if f18_arg1.interrupted then
							f18_local0( f18_arg0, f18_arg1 )
							return 
						else
							f18_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							f18_arg0:setAlpha( 0 )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
						end
					end
					
					if f17_arg1.interrupted then
						f17_local0( f17_arg0, f17_arg1 )
						return 
					else
						f17_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						f17_arg0:setAlpha( 1 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
				end
				
				BeastGlow:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
				BeastGlow:setAlpha( 0 )
				BeastGlow:registerEventHandler( "transition_complete_keyframe", f6_local3 )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								if not event.interrupted then
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
								end
								ZmFxSpark2Ext0:setLeftRight( true, false, -2.67, 40 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -25, 39 )
								ZmFxSpark2Ext0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmFxSpark2Ext0, event )
								else
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:setLeftRight( true, false, -2.67, 40 )
								ZmFxSpark2Ext0:setTopBottom( true, false, -25, 39 )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setLeftRight( true, false, -1.67, 41 )
							ZmFxSpark2Ext0:setTopBottom( true, false, -37, 27 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:setAlpha( 1 )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 7.33, 50 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -51, 13 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				local ZmFxSpark2Ext00Frame2 = function ( ZmFxSpark2Ext00, event )
					local ZmFxSpark2Ext00Frame3 = function ( ZmFxSpark2Ext00, event )
						local ZmFxSpark2Ext00Frame4 = function ( ZmFxSpark2Ext00, event )
							local ZmFxSpark2Ext00Frame5 = function ( ZmFxSpark2Ext00, event )
								local ZmFxSpark2Ext00Frame6 = function ( ZmFxSpark2Ext00, event )
									if not event.interrupted then
										ZmFxSpark2Ext00:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
									end
									ZmFxSpark2Ext00:setLeftRight( true, false, 5.33, 48 )
									ZmFxSpark2Ext00:setTopBottom( true, false, -28, 36 )
									ZmFxSpark2Ext00:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( ZmFxSpark2Ext00, event )
									else
										ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext00Frame6( ZmFxSpark2Ext00, event )
									return 
								else
									ZmFxSpark2Ext00:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext00:setLeftRight( true, false, 5.33, 48 )
									ZmFxSpark2Ext00:setTopBottom( true, false, -28, 36 )
									ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext00Frame5( ZmFxSpark2Ext00, event )
								return 
							else
								ZmFxSpark2Ext00:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext00:setLeftRight( true, false, 9.53, 52.2 )
								ZmFxSpark2Ext00:setTopBottom( true, false, -33.4, 30.6 )
								ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext00Frame4( ZmFxSpark2Ext00, event )
							return 
						else
							ZmFxSpark2Ext00:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext00:setAlpha( 1 )
							ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext00Frame3( ZmFxSpark2Ext00, event )
						return 
					else
						ZmFxSpark2Ext00:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame3 )
					end
				end
				
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setLeftRight( true, false, 12.33, 55 )
				self.ZmFxSpark2Ext00:setTopBottom( true, false, -37, 27 )
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				ZmFxSpark2Ext00Frame2( ZmFxSpark2Ext00, {} )
				local f6_local6 = function ( f64_arg0, f64_arg1 )
					local f64_local0 = function ( f65_arg0, f65_arg1 )
						local f65_local0 = function ( f66_arg0, f66_arg1 )
							local f66_local0 = function ( f67_arg0, f67_arg1 )
								if not f67_arg1.interrupted then
									f67_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								f67_arg0:setLeftRight( true, false, 23.89, 66.56 )
								f67_arg0:setTopBottom( true, false, -22, 42 )
								f67_arg0:setAlpha( 0 )
								if f67_arg1.interrupted then
									self.clipFinished( f67_arg0, f67_arg1 )
								else
									f67_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f66_arg1.interrupted then
								f66_local0( f66_arg0, f66_arg1 )
								return 
							else
								f66_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								f66_arg0:setLeftRight( true, false, 23.89, 66.56 )
								f66_arg0:setTopBottom( true, false, -22, 42 )
								f66_arg0:setAlpha( 0.55 )
								f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
							end
						end
						
						if f65_arg1.interrupted then
							f65_local0( f65_arg0, f65_arg1 )
							return 
						else
							f65_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							f65_arg0:setLeftRight( true, false, 21.52, 64.19 )
							f65_arg0:setTopBottom( true, false, -24.11, 39.89 )
							f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
						end
					end
					
					if f64_arg1.interrupted then
						f64_local0( f64_arg0, f64_arg1 )
						return 
					else
						f64_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f64_arg0:setLeftRight( true, false, 14.89, 57.56 )
						f64_arg0:setTopBottom( true, false, -30, 34 )
						f64_arg0:setAlpha( 1 )
						f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
					end
				end
				
				ZmFxSpark2Ext000:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
				ZmFxSpark2Ext000:setLeftRight( true, false, 13.89, 56.56 )
				ZmFxSpark2Ext000:setTopBottom( true, false, -32, 32 )
				ZmFxSpark2Ext000:setAlpha( 0 )
				ZmFxSpark2Ext000:registerEventHandler( "transition_complete_keyframe", f6_local6 )
				local f6_local7 = function ( f68_arg0, f68_arg1 )
					local f68_local0 = function ( f69_arg0, f69_arg1 )
						local f69_local0 = function ( f70_arg0, f70_arg1 )
							local f70_local0 = function ( f71_arg0, f71_arg1 )
								local f71_local0 = function ( f72_arg0, f72_arg1 )
									local f72_local0 = function ( f73_arg0, f73_arg1 )
										if not f73_arg1.interrupted then
											f73_arg0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
										end
										f73_arg0:setLeftRight( true, false, 14.33, 57 )
										f73_arg0:setTopBottom( true, false, -16.89, 47.11 )
										f73_arg0:setAlpha( 0 )
										if f73_arg1.interrupted then
											self.clipFinished( f73_arg0, f73_arg1 )
										else
											f73_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f72_arg1.interrupted then
										f72_local0( f72_arg0, f72_arg1 )
										return 
									else
										f72_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										f72_arg0:setLeftRight( true, false, 14.33, 57 )
										f72_arg0:setTopBottom( true, false, -16.89, 47.11 )
										f72_arg0:setAlpha( 0.6 )
										f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
									end
								end
								
								if f71_arg1.interrupted then
									f71_local0( f71_arg0, f71_arg1 )
									return 
								else
									f71_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
									f71_arg0:setLeftRight( true, false, 11.78, 54.45 )
									f71_arg0:setTopBottom( true, false, -14.71, 49.29 )
									f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
								end
							end
							
							if f70_arg1.interrupted then
								f70_local0( f70_arg0, f70_arg1 )
								return 
							else
								f70_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								f70_arg0:setLeftRight( true, false, 7.33, 50 )
								f70_arg0:setTopBottom( true, false, -10.89, 53.11 )
								f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
							end
						end
						
						if f69_arg1.interrupted then
							f69_local0( f69_arg0, f69_arg1 )
							return 
						else
							f69_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							f69_arg0:setAlpha( 1 )
							f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
						end
					end
					
					if f68_arg1.interrupted then
						f68_local0( f68_arg0, f68_arg1 )
						return 
					else
						f68_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
					end
				end
				
				ZmFxSpark2Ext0000:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
				ZmFxSpark2Ext0000:setLeftRight( true, false, 1.26, 43.93 )
				ZmFxSpark2Ext0000:setTopBottom( true, false, -16.89, 47.11 )
				ZmFxSpark2Ext0000:setAlpha( 0 )
				ZmFxSpark2Ext0000:registerEventHandler( "transition_complete_keyframe", f6_local7 )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									if not event.interrupted then
										GlowOrangeOver:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
									end
									GlowOrangeOver:setAlpha( 0 )
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
									GlowOrangeOver:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 1 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 1 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local ZmFxSpark2Ext00000Frame2 = function ( ZmFxSpark2Ext00000, event )
					local ZmFxSpark2Ext00000Frame3 = function ( ZmFxSpark2Ext00000, event )
						local ZmFxSpark2Ext00000Frame4 = function ( ZmFxSpark2Ext00000, event )
							if not event.interrupted then
								ZmFxSpark2Ext00000:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark2Ext00000:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark2Ext00000, event )
							else
								ZmFxSpark2Ext00000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext00000Frame4( ZmFxSpark2Ext00000, event )
							return 
						else
							ZmFxSpark2Ext00000:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext00000:setAlpha( 0.7 )
							ZmFxSpark2Ext00000:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00000Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext00000Frame3( ZmFxSpark2Ext00000, event )
						return 
					else
						ZmFxSpark2Ext00000:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext00000:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00000Frame3 )
					end
				end
				
				ZmFxSpark2Ext00000:completeAnimation()
				self.ZmFxSpark2Ext00000:setAlpha( 0 )
				ZmFxSpark2Ext00000Frame2( ZmFxSpark2Ext00000, {} )
			end
		},
		HiddenNotZod = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				BeastInactive:completeAnimation()
				self.BeastInactive:setAlpha( 0 )
				self.clipFinished( BeastInactive, {} )

				BeastBlue:completeAnimation()
				self.BeastBlue:setAlpha( 0 )
				self.clipFinished( BeastBlue, {} )

				BeastLight:completeAnimation()
				self.BeastLight:setAlpha( 0 )
				self.clipFinished( BeastLight, {} )

				BeastGlow:completeAnimation()
				self.BeastGlow:setAlpha( 0 )
				self.clipFinished( BeastGlow, {} )

				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0, {} )

				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00, {} )

				ZmFxSpark2Ext000:completeAnimation()
				self.ZmFxSpark2Ext000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext000, {} )

				ZmFxSpark2Ext0000:completeAnimation()
				self.ZmFxSpark2Ext0000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext0000, {} )

				ZmFxFlsh10:completeAnimation()
				self.ZmFxFlsh10:setAlpha( 0 )
				self.clipFinished( ZmFxFlsh10, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				ZmFxSpark2Ext00000:completeAnimation()
				self.ZmFxSpark2Ext00000:setAlpha( 0 )
				self.clipFinished( ZmFxSpark2Ext00000, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HiddenNotZod",
			condition = function ( menu, element, event )
				return not IsMapName( "zm_zod" )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f84_local0
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) then
					f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					if not f84_local0 then
						f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f84_local0 then
							f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
							if not f84_local0 then
								f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
								if not f84_local0 then
									f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
									if not f84_local0 then
										f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
										if not f84_local0 then
											f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
											if not f84_local0 then
												f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
												if not f84_local0 then
													f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
													if not f84_local0 then
														f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
														if not f84_local0 then
															f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
															if not f84_local0 then
																f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
																if not f84_local0 then
																	f84_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				else
					f84_local0 = true
				end
				return f84_local0
			end
		},
		{
			stateName = "Unavailable",
			condition = function ( menu, element, event )
				return not IsModelValueGreaterThan( controller, "player_lives", 0 )
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "player_lives" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "player_lives"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark2Ext0:close()
		element.ZmFxSpark2Ext00:close()
		element.ZmFxSpark2Ext000:close()
		element.ZmFxSpark2Ext0000:close()
		element.ZmFxFlsh10:close()
		element.ZmFxSpark2Ext00000:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
