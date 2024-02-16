-- 94f464408e5d578f48b3c003cadbdae4
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0.startVal
	local f1_local1 = f1_arg0.endVal
	local f1_local2 = (f1_arg2 - Engine.CurrentGameTime()) / (f1_local0 - f1_local1)
	f1_arg0:playClip( "HeartBeat" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg1 ), "hudItems.rejack.countdownText" ), f1_local0 )
	f1_arg0.countdownText = f1_local0
	f1_arg0.countdownTimer = LUI.UITimer.newElementTimer( f1_local2, false, function ()
		f1_arg0.countdownText = f1_arg0.countdownText - 1
		if f1_local1 <= f1_arg0.countdownText then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1_arg1 ), "hudItems.rejack.countdownText" ), f1_arg0.countdownText )
		else
			f1_arg0.countdownTimer:close()
			f1_arg0:playClip( "DefaultClip" )
		end
	end )
	f1_arg0:addElement( f1_arg0.countdownTimer )
end

local f0_local1 = function ( f3_arg0, f3_arg1 )
	f3_arg0.countdownTimer:close()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f3_arg1 ), "hudItems.rejack.countdownText" ), f3_arg0.startVal )
	f3_arg0:playClip( "RejackActivated" )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	f4_arg0.startVal = 99
	f4_arg0.endVal = 1
	f4_arg0.startHeartBeatAnimation = f0_local0
	f4_arg0.startRejackAnimation = f0_local1
end

