-- b778ae14ed888878a6b5d38c225e9645
-- This hash is used for caching, delete to decompile the file again

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
	Regen5Back:setAlpha( 0.3 )
	Regen5Back:setZRot( -120 )
	Regen5Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	self:addElement( Regen5Back )
	self.Regen5Back = Regen5Back
	
	local Regen4Back = LUI.UIImage.new()
	Regen4Back:setLeftRight( true, false, 9.5, 46.83 )
	Regen4Back:setTopBottom( true, false, 17, 23.67 )
	Regen4Back:setAlpha( 0.3 )
	Regen4Back:setZRot( -150 )
	Regen4Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair2" ) )
	self:addElement( Regen4Back )
	self.Regen4Back = Regen4Back
	
	local Regen3Back = LUI.UIImage.new()
	Regen3Back:setLeftRight( true, false, 9, 13 )
	Regen3Back:setTopBottom( true, false, 29.83, 67.17 )
	Regen3Back:setAlpha( 0.3 )
	Regen3Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	self:addElement( Regen3Back )
	self.Regen3Back = Regen3Back
	
	local Regen2Back = LUI.UIImage.new()
	Regen2Back:setLeftRight( true, false, 9.5, 46.83 )
	Regen2Back:setTopBottom( true, false, 72.5, 79.17 )
	Regen2Back:setAlpha( 0.3 )
	Regen2Back:setZRot( -30 )
	Regen2Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair2" ) )
	self:addElement( Regen2Back )
	self.Regen2Back = Regen2Back
	
	local Regen1Back = LUI.UIImage.new()
	Regen1Back:setLeftRight( true, false, 59, 63 )
	Regen1Back:setTopBottom( true, false, 58.34, 95.67 )
	Regen1Back:setAlpha( 0.3 )
	Regen1Back:setZRot( 120 )
	Regen1Back:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	self:addElement( Regen1Back )
	self.Regen1Back = Regen1Back
	
	local Regen5 = LUI.UIImage.new()
	Regen5:setLeftRight( true, false, 58.5, 62.5 )
	Regen5:setTopBottom( true, false, 0.33, 37.67 )
	Regen5:setAlpha( 0 )
	Regen5:setZRot( -120 )
	Regen5:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	self:addElement( Regen5 )
	self.Regen5 = Regen5
	
	local Regen4 = LUI.UIImage.new()
	Regen4:setLeftRight( true, false, 9.5, 46.83 )
	Regen4:setTopBottom( true, false, 17, 23.67 )
	Regen4:setAlpha( 0 )
	Regen4:setZRot( -150 )
	Regen4:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair2" ) )
	self:addElement( Regen4 )
	self.Regen4 = Regen4
	
	local Regen3 = LUI.UIImage.new()
	Regen3:setLeftRight( true, false, 9, 13 )
	Regen3:setTopBottom( true, false, 29.83, 67.17 )
	Regen3:setAlpha( 0 )
	Regen3:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	self:addElement( Regen3 )
	self.Regen3 = Regen3
	
	local Regen2 = LUI.UIImage.new()
	Regen2:setLeftRight( true, false, 9.5, 46.83 )
	Regen2:setTopBottom( true, false, 72.5, 79.17 )
	Regen2:setAlpha( 0 )
	Regen2:setZRot( -30 )
	Regen2:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair2" ) )
	self:addElement( Regen2 )
	self.Regen2 = Regen2
	
	local Regen1 = LUI.UIImage.new()
	Regen1:setLeftRight( true, false, 59, 63 )
	Regen1:setTopBottom( true, false, 58.34, 95.67 )
	Regen1:setAlpha( 0 )
	Regen1:setZRot( 120 )
	Regen1:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_repair1" ) )
	self:addElement( Regen1 )
	self.Regen1 = Regen1
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( true, false, 58.5, 62.5 )
	Line:setTopBottom( true, false, 67.67, 86.34 )
	Line:setAlpha( 0 )
	Line:setZRot( 120 )
	Line:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityhash" ) )
	self:addElement( Line )
	self.Line = Line
	
	local sfx = LUI.UIElement.new()
	sfx:setLeftRight( true, false, 42.5, 90.5 )
	sfx:setTopBottom( true, false, 219, 267 )
	sfx:setPlaySoundDirect( true )
	self:addElement( sfx )
	self.sfx = sfx
	
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
													Line:setTopBottom( true, false, 67.67, 86.34 )
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
												Line:setTopBottom( true, false, 67.67, 86.34 )
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
				self.Regen1:setAlpha( 1 )
				self.clipFinished( Regen1, {} )
				sfx:completeAnimation()
				self.sfx:playSound( "gdt_cybercore_regen_tick_1" )
				self.clipFinished( sfx, {} )
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
				self.Regen2:setAlpha( 1 )
				self.clipFinished( Regen2, {} )
				Regen1:completeAnimation()
				self.Regen1:setAlpha( 1 )
				self.clipFinished( Regen1, {} )
				sfx:completeAnimation()
				self.sfx:playSound( "gdt_cybercore_regen_tick_2" )
				self.clipFinished( sfx, {} )
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
				local f49_local1 = function ( f61_arg0, f61_arg1 )
					local f61_local0 = function ( f62_arg0, f62_arg1 )
						local f62_local0 = function ( f63_arg0, f63_arg1 )
							local f63_local0 = function ( f64_arg0, f64_arg1 )
								local f64_local0 = function ( f65_arg0, f65_arg1 )
									local f65_local0 = function ( f66_arg0, f66_arg1 )
										local f66_local0 = function ( f67_arg0, f67_arg1 )
											local f67_local0 = function ( f68_arg0, f68_arg1 )
												local f68_local0 = function ( f69_arg0, f69_arg1 )
													local f69_local0 = function ( f70_arg0, f70_arg1 )
														local f70_local0 = function ( f71_arg0, f71_arg1 )
															if not f71_arg1.interrupted then
																f71_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															f71_arg0:setAlpha( 0 )
															if f71_arg1.interrupted then
																self.clipFinished( f71_arg0, f71_arg1 )
															else
																f71_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f70_arg1.interrupted then
															f70_local0( f70_arg0, f70_arg1 )
															return 
														else
															f70_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
															f70_arg0:setAlpha( 0.47 )
															f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
														end
													end
													
													if f69_arg1.interrupted then
														f69_local0( f69_arg0, f69_arg1 )
														return 
													else
														f69_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
													end
												end
												
												if f68_arg1.interrupted then
													f68_local0( f68_arg0, f68_arg1 )
													return 
												else
													f68_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
													f68_arg0:setAlpha( 0 )
													f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
												end
											end
											
											if f67_arg1.interrupted then
												f67_local0( f67_arg0, f67_arg1 )
												return 
											else
												f67_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												f67_arg0:setAlpha( 0.25 )
												f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
											end
										end
										
										if f66_arg1.interrupted then
											f66_local0( f66_arg0, f66_arg1 )
											return 
										else
											f66_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
											f66_arg0:setAlpha( 1 )
											f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
										end
									end
									
									if f65_arg1.interrupted then
										f65_local0( f65_arg0, f65_arg1 )
										return 
									else
										f65_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
									end
								end
								
								if f64_arg1.interrupted then
									f64_local0( f64_arg0, f64_arg1 )
									return 
								else
									f64_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f64_arg0:setAlpha( 0 )
									f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
								end
							end
							
							if f63_arg1.interrupted then
								f63_local0( f63_arg0, f63_arg1 )
								return 
							else
								f63_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
							end
						end
						
						if f62_arg1.interrupted then
							f62_local0( f62_arg0, f62_arg1 )
							return 
						else
							f62_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							f62_arg0:setAlpha( 0.77 )
							f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
						end
					end
					
					if f61_arg1.interrupted then
						f61_local0( f61_arg0, f61_arg1 )
						return 
					else
						f61_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f61_arg0:setAlpha( 0 )
						f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
					end
				end
				
				Regen1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				Regen1:setAlpha( 1 )
				Regen1:registerEventHandler( "transition_complete_keyframe", f49_local1 )
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
													Line:setTopBottom( true, false, 38.67, 57.34 )
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
												Line:setTopBottom( true, false, 38.67, 57.34 )
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
				self:setupElementClipCounter( 6 )
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
				sfx:completeAnimation()
				self.sfx:playSound( "gdt_cybercore_regen_tick_3" )
				self.clipFinished( sfx, {} )
			end,
			State0 = function ()
				self:setupElementClipCounter( 4 )
				local f89_local0 = function ( f90_arg0, f90_arg1 )
					local f90_local0 = function ( f91_arg0, f91_arg1 )
						local f91_local0 = function ( f92_arg0, f92_arg1 )
							local f92_local0 = function ( f93_arg0, f93_arg1 )
								local f93_local0 = function ( f94_arg0, f94_arg1 )
									local f94_local0 = function ( f95_arg0, f95_arg1 )
										local f95_local0 = function ( f96_arg0, f96_arg1 )
											local f96_local0 = function ( f97_arg0, f97_arg1 )
												local f97_local0 = function ( f98_arg0, f98_arg1 )
													local f98_local0 = function ( f99_arg0, f99_arg1 )
														local f99_local0 = function ( f100_arg0, f100_arg1 )
															if not f100_arg1.interrupted then
																f100_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															f100_arg0:setAlpha( 0 )
															if f100_arg1.interrupted then
																self.clipFinished( f100_arg0, f100_arg1 )
															else
																f100_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f99_arg1.interrupted then
															f99_local0( f99_arg0, f99_arg1 )
															return 
														else
															f99_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															f99_arg0:setAlpha( 0.47 )
															f99_arg0:registerEventHandler( "transition_complete_keyframe", f99_local0 )
														end
													end
													
													if f98_arg1.interrupted then
														f98_local0( f98_arg0, f98_arg1 )
														return 
													else
														f98_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														f98_arg0:registerEventHandler( "transition_complete_keyframe", f98_local0 )
													end
												end
												
												if f97_arg1.interrupted then
													f97_local0( f97_arg0, f97_arg1 )
													return 
												else
													f97_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													f97_arg0:setAlpha( 0 )
													f97_arg0:registerEventHandler( "transition_complete_keyframe", f97_local0 )
												end
											end
											
											if f96_arg1.interrupted then
												f96_local0( f96_arg0, f96_arg1 )
												return 
											else
												f96_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												f96_arg0:setAlpha( 0.25 )
												f96_arg0:registerEventHandler( "transition_complete_keyframe", f96_local0 )
											end
										end
										
										if f95_arg1.interrupted then
											f95_local0( f95_arg0, f95_arg1 )
											return 
										else
											f95_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											f95_arg0:setAlpha( 1 )
											f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
										end
									end
									
									if f94_arg1.interrupted then
										f94_local0( f94_arg0, f94_arg1 )
										return 
									else
										f94_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
									end
								end
								
								if f93_arg1.interrupted then
									f93_local0( f93_arg0, f93_arg1 )
									return 
								else
									f93_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									f93_arg0:setAlpha( 0 )
									f93_arg0:registerEventHandler( "transition_complete_keyframe", f93_local0 )
								end
							end
							
							if f92_arg1.interrupted then
								f92_local0( f92_arg0, f92_arg1 )
								return 
							else
								f92_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
							end
						end
						
						if f91_arg1.interrupted then
							f91_local0( f91_arg0, f91_arg1 )
							return 
						else
							f91_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							f91_arg0:setAlpha( 0.77 )
							f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
						end
					end
					
					if f90_arg1.interrupted then
						f90_local0( f90_arg0, f90_arg1 )
						return 
					else
						f90_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f90_arg0:setAlpha( 0 )
						f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
					end
				end
				
				Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Regen3:setAlpha( 1 )
				Regen3:registerEventHandler( "transition_complete_keyframe", f89_local0 )
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
				local f89_local2 = function ( f112_arg0, f112_arg1 )
					local f112_local0 = function ( f113_arg0, f113_arg1 )
						local f113_local0 = function ( f114_arg0, f114_arg1 )
							local f114_local0 = function ( f115_arg0, f115_arg1 )
								local f115_local0 = function ( f116_arg0, f116_arg1 )
									local f116_local0 = function ( f117_arg0, f117_arg1 )
										local f117_local0 = function ( f118_arg0, f118_arg1 )
											local f118_local0 = function ( f119_arg0, f119_arg1 )
												local f119_local0 = function ( f120_arg0, f120_arg1 )
													local f120_local0 = function ( f121_arg0, f121_arg1 )
														local f121_local0 = function ( f122_arg0, f122_arg1 )
															if not f122_arg1.interrupted then
																f122_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															f122_arg0:setAlpha( 0 )
															if f122_arg1.interrupted then
																self.clipFinished( f122_arg0, f122_arg1 )
															else
																f122_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f121_arg1.interrupted then
															f121_local0( f121_arg0, f121_arg1 )
															return 
														else
															f121_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															f121_arg0:setAlpha( 0.47 )
															f121_arg0:registerEventHandler( "transition_complete_keyframe", f121_local0 )
														end
													end
													
													if f120_arg1.interrupted then
														f120_local0( f120_arg0, f120_arg1 )
														return 
													else
														f120_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														f120_arg0:registerEventHandler( "transition_complete_keyframe", f120_local0 )
													end
												end
												
												if f119_arg1.interrupted then
													f119_local0( f119_arg0, f119_arg1 )
													return 
												else
													f119_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													f119_arg0:setAlpha( 0 )
													f119_arg0:registerEventHandler( "transition_complete_keyframe", f119_local0 )
												end
											end
											
											if f118_arg1.interrupted then
												f118_local0( f118_arg0, f118_arg1 )
												return 
											else
												f118_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												f118_arg0:setAlpha( 0.25 )
												f118_arg0:registerEventHandler( "transition_complete_keyframe", f118_local0 )
											end
										end
										
										if f117_arg1.interrupted then
											f117_local0( f117_arg0, f117_arg1 )
											return 
										else
											f117_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											f117_arg0:setAlpha( 1 )
											f117_arg0:registerEventHandler( "transition_complete_keyframe", f117_local0 )
										end
									end
									
									if f116_arg1.interrupted then
										f116_local0( f116_arg0, f116_arg1 )
										return 
									else
										f116_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f116_arg0:registerEventHandler( "transition_complete_keyframe", f116_local0 )
									end
								end
								
								if f115_arg1.interrupted then
									f115_local0( f115_arg0, f115_arg1 )
									return 
								else
									f115_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									f115_arg0:setAlpha( 0 )
									f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
								end
							end
							
							if f114_arg1.interrupted then
								f114_local0( f114_arg0, f114_arg1 )
								return 
							else
								f114_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
							end
						end
						
						if f113_arg1.interrupted then
							f113_local0( f113_arg0, f113_arg1 )
							return 
						else
							f113_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f113_arg0:setAlpha( 0.77 )
							f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
						end
					end
					
					if f112_arg1.interrupted then
						f112_local0( f112_arg0, f112_arg1 )
						return 
					else
						f112_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
						f112_arg0:setAlpha( 0 )
						f112_arg0:registerEventHandler( "transition_complete_keyframe", f112_local0 )
					end
				end
				
				Regen1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				Regen1:setAlpha( 1 )
				Regen1:registerEventHandler( "transition_complete_keyframe", f89_local2 )
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
				self:setupElementClipCounter( 6 )
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
				sfx:completeAnimation()
				self.sfx:playSound( "gdt_cybercore_regen_tick_4" )
				self.clipFinished( sfx, {} )
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
				local f140_local1 = function ( f152_arg0, f152_arg1 )
					local f152_local0 = function ( f153_arg0, f153_arg1 )
						local f153_local0 = function ( f154_arg0, f154_arg1 )
							local f154_local0 = function ( f155_arg0, f155_arg1 )
								local f155_local0 = function ( f156_arg0, f156_arg1 )
									local f156_local0 = function ( f157_arg0, f157_arg1 )
										local f157_local0 = function ( f158_arg0, f158_arg1 )
											local f158_local0 = function ( f159_arg0, f159_arg1 )
												local f159_local0 = function ( f160_arg0, f160_arg1 )
													local f160_local0 = function ( f161_arg0, f161_arg1 )
														local f161_local0 = function ( f162_arg0, f162_arg1 )
															if not f162_arg1.interrupted then
																f162_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															f162_arg0:setAlpha( 0 )
															if f162_arg1.interrupted then
																self.clipFinished( f162_arg0, f162_arg1 )
															else
																f162_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f161_arg1.interrupted then
															f161_local0( f161_arg0, f161_arg1 )
															return 
														else
															f161_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															f161_arg0:setAlpha( 0.47 )
															f161_arg0:registerEventHandler( "transition_complete_keyframe", f161_local0 )
														end
													end
													
													if f160_arg1.interrupted then
														f160_local0( f160_arg0, f160_arg1 )
														return 
													else
														f160_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
													end
												end
												
												if f159_arg1.interrupted then
													f159_local0( f159_arg0, f159_arg1 )
													return 
												else
													f159_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
													f159_arg0:setAlpha( 0 )
													f159_arg0:registerEventHandler( "transition_complete_keyframe", f159_local0 )
												end
											end
											
											if f158_arg1.interrupted then
												f158_local0( f158_arg0, f158_arg1 )
												return 
											else
												f158_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												f158_arg0:setAlpha( 0.25 )
												f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
											end
										end
										
										if f157_arg1.interrupted then
											f157_local0( f157_arg0, f157_arg1 )
											return 
										else
											f157_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											f157_arg0:setAlpha( 1 )
											f157_arg0:registerEventHandler( "transition_complete_keyframe", f157_local0 )
										end
									end
									
									if f156_arg1.interrupted then
										f156_local0( f156_arg0, f156_arg1 )
										return 
									else
										f156_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f156_arg0:registerEventHandler( "transition_complete_keyframe", f156_local0 )
									end
								end
								
								if f155_arg1.interrupted then
									f155_local0( f155_arg0, f155_arg1 )
									return 
								else
									f155_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
									f155_arg0:setAlpha( 0 )
									f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
								end
							end
							
							if f154_arg1.interrupted then
								f154_local0( f154_arg0, f154_arg1 )
								return 
							else
								f154_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f154_arg0:setAlpha( 0.77 )
								f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
							end
						end
						
						if f153_arg1.interrupted then
							f153_local0( f153_arg0, f153_arg1 )
							return 
						else
							f153_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
							f153_arg0:registerEventHandler( "transition_complete_keyframe", f153_local0 )
						end
					end
					
					if f152_arg1.interrupted then
						f152_local0( f152_arg0, f152_arg1 )
						return 
					else
						f152_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f152_arg0:setAlpha( 0 )
						f152_arg0:registerEventHandler( "transition_complete_keyframe", f152_local0 )
					end
				end
				
				Regen3:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Regen3:setAlpha( 1 )
				Regen3:registerEventHandler( "transition_complete_keyframe", f140_local1 )
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
				local f140_local3 = function ( f174_arg0, f174_arg1 )
					local f174_local0 = function ( f175_arg0, f175_arg1 )
						local f175_local0 = function ( f176_arg0, f176_arg1 )
							local f176_local0 = function ( f177_arg0, f177_arg1 )
								local f177_local0 = function ( f178_arg0, f178_arg1 )
									local f178_local0 = function ( f179_arg0, f179_arg1 )
										local f179_local0 = function ( f180_arg0, f180_arg1 )
											local f180_local0 = function ( f181_arg0, f181_arg1 )
												local f181_local0 = function ( f182_arg0, f182_arg1 )
													local f182_local0 = function ( f183_arg0, f183_arg1 )
														if not f183_arg1.interrupted then
															f183_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
														end
														f183_arg0:setAlpha( 0 )
														if f183_arg1.interrupted then
															self.clipFinished( f183_arg0, f183_arg1 )
														else
															f183_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if f182_arg1.interrupted then
														f182_local0( f182_arg0, f182_arg1 )
														return 
													else
														f182_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														f182_arg0:setAlpha( 0.47 )
														f182_arg0:registerEventHandler( "transition_complete_keyframe", f182_local0 )
													end
												end
												
												if f181_arg1.interrupted then
													f181_local0( f181_arg0, f181_arg1 )
													return 
												else
													f181_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													f181_arg0:registerEventHandler( "transition_complete_keyframe", f181_local0 )
												end
											end
											
											if f180_arg1.interrupted then
												f180_local0( f180_arg0, f180_arg1 )
												return 
											else
												f180_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
												f180_arg0:setAlpha( 0 )
												f180_arg0:registerEventHandler( "transition_complete_keyframe", f180_local0 )
											end
										end
										
										if f179_arg1.interrupted then
											f179_local0( f179_arg0, f179_arg1 )
											return 
										else
											f179_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
											f179_arg0:setAlpha( 0.25 )
											f179_arg0:registerEventHandler( "transition_complete_keyframe", f179_local0 )
										end
									end
									
									if f178_arg1.interrupted then
										f178_local0( f178_arg0, f178_arg1 )
										return 
									else
										f178_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f178_arg0:registerEventHandler( "transition_complete_keyframe", f178_local0 )
									end
								end
								
								if f177_arg1.interrupted then
									f177_local0( f177_arg0, f177_arg1 )
									return 
								else
									f177_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									f177_arg0:setAlpha( 0 )
									f177_arg0:registerEventHandler( "transition_complete_keyframe", f177_local0 )
								end
							end
							
							if f176_arg1.interrupted then
								f176_local0( f176_arg0, f176_arg1 )
								return 
							else
								f176_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f176_arg0:registerEventHandler( "transition_complete_keyframe", f176_local0 )
							end
						end
						
						if f175_arg1.interrupted then
							f175_local0( f175_arg0, f175_arg1 )
							return 
						else
							f175_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f175_arg0:setAlpha( 0.77 )
							f175_arg0:registerEventHandler( "transition_complete_keyframe", f175_local0 )
						end
					end
					
					if f174_arg1.interrupted then
						f174_local0( f174_arg0, f174_arg1 )
						return 
					else
						f174_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						f174_arg0:setAlpha( 0 )
						f174_arg0:registerEventHandler( "transition_complete_keyframe", f174_local0 )
					end
				end
				
				Regen1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
				Regen1:setAlpha( 1 )
				Regen1:registerEventHandler( "transition_complete_keyframe", f140_local3 )
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
													Line:setTopBottom( true, false, 10.67, 29.34 )
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
												Line:setTopBottom( true, false, 10.67, 29.34 )
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
				self.Line:setTopBottom( true, false, -4, 14.67 )
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
				local f211_local1 = function ( f223_arg0, f223_arg1 )
					local f223_local0 = function ( f224_arg0, f224_arg1 )
						local f224_local0 = function ( f225_arg0, f225_arg1 )
							local f225_local0 = function ( f226_arg0, f226_arg1 )
								local f226_local0 = function ( f227_arg0, f227_arg1 )
									local f227_local0 = function ( f228_arg0, f228_arg1 )
										local f228_local0 = function ( f229_arg0, f229_arg1 )
											local f229_local0 = function ( f230_arg0, f230_arg1 )
												local f230_local0 = function ( f231_arg0, f231_arg1 )
													local f231_local0 = function ( f232_arg0, f232_arg1 )
														local f232_local0 = function ( f233_arg0, f233_arg1 )
															if not f233_arg1.interrupted then
																f233_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
															end
															f233_arg0:setAlpha( 0 )
															if f233_arg1.interrupted then
																self.clipFinished( f233_arg0, f233_arg1 )
															else
																f233_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f232_arg1.interrupted then
															f232_local0( f232_arg0, f232_arg1 )
															return 
														else
															f232_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															f232_arg0:setAlpha( 0.47 )
															f232_arg0:registerEventHandler( "transition_complete_keyframe", f232_local0 )
														end
													end
													
													if f231_arg1.interrupted then
														f231_local0( f231_arg0, f231_arg1 )
														return 
													else
														f231_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														f231_arg0:registerEventHandler( "transition_complete_keyframe", f231_local0 )
													end
												end
												
												if f230_arg1.interrupted then
													f230_local0( f230_arg0, f230_arg1 )
													return 
												else
													f230_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													f230_arg0:setAlpha( 0 )
													f230_arg0:registerEventHandler( "transition_complete_keyframe", f230_local0 )
												end
											end
											
											if f229_arg1.interrupted then
												f229_local0( f229_arg0, f229_arg1 )
												return 
											else
												f229_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												f229_arg0:setAlpha( 0.25 )
												f229_arg0:registerEventHandler( "transition_complete_keyframe", f229_local0 )
											end
										end
										
										if f228_arg1.interrupted then
											f228_local0( f228_arg0, f228_arg1 )
											return 
										else
											f228_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f228_arg0:setAlpha( 1 )
											f228_arg0:registerEventHandler( "transition_complete_keyframe", f228_local0 )
										end
									end
									
									if f227_arg1.interrupted then
										f227_local0( f227_arg0, f227_arg1 )
										return 
									else
										f227_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										f227_arg0:registerEventHandler( "transition_complete_keyframe", f227_local0 )
									end
								end
								
								if f226_arg1.interrupted then
									f226_local0( f226_arg0, f226_arg1 )
									return 
								else
									f226_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									f226_arg0:setAlpha( 0 )
									f226_arg0:registerEventHandler( "transition_complete_keyframe", f226_local0 )
								end
							end
							
							if f225_arg1.interrupted then
								f225_local0( f225_arg0, f225_arg1 )
								return 
							else
								f225_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f225_arg0:registerEventHandler( "transition_complete_keyframe", f225_local0 )
							end
						end
						
						if f224_arg1.interrupted then
							f224_local0( f224_arg0, f224_arg1 )
							return 
						else
							f224_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							f224_arg0:setAlpha( 0.77 )
							f224_arg0:registerEventHandler( "transition_complete_keyframe", f224_local0 )
						end
					end
					
					if f223_arg1.interrupted then
						f223_local0( f223_arg0, f223_arg1 )
						return 
					else
						f223_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f223_arg0:setAlpha( 0 )
						f223_arg0:registerEventHandler( "transition_complete_keyframe", f223_local0 )
					end
				end
				
				Regen4:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
				Regen4:setAlpha( 1 )
				Regen4:registerEventHandler( "transition_complete_keyframe", f211_local1 )
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
				local f211_local3 = function ( f244_arg0, f244_arg1 )
					local f244_local0 = function ( f245_arg0, f245_arg1 )
						local f245_local0 = function ( f246_arg0, f246_arg1 )
							local f246_local0 = function ( f247_arg0, f247_arg1 )
								local f247_local0 = function ( f248_arg0, f248_arg1 )
									local f248_local0 = function ( f249_arg0, f249_arg1 )
										local f249_local0 = function ( f250_arg0, f250_arg1 )
											local f250_local0 = function ( f251_arg0, f251_arg1 )
												local f251_local0 = function ( f252_arg0, f252_arg1 )
													local f252_local0 = function ( f253_arg0, f253_arg1 )
														local f253_local0 = function ( f254_arg0, f254_arg1 )
															if not f254_arg1.interrupted then
																f254_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															end
															f254_arg0:setAlpha( 0 )
															if f254_arg1.interrupted then
																self.clipFinished( f254_arg0, f254_arg1 )
															else
																f254_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f253_arg1.interrupted then
															f253_local0( f253_arg0, f253_arg1 )
															return 
														else
															f253_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
															f253_arg0:setAlpha( 0.47 )
															f253_arg0:registerEventHandler( "transition_complete_keyframe", f253_local0 )
														end
													end
													
													if f252_arg1.interrupted then
														f252_local0( f252_arg0, f252_arg1 )
														return 
													else
														f252_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														f252_arg0:registerEventHandler( "transition_complete_keyframe", f252_local0 )
													end
												end
												
												if f251_arg1.interrupted then
													f251_local0( f251_arg0, f251_arg1 )
													return 
												else
													f251_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													f251_arg0:setAlpha( 0 )
													f251_arg0:registerEventHandler( "transition_complete_keyframe", f251_local0 )
												end
											end
											
											if f250_arg1.interrupted then
												f250_local0( f250_arg0, f250_arg1 )
												return 
											else
												f250_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												f250_arg0:setAlpha( 0.25 )
												f250_arg0:registerEventHandler( "transition_complete_keyframe", f250_local0 )
											end
										end
										
										if f249_arg1.interrupted then
											f249_local0( f249_arg0, f249_arg1 )
											return 
										else
											f249_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											f249_arg0:setAlpha( 1 )
											f249_arg0:registerEventHandler( "transition_complete_keyframe", f249_local0 )
										end
									end
									
									if f248_arg1.interrupted then
										f248_local0( f248_arg0, f248_arg1 )
										return 
									else
										f248_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f248_arg0:registerEventHandler( "transition_complete_keyframe", f248_local0 )
									end
								end
								
								if f247_arg1.interrupted then
									f247_local0( f247_arg0, f247_arg1 )
									return 
								else
									f247_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									f247_arg0:setAlpha( 0 )
									f247_arg0:registerEventHandler( "transition_complete_keyframe", f247_local0 )
								end
							end
							
							if f246_arg1.interrupted then
								f246_local0( f246_arg0, f246_arg1 )
								return 
							else
								f246_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f246_arg0:registerEventHandler( "transition_complete_keyframe", f246_local0 )
							end
						end
						
						if f245_arg1.interrupted then
							f245_local0( f245_arg0, f245_arg1 )
							return 
						else
							f245_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f245_arg0:setAlpha( 0.77 )
							f245_arg0:registerEventHandler( "transition_complete_keyframe", f245_local0 )
						end
					end
					
					if f244_arg1.interrupted then
						f244_local0( f244_arg0, f244_arg1 )
						return 
					else
						f244_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						f244_arg0:setAlpha( 0 )
						f244_arg0:registerEventHandler( "transition_complete_keyframe", f244_local0 )
					end
				end
				
				Regen2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				Regen2:setAlpha( 1 )
				Regen2:registerEventHandler( "transition_complete_keyframe", f211_local3 )
				local f211_local4 = function ( f255_arg0, f255_arg1 )
					local f255_local0 = function ( f256_arg0, f256_arg1 )
						local f256_local0 = function ( f257_arg0, f257_arg1 )
							local f257_local0 = function ( f258_arg0, f258_arg1 )
								local f258_local0 = function ( f259_arg0, f259_arg1 )
									local f259_local0 = function ( f260_arg0, f260_arg1 )
										local f260_local0 = function ( f261_arg0, f261_arg1 )
											local f261_local0 = function ( f262_arg0, f262_arg1 )
												local f262_local0 = function ( f263_arg0, f263_arg1 )
													local f263_local0 = function ( f264_arg0, f264_arg1 )
														local f264_local0 = function ( f265_arg0, f265_arg1 )
															if not f265_arg1.interrupted then
																f265_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
															end
															f265_arg0:setAlpha( 0 )
															if f265_arg1.interrupted then
																self.clipFinished( f265_arg0, f265_arg1 )
															else
																f265_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if f264_arg1.interrupted then
															f264_local0( f264_arg0, f264_arg1 )
															return 
														else
															f264_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
															f264_arg0:setAlpha( 0.47 )
															f264_arg0:registerEventHandler( "transition_complete_keyframe", f264_local0 )
														end
													end
													
													if f263_arg1.interrupted then
														f263_local0( f263_arg0, f263_arg1 )
														return 
													else
														f263_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														f263_arg0:registerEventHandler( "transition_complete_keyframe", f263_local0 )
													end
												end
												
												if f262_arg1.interrupted then
													f262_local0( f262_arg0, f262_arg1 )
													return 
												else
													f262_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													f262_arg0:setAlpha( 0 )
													f262_arg0:registerEventHandler( "transition_complete_keyframe", f262_local0 )
												end
											end
											
											if f261_arg1.interrupted then
												f261_local0( f261_arg0, f261_arg1 )
												return 
											else
												f261_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												f261_arg0:setAlpha( 0.25 )
												f261_arg0:registerEventHandler( "transition_complete_keyframe", f261_local0 )
											end
										end
										
										if f260_arg1.interrupted then
											f260_local0( f260_arg0, f260_arg1 )
											return 
										else
											f260_arg0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											f260_arg0:setAlpha( 1 )
											f260_arg0:registerEventHandler( "transition_complete_keyframe", f260_local0 )
										end
									end
									
									if f259_arg1.interrupted then
										f259_local0( f259_arg0, f259_arg1 )
										return 
									else
										f259_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										f259_arg0:registerEventHandler( "transition_complete_keyframe", f259_local0 )
									end
								end
								
								if f258_arg1.interrupted then
									f258_local0( f258_arg0, f258_arg1 )
									return 
								else
									f258_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f258_arg0:setAlpha( 0 )
									f258_arg0:registerEventHandler( "transition_complete_keyframe", f258_local0 )
								end
							end
							
							if f257_arg1.interrupted then
								f257_local0( f257_arg0, f257_arg1 )
								return 
							else
								f257_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								f257_arg0:registerEventHandler( "transition_complete_keyframe", f257_local0 )
							end
						end
						
						if f256_arg1.interrupted then
							f256_local0( f256_arg0, f256_arg1 )
							return 
						else
							f256_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f256_arg0:setAlpha( 0.77 )
							f256_arg0:registerEventHandler( "transition_complete_keyframe", f256_local0 )
						end
					end
					
					if f255_arg1.interrupted then
						f255_local0( f255_arg0, f255_arg1 )
						return 
					else
						f255_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f255_arg0:setAlpha( 0 )
						f255_arg0:registerEventHandler( "transition_complete_keyframe", f255_local0 )
					end
				end
				
				Regen1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				Regen1:setAlpha( 1 )
				Regen1:registerEventHandler( "transition_complete_keyframe", f211_local4 )
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

