-- c84e9c774e5f0d033a7adf033cb969ae
-- This hash is used for caching, delete to decompile the file again

CoD.GenericProjectedTabletInternal = InheritFrom( LUI.UIElement )
CoD.GenericProjectedTabletInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GenericProjectedTabletInternal )
	self.id = "GenericProjectedTabletInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 720 )
	
	local square = LUI.UIImage.new()
	square:setLeftRight( true, false, 141.5, 581.5 )
	square:setTopBottom( true, false, 218.5, 481.5 )
	square:setRGB( 0.6, 0.87, 0.92 )
	square:setAlpha( 0.5 )
	self:addElement( square )
	self.square = square
	
	local RegBack = LUI.UIImage.new()
	RegBack:setLeftRight( true, true, 0, 0 )
	RegBack:setTopBottom( true, true, 0, 0 )
	RegBack:setRGB( 0.42, 0.69, 0.76 )
	RegBack:setAlpha( 0.6 )
	RegBack:setImage( RegisterImage( "uie_hud_t7_minimap_mp_holograms_tablet_nonmap" ) )
	RegBack:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	RegBack:setShaderVector( 0, 2.85, 0, 0, 0 )
	self:addElement( RegBack )
	self.RegBack = RegBack
	
	local AddBack = LUI.UIImage.new()
	AddBack:setLeftRight( true, true, 0, 0 )
	AddBack:setTopBottom( true, true, 0, 0 )
	AddBack:setRGB( 0.35, 0.62, 0.69 )
	AddBack:setAlpha( 0.2 )
	AddBack:setImage( RegisterImage( "uie_hud_t7_minimap_mp_holograms_tablet_nonmap" ) )
	AddBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AddBack )
	self.AddBack = AddBack
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_hud_t7_minimap_mp_holograms_tablet_nonmap" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	Image0:setShaderVector( 0, 0.45, 0, 0, 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local lines = LUI.UIImage.new()
	lines:setLeftRight( true, true, 0, 0 )
	lines:setTopBottom( true, true, 0, 0 )
	lines:setAlpha( 0.9 )
	lines:setImage( RegisterImage( "uie_hud_t7_minimap_mp_holograms_tablet_nonmap_1stperson" ) )
	lines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lines )
	self.lines = lines
	
	local scroll = LUI.UIImage.new()
	scroll:setLeftRight( true, true, 0, 0 )
	scroll:setTopBottom( true, true, 0, 0 )
	scroll:setAlpha( 0.1 )
	scroll:setImage( RegisterImage( "uie_hud_t7_minimap_mp_holograms_tablet_nonmap_1stperson" ) )
	scroll:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	scroll:setShaderVector( 0, 0.06, 1, 0, 0 )
	scroll:setShaderVector( 1, 50, 0, 0, 0 )
	self:addElement( scroll )
	self.scroll = scroll
	
	local Scanlines = LUI.UIImage.new()
	Scanlines:setLeftRight( true, true, 0, 0 )
	Scanlines:setTopBottom( true, true, 0, 0 )
	Scanlines:setRGB( 0.35, 0.62, 0.69 )
	Scanlines:setAlpha( 0.3 )
	Scanlines:setImage( RegisterImage( "uie_hud_t7_minimap_mp_holograms_tablet_nonmap" ) )
	Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	Scanlines:setShaderVector( 0, 1.04, 0, 0, 0 )
	Scanlines:setShaderVector( 1, 4.43, 0, 0, 0 )
	Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
	self:addElement( Scanlines )
	self.Scanlines = Scanlines
	
	local Static = LUI.UIImage.new()
	Static:setLeftRight( true, true, -18, 40 )
	Static:setTopBottom( true, true, -30, 26 )
	Static:setRGB( 0.7, 0.92, 0.97 )
	Static:setAlpha( 0 )
	Static:setImage( RegisterImage( "uie_hud_t7_minimap_mp_ethiopia_full" ) )
	Static:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	Static:setShaderVector( 0, -0.01, 0.44, 0, 0 )
	Static:setShaderVector( 1, 4.29, 0, 0, 0 )
	self:addElement( Static )
	self.Static = Static
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( false, false, -35, 37 )
	Image10:setTopBottom( false, false, -46.41, 25.59 )
	Image10:setImage( RegisterImage( "uie_t7_hud_tablet_nonminimap_cross" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local LineUL = LUI.UIImage.new()
	LineUL:setLeftRight( true, false, 200, 328 )
	LineUL:setTopBottom( true, false, 286, 298 )
	LineUL:setAlpha( 0.5 )
	LineUL:setImage( RegisterImage( "uie_t7_hud_tablet_nonminimap_line" ) )
	LineUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineUL )
	self.LineUL = LineUL
	
	local LineUR = LUI.UIImage.new()
	LineUR:setLeftRight( true, false, 365, 493 )
	LineUR:setTopBottom( true, false, 286, 298 )
	LineUR:setAlpha( 0.5 )
	LineUR:setYRot( 180 )
	LineUR:setImage( RegisterImage( "uie_t7_hud_tablet_nonminimap_line" ) )
	LineUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineUR )
	self.LineUR = LineUR
	
	local LineLL = LUI.UIImage.new()
	LineLL:setLeftRight( true, false, 200, 328 )
	LineLL:setTopBottom( true, false, 396, 408 )
	LineLL:setAlpha( 0.5 )
	LineLL:setXRot( 190 )
	LineLL:setImage( RegisterImage( "uie_t7_hud_tablet_nonminimap_line" ) )
	LineLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLL )
	self.LineLL = LineLL
	
	local LineLR = LUI.UIImage.new()
	LineLR:setLeftRight( true, false, 365, 493 )
	LineLR:setTopBottom( true, false, 396, 408 )
	LineLR:setAlpha( 0.5 )
	LineLR:setXRot( 190 )
	LineLR:setYRot( 180 )
	LineLR:setImage( RegisterImage( "uie_t7_hud_tablet_nonminimap_line" ) )
	LineLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLR )
	self.LineLR = LineLR
	
	local targetLarge = LUI.UIImage.new()
	targetLarge:setLeftRight( true, false, 357.7, 421.3 )
	targetLarge:setTopBottom( true, false, 280.2, 343.8 )
	targetLarge:setImage( RegisterImage( "uie_t7_hud_target_mortararea_planted" ) )
	targetLarge:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( targetLarge )
	self.targetLarge = targetLarge
	
	local targetMed = LUI.UIImage.new()
	targetMed:setLeftRight( true, false, 168.2, 231.8 )
	targetMed:setTopBottom( true, false, 349.59, 413.18 )
	targetMed:setImage( RegisterImage( "uie_t7_hud_target_mortararea_planted" ) )
	targetMed:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( targetMed )
	self.targetMed = targetMed
	
	local targetsmall0 = LUI.UIImage.new()
	targetsmall0:setLeftRight( true, false, 475.7, 539.3 )
	targetsmall0:setTopBottom( true, false, 360, 423.59 )
	targetsmall0:setImage( RegisterImage( "uie_t7_hud_target_mortararea_planted" ) )
	targetsmall0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( targetsmall0 )
	self.targetsmall0 = targetsmall0
	
	local targetSmall1 = LUI.UIImage.new()
	targetSmall1:setLeftRight( true, false, 325, 388.59 )
	targetSmall1:setTopBottom( true, false, 385.59, 449.18 )
	targetSmall1:setScale( 0.6 )
	targetSmall1:setImage( RegisterImage( "uie_t7_hud_target_mortararea_planted" ) )
	targetSmall1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( targetSmall1 )
	self.targetSmall1 = targetSmall1
	
	local targetSmall2 = LUI.UIImage.new()
	targetSmall2:setLeftRight( true, false, 273, 336.59 )
	targetSmall2:setTopBottom( true, false, 266, 329.59 )
	targetSmall2:setScale( 0.6 )
	targetSmall2:setImage( RegisterImage( "uie_t7_hud_target_mortararea_planted" ) )
	targetSmall2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( targetSmall2 )
	self.targetSmall2 = targetSmall2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				local RegBackFrame2 = function ( RegBack, event )
					local RegBackFrame3 = function ( RegBack, event )
						local RegBackFrame4 = function ( RegBack, event )
							local RegBackFrame5 = function ( RegBack, event )
								local RegBackFrame6 = function ( RegBack, event )
									local RegBackFrame7 = function ( RegBack, event )
										local RegBackFrame8 = function ( RegBack, event )
											local RegBackFrame9 = function ( RegBack, event )
												local RegBackFrame10 = function ( RegBack, event )
													if not event.interrupted then
														RegBack:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
													end
													RegBack:setAlpha( 0.6 )
													if event.interrupted then
														self.clipFinished( RegBack, event )
													else
														RegBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													RegBackFrame10( RegBack, event )
													return 
												else
													RegBack:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													RegBack:setAlpha( 0.6 )
													RegBack:registerEventHandler( "transition_complete_keyframe", RegBackFrame10 )
												end
											end
											
											if event.interrupted then
												RegBackFrame9( RegBack, event )
												return 
											else
												RegBack:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												RegBack:setAlpha( 0.84 )
												RegBack:registerEventHandler( "transition_complete_keyframe", RegBackFrame9 )
											end
										end
										
										if event.interrupted then
											RegBackFrame8( RegBack, event )
											return 
										else
											RegBack:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											RegBack:setAlpha( 0.6 )
											RegBack:registerEventHandler( "transition_complete_keyframe", RegBackFrame8 )
										end
									end
									
									if event.interrupted then
										RegBackFrame7( RegBack, event )
										return 
									else
										RegBack:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
										RegBack:setAlpha( 0.5 )
										RegBack:registerEventHandler( "transition_complete_keyframe", RegBackFrame7 )
									end
								end
								
								if event.interrupted then
									RegBackFrame6( RegBack, event )
									return 
								else
									RegBack:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									RegBack:setAlpha( 0.7 )
									RegBack:registerEventHandler( "transition_complete_keyframe", RegBackFrame6 )
								end
							end
							
							if event.interrupted then
								RegBackFrame5( RegBack, event )
								return 
							else
								RegBack:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								RegBack:registerEventHandler( "transition_complete_keyframe", RegBackFrame5 )
							end
						end
						
						if event.interrupted then
							RegBackFrame4( RegBack, event )
							return 
						else
							RegBack:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							RegBack:setAlpha( 0.6 )
							RegBack:registerEventHandler( "transition_complete_keyframe", RegBackFrame4 )
						end
					end
					
					if event.interrupted then
						RegBackFrame3( RegBack, event )
						return 
					else
						RegBack:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						RegBack:setAlpha( 0.8 )
						RegBack:registerEventHandler( "transition_complete_keyframe", RegBackFrame3 )
					end
				end
				
				RegBack:completeAnimation()
				self.RegBack:setAlpha( 0.6 )
				RegBackFrame2( RegBack, {} )
				local AddBackFrame2 = function ( AddBack, event )
					local AddBackFrame3 = function ( AddBack, event )
						local AddBackFrame4 = function ( AddBack, event )
							local AddBackFrame5 = function ( AddBack, event )
								local AddBackFrame6 = function ( AddBack, event )
									local AddBackFrame7 = function ( AddBack, event )
										local AddBackFrame8 = function ( AddBack, event )
											local AddBackFrame9 = function ( AddBack, event )
												local AddBackFrame10 = function ( AddBack, event )
													if not event.interrupted then
														AddBack:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
													end
													AddBack:setAlpha( 0.2 )
													AddBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
													if event.interrupted then
														self.clipFinished( AddBack, event )
													else
														AddBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													AddBackFrame10( AddBack, event )
													return 
												else
													AddBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													AddBack:setAlpha( 0.2 )
													AddBack:registerEventHandler( "transition_complete_keyframe", AddBackFrame10 )
												end
											end
											
											if event.interrupted then
												AddBackFrame9( AddBack, event )
												return 
											else
												AddBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AddBack:setAlpha( 0.41 )
												AddBack:registerEventHandler( "transition_complete_keyframe", AddBackFrame9 )
											end
										end
										
										if event.interrupted then
											AddBackFrame8( AddBack, event )
											return 
										else
											AddBack:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
											AddBack:registerEventHandler( "transition_complete_keyframe", AddBackFrame8 )
										end
									end
									
									if event.interrupted then
										AddBackFrame7( AddBack, event )
										return 
									else
										AddBack:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										AddBack:setAlpha( 0.1 )
										AddBack:registerEventHandler( "transition_complete_keyframe", AddBackFrame7 )
									end
								end
								
								if event.interrupted then
									AddBackFrame6( AddBack, event )
									return 
								else
									AddBack:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									AddBack:setAlpha( 0.2 )
									AddBack:registerEventHandler( "transition_complete_keyframe", AddBackFrame6 )
								end
							end
							
							if event.interrupted then
								AddBackFrame5( AddBack, event )
								return 
							else
								AddBack:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								AddBack:registerEventHandler( "transition_complete_keyframe", AddBackFrame5 )
							end
						end
						
						if event.interrupted then
							AddBackFrame4( AddBack, event )
							return 
						else
							AddBack:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							AddBack:setAlpha( 0.1 )
							AddBack:registerEventHandler( "transition_complete_keyframe", AddBackFrame4 )
						end
					end
					
					if event.interrupted then
						AddBackFrame3( AddBack, event )
						return 
					else
						AddBack:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						AddBack:setAlpha( 0.63 )
						AddBack:registerEventHandler( "transition_complete_keyframe", AddBackFrame3 )
					end
				end
				
				AddBack:completeAnimation()
				self.AddBack:setAlpha( 0.2 )
				self.AddBack:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				AddBackFrame2( AddBack, {} )

				scroll:completeAnimation()
				self.scroll:setAlpha( 0.1 )
				self.clipFinished( scroll, {} )
				local ScanlinesFrame2 = function ( Scanlines, event )
					local ScanlinesFrame3 = function ( Scanlines, event )
						local ScanlinesFrame4 = function ( Scanlines, event )
							local ScanlinesFrame5 = function ( Scanlines, event )
								local ScanlinesFrame6 = function ( Scanlines, event )
									local ScanlinesFrame7 = function ( Scanlines, event )
										if not event.interrupted then
											Scanlines:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
										end
										Scanlines:setAlpha( 0.3 )
										Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
										Scanlines:setShaderVector( 0, 1.04, 0, 0, 0 )
										Scanlines:setShaderVector( 1, 4.24, 0, 0, 0 )
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
										Scanlines:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
										Scanlines:setShaderVector( 1, 4.24, 0, 0, 0 )
										Scanlines:setShaderVector( 2, 0.04, 0, 0, 0 )
										Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame7 )
									end
								end
								
								if event.interrupted then
									ScanlinesFrame6( Scanlines, event )
									return 
								else
									Scanlines:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
									Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame6 )
								end
							end
							
							if event.interrupted then
								ScanlinesFrame5( Scanlines, event )
								return 
							else
								Scanlines:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Scanlines:setShaderVector( 2, 0.06, 0, 0, 0 )
								Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame5 )
							end
						end
						
						if event.interrupted then
							ScanlinesFrame4( Scanlines, event )
							return 
						else
							Scanlines:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
							Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame4 )
						end
					end
					
					if event.interrupted then
						ScanlinesFrame3( Scanlines, event )
						return 
					else
						Scanlines:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Scanlines:setShaderVector( 2, 0.18, 0, 0, 0 )
						Scanlines:registerEventHandler( "transition_complete_keyframe", ScanlinesFrame3 )
					end
				end
				
				Scanlines:completeAnimation()
				self.Scanlines:setAlpha( 0.3 )
				self.Scanlines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
				self.Scanlines:setShaderVector( 0, 1.04, 0, 0, 0 )
				self.Scanlines:setShaderVector( 1, 4.43, 0, 0, 0 )
				self.Scanlines:setShaderVector( 2, 0.01, 0, 0, 0 )
				ScanlinesFrame2( Scanlines, {} )
				local Image10Frame2 = function ( Image10, event )
					local Image10Frame3 = function ( Image10, event )
						local Image10Frame4 = function ( Image10, event )
							local Image10Frame5 = function ( Image10, event )
								local Image10Frame6 = function ( Image10, event )
									if not event.interrupted then
										Image10:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									end
									Image10:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Image10, event )
									else
										Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Image10Frame6( Image10, event )
									return 
								else
									Image10:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame6 )
								end
							end
							
							if event.interrupted then
								Image10Frame5( Image10, event )
								return 
							else
								Image10:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								Image10:setAlpha( 0.2 )
								Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame5 )
							end
						end
						
						if event.interrupted then
							Image10Frame4( Image10, event )
							return 
						else
							Image10:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							Image10:setAlpha( 1 )
							Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame4 )
						end
					end
					
					if event.interrupted then
						Image10Frame3( Image10, event )
						return 
					else
						Image10:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						Image10:setAlpha( 0.2 )
						Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame3 )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setAlpha( 1 )
				Image10Frame2( Image10, {} )
				local f2_local4 = function ( f32_arg0, f32_arg1 )
					local f32_local0 = function ( f33_arg0, f33_arg1 )
						local f33_local0 = function ( f34_arg0, f34_arg1 )
							local f34_local0 = function ( f35_arg0, f35_arg1 )
								local f35_local0 = function ( f36_arg0, f36_arg1 )
									if not f36_arg1.interrupted then
										f36_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									end
									f36_arg0:setLeftRight( true, false, 200, 328 )
									f36_arg0:setTopBottom( true, false, 286, 298 )
									f36_arg0:setAlpha( 1 )
									if f36_arg1.interrupted then
										self.clipFinished( f36_arg0, f36_arg1 )
									else
										f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f35_arg1.interrupted then
									f35_local0( f35_arg0, f35_arg1 )
									return 
								else
									f35_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									f35_arg0:setAlpha( 0.2 )
									f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
								end
							end
							
							if f34_arg1.interrupted then
								f34_local0( f34_arg0, f34_arg1 )
								return 
							else
								f34_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								f34_arg0:setAlpha( 1 )
								f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
							end
						end
						
						if f33_arg1.interrupted then
							f33_local0( f33_arg0, f33_arg1 )
							return 
						else
							f33_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f33_arg0:setAlpha( 0.2 )
							f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
						end
					end
					
					if f32_arg1.interrupted then
						f32_local0( f32_arg0, f32_arg1 )
						return 
					else
						f32_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						f32_arg0:setLeftRight( true, false, 200, 328 )
						f32_arg0:setTopBottom( true, false, 286, 298 )
						f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
					end
				end
				
				LineUL:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LineUL:setLeftRight( true, false, 184, 312 )
				LineUL:setTopBottom( true, false, 260, 272 )
				LineUL:setAlpha( 1 )
				LineUL:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local f2_local5 = function ( f37_arg0, f37_arg1 )
					local f37_local0 = function ( f38_arg0, f38_arg1 )
						local f38_local0 = function ( f39_arg0, f39_arg1 )
							local f39_local0 = function ( f40_arg0, f40_arg1 )
								local f40_local0 = function ( f41_arg0, f41_arg1 )
									if not f41_arg1.interrupted then
										f41_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									end
									f41_arg0:setLeftRight( true, false, 365, 493 )
									f41_arg0:setTopBottom( true, false, 286, 298 )
									f41_arg0:setAlpha( 1 )
									if f41_arg1.interrupted then
										self.clipFinished( f41_arg0, f41_arg1 )
									else
										f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f40_arg1.interrupted then
									f40_local0( f40_arg0, f40_arg1 )
									return 
								else
									f40_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									f40_arg0:setAlpha( 0.2 )
									f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
								end
							end
							
							if f39_arg1.interrupted then
								f39_local0( f39_arg0, f39_arg1 )
								return 
							else
								f39_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								f39_arg0:setAlpha( 1 )
								f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
							end
						end
						
						if f38_arg1.interrupted then
							f38_local0( f38_arg0, f38_arg1 )
							return 
						else
							f38_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f38_arg0:setAlpha( 0.2 )
							f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
						end
					end
					
					if f37_arg1.interrupted then
						f37_local0( f37_arg0, f37_arg1 )
						return 
					else
						f37_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						f37_arg0:setLeftRight( true, false, 365, 493 )
						f37_arg0:setTopBottom( true, false, 286, 298 )
						f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
					end
				end
				
				LineUR:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LineUR:setLeftRight( true, false, 391.5, 519.5 )
				LineUR:setTopBottom( true, false, 260, 272 )
				LineUR:setAlpha( 1 )
				LineUR:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local f2_local6 = function ( f42_arg0, f42_arg1 )
					local f42_local0 = function ( f43_arg0, f43_arg1 )
						local f43_local0 = function ( f44_arg0, f44_arg1 )
							local f44_local0 = function ( f45_arg0, f45_arg1 )
								local f45_local0 = function ( f46_arg0, f46_arg1 )
									if not f46_arg1.interrupted then
										f46_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									end
									f46_arg0:setLeftRight( true, false, 200, 328 )
									f46_arg0:setTopBottom( true, false, 396, 408 )
									f46_arg0:setAlpha( 1 )
									if f46_arg1.interrupted then
										self.clipFinished( f46_arg0, f46_arg1 )
									else
										f46_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f45_arg1.interrupted then
									f45_local0( f45_arg0, f45_arg1 )
									return 
								else
									f45_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									f45_arg0:setAlpha( 0.2 )
									f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
								end
							end
							
							if f44_arg1.interrupted then
								f44_local0( f44_arg0, f44_arg1 )
								return 
							else
								f44_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								f44_arg0:setAlpha( 1 )
								f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
							end
						end
						
						if f43_arg1.interrupted then
							f43_local0( f43_arg0, f43_arg1 )
							return 
						else
							f43_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f43_arg0:setAlpha( 0.2 )
							f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
						end
					end
					
					if f42_arg1.interrupted then
						f42_local0( f42_arg0, f42_arg1 )
						return 
					else
						f42_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						f42_arg0:setLeftRight( true, false, 200, 328 )
						f42_arg0:setTopBottom( true, false, 396, 408 )
						f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
					end
				end
				
				LineLL:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LineLL:setLeftRight( true, false, 184, 312 )
				LineLL:setTopBottom( true, false, 411.59, 423.59 )
				LineLL:setAlpha( 1 )
				LineLL:registerEventHandler( "transition_complete_keyframe", f2_local6 )
				local f2_local7 = function ( f47_arg0, f47_arg1 )
					local f47_local0 = function ( f48_arg0, f48_arg1 )
						local f48_local0 = function ( f49_arg0, f49_arg1 )
							local f49_local0 = function ( f50_arg0, f50_arg1 )
								local f50_local0 = function ( f51_arg0, f51_arg1 )
									if not f51_arg1.interrupted then
										f51_arg0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									end
									f51_arg0:setLeftRight( true, false, 365, 493 )
									f51_arg0:setTopBottom( true, false, 396, 408 )
									f51_arg0:setAlpha( 1 )
									if f51_arg1.interrupted then
										self.clipFinished( f51_arg0, f51_arg1 )
									else
										f51_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f50_arg1.interrupted then
									f50_local0( f50_arg0, f50_arg1 )
									return 
								else
									f50_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									f50_arg0:setAlpha( 0.2 )
									f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
								end
							end
							
							if f49_arg1.interrupted then
								f49_local0( f49_arg0, f49_arg1 )
								return 
							else
								f49_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								f49_arg0:setAlpha( 1 )
								f49_arg0:registerEventHandler( "transition_complete_keyframe", f49_local0 )
							end
						end
						
						if f48_arg1.interrupted then
							f48_local0( f48_arg0, f48_arg1 )
							return 
						else
							f48_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f48_arg0:setAlpha( 0.2 )
							f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
						end
					end
					
					if f47_arg1.interrupted then
						f47_local0( f47_arg0, f47_arg1 )
						return 
					else
						f47_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						f47_arg0:setLeftRight( true, false, 365, 493 )
						f47_arg0:setTopBottom( true, false, 396, 408 )
						f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
					end
				end
				
				LineLR:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LineLR:setLeftRight( true, false, 389.5, 517.5 )
				LineLR:setTopBottom( true, false, 411.59, 423.59 )
				LineLR:setAlpha( 1 )
				LineLR:registerEventHandler( "transition_complete_keyframe", f2_local7 )
				local targetLargeFrame2 = function ( targetLarge, event )
					local targetLargeFrame3 = function ( targetLarge, event )
						if not event.interrupted then
							targetLarge:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						targetLarge:setLeftRight( true, false, 357.7, 421.3 )
						targetLarge:setTopBottom( true, false, 280.2, 343.8 )
						targetLarge:setAlpha( 1 )
						targetLarge:setZRot( 0 )
						targetLarge:setZoom( 0 )
						targetLarge:setScale( 1 )
						if event.interrupted then
							self.clipFinished( targetLarge, event )
						else
							targetLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						targetLargeFrame3( targetLarge, event )
						return 
					else
						targetLarge:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						targetLarge:setScale( 1.6 )
						targetLarge:registerEventHandler( "transition_complete_keyframe", targetLargeFrame3 )
					end
				end
				
				targetLarge:completeAnimation()
				self.targetLarge:setLeftRight( true, false, 357.7, 421.3 )
				self.targetLarge:setTopBottom( true, false, 280.2, 343.8 )
				self.targetLarge:setAlpha( 1 )
				self.targetLarge:setZRot( 0 )
				self.targetLarge:setZoom( 0 )
				self.targetLarge:setScale( 1 )
				targetLargeFrame2( targetLarge, {} )
				local targetMedFrame2 = function ( targetMed, event )
					local targetMedFrame3 = function ( targetMed, event )
						local targetMedFrame4 = function ( targetMed, event )
							if not event.interrupted then
								targetMed:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
							end
							targetMed:setLeftRight( true, false, 168.2, 231.8 )
							targetMed:setTopBottom( true, false, 349.59, 413.18 )
							targetMed:setAlpha( 0.6 )
							targetMed:setZRot( 0 )
							targetMed:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( targetMed, event )
							else
								targetMed:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							targetMedFrame4( targetMed, event )
							return 
						else
							targetMed:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
							targetMed:setLeftRight( true, false, 184.2, 247.8 )
							targetMed:setTopBottom( true, false, 328.21, 391.8 )
							targetMed:setAlpha( 1 )
							targetMed:registerEventHandler( "transition_complete_keyframe", targetMedFrame4 )
						end
					end
					
					if event.interrupted then
						targetMedFrame3( targetMed, event )
						return 
					else
						targetMed:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						targetMed:registerEventHandler( "transition_complete_keyframe", targetMedFrame3 )
					end
				end
				
				targetMed:completeAnimation()
				self.targetMed:setLeftRight( true, false, 168.2, 231.8 )
				self.targetMed:setTopBottom( true, false, 349.59, 413.18 )
				self.targetMed:setAlpha( 0.6 )
				self.targetMed:setZRot( 0 )
				self.targetMed:setZoom( 0 )
				targetMedFrame2( targetMed, {} )
				local targetsmall0Frame2 = function ( targetsmall0, event )
					local targetsmall0Frame3 = function ( targetsmall0, event )
						local targetsmall0Frame4 = function ( targetsmall0, event )
							if not event.interrupted then
								targetsmall0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							targetsmall0:setLeftRight( true, false, 475.7, 539.3 )
							targetsmall0:setTopBottom( true, false, 360, 423.59 )
							targetsmall0:setAlpha( 0 )
							targetsmall0:setZRot( 0 )
							targetsmall0:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( targetsmall0, event )
							else
								targetsmall0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							targetsmall0Frame4( targetsmall0, event )
							return 
						else
							targetsmall0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							targetsmall0:setLeftRight( true, false, 466.78, 530.37 )
							targetsmall0:setTopBottom( true, false, 352.29, 415.88 )
							targetsmall0:setAlpha( 0.36 )
							targetsmall0:registerEventHandler( "transition_complete_keyframe", targetsmall0Frame4 )
						end
					end
					
					if event.interrupted then
						targetsmall0Frame3( targetsmall0, event )
						return 
					else
						targetsmall0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						targetsmall0:setLeftRight( true, false, 450.7, 514.3 )
						targetsmall0:setTopBottom( true, false, 338.41, 402 )
						targetsmall0:setAlpha( 1 )
						targetsmall0:registerEventHandler( "transition_complete_keyframe", targetsmall0Frame3 )
					end
				end
				
				targetsmall0:completeAnimation()
				self.targetsmall0:setLeftRight( true, false, 475.7, 539.3 )
				self.targetsmall0:setTopBottom( true, false, 360, 423.59 )
				self.targetsmall0:setAlpha( 0 )
				self.targetsmall0:setZRot( 0 )
				self.targetsmall0:setZoom( 0 )
				targetsmall0Frame2( targetsmall0, {} )
				local targetSmall1Frame2 = function ( targetSmall1, event )
					local targetSmall1Frame3 = function ( targetSmall1, event )
						if not event.interrupted then
							targetSmall1:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						targetSmall1:setLeftRight( true, false, 325, 388.59 )
						targetSmall1:setTopBottom( true, false, 385.59, 449.18 )
						targetSmall1:setAlpha( 1 )
						targetSmall1:setScale( 0.6 )
						if event.interrupted then
							self.clipFinished( targetSmall1, event )
						else
							targetSmall1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						targetSmall1Frame3( targetSmall1, event )
						return 
					else
						targetSmall1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						targetSmall1:setAlpha( 0.44 )
						targetSmall1:registerEventHandler( "transition_complete_keyframe", targetSmall1Frame3 )
					end
				end
				
				targetSmall1:completeAnimation()
				self.targetSmall1:setLeftRight( true, false, 325, 388.59 )
				self.targetSmall1:setTopBottom( true, false, 385.59, 449.18 )
				self.targetSmall1:setAlpha( 1 )
				self.targetSmall1:setScale( 0.6 )
				targetSmall1Frame2( targetSmall1, {} )
				local targetSmall2Frame2 = function ( targetSmall2, event )
					local targetSmall2Frame3 = function ( targetSmall2, event )
						if not event.interrupted then
							targetSmall2:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						targetSmall2:setLeftRight( true, false, 273, 336.59 )
						targetSmall2:setTopBottom( true, false, 266, 329.59 )
						targetSmall2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( targetSmall2, event )
						else
							targetSmall2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						targetSmall2Frame3( targetSmall2, event )
						return 
					else
						targetSmall2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						targetSmall2:setAlpha( 0.39 )
						targetSmall2:registerEventHandler( "transition_complete_keyframe", targetSmall2Frame3 )
					end
				end
				
				targetSmall2:completeAnimation()
				self.targetSmall2:setLeftRight( true, false, 273, 336.59 )
				self.targetSmall2:setTopBottom( true, false, 266, 329.59 )
				self.targetSmall2:setAlpha( 1 )
				targetSmall2Frame2( targetSmall2, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