CoD.RejackInternal = InheritFrom( LUI.UIElement )
CoD.RejackInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RejackInternal )
	self.id = "RejackInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 300 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0, 0 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setRGB( 0.62, 0, 1 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local BlackFrame0 = LUI.UIImage.new()
	BlackFrame0:setLeftRight( true, true, 0, 0 )
	BlackFrame0:setTopBottom( true, true, 0, 0 )
	BlackFrame0:setRGB( 0, 0, 0 )
	BlackFrame0:setAlpha( 0.1 )
	self:addElement( BlackFrame0 )
	self.BlackFrame0 = BlackFrame0
	
	local BlackFrame2 = LUI.UIImage.new()
	BlackFrame2:setLeftRight( true, false, 200, 400 )
	BlackFrame2:setTopBottom( true, false, 10.96, 47.96 )
	BlackFrame2:setRGB( 0, 0, 0 )
	BlackFrame2:setAlpha( 0.4 )
	self:addElement( BlackFrame2 )
	self.BlackFrame2 = BlackFrame2
	
	local BlackFrame = LUI.UIImage.new()
	BlackFrame:setLeftRight( true, false, 67.81, 530.16 )
	BlackFrame:setTopBottom( true, false, 127.45, 196.71 )
	BlackFrame:setRGB( 0, 0, 0 )
	BlackFrame:setAlpha( 0.25 )
	self:addElement( BlackFrame )
	self.BlackFrame = BlackFrame
	
	local RejackTitle = LUI.UIText.new()
	RejackTitle:setLeftRight( true, false, 200, 400 )
	RejackTitle:setTopBottom( true, false, 7.96, 47.96 )
	RejackTitle:setText( Engine.Localize( "MPUI_REJACK_CAPS" ) )
	RejackTitle:setTTF( "fonts/escom.ttf" )
	RejackTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	RejackTitle:setShaderVector( 0, 0, 0, 0, 0 )
	RejackTitle:setShaderVector( 1, 0, 0, 0, 0 )
	RejackTitle:setShaderVector( 2, 1, 0, 0, 0 )
	RejackTitle:setLetterSpacing( 1 )
	RejackTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RejackTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RejackTitle )
	self.RejackTitle = RejackTitle
	
	local RejackingTitle2 = LUI.UIText.new()
	RejackingTitle2:setLeftRight( true, false, 200, 400 )
	RejackingTitle2:setTopBottom( true, false, 7.96, 47.96 )
	RejackingTitle2:setText( Engine.Localize( "MPUI_REJACKING_CAPS" ) )
	RejackingTitle2:setTTF( "fonts/escom.ttf" )
	RejackingTitle2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	RejackingTitle2:setShaderVector( 0, 0, 0, 0, 0 )
	RejackingTitle2:setShaderVector( 1, 0, 0, 0, 0 )
	RejackingTitle2:setShaderVector( 2, 1, 0, 0, 0 )
	RejackingTitle2:setLetterSpacing( 1 )
	RejackingTitle2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RejackingTitle2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RejackingTitle2 )
	self.RejackingTitle2 = RejackingTitle2
	
	local TimeRemaining = LUI.UIText.new()
	TimeRemaining:setLeftRight( true, false, 467, 579 )
	TimeRemaining:setTopBottom( true, false, 137, 187 )
	TimeRemaining:setText( Engine.Localize( "$(hudItems.rejack.countdownText)" ) )
	TimeRemaining:setTTF( "fonts/escom.ttf" )
	TimeRemaining:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TimeRemaining:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeRemaining )
	self.TimeRemaining = TimeRemaining
	
	local Prompt = LUI.UIText.new()
	Prompt:setLeftRight( true, false, 207.84, 407.84 )
	Prompt:setTopBottom( true, false, 234.09, 259.09 )
	Prompt:setText( Engine.Localize( "MP_REJACK_TERMINATE" ) )
	Prompt:setTTF( "fonts/default.ttf" )
	Prompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Prompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Prompt )
	self.Prompt = Prompt
	
	local barHR = LUI.UIImage.new()
	barHR:setLeftRight( true, false, 21.78, 111.84 )
	barHR:setTopBottom( true, false, 92.22, 207.78 )
	barHR:setImage( RegisterImage( "uie_t7_menu_cp_datavault_heath_bars" ) )
	self:addElement( barHR )
	self.barHR = barHR
	
	local Grid = LUI.UIImage.new()
	Grid:setLeftRight( true, false, 62.81, 458.44 )
	Grid:setTopBottom( true, false, 125.45, 198.55 )
	Grid:setImage( RegisterImage( "uie_dots_gridframe" ) )
	Grid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Grid )
	self.Grid = Grid
	
	local Grid0 = LUI.UIImage.new()
	Grid0:setLeftRight( true, false, 62.81, 458.44 )
	Grid0:setTopBottom( true, false, 125.45, 198.55 )
	Grid0:setImage( RegisterImage( "uie_dots_gridframe" ) )
	Grid0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Grid0 )
	self.Grid0 = Grid0
	
	local HeartBeatLine = LUI.UIImage.new()
	HeartBeatLine:setLeftRight( true, false, 62.81, 458.44 )
	HeartBeatLine:setTopBottom( true, false, 125.45, 198.55 )
	HeartBeatLine:setImage( RegisterImage( "uie_line_pulse" ) )
	HeartBeatLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	HeartBeatLine:setShaderVector( 0, 2.8, 0, 0, 0 )
	HeartBeatLine:setShaderVector( 1, 0, 0, 0, 0 )
	HeartBeatLine:setShaderVector( 2, 1, 0, 0, 0 )
	HeartBeatLine:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( HeartBeatLine )
	self.HeartBeatLine = HeartBeatLine
	
	local dot0 = LUI.UIImage.new()
	dot0:setLeftRight( false, true, -153.68, -146 )
	dot0:setTopBottom( true, false, 123.61, 131.29 )
	dot0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_line" ) )
	self:addElement( dot0 )
	self.dot0 = dot0
	
	local dot1 = LUI.UIImage.new()
	dot1:setLeftRight( false, true, -74.68, -67 )
	dot1:setTopBottom( true, false, 123.61, 131.29 )
	dot1:setImage( RegisterImage( "uie_t7_menu_cp_datavault_line" ) )
	self:addElement( dot1 )
	self.dot1 = dot1
	
	local dot2 = LUI.UIImage.new()
	dot2:setLeftRight( false, true, -153.68, -146 )
	dot2:setTopBottom( true, false, 192.87, 200.55 )
	dot2:setImage( RegisterImage( "uie_t7_menu_cp_datavault_line" ) )
	self:addElement( dot2 )
	self.dot2 = dot2
	
	local dot3 = LUI.UIImage.new()
	dot3:setLeftRight( false, true, -74.68, -67 )
	dot3:setTopBottom( true, false, 192.87, 200.55 )
	dot3:setImage( RegisterImage( "uie_t7_menu_cp_datavault_line" ) )
	self:addElement( dot3 )
	self.dot3 = dot3
	
	local dot4 = LUI.UIImage.new()
	dot4:setLeftRight( false, true, -533.19, -525.51 )
	dot4:setTopBottom( true, false, 123.61, 131.29 )
	dot4:setImage( RegisterImage( "uie_t7_menu_cp_datavault_line" ) )
	self:addElement( dot4 )
	self.dot4 = dot4
	
	local dot5 = LUI.UIImage.new()
	dot5:setLeftRight( false, true, -533.19, -525.51 )
	dot5:setTopBottom( true, false, 192.87, 200.55 )
	dot5:setImage( RegisterImage( "uie_t7_menu_cp_datavault_line" ) )
	self:addElement( dot5 )
	self.dot5 = dot5
	
	local HeartBeatLineAlive = LUI.UIImage.new()
	HeartBeatLineAlive:setLeftRight( true, false, 62.81, 422.81 )
	HeartBeatLineAlive:setTopBottom( true, false, 125.45, 197.45 )
	HeartBeatLineAlive:setImage( RegisterImage( "uie_line_pulsealive" ) )
	HeartBeatLineAlive:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HeartBeatLineAlive )
	self.HeartBeatLineAlive = HeartBeatLineAlive
	
	local WhiteLine = LUI.UIImage.new()
	WhiteLine:setLeftRight( true, false, 402.06, 600 )
	WhiteLine:setTopBottom( true, false, 70.22, 72.22 )
	WhiteLine:setAlpha( 0.8 )
	self:addElement( WhiteLine )
	self.WhiteLine = WhiteLine
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 197.94 )
	Image1:setTopBottom( true, false, 70.22, 72.22 )
	Image1:setAlpha( 0.8 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Sound = LUI.UIElement.new()
	Sound:setLeftRight( true, false, 8, 56 )
	Sound:setTopBottom( true, false, 318.5, 366.5 )
	self:addElement( Sound )
	self.Sound = Sound
	
	local RejackingTitle20 = LUI.UIText.new()
	RejackingTitle20:setLeftRight( true, false, 124.06, 482.06 )
	RejackingTitle20:setTopBottom( true, false, 47.96, 87.96 )
	RejackingTitle20:setText( Engine.Localize( "MENU_REJACK_UI3D_PROMPT" ) )
	RejackingTitle20:setTTF( "fonts/escom.ttf" )
	RejackingTitle20:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	RejackingTitle20:setShaderVector( 0, 0, 0, 0, 0 )
	RejackingTitle20:setShaderVector( 1, 0, 0, 0, 0 )
	RejackingTitle20:setShaderVector( 2, 1, 0, 0, 0 )
	RejackingTitle20:setLetterSpacing( 1 )
	RejackingTitle20:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RejackingTitle20:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RejackingTitle20 )
	self.RejackingTitle20 = RejackingTitle20
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				BlackFrame2:completeAnimation()
				self.BlackFrame2:setAlpha( 0 )
				self.clipFinished( BlackFrame2, {} )

				BlackFrame:completeAnimation()
				self.BlackFrame:setAlpha( 0 )
				self.clipFinished( BlackFrame, {} )

				RejackTitle:completeAnimation()
				self.RejackTitle:setAlpha( 0 )
				self.clipFinished( RejackTitle, {} )

				RejackingTitle2:completeAnimation()
				self.RejackingTitle2:setAlpha( 0 )
				self.clipFinished( RejackingTitle2, {} )

				TimeRemaining:completeAnimation()
				self.TimeRemaining:setAlpha( 0 )
				self.clipFinished( TimeRemaining, {} )

				Prompt:completeAnimation()
				self.Prompt:setAlpha( 0 )
				self.clipFinished( Prompt, {} )

				barHR:completeAnimation()
				self.barHR:setAlpha( 0 )
				self.clipFinished( barHR, {} )

				Grid:completeAnimation()
				self.Grid:setAlpha( 0 )
				self.clipFinished( Grid, {} )

				Grid0:completeAnimation()
				self.Grid0:setAlpha( 0 )
				self.clipFinished( Grid0, {} )

				HeartBeatLine:completeAnimation()
				self.HeartBeatLine:setLeftRight( true, false, 62.81, 458.44 )
				self.HeartBeatLine:setTopBottom( true, false, 125.45, 198.55 )
				self.HeartBeatLine:setAlpha( 0 )
				self.clipFinished( HeartBeatLine, {} )

				dot0:completeAnimation()
				self.dot0:setAlpha( 0 )
				self.clipFinished( dot0, {} )

				dot1:completeAnimation()
				self.dot1:setAlpha( 0 )
				self.clipFinished( dot1, {} )

				dot2:completeAnimation()
				self.dot2:setAlpha( 0 )
				self.clipFinished( dot2, {} )

				dot3:completeAnimation()
				self.dot3:setAlpha( 0 )
				self.clipFinished( dot3, {} )

				dot4:completeAnimation()
				self.dot4:setAlpha( 0 )
				self.clipFinished( dot4, {} )

				dot5:completeAnimation()
				self.dot5:setAlpha( 0 )
				self.clipFinished( dot5, {} )

				HeartBeatLineAlive:completeAnimation()
				self.HeartBeatLineAlive:setAlpha( 0 )
				self.clipFinished( HeartBeatLineAlive, {} )

				WhiteLine:completeAnimation()
				self.WhiteLine:setAlpha( 0 )
				self.clipFinished( WhiteLine, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
			end,
			HeartBeat = function ()
				self:setupElementClipCounter( 10 )

				BlackFrame2:completeAnimation()
				self.BlackFrame2:setAlpha( 0.5 )
				self.clipFinished( BlackFrame2, {} )

				RejackTitle:completeAnimation()
				self.RejackTitle:setAlpha( 1 )
				self.clipFinished( RejackTitle, {} )

				RejackingTitle2:completeAnimation()
				self.RejackingTitle2:setAlpha( 0 )
				self.clipFinished( RejackingTitle2, {} )
				local TimeRemainingFrame2 = function ( TimeRemaining, event )
					local TimeRemainingFrame3 = function ( TimeRemaining, event )
						if not event.interrupted then
							TimeRemaining:beginAnimation( "keyframe", 2129, false, false, CoD.TweenType.Linear )
						end
						TimeRemaining:setRGB( 1, 0, 0 )
						TimeRemaining:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( TimeRemaining, event )
						else
							TimeRemaining:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TimeRemainingFrame3( TimeRemaining, event )
						return 
					else
						TimeRemaining:beginAnimation( "keyframe", 2859, false, false, CoD.TweenType.Linear )
						TimeRemaining:setRGB( 1, 0.51, 0 )
						TimeRemaining:registerEventHandler( "transition_complete_keyframe", TimeRemainingFrame3 )
					end
				end
				
				TimeRemaining:completeAnimation()
				self.TimeRemaining:setRGB( 0, 0.78, 0 )
				self.TimeRemaining:setAlpha( 1 )
				TimeRemainingFrame2( TimeRemaining, {} )

				Prompt:completeAnimation()
				self.Prompt:setLeftRight( true, false, 208, 408 )
				self.Prompt:setTopBottom( true, false, 234.09, 259.09 )
				self.Prompt:setAlpha( 1 )
				self.clipFinished( Prompt, {} )

				Grid:completeAnimation()
				self.Grid:setAlpha( 0.5 )
				self.clipFinished( Grid, {} )

				Grid0:completeAnimation()
				self.Grid0:setAlpha( 1 )
				self.clipFinished( Grid0, {} )
				local HeartBeatLineFrame2 = function ( HeartBeatLine, event )
					local HeartBeatLineFrame3 = function ( HeartBeatLine, event )
						local HeartBeatLineFrame4 = function ( HeartBeatLine, event )
							local HeartBeatLineFrame5 = function ( HeartBeatLine, event )
								local HeartBeatLineFrame6 = function ( HeartBeatLine, event )
									local HeartBeatLineFrame7 = function ( HeartBeatLine, event )
										if not event.interrupted then
											HeartBeatLine:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										HeartBeatLine:setRGB( 1, 0, 0 )
										HeartBeatLine:setAlpha( 1 )
										HeartBeatLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
										HeartBeatLine:setShaderVector( 0, 1, 0, 0, 0 )
										HeartBeatLine:setShaderVector( 1, 0, 0, 0, 0 )
										HeartBeatLine:setShaderVector( 2, 1, 0, 0, 0 )
										HeartBeatLine:setShaderVector( 3, 0, 0, 0, 0 )
										if event.interrupted then
											self.clipFinished( HeartBeatLine, event )
										else
											HeartBeatLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										HeartBeatLineFrame7( HeartBeatLine, event )
										return 
									else
										HeartBeatLine:beginAnimation( "keyframe", 989, false, false, CoD.TweenType.Linear )
										HeartBeatLine:setRGB( 1, 0, 0 )
										HeartBeatLine:setShaderVector( 0, 1, 0, 0, 0 )
										HeartBeatLine:registerEventHandler( "transition_complete_keyframe", HeartBeatLineFrame7 )
									end
								end
								
								if event.interrupted then
									HeartBeatLineFrame6( HeartBeatLine, event )
									return 
								else
									HeartBeatLine:beginAnimation( "keyframe", 1140, false, false, CoD.TweenType.Linear )
									HeartBeatLine:setRGB( 1, 0.24, 0 )
									HeartBeatLine:setShaderVector( 0, 0.64, 0, 0, 0 )
									HeartBeatLine:registerEventHandler( "transition_complete_keyframe", HeartBeatLineFrame6 )
								end
							end
							
							if event.interrupted then
								HeartBeatLineFrame5( HeartBeatLine, event )
								return 
							else
								HeartBeatLine:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
								HeartBeatLine:setRGB( 1, 0.51, 0 )
								HeartBeatLine:setShaderVector( 0, 0.47, 0, 0, 0 )
								HeartBeatLine:registerEventHandler( "transition_complete_keyframe", HeartBeatLineFrame5 )
							end
						end
						
						if event.interrupted then
							HeartBeatLineFrame4( HeartBeatLine, event )
							return 
						else
							HeartBeatLine:beginAnimation( "keyframe", 1619, false, false, CoD.TweenType.Linear )
							HeartBeatLine:setRGB( 0.81, 0.56, 0 )
							HeartBeatLine:setShaderVector( 0, 0.39, 0, 0, 0 )
							HeartBeatLine:registerEventHandler( "transition_complete_keyframe", HeartBeatLineFrame4 )
						end
					end
					
					if event.interrupted then
						HeartBeatLineFrame3( HeartBeatLine, event )
						return 
					else
						HeartBeatLine:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						HeartBeatLine:setRGB( 0.24, 0.72, 0 )
						HeartBeatLine:setShaderVector( 0, 0.17, 0, 0, 0 )
						HeartBeatLine:registerEventHandler( "transition_complete_keyframe", HeartBeatLineFrame3 )
					end
				end
				
				HeartBeatLine:completeAnimation()
				self.HeartBeatLine:setRGB( 0, 0.78, 0 )
				self.HeartBeatLine:setAlpha( 1 )
				self.HeartBeatLine:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.HeartBeatLine:setShaderVector( 0, 0, 0, 0, 0 )
				self.HeartBeatLine:setShaderVector( 1, 0, 0, 0, 0 )
				self.HeartBeatLine:setShaderVector( 2, 1, 0, 0, 0 )
				self.HeartBeatLine:setShaderVector( 3, 0, 0, 0, 0 )
				HeartBeatLineFrame2( HeartBeatLine, {} )

				HeartBeatLineAlive:completeAnimation()
				self.HeartBeatLineAlive:setAlpha( 0 )
				self.clipFinished( HeartBeatLineAlive, {} )
				local SoundFrame2 = function ( Sound, event )
					local SoundFrame3 = function ( Sound, event )
						local SoundFrame4 = function ( Sound, event )
							local SoundFrame5 = function ( Sound, event )
								local SoundFrame6 = function ( Sound, event )
									local SoundFrame7 = function ( Sound, event )
										local SoundFrame8 = function ( Sound, event )
											local SoundFrame9 = function ( Sound, event )
												if not event.interrupted then
													Sound:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
												end
												Sound:playSound( "flatline" )
												if event.interrupted then
													self.clipFinished( Sound, event )
												else
													Sound:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												SoundFrame9( Sound, event )
												return 
											else
												Sound:beginAnimation( "keyframe", 960, false, false, CoD.TweenType.Linear )
												Sound:playSound( "0" )
												Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame9 )
											end
										end
										
										if event.interrupted then
											SoundFrame8( Sound, event )
											return 
										else
											Sound:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
											Sound:playSound( "ekg_3" )
											Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame8 )
										end
									end
									
									if event.interrupted then
										SoundFrame7( Sound, event )
										return 
									else
										Sound:beginAnimation( "keyframe", 1609, false, false, CoD.TweenType.Linear )
										Sound:playSound( "0" )
										Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame7 )
									end
								end
								
								if event.interrupted then
									SoundFrame6( Sound, event )
									return 
								else
									Sound:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
									Sound:playSound( "ekg_2" )
									Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame6 )
								end
							end
							
							if event.interrupted then
								SoundFrame5( Sound, event )
								return 
							else
								Sound:beginAnimation( "keyframe", 1140, false, false, CoD.TweenType.Linear )
								Sound:playSound( "ekg" )
								Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame5 )
							end
						end
						
						if event.interrupted then
							SoundFrame4( Sound, event )
							return 
						else
							Sound:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							Sound:playSound( "ekg_1" )
							Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame4 )
						end
					end
					
					if event.interrupted then
						SoundFrame3( Sound, event )
						return 
					else
						Sound:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Linear )
						Sound:playSound( "0" )
						Sound:registerEventHandler( "transition_complete_keyframe", SoundFrame3 )
					end
				end
				
				Sound:completeAnimation()
				self.Sound:playSound( "ekg" )
				SoundFrame2( Sound, {} )
			end,
			RejackActivated = function ()
				self:setupElementClipCounter( 11 )

				BlackFrame0:completeAnimation()
				self.BlackFrame0:setAlpha( 0.2 )
				self.clipFinished( BlackFrame0, {} )

				BlackFrame:completeAnimation()
				self.BlackFrame:setLeftRight( true, false, 67.81, 530.16 )
				self.BlackFrame:setTopBottom( true, false, 127.45, 196.71 )
				self.BlackFrame:setAlpha( 0.25 )
				self.clipFinished( BlackFrame, {} )

				RejackTitle:completeAnimation()
				self.RejackTitle:setAlpha( 0 )
				self.clipFinished( RejackTitle, {} )

				RejackingTitle2:completeAnimation()
				self.RejackingTitle2:setAlpha( 1 )
				self.clipFinished( RejackingTitle2, {} )

				TimeRemaining:completeAnimation()
				self.TimeRemaining:setRGB( 0.02, 0.75, 0 )
				self.TimeRemaining:setAlpha( 1 )
				self.clipFinished( TimeRemaining, {} )

				Prompt:completeAnimation()
				self.Prompt:setAlpha( 1 )
				self.clipFinished( Prompt, {} )

				Grid0:completeAnimation()
				self.Grid0:setAlpha( 1 )
				self.clipFinished( Grid0, {} )

				HeartBeatLine:completeAnimation()
				self.HeartBeatLine:setAlpha( 0 )
				self.clipFinished( HeartBeatLine, {} )

				HeartBeatLineAlive:completeAnimation()
				self.HeartBeatLineAlive:setLeftRight( true, false, 62.81, 450.16 )
				self.HeartBeatLineAlive:setTopBottom( true, false, 125.45, 197.45 )
				self.HeartBeatLineAlive:setRGB( 0.02, 0.75, 0 )
				self.HeartBeatLineAlive:setAlpha( 1 )
				self.clipFinished( HeartBeatLineAlive, {} )

				WhiteLine:completeAnimation()
				self.WhiteLine:setAlpha( 0.8 )
				self.clipFinished( WhiteLine, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0.8 )
				self.clipFinished( Image1, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
