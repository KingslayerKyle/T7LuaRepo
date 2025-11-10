require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_MeterPanel" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_NumberMove" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_MeterInternal" )

CoD.ScrStk_Meter = InheritFrom( LUI.UIElement )
CoD.ScrStk_Meter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_Meter )
	self.id = "ScrStk_Meter"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 130 )
	self.anyChildUsesUpdateState = true
	
	local ScrStkMeterPanel0 = CoD.ScrStk_MeterPanel.new( menu, controller )
	ScrStkMeterPanel0:setLeftRight( true, false, 31, 39 )
	ScrStkMeterPanel0:setTopBottom( true, false, 10, 129 )
	self:addElement( ScrStkMeterPanel0 )
	self.ScrStkMeterPanel0 = ScrStkMeterPanel0
	
	local ScrStkNumberMove0 = CoD.ScrStk_NumberMove.new( menu, controller )
	ScrStkNumberMove0:setLeftRight( true, false, -10, 45 )
	ScrStkNumberMove0:setTopBottom( true, false, 10, 31.5 )
	self:addElement( ScrStkNumberMove0 )
	self.ScrStkNumberMove0 = ScrStkNumberMove0
	
	local Meter = CoD.ScrStk_MeterInternal.new( menu, controller )
	Meter:setLeftRight( true, false, -24, 96 )
	Meter:setTopBottom( true, false, 10, 130 )
	Meter:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Meter.Back:setRGB( 1, 0.91, 0.31 )
	Meter.Fill:setRGB( 1, 0.91, 0.31 )
	self:addElement( Meter )
	self.Meter = Meter
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 26.5, 39.5 )
	Image00:setTopBottom( true, false, 6.5, 19.5 )
	Image00:setAlpha( 0 )
	Image00:setZRot( 84 )
	Image00:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdeplete" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 26.5, 39.5 )
	Image0:setTopBottom( true, false, 6.5, 19.5 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringdeplete" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 28.5, 41.5 )
	Glow:setTopBottom( true, false, -63.05, 193.05 )
	Glow:setRGB( 0, 0.6, 1 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, false, -8.46, 76.46 )
	Glow2:setTopBottom( true, false, -39.15, 169.15 )
	Glow2:setRGB( 0.16, 0, 1 )
	Glow2:setAlpha( 0 )
	Glow2:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local Glow20 = LUI.UIImage.new()
	Glow20:setLeftRight( true, false, 5, 67 )
	Glow20:setTopBottom( true, false, -18.5, 48.67 )
	Glow20:setRGB( 0, 0.3, 1 )
	Glow20:setAlpha( 0 )
	Glow20:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow20 )
	self.Glow20 = Glow20
	
	local Glow200 = LUI.UIImage.new()
	Glow200:setLeftRight( true, false, -71.3, 141.31 )
	Glow200:setTopBottom( true, false, 7.85, 20.98 )
	Glow200:setRGB( 1, 0, 0 )
	Glow200:setAlpha( 0 )
	Glow200:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Glow200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow200 )
	self.Glow200 = Glow200
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ScrStkNumberMove0:completeAnimation()
				ScrStkNumberMove0.TextBox:completeAnimation()
				self.ScrStkNumberMove0.TextBox:setRGB( 1, 1, 1 )
				self.clipFinished( ScrStkNumberMove0, {} )
				Meter:completeAnimation()
				Meter.Back:completeAnimation()
				Meter.Fill:completeAnimation()
				self.Meter:setAlpha( 1 )
				self.Meter.Back:setRGB( 0.51, 0.55, 0.64 )
				self.Meter.Fill:setRGB( 0.51, 0.55, 0.64 )
				self.clipFinished( Meter, {} )
				Image00:completeAnimation()
				self.Image00:setAlpha( 0 )
				self.clipFinished( Image00, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				Glow20:completeAnimation()
				self.Glow20:setAlpha( 0 )
				self.clipFinished( Glow20, {} )
			end
		},
		ReadyCombat = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				ScrStkNumberMove0:completeAnimation()
				ScrStkNumberMove0.TextBox:completeAnimation()
				self.ScrStkNumberMove0.TextBox:setRGB( 0.58, 0.89, 1 )
				self.clipFinished( ScrStkNumberMove0, {} )
				local MeterFrame2 = function ( Meter, event )
					local MeterFrame3 = function ( Meter, event )
						local MeterFrame4 = function ( Meter, event )
							local MeterFrame5 = function ( Meter, event )
								local MeterFrame6 = function ( Meter, event )
									if not event.interrupted then
										Meter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										Meter.Back:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
										Meter.Fill:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
									end
									Meter:setAlpha( 1 )
									Meter.Back:setRGB( 0.85, 0.69, 0 )
									Meter.Fill:setRGB( 0.85, 0.69, 0 )
									if event.interrupted then
										self.clipFinished( Meter, event )
									else
										Meter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MeterFrame6( Meter, event )
									return 
								else
									Meter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									Meter.Back:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
									Meter.Fill:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
									Meter.Back:setRGB( 1, 0.91, 0.31 )
									Meter.Fill:setRGB( 1, 0.91, 0.31 )
									Meter:registerEventHandler( "transition_complete_keyframe", MeterFrame6 )
								end
							end
							
							if event.interrupted then
								MeterFrame5( Meter, event )
								return 
							else
								Meter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								Meter.Back:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
								Meter.Fill:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
								Meter.Back:setRGB( 0.85, 0.69, 0 )
								Meter.Fill:setRGB( 0.85, 0.69, 0 )
								Meter:registerEventHandler( "transition_complete_keyframe", MeterFrame5 )
							end
						end
						
						if event.interrupted then
							MeterFrame4( Meter, event )
							return 
						else
							Meter:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							Meter:registerEventHandler( "transition_complete_keyframe", MeterFrame4 )
						end
					end
					
					if event.interrupted then
						MeterFrame3( Meter, event )
						return 
					else
						Meter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Meter.Back:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						Meter.Fill:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						Meter.Back:setRGB( 1, 0.91, 0.31 )
						Meter.Fill:setRGB( 1, 0.91, 0.31 )
						Meter:registerEventHandler( "transition_complete_keyframe", MeterFrame3 )
					end
				end
				
				Meter:completeAnimation()
				Meter.Back:completeAnimation()
				Meter.Fill:completeAnimation()
				self.Meter:setAlpha( 1 )
				self.Meter.Back:setRGB( 0.85, 0.69, 0 )
				self.Meter.Fill:setRGB( 0.85, 0.69, 0 )
				MeterFrame2( Meter, {} )
				local Image00Frame2 = function ( Image00, event )
					local Image00Frame3 = function ( Image00, event )
						local Image00Frame4 = function ( Image00, event )
							local Image00Frame5 = function ( Image00, event )
								local Image00Frame6 = function ( Image00, event )
									if not event.interrupted then
										Image00:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									end
									Image00:setLeftRight( true, false, 8.75, 59.25 )
									Image00:setTopBottom( true, false, -10.17, 40.33 )
									Image00:setRGB( 0, 0.43, 1 )
									Image00:setAlpha( 0 )
									Image00:setZRot( 157 )
									if event.interrupted then
										self.clipFinished( Image00, event )
									else
										Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Image00Frame6( Image00, event )
									return 
								else
									Image00:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Linear )
									Image00:setLeftRight( true, false, 9.04, 58.93 )
									Image00:setTopBottom( true, false, -9.89, 39.99 )
									Image00:setRGB( 0.02, 0.43, 0.98 )
									Image00:setAlpha( 0 )
									Image00:setZRot( 157 )
									Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame6 )
								end
							end
							
							if event.interrupted then
								Image00Frame5( Image00, event )
								return 
							else
								Image00:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
								Image00:setLeftRight( true, false, 14.57, 52.77 )
								Image00:setTopBottom( true, false, -4.7, 33.5 )
								Image00:setRGB( 0.39, 0.58, 0.61 )
								Image00:setZRot( 133.88 )
								Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame5 )
							end
						end
						
						if event.interrupted then
							Image00Frame4( Image00, event )
							return 
						else
							Image00:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							Image00:setLeftRight( true, false, 23.59, 42.74 )
							Image00:setTopBottom( true, false, 3.77, 22.92 )
							Image00:setZRot( 96.17 )
							Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame4 )
						end
					end
					
					if event.interrupted then
						Image00Frame3( Image00, event )
						return 
					else
						Image00:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Image00:setLeftRight( true, false, 25.92, 40.15 )
						Image00:setTopBottom( true, false, 5.95, 20.18 )
						Image00:setAlpha( 1 )
						Image00:setZRot( 86.43 )
						Image00:registerEventHandler( "transition_complete_keyframe", Image00Frame3 )
					end
				end
				
				Image00:completeAnimation()
				self.Image00:setLeftRight( true, false, 26.5, 39.5 )
				self.Image00:setTopBottom( true, false, 6.5, 19.5 )
				self.Image00:setRGB( 1, 0.83, 0 )
				self.Image00:setAlpha( 0 )
				self.Image00:setZRot( 84 )
				Image00Frame2( Image00, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								if not event.interrupted then
									Image0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								end
								Image0:setLeftRight( true, false, -9.5, 77.5 )
								Image0:setTopBottom( true, false, -30.5, 56.5 )
								Image0:setRGB( 0, 0.56, 1 )
								Image0:setAlpha( 0 )
								Image0:setZRot( -126 )
								if event.interrupted then
									self.clipFinished( Image0, event )
								else
									Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 390, false, false, CoD.TweenType.Linear )
								Image0:setLeftRight( true, false, -3.54, 71.42 )
								Image0:setTopBottom( true, false, -24.51, 50.45 )
								Image0:setRGB( 0, 0.5, 1 )
								Image0:setZRot( -104.24 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
							Image0:setLeftRight( true, false, 8.69, 58.94 )
							Image0:setTopBottom( true, false, -12.2, 38.05 )
							Image0:setRGB( 0, 0.36, 1 )
							Image0:setZRot( -59.56 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Image0:setLeftRight( true, false, 23.75, 43.58 )
						Image0:setTopBottom( true, false, 2.94, 22.77 )
						Image0:setRGB( 0.92, 0.95, 1 )
						Image0:setAlpha( 1 )
						Image0:setZRot( -4.58 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 25, 42.3 )
				self.Image0:setTopBottom( true, false, 4.2, 21.5 )
				self.Image0:setRGB( 1, 1, 1 )
				self.Image0:setAlpha( 0 )
				self.Image0:setZRot( 0 )
				Image0Frame2( Image0, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										if not event.interrupted then
											Glow:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
										end
										Glow:setRGB( 0, 0.6, 1 )
										Glow:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Glow, event )
										else
											Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 1 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 0, 0.6, 1 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local Glow2Frame2 = function ( Glow2, event )
					local Glow2Frame3 = function ( Glow2, event )
						local Glow2Frame4 = function ( Glow2, event )
							local Glow2Frame5 = function ( Glow2, event )
								local Glow2Frame6 = function ( Glow2, event )
									local Glow2Frame7 = function ( Glow2, event )
										local Glow2Frame8 = function ( Glow2, event )
											local Glow2Frame9 = function ( Glow2, event )
												local Glow2Frame10 = function ( Glow2, event )
													local Glow2Frame11 = function ( Glow2, event )
														if not event.interrupted then
															Glow2:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
														end
														Glow2:setLeftRight( true, false, -8.46, 76.46 )
														Glow2:setTopBottom( true, false, -39.15, 169.15 )
														Glow2:setRGB( 0.16, 0, 1 )
														Glow2:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Glow2, event )
														else
															Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Glow2Frame11( Glow2, event )
														return 
													else
														Glow2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Glow2:setLeftRight( true, false, 20.9, 48.96 )
														Glow2:setTopBottom( true, false, -9.61, 141.48 )
														Glow2:setRGB( 0.02, 0.47, 1 )
														Glow2:setAlpha( 1 )
														Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame11 )
													end
												end
												
												if event.interrupted then
													Glow2Frame10( Glow2, event )
													return 
												else
													Glow2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Glow2:setLeftRight( true, false, 21.25, 48.64 )
													Glow2:setTopBottom( true, false, -9.26, 141.15 )
													Glow2:setRGB( 0.02, 0.47, 1 )
													Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame10 )
												end
											end
											
											if event.interrupted then
												Glow2Frame9( Glow2, event )
												return 
											else
												Glow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Glow2:setLeftRight( true, false, 21.95, 47.98 )
												Glow2:setTopBottom( true, false, -8.55, 140.49 )
												Glow2:setRGB( 0.02, 0.48, 1 )
												Glow2:setAlpha( 0.42 )
												Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame9 )
											end
										end
										
										if event.interrupted then
											Glow2Frame8( Glow2, event )
											return 
										else
											Glow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Glow2:setLeftRight( true, false, 22.3, 47.65 )
											Glow2:setTopBottom( true, false, -8.2, 140.16 )
											Glow2:setRGB( 0.02, 0.49, 1 )
											Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame8 )
										end
									end
									
									if event.interrupted then
										Glow2Frame7( Glow2, event )
										return 
									else
										Glow2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Glow2:setRGB( 0.01, 0.5, 1 )
										Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame7 )
									end
								end
								
								if event.interrupted then
									Glow2Frame6( Glow2, event )
									return 
								else
									Glow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glow2:setRGB( 0.01, 0.51, 1 )
									Glow2:setAlpha( 1 )
									Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame6 )
								end
							end
							
							if event.interrupted then
								Glow2Frame5( Glow2, event )
								return 
							else
								Glow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Glow2:setRGB( 0.01, 0.51, 1 )
								Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame5 )
							end
						end
						
						if event.interrupted then
							Glow2Frame4( Glow2, event )
							return 
						else
							Glow2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Glow2:setRGB( 0.01, 0.52, 1 )
							Glow2:setAlpha( 0.3 )
							Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame4 )
						end
					end
					
					if event.interrupted then
						Glow2Frame3( Glow2, event )
						return 
					else
						Glow2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow2:setRGB( 0.01, 0.53, 1 )
						Glow2:setAlpha( 0.59 )
						Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame3 )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setLeftRight( true, false, 23, 47 )
				self.Glow2:setTopBottom( true, false, -7.5, 139.5 )
				self.Glow2:setRGB( 0, 0.55, 1 )
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )
				local Glow20Frame2 = function ( Glow20, event )
					local Glow20Frame3 = function ( Glow20, event )
						local Glow20Frame4 = function ( Glow20, event )
							local Glow20Frame5 = function ( Glow20, event )
								if not event.interrupted then
									Glow20:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
								end
								Glow20:setLeftRight( true, false, 5, 67 )
								Glow20:setTopBottom( true, false, -18.5, 48.67 )
								Glow20:setRGB( 0, 0.3, 1 )
								Glow20:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Glow20, event )
								else
									Glow20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Glow20Frame5( Glow20, event )
								return 
							else
								Glow20:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								Glow20:setLeftRight( true, false, 15.65, 55.07 )
								Glow20:setTopBottom( true, false, -6.7, 36.01 )
								Glow20:setRGB( 0, 0.59, 1 )
								Glow20:registerEventHandler( "transition_complete_keyframe", Glow20Frame5 )
							end
						end
						
						if event.interrupted then
							Glow20Frame4( Glow20, event )
							return 
						else
							Glow20:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							Glow20:setLeftRight( true, false, 17.67, 52.82 )
							Glow20:setTopBottom( true, false, -4.47, 33.62 )
							Glow20:setRGB( 0, 0.64, 1 )
							Glow20:registerEventHandler( "transition_complete_keyframe", Glow20Frame4 )
						end
					end
					
					if event.interrupted then
						Glow20Frame3( Glow20, event )
						return 
					else
						Glow20:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Bounce )
						Glow20:setLeftRight( true, false, 20.54, 49.59 )
						Glow20:setTopBottom( true, false, -1.28, 30.2 )
						Glow20:setRGB( 0.71, 0.9, 1 )
						Glow20:setAlpha( 1 )
						Glow20:registerEventHandler( "transition_complete_keyframe", Glow20Frame3 )
					end
				end
				
				Glow20:completeAnimation()
				self.Glow20:setLeftRight( true, false, 21.7, 48.31 )
				self.Glow20:setTopBottom( true, false, 0, 28.83 )
				self.Glow20:setRGB( 1, 1, 1 )
				self.Glow20:setAlpha( 0 )
				Glow20Frame2( Glow20, {} )
				local Glow200Frame2 = function ( Glow200, event )
					local Glow200Frame3 = function ( Glow200, event )
						local Glow200Frame4 = function ( Glow200, event )
							if not event.interrupted then
								Glow200:beginAnimation( "keyframe", 849, false, false, CoD.TweenType.Linear )
							end
							Glow200:setLeftRight( true, false, -71.3, 141.31 )
							Glow200:setTopBottom( true, false, 7.85, 20.98 )
							Glow200:setRGB( 1, 0, 0 )
							Glow200:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Glow200, event )
							else
								Glow200:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Glow200Frame4( Glow200, event )
							return 
						else
							Glow200:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Glow200:setRGB( 0, 0.29, 1 )
							Glow200:setAlpha( 0.99 )
							Glow200:registerEventHandler( "transition_complete_keyframe", Glow200Frame4 )
						end
					end
					
					if event.interrupted then
						Glow200Frame3( Glow200, event )
						return 
					else
						Glow200:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Glow200:setRGB( 0, 0.28, 1 )
						Glow200:setAlpha( 1 )
						Glow200:registerEventHandler( "transition_complete_keyframe", Glow200Frame3 )
					end
				end
				
				Glow200:completeAnimation()
				self.Glow200:setLeftRight( true, false, -71.3, 141.31 )
				self.Glow200:setTopBottom( true, false, 7.85, 20.98 )
				self.Glow200:setRGB( 0, 0.24, 1 )
				self.Glow200:setAlpha( 0 )
				Glow200Frame2( Glow200, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local MeterFrame2 = function ( Meter, event )
					if not event.interrupted then
						Meter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Meter.Back:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
						Meter.Fill:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Meter:setRGB( 1, 1, 1 )
					Meter.Back:setRGB( 0.51, 0.55, 0.64 )
					Meter.Fill:setRGB( 0.51, 0.55, 0.64 )
					if event.interrupted then
						self.clipFinished( Meter, event )
					else
						Meter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Meter:completeAnimation()
				Meter.Back:completeAnimation()
				Meter.Fill:completeAnimation()
				self.Meter:setRGB( 1, 1, 1 )
				self.Meter.Back:setRGB( 0.85, 0.69, 0 )
				self.Meter.Fill:setRGB( 0.85, 0.69, 0 )
				MeterFrame2( Meter, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ScrStkNumberMove0:completeAnimation()
				ScrStkNumberMove0.TextBox:completeAnimation()
				self.ScrStkNumberMove0.TextBox:setRGB( 1, 1, 1 )
				self.clipFinished( ScrStkNumberMove0, {} )
				local MeterFrame2 = function ( Meter, event )
					local MeterFrame3 = function ( Meter, event )
						local MeterFrame4 = function ( Meter, event )
							local MeterFrame5 = function ( Meter, event )
								local MeterFrame6 = function ( Meter, event )
									if not event.interrupted then
										Meter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										Meter.Back:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
										Meter.Fill:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
									end
									Meter:setAlpha( 1 )
									Meter.Back:setRGB( 0.85, 0.69, 0 )
									Meter.Fill:setRGB( 0.85, 0.69, 0 )
									if event.interrupted then
										self.clipFinished( Meter, event )
									else
										Meter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									MeterFrame6( Meter, event )
									return 
								else
									Meter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									Meter.Back:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
									Meter.Fill:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
									Meter.Back:setRGB( 1, 0.91, 0.31 )
									Meter.Fill:setRGB( 1, 0.91, 0.31 )
									Meter:registerEventHandler( "transition_complete_keyframe", MeterFrame6 )
								end
							end
							
							if event.interrupted then
								MeterFrame5( Meter, event )
								return 
							else
								Meter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								Meter.Back:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
								Meter.Fill:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
								Meter.Back:setRGB( 0.85, 0.69, 0 )
								Meter.Fill:setRGB( 0.85, 0.69, 0 )
								Meter:registerEventHandler( "transition_complete_keyframe", MeterFrame5 )
							end
						end
						
						if event.interrupted then
							MeterFrame4( Meter, event )
							return 
						else
							Meter:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							Meter:registerEventHandler( "transition_complete_keyframe", MeterFrame4 )
						end
					end
					
					if event.interrupted then
						MeterFrame3( Meter, event )
						return 
					else
						Meter:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Meter.Back:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						Meter.Fill:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						Meter.Back:setRGB( 1, 0.91, 0.31 )
						Meter.Fill:setRGB( 1, 0.91, 0.31 )
						Meter:registerEventHandler( "transition_complete_keyframe", MeterFrame3 )
					end
				end
				
				Meter:completeAnimation()
				Meter.Back:completeAnimation()
				Meter.Fill:completeAnimation()
				self.Meter:setAlpha( 1 )
				self.Meter.Back:setRGB( 0.85, 0.69, 0 )
				self.Meter.Fill:setRGB( 0.85, 0.69, 0 )
				MeterFrame2( Meter, {} )
				Image00:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				Image00:setAlpha( 0 )
				Image00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				Image0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				Image0:setAlpha( 0 )
				Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						local GlowFrame4 = function ( Glow, event )
							local GlowFrame5 = function ( Glow, event )
								local GlowFrame6 = function ( Glow, event )
									local GlowFrame7 = function ( Glow, event )
										if not event.interrupted then
											Glow:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
										end
										Glow:setRGB( 1, 0.74, 0 )
										Glow:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( Glow, event )
										else
											Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										GlowFrame7( Glow, event )
										return 
									else
										Glow:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Glow:setAlpha( 1 )
										Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame7 )
									end
								end
								
								if event.interrupted then
									GlowFrame6( Glow, event )
									return 
								else
									Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame6 )
								end
							end
							
							if event.interrupted then
								GlowFrame5( Glow, event )
								return 
							else
								Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Glow:setAlpha( 0 )
								Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame5 )
							end
						end
						
						if event.interrupted then
							GlowFrame4( Glow, event )
							return 
						else
							Glow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame4 )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setRGB( 1, 0.74, 0 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local Glow2Frame2 = function ( Glow2, event )
					local Glow2Frame3 = function ( Glow2, event )
						local Glow2Frame4 = function ( Glow2, event )
							local Glow2Frame5 = function ( Glow2, event )
								local Glow2Frame6 = function ( Glow2, event )
									local Glow2Frame7 = function ( Glow2, event )
										local Glow2Frame8 = function ( Glow2, event )
											local Glow2Frame9 = function ( Glow2, event )
												local Glow2Frame10 = function ( Glow2, event )
													local Glow2Frame11 = function ( Glow2, event )
														if not event.interrupted then
															Glow2:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Linear )
														end
														Glow2:setLeftRight( true, false, -8.46, 76.46 )
														Glow2:setTopBottom( true, false, -39.15, 169.15 )
														Glow2:setRGB( 1, 0.03, 0 )
														Glow2:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Glow2, event )
														else
															Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Glow2Frame11( Glow2, event )
														return 
													else
														Glow2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														Glow2:setLeftRight( true, false, 20.9, 48.96 )
														Glow2:setTopBottom( true, false, -9.61, 141.48 )
														Glow2:setRGB( 1, 0.7, 0 )
														Glow2:setAlpha( 1 )
														Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame11 )
													end
												end
												
												if event.interrupted then
													Glow2Frame10( Glow2, event )
													return 
												else
													Glow2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Glow2:setLeftRight( true, false, 21.25, 48.64 )
													Glow2:setTopBottom( true, false, -9.26, 141.15 )
													Glow2:setRGB( 1, 0.71, 0 )
													Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame10 )
												end
											end
											
											if event.interrupted then
												Glow2Frame9( Glow2, event )
												return 
											else
												Glow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Glow2:setLeftRight( true, false, 21.95, 47.98 )
												Glow2:setTopBottom( true, false, -8.55, 140.49 )
												Glow2:setRGB( 1, 0.72, 0 )
												Glow2:setAlpha( 0.42 )
												Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame9 )
											end
										end
										
										if event.interrupted then
											Glow2Frame8( Glow2, event )
											return 
										else
											Glow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Glow2:setLeftRight( true, false, 22.3, 47.65 )
											Glow2:setTopBottom( true, false, -8.2, 140.16 )
											Glow2:setRGB( 1, 0.73, 0 )
											Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame8 )
										end
									end
									
									if event.interrupted then
										Glow2Frame7( Glow2, event )
										return 
									else
										Glow2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Glow2:setRGB( 1, 0.75, 0 )
										Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame7 )
									end
								end
								
								if event.interrupted then
									Glow2Frame6( Glow2, event )
									return 
								else
									Glow2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Glow2:setRGB( 1, 0.76, 0 )
									Glow2:setAlpha( 1 )
									Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame6 )
								end
							end
							
							if event.interrupted then
								Glow2Frame5( Glow2, event )
								return 
							else
								Glow2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Glow2:setRGB( 1, 0.76, 0 )
								Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame5 )
							end
						end
						
						if event.interrupted then
							Glow2Frame4( Glow2, event )
							return 
						else
							Glow2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Glow2:setRGB( 1, 0.78, 0 )
							Glow2:setAlpha( 0.3 )
							Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame4 )
						end
					end
					
					if event.interrupted then
						Glow2Frame3( Glow2, event )
						return 
					else
						Glow2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow2:setRGB( 1, 0.79, 0 )
						Glow2:setAlpha( 0.59 )
						Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame3 )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setLeftRight( true, false, 23, 47 )
				self.Glow2:setTopBottom( true, false, -7.5, 139.5 )
				self.Glow2:setRGB( 1, 0.82, 0 )
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )
				Glow20:completeAnimation()
				self.Glow20:setAlpha( 0 )
				self.clipFinished( Glow20, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local MeterFrame2 = function ( Meter, event )
					if not event.interrupted then
						Meter:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Meter.Back:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
						Meter.Fill:beginAnimation( "subkeyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Meter.Back:setRGB( 0.51, 0.55, 0.64 )
					Meter.Fill:setRGB( 0.51, 0.55, 0.64 )
					if event.interrupted then
						self.clipFinished( Meter, event )
					else
						Meter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Meter:completeAnimation()
				Meter.Back:completeAnimation()
				Meter.Fill:completeAnimation()
				self.Meter.Back:setRGB( 0.85, 0.69, 0 )
				self.Meter.Fill:setRGB( 0.85, 0.69, 0 )
				MeterFrame2( Meter, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ReadyCombat",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "killstreaks.momentumPercentage", 1 ) and HasPerk( controller, "specialty_combat_efficiency" )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "killstreaks.momentumPercentage", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks.momentumPercentage" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "killstreaks.momentumPercentage"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScrStkMeterPanel0:close()
		element.ScrStkNumberMove0:close()
		element.Meter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

