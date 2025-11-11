require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_HelpItemsLabel" )

CoD.CPMissionSelect_ListProgressionButton = InheritFrom( LUI.UIElement )
CoD.CPMissionSelect_ListProgressionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPMissionSelect_ListProgressionButton )
	self.id = "CPMissionSelect_ListProgressionButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 351 )
	self:setTopBottom( 0, 0, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( 0.5, 0.5, -21, 21 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	FEButtonPanelShaderContainer:setAlpha( 0 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local FEButtonIdle = LUI.UIImage.new()
	FEButtonIdle:setLeftRight( 0, 1, -3, 3 )
	FEButtonIdle:setTopBottom( 0.5, 0.5, -24, 24 )
	FEButtonIdle:setAlpha( 0 )
	FEButtonIdle:setZoom( 10 )
	FEButtonIdle:setImage( RegisterImage( "uie_t7_menu_frontend_buttonidlefull" ) )
	FEButtonIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonIdle:setShaderVector( 0, 0, 0, 0, 0 )
	FEButtonIdle:setupNineSliceShader( 12, 12 )
	self:addElement( FEButtonIdle )
	self.FEButtonIdle = FEButtonIdle
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
	FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0, 0, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 75, 30 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, 68, 159 )
	Glow:setTopBottom( 0, 0, -173, 221 )
	Glow:setRGB( 0.88, 1, 0.04 )
	Glow:setAlpha( 0.45 )
	Glow:setZRot( 90 )
	Glow:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( 0, 0, 18, 345 )
	btnDisplayText:setTopBottom( 0, 0, 10, 40 )
	btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
	btnDisplayText:setAlpha( 0 )
	btnDisplayText:setZoom( 10 )
	btnDisplayText:setTTF( "fonts/escom.ttf" )
	btnDisplayText:setLetterSpacing( 1 )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	btnDisplayText:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnDisplayText:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayText, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( 0, 0, 18, 345 )
	btnDisplayTextStroke:setTopBottom( 0, 0, 10, 40 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setZoom( 10 )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.08, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 1, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 1 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	btnDisplayTextStroke:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( btnDisplayTextStroke, "setText", function ( element, text )
		TrimLabelIfLanguageReversed( self, element )
	end )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	local FEHelpItemsLabel0 = CoD.FE_HelpItemsLabel.new( menu, controller )
	FEHelpItemsLabel0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller ) and AlwaysFalse()
			end
		}
	} )
	FEHelpItemsLabel0:linkToElementModel( FEHelpItemsLabel0, "disabled", true, function ( model )
		menu:updateElementState( FEHelpItemsLabel0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	FEHelpItemsLabel0:setLeftRight( 1, 1, 0, 30 )
	FEHelpItemsLabel0:setTopBottom( 0.5, 0.5, -15, 15 )
	self:addElement( FEHelpItemsLabel0 )
	self.FEHelpItemsLabel0 = FEHelpItemsLabel0
	
	local Arrow = LUI.UIImage.new()
	Arrow:setLeftRight( 0, 0, -30, -18 )
	Arrow:setTopBottom( 0, 0, 18, 30 )
	Arrow:setZoom( 10 )
	Arrow:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusarrow" ) )
	Arrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Arrow )
	self.Arrow = Arrow
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -72, 104 )
	Glow2:setTopBottom( 0, 0, -37, 87 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local MissionCompleteIcom = LUI.UIImage.new()
	MissionCompleteIcom:setLeftRight( 0, 0, -72, -24 )
	MissionCompleteIcom:setTopBottom( 0, 0, -2, 46 )
	MissionCompleteIcom:setRGB( 0, 0.73, 0 )
	MissionCompleteIcom:setImage( RegisterImage( "uie_t7_menu_cp_missionprogression_complete" ) )
	self:addElement( MissionCompleteIcom )
	self.MissionCompleteIcom = MissionCompleteIcom
	
	local CurrentMissionIcon = LUI.UIImage.new()
	CurrentMissionIcon:setLeftRight( 0, 0, -72, -24 )
	CurrentMissionIcon:setTopBottom( 0, 0, -2, 46 )
	CurrentMissionIcon:setRGB( 0.2, 0.46, 0.62 )
	CurrentMissionIcon:setImage( RegisterImage( "uie_t7_menu_cp_missionprogression_current" ) )
	self:addElement( CurrentMissionIcon )
	self.CurrentMissionIcon = CurrentMissionIcon
	
	local NotCompleteIcon = LUI.UIImage.new()
	NotCompleteIcon:setLeftRight( 0, 0, -72, -24 )
	NotCompleteIcon:setTopBottom( 0, 0, -2, 46 )
	NotCompleteIcon:setRGB( 0.62, 0.45, 0.05 )
	NotCompleteIcon:setImage( RegisterImage( "uie_t7_menu_cp_missionprogression_notcomplete" ) )
	self:addElement( NotCompleteIcon )
	self.NotCompleteIcon = NotCompleteIcon
	
	local OutOfOrderIcon = LUI.UIImage.new()
	OutOfOrderIcon:setLeftRight( 0, 0, -72, -24 )
	OutOfOrderIcon:setTopBottom( 0, 0, -2, 46 )
	OutOfOrderIcon:setRGB( 0.58, 0.58, 0.58 )
	OutOfOrderIcon:setImage( RegisterImage( "uie_t7_menu_cp_missionprogression_outoforder" ) )
	self:addElement( OutOfOrderIcon )
	self.OutOfOrderIcon = OutOfOrderIcon
	
	self.resetProperties = function ()
		btnDisplayTextStroke:completeAnimation()
		btnDisplayText:completeAnimation()
		FEButtonFocus:completeAnimation()
		FEButtonIdle:completeAnimation()
		FEButtonPanelShaderContainer:completeAnimation()
		Glow:completeAnimation()
		Arrow:completeAnimation()
		Glow2:completeAnimation()
		MissionCompleteIcom:completeAnimation()
		CurrentMissionIcon:completeAnimation()
		NotCompleteIcon:completeAnimation()
		OutOfOrderIcon:completeAnimation()
		btnDisplayTextStroke:setAlpha( 1 )
		btnDisplayTextStroke:setZoom( 10 )
		btnDisplayText:setAlpha( 0 )
		btnDisplayText:setZoom( 10 )
		FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
		FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
		FEButtonFocus:setAlpha( 1 )
		FEButtonFocus:setZoom( 10 )
		FEButtonIdle:setAlpha( 0 )
		FEButtonIdle:setZoom( 10 )
		FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
		FEButtonPanelShaderContainer:setAlpha( 0 )
		FEButtonPanelShaderContainer:setZoom( 0 )
		Glow:setAlpha( 0.45 )
		Arrow:setLeftRight( 0, 0, -30, -18 )
		Arrow:setTopBottom( 0, 0, 18, 30 )
		Arrow:setAlpha( 1 )
		Glow2:setAlpha( 1 )
		MissionCompleteIcom:setAlpha( 1 )
		CurrentMissionIcon:setAlpha( 1 )
		NotCompleteIcon:setAlpha( 1 )
		OutOfOrderIcon:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -1, 3 )
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
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						FEButtonIdle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
					local FEButtonFocusFrame3 = function ( FEButtonFocus, event )
						if not event.interrupted then
							FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEButtonFocus, event )
						else
							FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonFocusFrame3( FEButtonFocus, event )
						return 
					else
						FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 5 )
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", FEButtonFocusFrame3 )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
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
						btnDisplayText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						btnDisplayTextStroke:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Arrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Glow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
				self:setupElementClipCounter( 8 )
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
					FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -1, 3 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.5 )
				self.btnDisplayText:setZoom( 0 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				Arrow:completeAnimation()
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0.4 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 0 )
				self.clipFinished( FEButtonFocus, {} )
				Glow:completeAnimation()
				self.Glow:setAlpha( 0 )
				self.clipFinished( Glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.6 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.clipFinished( btnDisplayTextStroke, {} )
				Arrow:completeAnimation()
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						FEButtonIdle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
				self.FEButtonIdle:setAlpha( 0.4 )
				self.FEButtonIdle:setZoom( 10 )
				FEButtonIdleFrame2( FEButtonIdle, {} )
				local FEButtonFocusFrame2 = function ( FEButtonFocus, event )
					if not event.interrupted then
						FEButtonFocus:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
					FEButtonFocus:setTopBottom( 0.5, 0.5, -1, 3 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 10 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					Glow:setAlpha( 0 )
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
						btnDisplayText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					btnDisplayText:setAlpha( 0.5 )
					btnDisplayText:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( btnDisplayText, event )
					else
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.6 )
				self.btnDisplayText:setZoom( 10 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				local btnDisplayTextStrokeFrame2 = function ( btnDisplayTextStroke, event )
					if not event.interrupted then
						btnDisplayTextStroke:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
				self.btnDisplayTextStroke:setAlpha( 0 )
				self.btnDisplayTextStroke:setZoom( 10 )
				btnDisplayTextStrokeFrame2( btnDisplayTextStroke, {} )
				local ArrowFrame2 = function ( Arrow, event )
					if not event.interrupted then
						Arrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
				self.Arrow:setAlpha( 0 )
				ArrowFrame2( Arrow, {} )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 0 )
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
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
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
					FEButtonIdle:setAlpha( 0.4 )
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
					FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
					FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
					FEButtonFocus:setAlpha( 0 )
					FEButtonFocus:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( FEButtonFocus, event )
					else
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -30, 30 )
				self.FEButtonFocus:setAlpha( 0 )
				self.FEButtonFocus:setZoom( 0 )
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
				self.Glow:setAlpha( 0 )
				GlowFrame2( Glow, {} )
				local btnDisplayTextFrame2 = function ( btnDisplayText, event )
					if not event.interrupted then
						btnDisplayText:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayText:setAlpha( 0.6 )
					btnDisplayText:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( btnDisplayText, event )
					else
						btnDisplayText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.5 )
				self.btnDisplayText:setZoom( 0 )
				btnDisplayTextFrame2( btnDisplayText, {} )
				local btnDisplayTextStrokeFrame2 = function ( btnDisplayTextStroke, event )
					if not event.interrupted then
						btnDisplayTextStroke:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					btnDisplayTextStroke:setAlpha( 0 )
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
					Arrow:setAlpha( 0 )
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
					Glow2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )
			end
		},
		MissionOutOfOrder = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -1, 3 )
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
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						FEButtonIdle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
					local FEButtonFocusFrame3 = function ( FEButtonFocus, event )
						if not event.interrupted then
							FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEButtonFocus, event )
						else
							FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonFocusFrame3( FEButtonFocus, event )
						return 
					else
						FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 5 )
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", FEButtonFocusFrame3 )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
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
						btnDisplayText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						btnDisplayTextStroke:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Arrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Glow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
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
					FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
			end
		},
		MissionCompleted = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -1, 3 )
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
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						FEButtonIdle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
					local FEButtonFocusFrame3 = function ( FEButtonFocus, event )
						if not event.interrupted then
							FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEButtonFocus, event )
						else
							FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonFocusFrame3( FEButtonFocus, event )
						return 
					else
						FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 5 )
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", FEButtonFocusFrame3 )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
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
						btnDisplayText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						btnDisplayTextStroke:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Arrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Glow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
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
					FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end
		},
		MissionCurrent = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -1, 3 )
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
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						FEButtonIdle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
					local FEButtonFocusFrame3 = function ( FEButtonFocus, event )
						if not event.interrupted then
							FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEButtonFocus, event )
						else
							FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonFocusFrame3( FEButtonFocus, event )
						return 
					else
						FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 5 )
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", FEButtonFocusFrame3 )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
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
						btnDisplayText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						btnDisplayTextStroke:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Arrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Glow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
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
					FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				NotCompleteIcon:completeAnimation()
				self.NotCompleteIcon:setAlpha( 0 )
				self.clipFinished( NotCompleteIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end
		},
		MissionNotComplete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setZoom( -10 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
				self.FEButtonFocus:setTopBottom( 0.5, 0.5, -1, 3 )
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
				self.Arrow:setLeftRight( 0, 0, 4, 16 )
				self.Arrow:setTopBottom( 0, 0, 18, 30 )
				self.Arrow:setAlpha( 0 )
				self.clipFinished( Arrow, {} )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local FEButtonPanelShaderContainerFrame2 = function ( FEButtonPanelShaderContainer, event )
					if not event.interrupted then
						FEButtonPanelShaderContainer:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						FEButtonIdle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
					local FEButtonFocusFrame3 = function ( FEButtonFocus, event )
						if not event.interrupted then
							FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( FEButtonFocus, event )
						else
							FEButtonFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEButtonFocusFrame3( FEButtonFocus, event )
						return 
					else
						FEButtonFocus:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						FEButtonFocus:setAlpha( 0 )
						FEButtonFocus:setZoom( 5 )
						FEButtonFocus:registerEventHandler( "transition_complete_keyframe", FEButtonFocusFrame3 )
					end
				end
				
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				FEButtonFocusFrame2( FEButtonFocus, {} )
				local GlowFrame2 = function ( Glow, event )
					if not event.interrupted then
						Glow:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
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
						btnDisplayText:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						btnDisplayTextStroke:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Arrow:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
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
						Glow2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
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
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
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
					FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				self.FEButtonFocus:setLeftRight( 0, 1, -12, 18 )
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
				MissionCompleteIcom:completeAnimation()
				self.MissionCompleteIcom:setAlpha( 0 )
				self.clipFinished( MissionCompleteIcom, {} )
				CurrentMissionIcon:completeAnimation()
				self.CurrentMissionIcon:setAlpha( 0 )
				self.clipFinished( CurrentMissionIcon, {} )
				OutOfOrderIcon:completeAnimation()
				self.OutOfOrderIcon:setAlpha( 0 )
				self.clipFinished( OutOfOrderIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "classified" )
			end
		},
		{
			stateName = "MissionOutOfOrder",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "completedOutOfOrder" )
			end
		},
		{
			stateName = "MissionCompleted",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "completed" )
			end
		},
		{
			stateName = "MissionCurrent",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isCurrentMap" )
			end
		},
		{
			stateName = "MissionNotComplete",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "classified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "classified"
		} )
	end )
	self:linkToElementModel( self, "completedOutOfOrder", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completedOutOfOrder"
		} )
	end )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	self:linkToElementModel( self, "isCurrentMap", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isCurrentMap"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanelShaderContainer:close()
		self.FEHelpItemsLabel0:close()
		self.btnDisplayText:close()
		self.btnDisplayTextStroke:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

