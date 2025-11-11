require( "ui.uieditor.widgets.FaceButtonWithKeyMouse" )

CoD.FaceButtonThatHidesWithLabel = InheritFrom( LUI.UIElement )
CoD.FaceButtonThatHidesWithLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FaceButtonThatHidesWithLabel )
	self.id = "FaceButtonThatHidesWithLabel"
	self.soundSet = "Special_widgets"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local ButtonLabel = LUI.UITightText.new()
	ButtonLabel:setLeftRight( 0, 0, 36, 300 )
	ButtonLabel:setTopBottom( 0, 0, 0, 30 )
	ButtonLabel:setText( Engine.Localize( "MENU_NEW" ) )
	ButtonLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonLabel:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( ButtonLabel, "setText", function ( element, text )
		UpdateSelfState( self, controller )
	end )
	self:addElement( ButtonLabel )
	self.ButtonLabel = ButtonLabel
	
	local ButtonImage = CoD.FaceButtonWithKeyMouse.new( menu, controller )
	ButtonImage:setLeftRight( 0, 0, 0, 30 )
	ButtonImage:setTopBottom( 0, 0, 0, 30 )
	ButtonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ButtonImage )
	self.ButtonImage = ButtonImage
	
	self.resetProperties = function ()
		ButtonImage:completeAnimation()
		ButtonLabel:completeAnimation()
		ButtonImage:setAlpha( 1 )
		ButtonLabel:setLeftRight( 0, 0, 36, 300 )
		ButtonLabel:setTopBottom( 0, 0, 0, 30 )
		ButtonLabel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		HideButtonAndText = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ButtonLabel:completeAnimation()
				self.ButtonLabel:setAlpha( 0 )
				self.clipFinished( ButtonLabel, {} )
				ButtonImage:completeAnimation()
				self.ButtonImage:setAlpha( 0 )
				self.clipFinished( ButtonImage, {} )
			end
		},
		HideButton = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ButtonLabel:completeAnimation()
				self.ButtonLabel:setLeftRight( 0, 0, 7.5, 300.5 )
				self.ButtonLabel:setTopBottom( 0, 0, 0, 30 )
				self.clipFinished( ButtonLabel, {} )
				ButtonImage:completeAnimation()
				self.ButtonImage:setAlpha( 0 )
				self.clipFinished( ButtonImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideButtonAndText",
			condition = function ( menu, element, event )
				return not ElementHasText( self, "ButtonLabel" )
			end
		},
		{
			stateName = "HideButton",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsGamepad( controller ) then
					f9_local0 = IsPC()
				else
					f9_local0 = false
				end
				return f9_local0
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

