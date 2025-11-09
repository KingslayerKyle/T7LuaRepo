require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonFocus" )

CoD.FE_ListButtonA = InheritFrom( LUI.UIElement )
CoD.FE_ListButtonA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ListButtonA )
	self.id = "FE_ListButtonA"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( false, false, -14, 14 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local FEButtonIdle = CoD.FE_ButtonIdle.new( menu, controller )
	FEButtonIdle:setLeftRight( true, true, 0, 0 )
	FEButtonIdle:setTopBottom( false, false, -14, 14 )
	FEButtonIdle:setRGB( 1, 1, 1 )
	self:addElement( FEButtonIdle )
	self.FEButtonIdle = FEButtonIdle
	
	local FEButtonFocus = CoD.FE_ButtonFocus.new( menu, controller )
	FEButtonFocus:setLeftRight( true, true, 0, 0 )
	FEButtonFocus:setTopBottom( false, false, -14, 14 )
	FEButtonFocus:setRGB( 1, 1, 1 )
	FEButtonFocus:setAlpha( 0 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( true, false, 6, 278 )
	btnDisplayText:setTopBottom( true, false, 6.92, 26.92 )
	btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
	btnDisplayText:setTTF( "fonts/Entovo.ttf" )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( true, false, 6, 278 )
	btnDisplayTextStroke:setTopBottom( true, false, 6.92, 26.92 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setAlpha( 0 )
	btnDisplayTextStroke:setTTF( "fonts/Entovo.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	btnDisplayTextStroke:setShaderVector( 0, 0.04, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 1, 0.75, 0, 0, 0 )
	btnDisplayTextStroke:setShaderVector( 2, 2.46, 0, 0, 0 )
	btnDisplayTextStroke:setLetterSpacing( 0.6 )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayTextStroke:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( btnDisplayTextStroke )
	self.btnDisplayTextStroke = btnDisplayTextStroke
	
	self.btnDisplayText:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnDisplayText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.btnDisplayTextStroke:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnDisplayTextStroke:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setZoom( 0 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 1 )
				self.FEButtonIdle:setZoom( 0 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 0 )
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
			end,
			GainFocusOLD = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				FEButtonPanelShaderContainer:completeAnimation()
				self.FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
				self.FEButtonPanelShaderContainer:setZoom( 5 )
				self.clipFinished( FEButtonPanelShaderContainer, {} )
				FEButtonIdle:completeAnimation()
				self.FEButtonIdle:setAlpha( 0 )
				self.FEButtonIdle:setZoom( 10 )
				self.clipFinished( FEButtonIdle, {} )
				FEButtonFocus:completeAnimation()
				self.FEButtonFocus:setAlpha( 1 )
				self.FEButtonFocus:setZoom( 10 )
				self.clipFinished( FEButtonFocus, {} )
				btnDisplayText:completeAnimation()
				self.btnDisplayText:setAlpha( 0 )
				self.btnDisplayText:setZoom( 10 )
				self.clipFinished( btnDisplayText, {} )
				btnDisplayTextStroke:completeAnimation()
				self.btnDisplayTextStroke:setAlpha( 1 )
				self.btnDisplayTextStroke:setZoom( 10 )
				self.clipFinished( btnDisplayTextStroke, {} )
			end,
			LoseFocusOLD = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.FEButtonPanelShaderContainer:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.FEButtonPanelShaderContainer:close()
		self.FEButtonIdle:close()
		self.FEButtonFocus:close()
		self.btnDisplayText:close()
		self.btnDisplayTextStroke:close()
		CoD.FE_ListButtonA.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

