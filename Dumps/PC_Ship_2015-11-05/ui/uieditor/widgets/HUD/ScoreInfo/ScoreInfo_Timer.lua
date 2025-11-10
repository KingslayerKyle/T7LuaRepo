require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_TimeSemi" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_TimerNumber" )

CoD.ScoreInfo_Timer = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_Timer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_Timer )
	self.id = "ScoreInfo_Timer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 75 )
	self:setTopBottom( true, false, 0, 112 )
	
	local Semi = CoD.ScoreInfo_TimeSemi.new( menu, controller )
	Semi:setLeftRight( false, false, -10.5, 10.5 )
	Semi:setTopBottom( false, false, -58.84, 14.67 )
	Semi:setAlpha( 0.6 )
	Semi:setZRot( 90 )
	Semi:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Semi:setShaderVector( 0, 0.05, 0.5, 0, 0 )
	Semi:setShaderVector( 1, 2, 0, 0, 0 )
	Semi:setShaderVector( 2, -0.2, -0.2, 0, 0 )
	Semi:setShaderVector( 3, 0, 0, 0, 0 )
	Semi:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Semi )
	self.Semi = Semi
	
	local Line1 = CoD.AmmoWidget_BackLine.new( menu, controller )
	Line1:setLeftRight( false, false, -66.5, 2.5 )
	Line1:setTopBottom( false, false, 17.67, 20.34 )
	Line1:setAlpha( 0.8 )
	Line1:setZRot( 90 )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local Line2 = CoD.AmmoWidget_BackLine.new( menu, controller )
	Line2:setLeftRight( false, false, -2.5, 66.5 )
	Line2:setTopBottom( false, false, 17.67, 20.34 )
	Line2:setAlpha( 0.8 )
	Line2:setZRot( 90 )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local GameTimer = CoD.ScoreInfo_TimerNumber.new( menu, controller )
	GameTimer:setLeftRight( false, false, -41.5, 41.5 )
	GameTimer:setTopBottom( false, false, -45, -27 )
	GameTimer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	GameTimer:setShaderVector( 0, 0, 0, 0, 0 )
	GameTimer:setShaderVector( 1, 0, 0, 0, 0 )
	GameTimer:setShaderVector( 2, 0, 0, 0, 0 )
	GameTimer:setShaderVector( 3, 0, 0, 0, 0 )
	GameTimer:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( GameTimer )
	self.GameTimer = GameTimer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -10.5, 10.5 )
				self.Semi:setTopBottom( false, false, -55.84, 17.67 )
				self.Semi:setAlpha( 0.6 )
				self.clipFinished( Semi, {} )
				Line1:completeAnimation()
				self.Line1:setLeftRight( false, false, -66.5, 2.5 )
				self.Line1:setTopBottom( false, false, 17.67, 20.34 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setLeftRight( false, false, -2.5, 66.5 )
				self.Line2:setTopBottom( false, false, 17.67, 20.34 )
				self.clipFinished( Line2, {} )
				GameTimer:completeAnimation()
				GameTimer.GameTimer00:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.GameTimer.GameTimer00:setRGB( 1, 1, 1 )
				self.clipFinished( GameTimer, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 4 )
				local SemiFrame2 = function ( Semi, event )
					if not event.interrupted then
						Semi:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					Semi:setLeftRight( false, false, -10.5, 10.5 )
					Semi:setTopBottom( false, false, -82, -8.5 )
					if event.interrupted then
						self.clipFinished( Semi, event )
					else
						Semi:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -10.5, 10.5 )
				self.Semi:setTopBottom( false, false, -55.84, 17.67 )
				SemiFrame2( Semi, {} )
				local Line1Frame2 = function ( Line1, event )
					if not event.interrupted then
						Line1:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					Line1:setLeftRight( false, false, -78.5, 14.5 )
					Line1:setTopBottom( false, false, 5.67, 8.33 )
					if event.interrupted then
						self.clipFinished( Line1, event )
					else
						Line1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Line1:completeAnimation()
				self.Line1:setLeftRight( false, false, -66.5, 2.5 )
				self.Line1:setTopBottom( false, false, 17.67, 20.34 )
				Line1Frame2( Line1, {} )
				local Line2Frame2 = function ( Line2, event )
					if not event.interrupted then
						Line2:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					Line2:setLeftRight( false, false, -14.5, 78.5 )
					Line2:setTopBottom( false, false, 5.67, 8.33 )
					if event.interrupted then
						self.clipFinished( Line2, event )
					else
						Line2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Line2:completeAnimation()
				self.Line2:setLeftRight( false, false, -2.5, 66.5 )
				self.Line2:setTopBottom( false, false, 17.67, 20.34 )
				Line2Frame2( Line2, {} )
				local GameTimerFrame2 = function ( GameTimer, event )
					local GameTimerFrame3 = function ( GameTimer, event )
						local GameTimerFrame4 = function ( GameTimer, event )
							local GameTimerFrame5 = function ( GameTimer, event )
								local GameTimerFrame6 = function ( GameTimer, event )
									local GameTimerFrame7 = function ( GameTimer, event )
										local GameTimerFrame8 = function ( GameTimer, event )
											local GameTimerFrame9 = function ( GameTimer, event )
												local GameTimerFrame10 = function ( GameTimer, event )
													local GameTimerFrame11 = function ( GameTimer, event )
														local GameTimerFrame12 = function ( GameTimer, event )
															if not event.interrupted then
																GameTimer:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
																GameTimer.GameTimer00:beginAnimation( "subkeyframe", 110, false, false, CoD.TweenType.Linear )
															end
															GameTimer:setAlpha( 1 )
															GameTimer.GameTimer00:setRGB( 1, 1, 1 )
															if event.interrupted then
																self.clipFinished( GameTimer, event )
															else
																GameTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															GameTimerFrame12( GameTimer, event )
															return 
														else
															GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															GameTimer:setAlpha( 1 )
															GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame12 )
														end
													end
													
													if event.interrupted then
														GameTimerFrame11( GameTimer, event )
														return 
													else
														GameTimer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame11 )
													end
												end
												
												if event.interrupted then
													GameTimerFrame10( GameTimer, event )
													return 
												else
													GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													GameTimer:setAlpha( 0.37 )
													GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame10 )
												end
											end
											
											if event.interrupted then
												GameTimerFrame9( GameTimer, event )
												return 
											else
												GameTimer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame9 )
											end
										end
										
										if event.interrupted then
											GameTimerFrame8( GameTimer, event )
											return 
										else
											GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											GameTimer:setAlpha( 1 )
											GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame8 )
										end
									end
									
									if event.interrupted then
										GameTimerFrame7( GameTimer, event )
										return 
									else
										GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame7 )
									end
								end
								
								if event.interrupted then
									GameTimerFrame6( GameTimer, event )
									return 
								else
									GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									GameTimer:setAlpha( 0 )
									GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame6 )
								end
							end
							
							if event.interrupted then
								GameTimerFrame5( GameTimer, event )
								return 
							else
								GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame5 )
							end
						end
						
						if event.interrupted then
							GameTimerFrame4( GameTimer, event )
							return 
						else
							GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							GameTimer:setAlpha( 1 )
							GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame4 )
						end
					end
					
					if event.interrupted then
						GameTimerFrame3( GameTimer, event )
						return 
					else
						GameTimer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame3 )
					end
				end
				
				GameTimer:completeAnimation()
				GameTimer.GameTimer00:completeAnimation()
				self.GameTimer:setAlpha( 0 )
				self.GameTimer.GameTimer00:setRGB( 1, 1, 1 )
				GameTimerFrame2( GameTimer, {} )
			end,
			TimeLow = function ()
				self:setupElementClipCounter( 4 )
				local SemiFrame2 = function ( Semi, event )
					if not event.interrupted then
						Semi:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					Semi:setLeftRight( false, false, -10.5, 10.5 )
					Semi:setTopBottom( false, false, -82, -8.5 )
					if event.interrupted then
						self.clipFinished( Semi, event )
					else
						Semi:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -10.5, 10.5 )
				self.Semi:setTopBottom( false, false, -55.84, 17.67 )
				SemiFrame2( Semi, {} )
				local Line1Frame2 = function ( Line1, event )
					if not event.interrupted then
						Line1:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					Line1:setLeftRight( false, false, -78.5, 14.5 )
					Line1:setTopBottom( false, false, 5.67, 8.33 )
					if event.interrupted then
						self.clipFinished( Line1, event )
					else
						Line1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Line1:completeAnimation()
				self.Line1:setLeftRight( false, false, -66.5, 2.5 )
				self.Line1:setTopBottom( false, false, 17.67, 20.34 )
				Line1Frame2( Line1, {} )
				local Line2Frame2 = function ( Line2, event )
					if not event.interrupted then
						Line2:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					Line2:setLeftRight( false, false, -14.5, 78.5 )
					Line2:setTopBottom( false, false, 5.67, 8.33 )
					if event.interrupted then
						self.clipFinished( Line2, event )
					else
						Line2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Line2:completeAnimation()
				self.Line2:setLeftRight( false, false, -2.5, 66.5 )
				self.Line2:setTopBottom( false, false, 17.67, 20.34 )
				Line2Frame2( Line2, {} )
				local GameTimerFrame2 = function ( GameTimer, event )
					local GameTimerFrame3 = function ( GameTimer, event )
						local GameTimerFrame4 = function ( GameTimer, event )
							local GameTimerFrame5 = function ( GameTimer, event )
								local GameTimerFrame6 = function ( GameTimer, event )
									local GameTimerFrame7 = function ( GameTimer, event )
										local GameTimerFrame8 = function ( GameTimer, event )
											local GameTimerFrame9 = function ( GameTimer, event )
												local GameTimerFrame10 = function ( GameTimer, event )
													local GameTimerFrame11 = function ( GameTimer, event )
														local GameTimerFrame12 = function ( GameTimer, event )
															if not event.interrupted then
																GameTimer:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
															end
															GameTimer:setRGB( 1, 0, 0 )
															GameTimer:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( GameTimer, event )
															else
																GameTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															GameTimerFrame12( GameTimer, event )
															return 
														else
															GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															GameTimer:setRGB( 1, 0.22, 0.22 )
															GameTimer:setAlpha( 1 )
															GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame12 )
														end
													end
													
													if event.interrupted then
														GameTimerFrame11( GameTimer, event )
														return 
													else
														GameTimer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
														GameTimer:setRGB( 1, 0.24, 0.24 )
														GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame11 )
													end
												end
												
												if event.interrupted then
													GameTimerFrame10( GameTimer, event )
													return 
												else
													GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													GameTimer:setRGB( 1, 0.28, 0.28 )
													GameTimer:setAlpha( 0.37 )
													GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame10 )
												end
											end
											
											if event.interrupted then
												GameTimerFrame9( GameTimer, event )
												return 
											else
												GameTimer:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												GameTimer:setRGB( 1, 0.3, 0.3 )
												GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame9 )
											end
										end
										
										if event.interrupted then
											GameTimerFrame8( GameTimer, event )
											return 
										else
											GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											GameTimer:setRGB( 1, 0.34, 0.34 )
											GameTimer:setAlpha( 1 )
											GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame8 )
										end
									end
									
									if event.interrupted then
										GameTimerFrame7( GameTimer, event )
										return 
									else
										GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										GameTimer:setRGB( 1, 0.36, 0.36 )
										GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame7 )
									end
								end
								
								if event.interrupted then
									GameTimerFrame6( GameTimer, event )
									return 
								else
									GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									GameTimer:setRGB( 1, 0.42, 0.42 )
									GameTimer:setAlpha( 0 )
									GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame6 )
								end
							end
							
							if event.interrupted then
								GameTimerFrame5( GameTimer, event )
								return 
							else
								GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								GameTimer:setRGB( 1, 0.44, 0.44 )
								GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame5 )
							end
						end
						
						if event.interrupted then
							GameTimerFrame4( GameTimer, event )
							return 
						else
							GameTimer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							GameTimer:setRGB( 1, 0.5, 0.5 )
							GameTimer:setAlpha( 1 )
							GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame4 )
						end
					end
					
					if event.interrupted then
						GameTimerFrame3( GameTimer, event )
						return 
					else
						GameTimer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						GameTimer:setRGB( 1, 0.52, 0.52 )
						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame3 )
					end
				end
				
				GameTimer:completeAnimation()
				self.GameTimer:setRGB( 1, 1, 1 )
				self.GameTimer:setAlpha( 0 )
				GameTimerFrame2( GameTimer, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -10.5, 10.5 )
				self.Semi:setTopBottom( false, false, -82, -8.5 )
				self.clipFinished( Semi, {} )
				Line1:completeAnimation()
				self.Line1:setLeftRight( false, false, -78.5, 14.5 )
				self.Line1:setTopBottom( false, false, 5.67, 8.33 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setLeftRight( false, false, -14.5, 78.5 )
				self.Line2:setTopBottom( false, false, 5.67, 8.33 )
				self.clipFinished( Line2, {} )
				GameTimer:completeAnimation()
				self.GameTimer:setRGB( 1, 1, 1 )
				self.GameTimer:setAlpha( 1 )
				self.GameTimer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.GameTimer:setShaderVector( 0, 0.1, 1, 0, 0 )
				self.GameTimer:setShaderVector( 1, 0.1, 0, 0, 0 )
				self.GameTimer:setShaderVector( 2, 0, 0, 0, 0 )
				self.GameTimer:setShaderVector( 3, 0, 0, 0, 0 )
				self.GameTimer:setShaderVector( 4, 0, 0, 0, 0 )
				self.clipFinished( GameTimer, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local SemiFrame2 = function ( Semi, event )
					local SemiFrame3 = function ( Semi, event )
						if not event.interrupted then
							Semi:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Linear )
						end
						Semi:setLeftRight( false, false, -10.5, 10.5 )
						Semi:setTopBottom( false, false, -55.84, 17.67 )
						if event.interrupted then
							self.clipFinished( Semi, event )
						else
							Semi:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SemiFrame3( Semi, event )
						return 
					else
						Semi:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Semi:registerEventHandler( "transition_complete_keyframe", SemiFrame3 )
					end
				end
				
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -10.5, 10.5 )
				self.Semi:setTopBottom( false, false, -82, -8.5 )
				SemiFrame2( Semi, {} )
				local Line1Frame2 = function ( Line1, event )
					local Line1Frame3 = function ( Line1, event )
						if not event.interrupted then
							Line1:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Linear )
						end
						Line1:setLeftRight( false, false, -66.5, 2.5 )
						Line1:setTopBottom( false, false, 17.67, 20.34 )
						if event.interrupted then
							self.clipFinished( Line1, event )
						else
							Line1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Line1Frame3( Line1, event )
						return 
					else
						Line1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Line1:registerEventHandler( "transition_complete_keyframe", Line1Frame3 )
					end
				end
				
				Line1:completeAnimation()
				self.Line1:setLeftRight( false, false, -78.5, 14.5 )
				self.Line1:setTopBottom( false, false, 5.67, 8.33 )
				Line1Frame2( Line1, {} )
				local Line2Frame2 = function ( Line2, event )
					local Line2Frame3 = function ( Line2, event )
						if not event.interrupted then
							Line2:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Linear )
						end
						Line2:setLeftRight( false, false, -2.5, 66.5 )
						Line2:setTopBottom( false, false, 17.67, 20.34 )
						if event.interrupted then
							self.clipFinished( Line2, event )
						else
							Line2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Line2Frame3( Line2, event )
						return 
					else
						Line2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Line2:registerEventHandler( "transition_complete_keyframe", Line2Frame3 )
					end
				end
				
				Line2:completeAnimation()
				self.Line2:setLeftRight( false, false, -14.5, 78.5 )
				self.Line2:setTopBottom( false, false, 5.67, 8.33 )
				Line2Frame2( Line2, {} )
				local GameTimerFrame2 = function ( GameTimer, event )
					local GameTimerFrame3 = function ( GameTimer, event )
						local GameTimerFrame4 = function ( GameTimer, event )
							local GameTimerFrame5 = function ( GameTimer, event )
								local GameTimerFrame6 = function ( GameTimer, event )
									local GameTimerFrame7 = function ( GameTimer, event )
										local GameTimerFrame8 = function ( GameTimer, event )
											local GameTimerFrame9 = function ( GameTimer, event )
												if not event.interrupted then
													GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												end
												GameTimer:setRGB( 1, 1, 1 )
												GameTimer:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( GameTimer, event )
												else
													GameTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GameTimerFrame9( GameTimer, event )
												return 
											else
												GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame9 )
											end
										end
										
										if event.interrupted then
											GameTimerFrame8( GameTimer, event )
											return 
										else
											GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											GameTimer:setAlpha( 0.5 )
											GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame8 )
										end
									end
									
									if event.interrupted then
										GameTimerFrame7( GameTimer, event )
										return 
									else
										GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame7 )
									end
								end
								
								if event.interrupted then
									GameTimerFrame6( GameTimer, event )
									return 
								else
									GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									GameTimer:setAlpha( 0 )
									GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame6 )
								end
							end
							
							if event.interrupted then
								GameTimerFrame5( GameTimer, event )
								return 
							else
								GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame5 )
							end
						end
						
						if event.interrupted then
							GameTimerFrame4( GameTimer, event )
							return 
						else
							GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							GameTimer:setAlpha( 1 )
							GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame4 )
						end
					end
					
					if event.interrupted then
						GameTimerFrame3( GameTimer, event )
						return 
					else
						GameTimer:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame3 )
					end
				end
				
				GameTimer:completeAnimation()
				self.GameTimer:setRGB( 1, 1, 1 )
				self.GameTimer:setAlpha( 0 )
				GameTimerFrame2( GameTimer, {} )
			end
		},
		TimeLow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -10.5, 10.5 )
				self.Semi:setTopBottom( false, false, -82, -8.5 )
				self.clipFinished( Semi, {} )
				Line1:completeAnimation()
				self.Line1:setLeftRight( false, false, -78.5, 14.5 )
				self.Line1:setTopBottom( false, false, 5.67, 8.33 )
				self.clipFinished( Line1, {} )
				Line2:completeAnimation()
				self.Line2:setLeftRight( false, false, -14.5, 78.5 )
				self.Line2:setTopBottom( false, false, 5.67, 8.33 )
				self.clipFinished( Line2, {} )
				local GameTimerFrame2 = function ( GameTimer, event )
					local GameTimerFrame3 = function ( GameTimer, event )
						local GameTimerFrame4 = function ( GameTimer, event )
							if not event.interrupted then
								GameTimer:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							GameTimer:setRGB( 1, 1, 1 )
							GameTimer:setAlpha( 1 )
							GameTimer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
							GameTimer:setShaderVector( 0, 0.1, 1, 0, 0 )
							GameTimer:setShaderVector( 1, 0.1, 0, 0, 0 )
							GameTimer:setShaderVector( 2, 0, 0, 0, 0 )
							GameTimer:setShaderVector( 3, 0, 0, 0, 0 )
							GameTimer:setShaderVector( 4, 0, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( GameTimer, event )
							else
								GameTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GameTimerFrame4( GameTimer, event )
							return 
						else
							GameTimer:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							GameTimer:setRGB( 1, 1, 1 )
							GameTimer:setShaderVector( 0, 0.1, 1, 0, 0 )
							GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame4 )
						end
					end
					
					if event.interrupted then
						GameTimerFrame3( GameTimer, event )
						return 
					else
						GameTimer:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame3 )
					end
				end
				
				GameTimer:completeAnimation()
				self.GameTimer:setRGB( 1, 0, 0 )
				self.GameTimer:setAlpha( 1 )
				self.GameTimer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.GameTimer:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.GameTimer:setShaderVector( 1, 0.1, 0, 0, 0 )
				self.GameTimer:setShaderVector( 2, 0, 0, 0, 0 )
				self.GameTimer:setShaderVector( 3, 0, 0, 0, 0 )
				self.GameTimer:setShaderVector( 4, 0, 0, 0, 0 )
				GameTimerFrame2( GameTimer, {} )
				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local SemiFrame2 = function ( Semi, event )
					local SemiFrame3 = function ( Semi, event )
						if not event.interrupted then
							Semi:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Linear )
						end
						Semi:setLeftRight( false, false, -10.5, 10.5 )
						Semi:setTopBottom( false, false, -55.84, 17.67 )
						if event.interrupted then
							self.clipFinished( Semi, event )
						else
							Semi:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SemiFrame3( Semi, event )
						return 
					else
						Semi:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Semi:registerEventHandler( "transition_complete_keyframe", SemiFrame3 )
					end
				end
				
				Semi:completeAnimation()
				self.Semi:setLeftRight( false, false, -10.5, 10.5 )
				self.Semi:setTopBottom( false, false, -82, -8.5 )
				SemiFrame2( Semi, {} )
				local Line1Frame2 = function ( Line1, event )
					local Line1Frame3 = function ( Line1, event )
						if not event.interrupted then
							Line1:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Linear )
						end
						Line1:setLeftRight( false, false, -66.5, 2.5 )
						Line1:setTopBottom( false, false, 17.67, 20.34 )
						if event.interrupted then
							self.clipFinished( Line1, event )
						else
							Line1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Line1Frame3( Line1, event )
						return 
					else
						Line1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Line1:registerEventHandler( "transition_complete_keyframe", Line1Frame3 )
					end
				end
				
				Line1:completeAnimation()
				self.Line1:setLeftRight( false, false, -78.5, 14.5 )
				self.Line1:setTopBottom( false, false, 5.67, 8.33 )
				Line1Frame2( Line1, {} )
				local Line2Frame2 = function ( Line2, event )
					local Line2Frame3 = function ( Line2, event )
						if not event.interrupted then
							Line2:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Linear )
						end
						Line2:setLeftRight( false, false, -2.5, 66.5 )
						Line2:setTopBottom( false, false, 17.67, 20.34 )
						if event.interrupted then
							self.clipFinished( Line2, event )
						else
							Line2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Line2Frame3( Line2, event )
						return 
					else
						Line2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						Line2:registerEventHandler( "transition_complete_keyframe", Line2Frame3 )
					end
				end
				
				Line2:completeAnimation()
				self.Line2:setLeftRight( false, false, -14.5, 78.5 )
				self.Line2:setTopBottom( false, false, 5.67, 8.33 )
				Line2Frame2( Line2, {} )
				local GameTimerFrame2 = function ( GameTimer, event )
					local GameTimerFrame3 = function ( GameTimer, event )
						local GameTimerFrame4 = function ( GameTimer, event )
							local GameTimerFrame5 = function ( GameTimer, event )
								local GameTimerFrame6 = function ( GameTimer, event )
									local GameTimerFrame7 = function ( GameTimer, event )
										local GameTimerFrame8 = function ( GameTimer, event )
											local GameTimerFrame9 = function ( GameTimer, event )
												local GameTimerFrame10 = function ( GameTimer, event )
													if not event.interrupted then
														GameTimer:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
													end
													GameTimer:setRGB( 1, 1, 1 )
													GameTimer:setAlpha( 0 )
													GameTimer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
													GameTimer:setShaderVector( 0, 0.1, 1, 0, 0 )
													GameTimer:setShaderVector( 1, 0.1, 0, 0, 0 )
													GameTimer:setShaderVector( 2, 0, 0, 0, 0 )
													GameTimer:setShaderVector( 3, 0, 0, 0, 0 )
													GameTimer:setShaderVector( 4, 0, 0, 0, 0 )
													if event.interrupted then
														self.clipFinished( GameTimer, event )
													else
														GameTimer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													GameTimerFrame10( GameTimer, event )
													return 
												else
													GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													GameTimer:setRGB( 1, 0.32, 0.32 )
													GameTimer:setAlpha( 0 )
													GameTimer:setShaderVector( 0, 0.1, 0.32, 0, 0 )
													GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame10 )
												end
											end
											
											if event.interrupted then
												GameTimerFrame9( GameTimer, event )
												return 
											else
												GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
												GameTimer:setRGB( 1, 0.3, 0.3 )
												GameTimer:setShaderVector( 0, 0.1, 0.3, 0, 0 )
												GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame9 )
											end
										end
										
										if event.interrupted then
											GameTimerFrame8( GameTimer, event )
											return 
										else
											GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											GameTimer:setRGB( 1, 0.24, 0.24 )
											GameTimer:setAlpha( 0.5 )
											GameTimer:setShaderVector( 0, 0.1, 0.24, 0, 0 )
											GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame8 )
										end
									end
									
									if event.interrupted then
										GameTimerFrame7( GameTimer, event )
										return 
									else
										GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										GameTimer:setRGB( 1, 0.22, 0.22 )
										GameTimer:setShaderVector( 0, 0.1, 0.22, 0, 0 )
										GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame7 )
									end
								end
								
								if event.interrupted then
									GameTimerFrame6( GameTimer, event )
									return 
								else
									GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									GameTimer:setRGB( 1, 0.16, 0.16 )
									GameTimer:setAlpha( 0 )
									GameTimer:setShaderVector( 0, 0.1, 0.16, 0, 0 )
									GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame6 )
								end
							end
							
							if event.interrupted then
								GameTimerFrame5( GameTimer, event )
								return 
							else
								GameTimer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								GameTimer:setRGB( 1, 0.14, 0.14 )
								GameTimer:setShaderVector( 0, 0.1, 0.14, 0, 0 )
								GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame5 )
							end
						end
						
						if event.interrupted then
							GameTimerFrame4( GameTimer, event )
							return 
						else
							GameTimer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							GameTimer:setRGB( 1, 0.08, 0.08 )
							GameTimer:setAlpha( 1 )
							GameTimer:setShaderVector( 0, 0.1, 0.08, 0, 0 )
							GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame4 )
						end
					end
					
					if event.interrupted then
						GameTimerFrame3( GameTimer, event )
						return 
					else
						GameTimer:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						GameTimer:setRGB( 1, 0.06, 0.06 )
						GameTimer:setShaderVector( 0, 0.1, 0.06, 0, 0 )
						GameTimer:registerEventHandler( "transition_complete_keyframe", GameTimerFrame3 )
					end
				end
				
				GameTimer:completeAnimation()
				self.GameTimer:setRGB( 1, 0, 0 )
				self.GameTimer:setAlpha( 0 )
				self.GameTimer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
				self.GameTimer:setShaderVector( 0, 0.1, 0, 0, 0 )
				self.GameTimer:setShaderVector( 1, 0.1, 0, 0, 0 )
				self.GameTimer:setShaderVector( 2, 0, 0, 0, 0 )
				self.GameTimer:setShaderVector( 3, 0, 0, 0, 0 )
				self.GameTimer:setShaderVector( 4, 0, 0, 0, 0 )
				GameTimerFrame2( GameTimer, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Semi:close()
		element.Line1:close()
		element.Line2:close()
		element.GameTimer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

