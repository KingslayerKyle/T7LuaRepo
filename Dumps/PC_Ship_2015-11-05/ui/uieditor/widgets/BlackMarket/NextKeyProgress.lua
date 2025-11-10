require( "ui.uieditor.widgets.AAR.XPbarFrame" )

CoD.NextKeyProgress = InheritFrom( LUI.UIElement )
CoD.NextKeyProgress.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NextKeyProgress )
	self.id = "NextKeyProgress"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 50 )
	self.anyChildUsesUpdateState = true
	
	local cryptokeyProgressBgGrey = LUI.UIImage.new()
	cryptokeyProgressBgGrey:setLeftRight( true, true, 0, 0 )
	cryptokeyProgressBgGrey:setTopBottom( true, true, 1, -0.74 )
	cryptokeyProgressBgGrey:setRGB( 0.16, 0.16, 0.16 )
	cryptokeyProgressBgGrey:setAlpha( 0 )
	self:addElement( cryptokeyProgressBgGrey )
	self.cryptokeyProgressBgGrey = cryptokeyProgressBgGrey
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( true, true, -1, 1 )
	cachitBG0:setTopBottom( true, true, -1, 1 )
	cachitBG0:setAlpha( 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0.01, 0.08, 0, 0 )
	cachitBG0:setupNineSliceShader( 4, 4 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local XpBarFrame = CoD.XPbarFrame.new( menu, controller )
	XpBarFrame:setLeftRight( true, true, 84.83, -4 )
	XpBarFrame:setTopBottom( false, true, -27, -4.74 )
	self:addElement( XpBarFrame )
	self.XpBarFrame = XpBarFrame
	
	local cryptokeyProgressBg = LUI.UIImage.new()
	cryptokeyProgressBg:setLeftRight( true, true, 88, -7 )
	cryptokeyProgressBg:setTopBottom( false, true, -23, -9 )
	cryptokeyProgressBg:setAlpha( 0.1 )
	self:addElement( cryptokeyProgressBg )
	self.cryptokeyProgressBg = cryptokeyProgressBg
	
	local cryptokeyProgress = LUI.UIImage.new()
	cryptokeyProgress:setLeftRight( true, true, 88, -7 )
	cryptokeyProgress:setTopBottom( false, true, -23, -9 )
	cryptokeyProgress:setAlpha( 0 )
	cryptokeyProgress:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	cryptokeyProgress:setShaderVector( 1, 0, 0, 0, 0 )
	cryptokeyProgress:setShaderVector( 2, 1, 0, 0, 0 )
	cryptokeyProgress:setShaderVector( 3, 0, 0, 0, 0 )
	cryptokeyProgress:subscribeToGlobalModel( controller, "CryptoKeyProgress", "progress", function ( model )
		local progress = Engine.GetModelValue( model )
		if progress then
			cryptokeyProgress:setShaderVector( 0, CoD.GetVectorComponentFromString( progress, 1 ), CoD.GetVectorComponentFromString( progress, 2 ), CoD.GetVectorComponentFromString( progress, 3 ), CoD.GetVectorComponentFromString( progress, 4 ) )
		end
	end )
	self:addElement( cryptokeyProgress )
	self.cryptokeyProgress = cryptokeyProgress
	
	local cryptokeyProgressForNewKey = LUI.UIImage.new()
	cryptokeyProgressForNewKey:setLeftRight( true, true, 88, -7 )
	cryptokeyProgressForNewKey:setTopBottom( false, true, -23, -9 )
	cryptokeyProgressForNewKey:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	cryptokeyProgressForNewKey:setShaderVector( 1, 0, 0, 0, 0 )
	cryptokeyProgressForNewKey:setShaderVector( 2, 1, 0, 0, 0 )
	cryptokeyProgressForNewKey:setShaderVector( 3, 0, 0, 0, 0 )
	cryptokeyProgressForNewKey:subscribeToGlobalModel( controller, "CryptoKeyProgress", "animProgress", function ( model )
		local animProgress = Engine.GetModelValue( model )
		if animProgress then
			cryptokeyProgressForNewKey:setShaderVector( 0, CoD.GetVectorComponentFromString( animProgress, 1 ), CoD.GetVectorComponentFromString( animProgress, 2 ), CoD.GetVectorComponentFromString( animProgress, 3 ), CoD.GetVectorComponentFromString( animProgress, 4 ) )
		end
	end )
	self:addElement( cryptokeyProgressForNewKey )
	self.cryptokeyProgressForNewKey = cryptokeyProgressForNewKey
	
	local MeterGlow = LUI.UIImage.new()
	MeterGlow:setLeftRight( true, true, 83, -7 )
	MeterGlow:setTopBottom( true, false, 16.26, 52 )
	MeterGlow:setAlpha( 0.41 )
	MeterGlow:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterglow" ) )
	MeterGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterGlow )
	self.MeterGlow = MeterGlow
	
	local nextKeyText = LUI.UITightText.new()
	nextKeyText:setLeftRight( true, false, 88, 393 )
	nextKeyText:setTopBottom( false, true, -47, -27 )
	nextKeyText:setText( Engine.Localize( "MPUI_NEXT_KEY_CAPS" ) )
	nextKeyText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextKeyText:setLetterSpacing( 0.5 )
	self:addElement( nextKeyText )
	self.nextKeyText = nextKeyText
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( true, false, 38.69, 75.83 )
	CryptoIcon:setTopBottom( false, false, -17.88, 19.26 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptoCount = LUI.UIText.new()
	CryptoCount:setLeftRight( true, false, -24, 36.69 )
	CryptoCount:setTopBottom( false, false, -14.74, 15.26 )
	CryptoCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	CryptoCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local keyCount = Engine.GetModelValue( model )
		if keyCount then
			CryptoCount:setText( Engine.Localize( keyCount ) )
		end
	end )
	self:addElement( CryptoCount )
	self.CryptoCount = CryptoCount
	
	local CryptoKeyNewCount = LUI.UITightText.new()
	CryptoKeyNewCount:setLeftRight( true, false, 671.5, 945 )
	CryptoKeyNewCount:setTopBottom( false, false, -16.24, 13.76 )
	CryptoKeyNewCount:setRGB( 0.41, 0.74, 0.27 )
	CryptoKeyNewCount:setAlpha( 0 )
	CryptoKeyNewCount:setText( Engine.Localize( "MPUI_BM_CRYPTOKEY_EARNED" ) )
	CryptoKeyNewCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CryptoKeyNewCount:setLetterSpacing( 1 )
	self:addElement( CryptoKeyNewCount )
	self.CryptoKeyNewCount = CryptoKeyNewCount
	
	local CryptoIcon0 = LUI.UIImage.new()
	CryptoIcon0:setLeftRight( true, false, 630.69, 667.83 )
	CryptoIcon0:setTopBottom( false, false, -19, 18.14 )
	CryptoIcon0:setAlpha( 0 )
	CryptoIcon0:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon0 )
	self.CryptoIcon0 = CryptoIcon0
	
	local CryptoCountNew0 = LUI.UIText.new()
	CryptoCountNew0:setLeftRight( true, false, 559, 630.69 )
	CryptoCountNew0:setTopBottom( false, false, -21.24, 18.76 )
	CryptoCountNew0:setAlpha( 0 )
	CryptoCountNew0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CryptoCountNew0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	CryptoCountNew0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CryptoCountNew0:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local keyCount = Engine.GetModelValue( model )
		if keyCount then
			CryptoCountNew0:setText( Engine.Localize( keyCount ) )
		end
	end )
	self:addElement( CryptoCountNew0 )
	self.CryptoCountNew0 = CryptoCountNew0
	
	local Sound = LUI.UIElement.new()
	Sound:setLeftRight( true, false, -140.5, -92.5 )
	Sound:setTopBottom( true, false, 35.5, 83.5 )
	Sound:setPlaySoundDirect( true )
	self:addElement( Sound )
	self.Sound = Sound
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				cryptokeyProgress:completeAnimation()
				self.cryptokeyProgress:setAlpha( 1 )
				self.clipFinished( cryptokeyProgress, {} )
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressForNewKey, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setAlpha( 1 )
				self.clipFinished( CryptoCount, {} )
				CryptoKeyNewCount:completeAnimation()
				self.CryptoKeyNewCount:setAlpha( 0 )
				self.clipFinished( CryptoKeyNewCount, {} )
				CryptoIcon0:completeAnimation()
				self.CryptoIcon0:setAlpha( 0 )
				self.clipFinished( CryptoIcon0, {} )
				CryptoCountNew0:completeAnimation()
				self.CryptoCountNew0:setAlpha( 0 )
				self.clipFinished( CryptoCountNew0, {} )
			end,
			NewXPNoNewKey = function ()
				self:setupElementClipCounter( 8 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				cryptokeyProgress:completeAnimation()
				self.cryptokeyProgress:setAlpha( 0 )
				self.clipFinished( cryptokeyProgress, {} )
				local cryptokeyProgressForNewKeyFrame2 = function ( cryptokeyProgressForNewKey, event )
					if not event.interrupted then
						cryptokeyProgressForNewKey:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					cryptokeyProgressForNewKey:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cryptokeyProgressForNewKey, event )
					else
						cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setAlpha( 1 )
				cryptokeyProgressForNewKeyFrame2( cryptokeyProgressForNewKey, {} )
				CryptoKeyNewCount:completeAnimation()
				self.CryptoKeyNewCount:setAlpha( 0 )
				self.clipFinished( CryptoKeyNewCount, {} )
				CryptoIcon0:completeAnimation()
				self.CryptoIcon0:setAlpha( 0 )
				self.clipFinished( CryptoIcon0, {} )
				CryptoCountNew0:completeAnimation()
				self.CryptoCountNew0:setAlpha( 0 )
				self.clipFinished( CryptoCountNew0, {} )
				local SoundFrame2 = function ( Sound, event )
					if not event.interrupted then
						Sound:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Sound:setPlaySoundDirect( true )
					Sound:playSound( "uin_bm_bar_fill_tail", controller )
					if event.interrupted then
						self.clipFinished( Sound, event )
					else
						Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( true )
				self.Sound:playSound( "uin_bm_bar_fill_main", controller )
				SoundFrame2( Sound, {} )
			end,
			NewKey = function ()
				self:setupElementClipCounter( 14 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				local f10_local0 = function ( f11_arg0, f11_arg1 )
					local f11_local0 = function ( f12_arg0, f12_arg1 )
						local f12_local0 = function ( f13_arg0, f13_arg1 )
							if not f13_arg1.interrupted then
								f13_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f13_arg0:setAlpha( 1 )
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
							f12_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
						end
					end
					
					if f11_arg1.interrupted then
						f11_local0( f11_arg0, f11_arg1 )
						return 
					else
						f11_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						f11_arg0:setAlpha( 0 )
						f11_arg0:registerEventHandler( "transition_complete_keyframe", f11_local0 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f10_local0 )
				local f10_local1 = function ( f14_arg0, f14_arg1 )
					local f14_local0 = function ( f15_arg0, f15_arg1 )
						local f15_local0 = function ( f16_arg0, f16_arg1 )
							if not f16_arg1.interrupted then
								f16_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f16_arg0:setAlpha( 0.1 )
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
							f15_arg0:beginAnimation( "keyframe", 1330, false, false, CoD.TweenType.Linear )
							f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
						end
					end
					
					if f14_arg1.interrupted then
						f14_local0( f14_arg0, f14_arg1 )
						return 
					else
						f14_arg0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
						f14_arg0:setAlpha( 0 )
						f14_arg0:registerEventHandler( "transition_complete_keyframe", f14_local0 )
					end
				end
				
				cryptokeyProgressBg:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				cryptokeyProgressBg:setAlpha( 0.1 )
				cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", f10_local1 )
				cryptokeyProgress:completeAnimation()
				self.cryptokeyProgress:setAlpha( 0 )
				self.clipFinished( cryptokeyProgress, {} )
				local cryptokeyProgressForNewKeyFrame2 = function ( cryptokeyProgressForNewKey, event )
					local cryptokeyProgressForNewKeyFrame3 = function ( cryptokeyProgressForNewKey, event )
						local cryptokeyProgressForNewKeyFrame4 = function ( cryptokeyProgressForNewKey, event )
							local cryptokeyProgressForNewKeyFrame5 = function ( cryptokeyProgressForNewKey, event )
								local cryptokeyProgressForNewKeyFrame6 = function ( cryptokeyProgressForNewKey, event )
									local cryptokeyProgressForNewKeyFrame7 = function ( cryptokeyProgressForNewKey, event )
										if not event.interrupted then
											cryptokeyProgressForNewKey:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										cryptokeyProgressForNewKey:setRGB( 1, 1, 1 )
										cryptokeyProgressForNewKey:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( cryptokeyProgressForNewKey, event )
										else
											cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										cryptokeyProgressForNewKeyFrame7( cryptokeyProgressForNewKey, event )
										return 
									else
										cryptokeyProgressForNewKey:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame7 )
									end
								end
								
								if event.interrupted then
									cryptokeyProgressForNewKeyFrame6( cryptokeyProgressForNewKey, event )
									return 
								else
									cryptokeyProgressForNewKey:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									cryptokeyProgressForNewKey:setAlpha( 0 )
									cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyProgressForNewKeyFrame5( cryptokeyProgressForNewKey, event )
								return 
							else
								cryptokeyProgressForNewKey:beginAnimation( "keyframe", 979, false, false, CoD.TweenType.Linear )
								cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyProgressForNewKeyFrame4( cryptokeyProgressForNewKey, event )
							return 
						else
							cryptokeyProgressForNewKey:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							cryptokeyProgressForNewKey:setRGB( 0.42, 0.75, 0.27 )
							cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyProgressForNewKeyFrame3( cryptokeyProgressForNewKey, event )
						return 
					else
						cryptokeyProgressForNewKey:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame3 )
					end
				end
				
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setRGB( 1, 1, 1 )
				self.cryptokeyProgressForNewKey:setAlpha( 1 )
				cryptokeyProgressForNewKeyFrame2( cryptokeyProgressForNewKey, {} )
				local MeterGlowFrame2 = function ( MeterGlow, event )
					local MeterGlowFrame3 = function ( MeterGlow, event )
						local MeterGlowFrame4 = function ( MeterGlow, event )
							local MeterGlowFrame5 = function ( MeterGlow, event )
								if not event.interrupted then
									MeterGlow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								end
								MeterGlow:setRGB( 0.43, 0.75, 0.28 )
								MeterGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MeterGlow, event )
								else
									MeterGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MeterGlowFrame5( MeterGlow, event )
								return 
							else
								MeterGlow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
								MeterGlow:setAlpha( 1 )
								MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame5 )
							end
						end
						
						if event.interrupted then
							MeterGlowFrame4( MeterGlow, event )
							return 
						else
							MeterGlow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							MeterGlow:setAlpha( 0 )
							MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame4 )
						end
					end
					
					if event.interrupted then
						MeterGlowFrame3( MeterGlow, event )
						return 
					else
						MeterGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						MeterGlow:setRGB( 0.43, 0.75, 0.28 )
						MeterGlow:setAlpha( 0.14 )
						MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame3 )
					end
				end
				
				MeterGlow:completeAnimation()
				self.MeterGlow:setRGB( 1, 1, 1 )
				self.MeterGlow:setAlpha( 0.41 )
				MeterGlowFrame2( MeterGlow, {} )
				local f10_local4 = function ( f27_arg0, f27_arg1 )
					local f27_local0 = function ( f28_arg0, f28_arg1 )
						local f28_local0 = function ( f29_arg0, f29_arg1 )
							if not f29_arg1.interrupted then
								f29_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f29_arg0:setAlpha( 1 )
							if f29_arg1.interrupted then
								self.clipFinished( f29_arg0, f29_arg1 )
							else
								f29_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f28_arg1.interrupted then
							f28_local0( f28_arg0, f28_arg1 )
							return 
						else
							f28_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
						end
					end
					
					if f27_arg1.interrupted then
						f27_local0( f27_arg0, f27_arg1 )
						return 
					else
						f27_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f27_arg0:setAlpha( 0 )
						f27_arg0:registerEventHandler( "transition_complete_keyframe", f27_local0 )
					end
				end
				
				nextKeyText:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				nextKeyText:setAlpha( 1 )
				nextKeyText:registerEventHandler( "transition_complete_keyframe", f10_local4 )
				local f10_local5 = function ( f30_arg0, f30_arg1 )
					local f30_local0 = function ( f31_arg0, f31_arg1 )
						local f31_local0 = function ( f32_arg0, f32_arg1 )
							local f32_local0 = function ( f33_arg0, f33_arg1 )
								if not f33_arg1.interrupted then
									f33_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f33_arg0:setAlpha( 1 )
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
								f32_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
							end
						end
						
						if f31_arg1.interrupted then
							f31_local0( f31_arg0, f31_arg1 )
							return 
						else
							f31_arg0:beginAnimation( "keyframe", 1249, false, false, CoD.TweenType.Linear )
							f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
						end
					end
					
					if f30_arg1.interrupted then
						f30_local0( f30_arg0, f30_arg1 )
						return 
					else
						f30_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f30_arg0:setAlpha( 0 )
						f30_arg0:registerEventHandler( "transition_complete_keyframe", f30_local0 )
					end
				end
				
				CryptoIcon:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				CryptoIcon:setAlpha( 1 )
				CryptoIcon:registerEventHandler( "transition_complete_keyframe", f10_local5 )
				local f10_local6 = function ( f34_arg0, f34_arg1 )
					local f34_local0 = function ( f35_arg0, f35_arg1 )
						local f35_local0 = function ( f36_arg0, f36_arg1 )
							local f36_local0 = function ( f37_arg0, f37_arg1 )
								if not f37_arg1.interrupted then
									f37_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f37_arg0:setRGB( 1, 1, 1 )
								f37_arg0:setAlpha( 1 )
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
								f36_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
							end
						end
						
						if f35_arg1.interrupted then
							f35_local0( f35_arg0, f35_arg1 )
							return 
						else
							f35_arg0:beginAnimation( "keyframe", 1239, false, false, CoD.TweenType.Linear )
							f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
						end
					end
					
					if f34_arg1.interrupted then
						f34_local0( f34_arg0, f34_arg1 )
						return 
					else
						f34_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f34_arg0:setAlpha( 0 )
						f34_arg0:registerEventHandler( "transition_complete_keyframe", f34_local0 )
					end
				end
				
				CryptoCount:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				CryptoCount:setRGB( 1, 1, 1 )
				CryptoCount:setAlpha( 1 )
				CryptoCount:registerEventHandler( "transition_complete_keyframe", f10_local6 )
				local f10_local7 = function ( f38_arg0, f38_arg1 )
					local f38_local0 = function ( f39_arg0, f39_arg1 )
						local f39_local0 = function ( f40_arg0, f40_arg1 )
							local f40_local0 = function ( f41_arg0, f41_arg1 )
								if not f41_arg1.interrupted then
									f41_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								f41_arg0:setLeftRight( true, false, 86.04, 359.54 )
								f41_arg0:setTopBottom( false, false, -16.24, 13.76 )
								f41_arg0:setAlpha( 0 )
								if f41_arg1.interrupted then
									self.clipFinished( f41_arg0, f41_arg1 )
								else
									f41_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f40_arg1.interrupted then
								f40_local0( f40_arg0, f40_arg1 )
								return 
							else
								f40_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f40_arg0:setLeftRight( true, false, 166.04, 439.54 )
								f40_arg0:registerEventHandler( "transition_complete_keyframe", f40_local0 )
							end
						end
						
						if f39_arg1.interrupted then
							f39_local0( f39_arg0, f39_arg1 )
							return 
						else
							f39_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f39_arg0:setLeftRight( true, false, 214.44, 487.94 )
							f39_arg0:setAlpha( 1 )
							f39_arg0:registerEventHandler( "transition_complete_keyframe", f39_local0 )
						end
					end
					
					if f38_arg1.interrupted then
						f38_local0( f38_arg0, f38_arg1 )
						return 
					else
						f38_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f38_arg0:setLeftRight( true, false, 450.34, 723.84 )
						f38_arg0:registerEventHandler( "transition_complete_keyframe", f38_local0 )
					end
				end
				
				CryptoKeyNewCount:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoKeyNewCount:setLeftRight( true, false, 671.5, 945 )
				CryptoKeyNewCount:setTopBottom( false, false, -16.24, 13.76 )
				CryptoKeyNewCount:setAlpha( 0 )
				CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", f10_local7 )
				local f10_local8 = function ( f42_arg0, f42_arg1 )
					local f42_local0 = function ( f43_arg0, f43_arg1 )
						local f43_local0 = function ( f44_arg0, f44_arg1 )
							local f44_local0 = function ( f45_arg0, f45_arg1 )
								local f45_local0 = function ( f46_arg0, f46_arg1 )
									if not f46_arg1.interrupted then
										f46_arg0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
									end
									f46_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f46_arg0:setTopBottom( false, false, -19, 18.14 )
									f46_arg0:setAlpha( 0 )
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
									f45_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									f45_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f45_arg0:setAlpha( 0 )
									f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
								end
							end
							
							if f44_arg1.interrupted then
								f44_local0( f44_arg0, f44_arg1 )
								return 
							else
								f44_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f44_arg0:setLeftRight( true, false, 127.16, 164.3 )
								f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
							end
						end
						
						if f43_arg1.interrupted then
							f43_local0( f43_arg0, f43_arg1 )
							return 
						else
							f43_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f43_arg0:setLeftRight( true, false, 175.36, 212.5 )
							f43_arg0:setAlpha( 1 )
							f43_arg0:registerEventHandler( "transition_complete_keyframe", f43_local0 )
						end
					end
					
					if f42_arg1.interrupted then
						f42_local0( f42_arg0, f42_arg1 )
						return 
					else
						f42_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f42_arg0:setLeftRight( true, false, 410.37, 447.51 )
						f42_arg0:registerEventHandler( "transition_complete_keyframe", f42_local0 )
					end
				end
				
				CryptoIcon0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoIcon0:setLeftRight( true, false, 630.69, 667.83 )
				CryptoIcon0:setTopBottom( false, false, -19, 18.14 )
				CryptoIcon0:setAlpha( 0 )
				CryptoIcon0:registerEventHandler( "transition_complete_keyframe", f10_local8 )
				local CryptoCountNew0Frame2 = function ( CryptoCountNew0, event )
					local CryptoCountNew0Frame3 = function ( CryptoCountNew0, event )
						local CryptoCountNew0Frame4 = function ( CryptoCountNew0, event )
							local CryptoCountNew0Frame5 = function ( CryptoCountNew0, event )
								if not event.interrupted then
									CryptoCountNew0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								CryptoCountNew0:setLeftRight( true, false, -25.31, 46.38 )
								CryptoCountNew0:setTopBottom( false, false, -21.24, 18.76 )
								CryptoCountNew0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CryptoCountNew0, event )
								else
									CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoCountNew0Frame5( CryptoCountNew0, event )
								return 
							else
								CryptoCountNew0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								CryptoCountNew0:setLeftRight( true, false, 54.69, 126.38 )
								CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame5 )
							end
						end
						
						if event.interrupted then
							CryptoCountNew0Frame4( CryptoCountNew0, event )
							return 
						else
							CryptoCountNew0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							CryptoCountNew0:setLeftRight( true, false, 102.26, 173.95 )
							CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame4 )
						end
					end
					
					if event.interrupted then
						CryptoCountNew0Frame3( CryptoCountNew0, event )
						return 
					else
						CryptoCountNew0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
						CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame3 )
					end
				end
				
				CryptoCountNew0:completeAnimation()
				self.CryptoCountNew0:setLeftRight( true, false, 559, 630.69 )
				self.CryptoCountNew0:setTopBottom( false, false, -21.24, 18.76 )
				self.CryptoCountNew0:setAlpha( 0 )
				CryptoCountNew0Frame2( CryptoCountNew0, {} )
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						if not event.interrupted then
							Sound:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
						end
						Sound:setPlaySoundDirect( true )
						Sound:playSound( "uin_bm_key_earned", controller )
						if event.interrupted then
							self.clipFinished( Sound, event )
						else
							Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						Sound:playSound( "uin_bm_bar_fill_tail", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( true )
				self.Sound:playSound( "uin_bm_bar_fill_main", controller )
				SoundFrame2( Sound, {} )
			end
		},
		HidePixels = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			NewXPNoNewKey = function ()
				self:setupElementClipCounter( 8 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				cryptokeyProgress:completeAnimation()
				self.cryptokeyProgress:setAlpha( 0 )
				self.clipFinished( cryptokeyProgress, {} )
				local cryptokeyProgressForNewKeyFrame2 = function ( cryptokeyProgressForNewKey, event )
					if not event.interrupted then
						cryptokeyProgressForNewKey:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Linear )
					end
					cryptokeyProgressForNewKey:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( cryptokeyProgressForNewKey, event )
					else
						cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setAlpha( 1 )
				cryptokeyProgressForNewKeyFrame2( cryptokeyProgressForNewKey, {} )
				CryptoKeyNewCount:completeAnimation()
				self.CryptoKeyNewCount:setAlpha( 0 )
				self.clipFinished( CryptoKeyNewCount, {} )
				CryptoIcon0:completeAnimation()
				self.CryptoIcon0:setAlpha( 0 )
				self.clipFinished( CryptoIcon0, {} )
				CryptoCountNew0:completeAnimation()
				self.CryptoCountNew0:setAlpha( 0 )
				self.clipFinished( CryptoCountNew0, {} )
				local SoundFrame2 = function ( Sound, event )
					if not event.interrupted then
						Sound:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Sound:setPlaySoundDirect( true )
					Sound:playSound( "uin_bm_bar_fill_tail", controller )
					if event.interrupted then
						self.clipFinished( Sound, event )
					else
						Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( true )
				self.Sound:playSound( "uin_bm_bar_fill_main", controller )
				SoundFrame2( Sound, {} )
			end,
			NewKey = function ()
				self:setupElementClipCounter( 14 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				local f57_local0 = function ( f58_arg0, f58_arg1 )
					local f58_local0 = function ( f59_arg0, f59_arg1 )
						local f59_local0 = function ( f60_arg0, f60_arg1 )
							if not f60_arg1.interrupted then
								f60_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f60_arg0:setAlpha( 1 )
							if f60_arg1.interrupted then
								self.clipFinished( f60_arg0, f60_arg1 )
							else
								f60_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f59_arg1.interrupted then
							f59_local0( f59_arg0, f59_arg1 )
							return 
						else
							f59_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
						end
					end
					
					if f58_arg1.interrupted then
						f58_local0( f58_arg0, f58_arg1 )
						return 
					else
						f58_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						f58_arg0:setAlpha( 0 )
						f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f57_local0 )
				local f57_local1 = function ( f61_arg0, f61_arg1 )
					local f61_local0 = function ( f62_arg0, f62_arg1 )
						local f62_local0 = function ( f63_arg0, f63_arg1 )
							if not f63_arg1.interrupted then
								f63_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f63_arg0:setAlpha( 0.1 )
							if f63_arg1.interrupted then
								self.clipFinished( f63_arg0, f63_arg1 )
							else
								f63_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f62_arg1.interrupted then
							f62_local0( f62_arg0, f62_arg1 )
							return 
						else
							f62_arg0:beginAnimation( "keyframe", 1330, false, false, CoD.TweenType.Linear )
							f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
						end
					end
					
					if f61_arg1.interrupted then
						f61_local0( f61_arg0, f61_arg1 )
						return 
					else
						f61_arg0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
						f61_arg0:setAlpha( 0 )
						f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
					end
				end
				
				cryptokeyProgressBg:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				cryptokeyProgressBg:setAlpha( 0.1 )
				cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", f57_local1 )
				cryptokeyProgress:completeAnimation()
				self.cryptokeyProgress:setAlpha( 0 )
				self.clipFinished( cryptokeyProgress, {} )
				local cryptokeyProgressForNewKeyFrame2 = function ( cryptokeyProgressForNewKey, event )
					local cryptokeyProgressForNewKeyFrame3 = function ( cryptokeyProgressForNewKey, event )
						local cryptokeyProgressForNewKeyFrame4 = function ( cryptokeyProgressForNewKey, event )
							local cryptokeyProgressForNewKeyFrame5 = function ( cryptokeyProgressForNewKey, event )
								local cryptokeyProgressForNewKeyFrame6 = function ( cryptokeyProgressForNewKey, event )
									local cryptokeyProgressForNewKeyFrame7 = function ( cryptokeyProgressForNewKey, event )
										if not event.interrupted then
											cryptokeyProgressForNewKey:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
										end
										cryptokeyProgressForNewKey:setRGB( 1, 1, 1 )
										cryptokeyProgressForNewKey:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( cryptokeyProgressForNewKey, event )
										else
											cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										cryptokeyProgressForNewKeyFrame7( cryptokeyProgressForNewKey, event )
										return 
									else
										cryptokeyProgressForNewKey:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
										cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame7 )
									end
								end
								
								if event.interrupted then
									cryptokeyProgressForNewKeyFrame6( cryptokeyProgressForNewKey, event )
									return 
								else
									cryptokeyProgressForNewKey:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
									cryptokeyProgressForNewKey:setAlpha( 0 )
									cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame6 )
								end
							end
							
							if event.interrupted then
								cryptokeyProgressForNewKeyFrame5( cryptokeyProgressForNewKey, event )
								return 
							else
								cryptokeyProgressForNewKey:beginAnimation( "keyframe", 979, false, false, CoD.TweenType.Linear )
								cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame5 )
							end
						end
						
						if event.interrupted then
							cryptokeyProgressForNewKeyFrame4( cryptokeyProgressForNewKey, event )
							return 
						else
							cryptokeyProgressForNewKey:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							cryptokeyProgressForNewKey:setRGB( 0.42, 0.75, 0.27 )
							cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyProgressForNewKeyFrame3( cryptokeyProgressForNewKey, event )
						return 
					else
						cryptokeyProgressForNewKey:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						cryptokeyProgressForNewKey:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressForNewKeyFrame3 )
					end
				end
				
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setRGB( 1, 1, 1 )
				self.cryptokeyProgressForNewKey:setAlpha( 1 )
				cryptokeyProgressForNewKeyFrame2( cryptokeyProgressForNewKey, {} )
				local MeterGlowFrame2 = function ( MeterGlow, event )
					local MeterGlowFrame3 = function ( MeterGlow, event )
						local MeterGlowFrame4 = function ( MeterGlow, event )
							local MeterGlowFrame5 = function ( MeterGlow, event )
								if not event.interrupted then
									MeterGlow:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								end
								MeterGlow:setRGB( 0.43, 0.75, 0.28 )
								MeterGlow:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MeterGlow, event )
								else
									MeterGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MeterGlowFrame5( MeterGlow, event )
								return 
							else
								MeterGlow:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
								MeterGlow:setAlpha( 1 )
								MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame5 )
							end
						end
						
						if event.interrupted then
							MeterGlowFrame4( MeterGlow, event )
							return 
						else
							MeterGlow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							MeterGlow:setAlpha( 0 )
							MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame4 )
						end
					end
					
					if event.interrupted then
						MeterGlowFrame3( MeterGlow, event )
						return 
					else
						MeterGlow:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						MeterGlow:setRGB( 0.43, 0.75, 0.28 )
						MeterGlow:setAlpha( 0.14 )
						MeterGlow:registerEventHandler( "transition_complete_keyframe", MeterGlowFrame3 )
					end
				end
				
				MeterGlow:completeAnimation()
				self.MeterGlow:setRGB( 1, 1, 1 )
				self.MeterGlow:setAlpha( 0.41 )
				MeterGlowFrame2( MeterGlow, {} )
				local f57_local4 = function ( f74_arg0, f74_arg1 )
					local f74_local0 = function ( f75_arg0, f75_arg1 )
						local f75_local0 = function ( f76_arg0, f76_arg1 )
							if not f76_arg1.interrupted then
								f76_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f76_arg0:setAlpha( 1 )
							if f76_arg1.interrupted then
								self.clipFinished( f76_arg0, f76_arg1 )
							else
								f76_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f75_arg1.interrupted then
							f75_local0( f75_arg0, f75_arg1 )
							return 
						else
							f75_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
						end
					end
					
					if f74_arg1.interrupted then
						f74_local0( f74_arg0, f74_arg1 )
						return 
					else
						f74_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f74_arg0:setAlpha( 0 )
						f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
					end
				end
				
				nextKeyText:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				nextKeyText:setAlpha( 1 )
				nextKeyText:registerEventHandler( "transition_complete_keyframe", f57_local4 )
				local f57_local5 = function ( f77_arg0, f77_arg1 )
					local f77_local0 = function ( f78_arg0, f78_arg1 )
						local f78_local0 = function ( f79_arg0, f79_arg1 )
							local f79_local0 = function ( f80_arg0, f80_arg1 )
								if not f80_arg1.interrupted then
									f80_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f80_arg0:setAlpha( 1 )
								if f80_arg1.interrupted then
									self.clipFinished( f80_arg0, f80_arg1 )
								else
									f80_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f79_arg1.interrupted then
								f79_local0( f79_arg0, f79_arg1 )
								return 
							else
								f79_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
							end
						end
						
						if f78_arg1.interrupted then
							f78_local0( f78_arg0, f78_arg1 )
							return 
						else
							f78_arg0:beginAnimation( "keyframe", 1249, false, false, CoD.TweenType.Linear )
							f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
						end
					end
					
					if f77_arg1.interrupted then
						f77_local0( f77_arg0, f77_arg1 )
						return 
					else
						f77_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f77_arg0:setAlpha( 0 )
						f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
					end
				end
				
				CryptoIcon:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				CryptoIcon:setAlpha( 1 )
				CryptoIcon:registerEventHandler( "transition_complete_keyframe", f57_local5 )
				local f57_local6 = function ( f81_arg0, f81_arg1 )
					local f81_local0 = function ( f82_arg0, f82_arg1 )
						local f82_local0 = function ( f83_arg0, f83_arg1 )
							local f83_local0 = function ( f84_arg0, f84_arg1 )
								if not f84_arg1.interrupted then
									f84_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f84_arg0:setRGB( 1, 1, 1 )
								f84_arg0:setAlpha( 1 )
								if f84_arg1.interrupted then
									self.clipFinished( f84_arg0, f84_arg1 )
								else
									f84_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f83_arg1.interrupted then
								f83_local0( f83_arg0, f83_arg1 )
								return 
							else
								f83_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
							end
						end
						
						if f82_arg1.interrupted then
							f82_local0( f82_arg0, f82_arg1 )
							return 
						else
							f82_arg0:beginAnimation( "keyframe", 1239, false, false, CoD.TweenType.Linear )
							f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
						end
					end
					
					if f81_arg1.interrupted then
						f81_local0( f81_arg0, f81_arg1 )
						return 
					else
						f81_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f81_arg0:setAlpha( 0 )
						f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
					end
				end
				
				CryptoCount:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				CryptoCount:setRGB( 1, 1, 1 )
				CryptoCount:setAlpha( 1 )
				CryptoCount:registerEventHandler( "transition_complete_keyframe", f57_local6 )
				local f57_local7 = function ( f85_arg0, f85_arg1 )
					local f85_local0 = function ( f86_arg0, f86_arg1 )
						local f86_local0 = function ( f87_arg0, f87_arg1 )
							local f87_local0 = function ( f88_arg0, f88_arg1 )
								if not f88_arg1.interrupted then
									f88_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								f88_arg0:setLeftRight( true, false, 86.04, 359.54 )
								f88_arg0:setTopBottom( false, false, -16.24, 13.76 )
								f88_arg0:setAlpha( 0 )
								if f88_arg1.interrupted then
									self.clipFinished( f88_arg0, f88_arg1 )
								else
									f88_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f87_arg1.interrupted then
								f87_local0( f87_arg0, f87_arg1 )
								return 
							else
								f87_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f87_arg0:setLeftRight( true, false, 166.04, 439.54 )
								f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
							end
						end
						
						if f86_arg1.interrupted then
							f86_local0( f86_arg0, f86_arg1 )
							return 
						else
							f86_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f86_arg0:setLeftRight( true, false, 214.44, 487.94 )
							f86_arg0:setAlpha( 1 )
							f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
						end
					end
					
					if f85_arg1.interrupted then
						f85_local0( f85_arg0, f85_arg1 )
						return 
					else
						f85_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f85_arg0:setLeftRight( true, false, 450.34, 723.84 )
						f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
					end
				end
				
				CryptoKeyNewCount:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoKeyNewCount:setLeftRight( true, false, 671.5, 945 )
				CryptoKeyNewCount:setTopBottom( false, false, -16.24, 13.76 )
				CryptoKeyNewCount:setAlpha( 0 )
				CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", f57_local7 )
				local f57_local8 = function ( f89_arg0, f89_arg1 )
					local f89_local0 = function ( f90_arg0, f90_arg1 )
						local f90_local0 = function ( f91_arg0, f91_arg1 )
							local f91_local0 = function ( f92_arg0, f92_arg1 )
								local f92_local0 = function ( f93_arg0, f93_arg1 )
									if not f93_arg1.interrupted then
										f93_arg0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
									end
									f93_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f93_arg0:setTopBottom( false, false, -19, 18.14 )
									f93_arg0:setAlpha( 0 )
									if f93_arg1.interrupted then
										self.clipFinished( f93_arg0, f93_arg1 )
									else
										f93_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f92_arg1.interrupted then
									f92_local0( f92_arg0, f92_arg1 )
									return 
								else
									f92_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									f92_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f92_arg0:setAlpha( 0 )
									f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
								end
							end
							
							if f91_arg1.interrupted then
								f91_local0( f91_arg0, f91_arg1 )
								return 
							else
								f91_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f91_arg0:setLeftRight( true, false, 127.16, 164.3 )
								f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
							end
						end
						
						if f90_arg1.interrupted then
							f90_local0( f90_arg0, f90_arg1 )
							return 
						else
							f90_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f90_arg0:setLeftRight( true, false, 175.36, 212.5 )
							f90_arg0:setAlpha( 1 )
							f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
						end
					end
					
					if f89_arg1.interrupted then
						f89_local0( f89_arg0, f89_arg1 )
						return 
					else
						f89_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f89_arg0:setLeftRight( true, false, 410.37, 447.51 )
						f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
					end
				end
				
				CryptoIcon0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoIcon0:setLeftRight( true, false, 630.69, 667.83 )
				CryptoIcon0:setTopBottom( false, false, -19, 18.14 )
				CryptoIcon0:setAlpha( 0 )
				CryptoIcon0:registerEventHandler( "transition_complete_keyframe", f57_local8 )
				local CryptoCountNew0Frame2 = function ( CryptoCountNew0, event )
					local CryptoCountNew0Frame3 = function ( CryptoCountNew0, event )
						local CryptoCountNew0Frame4 = function ( CryptoCountNew0, event )
							local CryptoCountNew0Frame5 = function ( CryptoCountNew0, event )
								if not event.interrupted then
									CryptoCountNew0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								CryptoCountNew0:setLeftRight( true, false, -25.31, 46.38 )
								CryptoCountNew0:setTopBottom( false, false, -21.24, 18.76 )
								CryptoCountNew0:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CryptoCountNew0, event )
								else
									CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoCountNew0Frame5( CryptoCountNew0, event )
								return 
							else
								CryptoCountNew0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								CryptoCountNew0:setLeftRight( true, false, 54.69, 126.38 )
								CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame5 )
							end
						end
						
						if event.interrupted then
							CryptoCountNew0Frame4( CryptoCountNew0, event )
							return 
						else
							CryptoCountNew0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
							CryptoCountNew0:setLeftRight( true, false, 102.26, 173.95 )
							CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame4 )
						end
					end
					
					if event.interrupted then
						CryptoCountNew0Frame3( CryptoCountNew0, event )
						return 
					else
						CryptoCountNew0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
						CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame3 )
					end
				end
				
				CryptoCountNew0:completeAnimation()
				self.CryptoCountNew0:setLeftRight( true, false, 559, 630.69 )
				self.CryptoCountNew0:setTopBottom( false, false, -21.24, 18.76 )
				self.CryptoCountNew0:setAlpha( 0 )
				CryptoCountNew0Frame2( CryptoCountNew0, {} )
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						if not event.interrupted then
							Sound:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
						end
						Sound:setPlaySoundDirect( true )
						Sound:playSound( "uin_bm_key_earned", controller )
						if event.interrupted then
							self.clipFinished( Sound, event )
						else
							Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						Sound:playSound( "uin_bm_bar_fill_tail", controller )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( true )
				self.Sound:playSound( "uin_bm_bar_fill_main", controller )
				SoundFrame2( Sound, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.XpBarFrame:close()
		element.cryptokeyProgress:close()
		element.cryptokeyProgressForNewKey:close()
		element.CryptoCount:close()
		element.CryptoCountNew0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

