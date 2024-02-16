-- 321a01a3f6dab5c522aec36b580762a9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.FR_TopScore_Box_TimeBlur" )
require( "ui.uieditor.widgets.Freerun.FR_TopScore_Box_FooterBlur" )
require( "ui.uieditor.widgets.Notifications.PlayerCard.PlayerCard" )

CoD.FR_TopScoreWidget = InheritFrom( LUI.UIElement )
CoD.FR_TopScoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.FR_TopScoreWidget )
	self.id = "FR_TopScoreWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 556 )
	self:setTopBottom( true, false, 0, 292 )
	self.anyChildUsesUpdateState = true
	
	local TopScoreBox = LUI.UIImage.new()
	TopScoreBox:setLeftRight( true, true, 0, 0.25 )
	TopScoreBox:setTopBottom( true, false, 0, 61.81 )
	TopScoreBox:setImage( RegisterImage( "uie_t7_freerun_hud_topscores_headerbox" ) )
	TopScoreBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TopScoreBox )
	self.TopScoreBox = TopScoreBox
	
	local TopScoreBox0 = LUI.UIImage.new()
	TopScoreBox0:setLeftRight( true, true, 0, 0.25 )
	TopScoreBox0:setTopBottom( true, false, 0, 61.81 )
	TopScoreBox0:setAlpha( 0.3 )
	TopScoreBox0:setImage( RegisterImage( "uie_t7_freerun_hud_topscores_headerbox" ) )
	self:addElement( TopScoreBox0 )
	self.TopScoreBox0 = TopScoreBox0
	
	local FRTopScoreBoxTimeBlur = CoD.FR_TopScore_Box_TimeBlur.new( menu, controller )
	FRTopScoreBoxTimeBlur:setLeftRight( true, true, 7.3, -8.24 )
	FRTopScoreBoxTimeBlur:setTopBottom( true, false, 37, 123.81 )
	FRTopScoreBoxTimeBlur:setRGB( 0.79, 0.79, 0.79 )
	self:addElement( FRTopScoreBoxTimeBlur )
	self.FRTopScoreBoxTimeBlur = FRTopScoreBoxTimeBlur
	
	local FRTopScoreBoxTimeBlur0 = CoD.FR_TopScore_Box_TimeBlur.new( menu, controller )
	FRTopScoreBoxTimeBlur0:setLeftRight( true, true, 7.3, -8.24 )
	FRTopScoreBoxTimeBlur0:setTopBottom( true, false, 104.87, 191.68 )
	FRTopScoreBoxTimeBlur0:setRGB( 0.71, 0.71, 0.71 )
	self:addElement( FRTopScoreBoxTimeBlur0 )
	self.FRTopScoreBoxTimeBlur0 = FRTopScoreBoxTimeBlur0
	
	local FRTopScoreBoxTimeBlur1 = CoD.FR_TopScore_Box_TimeBlur.new( menu, controller )
	FRTopScoreBoxTimeBlur1:setLeftRight( true, true, 7.3, -8.24 )
	FRTopScoreBoxTimeBlur1:setTopBottom( true, false, 172.28, 259.09 )
	FRTopScoreBoxTimeBlur1:setRGB( 0.79, 0.79, 0.79 )
	self:addElement( FRTopScoreBoxTimeBlur1 )
	self.FRTopScoreBoxTimeBlur1 = FRTopScoreBoxTimeBlur1
	
	local FRTopScoreBoxFooterBlur = CoD.FR_TopScore_Box_FooterBlur.new( menu, controller )
	FRTopScoreBoxFooterBlur:setLeftRight( true, true, 0, -2.08 )
	FRTopScoreBoxFooterBlur:setTopBottom( true, false, 238.43, 292 )
	FRTopScoreBoxFooterBlur:setRGB( 0.62, 0.62, 0.62 )
	self:addElement( FRTopScoreBoxFooterBlur )
	self.FRTopScoreBoxFooterBlur = FRTopScoreBoxFooterBlur
	
	local HighScoresTextThird = LUI.UIText.new()
	HighScoresTextThird:setLeftRight( true, false, 393.36, 838.86 )
	HighScoresTextThird:setTopBottom( true, false, 193.87, 233.87 )
	HighScoresTextThird:setTTF( "fonts/escom.ttf" )
	HighScoresTextThird:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	HighScoresTextThird:setShaderVector( 0, 0, 0, 0, 0 )
	HighScoresTextThird:setShaderVector( 1, 0, 0, 0, 0 )
	HighScoresTextThird:setShaderVector( 2, 1, 0, 0, 0 )
	HighScoresTextThird:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HighScoresTextThird:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	HighScoresTextThird:linkToElementModel( self, "topScore3", true, function ( model )
		local topScore3 = Engine.GetModelValue( model )
		if topScore3 then
			HighScoresTextThird:setText( Engine.Localize( NumberAsTime( topScore3 ) ) )
		end
	end )
	self:addElement( HighScoresTextThird )
	self.HighScoresTextThird = HighScoresTextThird
	
	local HighScoresTextSecond = LUI.UIText.new()
	HighScoresTextSecond:setLeftRight( true, false, 393.36, 853.1 )
	HighScoresTextSecond:setTopBottom( true, false, 126, 166 )
	HighScoresTextSecond:setTTF( "fonts/escom.ttf" )
	HighScoresTextSecond:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	HighScoresTextSecond:setShaderVector( 0, 0, 0, 0, 0 )
	HighScoresTextSecond:setShaderVector( 1, 0, 0, 0, 0 )
	HighScoresTextSecond:setShaderVector( 2, 1, 0, 0, 0 )
	HighScoresTextSecond:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HighScoresTextSecond:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	HighScoresTextSecond:linkToElementModel( self, "topScore2", true, function ( model )
		local topScore2 = Engine.GetModelValue( model )
		if topScore2 then
			HighScoresTextSecond:setText( Engine.Localize( NumberAsTime( topScore2 ) ) )
		end
	end )
	self:addElement( HighScoresTextSecond )
	self.HighScoresTextSecond = HighScoresTextSecond
	
	local HighScoresTextFirst = LUI.UIText.new()
	HighScoresTextFirst:setLeftRight( true, false, 393.36, 827.86 )
	HighScoresTextFirst:setTopBottom( true, false, 58.6, 98.6 )
	HighScoresTextFirst:setTTF( "fonts/escom.ttf" )
	HighScoresTextFirst:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	HighScoresTextFirst:setShaderVector( 0, 0, 0, 0, 0 )
	HighScoresTextFirst:setShaderVector( 1, 0, 0, 0, 0 )
	HighScoresTextFirst:setShaderVector( 2, 1, 0, 0, 0 )
	HighScoresTextFirst:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HighScoresTextFirst:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	HighScoresTextFirst:linkToElementModel( self, "topScore1", true, function ( model )
		local topScore1 = Engine.GetModelValue( model )
		if topScore1 then
			HighScoresTextFirst:setText( Engine.Localize( NumberAsTime( topScore1 ) ) )
		end
	end )
	self:addElement( HighScoresTextFirst )
	self.HighScoresTextFirst = HighScoresTextFirst
	
	local BestTime = LUI.UIText.new()
	BestTime:setLeftRight( false, false, -72.14, 109.36 )
	BestTime:setTopBottom( false, false, -131.84, -98.16 )
	BestTime:setRGB( 0, 0, 0 )
	BestTime:setText( Engine.Localize( "FREERUN_BEST_TIME" ) )
	BestTime:setTTF( "fonts/escom.ttf" )
	BestTime:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	BestTime:setShaderVector( 0, 0.02, 0, 0, 0 )
	BestTime:setShaderVector( 1, 0.05, 0, 0, 0 )
	BestTime:setShaderVector( 2, 1, 0, 0, 0 )
	BestTime:setLetterSpacing( 1 )
	BestTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BestTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BestTime )
	self.BestTime = BestTime
	
	local LineTop = LUI.UIImage.new()
	LineTop:setLeftRight( true, true, 8, -8.24 )
	LineTop:setTopBottom( true, true, 240.23, -36.11 )
	LineTop:setAlpha( 0.25 )
	LineTop:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_line" ) )
	LineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineTop )
	self.LineTop = LineTop
	
	local LineBottom = LUI.UIImage.new()
	LineBottom:setLeftRight( true, true, 8, -8.24 )
	LineBottom:setTopBottom( true, true, 272.23, -4.11 )
	LineBottom:setAlpha( 0.25 )
	LineBottom:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_line" ) )
	LineBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineBottom )
	self.LineBottom = LineBottom
	
	local callsignLabel0 = LUI.UITightText.new()
	callsignLabel0:setLeftRight( true, false, 259.86, 333.86 )
	callsignLabel0:setTopBottom( true, false, 255.72, 275.72 )
	callsignLabel0:setText( Engine.Localize( "MENU_QUIT_CAPS" ) )
	callsignLabel0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( callsignLabel0 )
	self.callsignLabel0 = callsignLabel0
	
	local Button2 = LUI.UIImage.new()
	Button2:setLeftRight( true, false, 231.86, 253.86 )
	Button2:setTopBottom( true, false, 254.22, 276.22 )
	Button2:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			Button2:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( Button2 )
	self.Button2 = Button2
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 64.86, 89.86 )
	Label0:setTopBottom( true, false, 256.22, 276.22 )
	Label0:setText( Engine.Localize( "MENU_RESTART_LEVEL_CAPS" ) )
	Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 36.86, 58.86 )
	Image0:setTopBottom( true, false, 254.72, 276.72 )
	Image0:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			Image0:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 337.86, 380.36 )
	TextBox0:setTopBottom( true, false, 53.87, 103.87 )
	TextBox0:setText( Engine.Localize( "1." ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox0:setShaderVector( 0, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 327.86, 370.36 )
	TextBox1:setTopBottom( true, false, 121, 171 )
	TextBox1:setText( Engine.Localize( "2." ) )
	TextBox1:setTTF( "fonts/escom.ttf" )
	TextBox1:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox1:setShaderVector( 0, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox1:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 327.86, 370.36 )
	TextBox2:setTopBottom( true, false, 188.87, 238.87 )
	TextBox2:setText( Engine.Localize( "3." ) )
	TextBox2:setTTF( "fonts/escom.ttf" )
	TextBox2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox2:setShaderVector( 0, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local Box = LUI.UIImage.new()
	Box:setLeftRight( true, false, 373.36, 374.36 )
	Box:setTopBottom( true, false, 50.6, 108.87 )
	Box:setAlpha( 0.5 )
	self:addElement( Box )
	self.Box = Box
	
	local Box0 = LUI.UIImage.new()
	Box0:setLeftRight( true, false, 373.36, 374.36 )
	Box0:setTopBottom( true, false, 117.6, 176.87 )
	Box0:setAlpha( 0.5 )
	self:addElement( Box0 )
	self.Box0 = Box0
	
	local Box00 = LUI.UIImage.new()
	Box00:setLeftRight( true, false, 373.36, 374.36 )
	Box00:setTopBottom( true, false, 243.6, 186.87 )
	Box00:setAlpha( 0.5 )
	self:addElement( Box00 )
	self.Box00 = Box00
	
	local PlayerCard = CoD.PlayerCard.new( menu, controller )
	PlayerCard:setLeftRight( true, false, 22.86, 319.86 )
	PlayerCard:setTopBottom( true, false, 117.6, 177.6 )
	PlayerCard.Image00001:setAlpha( 0 )
	PlayerCard.Image2:setAlpha( 0 )
	PlayerCard.Image000010:setAlpha( 0 )
	PlayerCard.Image20:setAlpha( 0 )
	PlayerCard:linkToElementModel( self, nil, false, function ( model )
		PlayerCard:setModel( model, controller )
	end )
	PlayerCard:linkToElementModel( self, "heading", true, function ( model )
		local heading = Engine.GetModelValue( model )
		if heading then
			PlayerCard.CalloutHeading:setText( Engine.Localize( heading ) )
		end
	end )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 12 )

				local TopScoreBoxFrame2 = function ( TopScoreBox, event )
					if not event.interrupted then
						TopScoreBox:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TopScoreBox:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TopScoreBox, event )
					else
						TopScoreBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TopScoreBox:completeAnimation()
				self.TopScoreBox:setAlpha( 0 )
				TopScoreBoxFrame2( TopScoreBox, {} )
				local TopScoreBox0Frame2 = function ( TopScoreBox0, event )
					if not event.interrupted then
						TopScoreBox0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					TopScoreBox0:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( TopScoreBox0, event )
					else
						TopScoreBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TopScoreBox0:completeAnimation()
				self.TopScoreBox0:setAlpha( 0 )
				TopScoreBox0Frame2( TopScoreBox0, {} )
				local FRTopScoreBoxTimeBlurFrame2 = function ( FRTopScoreBoxTimeBlur, event )
					if not event.interrupted then
						FRTopScoreBoxTimeBlur:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					FRTopScoreBoxTimeBlur:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRTopScoreBoxTimeBlur, event )
					else
						FRTopScoreBoxTimeBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTopScoreBoxTimeBlur:completeAnimation()
				self.FRTopScoreBoxTimeBlur:setAlpha( 0 )
				FRTopScoreBoxTimeBlurFrame2( FRTopScoreBoxTimeBlur, {} )
				local FRTopScoreBoxTimeBlur0Frame2 = function ( FRTopScoreBoxTimeBlur0, event )
					if not event.interrupted then
						FRTopScoreBoxTimeBlur0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
					end
					FRTopScoreBoxTimeBlur0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRTopScoreBoxTimeBlur0, event )
					else
						FRTopScoreBoxTimeBlur0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTopScoreBoxTimeBlur0:completeAnimation()
				self.FRTopScoreBoxTimeBlur0:setAlpha( 0 )
				FRTopScoreBoxTimeBlur0Frame2( FRTopScoreBoxTimeBlur0, {} )
				local FRTopScoreBoxTimeBlur1Frame2 = function ( FRTopScoreBoxTimeBlur1, event )
					if not event.interrupted then
						FRTopScoreBoxTimeBlur1:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
					end
					FRTopScoreBoxTimeBlur1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRTopScoreBoxTimeBlur1, event )
					else
						FRTopScoreBoxTimeBlur1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTopScoreBoxTimeBlur1:completeAnimation()
				self.FRTopScoreBoxTimeBlur1:setAlpha( 0 )
				FRTopScoreBoxTimeBlur1Frame2( FRTopScoreBoxTimeBlur1, {} )
				local FRTopScoreBoxFooterBlurFrame2 = function ( FRTopScoreBoxFooterBlur, event )
					if not event.interrupted then
						FRTopScoreBoxFooterBlur:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Linear )
					end
					FRTopScoreBoxFooterBlur:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRTopScoreBoxFooterBlur, event )
					else
						FRTopScoreBoxFooterBlur:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTopScoreBoxFooterBlur:completeAnimation()
				self.FRTopScoreBoxFooterBlur:setAlpha( 0 )
				FRTopScoreBoxFooterBlurFrame2( FRTopScoreBoxFooterBlur, {} )
				local HighScoresTextThirdFrame2 = function ( HighScoresTextThird, event )
					if not event.interrupted then
						HighScoresTextThird:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
					end
					HighScoresTextThird:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HighScoresTextThird, event )
					else
						HighScoresTextThird:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HighScoresTextThird:completeAnimation()
				self.HighScoresTextThird:setAlpha( 0 )
				HighScoresTextThirdFrame2( HighScoresTextThird, {} )
				local HighScoresTextSecondFrame2 = function ( HighScoresTextSecond, event )
					if not event.interrupted then
						HighScoresTextSecond:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
					end
					HighScoresTextSecond:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HighScoresTextSecond, event )
					else
						HighScoresTextSecond:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HighScoresTextSecond:completeAnimation()
				self.HighScoresTextSecond:setAlpha( 0 )
				HighScoresTextSecondFrame2( HighScoresTextSecond, {} )
				local HighScoresTextFirstFrame2 = function ( HighScoresTextFirst, event )
					if not event.interrupted then
						HighScoresTextFirst:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					HighScoresTextFirst:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HighScoresTextFirst, event )
					else
						HighScoresTextFirst:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HighScoresTextFirst:completeAnimation()
				self.HighScoresTextFirst:setAlpha( 0 )
				HighScoresTextFirstFrame2( HighScoresTextFirst, {} )
				local BestTimeFrame2 = function ( BestTime, event )
					if not event.interrupted then
						BestTime:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					BestTime:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BestTime, event )
					else
						BestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BestTime:completeAnimation()
				self.BestTime:setAlpha( 0 )
				BestTimeFrame2( BestTime, {} )
				local LineTopFrame2 = function ( LineTop, event )
					local LineTopFrame3 = function ( LineTop, event )
						local LineTopFrame4 = function ( LineTop, event )
							local LineTopFrame5 = function ( LineTop, event )
								if not event.interrupted then
									LineTop:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								LineTop:setLeftRight( true, true, 8, -7.74 )
								LineTop:setTopBottom( true, true, 240.23, -37.11 )
								LineTop:setAlpha( 0.4 )
								if event.interrupted then
									self.clipFinished( LineTop, event )
								else
									LineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LineTopFrame5( LineTop, event )
								return 
							else
								LineTop:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								LineTop:setAlpha( 0 )
								LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame5 )
							end
						end
						
						if event.interrupted then
							LineTopFrame4( LineTop, event )
							return 
						else
							LineTop:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							LineTop:setAlpha( 0.4 )
							LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame4 )
						end
					end
					
					if event.interrupted then
						LineTopFrame3( LineTop, event )
						return 
					else
						LineTop:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						LineTop:registerEventHandler( "transition_complete_keyframe", LineTopFrame3 )
					end
				end
				
				LineTop:completeAnimation()
				self.LineTop:setLeftRight( true, true, 8, -7.74 )
				self.LineTop:setTopBottom( true, true, 240.23, -37.11 )
				self.LineTop:setAlpha( 0 )
				LineTopFrame2( LineTop, {} )
				local LineBottomFrame2 = function ( LineBottom, event )
					local LineBottomFrame3 = function ( LineBottom, event )
						local LineBottomFrame4 = function ( LineBottom, event )
							local LineBottomFrame5 = function ( LineBottom, event )
								if not event.interrupted then
									LineBottom:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
								end
								LineBottom:setLeftRight( true, true, 8, -7.74 )
								LineBottom:setTopBottom( true, true, 272.23, -5.11 )
								LineBottom:setAlpha( 0.4 )
								if event.interrupted then
									self.clipFinished( LineBottom, event )
								else
									LineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LineBottomFrame5( LineBottom, event )
								return 
							else
								LineBottom:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								LineBottom:setAlpha( 0 )
								LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame5 )
							end
						end
						
						if event.interrupted then
							LineBottomFrame4( LineBottom, event )
							return 
						else
							LineBottom:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							LineBottom:setAlpha( 0.4 )
							LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame4 )
						end
					end
					
					if event.interrupted then
						LineBottomFrame3( LineBottom, event )
						return 
					else
						LineBottom:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						LineBottom:registerEventHandler( "transition_complete_keyframe", LineBottomFrame3 )
					end
				end
				
				LineBottom:completeAnimation()
				self.LineBottom:setLeftRight( true, true, 8, -7.74 )
				self.LineBottom:setTopBottom( true, true, 272.23, -5.11 )
				self.LineBottom:setAlpha( 0 )
				LineBottomFrame2( LineBottom, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRTopScoreBoxTimeBlur:close()
		element.FRTopScoreBoxTimeBlur0:close()
		element.FRTopScoreBoxTimeBlur1:close()
		element.FRTopScoreBoxFooterBlur:close()
		element.PlayerCard:close()
		element.HighScoresTextThird:close()
		element.HighScoresTextSecond:close()
		element.HighScoresTextFirst:close()
		element.Button2:close()
		element.Image0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
