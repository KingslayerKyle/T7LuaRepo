-- 9766bd57e088f10356ac14739a8e52ad
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityGlow" )
require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_TopLineBlink" )

CoD.DniWipe_DottedCircleWidget = InheritFrom( LUI.UIElement )
CoD.DniWipe_DottedCircleWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.DniWipe_DottedCircleWidget )
	self.id = "DniWipe_DottedCircleWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local CenterCircleDots0 = LUI.UIImage.new()
	CenterCircleDots0:setLeftRight( false, false, -213.94, 213.94 )
	CenterCircleDots0:setTopBottom( false, false, -213.94, 213.94 )
	CenterCircleDots0:setAlpha( 0.4 )
	CenterCircleDots0:setScale( 2.1 )
	CenterCircleDots0:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgbcentercircledots" ) )
	CenterCircleDots0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircleDots0 )
	self.CenterCircleDots0 = CenterCircleDots0
	
	local CenterCircleDots = LUI.UIImage.new()
	CenterCircleDots:setLeftRight( false, false, -213.94, 213.94 )
	CenterCircleDots:setTopBottom( false, false, -213.94, 213.94 )
	CenterCircleDots:setImage( RegisterImage( "uie_t7_hud_dniwipe_rgbcentercircledots" ) )
	CenterCircleDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterCircleDots )
	self.CenterCircleDots = CenterCircleDots
	
	local Glow0 = CoD.AmmoWidget_AbilityGlow.new( menu, controller )
	Glow0:setLeftRight( false, false, -221.52, 221.52 )
	Glow0:setTopBottom( false, false, -225, 225 )
	Glow0:setRGB( 0.4, 0.65, 0.99 )
	Glow0:setAlpha( 0 )
	Glow0:setZoom( 13.47 )
	self:addElement( Glow0 )
	self.Glow0 = Glow0
	
	local OutsideRing = LUI.UIImage.new()
	OutsideRing:setLeftRight( false, false, -201, 201 )
	OutsideRing:setTopBottom( false, false, -201, 201 )
	OutsideRing:setRGB( 0.6, 0.82, 0.91 )
	OutsideRing:setAlpha( 0 )
	OutsideRing:setScale( 1.4 )
	OutsideRing:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_outsidering" ) )
	OutsideRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( OutsideRing )
	self.OutsideRing = OutsideRing
	
	local msDoubleArrowsUpper = LUI.UIImage.new()
	msDoubleArrowsUpper:setLeftRight( false, false, -9.75, 14.75 )
	msDoubleArrowsUpper:setTopBottom( false, false, -224.44, -199.94 )
	msDoubleArrowsUpper:setRGB( 0.74, 0.94, 0.99 )
	msDoubleArrowsUpper:setAlpha( 0.3 )
	msDoubleArrowsUpper:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_arrowsingle" ) )
	msDoubleArrowsUpper:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msDoubleArrowsUpper )
	self.msDoubleArrowsUpper = msDoubleArrowsUpper
	
	local msDoubleArrowsUpper0 = LUI.UIImage.new()
	msDoubleArrowsUpper0:setLeftRight( false, false, -9.75, 14.75 )
	msDoubleArrowsUpper0:setTopBottom( false, false, 199.25, 223.75 )
	msDoubleArrowsUpper0:setRGB( 0.74, 0.94, 0.99 )
	msDoubleArrowsUpper0:setAlpha( 0.3 )
	msDoubleArrowsUpper0:setZRot( 180 )
	msDoubleArrowsUpper0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_mothership_arrowsingle" ) )
	msDoubleArrowsUpper0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( msDoubleArrowsUpper0 )
	self.msDoubleArrowsUpper0 = msDoubleArrowsUpper0
	
	local DniWipeTopLineBlink = CoD.DniWipe_TopLineBlink.new( menu, controller )
	DniWipeTopLineBlink:setLeftRight( false, false, -5, 10 )
	DniWipeTopLineBlink:setTopBottom( false, false, -144.5, -119.5 )
	self:addElement( DniWipeTopLineBlink )
	self.DniWipeTopLineBlink = DniWipeTopLineBlink
	
	local DniWipeTopLineBlink1 = CoD.DniWipe_TopLineBlink.new( menu, controller )
	DniWipeTopLineBlink1:setLeftRight( false, false, -5, 10 )
	DniWipeTopLineBlink1:setTopBottom( false, false, 116, 141 )
	self:addElement( DniWipeTopLineBlink1 )
	self.DniWipeTopLineBlink1 = DniWipeTopLineBlink1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local CenterCircleDots0Frame2 = function ( CenterCircleDots0, event )
					local CenterCircleDots0Frame3 = function ( CenterCircleDots0, event )
						local CenterCircleDots0Frame4 = function ( CenterCircleDots0, event )
							local CenterCircleDots0Frame5 = function ( CenterCircleDots0, event )
								local CenterCircleDots0Frame6 = function ( CenterCircleDots0, event )
									local CenterCircleDots0Frame7 = function ( CenterCircleDots0, event )
										local CenterCircleDots0Frame8 = function ( CenterCircleDots0, event )
											local CenterCircleDots0Frame9 = function ( CenterCircleDots0, event )
												local CenterCircleDots0Frame10 = function ( CenterCircleDots0, event )
													local CenterCircleDots0Frame11 = function ( CenterCircleDots0, event )
														local CenterCircleDots0Frame12 = function ( CenterCircleDots0, event )
															local CenterCircleDots0Frame13 = function ( CenterCircleDots0, event )
																if not event.interrupted then
																	CenterCircleDots0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																end
																CenterCircleDots0:setAlpha( 0.4 )
																CenterCircleDots0:setXRot( 0 )
																CenterCircleDots0:setZRot( 25 )
																CenterCircleDots0:setScale( 2.1 )
																if event.interrupted then
																	self.clipFinished( CenterCircleDots0, event )
																else
																	CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																CenterCircleDots0Frame13( CenterCircleDots0, event )
																return 
															else
																CenterCircleDots0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
																CenterCircleDots0:setAlpha( 0 )
																CenterCircleDots0:setScale( 3.3 )
																CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame13 )
															end
														end
														
														if event.interrupted then
															CenterCircleDots0Frame12( CenterCircleDots0, event )
															return 
														else
															CenterCircleDots0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															CenterCircleDots0:setAlpha( 0.4 )
															CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame12 )
														end
													end
													
													if event.interrupted then
														CenterCircleDots0Frame11( CenterCircleDots0, event )
														return 
													else
														CenterCircleDots0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
														CenterCircleDots0:setAlpha( 0 )
														CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame11 )
													end
												end
												
												if event.interrupted then
													CenterCircleDots0Frame10( CenterCircleDots0, event )
													return 
												else
													CenterCircleDots0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													CenterCircleDots0:setAlpha( 0.4 )
													CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame10 )
												end
											end
											
											if event.interrupted then
												CenterCircleDots0Frame9( CenterCircleDots0, event )
												return 
											else
												CenterCircleDots0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												CenterCircleDots0:setScale( 2.1 )
												CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame9 )
											end
										end
										
										if event.interrupted then
											CenterCircleDots0Frame8( CenterCircleDots0, event )
											return 
										else
											CenterCircleDots0:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Linear )
											CenterCircleDots0:setAlpha( 0 )
											CenterCircleDots0:setScale( 3.3 )
											CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame8 )
										end
									end
									
									if event.interrupted then
										CenterCircleDots0Frame7( CenterCircleDots0, event )
										return 
									else
										CenterCircleDots0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										CenterCircleDots0:setAlpha( 0.4 )
										CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame7 )
									end
								end
								
								if event.interrupted then
									CenterCircleDots0Frame6( CenterCircleDots0, event )
									return 
								else
									CenterCircleDots0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									CenterCircleDots0:setAlpha( 0.88 )
									CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame6 )
								end
							end
							
							if event.interrupted then
								CenterCircleDots0Frame5( CenterCircleDots0, event )
								return 
							else
								CenterCircleDots0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								CenterCircleDots0:setAlpha( 0.4 )
								CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame5 )
							end
						end
						
						if event.interrupted then
							CenterCircleDots0Frame4( CenterCircleDots0, event )
							return 
						else
							CenterCircleDots0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							CenterCircleDots0:setAlpha( 0.1 )
							CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame4 )
						end
					end
					
					if event.interrupted then
						CenterCircleDots0Frame3( CenterCircleDots0, event )
						return 
					else
						CenterCircleDots0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						CenterCircleDots0:setZRot( 25 )
						CenterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterCircleDots0Frame3 )
					end
				end
				
				CenterCircleDots0:completeAnimation()
				self.CenterCircleDots0:setAlpha( 0.4 )
				self.CenterCircleDots0:setXRot( 0 )
				self.CenterCircleDots0:setZRot( 0 )
				self.CenterCircleDots0:setScale( 2.1 )
				CenterCircleDots0Frame2( CenterCircleDots0, {} )
				local CenterCircleDotsFrame2 = function ( CenterCircleDots, event )
					local CenterCircleDotsFrame3 = function ( CenterCircleDots, event )
						local CenterCircleDotsFrame4 = function ( CenterCircleDots, event )
							local CenterCircleDotsFrame5 = function ( CenterCircleDots, event )
								local CenterCircleDotsFrame6 = function ( CenterCircleDots, event )
									local CenterCircleDotsFrame7 = function ( CenterCircleDots, event )
										local CenterCircleDotsFrame8 = function ( CenterCircleDots, event )
											local CenterCircleDotsFrame9 = function ( CenterCircleDots, event )
												local CenterCircleDotsFrame10 = function ( CenterCircleDots, event )
													local CenterCircleDotsFrame11 = function ( CenterCircleDots, event )
														local CenterCircleDotsFrame12 = function ( CenterCircleDots, event )
															local CenterCircleDotsFrame13 = function ( CenterCircleDots, event )
																if not event.interrupted then
																	CenterCircleDots:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
																end
																CenterCircleDots:setAlpha( 1 )
																CenterCircleDots:setXRot( 0 )
																CenterCircleDots:setScale( 1 )
																if event.interrupted then
																	self.clipFinished( CenterCircleDots, event )
																else
																	CenterCircleDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																CenterCircleDotsFrame13( CenterCircleDots, event )
																return 
															else
																CenterCircleDots:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
																CenterCircleDots:setAlpha( 0 )
																CenterCircleDots:setScale( 1.8 )
																CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame13 )
															end
														end
														
														if event.interrupted then
															CenterCircleDotsFrame12( CenterCircleDots, event )
															return 
														else
															CenterCircleDots:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
															CenterCircleDots:setAlpha( 1 )
															CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame12 )
														end
													end
													
													if event.interrupted then
														CenterCircleDotsFrame11( CenterCircleDots, event )
														return 
													else
														CenterCircleDots:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
														CenterCircleDots:setAlpha( 0 )
														CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame11 )
													end
												end
												
												if event.interrupted then
													CenterCircleDotsFrame10( CenterCircleDots, event )
													return 
												else
													CenterCircleDots:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													CenterCircleDots:setAlpha( 1 )
													CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame10 )
												end
											end
											
											if event.interrupted then
												CenterCircleDotsFrame9( CenterCircleDots, event )
												return 
											else
												CenterCircleDots:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												CenterCircleDots:setAlpha( 0 )
												CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame9 )
											end
										end
										
										if event.interrupted then
											CenterCircleDotsFrame8( CenterCircleDots, event )
											return 
										else
											CenterCircleDots:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											CenterCircleDots:setAlpha( 1 )
											CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame8 )
										end
									end
									
									if event.interrupted then
										CenterCircleDotsFrame7( CenterCircleDots, event )
										return 
									else
										CenterCircleDots:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
										CenterCircleDots:setAlpha( 0.05 )
										CenterCircleDots:setScale( 1.3 )
										CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame7 )
									end
								end
								
								if event.interrupted then
									CenterCircleDotsFrame6( CenterCircleDots, event )
									return 
								else
									CenterCircleDots:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									CenterCircleDots:setAlpha( 1 )
									CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame6 )
								end
							end
							
							if event.interrupted then
								CenterCircleDotsFrame5( CenterCircleDots, event )
								return 
							else
								CenterCircleDots:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
								CenterCircleDots:setAlpha( 0 )
								CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame5 )
							end
						end
						
						if event.interrupted then
							CenterCircleDotsFrame4( CenterCircleDots, event )
							return 
						else
							CenterCircleDots:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							CenterCircleDots:setAlpha( 1 )
							CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame4 )
						end
					end
					
					if event.interrupted then
						CenterCircleDotsFrame3( CenterCircleDots, event )
						return 
					else
						CenterCircleDots:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CenterCircleDots:setAlpha( 0 )
						CenterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterCircleDotsFrame3 )
					end
				end
				
				CenterCircleDots:completeAnimation()
				self.CenterCircleDots:setAlpha( 1 )
				self.CenterCircleDots:setXRot( 0 )
				self.CenterCircleDots:setScale( 1 )
				CenterCircleDotsFrame2( CenterCircleDots, {} )
				local Glow0Frame2 = function ( Glow0, event )
					local Glow0Frame3 = function ( Glow0, event )
						local Glow0Frame4 = function ( Glow0, event )
							local Glow0Frame5 = function ( Glow0, event )
								local Glow0Frame6 = function ( Glow0, event )
									if not event.interrupted then
										Glow0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
									end
									Glow0:setAlpha( 0 )
									Glow0:setScale( 2 )
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
									Glow0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									Glow0:setAlpha( 0.1 )
									Glow0:setScale( 1.41 )
									Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame6 )
								end
							end
							
							if event.interrupted then
								Glow0Frame5( Glow0, event )
								return 
							else
								Glow0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
								Glow0:setScale( 1 )
								Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame5 )
							end
						end
						
						if event.interrupted then
							Glow0Frame4( Glow0, event )
							return 
						else
							Glow0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Glow0:setAlpha( 0 )
							Glow0:setScale( 0.94 )
							Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame4 )
						end
					end
					
					if event.interrupted then
						Glow0Frame3( Glow0, event )
						return 
					else
						Glow0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Glow0:setAlpha( 0.03 )
						Glow0:setScale( 0.92 )
						Glow0:registerEventHandler( "transition_complete_keyframe", Glow0Frame3 )
					end
				end
				
				Glow0:completeAnimation()
				self.Glow0:setAlpha( 0 )
				self.Glow0:setScale( 0.9 )
				Glow0Frame2( Glow0, {} )
				local OutsideRingFrame2 = function ( OutsideRing, event )
					local OutsideRingFrame3 = function ( OutsideRing, event )
						local OutsideRingFrame4 = function ( OutsideRing, event )
							local OutsideRingFrame5 = function ( OutsideRing, event )
								local OutsideRingFrame6 = function ( OutsideRing, event )
									local OutsideRingFrame7 = function ( OutsideRing, event )
										local OutsideRingFrame8 = function ( OutsideRing, event )
											local OutsideRingFrame9 = function ( OutsideRing, event )
												if not event.interrupted then
													OutsideRing:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												end
												OutsideRing:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( OutsideRing, event )
												else
													OutsideRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												OutsideRingFrame9( OutsideRing, event )
												return 
											else
												OutsideRing:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												OutsideRing:setAlpha( 0.63 )
												OutsideRing:registerEventHandler( "transition_complete_keyframe", OutsideRingFrame9 )
											end
										end
										
										if event.interrupted then
											OutsideRingFrame8( OutsideRing, event )
											return 
										else
											OutsideRing:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
											OutsideRing:registerEventHandler( "transition_complete_keyframe", OutsideRingFrame8 )
										end
									end
									
									if event.interrupted then
										OutsideRingFrame7( OutsideRing, event )
										return 
									else
										OutsideRing:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										OutsideRing:setAlpha( 0 )
										OutsideRing:registerEventHandler( "transition_complete_keyframe", OutsideRingFrame7 )
									end
								end
								
								if event.interrupted then
									OutsideRingFrame6( OutsideRing, event )
									return 
								else
									OutsideRing:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									OutsideRing:setAlpha( 0.57 )
									OutsideRing:registerEventHandler( "transition_complete_keyframe", OutsideRingFrame6 )
								end
							end
							
							if event.interrupted then
								OutsideRingFrame5( OutsideRing, event )
								return 
							else
								OutsideRing:beginAnimation( "keyframe", 520, false, false, CoD.TweenType.Linear )
								OutsideRing:registerEventHandler( "transition_complete_keyframe", OutsideRingFrame5 )
							end
						end
						
						if event.interrupted then
							OutsideRingFrame4( OutsideRing, event )
							return 
						else
							OutsideRing:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							OutsideRing:setAlpha( 0 )
							OutsideRing:registerEventHandler( "transition_complete_keyframe", OutsideRingFrame4 )
						end
					end
					
					if event.interrupted then
						OutsideRingFrame3( OutsideRing, event )
						return 
					else
						OutsideRing:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						OutsideRing:setAlpha( 0.18 )
						OutsideRing:registerEventHandler( "transition_complete_keyframe", OutsideRingFrame3 )
					end
				end
				
				OutsideRing:completeAnimation()
				self.OutsideRing:setAlpha( 0 )
				OutsideRingFrame2( OutsideRing, {} )
				local msDoubleArrowsUpperFrame2 = function ( msDoubleArrowsUpper, event )
					local msDoubleArrowsUpperFrame3 = function ( msDoubleArrowsUpper, event )
						local msDoubleArrowsUpperFrame4 = function ( msDoubleArrowsUpper, event )
							local msDoubleArrowsUpperFrame5 = function ( msDoubleArrowsUpper, event )
								local msDoubleArrowsUpperFrame6 = function ( msDoubleArrowsUpper, event )
									if not event.interrupted then
										msDoubleArrowsUpper:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									end
									msDoubleArrowsUpper:setLeftRight( false, false, -9.75, 14.75 )
									msDoubleArrowsUpper:setTopBottom( false, false, -224.44, -199.94 )
									msDoubleArrowsUpper:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( msDoubleArrowsUpper, event )
									else
										msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									msDoubleArrowsUpperFrame6( msDoubleArrowsUpper, event )
									return 
								else
									msDoubleArrowsUpper:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
									msDoubleArrowsUpper:setAlpha( 0.52 )
									msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpperFrame6 )
								end
							end
							
							if event.interrupted then
								msDoubleArrowsUpperFrame5( msDoubleArrowsUpper, event )
								return 
							else
								msDoubleArrowsUpper:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
								msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpperFrame5 )
							end
						end
						
						if event.interrupted then
							msDoubleArrowsUpperFrame4( msDoubleArrowsUpper, event )
							return 
						else
							msDoubleArrowsUpper:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							msDoubleArrowsUpper:setAlpha( 0 )
							msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpperFrame4 )
						end
					end
					
					if event.interrupted then
						msDoubleArrowsUpperFrame3( msDoubleArrowsUpper, event )
						return 
					else
						msDoubleArrowsUpper:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						msDoubleArrowsUpper:setAlpha( 0.3 )
						msDoubleArrowsUpper:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpperFrame3 )
					end
				end
				
				msDoubleArrowsUpper:completeAnimation()
				self.msDoubleArrowsUpper:setLeftRight( false, false, -9.75, 14.75 )
				self.msDoubleArrowsUpper:setTopBottom( false, false, -224.44, -199.94 )
				self.msDoubleArrowsUpper:setAlpha( 0 )
				msDoubleArrowsUpperFrame2( msDoubleArrowsUpper, {} )
				local msDoubleArrowsUpper0Frame2 = function ( msDoubleArrowsUpper0, event )
					local msDoubleArrowsUpper0Frame3 = function ( msDoubleArrowsUpper0, event )
						local msDoubleArrowsUpper0Frame4 = function ( msDoubleArrowsUpper0, event )
							local msDoubleArrowsUpper0Frame5 = function ( msDoubleArrowsUpper0, event )
								local msDoubleArrowsUpper0Frame6 = function ( msDoubleArrowsUpper0, event )
									if not event.interrupted then
										msDoubleArrowsUpper0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									end
									msDoubleArrowsUpper0:setLeftRight( false, false, -9.75, 14.75 )
									msDoubleArrowsUpper0:setTopBottom( false, false, 199.25, 223.75 )
									msDoubleArrowsUpper0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( msDoubleArrowsUpper0, event )
									else
										msDoubleArrowsUpper0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									msDoubleArrowsUpper0Frame6( msDoubleArrowsUpper0, event )
									return 
								else
									msDoubleArrowsUpper0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
									msDoubleArrowsUpper0:setAlpha( 0.3 )
									msDoubleArrowsUpper0:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpper0Frame6 )
								end
							end
							
							if event.interrupted then
								msDoubleArrowsUpper0Frame5( msDoubleArrowsUpper0, event )
								return 
							else
								msDoubleArrowsUpper0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
								msDoubleArrowsUpper0:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpper0Frame5 )
							end
						end
						
						if event.interrupted then
							msDoubleArrowsUpper0Frame4( msDoubleArrowsUpper0, event )
							return 
						else
							msDoubleArrowsUpper0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
							msDoubleArrowsUpper0:setAlpha( 0 )
							msDoubleArrowsUpper0:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpper0Frame4 )
						end
					end
					
					if event.interrupted then
						msDoubleArrowsUpper0Frame3( msDoubleArrowsUpper0, event )
						return 
					else
						msDoubleArrowsUpper0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						msDoubleArrowsUpper0:setAlpha( 0.3 )
						msDoubleArrowsUpper0:registerEventHandler( "transition_complete_keyframe", msDoubleArrowsUpper0Frame3 )
					end
				end
				
				msDoubleArrowsUpper0:completeAnimation()
				self.msDoubleArrowsUpper0:setLeftRight( false, false, -9.75, 14.75 )
				self.msDoubleArrowsUpper0:setTopBottom( false, false, 199.25, 223.75 )
				self.msDoubleArrowsUpper0:setAlpha( 0 )
				msDoubleArrowsUpper0Frame2( msDoubleArrowsUpper0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Glow0:close()
		element.DniWipeTopLineBlink:close()
		element.DniWipeTopLineBlink1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

