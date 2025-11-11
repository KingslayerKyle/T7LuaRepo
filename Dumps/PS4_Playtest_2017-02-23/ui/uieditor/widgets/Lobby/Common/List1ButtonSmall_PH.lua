require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonFocus" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonIdle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

CoD.List1ButtonSmall_PH = InheritFrom( LUI.UIElement )
CoD.List1ButtonSmall_PH.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.List1ButtonSmall_PH )
	self.id = "List1ButtonSmall_PH"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanelShaderContainer:setTopBottom( 0.5, 0.5, -21, 21 )
	FEButtonPanelShaderContainer:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( FEButtonPanelShaderContainer )
	self.FEButtonPanelShaderContainer = FEButtonPanelShaderContainer
	
	local FEButtonIdle = CoD.FE_ButtonIdle.new( menu, controller )
	FEButtonIdle:setLeftRight( 0, 1, 0, 0 )
	FEButtonIdle:setTopBottom( 0.5, 0.5, -21, 21 )
	self:addElement( FEButtonIdle )
	self.FEButtonIdle = FEButtonIdle
	
	local FEButtonFocus = CoD.FE_ButtonFocus.new( menu, controller )
	FEButtonFocus:setLeftRight( 0, 1, 0, 0 )
	FEButtonFocus:setTopBottom( 0.5, 0.5, -21, 21 )
	FEButtonFocus:setAlpha( 0 )
	FEButtonFocus.Image:setShaderVector( 0, 0.12, 0.3, 0.38, 0.2 )
	FEButtonFocus.Image:setupNineSliceShader( 18, 18 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local btnDisplayText = LUI.UIText.new()
	btnDisplayText:setLeftRight( 0, 0, 18, 426 )
	btnDisplayText:setTopBottom( 0, 0, 10, 40 )
	btnDisplayText:setRGB( 0.79, 0.79, 0.79 )
	btnDisplayText:setTTF( "fonts/escom.ttf" )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( btnDisplayText )
	self.btnDisplayText = btnDisplayText
	
	local btnDisplayTextStroke = LUI.UIText.new()
	btnDisplayTextStroke:setLeftRight( 0, 0, 18, 426 )
	btnDisplayTextStroke:setTopBottom( 0, 0, 10, 40 )
	btnDisplayTextStroke:setRGB( 0, 0, 0 )
	btnDisplayTextStroke:setAlpha( 0 )
	btnDisplayTextStroke:setTTF( "fonts/escom.ttf" )
	btnDisplayTextStroke:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
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
	self.resetProperties = function ()
		FEButtonPanelShaderContainer:completeAnimation()
		FEButtonIdle:completeAnimation()
		btnDisplayText:completeAnimation()
		btnDisplayTextStroke:completeAnimation()
		FEButtonFocus:completeAnimation()
		FEButtonPanelShaderContainer:setZoom( 0 )
		FEButtonIdle:setAlpha( 1 )
		FEButtonIdle:setZoom( 0 )
		btnDisplayText:setAlpha( 1 )
		btnDisplayText:setZoom( 0 )
		btnDisplayTextStroke:setAlpha( 0 )
		btnDisplayTextStroke:setZoom( 0 )
		FEButtonFocus:setAlpha( 0 )
		FEButtonFocus:setZoom( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocusOLD = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				FEButtonPanelShaderContainer:completeAnimation()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanelShaderContainer:close()
		self.FEButtonIdle:close()
		self.FEButtonFocus:close()
		self.btnDisplayText:close()
		self.btnDisplayTextStroke:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

