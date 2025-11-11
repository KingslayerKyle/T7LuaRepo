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
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 150 )
	
	local Frame2 = LUI.UIImage.new()
	Frame2:setLeftRight( 0, 0, 784, 1144 )
	Frame2:setTopBottom( 0, 0, -159, 309 )
	Frame2:setAlpha( 0 )
	Frame2:setYRot( 180 )
	Frame2:setImage( RegisterImage( "uie_t7_burn_frame" ) )
	self:addElement( Frame2 )
	self.Frame2 = Frame2
	
	local FRame = LUI.UIImage.new()
	FRame:setLeftRight( 0, 0, -375, -15 )
	FRame:setTopBottom( 0, 0, -159, 309 )
	FRame:setImage( RegisterImage( "uie_t7_burn_frame" ) )
	self:addElement( FRame )
	self.FRame = FRame
	
	local Blur = LUI.UIImage.new()
	Blur:setLeftRight( 0, 0, 174, 588 )
	Blur:setTopBottom( 0, 0, -193, 329 )
	Blur:setImage( RegisterImage( "uie_t7_burn_blurframe" ) )
	self:addElement( Blur )
	self.Blur = Blur
	
	local slow = LUI.UIImage.new()
	slow:setLeftRight( 0, 0, 194, 554 )
	slow:setTopBottom( 0, 0, -112, 248 )
	slow:setAlpha( 0 )
	slow:setScale( 0.6 )
	slow:setImage( RegisterImage( "uie_t7_icon_cryptokey_slow" ) )
	self:addElement( slow )
	self.slow = slow
	
	local slow0 = LUI.UIImage.new()
	slow0:setLeftRight( 0, 0, 194, 554 )
	slow0:setTopBottom( 0, 0, -112, 248 )
	slow0:setAlpha( 0 )
	slow0:setZRot( 90 )
	slow0:setScale( 0.6 )
	slow0:setImage( RegisterImage( "uie_t7_icon_cryptokey_slow" ) )
	self:addElement( slow0 )
	self.slow0 = slow0
	
	local slow1 = LUI.UIImage.new()
	slow1:setLeftRight( 0, 0, 194, 554 )
	slow1:setTopBottom( 0, 0, -112, 248 )
	slow1:setAlpha( 0 )
	slow1:setZRot( 180 )
	slow1:setScale( 0.6 )
	slow1:setImage( RegisterImage( "uie_t7_icon_cryptokey_slow" ) )
	self:addElement( slow1 )
	self.slow1 = slow1
	
	local Cryptokey = LUI.UIImage.new()
	Cryptokey:setLeftRight( 0, 0, 236, 524 )
	Cryptokey:setTopBottom( 0, 0, -89, 217 )
	Cryptokey:setImage( RegisterImage( "uie_t7_burn_cryptokey" ) )
	self:addElement( Cryptokey )
	self.Cryptokey = Cryptokey
	
	local CryptokeyGold = LUI.UIImage.new()
	CryptokeyGold:setLeftRight( 0, 0, 236, 524 )
	CryptokeyGold:setTopBottom( 0, 0, -89, 217 )
	CryptokeyGold:setAlpha( 0 )
	CryptokeyGold:setImage( RegisterImage( "uie_t7_burn_cryptokeygold" ) )
	CryptokeyGold:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
	CryptokeyGold:setShaderVector( 0, 0.99, 0, 0, 0 )
	self:addElement( CryptokeyGold )
	self.CryptokeyGold = CryptokeyGold
	
	self.resetProperties = function ()
		Blur:completeAnimation()
		FRame:completeAnimation()
		Cryptokey:completeAnimation()
		Frame2:completeAnimation()
		CryptokeyGold:completeAnimation()
		slow:completeAnimation()
		slow0:completeAnimation()
		slow1:completeAnimation()
		Blur:setAlpha( 1 )
		Blur:setScale( 1 )
		FRame:setLeftRight( 0, 0, -375, -15 )
		FRame:setTopBottom( 0, 0, -159, 309 )
		FRame:setAlpha( 1 )
		Cryptokey:setAlpha( 1 )
		Cryptokey:setScale( 1 )
		Frame2:setLeftRight( 0, 0, 784, 1144 )
		Frame2:setTopBottom( 0, 0, -159, 309 )
		Frame2:setAlpha( 0 )
		CryptokeyGold:setAlpha( 0 )
		CryptokeyGold:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
		CryptokeyGold:setShaderVector( 0, 0.99, 0, 0, 0 )
		slow:setAlpha( 0 )
		slow:setScale( 0.6 )
		slow0:setAlpha( 0 )
		slow0:setScale( 0.6 )
		slow1:setAlpha( 0 )
		slow1:setScale( 0.6 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local Frame2Frame2 = function ( Frame2, event )
					local Frame2Frame3 = function ( Frame2, event )
						local Frame2Frame4 = function ( Frame2, event )
							if not event.interrupted then
								Frame2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							Frame2:setLeftRight( 0, 0, 195, 555 )
							Frame2:setTopBottom( 0, 0, -159, 309 )
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
							Frame2:setLeftRight( 0, 0, 195, 555 )
							Frame2:setAlpha( 0.33 )
							Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame4 )
						end
					end
					
					if event.interrupted then
						Frame2Frame3( Frame2, event )
						return 
					else
						Frame2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Frame2:setLeftRight( 0, 0, 503, 863 )
						Frame2:setAlpha( 0.01 )
						Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame3 )
					end
				end
				
				Frame2:completeAnimation()
				self.Frame2:setLeftRight( 0, 0, 526, 886 )
				self.Frame2:setTopBottom( 0, 0, -159, 309 )
				self.Frame2:setAlpha( 0 )
				Frame2Frame2( Frame2, {} )
				local FRameFrame2 = function ( FRame, event )
					local FRameFrame3 = function ( FRame, event )
						local FRameFrame4 = function ( FRame, event )
							if not event.interrupted then
								FRame:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							FRame:setLeftRight( 0, 0, 202, 562 )
							FRame:setTopBottom( 0, 0, -159, 309 )
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
							FRame:setLeftRight( 0, 0, 202, 562 )
							FRame:setAlpha( 0.33 )
							FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame4 )
						end
					end
					
					if event.interrupted then
						FRameFrame3( FRame, event )
						return 
					else
						FRame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FRame:setLeftRight( 0, 0, -119, 241 )
						FRame:setAlpha( 0.01 )
						FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame3 )
					end
				end
				
				FRame:completeAnimation()
				self.FRame:setLeftRight( 0, 0, -142, 218 )
				self.FRame:setTopBottom( 0, 0, -159, 309 )
				self.FRame:setAlpha( 0 )
				FRameFrame2( FRame, {} )
				local BlurFrame2 = function ( Blur, event )
					local BlurFrame3 = function ( Blur, event )
						if not event.interrupted then
							Blur:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						Blur:setAlpha( 0 )
						Blur:setScale( 1.3 )
						if event.interrupted then
							self.clipFinished( Blur, event )
						else
							Blur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlurFrame3( Blur, event )
						return 
					else
						Blur:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Blur:setAlpha( 1 )
						Blur:setScale( 1.14 )
						Blur:registerEventHandler( "transition_complete_keyframe", BlurFrame3 )
					end
				end
				
				Blur:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				Blur:setAlpha( 0 )
				Blur:setScale( 1 )
				Blur:registerEventHandler( "transition_complete_keyframe", BlurFrame2 )
				local CryptokeyFrame2 = function ( Cryptokey, event )
					local CryptokeyFrame3 = function ( Cryptokey, event )
						local CryptokeyFrame4 = function ( Cryptokey, event )
							if not event.interrupted then
								Cryptokey:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							Cryptokey:setAlpha( 0 )
							Cryptokey:setScale( 0.9 )
							if event.interrupted then
								self.clipFinished( Cryptokey, event )
							else
								Cryptokey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CryptokeyFrame4( Cryptokey, event )
							return 
						else
							Cryptokey:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							Cryptokey:setScale( 0.94 )
							Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame4 )
						end
					end
					
					if event.interrupted then
						CryptokeyFrame3( Cryptokey, event )
						return 
					else
						Cryptokey:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						Cryptokey:setAlpha( 1 )
						Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame3 )
					end
				end
				
				Cryptokey:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				Cryptokey:setAlpha( 0 )
				Cryptokey:setScale( 1 )
				Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame2 )
			end,
			Burning = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local Frame2Frame2 = function ( Frame2, event )
					local Frame2Frame3 = function ( Frame2, event )
						local Frame2Frame4 = function ( Frame2, event )
							if not event.interrupted then
								Frame2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							Frame2:setLeftRight( 0, 0, 195, 555 )
							Frame2:setTopBottom( 0, 0, -159, 309 )
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
							Frame2:setLeftRight( 0, 0, 195, 555 )
							Frame2:setAlpha( 0.33 )
							Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame4 )
						end
					end
					
					if event.interrupted then
						Frame2Frame3( Frame2, event )
						return 
					else
						Frame2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Frame2:setLeftRight( 0, 0, 503, 863 )
						Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame3 )
					end
				end
				
				Frame2:completeAnimation()
				self.Frame2:setLeftRight( 0, 0, 526, 886 )
				self.Frame2:setTopBottom( 0, 0, -159, 309 )
				self.Frame2:setAlpha( 0 )
				Frame2Frame2( Frame2, {} )
				local FRameFrame2 = function ( FRame, event )
					local FRameFrame3 = function ( FRame, event )
						local FRameFrame4 = function ( FRame, event )
							if not event.interrupted then
								FRame:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							FRame:setLeftRight( 0, 0, 202, 562 )
							FRame:setTopBottom( 0, 0, -159, 309 )
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
							FRame:setLeftRight( 0, 0, 202, 562 )
							FRame:setAlpha( 0.33 )
							FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame4 )
						end
					end
					
					if event.interrupted then
						FRameFrame3( FRame, event )
						return 
					else
						FRame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FRame:setLeftRight( 0, 0, -119, 241 )
						FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame3 )
					end
				end
				
				FRame:completeAnimation()
				self.FRame:setLeftRight( 0, 0, -142, 218 )
				self.FRame:setTopBottom( 0, 0, -159, 309 )
				self.FRame:setAlpha( 0 )
				FRameFrame2( FRame, {} )
				local BlurFrame2 = function ( Blur, event )
					local BlurFrame3 = function ( Blur, event )
						if not event.interrupted then
							Blur:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						Blur:setAlpha( 0 )
						Blur:setScale( 1.3 )
						if event.interrupted then
							self.clipFinished( Blur, event )
						else
							Blur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlurFrame3( Blur, event )
						return 
					else
						Blur:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Blur:setAlpha( 1 )
						Blur:setScale( 1.14 )
						Blur:registerEventHandler( "transition_complete_keyframe", BlurFrame3 )
					end
				end
				
				Blur:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				Blur:setAlpha( 0 )
				Blur:setScale( 1 )
				Blur:registerEventHandler( "transition_complete_keyframe", BlurFrame2 )
				local CryptokeyFrame2 = function ( Cryptokey, event )
					local CryptokeyFrame3 = function ( Cryptokey, event )
						local CryptokeyFrame4 = function ( Cryptokey, event )
							if not event.interrupted then
								Cryptokey:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							Cryptokey:setAlpha( 0 )
							Cryptokey:setScale( 0.9 )
							if event.interrupted then
								self.clipFinished( Cryptokey, event )
							else
								Cryptokey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CryptokeyFrame4( Cryptokey, event )
							return 
						else
							Cryptokey:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
							Cryptokey:setScale( 0.94 )
							Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame4 )
						end
					end
					
					if event.interrupted then
						CryptokeyFrame3( Cryptokey, event )
						return 
					else
						Cryptokey:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						Cryptokey:setAlpha( 1 )
						Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame3 )
					end
				end
				
				Cryptokey:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				Cryptokey:setAlpha( 0 )
				Cryptokey:setScale( 1 )
				Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame2 )
				self.nextClip = "Burning"
			end,
			StopBurning = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local Frame2Frame2 = function ( Frame2, event )
					local Frame2Frame3 = function ( Frame2, event )
						local Frame2Frame4 = function ( Frame2, event )
							if not event.interrupted then
								Frame2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							Frame2:setLeftRight( 0, 0, 195, 555 )
							Frame2:setTopBottom( 0, 0, -159, 309 )
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
							Frame2:setLeftRight( 0, 0, 195, 555 )
							Frame2:setAlpha( 0.33 )
							Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame4 )
						end
					end
					
					if event.interrupted then
						Frame2Frame3( Frame2, event )
						return 
					else
						Frame2:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						Frame2:setLeftRight( 0, 0, 503, 863 )
						Frame2:setAlpha( 0.01 )
						Frame2:registerEventHandler( "transition_complete_keyframe", Frame2Frame3 )
					end
				end
				
				Frame2:completeAnimation()
				self.Frame2:setLeftRight( 0, 0, 526, 886 )
				self.Frame2:setTopBottom( 0, 0, -159, 309 )
				self.Frame2:setAlpha( 0 )
				Frame2Frame2( Frame2, {} )
				local FRameFrame2 = function ( FRame, event )
					local FRameFrame3 = function ( FRame, event )
						local FRameFrame4 = function ( FRame, event )
							if not event.interrupted then
								FRame:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							end
							FRame:setLeftRight( 0, 0, 202, 562 )
							FRame:setTopBottom( 0, 0, -159, 309 )
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
							FRame:setLeftRight( 0, 0, 202, 562 )
							FRame:setAlpha( 0.33 )
							FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame4 )
						end
					end
					
					if event.interrupted then
						FRameFrame3( FRame, event )
						return 
					else
						FRame:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						FRame:setLeftRight( 0, 0, -119, 241 )
						FRame:setAlpha( 0.01 )
						FRame:registerEventHandler( "transition_complete_keyframe", FRameFrame3 )
					end
				end
				
				FRame:completeAnimation()
				self.FRame:setLeftRight( 0, 0, -142, 218 )
				self.FRame:setTopBottom( 0, 0, -159, 309 )
				self.FRame:setAlpha( 0 )
				FRameFrame2( FRame, {} )
				local BlurFrame2 = function ( Blur, event )
					local BlurFrame3 = function ( Blur, event )
						if not event.interrupted then
							Blur:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
						end
						Blur:setAlpha( 0 )
						Blur:setScale( 1.3 )
						if event.interrupted then
							self.clipFinished( Blur, event )
						else
							Blur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlurFrame3( Blur, event )
						return 
					else
						Blur:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Blur:setAlpha( 1 )
						Blur:setScale( 1.14 )
						Blur:registerEventHandler( "transition_complete_keyframe", BlurFrame3 )
					end
				end
				
				Blur:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Linear )
				Blur:setAlpha( 0 )
				Blur:setScale( 1 )
				Blur:registerEventHandler( "transition_complete_keyframe", BlurFrame2 )
				local slowFrame2 = function ( slow, event )
					local slowFrame3 = function ( slow, event )
						local slowFrame4 = function ( slow, event )
							local slowFrame5 = function ( slow, event )
								if not event.interrupted then
									slow:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								slow:setAlpha( 0 )
								slow:setScale( 1 )
								if event.interrupted then
									self.clipFinished( slow, event )
								else
									slow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								slowFrame5( slow, event )
								return 
							else
								slow:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
								slow:setAlpha( 0 )
								slow:setScale( 0.94 )
								slow:registerEventHandler( "transition_complete_keyframe", slowFrame5 )
							end
						end
						
						if event.interrupted then
							slowFrame4( slow, event )
							return 
						else
							slow:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							slow:setAlpha( 1 )
							slow:setScale( 0.76 )
							slow:registerEventHandler( "transition_complete_keyframe", slowFrame4 )
						end
					end
					
					if event.interrupted then
						slowFrame3( slow, event )
						return 
					else
						slow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						slow:setScale( 0.66 )
						slow:registerEventHandler( "transition_complete_keyframe", slowFrame3 )
					end
				end
				
				slow:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
				slow:setAlpha( 0 )
				slow:setScale( 0.6 )
				slow:registerEventHandler( "transition_complete_keyframe", slowFrame2 )
				local slow0Frame2 = function ( slow0, event )
					local slow0Frame3 = function ( slow0, event )
						local slow0Frame4 = function ( slow0, event )
							local slow0Frame5 = function ( slow0, event )
								if not event.interrupted then
									slow0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								slow0:setAlpha( 0 )
								slow0:setScale( 1 )
								if event.interrupted then
									self.clipFinished( slow0, event )
								else
									slow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								slow0Frame5( slow0, event )
								return 
							else
								slow0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								slow0:setAlpha( 0 )
								slow0:setScale( 0.94 )
								slow0:registerEventHandler( "transition_complete_keyframe", slow0Frame5 )
							end
						end
						
						if event.interrupted then
							slow0Frame4( slow0, event )
							return 
						else
							slow0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
							slow0:setAlpha( 1 )
							slow0:setScale( 0.76 )
							slow0:registerEventHandler( "transition_complete_keyframe", slow0Frame4 )
						end
					end
					
					if event.interrupted then
						slow0Frame3( slow0, event )
						return 
					else
						slow0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						slow0:setScale( 0.66 )
						slow0:registerEventHandler( "transition_complete_keyframe", slow0Frame3 )
					end
				end
				
				slow0:beginAnimation( "keyframe", 1039, false, false, CoD.TweenType.Linear )
				slow0:setAlpha( 0 )
				slow0:setScale( 0.6 )
				slow0:registerEventHandler( "transition_complete_keyframe", slow0Frame2 )
				local slow1Frame2 = function ( slow1, event )
					local slow1Frame3 = function ( slow1, event )
						local slow1Frame4 = function ( slow1, event )
							if not event.interrupted then
								slow1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							slow1:setAlpha( 0 )
							slow1:setScale( 1 )
							if event.interrupted then
								self.clipFinished( slow1, event )
							else
								slow1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							slow1Frame4( slow1, event )
							return 
						else
							slow1:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							slow1:setAlpha( 0.25 )
							slow1:setScale( 1 )
							slow1:registerEventHandler( "transition_complete_keyframe", slow1Frame4 )
						end
					end
					
					if event.interrupted then
						slow1Frame3( slow1, event )
						return 
					else
						slow1:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
						slow1:setAlpha( 1 )
						slow1:setScale( 0.79 )
						slow1:registerEventHandler( "transition_complete_keyframe", slow1Frame3 )
					end
				end
				
				slow1:beginAnimation( "keyframe", 1139, false, false, CoD.TweenType.Linear )
				slow1:setAlpha( 0 )
				slow1:setScale( 0.6 )
				slow1:registerEventHandler( "transition_complete_keyframe", slow1Frame2 )
				local CryptokeyFrame2 = function ( Cryptokey, event )
					local CryptokeyFrame3 = function ( Cryptokey, event )
						local CryptokeyFrame4 = function ( Cryptokey, event )
							if not event.interrupted then
								Cryptokey:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							Cryptokey:setAlpha( 0 )
							Cryptokey:setScale( 0.9 )
							if event.interrupted then
								self.clipFinished( Cryptokey, event )
							else
								Cryptokey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CryptokeyFrame4( Cryptokey, event )
							return 
						else
							Cryptokey:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
							Cryptokey:setScale( 0.92 )
							Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame4 )
						end
					end
					
					if event.interrupted then
						CryptokeyFrame3( Cryptokey, event )
						return 
					else
						Cryptokey:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						Cryptokey:setAlpha( 1 )
						Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame3 )
					end
				end
				
				Cryptokey:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				Cryptokey:setAlpha( 0 )
				Cryptokey:setScale( 1 )
				Cryptokey:registerEventHandler( "transition_complete_keyframe", CryptokeyFrame2 )
				local CryptokeyGoldFrame2 = function ( CryptokeyGold, event )
					local CryptokeyGoldFrame3 = function ( CryptokeyGold, event )
						local CryptokeyGoldFrame4 = function ( CryptokeyGold, event )
							local CryptokeyGoldFrame5 = function ( CryptokeyGold, event )
								if not event.interrupted then
									CryptokeyGold:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								end
								CryptokeyGold:setAlpha( 1 )
								CryptokeyGold:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
								CryptokeyGold:setShaderVector( 0, 0.99, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( CryptokeyGold, event )
								else
									CryptokeyGold:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptokeyGoldFrame5( CryptokeyGold, event )
								return 
							else
								CryptokeyGold:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
								CryptokeyGold:setShaderVector( 0, 0.99, 0, 0, 0 )
								CryptokeyGold:registerEventHandler( "transition_complete_keyframe", CryptokeyGoldFrame5 )
							end
						end
						
						if event.interrupted then
							CryptokeyGoldFrame4( CryptokeyGold, event )
							return 
						else
							CryptokeyGold:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
							CryptokeyGold:setAlpha( 1 )
							CryptokeyGold:setShaderVector( 0, 0.55, 0, 0, 0 )
							CryptokeyGold:registerEventHandler( "transition_complete_keyframe", CryptokeyGoldFrame4 )
						end
					end
					
					if event.interrupted then
						CryptokeyGoldFrame3( CryptokeyGold, event )
						return 
					else
						CryptokeyGold:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						CryptokeyGold:setAlpha( 0.42 )
						CryptokeyGold:registerEventHandler( "transition_complete_keyframe", CryptokeyGoldFrame3 )
					end
				end
				
				CryptokeyGold:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
				CryptokeyGold:setAlpha( 0 )
				CryptokeyGold:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint_reveal" ) )
				CryptokeyGold:setShaderVector( 0, 0.01, 0, 0, 0 )
				CryptokeyGold:registerEventHandler( "transition_complete_keyframe", CryptokeyGoldFrame2 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

