-- 9812c2cb37f7dba721bc6e9ef0027944
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSim_TimeBonusBox" )

CoD.TrainingSim_RoundCompleteWidget = InheritFrom( LUI.UIElement )
CoD.TrainingSim_RoundCompleteWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TrainingSim_RoundCompleteWidget )
	self.id = "TrainingSim_RoundCompleteWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 935 )
	self:setTopBottom( true, false, 0, 70 )
	
	local txtTimeBonusData = LUI.UIText.new()
	txtTimeBonusData:setLeftRight( false, false, -576.34, 575.27 )
	txtTimeBonusData:setTopBottom( false, false, 72, 135 )
	txtTimeBonusData:setAlpha( 0.9 )
	txtTimeBonusData:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	txtTimeBonusData:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	txtTimeBonusData:setShaderVector( 0, 0.1, 0, 0, 0 )
	txtTimeBonusData:setShaderVector( 1, 0, 0, 0, 0 )
	txtTimeBonusData:setShaderVector( 2, 0, 0, 0, 0 )
	txtTimeBonusData:setShaderVector( 3, 0, 0, 0, 0 )
	txtTimeBonusData:setShaderVector( 4, 0, 0, 0, 0 )
	txtTimeBonusData:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtTimeBonusData:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	txtTimeBonusData:linkToElementModel( self, "training_sim_time_bonus", true, function ( model )
		local trainingSimTimeBonus = Engine.GetModelValue( model )
		if trainingSimTimeBonus then
			txtTimeBonusData:setText( Engine.Localize( trainingSimTimeBonus ) )
		end
	end )
	self:addElement( txtTimeBonusData )
	self.txtTimeBonusData = txtTimeBonusData
	
	local CPTrainingSimTimeBonusBox = CoD.CPTrainingSim_TimeBonusBox.new( menu, controller )
	CPTrainingSimTimeBonusBox:setLeftRight( false, false, -606.28, 605.22 )
	CPTrainingSimTimeBonusBox:setTopBottom( false, false, 42, 72 )
	self:addElement( CPTrainingSimTimeBonusBox )
	self.CPTrainingSimTimeBonusBox = CPTrainingSimTimeBonusBox
	
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
	Image2:setTopBottom( true, true, 32, -32 )
	Image2:setRGB( 0, 0.92, 0.91 )
	Image2:setAlpha( 0.25 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( true, false, -612.5, -43.5 )
	Image20:setTopBottom( true, true, 32, -32 )
	Image20:setRGB( 0, 0.92, 0.91 )
	Image20:setAlpha( 0.25 )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local txtRoundComplete0 = LUI.UIText.new()
	txtRoundComplete0:setLeftRight( false, false, -467.5, 467.5 )
	txtRoundComplete0:setTopBottom( true, false, 4, 74 )
	txtRoundComplete0:setText( Engine.Localize( "CP_SH_CAIRO_ROUND_COMPLETE" ) )
	txtRoundComplete0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	txtRoundComplete0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	txtRoundComplete0:setShaderVector( 0, 0.1, 0, 0, 0 )
	txtRoundComplete0:setShaderVector( 1, 0, 0, 0, 0 )
	txtRoundComplete0:setShaderVector( 2, 0, 0, 0, 0 )
	txtRoundComplete0:setShaderVector( 3, 0, 0, 0, 0 )
	txtRoundComplete0:setShaderVector( 4, 0, 0, 0, 0 )
	txtRoundComplete0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	txtRoundComplete0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtRoundComplete0 )
	self.txtRoundComplete0 = txtRoundComplete0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				local f3_local0 = function ( f4_arg0, f4_arg1 )
					local f4_local0 = function ( f5_arg0, f5_arg1 )
						local f5_local0 = function ( f6_arg0, f6_arg1 )
							local f6_local0 = function ( f7_arg0, f7_arg1 )
								local f7_local0 = function ( f8_arg0, f8_arg1 )
									local f8_local0 = function ( f9_arg0, f9_arg1 )
										local f9_local0 = function ( f10_arg0, f10_arg1 )
											if not f10_arg1.interrupted then
												f10_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
											end
											f10_arg0:setAlpha( 0 )
											if f10_arg1.interrupted then
												self.clipFinished( f10_arg0, f10_arg1 )
											else
												f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f9_arg1.interrupted then
											f9_local0( f9_arg0, f9_arg1 )
											return 
										else
											f9_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											f9_arg0:setAlpha( 1 )
											f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
										end
									end
									
									if f8_arg1.interrupted then
										f8_local0( f8_arg0, f8_arg1 )
										return 
									else
										f8_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										f8_arg0:setAlpha( 0.5 )
										f8_arg0:registerEventHandler( "transition_complete_keyframe", f8_local0 )
									end
								end
								
								if f7_arg1.interrupted then
									f7_local0( f7_arg0, f7_arg1 )
									return 
								else
									f7_arg0:beginAnimation( "keyframe", 2700, false, false, CoD.TweenType.Linear )
									f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
								end
							end
							
							if f6_arg1.interrupted then
								f6_local0( f6_arg0, f6_arg1 )
								return 
							else
								f6_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								f6_arg0:setAlpha( 1 )
								f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
							end
						end
						
						if f5_arg1.interrupted then
							f5_local0( f5_arg0, f5_arg1 )
							return 
						else
							f5_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							f5_arg0:setAlpha( 0.5 )
							f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
						end
					end
					
					if f4_arg1.interrupted then
						f4_local0( f4_arg0, f4_arg1 )
						return 
					else
						f4_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f4_arg0:setAlpha( 1 )
						f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
					end
				end
				
				txtTimeBonusData:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				txtTimeBonusData:setAlpha( 0 )
				txtTimeBonusData:registerEventHandler( "transition_complete_keyframe", f3_local0 )
				local f3_local1 = function ( f11_arg0, f11_arg1 )
					local f11_local0 = function ( f12_arg0, f12_arg1 )
						local f12_local0 = function ( f13_arg0, f13_arg1 )
							if not f13_arg1.interrupted then
								f13_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							f13_arg0:setAlpha( 0 )
							if f13_arg1.interrupted then
								self.clipFinished( f13_arg0, f13_arg1 )
							else
								f13_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f12_arg1.interrupted then
							f12_local0( f12_arg0, f12_arg1 )
							return 
						else
							f12_arg0:beginAnimation( "keyframe", 2819, false, false, CoD.TweenType.Linear )
							f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
						end
					end
					
					if f11_arg1.interrupted then
						f11_local0( f11_arg0, f11_arg1 )
						return 
					else
						f11_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f11_arg0:setAlpha( 1 )
						f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
					end
				end
				
				CPTrainingSimTimeBonusBox:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				CPTrainingSimTimeBonusBox:setAlpha( 0 )
				CPTrainingSimTimeBonusBox:registerEventHandler( "transition_complete_keyframe", f3_local1 )
				local f3_local2 = function ( f14_arg0, f14_arg1 )
					local f14_local0 = function ( f15_arg0, f15_arg1 )
						local f15_local0 = function ( f16_arg0, f16_arg1 )
							if not f16_arg1.interrupted then
								f16_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							f16_arg0:setAlpha( 0 )
							if f16_arg1.interrupted then
								self.clipFinished( f16_arg0, f16_arg1 )
							else
								f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f15_arg1.interrupted then
							f15_local0( f15_arg0, f15_arg1 )
							return 
						else
							f15_arg0:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
							f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
						end
					end
					
					if f14_arg1.interrupted then
						f14_local0( f14_arg0, f14_arg1 )
						return 
					else
						f14_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f14_arg0:setAlpha( 0.25 )
						f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
					end
				end
				
				CornerFrameLR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CornerFrameLR:setAlpha( 0 )
				CornerFrameLR:registerEventHandler( "transition_complete_keyframe", f3_local2 )
				local f3_local3 = function ( f17_arg0, f17_arg1 )
					local f17_local0 = function ( f18_arg0, f18_arg1 )
						local f18_local0 = function ( f19_arg0, f19_arg1 )
							if not f19_arg1.interrupted then
								f19_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							f19_arg0:setAlpha( 0 )
							if f19_arg1.interrupted then
								self.clipFinished( f19_arg0, f19_arg1 )
							else
								f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f18_arg1.interrupted then
							f18_local0( f18_arg0, f18_arg1 )
							return 
						else
							f18_arg0:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
							f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
						end
					end
					
					if f17_arg1.interrupted then
						f17_local0( f17_arg0, f17_arg1 )
						return 
					else
						f17_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f17_arg0:setAlpha( 0.25 )
						f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
					end
				end
				
				CornerFrameUR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CornerFrameUR:setAlpha( 0 )
				CornerFrameUR:registerEventHandler( "transition_complete_keyframe", f3_local3 )
				local f3_local4 = function ( f20_arg0, f20_arg1 )
					local f20_local0 = function ( f21_arg0, f21_arg1 )
						local f21_local0 = function ( f22_arg0, f22_arg1 )
							if not f22_arg1.interrupted then
								f22_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							f22_arg0:setAlpha( 0 )
							if f22_arg1.interrupted then
								self.clipFinished( f22_arg0, f22_arg1 )
							else
								f22_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f21_arg1.interrupted then
							f21_local0( f21_arg0, f21_arg1 )
							return 
						else
							f21_arg0:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
							f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
						end
					end
					
					if f20_arg1.interrupted then
						f20_local0( f20_arg0, f20_arg1 )
						return 
					else
						f20_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f20_arg0:setAlpha( 0.25 )
						f20_arg0:registerEventHandler( "transition_complete_keyframe", f20_local0 )
					end
				end
				
				TopFrameBlack:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				TopFrameBlack:setAlpha( 0 )
				TopFrameBlack:registerEventHandler( "transition_complete_keyframe", f3_local4 )
				local f3_local5 = function ( f23_arg0, f23_arg1 )
					local f23_local0 = function ( f24_arg0, f24_arg1 )
						local f24_local0 = function ( f25_arg0, f25_arg1 )
							if not f25_arg1.interrupted then
								f25_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
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
							f24_arg0:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
							f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
						end
					end
					
					if f23_arg1.interrupted then
						f23_local0( f23_arg0, f23_arg1 )
						return 
					else
						f23_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f23_arg0:setAlpha( 0.25 )
						f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
					end
				end
				
				Image0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				Image0:setAlpha( 0 )
				Image0:registerEventHandler( "transition_complete_keyframe", f3_local5 )
				local f3_local6 = function ( f26_arg0, f26_arg1 )
					local f26_local0 = function ( f27_arg0, f27_arg1 )
						local f27_local0 = function ( f28_arg0, f28_arg1 )
							if not f28_arg1.interrupted then
								f28_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							f28_arg0:setAlpha( 0 )
							if f28_arg1.interrupted then
								self.clipFinished( f28_arg0, f28_arg1 )
							else
								f28_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f27_arg1.interrupted then
							f27_local0( f27_arg0, f27_arg1 )
							return 
						else
							f27_arg0:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
							f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
						end
					end
					
					if f26_arg1.interrupted then
						f26_local0( f26_arg0, f26_arg1 )
						return 
					else
						f26_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f26_arg0:setAlpha( 0.25 )
						f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
					end
				end
				
				Image1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				Image1:setAlpha( 0 )
				Image1:registerEventHandler( "transition_complete_keyframe", f3_local6 )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						local Image2Frame4 = function ( Image2, event )
							if not event.interrupted then
								Image2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							Image2:setLeftRight( false, true, 588, 1157 )
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
							Image2:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
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
				self.Image2:setLeftRight( false, true, 588, 1157 )
				self.Image2:setTopBottom( true, true, 32, -31 )
				Image2Frame2( Image2, {} )
				local Image20Frame2 = function ( Image20, event )
					local Image20Frame3 = function ( Image20, event )
						local Image20Frame4 = function ( Image20, event )
							if not event.interrupted then
								Image20:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							Image20:setLeftRight( true, false, -1127.5, -558.5 )
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
							Image20:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
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
				self.Image20:setLeftRight( true, false, -1127.5, -558.5 )
				self.Image20:setTopBottom( true, true, 32, -31 )
				Image20Frame2( Image20, {} )
				local f3_local9 = function ( f35_arg0, f35_arg1 )
					local f35_local0 = function ( f36_arg0, f36_arg1 )
						local f36_local0 = function ( f37_arg0, f37_arg1 )
							if not f37_arg1.interrupted then
								f37_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							end
							f37_arg0:setAlpha( 0 )
							if f37_arg1.interrupted then
								self.clipFinished( f37_arg0, f37_arg1 )
							else
								f37_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f36_arg1.interrupted then
							f36_local0( f36_arg0, f36_arg1 )
							return 
						else
							f36_arg0:beginAnimation( "keyframe", 2980, false, false, CoD.TweenType.Linear )
							f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
						end
					end
					
					if f35_arg1.interrupted then
						f35_local0( f35_arg0, f35_arg1 )
						return 
					else
						f35_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						f35_arg0:setAlpha( 1 )
						f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
					end
				end
				
				txtRoundComplete0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				txtRoundComplete0:setAlpha( 0 )
				txtRoundComplete0:registerEventHandler( "transition_complete_keyframe", f3_local9 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPTrainingSimTimeBonusBox:close()
		element.txtTimeBonusData:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

