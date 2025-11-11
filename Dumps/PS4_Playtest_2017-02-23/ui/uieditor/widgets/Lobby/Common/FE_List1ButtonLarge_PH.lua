require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonWarning" )
require( "ui.uieditor.widgets.Lobby.Common.FE_HelpItemsLabel" )

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
	self:setLeftRight( 0, 0, 0, 316 )
	self:setTopBottom( 0, 0, 0, 70 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local btnIdle = LUI.UIImage.new()
	btnIdle:setLeftRight( 0, 0, 0, 324 )
	btnIdle:setTopBottom( 0, 0, -2, 70 )
	btnIdle:setImage( RegisterImage( "uie_menu_button_flyout_start_btn" ) )
	self:addElement( btnIdle )
	self.btnIdle = btnIdle
	
	local btnHover = LUI.UIImage.new()
	btnHover:setLeftRight( 0, 0, 0, 324 )
	btnHover:setTopBottom( 0, 0, -2, 70 )
	btnHover:setAlpha( 0 )
	btnHover:setImage( RegisterImage( "uie_menu_button_flyout_start_btn_hover" ) )
	self:addElement( btnHover )
	self.btnHover = btnHover
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( 0, 0, -20, 334 )
	glow:setTopBottom( 0, 0, -14, 81 )
	glow:setImage( RegisterImage( "uie_menu_button_flyout_start_btn_hover_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( 0, 0, 18, 426 )
	btnDisplayText:setTopBottom( 0, 0, 20, 50 )
	btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
	btnDisplayText:setTTF( "fonts/escom.ttf" )
	btnDisplayText:setLetterSpacing( 1 )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	local FEHelpItemsLabel0 = CoD.FE_HelpItemsLabel.new( menu, controller )
	FEHelpItemsLabel0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "isBreadcrumbNew" )
			end
		}
	} )
	FEHelpItemsLabel0:setLeftRight( 1, 1, 0, 30 )
	FEHelpItemsLabel0:setTopBottom( 0.5, 0.5, -5, 25 )
	FEHelpItemsLabel0:setAlpha( 0 )
	FEHelpItemsLabel0:setScale( 0.7 )
	self:addElement( FEHelpItemsLabel0 )
	self.FEHelpItemsLabel0 = FEHelpItemsLabel0
	
	local FEButtonWarning = CoD.FE_ButtonWarning.new( menu, controller )
	FEButtonWarning:setLeftRight( 0, 0, -42.5, 2.5 )
	FEButtonWarning:setTopBottom( 0.5, 0.5, -26, 22 )
	FEButtonWarning:linkToElementModel( self, nil, false, function ( model )
		FEButtonWarning:setModel( model, controller )
	end )
	self:addElement( FEButtonWarning )
	self.FEButtonWarning = FEButtonWarning
	
	self.btnDisplayText:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnDisplayText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.resetProperties = function ()
		btnDisplayText:completeAnimation()
		glow:completeAnimation()
		btnHover:completeAnimation()
		btnIdle:completeAnimation()
		FEButtonWarning:completeAnimation()
		FEHelpItemsLabel0:completeAnimation()
		btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
		btnDisplayText:setAlpha( 1 )
		btnDisplayText:setZoom( 0 )
		glow:setLeftRight( 0, 0, -20, 334 )
		glow:setTopBottom( 0, 0, -14, 81 )
		glow:setAlpha( 1 )
		glow:setXRot( 0 )
		btnHover:setAlpha( 0 )
		btnIdle:setRGB( 1, 1, 1 )
		btnIdle:setAlpha( 1 )
		FEButtonWarning:setLeftRight( 0, 0, -42.5, 2.5 )
		FEButtonWarning:setTopBottom( 0.5, 0.5, -26, 22 )
		FEHelpItemsLabel0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 1, 1, 1 )
				self.clipFinished( btnDisplayText, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				btnIdle:completeAnimation()
				self.btnIdle:setAlpha( 0 )
				self.clipFinished( btnIdle, {} )
				btnHover:completeAnimation()
				self.btnHover:setAlpha( 1 )
				self.clipFinished( btnHover, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( 0, 0, -29, 341 )
				self.glow:setTopBottom( 0, 0, -22, 92 )
				self.glow:setXRot( 180 )
				self.clipFinished( glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 1, 1, 1 )
				self.clipFinished( btnDisplayText, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 1, 1, 1 )
				self.clipFinished( btnDisplayText, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				btnIdle:completeAnimation()
				self.btnIdle:setAlpha( 0 )
				self.clipFinished( btnIdle, {} )
				btnHover:completeAnimation()
				self.btnHover:setAlpha( 1 )
				self.clipFinished( btnHover, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( 0, 0, -29, 341 )
				self.glow:setTopBottom( 0, 0, -22, 92 )
				self.glow:setXRot( 180 )
				self.clipFinished( glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 1, 1, 1 )
				self.clipFinished( btnDisplayText, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 1, 1, 1 )
				self.clipFinished( btnDisplayText, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				btnIdle:completeAnimation()
				self.btnIdle:setRGB( 0.4, 0.4, 0.4 )
				self.clipFinished( btnIdle, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0.1 )
				self.clipFinished( btnDisplayText, {} )
				FEButtonWarning:completeAnimation()
				self.FEButtonWarning:setLeftRight( 0, 0, -42.5, 2.5 )
				self.FEButtonWarning:setTopBottom( 0.5, 0.5, -14, 34 )
				self.clipFinished( FEButtonWarning, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.clipFinished( btnDisplayText, {} )
			end
		},
		Fake = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				btnIdle:completeAnimation()
				self.btnIdle:setAlpha( 0 )
				self.clipFinished( btnIdle, {} )
				glow:completeAnimation()
				self.glow:setAlpha( 0 )
				self.clipFinished( glow, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.clipFinished( btnDisplayText, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoListFocus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 1, 1, 1 )
				self.btnDisplayText:setAlpha( 0.71 )
				self.clipFinished( btnDisplayText, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		New = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 1 )
				self.clipFinished( FEHelpItemsLabel0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( -305 )
				self.clipFinished( btnDisplayText, {} )
				FEHelpItemsLabel0:completeAnimation()
				self.FEHelpItemsLabel0:setAlpha( 1 )
				self.clipFinished( FEHelpItemsLabel0, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
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
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
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
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
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
			stateName = "New",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "isBreadcrumbNew" )
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
	FEButtonWarning.id = "FEButtonWarning"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.FEButtonWarning:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEHelpItemsLabel0:close()
		self.FEButtonWarning:close()
		self.btnDisplayText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

