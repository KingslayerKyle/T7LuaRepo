require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_NumbersInternal" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_Title" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )

CoD.PrematchCountdown_Numbers = InheritFrom( LUI.UIElement )
CoD.PrematchCountdown_Numbers.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrematchCountdown_Numbers )
	self.id = "PrematchCountdown_Numbers"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 70 )
	self.anyChildUsesUpdateState = true
	
	local GlowPanel = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	GlowPanel:setLeftRight( true, false, 507.5, 782 )
	GlowPanel:setTopBottom( true, false, -102.25, 172.25 )
	self:addElement( GlowPanel )
	self.GlowPanel = GlowPanel
	
	local LineBottom = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineBottom:setLeftRight( false, false, -16, 16 )
	LineBottom:setTopBottom( false, false, 58.14, 61.14 )
	LineBottom:setZRot( -90 )
	self:addElement( LineBottom )
	self.LineBottom = LineBottom
	
	local PanelAmmo = CoD.FE_ButtonPanel.new( menu, controller )
	PanelAmmo:setLeftRight( false, false, -70, 70 )
	PanelAmmo:setTopBottom( false, false, -30, 35 )
	PanelAmmo:setRGB( 0, 0, 0 )
	PanelAmmo:setAlpha( 0 )
	self:addElement( PanelAmmo )
	self.PanelAmmo = PanelAmmo
	
	local Numbers = CoD.PrematchCountdown_NumbersInternal.new( menu, controller )
	Numbers:setLeftRight( false, false, -60, 60 )
	Numbers:setTopBottom( false, false, -30, 40 )
	Numbers:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Numbers:setShaderVector( 0, 0.2, 0, 0, 0 )
	Numbers:setShaderVector( 1, 7.72, 0, 0, 0 )
	Numbers:setShaderVector( 2, -50, -100, 0, 0 )
	Numbers:setShaderVector( 3, 6.89, 9.87, 0, 0 )
	Numbers:setShaderVector( 4, 0, 0.02, 0, 0 )
	Numbers.Numbers:setText( Engine.Localize( "XX" ) )
	self:addElement( Numbers )
	self.Numbers = Numbers
	
	local MatchText = CoD.PrematchCountdown_Title.new( menu, controller )
	MatchText:setLeftRight( false, false, -116, 116 )
	MatchText:setTopBottom( true, false, -41.21, -9 )
	MatchText.MatchText:setText( Engine.Localize( "MP_MATCH_STARTING_IN" ) )
	self:addElement( MatchText )
	self.MatchText = MatchText
	
	local Dot61 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot61:setLeftRight( true, false, 572, 576 )
	Dot61:setTopBottom( true, false, 79, 83 )
	Dot61:setZoom( 5 )
	self:addElement( Dot61 )
	self.Dot61 = Dot61
	
	local Dot600 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot600:setLeftRight( true, false, 705, 709 )
	Dot600:setTopBottom( true, false, 79, 83 )
	Dot600:setZoom( 5 )
	self:addElement( Dot600 )
	self.Dot600 = Dot600
	
	local Dot62 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot62:setLeftRight( true, false, 572, 576 )
	Dot62:setTopBottom( true, false, -58, -54 )
	Dot62:setZoom( 5 )
	self:addElement( Dot62 )
	self.Dot62 = Dot62
	
	local Dot601 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot601:setLeftRight( true, false, 705, 709 )
	Dot601:setTopBottom( true, false, -58, -54 )
	Dot601:setZoom( 5 )
	self:addElement( Dot601 )
	self.Dot601 = Dot601
	
	local LineTop = CoD.AmmoWidget_BackLine.new( menu, controller )
	LineTop:setLeftRight( false, false, -16, 16 )
	LineTop:setTopBottom( false, false, -109.86, -106.86 )
	LineTop:setZRot( -90 )
	self:addElement( LineTop )
	self.LineTop = LineTop
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 577, 705 )
	Image0:setTopBottom( true, false, -26.5, 101.5 )
	Image0:setRGB( 0.2, 0.23, 0.3 )
	Image0:setAlpha( 0.68 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 1 )
				self.clipFinished( GlowPanel, {} )
				LineBottom:completeAnimation()
				self.LineBottom:setLeftRight( false, false, -16, 16 )
				self.LineBottom:setTopBottom( false, false, 58.14, 61.14 )
				self.LineBottom:setAlpha( 1 )
				self.clipFinished( LineBottom, {} )
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -70, 70 )
				self.PanelAmmo:setTopBottom( false, false, -30, 35 )
				self.PanelAmmo:setAlpha( 0 )
				self.clipFinished( PanelAmmo, {} )
				Numbers:completeAnimation()
				self.Numbers:setLeftRight( false, false, -60, 60 )
				self.Numbers:setTopBottom( false, false, -30, 40 )
				self.Numbers:setAlpha( 1 )
				self.clipFinished( Numbers, {} )
				MatchText:completeAnimation()
				self.MatchText:setAlpha( 1 )
				self.clipFinished( MatchText, {} )
				Dot61:completeAnimation()
				self.Dot61:setLeftRight( true, false, 572, 576 )
				self.Dot61:setTopBottom( true, false, 79, 83 )
				self.Dot61:setAlpha( 1 )
				self.clipFinished( Dot61, {} )
				Dot600:completeAnimation()
				self.Dot600:setLeftRight( true, false, 705, 709 )
				self.Dot600:setTopBottom( true, false, 79, 83 )
				self.Dot600:setAlpha( 1 )
				self.clipFinished( Dot600, {} )
				Dot62:completeAnimation()
				self.Dot62:setLeftRight( true, false, 572, 576 )
				self.Dot62:setTopBottom( true, false, -58, -54 )
				self.Dot62:setAlpha( 1 )
				self.clipFinished( Dot62, {} )
				Dot601:completeAnimation()
				self.Dot601:setLeftRight( true, false, 705, 709 )
				self.Dot601:setTopBottom( true, false, -58, -54 )
				self.Dot601:setAlpha( 1 )
				self.clipFinished( Dot601, {} )
				LineTop:completeAnimation()
				self.LineTop:setLeftRight( false, false, -16, 16 )
				self.LineTop:setTopBottom( false, false, -109.86, -106.86 )
				self.LineTop:setAlpha( 1 )
				self.clipFinished( LineTop, {} )
			end,
			Start = function ()
				self:setupElementClipCounter( 11 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					if not event.interrupted then
						GlowPanel:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
					end
					GlowPanel:setAlpha( 0.63 )
					if event.interrupted then
						self.clipFinished( GlowPanel, event )
					else
						GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 0 )
				GlowPanelFrame2( GlowPanel, {} )
				local LineBottomFrame2 = function ( LineBottom, event )
					local LineBottomFrame3 = function ( LineBottom, event )
						local LineBottomFrame4 = function ( LineBottom, event )
							local LineBottomFrame5 = function ( LineBottom, event )
								local LineBottomFrame6 = function ( LineBottom, event )
									if not event.interrupted then
										LineBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									LineBottom:setLeftRight( false, false, -16, 16 )
									LineBottom:setTopBottom( false, false, 58.14, 61.14 )
									LineBottom:setAlpha( 1 )
									LineBottom:setZoom( 0 )
									if event.interrupted then
										self.clipFinished( LineBottom, event )
									else
										LineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LineBottomFrame6( LineBottom, event )
									return 
								else
									LineBottom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame6 )
								end
							end
							
							if event.interrupted then
								LineBottomFrame5( LineBottom, event )
								return 
							else
								LineBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineBottom:setAlpha( 0 )
								LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame5 )
							end
						end
						
						if event.interrupted then
							LineBottomFrame4( LineBottom, event )
							return 
						else
							LineBottom:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
							LineBottom:setTopBottom( false, false, 58.14, 61.14 )
							LineBottom:setAlpha( 0.76 )
							LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame4 )
						end
					end
					
					if event.interrupted then
						LineBottomFrame3( LineBottom, event )
						return 
					else
						LineBottom:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						LineBottom:setTopBottom( false, false, -81.86, -78.86 )
						LineBottom:setAlpha( 1 )
						LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame3 )
					end
				end
				
				LineBottom:completeAnimation()
				self.LineBottom:setLeftRight( false, false, -16, 16 )
				self.LineBottom:setTopBottom( false, false, -109.86, -106.86 )
				self.LineBottom:setAlpha( 0 )
				self.LineBottom:setZoom( 0 )
				LineBottomFrame2( LineBottom, {} )
				local PanelAmmoFrame2 = function ( PanelAmmo, event )
					local PanelAmmoFrame3 = function ( PanelAmmo, event )
						if not event.interrupted then
							PanelAmmo:beginAnimation( "keyframe", 110, false, true, CoD.TweenType.Linear )
						end
						PanelAmmo:setLeftRight( false, false, -70, 70 )
						PanelAmmo:setTopBottom( false, false, -30, 35 )
						PanelAmmo:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelAmmo, event )
						else
							PanelAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelAmmoFrame3( PanelAmmo, event )
						return 
					else
						PanelAmmo:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						PanelAmmo:registerEventHandler( "transition_complete_keyframe", PanelAmmoFrame3 )
					end
				end
				
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -70, 70 )
				self.PanelAmmo:setTopBottom( false, false, -30, -21 )
				self.PanelAmmo:setAlpha( 0 )
				PanelAmmoFrame2( PanelAmmo, {} )
				local NumbersFrame2 = function ( Numbers, event )
					local NumbersFrame3 = function ( Numbers, event )
						local NumbersFrame4 = function ( Numbers, event )
							local NumbersFrame5 = function ( Numbers, event )
								local NumbersFrame6 = function ( Numbers, event )
									local NumbersFrame7 = function ( Numbers, event )
										local NumbersFrame8 = function ( Numbers, event )
											local NumbersFrame9 = function ( Numbers, event )
												local NumbersFrame10 = function ( Numbers, event )
													if not event.interrupted then
														Numbers:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Numbers:setLeftRight( false, false, -60, 60 )
													Numbers:setTopBottom( false, false, -30, 40 )
													Numbers:setAlpha( 1 )
													if event.interrupted then
														self.clipFinished( Numbers, event )
													else
														Numbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													NumbersFrame10( Numbers, event )
													return 
												else
													Numbers:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame10 )
												end
											end
											
											if event.interrupted then
												NumbersFrame9( Numbers, event )
												return 
											else
												Numbers:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Numbers:setAlpha( 0.8 )
												Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame9 )
											end
										end
										
										if event.interrupted then
											NumbersFrame8( Numbers, event )
											return 
										else
											Numbers:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame8 )
										end
									end
									
									if event.interrupted then
										NumbersFrame7( Numbers, event )
										return 
									else
										Numbers:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Numbers:setAlpha( 1 )
										Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame7 )
									end
								end
								
								if event.interrupted then
									NumbersFrame6( Numbers, event )
									return 
								else
									Numbers:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame6 )
								end
							end
							
							if event.interrupted then
								NumbersFrame5( Numbers, event )
								return 
							else
								Numbers:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Numbers:setAlpha( 0.5 )
								Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame5 )
							end
						end
						
						if event.interrupted then
							NumbersFrame4( Numbers, event )
							return 
						else
							Numbers:beginAnimation( "keyframe", 89, false, true, CoD.TweenType.Linear )
							Numbers:setTopBottom( false, false, -30, 40 )
							Numbers:setAlpha( 1 )
							Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame4 )
						end
					end
					
					if event.interrupted then
						NumbersFrame3( Numbers, event )
						return 
					else
						Numbers:beginAnimation( "keyframe", 720, false, false, CoD.TweenType.Linear )
						Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame3 )
					end
				end
				
				Numbers:completeAnimation()
				self.Numbers:setLeftRight( false, false, -60, 60 )
				self.Numbers:setTopBottom( false, false, -30, -26 )
				self.Numbers:setAlpha( 0 )
				NumbersFrame2( Numbers, {} )
				local MatchTextFrame2 = function ( MatchText, event )
					local MatchTextFrame3 = function ( MatchText, event )
						local MatchTextFrame4 = function ( MatchText, event )
							local MatchTextFrame5 = function ( MatchText, event )
								local MatchTextFrame6 = function ( MatchText, event )
									local MatchTextFrame7 = function ( MatchText, event )
										local MatchTextFrame8 = function ( MatchText, event )
											local MatchTextFrame9 = function ( MatchText, event )
												local MatchTextFrame10 = function ( MatchText, event )
													local MatchTextFrame11 = function ( MatchText, event )
														if not event.interrupted then
															MatchText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														MatchText:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( MatchText, event )
														else
															MatchText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														MatchTextFrame11( MatchText, event )
														return 
													else
														MatchText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame11 )
													end
												end
												
												if event.interrupted then
													MatchTextFrame10( MatchText, event )
													return 
												else
													MatchText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													MatchText:setAlpha( 0.8 )
													MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame10 )
												end
											end
											
											if event.interrupted then
												MatchTextFrame9( MatchText, event )
												return 
											else
												MatchText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame9 )
											end
										end
										
										if event.interrupted then
											MatchTextFrame8( MatchText, event )
											return 
										else
											MatchText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											MatchText:setAlpha( 1 )
											MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame8 )
										end
									end
									
									if event.interrupted then
										MatchTextFrame7( MatchText, event )
										return 
									else
										MatchText:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame7 )
									end
								end
								
								if event.interrupted then
									MatchTextFrame6( MatchText, event )
									return 
								else
									MatchText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MatchText:setAlpha( 0.5 )
									MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame6 )
								end
							end
							
							if event.interrupted then
								MatchTextFrame5( MatchText, event )
								return 
							else
								MatchText:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame5 )
							end
						end
						
						if event.interrupted then
							MatchTextFrame4( MatchText, event )
							return 
						else
							MatchText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MatchText:setAlpha( 1 )
							MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame4 )
						end
					end
					
					if event.interrupted then
						MatchTextFrame3( MatchText, event )
						return 
					else
						MatchText:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame3 )
					end
				end
				
				MatchText:completeAnimation()
				self.MatchText:setAlpha( 0 )
				MatchTextFrame2( MatchText, {} )
				local Dot61Frame2 = function ( Dot61, event )
					local Dot61Frame3 = function ( Dot61, event )
						local Dot61Frame4 = function ( Dot61, event )
							local Dot61Frame5 = function ( Dot61, event )
								local Dot61Frame6 = function ( Dot61, event )
									local Dot61Frame7 = function ( Dot61, event )
										local Dot61Frame8 = function ( Dot61, event )
											local Dot61Frame9 = function ( Dot61, event )
												local Dot61Frame10 = function ( Dot61, event )
													local Dot61Frame11 = function ( Dot61, event )
														local Dot61Frame12 = function ( Dot61, event )
															if not event.interrupted then
																Dot61:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															Dot61:setLeftRight( true, false, 572, 576 )
															Dot61:setTopBottom( true, false, 79, 83 )
															Dot61:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( Dot61, event )
															else
																Dot61:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Dot61Frame12( Dot61, event )
															return 
														else
															Dot61:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame12 )
														end
													end
													
													if event.interrupted then
														Dot61Frame11( Dot61, event )
														return 
													else
														Dot61:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Dot61:setAlpha( 0 )
														Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame11 )
													end
												end
												
												if event.interrupted then
													Dot61Frame10( Dot61, event )
													return 
												else
													Dot61:beginAnimation( "keyframe", 169, true, true, CoD.TweenType.Linear )
													Dot61:setLeftRight( true, false, 572, 576 )
													Dot61:setTopBottom( true, false, 79, 83 )
													Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame10 )
												end
											end
											
											if event.interrupted then
												Dot61Frame9( Dot61, event )
												return 
											else
												Dot61:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame9 )
											end
										end
										
										if event.interrupted then
											Dot61Frame8( Dot61, event )
											return 
										else
											Dot61:beginAnimation( "keyframe", 159, true, true, CoD.TweenType.Linear )
											Dot61:setLeftRight( true, false, 576, 580 )
											Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame8 )
										end
									end
									
									if event.interrupted then
										Dot61Frame7( Dot61, event )
										return 
									else
										Dot61:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame7 )
									end
								end
								
								if event.interrupted then
									Dot61Frame6( Dot61, event )
									return 
								else
									Dot61:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Dot61:setAlpha( 1 )
									Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame6 )
								end
							end
							
							if event.interrupted then
								Dot61Frame5( Dot61, event )
								return 
							else
								Dot61:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								Dot61:setAlpha( 0.43 )
								Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame5 )
							end
						end
						
						if event.interrupted then
							Dot61Frame4( Dot61, event )
							return 
						else
							Dot61:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Dot61:setAlpha( 0.4 )
							Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame4 )
						end
					end
					
					if event.interrupted then
						Dot61Frame3( Dot61, event )
						return 
					else
						Dot61:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame3 )
					end
				end
				
				Dot61:completeAnimation()
				self.Dot61:setLeftRight( true, false, 638, 642 )
				self.Dot61:setTopBottom( true, false, -58, -54 )
				self.Dot61:setAlpha( 1 )
				Dot61Frame2( Dot61, {} )
				local Dot600Frame2 = function ( Dot600, event )
					local Dot600Frame3 = function ( Dot600, event )
						local Dot600Frame4 = function ( Dot600, event )
							local Dot600Frame5 = function ( Dot600, event )
								local Dot600Frame6 = function ( Dot600, event )
									local Dot600Frame7 = function ( Dot600, event )
										local Dot600Frame8 = function ( Dot600, event )
											local Dot600Frame9 = function ( Dot600, event )
												local Dot600Frame10 = function ( Dot600, event )
													local Dot600Frame11 = function ( Dot600, event )
														local Dot600Frame12 = function ( Dot600, event )
															if not event.interrupted then
																Dot600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															Dot600:setLeftRight( true, false, 705, 709 )
															Dot600:setTopBottom( true, false, 79, 83 )
															Dot600:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( Dot600, event )
															else
																Dot600:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Dot600Frame12( Dot600, event )
															return 
														else
															Dot600:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame12 )
														end
													end
													
													if event.interrupted then
														Dot600Frame11( Dot600, event )
														return 
													else
														Dot600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Dot600:setAlpha( 0 )
														Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame11 )
													end
												end
												
												if event.interrupted then
													Dot600Frame10( Dot600, event )
													return 
												else
													Dot600:beginAnimation( "keyframe", 169, true, true, CoD.TweenType.Linear )
													Dot600:setTopBottom( true, false, 79, 83 )
													Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame10 )
												end
											end
											
											if event.interrupted then
												Dot600Frame9( Dot600, event )
												return 
											else
												Dot600:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame9 )
											end
										end
										
										if event.interrupted then
											Dot600Frame8( Dot600, event )
											return 
										else
											Dot600:beginAnimation( "keyframe", 159, true, true, CoD.TweenType.Linear )
											Dot600:setLeftRight( true, false, 705, 709 )
											Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame8 )
										end
									end
									
									if event.interrupted then
										Dot600Frame7( Dot600, event )
										return 
									else
										Dot600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame7 )
									end
								end
								
								if event.interrupted then
									Dot600Frame6( Dot600, event )
									return 
								else
									Dot600:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Dot600:setAlpha( 1 )
									Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame6 )
								end
							end
							
							if event.interrupted then
								Dot600Frame5( Dot600, event )
								return 
							else
								Dot600:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								Dot600:setAlpha( 0.43 )
								Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame5 )
							end
						end
						
						if event.interrupted then
							Dot600Frame4( Dot600, event )
							return 
						else
							Dot600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Dot600:setAlpha( 0.4 )
							Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame4 )
						end
					end
					
					if event.interrupted then
						Dot600Frame3( Dot600, event )
						return 
					else
						Dot600:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame3 )
					end
				end
				
				Dot600:completeAnimation()
				self.Dot600:setLeftRight( true, false, 638, 642 )
				self.Dot600:setTopBottom( true, false, -58, -54 )
				self.Dot600:setAlpha( 1 )
				Dot600Frame2( Dot600, {} )
				local Dot62Frame2 = function ( Dot62, event )
					local Dot62Frame3 = function ( Dot62, event )
						local Dot62Frame4 = function ( Dot62, event )
							local Dot62Frame5 = function ( Dot62, event )
								local Dot62Frame6 = function ( Dot62, event )
									local Dot62Frame7 = function ( Dot62, event )
										local Dot62Frame8 = function ( Dot62, event )
											local Dot62Frame9 = function ( Dot62, event )
												local Dot62Frame10 = function ( Dot62, event )
													local Dot62Frame11 = function ( Dot62, event )
														local Dot62Frame12 = function ( Dot62, event )
															if not event.interrupted then
																Dot62:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															Dot62:setLeftRight( true, false, 572, 576 )
															Dot62:setTopBottom( true, false, -58, -54 )
															Dot62:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( Dot62, event )
															else
																Dot62:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Dot62Frame12( Dot62, event )
															return 
														else
															Dot62:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame12 )
														end
													end
													
													if event.interrupted then
														Dot62Frame11( Dot62, event )
														return 
													else
														Dot62:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Dot62:setAlpha( 0 )
														Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame11 )
													end
												end
												
												if event.interrupted then
													Dot62Frame10( Dot62, event )
													return 
												else
													Dot62:beginAnimation( "keyframe", 169, true, true, CoD.TweenType.Linear )
													Dot62:setLeftRight( true, false, 572, 576 )
													Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame10 )
												end
											end
											
											if event.interrupted then
												Dot62Frame9( Dot62, event )
												return 
											else
												Dot62:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
												Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame9 )
											end
										end
										
										if event.interrupted then
											Dot62Frame8( Dot62, event )
											return 
										else
											Dot62:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
											Dot62:setLeftRight( true, false, 576, 580 )
											Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame8 )
										end
									end
									
									if event.interrupted then
										Dot62Frame7( Dot62, event )
										return 
									else
										Dot62:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame7 )
									end
								end
								
								if event.interrupted then
									Dot62Frame6( Dot62, event )
									return 
								else
									Dot62:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Dot62:setAlpha( 1 )
									Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame6 )
								end
							end
							
							if event.interrupted then
								Dot62Frame5( Dot62, event )
								return 
							else
								Dot62:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								Dot62:setAlpha( 0.43 )
								Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame5 )
							end
						end
						
						if event.interrupted then
							Dot62Frame4( Dot62, event )
							return 
						else
							Dot62:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Dot62:setAlpha( 0.4 )
							Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame4 )
						end
					end
					
					if event.interrupted then
						Dot62Frame3( Dot62, event )
						return 
					else
						Dot62:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame3 )
					end
				end
				
				Dot62:completeAnimation()
				self.Dot62:setLeftRight( true, false, 638, 642 )
				self.Dot62:setTopBottom( true, false, -58, -54 )
				self.Dot62:setAlpha( 1 )
				Dot62Frame2( Dot62, {} )
				local Dot601Frame2 = function ( Dot601, event )
					local Dot601Frame3 = function ( Dot601, event )
						local Dot601Frame4 = function ( Dot601, event )
							local Dot601Frame5 = function ( Dot601, event )
								local Dot601Frame6 = function ( Dot601, event )
									local Dot601Frame7 = function ( Dot601, event )
										local Dot601Frame8 = function ( Dot601, event )
											local Dot601Frame9 = function ( Dot601, event )
												local Dot601Frame10 = function ( Dot601, event )
													local Dot601Frame11 = function ( Dot601, event )
														local Dot601Frame12 = function ( Dot601, event )
															if not event.interrupted then
																Dot601:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															Dot601:setLeftRight( true, false, 705, 709 )
															Dot601:setTopBottom( true, false, -58, -54 )
															Dot601:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( Dot601, event )
															else
																Dot601:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Dot601Frame12( Dot601, event )
															return 
														else
															Dot601:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame12 )
														end
													end
													
													if event.interrupted then
														Dot601Frame11( Dot601, event )
														return 
													else
														Dot601:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Dot601:setAlpha( 0 )
														Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame11 )
													end
												end
												
												if event.interrupted then
													Dot601Frame10( Dot601, event )
													return 
												else
													Dot601:beginAnimation( "keyframe", 169, true, true, CoD.TweenType.Linear )
													Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame10 )
												end
											end
											
											if event.interrupted then
												Dot601Frame9( Dot601, event )
												return 
											else
												Dot601:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame9 )
											end
										end
										
										if event.interrupted then
											Dot601Frame8( Dot601, event )
											return 
										else
											Dot601:beginAnimation( "keyframe", 159, true, true, CoD.TweenType.Linear )
											Dot601:setLeftRight( true, false, 705, 709 )
											Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame8 )
										end
									end
									
									if event.interrupted then
										Dot601Frame7( Dot601, event )
										return 
									else
										Dot601:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame7 )
									end
								end
								
								if event.interrupted then
									Dot601Frame6( Dot601, event )
									return 
								else
									Dot601:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Dot601:setAlpha( 1 )
									Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame6 )
								end
							end
							
							if event.interrupted then
								Dot601Frame5( Dot601, event )
								return 
							else
								Dot601:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								Dot601:setAlpha( 0.43 )
								Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame5 )
							end
						end
						
						if event.interrupted then
							Dot601Frame4( Dot601, event )
							return 
						else
							Dot601:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Dot601:setAlpha( 0.4 )
							Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame4 )
						end
					end
					
					if event.interrupted then
						Dot601Frame3( Dot601, event )
						return 
					else
						Dot601:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame3 )
					end
				end
				
				Dot601:completeAnimation()
				self.Dot601:setLeftRight( true, false, 638, 642 )
				self.Dot601:setTopBottom( true, false, -58, -54 )
				self.Dot601:setAlpha( 1 )
				Dot601Frame2( Dot601, {} )
				local LineTopFrame2 = function ( LineTop, event )
					local LineTopFrame3 = function ( LineTop, event )
						local LineTopFrame4 = function ( LineTop, event )
							if not event.interrupted then
								LineTop:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
							end
							LineTop:setLeftRight( false, false, -16, 16 )
							LineTop:setTopBottom( false, false, -109.86, -106.86 )
							LineTop:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( LineTop, event )
							else
								LineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LineTopFrame4( LineTop, event )
							return 
						else
							LineTop:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
							LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame4 )
						end
					end
					
					if event.interrupted then
						LineTopFrame3( LineTop, event )
						return 
					else
						LineTop:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						LineTop:setAlpha( 1 )
						LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame3 )
					end
				end
				
				LineTop:completeAnimation()
				self.LineTop:setLeftRight( false, false, -16, 16 )
				self.LineTop:setTopBottom( false, false, -109.86, -106.86 )
				self.LineTop:setAlpha( 0 )
				LineTopFrame2( LineTop, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						end
						Image0:setAlpha( 0.68 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
			end,
			Stop = function ()
				self:setupElementClipCounter( 11 )
				local GlowPanelFrame2 = function ( GlowPanel, event )
					if not event.interrupted then
						GlowPanel:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
					end
					GlowPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowPanel, event )
					else
						GlowPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowPanel:completeAnimation()
				self.GlowPanel:setAlpha( 1 )
				GlowPanelFrame2( GlowPanel, {} )
				local LineBottomFrame2 = function ( LineBottom, event )
					local LineBottomFrame3 = function ( LineBottom, event )
						local LineBottomFrame4 = function ( LineBottom, event )
							local LineBottomFrame5 = function ( LineBottom, event )
								local LineBottomFrame6 = function ( LineBottom, event )
									local LineBottomFrame7 = function ( LineBottom, event )
										local LineBottomFrame8 = function ( LineBottom, event )
											local LineBottomFrame9 = function ( LineBottom, event )
												local LineBottomFrame10 = function ( LineBottom, event )
													local LineBottomFrame11 = function ( LineBottom, event )
														if not event.interrupted then
															LineBottom:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
														end
														LineBottom:setLeftRight( false, false, -16, 16 )
														LineBottom:setTopBottom( false, false, -19.86, -16.86 )
														LineBottom:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( LineBottom, event )
														else
															LineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														LineBottomFrame11( LineBottom, event )
														return 
													else
														LineBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														LineBottom:setAlpha( 0.4 )
														LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame11 )
													end
												end
												
												if event.interrupted then
													LineBottomFrame10( LineBottom, event )
													return 
												else
													LineBottom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame10 )
												end
											end
											
											if event.interrupted then
												LineBottomFrame9( LineBottom, event )
												return 
											else
												LineBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												LineBottom:setAlpha( 0 )
												LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame9 )
											end
										end
										
										if event.interrupted then
											LineBottomFrame8( LineBottom, event )
											return 
										else
											LineBottom:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame8 )
										end
									end
									
									if event.interrupted then
										LineBottomFrame7( LineBottom, event )
										return 
									else
										LineBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										LineBottom:setAlpha( 0.8 )
										LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame7 )
									end
								end
								
								if event.interrupted then
									LineBottomFrame6( LineBottom, event )
									return 
								else
									LineBottom:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame6 )
								end
							end
							
							if event.interrupted then
								LineBottomFrame5( LineBottom, event )
								return 
							else
								LineBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineBottom:setAlpha( 0 )
								LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame5 )
							end
						end
						
						if event.interrupted then
							LineBottomFrame4( LineBottom, event )
							return 
						else
							LineBottom:beginAnimation( "keyframe", 120, true, true, CoD.TweenType.Linear )
							LineBottom:setTopBottom( false, false, -19.86, -16.86 )
							LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame4 )
						end
					end
					
					if event.interrupted then
						LineBottomFrame3( LineBottom, event )
						return 
					else
						LineBottom:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame3 )
					end
				end
				
				LineBottom:completeAnimation()
				self.LineBottom:setLeftRight( false, false, -16, 16 )
				self.LineBottom:setTopBottom( false, false, 58.14, 61.14 )
				self.LineBottom:setAlpha( 1 )
				LineBottomFrame2( LineBottom, {} )
				local PanelAmmoFrame2 = function ( PanelAmmo, event )
					local PanelAmmoFrame3 = function ( PanelAmmo, event )
						if not event.interrupted then
							PanelAmmo:beginAnimation( "keyframe", 129, true, false, CoD.TweenType.Linear )
						end
						PanelAmmo:setLeftRight( false, false, -70, 70 )
						PanelAmmo:setTopBottom( false, false, -30, -28 )
						PanelAmmo:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( PanelAmmo, event )
						else
							PanelAmmo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						PanelAmmoFrame3( PanelAmmo, event )
						return 
					else
						PanelAmmo:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						PanelAmmo:registerEventHandler( "transition_complete_keyframe", PanelAmmoFrame3 )
					end
				end
				
				PanelAmmo:completeAnimation()
				self.PanelAmmo:setLeftRight( false, false, -70, 70 )
				self.PanelAmmo:setTopBottom( false, false, -30, 35 )
				self.PanelAmmo:setAlpha( 0 )
				PanelAmmoFrame2( PanelAmmo, {} )
				local NumbersFrame2 = function ( Numbers, event )
					local NumbersFrame3 = function ( Numbers, event )
						local NumbersFrame4 = function ( Numbers, event )
							local NumbersFrame5 = function ( Numbers, event )
								local NumbersFrame6 = function ( Numbers, event )
									local NumbersFrame7 = function ( Numbers, event )
										local NumbersFrame8 = function ( Numbers, event )
											local NumbersFrame9 = function ( Numbers, event )
												local NumbersFrame10 = function ( Numbers, event )
													if not event.interrupted then
														Numbers:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
													end
													Numbers:setLeftRight( false, false, -60, 60 )
													Numbers:setTopBottom( false, false, -30, 40 )
													Numbers:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Numbers, event )
													else
														Numbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													NumbersFrame10( Numbers, event )
													return 
												else
													Numbers:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Numbers:setAlpha( 0.4 )
													Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame10 )
												end
											end
											
											if event.interrupted then
												NumbersFrame9( Numbers, event )
												return 
											else
												Numbers:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame9 )
											end
										end
										
										if event.interrupted then
											NumbersFrame8( Numbers, event )
											return 
										else
											Numbers:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											Numbers:setAlpha( 0 )
											Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame8 )
										end
									end
									
									if event.interrupted then
										NumbersFrame7( Numbers, event )
										return 
									else
										Numbers:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame7 )
									end
								end
								
								if event.interrupted then
									NumbersFrame6( Numbers, event )
									return 
								else
									Numbers:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Numbers:setAlpha( 0.78 )
									Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame6 )
								end
							end
							
							if event.interrupted then
								NumbersFrame5( Numbers, event )
								return 
							else
								Numbers:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame5 )
							end
						end
						
						if event.interrupted then
							NumbersFrame4( Numbers, event )
							return 
						else
							Numbers:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Numbers:setAlpha( 0 )
							Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame4 )
						end
					end
					
					if event.interrupted then
						NumbersFrame3( Numbers, event )
						return 
					else
						Numbers:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						Numbers:registerEventHandler( "transition_complete_keyframe", NumbersFrame3 )
					end
				end
				
				Numbers:completeAnimation()
				self.Numbers:setLeftRight( false, false, -60, 60 )
				self.Numbers:setTopBottom( false, false, -30, 40 )
				self.Numbers:setAlpha( 1 )
				NumbersFrame2( Numbers, {} )
				local MatchTextFrame2 = function ( MatchText, event )
					local MatchTextFrame3 = function ( MatchText, event )
						local MatchTextFrame4 = function ( MatchText, event )
							local MatchTextFrame5 = function ( MatchText, event )
								local MatchTextFrame6 = function ( MatchText, event )
									local MatchTextFrame7 = function ( MatchText, event )
										local MatchTextFrame8 = function ( MatchText, event )
											local MatchTextFrame9 = function ( MatchText, event )
												local MatchTextFrame10 = function ( MatchText, event )
													if not event.interrupted then
														MatchText:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													end
													MatchText:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( MatchText, event )
													else
														MatchText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													MatchTextFrame10( MatchText, event )
													return 
												else
													MatchText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													MatchText:setAlpha( 0.4 )
													MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame10 )
												end
											end
											
											if event.interrupted then
												MatchTextFrame9( MatchText, event )
												return 
											else
												MatchText:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame9 )
											end
										end
										
										if event.interrupted then
											MatchTextFrame8( MatchText, event )
											return 
										else
											MatchText:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											MatchText:setAlpha( 0 )
											MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame8 )
										end
									end
									
									if event.interrupted then
										MatchTextFrame7( MatchText, event )
										return 
									else
										MatchText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame7 )
									end
								end
								
								if event.interrupted then
									MatchTextFrame6( MatchText, event )
									return 
								else
									MatchText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									MatchText:setAlpha( 0.8 )
									MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame6 )
								end
							end
							
							if event.interrupted then
								MatchTextFrame5( MatchText, event )
								return 
							else
								MatchText:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame5 )
							end
						end
						
						if event.interrupted then
							MatchTextFrame4( MatchText, event )
							return 
						else
							MatchText:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							MatchText:setAlpha( 0 )
							MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame4 )
						end
					end
					
					if event.interrupted then
						MatchTextFrame3( MatchText, event )
						return 
					else
						MatchText:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						MatchText:registerEventHandler( "transition_complete_keyframe", MatchTextFrame3 )
					end
				end
				
				MatchText:completeAnimation()
				self.MatchText:setAlpha( 1 )
				MatchTextFrame2( MatchText, {} )
				local Dot61Frame2 = function ( Dot61, event )
					local Dot61Frame3 = function ( Dot61, event )
						local Dot61Frame4 = function ( Dot61, event )
							local Dot61Frame5 = function ( Dot61, event )
								local Dot61Frame6 = function ( Dot61, event )
									local Dot61Frame7 = function ( Dot61, event )
										local Dot61Frame8 = function ( Dot61, event )
											local Dot61Frame9 = function ( Dot61, event )
												local Dot61Frame10 = function ( Dot61, event )
													local Dot61Frame11 = function ( Dot61, event )
														local Dot61Frame12 = function ( Dot61, event )
															local Dot61Frame13 = function ( Dot61, event )
																if not event.interrupted then
																	Dot61:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																end
																Dot61:setLeftRight( true, false, 640, 644 )
																Dot61:setTopBottom( true, false, 16, 20 )
																Dot61:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( Dot61, event )
																else
																	Dot61:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																Dot61Frame13( Dot61, event )
																return 
															else
																Dot61:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																Dot61:setAlpha( 0.4 )
																Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame13 )
															end
														end
														
														if event.interrupted then
															Dot61Frame12( Dot61, event )
															return 
														else
															Dot61:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
															Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame12 )
														end
													end
													
													if event.interrupted then
														Dot61Frame11( Dot61, event )
														return 
													else
														Dot61:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Dot61:setAlpha( 0 )
														Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame11 )
													end
												end
												
												if event.interrupted then
													Dot61Frame10( Dot61, event )
													return 
												else
													Dot61:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame10 )
												end
											end
											
											if event.interrupted then
												Dot61Frame9( Dot61, event )
												return 
											else
												Dot61:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Dot61:setAlpha( 0.8 )
												Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame9 )
											end
										end
										
										if event.interrupted then
											Dot61Frame8( Dot61, event )
											return 
										else
											Dot61:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame8 )
										end
									end
									
									if event.interrupted then
										Dot61Frame7( Dot61, event )
										return 
									else
										Dot61:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Dot61:setAlpha( 0 )
										Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame7 )
									end
								end
								
								if event.interrupted then
									Dot61Frame6( Dot61, event )
									return 
								else
									Dot61:beginAnimation( "keyframe", 90, true, true, CoD.TweenType.Linear )
									Dot61:setLeftRight( true, false, 640, 644 )
									Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame6 )
								end
							end
							
							if event.interrupted then
								Dot61Frame5( Dot61, event )
								return 
							else
								Dot61:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame5 )
							end
						end
						
						if event.interrupted then
							Dot61Frame4( Dot61, event )
							return 
						else
							Dot61:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
							Dot61:setLeftRight( true, false, 576, 580 )
							Dot61:setTopBottom( true, false, 16, 20 )
							Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame4 )
						end
					end
					
					if event.interrupted then
						Dot61Frame3( Dot61, event )
						return 
					else
						Dot61:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Dot61:registerEventHandler( "transition_complete_keyframe", Dot61Frame3 )
					end
				end
				
				Dot61:completeAnimation()
				self.Dot61:setLeftRight( true, false, 572, 576 )
				self.Dot61:setTopBottom( true, false, 79, 83 )
				self.Dot61:setAlpha( 1 )
				Dot61Frame2( Dot61, {} )
				local Dot600Frame2 = function ( Dot600, event )
					local Dot600Frame3 = function ( Dot600, event )
						local Dot600Frame4 = function ( Dot600, event )
							local Dot600Frame5 = function ( Dot600, event )
								local Dot600Frame6 = function ( Dot600, event )
									local Dot600Frame7 = function ( Dot600, event )
										local Dot600Frame8 = function ( Dot600, event )
											local Dot600Frame9 = function ( Dot600, event )
												local Dot600Frame10 = function ( Dot600, event )
													local Dot600Frame11 = function ( Dot600, event )
														local Dot600Frame12 = function ( Dot600, event )
															local Dot600Frame13 = function ( Dot600, event )
																if not event.interrupted then
																	Dot600:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																end
																Dot600:setLeftRight( true, false, 640, 644 )
																Dot600:setTopBottom( true, false, 16, 20 )
																Dot600:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( Dot600, event )
																else
																	Dot600:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																Dot600Frame13( Dot600, event )
																return 
															else
																Dot600:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																Dot600:setAlpha( 0.4 )
																Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame13 )
															end
														end
														
														if event.interrupted then
															Dot600Frame12( Dot600, event )
															return 
														else
															Dot600:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
															Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame12 )
														end
													end
													
													if event.interrupted then
														Dot600Frame11( Dot600, event )
														return 
													else
														Dot600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Dot600:setAlpha( 0 )
														Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame11 )
													end
												end
												
												if event.interrupted then
													Dot600Frame10( Dot600, event )
													return 
												else
													Dot600:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame10 )
												end
											end
											
											if event.interrupted then
												Dot600Frame9( Dot600, event )
												return 
											else
												Dot600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Dot600:setAlpha( 0.8 )
												Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame9 )
											end
										end
										
										if event.interrupted then
											Dot600Frame8( Dot600, event )
											return 
										else
											Dot600:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame8 )
										end
									end
									
									if event.interrupted then
										Dot600Frame7( Dot600, event )
										return 
									else
										Dot600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Dot600:setAlpha( 0 )
										Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame7 )
									end
								end
								
								if event.interrupted then
									Dot600Frame6( Dot600, event )
									return 
								else
									Dot600:beginAnimation( "keyframe", 90, true, true, CoD.TweenType.Linear )
									Dot600:setLeftRight( true, false, 640, 644 )
									Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame6 )
								end
							end
							
							if event.interrupted then
								Dot600Frame5( Dot600, event )
								return 
							else
								Dot600:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame5 )
							end
						end
						
						if event.interrupted then
							Dot600Frame4( Dot600, event )
							return 
						else
							Dot600:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
							Dot600:setTopBottom( true, false, 16, 20 )
							Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame4 )
						end
					end
					
					if event.interrupted then
						Dot600Frame3( Dot600, event )
						return 
					else
						Dot600:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Dot600:registerEventHandler( "transition_complete_keyframe", Dot600Frame3 )
					end
				end
				
				Dot600:completeAnimation()
				self.Dot600:setLeftRight( true, false, 705, 709 )
				self.Dot600:setTopBottom( true, false, 79, 83 )
				self.Dot600:setAlpha( 1 )
				Dot600Frame2( Dot600, {} )
				local Dot62Frame2 = function ( Dot62, event )
					local Dot62Frame3 = function ( Dot62, event )
						local Dot62Frame4 = function ( Dot62, event )
							local Dot62Frame5 = function ( Dot62, event )
								local Dot62Frame6 = function ( Dot62, event )
									local Dot62Frame7 = function ( Dot62, event )
										local Dot62Frame8 = function ( Dot62, event )
											local Dot62Frame9 = function ( Dot62, event )
												local Dot62Frame10 = function ( Dot62, event )
													local Dot62Frame11 = function ( Dot62, event )
														local Dot62Frame12 = function ( Dot62, event )
															local Dot62Frame13 = function ( Dot62, event )
																if not event.interrupted then
																	Dot62:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																end
																Dot62:setLeftRight( true, false, 639, 643 )
																Dot62:setTopBottom( true, false, 16, 20 )
																Dot62:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( Dot62, event )
																else
																	Dot62:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																Dot62Frame13( Dot62, event )
																return 
															else
																Dot62:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																Dot62:setAlpha( 0.4 )
																Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame13 )
															end
														end
														
														if event.interrupted then
															Dot62Frame12( Dot62, event )
															return 
														else
															Dot62:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
															Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame12 )
														end
													end
													
													if event.interrupted then
														Dot62Frame11( Dot62, event )
														return 
													else
														Dot62:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Dot62:setAlpha( 0 )
														Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame11 )
													end
												end
												
												if event.interrupted then
													Dot62Frame10( Dot62, event )
													return 
												else
													Dot62:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame10 )
												end
											end
											
											if event.interrupted then
												Dot62Frame9( Dot62, event )
												return 
											else
												Dot62:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Dot62:setAlpha( 0.8 )
												Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame9 )
											end
										end
										
										if event.interrupted then
											Dot62Frame8( Dot62, event )
											return 
										else
											Dot62:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame8 )
										end
									end
									
									if event.interrupted then
										Dot62Frame7( Dot62, event )
										return 
									else
										Dot62:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Dot62:setAlpha( 0 )
										Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame7 )
									end
								end
								
								if event.interrupted then
									Dot62Frame6( Dot62, event )
									return 
								else
									Dot62:beginAnimation( "keyframe", 90, true, true, CoD.TweenType.Linear )
									Dot62:setLeftRight( true, false, 639, 643 )
									Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame6 )
								end
							end
							
							if event.interrupted then
								Dot62Frame5( Dot62, event )
								return 
							else
								Dot62:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame5 )
							end
						end
						
						if event.interrupted then
							Dot62Frame4( Dot62, event )
							return 
						else
							Dot62:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
							Dot62:setLeftRight( true, false, 576, 580 )
							Dot62:setTopBottom( true, false, 16, 20 )
							Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame4 )
						end
					end
					
					if event.interrupted then
						Dot62Frame3( Dot62, event )
						return 
					else
						Dot62:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Dot62:registerEventHandler( "transition_complete_keyframe", Dot62Frame3 )
					end
				end
				
				Dot62:completeAnimation()
				self.Dot62:setLeftRight( true, false, 572, 576 )
				self.Dot62:setTopBottom( true, false, -58, -54 )
				self.Dot62:setAlpha( 1 )
				Dot62Frame2( Dot62, {} )
				local Dot601Frame2 = function ( Dot601, event )
					local Dot601Frame3 = function ( Dot601, event )
						local Dot601Frame4 = function ( Dot601, event )
							local Dot601Frame5 = function ( Dot601, event )
								local Dot601Frame6 = function ( Dot601, event )
									local Dot601Frame7 = function ( Dot601, event )
										local Dot601Frame8 = function ( Dot601, event )
											local Dot601Frame9 = function ( Dot601, event )
												local Dot601Frame10 = function ( Dot601, event )
													local Dot601Frame11 = function ( Dot601, event )
														local Dot601Frame12 = function ( Dot601, event )
															local Dot601Frame13 = function ( Dot601, event )
																if not event.interrupted then
																	Dot601:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
																end
																Dot601:setLeftRight( true, false, 640, 644 )
																Dot601:setTopBottom( true, false, 16, 20 )
																Dot601:setAlpha( 0 )
																if event.interrupted then
																	self.clipFinished( Dot601, event )
																else
																	Dot601:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																Dot601Frame13( Dot601, event )
																return 
															else
																Dot601:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																Dot601:setAlpha( 0.4 )
																Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame13 )
															end
														end
														
														if event.interrupted then
															Dot601Frame12( Dot601, event )
															return 
														else
															Dot601:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
															Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame12 )
														end
													end
													
													if event.interrupted then
														Dot601Frame11( Dot601, event )
														return 
													else
														Dot601:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														Dot601:setAlpha( 0 )
														Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame11 )
													end
												end
												
												if event.interrupted then
													Dot601Frame10( Dot601, event )
													return 
												else
													Dot601:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame10 )
												end
											end
											
											if event.interrupted then
												Dot601Frame9( Dot601, event )
												return 
											else
												Dot601:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Dot601:setAlpha( 0.8 )
												Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame9 )
											end
										end
										
										if event.interrupted then
											Dot601Frame8( Dot601, event )
											return 
										else
											Dot601:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame8 )
										end
									end
									
									if event.interrupted then
										Dot601Frame7( Dot601, event )
										return 
									else
										Dot601:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Dot601:setAlpha( 0 )
										Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame7 )
									end
								end
								
								if event.interrupted then
									Dot601Frame6( Dot601, event )
									return 
								else
									Dot601:beginAnimation( "keyframe", 90, true, true, CoD.TweenType.Linear )
									Dot601:setLeftRight( true, false, 640, 644 )
									Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame6 )
								end
							end
							
							if event.interrupted then
								Dot601Frame5( Dot601, event )
								return 
							else
								Dot601:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame5 )
							end
						end
						
						if event.interrupted then
							Dot601Frame4( Dot601, event )
							return 
						else
							Dot601:beginAnimation( "keyframe", 109, true, true, CoD.TweenType.Linear )
							Dot601:setTopBottom( true, false, 16, 20 )
							Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame4 )
						end
					end
					
					if event.interrupted then
						Dot601Frame3( Dot601, event )
						return 
					else
						Dot601:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Dot601:registerEventHandler( "transition_complete_keyframe", Dot601Frame3 )
					end
				end
				
				Dot601:completeAnimation()
				self.Dot601:setLeftRight( true, false, 705, 709 )
				self.Dot601:setTopBottom( true, false, -58, -54 )
				self.Dot601:setAlpha( 1 )
				Dot601Frame2( Dot601, {} )
				local LineTopFrame2 = function ( LineTop, event )
					local LineTopFrame3 = function ( LineTop, event )
						local LineTopFrame4 = function ( LineTop, event )
							local LineTopFrame5 = function ( LineTop, event )
								local LineTopFrame6 = function ( LineTop, event )
									local LineTopFrame7 = function ( LineTop, event )
										local LineTopFrame8 = function ( LineTop, event )
											local LineTopFrame9 = function ( LineTop, event )
												local LineTopFrame10 = function ( LineTop, event )
													local LineTopFrame11 = function ( LineTop, event )
														if not event.interrupted then
															LineTop:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
														end
														LineTop:setLeftRight( false, false, -16, 16 )
														LineTop:setTopBottom( false, false, -17.86, -14.86 )
														LineTop:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( LineTop, event )
														else
															LineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														LineTopFrame11( LineTop, event )
														return 
													else
														LineTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														LineTop:setAlpha( 0.4 )
														LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame11 )
													end
												end
												
												if event.interrupted then
													LineTopFrame10( LineTop, event )
													return 
												else
													LineTop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame10 )
												end
											end
											
											if event.interrupted then
												LineTopFrame9( LineTop, event )
												return 
											else
												LineTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												LineTop:setAlpha( 0 )
												LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame9 )
											end
										end
										
										if event.interrupted then
											LineTopFrame8( LineTop, event )
											return 
										else
											LineTop:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame8 )
										end
									end
									
									if event.interrupted then
										LineTopFrame7( LineTop, event )
										return 
									else
										LineTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										LineTop:setAlpha( 0.8 )
										LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame7 )
									end
								end
								
								if event.interrupted then
									LineTopFrame6( LineTop, event )
									return 
								else
									LineTop:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame6 )
								end
							end
							
							if event.interrupted then
								LineTopFrame5( LineTop, event )
								return 
							else
								LineTop:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								LineTop:setAlpha( 0 )
								LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame5 )
							end
						end
						
						if event.interrupted then
							LineTopFrame4( LineTop, event )
							return 
						else
							LineTop:beginAnimation( "keyframe", 120, true, true, CoD.TweenType.Linear )
							LineTop:setTopBottom( false, false, -17.86, -14.86 )
							LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame4 )
						end
					end
					
					if event.interrupted then
						LineTopFrame3( LineTop, event )
						return 
					else
						LineTop:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame3 )
					end
				end
				
				LineTop:completeAnimation()
				self.LineTop:setLeftRight( false, false, -16, 16 )
				self.LineTop:setTopBottom( false, false, -109.86, -106.86 )
				self.LineTop:setAlpha( 1 )
				LineTopFrame2( LineTop, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0.68 )
				Image0Frame2( Image0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GlowPanel:close()
		element.LineBottom:close()
		element.PanelAmmo:close()
		element.Numbers:close()
		element.MatchText:close()
		element.Dot61:close()
		element.Dot600:close()
		element.Dot62:close()
		element.Dot601:close()
		element.LineTop:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

