require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_EnviroHazardBottom" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_SemiCircle" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_BackLine" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Arrow" )
require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_Pixel" )

CoD.DamageWidget_EnviroHazardContainer = InheritFrom( LUI.UIElement )
CoD.DamageWidget_EnviroHazardContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_EnviroHazardContainer )
	self.id = "DamageWidget_EnviroHazardContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 134 )
	self:setTopBottom( true, false, 0, 80 )
	self.anyChildUsesUpdateState = true
	
	local ImgHess2Glow = LUI.UIImage.new()
	ImgHess2Glow:setLeftRight( true, false, -5, 153.67 )
	ImgHess2Glow:setTopBottom( true, false, 8.34, 87.34 )
	ImgHess2Glow:setRGB( 1, 1, 1 )
	ImgHess2Glow:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_uiglowhess2" ) )
	ImgHess2Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgHess2Glow )
	self.ImgHess2Glow = ImgHess2Glow
	
	local ImgHess1Glow = LUI.UIImage.new()
	ImgHess1Glow:setLeftRight( true, false, -5, 153.67 )
	ImgHess1Glow:setTopBottom( true, false, 8.34, 87.34 )
	ImgHess1Glow:setRGB( 1, 1, 1 )
	ImgHess1Glow:setAlpha( 0 )
	ImgHess1Glow:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_uiglowhess1" ) )
	ImgHess1Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgHess1Glow )
	self.ImgHess1Glow = ImgHess1Glow
	
	local EnviroHazard1 = CoD.DamageWidget_EnviroHazardBottom.new( menu, controller )
	EnviroHazard1:setLeftRight( true, false, 9, 193.01 )
	EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
	EnviroHazard1:setRGB( 1, 1, 1 )
	EnviroHazard1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	EnviroHazard1:setShaderVector( 0, 0.1, 0, 0, 0 )
	EnviroHazard1:setShaderVector( 1, 0, 0, 0, 0 )
	EnviroHazard1:setShaderVector( 2, 0, 0, 0, 0 )
	EnviroHazard1:setShaderVector( 3, 0, 0, 0, 0 )
	EnviroHazard1:setShaderVector( 4, 0, 0, 0, 0 )
	EnviroHazard1:subscribeToGlobalModel( controller, "HUDItems", "hess1", function ( model )
		EnviroHazard1:setModel( model, controller )
	end )
	self:addElement( EnviroHazard1 )
	self.EnviroHazard1 = EnviroHazard1
	
	local EnviroHazard2 = CoD.DamageWidget_EnviroHazardBottom.new( menu, controller )
	EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
	EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
	EnviroHazard2:setRGB( 1, 1, 1 )
	EnviroHazard2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	EnviroHazard2:setShaderVector( 0, 0.1, 0, 0, 0 )
	EnviroHazard2:setShaderVector( 1, 0, 0, 0, 0 )
	EnviroHazard2:setShaderVector( 2, 0, 0, 0, 0 )
	EnviroHazard2:setShaderVector( 3, 0, 0, 0, 0 )
	EnviroHazard2:setShaderVector( 4, 0, 0, 0, 0 )
	EnviroHazard2:subscribeToGlobalModel( controller, "HUDItems", "hess2", function ( model )
		EnviroHazard2:setModel( model, controller )
	end )
	self:addElement( EnviroHazard2 )
	self.EnviroHazard2 = EnviroHazard2
	
	local DamageWidgetSemiCircle0 = CoD.DamageWidget_SemiCircle.new( menu, controller )
	DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
	DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
	DamageWidgetSemiCircle0:setRGB( 1, 1, 1 )
	DamageWidgetSemiCircle0:setZoom( 2 )
	DamageWidgetSemiCircle0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	DamageWidgetSemiCircle0:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	DamageWidgetSemiCircle0:setShaderVector( 1, 0, 0, 0, 0 )
	DamageWidgetSemiCircle0:setShaderVector( 2, 0, 0, 0, 0 )
	DamageWidgetSemiCircle0:setShaderVector( 3, 0, 0, 0, 0 )
	DamageWidgetSemiCircle0:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( DamageWidgetSemiCircle0 )
	self.DamageWidgetSemiCircle0 = DamageWidgetSemiCircle0
	
	local AmmoWidgetBackLine = CoD.AmmoWidget_BackLine.new( menu, controller )
	AmmoWidgetBackLine:setLeftRight( true, false, -66, 29 )
	AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
	AmmoWidgetBackLine:setRGB( 1, 1, 1 )
	AmmoWidgetBackLine:setAlpha( 0.5 )
	AmmoWidgetBackLine:setZoom( -3 )
	self:addElement( AmmoWidgetBackLine )
	self.AmmoWidgetBackLine = AmmoWidgetBackLine
	
	local AmmoWidgetBackLine0 = CoD.AmmoWidget_BackLine.new( menu, controller )
	AmmoWidgetBackLine0:setLeftRight( true, false, -66, 31 )
	AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
	AmmoWidgetBackLine0:setRGB( 1, 1, 1 )
	AmmoWidgetBackLine0:setAlpha( 0.5 )
	AmmoWidgetBackLine0:setZoom( -3 )
	self:addElement( AmmoWidgetBackLine0 )
	self.AmmoWidgetBackLine0 = AmmoWidgetBackLine0
	
	local DamageWidgetArrow0 = CoD.DamageWidget_Arrow.new( menu, controller )
	DamageWidgetArrow0:setLeftRight( true, false, 0, 5.33 )
	DamageWidgetArrow0:setTopBottom( true, false, 36.67, 43.34 )
	DamageWidgetArrow0:setRGB( 1, 1, 1 )
	DamageWidgetArrow0:setZRot( 180 )
	DamageWidgetArrow0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	DamageWidgetArrow0:setShaderVector( 0, 0.1, 0.5, 0, 0 )
	DamageWidgetArrow0:setShaderVector( 1, 0, 0, 0, 0 )
	DamageWidgetArrow0:setShaderVector( 2, 0, 0, 0, 0 )
	DamageWidgetArrow0:setShaderVector( 3, 0, 0, 0, 0 )
	DamageWidgetArrow0:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( DamageWidgetArrow0 )
	self.DamageWidgetArrow0 = DamageWidgetArrow0
	
	local DamageWidgetPixel0 = CoD.DamageWidget_Pixel.new( menu, controller )
	DamageWidgetPixel0:setLeftRight( true, false, 7, 14 )
	DamageWidgetPixel0:setTopBottom( true, false, 39, 40 )
	DamageWidgetPixel0:setRGB( 1, 1, 1 )
	DamageWidgetPixel0:setAlpha( 0 )
	DamageWidgetPixel0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	DamageWidgetPixel0:setShaderVector( 0, 0.2, 0.5, 0, 0 )
	DamageWidgetPixel0:setShaderVector( 1, 0, 0, 0, 0 )
	DamageWidgetPixel0:setShaderVector( 2, 0, 0, 0, 0 )
	DamageWidgetPixel0:setShaderVector( 3, 0, 0, 0, 0 )
	DamageWidgetPixel0:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( DamageWidgetPixel0 )
	self.DamageWidgetPixel0 = DamageWidgetPixel0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0 )
				self.clipFinished( ImgHess2Glow, {} )
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0 )
				self.clipFinished( ImgHess1Glow, {} )
				EnviroHazard1:completeAnimation()
				EnviroHazard1.EnviroHazardMeter:completeAnimation()
				EnviroHazard1.IconEnviroHazard:completeAnimation()
				EnviroHazard1.MeterText:completeAnimation()
				EnviroHazard1.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
				self.EnviroHazard1:setAlpha( 0 )
				self.EnviroHazard1.EnviroHazardMeter:setAlpha( 0 )
				self.EnviroHazard1.IconEnviroHazard:setAlpha( 0 )
				self.EnviroHazard1.MeterText:setAlpha( 0 )
				self.EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
				self.clipFinished( EnviroHazard1, {} )
				EnviroHazard2:completeAnimation()
				EnviroHazard2.EnviroHazardMeter:completeAnimation()
				EnviroHazard2.IconEnviroHazard:completeAnimation()
				EnviroHazard2.MeterText:completeAnimation()
				EnviroHazard2.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard2.DamageWidgetArrow0:completeAnimation()
				EnviroHazard2.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
				self.EnviroHazard2:setAlpha( 0 )
				self.EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
				self.EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
				self.EnviroHazard2.MeterText:setAlpha( 0 )
				self.EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard2.DamageWidgetArrow0:setAlpha( 0 )
				self.EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
				self.clipFinished( EnviroHazard2, {} )
				DamageWidgetSemiCircle0:completeAnimation()
				self.DamageWidgetSemiCircle0:setLeftRight( true, false, -5.67, 17.66 )
				self.DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
				self.clipFinished( DamageWidgetSemiCircle0, {} )
				AmmoWidgetBackLine:completeAnimation()
				self.AmmoWidgetBackLine:setLeftRight( true, false, -66, 4.33 )
				self.AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
				self.clipFinished( AmmoWidgetBackLine, {} )
				AmmoWidgetBackLine0:completeAnimation()
				self.AmmoWidgetBackLine0:setLeftRight( true, false, -66, 4.33 )
				self.AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
				self.clipFinished( AmmoWidgetBackLine0, {} )
				DamageWidgetArrow0:completeAnimation()
				self.DamageWidgetArrow0:setZRot( 0 )
				self.clipFinished( DamageWidgetArrow0, {} )
			end,
			Hess1 = function ()
				self:setupElementClipCounter( 9 )
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0 )
				self.clipFinished( ImgHess2Glow, {} )
				local ImgHess1GlowFrame2 = function ( ImgHess1Glow, event )
					if not event.interrupted then
						ImgHess1Glow:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
					end
					ImgHess1Glow:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( ImgHess1Glow, event )
					else
						ImgHess1Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0 )
				ImgHess1GlowFrame2( ImgHess1Glow, {} )
				local EnviroHazard1Frame2 = function ( EnviroHazard1, event )
					local EnviroHazard1Frame3 = function ( EnviroHazard1, event )
						local EnviroHazard1Frame4 = function ( EnviroHazard1, event )
							local EnviroHazard1Frame5 = function ( EnviroHazard1, event )
								local EnviroHazard1Frame6 = function ( EnviroHazard1, event )
									local EnviroHazard1Frame7 = function ( EnviroHazard1, event )
										local EnviroHazard1Frame8 = function ( EnviroHazard1, event )
											local EnviroHazard1Frame9 = function ( EnviroHazard1, event )
												local EnviroHazard1Frame10 = function ( EnviroHazard1, event )
													local EnviroHazard1Frame11 = function ( EnviroHazard1, event )
														local EnviroHazard1Frame12 = function ( EnviroHazard1, event )
															local EnviroHazard1Frame13 = function ( EnviroHazard1, event )
																local EnviroHazard1Frame14 = function ( EnviroHazard1, event )
																	local EnviroHazard1Frame15 = function ( EnviroHazard1, event )
																		local EnviroHazard1Frame16 = function ( EnviroHazard1, event )
																			local EnviroHazard1Frame17 = function ( EnviroHazard1, event )
																				local EnviroHazard1Frame18 = function ( EnviroHazard1, event )
																					local EnviroHazard1Frame19 = function ( EnviroHazard1, event )
																						local EnviroHazard1Frame20 = function ( EnviroHazard1, event )
																							local EnviroHazard1Frame21 = function ( EnviroHazard1, event )
																								local EnviroHazard1Frame22 = function ( EnviroHazard1, event )
																									local EnviroHazard1Frame23 = function ( EnviroHazard1, event )
																										local EnviroHazard1Frame24 = function ( EnviroHazard1, event )
																											local EnviroHazard1Frame25 = function ( EnviroHazard1, event )
																												local EnviroHazard1Frame26 = function ( EnviroHazard1, event )
																													local EnviroHazard1Frame27 = function ( EnviroHazard1, event )
																														local EnviroHazard1Frame28 = function ( EnviroHazard1, event )
																															local EnviroHazard1Frame29 = function ( EnviroHazard1, event )
																																if not event.interrupted then
																																	EnviroHazard1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																end
																																EnviroHazard1:setLeftRight( true, false, 9, 162 )
																																EnviroHazard1:setTopBottom( false, true, -53, -27.33 )
																																EnviroHazard1:setAlpha( 1 )
																																EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
																																EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
																																EnviroHazard1.MeterText:setAlpha( 1 )
																																EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
																																EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
																																if event.interrupted then
																																	self.clipFinished( EnviroHazard1, event )
																																else
																																	EnviroHazard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																EnviroHazard1Frame29( EnviroHazard1, event )
																																return 
																															else
																																EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																EnviroHazard1.DamageWidgetArrow1:setAlpha( 0.44 )
																																EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															EnviroHazard1Frame28( EnviroHazard1, event )
																															return 
																														else
																															EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard1.DamageWidgetArrow1:setAlpha( 0.56 )
																															EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														EnviroHazard1Frame27( EnviroHazard1, event )
																														return 
																													else
																														EnviroHazard1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																														EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																														EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 1 )
																														EnviroHazard1.DamageWidgetArrow1:setAlpha( 0.67 )
																														EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													EnviroHazard1Frame26( EnviroHazard1, event )
																													return 
																												else
																													EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																													EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0.33 )
																													EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
																													EnviroHazard1.DamageWidgetArrow1:setAlpha( 0.89 )
																													EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												EnviroHazard1Frame25( EnviroHazard1, event )
																												return 
																											else
																												EnviroHazard1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																												EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																												EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																												EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.11 )
																												EnviroHazard1.DamageWidgetArrow1:setAlpha( 1 )
																												EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											EnviroHazard1Frame24( EnviroHazard1, event )
																											return 
																										else
																											EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																											EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																											EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																											EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																											EnviroHazard1.MeterText:setAlpha( 1 )
																											EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																											EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.33 )
																											EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										EnviroHazard1Frame23( EnviroHazard1, event )
																										return 
																									else
																										EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard1.MeterText:setAlpha( 0.87 )
																										EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.44 )
																										EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									EnviroHazard1Frame22( EnviroHazard1, event )
																									return 
																								else
																									EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									EnviroHazard1.MeterText:setAlpha( 0.75 )
																									EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.56 )
																									EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
																									EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								EnviroHazard1Frame21( EnviroHazard1, event )
																								return 
																							else
																								EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																								EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								EnviroHazard1.MeterText:setAlpha( 0.62 )
																								EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 1 )
																								EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.67 )
																								EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							EnviroHazard1Frame20( EnviroHazard1, event )
																							return 
																						else
																							EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							EnviroHazard1.MeterText:setAlpha( 0.5 )
																							EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.78 )
																							EnviroHazard1.DamageWidgetArrow1:setAlpha( 1 )
																							EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						EnviroHazard1Frame19( EnviroHazard1, event )
																						return 
																					else
																						EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						EnviroHazard1.MeterText:setAlpha( 0.37 )
																						EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.89 )
																						EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					EnviroHazard1Frame18( EnviroHazard1, event )
																					return 
																				else
																					EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard1.MeterText:setAlpha( 0.58 )
																					EnviroHazard1.DamageWidgetArrow0:setAlpha( 1 )
																					EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				EnviroHazard1Frame17( EnviroHazard1, event )
																				return 
																			else
																				EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				EnviroHazard1.MeterText:setAlpha( 0.79 )
																				EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.5 )
																				EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
																				EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			EnviroHazard1Frame16( EnviroHazard1, event )
																			return 
																		else
																			EnviroHazard1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			EnviroHazard1.MeterText:setAlpha( 1 )
																			EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		EnviroHazard1Frame15( EnviroHazard1, event )
																		return 
																	else
																		EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		EnviroHazard1.MeterText:setAlpha( 0.6 )
																		EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
																		EnviroHazard1.DamageWidgetArrow1:setAlpha( 1 )
																		EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame15 )
																	end
																end
																
																if event.interrupted then
																	EnviroHazard1Frame14( EnviroHazard1, event )
																	return 
																else
																	EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	EnviroHazard1.MeterText:setAlpha( 0.4 )
																	EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame14 )
																end
															end
															
															if event.interrupted then
																EnviroHazard1Frame13( EnviroHazard1, event )
																return 
															else
																EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																EnviroHazard1.MeterText:setAlpha( 0.2 )
																EnviroHazard1.DamageWidgetArrow0:setAlpha( 1 )
																EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame13 )
															end
														end
														
														if event.interrupted then
															EnviroHazard1Frame12( EnviroHazard1, event )
															return 
														else
															EnviroHazard1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
															EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
															EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame12 )
														end
													end
													
													if event.interrupted then
														EnviroHazard1Frame11( EnviroHazard1, event )
														return 
													else
														EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														EnviroHazard1.EnviroHazardMeter:setAlpha( 0.49 )
														EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
														EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame11 )
													end
												end
												
												if event.interrupted then
													EnviroHazard1Frame10( EnviroHazard1, event )
													return 
												else
													EnviroHazard1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
													EnviroHazard1.EnviroHazardMeter:setAlpha( 0.23 )
													EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame10 )
												end
											end
											
											if event.interrupted then
												EnviroHazard1Frame9( EnviroHazard1, event )
												return 
											else
												EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
												EnviroHazard1.DamageWidgetArrow0:setAlpha( 1 )
												EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame9 )
											end
										end
										
										if event.interrupted then
											EnviroHazard1Frame8( EnviroHazard1, event )
											return 
										else
											EnviroHazard1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
											EnviroHazard1.EnviroHazardMeter:setAlpha( 0.8 )
											EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame8 )
										end
									end
									
									if event.interrupted then
										EnviroHazard1Frame7( EnviroHazard1, event )
										return 
									else
										EnviroHazard1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame7 )
									end
								end
								
								if event.interrupted then
									EnviroHazard1Frame6( EnviroHazard1, event )
									return 
								else
									EnviroHazard1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
									EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
									EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame6 )
								end
							end
							
							if event.interrupted then
								EnviroHazard1Frame5( EnviroHazard1, event )
								return 
							else
								EnviroHazard1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EnviroHazard1.IconEnviroHazard:setAlpha( 0.19 )
								EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazard1Frame4( EnviroHazard1, event )
							return 
						else
							EnviroHazard1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
							EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
							EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazard1Frame3( EnviroHazard1, event )
						return 
					else
						EnviroHazard1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame3 )
					end
				end
				
				EnviroHazard1:completeAnimation()
				EnviroHazard1.EnviroHazardMeter:completeAnimation()
				EnviroHazard1.IconEnviroHazard:completeAnimation()
				EnviroHazard1.MeterText:completeAnimation()
				EnviroHazard1.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -53, -27.33 )
				self.EnviroHazard1:setAlpha( 1 )
				self.EnviroHazard1.EnviroHazardMeter:setAlpha( 0 )
				self.EnviroHazard1.IconEnviroHazard:setAlpha( 0 )
				self.EnviroHazard1.MeterText:setAlpha( 0 )
				self.EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
				EnviroHazard1Frame2( EnviroHazard1, {} )
				EnviroHazard2:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
				self.EnviroHazard2:setAlpha( 0 )
				self.clipFinished( EnviroHazard2, {} )
				local DamageWidgetSemiCircle0Frame2 = function ( DamageWidgetSemiCircle0, event )
					local DamageWidgetSemiCircle0Frame3 = function ( DamageWidgetSemiCircle0, event )
						local DamageWidgetSemiCircle0Frame4 = function ( DamageWidgetSemiCircle0, event )
							local DamageWidgetSemiCircle0Frame5 = function ( DamageWidgetSemiCircle0, event )
								local DamageWidgetSemiCircle0Frame6 = function ( DamageWidgetSemiCircle0, event )
									local DamageWidgetSemiCircle0Frame7 = function ( DamageWidgetSemiCircle0, event )
										local DamageWidgetSemiCircle0Frame8 = function ( DamageWidgetSemiCircle0, event )
											local DamageWidgetSemiCircle0Frame9 = function ( DamageWidgetSemiCircle0, event )
												if not event.interrupted then
													DamageWidgetSemiCircle0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
												DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
												DamageWidgetSemiCircle0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( DamageWidgetSemiCircle0, event )
												else
													DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												DamageWidgetSemiCircle0Frame9( DamageWidgetSemiCircle0, event )
												return 
											else
												DamageWidgetSemiCircle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame9 )
											end
										end
										
										if event.interrupted then
											DamageWidgetSemiCircle0Frame8( DamageWidgetSemiCircle0, event )
											return 
										else
											DamageWidgetSemiCircle0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											DamageWidgetSemiCircle0:setAlpha( 0 )
											DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame8 )
										end
									end
									
									if event.interrupted then
										DamageWidgetSemiCircle0Frame7( DamageWidgetSemiCircle0, event )
										return 
									else
										DamageWidgetSemiCircle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame7 )
									end
								end
								
								if event.interrupted then
									DamageWidgetSemiCircle0Frame6( DamageWidgetSemiCircle0, event )
									return 
								else
									DamageWidgetSemiCircle0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									DamageWidgetSemiCircle0:setAlpha( 1 )
									DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame6 )
								end
							end
							
							if event.interrupted then
								DamageWidgetSemiCircle0Frame5( DamageWidgetSemiCircle0, event )
								return 
							else
								DamageWidgetSemiCircle0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame5 )
							end
						end
						
						if event.interrupted then
							DamageWidgetSemiCircle0Frame4( DamageWidgetSemiCircle0, event )
							return 
						else
							DamageWidgetSemiCircle0:beginAnimation( "keyframe", 10, false, true, CoD.TweenType.Linear )
							DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
							DamageWidgetSemiCircle0:setAlpha( 0 )
							DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame4 )
						end
					end
					
					if event.interrupted then
						DamageWidgetSemiCircle0Frame3( DamageWidgetSemiCircle0, event )
						return 
					else
						DamageWidgetSemiCircle0:beginAnimation( "keyframe", 319, true, true, CoD.TweenType.Linear )
						DamageWidgetSemiCircle0:setLeftRight( true, false, 19.27, 42.6 )
						DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame3 )
					end
				end
				
				DamageWidgetSemiCircle0:completeAnimation()
				self.DamageWidgetSemiCircle0:setLeftRight( true, false, -5.67, 17.66 )
				self.DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
				self.DamageWidgetSemiCircle0:setAlpha( 1 )
				DamageWidgetSemiCircle0Frame2( DamageWidgetSemiCircle0, {} )
				local AmmoWidgetBackLineFrame2 = function ( AmmoWidgetBackLine, event )
					if not event.interrupted then
						AmmoWidgetBackLine:beginAnimation( "keyframe", 280, true, true, CoD.TweenType.Linear )
					end
					AmmoWidgetBackLine:setLeftRight( true, false, -66, 29 )
					AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetBackLine, event )
					else
						AmmoWidgetBackLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetBackLine:completeAnimation()
				self.AmmoWidgetBackLine:setLeftRight( true, false, -66, 4.33 )
				self.AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
				AmmoWidgetBackLineFrame2( AmmoWidgetBackLine, {} )
				local AmmoWidgetBackLine0Frame2 = function ( AmmoWidgetBackLine0, event )
					if not event.interrupted then
						AmmoWidgetBackLine0:beginAnimation( "keyframe", 280, true, true, CoD.TweenType.Linear )
					end
					AmmoWidgetBackLine0:setLeftRight( true, false, -66, 31 )
					AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetBackLine0, event )
					else
						AmmoWidgetBackLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetBackLine0:completeAnimation()
				self.AmmoWidgetBackLine0:setLeftRight( true, false, -66, 4.33 )
				self.AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
				AmmoWidgetBackLine0Frame2( AmmoWidgetBackLine0, {} )
				local DamageWidgetArrow0Frame2 = function ( DamageWidgetArrow0, event )
					if not event.interrupted then
						DamageWidgetArrow0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Back )
					end
					DamageWidgetArrow0:setLeftRight( true, false, 0, 5.33 )
					DamageWidgetArrow0:setTopBottom( true, false, 35.67, 42.33 )
					DamageWidgetArrow0:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( DamageWidgetArrow0, event )
					else
						DamageWidgetArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DamageWidgetArrow0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				DamageWidgetArrow0:setLeftRight( true, false, 0, 5.33 )
				DamageWidgetArrow0:setTopBottom( true, false, 36.67, 43.34 )
				DamageWidgetArrow0:setZRot( 0 )
				DamageWidgetArrow0:registerEventHandler( "transition_complete_keyframe", DamageWidgetArrow0Frame2 )
				local DamageWidgetPixel0Frame2 = function ( DamageWidgetPixel0, event )
					local DamageWidgetPixel0Frame3 = function ( DamageWidgetPixel0, event )
						local DamageWidgetPixel0Frame4 = function ( DamageWidgetPixel0, event )
							local DamageWidgetPixel0Frame5 = function ( DamageWidgetPixel0, event )
								local DamageWidgetPixel0Frame6 = function ( DamageWidgetPixel0, event )
									local DamageWidgetPixel0Frame7 = function ( DamageWidgetPixel0, event )
										local DamageWidgetPixel0Frame8 = function ( DamageWidgetPixel0, event )
											local DamageWidgetPixel0Frame9 = function ( DamageWidgetPixel0, event )
												local DamageWidgetPixel0Frame10 = function ( DamageWidgetPixel0, event )
													local DamageWidgetPixel0Frame11 = function ( DamageWidgetPixel0, event )
														local DamageWidgetPixel0Frame12 = function ( DamageWidgetPixel0, event )
															local DamageWidgetPixel0Frame13 = function ( DamageWidgetPixel0, event )
																local DamageWidgetPixel0Frame14 = function ( DamageWidgetPixel0, event )
																	local DamageWidgetPixel0Frame15 = function ( DamageWidgetPixel0, event )
																		local DamageWidgetPixel0Frame16 = function ( DamageWidgetPixel0, event )
																			if not event.interrupted then
																				DamageWidgetPixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			end
																			DamageWidgetPixel0:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( DamageWidgetPixel0, event )
																			else
																				DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			DamageWidgetPixel0Frame16( DamageWidgetPixel0, event )
																			return 
																		else
																			DamageWidgetPixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DamageWidgetPixel0Frame15( DamageWidgetPixel0, event )
																		return 
																	else
																		DamageWidgetPixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		DamageWidgetPixel0:setAlpha( 1 )
																		DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame15 )
																	end
																end
																
																if event.interrupted then
																	DamageWidgetPixel0Frame14( DamageWidgetPixel0, event )
																	return 
																else
																	DamageWidgetPixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame14 )
																end
															end
															
															if event.interrupted then
																DamageWidgetPixel0Frame13( DamageWidgetPixel0, event )
																return 
															else
																DamageWidgetPixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																DamageWidgetPixel0:setAlpha( 0 )
																DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame13 )
															end
														end
														
														if event.interrupted then
															DamageWidgetPixel0Frame12( DamageWidgetPixel0, event )
															return 
														else
															DamageWidgetPixel0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame12 )
														end
													end
													
													if event.interrupted then
														DamageWidgetPixel0Frame11( DamageWidgetPixel0, event )
														return 
													else
														DamageWidgetPixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														DamageWidgetPixel0:setAlpha( 1 )
														DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame11 )
													end
												end
												
												if event.interrupted then
													DamageWidgetPixel0Frame10( DamageWidgetPixel0, event )
													return 
												else
													DamageWidgetPixel0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame10 )
												end
											end
											
											if event.interrupted then
												DamageWidgetPixel0Frame9( DamageWidgetPixel0, event )
												return 
											else
												DamageWidgetPixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DamageWidgetPixel0:setAlpha( 0 )
												DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame9 )
											end
										end
										
										if event.interrupted then
											DamageWidgetPixel0Frame8( DamageWidgetPixel0, event )
											return 
										else
											DamageWidgetPixel0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame8 )
										end
									end
									
									if event.interrupted then
										DamageWidgetPixel0Frame7( DamageWidgetPixel0, event )
										return 
									else
										DamageWidgetPixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										DamageWidgetPixel0:setAlpha( 1 )
										DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame7 )
									end
								end
								
								if event.interrupted then
									DamageWidgetPixel0Frame6( DamageWidgetPixel0, event )
									return 
								else
									DamageWidgetPixel0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame6 )
								end
							end
							
							if event.interrupted then
								DamageWidgetPixel0Frame5( DamageWidgetPixel0, event )
								return 
							else
								DamageWidgetPixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								DamageWidgetPixel0:setAlpha( 0 )
								DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame5 )
							end
						end
						
						if event.interrupted then
							DamageWidgetPixel0Frame4( DamageWidgetPixel0, event )
							return 
						else
							DamageWidgetPixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame4 )
						end
					end
					
					if event.interrupted then
						DamageWidgetPixel0Frame3( DamageWidgetPixel0, event )
						return 
					else
						DamageWidgetPixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						DamageWidgetPixel0:setAlpha( 1 )
						DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame3 )
					end
				end
				
				DamageWidgetPixel0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				DamageWidgetPixel0:setAlpha( 0 )
				DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame2 )
			end,
			Hess2 = function ()
				self:setupElementClipCounter( 9 )
				local ImgHess2GlowFrame2 = function ( ImgHess2Glow, event )
					if not event.interrupted then
						ImgHess2Glow:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Linear )
					end
					ImgHess2Glow:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( ImgHess2Glow, event )
					else
						ImgHess2Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0 )
				ImgHess2GlowFrame2( ImgHess2Glow, {} )
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0 )
				self.clipFinished( ImgHess1Glow, {} )
				local EnviroHazard1Frame2 = function ( EnviroHazard1, event )
					local EnviroHazard1Frame3 = function ( EnviroHazard1, event )
						local EnviroHazard1Frame4 = function ( EnviroHazard1, event )
							local EnviroHazard1Frame5 = function ( EnviroHazard1, event )
								local EnviroHazard1Frame6 = function ( EnviroHazard1, event )
									local EnviroHazard1Frame7 = function ( EnviroHazard1, event )
										local EnviroHazard1Frame8 = function ( EnviroHazard1, event )
											local EnviroHazard1Frame9 = function ( EnviroHazard1, event )
												local EnviroHazard1Frame10 = function ( EnviroHazard1, event )
													local EnviroHazard1Frame11 = function ( EnviroHazard1, event )
														local EnviroHazard1Frame12 = function ( EnviroHazard1, event )
															local EnviroHazard1Frame13 = function ( EnviroHazard1, event )
																local EnviroHazard1Frame14 = function ( EnviroHazard1, event )
																	local EnviroHazard1Frame15 = function ( EnviroHazard1, event )
																		local EnviroHazard1Frame16 = function ( EnviroHazard1, event )
																			local EnviroHazard1Frame17 = function ( EnviroHazard1, event )
																				local EnviroHazard1Frame18 = function ( EnviroHazard1, event )
																					local EnviroHazard1Frame19 = function ( EnviroHazard1, event )
																						local EnviroHazard1Frame20 = function ( EnviroHazard1, event )
																							local EnviroHazard1Frame21 = function ( EnviroHazard1, event )
																								local EnviroHazard1Frame22 = function ( EnviroHazard1, event )
																									local EnviroHazard1Frame23 = function ( EnviroHazard1, event )
																										local EnviroHazard1Frame24 = function ( EnviroHazard1, event )
																											local EnviroHazard1Frame25 = function ( EnviroHazard1, event )
																												local EnviroHazard1Frame26 = function ( EnviroHazard1, event )
																													local EnviroHazard1Frame27 = function ( EnviroHazard1, event )
																														local EnviroHazard1Frame28 = function ( EnviroHazard1, event )
																															local EnviroHazard1Frame29 = function ( EnviroHazard1, event )
																																if not event.interrupted then
																																	EnviroHazard1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																	EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
																																end
																																EnviroHazard1:setLeftRight( true, false, 9, 162 )
																																EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
																																EnviroHazard1:setAlpha( 1 )
																																EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
																																EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
																																EnviroHazard1.MeterText:setAlpha( 1 )
																																EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
																																EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
																																if event.interrupted then
																																	self.clipFinished( EnviroHazard1, event )
																																else
																																	EnviroHazard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																end
																															end
																															
																															if event.interrupted then
																																EnviroHazard1Frame29( EnviroHazard1, event )
																																return 
																															else
																																EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																EnviroHazard1.DamageWidgetArrow1:setAlpha( 0.44 )
																																EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															EnviroHazard1Frame28( EnviroHazard1, event )
																															return 
																														else
																															EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard1.DamageWidgetArrow1:setAlpha( 0.56 )
																															EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														EnviroHazard1Frame27( EnviroHazard1, event )
																														return 
																													else
																														EnviroHazard1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																														EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																														EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																														EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 1 )
																														EnviroHazard1.DamageWidgetArrow1:setAlpha( 0.67 )
																														EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													EnviroHazard1Frame26( EnviroHazard1, event )
																													return 
																												else
																													EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																													EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																													EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0.33 )
																													EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
																													EnviroHazard1.DamageWidgetArrow1:setAlpha( 0.89 )
																													EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												EnviroHazard1Frame25( EnviroHazard1, event )
																												return 
																											else
																												EnviroHazard1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																												EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																												EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																												EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.11 )
																												EnviroHazard1.DamageWidgetArrow1:setAlpha( 1 )
																												EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											EnviroHazard1Frame24( EnviroHazard1, event )
																											return 
																										else
																											EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																											EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																											EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																											EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																											EnviroHazard1.MeterText:setAlpha( 1 )
																											EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																											EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.33 )
																											EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										EnviroHazard1Frame23( EnviroHazard1, event )
																										return 
																									else
																										EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard1.MeterText:setAlpha( 0.87 )
																										EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.44 )
																										EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									EnviroHazard1Frame22( EnviroHazard1, event )
																									return 
																								else
																									EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																									EnviroHazard1.MeterText:setAlpha( 0.75 )
																									EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.56 )
																									EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
																									EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								EnviroHazard1Frame21( EnviroHazard1, event )
																								return 
																							else
																								EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																								EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																								EnviroHazard1.MeterText:setAlpha( 0.62 )
																								EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 1 )
																								EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.67 )
																								EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							EnviroHazard1Frame20( EnviroHazard1, event )
																							return 
																						else
																							EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																							EnviroHazard1.MeterText:setAlpha( 0.5 )
																							EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.78 )
																							EnviroHazard1.DamageWidgetArrow1:setAlpha( 1 )
																							EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						EnviroHazard1Frame19( EnviroHazard1, event )
																						return 
																					else
																						EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																						EnviroHazard1.MeterText:setAlpha( 0.37 )
																						EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.89 )
																						EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					EnviroHazard1Frame18( EnviroHazard1, event )
																					return 
																				else
																					EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard1.MeterText:setAlpha( 0.58 )
																					EnviroHazard1.DamageWidgetArrow0:setAlpha( 1 )
																					EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				EnviroHazard1Frame17( EnviroHazard1, event )
																				return 
																			else
																				EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				EnviroHazard1.MeterText:setAlpha( 0.79 )
																				EnviroHazard1.DamageWidgetArrow0:setAlpha( 0.5 )
																				EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
																				EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			EnviroHazard1Frame16( EnviroHazard1, event )
																			return 
																		else
																			EnviroHazard1:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			EnviroHazard1.MeterText:setAlpha( 1 )
																			EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		EnviroHazard1Frame15( EnviroHazard1, event )
																		return 
																	else
																		EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		EnviroHazard1.MeterText:setAlpha( 0.6 )
																		EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
																		EnviroHazard1.DamageWidgetArrow1:setAlpha( 1 )
																		EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame15 )
																	end
																end
																
																if event.interrupted then
																	EnviroHazard1Frame14( EnviroHazard1, event )
																	return 
																else
																	EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	EnviroHazard1.MeterText:setAlpha( 0.4 )
																	EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame14 )
																end
															end
															
															if event.interrupted then
																EnviroHazard1Frame13( EnviroHazard1, event )
																return 
															else
																EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																EnviroHazard1.MeterText:setAlpha( 0.2 )
																EnviroHazard1.DamageWidgetArrow0:setAlpha( 1 )
																EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame13 )
															end
														end
														
														if event.interrupted then
															EnviroHazard1Frame12( EnviroHazard1, event )
															return 
														else
															EnviroHazard1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
															EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
															EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame12 )
														end
													end
													
													if event.interrupted then
														EnviroHazard1Frame11( EnviroHazard1, event )
														return 
													else
														EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
														EnviroHazard1.EnviroHazardMeter:setAlpha( 0.49 )
														EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
														EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame11 )
													end
												end
												
												if event.interrupted then
													EnviroHazard1Frame10( EnviroHazard1, event )
													return 
												else
													EnviroHazard1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
													EnviroHazard1.EnviroHazardMeter:setAlpha( 0.23 )
													EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame10 )
												end
											end
											
											if event.interrupted then
												EnviroHazard1Frame9( EnviroHazard1, event )
												return 
											else
												EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
												EnviroHazard1.DamageWidgetArrow0:setAlpha( 1 )
												EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame9 )
											end
										end
										
										if event.interrupted then
											EnviroHazard1Frame8( EnviroHazard1, event )
											return 
										else
											EnviroHazard1:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
											EnviroHazard1.EnviroHazardMeter:setAlpha( 0.8 )
											EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame8 )
										end
									end
									
									if event.interrupted then
										EnviroHazard1Frame7( EnviroHazard1, event )
										return 
									else
										EnviroHazard1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
										EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame7 )
									end
								end
								
								if event.interrupted then
									EnviroHazard1Frame6( EnviroHazard1, event )
									return 
								else
									EnviroHazard1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
									EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
									EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame6 )
								end
							end
							
							if event.interrupted then
								EnviroHazard1Frame5( EnviroHazard1, event )
								return 
							else
								EnviroHazard1:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EnviroHazard1.IconEnviroHazard:setAlpha( 0.19 )
								EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazard1Frame4( EnviroHazard1, event )
							return 
						else
							EnviroHazard1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
							EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
							EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazard1Frame3( EnviroHazard1, event )
						return 
					else
						EnviroHazard1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame3 )
					end
				end
				
				EnviroHazard1:completeAnimation()
				EnviroHazard1.EnviroHazardMeter:completeAnimation()
				EnviroHazard1.IconEnviroHazard:completeAnimation()
				EnviroHazard1.MeterText:completeAnimation()
				EnviroHazard1.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
				self.EnviroHazard1:setAlpha( 1 )
				self.EnviroHazard1.EnviroHazardMeter:setAlpha( 0 )
				self.EnviroHazard1.IconEnviroHazard:setAlpha( 0 )
				self.EnviroHazard1.MeterText:setAlpha( 0 )
				self.EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
				EnviroHazard1Frame2( EnviroHazard1, {} )
				local EnviroHazard2Frame2 = function ( EnviroHazard2, event )
					local EnviroHazard2Frame3 = function ( EnviroHazard2, event )
						local EnviroHazard2Frame4 = function ( EnviroHazard2, event )
							local EnviroHazard2Frame5 = function ( EnviroHazard2, event )
								local EnviroHazard2Frame6 = function ( EnviroHazard2, event )
									local EnviroHazard2Frame7 = function ( EnviroHazard2, event )
										local EnviroHazard2Frame8 = function ( EnviroHazard2, event )
											local EnviroHazard2Frame9 = function ( EnviroHazard2, event )
												local EnviroHazard2Frame10 = function ( EnviroHazard2, event )
													local EnviroHazard2Frame11 = function ( EnviroHazard2, event )
														local EnviroHazard2Frame12 = function ( EnviroHazard2, event )
															local EnviroHazard2Frame13 = function ( EnviroHazard2, event )
																local EnviroHazard2Frame14 = function ( EnviroHazard2, event )
																	local EnviroHazard2Frame15 = function ( EnviroHazard2, event )
																		local EnviroHazard2Frame16 = function ( EnviroHazard2, event )
																			local EnviroHazard2Frame17 = function ( EnviroHazard2, event )
																				local EnviroHazard2Frame18 = function ( EnviroHazard2, event )
																					local EnviroHazard2Frame19 = function ( EnviroHazard2, event )
																						local EnviroHazard2Frame20 = function ( EnviroHazard2, event )
																							local EnviroHazard2Frame21 = function ( EnviroHazard2, event )
																								local EnviroHazard2Frame22 = function ( EnviroHazard2, event )
																									local EnviroHazard2Frame23 = function ( EnviroHazard2, event )
																										local EnviroHazard2Frame24 = function ( EnviroHazard2, event )
																											local EnviroHazard2Frame25 = function ( EnviroHazard2, event )
																												local EnviroHazard2Frame26 = function ( EnviroHazard2, event )
																													local EnviroHazard2Frame27 = function ( EnviroHazard2, event )
																														local EnviroHazard2Frame28 = function ( EnviroHazard2, event )
																															local EnviroHazard2Frame29 = function ( EnviroHazard2, event )
																																local EnviroHazard2Frame30 = function ( EnviroHazard2, event )
																																	local EnviroHazard2Frame31 = function ( EnviroHazard2, event )
																																		local EnviroHazard2Frame32 = function ( EnviroHazard2, event )
																																			local EnviroHazard2Frame33 = function ( EnviroHazard2, event )
																																				local EnviroHazard2Frame34 = function ( EnviroHazard2, event )
																																					local EnviroHazard2Frame35 = function ( EnviroHazard2, event )
																																						local EnviroHazard2Frame36 = function ( EnviroHazard2, event )
																																							local EnviroHazard2Frame37 = function ( EnviroHazard2, event )
																																								local EnviroHazard2Frame38 = function ( EnviroHazard2, event )
																																									local EnviroHazard2Frame39 = function ( EnviroHazard2, event )
																																										if not event.interrupted then
																																											EnviroHazard2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																										end
																																										EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
																																										EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
																																										EnviroHazard2:setAlpha( 1 )
																																										EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
																																										EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
																																										EnviroHazard2.MeterText:setAlpha( 1 )
																																										EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																										EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
																																										if event.interrupted then
																																											self.clipFinished( EnviroHazard2, event )
																																										else
																																											EnviroHazard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										EnviroHazard2Frame39( EnviroHazard2, event )
																																										return 
																																									else
																																										EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																										EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																										EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																										EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																										EnviroHazard2.DamageWidgetArrow1:setAlpha( 0.6 )
																																										EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									EnviroHazard2Frame38( EnviroHazard2, event )
																																									return 
																																								else
																																									EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0.5 )
																																									EnviroHazard2.DamageWidgetArrow1:setAlpha( 1 )
																																									EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								EnviroHazard2Frame37( EnviroHazard2, event )
																																								return 
																																							else
																																								EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																								EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																								EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0.75 )
																																								EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							EnviroHazard2Frame36( EnviroHazard2, event )
																																							return 
																																						else
																																							EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																							EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																							EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 1 )
																																							EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						EnviroHazard2Frame35( EnviroHazard2, event )
																																						return 
																																					else
																																						EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																						EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																						EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
																																						EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					EnviroHazard2Frame34( EnviroHazard2, event )
																																					return 
																																				else
																																					EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				EnviroHazard2Frame33( EnviroHazard2, event )
																																				return 
																																			else
																																				EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																				EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																				EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																				EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																				EnviroHazard2.DamageWidgetArrow1:setAlpha( 1 )
																																				EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			EnviroHazard2Frame32( EnviroHazard2, event )
																																			return 
																																		else
																																			EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																			EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		EnviroHazard2Frame31( EnviroHazard2, event )
																																		return 
																																	else
																																		EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																		EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																		EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																		EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 1 )
																																		EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
																																		EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	EnviroHazard2Frame30( EnviroHazard2, event )
																																	return 
																																else
																																	EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																	EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																EnviroHazard2Frame29( EnviroHazard2, event )
																																return 
																															else
																																EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard2.MeterText:setAlpha( 1 )
																																EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															EnviroHazard2Frame28( EnviroHazard2, event )
																															return 
																														else
																															EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard2.MeterText:setAlpha( 0.67 )
																															EnviroHazard2.DamageWidgetArrow1:setAlpha( 1 )
																															EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														EnviroHazard2Frame27( EnviroHazard2, event )
																														return 
																													else
																														EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																														EnviroHazard2.MeterText:setAlpha( 0.33 )
																														EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													EnviroHazard2Frame26( EnviroHazard2, event )
																													return 
																												else
																													EnviroHazard2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																													EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												EnviroHazard2Frame25( EnviroHazard2, event )
																												return 
																											else
																												EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												EnviroHazard2.MeterText:setAlpha( 0 )
																												EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											EnviroHazard2Frame24( EnviroHazard2, event )
																											return 
																										else
																											EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																											EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										EnviroHazard2Frame23( EnviroHazard2, event )
																										return 
																									else
																										EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard2.MeterText:setAlpha( 1 )
																										EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									EnviroHazard2Frame22( EnviroHazard2, event )
																									return 
																								else
																									EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																									EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								EnviroHazard2Frame21( EnviroHazard2, event )
																								return 
																							else
																								EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								EnviroHazard2.MeterText:setAlpha( 0 )
																								EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							EnviroHazard2Frame20( EnviroHazard2, event )
																							return 
																						else
																							EnviroHazard2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																							EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																							EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																							EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
																							EnviroHazard2.MeterText:setAlpha( 1 )
																							EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						EnviroHazard2Frame19( EnviroHazard2, event )
																						return 
																					else
																						EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					EnviroHazard2Frame18( EnviroHazard2, event )
																					return 
																				else
																					EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
																					EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				EnviroHazard2Frame17( EnviroHazard2, event )
																				return 
																			else
																				EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			EnviroHazard2Frame16( EnviroHazard2, event )
																			return 
																		else
																			EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
																			EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		EnviroHazard2Frame15( EnviroHazard2, event )
																		return 
																	else
																		EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame15 )
																	end
																end
																
																if event.interrupted then
																	EnviroHazard2Frame14( EnviroHazard2, event )
																	return 
																else
																	EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
																	EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame14 )
																end
															end
															
															if event.interrupted then
																EnviroHazard2Frame13( EnviroHazard2, event )
																return 
															else
																EnviroHazard2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
																EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame13 )
															end
														end
														
														if event.interrupted then
															EnviroHazard2Frame12( EnviroHazard2, event )
															return 
														else
															EnviroHazard2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame12 )
														end
													end
													
													if event.interrupted then
														EnviroHazard2Frame11( EnviroHazard2, event )
														return 
													else
														EnviroHazard2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
														EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
														EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame11 )
													end
												end
												
												if event.interrupted then
													EnviroHazard2Frame10( EnviroHazard2, event )
													return 
												else
													EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame10 )
												end
											end
											
											if event.interrupted then
												EnviroHazard2Frame9( EnviroHazard2, event )
												return 
											else
												EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
												EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame9 )
											end
										end
										
										if event.interrupted then
											EnviroHazard2Frame8( EnviroHazard2, event )
											return 
										else
											EnviroHazard2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame8 )
										end
									end
									
									if event.interrupted then
										EnviroHazard2Frame7( EnviroHazard2, event )
										return 
									else
										EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
										EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame7 )
									end
								end
								
								if event.interrupted then
									EnviroHazard2Frame6( EnviroHazard2, event )
									return 
								else
									EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame6 )
								end
							end
							
							if event.interrupted then
								EnviroHazard2Frame5( EnviroHazard2, event )
								return 
							else
								EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
								EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazard2Frame4( EnviroHazard2, event )
							return 
						else
							EnviroHazard2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
							EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
							EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazard2Frame3( EnviroHazard2, event )
						return 
					else
						EnviroHazard2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame3 )
					end
				end
				
				EnviroHazard2:completeAnimation()
				EnviroHazard2.EnviroHazardMeter:completeAnimation()
				EnviroHazard2.IconEnviroHazard:completeAnimation()
				EnviroHazard2.MeterText:completeAnimation()
				EnviroHazard2.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard2.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
				self.EnviroHazard2:setAlpha( 1 )
				self.EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
				self.EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
				self.EnviroHazard2.MeterText:setAlpha( 0 )
				self.EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
				EnviroHazard2Frame2( EnviroHazard2, {} )
				local DamageWidgetSemiCircle0Frame2 = function ( DamageWidgetSemiCircle0, event )
					local DamageWidgetSemiCircle0Frame3 = function ( DamageWidgetSemiCircle0, event )
						local DamageWidgetSemiCircle0Frame4 = function ( DamageWidgetSemiCircle0, event )
							local DamageWidgetSemiCircle0Frame5 = function ( DamageWidgetSemiCircle0, event )
								local DamageWidgetSemiCircle0Frame6 = function ( DamageWidgetSemiCircle0, event )
									local DamageWidgetSemiCircle0Frame7 = function ( DamageWidgetSemiCircle0, event )
										local DamageWidgetSemiCircle0Frame8 = function ( DamageWidgetSemiCircle0, event )
											local DamageWidgetSemiCircle0Frame9 = function ( DamageWidgetSemiCircle0, event )
												if not event.interrupted then
													DamageWidgetSemiCircle0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
												DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
												DamageWidgetSemiCircle0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( DamageWidgetSemiCircle0, event )
												else
													DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												DamageWidgetSemiCircle0Frame9( DamageWidgetSemiCircle0, event )
												return 
											else
												DamageWidgetSemiCircle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame9 )
											end
										end
										
										if event.interrupted then
											DamageWidgetSemiCircle0Frame8( DamageWidgetSemiCircle0, event )
											return 
										else
											DamageWidgetSemiCircle0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											DamageWidgetSemiCircle0:setAlpha( 0 )
											DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame8 )
										end
									end
									
									if event.interrupted then
										DamageWidgetSemiCircle0Frame7( DamageWidgetSemiCircle0, event )
										return 
									else
										DamageWidgetSemiCircle0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame7 )
									end
								end
								
								if event.interrupted then
									DamageWidgetSemiCircle0Frame6( DamageWidgetSemiCircle0, event )
									return 
								else
									DamageWidgetSemiCircle0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									DamageWidgetSemiCircle0:setAlpha( 1 )
									DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame6 )
								end
							end
							
							if event.interrupted then
								DamageWidgetSemiCircle0Frame5( DamageWidgetSemiCircle0, event )
								return 
							else
								DamageWidgetSemiCircle0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame5 )
							end
						end
						
						if event.interrupted then
							DamageWidgetSemiCircle0Frame4( DamageWidgetSemiCircle0, event )
							return 
						else
							DamageWidgetSemiCircle0:beginAnimation( "keyframe", 10, false, true, CoD.TweenType.Linear )
							DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
							DamageWidgetSemiCircle0:setAlpha( 0 )
							DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame4 )
						end
					end
					
					if event.interrupted then
						DamageWidgetSemiCircle0Frame3( DamageWidgetSemiCircle0, event )
						return 
					else
						DamageWidgetSemiCircle0:beginAnimation( "keyframe", 319, true, true, CoD.TweenType.Linear )
						DamageWidgetSemiCircle0:setLeftRight( true, false, 19.27, 42.6 )
						DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame3 )
					end
				end
				
				DamageWidgetSemiCircle0:completeAnimation()
				self.DamageWidgetSemiCircle0:setLeftRight( true, false, -5.67, 17.66 )
				self.DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
				self.DamageWidgetSemiCircle0:setAlpha( 1 )
				DamageWidgetSemiCircle0Frame2( DamageWidgetSemiCircle0, {} )
				local AmmoWidgetBackLineFrame2 = function ( AmmoWidgetBackLine, event )
					if not event.interrupted then
						AmmoWidgetBackLine:beginAnimation( "keyframe", 280, true, true, CoD.TweenType.Linear )
					end
					AmmoWidgetBackLine:setLeftRight( true, false, -66, 29 )
					AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetBackLine, event )
					else
						AmmoWidgetBackLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetBackLine:completeAnimation()
				self.AmmoWidgetBackLine:setLeftRight( true, false, -66, 4.33 )
				self.AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
				AmmoWidgetBackLineFrame2( AmmoWidgetBackLine, {} )
				local AmmoWidgetBackLine0Frame2 = function ( AmmoWidgetBackLine0, event )
					if not event.interrupted then
						AmmoWidgetBackLine0:beginAnimation( "keyframe", 280, true, true, CoD.TweenType.Linear )
					end
					AmmoWidgetBackLine0:setLeftRight( true, false, -66, 31 )
					AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetBackLine0, event )
					else
						AmmoWidgetBackLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetBackLine0:completeAnimation()
				self.AmmoWidgetBackLine0:setLeftRight( true, false, -66, 4.33 )
				self.AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
				AmmoWidgetBackLine0Frame2( AmmoWidgetBackLine0, {} )
				local DamageWidgetArrow0Frame2 = function ( DamageWidgetArrow0, event )
					if not event.interrupted then
						DamageWidgetArrow0:beginAnimation( "keyframe", 49, false, true, CoD.TweenType.Back )
					end
					DamageWidgetArrow0:setLeftRight( true, false, 0, 5.33 )
					DamageWidgetArrow0:setTopBottom( true, false, 35.67, 42.33 )
					DamageWidgetArrow0:setZRot( 180 )
					if event.interrupted then
						self.clipFinished( DamageWidgetArrow0, event )
					else
						DamageWidgetArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DamageWidgetArrow0:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
				DamageWidgetArrow0:setLeftRight( true, false, 0, 5.33 )
				DamageWidgetArrow0:setTopBottom( true, false, 36.67, 43.34 )
				DamageWidgetArrow0:setZRot( 0 )
				DamageWidgetArrow0:registerEventHandler( "transition_complete_keyframe", DamageWidgetArrow0Frame2 )
				local DamageWidgetPixel0Frame2 = function ( DamageWidgetPixel0, event )
					local DamageWidgetPixel0Frame3 = function ( DamageWidgetPixel0, event )
						local DamageWidgetPixel0Frame4 = function ( DamageWidgetPixel0, event )
							local DamageWidgetPixel0Frame5 = function ( DamageWidgetPixel0, event )
								local DamageWidgetPixel0Frame6 = function ( DamageWidgetPixel0, event )
									local DamageWidgetPixel0Frame7 = function ( DamageWidgetPixel0, event )
										local DamageWidgetPixel0Frame8 = function ( DamageWidgetPixel0, event )
											local DamageWidgetPixel0Frame9 = function ( DamageWidgetPixel0, event )
												local DamageWidgetPixel0Frame10 = function ( DamageWidgetPixel0, event )
													local DamageWidgetPixel0Frame11 = function ( DamageWidgetPixel0, event )
														local DamageWidgetPixel0Frame12 = function ( DamageWidgetPixel0, event )
															local DamageWidgetPixel0Frame13 = function ( DamageWidgetPixel0, event )
																local DamageWidgetPixel0Frame14 = function ( DamageWidgetPixel0, event )
																	local DamageWidgetPixel0Frame15 = function ( DamageWidgetPixel0, event )
																		local DamageWidgetPixel0Frame16 = function ( DamageWidgetPixel0, event )
																			if not event.interrupted then
																				DamageWidgetPixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			end
																			DamageWidgetPixel0:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( DamageWidgetPixel0, event )
																			else
																				DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			DamageWidgetPixel0Frame16( DamageWidgetPixel0, event )
																			return 
																		else
																			DamageWidgetPixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		DamageWidgetPixel0Frame15( DamageWidgetPixel0, event )
																		return 
																	else
																		DamageWidgetPixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		DamageWidgetPixel0:setAlpha( 1 )
																		DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame15 )
																	end
																end
																
																if event.interrupted then
																	DamageWidgetPixel0Frame14( DamageWidgetPixel0, event )
																	return 
																else
																	DamageWidgetPixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																	DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame14 )
																end
															end
															
															if event.interrupted then
																DamageWidgetPixel0Frame13( DamageWidgetPixel0, event )
																return 
															else
																DamageWidgetPixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																DamageWidgetPixel0:setAlpha( 0 )
																DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame13 )
															end
														end
														
														if event.interrupted then
															DamageWidgetPixel0Frame12( DamageWidgetPixel0, event )
															return 
														else
															DamageWidgetPixel0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame12 )
														end
													end
													
													if event.interrupted then
														DamageWidgetPixel0Frame11( DamageWidgetPixel0, event )
														return 
													else
														DamageWidgetPixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														DamageWidgetPixel0:setAlpha( 1 )
														DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame11 )
													end
												end
												
												if event.interrupted then
													DamageWidgetPixel0Frame10( DamageWidgetPixel0, event )
													return 
												else
													DamageWidgetPixel0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame10 )
												end
											end
											
											if event.interrupted then
												DamageWidgetPixel0Frame9( DamageWidgetPixel0, event )
												return 
											else
												DamageWidgetPixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												DamageWidgetPixel0:setAlpha( 0 )
												DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame9 )
											end
										end
										
										if event.interrupted then
											DamageWidgetPixel0Frame8( DamageWidgetPixel0, event )
											return 
										else
											DamageWidgetPixel0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame8 )
										end
									end
									
									if event.interrupted then
										DamageWidgetPixel0Frame7( DamageWidgetPixel0, event )
										return 
									else
										DamageWidgetPixel0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										DamageWidgetPixel0:setAlpha( 1 )
										DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame7 )
									end
								end
								
								if event.interrupted then
									DamageWidgetPixel0Frame6( DamageWidgetPixel0, event )
									return 
								else
									DamageWidgetPixel0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
									DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame6 )
								end
							end
							
							if event.interrupted then
								DamageWidgetPixel0Frame5( DamageWidgetPixel0, event )
								return 
							else
								DamageWidgetPixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								DamageWidgetPixel0:setAlpha( 0 )
								DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame5 )
							end
						end
						
						if event.interrupted then
							DamageWidgetPixel0Frame4( DamageWidgetPixel0, event )
							return 
						else
							DamageWidgetPixel0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame4 )
						end
					end
					
					if event.interrupted then
						DamageWidgetPixel0Frame3( DamageWidgetPixel0, event )
						return 
					else
						DamageWidgetPixel0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						DamageWidgetPixel0:setAlpha( 1 )
						DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame3 )
					end
				end
				
				DamageWidgetPixel0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				DamageWidgetPixel0:setAlpha( 0 )
				DamageWidgetPixel0:registerEventHandler( "transition_complete_keyframe", DamageWidgetPixel0Frame2 )
			end
		},
		Hess1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0 )
				self.clipFinished( ImgHess2Glow, {} )
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0.6 )
				self.clipFinished( ImgHess1Glow, {} )
				EnviroHazard1:completeAnimation()
				EnviroHazard1.EnviroHazardMeter:completeAnimation()
				EnviroHazard1.IconEnviroHazard:completeAnimation()
				EnviroHazard1.MeterText:completeAnimation()
				EnviroHazard1.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -53, -27.33 )
				self.EnviroHazard1:setAlpha( 1 )
				self.EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
				self.EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
				self.EnviroHazard1.MeterText:setAlpha( 1 )
				self.EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
				self.clipFinished( EnviroHazard1, {} )
				EnviroHazard2:completeAnimation()
				EnviroHazard2.EnviroHazardMeter:completeAnimation()
				EnviroHazard2.IconEnviroHazard:completeAnimation()
				EnviroHazard2.MeterText:completeAnimation()
				EnviroHazard2.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard2.DamageWidgetArrow0:completeAnimation()
				EnviroHazard2.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -39, -15.33 )
				self.EnviroHazard2:setAlpha( 0 )
				self.EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
				self.EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
				self.EnviroHazard2.MeterText:setAlpha( 0 )
				self.EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard2.DamageWidgetArrow0:setAlpha( 0 )
				self.EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
				self.clipFinished( EnviroHazard2, {} )
				DamageWidgetSemiCircle0:completeAnimation()
				self.DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
				self.DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
				self.DamageWidgetSemiCircle0:setAlpha( 1 )
				self.clipFinished( DamageWidgetSemiCircle0, {} )
				AmmoWidgetBackLine:completeAnimation()
				self.AmmoWidgetBackLine:setLeftRight( true, false, -66, 29 )
				self.AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
				self.clipFinished( AmmoWidgetBackLine, {} )
				AmmoWidgetBackLine0:completeAnimation()
				self.AmmoWidgetBackLine0:setLeftRight( true, false, -66, 31 )
				self.AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
				self.clipFinished( AmmoWidgetBackLine0, {} )
				DamageWidgetArrow0:completeAnimation()
				self.DamageWidgetArrow0:setZRot( 180 )
				self.clipFinished( DamageWidgetArrow0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 9 )
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0 )
				self.clipFinished( ImgHess2Glow, {} )
				local ImgHess1GlowFrame2 = function ( ImgHess1Glow, event )
					if not event.interrupted then
						ImgHess1Glow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					ImgHess1Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgHess1Glow, event )
					else
						ImgHess1Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0.6 )
				ImgHess1GlowFrame2( ImgHess1Glow, {} )
				local EnviroHazard1Frame2 = function ( EnviroHazard1, event )
					local EnviroHazard1Frame3 = function ( EnviroHazard1, event )
						local EnviroHazard1Frame4 = function ( EnviroHazard1, event )
							local EnviroHazard1Frame5 = function ( EnviroHazard1, event )
								if not event.interrupted then
									EnviroHazard1:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard1.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard1.DamageWidgetArrow0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard1.DamageWidgetArrow1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								end
								EnviroHazard1:setLeftRight( true, false, 9, 162 )
								EnviroHazard1:setTopBottom( false, true, -53, -27.33 )
								EnviroHazard1:setAlpha( 0 )
								EnviroHazard1.EnviroHazardMeter:setAlpha( 0 )
								EnviroHazard1.IconEnviroHazard:setAlpha( 0 )
								EnviroHazard1.MeterText:setAlpha( 0 )
								EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
								EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
								EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( EnviroHazard1, event )
								else
									EnviroHazard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EnviroHazard1Frame5( EnviroHazard1, event )
								return 
							else
								EnviroHazard1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
								EnviroHazard1.IconEnviroHazard:setAlpha( 0 )
								EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazard1Frame4( EnviroHazard1, event )
							return 
						else
							EnviroHazard1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 70, false, false, CoD.TweenType.Linear )
							EnviroHazard1.EnviroHazardMeter:setAlpha( 0 )
							EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazard1Frame3( EnviroHazard1, event )
						return 
					else
						EnviroHazard1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
						EnviroHazard1.MeterText:setAlpha( 0 )
						EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame3 )
					end
				end
				
				EnviroHazard1:completeAnimation()
				EnviroHazard1.EnviroHazardMeter:completeAnimation()
				EnviroHazard1.IconEnviroHazard:completeAnimation()
				EnviroHazard1.MeterText:completeAnimation()
				EnviroHazard1.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow0:completeAnimation()
				EnviroHazard1.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -53, -27.33 )
				self.EnviroHazard1:setAlpha( 1 )
				self.EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
				self.EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
				self.EnviroHazard1.MeterText:setAlpha( 1 )
				self.EnviroHazard1.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow0:setAlpha( 0 )
				self.EnviroHazard1.DamageWidgetArrow1:setAlpha( 0 )
				EnviroHazard1Frame2( EnviroHazard1, {} )
				EnviroHazard2:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -39, -15.33 )
				self.EnviroHazard2:setAlpha( 0 )
				self.clipFinished( EnviroHazard2, {} )
				local DamageWidgetSemiCircle0Frame2 = function ( DamageWidgetSemiCircle0, event )
					if not event.interrupted then
						DamageWidgetSemiCircle0:beginAnimation( "keyframe", 60, true, true, CoD.TweenType.Linear )
					end
					DamageWidgetSemiCircle0:setLeftRight( true, false, -5.67, 17.66 )
					DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
					if event.interrupted then
						self.clipFinished( DamageWidgetSemiCircle0, event )
					else
						DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DamageWidgetSemiCircle0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
				DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
				DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame2 )
				local AmmoWidgetBackLineFrame2 = function ( AmmoWidgetBackLine, event )
					if not event.interrupted then
						AmmoWidgetBackLine:beginAnimation( "keyframe", 60, true, true, CoD.TweenType.Linear )
					end
					AmmoWidgetBackLine:setLeftRight( true, false, -66, 4 )
					AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetBackLine, event )
					else
						AmmoWidgetBackLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetBackLine:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				AmmoWidgetBackLine:setLeftRight( true, false, -66, 29 )
				AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
				AmmoWidgetBackLine:registerEventHandler( "transition_complete_keyframe", AmmoWidgetBackLineFrame2 )
				local AmmoWidgetBackLine0Frame2 = function ( AmmoWidgetBackLine0, event )
					if not event.interrupted then
						AmmoWidgetBackLine0:beginAnimation( "keyframe", 60, true, true, CoD.TweenType.Linear )
					end
					AmmoWidgetBackLine0:setLeftRight( true, false, -66, 6 )
					AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetBackLine0, event )
					else
						AmmoWidgetBackLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetBackLine0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
				AmmoWidgetBackLine0:setLeftRight( true, false, -66, 31 )
				AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
				AmmoWidgetBackLine0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetBackLine0Frame2 )
				local DamageWidgetArrow0Frame2 = function ( DamageWidgetArrow0, event )
					if not event.interrupted then
						DamageWidgetArrow0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
					end
					DamageWidgetArrow0:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( DamageWidgetArrow0, event )
					else
						DamageWidgetArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DamageWidgetArrow0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				DamageWidgetArrow0:setZRot( 180 )
				DamageWidgetArrow0:registerEventHandler( "transition_complete_keyframe", DamageWidgetArrow0Frame2 )
				DamageWidgetPixel0:completeAnimation()
				self.DamageWidgetPixel0:setAlpha( 0 )
				self.clipFinished( DamageWidgetPixel0, {} )
			end,
			Hess2 = function ()
				self:setupElementClipCounter( 4 )
				local ImgHess2GlowFrame2 = function ( ImgHess2Glow, event )
					if not event.interrupted then
						ImgHess2Glow:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Linear )
					end
					ImgHess2Glow:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( ImgHess2Glow, event )
					else
						ImgHess2Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0 )
				ImgHess2GlowFrame2( ImgHess2Glow, {} )
				local ImgHess1GlowFrame2 = function ( ImgHess1Glow, event )
					if not event.interrupted then
						ImgHess1Glow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
					end
					ImgHess1Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgHess1Glow, event )
					else
						ImgHess1Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0.6 )
				ImgHess1GlowFrame2( ImgHess1Glow, {} )
				local EnviroHazard1Frame2 = function ( EnviroHazard1, event )
					if not event.interrupted then
						EnviroHazard1:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Back )
						EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 150, true, true, CoD.TweenType.Back )
						EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 150, true, true, CoD.TweenType.Back )
						EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 150, true, true, CoD.TweenType.Back )
					end
					EnviroHazard1:setLeftRight( true, false, 9, 162 )
					EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
					EnviroHazard1:setAlpha( 1 )
					EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
					EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
					EnviroHazard1.MeterText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( EnviroHazard1, event )
					else
						EnviroHazard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EnviroHazard1:completeAnimation()
				EnviroHazard1.EnviroHazardMeter:completeAnimation()
				EnviroHazard1.IconEnviroHazard:completeAnimation()
				EnviroHazard1.MeterText:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -53, -27.33 )
				self.EnviroHazard1:setAlpha( 1 )
				self.EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
				self.EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
				self.EnviroHazard1.MeterText:setAlpha( 1 )
				EnviroHazard1Frame2( EnviroHazard1, {} )
				local EnviroHazard2Frame2 = function ( EnviroHazard2, event )
					local EnviroHazard2Frame3 = function ( EnviroHazard2, event )
						local EnviroHazard2Frame4 = function ( EnviroHazard2, event )
							local EnviroHazard2Frame5 = function ( EnviroHazard2, event )
								local EnviroHazard2Frame6 = function ( EnviroHazard2, event )
									local EnviroHazard2Frame7 = function ( EnviroHazard2, event )
										local EnviroHazard2Frame8 = function ( EnviroHazard2, event )
											local EnviroHazard2Frame9 = function ( EnviroHazard2, event )
												local EnviroHazard2Frame10 = function ( EnviroHazard2, event )
													local EnviroHazard2Frame11 = function ( EnviroHazard2, event )
														local EnviroHazard2Frame12 = function ( EnviroHazard2, event )
															local EnviroHazard2Frame13 = function ( EnviroHazard2, event )
																local EnviroHazard2Frame14 = function ( EnviroHazard2, event )
																	local EnviroHazard2Frame15 = function ( EnviroHazard2, event )
																		local EnviroHazard2Frame16 = function ( EnviroHazard2, event )
																			local EnviroHazard2Frame17 = function ( EnviroHazard2, event )
																				local EnviroHazard2Frame18 = function ( EnviroHazard2, event )
																					local EnviroHazard2Frame19 = function ( EnviroHazard2, event )
																						local EnviroHazard2Frame20 = function ( EnviroHazard2, event )
																							local EnviroHazard2Frame21 = function ( EnviroHazard2, event )
																								local EnviroHazard2Frame22 = function ( EnviroHazard2, event )
																									local EnviroHazard2Frame23 = function ( EnviroHazard2, event )
																										local EnviroHazard2Frame24 = function ( EnviroHazard2, event )
																											local EnviroHazard2Frame25 = function ( EnviroHazard2, event )
																												local EnviroHazard2Frame26 = function ( EnviroHazard2, event )
																													local EnviroHazard2Frame27 = function ( EnviroHazard2, event )
																														local EnviroHazard2Frame28 = function ( EnviroHazard2, event )
																															local EnviroHazard2Frame29 = function ( EnviroHazard2, event )
																																local EnviroHazard2Frame30 = function ( EnviroHazard2, event )
																																	local EnviroHazard2Frame31 = function ( EnviroHazard2, event )
																																		local EnviroHazard2Frame32 = function ( EnviroHazard2, event )
																																			local EnviroHazard2Frame33 = function ( EnviroHazard2, event )
																																				local EnviroHazard2Frame34 = function ( EnviroHazard2, event )
																																					local EnviroHazard2Frame35 = function ( EnviroHazard2, event )
																																						local EnviroHazard2Frame36 = function ( EnviroHazard2, event )
																																							local EnviroHazard2Frame37 = function ( EnviroHazard2, event )
																																								local EnviroHazard2Frame38 = function ( EnviroHazard2, event )
																																									local EnviroHazard2Frame39 = function ( EnviroHazard2, event )
																																										if not event.interrupted then
																																											EnviroHazard2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																											EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																																										end
																																										EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
																																										EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
																																										EnviroHazard2:setAlpha( 1 )
																																										EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
																																										EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
																																										EnviroHazard2.MeterText:setAlpha( 1 )
																																										EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																										EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
																																										if event.interrupted then
																																											self.clipFinished( EnviroHazard2, event )
																																										else
																																											EnviroHazard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																										end
																																									end
																																									
																																									if event.interrupted then
																																										EnviroHazard2Frame39( EnviroHazard2, event )
																																										return 
																																									else
																																										EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																										EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																										EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																																										EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																										EnviroHazard2.DamageWidgetArrow1:setAlpha( 0.6 )
																																										EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame39 )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									EnviroHazard2Frame38( EnviroHazard2, event )
																																									return 
																																								else
																																									EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																									EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0.5 )
																																									EnviroHazard2.DamageWidgetArrow1:setAlpha( 1 )
																																									EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								EnviroHazard2Frame37( EnviroHazard2, event )
																																								return 
																																							else
																																								EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																								EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																								EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0.75 )
																																								EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							EnviroHazard2Frame36( EnviroHazard2, event )
																																							return 
																																						else
																																							EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																							EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																							EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 1 )
																																							EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						EnviroHazard2Frame35( EnviroHazard2, event )
																																						return 
																																					else
																																						EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																						EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																						EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
																																						EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					EnviroHazard2Frame34( EnviroHazard2, event )
																																					return 
																																				else
																																					EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				EnviroHazard2Frame33( EnviroHazard2, event )
																																				return 
																																			else
																																				EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																				EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																				EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																				EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
																																				EnviroHazard2.DamageWidgetArrow1:setAlpha( 1 )
																																				EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			EnviroHazard2Frame32( EnviroHazard2, event )
																																			return 
																																		else
																																			EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																			EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		EnviroHazard2Frame31( EnviroHazard2, event )
																																		return 
																																	else
																																		EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																		EnviroHazard2.AmmoWidgetBackCircleOutter0:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																		EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																																		EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 1 )
																																		EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
																																		EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	EnviroHazard2Frame30( EnviroHazard2, event )
																																	return 
																																else
																																	EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																	EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																EnviroHazard2Frame29( EnviroHazard2, event )
																																return 
																															else
																																EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																																EnviroHazard2.MeterText:setAlpha( 1 )
																																EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															EnviroHazard2Frame28( EnviroHazard2, event )
																															return 
																														else
																															EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard2.DamageWidgetArrow1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																															EnviroHazard2.MeterText:setAlpha( 0.67 )
																															EnviroHazard2.DamageWidgetArrow1:setAlpha( 1 )
																															EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														EnviroHazard2Frame27( EnviroHazard2, event )
																														return 
																													else
																														EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																														EnviroHazard2.MeterText:setAlpha( 0.33 )
																														EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													EnviroHazard2Frame26( EnviroHazard2, event )
																													return 
																												else
																													EnviroHazard2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																													EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												EnviroHazard2Frame25( EnviroHazard2, event )
																												return 
																											else
																												EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																												EnviroHazard2.MeterText:setAlpha( 0 )
																												EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											EnviroHazard2Frame24( EnviroHazard2, event )
																											return 
																										else
																											EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																											EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										EnviroHazard2Frame23( EnviroHazard2, event )
																										return 
																									else
																										EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										EnviroHazard2.MeterText:setAlpha( 1 )
																										EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									EnviroHazard2Frame22( EnviroHazard2, event )
																									return 
																								else
																									EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																									EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								EnviroHazard2Frame21( EnviroHazard2, event )
																								return 
																							else
																								EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																								EnviroHazard2.MeterText:setAlpha( 0 )
																								EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							EnviroHazard2Frame20( EnviroHazard2, event )
																							return 
																						else
																							EnviroHazard2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																							EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																							EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																							EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
																							EnviroHazard2.MeterText:setAlpha( 1 )
																							EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						EnviroHazard2Frame19( EnviroHazard2, event )
																						return 
																					else
																						EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					EnviroHazard2Frame18( EnviroHazard2, event )
																					return 
																				else
																					EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																					EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
																					EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				EnviroHazard2Frame17( EnviroHazard2, event )
																				return 
																			else
																				EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																				EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			EnviroHazard2Frame16( EnviroHazard2, event )
																			return 
																		else
																			EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																			EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
																			EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		EnviroHazard2Frame15( EnviroHazard2, event )
																		return 
																	else
																		EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame15 )
																	end
																end
																
																if event.interrupted then
																	EnviroHazard2Frame14( EnviroHazard2, event )
																	return 
																else
																	EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																	EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
																	EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame14 )
																end
															end
															
															if event.interrupted then
																EnviroHazard2Frame13( EnviroHazard2, event )
																return 
															else
																EnviroHazard2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
																EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
																EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame13 )
															end
														end
														
														if event.interrupted then
															EnviroHazard2Frame12( EnviroHazard2, event )
															return 
														else
															EnviroHazard2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame12 )
														end
													end
													
													if event.interrupted then
														EnviroHazard2Frame11( EnviroHazard2, event )
														return 
													else
														EnviroHazard2:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
														EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
														EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame11 )
													end
												end
												
												if event.interrupted then
													EnviroHazard2Frame10( EnviroHazard2, event )
													return 
												else
													EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame10 )
												end
											end
											
											if event.interrupted then
												EnviroHazard2Frame9( EnviroHazard2, event )
												return 
											else
												EnviroHazard2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
												EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
												EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame9 )
											end
										end
										
										if event.interrupted then
											EnviroHazard2Frame8( EnviroHazard2, event )
											return 
										else
											EnviroHazard2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame8 )
										end
									end
									
									if event.interrupted then
										EnviroHazard2Frame7( EnviroHazard2, event )
										return 
									else
										EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
										EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
										EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame7 )
									end
								end
								
								if event.interrupted then
									EnviroHazard2Frame6( EnviroHazard2, event )
									return 
								else
									EnviroHazard2:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame6 )
								end
							end
							
							if event.interrupted then
								EnviroHazard2Frame5( EnviroHazard2, event )
								return 
							else
								EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
								EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazard2Frame4( EnviroHazard2, event )
							return 
						else
							EnviroHazard2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
							EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
							EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazard2Frame3( EnviroHazard2, event )
						return 
					else
						EnviroHazard2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame3 )
					end
				end
				
				EnviroHazard2:completeAnimation()
				EnviroHazard2.EnviroHazardMeter:completeAnimation()
				EnviroHazard2.IconEnviroHazard:completeAnimation()
				EnviroHazard2.MeterText:completeAnimation()
				EnviroHazard2.AmmoWidgetBackCircleOutter0:completeAnimation()
				EnviroHazard2.DamageWidgetArrow1:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
				self.EnviroHazard2:setAlpha( 1 )
				self.EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
				self.EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
				self.EnviroHazard2.MeterText:setAlpha( 0 )
				self.EnviroHazard2.AmmoWidgetBackCircleOutter0:setAlpha( 0 )
				self.EnviroHazard2.DamageWidgetArrow1:setAlpha( 0 )
				EnviroHazard2Frame2( EnviroHazard2, {} )
			end
		},
		Hess2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0.6 )
				self.clipFinished( ImgHess2Glow, {} )
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0 )
				self.clipFinished( ImgHess1Glow, {} )
				EnviroHazard1:completeAnimation()
				EnviroHazard1.EnviroHazardMeter:completeAnimation()
				EnviroHazard1.IconEnviroHazard:completeAnimation()
				EnviroHazard1.MeterText:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
				self.EnviroHazard1:setAlpha( 1 )
				self.EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
				self.EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
				self.EnviroHazard1.MeterText:setAlpha( 1 )
				self.clipFinished( EnviroHazard1, {} )
				EnviroHazard2:completeAnimation()
				EnviroHazard2.EnviroHazardMeter:completeAnimation()
				EnviroHazard2.IconEnviroHazard:completeAnimation()
				EnviroHazard2.MeterText:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
				self.EnviroHazard2:setAlpha( 1 )
				self.EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
				self.EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
				self.EnviroHazard2.MeterText:setAlpha( 1 )
				self.clipFinished( EnviroHazard2, {} )
				DamageWidgetSemiCircle0:completeAnimation()
				self.DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
				self.DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
				self.DamageWidgetSemiCircle0:setAlpha( 1 )
				self.clipFinished( DamageWidgetSemiCircle0, {} )
				AmmoWidgetBackLine:completeAnimation()
				self.AmmoWidgetBackLine:setLeftRight( true, false, -66, 29 )
				self.AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
				self.clipFinished( AmmoWidgetBackLine, {} )
				AmmoWidgetBackLine0:completeAnimation()
				self.AmmoWidgetBackLine0:setLeftRight( true, false, -66, 31 )
				self.AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
				self.clipFinished( AmmoWidgetBackLine0, {} )
				DamageWidgetArrow0:completeAnimation()
				self.DamageWidgetArrow0:setZRot( 180 )
				self.clipFinished( DamageWidgetArrow0, {} )
				DamageWidgetPixel0:completeAnimation()
				self.DamageWidgetPixel0:setAlpha( 0 )
				self.clipFinished( DamageWidgetPixel0, {} )
			end,
			Hess1 = function ()
				self:setupElementClipCounter( 4 )
				local ImgHess2GlowFrame2 = function ( ImgHess2Glow, event )
					if not event.interrupted then
						ImgHess2Glow:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					ImgHess2Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgHess2Glow, event )
					else
						ImgHess2Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0.6 )
				ImgHess2GlowFrame2( ImgHess2Glow, {} )
				local ImgHess1GlowFrame2 = function ( ImgHess1Glow, event )
					if not event.interrupted then
						ImgHess1Glow:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
					end
					ImgHess1Glow:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( ImgHess1Glow, event )
					else
						ImgHess1Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0 )
				ImgHess1GlowFrame2( ImgHess1Glow, {} )
				local EnviroHazard1Frame2 = function ( EnviroHazard1, event )
					local EnviroHazard1Frame3 = function ( EnviroHazard1, event )
						if not event.interrupted then
							EnviroHazard1:beginAnimation( "keyframe", 209, true, true, CoD.TweenType.Back )
						end
						EnviroHazard1:setLeftRight( true, false, 9, 162 )
						EnviroHazard1:setTopBottom( false, true, -53, -27.33 )
						EnviroHazard1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( EnviroHazard1, event )
						else
							EnviroHazard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EnviroHazard1Frame3( EnviroHazard1, event )
						return 
					else
						EnviroHazard1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame3 )
					end
				end
				
				EnviroHazard1:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
				self.EnviroHazard1:setAlpha( 1 )
				EnviroHazard1Frame2( EnviroHazard1, {} )
				local EnviroHazard2Frame2 = function ( EnviroHazard2, event )
					local EnviroHazard2Frame3 = function ( EnviroHazard2, event )
						local EnviroHazard2Frame4 = function ( EnviroHazard2, event )
							local EnviroHazard2Frame5 = function ( EnviroHazard2, event )
								if not event.interrupted then
									EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								end
								EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
								EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
								EnviroHazard2:setAlpha( 0 )
								EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
								EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
								EnviroHazard2.MeterText:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( EnviroHazard2, event )
								else
									EnviroHazard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EnviroHazard2Frame5( EnviroHazard2, event )
								return 
							else
								EnviroHazard2:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Linear )
								EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
								EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazard2Frame4( EnviroHazard2, event )
							return 
						else
							EnviroHazard2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 50, false, false, CoD.TweenType.Linear )
							EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
							EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazard2Frame3( EnviroHazard2, event )
						return 
					else
						EnviroHazard2:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 59, false, false, CoD.TweenType.Linear )
						EnviroHazard2.MeterText:setAlpha( 0 )
						EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame3 )
					end
				end
				
				EnviroHazard2:completeAnimation()
				EnviroHazard2.EnviroHazardMeter:completeAnimation()
				EnviroHazard2.IconEnviroHazard:completeAnimation()
				EnviroHazard2.MeterText:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
				self.EnviroHazard2:setAlpha( 1 )
				self.EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
				self.EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
				self.EnviroHazard2.MeterText:setAlpha( 1 )
				EnviroHazard2Frame2( EnviroHazard2, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 8 )
				local ImgHess2GlowFrame2 = function ( ImgHess2Glow, event )
					if not event.interrupted then
						ImgHess2Glow:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
					end
					ImgHess2Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgHess2Glow, event )
					else
						ImgHess2Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgHess2Glow:completeAnimation()
				self.ImgHess2Glow:setAlpha( 0.6 )
				ImgHess2GlowFrame2( ImgHess2Glow, {} )
				ImgHess1Glow:completeAnimation()
				self.ImgHess1Glow:setAlpha( 0 )
				self.clipFinished( ImgHess1Glow, {} )
				local EnviroHazard1Frame2 = function ( EnviroHazard1, event )
					local EnviroHazard1Frame3 = function ( EnviroHazard1, event )
						local EnviroHazard1Frame4 = function ( EnviroHazard1, event )
							local EnviroHazard1Frame5 = function ( EnviroHazard1, event )
								local EnviroHazard1Frame6 = function ( EnviroHazard1, event )
									if not event.interrupted then
										EnviroHazard1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
										EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
									end
									EnviroHazard1:setLeftRight( true, false, 9, 162 )
									EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
									EnviroHazard1:setAlpha( 0 )
									EnviroHazard1.EnviroHazardMeter:setAlpha( 0 )
									EnviroHazard1.IconEnviroHazard:setAlpha( 0 )
									EnviroHazard1.MeterText:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( EnviroHazard1, event )
									else
										EnviroHazard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EnviroHazard1Frame6( EnviroHazard1, event )
									return 
								else
									EnviroHazard1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									EnviroHazard1.MeterText:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
									EnviroHazard1.MeterText:setAlpha( 0 )
									EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame6 )
								end
							end
							
							if event.interrupted then
								EnviroHazard1Frame5( EnviroHazard1, event )
								return 
							else
								EnviroHazard1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								EnviroHazard1.EnviroHazardMeter:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
								EnviroHazard1.EnviroHazardMeter:setAlpha( 0 )
								EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazard1Frame4( EnviroHazard1, event )
							return 
						else
							EnviroHazard1:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							EnviroHazard1.IconEnviroHazard:beginAnimation( "subkeyframe", 70, false, false, CoD.TweenType.Linear )
							EnviroHazard1.IconEnviroHazard:setAlpha( 0 )
							EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazard1Frame3( EnviroHazard1, event )
						return 
					else
						EnviroHazard1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						EnviroHazard1:registerEventHandler( "transition_complete_keyframe", EnviroHazard1Frame3 )
					end
				end
				
				EnviroHazard1:completeAnimation()
				EnviroHazard1.EnviroHazardMeter:completeAnimation()
				EnviroHazard1.IconEnviroHazard:completeAnimation()
				EnviroHazard1.MeterText:completeAnimation()
				self.EnviroHazard1:setLeftRight( true, false, 9, 162 )
				self.EnviroHazard1:setTopBottom( false, true, -65, -39.33 )
				self.EnviroHazard1:setAlpha( 1 )
				self.EnviroHazard1.EnviroHazardMeter:setAlpha( 1 )
				self.EnviroHazard1.IconEnviroHazard:setAlpha( 1 )
				self.EnviroHazard1.MeterText:setAlpha( 1 )
				EnviroHazard1Frame2( EnviroHazard1, {} )
				local EnviroHazard2Frame2 = function ( EnviroHazard2, event )
					local EnviroHazard2Frame3 = function ( EnviroHazard2, event )
						local EnviroHazard2Frame4 = function ( EnviroHazard2, event )
							local EnviroHazard2Frame5 = function ( EnviroHazard2, event )
								if not event.interrupted then
									EnviroHazard2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
								end
								EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
								EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
								EnviroHazard2:setAlpha( 0 )
								EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
								EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
								EnviroHazard2.MeterText:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( EnviroHazard2, event )
								else
									EnviroHazard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								EnviroHazard2Frame5( EnviroHazard2, event )
								return 
							else
								EnviroHazard2:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								EnviroHazard2.IconEnviroHazard:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
								EnviroHazard2.IconEnviroHazard:setAlpha( 0 )
								EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame5 )
							end
						end
						
						if event.interrupted then
							EnviroHazard2Frame4( EnviroHazard2, event )
							return 
						else
							EnviroHazard2:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							EnviroHazard2.EnviroHazardMeter:beginAnimation( "subkeyframe", 70, false, false, CoD.TweenType.Linear )
							EnviroHazard2.EnviroHazardMeter:setAlpha( 0 )
							EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame4 )
						end
					end
					
					if event.interrupted then
						EnviroHazard2Frame3( EnviroHazard2, event )
						return 
					else
						EnviroHazard2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						EnviroHazard2.MeterText:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						EnviroHazard2.MeterText:setAlpha( 0 )
						EnviroHazard2:registerEventHandler( "transition_complete_keyframe", EnviroHazard2Frame3 )
					end
				end
				
				EnviroHazard2:completeAnimation()
				EnviroHazard2.EnviroHazardMeter:completeAnimation()
				EnviroHazard2.IconEnviroHazard:completeAnimation()
				EnviroHazard2.MeterText:completeAnimation()
				self.EnviroHazard2:setLeftRight( true, false, 9, 162.01 )
				self.EnviroHazard2:setTopBottom( false, true, -40.5, -14.83 )
				self.EnviroHazard2:setAlpha( 1 )
				self.EnviroHazard2.EnviroHazardMeter:setAlpha( 1 )
				self.EnviroHazard2.IconEnviroHazard:setAlpha( 1 )
				self.EnviroHazard2.MeterText:setAlpha( 1 )
				EnviroHazard2Frame2( EnviroHazard2, {} )
				local DamageWidgetSemiCircle0Frame2 = function ( DamageWidgetSemiCircle0, event )
					if not event.interrupted then
						DamageWidgetSemiCircle0:beginAnimation( "keyframe", 99, true, true, CoD.TweenType.Linear )
					end
					DamageWidgetSemiCircle0:setLeftRight( true, false, -5.67, 17.66 )
					DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
					if event.interrupted then
						self.clipFinished( DamageWidgetSemiCircle0, event )
					else
						DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DamageWidgetSemiCircle0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				DamageWidgetSemiCircle0:setLeftRight( true, false, 19.33, 42.66 )
				DamageWidgetSemiCircle0:setTopBottom( true, false, 0, 80 )
				DamageWidgetSemiCircle0:registerEventHandler( "transition_complete_keyframe", DamageWidgetSemiCircle0Frame2 )
				local AmmoWidgetBackLineFrame2 = function ( AmmoWidgetBackLine, event )
					if not event.interrupted then
						AmmoWidgetBackLine:beginAnimation( "keyframe", 99, true, true, CoD.TweenType.Linear )
					end
					AmmoWidgetBackLine:setLeftRight( true, false, -66, 3 )
					AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetBackLine, event )
					else
						AmmoWidgetBackLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetBackLine:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				AmmoWidgetBackLine:setLeftRight( true, false, -66, 29 )
				AmmoWidgetBackLine:setTopBottom( true, false, 7, 9.67 )
				AmmoWidgetBackLine:registerEventHandler( "transition_complete_keyframe", AmmoWidgetBackLineFrame2 )
				local AmmoWidgetBackLine0Frame2 = function ( AmmoWidgetBackLine0, event )
					if not event.interrupted then
						AmmoWidgetBackLine0:beginAnimation( "keyframe", 99, true, true, CoD.TweenType.Linear )
					end
					AmmoWidgetBackLine0:setLeftRight( true, false, -66, 6 )
					AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
					if event.interrupted then
						self.clipFinished( AmmoWidgetBackLine0, event )
					else
						AmmoWidgetBackLine0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AmmoWidgetBackLine0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				AmmoWidgetBackLine0:setLeftRight( true, false, -66, 31 )
				AmmoWidgetBackLine0:setTopBottom( true, false, 69, 71.67 )
				AmmoWidgetBackLine0:registerEventHandler( "transition_complete_keyframe", AmmoWidgetBackLine0Frame2 )
				local DamageWidgetArrow0Frame2 = function ( DamageWidgetArrow0, event )
					if not event.interrupted then
						DamageWidgetArrow0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
					end
					DamageWidgetArrow0:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( DamageWidgetArrow0, event )
					else
						DamageWidgetArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DamageWidgetArrow0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				DamageWidgetArrow0:setZRot( 180 )
				DamageWidgetArrow0:registerEventHandler( "transition_complete_keyframe", DamageWidgetArrow0Frame2 )
			end
		}
	}
	self.close = function ( self )
		self.EnviroHazard1:close()
		self.EnviroHazard2:close()
		self.DamageWidgetSemiCircle0:close()
		self.AmmoWidgetBackLine:close()
		self.AmmoWidgetBackLine0:close()
		self.DamageWidgetArrow0:close()
		self.DamageWidgetPixel0:close()
		CoD.DamageWidget_EnviroHazardContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

