-- 81dc1eb010ba9f015972dbfb2fba7368
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_Panel" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_CharacterBack" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_CharacterImages" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_EventMessageRingContainer" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Dot" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_Arrow" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_CharacterText" )
require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget_CharacterSpeech" )

CoD.CommsWidget = InheritFrom( LUI.UIElement )
CoD.CommsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget )
	self.id = "CommsWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 492 )
	self:setTopBottom( true, false, 0, 177 )
	self.anyChildUsesUpdateState = true
	
	local CommsWidgetPanel0 = CoD.CommsWidget_Panel.new( menu, controller )
	CommsWidgetPanel0:setLeftRight( true, false, 350.49, 447.49 )
	CommsWidgetPanel0:setTopBottom( true, false, 45.27, 142.27 )
	CommsWidgetPanel0:setRGB( 0.79, 0.82, 0.85 )
	CommsWidgetPanel0:setScale( 1.2 )
	CommsWidgetPanel0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	CommsWidgetPanel0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( CommsWidgetPanel0 )
	self.CommsWidgetPanel0 = CommsWidgetPanel0
	
	local BackGlow = LUI.UIImage.new()
	BackGlow:setLeftRight( false, false, 92.83, 220.83 )
	BackGlow:setTopBottom( false, false, -62.55, 65.45 )
	BackGlow:setRGB( 0, 0, 0 )
	BackGlow:setAlpha( 0.4 )
	BackGlow:setScale( 1.6 )
	BackGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( BackGlow )
	self.BackGlow = BackGlow
	
	local CharacterBack = CoD.CommsWidget_CharacterBack.new( menu, controller )
	CharacterBack:setLeftRight( true, false, 314.33, 473.66 )
	CharacterBack:setTopBottom( true, false, 31.64, 175.97 )
	CharacterBack:setAlpha( 0.7 )
	self:addElement( CharacterBack )
	self.CharacterBack = CharacterBack
	
	local CharacterImages = CoD.CommsWidget_CharacterImages.new( menu, controller )
	CharacterImages:setLeftRight( true, false, 332.57, 471.66 )
	CharacterImages:setTopBottom( true, false, 33.82, 143.18 )
	CharacterImages:setZoom( 10 )
	CharacterImages:setScale( 0.9 )
	CharacterImages:linkToElementModel( self, nil, false, function ( model )
		CharacterImages:setModel( model, controller )
	end )
	self:addElement( CharacterImages )
	self.CharacterImages = CharacterImages
	
	local RingContainer = CoD.CommsWidget_EventMessageRingContainer.new( menu, controller )
	RingContainer:setLeftRight( true, false, 349.49, 432.49 )
	RingContainer:setTopBottom( true, false, 38.03, 121.03 )
	RingContainer:setAlpha( 0.9 )
	RingContainer:setZRot( 347 )
	RingContainer:setZoom( 10 )
	RingContainer:mergeStateConditions( {
		{
			stateName = "Fake",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( RingContainer )
	self.RingContainer = RingContainer
	
	local WaveFormFore = LUI.UIImage.new()
	WaveFormFore:setLeftRight( true, false, 309.98, 480.01 )
	WaveFormFore:setTopBottom( true, false, 5.93, 175.97 )
	WaveFormFore:setZoom( 20 )
	WaveFormFore:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_waveform1" ) )
	WaveFormFore:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_comms_radial_distortion" ) )
	WaveFormFore:setShaderVector( 0, 1, 1, 0, 0 )
	WaveFormFore:setShaderVector( 1, 0.35, 0.41, 1.28, 4.89 )
	WaveFormFore:setShaderVector( 2, 0.5, 60.19, 3.4, 0 )
	self:addElement( WaveFormFore )
	self.WaveFormFore = WaveFormFore
	
	local Dot1 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot1:setLeftRight( true, false, 328.5, 332.5 )
	Dot1:setTopBottom( true, false, 14, 18 )
	Dot1:setAlpha( 0.6 )
	Dot1:setZoom( 5 )
	Dot1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot1:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot1:setShaderVector( 1, 0, 0, 0, 0 )
	Dot1:setShaderVector( 2, 0, 0, 0, 0 )
	Dot1:setShaderVector( 3, 0, 0, 0, 0 )
	Dot1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot1 )
	self.Dot1 = Dot1
	
	local Dot2 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot2:setLeftRight( true, false, 468.5, 472.5 )
	Dot2:setTopBottom( true, false, 14, 18 )
	Dot2:setAlpha( 0.6 )
	Dot2:setZoom( 5 )
	Dot2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot2:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot2:setShaderVector( 1, 0, 0, 0, 0 )
	Dot2:setShaderVector( 2, 0, 0, 0, 0 )
	Dot2:setShaderVector( 3, 0, 0, 0, 0 )
	Dot2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot2 )
	self.Dot2 = Dot2
	
	local Dot3 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot3:setLeftRight( true, false, 328.5, 332.5 )
	Dot3:setTopBottom( true, false, 115, 119 )
	Dot3:setAlpha( 0.6 )
	Dot3:setZoom( 5 )
	Dot3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot3:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot3:setShaderVector( 1, 0, 0, 0, 0 )
	Dot3:setShaderVector( 2, 0, 0, 0, 0 )
	Dot3:setShaderVector( 3, 0, 0, 0, 0 )
	Dot3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot3 )
	self.Dot3 = Dot3
	
	local Dot4 = CoD.DamageWidget_Dot.new( menu, controller )
	Dot4:setLeftRight( true, false, 468.5, 472.5 )
	Dot4:setTopBottom( true, false, 115, 119 )
	Dot4:setAlpha( 0.6 )
	Dot4:setZoom( 5 )
	Dot4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Dot4:setShaderVector( 0, 0.2, 1, 0, 0 )
	Dot4:setShaderVector( 1, 0, 0, 0, 0 )
	Dot4:setShaderVector( 2, 0, 0, 0, 0 )
	Dot4:setShaderVector( 3, 0, 0, 0, 0 )
	Dot4:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Dot4 )
	self.Dot4 = Dot4
	
	local ImgArrow = CoD.CommsWidget_Arrow.new( menu, controller )
	ImgArrow:setLeftRight( true, false, 203.17, 209.84 )
	ImgArrow:setTopBottom( true, false, 104.83, 110.16 )
	ImgArrow:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ImgArrow:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	ImgArrow:setShaderVector( 1, 0, 0, 0, 0 )
	ImgArrow:setShaderVector( 2, 0, 0, 0, 0 )
	ImgArrow:setShaderVector( 3, 0, 0, 0, 0 )
	ImgArrow:setShaderVector( 4, 0, 0, 0, 0 )
	ImgArrow:mergeStateConditions( {
		{
			stateName = "Fake",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( ImgArrow )
	self.ImgArrow = ImgArrow
	
	local CharacterText0 = CoD.CommsWidget_CharacterText.new( menu, controller )
	CharacterText0:setLeftRight( false, true, -285.5, -166.51 )
	CharacterText0:setTopBottom( true, false, 80.5, 102.41 )
	CharacterText0:setZoom( 5 )
	CharacterText0:linkToElementModel( self, "characterName", true, function ( model )
		local characterName = Engine.GetModelValue( model )
		if characterName then
			CharacterText0.CommsName:setText( Engine.Localize( characterName ) )
		end
	end )
	self:addElement( CharacterText0 )
	self.CharacterText0 = CharacterText0
	
	local CharacterSpeech = CoD.CommsWidget_CharacterSpeech.new( menu, controller )
	CharacterSpeech:setLeftRight( true, false, 185.5, 206.5 )
	CharacterSpeech:setTopBottom( true, false, 80.5, 101.4 )
	CharacterSpeech:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	CharacterSpeech:setShaderVector( 0, 0.1, 1, 0, 0 )
	CharacterSpeech:setShaderVector( 1, 0, 0, 0, 0 )
	CharacterSpeech:setShaderVector( 2, 0, 0, 0, 0 )
	CharacterSpeech:setShaderVector( 3, 0, 0, 0, 0 )
	CharacterSpeech:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( CharacterSpeech )
	self.CharacterSpeech = CharacterSpeech
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				CommsWidgetPanel0:completeAnimation()
				self.CommsWidgetPanel0:setAlpha( 0 )
				self.clipFinished( CommsWidgetPanel0, {} )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				self.clipFinished( BackGlow, {} )

				CharacterBack:completeAnimation()
				self.CharacterBack:setAlpha( 0 )
				self.clipFinished( CharacterBack, {} )

				CharacterImages:completeAnimation()
				self.CharacterImages:setAlpha( 0 )
				self.clipFinished( CharacterImages, {} )

				RingContainer:completeAnimation()
				self.RingContainer:setAlpha( 0 )
				self.clipFinished( RingContainer, {} )

				WaveFormFore:completeAnimation()
				self.WaveFormFore:setAlpha( 0 )
				self.WaveFormFore:setZoom( 20 )
				self.clipFinished( WaveFormFore, {} )

				Dot1:completeAnimation()
				self.Dot1:setAlpha( 0 )
				self.clipFinished( Dot1, {} )

				Dot2:completeAnimation()
				self.Dot2:setAlpha( 0 )
				self.clipFinished( Dot2, {} )

				Dot3:completeAnimation()
				self.Dot3:setAlpha( 0 )
				self.clipFinished( Dot3, {} )

				Dot4:completeAnimation()
				self.Dot4:setAlpha( 0 )
				self.clipFinished( Dot4, {} )

				ImgArrow:completeAnimation()
				self.ImgArrow:setAlpha( 0 )
				self.clipFinished( ImgArrow, {} )

				CharacterText0:completeAnimation()
				self.CharacterText0:setAlpha( 0 )
				self.clipFinished( CharacterText0, {} )

				CharacterSpeech:completeAnimation()
				self.CharacterSpeech:setAlpha( 0 )
				self.clipFinished( CharacterSpeech, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 13 )

				local CommsWidgetPanel0Frame2 = function ( CommsWidgetPanel0, event )
					local CommsWidgetPanel0Frame3 = function ( CommsWidgetPanel0, event )
						if not event.interrupted then
							CommsWidgetPanel0:beginAnimation( "keyframe", 129, true, false, CoD.TweenType.Bounce )
						end
						CommsWidgetPanel0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CommsWidgetPanel0, event )
						else
							CommsWidgetPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CommsWidgetPanel0Frame3( CommsWidgetPanel0, event )
						return 
					else
						CommsWidgetPanel0:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
						CommsWidgetPanel0:registerEventHandler( "transition_complete_keyframe", CommsWidgetPanel0Frame3 )
					end
				end
				
				CommsWidgetPanel0:completeAnimation()
				self.CommsWidgetPanel0:setAlpha( 0 )
				CommsWidgetPanel0Frame2( CommsWidgetPanel0, {} )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						if not event.interrupted then
							BackGlow:beginAnimation( "keyframe", 129, true, false, CoD.TweenType.Bounce )
						end
						BackGlow:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( BackGlow, event )
						else
							BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BackGlowFrame3( BackGlow, event )
						return 
					else
						BackGlow:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Linear )
						BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame3 )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0 )
				BackGlowFrame2( BackGlow, {} )
				local CharacterBackFrame2 = function ( CharacterBack, event )
					local CharacterBackFrame3 = function ( CharacterBack, event )
						local CharacterBackFrame4 = function ( CharacterBack, event )
							local CharacterBackFrame5 = function ( CharacterBack, event )
								local CharacterBackFrame6 = function ( CharacterBack, event )
									local CharacterBackFrame7 = function ( CharacterBack, event )
										local CharacterBackFrame8 = function ( CharacterBack, event )
											local CharacterBackFrame9 = function ( CharacterBack, event )
												local CharacterBackFrame10 = function ( CharacterBack, event )
													local CharacterBackFrame11 = function ( CharacterBack, event )
														local CharacterBackFrame12 = function ( CharacterBack, event )
															local CharacterBackFrame13 = function ( CharacterBack, event )
																if not event.interrupted then
																	CharacterBack:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
																end
																CharacterBack:setAlpha( 0.7 )
																if event.interrupted then
																	self.clipFinished( CharacterBack, event )
																else
																	CharacterBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																end
															end
															
															if event.interrupted then
																CharacterBackFrame13( CharacterBack, event )
																return 
															else
																CharacterBack:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																CharacterBack:setAlpha( 0.77 )
																CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame13 )
															end
														end
														
														if event.interrupted then
															CharacterBackFrame12( CharacterBack, event )
															return 
														else
															CharacterBack:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															CharacterBack:setAlpha( 0.86 )
															CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame12 )
														end
													end
													
													if event.interrupted then
														CharacterBackFrame11( CharacterBack, event )
														return 
													else
														CharacterBack:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
														CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame11 )
													end
												end
												
												if event.interrupted then
													CharacterBackFrame10( CharacterBack, event )
													return 
												else
													CharacterBack:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													CharacterBack:setAlpha( 1 )
													CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame10 )
												end
											end
											
											if event.interrupted then
												CharacterBackFrame9( CharacterBack, event )
												return 
											else
												CharacterBack:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
												CharacterBack:setAlpha( 0.74 )
												CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame9 )
											end
										end
										
										if event.interrupted then
											CharacterBackFrame8( CharacterBack, event )
											return 
										else
											CharacterBack:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											CharacterBack:setAlpha( 0 )
											CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame8 )
										end
									end
									
									if event.interrupted then
										CharacterBackFrame7( CharacterBack, event )
										return 
									else
										CharacterBack:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame7 )
									end
								end
								
								if event.interrupted then
									CharacterBackFrame6( CharacterBack, event )
									return 
								else
									CharacterBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									CharacterBack:setAlpha( 1 )
									CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame6 )
								end
							end
							
							if event.interrupted then
								CharacterBackFrame5( CharacterBack, event )
								return 
							else
								CharacterBack:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								CharacterBack:setAlpha( 0 )
								CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame5 )
							end
						end
						
						if event.interrupted then
							CharacterBackFrame4( CharacterBack, event )
							return 
						else
							CharacterBack:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							CharacterBack:setAlpha( 0.63 )
							CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame4 )
						end
					end
					
					if event.interrupted then
						CharacterBackFrame3( CharacterBack, event )
						return 
					else
						CharacterBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame3 )
					end
				end
				
				CharacterBack:completeAnimation()
				self.CharacterBack:setAlpha( 0 )
				CharacterBackFrame2( CharacterBack, {} )
				local CharacterImagesFrame2 = function ( CharacterImages, event )
					local CharacterImagesFrame3 = function ( CharacterImages, event )
						local CharacterImagesFrame4 = function ( CharacterImages, event )
							local CharacterImagesFrame5 = function ( CharacterImages, event )
								if not event.interrupted then
									CharacterImages:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								end
								CharacterImages:setAlpha( 1 )
								CharacterImages:setZoom( 10 )
								if event.interrupted then
									self.clipFinished( CharacterImages, event )
								else
									CharacterImages:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CharacterImagesFrame5( CharacterImages, event )
								return 
							else
								CharacterImages:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								CharacterImages:setZoom( 16.15 )
								CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame5 )
							end
						end
						
						if event.interrupted then
							CharacterImagesFrame4( CharacterImages, event )
							return 
						else
							CharacterImages:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Linear )
							CharacterImages:setAlpha( 1 )
							CharacterImages:setZoom( 18.46 )
							CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame4 )
						end
					end
					
					if event.interrupted then
						CharacterImagesFrame3( CharacterImages, event )
						return 
					else
						CharacterImages:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame3 )
					end
				end
				
				CharacterImages:completeAnimation()
				self.CharacterImages:setAlpha( 0 )
				self.CharacterImages:setZoom( 50 )
				CharacterImagesFrame2( CharacterImages, {} )
				local RingContainerFrame2 = function ( RingContainer, event )
					local RingContainerFrame3 = function ( RingContainer, event )
						local RingContainerFrame4 = function ( RingContainer, event )
							local RingContainerFrame5 = function ( RingContainer, event )
								local RingContainerFrame6 = function ( RingContainer, event )
									local RingContainerFrame7 = function ( RingContainer, event )
										local RingContainerFrame8 = function ( RingContainer, event )
											local RingContainerFrame9 = function ( RingContainer, event )
												local RingContainerFrame10 = function ( RingContainer, event )
													if not event.interrupted then
														RingContainer:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
													end
													RingContainer:setLeftRight( true, false, 349.49, 432.49 )
													RingContainer:setTopBottom( true, false, 38.03, 121.03 )
													RingContainer:setAlpha( 1 )
													RingContainer:setZRot( 347 )
													if event.interrupted then
														self.clipFinished( RingContainer, event )
													else
														RingContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													RingContainerFrame10( RingContainer, event )
													return 
												else
													RingContainer:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
													RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame10 )
												end
											end
											
											if event.interrupted then
												RingContainerFrame9( RingContainer, event )
												return 
											else
												RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												RingContainer:setAlpha( 1 )
												RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame9 )
											end
										end
										
										if event.interrupted then
											RingContainerFrame8( RingContainer, event )
											return 
										else
											RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame8 )
										end
									end
									
									if event.interrupted then
										RingContainerFrame7( RingContainer, event )
										return 
									else
										RingContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										RingContainer:setAlpha( 0 )
										RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame7 )
									end
								end
								
								if event.interrupted then
									RingContainerFrame6( RingContainer, event )
									return 
								else
									RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									RingContainer:setAlpha( 1 )
									RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame6 )
								end
							end
							
							if event.interrupted then
								RingContainerFrame5( RingContainer, event )
								return 
							else
								RingContainer:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								RingContainer:setAlpha( 0 )
								RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame5 )
							end
						end
						
						if event.interrupted then
							RingContainerFrame4( RingContainer, event )
							return 
						else
							RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							RingContainer:setAlpha( 1 )
							RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame4 )
						end
					end
					
					if event.interrupted then
						RingContainerFrame3( RingContainer, event )
						return 
					else
						RingContainer:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame3 )
					end
				end
				
				RingContainer:completeAnimation()
				self.RingContainer:setLeftRight( true, false, 349.49, 432.49 )
				self.RingContainer:setTopBottom( true, false, 38.03, 121.03 )
				self.RingContainer:setAlpha( 0 )
				self.RingContainer:setZRot( 347 )
				RingContainerFrame2( RingContainer, {} )
				local WaveFormForeFrame2 = function ( WaveFormFore, event )
					local WaveFormForeFrame3 = function ( WaveFormFore, event )
						if not event.interrupted then
							WaveFormFore:beginAnimation( "keyframe", 340, false, true, CoD.TweenType.Linear )
						end
						WaveFormFore:setAlpha( 1 )
						WaveFormFore:setZoom( 20 )
						if event.interrupted then
							self.clipFinished( WaveFormFore, event )
						else
							WaveFormFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WaveFormForeFrame3( WaveFormFore, event )
						return 
					else
						WaveFormFore:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
						WaveFormFore:registerEventHandler( "transition_complete_keyframe", WaveFormForeFrame3 )
					end
				end
				
				WaveFormFore:completeAnimation()
				self.WaveFormFore:setAlpha( 0 )
				self.WaveFormFore:setZoom( -20 )
				WaveFormForeFrame2( WaveFormFore, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						if not event.interrupted then
							Dot1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						Dot1:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Dot1, event )
						else
							Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setAlpha( 0 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						local Dot2Frame4 = function ( Dot2, event )
							if not event.interrupted then
								Dot2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							end
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
							Dot2:beginAnimation( "keyframe", 90, false, true, CoD.TweenType.Back )
							Dot2:setAlpha( 1 )
							Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame4 )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setAlpha( 0 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						local Dot3Frame4 = function ( Dot3, event )
							if not event.interrupted then
								Dot3:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							end
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
							Dot3:beginAnimation( "keyframe", 109, false, true, CoD.TweenType.Back )
							Dot3:setAlpha( 1 )
							Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame4 )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setAlpha( 0 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						local Dot4Frame4 = function ( Dot4, event )
							local Dot4Frame5 = function ( Dot4, event )
								if not event.interrupted then
									Dot4:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								Dot4:setAlpha( 0.6 )
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
								Dot4:beginAnimation( "keyframe", 10, false, true, CoD.TweenType.Back )
								Dot4:setAlpha( 0 )
								Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame5 )
							end
						end
						
						if event.interrupted then
							Dot4Frame4( Dot4, event )
							return 
						else
							Dot4:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							Dot4:setAlpha( 1 )
							Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame4 )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setAlpha( 0 )
				Dot4Frame2( Dot4, {} )
				local ImgArrowFrame2 = function ( ImgArrow, event )
					local ImgArrowFrame3 = function ( ImgArrow, event )
						local ImgArrowFrame4 = function ( ImgArrow, event )
							local ImgArrowFrame5 = function ( ImgArrow, event )
								local ImgArrowFrame6 = function ( ImgArrow, event )
									if not event.interrupted then
										ImgArrow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									end
									ImgArrow:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ImgArrow, event )
									else
										ImgArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ImgArrowFrame6( ImgArrow, event )
									return 
								else
									ImgArrow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ImgArrow:setAlpha( 0 )
									ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame6 )
								end
							end
							
							if event.interrupted then
								ImgArrowFrame5( ImgArrow, event )
								return 
							else
								ImgArrow:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame5 )
							end
						end
						
						if event.interrupted then
							ImgArrowFrame4( ImgArrow, event )
							return 
						else
							ImgArrow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ImgArrow:setAlpha( 0.82 )
							ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame4 )
						end
					end
					
					if event.interrupted then
						ImgArrowFrame3( ImgArrow, event )
						return 
					else
						ImgArrow:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame3 )
					end
				end
				
				ImgArrow:completeAnimation()
				self.ImgArrow:setAlpha( 0 )
				ImgArrowFrame2( ImgArrow, {} )
				local CharacterText0Frame2 = function ( CharacterText0, event )
					local CharacterText0Frame3 = function ( CharacterText0, event )
						local CharacterText0Frame4 = function ( CharacterText0, event )
							local CharacterText0Frame5 = function ( CharacterText0, event )
								local CharacterText0Frame6 = function ( CharacterText0, event )
									local CharacterText0Frame7 = function ( CharacterText0, event )
										if not event.interrupted then
											CharacterText0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
										end
										CharacterText0:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( CharacterText0, event )
										else
											CharacterText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										CharacterText0Frame7( CharacterText0, event )
										return 
									else
										CharacterText0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										CharacterText0:setAlpha( 0.28 )
										CharacterText0:registerEventHandler( "transition_complete_keyframe", CharacterText0Frame7 )
									end
								end
								
								if event.interrupted then
									CharacterText0Frame6( CharacterText0, event )
									return 
								else
									CharacterText0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									CharacterText0:setAlpha( 0.12 )
									CharacterText0:registerEventHandler( "transition_complete_keyframe", CharacterText0Frame6 )
								end
							end
							
							if event.interrupted then
								CharacterText0Frame5( CharacterText0, event )
								return 
							else
								CharacterText0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								CharacterText0:setAlpha( 0.37 )
								CharacterText0:registerEventHandler( "transition_complete_keyframe", CharacterText0Frame5 )
							end
						end
						
						if event.interrupted then
							CharacterText0Frame4( CharacterText0, event )
							return 
						else
							CharacterText0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							CharacterText0:setAlpha( 0.12 )
							CharacterText0:registerEventHandler( "transition_complete_keyframe", CharacterText0Frame4 )
						end
					end
					
					if event.interrupted then
						CharacterText0Frame3( CharacterText0, event )
						return 
					else
						CharacterText0:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						CharacterText0:registerEventHandler( "transition_complete_keyframe", CharacterText0Frame3 )
					end
				end
				
				CharacterText0:completeAnimation()
				self.CharacterText0:setAlpha( 0 )
				CharacterText0Frame2( CharacterText0, {} )
				local CharacterSpeechFrame2 = function ( CharacterSpeech, event )
					local CharacterSpeechFrame3 = function ( CharacterSpeech, event )
						local CharacterSpeechFrame4 = function ( CharacterSpeech, event )
							local CharacterSpeechFrame5 = function ( CharacterSpeech, event )
								local CharacterSpeechFrame6 = function ( CharacterSpeech, event )
									local CharacterSpeechFrame7 = function ( CharacterSpeech, event )
										local CharacterSpeechFrame8 = function ( CharacterSpeech, event )
											local CharacterSpeechFrame9 = function ( CharacterSpeech, event )
												local CharacterSpeechFrame10 = function ( CharacterSpeech, event )
													local CharacterSpeechFrame11 = function ( CharacterSpeech, event )
														if not event.interrupted then
															CharacterSpeech:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														end
														CharacterSpeech:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( CharacterSpeech, event )
														else
															CharacterSpeech:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														CharacterSpeechFrame11( CharacterSpeech, event )
														return 
													else
														CharacterSpeech:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
														CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame11 )
													end
												end
												
												if event.interrupted then
													CharacterSpeechFrame10( CharacterSpeech, event )
													return 
												else
													CharacterSpeech:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													CharacterSpeech:setAlpha( 0 )
													CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame10 )
												end
											end
											
											if event.interrupted then
												CharacterSpeechFrame9( CharacterSpeech, event )
												return 
											else
												CharacterSpeech:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame9 )
											end
										end
										
										if event.interrupted then
											CharacterSpeechFrame8( CharacterSpeech, event )
											return 
										else
											CharacterSpeech:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											CharacterSpeech:setAlpha( 1 )
											CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame8 )
										end
									end
									
									if event.interrupted then
										CharacterSpeechFrame7( CharacterSpeech, event )
										return 
									else
										CharacterSpeech:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame7 )
									end
								end
								
								if event.interrupted then
									CharacterSpeechFrame6( CharacterSpeech, event )
									return 
								else
									CharacterSpeech:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									CharacterSpeech:setAlpha( 0 )
									CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame6 )
								end
							end
							
							if event.interrupted then
								CharacterSpeechFrame5( CharacterSpeech, event )
								return 
							else
								CharacterSpeech:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame5 )
							end
						end
						
						if event.interrupted then
							CharacterSpeechFrame4( CharacterSpeech, event )
							return 
						else
							CharacterSpeech:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							CharacterSpeech:setAlpha( 0.5 )
							CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame4 )
						end
					end
					
					if event.interrupted then
						CharacterSpeechFrame3( CharacterSpeech, event )
						return 
					else
						CharacterSpeech:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Linear )
						CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame3 )
					end
				end
				
				CharacterSpeech:completeAnimation()
				self.CharacterSpeech:setAlpha( 0 )
				CharacterSpeechFrame2( CharacterSpeech, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )

				CommsWidgetPanel0:completeAnimation()
				self.CommsWidgetPanel0:setAlpha( 1 )
				self.clipFinished( CommsWidgetPanel0, {} )

				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.4 )
				self.clipFinished( BackGlow, {} )

				CharacterBack:completeAnimation()
				self.CharacterBack:setAlpha( 1 )
				self.clipFinished( CharacterBack, {} )

				CharacterImages:completeAnimation()
				self.CharacterImages:setAlpha( 1 )
				self.clipFinished( CharacterImages, {} )

				RingContainer:completeAnimation()
				self.RingContainer:setAlpha( 1 )
				self.RingContainer:setZRot( 347 )
				self.clipFinished( RingContainer, {} )

				WaveFormFore:completeAnimation()
				self.WaveFormFore:setAlpha( 1 )
				self.WaveFormFore:setZoom( 20 )
				self.clipFinished( WaveFormFore, {} )

				Dot1:completeAnimation()
				self.Dot1:setAlpha( 0.6 )
				self.clipFinished( Dot1, {} )

				Dot2:completeAnimation()
				self.Dot2:setAlpha( 0.6 )
				self.clipFinished( Dot2, {} )

				Dot3:completeAnimation()
				self.Dot3:setAlpha( 0.6 )
				self.clipFinished( Dot3, {} )

				Dot4:completeAnimation()
				self.Dot4:setAlpha( 0.6 )
				self.clipFinished( Dot4, {} )

				ImgArrow:completeAnimation()
				self.ImgArrow:setAlpha( 1 )
				self.clipFinished( ImgArrow, {} )

				CharacterText0:completeAnimation()
				self.CharacterText0:setAlpha( 1 )
				self.clipFinished( CharacterText0, {} )

				CharacterSpeech:completeAnimation()
				self.CharacterSpeech:setAlpha( 1 )
				self.clipFinished( CharacterSpeech, {} )
			end,
			HudStop = function ()
				self:setupElementClipCounter( 13 )

				local CommsWidgetPanel0Frame2 = function ( CommsWidgetPanel0, event )
					local CommsWidgetPanel0Frame3 = function ( CommsWidgetPanel0, event )
						local CommsWidgetPanel0Frame4 = function ( CommsWidgetPanel0, event )
							if not event.interrupted then
								CommsWidgetPanel0:beginAnimation( "keyframe", 229, true, false, CoD.TweenType.Bounce )
							end
							CommsWidgetPanel0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CommsWidgetPanel0, event )
							else
								CommsWidgetPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CommsWidgetPanel0Frame4( CommsWidgetPanel0, event )
							return 
						else
							CommsWidgetPanel0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							CommsWidgetPanel0:registerEventHandler( "transition_complete_keyframe", CommsWidgetPanel0Frame4 )
						end
					end
					
					if event.interrupted then
						CommsWidgetPanel0Frame3( CommsWidgetPanel0, event )
						return 
					else
						CommsWidgetPanel0:beginAnimation( "keyframe", 259, true, false, CoD.TweenType.Bounce )
						CommsWidgetPanel0:setAlpha( 0.5 )
						CommsWidgetPanel0:registerEventHandler( "transition_complete_keyframe", CommsWidgetPanel0Frame3 )
					end
				end
				
				CommsWidgetPanel0:completeAnimation()
				self.CommsWidgetPanel0:setAlpha( 1 )
				CommsWidgetPanel0Frame2( CommsWidgetPanel0, {} )
				local BackGlowFrame2 = function ( BackGlow, event )
					local BackGlowFrame3 = function ( BackGlow, event )
						local BackGlowFrame4 = function ( BackGlow, event )
							if not event.interrupted then
								BackGlow:beginAnimation( "keyframe", 229, true, false, CoD.TweenType.Bounce )
							end
							BackGlow:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( BackGlow, event )
							else
								BackGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BackGlowFrame4( BackGlow, event )
							return 
						else
							BackGlow:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame4 )
						end
					end
					
					if event.interrupted then
						BackGlowFrame3( BackGlow, event )
						return 
					else
						BackGlow:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						BackGlow:setAlpha( 0.3 )
						BackGlow:registerEventHandler( "transition_complete_keyframe", BackGlowFrame3 )
					end
				end
				
				BackGlow:completeAnimation()
				self.BackGlow:setAlpha( 0.4 )
				BackGlowFrame2( BackGlow, {} )
				local CharacterBackFrame2 = function ( CharacterBack, event )
					local CharacterBackFrame3 = function ( CharacterBack, event )
						local CharacterBackFrame4 = function ( CharacterBack, event )
							if not event.interrupted then
								CharacterBack:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							CharacterBack:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CharacterBack, event )
							else
								CharacterBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CharacterBackFrame4( CharacterBack, event )
							return 
						else
							CharacterBack:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							CharacterBack:setAlpha( 0 )
							CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame4 )
						end
					end
					
					if event.interrupted then
						CharacterBackFrame3( CharacterBack, event )
						return 
					else
						CharacterBack:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						CharacterBack:setAlpha( 1 )
						CharacterBack:registerEventHandler( "transition_complete_keyframe", CharacterBackFrame3 )
					end
				end
				
				CharacterBack:completeAnimation()
				self.CharacterBack:setAlpha( 0.7 )
				CharacterBackFrame2( CharacterBack, {} )
				local CharacterImagesFrame2 = function ( CharacterImages, event )
					local CharacterImagesFrame3 = function ( CharacterImages, event )
						local CharacterImagesFrame4 = function ( CharacterImages, event )
							local CharacterImagesFrame5 = function ( CharacterImages, event )
								local CharacterImagesFrame6 = function ( CharacterImages, event )
									local CharacterImagesFrame7 = function ( CharacterImages, event )
										local CharacterImagesFrame8 = function ( CharacterImages, event )
											local CharacterImagesFrame9 = function ( CharacterImages, event )
												if not event.interrupted then
													CharacterImages:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
												end
												CharacterImages:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( CharacterImages, event )
												else
													CharacterImages:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												CharacterImagesFrame9( CharacterImages, event )
												return 
											else
												CharacterImages:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
												CharacterImages:setAlpha( 0.58 )
												CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame9 )
											end
										end
										
										if event.interrupted then
											CharacterImagesFrame8( CharacterImages, event )
											return 
										else
											CharacterImages:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											CharacterImages:setAlpha( 0.29 )
											CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame8 )
										end
									end
									
									if event.interrupted then
										CharacterImagesFrame7( CharacterImages, event )
										return 
									else
										CharacterImages:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
										CharacterImages:setAlpha( 0.62 )
										CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame7 )
									end
								end
								
								if event.interrupted then
									CharacterImagesFrame6( CharacterImages, event )
									return 
								else
									CharacterImages:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									CharacterImages:setAlpha( 0.77 )
									CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame6 )
								end
							end
							
							if event.interrupted then
								CharacterImagesFrame5( CharacterImages, event )
								return 
							else
								CharacterImages:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								CharacterImages:setAlpha( 0.69 )
								CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame5 )
							end
						end
						
						if event.interrupted then
							CharacterImagesFrame4( CharacterImages, event )
							return 
						else
							CharacterImages:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							CharacterImages:setAlpha( 0.44 )
							CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame4 )
						end
					end
					
					if event.interrupted then
						CharacterImagesFrame3( CharacterImages, event )
						return 
					else
						CharacterImages:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						CharacterImages:registerEventHandler( "transition_complete_keyframe", CharacterImagesFrame3 )
					end
				end
				
				CharacterImages:completeAnimation()
				self.CharacterImages:setAlpha( 1 )
				CharacterImagesFrame2( CharacterImages, {} )
				local RingContainerFrame2 = function ( RingContainer, event )
					local RingContainerFrame3 = function ( RingContainer, event )
						local RingContainerFrame4 = function ( RingContainer, event )
							local RingContainerFrame5 = function ( RingContainer, event )
								local RingContainerFrame6 = function ( RingContainer, event )
									local RingContainerFrame7 = function ( RingContainer, event )
										local RingContainerFrame8 = function ( RingContainer, event )
											local RingContainerFrame9 = function ( RingContainer, event )
												local RingContainerFrame10 = function ( RingContainer, event )
													if not event.interrupted then
														RingContainer:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
													end
													RingContainer:setAlpha( 0 )
													RingContainer:setZRot( 461 )
													if event.interrupted then
														self.clipFinished( RingContainer, event )
													else
														RingContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													RingContainerFrame10( RingContainer, event )
													return 
												else
													RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													RingContainer:setAlpha( 0 )
													RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame10 )
												end
											end
											
											if event.interrupted then
												RingContainerFrame9( RingContainer, event )
												return 
											else
												RingContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
												RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame9 )
											end
										end
										
										if event.interrupted then
											RingContainerFrame8( RingContainer, event )
											return 
										else
											RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											RingContainer:setAlpha( 0.96 )
											RingContainer:setZRot( 461 )
											RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame8 )
										end
									end
									
									if event.interrupted then
										RingContainerFrame7( RingContainer, event )
										return 
									else
										RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame7 )
									end
								end
								
								if event.interrupted then
									RingContainerFrame6( RingContainer, event )
									return 
								else
									RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									RingContainer:setAlpha( 0 )
									RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame6 )
								end
							end
							
							if event.interrupted then
								RingContainerFrame5( RingContainer, event )
								return 
							else
								RingContainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame5 )
							end
						end
						
						if event.interrupted then
							RingContainerFrame4( RingContainer, event )
							return 
						else
							RingContainer:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							RingContainer:setZRot( 527 )
							RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame4 )
						end
					end
					
					if event.interrupted then
						RingContainerFrame3( RingContainer, event )
						return 
					else
						RingContainer:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						RingContainer:registerEventHandler( "transition_complete_keyframe", RingContainerFrame3 )
					end
				end
				
				RingContainer:completeAnimation()
				self.RingContainer:setAlpha( 1 )
				self.RingContainer:setZRot( 347 )
				RingContainerFrame2( RingContainer, {} )
				local WaveFormForeFrame2 = function ( WaveFormFore, event )
					local WaveFormForeFrame3 = function ( WaveFormFore, event )
						if not event.interrupted then
							WaveFormFore:beginAnimation( "keyframe", 570, false, false, CoD.TweenType.Linear )
						end
						WaveFormFore:setAlpha( 0 )
						WaveFormFore:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( WaveFormFore, event )
						else
							WaveFormFore:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WaveFormForeFrame3( WaveFormFore, event )
						return 
					else
						WaveFormFore:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						WaveFormFore:registerEventHandler( "transition_complete_keyframe", WaveFormForeFrame3 )
					end
				end
				
				WaveFormFore:completeAnimation()
				self.WaveFormFore:setAlpha( 1 )
				self.WaveFormFore:setZoom( 20 )
				WaveFormForeFrame2( WaveFormFore, {} )
				local Dot1Frame2 = function ( Dot1, event )
					local Dot1Frame3 = function ( Dot1, event )
						if not event.interrupted then
							Dot1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						end
						Dot1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot1, event )
						else
							Dot1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot1Frame3( Dot1, event )
						return 
					else
						Dot1:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						Dot1:setAlpha( 1 )
						Dot1:registerEventHandler( "transition_complete_keyframe", Dot1Frame3 )
					end
				end
				
				Dot1:completeAnimation()
				self.Dot1:setAlpha( 0.6 )
				Dot1Frame2( Dot1, {} )
				local Dot2Frame2 = function ( Dot2, event )
					local Dot2Frame3 = function ( Dot2, event )
						if not event.interrupted then
							Dot2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						end
						Dot2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot2, event )
						else
							Dot2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot2Frame3( Dot2, event )
						return 
					else
						Dot2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						Dot2:setAlpha( 1 )
						Dot2:registerEventHandler( "transition_complete_keyframe", Dot2Frame3 )
					end
				end
				
				Dot2:completeAnimation()
				self.Dot2:setAlpha( 0.6 )
				Dot2Frame2( Dot2, {} )
				local Dot3Frame2 = function ( Dot3, event )
					local Dot3Frame3 = function ( Dot3, event )
						if not event.interrupted then
							Dot3:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						end
						Dot3:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot3, event )
						else
							Dot3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot3Frame3( Dot3, event )
						return 
					else
						Dot3:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Dot3:setAlpha( 1 )
						Dot3:registerEventHandler( "transition_complete_keyframe", Dot3Frame3 )
					end
				end
				
				Dot3:completeAnimation()
				self.Dot3:setAlpha( 0.6 )
				Dot3Frame2( Dot3, {} )
				local Dot4Frame2 = function ( Dot4, event )
					local Dot4Frame3 = function ( Dot4, event )
						if not event.interrupted then
							Dot4:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						end
						Dot4:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Dot4, event )
						else
							Dot4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Dot4Frame3( Dot4, event )
						return 
					else
						Dot4:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						Dot4:setAlpha( 1 )
						Dot4:registerEventHandler( "transition_complete_keyframe", Dot4Frame3 )
					end
				end
				
				Dot4:completeAnimation()
				self.Dot4:setAlpha( 0.6 )
				Dot4Frame2( Dot4, {} )
				local ImgArrowFrame2 = function ( ImgArrow, event )
					local ImgArrowFrame3 = function ( ImgArrow, event )
						local ImgArrowFrame4 = function ( ImgArrow, event )
							local ImgArrowFrame5 = function ( ImgArrow, event )
								local ImgArrowFrame6 = function ( ImgArrow, event )
									local ImgArrowFrame7 = function ( ImgArrow, event )
										if not event.interrupted then
											ImgArrow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										end
										ImgArrow:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( ImgArrow, event )
										else
											ImgArrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										ImgArrowFrame7( ImgArrow, event )
										return 
									else
										ImgArrow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame7 )
									end
								end
								
								if event.interrupted then
									ImgArrowFrame6( ImgArrow, event )
									return 
								else
									ImgArrow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									ImgArrow:setAlpha( 1 )
									ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame6 )
								end
							end
							
							if event.interrupted then
								ImgArrowFrame5( ImgArrow, event )
								return 
							else
								ImgArrow:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame5 )
							end
						end
						
						if event.interrupted then
							ImgArrowFrame4( ImgArrow, event )
							return 
						else
							ImgArrow:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							ImgArrow:setAlpha( 0 )
							ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame4 )
						end
					end
					
					if event.interrupted then
						ImgArrowFrame3( ImgArrow, event )
						return 
					else
						ImgArrow:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						ImgArrow:registerEventHandler( "transition_complete_keyframe", ImgArrowFrame3 )
					end
				end
				
				ImgArrow:completeAnimation()
				self.ImgArrow:setAlpha( 1 )
				ImgArrowFrame2( ImgArrow, {} )
				local CharacterText0Frame2 = function ( CharacterText0, event )
					local CharacterText0Frame3 = function ( CharacterText0, event )
						if not event.interrupted then
							CharacterText0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						end
						CharacterText0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( CharacterText0, event )
						else
							CharacterText0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CharacterText0Frame3( CharacterText0, event )
						return 
					else
						CharacterText0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						CharacterText0:registerEventHandler( "transition_complete_keyframe", CharacterText0Frame3 )
					end
				end
				
				CharacterText0:completeAnimation()
				self.CharacterText0:setAlpha( 1 )
				CharacterText0Frame2( CharacterText0, {} )
				local CharacterSpeechFrame2 = function ( CharacterSpeech, event )
					local CharacterSpeechFrame3 = function ( CharacterSpeech, event )
						local CharacterSpeechFrame4 = function ( CharacterSpeech, event )
							local CharacterSpeechFrame5 = function ( CharacterSpeech, event )
								local CharacterSpeechFrame6 = function ( CharacterSpeech, event )
									local CharacterSpeechFrame7 = function ( CharacterSpeech, event )
										if not event.interrupted then
											CharacterSpeech:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										end
										CharacterSpeech:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( CharacterSpeech, event )
										else
											CharacterSpeech:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										CharacterSpeechFrame7( CharacterSpeech, event )
										return 
									else
										CharacterSpeech:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
										CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame7 )
									end
								end
								
								if event.interrupted then
									CharacterSpeechFrame6( CharacterSpeech, event )
									return 
								else
									CharacterSpeech:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									CharacterSpeech:setAlpha( 0.74 )
									CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame6 )
								end
							end
							
							if event.interrupted then
								CharacterSpeechFrame5( CharacterSpeech, event )
								return 
							else
								CharacterSpeech:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
								CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame5 )
							end
						end
						
						if event.interrupted then
							CharacterSpeechFrame4( CharacterSpeech, event )
							return 
						else
							CharacterSpeech:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							CharacterSpeech:setAlpha( 0.17 )
							CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame4 )
						end
					end
					
					if event.interrupted then
						CharacterSpeechFrame3( CharacterSpeech, event )
						return 
					else
						CharacterSpeech:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						CharacterSpeech:registerEventHandler( "transition_complete_keyframe", CharacterSpeechFrame3 )
					end
				end
				
				CharacterSpeech:completeAnimation()
				self.CharacterSpeech:setAlpha( 1 )
				CharacterSpeechFrame2( CharacterSpeech, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CommsWidgetPanel0:close()
		element.CharacterBack:close()
		element.CharacterImages:close()
		element.RingContainer:close()
		element.Dot1:close()
		element.Dot2:close()
		element.Dot3:close()
		element.Dot4:close()
		element.ImgArrow:close()
		element.CharacterText0:close()
		element.CharacterSpeech:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

