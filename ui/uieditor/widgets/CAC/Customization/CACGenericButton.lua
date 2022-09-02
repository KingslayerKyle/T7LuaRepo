-- 325cecbc794c0e6ca116ed7af164765f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonFocus" )

CoD.CACGenericButton = InheritFrom( LUI.UIElement )
CoD.CACGenericButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CACGenericButton )
	self.id = "CACGenericButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 748 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( false, false, -14, 14 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanelShaderContainer:setAlpha( 0 )
	FEButtonPanelShaderContainer:setZoom( -10 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local FEButtonIdle = CoD.FE_ButtonIdle.new( menu, controller )
	FEButtonIdle:setLeftRight( true, true, 0, 0 )
	FEButtonIdle:setTopBottom( false, false, -14, 14 )
	FEButtonIdle:setAlpha( 0 )
	self:addElement( FEButtonIdle )
	self.FEButtonIdle = FEButtonIdle
	
	local FEButtonFocus = CoD.FE_ButtonFocus.new( menu, controller )
	FEButtonFocus:setLeftRight( true, true, 0, 0 )
	FEButtonFocus:setTopBottom( false, false, -14, 14 )
	FEButtonFocus:setAlpha( 0 )
	FEButtonFocus.Image:setShaderVector( 0, 0.08, 0.45, 0.38, 0.2 )
	FEButtonFocus.Image:setupNineSliceShader( 60, 18 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -2, 2 )
	Glow:setTopBottom( true, true, -15, 15 )
	Glow:setRGB( 0.88, 1, 0.04 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( true, false, 12, 544 )
	btnDisplayText:setTopBottom( true, false, 6.92, 26.92 )
	btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
	btnDisplayText:setAlpha( 0 )
	btnDisplayText:setTTF( "fonts/escom.ttf" )
	btnDisplayText:setLetterSpacing( 1 )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	btnDisplayText:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			btnDisplayText:setText( Engine.Localize( displayText ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( btnDisplayText, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 12, 544 )
	btnDisplayTextStroke:setTopBottom( true, false, 6.92, 26.92 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setAlpha( 0 )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.08, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 1 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	btnDisplayTextStroke:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			btnDisplayTextStroke:setText( Engine.Localize( displayText ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, controller )
		TrimLabelIfLanguageReversed( self, element )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, 3, 11 )
	Arrow:setTopBottom( true, false, 12, 20 )
	Arrow:setAlpha( 0 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -2, 2 )
	Glow2:setTopBottom( true, true, -15, 15 )
	Glow2:setAlpha( 0 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 7, 25 )
	Image:setTopBottom( false, false, -10, 8 )
	Image:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			Image:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -1, 2 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )

				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )

				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 10 )
				self.clipFinished( btnDisplayText, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( btnDisplayTextStroke, {} )

				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )

				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 0 )
					FEButtonPanelShaderContainer:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
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
					FEButtonFocus:setLeftRight( true, true, 0, 0 )
					FEButtonFocus:setTopBottom( false, false, -14, 14 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
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
					Arrow:setLeftRight( true, false, 3, 11 )
					Arrow:setTopBottom( true, false, 12, 20 )
					Arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
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

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )

				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 0 )
					FEButtonPanelShaderContainer:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
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
					FEButtonFocus:setLeftRight( true, true, 0, 0 )
					FEButtonFocus:setTopBottom( false, false, -14, 14 )
					FEButtonFocus:setAlpha( 1 )
					FEButtonFocus:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
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
					Arrow:setLeftRight( true, false, -20, -12 )
					Arrow:setTopBottom( true, false, 12, 20 )
					Arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
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

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		},
		ImageVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -1, 2 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )

				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )

				Image:completeAnimation()
				self.Image:setRGB( 1, 1, 1 )
				self.clipFinished( Image, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 10 )
				self.clipFinished( btnDisplayText, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( btnDisplayTextStroke, {} )

				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )

				Image:completeAnimation()
				self.Image:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( Image, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 10 )
				self.clipFinished( btnDisplayText, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( btnDisplayTextStroke, {} )

				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Image:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setRGB( 0.87, 1, 0.04 )
				ImageFrame2( Image, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )

				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Image:setRGB( 0.87, 1, 0.04 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setRGB( 1, 1, 1 )
				ImageFrame2( Image, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.4 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.75 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -1, 2 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )

				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )

				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 1 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )

				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )

				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )

				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )

				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
				self.FEButtonFocus:setAlpha( 0.25 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )

				Glow:completeAnimation()
				self.Glow:setLeftRight( true, true, -2, 2 )
				self.Glow:setTopBottom( true, true, -15, 15 )
				self.Glow:setAlpha( 0.1 )
				self.clipFinished( Glow, {} )

				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 10 )
				self.clipFinished( btnDisplayText, {} )

				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( btnDisplayTextStroke, {} )

				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.25 )
				self.clipFinished( Glow2, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 9 )

				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 0 )
					FEButtonPanelShaderContainer:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local FEButtonIdleFrame2 = function ( FEButtonIdle, event )
					if not event.interrupted then
						FEButtonIdle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonIdle:setAlpha( 0 )
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
					FEButtonFocus:setLeftRight( true, true, 0, 0 )
					FEButtonFocus:setTopBottom( false, false, -14, 14 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
				self.FEButtonFocus:setAlpha( 0.25 )
				self.FEButtonFocus:setZoom( 10 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Glow:setLeftRight( true, true, -2, 2 )
					Glow:setTopBottom( true, true, -15, 15 )
					Glow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, true, -2, 2 )
				self.Glow:setTopBottom( true, true, -15, 15 )
				self.Glow:setAlpha( 0.1 )
				GlowFrame2( Glow, {} )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					if not event.interrupted then
						btnDisplayText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
					btnDisplayText:setAlpha( 0.5 )
					btnDisplayText:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( btnDisplayText, event )
					else
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
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
					Arrow:setLeftRight( true, false, 3, 11 )
					Arrow:setTopBottom( true, false, 12, 20 )
					Arrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
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
				self.Glow2:setAlpha( 0.25 )
				Glow2Frame2( Glow2, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 9 )

				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 0 )
					FEButtonPanelShaderContainer:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
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
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 0 )
				FEButtonIdleFrame2( FEButtonIdle, {} )
				local FEButtonFocusFrame2 = function ( FEButtonFocus, event )
					if not event.interrupted then
						FEButtonFocus:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonFocus:setLeftRight( true, true, 0, 0 )
					FEButtonFocus:setTopBottom( false, false, -14, 14 )
					FEButtonFocus:setAlpha( 0.25 )
					FEButtonFocus:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, 0, 0 )
				self.FEButtonFocus:setTopBottom( false, false, -14, 14 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Glow:setLeftRight( true, true, -2, 2 )
					Glow:setTopBottom( true, true, -15, 15 )
					Glow:setAlpha( 0.1 )
					if event.interrupted then
						self.clipFinished( Glow, event )
					else
						Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow:completeAnimation()
				self.Glow:setLeftRight( true, true, -2, 2 )
				self.Glow:setTopBottom( true, true, -15, 15 )
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					if not event.interrupted then
						btnDisplayText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
					btnDisplayText:setAlpha( 0 )
					btnDisplayText:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( btnDisplayText, event )
					else
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
				self.btnDisplayText:setAlpha( 0.5 )
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
					Arrow:setLeftRight( true, false, -20, -12 )
					Arrow:setTopBottom( true, false, 12, 20 )
					Arrow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Arrow, event )
					else
						Arrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				ArrowFrame2( Arrow, {} )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 0.25 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "ImageVisible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNil( element, controller, "image" )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "image", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "image"
		} )
	end )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer:close()
		element.FEButtonIdle:close()
		element.FEButtonFocus:close()
		element.btnDisplayText:close()
		element.btnDisplayTextStroke:close()
		element.Image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

