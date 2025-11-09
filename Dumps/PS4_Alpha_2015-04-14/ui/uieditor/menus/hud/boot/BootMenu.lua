require( "ui.uieditor.widgets.HUD.CP_Boot.BootWidget_Plates1" )
require( "ui.uieditor.widgets.HUD.CP_Boot.BootWidget_Cent1" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "clip_over", function ( self, event )
		self:registerEventHandler( "clip_over", CoD.NullFunction )
		Engine.SendMenuResponse( controller, "BootMenu", "done" )
		self:close()
	end )
end

LUI.createMenu.BootMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "BootMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "BootMenu"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local BootWidgetPlates10 = CoD.BootWidget_Plates1.new( menu, controller )
	BootWidgetPlates10:setLeftRight( true, true, -320, 320 )
	BootWidgetPlates10:setTopBottom( true, true, -180, 180 )
	BootWidgetPlates10:setRGB( 0, 0, 0 )
	BootWidgetPlates10:setZoom( -571.37 )
	self:addElement( BootWidgetPlates10 )
	self.BootWidgetPlates10 = BootWidgetPlates10
	
	local imgCent3 = LUI.UIImage.new()
	imgCent3:setLeftRight( true, true, 425.7, -425.7 )
	imgCent3:setTopBottom( true, true, 144.7, -146.7 )
	imgCent3:setRGB( 1, 1, 1 )
	imgCent3:setAlpha( 0 )
	imgCent3:setZRot( -432 )
	imgCent3:setImage( RegisterImage( "uie_t7_cp_hud_boot_center3" ) )
	imgCent3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgCent3 )
	self.imgCent3 = imgCent3
	
	local imgCent4b = LUI.UIImage.new()
	imgCent4b:setLeftRight( true, true, 354.5, -309.5 )
	imgCent4b:setTopBottom( true, true, 57, -47 )
	imgCent4b:setRGB( 0.24, 0.37, 0.57 )
	imgCent4b:setAlpha( 0 )
	imgCent4b:setZRot( -180 )
	imgCent4b:setZoom( -562 )
	imgCent4b:setImage( RegisterImage( "uie_t7_cp_hud_boot_center4" ) )
	imgCent4b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgCent4b )
	self.imgCent4b = imgCent4b
	
	local imgCent4 = LUI.UIImage.new()
	imgCent4:setLeftRight( true, true, 459, -485 )
	imgCent4:setTopBottom( true, true, 191, -193 )
	imgCent4:setRGB( 1, 1, 1 )
	imgCent4:setAlpha( 0 )
	imgCent4:setImage( RegisterImage( "uie_t7_cp_hud_boot_center4" ) )
	imgCent4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgCent4 )
	self.imgCent4 = imgCent4
	
	local BootWidgetCent10 = CoD.BootWidget_Cent1.new( menu, controller )
	BootWidgetCent10:setLeftRight( true, true, 601, -602 )
	BootWidgetCent10:setTopBottom( true, true, 232, -232 )
	BootWidgetCent10:setRGB( 1, 1, 1 )
	BootWidgetCent10:setAlpha( 0 )
	BootWidgetCent10:setZRot( -2457 )
	self:addElement( BootWidgetCent10 )
	self.BootWidgetCent10 = BootWidgetCent10
	
	local imgCent2Outter2 = LUI.UIImage.new()
	imgCent2Outter2:setLeftRight( true, true, 500, -501.94 )
	imgCent2Outter2:setTopBottom( true, true, 227.29, -228 )
	imgCent2Outter2:setRGB( 1, 1, 1 )
	imgCent2Outter2:setAlpha( 0 )
	imgCent2Outter2:setImage( RegisterImage( "uie_t7_cp_hud_boot_center2" ) )
	imgCent2Outter2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgCent2Outter2 )
	self.imgCent2Outter2 = imgCent2Outter2
	
	local imgCent2Outter = LUI.UIImage.new()
	imgCent2Outter:setLeftRight( true, true, 515, -515 )
	imgCent2Outter:setTopBottom( true, true, 241, -241 )
	imgCent2Outter:setRGB( 1, 1, 1 )
	imgCent2Outter:setAlpha( 0 )
	imgCent2Outter:setZRot( -267 )
	imgCent2Outter:setImage( RegisterImage( "uie_t7_cp_hud_boot_center2" ) )
	imgCent2Outter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgCent2Outter )
	self.imgCent2Outter = imgCent2Outter
	
	local imgCent2 = LUI.UIImage.new()
	imgCent2:setLeftRight( true, true, 550.53, -550.47 )
	imgCent2:setTopBottom( true, true, 274.8, -274.8 )
	imgCent2:setRGB( 1, 1, 1 )
	imgCent2:setAlpha( 0 )
	imgCent2:setImage( RegisterImage( "uie_t7_cp_hud_boot_center2" ) )
	imgCent2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgCent2 )
	self.imgCent2 = imgCent2
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, -315.28, 315.28 )
	Image0:setTopBottom( true, true, -178.34, 176.34 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0.3 )
	Image0:setZoom( -26 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_boot_1b" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, -223.47, 223.53 )
	Image00:setTopBottom( true, true, -125.72, 125.72 )
	Image00:setRGB( 0, 0, 0 )
	Image00:setAlpha( 0.3 )
	Image00:setZoom( -135 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_boot_1" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local img1 = LUI.UIImage.new()
	img1:setLeftRight( true, true, -127.78, 127.78 )
	img1:setTopBottom( true, true, -71.56, 71.56 )
	img1:setRGB( 0.8, 0.95, 1 )
	img1:setAlpha( 0.47 )
	img1:setZRot( 90 )
	img1:setZoom( -310.47 )
	img1:setImage( RegisterImage( "uie_t7_cp_hud_boot_1" ) )
	img1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img1 )
	self.img1 = img1
	
	local img1b = LUI.UIImage.new()
	img1b:setLeftRight( true, true, 0, 0 )
	img1b:setTopBottom( true, true, 0, 0 )
	img1b:setRGB( 0.86, 0.97, 1 )
	img1b:setAlpha( 0.1 )
	img1b:setZoom( -466.67 )
	img1b:setImage( RegisterImage( "uie_t7_cp_hud_boot_1b" ) )
	img1b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img1b )
	self.img1b = img1b
	
	local img2 = LUI.UIImage.new()
	img2:setLeftRight( true, true, 0, 0 )
	img2:setTopBottom( true, true, 0, 0 )
	img2:setRGB( 0.93, 0.98, 1 )
	img2:setAlpha( 0.31 )
	img2:setZRot( 90 )
	img2:setZoom( -752.09 )
	img2:setImage( RegisterImage( "uie_t7_cp_hud_boot_2" ) )
	img2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img2 )
	self.img2 = img2
	
	local img2b = LUI.UIImage.new()
	img2b:setLeftRight( true, true, -0.26, 0.26 )
	img2b:setTopBottom( true, true, -0.15, 0.15 )
	img2b:setRGB( 0.99, 1, 1 )
	img2b:setAlpha( 0.2 )
	img2b:setZoom( -1000 )
	img2b:setImage( RegisterImage( "uie_t7_cp_hud_boot_2b" ) )
	img2b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img2b )
	self.img2b = img2b
	
	local img3 = LUI.UIImage.new()
	img3:setLeftRight( true, true, -15.72, 15.72 )
	img3:setTopBottom( true, true, -9.1, 9.1 )
	img3:setRGB( 0.55, 0.79, 0.75 )
	img3:setAlpha( 0.19 )
	img3:setZoom( -1000 )
	img3:setImage( RegisterImage( "uie_t7_cp_hud_boot_3" ) )
	img3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img3 )
	self.img3 = img3
	
	local img3b = LUI.UIImage.new()
	img3b:setLeftRight( true, true, -47.5, 47.5 )
	img3b:setTopBottom( true, true, -27.5, 27.5 )
	img3b:setRGB( 0.12, 0.6, 0.52 )
	img3b:setAlpha( 0.4 )
	img3b:setZRot( 90 )
	img3b:setZoom( -1000 )
	img3b:setImage( RegisterImage( "uie_t7_cp_hud_boot_3b" ) )
	img3b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img3b )
	self.img3b = img3b
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				local BootWidgetPlates10Frame2 = function ( BootWidgetPlates10, event )
					local BootWidgetPlates10Frame3 = function ( BootWidgetPlates10, event )
						local BootWidgetPlates10Frame4 = function ( BootWidgetPlates10, event )
							local BootWidgetPlates10Frame5 = function ( BootWidgetPlates10, event )
								local BootWidgetPlates10Frame6 = function ( BootWidgetPlates10, event )
									local BootWidgetPlates10Frame7 = function ( BootWidgetPlates10, event )
										local BootWidgetPlates10Frame8 = function ( BootWidgetPlates10, event )
											local BootWidgetPlates10Frame9 = function ( BootWidgetPlates10, event )
												local BootWidgetPlates10Frame10 = function ( BootWidgetPlates10, event )
													if not event.interrupted then
														BootWidgetPlates10:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
													end
													BootWidgetPlates10:setAlpha( 0 )
													BootWidgetPlates10:setZoom( 6000 )
													if event.interrupted then
														self.clipFinished( BootWidgetPlates10, event )
													else
														BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													BootWidgetPlates10Frame10( BootWidgetPlates10, event )
													return 
												else
													BootWidgetPlates10:beginAnimation( "keyframe", 1129, true, false, CoD.TweenType.Linear )
													BootWidgetPlates10:setZoom( 6000 )
													BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", BootWidgetPlates10Frame10 )
												end
											end
											
											if event.interrupted then
												BootWidgetPlates10Frame9( BootWidgetPlates10, event )
												return 
											else
												BootWidgetPlates10:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												BootWidgetPlates10:setZoom( -952.45 )
												BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", BootWidgetPlates10Frame9 )
											end
										end
										
										if event.interrupted then
											BootWidgetPlates10Frame8( BootWidgetPlates10, event )
											return 
										else
											BootWidgetPlates10:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											BootWidgetPlates10:setZoom( -960 )
											BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", BootWidgetPlates10Frame8 )
										end
									end
									
									if event.interrupted then
										BootWidgetPlates10Frame7( BootWidgetPlates10, event )
										return 
									else
										BootWidgetPlates10:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
										BootWidgetPlates10:setZoom( -990 )
										BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", BootWidgetPlates10Frame7 )
									end
								end
								
								if event.interrupted then
									BootWidgetPlates10Frame6( BootWidgetPlates10, event )
									return 
								else
									BootWidgetPlates10:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									BootWidgetPlates10:setZoom( -1000 )
									BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", BootWidgetPlates10Frame6 )
								end
							end
							
							if event.interrupted then
								BootWidgetPlates10Frame5( BootWidgetPlates10, event )
								return 
							else
								BootWidgetPlates10:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Linear )
								BootWidgetPlates10:setAlpha( 1 )
								BootWidgetPlates10:setZoom( -1020 )
								BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", BootWidgetPlates10Frame5 )
							end
						end
						
						if event.interrupted then
							BootWidgetPlates10Frame4( BootWidgetPlates10, event )
							return 
						else
							BootWidgetPlates10:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							BootWidgetPlates10:setAlpha( 0.31 )
							BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", BootWidgetPlates10Frame4 )
						end
					end
					
					if event.interrupted then
						BootWidgetPlates10Frame3( BootWidgetPlates10, event )
						return 
					else
						BootWidgetPlates10:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
						BootWidgetPlates10:registerEventHandler( "transition_complete_keyframe", BootWidgetPlates10Frame3 )
					end
				end
				
				BootWidgetPlates10:completeAnimation()
				self.BootWidgetPlates10:setAlpha( 0 )
				self.BootWidgetPlates10:setZoom( -980 )
				BootWidgetPlates10Frame2( BootWidgetPlates10, {} )
				local imgCent3Frame2 = function ( imgCent3, event )
					local imgCent3Frame3 = function ( imgCent3, event )
						local imgCent3Frame4 = function ( imgCent3, event )
							local imgCent3Frame5 = function ( imgCent3, event )
								local imgCent3Frame6 = function ( imgCent3, event )
									local imgCent3Frame7 = function ( imgCent3, event )
										local imgCent3Frame8 = function ( imgCent3, event )
											if not event.interrupted then
												imgCent3:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
											end
											imgCent3:setLeftRight( true, true, 425.7, -425.7 )
											imgCent3:setTopBottom( true, true, 144.7, -146.7 )
											imgCent3:setAlpha( 0 )
											imgCent3:setZRot( -432 )
											if event.interrupted then
												self.clipFinished( imgCent3, event )
											else
												imgCent3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											imgCent3Frame8( imgCent3, event )
											return 
										else
											imgCent3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											imgCent3:setLeftRight( true, true, 450.9, -450.23 )
											imgCent3:setTopBottom( true, true, 170.23, -170.9 )
											imgCent3:setAlpha( 0.71 )
											imgCent3:setZRot( -146 )
											imgCent3:registerEventHandler( "transition_complete_keyframe", imgCent3Frame8 )
										end
									end
									
									if event.interrupted then
										imgCent3Frame7( imgCent3, event )
										return 
									else
										imgCent3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										imgCent3:setLeftRight( true, true, 461.4, -460.46 )
										imgCent3:setTopBottom( true, true, 180.87, -180.98 )
										imgCent3:setZRot( -124.53 )
										imgCent3:registerEventHandler( "transition_complete_keyframe", imgCent3Frame7 )
									end
								end
								
								if event.interrupted then
									imgCent3Frame6( imgCent3, event )
									return 
								else
									imgCent3:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
									imgCent3:setZRot( -120.24 )
									imgCent3:registerEventHandler( "transition_complete_keyframe", imgCent3Frame6 )
								end
							end
							
							if event.interrupted then
								imgCent3Frame5( imgCent3, event )
								return 
							else
								imgCent3:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
								imgCent3:setLeftRight( true, true, 463.5, -462.5 )
								imgCent3:setTopBottom( true, true, 183, -183 )
								imgCent3:setZRot( -38.65 )
								imgCent3:registerEventHandler( "transition_complete_keyframe", imgCent3Frame5 )
							end
						end
						
						if event.interrupted then
							imgCent3Frame4( imgCent3, event )
							return 
						else
							imgCent3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							imgCent3:setLeftRight( true, true, 488.25, -487.89 )
							imgCent3:setTopBottom( true, true, 208.07, -208.07 )
							imgCent3:setAlpha( 1 )
							imgCent3:setZRot( 0 )
							imgCent3:registerEventHandler( "transition_complete_keyframe", imgCent3Frame4 )
						end
					end
					
					if event.interrupted then
						imgCent3Frame3( imgCent3, event )
						return 
					else
						imgCent3:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						imgCent3:setLeftRight( true, true, 502, -502 )
						imgCent3:setTopBottom( true, true, 222, -222 )
						imgCent3:registerEventHandler( "transition_complete_keyframe", imgCent3Frame3 )
					end
				end
				
				imgCent3:completeAnimation()
				self.imgCent3:setLeftRight( true, true, 463.5, -462.5 )
				self.imgCent3:setTopBottom( true, true, 183, -183 )
				self.imgCent3:setAlpha( 0 )
				self.imgCent3:setZRot( 139 )
				imgCent3Frame2( imgCent3, {} )
				local imgCent4bFrame2 = function ( imgCent4b, event )
					local imgCent4bFrame3 = function ( imgCent4b, event )
						local imgCent4bFrame4 = function ( imgCent4b, event )
							if not event.interrupted then
								imgCent4b:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							end
							imgCent4b:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( imgCent4b, event )
							else
								imgCent4b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							imgCent4bFrame4( imgCent4b, event )
							return 
						else
							imgCent4b:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
							imgCent4b:setAlpha( 0.48 )
							imgCent4b:registerEventHandler( "transition_complete_keyframe", imgCent4bFrame4 )
						end
					end
					
					if event.interrupted then
						imgCent4bFrame3( imgCent4b, event )
						return 
					else
						imgCent4b:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
						imgCent4b:registerEventHandler( "transition_complete_keyframe", imgCent4bFrame3 )
					end
				end
				
				imgCent4b:completeAnimation()
				self.imgCent4b:setAlpha( 0 )
				imgCent4bFrame2( imgCent4b, {} )
				local imgCent4Frame2 = function ( imgCent4, event )
					local imgCent4Frame3 = function ( imgCent4, event )
						local imgCent4Frame4 = function ( imgCent4, event )
							local imgCent4Frame5 = function ( imgCent4, event )
								local imgCent4Frame6 = function ( imgCent4, event )
									local imgCent4Frame7 = function ( imgCent4, event )
										if not event.interrupted then
											imgCent4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										imgCent4:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( imgCent4, event )
										else
											imgCent4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										imgCent4Frame7( imgCent4, event )
										return 
									else
										imgCent4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										imgCent4:registerEventHandler( "transition_complete_keyframe", imgCent4Frame7 )
									end
								end
								
								if event.interrupted then
									imgCent4Frame6( imgCent4, event )
									return 
								else
									imgCent4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									imgCent4:setAlpha( 0.44 )
									imgCent4:registerEventHandler( "transition_complete_keyframe", imgCent4Frame6 )
								end
							end
							
							if event.interrupted then
								imgCent4Frame5( imgCent4, event )
								return 
							else
								imgCent4:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								imgCent4:setAlpha( 1 )
								imgCent4:registerEventHandler( "transition_complete_keyframe", imgCent4Frame5 )
							end
						end
						
						if event.interrupted then
							imgCent4Frame4( imgCent4, event )
							return 
						else
							imgCent4:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							imgCent4:setAlpha( 0.75 )
							imgCent4:registerEventHandler( "transition_complete_keyframe", imgCent4Frame4 )
						end
					end
					
					if event.interrupted then
						imgCent4Frame3( imgCent4, event )
						return 
					else
						imgCent4:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
						imgCent4:registerEventHandler( "transition_complete_keyframe", imgCent4Frame3 )
					end
				end
				
				imgCent4:completeAnimation()
				self.imgCent4:setAlpha( 0 )
				imgCent4Frame2( imgCent4, {} )
				local BootWidgetCent10Frame2 = function ( BootWidgetCent10, event )
					local BootWidgetCent10Frame3 = function ( BootWidgetCent10, event )
						local BootWidgetCent10Frame4 = function ( BootWidgetCent10, event )
							local BootWidgetCent10Frame5 = function ( BootWidgetCent10, event )
								local BootWidgetCent10Frame6 = function ( BootWidgetCent10, event )
									local BootWidgetCent10Frame7 = function ( BootWidgetCent10, event )
										local BootWidgetCent10Frame8 = function ( BootWidgetCent10, event )
											local BootWidgetCent10Frame9 = function ( BootWidgetCent10, event )
												local BootWidgetCent10Frame10 = function ( BootWidgetCent10, event )
													local BootWidgetCent10Frame11 = function ( BootWidgetCent10, event )
														local BootWidgetCent10Frame12 = function ( BootWidgetCent10, event )
															local BootWidgetCent10Frame13 = function ( BootWidgetCent10, event )
																local BootWidgetCent10Frame14 = function ( BootWidgetCent10, event )
																	local BootWidgetCent10Frame15 = function ( BootWidgetCent10, event )
																		local BootWidgetCent10Frame16 = function ( BootWidgetCent10, event )
																			local BootWidgetCent10Frame17 = function ( BootWidgetCent10, event )
																				local BootWidgetCent10Frame18 = function ( BootWidgetCent10, event )
																					local BootWidgetCent10Frame19 = function ( BootWidgetCent10, event )
																						local BootWidgetCent10Frame20 = function ( BootWidgetCent10, event )
																							local BootWidgetCent10Frame21 = function ( BootWidgetCent10, event )
																								if not event.interrupted then
																									BootWidgetCent10:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																								end
																								BootWidgetCent10:setLeftRight( true, true, 601, -602 )
																								BootWidgetCent10:setTopBottom( true, true, 232, -232 )
																								BootWidgetCent10:setAlpha( 0 )
																								BootWidgetCent10:setZRot( -2457 )
																								if event.interrupted then
																									self.clipFinished( BootWidgetCent10, event )
																								else
																									BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																								end
																							end
																							
																							if event.interrupted then
																								BootWidgetCent10Frame21( BootWidgetCent10, event )
																								return 
																							else
																								BootWidgetCent10:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
																								BootWidgetCent10:setAlpha( 0 )
																								BootWidgetCent10:setZRot( -2196.36 )
																								BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							BootWidgetCent10Frame20( BootWidgetCent10, event )
																							return 
																						else
																							BootWidgetCent10:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
																							BootWidgetCent10:setAlpha( 0.81 )
																							BootWidgetCent10:setZRot( -1649 )
																							BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						BootWidgetCent10Frame19( BootWidgetCent10, event )
																						return 
																					else
																						BootWidgetCent10:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																						BootWidgetCent10:setZRot( -1405.25 )
																						BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					BootWidgetCent10Frame18( BootWidgetCent10, event )
																					return 
																				else
																					BootWidgetCent10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																					BootWidgetCent10:setZRot( -771.5 )
																					BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				BootWidgetCent10Frame17( BootWidgetCent10, event )
																				return 
																			else
																				BootWidgetCent10:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																				BootWidgetCent10:setZRot( -479 )
																				BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			BootWidgetCent10Frame16( BootWidgetCent10, event )
																			return 
																		else
																			BootWidgetCent10:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																			BootWidgetCent10:setZRot( -376 )
																			BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		BootWidgetCent10Frame15( BootWidgetCent10, event )
																		return 
																	else
																		BootWidgetCent10:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																		BootWidgetCent10:setZRot( -207 )
																		BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame15 )
																	end
																end
																
																if event.interrupted then
																	BootWidgetCent10Frame14( BootWidgetCent10, event )
																	return 
																else
																	BootWidgetCent10:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																	BootWidgetCent10:setZRot( -125 )
																	BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame14 )
																end
															end
															
															if event.interrupted then
																BootWidgetCent10Frame13( BootWidgetCent10, event )
																return 
															else
																BootWidgetCent10:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
																BootWidgetCent10:setZRot( -50 )
																BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame13 )
															end
														end
														
														if event.interrupted then
															BootWidgetCent10Frame12( BootWidgetCent10, event )
															return 
														else
															BootWidgetCent10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															BootWidgetCent10:setAlpha( 1 )
															BootWidgetCent10:setZRot( 36.45 )
															BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame12 )
														end
													end
													
													if event.interrupted then
														BootWidgetCent10Frame11( BootWidgetCent10, event )
														return 
													else
														BootWidgetCent10:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
														BootWidgetCent10:setAlpha( 0.95 )
														BootWidgetCent10:setZRot( 41 )
														BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame11 )
													end
												end
												
												if event.interrupted then
													BootWidgetCent10Frame10( BootWidgetCent10, event )
													return 
												else
													BootWidgetCent10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													BootWidgetCent10:setZRot( 66.9 )
													BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame10 )
												end
											end
											
											if event.interrupted then
												BootWidgetCent10Frame9( BootWidgetCent10, event )
												return 
											else
												BootWidgetCent10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												BootWidgetCent10:setAlpha( 0.6 )
												BootWidgetCent10:setZRot( 74.3 )
												BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame9 )
											end
										end
										
										if event.interrupted then
											BootWidgetCent10Frame8( BootWidgetCent10, event )
											return 
										else
											BootWidgetCent10:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											BootWidgetCent10:setZRot( 78 )
											BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame8 )
										end
									end
									
									if event.interrupted then
										BootWidgetCent10Frame7( BootWidgetCent10, event )
										return 
									else
										BootWidgetCent10:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										BootWidgetCent10:setAlpha( 1 )
										BootWidgetCent10:setZRot( 89.1 )
										BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame7 )
									end
								end
								
								if event.interrupted then
									BootWidgetCent10Frame6( BootWidgetCent10, event )
									return 
								else
									BootWidgetCent10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BootWidgetCent10:setZRot( 92.8 )
									BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame6 )
								end
							end
							
							if event.interrupted then
								BootWidgetCent10Frame5( BootWidgetCent10, event )
								return 
							else
								BootWidgetCent10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								BootWidgetCent10:setAlpha( 0.5 )
								BootWidgetCent10:setZRot( 100.2 )
								BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame5 )
							end
						end
						
						if event.interrupted then
							BootWidgetCent10Frame4( BootWidgetCent10, event )
							return 
						else
							BootWidgetCent10:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							BootWidgetCent10:setAlpha( 0.27 )
							BootWidgetCent10:setZRot( 103.9 )
							BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame4 )
						end
					end
					
					if event.interrupted then
						BootWidgetCent10Frame3( BootWidgetCent10, event )
						return 
					else
						BootWidgetCent10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BootWidgetCent10:setAlpha( 0.34 )
						BootWidgetCent10:setZRot( 111.3 )
						BootWidgetCent10:registerEventHandler( "transition_complete_keyframe", BootWidgetCent10Frame3 )
					end
				end
				
				BootWidgetCent10:completeAnimation()
				self.BootWidgetCent10:setLeftRight( true, true, 601, -602 )
				self.BootWidgetCent10:setTopBottom( true, true, 232, -232 )
				self.BootWidgetCent10:setAlpha( 0 )
				self.BootWidgetCent10:setZRot( 115 )
				BootWidgetCent10Frame2( BootWidgetCent10, {} )
				local imgCent2Outter2Frame2 = function ( imgCent2Outter2, event )
					local imgCent2Outter2Frame3 = function ( imgCent2Outter2, event )
						local imgCent2Outter2Frame4 = function ( imgCent2Outter2, event )
							local imgCent2Outter2Frame5 = function ( imgCent2Outter2, event )
								if not event.interrupted then
									imgCent2Outter2:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
								end
								imgCent2Outter2:setLeftRight( true, true, 500, -501.94 )
								imgCent2Outter2:setTopBottom( true, true, 227.29, -228 )
								imgCent2Outter2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( imgCent2Outter2, event )
								else
									imgCent2Outter2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								imgCent2Outter2Frame5( imgCent2Outter2, event )
								return 
							else
								imgCent2Outter2:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
								imgCent2Outter2:registerEventHandler( "transition_complete_keyframe", imgCent2Outter2Frame5 )
							end
						end
						
						if event.interrupted then
							imgCent2Outter2Frame4( imgCent2Outter2, event )
							return 
						else
							imgCent2Outter2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							imgCent2Outter2:setAlpha( 1 )
							imgCent2Outter2:registerEventHandler( "transition_complete_keyframe", imgCent2Outter2Frame4 )
						end
					end
					
					if event.interrupted then
						imgCent2Outter2Frame3( imgCent2Outter2, event )
						return 
					else
						imgCent2Outter2:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						imgCent2Outter2:registerEventHandler( "transition_complete_keyframe", imgCent2Outter2Frame3 )
					end
				end
				
				imgCent2Outter2:completeAnimation()
				self.imgCent2Outter2:setLeftRight( true, true, 500, -501.94 )
				self.imgCent2Outter2:setTopBottom( true, true, 227.29, -228 )
				self.imgCent2Outter2:setAlpha( 0 )
				imgCent2Outter2Frame2( imgCent2Outter2, {} )
				local imgCent2OutterFrame2 = function ( imgCent2Outter, event )
					local imgCent2OutterFrame3 = function ( imgCent2Outter, event )
						local imgCent2OutterFrame4 = function ( imgCent2Outter, event )
							local imgCent2OutterFrame5 = function ( imgCent2Outter, event )
								local imgCent2OutterFrame6 = function ( imgCent2Outter, event )
									local imgCent2OutterFrame7 = function ( imgCent2Outter, event )
										if not event.interrupted then
											imgCent2Outter:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
										end
										imgCent2Outter:setLeftRight( true, true, 515, -515 )
										imgCent2Outter:setTopBottom( true, true, 241, -241 )
										imgCent2Outter:setAlpha( 0 )
										imgCent2Outter:setZRot( -267 )
										if event.interrupted then
											self.clipFinished( imgCent2Outter, event )
										else
											imgCent2Outter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										imgCent2OutterFrame7( imgCent2Outter, event )
										return 
									else
										imgCent2Outter:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
										imgCent2Outter:setZRot( -267 )
										imgCent2Outter:registerEventHandler( "transition_complete_keyframe", imgCent2OutterFrame7 )
									end
								end
								
								if event.interrupted then
									imgCent2OutterFrame6( imgCent2Outter, event )
									return 
								else
									imgCent2Outter:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
									imgCent2Outter:setAlpha( 0.23 )
									imgCent2Outter:setZRot( -182.16 )
									imgCent2Outter:registerEventHandler( "transition_complete_keyframe", imgCent2OutterFrame6 )
								end
							end
							
							if event.interrupted then
								imgCent2OutterFrame5( imgCent2Outter, event )
								return 
							else
								imgCent2Outter:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
								imgCent2Outter:setAlpha( 0.15 )
								imgCent2Outter:setZRot( -99.81 )
								imgCent2Outter:registerEventHandler( "transition_complete_keyframe", imgCent2OutterFrame5 )
							end
						end
						
						if event.interrupted then
							imgCent2OutterFrame4( imgCent2Outter, event )
							return 
						else
							imgCent2Outter:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							imgCent2Outter:setZRot( -27.45 )
							imgCent2Outter:registerEventHandler( "transition_complete_keyframe", imgCent2OutterFrame4 )
						end
					end
					
					if event.interrupted then
						imgCent2OutterFrame3( imgCent2Outter, event )
						return 
					else
						imgCent2Outter:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						imgCent2Outter:setLeftRight( true, true, 515, -515 )
						imgCent2Outter:setTopBottom( true, true, 241, -241 )
						imgCent2Outter:setZRot( -12.48 )
						imgCent2Outter:registerEventHandler( "transition_complete_keyframe", imgCent2OutterFrame3 )
					end
				end
				
				imgCent2Outter:completeAnimation()
				self.imgCent2Outter:setLeftRight( true, true, 552, -552 )
				self.imgCent2Outter:setTopBottom( true, true, 276, -276 )
				self.imgCent2Outter:setAlpha( 0 )
				self.imgCent2Outter:setZRot( 0 )
				imgCent2OutterFrame2( imgCent2Outter, {} )
				local imgCent2Frame2 = function ( imgCent2, event )
					local imgCent2Frame3 = function ( imgCent2, event )
						local imgCent2Frame4 = function ( imgCent2, event )
							if not event.interrupted then
								imgCent2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							end
							imgCent2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( imgCent2, event )
							else
								imgCent2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							imgCent2Frame4( imgCent2, event )
							return 
						else
							imgCent2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							imgCent2:setAlpha( 0.54 )
							imgCent2:registerEventHandler( "transition_complete_keyframe", imgCent2Frame4 )
						end
					end
					
					if event.interrupted then
						imgCent2Frame3( imgCent2, event )
						return 
					else
						imgCent2:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
						imgCent2:registerEventHandler( "transition_complete_keyframe", imgCent2Frame3 )
					end
				end
				
				imgCent2:completeAnimation()
				self.imgCent2:setAlpha( 0 )
				imgCent2Frame2( imgCent2, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									if not event.interrupted then
										Image0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
									end
									Image0:setLeftRight( true, true, -315.28, 315.28 )
									Image0:setTopBottom( true, true, -178.34, 176.34 )
									Image0:setRGB( 0, 0, 0 )
									Image0:setZoom( -26 )
									if event.interrupted then
										self.clipFinished( Image0, event )
									else
										Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									Image0:setRGB( 0.42, 0.56, 0.54 )
									Image0:setZoom( -7.05 )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
								Image0:setRGB( 0.55, 0.73, 0.71 )
								Image0:setZoom( 8.44 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							Image0:setRGB( 0.72, 0.72, 0.72 )
							Image0:setZoom( 42 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, true, -315.28, 315.28 )
				self.Image0:setTopBottom( true, true, -178.34, 176.34 )
				self.Image0:setRGB( 0, 0, 0 )
				self.Image0:setZoom( 0 )
				Image0Frame2( Image0, {} )
				local Image00Frame2 = function ( Image00, event )
					local Image00Frame3 = function ( Image00, event )
						local Image00Frame4 = function ( Image00, event )
							local Image00Frame5 = function ( Image00, event )
								local Image00Frame6 = function ( Image00, event )
									local Image00Frame7 = function ( Image00, event )
										local Image00Frame8 = function ( Image00, event )
											if not event.interrupted then
												Image00:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
											end
											Image00:setRGB( 0, 0, 0 )
											Image00:setZoom( -135 )
											if event.interrupted then
												self.clipFinished( Image00, event )
											else
												Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											Image00Frame8( Image00, event )
											return 
										else
											Image00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Image00:setRGB( 0.02, 0.52, 0.49 )
											Image00:setZoom( -121.87 )
											Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame8 )
										end
									end
									
									if event.interrupted then
										Image00Frame7( Image00, event )
										return 
									else
										Image00:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										Image00:setRGB( 0.49, 0.58, 0.63 )
										Image00:setZoom( -117.49 )
										Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame7 )
									end
								end
								
								if event.interrupted then
									Image00Frame6( Image00, event )
									return 
								else
									Image00:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Image00:setRGB( 0.31, 0.52, 0.54 )
									Image00:setZoom( -110.93 )
									Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame6 )
								end
							end
							
							if event.interrupted then
								Image00Frame5( Image00, event )
								return 
							else
								Image00:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								Image00:setRGB( 0.14, 0.46, 0.45 )
								Image00:setZoom( -60.97 )
								Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame5 )
							end
						end
						
						if event.interrupted then
							Image00Frame4( Image00, event )
							return 
						else
							Image00:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							Image00:setRGB( 0.09, 0.28, 0.28 )
							Image00:setZoom( 22.3 )
							Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame4 )
						end
					end
					
					if event.interrupted then
						Image00Frame3( Image00, event )
						return 
					else
						Image00:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Linear )
						Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame3 )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setRGB( 0, 0, 0 )
				self.Image00:setZoom( 3 )
				Image00Frame2( Image00, {} )
				local img1Frame2 = function ( img1, event )
					local img1Frame3 = function ( img1, event )
						local img1Frame4 = function ( img1, event )
							local img1Frame5 = function ( img1, event )
								local img1Frame6 = function ( img1, event )
									local img1Frame7 = function ( img1, event )
										local img1Frame8 = function ( img1, event )
											local img1Frame9 = function ( img1, event )
												if not event.interrupted then
													img1:beginAnimation( "keyframe", 90, true, false, CoD.TweenType.Linear )
												end
												img1:setLeftRight( true, true, -7500, 7500 )
												img1:setTopBottom( true, true, -4200, 4200 )
												img1:setRGB( 0, 0, 0 )
												img1:setAlpha( 0.6 )
												img1:setZoom( 1000 )
												if event.interrupted then
													self.clipFinished( img1, event )
												else
													img1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												img1Frame9( img1, event )
												return 
											else
												img1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
												img1:setLeftRight( true, true, -6375, 6375 )
												img1:setTopBottom( true, true, -3570, 3570 )
												img1:setRGB( 0, 0.55, 0.42 )
												img1:setZoom( 655.93 )
												img1:registerEventHandler( "transition_complete_keyframe", img1Frame9 )
											end
										end
										
										if event.interrupted then
											img1Frame8( img1, event )
											return 
										else
											img1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
											img1:setLeftRight( true, true, -5375, 5375 )
											img1:setTopBottom( true, true, -3010, 3010 )
											img1:setRGB( 0.19, 0.66, 0.59 )
											img1:setZoom( 370 )
											img1:registerEventHandler( "transition_complete_keyframe", img1Frame8 )
										end
									end
									
									if event.interrupted then
										img1Frame7( img1, event )
										return 
									else
										img1:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										img1:setLeftRight( true, true, -2591.19, 2591.19 )
										img1:setTopBottom( true, true, -1451.06, 1451.06 )
										img1:setRGB( 0.63, 0.91, 1 )
										img1:setAlpha( 0.6 )
										img1:setZoom( 29.77 )
										img1:registerEventHandler( "transition_complete_keyframe", img1Frame7 )
									end
								end
								
								if event.interrupted then
									img1Frame6( img1, event )
									return 
								else
									img1:beginAnimation( "keyframe", 180, true, false, CoD.TweenType.Linear )
									img1:setRGB( 0.84, 0.96, 1 )
									img1:setAlpha( 0.43 )
									img1:setZoom( -400 )
									img1:registerEventHandler( "transition_complete_keyframe", img1Frame6 )
								end
							end
							
							if event.interrupted then
								img1Frame5( img1, event )
								return 
							else
								img1:beginAnimation( "keyframe", 169, false, true, CoD.TweenType.Linear )
								img1:setLeftRight( true, true, 0, 0 )
								img1:setTopBottom( true, true, 0, 0 )
								img1:setRGB( 1, 1, 1 )
								img1:setAlpha( 0.31 )
								img1:registerEventHandler( "transition_complete_keyframe", img1Frame5 )
							end
						end
						
						if event.interrupted then
							img1Frame4( img1, event )
							return 
						else
							img1:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							img1:setLeftRight( true, true, -54.4, 54.4 )
							img1:setTopBottom( true, true, -31.17, 31.17 )
							img1:setRGB( 0, 0.55, 0.46 )
							img1:setAlpha( 0.19 )
							img1:registerEventHandler( "transition_complete_keyframe", img1Frame4 )
						end
					end
					
					if event.interrupted then
						img1Frame3( img1, event )
						return 
					else
						img1:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						img1:registerEventHandler( "transition_complete_keyframe", img1Frame3 )
					end
				end
				
				img1:completeAnimation()
				self.img1:setLeftRight( true, true, -96, 96 )
				self.img1:setTopBottom( true, true, -55, 55 )
				self.img1:setRGB( 0, 0, 0 )
				self.img1:setAlpha( 0.1 )
				self.img1:setZoom( -1000 )
				img1Frame2( img1, {} )
				local img1bFrame2 = function ( img1b, event )
					local img1bFrame3 = function ( img1b, event )
						local img1bFrame4 = function ( img1b, event )
							local img1bFrame5 = function ( img1b, event )
								local img1bFrame6 = function ( img1b, event )
									local img1bFrame7 = function ( img1b, event )
										local img1bFrame8 = function ( img1b, event )
											local img1bFrame9 = function ( img1b, event )
												if not event.interrupted then
													img1b:beginAnimation( "keyframe", 89, true, false, CoD.TweenType.Linear )
												end
												img1b:setLeftRight( true, true, -7500, 7500 )
												img1b:setTopBottom( true, true, -4200, 4200 )
												img1b:setRGB( 0, 0, 0 )
												img1b:setZoom( 1000 )
												if event.interrupted then
													self.clipFinished( img1b, event )
												else
													img1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												img1bFrame9( img1b, event )
												return 
											else
												img1b:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
												img1b:setLeftRight( true, true, -6375, 6375 )
												img1b:setTopBottom( true, true, -3570, 3570 )
												img1b:setRGB( 0, 0.55, 0.42 )
												img1b:setZoom( 651.43 )
												img1b:registerEventHandler( "transition_complete_keyframe", img1bFrame9 )
											end
										end
										
										if event.interrupted then
											img1bFrame8( img1b, event )
											return 
										else
											img1b:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
											img1b:setLeftRight( true, true, -5500, 5500 )
											img1b:setTopBottom( true, true, -3080, 3080 )
											img1b:setRGB( 0.16, 0.65, 0.57 )
											img1b:setZoom( 416.67 )
											img1b:registerEventHandler( "transition_complete_keyframe", img1bFrame8 )
										end
									end
									
									if event.interrupted then
										img1bFrame7( img1b, event )
										return 
									else
										img1b:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										img1b:setLeftRight( true, true, -2591.19, 2591.19 )
										img1b:setTopBottom( true, true, -1451.06, 1451.06 )
										img1b:setRGB( 0.63, 0.91, 1 )
										img1b:setZoom( 45.46 )
										img1b:registerEventHandler( "transition_complete_keyframe", img1bFrame7 )
									end
								end
								
								if event.interrupted then
									img1bFrame6( img1b, event )
									return 
								else
									img1b:beginAnimation( "keyframe", 179, true, false, CoD.TweenType.Linear )
									img1b:setRGB( 0.84, 0.96, 1 )
									img1b:setZoom( -400 )
									img1b:registerEventHandler( "transition_complete_keyframe", img1bFrame6 )
								end
							end
							
							if event.interrupted then
								img1bFrame5( img1b, event )
								return 
							else
								img1b:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
								img1b:setLeftRight( true, true, 0, 0 )
								img1b:setTopBottom( true, true, 0, 0 )
								img1b:setRGB( 1, 1, 1 )
								img1b:registerEventHandler( "transition_complete_keyframe", img1bFrame5 )
							end
						end
						
						if event.interrupted then
							img1bFrame4( img1b, event )
							return 
						else
							img1b:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							img1b:setLeftRight( true, true, -53.83, 53.83 )
							img1b:setTopBottom( true, true, -31.17, 31.17 )
							img1b:setRGB( 0, 0.55, 0.46 )
							img1b:registerEventHandler( "transition_complete_keyframe", img1bFrame4 )
						end
					end
					
					if event.interrupted then
						img1bFrame3( img1b, event )
						return 
					else
						img1b:beginAnimation( "keyframe", 1179, false, false, CoD.TweenType.Linear )
						img1b:setLeftRight( true, true, -95, 95 )
						img1b:setTopBottom( true, true, -55, 55 )
						img1b:registerEventHandler( "transition_complete_keyframe", img1bFrame3 )
					end
				end
				
				img1b:completeAnimation()
				self.img1b:setLeftRight( true, true, -96.39, 97.39 )
				self.img1b:setTopBottom( true, true, -55.5, 53.5 )
				self.img1b:setRGB( 0, 0, 0 )
				self.img1b:setZoom( -1000 )
				img1bFrame2( img1b, {} )
				local img2Frame2 = function ( img2, event )
					local img2Frame3 = function ( img2, event )
						local img2Frame4 = function ( img2, event )
							local img2Frame5 = function ( img2, event )
								local img2Frame6 = function ( img2, event )
									local img2Frame7 = function ( img2, event )
										local img2Frame8 = function ( img2, event )
											local img2Frame9 = function ( img2, event )
												if not event.interrupted then
													img2:beginAnimation( "keyframe", 89, true, false, CoD.TweenType.Linear )
												end
												img2:setLeftRight( true, true, -7500, 7500 )
												img2:setTopBottom( true, true, -4200, 4200 )
												img2:setRGB( 0, 0, 0 )
												img2:setAlpha( 0.5 )
												img2:setZoom( 1000 )
												if event.interrupted then
													self.clipFinished( img2, event )
												else
													img2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												img2Frame9( img2, event )
												return 
											else
												img2:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
												img2:setLeftRight( true, true, -6375, 6375 )
												img2:setTopBottom( true, true, -3570, 3570 )
												img2:setRGB( 0, 0.55, 0.42 )
												img2:setZoom( 637.49 )
												img2:registerEventHandler( "transition_complete_keyframe", img2Frame9 )
											end
										end
										
										if event.interrupted then
											img2Frame8( img2, event )
											return 
										else
											img2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											img2:setLeftRight( true, true, -5500, 5500 )
											img2:setTopBottom( true, true, -3080, 3080 )
											img2:setRGB( 0.16, 0.65, 0.57 )
											img2:setZoom( 393.33 )
											img2:registerEventHandler( "transition_complete_keyframe", img2Frame8 )
										end
									end
									
									if event.interrupted then
										img2Frame7( img2, event )
										return 
									else
										img2:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										img2:setLeftRight( true, true, -2591.19, 2591.19 )
										img2:setTopBottom( true, true, -1451.07, 1451.07 )
										img2:setRGB( 0.63, 0.91, 1 )
										img2:setAlpha( 0.5 )
										img2:setZoom( 32.73 )
										img2:registerEventHandler( "transition_complete_keyframe", img2Frame7 )
									end
								end
								
								if event.interrupted then
									img2Frame6( img2, event )
									return 
								else
									img2:beginAnimation( "keyframe", 180, true, false, CoD.TweenType.Linear )
									img2:setRGB( 0.84, 0.96, 1 )
									img2:setAlpha( 0.37 )
									img2:setZoom( -400 )
									img2:registerEventHandler( "transition_complete_keyframe", img2Frame6 )
								end
							end
							
							if event.interrupted then
								img2Frame5( img2, event )
								return 
							else
								img2:beginAnimation( "keyframe", 169, false, true, CoD.TweenType.Linear )
								img2:setLeftRight( true, true, 0, 0 )
								img2:setTopBottom( true, true, 0, 0 )
								img2:setRGB( 1, 1, 1 )
								img2:setAlpha( 0.27 )
								img2:registerEventHandler( "transition_complete_keyframe", img2Frame5 )
							end
						end
						
						if event.interrupted then
							img2Frame4( img2, event )
							return 
						else
							img2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							img2:setLeftRight( true, true, -53.83, 53.83 )
							img2:setTopBottom( true, true, -31.17, 31.17 )
							img2:setRGB( 0, 0.55, 0.46 )
							img2:setAlpha( 0.17 )
							img2:registerEventHandler( "transition_complete_keyframe", img2Frame4 )
						end
					end
					
					if event.interrupted then
						img2Frame3( img2, event )
						return 
					else
						img2:beginAnimation( "keyframe", 1259, false, false, CoD.TweenType.Linear )
						img2:setLeftRight( true, true, -95, 95 )
						img2:setTopBottom( true, true, -55, 55 )
						img2:registerEventHandler( "transition_complete_keyframe", img2Frame3 )
					end
				end
				
				img2:completeAnimation()
				self.img2:setLeftRight( true, true, -96.39, 97.39 )
				self.img2:setTopBottom( true, true, -55.5, 53.5 )
				self.img2:setRGB( 0, 0, 0 )
				self.img2:setAlpha( 0.1 )
				self.img2:setZoom( -1000 )
				img2Frame2( img2, {} )
				local img2bFrame2 = function ( img2b, event )
					local img2bFrame3 = function ( img2b, event )
						local img2bFrame4 = function ( img2b, event )
							local img2bFrame5 = function ( img2b, event )
								local img2bFrame6 = function ( img2b, event )
									local img2bFrame7 = function ( img2b, event )
										local img2bFrame8 = function ( img2b, event )
											local img2bFrame9 = function ( img2b, event )
												if not event.interrupted then
													img2b:beginAnimation( "keyframe", 90, true, false, CoD.TweenType.Linear )
												end
												img2b:setLeftRight( true, true, -7500, 7500 )
												img2b:setTopBottom( true, true, -4200, 4200 )
												img2b:setRGB( 0, 0, 0 )
												img2b:setZoom( 1000 )
												if event.interrupted then
													self.clipFinished( img2b, event )
												else
													img2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												img2bFrame9( img2b, event )
												return 
											else
												img2b:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
												img2b:setLeftRight( true, true, -6375, 6375 )
												img2b:setTopBottom( true, true, -3570, 3570 )
												img2b:setRGB( 0, 0.55, 0.42 )
												img2b:setZoom( 595.66 )
												img2b:registerEventHandler( "transition_complete_keyframe", img2bFrame9 )
											end
										end
										
										if event.interrupted then
											img2bFrame8( img2b, event )
											return 
										else
											img2b:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											img2b:setLeftRight( true, true, -5500, 5500 )
											img2b:setTopBottom( true, true, -3080, 3080 )
											img2b:setRGB( 0.16, 0.65, 0.57 )
											img2b:setZoom( 323.33 )
											img2b:registerEventHandler( "transition_complete_keyframe", img2bFrame8 )
										end
									end
									
									if event.interrupted then
										img2bFrame7( img2b, event )
										return 
									else
										img2b:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
										img2b:setLeftRight( true, true, -2591.18, 2591.18 )
										img2b:setTopBottom( true, true, -1451.06, 1451.06 )
										img2b:setRGB( 0.63, 0.91, 1 )
										img2b:setZoom( -5.46 )
										img2b:registerEventHandler( "transition_complete_keyframe", img2bFrame7 )
									end
								end
								
								if event.interrupted then
									img2bFrame6( img2b, event )
									return 
								else
									img2b:beginAnimation( "keyframe", 180, true, false, CoD.TweenType.Linear )
									img2b:setRGB( 0.84, 0.96, 1 )
									img2b:setZoom( -400 )
									img2b:registerEventHandler( "transition_complete_keyframe", img2bFrame6 )
								end
							end
							
							if event.interrupted then
								img2bFrame5( img2b, event )
								return 
							else
								img2b:beginAnimation( "keyframe", 169, false, true, CoD.TweenType.Linear )
								img2b:setLeftRight( true, true, 0, 0 )
								img2b:setTopBottom( true, true, 0, 0 )
								img2b:setRGB( 1, 1, 1 )
								img2b:registerEventHandler( "transition_complete_keyframe", img2bFrame5 )
							end
						end
						
						if event.interrupted then
							img2bFrame4( img2b, event )
							return 
						else
							img2b:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							img2b:setLeftRight( true, true, -53.83, 53.83 )
							img2b:setTopBottom( true, true, -31.17, 31.17 )
							img2b:setRGB( 0, 0.55, 0.46 )
							img2b:registerEventHandler( "transition_complete_keyframe", img2bFrame4 )
						end
					end
					
					if event.interrupted then
						img2bFrame3( img2b, event )
						return 
					else
						img2b:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
						img2b:setLeftRight( true, true, -95, 95 )
						img2b:setTopBottom( true, true, -55, 55 )
						img2b:registerEventHandler( "transition_complete_keyframe", img2bFrame3 )
					end
				end
				
				img2b:completeAnimation()
				self.img2b:setLeftRight( true, true, -96.39, 97.39 )
				self.img2b:setTopBottom( true, true, -55.5, 53.5 )
				self.img2b:setRGB( 0, 0, 0 )
				self.img2b:setZoom( -1000 )
				img2bFrame2( img2b, {} )
				local img3Frame2 = function ( img3, event )
					local img3Frame3 = function ( img3, event )
						local img3Frame4 = function ( img3, event )
							local img3Frame5 = function ( img3, event )
								local img3Frame6 = function ( img3, event )
									local img3Frame7 = function ( img3, event )
										local img3Frame8 = function ( img3, event )
											local img3Frame9 = function ( img3, event )
												if not event.interrupted then
													img3:beginAnimation( "keyframe", 89, true, false, CoD.TweenType.Linear )
												end
												img3:setLeftRight( true, true, -7500, 7500 )
												img3:setTopBottom( true, true, -4200, 4200 )
												img3:setRGB( 0, 0, 0 )
												img3:setAlpha( 0.4 )
												img3:setZoom( 1000 )
												if event.interrupted then
													self.clipFinished( img3, event )
												else
													img3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												img3Frame9( img3, event )
												return 
											else
												img3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
												img3:setLeftRight( true, true, -6375, 6375 )
												img3:setTopBottom( true, true, -3570, 3570 )
												img3:setRGB( 0, 0.55, 0.42 )
												img3:setZoom( 471.88 )
												img3:registerEventHandler( "transition_complete_keyframe", img3Frame9 )
											end
										end
										
										if event.interrupted then
											img3Frame8( img3, event )
											return 
										else
											img3:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
											img3:setLeftRight( true, true, -5750, 5750 )
											img3:setTopBottom( true, true, -3220, 3220 )
											img3:setRGB( 0.12, 0.62, 0.53 )
											img3:setZoom( 263.37 )
											img3:registerEventHandler( "transition_complete_keyframe", img3Frame8 )
										end
									end
									
									if event.interrupted then
										img3Frame7( img3, event )
										return 
									else
										img3:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										img3:setLeftRight( true, true, -2591.19, 2591.19 )
										img3:setTopBottom( true, true, -1451.07, 1451.07 )
										img3:setRGB( 0.63, 0.91, 1 )
										img3:setAlpha( 0.4 )
										img3:setZoom( -53.89 )
										img3:registerEventHandler( "transition_complete_keyframe", img3Frame7 )
									end
								end
								
								if event.interrupted then
									img3Frame6( img3, event )
									return 
								else
									img3:beginAnimation( "keyframe", 179, true, false, CoD.TweenType.Linear )
									img3:setRGB( 0.84, 0.96, 1 )
									img3:setAlpha( 0.3 )
									img3:setZoom( -400 )
									img3:registerEventHandler( "transition_complete_keyframe", img3Frame6 )
								end
							end
							
							if event.interrupted then
								img3Frame5( img3, event )
								return 
							else
								img3:beginAnimation( "keyframe", 170, false, true, CoD.TweenType.Linear )
								img3:setLeftRight( true, true, 0, 0 )
								img3:setTopBottom( true, true, 0, 0 )
								img3:setRGB( 1, 1, 1 )
								img3:setAlpha( 0.23 )
								img3:registerEventHandler( "transition_complete_keyframe", img3Frame5 )
							end
						end
						
						if event.interrupted then
							img3Frame4( img3, event )
							return 
						else
							img3:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							img3:setLeftRight( true, true, -53.83, 53.83 )
							img3:setTopBottom( true, true, -31.17, 31.17 )
							img3:setRGB( 0, 0.55, 0.46 )
							img3:setAlpha( 0.15 )
							img3:registerEventHandler( "transition_complete_keyframe", img3Frame4 )
						end
					end
					
					if event.interrupted then
						img3Frame3( img3, event )
						return 
					else
						img3:beginAnimation( "keyframe", 1419, false, false, CoD.TweenType.Linear )
						img3:setLeftRight( true, true, -95, 95 )
						img3:setTopBottom( true, true, -55, 55 )
						img3:registerEventHandler( "transition_complete_keyframe", img3Frame3 )
					end
				end
				
				img3:completeAnimation()
				self.img3:setLeftRight( true, true, -96.39, 97.39 )
				self.img3:setTopBottom( true, true, -55.5, 53.5 )
				self.img3:setRGB( 0, 0, 0 )
				self.img3:setAlpha( 0.1 )
				self.img3:setZoom( -1000 )
				img3Frame2( img3, {} )
				local img3bFrame2 = function ( img3b, event )
					local img3bFrame3 = function ( img3b, event )
						local img3bFrame4 = function ( img3b, event )
							local img3bFrame5 = function ( img3b, event )
								local img3bFrame6 = function ( img3b, event )
									local img3bFrame7 = function ( img3b, event )
										local img3bFrame8 = function ( img3b, event )
											local img3bFrame9 = function ( img3b, event )
												if not event.interrupted then
													img3b:beginAnimation( "keyframe", 89, true, false, CoD.TweenType.Linear )
												end
												img3b:setLeftRight( true, true, -7500, 7500 )
												img3b:setTopBottom( true, true, -4200, 4200 )
												img3b:setRGB( 0, 0, 0 )
												img3b:setZoom( 1000 )
												if event.interrupted then
													self.clipFinished( img3b, event )
												else
													img3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												img3bFrame9( img3b, event )
												return 
											else
												img3b:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												img3b:setLeftRight( true, true, -6375, 6375 )
												img3b:setTopBottom( true, true, -3570, 3570 )
												img3b:setRGB( 0, 0.55, 0.42 )
												img3b:setZoom( 565.05 )
												img3b:registerEventHandler( "transition_complete_keyframe", img3bFrame9 )
											end
										end
										
										if event.interrupted then
											img3bFrame8( img3b, event )
											return 
										else
											img3b:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
											img3b:setLeftRight( true, true, -5750, 5750 )
											img3b:setTopBottom( true, true, -3220, 3220 )
											img3b:setRGB( 0.12, 0.62, 0.53 )
											img3b:setZoom( 393.33 )
											img3b:registerEventHandler( "transition_complete_keyframe", img3bFrame8 )
										end
									end
									
									if event.interrupted then
										img3bFrame7( img3b, event )
										return 
									else
										img3b:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
										img3b:setLeftRight( true, true, -2591.19, 2591.19 )
										img3b:setTopBottom( true, true, -1451.07, 1451.07 )
										img3b:setRGB( 0.63, 0.91, 1 )
										img3b:setZoom( 13.91 )
										img3b:registerEventHandler( "transition_complete_keyframe", img3bFrame7 )
									end
								end
								
								if event.interrupted then
									img3bFrame6( img3b, event )
									return 
								else
									img3b:beginAnimation( "keyframe", 180, true, false, CoD.TweenType.Linear )
									img3b:setRGB( 0.84, 0.96, 1 )
									img3b:setZoom( -400 )
									img3b:registerEventHandler( "transition_complete_keyframe", img3bFrame6 )
								end
							end
							
							if event.interrupted then
								img3bFrame5( img3b, event )
								return 
							else
								img3b:beginAnimation( "keyframe", 169, false, true, CoD.TweenType.Linear )
								img3b:setLeftRight( true, true, 0, 0 )
								img3b:setTopBottom( true, true, 0, 0 )
								img3b:setRGB( 1, 1, 1 )
								img3b:registerEventHandler( "transition_complete_keyframe", img3bFrame5 )
							end
						end
						
						if event.interrupted then
							img3bFrame4( img3b, event )
							return 
						else
							img3b:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							img3b:setLeftRight( true, true, -53.83, 53.83 )
							img3b:setTopBottom( true, true, -31.17, 31.17 )
							img3b:setRGB( 0, 0.55, 0.46 )
							img3b:registerEventHandler( "transition_complete_keyframe", img3bFrame4 )
						end
					end
					
					if event.interrupted then
						img3bFrame3( img3b, event )
						return 
					else
						img3b:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
						img3b:setLeftRight( true, true, -95, 95 )
						img3b:setTopBottom( true, true, -55, 55 )
						img3b:registerEventHandler( "transition_complete_keyframe", img3bFrame3 )
					end
				end
				
				img3b:completeAnimation()
				self.img3b:setLeftRight( true, true, -96.39, 97.39 )
				self.img3b:setTopBottom( true, true, -55.5, 53.5 )
				self.img3b:setRGB( 0, 0, 0 )
				self.img3b:setZoom( -1000 )
				img3bFrame2( img3b, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.BootWidgetPlates10:close()
		self.BootWidgetCent10:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

