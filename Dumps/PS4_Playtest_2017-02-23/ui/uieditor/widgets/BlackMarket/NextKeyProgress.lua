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
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local cryptokeyProgressBgGrey = LUI.UIImage.new()
	cryptokeyProgressBgGrey:setLeftRight( 0, 1, 0, 0 )
	cryptokeyProgressBgGrey:setTopBottom( 0, 1, 1, -1 )
	cryptokeyProgressBgGrey:setRGB( 0.16, 0.16, 0.16 )
	cryptokeyProgressBgGrey:setAlpha( 0 )
	self:addElement( cryptokeyProgressBgGrey )
	self.cryptokeyProgressBgGrey = cryptokeyProgressBgGrey
	
	local cachitBG0 = LUI.UIImage.new()
	cachitBG0:setLeftRight( 0, 1, -2, 2 )
	cachitBG0:setTopBottom( 0, 1, -2, 2 )
	cachitBG0:setAlpha( 0 )
	cachitBG0:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrfull" ) )
	cachitBG0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	cachitBG0:setShaderVector( 0, 0, 0, 0, 0 )
	cachitBG0:setupNineSliceShader( 6, 6 )
	self:addElement( cachitBG0 )
	self.cachitBG0 = cachitBG0
	
	local XpBarFrame = CoD.XPbarFrame.new( menu, controller )
	XpBarFrame:setLeftRight( 0, 1, 128, -6 )
	XpBarFrame:setTopBottom( 1, 1, -42, -9 )
	self:addElement( XpBarFrame )
	self.XpBarFrame = XpBarFrame
	
	local cryptokeyProgressBg = LUI.UIImage.new()
	cryptokeyProgressBg:setLeftRight( 0, 1, 132, -10 )
	cryptokeyProgressBg:setTopBottom( 1, 1, -36, -15 )
	cryptokeyProgressBg:setAlpha( 0.1 )
	self:addElement( cryptokeyProgressBg )
	self.cryptokeyProgressBg = cryptokeyProgressBg
	
	local cryptokeyProgress = LUI.UIImage.new()
	cryptokeyProgress:setLeftRight( 0, 1, 132, -10 )
	cryptokeyProgress:setTopBottom( 1, 1, -36, -15 )
	cryptokeyProgress:setAlpha( 0 )
	cryptokeyProgress:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	cryptokeyProgress:setShaderVector( 1, 0, 0, 0, 0 )
	cryptokeyProgress:setShaderVector( 2, 1, 0, 0, 0 )
	cryptokeyProgress:setShaderVector( 3, 0, 0, 0, 0 )
	cryptokeyProgress:setShaderVector( 4, 0, 0, 0, 0 )
	cryptokeyProgress:subscribeToGlobalModel( controller, "CryptoKeyProgress", "progress", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cryptokeyProgress:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( cryptokeyProgress )
	self.cryptokeyProgress = cryptokeyProgress
	
	local cryptokeyProgressForNewKey = LUI.UIImage.new()
	cryptokeyProgressForNewKey:setLeftRight( 0, 1, 132, -10 )
	cryptokeyProgressForNewKey:setTopBottom( 1, 1, -36, -15 )
	cryptokeyProgressForNewKey:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	cryptokeyProgressForNewKey:setShaderVector( 1, 0, 0, 0, 0 )
	cryptokeyProgressForNewKey:setShaderVector( 2, 1, 0, 0, 0 )
	cryptokeyProgressForNewKey:setShaderVector( 3, 0, 0, 0, 0 )
	cryptokeyProgressForNewKey:setShaderVector( 4, 0, 0, 0, 0 )
	cryptokeyProgressForNewKey:subscribeToGlobalModel( controller, "CryptoKeyProgress", "animProgress", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cryptokeyProgressForNewKey:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( cryptokeyProgressForNewKey )
	self.cryptokeyProgressForNewKey = cryptokeyProgressForNewKey
	
	local MeterGlow = LUI.UIImage.new()
	MeterGlow:setLeftRight( 0, 1, 125, -11 )
	MeterGlow:setTopBottom( 0, 0, 23, 77 )
	MeterGlow:setAlpha( 0.41 )
	MeterGlow:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterglow" ) )
	MeterGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterGlow )
	self.MeterGlow = MeterGlow
	
	local nextKeyText = LUI.UITightText.new()
	nextKeyText:setLeftRight( 0, 0, 124, 275 )
	nextKeyText:setTopBottom( 1, 1, -67, -37 )
	nextKeyText:setScale( 0.9 )
	nextKeyText:setText( Engine.Localize( "MPUI_NEXT_KEY_CAPS" ) )
	nextKeyText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextKeyText:setLetterSpacing( 0.5 )
	self:addElement( nextKeyText )
	self.nextKeyText = nextKeyText
	
	local CryptoIcon = LUI.UIImage.new()
	CryptoIcon:setLeftRight( 0, 0, -3, 35 )
	CryptoIcon:setTopBottom( 0.5, 0.5, -6, 32 )
	CryptoIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon )
	self.CryptoIcon = CryptoIcon
	
	local CryptoCount = LUI.UIText.new()
	CryptoCount:setLeftRight( 0, 0, 36, 127 )
	CryptoCount:setTopBottom( 0.5, 0.5, -5, 28 )
	CryptoCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CryptoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	CryptoCount:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptoCount:setText( Engine.Localize( SetValueIfNumberEqualTo( -1, "-", modelValue ) ) )
		end
	end )
	self:addElement( CryptoCount )
	self.CryptoCount = CryptoCount
	
	local CryptoKeyNewCount = LUI.UITightText.new()
	CryptoKeyNewCount:setLeftRight( 0, 0, 1007, 1417 )
	CryptoKeyNewCount:setTopBottom( 0.5, 0.5, -24, 21 )
	CryptoKeyNewCount:setRGB( 0.41, 0.74, 0.27 )
	CryptoKeyNewCount:setAlpha( 0 )
	CryptoKeyNewCount:setText( Engine.Localize( "MPUI_BM_CRYPTOKEY_EARNED" ) )
	CryptoKeyNewCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CryptoKeyNewCount:setLetterSpacing( 1 )
	self:addElement( CryptoKeyNewCount )
	self.CryptoKeyNewCount = CryptoKeyNewCount
	
	local CryptoIcon0 = LUI.UIImage.new()
	CryptoIcon0:setLeftRight( 0, 0, 946, 1002 )
	CryptoIcon0:setTopBottom( 0.5, 0.5, -29, 27 )
	CryptoIcon0:setAlpha( 0 )
	CryptoIcon0:setImage( RegisterImage( "uie_t7_icon_blackmarket_cryptokey" ) )
	self:addElement( CryptoIcon0 )
	self.CryptoIcon0 = CryptoIcon0
	
	local CryptoCountNew0 = LUI.UIText.new()
	CryptoCountNew0:setLeftRight( 0, 0, 838, 946 )
	CryptoCountNew0:setTopBottom( 0.5, 0.5, -32, 28 )
	CryptoCountNew0:setAlpha( 0 )
	CryptoCountNew0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CryptoCountNew0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	CryptoCountNew0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CryptoCountNew0:subscribeToGlobalModel( controller, "CryptoKeyProgress", "keyCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CryptoCountNew0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CryptoCountNew0 )
	self.CryptoCountNew0 = CryptoCountNew0
	
	local Sound = LUI.UIElement.new()
	Sound:setLeftRight( 0, 0, -211, -139 )
	Sound:setTopBottom( 0, 0, 53, 125 )
	Sound:setPlaySoundDirect( true )
	self:addElement( Sound )
	self.Sound = Sound
	
	self.resetProperties = function ()
		cryptokeyProgress:completeAnimation()
		cryptokeyProgressForNewKey:completeAnimation()
		Sound:completeAnimation()
		MeterGlow:completeAnimation()
		cryptokeyProgressBg:completeAnimation()
		CryptoIcon:completeAnimation()
		nextKeyText:completeAnimation()
		CryptoCount:completeAnimation()
		CryptoKeyNewCount:completeAnimation()
		CryptoIcon0:completeAnimation()
		XpBarFrame:completeAnimation()
		CryptoCountNew0:completeAnimation()
		cryptokeyProgress:setAlpha( 0 )
		cryptokeyProgressForNewKey:setRGB( 1, 1, 1 )
		cryptokeyProgressForNewKey:setAlpha( 1 )
		Sound:setPlaySoundDirect( true )
		Sound:playSound( "uin_bm_bar_fill_main", controller )
		MeterGlow:setRGB( 1, 1, 1 )
		MeterGlow:setAlpha( 0.41 )
		cryptokeyProgressBg:setAlpha( 0.1 )
		CryptoIcon:setAlpha( 1 )
		nextKeyText:setAlpha( 1 )
		nextKeyText:setText( Engine.Localize( "MPUI_NEXT_KEY_CAPS" ) )
		CryptoCount:setRGB( 1, 1, 1 )
		CryptoCount:setAlpha( 1 )
		CryptoKeyNewCount:setLeftRight( 0, 0, 1007, 1417 )
		CryptoKeyNewCount:setTopBottom( 0.5, 0.5, -24, 21 )
		CryptoKeyNewCount:setAlpha( 0 )
		CryptoIcon0:setLeftRight( 0, 0, 946, 1002 )
		CryptoIcon0:setTopBottom( 0.5, 0.5, -29, 27 )
		CryptoIcon0:setAlpha( 0 )
		XpBarFrame:setAlpha( 1 )
		CryptoCountNew0:setLeftRight( 0, 0, 838, 946 )
		CryptoCountNew0:setTopBottom( 0.5, 0.5, -32, 28 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				cryptokeyProgress:completeAnimation()
				self.cryptokeyProgress:setAlpha( 1 )
				self.clipFinished( cryptokeyProgress, {} )
				cryptokeyProgressForNewKey:completeAnimation()
				self.cryptokeyProgressForNewKey:setAlpha( 0 )
				self.clipFinished( cryptokeyProgressForNewKey, {} )
			end,
			NewXPNoNewKey = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
				local SoundFrame2 = function ( Sound, event )
					if not event.interrupted then
						Sound:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Sound:playSound( "uin_bm_bar_fill_tail", controller )
					if event.interrupted then
						self.clipFinished( Sound, event )
					else
						Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "uin_bm_bar_fill_main", controller )
				SoundFrame2( Sound, {} )
			end,
			NewKey = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local XpBarFrameFrame2 = function ( XpBarFrame, event )
					local XpBarFrameFrame3 = function ( XpBarFrame, event )
						local XpBarFrameFrame4 = function ( XpBarFrame, event )
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
							XpBarFrameFrame4( XpBarFrame, event )
							return 
						else
							XpBarFrame:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame4 )
						end
					end
					
					if event.interrupted then
						XpBarFrameFrame3( XpBarFrame, event )
						return 
					else
						XpBarFrame:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						XpBarFrame:setAlpha( 0 )
						XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame3 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame2 )
				local cryptokeyProgressBgFrame2 = function ( cryptokeyProgressBg, event )
					local cryptokeyProgressBgFrame3 = function ( cryptokeyProgressBg, event )
						local cryptokeyProgressBgFrame4 = function ( cryptokeyProgressBg, event )
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
							cryptokeyProgressBgFrame4( cryptokeyProgressBg, event )
							return 
						else
							cryptokeyProgressBg:beginAnimation( "keyframe", 1330, false, false, CoD.TweenType.Linear )
							cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressBgFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyProgressBgFrame3( cryptokeyProgressBg, event )
						return 
					else
						cryptokeyProgressBg:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
						cryptokeyProgressBg:setAlpha( 0 )
						cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressBgFrame3 )
					end
				end
				
				cryptokeyProgressBg:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				cryptokeyProgressBg:setAlpha( 0.1 )
				cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressBgFrame2 )
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
				local nextKeyTextFrame2 = function ( nextKeyText, event )
					local nextKeyTextFrame3 = function ( nextKeyText, event )
						local nextKeyTextFrame4 = function ( nextKeyText, event )
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
							nextKeyTextFrame4( nextKeyText, event )
							return 
						else
							nextKeyText:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							nextKeyText:registerEventHandler( "transition_complete_keyframe", nextKeyTextFrame4 )
						end
					end
					
					if event.interrupted then
						nextKeyTextFrame3( nextKeyText, event )
						return 
					else
						nextKeyText:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						nextKeyText:setAlpha( 0 )
						nextKeyText:registerEventHandler( "transition_complete_keyframe", nextKeyTextFrame3 )
					end
				end
				
				nextKeyText:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				nextKeyText:setAlpha( 1 )
				nextKeyText:registerEventHandler( "transition_complete_keyframe", nextKeyTextFrame2 )
				local CryptoIconFrame2 = function ( CryptoIcon, event )
					local CryptoIconFrame3 = function ( CryptoIcon, event )
						local CryptoIconFrame4 = function ( CryptoIcon, event )
							local CryptoIconFrame5 = function ( CryptoIcon, event )
								if not event.interrupted then
									CryptoIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								CryptoIcon:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( CryptoIcon, event )
								else
									CryptoIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoIconFrame5( CryptoIcon, event )
								return 
							else
								CryptoIcon:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								CryptoIcon:registerEventHandler( "transition_complete_keyframe", CryptoIconFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoIconFrame4( CryptoIcon, event )
							return 
						else
							CryptoIcon:beginAnimation( "keyframe", 1249, false, false, CoD.TweenType.Linear )
							CryptoIcon:registerEventHandler( "transition_complete_keyframe", CryptoIconFrame4 )
						end
					end
					
					if event.interrupted then
						CryptoIconFrame3( CryptoIcon, event )
						return 
					else
						CryptoIcon:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						CryptoIcon:setAlpha( 0 )
						CryptoIcon:registerEventHandler( "transition_complete_keyframe", CryptoIconFrame3 )
					end
				end
				
				CryptoIcon:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				CryptoIcon:setAlpha( 1 )
				CryptoIcon:registerEventHandler( "transition_complete_keyframe", CryptoIconFrame2 )
				local CryptoCountFrame2 = function ( CryptoCount, event )
					local CryptoCountFrame3 = function ( CryptoCount, event )
						local CryptoCountFrame4 = function ( CryptoCount, event )
							local CryptoCountFrame5 = function ( CryptoCount, event )
								if not event.interrupted then
									CryptoCount:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								CryptoCount:setRGB( 1, 1, 1 )
								CryptoCount:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( CryptoCount, event )
								else
									CryptoCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoCountFrame5( CryptoCount, event )
								return 
							else
								CryptoCount:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								CryptoCount:registerEventHandler( "transition_complete_keyframe", CryptoCountFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoCountFrame4( CryptoCount, event )
							return 
						else
							CryptoCount:beginAnimation( "keyframe", 1239, false, false, CoD.TweenType.Linear )
							CryptoCount:registerEventHandler( "transition_complete_keyframe", CryptoCountFrame4 )
						end
					end
					
					if event.interrupted then
						CryptoCountFrame3( CryptoCount, event )
						return 
					else
						CryptoCount:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						CryptoCount:setAlpha( 0 )
						CryptoCount:registerEventHandler( "transition_complete_keyframe", CryptoCountFrame3 )
					end
				end
				
				CryptoCount:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				CryptoCount:setRGB( 1, 1, 1 )
				CryptoCount:setAlpha( 1 )
				CryptoCount:registerEventHandler( "transition_complete_keyframe", CryptoCountFrame2 )
				local CryptoKeyNewCountFrame2 = function ( CryptoKeyNewCount, event )
					local CryptoKeyNewCountFrame3 = function ( CryptoKeyNewCount, event )
						local CryptoKeyNewCountFrame4 = function ( CryptoKeyNewCount, event )
							local CryptoKeyNewCountFrame5 = function ( CryptoKeyNewCount, event )
								if not event.interrupted then
									CryptoKeyNewCount:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								CryptoKeyNewCount:setLeftRight( 0, 0, 129, 539 )
								CryptoKeyNewCount:setTopBottom( 0.5, 0.5, -24, 21 )
								CryptoKeyNewCount:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CryptoKeyNewCount, event )
								else
									CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoKeyNewCountFrame5( CryptoKeyNewCount, event )
								return 
							else
								CryptoKeyNewCount:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								CryptoKeyNewCount:setLeftRight( 0, 0, 249, 659 )
								CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoKeyNewCountFrame4( CryptoKeyNewCount, event )
							return 
						else
							CryptoKeyNewCount:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							CryptoKeyNewCount:setLeftRight( 0, 0, 322, 732 )
							CryptoKeyNewCount:setAlpha( 1 )
							CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame4 )
						end
					end
					
					if event.interrupted then
						CryptoKeyNewCountFrame3( CryptoKeyNewCount, event )
						return 
					else
						CryptoKeyNewCount:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						CryptoKeyNewCount:setLeftRight( 0, 0, 675.55, 1085.55 )
						CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame3 )
					end
				end
				
				CryptoKeyNewCount:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoKeyNewCount:setLeftRight( 0, 0, 1007, 1417 )
				CryptoKeyNewCount:setTopBottom( 0.5, 0.5, -24, 21 )
				CryptoKeyNewCount:setAlpha( 0 )
				CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame2 )
				local CryptoIcon0Frame2 = function ( CryptoIcon0, event )
					local CryptoIcon0Frame3 = function ( CryptoIcon0, event )
						local CryptoIcon0Frame4 = function ( CryptoIcon0, event )
							local CryptoIcon0Frame5 = function ( CryptoIcon0, event )
								local CryptoIcon0Frame6 = function ( CryptoIcon0, event )
									if not event.interrupted then
										CryptoIcon0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
									end
									CryptoIcon0:setLeftRight( 0, 0, 71, 127 )
									CryptoIcon0:setTopBottom( 0.5, 0.5, -29, 27 )
									CryptoIcon0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( CryptoIcon0, event )
									else
										CryptoIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									CryptoIcon0Frame6( CryptoIcon0, event )
									return 
								else
									CryptoIcon0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									CryptoIcon0:setLeftRight( 0, 0, 71, 127 )
									CryptoIcon0:setAlpha( 0 )
									CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame6 )
								end
							end
							
							if event.interrupted then
								CryptoIcon0Frame5( CryptoIcon0, event )
								return 
							else
								CryptoIcon0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								CryptoIcon0:setLeftRight( 0, 0, 191, 247 )
								CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame5 )
							end
						end
						
						if event.interrupted then
							CryptoIcon0Frame4( CryptoIcon0, event )
							return 
						else
							CryptoIcon0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							CryptoIcon0:setLeftRight( 0, 0, 263, 319 )
							CryptoIcon0:setAlpha( 1 )
							CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame4 )
						end
					end
					
					if event.interrupted then
						CryptoIcon0Frame3( CryptoIcon0, event )
						return 
					else
						CryptoIcon0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						CryptoIcon0:setLeftRight( 0, 0, 615.52, 671.52 )
						CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame3 )
					end
				end
				
				CryptoIcon0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoIcon0:setLeftRight( 0, 0, 946, 1002 )
				CryptoIcon0:setTopBottom( 0.5, 0.5, -29, 27 )
				CryptoIcon0:setAlpha( 0 )
				CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame2 )
				local CryptoCountNew0Frame2 = function ( CryptoCountNew0, event )
					local CryptoCountNew0Frame3 = function ( CryptoCountNew0, event )
						local CryptoCountNew0Frame4 = function ( CryptoCountNew0, event )
							if not event.interrupted then
								CryptoCountNew0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							CryptoCountNew0:setLeftRight( 0, 0, -38, 70 )
							CryptoCountNew0:setTopBottom( 0.5, 0.5, -32, 28 )
							if event.interrupted then
								self.clipFinished( CryptoCountNew0, event )
							else
								CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CryptoCountNew0Frame4( CryptoCountNew0, event )
							return 
						else
							CryptoCountNew0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
							CryptoCountNew0:setLeftRight( 0, 0, 82, 190 )
							CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame4 )
						end
					end
					
					if event.interrupted then
						CryptoCountNew0Frame3( CryptoCountNew0, event )
						return 
					else
						CryptoCountNew0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						CryptoCountNew0:setLeftRight( 0, 0, 153, 261 )
						CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame3 )
					end
				end
				
				CryptoCountNew0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoCountNew0:setLeftRight( 0, 0, 838, 946 )
				CryptoCountNew0:setTopBottom( 0.5, 0.5, -32, 28 )
				CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame2 )
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
		Retrieving = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			NewXPNoNewKey = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
				local SoundFrame2 = function ( Sound, event )
					if not event.interrupted then
						Sound:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Sound:playSound( "uin_bm_bar_fill_tail", controller )
					if event.interrupted then
						self.clipFinished( Sound, event )
					else
						Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "uin_bm_bar_fill_main", controller )
				SoundFrame2( Sound, {} )
			end,
			NewKey = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local XpBarFrameFrame2 = function ( XpBarFrame, event )
					local XpBarFrameFrame3 = function ( XpBarFrame, event )
						local XpBarFrameFrame4 = function ( XpBarFrame, event )
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
							XpBarFrameFrame4( XpBarFrame, event )
							return 
						else
							XpBarFrame:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame4 )
						end
					end
					
					if event.interrupted then
						XpBarFrameFrame3( XpBarFrame, event )
						return 
					else
						XpBarFrame:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						XpBarFrame:setAlpha( 0 )
						XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame3 )
					end
				end
				
				XpBarFrame:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				XpBarFrame:setAlpha( 1 )
				XpBarFrame:registerEventHandler( "transition_complete_keyframe", XpBarFrameFrame2 )
				local cryptokeyProgressBgFrame2 = function ( cryptokeyProgressBg, event )
					local cryptokeyProgressBgFrame3 = function ( cryptokeyProgressBg, event )
						local cryptokeyProgressBgFrame4 = function ( cryptokeyProgressBg, event )
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
							cryptokeyProgressBgFrame4( cryptokeyProgressBg, event )
							return 
						else
							cryptokeyProgressBg:beginAnimation( "keyframe", 1330, false, false, CoD.TweenType.Linear )
							cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressBgFrame4 )
						end
					end
					
					if event.interrupted then
						cryptokeyProgressBgFrame3( cryptokeyProgressBg, event )
						return 
					else
						cryptokeyProgressBg:beginAnimation( "keyframe", 1069, false, false, CoD.TweenType.Linear )
						cryptokeyProgressBg:setAlpha( 0 )
						cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressBgFrame3 )
					end
				end
				
				cryptokeyProgressBg:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
				cryptokeyProgressBg:setAlpha( 0.1 )
				cryptokeyProgressBg:registerEventHandler( "transition_complete_keyframe", cryptokeyProgressBgFrame2 )
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
				local nextKeyTextFrame2 = function ( nextKeyText, event )
					local nextKeyTextFrame3 = function ( nextKeyText, event )
						local nextKeyTextFrame4 = function ( nextKeyText, event )
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
							nextKeyTextFrame4( nextKeyText, event )
							return 
						else
							nextKeyText:beginAnimation( "keyframe", 1350, false, false, CoD.TweenType.Linear )
							nextKeyText:registerEventHandler( "transition_complete_keyframe", nextKeyTextFrame4 )
						end
					end
					
					if event.interrupted then
						nextKeyTextFrame3( nextKeyText, event )
						return 
					else
						nextKeyText:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						nextKeyText:setAlpha( 0 )
						nextKeyText:registerEventHandler( "transition_complete_keyframe", nextKeyTextFrame3 )
					end
				end
				
				nextKeyText:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				nextKeyText:setAlpha( 1 )
				nextKeyText:registerEventHandler( "transition_complete_keyframe", nextKeyTextFrame2 )
				local CryptoIconFrame2 = function ( CryptoIcon, event )
					local CryptoIconFrame3 = function ( CryptoIcon, event )
						local CryptoIconFrame4 = function ( CryptoIcon, event )
							local CryptoIconFrame5 = function ( CryptoIcon, event )
								if not event.interrupted then
									CryptoIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								CryptoIcon:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( CryptoIcon, event )
								else
									CryptoIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoIconFrame5( CryptoIcon, event )
								return 
							else
								CryptoIcon:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								CryptoIcon:registerEventHandler( "transition_complete_keyframe", CryptoIconFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoIconFrame4( CryptoIcon, event )
							return 
						else
							CryptoIcon:beginAnimation( "keyframe", 1249, false, false, CoD.TweenType.Linear )
							CryptoIcon:registerEventHandler( "transition_complete_keyframe", CryptoIconFrame4 )
						end
					end
					
					if event.interrupted then
						CryptoIconFrame3( CryptoIcon, event )
						return 
					else
						CryptoIcon:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						CryptoIcon:setAlpha( 0 )
						CryptoIcon:registerEventHandler( "transition_complete_keyframe", CryptoIconFrame3 )
					end
				end
				
				CryptoIcon:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
				CryptoIcon:setAlpha( 1 )
				CryptoIcon:registerEventHandler( "transition_complete_keyframe", CryptoIconFrame2 )
				local CryptoCountFrame2 = function ( CryptoCount, event )
					local CryptoCountFrame3 = function ( CryptoCount, event )
						local CryptoCountFrame4 = function ( CryptoCount, event )
							local CryptoCountFrame5 = function ( CryptoCount, event )
								if not event.interrupted then
									CryptoCount:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								end
								CryptoCount:setRGB( 1, 1, 1 )
								CryptoCount:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( CryptoCount, event )
								else
									CryptoCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoCountFrame5( CryptoCount, event )
								return 
							else
								CryptoCount:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
								CryptoCount:registerEventHandler( "transition_complete_keyframe", CryptoCountFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoCountFrame4( CryptoCount, event )
							return 
						else
							CryptoCount:beginAnimation( "keyframe", 1239, false, false, CoD.TweenType.Linear )
							CryptoCount:registerEventHandler( "transition_complete_keyframe", CryptoCountFrame4 )
						end
					end
					
					if event.interrupted then
						CryptoCountFrame3( CryptoCount, event )
						return 
					else
						CryptoCount:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						CryptoCount:setAlpha( 0 )
						CryptoCount:registerEventHandler( "transition_complete_keyframe", CryptoCountFrame3 )
					end
				end
				
				CryptoCount:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
				CryptoCount:setRGB( 1, 1, 1 )
				CryptoCount:setAlpha( 1 )
				CryptoCount:registerEventHandler( "transition_complete_keyframe", CryptoCountFrame2 )
				local CryptoKeyNewCountFrame2 = function ( CryptoKeyNewCount, event )
					local CryptoKeyNewCountFrame3 = function ( CryptoKeyNewCount, event )
						local CryptoKeyNewCountFrame4 = function ( CryptoKeyNewCount, event )
							local CryptoKeyNewCountFrame5 = function ( CryptoKeyNewCount, event )
								if not event.interrupted then
									CryptoKeyNewCount:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
								end
								CryptoKeyNewCount:setLeftRight( 0, 0, 129, 539 )
								CryptoKeyNewCount:setTopBottom( 0.5, 0.5, -24, 21 )
								CryptoKeyNewCount:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CryptoKeyNewCount, event )
								else
									CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CryptoKeyNewCountFrame5( CryptoKeyNewCount, event )
								return 
							else
								CryptoKeyNewCount:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								CryptoKeyNewCount:setLeftRight( 0, 0, 249, 659 )
								CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame5 )
							end
						end
						
						if event.interrupted then
							CryptoKeyNewCountFrame4( CryptoKeyNewCount, event )
							return 
						else
							CryptoKeyNewCount:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							CryptoKeyNewCount:setLeftRight( 0, 0, 322, 732 )
							CryptoKeyNewCount:setAlpha( 1 )
							CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame4 )
						end
					end
					
					if event.interrupted then
						CryptoKeyNewCountFrame3( CryptoKeyNewCount, event )
						return 
					else
						CryptoKeyNewCount:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						CryptoKeyNewCount:setLeftRight( 0, 0, 675.55, 1085.55 )
						CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame3 )
					end
				end
				
				CryptoKeyNewCount:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoKeyNewCount:setLeftRight( 0, 0, 1007, 1417 )
				CryptoKeyNewCount:setTopBottom( 0.5, 0.5, -24, 21 )
				CryptoKeyNewCount:setAlpha( 0 )
				CryptoKeyNewCount:registerEventHandler( "transition_complete_keyframe", CryptoKeyNewCountFrame2 )
				local CryptoIcon0Frame2 = function ( CryptoIcon0, event )
					local CryptoIcon0Frame3 = function ( CryptoIcon0, event )
						local CryptoIcon0Frame4 = function ( CryptoIcon0, event )
							local CryptoIcon0Frame5 = function ( CryptoIcon0, event )
								local CryptoIcon0Frame6 = function ( CryptoIcon0, event )
									if not event.interrupted then
										CryptoIcon0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Linear )
									end
									CryptoIcon0:setLeftRight( 0, 0, 71, 127 )
									CryptoIcon0:setTopBottom( 0.5, 0.5, -29, 27 )
									CryptoIcon0:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( CryptoIcon0, event )
									else
										CryptoIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									CryptoIcon0Frame6( CryptoIcon0, event )
									return 
								else
									CryptoIcon0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									CryptoIcon0:setLeftRight( 0, 0, 71, 127 )
									CryptoIcon0:setAlpha( 0 )
									CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame6 )
								end
							end
							
							if event.interrupted then
								CryptoIcon0Frame5( CryptoIcon0, event )
								return 
							else
								CryptoIcon0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
								CryptoIcon0:setLeftRight( 0, 0, 191, 247 )
								CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame5 )
							end
						end
						
						if event.interrupted then
							CryptoIcon0Frame4( CryptoIcon0, event )
							return 
						else
							CryptoIcon0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							CryptoIcon0:setLeftRight( 0, 0, 263, 319 )
							CryptoIcon0:setAlpha( 1 )
							CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame4 )
						end
					end
					
					if event.interrupted then
						CryptoIcon0Frame3( CryptoIcon0, event )
						return 
					else
						CryptoIcon0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
						CryptoIcon0:setLeftRight( 0, 0, 615.52, 671.52 )
						CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame3 )
					end
				end
				
				CryptoIcon0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoIcon0:setLeftRight( 0, 0, 946, 1002 )
				CryptoIcon0:setTopBottom( 0.5, 0.5, -29, 27 )
				CryptoIcon0:setAlpha( 0 )
				CryptoIcon0:registerEventHandler( "transition_complete_keyframe", CryptoIcon0Frame2 )
				local CryptoCountNew0Frame2 = function ( CryptoCountNew0, event )
					local CryptoCountNew0Frame3 = function ( CryptoCountNew0, event )
						local CryptoCountNew0Frame4 = function ( CryptoCountNew0, event )
							if not event.interrupted then
								CryptoCountNew0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							end
							CryptoCountNew0:setLeftRight( 0, 0, -38, 70 )
							CryptoCountNew0:setTopBottom( 0.5, 0.5, -32, 28 )
							if event.interrupted then
								self.clipFinished( CryptoCountNew0, event )
							else
								CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CryptoCountNew0Frame4( CryptoCountNew0, event )
							return 
						else
							CryptoCountNew0:beginAnimation( "keyframe", 950, false, false, CoD.TweenType.Linear )
							CryptoCountNew0:setLeftRight( 0, 0, 82, 190 )
							CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame4 )
						end
					end
					
					if event.interrupted then
						CryptoCountNew0Frame3( CryptoCountNew0, event )
						return 
					else
						CryptoCountNew0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						CryptoCountNew0:setLeftRight( 0, 0, 153, 261 )
						CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame3 )
					end
				end
				
				CryptoCountNew0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Linear )
				CryptoCountNew0:setLeftRight( 0, 0, 838, 946 )
				CryptoCountNew0:setTopBottom( 0.5, 0.5, -32, 28 )
				CryptoCountNew0:registerEventHandler( "transition_complete_keyframe", CryptoCountNew0Frame2 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.XpBarFrame:close()
		self.cryptokeyProgress:close()
		self.cryptokeyProgressForNewKey:close()
		self.CryptoCount:close()
		self.CryptoCountNew0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

