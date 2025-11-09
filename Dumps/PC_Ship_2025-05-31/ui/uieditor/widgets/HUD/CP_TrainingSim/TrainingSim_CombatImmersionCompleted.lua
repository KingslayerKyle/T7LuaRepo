require( "ui.uieditor.widgets.HUD.CP_TrainingSim.TrainingSim_CombatImmersionBox" )

CoD.TrainingSim_CombatImmersionCompleted = InheritFrom( LUI.UIElement )
CoD.TrainingSim_CombatImmersionCompleted.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TrainingSim_CombatImmersionCompleted )
	self.id = "TrainingSim_CombatImmersionCompleted"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 628 )
	self:setTopBottom( true, false, 0, 70 )
	
	local TrainingSimCombatImmersionBox = CoD.TrainingSim_CombatImmersionBox.new( menu, controller )
	TrainingSimCombatImmersionBox:setLeftRight( false, false, -361.69, 350.31 )
	TrainingSimCombatImmersionBox:setTopBottom( true, false, -29.77, -5.77 )
	self:addElement( TrainingSimCombatImmersionBox )
	self.TrainingSimCombatImmersionBox = TrainingSimCombatImmersionBox
	
	local CornerFrameLR = LUI.UIImage.new()
	CornerFrameLR:setLeftRight( false, true, 0, 35 )
	CornerFrameLR:setTopBottom( false, true, -35, 0 )
	CornerFrameLR:setRGB( 0, 0.92, 0.91 )
	CornerFrameLR:setAlpha( 0.25 )
	CornerFrameLR:setXRot( 180 )
	CornerFrameLR:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameLR )
	self.CornerFrameLR = CornerFrameLR
	
	local CornerFrameUR = LUI.UIImage.new()
	CornerFrameUR:setLeftRight( false, true, 0, 35 )
	CornerFrameUR:setTopBottom( true, false, 0, 35 )
	CornerFrameUR:setRGB( 0, 0.92, 0.91 )
	CornerFrameUR:setAlpha( 0.25 )
	CornerFrameUR:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameUR )
	self.CornerFrameUR = CornerFrameUR
	
	local TopFrameBlack = LUI.UIImage.new()
	TopFrameBlack:setLeftRight( true, true, 0, 0 )
	TopFrameBlack:setTopBottom( true, true, 0, 0 )
	TopFrameBlack:setRGB( 0, 0.92, 0.91 )
	TopFrameBlack:setAlpha( 0.25 )
	self:addElement( TopFrameBlack )
	self.TopFrameBlack = TopFrameBlack
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -35, 0 )
	Image0:setTopBottom( false, true, -35, 0 )
	Image0:setRGB( 0, 0.92, 0.91 )
	Image0:setAlpha( 0.25 )
	Image0:setXRot( 180 )
	Image0:setYRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -35, 0 )
	Image1:setTopBottom( true, false, 0, 35 )
	Image1:setRGB( 0, 0.92, 0.91 )
	Image1:setAlpha( 0.25 )
	Image1:setYRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, 43, 612 )
	Image2:setTopBottom( true, true, 32, -31 )
	Image2:setRGB( 0, 0.92, 0.91 )
	Image2:setAlpha( 0.25 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, -612.5, -43.5 )
	Image20:setTopBottom( true, true, 32, -31 )
	Image20:setRGB( 0, 0.92, 0.91 )
	Image20:setAlpha( 0.25 )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local txtSimComplete10 = LUI.UIText.new()
	txtSimComplete10:setLeftRight( false, false, -314, 314 )
	txtSimComplete10:setTopBottom( true, false, 5, 75 )
	txtSimComplete10:setText( Engine.Localize( "CP_SH_CAIRO_TRAINING_SIM_COMPLETE_2" ) )
	txtSimComplete10:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	txtSimComplete10:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	txtSimComplete10:setShaderVector( 0, 0.1, 0, 0, 0 )
	txtSimComplete10:setShaderVector( 1, 0, 0, 0, 0 )
	txtSimComplete10:setShaderVector( 2, 0, 0, 0, 0 )
	txtSimComplete10:setShaderVector( 3, 0, 0, 0, 0 )
	txtSimComplete10:setShaderVector( 4, 0, 0, 0, 0 )
	txtSimComplete10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtSimComplete10:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtSimComplete10 )
	self.txtSimComplete10 = txtSimComplete10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							if not f5_arg1.interrupted then
								f5_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							f5_arg0:setAlpha( 0 )
							if f5_arg1.interrupted then
								self.clipFinished( f5_arg0, f5_arg1 )
							else
								f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f3_arg0:setAlpha( 1 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				TrainingSimCombatImmersionBox:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				TrainingSimCombatImmersionBox:setAlpha( 0 )
				TrainingSimCombatImmersionBox:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local f2_local1 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f7_arg0, f7_arg1 )
						local f7_local0 = function ( f8_arg0, f8_arg1 )
							if not f8_arg1.interrupted then
								f8_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							f8_arg0:setAlpha( 0 )
							if f8_arg1.interrupted then
								self.clipFinished( f8_arg0, f8_arg1 )
							else
								f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f7_arg1.interrupted then
							f7_local0( f7_arg0, f7_arg1 )
							return 
						else
							f7_arg0:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f6_arg0:setAlpha( 0.25 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				CornerFrameLR:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				CornerFrameLR:setAlpha( 0 )
				CornerFrameLR:registerEventHandler( "transition_complete_keyframe", f2_local1 )
				local f2_local2 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f10_arg0, f10_arg1 )
						local f10_local0 = function ( f11_arg0, f11_arg1 )
							if not f11_arg1.interrupted then
								f11_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							f11_arg0:setAlpha( 0 )
							if f11_arg1.interrupted then
								self.clipFinished( f11_arg0, f11_arg1 )
							else
								f11_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f10_arg1.interrupted then
							f10_local0( f10_arg0, f10_arg1 )
							return 
						else
							f10_arg0:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
							f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f9_arg0:setAlpha( 0.25 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				CornerFrameUR:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				CornerFrameUR:setAlpha( 0 )
				CornerFrameUR:registerEventHandler( "transition_complete_keyframe", f2_local2 )
				local f2_local3 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f13_arg0, f13_arg1 )
						local f13_local0 = function ( f14_arg0, f14_arg1 )
							if not f14_arg1.interrupted then
								f14_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							f14_arg0:setAlpha( 0 )
							if f14_arg1.interrupted then
								self.clipFinished( f14_arg0, f14_arg1 )
							else
								f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f13_arg1.interrupted then
							f13_local0( f13_arg0, f13_arg1 )
							return 
						else
							f13_arg0:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f12_arg0:setAlpha( 0.25 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				TopFrameBlack:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				TopFrameBlack:setAlpha( 0 )
				TopFrameBlack:registerEventHandler( "transition_complete_keyframe", f2_local3 )
				local f2_local4 = function ( f15_arg0, f15_arg1 )
					local f15_local0 = function ( f16_arg0, f16_arg1 )
						local f16_local0 = function ( f17_arg0, f17_arg1 )
							if not f17_arg1.interrupted then
								f17_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							f17_arg0:setAlpha( 0 )
							if f17_arg1.interrupted then
								self.clipFinished( f17_arg0, f17_arg1 )
							else
								f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f16_arg1.interrupted then
							f16_local0( f16_arg0, f16_arg1 )
							return 
						else
							f16_arg0:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
							f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
						end
					end
					
					if f15_arg1.interrupted then
						f15_local0( f15_arg0, f15_arg1 )
						return 
					else
						f15_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f15_arg0:setAlpha( 0.25 )
						f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
					end
				end
				
				Image0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				Image0:setAlpha( 0 )
				Image0:registerEventHandler( "transition_complete_keyframe", f2_local4 )
				local f2_local5 = function ( f18_arg0, f18_arg1 )
					local f18_local0 = function ( f19_arg0, f19_arg1 )
						local f19_local0 = function ( f20_arg0, f20_arg1 )
							if not f20_arg1.interrupted then
								f20_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							f20_arg0:setAlpha( 0 )
							if f20_arg1.interrupted then
								self.clipFinished( f20_arg0, f20_arg1 )
							else
								f20_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f19_arg1.interrupted then
							f19_local0( f19_arg0, f19_arg1 )
							return 
						else
							f19_arg0:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
							f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
						end
					end
					
					if f18_arg1.interrupted then
						f18_local0( f18_arg0, f18_arg1 )
						return 
					else
						f18_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f18_arg0:setAlpha( 0.25 )
						f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
					end
				end
				
				Image1:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				Image1:setAlpha( 0 )
				Image1:registerEventHandler( "transition_complete_keyframe", f2_local5 )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							if not event.interrupted then
								Image2:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							Image2:setLeftRight( false, true, 634, 1203 )
							Image2:setTopBottom( true, true, 32, -31 )
							if event.interrupted then
								self.clipFinished( Image2, event )
							else
								Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image2Frame4( Image2, event )
							return 
						else
							Image2:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
							Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame4 )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Image2:setLeftRight( false, true, 43, 612 )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, true, 634, 1203 )
				self.Image2:setTopBottom( true, true, 32, -31 )
				Image2Frame2( Image2, {} )
				local Image20Frame2 = function ( Image20, event )
					local Image20Frame3 = function ( Image20, event )
						local Image20Frame4 = function ( Image20, event )
							if not event.interrupted then
								Image20:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							end
							Image20:setLeftRight( true, false, -1145.5, -576.5 )
							Image20:setTopBottom( true, true, 32, -31 )
							if event.interrupted then
								self.clipFinished( Image20, event )
							else
								Image20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Image20Frame4( Image20, event )
							return 
						else
							Image20:beginAnimation( "keyframe", 2460, false, false, CoD.TweenType.Linear )
							Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame4 )
						end
					end
					
					if event.interrupted then
						Image20Frame3( Image20, event )
						return 
					else
						Image20:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Image20:setLeftRight( true, false, -612.5, -43.5 )
						Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame3 )
					end
				end
				
				Image20:completeAnimation()
				self.Image20:setLeftRight( true, false, -1145.5, -576.5 )
				self.Image20:setTopBottom( true, true, 32, -31 )
				Image20Frame2( Image20, {} )
				local f2_local8 = function ( f27_arg0, f27_arg1 )
					local f27_local0 = function ( f28_arg0, f28_arg1 )
						local f28_local0 = function ( f29_arg0, f29_arg1 )
							local f29_local0 = function ( f30_arg0, f30_arg1 )
								local f30_local0 = function ( f31_arg0, f31_arg1 )
									local f31_local0 = function ( f32_arg0, f32_arg1 )
										local f32_local0 = function ( f33_arg0, f33_arg1 )
											if not f33_arg1.interrupted then
												f33_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											end
											f33_arg0:setAlpha( 0 )
											if f33_arg1.interrupted then
												self.clipFinished( f33_arg0, f33_arg1 )
											else
												f33_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f32_arg1.interrupted then
											f32_local0( f32_arg0, f32_arg1 )
											return 
										else
											f32_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											f32_arg0:setAlpha( 1 )
											f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
										end
									end
									
									if f31_arg1.interrupted then
										f31_local0( f31_arg0, f31_arg1 )
										return 
									else
										f31_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										f31_arg0:setAlpha( 0.39 )
										f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
									end
								end
								
								if f30_arg1.interrupted then
									f30_local0( f30_arg0, f30_arg1 )
									return 
								else
									f30_arg0:beginAnimation( "keyframe", 2299, false, false, CoD.TweenType.Linear )
									f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
								end
							end
							
							if f29_arg1.interrupted then
								f29_local0( f29_arg0, f29_arg1 )
								return 
							else
								f29_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								f29_arg0:setAlpha( 1 )
								f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
							end
						end
						
						if f28_arg1.interrupted then
							f28_local0( f28_arg0, f28_arg1 )
							return 
						else
							f28_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							f28_arg0:setAlpha( 0.39 )
							f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
						end
					end
					
					if f27_arg1.interrupted then
						f27_local0( f27_arg0, f27_arg1 )
						return 
					else
						f27_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f27_arg0:setAlpha( 1 )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
				end
				
				txtSimComplete10:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				txtSimComplete10:setAlpha( 0 )
				txtSimComplete10:registerEventHandler( "transition_complete_keyframe", f2_local8 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TrainingSimCombatImmersionBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

