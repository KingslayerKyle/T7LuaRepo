CoD.DamageWidget_RepairMeter = InheritFrom( LUI.UIElement )
CoD.DamageWidget_RepairMeter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_RepairMeter )
	self.id = "DamageWidget_RepairMeter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 97 )
	
	local Regen5Back = LUI.UIImage.new()
	Regen5Back:setLeftRight( true, false, 58.5, 62.5 )
	Regen5Back:setTopBottom( true, false, 0.33, 37.67 )
	Regen5Back:setRGB( 1, 1, 1 )
	Regen5Back:setAlpha( 0.3 )
	Regen5Back:setZRot( -120 )
	Regen5Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	Regen5Back:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen5Back )
	self.Regen5Back = Regen5Back
	
	local Regen4Back = LUI.UIImage.new()
	Regen4Back:setLeftRight( true, false, 9.5, 46.83 )
	Regen4Back:setTopBottom( true, false, 17, 23.67 )
	Regen4Back:setRGB( 1, 1, 1 )
	Regen4Back:setAlpha( 0.3 )
	Regen4Back:setZRot( -150 )
	Regen4Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair2" ) )
	Regen4Back:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen4Back )
	self.Regen4Back = Regen4Back
	
	local Regen3Back = LUI.UIImage.new()
	Regen3Back:setLeftRight( true, false, 9, 13 )
	Regen3Back:setTopBottom( true, false, 29.83, 67.17 )
	Regen3Back:setRGB( 1, 1, 1 )
	Regen3Back:setAlpha( 0.3 )
	Regen3Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	Regen3Back:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen3Back )
	self.Regen3Back = Regen3Back
	
	local Regen2Back = LUI.UIImage.new()
	Regen2Back:setLeftRight( true, false, 9.5, 46.83 )
	Regen2Back:setTopBottom( true, false, 72.5, 79.17 )
	Regen2Back:setRGB( 1, 1, 1 )
	Regen2Back:setAlpha( 0.3 )
	Regen2Back:setZRot( -30 )
	Regen2Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair2" ) )
	Regen2Back:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen2Back )
	self.Regen2Back = Regen2Back
	
	local Regen1Back = LUI.UIImage.new()
	Regen1Back:setLeftRight( true, false, 59, 63 )
	Regen1Back:setTopBottom( true, false, 58.34, 95.67 )
	Regen1Back:setRGB( 1, 1, 1 )
	Regen1Back:setAlpha( 0.3 )
	Regen1Back:setZRot( 120 )
	Regen1Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	Regen1Back:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen1Back )
	self.Regen1Back = Regen1Back
	
	local Regen5 = LUI.UIImage.new()
	Regen5:setLeftRight( true, false, 58.5, 62.5 )
	Regen5:setTopBottom( true, false, 0.33, 37.67 )
	Regen5:setRGB( 1, 1, 1 )
	Regen5:setAlpha( 0 )
	Regen5:setZRot( -120 )
	Regen5:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	Regen5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen5 )
	self.Regen5 = Regen5
	
	local Regen4 = LUI.UIImage.new()
	Regen4:setLeftRight( true, false, 9.5, 46.83 )
	Regen4:setTopBottom( true, false, 17, 23.67 )
	Regen4:setRGB( 1, 1, 1 )
	Regen4:setAlpha( 0 )
	Regen4:setZRot( -150 )
	Regen4:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair2" ) )
	Regen4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen4 )
	self.Regen4 = Regen4
	
	local Regen3 = LUI.UIImage.new()
	Regen3:setLeftRight( true, false, 9, 13 )
	Regen3:setTopBottom( true, false, 29.83, 67.17 )
	Regen3:setRGB( 1, 1, 1 )
	Regen3:setAlpha( 0 )
	Regen3:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	Regen3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen3 )
	self.Regen3 = Regen3
	
	local Regen2 = LUI.UIImage.new()
	Regen2:setLeftRight( true, false, 9.5, 46.83 )
	Regen2:setTopBottom( true, false, 72.5, 79.17 )
	Regen2:setRGB( 1, 1, 1 )
	Regen2:setAlpha( 0 )
	Regen2:setZRot( -30 )
	Regen2:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair2" ) )
	Regen2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen2 )
	self.Regen2 = Regen2
	
	local Regen1 = LUI.UIImage.new()
	Regen1:setLeftRight( true, false, 59, 63 )
	Regen1:setTopBottom( true, false, 58.34, 95.67 )
	Regen1:setRGB( 1, 1, 1 )
	Regen1:setAlpha( 0 )
	Regen1:setZRot( 120 )
	Regen1:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	Regen1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Regen1 )
	self.Regen1 = Regen1
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( true, false, 58.5, 62.5 )
	Line:setTopBottom( true, false, 67.67, 86.34 )
	Line:setRGB( 1, 1, 1 )
	Line:setAlpha( 0 )
	Line:setZRot( 120 )
	Line:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityhash" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Line )
	self.Line = Line
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 0 )
				self.clipFinished( Regen5, {} )
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 0 )
				self.clipFinished( Regen4, {} )
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 0 )
				self.clipFinished( Regen3, {} )
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 0 )
				self.clipFinished( Regen2, {} )
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 0 )
				self.clipFinished( Regen1, {} )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end
		},
		State0 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 0 )
				self.clipFinished( Regen5, {} )
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 0 )
				self.clipFinished( Regen4, {} )
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 0 )
				self.clipFinished( Regen3, {} )
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 0 )
				self.clipFinished( Regen2, {} )
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 0 )
				self.clipFinished( Regen1, {} )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end,
			State1 = function ()
				self:setupElementClipCounter( 2 )
				local Regen1Frame2 = function ( Regen1, event )
					local Regen1Frame3 = function ( Regen1, event )
						local Regen1Frame4 = function ( Regen1, event )
							local Regen1Frame5 = function ( Regen1, event )
								local Regen1Frame6 = function ( Regen1, event )
									if not event.interrupted then
										Regen1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
									end
									Regen1:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( Regen1, event )
									else
										Regen1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									Regen1Frame6( Regen1, event )
									return 
								else
									Regen1:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame6 )
								end
							end
							
							if event.interrupted then
								Regen1Frame5( Regen1, event )
								return 
							else
								Regen1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
								Regen1:setAlpha( 0 )
								Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame5 )
							end
						end
						
						if event.interrupted then
							Regen1Frame4( Regen1, event )
							return 
						else
							Regen1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Regen1:setAlpha( 0.5 )
							Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame4 )
						end
					end
					
					if event.interrupted then
						Regen1Frame3( Regen1, event )
						return 
					else
						Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame3 )
					end
				end
				
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 0 )
				Regen1Frame2( Regen1, {} )
				local LineFrame2 = function ( Line, event )
					local LineFrame3 = function ( Line, event )
						local LineFrame4 = function ( Line, event )
							local LineFrame5 = function ( Line, event )
								local LineFrame6 = function ( Line, event )
									local LineFrame7 = function ( Line, event )
										local LineFrame8 = function ( Line, event )
											local LineFrame9 = function ( Line, event )
												local LineFrame10 = function ( Line, event )
													if not event.interrupted then
														Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Line:setLeftRight( true, false, 58.5, 62.5 )
													Line:setTopBottom( true, false, 67.67, 86.33 )
													Line:setAlpha( 1 )
													Line:setZRot( 120 )
													if event.interrupted then
														self.clipFinished( Line, event )
													else
														Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													LineFrame10( Line, event )
													return 
												else
													Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													Line:registerEventHandler( "transition_complete_keyframe", LineFrame10 )
												end
											end
											
											if event.interrupted then
												LineFrame9( Line, event )
												return 
											else
												Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Line:setLeftRight( true, false, 58.5, 62.5 )
												Line:setTopBottom( true, false, 67.67, 86.33 )
												Line:registerEventHandler( "transition_complete_keyframe", LineFrame9 )
											end
										end
										
										if event.interrupted then
											LineFrame8( Line, event )
											return 
										else
											Line:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											Line:setLeftRight( true, false, 60.3, 64.3 )
											Line:setTopBottom( true, false, 70.12, 88.79 )
											Line:setAlpha( 1 )
											Line:registerEventHandler( "transition_complete_keyframe", LineFrame8 )
										end
									end
									
									if event.interrupted then
										LineFrame7( Line, event )
										return 
									else
										Line:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Line:setLeftRight( true, false, 66.3, 70.3 )
										Line:setTopBottom( true, false, 78.31, 96.98 )
										Line:registerEventHandler( "transition_complete_keyframe", LineFrame7 )
									end
								end
								
								if event.interrupted then
									LineFrame6( Line, event )
									return 
								else
									Line:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Line:setLeftRight( true, false, 67.8, 71.8 )
									Line:setTopBottom( true, false, 80.36, 99.03 )
									Line:setAlpha( 0 )
									Line:registerEventHandler( "transition_complete_keyframe", LineFrame6 )
								end
							end
							
							if event.interrupted then
								LineFrame5( Line, event )
								return 
							else
								Line:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Line:setTopBottom( true, false, 82, 100.67 )
								Line:setAlpha( 0.67 )
								Line:registerEventHandler( "transition_complete_keyframe", LineFrame5 )
							end
						end
						
						if event.interrupted then
							LineFrame4( Line, event )
							return 
						else
							Line:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Line:registerEventHandler( "transition_complete_keyframe", LineFrame4 )
						end
					end
					
					if event.interrupted then
						LineFrame3( Line, event )
						return 
					else
						Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Line:setAlpha( 1 )
						Line:registerEventHandler( "transition_complete_keyframe", LineFrame3 )
					end
				end
				
				Line:completeAnimation()
				self.Line:setLeftRight( true, false, 69, 73 )
				self.Line:setTopBottom( true, false, 82, 100.67 )
				self.Line:setAlpha( 0 )
				self.Line:setZRot( 120 )
				LineFrame2( Line, {} )
			end
		},
		State1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 0 )
				self.clipFinished( Regen5, {} )
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 0 )
				self.clipFinished( Regen4, {} )
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 0 )
				self.clipFinished( Regen3, {} )
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 0 )
				self.clipFinished( Regen2, {} )
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 1 )
				self.clipFinished( Regen1, {} )
			end,
			State0 = function ()
				self:setupElementClipCounter( 2 )
				local Regen1Frame2 = function ( Regen1, event )
					local Regen1Frame3 = function ( Regen1, event )
						local Regen1Frame4 = function ( Regen1, event )
							local Regen1Frame5 = function ( Regen1, event )
								local Regen1Frame6 = function ( Regen1, event )
									local Regen1Frame7 = function ( Regen1, event )
										local Regen1Frame8 = function ( Regen1, event )
											local Regen1Frame9 = function ( Regen1, event )
												local Regen1Frame10 = function ( Regen1, event )
													local Regen1Frame11 = function ( Regen1, event )
														local Regen1Frame12 = function ( Regen1, event )
															if not event.interrupted then
																Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Regen1:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen1, event )
															else
																Regen1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen1Frame12( Regen1, event )
															return 
														else
															Regen1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															Regen1:setAlpha( 0.47 )
															Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame12 )
														end
													end
													
													if event.interrupted then
														Regen1Frame11( Regen1, event )
														return 
													else
														Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame11 )
													end
												end
												
												if event.interrupted then
													Regen1Frame10( Regen1, event )
													return 
												else
													Regen1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													Regen1:setAlpha( 0 )
													Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame10 )
												end
											end
											
											if event.interrupted then
												Regen1Frame9( Regen1, event )
												return 
											else
												Regen1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												Regen1:setAlpha( 0.25 )
												Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame9 )
											end
										end
										
										if event.interrupted then
											Regen1Frame8( Regen1, event )
											return 
										else
											Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Regen1:setAlpha( 1 )
											Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame8 )
										end
									end
									
									if event.interrupted then
										Regen1Frame7( Regen1, event )
										return 
									else
										Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame7 )
									end
								end
								
								if event.interrupted then
									Regen1Frame6( Regen1, event )
									return 
								else
									Regen1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									Regen1:setAlpha( 0 )
									Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame6 )
								end
							end
							
							if event.interrupted then
								Regen1Frame5( Regen1, event )
								return 
							else
								Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame5 )
							end
						end
						
						if event.interrupted then
							Regen1Frame4( Regen1, event )
							return 
						else
							Regen1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Regen1:setAlpha( 0.77 )
							Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame4 )
						end
					end
					
					if event.interrupted then
						Regen1Frame3( Regen1, event )
						return 
					else
						Regen1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Regen1:setAlpha( 0 )
						Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame3 )
					end
				end
				
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 1 )
				Regen1Frame2( Regen1, {} )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end,
			State2 = function ()
				self:setupElementClipCounter( 2 )
				local Regen2Frame2 = function ( Regen2, event )
					local Regen2Frame3 = function ( Regen2, event )
						local Regen2Frame4 = function ( Regen2, event )
							local Regen2Frame5 = function ( Regen2, event )
								local Regen2Frame6 = function ( Regen2, event )
									local Regen2Frame7 = function ( Regen2, event )
										if not event.interrupted then
											Regen2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										end
										Regen2:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Regen2, event )
										else
											Regen2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Regen2Frame7( Regen2, event )
										return 
									else
										Regen2:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame7 )
									end
								end
								
								if event.interrupted then
									Regen2Frame6( Regen2, event )
									return 
								else
									Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Regen2:setAlpha( 0 )
									Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame6 )
								end
							end
							
							if event.interrupted then
								Regen2Frame5( Regen2, event )
								return 
							else
								Regen2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame5 )
							end
						end
						
						if event.interrupted then
							Regen2Frame4( Regen2, event )
							return 
						else
							Regen2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Regen2:setAlpha( 0.5 )
							Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame4 )
						end
					end
					
					if event.interrupted then
						Regen2Frame3( Regen2, event )
						return 
					else
						Regen2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame3 )
					end
				end
				
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 0 )
				Regen2Frame2( Regen2, {} )
				local LineFrame2 = function ( Line, event )
					local LineFrame3 = function ( Line, event )
						local LineFrame4 = function ( Line, event )
							local LineFrame5 = function ( Line, event )
								local LineFrame6 = function ( Line, event )
									local LineFrame7 = function ( Line, event )
										local LineFrame8 = function ( Line, event )
											local LineFrame9 = function ( Line, event )
												local LineFrame10 = function ( Line, event )
													if not event.interrupted then
														Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Line:setLeftRight( true, false, 26, 30 )
													Line:setTopBottom( true, false, 68, 86.67 )
													Line:setAlpha( 1 )
													Line:setZRot( 60 )
													if event.interrupted then
														self.clipFinished( Line, event )
													else
														Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													LineFrame10( Line, event )
													return 
												else
													Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													Line:registerEventHandler( "transition_complete_keyframe", LineFrame10 )
												end
											end
											
											if event.interrupted then
												LineFrame9( Line, event )
												return 
											else
												Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Line:setLeftRight( true, false, 26, 30 )
												Line:setTopBottom( true, false, 68, 86.67 )
												Line:registerEventHandler( "transition_complete_keyframe", LineFrame9 )
											end
										end
										
										if event.interrupted then
											LineFrame8( Line, event )
											return 
										else
											Line:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											Line:setLeftRight( true, false, 24.11, 28.11 )
											Line:setTopBottom( true, false, 70.4, 89.07 )
											Line:setAlpha( 1 )
											Line:registerEventHandler( "transition_complete_keyframe", LineFrame8 )
										end
									end
									
									if event.interrupted then
										LineFrame7( Line, event )
										return 
									else
										Line:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Line:setLeftRight( true, false, 17.83, 21.83 )
										Line:setTopBottom( true, false, 78.4, 97.07 )
										Line:registerEventHandler( "transition_complete_keyframe", LineFrame7 )
									end
								end
								
								if event.interrupted then
									LineFrame6( Line, event )
									return 
								else
									Line:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Line:setLeftRight( true, false, 16.26, 20.26 )
									Line:setTopBottom( true, false, 80.4, 99.07 )
									Line:setAlpha( 0 )
									Line:registerEventHandler( "transition_complete_keyframe", LineFrame6 )
								end
							end
							
							if event.interrupted then
								LineFrame5( Line, event )
								return 
							else
								Line:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Line:setTopBottom( true, false, 82, 100.67 )
								Line:setAlpha( 0.67 )
								Line:registerEventHandler( "transition_complete_keyframe", LineFrame5 )
							end
						end
						
						if event.interrupted then
							LineFrame4( Line, event )
							return 
						else
							Line:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Line:registerEventHandler( "transition_complete_keyframe", LineFrame4 )
						end
					end
					
					if event.interrupted then
						LineFrame3( Line, event )
						return 
					else
						Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Line:setAlpha( 1 )
						Line:registerEventHandler( "transition_complete_keyframe", LineFrame3 )
					end
				end
				
				Line:completeAnimation()
				self.Line:setLeftRight( true, false, 15, 19 )
				self.Line:setTopBottom( true, false, 82, 100.67 )
				self.Line:setAlpha( 0 )
				self.Line:setZRot( 60 )
				LineFrame2( Line, {} )
			end
		},
		State2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 0 )
				self.clipFinished( Regen5, {} )
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 0 )
				self.clipFinished( Regen4, {} )
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 0 )
				self.clipFinished( Regen3, {} )
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 1 )
				self.clipFinished( Regen2, {} )
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 1 )
				self.clipFinished( Regen1, {} )
			end,
			State0 = function ()
				self:setupElementClipCounter( 3 )
				local Regen2Frame2 = function ( Regen2, event )
					local Regen2Frame3 = function ( Regen2, event )
						local Regen2Frame4 = function ( Regen2, event )
							local Regen2Frame5 = function ( Regen2, event )
								local Regen2Frame6 = function ( Regen2, event )
									local Regen2Frame7 = function ( Regen2, event )
										local Regen2Frame8 = function ( Regen2, event )
											local Regen2Frame9 = function ( Regen2, event )
												local Regen2Frame10 = function ( Regen2, event )
													local Regen2Frame11 = function ( Regen2, event )
														local Regen2Frame12 = function ( Regen2, event )
															if not event.interrupted then
																Regen2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
															end
															Regen2:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen2, event )
															else
																Regen2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen2Frame12( Regen2, event )
															return 
														else
															Regen2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Regen2:setAlpha( 0.47 )
															Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame12 )
														end
													end
													
													if event.interrupted then
														Regen2Frame11( Regen2, event )
														return 
													else
														Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame11 )
													end
												end
												
												if event.interrupted then
													Regen2Frame10( Regen2, event )
													return 
												else
													Regen2:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													Regen2:setAlpha( 0 )
													Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame10 )
												end
											end
											
											if event.interrupted then
												Regen2Frame9( Regen2, event )
												return 
											else
												Regen2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen2:setAlpha( 0.25 )
												Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame9 )
											end
										end
										
										if event.interrupted then
											Regen2Frame8( Regen2, event )
											return 
										else
											Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
											Regen2:setAlpha( 1 )
											Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame8 )
										end
									end
									
									if event.interrupted then
										Regen2Frame7( Regen2, event )
										return 
									else
										Regen2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame7 )
									end
								end
								
								if event.interrupted then
									Regen2Frame6( Regen2, event )
									return 
								else
									Regen2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Regen2:setAlpha( 0 )
									Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame6 )
								end
							end
							
							if event.interrupted then
								Regen2Frame5( Regen2, event )
								return 
							else
								Regen2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame5 )
							end
						end
						
						if event.interrupted then
							Regen2Frame4( Regen2, event )
							return 
						else
							Regen2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							Regen2:setAlpha( 0.77 )
							Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame4 )
						end
					end
					
					if event.interrupted then
						Regen2Frame3( Regen2, event )
						return 
					else
						Regen2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Regen2:setAlpha( 0 )
						Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame3 )
					end
				end
				
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 1 )
				Regen2Frame2( Regen2, {} )
				local Regen1Frame2 = function ( Regen1, event )
					local Regen1Frame3 = function ( Regen1, event )
						local Regen1Frame4 = function ( Regen1, event )
							local Regen1Frame5 = function ( Regen1, event )
								local Regen1Frame6 = function ( Regen1, event )
									local Regen1Frame7 = function ( Regen1, event )
										local Regen1Frame8 = function ( Regen1, event )
											local Regen1Frame9 = function ( Regen1, event )
												local Regen1Frame10 = function ( Regen1, event )
													local Regen1Frame11 = function ( Regen1, event )
														local Regen1Frame12 = function ( Regen1, event )
															if not event.interrupted then
																Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Regen1:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen1, event )
															else
																Regen1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen1Frame12( Regen1, event )
															return 
														else
															Regen1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															Regen1:setAlpha( 0.47 )
															Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame12 )
														end
													end
													
													if event.interrupted then
														Regen1Frame11( Regen1, event )
														return 
													else
														Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame11 )
													end
												end
												
												if event.interrupted then
													Regen1Frame10( Regen1, event )
													return 
												else
													Regen1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													Regen1:setAlpha( 0 )
													Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame10 )
												end
											end
											
											if event.interrupted then
												Regen1Frame9( Regen1, event )
												return 
											else
												Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen1:setAlpha( 0.25 )
												Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame9 )
											end
										end
										
										if event.interrupted then
											Regen1Frame8( Regen1, event )
											return 
										else
											Regen1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											Regen1:setAlpha( 1 )
											Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame8 )
										end
									end
									
									if event.interrupted then
										Regen1Frame7( Regen1, event )
										return 
									else
										Regen1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame7 )
									end
								end
								
								if event.interrupted then
									Regen1Frame6( Regen1, event )
									return 
								else
									Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Regen1:setAlpha( 0 )
									Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame6 )
								end
							end
							
							if event.interrupted then
								Regen1Frame5( Regen1, event )
								return 
							else
								Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame5 )
							end
						end
						
						if event.interrupted then
							Regen1Frame4( Regen1, event )
							return 
						else
							Regen1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Regen1:setAlpha( 0.77 )
							Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame4 )
						end
					end
					
					if event.interrupted then
						Regen1Frame3( Regen1, event )
						return 
					else
						Regen1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Regen1:setAlpha( 0 )
						Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame3 )
					end
				end
				
				Regen1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				Regen1:setAlpha( 1 )
				Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame2 )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end,
			State3 = function ()
				self:setupElementClipCounter( 2 )
				local Regen3Frame2 = function ( Regen3, event )
					local Regen3Frame3 = function ( Regen3, event )
						local Regen3Frame4 = function ( Regen3, event )
							local Regen3Frame5 = function ( Regen3, event )
								local Regen3Frame6 = function ( Regen3, event )
									local Regen3Frame7 = function ( Regen3, event )
										if not event.interrupted then
											Regen3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										end
										Regen3:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Regen3, event )
										else
											Regen3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Regen3Frame7( Regen3, event )
										return 
									else
										Regen3:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame7 )
									end
								end
								
								if event.interrupted then
									Regen3Frame6( Regen3, event )
									return 
								else
									Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Regen3:setAlpha( 0 )
									Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame6 )
								end
							end
							
							if event.interrupted then
								Regen3Frame5( Regen3, event )
								return 
							else
								Regen3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame5 )
							end
						end
						
						if event.interrupted then
							Regen3Frame4( Regen3, event )
							return 
						else
							Regen3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Regen3:setAlpha( 0.5 )
							Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame4 )
						end
					end
					
					if event.interrupted then
						Regen3Frame3( Regen3, event )
						return 
					else
						Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame3 )
					end
				end
				
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 0 )
				Regen3Frame2( Regen3, {} )
				local LineFrame2 = function ( Line, event )
					local LineFrame3 = function ( Line, event )
						local LineFrame4 = function ( Line, event )
							local LineFrame5 = function ( Line, event )
								local LineFrame6 = function ( Line, event )
									local LineFrame7 = function ( Line, event )
										local LineFrame8 = function ( Line, event )
											local LineFrame9 = function ( Line, event )
												local LineFrame10 = function ( Line, event )
													if not event.interrupted then
														Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Line:setLeftRight( true, false, 9, 13 )
													Line:setTopBottom( true, false, 38.67, 57.33 )
													Line:setAlpha( 1 )
													Line:setZRot( 0 )
													if event.interrupted then
														self.clipFinished( Line, event )
													else
														Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													LineFrame10( Line, event )
													return 
												else
													Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													Line:registerEventHandler( "transition_complete_keyframe", LineFrame10 )
												end
											end
											
											if event.interrupted then
												LineFrame9( Line, event )
												return 
											else
												Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Line:setLeftRight( true, false, 9, 13 )
												Line:setTopBottom( true, false, 38.67, 57.33 )
												Line:registerEventHandler( "transition_complete_keyframe", LineFrame9 )
											end
										end
										
										if event.interrupted then
											LineFrame8( Line, event )
											return 
										else
											Line:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											Line:setLeftRight( true, false, 6.26, 10.26 )
											Line:setTopBottom( true, false, 38.84, 57.51 )
											Line:setAlpha( 1 )
											Line:registerEventHandler( "transition_complete_keyframe", LineFrame8 )
										end
									end
									
									if event.interrupted then
										LineFrame7( Line, event )
										return 
									else
										Line:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Line:setLeftRight( true, false, -2.89, 1.11 )
										Line:setTopBottom( true, false, 39.41, 58.08 )
										Line:registerEventHandler( "transition_complete_keyframe", LineFrame7 )
									end
								end
								
								if event.interrupted then
									LineFrame6( Line, event )
									return 
								else
									Line:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Line:setLeftRight( true, false, -5.17, -1.17 )
									Line:setTopBottom( true, false, 39.56, 58.23 )
									Line:setAlpha( 0 )
									Line:registerEventHandler( "transition_complete_keyframe", LineFrame6 )
								end
							end
							
							if event.interrupted then
								LineFrame5( Line, event )
								return 
							else
								Line:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Line:setAlpha( 0.67 )
								Line:registerEventHandler( "transition_complete_keyframe", LineFrame5 )
							end
						end
						
						if event.interrupted then
							LineFrame4( Line, event )
							return 
						else
							Line:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Line:registerEventHandler( "transition_complete_keyframe", LineFrame4 )
						end
					end
					
					if event.interrupted then
						LineFrame3( Line, event )
						return 
					else
						Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Line:setAlpha( 1 )
						Line:registerEventHandler( "transition_complete_keyframe", LineFrame3 )
					end
				end
				
				Line:completeAnimation()
				self.Line:setLeftRight( true, false, -7, -3 )
				self.Line:setTopBottom( true, false, 39.67, 58.34 )
				self.Line:setAlpha( 0 )
				self.Line:setZRot( 0 )
				LineFrame2( Line, {} )
			end
		},
		State3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 0 )
				self.clipFinished( Regen5, {} )
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 0 )
				self.clipFinished( Regen4, {} )
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 1 )
				self.clipFinished( Regen3, {} )
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 1 )
				self.clipFinished( Regen2, {} )
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 1 )
				self.clipFinished( Regen1, {} )
			end,
			State0 = function ()
				self:setupElementClipCounter( 4 )
				local Regen3Frame2 = function ( Regen3, event )
					local Regen3Frame3 = function ( Regen3, event )
						local Regen3Frame4 = function ( Regen3, event )
							local Regen3Frame5 = function ( Regen3, event )
								local Regen3Frame6 = function ( Regen3, event )
									local Regen3Frame7 = function ( Regen3, event )
										local Regen3Frame8 = function ( Regen3, event )
											local Regen3Frame9 = function ( Regen3, event )
												local Regen3Frame10 = function ( Regen3, event )
													local Regen3Frame11 = function ( Regen3, event )
														local Regen3Frame12 = function ( Regen3, event )
															if not event.interrupted then
																Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Regen3:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen3, event )
															else
																Regen3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen3Frame12( Regen3, event )
															return 
														else
															Regen3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															Regen3:setAlpha( 0.47 )
															Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame12 )
														end
													end
													
													if event.interrupted then
														Regen3Frame11( Regen3, event )
														return 
													else
														Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame11 )
													end
												end
												
												if event.interrupted then
													Regen3Frame10( Regen3, event )
													return 
												else
													Regen3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Regen3:setAlpha( 0 )
													Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame10 )
												end
											end
											
											if event.interrupted then
												Regen3Frame9( Regen3, event )
												return 
											else
												Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen3:setAlpha( 0.25 )
												Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame9 )
											end
										end
										
										if event.interrupted then
											Regen3Frame8( Regen3, event )
											return 
										else
											Regen3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											Regen3:setAlpha( 1 )
											Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame8 )
										end
									end
									
									if event.interrupted then
										Regen3Frame7( Regen3, event )
										return 
									else
										Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame7 )
									end
								end
								
								if event.interrupted then
									Regen3Frame6( Regen3, event )
									return 
								else
									Regen3:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									Regen3:setAlpha( 0 )
									Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame6 )
								end
							end
							
							if event.interrupted then
								Regen3Frame5( Regen3, event )
								return 
							else
								Regen3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame5 )
							end
						end
						
						if event.interrupted then
							Regen3Frame4( Regen3, event )
							return 
						else
							Regen3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Regen3:setAlpha( 0.77 )
							Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame4 )
						end
					end
					
					if event.interrupted then
						Regen3Frame3( Regen3, event )
						return 
					else
						Regen3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Regen3:setAlpha( 0 )
						Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame3 )
					end
				end
				
				Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Regen3:setAlpha( 1 )
				Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame2 )
				local Regen2Frame2 = function ( Regen2, event )
					local Regen2Frame3 = function ( Regen2, event )
						local Regen2Frame4 = function ( Regen2, event )
							local Regen2Frame5 = function ( Regen2, event )
								local Regen2Frame6 = function ( Regen2, event )
									local Regen2Frame7 = function ( Regen2, event )
										local Regen2Frame8 = function ( Regen2, event )
											local Regen2Frame9 = function ( Regen2, event )
												local Regen2Frame10 = function ( Regen2, event )
													local Regen2Frame11 = function ( Regen2, event )
														local Regen2Frame12 = function ( Regen2, event )
															if not event.interrupted then
																Regen2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
															end
															Regen2:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen2, event )
															else
																Regen2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen2Frame12( Regen2, event )
															return 
														else
															Regen2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Regen2:setAlpha( 0.47 )
															Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame12 )
														end
													end
													
													if event.interrupted then
														Regen2Frame11( Regen2, event )
														return 
													else
														Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame11 )
													end
												end
												
												if event.interrupted then
													Regen2Frame10( Regen2, event )
													return 
												else
													Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Regen2:setAlpha( 0 )
													Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame10 )
												end
											end
											
											if event.interrupted then
												Regen2Frame9( Regen2, event )
												return 
											else
												Regen2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												Regen2:setAlpha( 0.25 )
												Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame9 )
											end
										end
										
										if event.interrupted then
											Regen2Frame8( Regen2, event )
											return 
										else
											Regen2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											Regen2:setAlpha( 1 )
											Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame8 )
										end
									end
									
									if event.interrupted then
										Regen2Frame7( Regen2, event )
										return 
									else
										Regen2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame7 )
									end
								end
								
								if event.interrupted then
									Regen2Frame6( Regen2, event )
									return 
								else
									Regen2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Regen2:setAlpha( 0 )
									Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame6 )
								end
							end
							
							if event.interrupted then
								Regen2Frame5( Regen2, event )
								return 
							else
								Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame5 )
							end
						end
						
						if event.interrupted then
							Regen2Frame4( Regen2, event )
							return 
						else
							Regen2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Regen2:setAlpha( 0.77 )
							Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame4 )
						end
					end
					
					if event.interrupted then
						Regen2Frame3( Regen2, event )
						return 
					else
						Regen2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Regen2:setAlpha( 0 )
						Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame3 )
					end
				end
				
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 1 )
				Regen2Frame2( Regen2, {} )
				local Regen1Frame2 = function ( Regen1, event )
					local Regen1Frame3 = function ( Regen1, event )
						local Regen1Frame4 = function ( Regen1, event )
							local Regen1Frame5 = function ( Regen1, event )
								local Regen1Frame6 = function ( Regen1, event )
									local Regen1Frame7 = function ( Regen1, event )
										local Regen1Frame8 = function ( Regen1, event )
											local Regen1Frame9 = function ( Regen1, event )
												local Regen1Frame10 = function ( Regen1, event )
													local Regen1Frame11 = function ( Regen1, event )
														local Regen1Frame12 = function ( Regen1, event )
															if not event.interrupted then
																Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Regen1:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen1, event )
															else
																Regen1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen1Frame12( Regen1, event )
															return 
														else
															Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															Regen1:setAlpha( 0.47 )
															Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame12 )
														end
													end
													
													if event.interrupted then
														Regen1Frame11( Regen1, event )
														return 
													else
														Regen1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame11 )
													end
												end
												
												if event.interrupted then
													Regen1Frame10( Regen1, event )
													return 
												else
													Regen1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													Regen1:setAlpha( 0 )
													Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame10 )
												end
											end
											
											if event.interrupted then
												Regen1Frame9( Regen1, event )
												return 
											else
												Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen1:setAlpha( 0.25 )
												Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame9 )
											end
										end
										
										if event.interrupted then
											Regen1Frame8( Regen1, event )
											return 
										else
											Regen1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Regen1:setAlpha( 1 )
											Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame8 )
										end
									end
									
									if event.interrupted then
										Regen1Frame7( Regen1, event )
										return 
									else
										Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame7 )
									end
								end
								
								if event.interrupted then
									Regen1Frame6( Regen1, event )
									return 
								else
									Regen1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Regen1:setAlpha( 0 )
									Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame6 )
								end
							end
							
							if event.interrupted then
								Regen1Frame5( Regen1, event )
								return 
							else
								Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame5 )
							end
						end
						
						if event.interrupted then
							Regen1Frame4( Regen1, event )
							return 
						else
							Regen1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Regen1:setAlpha( 0.77 )
							Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame4 )
						end
					end
					
					if event.interrupted then
						Regen1Frame3( Regen1, event )
						return 
					else
						Regen1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						Regen1:setAlpha( 0 )
						Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame3 )
					end
				end
				
				Regen1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				Regen1:setAlpha( 1 )
				Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame2 )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end,
			State4 = function ()
				self:setupElementClipCounter( 2 )
				local Regen4Frame2 = function ( Regen4, event )
					local Regen4Frame3 = function ( Regen4, event )
						local Regen4Frame4 = function ( Regen4, event )
							local Regen4Frame5 = function ( Regen4, event )
								local Regen4Frame6 = function ( Regen4, event )
									local Regen4Frame7 = function ( Regen4, event )
										if not event.interrupted then
											Regen4:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										end
										Regen4:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Regen4, event )
										else
											Regen4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Regen4Frame7( Regen4, event )
										return 
									else
										Regen4:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame7 )
									end
								end
								
								if event.interrupted then
									Regen4Frame6( Regen4, event )
									return 
								else
									Regen4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Regen4:setAlpha( 0 )
									Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame6 )
								end
							end
							
							if event.interrupted then
								Regen4Frame5( Regen4, event )
								return 
							else
								Regen4:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame5 )
							end
						end
						
						if event.interrupted then
							Regen4Frame4( Regen4, event )
							return 
						else
							Regen4:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Regen4:setAlpha( 0.5 )
							Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame4 )
						end
					end
					
					if event.interrupted then
						Regen4Frame3( Regen4, event )
						return 
					else
						Regen4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame3 )
					end
				end
				
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 0 )
				Regen4Frame2( Regen4, {} )
				local LineFrame2 = function ( Line, event )
					local LineFrame3 = function ( Line, event )
						local LineFrame4 = function ( Line, event )
							local LineFrame5 = function ( Line, event )
								local LineFrame6 = function ( Line, event )
									local LineFrame7 = function ( Line, event )
										local LineFrame8 = function ( Line, event )
											local LineFrame9 = function ( Line, event )
												local LineFrame10 = function ( Line, event )
													if not event.interrupted then
														Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Line:setLeftRight( true, false, 26.17, 30.17 )
													Line:setTopBottom( true, false, 11.16, 29.83 )
													Line:setAlpha( 1 )
													Line:setZRot( -60 )
													if event.interrupted then
														self.clipFinished( Line, event )
													else
														Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													LineFrame10( Line, event )
													return 
												else
													Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													Line:registerEventHandler( "transition_complete_keyframe", LineFrame10 )
												end
											end
											
											if event.interrupted then
												LineFrame9( Line, event )
												return 
											else
												Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Line:setLeftRight( true, false, 26.17, 30.17 )
												Line:setTopBottom( true, false, 11.16, 29.83 )
												Line:registerEventHandler( "transition_complete_keyframe", LineFrame9 )
											end
										end
										
										if event.interrupted then
											LineFrame8( Line, event )
											return 
										else
											Line:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											Line:setLeftRight( true, false, 24.42, 28.42 )
											Line:setTopBottom( true, false, 8.62, 27.29 )
											Line:setAlpha( 1 )
											Line:registerEventHandler( "transition_complete_keyframe", LineFrame8 )
										end
									end
									
									if event.interrupted then
										LineFrame7( Line, event )
										return 
									else
										Line:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Line:setLeftRight( true, false, 18.61, 22.61 )
										Line:setTopBottom( true, false, 0.14, 18.81 )
										Line:registerEventHandler( "transition_complete_keyframe", LineFrame7 )
									end
								end
								
								if event.interrupted then
									LineFrame6( Line, event )
									return 
								else
									Line:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Line:setLeftRight( true, false, 17.16, 21.16 )
									Line:setTopBottom( true, false, -1.98, 16.69 )
									Line:setAlpha( 0 )
									Line:registerEventHandler( "transition_complete_keyframe", LineFrame6 )
								end
							end
							
							if event.interrupted then
								LineFrame5( Line, event )
								return 
							else
								Line:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Line:setAlpha( 0.67 )
								Line:registerEventHandler( "transition_complete_keyframe", LineFrame5 )
							end
						end
						
						if event.interrupted then
							LineFrame4( Line, event )
							return 
						else
							Line:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Line:registerEventHandler( "transition_complete_keyframe", LineFrame4 )
						end
					end
					
					if event.interrupted then
						LineFrame3( Line, event )
						return 
					else
						Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Line:setAlpha( 1 )
						Line:registerEventHandler( "transition_complete_keyframe", LineFrame3 )
					end
				end
				
				Line:completeAnimation()
				self.Line:setLeftRight( true, false, 16, 20 )
				self.Line:setTopBottom( true, false, -3.67, 15 )
				self.Line:setAlpha( 0 )
				self.Line:setZRot( -60 )
				LineFrame2( Line, {} )
			end
		},
		State4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 0 )
				self.clipFinished( Regen5, {} )
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 1 )
				self.clipFinished( Regen4, {} )
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 1 )
				self.clipFinished( Regen3, {} )
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 1 )
				self.clipFinished( Regen2, {} )
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 1 )
				self.clipFinished( Regen1, {} )
			end,
			State0 = function ()
				self:setupElementClipCounter( 5 )
				local Regen4Frame2 = function ( Regen4, event )
					local Regen4Frame3 = function ( Regen4, event )
						local Regen4Frame4 = function ( Regen4, event )
							local Regen4Frame5 = function ( Regen4, event )
								local Regen4Frame6 = function ( Regen4, event )
									local Regen4Frame7 = function ( Regen4, event )
										local Regen4Frame8 = function ( Regen4, event )
											local Regen4Frame9 = function ( Regen4, event )
												local Regen4Frame10 = function ( Regen4, event )
													local Regen4Frame11 = function ( Regen4, event )
														local Regen4Frame12 = function ( Regen4, event )
															if not event.interrupted then
																Regen4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Regen4:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen4, event )
															else
																Regen4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen4Frame12( Regen4, event )
															return 
														else
															Regen4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
															Regen4:setAlpha( 0.47 )
															Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame12 )
														end
													end
													
													if event.interrupted then
														Regen4Frame11( Regen4, event )
														return 
													else
														Regen4:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame11 )
													end
												end
												
												if event.interrupted then
													Regen4Frame10( Regen4, event )
													return 
												else
													Regen4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													Regen4:setAlpha( 0 )
													Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame10 )
												end
											end
											
											if event.interrupted then
												Regen4Frame9( Regen4, event )
												return 
											else
												Regen4:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												Regen4:setAlpha( 0.25 )
												Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame9 )
											end
										end
										
										if event.interrupted then
											Regen4Frame8( Regen4, event )
											return 
										else
											Regen4:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Regen4:setAlpha( 1 )
											Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame8 )
										end
									end
									
									if event.interrupted then
										Regen4Frame7( Regen4, event )
										return 
									else
										Regen4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame7 )
									end
								end
								
								if event.interrupted then
									Regen4Frame6( Regen4, event )
									return 
								else
									Regen4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Regen4:setAlpha( 0 )
									Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame6 )
								end
							end
							
							if event.interrupted then
								Regen4Frame5( Regen4, event )
								return 
							else
								Regen4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame5 )
							end
						end
						
						if event.interrupted then
							Regen4Frame4( Regen4, event )
							return 
						else
							Regen4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Regen4:setAlpha( 0.77 )
							Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame4 )
						end
					end
					
					if event.interrupted then
						Regen4Frame3( Regen4, event )
						return 
					else
						Regen4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Regen4:setAlpha( 0 )
						Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame3 )
					end
				end
				
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 1 )
				Regen4Frame2( Regen4, {} )
				local Regen3Frame2 = function ( Regen3, event )
					local Regen3Frame3 = function ( Regen3, event )
						local Regen3Frame4 = function ( Regen3, event )
							local Regen3Frame5 = function ( Regen3, event )
								local Regen3Frame6 = function ( Regen3, event )
									local Regen3Frame7 = function ( Regen3, event )
										local Regen3Frame8 = function ( Regen3, event )
											local Regen3Frame9 = function ( Regen3, event )
												local Regen3Frame10 = function ( Regen3, event )
													local Regen3Frame11 = function ( Regen3, event )
														local Regen3Frame12 = function ( Regen3, event )
															if not event.interrupted then
																Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Regen3:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen3, event )
															else
																Regen3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen3Frame12( Regen3, event )
															return 
														else
															Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															Regen3:setAlpha( 0.47 )
															Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame12 )
														end
													end
													
													if event.interrupted then
														Regen3Frame11( Regen3, event )
														return 
													else
														Regen3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame11 )
													end
												end
												
												if event.interrupted then
													Regen3Frame10( Regen3, event )
													return 
												else
													Regen3:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													Regen3:setAlpha( 0 )
													Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame10 )
												end
											end
											
											if event.interrupted then
												Regen3Frame9( Regen3, event )
												return 
											else
												Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen3:setAlpha( 0.25 )
												Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame9 )
											end
										end
										
										if event.interrupted then
											Regen3Frame8( Regen3, event )
											return 
										else
											Regen3:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											Regen3:setAlpha( 1 )
											Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame8 )
										end
									end
									
									if event.interrupted then
										Regen3Frame7( Regen3, event )
										return 
									else
										Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame7 )
									end
								end
								
								if event.interrupted then
									Regen3Frame6( Regen3, event )
									return 
								else
									Regen3:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									Regen3:setAlpha( 0 )
									Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame6 )
								end
							end
							
							if event.interrupted then
								Regen3Frame5( Regen3, event )
								return 
							else
								Regen3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Regen3:setAlpha( 0.77 )
								Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame5 )
							end
						end
						
						if event.interrupted then
							Regen3Frame4( Regen3, event )
							return 
						else
							Regen3:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame4 )
						end
					end
					
					if event.interrupted then
						Regen3Frame3( Regen3, event )
						return 
					else
						Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Regen3:setAlpha( 0 )
						Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame3 )
					end
				end
				
				Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Regen3:setAlpha( 1 )
				Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame2 )
				local Regen2Frame2 = function ( Regen2, event )
					local Regen2Frame3 = function ( Regen2, event )
						local Regen2Frame4 = function ( Regen2, event )
							local Regen2Frame5 = function ( Regen2, event )
								local Regen2Frame6 = function ( Regen2, event )
									local Regen2Frame7 = function ( Regen2, event )
										local Regen2Frame8 = function ( Regen2, event )
											local Regen2Frame9 = function ( Regen2, event )
												local Regen2Frame10 = function ( Regen2, event )
													local Regen2Frame11 = function ( Regen2, event )
														local Regen2Frame12 = function ( Regen2, event )
															if not event.interrupted then
																Regen2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
															end
															Regen2:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen2, event )
															else
																Regen2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen2Frame12( Regen2, event )
															return 
														else
															Regen2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															Regen2:setAlpha( 0.47 )
															Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame12 )
														end
													end
													
													if event.interrupted then
														Regen2Frame11( Regen2, event )
														return 
													else
														Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Regen2:setAlpha( 0 )
														Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame11 )
													end
												end
												
												if event.interrupted then
													Regen2Frame10( Regen2, event )
													return 
												else
													Regen2:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame10 )
												end
											end
											
											if event.interrupted then
												Regen2Frame9( Regen2, event )
												return 
											else
												Regen2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen2:setAlpha( 0.25 )
												Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame9 )
											end
										end
										
										if event.interrupted then
											Regen2Frame8( Regen2, event )
											return 
										else
											Regen2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											Regen2:setAlpha( 1 )
											Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame8 )
										end
									end
									
									if event.interrupted then
										Regen2Frame7( Regen2, event )
										return 
									else
										Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame7 )
									end
								end
								
								if event.interrupted then
									Regen2Frame6( Regen2, event )
									return 
								else
									Regen2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Regen2:setAlpha( 0 )
									Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame6 )
								end
							end
							
							if event.interrupted then
								Regen2Frame5( Regen2, event )
								return 
							else
								Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame5 )
							end
						end
						
						if event.interrupted then
							Regen2Frame4( Regen2, event )
							return 
						else
							Regen2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Regen2:setAlpha( 0.77 )
							Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame4 )
						end
					end
					
					if event.interrupted then
						Regen2Frame3( Regen2, event )
						return 
					else
						Regen2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Regen2:setAlpha( 0 )
						Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame3 )
					end
				end
				
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 1 )
				Regen2Frame2( Regen2, {} )
				local Regen1Frame2 = function ( Regen1, event )
					local Regen1Frame3 = function ( Regen1, event )
						local Regen1Frame4 = function ( Regen1, event )
							local Regen1Frame5 = function ( Regen1, event )
								local Regen1Frame6 = function ( Regen1, event )
									local Regen1Frame7 = function ( Regen1, event )
										local Regen1Frame8 = function ( Regen1, event )
											local Regen1Frame9 = function ( Regen1, event )
												local Regen1Frame10 = function ( Regen1, event )
													local Regen1Frame11 = function ( Regen1, event )
														if not event.interrupted then
															Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
														end
														Regen1:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Regen1, event )
														else
															Regen1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Regen1Frame11( Regen1, event )
														return 
													else
														Regen1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														Regen1:setAlpha( 0.47 )
														Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame11 )
													end
												end
												
												if event.interrupted then
													Regen1Frame10( Regen1, event )
													return 
												else
													Regen1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame10 )
												end
											end
											
											if event.interrupted then
												Regen1Frame9( Regen1, event )
												return 
											else
												Regen1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
												Regen1:setAlpha( 0 )
												Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame9 )
											end
										end
										
										if event.interrupted then
											Regen1Frame8( Regen1, event )
											return 
										else
											Regen1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											Regen1:setAlpha( 0.25 )
											Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame8 )
										end
									end
									
									if event.interrupted then
										Regen1Frame7( Regen1, event )
										return 
									else
										Regen1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame7 )
									end
								end
								
								if event.interrupted then
									Regen1Frame6( Regen1, event )
									return 
								else
									Regen1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									Regen1:setAlpha( 0 )
									Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame6 )
								end
							end
							
							if event.interrupted then
								Regen1Frame5( Regen1, event )
								return 
							else
								Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame5 )
							end
						end
						
						if event.interrupted then
							Regen1Frame4( Regen1, event )
							return 
						else
							Regen1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							Regen1:setAlpha( 0.77 )
							Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame4 )
						end
					end
					
					if event.interrupted then
						Regen1Frame3( Regen1, event )
						return 
					else
						Regen1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Regen1:setAlpha( 0 )
						Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame3 )
					end
				end
				
				Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Regen1:setAlpha( 1 )
				Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame2 )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end,
			State5 = function ()
				self:setupElementClipCounter( 2 )
				local Regen5Frame2 = function ( Regen5, event )
					local Regen5Frame3 = function ( Regen5, event )
						local Regen5Frame4 = function ( Regen5, event )
							local Regen5Frame5 = function ( Regen5, event )
								local Regen5Frame6 = function ( Regen5, event )
									local Regen5Frame7 = function ( Regen5, event )
										if not event.interrupted then
											Regen5:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
										end
										Regen5:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( Regen5, event )
										else
											Regen5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										Regen5Frame7( Regen5, event )
										return 
									else
										Regen5:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
										Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame7 )
									end
								end
								
								if event.interrupted then
									Regen5Frame6( Regen5, event )
									return 
								else
									Regen5:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Regen5:setAlpha( 0 )
									Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame6 )
								end
							end
							
							if event.interrupted then
								Regen5Frame5( Regen5, event )
								return 
							else
								Regen5:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame5 )
							end
						end
						
						if event.interrupted then
							Regen5Frame4( Regen5, event )
							return 
						else
							Regen5:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							Regen5:setAlpha( 0.5 )
							Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame4 )
						end
					end
					
					if event.interrupted then
						Regen5Frame3( Regen5, event )
						return 
					else
						Regen5:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame3 )
					end
				end
				
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 0 )
				Regen5Frame2( Regen5, {} )
				local LineFrame2 = function ( Line, event )
					local LineFrame3 = function ( Line, event )
						local LineFrame4 = function ( Line, event )
							local LineFrame5 = function ( Line, event )
								local LineFrame6 = function ( Line, event )
									local LineFrame7 = function ( Line, event )
										local LineFrame8 = function ( Line, event )
											local LineFrame9 = function ( Line, event )
												local LineFrame10 = function ( Line, event )
													if not event.interrupted then
														Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Line:setLeftRight( true, false, 59, 63 )
													Line:setTopBottom( true, false, 10.66, 29.33 )
													Line:setAlpha( 1 )
													Line:setZRot( -120 )
													if event.interrupted then
														self.clipFinished( Line, event )
													else
														Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													LineFrame10( Line, event )
													return 
												else
													Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													Line:registerEventHandler( "transition_complete_keyframe", LineFrame10 )
												end
											end
											
											if event.interrupted then
												LineFrame9( Line, event )
												return 
											else
												Line:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												Line:setLeftRight( true, false, 59, 63 )
												Line:setTopBottom( true, false, 10.66, 29.33 )
												Line:registerEventHandler( "transition_complete_keyframe", LineFrame9 )
											end
										end
										
										if event.interrupted then
											LineFrame8( Line, event )
											return 
										else
											Line:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
											Line:setLeftRight( true, false, 60.37, 64.37 )
											Line:setTopBottom( true, false, 8.15, 26.82 )
											Line:setAlpha( 1 )
											Line:registerEventHandler( "transition_complete_keyframe", LineFrame8 )
										end
									end
									
									if event.interrupted then
										LineFrame7( Line, event )
										return 
									else
										Line:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										Line:setLeftRight( true, false, 64.94, 68.94 )
										Line:setTopBottom( true, false, -0.23, 18.44 )
										Line:registerEventHandler( "transition_complete_keyframe", LineFrame7 )
									end
								end
								
								if event.interrupted then
									LineFrame6( Line, event )
									return 
								else
									Line:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Line:setLeftRight( true, false, 66.09, 70.09 )
									Line:setTopBottom( true, false, -2.33, 16.34 )
									Line:setAlpha( 0 )
									Line:registerEventHandler( "transition_complete_keyframe", LineFrame6 )
								end
							end
							
							if event.interrupted then
								LineFrame5( Line, event )
								return 
							else
								Line:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Line:setTopBottom( true, false, -4, 14.67 )
								Line:setAlpha( 0.67 )
								Line:registerEventHandler( "transition_complete_keyframe", LineFrame5 )
							end
						end
						
						if event.interrupted then
							LineFrame4( Line, event )
							return 
						else
							Line:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							Line:registerEventHandler( "transition_complete_keyframe", LineFrame4 )
						end
					end
					
					if event.interrupted then
						LineFrame3( Line, event )
						return 
					else
						Line:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						Line:setAlpha( 1 )
						Line:registerEventHandler( "transition_complete_keyframe", LineFrame3 )
					end
				end
				
				Line:completeAnimation()
				self.Line:setLeftRight( true, false, 67, 71 )
				self.Line:setTopBottom( true, false, -4, 14.66 )
				self.Line:setAlpha( 0 )
				self.Line:setZRot( -120 )
				LineFrame2( Line, {} )
			end
		},
		State5 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local Regen5Frame2 = function ( Regen5, event )
					local Regen5Frame3 = function ( Regen5, event )
						if not event.interrupted then
							Regen5:beginAnimation( "keyframe", 1150, false, false, CoD.TweenType.Linear )
						end
						Regen5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Regen5, event )
						else
							Regen5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Regen5Frame3( Regen5, event )
						return 
					else
						Regen5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame3 )
					end
				end
				
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 1 )
				Regen5Frame2( Regen5, {} )
				local Regen4Frame2 = function ( Regen4, event )
					local Regen4Frame3 = function ( Regen4, event )
						if not event.interrupted then
							Regen4:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						Regen4:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Regen4, event )
						else
							Regen4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Regen4Frame3( Regen4, event )
						return 
					else
						Regen4:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame3 )
					end
				end
				
				Regen4:completeAnimation()
				self.Regen4:setAlpha( 1 )
				Regen4Frame2( Regen4, {} )
				local Regen3Frame2 = function ( Regen3, event )
					local Regen3Frame3 = function ( Regen3, event )
						if not event.interrupted then
							Regen3:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
						end
						Regen3:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Regen3, event )
						else
							Regen3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Regen3Frame3( Regen3, event )
						return 
					else
						Regen3:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame3 )
					end
				end
				
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 1 )
				Regen3Frame2( Regen3, {} )
				local Regen2Frame2 = function ( Regen2, event )
					local Regen2Frame3 = function ( Regen2, event )
						if not event.interrupted then
							Regen2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						Regen2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Regen2, event )
						else
							Regen2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Regen2Frame3( Regen2, event )
						return 
					else
						Regen2:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame3 )
					end
				end
				
				Regen2:completeAnimation()
				self.Regen2:setAlpha( 1 )
				Regen2Frame2( Regen2, {} )
				local Regen1Frame2 = function ( Regen1, event )
					local Regen1Frame3 = function ( Regen1, event )
						if not event.interrupted then
							Regen1:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						end
						Regen1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Regen1, event )
						else
							Regen1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Regen1Frame3( Regen1, event )
						return 
					else
						Regen1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame3 )
					end
				end
				
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 1 )
				Regen1Frame2( Regen1, {} )
			end,
			State0 = function ()
				self:setupElementClipCounter( 6 )
				local Regen5Frame2 = function ( Regen5, event )
					local Regen5Frame3 = function ( Regen5, event )
						local Regen5Frame4 = function ( Regen5, event )
							local Regen5Frame5 = function ( Regen5, event )
								local Regen5Frame6 = function ( Regen5, event )
									local Regen5Frame7 = function ( Regen5, event )
										local Regen5Frame8 = function ( Regen5, event )
											local Regen5Frame9 = function ( Regen5, event )
												local Regen5Frame10 = function ( Regen5, event )
													local Regen5Frame11 = function ( Regen5, event )
														local Regen5Frame12 = function ( Regen5, event )
															if not event.interrupted then
																Regen5:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Regen5:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen5, event )
															else
																Regen5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen5Frame12( Regen5, event )
															return 
														else
															Regen5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															Regen5:setAlpha( 0.47 )
															Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame12 )
														end
													end
													
													if event.interrupted then
														Regen5Frame11( Regen5, event )
														return 
													else
														Regen5:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame11 )
													end
												end
												
												if event.interrupted then
													Regen5Frame10( Regen5, event )
													return 
												else
													Regen5:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
													Regen5:setAlpha( 0 )
													Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame10 )
												end
											end
											
											if event.interrupted then
												Regen5Frame9( Regen5, event )
												return 
											else
												Regen5:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen5:setAlpha( 0.25 )
												Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame9 )
											end
										end
										
										if event.interrupted then
											Regen5Frame8( Regen5, event )
											return 
										else
											Regen5:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											Regen5:setAlpha( 1 )
											Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame8 )
										end
									end
									
									if event.interrupted then
										Regen5Frame7( Regen5, event )
										return 
									else
										Regen5:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame7 )
									end
								end
								
								if event.interrupted then
									Regen5Frame6( Regen5, event )
									return 
								else
									Regen5:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									Regen5:setAlpha( 0 )
									Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame6 )
								end
							end
							
							if event.interrupted then
								Regen5Frame5( Regen5, event )
								return 
							else
								Regen5:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame5 )
							end
						end
						
						if event.interrupted then
							Regen5Frame4( Regen5, event )
							return 
						else
							Regen5:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Regen5:setAlpha( 0.77 )
							Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame4 )
						end
					end
					
					if event.interrupted then
						Regen5Frame3( Regen5, event )
						return 
					else
						Regen5:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Regen5:setAlpha( 0 )
						Regen5:registerEventHandler( "transition_complete_keyframe", Regen5Frame3 )
					end
				end
				
				Regen5:completeAnimation()
				self.Regen5:setAlpha( 1 )
				Regen5Frame2( Regen5, {} )
				local Regen4Frame2 = function ( Regen4, event )
					local Regen4Frame3 = function ( Regen4, event )
						local Regen4Frame4 = function ( Regen4, event )
							local Regen4Frame5 = function ( Regen4, event )
								local Regen4Frame6 = function ( Regen4, event )
									local Regen4Frame7 = function ( Regen4, event )
										local Regen4Frame8 = function ( Regen4, event )
											local Regen4Frame9 = function ( Regen4, event )
												local Regen4Frame10 = function ( Regen4, event )
													local Regen4Frame11 = function ( Regen4, event )
														local Regen4Frame12 = function ( Regen4, event )
															if not event.interrupted then
																Regen4:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
															end
															Regen4:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen4, event )
															else
																Regen4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen4Frame12( Regen4, event )
															return 
														else
															Regen4:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Regen4:setAlpha( 0.47 )
															Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame12 )
														end
													end
													
													if event.interrupted then
														Regen4Frame11( Regen4, event )
														return 
													else
														Regen4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame11 )
													end
												end
												
												if event.interrupted then
													Regen4Frame10( Regen4, event )
													return 
												else
													Regen4:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Regen4:setAlpha( 0 )
													Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame10 )
												end
											end
											
											if event.interrupted then
												Regen4Frame9( Regen4, event )
												return 
											else
												Regen4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen4:setAlpha( 0.25 )
												Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame9 )
											end
										end
										
										if event.interrupted then
											Regen4Frame8( Regen4, event )
											return 
										else
											Regen4:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Regen4:setAlpha( 1 )
											Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame8 )
										end
									end
									
									if event.interrupted then
										Regen4Frame7( Regen4, event )
										return 
									else
										Regen4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame7 )
									end
								end
								
								if event.interrupted then
									Regen4Frame6( Regen4, event )
									return 
								else
									Regen4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									Regen4:setAlpha( 0 )
									Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame6 )
								end
							end
							
							if event.interrupted then
								Regen4Frame5( Regen4, event )
								return 
							else
								Regen4:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame5 )
							end
						end
						
						if event.interrupted then
							Regen4Frame4( Regen4, event )
							return 
						else
							Regen4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Regen4:setAlpha( 0.77 )
							Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame4 )
						end
					end
					
					if event.interrupted then
						Regen4Frame3( Regen4, event )
						return 
					else
						Regen4:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						Regen4:setAlpha( 0 )
						Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame3 )
					end
				end
				
				Regen4:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				Regen4:setAlpha( 1 )
				Regen4:registerEventHandler( "transition_complete_keyframe", Regen4Frame2 )
				local Regen3Frame2 = function ( Regen3, event )
					local Regen3Frame3 = function ( Regen3, event )
						local Regen3Frame4 = function ( Regen3, event )
							local Regen3Frame5 = function ( Regen3, event )
								local Regen3Frame6 = function ( Regen3, event )
									local Regen3Frame7 = function ( Regen3, event )
										local Regen3Frame8 = function ( Regen3, event )
											local Regen3Frame9 = function ( Regen3, event )
												local Regen3Frame10 = function ( Regen3, event )
													local Regen3Frame11 = function ( Regen3, event )
														if not event.interrupted then
															Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
														end
														Regen3:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( Regen3, event )
														else
															Regen3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														Regen3Frame11( Regen3, event )
														return 
													else
														Regen3:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														Regen3:setAlpha( 0.47 )
														Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame11 )
													end
												end
												
												if event.interrupted then
													Regen3Frame10( Regen3, event )
													return 
												else
													Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame10 )
												end
											end
											
											if event.interrupted then
												Regen3Frame9( Regen3, event )
												return 
											else
												Regen3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												Regen3:setAlpha( 0 )
												Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame9 )
											end
										end
										
										if event.interrupted then
											Regen3Frame8( Regen3, event )
											return 
										else
											Regen3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
											Regen3:setAlpha( 0.25 )
											Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame8 )
										end
									end
									
									if event.interrupted then
										Regen3Frame7( Regen3, event )
										return 
									else
										Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame7 )
									end
								end
								
								if event.interrupted then
									Regen3Frame6( Regen3, event )
									return 
								else
									Regen3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									Regen3:setAlpha( 0 )
									Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame6 )
								end
							end
							
							if event.interrupted then
								Regen3Frame5( Regen3, event )
								return 
							else
								Regen3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame5 )
							end
						end
						
						if event.interrupted then
							Regen3Frame4( Regen3, event )
							return 
						else
							Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Regen3:setAlpha( 0.77 )
							Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame4 )
						end
					end
					
					if event.interrupted then
						Regen3Frame3( Regen3, event )
						return 
					else
						Regen3:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						Regen3:setAlpha( 0 )
						Regen3:registerEventHandler( "transition_complete_keyframe", Regen3Frame3 )
					end
				end
				
				Regen3:completeAnimation()
				self.Regen3:setAlpha( 1 )
				Regen3Frame2( Regen3, {} )
				local Regen2Frame2 = function ( Regen2, event )
					local Regen2Frame3 = function ( Regen2, event )
						local Regen2Frame4 = function ( Regen2, event )
							local Regen2Frame5 = function ( Regen2, event )
								local Regen2Frame6 = function ( Regen2, event )
									local Regen2Frame7 = function ( Regen2, event )
										local Regen2Frame8 = function ( Regen2, event )
											local Regen2Frame9 = function ( Regen2, event )
												local Regen2Frame10 = function ( Regen2, event )
													local Regen2Frame11 = function ( Regen2, event )
														local Regen2Frame12 = function ( Regen2, event )
															if not event.interrupted then
																Regen2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															end
															Regen2:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen2, event )
															else
																Regen2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen2Frame12( Regen2, event )
															return 
														else
															Regen2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															Regen2:setAlpha( 0.47 )
															Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame12 )
														end
													end
													
													if event.interrupted then
														Regen2Frame11( Regen2, event )
														return 
													else
														Regen2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame11 )
													end
												end
												
												if event.interrupted then
													Regen2Frame10( Regen2, event )
													return 
												else
													Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													Regen2:setAlpha( 0 )
													Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame10 )
												end
											end
											
											if event.interrupted then
												Regen2Frame9( Regen2, event )
												return 
											else
												Regen2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												Regen2:setAlpha( 0.25 )
												Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame9 )
											end
										end
										
										if event.interrupted then
											Regen2Frame8( Regen2, event )
											return 
										else
											Regen2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Regen2:setAlpha( 1 )
											Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame8 )
										end
									end
									
									if event.interrupted then
										Regen2Frame7( Regen2, event )
										return 
									else
										Regen2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame7 )
									end
								end
								
								if event.interrupted then
									Regen2Frame6( Regen2, event )
									return 
								else
									Regen2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Regen2:setAlpha( 0 )
									Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame6 )
								end
							end
							
							if event.interrupted then
								Regen2Frame5( Regen2, event )
								return 
							else
								Regen2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame5 )
							end
						end
						
						if event.interrupted then
							Regen2Frame4( Regen2, event )
							return 
						else
							Regen2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Regen2:setAlpha( 0.77 )
							Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame4 )
						end
					end
					
					if event.interrupted then
						Regen2Frame3( Regen2, event )
						return 
					else
						Regen2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						Regen2:setAlpha( 0 )
						Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame3 )
					end
				end
				
				Regen2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Regen2:setAlpha( 1 )
				Regen2:registerEventHandler( "transition_complete_keyframe", Regen2Frame2 )
				local Regen1Frame2 = function ( Regen1, event )
					local Regen1Frame3 = function ( Regen1, event )
						local Regen1Frame4 = function ( Regen1, event )
							local Regen1Frame5 = function ( Regen1, event )
								local Regen1Frame6 = function ( Regen1, event )
									local Regen1Frame7 = function ( Regen1, event )
										local Regen1Frame8 = function ( Regen1, event )
											local Regen1Frame9 = function ( Regen1, event )
												local Regen1Frame10 = function ( Regen1, event )
													local Regen1Frame11 = function ( Regen1, event )
														local Regen1Frame12 = function ( Regen1, event )
															if not event.interrupted then
																Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															Regen1:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Regen1, event )
															else
																Regen1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															Regen1Frame12( Regen1, event )
															return 
														else
															Regen1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															Regen1:setAlpha( 0.47 )
															Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame12 )
														end
													end
													
													if event.interrupted then
														Regen1Frame11( Regen1, event )
														return 
													else
														Regen1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame11 )
													end
												end
												
												if event.interrupted then
													Regen1Frame10( Regen1, event )
													return 
												else
													Regen1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													Regen1:setAlpha( 0 )
													Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame10 )
												end
											end
											
											if event.interrupted then
												Regen1Frame9( Regen1, event )
												return 
											else
												Regen1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												Regen1:setAlpha( 0.25 )
												Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame9 )
											end
										end
										
										if event.interrupted then
											Regen1Frame8( Regen1, event )
											return 
										else
											Regen1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											Regen1:setAlpha( 1 )
											Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame8 )
										end
									end
									
									if event.interrupted then
										Regen1Frame7( Regen1, event )
										return 
									else
										Regen1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame7 )
									end
								end
								
								if event.interrupted then
									Regen1Frame6( Regen1, event )
									return 
								else
									Regen1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Regen1:setAlpha( 0 )
									Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame6 )
								end
							end
							
							if event.interrupted then
								Regen1Frame5( Regen1, event )
								return 
							else
								Regen1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame5 )
							end
						end
						
						if event.interrupted then
							Regen1Frame4( Regen1, event )
							return 
						else
							Regen1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Regen1:setAlpha( 0.77 )
							Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame4 )
						end
					end
					
					if event.interrupted then
						Regen1Frame3( Regen1, event )
						return 
					else
						Regen1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Regen1:setAlpha( 0 )
						Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame3 )
					end
				end
				
				Regen1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				Regen1:setAlpha( 1 )
				Regen1:registerEventHandler( "transition_complete_keyframe", Regen1Frame2 )
				Line:completeAnimation()
				self.Line:setAlpha( 0 )
				self.clipFinished( Line, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

