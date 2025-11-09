require( "ui.uieditor.widgets.AAR.XPbarFrame" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ContractCryptokeyBatch" )

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
	XpBarFrame:setTopBottom( false, true, -28, -5.74 )
	self:addElement( XpBarFrame )
	self.XpBarFrame = XpBarFrame
	
	local cryptokeyProgressBg = LUI.UIImage.new()
	cryptokeyProgressBg:setLeftRight( true, true, 88, -7 )
	cryptokeyProgressBg:setTopBottom( false, true, -24, -10 )
	cryptokeyProgressBg:setAlpha( 0.1 )
	self:addElement( cryptokeyProgressBg )
	self.cryptokeyProgressBg = cryptokeyProgressBg
	
	local cryptokeyProgress = LUI.UIImage.new()
	cryptokeyProgress:setLeftRight( true, true, 88, -7 )
	cryptokeyProgress:setTopBottom( false, true, -24, -10 )
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
	cryptokeyProgressForNewKey:setTopBottom( false, true, -24, -10 )
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
	MeterGlow:setTopBottom( true, false, 15.26, 51 )
	MeterGlow:setAlpha( 0.41 )
	MeterGlow:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterglow" ) )
	MeterGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterGlow )
	self.MeterGlow = MeterGlow
	
	local nextKeyText = LUI.UITightText.new()
	nextKeyText:setLeftRight( true, false, 83, 183.5 )
	nextKeyText:setTopBottom( false, true, -45, -25 )
	nextKeyText:setScale( 0.9 )
	nextKeyText:setText( Engine.Localize( "MPUI_NEXT_KEY_CAPS" ) )
	nextKeyText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextKeyText:setLetterSpacing( 0.5 )
	self:addElement( nextKeyText )
	self.nextKeyText = nextKeyText
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( true, false, -2, 23 )
	CryptoIcon:setTopBottom( false, false, -4, 21 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptoCount = LUI.UIText.new()
	CryptoCount:setLeftRight( true, false, 24.14, 84.83 )
	CryptoCount:setTopBottom( false, false, -3.24, 18.76 )
	CryptoCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	CryptoCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local keyCount = Engine.GetModelValue( model )
		if keyCount then
			CryptoCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", keyCount ) ) )
		end
	end )
	self:addElement( CryptoCount )
	self.CryptoCount = CryptoCount
	
	local CryptoKeyNewCount = LUI.UITightText.new()
	CryptoKeyNewCount:setLeftRight( true, false, 671.5, 869.5 )
	CryptoKeyNewCount:setTopBottom( false, false, -16.24, 13.76 )
	CryptoKeyNewCount:setRGB( 0.41, 0.74, 0.27 )
	CryptoKeyNewCount:setAlpha( 0 )
	CryptoKeyNewCount:setText( LocalizeToUpperString( "MPUI_BM_CRYPTOKEY_EARNED" ) )
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
	
	local ContractCryptokeyBatch = CoD.ContractCryptokeyBatch.new( menu, controller )
	ContractCryptokeyBatch:setLeftRight( true, false, 78, 352 )
	ContractCryptokeyBatch:setTopBottom( true, false, 1, 49.26 )
	ContractCryptokeyBatch:setAlpha( 0 )
	ContractCryptokeyBatch:subscribeToGlobalModel( controller, "CryptoKeyProgress", nil, function ( model )
		ContractCryptokeyBatch:setModel( model, controller )
	end )
	self:addElement( ContractCryptokeyBatch )
	self.ContractCryptokeyBatch = ContractCryptokeyBatch
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( false, false, -247, 247 )
	highlight:setTopBottom( true, false, -30.24, 77.76 )
	highlight:setRGB( 0.93, 0.73, 0.38 )
	highlight:setAlpha( 0 )
	highlight:setScale( 1.2 )
	highlight:setImage( RegisterImage( "uie_t7_hud_notficationhighlight" ) )
	highlight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 1 )
				self.clipFinished( XpBarFrame, {} )
				cryptokeyProgressBg:completeAnimation()
				self.cryptokeyProgressBg:setAlpha( 0.1 )
				self.clipFinished( cryptokeyProgressBg, {} )
				cryptokeyProgress:completeAnimation()
				self.cryptokeyProgress:setAlpha( 1 )
				self.clipFinished( cryptokeyProgress, {} )
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressForNewKey, {} )
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0.41 )
				self.clipFinished( MeterGlow, {} )
				nextKeyText:completeAnimation()
				self.nextKeyText:setText( Engine.Localize( "MPUI_NEXT_KEY_CAPS" ) )
				self.clipFinished( nextKeyText, {} )
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
				ContractCryptokeyBatch:completeAnimation()
				self.ContractCryptokeyBatch:setAlpha( 0 )
				self.clipFinished( ContractCryptokeyBatch, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
			end,
			NewXPNoNewKey = function ()
				self:setupElementClipCounter( 10 )
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
				ContractCryptokeyBatch:completeAnimation()
				self.ContractCryptokeyBatch:setAlpha( 0 )
				self.clipFinished( ContractCryptokeyBatch, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
			end,
			NewKey = function ()
				self:setupElementClipCounter( 16 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				local f11_local0 = function ( f12_arg0, f12_arg1 )
					local f12_local0 = function ( f13_arg0, f13_arg1 )
						local f13_local0 = function ( f14_arg0, f14_arg1 )
							if not f14_arg1.interrupted then
								f14_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f14_arg0:setAlpha( 1 )
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
							f13_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f13_arg0:registerEventHandler( "transition_complete_keyframe", f13_local0 )
						end
					end
					
					if f12_arg1.interrupted then
						f12_local0( f12_arg0, f12_arg1 )
						return 
					else
						f12_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						f12_arg0:setAlpha( 0 )
						f12_arg0:registerEventHandler( "transition_complete_keyframe", f12_local0 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f11_local0 )
				local f11_local1 = function ( f15_arg0, f15_arg1 )
					local f15_local0 = function ( f16_arg0, f16_arg1 )
						local f16_local0 = function ( f17_arg0, f17_arg1 )
							if not f17_arg1.interrupted then
								f17_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f17_arg0:setAlpha( 0.1 )
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
							f16_arg0:beginAnimation( "keyframe", 1330, false, false, CoD.TweenType.Linear )
							f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
						end
					end
					
					if f15_arg1.interrupted then
						f15_local0( f15_arg0, f15_arg1 )
						return 
					else
						f15_arg0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
						f15_arg0:setAlpha( 0 )
						f15_arg0:registerEventHandler( "transition_complete_keyframe", f15_local0 )
					end
				end
				
				cryptokeyProgressBg:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				cryptokeyProgressBg:setAlpha( 0.1 )
				cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", f11_local1 )
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
				local f11_local4 = function ( f28_arg0, f28_arg1 )
					local f28_local0 = function ( f29_arg0, f29_arg1 )
						local f29_local0 = function ( f30_arg0, f30_arg1 )
							if not f30_arg1.interrupted then
								f30_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f30_arg0:setAlpha( 1 )
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
							f29_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f29_arg0:registerEventHandler( "transition_complete_keyframe", f29_local0 )
						end
					end
					
					if f28_arg1.interrupted then
						f28_local0( f28_arg0, f28_arg1 )
						return 
					else
						f28_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f28_arg0:setAlpha( 0 )
						f28_arg0:registerEventHandler( "transition_complete_keyframe", f28_local0 )
					end
				end
				
				nextKeyText:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				nextKeyText:setAlpha( 1 )
				nextKeyText:registerEventHandler( "transition_complete_keyframe", f11_local4 )
				local f11_local5 = function ( f31_arg0, f31_arg1 )
					local f31_local0 = function ( f32_arg0, f32_arg1 )
						local f32_local0 = function ( f33_arg0, f33_arg1 )
							local f33_local0 = function ( f34_arg0, f34_arg1 )
								if not f34_arg1.interrupted then
									f34_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f34_arg0:setAlpha( 1 )
								if f34_arg1.interrupted then
									self.clipFinished( f34_arg0, f34_arg1 )
								else
									f34_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f33_arg1.interrupted then
								f33_local0( f33_arg0, f33_arg1 )
								return 
							else
								f33_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f33_arg0:registerEventHandler( "transition_complete_keyframe", f33_local0 )
							end
						end
						
						if f32_arg1.interrupted then
							f32_local0( f32_arg0, f32_arg1 )
							return 
						else
							f32_arg0:beginAnimation( "keyframe", 1249, false, false, CoD.TweenType.Linear )
							f32_arg0:registerEventHandler( "transition_complete_keyframe", f32_local0 )
						end
					end
					
					if f31_arg1.interrupted then
						f31_local0( f31_arg0, f31_arg1 )
						return 
					else
						f31_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f31_arg0:setAlpha( 0 )
						f31_arg0:registerEventHandler( "transition_complete_keyframe", f31_local0 )
					end
				end
				
				CryptoIcon:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				CryptoIcon:setAlpha( 1 )
				CryptoIcon:registerEventHandler( "transition_complete_keyframe", f11_local5 )
				local f11_local6 = function ( f35_arg0, f35_arg1 )
					local f35_local0 = function ( f36_arg0, f36_arg1 )
						local f36_local0 = function ( f37_arg0, f37_arg1 )
							local f37_local0 = function ( f38_arg0, f38_arg1 )
								if not f38_arg1.interrupted then
									f38_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f38_arg0:setRGB( 1, 1, 1 )
								f38_arg0:setAlpha( 1 )
								if f38_arg1.interrupted then
									self.clipFinished( f38_arg0, f38_arg1 )
								else
									f38_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f37_arg1.interrupted then
								f37_local0( f37_arg0, f37_arg1 )
								return 
							else
								f37_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f37_arg0:registerEventHandler( "transition_complete_keyframe", f37_local0 )
							end
						end
						
						if f36_arg1.interrupted then
							f36_local0( f36_arg0, f36_arg1 )
							return 
						else
							f36_arg0:beginAnimation( "keyframe", 1239, false, false, CoD.TweenType.Linear )
							f36_arg0:registerEventHandler( "transition_complete_keyframe", f36_local0 )
						end
					end
					
					if f35_arg1.interrupted then
						f35_local0( f35_arg0, f35_arg1 )
						return 
					else
						f35_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f35_arg0:setAlpha( 0 )
						f35_arg0:registerEventHandler( "transition_complete_keyframe", f35_local0 )
					end
				end
				
				CryptoCount:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				CryptoCount:setRGB( 1, 1, 1 )
				CryptoCount:setAlpha( 1 )
				CryptoCount:registerEventHandler( "transition_complete_keyframe", f11_local6 )
				local CryptoKeyNewCountFrame2 = function ( CryptoKeyNewCount, event )
					local CryptoKeyNewCountFrame3 = function ( CryptoKeyNewCount, event )
						local CryptoKeyNewCountFrame4 = function ( CryptoKeyNewCount, event )
							local CryptoKeyNewCountFrame5 = function ( CryptoKeyNewCount, event )
								local CryptoKeyNewCountFrame6 = function ( CryptoKeyNewCount, event )
									if not event.interrupted then
										CryptoKeyNewCount:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									end
									CryptoKeyNewCount:setLeftRight( true, false, 86.04, 359.54 )
									CryptoKeyNewCount:setTopBottom( false, false, -16.24, 13.76 )
									CryptoKeyNewCount:setRGB( 0.41, 0.74, 0.27 )
									CryptoKeyNewCount:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( CryptoKeyNewCount, event )
									else
										CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									CryptoKeyNewCountFrame6( CryptoKeyNewCount, event )
									return 
								else
									CryptoKeyNewCount:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
									CryptoKeyNewCount:setLeftRight( true, false, 166.04, 439.54 )
									CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame6 )
								end
							end
							
							if event.interrupted then
								CryptoKeyNewCountFrame5( CryptoKeyNewCount, event )
								return 
							else
								CryptoKeyNewCount:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
								CryptoKeyNewCount:setLeftRight( true, false, 214.44, 487.94 )
								CryptoKeyNewCount:setAlpha( 1 )
								CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoKeyNewCountFrame4( CryptoKeyNewCount, event )
							return 
						else
							CryptoKeyNewCount:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							CryptoKeyNewCount:setLeftRight( true, false, 450.34, 723.84 )
							CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame4 )
						end
					end
					
					if event.interrupted then
						CryptoKeyNewCountFrame3( CryptoKeyNewCount, event )
						return 
					else
						CryptoKeyNewCount:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
						CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame3 )
					end
				end
				
				CryptoKeyNewCount:completeAnimation()
				self.CryptoKeyNewCount:setLeftRight( true, false, 671.5, 945 )
				self.CryptoKeyNewCount:setTopBottom( false, false, -16.24, 13.76 )
				self.CryptoKeyNewCount:setRGB( 0.41, 0.74, 0.27 )
				self.CryptoKeyNewCount:setAlpha( 0 )
				CryptoKeyNewCountFrame2( CryptoKeyNewCount, {} )
				local f11_local8 = function ( f44_arg0, f44_arg1 )
					local f44_local0 = function ( f45_arg0, f45_arg1 )
						local f45_local0 = function ( f46_arg0, f46_arg1 )
							local f46_local0 = function ( f47_arg0, f47_arg1 )
								local f47_local0 = function ( f48_arg0, f48_arg1 )
									if not f48_arg1.interrupted then
										f48_arg0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
									end
									f48_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f48_arg0:setTopBottom( false, false, -19, 18.14 )
									f48_arg0:setAlpha( 0 )
									if f48_arg1.interrupted then
										self.clipFinished( f48_arg0, f48_arg1 )
									else
										f48_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f47_arg1.interrupted then
									f47_local0( f47_arg0, f47_arg1 )
									return 
								else
									f47_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									f47_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f47_arg0:setAlpha( 0 )
									f47_arg0:registerEventHandler( "transition_complete_keyframe", f47_local0 )
								end
							end
							
							if f46_arg1.interrupted then
								f46_local0( f46_arg0, f46_arg1 )
								return 
							else
								f46_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f46_arg0:setLeftRight( true, false, 127.16, 164.3 )
								f46_arg0:registerEventHandler( "transition_complete_keyframe", f46_local0 )
							end
						end
						
						if f45_arg1.interrupted then
							f45_local0( f45_arg0, f45_arg1 )
							return 
						else
							f45_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f45_arg0:setLeftRight( true, false, 175.36, 212.5 )
							f45_arg0:setAlpha( 1 )
							f45_arg0:registerEventHandler( "transition_complete_keyframe", f45_local0 )
						end
					end
					
					if f44_arg1.interrupted then
						f44_local0( f44_arg0, f44_arg1 )
						return 
					else
						f44_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f44_arg0:setLeftRight( true, false, 410.37, 447.51 )
						f44_arg0:registerEventHandler( "transition_complete_keyframe", f44_local0 )
					end
				end
				
				CryptoIcon0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoIcon0:setLeftRight( true, false, 630.69, 667.83 )
				CryptoIcon0:setTopBottom( false, false, -19, 18.14 )
				CryptoIcon0:setAlpha( 0 )
				CryptoIcon0:registerEventHandler( "transition_complete_keyframe", f11_local8 )
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
				ContractCryptokeyBatch:completeAnimation()
				self.ContractCryptokeyBatch:setAlpha( 0 )
				self.clipFinished( ContractCryptokeyBatch, {} )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
			end,
			NewKeyBatch = function ()
				self:setupElementClipCounter( 16 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				local XpBarFrameFrame2 = function ( XpBarFrame, event )
					local XpBarFrameFrame3 = function ( XpBarFrame, event )
						if not event.interrupted then
							XpBarFrame:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						XpBarFrame:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( XpBarFrame, event )
						else
							XpBarFrame:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						XpBarFrameFrame3( XpBarFrame, event )
						return 
					else
						XpBarFrame:beginAnimation( "keyframe", 2730, false, false, CoD.TweenType.Linear )
						XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame3 )
					end
				end
				
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 0 )
				XpBarFrameFrame2( XpBarFrame, {} )
				local cryptokeyProgressBgFrame2 = function ( cryptokeyProgressBg, event )
					local cryptokeyProgressBgFrame3 = function ( cryptokeyProgressBg, event )
						if not event.interrupted then
							cryptokeyProgressBg:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						cryptokeyProgressBg:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( cryptokeyProgressBg, event )
						else
							cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cryptokeyProgressBgFrame3( cryptokeyProgressBg, event )
						return 
					else
						cryptokeyProgressBg:beginAnimation( "keyframe", 2730, false, false, CoD.TweenType.Linear )
						cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressBgFrame3 )
					end
				end
				
				cryptokeyProgressBg:completeAnimation()
				self.cryptokeyProgressBg:setAlpha( 0 )
				cryptokeyProgressBgFrame2( cryptokeyProgressBg, {} )
				cryptokeyProgress:completeAnimation()
				self.cryptokeyProgress:setAlpha( 0 )
				self.clipFinished( cryptokeyProgress, {} )
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressForNewKey, {} )
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )
				local nextKeyTextFrame2 = function ( nextKeyText, event )
					local nextKeyTextFrame3 = function ( nextKeyText, event )
						if not event.interrupted then
							nextKeyText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						nextKeyText:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( nextKeyText, event )
						else
							nextKeyText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						nextKeyTextFrame3( nextKeyText, event )
						return 
					else
						nextKeyText:beginAnimation( "keyframe", 2730, false, false, CoD.TweenType.Linear )
						nextKeyText:registerEventHandler( "transition_complete_keyframe", nextKeyTextFrame3 )
					end
				end
				
				nextKeyText:completeAnimation()
				self.nextKeyText:setAlpha( 0 )
				nextKeyTextFrame2( nextKeyText, {} )
				CryptoIcon:completeAnimation()
				self.CryptoIcon:setAlpha( 1 )
				self.clipFinished( CryptoIcon, {} )
				CryptoCount:completeAnimation()
				self.CryptoCount:setRGB( 1, 1, 1 )
				self.CryptoCount:setAlpha( 1 )
				self.clipFinished( CryptoCount, {} )
				CryptoKeyNewCount:completeAnimation()
				self.CryptoKeyNewCount:setLeftRight( true, false, 189.5, 357.5 )
				self.CryptoKeyNewCount:setTopBottom( false, false, -13, 13 )
				self.CryptoKeyNewCount:setRGB( 0.97, 0.78, 0.23 )
				self.CryptoKeyNewCount:setAlpha( 0 )
				self.CryptoKeyNewCount:setText( LocalizeToUpperString( "MENU_BONUS_CRYPTOKEYS" ) )
				self.CryptoKeyNewCount:setLetterSpacing( 3 )
				self.clipFinished( CryptoKeyNewCount, {} )
				CryptoIcon0:completeAnimation()
				self.CryptoIcon0:setLeftRight( true, false, 88.94, 118.24 )
				self.CryptoIcon0:setTopBottom( false, false, -12.87, 15 )
				self.CryptoIcon0:setAlpha( 0 )
				self.clipFinished( CryptoIcon0, {} )
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
				local ContractCryptokeyBatchFrame2 = function ( ContractCryptokeyBatch, event )
					local ContractCryptokeyBatchFrame3 = function ( ContractCryptokeyBatch, event )
						local ContractCryptokeyBatchFrame4 = function ( ContractCryptokeyBatch, event )
							local ContractCryptokeyBatchFrame5 = function ( ContractCryptokeyBatch, event )
								local ContractCryptokeyBatchFrame6 = function ( ContractCryptokeyBatch, event )
									if not event.interrupted then
										ContractCryptokeyBatch:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
									end
									ContractCryptokeyBatch:setAlpha( 0 )
									ContractCryptokeyBatch:setScale( 1 )
									if event.interrupted then
										self.clipFinished( ContractCryptokeyBatch, event )
									else
										ContractCryptokeyBatch:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ContractCryptokeyBatchFrame6( ContractCryptokeyBatch, event )
									return 
								else
									ContractCryptokeyBatch:beginAnimation( "keyframe", 2220, false, false, CoD.TweenType.Linear )
									ContractCryptokeyBatch:registerEventHandler( "transition_complete_keyframe", ContractCryptokeyBatchFrame6 )
								end
							end
							
							if event.interrupted then
								ContractCryptokeyBatchFrame5( ContractCryptokeyBatch, event )
								return 
							else
								ContractCryptokeyBatch:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								ContractCryptokeyBatch:setScale( 1 )
								ContractCryptokeyBatch:registerEventHandler( "transition_complete_keyframe", ContractCryptokeyBatchFrame5 )
							end
						end
						
						if event.interrupted then
							ContractCryptokeyBatchFrame4( ContractCryptokeyBatch, event )
							return 
						else
							ContractCryptokeyBatch:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							ContractCryptokeyBatch:setScale( 0.95 )
							ContractCryptokeyBatch:registerEventHandler( "transition_complete_keyframe", ContractCryptokeyBatchFrame4 )
						end
					end
					
					if event.interrupted then
						ContractCryptokeyBatchFrame3( ContractCryptokeyBatch, event )
						return 
					else
						ContractCryptokeyBatch:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						ContractCryptokeyBatch:setAlpha( 1 )
						ContractCryptokeyBatch:setScale( 1 )
						ContractCryptokeyBatch:registerEventHandler( "transition_complete_keyframe", ContractCryptokeyBatchFrame3 )
					end
				end
				
				ContractCryptokeyBatch:completeAnimation()
				self.ContractCryptokeyBatch:setAlpha( 0 )
				self.ContractCryptokeyBatch:setScale( 4 )
				ContractCryptokeyBatchFrame2( ContractCryptokeyBatch, {} )
				local highlightFrame2 = function ( highlight, event )
					local highlightFrame3 = function ( highlight, event )
						local highlightFrame4 = function ( highlight, event )
							local highlightFrame5 = function ( highlight, event )
								if not event.interrupted then
									highlight:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								end
								highlight:setAlpha( 0 )
								highlight:setScale( 2 )
								if event.interrupted then
									self.clipFinished( highlight, event )
								else
									highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								highlightFrame5( highlight, event )
								return 
							else
								highlight:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								highlight:setAlpha( 0.25 )
								highlight:setScale( 1.53 )
								highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame5 )
							end
						end
						
						if event.interrupted then
							highlightFrame4( highlight, event )
							return 
						else
							highlight:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							highlight:setAlpha( 0.5 )
							highlight:setScale( 1.2 )
							highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame4 )
						end
					end
					
					if event.interrupted then
						highlightFrame3( highlight, event )
						return 
					else
						highlight:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						highlight:setScale( 1.03 )
						highlight:registerEventHandler( "transition_complete_keyframe", highlightFrame3 )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.highlight:setScale( 0.5 )
				highlightFrame2( highlight, {} )
			end
		},
		Retrieving = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 0 )
				self.clipFinished( XpBarFrame, {} )
				cryptokeyProgressBg:completeAnimation()
				self.cryptokeyProgressBg:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBg, {} )
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressForNewKey, {} )
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0 )
				self.clipFinished( MeterGlow, {} )
				nextKeyText:completeAnimation()
				self.nextKeyText:setText( Engine.Localize( "MPUI_BM_RETRIEVING_CRYPTOKEYS" ) )
				self.clipFinished( nextKeyText, {} )
			end
		},
		HidePixels = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 1 )
				self.clipFinished( XpBarFrame, {} )
				cryptokeyProgressBg:completeAnimation()
				self.cryptokeyProgressBg:setAlpha( 0.1 )
				self.clipFinished( cryptokeyProgressBg, {} )
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setAlpha( 1 )
				self.clipFinished( cryptokeyProgressForNewKey, {} )
				MeterGlow:completeAnimation()
				self.MeterGlow:setAlpha( 0.41 )
				self.clipFinished( MeterGlow, {} )
				nextKeyText:completeAnimation()
				self.nextKeyText:setText( Engine.Localize( "MPUI_NEXT_KEY_CAPS" ) )
				self.clipFinished( nextKeyText, {} )
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
				local f82_local0 = function ( f83_arg0, f83_arg1 )
					local f83_local0 = function ( f84_arg0, f84_arg1 )
						local f84_local0 = function ( f85_arg0, f85_arg1 )
							if not f85_arg1.interrupted then
								f85_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f85_arg0:setAlpha( 1 )
							if f85_arg1.interrupted then
								self.clipFinished( f85_arg0, f85_arg1 )
							else
								f85_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f84_arg1.interrupted then
							f84_local0( f84_arg0, f84_arg1 )
							return 
						else
							f84_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
						end
					end
					
					if f83_arg1.interrupted then
						f83_local0( f83_arg0, f83_arg1 )
						return 
					else
						f83_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						f83_arg0:setAlpha( 0 )
						f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f82_local0 )
				local f82_local1 = function ( f86_arg0, f86_arg1 )
					local f86_local0 = function ( f87_arg0, f87_arg1 )
						local f87_local0 = function ( f88_arg0, f88_arg1 )
							if not f88_arg1.interrupted then
								f88_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f88_arg0:setAlpha( 0.1 )
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
							f87_arg0:beginAnimation( "keyframe", 1330, false, false, CoD.TweenType.Linear )
							f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
						end
					end
					
					if f86_arg1.interrupted then
						f86_local0( f86_arg0, f86_arg1 )
						return 
					else
						f86_arg0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
						f86_arg0:setAlpha( 0 )
						f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
					end
				end
				
				cryptokeyProgressBg:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				cryptokeyProgressBg:setAlpha( 0.1 )
				cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", f82_local1 )
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
				local f82_local4 = function ( f99_arg0, f99_arg1 )
					local f99_local0 = function ( f100_arg0, f100_arg1 )
						local f100_local0 = function ( f101_arg0, f101_arg1 )
							if not f101_arg1.interrupted then
								f101_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f101_arg0:setAlpha( 1 )
							if f101_arg1.interrupted then
								self.clipFinished( f101_arg0, f101_arg1 )
							else
								f101_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f100_arg1.interrupted then
							f100_local0( f100_arg0, f100_arg1 )
							return 
						else
							f100_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f100_arg0:registerEventHandler( "transition_complete_keyframe", f100_local0 )
						end
					end
					
					if f99_arg1.interrupted then
						f99_local0( f99_arg0, f99_arg1 )
						return 
					else
						f99_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f99_arg0:setAlpha( 0 )
						f99_arg0:registerEventHandler( "transition_complete_keyframe", f99_local0 )
					end
				end
				
				nextKeyText:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				nextKeyText:setAlpha( 1 )
				nextKeyText:registerEventHandler( "transition_complete_keyframe", f82_local4 )
				local f82_local5 = function ( f102_arg0, f102_arg1 )
					local f102_local0 = function ( f103_arg0, f103_arg1 )
						local f103_local0 = function ( f104_arg0, f104_arg1 )
							local f104_local0 = function ( f105_arg0, f105_arg1 )
								if not f105_arg1.interrupted then
									f105_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f105_arg0:setAlpha( 1 )
								if f105_arg1.interrupted then
									self.clipFinished( f105_arg0, f105_arg1 )
								else
									f105_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f104_arg1.interrupted then
								f104_local0( f104_arg0, f104_arg1 )
								return 
							else
								f104_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f104_arg0:registerEventHandler( "transition_complete_keyframe", f104_local0 )
							end
						end
						
						if f103_arg1.interrupted then
							f103_local0( f103_arg0, f103_arg1 )
							return 
						else
							f103_arg0:beginAnimation( "keyframe", 1249, false, false, CoD.TweenType.Linear )
							f103_arg0:registerEventHandler( "transition_complete_keyframe", f103_local0 )
						end
					end
					
					if f102_arg1.interrupted then
						f102_local0( f102_arg0, f102_arg1 )
						return 
					else
						f102_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f102_arg0:setAlpha( 0 )
						f102_arg0:registerEventHandler( "transition_complete_keyframe", f102_local0 )
					end
				end
				
				CryptoIcon:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				CryptoIcon:setAlpha( 1 )
				CryptoIcon:registerEventHandler( "transition_complete_keyframe", f82_local5 )
				local f82_local6 = function ( f106_arg0, f106_arg1 )
					local f106_local0 = function ( f107_arg0, f107_arg1 )
						local f107_local0 = function ( f108_arg0, f108_arg1 )
							local f108_local0 = function ( f109_arg0, f109_arg1 )
								if not f109_arg1.interrupted then
									f109_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f109_arg0:setRGB( 1, 1, 1 )
								f109_arg0:setAlpha( 1 )
								if f109_arg1.interrupted then
									self.clipFinished( f109_arg0, f109_arg1 )
								else
									f109_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f108_arg1.interrupted then
								f108_local0( f108_arg0, f108_arg1 )
								return 
							else
								f108_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f108_arg0:registerEventHandler( "transition_complete_keyframe", f108_local0 )
							end
						end
						
						if f107_arg1.interrupted then
							f107_local0( f107_arg0, f107_arg1 )
							return 
						else
							f107_arg0:beginAnimation( "keyframe", 1239, false, false, CoD.TweenType.Linear )
							f107_arg0:registerEventHandler( "transition_complete_keyframe", f107_local0 )
						end
					end
					
					if f106_arg1.interrupted then
						f106_local0( f106_arg0, f106_arg1 )
						return 
					else
						f106_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f106_arg0:setAlpha( 0 )
						f106_arg0:registerEventHandler( "transition_complete_keyframe", f106_local0 )
					end
				end
				
				CryptoCount:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				CryptoCount:setRGB( 1, 1, 1 )
				CryptoCount:setAlpha( 1 )
				CryptoCount:registerEventHandler( "transition_complete_keyframe", f82_local6 )
				local f82_local7 = function ( f110_arg0, f110_arg1 )
					local f110_local0 = function ( f111_arg0, f111_arg1 )
						local f111_local0 = function ( f112_arg0, f112_arg1 )
							local f112_local0 = function ( f113_arg0, f113_arg1 )
								if not f113_arg1.interrupted then
									f113_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								f113_arg0:setLeftRight( true, false, 86.04, 359.54 )
								f113_arg0:setTopBottom( false, false, -16.24, 13.76 )
								f113_arg0:setAlpha( 0 )
								if f113_arg1.interrupted then
									self.clipFinished( f113_arg0, f113_arg1 )
								else
									f113_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f112_arg1.interrupted then
								f112_local0( f112_arg0, f112_arg1 )
								return 
							else
								f112_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f112_arg0:setLeftRight( true, false, 166.04, 439.54 )
								f112_arg0:registerEventHandler( "transition_complete_keyframe", f112_local0 )
							end
						end
						
						if f111_arg1.interrupted then
							f111_local0( f111_arg0, f111_arg1 )
							return 
						else
							f111_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f111_arg0:setLeftRight( true, false, 214.44, 487.94 )
							f111_arg0:setAlpha( 1 )
							f111_arg0:registerEventHandler( "transition_complete_keyframe", f111_local0 )
						end
					end
					
					if f110_arg1.interrupted then
						f110_local0( f110_arg0, f110_arg1 )
						return 
					else
						f110_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f110_arg0:setLeftRight( true, false, 450.34, 723.84 )
						f110_arg0:registerEventHandler( "transition_complete_keyframe", f110_local0 )
					end
				end
				
				CryptoKeyNewCount:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoKeyNewCount:setLeftRight( true, false, 671.5, 945 )
				CryptoKeyNewCount:setTopBottom( false, false, -16.24, 13.76 )
				CryptoKeyNewCount:setAlpha( 0 )
				CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", f82_local7 )
				local f82_local8 = function ( f114_arg0, f114_arg1 )
					local f114_local0 = function ( f115_arg0, f115_arg1 )
						local f115_local0 = function ( f116_arg0, f116_arg1 )
							local f116_local0 = function ( f117_arg0, f117_arg1 )
								local f117_local0 = function ( f118_arg0, f118_arg1 )
									if not f118_arg1.interrupted then
										f118_arg0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
									end
									f118_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f118_arg0:setTopBottom( false, false, -19, 18.14 )
									f118_arg0:setAlpha( 0 )
									if f118_arg1.interrupted then
										self.clipFinished( f118_arg0, f118_arg1 )
									else
										f118_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f117_arg1.interrupted then
									f117_local0( f117_arg0, f117_arg1 )
									return 
								else
									f117_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									f117_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f117_arg0:setAlpha( 0 )
									f117_arg0:registerEventHandler( "transition_complete_keyframe", f117_local0 )
								end
							end
							
							if f116_arg1.interrupted then
								f116_local0( f116_arg0, f116_arg1 )
								return 
							else
								f116_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f116_arg0:setLeftRight( true, false, 127.16, 164.3 )
								f116_arg0:registerEventHandler( "transition_complete_keyframe", f116_local0 )
							end
						end
						
						if f115_arg1.interrupted then
							f115_local0( f115_arg0, f115_arg1 )
							return 
						else
							f115_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f115_arg0:setLeftRight( true, false, 175.36, 212.5 )
							f115_arg0:setAlpha( 1 )
							f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
						end
					end
					
					if f114_arg1.interrupted then
						f114_local0( f114_arg0, f114_arg1 )
						return 
					else
						f114_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f114_arg0:setLeftRight( true, false, 410.37, 447.51 )
						f114_arg0:registerEventHandler( "transition_complete_keyframe", f114_local0 )
					end
				end
				
				CryptoIcon0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoIcon0:setLeftRight( true, false, 630.69, 667.83 )
				CryptoIcon0:setTopBottom( false, false, -19, 18.14 )
				CryptoIcon0:setAlpha( 0 )
				CryptoIcon0:registerEventHandler( "transition_complete_keyframe", f82_local8 )
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
			end,
			NewKeyBatch = function ()
				self:setupElementClipCounter( 14 )
				cryptokeyProgressBgGrey:completeAnimation()
				self.cryptokeyProgressBgGrey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressBgGrey, {} )
				cachitBG0:completeAnimation()
				self.cachitBG0:setAlpha( 0 )
				self.clipFinished( cachitBG0, {} )
				local f125_local0 = function ( f126_arg0, f126_arg1 )
					local f126_local0 = function ( f127_arg0, f127_arg1 )
						local f127_local0 = function ( f128_arg0, f128_arg1 )
							if not f128_arg1.interrupted then
								f128_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f128_arg0:setAlpha( 1 )
							if f128_arg1.interrupted then
								self.clipFinished( f128_arg0, f128_arg1 )
							else
								f128_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f127_arg1.interrupted then
							f127_local0( f127_arg0, f127_arg1 )
							return 
						else
							f127_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f127_arg0:registerEventHandler( "transition_complete_keyframe", f127_local0 )
						end
					end
					
					if f126_arg1.interrupted then
						f126_local0( f126_arg0, f126_arg1 )
						return 
					else
						f126_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						f126_arg0:setAlpha( 0 )
						f126_arg0:registerEventHandler( "transition_complete_keyframe", f126_local0 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", f125_local0 )
				local f125_local1 = function ( f129_arg0, f129_arg1 )
					local f129_local0 = function ( f130_arg0, f130_arg1 )
						local f130_local0 = function ( f131_arg0, f131_arg1 )
							if not f131_arg1.interrupted then
								f131_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f131_arg0:setAlpha( 0.1 )
							if f131_arg1.interrupted then
								self.clipFinished( f131_arg0, f131_arg1 )
							else
								f131_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f130_arg1.interrupted then
							f130_local0( f130_arg0, f130_arg1 )
							return 
						else
							f130_arg0:beginAnimation( "keyframe", 1330, false, false, CoD.TweenType.Linear )
							f130_arg0:registerEventHandler( "transition_complete_keyframe", f130_local0 )
						end
					end
					
					if f129_arg1.interrupted then
						f129_local0( f129_arg0, f129_arg1 )
						return 
					else
						f129_arg0:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
						f129_arg0:setAlpha( 0 )
						f129_arg0:registerEventHandler( "transition_complete_keyframe", f129_local0 )
					end
				end
				
				cryptokeyProgressBg:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				cryptokeyProgressBg:setAlpha( 0.1 )
				cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", f125_local1 )
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
				local f125_local4 = function ( f142_arg0, f142_arg1 )
					local f142_local0 = function ( f143_arg0, f143_arg1 )
						local f143_local0 = function ( f144_arg0, f144_arg1 )
							if not f144_arg1.interrupted then
								f144_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							end
							f144_arg0:setAlpha( 1 )
							if f144_arg1.interrupted then
								self.clipFinished( f144_arg0, f144_arg1 )
							else
								f144_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f143_arg1.interrupted then
							f143_local0( f143_arg0, f143_arg1 )
							return 
						else
							f143_arg0:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							f143_arg0:registerEventHandler( "transition_complete_keyframe", f143_local0 )
						end
					end
					
					if f142_arg1.interrupted then
						f142_local0( f142_arg0, f142_arg1 )
						return 
					else
						f142_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f142_arg0:setAlpha( 0 )
						f142_arg0:registerEventHandler( "transition_complete_keyframe", f142_local0 )
					end
				end
				
				nextKeyText:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				nextKeyText:setAlpha( 1 )
				nextKeyText:registerEventHandler( "transition_complete_keyframe", f125_local4 )
				local f125_local5 = function ( f145_arg0, f145_arg1 )
					local f145_local0 = function ( f146_arg0, f146_arg1 )
						local f146_local0 = function ( f147_arg0, f147_arg1 )
							local f147_local0 = function ( f148_arg0, f148_arg1 )
								if not f148_arg1.interrupted then
									f148_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f148_arg0:setAlpha( 1 )
								if f148_arg1.interrupted then
									self.clipFinished( f148_arg0, f148_arg1 )
								else
									f148_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f147_arg1.interrupted then
								f147_local0( f147_arg0, f147_arg1 )
								return 
							else
								f147_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f147_arg0:registerEventHandler( "transition_complete_keyframe", f147_local0 )
							end
						end
						
						if f146_arg1.interrupted then
							f146_local0( f146_arg0, f146_arg1 )
							return 
						else
							f146_arg0:beginAnimation( "keyframe", 1249, false, false, CoD.TweenType.Linear )
							f146_arg0:registerEventHandler( "transition_complete_keyframe", f146_local0 )
						end
					end
					
					if f145_arg1.interrupted then
						f145_local0( f145_arg0, f145_arg1 )
						return 
					else
						f145_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f145_arg0:setAlpha( 0 )
						f145_arg0:registerEventHandler( "transition_complete_keyframe", f145_local0 )
					end
				end
				
				CryptoIcon:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				CryptoIcon:setAlpha( 1 )
				CryptoIcon:registerEventHandler( "transition_complete_keyframe", f125_local5 )
				local f125_local6 = function ( f149_arg0, f149_arg1 )
					local f149_local0 = function ( f150_arg0, f150_arg1 )
						local f150_local0 = function ( f151_arg0, f151_arg1 )
							local f151_local0 = function ( f152_arg0, f152_arg1 )
								if not f152_arg1.interrupted then
									f152_arg0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								f152_arg0:setRGB( 1, 1, 1 )
								f152_arg0:setAlpha( 1 )
								if f152_arg1.interrupted then
									self.clipFinished( f152_arg0, f152_arg1 )
								else
									f152_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f151_arg1.interrupted then
								f151_local0( f151_arg0, f151_arg1 )
								return 
							else
								f151_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								f151_arg0:registerEventHandler( "transition_complete_keyframe", f151_local0 )
							end
						end
						
						if f150_arg1.interrupted then
							f150_local0( f150_arg0, f150_arg1 )
							return 
						else
							f150_arg0:beginAnimation( "keyframe", 1239, false, false, CoD.TweenType.Linear )
							f150_arg0:registerEventHandler( "transition_complete_keyframe", f150_local0 )
						end
					end
					
					if f149_arg1.interrupted then
						f149_local0( f149_arg0, f149_arg1 )
						return 
					else
						f149_arg0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						f149_arg0:setAlpha( 0 )
						f149_arg0:registerEventHandler( "transition_complete_keyframe", f149_local0 )
					end
				end
				
				CryptoCount:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				CryptoCount:setRGB( 1, 1, 1 )
				CryptoCount:setAlpha( 1 )
				CryptoCount:registerEventHandler( "transition_complete_keyframe", f125_local6 )
				local f125_local7 = function ( f153_arg0, f153_arg1 )
					local f153_local0 = function ( f154_arg0, f154_arg1 )
						local f154_local0 = function ( f155_arg0, f155_arg1 )
							local f155_local0 = function ( f156_arg0, f156_arg1 )
								if not f156_arg1.interrupted then
									f156_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								f156_arg0:setLeftRight( true, false, 86.04, 359.54 )
								f156_arg0:setTopBottom( false, false, -16.24, 13.76 )
								f156_arg0:setAlpha( 0 )
								if f156_arg1.interrupted then
									self.clipFinished( f156_arg0, f156_arg1 )
								else
									f156_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f155_arg1.interrupted then
								f155_local0( f155_arg0, f155_arg1 )
								return 
							else
								f155_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f155_arg0:setLeftRight( true, false, 166.04, 439.54 )
								f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
							end
						end
						
						if f154_arg1.interrupted then
							f154_local0( f154_arg0, f154_arg1 )
							return 
						else
							f154_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f154_arg0:setLeftRight( true, false, 214.44, 487.94 )
							f154_arg0:setAlpha( 1 )
							f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
						end
					end
					
					if f153_arg1.interrupted then
						f153_local0( f153_arg0, f153_arg1 )
						return 
					else
						f153_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f153_arg0:setLeftRight( true, false, 450.34, 723.84 )
						f153_arg0:registerEventHandler( "transition_complete_keyframe", f153_local0 )
					end
				end
				
				CryptoKeyNewCount:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoKeyNewCount:setLeftRight( true, false, 671.5, 945 )
				CryptoKeyNewCount:setTopBottom( false, false, -16.24, 13.76 )
				CryptoKeyNewCount:setAlpha( 0 )
				CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", f125_local7 )
				local f125_local8 = function ( f157_arg0, f157_arg1 )
					local f157_local0 = function ( f158_arg0, f158_arg1 )
						local f158_local0 = function ( f159_arg0, f159_arg1 )
							local f159_local0 = function ( f160_arg0, f160_arg1 )
								local f160_local0 = function ( f161_arg0, f161_arg1 )
									if not f161_arg1.interrupted then
										f161_arg0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
									end
									f161_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f161_arg0:setTopBottom( false, false, -19, 18.14 )
									f161_arg0:setAlpha( 0 )
									if f161_arg1.interrupted then
										self.clipFinished( f161_arg0, f161_arg1 )
									else
										f161_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f160_arg1.interrupted then
									f160_local0( f160_arg0, f160_arg1 )
									return 
								else
									f160_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									f160_arg0:setLeftRight( true, false, 47.24, 84.38 )
									f160_arg0:setAlpha( 0 )
									f160_arg0:registerEventHandler( "transition_complete_keyframe", f160_local0 )
								end
							end
							
							if f159_arg1.interrupted then
								f159_local0( f159_arg0, f159_arg1 )
								return 
							else
								f159_arg0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								f159_arg0:setLeftRight( true, false, 127.16, 164.3 )
								f159_arg0:registerEventHandler( "transition_complete_keyframe", f159_local0 )
							end
						end
						
						if f158_arg1.interrupted then
							f158_local0( f158_arg0, f158_arg1 )
							return 
						else
							f158_arg0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							f158_arg0:setLeftRight( true, false, 175.36, 212.5 )
							f158_arg0:setAlpha( 1 )
							f158_arg0:registerEventHandler( "transition_complete_keyframe", f158_local0 )
						end
					end
					
					if f157_arg1.interrupted then
						f157_local0( f157_arg0, f157_arg1 )
						return 
					else
						f157_arg0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						f157_arg0:setLeftRight( true, false, 410.37, 447.51 )
						f157_arg0:registerEventHandler( "transition_complete_keyframe", f157_local0 )
					end
				end
				
				CryptoIcon0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoIcon0:setLeftRight( true, false, 630.69, 667.83 )
				CryptoIcon0:setTopBottom( false, false, -19, 18.14 )
				CryptoIcon0:setAlpha( 0 )
				CryptoIcon0:registerEventHandler( "transition_complete_keyframe", f125_local8 )
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
	self:mergeStateConditions( {
		{
			stateName = "Retrieving",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "CryptoKeyProgress.keyCount", -1 )
			end
		},
		{
			stateName = "HidePixels",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.XpBarFrame:close()
		element.ContractCryptokeyBatch:close()
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

