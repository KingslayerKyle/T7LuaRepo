-- 2adb121673c1251ea69bc4ddb0b09acb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Tablet.TabletLocationSelector_InternalItems" )

CoD.MinimapHelper = InheritFrom( LUI.UIElement )
CoD.MinimapHelper.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MinimapHelper )
	self.id = "MinimapHelper"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 720 )
	
	local MapGlitch = LUI.UIImage.new()
	MapGlitch:setLeftRight( true, true, -22, 21 )
	MapGlitch:setTopBottom( true, true, 0, 0 )
	MapGlitch:setRGB( 0.76, 0.95, 1 )
	MapGlitch:setAlpha( 0.5 )
	MapGlitch:setImage( RegisterImage( GetCurrentMinimapImageName( "uie_hud_t7_minimap_mp_ethiopia_full" ) ) )
	self:addElement( MapGlitch )
	self.MapGlitch = MapGlitch
	
	local underlayMap0 = LUI.UIImage.new()
	underlayMap0:setLeftRight( true, true, 0, 0 )
	underlayMap0:setTopBottom( true, true, 0, 0 )
	underlayMap0:setAlpha( 0.99 )
	underlayMap0:setupCompassUnderlay( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( underlayMap0 )
	self.underlayMap0 = underlayMap0
	
	local overlay = LUI.UIImage.new()
	overlay:setLeftRight( true, true, 0, 0 )
	overlay:setTopBottom( true, true, 0, 0 )
	overlay:setAlpha( 0.7 )
	overlay:setupCompassOverlay( Enum.CompassType.COMPASS_TYPE_FULL )
	self:addElement( overlay )
	self.overlay = overlay
	
	local Mosiac = LUI.UIImage.new()
	Mosiac:setLeftRight( true, true, -29, 29 )
	Mosiac:setTopBottom( true, true, -30, 26 )
	Mosiac:setRGB( 0.76, 0.95, 1 )
	Mosiac:setAlpha( 0 )
	Mosiac:setImage( RegisterImage( GetCurrentMinimapImageName( "uie_hud_t7_minimap_mp_ethiopia_full" ) ) )
	Mosiac:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	Mosiac:setShaderVector( 0, 16, 0, 0, 0 )
	Mosiac:setShaderVector( 1, 30, 0, 0, 0 )
	Mosiac:setShaderVector( 2, 4, 0, 0, 0 )
	self:addElement( Mosiac )
	self.Mosiac = Mosiac
	
	local Scanlines = LUI.UIImage.new()
	Scanlines:setLeftRight( true, true, 0, 1 )
	Scanlines:setTopBottom( true, true, 0, 0 )
	Scanlines:setRGB( 0.76, 0.95, 1 )
	Scanlines:setAlpha( 0.07 )
	Scanlines:setImage( RegisterImage( GetCurrentMinimapImageName( "uie_hud_t7_minimap_mp_ethiopia_full" ) ) )
	Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	Scanlines:setShaderVector( 0, 0.28, 0, 0, 0 )
	Scanlines:setShaderVector( 1, 0.75, 0, 0, 0 )
	Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
	self:addElement( Scanlines )
	self.Scanlines = Scanlines
	
	local Scroll = LUI.UIImage.new()
	Scroll:setLeftRight( true, true, 0, 1 )
	Scroll:setTopBottom( true, true, 0, 0 )
	Scroll:setRGB( 0.76, 0.95, 1 )
	Scroll:setAlpha( 0.08 )
	Scroll:setImage( RegisterImage( GetCurrentMinimapImageName( "uie_hud_t7_minimap_mp_ethiopia_full" ) ) )
	Scroll:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Scroll:setShaderVector( 0, 0, 0.36, 0, 0 )
	Scroll:setShaderVector( 1, 27.86, 0, 0, 0 )
	self:addElement( Scroll )
	self.Scroll = Scroll
	
	local internalItems = CoD.TabletLocationSelector_InternalItems.new( menu, controller )
	internalItems:setLeftRight( true, true, 1, 2 )
	internalItems:setTopBottom( true, true, -1, 0 )
	Engine.SetupUI3DWindow( controller, 2, 721, 721 )
	internalItems:setUI3DWindow( 2 )
	internalItems:setRGB( 0, 0, 0 )
	self:addElement( internalItems )
	self.internalItems = internalItems
	
	local Add0 = LUI.UIImage.new()
	Add0:setLeftRight( true, true, 0, 1 )
	Add0:setTopBottom( true, true, 0, 0 )
	Add0:setRGB( 0.76, 0.95, 1 )
	Add0:setAlpha( 0.07 )
	Add0:setImage( RegisterImage( GetCurrentMinimapImageName( "uie_hud_t7_minimap_mp_ethiopia_full" ) ) )
	Add0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Add0 )
	self.Add0 = Add0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local MapGlitchFrame2 = function ( MapGlitch, event )
					local MapGlitchFrame3 = function ( MapGlitch, event )
						local MapGlitchFrame4 = function ( MapGlitch, event )
							local MapGlitchFrame5 = function ( MapGlitch, event )
								local MapGlitchFrame6 = function ( MapGlitch, event )
									local MapGlitchFrame7 = function ( MapGlitch, event )
										local MapGlitchFrame8 = function ( MapGlitch, event )
											local MapGlitchFrame9 = function ( MapGlitch, event )
												local MapGlitchFrame10 = function ( MapGlitch, event )
													local MapGlitchFrame11 = function ( MapGlitch, event )
														local MapGlitchFrame12 = function ( MapGlitch, event )
															local MapGlitchFrame13 = function ( MapGlitch, event )
																local MapGlitchFrame14 = function ( MapGlitch, event )
																	local MapGlitchFrame15 = function ( MapGlitch, event )
																		local MapGlitchFrame16 = function ( MapGlitch, event )
																			local MapGlitchFrame17 = function ( MapGlitch, event )
																				local MapGlitchFrame18 = function ( MapGlitch, event )
																					local MapGlitchFrame19 = function ( MapGlitch, event )
																						local MapGlitchFrame20 = function ( MapGlitch, event )
																							if not event.interrupted then
																								MapGlitch:beginAnimation( "keyframe", 690, false, false, CoD.TweenType.Linear )
																							end
																							MapGlitch:setLeftRight( true, true, 0, 1 )
																							MapGlitch:setTopBottom( true, true, 0, 0 )
																							MapGlitch:setAlpha( 0.5 )
																							if event.interrupted then
																								self.clipFinished( MapGlitch, event )
																							else
																								MapGlitch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																							end
																						end
																						
																						if event.interrupted then
																							MapGlitchFrame20( MapGlitch, event )
																							return 
																						else
																							MapGlitch:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																							MapGlitch:setLeftRight( true, true, 0, 1 )
																							MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MapGlitchFrame19( MapGlitch, event )
																						return 
																					else
																						MapGlitch:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																						MapGlitch:setLeftRight( true, true, 0, 12 )
																						MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MapGlitchFrame18( MapGlitch, event )
																					return 
																				else
																					MapGlitch:beginAnimation( "keyframe", 1070, false, false, CoD.TweenType.Linear )
																					MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MapGlitchFrame17( MapGlitch, event )
																				return 
																			else
																				MapGlitch:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																				MapGlitch:setLeftRight( true, true, 0, 1 )
																				MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MapGlitchFrame16( MapGlitch, event )
																			return 
																		else
																			MapGlitch:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																			MapGlitch:setLeftRight( true, true, -22, 21 )
																			MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MapGlitchFrame15( MapGlitch, event )
																		return 
																	else
																		MapGlitch:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
																		MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame15 )
																	end
																end
																
																if event.interrupted then
																	MapGlitchFrame14( MapGlitch, event )
																	return 
																else
																	MapGlitch:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																	MapGlitch:setLeftRight( true, true, 0, 1 )
																	MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame14 )
																end
															end
															
															if event.interrupted then
																MapGlitchFrame13( MapGlitch, event )
																return 
															else
																MapGlitch:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																MapGlitch:setLeftRight( true, true, -7, 14 )
																MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame13 )
															end
														end
														
														if event.interrupted then
															MapGlitchFrame12( MapGlitch, event )
															return 
														else
															MapGlitch:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
															MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame12 )
														end
													end
													
													if event.interrupted then
														MapGlitchFrame11( MapGlitch, event )
														return 
													else
														MapGlitch:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														MapGlitch:setLeftRight( true, true, 0, 1 )
														MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame11 )
													end
												end
												
												if event.interrupted then
													MapGlitchFrame10( MapGlitch, event )
													return 
												else
													MapGlitch:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													MapGlitch:setLeftRight( true, true, -14, 1 )
													MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame10 )
												end
											end
											
											if event.interrupted then
												MapGlitchFrame9( MapGlitch, event )
												return 
											else
												MapGlitch:beginAnimation( "keyframe", 780, false, false, CoD.TweenType.Linear )
												MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame9 )
											end
										end
										
										if event.interrupted then
											MapGlitchFrame8( MapGlitch, event )
											return 
										else
											MapGlitch:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											MapGlitch:setLeftRight( true, true, 0, 1 )
											MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame8 )
										end
									end
									
									if event.interrupted then
										MapGlitchFrame7( MapGlitch, event )
										return 
									else
										MapGlitch:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										MapGlitch:setLeftRight( true, true, -22, 2 )
										MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame7 )
									end
								end
								
								if event.interrupted then
									MapGlitchFrame6( MapGlitch, event )
									return 
								else
									MapGlitch:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
									MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame6 )
								end
							end
							
							if event.interrupted then
								MapGlitchFrame5( MapGlitch, event )
								return 
							else
								MapGlitch:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								MapGlitch:setLeftRight( true, true, 0, 1 )
								MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame5 )
							end
						end
						
						if event.interrupted then
							MapGlitchFrame4( MapGlitch, event )
							return 
						else
							MapGlitch:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							MapGlitch:setLeftRight( true, true, -22, 21 )
							MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame4 )
						end
					end
					
					if event.interrupted then
						MapGlitchFrame3( MapGlitch, event )
						return 
					else
						MapGlitch:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						MapGlitch:registerEventHandler( "transition_complete_keyframe", MapGlitchFrame3 )
					end
				end
				
				MapGlitch:completeAnimation()
				self.MapGlitch:setLeftRight( true, true, 0, 1 )
				self.MapGlitch:setTopBottom( true, true, 0, 0 )
				self.MapGlitch:setAlpha( 0.5 )
				MapGlitchFrame2( MapGlitch, {} )
				local underlayMap0Frame2 = function ( underlayMap0, event )
					local underlayMap0Frame3 = function ( underlayMap0, event )
						local underlayMap0Frame4 = function ( underlayMap0, event )
							local underlayMap0Frame5 = function ( underlayMap0, event )
								local underlayMap0Frame6 = function ( underlayMap0, event )
									local underlayMap0Frame7 = function ( underlayMap0, event )
										local underlayMap0Frame8 = function ( underlayMap0, event )
											local underlayMap0Frame9 = function ( underlayMap0, event )
												if not event.interrupted then
													underlayMap0:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
												end
												underlayMap0:setLeftRight( true, true, 0, 0 )
												underlayMap0:setTopBottom( true, true, 0, 0 )
												underlayMap0:setAlpha( 0.99 )
												if event.interrupted then
													self.clipFinished( underlayMap0, event )
												else
													underlayMap0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												underlayMap0Frame9( underlayMap0, event )
												return 
											else
												underlayMap0:beginAnimation( "keyframe", 700, false, false, CoD.TweenType.Linear )
												underlayMap0:setAlpha( 0.97 )
												underlayMap0:registerEventHandler( "transition_complete_keyframe", underlayMap0Frame9 )
											end
										end
										
										if event.interrupted then
											underlayMap0Frame8( underlayMap0, event )
											return 
										else
											underlayMap0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
											underlayMap0:setAlpha( 0.99 )
											underlayMap0:registerEventHandler( "transition_complete_keyframe", underlayMap0Frame8 )
										end
									end
									
									if event.interrupted then
										underlayMap0Frame7( underlayMap0, event )
										return 
									else
										underlayMap0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										underlayMap0:setAlpha( 0.97 )
										underlayMap0:registerEventHandler( "transition_complete_keyframe", underlayMap0Frame7 )
									end
								end
								
								if event.interrupted then
									underlayMap0Frame6( underlayMap0, event )
									return 
								else
									underlayMap0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
									underlayMap0:setAlpha( 0.99 )
									underlayMap0:registerEventHandler( "transition_complete_keyframe", underlayMap0Frame6 )
								end
							end
							
							if event.interrupted then
								underlayMap0Frame5( underlayMap0, event )
								return 
							else
								underlayMap0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
								underlayMap0:setAlpha( 0.97 )
								underlayMap0:registerEventHandler( "transition_complete_keyframe", underlayMap0Frame5 )
							end
						end
						
						if event.interrupted then
							underlayMap0Frame4( underlayMap0, event )
							return 
						else
							underlayMap0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
							underlayMap0:setAlpha( 0.99 )
							underlayMap0:registerEventHandler( "transition_complete_keyframe", underlayMap0Frame4 )
						end
					end
					
					if event.interrupted then
						underlayMap0Frame3( underlayMap0, event )
						return 
					else
						underlayMap0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						underlayMap0:setAlpha( 0.97 )
						underlayMap0:registerEventHandler( "transition_complete_keyframe", underlayMap0Frame3 )
					end
				end
				
				underlayMap0:completeAnimation()
				self.underlayMap0:setLeftRight( true, true, 0, 0 )
				self.underlayMap0:setTopBottom( true, true, 0, 0 )
				self.underlayMap0:setAlpha( 1 )
				underlayMap0Frame2( underlayMap0, {} )

				Mosiac:completeAnimation()
				self.Mosiac:setAlpha( 0 )
				self.clipFinished( Mosiac, {} )
				local ScanlinesFrame2 = function ( Scanlines, event )
					local ScanlinesFrame3 = function ( Scanlines, event )
						local ScanlinesFrame4 = function ( Scanlines, event )
							local ScanlinesFrame5 = function ( Scanlines, event )
								local ScanlinesFrame6 = function ( Scanlines, event )
									local ScanlinesFrame7 = function ( Scanlines, event )
										if not event.interrupted then
											Scanlines:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										Scanlines:setLeftRight( true, true, 0, 1 )
										Scanlines:setTopBottom( true, true, 0, 0 )
										Scanlines:setAlpha( 0.07 )
										Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
										Scanlines:setShaderVector( 0, 0.28, 0, 0, 0 )
										Scanlines:setShaderVector( 1, 0.75, 0, 0, 0 )
										Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( Scanlines, event )
										else
											Scanlines:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ScanlinesFrame7( Scanlines, event )
										return 
									else
										Scanlines:beginAnimation( "keyframe", 1119, false, false, CoD.TweenType.Linear )
										Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
										Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame7 )
									end
								end
								
								if event.interrupted then
									ScanlinesFrame6( Scanlines, event )
									return 
								else
									Scanlines:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
									Scanlines:setShaderVector( 2, 0.02, 0, 0, 0 )
									Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame6 )
								end
							end
							
							if event.interrupted then
								ScanlinesFrame5( Scanlines, event )
								return 
							else
								Scanlines:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
								Scanlines:setShaderVector( 2, 0.02, 0, 0, 0 )
								Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame5 )
							end
						end
						
						if event.interrupted then
							ScanlinesFrame4( Scanlines, event )
							return 
						else
							Scanlines:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
							Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
							Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame4 )
						end
					end
					
					if event.interrupted then
						ScanlinesFrame3( Scanlines, event )
						return 
					else
						Scanlines:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Scanlines:setShaderVector( 2, 0.02, 0, 0, 0 )
						Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame3 )
					end
				end
				
				Scanlines:completeAnimation()
				self.Scanlines:setLeftRight( true, true, 0, 1 )
				self.Scanlines:setTopBottom( true, true, 0, 0 )
				self.Scanlines:setAlpha( 0.07 )
				self.Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.Scanlines:setShaderVector( 0, 0.28, 0, 0, 0 )
				self.Scanlines:setShaderVector( 1, 0.75, 0, 0, 0 )
				self.Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
				ScanlinesFrame2( Scanlines, {} )

				Scroll:completeAnimation()
				self.Scroll:setLeftRight( true, true, 0, 1 )
				self.Scroll:setTopBottom( true, true, 0, 0 )
				self.Scroll:setAlpha( 0.08 )
				self.Scroll:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
				self.Scroll:setShaderVector( 0, 0, 0.36, 0, 0 )
				self.Scroll:setShaderVector( 1, 25.84, 0, 0, 0 )
				self.clipFinished( Scroll, {} )

				internalItems:completeAnimation()
				self.internalItems:setAlpha( 1 )
				self.clipFinished( internalItems, {} )
				local Add0Frame2 = function ( Add0, event )
					local Add0Frame3 = function ( Add0, event )
						local Add0Frame4 = function ( Add0, event )
							local Add0Frame5 = function ( Add0, event )
								local Add0Frame6 = function ( Add0, event )
									local Add0Frame7 = function ( Add0, event )
										local Add0Frame8 = function ( Add0, event )
											local Add0Frame9 = function ( Add0, event )
												local Add0Frame10 = function ( Add0, event )
													local Add0Frame11 = function ( Add0, event )
														local Add0Frame12 = function ( Add0, event )
															local Add0Frame13 = function ( Add0, event )
																local Add0Frame14 = function ( Add0, event )
																	local Add0Frame15 = function ( Add0, event )
																		local Add0Frame16 = function ( Add0, event )
																			if not event.interrupted then
																				Add0:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
																			end
																			Add0:setLeftRight( true, true, 0, 1 )
																			Add0:setTopBottom( true, true, 0, 0 )
																			Add0:setAlpha( 0.07 )
																			if event.interrupted then
																				self.clipFinished( Add0, event )
																			else
																				Add0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			Add0Frame16( Add0, event )
																			return 
																		else
																			Add0:beginAnimation( "keyframe", 220, false, false, CoD.TweenType.Linear )
																			Add0:setAlpha( 0.15 )
																			Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		Add0Frame15( Add0, event )
																		return 
																	else
																		Add0:beginAnimation( "keyframe", 609, false, false, CoD.TweenType.Linear )
																		Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame15 )
																	end
																end
																
																if event.interrupted then
																	Add0Frame14( Add0, event )
																	return 
																else
																	Add0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																	Add0:setAlpha( 0.07 )
																	Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame14 )
																end
															end
															
															if event.interrupted then
																Add0Frame13( Add0, event )
																return 
															else
																Add0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																Add0:setAlpha( 0.15 )
																Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame13 )
															end
														end
														
														if event.interrupted then
															Add0Frame12( Add0, event )
															return 
														else
															Add0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
															Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame12 )
														end
													end
													
													if event.interrupted then
														Add0Frame11( Add0, event )
														return 
													else
														Add0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
														Add0:setAlpha( 0.07 )
														Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame11 )
													end
												end
												
												if event.interrupted then
													Add0Frame10( Add0, event )
													return 
												else
													Add0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
													Add0:setAlpha( 0.15 )
													Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame10 )
												end
											end
											
											if event.interrupted then
												Add0Frame9( Add0, event )
												return 
											else
												Add0:beginAnimation( "keyframe", 1479, false, false, CoD.TweenType.Linear )
												Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame9 )
											end
										end
										
										if event.interrupted then
											Add0Frame8( Add0, event )
											return 
										else
											Add0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
											Add0:setAlpha( 0.07 )
											Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame8 )
										end
									end
									
									if event.interrupted then
										Add0Frame7( Add0, event )
										return 
									else
										Add0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
										Add0:setAlpha( 0.15 )
										Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame7 )
									end
								end
								
								if event.interrupted then
									Add0Frame6( Add0, event )
									return 
								else
									Add0:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Linear )
									Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame6 )
								end
							end
							
							if event.interrupted then
								Add0Frame5( Add0, event )
								return 
							else
								Add0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								Add0:setAlpha( 0.07 )
								Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame5 )
							end
						end
						
						if event.interrupted then
							Add0Frame4( Add0, event )
							return 
						else
							Add0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Add0:setAlpha( 0.15 )
							Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame4 )
						end
					end
					
					if event.interrupted then
						Add0Frame3( Add0, event )
						return 
					else
						Add0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Add0:registerEventHandler( "transition_complete_keyframe", Add0Frame3 )
					end
				end
				
				Add0:completeAnimation()
				self.Add0:setLeftRight( true, true, 0, 1 )
				self.Add0:setTopBottom( true, true, 0, 0 )
				self.Add0:setAlpha( 0.07 )
				Add0Frame2( Add0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		CounterUAV = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				underlayMap0:completeAnimation()
				self.underlayMap0:setAlpha( 0 )
				self.clipFinished( underlayMap0, {} )

				overlay:completeAnimation()
				self.overlay:setAlpha( 0 )
				self.clipFinished( overlay, {} )

				Mosiac:completeAnimation()
				self.Mosiac:setAlpha( 0.5 )
				self.Mosiac:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
				self.Mosiac:setShaderVector( 0, 13.2, 0, 0, 0 )
				self.Mosiac:setShaderVector( 1, 1, 0, 0, 0 )
				self.Mosiac:setShaderVector( 2, 2.19, 0, 0, 0 )
				self.clipFinished( Mosiac, {} )

				Scanlines:completeAnimation()
				self.Scanlines:setAlpha( 0 )
				self.clipFinished( Scanlines, {} )

				Scroll:completeAnimation()
				self.Scroll:setAlpha( 0 )
				self.clipFinished( Scroll, {} )

				internalItems:completeAnimation()
				self.internalItems:setAlpha( 0 )
				self.clipFinished( internalItems, {} )

				Add0:completeAnimation()
				self.Add0:setAlpha( 0 )
				self.clipFinished( Add0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CounterUAV",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COUNTER_UAV_ACTIVE
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internalItems:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

