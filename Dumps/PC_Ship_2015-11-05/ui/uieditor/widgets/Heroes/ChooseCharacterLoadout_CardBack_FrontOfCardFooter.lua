require( "ui.uieditor.widgets.PC.ChooseCharacter.ChooseCharacter_CardClickButton" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
	f1_arg0.clickableButton.m_button = Enum.LUIButton.LUI_KEY_XBX_PSSQUARE
	f1_arg0.clickableButton.keyshortcut:setText( Engine.Localize( "[^3C^7]" ) )
end

local PostLoadFunc = function ( self, controller, menu )
	self.text:setText( self.text:getText() )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter )
	self.id = "ChooseCharacterLoadout_CardBack_FrontOfCardFooter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 74 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local BlackBox0 = LUI.UIImage.new()
	BlackBox0:setLeftRight( true, true, -24, 0 )
	BlackBox0:setTopBottom( false, true, 1.38, 7.13 )
	BlackBox0:setRGB( 0.52, 0.52, 0.52 )
	BlackBox0:setAlpha( 0.25 )
	self:addElement( BlackBox0 )
	self.BlackBox0 = BlackBox0
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, -24, 0 )
	BlackBox:setTopBottom( false, false, -13, 14 )
	BlackBox:setRGB( 0.52, 0.52, 0.52 )
	BlackBox:setAlpha( 0.25 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local text = LUI.UITightText.new()
	text:setLeftRight( false, false, -37, 37 )
	text:setTopBottom( false, false, -9.5, 10.5 )
	text:setText( Engine.Localize( "MENU_FRONT_OF_CARD" ) )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 5 )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 5, 70 )
	end )
	self:addElement( text )
	self.text = text
	
	local Button2 = LUI.UIImage.new()
	Button2:setLeftRight( true, false, -24, -2 )
	Button2:setTopBottom( false, false, -11, 11 )
	Button2:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			Button2:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( Button2 )
	self.Button2 = Button2
	
	local clickableButton = CoD.ChooseCharacter_CardClickButton.new( menu, controller )
	clickableButton:setLeftRight( true, false, -19, 73 )
	clickableButton:setTopBottom( true, false, 5, 30 )
	clickableButton:setAlpha( 0 )
	clickableButton.label:setText( Engine.Localize( "MENU_FRONT_OF_CARD" ) )
	clickableButton.keyshortcut:setText( Engine.Localize( "" ) )
	self:addElement( clickableButton )
	self.clickableButton = clickableButton
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -9, 7 )
	Image0:setTopBottom( true, true, 6.25, -5.25 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokemr" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local frameImage = LUI.UIImage.new()
	frameImage:setLeftRight( true, true, -61.3, 9.5 )
	frameImage:setTopBottom( false, false, -27.83, 33.33 )
	frameImage:setAlpha( 0.8 )
	frameImage:setImage( RegisterImage( "uie_t7_specialist_footer_btn_frame_back" ) )
	frameImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	frameImage:setShaderVector( 0, 0.46, 0.49, 0, 0 )
	frameImage:setupNineSliceShader( 67, 30 )
	self:addElement( frameImage )
	self.frameImage = frameImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
				Button2:completeAnimation()
				self.Button2:setAlpha( 1 )
				self.clipFinished( Button2, {} )
				clickableButton:completeAnimation()
				self.clickableButton:setAlpha( 0 )
				self.clipFinished( clickableButton, {} )
			end
		},
		DefaultState_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				Button2:completeAnimation()
				self.Button2:setAlpha( 0 )
				self.clipFinished( Button2, {} )
				clickableButton:completeAnimation()
				self.clickableButton:setAlpha( 1 )
				self.clipFinished( clickableButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultState_PC",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f3_local8 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f3_local8( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.clickableButton:close()
		element.Button2:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

