-- 52663223da562ce18da29da88600e9e2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2Ext" )

CoD.CallingCard_loot_codxp = InheritFrom( LUI.UIElement )
CoD.CallingCard_loot_codxp.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_loot_codxp )
	self.id = "CallingCard_loot_codxp"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 480 )
	bg:setTopBottom( true, false, 0, 120 )
	bg:setImage( RegisterImage( "uie_t7_callingcard_codxp_bg1" ) )
	self:addElement( bg )
	self.bg = bg
	
	local bg2 = LUI.UIImage.new()
	bg2:setLeftRight( true, false, 0, 480 )
	bg2:setTopBottom( true, false, 0, 120 )
	bg2:setImage( RegisterImage( "uie_t7_callingcard_codxp_bg2" ) )
	self:addElement( bg2 )
	self.bg2 = bg2
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 203.67, 438.33 )
	GlowOrangeOver:setTopBottom( true, false, -178.37, 298.37 )
	GlowOrangeOver:setRGB( 1, 0.77, 0 )
	GlowOrangeOver:setAlpha( 0.4 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local EMBER2 = LUI.UIImage.new()
	EMBER2:setLeftRight( true, false, 0, 480 )
	EMBER2:setTopBottom( true, false, -251, 409 )
	EMBER2:setYRot( 1 )
	EMBER2:setZRot( 53 )
	EMBER2:setImage( RegisterImage( "uie_callingcards_cwl_ember2" ) )
	EMBER2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2:setShaderVector( 1, 0, 0.05, 0, 0 )
	self:addElement( EMBER2 )
	self.EMBER2 = EMBER2
	
	local lava1 = LUI.UIImage.new()
	lava1:setLeftRight( true, false, 0, 480 )
	lava1:setTopBottom( true, false, 0, 120 )
	lava1:setImage( RegisterImage( "uie_t7_callingcard_codxp_lava1" ) )
	self:addElement( lava1 )
	self.lava1 = lava1
	
	local lavaRight = LUI.UIImage.new()
	lavaRight:setLeftRight( true, false, 0, 480 )
	lavaRight:setTopBottom( true, false, 0, 120 )
	lavaRight:setImage( RegisterImage( "uie_t7_callingcard_codxp_lava2b" ) )
	lavaRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	lavaRight:setShaderVector( 0, 0.65, 1, 0, 0 )
	lavaRight:setShaderVector( 1, 0.1, 0, -0.15, 0 )
	lavaRight:setShaderVector( 2, 0, 1, 0, 0 )
	lavaRight:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( lavaRight )
	self.lavaRight = lavaRight
	
	local lavaLeft = LUI.UIImage.new()
	lavaLeft:setLeftRight( true, false, 0, 480 )
	lavaLeft:setTopBottom( true, false, 0, 120 )
	lavaLeft:setImage( RegisterImage( "uie_t7_callingcard_codxp_lava2" ) )
	lavaLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	lavaLeft:setShaderVector( 0, 0, 0.72, 0, 0 )
	lavaLeft:setShaderVector( 1, 0, 0.1, 0, 0 )
	lavaLeft:setShaderVector( 2, 0, 1, 0, 0 )
	lavaLeft:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( lavaLeft )
	self.lavaLeft = lavaLeft
	
	local ZmFxSpark2Ext0 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext0:setLeftRight( true, false, 36.33, 87.67 )
	ZmFxSpark2Ext0:setTopBottom( true, false, -12, 29 )
	ZmFxSpark2Ext0:setZRot( 9 )
	ZmFxSpark2Ext0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext0 )
	self.ZmFxSpark2Ext0 = ZmFxSpark2Ext0
	
	local ZmFxSpark2Ext00 = CoD.ZmFx_Spark2Ext.new( menu, controller )
	ZmFxSpark2Ext00:setLeftRight( true, false, 417.99, 469.33 )
	ZmFxSpark2Ext00:setTopBottom( true, false, 0, 41 )
	ZmFxSpark2Ext00:setZRot( 9 )
	ZmFxSpark2Ext00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ZmFxSpark2Ext00 )
	self.ZmFxSpark2Ext00 = ZmFxSpark2Ext00
	
	local logo1 = LUI.UIImage.new()
	logo1:setLeftRight( true, false, 219, 423 )
	logo1:setTopBottom( true, false, 0, 120 )
	logo1:setImage( RegisterImage( "uie_t7_callingcard_codxp_logo" ) )
	self:addElement( logo1 )
	self.logo1 = logo1
	
	local XPlogoAdd = LUI.UIImage.new()
	XPlogoAdd:setLeftRight( true, false, 219, 423 )
	XPlogoAdd:setTopBottom( true, false, 0, 120 )
	XPlogoAdd:setImage( RegisterImage( "uie_t7_callingcard_codxp_logo2" ) )
	XPlogoAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( XPlogoAdd )
	self.XPlogoAdd = XPlogoAdd
	
	local XPlogo = LUI.UIImage.new()
	XPlogo:setLeftRight( true, false, 219, 423 )
	XPlogo:setTopBottom( true, false, 0, 120 )
	XPlogo:setImage( RegisterImage( "uie_t7_callingcard_codxp_logo2" ) )
	self:addElement( XPlogo )
	self.XPlogo = XPlogo
	
	local lavaFrameAdd = LUI.UIImage.new()
	lavaFrameAdd:setLeftRight( true, false, 220, 424 )
	lavaFrameAdd:setTopBottom( true, false, 0, 120 )
	lavaFrameAdd:setImage( RegisterImage( "uie_t7_callingcard_codxp_lava3" ) )
	lavaFrameAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	lavaFrameAdd:setShaderVector( 0, 0, 1, 0, 0 )
	lavaFrameAdd:setShaderVector( 1, 0, 0, 0, 0 )
	lavaFrameAdd:setShaderVector( 2, 0, 1.29, 0, 0 )
	lavaFrameAdd:setShaderVector( 3, 0, 0.24, 0, 0 )
	self:addElement( lavaFrameAdd )
	self.lavaFrameAdd = lavaFrameAdd
	
	local lavaFrame = LUI.UIImage.new()
	lavaFrame:setLeftRight( true, false, 220, 424 )
	lavaFrame:setTopBottom( true, false, 0, 120 )
	lavaFrame:setImage( RegisterImage( "uie_t7_callingcard_codxp_lava3" ) )
	self:addElement( lavaFrame )
	self.lavaFrame = lavaFrame
	
	local EMBER2c = LUI.UIImage.new()
	EMBER2c:setLeftRight( true, false, 156, 636 )
	EMBER2c:setTopBottom( true, false, -238, 422 )
	EMBER2c:setAlpha( 0.3 )
	EMBER2c:setYRot( 1 )
	EMBER2c:setZRot( 53 )
	EMBER2c:setScale( 0.7 )
	EMBER2c:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2c:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2c:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2c:setShaderVector( 1, 0, 0.06, 0, 0 )
	self:addElement( EMBER2c )
	self.EMBER2c = EMBER2c
	
	local EMBER2b = LUI.UIImage.new()
	EMBER2b:setLeftRight( true, false, -103, 377 )
	EMBER2b:setTopBottom( true, false, -238, 422 )
	EMBER2b:setAlpha( 0.4 )
	EMBER2b:setYRot( 1 )
	EMBER2b:setZRot( 53 )
	EMBER2b:setScale( 0.7 )
	EMBER2b:setImage( RegisterImage( "uie_callingcards_cwl_ember2b" ) )
	EMBER2b:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	EMBER2b:setShaderVector( 0, 1, 1, 0, 0 )
	EMBER2b:setShaderVector( 1, 0, 0.03, 0, 0 )
	self:addElement( EMBER2b )
	self.EMBER2b = EMBER2b
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -197, 618 )
	Image0:setTopBottom( true, false, -170, 0 )
	Image0:setRGB( 0.26, 0.26, 0.26 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -197, 618 )
	Image1:setTopBottom( true, false, 120, 290 )
	Image1:setRGB( 0.26, 0.26, 0.26 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -197, 0 )
	Image2:setTopBottom( true, false, -25, 145 )
	Image2:setRGB( 0.26, 0.26, 0.26 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 480, 677 )
	Image3:setTopBottom( true, false, -25, 145 )
	Image3:setRGB( 0.26, 0.26, 0.26 )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				local bg2Frame2 = function ( bg2, event )
					local bg2Frame3 = function ( bg2, event )
						local bg2Frame4 = function ( bg2, event )
							local bg2Frame5 = function ( bg2, event )
								local bg2Frame6 = function ( bg2, event )
									local bg2Frame7 = function ( bg2, event )
										local bg2Frame8 = function ( bg2, event )
											local bg2Frame9 = function ( bg2, event )
												local bg2Frame10 = function ( bg2, event )
													if not event.interrupted then
														bg2:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
													end
													bg2:setAlpha( 0.4 )
													if event.interrupted then
														self.clipFinished( bg2, event )
													else
														bg2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													bg2Frame10( bg2, event )
													return 
												else
													bg2:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
													bg2:setAlpha( 1 )
													bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame10 )
												end
											end
											
											if event.interrupted then
												bg2Frame9( bg2, event )
												return 
											else
												bg2:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
												bg2:setAlpha( 0.31 )
												bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame9 )
											end
										end
										
										if event.interrupted then
											bg2Frame8( bg2, event )
											return 
										else
											bg2:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
											bg2:setAlpha( 1 )
											bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame8 )
										end
									end
									
									if event.interrupted then
										bg2Frame7( bg2, event )
										return 
									else
										bg2:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
										bg2:setAlpha( 0.31 )
										bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame7 )
									end
								end
								
								if event.interrupted then
									bg2Frame6( bg2, event )
									return 
								else
									bg2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									bg2:setAlpha( 1 )
									bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame6 )
								end
							end
							
							if event.interrupted then
								bg2Frame5( bg2, event )
								return 
							else
								bg2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								bg2:setAlpha( 0.73 )
								bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame5 )
							end
						end
						
						if event.interrupted then
							bg2Frame4( bg2, event )
							return 
						else
							bg2:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							bg2:setAlpha( 1 )
							bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame4 )
						end
					end
					
					if event.interrupted then
						bg2Frame3( bg2, event )
						return 
					else
						bg2:beginAnimation( "keyframe", 3680, false, false, CoD.TweenType.Linear )
						bg2:setAlpha( 0 )
						bg2:registerEventHandler( "transition_complete_keyframe", bg2Frame3 )
					end
				end
				
				bg2:completeAnimation()
				self.bg2:setAlpha( 0.4 )
				bg2Frame2( bg2, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									local GlowOrangeOverFrame7 = function ( GlowOrangeOver, event )
										local GlowOrangeOverFrame8 = function ( GlowOrangeOver, event )
											if not event.interrupted then
												GlowOrangeOver:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
											end
											GlowOrangeOver:setLeftRight( true, false, 203.67, 438.33 )
											GlowOrangeOver:setTopBottom( true, false, -178.37, 298.37 )
											GlowOrangeOver:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( GlowOrangeOver, event )
											else
												GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlowOrangeOverFrame8( GlowOrangeOver, event )
											return 
										else
											GlowOrangeOver:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
											GlowOrangeOver:setAlpha( 0.4 )
											GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeOverFrame7( GlowOrangeOver, event )
										return 
									else
										GlowOrangeOver:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
										GlowOrangeOver:setAlpha( 0.15 )
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 0.4 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0.15 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.4 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 3619, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setLeftRight( true, false, 203.67, 438.33 )
				self.GlowOrangeOver:setTopBottom( true, false, -178.37, 298.37 )
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				local lava1Frame2 = function ( lava1, event )
					local lava1Frame3 = function ( lava1, event )
						local lava1Frame4 = function ( lava1, event )
							local lava1Frame5 = function ( lava1, event )
								local lava1Frame6 = function ( lava1, event )
									local lava1Frame7 = function ( lava1, event )
										local lava1Frame8 = function ( lava1, event )
											local lava1Frame9 = function ( lava1, event )
												local lava1Frame10 = function ( lava1, event )
													local lava1Frame11 = function ( lava1, event )
														local lava1Frame12 = function ( lava1, event )
															local lava1Frame13 = function ( lava1, event )
																local lava1Frame14 = function ( lava1, event )
																	local lava1Frame15 = function ( lava1, event )
																		local lava1Frame16 = function ( lava1, event )
																			if not event.interrupted then
																				lava1:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
																			end
																			lava1:setAlpha( 0.62 )
																			if event.interrupted then
																				self.clipFinished( lava1, event )
																			else
																				lava1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			lava1Frame16( lava1, event )
																			return 
																		else
																			lava1:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
																			lava1:setAlpha( 1 )
																			lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		lava1Frame15( lava1, event )
																		return 
																	else
																		lava1:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Linear )
																		lava1:setAlpha( 0.58 )
																		lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame15 )
																	end
																end
																
																if event.interrupted then
																	lava1Frame14( lava1, event )
																	return 
																else
																	lava1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
																	lava1:setAlpha( 1 )
																	lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame14 )
																end
															end
															
															if event.interrupted then
																lava1Frame13( lava1, event )
																return 
															else
																lava1:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
																lava1:setAlpha( 0.49 )
																lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame13 )
															end
														end
														
														if event.interrupted then
															lava1Frame12( lava1, event )
															return 
														else
															lava1:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
															lava1:setAlpha( 0 )
															lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame12 )
														end
													end
													
													if event.interrupted then
														lava1Frame11( lava1, event )
														return 
													else
														lava1:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
														lava1:setAlpha( 1 )
														lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame11 )
													end
												end
												
												if event.interrupted then
													lava1Frame10( lava1, event )
													return 
												else
													lava1:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
													lava1:setAlpha( 0.38 )
													lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame10 )
												end
											end
											
											if event.interrupted then
												lava1Frame9( lava1, event )
												return 
											else
												lava1:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
												lava1:setAlpha( 1 )
												lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame9 )
											end
										end
										
										if event.interrupted then
											lava1Frame8( lava1, event )
											return 
										else
											lava1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
											lava1:setAlpha( 0.48 )
											lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame8 )
										end
									end
									
									if event.interrupted then
										lava1Frame7( lava1, event )
										return 
									else
										lava1:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
										lava1:setAlpha( 1 )
										lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame7 )
									end
								end
								
								if event.interrupted then
									lava1Frame6( lava1, event )
									return 
								else
									lava1:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
									lava1:setAlpha( 0.27 )
									lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame6 )
								end
							end
							
							if event.interrupted then
								lava1Frame5( lava1, event )
								return 
							else
								lava1:beginAnimation( "keyframe", 549, false, false, CoD.TweenType.Linear )
								lava1:setAlpha( 1 )
								lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame5 )
							end
						end
						
						if event.interrupted then
							lava1Frame4( lava1, event )
							return 
						else
							lava1:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							lava1:setAlpha( 0.44 )
							lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame4 )
						end
					end
					
					if event.interrupted then
						lava1Frame3( lava1, event )
						return 
					else
						lava1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						lava1:setAlpha( 0.75 )
						lava1:registerEventHandler( "transition_complete_keyframe", lava1Frame3 )
					end
				end
				
				lava1:completeAnimation()
				self.lava1:setAlpha( 0.2 )
				lava1Frame2( lava1, {} )
				local f2_local3 = function ( f34_arg0, f34_arg1 )
					local f34_local0 = function ( f35_arg0, f35_arg1 )
						local f35_local0 = function ( f36_arg0, f36_arg1 )
							local f36_local0 = function ( f37_arg0, f37_arg1 )
								if not f37_arg1.interrupted then
									f37_arg0:beginAnimation( "keyframe", 1540, false, false, CoD.TweenType.Linear )
								end
								f37_arg0:setAlpha( 0 )
								f37_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
								f37_arg0:setShaderVector( 0, 0.65, 1, 0, 0 )
								f37_arg0:setShaderVector( 1, 0.1, 0, -0.15, 0 )
								f37_arg0:setShaderVector( 2, 0, 1, 0, 0 )
								f37_arg0:setShaderVector( 3, 0, 0, 0, 0 )
								if f37_arg1.interrupted then
									self.clipFinished( f37_arg0, f37_arg1 )
								else
									f37_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f36_arg1.interrupted then
								f36_local0( f36_arg0, f36_arg1 )
								return 
							else
								f36_arg0:beginAnimation( "keyframe", 1940, false, false, CoD.TweenType.Linear )
								f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
							end
						end
						
						if f35_arg1.interrupted then
							f35_local0( f35_arg0, f35_arg1 )
							return 
						else
							f35_arg0:beginAnimation( "keyframe", 1929, false, false, CoD.TweenType.Linear )
							f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
						end
					end
					
					if f34_arg1.interrupted then
						f34_local0( f34_arg0, f34_arg1 )
						return 
					else
						f34_arg0:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
						f34_arg0:setShaderVector( 0, 0.65, 1, 0, 0 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
					end
				end
				
				lavaRight:beginAnimation( "keyframe", 1389, false, false, CoD.TweenType.Linear )
				lavaRight:setAlpha( 1 )
				lavaRight:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				lavaRight:setShaderVector( 0, 1, 1, 0, 0 )
				lavaRight:setShaderVector( 1, 0.1, 0, -0.15, 0 )
				lavaRight:setShaderVector( 2, 0, 1, 0, 0 )
				lavaRight:setShaderVector( 3, 0, 0, 0, 0 )
				lavaRight:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local lavaLeftFrame2 = function ( lavaLeft, event )
					local lavaLeftFrame3 = function ( lavaLeft, event )
						local lavaLeftFrame4 = function ( lavaLeft, event )
							local lavaLeftFrame5 = function ( lavaLeft, event )
								if not event.interrupted then
									lavaLeft:beginAnimation( "keyframe", 1549, false, false, CoD.TweenType.Linear )
								end
								lavaLeft:setAlpha( 0 )
								lavaLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
								lavaLeft:setShaderVector( 0, 0, 0.7, 0, 0 )
								lavaLeft:setShaderVector( 1, 0, 0.1, 0, 0 )
								lavaLeft:setShaderVector( 2, 0, 1, 0, 0 )
								lavaLeft:setShaderVector( 3, 0, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( lavaLeft, event )
								else
									lavaLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								lavaLeftFrame5( lavaLeft, event )
								return 
							else
								lavaLeft:beginAnimation( "keyframe", 1940, false, false, CoD.TweenType.Linear )
								lavaLeft:registerEventHandler( "transition_complete_keyframe", lavaLeftFrame5 )
							end
						end
						
						if event.interrupted then
							lavaLeftFrame4( lavaLeft, event )
							return 
						else
							lavaLeft:beginAnimation( "keyframe", 1849, false, false, CoD.TweenType.Linear )
							lavaLeft:registerEventHandler( "transition_complete_keyframe", lavaLeftFrame4 )
						end
					end
					
					if event.interrupted then
						lavaLeftFrame3( lavaLeft, event )
						return 
					else
						lavaLeft:beginAnimation( "keyframe", 3230, false, false, CoD.TweenType.Linear )
						lavaLeft:setShaderVector( 0, 0, 0.7, 0, 0 )
						lavaLeft:registerEventHandler( "transition_complete_keyframe", lavaLeftFrame3 )
					end
				end
				
				lavaLeft:completeAnimation()
				self.lavaLeft:setAlpha( 1 )
				self.lavaLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				self.lavaLeft:setShaderVector( 0, 0, 0, 0, 0 )
				self.lavaLeft:setShaderVector( 1, 0, 0.1, 0, 0 )
				self.lavaLeft:setShaderVector( 2, 0, 1, 0, 0 )
				self.lavaLeft:setShaderVector( 3, 0, 0, 0, 0 )
				lavaLeftFrame2( lavaLeft, {} )
				local ZmFxSpark2Ext0Frame2 = function ( ZmFxSpark2Ext0, event )
					local ZmFxSpark2Ext0Frame3 = function ( ZmFxSpark2Ext0, event )
						local ZmFxSpark2Ext0Frame4 = function ( ZmFxSpark2Ext0, event )
							local ZmFxSpark2Ext0Frame5 = function ( ZmFxSpark2Ext0, event )
								local ZmFxSpark2Ext0Frame6 = function ( ZmFxSpark2Ext0, event )
									local ZmFxSpark2Ext0Frame7 = function ( ZmFxSpark2Ext0, event )
										local ZmFxSpark2Ext0Frame8 = function ( ZmFxSpark2Ext0, event )
											local ZmFxSpark2Ext0Frame9 = function ( ZmFxSpark2Ext0, event )
												local ZmFxSpark2Ext0Frame10 = function ( ZmFxSpark2Ext0, event )
													local ZmFxSpark2Ext0Frame11 = function ( ZmFxSpark2Ext0, event )
														local ZmFxSpark2Ext0Frame12 = function ( ZmFxSpark2Ext0, event )
															local ZmFxSpark2Ext0Frame13 = function ( ZmFxSpark2Ext0, event )
																local ZmFxSpark2Ext0Frame14 = function ( ZmFxSpark2Ext0, event )
																	local ZmFxSpark2Ext0Frame15 = function ( ZmFxSpark2Ext0, event )
																		local ZmFxSpark2Ext0Frame16 = function ( ZmFxSpark2Ext0, event )
																			local ZmFxSpark2Ext0Frame17 = function ( ZmFxSpark2Ext0, event )
																				local ZmFxSpark2Ext0Frame18 = function ( ZmFxSpark2Ext0, event )
																					local ZmFxSpark2Ext0Frame19 = function ( ZmFxSpark2Ext0, event )
																						local ZmFxSpark2Ext0Frame20 = function ( ZmFxSpark2Ext0, event )
																							local ZmFxSpark2Ext0Frame21 = function ( ZmFxSpark2Ext0, event )
																								local ZmFxSpark2Ext0Frame22 = function ( ZmFxSpark2Ext0, event )
																									local ZmFxSpark2Ext0Frame23 = function ( ZmFxSpark2Ext0, event )
																										local ZmFxSpark2Ext0Frame24 = function ( ZmFxSpark2Ext0, event )
																											local ZmFxSpark2Ext0Frame25 = function ( ZmFxSpark2Ext0, event )
																												if not event.interrupted then
																													ZmFxSpark2Ext0:beginAnimation( "keyframe", 889, false, false, CoD.TweenType.Linear )
																												end
																												ZmFxSpark2Ext0:setLeftRight( true, false, 111.7, 162.3 )
																												ZmFxSpark2Ext0:setTopBottom( true, false, 39.52, 78.48 )
																												ZmFxSpark2Ext0:setAlpha( 0 )
																												if event.interrupted then
																													self.clipFinished( ZmFxSpark2Ext0, event )
																												else
																													ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																												end
																											end
																											
																											if event.interrupted then
																												ZmFxSpark2Ext0Frame25( ZmFxSpark2Ext0, event )
																												return 
																											else
																												ZmFxSpark2Ext0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
																												ZmFxSpark2Ext0:setLeftRight( true, false, 111.7, 162.3 )
																												ZmFxSpark2Ext0:setTopBottom( true, false, 39.52, 78.48 )
																												ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											ZmFxSpark2Ext0Frame24( ZmFxSpark2Ext0, event )
																											return 
																										else
																											ZmFxSpark2Ext0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
																											ZmFxSpark2Ext0:setAlpha( 0 )
																											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										ZmFxSpark2Ext0Frame23( ZmFxSpark2Ext0, event )
																										return 
																									else
																										ZmFxSpark2Ext0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									ZmFxSpark2Ext0Frame22( ZmFxSpark2Ext0, event )
																									return 
																								else
																									ZmFxSpark2Ext0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																									ZmFxSpark2Ext0:setAlpha( 1 )
																									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								ZmFxSpark2Ext0Frame21( ZmFxSpark2Ext0, event )
																								return 
																							else
																								ZmFxSpark2Ext0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
																								ZmFxSpark2Ext0:setLeftRight( true, false, 30.33, 80.92 )
																								ZmFxSpark2Ext0:setTopBottom( true, false, 39.04, 78 )
																								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							ZmFxSpark2Ext0Frame20( ZmFxSpark2Ext0, event )
																							return 
																						else
																							ZmFxSpark2Ext0:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
																							ZmFxSpark2Ext0:setAlpha( 0 )
																							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						ZmFxSpark2Ext0Frame19( ZmFxSpark2Ext0, event )
																						return 
																					else
																						ZmFxSpark2Ext0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					ZmFxSpark2Ext0Frame18( ZmFxSpark2Ext0, event )
																					return 
																				else
																					ZmFxSpark2Ext0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																					ZmFxSpark2Ext0:setAlpha( 1 )
																					ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				ZmFxSpark2Ext0Frame17( ZmFxSpark2Ext0, event )
																				return 
																			else
																				ZmFxSpark2Ext0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																				ZmFxSpark2Ext0:setLeftRight( true, false, 444.33, 494.92 )
																				ZmFxSpark2Ext0:setTopBottom( true, false, 39.52, 78.48 )
																				ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			ZmFxSpark2Ext0Frame16( ZmFxSpark2Ext0, event )
																			return 
																		else
																			ZmFxSpark2Ext0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
																			ZmFxSpark2Ext0:setAlpha( 0 )
																			ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		ZmFxSpark2Ext0Frame15( ZmFxSpark2Ext0, event )
																		return 
																	else
																		ZmFxSpark2Ext0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
																		ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame15 )
																	end
																end
																
																if event.interrupted then
																	ZmFxSpark2Ext0Frame14( ZmFxSpark2Ext0, event )
																	return 
																else
																	ZmFxSpark2Ext0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																	ZmFxSpark2Ext0:setLeftRight( true, false, 244.33, 445 )
																	ZmFxSpark2Ext0:setTopBottom( true, false, -17.27, 137.27 )
																	ZmFxSpark2Ext0:setAlpha( 1 )
																	ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame14 )
																end
															end
															
															if event.interrupted then
																ZmFxSpark2Ext0Frame13( ZmFxSpark2Ext0, event )
																return 
															else
																ZmFxSpark2Ext0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																ZmFxSpark2Ext0:setLeftRight( true, false, 244.33, 396 )
																ZmFxSpark2Ext0:setTopBottom( true, false, -15.14, 123 )
																ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame13 )
															end
														end
														
														if event.interrupted then
															ZmFxSpark2Ext0Frame12( ZmFxSpark2Ext0, event )
															return 
														else
															ZmFxSpark2Ext0:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
															ZmFxSpark2Ext0:setAlpha( 0 )
															ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame12 )
														end
													end
													
													if event.interrupted then
														ZmFxSpark2Ext0Frame11( ZmFxSpark2Ext0, event )
														return 
													else
														ZmFxSpark2Ext0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
														ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame11 )
													end
												end
												
												if event.interrupted then
													ZmFxSpark2Ext0Frame10( ZmFxSpark2Ext0, event )
													return 
												else
													ZmFxSpark2Ext0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
													ZmFxSpark2Ext0:setAlpha( 1 )
													ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame10 )
												end
											end
											
											if event.interrupted then
												ZmFxSpark2Ext0Frame9( ZmFxSpark2Ext0, event )
												return 
											else
												ZmFxSpark2Ext0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												ZmFxSpark2Ext0:setLeftRight( true, false, 198.33, 249.67 )
												ZmFxSpark2Ext0:setTopBottom( true, false, 27, 68 )
												ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame9 )
											end
										end
										
										if event.interrupted then
											ZmFxSpark2Ext0Frame8( ZmFxSpark2Ext0, event )
											return 
										else
											ZmFxSpark2Ext0:beginAnimation( "keyframe", 1659, false, false, CoD.TweenType.Linear )
											ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame8 )
										end
									end
									
									if event.interrupted then
										ZmFxSpark2Ext0Frame7( ZmFxSpark2Ext0, event )
										return 
									else
										ZmFxSpark2Ext0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										ZmFxSpark2Ext0:setLeftRight( true, false, 109.67, 161 )
										ZmFxSpark2Ext0:setTopBottom( true, false, 38, 79 )
										ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame7 )
									end
								end
								
								if event.interrupted then
									ZmFxSpark2Ext0Frame6( ZmFxSpark2Ext0, event )
									return 
								else
									ZmFxSpark2Ext0:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
									ZmFxSpark2Ext0:setAlpha( 0 )
									ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame6 )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext0Frame5( ZmFxSpark2Ext0, event )
								return 
							else
								ZmFxSpark2Ext0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext0Frame4( ZmFxSpark2Ext0, event )
							return 
						else
							ZmFxSpark2Ext0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext0:setAlpha( 1 )
							ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext0Frame3( ZmFxSpark2Ext0, event )
						return 
					else
						ZmFxSpark2Ext0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext0:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext0Frame3 )
					end
				end
				
				ZmFxSpark2Ext0:completeAnimation()
				self.ZmFxSpark2Ext0:setLeftRight( true, false, 36.33, 87.67 )
				self.ZmFxSpark2Ext0:setTopBottom( true, false, -12, 29 )
				self.ZmFxSpark2Ext0:setAlpha( 0 )
				ZmFxSpark2Ext0Frame2( ZmFxSpark2Ext0, {} )
				local ZmFxSpark2Ext00Frame2 = function ( ZmFxSpark2Ext00, event )
					local ZmFxSpark2Ext00Frame3 = function ( ZmFxSpark2Ext00, event )
						local ZmFxSpark2Ext00Frame4 = function ( ZmFxSpark2Ext00, event )
							local ZmFxSpark2Ext00Frame5 = function ( ZmFxSpark2Ext00, event )
								if not event.interrupted then
									ZmFxSpark2Ext00:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
								end
								ZmFxSpark2Ext00:setLeftRight( true, false, 417.99, 469.33 )
								ZmFxSpark2Ext00:setTopBottom( true, false, 0, 41 )
								ZmFxSpark2Ext00:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( ZmFxSpark2Ext00, event )
								else
									ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								ZmFxSpark2Ext00Frame5( ZmFxSpark2Ext00, event )
								return 
							else
								ZmFxSpark2Ext00:beginAnimation( "keyframe", 359, false, false, CoD.TweenType.Linear )
								ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame5 )
							end
						end
						
						if event.interrupted then
							ZmFxSpark2Ext00Frame4( ZmFxSpark2Ext00, event )
							return 
						else
							ZmFxSpark2Ext00:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							ZmFxSpark2Ext00:setAlpha( 1 )
							ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark2Ext00Frame3( ZmFxSpark2Ext00, event )
						return 
					else
						ZmFxSpark2Ext00:beginAnimation( "keyframe", 2180, false, false, CoD.TweenType.Linear )
						ZmFxSpark2Ext00:registerEventHandler( "transition_complete_keyframe", ZmFxSpark2Ext00Frame3 )
					end
				end
				
				ZmFxSpark2Ext00:completeAnimation()
				self.ZmFxSpark2Ext00:setLeftRight( true, false, 417.99, 469.33 )
				self.ZmFxSpark2Ext00:setTopBottom( true, false, 0, 41 )
				self.ZmFxSpark2Ext00:setAlpha( 0 )
				ZmFxSpark2Ext00Frame2( ZmFxSpark2Ext00, {} )
				local XPlogoAddFrame2 = function ( XPlogoAdd, event )
					local XPlogoAddFrame3 = function ( XPlogoAdd, event )
						local XPlogoAddFrame4 = function ( XPlogoAdd, event )
							local XPlogoAddFrame5 = function ( XPlogoAdd, event )
								local XPlogoAddFrame6 = function ( XPlogoAdd, event )
									local XPlogoAddFrame7 = function ( XPlogoAdd, event )
										local XPlogoAddFrame8 = function ( XPlogoAdd, event )
											local XPlogoAddFrame9 = function ( XPlogoAdd, event )
												local XPlogoAddFrame10 = function ( XPlogoAdd, event )
													local XPlogoAddFrame11 = function ( XPlogoAdd, event )
														local XPlogoAddFrame12 = function ( XPlogoAdd, event )
															local XPlogoAddFrame13 = function ( XPlogoAdd, event )
																local XPlogoAddFrame14 = function ( XPlogoAdd, event )
																	local XPlogoAddFrame15 = function ( XPlogoAdd, event )
																		if not event.interrupted then
																			XPlogoAdd:beginAnimation( "keyframe", 1070, false, false, CoD.TweenType.Linear )
																		end
																		XPlogoAdd:setAlpha( 0 )
																		if event.interrupted then
																			self.clipFinished( XPlogoAdd, event )
																		else
																			XPlogoAdd:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																		end
																	end
																	
																	if event.interrupted then
																		XPlogoAddFrame15( XPlogoAdd, event )
																		return 
																	else
																		XPlogoAdd:beginAnimation( "keyframe", 1369, false, false, CoD.TweenType.Linear )
																		XPlogoAdd:setAlpha( 1 )
																		XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame15 )
																	end
																end
																
																if event.interrupted then
																	XPlogoAddFrame14( XPlogoAdd, event )
																	return 
																else
																	XPlogoAdd:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
																	XPlogoAdd:setAlpha( 0 )
																	XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame14 )
																end
															end
															
															if event.interrupted then
																XPlogoAddFrame13( XPlogoAdd, event )
																return 
															else
																XPlogoAdd:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
																XPlogoAdd:setAlpha( 1 )
																XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame13 )
															end
														end
														
														if event.interrupted then
															XPlogoAddFrame12( XPlogoAdd, event )
															return 
														else
															XPlogoAdd:beginAnimation( "keyframe", 619, false, false, CoD.TweenType.Linear )
															XPlogoAdd:setAlpha( 0 )
															XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame12 )
														end
													end
													
													if event.interrupted then
														XPlogoAddFrame11( XPlogoAdd, event )
														return 
													else
														XPlogoAdd:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
														XPlogoAdd:setAlpha( 1 )
														XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame11 )
													end
												end
												
												if event.interrupted then
													XPlogoAddFrame10( XPlogoAdd, event )
													return 
												else
													XPlogoAdd:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
													XPlogoAdd:setAlpha( 0 )
													XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame10 )
												end
											end
											
											if event.interrupted then
												XPlogoAddFrame9( XPlogoAdd, event )
												return 
											else
												XPlogoAdd:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame9 )
											end
										end
										
										if event.interrupted then
											XPlogoAddFrame8( XPlogoAdd, event )
											return 
										else
											XPlogoAdd:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											XPlogoAdd:setAlpha( 1 )
											XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame8 )
										end
									end
									
									if event.interrupted then
										XPlogoAddFrame7( XPlogoAdd, event )
										return 
									else
										XPlogoAdd:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										XPlogoAdd:setAlpha( 0.3 )
										XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame7 )
									end
								end
								
								if event.interrupted then
									XPlogoAddFrame6( XPlogoAdd, event )
									return 
								else
									XPlogoAdd:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									XPlogoAdd:setAlpha( 0.75 )
									XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame6 )
								end
							end
							
							if event.interrupted then
								XPlogoAddFrame5( XPlogoAdd, event )
								return 
							else
								XPlogoAdd:beginAnimation( "keyframe", 3039, false, false, CoD.TweenType.Linear )
								XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame5 )
							end
						end
						
						if event.interrupted then
							XPlogoAddFrame4( XPlogoAdd, event )
							return 
						else
							XPlogoAdd:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame4 )
						end
					end
					
					if event.interrupted then
						XPlogoAddFrame3( XPlogoAdd, event )
						return 
					else
						XPlogoAdd:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						XPlogoAdd:registerEventHandler( "transition_complete_keyframe", XPlogoAddFrame3 )
					end
				end
				
				XPlogoAdd:completeAnimation()
				self.XPlogoAdd:setAlpha( 0 )
				XPlogoAddFrame2( XPlogoAdd, {} )
				local f2_local8 = function ( f84_arg0, f84_arg1 )
					local f84_local0 = function ( f85_arg0, f85_arg1 )
						local f85_local0 = function ( f86_arg0, f86_arg1 )
							local f86_local0 = function ( f87_arg0, f87_arg1 )
								local f87_local0 = function ( f88_arg0, f88_arg1 )
									local f88_local0 = function ( f89_arg0, f89_arg1 )
										if not f89_arg1.interrupted then
											f89_arg0:beginAnimation( "keyframe", 1070, false, false, CoD.TweenType.Linear )
										end
										f89_arg0:setAlpha( 0 )
										if f89_arg1.interrupted then
											self.clipFinished( f89_arg0, f89_arg1 )
										else
											f89_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f88_arg1.interrupted then
										f88_local0( f88_arg0, f88_arg1 )
										return 
									else
										f88_arg0:beginAnimation( "keyframe", 3719, false, false, CoD.TweenType.Linear )
										f88_arg0:registerEventHandler( "transition_complete_keyframe", f88_local0 )
									end
								end
								
								if f87_arg1.interrupted then
									f87_local0( f87_arg0, f87_arg1 )
									return 
								else
									f87_arg0:beginAnimation( "keyframe", 920, false, false, CoD.TweenType.Linear )
									f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
								end
							end
							
							if f86_arg1.interrupted then
								f86_local0( f86_arg0, f86_arg1 )
								return 
							else
								f86_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								f86_arg0:setAlpha( 1 )
								f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
							end
						end
						
						if f85_arg1.interrupted then
							f85_local0( f85_arg0, f85_arg1 )
							return 
						else
							f85_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							f85_arg0:setAlpha( 0.3 )
							f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
						end
					end
					
					if f84_arg1.interrupted then
						f84_local0( f84_arg0, f84_arg1 )
						return 
					else
						f84_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f84_arg0:setAlpha( 0.59 )
						f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
					end
				end
				
				XPlogo:beginAnimation( "keyframe", 3670, false, false, CoD.TweenType.Linear )
				XPlogo:setAlpha( 0 )
				XPlogo:registerEventHandler( "transition_complete_keyframe", f2_local8 )
				local f2_local9 = function ( f90_arg0, f90_arg1 )
					local f90_local0 = function ( f91_arg0, f91_arg1 )
						local f91_local0 = function ( f92_arg0, f92_arg1 )
							local f92_local0 = function ( f93_arg0, f93_arg1 )
								local f93_local0 = function ( f94_arg0, f94_arg1 )
									local f94_local0 = function ( f95_arg0, f95_arg1 )
										if not f95_arg1.interrupted then
											f95_arg0:beginAnimation( "keyframe", 1320, false, false, CoD.TweenType.Linear )
										end
										f95_arg0:setAlpha( 0 )
										f95_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
										f95_arg0:setShaderVector( 0, 0, 1, 0, 0 )
										f95_arg0:setShaderVector( 1, 0, 0, 0, 0 )
										f95_arg0:setShaderVector( 2, 0, 1.29, 0, 0 )
										f95_arg0:setShaderVector( 3, 0, 0.24, 0, 0 )
										if f95_arg1.interrupted then
											self.clipFinished( f95_arg0, f95_arg1 )
										else
											f95_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f94_arg1.interrupted then
										f94_local0( f94_arg0, f94_arg1 )
										return 
									else
										f94_arg0:beginAnimation( "keyframe", 1369, false, false, CoD.TweenType.Linear )
										f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
									end
								end
								
								if f93_arg1.interrupted then
									f93_local0( f93_arg0, f93_arg1 )
									return 
								else
									f93_arg0:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
									f93_arg0:setAlpha( 1 )
									f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
								end
							end
							
							if f92_arg1.interrupted then
								f92_local0( f92_arg0, f92_arg1 )
								return 
							else
								f92_arg0:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
								f92_arg0:setAlpha( 0.39 )
								f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
							end
						end
						
						if f91_arg1.interrupted then
							f91_local0( f91_arg0, f91_arg1 )
							return 
						else
							f91_arg0:beginAnimation( "keyframe", 1280, false, false, CoD.TweenType.Linear )
							f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
						end
					end
					
					if f90_arg1.interrupted then
						f90_local0( f90_arg0, f90_arg1 )
						return 
					else
						f90_arg0:beginAnimation( "keyframe", 970, false, false, CoD.TweenType.Linear )
						f90_arg0:setShaderVector( 2, 0, 1.29, 0, 0 )
						f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
					end
				end
				
				lavaFrameAdd:beginAnimation( "keyframe", 2799, false, false, CoD.TweenType.Linear )
				lavaFrameAdd:setAlpha( 1 )
				lavaFrameAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
				lavaFrameAdd:setShaderVector( 0, 0, 1, 0, 0 )
				lavaFrameAdd:setShaderVector( 1, 0, 0, 0, 0 )
				lavaFrameAdd:setShaderVector( 2, 0, -0.08, 0, 0 )
				lavaFrameAdd:setShaderVector( 3, 0, 0.24, 0, 0 )
				lavaFrameAdd:registerEventHandler( "transition_complete_keyframe", f2_local9 )
				local lavaFrameFrame2 = function ( lavaFrame, event )
					local lavaFrameFrame3 = function ( lavaFrame, event )
						local lavaFrameFrame4 = function ( lavaFrame, event )
							local lavaFrameFrame5 = function ( lavaFrame, event )
								local lavaFrameFrame6 = function ( lavaFrame, event )
									local lavaFrameFrame7 = function ( lavaFrame, event )
										if not event.interrupted then
											lavaFrame:beginAnimation( "keyframe", 1320, false, false, CoD.TweenType.Linear )
										end
										lavaFrame:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( lavaFrame, event )
										else
											lavaFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										lavaFrameFrame7( lavaFrame, event )
										return 
									else
										lavaFrame:beginAnimation( "keyframe", 2960, false, false, CoD.TweenType.Linear )
										lavaFrame:registerEventHandler( "transition_complete_keyframe", lavaFrameFrame7 )
									end
								end
								
								if event.interrupted then
									lavaFrameFrame6( lavaFrame, event )
									return 
								else
									lavaFrame:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
									lavaFrame:setAlpha( 1 )
									lavaFrame:registerEventHandler( "transition_complete_keyframe", lavaFrameFrame6 )
								end
							end
							
							if event.interrupted then
								lavaFrameFrame5( lavaFrame, event )
								return 
							else
								lavaFrame:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
								lavaFrame:setAlpha( 0.45 )
								lavaFrame:registerEventHandler( "transition_complete_keyframe", lavaFrameFrame5 )
							end
						end
						
						if event.interrupted then
							lavaFrameFrame4( lavaFrame, event )
							return 
						else
							lavaFrame:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							lavaFrame:setAlpha( 1 )
							lavaFrame:registerEventHandler( "transition_complete_keyframe", lavaFrameFrame4 )
						end
					end
					
					if event.interrupted then
						lavaFrameFrame3( lavaFrame, event )
						return 
					else
						lavaFrame:beginAnimation( "keyframe", 3769, false, false, CoD.TweenType.Linear )
						lavaFrame:registerEventHandler( "transition_complete_keyframe", lavaFrameFrame3 )
					end
				end
				
				lavaFrame:completeAnimation()
				self.lavaFrame:setAlpha( 0 )
				lavaFrameFrame2( lavaFrame, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark2Ext0:close()
		element.ZmFxSpark2Ext00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
