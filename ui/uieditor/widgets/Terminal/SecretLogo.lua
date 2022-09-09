-- b0007135d45e2cbf46a024803c8d0348
-- This hash is used for caching, delete to decompile the file again

CoD.SecretLogo = InheritFrom( LUI.UIElement )
CoD.SecretLogo.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SecretLogo )
	self.id = "SecretLogo"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 46 )
	self:setTopBottom( true, false, 0, 46 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BlueR = LUI.UIImage.new()
	BlueR:setLeftRight( true, false, 11, 43 )
	BlueR:setTopBottom( true, false, 3.29, 38.21 )
	BlueR:setAlpha( 0 )
	BlueR:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo_3l" ) )
	self:addElement( BlueR )
	self.BlueR = BlueR
	
	local BlueL = LUI.UIImage.new()
	BlueL:setLeftRight( true, false, 2.25, 34.25 )
	BlueL:setTopBottom( true, false, 7.54, 42 )
	BlueL:setAlpha( 0 )
	BlueL:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo_3r" ) )
	self:addElement( BlueL )
	self.BlueL = BlueL
	
	local InRing = LUI.UIImage.new()
	InRing:setLeftRight( true, false, 1.29, 44.29 )
	InRing:setTopBottom( true, false, 1.5, 44.5 )
	InRing:setAlpha( 0 )
	InRing:setYRot( 180 )
	InRing:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo_4" ) )
	self:addElement( InRing )
	self.InRing = InRing
	
	local OutRing = LUI.UIImage.new()
	OutRing:setLeftRight( true, false, 0.5, 46 )
	OutRing:setTopBottom( true, false, 0, 45.5 )
	OutRing:setAlpha( 0 )
	OutRing:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo_5" ) )
	self:addElement( OutRing )
	self.OutRing = OutRing
	
	local S = LUI.UIImage.new()
	S:setLeftRight( true, false, 6.53, 39.97 )
	S:setTopBottom( true, false, 8.85, 37.15 )
	S:setAlpha( 0 )
	S:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo_2" ) )
	self:addElement( S )
	self.S = S
	
	local INPiece2 = LUI.UIImage.new()
	INPiece2:setLeftRight( true, false, 13.51, 26.26 )
	INPiece2:setTopBottom( true, false, 20.75, 35.54 )
	INPiece2:setAlpha( 0 )
	INPiece2:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo_0" ) )
	self:addElement( INPiece2 )
	self.INPiece2 = INPiece2
	
	local InPiece = LUI.UIImage.new()
	InPiece:setLeftRight( true, false, 19.75, 32.77 )
	InPiece:setTopBottom( true, false, 9.85, 25.28 )
	InPiece:setAlpha( 0 )
	InPiece:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo_0" ) )
	self:addElement( InPiece )
	self.InPiece = InPiece
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, true, -1, 2 )
	logo:setTopBottom( true, true, -1, 2 )
	logo:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logo" ) )
	self:addElement( logo )
	self.logo = logo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				BlueR:completeAnimation()
				self.BlueR:setAlpha( 0 )
				self.clipFinished( BlueR, {} )

				BlueL:completeAnimation()
				self.BlueL:setAlpha( 0 )
				self.clipFinished( BlueL, {} )

				InRing:completeAnimation()
				self.InRing:setAlpha( 0 )
				self.clipFinished( InRing, {} )

				OutRing:completeAnimation()
				self.OutRing:setAlpha( 0 )
				self.clipFinished( OutRing, {} )

				S:completeAnimation()
				self.S:setAlpha( 0 )
				self.clipFinished( S, {} )

				INPiece2:completeAnimation()
				self.INPiece2:setAlpha( 0 )
				self.clipFinished( INPiece2, {} )

				InPiece:completeAnimation()
				self.InPiece:setAlpha( 0 )
				self.clipFinished( InPiece, {} )

				logo:completeAnimation()
				self.logo:setAlpha( 1 )
				self.clipFinished( logo, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 8 )

				BlueR:completeAnimation()
				self.BlueR:setAlpha( 0 )
				self.clipFinished( BlueR, {} )

				BlueL:completeAnimation()
				self.BlueL:setAlpha( 0 )
				self.clipFinished( BlueL, {} )

				InRing:completeAnimation()
				self.InRing:setAlpha( 0 )
				self.clipFinished( InRing, {} )

				OutRing:completeAnimation()
				self.OutRing:setAlpha( 0 )
				self.clipFinished( OutRing, {} )

				S:completeAnimation()
				self.S:setAlpha( 0 )
				self.clipFinished( S, {} )

				INPiece2:completeAnimation()
				self.INPiece2:setAlpha( 0 )
				self.clipFinished( INPiece2, {} )

				InPiece:completeAnimation()
				self.InPiece:setAlpha( 0 )
				self.clipFinished( InPiece, {} )
				local logoFrame2 = function ( logo, event )
					if not event.interrupted then
						logo:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
					end
					logo:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( logo, event )
					else
						logo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				logo:completeAnimation()
				self.logo:setAlpha( 1 )
				logoFrame2( logo, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )

				local f5_local0 = function ( f6_arg0, f6_arg1 )
					local f6_local0 = function ( f7_arg0, f7_arg1 )
						local f7_local0 = function ( f8_arg0, f8_arg1 )
							if not f8_arg1.interrupted then
								f8_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							end
							f8_arg0:setLeftRight( true, false, 31, 63 )
							f8_arg0:setTopBottom( true, false, -6.78, 28.14 )
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
							f7_arg0:beginAnimation( "keyframe", 1859, false, false, CoD.TweenType.Linear )
							f7_arg0:registerEventHandler( "transition_complete_keyframe", f7_local0 )
						end
					end
					
					if f6_arg1.interrupted then
						f6_local0( f6_arg0, f6_arg1 )
						return 
					else
						f6_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f6_arg0:setLeftRight( true, false, 11, 43 )
						f6_arg0:setTopBottom( true, false, 3.29, 38.21 )
						f6_arg0:setAlpha( 1 )
						f6_arg0:registerEventHandler( "transition_complete_keyframe", f6_local0 )
					end
				end
				
				BlueR:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
				BlueR:setLeftRight( true, false, 31, 63 )
				BlueR:setTopBottom( true, false, -6.78, 28.14 )
				BlueR:setAlpha( 0 )
				BlueR:registerEventHandler( "transition_complete_keyframe", f5_local0 )
				local f5_local1 = function ( f9_arg0, f9_arg1 )
					local f9_local0 = function ( f10_arg0, f10_arg1 )
						local f10_local0 = function ( f11_arg0, f11_arg1 )
							if not f11_arg1.interrupted then
								f11_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							end
							f11_arg0:setLeftRight( true, false, -15.5, 16.5 )
							f11_arg0:setTopBottom( true, false, 17.06, 51.52 )
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
							f10_arg0:beginAnimation( "keyframe", 1859, false, false, CoD.TweenType.Linear )
							f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
						end
					end
					
					if f9_arg1.interrupted then
						f9_local0( f9_arg0, f9_arg1 )
						return 
					else
						f9_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						f9_arg0:setLeftRight( true, false, 2.25, 34.25 )
						f9_arg0:setTopBottom( true, false, 7.54, 42 )
						f9_arg0:setAlpha( 1 )
						f9_arg0:registerEventHandler( "transition_complete_keyframe", f9_local0 )
					end
				end
				
				BlueL:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
				BlueL:setLeftRight( true, false, -15.5, 16.5 )
				BlueL:setTopBottom( true, false, 17.06, 51.52 )
				BlueL:setAlpha( 0 )
				BlueL:registerEventHandler( "transition_complete_keyframe", f5_local1 )
				local f5_local2 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f13_arg0, f13_arg1 )
						local f13_local0 = function ( f14_arg0, f14_arg1 )
							local f14_local0 = function ( f15_arg0, f15_arg1 )
								local f15_local0 = function ( f16_arg0, f16_arg1 )
									local f16_local0 = function ( f17_arg0, f17_arg1 )
										local f17_local0 = function ( f18_arg0, f18_arg1 )
											local f18_local0 = function ( f19_arg0, f19_arg1 )
												local f19_local0 = function ( f20_arg0, f20_arg1 )
													if not f20_arg1.interrupted then
														f20_arg0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
													end
													f20_arg0:setLeftRight( true, false, 1, 44 )
													f20_arg0:setTopBottom( true, false, 1.5, 44.5 )
													f20_arg0:setAlpha( 0 )
													f20_arg0:setYRot( -90 )
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
													f19_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
													f19_arg0:setAlpha( 0 )
													f19_arg0:setYRot( -90 )
													f19_arg0:registerEventHandler( "transition_complete_keyframe", f19_local0 )
												end
											end
											
											if f18_arg1.interrupted then
												f18_local0( f18_arg0, f18_arg1 )
												return 
											else
												f18_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
												f18_arg0:setYRot( 0 )
												f18_arg0:registerEventHandler( "transition_complete_keyframe", f18_local0 )
											end
										end
										
										if f17_arg1.interrupted then
											f17_local0( f17_arg0, f17_arg1 )
											return 
										else
											f17_arg0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											f17_arg0:setLeftRight( true, false, 1, 44 )
											f17_arg0:registerEventHandler( "transition_complete_keyframe", f17_local0 )
										end
									end
									
									if f16_arg1.interrupted then
										f16_local0( f16_arg0, f16_arg1 )
										return 
									else
										f16_arg0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
										f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
									end
								end
								
								if f15_arg1.interrupted then
									f15_local0( f15_arg0, f15_arg1 )
									return 
								else
									f15_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
									f15_arg0:setLeftRight( true, false, 1.5, 44.5 )
									f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
								end
							end
							
							if f14_arg1.interrupted then
								f14_local0( f14_arg0, f14_arg1 )
								return 
							else
								f14_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								f14_arg0:setYRot( 180 )
								f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
							end
						end
						
						if f13_arg1.interrupted then
							f13_local0( f13_arg0, f13_arg1 )
							return 
						else
							f13_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							f13_arg0:setAlpha( 1 )
							f13_arg0:setYRot( 0 )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				InRing:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				InRing:setLeftRight( true, false, 1, 44 )
				InRing:setTopBottom( true, false, 1.5, 44.5 )
				InRing:setAlpha( 0 )
				InRing:setYRot( -90 )
				InRing:registerEventHandler( "transition_complete_keyframe", f5_local2 )
				local f5_local3 = function ( f21_arg0, f21_arg1 )
					local f21_local0 = function ( f22_arg0, f22_arg1 )
						local f22_local0 = function ( f23_arg0, f23_arg1 )
							local f23_local0 = function ( f24_arg0, f24_arg1 )
								local f24_local0 = function ( f25_arg0, f25_arg1 )
									local f25_local0 = function ( f26_arg0, f26_arg1 )
										local f26_local0 = function ( f27_arg0, f27_arg1 )
											if not f27_arg1.interrupted then
												f27_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
											end
											f27_arg0:setAlpha( 0 )
											f27_arg0:setYRot( 0 )
											if f27_arg1.interrupted then
												self.clipFinished( f27_arg0, f27_arg1 )
											else
												f27_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f26_arg1.interrupted then
											f26_local0( f26_arg0, f26_arg1 )
											return 
										else
											f26_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
											f26_arg0:setAlpha( 0 )
											f26_arg0:setYRot( 0 )
											f26_arg0:registerEventHandler( "transition_complete_keyframe", f26_local0 )
										end
									end
									
									if f25_arg1.interrupted then
										f25_local0( f25_arg0, f25_arg1 )
										return 
									else
										f25_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
										f25_arg0:setYRot( 90 )
										f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
									end
								end
								
								if f24_arg1.interrupted then
									f24_local0( f24_arg0, f24_arg1 )
									return 
								else
									f24_arg0:beginAnimation( "keyframe", 960, false, false, CoD.TweenType.Linear )
									f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
								end
							end
							
							if f23_arg1.interrupted then
								f23_local0( f23_arg0, f23_arg1 )
								return 
							else
								f23_arg0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
								f23_arg0:setYRot( 0 )
								f23_arg0:registerEventHandler( "transition_complete_keyframe", f23_local0 )
							end
						end
						
						if f22_arg1.interrupted then
							f22_local0( f22_arg0, f22_arg1 )
							return 
						else
							f22_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							f22_arg0:setAlpha( 1 )
							f22_arg0:setYRot( 90 )
							f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
						end
					end
					
					if f21_arg1.interrupted then
						f21_local0( f21_arg0, f21_arg1 )
						return 
					else
						f21_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f21_arg0:registerEventHandler( "transition_complete_keyframe", f21_local0 )
					end
				end
				
				OutRing:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				OutRing:setAlpha( 0 )
				OutRing:setYRot( 0 )
				OutRing:registerEventHandler( "transition_complete_keyframe", f5_local3 )
				local f5_local4 = function ( f28_arg0, f28_arg1 )
					local f28_local0 = function ( f29_arg0, f29_arg1 )
						local f29_local0 = function ( f30_arg0, f30_arg1 )
							if not f30_arg1.interrupted then
								f30_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							f30_arg0:setAlpha( 0 )
							if f30_arg1.interrupted then
								self.clipFinished( f30_arg0, f30_arg1 )
							else
								f30_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f29_arg1.interrupted then
							f29_local0( f29_arg0, f29_arg1 )
							return 
						else
							f29_arg0:beginAnimation( "keyframe", 1959, false, false, CoD.TweenType.Linear )
							f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
						end
					end
					
					if f28_arg1.interrupted then
						f28_local0( f28_arg0, f28_arg1 )
						return 
					else
						f28_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f28_arg0:setAlpha( 1 )
						f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
					end
				end
				
				S:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				S:setAlpha( 0 )
				S:registerEventHandler( "transition_complete_keyframe", f5_local4 )
				local f5_local5 = function ( f31_arg0, f31_arg1 )
					local f31_local0 = function ( f32_arg0, f32_arg1 )
						local f32_local0 = function ( f33_arg0, f33_arg1 )
							if not f33_arg1.interrupted then
								f33_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							f33_arg0:setLeftRight( true, false, 24.38, 37.13 )
							f33_arg0:setTopBottom( true, false, 39.75, 54.54 )
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
							f32_arg0:beginAnimation( "keyframe", 1959, false, false, CoD.TweenType.Linear )
							f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
						end
					end
					
					if f31_arg1.interrupted then
						f31_local0( f31_arg0, f31_arg1 )
						return 
					else
						f31_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f31_arg0:setLeftRight( true, false, 13.51, 26.26 )
						f31_arg0:setTopBottom( true, false, 20.75, 35.54 )
						f31_arg0:setAlpha( 1 )
						f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
					end
				end
				
				INPiece2:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				INPiece2:setLeftRight( true, false, 24.38, 37.13 )
				INPiece2:setTopBottom( true, false, 39.75, 54.54 )
				INPiece2:setAlpha( 0 )
				INPiece2:registerEventHandler( "transition_complete_keyframe", f5_local5 )
				local f5_local6 = function ( f34_arg0, f34_arg1 )
					local f34_local0 = function ( f35_arg0, f35_arg1 )
						local f35_local0 = function ( f36_arg0, f36_arg1 )
							if not f36_arg1.interrupted then
								f36_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							f36_arg0:setLeftRight( true, false, 8.75, 21.77 )
							f36_arg0:setTopBottom( true, false, -8.65, 6.77 )
							f36_arg0:setAlpha( 0 )
							if f36_arg1.interrupted then
								self.clipFinished( f36_arg0, f36_arg1 )
							else
								f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f35_arg1.interrupted then
							f35_local0( f35_arg0, f35_arg1 )
							return 
						else
							f35_arg0:beginAnimation( "keyframe", 1959, false, false, CoD.TweenType.Linear )
							f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
						end
					end
					
					if f34_arg1.interrupted then
						f34_local0( f34_arg0, f34_arg1 )
						return 
					else
						f34_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f34_arg0:setLeftRight( true, false, 19.75, 32.77 )
						f34_arg0:setTopBottom( true, false, 9.85, 25.28 )
						f34_arg0:setAlpha( 1 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
					end
				end
				
				InPiece:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				InPiece:setLeftRight( true, false, 8.75, 21.77 )
				InPiece:setTopBottom( true, false, -8.65, 6.77 )
				InPiece:setAlpha( 0 )
				InPiece:registerEventHandler( "transition_complete_keyframe", f5_local6 )

				logo:completeAnimation()
				self.logo:setAlpha( 0 )
				self.clipFinished( logo, {} )

				self.nextClip = "Focus"
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 8 )

				BlueR:completeAnimation()
				self.BlueR:setAlpha( 0 )
				self.clipFinished( BlueR, {} )

				BlueL:completeAnimation()
				self.BlueL:setAlpha( 0 )
				self.clipFinished( BlueL, {} )

				InRing:completeAnimation()
				self.InRing:setAlpha( 0 )
				self.clipFinished( InRing, {} )

				OutRing:completeAnimation()
				self.OutRing:setAlpha( 0 )
				self.clipFinished( OutRing, {} )

				S:completeAnimation()
				self.S:setAlpha( 0 )
				self.clipFinished( S, {} )

				INPiece2:completeAnimation()
				self.INPiece2:setAlpha( 0 )
				self.clipFinished( INPiece2, {} )

				InPiece:completeAnimation()
				self.InPiece:setAlpha( 0 )
				self.clipFinished( InPiece, {} )
				local logoFrame2 = function ( logo, event )
					if not event.interrupted then
						logo:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
					end
					logo:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( logo, event )
					else
						logo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				logo:completeAnimation()
				self.logo:setAlpha( 0 )
				logoFrame2( logo, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
