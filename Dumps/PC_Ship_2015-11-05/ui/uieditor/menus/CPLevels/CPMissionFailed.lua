require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.MissionFailed.MissionFailed_FailreasonText" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_dotblinkwidget" )

LUI.createMenu.CPMissionFailed = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPMissionFailed" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPMissionFailed.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.31 )
	self:addElement( black )
	self.black = black
	
	local scorestreakVignetteContainer0 = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer0:setLeftRight( true, true, 0, 0 )
	scorestreakVignetteContainer0:setTopBottom( true, true, 0, 0 )
	self:addElement( scorestreakVignetteContainer0 )
	self.scorestreakVignetteContainer0 = scorestreakVignetteContainer0
	
	local CenterBox0 = LUI.UIImage.new()
	CenterBox0:setLeftRight( false, false, -325, 325 )
	CenterBox0:setTopBottom( false, false, -160, -2 )
	CenterBox0:setRGB( 0.73, 0, 0 )
	CenterBox0:setZoom( -30 )
	CenterBox0:setImage( RegisterImage( "uie_t7_hud_outofbounds_centerbox" ) )
	CenterBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterBox0 )
	self.CenterBox0 = CenterBox0
	
	local CenterBox = LUI.UIImage.new()
	CenterBox:setLeftRight( false, false, -325, 325 )
	CenterBox:setTopBottom( false, false, -160, -2 )
	CenterBox:setRGB( 0.73, 0, 0 )
	CenterBox:setImage( RegisterImage( "uie_t7_hud_outofbounds_centerbox" ) )
	CenterBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterBox )
	self.CenterBox = CenterBox
	
	local feLeftContainerNOTLobby0 = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	feLeftContainerNOTLobby0:setLeftRight( true, false, 66.96, 498.96 )
	feLeftContainerNOTLobby0:setTopBottom( true, false, 652, 684 )
	self:addElement( feLeftContainerNOTLobby0 )
	self.feLeftContainerNOTLobby0 = feLeftContainerNOTLobby0
	
	local MissionFailedFailreasonText = CoD.MissionFailed_FailreasonText.new( self, controller )
	MissionFailedFailreasonText:setLeftRight( false, false, -122.25, 133.25 )
	MissionFailedFailreasonText:setTopBottom( true, false, 365.5, 385.5 )
	self:addElement( MissionFailedFailreasonText )
	self.MissionFailedFailreasonText = MissionFailedFailreasonText
	
	local MissionFailedFailreasonText0 = CoD.MissionFailed_FailreasonText.new( self, controller )
	MissionFailedFailreasonText0:setLeftRight( false, false, -95.63, 106.62 )
	MissionFailedFailreasonText0:setTopBottom( true, false, 389.5, 409.5 )
	self:addElement( MissionFailedFailreasonText0 )
	self.MissionFailedFailreasonText0 = MissionFailedFailreasonText0
	
	local AbilityWheelPixel10 = CoD.AbilityWheel_Pixel.new( self, controller )
	AbilityWheelPixel10:setLeftRight( false, false, 320.09, 328.09 )
	AbilityWheelPixel10:setTopBottom( false, false, -142, -134 )
	AbilityWheelPixel10.Image20:setAlpha( 0.7 )
	AbilityWheelPixel10.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel10 )
	self.AbilityWheelPixel10 = AbilityWheelPixel10
	
	local AbilityWheelPixel30 = CoD.AbilityWheel_Pixel.new( self, controller )
	AbilityWheelPixel30:setLeftRight( false, false, 320.09, 328.09 )
	AbilityWheelPixel30:setTopBottom( false, false, -29, -21 )
	AbilityWheelPixel30.Image20:setAlpha( 0.7 )
	AbilityWheelPixel30.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel30 )
	self.AbilityWheelPixel30 = AbilityWheelPixel30
	
	local AbilityWheelPixel000 = CoD.AbilityWheel_Pixel.new( self, controller )
	AbilityWheelPixel000:setLeftRight( false, false, -332.91, -324.91 )
	AbilityWheelPixel000:setTopBottom( false, false, -142, -134 )
	AbilityWheelPixel000.Image20:setAlpha( 0.7 )
	AbilityWheelPixel000.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel000 )
	self.AbilityWheelPixel000 = AbilityWheelPixel000
	
	local AbilityWheelPixel200 = CoD.AbilityWheel_Pixel.new( self, controller )
	AbilityWheelPixel200:setLeftRight( false, false, -332.91, -324.91 )
	AbilityWheelPixel200:setTopBottom( false, false, -29, -21 )
	AbilityWheelPixel200.Image20:setAlpha( 0.7 )
	AbilityWheelPixel200.Image20:setZoom( 10 )
	self:addElement( AbilityWheelPixel200 )
	self.AbilityWheelPixel200 = AbilityWheelPixel200
	
	local RightBar000 = LUI.UIImage.new()
	RightBar000:setLeftRight( false, false, 338.69, 715 )
	RightBar000:setTopBottom( true, false, 268.43, 291.57 )
	RightBar000:setRGB( 0.73, 0, 0 )
	RightBar000:setZoom( -30 )
	RightBar000:setImage( RegisterImage( "uie_t7_hud_outofbounds_sidebar" ) )
	RightBar000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightBar000 )
	self.RightBar000 = RightBar000
	
	local RightBar00 = LUI.UIImage.new()
	RightBar00:setLeftRight( false, false, 318.69, 695 )
	RightBar00:setTopBottom( true, false, 268.43, 291.57 )
	RightBar00:setRGB( 0.73, 0, 0 )
	RightBar00:setImage( RegisterImage( "uie_t7_hud_outofbounds_sidebar" ) )
	RightBar00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightBar00 )
	self.RightBar00 = RightBar00
	
	local RightBar001 = LUI.UIImage.new()
	RightBar001:setLeftRight( false, false, -689.72, -313.41 )
	RightBar001:setTopBottom( true, false, 268.43, 291.57 )
	RightBar001:setRGB( 0.73, 0, 0 )
	RightBar001:setImage( RegisterImage( "uie_t7_hud_outofbounds_sidebar" ) )
	RightBar001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightBar001 )
	self.RightBar001 = RightBar001
	
	local RightBar0000 = LUI.UIImage.new()
	RightBar0000:setLeftRight( false, false, -711.72, -335.41 )
	RightBar0000:setTopBottom( true, false, 268.43, 291.57 )
	RightBar0000:setRGB( 0.73, 0, 0 )
	RightBar0000:setZoom( -30 )
	RightBar0000:setImage( RegisterImage( "uie_t7_hud_outofbounds_sidebar" ) )
	RightBar0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RightBar0000 )
	self.RightBar0000 = RightBar0000
	
	local outofboundsdotblinkwidget11 = CoD.outofbounds_dotblinkwidget.new( self, controller )
	outofboundsdotblinkwidget11:setLeftRight( false, false, -4, 4 )
	outofboundsdotblinkwidget11:setTopBottom( false, false, 98, 106 )
	self:addElement( outofboundsdotblinkwidget11 )
	self.outofboundsdotblinkwidget11 = outofboundsdotblinkwidget11
	
	local MissionFailedback = LUI.UIText.new()
	MissionFailedback:setLeftRight( true, true, 64, -64 )
	MissionFailedback:setTopBottom( false, false, -110.5, -50.5 )
	MissionFailedback:setAlpha( 0.5 )
	MissionFailedback:setZoom( -30 )
	MissionFailedback:setText( Engine.Localize( "GAME_MISSIONFAILED" ) )
	MissionFailedback:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	MissionFailedback:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	MissionFailedback:setShaderVector( 0, 0.1, 0, 0, 0 )
	MissionFailedback:setShaderVector( 1, 0, 0, 0, 0 )
	MissionFailedback:setShaderVector( 2, 1, 0, 0, 0 )
	MissionFailedback:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	MissionFailedback:setLetterSpacing( 5.5 )
	MissionFailedback:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MissionFailedback:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionFailedback )
	self.MissionFailedback = MissionFailedback
	
	local MissionFailed = LUI.UIText.new()
	MissionFailed:setLeftRight( true, true, 64, -64 )
	MissionFailed:setTopBottom( false, false, -108.5, -48.5 )
	MissionFailed:setText( Engine.Localize( "GAME_MISSIONFAILED" ) )
	MissionFailed:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	MissionFailed:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	MissionFailed:setShaderVector( 0, 0.1, 0, 0, 0 )
	MissionFailed:setShaderVector( 1, 0, 0, 0, 0 )
	MissionFailed:setShaderVector( 2, 1, 0, 0, 0 )
	MissionFailed:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	MissionFailed:setLetterSpacing( 5.5 )
	MissionFailed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	MissionFailed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( MissionFailed )
	self.MissionFailed = MissionFailed
	
	local outofboundsdotblinkwidget110 = CoD.outofbounds_dotblinkwidget.new( self, controller )
	outofboundsdotblinkwidget110:setLeftRight( false, false, -4, 4 )
	outofboundsdotblinkwidget110:setTopBottom( false, false, -247, -239 )
	self:addElement( outofboundsdotblinkwidget110 )
	self.outofboundsdotblinkwidget110 = outofboundsdotblinkwidget110
	
	self.MissionFailedFailreasonText:linkToElementModel( self, "MissionFailReason", true, function ( model )
		local MissionFailReason = Engine.GetModelValue( model )
		if MissionFailReason then
			MissionFailedFailreasonText.FailReason:setText( Engine.Localize( MissionFailReason ) )
		end
	end )
	self.MissionFailedFailreasonText0:linkToElementModel( self, "MissionFailHint", true, function ( model )
		local MissionFailHint = Engine.GetModelValue( model )
		if MissionFailHint then
			MissionFailedFailreasonText0.FailReason:setText( Engine.Localize( MissionFailHint ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )
				local blackFrame2 = function ( black, event )
					if not event.interrupted then
						black:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					black:setAlpha( 0.31 )
					if event.interrupted then
						self.clipFinished( black, event )
					else
						black:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				black:completeAnimation()
				self.black:setAlpha( 0 )
				blackFrame2( black, {} )
				local CenterBox0Frame2 = function ( CenterBox0, event )
					local CenterBox0Frame3 = function ( CenterBox0, event )
						local CenterBox0Frame4 = function ( CenterBox0, event )
							local CenterBox0Frame5 = function ( CenterBox0, event )
								local CenterBox0Frame6 = function ( CenterBox0, event )
									if not event.interrupted then
										CenterBox0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									CenterBox0:setLeftRight( false, false, -325, 325 )
									CenterBox0:setTopBottom( false, false, -160, -2 )
									CenterBox0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( CenterBox0, event )
									else
										CenterBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									CenterBox0Frame6( CenterBox0, event )
									return 
								else
									CenterBox0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									CenterBox0:setAlpha( 0 )
									CenterBox0:registerEventHandler( "transition_complete_keyframe", CenterBox0Frame6 )
								end
							end
							
							if event.interrupted then
								CenterBox0Frame5( CenterBox0, event )
								return 
							else
								CenterBox0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								CenterBox0:setAlpha( 1 )
								CenterBox0:registerEventHandler( "transition_complete_keyframe", CenterBox0Frame5 )
							end
						end
						
						if event.interrupted then
							CenterBox0Frame4( CenterBox0, event )
							return 
						else
							CenterBox0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							CenterBox0:setAlpha( 0 )
							CenterBox0:registerEventHandler( "transition_complete_keyframe", CenterBox0Frame4 )
						end
					end
					
					if event.interrupted then
						CenterBox0Frame3( CenterBox0, event )
						return 
					else
						CenterBox0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						CenterBox0:setTopBottom( false, false, -160, -2 )
						CenterBox0:setAlpha( 1 )
						CenterBox0:registerEventHandler( "transition_complete_keyframe", CenterBox0Frame3 )
					end
				end
				
				CenterBox0:completeAnimation()
				self.CenterBox0:setLeftRight( false, false, -325, 325 )
				self.CenterBox0:setTopBottom( false, false, -79.43, -77.5 )
				self.CenterBox0:setAlpha( 0 )
				CenterBox0Frame2( CenterBox0, {} )
				local CenterBoxFrame2 = function ( CenterBox, event )
					local CenterBoxFrame3 = function ( CenterBox, event )
						local CenterBoxFrame4 = function ( CenterBox, event )
							local CenterBoxFrame5 = function ( CenterBox, event )
								local CenterBoxFrame6 = function ( CenterBox, event )
									if not event.interrupted then
										CenterBox:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									end
									CenterBox:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( CenterBox, event )
									else
										CenterBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									CenterBoxFrame6( CenterBox, event )
									return 
								else
									CenterBox:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									CenterBox:setAlpha( 0 )
									CenterBox:registerEventHandler( "transition_complete_keyframe", CenterBoxFrame6 )
								end
							end
							
							if event.interrupted then
								CenterBoxFrame5( CenterBox, event )
								return 
							else
								CenterBox:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								CenterBox:setAlpha( 1 )
								CenterBox:registerEventHandler( "transition_complete_keyframe", CenterBoxFrame5 )
							end
						end
						
						if event.interrupted then
							CenterBoxFrame4( CenterBox, event )
							return 
						else
							CenterBox:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
							CenterBox:registerEventHandler( "transition_complete_keyframe", CenterBoxFrame4 )
						end
					end
					
					if event.interrupted then
						CenterBoxFrame3( CenterBox, event )
						return 
					else
						CenterBox:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						CenterBox:registerEventHandler( "transition_complete_keyframe", CenterBoxFrame3 )
					end
				end
				
				CenterBox:completeAnimation()
				self.CenterBox:setAlpha( 0 )
				CenterBoxFrame2( CenterBox, {} )
				local feLeftContainerNOTLobby0Frame2 = function ( feLeftContainerNOTLobby0, event )
					if not event.interrupted then
						feLeftContainerNOTLobby0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					feLeftContainerNOTLobby0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( feLeftContainerNOTLobby0, event )
					else
						feLeftContainerNOTLobby0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				feLeftContainerNOTLobby0:completeAnimation()
				self.feLeftContainerNOTLobby0:setAlpha( 0 )
				feLeftContainerNOTLobby0Frame2( feLeftContainerNOTLobby0, {} )
				local MissionFailedFailreasonTextFrame2 = function ( MissionFailedFailreasonText, event )
					if not event.interrupted then
						MissionFailedFailreasonText:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					MissionFailedFailreasonText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MissionFailedFailreasonText, event )
					else
						MissionFailedFailreasonText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MissionFailedFailreasonText:completeAnimation()
				self.MissionFailedFailreasonText:setAlpha( 0 )
				MissionFailedFailreasonTextFrame2( MissionFailedFailreasonText, {} )
				local MissionFailedFailreasonText0Frame2 = function ( MissionFailedFailreasonText0, event )
					if not event.interrupted then
						MissionFailedFailreasonText0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					MissionFailedFailreasonText0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MissionFailedFailreasonText0, event )
					else
						MissionFailedFailreasonText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MissionFailedFailreasonText0:completeAnimation()
				self.MissionFailedFailreasonText0:setAlpha( 0 )
				MissionFailedFailreasonText0Frame2( MissionFailedFailreasonText0, {} )
				local AbilityWheelPixel10Frame2 = function ( AbilityWheelPixel10, event )
					local AbilityWheelPixel10Frame3 = function ( AbilityWheelPixel10, event )
						local AbilityWheelPixel10Frame4 = function ( AbilityWheelPixel10, event )
							local AbilityWheelPixel10Frame5 = function ( AbilityWheelPixel10, event )
								local AbilityWheelPixel10Frame6 = function ( AbilityWheelPixel10, event )
									local AbilityWheelPixel10Frame7 = function ( AbilityWheelPixel10, event )
										local AbilityWheelPixel10Frame8 = function ( AbilityWheelPixel10, event )
											local AbilityWheelPixel10Frame9 = function ( AbilityWheelPixel10, event )
												local AbilityWheelPixel10Frame10 = function ( AbilityWheelPixel10, event )
													local AbilityWheelPixel10Frame11 = function ( AbilityWheelPixel10, event )
														local AbilityWheelPixel10Frame12 = function ( AbilityWheelPixel10, event )
															if not event.interrupted then
																AbilityWheelPixel10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															AbilityWheelPixel10:setLeftRight( false, false, 320.09, 328.09 )
															AbilityWheelPixel10:setTopBottom( false, false, -142, -134 )
															AbilityWheelPixel10:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( AbilityWheelPixel10, event )
															else
																AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															AbilityWheelPixel10Frame12( AbilityWheelPixel10, event )
															return 
														else
															AbilityWheelPixel10:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
															AbilityWheelPixel10:setLeftRight( false, false, 640.09, 648.09 )
															AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame12 )
														end
													end
													
													if event.interrupted then
														AbilityWheelPixel10Frame11( AbilityWheelPixel10, event )
														return 
													else
														AbilityWheelPixel10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														AbilityWheelPixel10:setLeftRight( false, false, 320.09, 328.09 )
														AbilityWheelPixel10:setAlpha( 1 )
														AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame11 )
													end
												end
												
												if event.interrupted then
													AbilityWheelPixel10Frame10( AbilityWheelPixel10, event )
													return 
												else
													AbilityWheelPixel10:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													AbilityWheelPixel10:setLeftRight( false, false, 344.71, 352.71 )
													AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityWheelPixel10Frame9( AbilityWheelPixel10, event )
												return 
											else
												AbilityWheelPixel10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AbilityWheelPixel10:setLeftRight( false, false, 615.48, 623.48 )
												AbilityWheelPixel10:setAlpha( 0 )
												AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityWheelPixel10Frame8( AbilityWheelPixel10, event )
											return 
										else
											AbilityWheelPixel10:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
											AbilityWheelPixel10:setLeftRight( false, false, 640.09, 648.09 )
											AbilityWheelPixel10:setAlpha( 0.05 )
											AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityWheelPixel10Frame7( AbilityWheelPixel10, event )
										return 
									else
										AbilityWheelPixel10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityWheelPixel10:setLeftRight( false, false, 320.09, 328.09 )
										AbilityWheelPixel10:setAlpha( 1 )
										AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityWheelPixel10Frame6( AbilityWheelPixel10, event )
									return 
								else
									AbilityWheelPixel10:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									AbilityWheelPixel10:setLeftRight( false, false, 346.76, 354.76 )
									AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelPixel10Frame5( AbilityWheelPixel10, event )
								return 
							else
								AbilityWheelPixel10:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityWheelPixel10:setLeftRight( false, false, 613.43, 621.43 )
								AbilityWheelPixel10:setAlpha( 0 )
								AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelPixel10Frame4( AbilityWheelPixel10, event )
							return 
						else
							AbilityWheelPixel10:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							AbilityWheelPixel10:setLeftRight( false, false, 640.09, 648.09 )
							AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel10Frame3( AbilityWheelPixel10, event )
						return 
					else
						AbilityWheelPixel10:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel10:setAlpha( 1 )
						AbilityWheelPixel10:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel10Frame3 )
					end
				end
				
				AbilityWheelPixel10:completeAnimation()
				self.AbilityWheelPixel10:setLeftRight( false, false, 320.09, 328.09 )
				self.AbilityWheelPixel10:setTopBottom( false, false, -142, -134 )
				self.AbilityWheelPixel10:setAlpha( 0 )
				AbilityWheelPixel10Frame2( AbilityWheelPixel10, {} )
				local AbilityWheelPixel30Frame2 = function ( AbilityWheelPixel30, event )
					local AbilityWheelPixel30Frame3 = function ( AbilityWheelPixel30, event )
						local AbilityWheelPixel30Frame4 = function ( AbilityWheelPixel30, event )
							local AbilityWheelPixel30Frame5 = function ( AbilityWheelPixel30, event )
								local AbilityWheelPixel30Frame6 = function ( AbilityWheelPixel30, event )
									local AbilityWheelPixel30Frame7 = function ( AbilityWheelPixel30, event )
										local AbilityWheelPixel30Frame8 = function ( AbilityWheelPixel30, event )
											local AbilityWheelPixel30Frame9 = function ( AbilityWheelPixel30, event )
												local AbilityWheelPixel30Frame10 = function ( AbilityWheelPixel30, event )
													local AbilityWheelPixel30Frame11 = function ( AbilityWheelPixel30, event )
														local AbilityWheelPixel30Frame12 = function ( AbilityWheelPixel30, event )
															if not event.interrupted then
																AbilityWheelPixel30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															AbilityWheelPixel30:setLeftRight( false, false, 320.09, 328.09 )
															AbilityWheelPixel30:setTopBottom( false, false, -29, -21 )
															AbilityWheelPixel30:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( AbilityWheelPixel30, event )
															else
																AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															AbilityWheelPixel30Frame12( AbilityWheelPixel30, event )
															return 
														else
															AbilityWheelPixel30:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
															AbilityWheelPixel30:setLeftRight( false, false, 640.09, 648.09 )
															AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame12 )
														end
													end
													
													if event.interrupted then
														AbilityWheelPixel30Frame11( AbilityWheelPixel30, event )
														return 
													else
														AbilityWheelPixel30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														AbilityWheelPixel30:setLeftRight( false, false, 320.09, 328.09 )
														AbilityWheelPixel30:setAlpha( 1 )
														AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame11 )
													end
												end
												
												if event.interrupted then
													AbilityWheelPixel30Frame10( AbilityWheelPixel30, event )
													return 
												else
													AbilityWheelPixel30:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													AbilityWheelPixel30:setLeftRight( false, false, 344.71, 352.71 )
													AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityWheelPixel30Frame9( AbilityWheelPixel30, event )
												return 
											else
												AbilityWheelPixel30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AbilityWheelPixel30:setLeftRight( false, false, 615.48, 623.48 )
												AbilityWheelPixel30:setAlpha( 0 )
												AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityWheelPixel30Frame8( AbilityWheelPixel30, event )
											return 
										else
											AbilityWheelPixel30:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
											AbilityWheelPixel30:setLeftRight( false, false, 640.09, 648.09 )
											AbilityWheelPixel30:setAlpha( 0.05 )
											AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityWheelPixel30Frame7( AbilityWheelPixel30, event )
										return 
									else
										AbilityWheelPixel30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityWheelPixel30:setLeftRight( false, false, 320.09, 328.09 )
										AbilityWheelPixel30:setAlpha( 1 )
										AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityWheelPixel30Frame6( AbilityWheelPixel30, event )
									return 
								else
									AbilityWheelPixel30:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									AbilityWheelPixel30:setLeftRight( false, false, 346.76, 354.76 )
									AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelPixel30Frame5( AbilityWheelPixel30, event )
								return 
							else
								AbilityWheelPixel30:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityWheelPixel30:setLeftRight( false, false, 613.43, 621.43 )
								AbilityWheelPixel30:setAlpha( 0 )
								AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelPixel30Frame4( AbilityWheelPixel30, event )
							return 
						else
							AbilityWheelPixel30:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							AbilityWheelPixel30:setLeftRight( false, false, 640.09, 648.09 )
							AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel30Frame3( AbilityWheelPixel30, event )
						return 
					else
						AbilityWheelPixel30:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel30:setAlpha( 1 )
						AbilityWheelPixel30:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel30Frame3 )
					end
				end
				
				AbilityWheelPixel30:completeAnimation()
				self.AbilityWheelPixel30:setLeftRight( false, false, 320.09, 328.09 )
				self.AbilityWheelPixel30:setTopBottom( false, false, -29, -21 )
				self.AbilityWheelPixel30:setAlpha( 0 )
				AbilityWheelPixel30Frame2( AbilityWheelPixel30, {} )
				local AbilityWheelPixel000Frame2 = function ( AbilityWheelPixel000, event )
					local AbilityWheelPixel000Frame3 = function ( AbilityWheelPixel000, event )
						local AbilityWheelPixel000Frame4 = function ( AbilityWheelPixel000, event )
							local AbilityWheelPixel000Frame5 = function ( AbilityWheelPixel000, event )
								local AbilityWheelPixel000Frame6 = function ( AbilityWheelPixel000, event )
									local AbilityWheelPixel000Frame7 = function ( AbilityWheelPixel000, event )
										local AbilityWheelPixel000Frame8 = function ( AbilityWheelPixel000, event )
											local AbilityWheelPixel000Frame9 = function ( AbilityWheelPixel000, event )
												local AbilityWheelPixel000Frame10 = function ( AbilityWheelPixel000, event )
													local AbilityWheelPixel000Frame11 = function ( AbilityWheelPixel000, event )
														local AbilityWheelPixel000Frame12 = function ( AbilityWheelPixel000, event )
															if not event.interrupted then
																AbilityWheelPixel000:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															AbilityWheelPixel000:setLeftRight( false, false, -332.91, -324.91 )
															AbilityWheelPixel000:setTopBottom( false, false, -142, -134 )
															AbilityWheelPixel000:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( AbilityWheelPixel000, event )
															else
																AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															AbilityWheelPixel000Frame12( AbilityWheelPixel000, event )
															return 
														else
															AbilityWheelPixel000:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
															AbilityWheelPixel000:setLeftRight( false, false, -652.91, -644.91 )
															AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame12 )
														end
													end
													
													if event.interrupted then
														AbilityWheelPixel000Frame11( AbilityWheelPixel000, event )
														return 
													else
														AbilityWheelPixel000:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														AbilityWheelPixel000:setLeftRight( false, false, -332.91, -324.91 )
														AbilityWheelPixel000:setAlpha( 1 )
														AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame11 )
													end
												end
												
												if event.interrupted then
													AbilityWheelPixel000Frame10( AbilityWheelPixel000, event )
													return 
												else
													AbilityWheelPixel000:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													AbilityWheelPixel000:setLeftRight( false, false, -357.52, -349.52 )
													AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityWheelPixel000Frame9( AbilityWheelPixel000, event )
												return 
											else
												AbilityWheelPixel000:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AbilityWheelPixel000:setLeftRight( false, false, -628.29, -620.29 )
												AbilityWheelPixel000:setAlpha( 0 )
												AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityWheelPixel000Frame8( AbilityWheelPixel000, event )
											return 
										else
											AbilityWheelPixel000:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
											AbilityWheelPixel000:setLeftRight( false, false, -652.91, -644.91 )
											AbilityWheelPixel000:setAlpha( 0.05 )
											AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityWheelPixel000Frame7( AbilityWheelPixel000, event )
										return 
									else
										AbilityWheelPixel000:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityWheelPixel000:setLeftRight( false, false, -332.91, -324.91 )
										AbilityWheelPixel000:setAlpha( 1 )
										AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityWheelPixel000Frame6( AbilityWheelPixel000, event )
									return 
								else
									AbilityWheelPixel000:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									AbilityWheelPixel000:setLeftRight( false, false, -359.57, -351.57 )
									AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelPixel000Frame5( AbilityWheelPixel000, event )
								return 
							else
								AbilityWheelPixel000:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityWheelPixel000:setLeftRight( false, false, -626.24, -618.24 )
								AbilityWheelPixel000:setAlpha( 0 )
								AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelPixel000Frame4( AbilityWheelPixel000, event )
							return 
						else
							AbilityWheelPixel000:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							AbilityWheelPixel000:setLeftRight( false, false, -652.91, -644.91 )
							AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel000Frame3( AbilityWheelPixel000, event )
						return 
					else
						AbilityWheelPixel000:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel000:setAlpha( 1 )
						AbilityWheelPixel000:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel000Frame3 )
					end
				end
				
				AbilityWheelPixel000:completeAnimation()
				self.AbilityWheelPixel000:setLeftRight( false, false, -332.91, -324.91 )
				self.AbilityWheelPixel000:setTopBottom( false, false, -142, -134 )
				self.AbilityWheelPixel000:setAlpha( 0 )
				AbilityWheelPixel000Frame2( AbilityWheelPixel000, {} )
				local AbilityWheelPixel200Frame2 = function ( AbilityWheelPixel200, event )
					local AbilityWheelPixel200Frame3 = function ( AbilityWheelPixel200, event )
						local AbilityWheelPixel200Frame4 = function ( AbilityWheelPixel200, event )
							local AbilityWheelPixel200Frame5 = function ( AbilityWheelPixel200, event )
								local AbilityWheelPixel200Frame6 = function ( AbilityWheelPixel200, event )
									local AbilityWheelPixel200Frame7 = function ( AbilityWheelPixel200, event )
										local AbilityWheelPixel200Frame8 = function ( AbilityWheelPixel200, event )
											local AbilityWheelPixel200Frame9 = function ( AbilityWheelPixel200, event )
												local AbilityWheelPixel200Frame10 = function ( AbilityWheelPixel200, event )
													local AbilityWheelPixel200Frame11 = function ( AbilityWheelPixel200, event )
														local AbilityWheelPixel200Frame12 = function ( AbilityWheelPixel200, event )
															if not event.interrupted then
																AbilityWheelPixel200:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															end
															AbilityWheelPixel200:setLeftRight( false, false, -332.91, -324.91 )
															AbilityWheelPixel200:setTopBottom( false, false, -29, -21 )
															AbilityWheelPixel200:setAlpha( 1 )
															if event.interrupted then
																self.clipFinished( AbilityWheelPixel200, event )
															else
																AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															AbilityWheelPixel200Frame12( AbilityWheelPixel200, event )
															return 
														else
															AbilityWheelPixel200:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
															AbilityWheelPixel200:setLeftRight( false, false, -652.91, -644.91 )
															AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame12 )
														end
													end
													
													if event.interrupted then
														AbilityWheelPixel200Frame11( AbilityWheelPixel200, event )
														return 
													else
														AbilityWheelPixel200:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														AbilityWheelPixel200:setLeftRight( false, false, -332.91, -324.91 )
														AbilityWheelPixel200:setAlpha( 1 )
														AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame11 )
													end
												end
												
												if event.interrupted then
													AbilityWheelPixel200Frame10( AbilityWheelPixel200, event )
													return 
												else
													AbilityWheelPixel200:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
													AbilityWheelPixel200:setLeftRight( false, false, -357.52, -349.52 )
													AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame10 )
												end
											end
											
											if event.interrupted then
												AbilityWheelPixel200Frame9( AbilityWheelPixel200, event )
												return 
											else
												AbilityWheelPixel200:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												AbilityWheelPixel200:setLeftRight( false, false, -628.29, -620.29 )
												AbilityWheelPixel200:setAlpha( 0 )
												AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame9 )
											end
										end
										
										if event.interrupted then
											AbilityWheelPixel200Frame8( AbilityWheelPixel200, event )
											return 
										else
											AbilityWheelPixel200:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
											AbilityWheelPixel200:setLeftRight( false, false, -652.91, -644.91 )
											AbilityWheelPixel200:setAlpha( 0.05 )
											AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame8 )
										end
									end
									
									if event.interrupted then
										AbilityWheelPixel200Frame7( AbilityWheelPixel200, event )
										return 
									else
										AbilityWheelPixel200:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										AbilityWheelPixel200:setLeftRight( false, false, -332.91, -324.91 )
										AbilityWheelPixel200:setAlpha( 1 )
										AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame7 )
									end
								end
								
								if event.interrupted then
									AbilityWheelPixel200Frame6( AbilityWheelPixel200, event )
									return 
								else
									AbilityWheelPixel200:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									AbilityWheelPixel200:setLeftRight( false, false, -359.57, -351.57 )
									AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelPixel200Frame5( AbilityWheelPixel200, event )
								return 
							else
								AbilityWheelPixel200:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityWheelPixel200:setLeftRight( false, false, -626.24, -618.24 )
								AbilityWheelPixel200:setAlpha( 0 )
								AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelPixel200Frame4( AbilityWheelPixel200, event )
							return 
						else
							AbilityWheelPixel200:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
							AbilityWheelPixel200:setLeftRight( false, false, -652.91, -644.91 )
							AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelPixel200Frame3( AbilityWheelPixel200, event )
						return 
					else
						AbilityWheelPixel200:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						AbilityWheelPixel200:setAlpha( 1 )
						AbilityWheelPixel200:registerEventHandler( "transition_complete_keyframe", AbilityWheelPixel200Frame3 )
					end
				end
				
				AbilityWheelPixel200:completeAnimation()
				self.AbilityWheelPixel200:setLeftRight( false, false, -332.91, -324.91 )
				self.AbilityWheelPixel200:setTopBottom( false, false, -29, -21 )
				self.AbilityWheelPixel200:setAlpha( 0 )
				AbilityWheelPixel200Frame2( AbilityWheelPixel200, {} )
				local RightBar000Frame2 = function ( RightBar000, event )
					if not event.interrupted then
						RightBar000:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					RightBar000:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RightBar000, event )
					else
						RightBar000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RightBar000:completeAnimation()
				self.RightBar000:setAlpha( 0 )
				RightBar000Frame2( RightBar000, {} )
				local RightBar00Frame2 = function ( RightBar00, event )
					if not event.interrupted then
						RightBar00:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					RightBar00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RightBar00, event )
					else
						RightBar00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RightBar00:completeAnimation()
				self.RightBar00:setAlpha( 0 )
				RightBar00Frame2( RightBar00, {} )
				local RightBar001Frame2 = function ( RightBar001, event )
					if not event.interrupted then
						RightBar001:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					RightBar001:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RightBar001, event )
					else
						RightBar001:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RightBar001:completeAnimation()
				self.RightBar001:setAlpha( 0 )
				RightBar001Frame2( RightBar001, {} )
				local RightBar0000Frame2 = function ( RightBar0000, event )
					if not event.interrupted then
						RightBar0000:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					RightBar0000:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RightBar0000, event )
					else
						RightBar0000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RightBar0000:completeAnimation()
				self.RightBar0000:setAlpha( 0 )
				RightBar0000Frame2( RightBar0000, {} )
				local outofboundsdotblinkwidget11Frame2 = function ( outofboundsdotblinkwidget11, event )
					if not event.interrupted then
						outofboundsdotblinkwidget11:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					outofboundsdotblinkwidget11:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( outofboundsdotblinkwidget11, event )
					else
						outofboundsdotblinkwidget11:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				outofboundsdotblinkwidget11:completeAnimation()
				self.outofboundsdotblinkwidget11:setAlpha( 0 )
				outofboundsdotblinkwidget11Frame2( outofboundsdotblinkwidget11, {} )
				local MissionFailedbackFrame2 = function ( MissionFailedback, event )
					if not event.interrupted then
						MissionFailedback:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					MissionFailedback:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( MissionFailedback, event )
					else
						MissionFailedback:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MissionFailedback:completeAnimation()
				self.MissionFailedback:setAlpha( 0 )
				MissionFailedbackFrame2( MissionFailedback, {} )
				local MissionFailedFrame2 = function ( MissionFailed, event )
					if not event.interrupted then
						MissionFailed:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
					end
					MissionFailed:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( MissionFailed, event )
					else
						MissionFailed:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MissionFailed:completeAnimation()
				self.MissionFailed:setAlpha( 0 )
				MissionFailedFrame2( MissionFailed, {} )
			end
		}
	}
	feLeftContainerNOTLobby0:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer0:close()
		element.feLeftContainerNOTLobby0:close()
		element.MissionFailedFailreasonText:close()
		element.MissionFailedFailreasonText0:close()
		element.AbilityWheelPixel10:close()
		element.AbilityWheelPixel30:close()
		element.AbilityWheelPixel000:close()
		element.AbilityWheelPixel200:close()
		element.outofboundsdotblinkwidget11:close()
		element.outofboundsdotblinkwidget110:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPMissionFailed.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

