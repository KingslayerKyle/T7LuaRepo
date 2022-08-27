-- 80e710eb1046561a118b74d3729f4810
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_BarTop" )
require( "ui.uieditor.widgets.HUD.core_MapWidget.MapWidget_Element" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_BackCircleOutter" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ArrowFull" )

CoD.MapWidget = InheritFrom( LUI.UIElement )
CoD.MapWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapWidget )
	self.id = "MapWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 283 )
	self:setTopBottom( true, false, 0, 204 )
	
	local UIGlow = LUI.UIImage.new()
	UIGlow:setLeftRight( true, false, 12, 321.33 )
	UIGlow:setTopBottom( true, false, 17, 198.33 )
	UIGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_uiglow" ) )
	UIGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( UIGlow )
	self.UIGlow = UIGlow
	
	local BarTop = CoD.MapWidget_BarTop.new( menu, controller )
	BarTop:setLeftRight( true, false, 16, 268 )
	BarTop:setTopBottom( true, false, 96.88, 99.55 )
	BarTop:setAlpha( 0.3 )
	BarTop:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BarTop:setShaderVector( 0, 0.15, 1, 0, 0 )
	BarTop:setShaderVector( 1, 1, 0, 0, 0 )
	BarTop:setShaderVector( 2, 0, 0, 0, 0 )
	BarTop:setShaderVector( 3, 0, 0, 0, 0 )
	BarTop:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BarTop )
	self.BarTop = BarTop
	
	local BarBase = CoD.MapWidget_BarTop.new( menu, controller )
	BarBase:setLeftRight( true, false, 16, 268 )
	BarBase:setTopBottom( true, false, 97.1, 99.77 )
	BarBase:setAlpha( 0.17 )
	BarBase:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BarBase:setShaderVector( 0, 0.15, 1, 0, 0 )
	BarBase:setShaderVector( 1, 1, 0, 0, 0 )
	BarBase:setShaderVector( 2, 0, 0, 0, 0 )
	BarBase:setShaderVector( 3, 0, 0, 0, 0 )
	BarBase:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BarBase )
	self.BarBase = BarBase
	
	local BaseElement = CoD.MapWidget_Element.new( menu, controller )
	BaseElement:setLeftRight( true, false, 131.34, 152.67 )
	BaseElement:setTopBottom( true, false, 109.91, 122.24 )
	BaseElement:setAlpha( 0.17 )
	BaseElement:setZRot( 180 )
	BaseElement:setZoom( -3 )
	BaseElement:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BaseElement:setShaderVector( 0, 0.2, 1, 0, 0 )
	BaseElement:setShaderVector( 1, 1, 0, 0, 0 )
	BaseElement:setShaderVector( 2, 0, 0, 0, 0 )
	BaseElement:setShaderVector( 3, 0, 0, 0, 0 )
	BaseElement:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( BaseElement )
	self.BaseElement = BaseElement
	
	local Dot1 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot1:setLeftRight( true, false, 133.35, 137.35 )
	Dot1:setTopBottom( true, false, 96, 100 )
	Dot1:setAlpha( 0.33 )
	Dot1:setZoom( 5 )
	Dot1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot1:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot1:setShaderVector( 1, 1, 0, 0, 0 )
	Dot1:setShaderVector( 2, 0, 0, 0, 0 )
	Dot1:setShaderVector( 3, 0, 0, 0, 0 )
	Dot1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot2 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot2:setLeftRight( true, false, 146.6, 150.6 )
	Dot2:setTopBottom( true, false, 96, 100 )
	Dot2:setAlpha( 0.33 )
	Dot2:setZoom( 5 )
	Dot2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot2:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot2:setShaderVector( 1, 1, 0, 0, 0 )
	Dot2:setShaderVector( 2, 0, 0, 0, 0 )
	Dot2:setShaderVector( 3, 0, 0, 0, 0 )
	Dot2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	local Dot3 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot3:setLeftRight( true, false, 133.35, 137.35 )
	Dot3:setTopBottom( true, false, 97, 101 )
	Dot3:setAlpha( 0.33 )
	Dot3:setZoom( 5 )
	Dot3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot3:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot3:setShaderVector( 1, 1, 0, 0, 0 )
	Dot3:setShaderVector( 2, 0, 0, 0, 0 )
	Dot3:setShaderVector( 3, 0, 0, 0, 0 )
	Dot3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot4 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot4:setLeftRight( true, false, 146.6, 150.6 )
	Dot4:setTopBottom( true, false, 97, 101 )
	Dot4:setAlpha( 0.33 )
	Dot4:setZoom( 5 )
	Dot4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot4:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot4:setShaderVector( 1, 1, 0, 0, 0 )
	Dot4:setShaderVector( 2, 0, 0, 0, 0 )
	Dot4:setShaderVector( 3, 0, 0, 0, 0 )
	Dot4:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot4 )
	self.Dot4 = Dot4
	
	local BackCircleOutter = CoD.DamageWidget_BackCircleOutter.new( menu, controller )
	BackCircleOutter:setLeftRight( true, false, 88.5, 195.5 )
	BackCircleOutter:setTopBottom( true, false, 38.57, 142.57 )
	BackCircleOutter:setAlpha( 0 )
	self:addElement( BackCircleOutter )
	self.BackCircleOutter = BackCircleOutter
	
	local ArrowFull = CoD.AmmoWidget_ArrowFull.new( menu, controller )
	ArrowFull:setLeftRight( true, false, 136.5, 146.5 )
	ArrowFull:setTopBottom( true, false, 65.57, 75.57 )
	ArrowFull:setAlpha( 0 )
	self:addElement( ArrowFull )
	self.ArrowFull = ArrowFull
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 17.9, 265 )
	Image0:setTopBottom( true, false, 21, 160 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -8, 275 )
				self.UIGlow:setTopBottom( true, false, 6, 178.33 )
				self.UIGlow:setAlpha( 0 )
				self.clipFinished( UIGlow, {} )
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 97, 99.67 )
				self.BarTop:setAlpha( 0 )
				self.clipFinished( BarTop, {} )
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 97, 99.67 )
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.67 )
				self.BaseElement:setTopBottom( true, false, 103, 115.33 )
				self.BaseElement:setAlpha( 0 )
				self.clipFinished( BaseElement, {} )
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 140, 144 )
				self.Dot1:setTopBottom( true, false, 96, 100 )
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 140, 144 )
				self.Dot2:setTopBottom( true, false, 96, 100 )
				self.Dot2:setAlpha( 0 )
				self.clipFinished( Dot2, {} )
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 140, 144 )
				self.Dot3:setTopBottom( true, false, 97, 101 )
				self.Dot3:setAlpha( 0 )
				self.clipFinished( Dot3, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 140, 144 )
				self.Dot4:setTopBottom( true, false, 97, 101 )
				self.Dot4:setAlpha( 0 )
				self.clipFinished( Dot4, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.clipFinished( BackCircleOutter, {} )
				ArrowFull:completeAnimation()
				self.ArrowFull:setAlpha( 0 )
				self.clipFinished( ArrowFull, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 10 )
				local UIGlowFrame2 = function ( UIGlow, event )
					local UIGlowFrame3 = function ( UIGlow, event )
						if not event.interrupted then
							UIGlow:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						end
						UIGlow:setLeftRight( true, false, -8, 275 )
						UIGlow:setTopBottom( true, false, 6, 178.33 )
						UIGlow:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( UIGlow, event )
						else
							UIGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						UIGlowFrame3( UIGlow, event )
						return 
					else
						UIGlow:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						UIGlow:registerEventHandler( "transition_complete_keyframe", UIGlowFrame3 )
					end
				end
				
				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -8, 275 )
				self.UIGlow:setTopBottom( true, false, 6, 178.33 )
				self.UIGlow:setAlpha( 0 )
				UIGlowFrame2( UIGlow, {} )
				local BarTopFrame2 = function ( BarTop, event )
					local BarTopFrame3 = function ( BarTop, event )
						local BarTopFrame4 = function ( BarTop, event )
							local BarTopFrame5 = function ( BarTop, event )
								local BarTopFrame6 = function ( BarTop, event )
									local BarTopFrame7 = function ( BarTop, event )
										local BarTopFrame8 = function ( BarTop, event )
											if not event.interrupted then
												BarTop:beginAnimation( "keyframe", 840, true, true, CoD.TweenType.Back )
											end
											BarTop:setLeftRight( true, false, 16, 268 )
											BarTop:setTopBottom( true, false, 20, 22.67 )
											BarTop:setAlpha( 0.7 )
											if event.interrupted then
												self.clipFinished( BarTop, event )
											else
												BarTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BarTopFrame8( BarTop, event )
											return 
										else
											BarTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BarTop:setTopBottom( true, false, 69.63, 72.3 )
											BarTop:setAlpha( 1 )
											BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame8 )
										end
									end
									
									if event.interrupted then
										BarTopFrame7( BarTop, event )
										return 
									else
										BarTop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										BarTop:setTopBottom( true, false, 75.6, 78.27 )
										BarTop:setAlpha( 0 )
										BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame7 )
									end
								end
								
								if event.interrupted then
									BarTopFrame6( BarTop, event )
									return 
								else
									BarTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BarTop:setTopBottom( true, false, 83.44, 86.11 )
									BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame6 )
								end
							end
							
							if event.interrupted then
								BarTopFrame5( BarTop, event )
								return 
							else
								BarTop:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								BarTop:setTopBottom( true, false, 87.8, 90.47 )
								BarTop:setAlpha( 1 )
								BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame5 )
							end
						end
						
						if event.interrupted then
							BarTopFrame4( BarTop, event )
							return 
						else
							BarTop:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							BarTop:setTopBottom( true, false, 94.11, 96.78 )
							BarTop:setAlpha( 0 )
							BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame4 )
						end
					end
					
					if event.interrupted then
						BarTopFrame3( BarTop, event )
						return 
					else
						BarTop:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BarTop:setTopBottom( true, false, 95.95, 98.62 )
						BarTop:setAlpha( 0.9 )
						BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame3 )
					end
				end
				
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 97, 99.67 )
				self.BarTop:setAlpha( 0 )
				BarTopFrame2( BarTop, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					local BarBaseFrame3 = function ( BarBase, event )
						local BarBaseFrame4 = function ( BarBase, event )
							local BarBaseFrame5 = function ( BarBase, event )
								local BarBaseFrame6 = function ( BarBase, event )
									local BarBaseFrame7 = function ( BarBase, event )
										local BarBaseFrame8 = function ( BarBase, event )
											if not event.interrupted then
												BarBase:beginAnimation( "keyframe", 840, true, true, CoD.TweenType.Back )
											end
											BarBase:setLeftRight( true, false, 16, 268 )
											BarBase:setTopBottom( true, false, 160, 162.67 )
											BarBase:setAlpha( 0.4 )
											if event.interrupted then
												self.clipFinished( BarBase, event )
											else
												BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BarBaseFrame8( BarBase, event )
											return 
										else
											BarBase:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BarBase:setTopBottom( true, false, 119.39, 122.06 )
											BarBase:setAlpha( 1 )
											BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame8 )
										end
									end
									
									if event.interrupted then
										BarBaseFrame7( BarBase, event )
										return 
									else
										BarBase:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										BarBase:setTopBottom( true, false, 114.51, 117.18 )
										BarBase:setAlpha( 0 )
										BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame7 )
									end
								end
								
								if event.interrupted then
									BarBaseFrame6( BarBase, event )
									return 
								else
									BarBase:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BarBase:setTopBottom( true, false, 108.09, 110.76 )
									BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame6 )
								end
							end
							
							if event.interrupted then
								BarBaseFrame5( BarBase, event )
								return 
							else
								BarBase:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								BarBase:setTopBottom( true, false, 104.53, 107.2 )
								BarBase:setAlpha( 1 )
								BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame5 )
							end
						end
						
						if event.interrupted then
							BarBaseFrame4( BarBase, event )
							return 
						else
							BarBase:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							BarBase:setTopBottom( true, false, 99.37, 102.04 )
							BarBase:setAlpha( 0 )
							BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame4 )
						end
					end
					
					if event.interrupted then
						BarBaseFrame3( BarBase, event )
						return 
					else
						BarBase:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BarBase:setTopBottom( true, false, 97.86, 100.53 )
						BarBase:setAlpha( 0.5 )
						BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame3 )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 97, 99.67 )
				self.BarBase:setAlpha( 0 )
				BarBaseFrame2( BarBase, {} )
				local BaseElementFrame2 = function ( BaseElement, event )
					local BaseElementFrame3 = function ( BaseElement, event )
						local BaseElementFrame4 = function ( BaseElement, event )
							local BaseElementFrame5 = function ( BaseElement, event )
								local BaseElementFrame6 = function ( BaseElement, event )
									local BaseElementFrame7 = function ( BaseElement, event )
										local BaseElementFrame8 = function ( BaseElement, event )
											local BaseElementFrame9 = function ( BaseElement, event )
												local BaseElementFrame10 = function ( BaseElement, event )
													local BaseElementFrame11 = function ( BaseElement, event )
														if not event.interrupted then
															BaseElement:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
														end
														BaseElement:setLeftRight( true, false, 131.34, 152.67 )
														BaseElement:setTopBottom( true, false, 166, 178.33 )
														BaseElement:setAlpha( 0.7 )
														BaseElement:setZRot( 0 )
														if event.interrupted then
															self.clipFinished( BaseElement, event )
														else
															BaseElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														BaseElementFrame11( BaseElement, event )
														return 
													else
														BaseElement:beginAnimation( "keyframe", 110, false, true, CoD.TweenType.Back )
														BaseElement:setAlpha( 0.56 )
														BaseElement:setZRot( 0 )
														BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame11 )
													end
												end
												
												if event.interrupted then
													BaseElementFrame10( BaseElement, event )
													return 
												else
													BaseElement:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													BaseElement:setAlpha( 0.51 )
													BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame10 )
												end
											end
											
											if event.interrupted then
												BaseElementFrame9( BaseElement, event )
												return 
											else
												BaseElement:beginAnimation( "keyframe", 430, false, true, CoD.TweenType.Back )
												BaseElement:setTopBottom( true, false, 166, 178.33 )
												BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame9 )
											end
										end
										
										if event.interrupted then
											BaseElementFrame8( BaseElement, event )
											return 
										else
											BaseElement:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BaseElement:setTopBottom( true, false, 167.07, 179.4 )
											BaseElement:setAlpha( 0.5 )
											BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame8 )
										end
									end
									
									if event.interrupted then
										BaseElementFrame7( BaseElement, event )
										return 
									else
										BaseElement:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										BaseElement:setTopBottom( true, false, 159.36, 171.69 )
										BaseElement:setAlpha( 0 )
										BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame7 )
									end
								end
								
								if event.interrupted then
									BaseElementFrame6( BaseElement, event )
									return 
								else
									BaseElement:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BaseElement:setTopBottom( true, false, 150.44, 162.77 )
									BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame6 )
								end
							end
							
							if event.interrupted then
								BaseElementFrame5( BaseElement, event )
								return 
							else
								BaseElement:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								BaseElement:setTopBottom( true, false, 145.53, 157.86 )
								BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame5 )
							end
						end
						
						if event.interrupted then
							BaseElementFrame4( BaseElement, event )
							return 
						else
							BaseElement:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BaseElement:setTopBottom( true, false, 129, 141.33 )
							BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame4 )
						end
					end
					
					if event.interrupted then
						BaseElementFrame3( BaseElement, event )
						return 
					else
						BaseElement:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BaseElement:setTopBottom( true, false, 122.91, 135.24 )
						BaseElement:setAlpha( 0.5 )
						BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame3 )
					end
				end
				
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.67 )
				self.BaseElement:setTopBottom( true, false, 103, 115.33 )
				self.BaseElement:setAlpha( 0 )
				self.BaseElement:setZRot( 180 )
				BaseElementFrame2( BaseElement, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							if not event.interrupted then
								Dot1:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot1:setLeftRight( true, false, 7, 11 )
							Dot1:setTopBottom( true, false, 19, 23 )
							Dot1:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot1, event )
							else
								Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot1:setLeftRight( true, false, 7, 11 )
							Dot1:setAlpha( 0.49 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot1:setLeftRight( true, false, 120.05, 124.05 )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 140, 144 )
				self.Dot1:setTopBottom( true, false, 96, 100 )
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							if not event.interrupted then
								Dot2:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot2:setLeftRight( true, false, 272, 276 )
							Dot2:setTopBottom( true, false, 19, 23 )
							Dot2:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot2, event )
							else
								Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot2:setLeftRight( true, false, 272, 276 )
							Dot2:setAlpha( 0.49 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot2:setLeftRight( true, false, 159.8, 163.8 )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 140, 144 )
				self.Dot2:setTopBottom( true, false, 96, 100 )
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							if not event.interrupted then
								Dot3:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot3:setLeftRight( true, false, 7, 11 )
							Dot3:setTopBottom( true, false, 160, 164 )
							Dot3:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot3, event )
							else
								Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot3:setLeftRight( true, false, 7, 11 )
							Dot3:setAlpha( 0.49 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot3:setLeftRight( true, false, 120.05, 124.05 )
						Dot3:setAlpha( 1 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 140, 144 )
				self.Dot3:setTopBottom( true, false, 97, 101 )
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							if not event.interrupted then
								Dot4:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot4:setLeftRight( true, false, 272, 276 )
							Dot4:setTopBottom( true, false, 160, 164 )
							Dot4:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot4, event )
							else
								Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot4:setLeftRight( true, false, 272, 276 )
							Dot4:setAlpha( 0.49 )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot4:setLeftRight( true, false, 159.8, 163.8 )
						Dot4:setAlpha( 1 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 140, 144 )
				self.Dot4:setTopBottom( true, false, 97, 101 )
				self.Dot4:setAlpha( 0 )
				Dot4Frame2( Dot4, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					local BackCircleOutterFrame3 = function ( BackCircleOutter, event )
						local BackCircleOutterFrame4 = function ( BackCircleOutter, event )
							local BackCircleOutterFrame5 = function ( BackCircleOutter, event )
								local BackCircleOutterFrame6 = function ( BackCircleOutter, event )
									local BackCircleOutterFrame7 = function ( BackCircleOutter, event )
										local BackCircleOutterFrame8 = function ( BackCircleOutter, event )
											local BackCircleOutterFrame9 = function ( BackCircleOutter, event )
												local BackCircleOutterFrame10 = function ( BackCircleOutter, event )
													local BackCircleOutterFrame11 = function ( BackCircleOutter, event )
														if not event.interrupted then
															BackCircleOutter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														end
														BackCircleOutter:setLeftRight( true, false, 88.5, 195.5 )
														BackCircleOutter:setTopBottom( true, false, 85.72, 189.72 )
														BackCircleOutter:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( BackCircleOutter, event )
														else
															BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														BackCircleOutterFrame11( BackCircleOutter, event )
														return 
													else
														BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														BackCircleOutter:setAlpha( 0 )
														BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame11 )
													end
												end
												
												if event.interrupted then
													BackCircleOutterFrame10( BackCircleOutter, event )
													return 
												else
													BackCircleOutter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame10 )
												end
											end
											
											if event.interrupted then
												BackCircleOutterFrame9( BackCircleOutter, event )
												return 
											else
												BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												BackCircleOutter:setTopBottom( true, false, 85.72, 189.72 )
												BackCircleOutter:setAlpha( 1 )
												BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame9 )
											end
										end
										
										if event.interrupted then
											BackCircleOutterFrame8( BackCircleOutter, event )
											return 
										else
											BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											BackCircleOutter:setAlpha( 0.5 )
											BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame8 )
										end
									end
									
									if event.interrupted then
										BackCircleOutterFrame7( BackCircleOutter, event )
										return 
									else
										BackCircleOutter:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleOutterFrame6( BackCircleOutter, event )
									return 
								else
									BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									BackCircleOutter:setAlpha( 0 )
									BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleOutterFrame5( BackCircleOutter, event )
								return 
							else
								BackCircleOutter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleOutterFrame4( BackCircleOutter, event )
							return 
						else
							BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BackCircleOutter:setAlpha( 1 )
							BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleOutterFrame3( BackCircleOutter, event )
						return 
					else
						BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame3 )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 88.5, 195.5 )
				self.BackCircleOutter:setTopBottom( true, false, 38.57, 142.57 )
				self.BackCircleOutter:setAlpha( 0 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				local f3_local9 = function ( f52_arg0, f52_arg1 )
					local f52_local0 = function ( f53_arg0, f53_arg1 )
						local f53_local0 = function ( f54_arg0, f54_arg1 )
							local f54_local0 = function ( f55_arg0, f55_arg1 )
								local f55_local0 = function ( f56_arg0, f56_arg1 )
									local f56_local0 = function ( f57_arg0, f57_arg1 )
										local f57_local0 = function ( f58_arg0, f58_arg1 )
											if not f58_arg1.interrupted then
												f58_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											f58_arg0:setLeftRight( true, false, 136.5, 146.5 )
											f58_arg0:setTopBottom( true, false, 142.57, 152.57 )
											f58_arg0:setAlpha( 0 )
											f58_arg0:setZRot( 180 )
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
											f57_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
										end
									end
									
									if f56_arg1.interrupted then
										f56_local0( f56_arg0, f56_arg1 )
										return 
									else
										f56_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f56_arg0:setTopBottom( true, false, 142.57, 152.57 )
										f56_arg0:setAlpha( 1 )
										f56_arg0:setZRot( 180 )
										f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
									end
								end
								
								if f55_arg1.interrupted then
									f55_local0( f55_arg0, f55_arg1 )
									return 
								else
									f55_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
								end
							end
							
							if f54_arg1.interrupted then
								f54_local0( f54_arg0, f54_arg1 )
								return 
							else
								f54_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f54_arg0:setAlpha( 0 )
								f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
							end
						end
						
						if f53_arg1.interrupted then
							f53_local0( f53_arg0, f53_arg1 )
							return 
						else
							f53_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
						end
					end
					
					if f52_arg1.interrupted then
						f52_local0( f52_arg0, f52_arg1 )
						return 
					else
						f52_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f52_arg0:setAlpha( 1 )
						f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
					end
				end
				
				ArrowFull:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				ArrowFull:setLeftRight( true, false, 136.5, 146.5 )
				ArrowFull:setTopBottom( true, false, 65.57, 75.57 )
				ArrowFull:setAlpha( 0 )
				ArrowFull:setZRot( 0 )
				ArrowFull:registerEventHandler( "transition_complete_keyframe", f3_local9 )
				self.nextClip = "HudStart"
			end,
			HudStop = function ()
				self:setupElementClipCounter( 9 )
				local UIGlowFrame2 = function ( UIGlow, event )
					if not event.interrupted then
						UIGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					UIGlow:setLeftRight( true, false, -8, 275 )
					UIGlow:setTopBottom( true, false, 6, 178.33 )
					UIGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( UIGlow, event )
					else
						UIGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -8, 275 )
				self.UIGlow:setTopBottom( true, false, 6, 178.33 )
				self.UIGlow:setAlpha( 0.6 )
				UIGlowFrame2( UIGlow, {} )
				local BarTopFrame2 = function ( BarTop, event )
					local BarTopFrame3 = function ( BarTop, event )
						if not event.interrupted then
							BarTop:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						BarTop:setLeftRight( true, false, 16, 268 )
						BarTop:setTopBottom( true, false, 100, 102.67 )
						BarTop:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BarTop, event )
						else
							BarTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BarTopFrame3( BarTop, event )
						return 
					else
						BarTop:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BarTop:setTopBottom( true, false, 100, 102.67 )
						BarTop:setAlpha( 0.9 )
						BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame3 )
					end
				end
				
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 20, 22.67 )
				self.BarTop:setAlpha( 0.7 )
				BarTopFrame2( BarTop, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					local BarBaseFrame3 = function ( BarBase, event )
						if not event.interrupted then
							BarBase:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						BarBase:setLeftRight( true, false, 16, 268 )
						BarBase:setTopBottom( true, false, 100, 102.67 )
						BarBase:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BarBase, event )
						else
							BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BarBaseFrame3( BarBase, event )
						return 
					else
						BarBase:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BarBase:setTopBottom( true, false, 100, 102.67 )
						BarBase:setAlpha( 0.5 )
						BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame3 )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 160, 162.67 )
				self.BarBase:setAlpha( 0.4 )
				BarBaseFrame2( BarBase, {} )
				local BaseElementFrame2 = function ( BaseElement, event )
					local BaseElementFrame3 = function ( BaseElement, event )
						local BaseElementFrame4 = function ( BaseElement, event )
							if not event.interrupted then
								BaseElement:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							end
							BaseElement:setLeftRight( true, false, 131.34, 152.67 )
							BaseElement:setTopBottom( true, false, 106, 118.33 )
							BaseElement:setAlpha( 0 )
							BaseElement:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( BaseElement, event )
							else
								BaseElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BaseElementFrame4( BaseElement, event )
							return 
						else
							BaseElement:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							BaseElement:setAlpha( 0.5 )
							BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame4 )
						end
					end
					
					if event.interrupted then
						BaseElementFrame3( BaseElement, event )
						return 
					else
						BaseElement:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BaseElement:setTopBottom( true, false, 106, 118.33 )
						BaseElement:setAlpha( 0.53 )
						BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame3 )
					end
				end
				
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.67 )
				self.BaseElement:setTopBottom( true, false, 166, 178.33 )
				self.BaseElement:setAlpha( 0.7 )
				self.BaseElement:setZRot( 0 )
				BaseElementFrame2( BaseElement, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							local Dot1Frame5 = function ( Dot1, event )
								if not event.interrupted then
									Dot1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot1:setLeftRight( true, false, 140, 144 )
								Dot1:setTopBottom( true, false, 99, 103 )
								Dot1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot1, event )
								else
									Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot1Frame5( Dot1, event )
								return 
							else
								Dot1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot1:setLeftRight( true, false, 140, 144 )
								Dot1:setAlpha( 0.08 )
								Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame5 )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot1:setLeftRight( true, false, 64, 68 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot1:setTopBottom( true, false, 99, 103 )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 7, 11 )
				self.Dot1:setTopBottom( true, false, 19, 23 )
				self.Dot1:setAlpha( 0.6 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							local Dot2Frame5 = function ( Dot2, event )
								if not event.interrupted then
									Dot2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot2:setLeftRight( true, false, 140, 144 )
								Dot2:setTopBottom( true, false, 99, 103 )
								Dot2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot2, event )
								else
									Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot2Frame5( Dot2, event )
								return 
							else
								Dot2:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot2:setLeftRight( true, false, 140, 144 )
								Dot2:setAlpha( 0.08 )
								Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame5 )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot2:setLeftRight( true, false, 215.43, 219.43 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot2:setTopBottom( true, false, 99, 103 )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 272, 276 )
				self.Dot2:setTopBottom( true, false, 19, 23 )
				self.Dot2:setAlpha( 0.6 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							local Dot3Frame5 = function ( Dot3, event )
								if not event.interrupted then
									Dot3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot3:setLeftRight( true, false, 140, 144 )
								Dot3:setTopBottom( true, false, 100, 104 )
								Dot3:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot3, event )
								else
									Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot3Frame5( Dot3, event )
								return 
							else
								Dot3:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot3:setLeftRight( true, false, 140, 144 )
								Dot3:setAlpha( 0.08 )
								Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame5 )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot3:setLeftRight( true, false, 64, 68 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot3:setTopBottom( true, false, 100, 104 )
						Dot3:setAlpha( 1 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 7, 11 )
				self.Dot3:setTopBottom( true, false, 160, 164 )
				self.Dot3:setAlpha( 0.6 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							local Dot4Frame5 = function ( Dot4, event )
								if not event.interrupted then
									Dot4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot4:setLeftRight( true, false, 140, 144 )
								Dot4:setTopBottom( true, false, 100, 104 )
								Dot4:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot4, event )
								else
									Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot4Frame5( Dot4, event )
								return 
							else
								Dot4:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot4:setLeftRight( true, false, 140, 144 )
								Dot4:setAlpha( 0.08 )
								Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame5 )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot4:setLeftRight( true, false, 215.43, 219.43 )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot4:setTopBottom( true, false, 100, 104 )
						Dot4:setAlpha( 1 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 272, 276 )
				self.Dot4:setTopBottom( true, false, 160, 164 )
				self.Dot4:setAlpha( 0.6 )
				Dot4Frame2( Dot4, {} )
				local f59_local8 = function ( f84_arg0, f84_arg1 )
					local f84_local0 = function ( f85_arg0, f85_arg1 )
						local f85_local0 = function ( f86_arg0, f86_arg1 )
							if not f86_arg1.interrupted then
								f86_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f86_arg0:setAlpha( 0 )
							if f86_arg1.interrupted then
								self.clipFinished( f86_arg0, f86_arg1 )
							else
								f86_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f85_arg1.interrupted then
							f85_local0( f85_arg0, f85_arg1 )
							return 
						else
							f85_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
						end
					end
					
					if f84_arg1.interrupted then
						f84_local0( f84_arg0, f84_arg1 )
						return 
					else
						f84_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f84_arg0:setAlpha( 1 )
						f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
					end
				end
				
				ArrowFull:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				ArrowFull:setAlpha( 0 )
				ArrowFull:registerEventHandler( "transition_complete_keyframe", f59_local8 )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -8, 275 )
				self.UIGlow:setTopBottom( true, false, 6, 178.33 )
				self.UIGlow:setAlpha( 0.6 )
				self.clipFinished( UIGlow, {} )
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 20, 22.67 )
				self.BarTop:setAlpha( 0.7 )
				self.clipFinished( BarTop, {} )
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 160, 162.67 )
				self.BarBase:setAlpha( 0.4 )
				self.clipFinished( BarBase, {} )
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.67 )
				self.BaseElement:setTopBottom( true, false, 166, 178.33 )
				self.BaseElement:setAlpha( 0.7 )
				self.clipFinished( BaseElement, {} )
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 7, 11 )
				self.Dot1:setTopBottom( true, false, 19, 23 )
				self.Dot1:setAlpha( 0.6 )
				self.clipFinished( Dot1, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 272, 276 )
				self.Dot2:setTopBottom( true, false, 19, 23 )
				self.Dot2:setAlpha( 0.6 )
				self.clipFinished( Dot2, {} )
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 7, 11 )
				self.Dot3:setTopBottom( true, false, 160, 164 )
				self.Dot3:setAlpha( 0.6 )
				self.clipFinished( Dot3, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 272, 276 )
				self.Dot4:setTopBottom( true, false, 160, 164 )
				self.Dot4:setRGB( 1, 1, 1 )
				self.Dot4:setAlpha( 0.6 )
				self.clipFinished( Dot4, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.clipFinished( BackCircleOutter, {} )
				ArrowFull:completeAnimation()
				self.ArrowFull:setAlpha( 0 )
				self.clipFinished( ArrowFull, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 17.9, 265.01 )
				self.Image0:setTopBottom( true, false, 21, 160 )
				self.Image0:setAlpha( 0.27 )
				self.clipFinished( Image0, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 9 )
				local UIGlowFrame2 = function ( UIGlow, event )
					if not event.interrupted then
						UIGlow:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					UIGlow:setLeftRight( true, false, -8, 275 )
					UIGlow:setTopBottom( true, false, 6, 178.33 )
					UIGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( UIGlow, event )
					else
						UIGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -8, 275 )
				self.UIGlow:setTopBottom( true, false, 6, 178.33 )
				self.UIGlow:setAlpha( 0.6 )
				UIGlowFrame2( UIGlow, {} )
				local BarTopFrame2 = function ( BarTop, event )
					local BarTopFrame3 = function ( BarTop, event )
						if not event.interrupted then
							BarTop:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						BarTop:setLeftRight( true, false, 16, 268 )
						BarTop:setTopBottom( true, false, 100, 102.67 )
						BarTop:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BarTop, event )
						else
							BarTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BarTopFrame3( BarTop, event )
						return 
					else
						BarTop:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BarTop:setTopBottom( true, false, 100, 102.67 )
						BarTop:setAlpha( 0.9 )
						BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame3 )
					end
				end
				
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 20, 22.67 )
				self.BarTop:setAlpha( 0.7 )
				BarTopFrame2( BarTop, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					local BarBaseFrame3 = function ( BarBase, event )
						if not event.interrupted then
							BarBase:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						BarBase:setLeftRight( true, false, 16, 268 )
						BarBase:setTopBottom( true, false, 100, 102.67 )
						BarBase:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BarBase, event )
						else
							BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BarBaseFrame3( BarBase, event )
						return 
					else
						BarBase:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BarBase:setTopBottom( true, false, 100, 102.67 )
						BarBase:setAlpha( 0.5 )
						BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame3 )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 160, 162.67 )
				self.BarBase:setAlpha( 0.4 )
				BarBaseFrame2( BarBase, {} )
				local BaseElementFrame2 = function ( BaseElement, event )
					local BaseElementFrame3 = function ( BaseElement, event )
						local BaseElementFrame4 = function ( BaseElement, event )
							if not event.interrupted then
								BaseElement:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							end
							BaseElement:setLeftRight( true, false, 131.34, 152.67 )
							BaseElement:setTopBottom( true, false, 106, 118.33 )
							BaseElement:setAlpha( 0 )
							BaseElement:setZRot( 180 )
							if event.interrupted then
								self.clipFinished( BaseElement, event )
							else
								BaseElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BaseElementFrame4( BaseElement, event )
							return 
						else
							BaseElement:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							BaseElement:setAlpha( 0.5 )
							BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame4 )
						end
					end
					
					if event.interrupted then
						BaseElementFrame3( BaseElement, event )
						return 
					else
						BaseElement:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
						BaseElement:setTopBottom( true, false, 106, 118.33 )
						BaseElement:setAlpha( 0.53 )
						BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame3 )
					end
				end
				
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.67 )
				self.BaseElement:setTopBottom( true, false, 166, 178.33 )
				self.BaseElement:setAlpha( 0.7 )
				self.BaseElement:setZRot( 0 )
				BaseElementFrame2( BaseElement, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							local Dot1Frame5 = function ( Dot1, event )
								if not event.interrupted then
									Dot1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot1:setLeftRight( true, false, 140, 144 )
								Dot1:setTopBottom( true, false, 99, 103 )
								Dot1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot1, event )
								else
									Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot1Frame5( Dot1, event )
								return 
							else
								Dot1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot1:setLeftRight( true, false, 140, 144 )
								Dot1:setAlpha( 0.08 )
								Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame5 )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot1:setLeftRight( true, false, 64, 68 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot1:setTopBottom( true, false, 99, 103 )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 7, 11 )
				self.Dot1:setTopBottom( true, false, 19, 23 )
				self.Dot1:setAlpha( 0.6 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							local Dot2Frame5 = function ( Dot2, event )
								if not event.interrupted then
									Dot2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot2:setLeftRight( true, false, 140, 144 )
								Dot2:setTopBottom( true, false, 99, 103 )
								Dot2:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot2, event )
								else
									Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot2Frame5( Dot2, event )
								return 
							else
								Dot2:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot2:setLeftRight( true, false, 140, 144 )
								Dot2:setAlpha( 0.08 )
								Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame5 )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot2:setLeftRight( true, false, 215.43, 219.43 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot2:setTopBottom( true, false, 99, 103 )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 272, 276 )
				self.Dot2:setTopBottom( true, false, 19, 23 )
				self.Dot2:setAlpha( 0.6 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							local Dot3Frame5 = function ( Dot3, event )
								if not event.interrupted then
									Dot3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot3:setLeftRight( true, false, 140, 144 )
								Dot3:setTopBottom( true, false, 100, 104 )
								Dot3:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot3, event )
								else
									Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot3Frame5( Dot3, event )
								return 
							else
								Dot3:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot3:setLeftRight( true, false, 140, 144 )
								Dot3:setAlpha( 0.08 )
								Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame5 )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot3:setLeftRight( true, false, 64, 68 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot3:setTopBottom( true, false, 100, 104 )
						Dot3:setAlpha( 1 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 7, 11 )
				self.Dot3:setTopBottom( true, false, 160, 164 )
				self.Dot3:setAlpha( 0.6 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							local Dot4Frame5 = function ( Dot4, event )
								if not event.interrupted then
									Dot4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								end
								Dot4:setLeftRight( true, false, 140, 144 )
								Dot4:setTopBottom( true, false, 100, 104 )
								Dot4:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Dot4, event )
								else
									Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Dot4Frame5( Dot4, event )
								return 
							else
								Dot4:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								Dot4:setLeftRight( true, false, 140, 144 )
								Dot4:setAlpha( 0.08 )
								Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame5 )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Back )
							Dot4:setLeftRight( true, false, 215.43, 219.43 )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Elastic )
						Dot4:setTopBottom( true, false, 100, 104 )
						Dot4:setAlpha( 1 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 272, 276 )
				self.Dot4:setTopBottom( true, false, 160, 164 )
				self.Dot4:setAlpha( 0.6 )
				Dot4Frame2( Dot4, {} )
				local f88_local8 = function ( f113_arg0, f113_arg1 )
					local f113_local0 = function ( f114_arg0, f114_arg1 )
						local f114_local0 = function ( f115_arg0, f115_arg1 )
							if not f115_arg1.interrupted then
								f115_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f115_arg0:setAlpha( 0 )
							if f115_arg1.interrupted then
								self.clipFinished( f115_arg0, f115_arg1 )
							else
								f115_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f114_arg1.interrupted then
							f114_local0( f114_arg0, f114_arg1 )
							return 
						else
							f114_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
						end
					end
					
					if f113_arg1.interrupted then
						f113_local0( f113_arg0, f113_arg1 )
						return 
					else
						f113_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f113_arg0:setAlpha( 1 )
						f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
					end
				end
				
				ArrowFull:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				ArrowFull:setAlpha( 0 )
				ArrowFull:registerEventHandler( "transition_complete_keyframe", f88_local8 )
			end
		},
		HudStop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -8, 275 )
				self.UIGlow:setTopBottom( true, false, 6, 178.33 )
				self.UIGlow:setAlpha( 0 )
				self.clipFinished( UIGlow, {} )
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 97, 99.67 )
				self.BarTop:setAlpha( 0 )
				self.clipFinished( BarTop, {} )
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 97, 99.67 )
				self.BarBase:setAlpha( 0 )
				self.clipFinished( BarBase, {} )
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.67 )
				self.BaseElement:setTopBottom( true, false, 103, 115.33 )
				self.BaseElement:setAlpha( 0 )
				self.BaseElement:setZRot( 180 )
				self.clipFinished( BaseElement, {} )
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 140, 144 )
				self.Dot1:setTopBottom( true, false, 96, 100 )
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 140, 144 )
				self.Dot2:setTopBottom( true, false, 96, 100 )
				self.Dot2:setAlpha( 0 )
				self.clipFinished( Dot2, {} )
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 140, 144 )
				self.Dot3:setTopBottom( true, false, 97, 101 )
				self.Dot3:setAlpha( 0 )
				self.clipFinished( Dot3, {} )
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 140, 144 )
				self.Dot4:setTopBottom( true, false, 97, 101 )
				self.Dot4:setAlpha( 0 )
				self.clipFinished( Dot4, {} )
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setAlpha( 0 )
				self.clipFinished( BackCircleOutter, {} )
				ArrowFull:completeAnimation()
				self.ArrowFull:setAlpha( 0 )
				self.clipFinished( ArrowFull, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 10 )
				local UIGlowFrame2 = function ( UIGlow, event )
					local UIGlowFrame3 = function ( UIGlow, event )
						if not event.interrupted then
							UIGlow:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
						end
						UIGlow:setLeftRight( true, false, -8, 275 )
						UIGlow:setTopBottom( true, false, 6, 178.33 )
						UIGlow:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( UIGlow, event )
						else
							UIGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						UIGlowFrame3( UIGlow, event )
						return 
					else
						UIGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						UIGlow:registerEventHandler( "transition_complete_keyframe", UIGlowFrame3 )
					end
				end
				
				UIGlow:completeAnimation()
				self.UIGlow:setLeftRight( true, false, -8, 275 )
				self.UIGlow:setTopBottom( true, false, 6, 178.33 )
				self.UIGlow:setAlpha( 0 )
				UIGlowFrame2( UIGlow, {} )
				local BarTopFrame2 = function ( BarTop, event )
					local BarTopFrame3 = function ( BarTop, event )
						local BarTopFrame4 = function ( BarTop, event )
							local BarTopFrame5 = function ( BarTop, event )
								local BarTopFrame6 = function ( BarTop, event )
									local BarTopFrame7 = function ( BarTop, event )
										local BarTopFrame8 = function ( BarTop, event )
											if not event.interrupted then
												BarTop:beginAnimation( "keyframe", 840, true, true, CoD.TweenType.Back )
											end
											BarTop:setLeftRight( true, false, 16, 268 )
											BarTop:setTopBottom( true, false, 20, 22.67 )
											BarTop:setAlpha( 0.7 )
											if event.interrupted then
												self.clipFinished( BarTop, event )
											else
												BarTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BarTopFrame8( BarTop, event )
											return 
										else
											BarTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BarTop:setTopBottom( true, false, 69.63, 72.3 )
											BarTop:setAlpha( 1 )
											BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame8 )
										end
									end
									
									if event.interrupted then
										BarTopFrame7( BarTop, event )
										return 
									else
										BarTop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										BarTop:setTopBottom( true, false, 75.6, 78.27 )
										BarTop:setAlpha( 0 )
										BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame7 )
									end
								end
								
								if event.interrupted then
									BarTopFrame6( BarTop, event )
									return 
								else
									BarTop:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BarTop:setTopBottom( true, false, 83.44, 86.11 )
									BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame6 )
								end
							end
							
							if event.interrupted then
								BarTopFrame5( BarTop, event )
								return 
							else
								BarTop:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								BarTop:setTopBottom( true, false, 87.8, 90.47 )
								BarTop:setAlpha( 1 )
								BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame5 )
							end
						end
						
						if event.interrupted then
							BarTopFrame4( BarTop, event )
							return 
						else
							BarTop:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							BarTop:setTopBottom( true, false, 94.11, 96.78 )
							BarTop:setAlpha( 0 )
							BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame4 )
						end
					end
					
					if event.interrupted then
						BarTopFrame3( BarTop, event )
						return 
					else
						BarTop:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BarTop:setTopBottom( true, false, 95.95, 98.62 )
						BarTop:setAlpha( 0.9 )
						BarTop:registerEventHandler( "transition_complete_keyframe", BarTopFrame3 )
					end
				end
				
				BarTop:completeAnimation()
				self.BarTop:setLeftRight( true, false, 16, 268 )
				self.BarTop:setTopBottom( true, false, 97, 99.67 )
				self.BarTop:setAlpha( 0 )
				BarTopFrame2( BarTop, {} )
				local BarBaseFrame2 = function ( BarBase, event )
					local BarBaseFrame3 = function ( BarBase, event )
						local BarBaseFrame4 = function ( BarBase, event )
							local BarBaseFrame5 = function ( BarBase, event )
								local BarBaseFrame6 = function ( BarBase, event )
									local BarBaseFrame7 = function ( BarBase, event )
										local BarBaseFrame8 = function ( BarBase, event )
											if not event.interrupted then
												BarBase:beginAnimation( "keyframe", 840, true, true, CoD.TweenType.Back )
											end
											BarBase:setLeftRight( true, false, 16, 268 )
											BarBase:setTopBottom( true, false, 160, 162.67 )
											BarBase:setAlpha( 0.4 )
											if event.interrupted then
												self.clipFinished( BarBase, event )
											else
												BarBase:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											BarBaseFrame8( BarBase, event )
											return 
										else
											BarBase:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BarBase:setTopBottom( true, false, 119.39, 122.06 )
											BarBase:setAlpha( 1 )
											BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame8 )
										end
									end
									
									if event.interrupted then
										BarBaseFrame7( BarBase, event )
										return 
									else
										BarBase:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										BarBase:setTopBottom( true, false, 114.51, 117.18 )
										BarBase:setAlpha( 0 )
										BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame7 )
									end
								end
								
								if event.interrupted then
									BarBaseFrame6( BarBase, event )
									return 
								else
									BarBase:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									BarBase:setTopBottom( true, false, 108.09, 110.76 )
									BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame6 )
								end
							end
							
							if event.interrupted then
								BarBaseFrame5( BarBase, event )
								return 
							else
								BarBase:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								BarBase:setTopBottom( true, false, 104.53, 107.2 )
								BarBase:setAlpha( 1 )
								BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame5 )
							end
						end
						
						if event.interrupted then
							BarBaseFrame4( BarBase, event )
							return 
						else
							BarBase:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							BarBase:setTopBottom( true, false, 99.37, 102.04 )
							BarBase:setAlpha( 0 )
							BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame4 )
						end
					end
					
					if event.interrupted then
						BarBaseFrame3( BarBase, event )
						return 
					else
						BarBase:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BarBase:setTopBottom( true, false, 97.86, 100.53 )
						BarBase:setAlpha( 0.5 )
						BarBase:registerEventHandler( "transition_complete_keyframe", BarBaseFrame3 )
					end
				end
				
				BarBase:completeAnimation()
				self.BarBase:setLeftRight( true, false, 16, 268 )
				self.BarBase:setTopBottom( true, false, 97, 99.67 )
				self.BarBase:setAlpha( 0 )
				BarBaseFrame2( BarBase, {} )
				local BaseElementFrame2 = function ( BaseElement, event )
					local BaseElementFrame3 = function ( BaseElement, event )
						local BaseElementFrame4 = function ( BaseElement, event )
							local BaseElementFrame5 = function ( BaseElement, event )
								local BaseElementFrame6 = function ( BaseElement, event )
									local BaseElementFrame7 = function ( BaseElement, event )
										local BaseElementFrame8 = function ( BaseElement, event )
											local BaseElementFrame9 = function ( BaseElement, event )
												local BaseElementFrame10 = function ( BaseElement, event )
													local BaseElementFrame11 = function ( BaseElement, event )
														if not event.interrupted then
															BaseElement:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
														end
														BaseElement:setLeftRight( true, false, 131.34, 152.67 )
														BaseElement:setTopBottom( true, false, 166, 178.33 )
														BaseElement:setAlpha( 0.7 )
														BaseElement:setZRot( 0 )
														if event.interrupted then
															self.clipFinished( BaseElement, event )
														else
															BaseElement:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														BaseElementFrame11( BaseElement, event )
														return 
													else
														BaseElement:beginAnimation( "keyframe", 110, false, true, CoD.TweenType.Back )
														BaseElement:setAlpha( 0.56 )
														BaseElement:setZRot( 0 )
														BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame11 )
													end
												end
												
												if event.interrupted then
													BaseElementFrame10( BaseElement, event )
													return 
												else
													BaseElement:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													BaseElement:setAlpha( 0.51 )
													BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame10 )
												end
											end
											
											if event.interrupted then
												BaseElementFrame9( BaseElement, event )
												return 
											else
												BaseElement:beginAnimation( "keyframe", 430, false, true, CoD.TweenType.Back )
												BaseElement:setTopBottom( true, false, 166, 178.33 )
												BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame9 )
											end
										end
										
										if event.interrupted then
											BaseElementFrame8( BaseElement, event )
											return 
										else
											BaseElement:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											BaseElement:setTopBottom( true, false, 167.07, 179.4 )
											BaseElement:setAlpha( 0.5 )
											BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame8 )
										end
									end
									
									if event.interrupted then
										BaseElementFrame7( BaseElement, event )
										return 
									else
										BaseElement:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										BaseElement:setTopBottom( true, false, 159.36, 171.69 )
										BaseElement:setAlpha( 0 )
										BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame7 )
									end
								end
								
								if event.interrupted then
									BaseElementFrame6( BaseElement, event )
									return 
								else
									BaseElement:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									BaseElement:setTopBottom( true, false, 150.44, 162.77 )
									BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame6 )
								end
							end
							
							if event.interrupted then
								BaseElementFrame5( BaseElement, event )
								return 
							else
								BaseElement:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								BaseElement:setTopBottom( true, false, 145.53, 157.86 )
								BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame5 )
							end
						end
						
						if event.interrupted then
							BaseElementFrame4( BaseElement, event )
							return 
						else
							BaseElement:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BaseElement:setTopBottom( true, false, 129, 141.33 )
							BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame4 )
						end
					end
					
					if event.interrupted then
						BaseElementFrame3( BaseElement, event )
						return 
					else
						BaseElement:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						BaseElement:setTopBottom( true, false, 122.91, 135.24 )
						BaseElement:setAlpha( 0.5 )
						BaseElement:registerEventHandler( "transition_complete_keyframe", BaseElementFrame3 )
					end
				end
				
				BaseElement:completeAnimation()
				self.BaseElement:setLeftRight( true, false, 131.34, 152.67 )
				self.BaseElement:setTopBottom( true, false, 103, 115.33 )
				self.BaseElement:setAlpha( 0 )
				self.BaseElement:setZRot( 180 )
				BaseElementFrame2( BaseElement, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						local Dot1Frame4 = function ( Dot1, event )
							if not event.interrupted then
								Dot1:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot1:setLeftRight( true, false, 7, 11 )
							Dot1:setTopBottom( true, false, 19, 23 )
							Dot1:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot1, event )
							else
								Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot1Frame4( Dot1, event )
							return 
						else
							Dot1:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot1:setLeftRight( true, false, 7, 11 )
							Dot1:setAlpha( 0.49 )
							Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame4 )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot1:setLeftRight( true, false, 120.05, 124.05 )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setLeftRight( true, false, 140, 144 )
				self.Dot1:setTopBottom( true, false, 96, 100 )
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							if not event.interrupted then
								Dot2:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot2:setLeftRight( true, false, 272, 276 )
							Dot2:setTopBottom( true, false, 19, 23 )
							Dot2:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot2, event )
							else
								Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot2Frame4( Dot2, event )
							return 
						else
							Dot2:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot2:setLeftRight( true, false, 272, 276 )
							Dot2:setAlpha( 0.49 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot2:setLeftRight( true, false, 159.8, 163.8 )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setLeftRight( true, false, 140, 144 )
				self.Dot2:setTopBottom( true, false, 96, 100 )
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							if not event.interrupted then
								Dot3:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot3:setLeftRight( true, false, 7, 11 )
							Dot3:setTopBottom( true, false, 160, 164 )
							Dot3:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot3, event )
							else
								Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot3Frame4( Dot3, event )
							return 
						else
							Dot3:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot3:setLeftRight( true, false, 7, 11 )
							Dot3:setAlpha( 0.49 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot3:setLeftRight( true, false, 120.05, 124.05 )
						Dot3:setAlpha( 1 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setLeftRight( true, false, 140, 144 )
				self.Dot3:setTopBottom( true, false, 97, 101 )
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							if not event.interrupted then
								Dot4:beginAnimation( "keyframe", 800, false, true, CoD.TweenType.Elastic )
							end
							Dot4:setLeftRight( true, false, 272, 276 )
							Dot4:setTopBottom( true, false, 160, 164 )
							Dot4:setAlpha( 0.6 )
							if event.interrupted then
								self.clipFinished( Dot4, event )
							else
								Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							Dot4:setLeftRight( true, false, 272, 276 )
							Dot4:setAlpha( 0.49 )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Dot4:setLeftRight( true, false, 159.8, 163.8 )
						Dot4:setAlpha( 1 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setLeftRight( true, false, 140, 144 )
				self.Dot4:setTopBottom( true, false, 97, 101 )
				self.Dot4:setAlpha( 0 )
				Dot4Frame2( Dot4, {} )
				local BackCircleOutterFrame2 = function ( BackCircleOutter, event )
					local BackCircleOutterFrame3 = function ( BackCircleOutter, event )
						local BackCircleOutterFrame4 = function ( BackCircleOutter, event )
							local BackCircleOutterFrame5 = function ( BackCircleOutter, event )
								local BackCircleOutterFrame6 = function ( BackCircleOutter, event )
									local BackCircleOutterFrame7 = function ( BackCircleOutter, event )
										local BackCircleOutterFrame8 = function ( BackCircleOutter, event )
											local BackCircleOutterFrame9 = function ( BackCircleOutter, event )
												local BackCircleOutterFrame10 = function ( BackCircleOutter, event )
													local BackCircleOutterFrame11 = function ( BackCircleOutter, event )
														if not event.interrupted then
															BackCircleOutter:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														end
														BackCircleOutter:setLeftRight( true, false, 88.5, 195.5 )
														BackCircleOutter:setTopBottom( true, false, 85.72, 189.72 )
														BackCircleOutter:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( BackCircleOutter, event )
														else
															BackCircleOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														BackCircleOutterFrame11( BackCircleOutter, event )
														return 
													else
														BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														BackCircleOutter:setAlpha( 0 )
														BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame11 )
													end
												end
												
												if event.interrupted then
													BackCircleOutterFrame10( BackCircleOutter, event )
													return 
												else
													BackCircleOutter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame10 )
												end
											end
											
											if event.interrupted then
												BackCircleOutterFrame9( BackCircleOutter, event )
												return 
											else
												BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												BackCircleOutter:setTopBottom( true, false, 85.72, 189.72 )
												BackCircleOutter:setAlpha( 1 )
												BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame9 )
											end
										end
										
										if event.interrupted then
											BackCircleOutterFrame8( BackCircleOutter, event )
											return 
										else
											BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											BackCircleOutter:setAlpha( 0.5 )
											BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame8 )
										end
									end
									
									if event.interrupted then
										BackCircleOutterFrame7( BackCircleOutter, event )
										return 
									else
										BackCircleOutter:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame7 )
									end
								end
								
								if event.interrupted then
									BackCircleOutterFrame6( BackCircleOutter, event )
									return 
								else
									BackCircleOutter:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									BackCircleOutter:setAlpha( 0 )
									BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame6 )
								end
							end
							
							if event.interrupted then
								BackCircleOutterFrame5( BackCircleOutter, event )
								return 
							else
								BackCircleOutter:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame5 )
							end
						end
						
						if event.interrupted then
							BackCircleOutterFrame4( BackCircleOutter, event )
							return 
						else
							BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							BackCircleOutter:setAlpha( 1 )
							BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame4 )
						end
					end
					
					if event.interrupted then
						BackCircleOutterFrame3( BackCircleOutter, event )
						return 
					else
						BackCircleOutter:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						BackCircleOutter:registerEventHandler( "transition_complete_keyframe", BackCircleOutterFrame3 )
					end
				end
				
				BackCircleOutter:completeAnimation()
				self.BackCircleOutter:setLeftRight( true, false, 88.5, 195.5 )
				self.BackCircleOutter:setTopBottom( true, false, 38.57, 142.57 )
				self.BackCircleOutter:setAlpha( 0 )
				BackCircleOutterFrame2( BackCircleOutter, {} )
				local f117_local9 = function ( f166_arg0, f166_arg1 )
					local f166_local0 = function ( f167_arg0, f167_arg1 )
						local f167_local0 = function ( f168_arg0, f168_arg1 )
							local f168_local0 = function ( f169_arg0, f169_arg1 )
								local f169_local0 = function ( f170_arg0, f170_arg1 )
									local f170_local0 = function ( f171_arg0, f171_arg1 )
										local f171_local0 = function ( f172_arg0, f172_arg1 )
											if not f172_arg1.interrupted then
												f172_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											end
											f172_arg0:setLeftRight( true, false, 136.5, 146.5 )
											f172_arg0:setTopBottom( true, false, 142.57, 152.57 )
											f172_arg0:setAlpha( 0 )
											f172_arg0:setZRot( 180 )
											if f172_arg1.interrupted then
												self.clipFinished( f172_arg0, f172_arg1 )
											else
												f172_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f171_arg1.interrupted then
											f171_local0( f171_arg0, f171_arg1 )
											return 
										else
											f171_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f171_arg0:registerEventHandler( "transition_complete_keyframe", f171_local0 )
										end
									end
									
									if f170_arg1.interrupted then
										f170_local0( f170_arg0, f170_arg1 )
										return 
									else
										f170_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f170_arg0:setTopBottom( true, false, 142.57, 152.57 )
										f170_arg0:setAlpha( 1 )
										f170_arg0:setZRot( 180 )
										f170_arg0:registerEventHandler( "transition_complete_keyframe", f170_local0 )
									end
								end
								
								if f169_arg1.interrupted then
									f169_local0( f169_arg0, f169_arg1 )
									return 
								else
									f169_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									f169_arg0:registerEventHandler( "transition_complete_keyframe", f169_local0 )
								end
							end
							
							if f168_arg1.interrupted then
								f168_local0( f168_arg0, f168_arg1 )
								return 
							else
								f168_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f168_arg0:setAlpha( 0 )
								f168_arg0:registerEventHandler( "transition_complete_keyframe", f168_local0 )
							end
						end
						
						if f167_arg1.interrupted then
							f167_local0( f167_arg0, f167_arg1 )
							return 
						else
							f167_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f167_arg0:registerEventHandler( "transition_complete_keyframe", f167_local0 )
						end
					end
					
					if f166_arg1.interrupted then
						f166_local0( f166_arg0, f166_arg1 )
						return 
					else
						f166_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f166_arg0:setAlpha( 1 )
						f166_arg0:registerEventHandler( "transition_complete_keyframe", f166_local0 )
					end
				end
				
				ArrowFull:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				ArrowFull:setLeftRight( true, false, 136.5, 146.5 )
				ArrowFull:setTopBottom( true, false, 65.57, 75.57 )
				ArrowFull:setAlpha( 0 )
				ArrowFull:setZRot( 0 )
				ArrowFull:registerEventHandler( "transition_complete_keyframe", f117_local9 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BarTop:close()
		element.BarBase:close()
		element.BaseElement:close()
		element.Dot1:close()
		element.Dot2:close()
		element.Dot3:close()
		element.Dot4:close()
		element.BackCircleOutter:close()
		element.ArrowFull:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

