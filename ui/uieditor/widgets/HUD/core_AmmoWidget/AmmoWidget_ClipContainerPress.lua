-- e7e06829456eb7224f9a45f839ff775d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Pixel" )

CoD.AmmoWidget_ClipContainerPress = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_ClipContainerPress.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_ClipContainerPress )
	self.id = "AmmoWidget_ClipContainerPress"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 42 )
	
	local Clip = LUI.UIText.new()
	Clip:setLeftRight( false, false, -100.5, 100.5 )
	Clip:setTopBottom( false, true, -67.8, 41.5 )
	Clip:setRGB( 0.85, 0.15, 0.15 )
	Clip:setAlpha( 0.2 )
	Clip:setText( Engine.Localize( "33" ) )
	Clip:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Clip:setLetterSpacing( -3.5 )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Clip:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Clip )
	self.Clip = Clip
	
	local Pixel0 = CoD.DamageWidget_Pixel.new( menu, controller )
	Pixel0:setLeftRight( true, false, 12.66, 98 )
	Pixel0:setTopBottom( true, false, 21.95, 22.95 )
	Pixel0:setRGB( 0.85, 0.15, 0.15 )
	Pixel0:setAlpha( 0 )
	Pixel0:setZRot( 35 )
	self:addElement( Pixel0 )
	self.Pixel0 = Pixel0
	
	local Pixel1 = CoD.DamageWidget_Pixel.new( menu, controller )
	Pixel1:setLeftRight( true, false, 12.66, 98 )
	Pixel1:setTopBottom( true, false, 21.95, 22.95 )
	Pixel1:setRGB( 0.85, 0.15, 0.15 )
	Pixel1:setAlpha( 0 )
	Pixel1:setZRot( -35 )
	self:addElement( Pixel1 )
	self.Pixel1 = Pixel1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Clip:completeAnimation()
				self.Clip:setLeftRight( false, false, -52.5, 55.5 )
				self.Clip:setTopBottom( false, true, -43.5, 8.5 )
				self.Clip:setAlpha( 0 )
				self.clipFinished( Clip, {} )

				Pixel0:completeAnimation()
				self.Pixel0:setAlpha( 0 )
				self.clipFinished( Pixel0, {} )

				Pixel1:completeAnimation()
				self.Pixel1:setAlpha( 0 )
				self.clipFinished( Pixel1, {} )
			end
		},
		NoAmmoPress = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				local ClipFrame2 = function ( Clip, event )
					local ClipFrame3 = function ( Clip, event )
						local ClipFrame4 = function ( Clip, event )
							local ClipFrame5 = function ( Clip, event )
								local ClipFrame6 = function ( Clip, event )
									local ClipFrame7 = function ( Clip, event )
										local ClipFrame8 = function ( Clip, event )
											local ClipFrame9 = function ( Clip, event )
												local ClipFrame10 = function ( Clip, event )
													local ClipFrame11 = function ( Clip, event )
														local ClipFrame12 = function ( Clip, event )
															if not event.interrupted then
																Clip:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
															end
															Clip:setLeftRight( false, false, -100.5, 100.5 )
															Clip:setTopBottom( false, true, -67.8, 41.5 )
															Clip:setAlpha( 0 )
															if event.interrupted then
																self.clipFinished( Clip, event )
															else
																Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															ClipFrame12( Clip, event )
															return 
														else
															Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															Clip:setLeftRight( false, false, -100.5, 100.5 )
															Clip:setTopBottom( false, true, -67.8, 41.5 )
															Clip:setAlpha( 0.31 )
															Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame12 )
														end
													end
													
													if event.interrupted then
														ClipFrame11( Clip, event )
														return 
													else
														Clip:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
														Clip:setAlpha( 0.34 )
														Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame11 )
													end
												end
												
												if event.interrupted then
													ClipFrame10( Clip, event )
													return 
												else
													Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													Clip:setLeftRight( false, false, -74.36, 75.81 )
													Clip:setTopBottom( false, true, -54.22, 25.75 )
													Clip:setAlpha( 0.49 )
													Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame10 )
												end
											end
											
											if event.interrupted then
												ClipFrame9( Clip, event )
												return 
											else
												Clip:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
												Clip:setAlpha( 0.51 )
												Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame9 )
											end
										end
										
										if event.interrupted then
											ClipFrame8( Clip, event )
											return 
										else
											Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Clip:setLeftRight( false, false, -68.29, 70.17 )
											Clip:setTopBottom( false, true, -51.24, 20.96 )
											Clip:setAlpha( 0.63 )
											Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame8 )
										end
									end
									
									if event.interrupted then
										ClipFrame7( Clip, event )
										return 
									else
										Clip:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										Clip:setAlpha( 0.66 )
										Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame7 )
									end
								end
								
								if event.interrupted then
									ClipFrame6( Clip, event )
									return 
								else
									Clip:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Clip:setAlpha( 0.8 )
									Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame6 )
								end
							end
							
							if event.interrupted then
								ClipFrame5( Clip, event )
								return 
							else
								Clip:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								Clip:setAlpha( 0.83 )
								Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame5 )
							end
						end
						
						if event.interrupted then
							ClipFrame4( Clip, event )
							return 
						else
							Clip:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Clip:setLeftRight( false, false, -56.14, 58.89 )
							Clip:setTopBottom( false, true, -45.29, 11.38 )
							Clip:setAlpha( 0.91 )
							Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame4 )
						end
					end
					
					if event.interrupted then
						ClipFrame3( Clip, event )
						return 
					else
						Clip:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						Clip:setAlpha( 0.94 )
						Clip:registerEventHandler( "transition_complete_keyframe", ClipFrame3 )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setLeftRight( false, false, -52.5, 55.5 )
				self.Clip:setTopBottom( false, true, -43.5, 8.5 )
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
				local Pixel0Frame2 = function ( Pixel0, event )
					local Pixel0Frame3 = function ( Pixel0, event )
						local Pixel0Frame4 = function ( Pixel0, event )
							local Pixel0Frame5 = function ( Pixel0, event )
								local Pixel0Frame6 = function ( Pixel0, event )
									local Pixel0Frame7 = function ( Pixel0, event )
										local Pixel0Frame8 = function ( Pixel0, event )
											local Pixel0Frame9 = function ( Pixel0, event )
												local Pixel0Frame10 = function ( Pixel0, event )
													if not event.interrupted then
														Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													Pixel0:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Pixel0, event )
													else
														Pixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Pixel0Frame10( Pixel0, event )
													return 
												else
													Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													Pixel0:setAlpha( 0.5 )
													Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame10 )
												end
											end
											
											if event.interrupted then
												Pixel0Frame9( Pixel0, event )
												return 
											else
												Pixel0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame9 )
											end
										end
										
										if event.interrupted then
											Pixel0Frame8( Pixel0, event )
											return 
										else
											Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Pixel0:setAlpha( 0 )
											Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame8 )
										end
									end
									
									if event.interrupted then
										Pixel0Frame7( Pixel0, event )
										return 
									else
										Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame7 )
									end
								end
								
								if event.interrupted then
									Pixel0Frame6( Pixel0, event )
									return 
								else
									Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									Pixel0:setAlpha( 0.5 )
									Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame6 )
								end
							end
							
							if event.interrupted then
								Pixel0Frame5( Pixel0, event )
								return 
							else
								Pixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel0Frame4( Pixel0, event )
							return 
						else
							Pixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Pixel0:setAlpha( 0 )
							Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel0Frame3( Pixel0, event )
						return 
					else
						Pixel0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Pixel0:registerEventHandler( "transition_complete_keyframe", Pixel0Frame3 )
					end
				end
				
				Pixel0:completeAnimation()
				self.Pixel0:setAlpha( 1 )
				Pixel0Frame2( Pixel0, {} )
				local Pixel1Frame2 = function ( Pixel1, event )
					local Pixel1Frame3 = function ( Pixel1, event )
						local Pixel1Frame4 = function ( Pixel1, event )
							local Pixel1Frame5 = function ( Pixel1, event )
								local Pixel1Frame6 = function ( Pixel1, event )
									local Pixel1Frame7 = function ( Pixel1, event )
										local Pixel1Frame8 = function ( Pixel1, event )
											local Pixel1Frame9 = function ( Pixel1, event )
												if not event.interrupted then
													Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												end
												Pixel1:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Pixel1, event )
												else
													Pixel1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Pixel1Frame9( Pixel1, event )
												return 
											else
												Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												Pixel1:setAlpha( 0.5 )
												Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame9 )
											end
										end
										
										if event.interrupted then
											Pixel1Frame8( Pixel1, event )
											return 
										else
											Pixel1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame8 )
										end
									end
									
									if event.interrupted then
										Pixel1Frame7( Pixel1, event )
										return 
									else
										Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										Pixel1:setAlpha( 0 )
										Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame7 )
									end
								end
								
								if event.interrupted then
									Pixel1Frame6( Pixel1, event )
									return 
								else
									Pixel1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame6 )
								end
							end
							
							if event.interrupted then
								Pixel1Frame5( Pixel1, event )
								return 
							else
								Pixel1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								Pixel1:setAlpha( 0.5 )
								Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame5 )
							end
						end
						
						if event.interrupted then
							Pixel1Frame4( Pixel1, event )
							return 
						else
							Pixel1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							Pixel1:setAlpha( 0 )
							Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame4 )
						end
					end
					
					if event.interrupted then
						Pixel1Frame3( Pixel1, event )
						return 
					else
						Pixel1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Pixel1:registerEventHandler( "transition_complete_keyframe", Pixel1Frame3 )
					end
				end
				
				Pixel1:completeAnimation()
				self.Pixel1:setAlpha( 1 )
				Pixel1Frame2( Pixel1, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Pixel0:close()
		element.Pixel1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

