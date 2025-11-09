require( "ui.uieditor.widgets.BlackMarket.FE_BlackMarketSpecialBreadcrumb" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainerHighQuality" )
require( "ui.uieditor.widgets.Lobby.Common.FE_HelpItemsLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonWarning" )
require( "ui.uieditor.widgets.BubbleGumBuffs.FE_VialBreadcrumb" )

CoD.FE_List1ButtonLarge_PH = InheritFrom( LUI.UIElement )
CoD.FE_List1ButtonLarge_PH.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_List1ButtonLarge_PH )
	self.id = "FE_List1ButtonLarge_PH"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEBlackMarketSpecialBreadcrumb = CoD.FE_BlackMarketSpecialBreadcrumb.new( menu, controller )
	FEBlackMarketSpecialBreadcrumb:setLeftRight( false, true, -18.5, 64.5 )
	FEBlackMarketSpecialBreadcrumb:setTopBottom( false, false, -36.25, 28.25 )
	FEBlackMarketSpecialBreadcrumb:setScale( 0.6 )
	self:addElement( FEBlackMarketSpecialBreadcrumb )
	self.FEBlackMarketSpecialBreadcrumb = FEBlackMarketSpecialBreadcrumb
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainerHighQuality.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( false, false, -14, 14 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local BlackOverlay = LUI.UIImage.new()
	BlackOverlay:setLeftRight( true, true, 0, 0 )
	BlackOverlay:setTopBottom( false, false, -14.2, 14.2 )
	BlackOverlay:setRGB( 0, 0, 0 )
	BlackOverlay:setAlpha( 0.4 )
	BlackOverlay:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	BlackOverlay:setShaderVector( 0, 0.01, 0.03, 0.01, 0.03 )
	self:addElement( BlackOverlay )
	self.BlackOverlay = BlackOverlay
	
	local FEButtonIdle = LUI.UIImage.new()
	FEButtonIdle:setLeftRight( true, true, -1, 1 )
	FEButtonIdle:setTopBottom( false, false, -16, 16 )
	FEButtonIdle:setAlpha( 0.8 )
	FEButtonIdle:setZoom( 10 )
	FEButtonIdle:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlefull" ) )
	FEButtonIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonIdle:setShaderVector( 0, 0.03, 0.25, 0, 0 )
	FEButtonIdle:setupNineSliceShader( 8, 8 )
	self:addElement( FEButtonIdle )
	self.FEButtonIdle = FEButtonIdle
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( true, true, -8, 8 )
	FEButtonFocus:setTopBottom( false, false, -20, 20 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0.2, 0.5, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 60, 20 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -40.5, 56.5 )
	Glow:setTopBottom( true, true, -25.29, 22.12 )
	Glow:setRGB( 0.88, 1, 0.04 )
	Glow:setAlpha( 0.45 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( true, false, 12, 284 )
	btnDisplayText:setTopBottom( true, false, 6.92, 26.92 )
	btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
	btnDisplayText:setAlpha( 0 )
	btnDisplayText:setZoom( 10 )
	btnDisplayText:setTTF( "fonts/escom.ttf" )
	btnDisplayText:setLetterSpacing( 1 )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayText, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 12, 284 )
	btnDisplayTextStroke:setTopBottom( true, false, 6.92, 26.92 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setAlpha( 0.7 )
	btnDisplayTextStroke:setZoom( 10 )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.08, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 1 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, controller )
		TrimLabelIfLanguageReversed( self, element )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	local FEHelpItemsLabel0 = CoD.FE_HelpItemsLabel.new( menu, controller )
	FEHelpItemsLabel0:setLeftRight( false, true, 0, 20 )
	FEHelpItemsLabel0:setTopBottom( false, false, -10, 10 )
	FEHelpItemsLabel0:setAlpha( 0 )
	FEHelpItemsLabel0:setScale( 0.7 )
	FEHelpItemsLabel0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "isBreadcrumbNew" )
			end
		}
	} )
	self:addElement( FEHelpItemsLabel0 )
	self.FEHelpItemsLabel0 = FEHelpItemsLabel0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( true, false, -20, -12 )
	Arrow:setTopBottom( true, false, 12, 20 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -29, 49 )
	Glow2:setTopBottom( true, false, -15.29, 46.12 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local UpgradeImage = LUI.UIImage.new()
	UpgradeImage:setLeftRight( false, true, 0, 24 )
	UpgradeImage:setTopBottom( false, false, -12, 12 )
	UpgradeImage:setAlpha( 0 )
	UpgradeImage:setImage( RegisterImage( "uie_purchase_icon_pc" ) )
	self:addElement( UpgradeImage )
	self.UpgradeImage = UpgradeImage
	
	local RestrictedImage = LUI.UIImage.new()
	RestrictedImage:setLeftRight( false, true, 0, 24 )
	RestrictedImage:setTopBottom( false, false, -12, 12 )
	RestrictedImage:setAlpha( 0 )
	RestrictedImage:setImage( RegisterImage( "uie_error_icon_pc" ) )
	self:addElement( RestrictedImage )
	self.RestrictedImage = RestrictedImage
	
	local DownloadingImage = LUI.UIImage.new()
	DownloadingImage:setLeftRight( false, true, 0, 24 )
	DownloadingImage:setTopBottom( false, false, -12, 12 )
	DownloadingImage:setAlpha( 0 )
	DownloadingImage:setImage( RegisterImage( "uie_install_icon_pc" ) )
	self:addElement( DownloadingImage )
	self.DownloadingImage = DownloadingImage
	
	local FEButtonWarning = CoD.FE_ButtonWarning.new( menu, controller )
	FEButtonWarning:setLeftRight( true, false, -28, 2 )
	FEButtonWarning:setTopBottom( false, false, -16, 16 )
	FEButtonWarning:linkToElementModel( self, nil, false, function ( model )
		FEButtonWarning:setModel( model, controller )
	end )
	self:addElement( FEButtonWarning )
	self.FEButtonWarning = FEButtonWarning
	
	local FEVialBreadcrumb = CoD.FE_VialBreadcrumb.new( menu, controller )
	FEVialBreadcrumb:setLeftRight( false, true, 4, 27 )
	FEVialBreadcrumb:setTopBottom( false, false, -11.5, 11.5 )
	FEVialBreadcrumb:setAlpha( 0 )
	self:addElement( FEVialBreadcrumb )
	self.FEVialBreadcrumb = FEVialBreadcrumb
	
	self.btnDisplayText:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			btnDisplayText:setText( Engine.Localize( displayText ) )
		end
	end )
	self.btnDisplayTextStroke:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			btnDisplayTextStroke:setText( Engine.Localize( displayText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
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
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 1 )
					FEButtonPanelShaderContainer:setZoom( -10 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					if not event.interrupted then
						BlackOverlay:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackOverlay:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BlackOverlay, event )
					else
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
					FEButtonFocus:setLeftRight( true, true, -8, 8 )
					FEButtonFocus:setTopBottom( false, false, -20, 20 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
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
						Arrow:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
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
				UpgradeImage:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 0.8 )
					FEButtonPanelShaderContainer:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					if not event.interrupted then
						BlackOverlay:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackOverlay:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BlackOverlay, event )
					else
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
					FEButtonFocus:setLeftRight( true, true, -8, 8 )
					FEButtonFocus:setTopBottom( false, false, -20, 20 )
					FEButtonFocus:setAlpha( 1 )
					FEButtonFocus:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
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
				UpgradeImage:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 13 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 1 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						BlackOverlay:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.5 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.25 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.3 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 0.5 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
						end
						BlackOverlay:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.25 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.15 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 0.25 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		},
		Purchase = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.5 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.25 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.3 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 1 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 0.5 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
						end
						BlackOverlay:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				local UpgradeImageFrame2 = function ( UpgradeImage, event )
					if not event.interrupted then
						UpgradeImage:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
					end
					UpgradeImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( UpgradeImage, event )
					else
						UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				UpgradeImageFrame2( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.25 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.15 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 0.25 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 1 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		},
		Downloading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.5 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.25 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.3 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 1 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 0.5 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
						end
						BlackOverlay:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				local DownloadingImageFrame2 = function ( DownloadingImage, event )
					if not event.interrupted then
						DownloadingImage:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
					end
					DownloadingImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DownloadingImage, event )
					else
						DownloadingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				DownloadingImageFrame2( DownloadingImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.25 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.15 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 0.25 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				DownloadingImage:setAlpha( 1 )
				DownloadingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.5 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.25 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.3 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 13 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 0.5 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
						end
						BlackOverlay:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 12 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.25 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.15 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 0.25 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		},
		Restricted = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.5 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.25 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.3 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
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
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 1 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 0.5 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
						end
						BlackOverlay:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				local RestrictedImageFrame2 = function ( RestrictedImage, event )
					local RestrictedImageFrame3 = function ( RestrictedImage, event )
						local RestrictedImageFrame4 = function ( RestrictedImage, event )
							if not event.interrupted then
								RestrictedImage:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							end
							RestrictedImage:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( RestrictedImage, event )
							else
								RestrictedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RestrictedImageFrame4( RestrictedImage, event )
							return 
						else
							RestrictedImage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							RestrictedImage:registerEventHandler( "transition_complete_keyframe", RestrictedImageFrame4 )
						end
					end
					
					if event.interrupted then
						RestrictedImageFrame3( RestrictedImage, event )
						return 
					else
						RestrictedImage:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						RestrictedImage:setAlpha( 1 )
						RestrictedImage:registerEventHandler( "transition_complete_keyframe", RestrictedImageFrame3 )
					end
				end
				
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				RestrictedImageFrame2( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 11 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.25 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.15 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 0.25 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
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
				RestrictedImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				RestrictedImage:setAlpha( 1 )
				RestrictedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		},
		Fake = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		},
		NoListFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.1 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.3 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.71 )
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
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0.25 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.15 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 0.25 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.1 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
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
			end
		},
		HaveNewBlackMarketPromo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 1 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
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
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 14 )
				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 1 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 12 )
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
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					if not event.interrupted then
						BlackOverlay:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackOverlay:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BlackOverlay, event )
					else
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
					FEButtonFocus:setLeftRight( true, true, -8, 8 )
					FEButtonFocus:setTopBottom( false, false, -20, 20 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
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
				UpgradeImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 1 )
					FEButtonPanelShaderContainer:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					if not event.interrupted then
						BlackOverlay:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackOverlay:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BlackOverlay, event )
					else
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
					FEButtonFocus:setLeftRight( true, true, -8, 8 )
					FEButtonFocus:setTopBottom( false, false, -20, 20 )
					FEButtonFocus:setAlpha( 1 )
					FEButtonFocus:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
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
				UpgradeImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 14 )
				local FEBlackMarketSpecialBreadcrumbFrame2 = function ( FEBlackMarketSpecialBreadcrumb, event )
					if not event.interrupted then
						FEBlackMarketSpecialBreadcrumb:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEBlackMarketSpecialBreadcrumb:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEBlackMarketSpecialBreadcrumb, event )
					else
						FEBlackMarketSpecialBreadcrumb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 0 )
				FEBlackMarketSpecialBreadcrumbFrame2( FEBlackMarketSpecialBreadcrumb, {} )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 1 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						BlackOverlay:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
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
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 1 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 1 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 12 )
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
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					if not event.interrupted then
						BlackOverlay:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackOverlay:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BlackOverlay, event )
					else
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
					FEButtonFocus:setLeftRight( true, true, -8, 8 )
					FEButtonFocus:setTopBottom( false, false, -20, 20 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
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
				UpgradeImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 1 )
					FEButtonPanelShaderContainer:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					if not event.interrupted then
						BlackOverlay:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackOverlay:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BlackOverlay, event )
					else
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
					FEButtonFocus:setLeftRight( true, true, -8, 8 )
					FEButtonFocus:setTopBottom( false, false, -20, 20 )
					FEButtonFocus:setAlpha( 1 )
					FEButtonFocus:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
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
				UpgradeImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 13 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 1 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						BlackOverlay:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		},
		HaveVials = {
			DefaultClip = function ()
				self:setupElementClipCounter( 15 )
				FEBlackMarketSpecialBreadcrumb:completeAnimation()
				self.FEBlackMarketSpecialBreadcrumb:setAlpha( 0 )
				self.clipFinished( FEBlackMarketSpecialBreadcrumb, {} )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
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
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 0 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
				FEVialBreadcrumb:completeAnimation()
				self.FEVialBreadcrumb:setAlpha( 1 )
				self.clipFinished( FEVialBreadcrumb, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 13 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				self.clipFinished( BlackOverlay, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0.45 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( btnDisplayTextStroke, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 1 )
				self.clipFinished( FEHelpItemsLabel0, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( true, false, -20, -12 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 1 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 12 )
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
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					if not event.interrupted then
						BlackOverlay:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackOverlay:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BlackOverlay, event )
					else
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
					FEButtonFocus:setLeftRight( true, true, -8, 8 )
					FEButtonFocus:setTopBottom( false, false, -20, 20 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
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
				UpgradeImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 12 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
					FEButtonPanelShaderContainer:setAlpha( 1 )
					FEButtonPanelShaderContainer:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonPanelShaderContainer, event )
					else
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 1 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					if not event.interrupted then
						BlackOverlay:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BlackOverlay:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BlackOverlay, event )
					else
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0.4 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
					FEButtonFocus:setLeftRight( true, true, -8, 8 )
					FEButtonFocus:setTopBottom( false, false, -20, 20 )
					FEButtonFocus:setAlpha( 1 )
					FEButtonFocus:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -20, 20 )
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
				UpgradeImage:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
				UpgradeImage:setAlpha( 0 )
				UpgradeImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 13 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					local FEButtonPanelShaderContainerFrame3 = function ( FEButtonPanelShaderContainer, event )
						if not event.interrupted then
							FEButtonPanelShaderContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
						FEButtonPanelShaderContainer:setAlpha( 1 )
						FEButtonPanelShaderContainer:setZoom( -10 )
						if event.interrupted then
							self.clipFinished( FEButtonPanelShaderContainer, event )
						else
							FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonPanelShaderContainerFrame3( FEButtonPanelShaderContainer, event )
						return 
					else
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						FEButtonPanelShaderContainer:registerEventHandler( "transition_complete_keyframe", FEButtonPanelShaderContainerFrame3 )
					end
				end
				
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setAlpha( 0 )
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				FEButtonPanelShaderContainerFrame2( FEButtonPanelShaderContainer, {} )
				local BlackOverlayFrame2 = function ( BlackOverlay, event )
					local BlackOverlayFrame3 = function ( BlackOverlay, event )
						if not event.interrupted then
							BlackOverlay:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						BlackOverlay:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( BlackOverlay, event )
						else
							BlackOverlay:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackOverlayFrame3( BlackOverlay, event )
						return 
					else
						BlackOverlay:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						BlackOverlay:registerEventHandler( "transition_complete_keyframe", BlackOverlayFrame3 )
					end
				end
				
				BlackOverlay:completeAnimation()
				self.BlackOverlay:setAlpha( 0 )
				BlackOverlayFrame2( BlackOverlay, {} )
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
				self.FEButtonFocus:setLeftRight( true, true, -8, 8 )
				self.FEButtonFocus:setTopBottom( false, false, -7, 8 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
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
				self.Arrow:setLeftRight( true, false, 3, 11 )
				self.Arrow:setTopBottom( true, false, 12, 20 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
				RestrictedImage:completeAnimation()
				self.RestrictedImage:setAlpha( 0 )
				self.clipFinished( RestrictedImage, {} )
				DownloadingImage:completeAnimation()
				self.DownloadingImage:setAlpha( 0 )
				self.clipFinished( DownloadingImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return IsStarterPackNotAvailableButton( element, controller )
			end
		},
		{
			stateName = "Purchase",
			condition = function ( menu, element, event )
				local f202_local0 = IsStarterPack( controller )
				if f202_local0 then
					f202_local0 = IsStarterPackRestrictedButton( element, controller )
					if f202_local0 then
						f202_local0 = AlwaysFalse()
					end
				end
				return f202_local0
			end
		},
		{
			stateName = "Downloading",
			condition = function ( menu, element, event )
				return IsChunkDownloading( element, controller )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "Restricted",
			condition = function ( menu, element, event )
				return IsRestrictedButtonByParty( element, controller )
			end
		},
		{
			stateName = "Fake",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "fake" )
			end
		},
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "Lobby" ) and IsFlyoutMenuOpen( element, controller )
			end
		},
		{
			stateName = "HaveNewBlackMarketPromo",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "customId", "btnBlackMarket" ) and not HasPlayerSeenLatestBlackMarketPromotion( controller )
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "isBreadcrumbNew" )
			end
		},
		{
			stateName = "HaveVials",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "customId", "btnMegaChewFactory" ) and IsModelValueGreaterThan( controller, "MegaChewTokens.remainingTokens", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.privateClient.update"
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GameSettingsFlyoutOpen"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "BonusModesFlyoutOpen" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "BonusModesFlyoutOpen"
		} )
	end )
	self:linkToElementModel( self, "customId", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "customId"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "MegaChewTokens.remainingTokens" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MegaChewTokens.remainingTokens"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEBlackMarketSpecialBreadcrumb:close()
		element.FEButtonPanelShaderContainer:close()
		element.FEHelpItemsLabel0:close()
		element.FEButtonWarning:close()
		element.FEVialBreadcrumb:close()
		element.btnDisplayText:close()
		element.btnDisplayTextStroke:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

