require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_HeldItemSquare" )
require( "ui.uieditor.widgets.HUD.Flag.PlayerFlag" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_IventoryBox" )

CoD.AmmoWidgetMP_HeldItem = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_HeldItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_HeldItem )
	self.id = "AmmoWidgetMP_HeldItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 43 )
	self:setTopBottom( true, false, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local AmmoWidgetMPHeldItemSquare0 = CoD.AmmoWidgetMP_HeldItemSquare.new( menu, controller )
	AmmoWidgetMPHeldItemSquare0:setLeftRight( false, false, -18, 17.7 )
	AmmoWidgetMPHeldItemSquare0:setTopBottom( false, true, -33.5, -2 )
	AmmoWidgetMPHeldItemSquare0:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	AmmoWidgetMPHeldItemSquare0:setAlpha( 0.5 )
	AmmoWidgetMPHeldItemSquare0.Image0:setRGB( 1, 1, 1 )
	self:addElement( AmmoWidgetMPHeldItemSquare0 )
	self.AmmoWidgetMPHeldItemSquare0 = AmmoWidgetMPHeldItemSquare0
	
	local PlayerFlag0 = CoD.PlayerFlag.new( menu, controller )
	PlayerFlag0:setLeftRight( false, false, -12, 12 )
	PlayerFlag0:setTopBottom( false, true, -29.5, -5.5 )
	PlayerFlag0:setRGB( 0, 0, 0 )
	PlayerFlag0.FlagTemp:setRGB( 1, 1, 1 )
	self:addElement( PlayerFlag0 )
	self.PlayerFlag0 = PlayerFlag0
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( false, false, -44.5, 45.51 )
	Glow1:setTopBottom( false, true, -123.5, -33.5 )
	Glow1:setRGB( 0, 0, 0 )
	Glow1:setAlpha( 0 )
	Glow1:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	local InventoryBox1 = CoD.AmmoWidget_IventoryBox.new( menu, controller )
	InventoryBox1:setLeftRight( false, false, -20.33, 21.34 )
	InventoryBox1:setTopBottom( false, true, -35, 0.33 )
	InventoryBox1:setRGB( 1, 1, 1 )
	InventoryBox1:setAlpha( 0.5 )
	InventoryBox1:setZoom( 1 )
	InventoryBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	InventoryBox1:setShaderVector( 0, 0.1, 1, 0, 0 )
	InventoryBox1:setShaderVector( 1, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 2, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 3, 0, 0, 0, 0 )
	InventoryBox1:setShaderVector( 4, 0, 0, 0, 0 )
	InventoryBox1:mergeStateConditions( {
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( InventoryBox1 )
	self.InventoryBox1 = InventoryBox1
	
	local PlayerFlag = CoD.PlayerFlag.new( menu, controller )
	PlayerFlag:setLeftRight( false, false, -12, 12 )
	PlayerFlag:setTopBottom( false, true, -30, -6 )
	PlayerFlag:setRGB( 1, 1, 1 )
	PlayerFlag:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	PlayerFlag:setShaderVector( 0, 0.05, 0, 0, 0 )
	PlayerFlag:setShaderVector( 1, 0.1, 0, 0, 0 )
	PlayerFlag:setShaderVector( 2, 0, 0, 0, 0 )
	PlayerFlag:setShaderVector( 3, 0, 0, 0, 0 )
	PlayerFlag:setShaderVector( 4, 0, 0, 0, 0 )
	PlayerFlag.FlagTemp:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	self:addElement( PlayerFlag )
	self.PlayerFlag = PlayerFlag
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -24.5, 24.5 )
	Glow:setTopBottom( false, true, -42.5, 6.5 )
	Glow:setRGB( 1, 0.54, 0.48 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local imgBoxLethal = LUI.UIImage.new()
	imgBoxLethal:setLeftRight( false, false, -42.72, 43.73 )
	imgBoxLethal:setTopBottom( false, true, -55.67, 19.67 )
	imgBoxLethal:setRGB( 0.11, 0.31, 0.39 )
	imgBoxLethal:setAlpha( 0 )
	imgBoxLethal:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_inventorybox" ) )
	imgBoxLethal:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgBoxLethal )
	self.imgBoxLethal = imgBoxLethal
	
	local Glow0 = LUI.UIImage.new()
	Glow0:setLeftRight( false, false, -105, 106.01 )
	Glow0:setTopBottom( false, true, -84.84, -61.84 )
	Glow0:setRGB( 1, 0.26, 0 )
	Glow0:setAlpha( 0 )
	Glow0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local HuxBlur = LUI.UIImage.new()
	HuxBlur:setLeftRight( false, false, -43.6, 44.61 )
	HuxBlur:setTopBottom( false, true, -59.42, 23.42 )
	HuxBlur:setRGB( 1, 1, 1 )
	HuxBlur:setAlpha( 0 )
	HuxBlur:setImage( RegisterImage( "uie_t7_mp_menu_startflow_hexblur" ) )
	HuxBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HuxBlur )
	self.HuxBlur = HuxBlur
	
	local Glow00 = LUI.UIImage.new()
	Glow00:setLeftRight( false, false, -105, 106.01 )
	Glow00:setTopBottom( false, true, -84.84, -61.84 )
	Glow00:setRGB( 1, 0.43, 0 )
	Glow00:setAlpha( 0 )
	Glow00:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow00 )
	self.Glow00 = Glow00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				AmmoWidgetMPHeldItemSquare0:completeAnimation()
				self.AmmoWidgetMPHeldItemSquare0:setAlpha( 0 )
				self.clipFinished( AmmoWidgetMPHeldItemSquare0, {} )
				PlayerFlag0:completeAnimation()
				self.PlayerFlag0:setAlpha( 0 )
				self.clipFinished( PlayerFlag0, {} )
				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( Glow1, {} )
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0 )
				self.clipFinished( InventoryBox1, {} )
				PlayerFlag:completeAnimation()
				self.PlayerFlag:setLeftRight( false, false, -12, 12 )
				self.PlayerFlag:setTopBottom( false, true, -115.5, -91.5 )
				self.PlayerFlag:setAlpha( 0 )
				self.clipFinished( PlayerFlag, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( false, false, -24.5, 24.5 )
				self.Glow:setTopBottom( false, true, -128, -79 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				imgBoxLethal:completeAnimation()
				self.imgBoxLethal:setLeftRight( false, false, -19.5, 19.5 )
				self.imgBoxLethal:setTopBottom( false, true, -121, -84 )
				self.imgBoxLethal:setRGB( 0.09, 0.72, 1 )
				self.imgBoxLethal:setAlpha( 0 )
				self.clipFinished( imgBoxLethal, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -105, 106 )
				self.Glow0:setTopBottom( false, true, -114, -91 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 10 )
				local AmmoWidgetMPHeldItemSquare0Frame2 = function ( AmmoWidgetMPHeldItemSquare0, event )
					local AmmoWidgetMPHeldItemSquare0Frame3 = function ( AmmoWidgetMPHeldItemSquare0, event )
						if not event.interrupted then
							AmmoWidgetMPHeldItemSquare0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						AmmoWidgetMPHeldItemSquare0:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( AmmoWidgetMPHeldItemSquare0, event )
						else
							AmmoWidgetMPHeldItemSquare0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoWidgetMPHeldItemSquare0Frame3( AmmoWidgetMPHeldItemSquare0, event )
						return 
					else
						AmmoWidgetMPHeldItemSquare0:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						AmmoWidgetMPHeldItemSquare0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetMPHeldItemSquare0Frame3 )
					end
				end
				
				AmmoWidgetMPHeldItemSquare0:completeAnimation()
				self.AmmoWidgetMPHeldItemSquare0:setAlpha( 0 )
				AmmoWidgetMPHeldItemSquare0Frame2( AmmoWidgetMPHeldItemSquare0, {} )
				local PlayerFlag0Frame2 = function ( PlayerFlag0, event )
					local PlayerFlag0Frame3 = function ( PlayerFlag0, event )
						if not event.interrupted then
							PlayerFlag0:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						PlayerFlag0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( PlayerFlag0, event )
						else
							PlayerFlag0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PlayerFlag0Frame3( PlayerFlag0, event )
						return 
					else
						PlayerFlag0:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						PlayerFlag0:registerEventHandler( "transition_complete_keyframe", PlayerFlag0Frame3 )
					end
				end
				
				PlayerFlag0:completeAnimation()
				self.PlayerFlag0:setAlpha( 0 )
				PlayerFlag0Frame2( PlayerFlag0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						local Glow1Frame4 = function ( Glow1, event )
							local Glow1Frame5 = function ( Glow1, event )
								if not event.interrupted then
									Glow1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
								end
								Glow1:setLeftRight( false, false, -44.49, 45.51 )
								Glow1:setTopBottom( false, true, -123.5, -33.5 )
								Glow1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow1, event )
								else
									Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame5 )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							Glow1:setAlpha( 0.4 )
							Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame4 )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, -44.49, 45.51 )
				self.Glow1:setTopBottom( false, true, -123.5, -33.5 )
				self.Glow1:setAlpha( 0 )
				Glow1Frame2( Glow1, {} )
				local InventoryBox1Frame2 = function ( InventoryBox1, event )
					local InventoryBox1Frame3 = function ( InventoryBox1, event )
						local InventoryBox1Frame4 = function ( InventoryBox1, event )
							local InventoryBox1Frame5 = function ( InventoryBox1, event )
								local InventoryBox1Frame6 = function ( InventoryBox1, event )
									local InventoryBox1Frame7 = function ( InventoryBox1, event )
										local InventoryBox1Frame8 = function ( InventoryBox1, event )
											local InventoryBox1Frame9 = function ( InventoryBox1, event )
												local InventoryBox1Frame10 = function ( InventoryBox1, event )
													local InventoryBox1Frame11 = function ( InventoryBox1, event )
														if not event.interrupted then
															InventoryBox1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
														end
														InventoryBox1:setAlpha( 0.5 )
														if event.interrupted then
															self.clipFinished( InventoryBox1, event )
														else
															InventoryBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														InventoryBox1Frame11( InventoryBox1, event )
														return 
													else
														InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														InventoryBox1:setAlpha( 0.4 )
														InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame11 )
													end
												end
												
												if event.interrupted then
													InventoryBox1Frame10( InventoryBox1, event )
													return 
												else
													InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame10 )
												end
											end
											
											if event.interrupted then
												InventoryBox1Frame9( InventoryBox1, event )
												return 
											else
												InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												InventoryBox1:setAlpha( 0.2 )
												InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame9 )
											end
										end
										
										if event.interrupted then
											InventoryBox1Frame8( InventoryBox1, event )
											return 
										else
											InventoryBox1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame8 )
										end
									end
									
									if event.interrupted then
										InventoryBox1Frame7( InventoryBox1, event )
										return 
									else
										InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										InventoryBox1:setAlpha( 0.4 )
										InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame7 )
									end
								end
								
								if event.interrupted then
									InventoryBox1Frame6( InventoryBox1, event )
									return 
								else
									InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame6 )
								end
							end
							
							if event.interrupted then
								InventoryBox1Frame5( InventoryBox1, event )
								return 
							else
								InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								InventoryBox1:setAlpha( 0.1 )
								InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame5 )
							end
						end
						
						if event.interrupted then
							InventoryBox1Frame4( InventoryBox1, event )
							return 
						else
							InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame4 )
						end
					end
					
					if event.interrupted then
						InventoryBox1Frame3( InventoryBox1, event )
						return 
					else
						InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						InventoryBox1:setAlpha( 0.4 )
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0 )
				InventoryBox1Frame2( InventoryBox1, {} )
				local PlayerFlagFrame2 = function ( PlayerFlag, event )
					local PlayerFlagFrame3 = function ( PlayerFlag, event )
						local PlayerFlagFrame4 = function ( PlayerFlag, event )
							local PlayerFlagFrame5 = function ( PlayerFlag, event )
								local PlayerFlagFrame6 = function ( PlayerFlag, event )
									local PlayerFlagFrame7 = function ( PlayerFlag, event )
										local PlayerFlagFrame8 = function ( PlayerFlag, event )
											local PlayerFlagFrame9 = function ( PlayerFlag, event )
												local PlayerFlagFrame10 = function ( PlayerFlag, event )
													local PlayerFlagFrame11 = function ( PlayerFlag, event )
														local PlayerFlagFrame12 = function ( PlayerFlag, event )
															local PlayerFlagFrame13 = function ( PlayerFlag, event )
																local PlayerFlagFrame14 = function ( PlayerFlag, event )
																	local PlayerFlagFrame15 = function ( PlayerFlag, event )
																		local PlayerFlagFrame16 = function ( PlayerFlag, event )
																			local PlayerFlagFrame17 = function ( PlayerFlag, event )
																				local PlayerFlagFrame18 = function ( PlayerFlag, event )
																					local PlayerFlagFrame19 = function ( PlayerFlag, event )
																						local PlayerFlagFrame20 = function ( PlayerFlag, event )
																							local PlayerFlagFrame21 = function ( PlayerFlag, event )
																								local PlayerFlagFrame22 = function ( PlayerFlag, event )
																									if not event.interrupted then
																										PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									end
																									PlayerFlag:setLeftRight( false, false, -12, 12 )
																									PlayerFlag:setTopBottom( false, true, -30, -6 )
																									PlayerFlag:setAlpha( 1 )
																									if event.interrupted then
																										self.clipFinished( PlayerFlag, event )
																									else
																										PlayerFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																									end
																								end
																								
																								if event.interrupted then
																									PlayerFlagFrame22( PlayerFlag, event )
																									return 
																								else
																									PlayerFlag:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								PlayerFlagFrame21( PlayerFlag, event )
																								return 
																							else
																								PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								PlayerFlag:setAlpha( 0.6 )
																								PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							PlayerFlagFrame20( PlayerFlag, event )
																							return 
																						else
																							PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						PlayerFlagFrame19( PlayerFlag, event )
																						return 
																					else
																						PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						PlayerFlag:setAlpha( 1 )
																						PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					PlayerFlagFrame18( PlayerFlag, event )
																					return 
																				else
																					PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				PlayerFlagFrame17( PlayerFlag, event )
																				return 
																			else
																				PlayerFlag:beginAnimation( "keyframe", 9, true, false, CoD.TweenType.Linear )
																				PlayerFlag:setAlpha( 0.37 )
																				PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PlayerFlagFrame16( PlayerFlag, event )
																			return 
																		else
																			PlayerFlag:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																			PlayerFlag:setTopBottom( false, true, -30, -6 )
																			PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PlayerFlagFrame15( PlayerFlag, event )
																		return 
																	else
																		PlayerFlag:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
																		PlayerFlag:setTopBottom( false, true, -85.84, -61.84 )
																		PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame15 )
																	end
																end
																
																if event.interrupted then
																	PlayerFlagFrame14( PlayerFlag, event )
																	return 
																else
																	PlayerFlag:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	PlayerFlag:setAlpha( 1 )
																	PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame14 )
																end
															end
															
															if event.interrupted then
																PlayerFlagFrame13( PlayerFlag, event )
																return 
															else
																PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame13 )
															end
														end
														
														if event.interrupted then
															PlayerFlagFrame12( PlayerFlag, event )
															return 
														else
															PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															PlayerFlag:setAlpha( 0.75 )
															PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame12 )
														end
													end
													
													if event.interrupted then
														PlayerFlagFrame11( PlayerFlag, event )
														return 
													else
														PlayerFlag:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame11 )
													end
												end
												
												if event.interrupted then
													PlayerFlagFrame10( PlayerFlag, event )
													return 
												else
													PlayerFlag:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													PlayerFlag:setAlpha( 1 )
													PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame10 )
												end
											end
											
											if event.interrupted then
												PlayerFlagFrame9( PlayerFlag, event )
												return 
											else
												PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame9 )
											end
										end
										
										if event.interrupted then
											PlayerFlagFrame8( PlayerFlag, event )
											return 
										else
											PlayerFlag:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											PlayerFlag:setAlpha( 0.4 )
											PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame8 )
										end
									end
									
									if event.interrupted then
										PlayerFlagFrame7( PlayerFlag, event )
										return 
									else
										PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame7 )
									end
								end
								
								if event.interrupted then
									PlayerFlagFrame6( PlayerFlag, event )
									return 
								else
									PlayerFlag:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									PlayerFlag:setAlpha( 1 )
									PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame6 )
								end
							end
							
							if event.interrupted then
								PlayerFlagFrame5( PlayerFlag, event )
								return 
							else
								PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerFlagFrame4( PlayerFlag, event )
							return 
						else
							PlayerFlag:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							PlayerFlag:setAlpha( 0.66 )
							PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerFlagFrame3( PlayerFlag, event )
						return 
					else
						PlayerFlag:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame3 )
					end
				end
				
				PlayerFlag:completeAnimation()
				self.PlayerFlag:setLeftRight( false, false, -12, 12 )
				self.PlayerFlag:setTopBottom( false, true, -85.84, -61.84 )
				self.PlayerFlag:setAlpha( 0 )
				PlayerFlagFrame2( PlayerFlag, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													local GlowFrame11 = function ( Glow, event )
														local GlowFrame12 = function ( Glow, event )
															local GlowFrame13 = function ( Glow, event )
																local GlowFrame14 = function ( Glow, event )
																	local GlowFrame15 = function ( Glow, event )
																		local GlowFrame16 = function ( Glow, event )
																			local GlowFrame17 = function ( Glow, event )
																				local GlowFrame18 = function ( Glow, event )
																					local GlowFrame19 = function ( Glow, event )
																						local GlowFrame20 = function ( Glow, event )
																							local GlowFrame21 = function ( Glow, event )
																								local GlowFrame22 = function ( Glow, event )
																									local GlowFrame23 = function ( Glow, event )
																										local GlowFrame24 = function ( Glow, event )
																											if not event.interrupted then
																												Glow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																											end
																											Glow:setLeftRight( false, false, -24.5, 24.5 )
																											Glow:setTopBottom( false, true, -42.5, 6.5 )
																											Glow:setRGB( 1, 0.54, 0.48 )
																											Glow:setAlpha( 0 )
																											if event.interrupted then
																												self.clipFinished( Glow, event )
																											else
																												Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																											end
																										end
																										
																										if event.interrupted then
																											GlowFrame24( Glow, event )
																											return 
																										else
																											Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											Glow:setAlpha( 0.88 )
																											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										GlowFrame23( Glow, event )
																										return 
																									else
																										Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									GlowFrame22( Glow, event )
																									return 
																								else
																									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									Glow:setAlpha( 0.64 )
																									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								GlowFrame21( Glow, event )
																								return 
																							else
																								Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							GlowFrame20( Glow, event )
																							return 
																						else
																							Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							Glow:setAlpha( 1 )
																							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						GlowFrame19( Glow, event )
																						return 
																					else
																						Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					GlowFrame18( Glow, event )
																					return 
																				else
																					Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					Glow:setAlpha( 0.43 )
																					Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				GlowFrame17( Glow, event )
																				return 
																			else
																				Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			GlowFrame16( Glow, event )
																			return 
																		else
																			Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			Glow:setAlpha( 1 )
																			Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		GlowFrame15( Glow, event )
																		return 
																	else
																		Glow:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																		Glow:setTopBottom( false, true, -42.5, 6.5 )
																		Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame15 )
																	end
																end
																
																if event.interrupted then
																	GlowFrame14( Glow, event )
																	return 
																else
																	Glow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
																	Glow:setTopBottom( false, true, -97.92, -48.92 )
																	Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame14 )
																end
															end
															
															if event.interrupted then
																GlowFrame13( Glow, event )
																return 
															else
																Glow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																Glow:setAlpha( 0 )
																Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame13 )
															end
														end
														
														if event.interrupted then
															GlowFrame12( Glow, event )
															return 
														else
															Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															Glow:setAlpha( 1 )
															Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame12 )
														end
													end
													
													if event.interrupted then
														GlowFrame11( Glow, event )
														return 
													else
														Glow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame11 )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Glow:setAlpha( 0.71 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 1 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.25 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.69 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( false, false, -24.5, 24.5 )
				self.Glow:setTopBottom( false, true, -97.92, -48.92 )
				self.Glow:setRGB( 1, 0.54, 0.48 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local imgBoxLethalFrame2 = function ( imgBoxLethal, event )
					local imgBoxLethalFrame3 = function ( imgBoxLethal, event )
						local imgBoxLethalFrame4 = function ( imgBoxLethal, event )
							local imgBoxLethalFrame5 = function ( imgBoxLethal, event )
								local imgBoxLethalFrame6 = function ( imgBoxLethal, event )
									local imgBoxLethalFrame7 = function ( imgBoxLethal, event )
										local imgBoxLethalFrame8 = function ( imgBoxLethal, event )
											local imgBoxLethalFrame9 = function ( imgBoxLethal, event )
												local imgBoxLethalFrame10 = function ( imgBoxLethal, event )
													local imgBoxLethalFrame11 = function ( imgBoxLethal, event )
														local imgBoxLethalFrame12 = function ( imgBoxLethal, event )
															local imgBoxLethalFrame13 = function ( imgBoxLethal, event )
																if not event.interrupted then
																	imgBoxLethal:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																end
																imgBoxLethal:setLeftRight( false, false, -42.72, 43.73 )
																imgBoxLethal:setTopBottom( false, true, -55.67, 19.67 )
																imgBoxLethal:setRGB( 0.11, 0.31, 0.39 )
																imgBoxLethal:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( imgBoxLethal, event )
																else
																	imgBoxLethal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																imgBoxLethalFrame13( imgBoxLethal, event )
																return 
															else
																imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																imgBoxLethal:setLeftRight( false, false, -29.38, 29.66 )
																imgBoxLethal:setTopBottom( false, true, -43.3, 8.14 )
																imgBoxLethal:setAlpha( 0.62 )
																imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame13 )
															end
														end
														
														if event.interrupted then
															imgBoxLethalFrame12( imgBoxLethal, event )
															return 
														else
															imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															imgBoxLethal:setLeftRight( false, false, -28.78, 29.02 )
															imgBoxLethal:setTopBottom( false, true, -42.74, 7.62 )
															imgBoxLethal:setAlpha( 0.2 )
															imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame12 )
														end
													end
													
													if event.interrupted then
														imgBoxLethalFrame11( imgBoxLethal, event )
														return 
													else
														imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														imgBoxLethal:setLeftRight( false, false, -28.17, 28.38 )
														imgBoxLethal:setTopBottom( false, true, -42.18, 7.09 )
														imgBoxLethal:setAlpha( 0.05 )
														imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame11 )
													end
												end
												
												if event.interrupted then
													imgBoxLethalFrame10( imgBoxLethal, event )
													return 
												else
													imgBoxLethal:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													imgBoxLethal:setLeftRight( false, false, -27.56, 27.74 )
													imgBoxLethal:setTopBottom( false, true, -41.62, 6.57 )
													imgBoxLethal:setAlpha( 0.71 )
													imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame10 )
												end
											end
											
											if event.interrupted then
												imgBoxLethalFrame9( imgBoxLethal, event )
												return 
											else
												imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												imgBoxLethal:setLeftRight( false, false, -24.53, 24.54 )
												imgBoxLethal:setTopBottom( false, true, -38.81, 3.95 )
												imgBoxLethal:setAlpha( 0.85 )
												imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame9 )
											end
										end
										
										if event.interrupted then
											imgBoxLethalFrame8( imgBoxLethal, event )
											return 
										else
											imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											imgBoxLethal:setLeftRight( false, false, -23.93, 23.9 )
											imgBoxLethal:setTopBottom( false, true, -38.25, 3.43 )
											imgBoxLethal:setAlpha( 0.28 )
											imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame8 )
										end
									end
									
									if event.interrupted then
										imgBoxLethalFrame7( imgBoxLethal, event )
										return 
									else
										imgBoxLethal:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										imgBoxLethal:setLeftRight( false, false, -23.32, 23.26 )
										imgBoxLethal:setTopBottom( false, true, -37.69, 2.9 )
										imgBoxLethal:setAlpha( 0.43 )
										imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame7 )
									end
								end
								
								if event.interrupted then
									imgBoxLethalFrame6( imgBoxLethal, event )
									return 
								else
									imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									imgBoxLethal:setLeftRight( false, false, -21.5, 21.34 )
									imgBoxLethal:setTopBottom( false, true, -36, 1.33 )
									imgBoxLethal:setAlpha( 1 )
									imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame6 )
								end
							end
							
							if event.interrupted then
								imgBoxLethalFrame5( imgBoxLethal, event )
								return 
							else
								imgBoxLethal:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
								imgBoxLethal:setLeftRight( false, false, -34.14, 35.15 )
								imgBoxLethal:setTopBottom( false, true, -134.18, -68.44 )
								imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame5 )
							end
						end
						
						if event.interrupted then
							imgBoxLethalFrame4( imgBoxLethal, event )
							return 
						else
							imgBoxLethal:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
							imgBoxLethal:setRGB( 0.11, 0.31, 0.39 )
							imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame4 )
						end
					end
					
					if event.interrupted then
						imgBoxLethalFrame3( imgBoxLethal, event )
						return 
					else
						imgBoxLethal:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame3 )
					end
				end
				
				imgBoxLethal:completeAnimation()
				self.imgBoxLethal:setLeftRight( false, false, -34.14, 35.15 )
				self.imgBoxLethal:setTopBottom( false, true, -134.18, -68.44 )
				self.imgBoxLethal:setRGB( 0.09, 0.72, 1 )
				self.imgBoxLethal:setAlpha( 0 )
				imgBoxLethalFrame2( imgBoxLethal, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									if not event.interrupted then
										Glow0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
									end
									Glow0:setLeftRight( false, false, -105, 106 )
									Glow0:setTopBottom( false, true, -84.84, -61.84 )
									Glow0:setRGB( 1, 0.26, 0 )
									Glow0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glow0, event )
									else
										Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Glow0:setAlpha( 1 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Glow0:setAlpha( 0.4 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 0.49 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -105, 106 )
				self.Glow0:setTopBottom( false, true, -84.84, -61.84 )
				self.Glow0:setRGB( 1, 0.26, 0 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				local HuxBlurFrame2 = function ( HuxBlur, event )
					local HuxBlurFrame3 = function ( HuxBlur, event )
						local HuxBlurFrame4 = function ( HuxBlur, event )
							local HuxBlurFrame5 = function ( HuxBlur, event )
								local HuxBlurFrame6 = function ( HuxBlur, event )
									local HuxBlurFrame7 = function ( HuxBlur, event )
										local HuxBlurFrame8 = function ( HuxBlur, event )
											if not event.interrupted then
												HuxBlur:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
											end
											HuxBlur:setLeftRight( false, false, -43.6, 44.61 )
											HuxBlur:setTopBottom( false, true, -59.42, 23.42 )
											HuxBlur:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( HuxBlur, event )
											else
												HuxBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											HuxBlurFrame8( HuxBlur, event )
											return 
										else
											HuxBlur:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											HuxBlur:setLeftRight( false, false, -18.7, 18.41 )
											HuxBlur:setTopBottom( false, true, -35, -0.15 )
											HuxBlur:setAlpha( 1 )
											HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame8 )
										end
									end
									
									if event.interrupted then
										HuxBlurFrame7( HuxBlur, event )
										return 
									else
										HuxBlur:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
										HuxBlur:setLeftRight( false, false, -18.77, 18.34 )
										HuxBlur:setTopBottom( false, true, -37.07, -2.22 )
										HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame7 )
									end
								end
								
								if event.interrupted then
									HuxBlurFrame6( HuxBlur, event )
									return 
								else
									HuxBlur:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									HuxBlur:setLeftRight( false, false, -42.7, 43.71 )
									HuxBlur:setTopBottom( false, true, -114.66, -33.5 )
									HuxBlur:setAlpha( 0 )
									HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame6 )
								end
							end
							
							if event.interrupted then
								HuxBlurFrame5( HuxBlur, event )
								return 
							else
								HuxBlur:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								HuxBlur:setLeftRight( false, false, -27.35, 28.36 )
								HuxBlur:setTopBottom( false, true, -99.81, -47.5 )
								HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame5 )
							end
						end
						
						if event.interrupted then
							HuxBlurFrame4( HuxBlur, event )
							return 
						else
							HuxBlur:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							HuxBlur:setAlpha( 1 )
							HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame4 )
						end
					end
					
					if event.interrupted then
						HuxBlurFrame3( HuxBlur, event )
						return 
					else
						HuxBlur:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame3 )
					end
				end
				
				HuxBlur:completeAnimation()
				self.HuxBlur:setLeftRight( false, false, -18.75, 19.76 )
				self.HuxBlur:setTopBottom( false, true, -91.5, -55.34 )
				self.HuxBlur:setAlpha( 0 )
				HuxBlurFrame2( HuxBlur, {} )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							local Glow00Frame5 = function ( Glow00, event )
								local Glow00Frame6 = function ( Glow00, event )
									if not event.interrupted then
										Glow00:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
									end
									Glow00:setRGB( 1, 0.43, 0 )
									Glow00:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glow00, event )
									else
										Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Glow00Frame6( Glow00, event )
									return 
								else
									Glow00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Glow00:setAlpha( 1 )
									Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame6 )
								end
							end
							
							if event.interrupted then
								Glow00Frame5( Glow00, event )
								return 
							else
								Glow00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Glow00:setAlpha( 0.25 )
								Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame5 )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Glow00:setAlpha( 0.6 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setRGB( 1, 0.43, 0 )
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				AmmoWidgetMPHeldItemSquare0:completeAnimation()
				self.AmmoWidgetMPHeldItemSquare0:setAlpha( 0.5 )
				self.clipFinished( AmmoWidgetMPHeldItemSquare0, {} )
				PlayerFlag0:completeAnimation()
				self.PlayerFlag0:setAlpha( 1 )
				self.clipFinished( PlayerFlag0, {} )
				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( Glow1, {} )
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0.5 )
				self.clipFinished( InventoryBox1, {} )
				PlayerFlag:completeAnimation()
				self.PlayerFlag:setLeftRight( false, false, -12, 12 )
				self.PlayerFlag:setTopBottom( false, true, -29.5, -5.5 )
				self.PlayerFlag:setAlpha( 1 )
				self.clipFinished( PlayerFlag, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( false, false, -24.5, 24.5 )
				self.Glow:setTopBottom( false, true, -41.76, 7.24 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				imgBoxLethal:completeAnimation()
				self.imgBoxLethal:setLeftRight( false, false, -42.72, 43.73 )
				self.imgBoxLethal:setTopBottom( false, true, -55.67, 19.67 )
				self.imgBoxLethal:setRGB( 0.11, 0.31, 0.39 )
				self.imgBoxLethal:setAlpha( 0 )
				self.clipFinished( imgBoxLethal, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -105, 106 )
				self.Glow0:setTopBottom( false, true, -114, -91 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 8 )
				local AmmoWidgetMPHeldItemSquare0Frame2 = function ( AmmoWidgetMPHeldItemSquare0, event )
					if not event.interrupted then
						AmmoWidgetMPHeldItemSquare0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
					end
					AmmoWidgetMPHeldItemSquare0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetMPHeldItemSquare0, event )
					else
						AmmoWidgetMPHeldItemSquare0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetMPHeldItemSquare0:completeAnimation()
				self.AmmoWidgetMPHeldItemSquare0:setAlpha( 0.5 )
				AmmoWidgetMPHeldItemSquare0Frame2( AmmoWidgetMPHeldItemSquare0, {} )
				local PlayerFlag0Frame2 = function ( PlayerFlag0, event )
					if not event.interrupted then
						PlayerFlag0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					PlayerFlag0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PlayerFlag0, event )
					else
						PlayerFlag0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayerFlag0:completeAnimation()
				self.PlayerFlag0:setAlpha( 1 )
				PlayerFlag0Frame2( PlayerFlag0, {} )
				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( Glow1, {} )
				local InventoryBox1Frame2 = function ( InventoryBox1, event )
					local InventoryBox1Frame3 = function ( InventoryBox1, event )
						if not event.interrupted then
							InventoryBox1:beginAnimation( "keyframe", 349, true, false, CoD.TweenType.Bounce )
						end
						InventoryBox1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( InventoryBox1, event )
						else
							InventoryBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						InventoryBox1Frame3( InventoryBox1, event )
						return 
					else
						InventoryBox1:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						InventoryBox1:setAlpha( 0.4 )
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0.5 )
				InventoryBox1Frame2( InventoryBox1, {} )
				local PlayerFlagFrame2 = function ( PlayerFlag, event )
					if not event.interrupted then
						PlayerFlag:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Bounce )
					end
					PlayerFlag:setLeftRight( false, false, -12, 12 )
					PlayerFlag:setTopBottom( false, true, -29.5, -5.5 )
					PlayerFlag:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( PlayerFlag, event )
					else
						PlayerFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PlayerFlag:completeAnimation()
				self.PlayerFlag:setLeftRight( false, false, -12, 12 )
				self.PlayerFlag:setTopBottom( false, true, -29.5, -5.5 )
				self.PlayerFlag:setAlpha( 1 )
				PlayerFlagFrame2( PlayerFlag, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						end
						Glow:setLeftRight( false, false, -24.5, 24.5 )
						Glow:setTopBottom( false, true, -41.76, 7.24 )
						Glow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 0.68 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( false, false, -24.5, 24.5 )
				self.Glow:setTopBottom( false, true, -41.76, 7.24 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				imgBoxLethal:completeAnimation()
				self.imgBoxLethal:setLeftRight( false, false, -42.72, 43.73 )
				self.imgBoxLethal:setTopBottom( false, true, -55.67, 19.67 )
				self.imgBoxLethal:setRGB( 0.11, 0.31, 0.39 )
				self.imgBoxLethal:setAlpha( 0 )
				self.clipFinished( imgBoxLethal, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -105, 106 )
				self.Glow0:setTopBottom( false, true, -114, -91 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				AmmoWidgetMPHeldItemSquare0:completeAnimation()
				self.AmmoWidgetMPHeldItemSquare0:setAlpha( 0 )
				self.clipFinished( AmmoWidgetMPHeldItemSquare0, {} )
				PlayerFlag0:completeAnimation()
				self.PlayerFlag0:setAlpha( 0 )
				self.clipFinished( PlayerFlag0, {} )
				Glow1:completeAnimation()
				self.Glow1:setAlpha( 0 )
				self.clipFinished( Glow1, {} )
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0 )
				self.clipFinished( InventoryBox1, {} )
				PlayerFlag:completeAnimation()
				self.PlayerFlag:setLeftRight( false, false, -12, 12 )
				self.PlayerFlag:setTopBottom( false, true, -115.5, -91.5 )
				self.PlayerFlag:setAlpha( 0 )
				self.clipFinished( PlayerFlag, {} )
				Glow:completeAnimation()
				self.Glow:setLeftRight( false, false, -24.5, 24.5 )
				self.Glow:setTopBottom( false, true, -128, -79 )
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				imgBoxLethal:completeAnimation()
				self.imgBoxLethal:setLeftRight( false, false, -19.5, 19.5 )
				self.imgBoxLethal:setTopBottom( false, true, -121, -84 )
				self.imgBoxLethal:setRGB( 0.09, 0.72, 1 )
				self.imgBoxLethal:setAlpha( 0 )
				self.clipFinished( imgBoxLethal, {} )
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -105, 106 )
				self.Glow0:setTopBottom( false, true, -114, -91 )
				self.Glow0:setAlpha( 0 )
				self.clipFinished( Glow0, {} )
			end,
			Show = function ()
				self:setupElementClipCounter( 10 )
				local AmmoWidgetMPHeldItemSquare0Frame2 = function ( AmmoWidgetMPHeldItemSquare0, event )
					local AmmoWidgetMPHeldItemSquare0Frame3 = function ( AmmoWidgetMPHeldItemSquare0, event )
						if not event.interrupted then
							AmmoWidgetMPHeldItemSquare0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						AmmoWidgetMPHeldItemSquare0:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( AmmoWidgetMPHeldItemSquare0, event )
						else
							AmmoWidgetMPHeldItemSquare0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoWidgetMPHeldItemSquare0Frame3( AmmoWidgetMPHeldItemSquare0, event )
						return 
					else
						AmmoWidgetMPHeldItemSquare0:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						AmmoWidgetMPHeldItemSquare0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetMPHeldItemSquare0Frame3 )
					end
				end
				
				AmmoWidgetMPHeldItemSquare0:completeAnimation()
				self.AmmoWidgetMPHeldItemSquare0:setAlpha( 0 )
				AmmoWidgetMPHeldItemSquare0Frame2( AmmoWidgetMPHeldItemSquare0, {} )
				local PlayerFlag0Frame2 = function ( PlayerFlag0, event )
					local PlayerFlag0Frame3 = function ( PlayerFlag0, event )
						if not event.interrupted then
							PlayerFlag0:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						PlayerFlag0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( PlayerFlag0, event )
						else
							PlayerFlag0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PlayerFlag0Frame3( PlayerFlag0, event )
						return 
					else
						PlayerFlag0:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						PlayerFlag0:registerEventHandler( "transition_complete_keyframe", PlayerFlag0Frame3 )
					end
				end
				
				PlayerFlag0:completeAnimation()
				self.PlayerFlag0:setAlpha( 0 )
				PlayerFlag0Frame2( PlayerFlag0, {} )
				local Glow1Frame2 = function ( Glow1, event )
					local Glow1Frame3 = function ( Glow1, event )
						local Glow1Frame4 = function ( Glow1, event )
							local Glow1Frame5 = function ( Glow1, event )
								if not event.interrupted then
									Glow1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
								end
								Glow1:setLeftRight( false, false, -44.49, 45.51 )
								Glow1:setTopBottom( false, true, -123.5, -33.5 )
								Glow1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow1, event )
								else
									Glow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Glow1Frame5( Glow1, event )
								return 
							else
								Glow1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame5 )
							end
						end
						
						if event.interrupted then
							Glow1Frame4( Glow1, event )
							return 
						else
							Glow1:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							Glow1:setAlpha( 0.4 )
							Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame4 )
						end
					end
					
					if event.interrupted then
						Glow1Frame3( Glow1, event )
						return 
					else
						Glow1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow1:registerEventHandler( "transition_complete_keyframe", Glow1Frame3 )
					end
				end
				
				Glow1:completeAnimation()
				self.Glow1:setLeftRight( false, false, -44.49, 45.51 )
				self.Glow1:setTopBottom( false, true, -123.5, -33.5 )
				self.Glow1:setAlpha( 0 )
				Glow1Frame2( Glow1, {} )
				local InventoryBox1Frame2 = function ( InventoryBox1, event )
					local InventoryBox1Frame3 = function ( InventoryBox1, event )
						local InventoryBox1Frame4 = function ( InventoryBox1, event )
							local InventoryBox1Frame5 = function ( InventoryBox1, event )
								local InventoryBox1Frame6 = function ( InventoryBox1, event )
									local InventoryBox1Frame7 = function ( InventoryBox1, event )
										local InventoryBox1Frame8 = function ( InventoryBox1, event )
											local InventoryBox1Frame9 = function ( InventoryBox1, event )
												local InventoryBox1Frame10 = function ( InventoryBox1, event )
													local InventoryBox1Frame11 = function ( InventoryBox1, event )
														if not event.interrupted then
															InventoryBox1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
														end
														InventoryBox1:setAlpha( 0.5 )
														if event.interrupted then
															self.clipFinished( InventoryBox1, event )
														else
															InventoryBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														InventoryBox1Frame11( InventoryBox1, event )
														return 
													else
														InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														InventoryBox1:setAlpha( 0.4 )
														InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame11 )
													end
												end
												
												if event.interrupted then
													InventoryBox1Frame10( InventoryBox1, event )
													return 
												else
													InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame10 )
												end
											end
											
											if event.interrupted then
												InventoryBox1Frame9( InventoryBox1, event )
												return 
											else
												InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												InventoryBox1:setAlpha( 0.2 )
												InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame9 )
											end
										end
										
										if event.interrupted then
											InventoryBox1Frame8( InventoryBox1, event )
											return 
										else
											InventoryBox1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame8 )
										end
									end
									
									if event.interrupted then
										InventoryBox1Frame7( InventoryBox1, event )
										return 
									else
										InventoryBox1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										InventoryBox1:setAlpha( 0.4 )
										InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame7 )
									end
								end
								
								if event.interrupted then
									InventoryBox1Frame6( InventoryBox1, event )
									return 
								else
									InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame6 )
								end
							end
							
							if event.interrupted then
								InventoryBox1Frame5( InventoryBox1, event )
								return 
							else
								InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								InventoryBox1:setAlpha( 0.1 )
								InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame5 )
							end
						end
						
						if event.interrupted then
							InventoryBox1Frame4( InventoryBox1, event )
							return 
						else
							InventoryBox1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame4 )
						end
					end
					
					if event.interrupted then
						InventoryBox1Frame3( InventoryBox1, event )
						return 
					else
						InventoryBox1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						InventoryBox1:setAlpha( 0.4 )
						InventoryBox1:registerEventHandler( "transition_complete_keyframe", InventoryBox1Frame3 )
					end
				end
				
				InventoryBox1:completeAnimation()
				self.InventoryBox1:setAlpha( 0 )
				InventoryBox1Frame2( InventoryBox1, {} )
				local PlayerFlagFrame2 = function ( PlayerFlag, event )
					local PlayerFlagFrame3 = function ( PlayerFlag, event )
						local PlayerFlagFrame4 = function ( PlayerFlag, event )
							local PlayerFlagFrame5 = function ( PlayerFlag, event )
								local PlayerFlagFrame6 = function ( PlayerFlag, event )
									local PlayerFlagFrame7 = function ( PlayerFlag, event )
										local PlayerFlagFrame8 = function ( PlayerFlag, event )
											local PlayerFlagFrame9 = function ( PlayerFlag, event )
												local PlayerFlagFrame10 = function ( PlayerFlag, event )
													local PlayerFlagFrame11 = function ( PlayerFlag, event )
														local PlayerFlagFrame12 = function ( PlayerFlag, event )
															local PlayerFlagFrame13 = function ( PlayerFlag, event )
																local PlayerFlagFrame14 = function ( PlayerFlag, event )
																	local PlayerFlagFrame15 = function ( PlayerFlag, event )
																		local PlayerFlagFrame16 = function ( PlayerFlag, event )
																			local PlayerFlagFrame17 = function ( PlayerFlag, event )
																				local PlayerFlagFrame18 = function ( PlayerFlag, event )
																					local PlayerFlagFrame19 = function ( PlayerFlag, event )
																						local PlayerFlagFrame20 = function ( PlayerFlag, event )
																							local PlayerFlagFrame21 = function ( PlayerFlag, event )
																								local PlayerFlagFrame22 = function ( PlayerFlag, event )
																									if not event.interrupted then
																										PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									end
																									PlayerFlag:setLeftRight( false, false, -12, 12 )
																									PlayerFlag:setTopBottom( false, true, -30, -6 )
																									PlayerFlag:setAlpha( 1 )
																									if event.interrupted then
																										self.clipFinished( PlayerFlag, event )
																									else
																										PlayerFlag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																									end
																								end
																								
																								if event.interrupted then
																									PlayerFlagFrame22( PlayerFlag, event )
																									return 
																								else
																									PlayerFlag:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																									PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								PlayerFlagFrame21( PlayerFlag, event )
																								return 
																							else
																								PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								PlayerFlag:setAlpha( 0.6 )
																								PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							PlayerFlagFrame20( PlayerFlag, event )
																							return 
																						else
																							PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																							PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						PlayerFlagFrame19( PlayerFlag, event )
																						return 
																					else
																						PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						PlayerFlag:setAlpha( 1 )
																						PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					PlayerFlagFrame18( PlayerFlag, event )
																					return 
																				else
																					PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				PlayerFlagFrame17( PlayerFlag, event )
																				return 
																			else
																				PlayerFlag:beginAnimation( "keyframe", 9, true, false, CoD.TweenType.Linear )
																				PlayerFlag:setAlpha( 0.37 )
																				PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			PlayerFlagFrame16( PlayerFlag, event )
																			return 
																		else
																			PlayerFlag:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																			PlayerFlag:setTopBottom( false, true, -30, -6 )
																			PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		PlayerFlagFrame15( PlayerFlag, event )
																		return 
																	else
																		PlayerFlag:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
																		PlayerFlag:setTopBottom( false, true, -85.84, -61.84 )
																		PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame15 )
																	end
																end
																
																if event.interrupted then
																	PlayerFlagFrame14( PlayerFlag, event )
																	return 
																else
																	PlayerFlag:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	PlayerFlag:setAlpha( 1 )
																	PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame14 )
																end
															end
															
															if event.interrupted then
																PlayerFlagFrame13( PlayerFlag, event )
																return 
															else
																PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame13 )
															end
														end
														
														if event.interrupted then
															PlayerFlagFrame12( PlayerFlag, event )
															return 
														else
															PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															PlayerFlag:setAlpha( 0.75 )
															PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame12 )
														end
													end
													
													if event.interrupted then
														PlayerFlagFrame11( PlayerFlag, event )
														return 
													else
														PlayerFlag:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame11 )
													end
												end
												
												if event.interrupted then
													PlayerFlagFrame10( PlayerFlag, event )
													return 
												else
													PlayerFlag:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													PlayerFlag:setAlpha( 1 )
													PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame10 )
												end
											end
											
											if event.interrupted then
												PlayerFlagFrame9( PlayerFlag, event )
												return 
											else
												PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame9 )
											end
										end
										
										if event.interrupted then
											PlayerFlagFrame8( PlayerFlag, event )
											return 
										else
											PlayerFlag:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											PlayerFlag:setAlpha( 0.4 )
											PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame8 )
										end
									end
									
									if event.interrupted then
										PlayerFlagFrame7( PlayerFlag, event )
										return 
									else
										PlayerFlag:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame7 )
									end
								end
								
								if event.interrupted then
									PlayerFlagFrame6( PlayerFlag, event )
									return 
								else
									PlayerFlag:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									PlayerFlag:setAlpha( 1 )
									PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame6 )
								end
							end
							
							if event.interrupted then
								PlayerFlagFrame5( PlayerFlag, event )
								return 
							else
								PlayerFlag:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame5 )
							end
						end
						
						if event.interrupted then
							PlayerFlagFrame4( PlayerFlag, event )
							return 
						else
							PlayerFlag:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							PlayerFlag:setAlpha( 0.66 )
							PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame4 )
						end
					end
					
					if event.interrupted then
						PlayerFlagFrame3( PlayerFlag, event )
						return 
					else
						PlayerFlag:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						PlayerFlag:registerEventHandler( "transition_complete_keyframe", PlayerFlagFrame3 )
					end
				end
				
				PlayerFlag:completeAnimation()
				self.PlayerFlag:setLeftRight( false, false, -12, 12 )
				self.PlayerFlag:setTopBottom( false, true, -85.84, -61.84 )
				self.PlayerFlag:setAlpha( 0 )
				PlayerFlagFrame2( PlayerFlag, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										local GlowFrame8 = function ( Glow, event )
											local GlowFrame9 = function ( Glow, event )
												local GlowFrame10 = function ( Glow, event )
													local GlowFrame11 = function ( Glow, event )
														local GlowFrame12 = function ( Glow, event )
															local GlowFrame13 = function ( Glow, event )
																local GlowFrame14 = function ( Glow, event )
																	local GlowFrame15 = function ( Glow, event )
																		local GlowFrame16 = function ( Glow, event )
																			local GlowFrame17 = function ( Glow, event )
																				local GlowFrame18 = function ( Glow, event )
																					local GlowFrame19 = function ( Glow, event )
																						local GlowFrame20 = function ( Glow, event )
																							local GlowFrame21 = function ( Glow, event )
																								local GlowFrame22 = function ( Glow, event )
																									local GlowFrame23 = function ( Glow, event )
																										local GlowFrame24 = function ( Glow, event )
																											if not event.interrupted then
																												Glow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																											end
																											Glow:setLeftRight( false, false, -24.5, 24.5 )
																											Glow:setTopBottom( false, true, -42.5, 6.5 )
																											Glow:setRGB( 1, 0.54, 0.48 )
																											Glow:setAlpha( 0 )
																											if event.interrupted then
																												self.clipFinished( Glow, event )
																											else
																												Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																											end
																										end
																										
																										if event.interrupted then
																											GlowFrame24( Glow, event )
																											return 
																										else
																											Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											Glow:setAlpha( 0.88 )
																											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										GlowFrame23( Glow, event )
																										return 
																									else
																										Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									GlowFrame22( Glow, event )
																									return 
																								else
																									Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									Glow:setAlpha( 0.64 )
																									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								GlowFrame21( Glow, event )
																								return 
																							else
																								Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							GlowFrame20( Glow, event )
																							return 
																						else
																							Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							Glow:setAlpha( 1 )
																							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						GlowFrame19( Glow, event )
																						return 
																					else
																						Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					GlowFrame18( Glow, event )
																					return 
																				else
																					Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																					Glow:setAlpha( 0.43 )
																					Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				GlowFrame17( Glow, event )
																				return 
																			else
																				Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			GlowFrame16( Glow, event )
																			return 
																		else
																			Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			Glow:setAlpha( 1 )
																			Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		GlowFrame15( Glow, event )
																		return 
																	else
																		Glow:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
																		Glow:setTopBottom( false, true, -42.5, 6.5 )
																		Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame15 )
																	end
																end
																
																if event.interrupted then
																	GlowFrame14( Glow, event )
																	return 
																else
																	Glow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
																	Glow:setTopBottom( false, true, -97.92, -48.92 )
																	Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame14 )
																end
															end
															
															if event.interrupted then
																GlowFrame13( Glow, event )
																return 
															else
																Glow:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																Glow:setAlpha( 0 )
																Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame13 )
															end
														end
														
														if event.interrupted then
															GlowFrame12( Glow, event )
															return 
														else
															Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															Glow:setAlpha( 1 )
															Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame12 )
														end
													end
													
													if event.interrupted then
														GlowFrame11( Glow, event )
														return 
													else
														Glow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame11 )
													end
												end
												
												if event.interrupted then
													GlowFrame10( Glow, event )
													return 
												else
													Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Glow:setAlpha( 0.71 )
													Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame10 )
												end
											end
											
											if event.interrupted then
												GlowFrame9( Glow, event )
												return 
											else
												Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame9 )
											end
										end
										
										if event.interrupted then
											GlowFrame8( Glow, event )
											return 
										else
											Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Glow:setAlpha( 1 )
											Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame8 )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Glow:setAlpha( 0.25 )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Glow:setAlpha( 0.69 )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( false, false, -24.5, 24.5 )
				self.Glow:setTopBottom( false, true, -97.92, -48.92 )
				self.Glow:setRGB( 1, 0.54, 0.48 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local imgBoxLethalFrame2 = function ( imgBoxLethal, event )
					local imgBoxLethalFrame3 = function ( imgBoxLethal, event )
						local imgBoxLethalFrame4 = function ( imgBoxLethal, event )
							local imgBoxLethalFrame5 = function ( imgBoxLethal, event )
								local imgBoxLethalFrame6 = function ( imgBoxLethal, event )
									local imgBoxLethalFrame7 = function ( imgBoxLethal, event )
										local imgBoxLethalFrame8 = function ( imgBoxLethal, event )
											local imgBoxLethalFrame9 = function ( imgBoxLethal, event )
												local imgBoxLethalFrame10 = function ( imgBoxLethal, event )
													local imgBoxLethalFrame11 = function ( imgBoxLethal, event )
														local imgBoxLethalFrame12 = function ( imgBoxLethal, event )
															local imgBoxLethalFrame13 = function ( imgBoxLethal, event )
																if not event.interrupted then
																	imgBoxLethal:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																end
																imgBoxLethal:setLeftRight( false, false, -42.72, 43.73 )
																imgBoxLethal:setTopBottom( false, true, -55.67, 19.67 )
																imgBoxLethal:setRGB( 0.11, 0.31, 0.39 )
																imgBoxLethal:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( imgBoxLethal, event )
																else
																	imgBoxLethal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																imgBoxLethalFrame13( imgBoxLethal, event )
																return 
															else
																imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																imgBoxLethal:setLeftRight( false, false, -29.38, 29.66 )
																imgBoxLethal:setTopBottom( false, true, -43.3, 8.14 )
																imgBoxLethal:setAlpha( 0.62 )
																imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame13 )
															end
														end
														
														if event.interrupted then
															imgBoxLethalFrame12( imgBoxLethal, event )
															return 
														else
															imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															imgBoxLethal:setLeftRight( false, false, -28.78, 29.02 )
															imgBoxLethal:setTopBottom( false, true, -42.74, 7.62 )
															imgBoxLethal:setAlpha( 0.2 )
															imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame12 )
														end
													end
													
													if event.interrupted then
														imgBoxLethalFrame11( imgBoxLethal, event )
														return 
													else
														imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														imgBoxLethal:setLeftRight( false, false, -28.17, 28.38 )
														imgBoxLethal:setTopBottom( false, true, -42.18, 7.09 )
														imgBoxLethal:setAlpha( 0.05 )
														imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame11 )
													end
												end
												
												if event.interrupted then
													imgBoxLethalFrame10( imgBoxLethal, event )
													return 
												else
													imgBoxLethal:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													imgBoxLethal:setLeftRight( false, false, -27.56, 27.74 )
													imgBoxLethal:setTopBottom( false, true, -41.62, 6.57 )
													imgBoxLethal:setAlpha( 0.71 )
													imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame10 )
												end
											end
											
											if event.interrupted then
												imgBoxLethalFrame9( imgBoxLethal, event )
												return 
											else
												imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												imgBoxLethal:setLeftRight( false, false, -24.53, 24.54 )
												imgBoxLethal:setTopBottom( false, true, -38.81, 3.95 )
												imgBoxLethal:setAlpha( 0.85 )
												imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame9 )
											end
										end
										
										if event.interrupted then
											imgBoxLethalFrame8( imgBoxLethal, event )
											return 
										else
											imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											imgBoxLethal:setLeftRight( false, false, -23.93, 23.9 )
											imgBoxLethal:setTopBottom( false, true, -38.25, 3.43 )
											imgBoxLethal:setAlpha( 0.28 )
											imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame8 )
										end
									end
									
									if event.interrupted then
										imgBoxLethalFrame7( imgBoxLethal, event )
										return 
									else
										imgBoxLethal:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										imgBoxLethal:setLeftRight( false, false, -23.32, 23.26 )
										imgBoxLethal:setTopBottom( false, true, -37.69, 2.9 )
										imgBoxLethal:setAlpha( 0.43 )
										imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame7 )
									end
								end
								
								if event.interrupted then
									imgBoxLethalFrame6( imgBoxLethal, event )
									return 
								else
									imgBoxLethal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									imgBoxLethal:setLeftRight( false, false, -21.5, 21.34 )
									imgBoxLethal:setTopBottom( false, true, -36, 1.33 )
									imgBoxLethal:setAlpha( 1 )
									imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame6 )
								end
							end
							
							if event.interrupted then
								imgBoxLethalFrame5( imgBoxLethal, event )
								return 
							else
								imgBoxLethal:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
								imgBoxLethal:setLeftRight( false, false, -34.14, 35.15 )
								imgBoxLethal:setTopBottom( false, true, -134.18, -68.44 )
								imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame5 )
							end
						end
						
						if event.interrupted then
							imgBoxLethalFrame4( imgBoxLethal, event )
							return 
						else
							imgBoxLethal:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
							imgBoxLethal:setRGB( 0.11, 0.31, 0.39 )
							imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame4 )
						end
					end
					
					if event.interrupted then
						imgBoxLethalFrame3( imgBoxLethal, event )
						return 
					else
						imgBoxLethal:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						imgBoxLethal:registerEventHandler( "transition_complete_keyframe", imgBoxLethalFrame3 )
					end
				end
				
				imgBoxLethal:completeAnimation()
				self.imgBoxLethal:setLeftRight( false, false, -34.14, 35.15 )
				self.imgBoxLethal:setTopBottom( false, true, -134.18, -68.44 )
				self.imgBoxLethal:setRGB( 0.09, 0.72, 1 )
				self.imgBoxLethal:setAlpha( 0 )
				imgBoxLethalFrame2( imgBoxLethal, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									if not event.interrupted then
										Glow0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
									end
									Glow0:setLeftRight( false, false, -105, 106 )
									Glow0:setTopBottom( false, true, -84.84, -61.84 )
									Glow0:setRGB( 1, 0.26, 0 )
									Glow0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glow0, event )
									else
										Glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Glow0Frame6( Glow0, event )
									return 
								else
									Glow0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Glow0:setAlpha( 1 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Glow0:setAlpha( 0.4 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 0.49 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setLeftRight( false, false, -105, 106 )
				self.Glow0:setTopBottom( false, true, -84.84, -61.84 )
				self.Glow0:setRGB( 1, 0.26, 0 )
				self.Glow0:setAlpha( 0 )
				Glow0Frame2( Glow0, {} )
				local HuxBlurFrame2 = function ( HuxBlur, event )
					local HuxBlurFrame3 = function ( HuxBlur, event )
						local HuxBlurFrame4 = function ( HuxBlur, event )
							local HuxBlurFrame5 = function ( HuxBlur, event )
								local HuxBlurFrame6 = function ( HuxBlur, event )
									local HuxBlurFrame7 = function ( HuxBlur, event )
										local HuxBlurFrame8 = function ( HuxBlur, event )
											local HuxBlurFrame9 = function ( HuxBlur, event )
												if not event.interrupted then
													HuxBlur:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
												end
												HuxBlur:setLeftRight( false, false, -43.6, 44.61 )
												HuxBlur:setTopBottom( false, true, -59.42, 23.42 )
												HuxBlur:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( HuxBlur, event )
												else
													HuxBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												HuxBlurFrame9( HuxBlur, event )
												return 
											else
												HuxBlur:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												HuxBlur:setLeftRight( false, false, -18.7, 18.41 )
												HuxBlur:setTopBottom( false, true, -35, -0.15 )
												HuxBlur:setAlpha( 1 )
												HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame9 )
											end
										end
										
										if event.interrupted then
											HuxBlurFrame8( HuxBlur, event )
											return 
										else
											HuxBlur:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
											HuxBlur:setLeftRight( false, false, -18.77, 18.34 )
											HuxBlur:setTopBottom( false, true, -37.07, -2.22 )
											HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame8 )
										end
									end
									
									if event.interrupted then
										HuxBlurFrame7( HuxBlur, event )
										return 
									else
										HuxBlur:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
										HuxBlur:setLeftRight( false, false, -42.7, 43.71 )
										HuxBlur:setTopBottom( false, true, -114.66, -33.5 )
										HuxBlur:setAlpha( 0 )
										HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame7 )
									end
								end
								
								if event.interrupted then
									HuxBlurFrame6( HuxBlur, event )
									return 
								else
									HuxBlur:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
									HuxBlur:setLeftRight( false, false, -33.49, 34.5 )
									HuxBlur:setTopBottom( false, true, -105.75, -41.9 )
									HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame6 )
								end
							end
							
							if event.interrupted then
								HuxBlurFrame5( HuxBlur, event )
								return 
							else
								HuxBlur:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								HuxBlur:setAlpha( 1 )
								HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame5 )
							end
						end
						
						if event.interrupted then
							HuxBlurFrame4( HuxBlur, event )
							return 
						else
							HuxBlur:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							HuxBlur:setAlpha( 0.5 )
							HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame4 )
						end
					end
					
					if event.interrupted then
						HuxBlurFrame3( HuxBlur, event )
						return 
					else
						HuxBlur:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						HuxBlur:registerEventHandler( "transition_complete_keyframe", HuxBlurFrame3 )
					end
				end
				
				HuxBlur:completeAnimation()
				self.HuxBlur:setLeftRight( false, false, -18.75, 19.76 )
				self.HuxBlur:setTopBottom( false, true, -91.5, -55.34 )
				self.HuxBlur:setAlpha( 0 )
				HuxBlurFrame2( HuxBlur, {} )
				local Glow00Frame2 = function ( Glow00, event )
					local Glow00Frame3 = function ( Glow00, event )
						local Glow00Frame4 = function ( Glow00, event )
							local Glow00Frame5 = function ( Glow00, event )
								local Glow00Frame6 = function ( Glow00, event )
									if not event.interrupted then
										Glow00:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
									end
									Glow00:setRGB( 1, 0.43, 0 )
									Glow00:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( Glow00, event )
									else
										Glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Glow00Frame6( Glow00, event )
									return 
								else
									Glow00:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									Glow00:setAlpha( 1 )
									Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame6 )
								end
							end
							
							if event.interrupted then
								Glow00Frame5( Glow00, event )
								return 
							else
								Glow00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Glow00:setAlpha( 0.25 )
								Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame5 )
							end
						end
						
						if event.interrupted then
							Glow00Frame4( Glow00, event )
							return 
						else
							Glow00:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Glow00:setAlpha( 0.6 )
							Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame4 )
						end
					end
					
					if event.interrupted then
						Glow00Frame3( Glow00, event )
						return 
					else
						Glow00:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Glow00:registerEventHandler( "transition_complete_keyframe", Glow00Frame3 )
					end
				end
				
				Glow00:completeAnimation()
				self.Glow00:setRGB( 1, 0.43, 0 )
				self.Glow00:setAlpha( 0 )
				Glow00Frame2( Glow00, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return AmICarryingEnemyFlag( controller )
			end
		},
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CTF.enemyFlagCarrier" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CTF.enemyFlagCarrier"
		} )
	end )
	self.close = function ( self )
		self.AmmoWidgetMPHeldItemSquare0:close()
		self.PlayerFlag0:close()
		self.InventoryBox1:close()
		self.PlayerFlag:close()
		CoD.AmmoWidgetMP_HeldItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

