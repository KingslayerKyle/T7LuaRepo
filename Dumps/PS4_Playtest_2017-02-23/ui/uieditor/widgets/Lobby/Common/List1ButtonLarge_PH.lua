require( "ui.uieditor.widgets.Lobby.Common.FE_HelpItemsLabel" )

CoD.List1ButtonLarge_PH = InheritFrom( LUI.UIElement )
CoD.List1ButtonLarge_PH.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.List1ButtonLarge_PH )
	self.id = "List1ButtonLarge_PH"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEButtonIdle = LUI.UIImage.new()
	FEButtonIdle:setLeftRight( 0, 1, -2, 2 )
	FEButtonIdle:setTopBottom( 0.5, 0.5, -24, 24 )
	FEButtonIdle:setAlpha( 0.8 )
	FEButtonIdle:setZoom( 10 )
	FEButtonIdle:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlefull" ) )
	FEButtonIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonIdle:setShaderVector( 0, 0, 0, 0, 0 )
	FEButtonIdle:setupNineSliceShader( 12, 12 )
	self:addElement( FEButtonIdle )
	self.FEButtonIdle = FEButtonIdle
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
	FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
	FEButtonFocus:setAlpha( 0 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0, 0, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 90, 30 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -62, 84 )
	Glow:setTopBottom( 0, 0, -35, 81 )
	Glow:setRGB( 0.88, 1, 0.04 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( 0, 0, 18, 426 )
	btnDisplayText:setTopBottom( 0, 0, 11, 41 )
	btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
	btnDisplayText:setAlpha( 0 )
	btnDisplayText:setZoom( 10 )
	btnDisplayText:setTTF( "fonts/escom.ttf" )
	btnDisplayText:setLetterSpacing( 1 )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayText, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( 0, 0, 18, 426 )
	btnDisplayTextStroke:setTopBottom( 0, 0, 11, 41 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setAlpha( 0.7 )
	btnDisplayTextStroke:setZoom( 10 )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.08, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 1 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, text )
		TrimLabelIfLanguageReversed( self, element )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	local FEHelpItemsLabel0 = CoD.FE_HelpItemsLabel.new( menu, controller )
	FEHelpItemsLabel0:setLeftRight( 1, 1, 0, 30 )
	FEHelpItemsLabel0:setTopBottom( 0.5, 0.5, -15, 15 )
	self:addElement( FEHelpItemsLabel0 )
	self.FEHelpItemsLabel0 = FEHelpItemsLabel0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 0, -30, -18 )
	Arrow:setTopBottom( 0, 0, 18, 30 )
	Arrow:setAlpha( 0 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -43, 73 )
	Glow2:setTopBottom( 0, 0, -37, 87 )
	Glow2:setAlpha( 0 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	self.btnDisplayText:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnDisplayText:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self.btnDisplayTextStroke:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnDisplayTextStroke:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		btnDisplayTextStroke:completeAnimation()
		btnDisplayText:completeAnimation()
		FEButtonFocus:completeAnimation()
		FEButtonIdle:completeAnimation()
		Arrow:completeAnimation()
		Glow:completeAnimation()
		Glow2:completeAnimation()
		FEHelpItemsLabel0:completeAnimation()
		btnDisplayTextStroke:setAlpha( 0.7 )
		btnDisplayTextStroke:setZoom( 10 )
		btnDisplayText:setAlpha( 0 )
		btnDisplayText:setZoom( 10 )
		FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
		FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
		FEButtonFocus:setAlpha( 0 )
		FEButtonFocus:setZoom( 10 )
		FEButtonIdle:setAlpha( 0.8 )
		FEButtonIdle:setZoom( 10 )
		Arrow:setLeftRight( 0, 0, -30, -18 )
		Arrow:setTopBottom( 0, 0, 18, 30 )
		Arrow:setAlpha( 0 )
		Glow:setAlpha( 0 )
		Glow2:setAlpha( 0 )
		FEHelpItemsLabel0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -10, 12 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.clipFinished( Arrow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setZoom( -305 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.clipFinished( btnDisplayTextStroke, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEButtonIdleFrame2 = function ( FEButtonIdle, event )
					if not event.interrupted then
						FEButtonIdle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonIdle:setAlpha( 1 )
					FEButtonIdle:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonIdle, event )
					else
						FEButtonIdle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				FEButtonIdleFrame2( FEButtonIdle, {} )
				local FEButtonFocusFrame2 = function ( FEButtonFocus, event )
					if not event.interrupted then
						FEButtonFocus:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
					FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				GlowFrame2( Glow, {} )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					if not event.interrupted then
						btnDisplayText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayText:setAlpha( 1 )
					btnDisplayText:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( btnDisplayText, event )
					else
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 10 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				local btnDisplayTextStrokeFrame2 = function ( btnDisplayTextStroke, event )
					if not event.interrupted then
						btnDisplayTextStroke:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayTextStroke:setAlpha( 0 )
					btnDisplayTextStroke:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( btnDisplayTextStroke, event )
					else
						btnDisplayTextStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				btnDisplayTextStrokeFrame2( btnDisplayTextStroke, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Arrow:setLeftRight( 0, 0, 4, 16 )
					Arrow:setTopBottom( 0, 0, 18, 30 )
					Arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, -30, -18 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.Arrow:setAlpha( 1 )
				ArrowFrame2( Arrow, {} )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				Glow2Frame2( Glow2, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				local FEButtonIdleFrame2 = function ( FEButtonIdle, event )
					if not event.interrupted then
						FEButtonIdle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonIdle:setAlpha( 0 )
					FEButtonIdle:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonIdle, event )
					else
						FEButtonIdle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				FEButtonIdleFrame2( FEButtonIdle, {} )
				local FEButtonFocusFrame2 = function ( FEButtonFocus, event )
					if not event.interrupted then
						FEButtonFocus:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
					FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
					FEButtonFocus:setAlpha( 1 )
					FEButtonFocus:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0.45 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					if not event.interrupted then
						btnDisplayText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayText:setAlpha( 0 )
					btnDisplayText:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( btnDisplayText, event )
					else
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				local btnDisplayTextStrokeFrame2 = function ( btnDisplayTextStroke, event )
					if not event.interrupted then
						btnDisplayTextStroke:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayTextStroke:setAlpha( 1 )
					btnDisplayTextStroke:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( btnDisplayTextStroke, event )
					else
						btnDisplayTextStroke:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				btnDisplayTextStrokeFrame2( btnDisplayTextStroke, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Arrow:setLeftRight( 0, 0, -30, -18 )
					Arrow:setTopBottom( 0, 0, 18, 30 )
					Arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.Arrow:setAlpha( 0 )
				ArrowFrame2( Arrow, {} )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEButtonIdleFrame2 = function ( FEButtonIdle, event )
					local FEButtonIdleFrame3 = function ( FEButtonIdle, event )
						if not event.interrupted then
							FEButtonIdle:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Bounce )
						end
						FEButtonIdle:setAlpha( 1 )
						FEButtonIdle:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEButtonIdle, event )
						else
							FEButtonIdle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonIdleFrame3( FEButtonIdle, event )
						return 
					else
						FEButtonIdle:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						FEButtonIdle:registerEventHandler( "transition_complete_keyframe", FEButtonIdleFrame3 )
					end
				end
				
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 0 )
				FEButtonIdleFrame2( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -10, 12 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					local btnDisplayTextFrame3 = function ( btnDisplayText, event )
						if not event.interrupted then
							btnDisplayText:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						btnDisplayText:setAlpha( 1 )
						btnDisplayText:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( btnDisplayText, event )
						else
							btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextFrame3( btnDisplayText, event )
						return 
					else
						btnDisplayText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", btnDisplayTextFrame3 )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				local FEHelpItemsLabel0Frame2 = function ( FEHelpItemsLabel0, event )
					if not event.interrupted then
						FEHelpItemsLabel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					FEHelpItemsLabel0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEHelpItemsLabel0, event )
					else
						FEHelpItemsLabel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				FEHelpItemsLabel0Frame2( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.clipFinished( Arrow, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.3 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -10, 12 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.clipFinished( Arrow, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEButtonIdleFrame2 = function ( FEButtonIdle, event )
					local FEButtonIdleFrame3 = function ( FEButtonIdle, event )
						if not event.interrupted then
							FEButtonIdle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						FEButtonIdle:setAlpha( 0.3 )
						FEButtonIdle:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEButtonIdle, event )
						else
							FEButtonIdle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonIdleFrame3( FEButtonIdle, event )
						return 
					else
						FEButtonIdle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						FEButtonIdle:registerEventHandler( "transition_complete_keyframe", FEButtonIdleFrame3 )
					end
				end
				
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 0 )
				FEButtonIdleFrame2( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -10, 12 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					local btnDisplayTextFrame3 = function ( btnDisplayText, event )
						if not event.interrupted then
							btnDisplayText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						btnDisplayText:setAlpha( 0.1 )
						btnDisplayText:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( btnDisplayText, event )
						else
							btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextFrame3( btnDisplayText, event )
						return 
					else
						btnDisplayText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", btnDisplayTextFrame3 )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				local FEHelpItemsLabel0Frame2 = function ( FEHelpItemsLabel0, event )
					if not event.interrupted then
						FEHelpItemsLabel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					FEHelpItemsLabel0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEHelpItemsLabel0, event )
					else
						FEHelpItemsLabel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				FEHelpItemsLabel0Frame2( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.clipFinished( Arrow, {} )
			end
		},
		Fake = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.clipFinished( FEButtonIdle, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.clipFinished( FEButtonIdle, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
			end
		},
		DisabledHelpItemsLabel = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.3 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -10, 12 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.clipFinished( Arrow, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local FEButtonIdleFrame2 = function ( FEButtonIdle, event )
					local FEButtonIdleFrame3 = function ( FEButtonIdle, event )
						if not event.interrupted then
							FEButtonIdle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						FEButtonIdle:setAlpha( 0.3 )
						FEButtonIdle:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEButtonIdle, event )
						else
							FEButtonIdle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonIdleFrame3( FEButtonIdle, event )
						return 
					else
						FEButtonIdle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						FEButtonIdle:registerEventHandler( "transition_complete_keyframe", FEButtonIdleFrame3 )
					end
				end
				
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 0 )
				FEButtonIdleFrame2( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 12 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -10, 12 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					local btnDisplayTextFrame3 = function ( btnDisplayText, event )
						if not event.interrupted then
							btnDisplayText:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						btnDisplayText:setAlpha( 0.1 )
						btnDisplayText:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( btnDisplayText, event )
						else
							btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnDisplayTextFrame3( btnDisplayText, event )
						return 
					else
						btnDisplayText:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", btnDisplayTextFrame3 )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				local FEHelpItemsLabel0Frame2 = function ( FEHelpItemsLabel0, event )
					if not event.interrupted then
						FEHelpItemsLabel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					FEHelpItemsLabel0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEHelpItemsLabel0, event )
					else
						FEHelpItemsLabel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				FEHelpItemsLabel0Frame2( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.clipFinished( Arrow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller ) and not PropertyIsTrue( self, "hideHelpItemLabel" )
			end
		},
		{
			stateName = "Fake",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "fake" )
			end
		},
		{
			stateName = "DisabledHelpItemsLabel",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller ) and PropertyIsTrue( self, "hideHelpItemLabel" )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEHelpItemsLabel0:close()
		self.btnDisplayText:close()
		self.btnDisplayTextStroke:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

