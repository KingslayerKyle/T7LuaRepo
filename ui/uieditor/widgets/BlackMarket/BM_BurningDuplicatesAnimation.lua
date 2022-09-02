-- 18f48b7579dfe6559fe8f6fea2c02e7e
-- This hash is used for caching, delete to decompile the file again

CoD.BM_BurningDuplicatesAnimation = InheritFrom( LUI.UIElement )
CoD.BM_BurningDuplicatesAnimation.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_BurningDuplicatesAnimation )
	self.id = "BM_BurningDuplicatesAnimation"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 100 )
	
	local Frame2 = LUI.UIImage.new()
	Frame2:setLeftRight( true, false, 523, 763 )
	Frame2:setTopBottom( true, false, -106, 206 )
	Frame2:setAlpha( 0 )
	Frame2:setYRot( 180 )
	Frame2:setImage( RegisterImage( "uie_t7_burn_frame" ) )
	self:addElement( Frame2 )
	self.Frame2 = Frame2
	
	local FRame = LUI.UIImage.new()
	FRame:setLeftRight( true, false, -250, -10 )
	FRame:setTopBottom( true, false, -106, 206 )
	FRame:setImage( RegisterImage( "uie_t7_burn_frame" ) )
	self:addElement( FRame )
	self.FRame = FRame
	
	local Blur = LUI.UIImage.new()
	Blur:setLeftRight( true, false, 116, 392 )
	Blur:setTopBottom( true, false, -129, 219 )
	Blur:setImage( RegisterImage( "uie_t7_burn_blurframe" ) )
	self:addElement( Blur )
	self.Blur = Blur
	
	local slow = LUI.UIImage.new()
	slow:setLeftRight( true, false, 129, 369 )
	slow:setTopBottom( true, false, -75, 165 )
	slow:setAlpha( 0 )
	slow:setScale( 0.6 )
	slow:setImage( RegisterImage( "uie_t7_icon_cryptokey_slow" ) )
	self:addElement( slow )
	self.slow = slow
	
	local slow0 = LUI.UIImage.new()
	slow0:setLeftRight( true, false, 129, 369 )
	slow0:setTopBottom( true, false, -75, 165 )
	slow0:setAlpha( 0 )
	slow0:setZRot( 90 )
	slow0:setScale( 0.6 )
	slow0:setImage( RegisterImage( "uie_t7_icon_cryptokey_slow" ) )
	self:addElement( slow0 )
	self.slow0 = slow0
	
	local slow1 = LUI.UIImage.new()
	slow1:setLeftRight( true, false, 129, 369 )
	slow1:setTopBottom( true, false, -75, 165 )
	slow1:setAlpha( 0 )
	slow1:setZRot( 180 )
	slow1:setScale( 0.6 )
	slow1:setImage( RegisterImage( "uie_t7_icon_cryptokey_slow" ) )
	self:addElement( slow1 )
	self.slow1 = slow1
	
	local Cryptokey = LUI.UIImage.new()
	Cryptokey:setLeftRight( true, false, 157, 349 )
	Cryptokey:setTopBottom( true, false, -59, 145 )
	Cryptokey:setImage( RegisterImage( "uie_t7_burn_cryptokey" ) )
	self:addElement( Cryptokey )
	self.Cryptokey = Cryptokey
	
	local CryptokeyGold = LUI.UIImage.new()
	CryptokeyGold:setLeftRight( true, false, 157, 349 )
	CryptokeyGold:setTopBottom( true, false, -59, 145 )
	CryptokeyGold:setAlpha( 0 )
	CryptokeyGold:setImage( RegisterImage( "uie_t7_burn_cryptokeygold" ) )
	CryptokeyGold:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	CryptokeyGold:setShaderVector( 0, 0.99, 0, 0, 0 )
	self:addElement( CryptokeyGold )
	self.CryptokeyGold = CryptokeyGold
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				Frame2:completeAnimation()
				self.Frame2:setAlpha( 0 )
				self.clipFinished( Frame2, {} )

				FRame:completeAnimation()
				self.FRame:setAlpha( 0 )
				self.clipFinished( FRame, {} )

				Blur:completeAnimation()
				self.Blur:setAlpha( 0 )
				self.clipFinished( Blur, {} )

				Cryptokey:completeAnimation()
				self.Cryptokey:setAlpha( 0 )
				self.clipFinished( Cryptokey, {} )
			end,
			StartBurning = function ()
				self:setupElementClipCounter( 4 )

				local Frame2Frame2 = function ( Frame2, event )
					local Frame2Frame3 = function ( Frame2, event )
						local Frame2Frame4 = function ( Frame2, event )
							if not event.interrupted then
								Frame2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							Frame2:setLeftRight( true, false, 130, 370 )
							Frame2:setTopBottom( true, false, -106, 206 )
							Frame2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Frame2, event )
							else
								Frame2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Frame2Frame4( Frame2, event )
							return 
						else
							Frame2:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							Frame2:setLeftRight( true, false, 130, 370 )
							Frame2:setAlpha( 0.33 )
							Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame4 )
						end
					end
					
					if event.interrupted then
						Frame2Frame3( Frame2, event )
						return 
					else
						Frame2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Frame2:setLeftRight( true, false, 335.29, 575.29 )
						Frame2:setAlpha( 0.01 )
						Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame3 )
					end
				end
				
				Frame2:completeAnimation()
				self.Frame2:setLeftRight( true, false, 351, 591 )
				self.Frame2:setTopBottom( true, false, -106, 206 )
				self.Frame2:setAlpha( 0 )
				Frame2Frame2( Frame2, {} )
				local FRameFrame2 = function ( FRame, event )
					local FRameFrame3 = function ( FRame, event )
						local FRameFrame4 = function ( FRame, event )
							if not event.interrupted then
								FRame:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							FRame:setLeftRight( true, false, 135, 375 )
							FRame:setTopBottom( true, false, -106, 206 )
							FRame:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FRame, event )
							else
								FRame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FRameFrame4( FRame, event )
							return 
						else
							FRame:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							FRame:setLeftRight( true, false, 135, 375 )
							FRame:setAlpha( 0.33 )
							FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame4 )
						end
					end
					
					if event.interrupted then
						FRameFrame3( FRame, event )
						return 
					else
						FRame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FRame:setLeftRight( true, false, -79.26, 160.74 )
						FRame:setAlpha( 0.01 )
						FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame3 )
					end
				end
				
				FRame:completeAnimation()
				self.FRame:setLeftRight( true, false, -95, 145 )
				self.FRame:setTopBottom( true, false, -106, 206 )
				self.FRame:setAlpha( 0 )
				FRameFrame2( FRame, {} )
				local f3_local2 = function ( f10_arg0, f10_arg1 )
					local f10_local0 = function ( f11_arg0, f11_arg1 )
						if not f11_arg1.interrupted then
							f11_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						f11_arg0:setAlpha( 0 )
						f11_arg0:setScale( 1.3 )
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
						f10_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						f10_arg0:setAlpha( 1 )
						f10_arg0:setScale( 1.14 )
						f10_arg0:registerEventHandler( "transition_complete_keyframe", f10_local0 )
					end
				end
				
				Blur:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				Blur:setAlpha( 0 )
				Blur:setScale( 1 )
				Blur:registerEventHandler( "transition_complete_keyframe", f3_local2 )
				local f3_local3 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f13_arg0, f13_arg1 )
						local f13_local0 = function ( f14_arg0, f14_arg1 )
							if not f14_arg1.interrupted then
								f14_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							f14_arg0:setAlpha( 0 )
							f14_arg0:setScale( 0.9 )
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
							f13_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							f13_arg0:setScale( 0.94 )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						f12_arg0:setAlpha( 1 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				Cryptokey:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				Cryptokey:setAlpha( 0 )
				Cryptokey:setScale( 1 )
				Cryptokey:registerEventHandler( "transition_complete_keyframe", f3_local3 )
			end,
			Burning = function ()
				self:setupElementClipCounter( 4 )

				local Frame2Frame2 = function ( Frame2, event )
					local Frame2Frame3 = function ( Frame2, event )
						local Frame2Frame4 = function ( Frame2, event )
							if not event.interrupted then
								Frame2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							Frame2:setLeftRight( true, false, 130, 370 )
							Frame2:setTopBottom( true, false, -106, 206 )
							Frame2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Frame2, event )
							else
								Frame2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Frame2Frame4( Frame2, event )
							return 
						else
							Frame2:beginAnimation( "keyframe", 800, true, false, CoD.TweenType.Linear )
							Frame2:setLeftRight( true, false, 130, 370 )
							Frame2:setAlpha( 0.33 )
							Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame4 )
						end
					end
					
					if event.interrupted then
						Frame2Frame3( Frame2, event )
						return 
					else
						Frame2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Frame2:setLeftRight( true, false, 335.29, 575.29 )
						Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame3 )
					end
				end
				
				Frame2:completeAnimation()
				self.Frame2:setLeftRight( true, false, 351, 591 )
				self.Frame2:setTopBottom( true, false, -106, 206 )
				self.Frame2:setAlpha( 0 )
				Frame2Frame2( Frame2, {} )
				local FRameFrame2 = function ( FRame, event )
					local FRameFrame3 = function ( FRame, event )
						local FRameFrame4 = function ( FRame, event )
							if not event.interrupted then
								FRame:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							FRame:setLeftRight( true, false, 135, 375 )
							FRame:setTopBottom( true, false, -106, 206 )
							FRame:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FRame, event )
							else
								FRame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FRameFrame4( FRame, event )
							return 
						else
							FRame:beginAnimation( "keyframe", 800, true, false, CoD.TweenType.Linear )
							FRame:setLeftRight( true, false, 135, 375 )
							FRame:setAlpha( 0.33 )
							FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame4 )
						end
					end
					
					if event.interrupted then
						FRameFrame3( FRame, event )
						return 
					else
						FRame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FRame:setLeftRight( true, false, -79.26, 160.74 )
						FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame3 )
					end
				end
				
				FRame:completeAnimation()
				self.FRame:setLeftRight( true, false, -95, 145 )
				self.FRame:setTopBottom( true, false, -106, 206 )
				self.FRame:setAlpha( 0 )
				FRameFrame2( FRame, {} )
				local f15_local2 = function ( f22_arg0, f22_arg1 )
					local f22_local0 = function ( f23_arg0, f23_arg1 )
						if not f23_arg1.interrupted then
							f23_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						f23_arg0:setAlpha( 0 )
						f23_arg0:setScale( 1.3 )
						if f23_arg1.interrupted then
							self.clipFinished( f23_arg0, f23_arg1 )
						else
							f23_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f22_arg1.interrupted then
						f22_local0( f22_arg0, f22_arg1 )
						return 
					else
						f22_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						f22_arg0:setAlpha( 1 )
						f22_arg0:setScale( 1.14 )
						f22_arg0:registerEventHandler( "transition_complete_keyframe", f22_local0 )
					end
				end
				
				Blur:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				Blur:setAlpha( 0 )
				Blur:setScale( 1 )
				Blur:registerEventHandler( "transition_complete_keyframe", f15_local2 )
				local f15_local3 = function ( f24_arg0, f24_arg1 )
					local f24_local0 = function ( f25_arg0, f25_arg1 )
						local f25_local0 = function ( f26_arg0, f26_arg1 )
							if not f26_arg1.interrupted then
								f26_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							f26_arg0:setAlpha( 0 )
							f26_arg0:setScale( 0.9 )
							if f26_arg1.interrupted then
								self.clipFinished( f26_arg0, f26_arg1 )
							else
								f26_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f25_arg1.interrupted then
							f25_local0( f25_arg0, f25_arg1 )
							return 
						else
							f25_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							f25_arg0:setScale( 0.94 )
							f25_arg0:registerEventHandler( "transition_complete_keyframe", f25_local0 )
						end
					end
					
					if f24_arg1.interrupted then
						f24_local0( f24_arg0, f24_arg1 )
						return 
					else
						f24_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						f24_arg0:setAlpha( 1 )
						f24_arg0:registerEventHandler( "transition_complete_keyframe", f24_local0 )
					end
				end
				
				Cryptokey:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				Cryptokey:setAlpha( 0 )
				Cryptokey:setScale( 1 )
				Cryptokey:registerEventHandler( "transition_complete_keyframe", f15_local3 )

				self.nextClip = "Burning"
			end,
			StopBurning = function ()
				self:setupElementClipCounter( 8 )

				local Frame2Frame2 = function ( Frame2, event )
					local Frame2Frame3 = function ( Frame2, event )
						local Frame2Frame4 = function ( Frame2, event )
							if not event.interrupted then
								Frame2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							Frame2:setLeftRight( true, false, 130, 370 )
							Frame2:setTopBottom( true, false, -106, 206 )
							Frame2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Frame2, event )
							else
								Frame2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							Frame2Frame4( Frame2, event )
							return 
						else
							Frame2:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							Frame2:setLeftRight( true, false, 130, 370 )
							Frame2:setAlpha( 0.33 )
							Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame4 )
						end
					end
					
					if event.interrupted then
						Frame2Frame3( Frame2, event )
						return 
					else
						Frame2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Frame2:setLeftRight( true, false, 335.29, 575.29 )
						Frame2:setAlpha( 0.01 )
						Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame3 )
					end
				end
				
				Frame2:completeAnimation()
				self.Frame2:setLeftRight( true, false, 351, 591 )
				self.Frame2:setTopBottom( true, false, -106, 206 )
				self.Frame2:setAlpha( 0 )
				Frame2Frame2( Frame2, {} )
				local FRameFrame2 = function ( FRame, event )
					local FRameFrame3 = function ( FRame, event )
						local FRameFrame4 = function ( FRame, event )
							if not event.interrupted then
								FRame:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							FRame:setLeftRight( true, false, 135, 375 )
							FRame:setTopBottom( true, false, -106, 206 )
							FRame:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FRame, event )
							else
								FRame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FRameFrame4( FRame, event )
							return 
						else
							FRame:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
							FRame:setLeftRight( true, false, 135, 375 )
							FRame:setAlpha( 0.33 )
							FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame4 )
						end
					end
					
					if event.interrupted then
						FRameFrame3( FRame, event )
						return 
					else
						FRame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FRame:setLeftRight( true, false, -79.26, 160.74 )
						FRame:setAlpha( 0.01 )
						FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame3 )
					end
				end
				
				FRame:completeAnimation()
				self.FRame:setLeftRight( true, false, -95, 145 )
				self.FRame:setTopBottom( true, false, -106, 206 )
				self.FRame:setAlpha( 0 )
				FRameFrame2( FRame, {} )
				local f27_local2 = function ( f34_arg0, f34_arg1 )
					local f34_local0 = function ( f35_arg0, f35_arg1 )
						if not f35_arg1.interrupted then
							f35_arg0:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						f35_arg0:setAlpha( 0 )
						f35_arg0:setScale( 1.3 )
						if f35_arg1.interrupted then
							self.clipFinished( f35_arg0, f35_arg1 )
						else
							f35_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f34_arg1.interrupted then
						f34_local0( f34_arg0, f34_arg1 )
						return 
					else
						f34_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						f34_arg0:setAlpha( 1 )
						f34_arg0:setScale( 1.14 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
					end
				end
				
				Blur:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				Blur:setAlpha( 0 )
				Blur:setScale( 1 )
				Blur:registerEventHandler( "transition_complete_keyframe", f27_local2 )
				local f27_local3 = function ( f36_arg0, f36_arg1 )
					local f36_local0 = function ( f37_arg0, f37_arg1 )
						local f37_local0 = function ( f38_arg0, f38_arg1 )
							local f38_local0 = function ( f39_arg0, f39_arg1 )
								if not f39_arg1.interrupted then
									f39_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								f39_arg0:setAlpha( 0 )
								f39_arg0:setScale( 1 )
								if f39_arg1.interrupted then
									self.clipFinished( f39_arg0, f39_arg1 )
								else
									f39_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f38_arg1.interrupted then
								f38_local0( f38_arg0, f38_arg1 )
								return 
							else
								f38_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								f38_arg0:setAlpha( 0 )
								f38_arg0:setScale( 0.94 )
								f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
							end
						end
						
						if f37_arg1.interrupted then
							f37_local0( f37_arg0, f37_arg1 )
							return 
						else
							f37_arg0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							f37_arg0:setAlpha( 1 )
							f37_arg0:setScale( 0.76 )
							f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
						end
					end
					
					if f36_arg1.interrupted then
						f36_local0( f36_arg0, f36_arg1 )
						return 
					else
						f36_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f36_arg0:setScale( 0.66 )
						f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
					end
				end
				
				slow:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
				slow:setAlpha( 0 )
				slow:setScale( 0.6 )
				slow:registerEventHandler( "transition_complete_keyframe", f27_local3 )
				local f27_local4 = function ( f40_arg0, f40_arg1 )
					local f40_local0 = function ( f41_arg0, f41_arg1 )
						local f41_local0 = function ( f42_arg0, f42_arg1 )
							local f42_local0 = function ( f43_arg0, f43_arg1 )
								if not f43_arg1.interrupted then
									f43_arg0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								f43_arg0:setAlpha( 0 )
								f43_arg0:setScale( 1 )
								if f43_arg1.interrupted then
									self.clipFinished( f43_arg0, f43_arg1 )
								else
									f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f42_arg1.interrupted then
								f42_local0( f42_arg0, f42_arg1 )
								return 
							else
								f42_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								f42_arg0:setAlpha( 0 )
								f42_arg0:setScale( 0.94 )
								f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
							end
						end
						
						if f41_arg1.interrupted then
							f41_local0( f41_arg0, f41_arg1 )
							return 
						else
							f41_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							f41_arg0:setAlpha( 1 )
							f41_arg0:setScale( 0.76 )
							f41_arg0:registerEventHandler( "transition_complete_keyframe", f41_local0 )
						end
					end
					
					if f40_arg1.interrupted then
						f40_local0( f40_arg0, f40_arg1 )
						return 
					else
						f40_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						f40_arg0:setScale( 0.66 )
						f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
					end
				end
				
				slow0:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
				slow0:setAlpha( 0 )
				slow0:setScale( 0.6 )
				slow0:registerEventHandler( "transition_complete_keyframe", f27_local4 )
				local f27_local5 = function ( f44_arg0, f44_arg1 )
					local f44_local0 = function ( f45_arg0, f45_arg1 )
						local f45_local0 = function ( f46_arg0, f46_arg1 )
							if not f46_arg1.interrupted then
								f46_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							f46_arg0:setAlpha( 0 )
							f46_arg0:setScale( 1 )
							if f46_arg1.interrupted then
								self.clipFinished( f46_arg0, f46_arg1 )
							else
								f46_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f45_arg1.interrupted then
							f45_local0( f45_arg0, f45_arg1 )
							return 
						else
							f45_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							f45_arg0:setAlpha( 0.25 )
							f45_arg0:setScale( 1 )
							f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
						end
					end
					
					if f44_arg1.interrupted then
						f44_local0( f44_arg0, f44_arg1 )
						return 
					else
						f44_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						f44_arg0:setAlpha( 1 )
						f44_arg0:setScale( 0.79 )
						f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
					end
				end
				
				slow1:beginAnimation( "keyframe", 1139, false, false, CoD.TweenType.Linear )
				slow1:setAlpha( 0 )
				slow1:setScale( 0.6 )
				slow1:registerEventHandler( "transition_complete_keyframe", f27_local5 )
				local f27_local6 = function ( f47_arg0, f47_arg1 )
					local f47_local0 = function ( f48_arg0, f48_arg1 )
						local f48_local0 = function ( f49_arg0, f49_arg1 )
							if not f49_arg1.interrupted then
								f49_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							f49_arg0:setAlpha( 0 )
							f49_arg0:setScale( 0.9 )
							if f49_arg1.interrupted then
								self.clipFinished( f49_arg0, f49_arg1 )
							else
								f49_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f48_arg1.interrupted then
							f48_local0( f48_arg0, f48_arg1 )
							return 
						else
							f48_arg0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							f48_arg0:setScale( 0.92 )
							f48_arg0:registerEventHandler( "transition_complete_keyframe", f48_local0 )
						end
					end
					
					if f47_arg1.interrupted then
						f47_local0( f47_arg0, f47_arg1 )
						return 
					else
						f47_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						f47_arg0:setAlpha( 1 )
						f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
					end
				end
				
				Cryptokey:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				Cryptokey:setAlpha( 0 )
				Cryptokey:setScale( 1 )
				Cryptokey:registerEventHandler( "transition_complete_keyframe", f27_local6 )
				local f27_local7 = function ( f50_arg0, f50_arg1 )
					local f50_local0 = function ( f51_arg0, f51_arg1 )
						local f51_local0 = function ( f52_arg0, f52_arg1 )
							local f52_local0 = function ( f53_arg0, f53_arg1 )
								if not f53_arg1.interrupted then
									f53_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								end
								f53_arg0:setAlpha( 1 )
								f53_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
								f53_arg0:setShaderVector( 0, 0.99, 0, 0, 0 )
								if f53_arg1.interrupted then
									self.clipFinished( f53_arg0, f53_arg1 )
								else
									f53_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f52_arg1.interrupted then
								f52_local0( f52_arg0, f52_arg1 )
								return 
							else
								f52_arg0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
								f52_arg0:setShaderVector( 0, 0.99, 0, 0, 0 )
								f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
							end
						end
						
						if f51_arg1.interrupted then
							f51_local0( f51_arg0, f51_arg1 )
							return 
						else
							f51_arg0:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
							f51_arg0:setAlpha( 1 )
							f51_arg0:setShaderVector( 0, 0.55, 0, 0, 0 )
							f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
						end
					end
					
					if f50_arg1.interrupted then
						f50_local0( f50_arg0, f50_arg1 )
						return 
					else
						f50_arg0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						f50_arg0:setAlpha( 0.42 )
						f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
					end
				end
				
				CryptokeyGold:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				CryptokeyGold:setAlpha( 0 )
				CryptokeyGold:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				CryptokeyGold:setShaderVector( 0, 0.01, 0, 0, 0 )
				CryptokeyGold:registerEventHandler( "transition_complete_keyframe", f27_local7 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

