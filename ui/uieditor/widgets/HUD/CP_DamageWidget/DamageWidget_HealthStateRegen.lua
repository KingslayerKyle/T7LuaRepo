-- 049f94a6a239e555fa81019691e69122
-- This hash is used for caching, delete to decompile the file again

CoD.DamageWidget_HealthStateRegen = InheritFrom( LUI.UIElement )
CoD.DamageWidget_HealthStateRegen.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_HealthStateRegen )
	self.id = "DamageWidget_HealthStateRegen"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 58 )
	
	local ImgStateShape = LUI.UIImage.new()
	ImgStateShape:setLeftRight( true, false, 0, 47.33 )
	ImgStateShape:setTopBottom( true, false, 0, 57.33 )
	ImgStateShape:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityfill" ) )
	ImgStateShape:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
	ImgStateShape:setShaderVector( 0, 0.4, 0, 0, 0 )
	ImgStateShape:setShaderVector( 1, 1, 0, 0, 0 )
	ImgStateShape:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( ImgStateShape )
	self.ImgStateShape = ImgStateShape
	
	local ImgStateShape0 = LUI.UIImage.new()
	ImgStateShape0:setLeftRight( true, false, 0, 47.33 )
	ImgStateShape0:setTopBottom( true, false, 0, 57.33 )
	ImgStateShape0:setAlpha( 0 )
	ImgStateShape0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityfill" ) )
	ImgStateShape0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
	ImgStateShape0:setShaderVector( 0, 10, 0, 0, 0 )
	ImgStateShape0:setShaderVector( 1, 1, 0, 0, 0 )
	ImgStateShape0:setShaderVector( 2, 0.5, 0, 0, 0 )
	self:addElement( ImgStateShape0 )
	self.ImgStateShape0 = ImgStateShape0
	
	local ImageGlitch1 = LUI.UIImage.new()
	ImageGlitch1:setLeftRight( true, false, -27, 24 )
	ImageGlitch1:setTopBottom( true, false, 47.92, 49.92 )
	ImageGlitch1:setAlpha( 0 )
	ImageGlitch1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( ImageGlitch1 )
	self.ImageGlitch1 = ImageGlitch1
	
	local ImageGlitch2 = LUI.UIImage.new()
	ImageGlitch2:setLeftRight( true, false, -27, 24 )
	ImageGlitch2:setTopBottom( true, false, 6.92, 8.92 )
	ImageGlitch2:setAlpha( 0 )
	ImageGlitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( ImageGlitch2 )
	self.ImageGlitch2 = ImageGlitch2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ImgStateShape:completeAnimation()
				self.ImgStateShape:setRGB( 1, 1, 1 )
				self.ImgStateShape:setAlpha( 0 )
				self.clipFinished( ImgStateShape, {} )

				ImgStateShape0:completeAnimation()
				self.ImgStateShape0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
				self.ImgStateShape0:setShaderVector( 0, 10, 0, 0, 0 )
				self.ImgStateShape0:setShaderVector( 1, 1, 0, 0, 0 )
				self.ImgStateShape0:setShaderVector( 2, 0.5, 0, 0, 0 )
				self.clipFinished( ImgStateShape0, {} )

				ImageGlitch1:completeAnimation()
				self.ImageGlitch1:setAlpha( 0 )
				self.clipFinished( ImageGlitch1, {} )

				ImageGlitch2:completeAnimation()
				self.ImageGlitch2:setAlpha( 0 )
				self.clipFinished( ImageGlitch2, {} )
			end
		},
		Regen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local ImgStateShapeFrame2 = function ( ImgStateShape, event )
					local ImgStateShapeFrame3 = function ( ImgStateShape, event )
						local ImgStateShapeFrame4 = function ( ImgStateShape, event )
							local ImgStateShapeFrame5 = function ( ImgStateShape, event )
								local ImgStateShapeFrame6 = function ( ImgStateShape, event )
									if not event.interrupted then
										ImgStateShape:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									end
									ImgStateShape:setAlpha( 0 )
									ImgStateShape:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
									ImgStateShape:setShaderVector( 0, 3, 0, 0, 0 )
									ImgStateShape:setShaderVector( 1, -1, 0, 0, 0 )
									ImgStateShape:setShaderVector( 2, 0, 0, 0, 0 )
									if event.interrupted then
										self.clipFinished( ImgStateShape, event )
									else
										ImgStateShape:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ImgStateShapeFrame6( ImgStateShape, event )
									return 
								else
									ImgStateShape:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
									ImgStateShape:setAlpha( 0 )
									ImgStateShape:setShaderVector( 1, -1, 0, 0, 0 )
									ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame6 )
								end
							end
							
							if event.interrupted then
								ImgStateShapeFrame5( ImgStateShape, event )
								return 
							else
								ImgStateShape:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								ImgStateShape:setAlpha( 0.82 )
								ImgStateShape:setShaderVector( 1, 0.14, 0, 0, 0 )
								ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame5 )
							end
						end
						
						if event.interrupted then
							ImgStateShapeFrame4( ImgStateShape, event )
							return 
						else
							ImgStateShape:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ImgStateShape:setAlpha( 0 )
							ImgStateShape:setShaderVector( 1, 0.29, 0, 0, 0 )
							ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShapeFrame3( ImgStateShape, event )
						return 
					else
						ImgStateShape:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						ImgStateShape:setShaderVector( 1, 0.71, 0, 0, 0 )
						ImgStateShape:registerEventHandler( "transition_complete_keyframe", ImgStateShapeFrame3 )
					end
				end
				
				ImgStateShape:completeAnimation()
				self.ImgStateShape:setAlpha( 1 )
				self.ImgStateShape:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
				self.ImgStateShape:setShaderVector( 0, 3, 0, 0, 0 )
				self.ImgStateShape:setShaderVector( 1, 1, 0, 0, 0 )
				self.ImgStateShape:setShaderVector( 2, 0, 0, 0, 0 )
				ImgStateShapeFrame2( ImgStateShape, {} )
				local ImgStateShape0Frame2 = function ( ImgStateShape0, event )
					local ImgStateShape0Frame3 = function ( ImgStateShape0, event )
						local ImgStateShape0Frame4 = function ( ImgStateShape0, event )
							if not event.interrupted then
								ImgStateShape0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							ImgStateShape0:setRGB( 1, 1, 1 )
							ImgStateShape0:setAlpha( 0 )
							ImgStateShape0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
							ImgStateShape0:setShaderVector( 0, 10, 0, 0, 0 )
							ImgStateShape0:setShaderVector( 1, -0.94, 0, 0, 0 )
							ImgStateShape0:setShaderVector( 2, 0.25, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( ImgStateShape0, event )
							else
								ImgStateShape0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ImgStateShape0Frame4( ImgStateShape0, event )
							return 
						else
							ImgStateShape0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							ImgStateShape0:setAlpha( 0 )
							ImgStateShape0:setShaderVector( 1, -0.77, 0, 0, 0 )
							ImgStateShape0:registerEventHandler( "transition_complete_keyframe", ImgStateShape0Frame4 )
						end
					end
					
					if event.interrupted then
						ImgStateShape0Frame3( ImgStateShape0, event )
						return 
					else
						ImgStateShape0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						ImgStateShape0:setShaderVector( 1, 0.43, 0, 0, 0 )
						ImgStateShape0:registerEventHandler( "transition_complete_keyframe", ImgStateShape0Frame3 )
					end
				end
				
				ImgStateShape0:completeAnimation()
				self.ImgStateShape0:setRGB( 1, 1, 1 )
				self.ImgStateShape0:setAlpha( 1 )
				self.ImgStateShape0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_slice" ) )
				self.ImgStateShape0:setShaderVector( 0, 10, 0, 0, 0 )
				self.ImgStateShape0:setShaderVector( 1, 0.95, 0, 0, 0 )
				self.ImgStateShape0:setShaderVector( 2, 0.25, 0, 0, 0 )
				ImgStateShape0Frame2( ImgStateShape0, {} )
				local f3_local2 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f13_arg0, f13_arg1 )
						local f13_local0 = function ( f14_arg0, f14_arg1 )
							local f14_local0 = function ( f15_arg0, f15_arg1 )
								local f15_local0 = function ( f16_arg0, f16_arg1 )
									local f16_local0 = function ( f17_arg0, f17_arg1 )
										local f17_local0 = function ( f18_arg0, f18_arg1 )
											if not f18_arg1.interrupted then
												f18_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											f18_arg0:setLeftRight( true, false, 41.67, 45.67 )
											f18_arg0:setTopBottom( true, false, 14.17, 18.17 )
											f18_arg0:setAlpha( 0 )
											if f18_arg1.interrupted then
												self.clipFinished( f18_arg0, f18_arg1 )
											else
												f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f17_arg1.interrupted then
											f17_local0( f17_arg0, f17_arg1 )
											return 
										else
											f17_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f17_arg0:setLeftRight( true, false, 41.67, 45.67 )
											f17_arg0:setTopBottom( true, false, 14.17, 18.17 )
											f17_arg0:setAlpha( 1 )
											f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
										end
									end
									
									if f16_arg1.interrupted then
										f16_local0( f16_arg0, f16_arg1 )
										return 
									else
										f16_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
									end
								end
								
								if f15_arg1.interrupted then
									f15_local0( f15_arg0, f15_arg1 )
									return 
								else
									f15_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f15_arg0:setAlpha( 0 )
									f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
								end
							end
							
							if f14_arg1.interrupted then
								f14_local0( f14_arg0, f14_arg1 )
								return 
							else
								f14_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f14_arg0:setLeftRight( true, false, 4.67, 19 )
								f14_arg0:setTopBottom( true, false, 52.92, 53.92 )
								f14_arg0:setAlpha( 1 )
								f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
							end
						end
						
						if f13_arg1.interrupted then
							f13_local0( f13_arg0, f13_arg1 )
							return 
						else
							f13_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f12_arg0:setAlpha( 0 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				ImageGlitch1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				ImageGlitch1:setLeftRight( true, false, -27, 24 )
				ImageGlitch1:setTopBottom( true, false, 47.92, 49.92 )
				ImageGlitch1:setAlpha( 1 )
				ImageGlitch1:registerEventHandler( "transition_complete_keyframe", f3_local2 )
				local f3_local3 = function ( f19_arg0, f19_arg1 )
					local f19_local0 = function ( f20_arg0, f20_arg1 )
						local f20_local0 = function ( f21_arg0, f21_arg1 )
							local f21_local0 = function ( f22_arg0, f22_arg1 )
								local f22_local0 = function ( f23_arg0, f23_arg1 )
									local f23_local0 = function ( f24_arg0, f24_arg1 )
										local f24_local0 = function ( f25_arg0, f25_arg1 )
											if not f25_arg1.interrupted then
												f25_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											end
											f25_arg0:setLeftRight( true, false, 41.67, 45.67 )
											f25_arg0:setTopBottom( true, false, 38.17, 42.17 )
											f25_arg0:setAlpha( 0 )
											if f25_arg1.interrupted then
												self.clipFinished( f25_arg0, f25_arg1 )
											else
												f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f24_arg1.interrupted then
											f24_local0( f24_arg0, f24_arg1 )
											return 
										else
											f24_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f24_arg0:setLeftRight( true, false, 41.67, 45.67 )
											f24_arg0:setTopBottom( true, false, 38.17, 42.17 )
											f24_arg0:setAlpha( 1 )
											f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
										end
									end
									
									if f23_arg1.interrupted then
										f23_local0( f23_arg0, f23_arg1 )
										return 
									else
										f23_arg0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
										f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
									end
								end
								
								if f22_arg1.interrupted then
									f22_local0( f22_arg0, f22_arg1 )
									return 
								else
									f22_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f22_arg0:setAlpha( 0 )
									f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
								end
							end
							
							if f21_arg1.interrupted then
								f21_local0( f21_arg0, f21_arg1 )
								return 
							else
								f21_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								f21_arg0:setLeftRight( true, false, 23.67, 36.67 )
								f21_arg0:setTopBottom( true, false, 8.17, 45.17 )
								f21_arg0:setAlpha( 1 )
								f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
							end
						end
						
						if f20_arg1.interrupted then
							f20_local0( f20_arg0, f20_arg1 )
							return 
						else
							f20_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
						end
					end
					
					if f19_arg1.interrupted then
						f19_local0( f19_arg0, f19_arg1 )
						return 
					else
						f19_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f19_arg0:setAlpha( 0 )
						f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
					end
				end
				
				ImageGlitch2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				ImageGlitch2:setLeftRight( true, false, -27, 24 )
				ImageGlitch2:setTopBottom( true, false, 6.92, 8.92 )
				ImageGlitch2:setAlpha( 1 )
				ImageGlitch2:registerEventHandler( "transition_complete_keyframe", f3_local3 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

